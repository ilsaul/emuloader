unit uDiagnosticLog;

interface

uses SysUtils;

procedure InitializeDiagnosticLog(const Version: String);
procedure SetDiagnosticLogPreference(Enabled: Boolean);
function DiagnosticLogPreference: Boolean;
function DiagnosticLogEnabled: Boolean;
procedure DiagnosticLog(const Category, Msg: String);
procedure DiagnosticLogException(const Context: String; E: Exception; Address: Pointer);
procedure TraceTaskbarIcons;

implementation

uses Windows, Messages, Classes, Forms, Controls, IniFiles, SyncObjs, ShellAPI,
  ActiveX, Winapi.PropSys, Winapi.PropKey;

const
  TaskbarPreventPinningKey: TPropertyKey = (
    fmtid: '{9F4C2855-9F79-4B39-A8D0-E1D42DE1D5F3}'; pid: 9);

function ReadProcessAppUserModelID(out AppID: PWideChar): HRESULT; stdcall;
  external 'shell32.dll' name 'GetCurrentProcessExplicitAppUserModelID';

procedure TraceTaskbarShellProperties(const Name: String; Wnd: HWND);
var
  Store: IPropertyStore;
  HR: HRESULT;

  procedure TraceProperty(const PropertyName: String; const Key: TPropertyKey);
  var
    Value: TPropVariant;
    Text: array[0..2047] of WideChar;
    ResultCode: HRESULT;
  begin
    FillChar(Value, SizeOf(Value), 0);
    try
      ResultCode:= Store.GetValue(Key, Value);
      if Failed(ResultCode) then
         begin
           DiagnosticLog('taskbar', Name+' '+PropertyName+' GetValue HRESULT=$'+
             IntToHex(ResultCode, 8));
           Exit;
         end;
      if Value.vt = VT_EMPTY then
         begin
           DiagnosticLog('taskbar', Name+' '+PropertyName+'=<not set>');
           Exit;
         end;
      ResultCode:= PropVariantToString(Value, Text, Length(Text));
      if Failed(ResultCode) then
         DiagnosticLog('taskbar', Name+' '+PropertyName+' vt='+IntToStr(Value.vt)+
           '; conversion HRESULT=$'+IntToHex(ResultCode, 8))
      else
         DiagnosticLog('taskbar', Name+' '+PropertyName+'=['+String(Text)+']');
    finally
      PropVariantClear(Value);
    end;
  end;

begin
  HR:= SHGetPropertyStoreForWindow(Wnd, IPropertyStore, Pointer(Store));
  DiagnosticLog('taskbar', Name+' shell property store HRESULT=$'+IntToHex(HR, 8));
  if Failed(HR) then
     Exit;
  TraceProperty('AppUserModel.ID', PKEY_AppUserModel_ID);
  TraceProperty('AppUserModel.RelaunchIconResource', PKEY_AppUserModel_RelaunchIconResource);
  TraceProperty('AppUserModel.RelaunchCommand', PKEY_AppUserModel_RelaunchCommand);
  TraceProperty('AppUserModel.RelaunchDisplayNameResource', PKEY_AppUserModel_RelaunchDisplayNameResource);
  TraceProperty('AppUserModel.PreventPinning', TaskbarPreventPinningKey);
end;

