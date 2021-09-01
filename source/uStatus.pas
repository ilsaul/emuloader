unit uStatus;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  GraphicEx, StdCtrls, ComCtrls, ExtCtrls, uCommon, mmSystem, ShadowLabel,
  GR32_RangeBars, GR32_Image, GR32_Layers, ColorBoxEx, AdvOfficeButtons,
  PanelEx, ButtonsEx, XiProgressBar, IniFiles;
  //Win7TaskBarProgressUnit;

type
  TVersionInfoPos = record
    Left,     Top,
    Left4K,   Top4K,
    Left4Kx2, Top4Kx2: Integer;
    ShadowOffset,
    ShadowOffset4K: Byte;
  end;

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
    SplashScreenVersionInfoPositionXPosLabel: TShadowLabel;
    SplashScreenVersionInfoPositionY: TGaugeBar;
    SplashScreenVersionInfoPositionYPosLabel: TShadowLabel;
    ColorsBoxButtonDefault: TSpeedButtonEx;
    VersionInfoPositionButtonDefault: TSpeedButtonEx;
    SplashScreenVersionInfoPositionXLabel: TShadowLabel;
    SplashScreenVersionInfoPositionYLabel: TShadowLabel;
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
    SplashScreenTextShadowColorAllLabel: TShadowLabel;
    SplashScreenTextShadowColorAll: TColorBoxEx;
    SplashScreenTitleShadowColorLabel: TShadowLabel;
    SplashScreenTitleShadowColor: TColorBoxEx;
    SplashScreenMessageShadowColor: TColorBoxEx;
    SplashScreenMessageShadowColorLabel: TShadowLabel;
    SplashScreenTimerShadowColor: TColorBoxEx;
    SplashScreenTimerShadowColorLabel: TShadowLabel;
    SplashScreenSoftwareShadowColor: TColorBoxEx;
    SplashScreenSoftwareShadowColorLabel: TShadowLabel;
    SplashScreenVersionInfoShadowColorLabel: TShadowLabel;
    SplashScreenVersionInfoShadowColor: TColorBoxEx;
    SplashScreenShowTextShadows: TAdvOfficeCheckBoxEx;
    SplashScreenTextShadowDistance: TGaugeBar;
    SplashScreenTextShadowDistanceLabel: TShadowLabel;
    SplashScreen4KUltraSize: TAdvOfficeCheckBoxEx;
    SplashScreenTextShadowColor_OneColor: TAdvOfficeCheckBoxEx;
    SplashScreenTextShadowDistancePosLabel: TShadowLabel;
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
    procedure SplashScreenTextShadowColorAllSelect(Sender: TObject);
    procedure SplashScreenTextShadowDistanceChange(Sender: TObject);
    procedure SplashScreenTextShadowColor_OneColorClick(Sender: TObject);
    procedure SplashScreenTitleShadowColorSelect(Sender: TObject);
    procedure SplashScreenMessageShadowColorSelect(Sender: TObject);
    procedure SplashScreenTimerShadowColorSelect(Sender: TObject);
    procedure SplashScreenSoftwareShadowColorSelect(Sender: TObject);
    procedure SplashScreenVersionInfoShadowColorSelect(Sender: TObject);
    procedure SplashScreen4KUltraSizeClick(Sender: TObject);
    procedure LabelVersionMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure ImageBkDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure ImageBkDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure LabelVersionDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure LabelVersionDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure LabelVersionEndDrag(Sender, Target: TObject; X, Y: Integer);
  private
    { Private declarations }
    CustomProgressBar: Boolean;
    iSplashFile: String;
    VersionPos: TVersionInfoPos;
    XOffset, YOffset: Integer;
    procedure ReadSplashIni;
    procedure WriteSplashSettings;
    procedure ResetTimerLabel;
    procedure LoadImageLogo;
    procedure StatusChangeLayout;
    procedure ToggleProgressBarColorBox;
    procedure SetProgressBarColorBox;
    procedure ChangeTextShadowColor;
    procedure ResizeLowResolution;
    procedure Resize4K(UpdateForm, UpdateControls: Boolean);
    procedure SetDefaultVersionPos;
    function  GetVersionPosLeft: Integer;
    function  GetVersionPosTop: Integer;
    procedure UpdateVersionPos;
  public
    { Public declarations }
    //TaskBarHandle: HWND;
    //TaskBarProgress: TWin7TaskProgressBar;
    //procedure ReadSplashSettings; // no longer needed (May 21, 2021)
    procedure StartThreadClock;
    procedure StopThreadClock(ForceStop: Boolean = False);
    procedure TitleStr(const TitleText: String; MergeCurrentText: Boolean = False);
    procedure MessageStr(const MessageText: String; Refresh: Boolean = True);
    procedure SetProgressPos(Position: Integer);
    //procedure SetTaskBarProgress(Position: Cardinal);
    procedure UpdateProgressBar(Position, Total: Integer);
  end;

var
  FormStatus: TFormStatus;
  mmResult, TimerCount: Integer; // for the thread clock

implementation

uses uMain;

{$R *.DFM}

function TFormStatus.GetVersionPosLeft: Integer;
begin
  if Is4KMode then
     begin
       if SplashScreen4KUltraSize.Checked then
          Result:= VersionPos.Left4Kx2
       else
          Result:= VersionPos.Left4K;
     end
  else
     Result:= VersionPos.Left;
end;

function TFormStatus.GetVersionPosTop: Integer;
begin
  if Is4KMode then
     begin
       if SplashScreen4KUltraSize.Checked then
          Result:= VersionPos.Top4Kx2
       else
          Result:= VersionPos.Top4K;
     end
  else
     Result:= VersionPos.Top;
end;

procedure TFormStatus.Resize4K(UpdateForm, UpdateControls: Boolean);
var
  iWidth, iHeight, iScreenWidth, iScreenHeight, iHeight4Kx2: Integer;

  function MoveColorBox(iColorBox: TColorBoxEx; iLabelTitle: TShadowLabel; TopPosition: Integer; Is2ndColumn: Boolean = False): Boolean;
  var
    iTop, iLeft: Integer;
  begin
    Result:= True;
    if Is2ndColumn then
       begin
         iLeft:= 452;
         iTop:= TopPosition;
       end
    else
       begin
         iLeft:= 10;
         iTop:= TopPosition+56;
       end;
    FormMain.Set4KLabelSpecs(iLabelTitle, iLeft, iTop+3, -1, -1, 16);

    if Is2ndColumn then
       iLeft:= iLeft+90
    else
       iLeft:= iLeft+99;

    FormMain.Set4KColorBoxSpecs(iColorBox, iLeft, iTop, 312, 16);
  end;

  function MoveGaugeBar(iGaugeBar: TGaugeBar; iLabelTitle, iLabelValue: TShadowLabel; TopPosition: Integer; Is2ndColumn: Boolean = False; iGaugeBarWidth: Integer = -1): Boolean;
  var
    iTop, iLeft, iWidth: Integer;
  begin
    Result:= True;
    if Is2ndColumn then
       begin
         iLeft:= 452;
         iTop:= TopPosition;
       end
    else
       begin
         iLeft:= 10;
         iTop:= TopPosition+56;
       end;

    FormMain.Set4KLabelSpecs(iLabelTitle, iLeft, iTop+3, -1, -1, 16);

    if Is2ndColumn then
       iLeft:= iLeft+90
    else
       iLeft:= iLeft+99;

    iWidth:= iGaugeBarWidth;
    if iWidth = -1 then
       iWidth:= 155;

    FormMain.Set4kGaugeBarSpecs(iGaugeBar, iLeft, iTop, iWidth, 36);
    if iLabelValue <> nil then
       FormMain.Set4KLabelSpecs(iLabelValue, iGaugeBar.Left+iGaugeBar.Width+7, iLabelTitle.Top, -1, -1, 16);
  end;

