unit uMAMEConfig;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  GR32_RangeBars, StdCtrls, ExtCtrls, ComCtrls, ImgList, GR32_Image,
  uGR32Extra;

type
  TFormMAMEConfiguration = class(TForm)
    MAMEConfigImageList: TImageList;
    ButtonOk: TButton;
    ButtonCancel: TButton;
    ReadMAMEini: TButton;
    PageControlMAMEOptions: TPageControl;
    TabSheetMAMEFolders: TTabSheet;
    TabSheetMAMEOptions: TTabSheet;
    PageControlOptions: TPageControl;
    TabSheetMAMEDisplay: TTabSheet;
    LabelResolution: TLabel;
    LabelCustomResolution: TLabel;
    LabelGammaValue: TLabel;
    LabelGamma: TLabel;
    AutoFrameSkip: TCheckBox;
    Window: TCheckBox;
    HardwareStretch: TCheckBox;
    DirectDraw: TCheckBox;
    SwitchResolution: TCheckBox;
    SwitchColorDepth: TCheckBox;
    Maximize: TCheckBox;
    KeepAspectRatio: TCheckBox;
    MatchRefreshRate: TCheckBox;
    SyncronizeRefreshRate: TCheckBox;
    Scanlines: TCheckBox;
    RotateRight: TCheckBox;
    FlipY: TCheckBox;
    WaitVSync: TCheckBox;
    NoRotate: TCheckBox;
    RotateLeft: TCheckBox;
    TripleBuffer: TCheckBox;
    FlipX: TCheckBox;
    CustomResolution: TEdit;
    Gamma: TGaugeBar2;
    TabSheetMAMEDisplay2: TTabSheet;
    LabelDebuggerResolution: TLabel;
    LabelRefreshRate: TLabel;
    LabelFramesToRun: TLabel;
    LabelFramesToRunValue: TLabel;
    LabelFullScreenBrightness: TLabel;
    LabelRefreshRateValue: TLabel;
    LabelFullScreenBrightnessValue: TLabel;
    LabelEffect: TLabel;
    LabelEffectValue: TLabel;
    LabelScreenAspect: TLabel;
    LabelScreenAspectValue: TLabel;
    LabelFrameSkip: TLabel;
    LabelFrameSkipValue: TLabel;
    FramesToRun: TGaugeBar;
    RefreshRate: TGaugeBar;
    FullScreenBrightness: TGaugeBar2;
    Effect: TGaugeBar;
    ScreenAspect: TGaugeBar;
    FrameSkip: TGaugeBar;
    TabSheetMAMESoundControllers: TTabSheet;
    TabSheetMAMEMiscellaneous: TTabSheet;
    LabelVector: TGroupBox;
    Antialias: TCheckBox;
    LabelFlicker: TLabel;
    Flicker: TGaugeBar2;
    LabelFlickerValue: TLabel;
    Translucency: TCheckBox;
    LabelBeam: TLabel;
    Beam: TGaugeBar2;
    LabelBeamValue: TLabel;
    LabelSoundOptions: TGroupBox;
    LabelSampleRate: TLabel;
    SampleRate: TGaugeBar;
    LabelSampleRateValue: TLabel;
    LabelCustomSampleRate: TLabel;
    CustomSampleRate: TGaugeBar;
    LabelCustomSampleRateValue: TLabel;
    Volume: TGaugeBar;
    LabelVolume: TLabel;
    LabelVolumeValue: TLabel;
    Sound: TCheckBox;
    Samples: TCheckBox;
    ResampleFilter: TCheckBox;
    LabelControllersOptions: TGroupBox;
    Joystick: TCheckBox;
    SteadyKey: TCheckBox;
    Mouse: TCheckBox;
    LabelControllerKeysMapping: TLabel;
    ControllerKeysMapping: TComboBox;
    LabelExternalFiles: TGroupBox;
    LabelCheatFile: TLabel;
    FilenameCheat: TEdit;
    LabelMAMEInfoFile: TLabel;
    FilenameMAMEInfo: TEdit;
    LabelHistoryFile: TLabel;
    FilenameHistory: TEdit;
    LabelTweaks: TGroupBox;
    Throttle: TCheckBox;
    Verbose: TCheckBox;
    Cheat: TCheckBox;
    Clones: TCheckBox;
    ReadConfigFile: TCheckBox;
    Log: TCheckBox;
    Debug: TCheckBox;
    LabelArtwork: TGroupBox;
    Artwork: TCheckBox;
    Backdrop: TCheckBox;
    Overlay: TCheckBox;
    Bezel: TCheckBox;
    Crop: TCheckBox;
    LabelArtworkResolution: TLabel;
    LightGun: TCheckBox;
    KeyboardLEDs: TCheckBox;
    AnalogDigitalDeadzone: TGaugeBar2;
    LabelAnalogDigitalDeadzone: TLabel;
    LabelAnalogDigitalDeadzoneValue: TLabel;
    LabelIntensity: TLabel;
    Intensity: TGaugeBar2;
    LabelIntensityValue: TLabel;
    Sleep: TCheckBox;
    LabelBrightness: TLabel;
    Brightness: TGaugeBar2;
    LabelBrightnessValue: TLabel;
    ArtworkResolution: TGaugeBar;
    LabelArtworkResolutionValue: TLabel;
    FilenameCheatButtonSelect: TButton;
    FilenameMAMEInfoButtonSelect: TButton;
    FilenameHistoryButtonSelect: TButton;
    DisplayImage: TImage32Ex;
    Display2Image: TImage32Ex;
    SoundControllersImage: TImage32Ex;
    MiscellaneousImage: TImage32Ex;
    Resolution: TGaugeBar;
    LabelResolutionValue: TLabel;
    DebuggerResolution: TGaugeBar;
    LabelDebuggerResolutionValue: TLabel;
    PageControlFolders: TPageControl;
    TabSheetFolders1: TTabSheet;
    GeneralFolders1Image: TImage32Ex;
    LabelFolderROMs: TGroupBox;
    FolderROMs: TEdit;
    FolderROMsButtonSelect: TButton;
    LabelFolderSamples: TGroupBox;
    FolderSamplesButtonSelect: TButton;
    FolderSamples: TEdit;
    LabelFolderINIFiles: TGroupBox;
    FolderINIFilesButtonSelect: TButton;
    FolderINIFiles: TEdit;
    LabelFolderGamesConfiguration: TGroupBox;
    FolderGamesConfigurationButtonSelect: TButton;
    FolderGamesConfiguration: TEdit;
    LabelFolderSaveStates: TGroupBox;
    FolderSaveStates: TEdit;
    FolderSaveStatesButtonSelect: TButton;
    LabelFolderHighScores: TGroupBox;
    FolderHighScores: TEdit;
    FolderHighScoresButtonSelect: TButton;
    LabelFolderNVRAM: TGroupBox;
    FolderNVRAM: TEdit;
    FolderNVRAMButtonSelect: TButton;
    LabelFolderMemoryCards: TGroupBox;
    FolderMemoryCards: TEdit;
    FolderMemoryCardsButtonSelect: TButton;
    TabSheetFolders2: TTabSheet;
    GeneralFolders2Image: TImage32Ex;
    LabelFolderGamesRecording: TGroupBox;
    FolderInputsRecording: TEdit;
    FolderInputsRecordingButtonSelect: TButton;
    LabelFolderArtworks: TGroupBox;
    FolderArtworks: TEdit;
    FolderArtworksButtonSelect: TButton;
    LabelFolderDiff: TGroupBox;
    FolderDiff: TEdit;
    FolderDiffButtonSelect: TButton;
    LabelFolderInGameSnapshots: TGroupBox;
    FolderSnapshots: TEdit;
    FolderSnapshotsButtonSelect: TButton;
    LabelFolderKeysMapping: TGroupBox;
    FolderKeysMapping: TEdit;
    FolderKeysMappingButtonSelect: TButton;
    LabelPauseBrightness: TLabel;
    PauseBrightness: TGaugeBar2;
    LabelPauseBrightnessValue: TLabel;
    OSDebug: TCheckBox;
    SkipDisclaimer: TCheckBox;
    SkipGameInfo: TCheckBox;
    rdtsc: TCheckBox;
    procedure CustomSampleRateChange(Sender: TObject);
    procedure FrameSkipChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure ReadMAMEiniClick(Sender: TObject);
    procedure ButtonCancelClick(Sender: TObject);
    procedure ButtonOkClick(Sender: TObject);
    procedure RefreshRateChange(Sender: TObject);
    procedure SampleRateChange(Sender: TObject);
    procedure GammaChange(Sender: TObject);
    procedure FlickerChange(Sender: TObject);
    procedure BeamChange(Sender: TObject);
    procedure FullScreenBrightnessChange(Sender: TObject);
    procedure FramesToRunChange(Sender: TObject);
    procedure VolumeChange(Sender: TObject);
    procedure EffectChange(Sender: TObject);
    procedure ScreenAspectChange(Sender: TObject);
    procedure AnalogDigitalDeadzoneChange(Sender: TObject);
    procedure BrightnessChange(Sender: TObject);
    procedure IntensityChange(Sender: TObject);
    procedure ArtworkResolutionChange(Sender: TObject);
    procedure FilenameCheatButtonSelectClick(Sender: TObject);
    procedure FilenameMAMEInfoButtonSelectClick(Sender: TObject);
    procedure FilenameHistoryButtonSelectClick(Sender: TObject);
    procedure FolderROMsButtonSelectClick(Sender: TObject);
    procedure FolderSamplesButtonSelectClick(Sender: TObject);
    procedure FolderINIFilesButtonSelectClick(Sender: TObject);
    procedure FolderGamesConfigurationButtonSelectClick(Sender: TObject);
    procedure FolderSaveStatesButtonSelectClick(Sender: TObject);
    procedure FolderHighScoresButtonSelectClick(Sender: TObject);
    procedure FolderNVRAMButtonSelectClick(Sender: TObject);
    procedure FolderMemoryCardsButtonSelectClick(Sender: TObject);
    procedure FolderInputsRecordingButtonSelectClick(Sender: TObject);
    procedure FolderArtworksButtonSelectClick(Sender: TObject);
    procedure FolderDiffButtonSelectClick(Sender: TObject);
    procedure FolderSnapshotsButtonSelectClick(Sender: TObject);
    procedure FolderKeysMappingButtonSelectClick(Sender: TObject);
    procedure ResolutionChange(Sender: TObject);
    procedure DebuggerResolutionChange(Sender: TObject);
    procedure PauseBrightnessChange(Sender: TObject);
  private
    { Private declarations }
  public
    EmulatorString: String;
    { Public declarations }
  end;

