unit uDOSMAMEConfig;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, GR32_RangeBars, ExtCtrls, ComCtrls, ImgList, GR32_Image,
  uGR32Extra;

type
  TFormDOSMAMEConfiguration = class(TForm)
    MAMEConfigImageList: TImageList;
    PageControlMAMEOptions: TPageControl;
    TabSheetDOSMAMEFolders: TTabSheet;
    TabSheetDOSMAMEOptions: TTabSheet;
    PageControlOptions: TPageControl;
    TabSheetDOSMAMEDisplay: TTabSheet;
    LabelSkipColumnsValue: TLabel;
    LabelSkipLinesValue: TLabel;
    LabelResolution: TLabel;
    LabelDepth: TLabel;
    LabelVESA: TLabel;
    LabelCenterX: TLabel;
    LabelSkipColumns: TLabel;
    LabelMonitor: TLabel;
    LabelCenterY: TLabel;
    LabelSkipLines: TLabel;
    LabelGamma: TLabel;
    LabelCenterXValue: TLabel;
    LabelCenterYValue: TLabel;
    LabelDOSMAMEVGAFrequency: TLabel;
    LabelVGAFrequencyValue: TLabel;
    LabelDepthValue: TLabel;
    LabelGammaValue: TLabel;
    LabelVESAValue: TLabel;
    LabelMonitorValue: TLabel;
    LabelResolutionValue: TLabel;
    CenterX: TGaugeBar;
    SkipColumns: TGaugeBar;
    SkipLines: TGaugeBar;
    CenterY: TGaugeBar;
    VGAFrequency: TGaugeBar;
    Depth: TGaugeBar;
    Gamma: TGaugeBar2;
    VESA: TGaugeBar;
    Monitor: TGaugeBar;
    Resolution: TGaugeBar;
    TabSheetDOSMAMESoundControllers: TTabSheet;
    TabSheetDOSMAMEMiscellaneous: TTabSheet;
    ButtonOk: TButton;
    ButtonCancel: TButton;
    ReadMAMEcfg: TButton;
    LabelSound: TGroupBox;
    LabelSoundCard: TLabel;
    SoundCard: TGaugeBar;
    LabelSoundCardValue: TLabel;
    SampleRate: TGaugeBar;
    LabelSampleRate: TLabel;
    LabelSampleRateValue: TLabel;
    LabelVolume: TLabel;
    Volume: TGaugeBar;
    LabelVolumeValue: TLabel;
    LabelCustomSampleRate: TLabel;
    CustomSampleRate: TGaugeBar;
    LabelCustomSampleRateValue: TLabel;
    Stereo: TCheckBox;
    DetectSampleRate: TCheckBox;
    Samples: TCheckBox;
    ResampleFilter: TCheckBox;
    LabelControllers: TGroupBox;
    LabelJoystick: TLabel;
    Joystick: TGaugeBar;
    LabelJoystickValue: TLabel;
    SteadyKey: TCheckBox;
    Mouse: TCheckBox;
    LabelTweaks: TGroupBox;
    Tweak: TCheckBox;
    Cheat: TCheckBox;
    LabelExternalFiles: TGroupBox;
    LabelCheatFile: TLabel;
    FilenameCheat: TEdit;
    LabelMAMEInfoFile: TLabel;
    FilenameMAMEInfo: TEdit;
    LabelHistoryFile: TLabel;
    FilenameHistory: TEdit;
    FilenameCheatButtonSelect: TButton;
    FilenameHistoryButtonSelect: TButton;
    FilenameMAMEInfoButtonSelect: TButton;
    DisplayImage: TImage32Ex;
    SoundControllersImage: TImage32Ex;
    MiscellaneousImage: TImage32Ex;
    PageControlFolders: TPageControl;
    TabSheetFolders1: TTabSheet;
    TabSheetFolders2: TTabSheet;
    GeneralFolders1Image: TImage32Ex;
    GeneralFolders2Image: TImage32Ex;
    LabelFolderSamples: TGroupBox;
    LabelFolderROMs: TGroupBox;
    FolderROMs: TEdit;
    FolderROMsButtonSelect: TButton;
    FolderSamples: TEdit;
    FolderSamplesButtonSelect: TButton;
    LabelFolderGamesConfiguration: TGroupBox;
    LabelFolderSaveStates: TGroupBox;
    FolderGamesConfiguration: TEdit;
    FolderGamesConfigurationButtonSelect: TButton;
    LabelFolderHighScores: TGroupBox;
    FolderSaveStates: TEdit;
    FolderSaveStatesButtonSelect: TButton;
    LabelFolderNVRAM: TGroupBox;
    LabelFolderMemoryCards: TGroupBox;
    LabelFolderGamesRecording: TGroupBox;
    FolderHighScores: TEdit;
    FolderHighScoresButtonSelect: TButton;
    FolderNVRAM: TEdit;
    FolderNVRAMButtonSelect: TButton;
    FolderMemoryCards: TEdit;
    FolderMemoryCardsButtonSelect: TButton;
    FolderInputsRecording: TEdit;
    FolderInputsRecordingButtonSelect: TButton;
    LabelFolderArtworks: TGroupBox;
    LabelFolderInGameSnapshots: TGroupBox;
    LabelFolderCheats: TGroupBox;
    FolderArtworks: TEdit;
    FolderArtworksButtonSelect: TButton;
    LabelFolderDiff: TGroupBox;
    FolderSnapshots: TEdit;
    FolderSnapshotsButtonSelect: TButton;
    FolderCheats: TEdit;
    FolderCheatsButtonSelect: TButton;
    FolderDiff: TEdit;
    FolderDiffButtonSelect: TButton;
    TabSheetDOSMAMEDisplay2: TTabSheet;
    LabelVector: TGroupBox;
    LabelFlicker: TLabel;
    LabelFlickerValue: TLabel;
    LabelBeam: TLabel;
    LabelBeamValue: TLabel;
    LabelVectorResolution: TLabel;
    LabelVectorResolutionValue: TLabel;
    Antialias: TCheckBox;
    Flicker: TGaugeBar2;
    Beam: TGaugeBar2;
    VectorResolution: TGaugeBar;
    Translucency: TCheckBox;
    Display2Image: TImage32Ex;
    LabelArtwork: TGroupBox;
    LabelArtworkResolution: TLabel;
    LabelArtworkResolutionValue: TLabel;
    Artwork: TCheckBox;
    Backdrop: TCheckBox;
    Overlay: TCheckBox;
    Bezel: TCheckBox;
    Crop: TCheckBox;
    ArtworkResolution: TGaugeBar;
    Throttle: TCheckBox;
    KeyboardLEDs: TCheckBox;
    LabelIntensity: TLabel;
    Intensity: TGaugeBar2;
    LabelIntensityValue: TLabel;
    LabelCustomResolution: TLabel;
    CustomResolution: TEdit;
    Scanlines: TGaugeBar;
    LabelScanlines: TLabel;
    LabelScanlinesValue: TLabel;
    LabelMMX: TLabel;
    MMX: TGaugeBar;
    LabelMMXValue: TLabel;
    LabelDirty: TLabel;
    Dirty: TGaugeBar;
    LabelDirtyValue: TLabel;
    WaitInterlace: TCheckBox;
    Stretch: TCheckBox;
    TripleBuffer: TCheckBox;
    WaitVSync: TCheckBox;
    NoRotate: TCheckBox;
    RotateLeft: TCheckBox;
    RotateRight: TCheckBox;
    VSync: TCheckBox;
    AlwaysSynced: TCheckBox;
    FlipX: TCheckBox;
    FlipY: TCheckBox;
    LabelDebuggerResolution: TLabel;
    DebuggerResolution: TGaugeBar;
    LabelDebuggerResolutionValue: TLabel;
    LabelBrightness: TLabel;
    Brightness: TGaugeBar2;
    LabelBrightnessValue: TLabel;
    FrameSkip: TGaugeBar;
    LabelFrameSkip: TLabel;
    LabelFrameSkipValue: TLabel;
    Sound: TCheckBox;
    LabelFolderKeysMapping: TGroupBox;
    FolderKeysMapping: TEdit;
    FolderKeysMappingButtonSelect: TButton;
    LabelPauseBrightness: TLabel;
    PauseBrightness: TGaugeBar2;
    LabelPauseBrightnessValue: TLabel;
    LabelControllerKeysMapping: TLabel;
    ControllerKeysMapping: TComboBox;
    SkipGameInfo: TCheckBox;
    SkipDisclaimer: TCheckBox;
    procedure ButtonOkClick(Sender: TObject);
    procedure ButtonCancelClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure ReadMAMEcfgClick(Sender: TObject);
    procedure CenterXChange(Sender: TObject);
    procedure SkipColumnsChange(Sender: TObject);
    procedure CenterYChange(Sender: TObject);
    procedure VGAFrequencyChange(Sender: TObject);
    procedure SkipLinesChange(Sender: TObject);
    procedure VolumeChange(Sender: TObject);
    procedure DepthChange(Sender: TObject);
    procedure GammaChange(Sender: TObject);
    procedure FlickerChange(Sender: TObject);
    procedure BeamChange(Sender: TObject);
    procedure FrameSkipChange(Sender: TObject);
    procedure VESAChange(Sender: TObject);
    procedure SampleRateChange(Sender: TObject);
    procedure CustomSampleRateChange(Sender: TObject);
    procedure MonitorChange(Sender: TObject);
    procedure ResolutionChange(Sender: TObject);
    procedure VectorResolutionChange(Sender: TObject);
    procedure SoundCardChange(Sender: TObject);
    procedure JoystickChange(Sender: TObject);
    procedure FolderROMsButtonSelectClick(Sender: TObject);
    procedure FilenameCheatButtonSelectClick(Sender: TObject);
    procedure FilenameMAMEInfoButtonSelectClick(Sender: TObject);
    procedure FilenameHistoryButtonSelectClick(Sender: TObject);
    procedure FolderSamplesButtonSelectClick(Sender: TObject);
    procedure FolderGamesConfigurationButtonSelectClick(Sender: TObject);
    procedure FolderSaveStatesButtonSelectClick(Sender: TObject);
    procedure FolderHighScoresButtonSelectClick(Sender: TObject);
    procedure FolderNVRAMButtonSelectClick(Sender: TObject);
    procedure FolderMemoryCardsButtonSelectClick(Sender: TObject);
    procedure FolderInputsRecordingButtonSelectClick(Sender: TObject);
    procedure FolderArtworksButtonSelectClick(Sender: TObject);
    procedure FolderSnapshotsButtonSelectClick(Sender: TObject);
    procedure FolderCheatsButtonSelectClick(Sender: TObject);
    procedure FolderDiffButtonSelectClick(Sender: TObject);
    procedure ArtworkResolutionChange(Sender: TObject);
    procedure ScanlinesChange(Sender: TObject);
    procedure BrightnessChange(Sender: TObject);
    procedure DebuggerResolutionChange(Sender: TObject);
    procedure MMXChange(Sender: TObject);
    procedure DirtyChange(Sender: TObject);
    procedure IntensityChange(Sender: TObject);
    procedure FolderKeysMappingButtonSelectClick(Sender: TObject);
    procedure PauseBrightnessChange(Sender: TObject);
  private
    { Private declarations }
  public
    EmulatorString: String;
    { Public declarations }
  end;

