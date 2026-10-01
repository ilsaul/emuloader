unit uHangWatchdog;

// Delphi 13 port diagnostics (Win64 only; empty unit in Delphi 7 builds).
// A background thread checks every second that the main thread still processes messages.
// If it stops responding for about 10 seconds, the call stacks of all threads are written to
// "hang_trace.log" next to the exe. Addresses are resolved to unit/procedure/line using
// "EmuLoader.map" (Project Options > Linking > Map file = Detailed).

interface

implementation

{$IF Defined(CPUX64)}
uses
  Winapi.Windows, Winapi.Messages, Winapi.TlHelp32, System.SysUtils, System.Classes,
  System.Generics.Collections, System.Generics.Defaults;

const
  MaxFrames = 48;
  CheckIntervalMs = 1000;
  HangChecksBeforeDump = 5; // ~10 seconds without response (each check waits up to 2 s)
  ChecksBetweenDumps = 15;   // repeat dump every ~30 seconds while still hung
  MaxDumpsPerHang = 3;

type
  TFrames = record
    Count: Integer;
    Addr: array[0..MaxFrames-1] of UInt64;
  end;

  TMapSym = record
    Rva: Cardinal;
    Name: string;
  end;

  TMapLine = record
    Rva: Cardinal;
    Line: Integer;
    FileIdx: Integer;
  end;

  TWatchdogThread = class(TThread)
  protected
    procedure Execute; override;
  end;

const
  WD_THREAD_SUSPEND_RESUME = $0002;
  WD_THREAD_GET_CONTEXT = $0008;
  WD_THREAD_QUERY_INFORMATION = $0040;
  WD_GET_MODULE_HANDLE_EX_FLAG_UNCHANGED_REFCOUNT = $00000002;
  WD_GET_MODULE_HANDLE_EX_FLAG_FROM_ADDRESS = $00000004;

function WD_OpenThread(dwDesiredAccess: DWORD; bInheritHandle: BOOL; dwThreadId: DWORD): THandle; stdcall; external kernel32 name 'OpenThread';
function WD_GetModuleHandleEx(dwFlags: DWORD; lpModuleName: Pointer; var phModule: HMODULE): BOOL; stdcall; external kernel32 name 'GetModuleHandleExW';
function RtlLookupFunctionEntry(ControlPc: UInt64; var ImageBase: UInt64; HistoryTable: Pointer): Pointer; stdcall; external kernel32;
function RtlVirtualUnwind(HandlerType: DWORD; ImageBase, ControlPc: UInt64; FunctionEntry: Pointer;
  var ContextRecord: TContext; var HandlerData: Pointer; var EstablisherFrame: UInt64; ContextPointers: Pointer): Pointer; stdcall; external kernel32;

var
  PingWnd: HWND;
  Watchdog: TWatchdogThread;
  MapLoaded: Boolean;
  MapSyms: TArray<TMapSym>;
  MapLines: TArray<TMapLine>;
  MapFiles: TStringList;
  TextRva: Cardinal;

procedure WriteLog(const S: string);
var
  F: TextFile;
  FileName: string;
begin
  FileName:= ExtractFilePath(ParamStr(0))+'hang_trace.log';
  try
    AssignFile(F, FileName);
    if FileExists(FileName) then
       Append(F)
    else
       Rewrite(F);
    try
      Writeln(F, S);
    finally
      CloseFile(F);
    end;
  except
  end;
end;

function FindTextSectionRva: Cardinal;
var
  Nt: PImageNtHeaders;
  Sec: PImageSectionHeader;
  I: Integer;
begin
  Result:= $1000;
  Nt:= PImageNtHeaders(PByte(HInstance)+PImageDosHeader(HInstance)._lfanew);
  Sec:= PImageSectionHeader(PByte(@Nt.OptionalHeader)+Nt.FileHeader.SizeOfOptionalHeader);
  for I:= 0 to Nt.FileHeader.NumberOfSections-1 do
  begin
    if CompareMem(@Sec.Name[0], PAnsiChar('.text'), 5) then
       Exit(Sec.VirtualAddress);
    Inc(Sec);
  end;