begin
  if not Is4KMode then
     Exit;

  if SplashScreen4KUltraSize.Checked then
     begin
       iWidth:=  980*3; // 2940;
       iHeight:= 600*3; // 1800
       iScreenWidth:=  3417;
       iScreenHeight:= 1800;
       iHeight4Kx2:= 600;
     end
  else
     begin
       iWidth:=  980*2; // 1960;
       iHeight:= 600*2; // 1200;
       iScreenWidth:=  2865;
       iScreenHeight:= 1200;
       iHeight4Kx2:= 0;
     end;

  if (ImageBk.Width = iWidth) and (not UpdateControls) then
     Exit;

  if UpdateForm then
     ImageBk.Bitmap:= nil; // clear the loaded logo image

  with FormStatus do
  begin
    if UpdateForm then
    begin
      ClientWidth:=  iScreenWidth;
      ClientHeight:= iScreenHeight;
      Font.Size:= 16;

      if LabelVersion.Tag <> 0 then
         begin
           CallCenterWindow(FormStatus); // center form before moving other controls
           UpdateVersionPos;
         end;

      ImageBk.Width:=  iWidth;
      ImageBk.Height:= iHeight;

      FormMain.Set4KLabelSpecs(LabelVersion, GetVersionPosLeft, GetVersionPosTop, 108, 35, 18);
      FormMain.Set4KLabelFontNameSpecs(LabelVersion);

      iHeight:= 1092;
      FormMain.Set4KPanelSpecs(ProgressBarPanel, 14, iHeight+iHeight4Kx2, 130, 25);
      FormMain.Set4KProgressBarSpecs(ProgressBar, 0, 0, ProgressBarPanel.Width, ProgressBarPanel.Height);

      iHeight:= 1130;
      FormMain.Set4KLabelSpecs(LabelTimer, 14, iHeight+iHeight4Kx2, 131, 27, 18);

      iHeight:= 1126;
      FormMain.Set4KLabelSpecs(LabelStatusType, 159, iHeight+iHeight4Kx2, 1185, 32, 18);

      iHeight:= 1165;
      FormMain.Set4KLabelSpecs(LabelSoftwareScanCount, 14, iHeight+iHeight4Kx2, 163, 27, 18);

      iHeight:= 1163;
      FormMain.Set4KLabelSpecs(LabelMessage, 191, iHeight+iHeight4Kx2, 1153, 28, 16);
    end;

    if UpdateControls then
    begin
      if SplashScreen4KUltraSize.Checked then
         begin
           iWidth:=  438;
           iHeight:= 125;
         end
      else
         begin
           iWidth:=  866;
           iHeight:=  82;
         end;
      FormMain.Set4KPanelSpecs(SplashScreenSettingsBox, ImageBk.Width+20, 20, iWidth, iHeight);
      FormMain.Set4KLabelSpecs(SplashScreenSettingsBoxLabel, -1, -1, -1, 36, 16, 9);
      SplashScreenSettingsBoxLabel.Caption:= 'Logo Image Settings';

      FormMain.Set4KCheckBoxSpecs(SplashScreenEnableAlternateLogoFile, 10, 39, 190, 36, 16);

      SplashScreen4KUltraSize.Parent:= SplashScreenSettingsBox;
      if SplashScreen4KUltraSize.Checked then
         iWidth:=  256
      else
         iWidth:=  685;
      FormMain.Set4KCheckBoxSpecs(SplashScreen4KUltraSize, iWidth, 39, 175, 36, 16);
      SplashScreen4KUltraSize.Visible:= True;

      if SplashScreen4KUltraSize.Checked then
         begin
           iWidth:=  10;
           iHeight:= 82;
         end
      else
         begin
           iWidth:=  318;
           iHeight:=  39;
         end;
      FormMain.Set4KCheckBoxSpecs(SplashScreenEnableTextsAlternateLayout, iWidth, iHeight, 230, 36, 16);

      if SplashScreen4KUltraSize.Checked then
         iHeight:=  1470
      else
         iHeight:=  950;

      FormMain.Set4KPanelSpecs(SplashScreenSettingsTextFontColorsBox, SplashScreenSettingsBox.Left,
                               SplashScreenSettingsBox.Top+SplashScreenSettingsBox.Height+20, SplashScreenSettingsBox.Width, iHeight);

      FormMain.Set4KLabelSpecs(SplashScreenSettingsTextFontColorsBoxLabel, -1, -1, -1, 36, 16, 9);

      FormMain.Set4KCheckBoxSpecs(SplashScreenShowTextShadows,           10, 39, 182, 36, 16);
      FormMain.Set4KCheckBoxSpecs(SplashScreenTextShadowColor_OneColor, 299, 39, 123, 36, 16);
      FormMain.Set4KLabelSpecs(SplashScreenTextShadowColorAllLabel, 10, 82, -1, -1, 16);
      FormMain.Set4KColorBoxSpecs(SplashScreenTextShadowColorAll, 109, 79, 312, 16);

      MoveGaugeBar(SplashScreenTextShadowDistance, SplashScreenTextShadowDistanceLabel, SplashScreenTextShadowDistancePosLabel,
                   SplashScreenTextShadowColorAll.Top, not SplashScreen4KUltraSize.Checked);

      MoveColorBox(SplashScreenTitleTextColor,   SplashScreenTitleTextColorLabel,   SplashScreenTextShadowDistance.Top, False);
      MoveColorBox(SplashScreenTitleShadowColor, SplashScreenTitleShadowColorLabel, SplashScreenTitleTextColor.Top,     not SplashScreen4KUltraSize.Checked);

      MoveColorBox(SplashScreenMessageTextColor,   SplashScreenMessageTextColorLabel,   SplashScreenTitleShadowColor.Top, False);
      MoveColorBox(SplashScreenMessageShadowColor, SplashScreenMessageShadowColorLabel, SplashScreenMessageTextColor.Top, not SplashScreen4KUltraSize.Checked);

      MoveColorBox(SplashScreenTimerTextColor,   SplashScreenTimerTextColorLabel,   SplashScreenMessageShadowColor.Top, False);
      MoveColorBox(SplashScreenTimerShadowColor, SplashScreenTimerShadowColorLabel, SplashScreenTimerTextColor.Top,     not SplashScreen4KUltraSize.Checked);

      MoveColorBox(SplashScreenSoftwareTextColor,   SplashScreenSoftwareTextColorLabel,   SplashScreenTimerShadowColor.Top,  False);
      MoveColorBox(SplashScreenSoftwareShadowColor, SplashScreenSoftwareShadowColorLabel, SplashScreenSoftwareTextColor.Top, not SplashScreen4KUltraSize.Checked);

      MoveColorBox(SplashScreenVersionInfoTextColor,   SplashScreenVersionInfoTextColorLabel,   SplashScreenSoftwareShadowColor.Top,  False);
      MoveColorBox(SplashScreenVersionInfoShadowColor, SplashScreenVersionInfoShadowColorLabel, SplashScreenVersionInfoTextColor.Top, not SplashScreen4KUltraSize.Checked);

      SplashScreenVersionInfoPositionX.Max:= ImageBk.Width -LabelVersion.Width;
      SplashScreenVersionInfoPositionY.Max:= ImageBk.Height-LabelVersion.Height;
      if SplashScreen4KUltraSize.Checked then
         begin
           FormMain.Set4KLabelSpecs(SplashScreenVersionInfoPositionXLabel,     10, SplashScreenVersionInfoShadowColor.Top+59, -1, -1, 16);
           FormMain.Set4KLabelSpecs(SplashScreenVersionInfoPositionXPosLabel, 109, SplashScreenVersionInfoPositionXLabel.Top, -1, -1, 16);
           FormMain.Set4kGaugeBarSpecs(SplashScreenVersionInfoPositionX, 10, SplashScreenVersionInfoPositionXLabel.Top+34, 412, 36);

           FormMain.Set4KLabelSpecs(SplashScreenVersionInfoPositionYLabel,     10, SplashScreenVersionInfoPositionX.Top+47,   -1, -1, 16);
           FormMain.Set4KLabelSpecs(SplashScreenVersionInfoPositionYPosLabel, 109, SplashScreenVersionInfoPositionYLabel.Top, -1, -1, 16);
           FormMain.Set4kGaugeBarSpecs(SplashScreenVersionInfoPositionY, 10, SplashScreenVersionInfoPositionYLabel.Top+34, 412, 36);
         end
      else
         begin
           MoveGaugeBar(SplashScreenVersionInfoPositionX, SplashScreenVersionInfoPositionXLabel, SplashScreenVersionInfoPositionXPosLabel,
                        SplashScreenVersionInfoShadowColor.Top,  False, 705);

           MoveGaugeBar(SplashScreenVersionInfoPositionY, SplashScreenVersionInfoPositionYLabel, SplashScreenVersionInfoPositionYPosLabel,
                        SplashScreenVersionInfoPositionX.Top, False, 705);
         end;

      FormMain.Set4KComboBoxSpecs(SplashScreenProgressBarColorScheme,  109, SplashScreenVersionInfoPositionY.Top+56, 312, 16);
      FormMain.Set4KLabelSpecs(SplashScreenProgressBarColorSchemeLabel, 10, SplashScreenProgressBarColorScheme.Top+3, -1, -1, 16);

      MoveColorBox(SplashScreenProgressBarColorBackTop,  SplashScreenProgressBarColorBackTopLabel,  SplashScreenProgressBarColorScheme.Top,   False);
      MoveColorBox(SplashScreenProgressBarColorBackDown, SplashScreenProgressBarColorBackDownLabel, SplashScreenProgressBarColorBackTop.Top,  False);

      MoveColorBox(SplashScreenProgressBarColorBackBorder, SplashScreenProgressBarColorBackBorderLabel, SplashScreenProgressBarColorBackDown.Top,  False);

      MoveColorBox(SplashScreenProgressBarColorBarTop,  SplashScreenProgressBarColorBarTopLabel,  SplashScreenProgressBarColorBackBorder.Top,  False);
      MoveColorBox(SplashScreenProgressBarColorBarDown, SplashScreenProgressBarColorBarDownLabel, SplashScreenProgressBarColorBarTop.Top,      False);

      if SplashScreen4KUltraSize.Checked then
         FormMain.Set4KButtonSpecs(ProgressBarCopyCurrentColorsToCustomButton, SplashScreenTextShadowDistanceLabel.Left,
                                   SplashScreenProgressBarColorBarDown.Top+56, SplashScreenProgressBarColorScheme.Width, 36, 16)
      else
         FormMain.Set4KButtonSpecs(ProgressBarCopyCurrentColorsToCustomButton, SplashScreenTextShadowDistanceLabel.Left,
                                   SplashScreenProgressBarColorScheme.Top,     SplashScreenProgressBarColorScheme.Width, 36, 16);

      ProgressBarCopyCurrentColorsToCustomButton.Caption:= 'Copy Current Colors To Custom';

      if SplashScreen4KUltraSize.Checked then
         begin
           FormMain.Set4KButtonSpecs(ColorsBoxButtonDefault,            16, 1416, 114, 36, 16);
           FormMain.Set4KButtonSpecs(VersionInfoPositionButtonDefault, 147, 1416, 122, 36, 16);
           FormMain.Set4KButtonSpecs(ProgressBarSchemeButtonDefault,   287, 1416, 133, 36, 16);
         end
      else
         begin
           FormMain.Set4KButtonSpecs(ColorsBoxButtonDefault,           227, 902, 114, 36, 16);
           FormMain.Set4KButtonSpecs(VersionInfoPositionButtonDefault, 362, 902, 122, 36, 16);
           FormMain.Set4KButtonSpecs(ProgressBarSchemeButtonDefault,   504, 902, 133, 36, 16);
         end;
    end;

    FormMain.Set4KButtonSpecs(StatusButtonClose, SplashScreenSettingsTextFontColorsBox.Left+(SplashScreenSettingsTextFontColorsBox.Width div 2)-50,
                              ClientHeight-20-45, 100, 45, 16);
  end;


  if LabelVersion.Tag <> 0 then // .Tag = 0 is initial settings, do not execute this code
     begin
       Application.ProcessMessages;
       if UpdateForm then
          SplashScreenEnableAlternateLogoFile.OnClick(Self);
     end;