var
  FormDOSMAMEConfiguration: TFormDOSMAMEConfiguration;

implementation

uses uMain;

{$R *.DFM}

procedure TFormDOSMAMEConfiguration.ButtonOkClick(Sender: TObject);
begin
  SetCurrentDir(FormMain.FrontendPath);
  if not FileExists(ExtractFilePath(EmulatorString)+'mame.cfg') then
     FormMain.CheckDOSMAMEConfigFile(EmulatorString);
  FormMain.UpdateDOSMAMEConfigFile(EmulatorString);// update all mame.cfg options
  Close;
end;

procedure TFormDOSMAMEConfiguration.ButtonCancelClick(Sender: TObject);
begin
  SetCurrentDir(FormMain.FrontendPath);
  Close;
end;

procedure TFormDOSMAMEConfiguration.FormCreate(Sender: TObject);
var
  SysMenu: HMenu;
begin
  SysMenu := GetSystemMenu(handle, False);
  EnableMenuItem(SysMenu, SC_CLOSE, MF_DISABLED or MF_GRAYED);

  // Load Icons
  // Folders tab
  FormMain.LoadIcon(GeneralFolders1Image, 'MAMEConfiguration\Folders.png');
  FormMain.LoadIcon(GeneralFolders2Image, 'MAMEConfiguration\Folders.png');

  // Options tab
  FormMain.LoadIcon(DisplayImage, 'MAMEConfiguration\Display.png');
  FormMain.LoadIcon(SoundControllersImage, 'MAMEConfiguration\SoundControllers.png');
  FormMain.LoadIcon(MiscellaneousImage, 'MAMEConfiguration\Miscellaneous.png');
