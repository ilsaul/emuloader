unit uMAMESettings;

interface

uses
  Windows, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ImgList, ComCtrls, Buttons, IniFiles,
  ExtCtrls, GR32_RangeBars, uGR32Extra, MPCommonObjects, EasyListview,
  MPCommonUtilities, Registry, uCommon, PanelEx, AdvOfficeButtons, AdvGroupBox,
  ShadowLabel, ToolWin, EditEx, ButtonsEx, ColorBoxEx, XiTrackBar;

type
  TScreenInfo = record // for MAME/HBMAME
    eScreenName,
    eScreenAspectRatio,
    eScreenResolution,
    eScreenRefreshRate,
    eScreenView: String;
  end;

type
  TFormMAMESettings = class(TForm)
    TopBar: TPanelEx;
    LabelGameTitle: TShadowLabel;
    LabelEmulatorVersion: TShadowLabel;
    SystemIcon: TImage;
    GameIcon: TImage;
    LabelGameStatus: TShadowLabel;
    ButtonPageFolders: TSpeedButtonEx;
    ButtonPageVideo1: TSpeedButtonEx;
    ButtonPageVideo2: TSpeedButtonEx;
    ButtonPageVideo3: TSpeedButtonEx;
    ButtonPageLUAandAudio: TSpeedButtonEx;
    ButtonPageInput: TSpeedButtonEx;
    ButtonPageMisc: TSpeedButtonEx;
    ButtonPageSDLMAMEInput: TSpeedButtonEx;
    Panel3_Video2: TPanelEx;
    Panel4_Video3a: TPanelEx;
    Panel5_LUA: TPanelEx;
    Panel1_Folders: TPanelEx;
    Panel2_Video1: TPanelEx;
    Panel6_Input: TPanelEx;
    Panel8_SDL: TPanelEx;
    Panel7_Miscellaneous: TPanelEx;
    Panel4_Video3b: TPanelEx;
    RecordInputTimecodeFileLabel: TShadowLabel;
    ExitAfterInputPlaybackLabel: TShadowLabel;
    MultiKeyboard: TAdvOfficeCheckBoxEx;
    Mouse: TAdvOfficeCheckBoxEx;
    MultiMouse: TAdvOfficeCheckBoxEx;
    LightGun: TAdvOfficeCheckBoxEx;
    DualLightGun: TAdvOfficeCheckBoxEx;
    LightGunOffScreenReload: TAdvOfficeCheckBoxEx;
    NaturalKeyboard: TAdvOfficeCheckBoxEx;
    SteadyKey: TAdvOfficeCheckBoxEx;
    CoinLockout: TAdvOfficeCheckBoxEx;
    UIMouse: TAdvOfficeCheckBoxEx;
    UIActive: TAdvOfficeCheckBoxEx;
    EnableGlobalInputs: TAdvOfficeCheckBoxEx;
    RecordInputTimecodeFile: TAdvOfficeCheckBoxEx;
    ExitAfterInputPlayback: TAdvOfficeCheckBoxEx;
    SkipGameInfo: TAdvOfficeCheckBoxEx;
    ReadConfigFiles: TAdvOfficeCheckBoxEx;
    WriteConfigFiles: TAdvOfficeCheckBoxEx;
    Cheat: TAdvOfficeCheckBoxEx;
    ConfirmQuit: TAdvOfficeCheckBoxEx;
    DRC: TAdvOfficeCheckBoxEx;
    DRCUseC: TAdvOfficeCheckBoxEx;
    DRCLogUML: TAdvOfficeCheckBoxEx;
    DRCLogNative: TAdvOfficeCheckBoxEx;
    SaveNVRAMOnExit: TAdvOfficeCheckBoxEx;
    AutoSave: TAdvOfficeCheckBoxEx;
    EnableSaveStateRewind: TAdvOfficeCheckBoxEx;
    SkipMandatoryFileMan: TAdvOfficeCheckBoxEx;
    SkipWarnings: TAdvOfficeCheckBoxEx;
    SDLVideoPerformance: TAdvOfficeCheckBoxEx;
    SDLSplitFullScreenMonitors: TAdvOfficeCheckBoxEx;
    VideoOutputModeLabel: TShadowLabel;
    ButtonPageVideoEffectsBGFX: TSpeedButtonEx;
    ButtonPageVideoEffectsHLSL: TSpeedButtonEx;
    ButtonPageVideoEffectsGLSL: TSpeedButtonEx;
    VideoOutputMode: TComboBox2Ex;
    VideoOutputModeButtonHelp: TBitBtnEx;
    PanelBottom: TPanelEx;
    ButtonCancel: TBitBtnEx;
    ButtonOk: TBitBtnEx;
    SaveValidateAllCustomFiles: TAdvOfficeCheckBoxEx;
    ButtonHelpSaveValidateAllCustomFiles: TBitBtnEx;
    ButtonReadFileHelp: TBitBtnEx;
    ButtonResetToDefault: TBitBtnEx;
    ButtonReadFile: TBitBtnEx;
    SampleBox: TPanelEx;
    SampleBoxLabel: TShadowLabel;
    VideoRenderOptionsGroupBox: TPanelEx;
    VideoRenderOptionsGroupBoxLabel: TShadowLabel;
    FullScreenGroupBox: TPanelEx;
    FullScreenGroupBoxLabel: TShadowLabel;
    IntegerScaleFactorVerticalLabel: TShadowLabel;
    IntegerScaleFactorHorizontalLabel: TShadowLabel;
    WindowMode: TAdvOfficeCheckBoxEx;
    MaximizeWindow: TAdvOfficeCheckBoxEx;
    KeepAspectRatio: TAdvOfficeCheckBoxEx;
    WaitVerticalSync: TAdvOfficeCheckBoxEx;
    BilinearFilter: TAdvOfficeCheckBoxEx;
    UnevenStretch: TAdvOfficeCheckBoxEx;
    UnevenStretchX: TAdvOfficeCheckBoxEx;
    IntegerScaleFactorHorizontal: TEditEx;
    IntegerScaleFactorVertical: TEditEx;
    IntegerScaleOverscan: TAdvOfficeCheckBoxEx;
    UnevenStretchY: TAdvOfficeCheckBoxEx;
    AutoUnevenStretchXY: TAdvOfficeCheckBoxEx;
    VectorGroupBox: TPanelEx;
    VectorGroupBoxLabel: TShadowLabel;
    ScreenRotationGroupBox: TPanelEx;
    ScreenRotationGroupBoxLabel: TShadowLabel;
    ArtworkGroupBox: TPanelEx;
    ArtworkGroupBoxLabel: TShadowLabel;
    FallbackArtworkLabel: TShadowLabel;
    OverrideArtworkLabel: TShadowLabel;
    ArtworkBackdrops: TAdvOfficeCheckBoxEx;
    ArtworkBezels: TAdvOfficeCheckBoxEx;
    ArtworkOverlays: TAdvOfficeCheckBoxEx;
    ArtworkCrop: TAdvOfficeCheckBoxEx;
    ArtworkControlPanels: TAdvOfficeCheckBoxEx;
    ArtworkMarquees: TAdvOfficeCheckBoxEx;
    FallbackArtwork: TEditEx;
    OverrideArtwork: TEditEx;
    FullScreenBrightnessLabel: TShadowLabel;
    FullScreenContrastLabel: TShadowLabel;
    FullScreenGammaLabel: TShadowLabel;
    TripleBuffer: TAdvOfficeCheckBoxEx;
    SwitchResolution: TAdvOfficeCheckBoxEx;
    FullScreenBrightness: TGaugeBar2;
    FullScreenContrast: TGaugeBar2;
    FullScreenGamma: TGaugeBar2;
    ScreenOptionsGroupBox: TPanelEx;
    ScreenOptionsGroupBoxLabel: TShadowLabel;
    VectorFlickerEffectLabel: TShadowLabel;
    VectorBeamWidthMinLabel: TShadowLabel;
    VectorBeamWidthMaxLabel: TShadowLabel;
    VectorBeamIntensityWeightLabel: TShadowLabel;
    VectorBeamDotSizeLabel: TShadowLabel;
    VectorFlickerEffect: TGaugeBar2;
    VectorBeamWidthMin: TGaugeBar2;
    VectorBeamWidthMax: TGaugeBar2;
    VectorBeamIntensityWeight: TGaugeBar2;
    Antialias: TAdvOfficeCheckBoxEx;
    VectorBeamDotSize: TGaugeBar2;
    BrightnessLabel: TShadowLabel;
    Prescale_ScaleScreenLabel: TShadowLabel;
    ContrastLabel: TShadowLabel;
    GammaLabel: TShadowLabel;
    PauseBrightnessLabel: TShadowLabel;
    EffectOverlayLabel: TShadowLabel;
    Prescale_ScaleScreen: TGaugeBar;
    Brightness: TGaugeBar2;
    Contrast: TGaugeBar2;
    Gamma: TGaugeBar2;
    PauseBrightness: TGaugeBar2;
    EffectOverlay: TEditEx;
    EffectOverlayButtonSelect: TBitBtnEx;
    FlipX: TAdvOfficeCheckBoxEx;
    FlipY: TAdvOfficeCheckBoxEx;
    RotateRight: TAdvOfficeCheckBoxEx;
    RotateLeft: TAdvOfficeCheckBoxEx;
    AutoRotateRight: TAdvOfficeCheckBoxEx;
    AutoRotateLeft: TAdvOfficeCheckBoxEx;
    Rotate: TAdvOfficeCheckBoxEx;
    FolderDebuggerCommentsGroupBox: TPanelEx;
    FolderDebuggerCommentsGroupBoxLabel: TShadowLabel;
    FolderDiffGroupBox: TPanelEx;
    FolderDiffGroupBoxLabel: TShadowLabel;
    FolderControllerDefinitionsGroupBox: TPanelEx;
    FolderControllerDefinitionsGroupBoxLabel: TShadowLabel;
    FolderCheatFilesGroupBox: TPanelEx;
    FolderCheatFilesGroupBoxLabel: TShadowLabel;
    FolderCrosshairFilesGroupBox: TPanelEx;
    FolderCrosshairFilesGroupBoxLabel: TShadowLabel;
    FolderFontFilesGroupBox: TPanelEx;
    FolderFontFilesGroupBoxLabel: TShadowLabel;
    FolderMemoryCardsGroupBox: TPanelEx;
    FolderMemoryCardsGroupBoxLabel: TShadowLabel;
    FolderInputDeviceLogsGroupBox: TPanelEx;
    FolderInputDeviceLogsGroupBoxLabel: TShadowLabel;
    FolderManualsPDFGroupBox: TPanelEx;
    FolderManualsPDFGroupBoxLabel: TShadowLabel;
    FolderNVRAMGroupBox: TPanelEx;
    FolderNVRAMGroupBoxLabel: TShadowLabel;
    FolderHashFilesGroupBox: TPanelEx;
    FolderHashFilesGroupBoxLabel: TShadowLabel;
    FolderManualsPDF: TEditEx;
    FolderManualsPDFButtonSelect: TBitBtnEx;
    FolderMemoryCards: TEditEx;
    FolderMemoryCardsButtonSelect: TBitBtnEx;
    FolderInputDeviceLogs: TEditEx;
    FolderInputDeviceLogsButtonSelect: TBitBtnEx;
    FolderFontFiles: TEditEx;
    FolderFontFilesButtonSelect: TBitBtnEx;
    FolderCrosshairFiles: TEditEx;
    FolderCrosshairFilesButtonSelect: TBitBtnEx;
    FolderControllerDefinitionsButtonSelect: TBitBtnEx;
    FolderControllerDefinitions: TEditEx;
    FolderCheatFiles: TEditEx;
    FolderCheatFilesButtonSelect: TBitBtnEx;
    FolderDiff: TEditEx;
    FolderDiffButtonSelect: TBitBtnEx;
    FolderDebuggerCommentsButtonSelect: TBitBtnEx;
    FolderDebuggerComments: TEditEx;
    FolderSaveStatesGroupBox: TPanelEx;
    FolderSaveStatesGroupBoxLabel: TShadowLabel;
    FolderNVRAMButtonSelect: TBitBtnEx;
    FolderNVRAM: TEditEx;
    FolderGamesConfigurationsGroupBox: TPanelEx;
    FolderGamesConfigurationsGroupBoxLabel: TShadowLabel;
    FolderGamesConfigurationsButtonSelect: TBitBtnEx;
    FolderGamesConfigurations: TEditEx;
    FolderPluginFilesGroupBox: TPanelEx;
    FolderPluginFilesGroupBoxLabel: TShadowLabel;
    FolderSaveStatesButtonSelect: TBitBtnEx;
    FolderSaveStates: TEditEx;
    FolderLanguageFilesGroupBox: TPanelEx;
    FolderLanguageFilesGroupBoxLabel: TShadowLabel;
    FolderGameSnapshotsGroupBox: TPanelEx;
    FolderGameSnapshotsGroupBoxLabel: TShadowLabel;
    FolderPluginFilesButtonSelect: TBitBtnEx;
    FolderPluginFiles: TEditEx;
    FolderLanguageFilesButtonSelect: TBitBtnEx;
    FolderLanguageFiles: TEditEx;
    FolderGameSnapshotsButtonSelect: TBitBtnEx;
    FolderGameSnapshots: TEditEx;
    FolderSamplesGroupBox: TPanelEx;
    FolderSamplesGroupBoxLabel: TShadowLabel;
    FolderHashFilesButtonSelect: TBitBtnEx;
    FolderHashFiles: TEditEx;
    FolderIniFilesGroupBox: TPanelEx;
    FolderIniFilesGroupBoxLabel: TShadowLabel;
    FolderArtworksGroupBox: TPanelEx;
    FolderArtworksGroupBoxLabel: TShadowLabel;
    FolderROMsGroupBox: TPanelEx;
    FolderROMsGroupBoxLabel: TShadowLabel;
    FolderSamplesButtonSelect: TBitBtnEx;
    FolderSamples: TEditEx;
    FolderArtworks: TEasyListview;
    FolderArtworksButtonUp: TBitBtnEx;
    FolderArtworksButtonDown: TBitBtnEx;
    FolderArtworksButtonSelect: TBitBtnEx;
    FolderArtworksButtonEdit: TBitBtnEx;
    FolderArtworksButtonDelete: TBitBtnEx;
    FolderArtworksButtonClear: TBitBtnEx;
    FolderIniFiles: TEasyListview;
    FolderIniFilesButtonUp: TBitBtnEx;
    FolderIniFilesButtonDown: TBitBtnEx;
    FolderIniFilesButtonSelect: TBitBtnEx;
    FolderIniFilesButtonEdit: TBitBtnEx;
    FolderIniFilesButtonDelete: TBitBtnEx;
    FolderIniFilesButtonClear: TBitBtnEx;
    FolderROMs: TEasyListview;
    FolderROMsButtonUp: TBitBtnEx;
    FolderROMsButtonDown: TBitBtnEx;
    FolderROMsButtonSelect: TBitBtnEx;
    FolderROMsButtonEdit: TBitBtnEx;
    FolderROMsButtonDelete: TBitBtnEx;
    FolderROMsButtonClear: TBitBtnEx;
    ScreensGroupBox: TPanelEx;
    ScreensGroupBoxLabel: TShadowLabel;
    SnapshotsGroupBox: TPanelEx;
    SnapshotsGroupBoxLabel: TShadowLabel;
    PerformanceGroupBox: TPanelEx;
    PerformanceGroupBoxLabel: TShadowLabel;
    SpeedLabel: TShadowLabel;
    FrameskipLabel: TShadowLabel;
    ThreadPriorityLabel: TShadowLabel;
    NumberProcessorsLabel: TShadowLabel;
    BenchmarkLabel: TShadowLabel;
    SecondsToRunLabel: TShadowLabel;
    AutoFrameskip: TAdvOfficeCheckBoxEx;
    Throttle: TAdvOfficeCheckBoxEx;
    Sleep: TAdvOfficeCheckBoxEx;
    Multithreading: TAdvOfficeCheckBoxEx;
    RefreshSpeed: TAdvOfficeCheckBoxEx;
    SyncronizeRefreshRate: TAdvOfficeCheckBoxEx;
    Speed: TGaugeBar2;
    Frameskip: TComboBox2Ex;
    ThreadPriority: TComboBox2Ex;
    NumberProcessors: TComboBox2Ex;
    Benchmark: TGaugeBar;
    SecondsToRun: TGaugeBar;
    LowLatency: TAdvOfficeCheckBoxEx;
    ScreenNameLabel: TShadowLabel;
    ScreenAspectRatioLabel: TShadowLabel;
    ScreenResolutionLabel: TShadowLabel;
    ScreenRefreshRateLabel: TShadowLabel;
    ScreenViewLabel: TShadowLabel;
    NumberScreensLabel: TShadowLabel;
    ScreenName: TComboBox2Ex;
    ScreenAspectRatio: TComboBox2Ex;
    ScreenResolution: TComboBox2Ex;
    ScreenRefreshRate: TComboBox2Ex;
    ScreenView: TComboBox2Ex;
    ScreensSelector: TComboBox2Ex;
    ScreenButtonDefaultSettings: TBitBtnEx;
    NumberScreens: TXiTrackBar;
    SnapNameLabel: TShadowLabel;
    SnapViewLabel: TShadowLabel;
    SnapSizeCustomXLabel: TShadowLabel;
    SnapSizeCustomLabel: TShadowLabel;
    SnapBurnIn: TAdvOfficeCheckBoxEx;
    SnapNameButtonDefault: TBitBtnEx;
    SnapView: TComboBox2Ex;
    SnapViewButtonDefault: TBitBtnEx;
    SnapSizeAuto: TAdvOfficeCheckBoxEx;
    SnapSizeWidth: TEditEx;
    SnapSizeHeight: TEditEx;
    SnapName: TEditEx;
    SnapBilinear: TAdvOfficeCheckBoxEx;
    Panel4_Video3c: TPanelEx;
    EnableOpenGLFilterNotFFLabel: TShadowLabel;
    OpenGLForcePowerTwoTextures: TAdvOfficeCheckBoxEx;
    OpenGLDisableUseGL_ARBTextureRectangle: TAdvOfficeCheckBoxEx;
    EnableOpenGL_VBO: TAdvOfficeCheckBoxEx;
    EnableOpenGL_PBO: TAdvOfficeCheckBoxEx;
    EnableGLSL: TAdvOfficeCheckBoxEx;
    EnableOpenGLFilterNotFF: TAdvOfficeCheckBoxEx;
    HLSLEnable: TAdvOfficeCheckBoxEx;
    YIQEnable: TAdvOfficeCheckBoxEx;
    HLSLOversampling: TAdvOfficeCheckBoxEx;
    BGFXDebug: TAdvOfficeCheckBoxEx;
    GLSL_Shader_MAMEGroupBox: TPanelEx;
    GLSL_Shader_MAMEGroupBoxLabel: TShadowLabel;
    GLSL_Shader_ScreenGroupBox: TPanelEx;
    GLSL_Shader_ScreenGroupBoxLabel: TShadowLabel;
    GLSL_Shader_MAME0Label: TShadowLabel;
    GLSL_Shader_MAME1Label: TShadowLabel;
    GLSL_Shader_MAME2Label: TShadowLabel;
    GLSL_Shader_MAME3Label: TShadowLabel;
    GLSL_Shader_MAME4Label: TShadowLabel;
    GLSL_Shader_MAME5Label: TShadowLabel;
    GLSL_Shader_MAME6Label: TShadowLabel;
    GLSL_Shader_MAME7Label: TShadowLabel;
    GLSL_Shader_MAME8Label: TShadowLabel;
    GLSL_Shader_MAME9Label: TShadowLabel;
    GLSL_Shader_MAME0: TEditEx;
    GLSL_Shader_MAME0ButtonSelect: TBitBtnEx;
    GLSL_Shader_MAME1: TEditEx;
    GLSL_Shader_MAME1ButtonSelect: TBitBtnEx;
    GLSL_Shader_MAME2: TEditEx;
    GLSL_Shader_MAME2ButtonSelect: TBitBtnEx;
    GLSL_Shader_MAME3: TEditEx;
    GLSL_Shader_MAME3ButtonSelect: TBitBtnEx;
    GLSL_Shader_MAME4: TEditEx;
    GLSL_Shader_MAME4ButtonSelect: TBitBtnEx;
    GLSL_Shader_MAME5: TEditEx;
    GLSL_Shader_MAME5ButtonSelect: TBitBtnEx;
    GLSL_Shader_MAME6: TEditEx;
    GLSL_Shader_MAME6ButtonSelect: TBitBtnEx;
    GLSL_Shader_MAME7: TEditEx;
    GLSL_Shader_MAME7ButtonSelect: TBitBtnEx;
    GLSL_Shader_MAME8: TEditEx;
    GLSL_Shader_MAME8ButtonSelect: TBitBtnEx;
    GLSL_Shader_MAME9: TEditEx;
    GLSL_Shader_MAME9ButtonSelect: TBitBtnEx;
    GLSL_Shader_Screen0Label: TShadowLabel;
    GLSL_Shader_Screen1Label: TShadowLabel;
    GLSL_Shader_Screen2Label: TShadowLabel;
    GLSL_Shader_Screen3Label: TShadowLabel;
    GLSL_Shader_Screen4Label: TShadowLabel;
    GLSL_Shader_Screen5Label: TShadowLabel;
    GLSL_Shader_Screen6Label: TShadowLabel;
    GLSL_Shader_Screen7Label: TShadowLabel;
    GLSL_Shader_Screen8Label: TShadowLabel;
    GLSL_Shader_Screen9Label: TShadowLabel;
    GLSL_Shader_Screen0: TEditEx;
    GLSL_Shader_Screen0ButtonSelect: TBitBtnEx;
    GLSL_Shader_Screen1: TEditEx;
    GLSL_Shader_Screen1ButtonSelect: TBitBtnEx;
    GLSL_Shader_Screen2: TEditEx;
    GLSL_Shader_Screen2ButtonSelect: TBitBtnEx;
    GLSL_Shader_Screen3: TEditEx;
    GLSL_Shader_Screen3ButtonSelect: TBitBtnEx;
    GLSL_Shader_Screen4: TEditEx;
    GLSL_Shader_Screen4ButtonSelect: TBitBtnEx;
    GLSL_Shader_Screen5: TEditEx;
    GLSL_Shader_Screen5ButtonSelect: TBitBtnEx;
    GLSL_Shader_Screen6: TEditEx;
    GLSL_Shader_Screen6ButtonSelect: TBitBtnEx;
    GLSL_Shader_Screen7: TEditEx;
    GLSL_Shader_Screen7ButtonSelect: TBitBtnEx;
    GLSL_Shader_Screen8: TEditEx;
    GLSL_Shader_Screen8ButtonSelect: TBitBtnEx;
    GLSL_Shader_Screen9: TEditEx;
    GLSL_Shader_Screen9ButtonSelect: TBitBtnEx;
    HLSLPathGroupBox: TPanelEx;
    HLSLPathGroupBoxLabel: TShadowLabel;
    ShadowMaskTextureGroupBox: TPanelEx;
    ShadowMaskTextureGroupBoxLabel: TShadowLabel;
    ShadowMaskTileModeGroupBox: TPanelEx;
    ShadowMaskTileModeGroupBoxLabel: TShadowLabel;
    VectorPostProcessingGroupBox: TPanelEx;
    VectorPostProcessingGroupBoxLabel: TShadowLabel;
    HLSLIniFileGroupBox: TPanelEx;
    HLSLIniFileGroupBoxLabel: TShadowLabel;
    VectorBeamSmoothLabel: TShadowLabel;
    VectorMaximumAttenuationLabel: TShadowLabel;
    VectorMinimumLengthAttenuationLabel: TShadowLabel;
    VectorBeamSmooth: TGaugeBar2;
    VectorMaximumAttenuation: TGaugeBar2;
    VectorMinimumLengthAttenuation: TGaugeBar2;
    HLSLPathButtonSelect: TBitBtnEx;
    HLSLPath: TEditEx;
    ShadowMaskTextureButtonReset: TBitBtnEx;
    ShadowMaskTextureButtonSelect: TBitBtnEx;
    ShadowMaskTexture: TEditEx;
    ShadowMaskTileMode: TComboBox2Ex;
    HLSLUpscaleSnapGroupBox: TPanelEx;
    HLSLUpscaleSnapGroupBoxLabel: TShadowLabel;
    HLSLUpscaleSnapshotXLabel: TShadowLabel;
    HLSLUpscaleSnapX: TEditEx;
    HLSLUpscaleSnapY: TEditEx;
    HLSLUpscaleSnapButtonReset: TBitBtnEx;
    HLSLBloomPostProcessingGroupBox: TPanelEx;
    HLSLBloomPostProcessingGroupBoxLabel: TShadowLabel;
    BloomBlendModeLabel: TShadowLabel;
    BloomBlendMode: TComboBox2Ex;
    BloomLUTTextureScreen: TEditEx;
    BloomLUTTextureScreenButtonSelect: TBitBtnEx;
    BloomLUTTextureScreenButtonReset: TBitBtnEx;
    BloomLUTEnabled: TAdvOfficeCheckBoxEx;
    BloomLOOTUIEnabled: TAdvOfficeCheckBoxEx;
    BloomLUTTextureUI: TEditEx;
    BloomLUTTextureUIButtonSelect: TBitBtnEx;
    BloomLUTTextureUIButtonReset: TBitBtnEx;
    ReadCustomHLSLFile: TAdvOfficeCheckBoxEx;
    WriteCustomHLSLFile: TAdvOfficeCheckBoxEx;
    HLSLIniFile: TEditEx;
    HLSLIniFileButtonReset: TBitBtnEx;
    BGFXBackendGroupBox: TPanelEx;
    BGFXBackendGroupBoxLabel: TShadowLabel;
    BGFXBackend: TComboBox2Ex;
    ShadowLabel2: TShadowLabel;
    BGFXPathGroupBox: TPanelEx;
    BGFXPathGroupBoxLabel: TShadowLabel;
    BGFXPath: TEditEx;
    BGFXPathButtonSelect: TBitBtnEx;
    BGFXShadowMaskTextureNameGroupBox: TPanelEx;
    BGFXShadowMaskTextureNameGroupBoxLabel: TShadowLabel;
    BGFXShadowMaskTextureNameButtonReset: TBitBtnEx;
    BGFXShadowMaskTextureNameButtonSelect: TBitBtnEx;
    BGFXShadowMaskTextureName: TEditEx;
    BGFXLUTTextureNameGroupBox: TPanelEx;
    BGFXLUTTextureNameGroupBoxLabel: TShadowLabel;
    BGFXLUTTextureNameButtonReset: TBitBtnEx;
    BGFXLUTTextureNameButtonSelect: TBitBtnEx;
    BGFXLUTTextureName: TEditEx;
    BGFXScreenShaderChainsGroupBox: TPanelEx;
    BGFXScreenShaderChainsGroupBoxLabel: TShadowLabel;
    BGFXScreenShaderChainsHelpLabel: TShadowLabel;
    BGFXScreenShaderChainsDetailsHTMLLabel: TShadowLabel;
    BGFXScreenShaderChainsButtonReset: TBitBtnEx;
    BGFXScreenShaderChainsButtonReload: TBitBtnEx;
    BGFXScreenShaderChains: TEditEx;
    BGFXScreenShaderChains_ListView: TEasyListview;
    BGFXScreenShaderChainsButtonSelect: TBitBtnEx;
    BGFXScreenShaderChains_ListViewButtonAdd: TBitBtnEx;
    BGFXScreenShaderChains_ListViewButtonSelect: TBitBtnEx;
    AudioGroupBox: TPanelEx;
    AudioGroupBoxLabel: TShadowLabel;
    AudioLatencyLabel: TShadowLabel;
    SampleRateLabel: TShadowLabel;
    VolumeLabel: TShadowLabel;
    SoundOutputMethodLabel: TShadowLabel;
    SpeakerReportLabel: TShadowLabel;
    Samples: TAdvOfficeCheckBoxEx;
    AudioLatency: TComboBox2Ex;
    SampleRate: TComboBox2Ex;
    Volume: TGaugeBar;
    AudioLatencyButtonReset: TBitBtnEx;
    SoundOutputMethod: TComboBox2Ex;
    SpeakerReport: TComboBox2Ex;
    PortAudioSettingsGroupBox: TPanelEx;
    PortAudioSettingsGroupBoxLabel: TShadowLabel;
    PortAudioAPILabel: TShadowLabel;
    PortAudioDeviceLabel: TShadowLabel;
    PortAudioLatencyLabel: TShadowLabel;
    PortAudioAPIButtonClear: TBitBtnEx;
    PortAudioAPI: TEditEx;
    PortAudioDevice: TEditEx;
    PortAudioDeviceButtonClear: TBitBtnEx;
    PortAudioLatency: TEditEx;
    PortAudioLatencyButtonReset: TBitBtnEx;
    AutobootGroupBox: TPanelEx;
    AutobootGroupBoxLabel: TShadowLabel;
    AutobootCommandLabel: TShadowLabel;
    AutobootDelayLabel: TShadowLabel;
    AutobootLuaScriptLabel: TShadowLabel;
    AutobootCommand: TEditEx;
    AutobootDelay: TGaugeBar;
    AutobootLuaScript: TEditEx;
    AutobootLuaScriptButtonSelect: TBitBtnEx;
    AutobootCommandButtonClear: TBitBtnEx;
    LUAPluginsToEnableGroupBox: TPanelEx;
    LUAPluginsToEnableGroupBoxLabel: TShadowLabel;
    LUAPluginsToEnable2Label: TShadowLabel;
    LUAPluginsToEnable: TEasyListview;
    EnableLUAPluginSupport: TAdvOfficeCheckBoxEx;
    OSDOutputOptionsGroupBox: TPanelEx;
    OSDOutputOptionsGroupBoxLabel: TShadowLabel;
    HTTPServerGroupBox: TPanelEx;
    HTTPServerGroupBoxLabel: TShadowLabel;
    AnalogSettingsGroupBox: TPanelEx;
    AnalogSettingsGroupBoxLabel: TShadowLabel;
    Analog_PaddleLabel: TShadowLabel;
    Analog_JoystickLabel: TShadowLabel;
    Analog_LightGunLabel: TShadowLabel;
    Analog_PedalLabel: TShadowLabel;
    Analog_DialLabel: TShadowLabel;
    Analog_TrackballLabel: TShadowLabel;
    Analog_PositionalLabel: TShadowLabel;
    Analog_MouseLabel: TShadowLabel;
    Analog_Paddle: TComboBox2Ex;
    Analog_Joystick: TComboBox2Ex;
    Analog_LightGun: TComboBox2Ex;
    Analog_Pedal: TComboBox2Ex;
    Analog_Dial: TComboBox2Ex;
    Analog_Trackball: TComboBox2Ex;
    Analog_Positional: TComboBox2Ex;
    Analog_Mouse: TComboBox2Ex;
    HTTPServer: TAdvOfficeCheckBoxEx;
    HTTPPortLabel: TShadowLabel;
    HTTPPort: TEditEx;
    HTTPPathLabel: TShadowLabel;
    HTTPPath: TEditEx;
    HTTPServerButtonReset: TBitBtnEx;
    ControllerDefinitionsGroupBox: TPanelEx;
    ControllerDefinitionsGroupBoxLabel: TShadowLabel;
    UIModeGroupBox: TPanelEx;
    UIModeGroupBoxLabel: TShadowLabel;
    UIModeKeyCustomButtonReset: TBitBtnEx;
    UIModeKeyButtonDetectKey: TBitBtnEx;
    UIModeKeyCustomLabel: TShadowLabel;
    UIModeKeyCustom: TEditEx;
    CommOptionsGroupBox: TPanelEx;
    CommOptionsGroupBoxLabel: TShadowLabel;
    CommLocalHostLabel: TShadowLabel;
    CommLocalPortLabel: TShadowLabel;
    CommRemoteHostLabel: TShadowLabel;
    CommRemotePortLabel: TShadowLabel;
    CommLocalHost: TEditEx;
    CommLocalPort: TEditEx;
    CommRemoteHost: TEditEx;
    CommRemotePort: TEditEx;
    CommLocalHostButtonReset: TBitBtnEx;
    CommRemoteHostButtonReset: TBitBtnEx;
    CommSyncFrame: TAdvOfficeCheckBoxEx;
    JoystickGroupBox: TPanelEx;
    JoystickGroupBoxLabel: TShadowLabel;
    JoystickDeadzoneLabel: TShadowLabel;
    JoystickSaturationLabel: TShadowLabel;
    JoystickDeadzone: TGaugeBar2;
    Joystick: TAdvOfficeCheckBoxEx;
    JoystickContradictory: TAdvOfficeCheckBoxEx;
    JoystickSaturation: TGaugeBar2;
    OSDInputOptionsGroupBox: TPanelEx;
    OSDInputOptionsGroupBoxLabel: TShadowLabel;
    OSDInputKeyboardProviderLabel: TShadowLabel;
    OSDInputMouseProviderLabel: TShadowLabel;
    OSDInputLightgunProviderLabel: TShadowLabel;
    OSDInputJoystickProviderLabel: TShadowLabel;
    OSDInputKeyboardProvider: TComboBox2Ex;
    OSDInputMouseProvider: TComboBox2Ex;
    OSDInputLightgunProvider: TComboBox2Ex;
    OSDInputJoystickProvider: TComboBox2Ex;
    OSDOutputProviderLabel: TShadowLabel;
    OSDOutputProvider: TComboBox2Ex;
    CoinImpulseGroupBox: TPanelEx;
    CoinImpulseGroupBoxLabel: TShadowLabel;
    ControllerDefinitions: TComboBox2Ex;
    CoinImpulse: TComboBox2Ex;
    UserInterfaceGroupBox: TPanelEx;
    UserInterfaceGroupBoxLabel: TShadowLabel;
    RAMSizeGroupBox: TPanelEx;
    RAMSizeGroupBoxLabel: TShadowLabel;
    DebugGroupBox: TPanelEx;
    DebugGroupBoxLabel: TShadowLabel;
    DebuggerEnable: TAdvOfficeCheckBoxEx;
    DebuggerScriptLabel: TShadowLabel;
    WatchdogLabel: TShadowLabel;
    DebuggerLabel: TShadowLabel;
    WatchdogSecsLabel: TShadowLabel;
    DebuggerPortLabel: TShadowLabel;
    DebuggerFont: TShadowLabel;
    DebuggerFontSizeLabel: TShadowLabel;
    Log: TAdvOfficeCheckBoxEx;
    OSLog: TAdvOfficeCheckBoxEx;
    Verbose: TAdvOfficeCheckBoxEx;
    UpdateInPause: TAdvOfficeCheckBoxEx;
    DebuggerScript: TEditEx;
    DebuggerScriptButtonSelect: TBitBtnEx;
    Watchdog: TEditEx;
    Debugger: TComboBox2Ex;
    DebuggerPort: TEditEx;
    DebuggerPortButtonReset: TBitBtnEx;
    DebugLogConsole: TAdvOfficeCheckBoxEx;
    DebuggerFontButtonReset: TBitBtnEx;
    DebuggerFontSize: TGaugeBar;
    UIFontButtonSelect: TBitBtnEx;
    UIFont: TEditEx;
    UIFontLabel: TShadowLabel;
    TypeUserInterface: TComboBox2Ex;
    TypeUserInterfaceLabel: TShadowLabel;
    UIFontProvider: TComboBox2Ex;
    UIFontProviderLabel: TShadowLabel;
    DisplayLanguageList: TEasyListview;
    DisplayLanguageLabel: TShadowLabel;
    SaveStateRewindBufferSizeGroupBox: TPanelEx;
    SaveStateRewindBufferSizeGroupBoxLabel: TShadowLabel;
    SaveStateRewindBufferSize: TGaugeBar;
    SaveStateNameGroupBox: TPanelEx;
    SaveStateNameGroupBoxLabel: TShadowLabel;
    SaveStateNameButtonReset: TBitBtnEx;
    SaveStateName: TEditEx;
    BiosSetsGroupBox: TPanelEx;
    BiosSetsGroupBoxLabel: TShadowLabel;
    BiosSetsListView: TEasyListview;
    SDLLightgunMappingGroupBox: TPanelEx;
    SDLLightgunMappingGroupBoxLabel: TShadowLabel;
    SDLLightgunMapping1Label: TShadowLabel;
    SDLLightgunMapping2Label: TShadowLabel;
    SDLLightgunMapping3Label: TShadowLabel;
    SDLLightgunMapping4Label: TShadowLabel;
    SDLLightgunMapping5Label: TShadowLabel;
    SDLLightgunMapping6Label: TShadowLabel;
    SDLLightgunMapping7Label: TShadowLabel;
    SDLLightgunMapping8Label: TShadowLabel;
    SDLLightgunMapping1: TComboBox2Ex;
    SDLLightgunMapping1Custom: TEditEx;
    SDLLightgunMapping2: TComboBox2Ex;
    SDLLightgunMapping2Custom: TEditEx;
    SDLLightgunMapping3: TComboBox2Ex;
    SDLLightgunMapping3Custom: TEditEx;
    SDLLightgunMapping4: TComboBox2Ex;
    SDLLightgunMapping4Custom: TEditEx;
    SDLLightgunMapping5: TComboBox2Ex;
    SDLLightgunMapping5Custom: TEditEx;
    SDLLightgunMapping6: TComboBox2Ex;
    SDLLightgunMapping6Custom: TEditEx;
    SDLLightgunMapping7: TComboBox2Ex;
    SDLLightgunMapping7Custom: TEditEx;
    SDLLightgunMapping8: TComboBox2Ex;
    SDLLightgunMapping8Custom: TEditEx;
    SDL2MouseMappingGroupBox: TPanelEx;
    SDL2MouseMappingGroupBoxLabel: TShadowLabel;
    SDL2MouseMapping1Label: TShadowLabel;
    SDL2MouseMapping2Label: TShadowLabel;
    SDL2MouseMapping3Label: TShadowLabel;
    SDL2MouseMapping4Label: TShadowLabel;
    SDL2MouseMapping5Label: TShadowLabel;
    SDL2MouseMapping6Label: TShadowLabel;
    SDL2MouseMapping7Label: TShadowLabel;
    SDL2MouseMapping8Label: TShadowLabel;
    SDL2MouseMapping1: TComboBox2Ex;
    SDL2MouseMapping1Custom: TEditEx;
    SDL2MouseMapping2: TComboBox2Ex;
    SDL2MouseMapping2Custom: TEditEx;
    SDL2MouseMapping3: TComboBox2Ex;
    SDL2MouseMapping3Custom: TEditEx;
    SDL2MouseMapping4: TComboBox2Ex;
    SDL2MouseMapping4Custom: TEditEx;
    SDL2MouseMapping5: TComboBox2Ex;
    SDL2MouseMapping5Custom: TEditEx;
    SDL2MouseMapping6: TComboBox2Ex;
    SDL2MouseMapping6Custom: TEditEx;
    SDL2MouseMapping7: TComboBox2Ex;
    SDL2MouseMapping7Custom: TEditEx;
    SDL2MouseMapping8: TComboBox2Ex;
    SDL2MouseMapping8Custom: TEditEx;
    SDLJoystickMappingGroupBox: TPanelEx;
    SDLJoystickMappingGroupBoxLabel: TShadowLabel;
    SDLJoystickMapping1Label: TShadowLabel;
    SDLJoystickMapping2Label: TShadowLabel;
    SDLJoystickMapping3Label: TShadowLabel;
    SDLJoystickMapping4Label: TShadowLabel;
    SDLJoystickMapping5Label: TShadowLabel;
    SDLJoystickMapping6Label: TShadowLabel;
    SDLJoystickMapping7Label: TShadowLabel;
    SDLJoystickMapping8Label: TShadowLabel;
    SDLJoystickMapping1: TComboBox2Ex;
    SDLJoystickMapping1Custom: TEditEx;
    SDLJoystickMapping2: TComboBox2Ex;
    SDLJoystickMapping2Custom: TEditEx;
    SDLJoystickMapping3: TComboBox2Ex;
    SDLJoystickMapping3Custom: TEditEx;
    SDLJoystickMapping4: TComboBox2Ex;
    SDLJoystickMapping4Custom: TEditEx;
    SDLJoystickMapping5: TComboBox2Ex;
    SDLJoystickMapping5Custom: TEditEx;
    SDLJoystickMapping6: TComboBox2Ex;
    SDLJoystickMapping6Custom: TEditEx;
    SDLJoystickMapping7: TComboBox2Ex;
    SDLJoystickMapping7Custom: TEditEx;
    SDLJoystickMapping8: TComboBox2Ex;
    SDLJoystickMapping8Custom: TEditEx;
    PS3SixaxisControllers: TAdvOfficeCheckBoxEx;
    SDL2KeyboardMappingGroupBox: TPanelEx;
    SDL2KeyboardMappingGroupBoxLabel: TShadowLabel;
    SDL2KeyboardMapping1Label: TShadowLabel;
    SDL2KeyboardMapping2Label: TShadowLabel;
    SDL2KeyboardMapping3Label: TShadowLabel;
    SDL2KeyboardMapping4Label: TShadowLabel;
    SDL2KeyboardMapping5Label: TShadowLabel;
    SDL2KeyboardMapping6Label: TShadowLabel;
    SDL2KeyboardMapping7Label: TShadowLabel;
    SDL2KeyboardMapping8Label: TShadowLabel;
    SDL2KeyboardMapping1: TComboBox2Ex;
    SDL2KeyboardMapping1Custom: TEditEx;
    SDL2KeyboardMapping2: TComboBox2Ex;
    SDL2KeyboardMapping2Custom: TEditEx;
    SDL2KeyboardMapping3: TComboBox2Ex;
    SDL2KeyboardMapping3Custom: TEditEx;
    SDL2KeyboardMapping4: TComboBox2Ex;
    SDL2KeyboardMapping4Custom: TEditEx;
    SDL2KeyboardMapping5: TComboBox2Ex;
    SDL2KeyboardMapping5Custom: TEditEx;
    SDL2KeyboardMapping6: TComboBox2Ex;
    SDL2KeyboardMapping6Custom: TEditEx;
    SDL2KeyboardMapping7: TComboBox2Ex;
    SDL2KeyboardMapping7Custom: TEditEx;
    SDL2KeyboardMapping8: TComboBox2Ex;
    SDL2KeyboardMapping8Custom: TEditEx;
    SDLLowLevelDriverGroupBox: TPanelEx;
    SDLLowLevelDriverGroupBoxLabel: TShadowLabel;
    SDLVideoDriverToUseLabel: TShadowLabel;
    SDL2RenderDriverToUseLabel: TShadowLabel;
    SDLAudioDriverToUseLabel: TShadowLabel;
    SDLAlternativeLibGLToUseLabel: TShadowLabel;
    SDLVideoDriverToUse: TComboBox2Ex;
    SDL2RenderDriverToUse: TComboBox2Ex;
    SDLAudioDriverToUse: TComboBox2Ex;
    SDLAlternativeLibGLToUse: TComboBox2Ex;
    SDLAlternativeLibGLToUseCustom: TEditEx;
    SDLAlternativeLibGLToUseCustomButtonSelect: TBitBtnEx;
    SDLAttachWindowGroupBox: TPanelEx;
    SDLAttachWindowGroupBoxLabel: TShadowLabel;
    SDLAttachWindow: TEditEx;
    SDLAttachWindowButtonClear: TBitBtnEx;
    SDKKeyboardMappingGroupBox: TPanelEx;
    SDKKeyboardMappingGroupBoxLabel: TShadowLabel;
    SDKKeyboardMapping: TAdvOfficeCheckBoxEx;
    SDLKeymapFilenameButtonReset: TBitBtnEx;
    SDLKeymapFilenameButtonSelect: TBitBtnEx;
    SDLKeymapFilename: TEditEx;
    SDLKeymapFilenameLabel: TShadowLabel;
    SDLOutputModeGroupBox: TPanelEx;
    SDLOutputModeGroupBoxLabel: TShadowLabel;
    SDLScaleModeLabel: TShadowLabel;
    SDLCenterHorizontally: TAdvOfficeCheckBoxEx;
    SDLCenterVertically: TAdvOfficeCheckBoxEx;
    SDLScaleMode: TComboBox2Ex;
    EnableMenuBar: TAdvOfficeCheckBoxEx;
    MonitorProvider: TComboBox2Ex;
    MonitorProviderLabel: TShadowLabel;
    AttachWindow: TEditEx;
    AttachWindowLabel: TShadowLabel;
    EnableEmulatorLUAConsole: TAdvOfficeCheckBoxEx;
    RAMSize: TComboBox2Ex;
    RAMSizeLabel: TShadowLabel;
    FolderHomePathGroupBox: TPanelEx;
    FolderHomePathGroupBoxLabel: TShadowLabel;
    FolderHomePathButtonSelect: TBitBtnEx;
    FolderHomePath: TEditEx;
    FolderLooseSoftwareGroupBox: TPanelEx;
    FolderLooseSoftwareGroupBoxLabel: TShadowLabel;
    FolderLooseSoftwareButtonSelect: TBitBtnEx;
    FolderLooseSoftware: TEditEx;
    FolderShareEmulatedMachinesGroupBox: TPanelEx;
    FolderShareEmulatedMachinesGroupBoxLabel: TShadowLabel;
    FolderShareEmulatedMachinesButtonSelect: TBitBtnEx;
    FolderShareEmulatedMachines: TEditEx;
    AudioUseCompressor: TAdvOfficeCheckBoxEx;
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure ButtonReadFileClick(Sender: TObject);
    procedure EffectOverlayButtonSelectClick(Sender: TObject);
    procedure FolderROMsButtonSelectClick(Sender: TObject);
    procedure FolderSamplesButtonSelectClick(Sender: TObject);
    procedure FolderGamesConfigurationsButtonSelectClick(Sender: TObject);
    procedure FolderMemoryCardsButtonSelectClick(Sender: TObject);
    procedure FolderInputDeviceLogsButtonSelectClick(Sender: TObject);
    procedure FolderSaveStatesButtonSelectClick(Sender: TObject);
    procedure FolderGameSnapshotsButtonSelectClick(Sender: TObject);
    procedure FolderDiffButtonSelectClick(Sender: TObject);
    procedure DebuggerScriptButtonSelectClick(Sender: TObject);
    procedure FolderROMsButtonClearClick(Sender: TObject);
    procedure VolumeChange(Sender: TObject);
    procedure JoystickDeadzoneChange(Sender: TObject);
    procedure BrightnessChange(Sender: TObject);
    procedure ContrastChange(Sender: TObject);
    procedure GammaChange(Sender: TObject);
    procedure PauseBrightnessChange(Sender: TObject);
    procedure LabelJoystickSaturationValueClick(Sender: TObject);
    procedure Prescale_ScaleScreenChange(Sender: TObject);
    procedure FullScreenBrightnessChange(Sender: TObject);
    procedure FullScreenContrastChange(Sender: TObject);
    procedure FullScreenGammaChange(Sender: TObject);
    procedure VectorFlickerEffectChange(Sender: TObject);
    procedure SecondsToRunChange(Sender: TObject);
    procedure ScreenNameSelect(Sender: TObject);
    procedure ScreenAspectRatioSelect(Sender: TObject);
    procedure ScreenResolutionSelect(Sender: TObject);
    procedure ScreenViewSelect(Sender: TObject);
    procedure ScreensSelectorSelect(Sender: TObject);
    procedure ScreenRefreshRateSelect(Sender: TObject);
    procedure JoystickSaturationChange(Sender: TObject);
    procedure FolderROMsButtonEditClick(Sender: TObject);
    procedure FolderROMsButtonDeleteClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FolderNVRAMButtonSelectClick(Sender: TObject);
    procedure SpeedChange(Sender: TObject);
    procedure ScreenButtonDefaultSettingsClick(Sender: TObject);
    procedure SnapSizeAutoClick(Sender: TObject);
    procedure SnapNameDefaultButtonClick(Sender: TObject);
    procedure SnapSizeWidthKeyPress(Sender: TObject; var Key: Char);
    procedure SnapViewDefaultButtonClick(Sender: TObject);
    procedure FolderROMsKeyAction(Sender: TCustomEasyListview;
      var CharCode: Word; var Shift: TShiftState; var DoDefault: Boolean);
    procedure FolderROMsItemEditEnd(Sender: TCustomEasyListview;
      Item: TEasyItem);
    procedure FolderROMsItemEdited(Sender: TCustomEasyListview;
      Item: TEasyItem; var NewValue: Variant; var Accept: Boolean);
    procedure FolderROMsButtonUpClick(Sender: TObject);
    procedure UIModeKeyChange(Sender: TObject);
    procedure UIModeKeyButtonDetectKeyClick(Sender: TObject);
    procedure FolderIniFilesKeyAction(Sender: TCustomEasyListview;
      var CharCode: Word; var Shift: TShiftState; var DoDefault: Boolean);
    procedure FolderIniFilesButtonUpClick(Sender: TObject);
    procedure FolderIniFilesButtonSelectClick(Sender: TObject);
    procedure FolderIniFilesButtonEditClick(Sender: TObject);
    procedure FolderIniFilesButtonDeleteClick(Sender: TObject);
    procedure FolderIniFilesButtonClearClick(Sender: TObject);
    procedure FolderArtworksKeyAction(Sender: TCustomEasyListview;
      var CharCode: Word; var Shift: TShiftState; var DoDefault: Boolean);
    procedure FolderArtworksButtonUpClick(Sender: TObject);
    procedure FolderArtworksButtonSelectClick(Sender: TObject);
    procedure FolderArtworksButtonEditClick(Sender: TObject);
    procedure FolderArtworksButtonDeleteClick(Sender: TObject);
    procedure FolderArtworksButtonClearClick(Sender: TObject);
    procedure FolderCheatFilesButtonSelectClick(Sender: TObject);
    procedure FolderHashFilesButtonSelectClick(Sender: TObject);
    procedure ShadowMaskTextureButtonSelectClick(Sender: TObject);
    procedure FolderCrosshairFilesButtonSelectClick(Sender: TObject);
    procedure UIFontButtonSelectClick(Sender: TObject);
    procedure SpeedMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure AutobootDelayChange(Sender: TObject);
    procedure AutobootLuaScriptButtonSelectClick(Sender: TObject);
    procedure SnapViewButtonDefaultClick(Sender: TObject);
    procedure HLSLPathButtonSelectClick(Sender: TObject);
    procedure BenchmarkChange(Sender: TObject);
    procedure HLSLIniFileButtonResetClick(Sender: TObject);
    procedure AutobootCommandButtonClearClick(Sender: TObject);
    procedure SDLJoystickMapping1Select(Sender: TObject);
    procedure SDLJoystickMapping2Select(Sender: TObject);
    procedure SDLJoystickMapping3Select(Sender: TObject);
    procedure SDLJoystickMapping4Select(Sender: TObject);
    procedure SDLJoystickMapping5Select(Sender: TObject);
    procedure SDLJoystickMapping6Select(Sender: TObject);
    procedure SDLJoystickMapping7Select(Sender: TObject);
    procedure SDLJoystickMapping8Select(Sender: TObject);
    procedure GLSL_Shader_MAME0ButtonSelectClick(Sender: TObject);
    procedure GLSL_Shader_MAME1ButtonSelectClick(Sender: TObject);
    procedure GLSL_Shader_MAME2ButtonSelectClick(Sender: TObject);
    procedure GLSL_Shader_MAME3ButtonSelectClick(Sender: TObject);
    procedure GLSL_Shader_MAME4ButtonSelectClick(Sender: TObject);
    procedure GLSL_Shader_MAME5ButtonSelectClick(Sender: TObject);
    procedure GLSL_Shader_MAME6ButtonSelectClick(Sender: TObject);
    procedure GLSL_Shader_MAME7ButtonSelectClick(Sender: TObject);
    procedure GLSL_Shader_MAME8ButtonSelectClick(Sender: TObject);
    procedure GLSL_Shader_MAME9ButtonSelectClick(Sender: TObject);
    procedure GLSL_Shader_Screen0ButtonSelectClick(Sender: TObject);
    procedure GLSL_Shader_Screen1ButtonSelectClick(Sender: TObject);
    procedure GLSL_Shader_Screen2ButtonSelectClick(Sender: TObject);
    procedure GLSL_Shader_Screen3ButtonSelectClick(Sender: TObject);
    procedure GLSL_Shader_Screen4ButtonSelectClick(Sender: TObject);
    procedure GLSL_Shader_Screen5ButtonSelectClick(Sender: TObject);
    procedure GLSL_Shader_Screen6ButtonSelectClick(Sender: TObject);
    procedure GLSL_Shader_Screen7ButtonSelectClick(Sender: TObject);
    procedure GLSL_Shader_Screen8ButtonSelectClick(Sender: TObject);
    procedure GLSL_Shader_Screen9ButtonSelectClick(Sender: TObject);
    procedure AudioLatencyButtonResetClick(Sender: TObject);
    procedure WatchdogKeyPress(Sender: TObject; var Key: Char);
    procedure SnapSizeHeightKeyPress(Sender: TObject; var Key: Char);
    procedure SDL2MouseMapping1Select(Sender: TObject);
    procedure SDL2MouseMapping2Select(Sender: TObject);
    procedure SDL2MouseMapping3Select(Sender: TObject);
    procedure SDL2MouseMapping4Select(Sender: TObject);
    procedure SDL2MouseMapping5Select(Sender: TObject);
    procedure SDL2MouseMapping6Select(Sender: TObject);
    procedure SDL2MouseMapping7Select(Sender: TObject);
    procedure SDL2MouseMapping8Select(Sender: TObject);
    procedure SDL2KeyboardMapping1Select(Sender: TObject);
    procedure SDL2KeyboardMapping2Select(Sender: TObject);
    procedure SDL2KeyboardMapping3Select(Sender: TObject);
    procedure SDL2KeyboardMapping4Select(Sender: TObject);
    procedure SDL2KeyboardMapping5Select(Sender: TObject);
    procedure SDL2KeyboardMapping6Select(Sender: TObject);
    procedure SDL2KeyboardMapping7Select(Sender: TObject);
    procedure SDL2KeyboardMapping8Select(Sender: TObject);
    procedure SDLLightgunMapping1Select(Sender: TObject);
    procedure SDLLightgunMapping2Select(Sender: TObject);
    procedure SDLLightgunMapping3Select(Sender: TObject);
    procedure SDLLightgunMapping4Select(Sender: TObject);
    procedure SDLLightgunMapping5Select(Sender: TObject);
    procedure SDLLightgunMapping6Select(Sender: TObject);
    procedure SDLLightgunMapping7Select(Sender: TObject);
    procedure SDLLightgunMapping8Select(Sender: TObject);
    procedure SDLAlternativeLibGLToUseSelect(Sender: TObject);
    procedure SDLAlternativeLibGLToUseCustomButtonSelectClick(Sender: TObject);
    procedure SDLKeymapFilenameButtonSelectClick(Sender: TObject);
    procedure SDLKeymapFilenameButtonResetClick(Sender: TObject);
    procedure SnapNameButtonDefaultClick(Sender: TObject);
    procedure SaveStateNameButtonResetClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    function BiosSetsListViewItemCompare(Sender: TCustomEasyListview;
      Column: TEasyColumn; Group: TEasyGroup; Item1, Item2: TEasyItem;
      var DoDefault: Boolean): Integer;
    procedure ButtonResetToDefaultClick(Sender: TObject);
    procedure ButtonReadFileHelpClick(Sender: TObject);
    procedure FolderFontFilesButtonSelectClick(Sender: TObject);
    procedure FolderControllerDefinitionsButtonSelectClick(
      Sender: TObject);
    procedure FolderDebuggerCommentsButtonSelectClick(Sender: TObject);
    procedure SaveValidateAllCustomFilesClick(Sender: TObject);
    procedure ButtonHelpSaveValidateAllCustomFilesClick(Sender: TObject);
    procedure HTTPServerButtonResetClick(Sender: TObject);
    procedure HLSLUpscaleSnapXKeyPress(Sender: TObject; var Key: Char);
    procedure HLSLUpscaleSnapYKeyPress(Sender: TObject; var Key: Char);
    procedure HLSLUpscaleSnapButtonResetClick(Sender: TObject);
    procedure CommLocalHostKeyPress(Sender: TObject; var Key: Char);
    procedure CommLocalPortKeyPress(Sender: TObject; var Key: Char);
    procedure CommLocalHostButtonResetClick(Sender: TObject);
    procedure CommRemoteHostButtonResetClick(Sender: TObject);
    procedure HLSLEnableClick(Sender: TObject);
    procedure EnableGLSLClick(Sender: TObject);
    procedure VectorBeamWidthMinChange(Sender: TObject);
    procedure VectorBeamWidthMaxChange(Sender: TObject);
    procedure VectorBeamIntensityWeightChange(Sender: TObject);
    procedure VideoOutputModeButtonHelpClick(Sender: TObject);
    procedure FolderLanguageFilesButtonSelectClick(Sender: TObject);
    procedure FolderPluginFilesButtonSelectClick(Sender: TObject);
    procedure IntegerScaleFactorHorizontalKeyPress(Sender: TObject;
      var Key: Char);
    procedure IntegerScaleFactorVerticalKeyPress(Sender: TObject;
      var Key: Char);
    procedure BGFXShadowMaskTextureNameButtonResetClick(Sender: TObject);
    procedure BGFXScreenShaderChainsButtonReloadClick(Sender: TObject);
    procedure BGFXScreenShaderChainsButtonSelectClick(Sender: TObject);
    procedure ShadowMaskTextureButtonResetClick(Sender: TObject);
    function BGFXScreenShaderChains_ListViewItemCompare(
      Sender: TCustomEasyListview; Column: TEasyColumn; Group: TEasyGroup;
      Item1, Item2: TEasyItem; var DoDefault: Boolean): Integer;
    procedure BGFXScreenShaderChains_ListViewItemPaintText(
      Sender: TCustomEasyListview; Item: TEasyItem; Position: Integer;
      ACanvas: TCanvas);
    procedure BGFXScreenShaderChainsDetailsHTMLLabelMouseEnter(Sender: TObject);
    procedure BGFXScreenShaderChainsDetailsHTMLLabelMouseLeave(Sender: TObject);
    procedure BGFXScreenShaderChainsDetailsHTMLLabelClick(Sender: TObject);
    procedure BGFXScreenShaderChains_ListViewButtonSelectClick(
      Sender: TObject);
    procedure BGFXScreenShaderChains_ListViewButtonAddClick(
      Sender: TObject);
    procedure BGFXScreenShaderChains_ListViewDblClick(
      Sender: TCustomEasyListview; Button: TCommonMouseButton;
      MousePos: TPoint; ShiftState: TShiftState; var Handled: Boolean);
    procedure BGFXScreenShaderChainsButtonResetClick(Sender: TObject);
    procedure VectorBeamSmoothChange(Sender: TObject);
    procedure VectorMaximumAttenuationChange(Sender: TObject);
    procedure VectorMinimumLengthAttenuationChange(Sender: TObject);
    procedure PortAudioLatencyKeyPress(Sender: TObject; var Key: Char);
    procedure HTTPPortKeyPress(Sender: TObject; var Key: Char);
    procedure SaveStateRewindBufferSizeChange(Sender: TObject);
    procedure BGFXShadowMaskTextureNameButtonSelectClick(Sender: TObject);
    procedure BGFXPathButtonSelectClick(Sender: TObject);
    procedure BGFXLUTTextureNameButtonResetClick(Sender: TObject);
    procedure BGFXLUTTextureNameButtonSelectClick(Sender: TObject);
    procedure BloomLUTTextureScreenButtonSelectClick(Sender: TObject);
    procedure BloomLUTTextureScreenButtonResetClick(Sender: TObject);
    procedure BloomLUTTextureUIButtonSelectClick(Sender: TObject);
    procedure BloomLUTTextureUIButtonResetClick(Sender: TObject);
    procedure FolderManualsPDFButtonSelectClick(Sender: TObject);
    procedure ButtonPageFoldersClick(Sender: TObject);
    procedure ButtonPageVideoEffectsBGFXClick(Sender: TObject);
    procedure DebuggerPortButtonResetClick(Sender: TObject);
    procedure VectorBeamDotSizeChange(Sender: TObject);
    procedure DebuggerFontButtonResetClick(Sender: TObject);
    procedure DebuggerFontClick(Sender: TObject);
    procedure DebuggerFontSizeChange(Sender: TObject);
    procedure SDLAttachWindowButtonClearClick(Sender: TObject);
    procedure UIModeKeyCustomButtonResetClick(Sender: TObject);
    procedure FolderROMsItemPaintText(Sender: TCustomEasyListview;
      Item: TEasyItem; Position: Integer; ACanvas: TCanvas);
  private
    { Private declarations }
    ScreenDetails: packed array[-1..3] of TScreenInfo;
    IsSDLMAME: Boolean;
    IniCustomList: packed array[1..11] of THashedStringList; // 1 -> debug.ini; 11 -> parent_game.ini
    procedure Disable_MAMEui_Settings;
    function  RemoveQuotes(const DataString: String): String;
    procedure PopulateNumberProcessors;
    procedure LoadBiosList(const SelectBiosName: String);
    procedure EnableSettingsIniMAME;
    procedure PopulateVideoOutputMode;
    procedure PopulateDisplayLanguage;
    procedure PopulateRAMSize;
    procedure RAMSizeDisablePanel(EnableControls: Boolean);

    procedure PopulateLUAPlugins_ListView;
    procedure ReadPluginIni(const CustomPluginString: String = '');
    procedure WritePluginIni;
    procedure PopulateBGFXShaderChains_ListView;

    procedure LoadIniToStringList(FileID: ShortInt; var ListHolder: THashedStringList);
    procedure LoadCustomSettingsFiles;
    procedure LoadCustomFilesArray;
    procedure FixScreenViewNameRead(ScreenIndex: Integer);
    procedure FixScreenViewNameWrite(ScreenIndex: Integer);
    procedure ReadMAMEIniFile(const IniFile: String; EmuDefaultSettings: Boolean = False);
    procedure WriteMAMEIniFile(const customIni: String; CustomGameOption: Boolean);
    procedure SelectGLSLShaderMAME(EditHolder: TEditEx; IsMAMEFile: Boolean = True);
    procedure EnableDisableControls;
    procedure ToggleSDLDeviceMappingCustom(SDLDeviceMapping: TComboBox2Ex; SDLCustomMapping: TEditEx);
    procedure SelectLUTTextureFile(EditHolder: TEditEx);

    procedure Resize4K;
  public
    { Public declarations }
    emuIni,
    GameIni,
    emuFileExec,
    emuVersionStr: String;
    sysID, ActiveFileID: ShortInt;
    iVersion: Integer;
  end;

var
  FormMAMESettings: TFormMAMESettings;

implementation

uses uMain;

{$R *.dfm}

procedure TFormMAMESettings.Resize4K;
var
  iTopValue: Integer;

  function GetTopPos(iPos: Integer): Integer;
  begin
    if iPos = -1 then
       Result:= iTopValue
    else
       Result:= iPos;
  end;

  function MovePagePanel(iPanel: TPanelEx): Boolean;
  begin
    FormMain.Set4KPanelSpecs(iPanel, 0, Panel1_Folders.Top, Panel1_Folders.Width, Panel1_Folders.Height);
    if (iPanel = Panel4_Video3b) or (iPanel = Panel4_Video3c) then
       begin
         iPanel.Height:= iPanel.Height-49;
         iPanel.Top:= 49;
       end;
  end;

  function SetPageButton(iButton, iPrevButton: TSpeedButtonEx; iWidth: Integer; iLeft: Integer = -1): Boolean;
  var
    iPos: Integer;
  begin
    Result:= True;
    if iPrevButton <> nil then
       iPos:= iPrevButton.Left+iPrevButton.Width+2
    else
       iPos:= iLeft;

    FormMain.Set4KButtonSpecs(iButton, iPos, 160, iWidth, 36, 16);
  end;

  function SetBoxFolder(iPanel: TPanelEx; iTitleLabel: TShadowLabel; iPrevPanel: TPanelEx; iEdit: TEditEx; iSelectButton: TBitBtnEx; iColumnIndex: Integer; iTop: Integer = -1): Boolean;
  var
    bLeft, bTop: Integer;
  begin
    Result:= True;
    if iPrevPanel <> nil then
       bTop:= iPrevPanel.Top+iPrevPanel.Height+25
    else
       bTop:= iTop;

    case iColumnIndex of
      1: bLeft:=   16;
      2: bLeft:=  573;
      3: bLeft:= 1129;
    end;
    //FormMain.Set4KPanelSpecs(iPanel, bLeft, bTop, 532, 93);
    FormMain.Set4KBoxLabel(iPanel, iTitleLabel, bLeft, bTop, 93, 532);

    FormMain.Set4KEditSpecs(iEdit, 10, 45, 430, 36, 16);
    FormMain.Set4KButtonSpecs(iSelectButton, iEdit.Left+iEdit.Width+5, iEdit.Top, 75, 36);
  end;

  function MoveCheckBox(iCheckBox: TAdvOfficeCheckBoxEx; iTop: Integer = -1; iLeft: Integer = 10;  iWidth: Integer = 287): Boolean;
  begin
    Result:= True;
    iTopValue:= GetTopPos(iTop);
    FormMain.Set4KCheckBoxSpecs(iCheckBox, iLeft, iTopValue, iWidth, 36, 16);
    iTopValue:= iTopValue+47;
  end;

  function MoveGaugeBar(iGaugeBar: TGaugeBar;  iLabelTitle: TShadowLabel; iTop: Integer = -1; iLeft: Integer = 10; iWidth: Integer = 287): Boolean; overload;
  var
    iSize: Integer;
  begin
    Result:= True;
    iTopValue:= GetTopPos(iTop);
    if iLabelTitle <> nil then
    begin
      if iLabelTitle.AutoSize then
         iSize:= -1
      else
         iSize:= iWidth;
      FormMain.Set4KLabelSpecs(iLabelTitle, iLeft, iTopValue, iSize, 31, 16);
    end;

    FormMain.Set4KGaugeBarSpecs(iGaugeBar, iLeft, iTopValue+36, iWidth, 36);
    iTopValue:= iTopValue+82;
  end;

  function MoveGaugeBar(iGaugeBar: TGaugeBar2; iLabelTitle: TShadowLabel; iTop: Integer = -1; iLeft: Integer = 10; iWidth: Integer = 287): Boolean; overload;
  var
    iSize: Integer;
  begin
    Result:= True;
    iTopValue:= GetTopPos(iTop);
    if iLabelTitle.AutoSize then
       iSize:= -1
    else
       iSize:= iWidth;
    FormMain.Set4KLabelSpecs(iLabelTitle, iLeft, iTopValue, iSize, 31, 16);
    FormMain.Set4KGaugeBarSpecs(iGaugeBar, iLeft, iTopValue+36, iWidth, 36);
    iTopValue:= iTopValue+82;
  end;

  function MoveEdit(iEdit: TEditEx; iLabelTitle: TShadowLabel; iButton1: TBitBtnEx = nil; iButton2: TBitBtnEx = nil; iTop: Integer = -1; iLeft: Integer = 10; iWidth: Integer = 287): Boolean;
  var
    iSize: Integer;
  begin
    Result:= True;
    iTopValue:= GetTopPos(iTop);
    if iLabelTitle <> nil then
       FormMain.Set4KLabelSpecs(iLabelTitle, iLeft, iTopValue, -1, -1, 16);
    iSize:= iWidth;
    if iButton1 <> nil then
       begin
         iSize:= iSize-70-5;
         if iButton2 <> nil then
            iSize:= iSize-70-3;
       end;
    FormMain.Set4KEditSpecs(iEdit, iLeft, iTopValue+36, iSize, 36, 16);
    if iButton1 <> nil then
       begin
         FormMain.Set4KButtonSpecs(iButton1, iLeft+iSize+5, iTopValue+36, 70, 36, 16);
         if iButton2 <> nil then
            FormMain.Set4KButtonSpecs(iButton2, iButton1.Left+iButton1.Width+3, iTopValue+36, 70, 36, 16);
       end;
    iTopValue:= iTopValue+82;
  end;

  function MoveComboBox(iComboBox: TComboBox2Ex; iLabelTitle: TShadowLabel; iTop: Integer = -1; iLeft: Integer = 10; iWidth: Integer = 287): Boolean;
  begin
    Result:= True;
    iTopValue:= GetTopPos(iTop);
    if iLabelTitle <> nil then
       FormMain.Set4KLabelSpecs(iLabelTitle, iLeft, iTopValue, -1, -1, 16);
    FormMain.Set4KComboBoxSpecs(iComboBox, iLeft, iTopValue+36, iWidth, 16);
    iTopValue:= iTopValue+82;
  end;

  function MoveEditGLSL(iEdit: TEditEx; iLabelTitle: TShadowLabel; iButton: TBitBtnEx; iWidth: Integer = 643): Boolean;
  begin
    Result:= True;
    FormMain.Set4KLabelSpecs(iLabelTitle, 10, iTopValue+2, -1, 1, 16);
    FormMain.Set4KButtonSpecs(iButton, iWidth-10-70, iTopValue, 70, 36, 16);
    FormMain.Set4KEditSpecs(iEdit, 31, iTopValue, iButton.Left-5-31, 36, 16);
    iTopValue:= iTopValue+46;
  end;

  function MoveSDLMapping(iComboBox: TComboBox2Ex; iLabelTitle: TShadowLabel; iEdit: TEditEx; iTop: Integer = -1): Boolean;
  begin
    Result:= True;
    iTopValue:= GetTopPos(iTop);
    FormMain.Set4KLabelSpecs(iLabelTitle, 10, iTopValue+2, -1, -1, 16);
    FormMain.Set4KComboBoxSpecs(iComboBox, 43, iTopValue, 168, 16);
    FormMain.Set4KEditSpecs(iEdit, 221, iTopValue, 299, 36, 16);
    iTopValue:= iTopValue+46;
  end;

begin
  if not Is4KMode then
     Exit;

  with FormMAMESettings do
  begin
    FormMain.Set4KEmuGameTopPanel(TopBar, SystemIcon, GameIcon, LabelGameTitle, 1515, LabelEmulatorVersion, 1245, LabelGameStatus, 1460);
    FormMain.Set4KPanelSpecs(Panel1_Folders, 0, 201, 1677, 1187);

    // move all pages, adjust size/position
    MovePagePanel(Panel2_Video1);
    MovePagePanel(Panel3_Video2);
    MovePagePanel(Panel4_Video3a);
    MovePagePanel(Panel4_Video3b);
    MovePagePanel(Panel4_Video3c);
    MovePagePanel(Panel5_LUA);
    MovePagePanel(Panel6_Input);
    MovePagePanel(Panel7_Miscellaneous);
    MovePagePanel(Panel8_SDL);

    FormMain.Set4KPanelSpecs(PanelBottom, 0, Panel1_Folders.Top+Panel1_Folders.Height, Panel1_Folders.Width, 71);
    FormMain.Set4KButtonsOkCancelPanel(PanelBottom, ButtonOk, ButtonCancel, False, 16);
    FormMain.Set4KButtonSpecs(ButtonReadFile, 16, ButtonOk.Top, 168, 45, 16);
    FormMain.Set4KButtonSpecs(ButtonResetToDefault, ButtonReadFile.Left+ButtonReadFile.Width+10, ButtonOk.Top, 168, 45, 16);
    FormMain.Set4KButtonSpecs(ButtonReadFileHelp, ButtonResetToDefault.Left+ButtonResetToDefault.Width+10, ButtonOk.Top, 45, 45, 16);
    FormMain.Set4KButtonSpecs(ButtonHelpSaveValidateAllCustomFiles, 632, ButtonOk.Top, 45, 45, 16);
    FormMain.Set4KCheckBoxSpecs(SaveValidateAllCustomFiles, 690, 1520, 355, 36, 16);
    FormMain.Set4KCheckBoxFontNameSpecs(SaveValidateAllCustomFiles);

    ClientWidth:=  Panel1_Folders.Width;
    ClientHeight:= PanelBottom.Top+PanelBottom.Height;
    Font.Size:= 16;

    SetPageButton(ButtonPageFolders     , nil                   ,  90, 919);
    SetPageButton(ButtonPageVideo1      , ButtonPageFolders     ,  90);
    SetPageButton(ButtonPageVideo3      , ButtonPageVideo1      ,  90);
    SetPageButton(ButtonPageLUAandAudio , ButtonPageVideo3      , 160);
    SetPageButton(ButtonPageInput       , ButtonPageLUAandAudio ,  75);
    SetPageButton(ButtonPageMisc        , ButtonPageInput       , 155);
    SetPageButton(ButtonPageSDLMAMEInput, ButtonPageMisc        ,  70);

    // ---------------------- Page "Folders" ----------------------

    // Path to ROM Sets and CHD Files
    FormMain.Set4KBoxLabel(FolderROMsGroupBox, FolderROMsGroupBoxLabel, 16, 16, 329, 1089);
    FormMain.Set4KListViewSpecs(FolderROMs, 10, 45, 987, 272, 16);
    FolderROMs.CellSizes.Report.Height:= 32;

    FormMain.Set4KButtonSpecs(FolderROMsButtonUp    , FolderROMsGroupBox.Width-12-75, 45,                     75, 36, 16);
    FormMain.Set4KButtonSpecs(FolderROMsButtonDown  , FolderROMsButtonUp.Left, FolderROMsButtonUp.Top+41,     75, 36, 16);
    FormMain.Set4KButtonSpecs(FolderROMsButtonSelect, FolderROMsButtonUp.Left, 158,                           75, 36, 16);
    FormMain.Set4KButtonSpecs(FolderROMsButtonEdit  , FolderROMsButtonUp.Left, FolderROMsButtonSelect.Top+41, 75, 36, 16);
    FormMain.Set4KButtonSpecs(FolderROMsButtonDelete, FolderROMsButtonUp.Left, FolderROMsButtonEdit.Top+41,   75, 36, 16);
    FormMain.Set4KButtonSpecs(FolderROMsButtonClear , FolderROMsButtonUp.Left, FolderROMsButtonDelete.Top+41, 75, 36, 16);

    // Path to Ini Files
    FormMain.Set4KBoxLabel(FolderIniFilesGroupBox, FolderIniFilesGroupBoxLabel, 16, 370, 211, 532);
    FormMain.Set4KListViewSpecs(FolderIniFiles, 10, 45, 510, 108, 16);
    FolderIniFiles.CellSizes.Report.Height:= 32;

    FormMain.Set4KButtonSpecs(FolderIniFilesButtonUp    , 10,                        FolderIniFilesGroupBox.Height-10-36,     75, 36, 16);
    FormMain.Set4KButtonSpecs(FolderIniFilesButtonDown  , FolderIniFilesButtonUp.Left+80,     FolderIniFilesButtonUp.Top,     75, 36, 16);
    FormMain.Set4KButtonSpecs(FolderIniFilesButtonSelect, 205,                                FolderIniFilesButtonUp.Top,     75, 36, 16);
    FormMain.Set4KButtonSpecs(FolderIniFilesButtonEdit  , FolderIniFilesButtonSelect.Left+80, FolderIniFilesButtonSelect.Top, 75, 36, 16);
    FormMain.Set4KButtonSpecs(FolderIniFilesButtonDelete, FolderIniFilesButtonEdit.Left+80,   FolderIniFilesButtonEdit.Top,   75, 36, 16);
    FormMain.Set4KButtonSpecs(FolderIniFilesButtonClear , FolderIniFilesButtonDelete.Left+80, FolderIniFilesButtonDelete.Top, 75, 36, 16);

    // Path to Artwork Files / Effect Overlay Files
    FormMain.Set4KBoxLabel(FolderArtworksGroupBox, FolderArtworksGroupBoxLabel, 16, 606, 211, 532);
    FormMain.Set4KListViewSpecs(FolderArtworks, 10, 45, 510, 108, 16);
    FolderArtworks.CellSizes.Report.Height:= 32;

    FormMain.Set4KButtonSpecs(FolderArtworksButtonUp    , 10,                        FolderArtworksGroupBox.Height-10-36,     75, 36, 16);
    FormMain.Set4KButtonSpecs(FolderArtworksButtonDown  , FolderArtworksButtonUp.Left+80,     FolderArtworksButtonUp.Top,     75, 36, 16);
    FormMain.Set4KButtonSpecs(FolderArtworksButtonSelect, 205,                                FolderArtworksButtonUp.Top,     75, 36, 16);
    FormMain.Set4KButtonSpecs(FolderArtworksButtonEdit  , FolderArtworksButtonSelect.Left+80, FolderArtworksButtonSelect.Top, 75, 36, 16);
    FormMain.Set4KButtonSpecs(FolderArtworksButtonDelete, FolderArtworksButtonEdit.Left+80,   FolderArtworksButtonEdit.Top,   75, 36, 16);
    FormMain.Set4KButtonSpecs(FolderArtworksButtonClear , FolderArtworksButtonDelete.Left+80, FolderArtworksButtonDelete.Top, 75, 36, 16);

    // Path Audio Sample Sets
    SetBoxFolder(FolderSamplesGroupBox, FolderSamplesGroupBoxLabel, FolderArtworksGroupBox, FolderSamples, FolderSamplesButtonSelect, 1);

    // Path Software Definition Files (Hash)
    SetBoxFolder(FolderHashFilesGroupBox, FolderHashFilesGroupBoxLabel, FolderSamplesGroupBox, FolderHashFiles, FolderHashFilesButtonSelect, 1);

    // Directory to Save CHD Difference Files
    SetBoxFolder(FolderDiffGroupBox, FolderDiffGroupBoxLabel, FolderHashFilesGroupBox, FolderDiff, FolderDiffButtonSelect, 1);

    // column 2
    // Directory to Save Screenshots
    SetBoxFolder(FolderGameSnapshotsGroupBox, FolderGameSnapshotsGroupBoxLabel, FolderROMsGroupBox, FolderGameSnapshots, FolderGameSnapshotsButtonSelect, 2);

    // Path to Plugin Files
    SetBoxFolder(FolderPluginFilesGroupBox, FolderPluginFilesGroupBoxLabel, FolderGameSnapshotsGroupBox, FolderPluginFiles, FolderPluginFilesButtonSelect, 2);

    // Path For LUA Plugins To Store Data (Read/Write)
    SetBoxFolder(FolderHomePathGroupBox, FolderHomePathGroupBoxLabel, FolderPluginFilesGroupBox, FolderHomePath, FolderHomePathButtonSelect, 2);

    // Directory to Save States
    SetBoxFolder(FolderSaveStatesGroupBox, FolderSaveStatesGroupBoxLabel, FolderHomePathGroupBox, FolderSaveStates, FolderSaveStatesButtonSelect, 2);

    // Directory to Save Configurations
    SetBoxFolder(FolderGamesConfigurationsGroupBox, FolderGamesConfigurationsGroupBoxLabel, FolderSaveStatesGroupBox, FolderGamesConfigurations, FolderGamesConfigurationsButtonSelect, 2);

    // Directory to Save NVRAM Contents
    SetBoxFolder(FolderNVRAMGroupBox, FolderNVRAMGroupBoxLabel, FolderGamesConfigurationsGroupBox, FolderNVRAM, FolderNVRAMButtonSelect, 2);

    // Path to Cheat Files
    SetBoxFolder(FolderCheatFilesGroupBox, FolderCheatFilesGroupBoxLabel, FolderNVRAMGroupBox, FolderCheatFiles, FolderCheatFilesButtonSelect, 2);

    // column 3
    // Directory To Share With Emulated Machines
    SetBoxFolder(FolderShareEmulatedMachinesGroupBox, FolderShareEmulatedMachinesGroupBoxLabel, nil, FolderShareEmulatedMachines, FolderShareEmulatedMachinesButtonSelect, 3, 16);

    // Path To Loose Software (Not Listed In Software Lists)
    SetBoxFolder(FolderLooseSoftwareGroupBox, FolderLooseSoftwareGroupBoxLabel, FolderShareEmulatedMachinesGroupBox, FolderLooseSoftware, FolderLooseSoftwareButtonSelect, 3);

    // Path to Controller Definitions
    SetBoxFolder(FolderControllerDefinitionsGroupBox, FolderControllerDefinitionsGroupBoxLabel, FolderLooseSoftwareGroupBox, FolderControllerDefinitions, FolderControllerDefinitionsButtonSelect, 3);

    // Path to UI Translation Files
    SetBoxFolder(FolderLanguageFilesGroupBox, FolderLanguageFilesGroupBoxLabel, FolderControllerDefinitionsGroupBox, FolderLanguageFiles, FolderLanguageFilesButtonSelect, 3);

    // Path to Crosshair Files
    SetBoxFolder(FolderCrosshairFilesGroupBox, FolderCrosshairFilesGroupBoxLabel, FolderLanguageFilesGroupBox, FolderCrosshairFiles, FolderCrosshairFilesButtonSelect, 3);

    // Path to Font Files
    SetBoxFolder(FolderFontFilesGroupBox, FolderFontFilesGroupBoxLabel, FolderCrosshairFilesGroupBox, FolderFontFiles, FolderFontFilesButtonSelect, 3);

    // Directory to Save Input Device Logs
    SetBoxFolder(FolderInputDeviceLogsGroupBox, FolderInputDeviceLogsGroupBoxLabel, FolderFontFilesGroupBox, FolderInputDeviceLogs, FolderInputDeviceLogsButtonSelect, 3);

    // Directory to Save Memory Card Contents
    SetBoxFolder(FolderMemoryCardsGroupBox, FolderMemoryCardsGroupBoxLabel, FolderInputDeviceLogsGroupBox, FolderMemoryCards, FolderMemoryCardsButtonSelect, 3);

    // Directory to Game Manual Files (PDF)
    SetBoxFolder(FolderManualsPDFGroupBox, FolderManualsPDFGroupBoxLabel, FolderMemoryCardsGroupBox, FolderManualsPDF, FolderManualsPDFButtonSelect, 3);

    // Directory to Save Debugger Comments
    SetBoxFolder(FolderDebuggerCommentsGroupBox, FolderDebuggerCommentsGroupBoxLabel, FolderManualsPDFGroupBox, FolderDebuggerComments, FolderDebuggerCommentsButtonSelect, 3);

    // ---------------------- Page "Video" ----------------------

    // Render Options
    FormMain.Set4KBoxLabel(VideoRenderOptionsGroupBox, VideoRenderOptionsGroupBoxLabel, 16, 16, 843, 309);
    MoveCheckBox(WindowMode, 45); // 45 is the initial top value in the box panel
    MoveCheckBox(MaximizeWindow);
    MoveCheckBox(KeepAspectRatio);
    MoveCheckBox(BilinearFilter);
    MoveCheckBox(WaitVerticalSync);
    MoveCheckBox(UnevenStretch);
    MoveCheckBox(UnevenStretchX);
    MoveCheckBox(UnevenStretchY);
    MoveCheckBox(AutoUnevenStretchXY);
    MoveCheckBox(IntegerScaleOverscan);

    FormMain.Set4KEditSpecs(IntegerScaleFactorHorizontal,  80, iTopValue, 70, 36, 16);
    FormMain.Set4KEditSpecs(IntegerScaleFactorVertical,   227, iTopValue, 70, 36, 16);

    FormMain.Set4KLabelSpecs(IntegerScaleFactorHorizontalLabel,  36, iTopValue+2, -1, -1, 16);
    FormMain.Set4KLabelSpecs(IntegerScaleFactorVerticalLabel,   180, iTopValue+2, -1, -1, 16);

    MoveCheckBox(EnableMenuBar, 562);

    MoveComboBox(MonitorProvider, MonitorProviderLabel);
    MoveEdit(AttachWindow, AttachWindowLabel);

    // Screen Options: Game Screen
    FormMain.Set4KBoxLabel(ScreenOptionsGroupBox, ScreenOptionsGroupBoxLabel, 350, 16, 539, 309);
    MoveGaugeBar(Prescale_ScaleScreen, Prescale_ScaleScreenLabel, 45);
    MoveGaugeBar(Brightness,           BrightnessLabel);
    MoveGaugeBar(Contrast,             ContrastLabel);
    MoveGaugeBar(Gamma,                GammaLabel);
    MoveGaugeBar(PauseBrightness,      PauseBrightnessLabel);

    MoveEdit(EffectOverlay, EffectOverlayLabel, EffectOverlayButtonSelect);

    // Screen Rotation Options
    FormMain.Set4KBoxLabel(ScreenRotationGroupBox, ScreenRotationGroupBoxLabel, 350, 580, 279, 309);
    MoveCheckBox(Rotate,     45, 10, 132);
    MoveCheckBox(RotateLeft, -1, 10, 132);
    MoveCheckBox(RotateRight, RotateLeft.Top, 171, 132);
    MoveCheckBox(AutoRotateLeft,          -1,  10, 132);
    MoveCheckBox(AutoRotateRight, AutoRotateLeft.Top, 171, 132);
    MoveCheckBox(FlipX);
    MoveCheckBox(FlipY);

    // Full Screen Options
    FormMain.Set4KBoxLabel(FullScreenGroupBox, FullScreenGroupBoxLabel, 684, 16, 386, 309);
    MoveCheckBox(TripleBuffer, 45);
    MoveCheckBox(SwitchResolution);
    MoveGaugeBar(FullScreenBrightness, FullScreenBrightnessLabel, iTopValue-1);
    MoveGaugeBar(FullScreenContrast,   FullScreenContrastLabel);
    MoveGaugeBar(FullScreenGamma,      FullScreenGammaLabel);

    // Artwork Options
    FormMain.Set4KBoxLabel(ArtworkGroupBox, ArtworkGroupBoxLabel, 1018, 16, 354, 309);
    MoveCheckBox(ArtworkCrop,          45,  10, 100);
    MoveCheckBox(ArtworkOverlays,      -1,  10, 115);
    MoveCheckBox(ArtworkControlPanels, -1,  10, 165);
    MoveCheckBox(ArtworkMarquees,      45, 176, 125);
    MoveCheckBox(ArtworkBackdrops,     -1, 176, 125);
    MoveCheckBox(ArtworkBezels,        -1, 213,  90);

    MoveEdit(FallbackArtwork, FallbackArtworkLabel);
    MoveEdit(OverrideArtwork, OverrideArtworkLabel);

    // Screens Options
    ScreensGroupBox.Parent:= Panel2_Video1;
    FormMain.Set4KBoxLabel(ScreensGroupBox, ScreensGroupBoxLabel, 1352, 16, 371, 309);
    FormMain.Set4KTrackBarSpecs(NumberScreens,   10,  45,  85, 36);
    FormMain.Set4KLabelSpecs(NumberScreensLabel, 11 , 82,  -1, -1, 16);
    FormMain.Set4KComboBoxSpecs(ScreensSelector, 161, 45, 136, 16);
    FormMain.Set4KButtonSpecs(ScreenButtonDefaultSettings, ScreensGroupBox.Width-10-70, 86, 70, 36, 16);
    MoveComboBox(ScreenName, ScreenNameLabel, 123);
    MoveComboBox(ScreenView, ScreenViewLabel, -1, 10, 145);
    MoveComboBox(ScreenAspectRatio, ScreenAspectRatioLabel, ScreenViewLabel.Top,       180, 117);
    MoveComboBox(ScreenResolution,  ScreenResolutionLabel, -1,                          10, 145);
    MoveComboBox(ScreenRefreshRate, ScreenRefreshRateLabel, ScreenResolutionLabel.Top, 180, 117);

    // Snapshots/Movies Options
    SnapshotsGroupBox.Parent:= Panel2_Video1;
    FormMain.Set4KBoxLabel(SnapshotsGroupBox, SnapshotsGroupBoxLabel, 1352, 427, 390, 309);
    MoveEdit(SnapName, SnapNameLabel, SnapNameButtonDefault, nil, 45);
    MoveComboBox(SnapView, SnapViewLabel, -1, 10, 212);
    FormMain.Set4KButtonSpecs(SnapViewButtonDefault, SnapView.Left+SnapView.Width+5, SnapView.Top, 70, 36, 16);
    MoveCheckBox(SnapSizeAuto);
    FormMain.Set4KLabelSpecs(SnapSizeCustomLabel,   36, 257, -1, -1, 16);
    FormMain.Set4KEditSpecs(SnapSizeWidth,         116, 255, 70, 36, 16);
    FormMain.Set4KLabelSpecs(SnapSizeCustomXLabel, 191, 257, -1, -1, 16);
    FormMain.Set4KEditSpecs(SnapSizeHeight,        208, 255, 70, 36, 16);
    MoveCheckBox(SnapBilinear, 301);
    MoveCheckBox(SnapBurnIn);

    // Performance Options
    PerformanceGroupBox.Parent:= Panel2_Video1;
    FormMain.Set4KBoxLabel(PerformanceGroupBox, PerformanceGroupBoxLabel, 684, 427, 432, 643);
    MoveCheckBox(Sleep,        45, 10, 200);
    MoveCheckBox(RefreshSpeed, -1, 10, 200);

    MoveCheckBox(Throttle,      45, 224, 200);
    MoveCheckBox(AutoFrameskip, -1, 224, 200);

    MoveCheckBox(SyncronizeRefreshRate, 45, 438, 200);
    MoveCheckBox(Multithreading,        -1, 438, 200);
    MoveCheckBox(LowLatency,            -1, 438, 200);

    MoveComboBox(NumberProcessors, NumberProcessorsLabel, iTopValue-2,                10, 193);
    MoveComboBox(Frameskip,        FrameskipLabel,        NumberProcessorsLabel.Top, 224, 193);
    MoveComboBox(ThreadPriority,   ThreadPriorityLabel,   NumberProcessorsLabel.Top, 438, 193);

    MoveGaugeBar(Speed,     SpeedLabel,                 -1,  10, 298);
    MoveGaugeBar(Benchmark, BenchmarkLabel, SpeedLabel.Top, 333, 298);

    MoveGaugeBar(SecondsToRun, SecondsToRunLabel, -1, 10, 621);

    // Vector Options
    FormMain.Set4KBoxLabel(VectorGroupBox, VectorGroupBoxLabel, 16, 960, 211, 1645);
    FormMain.Set4KCheckBoxSpecs(Antialias, 290, -1, 115, 36, 16);

    MoveGaugeBar(VectorFlickerEffect,       VectorFlickerEffectLabel,       45,  10, 387);
    MoveGaugeBar(VectorBeamIntensityWeight, VectorBeamIntensityWeightLabel, 45, 422, 387);
    MoveGaugeBar(VectorBeamDotSize,         VectorBeamDotSizeLabel,         45, 834, 799);

    MoveGaugeBar(VectorBeamWidthMin,        VectorBeamWidthMinLabel,        -1,  10, 799);
    MoveGaugeBar(VectorBeamWidthMax,        VectorBeamWidthMaxLabel, VectorBeamWidthMinLabel.Top, 834, 799);

    Panel3_Video2.Visible:= False; // this panel is empty in 4K layout

    // ---------------------- Page "Video 3a" BGFX ----------------------

    FormMain.Set4KButtonSpecs(ButtonPageVideoEffectsBGFX,  32, 11, 325, 36, 16);
    FormMain.Set4KButtonSpecs(ButtonPageVideoEffectsHLSL, 360, 11, 325, 36, 16);
    FormMain.Set4KButtonSpecs(ButtonPageVideoEffectsGLSL, 688, 11, 325, 36, 16);

    FormMain.Set4KLabelSpecs(VideoOutputModeLabel, 1138, 14, -1, -1, 16);
    FormMain.Set4KComboBoxSpecs(VideoOutputMode, 1335, 11, 287, 16);
    FormMain.Set4KButtonSpecs(VideoOutputModeButtonHelp, VideoOutputMode.Left+VideoOutputMode.Width+5, VideoOutputMode.Top, 36, 36, 16);

    FormMain.Set4KBoxLabel(BGFXBackendGroupBox, BGFXBackendGroupBoxLabel, 16, 49+16, 93, 643);
    FormMain.Set4KComboBoxSpecs(BGFXBackend, 10, 45, BGFXBackendGroupBox.Width-22, 16);
    FormMain.Set4KCheckBoxSpecs(BGFXDebug, 370, 49+16, 290, 36, 16);
    BGFXDebug.Caption:= 'Enable Debugging Statistics';

    FormMain.Set4KBoxLabel(BGFXPathGroupBox, BGFXPathGroupBoxLabel, 1018, 49+16, 93, 643);
    MoveEdit(BGFXPath, nil, BGFXPathButtonSelect, nil, 45-36, 10, BGFXPathGroupBox.Width-22);

    FormMain.Set4KBoxLabel(BGFXShadowMaskTextureNameGroupBox, BGFXShadowMaskTextureNameGroupBoxLabel, 16, 49+134, 93, 643);
    MoveEdit(BGFXShadowMaskTextureName, nil, BGFXShadowMaskTextureNameButtonSelect, BGFXShadowMaskTextureNameButtonReset, 45-36, 10, BGFXShadowMaskTextureNameGroupBox.Width-22);

    FormMain.Set4KBoxLabel(BGFXLUTTextureNameGroupBox, BGFXLUTTextureNameGroupBoxLabel, 1018, 49+134, 93, 643);
    MoveEdit(BGFXLUTTextureName, nil, BGFXLUTTextureNameButtonSelect, BGFXLUTTextureNameButtonReset, 45-36, 10, BGFXLUTTextureNameGroupBox.Width-12);

    FormMain.Set4KBoxLabel(BGFXScreenShaderChainsGroupBox, BGFXScreenShaderChainsGroupBoxLabel, 16, 49+252, 870, 1645);
    FormMain.Set4KLabelSpecs(BGFXScreenShaderChainsHelpLabel, 238, 0, -1, -1, 16);
    FormMain.Set4KLabelSpecs(BGFXScreenShaderChainsDetailsHTMLLabel, 1376, 0, -1, -1, 16);

    MoveEdit(BGFXScreenShaderChains, nil, BGFXScreenShaderChainsButtonReload, BGFXScreenShaderChainsButtonReset, 45-36, 10, BGFXScreenShaderChainsGroupBox.Width-22);
    FormMain.Set4KListViewSpecs(BGFXScreenShaderChains_ListView, 10, iTopValue, BGFXScreenShaderChainsGroupBox.Width-22, BGFXScreenShaderChainsGroupBox.Height-10-iTopValue-36-10);
    FormMain.Set4KListViewHeaderFontSizeSpecs(BGFXScreenShaderChains_ListView);

    FormMain.Set4KListViewColumnSizeSpecs(BGFXScreenShaderChains_ListView, 0, 917);
    FormMain.Set4KListViewColumnSizeSpecs(BGFXScreenShaderChains_ListView, 1, 300);
    FormMain.Set4KListViewColumnSizeSpecs(BGFXScreenShaderChains_ListView, 2, 400);
    BGFXScreenShaderChains_ListView.CellSizes.Report.Height:= 32;

    FormMain.Set4KButtonSpecs(BGFXScreenShaderChains_ListViewButtonSelect, 10, BGFXScreenShaderChainsGroupBox.Height-10-36, 110, 36, 16);
    FormMain.Set4KButtonSpecs(BGFXScreenShaderChains_ListViewButtonAdd,
                              BGFXScreenShaderChains_ListViewButtonSelect.Left+BGFXScreenShaderChains_ListViewButtonSelect.Width+3,
                              BGFXScreenShaderChains_ListViewButtonSelect.Top, 70, 36,16);
    FormMain.Set4KButtonSpecs(BGFXScreenShaderChainsButtonSelect, BGFXScreenShaderChainsGroupBox.Width-22-70, BGFXScreenShaderChains_ListViewButtonSelect.Top, 70, 36, 16);

    // ---------------------- Page "Video 3b" HLSL ----------------------

    MoveCheckBox(HLSLEnable, 16, 16, 155);
    MoveCheckBox(HLSLOversampling, -1, 16);
    MoveCheckBox(YIQEnable, HLSLOversampling.Top, 419, 245);

    FormMain.Set4KBoxLabel(HLSLPathGroupBox, HLSLPathGroupBoxLabel, 16, 110, 93, 643);
    MoveEdit(HLSLPath, nil, HLSLPathButtonSelect, nil, 45-36, 10, HLSLPathGroupBox.Width-22);

    FormMain.Set4KBoxLabel(ShadowMaskTextureGroupBox, ShadowMaskTextureGroupBoxLabel, 16, 228, 93, 643);
    MoveEdit(ShadowMaskTexture, nil, ShadowMaskTextureButtonSelect, ShadowMaskTextureButtonReset, 45-36, 10, ShadowMaskTextureGroupBox.Width-22);

    FormMain.Set4KBoxLabel(ShadowMaskTextureGroupBox, ShadowMaskTextureGroupBoxLabel, 16, 228, 93, 643);
    MoveEdit(ShadowMaskTexture, nil, ShadowMaskTextureButtonSelect, nil, 45-36, 10, ShadowMaskTextureGroupBox.Width-22);

    FormMain.Set4KBoxLabel(ShadowMaskTileModeGroupBox, ShadowMaskTileModeGroupBoxLabel, 16, 346, 93, 309);
    MoveComboBox(ShadowMaskTileMode, nil, 45-36);

    FormMain.Set4KBoxLabel(HLSLUpscaleSnapGroupBox, HLSLUpscaleSnapGroupBoxLabel, 350, 346, 93, 309);
    FormMain.Set4KEditSpecs(HLSLUpscaleSnapX,  10, 45, 95, 36, 16);
    FormMain.Set4KEditSpecs(HLSLUpscaleSnapY, 127, 45, 94, 36, 16);
    FormMain.Set4KLabelSpecs(HLSLUpscaleSnapshotXLabel, 110, 47, -1, -1, 16);
    FormMain.Set4KButtonSpecs(HLSLUpscaleSnapButtonReset, HLSLUpscaleSnapGroupBox.Width-12-70, 45, 70, 36, 16);

    FormMain.Set4KBoxLabel(HLSLIniFileGroupBox, HLSLIniFileGroupBoxLabel, 16, 464, 93, 643);
    FormMain.Set4KCheckBoxSpecs(ReadCustomHLSLFile,   16, 46, 115, 36, 16);
    FormMain.Set4KCheckBoxSpecs(WriteCustomHLSLFile, 134, 46, 115, 36, 16);
    MoveEdit(HLSLIniFile, nil, HLSLIniFileButtonReset, nil, 45-36, 257, 374);

    FormMain.Set4KBoxLabel(HLSLBloomPostProcessingGroupBox, HLSLBloomPostProcessingGroupBoxLabel, 1018, 110, 322, 643);
    MoveComboBox(BloomBlendMode, BloomBlendModeLabel, 45);
    MoveCheckBox(BloomLUTEnabled);
    MoveEdit(BloomLUTTextureScreen, nil, BloomLUTTextureScreenButtonSelect, BloomLUTTextureScreenButtonReset, iTopValue-36, 10, HLSLBloomPostProcessingGroupBox.Width-22);
    MoveCheckBox(BloomLOOTUIEnabled, iTopValue, 10, 330);
    MoveEdit(BloomLUTTextureUI, nil, BloomLUTTextureUIButtonSelect, BloomLUTTextureUIButtonReset, iTopValue-36, 10, HLSLBloomPostProcessingGroupBox.Width-22);

    FormMain.Set4KBoxLabel(VectorPostProcessingGroupBox, VectorPostProcessingGroupBoxLabel, 16, 582, 211, 1645);
    MoveGaugeBar(VectorBeamSmooth,         VectorBeamSmoothLabel,         45,  10, 799);
    MoveGaugeBar(VectorMaximumAttenuation, VectorMaximumAttenuationLabel, 45, 834, 799);
    MoveGaugeBar(VectorMinimumLengthAttenuation, VectorMinimumLengthAttenuationLabel, iTopValue, 10, 1623);

    // ---------------------- Page "Video 3c" GLSL ----------------------

    MoveCheckBox(EnableGLSL, 16, 16, 150);
    MoveCheckBox(OpenGLForcePowerTwoTextures, iTopValue,  16, 300);
    MoveCheckBox(EnableOpenGL_VBO,            iTopValue,  16, 145);
    MoveCheckBox(EnableOpenGL_PBO, EnableOpenGL_VBO.Top, 260, 145);

    MoveCheckBox(OpenGLDisableUseGL_ARBTextureRectangle, 16, 1018, 375);
    MoveCheckBox(EnableOpenGLFilterNotFF, iTopValue, 1018, 375);
    FormMain.Set4KLabelSpecs(EnableOpenGLFilterNotFFLabel, EnableOpenGLFilterNotFF.Left+27, EnableOpenGLFilterNotFF.Top+35, -1, -1, 16);

    FormMain.Set4KBoxLabel(GLSL_Shader_MAMEGroupBox, GLSL_Shader_MAMEGroupBoxLabel, 16, 156, 507, 643);
    iTopValue:= 45;
    MoveEditGLSL(GLSL_Shader_MAME0, GLSL_Shader_MAME0Label, GLSL_Shader_MAME0ButtonSelect);
    MoveEditGLSL(GLSL_Shader_MAME1, GLSL_Shader_MAME1Label, GLSL_Shader_MAME1ButtonSelect);
    MoveEditGLSL(GLSL_Shader_MAME2, GLSL_Shader_MAME2Label, GLSL_Shader_MAME2ButtonSelect);
    MoveEditGLSL(GLSL_Shader_MAME3, GLSL_Shader_MAME3Label, GLSL_Shader_MAME3ButtonSelect);
    MoveEditGLSL(GLSL_Shader_MAME4, GLSL_Shader_MAME4Label, GLSL_Shader_MAME4ButtonSelect);
    MoveEditGLSL(GLSL_Shader_MAME5, GLSL_Shader_MAME5Label, GLSL_Shader_MAME5ButtonSelect);
    MoveEditGLSL(GLSL_Shader_MAME6, GLSL_Shader_MAME6Label, GLSL_Shader_MAME6ButtonSelect);
    MoveEditGLSL(GLSL_Shader_MAME7, GLSL_Shader_MAME7Label, GLSL_Shader_MAME7ButtonSelect);
    MoveEditGLSL(GLSL_Shader_MAME8, GLSL_Shader_MAME8Label, GLSL_Shader_MAME8ButtonSelect);
    MoveEditGLSL(GLSL_Shader_MAME9, GLSL_Shader_MAME9Label, GLSL_Shader_MAME9ButtonSelect);

    FormMain.Set4KBoxLabel(GLSL_Shader_ScreenGroupBox, GLSL_Shader_ScreenGroupBoxLabel, 1018, 156, 507, 643);
    iTopValue:= 45;
    MoveEditGLSL(GLSL_Shader_Screen0, GLSL_Shader_Screen0Label, GLSL_Shader_Screen0ButtonSelect);
    MoveEditGLSL(GLSL_Shader_Screen1, GLSL_Shader_Screen1Label, GLSL_Shader_Screen1ButtonSelect);
    MoveEditGLSL(GLSL_Shader_Screen2, GLSL_Shader_Screen2Label, GLSL_Shader_Screen2ButtonSelect);
    MoveEditGLSL(GLSL_Shader_Screen3, GLSL_Shader_Screen3Label, GLSL_Shader_Screen3ButtonSelect);
    MoveEditGLSL(GLSL_Shader_Screen4, GLSL_Shader_Screen4Label, GLSL_Shader_Screen4ButtonSelect);
    MoveEditGLSL(GLSL_Shader_Screen5, GLSL_Shader_Screen5Label, GLSL_Shader_Screen5ButtonSelect);
    MoveEditGLSL(GLSL_Shader_Screen6, GLSL_Shader_Screen6Label, GLSL_Shader_Screen6ButtonSelect);
    MoveEditGLSL(GLSL_Shader_Screen7, GLSL_Shader_Screen7Label, GLSL_Shader_Screen7ButtonSelect);
    MoveEditGLSL(GLSL_Shader_Screen8, GLSL_Shader_Screen8Label, GLSL_Shader_Screen8ButtonSelect);
    MoveEditGLSL(GLSL_Shader_Screen9, GLSL_Shader_Screen9Label, GLSL_Shader_Screen9ButtonSelect);

    // ---------------------- Page "LUA Plugin" and "Audio" Options ----------------------

    FormMain.Set4KBoxLabel(LUAPluginsToEnableGroupBox, LUAPluginsToEnableGroupBoxLabel, 16, 16, 683, 1645);
    FormMain.Set4KCheckBoxSpecs(EnableLUAPluginSupport, 8, -2, 285, 36, 16);
    FormMain.Set4KLabelSpecs(LUAPluginsToEnable2Label, 330, 0, -1, -1, 16);
    FormMain.Set4KListViewSpecs(LUAPluginsToEnable, 10, 45, LUAPluginsToEnableGroupBox.Width-22, LUAPluginsToEnableGroupBox.Height-12-45);
    FormMain.Set4KListViewHeaderFontSizeSpecs(LUAPluginsToEnable);
    FormMain.Set4KListViewCheckBoxHDSpecs(LUAPluginsToEnable);

    FormMain.Set4KListViewColumnSizeSpecs(LUAPluginsToEnable, 0, 687);
    FormMain.Set4KListViewColumnSizeSpecs(LUAPluginsToEnable, 1, 250);
    FormMain.Set4KListViewColumnSizeSpecs(LUAPluginsToEnable, 2, 150);
    FormMain.Set4KListViewColumnSizeSpecs(LUAPluginsToEnable, 3, 530);
    LUAPluginsToEnable.CellSizes.Report.Height:= 32;

    FormMain.Set4KBoxLabel(AutobootGroupBox, AutobootGroupBoxLabel, 16, 724, 129, 1645);
    FormMain.Set4KCheckBoxSpecs(EnableEmulatorLUAConsole, 325, -2, 310, 36, 16);
    MoveEdit(AutobootCommand, AutobootCommandLabel, AutobootCommandButtonClear, nil, 45, 10, 621);
    MoveEdit(AutobootLuaScript, AutobootLuaScriptLabel, AutobootLuaScriptButtonSelect, nil, 45, 1012, 621);
    MoveGaugeBar(AutobootDelay, AutobootDelayLabel, 45, 656, 331);

    FormMain.Set4KBoxLabel(AudioGroupBox, AudioGroupBoxLabel, 16, 878, 293, 643);
    MoveComboBox(SoundOutputMethod, SoundOutputMethodLabel, 45, 10, 298);
    MoveComboBox(SampleRate, SampleRateLabel, -1, 10, 298);
    MoveGaugeBar(Volume, VolumeLabel, -1, 10, 298);

    MoveCheckBox(Samples,            45, 333, 235);
    MoveCheckBox(AudioUseCompressor, 87, 333, 275);
    MoveComboBox(AudioLatency, AudioLatencyLabel, SampleRateLabel.Top, 333, 223);
    FormMain.Set4KButtonSpecs(AudioLatencyButtonReset, AudioGroupBox.Width-12-70, AudioLatency.Top, 70, 36, 16);
    MoveComboBox(SpeakerReport, SpeakerReportLabel, -1, 333, 298);

    FormMain.Set4KBoxLabel(PortAudioSettingsGroupBox, PortAudioSettingsGroupBoxLabel, 1018, 878, 294, 642);
    MoveEdit(PortAudioAPI,     PortAudioAPILabel,     PortAudioAPIButtonClear,     nil, 45, 10, 621);
    MoveEdit(PortAudioDevice,  PortAudioDeviceLabel,  PortAudioDeviceButtonClear,  nil, -1, 10, 621);
    MoveEdit(PortAudioLatency, PortAudioLatencyLabel, PortAudioLatencyButtonReset, nil, -1, 10, 621);

    // ---------------------- Page "Input" Options ----------------------

    MoveCheckBox(Mouse                  , 16,  16);
    MoveCheckBox(MultiMouse             , -1,  16);
    MoveCheckBox(MultiKeyboard          , -1,  16);
    MoveCheckBox(NaturalKeyboard        , -1,  16);
    MoveCheckBox(EnableGlobalInputs     , -1,  16);
    MoveCheckBox(LightGun               , 16, 339);
    MoveCheckBox(DualLightGun           , -1, 339);
    MoveCheckBox(LightGunOffScreenReload, -1, 339);
    MoveCheckBox(SteadyKey              , -1, 339);
    MoveCheckBox(CoinLockout            , -1, 339);

    FormMain.Set4KBoxLabel(JoystickGroupBox, JoystickGroupBoxLabel, 16, 250, 258, 643);
    MoveCheckBox(Joystick, 45);
    MoveCheckBox(JoystickContradictory, 45, 333);
    MoveGaugeBar(JoystickDeadzone,   JoystickDeadzoneLabel,   -1, 10, 621);
    MoveGaugeBar(JoystickSaturation, JoystickSaturationLabel, -1, 10, 621);

    FormMain.Set4KBoxLabel(CoinImpulseGroupBox, CoinImpulseGroupBoxLabel, 16, 532, 93, 309);
    MoveComboBox(CoinImpulse, nil, 45-36, 10);

    FormMain.Set4KBoxLabel(ControllerDefinitionsGroupBox, ControllerDefinitionsGroupBoxLabel, 350, 532, 93, 309);
    MoveComboBox(ControllerDefinitions, nil, 45-36, 10);

    FormMain.Set4KBoxLabel(OSDInputOptionsGroupBox, OSDInputOptionsGroupBoxLabel, 16, 650, 211, 643);
    MoveComboBox(OSDInputKeyboardProvider, OSDInputKeyboardProviderLabel, 45, 10, 298);
    MoveComboBox(OSDInputMouseProvider,    OSDInputMouseProviderLabel,    -1, 10, 298);

    MoveComboBox(OSDInputLightgunProvider, OSDInputLightgunProviderLabel, 45, 333, 298);
    MoveComboBox(OSDInputJoystickProvider, OSDInputJoystickProviderLabel, -1, 333, 298);

    FormMain.Set4KBoxLabel(OSDOutputOptionsGroupBox, OSDOutputOptionsGroupBoxLabel, 16, 886, 129, 309);
    MoveComboBox(OSDOutputProvider, OSDOutputProviderLabel, 45);

    FormMain.Set4KCheckBoxSpecs(RecordInputTimecodeFile, 16, 1026, 315, 36, 16);
    FormMain.Set4KLabelSpecs(RecordInputTimecodeFileLabel, 16+27, 1026+35, -1, -1, 16);

    FormMain.Set4KCheckBoxSpecs(ExitAfterInputPlayback, 352, 1026, 350, 36, 16);
    FormMain.Set4KLabelSpecs(ExitAfterInputPlaybackLabel, 352+27, 1026+35, -1, -1, 16);

    FormMain.Set4KBoxLabel(AnalogSettingsGroupBox, AnalogSettingsGroupBoxLabel, 1018, 16, 373, 643);
    MoveComboBox(Analog_Paddle,     Analog_PaddleLabel,     45, 10, 298);
    MoveComboBox(Analog_Joystick,   Analog_JoystickLabel,   -1, 10, 298);
    MoveComboBox(Analog_Positional, Analog_PositionalLabel, -1, 10, 298);
    MoveComboBox(Analog_Mouse,      Analog_MouseLabel,      -1, 10, 298);

    MoveComboBox(Analog_Pedal,     Analog_PedalLabel,     45, 333, 298);
    MoveComboBox(Analog_Dial,      Analog_DialLabel,      -1, 333, 298);
    MoveComboBox(Analog_LightGun,  Analog_LightGunLabel,  -1, 333, 298);
    MoveComboBox(Analog_Trackball, Analog_TrackballLabel, -1, 333, 298);

    MoveCheckBox(UIMouse, 464, 1018, 375);
    MoveCheckBox(UIActive, -1, 1018, 580);

    FormMain.Set4KBoxLabel(UIModeGroupBox, UIModeGroupBoxLabel, 1018, 557, 156, 643);
    FormMain.Set4KLabelSpecs(UIModeKeyCustomLabel, 10, 45, 422, 61, 16);
    MoveEdit(UIModeKeyCustom, nil, UIModeKeyCustomButtonReset, nil, 110-36, 10, 621);

    FormMain.Set4KBoxLabel(CommOptionsGroupBox, CommOptionsGroupBoxLabel, 1018, 766, 251, 643);
    MoveEdit(CommLocalHost, CommLocalHostLabel, nil, nil, 45, 10, 446);
    MoveEdit(CommLocalPort, CommLocalPortLabel, CommLocalHostButtonReset, nil, 45, 466, 165);

    MoveEdit(CommRemoteHost, CommRemoteHostLabel, nil, nil, -1, 10, 446);
    MoveEdit(CommRemotePort, CommRemotePortLabel, CommRemoteHostButtonReset, nil, CommRemoteHostLabel.Top, 466, 165);
    MoveCheckBox(CommSyncFrame);

    FormMain.Set4KBoxLabel(HTTPServerGroupBox, HTTPServerGroupBoxLabel, 1018, 1042, 129, 643);
    FormMain.Set4KCheckBoxSpecs(HTTPServer, 8, -2, 220, 36, 16);
    MoveEdit(HTTPPath, HTTPPathLabel, nil, nil, 45, 10, 446);
    MoveEdit(HTTPPort, HTTPPortLabel, HTTPServerButtonReset, nil, 45, 466, 165);

    // ---------------------- Page "Miscellaneous" Options ----------------------

    MoveCheckBox(AutoSave, 16, 16, 180);
    MoveCheckBox(EnableSaveStateRewind, 16, 380, 275);

    FormMain.Set4KBoxLabel(SaveStateRewindBufferSizeGroupBox, SaveStateRewindBufferSizeGroupBoxLabel, 16, 62, 93, 977);
    MoveGaugeBar(SaveStateRewindBufferSize, nil, 45-36, 10, SaveStateRewindBufferSizeGroupBox.Width-22);

    MoveCheckBox(ReadConfigFiles     , 164, 16, 200);
    MoveCheckBox(WriteConfigFiles    ,  -1, 16, 200);
    MoveCheckBox(ConfirmQuit         ,  -1, 16, 155);
    MoveCheckBox(SkipMandatoryFileMan,  -1, 16, 350);

    MoveCheckBox(SkipGameInfo        , 165, 380, 185);
    MoveCheckBox(SkipWarnings        ,  -1, 380, 185);
    MoveCheckBox(Cheat               ,  -1, 380, 185);
    MoveCheckBox(SaveNVRAMOnExit     ,  -1, 380, 230);

    FormMain.Set4KBoxLabel(SaveStateNameGroupBox, SaveStateNameGroupBoxLabel, 16, 351, 93, 643);
    MoveEdit(SaveStateName, nil, SaveStateNameButtonReset, nil, 45-36, 10, SaveStateNameGroupBox.Width-22);

    MoveCheckBox(DRC         , 453, 16, 240);
    MoveCheckBox(DRCUseC     ,  -1, 16, 305);
    MoveCheckBox(DRCLogUML   ,  -1, 16, 345);
    MoveCheckBox(DRCLogNative,  -1, 16, 360);

    FormMain.Set4KBoxLabel(RAMSizeGroupBox, RAMSizeGroupBoxLabel, 16, 640, 129, 309);
    MoveComboBox(RAMSize, RAMSizeLabel, 45);

    FormMain.Set4KBoxLabel(UserInterfaceGroupBox, UserInterfaceGroupBoxLabel, 684, 180, 991, 309);
    FormMain.Set4KLabelSpecs(DisplayLanguageLabel, 10, 45, -1, -1, 16);

    FormMain.Set4KListViewSpecs(DisplayLanguageList, 10, 81, UserInterfaceGroupBox.Width-22, 646, 16);
    DisplayLanguageList.CellSizes.Report.Height:= 32;

    MoveComboBox(TypeUserInterface, TypeUserInterfaceLabel, 743);
    MoveComboBox(UIFontProvider,    UIFontProviderLabel);
    MoveEdit(UIFont, UIFontLabel, UIFontButtonSelect);

    FormMain.Set4KBoxLabel(BiosSetsGroupBox, BiosSetsGroupBoxLabel, 1018, 16, 791, 643);
    FormMain.Set4KListViewSpecs(BiosSetsListView, 10, 45, BiosSetsGroupBox.Width-22, BiosSetsGroupBox.Height-63, 16);
    FormMain.Set4KListViewHeaderFontSizeSpecs(BiosSetsListView);
    FormMain.Set4KListViewColumnSizeSpecs(BiosSetsListView, 0, 417);
    FormMain.Set4KListViewColumnSizeSpecs(BiosSetsListView, 1, 200);
    BiosSetsListView.CellSizes.Report.Height:= 32;

    FormMain.Set4KBoxLabel(DebugGroupBox, DebugGroupBoxLabel, 1018, 832, 339, 643);
    MoveCheckBox(DebuggerEnable , -2,   8, 210);
    MoveCheckBox(Verbose        , 45,  10, 110);
    MoveCheckBox(UpdateInPause  , 45, 133, 185);
    MoveCheckBox(DebugLogConsole, 45, 333, 105);
    MoveCheckBox(Log            , 45, 456,  70);
    MoveCheckBox(OSLog          , 45, 539,  99);

    MoveGaugeBar(DebuggerFontSize, DebuggerFontSizeLabel, 91, 10, 223);
    FormMain.Set4KButtonSpecs(DebuggerFontButtonReset, DebuggerFontSize.Left+DebuggerFontSize.Width+5, DebuggerFontSize.Top, 70, 36, 16);
                                                 
    FormMain.Set4KLabelSpecs(DebuggerFont, 10, 179, 223, 66, 9);

    MoveEdit(Watchdog, WatchdogLabel, nil, nil, 91, 333, 100);
    FormMain.Set4KLabelSpecs(WatchdogSecsLabel, 438, 129, -1, -1, 16);

    MoveComboBox(Debugger, DebuggerLabel, -1, 333, 298);

    MoveEdit(DebuggerScript, DebuggerScriptLabel, DebuggerScriptButtonSelect, nil, 255,  10, 446);
    MoveEdit(DebuggerPort,   DebuggerPortLabel,   DebuggerPortButtonReset,    nil, 255, 466, 165);

    // ---------------------- Page "SDL" Options ----------------------

    FormMain.Set4KBoxLabel(SDKKeyboardMappingGroupBox, SDKKeyboardMappingGroupBoxLabel, 16, 16, 129, 532);
    FormMain.Set4KCheckBoxSpecs(SDKKeyboardMapping, 8, -2, 355, 36, 16);
    MoveEdit(SDLKeymapFilename, SDLKeymapFilenameLabel, SDLKeymapFilenameButtonSelect, SDLKeymapFilenameButtonReset, 45, 10, SDKKeyboardMappingGroupBox.Width-22);

    FormMain.Set4KBoxLabel(SDLOutputModeGroupBox, SDLOutputModeGroupBoxLabel, 16, 170, 175, 532);
    MoveCheckBox(SDLCenterHorizontally, 44,  10, 215);
    MoveCheckBox(SDLCenterVertically  , 44, 343, 185);
    MoveComboBox(SDLScaleMode, SDLScaleModeLabel, -1, 10, SDLOutputModeGroupBox.Width-22);

    MoveCheckBox(SDLVideoPerformance      , 361, 16, 310);
    MoveCheckBox(SDLSplitFullScreenMonitors, -1, 16, 400);

    FormMain.Set4KBoxLabel(SDLLowLevelDriverGroupBox, SDLLowLevelDriverGroupBoxLabel, 16, 456, 211, 532);
    MoveComboBox(SDLVideoDriverToUse,   SDLVideoDriverToUseLabel  , 45,  10, 160);
    MoveComboBox(SDL2RenderDriverToUse, SDL2RenderDriverToUseLabel, 45, 185, 160);
    MoveComboBox(SDLAudioDriverToUse,   SDLAudioDriverToUseLabel  , 45, 360, 160);
    MoveComboBox(SDLAlternativeLibGLToUse, SDLAlternativeLibGLToUseLabel, -1, 10, 115);
    MoveEdit(SDLAlternativeLibGLToUseCustom, nil, SDLAlternativeLibGLToUseCustomButtonSelect, nil, SDLAlternativeLibGLToUseLabel.Top, 140, 380);

    FormMain.Set4KBoxLabel(SDLAttachWindowGroupBox, SDLAttachWindowGroupBoxLabel, 16, 692, 93, 532);
    MoveEdit(SDLAttachWindow, nil, SDLAttachWindowButtonClear, nil, 45-36, 10, SDLAttachWindowGroupBox.Width-22);

    FormMain.Set4KBoxLabel(SDL2KeyboardMappingGroupBox, SDL2KeyboardMappingGroupBoxLabel, 573, 16, 415, 532);
    MoveSDLMapping(SDL2KeyboardMapping1, SDL2KeyboardMapping1Label, SDL2KeyboardMapping1Custom, 45);
    MoveSDLMapping(SDL2KeyboardMapping2, SDL2KeyboardMapping2Label, SDL2KeyboardMapping2Custom);
    MoveSDLMapping(SDL2KeyboardMapping3, SDL2KeyboardMapping3Label, SDL2KeyboardMapping3Custom);
    MoveSDLMapping(SDL2KeyboardMapping4, SDL2KeyboardMapping4Label, SDL2KeyboardMapping4Custom);
    MoveSDLMapping(SDL2KeyboardMapping5, SDL2KeyboardMapping5Label, SDL2KeyboardMapping5Custom);
    MoveSDLMapping(SDL2KeyboardMapping6, SDL2KeyboardMapping6Label, SDL2KeyboardMapping6Custom);
    MoveSDLMapping(SDL2KeyboardMapping7, SDL2KeyboardMapping7Label, SDL2KeyboardMapping7Custom);
    MoveSDLMapping(SDL2KeyboardMapping8, SDL2KeyboardMapping8Label, SDL2KeyboardMapping8Custom);

    FormMain.Set4KBoxLabel(SDL2MouseMappingGroupBox, SDL2MouseMappingGroupBoxLabel, 1129, 16, 415, 532);
    MoveSDLMapping(SDL2MouseMapping1, SDL2MouseMapping1Label, SDL2MouseMapping1Custom, 45);
    MoveSDLMapping(SDL2MouseMapping2, SDL2MouseMapping2Label, SDL2MouseMapping2Custom);
    MoveSDLMapping(SDL2MouseMapping3, SDL2MouseMapping3Label, SDL2MouseMapping3Custom);
    MoveSDLMapping(SDL2MouseMapping4, SDL2MouseMapping4Label, SDL2MouseMapping4Custom);
    MoveSDLMapping(SDL2MouseMapping5, SDL2MouseMapping5Label, SDL2MouseMapping5Custom);
    MoveSDLMapping(SDL2MouseMapping6, SDL2MouseMapping6Label, SDL2MouseMapping6Custom);
    MoveSDLMapping(SDL2MouseMapping7, SDL2MouseMapping7Label, SDL2MouseMapping7Custom);
    MoveSDLMapping(SDL2MouseMapping8, SDL2MouseMapping8Label, SDL2MouseMapping8Custom);

    FormMain.Set4KBoxLabel(SDLJoystickMappingGroupBox, SDLJoystickMappingGroupBoxLabel, 573, 456, 415, 532);
    MoveCheckBox(PS3SixaxisControllers, -2, 294, 232);
    MoveSDLMapping(SDLJoystickMapping1, SDLJoystickMapping1Label, SDLJoystickMapping1Custom, 45);
    MoveSDLMapping(SDLJoystickMapping2, SDLJoystickMapping2Label, SDLJoystickMapping2Custom);
    MoveSDLMapping(SDLJoystickMapping3, SDLJoystickMapping3Label, SDLJoystickMapping3Custom);
    MoveSDLMapping(SDLJoystickMapping4, SDLJoystickMapping4Label, SDLJoystickMapping4Custom);
    MoveSDLMapping(SDLJoystickMapping5, SDLJoystickMapping5Label, SDLJoystickMapping5Custom);
    MoveSDLMapping(SDLJoystickMapping6, SDLJoystickMapping6Label, SDLJoystickMapping6Custom);
    MoveSDLMapping(SDLJoystickMapping7, SDLJoystickMapping7Label, SDLJoystickMapping7Custom);
    MoveSDLMapping(SDLJoystickMapping8, SDLJoystickMapping8Label, SDLJoystickMapping8Custom);

    FormMain.Set4KBoxLabel(SDLLightgunMappingGroupBox, SDLLightgunMappingGroupBoxLabel, 1129, 456, 415, 532);
    MoveSDLMapping(SDLLightgunMapping1, SDLLightgunMapping1Label, SDLLightgunMapping1Custom, 45);
    MoveSDLMapping(SDLLightgunMapping2, SDLLightgunMapping2Label, SDLLightgunMapping2Custom);
    MoveSDLMapping(SDLLightgunMapping3, SDLLightgunMapping3Label, SDLLightgunMapping3Custom);
    MoveSDLMapping(SDLLightgunMapping4, SDLLightgunMapping4Label, SDLLightgunMapping4Custom);
    MoveSDLMapping(SDLLightgunMapping5, SDLLightgunMapping5Label, SDLLightgunMapping5Custom);
    MoveSDLMapping(SDLLightgunMapping6, SDLLightgunMapping6Label, SDLLightgunMapping6Custom);
    MoveSDLMapping(SDLLightgunMapping7, SDLLightgunMapping7Label, SDLLightgunMapping7Custom);
    MoveSDLMapping(SDLLightgunMapping8, SDLLightgunMapping8Label, SDLLightgunMapping8Custom);
  end;
end;

function TFormMAMESettings.RemoveQuotes(const DataString: String): String;
begin
  Result:= DataString;
  if DataString = '' then
     begin
       Result:= 'Lucida Console';
       Exit;
     end;
  if Result[1] = '"' then
     Delete(Result, 1, 1);
  if Result[Length(Result)] = '"' then
     Delete(Result, Length(Result), 1);
  if Result = '' then
     Result:= 'Lucida Console';
end;

procedure TFormMAMESettings.PopulateNumberProcessors;
var
  Reg: TRegistry;
  CPUCount, Loop: ShortInt;
  CPUKey: TStringList;
begin
  CPUCount:= 0;
  Reg:= TRegistry.Create;
  try
    Reg.RootKey:= HKEY_LOCAL_MACHINE;
    if Reg.OpenKey('\Hardware\Description\System\CentralProcessor', False) then
       begin
         if Reg.HasSubKeys then
            begin
              CPUKey:= TStringList.Create;
              Reg.GetKeyNames(CPUKey);
              CPUCount:= CPUKey.Count;
              FreeAndNil(CPUKey);
            end;
       end;
  finally
    Reg.Free;
  end;
  NumberProcessors.Items.BeginUpdate;
  NumberProcessors.Items.Clear;
  NumberProcessors.Items.Add('Auto');
  if CPUCount > 0 then
     begin
       for Loop:= 1 to CPUCount do
       begin
         if Loop > 1 then
            NumberProcessors.Items.Add(IntToStr(Loop)+' CPUs')
         else
            NumberProcessors.Items.Add(IntToStr(Loop)+' CPU');
       end;
     end;
  NumberProcessors.Items.EndUpdate;
end;

procedure TFormMAMESettings.EnableSettingsIniMAME;
var
  mameIni: THashedStringList;
  Loop: Integer;
  EntryString: String;
begin
  if not (sysID in [idMAME, idHBMAME]) then
     Exit;
  if not FileExists(emuIni) then
     Exit;

  mameIni:= THashedStringList.Create;
  mameIni.LoadFromFile(emuIni);
  for Loop:=0 to mameIni.Count-1 do
  begin
    EntryString:= XML_GetEntryName(mameIni[Loop]);
    if EntryString <> '' then
    begin
      EntryString:= EntryString+' ';
      if EntryString = 'hlsl_ini_read ' then // for MAME 0.149
         begin
           ReadCustomHLSLFile.Enabled:= True;
           WriteCustomHLSLFile.Enabled:= True;
           HLSLIniFile.Enabled:= True;
         end
      else
      if EntryString =  'sdlvideofps ' then
         IsSDLMAME:= True
      else
      if EntryString =  'gl_glsl ' then
         ButtonPageVideoEffectsGLSL.Enabled:= True
      else
      if EntryString =  'hlsl_enable ' then
         ButtonPageVideoEffectsHLSL.Enabled:= True
      else
      if EntryString =  'bgfx_backend ' then
         ButtonPageVideoEffectsBGFX.Enabled:= True 
      else
      //if EntryString =  'hlsl_prescale_x ' then
      //   begin
      //     LabelHLSLPrescaleOverride.Enabled:= True;
      //     LabelHLSLPrescaleOverrideX.Enabled:= True;
      //     HLSLPrescaleOverrideX.Enabled:= True;
      //     LabelHLSLPrescaleOverrideY.Enabled:= True;
      //     HLSLPrescaleOverrideY.Enabled:= True;
      //   end
      //else
      // # CORE RENDER OPTIONS
      if (EntryString = 'unevenstretch ') or
         (EntryString = 'ues ') then
         UnevenStretch.Enabled:= True
      else
      if (EntryString = 'unevenstretchx ') or
         (EntryString = 'uesx ') then
         UnevenStretchX.Enabled:= True
      else
      if (EntryString = 'unevenstretchy ') or
         (EntryString = 'uesy ') then
         UnevenStretchY.Enabled:= True
      else
      if (EntryString = 'autostretchxy ') or
         (EntryString = 'asxy ') then
         AutoUnevenStretchXY.Enabled:= True
      else
      if (EntryString = 'intoverscan ') or
         (EntryString = 'ios') then
         IntegerScaleOverscan.Enabled:= True
      else
      if (EntryString = 'intscalex ') or
         (EntryString = 'sx ') then
         begin
           IntegerScaleFactorHorizontal.Enabled:= True;
           IntegerScaleFactorHorizontalLabel.Enabled:= True;
         end
      else
      if (EntryString = 'intscaley ') or
         (EntryString = 'sy ') then
         begin
           IntegerScaleFactorVertical.Enabled:= True;
           IntegerScaleFactorVerticalLabel.Enabled:= True;
         end
      else
      if (EntryString = 'use_backdrops ') or
         (EntryString = 'backdrop ') then
         ArtworkBackdrops.Enabled:= True
      else
      if (EntryString = 'use_overlays ') or
         (EntryString = 'overlay ') then
         ArtworkOverlays.Enabled:= True
      else
      if (EntryString = 'use_bezels ') or
         (EntryString = 'bezel ') then
         ArtworkBezels.Enabled:= True
      else
      if (EntryString = 'use_cpanels ') or
         (EntryString = 'cpanel ') then
         ArtworkControlPanels.Enabled:= True
      else
      if (EntryString = 'use_marquees ') or
         (EntryString = 'marquee ') then
         ArtworkMarquees.Enabled:= True
      else
      if EntryString = 'fallback_artwork ' then
         begin
           FallbackArtwork.Enabled:= True;
           FallbackArtworkLabel.Enabled:= True;
         end
      else
      if EntryString = 'override_artwork ' then
         begin
           OverrideArtwork.Enabled:= True;
           OverrideArtworkLabel.Enabled:= True;
         end
      else
      if (EntryString = 'antialias ') or
         (EntryString = 'aa ') then
         Antialias.Enabled:= True
      else
      if EntryString =  'beam ' then
         begin
           VectorBeamWidthMinLabel.Hint:= 'Beam Width [%2.2f]';
           VectorBeamWidthMinLabel.Caption:= 'Beam Width [1.00]';
           VectorBeamWidthMin.Hint:= 'Set vector beam width';
           VectorBeamWidthMaxLabel.Enabled:= False;
           VectorBeamWidthMax.Enabled:= False;
           VectorBeamIntensityWeightLabel.Enabled:= False;
           VectorBeamIntensityWeight.Enabled:= False;
         end
      else
      if EntryString = 'beam_dot_size ' then
         begin
           VectorBeamDotSize.Enabled:= True;
           VectorBeamDotSizeLabel.Enabled:= True;
         end
      else
      if (EntryString = 'vector_beam_smooth ') or
         (EntryString = 'vecsmooth ') then
         VectorPostProcessingGroupBox.Enabled:= True
      else
      if EntryString =  'http ' then
         HTTPServer.Enabled:= True
      else
      if EntryString =  'console ' then
         begin
           EnableEmulatorLUAConsole.Enabled:= True;
           AutobootGroupBox.Enabled:= True; // must enable this panel too
         end
      else
      if (EntryString = 'autoboot_script ') or
         (EntryString = 'script ') then
         AutobootGroupBox.Enabled:= True
      else
      if EntryString =  'plugins ' then
         begin
           LUAPluginsToEnableGroupBox.Enabled:= True;
           LUAPluginsToEnableGroupBoxLabel.Enabled:= True;
           EnableLUAPluginSupport.Enabled:= True;
           LUAPluginsToEnable.Enabled:= True;
           LUAPluginsToEnable2Label.Enabled:= True;
         end
      else
      if (EntryString =  'language ') or
         (EntryString =  'lang ') then
         begin
           DisplayLanguageLabel.Enabled:= True;
           DisplayLanguageList.Enabled:= True;
         end
      else
      if EntryString =  'useallheads ' then
         SDLSplitFullScreenMonitors.Enabled:= True
      else
      if EntryString =  'skip_gameinfo ' then
         SkipGameInfo.Enabled:= True
      else
      if EntryString =  'skip_mandatory_fileman ' then
         SkipMandatoryFileMan.Enabled:= True
      else
      if EntryString =  'uifont ' then
         begin
           UIFont.Enabled:= True;
           UIFontLabel.Enabled:= True;
           UIFontButtonSelect.Enabled:= True;
         end
      else
      if EntryString =  'ui_mouse ' then
         UIMouse.Enabled:= True
      else
      if (EntryString =  'multithreading ') or
         (EntryString =  'mt ') then
         Multithreading.Enabled:= True
      else
      if EntryString = 'keyboardprovider ' then
         OSDInputOptionsGroupBox.Enabled:= True
      else
      if (EntryString = 'lowlatency ') or
         (EntryString = 'lolat ') then
         LowLatency.Enabled:= True
      else
      if EntryString = 'compressor ' then
         AudioUseCompressor.Enabled:= True
      else
      if EntryString = 'speaker_report ' then
         begin
           SpeakerReport.Enabled:= True;
           SpeakerReportLabel.Enabled:= True;
         end
      else
      if (EntryString = 'ramsize ') or
         (EntryString = 'ram ') then
         begin
           RAMSizeDisablePanel(True);
         end
      else

      // SDL only
      if EntryString = 'attach_window ' then
         begin
           SDLAttachWindowGroupBox.Enabled:= True;
           SDLAttachWindow.Enabled:= True;
           SDLAttachWindowButtonClear.Enabled:= True;
         end;
    end;
  end;
  FreeAndNil(mameIni);
end;

procedure TFormMAMESettings.PopulateVideoOutputMode;
begin
  if VideoOutputMode.Items.Count > 0 then
     Exit;

  if not IsSDLMAME then
  begin
    if sysID in [idMAME, idHBMAME] then
       begin
         if PosEx('sdl', LowerCase(emuFileExec)) <> 0 then
            IsSDLMAME:= True;
       end;
  end;

  VideoOutputMode.Items.Add('Auto');
  case IsSDLMAME of
    True:
      begin
        VideoOutputMode.Items.Add('Software');
        VideoOutputMode.Items.Add('OpenGL');
        VideoOutputMode.Items.Add('SDL2 Accel');
        VideoOutputMode.Items.Add('BGFX (cross-platform)');
        VideoOutputMode.Items.Add('None');
        //VideoOutputMode.ItemIndex:= 0;
      end;
    False: // MAME; HBMAME; UME
      begin
        VideoOutputMode.Items.Add('GDI');
        VideoOutputMode.Items.Add('DirectDraw');
        VideoOutputMode.Items.Add('Direct3D');
        VideoOutputMode.Items.Add('OpenGL'); // mame\source\mame\src\osd\windows\video.c -> MAME 0.159 and newer
        VideoOutputMode.Items.Add('BGFX (cross-platform)');
        VideoOutputMode.Items.Add('None');
        //VideoOutputMode.ItemIndex:= 2;
      end;
  end;
  VideoOutputMode.ItemIndex:= 0;
end;

procedure TFormMAMESettings.PopulateDisplayLanguage;
var
  mameIni: THashedStringList;
  Loop: Integer;
  lFullPath, EntryStr: String;
  SearchW: TSearchRecW;

  function AddFolderEntry(const FolderTitle: WideString; InsertDefault: Boolean = False): Boolean;
  var
    Item: TEasyItem;
    FixedTitle: WideString;
    tagPos: Integer;
  begin
    FixedTitle:= FolderTitle;
    tagPos:= Pos('_', FixedTitle);
    if tagPos <> 0 then
    begin
      FixedTitle:= StringReplaceW(FixedTitle, '_', ' (', [rfIgnoreCase]);
      FixedTitle:= FixedTitle+')';
    end;

    case InsertDefault of
      True : Item:= DisplayLanguageList.Items.Insert(0);
      False: Item:= DisplayLanguageList.Items.Add;
    end;
    //Item.ImageIndex:= 8;
    Item.Caption:= FixedTitle;//FolderTitle;
    Item.Bold:= InsertDefault;
    //Item.Captions[1]:= SetName;
  end;

begin
  if not FileExists(emuIni) then
     Exit;

  lFullPath:= '';
  mameIni:= THashedStringList.Create;
  mameIni.LoadFromFile(emuIni);

  for Loop:=0 to mameIni.Count-1 do
  begin
    EntryStr:= Trim(mameIni[Loop]);
    if EntryStr <> '' then
    begin
      if Copy(EntryStr, 1, 13) = 'languagepath ' then
         begin
           lFullPath:= Trim(Copy(EntryStr, 13, Length(EntryStr)));
           Break;
         end;
    end;
  end;
  FreeAndNil(mameIni);
  if lFullPath = '' then
     Exit;

  lFullPath:= FormMain.FullFolderFix(lFullPath, emuFileExec);
  if not DirectoryExists(lFullPath) then
     Exit;

  FormMain.ClearListView(DisplayLanguageList);
  DisplayLanguageList.BeginUpdate;
  DisplayLanguageList.Groups.ReIndexDisable:= True;

  if FindFirstW(lFullPath+'*', $37, SearchW) = 0 then
  begin
    repeat
      // It's a directory?
      if (SearchW.Attr and $10 = $10) and (SearchW.Name <> '.') and (SearchW.Name <> '..') then
         AddFolderEntry(SearchW.Name, (WideLowerCase(SearchW.Name) = 'english'));

     until FindNextW(SearchW) <> 0;
  end;
  FindCloseW(SearchW);
  DisplayLanguageList.Groups.ReIndexDisable:= False;
  DisplayLanguageList.EndUpdate;
  DisplayLanguageList.Selection.InvalidateVisibleSelected(False);
end;

procedure TFormMAMESettings.PopulateRAMSize;
var
  iFile: TMemIniFile;
  iName: String;
  iList: TStrings;
  iLoop: Integer;
begin
  if not RAMSizeGroupBox.Enabled then
     Exit;
  if FormMAMESettings.Tag = 0 then
     begin
       RAMSizeLabel.Enabled:= False;
       RAMSize.Enabled:= False; // there is no RAM size options for emulator settings file, "mame.ini"
       Exit;
     end;
  if not FileExists(FormMain.GetRAMSizeFile(sysID)) then
     begin
       RAMSizeLabel.Enabled:= False;
       RAMSize.Enabled:= False; // file "mame_ramsize.ini" was not found, disable the combo box but leave the edit box enabled
       Exit;
     end;

  iName:= ChangeFileExt(ExtractFileName(GameIni), '');
  iFile:= TMemIniFile.Create(FormMain.GetRAMSizeFile(sysID));
  if iFile.SectionExists(iName) then
     begin
       iList:= TStringList.Create;
       iFile.ReadSection(iName, iList);
       iList.Delete(0);
       RAMSize.Items.BeginUpdate;
       if iList.Count > 0 then
          begin
            iName:= iFile.ReadString(iName, 'default', '');
            RAMSize.Items.Add('Use Default');
            if iName <> '' then
               begin
                 RAMSize.Hint:= iName;
                 RAMSizeGroupBoxLabel.Caption:= 'RAM Size (Default: '+RAMSize.Hint+')';
               end;

            RAMSize.Items.AddStrings(iList);
          end;
       RAMSize.Items.EndUpdate;
       FreeAndNil(iList);
     end
  else
     begin
       RAMSizeLabel.Enabled:= False;
       RAMSize.Enabled:= False; // file "mame_ramsize.ini" was not found, disable the combo box but leave the edit box enabled
     end;

  FreeAndNil(iFile);
end;

procedure TFormMAMESettings.RAMSizeDisablePanel(EnableControls: Boolean);
begin
  RAMSizeGroupBox.Enabled:= EnableControls;
  RAMSizeLabel.Enabled:= EnableControls;
  RAMSize.Enabled:=      EnableControls;
end;

{procedure TFormMAMESettings.PopulateBGFXBackend;
var
  mameIni: THashedStringList;
  lFullPath: String;
  SearchW: TSearchRecW;
begin
  if not FileExists(emuIni) then
     Exit;

  lFullPath:= '';
  mameIni:= THashedStringList.Create;
  mameIni.LoadFromFile(emuIni);

  for Loop:=0 to mameIni.Count-1 do
  begin
    EntryStr:= Trim(mameIni[Loop]);
    if Copy(EntryStr, 1, 10) = 'bgfx_path ' then
       begin
         lFullPath:= Trim(Copy(EntryStr, 10, Length(EntryStr)));
         Break;
       end;
  end;
  FreeAndNil(mameIni);
  if lFullPath = '' then
     Exit;

  lFullPath:= FormMain.FullFolderFix(lFullPath, emuFileExec)+'shaders\';
  //lFullPath:= FullEmuFolderFix(lFullPath, sysID, False, IsAlterMAME); // old, causes crash on a fresh install
  if not DirectoryExists(lFullPath) then
     Exit;

  if FindFirstW(lFullPath+'*', $37, SearchW) = 0 then
  begin
    repeat
      // It's a directory?
      if (SearchW.Attr and $10 = $10) and (SearchW.Name <> '.') and (SearchW.Name <> '..') then
      begin
        //IncludeTrailingPathDelimiter() ????
        pPluginPath:= lFullPath+SearchW.Name+'\';
        if FileExists(pPluginPath+'plugin.json') then
        begin
          PluginFile:= THashedStringList.Create;
          PluginFile.LoadFromFile(pPluginPath+'plugin.json');
          AddPluginEntry:= True;
          for Loop:=0 to PluginFile.Count -1 do
          begin
            EntryStr:= TrimLeft(PluginFile[Loop]);

            begin
              if not GetFieldData(PluginFile[Loop]) then
                 AddPluginEntry:= False;
            end;
          //GetDataStrings;
          end;
          FreeAndNil(PluginFile);
          if AddPluginEntry then
             AddPluginListView;
             // call AddPluginEntry_ListView...........................
             //AddFolderEntry(SearchW.Name, (WideLowerCase(SearchW.Name) = 'english'));
        end;
      end;
    until FindNextW(SearchW) <> 0;
  end;
  FindCloseW(SearchW);
end;}

procedure TFormMAMESettings.PopulateLUAPlugins_ListView;
var
  mameIni, PluginFile: THashedStringList;
  Loop: Integer;
  AddPluginEntry: Boolean;

  lFullPath, pPluginPath, EntryStr: String;
  sName, sVersion, sAuthor: String;
  SearchW: TSearchRecW;
  sTitle: WideString;

  function GetFieldData(const DataLineStr: String): Boolean;
  var
    fNameStr, fValueStr: String;
    fPos1, fPos2: Integer;
  begin
    Result:= True;
    fPos1:= PosEx('"', DataLineStr);
    fPos2:= PosEx('"', DataLineStr, fPos1+1);
    fNameStr:= LowerCase(Copy(DataLineStr, fPos1+1, (fPos2-fPos1)-1));
    if not SameText(fNameStr, 'plugin') then
    begin
      fPos1:= PosEx('"', DataLineStr, fPos2+1);
      fPos2:= PosEx('"', DataLineStr, fPos1+1);
      fValueStr:= Copy(DataLineStr, fPos1+1, (fPos2-fPos1)-1);

      if SameText(fNameStr, 'type') then
         begin
           if not SameText(fValueStr, 'plugin') then
              Result:= False;
         end;
      if fNameStr = 'name' then
         sName:= fValueStr
      else
      if fNameStr = 'description' then
         sTitle:= fValueStr
      else
      if fNameStr = 'version' then
         sVersion:= fValueStr
      else
      if fNameStr = 'author' then
         sAuthor:= fValueStr;
    end;
  end;

  function AddPluginListView: Boolean;
  var
    wStr: WideString;
  begin
    wStr:= Utf8Decode(sTitle);
    if wStr <> '' then
       sTitle:= wStr;

    with LUAPluginsToEnable.Items.Add do
    begin
      Caption:= sTitle;
      Captions[1]:= sName;
      Captions[2]:= sVersion;
      Captions[3]:= sAuthor;
    end;
  end;

begin
  if not FileExists(emuIni) then
     Exit;

  lFullPath:= '';
  mameIni:= THashedStringList.Create;
  mameIni.LoadFromFile(emuIni);

  for Loop:=0 to mameIni.Count-1 do
  begin
    // EntryStr:= XML_GetEntryName(EntryStr);
    EntryStr:= Trim(mameIni[Loop]);
    if EntryStr <> '' then
    begin
      if Copy(EntryStr, 1, 12) = 'pluginspath ' then
         begin
           lFullPath:= Trim(Copy(EntryStr, 12, Length(EntryStr)));
           Break;
         end;
    end;
  end;
  FreeAndNil(mameIni);
  if lFullPath = '' then
     Exit;

  lFullPath:= FormMain.FullFolderFix(lFullPath, emuFileExec);
  if not DirectoryExists(lFullPath) then
     Exit;

  FormMain.ClearListView(LUAPluginsToEnable);
  //FormMain.ClearListView(LUAPluginsToDisable);

  LUAPluginsToEnable.BeginUpdate;
  //LUAPluginsToDisable.BeginUpdate;

  if FindFirstW(lFullPath+'*', $37, SearchW) = 0 then
  begin
    repeat
      // It's a directory?
      if (SearchW.Attr and $10 = $10) and (SearchW.Name <> '.') and (SearchW.Name <> '..') then
      begin
        //IncludeTrailingPathDelimiter() ????
        pPluginPath:= lFullPath+SearchW.Name+'\';
        if FileExists(pPluginPath+'plugin.json') then
        begin
          PluginFile:= THashedStringList.Create;
          PluginFile.LoadFromFile(pPluginPath+'plugin.json');
          AddPluginEntry:= True;
          for Loop:=0 to PluginFile.Count -1 do
          begin
            EntryStr:= TrimLeft(PluginFile[Loop]);
            if EntryStr <> '' then
            begin
              if (EntryStr[1] <> '{') and (EntryStr[1] <> '}') then
              begin
                if not GetFieldData(PluginFile[Loop]) then
                   AddPluginEntry:= False;
              end;
            end;
          //GetDataStrings;
          end;
          FreeAndNil(PluginFile);
          if AddPluginEntry then
             AddPluginListView;
             // call AddPluginEntry_ListView...........................
             //AddFolderEntry(SearchW.Name, (WideLowerCase(SearchW.Name) = 'english'));
        end;
      end;
    until FindNextW(SearchW) <> 0;
  end;
  FindCloseW(SearchW);
  if FormMain.CheckTotal(LUAPluginsToEnable) then
     LUAPluginsToEnable.Sort.SortAll;
  LUAPluginsToEnable.EndUpdate;

  //LUAPluginsToDisable.EndUpdate;
  //DisplayLanguageList.Selection.InvalidateVisibleSelected(False);
end;

procedure TFormMAMESettings.ReadPluginIni(const CustomPluginString: String = '');
var
  pIniFile: THashedStringList;
  Loop: Integer;
  {LineStr, }NameStr, ValueStr: String;
  PluginChecked: Boolean;

  function SetCheckStateListView: Boolean;
  var
    LoopListView: Integer;
  begin
    for LoopListView:=0 to LUAPluginsToEnable.Items.Count-1 do
    begin
      if LUAPluginsToEnable.Items[LoopListView].Captions[1] = NameStr then
         begin
           LUAPluginsToEnable.Items[LoopListView].Checked:= PluginChecked;
           Break;
         end;
    end;
  end;

begin
  if not EnableLUAPluginSupport.Enabled then
     Exit;
  if not FormMain.CheckTotal(LUAPluginsToEnable) then
     Exit;
  if CustomPluginString = '' then
  begin
    // this will only be used for emulator default settings
    NameStr:= FormMain.GetMAMEPluginFile(sysID, emuFileExec);
    //if not FileExists(ExtractFilePath(emuFileExec)+'plugin.ini') then
    if not FileExists(NameStr) then
       Exit;
    LUAPluginsToEnable.BeginUpdate;
    pIniFile:= THashedStringList.Create;
    //pIniFile.LoadFromFile(ExtractFilePath(emuFileExec)+'plugin.ini');
    pIniFile.LoadFromFile(NameStr);
    for Loop:=0 to pIniFile.Count-1 do
    begin
      NameStr:= XML_GetEntryName(pIniFile[Loop]);
      if NameStr <> '' then
      begin
        NameStr:= LowerCase(NameStr);
        ValueStr:= pIniFile[Loop];
        Delete(ValueStr, 1, Length(NameStr));
        ValueStr:= Trim(ValueStr);
        if ValueStr <> '' then
        begin
          PluginChecked:= Boolean(StrToInt(ValueStr));
          SetCheckStateListView;
        end;
      end;
    end;
    LUAPluginsToEnable.EndUpdate;
    FreeAndNil(pIniFile);
  end
  else
  begin
    // this will only be used for custom settings
    LUAPluginsToEnable.BeginUpdate;
    LUAPluginsToEnable.CheckManager.UnCheckAll;
    PluginChecked:= True;
    Loop:= PosEx(',', CustomPluginString);
    if Loop <> 0 then
    begin
      NameStr:= Copy(CustomPluginString, 1, Loop-1);
      SetCheckStateListView;
      repeat
        Loop:= PosEx(',', CustomPluginString, Loop+1);
        if Loop <> 0 then
           begin
             NameStr:= Copy(CustomPluginString, 1, Loop-1);
             SetCheckStateListView;
           end;
      until Loop = 0;
    end
    else
    begin
      // only one plugin listed
      NameStr:= CustomPluginString;
      SetCheckStateListView;
    end;

    LUAPluginsToEnable.EndUpdate;
  end;
end;

procedure TFormMAMESettings.WritePluginIni;
var
  pIniFile: THashedStringList;
  Loop: Integer;
  NameStr: String;
begin
  if not EnableLUAPluginSupport.Enabled then
     Exit;
  if not FormMain.CheckTotal(LUAPluginsToEnable) then
     Exit;

  NameStr:= FormMain.GetMAMEPluginFile(sysID, emuFileExec);
  //DeleteFile(ExtractFilePath(emuFileExec)+'plugin.ini');
  DeleteFile(NameStr);
  pIniFile:= THashedStringList.Create;
  pIniFile.BeginUpdate;
  pIniFile.Add('#');
  pIniFile.Add('# PLUGINS OPTIONS');
  pIniFile.Add('#');

  for Loop:=0 to LUAPluginsToEnable.Items.Count-1 do
      pIniFile.Add(Format('%-25s %s', [LUAPluginsToEnable.Items[Loop].Captions[1], IntToStr(Ord(LUAPluginsToEnable.Items[Loop].Checked))]));

  pIniFile.EndUpdate;
  //pIniFile.SaveToFile(ExtractFilePath(emuFileExec)+'plugin.ini');
  pIniFile.SaveToFile(NameStr);
  FreeAndNil(pIniFile);
end;

procedure TFormMAMESettings.PopulateBGFXShaderChains_ListView;
var
  ChainFile: THashedStringList;
  Loop, iPos: Integer;

  lFullPath, EntryStr: String;
  sName, sAuthor: String;
  wStr, sTitle: WideString;
  SearchW: TSearchRecW;

  function GetFieldData(const DataLineStr: String; StartPos: Integer): String;
  var
    fPos1, fPos2: Integer;
  begin
    Result:= '';
    fPos1:= PosEx('"', DataLineStr, StartPos);
    fPos2:= PosEx('"', DataLineStr, fPos1+1);
    Result:= Copy(DataLineStr, fPos1+1, (fPos2-fPos1)-1);
  end;

  function AddPluginListView: Boolean;
  var
    wStr: WideString;
  begin
    wStr:= Utf8Decode(sTitle);
    if wStr <> '' then
       sTitle:= wStr;

    with BGFXScreenShaderChains_ListView.Items.Add do
    begin
      Caption:= sTitle;
      Captions[1]:= sName;
      Captions[2]:= sAuthor;
    end;
  end;

begin
  if BGFXPath.Text = '' then
     BGFXPath.Text:= 'bgfx';
  lFullPath:= BGFXPath.Text;
  lFullPath:= FormMain.FullFolderFix(lFullPath, emuFileExec)+'chains\';

  if not DirectoryExists(lFullPath) then
     Exit;

  FormMain.ClearListView(BGFXScreenShaderChains_ListView);

  BGFXScreenShaderChains_ListView.BeginUpdate;

  if FindFirstW(lFullPath+'*', $37, SearchW) = 0 then
  begin
    repeat
      // It's a directory?
      if (SearchW.Attr and $10 <> $10) and (SearchW.Name <> '.') and (SearchW.Name <> '..') then
      begin
        //IncludeTrailingPathDelimiter() ????
        if SameText(ExtractFileExt(SearchW.Name), '.json') then
        begin
          sName:= ChangeFileExt(SearchW.Name, '');
          ChainFile:= THashedStringList.Create;
          ChainFile.LoadFromFile(lFullPath+SearchW.Name);

          sTitle:= '';
          sAuthor:= '';
          for Loop:=0 to ChainFile.Count -1 do
          begin
            EntryStr:= TrimLeft(ChainFile[Loop]);
            if EntryStr <> '' then
            begin
              iPos:= PosEx('"name":', EntryStr);
              if iPos <> 0 then
                 sTitle:= GetFieldData(EntryStr, iPos+6)
              else
              begin
                iPos:= PosEx('"author":', EntryStr);
                if iPos <> 0 then
                   sAuthor:= GetFieldData(EntryStr, iPos+8);
              end;
              if (sTitle <> '') and (sAuthor <> '') then
                 Break;
            end;
          end;
          FreeAndNil(ChainFile);
          wStr:= Utf8Decode(sTitle);
          if wStr <> '' then
             sTitle:= wStr;
          AddPluginListView;
             // call AddPluginEntry_ListView...........................
             //AddFolderEntry(SearchW.Name, (WideLowerCase(SearchW.Name) = 'english'));
        end;
      end;
    until FindNextW(SearchW) <> 0;
  end;
  FindCloseW(SearchW);
  if FormMain.CheckTotal(BGFXScreenShaderChains_ListView) then
     BGFXScreenShaderChains_ListView.Sort.SortAll;
  BGFXScreenShaderChains_ListView.EndUpdate;
end;


// for MAME v0.171 and newer... support for a new ui.ini file (some settings moved from mame.ini to this new file...)
// ... damn... :_((
// -#include "ui/moptions.h"
// -
// +#include "options.h"
// see this link
// http://git.redump.net/mame/commit/?id=d0162765cdd23c2cb015118b75c87689a839de40


// from src\frontend\mame\emuopts.h
// command-line options are HIGH priority
// OPTION_PRIORITY_CMDLINE = OPTION_PRIORITY_HIGH,

// INI-based options are NORMAL priority, in increasing order:
// OPTION_PRIORITY_INI = OPTION_PRIORITY_NORMAL,
// OPTION_PRIORITY_MAME_INI,
// OPTION_PRIORITY_DEBUG_INI,
// OPTION_PRIORITY_ORIENTATION_INI,
// OPTION_PRIORITY_SYSTYPE_INI,
// OPTION_PRIORITY_SCREEN_INI,
// OPTION_PRIORITY_SOURCE_INI,
// OPTION_PRIORITY_GPARENT_INI,
// OPTION_PRIORITY_PARENT_INI,
// OPTION_PRIORITY_DRIVER_INI

// load settings from file in the following order

// mame.ini
// debug.ini
// vertical.ini // orientation_ini
// horizont.ini // orientation_ini
// arcade.ini   // systype_ini
// console.ini  // systype_ini
// computer.ini // systype_ini
// othersys.ini // systype_ini ??????
// raster.ini   // vector.ini  // lcd.ini // svg.ini (SVG is for MAME v0.191 and newer)
// source\sourcefile.ini // source_ini
// sourcefile.ini        // source_ini
// biosname.ini   // grandparent_ini
// parentgame.ini // parent_ini (if current game is clone)
// gamename.ini   // driver_ini

procedure TFormMAMESettings.FixScreenViewNameRead(ScreenIndex: Integer);
var
  ViewStr: String;
begin
  ViewStr:= LowerCase(ScreenDetails[ScreenIndex].eScreenView);
  if PosEx('cropped', ViewStr) <> 0 then
     ScreenDetails[ScreenIndex].eScreenView:= 'Cropped'
  else
  if PosEx('stretched', ViewStr) <> 0 then
     ScreenDetails[ScreenIndex].eScreenView:= 'Stretched';
end;

procedure TFormMAMESettings.FixScreenViewNameWrite(ScreenIndex: Integer);
var
  ViewStr: String;
  IndexStr: String;
begin
  ViewStr:= LowerCase(ScreenDetails[ScreenIndex].eScreenView);
  IndexStr:= IntToStr(ScreenIndex);
  if ScreenIndex = -1 then
     IndexStr:= '0';

  if PosEx('cropped', ViewStr) <> 0 then
     ScreenDetails[ScreenIndex].eScreenView:= 'Screen '+IndexStr+' Cropped'
  else
  if PosEx('stretched', ViewStr) <> 0 then
     ScreenDetails[ScreenIndex].eScreenView:= 'Screen '+IndexStr+' Stretched';
end;

procedure TFormMAMESettings.ReadMAMEIniFile(const IniFile: String; EmuDefaultSettings: Boolean = False);
var
  TextLine, Value, EntryString: String;
  MAMEIniFile, ctrlrDefinitionsList: THashedStringList;
  FoldersList: TStringList;
  Loop, Loop2: Integer;
  UI_FileName: String;

  function SetComboBoxItemZero(ComboBoxHolder: TComboBox2Ex): Boolean;
  begin
    Result:= True;
    if ComboBoxHolder.ItemIndex = -1 then
       ComboBoxHolder.ItemIndex:= 0;
  end;

  function SetResolutionOption(nScreenIdx: ShortInt): Boolean;
  var
    Loop, Position: Integer;
    cResolution, cRefreshRate, TempString: String;
  begin
    Result:= True;
    Value:= ExtractMAMEIniValue(TextLine);
    cResolution:= '';
    cRefreshRate:= '';
    case SameText(Value, 'auto') of
      True:
        begin
          cResolution:=  'auto';
          cRefreshRate:= 'auto';
        end;
      False:
        begin
          Position:= PosEx('@', Value);
          if Position <> 0 then
             cRefreshRate:= Copy(Value, Position+1, Length(Value)-Position);
          TempString:= '';
          for Loop:= 1 to Length(Value) do
          begin
            if (Loop = Length(Value)) then
               TempString:= TempString+Value[Loop];
            if (Value[Loop] = '@') or (Loop = Length(Value)) then
               begin
                 cResolution:= TempString;
                 Break;
               end
            else
               TempString:= TempString+Value[Loop];
          end;
        end;
    end;
    if (cResolution = '') or (cResolution = '0x0') then
       cResolution:=  'auto';
    if (cRefreshRate = '') or (cRefreshRate = '0') then
       cRefreshRate:= 'auto';
    ScreenDetails[nScreenIdx].eScreenResolution:= cResolution;
    ScreenDetails[nScreenIdx].eScreenRefreshRate:= cRefreshRate;
  end;

  function SetSnapViewOption(const ViewName: String): ShortInt;
  begin
    if SameText(ViewName, '%g') then
       Result:= 0
    else
    if SameText(ViewName, '%g%i') then
       Result:= 1
    else
    if SameText(ViewName, '%g/%g') then
       Result:= 2
    else
    if SameText(ViewName, '%g/%g%i') then
       Result:= 3
    else
    if SameText(ViewName, '%g/%i') then
       Result:= 4
    else
       Result:= 4;
  end;

  // for future improvement... and to avoid repeting the same code over and over again!
  function GetStringValue: String;
  begin
    Result:= ExtractMAMEIniValue(TextLine);
  end;

  function GetIntegerValue: Integer;
  begin
    Result:= StrToInt(GetStringValue);
  end;

  function GetBooleanValue: Boolean;
  begin
    Result:= Boolean(GetIntegerValue);
  end;

  function GetFloatValue(const StrFormat: String): Extended;
  begin
    Result:= StrToFloat(Format(StrFormat, [StrToFloat(GetStringValue)]));
  end;

  function GetGLSLShaderMAME(EditHolder: TEditEx): Boolean;
  var
    glValue: String;
  begin
    // for SDLMAME
    Result:= True;
    glValue:= GetStringValue;
    if SameText('none', glValue) then
       glValue:= '';
    EditHolder.Text:= glValue;
  end;

  function GetSDLDeviceMapping(ComboBoxHolder: TComboBox2Ex; EditHolder: TEditEx): Boolean;
  var
    devValue: String;
  begin
    // for SDLMAME
    Result:= True;
    devValue:= GetStringValue;
    if SameText('auto', devValue) then
       begin
         ComboBoxHolder.ItemIndex:= 0;
         EditHolder.Enabled:= False;
       end
    else
       begin
         ComboBoxHolder.ItemIndex:= 1;
         EditHolder.Enabled:= True;
         EditHolder.Text:= devValue;
       end;
  end;

begin
   ThousandSeparator:= Char(',');
   DecimalSeparator:= Char('.');

   if SkipWarnings.Enabled then
   begin
     UI_FileName:= ExtractFilePath(IniFile)+'ui.ini';
     if FileExists(UI_FileName) then
        begin
          MAMEIniFile:= THashedStringList.Create;
          MAMEIniFile.LoadFromFile(UI_FileName);
          for Loop:=0 to MAMEIniFile.Count-1 do
          begin
            TextLine:= MAMEIniFile[Loop];
            EntryString:= XML_GetEntryName(TextLine);
            if EntryString = 'skip_warnings ' then
               begin
                 SkipWarnings.Checked:= GetBooleanValue;
                 Break;
               end;
          end;
          FreeAndNil(MAMEIniFile);
        end;
   end;

   if not FileExists(IniFile) then
     Exit;

   MAMEIniFile:= THashedStringList.Create;
   MAMEIniFile.LoadFromFile(IniFile);

   for Loop:=0 to MAMEIniFile.Count -1 do
   begin
     TextLine:= MAMEIniFile[Loop];
     with FormMAMESettings do
     begin
       if (TextLine <> '') and
          ((TextLine <> '') and (TextLine[1] <> '#')) then
          begin
            EntryString:= XML_GetEntryName(TextLine);
            if EntryString <> '' then
               EntryString:= EntryString+' ';
            // # CORE CONFIGURATION OPTIONS
            if (EntryString =  'readconfig ') or
               (EntryString = 'rc ') then
               ReadConfigFiles.Checked:= GetBooleanValue
            else
            if (EntryString =  'writeconfig ') or
               (EntryString = 'wc ') then
               WriteConfigFiles.Checked:= GetBooleanValue
            else
            // # CORE SEARCH PATH OPTIONS
            if (EntryString = 'homepath ') and EmuDefaultSettings then
               FolderHomePath.Text:= GetStringValue
            else
            if ((EntryString = 'rompath ') or
                (EntryString = 'rp ') or
                (EntryString = 'biospath ') or
                (EntryString = 'bp ')) and EmuDefaultSettings then
               FormMain.ExtractROMsFolders(GetStringValue, sysID, FolderROMs)
            else
            if ((EntryString = 'hashpath ') or
                (EntryString = 'hash_directory ') or
                (EntryString = 'hash ')) and EmuDefaultSettings then
               FolderHashFiles.Text:= GetStringValue
            else
            if ((EntryString = 'samplepath ') or
                (EntryString = 'sp ')) and EmuDefaultSettings then
               FolderSamples.Text:= GetStringValue
            else
            if ((EntryString = 'artpath ') or
                (EntryString = 'artwork_directory ')) and EmuDefaultSettings then
               FormMain.ExtractMultiFolders(GetStringValue, sysID, FolderArtworks)
            else
            if ((EntryString = 'ctrlrpath ') or
                (EntryString = 'ctrlr_directory ')) and EmuDefaultSettings then
               begin
                 Value:= GetStringValue;
                 FolderControllerDefinitions.Text:= Value;
                 FormMain.ExtractFolders2MAME(sysID, Value, FoldersList, True, emuFileExec); // add to HashedStringList in RAM with FULL path...
                 if FoldersList.Count > 0 then
                    begin
                      for Loop2:= 0 to FoldersList.Count-1 do
                      begin
                        ctrlrDefinitionsList:= THashedStringList.Create;
                        GenerateControllerDefinitionsFilesList(FoldersList[Loop2], ctrlrDefinitionsList);
                      end;
                      if ctrlrDefinitionsList.Count > 0 then
                         begin
                           Loop2:= ctrlrDefinitionsList.IndexOf('standard');
                           if Loop2 <> -1 then
                              ctrlrDefinitionsList.Delete(Loop2);
                           ControllerDefinitions.Items.AddStrings(ctrlrDefinitionsList);
                         end;
                      FreeAndNil(ctrlrDefinitionsList);
                    end;
                 FreeAndNil(FoldersList);
               end
            else
            if (EntryString = 'inipath ') and EmuDefaultSettings then
               FormMain.ExtractMultiFolders(GetStringValue, sysID, FolderIniFiles)
            else
            if (EntryString = 'fontpath ') and EmuDefaultSettings then
               FolderFontFiles.Text:= GetStringValue
            else
            if (EntryString = 'cheatpath ') and EmuDefaultSettings then
               FolderCheatFiles.Text:= GetStringValue
            else
            if ((EntryString = 'crsshairpath ') or
                (EntryString = 'crosshairpath ')) and EmuDefaultSettings then
               FolderCrosshairFiles.Text:= GetStringValue
            else
            if (EntryString = 'pluginspath ') and EmuDefaultSettings then
               FolderPluginFiles.Text:= GetStringValue
            else
            if (EntryString = 'languagepath ') and EmuDefaultSettings then
               FolderLanguageFiles.Text:= GetStringValue
            else
            if (EntryString = 'swpath ') and EmuDefaultSettings then
               FolderLooseSoftware.Text:= GetStringValue
            else
            // # CORE OUTPUT DIRECTORY OPTIONS
            if (EntryString = 'cfg_directory ') and EmuDefaultSettings then
               FolderGamesConfigurations.Text:= GetStringValue
            else
            if (EntryString = 'nvram_directory ') and EmuDefaultSettings then
               FolderNVRAM.Text:= GetStringValue
            else
            if (EntryString = 'memcard_directory ') and EmuDefaultSettings then
               FolderMemoryCards.Text:= GetStringValue
            else
            if (EntryString = 'input_directory ') and EmuDefaultSettings then
               FolderInputDeviceLogs.Text:= GetStringValue
            else
            if (EntryString = 'state_directory ') and EmuDefaultSettings then
               FolderSaveStates.Text:= GetStringValue
            else
            if (EntryString = 'snapshot_directory ') and EmuDefaultSettings then
               FolderGameSnapshots.Text:= GetStringValue
            else
            if (EntryString = 'diff_directory ') and EmuDefaultSettings then
               FolderDiff.Text:= GetStringValue
            else
            if (EntryString = 'comment_directory ') and EmuDefaultSettings then
               FolderDebuggerComments.Text:= GetStringValue
            else
            if (EntryString = 'share_directory ') and EmuDefaultSettings then
               FolderShareEmulatedMachines.Text:= GetStringValue
            else

            // # CORE STATE/PLAYBACK OPTIONS
            if EntryString = 'autosave ' then
               AutoSave.Checked:= GetBooleanValue
            else
            if EntryString = 'rewind ' then
               EnableSaveStateRewind.Checked:= GetBooleanValue
            else
            if EntryString = 'rewind_capacity ' then
               begin
                 Value:= GetStringValue;
                 if Value = '' then
                    Value:= '100';
                 Loop2:= StrToInt(Value);
                 if Loop2 < 1 then
                    Loop2:= 1
                 else
                 if Loop2 > 2048 then
                    Loop2:= 2048;
                 SaveStateRewindBufferSize.Position:= Loop2;
               end
            else
            if EntryString = 'record_timecode ' then
               RecordInputTimecodeFile.Checked:= GetBooleanValue
            else
            if EntryString = 'exit_after_playback ' then
               ExitAfterInputPlayback.Checked:= GetBooleanValue
            else
            if EntryString = 'snapname ' then
               SnapName.Text:= GetStringValue
            else
            if EntryString = 'snapsize ' then
               begin
                 SnapSizeCustomXLabel.Hint:= LowerCase(GetStringValue);
                 SnapSizeAuto.Checked:= SnapSizeCustomXLabel.Hint = 'auto';
                 case SnapSizeAuto.Checked of
                   True:
                     begin
                       SnapSizeWidth.Text:=  '';
                       SnapSizeHeight.Text:= '';
                     end;
                   False:
                     begin
                       Loop2:= PosEx('x', SnapSizeCustomXLabel.Hint);
                       if Loop2 = 0 then
                          SnapSizeAuto.Checked:= True
                       else
                          begin
                            SnapSizeWidth.Text:=  Copy(SnapSizeCustomXLabel.Hint, 1, Loop2-1);
                            SnapSizeHeight.Text:= Copy(SnapSizeCustomXLabel.Hint, Loop2+1, Length(SnapSizeCustomXLabel.Hint));
                          end;
                     end;
                 end;
               end
            else
            if EntryString = 'snapview ' then
               begin
                 Value:= GetStringValue;
                 Loop2:= SnapView.Items.IndexOf(Value);
                 if Loop2 = -1 then
                    Loop2:= 0;
                 SnapView.ItemIndex:= Loop2;
               end
            else
            if EntryString = 'snapbilinear ' then
               SnapBilinear.Checked:= GetBooleanValue
            else
            if EntryString = 'statename ' then
               SaveStateName.Text:= GetStringValue
            else
            if EntryString = 'burnin ' then
               SnapBurnIn.Checked:= GetBooleanValue
            else
            //if EntryString = 'dummywrite ' then // this setting needs a MAME compiled with DEBUG enabled
            //   DummyWriteSnapshot.Checked:= GetBooleanValue
            //else
            // # CORE PERFORMANCE OPTIONS
            if (EntryString = 'autoframeskip ') or
               (EntryString = 'afs ') then
               AutoFrameSkip.Checked:= GetBooleanValue
            else
            if (EntryString = 'frameskip ') or
               (EntryString = 'fs ') then
               FrameSkip.ItemIndex:= GetIntegerValue
            else
            if (EntryString = 'seconds_to_run ') or
               (EntryString = 'str ') then
               SecondsToRun.Position:= GetIntegerValue
            else
            if EntryString = 'throttle ' then
               Throttle.Checked:= GetBooleanValue
            else
            if EntryString = 'sleep ' then
               Sleep.Checked:= GetBooleanValue
            else
            if EntryString = 'speed ' then
               Speed.Position:= GetFloatValue('%3.2f') // StrToFloat(Format('%3.2f', [GetFloatValue]))
            else
            if (EntryString = 'refreshspeed ') or
               (EntryString = 'rs ') then
               RefreshSpeed.Checked:= GetBooleanValue
            else
            if (EntryString = 'lowlatency ') or
               (EntryString = 'lolat ') then
               LowLatency.Checked:= GetBooleanValue
            else
            // # CORE RENDER OPTIONS
            if (EntryString = 'keepaspect ') or
               (EntryString = 'ka ') then
               KeepAspectRatio.Checked:= GetBooleanValue
            else
            if (EntryString = 'unevenstretch ') or
               (EntryString = 'ues ') then
               UnevenStretch.Checked:= GetBooleanValue
            else
            if (EntryString = 'unevenstretchx ') or
               (EntryString = 'uesx ') then
               UnevenStretchX.Checked:= GetBooleanValue
            else
            if (EntryString = 'unevenstretchy ') or
               (EntryString = 'uesy ') then
               UnevenStretchY.Checked:= GetBooleanValue
            else
            if (EntryString = 'autostretchxy ') or
               (EntryString = 'asxy ') then
               AutoUnevenStretchXY.Checked:= GetBooleanValue
            else
            if (EntryString = 'intoverscan ') or
               (EntryString = 'ios') then
               IntegerScaleOverscan.Checked:= GetBooleanValue
            else
            if (EntryString = 'intscalex ') or
               (EntryString = 'sx ') then
               begin
                 Value:= GetStringValue;
                 if Value = '' then
                    Value:= '0';
                 IntegerScaleFactorHorizontal.Text:= Value;
               end
            else
            if (EntryString = 'intscaley ') or
               (EntryString = 'sy ') then
               begin
                 Value:= GetStringValue;
                 if Value = '' then
                    Value:= '0';
                 IntegerScaleFactorVertical.Text:= Value;
               end
            else            
            // # CORE ROTATION OPTIONS
            if EntryString = 'rotate ' then
               Rotate.Checked:= GetBooleanValue
            else
            if EntryString = 'ror ' then
               RotateRight.Checked:= GetBooleanValue
            else
            if EntryString = 'rol ' then
               RotateLeft.Checked:= GetBooleanValue
            else
            if EntryString = 'autoror ' then
               AutoRotateRight.Checked:= GetBooleanValue
            else
            if EntryString = 'autorol ' then
               AutoRotateLeft.Checked:= GetBooleanValue
            else
            if EntryString = 'flipx ' then
               FlipX.Checked:= GetBooleanValue
            else
            if EntryString = 'flipy ' then
               FlipY.Checked:= GetBooleanValue
            else
            // # CORE ARTWORK OPTIONS
            if (EntryString = 'artwork_crop ') or
               (EntryString = 'artcrop ') then
               ArtworkCrop.Checked:= GetBooleanValue
            else
            if (EntryString = 'use_backdrops ') or
               (EntryString = 'backdrop ') then
               ArtworkBackdrops.Checked:= GetBooleanValue
            else
            if (EntryString = 'use_overlays ') or
               (EntryString = 'overlay ') then
               ArtworkOverlays.Checked:= GetBooleanValue
            else
            if (EntryString = 'use_bezels ') or
               (EntryString = 'bezel ') then
               ArtworkBezels.Checked:= GetBooleanValue
            else
            if (EntryString = 'use_cpanels ') or
               (EntryString = 'cpanel ') then
               ArtworkControlPanels.Checked:= GetBooleanValue
            else
            if (EntryString = 'use_marquees ') or
               (EntryString = 'marquee ') then
               ArtworkMarquees.Checked:= GetBooleanValue
            else
            if EntryString = 'fallback_artwork ' then
               begin
                 FallbackArtwork.Text:= GetStringValue;
                 //if SameText('default', FallbackArtwork.Text) then
                 //   FallbackArtwork.Text:= '';
               end
            else
            if EntryString = 'override_artwork ' then
               begin
                 OverrideArtwork.Text:= GetStringValue;
                 //if SameText('default', OverrideArtwork.Text) then
                 //   OverrideArtwork.Text:= '';
               end
            else
            // # CORE SCREEN OPTIONS
            if EntryString = 'brightness ' then
               Brightness.Position:= GetFloatValue('%1.2f') // StrToFloat(Format('%1.2f', [StrToFloat(GetStringValue)]))
            else
            if EntryString = 'contrast ' then
               Contrast.Position:= GetFloatValue('%1.2f') //StrToFloat(Format('%1.2f', [StrToFloat(GetStringValue)]))
            else
            if EntryString = 'gamma ' then
               Gamma.Position:= GetFloatValue('%1.2f') //StrToFloat(Format('%1.2f', [StrToFloat(GetStringValue)]))
            else
            if EntryString = 'pause_brightness ' then
               PauseBrightness.Position:= GetFloatValue('%1.2f') //StrToFloat(Format('%1.2f', [StrToFloat(GetStringValue)]))
            else
            if EntryString = 'effect ' then
               begin
                 Value:= GetStringValue;
                 case SameText('none', Value) of
                   True : EffectOverlay.Text:= '';
                   False: EffectOverlay.Text:= Value;
                 end;
               end
            else
            // # CORE VECTOR OPTIONS
            if (EntryString = 'antialias ') or
               (EntryString = 'aa ') then
               Antialias.Checked:= GetBooleanValue
            else
            if EntryString = 'beam ' then
               VectorBeamWidthMin.Position:= GetFloatValue('%2.2f') // StrToFloat(Format('%2.2f', [StrToFloat(GetStringValue)]))
            else
            if EntryString = 'beam_width_min ' then
               VectorBeamWidthMin.Position:= GetFloatValue('%2.2f') // StrToFloat(Format('%2.2f', [StrToFloat(GetStringValue)]))
            else
            if EntryString = 'beam_width_max ' then
               VectorBeamWidthMax.Position:= GetFloatValue('%2.2f') // StrToFloat(Format('%2.2f', [StrToFloat(GetStringValue)]))
            else
            if EntryString = 'beam_dot_size ' then
               VectorBeamDotSize.Position:= GetFloatValue('%2.2f')
            else
            if EntryString = 'beam_intensity_weight ' then
               VectorBeamIntensityWeight.Position:= GetFloatValue('%1.2f') // StrToFloat(Format('%2.2f', [StrToFloat(GetStringValue)]))
            else
            if EntryString = 'flicker ' then
               VectorFlickerEffect.Position:= GetFloatValue('%3.2f') //StrToFloat(Format('%3.2f', [StrToFloat(GetStringValue)]))
            else
            // # CORE SOUND OPTIONS
            if EntryString = 'sound ' then
               begin
                 Value:= GetStringValue;
                 SoundOutputMethod.Tag:= Ord((Value = '0') or (Value = '1'));
                 if SoundOutputMethod.Tag = 0 then
                    begin
                      if Value = 'auto' then
                         SoundOutputMethod.ItemIndex:= 0
                      else
                      if Value = 'dsound' then
                         SoundOutputMethod.ItemIndex:= 1
                      else
                      if Value = 'xaudio2' then
                         SoundOutputMethod.ItemIndex:= 2
                      else
                      if Value = 'sdl' then
                         SoundOutputMethod.ItemIndex:= 3
                      else
                      if Value = 'portaudio' then
                         SoundOutputMethod.ItemIndex:= 4
                      else
                      if Value = 'none' then
                         SoundOutputMethod.ItemIndex:= SoundOutputMethod.Items.Count-1;//2;
                    end
                 else
                    begin
                      // for MAME 0.153 and older
                      if Value = '0' then
                         SoundOutputMethod.ItemIndex:= SoundOutputMethod.Items.Count-1 // none / disabled // 2
                      else
                      if Value = '1' then
                         SoundOutputMethod.ItemIndex:= 0; // auto / enabled
                    end;
                 {if (Value = '0') or (Value = '1') then
                    begin
                      // for MAME 0.153 and older
                      if Value = '0' then
                         SoundOutputMethod.ItemIndex:= 2 // none / disabled
                      else
                      if Value = '1' then
                         SoundOutputMethod.ItemIndex:= 0; // auto / enabled
                    end
                 else
                    begin
                      if Value = 'auto' then
                         SoundOutputMethod.ItemIndex:= 0
                      else
                      if (Value = 'dsound') or (Value = 'sdl') then
                         SoundOutputMethod.ItemIndex:= 1
                      else
                      if Value = 'none' then
                         SoundOutputMethod.ItemIndex:= 2
                    end;}
               end
            else
            if (EntryString = 'samplerate ') or
               (EntryString = 'sr ') then
               begin
                 Value:= GetStringValue;
                 case StrToInt(Value) of
                   11025 : SampleRate.ItemIndex:= 0;
                   22050 : SampleRate.ItemIndex:= 1;
                   44100 : SampleRate.ItemIndex:= 2;
                   48000 : SampleRate.ItemIndex:= 3;
                   96000 : SampleRate.ItemIndex:= 4;
                   192000: SampleRate.ItemIndex:= 5;
                   else    SampleRate.ItemIndex:= 3;
                 end;
               end
            else
            // PortAudio settings
            if EntryString = 'pa_api ' then
               begin
                 Value:= GetStringValue;
                 if SameText(Value, 'none') then
                    Value:= '';
                 PortAudioAPI.Text:= Value;
               end
            else
            if EntryString = 'pa_device ' then
               begin
                 Value:= GetStringValue;
                 if SameText(Value, 'none') then
                    Value:= '';
                 PortAudioDevice.Text:= Value;
               end
            else
            if EntryString = 'pa_latency ' then
               begin
                 PortAudioLatency.Text:= GetStringValue;
               end
            else
            if EntryString = 'samples ' then
               Samples.Checked:= GetBooleanValue
            else
            if EntryString = 'compressor ' then
               AudioUseCompressor.Checked:= GetBooleanValue
            else
            if (EntryString = 'volume ') or
               (EntryString = 'vol ') then
               Volume.Position:= GetIntegerValue
            else
            if EntryString = 'speaker_report ' then
               begin
                 SpeakerReport.ItemIndex:= GetIntegerValue;
                 if SpeakerReport.ItemIndex = -1 then
                    SpeakerReport.ItemIndex:= 0;
               end
            else
            // # CORE INPUT OPTIONS
            if (EntryString = 'coin_lockout ') or
               (EntryString = 'coinlock ') then
               CoinLockout.Checked:= GetBooleanValue
            else
            if EntryString = 'ctrlr ' then
                begin
                  ControllerDefinitions.ItemIndex:= ControllerDefinitions.Items.IndexOf(GetStringValue);
                  SetComboBoxItemZero(ControllerDefinitions);
                end
            else
            if EntryString = 'mouse ' then
               Mouse.Checked:= GetBooleanValue
            else
            if (EntryString = 'joystick ') or
               (EntryString = 'joy ') then
               Joystick.Checked:= GetBooleanValue
            else
            if (EntryString = 'lightgun ') or
               (EntryString = 'gun ') then
               Lightgun.Checked:= GetBooleanValue
            else
            if (EntryString = 'multikeyboard ') or
               (EntryString = 'multikey ') then
               MultiKeyboard.Checked:= GetBooleanValue
            else
            if EntryString = 'multimouse ' then
               MultiMouse.Checked:= GetBooleanValue
            else
            if (EntryString = 'steadykey ') or
               (EntryString = 'steady ') then
               SteadyKey.Checked:= GetBooleanValue
            else
            if EntryString = 'ui_active ' then
               UIActive.Checked:= GetBooleanValue
            else
            if (EntryString = 'offscreen_reload ') or
               (EntryString = 'reload ') then
               LightGunOffScreenReload.Checked:= GetBooleanValue
            else
            //if (EntryString = 'joystick_map ') or
            //   (EntryString = 'joymap ') then
            //   begin
            //     Value:= GetStringValue;
            //     JoystickMap.ItemIndex:= Ord(Boolean(LowerCase(Value) <> 'auto'));
            //     if JoystickMap.ItemIndex = 1 then
            //        JoystickMapCustom.Text:= Value;
            //   end
            //else
            if (EntryString = 'joystick_deadzone ') or
               (EntryString = 'joy_deadzone ') or
               (EntryString = 'jdz ') then
               JoystickDeadzone.Position:= GetFloatValue('%1.2f') // StrToFloat(Format('%1.2f', [StrToFloat(GetStringValue)]))
            else
            if (EntryString = 'joystick_saturation ') or
               (EntryString = 'joy_saturation ') or
               (EntryString = 'jsat ') then
               JoystickSaturation.Position:= GetFloatValue('%1.2f') // StrToFloat(Format('%1.2f', [StrToFloat(GetStringValue)]))
            else
            if (EntryString = 'natural ') or
               (EntryString = 'nat ') then
               NaturalKeyboard.Checked:= GetBooleanValue
            else
            if EntryString = 'joystick_contradictory ' then
               JoystickContradictory.Checked:= GetBooleanValue
            else
            if EntryString = 'coin_impulse ' then
               CoinImpulse.ItemIndex:= GetIntegerValue+1
            else
            if (((EntryString = 'uimodekey ') or
                 (EntryString = 'umk '))) then
               UIModeKeyCustom.Text:= GetStringValue
            else

            // # OSD OUTPUT OPTIONS
            if EntryString = 'output ' then
               begin
                 Value:= GetStringValue;
                 if Value = 'auto' then
                    OSDOutputProvider.ItemIndex:= 0
                 else
                 if Value = 'console' then
                    OSDOutputProvider.ItemIndex:= 1
                 else
                 if Value = 'network' then
                    OSDOutputProvider.ItemIndex:= 2
                 else
                 if Value = 'windows' then
                    OSDOutputProvider.ItemIndex:= 3
                 else
                 if Value = 'none' then
                    OSDOutputProvider.ItemIndex:= 4
                 else
                    OSDOutputProvider.ItemIndex:= 0; // default to 'auto
               end
            else
            
            // # OSD INPUT OPTIONS
            if EntryString = 'keyboardprovider ' then
               begin
                 Value:= GetStringValue;
                 if Value = 'auto' then
                    OSDInputKeyboardProvider.ItemIndex:= 0
                 else
                 if Value = 'rawinput' then
                    OSDInputKeyboardProvider.ItemIndex:= 1
                 else
                 if Value = 'dinput' then
                    OSDInputKeyboardProvider.ItemIndex:= 2
                 else
                 if Value = 'win32' then
                    OSDInputKeyboardProvider.ItemIndex:= 3
                 else
                 if value = 'uwp' then
                    OSDInputKeyboardProvider.ItemIndex:= 4
                 else
                 if value = 'sdl' then
                    OSDInputKeyboardProvider.ItemIndex:= 5
                 else
                 if Value = 'none' then
                    OSDInputKeyboardProvider.ItemIndex:= 6;
               end
            else
            if EntryString = 'mouseprovider ' then
               begin
                 Value:= GetStringValue;
                 if Value = 'auto' then
                    OSDInputMouseProvider.ItemIndex:= 0
                 else
                 if Value = 'rawinput' then
                    OSDInputMouseProvider.ItemIndex:= 1
                 else
                 if Value = 'dinput' then
                    OSDInputMouseProvider.ItemIndex:= 2
                 else
                 if Value = 'win32' then
                    OSDInputMouseProvider.ItemIndex:= 3
                 else
                 if Value = 'sdl' then
                    OSDInputMouseProvider.ItemIndex:= 4
                 else
                 if Value = 'none' then
                    OSDInputMouseProvider.ItemIndex:= 5;
               end
            else
            if EntryString = 'lightgunprovider ' then
               begin
                 Value:= GetStringValue;
                 if Value = 'auto' then
                    OSDInputLightgunProvider.ItemIndex:= 0
                 else
                 if Value = 'win32' then
                    OSDInputLightgunProvider.ItemIndex:= 1
                 else
                 if Value = 'rawinput' then
                    OSDInputLightgunProvider.ItemIndex:= 2
                 else
                 if Value = 'none' then
                    OSDInputLightgunProvider.ItemIndex:= 3;
               end
            else
            if EntryString = 'joystickprovider ' then
               begin
                 Value:= GetStringValue;
                 if Value = 'auto' then
                    OSDInputJoystickProvider.ItemIndex:= 0
                 else
                 if Value = 'dinput' then
                    OSDInputJoystickProvider.ItemIndex:= 1
                 else
                 if Value = 'xinput' then
                    OSDInputJoystickProvider.ItemIndex:= 2
                 else
                 if Value = 'winhybrid' then
                    OSDInputJoystickProvider.ItemIndex:= 3
                 else
                 if Value = 'uwp' then
                    OSDInputJoystickProvider.ItemIndex:= 4
                 else
                 if Value = 'none' then
                    OSDInputJoystickProvider.ItemIndex:= 5;
               end
            else

            // # CORE INPUT AUTOMATIC ENABLE OPTIONS
            if (EntryString = 'paddle_device ') or
               (EntryString = 'paddle ') then
               begin
                 Analog_Paddle.ItemIndex:= Analog_Paddle.Items.IndexOf(GetStringValue);
                 SetComboBoxItemZero(Analog_Paddle);
               end
            else
            if (EntryString = 'adstick_device ') or
               (EntryString = 'adstick ') then
               begin
                 Analog_Joystick.ItemIndex:= Analog_Joystick.Items.IndexOf(GetStringValue);
                 SetComboBoxItemZero(Analog_Joystick);
               end
            else
            if (EntryString = 'pedal_device ') or
               (EntryString = 'pedal ') then
               begin
                 Analog_Pedal.ItemIndex:= Analog_Pedal.Items.IndexOf(GetStringValue);
                 SetComboBoxItemZero(Analog_Pedal);
               end
            else
            if (EntryString = 'dial_device ') or
               (EntryString = 'dial ') then
               begin
                 Analog_Dial.ItemIndex:= Analog_Dial.Items.IndexOf(GetStringValue);
                 SetComboBoxItemZero(Analog_Dial);
               end
            else
            if (EntryString = 'trackball_device ') or
               (EntryString = 'trackball ') then
               begin
                 Analog_Trackball.ItemIndex:= Analog_Trackball.Items.IndexOf(GetStringValue);
                 SetComboBoxItemZero(Analog_Trackball);
               end
            else
            if EntryString = 'lightgun_device ' then
               begin
                 Analog_LightGun.ItemIndex:= Analog_LightGun.Items.IndexOf(GetStringValue);
                 SetComboBoxItemZero(Analog_LightGun);
               end
            else
            if EntryString = 'positional_device ' then
               begin
                 Analog_Positional.ItemIndex:= Analog_Positional.Items.IndexOf(GetStringValue);
                 SetComboBoxItemZero(Analog_Positional);
               end
            else
            if (EntryString = 'mouse_device ') then
               begin
                 Analog_Mouse.ItemIndex:= Analog_Mouse.Items.IndexOf(GetStringValue);
                 SetComboBoxItemZero(Analog_Mouse);
               end
            else
            // # CORE DEBUGGING OPTIONS
            if EntryString = 'log ' then
               Log.Checked:= GetBooleanValue
            else
            if (EntryString = 'verbose ') or
               (EntryString = 'v ') then
               Verbose.Checked:= GetBooleanValue
            else
            if EntryString = 'update_in_pause ' then
               UpdateInPause.Checked:= GetBooleanValue
            else
            if (EntryString = 'debug ') or
               (EntryString = 'd ') then
               DebuggerEnable.Checked:= GetBooleanValue
            else
            if EntryString = 'debugscript ' then
               DebuggerScript.Text:= GetStringValue
            else
            if EntryString = 'debuglog ' then
               DebugLogConsole.Checked:= GetBooleanValue
            else
            if EntryString = 'debugger ' then // for MAME 0.153ex5 and newer
               begin
                 Value:= LowerCase(GetStringValue);
                 //Debugger.Tag:= Ord((Value = '0') or (Value = '1'));
                 //Auto
                 //Internal
                 //Window
                 //None
                 if Value = 'auto' then
                    Debugger.ItemIndex:= 0
                 else
                 if Value = 'internal' then
                    Debugger.ItemIndex:= 1
                 else
                 if (Value = 'windows') or (Value = 'qt') then
                    Debugger.ItemIndex:= 2
                 else
                 if Value = 'none' then
                    Debugger.ItemIndex:= 3
                 else
                    Debugger.ItemIndex:= 0; // set it default to "auto" if option is unknown (March 17, 2016)
                    //FormMain.ShowMessageBox('OOPS', 'Debugger option unknown.', 'This setting is not supported by the frontend. Please notify the author:'+
                    //                        #13#10+#13#10+'entry: debugger'+#13#10+'value: '+Value, 2);
               end
            else
            if (EntryString = 'debug_internal ') or // MAME 0.153 and lower
               (EntryString = 'di ') then // MAME 0.153 and lower
               begin
                 Value:= GetStringValue;
                 // MAME 0.153 and lower and older HBMAME
                 if Value = '0' then // disabled
                    Debugger.ItemIndex:= 3
                 else
                 if Value = '1' then // internal
                    Debugger.ItemIndex:= 1;
               end
            else
            if EntryString = 'debugger_port ' then
               DebuggerPort.Text:= GetStringValue
            else
            if (EntryString = 'debugger_font ') or
               (EntryString = 'dfont ') then
               begin
                 Value:= GetStringValue;
                 if Value = 'auto' then
                    Value:= 'Lucida Console';

                 DebuggerFont.Font.Name:= Value;
                 DebuggerFont.Hint:= Value;
                 if Value = 'Lucida Console' then
                    DebuggerFont.Hint:= DebuggerFont.Hint+#13#10+'[Auto]';
               end
            else
            if (EntryString = 'debugger_font_size ') or
               (EntryString = 'dfontsize ') then
               begin
                 Value:= GetStringValue;
                 if Value = '' then
                    Value:= '0';
                 DebuggerFontSize.Position:= StrToInt(Value);
               end
            else
            if EntryString = 'comm_localhost ' then
               CommLocalHost.Text:= GetStringValue
            else
            if EntryString = 'comm_localport ' then
               CommLocalPort.Text:= GetStringValue
            else
            if EntryString = 'comm_remotehost ' then
               CommRemoteHost.Text:= GetStringValue
            else
            if EntryString = 'comm_remoteport ' then
               CommRemotePort.Text:= GetStringValue
            else
            if EntryString = 'comm_framesync ' then
               CommSyncFrame.Checked:= GetBooleanValue
            else
            // # CORE MISC OPTIONS
            if EntryString = 'drc ' then
               DRC.Checked:= GetBooleanValue
            else
            if EntryString = 'drc_use_c ' then
               DRCUseC.Checked:= GetBooleanValue
            else
            if EntryString = 'drc_log_uml ' then
               DRCLogUML.Checked:= GetBooleanValue
            else
            if EntryString = 'drc_log_native ' then
               DRCLogNative.Checked:= GetBooleanValue
            else
            if EntryString = 'bios ' then
               begin
                 // select correct bios
                 if FormMain.CheckTotal(BiosSetsListView) then
                    begin
                      BiosSetsListView.Hint:= GetStringValue;
                      FormMain.ELV_SelectItem(BiosSetsListView, 0, BiosSetsListView.Hint, 1);
                    end;
               end
            else
            if (EntryString = 'cheat ') or
               (EntryString = 'c ') then
               Cheat.Checked:= GetBooleanValue
            else
            if EntryString = 'ui ' then
               begin
                 Value:= GetStringValue;
                 if Value = 'cabinet' then
                    TypeUserInterface.ItemIndex:= 1
                 else
                    TypeUserInterface.ItemIndex:= 0;
               end
            else
            if EntryString = 'skip_gameinfo ' then
               SkipGameInfo.Checked:= GetBooleanValue
            else
            if EntryString =  'skip_mandatory_fileman ' then
               SkipMandatoryFileMan.Checked:= GetBooleanValue
            else
            if EntryString = 'uifont ' then
               UIFont.Text:= GetStringValue
            else
            if (EntryString = 'ramsize ') or
               (EntryString = 'ram ') then
               begin
                 Value:= GetStringValue;
                 if Value = '' then
                    RAMSize.ItemIndex:= 0
                 else
                    begin
                      RAMSize.ItemIndex:= RAMSize.Items.IndexOf(Value);
                      if RAMSize.ItemIndex = -1 then
                         RAMSize.ItemIndex:= 0;
                    end;
               end
            else
            if EntryString = 'confirm_quit ' then
               ConfirmQuit.Checked:= GetBooleanValue
            else
            if EntryString = 'ui_mouse ' then
               UIMouse.Checked:= GetBooleanValue
            else
            if (EntryString = 'autoboot_command ') or
               (EntryString = 'ab ') then
               AutobootCommand.Text:= GetStringValue
            else
            if EntryString = 'autoboot_delay ' then
               begin
                 Value:= GetStringValue;
                 if StrToInt(Value) < 181 then
                    AutobootDelay.Position:= StrToInt(Value)
                 else
                    FormMain.ShowMessageBox('Error', 'Read emulator settings',
                                    '    The auto-boot delay is higher than 180 seconds (3 minutes). This value is not supported.'+#13#10+
                                    ' Please contact the author so this can be changed. Thank you.', 2);
               end
            else
            if (EntryString = 'autoboot_script ') or
               (EntryString = 'script ') then
               AutobootLuaScript.Text:= GetStringValue
            else
            if EntryString = 'http ' then
               HTTPServer.Checked:= GetBooleanValue
            else
            if EntryString = 'http_port ' then
               begin
                 Value:= GetStringValue;
                 if Value = '' then
                    Value:= '8080'; // default value
                 HTTPPort.Text:= Value;
               end
            else
            if (EntryString = 'http_root ') or
               (EntryString = 'http_path ') then
               begin
                 Value:= GetStringValue;
                 if Value = '' then
                    Value:= 'web'; // default value
                 HTTPPath.Text:= Value;
               end
            else
            if EntryString = 'console ' then
               EnableEmulatorLUAConsole.Checked:= GetBooleanValue
            else
            if EntryString = 'plugins ' then
               EnableLUAPluginSupport.Checked:= GetBooleanValue
            else
            if EntryString = 'plugin ' then
               begin
                 if FormMAMESettings.Tag = 1 then
                    begin
                      // list of plugins to enable... separated by comma (  ;  )
                      // only used for custom game/machine settings!!!
                      Value:= GetStringValue;
                      ReadPluginIni(Value);
                    end;
               end
            else
            // disabled for now...
            if EntryString = 'noplugin ' then
               begin
            //     // list of plugins to disable... separated by comma (  ;  )
               end
            else            
            if (EntryString = 'language ') or
               (EntryString = 'lang ') then
               begin
                 Value:= GetStringValue;
                 if FormMain.CheckTotal(DisplayLanguageList) then
                 begin
                   if SameText(Value, 'English') then
                      FormMain.ELV_SelectItem(DisplayLanguageList, 0)
                   else
                   begin
                     if Value[1] = '"' then
                        begin
                          Delete(Value, 1, 1);
                          Delete(Value, Length(Value), 1);
                        end;
                     FormMain.ELV_SelectItem(DisplayLanguageList, 0, Value);
                     if not FormMain.CheckSelected(DisplayLanguageList) then
                        FormMain.ELV_SelectItem(DisplayLanguageList, 0);
                   end;
                 end;
               end
            else
            if (EntryString = 'nvram_save ') or
               (EntryString = 'nvwrite ') then
               SaveNVRAMOnExit.Checked:= GetBooleanValue
            else
            if EntryString = 'uifontprovider ' then
               begin
                 Value:= GetStringValue;
                 if Value = '' then
                    Value:= 'auto';
                 if Value = 'auto' then
                    UIFontProvider.ItemIndex:= 0
                 else
                 if Value = 'none' then
                    UIFontProvider.ItemIndex:= 1
                 else
                 if Value = 'win' then
                    UIFontProvider.ItemIndex:= 2
                 else
                 if Value = 'sdl' then
                    UIFontProvider.ItemIndex:= 3
                 else
                    UIFontProvider.ItemIndex:= 0;
               end
            else
            // # WINDOWS DEBUGGING OPTIONS
            if EntryString = 'oslog ' then
               OSLog.Checked:= GetBooleanValue
            else
            if (EntryString = 'watchdog ') or
               (EntryString = 'wdog ') then
               Watchdog.Text:= GetStringValue// Boolean(StrToInt(ExtractMAMEIniValue(TextLine)))
            else
            // # WINDOWS PERFORMANCE OPTIONS
            if EntryString = 'priority ' then
               begin
                 Value:= GetStringValue;
                 if Value <> '' then
                    ThreadPriority.ItemIndex:= StrToInt(Value)+15;
               end
            else
            if (EntryString = 'multithreading ') or
               (EntryString = 'mt ') then
               Multithreading.Checked:= GetBooleanValue
            else
            if (EntryString = 'numprocessors ') or
               (EntryString = 'np ') then
               begin
                 Value:= GetStringValue;
                 if (SameText(Value, 'auto')) or (Value = '') then
                    NumberProcessors.ItemIndex:= 0
                 else
                    NumberProcessors.ItemIndex:= StrToInt(Value);
                 if NumberProcessors.ItemIndex = -1 then
                    NumberProcessors.ItemIndex:= 0
               end
            else
            if EntryString = 'sdlvideofps ' then // SDLMAME
               SDLVideoPerformance.Checked:= GetBooleanValue
            else
            if EntryString = 'bench ' then
               Benchmark.Position:= GetIntegerValue
            else
            //if EntryString = 'profile ' then
            //   begin
            //
            //   end
            //else
            // # WINDOWS VIDEO OPTIONS
            if EntryString = 'menu ' then
               EnableMenuBar.Checked:= GetBooleanValue
            else
            if EntryString = 'attach_window ' then
               AttachWindow.Text:= GetStringValue
            else
            if EntryString = 'video ' then
               begin
                 Value:= GetStringValue;
                 case IsSDLMAME of
                   True:
                     begin
                       // Auto
                       // Software
                       // OpenGL
                       // None (unsupported ????)
                       if Value = 'auto' then
                          VideoOutputMode.ItemIndex:= 0
                       else
                       if Value = 'soft' then
                          VideoOutputMode.ItemIndex:= 1
                       else
                       if Value = 'opengl' then
                          VideoOutputMode.ItemIndex:= 2
                       else
                       if Value = 'accel' then
                          VideoOutputMode.ItemIndex:= 3
                       else
                       if Value = 'bgfx' then
                          VideoOutputMode.ItemIndex:= 4
                       else
                       if Value = 'none' then
                          VideoOutputMode.ItemIndex:= 5
                       else
                          VideoOutputMode.ItemIndex:= 0; // default is "auto"
                     end;
                   False:
                     begin
                       // Auto
                       // GDI
                       // DirectDraw
                       // Direct3D
                       // None
                       if Value = 'auto' then
                          VideoOutputMode.ItemIndex:= 0
                       else
                       if Value = 'gdi' then
                          VideoOutputMode.ItemIndex:= 1
                       else
                       if Value = 'ddraw' then
                          VideoOutputMode.ItemIndex:= 2
                       else
                       if Value = 'd3d' then
                          VideoOutputMode.ItemIndex:= 3
                       else
                       if Value = 'opengl' then
                          VideoOutputMode.ItemIndex:= 4
                       else
                       if Value = 'bgfx' then
                          VideoOutputMode.ItemIndex:= 5
                       else
                       if Value = 'none' then
                          VideoOutputMode.ItemIndex:= 6
                       else
                          VideoOutputMode.ItemIndex:= 0; // default is 'd3d'
                     end;
                 end;
                 if Value = 'bgfx' then
                    begin
                      if not ButtonPageVideoEffectsBGFX.Down then
                      begin
                        ButtonPageVideoEffectsBGFX.Down:= True;
                        ButtonPageVideoEffectsHLSL.Down:= False;
                        ButtonPageVideoEffectsBGFX.Click;
                      end;
                    end
                 else
                 if Value = 'opengl' then
                    begin
                      if not ButtonPageVideoEffectsGLSL.Down then
                      begin
                        ButtonPageVideoEffectsGLSL.Down:= True;
                        ButtonPageVideoEffectsHLSL.Down:= False;
                        ButtonPageVideoEffectsGLSL.Click;
                      end;
                    end;

               end
            else
            if EntryString = 'numscreens ' then
               NumberScreens.Position:= GetIntegerValue
            else
            if (EntryString = 'window ') or
               (EntryString = 'w ') then
               WindowMode.Checked:= GetBooleanValue
            else
            if (EntryString = 'maximize ') or
               (EntryString = 'max ') then
               MaximizeWindow.Checked:= GetBooleanValue
            else
            if EntryString = 'centerh ' then // SDLMAME
               SDLCenterHorizontally.Checked:= GetBooleanValue
            else
            if EntryString = 'centerv ' then // SDLMAME
               SDLCenterVertically.Checked:= GetBooleanValue
            else
            if EntryString = 'prescale ' then // for Windows MAME and SDLMAME OpenGL setting
               Prescale_ScaleScreen.Position:= GetIntegerValue
            else
            if (EntryString = 'waitvsync ') or
               (EntryString = 'vs ') then
               WaitVerticalSync.Checked:= GetBooleanValue
            else
            if (EntryString = 'syncrefresh ') or
               (EntryString = 'srf ') then
               SyncronizeRefreshRate.Checked:= GetBooleanValue
            else
            if EntryString = 'monitorprovider ' then
               begin
                 Value:= GetStringValue;
                 if Value = 'auto' then
                    MonitorProvider.ItemIndex:= 0
                 else
                 if Value = 'win32' then
                    MonitorProvider.ItemIndex:= 1
                 else
                 if Value = 'dxgi' then
                    MonitorProvider.ItemIndex:= 3
                 else
                 if Value = 'sdl' then
                    MonitorProvider.ItemIndex:= 4
                 else
                    MonitorProvider.ItemIndex:= 0; // set default to 'auto'
               end
            else
            if (EntryString = 'scalemode ') or // SDLMAME
               (EntryString = 'sm ') then // SDLMAME
               begin
                 Value:= GetStringValue;
                 if Value = 'none' then
                    SDLScaleMode.ItemIndex:= 0
                 else
                 if Value = 'async' then
                    SDLScaleMode.ItemIndex:= 1
                 else
                 if Value = 'yv12' then
                    SDLScaleMode.ItemIndex:= 2
                 else
                 if Value = 'yuy2' then
                    SDLScaleMode.ItemIndex:= 3
                 else
                 if Value = 'yv12x2' then
                    SDLScaleMode.ItemIndex:= 4
                 else
                 if Value = 'yuy2x2' then
                    SDLScaleMode.ItemIndex:= 5
                 else
                 if Value = 'hwblit' then // SDL 2
                    SDLScaleMode.ItemIndex:= 6
                 else
                 if Value = 'hwbest' then // SDL 2
                    SDLScaleMode.ItemIndex:= 7
                 else
                    SDLScaleMode.ItemIndex:= 0;
               end
            else
            //// # DIRECTDRAW-SPECIFIC OPTIONS
            //if (EntryString = 'hwstretch ') or
            //   (EntryString = 'hws ') then
            //   HardwareStretch.Checked:= GetBooleanValue
            //else
            // # DIRECT3D-SPECIFIC OPTIONS
            if (EntryString = 'filter ') or
               (EntryString = 'd3dfilter ') or
               (EntryString = 'flt ') or // D3D for Windows MAME / OpenGL for SDLMAME
               (EntryString = 'glfilter ') then
               BilinearFilter.Checked:= GetBooleanValue
            else
            // # DIRECT3D POST-PROCESSING OPTIONS
            if EntryString = 'hlsl_enable ' then
               HLSLEnable.Checked:= GetBooleanValue
            else
            if EntryString = 'hlsl_oversampling ' then
               HLSLOversampling.Checked:= GetBooleanValue
            else
            if EntryString = 'hlslpath ' then
               HLSLPath.Text:= GetStringValue
            else
            if EntryString = 'shadow_mask_texture ' then
               ShadowMaskTexture.Text:= GetStringValue
            else
            if EntryString = 'yiq_enable ' then
               YIQEnable.Checked:= GetBooleanValue
            else
            if (EntryString = 'vector_beam_smooth') or
               (EntryString = 'vecsmooth') then
               VectorBeamSmooth.Position:= GetFloatValue('%1.2f')
            else
            if (EntryString = 'vector_length_scale') or
               (EntryString = 'vecscale') then
               VectorMaximumAttenuation.Position:= GetFloatValue('%1.2f')
            else
            if (EntryString = 'vector_length_ratio') or
               (EntryString = 'vecratio') then
               VectorMinimumLengthAttenuation.Position:= GetFloatValue('%1.3f')
            else
            //if EntryString = 'hlsl_prescale_x ' then
            //   HLSLPrescaleOverrideX.ItemIndex:= GetIntegerValue
            //else
            //if EntryString = 'hlsl_prescale_y ' then
            //   HLSLPrescaleOverrideY.ItemIndex:= GetIntegerValue
            //else
            //if EntryString = 'hlsl_preset ' then
            //   HLSLPresetToUse.ItemIndex:= GetIntegerValue+1
            //else        
            if EntryString = 'hlsl_snap_width ' then
               HLSLUpscaleSnapX.Text:= GetStringValue
            else
            if EntryString = 'hlsl_snap_height ' then
               HLSLUpscaleSnapY.Text:= GetStringValue
            else
            if EntryString = 'shadow_mask_tile_mode ' then
               ShadowMaskTileMode.ItemIndex:= GetIntegerValue
            else
            if EntryString = 'bloom_blend_mode ' then
               BloomBlendMode.ItemIndex:= GetIntegerValue
            else
            if EntryString = 'lut_texture ' then
               BloomLUTTextureScreen.Text:= GetStringValue
            else
            if EntryString = 'lut_enable ' then
               BloomLUTEnabled.Checked:= GetBooleanValue
            else
            if EntryString = 'ui_lut_texture ' then
               BloomLUTTextureUI.Text:= GetStringValue
            else
            if EntryString = 'ui_lut_enable ' then
               BloomLOOTUIEnabled.Checked:= GetBooleanValue
            else
            if EntryString = 'hlsl_ini_read ' then // for MAME 0.149
               ReadCustomHLSLFile.Checked:= GetBooleanValue
            else
            if EntryString = 'hlsl_ini_write ' then // for MAME 0.149
               WriteCustomHLSLFile.Checked:= GetBooleanValue
            else
            if EntryString = 'hlslini ' then // for MAME 0.149
               HLSLIniFile.Text:= GetStringValue
            else

            // # OpenGL-SPECIFIC OPTIONS... for SDLMAME
            if EntryString = 'gl_forcepow2texture ' then
               OpenGLForcePowerTwoTextures.Checked:= GetBooleanValue // for old video cards
            else
            if EntryString = 'gl_notexturerect ' then
               OpenGLDisableUseGL_ARBTextureRectangle.Checked:= GetBooleanValue // for old video cards
            else
            if EntryString = 'gl_vbo ' then
               EnableOpenGL_VBO.Checked:= GetBooleanValue
            else
            if EntryString = 'gl_pbo ' then
               EnableOpenGL_PBO.Checked:= GetBooleanValue
            else
            if EntryString = 'gl_glsl ' then
               EnableGLSL.Checked:= GetBooleanValue
            else
            if EntryString = 'gl_glsl_filter ' then
               EnableOpenGLFilterNotFF.Checked:= GetBooleanValue
            else
            if EntryString = 'glsl_shader_mame0 ' then
               GetGLSLShaderMAME(GLSL_Shader_MAME0)
            else
            if EntryString = 'glsl_shader_mame1 ' then
               GetGLSLShaderMAME(GLSL_Shader_MAME1)
            else
            if EntryString = 'glsl_shader_mame2 ' then
               GetGLSLShaderMAME(GLSL_Shader_MAME2)
            else
            if EntryString = 'glsl_shader_mame3 ' then
               GetGLSLShaderMAME(GLSL_Shader_MAME3)
            else
            if EntryString = 'glsl_shader_mame4 ' then
               GetGLSLShaderMAME(GLSL_Shader_MAME4)
            else
            if EntryString = 'glsl_shader_mame5 ' then
               GetGLSLShaderMAME(GLSL_Shader_MAME5)
            else
            if EntryString = 'glsl_shader_mame6 ' then
               GetGLSLShaderMAME(GLSL_Shader_MAME6)
            else
            if EntryString = 'glsl_shader_mame7 ' then
               GetGLSLShaderMAME(GLSL_Shader_MAME7)
            else
            if EntryString = 'glsl_shader_mame8 ' then
               GetGLSLShaderMAME(GLSL_Shader_MAME8)
            else
            if EntryString = 'glsl_shader_mame9 ' then
               GetGLSLShaderMAME(GLSL_Shader_MAME9)
            else
            if EntryString = 'glsl_shader_screen0 ' then
               GetGLSLShaderMAME(GLSL_Shader_Screen0)
            else
            if EntryString = 'glsl_shader_screen1 ' then
               GetGLSLShaderMAME(GLSL_Shader_Screen1)
            else
            if EntryString = 'glsl_shader_screen2 ' then
               GetGLSLShaderMAME(GLSL_Shader_Screen2)
            else
            if EntryString = 'glsl_shader_screen3 ' then
               GetGLSLShaderMAME(GLSL_Shader_Screen3)
            else
            if EntryString = 'glsl_shader_screen4 ' then
               GetGLSLShaderMAME(GLSL_Shader_Screen4)
            else
            if EntryString = 'glsl_shader_screen5 ' then
               GetGLSLShaderMAME(GLSL_Shader_Screen5)
            else
            if EntryString = 'glsl_shader_screen6 ' then
               GetGLSLShaderMAME(GLSL_Shader_Screen6)
            else
            if EntryString = 'glsl_shader_screen7 ' then
               GetGLSLShaderMAME(GLSL_Shader_Screen7)
            else
            if EntryString = 'glsl_shader_screen8 ' then
               GetGLSLShaderMAME(GLSL_Shader_Screen8)
            else
            if EntryString = 'glsl_shader_screen9 ' then
               GetGLSLShaderMAME(GLSL_Shader_Screen9)
            else

            // # BGFX POST-PROCESSING OPTIONS
            if EntryString = 'bgfx_path ' then
               BGFXPath.Text:= GetStringValue
            else
            if EntryString = 'bgfx_backend ' then
               begin
                 // from MAME v0.235 (up to v0.234 options "Direct3D 12" and "Vulkan" are not supported)
                 //Auto
                 //Direct3D 9
                 //Direct3D 11
                 //Direct3D 12
                 //OpenGL
                 //OpenGL ES
                 //Metal
                 //Vulkan
                 Value:= LowerCase(GetStringValue);
                 if Value = 'auto' then
                    BGFXBackend.ItemIndex:= 0
                 else
                 if Value = 'd3d9' then
                    BGFXBackend.ItemIndex:= 1
                 else
                 if Value = 'd3d11' then
                    BGFXBackend.ItemIndex:= 2
                 else
                 if Value = 'd3d12' then
                    BGFXBackend.ItemIndex:= 3
                 else
                 if Value = 'opengl' then
                    BGFXBackend.ItemIndex:= 4
                 else
                 if Value = 'gles' then
                    BGFXBackend.ItemIndex:= 5
                 else
                 if Value = 'metal' then
                    BGFXBackend.ItemIndex:= 6
                 else
                 if Value = 'vulkan' then
                    BGFXBackend.ItemIndex:= 7
                 else
                    BGFXBackend.ItemIndex:= 0; // default to 'auto'
               end
            else
            if EntryString = 'bgfx_debug ' then
               BGFXDebug.Checked:= GetBooleanValue
            else
            if EntryString = 'bgfx_screen_chains ' then
               begin
                 BGFXScreenShaderChains.Text:= GetStringValue;
               end
            else
            if EntryString = 'bgfx_shadow_mask ' then
               BGFXShadowMaskTextureName.Text:= GetStringValue
            else
            if EntryString = 'bgfx_lut ' then
               BGFXLUTTextureName.Text:= GetStringValue
            else
            //if EntryString = 'bgfx_avi_name ' then
            //   begin
            //     BGFX_RecordRenderedVideoAVI.Text:= GetStringValue;
            //     if BGFX_RecordRenderedVideoAVI.Text = '' then
            //        BGFX_RecordRenderedVideoAVIButtonReset.Click;
            //   end
            //else

            // # PER-WINDOW VIDEO OPTIONS
            if EntryString = 'screen ' then
               ScreenDetails[-1].eScreenName:= GetStringValue
            else
            if (EntryString = 'aspect ') or
               (EntryString = 'screen_aspect ') then
               ScreenDetails[-1].eScreenAspectRatio:= GetStringValue
            else
            if (EntryString = 'resolution ') or
               (EntryString = 'r ') then
               SetResolutionOption(-1)
            else
            if EntryString = 'view ' then
               begin
                 ScreenDetails[-1].eScreenView:= GetStringValue;
                 FixScreenViewNameRead(-1);
               end
            else

            if EntryString = 'screen0 ' then
               ScreenDetails[0].eScreenName:= GetStringValue
            else
            if EntryString = 'aspect0 ' then
               ScreenDetails[0].eScreenAspectRatio:= GetStringValue
            else
            if (EntryString = 'resolution0 ') or
               (EntryString = 'r0 ') then
               SetResolutionOption(0)
            else
            if EntryString = 'view0 ' then
               begin
                 ScreenDetails[0].eScreenView:= GetStringValue;
                 FixScreenViewNameRead(0);
               end
            else
            if EntryString = 'screen1 ' then
               ScreenDetails[1].eScreenName:= GetStringValue
            else
            if EntryString = 'aspect1 ' then
               ScreenDetails[1].eScreenAspectRatio:= GetStringValue
            else
            if (EntryString = 'resolution1 ') or
               (EntryString = 'r1 ') then
               SetResolutionOption(1)
            else
            if EntryString = 'view1 ' then
               begin
                 ScreenDetails[1].eScreenView:= GetStringValue;
                 FixScreenViewNameRead(1);
               end
            else
            if EntryString = 'screen2 ' then
               ScreenDetails[2].eScreenName:= GetStringValue
            else
            if EntryString = 'aspect2 ' then
               ScreenDetails[2].eScreenAspectRatio:= GetStringValue
            else
            if (EntryString = 'resolution2 ') or
               (EntryString = 'r2 ') then
               SetResolutionOption(2)
            else
            if EntryString = 'view2 ' then
               begin
                 ScreenDetails[2].eScreenView:= GetStringValue;
                 FixScreenViewNameRead(2);
               end
            else
            if EntryString = 'screen3 ' then
               ScreenDetails[3].eScreenName:= GetStringValue
            else
            if EntryString = 'aspect3 ' then
               ScreenDetails[3].eScreenAspectRatio:= GetStringValue
            else
            if (EntryString = 'resolution3 ') or
               (EntryString = 'r3 ') then
               SetResolutionOption(3)
            else
            if EntryString = 'view3 ' then
               begin
                 ScreenDetails[3].eScreenView:= GetStringValue;
                 FixScreenViewNameRead(3);
               end
            else
            // # FULL SCREEN OPTIONS
            if (EntryString = 'triplebuffer ') or
               (EntryString = 'tb ') then
               TripleBuffer.Checked:= Boolean(StrToInt(ExtractMAMEIniValue(TextLine)))
            else
            if EntryString = 'switchres ' then
               SwitchResolution.Checked:= Boolean(StrToInt(ExtractMAMEIniValue(TextLine)))
            else
            if (EntryString = 'full_screen_brightness ') or
               (EntryString = 'fsb ') then
               FullScreenBrightness.Position:= GetFloatValue('%1.2f') //StrToFloat(Format('%1.2f', [StrToFloat(ExtractMAMEIniValue(TextLine))]))
            else
            if (EntryString = 'full_screen_contrast ') or
               (EntryString = 'fsc ') then
               FullScreenContrast.Position:= GetFloatValue('%1.2f') //StrToFloat(Format('%1.2f', [StrToFloat(ExtractMAMEIniValue(TextLine))]))
            else
            if (EntryString = 'full_screen_gamma ') or
               (EntryString = 'fsg ') then
               FullScreenGamma.Position:= GetFloatValue('%1.2f') //StrToFloat(Format('%1.2f', [StrToFloat(ExtractMAMEIniValue(TextLine))]))
            else
            if EntryString = 'useallheads ' then // SDLMAME option disable for now (X11 driver driver)
               SDLSplitFullScreenMonitors.Checked:= GetBooleanValue
            else
            if EntryString = 'attach_window ' then // SDLMAME option
               SDLAttachWindow.Text:= GetStringValue
            else
            // # WINDOWS SOUND OPTIONS
            if EntryString = 'audio_latency ' then
               AudioLatency.ItemIndex:= GetIntegerValue-1 // StrToInt(ExtractMAMEIniValue(TextLine))-1
            else
            // # INPUT DEVICE OPTIONS
            //if EntryString = 'hide_cursor ' then // deprecated setting
            //   HideCursor.Checked:= GetBooleanValue
            //else
            if EntryString = 'global_inputs ' then
               EnableGlobalInputs.Checked:= GetBooleanValue
            else
            if (EntryString = 'dual_lightgun ') or
               (EntryString = 'dual ') then
               DualLightGun.Checked:= GetBooleanValue
            else

            // SDLMAME
            // # SDL KEYBOARD MAPPING
            if EntryString = 'keymap ' then
               SDKKeyboardMapping.Checked:= GetBooleanValue
            else
            if EntryString = 'keymap_file ' then
               SDLKeymapFilename.Text:= GetStringValue
            else
            // # SDL JOYSTICK MAPPING
            if EntryString = 'joy_idx1 ' then
               GetSDLDeviceMapping(SDLJoystickMapping1, SDLJoystickMapping1Custom)
            else
            if EntryString = 'joy_idx2 ' then
               GetSDLDeviceMapping(SDLJoystickMapping2, SDLJoystickMapping2Custom)
            else
            if EntryString = 'joy_idx3 ' then
               GetSDLDeviceMapping(SDLJoystickMapping3, SDLJoystickMapping3Custom)
            else
            if EntryString = 'joy_idx4 ' then
               GetSDLDeviceMapping(SDLJoystickMapping4, SDLJoystickMapping4Custom)
            else
            if EntryString = 'joy_idx5 ' then
               GetSDLDeviceMapping(SDLJoystickMapping5, SDLJoystickMapping5Custom)
            else
            if EntryString = 'joy_idx6 ' then
               GetSDLDeviceMapping(SDLJoystickMapping6, SDLJoystickMapping6Custom)
            else
            if EntryString = 'joy_idx7 ' then
               GetSDLDeviceMapping(SDLJoystickMapping7, SDLJoystickMapping7Custom)
            else
            if EntryString = 'joy_idx8 ' then
               GetSDLDeviceMapping(SDLJoystickMapping8, SDLJoystickMapping8Custom)
            else
            if EntryString = 'sixaxis ' then
               PS3SixaxisControllers.Checked:= GetBooleanValue
            else

            // # SDL LIGHTGUN MAPPING ... SDL 2 only
            if EntryString = 'lightgun_index1 ' then
               GetSDLDeviceMapping(SDLLightgunMapping1, SDLLightgunMapping1Custom)
            else
            if EntryString = 'lightgun_index2 ' then
               GetSDLDeviceMapping(SDLLightgunMapping2, SDLLightgunMapping2Custom)
            else
            if EntryString = 'lightgun_index3 ' then
               GetSDLDeviceMapping(SDLLightgunMapping3, SDLLightgunMapping3Custom)
            else
            if EntryString = 'lightgun_index4 ' then
               GetSDLDeviceMapping(SDLLightgunMapping4, SDLLightgunMapping4Custom)
            else
            if EntryString = 'lightgun_index5 ' then
               GetSDLDeviceMapping(SDLLightgunMapping5, SDLLightgunMapping5Custom)
            else
            if EntryString = 'lightgun_index6 ' then
               GetSDLDeviceMapping(SDLLightgunMapping6, SDLLightgunMapping6Custom)
            else
            if EntryString = 'lightgun_index7 ' then
               GetSDLDeviceMapping(SDLLightgunMapping7, SDLLightgunMapping7Custom)
            else
            if EntryString = 'lightgun_index8 ' then
               GetSDLDeviceMapping(SDLLightgunMapping8, SDLLightgunMapping8Custom)
            else

            // # SDL MOUSE MAPPING ... SDL 2 only
            if EntryString = 'mouse_index1 ' then
               GetSDLDeviceMapping(SDL2MouseMapping1, SDL2MouseMapping1Custom)
            else
            if EntryString = 'mouse_index2 ' then
               GetSDLDeviceMapping(SDL2MouseMapping2, SDL2MouseMapping2Custom)
            else
            if EntryString = 'mouse_index3 ' then
               GetSDLDeviceMapping(SDL2MouseMapping3, SDL2MouseMapping3Custom)
            else
            if EntryString = 'mouse_index4 ' then
               GetSDLDeviceMapping(SDL2MouseMapping4, SDL2MouseMapping4Custom)
            else
            if EntryString = 'mouse_index5 ' then
               GetSDLDeviceMapping(SDL2MouseMapping5, SDL2MouseMapping5Custom)
            else
            if EntryString = 'mouse_index6 ' then
               GetSDLDeviceMapping(SDL2MouseMapping6, SDL2MouseMapping6Custom)
            else
            if EntryString = 'mouse_index7 ' then
               GetSDLDeviceMapping(SDL2MouseMapping7, SDL2MouseMapping7Custom)
            else
            if EntryString = 'mouse_index8 ' then
               GetSDLDeviceMapping(SDL2MouseMapping8, SDL2MouseMapping8Custom)
            else

            // # SDL KEYBOARD MAPPING ... SDL 2 only
            if EntryString = 'keyb_idx1 ' then
               GetSDLDeviceMapping(SDL2KeyboardMapping1, SDL2KeyboardMapping1Custom)
            else
            if EntryString = 'keyb_idx2 ' then
               GetSDLDeviceMapping(SDL2KeyboardMapping2, SDL2KeyboardMapping2Custom)
            else
            if EntryString = 'keyb_idx3 ' then
               GetSDLDeviceMapping(SDL2KeyboardMapping3, SDL2KeyboardMapping3Custom)
            else
            if EntryString = 'keyb_idx4 ' then
               GetSDLDeviceMapping(SDL2KeyboardMapping4, SDL2KeyboardMapping4Custom)
            else
            if EntryString = 'keyb_idx5 ' then
               GetSDLDeviceMapping(SDL2KeyboardMapping5, SDL2KeyboardMapping5Custom)
            else
            if EntryString = 'keyb_idx6 ' then
               GetSDLDeviceMapping(SDL2KeyboardMapping6, SDL2KeyboardMapping6Custom)
            else
            if EntryString = 'keyb_idx7 ' then
               GetSDLDeviceMapping(SDL2KeyboardMapping7, SDL2KeyboardMapping7Custom)
            else
            if EntryString = 'keyb_idx8 ' then
               GetSDLDeviceMapping(SDL2KeyboardMapping8, SDL2KeyboardMapping8Custom)
            else

            // # SDL LOWLEVEL DRIVER OPTIONS
            if (EntryString = 'videodriver ') or
               (EntryString = 'vd ') then
               begin
                 Value:= GetStringValue;
                 if Value = 'auto' then
                    SDLVideoDriverToUse.ItemIndex:= 0
                 else
                 if Value = 'x11' then
                    SDLVideoDriverToUse.ItemIndex:= 1
                 else
                 if Value = 'directfb' then
                    SDLVideoDriverToUse.ItemIndex:= 2
                 else
                    SDLVideoDriverToUse.ItemIndex:= 0; // default value
               end
            else
            if (EntryString = 'renderdriver ') or
               (EntryString = 'rd ') then // for SDL 2 only
               begin
                 Value:= GetStringValue;
                 if Value = 'auto' then
                    SDL2RenderDriverToUse.ItemIndex:= 0
                 else
                 if Value = 'software' then
                    SDL2RenderDriverToUse.ItemIndex:= 1
                 else
                 if Value = 'opengl' then
                    SDL2RenderDriverToUse.ItemIndex:= 2
                 else
                 if Value = 'directfb' then
                    SDL2RenderDriverToUse.ItemIndex:= 3
                 else
                    SDL2RenderDriverToUse.ItemIndex:= 0; // default value
               end
            else
            if (EntryString = 'audiodriver ') or
               (EntryString = 'ad ') then
               begin
                 Value:= GetStringValue;
                 if Value = 'auto' then
                    SDLAudioDriverToUse.ItemIndex:= 0
                 else
                 if Value = 'alsa' then
                    SDLAudioDriverToUse.ItemIndex:= 1
                 else
                 if Value = 'arts' then
                    SDLAudioDriverToUse.ItemIndex:= 2
                 else
                    SDLAudioDriverToUse.ItemIndex:= 0; // default value
               end
            else
            if EntryString = 'gl_lib ' then
               begin
                 Value:= GetStringValue;
                 SDLAlternativeLibGLToUse.ItemIndex:= Ord(Value <> 'auto');
                 SDLAlternativeLibGLToUseCustom.Enabled:= SDLAlternativeLibGLToUse.ItemIndex = 1;
                 SDLAlternativeLibGLToUseCustomButtonSelect.Enabled:= SDLAlternativeLibGLToUseCustom.Enabled;
                 if SDLAlternativeLibGLToUseCustom.Enabled then
                    SDLAlternativeLibGLToUseCustom.Text:= Value;
               end;
          end;
     end;
   end;
   FreeAndNil(MAMEIniFile);
end;

procedure TFormMAMESettings.LoadCustomFilesArray;
var
  Loop: ShortInt;
  strFile, FileFolder: String;
begin
  if (ActiveFileID = 1) or (not SaveValidateAllCustomFiles.Checked) then
     Exit; // debug.ini; there's no need to use the array as 'debug.ini' will be tested directly against 'mame.ini' (use current validation mode)

  for Loop:= (ActiveFileID-1) downto 1 do
  begin
    strFile:= FormMain.GetCustomIniFileMAME(Loop);
    if strFile <> '' then
    begin
      FileFolder:= FormMain.IniFilesDir[sysID];

      if Loop = 9 then
         begin
           // driver custom settings is for MAME/HBMAME only
           // starting from MAME 0.179, all driver .ini files must be in the "inidir\source\source_name.ini" sub-folder ("inidir\source\")
           // ... no more support for "inidir\source_name.ini"
           strFile:= FileFolder+'source\'+strFile+'.ini';
           //if (not FileExists(strFile)) and (iVersion < 179) then
           //   strFile:= FileFolder+strFile+'.ini' // no more support for "inidir\sourcename.ini" (October 26, 2016)
         end
      else
         strFile:= FileFolder+strFile+'.ini';

      LoadIniToStringList(Loop, IniCustomList[Loop]); // convert 'entry    value' format to 'entry=value' so EL can read settings easier
      //ReadMAMEIniFile(strFile); // read all gamename.ini options
    end;
  end;

  //ReadMAMEIniFile(GameIni); // read all gamename.ini options
  //SaveValidateAllCustomFiles
end;

procedure TFormMAMESettings.WriteMAMEIniFile(const customIni: String; CustomGameOption: Boolean);
var
  MAMEIniFile, GameIniFile: THashedStringList;
  Loop, LoopPlugin: Integer;
  Value, tmpEntryStr, EntryString, UI_FileName: String;

  //if (data->data != NULL)
	//   fprintf(inifile, "%-25s %s\n", data->names[0], data->data);
  //else
  //   fprintf(inifile, "# %-23s <NULL> (not set)\n", data->names[0]);

  function WriteLine(const Entry, Value: String): String;
  begin
    Result:= Format('%-25s %s', [Entry, Value]);
  end;

  function IsValueDifferent(const FileValue, NewValue: String; IsFloat: Boolean): Boolean;
  begin
    Result:= False;
    case IsFloat of
      True:
        begin
          if StrToFloat(FileValue) <> StrToFloat(NewValue) then
             Result:= True;
        end;
      False:
        begin
          if FileValue <> NewValue then
             Result:= True;
        end;
    end;
  end;

  function UpdateMAMELine(const Entry, ValueHolder: String; FloatValue: Boolean = False): Boolean;
  var
    ValueStr: String;
    AddEntry: Boolean;
    iLoop, IndexEntry: Integer;
  begin
    Result:= True;
    case CustomGameOption of
      True:
        begin
          AddEntry:= True;
          if SaveValidateAllCustomFiles.Checked and (ActiveFileID > 1) then
             begin
               for iLoop:= (ActiveFileID-1) downto 1 do // down to debug.ini
               begin
                 if Assigned(IniCustomList[iLoop]) then
                    begin
                      IndexEntry:= IniCustomList[iLoop].IndexOfName(Entry);
                      if IndexEntry <> -1 then
                         begin
                           ValueStr:= IniCustomList[iLoop].ValueFromIndex[IndexEntry];
                           if IsValueDifferent(ValueStr, ValueHolder, FloatValue) then
                              GameIniFile.Add(WriteLine(Entry, ValueHolder));
                           AddEntry:= False; // prevent from checking against 'mame.ini'
                           Break; // stop scanning other previous files...
                         end;
                    end;
               end;
             end;

          if AddEntry then
             begin
               // need to check against mame.ini now (default emu settings)
               if IsValueDifferent(ExtractMAMEIniValue(MAMEIniFile[Loop]), ValueHolder, FloatValue) then
                  GameIniFile.Add(WriteLine(Entry, ValueHolder));
               // old code
               //case FloatValue of
               //  True:
               //    begin
               //      if StrToFloat(ExtractMAMEIniValue(MAMEIniFile[Loop])) <>
               //         StrToFloat(ValueHolder) then
               //         GameIniFile.Add(WriteLine(Entry, ValueHolder));
               //    end;
               //  False:
               //    begin
               //      if ExtractMAMEIniValue(MAMEIniFile[Loop]) <> ValueHolder then
               //         GameIniFile.Add(WriteLine(Entry, ValueHolder));
               //    end;
               //end;
             end;
        end;
      False: MAMEIniFile[Loop]:= WriteLine(Entry, ValueHolder);
    end;
  end;
  {function UpdateMAMELine(const Entry, ValueHolder: String; FloatValue: Boolean = False): Boolean;
  begin
    Result:= True;
    case CustomGameOption of
      True:
        begin
          case FloatValue of
            True:
              begin
                if StrToFloat(ExtractMAMEIniValue(MAMEIniFile[Loop])) <>
                   StrToFloat(ValueHolder) then
                   GameIniFile.Add(WriteLine(Entry, ValueHolder));
              end;
            False:
              begin
                if ExtractMAMEIniValue(MAMEIniFile[Loop]) <> ValueHolder then
                   GameIniFile.Add(WriteLine(Entry, ValueHolder));
              end;
          end;
        end;
      False: MAMEIniFile[Loop]:= WriteLine(Entry, ValueHolder);
    end;
  end;}

  function SetScreenResolution(nScreenIdx: ShortInt; EntryStr: String): Boolean;
  begin
    Result:= True;
    Value:= ScreenDetails[nScreenIdx].eScreenResolution;
    if Value <> 'auto' then
       begin
         // only check refresh rate if resolution is not 'auto'
         if (ScreenDetails[nScreenIdx].eScreenRefreshRate <> '') and
            (ScreenDetails[nScreenIdx].eScreenRefreshRate <> 'auto' ) then
            Value:= Value+'@'+ScreenDetails[nScreenIdx].eScreenRefreshRate;
       end
    else
       begin
         if ScreenDetails[nScreenIdx].eScreenRefreshRate <> 'auto' then
            Value:= '0x0@'+ScreenDetails[nScreenIdx].eScreenRefreshRate;
       end;
    UpdateMAMELine(EntryStr, Value);
  end;

  function SetGLSLShader(EditHolder: TEditEx): String;
  begin
    Result:= 'none';
    if EditHolder.Text <> '' then
       Result:= EditHolder.Text;
  end;

  function SetSDLDevice(ComboBoxHolder: TComboBox2Ex; EditHolder: TEditEx): String;
  begin
    Result:= 'auto';
    if (ComboBoxHolder.ItemIndex = 1) and (EditHolder.Text <> '') then
       Result:= EditHolder.Text;
  end;

  function GetBooleanValue(BooleanValue: Boolean): String;
  begin
    Result:= IntToStr(Ord(BooleanValue));
  end;

  function GetFloatValue(const StrFormat: String; ComponentValue: Extended): String;
  begin
    Result:= Format(StrFormat, [ComponentValue]);
  end;

  {function SetSnapViewOption(EntryStr: String): Boolean;
  begin
    Result:= True;
    case SnapName.ItemIndex of
      0: Value:= '%g';
      1: Value:= '%g%i';
      2: Value:= '%g/%g';
      3: Value:= '%g/%g%i';
      4: Value:= '%g/%i';
      else
         Value:= '%g/%i';
    end;
    UpdateMAMELine(EntryStr, Value);
  end;}

begin
  if emuIni = '' then
     begin
       FormMain.ShowMessageBox('Error', 'Failed to update settings.', '    Emulator .ini filename is blank. '+
                               'Please try selecting an emulator again in Arcade Emulators Setup screen. Aborting...', 2, False, 1);
       Exit;
     end;
  case CustomGameOption of
    True:
      begin
        if customIni = '' then
           begin
             FormMain.ShowMessageBox('Error', 'Failed to update settings.', '    Custom .ini filename is blank. '+
                                     'Please make sure that a game or a system is selected in the main screen. Aborting...', 2, False, 1);
             Exit;
           end
        else
           begin
             CheckAndCreateFolder(ExtractFilePath(customIni));
             if FileExists(customIni) then
                DeleteFile(customIni);
             LoadCustomFilesArray;
             GameIniFile:= THashedStringList.Create;
             GameIniFile.BeginUpdate;
           end;
      end;
    False:
      begin
        if SkipWarnings.Enabled then
        begin
          UI_FileName:= ExtractFilePath(emuIni)+'ui.ini';
          if not CheckReadOnly(UI_FileName) then
             begin
               MAMEIniFile:= THashedStringList.Create;
               MAMEIniFile.LoadFromFile(UI_FileName);
               for Loop:=0 to MAMEIniFile.Count-1 do
               begin
                 if MAMEIniFile[Loop] <> '' then
                 begin
                   EntryString:= XML_GetEntryName(MAMEIniFile[Loop]);
                   tmpEntryStr:= EntryString+' ';
                   if tmpEntryStr = 'skip_warnings ' then
                      begin
                        UpdateMAMELine(EntryString, GetBooleanValue(SkipWarnings.Checked));
                        MAMEIniFile.SaveToFile(UI_FileName);
                        Break;
                      end;
                 end;
               end;
               FreeAndNil(MAMEIniFile);
             end;
        end;

        if CheckReadOnly(emuIni) then
           Exit;
      end;
  end;
  MAMEIniFile:= THashedStringList.Create;
  MAMEIniFile.LoadFromFile(emuIni);

  for Loop:=0 to MAMEIniFile.Count-1 do
  begin
    if MAMEIniFile[Loop] <> '' then
       begin
         EntryString:= XML_GetEntryName(MAMEIniFile[Loop]);
         tmpEntryStr:= EntryString+' ';
         // # CORE CONFIGURATION OPTIONS
         if (tmpEntryStr = 'readconfig ') or
            (tmpEntryStr = 'rc ') then
            UpdateMAMELine(EntryString, GetBooleanValue(ReadConfigFiles.Checked))
         else
         if (tmpEntryStr = 'writeconfig ') or
            (tmpEntryStr = 'wc ') then
            UpdateMAMELine(EntryString, GetBooleanValue(WriteConfigFiles.Checked))
         else
         // # CORE SEARCH PATH OPTIONS
         if (tmpEntryStr = 'homepath ') and (not CustomGameOption) then
            UpdateMAMELine(EntryString, FolderHomePath.Text)
         else
         if ((tmpEntryStr = 'rompath ') or
             (tmpEntryStr = 'rp ') or
             (tmpEntryStr = 'biospath ') or
             (tmpEntryStr = 'bp ')) and (not CustomGameOption) then
            UpdateMAMELine(EntryString, FormMain.MountFoldersListMAME(FolderROMs))
         else
         if ((tmpEntryStr = 'hashpath ') or
             (tmpEntryStr = 'hash_directory ') or
             (tmpEntryStr = 'hash ')) and (not CustomGameOption) then
            UpdateMAMELine(EntryString, FolderHashFiles.Text)
         else
         if ((tmpEntryStr = 'samplepath ') or
             (tmpEntryStr = 'sp ')) and (not CustomGameOption) then
            UpdateMAMELine(EntryString, FolderSamples.Text)
         else
         if ((tmpEntryStr = 'artpath ') or
             (tmpEntryStr = 'artwork_directory ')) and (not CustomGameOption) then
            UpdateMAMELine(EntryString, FormMain.MountFoldersListMAME(FolderArtworks))
         else
         if ((tmpEntryStr = 'ctrlrpath ') or
             (tmpEntryStr = 'ctrlr_directory ')) and (not CustomGameOption) then
            UpdateMAMELine(EntryString, FolderControllerDefinitions.Text)
         else
         if (tmpEntryStr = 'inipath ') and (not CustomGameOption) then
            UpdateMAMELine(EntryString, FormMain.MountFoldersListMAME(FolderIniFiles))
         else
         if (tmpEntryStr = 'fontpath ') and (not CustomGameOption)  then
            UpdateMAMELine(EntryString, FolderFontFiles.Text) // FormMain.MountFoldersListMAME(FolderFontFiles)) // older EasyListView function call
         else
         if (tmpEntryStr = 'cheatpath ') and (not CustomGameOption) then
            UpdateMAMELine(EntryString, FolderCheatFiles.Text)
         else
         if ((tmpEntryStr = 'crsshairpath ') or
             (tmpEntryStr = 'crosshairpath ')) and (not CustomGameOption) then
            UpdateMAMELine(EntryString, FolderCrosshairFiles.Text)
         else
         if (tmpEntryStr = 'pluginspath ') and (not CustomGameOption)  then
            UpdateMAMELine(EntryString, FolderPluginFiles.Text)
         else
         if (tmpEntryStr = 'languagepath ') and (not CustomGameOption)  then
            UpdateMAMELine(EntryString, FolderLanguageFiles.Text)
         else
         if (tmpEntryStr = 'swpath ') and (not CustomGameOption)  then
            UpdateMAMELine(EntryString, FolderLooseSoftware.Text)
         else
         // # CORE OUTPUT DIRECTORY OPTIONS
         if (tmpEntryStr = 'cfg_directory ') and (not CustomGameOption) then
            UpdateMAMELine(EntryString, FolderGamesConfigurations.Text)
         else
         if (tmpEntryStr = 'nvram_directory ') and (not CustomGameOption) then
            UpdateMAMELine(EntryString, FolderNVRAM.Text)
         else
         if (tmpEntryStr = 'memcard_directory ') and (not CustomGameOption) then
            UpdateMAMELine(EntryString, FolderMemoryCards.Text)
         else
         if (tmpEntryStr = 'input_directory ') and (not CustomGameOption) then
            UpdateMAMELine(EntryString, FolderInputDeviceLogs.Text)
         else
         if (tmpEntryStr = 'state_directory ') and (not CustomGameOption) then
            UpdateMAMELine(EntryString, FolderSaveStates.Text)
         else
         if (tmpEntryStr = 'snapshot_directory ') and (not CustomGameOption) then
            UpdateMAMELine(EntryString, FolderGameSnapshots.Text)
         else
         if (tmpEntryStr = 'diff_directory ') and (not CustomGameOption) then
            UpdateMAMELine(EntryString, FolderDiff.Text)
         else
         if (tmpEntryStr = 'comment_directory ') and (not CustomGameOption) then
            UpdateMAMELine(EntryString, FolderDebuggerComments.Text)
         else
         if (tmpEntryStr = 'share_directory ') and (not CustomGameOption) then
            UpdateMAMELine(EntryString, FolderShareEmulatedMachines.Text)
         else

         // # CORE STATE/PLAYBACK OPTIONS
         if tmpEntryStr = 'autosave ' then
            UpdateMAMELine(EntryString, GetBooleanValue(AutoSave.Checked))
         else
         if tmpEntryStr = 'rewind ' then
            UpdateMAMELine(EntryString, GetBooleanValue(EnableSaveStateRewind.Checked))
         else
         if tmpEntryStr = 'rewind_capacity ' then
            UpdateMAMELine(EntryString, IntToStr(SaveStateRewindBufferSize.Position))
         else
         if tmpEntryStr = 'record_timecode ' then
            UpdateMAMELine(EntryString, GetBooleanValue(RecordInputTimecodeFile.Checked))
         else
         if tmpEntryStr = 'exit_after_playback ' then
            UpdateMAMELine(EntryString, GetBooleanValue(ExitAfterInputPlayback.Checked))
         else
         if tmpEntryStr = 'snapname ' then
            begin
              Value:= SnapName.Text;
              if Value = '' then
                 Value:= '%g/%i';
              UpdateMAMELine(EntryString, Value);
            end
         else
         if tmpEntryStr = 'snapsize ' then
            begin
              Value:= 'auto';
              if not SnapSizeAuto.Checked then
                 begin
                   if (SnapSizeWidth.Text <> '') and (SnapSizeHeight.Text <> '') then
                      Value:= SnapSizeWidth.Text+'x'+SnapSizeHeight.Text;
                 end;
                UpdateMAMELine(EntryString, Value);
            end
         else
         if tmpEntryStr = 'snapview ' then
            begin
              Value:= LowerCase(SnapView.Text);
              if Value = '' then
                 Value:= 'internal';
              UpdateMAMELine(EntryString, Value);
            end
         else
         if tmpEntryStr = 'snapbilinear ' then
            UpdateMAMELine(EntryString, GetBooleanValue(SnapBilinear.Checked))
         else
         if tmpEntryStr = 'statename ' then
            begin
               Value:= LowerCase(SaveStateName.Text);
               if Value = '' then
                  Value:= '%g';
               UpdateMAMELine(EntryString, Value);
            end
         else
         if tmpEntryStr = 'burnin ' then
            UpdateMAMELine(EntryString, GetBooleanValue(SnapBurnIn.Checked))
         else
         //if tmpEntryStr = 'dummywrite ' then // this setting needs a MAME compiled with DEBUG enabled
         //   UpdateMAMELine(EntryString, GetBooleanValue(DummyWriteSnapshot.Checked))
         //else
         // # CORE PERFORMANCE OPTIONS
         if (tmpEntryStr = 'autoframeskip ') or
            (tmpEntryStr = 'afs ') then
            UpdateMAMELine(EntryString, GetBooleanValue(AutoFrameSkip.Checked))
         else
         if (tmpEntryStr = 'frameskip ') or
            (tmpEntryStr = 'fs ') then
            UpdateMAMELine(EntryString, IntToStr(FrameSkip.ItemIndex))
         else
         if (tmpEntryStr = 'seconds_to_run ') or
            (tmpEntryStr = 'str ') then
            UpdateMAMELine(EntryString, IntToStr(SecondsToRun.Position))
         else
         if tmpEntryStr = 'throttle ' then
            UpdateMAMELine(EntryString, GetBooleanValue(Throttle.Checked))
         else
         if tmpEntryStr = 'sleep ' then
            UpdateMAMELine(EntryString, GetBooleanValue(Sleep.Checked))
         else
         if tmpEntryStr = 'speed ' then
            UpdateMAMELine(EntryString, Format('%3.2f', [Speed.Position]), True)
         else
         if (tmpEntryStr = 'refreshspeed ') or
            (tmpEntryStr = 'rs ') then
            UpdateMAMELine(EntryString, GetBooleanValue(RefreshSpeed.Checked))
         else
         if (tmpEntryStr = 'lowlatency ') or
            (tmpEntryStr = 'lolat ') then
            UpdateMAMELine(EntryString, GetBooleanValue(LowLatency.Checked))
         else
         // # CORE RENDER OPTIONS
         if (tmpEntryStr = 'keepaspect ') or
            (tmpEntryStr = 'ka') then
            UpdateMAMELine(EntryString, GetBooleanValue(KeepAspectRatio.Checked))
         else
         if (tmpEntryStr = 'unevenstretch ') or
            (tmpEntryStr = 'ues ') then
            UpdateMAMELine(EntryString, GetBooleanValue(UnevenStretch.Checked))
         else
         if (tmpEntryStr = 'unevenstretchx ') or
            (tmpEntryStr = 'uesx ') then
            UpdateMAMELine(EntryString, GetBooleanValue(UnevenStretchX.Checked))
         else
         if (tmpEntryStr = 'unevenstretchy ') or
            (tmpEntryStr = 'uesy ') then
            UpdateMAMELine(EntryString, GetBooleanValue(UnevenStretchY.Checked))
         else
         if (tmpEntryStr = 'autostretchxy ') or
            (tmpEntryStr = 'asxy ') then
            UpdateMAMELine(EntryString, GetBooleanValue(AutoUnevenStretchXY.Checked))
         else
         if (tmpEntryStr = 'intoverscan ') or
            (tmpEntryStr = 'ios') then
            UpdateMAMELine(EntryString, GetBooleanValue(IntegerScaleOverscan.Checked))
         else
         if (tmpEntryStr = 'intscalex ') or
            (tmpEntryStr = 'sx ') then
            begin
              Value:= IntegerScaleFactorHorizontal.Text;
              if Value = '' then
                 Value:= '0';
              UpdateMAMELine(EntryString, IntegerScaleFactorHorizontal.Text)
            end
         else
         if (tmpEntryStr = 'intscaley ') or
            (tmpEntryStr = 'sy ') then
            begin
              Value:= IntegerScaleFactorVertical.Text;
              if Value = '' then
                 Value:= '0';
              UpdateMAMELine(EntryString, IntegerScaleFactorVertical.Text)
            end
         else
         // # CORE ROTATION OPTIONS
         if tmpEntryStr = 'rotate ' then
            UpdateMAMELine(EntryString, GetBooleanValue(Rotate.Checked))
         else
         if tmpEntryStr = 'ror ' then
            UpdateMAMELine(EntryString, GetBooleanValue(RotateRight.Checked))
         else
         if tmpEntryStr = 'rol ' then
            UpdateMAMELine(EntryString, GetBooleanValue(RotateLeft.Checked))
         else
         if tmpEntryStr = 'autoror ' then
            UpdateMAMELine(EntryString, GetBooleanValue(AutoRotateRight.Checked))
         else
         if tmpEntryStr = 'autorol ' then
            UpdateMAMELine(EntryString, GetBooleanValue(AutoRotateLeft.Checked))
         else
         if tmpEntryStr = 'flipx ' then
            UpdateMAMELine(EntryString, GetBooleanValue(FlipX.Checked))
         else
         if tmpEntryStr = 'flipy ' then
            UpdateMAMELine(EntryString, GetBooleanValue(FlipY.Checked))
         else
         // # CORE ARTWORK OPTIONS
         if (tmpEntryStr = 'artwork_crop ') or
            (tmpEntryStr = 'artcrop ') then
            UpdateMAMELine(EntryString, GetBooleanValue(ArtworkCrop.Checked))
         else
         if (tmpEntryStr = 'use_backdrops ') or
            (tmpEntryStr = 'backdrop ') then
            UpdateMAMELine(EntryString, GetBooleanValue(ArtworkBackdrops.Checked))
         else
         if (tmpEntryStr = 'use_overlays ') or
            (tmpEntryStr = 'overlay ') then
            UpdateMAMELine(EntryString, GetBooleanValue(ArtworkOverlays.Checked))
         else
         if (tmpEntryStr = 'use_bezels ') or
            (tmpEntryStr = 'bezel ') then
            UpdateMAMELine(EntryString, GetBooleanValue(ArtworkBezels.Checked))
         else
         if (tmpEntryStr = 'use_cpanels ') or
            (tmpEntryStr = 'cpanel ') then
            UpdateMAMELine(EntryString, GetBooleanValue(ArtworkControlPanels.Checked))
         else
         if (tmpEntryStr = 'use_marquees ') or
            (tmpEntryStr = 'marquee ') then
            UpdateMAMELine(EntryString, GetBooleanValue(ArtworkMarquees.Checked))
         else
         if tmpEntryStr = 'fallback_artwork ' then
            begin
              //if SameText('default', FallbackArtwork.Text) then
              //   FallbackArtwork.Text:= '';
              UpdateMAMELine(EntryString, FallbackArtwork.Text)
            end
         else
         if tmpEntryStr = 'override_artwork ' then
            begin
              //if SameText('default', OverrideArtwork.Text) then
              //   OverrideArtwork.Text:= '';
              UpdateMAMELine(EntryString, OverrideArtwork.Text)
            end
         else
         // # CORE SCREEN OPTIONS
         if tmpEntryStr = 'brightness ' then
            UpdateMAMELine(EntryString, Format('%1.2f', [Brightness.Position]), True)
         else
         if tmpEntryStr = 'contrast ' then
            UpdateMAMELine(EntryString, Format('%1.2f', [Contrast.Position]), True)
         else
         if tmpEntryStr = 'gamma ' then
            UpdateMAMELine(EntryString, Format('%1.2f', [Gamma.Position]), True)
         else
         if tmpEntryStr = 'pause_brightness ' then
            UpdateMAMELine(EntryString, Format('%1.2f', [PauseBrightness.Position]), True)
         else
         if tmpEntryStr = 'effect ' then
            begin
              if (EffectOverlay.Text = '') or (SameText('none', EffectOverlay.Text)) then
                 UpdateMAMELine(EntryString, 'none')
              else
                 UpdateMAMELine(EntryString, EffectOverlay.Text)
            end
         else
         // # CORE VECTOR OPTIONS
         if (tmpEntryStr = 'antialias ') or
            (tmpEntryStr = 'aa ') then
            UpdateMAMELine(EntryString, GetBooleanValue(Antialias.Checked))
         else
         if tmpEntryStr = 'beam ' then
            UpdateMAMELine(EntryString, Format('%2.2f', [VectorBeamWidthMin.Position]), True)
         else
         if tmpEntryStr = 'beam_width_min ' then
            UpdateMAMELine(EntryString, Format('%2.2f', [VectorBeamWidthMin.Position]), True)
         else
         if tmpEntryStr = 'beam_width_max ' then
            UpdateMAMELine(EntryString, Format('%2.2f', [VectorBeamWidthMax.Position]), True)
         else
         if tmpEntryStr = 'beam_dot_size ' then
            UpdateMAMELine(EntryString, Format('%2.2f', [VectorBeamDotSize.Position]), True)
         else
         if tmpEntryStr = 'beam_intensity_weight ' then
            UpdateMAMELine(EntryString, Format('%1.2f', [VectorBeamIntensityWeight.Position]), True)
         else
         if tmpEntryStr = 'flicker ' then
            UpdateMAMELine(EntryString, Format('%3.2f', [VectorFlickerEffect.Position]), True)
         else
         // # CORE SOUND OPTIONS
         if tmpEntryStr = 'sound ' then
            begin
              if SoundOutputMethod.Tag = 0 then
                 begin
                   case SoundOutputMethod.ItemIndex of
                     0: Value:= 'auto';
                     1: Value:= 'dsound';
                     2: Value:= 'xaudio2';
                     3: Value:= 'sdl';
                     4: Value:= 'portaudio';
                     5: Value:= 'none';
                   end;

                   //case IsSDLMAME of
                   //  True:
                   //    begin
                   //      case SoundOutputMethod.ItemIndex of
                   //        0: Value:= 'auto';
                   //        1: Value:= 'dsound';
                   //        2: Value:= 'xaudio2';
                   //        3: Value:= 'sdl';
                   //        4: Value:= 'portaudio';
                   //        5: Value:= 'none';
                   //      end;
                   //    end;
                   //  False:
                   //    begin
                   //      case SoundOutputMethod.ItemIndex of
                   //        0: Value:= 'auto';
                   //        1: Value:= 'dsound';
                   //        2: Value:= 'xaudio2';
                   //        3: Value:= 'none';
                   //      end;
                   //    end;
                   //end;
                 end
              else
                 begin
                   // for MAME 0.153 and older... and older HBMAME
                   case SoundOutputMethod.ItemIndex of
                     0, 1: Value:= '1'; // auto, enabled
                     2: Value:= '0'; // none, disabled
                   end;
                 end;
              UpdateMAMELine(EntryString, Value);
            end
         else
         // PortAudio settings
         if tmpEntryStr = 'pa_api ' then
            begin
              Value:= PortAudioAPI.Text;
              if Value = '' then
                 Value:= 'none';
              UpdateMAMELine(EntryString, Value);
            end
         else
         if tmpEntryStr = 'pa_device ' then
            begin
              Value:= PortAudioDevice.Text;
              if Value = '' then
                 Value:= 'none';
              UpdateMAMELine(EntryString, Value);
            end
         else
         if tmpEntryStr = 'pa_latency ' then
            begin
              Value:= PortAudioLatency.Text;
              if Value = '' then
                 Value:= '0';
              UpdateMAMELine(EntryString, Value);
            end
         else
         if (tmpEntryStr = 'samplerate ') or
            (tmpEntryStr = 'sr ') then
            begin
              Value:= '48000'; // default value
              case SampleRate.ItemIndex of
                0: Value:= '11025';
                1: Value:= '22050';
                2: Value:= '44100';
                3: Value:= '48000';
                4: Value:= '96000';
                5: Value:= '192000';
              end;
              UpdateMAMELine(EntryString, Value);
            end
         else
         if tmpEntryStr = 'samples ' then
            UpdateMAMELine(EntryString, GetBooleanValue(Samples.Checked))
         else
         if tmpEntryStr = 'compressor ' then
            UpdateMAMELine(EntryString, GetBooleanValue(AudioUseCompressor.Checked))
         else
         if (tmpEntryStr = 'volume ') or
            (tmpEntryStr = 'vol ') then
            UpdateMAMELine(EntryString, IntToStr(Volume.Position))
         else
         if tmpEntryStr = 'speaker_report ' then
            begin
              if SpeakerReport.ItemIndex = -1 then
                 SpeakerReport.ItemIndex:= 0;
              UpdateMAMELine(EntryString, IntToStr(SpeakerReport.ItemIndex))
            end
         else
         // # CORE INPUT OPTIONS
         if (tmpEntryStr = 'coin_lockout ') or
            (tmpEntryStr = 'coinlock ') then
            UpdateMAMELine(EntryString, GetBooleanValue(CoinLockout.Checked))
         else
         if tmpEntryStr = 'ctrlr ' then
            begin
              if ControllerDefinitions.ItemIndex = 0 then
                 UpdateMAMELine(EntryString, '')
              else
                 UpdateMAMELine(EntryString, ControllerDefinitions.Text);
            end
         else
         if tmpEntryStr = 'mouse ' then
            UpdateMAMELine(EntryString, GetBooleanValue(Mouse.Checked))
         else
         if (tmpEntryStr = 'joystick ') or
            (tmpEntryStr = 'joy ') then
            UpdateMAMELine(EntryString, GetBooleanValue(Joystick.Checked))
         else
         if (tmpEntryStr = 'lightgun ') or
            (tmpEntryStr = 'gun ') then
            UpdateMAMELine(EntryString, GetBooleanValue(Lightgun.Checked))
         else
         if (tmpEntryStr = 'multikeyboard ') or
            (tmpEntryStr = 'multikey ') then
            UpdateMAMELine(EntryString, GetBooleanValue(MultiKeyboard.Checked))
         else
         if tmpEntryStr = 'multimouse ' then
            UpdateMAMELine(EntryString, GetBooleanValue(MultiMouse.Checked))
         else
         if (tmpEntryStr = 'steadykey ') or
            (tmpEntryStr = 'steady ') then
            UpdateMAMELine(EntryString, GetBooleanValue(SteadyKey.Checked))
         else
         if tmpEntryStr = 'ui_active ' then
            UpdateMAMELine(EntryString, GetBooleanValue(UIActive.Checked))
         else
         if (tmpEntryStr = 'offscreen_reload ') or
            (tmpEntryStr = 'reload ') then
            UpdateMAMELine(EntryString, GetBooleanValue(LightgunOffScreenReload.Checked))
         else
         //if (tmpEntryStr = 'joystick_map ') or
         //   (tmpEntryStr = 'joymap ') then
         //   begin
         //     if JoystickMap.ItemIndex = 1 then
         //        UpdateMAMELine(EntryString, JoystickMapCustom.Text)
         //     else
         //        UpdateMAMELine(EntryString, LowerCase(JoystickMap.Text));
         //   end
         //else
         if (tmpEntryStr = 'joystick_deadzone ') or
            (tmpEntryStr = 'joy_deadzone ') or
            (tmpEntryStr = 'jdz ') then
            UpdateMAMELine(EntryString, Format('%1.2f', [JoystickDeadzone.Position]), True)
         else
         if (tmpEntryStr = 'joystick_saturation ') or
            (tmpEntryStr = 'joy_saturation ') or
            (tmpEntryStr = 'jsat ') then
            UpdateMAMELine(EntryString, Format('%1.2f', [JoystickSaturation.Position]), True)
         else
         if (tmpEntryStr = 'natural ') or
            (tmpEntryStr = 'nat ') then
            UpdateMAMELine(EntryString, GetBooleanValue(NaturalKeyboard.Checked))
         else
         if tmpEntryStr = 'joystick_contradictory ' then
            UpdateMAMELine(EntryString, GetBooleanValue(JoystickContradictory.Checked))
         else
         if tmpEntryStr = 'coin_impulse ' then
            UpdateMAMELine(EntryString, IntToStr(CoinImpulse.ItemIndex-1))
         else
         if ((tmpEntryStr = 'uimodekey ') or
            (tmpEntryStr = 'umk ')) then
            UpdateMAMELine(EntryString, UIModeKeyCustom.Text)
         else
         // # CORE INPUT AUTOMATIC ENABLE OPTIONS
         if (tmpEntryStr = 'paddle_device ') or
            (tmpEntryStr = 'paddle ') then
            UpdateMAMELine(EntryString, LowerCase(Analog_Paddle.Text))
         else
         if (tmpEntryStr = 'adstick_device ') or
            (tmpEntryStr = 'adstick ') then
            UpdateMAMELine(EntryString, LowerCase(Analog_Joystick.Text))
         else
         if (tmpEntryStr = 'pedal_device ') or
            (tmpEntryStr = 'pedal ') then
            UpdateMAMELine(EntryString, LowerCase(Analog_Pedal.Text))
         else
         if (tmpEntryStr = 'dial_device ') or
            (tmpEntryStr = 'dial ') then
            UpdateMAMELine(EntryString, LowerCase(Analog_Dial.Text))
         else
         if (tmpEntryStr = 'trackball_device ') or
            (tmpEntryStr = 'trackball ') then
            UpdateMAMELine(EntryString, LowerCase(Analog_Trackball.Text))
         else
         if tmpEntryStr = 'lightgun_device ' then
            UpdateMAMELine(EntryString, LowerCase(Analog_LightGun.Text))
         else
         if tmpEntryStr = 'positional_device ' then
            UpdateMAMELine(EntryString, LowerCase(Analog_Positional.Text))
         else
         if tmpEntryStr = 'mouse_device ' then
            UpdateMAMELine(EntryString, LowerCase(Analog_Mouse.Text))
         else
         // # CORE DEBUGGING OPTIONS
         if tmpEntryStr = 'log ' then
            UpdateMAMELine(EntryString, GetBooleanValue(Log.Checked))
         else
         if (tmpEntryStr = 'verbose ') or
            (tmpEntryStr = 'v ') then
            UpdateMAMELine(EntryString, GetBooleanValue(Verbose.Checked))
         else
         if tmpEntryStr = 'update_in_pause ' then
            UpdateMAMELine(EntryString, GetBooleanValue(UpdateInPause.Checked))
         else
         if (tmpEntryStr = 'debug ') or
            (tmpEntryStr = 'd ') then
            UpdateMAMELine(EntryString, GetBooleanValue(DebuggerEnable.Checked))
         else
         if tmpEntryStr = 'debugscript ' then
            UpdateMAMELine('debugscript', DebuggerScript.Text)
         else
         if tmpEntryStr = 'debuglog ' then
            UpdateMAMELine(EntryString, GetBooleanValue(DebugLogConsole.Checked))
         else
         if tmpEntryStr = 'debugger ' then
            begin
              //Auto
              //Internal
              //Windows  (QT for SDLMAME)
              //None
              Value:= 'auto';
              case Debugger.ItemIndex of
                0: Value:= 'auto';
                1: Value:= 'internal';
                2:
                  begin
                    case IsSDLMAME of
                      True : Value:= 'qt';
                      False: Value:= 'windows';
                    end;
                  end;
                3: Value:= 'none';
              end;
              UpdateMAMELine(EntryString, Value);
            end
         else
         if (tmpEntryStr = 'debug_internal ') or
            (tmpEntryStr = 'di ') then // for MAME 0.153 and older and older HBMAME
            begin
              Value:= '0';
              case Debugger.ItemIndex of
                0, 3: Value:= '0';
                1, 2: Value:= '1';
              end;
              UpdateMAMELine(EntryString, Value);
            end
         else
         if tmpEntryStr = 'debugger_port ' then
            begin
              if DebuggerPort.Text = '' then
                 DebuggerPortButtonReset.Click;
              UpdateMAMELine(EntryString, DebuggerPort.Text)
            end
         else
         if (tmpEntryStr = 'debugger_font ') or
            (tmpEntryStr = 'dfont ') then
            begin
              Value:= DebuggerFont.Font.Name;
              if Value = 'Lucida Console' then
                 Value:= 'auto';
              UpdateMAMELine(EntryString, Value);
            end
         else
         if (tmpEntryStr = 'debugger_font_size ') or
            (tmpEntryStr = 'dfontsize ') then
            begin
              UpdateMAMELine(EntryString, IntToStr(DebuggerFontSize.Position));
            end
         else
         //# CORE COMM OPTIONS
         if tmpEntryStr = 'comm_localhost ' then
            UpdateMAMELine(EntryString, CommLocalHost.Text)
         else
         if tmpEntryStr = 'comm_localport ' then
            UpdateMAMELine(EntryString, CommLocalPort.Text)
         else
         if tmpEntryStr = 'comm_remotehost ' then
            UpdateMAMELine(EntryString, CommRemoteHost.Text)
         else
         if tmpEntryStr = 'comm_remoteport ' then
            UpdateMAMELine(EntryString, CommRemotePort.Text)
         else
         if tmpEntryStr = 'comm_framesync ' then
            UpdateMAMELine(EntryString, GetBooleanValue(CommSyncFrame.Checked))
         else
         // # CORE MISC OPTIONS
         if tmpEntryStr = 'drc ' then
            UpdateMAMELine(EntryString, GetBooleanValue(DRC.Checked))
         else
         if tmpEntryStr = 'drc_use_c ' then
            UpdateMAMELine(EntryString, GetBooleanValue(DRCUseC.Checked))
         else
         if tmpEntryStr = 'drc_log_uml ' then
            UpdateMAMELine(EntryString, GetBooleanValue(DRCLogUML.Checked))
         else
         if tmpEntryStr = 'drc_log_native ' then
            UpdateMAMELine(EntryString, GetBooleanValue(DRCLogNative.Checked))
         else
         if tmpEntryStr = 'bios ' then
            begin
              Value:= '';
              if FormMain.CheckSelected(BiosSetsListView) then
                 Value:= BiosSetsListView.Selection.First.Captions[1];
              UpdateMAMELine(EntryString, Value);
            end
         else
         if (tmpEntryStr = 'cheat ') or
            (tmpEntryStr = 'c ') then
            UpdateMAMELine(EntryString, GetBooleanValue(Cheat.Checked))
         else
         if tmpEntryStr = 'ui ' then
            begin
              Value:= LowerCase(TypeUserInterface.Text);
              if Value = '' then
                 Value:= 'cabinet';
              UpdateMAMELine(EntryString, Value);
            end
         else
         if tmpEntryStr = 'skip_gameinfo ' then
            UpdateMAMELine(EntryString, GetBooleanValue(SkipGameInfo.Checked))
         else
         if tmpEntryStr = 'skip_mandatory_fileman ' then
            UpdateMAMELine(EntryString, GetBooleanValue(SkipMandatoryFileMan.Checked))
         else
         if tmpEntryStr = 'uifont ' then
            begin
              FormMain.FixEmptyValue(UIFont, 'default');
              UpdateMAMELine(EntryString, UIFont.Text);
            end
         else
         if (tmpEntryStr = 'ramsize ') or
            (tmpEntryStr = 'ram ') then
            begin
              Value:= RAMSize.Text;
              if SameText('(Use Default)', Value) then
                 Value:= '';         
              UpdateMAMELine(EntryString, Value);
            end
         else
         if tmpEntryStr = 'confirm_quit ' then
            UpdateMAMELine(EntryString, GetBooleanValue(ConfirmQuit.Checked))
         else
         if tmpEntryStr = 'ui_mouse ' then
            UpdateMAMELine(EntryString, GetBooleanValue(UIMouse.Checked))
         else
         // # SCRIPTING OPTIONS
         if (tmpEntryStr = 'autoboot_command ') or
            (tmpEntryStr = 'ab ') then
            UpdateMAMELine(EntryString, AutobootCommand.Text)
         else
         if tmpEntryStr = 'autoboot_delay ' then
            UpdateMAMELine(EntryString, IntToStr(AutobootDelay.Position))
         else
         if (tmpEntryStr = 'autoboot_script ') or
            (tmpEntryStr = 'script ') then
            UpdateMAMELine(EntryString, AutobootLuaScript.Text)
         else
         if tmpEntryStr = 'console ' then
            UpdateMAMELine(EntryString, GetBooleanValue(EnableEmulatorLUAConsole.Checked))
         else
         if tmpEntryStr = 'plugins ' then
            UpdateMAMELine(EntryString, GetBooleanValue(EnableLUAPluginSupport.Checked))
         else
         if tmpEntryStr = 'plugin ' then
            begin
              if FormMAMESettings.Tag = 1 then
                 begin
                   // list of plugins to enable... separated by comma (  ,  )
                   // only used for custom game/machine settings!!!
                   // emulator default settings store list in "plugin.ini" file!!!
                   Value:= '';
                   if FormMain.CheckTotal(LUAPluginsToEnable) then
                   begin
                     for LoopPlugin:= 0 to LUAPluginsToEnable.Items.Count-1 do
                     begin
                       if LUAPluginsToEnable.Items[LoopPlugin].Checked then
                       begin
                         if Value <> '' then
                            Value:= Value+',';
                         Value:= Value+LUAPluginsToEnable.Items[LoopPlugin].Captions[1];
                       end;
                     end;
                     UpdateMAMELine(EntryString, Value);
                   end;
                 end;
            end
         else
         // disabled for now...
         //if tmpEntryStr = 'noplugin ' then
         //   begin
         //     // list of plugins to disable... separated by comma (  ,  )
         //   end
         //else
         // # HTTP SERVER OPTIONS
         if tmpEntryStr = 'http ' then
            UpdateMAMELine(EntryString, GetBooleanValue(HTTPServer.Checked))
         else
         if tmpEntryStr = 'http_port ' then
            UpdateMAMELine(EntryString, HTTPPort.Text)
         else
         if (tmpEntryStr = 'http_root ') or
            (tmpEntryStr = 'http_path ') then
            UpdateMAMELine(EntryString, HTTPPath.Text)
         else
         if (tmpEntryStr = 'language ') or
            (tmpEntryStr = 'lang ') then
            begin
              if FormMain.CheckSelected(DisplayLanguageList) then
                 begin
                   Value:= DisplayLanguageList.Selection.First.Caption;
                   if Value = '' then
                      Value:= 'English'
                   else
                   if (PosEx(' ', Value) <> 0) then
                      Value:= '"'+Value+'"';
                 end
              else
                 Value:= 'English';

              UpdateMAMELine(EntryString, Value);
            end
         else
         if (tmpEntryStr = 'nvram_save ') or
            (tmpEntryStr = 'nvwrite ') then
            UpdateMAMELine(EntryString, GetBooleanValue(SaveNVRAMOnExit.Checked))
         else
         if tmpEntryStr = 'uifontprovider ' then
            begin
              Value:= 'auto';
              case UIFontProvider.ItemIndex of
                0: Value:= 'auto';
                1: Value:= 'none';
                2: Value:= 'win';
                3: Value:= 'sdl';
                4: Value:= 'osx';
              end;
              UpdateMAMELine(EntryString, Value)
            end
         else

         // # OSD OUTPUT OPTIONS
         if tmpEntryStr = 'output ' then
            begin
              Value:= 'auto';
              case OSDOutputProvider.ItemIndex of
                0: Value:= 'auto';
                1: Value:= 'console';
                2: Value:= 'network';
                3: Value:= 'windows';
                4: Value:= 'none';
              end;
              UpdateMAMELine(EntryString, Value);
            end
         else
         
         // # OSD INPUT OPTIONS
         if tmpEntryStr = 'keyboardprovider ' then
            begin
              Value:= 'auto';
              case OSDInputKeyboardProvider.ItemIndex of
                0: Value:= 'auto';
                1: Value:= 'rawinput';
                2: Value:= 'dinput';
                3: Value:= 'win32';
                4: Value:= 'uwp'; // for Windows 10
                5: Value:= 'none';
              end;
              UpdateMAMELine(EntryString, Value);
            end
         else
         if tmpEntryStr = 'mouseprovider ' then
            begin
              Value:= 'auto';
              case OSDInputMouseProvider.ItemIndex of
                0: Value:= 'auto';
                1: Value:= 'rawinput';
                2: Value:= 'dinput';
                3: Value:= 'win32';
                4: Value:= 'none';
              end;
              UpdateMAMELine(EntryString, Value);
            end
         else
         if tmpEntryStr = 'lightgunprovider ' then
            begin
              Value:= 'auto';
              case OSDInputLightgunProvider.ItemIndex of
                0: Value:= 'auto';
                1: Value:= 'win32';
                2: Value:= 'none';
              end;
              UpdateMAMELine(EntryString, Value);
            end
         else
         if tmpEntryStr = 'joystickprovider ' then
            begin
              Value:= 'auto';
              case OSDInputJoystickProvider.ItemIndex of
                0: Value:= 'auto';
                1: Value:= 'dinput';
                2: Value:= 'xinput';
                3: Value:= 'winhybrid';
                4: Value:= 'uwp'; // for Windows 10
                5: Value:= 'none';
              end;
              UpdateMAMELine(EntryString, Value);
            end
         else

         // # WINDOWS DEBUGGING OPTIONS
         if tmpEntryStr = 'oslog ' then
            UpdateMAMELine(EntryString, GetBooleanValue(OSLog.Checked))
         else
         if (tmpEntryStr = 'watchdog ') or
            (tmpEntryStr = 'wdog ') then
            begin
              if Watchdog.Text = '' then
                 Watchdog.Text:= '0';
              UpdateMAMELine(EntryString, Watchdog.Text);
            end
         else
         // # WINDOWS PERFORMANCE OPTIONS
         if tmpEntryStr = 'priority ' then
            UpdateMAMELine(EntryString, IntToStr(ThreadPriority.ItemIndex-15))
         else
         if (tmpEntryStr = 'multithreading ') or
            (tmpEntryStr = 'mt ') then
            UpdateMAMELine(EntryString, IntToStr(Ord(Multithreading.Checked)))
         else
         if (tmpEntryStr = 'numprocessors ') or
            (tmpEntryStr = 'np ') then
            begin
              if ((NumberProcessors.ItemIndex = 0) or
                  (NumberProcessors.ItemIndex = -1)) then
                  UpdateMAMELine(EntryString, 'auto')
              else
                  UpdateMAMELine(EntryString, IntToStr(NumberProcessors.ItemIndex));
            end
         else
         if tmpEntryStr = 'sdlvideofps ' then // SDLMAME
            UpdateMAMELine(EntryString, GetBooleanValue(SDLVideoPerformance.Checked))
         else
         if tmpEntryStr = 'bench ' then
            UpdateMAMELine(EntryString, IntToStr(Benchmark.Position))
         else
         //if tmpEntryStr = 'profile ' then
         //   begin
         //
         //   end
         //else
         // # WINDOWS VIDEO OPTIONS
         if tmpEntryStr = 'menu ' then
            UpdateMAMELine(EntryString, IntToStr(Ord(EnableMenuBar.Checked)))
         else
         if tmpEntryStr = 'attach_window ' then
            UpdateMAMELine(EntryString, AttachWindow.Text)
         else
         if tmpEntryStr = 'video ' then
            begin
              Value:= 'auto';
              case IsSDLMAME of
                True:
                  begin
                    //Value:= 'soft';
                    case VideoOutputMode.ItemIndex of
                      0: Value:= 'auto';
                      1: Value:= 'soft';
                      2: Value:= 'opengl';
                      3: Value:= 'accel';
                      4: Value:= 'bgfx';
                      5: Value:= 'none';
                    end;
                  end;
                False:
                  begin
                    //Value:= 'd3d';
                    case VideoOutputMode.ItemIndex of
                      0: Value:= 'auto';
                      1: Value:= 'gdi';
                      2: Value:= 'ddraw';
                      3: Value:= 'd3d';
                      4: Value:= 'opengl';
                      5: Value:= 'bgfx';
                      6: Value:= 'none';
                    end;
                  end;
              end;
              UpdateMAMELine(EntryString, Value);
            end
         else
         if tmpEntryStr = 'numscreens ' then
            UpdateMAMELine(EntryString, IntToStr(NumberScreens.Position))
         else
         if (tmpEntryStr = 'window ') or
            (tmpEntryStr = 'w ') then
            UpdateMAMELine(EntryString, GetBooleanValue(WindowMode.Checked))
         else
         if (tmpEntryStr = 'maximize ') or
            (tmpEntryStr = 'max ') then
            UpdateMAMELine(EntryString, GetBooleanValue(MaximizeWindow.Checked))
         else
         if tmpEntryStr = 'centerh ' then // SDLMAME
            UpdateMAMELine(EntryString, GetBooleanValue(SDLCenterHorizontally.Checked))
         else
         if tmpEntryStr = 'centerv ' then // SDLMAME
            UpdateMAMELine(EntryString, GetBooleanValue(SDLCenterVertically.Checked))
         else
         if tmpEntryStr = 'prescale ' then
            UpdateMAMELine(EntryString, IntToStr(Prescale_ScaleScreen.Position))
         else
         if (tmpEntryStr = 'waitvsync ') or
            (tmpEntryStr = 'vs ') then
            UpdateMAMELine(EntryString, GetBooleanValue(WaitVerticalSync.Checked))
         else
         if (tmpEntryStr = 'syncrefresh ') or
            (tmpEntryStr = 'srf ') then
            UpdateMAMELine(EntryString, GetBooleanValue(SyncronizeRefreshRate.Checked))
         else
         if tmpEntryStr = 'monitorprovider ' then
            begin
              Value:= MonitorProvider.Text;
              if Value = '' then
                 Value:= 'auto';
              UpdateMAMELine(EntryString, LowerCase(Value));
            end
         else
         if (tmpEntryStr = 'scalemode ') or // SDLMAME
            (tmpEntryStr = 'sm ') then // SDLMAME
            begin
              Value:= 'none';
              case SDLScaleMode.ItemIndex of
                0: Value:= 'none';
                1: Value:= 'async';
                2: Value:= 'yv12';
                3: Value:= 'yuy2';
                4: Value:= 'yv12x2';
                5: Value:= 'yuy2x2';
                6: Value:= 'hwblit'; // SDL 2 only
                7: Value:= 'hwbest'; // SDL 2 only
              end;
              UpdateMAMELine(EntryString, Value);
            end
         else
         //// # DIRECTDRAW-SPECIFIC OPTIONS
         //if (tmpEntryStr = 'hwstretch ') or
         //   (tmpEntryStr = 'hws ') then
         //   UpdateMAMELine(EntryString, GetBooleanValue(HardwareStretch.Checked))
         //else
         // # DIRECT3D-SPECIFIC OPTIONS
         if (tmpEntryStr = 'filter ') or
            (tmpEntryStr = 'd3dfilter ') or
            (tmpEntryStr = 'flt ') or // D3D for Windows MAME / OpenGL for SDLMAME
            (tmpEntryStr = 'glfilter ') then // for OpenGL
            UpdateMAMELine(EntryString, GetBooleanValue(BilinearFilter.Checked))
         else
         // # DIRECT3D POST-PROCESSING OPTIONS
         if tmpEntryStr = 'hlsl_enable ' then
            UpdateMAMELine(EntryString, GetBooleanValue(HLSLEnable.Checked))
         else
         if tmpEntryStr = 'hlsl_oversampling ' then
            UpdateMAMELine(EntryString, GetBooleanValue(HLSLOversampling.Checked))
         else
         if tmpEntryStr = 'hlslpath ' then
            UpdateMAMELine(EntryString, HLSLPath.Text)
         else
         if tmpEntryStr = 'shadow_mask_texture ' then
            UpdateMAMELine(EntryString, ShadowMaskTexture.Text)
         else
         if tmpEntryStr = 'yiq_enable ' then
            UpdateMAMELine(EntryString, GetBooleanValue(YIQEnable.Checked))
         else
         if (tmpEntryStr = 'vector_beam_smooth') or
            (tmpEntryStr = 'vecsmooth') then
            UpdateMAMELine(EntryString, Format('%1.2f', [VectorBeamSmooth.Position]), True)
         else
         if (EntryString = 'vector_length_scale') or
            (EntryString = 'vecscale') then
            UpdateMAMELine(EntryString, Format('%1.2f', [VectorMaximumAttenuation.Position]), True)
         else
         if (EntryString = 'vector_length_ratio') or
            (EntryString = 'vecratio') then
            UpdateMAMELine(EntryString, Format('%1.3f', [VectorMinimumLengthAttenuation.Position]), True)
         else
         //if tmpEntryStr = 'hlsl_prescale_x ' then
         //   UpdateMAMELine(EntryString, IntToStr(HLSLPrescaleOverrideX.ItemIndex))
         //else
         //if tmpEntryStr = 'hlsl_prescale_y ' then
         //   UpdateMAMELine(EntryString, IntToStr(HLSLPrescaleOverrideY.ItemIndex))
         //else
         //if tmpEntryStr = 'hlsl_preset ' then
         //   UpdateMAMELine(EntryString, IntToStr(HLSLPresetToUse.ItemIndex-1))
         //else
         if tmpEntryStr = 'hlsl_snap_width ' then
            UpdateMAMELine(EntryString, HLSLUpscaleSnapX.Text)
         else
         if tmpEntryStr = 'hlsl_snap_height ' then
            UpdateMAMELine(EntryString, HLSLUpscaleSnapY.Text)
         else
         if tmpEntryStr = 'shadow_mask_tile_mode ' then
            UpdateMAMELine(EntryString, IntToStr(ShadowMaskTileMode.ItemIndex))
         else
         if tmpEntryStr = 'bloom_blend_mode ' then
            UpdateMAMELine(EntryString, IntToStr(BloomBlendMode.ItemIndex))
         else
         if tmpEntryStr = 'lut_texture ' then
            UpdateMAMELine(EntryString, BloomLUTTextureScreen.Text)
         else
         if tmpEntryStr = 'lut_enable ' then
            UpdateMAMELine(EntryString, GetBooleanValue(BloomLUTEnabled.Checked))
         else
         if tmpEntryStr = 'ui_lut_texture ' then
            UpdateMAMELine(EntryString, BloomLUTTextureUI.Text)
         else
         if tmpEntryStr = 'ui_lut_enable ' then
            UpdateMAMELine(EntryString, GetBooleanValue(BloomLOOTUIEnabled.Checked))
         else
         if tmpEntryStr = 'hlsl_ini_read ' then // for MAME 0.149
            UpdateMAMELine(EntryString, GetBooleanValue(ReadCustomHLSLFile.Checked))
         else
         if tmpEntryStr = 'hlsl_ini_write ' then // for MAME 0.149
            UpdateMAMELine(EntryString, GetBooleanValue(WriteCustomHLSLFile.Checked))
         else
         if tmpEntryStr = 'hlslini ' then // for MAME 0.149
            UpdateMAMELine(EntryString, HLSLIniFile.Text)
         else

         // # OpenGL-SPECIFIC OPTIONS... for SDLMAME
         if tmpEntryStr = 'gl_forcepow2texture ' then
            UpdateMAMELine(EntryString, GetBooleanValue(OpenGLForcePowerTwoTextures.Checked)) // for old video cards
         else
         if tmpEntryStr = 'gl_notexturerect ' then
            UpdateMAMELine(EntryString, GetBooleanValue(OpenGLDisableUseGL_ARBTextureRectangle.Checked)) // for old video cards
         else
         if tmpEntryStr = 'gl_vbo ' then
            UpdateMAMELine(EntryString, GetBooleanValue(EnableOpenGL_VBO.Checked))
         else
         if tmpEntryStr = 'gl_pbo ' then
            UpdateMAMELine(EntryString, GetBooleanValue(EnableOpenGL_PBO.Checked))
         else
         if tmpEntryStr = 'gl_glsl ' then
            UpdateMAMELine(EntryString, GetBooleanValue(EnableGLSL.Checked))
         else
         if tmpEntryStr = 'gl_glsl_filter ' then
            UpdateMAMELine(EntryString, GetBooleanValue(EnableOpenGLFilterNotFF.Checked))
         else
         if tmpEntryStr = 'glsl_shader_mame0 ' then
            UpdateMAMELine(EntryString, SetGLSLShader(GLSL_Shader_MAME0))
         else
         if tmpEntryStr = 'glsl_shader_mame1 ' then
            UpdateMAMELine(EntryString, SetGLSLShader(GLSL_Shader_MAME1))
         else
         if tmpEntryStr = 'glsl_shader_mame2 ' then
            UpdateMAMELine(EntryString, SetGLSLShader(GLSL_Shader_MAME2))
         else
         if tmpEntryStr = 'glsl_shader_mame3 ' then
            UpdateMAMELine(EntryString, SetGLSLShader(GLSL_Shader_MAME3))
         else
         if tmpEntryStr = 'glsl_shader_mame4 ' then
            UpdateMAMELine(EntryString, SetGLSLShader(GLSL_Shader_MAME4))
         else
         if tmpEntryStr = 'glsl_shader_mame5 ' then
            UpdateMAMELine(EntryString, SetGLSLShader(GLSL_Shader_MAME5))
         else
         if tmpEntryStr = 'glsl_shader_mame6 ' then
            UpdateMAMELine(EntryString, SetGLSLShader(GLSL_Shader_MAME6))
         else
         if tmpEntryStr = 'glsl_shader_mame7 ' then
            UpdateMAMELine(EntryString, SetGLSLShader(GLSL_Shader_MAME7))
         else
         if tmpEntryStr = 'glsl_shader_mame8 ' then
            UpdateMAMELine(EntryString, SetGLSLShader(GLSL_Shader_MAME8))
         else
         if tmpEntryStr = 'glsl_shader_mame9 ' then
            UpdateMAMELine(EntryString, SetGLSLShader(GLSL_Shader_MAME9))
         else
         if tmpEntryStr = 'glsl_shader_screen0 ' then
            UpdateMAMELine(EntryString, SetGLSLShader(GLSL_Shader_Screen0))
         else
         if tmpEntryStr = 'glsl_shader_screen1 ' then
            UpdateMAMELine(EntryString, SetGLSLShader(GLSL_Shader_Screen1))
         else
         if tmpEntryStr = 'glsl_shader_screen2 ' then
            UpdateMAMELine(EntryString, SetGLSLShader(GLSL_Shader_Screen2))
         else
         if tmpEntryStr = 'glsl_shader_screen3 ' then
            UpdateMAMELine(EntryString, SetGLSLShader(GLSL_Shader_Screen3))
         else
         if tmpEntryStr = 'glsl_shader_screen4 ' then
            UpdateMAMELine(EntryString, SetGLSLShader(GLSL_Shader_Screen4))
         else
         if tmpEntryStr = 'glsl_shader_screen5 ' then
            UpdateMAMELine(EntryString, SetGLSLShader(GLSL_Shader_Screen5))
         else
         if tmpEntryStr = 'glsl_shader_screen6 ' then
            UpdateMAMELine(EntryString, SetGLSLShader(GLSL_Shader_Screen6))
         else
         if tmpEntryStr = 'glsl_shader_screen7 ' then
            UpdateMAMELine(EntryString, SetGLSLShader(GLSL_Shader_Screen7))
         else
         if tmpEntryStr = 'glsl_shader_screen8 ' then
            UpdateMAMELine(EntryString, SetGLSLShader(GLSL_Shader_Screen8))
         else
         if tmpEntryStr = 'glsl_shader_screen9 ' then
            UpdateMAMELine(EntryString, SetGLSLShader(GLSL_Shader_Screen9))
         else

         // # PER-WINDOW VIDEO OPTIONS
         if tmpEntryStr = 'screen ' then
            UpdateMAMELine(EntryString, ScreenDetails[-1].eScreenName)
         else
         if (tmpEntryStr = 'aspect ') or
            (tmpEntryStr = 'screen_aspect') then
            UpdateMAMELine(EntryString, ScreenDetails[-1].eScreenAspectRatio)
         else
         if (tmpEntryStr = 'resolution ') or
            (tmpEntryStr = 'r ') then
            SetScreenResolution(-1, EntryString)
         else
         if tmpEntryStr = 'view ' then
            begin
              FixScreenViewNameWrite(-1);
              UpdateMAMELine(EntryString, ScreenDetails[-1].eScreenView);
            end
         else

         if tmpEntryStr = 'screen0 ' then
            UpdateMAMELine(EntryString, ScreenDetails[0].eScreenName)
         else
         if tmpEntryStr = 'aspect0 ' then
            UpdateMAMELine(EntryString, ScreenDetails[0].eScreenAspectRatio)
         else
         if (tmpEntryStr = 'resolution0 ') or
            (tmpEntryStr = 'r0 ') then
            SetScreenResolution(0, EntryString)
         else
         if tmpEntryStr = 'view0 ' then
            UpdateMAMELine(EntryString, ScreenDetails[0].eScreenView)
         else
         if tmpEntryStr = 'screen1 ' then
            UpdateMAMELine(EntryString, ScreenDetails[1].eScreenName)
         else
         if tmpEntryStr = 'aspect1 ' then
            UpdateMAMELine(EntryString, ScreenDetails[1].eScreenAspectRatio)
         else
         if (tmpEntryStr = 'resolution1 ') or
            (tmpEntryStr = 'r1 ') then
            SetScreenResolution(1, EntryString)
         else
         if tmpEntryStr = 'view1 ' then
            UpdateMAMELine(EntryString, ScreenDetails[1].eScreenView)
         else
         if tmpEntryStr = 'screen2 ' then
            UpdateMAMELine(EntryString, ScreenDetails[2].eScreenName)
         else
         if tmpEntryStr = 'aspect2 ' then
            UpdateMAMELine(EntryString, ScreenDetails[2].eScreenAspectRatio)
         else
         if (tmpEntryStr = 'resolution2 ') or
            (tmpEntryStr = 'r2 ') then
            SetScreenResolution(2, EntryString)
         else
         if tmpEntryStr = 'view2 ' then
            UpdateMAMELine(EntryString, ScreenDetails[2].eScreenView)
         else
         if tmpEntryStr = 'screen3 ' then
            UpdateMAMELine(EntryString, ScreenDetails[3].eScreenName)
         else
         if tmpEntryStr = 'aspect3 ' then
            UpdateMAMELine(EntryString, ScreenDetails[3].eScreenAspectRatio)
         else
         if (tmpEntryStr = 'resolution3 ') or
            (tmpEntryStr = 'r3 ') then
            SetScreenResolution(3, EntryString)
         else
         if tmpEntryStr = 'view3 ' then
            UpdateMAMELine(EntryString, ScreenDetails[3].eScreenView)
         else
         // # FULL SCREEN OPTIONS
         if (tmpEntryStr = 'triplebuffer ') or
            (tmpEntryStr = 'tb ') then
            UpdateMAMELine(EntryString, GetBooleanValue(TripleBuffer.Checked))
         else
         if tmpEntryStr = 'switchres ' then
            UpdateMAMELine(EntryString, GetBooleanValue(SwitchResolution.Checked))
         else

         if (tmpEntryStr = 'full_screen_brightness ') or
            (tmpEntryStr = 'fsb ') then
            UpdateMAMELine(EntryString, Format('%1.2f', [FullScreenBrightness.Position]), True)
         else
         if (tmpEntryStr = 'full_screen_contrast ') or
            (tmpEntryStr = 'fsc ') then
            UpdateMAMELine(EntryString, Format('%1.2f', [FullScreenContrast.Position]), True)
         else
         if (tmpEntryStr = 'full_screen_gamma ') or
            (tmpEntryStr = 'fsg ') then
            UpdateMAMELine(EntryString, Format('%1.2f', [FullScreenGamma.Position]), True)
         else
         if tmpEntryStr = 'useallheads ' then // SDLMAME option disable for now (X11 driver driver)
            UpdateMAMELine(EntryString, GetBooleanValue(SDLSplitFullScreenMonitors.Checked))
         else
         if tmpEntryStr = 'attach_window ' then // SDLMAME option
            UpdateMAMELine(EntryString, SDLAttachWindow.Text)
         else
         // # WINDOWS SOUND OPTIONS
         if tmpEntryStr = 'audio_latency ' then
            UpdateMAMELine(EntryString, IntToStr(AudioLatency.ItemIndex+1))
         else

         // # BGFX POST-PROCESSING OPTIONS
         if tmpEntryStr = 'bgfx_path ' then
            begin
              if BGFXPath.Text = '' then
                 BGFXPath.Text:= 'bgfx';
              UpdateMAMELine(EntryString, BGFXPath.Text);
            end
         else
         if tmpEntryStr = 'bgfx_backend ' then
            begin
              //Auto
              //Direct3D 9
              //Direct3D 11
              //Direct3D 12
              //OpenGL
              //OpenGL ES
              //Metal
              //Vulkan
              Value:= 'auto';
              case BGFXBackend.ItemIndex of
                0: Value:= 'auto';
                1: Value:= 'd3d9';
                2: Value:= 'd3d11';
                3: Value:= 'd3d12';
                4: Value:= 'opengl';
                5: Value:= 'gles';
                6: Value:= 'metal';
                7: Value:= 'vulkan';
              end;
              UpdateMAMELine(EntryString, Value);
            end
         else
         if tmpEntryStr = 'bgfx_debug ' then
            UpdateMAMELine(EntryString, GetBooleanValue(BGFXDebug.Checked))
         else
         if tmpEntryStr = 'bgfx_screen_chains ' then
            begin
              if BGFXScreenShaderChains.Text = '' then
                 BGFXScreenShaderChains.Text:= 'default';
              UpdateMAMELine(EntryString, BGFXScreenShaderChains.Text);
            end
         else
         if tmpEntryStr = 'bgfx_shadow_mask ' then
            begin
              if BGFXShadowMaskTextureName.Text = '' then
                 BGFXShadowMaskTextureName.Text:= 'slot-mask.png';
              UpdateMAMELine(EntryString, BGFXShadowMaskTextureName.Text);
            end
         else
         if tmpEntryStr = 'bgfx_lut ' then
            UpdateMAMELine(EntryString, BGFXLUTTextureName.Text)
         else
         //if tmpEntryStr = 'bgfx_avi_name ' then
         //   begin
         //     if BGFX_RecordRenderedVideoAVI.Text = '' then
         //        BGFX_RecordRenderedVideoAVI.Text:= 'bgfx.avi';
         //     UpdateMAMELine(EntryString, BGFX_RecordRenderedVideoAVI.Text);
         //   end
         //else
         
         // # INPUT DEVICE OPTIONS
         //if tmpEntryStr = 'hide_cursor ' then // deprecated setting
         //   UpdateMAMELine(EntryString, GetBooleanValue(HideCursor.Checked))
         //else
         if tmpEntryStr = 'global_inputs ' then
            UpdateMAMELine(EntryString, GetBooleanValue(EnableGlobalInputs.Checked))
         else
         if (tmpEntryStr = 'dual_lightgun ') or
            (tmpEntryStr = 'dual ') then
            UpdateMAMELine(EntryString, GetBooleanValue(DualLightGun.Checked))
         else

         // SDLMAME
         // # SDL KEYBOARD MAPPING
         if tmpEntryStr = 'keymap ' then
            UpdateMAMELine(EntryString, GetBooleanValue(SDKKeyboardMapping.Checked))
         else
         if tmpEntryStr = 'keymap_file ' then
            UpdateMAMELine(EntryString, SDLKeymapFilename.Text)
         else
         // # SDL JOYSTICK MAPPING
         if tmpEntryStr = 'joy_idx1 ' then
            UpdateMAMELine(EntryString, SetSDLDevice(SDLJoystickMapping1, SDLJoystickMapping1Custom))
         else
         if tmpEntryStr = 'joy_idx2 ' then
            UpdateMAMELine(EntryString, SetSDLDevice(SDLJoystickMapping2, SDLJoystickMapping2Custom))
         else
         if tmpEntryStr = 'joy_idx3 ' then
            UpdateMAMELine(EntryString, SetSDLDevice(SDLJoystickMapping3, SDLJoystickMapping3Custom))
         else
         if tmpEntryStr = 'joy_idx4 ' then
            UpdateMAMELine(EntryString, SetSDLDevice(SDLJoystickMapping4, SDLJoystickMapping4Custom))
         else
         if tmpEntryStr = 'joy_idx5 ' then
            UpdateMAMELine(EntryString, SetSDLDevice(SDLJoystickMapping5, SDLJoystickMapping5Custom))
         else
         if tmpEntryStr = 'joy_idx6 ' then
            UpdateMAMELine(EntryString, SetSDLDevice(SDLJoystickMapping6, SDLJoystickMapping6Custom))
         else
         if tmpEntryStr = 'joy_idx7 ' then
            UpdateMAMELine(EntryString, SetSDLDevice(SDLJoystickMapping7, SDLJoystickMapping7Custom))
         else
         if tmpEntryStr = 'joy_idx8 ' then
            UpdateMAMELine(EntryString, SetSDLDevice(SDLJoystickMapping8, SDLJoystickMapping8Custom))
         else
         if tmpEntryStr = 'sixaxis ' then
            UpdateMAMELine(EntryString, GetBooleanValue(PS3SixaxisControllers.Checked))
         else

         // # SDL LIGHTGUN MAPPING ... SDL 2 only
         if tmpEntryStr = 'lightgun_index1 ' then
            UpdateMAMELine(EntryString, SetSDLDevice(SDLLightgunMapping1, SDLLightgunMapping1Custom))
         else
         if tmpEntryStr = 'lightgun_index2 ' then
            UpdateMAMELine(EntryString, SetSDLDevice(SDLLightgunMapping2, SDLLightgunMapping2Custom))
         else
         if tmpEntryStr = 'lightgun_index3 ' then
            UpdateMAMELine(EntryString, SetSDLDevice(SDLLightgunMapping3, SDLLightgunMapping3Custom))
         else
         if tmpEntryStr = 'lightgun_index4 ' then
            UpdateMAMELine(EntryString, SetSDLDevice(SDLLightgunMapping4, SDLLightgunMapping4Custom))
         else
         if tmpEntryStr = 'lightgun_index5 ' then
            UpdateMAMELine(EntryString, SetSDLDevice(SDLLightgunMapping5, SDLLightgunMapping5Custom))
         else
         if tmpEntryStr = 'lightgun_index6 ' then
            UpdateMAMELine(EntryString, SetSDLDevice(SDLLightgunMapping6, SDLLightgunMapping6Custom))
         else
         if tmpEntryStr = 'lightgun_index7 ' then
            UpdateMAMELine(EntryString, SetSDLDevice(SDLLightgunMapping7, SDLLightgunMapping7Custom))
         else
         if tmpEntryStr = 'lightgun_index8 ' then
            UpdateMAMELine(EntryString, SetSDLDevice(SDLLightgunMapping8, SDLLightgunMapping8Custom))
         else

         // # SDL MOUSE MAPPING ... SDL 2 only
         if tmpEntryStr = 'mouse_index1 ' then
            UpdateMAMELine(EntryString, SetSDLDevice(SDL2MouseMapping1, SDL2MouseMapping1Custom))
         else
         if tmpEntryStr = 'mouse_index2 ' then
            UpdateMAMELine(EntryString, SetSDLDevice(SDL2MouseMapping2, SDL2MouseMapping2Custom))
         else
         if tmpEntryStr = 'mouse_index3 ' then
            UpdateMAMELine(EntryString, SetSDLDevice(SDL2MouseMapping3, SDL2MouseMapping3Custom))
         else
         if tmpEntryStr = 'mouse_index4 ' then
            UpdateMAMELine(EntryString, SetSDLDevice(SDL2MouseMapping4, SDL2MouseMapping4Custom))
         else
         if tmpEntryStr = 'mouse_index5 ' then
            UpdateMAMELine(EntryString, SetSDLDevice(SDL2MouseMapping5, SDL2MouseMapping5Custom))
         else
         if tmpEntryStr = 'mouse_index6 ' then
            UpdateMAMELine(EntryString, SetSDLDevice(SDL2MouseMapping6, SDL2MouseMapping6Custom))
         else
         if tmpEntryStr = 'mouse_index7 ' then
            UpdateMAMELine(EntryString, SetSDLDevice(SDL2MouseMapping7, SDL2MouseMapping7Custom))
         else
         if tmpEntryStr = 'mouse_index8 ' then
            UpdateMAMELine(EntryString, SetSDLDevice(SDL2MouseMapping8, SDL2MouseMapping8Custom))
         else

         // # SDL KEYBOARD MAPPING ... SDL 2 only
         if tmpEntryStr = 'keyb_idx1 ' then
            UpdateMAMELine(EntryString, SetSDLDevice(SDL2KeyboardMapping1, SDL2KeyboardMapping1Custom))
         else
         if tmpEntryStr = 'keyb_idx2 ' then
            UpdateMAMELine(EntryString, SetSDLDevice(SDL2KeyboardMapping2, SDL2KeyboardMapping2Custom))
         else
         if tmpEntryStr = 'keyb_idx3 ' then
            UpdateMAMELine(EntryString, SetSDLDevice(SDL2KeyboardMapping3, SDL2KeyboardMapping3Custom))
         else
         if tmpEntryStr = 'keyb_idx4 ' then
            UpdateMAMELine(EntryString, SetSDLDevice(SDL2KeyboardMapping4, SDL2KeyboardMapping4Custom))
         else
         if tmpEntryStr = 'keyb_idx5 ' then
            UpdateMAMELine(EntryString, SetSDLDevice(SDL2KeyboardMapping5, SDL2KeyboardMapping5Custom))
         else
         if tmpEntryStr = 'keyb_idx6 ' then
            UpdateMAMELine(EntryString, SetSDLDevice(SDL2KeyboardMapping6, SDL2KeyboardMapping6Custom))
         else
         if tmpEntryStr = 'keyb_idx7 ' then
            UpdateMAMELine(EntryString, SetSDLDevice(SDL2KeyboardMapping7, SDL2KeyboardMapping7Custom))
         else
         if tmpEntryStr = 'keyb_idx8 ' then
            UpdateMAMELine(EntryString, SetSDLDevice(SDL2KeyboardMapping8, SDL2KeyboardMapping8Custom))
         else

         // # SDL LOWLEVEL DRIVER OPTIONS
         if (tmpEntryStr = 'videodriver ') or
            (tmpEntryStr = 'vd ') then
            begin
              Value:= 'auto';
              case SDLVideoDriverToUse.ItemIndex of
                0: Value:= 'auto';
                1: Value:= 'x11';
                2: Value:= 'directfb';
              end;
              UpdateMAMELine(EntryString, Value);
            end
         else
         if (tmpEntryStr = 'renderdriver ') or
            (tmpEntryStr = 'rd ') then // for SDL 2 only
            begin
              Value:= 'auto';
              case SDL2RenderDriverToUse.ItemIndex of
                0: Value:= 'auto';
                1: Value:= 'software';
                2: Value:= 'opengl';
                3: Value:= 'directfb';
              end;
              UpdateMAMELine(EntryString, Value);
            end
         else
         if (tmpEntryStr = 'audiodriver ') or
            (tmpEntryStr = 'ad ') then
            begin
              Value:= 'auto';
              case SDLAudioDriverToUse.ItemIndex of
                0: Value:= 'auto';
                1: Value:= 'alsa';
                2: Value:= 'arts';
              end;
              UpdateMAMELine(EntryString, Value);
            end
         else
         if tmpEntryStr = 'gl_lib ' then
            UpdateMAMELine(EntryString, SetSDLDevice(SDLAlternativeLibGLToUse, SDLAlternativeLibGLToUseCustom));
       end;
  end;
  case CustomGameOption of
    True:
      begin
        try
          if GameIniFile.Count > 0 then
             GameIniFile.SaveToFile(customIni);
        finally
          FreeAndNil(GameIniFile);
          for Loop:=Low(IniCustomList) to (ActiveFileID-1) do
              FreeandNil(IniCustomList[Loop]);
        end;
      end;
    False:
      begin
        try
          MAMEIniFile.SaveToFile(emuIni);
        finally
        end;
      end;
  end;
  FreeAndNil(MAMEIniFile);
end;

procedure TFormMAMESettings.LoadBiosList(const SelectBiosName: String);
var
  BiosSet: TMemIniFile;
  Loop: Integer;
  BiosSetList: TStringList;
  DefaultBios, BiosIniStr: String;

  function GetBiosSetFile: String;
  begin
    Result:= FormMain.GetGamesFolderEL+FormMain.GetArcadeSystemIniSection(sysID, True)+'_biossets.ini';
  end;

  function MoveOldToNewBiosFile: Boolean;
  var
    oldFile: String;
  begin
    case sysID of
      idMAME  : oldFile:= 'biosset.ini';
      idHBMAME: oldFile:= 'biosset_hbmame.ini';
    end;
    oldFile:= FormMain.GetIniFilesFolder+oldFile;
    Result:= MoveFile(oldFile, BiosIniStr, True);
    SysUtils.Sleep(20);
  end;

  procedure AddBiosEntry(const Title, SetName: String; IsDefault: Boolean; InsertDefault: Boolean = False);
  var
    Item: TEasyItem;
  begin
    case InsertDefault of
      True : Item:= BiosSetsListView.Items.Insert(0);
      False: Item:= BiosSetsListView.Items.Add;
    end;
    //Item.ImageIndex:= 8;
    Item.Caption:= Title;
    Item.Bold:= IsDefault;
    Item.Captions[1]:= SetName;
  end;

begin
  BiosSetsListView.BeginUpdate;
  if (FormMain.MemGameInfo.eBiosName = '') or (FormMAMESettings.Tag = 0) then
     begin
       AddBiosEntry('[Use Default]', '', False);
       BiosSetsListView.EndUpdate;
       Exit;
     end;
  BiosIniStr:= GetBiosSetFile;
  if not FileExists(BiosIniStr) then
     MoveOldToNewBiosFile;
  if not FileExists(BiosIniStr) then
     Exit;

  BiosSet:= TMemIniFile.Create(BiosIniStr);
  if not BiosSet.SectionExists(FormMain.MemGameInfo.eBiosName) then
     begin
       FreeAndNil(BiosSet);
       BiosSetsListView.EndUpdate;
       Exit;
     end;
     
  BiosSetsGroupBoxLabel.Caption:= 'Bios: '+BiosSet.ReadString('Descriptions', FormMain.MemGameInfo.eBiosName, '');
  BiosSetList:= TStringList.Create;
  BiosSet.ReadSectionValues(FormMain.MemGameInfo.eBiosName, BiosSetList);
  //BiosSetList.CustomSort(CompareStringListNatural); // this sorts the filename, NOT set title
  DefaultBios:= BiosSetList.Values['default_bios'];
  for Loop:=0 to BiosSetList.Count-1 do
  begin
     if (BiosSetList.Names[Loop] <> 'default_bios') and
        (BiosSetList.Names[Loop] <> 'selected_bios') then
        begin
          AddBiosEntry(BiosSetList.ValueFromIndex[Loop], BiosSetList.Names[Loop],
                       (BiosSetList.Names[Loop] = DefaultBios));
        end;
   end;
  FreeAndNil(BiosSet);
  FreeAndNil(BiosSetList);

  AddBiosEntry('[Use Default]', '', False, True);
  if FormMain.CheckTotal(BiosSetsListView) then
     BiosSetsListView.Sort.SortAll();
  BiosSetsListView.EndUpdate;
end;

procedure TFormMAMESettings.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  CanClose:= not FormMain.ELV_IsEditing(FolderROMs);
  if CanClose then
     begin
       if ModalResult = mrOk then
          begin
            FormMain.PopupCustomMAME.Tag:= Ord(SaveValidateAllCustomFiles.Checked);
            WriteMAMEIniFile(GameIni, Boolean(Tag));// update all mame.ini options
            if FormMAMESettings.Tag = 0 then
               WritePluginIni; // only if saving emulator settings....
          end;
       SetCurrentDir(FrontendPath);
     end;
end;

procedure TFormMAMESettings.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #27 then
     ButtonCancel.Click;
end;

// IniFileList: packed array[1..12] of THashedStringList;
procedure TFormMAMESettings.LoadIniToStringList(FileID: ShortInt; var ListHolder: THashedStringList);
var
  //mameFile: THashedStringList;
  Loop, iPos: Integer;
  strLine, strFile, FileFolder: String;
begin
  strFile:= FormMain.GetCustomIniFileMAME(FileID);
  if strFile = '' then
     Exit;

  FileFolder:= FormMain.IniFilesDir[sysID];

  if FileID = 9 then
     begin
       // for driver (source\drivername.ini or drivername.ini)
       if FileExists(FileFolder+strFile+'.ini') then
          strFile:= FileFolder+strFile+'.ini'
       else
          strFile:= FileFolder+'source\'+strFile+'.ini';
     end
  else
     strFile:= FileFolder+strFile+'.ini';

  if not FileExists(strFile) then
     Exit;

  ListHolder:= THashedStringList.Create;
  ListHolder.LoadFromFile(strFile);
  //ShowMessage(ListHolder.Text);
  ListHolder.BeginUpdate;
  for Loop:=0 to ListHolder.Count-1 do
  begin
    strLine:= TrimLeft(ListHolder[Loop]);
    if strLine <> '' then
       if strLine[1] <> '#' then
          begin
            iPos:= PosEx(' ', strLine);
            if iPos <> 0 then
               ListHolder[Loop]:= Copy(strLine, 1, iPos-1)+'='+Trim(Copy(strLine, iPos, Length(strLine)));
          end;
  end;
  ListHolder.EndUpdate;
  // for debugging only!!! August 17, 2016
  //ShowMessage(ListHolder.Text);
  //ListHolder.SaveToFile('D:\emulators\mame\ume\ume-modified-for-emuloader.ini');
  //FreeAndNil(mameFile);
end;

procedure TFormMAMESettings.LoadCustomSettingsFiles;
var
  Loop: ShortInt;
  strFile, FileFolder: String;
begin
  if ActiveFileID = -1 then
     Exit;

  for Loop:= 1 to MaxIniCountMAME do
  begin
    if Loop <= ActiveFileID  then
    begin
      strFile:= FormMain.GetCustomIniFileMAME(Loop);
      if strFile <> '' then
      begin
        FileFolder:= FormMain.IniFilesDir[sysID];

        if Loop = 9 then // drivername.ini
           begin
             // driver custom settings is for MAME/HBMAME only
             // starting from MAME 0.179, all driver .ini files must be in the "inidir\source\source_name.ini" sub-folder ("inidir\source\")
             // ... no more support for "inidir\source_name.ini"
             if iVersion > 118 then
             begin
               strFile:= FileFolder+'source\'+strFile+'.ini';
               if iVersion < 179 then
               begin
                 if not FileExists(strFile) then
                    strFile:= FileFolder+strFile+'.ini'
               end;
             end
             else
                strFile:= FileFolder+strFile+'.ini';
           end
        else
           strFile:= FileFolder+strFile+'.ini';

        ReadMAMEIniFile(strFile); // read all gamename.ini options
      end;
    end
    else
       Break;
  end;
  
  ReadMAMEIniFile(GameIni); // read all gamename.ini options
end;

procedure TFormMAMESettings.ButtonReadFileClick(Sender: TObject);
begin
  ReadMAMEIniFile(emuIni, True); // read all mame.ini options
  if Tag = 1 then
     LoadCustomSettingsFiles; // read all gamename.ini options
  ScreensSelector.OnSelect(Self);
end;

procedure TFormMAMESettings.EffectOverlayButtonSelectClick(Sender: TObject);
var
  FolderStr, FileStr, GameStr: String;
begin
  if not FormMain.CheckTotal(FolderArtworks) then
     Exit;
  FolderStr:= FormMain.MountFoldersListMAME(FolderArtworks);
  if FolderStr = '' then
     Exit;
  if FormMAMESettings.Tag = 0 then
     GameStr:= FormMain.GetArcadeSystemIniSection(sysID)
  else
     GameStr:= ChangeFileExt(ExtractFileName(GameIni), '');
  if not FormMain.SelectFileName(28, sysID, emuFileExec, FileStr, FolderStr) then
     Exit;
  EffectOverlay.Text:= FileStr;
  if EffectOverlay.Text <> '' then
     begin
       EffectOverlay.Text:= ChangeFileExt(ExtractFileName(EffectOverlay.Text), '');
       if PosEx(' ', EffectOverlay.Text) <> 0 then
          EffectOverlay.Text:= '"'+EffectOverlay.Text+'"';
     end;
end;

procedure TFormMAMESettings.FolderROMsButtonSelectClick(
  Sender: TObject);
begin
  FormMain.DialogSelectMultiFolders(FolderROMs);
end;

procedure TFormMAMESettings.FolderSamplesButtonSelectClick(
  Sender: TObject);
begin
  FormMain.DialogSelectFolder(FolderSamples, True);
end;

procedure TFormMAMESettings.FolderGamesConfigurationsButtonSelectClick(
  Sender: TObject);
begin
  FormMain.DialogSelectFolder(FolderGamesConfigurations, False);
end;

procedure TFormMAMESettings.FolderMemoryCardsButtonSelectClick(
  Sender: TObject);
begin
  FormMain.DialogSelectFolder(FolderMemoryCards, False);
end;

procedure TFormMAMESettings.FolderInputDeviceLogsButtonSelectClick(
  Sender: TObject);
begin
  FormMain.DialogSelectFolder(FolderInputDeviceLogs, False);
end;

procedure TFormMAMESettings.FolderSaveStatesButtonSelectClick(
  Sender: TObject);
begin
  FormMain.DialogSelectFolder(FolderSaveStates, False);
end;

procedure TFormMAMESettings.FolderGameSnapshotsButtonSelectClick(
  Sender: TObject);
begin
  FormMain.DialogSelectFolder(FolderGameSnapshots, True);
end;

procedure TFormMAMESettings.FolderDiffButtonSelectClick(Sender: TObject);
begin
  FormMain.DialogSelectFolder(FolderDiff, False);
end;

procedure TFormMAMESettings.DebuggerScriptButtonSelectClick(Sender: TObject);
begin
  FormMain.DialogOpenFile(12, 'Select a debugger script file', DebuggerScript, False, True, DebuggerScript.Text);
end;

procedure TFormMAMESettings.FolderLanguageFilesButtonSelectClick(Sender: TObject);
begin
  FormMain.DialogSelectFolder(FolderLanguageFiles, False);
end;

procedure TFormMAMESettings.FolderPluginFilesButtonSelectClick(Sender: TObject);
begin
  FormMain.DialogSelectFolder(FolderPluginFiles, False);
end;

procedure TFormMAMESettings.FolderROMsButtonClearClick(
  Sender: TObject);
begin
  FormMain.ClearListView(FolderROMs);
end;

procedure TFormMAMESettings.VolumeChange(Sender: TObject);
begin
  VolumeLabel.Caption:= Format(VolumeLabel.Hint, [Volume.Position]);
end;

procedure TFormMAMESettings.JoystickDeadzoneChange(Sender: TObject);
begin
  JoystickDeadzoneLabel.Caption:= Format(JoystickDeadzoneLabel.Hint, [JoystickDeadzone.Position]);
end;

procedure TFormMAMESettings.BrightnessChange(Sender: TObject);
begin
  BrightnessLabel.Caption:= Format(BrightnessLabel.Hint, [Brightness.Position]);
end;

procedure TFormMAMESettings.ContrastChange(Sender: TObject);
begin
  ContrastLabel.Caption:= Format(ContrastLabel.Hint, [Contrast.Position]);
end;

procedure TFormMAMESettings.GammaChange(Sender: TObject);
begin
  GammaLabel.Caption:= Format(GammaLabel.Hint, [Gamma.Position]);
end;

procedure TFormMAMESettings.PauseBrightnessChange(Sender: TObject);
begin
  PauseBrightnessLabel.Caption:= Format(PauseBrightnessLabel.Hint, [PauseBrightness.Position]);
end;

procedure TFormMAMESettings.LabelJoystickSaturationValueClick(
  Sender: TObject);
begin
  JoystickSaturationLabel.Caption:= Format('%1.2f', [JoystickSaturation.Position]);
end;

procedure TFormMAMESettings.Prescale_ScaleScreenChange(Sender: TObject);
begin
  Prescale_ScaleScreenLabel.Caption:= Format(Prescale_ScaleScreenLabel.Hint, [Prescale_ScaleScreen.Position]);
end;

procedure TFormMAMESettings.FullScreenBrightnessChange(Sender: TObject);
begin
  FullScreenBrightnessLabel.Caption:= Format(FullScreenBrightnessLabel.Hint, [FullScreenBrightness.Position]);
end;

procedure TFormMAMESettings.FullScreenContrastChange(Sender: TObject);
begin
  FullScreenContrastLabel.Caption:= Format(FullScreenContrastLabel.Hint, [FullScreenContrast.Position]);
end;

procedure TFormMAMESettings.FullScreenGammaChange(Sender: TObject);
begin
  FullScreenGammaLabel.Caption:= Format(FullScreenGammaLabel.Hint, [FullScreenGamma.Position]);
end;

procedure TFormMAMESettings.VectorFlickerEffectChange(Sender: TObject);
begin
  VectorFlickerEffectLabel.Caption:= Format(VectorFlickerEffectLabel.Hint, [VectorFlickerEffect.Position]);
end;

procedure TFormMAMESettings.SecondsToRunChange(Sender: TObject);
begin
  if SecondsToRun.Position < 60 then
     begin
       if SecondsToRunLabel.Hint <> 'sec' then
          SecondsToRunLabel.Hint:=  'sec';
     end
  else
     begin
       if SecondsToRunLabel.Hint <> 'min' then
          SecondsToRunLabel.Hint:=  'min';
     end;

  SecondsToRunLabel.Caption:= SecondsToRun.Hint+GetPlayTime(SecondsToRun.Position*1000)+' '+SecondsToRunLabel.Hint+']';
end;

procedure TFormMAMESettings.ScreenNameSelect(Sender: TObject);
begin
  if not SameText(ScreenDetails[ScreensSelector.Tag].eScreenName, ScreenName.Text) then
     ScreenDetails[ScreensSelector.Tag].eScreenName:= ScreenName.Text;
end;

procedure TFormMAMESettings.ScreenAspectRatioSelect(Sender: TObject);
begin
  if not SameText(ScreenDetails[ScreensSelector.Tag].eScreenAspectRatio, ScreenAspectRatio.Text) then
     ScreenDetails[ScreensSelector.Tag].eScreenAspectRatio:= ScreenAspectRatio.Text;
end;

procedure TFormMAMESettings.ScreenResolutionSelect(Sender: TObject);
begin
  if not SameText(ScreenDetails[ScreensSelector.Tag].eScreenResolution, ScreenResolution.Text) then
     ScreenDetails[ScreensSelector.Tag].eScreenResolution:= ScreenResolution.Text;
end;

procedure TFormMAMESettings.ScreenViewSelect(Sender: TObject);
begin
  if not SameText(ScreenDetails[ScreensSelector.Tag].eScreenView, ScreenView.Text) then
     ScreenDetails[ScreensSelector.Tag].eScreenView:= ScreenView.Text;
end;

procedure TFormMAMESettings.ScreensSelectorSelect(Sender: TObject);
var
  sIndex: ShortInt;
  HintStr: String;
begin
  ScreensSelector.Tag:= ScreensSelector.ItemIndex-1;

  // screen name
  sIndex:= ScreenName.Items.IndexOf(ScreenDetails[ScreensSelector.Tag].eScreenName);
  if sIndex <> -1 then
     sIndex:= 0; // reset to "auto"
  SetSelectedComboBox(sIndex, ScreenName);

  // aspect ratio
  sIndex:= ScreenAspectRatio.Items.IndexOf(ScreenDetails[ScreensSelector.Tag].eScreenAspectRatio);
  if sIndex = -1 then
     sIndex:= 0; // reset to "auto"
  SetSelectedComboBox(sIndex, ScreenAspectRatio);
  //ScreenAspectRatio.ItemIndex:= sIndex;

  // resolution
  sIndex:= ScreenResolution.Items.IndexOf(ScreenDetails[ScreensSelector.Tag].eScreenResolution);
  if sIndex = -1 then
     sIndex:= 0; // reset to "auto"
  SetSelectedComboBox(sIndex, ScreenResolution);

  // screen refresh rate
  if ScreenDetails[ScreensSelector.Tag].eScreenRefreshRate = '' then
     SetSelectedComboBox(0, ScreenRefreshRate)
  else
     begin
       sIndex:= ScreenRefreshRate.Items.IndexOf(ScreenDetails[ScreensSelector.Tag].eScreenRefreshRate);
       if sIndex = -1 then
          sIndex:= 0;
       SetSelectedComboBox(sIndex, ScreenRefreshRate);
     end;

  // screen view
  sIndex:= ScreenView.Items.IndexOf(ScreenDetails[ScreensSelector.Tag].eScreenView);
  if sIndex = -1 then
     sIndex:= 0;
  SetSelectedComboBox(sIndex, ScreenView);

  HintStr:= LowerCase(ScreensSelector.Text);
  if ScreensSelector.ItemIndex > 0 then
     HintStr:= 'the '+HintStr;

  ScreenName.Hint:= ScreenNameLabel.Hint+' '+HintStr;
  ScreenAspectRatio.Hint:= ScreenAspectRatioLabel.Hint+' '+HintStr;
  ScreenResolution.Hint:= ScreenResolutionLabel.Hint+' '+HintStr;
  ScreenView.Hint:= ScreenViewLabel.Hint+' '+HintStr;
end;

procedure TFormMAMESettings.ScreenRefreshRateSelect(
  Sender: TObject);
begin
  if not SameText(ScreenDetails[ScreensSelector.Tag].eScreenRefreshRate, ScreenRefreshRate.Text) then
     ScreenDetails[ScreensSelector.Tag].eScreenRefreshRate:= ScreenRefreshRate.Text;
end;

procedure TFormMAMESettings.JoystickSaturationChange(Sender: TObject);
begin
  JoystickSaturationLabel.Caption:= Format(JoystickSaturationLabel.Hint, [JoystickSaturation.Position]);
end;

procedure TFormMAMESettings.FolderROMsButtonEditClick(
  Sender: TObject);
begin
  FormMain.ELV_EnableEdit(FolderROMs);
end;

procedure TFormMAMESettings.FolderROMsButtonDeleteClick(
  Sender: TObject);
begin
  FormMain.ELV_DeleteSelected(FolderROMs);
end;

procedure TFormMAMESettings.EnableDisableControls;
begin
  if not IsSDLMAME then
     begin
       ButtonPageSDLMAMEInput.Enabled:= False;
     end;
end;

procedure TFormMAMESettings.Disable_MAMEui_Settings;
begin
  // all "ui.ini" settings will be disabled for custom game/driver settings
  SkipWarnings.Enabled:= False;
end;

procedure TFormMAMESettings.FormShow(Sender: TObject);
var
  iStr: String;
  Loop: Integer;

  function MovePanel(iPanel: TPanelEx): Boolean;
  begin
    Result:= True;
    iPanel.Left:= 0;
    if (iPanel = Panel4_Video3b) or (iPanel = Panel4_Video3c) then
       iPanel.Top:= 46
    else
       iPanel.Top:= Panel1_Folders.Top;
    iPanel.Visible:= False;
  end;

  function FixScrollBarArea(ListViewSource: TEasyListView): Boolean;
  begin
    Result:= True;
    ListViewSource.Header.Columns[0].Width:= ListViewSource.Header.Columns[0].Width-GetSystemMetrics(SM_CXVSCROLL);
  end;

begin
  FormMAMESettings.Color:= $00f1f1f1; // reset to normal color just in case
  SampleBox.Visible:= False; // make sure this panel is not visible at runtime

  Panel4_Video3b.Parent:= Panel4_Video3a;
  Panel4_Video3c.Parent:= Panel4_Video3a;

  Panel4_Video3c.BringToFront;
  Panel4_Video3b.BringToFront;

  MovePanel(Panel2_Video1);
  MovePanel(Panel3_Video2);
  MovePanel(Panel4_Video3a);
  MovePanel(Panel4_Video3b);
  MovePanel(Panel4_Video3c);
  MovePanel(Panel5_LUA);
  MovePanel(Panel6_Input);
  MovePanel(Panel7_Miscellaneous);
  MovePanel(Panel8_SDL);

  Panel4_Video3b.Visible:= True;
  //Panel4_Video3c.BringToFront;
  //Panel4_Video3b.BringToFront;

  Resize4K;

  FormMain.ELV_ResetNormalColors(FolderROMs);
  FormMain.ELV_ResetNormalColors(FolderIniFiles);
  FormMain.ELV_ResetNormalColors(FolderArtworks);
  FormMain.ELV_ResetNormalColors(BiosSetsListView);
  FormMain.ELV_ResetNormalColors(DisplayLanguageList);
  FormMain.ELV_ResetNormalColors(LUAPluginsToEnable);
  FormMain.ELV_ResetNormalColors(BGFXScreenShaderChains_ListView);

  FixScrollBarArea(FolderROMs);
  FixScrollBarArea(FolderIniFiles);
  FixScrollBarArea(FolderArtworks);
  FixScrollBarArea(BiosSetsListView);
  FixScrollBarArea(DisplayLanguageList);
  FixScrollBarArea(LUAPluginsToEnable);
  FixScrollBarArea(BGFXScreenShaderChains_ListView);

  if IsNightMode then
  begin
    FormMAMESettings.Color:= menu_background_color[1];
    SetXiTrackBarColors(NumberScreens);
    //NumberScreens.Font.Color:= item_caption_active_color[1];
    SetPanelColors(Panel1_Folders,       menu_background_color[1], -1, True);
    SetPanelColors(Panel2_Video1,        menu_background_color[1], -1, True);
    SetPanelColors(Panel3_Video2,        menu_background_color[1], -1, True);
    SetPanelColors(Panel4_Video3a,       menu_background_color[1], -1, True);
    SetPanelColors(Panel4_Video3b,       menu_background_color[1], -1, True);
    SetPanelColors(Panel4_Video3c,       menu_background_color[1], -1, True);
    SetPanelColors(Panel5_LUA,           menu_background_color[1], -1, True);
    SetPanelColors(Panel6_Input,         menu_background_color[1], -1, True);
    SetPanelColors(Panel7_Miscellaneous, menu_background_color[1], -1, True);
    SetPanelColors(Panel8_SDL,           menu_background_color[1], -1, True);
    SetPanelNightColors(PanelBottom, menu_background_color[1], clrDarkGray, clrLightBlue);

    for Loop:= 0 to FormMAMESettings.ComponentCount-1 do
    begin
      if FormMAMESettings.Components[Loop] is TPanelEx then
         begin
           iStr:= TPanelEx(FormMAMESettings.Components[Loop]).Name;
           if PosEx('GroupBox', iStr) <> 0 then
              begin
                SetPanelColors(TPanelEx(FormMAMESettings.Components[Loop]), clrMedDarkGray, -1, True);
                SetPanelBorderColors(TPanelEx(FormMAMESettings.Components[Loop]), clrLightGrayFrame, clrBorderGroupBoxGrayBk);
              end
         end
      else
      if FormMAMESettings.Components[Loop] is TBitBtnEx then
         FormMain.SetButtonExColors(TBitBtnEx(FormMAMESettings.Components[Loop]))
      else
      if FormMAMESettings.Components[Loop] is TSpeedButtonEx then
         FormMain.SetButtonExColors(TSpeedButtonEx(FormMAMESettings.Components[Loop]))
      else
      if FormMAMESettings.Components[Loop] is TEditEx then
         SetEditNightColors(TEditEx(FormMAMESettings.Components[Loop]))
      else
      if FormMAMESettings.Components[Loop] is TAdvGroupBoxEx then
         begin
           SetGroupBoxBorderStyle(TAdvGroupBoxEx(FormMAMESettings.Components[Loop]));
           SetGroupBoxColors(TAdvGroupBoxEx(FormMAMESettings.Components[Loop]),
                             clrBorderGroupBoxGrayBk, clrInnerBorderGroupBoxGrayBk,
                             item_caption_active_color[1], item_caption_active_shadow_color[1], -1, clrMedDarkGray, False);

           FormMain.SetGroupBoxExCustomIcon(TAdvGroupBoxEx(FormMAMESettings.Components[Loop]));
         end
      else
      if FormMAMESettings.Components[Loop] is TComboBox2Ex then
         begin
           SetComboBox2ExColors(TComboBox2Ex(FormMAMESettings.Components[Loop]), True);
           FormMain.SetWin10DarkScrollBar(TComboBox2Ex(FormMAMESettings.Components[Loop]));
         end
      else
      if FormMAMESettings.Components[Loop] is TGaugeBar then
         SetGaugeBarColors(TGaugeBar(FormMAMESettings.Components[Loop]))
      else
      if FormMAMESettings.Components[Loop] is TGaugeBar2 then
         SetGaugeBarColors(TGaugeBar(FormMAMESettings.Components[Loop]))
      else
      if FormMAMESettings.Components[Loop] is TAdvOfficeCheckBoxEx then
         begin
           SetCheckBoxColors(TAdvOfficeCheckBoxEx(FormMAMESettings.Components[Loop]), item_caption_active_color[1], item_caption_active_shadow_color[1]);
           TAdvOfficeCheckBoxEx(FormMAMESettings.Components[Loop]).DisabledFontColor:= clGray;
           TAdvOfficeCheckBoxEx(FormMAMESettings.Components[Loop]).DisabledFontShadowColor:= clrMedDarkGray;
           FormMain.SetCheckBoxExCustomIcon(TAdvOfficeCheckBoxEx(FormMAMESettings.Components[Loop]));
         end;
      if FormMAMESettings.Components[Loop] is TShadowLabel then
         begin
           iStr:= TPanelEx(FormMAMESettings.Components[Loop]).Name;
           if PosEx('GroupBoxLabel', iStr) <> 0 then
              begin
                SetLabelBkFrameColors(TShadowLabel(FormMAMESettings.Components[Loop]), clrBorderGroupBoxGrayBk, $00404040, clBlack);
                SetLabelColors(TShadowLabel(FormMAMESettings.Components[Loop]), clCream);
              end
           else
              begin
                SetLabelColors(TShadowLabel(FormMAMESettings.Components[Loop]), item_caption_active_color[1], item_caption_active_shadow_color[1]);
                if not TShadowLabel(FormMAMESettings.Components[Loop]).Transparent then
                   TShadowLabel(FormMAMESettings.Components[Loop]).Color:= clrMedDarkGray;// FormMAMESettings.Color;
              end;
         end
      else
      if FormMAMESettings.Components[Loop] is TEasyListView then
         begin
           FormMain.SetEasyListViewColors(TEasyListView(FormMAMESettings.Components[Loop]), FormMAMESettings.Color, clWhite, -1, clGray);
           FormMain.SetEasyListViewHeaderColors(TEasyListView(FormMAMESettings.Components[Loop]), True, False, Is4KMode);
           FormMain.ELV_SetCheckRadioCustomIcon(TEasyListView(FormMAMESettings.Components[Loop]));
           FormMain.ELV_SetEditBkColor(TEasyListView(FormMAMESettings.Components[Loop]));
           FormMain.ELV_SetRibbonNightColors(0, TEasyListView(FormMAMESettings.Components[Loop]), True);
           FormMain.SetWin10DarkScrollBar(TEasyListView(FormMAMESettings.Components[Loop]));
         end;
    end;

    SetCheckBoxColors(SaveValidateAllCustomFiles, clSilver, clrMedDarkGray);
    FormMain.SetCheckBoxExCustomIcon(SaveValidateAllCustomFiles);
    SetLabelColors(EnableOpenGLFilterNotFFLabel,           clSilver,     clrMedDarkGray);
    SetLabelColors(BGFXScreenShaderChainsHelpLabel,        item_caption_active_color[1], item_caption_active_shadow_color[1]);
    SetLabelColors(BGFXScreenShaderChainsDetailsHTMLLabel, clSilver,      clrMedDarkGray);
    SetLabelColors(LUAPluginsToEnable2Label,               item_caption_active_color[1], item_caption_active_shadow_color[1]);
    SetLabelColors(RecordInputTimecodeFileLabel,           clSilver,     clrMedDarkGray);
    SetLabelColors(ExitAfterInputPlaybackLabel,            clSilver,     clrMedDarkGray);

    if Tag = 1 then
       SetFormColors(FormMAMESettings, nil, nil, LabelGameTitle, LabelEmulatorVersion, LabelGameStatus, FormMain.MemGameInfo.eGameSetStatus, IsNightMode)
    else
       SetFormColors(FormMAMESettings, nil, nil, LabelGameTitle, LabelEmulatorVersion, LabelGameStatus, -1, IsNightMode);

    SetColorEmulatorTopBar(TopBar, sysID, True);

    //FormMain.SetWin10DarkScrollBar(FolderROMs);
    //FormMain.SetWin10DarkScrollBar(FolderIniFiles);
    //FormMain.SetWin10DarkScrollBar(FolderArtworks);
    //FormMain.SetWin10DarkScrollBar(BiosSetsListView);
    //FormMain.SetWin10DarkScrollBar(DisplayLanguageList);
    //FormMain.SetWin10DarkScrollBar(LUAPluginsToEnable);
    //FormMain.SetWin10DarkScrollBar(BGFXScreenShaderChains_ListView);

    //FormMain.SetWin10DarkScrollBar(ScreenResolution);
    //FormMain.SetWin10DarkScrollBar(ControllerDefinitions);
  end;

  //HTTPServer.Enabled:= False;
  VectorGroupBox.DoubleBuffered:= True;
  VectorPostProcessingGroupBox.DoubleBuffered:= True;
  PerformanceGroupBox.DoubleBuffered:= True;
  AudioGroupBox.DoubleBuffered:= True;
  ScreenOptionsGroupBox.DoubleBuffered:= True;
  FullScreenGroupBox.DoubleBuffered:= True;
  JoystickGroupBox.DoubleBuffered:= True;
  AutobootGroupBox.DoubleBuffered:= True;

  SaveValidateAllCustomFiles.Checked:= Boolean(FormMain.PopupCustomMAME.Tag);

  IsSDLMAME:= False;
  EnableSettingsIniMAME;
  PopulateVideoOutputMode;

  if IsSDLMAME then
     begin
       Debugger.Items.BeginUpdate;
       Debugger.Items[2]:= 'QT';
       Debugger.Items.EndUpdate;
     end;
  case SystemIcon.Tag of
    0: LabelGameTitle.Caption:= FormMain.GetArcadeGameSysTitle(FormMAMESettings.Tag = 1, sysID, emuVersionStr);
    1: LabelGameTitle.Caption:= FormMain.GetArcadeGameSysTitle(False, sysID, emuVersionStr);
  end;

  if (FormMAMESettings.Tag = 0) or (SystemIcon.Tag = 1) then
     begin
       LabelEmulatorVersion.Caption:= emuFileExec+#13#10+emuIni;//GameIni;//LabelReadFileIni.Caption;

       SetColorEmulatorTopBar(TopBar, sysID, True); // TopBar.Color1:= $00c0cddc;
       //case sysID of
       //  idMAME  : TopBar.Color1:= clSkyBlue; // MAME
       //  idHBMAME: TopBar.Color1:= $00b4bf8f;//$00bfb490; // HBMAME
       //end;

       FormMain.LoadSystemIcon(sysID, SystemIcon, False);
       FormMain.LoadMessageIcon(GameIcon, 'info.ico');

       LabelGameStatus.Visible:= False;

       // custom settings only. folders settings are only available when configuring MAME/HBMAME main settings (mame.ini; ume.ini; hbmame.ini)
       if SystemIcon.Tag = 1 then
          begin
            ButtonPageFolders.Enabled:= False;
            Disable_MAMEui_Settings;
          end;
     end
  else
  if Tag = 1 then
     begin
       Disable_MAMEui_Settings;
       // is game custom options... this case will never be used by emulator default settings!!! (March 16, 2016)
       //iStr:= emuVersionStr;
       iStr:= FormMain.EmulatorVersion[sysID];
       if iStr <> '' then
          LabelEmulatorVersion.Caption:= iStr
       else
          LabelEmulatorVersion.Caption:= '';

       if LabelEmulatorVersion.Caption = '' then
          LabelEmulatorVersion.Caption:= 'name: '+FormMain.StatusBar_GamesGameName.Caption
       else
          LabelEmulatorVersion.Caption:= 'name: '+FormMain.StatusBar_GamesGameName.Caption+#13#10+
                                         LabelEmulatorVersion.Caption;

       LabelGameStatus.Caption:= LabelGameStatus.Hint+#13#10+FormMain.GetGameStatusText(FormMain.MemGameInfo.eGameSetStatus, FormMain.MemGameInfo.eROMIdentification);

       FormMain.LoadSystemROMIdIcon(FormMain.MemGameInfo.eSystemID, FormMain.MemGameInfo.eCustomSystemID, FormMain.MemGameInfo.eROMIdentification, SystemIcon, FormMain.MemGameInfo.eSoftwareName, FormMain.MemGameInfo.eGameSetStatus, FormMain.MemGameInfo.eIsCustomGame);
       FormMain.LoadGameIcon(GameIcon, False);

       SetColorsGameTopBar(FormMain.MemGameInfo.eGameSetStatus, TopBar, True); // change top bar color based on game set status // for light mode and night mode
       //case FormMain.MemGameInfo.eGameSetStatus of
       //  0: TopBar.Color1:= $00f0fae5; // green
       //  1: TopBar.Color1:= $00e5f0fa; // red (based on green)
       //  2: TopBar.Color1:= $00eeeeee; // silver (base on green)
       //end;


       //if FormMain.MemGameInfo.eSoftwareName <> '' then
       //   begin
       //     LabelSoftwareListTitle.Visible:= True;
       //     LabelSoftwareListTitle.Caption:= FormMain.MemGameInfo.eCategory;
       //   end;

       // do not set dark mode yet! (May 17, 2018) 
       //SetColorsGameTopBar(FormMain.MemGameInfo.eGameSetStatus, TopBar); // change top bar color based on game set status

       // custom settings only. folders settings are only available when configuring MAME/HBMAME main settings (mame.ini; ume.ini; hbmame.ini)
       ButtonPageFolders.Enabled:= False;
     end;

  LoadBiosList('');
  PopulateNumberProcessors;
  EnableDisableControls;
  PopulateDisplayLanguage;
  PopulateRAMSize;

  PopulateLUAPlugins_ListView;
  ReadPluginIni; // read from plugin.ini (if exists)

  PopulateBGFXShaderChains_ListView; // read all .json files from mamedir\bgfx\chains\ folder and add to the ListView...

  ButtonResetToDefault.Visible:= not ButtonPageFolders.Enabled;
  if not ButtonResetToDefault.Visible then
     ButtonReadFileHelp.Visible:= False;

  Panel4_Video3c.Visible:= False;
  //if not Panel4_Video3b.Visible
  //   Panel4_Video3b.Visible:= True;

  ButtonReadFile.Click;
  if FormMain.CheckSelected(BiosSetsListView) then
     BiosSetsListView.Selection.First.ImageIndex:= 8;

  BGFXScreenShaderChainsGroupBoxLabel.Hint:= BGFXScreenShaderChains.Text; // this will hold shader chain's current value
  if BGFXScreenShaderChainsGroupBoxLabel.Hint = '' then
     BGFXScreenShaderChainsGroupBoxLabel.Hint:= 'default';

  ClientWidth:= Panel1_Folders.Width;
  ClientHeight:= PanelBottom.Top+PanelBottom.Height;
end;

procedure TFormMAMESettings.FolderNVRAMButtonSelectClick(Sender: TObject);
begin
  FormMain.DialogSelectFolder(FolderNVRAM, False);
end;

procedure TFormMAMESettings.SpeedChange(Sender: TObject);
begin
  SpeedLabel.Caption:= Format(SpeedLabel.Hint, [Speed.Position]);
end;

procedure TFormMAMESettings.ScreenButtonDefaultSettingsClick(
  Sender: TObject);
begin
  ScreenName.ItemIndex:= 0;
  ScreenAspectRatio.ItemIndex:= 0;
  ScreenResolution.ItemIndex:= 0;
  ScreenView.ItemIndex:= 0;
end;

procedure TFormMAMESettings.SnapSizeAutoClick(Sender: TObject);
begin
  SnapSizeWidth.Enabled:= not SnapSizeAuto.Checked;
  SnapSizeHeight.Enabled:= not SnapSizeAuto.Checked;
  SnapSizeCustomXLabel.Enabled:= not SnapSizeAuto.Checked;
  SnapSizeCustomLabel.Enabled:= not SnapSizeAuto.Checked;
end;

procedure TFormMAMESettings.SnapNameDefaultButtonClick(Sender: TObject);
begin
  SnapName.Text:= '%g/%i';
end;

procedure TFormMAMESettings.SnapSizeWidthKeyPress(Sender: TObject;
  var Key: Char);
begin
  Key:= FormMain.KeyPressValidateNumbers(Key);
end;

procedure TFormMAMESettings.SnapSizeHeightKeyPress(Sender: TObject;
  var Key: Char);
begin
  Key:= FormMain.KeyPressValidateNumbers(Key);
end;

procedure TFormMAMESettings.SnapViewDefaultButtonClick(Sender: TObject);
begin
  SnapView.ItemIndex:= 0;
  SnapView.OnSelect(Self);
end;

procedure TFormMAMESettings.FolderROMsKeyAction(
  Sender: TCustomEasyListview; var CharCode: Word; var Shift: TShiftState;
  var DoDefault: Boolean);
begin
  case CharCode of
    VK_F2: FolderROMsButtonEdit.Click;
    VK_DELETE: FolderROMsButtonDelete.Click;
  end;
end;

procedure TFormMAMESettings.FolderROMsItemEditEnd(
  Sender: TCustomEasyListview; Item: TEasyItem);
begin
  FormMain.ELV_SetEditManager(TEasyListView(Sender), False);
end;

procedure TFormMAMESettings.FolderROMsItemEdited(
  Sender: TCustomEasyListview; Item: TEasyItem; var NewValue: Variant;
  var Accept: Boolean);
begin
  if not Item.Selected then
     Exit;
  if NewValue = '' then
     Accept:= False
  else
     begin
       if Item.Caption <> NewValue then
          Item.Caption:= NewValue;
     end;
end;

procedure TFormMAMESettings.FolderROMsButtonUpClick(Sender: TObject);
begin
  FormMain.ELV_MoveItem(FolderROMs, Boolean(TBitBtnEx(Sender).Tag));
end;

procedure TFormMAMESettings.UIModeKeyChange(Sender: TObject);
begin
  UIModeKeyButtonDetectKey.Enabled:= UIModeKeyCustom.Enabled;
end;

procedure TFormMAMESettings.UIModeKeyButtonDetectKeyClick(Sender: TObject);
begin
  FormMAMESettings.KeyPreview:= False;
  SetEditBkColor(UIModeKeyCustom);
end;

procedure TFormMAMESettings.FolderIniFilesKeyAction(
  Sender: TCustomEasyListview; var CharCode: Word; var Shift: TShiftState;
  var DoDefault: Boolean);
begin
  case CharCode of
    VK_F2: FolderIniFilesButtonEdit.Click;
    VK_DELETE: FolderIniFilesButtonDelete.Click;
  end;
end;

procedure TFormMAMESettings.FolderIniFilesButtonUpClick(Sender: TObject);
begin
  FormMain.ELV_MoveItem(FolderIniFiles, Boolean(TBitBtnEx(Sender).Tag));
end;

procedure TFormMAMESettings.FolderIniFilesButtonSelectClick(
  Sender: TObject);
begin
  FormMain.DialogSelectMultiFolders(FolderIniFiles);
end;

procedure TFormMAMESettings.FolderIniFilesButtonEditClick(Sender: TObject);
begin
  FormMain.ELV_EnableEdit(FolderIniFiles);
end;

procedure TFormMAMESettings.FolderIniFilesButtonDeleteClick(
  Sender: TObject);
begin
  FormMain.ELV_DeleteSelected(FolderIniFiles);
end;

procedure TFormMAMESettings.FolderIniFilesButtonClearClick(Sender: TObject);
begin
  FormMain.ClearListView(FolderIniFiles);
end;

procedure TFormMAMESettings.FolderArtworksKeyAction(
  Sender: TCustomEasyListview; var CharCode: Word; var Shift: TShiftState;
  var DoDefault: Boolean);
begin
  case CharCode of
    VK_F2: FolderArtworksButtonEdit.Click;
    VK_DELETE: FolderArtworksButtonDelete.Click;
  end;
end;

procedure TFormMAMESettings.FolderArtworksButtonUpClick(Sender: TObject);
begin
  FormMain.ELV_MoveItem(FolderArtworks, Boolean(TBitBtnEx(Sender).Tag));
end;

procedure TFormMAMESettings.FolderArtworksButtonSelectClick(
  Sender: TObject);
begin
  FormMain.DialogSelectMultiFolders(FolderArtworks);
end;

procedure TFormMAMESettings.FolderArtworksButtonEditClick(Sender: TObject);
begin
  FormMain.ELV_EnableEdit(FolderArtworks);
end;

procedure TFormMAMESettings.FolderArtworksButtonDeleteClick(
  Sender: TObject);
begin
  FormMain.ELV_DeleteSelected(FolderArtworks);
end;

procedure TFormMAMESettings.FolderArtworksButtonClearClick(
  Sender: TObject);
begin
  FormMain.ClearListView(FolderArtworks);
end;

procedure TFormMAMESettings.FolderCheatFilesButtonSelectClick(
  Sender: TObject);
begin
  FormMain.DialogSelectFolder(FolderCheatFiles, True);
end;

procedure TFormMAMESettings.FolderHashFilesButtonSelectClick(
  Sender: TObject);
begin
  FormMain.DialogSelectFolder(FolderHashFiles, False);
end;

procedure TFormMAMESettings.ShadowMaskTextureButtonSelectClick(
  Sender: TObject);
var
  FolderStr, FileStr, GameStr: String;
begin
  if not FormMain.CheckTotal(FolderArtworks) then
     Exit;
  FolderStr:= FormMain.MountFoldersListMAME(FolderArtworks);
  if FolderStr = '' then
     Exit;
  if FormMAMESettings.Tag = 0 then
     GameStr:= FormMain.GetArcadeSystemIniSection(sysID)
  else
     GameStr:= ChangeFileExt(ExtractFileName(GameIni), '');
  if not FormMain.SelectFileName(31, sysID, emuFileExec, FileStr, FolderStr) then
     Exit;
  ShadowMaskTexture.Text:= FileStr;
  if ShadowMaskTexture.Text <> '' then
     begin
       if PosEx(' ', ShadowMaskTexture.Text) <> 0 then
          ShadowMaskTexture.Text:= '"'+ShadowMaskTexture.Text+'"';
     end;
end;

procedure TFormMAMESettings.FolderCrosshairFilesButtonSelectClick(
  Sender: TObject);
begin
  FormMain.DialogSelectFolder(FolderCrosshairFiles, True);
end;

procedure TFormMAMESettings.UIFontButtonSelectClick(Sender: TObject);
var
  FileStr, FolderList, GameStr: String;
begin
  FolderList:= FolderFontFiles.Text;
  if FolderList = '' then
     FolderList:= ExtractFilePath(emuFileExec);

  if FormMAMESettings.Tag = 0 then
     GameStr:= FormMain.GetArcadeSystemIniSection(sysID)
  else
     GameStr:= ChangeFileExt(ExtractFileName(GameIni), '');

  if not FormMain.SelectFileName(29+Tag, sysID, emuFileExec, FileStr, FolderList) then
     Exit;
  if SameText(FileStr, 'ui') then
     FileStr:= 'default';
  UIFont.Text:= FileStr;
  if UIFont.Text <> '' then
     begin
       if PosEx(' ', UIFont.Text) <> 0 then
          UIFont.Text:= '"'+UIFont.Text+'"';
     end;
end;

procedure TFormMAMESettings.SpeedMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if Button = mbRight then
     Speed.Position:= 1;
end;

procedure TFormMAMESettings.AutobootDelayChange(Sender: TObject);
begin
  if AutobootDelay.Position < 60 then
     begin
       if AutobootDelayLabel.HelpKeyword <> 'sec' then
          AutobootDelayLabel.HelpKeyword:=  'sec'
     end
  else
  if AutobootDelayLabel.HelpKeyword <> 'min' then
     AutobootDelayLabel.HelpKeyword:=  'min';
  AutobootDelayLabel.Caption:= Format(AutobootDelayLabel.Hint, [GetPlayTime(AutobootDelay.Position*1000)+' '+AutobootDelayLabel.HelpKeyword]);
end;

procedure TFormMAMESettings.AutobootLuaScriptButtonSelectClick(Sender: TObject);
begin
  FormMain.DialogOpenFile(16, 'Select a LUA script file', AutobootLuaScript, False);
end;

procedure TFormMAMESettings.SnapViewButtonDefaultClick(Sender: TObject);
begin
  SnapView.ItemIndex:= 0;
end;

procedure TFormMAMESettings.HLSLPathButtonSelectClick(Sender: TObject);
begin
  FormMain.DialogSelectFolder(HLSLPath, False);
end;

procedure TFormMAMESettings.BenchmarkChange(Sender: TObject);
begin
  if Benchmark.Position < 60 then
     begin
       if BenchmarkLabel.Hint <> 'sec' then
          BenchmarkLabel.Hint:=  'sec';
     end
  else
     begin
       if BenchmarkLabel.Hint <> 'min' then
          BenchmarkLabel.Hint:=  'min';
     end;
  BenchmarkLabel.Caption:= 'Benchmark ['+GetPlayTime(Benchmark.Position*1000)+' '+BenchmarkLabel.Hint+']';
end;

procedure TFormMAMESettings.HLSLIniFileButtonResetClick(Sender: TObject);
begin
  HLSLIniFile.Text:= '%g';
end;

procedure TFormMAMESettings.AutobootCommandButtonClearClick(
  Sender: TObject);
begin
  AutobootCommand.Clear;
end;

procedure TFormMAMESettings.ToggleSDLDeviceMappingCustom(SDLDeviceMapping: TComboBox2Ex; SDLCustomMapping: TEditEx);
begin
  SDLCustomMapping.Enabled:= SDLDeviceMapping.ItemIndex = 1;
end;

procedure TFormMAMESettings.SDLJoystickMapping1Select(Sender: TObject);
begin
  ToggleSDLDeviceMappingCustom(SDLJoystickMapping1, SDLJoystickMapping1Custom);
end;

procedure TFormMAMESettings.SDLJoystickMapping2Select(Sender: TObject);
begin
  ToggleSDLDeviceMappingCustom(SDLJoystickMapping2, SDLJoystickMapping2Custom);
end;

procedure TFormMAMESettings.SDLJoystickMapping3Select(Sender: TObject);
begin
  ToggleSDLDeviceMappingCustom(SDLJoystickMapping3, SDLJoystickMapping3Custom);
end;

procedure TFormMAMESettings.SDLJoystickMapping4Select(Sender: TObject);
begin
  ToggleSDLDeviceMappingCustom(SDLJoystickMapping4, SDLJoystickMapping4Custom);
end;

procedure TFormMAMESettings.SDLJoystickMapping5Select(Sender: TObject);
begin
  ToggleSDLDeviceMappingCustom(SDLJoystickMapping5, SDLJoystickMapping5Custom);
end;

procedure TFormMAMESettings.SDLJoystickMapping6Select(Sender: TObject);
begin
  ToggleSDLDeviceMappingCustom(SDLJoystickMapping6, SDLJoystickMapping6Custom);
end;

procedure TFormMAMESettings.SDLJoystickMapping7Select(Sender: TObject);
begin
  ToggleSDLDeviceMappingCustom(SDLJoystickMapping7, SDLJoystickMapping7Custom);
end;

procedure TFormMAMESettings.SDLJoystickMapping8Select(Sender: TObject);
begin
  ToggleSDLDeviceMappingCustom(SDLJoystickMapping8, SDLJoystickMapping8Custom);
end;

procedure TFormMAMESettings.SelectGLSLShaderMAME(EditHolder: TEditEx; IsMAMEFile: Boolean = True);
var
  sFile, sFolder: String;
begin
  if EditHolder.Text <> '' then
     sFolder:= ExtractFilePath(EditHolder.Text);
  if (sFolder <> '') and (not DirectoryExists(sFolder)) then
     sFolder:= ExtractFilePath(emuFileExec);
  case IsMAMEFile of
    True : sFile:= FormMain.DialogOpenFile(12, 'Select a GLSL shader MAME file', EditHolder, False, True, sFolder);
    False: sFile:= FormMain.DialogOpenFile(12, 'Select a GLSL shader screen file', EditHolder, False, True, sFolder);
  end;
  if sFile <> '' then
     EditHolder.Text:= ChangeFileExt(sFile, ''); // shader file cannot have file extension
end;

procedure TFormMAMESettings.GLSL_Shader_MAME0ButtonSelectClick(Sender: TObject);
begin
  SelectGLSLShaderMAME(GLSL_Shader_MAME0);
end;

procedure TFormMAMESettings.GLSL_Shader_MAME1ButtonSelectClick(Sender: TObject);
begin
  SelectGLSLShaderMAME(GLSL_Shader_MAME1);
end;

procedure TFormMAMESettings.GLSL_Shader_MAME2ButtonSelectClick(Sender: TObject);
begin
  SelectGLSLShaderMAME(GLSL_Shader_MAME2);
end;

procedure TFormMAMESettings.GLSL_Shader_MAME3ButtonSelectClick(Sender: TObject);
begin
  SelectGLSLShaderMAME(GLSL_Shader_MAME3);
end;

procedure TFormMAMESettings.GLSL_Shader_MAME4ButtonSelectClick(Sender: TObject);
begin
  SelectGLSLShaderMAME(GLSL_Shader_MAME4);
end;

procedure TFormMAMESettings.GLSL_Shader_MAME5ButtonSelectClick(Sender: TObject);
begin
  SelectGLSLShaderMAME(GLSL_Shader_MAME5);
end;

procedure TFormMAMESettings.GLSL_Shader_MAME6ButtonSelectClick(Sender: TObject);
begin
  SelectGLSLShaderMAME(GLSL_Shader_MAME6);
end;

procedure TFormMAMESettings.GLSL_Shader_MAME7ButtonSelectClick(Sender: TObject);
begin
  SelectGLSLShaderMAME(GLSL_Shader_MAME7);
end;

procedure TFormMAMESettings.GLSL_Shader_MAME8ButtonSelectClick(Sender: TObject);
begin
  SelectGLSLShaderMAME(GLSL_Shader_MAME8);
end;

procedure TFormMAMESettings.GLSL_Shader_MAME9ButtonSelectClick(Sender: TObject);
begin
  SelectGLSLShaderMAME(GLSL_Shader_MAME9);
end;

procedure TFormMAMESettings.GLSL_Shader_Screen0ButtonSelectClick(
  Sender: TObject);
begin
  SelectGLSLShaderMAME(GLSL_Shader_Screen0, False);
end;

procedure TFormMAMESettings.GLSL_Shader_Screen1ButtonSelectClick(
  Sender: TObject);
begin
  SelectGLSLShaderMAME(GLSL_Shader_Screen1, False);
end;

procedure TFormMAMESettings.GLSL_Shader_Screen2ButtonSelectClick(
  Sender: TObject);
begin
  SelectGLSLShaderMAME(GLSL_Shader_Screen2, False);
end;

procedure TFormMAMESettings.GLSL_Shader_Screen3ButtonSelectClick(
  Sender: TObject);
begin
  SelectGLSLShaderMAME(GLSL_Shader_Screen3, False);
end;

procedure TFormMAMESettings.GLSL_Shader_Screen4ButtonSelectClick(
  Sender: TObject);
begin
  SelectGLSLShaderMAME(GLSL_Shader_Screen4, False);
end;

procedure TFormMAMESettings.GLSL_Shader_Screen5ButtonSelectClick(
  Sender: TObject);
begin
  SelectGLSLShaderMAME(GLSL_Shader_Screen5, False);
end;

procedure TFormMAMESettings.GLSL_Shader_Screen6ButtonSelectClick(
  Sender: TObject);
begin
  SelectGLSLShaderMAME(GLSL_Shader_Screen6, False);
end;

procedure TFormMAMESettings.GLSL_Shader_Screen7ButtonSelectClick(
  Sender: TObject);
begin
  SelectGLSLShaderMAME(GLSL_Shader_Screen7, False);
end;

procedure TFormMAMESettings.GLSL_Shader_Screen8ButtonSelectClick(
  Sender: TObject);
begin
  SelectGLSLShaderMAME(GLSL_Shader_Screen8, False);
end;

procedure TFormMAMESettings.GLSL_Shader_Screen9ButtonSelectClick(
  Sender: TObject);
begin
  SelectGLSLShaderMAME(GLSL_Shader_Screen9, False);
end;

procedure TFormMAMESettings.AudioLatencyButtonResetClick(Sender: TObject);
begin
  AudioLatency.ItemIndex:= 1;
end;

procedure TFormMAMESettings.WatchdogKeyPress(Sender: TObject;
  var Key: Char);
begin
  Key:= FormMain.KeyPressValidateNumbers(Key);
end;

procedure TFormMAMESettings.SDL2MouseMapping1Select(Sender: TObject);
begin
  ToggleSDLDeviceMappingCustom(SDL2MouseMapping1, SDL2MouseMapping1Custom);
end;

procedure TFormMAMESettings.SDL2MouseMapping2Select(Sender: TObject);
begin
  ToggleSDLDeviceMappingCustom(SDL2MouseMapping2, SDL2MouseMapping2Custom);
end;

procedure TFormMAMESettings.SDL2MouseMapping3Select(Sender: TObject);
begin
  ToggleSDLDeviceMappingCustom(SDL2MouseMapping3, SDL2MouseMapping3Custom);
end;

procedure TFormMAMESettings.SDL2MouseMapping4Select(Sender: TObject);
begin
  ToggleSDLDeviceMappingCustom(SDL2MouseMapping4, SDL2MouseMapping4Custom);
end;

procedure TFormMAMESettings.SDL2MouseMapping5Select(Sender: TObject);
begin
  ToggleSDLDeviceMappingCustom(SDL2MouseMapping5, SDL2MouseMapping5Custom);
end;

procedure TFormMAMESettings.SDL2MouseMapping6Select(Sender: TObject);
begin
  ToggleSDLDeviceMappingCustom(SDL2MouseMapping6, SDL2MouseMapping6Custom);
end;

procedure TFormMAMESettings.SDL2MouseMapping7Select(Sender: TObject);
begin
  ToggleSDLDeviceMappingCustom(SDL2MouseMapping7, SDL2MouseMapping7Custom);
end;

procedure TFormMAMESettings.SDL2MouseMapping8Select(Sender: TObject);
begin
  ToggleSDLDeviceMappingCustom(SDL2MouseMapping8, SDL2MouseMapping8Custom);
end;

procedure TFormMAMESettings.SDL2KeyboardMapping1Select(Sender: TObject);
begin
  ToggleSDLDeviceMappingCustom(SDL2KeyboardMapping1, SDL2KeyboardMapping1Custom);
end;

procedure TFormMAMESettings.SDL2KeyboardMapping2Select(Sender: TObject);
begin
  ToggleSDLDeviceMappingCustom(SDL2KeyboardMapping2, SDL2KeyboardMapping2Custom);
end;

procedure TFormMAMESettings.SDL2KeyboardMapping3Select(Sender: TObject);
begin
  ToggleSDLDeviceMappingCustom(SDL2KeyboardMapping3, SDL2KeyboardMapping3Custom);
end;

procedure TFormMAMESettings.SDL2KeyboardMapping4Select(Sender: TObject);
begin
  ToggleSDLDeviceMappingCustom(SDL2KeyboardMapping4, SDL2KeyboardMapping4Custom);
end;

procedure TFormMAMESettings.SDL2KeyboardMapping5Select(Sender: TObject);
begin
  ToggleSDLDeviceMappingCustom(SDL2KeyboardMapping5, SDL2KeyboardMapping5Custom);
end;

procedure TFormMAMESettings.SDL2KeyboardMapping6Select(Sender: TObject);
begin
  ToggleSDLDeviceMappingCustom(SDL2KeyboardMapping6, SDL2KeyboardMapping6Custom);
end;

procedure TFormMAMESettings.SDL2KeyboardMapping7Select(Sender: TObject);
begin
  ToggleSDLDeviceMappingCustom(SDL2KeyboardMapping7, SDL2KeyboardMapping7Custom);
end;

procedure TFormMAMESettings.SDL2KeyboardMapping8Select(Sender: TObject);
begin
  ToggleSDLDeviceMappingCustom(SDL2KeyboardMapping8, SDL2KeyboardMapping8Custom);
end;

procedure TFormMAMESettings.SDLLightgunMapping1Select(Sender: TObject);
begin
  ToggleSDLDeviceMappingCustom(SDLLightgunMapping1, SDLLightgunMapping1Custom);
end;

procedure TFormMAMESettings.SDLLightgunMapping2Select(Sender: TObject);
begin
  ToggleSDLDeviceMappingCustom(SDLLightgunMapping2, SDLLightgunMapping2Custom);
end;

procedure TFormMAMESettings.SDLLightgunMapping3Select(Sender: TObject);
begin
  ToggleSDLDeviceMappingCustom(SDLLightgunMapping3, SDLLightgunMapping3Custom);
end;

procedure TFormMAMESettings.SDLLightgunMapping4Select(Sender: TObject);
begin
  ToggleSDLDeviceMappingCustom(SDLLightgunMapping4, SDLLightgunMapping4Custom);
end;

procedure TFormMAMESettings.SDLLightgunMapping5Select(Sender: TObject);
begin
  ToggleSDLDeviceMappingCustom(SDLLightgunMapping5, SDLLightgunMapping5Custom);
end;

procedure TFormMAMESettings.SDLLightgunMapping6Select(Sender: TObject);
begin
  ToggleSDLDeviceMappingCustom(SDLLightgunMapping6, SDLLightgunMapping6Custom);
end;

procedure TFormMAMESettings.SDLLightgunMapping7Select(Sender: TObject);
begin
  ToggleSDLDeviceMappingCustom(SDLLightgunMapping7, SDLLightgunMapping7Custom);
end;

procedure TFormMAMESettings.SDLLightgunMapping8Select(Sender: TObject);
begin
  ToggleSDLDeviceMappingCustom(SDLLightgunMapping8, SDLLightgunMapping8Custom);
end;

procedure TFormMAMESettings.SDLAlternativeLibGLToUseSelect(
  Sender: TObject);
begin
  ToggleSDLDeviceMappingCustom(SDLAlternativeLibGLToUse, SDLAlternativeLibGLToUseCustom);
  SDLAlternativeLibGLToUseCustomButtonSelect.Enabled:= SDLAlternativeLibGLToUseCustom.Enabled;
end;

procedure TFormMAMESettings.SDLAlternativeLibGLToUseCustomButtonSelectClick(
  Sender: TObject);
begin
  FormMain.DialogOpenFile(12, 'Select an alternative libGL.so file to use', SDLAlternativeLibGLToUseCustom, False);
end;

procedure TFormMAMESettings.SDLKeymapFilenameButtonSelectClick(
  Sender: TObject);
begin
  FormMain.DialogOpenFile(19, 'Select a keymap file', SDLKeymapFilename, False);
end;

procedure TFormMAMESettings.SDLKeymapFilenameButtonResetClick(
  Sender: TObject);
begin
  SDLKeymapFilename.Text:= 'keymap.dat';
end;

procedure TFormMAMESettings.SnapNameButtonDefaultClick(Sender: TObject);
begin
  SnapName.Text:= '%g/%i';
end;

procedure TFormMAMESettings.SaveStateNameButtonResetClick(Sender: TObject);
begin
  SaveStateName.Text:= '%g';
end;

procedure TFormMAMESettings.FormActivate(Sender: TObject);
begin
  if FormMAMESettings.HelpContext = 1 then
     Exit;

  FormMAMESettings.HelpContext:= 1;
  SaveValidateAllCustomFiles.Visible:= not ButtonPageFolders.Enabled;
  ButtonHelpSaveValidateAllCustomFiles.Visible:= SaveValidateAllCustomFiles.Visible;

  if not ButtonPageFolders.Enabled then
     begin
       ButtonPageVideo1.Down:= True;
       ButtonPageVideo1.Click;
     end;

  FormMain.HideFilterMsgBox;
end;

function TFormMAMESettings.BiosSetsListViewItemCompare(
  Sender: TCustomEasyListview; Column: TEasyColumn; Group: TEasyGroup;
  Item1, Item2: TEasyItem; var DoDefault: Boolean): Integer;
begin
  if Column.Index = 0 then
     begin
       DoDefault:= False;
       Result:= FormMain.iCompare(Item1.Caption, Item2.Caption);
     end;
end;

procedure TFormMAMESettings.ButtonResetToDefaultClick(Sender: TObject);
begin
  ReadMAMEIniFile(emuIni, True); // read all mame.ini options
end;

procedure TFormMAMESettings.ButtonReadFileHelpClick(Sender: TObject);
begin
  FormMain.InitMessageBox;
  FormMain.AddMsgText('    Button ');
  FormMain.AddMsgText('Reload Settings', MsgTxtColors.colorKeyTitle, [fsBold]);
  FormMain.AddMsgText(' will load a list of custom files one by one, overwriting settings from the previous one.'+
                      ' MAME does this when loading games.'+#13#10);
  FormMain.AddMsgText('mame.ini; ume.ini; hbmame.ini; emufilename.ini'+#13#10+
                      'debug.ini'+#13#10+
                      'vertical.ini', MsgTxtcolors.colorFileName);
  FormMain.AddMsgText(' (if screen game is vertical)'+#13#10);
  FormMain.AddMsgText('horizont.ini', MsgTxtColors.colorFileName);
  FormMain.AddMsgText(' (if screen game is horizontal)'+#13#10);
  FormMain.AddMsgText('arcade.ini', MsgTxtColors.colorFileName);
  FormMain.AddMsgText(' (MAME v0.163 and newer)'+#13#10);
  FormMain.AddMsgText('console.ini', MsgTxtColors.colorFileName);
  FormMain.AddMsgText(' (MAME v0.163 and newer)'+#13#10);
  FormMain.AddMsgText('computer.ini', MsgTxtColors.colorFileName);
  FormMain.AddMsgText(' (MAME v0.163 and newer)'+#13#10);
  FormMain.AddMsgText('othersys.ini', MsgTxtColors.colorFileName);
  FormMain.AddMsgText(' (MAME v0.163 and newer; this filename and its purpose is a mistery to me!)'+#13#10);
  FormMain.AddMsgText('raster.ini', MsgTxtColors.colorFileName);
  FormMain.AddMsgText(' (if screen game is raster)'+#13#10);
  FormMain.AddMsgText('vector.ini', MsgTxtColors.colorFileName);
  FormMain.AddMsgText(' (if screen game is vector)'+#13#10);
  FormMain.AddMsgText('lcd.ini', MsgTxtColors.colorFileName);
  FormMain.AddMsgText(' (if screen game is lcd)'+#13#10);
  FormMain.AddMsgText('svg.ini', MsgTxtColors.colorFileName);
  FormMain.AddMsgText(' (if screen game is svg)'+#13#10);
  FormMain.AddMsgText('source\sourcefile.ini', MsgTxtColors.colorFileName);
  FormMain.AddMsgText(' or ');
  FormMain.AddMsgText('sourcefile.ini'+#13#10, MsgTxtColors.colorFileName);
  FormMain.AddMsgText('biosname.ini'+#13#10, MsgTxtColors.colorFileName);
  FormMain.AddMsgText('parentgame.ini', MsgTxtColors.colorFileName);
  FormMain.AddMsgText(' (if current game is clone)'+#13#10);
  FormMain.AddMsgText('gamename.ini'+#13#10,  MsgTxtColors.colorFileName);
  FormMain.AddMsgText(#13#10+'    Button ');
  FormMain.AddMsgText('Reset to Default', MsgTxtColors.colorKeyTitle, [fsBold]);
  FormMain.AddMsgText(' will only load emulator default settings: mame.ini; ume.ini; hbmame.ini; ignoring everything else.');
  FormMain.ShowMessageBox('Help', 'What each button does ?');
end;

procedure TFormMAMESettings.FolderFontFilesButtonSelectClick(
  Sender: TObject);
begin
  FormMain.DialogSelectFolder(FolderFontFiles, True);
end;

procedure TFormMAMESettings.FolderControllerDefinitionsButtonSelectClick(
  Sender: TObject);
begin
  FormMain.DialogSelectFolder(FolderControllerDefinitions, True);
end;

procedure TFormMAMESettings.FolderDebuggerCommentsButtonSelectClick(Sender: TObject);
begin
  FormMain.DialogSelectFolder(FolderDebuggerComments, False);
end;

procedure TFormMAMESettings.SaveValidateAllCustomFilesClick(Sender: TObject);
begin
  if IsNightMode then
     begin
       if SaveValidateAllCustomFiles.Checked then
          SaveValidateAllCustomFiles.Font.Color:= clrLightBlue
       else
          SaveValidateAllCustomFiles.Font.Color:= clSilver;
     end
  else
     begin
       if SaveValidateAllCustomFiles.Checked then
          SaveValidateAllCustomFiles.Font.Color:= clBlue
       else
          SaveValidateAllCustomFiles.Font.Color:= clrDarkGray;
     end;
end;

procedure TFormMAMESettings.ButtonHelpSaveValidateAllCustomFilesClick(
  Sender: TObject);
begin
  FormMain.InitMessageBox;
  FormMain.AddMsgText('    This feature is used only when saving custom settings.'+#13#10+#13#10);
  FormMain.AddMsgText('Disabled / Unchecked'+#13#10+#13#10, MsgTxtColors.colorKeyTitle, [fsBold], taCenter);
  FormMain.AddMsgText('    Custom settings are validated only against emulator default settings ');
  FormMain.AddMsgText('(mame.ini; hbmame.ini; ume.ini; emufilename.ini)', MsgTxtColors.colorFileName);
  FormMain.AddMsgText(', ignoring all custom files.'+#13#10+
                      'This is the old frontend''s saving method and I for one, prefer this way.'+#13#10+#13#10);
  FormMain.AddMsgText('Enabled / Checked'+#13#10+#13#10, MsgTxtColors.colorKeyTitle, [fsBold], taCenter);
  FormMain.AddMsgText('    It will keep custom settings files clean and avoid duplicated settings across files. '+
                      'All files will be scanned accordingly ');
  FormMain.AddMsgText('(debug.ini; vector.ini; drivername.ini; etc)', MsgTxtColors.colorFileName);
  FormMain.AddMsgText('.'+#13#10+'    There''s one major downside. Say you have settings in ');
  FormMain.AddMsgText('drivername.ini', MsgTxtColors.colorFileName);
  FormMain.AddMsgText(' and ');
  FormMain.AddMsgText('gamename.ini', MsgTxtColors.colorFileName);
  FormMain.AddMsgText('. Then you decide to delete ');
  FormMain.AddMsgText('drivername.ini', MsgTxtColors.colorFileName);
  FormMain.AddMsgText('. All its settings will be lost as they are not listed in later files, '+
                      'forcing you to set them again in ');
  FormMain.AddMsgText('gamename.ini', MsgTxtColors.colorFileName);
  FormMain.AddMsgText('.'+#13#10+#13#10+'In doubt, keep this feature ');
  FormMain.AddMsgText('disabled/unchecked.', MsgTxtColors.colorKeyValue);

  FormMain.ShowMessageBox('Help', 'Validate All Custom Files on Save');
end;

procedure TFormMAMESettings.HTTPServerButtonResetClick(Sender: TObject);
begin
  HTTPPort.Text:= '8080';
  HTTPPath.Text:= 'web';
end;

procedure TFormMAMESettings.HLSLUpscaleSnapXKeyPress(Sender: TObject; var Key: Char);
begin
  Key:= FormMain.KeyPressValidateNumbers(Key);
end;

procedure TFormMAMESettings.HLSLUpscaleSnapYKeyPress(Sender: TObject; var Key: Char);
begin
  Key:= FormMain.KeyPressValidateNumbers(Key);
end;

procedure TFormMAMESettings.HLSLUpscaleSnapButtonResetClick(
  Sender: TObject);
begin
  HLSLUpscaleSnapX.Text:= '2048';
  HLSLUpscaleSnapY.Text:= '1536';

end;

procedure TFormMAMESettings.CommLocalHostKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key in ['\', '/', ':', '*', '?', '"', '<', '>', '|', ','] then
     Key:= Char(0)
end;

procedure TFormMAMESettings.CommLocalPortKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key in ['\', '/', ':', '*', '?', '"', '<', '>', '|', '.'] then
     Key:= Char(0)
end;

procedure TFormMAMESettings.CommLocalHostButtonResetClick(Sender: TObject);
begin
  CommLocalHost.Text:= CommLocalHost.Hint;
  CommLocalPort.Text:= CommLocalPort.Hint;
end;

procedure TFormMAMESettings.CommRemoteHostButtonResetClick(
  Sender: TObject);
begin
  CommRemoteHost.Text:= CommRemoteHost.Hint;
  CommRemotePort.Text:= CommRemotePort.Hint;
end;

procedure TFormMAMESettings.HLSLEnableClick(Sender: TObject);
begin
  if HLSLEnable.Checked then
     EnableGLSL.Checked:= False;
end;

procedure TFormMAMESettings.EnableGLSLClick(Sender: TObject);
begin
  if EnableGLSL.Checked then
     HLSLEnable.Checked:= False;
end;

procedure TFormMAMESettings.VectorBeamWidthMinChange(Sender: TObject);
begin
  VectorBeamWidthMinLabel.Caption:= Format(VectorBeamWidthMinLabel.Hint, [VectorBeamWidthMin.Position]);
end;

procedure TFormMAMESettings.VectorBeamWidthMaxChange(Sender: TObject);
begin
  VectorBeamWidthMaxLabel.Caption:= Format(VectorBeamWidthMaxLabel.Hint, [VectorBeamWidthMax.Position]);
end;

procedure TFormMAMESettings.VectorBeamIntensityWeightChange(
  Sender: TObject);
begin
  VectorBeamIntensityWeightLabel.Caption:= Format(VectorBeamIntensityWeightLabel.Hint, [VectorBeamIntensityWeight.Position]);
end;

procedure TFormMAMESettings.VideoOutputModeButtonHelpClick(
  Sender: TObject);
begin
  FormMain.InitMessageBox;
  FormMain.AddMsgText('OpenGL', MsgTxtColors.colorKeyTitle, [fsBold]);
  FormMain.AddMsgText(' video mode is only supported in SDLMAME and starting from MAME v0.159.'+#13#10);
  FormMain.AddMsgText('DirectDraw', MsgTxtColors.colorKeyTitle, [fsBold]);
  FormMain.AddMsgText(' video mode is only supported in MAME v0.170 and lower versions.'+#13#10+#13#10+
                      'In doubt, leave this setting in ');
  FormMain.AddMsgText('Auto', MsgTxtColors.colorFileName, [fsBold]);
  FormMain.AddMsgText('.');
  FormMain.ShowMessageBox('Info', 'Video output mode.');
end;

procedure TFormMAMESettings.IntegerScaleFactorHorizontalKeyPress(
  Sender: TObject; var Key: Char);
begin
  Key:= FormMain.KeyPressValidateNumbers(Key);
end;

procedure TFormMAMESettings.IntegerScaleFactorVerticalKeyPress(
  Sender: TObject; var Key: Char);
begin
  Key:= FormMain.KeyPressValidateNumbers(Key);
end;

procedure TFormMAMESettings.BGFXShadowMaskTextureNameButtonResetClick(Sender: TObject);
begin
  BGFXShadowMaskTextureName.Text:= 'slot-mask.png';
end;

procedure TFormMAMESettings.BGFXScreenShaderChainsButtonReloadClick(
  Sender: TObject);
begin
  BGFXScreenShaderChains.Text:= BGFXScreenShaderChainsGroupBoxLabel.Hint; // this will hold shader chain's current value
end;

procedure TFormMAMESettings.BGFXScreenShaderChainsButtonResetClick(Sender: TObject);
begin
  BGFXScreenShaderChains.Text:= 'default';
end;

procedure TFormMAMESettings.BGFXScreenShaderChainsButtonSelectClick(Sender: TObject);
var
  fullPath, bFile: String;
begin
  if BGFXPath.Text = '' then
     BGFXPath.Text:= 'bgfx';
  fullPath:= BGFXPath.Text;
  fullPath:= FormMain.FullFolderFix(fullPath, emuFileExec)+'chains\';

  if DirectoryExists(fullPath) then
     begin
       bFile:= FormMain.DialogOpenFile(21, 'Select a BGFX shader chain files', BGFXScreenShaderChains, False, True, fullPath);
       if bFile <> '' then
       begin
         bFile:= ChangeFileExt(ExtractFileName(bfile), '');
         BGFXScreenShaderChains.Text:= bFile;
       end;
     end;
end;

procedure TFormMAMESettings.ShadowMaskTextureButtonResetClick(
  Sender: TObject);
begin
  ShadowMaskTexture.Text:= 'shadow-mask.png';
end;

function TFormMAMESettings.BGFXScreenShaderChains_ListViewItemCompare(
  Sender: TCustomEasyListview; Column: TEasyColumn; Group: TEasyGroup;
  Item1, Item2: TEasyItem; var DoDefault: Boolean): Integer;
begin
  if (Item1.Captions[1] <> 'default') and
     (Item2.Captions[1] = 'default') then
     begin
       Result:= -1;
     end;
end;

procedure TFormMAMESettings.BGFXScreenShaderChains_ListViewItemPaintText(
  Sender: TCustomEasyListview; Item: TEasyItem; Position: Integer;
  ACanvas: TCanvas);
begin
  FormMain.ELV_ItemPaintText_General(Sender, Item, ACanvas);
  if Item.Captions[1] = 'default' then
     ACanvas.Font.Style:= [fsBold];
end;

procedure TFormMAMESettings.BGFXScreenShaderChainsDetailsHTMLLabelMouseEnter(Sender: TObject);
begin
  if IsNightMode then
     TShadowLabel(Sender).Font.Color:= clCream
  else
     TShadowLabel(Sender).Color:= clBlue;
end;

procedure TFormMAMESettings.BGFXScreenShaderChainsDetailsHTMLLabelMouseLeave(Sender: TObject);
begin
  if IsNightMode then
     TShadowLabel(Sender).Font.Color:= clSilver
  else
     TShadowLabel(Sender).Font.Color:= clNavy;
end;

procedure TFormMAMESettings.BGFXScreenShaderChainsDetailsHTMLLabelClick(Sender: TObject);
begin
  CallShellExecute(Sender);
end;

procedure TFormMAMESettings.BGFXScreenShaderChains_ListViewButtonSelectClick(
  Sender: TObject);
begin
  if FormMain.CheckSelected(BGFXScreenShaderChains_ListView) then
     BGFXScreenShaderChains.Text:= BGFXScreenShaderChains_ListView.Selection.First.Captions[1];
end;

procedure TFormMAMESettings.BGFXScreenShaderChains_ListViewButtonAddClick(
  Sender: TObject);
begin
  if not FormMain.CheckSelected(BGFXScreenShaderChains_ListView) then
     Exit;
  if BGFXScreenShaderChains.Text <> '' then
     BGFXScreenShaderChains.Text:= BGFXScreenShaderChains.Text+','+BGFXScreenShaderChains_ListView.Selection.First.Captions[1]
  else
     BGFXScreenShaderChains.Text:= BGFXScreenShaderChains_ListView.Selection.First.Captions[1];
end;

procedure TFormMAMESettings.BGFXScreenShaderChains_ListViewDblClick(
  Sender: TCustomEasyListview; Button: TCommonMouseButton;
  MousePos: TPoint; ShiftState: TShiftState; var Handled: Boolean);
begin
  BGFXScreenShaderChains_ListViewButtonSelect.Click;
end;

procedure TFormMAMESettings.VectorBeamSmoothChange(Sender: TObject);
begin
  VectorBeamSmoothLabel.Caption:= Format(VectorBeamSmoothLabel.Hint, [VectorBeamSmooth.Position]);
end;

procedure TFormMAMESettings.VectorMaximumAttenuationChange(
  Sender: TObject);
begin
  VectorMaximumAttenuationLabel.Caption:= Format(VectorMaximumAttenuationLabel.Hint, [VectorMaximumAttenuation.Position]);
end;

procedure TFormMAMESettings.VectorMinimumLengthAttenuationChange(
  Sender: TObject);
begin
  VectorMinimumLengthAttenuationLabel.Caption:= Format(VectorMinimumLengthAttenuationLabel.Hint, [VectorMinimumLengthAttenuation.Position]);
end;

procedure TFormMAMESettings.PortAudioLatencyKeyPress(Sender: TObject;
  var Key: Char);
begin
  Key:= FormMain.KeyPressValidateNumbers(Key, True);
end;

procedure TFormMAMESettings.HTTPPortKeyPress(Sender: TObject;
  var Key: Char);
begin
  Key:= FormMain.KeyPressValidateNumbers(Key);
end;

procedure TFormMAMESettings.SaveStateRewindBufferSizeChange(
  Sender: TObject);
begin
  SaveStateRewindBufferSizeGroupBoxLabel.Caption:= SaveStateRewindBufferSizeGroupBoxLabel.Hint+' ['+IntToStr(SaveStateRewindBufferSize.Position)+' MegaBytes]';
end;

procedure TFormMAMESettings.BGFXShadowMaskTextureNameButtonSelectClick(
  Sender: TObject);
var
  FolderStr, FileStr, GameStr: String;
begin
  if not FormMain.CheckTotal(FolderArtworks) then
     Exit;
  FolderStr:= FormMain.MountFoldersListMAME(FolderArtworks);
  if FolderStr = '' then
     Exit;
  if FormMAMESettings.Tag = 0 then
     GameStr:= FormMain.GetArcadeSystemIniSection(sysID)
  else
     GameStr:= ChangeFileExt(ExtractFileName(GameIni), '');
  if not FormMain.SelectFileName(32, sysID, emuFileExec, FileStr, FolderStr) then
     Exit;
  BGFXShadowMaskTextureName.Text:= FileStr;
  if BGFXShadowMaskTextureName.Text <> '' then
     begin
       if PosEx(' ', BGFXShadowMaskTextureName.Text) <> 0 then
          BGFXShadowMaskTextureName.Text:= '"'+BGFXShadowMaskTextureName.Text+'"';
     end;
end;

procedure TFormMAMESettings.SelectLUTTextureFile(EditHolder: TEditEx);
var
  sFile, sFolder: String;
begin
  if EditHolder.Text <> '' then
     sFolder:= ExtractFilePath(EditHolder.Text);
  if (sFolder <> '') and (not DirectoryExists(sFolder)) then
     sFolder:= ExtractFilePath(emuFileExec);

  sFile:= FormMain.DialogOpenFile(5, 'Select a LUT texture file', EditHolder, False, True, sFolder);
  if sFile <> '' then
     EditHolder.Text:= sFile; // shader file cannot have file extension
end;

procedure TFormMAMESettings.BGFXPathButtonSelectClick(Sender: TObject);
begin
  FormMain.DialogSelectFolder(BGFXPath, False);
end;

procedure TFormMAMESettings.BGFXLUTTextureNameButtonSelectClick(
  Sender: TObject);
begin
  SelectLUTTextureFile(BGFXLUTTextureName);
end;

procedure TFormMAMESettings.BGFXLUTTextureNameButtonResetClick(
  Sender: TObject);
begin
  BGFXLUTTextureName.Text:= '';
end;

procedure TFormMAMESettings.BloomLUTTextureScreenButtonSelectClick(Sender: TObject);
begin
  SelectLUTTextureFile(BloomLUTTextureScreen);
end;

procedure TFormMAMESettings.BloomLUTTextureScreenButtonResetClick(
  Sender: TObject);
begin
  BloomLUTTextureScreen.Text:= '';
end;

procedure TFormMAMESettings.BloomLUTTextureUIButtonSelectClick(
  Sender: TObject);
begin
  SelectLUTTextureFile(BloomLUTTextureUI);
end;

procedure TFormMAMESettings.BloomLUTTextureUIButtonResetClick(
  Sender: TObject);
begin
  BloomLUTTextureUI.Text:= '';
end;

procedure TFormMAMESettings.FolderManualsPDFButtonSelectClick(Sender: TObject);
begin
  FormMain.DialogSelectFolder(FolderManualsPDF, False);
end;

procedure TFormMAMESettings.ButtonPageFoldersClick(Sender: TObject);

  procedure SetPanel(IsVisible: Boolean);
  begin
    case PanelBottom.Tag of
      1: Panel1_Folders.Visible:=        IsVisible;
      2: Panel2_Video1.Visible:=         IsVisible;
      3: Panel3_Video2.Visible:=         IsVisible;
      4: Panel4_Video3a.Visible:=        IsVisible;
      5: Panel5_LUA.Visible:=            IsVisible;
      6: Panel6_Input.Visible:=          IsVisible;
      7: Panel7_Miscellaneous.Visible:=  IsVisible;
      8: Panel8_SDL.Visible:=            IsVisible;
    end;
  end;
  
begin
  if TSpeedButtonEx(Sender).Tag = PanelBottom.Tag then
     Exit;

  SetPanel(False);
  PanelBottom.Tag:= TSpeedButtonEx(Sender).Tag;
  SetPanel(True);
end;

procedure TFormMAMESettings.ButtonPageVideoEffectsBGFXClick(Sender: TObject);
begin
  if TSpeedButtonEx(Sender).Tag <> Panel4_Video3a.Tag then
     begin
       case TSpeedButtonEx(Sender).Tag of
         1: begin
              Panel4_Video3b.Visible:= False;
              Panel4_Video3c.Visible:= False;
            end;
         2:
           begin
             Panel4_Video3b.Visible:= True;
             Panel4_Video3c.Visible:= False;
           end;
         3:
           begin
             Panel4_Video3c.Visible:= True;
             Panel4_Video3b.Visible:= False;
           end;
       end;
       Panel4_Video3a.Tag:= TSpeedButtonEx(Sender).Tag; 
     end;
end;

procedure TFormMAMESettings.DebuggerPortButtonResetClick(Sender: TObject);
begin
  DebuggerPort.Text:= '23946';
end;

procedure TFormMAMESettings.VectorBeamDotSizeChange(Sender: TObject);
begin
  VectorBeamDotSizeLabel.Caption:= Format(VectorBeamDotSizeLabel.Hint, [VectorBeamDotSize.Position]);
end;

procedure TFormMAMESettings.DebuggerFontButtonResetClick(Sender: TObject);
begin
  DebuggerFont.Font.Name:= 'Lucida Console'; // info taken from "debugger_font", file "mame\uimetrics.cpp"
  DebuggerFont.Font.Size:= 9;
  DebuggerFont.Caption:= 'Font';
  DebuggerFont.Hint:= DebuggerFont.Font.Name+#13#10+'[Auto]';
  DebuggerFontSize.Position:= 0; // auto
end;

procedure TFormMAMESettings.DebuggerFontClick(Sender: TObject);
begin
  FormMain.FontDialog.Font.Name:= DebuggerFont.Font.Name;
  FormMain.FontDialog.Font.Size:= DebuggerFont.Font.Size;
  FormMain.FontDialog.Font.Color:= clBlack;
  FormMain.FontDialog.Tag:= 6;
  if FormMain.FontDialog.Execute then
     begin
       DebuggerFont.Font.Name:= FormMain.FontDialog.Font.Name;
       DebuggerFont.Font.Size:= FormMain.FontDialog.Font.Size;
       DebuggerFont.Hint:= DebuggerFont.Font.Name;
       if DebuggerFont.Font.Name = 'Lucida Console' then
          DebuggerFont.Hint:= DebuggerFont.Hint+#13#10+'[Auto]';

       DebuggerFontSize.Position:= DebuggerFont.Font.Size;
       if (DebuggerFont.Font.Size = 9) and (DebuggerFontSize.Position <> 0) then
          DebuggerFontSize.Position:= 0;
     end;
end;

procedure TFormMAMESettings.DebuggerFontSizeChange(Sender: TObject);
begin
  if DebuggerFontSize.Position > 0 then
     begin
       DebuggerFontSizeLabel.Caption:= 'Font Size '+IntToStr(DebuggerFontSize.Position);
       DebuggerFont.Font.Size:= DebuggerFontSize.Position;
     end
  else
     begin
       DebuggerFontSizeLabel.Caption:= 'Font Size [Auto]';
       DebuggerFont.Font.Size:= 9;
     end;
end;

procedure TFormMAMESettings.SDLAttachWindowButtonClearClick(
  Sender: TObject);
begin
  SDLAttachWindow.Clear;
end;

procedure TFormMAMESettings.UIModeKeyCustomButtonResetClick(
  Sender: TObject);
begin
  UIModeKeyCustom.Text:= 'SCRLOCK';
end;

procedure TFormMAMESettings.FolderROMsItemPaintText(
  Sender: TCustomEasyListview; Item: TEasyItem; Position: Integer;
  ACanvas: TCanvas);
begin
  FormMain.ELV_ItemPaintText_General(Sender, Item, ACanvas);
end;

end.