end;

procedure TFormStatus.UpdateVersionPos;
begin
  SplashScreenVersionInfoPositionX.Position:= GetVersionPosLeft;
  SplashScreenVersionInfoPositionY.Position:= GetVersionPosTop;
  SplashScreenTextShadowDistance.OnChange(Self);
end;

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
     Exit; // do nothing, timer is already running
  TimerCount:= 0;
  mmResult:= TimeSetEvent(1000, 0, @TimeCallBack, 0, TIME_PERIODIC);
end;

procedure TFormStatus.StopThreadClock(ForceStop: Boolean = False);
begin
  if (not FormMain.IsStartup) or (ForceStop) then
     begin
       TimeKillEvent(mmResult);
       ResetTimerLabel;
       //TaskBarProgress.Free;
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
  LabelMessage.Canvas.Lock; // help to reduce flickering if text changes too fast (parse MESS software lists)
  LabelMessage.Caption:= MessageText;
  LabelMessage.Canvas.UnLock;
  if Refresh then
     Application.ProcessMessages; // this one is the real flickering fix...
end;

//procedure TFormStatus.SetTaskBarProgress(Position: Cardinal);
//begin
//  if TaskBarProgress <> nil then
//     if TaskBarProgress.Progress <> Position then
//        TaskBarProgress.Progress:= Position;
//end;

procedure TFormStatus.SetProgressPos(Position: Integer);
begin
  FormStatus.ProgressBar.Position:= Position;
  //SetTaskBarProgress(Position);
end;

procedure TFormStatus.UpdateProgressBar(Position, Total: Integer);
var
  CalculatePosition: Integer;
begin
  if Total in [0, 1] then
     Exit;
  if not ProgressBarPanel.Visible then
     ProgressBarPanel.Visible:= True;

  //if TaskBarProgress = nil then
  //   begin
  //     TaskBarProgress:= TWin7TaskProgressBar.Create(TaskBarHandle);
  //     TaskBarProgress.Style:= tbpsNormal;
  //     TaskBarProgress.Max:= ProgressBar.Max;
  //     TaskBarProgress.Visible:= True;
  //   end;
     
  CalculatePosition:= Trunc((Position * 100) / Total);
  if CalculatePosition > ProgressBar.Position then
     begin
       ProgressBar.Position:= CalculatePosition;
       //SetTaskBarProgress(CalculatePosition);
     end;