end;

procedure LoadMap;
var
  Map: TStringList;
  I, P, Mode, FileIdx, Ln: Integer;
  S, Tok, LineNo: string;
  Parts: TArray<string>;
  Syms: TList<TMapSym>;
  Lines: TList<TMapLine>;
  Sym: TMapSym;
  ML: TMapLine;
  J: Integer;
  Off: Int64;
begin
  MapLoaded:= True;
  TextRva:= FindTextSectionRva;
  MapFiles:= TStringList.Create;
  S:= ChangeFileExt(ParamStr(0), '.map');
  if not FileExists(S) then
     begin
       WriteLog('  (map file not found: '+S+'; enable Project Options > Linking > Map file = Detailed)');
       Exit;
     end;
  Map:= TStringList.Create;
  Syms:= TList<TMapSym>.Create;
  Lines:= TList<TMapLine>.Create;
  try
    Map.LoadFromFile(S);
    Mode:= 0;
    FileIdx:= -1;
    for I:= 0 to Map.Count-1 do
    begin
      S:= Map[I];
      if Pos('Publics by Value', S) > 0 then
         begin
           Mode:= 1;
           Continue;
         end;
      if S.StartsWith('Line numbers for ') then
         begin
           Mode:= 0;
           if Pos('segment .text', S) > 0 then
              begin
                P:= Pos('(', S);
                Tok:= Copy(S, P+1, Pos(')', S)-P-1);
                FileIdx:= MapFiles.Add(ExtractFileName(Tok));
                Mode:= 2;
              end;
           Continue;
         end;
      if S.StartsWith('Bound resource files') or S.StartsWith('Program entry point') or S.StartsWith('Address Publics by Name') then
         begin
           Mode:= 0;
           Continue;
         end;
      S:= Trim(S);
      if S = '' then
         Continue;
      case Mode of
        1:
          if S.StartsWith('0001:') then
             begin
               P:= Pos(' ', S);
               if P > 0 then
                  begin
                    if TryStrToInt64('$'+Copy(S, 6, P-6), Off) then
                       begin
                         Sym.Rva:= Cardinal(Off);
                         Sym.Name:= Trim(Copy(S, P+1, MaxInt));
                         Syms.Add(Sym);
                       end;
                  end;
             end;
        2:
          begin
            Parts:= S.Split([' '], TStringSplitOptions.ExcludeEmpty);
            J:= 0;
            while J+1 < Length(Parts) do
            begin
              LineNo:= Parts[J];
              Tok:= Parts[J+1];
              if Tok.StartsWith('0001:') and TryStrToInt(LineNo, Ln) and TryStrToInt64('$'+Copy(Tok, 6, MaxInt), Off) then
                 begin
                   ML.Rva:= Cardinal(Off);
                   ML.Line:= Ln;
                   ML.FileIdx:= FileIdx;
                   Lines.Add(ML);
                 end;
              Inc(J, 2);
            end;
          end;
      end;
    end;
    Syms.Sort(TComparer<TMapSym>.Construct(
      function(const A, B: TMapSym): Integer
      begin
        if A.Rva < B.Rva then Result:= -1 else if A.Rva > B.Rva then Result:= 1 else Result:= 0;
      end));
    Lines.Sort(TComparer<TMapLine>.Construct(
      function(const A, B: TMapLine): Integer
      begin
        if A.Rva < B.Rva then Result:= -1 else if A.Rva > B.Rva then Result:= 1 else Result:= 0;
      end));
    MapSyms:= Syms.ToArray;
    MapLines:= Lines.ToArray;
  finally
    Lines.Free;
    Syms.Free;
    Map.Free;
  end;
end;

function FindSym(Off: Cardinal): Integer;
var
  L, H, M: Integer;
begin
  Result:= -1;
  L:= 0;
  H:= High(MapSyms);
  while L <= H do
  begin
    M:= (L+H) div 2;
    if MapSyms[M].Rva <= Off then
       begin
         Result:= M;
         L:= M+1;
       end
    else
       H:= M-1;
  end;
end;

