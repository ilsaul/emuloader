unit uMAMECustomConfig;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  ImgList, ComCtrls, StdCtrls, ExtCtrls, GR32_RangeBars, IniFiles,
  GR32_Image, uGR32Extra;

type
  TFormMAMECustomConfiguration = class(TForm)
    MAMEConfigImageList: TImageList;
    GameIcon: TImage;
    LabelGameDescription: TLabel;
    ButtonOk: TButton;
    ButtonCancel: TButton;
    ButtonReadMAMEgamenameIni: TButton;
    PageControlMAMEOptions: TPageControl;
    TabSheetMAMEFolders: TTabSheet;
    TabSheetMAMEOptions: TTabSheet;
    PageControlGeneralOptions: TPageControl;
    TabSheetMAMEDisplay: TTabSheet;
    LabelResolution: TLabel;
    LabelGamma: TLabel;
    LabelGammaValue: TLabel;
    LabelCustomResolution: TLabel;
    Gamma: TGaugeBar2;
    AutoFrameSkip: TCheckBox;
    HardwareStretch: TCheckBox;
    DirectDraw: TCheckBox;
    SwitchResolution: TCheckBox;
    SwitchColorDepth: TCheckBox;
    Window: TCheckBox;
    Scanlines: TCheckBox;
    NoRotate: TCheckBox;
    RotateLeft: TCheckBox;
    RotateRight: TCheckBox;
    TripleBuffer: TCheckBox;
    FlipX: TCheckBox;
    FlipY: TCheckBox;
    WaitVSync: TCheckBox;
    Maximize: TCheckBox;
    KeepAspectRatio: TCheckBox;
    MatchRefreshRate: TCheckBox;
    SyncronizeRefreshRate: TCheckBox;
    CustomResolution: TEdit;
    Sleep: TCheckBox;
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
    LabelBrightness: TLabel;
    LabelBrightnessValue: TLabel;
    FramesToRun: TGaugeBar;
    RefreshRate: TGaugeBar;
    FullScreenBrightness: TGaugeBar2;
    Effect: TGaugeBar;
    ScreenAspect: TGaugeBar;
    FrameSkip: TGaugeBar;
    LabelVector: TGroupBox;
    LabelFlicker: TLabel;
    LabelFlickerValue: TLabel;
    LabelBeam: TLabel;
    LabelBeamValue: TLabel;
    LabelIntensityValue: TLabel;
    LabelIntensity: TLabel;
    Antialias: TCheckBox;
    Flicker: TGaugeBar2;
    Translucency: TCheckBox;
    Beam: TGaugeBar2;
    Intensity: TGaugeBar2;
    Brightness: TGaugeBar2;
    TabSheetMAMESoundControllers: TTabSheet;
    LabelSoundOptions: TGroupBox;
    LabelSampleRate: TLabel;
    LabelSampleRateValue: TLabel;
    LabelCustomSampleRate: TLabel;
    LabelCustomSampleRateValue: TLabel;
    LabelVolume: TLabel;
    LabelVolumeValue: TLabel;
    SampleRate: TGaugeBar;
    CustomSampleRate: TGaugeBar;
    Volume: TGaugeBar;
    Sound: TCheckBox;
    Samples: TCheckBox;
    ResampleFilter: TCheckBox;
    LabelControllersOptions: TGroupBox;
    LabelAnalogDigitalDeadzone: TLabel;
    LabelAnalogDigitalDeadzoneValue: TLabel;
    Joystick: TCheckBox;
    SteadyKey: TCheckBox;
    Mouse: TCheckBox;
    Lightgun: TCheckBox;
    KeyboardLEDs: TCheckBox;
    AnalogDigitalDeadzone: TGaugeBar2;
    TabSheetMAMEMiscellaneous: TTabSheet;
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
    LabelControllerKeysMapping: TLabel;
    ControllerKeysMapping: TComboBox;
    LabelArtworkResolution: TLabel;
    ArtworkResolution: TGaugeBar;
    LabelArtworkResolutionValue: TLabel;
    Shape1: TShape;
    DisplayImage: TImage32Ex;
    Display2Image: TImage32Ex;
    SoundControllersImage: TImage32Ex;
    MiscellaneousImage: TImage32Ex;
    Resolution: TGaugeBar;
    LabelResolutionValue: TLabel;
    LabelDebuggerResolutionValue: TLabel;
    DebuggerResolution: TGaugeBar;
    PageControlFolders: TPageControl;
    TabSheet2: TTabSheet;
    GeneralFolders1Image: TImage32Ex;
    LabelFolderROMs: TGroupBox;
    FolderROMs: TEdit;
    FolderROMsButtonSelect: TButton;
    LabelFolderSaveStates: TGroupBox;
    FolderSaveStates: TEdit;
    FolderSaveStatesButtonSelect: TButton;
    LabelFolderSamples: TGroupBox;
    FolderSamples: TEdit;
    FolderSamplesButtonSelect: TButton;
    LabelFolderGamesConfiguration: TGroupBox;
    FolderGamesConfiguration: TEdit;
    FolderGamesConfigurationButtonSelect: TButton;
    LabelFolderHighScores: TGroupBox;
    FolderHighScores: TEdit;
    FolderHighScoresButtonSelect: TButton;
    LabelFolderNVRAM: TGroupBox;
    FolderNVRAM: TEdit;
    FolderNVRAMButtonSelect: TButton;
    TabSheet3: TTabSheet;
    GeneralFolders2Image: TImage32Ex;
    LabelFolderMemoryCards: TGroupBox;
    FolderMemoryCards: TEdit;
    FolderMemoryCardsButtonSelect: TButton;
    LabelFolderDiff: TGroupBox;
    FolderDiff: TEdit;
    FolderDiffButtonSelect: TButton;
    LabelFolderGamesRecording: TGroupBox;
    FolderInputsRecording: TEdit;
    FolderInputsRecordingButtonSelect: TButton;
    LabelFolderArtworks: TGroupBox;
    FolderArtworksButtonSelect: TButton;
    FolderArtworks: TEdit;
    LabelFolderInGameSnapshots: TGroupBox;
    FolderSnapshots: TEdit;
    FolderSnapshotsButtonSelect: TButton;
    LabelFolderKeysMapping: TGroupBox;
    FolderKeysMapping: TEdit;
    FolderKeysMappingButtonSelect: TButton;
    rdtsc: TCheckBox;
    LabelPauseBrightness: TLabel;
    PauseBrightness: TGaugeBar2;
    LabelPauseBrightnessValue: TLabel;
    OSDebug: TCheckBox;
    SkipDisclaimer: TCheckBox;
    SkipGameInfo: TCheckBox;
    procedure ButtonCancelClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure ButtonReadMAMEgamenameIniClick(Sender: TObject);
    procedure ButtonOkClick(Sender: TObject);
    procedure FrameSkipChange(Sender: TObject);
    procedure GammaChange(Sender: TObject);
    procedure FlickerChange(Sender: TObject);
    procedure BeamChange(Sender: TObject);
    procedure RefreshRateChange(Sender: TObject);
    procedure FramesToRunChange(Sender: TObject);
    procedure FullScreenBrightnessChange(Sender: TObject);
    procedure SampleRateChange(Sender: TObject);
    procedure CustomSampleRateChange(Sender: TObject);
    procedure VolumeChange(Sender: TObject);
    procedure EffectChange(Sender: TObject);
    procedure ScreenAspectChange(Sender: TObject);
    procedure AnalogDigitalDeadzoneChange(Sender: TObject);
    procedure BrightnessChange(Sender: TObject);
    procedure IntensityChange(Sender: TObject);
    procedure ArtworkResolutionChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ResolutionChange(Sender: TObject);
    procedure DebuggerResolutionChange(Sender: TObject);
    procedure PauseBrightnessChange(Sender: TObject);
  private
    procedure ReadMAMEIniFile(ExecutableString: String);
    procedure ReadGameIniFile(EmulatorName: String);
    procedure UpdateGameIniFile(EmulatorName: String);
    { Private declarations }
  public
    //Folders: THashedStringList;
    SaveCfg: Boolean;
    GameName: String;
    EmulatorString: String;
    { Public declarations }
  end;

var
  FormMAMECustomConfiguration: TFormMAMECustomConfiguration;

implementation

uses uMain, uCommon;

{$R *.DFM}

procedure TFormMAMECustomConfiguration.ReadMAMEIniFile(ExecutableString: String);// FormName: TForm);
var
  WinMAMEIniFile: TextFile;
  TextLine, Value, Value2: String;
  ctrlrKeysList: THashedStringList;