end;

//procedure TFormStatus.ReadSplashSettings;
//begin
//  // this global procedure is neeeded to load current settings into FormStatusCustomize
//  ReadSplashIni;
//end;

procedure TFormStatus.ReadSplashIni;
var
  IniFile: TMemIniFile;

  function SetCustomColorValue(ColorBoxExSource: TColorBoxEx; KeyNameStr: String): Boolean;
  begin
    Result:= True;
    ColorBoxExSource.NoneColorColor:= IniFile.ReadInteger('Splash', KeyNameStr, ColorBoxExSource.DefaultColorColor);
  end;

begin
  if not FileExists(FrontendPath+iSplashFile) then
     begin
       if FormStatus.ImageBk.Bitmap = nil then
          FormStatus.SplashScreenEnableAlternateLogoFile.OnClick(Self);

       UpdateVersionPos;
       Exit;
     end;

  IniFile:= TMemIniFile.Create(FrontendPath+iSplashFile);

  SetSelectedColorBox(SplashScreenTitleTextColor,       IniFile.ReadInteger('Splash', 'TitleTextColor',       SplashScreenTitleTextColor.DefaultColorColor));
  SetSelectedColorBox(SplashScreenMessageTextColor,     IniFile.ReadInteger('Splash', 'MessageTextColor',     SplashScreenMessageTextColor.DefaultColorColor));
  SetSelectedColorBox(SplashScreenTimerTextColor,       IniFile.ReadInteger('Splash', 'TimerTextColor',       SplashScreenTimerTextColor.DefaultColorColor));
  SetSelectedColorBox(SplashScreenSoftwareTextColor,    IniFile.ReadInteger('Splash', 'SoftwareTextColor',    SplashScreenSoftwareTextColor.DefaultColorColor));
  SetSelectedColorBox(SplashScreenVersionInfoTextColor, IniFile.ReadInteger('Splash', 'VersionInfoTextColor', SplashScreenVersionInfoTextColor.DefaultColorColor));
  SetSelectedColorBox(SplashScreenTextShadowColorAll,   IniFile.ReadInteger('Splash', 'TextShadowColorAll',   SplashScreenTextShadowColorAll.DefaultColorColor));

  SetSelectedColorBox(SplashScreenTitleShadowColor,       IniFile.ReadInteger('Splash', 'TitleShadowColor',       SplashScreenTitleShadowColor.DefaultColorColor));
  SetSelectedColorBox(SplashScreenMessageShadowColor,     IniFile.ReadInteger('Splash', 'MessageShadowColor',     SplashScreenMessageShadowColor.DefaultColorColor));
  SetSelectedColorBox(SplashScreenTimerShadowColor,       IniFile.ReadInteger('Splash', 'TimerShadowColor',       SplashScreenTimerShadowColor.DefaultColorColor));
  SetSelectedColorBox(SplashScreenSoftwareShadowColor,    IniFile.ReadInteger('Splash', 'SoftwareShadowColor',    SplashScreenSoftwareShadowColor.DefaultColorColor));
  SetSelectedColorBox(SplashScreenVersionInfoShadowColor, IniFile.ReadInteger('Splash', 'VersionInfoShadowColor', SplashScreenVersionInfoShadowColor.DefaultColorColor));

  FormStatus.SplashScreenTextShadowColor_OneColor.Checked:= Boolean(IniFile.ReadInteger('Splash', 'TextShadow_OneColor', 1));


  VersionPos.ShadowOffset:=   IniFile.ReadInteger('Splash', 'TextShadowDistance',    1);
  VersionPos.ShadowOffset4K:= IniFile.ReadInteger('Splash', 'TextShadowDistance_4K', 3);

  // VersionPos (Left / Top) default values are set in .OnCreate() event and splash.ini is read only once  
  VersionPos.Left:= IniFile.ReadInteger('Splash', 'VersionInfoPositionX', VersionPos.Left);//  6);
  VersionPos.Top:=  IniFile.ReadInteger('Splash', 'VersionInfoPositionY', VersionPos.Top); //228);

  VersionPos.Left4K:= IniFile.ReadInteger('Splash', 'VersionInfoPositionX_4K', VersionPos.Left4K);// 32);
  VersionPos.Top4K:=  IniFile.ReadInteger('Splash', 'VersionInfoPositionY_4K', VersionPos.Top4K); //456);

  VersionPos.Left4Kx2:= IniFile.ReadInteger('Splash', 'VersionInfoPositionX_4Kx2', VersionPos.Left4Kx2);// 70);
  VersionPos.Top4Kx2:=  IniFile.ReadInteger('Splash', 'VersionInfoPositionY_4Kx2', VersionPos.Top4Kx2); //698);

  FormStatus.SplashScreenShowTextShadows.Checked:= Boolean(IniFile.ReadInteger('Splash', 'ShowTextShadows', 1));
  FormStatus.SplashScreenEnableTextsAlternateLayout.Checked:= Boolean(IniFile.ReadInteger('Splash', 'EnableTextsAlternateLayout', 0));

  SetCustomColorValue(FormStatus.SplashScreenProgressBarColorBackTop,    'ProgressBarCustomBackTop');
  SetCustomColorValue(FormStatus.SplashScreenProgressBarColorBackDown,   'ProgressBarCustomBackDown');
  SetCustomColorValue(FormStatus.SplashScreenProgressBarColorBackBorder, 'ProgressBarCustomBackBorder');
  SetCustomColorValue(FormStatus.SplashScreenProgressBarColorBarTop,     'ProgressBarCustomBarTop');
  SetCustomColorValue(FormStatus.SplashScreenProgressBarColorBarDown,    'ProgressBarCustomBarDown');

  SetSelectedComboBox(IniFile.ReadInteger('Splash', 'ProgressBarColorScheme', 1), FormStatus.SplashScreenProgressBarColorScheme); // csDesert is the default

  SplashScreenEnableAlternateLogoFile.Checked:= Boolean(IniFile.ReadInteger('Splash', 'EnableAlternateLogoFile', 0));

  SplashScreen4KUltraSize.Checked:= Boolean(IniFile.ReadInteger('Splash', 'UltraSize_4Kx2', 0));
  if Is4KMode then
     begin
       SetSelectedGaugeBar(VersionPos.ShadowOffset4K, SplashScreenTextShadowDistance);
       if SplashScreen4KUltraSize.Checked then
       begin
         SetSelectedGaugeBar(VersionPos.Left4Kx2, FormStatus.SplashScreenVersionInfoPositionX);
         SetSelectedGaugeBar(VersionPos.Top4Kx2,  FormStatus.SplashScreenVersionInfoPositionY);
       end
       else
       begin
         SetSelectedGaugeBar(VersionPos.Left4K, FormStatus.SplashScreenVersionInfoPositionX);
         SetSelectedGaugeBar(VersionPos.Top4K,  FormStatus.SplashScreenVersionInfoPositionY);
       end;
     end
  else
     begin
       SetSelectedGaugeBar(VersionPos.ShadowOffset, SplashScreenTextShadowDistance);

       SetSelectedGaugeBar(VersionPos.Left, FormStatus.SplashScreenVersionInfoPositionX);
       SetSelectedGaugeBar(VersionPos.Top,  FormStatus.SplashScreenVersionInfoPositionY);
     end;

  FreeAndNil(IniFile);
