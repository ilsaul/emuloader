unit uDaphneSettings;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, ComCtrls, PanelEx,
  ImgList, IniFiles, GR32_RangeBars, AdvOfficeButtons, AdvGroupBox,
  ShadowLabel, Buttons, ButtonsEx, ColorBoxEx;

const
  LaserDiscTypeList: packed array[0..6] of packed array[0..1] of String =
    (('vldp',    'Virtual Laser Disc Player (Default)'),
     ('hitachi', 'Hitachi VIP-9550'),
     ('philips', 'Philips Player'),
     ('pioneer', 'Pioneer Common Players'),
     ('v6000',   'Pioneer LD-V6000 Players'),
     ('sony',    'Sony Players'),
     ('noldp',   'No Laserdisc Player (testing only)'));

type
  TFormDaphneSettings = class(TForm)
    TopBar: TPanelEx;
    GeneralBox: TAdvGroupBoxEx;
    LaserDiscTypeLabel: TShadowLabel;
    LaserDiscType: TComboBox2Ex;
    Daphne_NoJoysticks: TAdvOfficeCheckBoxEx;
    SRAMContinuousUpdate: TAdvOfficeCheckBoxEx;
    FastBoot: TAdvOfficeCheckBoxEx;
    StopLaserdiscPlayer: TAdvOfficeCheckBoxEx;
    Daphne_NoLog: TAdvOfficeCheckBoxEx;
    Daphne_NoWarnings: TAdvOfficeCheckBoxEx;
    SendUsageStatistics: TAdvOfficeCheckBoxEx;
    EnableCheat: TAdvOfficeCheckBoxEx;
    VideoBox: TAdvGroupBoxEx;
    ScreenResolutionLabel: TShadowLabel;
    ScreenResolution: TComboBox2Ex;
    Daphne_FullScreen: TAdvOfficeCheckBoxEx;
    FullScale: TAdvOfficeCheckBoxEx;
    IgnoreAspectRatio: TAdvOfficeCheckBoxEx;
    Daphne_OpenGL: TAdvOfficeCheckBoxEx;
    BlankSearches: TAdvOfficeCheckBoxEx;
    BlankSkips: TAdvOfficeCheckBoxEx;
    AudioBox: TAdvGroupBoxEx;
    NoSound: TAdvOfficeCheckBoxEx;
    Daphne_PreferSamples: TAdvOfficeCheckBoxEx;
    ButtonReadFile: TBitBtnEx;
    ButtonOk: TBitBtnEx;
    ButtonCancel: TBitBtnEx;
    AudioVolumeVLDPLabel: TShadowLabel;
    AudioVolumeVLDP: TGaugeBar;
    IdleExit: TAdvOfficeCheckBoxEx;
    IdleExitValue: TGaugeBar;
    SystemIcon: TImage;
    GameIcon: TImage;
    LabelGameTitle: TShadowLabel;
    LabelEmulatorFile: TShadowLabel;
    LabelReadFileIni: TShadowLabel;
    procedure FormShow(Sender: TObject);
    procedure ButtonReadFileClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure IdleExitValueChange(Sender: TObject);
    procedure AudioVolumeVLDPChange(Sender: TObject);
  private
    { Private declarations }
    procedure ReadIni(iniFileStr: String);
    procedure WriteIni(const customIniFileStr: String);
  public
    { Public declarations }
    emuIni,
    GameIni,
    emuFileExec,
    emuVersionStr: String;
  end;

var
  FormDaphneSettings: TFormDaphneSettings;

implementation

uses uMain, uCommon;

{$R *.dfm}

procedure TFormDaphneSettings.ReadIni(IniFileStr: String);
var
  IniFile: TMemIniFile;
  StrValue: String;
  IntValue: Integer;
