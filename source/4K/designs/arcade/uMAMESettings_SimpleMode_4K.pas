unit uMAMESettings_SimpleMode_4K;

interface

uses
  Windows, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ImgList, ComCtrls, Buttons, IniFiles,
  ExtCtrls, GR32_RangeBars, uGR32Extra, MPCommonObjects, EasyListview,
  Registry, uCommon, PanelEx, AdvOfficeButtons, AdvGroupBox,
  ShadowLabel, ExTrackBar, ToolWin, ColorBoxEx, EditEx, ButtonsEx;

type
  TFormMAMESettings_SimpleMode4K = class(TForm)
    Panel1_Folders: TPanelEx;
    ButtonPageVideo1: TSpeedButtonEx;
    ButtonPageFolders: TSpeedButtonEx;
    PanelBottom: TPanelEx;
    Panel2_VideoAudioInput: TPanelEx;
    Mouse: TAdvOfficeCheckBoxEx;
    Joystick: TAdvOfficeCheckBoxEx;
    SkipGameInfo: TAdvOfficeCheckBoxEx;
    Cheat: TAdvOfficeCheckBoxEx;
    ReadConfigFiles: TAdvOfficeCheckBoxEx;
    AudioGroupBox: TPanelEx;
    AudioGroupBoxLabel: TShadowLabel;
    SampleRateLabel: TShadowLabel;
    VolumeLabel: TShadowLabel;
    Samples: TAdvOfficeCheckBoxEx;
    SampleRate: TComboBox2Ex;
    Volume: TGaugeBar;
    EnableSound: TAdvOfficeCheckBoxEx;
    PerformanceGroupBox: TPanelEx;
    PerformanceGroupBoxLabel: TShadowLabel;
    FullScreenGroupBox: TPanelEx;
    FullScreenGroupBoxLabel: TShadowLabel;
    AutoFrameskip: TAdvOfficeCheckBoxEx;
    SyncronizeRefreshRate: TAdvOfficeCheckBoxEx;
    Throttle: TAdvOfficeCheckBoxEx;
    Frameskip: TGaugeBar;
    FrameskipLabel: TShadowLabel;
    TripleBuffer: TAdvOfficeCheckBoxEx;
    SwitchResolution: TAdvOfficeCheckBoxEx;
    SampleBox: TPanelEx;
    SampleBoxLabel: TShadowLabel;
    FolderROMs: TEasyListview;
    FolderROMsButtonUp: TBitBtnEx;
    FolderROMsButtonDown: TBitBtnEx;
    FolderROMsButtonSelect: TBitBtnEx;
    FolderROMsButtonEdit: TBitBtnEx;
    FolderROMsButtonDelete: TBitBtnEx;
    FolderROMsButtonClear: TBitBtnEx;
    PanelEx19: TPanelEx;
    ShadowLabel20: TShadowLabel;
    EasyListview1: TEasyListview;
    FolderIniFilesButtonUp: TBitBtnEx;
    FolderIniFilesButtonDown: TBitBtnEx;
    FolderIniFilesButtonSelect: TBitBtnEx;
    FolderIniFilesButtonEdit: TBitBtnEx;
    FolderIniFilesButtonDelete: TBitBtnEx;
    FolderIniFilesButtonClear: TBitBtnEx;
    PanelEx21: TPanelEx;
    ShadowLabel22: TShadowLabel;
    EasyListview2: TEasyListview;
    BitBtnEx17: TBitBtnEx;
    BitBtnEx18: TBitBtnEx;
    BitBtnEx19: TBitBtnEx;
    BitBtnEx20: TBitBtnEx;
    BitBtnEx21: TBitBtnEx;
    BitBtnEx22: TBitBtnEx;
    PanelEx14: TPanelEx;
    ShadowLabel15: TShadowLabel;
    EditEx13: TEditEx;
    BitBtnEx13: TBitBtnEx;
    PanelEx15: TPanelEx;
    ShadowLabel16: TShadowLabel;
    EditEx14: TEditEx;
    BitBtnEx14: TBitBtnEx;
    PanelEx16: TPanelEx;
    ShadowLabel17: TShadowLabel;
    EditEx15: TEditEx;
    BitBtnEx15: TBitBtnEx;
    PanelEx17: TPanelEx;
    ShadowLabel18: TShadowLabel;
    EditEx16: TEditEx;
    BitBtnEx16: TBitBtnEx;
    TopBar: TPanelEx;
    LabelGameTitle: TShadowLabel;
    LabelEmulatorVersion: TShadowLabel;
    SystemIcon: TImage;
    GameIcon: TImage;
    LabelGameStatus: TShadowLabel;
    ButtonReadFile: TBitBtnEx;
    ButtonOk: TBitBtnEx;
    ButtonCancel: TBitBtnEx;
    ButtonResetToDefault: TBitBtnEx;
    ButtonReadFileHelp: TBitBtnEx;
    ButtonHelpSaveValidateAllCustomFiles: TBitBtnEx;
    SaveValidateAllCustomFiles: TAdvOfficeCheckBoxEx;
    PanelEx23: TPanelEx;
    ShadowLabel24: TShadowLabel;
    ShadowLabel1: TShadowLabel;
    VectorBeamWidthMaxLabel: TShadowLabel;
    GaugeBar21: TGaugeBar2;
    VectorBeamWidthMax: TGaugeBar2;
    AdvOfficeCheckBoxEx1: TAdvOfficeCheckBoxEx;
    PanelEx25: TPanelEx;
    ShadowLabel26: TShadowLabel;
    AdvOfficeCheckBoxEx2: TAdvOfficeCheckBoxEx;
    AdvOfficeCheckBoxEx3: TAdvOfficeCheckBoxEx;
    AdvOfficeCheckBoxEx4: TAdvOfficeCheckBoxEx;
    AdvOfficeCheckBoxEx5: TAdvOfficeCheckBoxEx;
    PanelEx22: TPanelEx;
    ShadowLabel23: TShadowLabel;
    AdvOfficeCheckBoxEx6: TAdvOfficeCheckBoxEx;
    AdvOfficeCheckBoxEx7: TAdvOfficeCheckBoxEx;
    AdvOfficeCheckBoxEx8: TAdvOfficeCheckBoxEx;
    AdvOfficeCheckBoxEx9: TAdvOfficeCheckBoxEx;
    BilinearFilter: TAdvOfficeCheckBoxEx;
    ShadowLabel2: TShadowLabel;
    ComboBox2Ex1: TComboBox2Ex;
    ComboBox2Ex2: TComboBox2Ex;
    ScreenRefreshRate_CustomLabel: TShadowLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormMAMESettings_SimpleMode4K: TFormMAMESettings_SimpleMode4K;

implementation

uses uMain;

{$R *.dfm}


end.
