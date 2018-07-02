unit uMAMESettings;

interface

uses
  Windows, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ImgList, ComCtrls, Buttons, IniFiles,
  ExtCtrls, GR32_RangeBars, uGR32Extra, MPCommonObjects, EasyListview,
  MPCommonUtilities, Registry, uCommon, PanelEx, AdvOfficeButtons, AdvGroupBox,
  ShadowLabel, ExTrackBar, ToolWin;

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
    NotebookPages: TNotebook;
    ArtworkGroupBox: TAdvGroupBox;
    ArtworkBackdrops: TAdvOfficeCheckBox;
    ArtworkBezels: TAdvOfficeCheckBox;
    ArtworkOverlays: TAdvOfficeCheckBox;
    ArtworkCrop: TAdvOfficeCheckBox;
    ArtworkControlPanels: TAdvOfficeCheckBox;
    ArtworkMarquees: TAdvOfficeCheckBox;
    VectorGroupBox: TAdvGroupBox;
    MultiKeyboard: TAdvOfficeCheckBox;
    Mouse: TAdvOfficeCheckBox;
    MultiMouse: TAdvOfficeCheckBox;
    LightGun: TAdvOfficeCheckBox;
    DualLightGun: TAdvOfficeCheckBox;
    LightGunOffScreenReload: TAdvOfficeCheckBox;
    NaturalKeyboard: TAdvOfficeCheckBox;
    SteadyKey: TAdvOfficeCheckBox;
    CoinLockout: TAdvOfficeCheckBox;
    UIMouse: TAdvOfficeCheckBox;
    JoystickBox: TAdvGroupBox;
    JoystickDeadzone: TGaugeBar2;
    LabelAnalogSettings: TAdvGroupBox;
    LabelAnalog_Paddle: TLabel;
    LabelAnalog_Joystick: TLabel;
    LabelAnalog_LightGun: TLabel;
    LabelAnalog_Pedal: TLabel;
    LabelAnalog_Dial: TLabel;
    LabelAnalog_Trackball: TLabel;
    LabelAnalog_Positional: TLabel;
    LabelAnalog_Mouse: TLabel;
    Analog_Paddle: TComboBox;
    Analog_Joystick: TComboBox;
    Analog_LightGun: TComboBox;
    Analog_Pedal: TComboBox;
    Analog_Dial: TComboBox;
    Analog_Trackball: TComboBox;
    Analog_Positional: TComboBox;
    Analog_Mouse: TComboBox;
    SkipGameInfo: TAdvOfficeCheckBox;
    ReadConfigFiles: TAdvOfficeCheckBox;
    WriteConfigFiles: TAdvOfficeCheckBox;
    Cheat: TAdvOfficeCheckBox;
    LabelRAMSize: TLabel;
    RAMSize: TEdit;
    ConfirmQuit: TAdvOfficeCheckBox;
    DebugGroupBox: TAdvGroupBox;
    Log: TAdvOfficeCheckBox;
    OSLog: TAdvOfficeCheckBox;
    Verbose: TAdvOfficeCheckBox;
    UpdateInPause: TAdvOfficeCheckBox;
    VideoRenderOptionsGroupBox: TAdvGroupBox;
    WindowMode: TAdvOfficeCheckBox;
    MaximizeWindow: TAdvOfficeCheckBox;
    KeepAspectRatio: TAdvOfficeCheckBox;
    WaitVerticalSync: TAdvOfficeCheckBox;
    BilinearFilter: TAdvOfficeCheckBox;
    UIActive: TAdvOfficeCheckBox;
    ButtonReadFile: TBitBtn;
    ButtonOk: TBitBtn;
    ButtonCancel: TBitBtn;
    ToolBarPages: TToolBar;
    ButtonPageFolders: TToolButton;
    ButtonPageVideo1: TToolButton;
    ButtonPageVideo3: TToolButton;
    ButtonPageInput: TToolButton;
    ButtonPageMisc: TToolButton;
    FolderROMsDisksBox: TLabel;
    FolderROMs: TEasyListview;
    FolderROMsButtonUp: TBitBtn;
    FolderROMsButtonDown: TBitBtn;
    FolderROMsButtonSelect: TBitBtn;
    FolderROMsButtonEdit: TBitBtn;
    FolderROMsButtonDelete: TBitBtn;
    FolderROMsButtonClear: TBitBtn;
    LabelFolderIniFiles: TLabel;
    FolderSamples: TEdit;
    FolderSamplesButtonSelect: TBitBtn;
    LabelFolderGameSnapshots: TLabel;
    FolderGameSnapshots: TEdit;
    FolderGameSnapshotsButtonSelect: TBitBtn;
    LabelFolderGamesConfigurations: TLabel;
    FolderGamesConfigurations: TEdit;
    FolderGamesConfigurationsButtonSelect: TBitBtn;
    LabelFolderCheatFiles: TLabel;
    FolderCheatFiles: TEdit;
    FolderCheatFilesButtonSelect: TBitBtn;
    LabelFolderMemoryCards: TLabel;
    FolderMemoryCards: TEdit;
    FolderMemoryCardsButtonSelect: TBitBtn;
    LabelFolderDiff: TLabel;
    FolderDiff: TEdit;
    FolderDiffButtonSelect: TBitBtn;
    LabelFolderSaveStates: TLabel;
    FolderSaveStates: TEdit;
    FolderSaveStatesButtonSelect: TBitBtn;
    LabelFolderNVRAM: TLabel;
    FolderNVRAM: TEdit;
    FolderNVRAMButtonSelect: TBitBtn;
    LabelFolderHashFiles: TLabel;
    FolderHashFiles: TEdit;
    FolderHashFilesButtonSelect: TBitBtn;
    LabelFolderArtworks: TLabel;
    FolderArtworks: TEasyListview;
    FolderArtworksButtonUp: TBitBtn;
    FolderArtworksButtonDown: TBitBtn;
    FolderArtworksButtonSelect: TBitBtn;
    FolderArtworksButtonEdit: TBitBtn;
    FolderArtworksButtonDelete: TBitBtn;
    FolderArtworksButtonClear: TBitBtn;
    LabelFolderSamples: TLabel;
    FolderIniFiles: TEasyListview;
    FolderIniFilesButtonUp: TBitBtn;
    FolderIniFilesButtonDown: TBitBtn;
    FolderIniFilesButtonSelect: TBitBtn;
    FolderIniFilesButtonEdit: TBitBtn;
    FolderIniFilesButtonDelete: TBitBtn;
    FolderIniFilesButtonClear: TBitBtn;
    LabelFolderInputDeviceLogs: TLabel;
    FolderInputDeviceLogs: TEdit;
    FolderInputDeviceLogsButtonSelect: TBitBtn;
    LabelFolderControllerDefinitions: TLabel;
    FolderControllerDefinitionsButtonSelect: TBitBtn;
    LabelFolderCrosshairFiles: TLabel;
    FolderCrosshairFilesButtonSelect: TBitBtn;
    CoinImpulse: TComboBox;
    LabelCoinImpulse: TLabel;
    LabelControllerDefinitions: TLabel;
    ControllerDefinitions: TComboBox;
    LabelVectorFlickerEffect: TLabel;
    VectorFlickerEffect: TGaugeBar2;
    LabelJoystickDeadzone: TLabel;
    Joystick: TAdvOfficeCheckBox;
    JoystickContradictory: TAdvOfficeCheckBox;
    JoystickSaturation: TGaugeBar2;
    LabelJoystickSaturation: TLabel;
    LabelSystemBios: TLabel;
    BiosSetsListView: TEasyListview;
    LabelUIFont: TLabel;
    UIFont: TEdit;
    UIFontSelectFontButton: TBitBtn;
    DebuggerScript: TEdit;
    DebuggerScriptBrowse: TBitBtn;
    LabelDebuggerScript: TLabel;
    DRC: TAdvOfficeCheckBox;
    DRCUseC: TAdvOfficeCheckBox;
    HTTPServer: TAdvGroupBox;
    Label2: TLabel;
    HTTPPort: TEdit;
    Label3: TLabel;
    HTTPPath: TEdit;
    UnevenStretch: TAdvOfficeCheckBox;
    LabelGameTitle: TShadowLabel;
    LabelEmulatorVersion: TShadowLabel;
    SystemIcon: TImage;
    GameIcon: TImage;
    LabelGameStatus: TShadowLabel;
    RAMSizeButtonClear: TBitBtn;
    ButtonPageSDLMAMEInput: TToolButton;
    SDKKeyboardMappingBox: TAdvGroupBox;
    LabelSDLKeymapFilename: TLabel;
    SDLKeymapFilename: TEdit;
    ButtonSDLKeymapFilenameSelect: TBitBtn;
    ButtonSDLKeymapFilenameReset: TBitBtn;
    SDLJoystickMappingBox: TAdvGroupBox;
    SDLJoystickMapping1: TComboBox;
    SDLJoystickMapping1Custom: TEdit;
    LabelSDLJoystickMapping1: TLabel;
    LabelSDLJoystickMapping2: TLabel;
    LabelSDLJoystickMapping3: TLabel;
    LabelSDLJoystickMapping4: TLabel;
    LabelSDLJoystickMapping5: TLabel;
    LabelSDLJoystickMapping6: TLabel;
    LabelSDLJoystickMapping7: TLabel;
    LabelSDLJoystickMapping8: TLabel;
    SDLJoystickMapping2: TComboBox;
    SDLJoystickMapping2Custom: TEdit;
    SDLJoystickMapping3: TComboBox;
    SDLJoystickMapping3Custom: TEdit;
    SDLJoystickMapping4: TComboBox;
    SDLJoystickMapping4Custom: TEdit;
    SDLJoystickMapping5: TComboBox;
    SDLJoystickMapping5Custom: TEdit;
    SDLJoystickMapping6: TComboBox;
    SDLJoystickMapping6Custom: TEdit;
    SDLJoystickMapping7: TComboBox;
    SDLJoystickMapping7Custom: TEdit;
    SDLJoystickMapping8: TComboBox;
    SDLJoystickMapping8Custom: TEdit;
    PS3SixaxisControllers: TAdvOfficeCheckBox;
    SDLLightgunMappingBox: TAdvGroupBox;
    LabelSDLLightgunMapping1: TLabel;
    LabelSDLLightgunMapping2: TLabel;
    LabelSDLLightgunMapping3: TLabel;
    LabelSDLLightgunMapping4: TLabel;
    LabelSDLLightgunMapping5: TLabel;
    LabelSDLLightgunMapping6: TLabel;
    LabelSDLLightgunMapping7: TLabel;
    LabelSDLLightgunMapping8: TLabel;
    SDLLightgunMapping1: TComboBox;
    SDLLightgunMapping1Custom: TEdit;
    SDLLightgunMapping2: TComboBox;
    SDLLightgunMapping2Custom: TEdit;
    SDLLightgunMapping3: TComboBox;
    SDLLightgunMapping3Custom: TEdit;
    SDLLightgunMapping4: TComboBox;
    SDLLightgunMapping4Custom: TEdit;
    SDLLightgunMapping5: TComboBox;
    SDLLightgunMapping5Custom: TEdit;
    SDLLightgunMapping6: TComboBox;
    SDLLightgunMapping6Custom: TEdit;
    SDLLightgunMapping7: TComboBox;
    SDLLightgunMapping7Custom: TEdit;
    SDLLightgunMapping8: TComboBox;
    SDLLightgunMapping8Custom: TEdit;
    SDL2MouseMappingBox: TAdvGroupBox;
    LabelSDL2MouseMapping1: TLabel;
    LabelSDL2MouseMapping2: TLabel;
    LabelSDL2MouseMapping3: TLabel;
    LabelSDL2MouseMapping4: TLabel;
    LabelSDL2MouseMapping5: TLabel;
    LabelSDL2MouseMapping6: TLabel;
    LabelSDL2MouseMapping7: TLabel;
    LabelSDL2MouseMapping8: TLabel;
    SDL2MouseMapping1: TComboBox;
    SDL2MouseMapping1Custom: TEdit;
    SDL2MouseMapping2: TComboBox;
    SDL2MouseMapping2Custom: TEdit;
    SDL2MouseMapping3: TComboBox;
    SDL2MouseMapping3Custom: TEdit;
    SDL2MouseMapping4: TComboBox;
    SDL2MouseMapping4Custom: TEdit;
    SDL2MouseMapping5: TComboBox;
    SDL2MouseMapping5Custom: TEdit;
    SDL2MouseMapping6: TComboBox;
    SDL2MouseMapping6Custom: TEdit;
    SDL2MouseMapping7: TComboBox;
    SDL2MouseMapping7Custom: TEdit;
    SDL2MouseMapping8: TComboBox;
    SDL2MouseMapping8Custom: TEdit;
    SDL2KeyboardMappingBox: TAdvGroupBox;
    LabelSDL2KeyboardMapping1: TLabel;
    LabelSDL2KeyboardMapping2: TLabel;
    LabelSDL2KeyboardMapping3: TLabel;
    LabelSDL2KeyboardMapping4: TLabel;
    LabelSDL2KeyboardMapping5: TLabel;
    LabelSDL2KeyboardMapping6: TLabel;
    LabelSDL2KeyboardMapping7: TLabel;
    LabelSDL2KeyboardMapping8: TLabel;
    SDL2KeyboardMapping1: TComboBox;
    SDL2KeyboardMapping1Custom: TEdit;
    SDL2KeyboardMapping2: TComboBox;
    SDL2KeyboardMapping2Custom: TEdit;
    SDL2KeyboardMapping3: TComboBox;
    SDL2KeyboardMapping3Custom: TEdit;
    SDL2KeyboardMapping4: TComboBox;
    SDL2KeyboardMapping4Custom: TEdit;
    SDL2KeyboardMapping5: TComboBox;
    SDL2KeyboardMapping5Custom: TEdit;
    SDL2KeyboardMapping6: TComboBox;
    SDL2KeyboardMapping6Custom: TEdit;
    SDL2KeyboardMapping7: TComboBox;
    SDL2KeyboardMapping7Custom: TEdit;
    SDL2KeyboardMapping8: TComboBox;
    SDL2KeyboardMapping8Custom: TEdit;
    LabelWatchdog: TLabel;
    Watchdog: TEdit;
    Debugger: TComboBox;
    Label4: TLabel;
    DRCLogUML: TAdvOfficeCheckBox;
    DRCLogNative: TAdvOfficeCheckBox;
    LabelUIFontProvider: TLabel;
    UIFontProvider: TComboBox;
    ButtonResetToDefault: TBitBtn;
    ButtonReadFileHelp: TBitBtn;
    LabelFolderFontFiles: TLabel;
    FolderFontFiles: TEdit;
    FolderFontFilesButtonSelect: TBitBtn;
    ButtonHelpSaveValidateAllCustomFiles: TBitBtn;
    LabelScreenRotation: TAdvGroupBox;
    FlipX: TAdvOfficeCheckBox;
    FlipY: TAdvOfficeCheckBox;
    RotateRight: TAdvOfficeCheckBox;
    RotateLeft: TAdvOfficeCheckBox;
    AutoRotateRight: TAdvOfficeCheckBox;
    AutoRotateLeft: TAdvOfficeCheckBox;
    ScreenOptionsBox: TAdvGroupBox;
    LabelBrightness: TLabel;
    LabelPrescale_ScaleScreen: TLabel;
    LabelContrast: TLabel;
    LabelGamma: TLabel;
    LabelPauseBrightness: TLabel;
    Prescale_ScaleScreen: TGaugeBar;
    Brightness: TGaugeBar2;
    Contrast: TGaugeBar2;
    Gamma: TGaugeBar2;
    PauseBrightness: TGaugeBar2;
    FullScreenBox: TAdvGroupBox;
    LabelFullScreenBrightness: TLabel;
    LabelFullScreenContrast: TLabel;
    LabelFullScreenGamma: TLabel;
    TripleBuffer: TAdvOfficeCheckBox;
    SwitchResolution: TAdvOfficeCheckBox;
    FullScreenBrightness: TGaugeBar2;
    FullScreenContrast: TGaugeBar2;
    FullScreenGamma: TGaugeBar2;
    FolderControllerDefinitions: TEdit;
    FolderCrosshairFiles: TEdit;
    FolderDebuggerCommentsButtonSelect: TBitBtn;
    FolderDebuggerComments: TEdit;
    LabelFolderDebuggerComments: TLabel;
    SaveValidateAllCustomFiles: TAdvOfficeCheckBox;
    SDLVideoPerformance: TAdvOfficeCheckBox;
    SDLOutputModeBox: TAdvGroupBox;
    LabelSDLScaleMode: TLabel;
    SDLCenterHorizontally: TAdvOfficeCheckBox;
    SDLCenterVertically: TAdvOfficeCheckBox;
    SDLScaleMode: TComboBox;
    SDLSplitFullScreenMonitors: TAdvOfficeCheckBox;
    SDLLowLevelDriver: TAdvGroupBox;
    LabelSDLVideoDriverToUse: TLabel;
    LabelSDL2RenderDriverToUse: TLabel;
    LabelSDLAudioDriverToUse: TLabel;
    LabelSDLAlternativeLibGLToUse: TLabel;
    SDLVideoDriverToUse: TComboBox;
    SDL2RenderDriverToUse: TComboBox;
    SDLAudioDriverToUse: TComboBox;
    SDLAlternativeLibGLToUse: TComboBox;
    SDLAlternativeLibGLToUseCustom: TEdit;
    ButtonSDLAlternativeLibGLToUseCustom: TBitBtn;
    ButtonResetHTTPServer: TBitBtn;
    UIModeBox: TAdvGroupBox;
    LabelUIModeKeyCustom: TLabel;
    UIModeKeyCustom: TEdit;
    ButtonUIModeKeyDetectKey: TBitBtn;
    CommOptionsBox: TAdvGroupBox;
    LabelCommLocalHost: TLabel;
    CommLocalHost: TEdit;
    LabelCommLocalPort: TLabel;
    CommLocalPort: TEdit;
    LabelCommRemoteHost: TLabel;
    CommRemoteHost: TEdit;
    LabelCommRemotePort: TLabel;
    CommRemotePort: TEdit;
    CommLocalHostButtonReset: TBitBtn;
    CommLocalPortButtonReset: TBitBtn;
    CommRemoteHostButtonReset: TBitBtn;
    CommRemotePortButtonReset: TBitBtn;
    EnableGlobalInputs: TAdvOfficeCheckBox;
    VectorBeamWidthMin: TGaugeBar2;
    LabelVectorBeamWidthMin: TLabel;
    LabelVectorBeamWidthMax: TLabel;
    VectorBeamWidthMax: TGaugeBar2;
    LabelVectorBeamIntensityWeight: TLabel;
    VectorBeamIntensityWeight: TGaugeBar2;
    FolderLanguageFilesButtonSelect: TBitBtn;
    FolderLanguageFiles: TEdit;
    LabelFolderLanguageFiles: TLabel;
    FolderPluginFilesButtonSelect: TBitBtn;
    FolderPluginFiles: TEdit;
    LabelFolderPluginFiles: TLabel;
    RecordInputTimecodeFile: TAdvOfficeCheckBox;
    LabelRecordInputTimecodeFile: TShadowLabel;
    LabelExitAfterInputPlayback: TShadowLabel;
    ExitAfterInputPlayback: TAdvOfficeCheckBox;
    LabelTypeUserInterface: TLabel;
    TypeUserInterface: TComboBox;
    LabelDisplayLanguage: TLabel;
    DisplayLanguageList: TEasyListview;
    ButtonPageLUA_Audio: TToolButton;
    AutobootBox: TAdvGroupBox;
    LabelAutobootCommand: TLabel;
    LabelAutobootDelay: TLabel;
    LabelAutobootLuaScript: TLabel;
    AutobootCommand: TEdit;
    AutobootDelay: TGaugeBar;
    AutobootLuaScript: TEdit;
    AutobootLuaScriptSelectButton: TBitBtn;
    AutobootCommandButtonClear: TBitBtn;
    EnableEmulatorLUAConsole: TAdvOfficeCheckBox;
    EnableLUAPluginSupport: TAdvOfficeCheckBox;
    LabelLUAPluginsToEnable: TLabel;
    UnevenStretchX: TAdvOfficeCheckBox;
    IntegerScaleFactorHorizontal: TEdit;
    LabelIntegerScaleFactorVertical: TLabel;
    IntegerScaleFactorVertical: TEdit;
    LabelIntegerScaleFactorHorizontal: TLabel;
    LUAPluginsToEnable: TEasyListview;
    LabelLUAPluginsToEnable2: TLabel;
    LabelSnapshotsBox: TAdvGroupBox;
    LabelSnapshotNameFormat: TLabel;
    LabelSnapshotView: TLabel;
    LabelSnapSizeCustomX: TLabel;
    SnapBurnIn: TAdvOfficeCheckBox;
    ButtonSnapNameDefault: TBitBtn;
    SnapView: TComboBox;
    ButtonSnapViewDefault: TBitBtn;
    SnapSizeAuto: TAdvOfficeCheckBox;
    SnapSizeWidth: TEdit;
    SnapSizeHeight: TEdit;
    SnapName: TEdit;
    SnapBilinear: TAdvOfficeCheckBox;
    EffectOverlay: TEdit;
    EffectOverlayBrowse: TBitBtn;
    Label9: TLabel;
    IntegerScaleOverscan: TAdvOfficeCheckBox;
    VideoOutputMode: TComboBox;
    ButtonHelpVideoOutputMode: TBitBtn;
    LabelVideoOutputMode: TLabel;
    GroupBoxAudio: TAdvGroupBox;
    LabelAudioLatency: TLabel;
    LabelSampleRate: TLabel;
    LabelVolume: TLabel;
    LabelSoundOutputMethod: TLabel;
    Samples: TAdvOfficeCheckBox;
    AudioLatency: TComboBox;
    SampleRate: TComboBox;
    Volume: TGaugeBar;
    ButtonAudioLatencyReset: TBitBtn;
    SoundOutputMethod: TComboBox;
    OSDInputOptionsGroupBox: TAdvGroupBox;
    LabelOSDInputKeyboardProvider: TLabel;
    OSDInputKeyboardProvider: TComboBox;
    LabelOSDInputMouseProvider: TLabel;
    OSDInputMouseProvider: TComboBox;
    LabelOSDInputLightgunProvider: TLabel;
    OSDInputLightgunProvider: TComboBox;
    LabelOSDInputJoystickProvider: TLabel;
    OSDInputJoystickProvider: TComboBox;
    Antialias: TAdvOfficeCheckBox;
    Rotate: TAdvOfficeCheckBox;
    NotebookVideoPostProcessingEffectsPages: TNotebook;
    ToolBarVideoPostProcessingEffectsPages: TToolBar;
    ButtonPageVideoEffectsBGFX: TToolButton;
    ButtonPageVideoEffectsHLSL: TToolButton;
    ButtonPageVideoEffectsGLSL: TToolButton;
    LabelShadowMaskTexture: TLabel;
    LabelHLSLPath: TLabel;
    Label7: TLabel;
    LabelHLSLUpscaleSnapshot: TLabel;
    LabelShadowMaskTileMode: TLabel;
    LabelBloomBlendMode: TLabel;
    HLSLEnable: TAdvOfficeCheckBox;
    YIQEnable: TAdvOfficeCheckBox;
    ShadowMaskTexture: TEdit;
    ButtonSelectShadowMaskTexture: TBitBtn;
    HLSLPath: TEdit;
    ButtonSelectHLSLPath: TBitBtn;
    ReadCustomHLSLFile: TAdvOfficeCheckBox;
    WriteCustomHLSLFile: TAdvOfficeCheckBox;
    HLSLIniFile: TEdit;
    HLSLIniFileButtonReset: TBitBtn;
    HLSLUpscaleSnapX: TEdit;
    HLSLUpscaleSnapY: TEdit;
    ButtonHLSLUpscaleSnapReset: TBitBtn;
    HLSLOversampling: TAdvOfficeCheckBox;
    ShadowMaskTileMode: TComboBox;
    BloomBlendMode: TComboBox;
    ShadowMaskTextureButtonReset: TBitBtn;
    LabelBGFXPath: TLabel;
    Label14: TLabel;
    LabelBGFXShadowMaskTextureName: TLabel;
    LabelBGFXScreenShaderChains: TLabel;
    BGFXPath: TEdit;
    BGFXPathButtonSelect: TBitBtn;
    BGFXBackend: TComboBox;
    BGFXDebug: TAdvOfficeCheckBox;
    BGFXShadowMaskTextureName: TEdit;
    BGFXShadowMaskTextureNameButtonSelect: TBitBtn;
    BGFXShadowMaskTextureNameButtonReset: TBitBtn;
    BGFXScreenShaderChains: TEdit;
    BGFXScreenShaderChainsButtonReload: TBitBtn;
    BGFXScreenShaderChainsButtonSelect: TBitBtn;
    LabelEnableOpenGLFilterNotFF: TLabel;
    LabelGLSL_Shader_MAME: TLabel;
    LabelGLSL_Shader_Screen: TLabel;
    LabelGLSL_Shader_Screen0: TLabel;
    LabelGLSL_Shader_Screen1: TLabel;
    LabelGLSL_Shader_Screen2: TLabel;
    LabelGLSL_Shader_Screen3: TLabel;
    LabelGLSL_Shader_Screen4: TLabel;
    LabelGLSL_Shader_Screen5: TLabel;
    LabelGLSL_Shader_Screen6: TLabel;
    LabelGLSL_Shader_Screen7: TLabel;
    LabelGLSL_Shader_Screen8: TLabel;
    LabelGLSL_Shader_Screen9: TLabel;
    LabelGLSL_Shader_MAME0: TLabel;
    LabelGLSL_Shader_MAME1: TLabel;
    LabelGLSL_Shader_MAME2: TLabel;
    LabelGLSL_Shader_MAME3: TLabel;
    LabelGLSL_Shader_MAME4: TLabel;
    LabelGLSL_Shader_MAME5: TLabel;
    LabelGLSL_Shader_MAME6: TLabel;
    LabelGLSL_Shader_MAME7: TLabel;
    LabelGLSL_Shader_MAME8: TLabel;
    LabelGLSL_Shader_MAME9: TLabel;
    OpenGLForcePowerTwoTextures: TAdvOfficeCheckBox;
    OpenGLDisableUseGL_ARBTextureRectangle: TAdvOfficeCheckBox;
    EnableOpenGL_VBO: TAdvOfficeCheckBox;
    EnableOpenGL_PBO: TAdvOfficeCheckBox;
    EnableGLSL: TAdvOfficeCheckBox;
    EnableOpenGLFilterNotFF: TAdvOfficeCheckBox;
    GLSL_Shader_Screen0: TEdit;
    ButtonGLSL_Shader_Screen0: TBitBtn;
    GLSL_Shader_Screen1: TEdit;
    ButtonGLSL_Shader_Screen1: TBitBtn;
    GLSL_Shader_Screen2: TEdit;
    ButtonGLSL_Shader_Screen2: TBitBtn;
    GLSL_Shader_Screen3: TEdit;
    ButtonGLSL_Shader_Screen3: TBitBtn;
    GLSL_Shader_Screen4: TEdit;
    ButtonGLSL_Shader_Screen4: TBitBtn;
    GLSL_Shader_Screen5: TEdit;
    ButtonGLSL_Shader_Screen5: TBitBtn;
    GLSL_Shader_Screen6: TEdit;
    ButtonGLSL_Shader_Screen6: TBitBtn;
    GLSL_Shader_Screen7: TEdit;
    ButtonGLSL_Shader_Screen7: TBitBtn;
    GLSL_Shader_Screen8: TEdit;
    ButtonGLSL_Shader_Screen8: TBitBtn;
    GLSL_Shader_Screen9: TEdit;
    ButtonGLSL_Shader_Screen9: TBitBtn;
    GLSL_Shader_MAME0: TEdit;
    ButtonGLSL_Shader_MAME0: TBitBtn;
    GLSL_Shader_MAME1: TEdit;
    ButtonGLSL_Shader_MAME1: TBitBtn;
    GLSL_Shader_MAME2: TEdit;
    ButtonGLSL_Shader_MAME2: TBitBtn;
    GLSL_Shader_MAME3: TEdit;
    ButtonGLSL_Shader_MAME3: TBitBtn;
    GLSL_Shader_MAME4: TEdit;
    ButtonGLSL_Shader_MAME4: TBitBtn;
    GLSL_Shader_MAME5: TEdit;
    ButtonGLSL_Shader_MAME5: TBitBtn;
    GLSL_Shader_MAME6: TEdit;
    ButtonGLSL_Shader_MAME6: TBitBtn;
    GLSL_Shader_MAME7: TEdit;
    ButtonGLSL_Shader_MAME7: TBitBtn;
    GLSL_Shader_MAME8: TEdit;
    ButtonGLSL_Shader_MAME8: TBitBtn;
    GLSL_Shader_MAME9: TEdit;
    ButtonGLSL_Shader_MAME9: TBitBtn;
    OSDOutputOptionsBox: TAdvGroupBox;
    LabelOSDOutputProvider: TLabel;
    OSDOutputProvider: TComboBox;
    BGFXScreenShaderChains_ListView: TEasyListview;
    BGFXScreenShaderChains_ListViewButtonAdd: TBitBtn;
    BGFXScreenShaderChains_ListViewButtonSelect: TBitBtn;
    LabelBGFXScreenShaderChainsDetailsHTML: TLabel;
    LabelBGFXScreenShaderChainsHelp: TLabel;
    BGFXScreenShaderChainsButtonReset: TBitBtn;
    VectorPostProcessingBox: TAdvGroupBox;
    VectorBeamSmooth: TGaugeBar2;
    LabelVectorBeamSmooth: TLabel;
    VectorMaximumAttenuation: TGaugeBar2;
    LabelVectorMaximumAttenuation: TLabel;
    VectorMinimumLengthAttenuation: TGaugeBar2;
    LabelVectorMinimumLengthAttenuation: TLabel;
    UnevenStretchY: TAdvOfficeCheckBox;
    AutoUnevenStretchXY: TAdvOfficeCheckBox;
    PortAudioSettingsGroupBox: TAdvGroupBox;
    LabelPortAudioAPI: TLabel;
    LabelPortAudioDevice: TLabel;
    LabelPortAudioLatency: TLabel;
    ButtonClearPortAudioAPI: TBitBtn;
    PortAudioAPI: TEdit;
    PortAudioDevice: TEdit;
    ButtonClearPortAudioDevice: TBitBtn;
    PortAudioLatency: TEdit;
    ButtonResetPortAudioLatency: TBitBtn;
    SaveNVRAMOnExit: TAdvOfficeCheckBox;
    Label1: TLabel;
    AutoSave: TAdvOfficeCheckBox;
    EnableSaveStateRewind: TAdvOfficeCheckBox;
    LabelSaveStateRewindBufferSize: TLabel;
    SaveStateRewindBufferSize: TGaugeBar;
    SaveStateName: TEdit;
    LabelSaveStateName: TLabel;
    ButtonSaveStateNameReset: TBitBtn;
    LabelFallbackArtwork: TLabel;
    FallbackArtwork: TEdit;
    ButtonPageVideo2: TToolButton;
    PerformanceGroupBox: TAdvGroupBox;
    LabelSpeed: TLabel;
    LabelFrameskip: TLabel;
    LabelThreadPriority: TLabel;
    LabelNumberProcessors: TLabel;
    LabelBenchmark: TLabel;
    LabelSecondsToRun: TLabel;
    AutoFrameskip: TAdvOfficeCheckBox;
    Throttle: TAdvOfficeCheckBox;
    Sleep: TAdvOfficeCheckBox;
    Multithreading: TAdvOfficeCheckBox;
    RefreshSpeed: TAdvOfficeCheckBox;
    SyncronizeRefreshRate: TAdvOfficeCheckBox;
    Speed: TGaugeBar2;
    Frameskip: TComboBox;
    ThreadPriority: TComboBox;
    NumberProcessors: TComboBox;
    Benchmark: TGaugeBar;
    SecondsToRun: TGaugeBar;
    ScreensBox: TAdvGroupBox;
    LabelScreenName: TLabel;
    LabelScreenAspectRatio: TLabel;
    LabelScreenResolution: TLabel;
    LabelScreenRefreshRate_Custom: TLabel;
    LabelScreenView: TLabel;
    LabelScreensSelector: TLabel;
    ScreenName: TComboBox;
    ScreenAspectRatio: TComboBox;
    ScreenResolution: TComboBox;
    ScreenRefreshRate: TComboBox;
    ScreenView: TComboBox;
    NumberScreens: TExTrackBar;
    ScreensSelector: TComboBox;
    ButtonScreenDefaultSettings: TBitBtn;
    LabelMonitorProvider: TLabel;
    MonitorProvider: TComboBox;
    LabelSnapSizeCustom: TLabel;
    LabelOverrideArtwork: TLabel;
    OverrideArtwork: TEdit;
    CommSyncFrame: TAdvOfficeCheckBox;
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure ButtonReadFileClick(Sender: TObject);
    procedure EffectOverlayBrowseClick(Sender: TObject);
    procedure FolderROMsButtonSelectClick(Sender: TObject);
    procedure FolderSamplesButtonSelectClick(Sender: TObject);
    procedure FolderGamesConfigurationsButtonSelectClick(Sender: TObject);
    procedure FolderMemoryCardsButtonSelectClick(Sender: TObject);
    procedure FolderInputDeviceLogsButtonSelectClick(Sender: TObject);
    procedure FolderSaveStatesButtonSelectClick(Sender: TObject);
    procedure FolderGameSnapshotsButtonSelectClick(Sender: TObject);
    procedure FolderDiffButtonSelectClick(Sender: TObject);
    procedure DebuggerScriptBrowseClick(Sender: TObject);
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
    procedure ButtonScreenDefaultSettingsClick(Sender: TObject);
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
    procedure ButtonUIModeKeyDetectKeyClick(Sender: TObject);
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
    procedure ButtonSelectShadowMaskTextureClick(Sender: TObject);
    procedure FolderCrosshairFilesButtonSelectClick(Sender: TObject);
    procedure UIFontSelectFontButtonClick(Sender: TObject);
    procedure ButtonPageFoldersClick(Sender: TObject);
    procedure SpeedMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure AutobootDelayChange(Sender: TObject);
    procedure AutobootLuaScriptSelectButtonClick(Sender: TObject);
    procedure ButtonSnapViewDefaultClick(Sender: TObject);
    procedure ButtonSelectHLSLPathClick(Sender: TObject);
    procedure BenchmarkChange(Sender: TObject);
    procedure HLSLIniFileButtonResetClick(Sender: TObject);
    procedure AutobootCommandButtonClearClick(Sender: TObject);
    procedure RAMSizeButtonClearClick(Sender: TObject);
    procedure SDLJoystickMapping1Select(Sender: TObject);
    procedure SDLJoystickMapping2Select(Sender: TObject);
    procedure SDLJoystickMapping3Select(Sender: TObject);
    procedure SDLJoystickMapping4Select(Sender: TObject);
    procedure SDLJoystickMapping5Select(Sender: TObject);
    procedure SDLJoystickMapping6Select(Sender: TObject);
    procedure SDLJoystickMapping7Select(Sender: TObject);
    procedure SDLJoystickMapping8Select(Sender: TObject);
    procedure ButtonGLSL_Shader_MAME0Click(Sender: TObject);
    procedure ButtonGLSL_Shader_MAME1Click(Sender: TObject);
    procedure ButtonGLSL_Shader_MAME2Click(Sender: TObject);
    procedure ButtonGLSL_Shader_MAME3Click(Sender: TObject);
    procedure ButtonGLSL_Shader_MAME4Click(Sender: TObject);
    procedure ButtonGLSL_Shader_MAME5Click(Sender: TObject);
    procedure ButtonGLSL_Shader_MAME6Click(Sender: TObject);
    procedure ButtonGLSL_Shader_MAME7Click(Sender: TObject);
    procedure ButtonGLSL_Shader_MAME8Click(Sender: TObject);
    procedure ButtonGLSL_Shader_MAME9Click(Sender: TObject);
    procedure ButtonGLSL_Shader_Screen0Click(Sender: TObject);
    procedure ButtonGLSL_Shader_Screen1Click(Sender: TObject);
    procedure ButtonGLSL_Shader_Screen2Click(Sender: TObject);
    procedure ButtonGLSL_Shader_Screen3Click(Sender: TObject);
    procedure ButtonGLSL_Shader_Screen4Click(Sender: TObject);
    procedure ButtonGLSL_Shader_Screen5Click(Sender: TObject);
    procedure ButtonGLSL_Shader_Screen6Click(Sender: TObject);
    procedure ButtonGLSL_Shader_Screen7Click(Sender: TObject);
    procedure ButtonGLSL_Shader_Screen8Click(Sender: TObject);
    procedure ButtonGLSL_Shader_Screen9Click(Sender: TObject);
    procedure ButtonAudioLatencyResetClick(Sender: TObject);
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
    procedure ButtonSDLAlternativeLibGLToUseCustomClick(Sender: TObject);
    procedure ButtonSDLKeymapFilenameSelectClick(Sender: TObject);
    procedure ButtonSDLKeymapFilenameResetClick(Sender: TObject);
    procedure ButtonSnapNameDefaultClick(Sender: TObject);
    procedure ButtonSaveStateNameResetClick(Sender: TObject);
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
    procedure ButtonResetHTTPServerClick(Sender: TObject);
    procedure HLSLUpscaleSnapXKeyPress(Sender: TObject; var Key: Char);
    procedure HLSLUpscaleSnapYKeyPress(Sender: TObject; var Key: Char);
    procedure ButtonHLSLUpscaleSnapResetClick(Sender: TObject);
    procedure CommLocalHostKeyPress(Sender: TObject; var Key: Char);
    procedure CommLocalPortKeyPress(Sender: TObject; var Key: Char);
    procedure CommLocalHostButtonResetClick(Sender: TObject);
    procedure CommLocalPortButtonResetClick(Sender: TObject);
    procedure CommRemoteHostButtonResetClick(Sender: TObject);
    procedure CommRemotePortButtonResetClick(Sender: TObject);
    procedure HLSLEnableClick(Sender: TObject);
    procedure EnableGLSLClick(Sender: TObject);
    procedure VectorBeamWidthMinChange(Sender: TObject);
    procedure VectorBeamWidthMaxChange(Sender: TObject);
    procedure VectorBeamIntensityWeightChange(Sender: TObject);
    procedure ButtonHelpVideoOutputModeClick(Sender: TObject);
    procedure FolderLanguageFilesButtonSelectClick(Sender: TObject);
    procedure FolderPluginFilesButtonSelectClick(Sender: TObject);
    procedure IntegerScaleFactorHorizontalKeyPress(Sender: TObject;
      var Key: Char);
    procedure IntegerScaleFactorVerticalKeyPress(Sender: TObject;
      var Key: Char);
    procedure RAMSizeKeyPress(Sender: TObject; var Key: Char);
    procedure BGFXShadowMaskTextureNameButtonResetClick(Sender: TObject);
    procedure BGFXScreenShaderChainsButtonReloadClick(Sender: TObject);
    procedure BGFXScreenShaderChainsButtonSelectClick(Sender: TObject);
    procedure ShadowMaskTextureButtonResetClick(Sender: TObject);
    procedure ButtonPageVideoEffectsBGFXClick(Sender: TObject);
    function BGFXScreenShaderChains_ListViewItemCompare(
      Sender: TCustomEasyListview; Column: TEasyColumn; Group: TEasyGroup;
      Item1, Item2: TEasyItem; var DoDefault: Boolean): Integer;
    procedure BGFXScreenShaderChains_ListViewItemPaintText(
      Sender: TCustomEasyListview; Item: TEasyItem; Position: Integer;
      ACanvas: TCanvas);
    procedure LabelBGFXScreenShaderChainsDetailsHTMLMouseEnter(Sender: TObject);
    procedure LabelBGFXScreenShaderChainsDetailsHTMLMouseLeave(Sender: TObject);
    procedure LabelBGFXScreenShaderChainsDetailsHTMLClick(Sender: TObject);
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
  private
    { Private declarations }
    ScreenDetails: packed array[-1..3] of TScreenInfo;
    IsSDLMAME: Boolean;
    IniCustomList: packed array[1..11] of THashedStringList; // 1 -> debug.ini; 11 -> parent_game.ini
    function  RemoveQuotes(const DataString: String): String;
    procedure PopulateNumberProcessors;
    procedure LoadBiosList(const SelectBiosName: String);
    procedure EnableSettingsIniMAME;
    procedure PopulateVideoOutputMode;
    procedure PopulateDisplayLanguage;
    //procedure PopulateBGFXBackend;
    procedure PopulateLUAPlugins_ListView;
    procedure ReadPluginIni(const CustomPluginString: String = '');
    procedure WritePluginIni;
    procedure PopulateBGFXShaderChains_ListView;
    //function  GetCustomIniFile(FileID: ShortInt): String;
    procedure LoadIniToStringList(FileID: ShortInt; var ListHolder: THashedStringList);
    procedure LoadCustomSettingsFiles;
    procedure LoadCustomFilesArray;
    procedure FixScreenViewNameRead(ScreenIndex: Integer);
    procedure FixScreenViewNameWrite(ScreenIndex: Integer);
    procedure ReadMAMEIniFile(const IniFile: String; EmuDefaultSettings: Boolean = False);
    procedure WriteMAMEIniFile(const customIni: String; CustomGameOption: Boolean);
    procedure SelectGLSLShaderMAME(EditHolder: TEdit; IsMAMEFile: Boolean = True);
    procedure EnableDisableControls;
    procedure ToggleSDLDeviceMappingCustom(SDLDeviceMapping: TComboBox; SDLCustomMapping: TEdit);
  public
    { Public declarations }
    emuIni,
    GameIni,
    emuFileExec,
    emuVersionStr: String;
    sysID, ActiveFileID: ShortInt;
    IsAlterMAME: Boolean;
    iVersion: Integer;
  end;