begin
  IniFile:= TMemIniFile.Create(IniFileStr);

  StrValue:= IniFile.ReadString('General', 'LaserdiscType', 'vldp');
  for IntValue:= Low(LaserdiscTypeList) to High(LaserdiscTypeList) do
  begin
    if LaserdiscTypeList[IntValue, 0] = StrValue then
       Break;
  end;
  if IntValue = -1 then
     IntValue:= 0;
     
  LaserDiscType.ItemIndex:= IntValue;

  StrValue:= IniFile.ReadString('Video', 'ScrResolution', 'auto');
  if StrValue = 'auto' then
     ScreenResolution.ItemIndex:= 0
  else
     begin
       IntValue:= ScreenResolution.Items.IndexOf(StrValue);
       if IntValue <> -1 then
          ScreenResolution.ItemIndex:= IntValue
       else
          ScreenResolution.ItemIndex:= 0;
     end;

  Daphne_OpenGL.Checked:= Boolean(IniFile.ReadInteger('Video', 'OpenGL', 0));
  Daphne_FullScreen.Checked:= Boolean(IniFile.ReadInteger('Video', 'FullScreen', 0));
  IgnoreAspectRatio.Checked:= Boolean(IniFile.ReadInteger('Video', 'IgnoreAspectRatio', 0)); // -ignore_aspect_ratio
  FullScale.Checked:= Boolean(IniFile.ReadInteger('Video', 'FullScale', 0)); // -fullscale

  BlankSkips.Checked:= Boolean(IniFile.ReadInteger('Video', 'BlankSkips', 0)); // -blank_skips
  BlankSearches.Checked:= Boolean(IniFile.ReadInteger('Video', 'BlankSearches', 0)); // -blank_searches


  Daphne_PreferSamples.Checked:= Boolean(IniFile.ReadInteger('Audio', 'PreferSamples', 0));
  NoSound.Checked:= Boolean(IniFile.ReadInteger('Audio', 'NoSound', 0)); // -nosound
  AudioVolumeVLDP.Position:= IniFile.ReadInteger('Audio', 'VolumeVLDP', -1); // -volume_vldp

  Daphne_NoJoysticks.Checked:= Boolean(IniFile.ReadInteger('Input', 'NoJoysticks', 0));

  Daphne_NoLog.Checked:= Boolean(IniFile.ReadInteger('General', 'NoCreateLogFile', 1));
  Daphne_NoWarnings.Checked:= Boolean(IniFile.ReadInteger('General', 'NoWarnings', 0));
  SendUsageStatistics.Checked:= Boolean(IniFile.ReadInteger('General', 'SendUsageStatistics', 1)); // -noserversend

  IdleExit.Checked:= Boolean(IniFile.ReadInteger('General', 'IdleExit', 0)); // -idleexit <seconds>
  IdleExitValue.Position:= IniFile.ReadInteger('General', 'IdleExitSeconds', 30);
  EnableCheat.Checked:= Boolean(IniFile.ReadInteger('General', 'EnableCheat', 0)); // -cheat
  SRAMContinuousUpdate.Checked:= Boolean(IniFile.ReadInteger('General', 'SRAMContinuousUpdate', 0)); // -sram_continuous_update

  FastBoot.Checked:= Boolean(IniFile.ReadInteger('General', 'FastBoot', 0)); // -fastboot

  StopLaserdiscPlayer.Checked:= Boolean(IniFile.ReadInteger('General', 'StopLaserdiscOnQuit', 0)); // -stoponquit

  FreeAndNil(IniFile);
end;

procedure TFormDaphneSettings.WriteIni(const customIniFileStr: String);
var
  IniFile: TMemIniFile;