end;

procedure TFormDOSMAMEConfiguration.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #27 then ButtonCancel.OnClick(Self);
end;

procedure TFormDOSMAMEConfiguration.FormShow(Sender: TObject);
begin
  FormMain.UpdateGeneralAppearance(FormDOSMAMEConfiguration);
  FormMain.SetDOSMAMEConfigurationLanguage;
  FormMain.CheckDOSMAMEConfigFile(EmulatorString);
  ReadMAMEcfg.OnClick(Self);
end;

procedure TFormDOSMAMEConfiguration.ReadMAMEcfgClick(Sender: TObject);
begin
  if not FileExists(ExtractFilePath(EmulatorString)+'mame.cfg') then
     FormMain.CheckDOSMAMEConfigFile(EmulatorString);
  FormMain.ReadDOSMAMEConfigFile(EmulatorString); // read all mame.cfg options
end;

procedure TFormDOSMAMEConfiguration.CenterXChange(Sender: TObject);
begin
  LabelCenterXValue.Caption:= IntToStr(CenterX.Position);
end;

procedure TFormDOSMAMEConfiguration.SkipColumnsChange(Sender: TObject);
begin
  LabelSkipColumnsValue.Caption:= IntToStr(SkipColumns.Position);
end;

procedure TFormDOSMAMEConfiguration.CenterYChange(Sender: TObject);
begin
  LabelCenterYValue.Caption:= IntToStr(CenterY.Position);