end;

procedure TFormStatus.WriteSplashSettings;
var
  IniFile: TMemIniFile;
  iFile: String;
begin
  iFile:= FrontendPath+iSplashFile;
  if CheckReadOnly(iFile) then
     Exit;

  DeleteFile(iFile);
  IniFile:= TMemIniFile.Create(iFile);

  IniFile.WriteInteger('Splash', 'EnableAlternateLogoFile',    Ord(FormStatus.SplashScreenEnableAlternateLogoFile.Checked));
  IniFile.WriteInteger('Splash', 'EnableTextsAlternateLayout', Ord(FormStatus.SplashScreenEnableTextsAlternateLayout.Checked));
  IniFile.WriteInteger('Splash', 'ShowTextShadows',            Ord(FormStatus.SplashScreenShowTextShadows.Checked));
  IniFile.WriteInteger('Splash', 'TextShadow_OneColor',        Ord(FormStatus.SplashScreenTextShadowColor_OneColor.Checked));

  IniFile.WriteInteger('Splash', 'TitleTextColor',             FormStatus.SplashScreenTitleTextColor.Selected);
  IniFile.WriteInteger('Splash', 'MessageTextColor',           FormStatus.SplashScreenMessageTextColor.Selected);
  IniFile.WriteInteger('Splash', 'TimerTextColor',             FormStatus.SplashScreenTimerTextColor.Selected);
  IniFile.WriteInteger('Splash', 'SoftwareTextColor',          FormStatus.SplashScreenSoftwareTextColor.Selected);
  IniFile.WriteInteger('Splash', 'TextShadowColorAll',         FormStatus.SplashScreenTextShadowColorAll.Selected);

  IniFile.WriteInteger('Splash', 'TitleShadowColor',       FormStatus.SplashScreenTitleShadowColor.Selected);
  IniFile.WriteInteger('Splash', 'MessageShadowColor',     FormStatus.SplashScreenMessageShadowColor.Selected);
  IniFile.WriteInteger('Splash', 'TimerShadowColor',       FormStatus.SplashScreenTimerShadowColor.Selected);
  IniFile.WriteInteger('Splash', 'SoftwareShadowColor',    FormStatus.SplashScreenSoftwareShadowColor.Selected);
  IniFile.WriteInteger('Splash', 'VersionInfoShadowColor', FormStatus.SplashScreenVersionInfoShadowColor.Selected);

  IniFile.WriteInteger('Splash', 'VersionInfoTextColor', FormStatus.SplashScreenVersionInfoTextColor.Selected);
  IniFile.WriteInteger('Splash', 'VersionInfoPositionX', VersionPos.Left); // FormStatus.SplashScreenVersionInfoPositionX.Position);
  IniFile.WriteInteger('Splash', 'VersionInfoPositionY', VersionPos.Top);  // FormStatus.SplashScreenVersionInfoPositionY.Position);

  IniFile.WriteInteger('Splash', 'VersionInfoPositionX_4K', VersionPos.Left4K);
  IniFile.WriteInteger('Splash', 'VersionInfoPositionY_4K', VersionPos.Top4K);

  IniFile.WriteInteger('Splash', 'VersionInfoPositionX_4Kx2', VersionPos.Left4Kx2);
  IniFile.WriteInteger('Splash', 'VersionInfoPositionY_4Kx2', VersionPos.Top4Kx2);

  IniFile.WriteInteger('Splash', 'TextShadowDistance',    VersionPos.ShadowOffset);
  IniFile.WriteInteger('Splash', 'TextShadowDistance_4K', VersionPos.ShadowOffset4K);

  IniFile.WriteInteger('Splash', 'UltraSize_4Kx2', Ord(SplashScreen4KUltraSize.Checked));

  IniFile.WriteInteger('Splash', 'ProgressBarColorScheme',      FormStatus.SplashScreenProgressBarColorScheme.ItemIndex);
  IniFile.WriteInteger('Splash', 'ProgressBarCustomBackTop',    FormStatus.SplashScreenProgressBarColorBackTop.NoneColorColor);
  IniFile.WriteInteger('Splash', 'ProgressBarCustomBackDown',   FormStatus.SplashScreenProgressBarColorBackDown.NoneColorColor);
  IniFile.WriteInteger('Splash', 'ProgressBarCustomBackBorder', FormStatus.SplashScreenProgressBarColorBackBorder.NoneColorColor);
  IniFile.WriteInteger('Splash', 'ProgressBarCustomBarTop',     FormStatus.SplashScreenProgressBarColorBarTop.NoneColorColor);
  IniFile.WriteInteger('Splash', 'ProgressBarCustomBarDown',    FormStatus.SplashScreenProgressBarColorBarDown.NoneColorColor);

  IniFile.UpdateFile;
  FreeAndNil(IniFile);
end;

procedure TFormStatus.LoadImageLogo;
const
  ImagesFolder: String = 'resources\images\';
  Logo:     array[0..1] of String = ('logo.png',          'logo2.png');
  Logo4K:   array[0..1] of String = ('logo-4K.png',       'logo2-4K.png');
  Logo4Kx2: array[0..1] of String = ('logo-4K_extra.png', 'logo2-4K_extra.png');
var
  iFile, iFolder: String;
begin
  if Is4KMode then
     begin
       if SplashScreen4KUltraSize.Checked then
          iFile:= Logo4Kx2[Ord(SplashScreenEnableAlternateLogoFile.Checked)]
       else
          iFile:= Logo4K  [Ord(SplashScreenEnableAlternateLogoFile.Checked)];
     end
  else
     iFile:= Logo[Ord(SplashScreenEnableAlternateLogoFile.Checked)];

  if Assigned(FormMain) then
     iFolder:= FormMain.GetFolderFull(35)
  else
     iFolder:= FrontendPath+ImagesFolder;
     
  if SplashScreenEnableAlternateLogoFile.Checked then
     begin
       if not FileExists(iFolder+iFile) then
          begin
            if Is4KMode then
               begin
                 if SplashScreen4KUltraSize.Checked then
                    iFile:= Logo4Kx2[0]
                 else
                    iFile:= Logo4K[0];
               end
            else
               iFile:= Logo[0];
          end;
     end;

  if FileExists(iFolder+iFile) then
     begin
       ImageBk.Bitmap:= nil;
       ImageBk.Bitmap.LoadFromFile(iFolder+iFile);
     end;
end;

procedure TFormStatus.StatusChangeLayout;
var
  iHeight4Kx2: Integer;
