unit uStatus;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  GraphicEx, StdCtrls, ComCtrls, ExtCtrls, uCommon, mmSystem, ShadowLabel,
  GR32_RangeBars, GR32_Image, GR32_Layers, ColorBoxEx, AdvOfficeButtons,
  PanelEx, ButtonsEx, XiProgressBar;

type
  TFormStatus = class(TForm)
    ImageBk: TImage32;
    LabelMessage: TShadowLabel;
    LabelTimer: TShadowLabel;
    LabelStatusType: TShadowLabel;
    LabelVersion: TShadowLabel;
    LabelSoftwareScanCount: TShadowLabel;
    SplashScreenSettingsBox: TPanelEx;
    SplashScreenSettingsBoxLabel: TShadowLabel;
    SplashScreenEnableTextsAlternateLayout: TAdvOfficeCheckBoxEx;
    SplashScreenShowTextShadows: TAdvOfficeCheckBoxEx;
    SplashScreenEnableAlternateLogoFile: TAdvOfficeCheckBoxEx;
    SplashScreenSettingsTextFontColorsBox: TPanelEx;
    SplashScreenSettingsTextFontColorsBoxLabel: TShadowLabel;
    SplashScreenTitleTextColorLabel: TShadowLabel;
    SplashScreenTitleTextColor: TColorBoxEx;
    SplashScreenMessageTextColor: TColorBoxEx;
    SplashScreenMessageTextColorLabel: TShadowLabel;
    SplashScreenTimerTextColorLabel: TShadowLabel;
    SplashScreenTimerTextColor: TColorBoxEx;
    SplashScreenVersionInfoTextColor: TColorBoxEx;
    SplashScreenVersionInfoTextColorLabel: TShadowLabel;
    SplashScreenSoftwareTextColorLabel: TShadowLabel;
    SplashScreenSoftwareTextColor: TColorBoxEx;
    SplashScreenVersionInfoPositionLabel: TShadowLabel;
    SplashScreenVersionInfoPositionX: TGaugeBar;
    SplashScreenVersionInfoPositionXLabel: TShadowLabel;
    SplashScreenVersionInfoPositionY: TGaugeBar;
    SplashScreenVersionInfoPositionYLabel: TShadowLabel;
    ColorsBoxButtonDefault: TSpeedButtonEx;
    VersionInfoPositionButtonDefault: TSpeedButtonEx;
    SplashScreenVersionInfoPositionLeftLabel: TShadowLabel;
    SplashScreenVersionInfoPositionTopLabel: TShadowLabel;
    SplashScreenProgressBarColorSchemeLabel: TShadowLabel;
    SplashScreenProgressBarColorScheme: TComboBox2Ex;
    ProgressBarSchemeButtonDefault: TSpeedButtonEx;
    ProgressBarPanel: TPanelEx;
    ProgressBar: TXiProgressBar;
    StatusButtonClose: TBitBtnEx;
    SplashScreenProgressBarColorBackTopLabel: TShadowLabel;
    SplashScreenProgressBarColorBackDownLabel: TShadowLabel;
    SplashScreenProgressBarColorBarTopLabel: TShadowLabel;
    SplashScreenProgressBarColorBarDownLabel: TShadowLabel;
    SplashScreenProgressBarColorBackBorderLabel: TShadowLabel;
    SplashScreenProgressBarColorBackTop: TColorBoxEx;
    SplashScreenProgressBarColorBackDown: TColorBoxEx;
    SplashScreenProgressBarColorBackBorder: TColorBoxEx;
    SplashScreenProgressBarColorBarTop: TColorBoxEx;
    SplashScreenProgressBarColorBarDown: TColorBoxEx;
    ProgressBarCopyCurrentColorsToCustomButton: TBitBtnEx;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure StatusButtonCloseClick(Sender: TObject);
    procedure ImageBkMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer; Layer: TCustomLayer);
    procedure SplashScreenVersionInfoPositionXChange(Sender: TObject);
    procedure SplashScreenVersionInfoPositionYChange(Sender: TObject);
    procedure SplashScreenShowTextShadowsClick(Sender: TObject);
    procedure SplashScreenTitleTextColorSelect(Sender: TObject);
    procedure SplashScreenMessageTextColorSelect(Sender: TObject);
    procedure SplashScreenTimerTextColorSelect(Sender: TObject);
    procedure SplashScreenSoftwareTextColorSelect(Sender: TObject);
    procedure SplashScreenEnableAlternateLogoFileClick(Sender: TObject);
    procedure ColorsBoxButtonDefaultClick(Sender: TObject);
    procedure SplashScreenEnableTextsAlternateLayoutClick(Sender: TObject);
    procedure VersionInfoPositionButtonDefaultClick(Sender: TObject);
    procedure SplashScreenVersionInfoTextColorSelect(Sender: TObject);
    procedure SplashScreenProgressBarColorSchemeSelect(Sender: TObject);
    procedure ProgressBarSchemeButtonDefaultClick(Sender: TObject);
    procedure SplashScreenProgressBarColorBackTopSelect(Sender: TObject);
    procedure SplashScreenProgressBarColorBackDownSelect(Sender: TObject);
    procedure SplashScreenProgressBarColorBackBorderSelect(
      Sender: TObject);
    procedure SplashScreenProgressBarColorBarTopSelect(Sender: TObject);
    procedure SplashScreenProgressBarColorBarDownSelect(Sender: TObject);
    procedure ProgressBarCopyCurrentColorsToCustomButtonClick(
      Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    CustomProgressBar: Boolean;
    procedure ResetTimerLabel;
    procedure LoadImageLogo;
    procedure StatusChangeLayout;
    procedure ToggleProgressBarColorBox;
    procedure SetProgressBarColorBox;
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
  CalculatePosition: Integer;
begin
  if Total in [0, 1] then
     Exit;
  if not ProgressBarPanel.Visible then
     ProgressBarPanel.Visible:= True;
  CalculatePosition:= Trunc((Position * 100) / Total);
  if CalculatePosition > ProgressBar.Position then
     ProgressBar.Position:= CalculatePosition;
end;

procedure TFormStatus.LoadImageLogo;
var
  iFile, iFolder: String;
begin
  iFile:= 'logo.png';
  iFolder:= FormMain.GetFolderFull(35);
  if SplashScreenEnableAlternateLogoFile.Checked then
     begin
       iFile:= 'logo2.png';
       if not FileExists(iFolder+iFile) then
          iFile:= 'logo.png;'
     end;

  if FileExists(iFolder+iFile) then
     begin
       ImageBk.Bitmap:= nil;
       ImageBk.Bitmap.LoadFromFile(iFolder+iFile);
     end;
end;

procedure TFormStatus.StatusChangeLayout;
begin
  if SplashScreenEnableTextsAlternateLayout.Checked then
  begin
    LabelStatusType.Left:= 4;
    LabelTimer.Top:= 548;
    ProgressBarPanel.Top:= 547;
    ProgressBarPanel.Left:= 76;
  end
  else
  begin
    if not FormMain.IsStartup then
    begin
      LabelStatusType.Left:= 90;
      LabelTimer.Top:= 566;
      ProgressBarPanel.Left:= 4;
      ProgressBarPanel.Top:= 548;
    end;
  end;
end;

procedure TFormStatus.ToggleProgressBarColorBox;

  function ToggleEnabled(ColorBoxExSource: TColorBoxEx; IsEnabled: Boolean): Boolean;
  begin
    Result:= True;
    if ColorBoxExSource.Enabled <> IsEnabled then
       ColorBoxExSource.Enabled:= IsEnabled;
  end;

begin
  ToggleEnabled(SplashScreenProgressBarColorBackTop, (SplashScreenProgressBarColorScheme.ItemIndex = 0) and CustomProgressBar);
  ToggleEnabled(SplashScreenProgressBarColorBackDown, SplashScreenProgressBarColorBackTop.Enabled);
  ToggleEnabled(SplashScreenProgressBarColorBackBorder, SplashScreenProgressBarColorBackTop.Enabled);
  ToggleEnabled(SplashScreenProgressBarColorBarTop, SplashScreenProgressBarColorBackTop.Enabled);
  ToggleEnabled(SplashScreenProgressBarColorBarDown, SplashScreenProgressBarColorBackTop.Enabled);

  SplashScreenProgressBarColorBackTopLabel.Enabled:= SplashScreenProgressBarColorBackTop.Enabled;
  SplashScreenProgressBarColorBackDownLabel.Enabled:= SplashScreenProgressBarColorBackTop.Enabled;
  SplashScreenProgressBarColorBackBorderLabel.Enabled:= SplashScreenProgressBarColorBackTop.Enabled;
  SplashScreenProgressBarColorBarTopLabel.Enabled:= SplashScreenProgressBarColorBackTop.Enabled;
  SplashScreenProgressBarColorBarDownLabel.Enabled:= SplashScreenProgressBarColorBackTop.Enabled;

  if ProgressBarCopyCurrentColorsToCustomButton.Enabled <> (not SplashScreenProgressBarColorBackTop.Enabled) then
     ProgressBarCopyCurrentColorsToCustomButton.Enabled:= not SplashScreenProgressBarColorBackTop.Enabled;
end;

procedure TFormStatus.SetProgressBarColorBox;
begin
  if SplashScreenProgressBarColorScheme.ItemIndex = 0 then
     begin
       // user custom colors
       FormMain.SetSelectedColorBox(SplashScreenProgressBarColorBackTop,    SplashScreenProgressBarColorBackTop.NoneColorColor);// CustomProgressBarColors.BackColorTop);
       FormMain.SetSelectedColorBox(SplashScreenProgressBarColorBackDown,   SplashScreenProgressBarColorBackDown.NoneColorColor);// CustomProgressBarColors.BackColorDown);
       FormMain.SetSelectedColorBox(SplashScreenProgressBarColorBackBorder, SplashScreenProgressBarColorBackBorder.NoneColorColor);// CustomProgressBarColors.BackColorBorder);
       FormMain.SetSelectedColorBox(SplashScreenProgressBarColorBarTop,     SplashScreenProgressBarColorBarTop.NoneColorColor);// CustomProgressBarColors.BarColorTop);
       FormMain.SetSelectedColorBox(SplashScreenProgressBarColorBarDown,    SplashScreenProgressBarColorBarDown.NoneColorColor); // CustomProgressBarColors.BarColorDown);
     end
  else
     begin
       FormMain.SetSelectedColorBox(SplashScreenProgressBarColorBackTop,    ProgressBar.BackColorFace);
       FormMain.SetSelectedColorBox(SplashScreenProgressBarColorBackDown,   ProgressBar.BackColorGrad);
       FormMain.SetSelectedColorBox(SplashScreenProgressBarColorBackBorder, ProgressBar.ColorBorder);
       FormMain.SetSelectedColorBox(SplashScreenProgressBarColorBarTop,     ProgressBar.ForeColorFace);
       FormMain.SetSelectedColorBox(SplashScreenProgressBarColorBarDown,    ProgressBar.ForeColorGrad);
     end;
end;

procedure TFormStatus.FormCreate(Sender: TObject);
begin
  CustomProgressBar:= Screen.Width >= 1280;
  if FormMain.MenuCustomizeSplashScreen.Tag = 0 then
     begin
       FormMain.ChangeLabelFontConsolas(LabelTimer, 9, [fsBold]);
       FormMain.ChangeLabelFontConsolas(LabelSoftwareScanCount, 9, [fsBold]);
       //LabelTimer.Height:= LabelTimer.Height+1; // it must be 14 pixels for the "Lucida Console" font (no, it doesn't... June 08, 2020)
       //LabelSoftwareScanCount.Height:= LabelSoftwareScanCount.Height+1; // it must be 14 pixels for the "Lucida Console" font
       LabelTimer.Layout:= tlCenter;
       LabelSoftwareScanCount.Layout:= tlCenter;
     end;

  mmResult:= 0;
  LabelStatusType.Caption:= '';
  LabelMessage.Caption:= '';

  if not Application.Terminated then
     LabelMessage.Left:= 4;
end;

procedure TFormStatus.FormShow(Sender: TObject);
begin
  if Application.Terminated then
     begin
       PostMessage(Handle, wm_Close, 0, 0);
       Exit;
     end;

  if FormStatus.Tag = 0 then
     begin
       SetWindowPos(FormStatus.Handle, hWnd_TopMost, 0, 0, 0, 0, SWP_NOMOVE+SWP_NOSIZE);

       FormStatus.Left:= (Screen.Width shr 1)-(Width shr 1)-1;
       FormStatus.Top:=  (Screen.Height shr 1)-(Height shr 1)-1;

       FormStatus.Tag:= 1;
     end;
end;

procedure TFormStatus.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if CanClose then
     begin
       if mmResult <> 0 then
          StopThreadClock; // force timer clock to stop when closing the status screen!
       SetProgressPos(0); // reset progress bar position (required)
       TitleStr('');   // clean title message (cosmetic fix, not required)
       MessageStr(''); //clean detailed message (cosmetic fix, not required)
       if ProgressBarPanel.Visible then
          ProgressBarPanel.Visible:= False;
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


procedure TFormStatus.StatusButtonCloseClick(
  Sender: TObject);
begin
  StatusButtonClose.Visible:= False;
  FormMain.SetLabelSoftwareScanCountVisible(False);
  if SplashScreenSettingsBox.Top = 4 then
     FormStatus.ClientWidth:= ImageBk.Width
  else
     FormStatus.ClientHeight:= ImageBk.Height;

  FormStatus.KeyPreview:= False; // disable ESC key detection
  FormStatus.Tag:= 1;

  FormStatus.Left:= (Screen.Width shr 1)-(Width shr 1)-1;
  FormStatus.Top:=  (Screen.Height shr 1)-(Height shr 1)-1;

  Close;
end;

procedure TFormStatus.ImageBkMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer;
  Layer: TCustomLayer);