end;

procedure TFormDOSMAMEConfiguration.VGAFrequencyChange(Sender: TObject);
begin
  if VGAFrequency.Position = -1 then
     LabelVGAFrequencyValue.Caption:='Auto'
  else
     LabelVGAFrequencyValue.Caption:= IntToStr(VGAFrequency.Position);
end;

procedure TFormDOSMAMEConfiguration.SkipLinesChange(Sender: TObject);
begin
  LabelSkipLinesValue.Caption:= IntToStr(SkipLines.Position);
end;

procedure TFormDOSMAMEConfiguration.VolumeChange(Sender: TObject);
begin
  LabelVolumeValue.Caption:= IntToSTr(Volume.Position)+' dB';
end;

procedure TFormDOSMAMEConfiguration.DepthChange(Sender: TObject);
begin
  LabelDepthValue.Caption:= FormMain.GetDOSDepth(Depth);
end;

procedure TFormDOSMAMEConfiguration.GammaChange(Sender: TObject);
begin
  LabelGammaValue.Caption:= TrimLeft(Format('%1.2f', [Gamma.Position]));
end;

procedure TFormDOSMAMEConfiguration.FlickerChange(Sender: TObject);
begin
  LabelFlickerValue.Caption:= TrimLeft(Format('%3.2f',[Flicker.Position]));
end;

procedure TFormDOSMAMEConfiguration.BeamChange(Sender: TObject);
begin
  LabelBeamValue.Caption:= TrimLeft(Format('%2.2f', [Beam.Position]));
end;

