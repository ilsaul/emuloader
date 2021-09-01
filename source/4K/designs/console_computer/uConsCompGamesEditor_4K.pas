unit uConsCompGamesEditor_4K;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  uCommon, uCommonCustom, Dialogs, StdCtrls, PanelEx, ExtCtrls, ComCtrls, ToolWin,
  IniFiles, ImgList, SplitterEx, MPCommonObjects, MPCommonUtilities, EasyListview, ShadowLabel,
  Buttons, AdvOfficeButtons, Menus, BarMenus, EditEx, ButtonsEx,
  TntStdCtrls, TntEditEx;

type
  TFormConsCompGamesEditor4K = class(TForm)
    PanelSystems: TPanelEx;
    Systems: TEasyListview;
    Splitter: TSplitterEx;
    IL_Systems: TImageList;
    PanelCustomGamesSelectedSystem: TPanelEx;
    CustomGamesList: TEasyListview;
    PopupGamesList: TBcBarPopupMenu;
    PopupMachinesListSidePanelResetColumnsWidth: TMenuItem;
    PopupEditTitle: TMenuItem;
    PopupEditYear: TMenuItem;
    PopupEditManufacturer: TMenuItem;
    PopupEditNumberofPlayers: TMenuItem;
    PopupEditAll: TMenuItem;
    N1: TMenuItem;
    PopupResetSystemsPanelSize: TMenuItem;
    PanelToolBarGamesEditor: TPanelEx;
    PanelSearchGames: TPanelEx;
    LabelHotkeyText: TShadowLabel;
    LabelHotkeyKeys: TShadowLabel;
    ButtonApplyChanges: TBitBtnEx;
    ButtonAbortChanges: TBitBtnEx;
    SystemsHideScrollBarArea: TAdvOfficeCheckBoxEx;
    LabelToolBarFilterTitle: TShadowLabel;
    FilterGameTitle: TTntEditEx;
    PopupMenuOptions: TBcBarPopupMenu;
    PopupSystemsViewMode: TMenuItem;
    PopupSystemsViewMode_Tiles: TMenuItem;
    PopupSystemsViewMode_LargeIcons: TMenuItem;
    ButtonFilterTitleApply: TSpeedButtonEx;
    ButtonFilterTitleReset: TSpeedButtonEx;
    ShowBiggerGamesListFont: TAdvOfficeCheckBoxEx;
    StatusBarPanelMachines: TPanelEx;
    IconMachineDriverStatus: TImage;
    LabelCustomGamesListTotal: TShadowLabel;
    PanelEditSelected: TPanelEx;
    LabelEditSelected: TShadowLabel;
    LabelEditSelected_Total: TShadowLabel;
    LabelEditSelectedDrag: TShadowLabel;
    LabelEditSelected_Year: TAdvOfficeCheckBoxEx;
    EditSelected_Year: TEditEx;
    LabelEditSelected_Manufacturer: TAdvOfficeCheckBoxEx;
    EditSelected_Manufacturer: TEditEx;
    LabelEditSelected_NumberPlayers: TAdvOfficeCheckBoxEx;
    EditSelected_NumberPlayers: TEditEx;
    ButtonMultiSelectedInfo_Confirm: TBitBtnEx;
    MultiSelectedInfo_Cancel: TBitBtnEx;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormConsCompGamesEditor4K: TFormConsCompGamesEditor4K;

implementation

uses uMain, uStatus;

{$R *.dfm}


end.
