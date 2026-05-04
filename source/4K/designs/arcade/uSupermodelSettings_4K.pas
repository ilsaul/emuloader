unit uSupermodelSettings_4K;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  StdCtrls, MPCommonObjects, EasyListview, ComCtrls, IniFiles,
  ImgList, GR32_RangeBars, ExtCtrls, Buttons, PanelEx,
  ShadowLabel, AdvGroupBox, AdvOfficeButtons, ButtonsEx, EditEx, ColorBoxEx;

type
  TFormSupermodelSettings4K = class(TForm)
    TopBar: TPanelEx;
    Multithreading: TAdvOfficeCheckBoxEx;
    ButtonReadFile: TBitBtnEx;
    LabelReadFileIni: TShadowLabel;
    ButtonOk: TBitBtnEx;
    ButtonCancel: TBitBtnEx;
    SystemIcon: TImage;
    GameIcon: TImage;
    LabelGameTitle: TShadowLabel;
    LabelEmulatorVersion: TShadowLabel;
    LabelGameStatus: TShadowLabel;
    FolderROMsGroupBox: TPanelEx;
    FolderROMsGroupBoxLabel: TShadowLabel;
    VideoGroupBox: TPanelEx;
    VideoGroupBoxLabel: TShadowLabel;
    FolderROMs: TEasyListview;
    FolderROMsButtonUp: TBitBtnEx;
    FolderROMsButtonDown: TBitBtnEx;
    FolderROMsButtonSelect: TBitBtnEx;
    FolderROMsButtonEdit: TBitBtnEx;
    FolderROMsButtonDelete: TBitBtnEx;
    FolderROMsButtonClear: TBitBtnEx;
    AudioGroupBox: TPanelEx;
    AudioGroupBoxLabel: TShadowLabel;
    ResolutionLabel: TShadowLabel;
    Real3DVertexShaderLabel: TShadowLabel;
    Real3DFragmentShaderLabel: TShadowLabel;
    Video3DEngineLabel: TShadowLabel;
    LoadTileMapVertexShader2DLabel: TShadowLabel;
    LoadTileMapFragmentShader2DLabel: TShadowLabel;
    LoadReal3DScrollFogVertexShaderLabel: TShadowLabel;
    LoadReal3DScrollFogFragmentShaderLabel: TShadowLabel;
    ScreenResolution: TComboBox2Ex;
    DisableThrottle: TAdvOfficeCheckBoxEx;
    ShowFPS: TAdvOfficeCheckBoxEx;
    Real3DVertexShader: TEditEx;
    Real3DFragmentShader: TEditEx;
    Real3DVertexShaderButtonSelect: TBitBtnEx;
    Real3DFragmentShaderButtonSelect: TBitBtnEx;
    Widescreen: TAdvOfficeCheckBoxEx;
    FullScreen: TAdvOfficeCheckBoxEx;
    GPUMultithreading: TAdvOfficeCheckBoxEx;
    Video3DEngine: TComboBox2Ex;
    DisableVSync: TAdvOfficeCheckBoxEx;
    Stretch: TAdvOfficeCheckBoxEx;
    LoadTileMapVertexShader2D: TEditEx;
    LoadTileMapVertexShader2DButtonSelect: TBitBtnEx;
    LoadTileMapFragmentShader2D: TEditEx;
    LoadTileMapFragmentShader2DButtonSelect: TBitBtnEx;
    MultiTexture: TAdvOfficeCheckBoxEx;
    LoadReal3DScrollFogVertexShader: TEditEx;
    LoadReal3DScrollFogVertexShaderButtonSelect: TBitBtnEx;
    LoadReal3DScrollFogFragmentShaderButtonSelect: TBitBtnEx;
    LoadReal3DScrollFogFragmentShader: TEditEx;
    Video3DEngineButtonReset: TBitBtnEx;
    QuadRendering: TAdvOfficeCheckBoxEx;
    InputGroupBox: TPanelEx;
    InputGroupBoxLabel: TShadowLabel;
    PowerPCFrequencyGroupBox: TPanelEx;
    PowerPCFrequencyGroupBoxLabel: TShadowLabel;
    PowerPCFrequency: TGaugeBar;
    PowerPCFrequencyLabel: TShadowLabel;
    PowerPCFrequencyUseCustom: TAdvOfficeCheckBoxEx;
    PowerPCFrequencyCustomLabel: TShadowLabel;
    PowerPCFrequencyCustom: TGaugeBar;
    CrosshairsLabel: TShadowLabel;
    InputSystem: TComboBox2Ex;
    InputSystemConfigButton: TBitBtnEx;
    EnableForceFeedback: TAdvOfficeCheckBoxEx;
    Crosshairs: TComboBox2Ex;
    SoundVolumeLabel: TShadowLabel;
    MusicVolumeLabel: TShadowLabel;
    AudioBalanceFrontRearLabel: TShadowLabel;
    SoundVolume: TGaugeBar;
    DisableSound: TAdvOfficeCheckBoxEx;
    DisableMusic: TAdvOfficeCheckBoxEx;
    MusicVolume: TGaugeBar;
    FlipStereo: TAdvOfficeCheckBoxEx;
    AudioBalanceFrontRear: TGaugeBar;
    SoundVolumeButtonLast: TBitBtnEx;
    MusicVolumeButtonLast: TBitBtnEx;
    SoundVolumeButtonReset: TBitBtnEx;
    MusicVolumeButtonReset: TBitBtnEx;
    AudioBalanceFrontRearButtonLast: TBitBtnEx;
    AudioBalanceFrontRearButtonReset: TBitBtnEx;
    NetworkBoardGroupBox: TPanelEx;
    NetworkBoardGroupBoxLabel: TShadowLabel;
    NetworkAddressOutLabel: TShadowLabel;
    NetworkPortInLabel: TShadowLabel;
    NetworkPortOutLabel: TShadowLabel;
    NetworkEnable: TAdvOfficeCheckBoxEx;
    NetworkSimulateNetBoard: TAdvOfficeCheckBoxEx;
    NetworkEmulateNetBoard: TAdvOfficeCheckBoxEx;
    NetworkAddressOut: TEditEx;
    NetworkPortIn: TEditEx;
    NetworkButtonReset: TBitBtnEx;
    NetworkPortOut: TEditEx;
    NetworkButtonHelp: TBitBtnEx;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormSupermodelSettings4K: TFormSupermodelSettings4K;

implementation

uses uMain, uCommon;

{$R *.dfm}


end.