const
   sc_DragMove = $f012;
begin
  if StatusButtonClose.Visible then
     begin
       ReleaseCapture;
       FormStatus.Perform(wm_SysCommand, sc_DragMove, 0);
     end;
end;

procedure TFormStatus.SplashScreenVersionInfoPositionXChange(
  Sender: TObject);
begin
  SplashScreenVersionInfoPositionXLabel.Caption:= IntToStr(SplashScreenVersionInfoPositionX.Position);
  if LabelVersion.Left <> SplashScreenVersionInfoPositionX.Position then
     LabelVersion.Left:= SplashScreenVersionInfoPositionX.Position;
end;

procedure TFormStatus.SplashScreenVersionInfoPositionYChange(
  Sender: TObject);
begin
  SplashScreenVersionInfoPositionYLabel.Caption:= IntToStr(SplashScreenVersionInfoPositionY.Position);
  if LabelVersion.Top <> SplashScreenVersionInfoPositionY.Position then
     LabelVersion.Top:= SplashScreenVersionInfoPositionY.Position;
end;

procedure TFormStatus.SplashScreenShowTextShadowsClick(Sender: TObject);
begin
  LabelStatusType.ShadowEnabled:= SplashScreenShowTextShadows.Checked;
  LabelMessage.ShadowEnabled:= SplashScreenShowTextShadows.Checked;
  LabelTimer.ShadowEnabled:= SplashScreenShowTextShadows.Checked;
  LabelSoftwareScanCount.ShadowEnabled:= SplashScreenShowTextShadows.Checked;
  LabelVersion.ShadowEnabled:= SplashScreenShowTextShadows.Checked;