begin
  CheckAndCreateFolder(ExtractFilePath(customIniFileStr)); // make sure the destination path exists
  IniFile:= TMemIniFile.Create(customIniFileStr);
  IniFile.WriteString('General', 'LaserdiscType', LaserdiscTypeList[LaserDiscType.ItemIndex, 0]);
  IniFile.WriteInteger('General', 'NoCreateLogFile', Ord(Daphne_NoLog.Checked));

  if ScreenResolution.ItemIndex = 0 then
     IniFile.WriteString('Video', 'ScrResolution', 'auto')
  else
     IniFile.WriteString('Video', 'ScrResolution', ScreenResolution.Text);
  IniFile.WriteInteger('Video', 'OpenGL', Ord(Daphne_OpenGL.Checked));
  IniFile.WriteInteger('Video', 'FullScreen', Ord(Daphne_FullScreen.Checked));
  IniFile.WriteInteger('Video', 'IgnoreAspectRatio', Ord(IgnoreAspectRatio.Checked));
  IniFile.WriteInteger('Video', 'FullScale', Ord(FullScale.Checked));

  IniFile.WriteInteger('Input', 'NoJoysticks', Ord(Daphne_NoJoysticks.Checked));
  IniFile.WriteInteger('General', 'NoWarnings', Ord(Daphne_NoWarnings.Checked));
  IniFile.WriteInteger('Audio', 'PreferSamples', Ord(Daphne_PreferSamples.Checked));
  IniFile.WriteInteger('General', 'SendUsageStatistics', Ord(SendUsageStatistics.Checked));
  IniFile.WriteInteger('Audio', 'NoSound', Ord(NoSound.Checked));
  IniFile.WriteInteger('Audio', 'VolumeVLDP', AudioVolumeVLDP.Position);


  IniFile.WriteInteger('General', 'IdleExit', Ord(IdleExit.Checked));
  IniFile.WriteInteger('General', 'IdleExitSeconds', IdleExitValue.Position);

  IniFile.WriteInteger('General', 'EnableCheat', Ord(EnableCheat.Checked));

  IniFile.WriteInteger('Video', 'IgnoreAspectRatio', Ord(IgnoreAspectRatio.Checked));

  IniFile.WriteInteger('General', 'SRAMContinuousUpdate', Ord(SRAMContinuousUpdate.Checked));
  IniFile.WriteInteger('General', 'FastBoot', Ord(FastBoot.Checked));

  IniFile.WriteInteger('General', 'StopLaserdiscOnQuit', Ord(StopLaserdiscPlayer.Checked));

  IniFile.UpdateFile;
  FreeAndNil(IniFile);
end;

procedure TFormDaphneSettings.FormShow(Sender: TObject);
var
  Loop: Integer;
