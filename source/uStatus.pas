unit uStatus;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  GraphicEx, StdCtrls, ComCtrls, ExtCtrls, uCommon, mmSystem, ShadowLabel,
  GR32_Image;

type
  TFormStatus = class(TForm)
    ImageBk: TImage32;
    LabelMessage: TShadowLabel;
    LabelTimer: TShadowLabel;
    LabelStatusType: TShadowLabel;
    ProgressBar: TProgressBar;
    LabelVersion: TShadowLabel;
    LabelSoftwareScanCount: TShadowLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    { Private declarations }
    procedure ResetTimerLabel;
  public
    { Public declarations }
    procedure StartThreadClock;
    procedure StopThreadClock(ForceStop: Boolean = False);
    procedure TitleStr(const TitleText: String; MergeCurrentText: Boolean = False);
    procedure MessageStr(const MessageText: String; Refresh: Boolean = True);
    procedure SetProgressPos(Position: Integer);
    procedure UpdateProgressBar(Position, Total: Integer);
  end;

var
  FormStatus: TFormStatus;
  mmResult, TimerCount: Integer; // for the thread clock

implementation

uses uMain;

{$R *.DFM}

procedure TFormStatus.ResetTimerLabel;
begin
  FormStatus.LabelTimer.Caption:= '00:00:00';
  mmResult:= 0;
end;

procedure TimeCallBack(TimerID, Msg: Uint; dwUser, dw1, dw2: DWORD); pascal;
begin
  // Do something here. This procedure will be executed each 1000 ms
  FormStatus.LabelTimer.Canvas.Lock;
  Inc(TimerCount, 1000);
  FormStatus.LabelTimer.Caption:= GetPlayTime(TimerCount, True);
  FormStatus.LabelTimer.Canvas.UnLock;
end;

procedure TFormStatus.StartThreadClock;
begin
  if mmResult <> 0 then
     Exit; // do nothing as the timer is already running
  TimerCount:= 0;
  mmResult:= TimeSetEvent(1000, 0, @TimeCallBack, 0, TIME_PERIODIC);
end;

procedure TFormStatus.StopThreadClock(ForceStop: Boolean = False);
begin
  if (not FormMain.IsStartup) or (ForceStop) then
     begin
       TimeKillEvent(mmResult);
       ResetTimerLabel;
     end;
end;

procedure TFormStatus.TitleStr(const TitleText: String; MergeCurrentText: Boolean = False);
begin
  LabelStatusType.Canvas.Lock;
  case MergeCurrentText of
    True : LabelStatusType.Caption:= LabelStatusType.Caption+' '+TitleText;
    False: LabelStatusType.Caption:= TitleText;
  end;
  LabelStatusType.Canvas.UnLock;
end;

procedure TFormStatus.MessageStr(const MessageText: String; Refresh: Boolean = True);
begin
  LabelMessage.Canvas.Lock; // help to reduce flickering if text changes too fast (parse MESS software lists...)
  LabelMessage.Caption:= MessageText;
  LabelMessage.Canvas.UnLock;
  if Refresh then
     Application.ProcessMessages; // this one is the real flickering fix...
end;

procedure TFormStatus.SetProgressPos(Position: Integer);
begin
  FormStatus.ProgressBar.Position:= Position;
end;

procedure TFormStatus.UpdateProgressBar(Position, Total: Integer);
var
  CalculatePosition: LongInt;
begin
  if Total in [0, 1] then
     Exit;
  if not ProgressBar.Visible then
     ProgressBar.Visible:= True;
  CalculatePosition:= Trunc((Position * 100) / Total);
  if CalculatePosition > ProgressBar.Position then
     ProgressBar.Position:= CalculatePosition;
end;