end;

procedure TFormStatus.SplashScreenTitleTextColorSelect(Sender: TObject);
begin
  LabelStatusType.Font.Color:= SplashScreenTitleTextColor.Selected;
end;

procedure TFormStatus.SplashScreenMessageTextColorSelect(Sender: TObject);
begin
  LabelMessage.Font.Color:= SplashScreenMessageTextColor.Selected;
end;

procedure TFormStatus.SplashScreenTimerTextColorSelect(Sender: TObject);
begin
  LabelTimer.Font.Color:= SplashScreenTimerTextColor.Selected;
end;

procedure TFormStatus.SplashScreenSoftwareTextColorSelect(Sender: TObject);
begin
  LabelSoftwareScanCount.Font.Color:= SplashScreenSoftwareTextColor.Selected;
end;

procedure TFormStatus.SplashScreenEnableAlternateLogoFileClick(Sender: TObject);
begin
  LoadImageLogo;
end;

procedure TFormStatus.ColorsBoxButtonDefaultClick(
  Sender: TObject);
begin
  SetDefaultColorBox(SplashScreenTitleTextColor);
  SetDefaultColorBox(SplashScreenMessageTextColor);
  SetDefaultColorBox(SplashScreenTimerTextColor);
  SetDefaultColorBox(SplashScreenSoftwareTextColor);
  SetDefaultColorBox(SplashScreenVersionInfoTextColor);