var
  FormMAMEConfiguration: TFormMAMEConfiguration;

implementation

uses uMain;

{$R *.DFM}

procedure TFormMAMEConfiguration.CustomSampleRateChange(
  Sender: TObject);
begin
  if CustomSampleRate.Position = 4999 then
     LabelCustomSampleRateValue.Caption:= 'Disabled'
  else
     LabelCustomSampleRateValue.Caption:= IntToStr(CustomSampleRate.Position)+' Hz';
end;

procedure TFormMAMEConfiguration.FrameSkipChange(Sender: TObject);
begin
  LabelFrameSkipValue.Caption:= IntToStr(FrameSkip.Position);
end;

procedure TFormMAMEConfiguration.FormCreate(Sender: TObject);
var
  SysMenu: HMenu;
begin
  SysMenu:= GetSystemMenu(handle, False);
  EnableMenuItem(SysMenu, SC_CLOSE, MF_DISABLED or MF_GRAYED);

  // Load Icons
  // Folders tab
  FormMain.LoadIcon(GeneralFolders1Image, 'MAMEConfiguration\Folders.png');
  FormMain.LoadIcon(GeneralFolders2Image, 'MAMEConfiguration\Folders.png');

  // Options tab
  FormMain.LoadIcon(DisplayImage, 'MAMEConfiguration\Display.png');
  FormMain.LoadIcon(Display2Image, 'MAMEConfiguration\Display.png');
  FormMain.LoadIcon(SoundControllersImage, 'MAMEConfiguration\SoundControllers.png');
  FormMain.LoadIcon(MiscellaneousImage, 'MAMEConfiguration\Miscellaneous.png');
