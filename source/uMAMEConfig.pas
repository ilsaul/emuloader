unit uMAMEConfig;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  GR32_RangeBars, StdCtrls, ExtCtrls, ComCtrls, ImgList, uGR32Extra, IniFiles,
  Menus, BarMenus;

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
    TabSheetMAMESound: TTabSheet;
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
    LabelIntensity: TLabel;
    Intensity: TGaugeBar2;
    LabelIntensityValue: TLabel;
    Sleep: TCheckBox;
    LabelBrightness: TLabel;
    Brightness: TGaugeBar2;
    LabelBrightnessValue: TLabel;
    FilenameCheatButtonSelect: TButton;
    FilenameMAMEInfoButtonSelect: TButton;
    FilenameHistoryButtonSelect: TButton;
    Resolution: TGaugeBar;
    LabelResolutionValue: TLabel;
    DebuggerResolution: TGaugeBar;
    LabelDebuggerResolutionValue: TLabel;
    PageControlFolders: TPageControl;
    TabSheetFolders1: TTabSheet;
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
    HighPriority: TCheckBox;
    AutoRotateLeft: TCheckBox;
    AutoRotateRight: TCheckBox;
    TabSheetMAMEDisplay3: TTabSheet;
    LabelDirect3D: TGroupBox;
    Direct3D: TCheckBox;
    D3DTextureManagement: TCheckBox;
    LabelMaxLogSize: TLabel;
    MaxLogSize: TGaugeBar;
    LabelMaxLogSizeValue: TLabel;
    CRCIntegrityChecks: TCheckBox;
    TabSheetMAMEControllers: TTabSheet;
    LabelD3DFilter: TLabel;
    D3DFilter: TGaugeBar;
    LabelD3DFilterValue: TLabel;
    LabelD3DFeedback: TLabel;
    D3DFeedback: TGaugeBar;
    LabelD3DFeedbackValue: TLabel;
    LabelD3DScanline: TLabel;
    D3DScanline: TGaugeBar;
    LabelD3DScanlineValue: TLabel;
    D3DEffectsRotation: TCheckBox;
    D3DEffect: TGaugeBar;
    LabelD3DEffect: TLabel;
    LabelD3DEffectValue: TLabel;
    TabSheetMAMEDisplay4: TTabSheet;
    LabelArtwork: TGroupBox;
    LabelArtworkResolution: TLabel;
    LabelArtworkResolutionValue: TLabel;
    Artwork: TCheckBox;
    Backdrop: TCheckBox;
    Bezel: TCheckBox;
    Overlay: TCheckBox;
    Crop: TCheckBox;
    ArtworkResolution: TGaugeBar;
    LabelZoomValue: TLabel;
    Zoom: TGaugeBar;
    LabelZoom: TLabel;
    LabelSystemBiosValue: TLabel;
    LabelSystemBios: TLabel;
    LabelD3DCustomEffects: TGroupBox;
    D3DCustomEffects: TEdit;
    D3DCustomEffectsEnable: TCheckBox;
    LabelD3DExpertEffects: TGroupBox;
    D3DExpertEffects: TEdit;
    D3DExpertEffectsEnable: TCheckBox;
    LabelCleanStretch: TLabel;
    CleanStretch: TGaugeBar;
    LabelCleanStretchValue: TLabel;
    LabelSampleRate: TLabel;
    LabelSampleRateValue: TLabel;
    LabelCustomSampleRate: TLabel;
    LabelCustomSampleRateValue: TLabel;
    LabelVolume: TLabel;
    LabelVolumeValue: TLabel;
    LabelAudioLatency: TLabel;
    LabelAudioLatencyValue: TLabel;
    SampleRate: TGaugeBar;
    CustomSampleRate: TGaugeBar;
    Volume: TGaugeBar;
    Sound: TCheckBox;
    Samples: TCheckBox;
    ResampleFilter: TCheckBox;
    AudioLatency: TGaugeBar;
    LabelControllerKeysMapping: TLabel;
    LabelAnalogDigitalDeadzone: TLabel;
    LabelAnalogDigitalDeadzoneValue: TLabel;
    Joystick: TCheckBox;
    SteadyKey: TCheckBox;
    Mouse: TCheckBox;
    ControllerKeysMapping: TComboBox;
    LightGun: TCheckBox;
    KeyboardLEDs: TCheckBox;
    AnalogDigitalDeadzone: TGaugeBar2;
    LabelD3DPrescale: TLabel;
    D3DPrescale: TGaugeBar;
    LabelD3DPrescaleValue: TLabel;
    SystemBios: TButton;
    PopupSystemBios: TBcBarPopupMenu;
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
    procedure MaxLogSizeChange(Sender: TObject);
    procedure AudioLatencyChange(Sender: TObject);
    procedure ZoomChange(Sender: TObject);
    procedure D3DFilterChange(Sender: TObject);
    procedure D3DFeedbackChange(Sender: TObject);
    procedure D3DScanlineChange(Sender: TObject);
    procedure D3DEffectChange(Sender: TObject);
    procedure CleanStretchChange(Sender: TObject);
    procedure D3DPrescaleChange(Sender: TObject);
  private
    { Private declarations }
    procedure UpdateGameIniFile;
    procedure SystemBiosOnClick(Sender: TObject);
  public
    EmulatorString: String;
    SaveCfg: Boolean;
    GameName: String;
    { Public declarations }
  end;

var
  FormMAMEConfiguration: TFormMAMEConfiguration;

implementation

uses uMain, uCommon;

{$R *.DFM}

procedure TFormMAMEConfiguration.SystemBiosOnClick(Sender: TObject);
begin
  LabelSystemBiosValue.Caption:= TMenuItem(Sender).Caption;
  LabelSystemBiosValue.Hint:= TMenuItem(Sender).Hint;
end;