function FindLine(Off: Cardinal): Integer;
var
  L, H, M: Integer;
begin
  Result:= -1;
  L:= 0;
  H:= High(MapLines);
  while L <= H do
  begin
    M:= (L+H) div 2;
    if MapLines[M].Rva <= Off then
       begin
         Result:= M;
         L:= M+1;
       end
    else
       H:= M-1;
  end;
end;

function DescribeAddress(Addr: UInt64): string;
var
  Module: HMODULE;
  Name: array[0..MAX_PATH] of Char;
  Off: Cardinal;
  Idx: Integer;
begin
  Result:= '$'+IntToHex(Addr, 16);
  Module:= 0;
  if not WD_GetModuleHandleEx(WD_GET_MODULE_HANDLE_EX_FLAG_FROM_ADDRESS or WD_GET_MODULE_HANDLE_EX_FLAG_UNCHANGED_REFCOUNT, Pointer(NativeUInt(Addr)), Module) then
     Exit;
  if Module <> HInstance then
     begin
       GetModuleFileName(Module, Name, MAX_PATH);
       Result:= Result+'  '+ExtractFileName(Name)+' + $'+IntToHex(Addr-UInt64(Module), 1);
       Exit;
     end;
  if not MapLoaded then
     LoadMap;
  Off:= Cardinal(Addr-UInt64(HInstance))-TextRva;
  Idx:= FindSym(Off);
  if Idx >= 0 then
     Result:= Result+'  '+MapSyms[Idx].Name+' + $'+IntToHex(Off-MapSyms[Idx].Rva, 1);
  Idx:= FindLine(Off);
  if Idx >= 0 then
     Result:= Result+'  ('+MapFiles[MapLines[Idx].FileIdx]+':'+IntToStr(MapLines[Idx].Line)+')';
end;

// No memory allocation here: the target thread is suspended and may hold the memory manager lock
procedure CaptureThreadStack(ThreadHandle: THandle; var Frames: TFrames);
var
  Buf: array[0..SizeOf(TContext)+15] of Byte;
  Ctx: PContext;
  ImageBase, Establisher: UInt64;
  Fn, HandlerData: Pointer;
begin
  Frames.Count:= 0;
  Ctx:= PContext((NativeUInt(@Buf[0])+15) and not NativeUInt(15));
  FillChar(Ctx^, SizeOf(TContext), 0);
  Ctx^.ContextFlags:= CONTEXT_FULL;
  if not GetThreadContext(ThreadHandle, Ctx^) then
     Exit;
  try
    while (Frames.Count < MaxFrames) and (Ctx^.Rip <> 0) do
    begin
      Frames.Addr[Frames.Count]:= Ctx^.Rip;
      Inc(Frames.Count);
      ImageBase:= 0;
      Fn:= RtlLookupFunctionEntry(Ctx^.Rip, ImageBase, nil);
      if Fn = nil then
         begin
           // leaf function: return address is on top of the stack
           Ctx^.Rip:= PUInt64(Ctx^.Rsp)^;
           Ctx^.Rsp:= Ctx^.Rsp+8;
         end
      else
         begin
           HandlerData:= nil;
           Establisher:= 0;
           RtlVirtualUnwind(0, ImageBase, Ctx^.Rip, Fn, Ctx^, HandlerData, Establisher, nil);
         end;
    end;
  except
    // stop walking on a corrupted stack
  end;
end;

procedure DumpAllThreads(HangSeconds: Integer);
var
  Snap, TH: THandle;
  TE: TThreadEntry32;
  Frames: TFrames;
  I: Integer;
  Ids: TList<Cardinal>;
  Id: Cardinal;
  Title: string;