var
  FormMAMESettings: TFormMAMESettings;

implementation

uses uMain;

{$R *.dfm}

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
         ButtonPageVideoEffectsGLSL.Enabled:= True // GLSL_GroupBox.Enabled:= True
      else
      if EntryString =  'hlsl_enable ' then
         ButtonPageVideoEffectsHLSL.Enabled:= True // HLSL_GroupBox.Enabled:= True
      else
      if EntryString =  'bgfx_backend ' then
         ButtonPageVideoEffectsBGFX.Enabled:= True // BGFX_GroupBox.Enabled:= True
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
           LabelIntegerScaleFactorHorizontal.Enabled:= True;
         end
      else
      if (EntryString = 'intscaley ') or
         (EntryString = 'sy ') then
         begin
           IntegerScaleFactorVertical.Enabled:= True;
           LabelIntegerScaleFactorVertical.Enabled:= True;
         end
      else
      if EntryString = 'fallback_artwork ' then
         begin
           FallbackArtwork.Enabled:= True;
           LabelFallbackArtwork.Enabled:= True;
         end
      else
      if EntryString = 'override_artwork ' then
         begin
           OverrideArtwork.Enabled:= True;
           LabelOverrideArtwork.Enabled:= True;
         end
      else
      if (EntryString = 'antialias ') or
         (EntryString = 'aa ') then
         Antialias.Enabled:= True
      else
      if EntryString =  'beam ' then
         begin
           LabelVectorBeamWidthMin.Hint:= 'Beam Width [%2.2f]';
           LabelVectorBeamWidthMin.Caption:= 'Beam Width [1.00]';
           VectorBeamWidthMin.Hint:= 'Set vector beam width';
           LabelVectorBeamWidthMax.Enabled:= False;
           VectorBeamWidthMax.Enabled:= False;
           LabelVectorBeamIntensityWeight.Enabled:= False;
           VectorBeamIntensityWeight.Enabled:= False;
         end
      else
      if (EntryString = 'vector_beam_smooth ') or
         (EntryString = 'vecsmooth ') then
         VectorPostProcessingBox.Enabled:= True
      else
      if EntryString =  'http ' then
         HTTPServer.Enabled:= True
      else
      if EntryString =  'console ' then
         EnableEmulatorLUAConsole.Enabled:= True
      else
      if (EntryString = 'autoboot_script ') or
         (EntryString = 'script ') then
         AutobootBox.Enabled:= True
      else
      if EntryString =  'plugins ' then
         begin
           EnableLUAPluginSupport.Enabled:= True;
           LUAPluginsToEnable.Enabled:= True;
           LabelLUAPluginsToEnable.Enabled:= True;
           LabelLUAPluginsToEnable2.Enabled:= True;
         end
      else
      if (EntryString =  'language ') or
         (EntryString =  'lang ') then
         begin
           LabelDisplayLanguage.Enabled:= True;
           DisplayLanguageList.Enabled:= True;
         end
      else
      if EntryString =  'useallheads ' then
         SDLSplitFullScreenMonitors.Enabled:= True
      else
      if EntryString =  'skip_gameinfo ' then
         SkipGameInfo.Enabled:= True
      else
      if EntryString =  'uifont ' then
         begin
           UIFont.Enabled:= True;
           LabelUIFont.Enabled:= True;
           UIFontSelectFontButton.Enabled:= True;
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
         OSDInputOptionsGroupBox.Enabled:= True;
    end;
  end;
  FreeAndNil(mameIni);