end;

procedure TFormStatus.SplashScreenEnableTextsAlternateLayoutClick(
  Sender: TObject);
begin
  StatusChangeLayout;
end;

procedure TFormStatus.VersionInfoPositionButtonDefaultClick(
  Sender: TObject);
begin
  SplashScreenVersionInfoPositionX.Position:= 6;
  SplashScreenVersionInfoPositionY.Position:= 228;
end;

procedure TFormStatus.SplashScreenVersionInfoTextColorSelect(
  Sender: TObject);
begin
  LabelVersion.Font.Color:= SplashScreenVersionInfoTextColor.Selected;
end;

procedure TFormStatus.SplashScreenProgressBarColorSchemeSelect(
  Sender: TObject);
begin
  if (SplashScreenProgressBarColorScheme.ItemIndex = 0) and (not CustomProgressBar) then
     ProgressBar.ColorScheme:= csDesert//TColorScheme(1)
  else
     ProgressBar.ColorScheme:= TColorScheme(SplashScreenProgressBarColorScheme.ItemIndex);

  ToggleProgressBarColorBox;
  SetProgressBarColorBox;
end;

procedure TFormStatus.ProgressBarSchemeButtonDefaultClick(Sender: TObject);
begin
  SetSelectedComboBox(1, SplashScreenProgressBarColorScheme);