begin
  if Is4KMode then
  begin
    if SplashScreen4KUltraSize.Checked then
       iHeight4Kx2:= 600
    else
       iHeight4Kx2:= 0;

    if SplashScreenEnableTextsAlternateLayout.Checked then
       begin
         LabelStatusType.Left:= 14;
         LabelTimer.Top:= 1095+iHeight4Kx2; // -35 pixels
         ProgressBarPanel.Top:= LabelTimer.Top+1;
         ProgressBarPanel.Left:= 159;
       end
    else
       begin
         LabelStatusType.Left:= 159;//92;
         LabelTimer.Top:= 1130+iHeight4Kx2;
         ProgressBarPanel.Left:= 14;
         ProgressBarPanel.Top:= 1093+iHeight4Kx2;
       end;
  end
  else
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
      LabelStatusType.Left:= 76;//92;
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
  ToggleEnabled(SplashScreenProgressBarColorBackTop,    (SplashScreenProgressBarColorScheme.ItemIndex = 0) and CustomProgressBar);
  ToggleEnabled(SplashScreenProgressBarColorBackDown,   SplashScreenProgressBarColorBackTop.Enabled);
  ToggleEnabled(SplashScreenProgressBarColorBackBorder, SplashScreenProgressBarColorBackTop.Enabled);
  ToggleEnabled(SplashScreenProgressBarColorBarTop,     SplashScreenProgressBarColorBackTop.Enabled);
  ToggleEnabled(SplashScreenProgressBarColorBarDown,    SplashScreenProgressBarColorBackTop.Enabled);

  SplashScreenProgressBarColorBackTopLabel.Enabled:=    SplashScreenProgressBarColorBackTop.Enabled;
  SplashScreenProgressBarColorBackDownLabel.Enabled:=   SplashScreenProgressBarColorBackTop.Enabled;
  SplashScreenProgressBarColorBackBorderLabel.Enabled:= SplashScreenProgressBarColorBackTop.Enabled;
  SplashScreenProgressBarColorBarTopLabel.Enabled:=     SplashScreenProgressBarColorBackTop.Enabled;
  SplashScreenProgressBarColorBarDownLabel.Enabled:=    SplashScreenProgressBarColorBackTop.Enabled;

  if ProgressBarCopyCurrentColorsToCustomButton.Enabled <> (not SplashScreenProgressBarColorBackTop.Enabled) then
     ProgressBarCopyCurrentColorsToCustomButton.Enabled:=   not SplashScreenProgressBarColorBackTop.Enabled;
end;

procedure TFormStatus.SetProgressBarColorBox;
begin
  if SplashScreenProgressBarColorScheme.ItemIndex = 0 then
     begin
       // user custom colors
       SetSelectedColorBox(SplashScreenProgressBarColorBackTop,    SplashScreenProgressBarColorBackTop.NoneColorColor);
       SetSelectedColorBox(SplashScreenProgressBarColorBackDown,   SplashScreenProgressBarColorBackDown.NoneColorColor);
       SetSelectedColorBox(SplashScreenProgressBarColorBackBorder, SplashScreenProgressBarColorBackBorder.NoneColorColor);
       SetSelectedColorBox(SplashScreenProgressBarColorBarTop,     SplashScreenProgressBarColorBarTop.NoneColorColor);
       SetSelectedColorBox(SplashScreenProgressBarColorBarDown,    SplashScreenProgressBarColorBarDown.NoneColorColor);
     end
  else
     begin
       SetSelectedColorBox(SplashScreenProgressBarColorBackTop,    ProgressBar.BackColorFace);
       SetSelectedColorBox(SplashScreenProgressBarColorBackDown,   ProgressBar.BackColorGrad);
       SetSelectedColorBox(SplashScreenProgressBarColorBackBorder, ProgressBar.ColorBorder);
       SetSelectedColorBox(SplashScreenProgressBarColorBarTop,     ProgressBar.ForeColorFace);
       SetSelectedColorBox(SplashScreenProgressBarColorBarDown,    ProgressBar.ForeColorGrad);
     end;
end;

procedure TFormStatus.ResizeLowResolution;
begin
  if Screen.Width >= 1280 then
     Exit;

  // resize to fit on 1024x768 / 1136x768
  with FormStatus do
  begin
    //ClientHeight:= ImageBk.Height+80; // no... just, no.

    StatusButtonClose.Left:= 898;
    StatusButtonClose.Top:= 10;

    // settings box
    SplashScreenSettingsBox.Left:= 4;
    SplashScreenSettingsBox.Top:= 604;
    SplashScreenSettingsBox.Width:= 135;
    SplashScreenSettingsBox.Height:= 72;

    SplashScreenShowTextShadows.Left:= 4;
    SplashScreenShowTextShadows.Top:= 30;
    SplashScreenEnableAlternateLogoFile.Left:= 4;
    SplashScreenEnableAlternateLogoFile.Top:= 50;

    // text font colors box
    SplashScreenSettingsTextFontColorsBox.Left:= 143;
    SplashScreenSettingsTextFontColorsBox.Top:=  604;
    SplashScreenSettingsTextFontColorsBox.Width:= 833;
    SplashScreenSettingsTextFontColorsBox.Height:= 72;

    SplashScreenTimerTextColorLabel.Left:= 249;
    SplashScreenTimerTextColorLabel.Top:=   23;
    SplashScreenTimerTextColor.Left:= 299;
    SplashScreenTimerTextColor.Top:=   20;

    SplashScreenSoftwareTextColorLabel.Left:= 249;
    SplashScreenSoftwareTextColorLabel.Top:=   47;
    SplashScreenSoftwareTextColor.Left:= 299;
    SplashScreenSoftwareTextColor.Top:=   44;

    SplashScreenVersionInfoTextColorLabel.Left:= 494;
    SplashScreenVersionInfoTextColorLabel.Top:=   23;

    SplashScreenVersionInfoTextColor.Left:= 541;
    SplashScreenVersionInfoTextColor.Top:=   20;

    SplashScreenTextShadowColorAll.Visible:=      False;
    SplashScreenTextShadowColorAllLabel.Visible:= False;

    SplashScreenVersionInfoPositionLabel.Left:= 494;
    SplashScreenVersionInfoPositionLabel.Top:=   47;
    SplashScreenVersionInfoPositionLabel.Visible:=  True;
    SplashScreenVersionInfoPositionXLabel.Visible:= False;
    SplashScreenVersionInfoPositionYLabel.Visible:= False;

    SplashScreenVersionInfoPositionX.Left:=  541;
    SplashScreenVersionInfoPositionX.Top:=    44;
    SplashScreenVersionInfoPositionX.Width:= 116;

    SplashScreenVersionInfoPositionXLabel.Left:= 660;
    SplashScreenVersionInfoPositionXLabel.Top:=   47;

    SplashScreenVersionInfoPositionY.Left:=  688;
    SplashScreenVersionInfoPositionY.Top:=    44;
    SplashScreenVersionInfoPositionY.Width:= 116;

    SplashScreenVersionInfoPositionYLabel.Left:= 807;
    SplashScreenVersionInfoPositionYLabel.Top:=   47;

    ColorsBoxButtonDefault.Left:= 756;
    ColorsBoxButtonDefault.Top:=   19;
    ColorsBoxButtonDefault.Caption:= '';
    ColorsBoxButtonDefault.Width:= 24;

    VersionInfoPositionButtonDefault.Left:= 781;
    VersionInfoPositionButtonDefault.Top:=   19;
    VersionInfoPositionButtonDefault.Caption:= '';
    VersionInfoPositionButtonDefault.Width:= 24;

    ProgressBarSchemeButtonDefault.Left:= 806;
    ProgressBarSchemeButtonDefault.Top:=   19;
    ProgressBarSchemeButtonDefault.Caption:= '';
    ProgressBarSchemeButtonDefault.Width:= 24;
  end;
end;

procedure TFormStatus.SetDefaultVersionPos;
var
  iLeft, iTop: Integer;