begin
  if IsNightMode then
  begin
    for Loop:= 0 to FormDaphneSettings.ComponentCount-1 do
    begin
      if FormDaphneSettings.Components[Loop] is TBitBtnEx then
         FormMain.SetButtonExColors(TBitBtnEx(FormDaphneSettings.Components[Loop]))
      else
      if FormDaphneSettings.Components[Loop] is TAdvGroupBoxEx then
         begin
           SetGroupBoxBorderStyle(TAdvGroupBoxEx(FormDaphneSettings.Components[Loop]));
           SetGroupBoxColors(TAdvGroupBoxEx(FormDaphneSettings.Components[Loop]),
                             clrBorderGroupBoxGrayBk, clrInnerBorderGroupBoxGrayBk,
                             item_caption_active_color[1], item_caption_active_shadow_color[1], -1, clrMedDarkGray, False);
         end
      else
      if FormDaphneSettings.Components[Loop] is TComboBox2Ex then
         SetComboBox2ExColors(TComboBox2Ex(FormDaphneSettings.Components[Loop]), True)
      else
      if FormDaphneSettings.Components[Loop] is TGaugeBar then
         SetGaugeBarColors(TGaugeBar(FormDaphneSettings.Components[Loop]))
      else
      if FormDaphneSettings.Components[Loop] is TAdvOfficeCheckBoxEx then
         begin
           SetCheckBoxColors(TAdvOfficeCheckBoxEx(FormDaphneSettings.Components[Loop]), item_caption_active_color[1], item_caption_active_shadow_color[1], False);
           TAdvOfficeCheckBoxEx(FormDaphneSettings.Components[Loop]).DisabledFontColor:= clGray;
           TAdvOfficeCheckBoxEx(FormDaphneSettings.Components[Loop]).DisabledFontShadowColor:= clrMedDarkGray;
         end;
      if FormDaphneSettings.Components[Loop] is TShadowLabel then
         SetLabelColors(TShadowLabel(FormDaphneSettings.Components[Loop]), item_caption_active_color[1], item_caption_active_shadow_color[1], False);
    end;
    SetFormColors(FormDaphneSettings, nil, nil, LabelGameTitle, LabelEmulatorFile, nil, -1, IsNightMode);
    SetColorEmulatorTopBar(TopBar, idDaphne, True);
    SetLabelColors(LabelReadFileIni, LabelEmulatorFile.Font.Color, LabelEmulatorFile.ShadowColor, False);
  end;
  
  LaserdiscType.Items.BeginUpdate;
  for Loop:= Low(LaserdiscTypeList) to High(LaserdiscTypeList) do
      LaserdiscType.Items.Add(LaserdiscTypeList[Loop, 1]);
  LaserdiscType.Items.EndUpdate;
  LaserdiscType.ItemIndex:= 0;

  //FormMain.IL_ArcadeSystem_ExtraLarge.GetIcon(idDaphne, SystemIcon.Picture.Icon);
  FormMain.LoadIconIntoImage(FormMain.GetArcadeSystemIconFileName(idDaphne), SystemIcon);
  FormMain.LoadMessageIcon(GameIcon, 'info.ico');

  LabelGameTitle.Caption:= FormMain.GetArcadeGameSysTitle(Tag = 1, idDaphne, emuVersionStr);
  LabelEmulatorFile.Caption:= emuFileExec; //FormMain.EmulatorFile[idDaphne];
  //if FormMain.EmulatorVersion[idDaphne] <> '' then
  //   LabelEmulatorVersion.Caption:= FormMain.EmulatorVersion[idDaphne]
  //else
  //   LabelEmulatorVersion.Caption:= '';

  AudioBox.DoubleBuffered:= True;
  IdleExit.DoubleBuffered:= True;
  ListScreenModes(ScreenResolution.Items, True);
  ScreenResolution.ItemIndex:= 0;

  ButtonReadFile.Click;
  Screen.Cursor:= crDefault;
end;

procedure TFormDaphneSettings.ButtonReadFileClick(Sender: TObject);
begin
  ReadIni(emuIni);
end;

procedure TFormDaphneSettings.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #27 then
     ButtonCancel.Click;
end;

procedure TFormDaphneSettings.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if CanClose then
     begin
       if ModalResult = mrOk then
          begin
            case FormDaphneSettings.Tag of
              0: WriteIni(emuIni); // default options
              1: WriteIni(GameIni); // game options
            end;
          end;
       SetCurrentDir(FormMain.FrontendPath);
     end;
end;

procedure TFormDaphneSettings.IdleExitValueChange(Sender: TObject);
begin
  IdleExit.Caption:= Format(IdleExitValue.Hint, [GetPlayTime(IdleExitValue.Position*1000)]);
  if IdleExitValue.Position < 60 then
     IdleExit.Caption:= IdleExit.Caption+'sec]'
  else
     IdleExit.Caption:= IdleExit.Caption+'min]';
end;

procedure TFormDaphneSettings.AudioVolumeVLDPChange(Sender: TObject);
begin
  case AudioVolumeVLDP.Position of
    -1: AudioVolumeVLDPLabel.Caption:= Format(AudioVolumeVLDPLabel.Hint, ['Auto']);
     0: AudioVolumeVLDPLabel.Caption:= Format(AudioVolumeVLDPLabel.Hint, ['Muted']);
  else
     AudioVolumeVLDPLabel.Caption:= Format(AudioVolumeVLDPLabel.Hint, [IntToStr(AudioVolumeVLDP.Position)]);
  end;
end;

end.