begin
  if FileExists(ExtractFilePath(ExecutableString)+FormMain.GetExecutableINIFileName(ExecutableString)) then
     begin
       AssignFile(WinMAMEIniFile, ExtractFilePath(ExecutableString)+FormMain.GetExecutableINIFileName(ExecutableString));
       Reset(WinMAMEIniFile);
       while not Eof(WinMAMEIniFile) do
       begin
         ReadLn(WinMAMEIniFile, TextLine);
         with FormMAMECustomConfiguration do
         begin
           if (Pos('#', TextLine) <> 0) or (TextLine <> '') then
              begin
                if Copy(TextLine,1,7) = 'clones ' then
                   Clones.Checked:= Boolean(StrToInt(ExtractMAMEIniValue(TextLine)))
                else
                if Copy(TextLine,1,8) = 'rompath ' then
                   FolderROMs.Text:= ExtractMAMEIniValue(TextLine)
                else
                if Copy(TextLine,1,11) = 'samplepath ' then
                   FolderSamples.Text:= ExtractMAMEIniValue(TextLine)
                else
                if Copy(TextLine,1,14) = 'cfg_directory ' then
                   FolderGamesConfiguration.Text:= ExtractMAMEIniValue(TextLine)
                else
                if Copy(TextLine,1,16) = 'nvram_directory ' then
                   FolderNVRAM.Text:= ExtractMAMEIniValue(TextLine)
                else
                if Copy(TextLine,1,18) = 'memcard_directory ' then
                   FolderMemoryCards.Text:= ExtractMAMEIniValue(TextLine)
                else
                if Copy(TextLine,1,16) = 'input_directory ' then
                   FolderInputsRecording.Text:= ExtractMAMEIniValue(TextLine)
                else
                if Copy(TextLine,1,18) = 'hiscore_directory ' then
                   FolderHighScores.Text:= ExtractMAMEIniValue(TextLine)
                else
                if Copy(TextLine,1,16) = 'state_directory ' then
                   FolderSaveStates.Text:= ExtractMAMEIniValue(TextLine)
                else
                if Copy(TextLine,1,18) = 'artwork_directory ' then
                   FolderArtworks.Text:= ExtractMAMEIniValue(TextLine)
                else
                if Copy(TextLine,1,15) = 'diff_directory ' then
                   FolderDiff.Text:= ExtractMAMEIniValue(TextLine)
                else
                if Copy(TextLine,1,19) = 'snapshot_directory ' then
                   FolderSnapshots.Text:= ExtractMAMEIniValue(TextLine)
                else
                if Copy(TextLine,1,16) = 'ctrlr_directory ' then
                   begin
                     FolderKeysMapping.Text:= ExtractMAMEIniValue(TextLine);
                     ctrlrKeysList:= THashedStringList.Create;
                     if (Pos(':\', FolderKeysMapping.Text) > 0) or (Pos(':', FolderKeysMapping.Text) > 0) then
                        FormMain.GetControllersList(ctrlrKeysList, FolderKeysMapping.Text)
                     else
                        FormMain.GetControllersList(ctrlrKeysList, ExtractFilePath(ExecutableString)+FolderKeysMapping.Text);

                     if ctrlrKeysList.Count > 0 then
                        ControllerKeysMapping.Items.AddStrings(ctrlrKeysList);
                     FreeAndNil(ctrlrKeysList);
                   end
                else
                if Copy(TextLine,1,14) = 'autoframeskip ' then
                   AutoFrameSkip.Checked:= Boolean(StrToInt(ExtractMAMEIniValue(TextLine)))
                else
                if Copy(TextLine,1,10) = 'frameskip ' then
                   FrameSkip.Position:= StrToInt(ExtractMAMEIniValue(TextLine))
                else
                if Copy(TextLine,1,10) = 'waitvsync ' then
                   WaitVSync.Checked:= Boolean(StrToInt(ExtractMAMEIniValue(TextLine)))
                else
                if Copy(TextLine,1,13) = 'triplebuffer ' then
                   TripleBuffer.Checked:= Boolean(StrToInt(ExtractMAMEIniValue(TextLine)))
                else
                if Copy(TextLine,1,7) = 'window ' then
                   Window.Checked:= Boolean(StrToInt(ExtractMAMEIniValue(TextLine)))
                else
                if Copy(TextLine,1,6) = 'ddraw ' then
                   DirectDraw.Checked:= Boolean(StrToInt(ExtractMAMEIniValue(TextLine)))
                else
                if Copy(TextLine,1,10) = 'hwstretch ' then
                   HardwareStretch.Checked:= Boolean(StrToInt(ExtractMAMEIniValue(TextLine)))
                else
                if Copy(TextLine,1,11) = 'resolution ' then
                   begin
                     Value:= ExtractMAMEIniValue(TextLine);
                     Value2:= IntToStr(FormMain.SetResolution(Value));
                     if Value2 = '-1' then
                        CustomResolution.Text:= Value
                     else
                        Resolution.Position:= StrToInt(Value2);
                   end
                else
                if Copy(TextLine,1,8) = 'refresh ' then
                   RefreshRate.Position:= StrToInt(ExtractMAMEIniValue(TextLine))
                else
                if Copy(TextLine,1,10) = 'scanlines ' then
                   Scanlines.Checked:= Boolean(StrToInt(ExtractMAMEIniValue(TextLine)))
                else
                if Copy(TextLine,1,10) = 'switchres ' then
                   SwitchResolution.Checked:= Boolean(StrToInt(ExtractMAMEIniValue(TextLine)))
                else
                if Copy(TextLine,1,10) = 'switchbpp ' then
                   SwitchColorDepth.Checked:= Boolean(StrToInt(ExtractMAMEIniValue(TextLine)))
                else
                if Copy(TextLine,1,9) = 'maximize ' then
                   Maximize.Checked:= Boolean(StrToInt(ExtractMAMEIniValue(TextLine)))
                else
                if Copy(TextLine,1,11) = 'keepaspect ' then
                   KeepAspectRatio.Checked:= Boolean(StrToInt(ExtractMAMEIniValue(TextLine)))
                else
                if Copy(TextLine,1,13) = 'matchrefresh ' then
                   MatchRefreshRate.Checked:= Boolean(StrToInt(ExtractMAMEIniValue(TextLine)))
                else
                if Copy(TextLine,1,12) = 'syncrefresh ' then
                   SyncronizeRefreshRate.Checked:= Boolean(StrToInt(ExtractMAMEIniValue(TextLine)))
                else
                if Copy(TextLine,1,9) = 'throttle ' then
                   Throttle.Checked:= Boolean(StrToInt(ExtractMAMEIniValue(TextLine)))
                else
                if Copy(TextLine,1,23) = 'full_screen_brightness ' then
                   FullScreenBrightness.Position:= StrToFloat(Format('%1.2f', [StrToFloat(ExtractMAMEIniValue(TextLine))]))
                else
                if Copy(TextLine,1,14) = 'frames_to_run ' then
                   FramesToRun.Position:= StrToInt(ExtractMAMEIniValue(TextLine))
                else
                if Copy(TextLine,1,7) = 'effect ' then
                   Effect.Position:= FormMain.SetBlitterEffect(ExtractMAMEIniValue(TextLine))
                else
                if Copy(TextLine,1,14) = 'screen_aspect ' then
                   ScreenAspect.Position:= FormMain.SetDefaultAspectRatio(ExtractMAMEIniValue(TextLine))
                else
                if Copy(TextLine,1,6) = 'sleep ' then
                   Sleep.Checked:= Boolean(StrToInt(ExtractMAMEIniValue(TextLine)))
                else
                if Copy(TextLine, 1, 6) = 'rdtsc ' then
                   rdtsc.Checked:= Boolean(StrToInt(ExtractMAMEIniValue(TextLine)))
                else
                if Copy(TextLine,1,6) = 'mouse ' then
                   Mouse.Checked:= Boolean(StrToInt(ExtractMAMEIniValue(TextLine)))
                else
                if Copy(TextLine,1,9) = 'joystick ' then
                   Joystick.Checked:= Boolean(StrToInt(ExtractMAMEIniValue(TextLine)))
                else
                if Copy(TextLine,1,9) = 'lightgun ' then
                   Lightgun.Checked:= Boolean(StrToInt(ExtractMAMEIniValue(TextLine)))
                else
                if Copy(TextLine,1,10) = 'steadykey ' then
                   SteadyKey.Checked:= Boolean(StrToInt(ExtractMAMEIniValue(TextLine)))
                else
                if Copy(TextLine,1,14) = 'keyboard_leds ' then
                   KeyboardLEDs.Checked:= Boolean(StrToInt(ExtractMAMEIniValue(TextLine)))
                else
                if Copy(TextLine,1,13) = 'a2d_deadzone ' then
                   AnalogDigitalDeadzone.Position:= StrToFloat(Format('%1.2f', [StrToFloat(ExtractMAMEIniValue(TextLine))]))
                else
                if Copy(TextLine, 1, 8) = '# ctrlr ' then
                   ControllerKeysMapping.ItemIndex:= 0
                else
                if Copy(TextLine, 1, 6) = 'ctrlr ' then
                    begin
                      ControllerKeysMapping.ItemIndex:= ControllerKeysMapping.Items.IndexOf(ExtractMAMEiniValue(TextLine));
                      if ControllerKeysMapping.ItemIndex = -1 then
                         ControllerKeysMapping.ItemIndex:= 0;
                    end
                else
                if Copy(TextLine,1,9) = 'norotate ' then
                   NoRotate.Checked:= Boolean(StrToInt(ExtractMAMEIniValue(TextLine)))
                else
                if Copy(TextLine,1,4) = 'ror ' then
                   RotateRight.Checked:= Boolean(StrToInt(ExtractMAMEIniValue(TextLine)))
                else
                if Copy(TextLine,1,4) = 'rol ' then
                   RotateLeft.Checked:= Boolean(StrToInt(ExtractMAMEIniValue(TextLine)))
                else
                if Copy(TextLine,1,6) = 'flipx ' then
                   FlipX.Checked:= Boolean(StrToInt(ExtractMAMEIniValue(TextLine)))
                else
                if Copy(TextLine,1,6) = 'flipy ' then
                   FlipY.Checked:= Boolean(StrToInt(ExtractMAMEIniValue(TextLine)))
                else
                if Copy(TextLine,1,17) = 'debug_resolution ' then
                   DebuggerResolution.Position:= FormMain.SetDOSResolution(LowerCase(ExtractMAMEIniValue(TextLine)))
                else
                if Copy(TextLine,1,6) = 'gamma ' then
                   Gamma.Position:= StrToFloat(Format('%1.2f', [StrToFloat(ExtractMAMEIniValue(TextLine))]))
                else
                if Copy(TextLine,1,11) = 'brightness ' then
                   Brightness.Position:= StrToFloat(Format('%1.2f', [StrToFloat(ExtractMAMEIniValue(TextLine))]))
                else
                if Copy(TextLine, 1, 17) = 'pause_brightness ' then
                   PauseBrightness.Position:= StrToFloat(Format('%1.2f', [StrToFloat(ExtractMAMEIniValue(TextLine))]))
                else
                if Copy(TextLine,1,10) = 'antialias ' then
                   Antialias.Checked:= Boolean(StrToInt(ExtractMAMEIniValue(TextLine)))
                else
                if Copy(TextLine,1,13) = 'translucency ' then
                   Translucency.Checked:= Boolean(StrToInt(ExtractMAMEIniValue(TextLine)))
                else
                if Copy(TextLine,1,5) = 'beam ' then
                   Beam.Position:= StrToFloat(Format('%2.2f', [StrToFloat(ExtractMAMEIniValue(TextLine))]))
                else
                if Copy(TextLine,1,8) = 'flicker ' then
                   Flicker.Position:= StrToFloat(Format('%3.2f', [StrToFloat(ExtractMAMEIniValue(TextLine))]))
                else
                if Copy(TextLine,1,10) = 'intensity ' then
                   Intensity.Position:= StrToFloat(Format('%1.2f', [StrToFloat(ExtractMAMEIniValue(TextLine))]))
                else
                if Copy(TextLine,1,11) = 'samplerate ' then
                   begin
                     Value:= ExtractMAMEIniValue(TextLine);
                     case StrToInt(Value) of
                       11025: SampleRate.Position:= 0;
                       22050: SampleRate.Position:= 1;
                       44100: SampleRate.Position:= 2;
                       48000: SampleRate.Position:= 3;
                       else   CustomSampleRate.Position:= StrToInt(Value);
                     end;
                   end
                else
                if Copy(TextLine,1,8) = 'samples ' then
                   Samples.Checked:= Boolean(StrToInt(ExtractMAMEIniValue(TextLine)))
                else
                if Copy(TextLine,1,15) = 'resamplefilter ' then
                   ResampleFilter.Checked:= Boolean(StrToInt(ExtractMAMEIniValue(TextLine)))
                else
                if Copy(TextLine,1,6) = 'sound ' then
                   Sound.Checked:= Boolean(StrToInt(ExtractMAMEIniValue(TextLine)))
                else
                if Copy(TextLine,1,7) = 'volume ' then
                   Volume.Position:= StrToInt(ExtractMAMEIniValue(TextLine))
                else
                if Copy(TextLine,1,8) = 'artwork ' then
                   Artwork.Checked:= Boolean(StrToInt(ExtractMAMEIniValue(TextLine)))
                else
                if Copy(TextLine,1,14) = 'use_backdrops ' then
                   Backdrop.Checked:= Boolean(StrToInt(ExtractMAMEIniValue(TextLine)))
                else
                if Copy(TextLine,1,13) = 'use_overlays ' then
                   Overlay.Checked:= Boolean(StrToInt(ExtractMAMEIniValue(TextLine)))
                else
                if Copy(TextLine,1,11) = 'use_bezels ' then
                   Bezel.Checked:= Boolean(StrToInt(ExtractMAMEIniValue(TextLine)))
                else
                if Copy(TextLine,1,13) = 'artwork_crop ' then
                   Crop.Checked:= Boolean(StrToInt(ExtractMAMEIniValue(TextLine)))
                else
                if Copy(TextLine,1,19) = 'artwork_resolution ' then
                   ArtworkResolution.Position:= StrToInt(ExtractMAMEIniValue(TextLine))
                else
                if Copy(TextLine,1,6) = 'cheat ' then
                   Cheat.Checked:= Boolean(StrToInt(ExtractMAMEIniValue(TextLine)))
                else
                if Copy(TextLine,1,6) = 'debug ' then
                   Debug.Checked:= Boolean(StrToInt(ExtractMAMEIniValue(TextLine)))
                else
                if Copy(TextLine,1,4) = 'log ' then
                   Log.Checked:= Boolean(StrToInt(ExtractMAMEIniValue(TextLine)))
                else
                if Copy(TextLine, 1, 6) = 'oslog ' then
                   OSDebug.Checked:= Boolean(StrToInt(ExtractMAMEIniValue(TextLine)))
                else
                if Copy(TextLine, 1, 16) = 'skip_disclaimer ' then
                   SkipDisclaimer.Checked:= Boolean(StrToInt(ExtractMAMEIniValue(TextLine)))
                else
                if Copy(TextLine, 1, 14) = 'skip_gameinfo ' then
                   SkipGameInfo.Checked:= Boolean(StrToInt(ExtractMAMEIniValue(TextLine)))
                else
                if Copy(TextLine,1,11) = 'readconfig ' then
                   ReadConfigFile.Checked:= Boolean(StrToInt(ExtractMAMEIniValue(TextLine)))
                else
                if Copy(TextLine,1,8) = 'verbose ' then
                   Verbose.Checked:= Boolean(StrToInt(ExtractMAMEIniValue(TextLine)));
              end;
         end;
       end;
       CloseFile(WinMAMEIniFile);
     end;
end;

procedure TFormMAMECustomConfiguration.ReadGameIniFile(EmulatorName: String);
var
  WinMAMEIniFile: TextFile;
  TextLine, Value, Value2: String;
  ctrlrKeysList: THashedStringList;
begin
  if FileExists(FormMain.IniFilesDir+'\'+GameName+'.ini') then
     begin
       AssignFile(WinMAMEIniFile, FormMain.IniFilesDir+'\'+GameName+'.ini');
       Reset(WinMAMEIniFile);
       while not Eof(WinMAMEIniFile) do
       begin
         ReadLn(WinMAMEIniFile, TextLine);
         with FormMAMECustomConfiguration do
         begin
           if (Pos('#', TextLine) <> 0) or (TextLine <> '') then
              begin
                if Copy(TextLine,1,7) = 'clones ' then
                   Clones.Checked:= Boolean(StrToInt(ExtractMAMEIniValue(TextLine)))
                else
                if Copy(TextLine,1,8) = 'rompath ' then
                   FolderROMs.Text:= ExtractMAMEIniValue(TextLine)
                else
                if Copy(TextLine,1,11) = 'samplepath ' then
                   FolderSamples.Text:= ExtractMAMEIniValue(TextLine)
                else
                if Copy(TextLine,1,14) = 'cfg_directory ' then
                   FolderGamesConfiguration.Text:= ExtractMAMEIniValue(TextLine)
                else
                if Copy(TextLine,1,16) = 'nvram_directory ' then
                   FolderNVRAM.Text:= ExtractMAMEIniValue(TextLine)
                else
                if Copy(TextLine,1,18) = 'memcard_directory ' then
                   FolderMemoryCards.Text:= ExtractMAMEIniValue(TextLine)
                else
                if Copy(TextLine,1,16) = 'input_directory ' then
                   FolderInputsRecording.Text:= ExtractMAMEIniValue(TextLine)
                else
                if Copy(TextLine,1,18) = 'hiscore_directory ' then
                   FolderHighScores.Text:= ExtractMAMEIniValue(TextLine)
                else
                if Copy(TextLine,1,16) = 'state_directory ' then
                   FolderSaveStates.Text:= ExtractMAMEIniValue(TextLine)
                else
                if Copy(TextLine,1,18) = 'artwork_directory ' then
                   FolderArtworks.Text:= ExtractMAMEIniValue(TextLine)
                else
                if Copy(TextLine,1,15) = 'diff_directory ' then
                   FolderDiff.Text:= ExtractMAMEIniValue(TextLine)
                else
                if Copy(TextLine,1,19) = 'snapshot_directory ' then
                   FolderSnapshots.Text:= ExtractMAMEIniValue(TextLine)
                else
                if Copy(TextLine,1,16) = 'ctrlr_directory ' then
                   begin
                     FolderKeysMapping.Text:= ExtractMAMEIniValue(TextLine);
                     ctrlrKeysList:= THashedStringList.Create;
                     if (Pos(':\', FolderKeysMapping.Text) > 0) or (Pos(':', FolderKeysMapping.Text) > 0) then
                        FormMain.GetControllersList(ctrlrKeysList, FolderKeysMapping.Text)
                     else
                        FormMain.GetControllersList(ctrlrKeysList, ExtractFilePath(EmulatorName)+FolderKeysMapping.Text);

                     if ctrlrKeysList.Count > 0 then
                        ControllerKeysMapping.Items.AddStrings(ctrlrKeysList);
                     FreeAndNil(ctrlrKeysList);
                   end
                else
                if Copy(TextLine,1,14) = 'autoframeskip ' then
                   AutoFrameSkip.Checked:= Boolean(StrToInt(ExtractMAMEIniValue(TextLine)))
                else
                if Copy(TextLine,1,10) = 'frameskip ' then
                   FrameSkip.Position:= StrToInt(ExtractMAMEIniValue(TextLine))
                else
                if Copy(TextLine,1,10) = 'waitvsync ' then
                   WaitVSync.Checked:= Boolean(StrToInt(ExtractMAMEIniValue(TextLine)))
                else
                if Copy(TextLine,1,13) = 'triplebuffer ' then
                   TripleBuffer.Checked:= Boolean(StrToInt(ExtractMAMEIniValue(TextLine)))
                else
                if Copy(TextLine,1,7) = 'window ' then
                   Window.Checked:= Boolean(StrToInt(ExtractMAMEIniValue(TextLine)))
                else
                if Copy(TextLine,1,6) = 'ddraw ' then
                   DirectDraw.Checked:= Boolean(StrToInt(ExtractMAMEIniValue(TextLine)))
                else
                if Copy(TextLine,1,10) = 'hwstretch ' then
                   HardwareStretch.Checked:= Boolean(StrToInt(ExtractMAMEIniValue(TextLine)))
                else
                if Copy(TextLine,1,11) = 'resolution ' then
                   begin
                     Value:= ExtractMAMEIniValue(TextLine);
                     Value2:= IntToStr(FormMain.SetResolution(Value));
                     if Value2 = '-1' then
                        CustomResolution.Text:= Value
                     else
                        Resolution.Position:= StrToInt(Value2);
                   end
                else
                if Copy(TextLine,1,8) = 'refresh ' then
                   RefreshRate.Position:= StrToInt(ExtractMAMEIniValue(TextLine))
                else
                if Copy(TextLine,1,10) = 'scanlines ' then
                   Scanlines.Checked:= Boolean(StrToInt(ExtractMAMEIniValue(TextLine)))
                else
                if Copy(TextLine,1,10) = 'switchres ' then
                   SwitchResolution.Checked:= Boolean(StrToInt(ExtractMAMEIniValue(TextLine)))
                else
                if Copy(TextLine,1,10) = 'switchbpp ' then
                   SwitchColorDepth.Checked:= Boolean(StrToInt(ExtractMAMEIniValue(TextLine)))
                else
                if Copy(TextLine,1,9) = 'maximize ' then
                   Maximize.Checked:= Boolean(StrToInt(ExtractMAMEIniValue(TextLine)))
                else
                if Copy(TextLine,1,11) = 'keepaspect ' then
                   KeepAspectRatio.Checked:= Boolean(StrToInt(ExtractMAMEIniValue(TextLine)))
                else
                if Copy(TextLine,1,13) = 'matchrefresh ' then
                   MatchRefreshRate.Checked:= Boolean(StrToInt(ExtractMAMEIniValue(TextLine)))
                else
                if Copy(TextLine,1,12) = 'syncrefresh ' then
                   SyncronizeRefreshRate.Checked:= Boolean(StrToInt(ExtractMAMEIniValue(TextLine)))
                else
                if Copy(TextLine,1,9) = 'throttle ' then
                   Throttle.Checked:= Boolean(StrToInt(ExtractMAMEIniValue(TextLine)))
                else
                if Copy(TextLine,1,23) = 'full_screen_brightness ' then
                   FullScreenBrightness.Position:= StrToFloat(Format('%1.2f', [StrToFloat(ExtractMAMEIniValue(TextLine))]))
                else
                if Copy(TextLine,1,14) = 'frames_to_run ' then
                   FramesToRun.Position:= StrToInt(ExtractMAMEIniValue(TextLine))
                else
                if Copy(TextLine,1,7) = 'effect ' then
                   Effect.Position:= FormMain.SetBlitterEffect(ExtractMAMEIniValue(TextLine))
                else
                if Copy(TextLine,1,14) = 'screen_aspect ' then
                   ScreenAspect.Position:= FormMain.SetDefaultAspectRatio(ExtractMAMEIniValue(TextLine))
                else
                if Copy(TextLine,1,6) = 'sleep ' then
                   Sleep.Checked:= Boolean(StrToInt(ExtractMAMEIniValue(TextLine)))
                else
                if Copy(TextLine, 1, 6) = 'rdtsc ' then
                   rdtsc.Checked:= Boolean(StrToInt(ExtractMAMEIniValue(TextLine)))
                else
                if Copy(TextLine,1,6) = 'mouse ' then
                   Mouse.Checked:= Boolean(StrToInt(ExtractMAMEIniValue(TextLine)))
                else
                if Copy(TextLine,1,9) = 'joystick ' then
                   Joystick.Checked:= Boolean(StrToInt(ExtractMAMEIniValue(TextLine)))
                else
                if Copy(TextLine,1,9) = 'lightgun ' then
                   Lightgun.Checked:= Boolean(StrToInt(ExtractMAMEIniValue(TextLine)))
                else
                if Copy(TextLine,1,10) = 'steadykey ' then
                   SteadyKey.Checked:= Boolean(StrToInt(ExtractMAMEIniValue(TextLine)))
                else
                if Copy(TextLine,1,14) = 'keyboard_leds ' then
                   KeyboardLEDs.Checked:= Boolean(StrToInt(ExtractMAMEIniValue(TextLine)))
                else
                if Copy(TextLine,1,13) = 'a2d_deadzone ' then
                   AnalogDigitalDeadzone.Position:= StrToFloat(Format('%1.2f', [StrToFloat(ExtractMAMEIniValue(TextLine))]))
                else
                if Copy(TextLine, 1, 8) = '# ctrlr ' then
                   ControllerKeysMapping.ItemIndex:= 0
                else
                if Copy(TextLine, 1, 6) = 'ctrlr ' then
                    begin
                      ControllerKeysMapping.ItemIndex:= ControllerKeysMapping.Items.IndexOf(ExtractMAMEiniValue(TextLine));
                      if ControllerKeysMapping.ItemIndex = -1 then
                         ControllerKeysMapping.ItemIndex:= 0;
                    end
                else
                if Copy(TextLine,1,9) = 'norotate ' then
                   NoRotate.Checked:= Boolean(StrToInt(ExtractMAMEIniValue(TextLine)))
                else
                if Copy(TextLine,1,4) = 'ror ' then
                   RotateRight.Checked:= Boolean(StrToInt(ExtractMAMEIniValue(TextLine)))
                else
                if Copy(TextLine,1,4) = 'rol ' then
                   RotateLeft.Checked:= Boolean(StrToInt(ExtractMAMEIniValue(TextLine)))
                else
                if Copy(TextLine,1,6) = 'flipx ' then
                   FlipX.Checked:= Boolean(StrToInt(ExtractMAMEIniValue(TextLine)))
                else
                if Copy(TextLine,1,6) = 'flipy ' then
                   FlipY.Checked:= Boolean(StrToInt(ExtractMAMEIniValue(TextLine)))
                else
                if Copy(TextLine,1,17) = 'debug_resolution ' then
                   DebuggerResolution.Position:= FormMain.SetDOSResolution(LowerCase(ExtractMAMEIniValue(TextLine)))
                else
                if Copy(TextLine,1,6) = 'gamma ' then
                   Gamma.Position:= StrToFloat(Format('%1.2f', [StrToFloat(ExtractMAMEIniValue(TextLine))]))
                else
                if Copy(TextLine,1,11) = 'brightness ' then
                   Brightness.Position:= StrToFloat(Format('%1.2f', [StrToFloat(ExtractMAMEIniValue(TextLine))]))
                else
                if Copy(TextLine, 1, 17) = 'pause_brightness ' then
                   PauseBrightness.Position:= StrToFloat(Format('%1.2f', [StrToFloat(ExtractMAMEIniValue(TextLine))]))
                else
                if Copy(TextLine,1,10) = 'antialias ' then
                   Antialias.Checked:= Boolean(StrToInt(ExtractMAMEIniValue(TextLine)))
                else
                if Copy(TextLine,1,13) = 'translucency ' then
                   Translucency.Checked:= Boolean(StrToInt(ExtractMAMEIniValue(TextLine)))
                else
                if Copy(TextLine,1,5) = 'beam ' then
                   Beam.Position:= StrToFloat(Format('%2.2f', [StrToFloat(ExtractMAMEIniValue(TextLine))]))
                else
                if Copy(TextLine,1,8) = 'flicker ' then
                   Flicker.Position:= StrToFloat(Format('%3.2f', [StrToFloat(ExtractMAMEIniValue(TextLine))]))
                else
                if Copy(TextLine,1,10) = 'intensity ' then
                   Intensity.Position:= StrToFloat(Format('%1.2f', [StrToFloat(ExtractMAMEIniValue(TextLine))]))
                else
                if Copy(TextLine,1,11) = 'samplerate ' then
                   begin
                     Value:= ExtractMAMEIniValue(TextLine);
                     case StrToInt(Value) of
                       11025: SampleRate.Position:= 0;
                       22050: SampleRate.Position:= 1;
                       44100: SampleRate.Position:= 2;
                       48000: SampleRate.Position:= 3;
                       else   CustomSampleRate.Position:= StrToInt(Value);
                     end;
                   end
                else
                if Copy(TextLine,1,8) = 'samples ' then
                   Samples.Checked:= Boolean(StrToInt(ExtractMAMEIniValue(TextLine)))
                else
                if Copy(TextLine,1,15) = 'resamplefilter ' then
                   ResampleFilter.Checked:= Boolean(StrToInt(ExtractMAMEIniValue(TextLine)))
                else
                if Copy(TextLine,1,6) = 'sound ' then
                   Sound.Checked:= Boolean(StrToInt(ExtractMAMEIniValue(TextLine)))
                else
                if Copy(TextLine,1,7) = 'volume ' then
                   Volume.Position:= StrToInt(ExtractMAMEIniValue(TextLine))
                else
                if Copy(TextLine,1,8) = 'artwork ' then
                   Artwork.Checked:= Boolean(StrToInt(ExtractMAMEIniValue(TextLine)))
                else
                if Copy(TextLine,1,14) = 'use_backdrops ' then
                   Backdrop.Checked:= Boolean(StrToInt(ExtractMAMEIniValue(TextLine)))
                else
                if Copy(TextLine,1,13) = 'use_overlays ' then
                   Overlay.Checked:= Boolean(StrToInt(ExtractMAMEIniValue(TextLine)))
                else
                if Copy(TextLine,1,11) = 'use_bezels ' then
                   Bezel.Checked:= Boolean(StrToInt(ExtractMAMEIniValue(TextLine)))
                else
                if Copy(TextLine,1,13) = 'artwork_crop ' then
                   Crop.Checked:= Boolean(StrToInt(ExtractMAMEIniValue(TextLine)))
                else
                if Copy(TextLine,1,19) = 'artwork_resolution ' then
                   ArtworkResolution.Position:= StrToInt(ExtractMAMEIniValue(TextLine))
                else
                if Copy(TextLine,1,6) = 'cheat ' then
                   Cheat.Checked:= Boolean(StrToInt(ExtractMAMEIniValue(TextLine)))
                else
                if Copy(TextLine,1,6) = 'debug ' then
                   Debug.Checked:= Boolean(StrToInt(ExtractMAMEIniValue(TextLine)))
                else
                if Copy(TextLine,1,4) = 'log ' then
                   Log.Checked:= Boolean(StrToInt(ExtractMAMEIniValue(TextLine)))
                else
                if Copy(TextLine, 1, 6) = 'oslog ' then
                   OSDebug.Checked:= Boolean(StrToInt(ExtractMAMEIniValue(TextLine)))
                else
                if Copy(TextLine, 1, 16) = 'skip_disclaimer ' then
                   SkipDisclaimer.Checked:= Boolean(StrToInt(ExtractMAMEIniValue(TextLine)))
                else
                if Copy(TextLine, 1, 14) = 'skip_gameinfo ' then
                   SkipGameInfo.Checked:= Boolean(StrToInt(ExtractMAMEIniValue(TextLine)))
                else
                if Copy(TextLine,1,11) = 'readconfig ' then
                   ReadConfigFile.Checked:= Boolean(StrToInt(ExtractMAMEIniValue(TextLine)))
                else
                if Copy(TextLine,1,8) = 'verbose ' then
                   Verbose.Checked:= Boolean(StrToInt(ExtractMAMEIniValue(TextLine)));
              end;
         end;
       end;
       CloseFile(WinMAMEIniFile);
     end;
end;

procedure TFormMAMECustomConfiguration.UpdateGameIniFile(EmulatorName: String);
var
  WinMAMEIniFile: TextFile;
  TextLine, Value, OriginalFile: String;
  GameIniFile: THashedStringList;
  Line: Integer;
begin
  OriginalFile:= ExtractFilePath(EmulatorName)+FormMain.GetExecutableINIFileName(EmulatorName);
  CopyFile(PChar(OriginalFile), PChar(FormMain.IniFilesDir+'\'+GameName+'.ini'), False);

  if (FileExists(OriginalFile)) and (FileExists(FormMain.IniFilesDir+'\'+GameName+'.ini')) then
     begin
       AssignFile(WinMAMEIniFile, OriginalFile);
       GameIniFile:= THashedStringList.Create;
       GameIniFile.LoadFromFile(FormMain.IniFilesDir+'\'+GameName+'.ini');
       Reset(WinMAMEIniFile);
       Line:= 0;
       while not Eof(WinMAMEIniFile) do
       begin
         ReadLn(WinMAMEIniFile, TextLine);
         with FormMAMECustomConfiguration do
         begin
           if (Pos('#', TextLine) <> 0) or (TextLine <> '') then
              begin
                if Copy(TextLine,1,7) = 'clones ' then
                    begin
                      if StrToInt(ExtractMAMEIniValue(TextLine)) = Ord(Clones.Checked) then
                         GameIniFile.Strings[Line]:= ''
                      else
                         GameIniFile.Strings[Line]:= 'clones                  '+IntToStr(Ord(Clones.Checked));
                    end
                else
                if Copy(TextLine,1,8) = 'rompath ' then
                   begin
                     if ExtractMAMEIniValue(TextLine) = FolderROMs.Text then
                        GameIniFile.Strings[Line]:= ''
                     else
                        GameIniFile.Strings[Line]:= 'rompath                 '+FolderROMs.Text;
                   end
                else
                if Copy(TextLine,1,11) = 'samplepath ' then
                   begin
                     if ExtractMAMEIniValue(TextLine) = FolderSamples.Text then
                        GameIniFile.Strings[Line]:= ''
                     else
                        GameIniFile.Strings[Line]:= 'samplepath              '+FolderSamples.Text;
                   end
                else
                if (Copy(TextLine, 1, 8) = 'inipath ') or (Copy(TextLine, 1, 10) = '# inipath ') then
                   GameIniFile.Strings[Line]:= ''
                else
                if Copy(TextLine,1,14) = 'cfg_directory ' then
                   begin
                     if ExtractMAMEIniValue(TextLine) = FolderGamesConfiguration.Text then
                        GameIniFile.Strings[Line]:= ''
                     else
                        GameIniFile.Strings[Line]:= 'cfg_directory           '+FolderGamesConfiguration.Text;
                   end
                else
                if Copy(TextLine,1,16) = 'nvram_directory ' then
                   begin
                     if ExtractMAMEIniValue(TextLine) = FolderNVRAM.Text then
                        GameIniFile.Strings[Line]:= ''
                     else
                        GameIniFile.Strings[Line]:= 'nvram_directory         '+FolderNVRAM.Text;
                   end
                else
                if Copy(TextLine,1,18) = 'memcard_directory ' then
                   begin
                     if ExtractMAMEIniValue(TextLine) = FolderMemoryCards.Text then
                        GameIniFile.Strings[Line]:= ''
                     else
                        GameIniFile.Strings[Line]:= 'memcard_directory       '+FolderMemoryCards.Text;
                   end
                else
                if Copy(TextLine,1,16) = 'input_directory ' then
                   begin
                     if ExtractMAMEIniValue(TextLine) = FolderInputsRecording.Text then
                        GameIniFile.Strings[Line]:= ''
                     else
                        GameIniFile.Strings[Line]:= 'input_directory         '+FolderInputsRecording.Text;
                   end
                else
                if Copy(TextLine,1,18) = 'hiscore_directory ' then
                   begin
                     if ExtractMAMEIniValue(TextLine) = FolderHighScores.Text then
                        GameIniFile.Strings[Line]:= ''
                     else
                        GameIniFile.Strings[Line]:= 'hiscore_directory       '+FolderHighScores.Text;
                   end
                else
                if Copy(TextLine,1,16) = 'state_directory ' then
                   begin
                     if ExtractMAMEIniValue(TextLine) = FolderSaveStates.Text then
                        GameIniFile.Strings[Line]:= ''
                     else
                        GameIniFile.Strings[Line]:= 'state_directory         '+FolderSaveStates.Text;
                   end
                else
                if Copy(TextLine,1,18) = 'artwork_directory ' then
                   begin
                     if ExtractMAMEIniValue(TextLine) = FolderArtworks.Text then
                        GameIniFile.Strings[Line]:= ''
                     else
                        GameIniFile.Strings[Line]:= 'artwork_directory       '+FolderArtworks.Text;
                   end
                else
                if Copy(TextLine,1,15) = 'diff_directory ' then
                   begin
                     if ExtractMAMEIniValue(TextLine) = FolderDiff.Text then
                        GameIniFile.Strings[Line]:= ''
                     else
                        GameIniFile.Strings[Line]:= 'diff_directory          '+FolderDiff.Text;
                   end
                else
                if Copy(TextLine,1,19) = 'snapshot_directory ' then
                   begin
                     if ExtractMAMEIniValue(TextLine) = FolderSnapshots.Text then
                        GameIniFile.Strings[Line]:= ''
                     else
                        GameIniFile.Strings[Line]:= 'snapshot_directory      '+FolderSnapshots.Text;
                   end
                else
                if Copy(TextLine,1,11) = 'cheat_file ' then
                   GameIniFile.Strings[Line]:= ''
                 else
                if Copy(TextLine,1,13) = 'history_file ' then
                   GameIniFile.Strings[Line]:= ''
                 else
                if Copy(TextLine,1,14) = 'mameinfo_file ' then
                   GameIniFile.Strings[Line]:= ''
                else
                if Copy(TextLine,1,16) = 'ctrlr_directory ' then
                   begin
                     if ExtractMAMEIniValue(TextLine) = FolderKeysMapping.Text then
                        GameIniFile.Strings[Line]:= ''
                     else
                        GameIniFile.Strings[Line]:= 'ctrlr_directory         '+FolderKeysMapping.Text;
                   end
                else
                if Copy(TextLine,1,14) = 'autoframeskip ' then
                   begin
                     if StrToInt(ExtractMAMEIniValue(TextLine)) = Ord(AutoFrameSkip.Checked) then
                        GameIniFile.Strings[Line]:= ''
                     else
                        GameIniFile.Strings[Line]:= 'autoframeskip           '+IntToStr(Ord(AutoFrameSkip.Checked));
                   end
                else
                if Copy(TextLine,1,10) = 'frameskip ' then
                   begin
                     if StrToInt(ExtractMAMEIniValue(TextLine)) = FrameSkip.Position then
                        GameIniFile.Strings[Line]:= ''
                     else
                        GameIniFile.Strings[Line]:= 'frameskip               '+IntToStr(FrameSkip.Position);
                   end
                else
                if Copy(TextLine,1,10) = 'waitvsync ' then
                   begin
                     if StrToInt(ExtractMAMEIniValue(TextLine)) = Ord(WaitVSync.Checked) then
                        GameIniFile.Strings[Line]:= ''
                     else
                        GameIniFile.Strings[Line]:= 'waitvsync               '+IntToStr(Ord(WaitVSync.Checked));
                   end
                else
                if Copy(TextLine,1,13) = 'triplebuffer ' then
                   begin
                     if StrToInt(ExtractMAMEIniValue(TextLine)) = Ord(TripleBuffer.Checked) then
                        GameIniFile.Strings[Line]:= ''
                     else
                        GameIniFile.Strings[Line]:= 'triplebuffer            '+IntToStr(Ord(TripleBuffer.Checked));
                   end
                else
                if Copy(TextLine,1,7) = 'window ' then
                   begin
                     if StrToInt(ExtractMAMEIniValue(TextLine)) = Ord(Window.Checked) then
                        GameIniFile.Strings[Line]:= ''
                     else
                        GameIniFile.Strings[Line]:= 'window                  '+IntToStr(Ord(Window.Checked));
                   end
                else
                if Copy(TextLine,1,6) = 'ddraw ' then
                   begin
                     if StrToInt(ExtractMAMEIniValue(TextLine)) = Ord(DirectDraw.Checked) then
                        GameIniFile.Strings[Line]:= ''
                     else
                        GameIniFile.Strings[Line]:= 'ddraw                   '+IntToStr(Ord(DirectDraw.Checked));
                   end
                else
                if Copy(TextLine,1,10) = 'hwstretch ' then
                   begin
                     if StrToInt(ExtractMAMEIniValue(TextLine)) = Ord(HardwareStretch.Checked) then
                        GameIniFile.Strings[Line]:= ''
                     else
                        GameIniFile.Strings[Line]:= 'hwstretch               '+IntToStr(Ord(HardwareStretch.Checked));
                   end
                else
                if Copy(TextLine,1,11) = 'resolution ' then
                   begin
                     Value:= LowerCase(ExtractMAMEIniValue(TextLine));
                     if Value = LowerCase(LabelResolutionValue.Caption) then
                        begin
                          if LowerCase(CustomResolution.Text) = '' then
                             GameIniFile.Strings[Line]:= ''
                          else
                             begin
                               if Value = LowerCase(CustomResolution.Text) then
                                  GameIniFile.Strings[Line]:= ''
                               else
                                  GameIniFile.Strings[Line]:= 'resolution              '+LowerCase(CustomResolution.Text);
                             end;
                        end
                     else
                        begin
                          if LowerCase(CustomResolution.Text) = '' then
                             GameIniFile.Strings[Line]:= 'resolution              '+LowerCase(LabelResolutionValue.Caption)
                          else
                             begin
                               if Value = LowerCase(CustomResolution.Text) then
                                  GameIniFile.Strings[Line]:= ''
                               else
                                  GameIniFile.Strings[Line]:= 'resolution              '+LowerCase(CustomResolution.Text);
                             end;
                        end;
                   end
                else
                if Copy(TextLine,1,8) = 'refresh ' then
                   begin
                     if StrToInt(ExtractMAMEIniValue(TextLine)) = RefreshRate.Position then
                        GameIniFile.Strings[Line]:= ''
                     else
                        GameIniFile.Strings[Line]:= 'refresh                 '+IntToStr(RefreshRate.Position);
                   end
                else
                if Copy(TextLine,1,10) = 'scanlines ' then
                   begin
                     if StrToInt(ExtractMAMEIniValue(TextLine)) = Ord(Scanlines.Checked) then
                        GameIniFile.Strings[Line]:= ''
                     else
                        GameIniFile.Strings[Line]:= 'scanlines               '+IntToStr(Ord(Scanlines.Checked));
                   end
                else
                if Copy(TextLine,1,10) = 'switchres ' then
                   begin
                     if StrToInt(ExtractMAMEIniValue(TextLine)) = Ord(SwitchResolution.Checked) then
                        GameIniFile.Strings[Line]:= ''
                     else
                        GameIniFile.Strings[Line]:= 'switchres               '+IntToStr(Ord(SwitchResolution.Checked));
                   end
                else
                if Copy(TextLine,1,10) = 'switchbpp ' then
                   begin
                     if StrToInt(ExtractMAMEIniValue(TextLine)) = Ord(SwitchColorDepth.Checked) then
                        GameIniFile.Strings[Line]:= ''
                     else
                        GameIniFile.Strings[Line]:= 'switchbpp               '+IntToStr(Ord(SwitchColorDepth.Checked));
                   end
                else
                if Copy(TextLine,1,9) = 'maximize ' then
                   begin
                     if StrToInt(ExtractMAMEIniValue(TextLine)) = Ord(Maximize.Checked) then
                        GameIniFile.Strings[Line]:= ''
                     else
                        GameIniFile.Strings[Line]:= 'maximize                '+IntToStr(Ord(Maximize.Checked));
                   end
                else
                if Copy(TextLine,1,11) = 'keepaspect ' then
                   begin
                     if StrToInt(ExtractMAMEIniValue(TextLine)) = Ord(KeepAspectRatio.Checked) then
                        GameIniFile.Strings[Line]:= ''
                     else
                        GameIniFile.Strings[Line]:= 'keepaspect              '+IntToStr(Ord(KeepAspectRatio.Checked));
                   end
                else
                if Copy(TextLine,1,13) = 'matchrefresh ' then
                   begin
                     if StrToInt(ExtractMAMEIniValue(TextLine)) = Ord(MatchRefreshRate.Checked) then
                        GameIniFile.Strings[Line]:= ''
                     else
                        GameIniFile.Strings[Line]:= 'matchrefresh            '+IntToStr(Ord(MatchRefreshRate.Checked));
                   end
                else
                if Copy(TextLine,1,12) = 'syncrefresh ' then
                   begin
                     if StrToInt(ExtractMAMEIniValue(TextLine)) = Ord(SyncronizeRefreshRate.Checked) then
                        GameIniFile.Strings[Line]:= ''
                     else
                        GameIniFile.Strings[Line]:= 'syncrefresh             '+IntToStr(Ord(SyncronizeRefreshRate.Checked));
                   end
                else
                if Copy(TextLine,1,9) = 'throttle ' then
                   begin
                     if StrToInt(ExtractMAMEIniValue(TextLine)) = Ord(Throttle.Checked) then
                         GameIniFile.Strings[Line]:= ''
                     else
                         GameIniFile.Strings[Line]:= 'throttle                '+IntToStr(Ord(Throttle.Checked));
                   end
                else
                if Copy(TextLine,1,23) = 'full_screen_brightness ' then
                   begin
                     if StrToFloat(ExtractMAMEIniValue(TextLine)) = FullScreenBrightness.Position then
                        GameIniFile.Strings[Line]:= ''
                     else
                        GameIniFile.Strings[Line]:= 'full_screen_brightness   '+FloatToStr(FullScreenBrightness.Position);
                   end
                else
                if Copy(TextLine,1,14) = 'frames_to_run ' then
                   begin
                     if StrToInt(ExtractMAMEIniValue(TextLine)) = FramesToRun.Position then
                        GameIniFile.Strings[Line]:= ''
                     else
                        GameIniFile.Strings[Line]:= 'frames_to_run           '+IntToStr(FramesToRun.Position);
                   end
                else
                if Copy(TextLine,1,7) = 'effect ' then
                   begin
                     Value:= ExtractMAMEIniValue(TextLine);
                     if ((ExtractMAMEIniValue(TextLine) = 'none')    and (Effect.Position = 0)  or
                         (ExtractMAMEIniValue(TextLine) = 'scan25')  and (Effect.Position = 1)  or
                         (ExtractMAMEIniValue(TextLine) = 'scan50')  and (Effect.Position = 2)  or
                         (ExtractMAMEIniValue(TextLine) = 'scan75')  and (Effect.Position = 3)  or
                         (ExtractMAMEIniValue(TextLine) = 'rgb16')   and (Effect.Position = 4)  or
                         (ExtractMAMEIniValue(TextLine) = 'rgb6')    and (Effect.Position = 5)  or
                         (ExtractMAMEIniValue(TextLine) = 'rgb4')    and (Effect.Position = 6)  or
                         (ExtractMAMEIniValue(TextLine) = 'rgb4v')   and (Effect.Position = 7)  or
                         (ExtractMAMEIniValue(TextLine) = 'rgb3')    and (Effect.Position = 8)  or
                         (ExtractMAMEIniValue(TextLine) = 'rgbtiny') and (Effect.Position = 9)  or
                         (ExtractMAMEIniValue(TextLine) = 'scan75v') and (Effect.Position = 10) or
                         (ExtractMAMEIniValue(TextLine) = 'sharp')   and (Effect.Position = 11)) then
                        GameIniFile.Strings[Line]:= ''
                     else
                        begin
                          case Effect.Position of
                             0: GameIniFile.Strings[Line]:= 'effect                  none';
                             1: GameIniFile.Strings[Line]:= 'effect                  scan25';
                             2: GameIniFile.Strings[Line]:= 'effect                  scan50';
                             3: GameIniFile.Strings[Line]:= 'effect                  scan75';
                             4: GameIniFile.Strings[Line]:= 'effect                  rgb16';
                             5: GameIniFile.Strings[Line]:= 'effect                  rgb6';
                             6: GameIniFile.Strings[Line]:= 'effect                  rgb4';
                             7: GameIniFile.Strings[Line]:= 'effect                  rgb4v';
                             8: GameIniFile.Strings[Line]:= 'effect                  rgb3';
                             9: GameIniFile.Strings[Line]:= 'effect                  rgbtiny';
                            10: GameIniFile.Strings[Line]:= 'effect                  scan75v';
                            11: GameIniFile.Strings[Line]:= 'effect                  sharp';
                          end;
                        end;
                   end
                else
                if Copy(TextLine,1,14) = 'screen_aspect ' then
                   begin
                     if ExtractMAMEIniValue(TextLine) = LabelScreenAspectValue.Caption then
                        GameIniFile.Strings[Line]:= ''
                     else
                        GameIniFile.Strings[Line]:= 'screen_aspect           '+LabelScreenAspectValue.Caption;
                   end
                else
                if Copy(TextLine,1,6) = 'sleep ' then
                   begin
                     if StrToInt(ExtractMAMEIniValue(TextLine)) = Ord(Sleep.Checked) then
                        GameIniFile.Strings[Line]:= ''
                     else
                        GameIniFile.Strings[Line]:= 'sleep                   '+IntToStr(Ord(Sleep.Checked));
                   end
                else
                if Copy(TextLine, 1, 6) = 'rdtsc ' then
                   begin
                     if StrToInt(ExtractMAMEIniValue(TextLine)) = Ord(rdtsc.Checked) then
                        GameIniFile.Strings[Line]:= ''
                     else
                        GameIniFile.Strings[Line]:= 'rdtsc                   '+IntToStr(Ord(rdtsc.Checked));
                   end
                else
                if Copy(TextLine,1,6) = 'mouse ' then
                   begin
                     if StrToInt(ExtractMAMEIniValue(TextLine)) = Ord(Mouse.Checked) then
                        GameIniFile.Strings[Line]:= ''
                     else
                        GameIniFile.Strings[Line]:= 'mouse                   '+IntToStr(Ord(Mouse.Checked));
                   end
                else
                if Copy(TextLine,1,9) = 'joystick ' then
                   begin
                     if StrToInt(ExtractMAMEIniValue(TextLine)) = Ord(Joystick.Checked) then
                        GameIniFile.Strings[Line]:= ''
                     else
                        GameIniFile.Strings[Line]:= 'joystick                '+IntToStr(Ord(Joystick.Checked));
                   end
                else
                if Copy(TextLine,1,9) = 'lightgun ' then
                   begin
                     if StrToInt(ExtractMAMEIniValue(TextLine)) = Ord(Lightgun.Checked) then
                        GameIniFile.Strings[Line]:= ''
                     else
                        GameIniFile.Strings[Line]:= 'lightgun                '+IntToStr(Ord(Lightgun.Checked));
                   end
                else
                if Copy(TextLine,1,10) = 'steadykey ' then
                   begin
                     if StrToInt(ExtractMAMEIniValue(TextLine)) = Ord(SteadyKey.Checked) then
                        GameIniFile.Strings[Line]:= ''
                     else
                        GameIniFile.Strings[Line]:= 'steadykey               '+IntToStr(Ord(SteadyKey.Checked));
                   end
                else
                if Copy(TextLine,1,14) = 'keyboard_leds ' then
                   begin
                     if StrToInt(ExtractMAMEIniValue(TextLine)) = Ord(KeyboardLEDs.Checked) then
                        GameIniFile.Strings[Line]:= ''
                     else
                        GameIniFile.Strings[Line]:= 'keyboard_leds           '+IntToStr(Ord(KeyboardLEDs.Checked));
                   end
                else
                if Copy(TextLine,1,13) = 'a2d_deadzone ' then
                   begin
                     if ExtractMAMEIniValue(TextLine) = LabelAnalogDigitalDeadzoneValue.Caption then
                        GameIniFile.Strings[Line]:= ''
                     else
                        GameIniFile.Strings[Line]:= 'a2d_deadzone            '+LabelAnalogDigitalDeadzoneValue.Caption;
                   end
                else
                if (Copy(TextLine,1,8) = '# ctrlr ') or (Copy(TextLine,1,6) = 'ctrlr ') then
                   begin
                     if ExtractMAMEIniValue(TextLine) = ControllerKeysMapping.Text then
                        GameIniFile.Strings[Line]:= ''
                     else
                        begin
                          if Copy(TextLine,1,8) = '# ctrlr ' then
                             begin
                               if ControllerKeysMapping.ItemIndex = 0 then
                                  GameIniFile.Strings[Line]:= ''
                               else
                                  GameIniFile.Strings[Line]:= 'ctrlr                   '+ControllerKeysMapping.Text;
                             end
                          else
                             begin
                               if ControllerKeysMapping.ItemIndex = 0 then
                                  GameIniFile.Strings[Line]:= '# ctrlr                 <NULL> (not set)'
                               else
                                  GameIniFile.Strings[Line]:= 'ctrlr                   '+ControllerKeysMapping.Text;
                             end;
                        end;
                   end
                else
                if Copy(TextLine,1,9) = 'norotate ' then
                   begin
                     if StrToInt(ExtractMAMEIniValue(TextLine)) = Ord(NoRotate.Checked) then
                        GameIniFile.Strings[Line]:= ''
                     else
                        GameIniFile.Strings[Line]:= 'norotate                '+IntToStr(Ord(NoRotate.Checked));
                   end
                else
                if Copy(TextLine,1,4) = 'ror ' then
                   begin
                     if StrToInt(ExtractMAMEIniValue(TextLine)) = Ord(RotateRight.Checked) then
                        GameIniFile.Strings[Line]:= ''
                     else
                        GameIniFile.Strings[Line]:= 'ror                     '+IntToStr(Ord(RotateRight.Checked));
                   end
                else
                if Copy(TextLine,1,4) = 'rol ' then
                   begin
                     if StrToInt(ExtractMAMEIniValue(TextLine)) = Ord(RotateLeft.Checked) then
                        GameIniFile.Strings[Line]:= ''
                     else
                        GameIniFile.Strings[Line]:= 'rol                     '+IntToStr(Ord(RotateLeft.Checked));
                   end
                else
                if Copy(TextLine,1,6) = 'flipx ' then
                   begin
                     if StrToInt(ExtractMAMEIniValue(TextLine)) = Ord(FlipX.Checked) then
                        GameIniFile.Strings[Line]:= ''
                     else
                        GameIniFile.Strings[Line]:= 'flipx                   '+IntToStr(Ord(FlipX.Checked));
                   end
                else
                if Copy(TextLine,1,6) = 'flipy ' then
                   begin
                     if StrToInt(ExtractMAMEIniValue(TextLine)) = Ord(FlipY.Checked) then
                        GameIniFile.Strings[Line]:= ''
                     else
                        GameIniFile.Strings[Line]:= 'flipy                   '+IntToStr(Ord(FlipY.Checked));
                   end
                else
                if Copy(TextLine,1,17) = 'debug_resolution ' then
                   begin
                     if LowerCase(ExtractMAMEIniValue(TextLine)) = LowerCase(LabelDebuggerResolutionValue.Caption) then
                        GameIniFile.Strings[Line]:= ''
                     else
                        GameIniFile.Strings[Line]:= 'debug_resolution        '+LowerCase(LabelDebuggerResolutionValue.Caption);
                   end
                else
                if Copy(TextLine,1,6) = 'gamma ' then
                   begin
                     if StrToFloat(Format('%1.2f', [StrToFloat(ExtractMAMEIniValue(TextLine))])) = Gamma.Position then
                        GameIniFile.Strings[Line]:= ''
                     else
                        GameIniFile.Strings[Line]:= 'gamma                   '+FloatToStr(Gamma.Position);
                   end
                else
                if Copy(TextLine,1,11) = 'brightness ' then
                   begin
                     if Format('%1.2f', [StrToFloat(ExtractMAMEIniValue(TextLine))]) = LabelBrightnessValue.Caption then
                        GameIniFile.Strings[Line]:= ''
                     else
                        GameIniFile.Strings[Line]:= 'brightness              '+LabelBrightnessValue.Caption;
                   end
                else
                if Copy(TextLine, 1, 17) = 'pause_brightness ' then
                   begin
                     if Format('%1.2f', [StrToFloat(ExtractMAMEIniValue(TextLine))]) = LabelPauseBrightnessValue.Caption then
                        GameIniFile.Strings[Line]:= ''
                     else
                        GameIniFile.Strings[Line]:= 'pause_brightness        '+LabelPauseBrightnessValue.Caption;
                   end
                else
                if Copy(TextLine,1,10) = 'antialias ' then
                   begin
                     if StrToInt(ExtractMAMEIniValue(TextLine)) = Ord(Antialias.Checked) then
                        GameIniFile.Strings[Line]:= ''
                     else
                        GameIniFile.Strings[Line]:= 'antialias               '+IntToStr(Ord(Antialias.Checked));
                   end
                else
                if Copy(TextLine,1,13) = 'translucency ' then
                   begin
                     if StrToInt(ExtractMAMEIniValue(TextLine)) = Ord(Translucency.Checked) then
                        GameIniFile.Strings[Line]:= ''
                     else
                        GameIniFile.Strings[Line]:= 'translucency            '+IntToStr(Ord(Translucency.Checked));
                   end
                else
                if Copy(TextLine,1,5) = 'beam ' then
                   begin
                     if StrToFloat(Format('%2.2f', [StrToFloat(ExtractMAMEIniValue(TextLine))])) = Beam.Position then
                        GameIniFile.Strings[Line]:= ''
                     else
                        GameIniFile.Strings[Line]:= 'beam                    '+FloatToStr(Beam.Position);
                   end
                else
                if Copy(TextLine,1,8) = 'flicker ' then
                   begin
                     if StrToFloat(Format('%3.2f', [StrToFloat(ExtractMAMEIniValue(TextLine))])) = Flicker.Position then
                        GameIniFile.Strings[Line]:= ''
                     else
                        GameIniFile.Strings[Line]:= 'flicker                 '+FloatToStr(Flicker.Position);
                   end
                else
                if Copy(TextLine,1,10) = 'intensity ' then
                   begin
                     if Format('%1.2f', [StrToFloat(ExtractMAMEIniValue(TextLine))]) = LabelIntensityValue.Caption then
                        GameIniFile.Strings[Line]:= ''
                     else
                        GameIniFile.Strings[Line]:= 'intensity               '+LabelIntensityValue.Caption;
                   end
                else
                if Copy(TextLine,1,11) = 'samplerate ' then
                   begin
                     if ExtractMAMEIniValue(TextLine) = IntToStr(CustomSampleRate.Position) then
                        GameIniFile.Strings[Line]:= ''
                     else
                        begin
                          if CustomSampleRate.Position = 4999 then
                             begin
                               case SampleRate.Position of
                                 0: Value:= '11025';
                                 1: Value:= '22050';
                                 2: Value:= '44100';
                                 3: Value:= '48000';
                               end;
                             end
                          else
                             Value:=IntToStr(CustomSampleRate.Position);

                          if ExtractMAMEIniValue(TextLine) = Value then
                             GameIniFile.Strings[Line]:= ''
                          else
                             GameIniFile.Strings[Line]:= 'samplerate              '+Value;
                        end;
                   end
                else
                if Copy(TextLine,1,8) = 'samples ' then
                   begin
                     if StrToInt(ExtractMAMEIniValue(TextLine)) = Ord(Samples.Checked) then
                        GameIniFile.Strings[Line]:= ''
                     else
                        GameIniFile.Strings[Line]:= 'samples                 '+IntToStr(Ord(Samples.Checked));
                   end
                else
                if Copy(TextLine,1,15) = 'resamplefilter ' then
                   begin
                     if StrToInt(ExtractMAMEIniValue(TextLine)) = Ord(ResampleFilter.Checked) then
                        GameIniFile.Strings[Line]:= ''
                     else
                        GameIniFile.Strings[Line]:= 'resamplefilter          '+IntToStr(Ord(ResampleFilter.Checked));
                   end
                else
                if Copy(TextLine,1,6) = 'sound ' then
                   begin
                     if StrToInt(ExtractMAMEIniValue(TextLine)) = Ord(Sound.Checked) then
                        GameIniFile.Strings[Line]:= ''
                     else
                        GameIniFile.Strings[Line]:= 'sound                   '+IntToStr(Ord(Sound.Checked));
                   end
                else
                if Copy(TextLine,1,7) = 'volume ' then
                   begin
                     if StrToInt(ExtractMAMEIniValue(TextLine)) = Volume.Position then
                        GameIniFile.Strings[Line]:= ''
                     else
                        GameIniFile.Strings[Line]:= 'volume                  '+IntToStr(Volume.Position);
                   end
                else
                if Copy(TextLine,1,8) = 'artwork ' then
                   begin
                     if StrToInt(ExtractMAMEIniValue(TextLine)) = Ord(Artwork.Checked) then
                        GameIniFile.Strings[Line]:= ''
                     else
                        GameIniFile.Strings[Line]:= 'artwork                 '+IntToStr(Ord(Artwork.Checked));
                   end
                else
                if Copy(TextLine,1,14) = 'use_backdrops ' then
                   begin
                     if StrToInt(ExtractMAMEIniValue(TextLine)) = Ord(Backdrop.Checked) then
                        GameIniFile.Strings[Line]:= ''
                     else
                        GameIniFile.Strings[Line]:= 'use_backdrops           '+IntToStr(Ord(Backdrop.Checked));
                   end
                else
                if Copy(TextLine,1,13) = 'use_overlays ' then
                   begin
                     if StrToInt(ExtractMAMEIniValue(TextLine)) = Ord(Overlay.Checked) then
                        GameIniFile.Strings[Line]:= ''
                     else
                        GameIniFile.Strings[Line]:= 'use_overlays            '+IntToStr(Ord(Overlay.Checked));
                   end
                else
                if Copy(TextLine,1,11) = 'use_bezels ' then
                   begin
                     if StrToInt(ExtractMAMEIniValue(TextLine)) = Ord(Bezel.Checked) then
                        GameIniFile.Strings[Line]:= ''
                     else
                        GameIniFile.Strings[Line]:= 'use_bezels              '+IntToStr(Ord(Bezel.Checked));
                   end
                else
                if Copy(TextLine,1,13) = 'artwork_crop ' then
                   begin
                     if StrToInt(ExtractMAMEIniValue(TextLine)) = Ord(Crop.Checked) then
                        GameIniFile.Strings[Line]:= ''
                     else
                        GameIniFile.Strings[Line]:= 'artwork_crop            '+IntToStr(Ord(Crop.Checked));
                   end
                else
                if Copy(TextLine,1,19) = 'artwork_resolution ' then
                   begin
                     if StrToInt(ExtractMAMEIniValue(TextLine)) = ArtworkResolution.Position then
                        GameIniFile.Strings[Line]:= ''
                     else
                        GameIniFile.Strings[Line]:= 'artwork_resolution      '+IntToStr(ArtworkResolution.Position);
                   end
                else
                if Copy(TextLine,1,6) = 'cheat ' then
                   begin
                     if StrToInt(ExtractMAMEIniValue(TextLine)) = Ord(Cheat.Checked) then
                        GameIniFile.Strings[Line]:= ''
                     else
                        GameIniFile.Strings[Line]:= 'cheat                   '+IntToStr(Ord(Cheat.Checked));
                   end
                else
                if Copy(TextLine,1,6) = 'debug ' then
                   begin
                     if StrToInt(ExtractMAMEIniValue(TextLine)) = Ord(Debug.Checked) then
                        GameIniFile.Strings[Line]:= ''
                     else
                        GameIniFile.Strings[Line]:= 'debug                   '+IntToStr(Ord(Debug.Checked));
                   end
                else
                if Copy(TextLine,1,4) = 'log ' then
                   begin
                     if StrToInt(ExtractMAMEIniValue(TextLine)) = Ord(Log.Checked) then
                        GameIniFile.Strings[Line]:= ''
                     else
                        GameIniFile.Strings[Line]:= 'log                     '+IntToStr(Ord(Log.Checked));
                   end
                else
                if Copy(TextLine, 1, 6) = 'oslog ' then
                   begin
                     if StrToInt(ExtractMAMEIniValue(TextLine)) = Ord(OSDebug.Checked) then
                        GameIniFile.Strings[Line]:= ''
                     else
                        GameIniFile.Strings[Line]:= 'oslog                   '+IntToStr(Ord(OSDebug.Checked));
                   end
                else
                if Copy(TextLine, 1, 16) = 'skip_disclaimer ' then
                   begin
                     if StrToInt(ExtractMAMEIniValue(TextLine)) = Ord(SkipDisclaimer.Checked) then
                        GameIniFile.Strings[Line]:= ''
                     else
                        GameIniFile.Strings[Line]:= 'skip_disclaimer         '+IntToStr(Ord(SkipDisclaimer.Checked));
                   end
                else
                if Copy(TextLine, 1, 14) = 'skip_gameinfo ' then
                   begin
                     if StrToInt(ExtractMAMEIniValue(TextLine)) = Ord(SkipGameInfo.Checked) then
                        GameIniFile.Strings[Line]:= ''
                     else
                        GameIniFile.Strings[Line]:= 'skip_gameinfo           '+IntToStr(Ord(SkipGameInfo.Checked));
                   end
                else
                if Copy(TextLine,1,11) = 'readconfig ' then
                   begin
                     if StrToInt(ExtractMAMEIniValue(TextLine)) = Ord(ReadConfigFile.Checked) then
                        GameIniFile.Strings[Line]:= ''
                     else
                        GameIniFile.Strings[Line]:= 'readconfig              '+IntToStr(Ord(ReadConfigFile.Checked));
                   end
                else
                if Copy(TextLine,1,8) = 'verbose ' then
                   begin
                     if StrToInt(ExtractMAMEIniValue(TextLine)) = Ord(Verbose.Checked) then
                        GameIniFile.Strings[Line]:= ''
                     else
                        GameIniFile.Strings[Line]:= 'verbose                 '+IntToStr(Ord(Verbose.Checked));
                   end;
              end;
         end;
         Inc(Line);
       end;
       CloseFile(WinMAMEIniFile);
       GameIniFile.SaveToFile(FormMain.IniFilesDir+'\'+GameName+'.ini');
       FreeAndNil(GameIniFile);
     end;
end;

procedure TFormMAMECustomConfiguration.ButtonCancelClick(
  Sender: TObject);
begin
  Close;
end;

procedure TFormMAMECustomConfiguration.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #27 then
     ButtonCancel.OnClick(Self);
end;

procedure TFormMAMECustomConfiguration.FormShow(Sender: TObject);
begin
  FormMain.UpdateGeneralAppearance(FormMAMECustomConfiguration);
  FormMain.SetMAMECustomConfigurationLanguage;
  case FormMain.MenuRealIcons.Checked of
    True : FormMain.BigRealIconsImageList.GetIcon(FormMain.GamesList[FormMain.SelectedGame].eImageIndex, GameIcon.Picture.Icon);
    False: FormMain.BuiltInBigListImageList.GetIcon(FormMain.GamesList[FormMain.SelectedGame].eImageIndex, GameIcon.Picture.Icon);
  end;
  LabelGameDescription.Caption:= FormMain.GamesList[FormMain.SelectedGame].eDescription;
  ButtonReadMAMEgamenameIni.OnClick(Self);
end;

procedure TFormMAMECustomConfiguration.ButtonReadMAMEgamenameIniClick(
  Sender: TObject);
begin
  ReadMAMEIniFile(EmulatorString);
  if FileExists(FormMain.IniFilesDir+'\'+GameName+'.ini') then
     ReadGameIniFile(EmulatorString); // read all mame.ini options
end;

procedure TFormMAMECustomConfiguration.ButtonOkClick(
  Sender: TObject);
begin
  if DirectoryExists(FormMain.IniFilesDir) then
     UpdateGameIniFile(EmulatorString); // update all options to gamecfg\game.cfg
  Close;
end;

procedure TFormMAMECustomConfiguration.FrameSkipChange(Sender: TObject);
begin
  LabelFrameSkipValue.Caption:= IntToStr(FrameSkip.Position);
end;

procedure TFormMAMECustomConfiguration.GammaChange(Sender: TObject);
begin
  LabelGammaValue.Caption:= TrimLeft(Format('%1.2f', [Gamma.Position]));
end;

procedure TFormMAMECustomConfiguration.FlickerChange(Sender: TObject);
begin
  LabelFlickerValue.Caption:= TrimLeft(Format('%3.2f',[Flicker.Position]));
end;

procedure TFormMAMECustomConfiguration.BeamChange(Sender: TObject);
begin
  LabelBeamValue.Caption:= TrimLeft(Format('%2.2f', [Beam.Position]));
end;

procedure TFormMAMECustomConfiguration.RefreshRateChange(
  Sender: TObject);
begin
  if RefreshRate.Position = 0 then
     LabelRefreshRateValue.Caption:= 'Auto'
  else
     LabelRefreshRateValue.Caption:= IntToStr(RefreshRate.Position);
end;

procedure TFormMAMECustomConfiguration.FramesToRunChange(
  Sender: TObject);
begin
  LabelFramesToRunValue.Caption:= IntToStr(FramesToRun.Position);
end;

procedure TFormMAMECustomConfiguration.FullScreenBrightnessChange(
  Sender: TObject);
begin
  LabelFullScreenBrightnessValue.Caption:= TrimLeft(Format('%1.2f', [FullScreenBrightness.Position]));
end;

procedure TFormMAMECustomConfiguration.SampleRateChange(
  Sender: TObject);
begin
  LabelSampleRateValue.Caption:= FormMain.GetSampleRate(SampleRate);
end;

procedure TFormMAMECustomConfiguration.CustomSampleRateChange(
  Sender: TObject);
begin
  if CustomSampleRate.Position = 4999 then
     LabelCustomSampleRateValue.Caption:= 'Disabled'
  else
     LabelCustomSampleRateValue.Caption:= IntToStr(CustomSampleRate.Position)+' Hz';
end;

procedure TFormMAMECustomConfiguration.VolumeChange(Sender: TObject);
begin
  LabelVolumeValue.Caption:= IntToSTr(Volume.Position)+' dB';
end;

procedure TFormMAMECustomConfiguration.EffectChange(Sender: TObject);
begin
  LabelEffectValue.Caption:= FormMain.GetBlitterEffect(Effect);
end;

procedure TFormMAMECustomConfiguration.ScreenAspectChange(
  Sender: TObject);
begin
  LabelScreenAspectValue.Caption:= FormMain.GetAspectRatio(ScreenAspect);
end;

procedure TFormMAMECustomConfiguration.AnalogDigitalDeadzoneChange(
  Sender: TObject);
begin
  LabelAnalogDigitalDeadzoneValue.Caption:= TrimLeft(Format('%1.2f', [AnalogDigitalDeadzone.Position]));
end;

procedure TFormMAMECustomConfiguration.BrightnessChange(
  Sender: TObject);
begin
  LabelBrightnessValue.Caption:= TrimLeft(Format('%1.2f', [Brightness.Position]));
end;

procedure TFormMAMECustomConfiguration.IntensityChange(Sender: TObject);
begin
  LabelIntensityValue.Caption:= TrimLeft(Format('%1.2f', [Intensity.Position]));
end;

procedure TFormMAMECustomConfiguration.ArtworkResolutionChange(
  Sender: TObject);
begin
  if ArtworkResolution.Position = 0 then
     LabelArtworkResolutionValue.Caption:= 'Auto'
  else
     LabelArtworkResolutionValue.Caption:= IntToStr(ArtworkResolution.Position);
end;

procedure TFormMAMECustomConfiguration.FormCreate(Sender: TObject);
begin
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

procedure TFormMAMECustomConfiguration.ResolutionChange(Sender: TObject);
begin
  LabelResolutionValue.Caption:= FormMain.GetResolution(Resolution);
end;

procedure TFormMAMECustomConfiguration.DebuggerResolutionChange(
  Sender: TObject);
begin
  LabelDebuggerResolutionValue.Caption:= FormMain.GetDOSResolution(DebuggerResolution);
end;

procedure TFormMAMECustomConfiguration.PauseBrightnessChange(
  Sender: TObject);
begin
  LabelPauseBrightnessValue.Caption:= TrimLeft(Format('%1.2f', [PauseBrightness.Position]));
end;

end.