end;

procedure TFormMAMEConfiguration.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #27 then
     ButtonCancel.OnClick(Self);
end;

procedure TFormMAMEConfiguration.FormShow(Sender: TObject);
begin
  FormMain.UpdateGeneralAppearance(FormMAMEConfiguration);
  FormMain.SetMAMEConfigurationLanguage;
  FormMain.CheckMAMEIniFile(EmulatorString);
  ReadMAMEini.OnClick(Self);
end;

procedure TFormMAMEConfiguration.ReadMAMEiniClick(Sender: TObject);
begin
  if not FileExists(ExtractFilePath(EmulatorString)+FormMain.GetExecutableINIFileName(EmulatorString)) then
     FormMain.CheckMAMEIniFile(EmulatorString);
  FormMain.ReadMAMEIniFile(EmulatorString); // read all mame.ini options
end;

procedure TFormMAMEConfiguration.ButtonCancelClick(Sender: TObject);
begin
  SetCurrentDir(FormMain.FrontendPath);
  Close;
end;

procedure TFormMAMEConfiguration.ButtonOkClick(Sender: TObject);
begin
  SetCurrentDir(FormMain.FrontendPath);
  if not FileExists(ExtractFilePath(EmulatorString)+FormMain.GetExecutableINIFileName(EmulatorString)) then
     FormMain.CheckMAMEIniFile(EmulatorString);
  FormMain.UpdateMAMEIniFile(EmulatorString);// update all mame.ini options
  Close;
