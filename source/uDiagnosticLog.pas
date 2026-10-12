unit uDiagnosticLog;

interface

uses SysUtils;

procedure InitializeDiagnosticLog(const Version: String);
procedure SetDiagnosticLogPreference(Enabled: Boolean);
function DiagnosticLogPreference: Boolean;
function DiagnosticLogEnabled: Boolean;
procedure DiagnosticLog(const Category, Msg: String);
procedure DiagnosticLogException(const Context: String; E: Exception; Address: Pointer);

implementation

uses Windows, Messages, Classes, Forms, Controls, IniFiles, SyncObjs;

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