procedure TFormDOSMAMEConfiguration.FrameSkipChange(Sender: TObject);
begin
  if FrameSkip.Position = -1 then
     LabelFrameSkipValue.Caption:= 'Auto'
  else
     LabelFrameSkipValue.Caption:= IntToStr(FrameSkip.Position);
end;

procedure TFormDOSMAMEConfiguration.VESAChange(Sender: TObject);
begin
  LabelVESAValue.Caption:= FormMain.GetDOSVesaMode(VESA);
end;

procedure TFormDOSMAMEConfiguration.SampleRateChange(Sender: TObject);
begin
  LabelSampleRateValue.Caption:= FormMain.GetSampleRate(SampleRate);
end;

procedure TFormDOSMAMEConfiguration.CustomSampleRateChange(
  Sender: TObject);
begin
  if CustomSampleRate.Position = 4999 then
     LabelCustomSampleRateValue.Caption:='Disabled'
  else
     LabelCustomSampleRateValue.Caption:= IntToStr(CustomSampleRate.Position)+' Hz';
end;

procedure TFormDOSMAMEConfiguration.MonitorChange(Sender: TObject);
begin
  LabelMonitorValue.Caption:= FormMain.GetDOSMonitor(Monitor);
end;

procedure TFormDOSMAMEConfiguration.ResolutionChange(Sender: TObject);
begin
  LabelResolutionValue.Caption:= FormMain.GetResolution(Resolution);
  //FormMain.GetDOSResolution(Resolution);
end;

procedure TFormDOSMAMEConfiguration.VectorResolutionChange(
  Sender: TObject);
begin
  LabelVectorResolutionValue.Caption:= FormMain.GetResolution(VectorResolution);
  //FormMain.GetDOSResolution(VectorResolution);
end;

procedure TFormDOSMAMEConfiguration.SoundCardChange(Sender: TObject);
begin
  LabelSoundCardValue.Caption:= FormMain.GetDOSSoundCard(SoundCard);
end;

procedure TFormDOSMAMEConfiguration.JoystickChange(Sender: TObject);
begin
  LabelJoystickValue.Caption:= FormMain.GetDOSJoystick(Joystick);
end;

procedure TFormDOSMAMEConfiguration.FilenameCheatButtonSelectClick(
  Sender: TObject);
begin
  FormMain.DialogOpenFile(3, FormMain.GetLanguageText('MAME Options', 'CheatFileDialogTitle', 'Select a file for cheat'), FilenameCheat);
end;

procedure TFormDOSMAMEConfiguration.FilenameMAMEInfoButtonSelectClick(
  Sender: TObject);
begin
  FormMain.DialogOpenFile(3, FormMain.GetLanguageText('MAME Options', 'MAMEInfoFileDialogTitle', 'Select a file for mameinfo'), FilenameMAMEInfo);
end;

procedure TFormDOSMAMEConfiguration.FilenameHistoryButtonSelectClick(
  Sender: TObject);
begin
  FormMain.DialogOpenFile(3, FormMain.GetLanguageText('MAME Options', 'HistoryFileDialogTitle', 'Select a file for history'), FilenameHistory);
end;

procedure TFormDOSMAMEConfiguration.FolderROMsButtonSelectClick(
  Sender: TObject);
begin
  FormMain.DialogSelectFolder(FolderROMs, True);
end;


procedure TFormDOSMAMEConfiguration.FolderSamplesButtonSelectClick(
  Sender: TObject);
begin
  FormMain.DialogSelectFolder(FolderSamples, False);
end;

procedure TFormDOSMAMEConfiguration.FolderGamesConfigurationButtonSelectClick(
  Sender: TObject);
begin
  FormMain.DialogSelectFolder(FolderGamesConfiguration, False);
end;

procedure TFormDOSMAMEConfiguration.FolderSaveStatesButtonSelectClick(
  Sender: TObject);
begin
  FormMain.DialogSelectFolder(FolderSaveStates, False);
end;

procedure TFormDOSMAMEConfiguration.FolderHighScoresButtonSelectClick(
  Sender: TObject);