end;

procedure TFormMAMEConfiguration.RefreshRateChange(Sender: TObject);
begin
  if RefreshRate.Position = 0 then
     LabelRefreshRateValue.Caption:= 'Auto'
  else
     LabelRefreshRateValue.Caption:= IntToStr(RefreshRate.Position);
end;

procedure TFormMAMEConfiguration.SampleRateChange(Sender: TObject);
begin
  LabelSampleRateValue.Caption:= FormMain.GetSampleRate(SampleRate);
end;

procedure TFormMAMEConfiguration.GammaChange(Sender: TObject);
begin
  LabelGammaValue.Caption:= TrimLeft(Format('%1.2f', [Gamma.Position]));
end;

procedure TFormMAMEConfiguration.FlickerChange(Sender: TObject);
begin
  LabelFlickerValue.Caption:= TrimLeft(Format('%3.2f',[Flicker.Position]));
end;

procedure TFormMAMEConfiguration.BeamChange(Sender: TObject);
begin
  LabelBeamValue.Caption:= TrimLeft(Format('%2.2f', [Beam.Position]));
end;

procedure TFormMAMEConfiguration.FullScreenBrightnessChange(
  Sender: TObject);
begin
  LabelFullScreenBrightnessValue.Caption:= TrimLeft(Format('%1.2f', [FullScreenBrightness.Position]));
end;

procedure TFormMAMEConfiguration.FramesToRunChange(Sender: TObject);
begin
  LabelFramesToRunValue.Caption:= IntToStr(FramesToRun.Position);
end;

procedure TFormMAMEConfiguration.VolumeChange(Sender: TObject);
begin
  LabelVolumeValue.Caption:= IntToSTr(Volume.Position)+' dB';
end;

procedure TFormMAMEConfiguration.EffectChange(Sender: TObject);
begin
  LabelEffectValue.Caption:= FormMain.GetBlitterEffect(Effect);
end;

procedure TFormMAMEConfiguration.ScreenAspectChange(Sender: TObject);
begin
  LabelScreenAspectValue.Caption:= FormMain.GetAspectRatio(ScreenAspect);
end;

procedure TFormMAMEConfiguration.AnalogDigitalDeadzoneChange(
  Sender: TObject);
begin
  LabelAnalogDigitalDeadzoneValue.Caption:= TrimLeft(Format('%1.2f', [AnalogDigitalDeadzone.Position]));
end;

procedure TFormMAMEConfiguration.BrightnessChange(Sender: TObject);
begin
  LabelBrightnessValue.Caption:= TrimLeft(Format('%1.2f', [Brightness.Position]));
end;

procedure TFormMAMEConfiguration.IntensityChange(Sender: TObject);
begin
  LabelIntensityValue.Caption:= TrimLeft(Format('%1.2f', [Intensity.Position]));
end;

procedure TFormMAMEConfiguration.ArtworkResolutionChange(
  Sender: TObject);
begin
  if ArtworkResolution.Position = 0 then
     LabelArtworkResolutionValue.Caption:= 'Auto'
  else
     LabelArtworkResolutionValue.Caption:= IntToStr(ArtworkResolution.Position);
