unit uZiNcSettings_4K;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, GR32_RangeBars, ComCtrls,
  ExtCtrls, IniFiles, ToolWin, ImgList, MPCommonObjects,
  EasyListview, PanelEx, ShadowLabel, AdvGroupBox,
  AdvOfficeButtons, ButtonsEx, EditEx, ColorBoxEx;

type
  TFormZiNcSettings4K = class(TForm)
    TopBar: TPanelEx;
    GameIcon: TImage;
    LabelGameTitle: TShadowLabel;
    LabelEmulatorVersion: TShadowLabel;
    SystemIcon: TImage;
    ButtonReadFile: TBitBtnEx;
    LabelReadFileIni: TShadowLabel;
    ButtonOk: TBitBtnEx;
    ButtonCancel: TBitBtnEx;
    LabelGameStatus: TShadowLabel;
    FolderROMsGroupBox: TPanelEx;
    FolderROMsGroupBoxLabel: TShadowLabel;
    ControllerZNCGroupBox: TPanelEx;
    ControllerZNCGroupBoxLabel: TShadowLabel;
    FolderROMs: TEasyListview;
    ButtonUp: TBitBtnEx;
    ButtonDown: TBitBtnEx;
    FolderROMButtonSelect: TBitBtnEx;
    FolderROMsButtonEdit: TBitBtnEx;
    FolderROMsButtonDelete: TBitBtnEx;
    FolderROMsButtonClear: TBitBtnEx;
    AudioGroupBox: TPanelEx;
    AudioGroupBoxLabel: TShadowLabel;
    ControllerZNCButtonSelect: TBitBtnEx;
    ControllerZNC: TEditEx;
    ControllerConfigFileGroupBox: TPanelEx;
    ControllerConfigFileGroupBoxLabel: TShadowLabel;
    ControllerConfigFileButtonSelect: TBitBtnEx;
    ControllerConfigFile: TEditEx;
    RendererZNCGroupBox: TPanelEx;
    RendererZNCGroupBoxLabel: TShadowLabel;
    RendererZNCButtonSelect: TBitBtnEx;
    RendererZNC: TEditEx;
    RendererConfigFileGroupBox: TPanelEx;
    RendererConfigFileGroupBoxLabel: TShadowLabel;
    RendererConfigFileButtonSelect: TBitBtnEx;
    RendererConfigFile: TEditEx;
    OpenGLD3DRendererGroupBox: TPanelEx;
    OpenGLD3DRendererGroupBoxLabel: TShadowLabel;
    ResolutionLabel: TShadowLabel;
    ColorDepthLabel: TShadowLabel;
    ScanLinesLabel: TShadowLabel;
    BlendingLabel: TShadowLabel;
    FramerateManualLabel: TShadowLabel;
    TurnDisplayLabel: TShadowLabel;
    TextureSettingsLabel: TShadowLabel;
    TextureTypeLabel: TShadowLabel;
    TextureCacheLabel: TShadowLabel;
    TextureFilterLabel: TShadowLabel;
    Resolution: TComboBox2Ex;
    FullScreen: TAdvOfficeCheckBoxEx;
    ColorDepth: TComboBox2Ex;
    Scanlines: TComboBox2Ex;
    Blending: TComboBox2Ex;
    Dithering: TAdvOfficeCheckBoxEx;
    ShowFPS: TAdvOfficeCheckBoxEx;
    FrameLimitation: TAdvOfficeCheckBoxEx;
    FrameSkip: TAdvOfficeCheckBoxEx;
    FramerateDetection: TAdvOfficeCheckBoxEx;
    TurnDisplay: TComboBox2Ex;
    EnableKeys: TAdvOfficeCheckBoxEx;
    TextureType: TComboBox2Ex;
    TextureCache: TComboBox2Ex;
    TextureFilter: TComboBox2Ex;
    FramerateManual: TGaugeBar;
    VideoGroupBox: TPanelEx;
    VideoGroupBoxLabel: TShadowLabel;
    RotateLabel: TShadowLabel;
    NetGameConnectLabel: TShadowLabel;
    SlowGeometry: TAdvOfficeCheckBoxEx;
    MemoryPrediction: TAdvOfficeCheckBoxEx;
    StackInRAMHack: TAdvOfficeCheckBoxEx;
    Rotate: TComboBox2Ex;
    NetGameServer: TAdvOfficeCheckBoxEx;
    NetGameConnect: TEditEx;
    SoundFilterCutoffLabel: TShadowLabel;
    LabelSoundLiteSurroundMultiplier: TShadowLabel;
    SoundFilter: TAdvOfficeCheckBoxEx;
    SoundStereoExciter: TAdvOfficeCheckBoxEx;
    SoundLiteSurround: TAdvOfficeCheckBoxEx;
    SoundFilterCutoff: TComboBox2Ex;
    SoundLiteSurroundMultiplier: TGaugeBar;
    SoundEnableSound: TAdvOfficeCheckBoxEx;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormZiNcSettings4K: TFormZiNcSettings4K;

implementation

uses uMain, uCommon;

{$R *.dfm}


end.