begin
  if Is4KMode then
     begin
       if SplashScreen4KUltraSize.Checked then
          begin
            iLeft:= 70;
            iTop:= 698;
          end
       else
          begin
            iLeft:= 32;
            iTop:= 456;
          end;
     end
  else
     begin
       iLeft:=  6;
       iTop:= 228;
     end;
  SplashScreenVersionInfoPositionX.Position:= iLeft;
  SplashScreenVersionInfoPositionY.Position:= iTop;
end;

procedure TFormStatus.FormCreate(Sender: TObject);
begin
  iSplashFile:= 'ini_files\splash.ini';
  CustomProgressBar:= Screen.Width >= 1280;

  mmResult:= 0;
  LabelStatusType.Caption:= '';
  LabelMessage.Caption:= '';

  // set default values of "Version Info" label
  VersionPos.Left:=   6;
  VersionPos.Top:=  228;

  VersionPos.Left4K:= 32;
  VersionPos.Top4K:= 456;

  VersionPos.Left4Kx2:= 70;
  VersionPos.Top4Kx2:= 698;

  VersionPos.ShadowOffset:=   1; // all labels
  VersionPos.ShadowOffset4K:= 3; // all labels
end;

procedure TFormStatus.FormShow(Sender: TObject);
begin
  if Application.Terminated then
     begin
       PostMessage(Handle, wm_Close, 0, 0);
       Exit;
     end;

  if LabelVersion.Tag = 0 then
     begin
       // only execute these at startup
       if Is4KMode then
          begin
            SplashScreenVersionInfoPositionX.Max:= 3000;
            SplashScreenVersionInfoPositionY.Max:= 3000;
          end;

       ReadSplashIni;
       Resize4K(True, False); // only set Form size and logo image size (do not load logo image)
       ResizeLowResolution;
       if not StatusButtonClose.Visible then
          begin
            ClientWidth:=  ImageBk.Width; // hide settings panel
            ClientHeight:= ImageBk.Height;
          end;
       LabelVersion.Tag:= 1; // do not execute anymore
       if Is4KMode then
          LabelMessage.Left:= 14 // default left position
       else
          LabelMessage.Left:= 4; // default left position

       SplashScreenEnableAlternateLogoFile.OnClick(Self); // load logo image

       Resize4K(False, True); // resize/move controls
       if Screen.Cursor <> crDefault then
          Screen.Cursor:= crDefault;
     end;

  if StatusButtonClose.Visible then
  begin
    // customize mode
    LabelVersion.Frames:= [lfrLeft, lfrTop, lfrRight, lfrBottom];
    if Is4KMode then
       ClientWidth:= SplashScreenSettingsTextFontColorsBox.Left+SplashScreenSettingsTextFontColorsBox.Width+20
    else
       begin
         if SplashScreenSettingsTextFontColorsBox.Top = 4 then
            begin
              ClientWidth:=  SplashScreenSettingsTextFontColorsBox.Left+SplashScreenSettingsTextFontColorsBox.Width+4;
              ClientHeight:= SplashScreenSettingsTextFontColorsBox.Top+SplashScreenSettingsTextFontColorsBox.Height+4;
            end
         else
            begin
              ClientHeight:= SplashScreenSettingsTextFontColorsBox.Top+SplashScreenSettingsTextFontColorsBox.Height+4;
            end;
       end;

    SetProgressPos(55);
    FormMain.SetLabelSoftwareScanCountVisible(True); // for splash screen
    ProgressBarPanel.Visible:=  True;
    StatusButtonClose.Visible:= True;
    LabelVersion.Cursor:= crHandPoint;
    LabelVersion.ShowHint:= True;
    TitleStr('Force Incomplete Games Available [.zip; .7z]: Supermodel: A Sega Model 3 Arcade Emulator');
    MessageStr('Parsing "hbmame_listxml.xml" (3rd pass). Adding parent sections and listing parents with BIOS.');
    FormMain.SetFormKeyPreview(FormStatus); // FormStatus.KeyPreview:= True; // enable ESC key detection to close FormStatus

    if FormStatus.Tag <> 0 then
       CallCenterWindow(FormStatus, Is4KMode and SplashScreen4KUltraSize.Checked);
  end;

  if FormStatus.Tag = 0 then
     begin
       SetWindowPos(FormStatus.Handle, hWnd_TopMost, 0, 0, 0, 0, SWP_NOMOVE+SWP_NOSIZE); // this prevent form flicker (using Form.StayOnTop causes flicker)
       CallCenterWindow(FormStatus, Is4KMode and SplashScreen4KUltraSize.Checked);
       FormStatus.Tag:= 1;
     end;
end;

procedure TFormStatus.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if CanClose then
     begin
       if mmResult <> 0 then
          StopThreadClock; // force timer clock to stop when closing the status screen
       SetProgressPos(0);  // reset progress bar position (required)
       TitleStr('');       // clean title message    (cosmetic fix, not required)
       MessageStr('');     // clean detailed message (cosmetic fix, not required)
       if ProgressBarPanel.Visible then
          ProgressBarPanel.Visible:= False;
     end;
end;

procedure TFormStatus.StatusButtonCloseClick(
  Sender: TObject);
begin
  if not StatusButtonClose.Visible then
     Exit;

  // customize splash mode
  FormStatus.LabelVersion.Cursor:= crDefault;
  FormStatus.LabelVersion.ShowHint:= False;
  FormStatus.WriteSplashSettings; // save settings in "ini_files\splash.ini"

  if FormStatus.ClientWidth <> ImageBk.Width then
     FormStatus.ClientWidth:=  ImageBk.Width;

  if FormStatus.ClientHeight <> ImageBk.Height then
     FormStatus.ClientHeight:=  ImageBk.Height;

  LabelVersion.Frames:= [];
  StatusButtonClose.Visible:= False;
  FormMain.SetLabelSoftwareScanCountVisible(False);

  FormMain.SetFormKeyPreview(FormStatus); // FormStatus.KeyPreview:= False; // disable ESC key detection
  CallCenterWindow(FormStatus, Is4KMode and SplashScreen4KUltraSize.Checked);
  Close;
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
  SplashScreenVersionInfoPositionXPosLabel.Caption:= IntToStr(SplashScreenVersionInfoPositionX.Position);
  if LabelVersion.Left <> SplashScreenVersionInfoPositionX.Position then
     begin
       LabelVersion.Left:= SplashScreenVersionInfoPositionX.Position;
       if Is4KMode then
          begin
            if SplashScreen4KUltraSize.Checked then
               VersionPos.Left4Kx2:= LabelVersion.Left
            else
               VersionPos.Left4K:=   LabelVersion.Left;
          end
       else
          VersionPos.Left:= LabelVersion.Left;
     end;
end;

procedure TFormStatus.SplashScreenVersionInfoPositionYChange(
  Sender: TObject);
begin
  SplashScreenVersionInfoPositionYPosLabel.Caption:= IntToStr(SplashScreenVersionInfoPositionY.Position);
  if LabelVersion.Top <> SplashScreenVersionInfoPositionY.Position then
     begin
       LabelVersion.Top:= SplashScreenVersionInfoPositionY.Position;
       if Is4KMode then
          begin
            if SplashScreen4KUltraSize.Checked then
               VersionPos.Top4Kx2:= LabelVersion.Top
            else
               VersionPos.Top4K:=   LabelVersion.Top;
          end
       else
          VersionPos.Top:= LabelVersion.Top;
     end;
end;