begin
  FormMain.DialogSelectFolder(FolderHighScores, False);
end;

procedure TFormDOSMAMEConfiguration.FolderNVRAMButtonSelectClick(
  Sender: TObject);
begin
  FormMain.DialogSelectFolder(FolderNVRAM, False);
end;

procedure TFormDOSMAMEConfiguration.FolderMemoryCardsButtonSelectClick(
  Sender: TObject);
begin
  FormMain.DialogSelectFolder(FolderMemoryCards, False);
end;

procedure TFormDOSMAMEConfiguration.FolderInputsRecordingButtonSelectClick(
  Sender: TObject);
begin
  FormMain.DialogSelectFolder(FolderInputsRecording, False);
end;

procedure TFormDOSMAMEConfiguration.FolderArtworksButtonSelectClick(
  Sender: TObject);
begin
  FormMain.DialogSelectFolder(FolderArtworks, False);
end;

procedure TFormDOSMAMEConfiguration.FolderSnapshotsButtonSelectClick(
  Sender: TObject);
begin
  FormMain.DialogSelectFolder(FolderSnapshots, False);
end;

procedure TFormDOSMAMEConfiguration.FolderCheatsButtonSelectClick(
  Sender: TObject);
begin
  FormMain.DialogSelectFolder(FolderCheats, True);
end;

procedure TFormDOSMAMEConfiguration.FolderDiffButtonSelectClick(
  Sender: TObject);
begin
  FormMain.DialogSelectFolder(FolderDiff, False);
end;

procedure TFormDOSMAMEConfiguration.FolderKeysMappingButtonSelectClick(
  Sender: TObject);
begin
  FormMain.DialogSelectFolder(FolderKeysMapping, False);
end;

procedure TFormDOSMAMEConfiguration.ArtworkResolutionChange(
  Sender: TObject);
begin
  if ArtworkResolution.Position = 0 then
     LabelArtworkResolutionValue.Caption:= 'Auto'
  else
     LabelArtworkResolutionValue.Caption:= IntToStr(ArtworkResolution.Position);
end;

procedure TFormDOSMAMEConfiguration.ScanlinesChange(Sender: TObject);
begin
  case Scanlines.Position of
    0: LabelScanlinesValue.Caption:= 'Yes';
    1: LabelScanlinesValue.Caption:= 'No';
    2: LabelScanlinesValue.Caption:= 'Horizontal';
    3: LabelScanlinesValue.Caption:= 'Vertical';
  end;
end;

procedure TFormDOSMAMEConfiguration.BrightnessChange(Sender: TObject);
begin
  LabelBrightnessValue.Caption:= TrimLeft(Format('%1.2f', [Brightness.Position]));
end;

procedure TFormDOSMAMEConfiguration.DebuggerResolutionChange(
  Sender: TObject);
begin
  LabelDebuggerResolutionValue.Caption:= FormMain.GetDOSResolution(DebuggerResolution);
end;

procedure TFormDOSMAMEConfiguration.MMXChange(Sender: TObject);
begin
  case MMX.Position of
    -1: LabelMMXValue.Caption:= 'Auto';
     0: LabelMMXValue.Caption:= 'Yes';
     1: LAbelMMXValue.Caption:= 'No';
  end;
end;

procedure TFormDOSMAMEConfiguration.DirtyChange(Sender: TObject);
begin
  case Dirty.Position of
    -1: LabelDirtyValue.Caption:= 'Auto';
     0: LabelDirtyValue.Caption:= 'Yes';
     1: LAbelDirtyValue.Caption:= 'No';
  end;
end;

procedure TFormDOSMAMEConfiguration.IntensityChange(Sender: TObject);
begin
  LabelIntensityValue.Caption:= TrimLeft(Format('%1.2f', [Intensity.Position]));
end;


procedure TFormDOSMAMEConfiguration.PauseBrightnessChange(Sender: TObject);
begin
  LabelPauseBrightnessValue.Caption:= TrimLeft(Format('%1.2f', [PauseBrightness.Position]));
end;

end.
