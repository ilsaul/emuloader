unit uSEGAModel2EmulatorSettings_4K;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ComCtrls, IniFiles,
  ImgList, MPCommonObjects, EasyListview, ShadowLabel, PanelEx,
  Buttons, AdvGroupBox, AdvOfficeButtons, ColorBoxEx, ButtonsEx;

type
  TFormSEGAModel2EmulatorSettings4K = class(TForm)
    TopBar: TPanelEx;
    LabelGameTitle: TShadowLabel;
    LabelEmulatorVersion: TShadowLabel;
    SystemIcon: TImage;
    GameIcon: TImage;
    LabelGameStatus: TShadowLabel;
    ButtonReadFile: TBitBtnEx;
    LabelReadFileIni: TShadowLabel;
    ButtonOk: TBitBtnEx;
    ButtonCancel: TBitBtnEx;
    FolderROMsGroupBox: TPanelEx;
    FolderROMsGroupBoxLabel: TShadowLabel;
    FolderROMs: TEasyListview;
    FolderROMsButtonUp: TBitBtnEx;
    FolderROMsButtonDown: TBitBtnEx;
    FolderROMsButtonSelect: TBitBtnEx;
    FolderROMsButtonEdit: TBitBtnEx;
    FolderROMsButtonDelete: TBitBtnEx;
    FolderROMsButtonClear: TBitBtnEx;
    VideoGroupBox: TPanelEx;
    VideoGroupBoxLabel: TShadowLabel;
    FullScreenResolutionLabel: TShadowLabel;
    WidescreenWindowLabel: TShadowLabel;
    FrameskipLabel: TShadowLabel;
    ForceManagedTexturesLabel: TShadowLabel;
    FullScreenResolution: TComboBox2Ex;
    AutoSwitchFullScreen: TAdvOfficeCheckBoxEx;
    ForceSync: TAdvOfficeCheckBoxEx;
    WidescreenWindow: TComboBox2Ex;
    Frameskip: TComboBox2Ex;
    ForceManagedTextures: TComboBox2Ex;
    SoftwareVertexProcessing: TAdvOfficeCheckBoxEx;
    Wireframe: TAdvOfficeCheckBoxEx;
    FakeGouraud: TAdvOfficeCheckBoxEx;
    BilinearFiltering: TAdvOfficeCheckBoxEx;
    FilterTilemaps: TAdvOfficeCheckBoxEx;
    TrilinearFiltering: TAdvOfficeCheckBoxEx;
    AutoMipMap: TAdvOfficeCheckBoxEx;
    MeshTransparency: TAdvOfficeCheckBoxEx;
    Crosshair: TAdvOfficeCheckBoxEx;
    FSAA: TAdvOfficeCheckBoxEx;
    InputGroupBox: TPanelEx;
    InputGroupBoxLabel: TShadowLabel;
    ReturnToNeutral: TAdvOfficeCheckBoxEx;
    UseRawInput: TAdvGroupBoxEx;
    RawDevicePlayer1Label: TShadowLabel;
    RawDevicePlayer2Label: TShadowLabel;
    RawDevicePlayer1: TComboBox2Ex;
    RawDevicePlayer2: TComboBox2Ex;
    ForceFeedbackEnable: TAdvOfficeCheckBoxEx;
    XInput: TAdvOfficeCheckBoxEx;
    SampleBox: TPanelEx;
    SampleBoxLabel: TShadowLabel;
    EnableSound: TAdvOfficeCheckBoxEx;
  private
    { Private declarations }
    //procedure PopulateScreenResolution;
  public
    { Public declarations }
  end;

var
  FormSEGAModel2EmulatorSettings4K: TFormSEGAModel2EmulatorSettings4K;

implementation

uses uMain, uCommon;

{$R *.dfm}

end.