// custom game options procedures
procedure TFormMAMEConfiguration.UpdateGameIniFile;
var
  MAMEIniFile: TextFile;
  TextLine, Value, OriginalFile: String;
  GameIniFile: THashedStringList;
  Line: Integer;
begin
  OriginalFile:= ExtractFilePath(EmulatorString)+FormMain.GetExecutableINIFileName(EmulatorString);
  CopyFile(PChar(OriginalFile), PChar(FormMain.IniFilesDir+'\'+GameName+'.ini'), False);

  if (FileExists(OriginalFile)) and (FileExists(FormMain.IniFilesDir+'\'+GameName+'.ini')) then
     begin
       AssignFile(MAMEIniFile, OriginalFile);
       GameIniFile:= THashedStringList.Create;
       GameIniFile.LoadFromFile(FormMain.IniFilesDir+'\'+GameName+'.ini');
       Reset(MAMEIniFile);
       Line:= 0;
       while not Eof(MAMEIniFile) do
       begin
         ReadLn(MAMEIniFile, TextLine);
         with FormMAMEConfiguration do
         begin
           if (Pos('#', TextLine) <> 0) or (TextLine <> '') then
              begin
                if Copy(TextLine, 1, 7) = 'clones ' then
                    begin
                      if StrToInt(ExtractMAMEIniValue(TextLine)) = Ord(Clones.Checked) then
                         GameIniFile.Strings[Line]:= ''
                      else
                         GameIniFile.Strings[Line]:= 'clones                  '+IntToStr(Ord(Clones.Checked));
                    end
                else
                if Copy(TextLine, 1, 8) = 'rompath ' then
                   begin
                     if ExtractMAMEIniValue(TextLine) = FolderROMs.Text then
                        GameIniFile.Strings[Line]:= ''
                     else
                        GameIniFile.Strings[Line]:= 'rompath                 '+FolderROMs.Text;
                   end
                else
                if Copy(TextLine, 1, 11) = 'samplepath ' then
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
                if Copy(TextLine, 1, 14) = 'cfg_directory ' then
                   begin
                     if ExtractMAMEIniValue(TextLine) = FolderGamesConfiguration.Text then
                        GameIniFile.Strings[Line]:= ''
                     else
                        GameIniFile.Strings[Line]:= 'cfg_directory           '+FolderGamesConfiguration.Text;
                   end
                else
                if Copy(TextLine, 1, 16) = 'nvram_directory ' then
                   begin
                     if ExtractMAMEIniValue(TextLine) = FolderNVRAM.Text then
                        GameIniFile.Strings[Line]:= ''
                     else
                        GameIniFile.Strings[Line]:= 'nvram_directory         '+FolderNVRAM.Text;
                   end
                else
                if Copy(TextLine, 1, 18) = 'memcard_directory ' then
                   begin
                     if ExtractMAMEIniValue(TextLine) = FolderMemoryCards.Text then
                        GameIniFile.Strings[Line]:= ''
                     else
                        GameIniFile.Strings[Line]:= 'memcard_directory       '+FolderMemoryCards.Text;
                   end
                else
                if Copy(TextLine, 1, 16) = 'input_directory ' then
                   begin
                     if ExtractMAMEIniValue(TextLine) = FolderInputsRecording.Text then
                        GameIniFile.Strings[Line]:= ''
                     else
                        GameIniFile.Strings[Line]:= 'input_directory         '+FolderInputsRecording.Text;
                   end
                else
                if Copy(TextLine, 1, 18) = 'hiscore_directory ' then
                   begin
                     if ExtractMAMEIniValue(TextLine) = FolderHighScores.Text then
                        GameIniFile.Strings[Line]:= ''
                     else
                        GameIniFile.Strings[Line]:= 'hiscore_directory       '+FolderHighScores.Text;
                   end
                else
                if Copy(TextLine, 1, 16) = 'state_directory ' then
                   begin
                     if ExtractMAMEIniValue(TextLine) = FolderSaveStates.Text then
                        GameIniFile.Strings[Line]:= ''
                     else
                        GameIniFile.Strings[Line]:= 'state_directory         '+FolderSaveStates.Text;
                   end
                else
                if Copy(TextLine, 1, 18) = 'artwork_directory ' then
                   begin
                     if ExtractMAMEIniValue(TextLine) = FolderArtworks.Text then
                        GameIniFile.Strings[Line]:= ''
                     else
                        GameIniFile.Strings[Line]:= 'artwork_directory       '+FolderArtworks.Text;
                   end
                else
                if Copy(TextLine, 1, 19) = 'snapshot_directory ' then
                   begin
                     if ExtractMAMEIniValue(TextLine) = FolderSnapshots.Text then
                        GameIniFile.Strings[Line]:= ''
                     else
                        GameIniFile.Strings[Line]:= 'snapshot_directory      '+FolderSnapshots.Text;
                   end
                else
                if Copy(TextLine, 1, 15) = 'diff_directory ' then
                   begin
                     if ExtractMAMEIniValue(TextLine) = FolderDiff.Text then
                        GameIniFile.Strings[Line]:= ''
                     else
                        GameIniFile.Strings[Line]:= 'diff_directory          '+FolderDiff.Text;
                   end
                else
                if Copy(TextLine, 1, 16) = 'ctrlr_directory ' then
                   begin
                     if ExtractMAMEIniValue(TextLine) = FolderKeysMapping.Text then
                        GameIniFile.Strings[Line]:= ''
                     else
                        GameIniFile.Strings[Line]:= 'ctrlr_directory         '+FolderKeysMapping.Text;
                   end
                else
                if Copy(TextLine, 1, 11) = 'cheat_file ' then
                   GameIniFile.Strings[Line]:= ''
                 else
                if Copy(TextLine, 1, 13) = 'history_file ' then
                   GameIniFile.Strings[Line]:= ''
                 else
                if Copy(TextLine, 1, 14) = 'mameinfo_file ' then
                   GameIniFile.Strings[Line]:= ''
                else
                if Copy(TextLine, 1, 14) = 'autoframeskip ' then
                   begin
                     if StrToInt(ExtractMAMEIniValue(TextLine)) = Ord(AutoFrameSkip.Checked) then
                        GameIniFile.Strings[Line]:= ''
                     else
                        GameIniFile.Strings[Line]:= 'autoframeskip           '+IntToStr(Ord(AutoFrameSkip.Checked));
                   end
                else
                if Copy(TextLine, 1, 10) = 'frameskip ' then
                   begin
                     if StrToInt(ExtractMAMEIniValue(TextLine)) = FrameSkip.Position then
                        GameIniFile.Strings[Line]:= ''
                     else
                        GameIniFile.Strings[Line]:= 'frameskip               '+IntToStr(FrameSkip.Position);
                   end
                else
                if Copy(TextLine, 1, 10) = 'waitvsync ' then
                   begin
                     if StrToInt(ExtractMAMEIniValue(TextLine)) = Ord(WaitVSync.Checked) then
                        GameIniFile.Strings[Line]:= ''
                     else
                        GameIniFile.Strings[Line]:= 'waitvsync               '+IntToStr(Ord(WaitVSync.Checked));
                   end
                else
                if Copy(TextLine, 1, 13) = 'triplebuffer ' then
                   begin
                     if StrToInt(ExtractMAMEIniValue(TextLine)) = Ord(TripleBuffer.Checked) then
                        GameIniFile.Strings[Line]:= ''
                     else
                        GameIniFile.Strings[Line]:= 'triplebuffer            '+IntToStr(Ord(TripleBuffer.Checked));
                   end
                else
                if Copy(TextLine, 1, 7) = 'window ' then
                   begin
                     if StrToInt(ExtractMAMEIniValue(TextLine)) = Ord(Window.Checked) then
                        GameIniFile.Strings[Line]:= ''
                     else
                        GameIniFile.Strings[Line]:= 'window                  '+IntToStr(Ord(Window.Checked));
                   end
                else
                if Copy(TextLine, 1, 6) = 'ddraw ' then
                   begin
                     if StrToInt(ExtractMAMEIniValue(TextLine)) = Ord(DirectDraw.Checked) then
                        GameIniFile.Strings[Line]:= ''
                     else
                        GameIniFile.Strings[Line]:= 'ddraw                   '+IntToStr(Ord(DirectDraw.Checked));
                   end
                else
                if Copy(TextLine, 1, 9) = 'direct3d ' then
                   begin
                     if StrToInt(ExtractMAMEIniValue(TextLine)) = Ord(Direct3D.Checked) then
                        GameIniFile.Strings[Line]:= ''
                     else
                        GameIniFile.Strings[Line]:= 'direct3d                '+IntToStr(Ord(Direct3D.Checked))
                   end
                else
                if Copy(TextLine, 1, 10) = 'hwstretch ' then
                   begin
                     if StrToInt(ExtractMAMEIniValue(TextLine)) = Ord(HardwareStretch.Checked) then
                        GameIniFile.Strings[Line]:= ''
                     else
                        GameIniFile.Strings[Line]:= 'hwstretch               '+IntToStr(Ord(HardwareStretch.Checked));
                   end
                else
                if Copy(TextLine, 1, 13) = 'cleanstretch ' then
                   begin
                     if ExtractMAMEIniValue(TextLine) = LowerCase(LabelCleanStretchValue.Caption) then
                        GameIniFile.Strings[Line]:= ''
                     else
                        GameIniFile.Strings[Line]:= 'cleanstretch            '+LowerCase(LabelCleanStretchValue.Caption);
                   end
                else
                if Copy(TextLine, 1, 11) = 'resolution ' then
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
                if Copy(TextLine, 1, 5) = 'zoom ' then
                   begin
                     if StrToInt(ExtractMAMEIniValue(TextLine)) = Zoom.Position then
                        GameIniFile.Strings[Line]:= ''
                     else
                        GameIniFile.Strings[Line]:= 'zoom                    '+IntToStr(Zoom.Position);
                   end
                else
                if Copy(TextLine, 1, 8) = 'refresh ' then
                   begin
                     if StrToInt(ExtractMAMEIniValue(TextLine)) = RefreshRate.Position then
                        GameIniFile.Strings[Line]:= ''
                     else
                        GameIniFile.Strings[Line]:= 'refresh                 '+IntToStr(RefreshRate.Position);
                   end
                else
                if Copy(TextLine, 1, 10) = 'scanlines ' then
                   begin
                     if StrToInt(ExtractMAMEIniValue(TextLine)) = Ord(Scanlines.Checked) then
                        GameIniFile.Strings[Line]:= ''
                     else
                        GameIniFile.Strings[Line]:= 'scanlines               '+IntToStr(Ord(Scanlines.Checked));
                   end
                else
                if Copy(TextLine, 1, 10) = 'switchres ' then
                   begin
                     if StrToInt(ExtractMAMEIniValue(TextLine)) = Ord(SwitchResolution.Checked) then
                        GameIniFile.Strings[Line]:= ''
                     else
                        GameIniFile.Strings[Line]:= 'switchres               '+IntToStr(Ord(SwitchResolution.Checked));
                   end
                else
                if Copy(TextLine, 1, 10) = 'switchbpp ' then
                   begin
                     if StrToInt(ExtractMAMEIniValue(TextLine)) = Ord(SwitchColorDepth.Checked) then
                        GameIniFile.Strings[Line]:= ''
                     else
                        GameIniFile.Strings[Line]:= 'switchbpp               '+IntToStr(Ord(SwitchColorDepth.Checked));
                   end
                else
                if Copy(TextLine, 1, 9) = 'maximize ' then
                   begin
                     if StrToInt(ExtractMAMEIniValue(TextLine)) = Ord(Maximize.Checked) then
                        GameIniFile.Strings[Line]:= ''
                     else
                        GameIniFile.Strings[Line]:= 'maximize                '+IntToStr(Ord(Maximize.Checked));
                   end
                else
                if Copy(TextLine, 1, 11) = 'keepaspect ' then
                   begin
                     if StrToInt(ExtractMAMEIniValue(TextLine)) = Ord(KeepAspectRatio.Checked) then
                        GameIniFile.Strings[Line]:= ''
                     else
                        GameIniFile.Strings[Line]:= 'keepaspect              '+IntToStr(Ord(KeepAspectRatio.Checked));
                   end
                else
                if Copy(TextLine, 1, 13) = 'matchrefresh ' then
                   begin
                     if StrToInt(ExtractMAMEIniValue(TextLine)) = Ord(MatchRefreshRate.Checked) then
                        GameIniFile.Strings[Line]:= ''
                     else
                        GameIniFile.Strings[Line]:= 'matchrefresh            '+IntToStr(Ord(MatchRefreshRate.Checked));
                   end
                else
                if Copy(TextLine, 1, 12) = 'syncrefresh ' then
                   begin
                     if StrToInt(ExtractMAMEIniValue(TextLine)) = Ord(SyncronizeRefreshRate.Checked) then
                        GameIniFile.Strings[Line]:= ''
                     else
                        GameIniFile.Strings[Line]:= 'syncrefresh             '+IntToStr(Ord(SyncronizeRefreshRate.Checked));
                   end
                else
                if Copy(TextLine, 1, 9) = 'throttle ' then
                   begin
                     if StrToInt(ExtractMAMEIniValue(TextLine)) = Ord(Throttle.Checked) then
                         GameIniFile.Strings[Line]:= ''
                     else
                         GameIniFile.Strings[Line]:= 'throttle                '+IntToStr(Ord(Throttle.Checked));
                   end
                else
                if Copy(TextLine, 1, 23) = 'full_screen_brightness ' then
                   begin
                     if StrToFloat(ExtractMAMEIniValue(TextLine)) = FullScreenBrightness.Position then
                        GameIniFile.Strings[Line]:= ''
                     else
                        GameIniFile.Strings[Line]:= 'full_screen_brightness   '+FloatToStr(FullScreenBrightness.Position);
                   end
                else
                if Copy(TextLine, 1, 14) = 'frames_to_run ' then
                   begin
                     if StrToInt(ExtractMAMEIniValue(TextLine)) = FramesToRun.Position then
                        GameIniFile.Strings[Line]:= ''
                     else
                        GameIniFile.Strings[Line]:= 'frames_to_run           '+IntToStr(FramesToRun.Position);
                   end
                else
                if Copy(TextLine, 1, 7) = 'effect ' then
                   begin
                     Value:= FormMain.SetEffectName(Effect.Position);
                     if ExtractMAMEIniValue(TextLine) = Value then
                        GameIniFile.Strings[Line]:= ''
                     else
                        GameIniFile.Strings[Line]:= 'effect                  '+Value;
                   end
                else
                if Copy(TextLine, 1, 14) = 'screen_aspect ' then
                   begin
                     if ExtractMAMEIniValue(TextLine) = LabelScreenAspectValue.Caption then
                        GameIniFile.Strings[Line]:= ''
                     else
                        GameIniFile.Strings[Line]:= 'screen_aspect           '+LabelScreenAspectValue.Caption;
                   end
                else
                if Copy(TextLine, 1, 6) = 'sleep ' then
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
                if Copy(TextLine, 1, 14) = 'high_priority ' then
                   begin
                     if StrToInt(ExtractMAMEIniValue(TextLine)) = Ord(HighPriority.Checked) then
                        GameIniFile.Strings[Line]:= ''
                     else
                        GameIniFile.Strings[Line]:= 'high_priority           '+IntToStr(Ord(HighPriority.Checked));
                   end
                else
                // D3D Options
                if Copy(TextLine, 1, 13) = 'd3dtexmanage ' then
                   begin
                     if StrToInt(ExtractMAMEIniValue(TextLine)) = Ord(D3DTextureManagement.Checked) then
                        GameIniFile.Strings[Line]:= ''
                     else
                        GameIniFile.Strings[Line]:= 'd3dtexmanage            '+IntToStr(Ord(D3DTextureManagement.Checked));
                   end
                else
                if Copy(TextLine, 1, 10) = 'd3dfilter ' then
                   begin
                     if StrToInt(ExtractMAMEIniValue(TextLine)) = D3DFilter.Position then
                        GameIniFile.Strings[Line]:= ''
                     else
                        GameIniFile.Strings[Line]:= 'd3dfilter               '+IntToStr(D3DFilter.Position);
                   end
                else
                if Copy(TextLine, 1, 12) = 'd3dprescale ' then
                   begin
                     if ExtractMAMEIniValue(TextLine) = LowerCase(LabelD3DPrescaleValue.Caption) then
                        GameIniFile.Strings[Line]:= ''
                     else
                        GameIniFile.Strings[Line]:= 'd3dprescale             '+LowerCase(LabelD3DPrescaleValue.Caption);
                   end
                else
                if Copy(TextLine, 1, 12) = 'd3dfeedback ' then
                   begin
                     if StrToInt(ExtractMAMEIniValue(TextLine)) = D3DFeedback.Position then
                        GameIniFile.Strings[Line]:= ''
                     else
                        GameIniFile.Strings[Line]:= 'd3dfeedback             '+IntToStr(D3DFeedback.Position);
                   end
                else
                if Copy(TextLine, 1, 8) = 'd3dscan ' then
                   begin
                     if StrToInt(ExtractMAMEIniValue(TextLine)) = D3DScanline.Position then
                        GameIniFile.Strings[Line]:= ''
                     else
                        GameIniFile.Strings[Line]:= 'd3dscan                 '+IntToStr(D3DScanline.Position);
                   end
                else
                if Copy(TextLine, 1, 16) = 'd3deffectrotate ' then
                   begin
                     if StrToInt(ExtractMAMEIniValue(TextLine)) = Ord(D3DEffectsRotation.Checked) then
                        GameIniFile.Strings[Line]:= ''
                     else
                        GameIniFile.Strings[Line]:= 'd3deffectrotate         '+IntToStr(Ord(D3DEffectsRotation.Checked));
                   end
                else
                if Copy(TextLine, 1, 10) = 'd3deffect ' then
                   begin
                     Value:= FormMain.SetEffectName(D3DEffect.Position);
                     if ExtractMAMEIniValue(TextLine) = Value then
                        GameIniFile.Strings[Line]:= ''
                     else
                        GameIniFile.Strings[Line]:= 'd3deffect               '+Value;
                   end
                else
                if (Copy(TextLine, 1, 12) = '# d3dcustom ') or (Copy(TextLine, 1, 10) = 'd3dcustom ') then
                   begin
                     case D3DCustomEffectsEnable.Checked of
                       True:
                         begin
                           if (D3DCustomEffects.Text = '') or (D3DCustomEffects.Text = '<NULL> (not set)') or
                              (ExtractMAMEIniValue(TextLine) = D3DCustomEffects.Text) then
                              GameIniFile.Strings[Line]:= ''
                           else
                              GameIniFile.Strings[Line]:= 'd3dcustom               '+D3DCustomEffects.Text;
                         end;
                       False: GameIniFile.Strings[Line]:= '';
                     end
                   end
                else
                if (Copy(TextLine, 1, 12) = '# d3dexpert ') or (Copy(TextLine, 1, 10) = 'd3dexpert ') then
                   begin
                     case D3DExpertEffectsEnable.Checked of
                       True:
                         begin
                           if (D3DExpertEffects.Text = '') or (D3DExpertEffects.Text = '<NULL> (not set)') or
                              (ExtractMAMEIniValue(TextLine) = D3DExpertEffects.Text) then
                              GameIniFile.Strings[Line]:= ''
                           else
                              GameIniFile.Strings[Line]:= 'd3dexpert               '+D3DExpertEffects.Text;
                         end;
                       False: GameIniFile.Strings[Line]:= '';
                     end
                   end
                else
                if Copy(TextLine, 1, 14) = 'audio_latency ' then
                   begin
                     if StrToInt(ExtractMAMEIniValue(TextLine)) = AudioLatency.Position then
                        GameIniFile.Strings[Line]:= ''
                     else
                        GameIniFile.Strings[Line]:= 'audio_latency           '+IntToStr(AudioLatency.Position)
                   end
                else
                if Copy(TextLine, 1, 6) = 'mouse ' then
                   begin
                     if StrToInt(ExtractMAMEIniValue(TextLine)) = Ord(Mouse.Checked) then
                        GameIniFile.Strings[Line]:= ''
                     else
                        GameIniFile.Strings[Line]:= 'mouse                   '+IntToStr(Ord(Mouse.Checked));
                   end
                else
                if Copy(TextLine, 1, 9) = 'joystick ' then
                   begin
                     if StrToInt(ExtractMAMEIniValue(TextLine)) = Ord(Joystick.Checked) then
                        GameIniFile.Strings[Line]:= ''
                     else
                        GameIniFile.Strings[Line]:= 'joystick                '+IntToStr(Ord(Joystick.Checked));
                   end
                else
                if Copy(TextLine, 1, 9) = 'lightgun ' then
                   begin
                     if StrToInt(ExtractMAMEIniValue(TextLine)) = Ord(Lightgun.Checked) then
                        GameIniFile.Strings[Line]:= ''
                     else
                        GameIniFile.Strings[Line]:= 'lightgun                '+IntToStr(Ord(Lightgun.Checked));
                   end
                else
                if Copy(TextLine, 1, 10) = 'steadykey ' then
                   begin
                     if StrToInt(ExtractMAMEIniValue(TextLine)) = Ord(SteadyKey.Checked) then
                        GameIniFile.Strings[Line]:= ''
                     else
                        GameIniFile.Strings[Line]:= 'steadykey               '+IntToStr(Ord(SteadyKey.Checked));
                   end
                else
                if Copy(TextLine, 1, 14) = 'keyboard_leds ' then
                   begin
                     if StrToInt(ExtractMAMEIniValue(TextLine)) = Ord(KeyboardLEDs.Checked) then
                        GameIniFile.Strings[Line]:= ''
                     else
                        GameIniFile.Strings[Line]:= 'keyboard_leds           '+IntToStr(Ord(KeyboardLEDs.Checked));
                   end
                else
                if Copy(TextLine, 1, 13) = 'a2d_deadzone ' then
                   begin
                     if ExtractMAMEIniValue(TextLine) = LabelAnalogDigitalDeadzoneValue.Caption then
                        GameIniFile.Strings[Line]:= ''
                     else
                        GameIniFile.Strings[Line]:= 'a2d_deadzone            '+LabelAnalogDigitalDeadzoneValue.Caption;
                   end
                else
                if (Copy(TextLine, 1, 8) = '# ctrlr ') or (Copy(TextLine,1,6) = 'ctrlr ') then
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
                if Copy(TextLine, 1, 9) = 'norotate ' then
                   begin
                     if StrToInt(ExtractMAMEIniValue(TextLine)) = Ord(NoRotate.Checked) then
                        GameIniFile.Strings[Line]:= ''
                     else
                        GameIniFile.Strings[Line]:= 'norotate                '+IntToStr(Ord(NoRotate.Checked));
                   end
                else
                if Copy(TextLine, 1, 4) = 'ror ' then
                   begin
                     if StrToInt(ExtractMAMEIniValue(TextLine)) = Ord(RotateRight.Checked) then
                        GameIniFile.Strings[Line]:= ''
                     else
                        GameIniFile.Strings[Line]:= 'ror                     '+IntToStr(Ord(RotateRight.Checked));
                   end
                else
                if Copy(TextLine, 1, 4) = 'rol ' then
                   begin
                     if StrToInt(ExtractMAMEIniValue(TextLine)) = Ord(RotateLeft.Checked) then
                        GameIniFile.Strings[Line]:= ''
                     else
                        GameIniFile.Strings[Line]:= 'rol                     '+IntToStr(Ord(RotateLeft.Checked));
                   end
                else
                if Copy(TextLine, 1, 8) = 'autoror ' then
                   begin
                     if StrToInt(ExtractMAMEIniValue(TextLine)) = Ord(AutoRotateRight.Checked) then
                        GameIniFile.Strings[Line]:= ''
                     else
                        GameIniFile.Strings[Line]:= 'autoror                 '+IntToStr(Ord(AutoRotateRight.Checked));
                   end
                else
                if Copy(TextLine, 1, 8) = 'autorol ' then
                   begin
                     if StrToInt(ExtractMAMEIniValue(TextLine)) = Ord(AutoRotateLeft.Checked) then
                        GameIniFile.Strings[Line]:= ''
                     else
                        GameIniFile.Strings[Line]:= 'autorol                 '+IntToStr(Ord(AutoRotateLeft.Checked));
                   end
                else
                if Copy(TextLine, 1, 6) = 'flipx ' then
                   begin
                     if StrToInt(ExtractMAMEIniValue(TextLine)) = Ord(FlipX.Checked) then
                        GameIniFile.Strings[Line]:= ''
                     else
                        GameIniFile.Strings[Line]:= 'flipx                   '+IntToStr(Ord(FlipX.Checked));
                   end
                else
                if Copy(TextLine, 1, 6) = 'flipy ' then
                   begin
                     if StrToInt(ExtractMAMEIniValue(TextLine)) = Ord(FlipY.Checked) then
                        GameIniFile.Strings[Line]:= ''
                     else
                        GameIniFile.Strings[Line]:= 'flipy                   '+IntToStr(Ord(FlipY.Checked));
                   end
                else
                if Copy(TextLine, 1, 17) = 'debug_resolution ' then
                   begin
                     if LowerCase(ExtractMAMEIniValue(TextLine)) = LowerCase(LabelDebuggerResolutionValue.Caption) then
                        GameIniFile.Strings[Line]:= ''
                     else
                        GameIniFile.Strings[Line]:= 'debug_resolution        '+LowerCase(LabelDebuggerResolutionValue.Caption);
                   end
                else
                if Copy(TextLine, 1, 6) = 'gamma ' then
                   begin
                     if StrToFloat(Format('%1.2f', [StrToFloat(ExtractMAMEIniValue(TextLine))])) = Gamma.Position then
                        GameIniFile.Strings[Line]:= ''
                     else
                        GameIniFile.Strings[Line]:= 'gamma                   '+FloatToStr(Gamma.Position);
                   end
                else
                if Copy(TextLine, 1, 11) = 'brightness ' then
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
                if Copy(TextLine, 1, 10) = 'antialias ' then
                   begin
                     if StrToInt(ExtractMAMEIniValue(TextLine)) = Ord(Antialias.Checked) then
                        GameIniFile.Strings[Line]:= ''
                     else
                        GameIniFile.Strings[Line]:= 'antialias               '+IntToStr(Ord(Antialias.Checked));
                   end
                else
                if Copy(TextLine, 1, 13) = 'translucency ' then
                   begin
                     if StrToInt(ExtractMAMEIniValue(TextLine)) = Ord(Translucency.Checked) then
                        GameIniFile.Strings[Line]:= ''
                     else
                        GameIniFile.Strings[Line]:= 'translucency            '+IntToStr(Ord(Translucency.Checked));
                   end
                else
                if Copy(TextLine, 1, 5) = 'beam ' then
                   begin
                     if StrToFloat(Format('%2.2f', [StrToFloat(ExtractMAMEIniValue(TextLine))])) = Beam.Position then
                        GameIniFile.Strings[Line]:= ''
                     else
                        GameIniFile.Strings[Line]:= 'beam                    '+FloatToStr(Beam.Position);
                   end
                else
                if Copy(TextLine, 1, 8) = 'flicker ' then
                   begin
                     if StrToFloat(Format('%3.2f', [StrToFloat(ExtractMAMEIniValue(TextLine))])) = Flicker.Position then
                        GameIniFile.Strings[Line]:= ''
                     else
                        GameIniFile.Strings[Line]:= 'flicker                 '+FloatToStr(Flicker.Position);
                   end
                else
                if Copy(TextLine, 1, 10) = 'intensity ' then
                   begin
                     if Format('%1.2f', [StrToFloat(ExtractMAMEIniValue(TextLine))]) = LabelIntensityValue.Caption then
                        GameIniFile.Strings[Line]:= ''
                     else
                        GameIniFile.Strings[Line]:= 'intensity               '+LabelIntensityValue.Caption;
                   end
                else
                if Copy(TextLine, 1, 11) = 'samplerate ' then
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
                if Copy(TextLine, 1, 8) = 'samples ' then
                   begin
                     if StrToInt(ExtractMAMEIniValue(TextLine)) = Ord(Samples.Checked) then
                        GameIniFile.Strings[Line]:= ''
                     else
                        GameIniFile.Strings[Line]:= 'samples                 '+IntToStr(Ord(Samples.Checked));
                   end
                else
                if Copy(TextLine, 1, 15) = 'resamplefilter ' then
                   begin
                     if StrToInt(ExtractMAMEIniValue(TextLine)) = Ord(ResampleFilter.Checked) then
                        GameIniFile.Strings[Line]:= ''
                     else
                        GameIniFile.Strings[Line]:= 'resamplefilter          '+IntToStr(Ord(ResampleFilter.Checked));
                   end
                else
                if Copy(TextLine, 1, 6) = 'sound ' then
                   begin
                     if StrToInt(ExtractMAMEIniValue(TextLine)) = Ord(Sound.Checked) then
                        GameIniFile.Strings[Line]:= ''
                     else
                        GameIniFile.Strings[Line]:= 'sound                   '+IntToStr(Ord(Sound.Checked));
                   end
                else
                if Copy(TextLine, 1, 7) = 'volume ' then
                   begin
                     if StrToInt(ExtractMAMEIniValue(TextLine)) = Volume.Position then
                        GameIniFile.Strings[Line]:= ''
                     else
                        GameIniFile.Strings[Line]:= 'volume                  '+IntToStr(Volume.Position);
                   end
                else
                if Copy(TextLine, 1, 8) = 'artwork ' then
                   begin
                     if StrToInt(ExtractMAMEIniValue(TextLine)) = Ord(Artwork.Checked) then
                        GameIniFile.Strings[Line]:= ''
                     else
                        GameIniFile.Strings[Line]:= 'artwork                 '+IntToStr(Ord(Artwork.Checked));
                   end
                else
                if Copy(TextLine, 1, 14) = 'use_backdrops ' then
                   begin
                     if StrToInt(ExtractMAMEIniValue(TextLine)) = Ord(Backdrop.Checked) then
                        GameIniFile.Strings[Line]:= ''
                     else
                        GameIniFile.Strings[Line]:= 'use_backdrops           '+IntToStr(Ord(Backdrop.Checked));
                   end
                else
                if Copy(TextLine, 1, 13) = 'use_overlays ' then
                   begin
                     if StrToInt(ExtractMAMEIniValue(TextLine)) = Ord(Overlay.Checked) then
                        GameIniFile.Strings[Line]:= ''
                     else
                        GameIniFile.Strings[Line]:= 'use_overlays            '+IntToStr(Ord(Overlay.Checked));
                   end
                else
                if Copy(TextLine, 1, 11) = 'use_bezels ' then
                   begin
                     if StrToInt(ExtractMAMEIniValue(TextLine)) = Ord(Bezel.Checked) then
                        GameIniFile.Strings[Line]:= ''
                     else
                        GameIniFile.Strings[Line]:= 'use_bezels              '+IntToStr(Ord(Bezel.Checked));
                   end
                else
                if Copy(TextLine, 1, 13) = 'artwork_crop ' then
                   begin
                     if StrToInt(ExtractMAMEIniValue(TextLine)) = Ord(Crop.Checked) then
                        GameIniFile.Strings[Line]:= ''
                     else
                        GameIniFile.Strings[Line]:= 'artwork_crop            '+IntToStr(Ord(Crop.Checked));
                   end
                else
                if Copy(TextLine, 1, 19) = 'artwork_resolution ' then
                   begin
                     if StrToInt(ExtractMAMEIniValue(TextLine)) = ArtworkResolution.Position then
                        GameIniFile.Strings[Line]:= ''
                     else
                        GameIniFile.Strings[Line]:= 'artwork_resolution      '+IntToStr(ArtworkResolution.Position);
                   end
                else
                if Copy(TextLine, 1, 6) = 'cheat ' then
                   begin
                     if StrToInt(ExtractMAMEIniValue(TextLine)) = Ord(Cheat.Checked) then
                        GameIniFile.Strings[Line]:= ''
                     else
                        GameIniFile.Strings[Line]:= 'cheat                   '+IntToStr(Ord(Cheat.Checked));
                   end
                else
                if Copy(TextLine, 1, 6) = 'debug ' then
                   begin
                     if StrToInt(ExtractMAMEIniValue(TextLine)) = Ord(Debug.Checked) then
                        GameIniFile.Strings[Line]:= ''
                     else
                        GameIniFile.Strings[Line]:= 'debug                   '+IntToStr(Ord(Debug.Checked));
                   end
                else
                if Copy(TextLine, 1, 4) = 'log ' then
                   begin
                     if StrToInt(ExtractMAMEIniValue(TextLine)) = Ord(Log.Checked) then
                        GameIniFile.Strings[Line]:= ''
                     else
                        GameIniFile.Strings[Line]:= 'log                     '+IntToStr(Ord(Log.Checked));
                   end
                else
                if Copy(TextLine, 1, 11) = 'maxlogsize ' then
                   begin
                     if StrToInt(ExtractMAMEIniValue(TextLine)) = MaxLogSize.Position then
                        GameIniFile.Strings[Line]:= ''
                     else
                        GameIniFile.Strings[Line]:= 'maxlogsize              '+IntToStr(MaxLogSize.Position);
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
                if Copy(TextLine, 1, 8) = 'crconly ' then
                   begin
                     if StrToInt(ExtractMAMEIniValue(TextLine)) = Ord(CRCIntegrityChecks.Checked) then
                        GameIniFile.Strings[Line]:= ''
                     else
                        GameIniFile.Strings[Line]:= 'crconly                 '+IntToStr(Ord(CRCIntegrityChecks.Checked));
                   end
                else
                if Copy(TextLine, 1, 5) = 'bios ' then
                   begin
                     if ExtractMAMEIniValue(TextLine) = LabelSystemBiosValue.Hint then
                        GameIniFile.Strings[Line]:= ''
                     else
                        GameIniFile.Strings[Line]:= 'bios                    '+LabelSystemBiosValue.Hint;
                   end
                else
                if Copy(TextLine, 1, 11) = 'readconfig ' then
                   begin
                     if StrToInt(ExtractMAMEIniValue(TextLine)) = Ord(ReadConfigFile.Checked) then
                        GameIniFile.Strings[Line]:= ''
                     else
                        GameIniFile.Strings[Line]:= 'readconfig              '+IntToStr(Ord(ReadConfigFile.Checked));
                   end
                else
                if Copy(TextLine, 1, 8) = 'verbose ' then
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
       CloseFile(MAMEIniFile);
       GameIniFile.SaveToFile(FormMain.IniFilesDir+'\'+GameName+'.ini');
       FreeAndNil(GameIniFile);
     end;
end;
// end of custom game options procedures

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
end;

procedure TFormMAMEConfiguration.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #27 then
     ButtonCancel.OnClick(Self);
end;

procedure TFormMAMEConfiguration.FormShow(Sender: TObject);
var
  Loop: Integer;
begin
  FormMain.UpdateGeneralAppearance(FormMAMEConfiguration);
  FormMain.SetMAMEConfigurationLanguage;
  if Tag = 1 then
     begin
       case FormMain.MenuGamesIcons.Checked of
         True : FormMain.SmallGamesIconsImageList.GetIcon(FormMain.GamesList[FormMain.SelectedGame].eImageIndex, Icon);
         False: FormMain.BuiltInSmallListImageList.GetIcon(FormMain.GamesList[FormMain.SelectedGame].eImageIndex, Icon);
       end;
       Caption:= Caption+ ' - ['+FormMain.GamesList[FormMain.SelectedGame].eDescription+']';
     end;

  FormMain.LoadBiosSet(False, PopupSystemBios);
  if PopupSystemBios.Items.Count > 0 then
     begin
       for Loop:=0 to PopupSystemBios.Items.Count-1 do
       begin
         if PopupSystemBios.Items[Loop].Caption <> '-' then
            PopupSystemBios.Items[Loop].OnClick:= SystemBiosOnClick;
       end;
     end;     
  ReadMAMEini.OnClick(Self);
end;

procedure TFormMAMEConfiguration.ReadMAMEiniClick(Sender: TObject);
begin
  if not FileExists(ExtractFilePath(EmulatorString)+FormMain.GetExecutableINIFileName(EmulatorString)) then
     FormMain.CheckMAMEIniFile(EmulatorString);
  FormMain.ReadMAMEIniFile(EmulatorString, False); // read all mame.ini options
  if Tag = 1 then
     begin
       if FileExists(FormMain.IniFilesDir+'\'+GameName+'.ini') then
          FormMain.ReadMAMEIniFile(EmulatorString, True); // read all gamename.ini options
     end;
end;

procedure TFormMAMEConfiguration.ButtonCancelClick(Sender: TObject);
begin
  SetCurrentDir(FormMain.FrontendPath);
  Close;
end;

procedure TFormMAMEConfiguration.ButtonOkClick(Sender: TObject);
begin
  SetCurrentDir(FormMain.FrontendPath);
  case Tag of
    0: // default options
     begin
       if not FileExists(ExtractFilePath(EmulatorString)+FormMain.GetExecutableINIFileName(EmulatorString)) then
          FormMain.CheckMAMEIniFile(EmulatorString);
       FormMain.UpdateMAMEIniFile(EmulatorString);// update all mame.ini options
     end;
    1: // custom options
     begin
       if DirectoryExists(FormMain.IniFilesDir) then
          UpdateGameIniFile; // update all options to ini\gamename.ini
     end;
  end;
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

procedure TFormMAMEConfiguration.MaxLogSizeChange(Sender: TObject);
begin
  LabelMaxLogSizeValue.Caption:= IntToStr(MaxLogSize.Position);
end;

procedure TFormMAMEConfiguration.AudioLatencyChange(Sender: TObject);
begin
  LabelAudioLatencyValue.Caption:= IntToStr(AudioLatency.Position);
end;

procedure TFormMAMEConfiguration.ZoomChange(Sender: TObject);
begin
  LabelZoomValue.Caption:= IntToStr(Zoom.Position)+'x';
end;

procedure TFormMAMEConfiguration.D3DFilterChange(Sender: TObject);
begin
  case D3DFilter.Position of
    0: LabelD3DFilterValue.Caption:= 'None';
    1: LabelD3DFilterValue.Caption:= 'Bi-Linear';
    2: LabelD3DFilterValue.Caption:= 'Flat Bi-Cubic';
    3: LabelD3DFilterValue.Caption:= 'Gaussian Bi-Cubic';
    4: LabelD3DFilterValue.Caption:= 'Anisotropic';
  end;
end;

procedure TFormMAMEConfiguration.D3DFeedbackChange(Sender: TObject);
begin
  if D3DFeedback.Position = 0 then
     LabelD3DFeedbackValue.Caption:= 'Disabled'
  else
     LabelD3DFeedbackValue.Caption:= IntToStr(D3DFeedback.Position);
end;

procedure TFormMAMEConfiguration.D3DScanlineChange(Sender: TObject);
begin
  if D3DScanline.Position = 100 then
     LabelD3DScanlineValue.Caption:= 'Disabled'
  else
     LabelD3DScanlineValue.Caption:= IntToStr(D3DScanline.Position);
end;

procedure TFormMAMEConfiguration.D3DEffectChange(Sender: TObject);
begin
  LabelD3DEffectValue.Caption:= FormMain.GetBlitterEffect(D3DEffect);
end;

procedure TFormMAMEConfiguration.CleanStretchChange(Sender: TObject);
begin
  case CleanStretch.Position of
    0: LabelCleanStretchValue.Caption:= 'None';
    1: LabelCleanStretchValue.Caption:= 'Full';
    2: LabelCleanStretchValue.Caption:= 'Auto';
    3: LabelCleanStretchValue.Caption:= 'Horizontal';
    4: LabelCleanStretchValue.Caption:= 'Vertical';
  end;
end;

procedure TFormMAMEConfiguration.D3DPrescaleChange(Sender: TObject);
begin
  case D3DPrescale.Position of
   -1: LabelD3DPrescaleValue.Caption:= 'None';
    0: LabelD3DPrescaleValue.Caption:= 'Auto';
    1: LabelD3DPrescaleValue.Caption:= 'Full';
    2: LabelD3DPrescaleValue.Caption:= '2';
    3: LabelD3DPrescaleValue.Caption:= '3';
    4: LabelD3DPrescaleValue.Caption:= '4';
  end;
end;

end.