procedure TraceTaskbarIcons;

  procedure TraceIcon(const Name: String; IconHandle: HICON);
  var
    Info: TIconInfo;
    Bitmap: Windows.TBitmap;
  begin
    DiagnosticLog('taskbar', Name+' handle=$'+IntToHex(NativeUInt(IconHandle), SizeOf(Pointer)*2));
    if IconHandle = 0 then
       Exit;
    if not GetIconInfo(IconHandle, Info) then
       begin
         DiagnosticLog('taskbar', Name+' GetIconInfo failed: '+SysErrorMessage(GetLastError));
         Exit;
       end;
    try
      if (Info.hbmColor <> 0) and
         (GetObject(Info.hbmColor, SizeOf(Bitmap), @Bitmap) <> 0) then
         DiagnosticLog('taskbar', Name+' color='+IntToStr(Bitmap.bmWidth)+'x'+
           IntToStr(Bitmap.bmHeight)+'/'+IntToStr(Bitmap.bmBitsPixel)+'bpp');
    finally
      if Info.hbmColor <> 0 then
         DeleteObject(Info.hbmColor);
      if Info.hbmMask <> 0 then
         DeleteObject(Info.hbmMask);
    end;
  end;

  procedure TraceWindow(const Name: String; Wnd: HWND);
  var
    Title: array[0..255] of Char;
  begin
    GetWindowText(Wnd, Title, Length(Title));
    DiagnosticLog('taskbar', Name+' hwnd=$'+IntToHex(NativeUInt(Wnd), SizeOf(Pointer)*2)+
      '; title=['+String(Title)+']; visible='+BoolToStr(IsWindowVisible(Wnd), True)+
      '; owner=$'+IntToHex(NativeUInt(GetWindow(Wnd, GW_OWNER)), SizeOf(Pointer)*2)+
      '; exstyle=$'+IntToHex(GetWindowLong(Wnd, GWL_EXSTYLE), 8));
    TraceIcon(Name+' WM_GETICON big', HICON(SendMessage(Wnd, WM_GETICON, ICON_BIG, 0)));
    TraceIcon(Name+' WM_GETICON small', HICON(SendMessage(Wnd, WM_GETICON, ICON_SMALL, 0)));
    TraceIcon(Name+' WM_GETICON small2', HICON(SendMessage(Wnd, WM_GETICON, ICON_SMALL2, 0)));
    TraceIcon(Name+' class big', HICON(GetClassLongPtr(Wnd, GCL_HICON)));
    TraceIcon(Name+' class small', HICON(GetClassLongPtr(Wnd, GCL_HICONSM)));
    TraceTaskbarShellProperties(Name, Wnd);
  end;

var
  BigIcon, SmallIcon: HICON;
  Count: UINT;
  AppID: PWideChar;
  HR: HRESULT;
begin
  if not DiagnosticLogEnabled then
     Exit;
  DiagnosticLog('taskbar', 'Startup complete; exe=['+Application.ExeName+
    ']; MainFormOnTaskbar='+BoolToStr(Application.MainFormOnTaskbar, True));
  AppID:= nil;
  HR:= ReadProcessAppUserModelID(AppID);
  try
    if Succeeded(HR) and (AppID <> nil) then
       DiagnosticLog('taskbar', 'Process explicit AppUserModelID=['+String(AppID)+']')
    else
       DiagnosticLog('taskbar', 'Process explicit AppUserModelID unavailable; HRESULT=$'+
         IntToHex(HR, 8)+' (no explicit ID can be normal; Windows infers one)');
  finally
    CoTaskMemFree(AppID);
  end;
  TraceWindow('Application', Application.Handle);
  TraceIcon('Application.Icon', Application.Icon.Handle);
  if Assigned(Application.MainForm) then
     begin
       TraceWindow('MainForm', Application.MainForm.Handle);
       TraceIcon('MainForm.Icon', Application.MainForm.Icon.Handle);
     end;
  BigIcon:= 0;
  SmallIcon:= 0;
  Count:= ExtractIconEx(PChar(Application.ExeName), 0, BigIcon, SmallIcon, 1);
  try
    DiagnosticLog('taskbar', 'ExtractIconEx count='+IntToStr(Count));
    TraceIcon('EXE big', BigIcon);
    TraceIcon('EXE small', SmallIcon);
  finally
    if BigIcon <> 0 then
       DestroyIcon(BigIcon);
    if SmallIcon <> 0 then
       DestroyIcon(SmallIcon);
  end;
end;

const
  MaxLogSize = 5 * 1024 * 1024;