procedure TFormStatus.ChangeTextShadowColor;
begin
  if SplashScreenTextShadowColor_OneColor.Checked then
     begin
       LabelStatusType.ShadowColor:=        SplashScreenTextShadowColorAll.Selected;
       LabelMessage.ShadowColor:=           SplashScreenTextShadowColorAll.Selected;
       LabelTimer.ShadowColor:=             SplashScreenTextShadowColorAll.Selected;
       LabelSoftwareScanCount.ShadowColor:= SplashScreenTextShadowColorAll.Selected;
       LabelVersion.ShadowColor:=           SplashScreenTextShadowColorAll.Selected;
     end
  else
     begin
       SetSelectedColorBox(SplashScreenTitleShadowColor,       -1, False);
       SetSelectedColorBox(SplashScreenTitleShadowColor,       -1, False);
       SetSelectedColorBox(SplashScreenMessageShadowColor,     -1, False);
       SetSelectedColorBox(SplashScreenTimerShadowColor,       -1, False);
       SetSelectedColorBox(SplashScreenSoftwareShadowColor,    -1, False);
       SetSelectedColorBox(SplashScreenVersionInfoShadowColor, -1, False);
     end;
end;

procedure TFormStatus.SplashScreenTextShadowColorAllSelect(Sender: TObject);
begin
  if SplashScreenTextShadowColor_OneColor.Checked then
     ChangeTextShadowColor;
end;

procedure TFormStatus.SplashScreenTextShadowDistanceChange(Sender: TObject);
begin
  SplashScreenTextShadowDistancePosLabel.Caption:= IntToStr(SplashScreenTextShadowDistance.Position);
       
  LabelStatusType.ShadowOffset:=        SplashScreenTextShadowDistance.Position;
  LabelMessage.ShadowOffset:=           SplashScreenTextShadowDistance.Position;
  LabelTimer.ShadowOffset:=             SplashScreenTextShadowDistance.Position;
  LabelSoftwareScanCount.ShadowOffset:= SplashScreenTextShadowDistance.Position;
  LabelVersion.ShadowOffset:=           SplashScreenTextShadowDistance.Position;

  if Is4KMode then
     VersionPos.ShadowOffset4K:= SplashScreenTextShadowDistance.Position
  else
     VersionPos.ShadowOffset:=   SplashScreenTextShadowDistance.Position;
end;

procedure TFormStatus.SplashScreenShowTextShadowsClick(Sender: TObject);
begin
  LabelStatusType.ShadowEnabled:=        SplashScreenShowTextShadows.Checked;
  LabelMessage.ShadowEnabled:=           SplashScreenShowTextShadows.Checked;
  LabelTimer.ShadowEnabled:=             SplashScreenShowTextShadows.Checked;
  LabelSoftwareScanCount.ShadowEnabled:= SplashScreenShowTextShadows.Checked;
  LabelVersion.ShadowEnabled:=           SplashScreenShowTextShadows.Checked;
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
  if LabelVersion.Tag <> 0 then // initial setting, do not change anything
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
  SetDefaultVersionPos;
end;

procedure TFormStatus.SplashScreenVersionInfoTextColorSelect(
  Sender: TObject);
begin
  LabelVersion.Font.Color:= SplashScreenVersionInfoTextColor.Selected;
  LabelVersion.ColorFrame:= SplashScreenVersionInfoTextColor.Selected;
end;

procedure TFormStatus.SplashScreenProgressBarColorSchemeSelect(
  Sender: TObject);
begin
  if (SplashScreenProgressBarColorScheme.ItemIndex = 0) and (not CustomProgressBar) then
     ProgressBar.ColorScheme:= csDesert
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

procedure TFormStatus.SplashScreenTextShadowColor_OneColorClick(
  Sender: TObject);
begin
  ChangeTextShadowColor;
end;

procedure TFormStatus.SplashScreenTitleShadowColorSelect(Sender: TObject);
begin
  if not SplashScreenTextShadowColor_OneColor.Checked then
     LabelStatusType.ShadowColor:= SplashScreenTitleShadowColor.Selected;
end;

procedure TFormStatus.SplashScreenMessageShadowColorSelect(
  Sender: TObject);
begin
  if not SplashScreenTextShadowColor_OneColor.Checked then
     LabelMessage.ShadowColor:= SplashScreenMessageShadowColor.Selected;
end;

procedure TFormStatus.SplashScreenTimerShadowColorSelect(Sender: TObject);
begin
  if not SplashScreenTextShadowColor_OneColor.Checked then
     LabelTimer.ShadowColor:= SplashScreenTimerShadowColor.Selected;
end;

procedure TFormStatus.SplashScreenSoftwareShadowColorSelect(
  Sender: TObject);
begin
  if not SplashScreenTextShadowColor_OneColor.Checked then
     LabelSoftwareScanCount.ShadowColor:= SplashScreenSoftwareShadowColor.Selected;
end;

procedure TFormStatus.SplashScreenVersionInfoShadowColorSelect(
  Sender: TObject);
begin
  if not SplashScreenTextShadowColor_OneColor.Checked then
     LabelVersion.ShadowColor:= SplashScreenVersionInfoShadowColor.Selected;
end;

procedure TFormStatus.SplashScreen4KUltraSizeClick(Sender: TObject);
begin
  if LabelVersion.Tag = 0 then
     Exit; // initiallizing, do not change anything yet (FormStatus has just been created)
  if Is4KMode then
     Resize4K(True, True);
end;

// drag and drop version info label
procedure TFormStatus.LabelVersionMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if not StatusButtonClose.Visible then
     Exit;
  XOffset:= X;
  YOffset:= Y;
  LabelVersion.BeginDrag(True);
end;

procedure TFormStatus.ImageBkDragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
begin
  if TShadowLabel(Source) = LabelVersion then
     begin
       Accept:= True;
     end;
end;

procedure TFormStatus.ImageBkDragDrop(Sender, Source: TObject; X,
  Y: Integer);
begin
  LabelVersion.Left:= X-XOffset;
  LabelVersion.Top:=  Y-YOffset;
end;

procedure TFormStatus.LabelVersionDragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
begin
  if TShadowLabel(Source) = LabelVersion then
     begin
       Accept:= True;
     end;
end;

procedure TFormStatus.LabelVersionDragDrop(Sender, Source: TObject; X,
  Y: Integer);
begin
  LabelVersion.Left:= LabelVersion.Left +X-XOffset;
  LabelVersion.Top:=  LabelVersion.Top  +Y-YOffset;
end;

procedure TFormStatus.LabelVersionEndDrag(Sender, Target: TObject; X,
  Y: Integer);
begin
  if LabelVersion.Left > (ImageBk.Width-LabelVersion.Width) then
     LabelVersion.Left:= ImageBk.Width-LabelVersion.Width
  else
  if LabelVersion.Left < ImageBk.Left then
     LabelVersion.Left:= ImageBk.Left;

  if LabelVersion.Top > (ImageBk.Height-LabelVersion.Height) then
     LabelVersion.Top:= ImageBk.Height-LabelVersion.Height
  else
  if LabelVersion.Top < ImageBk.Top then
     LabelVersion.Top:= ImageBk.Top;

  if SplashScreenVersionInfoPositionX.Position <> LabelVersion.Left then
     SplashScreenVersionInfoPositionX.Position:=  LabelVersion.Left;
  if SplashScreenVersionInfoPositionY.Position <> LabelVersion.Top then
     SplashScreenVersionInfoPositionY.Position:=  LabelVersion.Top;
end;


end.
