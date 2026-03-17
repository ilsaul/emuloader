unit uArcadeFiltersGamesExtra_4K;

interface

uses
  Windows, SysUtils, Classes, Graphics, Controls, Forms,
  StdCtrls, ExtCtrls, uCommon, Buttons,
  AdvOfficeButtons, PanelEx, AdvGroupBox, ShadowLabel, ButtonsEx,
  ColorBoxEx, UxTheme;

type
  TFormArcadeFiltersExtra4K = class(TForm)
    FilterGamesMainCPU: TAdvOfficeCheckBoxEx;
    PanelBottom: TPanelEx;
    ButtonOk: TBitBtnEx;
    ButtonCancel: TBitBtnEx;
    LabelControlType: TShadowLabel;
    LabelInterfaceType: TShadowLabel;
    InterfaceType: TComboBox2Ex;
    LabelAudioType: TShadowLabel;
    AudioType: TComboBox2Ex;
    LabelGamesROMs: TShadowLabel;
    GamesROMs: TComboBox2Ex;
    LabelDeviceROMs: TShadowLabel;
    HideDeviceSets: TAdvOfficeCheckBoxEx;
    DeviceROMs: TComboBox2Ex;
    LabelBios: TShadowLabel;
    Bios: TComboBox2Ex;
    HideBiosSets: TAdvOfficeCheckBoxEx;
    HideGamesWithCHDFiles: TAdvOfficeCheckBoxEx;
    ButtonDefaultOptions: TBitBtnEx;
    LabelSTVMultiSlot: TShadowLabel;
    NeoGeoMVS: TAdvOfficeCheckBoxEx;
    STVMultiSlot: TAdvOfficeCheckBoxEx;
    LabelNeoGeoMVS: TShadowLabel;
    ControlType_New: TComboBox2Ex;
    ScreenOrientation: TComboBox2Ex;
    LabelScreenOrientation: TShadowLabel;
    ShowMergedSetsOnly: TAdvOfficeCheckBoxEx;
    HideNoDumpROMsGames: TAdvOfficeCheckBoxEx;
    SaveState: TComboBox2Ex;
    LabelSaveState: TShadowLabel;
    CategoryFiltersGroupBox: TAdvGroupBoxEx;
    LabelCategoryFiltersGroupBoxHint: TShadowLabel;
    ButtonCategoriesToHideInfo: TBitBtnEx;
    CategoryCasino: TAdvOfficeCheckBoxEx;
    CategoryFruitMachines: TAdvOfficeCheckBoxEx;
    CategoryRhythm: TAdvOfficeCheckBoxEx;
    CategoryMature: TAdvOfficeCheckBoxEx;
    CategoryMahjong: TAdvOfficeCheckBoxEx;
    CategoryTabletop: TAdvOfficeCheckBoxEx;
    CategoryPinMAME: TAdvOfficeCheckBoxEx;
    CategoryQuiz: TAdvOfficeCheckBoxEx;
    CategoryUtilities: TAdvOfficeCheckBoxEx;
    CategoryCalculator: TAdvOfficeCheckBoxEx;
    CategoryEducational: TAdvOfficeCheckBoxEx;
    CategoryElectronic: TAdvOfficeCheckBoxEx;
    CategoryPrinters: TAdvOfficeCheckBoxEx;
    CategoryPhones: TAdvOfficeCheckBoxEx;
    CategoryMAMEConsoleMachines: TAdvOfficeCheckBoxEx;
    CategoryMAMEComputerMachines: TAdvOfficeCheckBoxEx;
    CategoryMAMEHandheldMachines: TAdvOfficeCheckBoxEx;
    ShowOnlySetsCRC32Collision: TAdvOfficeCheckBoxEx;
    CategoryMusic: TAdvOfficeCheckBoxEx;
    CategoryBoardGame: TAdvOfficeCheckBoxEx;
    CategorySlotMachines: TAdvOfficeCheckBoxEx;
    HideMAMESoftlist_vgmplay: TAdvOfficeCheckBoxEx;
    SpecialList: TComboBox2Ex;
    LabelSpecialList: TShadowLabel;
    LabelHideMAMESoftlist_vgmplay: TShadowLabel;
    ComboBox2Ex1: TComboBox2Ex;
    ShadowLabel1: TShadowLabel;
    ShadowLabel2: TShadowLabel;
    ComboBox2Ex2: TComboBox2Ex;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormArcadeFiltersExtra4K: TFormArcadeFiltersExtra4K;

implementation

uses uMain, uStatus;

{$R *.dfm}


end.