end;

procedure TFormStatus.SplashScreenProgressBarColorBackTopSelect(
  Sender: TObject);
begin
  if SplashScreenProgressBarColorScheme.ItemIndex = 0 then
     begin
       SplashScreenProgressBarColorBackTop.NoneColorColor:= SplashScreenProgressBarColorBackTop.Selected;
       ProgressBar.BackColorFace:= SplashScreenProgressBarColorBackTop.Selected;
     end;
end;

procedure TFormStatus.SplashScreenProgressBarColorBackDownSelect(
  Sender: TObject);
begin
  if SplashScreenProgressBarColorScheme.ItemIndex = 0 then
     begin
       SplashScreenProgressBarColorBackDown.NoneColorColor:= SplashScreenProgressBarColorBackDown.Selected;
       ProgressBar.BackColorGrad:= SplashScreenProgressBarColorBackDown.Selected;
     end;
end;

procedure TFormStatus.SplashScreenProgressBarColorBackBorderSelect(
  Sender: TObject);
begin
  if SplashScreenProgressBarColorScheme.ItemIndex = 0 then
     begin
       SplashScreenProgressBarColorBackBorder.NoneColorColor:= SplashScreenProgressBarColorBackBorder.Selected;
       ProgressBar.ColorBorder:= SplashScreenProgressBarColorBackBorder.Selected;
     end;
end;

procedure TFormStatus.SplashScreenProgressBarColorBarTopSelect(
  Sender: TObject);
begin
  if SplashScreenProgressBarColorScheme.ItemIndex = 0 then
     begin
       SplashScreenProgressBarColorBarTop.NoneColorColor:= SplashScreenProgressBarColorBarTop.Selected;
       ProgressBar.ForeColorFace:= SplashScreenProgressBarColorBarTop.Selected;
     end;
end;

procedure TFormStatus.SplashScreenProgressBarColorBarDownSelect(
  Sender: TObject);
begin
  if SplashScreenProgressBarColorScheme.ItemIndex = 0 then
     begin
       SplashScreenProgressBarColorBarDown.NoneColorColor:= SplashScreenProgressBarColorBarDown.Selected;
       ProgressBar.ForeColorGrad:= SplashScreenProgressBarColorBarDown.Selected;
     end;
end;

procedure TFormStatus.ProgressBarCopyCurrentColorsToCustomButtonClick(
  Sender: TObject);
begin
  SplashScreenProgressBarColorBackTop.NoneColorColor:=    SplashScreenProgressBarColorBackTop.Selected;
  SplashScreenProgressBarColorBackDown.NoneColorColor:=   SplashScreenProgressBarColorBackDown.Selected;
  SplashScreenProgressBarColorBackBorder.NoneColorColor:= SplashScreenProgressBarColorBackBorder.Selected;
  SplashScreenProgressBarColorBarTop.NoneColorColor:=     SplashScreenProgressBarColorBarTop.Selected;
  SplashScreenProgressBarColorBarDown.NoneColorColor:=    SplashScreenProgressBarColorBarDown.Selected;
end;

procedure TFormStatus.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if FormStatus.KeyPreview then
     if Key = #27 then
        StatusButtonClose.Click;
end;

end.