end;

procedure TFormMAMESettings.PopulateVideoOutputMode;
//var
//  mameIni: THashedStringList;
//  Loop: Integer;
begin
  if VideoOutputMode.Items.Count > 0 then
     Exit;
  IsSDLMAME:= False;

  if sysID in [idMAME, idHBMAME] then
     begin
       if PosEx('sdl', LowerCase(emuFileExec)) <> 0 then
          IsSDLMAME:= True;

       {if FileExists(emuIni) then
          begin
            mameIni:= THashedStringList.Create;
            mameIni.LoadFromFile(emuIni);
            for Loop:=0 to mameIni.Count-1 do
            begin
              if SameText(Copy(mameIni[Loop], 1, 12), 'sdlvideofps ') then
                 begin
                   IsSDLMAME:= True;
                 end
              else
              if SameText(Copy(mameIni[Loop], 1, 8), 'gl_glsl ') then
                 begin
                   GLSL_GroupBox.Enabled:= True;
                 end
              else
              if SameText(Copy(mameIni[Loop], 1, 12), 'hlsl_enable ') then
                 begin
                   HLSL_GroupBox.Enabled:= True;
                 end
              else
              if SameText(Copy(mameIni[Loop], 1, 13), 'bgfx_backend ') then
                 begin
                   BGFX_GroupBox.Enabled:= True;
                 end
              else

              //if SameText(Copy(mameIni[Loop], 1, 16), 'hlsl_prescale_x ') then
              //   begin
              //     LabelHLSLPrescaleOverride.Enabled:= True;
              //     LabelHLSLPrescaleOverrideX.Enabled:= True;
              //     HLSLPrescaleOverrideX.Enabled:= True;
              //     LabelHLSLPrescaleOverrideY.Enabled:= True;
              //     HLSLPrescaleOverrideY.Enabled:= True;
              //   end
              //else
              if SameText(Copy(mameini[Loop], 1, 5), 'beam ') then
                 begin
                   LabelVectorBeamWidthMin.Hint:= 'Beam Width [%2.2f]';
                   LabelVectorBeamWidthMin.Caption:= 'Beam Width [1.00]';
                   VectorBeamWidthMin.Hint:= 'Set vector beam width';
                   LabelVectorBeamWidthMax.Enabled:= False;
                   VectorBeamWidthMax.Enabled:= False;
                   LabelVectorBeamIntensityWeight.Enabled:= False;
                   VectorBeamIntensityWeight.Enabled:= False;
                 end
              else
              if SameText(Copy(mameini[Loop], 1, 5), 'http ') then
                 HTTPServer.Enabled:= True
              else
              if SameText(Copy(mameini[Loop], 1, 8), 'console ') then
                 EnableEmulatorLUAConsole.Enabled:= True
              else
              if SameText(Copy(mameini[Loop], 1, 8), 'plugins ') then
                 EnableLUAPluginSupport.Enabled:= True
              else
              if SameText(Copy(mameini[Loop], 1, 9), 'language ') or
                 SameText(Copy(mameini[Loop], 1, 5), 'lang ') then
                 begin
                   LabelDisplayLanguage.Enabled:= True;
                   DisplayLanguageList.Enabled:= True;
                 end
              else
              if SameText(Copy(mameini[Loop], 1, 12), 'useallheads ') then
                 SDLSplitFullScreenMonitors.Enabled:= True
              else
              if SameText(Copy(mameini[Loop], 1, 14), 'skip_gameinfo ') then
                 SkipGameInfo.Enabled:= True
              else
              if SameText(Copy(mameini[Loop], 1, 7), 'uifont ') then
                 begin
                   UIFont.Enabled:= True;
                   LabelUIFont.Enabled:= True;
                   UIFontSelectFontButton.Enabled:= True;
                 end
              else
              if SameText(Copy(mameini[Loop], 1, 9), 'ui_mouse ') then
                 UIMouse.Enabled:= True
              if SameText(Copy(mameini[Loop], 1, 15), 'multithreading ') or
                 SameText(Copy(mameini[Loop], 1, 3), 'mt ') or
                 Multithreading.Enabled:= True;
            end;
            FreeAndNil(mameIni);
          end;}
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
        //ButtonPageSDLMAME.Enabled:= False;
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
  //lFullPath:= FullEmuFolderFix(lFullPath, sysID, False, IsAlterMAME); // old, causes crash on a fresh install
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
  DisplayLanguageList.Header.Columns[0].Width:= DisplayLanguageList.Header.Columns[0].Width-GetSystemMetrics(SM_CXVSCROLL);
  DisplayLanguageList.Selection.InvalidateVisibleSelected(False);
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
  MAMEIniFile, ctrlrDefinitionsList, FoldersList: THashedStringList;
  Loop, Loop2: Integer;

  function SetComboBoxItemZero(ComboBoxHolder: TComboBox): Boolean;
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
          cResolution:= 'auto';
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
       cResolution:= 'auto';
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

  function GetGLSLShaderMAME(EditHolder: TEdit): Boolean;
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

  function GetSDLDeviceMapping(ComboBoxHolder: TComboBox; EditHolder: TEdit): Boolean;
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
  if not FileExists(IniFile) then
     Exit;

   ThousandSeparator:= Char(',');
   DecimalSeparator:= Char('.');
   MAMEIniFile:= THashedStringList.Create;
   MAMEIniFile.LoadFromFile(IniFile);
   for Loop:=0 to MAMEIniFile.Count -1 do
   begin
     TextLine:= MAMEIniFile[Loop];
     with FormMAMESettings do
     begin
       if TextLine <> '' then
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
                 FormMain.ExtractFolders2MAME(sysID, Value, FoldersList, emuFileExec); // add to HashedStringList in RAM with FULL path...
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
                 LabelSnapSizeCustomX.Hint:= LowerCase(GetStringValue);
                 SnapSizeAuto.Checked:= LabelSnapSizeCustomX.Hint = 'auto';
                 //LabelSnaphotResolution.Hint:= LowerCase(GetStringValue);
                 //SnapSizeAuto.Checked:= LabelSnaphotResolution.Hint = 'auto';
                 case SnapSizeAuto.Checked of
                   True:
                     begin
                       SnapSizeWidth.Text:= '';
                       SnapSizeHeight.Text:= '';
                     end;
                   False:
                     begin
                       //Loop2:= Pos('x', LabelSnaphotResolution.Hint);
                       Loop2:= PosEx('x', LabelSnapSizeCustomX.Hint);
                       if Loop2 = 0 then
                          SnapSizeAuto.Checked:= True
                       else
                          begin
                            SnapSizeWidth.Text:= Copy(LabelSnapSizeCustomX.Hint, 1, Loop2-1);
                            SnapSizeHeight.Text:= Copy(LabelSnapSizeCustomX.Hint, Loop2+1, Length(LabelSnapSizeCustomX.Hint));
                            //SnapSizeWidth.Text:= Copy(LabelSnaphotResolution.Hint, 1, Loop2-1);
                            //SnapSizeHeight.Text:= Copy(LabelSnaphotResolution.Hint, Loop2+1, Length(LabelSnaphotResolution.Hint));
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
            if (EntryString = 'volume ') or
               (EntryString = 'vol ') then
               Volume.Position:= GetIntegerValue
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
               begin
                 UIModeKeyCustom.Text:= GetStringValue;
               end
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
               end;

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
                 if Value = 'none' then
                    OSDInputKeyboardProvider.ItemIndex:= 5;
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
                 if Value = 'none' then
                    OSDInputMouseProvider.ItemIndex:= 4;
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
                 if Value = 'none' then
                    OSDInputLightgunProvider.ItemIndex:= 2;
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
               DebugGroupBox.CheckBox.Checked:= GetBooleanValue
            else
            if EntryString = 'debugscript ' then
               DebuggerScript.Text:= GetStringValue
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
                    //GenerateMessage('OOPS', 'Debugger option unknown.', 'This setting is not supported by the frontend. Please notify the author:'+
                    //                #13#10+#13#10+'entry: debugger'+#13#10+'value: '+Value, 2);
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
                      NotebookPages.Tag:= NotebookPages.PageIndex;
                      NotebookPages.ActivePage:= 'Miscellaneous';
                      FormMain.ELV_SelectItem(BiosSetsListView, 0, BiosSetsListView.Hint, 1);
                      NotebookPages.PageIndex:= NotebookPages.Tag;
                      NotebookPages.Tag:= 0;
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
            if EntryString = 'uifont ' then
               UIFont.Text:= GetStringValue
            else
            if (EntryString = 'ramsize ') or
               (EntryString = 'ram ') then
               RAMSize.Text:= GetStringValue
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
                    GenerateMessage('Error', 'Read emulator settings',
                                    '    The auto-boot delay is higher than 180 seconds (3 minutes). This value is not supported.'+#13#10+
                                    ' Please contact the author so this can be changed. Thank you.', 2);
               end
            else
            if (EntryString = 'autoboot_script ') or
               (EntryString = 'script ') then
               AutobootLuaScript.Text:= GetStringValue
            else
            if EntryString = 'http ' then
               HTTPServer.CheckBox.Checked:= GetBooleanValue
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
            //if EntryString = 'noplugin ' then
            //   begin
            //     // list of plugins to disable... separated by comma (  ;  )
            //   end
            //else            
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
                 if Value = 'osx' then
                    UIFontProvider.ItemIndex:= 4
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
                 if Value = 'opengl' then
                    BGFXBackend.ItemIndex:= 3
                 else
                 if Value = 'gles' then
                    BGFXBackend.ItemIndex:= 4
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
               SDKKeyboardMappingBox.CheckBox.Checked:= GetBooleanValue
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
                 ButtonSDLAlternativeLibGLToUseCustom.Enabled:= SDLAlternativeLibGLToUseCustom.Enabled;
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
      if IsAlterMAME then
         FileFolder:= FormMain.AlterMAMEIniFilesDir
      else
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
  Value, tmpEntryStr, EntryString: String;

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

  function SetGLSLShader(EditHolder: TEdit): String;
  begin
    Result:= 'none';
    if EditHolder.Text <> '' then
       Result:= EditHolder.Text;
  end;

  function SetSDLDevice(ComboBoxHolder: TComboBox; EditHolder: TEdit): String;
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
       GenerateMessage('Error', 'Failed to update settings.', '    Emulator .ini filename is blank. '+
                       'Please try selecting an emulator again in Arcade Emulators Setup screen. Aborting...', 2, False, 1);
       Exit;
     end;
  case CustomGameOption of
    True:
      begin
        if customIni = '' then
           begin
             GenerateMessage('Error', 'Failed to update settings.', '    Custom .ini filename is blank. '+
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
        if FormMain.CheckReadOnly(emuIni) then
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
            //SetSnapViewOption(EntryString)
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
         if (tmpEntryStr = 'volume ') or
            (tmpEntryStr = 'vol ') then
            UpdateMAMELine(EntryString, IntToStr(Volume.Position))
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
            UpdateMAMELine(EntryString, GetBooleanValue(DebugGroupBox.CheckBox.Checked))
         else
         if tmpEntryStr = 'debugscript ' then
            UpdateMAMELine('debugscript', DebuggerScript.Text)
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
         if tmpEntryStr = 'uifont ' then
            begin
              FormMain.FixEmptyValue(UIFont, 'default');
              UpdateMAMELine(EntryString, UIFont.Text);
            end
         else
         if (tmpEntryStr = 'ramsize ') or
            (tmpEntryStr = 'ram ') then
            UpdateMAMELine(EntryString, RAMSize.Text)
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
            UpdateMAMELine(EntryString, GetBooleanValue(HTTPServer.CheckBox.Checked))
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
              Value:= 'auto';
              case BGFXBackend.ItemIndex of
                0: Value:= 'auto';
                1: Value:= 'd3d9';
                2: Value:= 'd3d11';
                3: Value:= 'opengl';
                4: Value:= 'gles';
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
            UpdateMAMELine(EntryString, GetBooleanValue(SDKKeyboardMappingBox.CheckBox.Checked))
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
  LabelSystemBios.Caption:= 'Bios: '+BiosSet.ReadString('Descriptions', FormMain.MemGameInfo.eBiosName, '');
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
       SetCurrentDir(FormMain.FrontendPath);
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

  if IsAlterMAME then
     FileFolder:= FormMain.AlterMAMEIniFilesDir
  else
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
        if IsAlterMAME then
           FileFolder:= FormMain.AlterMAMEIniFilesDir
        else
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

procedure TFormMAMESettings.EffectOverlayBrowseClick(Sender: TObject);
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
  FormMain.DialogSelectFolder(FolderGameSnapshots, False);
end;

procedure TFormMAMESettings.FolderDiffButtonSelectClick(Sender: TObject);
begin
  FormMain.DialogSelectFolder(FolderDiff, False);
end;

procedure TFormMAMESettings.DebuggerScriptBrowseClick(Sender: TObject);
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
  LabelVolume.Caption:= Format(LabelVolume.Hint, [Volume.Position]);
end;

procedure TFormMAMESettings.JoystickDeadzoneChange(Sender: TObject);
begin
  LabelJoystickDeadzone.Caption:= Format(LabelJoystickDeadzone.Hint, [JoystickDeadzone.Position]);
end;

procedure TFormMAMESettings.BrightnessChange(Sender: TObject);
begin
  LabelBrightness.Caption:= Format(LabelBrightness.Hint, [Brightness.Position]);
end;

procedure TFormMAMESettings.ContrastChange(Sender: TObject);
begin
  LabelContrast.Caption:= Format(LabelContrast.Hint, [Contrast.Position]);
end;

procedure TFormMAMESettings.GammaChange(Sender: TObject);
begin
  LabelGamma.Caption:= Format(LabelGamma.Hint, [Gamma.Position]);
end;

procedure TFormMAMESettings.PauseBrightnessChange(Sender: TObject);
begin
  LabelPauseBrightness.Caption:= Format(LabelPauseBrightness.Hint, [PauseBrightness.Position]);
end;

procedure TFormMAMESettings.LabelJoystickSaturationValueClick(
  Sender: TObject);
begin
  LabelJoystickSaturation.Caption:= Format('%1.2f', [JoystickSaturation.Position]);
end;

procedure TFormMAMESettings.Prescale_ScaleScreenChange(Sender: TObject);
begin
  LabelPrescale_ScaleScreen.Caption:= Format(LabelPrescale_ScaleScreen.Hint, [Prescale_ScaleScreen.Position]);
end;

procedure TFormMAMESettings.FullScreenBrightnessChange(Sender: TObject);
begin
  LabelFullScreenBrightness.Caption:= Format(LabelFullScreenBrightness.Hint, [FullScreenBrightness.Position]);
end;

procedure TFormMAMESettings.FullScreenContrastChange(Sender: TObject);
begin
  LabelFullScreenContrast.Caption:= Format(LabelFullScreenContrast.Hint, [FullScreenContrast.Position]);
end;

procedure TFormMAMESettings.FullScreenGammaChange(Sender: TObject);
begin
  LabelFullScreenGamma.Caption:= Format(LabelFullScreenGamma.Hint, [FullScreenGamma.Position]);
end;

procedure TFormMAMESettings.VectorFlickerEffectChange(Sender: TObject);
begin
  LabelVectorFlickerEffect.Caption:= Format(LabelVectorFlickerEffect.Hint, [VectorFlickerEffect.Position]);
end;

procedure TFormMAMESettings.SecondsToRunChange(Sender: TObject);
begin
  if SecondsToRun.Position < 60 then
     begin
       if LabelSecondsToRun.Hint <> 'sec' then
          LabelSecondsToRun.Hint:= 'sec';
     end
  else
     begin
       if LabelSecondsToRun.Hint <> 'min' then
          LabelSecondsToRun.Hint:= 'min';
     end;
  LabelSecondsToRun.Caption:= SecondsToRun.Hint+GetPlayTime(SecondsToRun.Position*1000)+' '+LabelSecondsToRun.Hint+']';
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

  ScreenName.Hint:= LabelScreenName.Hint+' '+HintStr;
  ScreenAspectRatio.Hint:= LabelScreenAspectRatio.Hint+' '+HintStr;
  ScreenResolution.Hint:= LabelScreenResolution.Hint+' '+HintStr;
  ScreenView.Hint:= LabelScreenView.Hint+' '+HintStr;
end;

procedure TFormMAMESettings.ScreenRefreshRateSelect(
  Sender: TObject);
begin
  if not SameText(ScreenDetails[ScreensSelector.Tag].eScreenRefreshRate, ScreenRefreshRate.Text) then
     ScreenDetails[ScreensSelector.Tag].eScreenRefreshRate:= ScreenRefreshRate.Text;
end;

procedure TFormMAMESettings.JoystickSaturationChange(Sender: TObject);
begin
  LabelJoystickSaturation.Caption:= Format(LabelJoystickSaturation.Hint, [JoystickSaturation.Position]);
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
  //if not HLSL_GroupBox.Enabled then
  //   FormMain.SetGroupBoxState(HLSL_GroupBox, False, True);
  //if not GLSL_GroupBox.Enabled then
  //   FormMain.SetGroupBoxState(GLSL_GroupBox, False, True);
  //if not BGFX_GroupBox.Enabled then
  //   FormMain.SetGroupBoxState(BGFX_GroupBox, False, True);
  if not OSDInputOptionsGroupBox.Enabled then
     FormMain.SetGroupBoxState(OSDInputOptionsGroupBox, False, True);
  if not AutobootBox.Enabled then
     FormMain.SetGroupBoxState(AutobootBox, False, True);

  if not VectorPostProcessingBox.Enabled then
     FormMain.SetGroupBoxState(VectorPostProcessingBox, False, True);

  case IsSDLMAME of
    True:
      begin
        //for Loop:= 0 to HLSL_GroupBox.ControlCount-1 do
        //    HLSL_GroupBox.Controls[Loop].Enabled:= False;
        //HLSL_GroupBox.Font.Color:= clBtnShadow;
        //HLSL_GroupBox.Enabled:= False;
        //FormMain.SetGroupBoxState(DebuggerFontBox, False, True); // removed since MAME 0.61 have changed debugger font for 'auto'... too much hassle to support!!!!
        //for Loop:=0 to DebuggerFontBox.ControlCount-1 do
        //    DebuggerFontBox.Controls[Loop].Enabled:= False;
        //DebuggerFontBox.Font.Color:= clBtnShadow;
        //DebuggerFontBox.Enabled:= False;

      end;
    False:
      begin
        NotebookVideoPostProcessingEffectsPages.DoubleBuffered:= True;
        //HLSL_GroupBox.DoubleBuffered:= True;
        //GLSL_GroupBox.DoubleBuffered:= True;
        //BGFX_GroupBox.DoubleBuffered:= True;
        //ButtonPageSDLMAMEVideoAudio.Enabled:= False;
        ButtonPageSDLMAMEInput.Visible:= False;//Enabled:= False;
      end;
  end;
  FormMain.SetGroupBoxState(HTTPServer, HTTPServer.Enabled, True);
end;

procedure TFormMAMESettings.FormShow(Sender: TObject);
var
  iStr: String;
begin
  FormMain.ResizeFormAddScrollBars(FormMAMESettings);

  VectorGroupBox.DoubleBuffered:= True;
  VectorPostProcessingBox.DoubleBuffered:= True;
  PerformanceGroupBox.DoubleBuffered:= True;
  GroupBoxAudio.DoubleBuffered:= True;
  ScreenOptionsBox.DoubleBuffered:= True;
  FullScreenBox.DoubleBuffered:= True;
  JoystickBox.DoubleBuffered:= True;
  AutobootBox.DoubleBuffered:= True;

  {SDLOutputModeBox.DoubleBuffered:= True;
  GLSL_GroupBox.DoubleBuffered:= True;
  SDLLowLevelDriver.DoubleBuffered:= True;
  SDKKeyboardMappingBox.DoubleBuffered:= True;
  SDLJoystickMappingBox.DoubleBuffered:= True;
  SDLLightgunMappingBox.DoubleBuffered:= True;
  SDL2MouseMappingBox.DoubleBuffered:= True;
  SDL2KeyboardMappingBox.DoubleBuffered:= True;}

  FormMain.ELV_ResetNormalColors(FolderROMs);
  FormMain.ELV_ResetNormalColors(FolderIniFiles);
  FormMain.ELV_ResetNormalColors(FolderArtworks);
  FormMain.ELV_ResetNormalColors(BiosSetsListView);
  FormMain.ELV_ResetNormalColors(DisplayLanguageList);
  FormMain.ELV_ResetNormalColors(LUAPluginsToEnable);
  FormMain.ELV_ResetNormalColors(BGFXScreenShaderChains_ListView);

  SaveValidateAllCustomFiles.Checked:= Boolean(FormMain.PopupCustomMAME.Tag);
  if IsAlterMAME then
     FormMAMESettings.Caption:= 'AlterMAME '+FormMAMESettings.Caption;
  IsSDLMAME:= False;
  PopulateVideoOutputMode;
  EnableSettingsIniMAME; //
  if IsSDLMAME then
     begin
       Debugger.Items.BeginUpdate;
       Debugger.Items[2]:= 'QT';
       Debugger.Items.EndUpdate;
     end;
  case SystemIcon.Tag of
    0: LabelGameTitle.Caption:= FormMain.GetArcadeGameSysTitle(Tag = 1, sysID, emuVersionStr, IsAlterMAME);
    1: LabelGameTitle.Caption:= FormMain.GetArcadeGameSysTitle(False, sysID, emuVersionStr, IsAlterMAME);
  end;

  if (Tag = 0) or (SystemIcon.Tag = 1) then
     begin
       LabelEmulatorVersion.Caption:= emuFileExec+#13#10+emuIni;//GameIni;//LabelReadFileIni.Caption;
       // old code, use "emuFileExec" var (March 16, 2016)
       //case IsAlterMAME of
       //  True : LabelEmulatorVersion.Caption:= FormMain.AlterMAMEFile+#13#10+emuIni;//GameIni;//LabelReadFileIni.Caption;
       //  False: LabelEmulatorVersion.Caption:= FormMain.EmulatorFile[sysID]+#13#10+emuIni;//GameIni;//LabelReadFileIni.Caption;
       //end;

       case sysID of
         idMAME  : TopBar.Color1:= clSkyBlue; // MAME
         idHBMAME: TopBar.Color1:= $00b4bf8f;//$00bfb490; // HBMAME
       end;

       FormMain.LoadIconIntoImage(FormMain.GetArcadeSystemIconFileName(sysID), SystemIcon);
       //FormMain.IL_ArcadeSystem_ExtraLarge.GetIcon(sysID, SystemIcon.Picture.Icon);
       FormMain.LoadMessageIcon(GameIcon, 'info.ico');

       LabelGameStatus.Visible:= False;

       // custom settings only. folders settings are only available when configuring MAME/HBMAME main settings (mame.ini; ume.ini; hbmame.ini)
       if SystemIcon.Tag = 1 then
          ButtonPageFolders.Visible:= False;
     end
  else
  if Tag = 1 then
     begin
       // is game custom options... this case will never be used by emulator default settings!!! (March 16, 2016)
       //iStr:= emuVersionStr;
       case IsAlterMAME of
         True : iStr:= FormMain.AlterMAMEVersion;
         False: iStr:= FormMain.EmulatorVersion[sysID];
       end;
       if iStr <> '' then
          LabelEmulatorVersion.Caption:= iStr
       else
          LabelEmulatorVersion.Caption:= '';

       //if FormMain.EmulatorVersion[sysID] <> '' then
       //   LabelEmulatorVersion.Caption:= FormMain.EmulatorVersion[sysID]
       //else
       //   LabelEmulatorVersion.Caption:= '';

       if LabelEmulatorVersion.Caption = '' then
          LabelEmulatorVersion.Caption:= 'name: '+FormMain.StatusBar_GamesGameName.Caption
       else
          LabelEmulatorVersion.Caption:= 'name: '+FormMain.StatusBar_GamesGameName.Caption+#13#10+
                                         LabelEmulatorVersion.Caption;

       LabelGameStatus.Caption:= LabelGameStatus.Hint+#13#10+FormMain.GetGameStatusText(FormMain.MemGameInfo.eGameSetStatus, FormMain.MemGameInfo.eROMIdentification);

       FormMain.LoadGameIconIntoImage(FormMain.MemGameInfo.eSystemID, FormMain.MemGameInfo.eCustomSystemID, FormMain.MemGameInfo.eROMIdentification, SystemIcon, FormMain.MemGameInfo.eSoftwareName, FormMain.MemGameInfo.eIsCustomGame);

       //FormMain.IL_StandardIconsExtraLarge.GetIcon(FormMain.GetMAMEImageIndex(FormMain.MemGameInfo.eROMIdentification, FormMain.MemGameInfo.eSoftwareName),
       //                                            SystemIcon.Picture.Icon);
       FormMain.IL_ArcadeSystem_Small.GetIcon(FormMain.MemGameInfo.eSystemID, GameIcon.Picture.Icon);

       case FormMain.MemGameInfo.eGameSetStatus of
         0: TopBar.Color1:= $00f0fae5; // green
         1: TopBar.Color1:= $00e5f0fa; // red (based on green)
         2: TopBar.Color1:= $00eeeeee; // silver (base on green)
       end;


       //if FormMain.MemGameInfo.eSoftwareName <> '' then
       //   begin
       //     LabelSoftwareListTitle.Visible:= True;
       //     LabelSoftwareListTitle.Caption:= FormMain.MemGameInfo.eCategory;
       //   end;

       // do not set dark mode yet! (May 17, 2018) 
       //SetColorsGameTopBar(FormMain.MemGameInfo.eGameSetStatus, TopBar); // change top bar color based on game set status

       // custom settings only. folders settings are only available when configuring MAME/HBMAME main settings (mame.ini; ume.ini; hbmame.ini)
       ButtonPageFolders.Visible:= False;
     end;

  LoadBiosList('');
  PopulateNumberProcessors;
  EnableDisableControls;
  PopulateDisplayLanguage;

  PopulateLUAPlugins_ListView;
  ReadPluginIni; // read from plugin.ini (if exists)

  PopulateBGFXShaderChains_ListView; // read all .json files from mamedir\bgfx\chains\ folder and add to the ListView...

  ButtonResetToDefault.Visible:= not ButtonPageFolders.Visible;
  if not ButtonResetToDefault.Visible then
     begin
       ButtonReadFileHelp.Visible:= False;
       //LabelReadFileIni.Left:= 109;
       //LabelReadFileIni.Width:= LabelReadFileIni.Width+130;
     end;
  ButtonReadFile.Click;
  if FormMain.CheckSelected(BiosSetsListView) then
     BiosSetsListView.Selection.First.ImageIndex:= 8;

  LabelBGFXScreenShaderChains.Hint:= BGFXScreenShaderChains.Text; // this will hold shader chain's current value
  if LabelBGFXScreenShaderChains.Hint = '' then
     LabelBGFXScreenShaderChains.Hint:= 'default';
  Screen.Cursor:= crDefault;
end;

procedure TFormMAMESettings.FolderNVRAMButtonSelectClick(Sender: TObject);
begin
  FormMain.DialogSelectFolder(FolderNVRAM, False);
end;

procedure TFormMAMESettings.SpeedChange(Sender: TObject);
begin
  LabelSpeed.Caption:= Format(LabelSpeed.Hint, [Speed.Position]);
end;

procedure TFormMAMESettings.ButtonScreenDefaultSettingsClick(
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
  LabelSnapSizeCustomX.Enabled:= not SnapSizeAuto.Checked;
  LabelSnapSizeCustom.Enabled:= not SnapSizeAuto.Checked;
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
  FormMain.ELV_MoveItem(FolderROMs, Boolean(TBitBtn(Sender).Tag));
end;

procedure TFormMAMESettings.UIModeKeyChange(Sender: TObject);
begin
  ButtonUIModeKeyDetectKey.Enabled:= UIModeKeyCustom.Enabled;
end;

procedure TFormMAMESettings.ButtonUIModeKeyDetectKeyClick(Sender: TObject);
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
  FormMain.ELV_MoveItem(FolderIniFiles, Boolean(TBitBtn(Sender).Tag));
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
  FormMain.ELV_MoveItem(FolderArtworks, Boolean(TBitBtn(Sender).Tag));
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

procedure TFormMAMESettings.ButtonSelectShadowMaskTextureClick(
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

procedure TFormMAMESettings.UIFontSelectFontButtonClick(Sender: TObject);
var
  FileStr, FolderList, GameStr: String;
begin
  FolderList:= FolderFontFiles.Text;
  if FolderList = '' then
     FolderList:= ExtractFilePath(emuFileExec); // ExtractFilePath(FormMain.EmulatorFile[sysID]);
  //if not DirectoryExists(FolderList) then
  //   Exit;
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

procedure TFormMAMESettings.ButtonPageFoldersClick(Sender: TObject);
begin
  NotebookPages.PageIndex:= TToolButton(Sender).Tag;
  if ToolBarPages.Tag <> NotebookPages.PageIndex then
     ToolBarPages.Buttons[ToolBarPages.Tag].ImageIndex:= 500;
  ToolBarPages.Tag:= TToolButton(Sender).Tag;
  TToolButton(Sender).ImageIndex:= 1;
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
       if LabelAutobootDelay.HelpKeyword <> 'sec' then
          LabelAutobootDelay.HelpKeyword:= 'sec'
     end
  else
  if LabelAutobootDelay.HelpKeyword <> 'min' then
     LabelAutobootDelay.HelpKeyword:= 'min';
  LabelAutobootDelay.Caption:= Format(LabelAutobootDelay.Hint, [GetPlayTime(AutobootDelay.Position*1000)+' '+LabelAutobootDelay.HelpKeyword]);
end;

procedure TFormMAMESettings.AutobootLuaScriptSelectButtonClick(Sender: TObject);
begin
  FormMain.DialogOpenFile(16, 'Select a LUA script file', AutobootLuaScript, False);
end;

procedure TFormMAMESettings.ButtonSnapViewDefaultClick(Sender: TObject);
begin
  SnapView.ItemIndex:= 0;
end;

procedure TFormMAMESettings.ButtonSelectHLSLPathClick(Sender: TObject);
begin
  FormMain.DialogSelectFolder(HLSLPath, False);
end;

procedure TFormMAMESettings.BenchmarkChange(Sender: TObject);
begin
  if Benchmark.Position < 60 then
     begin
       if LabelBenchmark.Hint <> 'sec' then
          LabelBenchmark.Hint:= 'sec';
     end
  else
     begin
       if LabelBenchmark.Hint <> 'min' then
          LabelBenchmark.Hint:= 'min';
     end;
  LabelBenchmark.Caption:= 'Benchmark ['+GetPlayTime(Benchmark.Position*1000)+' '+LabelBenchmark.Hint+']';
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

procedure TFormMAMESettings.RAMSizeButtonClearClick(Sender: TObject);
begin
  RAMSize.Clear;
end;

procedure TFormMAMESettings.ToggleSDLDeviceMappingCustom(SDLDeviceMapping: TComboBox; SDLCustomMapping: TEdit);
begin
  SDLCustomMapping.Enabled:= SDLDeviceMapping.ItemIndex = 1;
  //SDLJoystickMapping1Custom.Enabled:= SDLJoystickMapping1.ItemIndex = 1;
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

procedure TFormMAMESettings.SelectGLSLShaderMAME(EditHolder: TEdit; IsMAMEFile: Boolean = True);
var
  sFile, sFolder: String;
begin
  if EditHolder.Text <> '' then
     sFolder:= ExtractFilePath(EditHolder.Text);
  if (sFolder <> '') and (not DirectoryExists(sFolder)) then
     sFolder:= ExtractFilePath(emuFileExec); // sFolder:= FormMain.EmulatorFile[sysID];
  case IsMAMEFile of
    True : sFile:= FormMain.DialogOpenFile(12, 'Select a GLSL shader MAME file', EditHolder, False, True, sFolder);
    False: sFile:= FormMain.DialogOpenFile(12, 'Select a GLSL shader screen file', EditHolder, False, True, sFolder);
  end;
  if sFile <> '' then
     EditHolder.Text:= ChangeFileExt(sFile, ''); // shader file cannot have file extension
end;

procedure TFormMAMESettings.ButtonGLSL_Shader_MAME0Click(Sender: TObject);
begin
  SelectGLSLShaderMAME(GLSL_Shader_MAME0);
end;

procedure TFormMAMESettings.ButtonGLSL_Shader_MAME1Click(Sender: TObject);
begin
  SelectGLSLShaderMAME(GLSL_Shader_MAME1);
end;

procedure TFormMAMESettings.ButtonGLSL_Shader_MAME2Click(Sender: TObject);
begin
  SelectGLSLShaderMAME(GLSL_Shader_MAME2);
end;

procedure TFormMAMESettings.ButtonGLSL_Shader_MAME3Click(Sender: TObject);
begin
  SelectGLSLShaderMAME(GLSL_Shader_MAME3);
end;

procedure TFormMAMESettings.ButtonGLSL_Shader_MAME4Click(Sender: TObject);
begin
  SelectGLSLShaderMAME(GLSL_Shader_MAME4);
end;

procedure TFormMAMESettings.ButtonGLSL_Shader_MAME5Click(Sender: TObject);
begin
  SelectGLSLShaderMAME(GLSL_Shader_MAME5);
end;

procedure TFormMAMESettings.ButtonGLSL_Shader_MAME6Click(Sender: TObject);
begin
  SelectGLSLShaderMAME(GLSL_Shader_MAME6);
end;

procedure TFormMAMESettings.ButtonGLSL_Shader_MAME7Click(Sender: TObject);
begin
  SelectGLSLShaderMAME(GLSL_Shader_MAME7);
end;

procedure TFormMAMESettings.ButtonGLSL_Shader_MAME8Click(Sender: TObject);
begin
  SelectGLSLShaderMAME(GLSL_Shader_MAME8);
end;

procedure TFormMAMESettings.ButtonGLSL_Shader_MAME9Click(Sender: TObject);
begin
  SelectGLSLShaderMAME(GLSL_Shader_MAME9);
end;

procedure TFormMAMESettings.ButtonGLSL_Shader_Screen0Click(
  Sender: TObject);
begin
  SelectGLSLShaderMAME(GLSL_Shader_Screen0, False);
end;

procedure TFormMAMESettings.ButtonGLSL_Shader_Screen1Click(
  Sender: TObject);
begin
  SelectGLSLShaderMAME(GLSL_Shader_Screen1, False);
end;

procedure TFormMAMESettings.ButtonGLSL_Shader_Screen2Click(
  Sender: TObject);
begin
  SelectGLSLShaderMAME(GLSL_Shader_Screen2, False);
end;

procedure TFormMAMESettings.ButtonGLSL_Shader_Screen3Click(
  Sender: TObject);
begin
  SelectGLSLShaderMAME(GLSL_Shader_Screen3, False);
end;

procedure TFormMAMESettings.ButtonGLSL_Shader_Screen4Click(
  Sender: TObject);
begin
  SelectGLSLShaderMAME(GLSL_Shader_Screen4, False);
end;

procedure TFormMAMESettings.ButtonGLSL_Shader_Screen5Click(
  Sender: TObject);
begin
  SelectGLSLShaderMAME(GLSL_Shader_Screen5, False);
end;

procedure TFormMAMESettings.ButtonGLSL_Shader_Screen6Click(
  Sender: TObject);
begin
  SelectGLSLShaderMAME(GLSL_Shader_Screen6, False);
end;

procedure TFormMAMESettings.ButtonGLSL_Shader_Screen7Click(
  Sender: TObject);
begin
  SelectGLSLShaderMAME(GLSL_Shader_Screen7, False);
end;

procedure TFormMAMESettings.ButtonGLSL_Shader_Screen8Click(
  Sender: TObject);
begin
  SelectGLSLShaderMAME(GLSL_Shader_Screen8, False);
end;

procedure TFormMAMESettings.ButtonGLSL_Shader_Screen9Click(
  Sender: TObject);
begin
  SelectGLSLShaderMAME(GLSL_Shader_Screen9, False);
end;

procedure TFormMAMESettings.ButtonAudioLatencyResetClick(Sender: TObject);
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
  ButtonSDLAlternativeLibGLToUseCustom.Enabled:= SDLAlternativeLibGLToUseCustom.Enabled;
end;

procedure TFormMAMESettings.ButtonSDLAlternativeLibGLToUseCustomClick(
  Sender: TObject);
begin
  FormMain.DialogOpenFile(12, 'Select an alternative libGL.so file to use', SDLAlternativeLibGLToUseCustom, False);
end;

procedure TFormMAMESettings.ButtonSDLKeymapFilenameSelectClick(
  Sender: TObject);
begin
  FormMain.DialogOpenFile(19, 'Select a keymap file', SDLKeymapFilename, False);
end;

procedure TFormMAMESettings.ButtonSDLKeymapFilenameResetClick(
  Sender: TObject);
begin
  SDLKeymapFilename.Text:= 'keymap.dat';
end;

procedure TFormMAMESettings.ButtonSnapNameDefaultClick(Sender: TObject);
begin
  SnapName.Text:= '%g/%i';
end;

procedure TFormMAMESettings.ButtonSaveStateNameResetClick(Sender: TObject);
begin
  SaveStateName.Text:= '%g';
end;

procedure TFormMAMESettings.FormActivate(Sender: TObject);
begin
  if BiosSetsListView.Scrollbars.VertBarVisible then
     BiosSetsListView.Header.Columns[0].Width:= BiosSetsListView.Header.Columns[0].Width-GetSystemMetrics(SM_CXVSCROLL);

  if FolderROMs.Scrollbars.VertBarVisible then
     FolderROMs.Header.Columns[0].Width:= FolderROMs.Header.Columns[0].Width-GetSystemMetrics(SM_CXVSCROLL);

  SaveValidateAllCustomFiles.Visible:= not ButtonPageFolders.Visible;
  ButtonHelpSaveValidateAllCustomFiles.Visible:= SaveValidateAllCustomFiles.Visible;

  if not ButtonPageSDLMAMEInput.Visible then
     begin
       ToolBarPages.Width:= ToolBarPages.Width-ButtonPageSDLMAMEInput.Width;
       ToolBarPages.Left:= ToolBarPages.Left+ButtonPageSDLMAMEInput.Width;
     end;
  if not ButtonPageFolders.Visible then
     begin
       ToolBarPages.Width:= ToolBarPages.Width-ButtonPageFolders.Width;
       ToolBarPages.Left:= ToolBarPages.Left+ButtonPageFolders.Width;
       ButtonPageVideo1.Down:= True;
       ButtonPageVideo1.Click;
     end;
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
  CallMessageBox;
  FormMain.AddMsgText('    Button ');
  FormMain.AddMsgText('Reload Settings', MsgTxtColors.colorFileName, [fsBold]);
  FormMain.AddMsgText(' will load a list of custom files one by one, overwriting settings from the previous one.'+
                      ' MAME does this when loading games.'+#13#10);
  FormMain.AddMsgText('- mame.ini; ume.ini; hbmame.ini; emufilename.ini'+#13#10+
                      '- debug.ini'+#13#10+
                      '- vertical.ini (if screen game is vertical)'+#13#10+
                      '- horizont.ini (if screen game is horizontal)'+#13#10+
                      '- arcade.ini (MAME v0.163 and newer)'+#13#10+
                      '- console.ini (MAME v0.163 and newer)'+#13#10+
                      '- computer.ini (MAME v0.163 and newer)'+#13#10+
                      '- othersys.ini (MAME v0.163 and newer; this filename and its purpose is a mistery to me!)'+#13#10+
                      '- raster.ini (if screen game is raster)'+#13#10+
                      '- vector.ini (if screen game is vector)'+#13#10+
                      '- lcd.ini (if screen game is lcd)'+#13#10+
                      '- svg.ini (if screen game is svg)'+#13#10+
                      '- source\sourcefile.ini or sourcefile.ini'+#13#10+
                      '- biosname.ini'+#13#10+
                      '- parentgame.ini (if current game is clone)'+#13#10+
                      '- gamename.ini'+#13#10+#13#10);
  FormMain.AddMsgText('    Button ');
  FormMain.AddMsgText('Reset to Default', MsgTxtColors.colorFileName, [fsBold]);
  FormMain.AddMsgText(' will only load emulator default settings: mame.ini; ume.ini; hbmame.ini; ignoring everything else.');
  GenerateMessage('Help', 'Why two reload buttons ?');
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
  if SaveValidateAllCustomFiles.Checked then
     SaveValidateAllCustomFiles.Font.Color:= clBlue
  else
     SaveValidateAllCustomFiles.Font.Color:= clrDarkGray;
end;

procedure TFormMAMESettings.ButtonHelpSaveValidateAllCustomFilesClick(
  Sender: TObject);
begin
  CallMessageBox;
  FormMain.AddMsgText('    This feature is used only when saving custom settings.'+#13#10+#13#10);
  FormMain.AddMsgText('Disabled / Unchecked'+#13#10+#13#10, MsgTxtColors.colorFileName, [fsItalic], taCenter);
  FormMain.AddMsgText('    Custom settings are validated only against emulator default settings ');
  FormMain.AddMsgText('(mame.ini; hbmame.ini; ume.ini; emufilename.ini)', clBlack, [fsItalic]);
  FormMain.AddMsgText(', ignoring all custom files.'+#13#10+
                      'This is the old frontend''s saving method and I for one, prefer this way.'+#13#10+#13#10);
  FormMain.AddMsgText('Enabled / Checked'+#13#10+#13#10, MsgTxtColors.colorFileName, [fsItalic], taCenter);
  FormMain.AddMsgText('    It will keep custom settings files clean and avoid duplicated settings across files. '+
                      'All files will be scanned accordingly ');
  FormMain.AddMsgText('(debug.ini; vector.ini; drivername.ini; etc)', clBlack, [fsItalic]);
  FormMain.AddMsgText('.'+#13#10+'    There''s one major downside. Say you have settings in ');
  FormMain.AddMsgText('drivername.ini', clBlack, [fsItalic]);
  FormMain.AddMsgText(' and ');
  FormMain.AddMsgText('gamename.ini', clBlack, [fsItalic]);
  FormMain.AddMsgText('. Then you decide to delete ');
  FormMain.AddMsgText('drivername.ini', clBlack, [fsItalic]);
  FormMain.AddMsgText('. All its settings will be lost as they are not listed in later files, '+
                      'forcing you to set them again in ');
  FormMain.AddMsgText('gamename.ini', clBlack, [fsItalic]);
  FormMain.AddMsgText('.'+#13#10+#13#10+'In doubt, keep this feature ');
  FormMain.AddMsgText('disabled/unchecked.', clBlack, [fsItalic]);

  GenerateMessage('Help', 'Validate All Custom Files on Save');
end;

procedure TFormMAMESettings.ButtonResetHTTPServerClick(Sender: TObject);
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

procedure TFormMAMESettings.ButtonHLSLUpscaleSnapResetClick(
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
end;

procedure TFormMAMESettings.CommLocalPortButtonResetClick(Sender: TObject);
begin
  CommLocalPort.Text:= CommLocalPort.Hint;
end;

procedure TFormMAMESettings.CommRemoteHostButtonResetClick(
  Sender: TObject);
begin
  CommRemoteHost.Text:= CommRemoteHost.Hint;
end;

procedure TFormMAMESettings.CommRemotePortButtonResetClick(
  Sender: TObject);
begin
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
  LabelVectorBeamWidthMin.Caption:= Format(LabelVectorBeamWidthMin.Hint, [VectorBeamWidthMin.Position]);
end;

procedure TFormMAMESettings.VectorBeamWidthMaxChange(Sender: TObject);
begin
  LabelVectorBeamWidthMax.Caption:= Format(LabelVectorBeamWidthMax.Hint, [VectorBeamWidthMax.Position]);
end;

procedure TFormMAMESettings.VectorBeamIntensityWeightChange(
  Sender: TObject);
begin
  LabelVectorBeamIntensityWeight.Caption:= Format(LabelVectorBeamIntensityWeight.Hint, [VectorBeamIntensityWeight.Position]);
end;

procedure TFormMAMESettings.ButtonHelpVideoOutputModeClick(
  Sender: TObject);
begin
  CallMessageBox;
  FormMain.AddMsgText('OpenGL', MsgTxtColors.colorFileName, [fsBold]);
  FormMain.AddMsgText(' video mode is only supported in SDLMAME and starting from MAME v0.159.'+#13#10);
  FormMain.AddMsgText('DirectDraw', MsgTxtColors.colorFileName, [fsBold]);
  FormMain.AddMsgText(' video mode is only supported in MAME v0.170 and lower versions.'+#13#10+#13#10+
                      'In doubt, leave this setting in ');
  FormMain.AddMsgText('Auto', MsgTxtColors.colorFileName, [fsBold]);
  FormMain.AddMsgText('.');
  GenerateMessage('Info', 'Video output mode.');
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

procedure TFormMAMESettings.RAMSizeKeyPress(Sender: TObject;
  var Key: Char);
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
  BGFXScreenShaderChains.Text:= LabelBGFXScreenShaderChains.Hint; // this will hold shader chain's current value
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

procedure TFormMAMESettings.ButtonPageVideoEffectsBGFXClick(Sender: TObject);
begin
  NotebookVideoPostProcessingEffectsPages.PageIndex:= TToolButton(Sender).Tag;

  if ToolBarVideoPostProcessingEffectsPages.Tag <> NotebookVideoPostProcessingEffectsPages.PageIndex then
     ToolBarVideoPostProcessingEffectsPages.Buttons[ToolBarVideoPostProcessingEffectsPages.Tag].ImageIndex:= 500;
  ToolBarVideoPostProcessingEffectsPages.Tag:= TToolButton(Sender).Tag;
  TToolButton(Sender).ImageIndex:= 1;

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
  if Item.Captions[1] = 'default' then
     ACanvas.Font.Style:= [fsBold];
end;

procedure TFormMAMESettings.LabelBGFXScreenShaderChainsDetailsHTMLMouseEnter(Sender: TObject);
begin
  TLabel(Sender).Font.Color:= clBlue;
  TLabel(Sender).Font.Style:= [fsUnderline];
end;

procedure TFormMAMESettings.LabelBGFXScreenShaderChainsDetailsHTMLMouseLeave(Sender: TObject);
begin
  TLabel(Sender).Font.Color:= clNavy;
  TLabel(Sender).Font.Style:= [];
end;

procedure TFormMAMESettings.LabelBGFXScreenShaderChainsDetailsHTMLClick(Sender: TObject);
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
  LabelVectorBeamSmooth.Caption:= Format(LabelVectorBeamSmooth.Hint, [VectorBeamSmooth.Position]);
end;

procedure TFormMAMESettings.VectorMaximumAttenuationChange(
  Sender: TObject);
begin
  LabelVectorMaximumAttenuation.Caption:= Format(LabelVectorMaximumAttenuation.Hint, [VectorMaximumAttenuation.Position]);
end;

procedure TFormMAMESettings.VectorMinimumLengthAttenuationChange(
  Sender: TObject);
begin
  LabelVectorMinimumLengthAttenuation.Caption:= Format(LabelVectorMinimumLengthAttenuation.Hint, [VectorMinimumLengthAttenuation.Position]);
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
  LabelSaveStateRewindBufferSize.Caption:= Format(LabelSaveStateRewindBufferSize.Hint, [SaveStateRewindBufferSize.Position]);
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

end.