type
  TDiagnosticLogger = class
  private
    FLock: TCriticalSection;
    FEnabled, FPreference, FCommandLine, FHooked: Boolean;
    FFileName, FVersion: String;
    FPreviousException: TExceptionEvent;
    FPreviousMessage: TMessageEvent;
    procedure AppendLine(const Category, Msg: String);
    procedure ReportFailure(const ErrorText: String);
    procedure ApplicationException(Sender: TObject; E: Exception);
    procedure ApplicationMessage(var Msg: TMsg; var Handled: Boolean);
  public
    constructor Create(const Version: String);
    destructor Destroy; override;
    procedure Write(const Category, Msg: String);
    procedure SetPreference(Enabled: Boolean);
  end;

var
  Logger: TDiagnosticLogger;

constructor TDiagnosticLogger.Create(const Version: String);
var
  Settings: TMemIniFile;
  I: Integer;
begin
  inherited Create;
  FLock:= TCriticalSection.Create;
  FVersion:= Version;
  FFileName:= ExtractFilePath(ParamStr(0))+'diagnostic.log';
  for I:= 1 to ParamCount do
      if SameText(ParamStr(I), '--debug-log') then
         FCommandLine:= True;

  Settings:= TMemIniFile.Create(ExtractFilePath(ParamStr(0))+'EmuLoader.ini');
  try
    FPreference:= Settings.ReadInteger('Preferences', 'DiagnosticLog', 0) <> 0;
  finally
    Settings.Free;
  end;
  FPreviousException:= Application.OnException;
  FPreviousMessage:= Application.OnMessage;
  Application.OnException:= ApplicationException;
  Application.OnMessage:= ApplicationMessage;
  FHooked:= True;
end;

destructor TDiagnosticLogger.Destroy;
begin
  if FHooked then
     begin
       Application.OnException:= FPreviousException;
       Application.OnMessage:= FPreviousMessage;
     end;
  FLock.Free;
  inherited;
end;

procedure TDiagnosticLogger.AppendLine(const Category, Msg: String);
var
  Stream: TFileStream;
  Data: UTF8String;
  Text, Backup: String;