end;

procedure TFormMAMEConfiguration.FilenameCheatButtonSelectClick(
  Sender: TObject);
begin
  FormMain.DialogOpenFile(3, FormMain.GetLanguageText('MAME Options', 'CheatFileDialogTitle', 'Select a file for cheat'), FilenameCheat);
end;

procedure TFormMAMEConfiguration.FilenameMAMEInfoButtonSelectClick(
  Sender: TObject);
begin
  FormMain.DialogOpenFile(3, FormMain.GetLanguageText('MAME Options', 'MAMEInfoFileDialogTitle', 'Select a file for mameinfo'), FilenameMAMEInfo);
end;

procedure TFormMAMEConfiguration.FilenameHistoryButtonSelectClick(
  Sender: TObject);
begin
  FormMain.DialogOpenFile(3, FormMain.GetLanguageText('MAME Options', 'HistoryFileDialogTitle', 'Select a file for history'), FilenameHistory);
end;

procedure TFormMAMEConfiguration.FolderROMsButtonSelectClick(
  Sender: TObject);
begin
  FormMain.DialogSelectFolder(FolderROMs, True);
end;

procedure TFormMAMEConfiguration.FolderSamplesButtonSelectClick(
  Sender: TObject);
begin
  FormMain.DialogSelectFolder(FolderSamples, False);
end;

procedure TFormMAMEConfiguration.FolderINIFilesButtonSelectClick(
  Sender: TObject);
begin
  FormMain.DialogSelectFolder(FolderINIFiles, False);
end;

procedure TFormMAMEConfiguration.FolderGamesConfigurationButtonSelectClick(
  Sender: TObject);
begin
  FormMain.DialogSelectFolder(FolderGamesConfiguration, False);
end;

procedure TFormMAMEConfiguration.FolderSaveStatesButtonSelectClick(
  Sender: TObject);
begin
  FormMain.DialogSelectFolder(FolderSaveStates, False);
end;

procedure TFormMAMEConfiguration.FolderHighScoresButtonSelectClick(
  Sender: TObject);
begin
  FormMain.DialogSelectFolder(FolderHighScores, False);
end;

procedure TFormMAMEConfiguration.FolderNVRAMButtonSelectClick(
  Sender: TObject);
begin
  FormMain.DialogSelectFolder(FolderNVRAM, False);
end;

procedure TFormMAMEConfiguration.FolderMemoryCardsButtonSelectClick(
  Sender: TObject);
begin
  FormMain.DialogSelectFolder(FolderMemoryCards, False);
end;

procedure TFormMAMEConfiguration.FolderInputsRecordingButtonSelectClick(
  Sender: TObject);
begin
  FormMain.DialogSelectFolder(FolderInputsRecording, False);
end;

procedure TFormMAMEConfiguration.FolderArtworksButtonSelectClick(
  Sender: TObject);
begin
  FormMain.DialogSelectFolder(FolderArtworks, False);
end;

procedure TFormMAMEConfiguration.FolderDiffButtonSelectClick(
  Sender: TObject);
begin
  FormMain.DialogSelectFolder(FolderDiff, False);
end;

procedure TFormMAMEConfiguration.FolderSnapshotsButtonSelectClick(
  Sender: TObject);
begin
  FormMain.DialogSelectFolder(FolderSnapshots, False);
end;

procedure TFormMAMEConfiguration.FolderKeysMappingButtonSelectClick(
  Sender: TObject);
begin
  FormMain.DialogSelectFolder(FolderKeysMapping, False);
end;

procedure TFormMAMEConfiguration.ResolutionChange(Sender: TObject);
begin
  LabelResolutionValue.Caption:= FormMain.GetResolution(Resolution);
end;

procedure TFormMAMEConfiguration.DebuggerResolutionChange(Sender: TObject);
begin
  LabelDebuggerResolutionValue.Caption:= FormMain.GetDOSResolution(DebuggerResolution);
end;

procedure TFormMAMEConfiguration.PauseBrightnessChange(Sender: TObject);
begin
  LabelPauseBrightnessValue.Caption:= TrimLeft(Format('%1.2f', [PauseBrightness.Position]));
end;

end.