{procedure TFormStatus.ResizeForm;
begin
  Exit;
  if Screen.Height < 600 then
     begin
       LabelStatusType.Font.Name:= 'Segoe UI';
       LabelStatusType.Font.Size:= 7;
       LabelStatusType.Font.Style:= [fsBold];
       LabelStatusType.Left:= 35;
       LabelStatusType.Top:= 272;
       LabelStatusType.Width:= 440;
       LabelStatusType.Height:= 13;

       LabelMessage.Font.Name:= 'Arial';
       LabelMessage.Font.Size:= 7;
       LabelMessage.Font.Style:= [fsBold];
       LabelMessage.Left:= 23;
       LabelMessage.Top:= 286;
       LabelMessage.Width:= 425;
       LabelMessage.Height:= 23;

       LabelTimer.Font.Size:= 7;
       LabelTimer.Left:= 405;
       LabelTimer.Top:= 310;

       ProgressBar.Width:= 401;
       ProgressBar.Height:= 9;
       ProgressBar.Left:= 2;
       ProgressBar.Top:= 311;

       LabelVersion.Font.Name:= 'Arial';
       LabelVersion.Font.Size:= 7;
       LabelVersion.Font.Style:= [fsBold];
       LabelVersion.Left:= 135;
       LabelVersion.Top:= 32;
     end;
end;}

procedure TFormStatus.FormCreate(Sender: TObject);
begin
  if Screen.Fonts.IndexOf('Terminal') = -1 then
     begin
       FormMain.ChangeLabelFontConsolas(LabelTimer);
       FormMain.ChangeLabelFontConsolas(LabelSoftwareScanCount);
     end;

  mmResult:= 0;
  LabelStatusType.Caption:= '';
  LabelMessage.Caption:= '';

  if not Application.Terminated then
     begin
       LabelMessage.Left:= 4;
     end;
end;

procedure TFormStatus.FormShow(Sender: TObject);
begin
  if Application.Terminated then
     begin
       PostMessage(Handle, wm_Close, 0, 0);
       Exit;
     end;

  if FormStatus.Tag = 1 then
     Exit;
  SetWindowPos(FormStatus.Handle, hWnd_TopMost, 0, 0, 0, 0, SWP_NOMOVE+SWP_NOSIZE);
  FormStatus.Left:= (Screen.Width shr 1)-(Width shr 1)-1;
  FormStatus.Top:=  (Screen.Height shr 1)-(Height shr 1)-1;

  if FileExists(FormMain.GetFolderFull(35)+'logo.png') then
     begin
       FormStatus.Tag:= 1;
       ImageBk.Bitmap.LoadFromFile(FormMain.GetFolderFull(35)+'logo.png');
     end;
  LabelVersion.Caption:= FormMain.FrontendVersion;
end;

procedure TFormStatus.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if CanClose then
     begin
       if mmResult <> 0 then
          StopThreadClock; // force timer clock to stop when closing the status screen!
       SetProgressPos(0); // reset progress bar position (required)
       TitleStr(''); // clean title message (cosmetic fix, not required)
       MessageStr(''); //clean detailed message (cosmetic fix, not required)
       if ProgressBar.Visible then
          ProgressBar.Visible:= False;
     end;
end;

// not used anymore (June 25, 2015)
// this makes transparent non rectangular shapes
{
procedure PremultiplyBitmap(Bitmap: TBitmap);
var
  Row, Col: integer;
  p: PRGBQuad;
  PreMult: array[Byte, Byte] of Byte;
begin
  // precalculate all possible values of a*b
  for Row:= 0 to 255 do
    for Col:= Row to 255 do
    begin
      PreMult[Row, Col]:= Row*Col div 255;
      if (Row <> Col) then
        PreMult[Col, Row]:= PreMult[Row, Col]; // a*b = b*a
    end;

  for Row:= 0 to Bitmap.Height-1 do
  begin
    Col:= Bitmap.Width;
    p:= Bitmap.ScanLine[Row];
    while (Col > 0) do
    begin
      p.rgbBlue:= PreMult[p.rgbReserved, p.rgbBlue];
      p.rgbGreen:= PreMult[p.rgbReserved, p.rgbGreen];
      p.rgbRed:= PreMult[p.rgbReserved, p.rgbRed];
      Inc(p);
      Dec(Col);
    end;
  end;
end;
}


end.