begin
  Text:= StringReplace(Copy(Msg, 1, 4096), #13, '\r', [rfReplaceAll]);
  Text:= StringReplace(Text, #10, '\n', [rfReplaceAll]);
  Data:= UTF8Encode(FormatDateTime('yyyy-mm-dd hh:nn:ss.zzz', Now)+
                   ' [pid='+IntToStr(GetCurrentProcessId)+
                   ' tid='+IntToStr(GetCurrentThreadId)+'] ['+Category+'] '+Text+#13#10);
  if FileExists(FFileName) then
     Stream:= TFileStream.Create(FFileName, fmOpenReadWrite or fmShareDenyWrite)
  else
     Stream:= TFileStream.Create(FFileName, fmCreate or fmShareDenyWrite);
  try
    if Stream.Size+Length(Data) > MaxLogSize then
       begin
         FreeAndNil(Stream);
         Backup:= FFileName+'.1';
         if FileExists(Backup) and not SysUtils.DeleteFile(Backup) then
            RaiseLastOSError;
         if not RenameFile(FFileName, Backup) then
            RaiseLastOSError;
         Stream:= TFileStream.Create(FFileName, fmCreate or fmShareDenyWrite);
       end;
    Stream.Seek(0, soEnd);
    Stream.WriteBuffer(Data[1], Length(Data));
  finally
    Stream.Free;
  end;
end;

procedure TDiagnosticLogger.ReportFailure(const ErrorText: String);
begin
  OutputDebugString(PChar('EmuLoader diagnostic log: '+ErrorText));
  MessageBox(0, PChar('Diagnostic logging has stopped because the log could not be written.'+
             #13#10+FFileName+#13#10+ErrorText), 'Emu Loader',
             MB_OK or MB_ICONWARNING or MB_TOPMOST);
end;

procedure TDiagnosticLogger.Write(const Category, Msg: String);
var
  ErrorText: String;
begin
  ErrorText:= '';
  FLock.Acquire;
  try
    if not FEnabled then
       Exit;
    try
      AppendLine(Category, Msg);
    except
      on E: EStreamError do ErrorText:= E.ClassName+': '+E.Message;
      on E: EOSError do ErrorText:= E.ClassName+': '+E.Message;
      on E: EInOutError do ErrorText:= E.ClassName+': '+E.Message;
    end;
    if ErrorText <> '' then
       FEnabled:= False;
  finally
    FLock.Release;
  end;
  if ErrorText <> '' then
     ReportFailure(ErrorText);
end;

procedure TDiagnosticLogger.SetPreference(Enabled: Boolean);
var
  WasEnabled: Boolean;
  BuildTime: TDateTime;
begin
  FLock.Acquire;
  try
    WasEnabled:= FEnabled;
    FPreference:= Enabled;
  finally
    FLock.Release;
  end;
  if WasEnabled and not (Enabled or FCommandLine) then
     Write('session', 'Diagnostic logging disabled in preferences');
  FLock.Acquire;
  try
    FEnabled:= FPreference or FCommandLine;
  finally
    FLock.Release;
  end;
  if (Enabled or FCommandLine) and not WasEnabled then
     begin
       Write('session', 'Logging enabled; EmuLoader '+FVersion+
             '; executable='+ParamStr(0)+'; Windows='+TOSVersion.ToString+
             '; compiler='+FloatToStr(CompilerVersion)+
             '; pointer bits='+IntToStr(SizeOf(Pointer)*8)+
             '; module base=$'+IntToHex(NativeUInt(HInstance), SizeOf(Pointer)*2)+
             '; command-line override='+BoolToStr(FCommandLine, True));
       Write('session', 'Log includes local paths and emulator command lines; review before sharing');
       if FileAge(ParamStr(0), BuildTime) then
          Write('session', 'Executable last modified='+FormatDateTime('yyyy-mm-dd hh:nn:ss', BuildTime))
       else
          Write('session', 'Executable modification time could not be read');
     end;
end;

procedure TDiagnosticLogger.ApplicationException(Sender: TObject; E: Exception);
begin
  DiagnosticLogException('VCL event handler', E, ExceptAddr);
  if Assigned(FPreviousException) then
     FPreviousException(Sender, E)
  else
     Application.ShowException(E);
end;

procedure TDiagnosticLogger.ApplicationMessage(var Msg: TMsg; var Handled: Boolean);
var
  Control: TWinControl;
begin
  if (Msg.message = WM_LBUTTONUP) or (Msg.message = WM_LBUTTONDBLCLK) or
     (Msg.message = WM_RBUTTONUP) then
     begin
       Control:= FindControl(Msg.hwnd);
       if Assigned(Control) then
          Write('ui', Control.Name+' ('+Control.ClassName+'); mouse message='+IntToStr(Msg.message));
     end;
  if Assigned(FPreviousMessage) then
     FPreviousMessage(Msg, Handled);
end;

procedure InitializeDiagnosticLog(const Version: String);
begin
  Logger:= TDiagnosticLogger.Create(Version);
  Logger.SetPreference(Logger.FPreference);
end;

procedure SetDiagnosticLogPreference(Enabled: Boolean);
begin
  if Assigned(Logger) then
     Logger.SetPreference(Enabled);
end;

function DiagnosticLogPreference: Boolean;
begin
  Result:= Assigned(Logger) and Logger.FPreference;
end;

function DiagnosticLogEnabled: Boolean;
begin
  Result:= False;
  if not Assigned(Logger) then
     Exit;
  Logger.FLock.Acquire;
  try
    Result:= Logger.FEnabled;
  finally
    Logger.FLock.Release;
  end;
end;

procedure DiagnosticLog(const Category, Msg: String);
begin
  if Assigned(Logger) then
     Logger.Write(Category, Msg);
end;

procedure DiagnosticLogException(const Context: String; E: Exception; Address: Pointer);
begin
  DiagnosticLog('exception', Context+': '+E.ClassName+': '+E.Message+
                '; address=$'+IntToHex(NativeUInt(Address), SizeOf(Pointer)*2));
end;

initialization
  Logger:= nil;

finalization
  FreeAndNil(Logger);

end.
