unit uFavoritesManager_4K;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ToolWin, IniFiles, PanelEx, MPCommonObjects,
  MPCommonUtilities, MPThreadManager, EasyListview, StdCtrls, Buttons,
  ShadowLabel, ExtCtrls, ImgList, AdvOfficeButtons, ButtonsEx, Themes,
  Menus, BarMenus;
type
  TFormFavoritesManager4K = class(TForm)
    FavoritesList: TEasyListview;
    IL_SystemType: TImageList;
    NewFavoritePanel: TPanelEx;
    LabelHotkeyText: TShadowLabel;
    LabelHotkeyKeys: TShadowLabel;
    ButtonSetSelectedProfileActive: TSpeedButtonEx;
    ButtonSettings: TSpeedButtonEx;
    ButtonNew: TSpeedButtonEx;
    ButtonClearGames: TSpeedButtonEx;
    ButtonRemoveInvalidEntries: TSpeedButtonEx;
    ButtonReplicate: TSpeedButtonEx;
    ButtonDelete: TSpeedButtonEx;
    PopupSettings: TBcBarPopupMenu;
    PopupSettingsSmallFont: TMenuItem;
    PopupSettingsMediumFont: TMenuItem;
    PopupSettingsLargeFont: TMenuItem;
    N7: TMenuItem;
    PopupSettingsCenterWindow: TMenuItem;
    procedure FavoritesListKeyAction(Sender: TCustomEasyListview;
      var CharCode: Word; var Shift: TShiftState; var DoDefault: Boolean);
    procedure FavoritesListColumnClick(Sender: TCustomEasyListview;
      Button: TCommonMouseButton; ShiftState: TShiftState;
      const Column: TEasyColumn);
    function FavoritesListItemCompare(Sender: TCustomEasyListview;
      Column: TEasyColumn; Group: TEasyGroup; Item1, Item2: TEasyItem;
      var DoDefault: Boolean): Integer;
    procedure FormShow(Sender: TObject);
    procedure FavoritesListItemEdited(Sender: TCustomEasyListview;
      Item: TEasyItem; var NewValue: Variant; var Accept: Boolean);
    procedure FavoritesListItemEditEnd(Sender: TCustomEasyListview;
      Item: TEasyItem);
    procedure FavoritesListDblClick(Sender: TCustomEasyListview;
      Button: TCommonMouseButton; MousePos: TPoint;
      ShiftState: TShiftState; var Handled: Boolean);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FavoritesListColumnSizeChanging(Sender: TCustomEasyListview;
      Column: TEasyColumn; Width, NewWidth: Integer; var Allow: Boolean);
    procedure ButtonSettingsClick(Sender: TObject);
    procedure ButtonNewClick(Sender: TObject);
    procedure ButtonSetSelectedProfileActiveClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure PopupSettingsMeasureMenuItem(Sender: TObject;
      AMenuItem: TMenuItem; ACanvas: TCanvas; var Width, Height: Integer;
      ABarVisible: Boolean; var DefaultMeasure: Boolean);
    procedure PopupSettingsSmallFontClick(Sender: TObject);
    procedure PopupSettingsCenterWindowClick(Sender: TObject);
    procedure FavoritesListItemPaintText(Sender: TCustomEasyListview;
      Item: TEasyItem; Position: Integer; ACanvas: TCanvas);
  private
    { Private declarations }
    UpdateFavStatusInGames: Boolean;
    LastActiveFavFilter: String;
    ActiveProfileItem: TEasyItem;
    FullFavFilesList: THashedStringList;
    procedure UpdateDateTime(destItem: TEasyItem; const fFile: String);
    function  ELV_AddItem(const fFile: String): TEasyItem;
    procedure GetFavFilesList;
    procedure LoadFavoritesProfiles;
    procedure SelectCurrentProfile;
    function  CheckIfAvailable(iStr: String; IsTitle: Boolean): Boolean;
    procedure UpdateTitleInfo(newStr, favFileName: String; ShowErrorMessage: Boolean = False);
    procedure UpdateFileNameInfo(OldFile, NewFile: String; ShowErrorMessage: Boolean = False);
    function  CreateNewValidFileName(DuplicateFile: String): String;
    procedure ExecuteFavAction(ActionIndex: Integer);
    procedure EditTitleFileName(ColumnIndex: Integer);
    procedure RemoveInvalidEntries;
    function  ValidateGamesActiveProfile: Boolean;
    procedure ReadSettings;
    procedure WriteSettings;
  public
    { Public declarations }
  end;

var
  FormFavoritesManager4K: TFormFavoritesManager4K;

implementation

{$R *.dfm}

uses uMain, uCommon, uCommonCustom, uFavoritesManagerCleanseProfile;


end.