begin
  WriteLog('');
  WriteLog('==== '+FormatDateTime('hh:nn:ss.zzz', Now)+'  main thread not responding for ~'+IntToStr(HangSeconds)+' s ====');
  Ids:= TList<Cardinal>.Create;
  try
    Snap:= CreateToolhelp32Snapshot(TH32CS_SNAPTHREAD, 0);
    if Snap = INVALID_HANDLE_VALUE then
       Exit;
    try
      TE.dwSize:= SizeOf(TE);
      if Thread32First(Snap, TE) then
         repeat
           if (TE.th32OwnerProcessID = GetCurrentProcessId) and (TE.th32ThreadID <> GetCurrentThreadId) then
              Ids.Add(TE.th32ThreadID);
           TE.dwSize:= SizeOf(TE);
         until not Thread32Next(Snap, TE);
    finally
      CloseHandle(Snap);
    end;
    // main thread first
    if Ids.Remove(MainThreadID) >= 0 then
       Ids.Insert(0, MainThreadID);

    for Id in Ids do
    begin
      TH:= WD_OpenThread(WD_THREAD_SUSPEND_RESUME or WD_THREAD_GET_CONTEXT or WD_THREAD_QUERY_INFORMATION, False, Id);
      if TH = 0 then
         Continue;
      try
        if SuspendThread(TH) = DWORD(-1) then
           Continue;
        try
          CaptureThreadStack(TH, Frames);
        finally
          ResumeThread(TH);
        end;
      finally
        CloseHandle(TH);
      end;
      if Id = MainThreadID then
         Title:= 'MAIN THREAD'
      else
         Title:= 'thread';
      WriteLog('-- '+Title+' '+IntToStr(Id)+' --');
      for I:= 0 to Frames.Count-1 do
          WriteLog('  '+DescribeAddress(Frames.Addr[I]));
    end;
  finally
    Ids.Free;
  end;
end;

procedure TWatchdogThread.Execute;
var
  Res: DWORD_PTR;
  Failed, Dumps: Integer;
begin
  NameThreadForDebugging('EmuLoader hang watchdog');
  Failed:= 0;
  Dumps:= 0;
  while not Terminated do
  begin
    Sleep(CheckIntervalMs);
    if Terminated then
       Break;
    if SendMessageTimeout(PingWnd, WM_NULL, 0, 0, SMTO_BLOCK, CheckIntervalMs, @Res) <> 0 then
       begin
         if Dumps > 0 then
            WriteLog('==== '+FormatDateTime('hh:nn:ss.zzz', Now)+'  main thread responding again ====');
         Failed:= 0;
         Dumps:= 0;
         Continue;
       end;
    Inc(Failed);
    if (Dumps < MaxDumpsPerHang) and
       ((Failed = HangChecksBeforeDump) or ((Failed > HangChecksBeforeDump) and ((Failed-HangChecksBeforeDump) mod ChecksBetweenDumps = 0))) then
       begin
         Inc(Dumps);
         try
           DumpAllThreads(Failed*2);
         except
           on E: Exception do
              WriteLog('  watchdog error: '+E.Message);
         end;
       end;
  end;
end;

function PingWndProc(Wnd: HWND; Msg: UINT; WParam: WPARAM; LParam: LPARAM): LRESULT; stdcall;
begin
  Result:= DefWindowProc(Wnd, Msg, WParam, LParam);
end;

procedure StartWatchdog;
var
  WC: TWndClass;
begin
  FillChar(WC, SizeOf(WC), 0);
  WC.lpfnWndProc:= @PingWndProc;
  WC.hInstance:= HInstance;
  WC.lpszClassName:= 'EmuLoaderHangWatchdogPing';
  Winapi.Windows.RegisterClass(WC);
  PingWnd:= CreateWindowEx(0, WC.lpszClassName, nil, 0, 0, 0, 0, 0, HWND_MESSAGE, 0, HInstance, nil);
  if PingWnd = 0 then
     Exit;
  System.SysUtils.DeleteFile(ExtractFilePath(ParamStr(0))+'hang_trace.log');
  Watchdog:= TWatchdogThread.Create(False);
end;

procedure StopWatchdog;
begin
  if Assigned(Watchdog) then
     begin
       Watchdog.Terminate;
       Watchdog.WaitFor;
       FreeAndNil(Watchdog);
     end;
  if PingWnd <> 0 then
     DestroyWindow(PingWnd);
  FreeAndNil(MapFiles);
end;

initialization
  StartWatchdog;

finalization
  StopWatchdog;
{$IFEND}

end.
