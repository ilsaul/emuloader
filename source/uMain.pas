unit uMain;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus, ComCtrls, ToolWin, ExtCtrls, IniFiles, StdCtrls, Buttons, ImgList,
  FileCtrl, GR32_Image, GR32_Filters, GR32, GR32_RangeBars, GraphicEx,
  ShellAPI, CommCtrl, ThemeMgr, ThemeSrv, ZipForge, JPEG;

type
  TExetype = (etUnknown, etDOS, etWinNE, etWinPE);

type
  TExeStrings = array[TExeType] of String[5];
const
  ExeStrings: TExeStrings =
    ('NoFmt', 'DOS', 'Win16', 'Win32');

type
  TGameInfo = record
    eImageIndex: Integer;
    eROMIdentification: ShortInt;
    eDescription: String;
    eYear: String[4];
    eManufacturer: String;
    eSound: String[10];
    eFrequency: String[8];
    eSamples: String[3];
    eControlType: String;
    eVideo: String[8];
    eOrientation: String[10];
    eResolution: String[8];
    eDriverStatus: String[12];
    eSoundStatus: String[12];
    eColorStatus: String[12];
    eMerged: String[3];
    eName: String[8];
    eClone: String[18];
    eCategory: String;
    eVersionAdded: String[20];
    eDriver: String[14];
    eGameSize: String[12];
  end;

type
  TQuickSortCompare = function (var GameItem1, GameItem2: TGameInfo; var ColumnID: Integer): Integer;

type
  TFormMain = class(TForm)
    MainMenu: TMainMenu;
    MenuFile: TMenuItem;
    MenuCreateGamesList: TMenuItem;
    MenuPreferences: TMenuItem;
    MenuExit: TMenuItem;
    MenuEmulatorSetup: TMenuItem;
    N3: TMenuItem;
    MenuHelp: TMenuItem;
    MenuAbout: TMenuItem;
    MenuViewTextFiles: TMenuItem;
    PopupMenuPictures: TPopupMenu;
    PopupShowInGameSnapshot: TMenuItem;
    PopupShowMarquee: TMenuItem;
    PopupShowFlyer: TMenuItem;
    PopupShowCabinet: TMenuItem;
    N5: TMenuItem;
    PopupDeleteCurrentPicture: TMenuItem;
    PopupRenameCurrentPicture: TMenuItem;
    PopupDeleteAllExtraPictures: TMenuItem;
    PopupMenuGamesList: TPopupMenu;
    PopupPlayGameStandard: TMenuItem;
    N8: TMenuItem;
    PopupPlayGame: TMenuItem;
    PopupSetCustomOptions: TMenuItem;
    PopupDeleteCustomOptions: TMenuItem;
    N9: TMenuItem;
    PopupAuditSelectedGame: TMenuItem;
    PopupAuditAllGames: TMenuItem;
    N10: TMenuItem;
    PopupPlayRecordedGame: TMenuItem;
    PopupRecordGame: TMenuItem;
    N11: TMenuItem;
    PopupGameHistory: TMenuItem;
    PopupGameInformation: TMenuItem;
    PopupAddToFavorites: TMenuItem;
    PopupDeleteFromFavorites: TMenuItem;
    N13: TMenuItem;
    PopupShowHideFavoriteUsersManager: TMenuItem;
    N14: TMenuItem;
    PopupRefreshAllGames: TMenuItem;
    PopupRefreshSelectedGame: TMenuItem;
    PopupCreateIconsList: TMenuItem;
    N15: TMenuItem;
    MenuShowGamesIconsLegend: TMenuItem;
    N16: TMenuItem;
    N17: TMenuItem;
    PopupShowControlPanel: TMenuItem;
    MenuGames: TMenuItem;
    MenuCustomGamesManager: TMenuItem;
    MenuAuditAllGames: TMenuItem;
    N18: TMenuItem;
    MenuAuditSelectedGame: TMenuItem;
    MenuPlayGameStandard: TMenuItem;
    N19: TMenuItem;
    MenuPlayGame: TMenuItem;
    MenuSetCustomOptions: TMenuItem;
    N20: TMenuItem;
    MenuDeleteCustomOptions: TMenuItem;
    N21: TMenuItem;
    MenuPlayRecordedGame: TMenuItem;
    MenuRecordGame: TMenuItem;
    N22: TMenuItem;
    MenuGameHistory: TMenuItem;
    MenuGameInformation: TMenuItem;
    MenuAddToFavorites: TMenuItem;
    MenuDeleteFromFavorites: TMenuItem;
    N24: TMenuItem;
    MenuShowHideFavoriteUsersManager: TMenuItem;
    MenuCreateIconsList: TMenuItem;
    N26: TMenuItem;
    MenuRefreshSelectedGame: TMenuItem;
    MenuRefreshAllGames: TMenuItem;
    MenuView: TMenuItem;
    MenuModeViewBigIcons: TMenuItem;
    MenuModeViewSmallIcons: TMenuItem;
    MenuModeViewList: TMenuItem;
    MenuModeViewDetails: TMenuItem;
    N27: TMenuItem;
    MenuShowFavorite: TMenuItem;
    MenuShowInGameSnapshot: TMenuItem;
    MenuShowMarquee: TMenuItem;
    MenuShowFlyer: TMenuItem;
    MenuShowCabinet: TMenuItem;
    MenuShowControlPanel: TMenuItem;
    MenuUseExecutable1: TMenuItem;
    MenuUseExecutable2: TMenuItem;
    MenuPictures: TMenuItem;
    MenuDeleteCurrentPicture: TMenuItem;
    MenuRenameCurrentPicture: TMenuItem;
    MenuDeleteAllExtraPictures: TMenuItem;
    GamesListSaveDialog: TSaveDialog;
    N34: TMenuItem;
    MenuVisitEmuLoaderHomepage: TMenuItem;
    SendEMailEmuLoader: TMenuItem;
    N35: TMenuItem;
    PopupCustomGamesManager: TMenuItem;
    N36: TMenuItem;
    MenuAdvancedTools: TMenuItem;
    PopupShowFirstPicture: TMenuItem;
    MenuShowFirstPicture: TMenuItem;
    N38: TMenuItem;
    MenuShowTitleSnapshot: TMenuItem;
    PopupShowTitleSnapshot: TMenuItem;
    MenuAuditAvailableGames: TMenuItem;
    PopupAuditAvailableGames: TMenuItem;
    MenuRefreshAvailableGames: TMenuItem;
    MenuRefreshUnavailableGames: TMenuItem;
    PopupRefreshAvailableGames: TMenuItem;
    PopupRefreshUnavailableGames: TMenuItem;
    MenuRestoreMainScreenDefaultScreenSizePosition: TMenuItem;
    N39: TMenuItem;
    MenuUseExecutable3: TMenuItem;
    MenuGameDriverInformation: TMenuItem;
    PopupGameDriverInformation: TMenuItem;
    MenuAutomaticGameInformation: TMenuItem;
    N41: TMenuItem;
    PopupAutomaticGameInformation: TMenuItem;
    PopupShowGameInfo: TMenuItem;
    N44: TMenuItem;
    MenuShowGameInfo: TMenuItem;
    MenuCreateNewGamesList: TMenuItem;
    MenuSwitchGamesList: TMenuItem;
    MenuTotalPlayTime: TMenuItem;
    MenuCustomGameOptions: TMenuItem;
    PopupCustomGameOptions: TMenuItem;
    PopupGamesAudit: TMenuItem;
    MenuGamesAudit: TMenuItem;
    MenuRefreshGames: TMenuItem;
    PopupRefreshGames: TMenuItem;
    N47: TMenuItem;
    N48: TMenuItem;
    N49: TMenuItem;
    N50: TMenuItem;
    N53: TMenuItem;
    N54: TMenuItem;
    MenuSet1stEmulatorDefaultOptions: TMenuItem;
    MenuSet2ndEmulatorDefaultOptions: TMenuItem;
    MenuSet3rdEmulatorDefaultOptions: TMenuItem;
    MenuGameFAQ: TMenuItem;
    MenuCustomInitializationOptions: TMenuItem;
    PopupGameFAQ: TMenuItem;
    PopupCustomInitializationOptions: TMenuItem;
    BuiltInSmallListImageList: TImageList;
    BuiltInBigListImageList: TImageList;
    BigRealIconsImageList: TImageList;
    SmallRealIconsImageList: TImageList;
    N64: TMenuItem;
    MenuGamesColumnsEditor: TMenuItem;
    N43: TMenuItem;
    PopupGamesColumnsEditor: TMenuItem;
    N46: TMenuItem;
    MenuSetGameDriverCustomOptions: TMenuItem;
    MenuDeleteGameDriverCustomOptions: TMenuItem;
    N65: TMenuItem;
    PopupSetGameDriverCustomOptions: TMenuItem;
    PopupDeleteGameDriverCustomOptions: TMenuItem;
    MenuSelectGameTotalPlayTime: TMenuItem;
    MenuSetDebugCustomOptions: TMenuItem;
    MenuDeleteDebugCustomOptions: TMenuItem;
    PopupSetDebugCustomOptions: TMenuItem;
    PopupDeleteDebugCustomOptions: TMenuItem;
    N70: TMenuItem;
    N71: TMenuItem;
    MenuShowControlPanelLayout: TMenuItem;
    PopupShowControlPanelLayout: TMenuItem;
    MenuEmulatorDescription: TMenuItem;
    MenuChange1stEmulatorDescription: TMenuItem;
    MenuChange2ndEmulatorDescription: TMenuItem;
    MenuChange3rdEmulatorDescription: TMenuItem;
    PopupView: TMenuItem;
    N72: TMenuItem;
    N67: TMenuItem;
    MenuGet1stEmulatorDefaultDescription: TMenuItem;
    MenuGet2ndEmulatorDefaultDescription: TMenuItem;
    MenuGet3rdEmulatorDefaultDescription: TMenuItem;
    MenuGamesData: TMenuItem;
    PopupGamesData: TMenuItem;
    N76: TMenuItem;
    MenuDeleteZIPFileName: TMenuItem;
    N77: TMenuItem;
    PopupDeleteZIPFileName: TMenuItem;
    MenuRealIconsItems: TMenuItem;
    PopupRealIconsItems: TMenuItem;
    MenuParentalLock: TMenuItem;
    MenuKeysAssignment: TMenuItem;
    N81: TMenuItem;
    MenuMAMEKeysInfo: TMenuItem;
    PopupShowFavorite: TMenuItem;
    PopupRealIcons: TMenuItem;
    MenuRealIcons: TMenuItem;
    N83: TMenuItem;
    N84: TMenuItem;
    MenuShowOnlyParentIcon: TMenuItem;
    PopupShowOnlyParentIcon: TMenuItem;
    MenuParentalLockManager: TMenuItem;
    MenuShowActiveMAMEROMPaths: TMenuItem;
    MenuUserProfile: TMenuItem;
    MenuUserProfileEditor: TMenuItem;
    N90: TMenuItem;
    MenuFullScreen: TMenuItem;
    ToolBarMenu: TToolBar;
    MenuButFile: TToolButton;
    MenuButView: TToolButton;
    MenuButGames: TToolButton;
    MenuButPictures: TToolButton;
    MenuButAdvancedTools: TToolButton;
    MenuButHelp: TToolButton;
    ToolButton2: TToolButton;
    ToolBarButtons: TToolBar;
    ToolButton4: TToolButton;
    ButtonShowFavorite: TToolButton;
    ToolButton3: TToolButton;
    ButtonRefreshAllGames: TToolButton;
    ToolButton17: TToolButton;
    ButtonPlayRecordedGame: TToolButton;
    ButtonRecordGame: TToolButton;
    INPFilename: TEdit;
    ToolButton32: TToolButton;
    PanelStatusBar: TPanel;
    ToolBarStatusBar: TToolBar;
    StatusBarGameName: TToolButton;
    StatusBarShownGames: TToolButton;
    StatusBarGameSize: TToolButton;
    StatusBarRandomGame: TToolButton;
    StatusBarFavoriteUser: TToolButton;
    StatusBarUserProfile: TToolButton;
    PanelGamesPictures: TPanel;
    PanelList: TPanel;
    PanelPictures: TPanel;
    SplitterMAMEInfo: TSplitter;
    PanelPicture1: TPanel;
    Picture: TImage32;
    PanelmameinfoDAT: TPanel;
    MAMEInfoTextHolder: TRichEdit;
    Splitter: TSplitter;
    MenuUseExecutable4: TMenuItem;
    MenuUseExecutable5: TMenuItem;
    MenuSet4thEmulatorDefaultOptions: TMenuItem;
    MenuSet5thEmulatorDefaultOptions: TMenuItem;
    MenuChange4thEmulatorDescription: TMenuItem;
    MenuChange5thEmulatorDescription: TMenuItem;
    MenuGet4thEmulatorDefaultDescription: TMenuItem;
    MenuGet5thEmulatorDefaultDescription: TMenuItem;
    MenuEmulatorDefaultOptions: TMenuItem;
    MenuShowPictures: TMenuItem;
    N1: TMenuItem;
    PopupShowPictures: TMenuItem;
    N93: TMenuItem;
    ToolButton8: TToolButton;
    MenuLanguage: TMenuItem;
    N94: TMenuItem;
    MenuAuditSelectedGameUnneededFiles: TMenuItem;
    N66: TMenuItem;
    MenuAuditAvailableGamesUnneededFiles: TMenuItem;
    N95: TMenuItem;
    MenuAuditAllGamesUnneededFiles: TMenuItem;
    N96: TMenuItem;
    PopupAuditSelectedGameUnneededFiles: TMenuItem;
    PopupAuditAvailableGamesUnneededFiles: TMenuItem;
    N97: TMenuItem;
    PopupAuditAllGamesUnneededFiles: TMenuItem;
    ToolButton1: TToolButton;
    PopupFullScreen: TMenuItem;
    ToolButton5: TToolButton;
    ToolbarButtonsImageList: TImageList;
    StatusBarImageList: TImageList;
    MenuVisitSlikStikHomepage: TMenuItem;
    N29: TMenuItem;
    MenuVisitXArcadeHomepage: TMenuItem;
    MenuVisitHotRodHomepage: TMenuItem;
    FontDialog: TFontDialog;
    ToolBarsPanel: TCoolBar;
    ThemeManager: TThemeManager;
    PopupExit: TMenuItem;
    PopupMenuModeView: TPopupMenu;
    ButtonModeViewBigIcons: TMenuItem;
    ButtonModeViewSmallIcons: TMenuItem;
    ButtonModeViewList: TMenuItem;
    ButtonModeViewDetails: TMenuItem;
    ButtonModeView: TToolButton;
    ButtonPicturesModeView: TToolButton;
    PopupMenuPicturesTypes: TPopupMenu;
    ButtonShowTitleSnapshot: TMenuItem;
    ButtonShowInGameSnapshot: TMenuItem;
    ButtonShowMarquee: TMenuItem;
    ButtonShowFlyer: TMenuItem;
    ButtonShowCabinet: TMenuItem;
    ButtonShowControlPanel: TMenuItem;
    ButtonShowControlPanelLayout: TMenuItem;
    PopupMenuExecutablesMode: TPopupMenu;
    ButtonUseExecutable1: TMenuItem;
    ButtonUseExecutable2: TMenuItem;
    ButtonUseExecutable3: TMenuItem;
    ButtonUseExecutable4: TMenuItem;
    ButtonUseExecutable5: TMenuItem;
    ButtonExecutablesMode: TToolButton;
    PopupMenuGamesDataMode: TPopupMenu;
    ButtonGameInformation: TMenuItem;
    ButtonGameHistory: TMenuItem;
    ButtonGameDriverInformation: TMenuItem;
    ButtonGameFAQ: TMenuItem;
    N57: TMenuItem;
    ButtonAutomaticGameInformation: TMenuItem;
    ButtonGamesDataMode: TToolButton;
    PopupMenuGameFilters: TPopupMenu;
    ButtonShowAllGames: TMenuItem;
    ButtonShowAvailableGames: TMenuItem;
    ButtonShowUnavailableGames: TMenuItem;
    ButtonGameFilters: TToolButton;
    ToolButton6: TToolButton;
    ButtonControllerKeysMapping: TToolButton;
    ToolButton11: TToolButton;
    PopupMenuControllerKeysMapping: TPopupMenu;
    ctrlrDefault: TMenuItem;
    OpenDialog: TOpenDialog;
    LabelEmulatorVersion: TToolButton;
    MenuExportGamesListTextFile: TMenuItem;
    N2: TMenuItem;
    MenuEmulator: TMenuItem;
    MenuButEmulator: TToolButton;
    MenuCurrentEmulator: TMenuItem;
    N28: TMenuItem;
    N55: TMenuItem;
    N58: TMenuItem;
    N23: TMenuItem;
    PopupGameType: TPopupMenu;
    PopupAllGames: TMenuItem;
    PopupClassic: TMenuItem;
    PopupNeoGeo: TMenuItem;
    PopupOriginal: TMenuItem;
    PopupClone: TMenuItem;
    PopupRaster: TMenuItem;
    PopupVector: TMenuItem;
    PopupCustomGames: TMenuItem;
    ButtonGameType: TToolButton;
    List: TListView;
    N6: TMenuItem;
    MenuCheckMissingIcons: TMenuItem;
    MenuCheckUnneededIcons: TMenuItem;
    MenuCustomCommandLine: TMenuItem;
    MenuSetCustomCommandLine: TMenuItem;
    MenuDeleteCustomCommandLine: TMenuItem;
    PopupCustomCommandLine: TMenuItem;
    PopupSetCustomCommandLine: TMenuItem;
    PopupDeleteCustomCommandLine: TMenuItem;
    N4: TMenuItem;
    MenuSetDriverCustomCommandLine: TMenuItem;
    MenuDeleteDriverCustomCommandLine: TMenuItem;
    N7: TMenuItem;
    PopupSetDriverCustomCommandLine: TMenuItem;
    PopupDeleteDriverCustomCommandLine: TMenuItem;
    MenuCreatePicturesList: TMenuItem;
    N12: TMenuItem;
    N25: TMenuItem;
    PopupCreatePicturesList: TMenuItem;
    MenuAddGameParentalLock: TMenuItem;
    N30: TMenuItem;
    PopupAddGameParentalLock: TMenuItem;
    N31: TMenuItem;
    MenuChangeGameDescription: TMenuItem;
    MenuGameDescription: TMenuItem;
    MenuDeleteCustomDescription: TMenuItem;
    PopupGameDescription: TMenuItem;
    PopupChangeGameDescription: TMenuItem;
    PopupDeleteCustomDescription: TMenuItem;
    N32: TMenuItem;
    N33: TMenuItem;
    MenuGameCategory: TMenuItem;
    MenuChangeGameCategory: TMenuItem;
    MenuDeleteCustomCategory: TMenuItem;
    PopupGameCategory: TMenuItem;
    PopupChangeGameCategory: TMenuItem;
    PopupDeleteCustomCategory: TMenuItem;
    N37: TMenuItem;
    PopupCheckMissingIcons: TMenuItem;
    PopupCheckUnneededIcons: TMenuItem;
    N40: TMenuItem;
    N42: TMenuItem;
    MenuUpdateGamesCategories: TMenuItem;
    MenuUpdateGamesDescriptions: TMenuItem;
    N45: TMenuItem;
    PopupUpdateGamesDescriptions: TMenuItem;
    N51: TMenuItem;
    PopupUpdateGamesCategories: TMenuItem;
    N52: TMenuItem;
    ZipForge: TZipForge;
    PicturesToolbarPanel: TPanel;
    PicturesToolBar: TToolBar;
    ButViewPreviousPicture: TToolButton;
    ButViewNextPicture: TToolButton;
    LabelPictureNumber: TLabel;
    procedure MenuExitClick(Sender: TObject);
    procedure MenuPreferencesClick(Sender: TObject);
    procedure ListColumnClick(Sender: TObject; Column: TListColumn);
    procedure FormShow(Sender: TObject);
    procedure MenuEmulatorSetupClick(Sender: TObject);
    procedure ButtonShowInGameSnapshotClick(Sender: TObject);
    procedure ButtonShowMarqueeClick(Sender: TObject);
    procedure ButtonShowFlyerClick(Sender: TObject);
    procedure ButtonShowCabinetClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ListSelectItem(Sender: TObject; Item: TListItem;
      Selected: Boolean);
    procedure MenuCreateGamesListClick(Sender: TObject);
    procedure ButtonShowFavoriteClick(Sender: TObject);
    procedure PopupShowHideFavoriteUsersManagerClick(Sender: TObject);
    procedure PopupShowInGameSnapshotClick(Sender: TObject);
    procedure PopupShowMarqueeClick(Sender: TObject);
    procedure PopupShowFlyerClick(Sender: TObject);
    procedure PopupShowCabinetClick(Sender: TObject);
    procedure MenuAboutClick(Sender: TObject);
    procedure MenuViewTextFilesClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure MenuShowGamesIconsLegendClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure ButtonShowControlPanelClick(Sender: TObject);
    procedure PopupShowControlPanelClick(Sender: TObject);
    procedure ListKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MenuCustomGamesManagerClick(Sender: TObject);
    procedure MenuPlayGameStandardClick(Sender: TObject);
    procedure MenuGamesClick(Sender: TObject);
    procedure MenuPlayGameClick(Sender: TObject);
    procedure MenuSetCustomOptionsClick(Sender: TObject);
    procedure MenuDeleteCustomOptionsClick(Sender: TObject);
    procedure MenuAuditSelectedGameClick(Sender: TObject);
    procedure MenuAuditAllGamesClick(Sender: TObject);
    procedure ButtonPlayRecordedGameClick(Sender: TObject);
    procedure ButtonRecordGameClick(Sender: TObject);
    procedure MenuGameHistoryClick(Sender: TObject);
    procedure MenuGameInformationClick(Sender: TObject);
    procedure MenuAddToFavoritesClick(Sender: TObject);
    procedure MenuDeleteFromFavoritesClick(Sender: TObject);
    procedure MenuCreateIconsListClick(Sender: TObject);
    procedure MenuRefreshSelectedGameClick(Sender: TObject);
    procedure MenuRefreshAllGamesClick(Sender: TObject);
    procedure MenuDeleteCurrentPictureClick(Sender: TObject);
    procedure MenuRenameCurrentPictureClick(Sender: TObject);
    procedure MenuDeleteAllExtraPicturesClick(Sender: TObject);
    procedure MenuPicturesClick(Sender: TObject);
    procedure SendEMailEmuLoaderClick(Sender: TObject);
    procedure MenuVisitEmuLoaderHomepageClick(Sender: TObject);
    procedure ToolBarButtonsResize(Sender: TObject);
    procedure MenuModeViewBigIconsClick(Sender: TObject);
    procedure MenuModeViewSmallIconsClick(Sender: TObject);
    procedure MenuModeViewListClick(Sender: TObject);
    procedure MenuModeViewDetailsClick(Sender: TObject);
    procedure MenuUseExecutable1Click(Sender: TObject);
    procedure MenuUseExecutable2Click(Sender: TObject);
    procedure MenuShowFavoriteClick(Sender: TObject);
    procedure MenuShowFirstPictureClick(Sender: TObject);
    procedure ButtonShowTitleSnapshotClick(Sender: TObject);
    procedure MenuAuditAvailableGamesClick(Sender: TObject);
    procedure MenuRefreshAvailableGamesClick(Sender: TObject);
    procedure MenuRefreshUnavailableGamesClick(Sender: TObject);
    procedure PictureClick(Sender: TObject);
    procedure MenuRestoreMainScreenDefaultScreenSizePositionClick(
      Sender: TObject);
    procedure ButtonUseExecutable3Click(Sender: TObject);
    procedure MenuGameDriverInformationClick(Sender: TObject);
    procedure MenuAutomaticGameInformationClick(Sender: TObject);
    procedure MenuShowGameInfoClick(Sender: TObject);
    procedure MenuFileClick(Sender: TObject);
    procedure MenuAdvancedToolsClick(Sender: TObject);
    procedure MenuTotalPlayTimeClick(Sender: TObject);
    procedure MenuSet1stEmulatorDefaultOptionsClick(Sender: TObject);
    procedure MenuSet2ndEmulatorDefaultOptionsClick(Sender: TObject);
    procedure MenuSet3rdEmulatorDefaultOptionsClick(Sender: TObject);
    procedure MenuGameFAQClick(Sender: TObject);
    procedure MenuGamesColumnsEditorClick(Sender: TObject);
    procedure MenuSetGameDriverCustomOptionsClick(Sender: TObject);
    procedure MenuCustomInitializationOptionsClick(Sender: TObject);
    procedure MenuDeleteGameDriverCustomOptionsClick(Sender: TObject);
    procedure MenuSelectGameTotalPlayTimeClick(Sender: TObject);
    procedure MenuSetDebugCustomOptionsClick(Sender: TObject);
    procedure MenuDeleteDebugCustomOptionsClick(Sender: TObject);
    procedure ButtonShowControlPanelLayoutClick(Sender: TObject);
    procedure PopupShowControlPanelLayoutClick(Sender: TObject);
    procedure StatusBarRandomGameClick(Sender: TObject);
    procedure MenuChange1stEmulatorDescriptionClick(Sender: TObject);
    procedure MenuChange2ndEmulatorDescriptionClick(Sender: TObject);
    procedure MenuChange3rdEmulatorDescriptionClick(Sender: TObject);
    procedure MenuGet1stEmulatorDefaultDescriptionClick(Sender: TObject);
    procedure MenuGet2ndEmulatorDefaultDescriptionClick(Sender: TObject);
    procedure MenuGet3rdEmulatorDefaultDescriptionClick(Sender: TObject);
    procedure MenuDeleteZIPFileNameClick(Sender: TObject);
    procedure MenuParentalLockClick(Sender: TObject);
    procedure ListKeyPress(Sender: TObject; var Key: Char);
    procedure ListKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MenuMAMEKeysInfoClick(Sender: TObject);
    procedure ButtonUseExecutable1Click(Sender: TObject);
    procedure ButtonUseExecutable2Click(Sender: TObject);
    procedure MenuUseExecutable3Click(Sender: TObject);
    procedure MenuPlayRecordedGameClick(Sender: TObject);
    procedure MenuRecordGameClick(Sender: TObject);
    procedure MenuShowHideFavoriteUsersManagerClick(Sender: TObject);
    procedure MenuShowTitleSnapshotClick(Sender: TObject);
    procedure PopupShowTitleSnapshotClick(Sender: TObject);
    procedure MenuShowInGameSnapshotClick(Sender: TObject);
    procedure MenuShowMarqueeClick(Sender: TObject);
    procedure MenuShowFlyerClick(Sender: TObject);
    procedure MenuShowCabinetClick(Sender: TObject);
    procedure MenuShowControlPanelClick(Sender: TObject);
    procedure MenuShowControlPanelLayoutClick(Sender: TObject);
    procedure PopupShowFavoriteClick(Sender: TObject);
    procedure MenuRealIconsClick(Sender: TObject);
    procedure MenuParentalLockManagerClick(
      Sender: TObject);
    procedure PopupRealIconsClick(Sender: TObject);
    procedure PopupPlayRecordedGameClick(Sender: TObject);
    procedure PopupRecordGameClick(Sender: TObject);
    procedure MenuShowActiveMAMEROMPathsClick(Sender: TObject);
    procedure MenuUserProfileClick(Sender: TObject);
    procedure MenuFullScreenClick(Sender: TObject);
    procedure MenuUseExecutable4Click(Sender: TObject);
    procedure MenuUseExecutable5Click(Sender: TObject);
    procedure MenuSet4thEmulatorDefaultOptionsClick(Sender: TObject);
    procedure MenuSet5thEmulatorDefaultOptionsClick(Sender: TObject);
    procedure MenuChange4thEmulatorDescriptionClick(Sender: TObject);
    procedure MenuChange5thEmulatorDescriptionClick(Sender: TObject);
    procedure MenuGet4thEmulatorDefaultDescriptionClick(Sender: TObject);
    procedure MenuGet5thEmulatorDefaultDescriptionClick(Sender: TObject);
    procedure MenuShowPicturesClick(Sender: TObject);
    procedure PopupShowPicturesClick(Sender: TObject);
    procedure MenuUserProfileEditorClick(Sender: TObject);
    procedure MenuLanguageClick(Sender: TObject);
    procedure ButtonShowAllGamesClick(Sender: TObject);
    procedure ButtonShowAvailableGamesClick(Sender: TObject);
    procedure ButtonShowUnavailableGamesClick(Sender: TObject);
    procedure PopupFullScreenClick(Sender: TObject);
    procedure ButtonUseExecutable4Click(Sender: TObject);
    procedure ButtonUseExecutable5Click(Sender: TObject);
    procedure MenuCreateNewGamesListClick(Sender: TObject);
    procedure MenuVisitXArcadeHomepageClick(Sender: TObject);
    procedure MenuVisitSlikStikHomepageClick(Sender: TObject);
    procedure MenuVisitHotRodHomepageClick(Sender: TObject);
    procedure StatusBarFavoriteUserClick(Sender: TObject);
    procedure ButtonModeViewBigIconsClick(Sender: TObject);
    procedure ButtonModeViewSmallIconsClick(Sender: TObject);
    procedure ButtonModeViewListClick(Sender: TObject);
    procedure ButtonModeViewDetailsClick(Sender: TObject);
    procedure PopupAutomaticGameInformationClick(Sender: TObject);
    procedure ButtonAutomaticGameInformationClick(Sender: TObject);
    procedure ListData(Sender: TObject; Item: TListItem);
    procedure ListDataFind(Sender: TObject; Find: TItemFind;
      const FindString: String; const FindPosition: TPoint;
      FindData: Pointer; StartIndex: Integer; Direction: TSearchDirection;
      Wrap: Boolean; var Index: Integer);
    procedure ListCustomDrawItem(Sender: TCustomListView; Item: TListItem;
      State: TCustomDrawState; var DefaultDraw: Boolean);
    procedure ctrlrDefaultClick(Sender: TObject);
    procedure MenuExportGamesListTextFileClick(Sender: TObject);
    procedure PopupAllGamesClick(Sender: TObject);
    procedure PopupClassicClick(Sender: TObject);
    procedure PopupNeoGeoClick(Sender: TObject);
    procedure PopupOriginalClick(Sender: TObject);
    procedure PopupCloneClick(Sender: TObject);
    procedure PopupRasterClick(Sender: TObject);
    procedure PopupVectorClick(Sender: TObject);
    procedure PopupCustomGamesClick(Sender: TObject);
    procedure MenuCheckMissingIconsClick(Sender: TObject);
    procedure MenuCheckUnneededIconsClick(Sender: TObject);
    procedure MenuSetCustomCommandLineClick(Sender: TObject);
    procedure MenuDeleteCustomCommandLineClick(Sender: TObject);
    procedure MenuSetDriverCustomCommandLineClick(Sender: TObject);
    procedure MenuDeleteDriverCustomCommandLineClick(Sender: TObject);
    procedure ButViewPreviousPictureClick(Sender: TObject);
    procedure ButViewNextPictureClick(Sender: TObject);
    procedure MenuCreatePicturesListClick(Sender: TObject);
    procedure MenuAddGameParentalLockClick(Sender: TObject);
    procedure MenuChangeGameDescriptionClick(Sender: TObject);
    procedure MenuDeleteCustomDescriptionClick(Sender: TObject);
    procedure MenuChangeGameCategoryClick(Sender: TObject);
    procedure MenuDeleteCustomCategoryClick(Sender: TObject);
    procedure MenuUpdateGamesDescriptionsClick(Sender: TObject);
    procedure MenuUpdateGamesCategoriesClick(Sender: TObject);
    procedure ListColumnRightClick(Sender: TObject; Column: TListColumn;
      Point: TPoint);
    procedure ZipForgeProcessFileFailure(Sender: TObject; FileName: String;
      Operation: TZFProcessOperation; NativeError, ErrorCode: Integer;
      ErrorMessage: String; var Action: TZFAction);
    procedure ZipForgeOverallProgress(Sender: TObject; Progress: Double;
      Operation: TZFProcessOperation; ProgressPhase: TZFProgressPhase;
      var Cancel: Boolean);

  private
    ColumnsSort: array of ShortInt;
    AddParentSet: Boolean;
    ListROMs: THashedStringList;
    IsPlayChoice, IsCvs, IsNeoGeo, IsDecoSystem, IsPgm, IsSuperKanekoNova, IsSTV: Boolean;

    ClassicMRList, ClassicMVList, ClassicCRList, ClassicCVList, NeoGeoMList, NeoGeoCList: THashedStringList;
    UnavailableClassicMRList, UnavailableClassicMVList, UnavailableClassicCRList, UnavailableClassicCVList, UnavailableNeoGeoMList, UnavailableNeoGeoCList: THashedStringList;
    BiosList, UnavailableBiosList: THashedStringList;

    ListFilterActualSelection: Integer;
    RealIconsList: THashedStringList;
    ProcessingAutomaticMAMEInfoDAT: Boolean;

    TotalPlayTime: String;
    CurrentGameDriver: String[12];

    //temporary variable to workarround the closing window after activating parental lock
    CloseStatusWindow: Boolean;

    FormMainWidth, FormMainHeight, FormMainTop, FormMainLeft: SmallInt;
    LabelPictureNumberValue: String[35];
    PictureNumber: ShortInt;
    VirtualPicturesList: THashedStringList;

    procedure ClearEntries;
    procedure InitializeColumnsSort;
    procedure InitializeEmulatorVariables;
    procedure ClearMemoryColumnsVariables;
    function  FindGame(CurrentIndex: Integer; GameDescription: String): Integer;

    function  GetPlayTime(Milliseconds: Int64): String;
    procedure ChangeEmulatorDescription(EmulatorNumber: ShortInt);
    procedure GetEmulatorDefaultDescription(const EmulatorFileName: String; EmulatorNumber: ShortInt);

    // Load Icons in TImageList components
    function  LoadToolbarIcons: Boolean;
    function  LoadStatusBarIcons: Boolean;
    function  LoadMAMEConfigurationIcons(IconList: TImageList): Boolean;

    procedure SetRealIcons;

    function  LoadGames(ClassificationName: String; IsFavorite: Boolean; BiosTypeName: String): Boolean;
    procedure ScanLockedGames(mGamesList: THashedStringList);
    function  LoadROMClasses(FavoriteList: Boolean): Boolean;
    function  VerifyResourceFiles(Resource: Boolean; FileROM: String): Boolean;
    function  CreateGamesList(ExecutableString: String; DefaultDatabase: Boolean): Boolean;
    procedure SetGameMemoryInfo;
    function  AddToFavorite: Boolean;
    function  DeleteFromFavorite: Boolean;
    function  RefreshGames(GamesList1: THashedStringList; GamesList2: THashedStringList; GamesList1Position: Integer): Boolean;
    function  VerifyFiles(VClassicMR: Boolean; VClassicMV: Boolean; VClassicCR: Boolean; VClassicCV: Boolean; VNeoGeoM: Boolean; VNeoGeoC: Boolean;
                          VUnClassicMR: Boolean; VUnClassicMV: Boolean; VUnClassicCR: Boolean; VUnClassicCV: Boolean; VUnNeoGeoM: Boolean; VUnNeoGeoC: Boolean;
                          VBios: Boolean; VUnBios: Boolean;
                          VCustomGames: Boolean; VUnCustomGames: Boolean; IsCustomList: Boolean): Boolean;

    procedure RefreshGamesCanceledMessage;
    function  StopRefreshAllGames: Boolean;
    function  StopBuildDatabase: Boolean;

    procedure CheckPlayTime;
    function  ReadSelectedGamePlayTime(GameName: String): String;
    procedure UpdateSelectedGamePlayTime(GameName: String; TotalPlayTime: Int64);

    // New Full Screen Mode functions
    procedure WMSystemCommand(var Msg: TWMSysCommand) ;  message WM_SYSCOMMAND;

    { Private declarations }
  public
    GamesList: array of TGameInfo;
    CompleteGamesList: THashedStringList;
    ColumnSorted: ShortInt;
    SelectedGame: Integer;


    EmulatorVersion: array of String;
    EmulatorExecutable: array of String;
    EmulatorType: array of ShortInt;

    FrontendPath, FavoriteUser: String;
    ShowingPicture, TextWordWrap, CancelCurrentOperation, AbortExecution: Boolean;

    ROMsFolders, GameSizeBits: THashedStringList;

    historyFile, mameinfoFile: String;
    CategoriesList, RealIconsDAT: TMemIniFile;

    ClassicMR, ClassicMV, ClassicCR, ClassicCV, NeoGeoM, NeoGeoC: Boolean;
    UnavailableClassicMR, UnavailableClassicMV, UnavailableClassicCR, UnavailableClassicCV, UnavailableNeoGeoM, UnavailableNeoGeoC: Boolean;
    BiosClassic, BiosNeoGeo, UnavailableBiosClassic, UnavailableBiosNeoGeo: Boolean;
    CustomGames, UnavailableCustomGames: Boolean;

    mImageIndex: ShortInt;
    mROMIdentification: ShortInt;
    mDescription, mManufacturer, mControlType, mCategory: String;
    mYear: String[4];
    mSound: String[10];
    mFrequency: String[8];
    mSamples: String[3];
    mVideo: String[8];
    mOrientation: String[10];
    mResolution: String[8];
    mDriverStatus: String[12];
    mSoundStatus: String[12];
    mColorStatus: String[12];
    mMerged: String[3];
    mName: String[8];
    mClone: String[18];
    mVersionAdded: String[20];
    mDriver: String[14];

    snaptitleDir, snapingameDir, marqueeDir, flyerDir, cabinetDir, controlpanelDir, controlpanellayoutDir: String;
    iconDir, faqDir, ctrlrDir, IniFilesDir, PictureZIP: String;

    PictureType: ShortInt;

    ListROMsName, ListROMsSize, ListROMsCRC, ListROMsNameFullPath: THashedStringList;
    ParentListROMsName, ParentListROMsSize, ParentListROMsCRC, ParentListROMsNameFullPath: THashedStringList;

    Auditing: Boolean;
    DefaultDatabaseBuilderExecutable: String[1];
    AutoMAMEInfoDATFile, AutoHistoryDATFile, ParentalLockGamesList: THashedStringList;

    ParentalLockPasswordString, ActiveUserProfileDescription, FrontendLanguage, LogoFileName: String;

    procedure QuickSort(const CompareFunction: TQuickSortCompare; const SortAscending: Boolean; const LoValue, HiValue, ColumnID: Integer);
    procedure SortColumn(ColumnID: ShortInt; ForceSortAscending: Boolean);

    function  PopulateROMDataLine: String;
    function  AddGames(ClearGames: Boolean): Boolean; // Add games to the list (Virtual Mode)

    procedure UpdateProgressLabel(Position, Total: Integer; IncValue: Boolean);

    function  CheckWinXPThemes: Boolean;
    function  CheckFileAttributes(const FileNameString: String): Boolean;

    procedure DialogOpenFile(FilterType: ShortInt; const DialogTitle: String; EditHolder: TEdit);
    procedure DialogSelectFolder(EditHolder: TEdit; MultipleFolders: Boolean);
    procedure LoadIcon(ImageHolder: TImage32; ImageFileName: String);

    procedure SetGameType(GameTypeIndex: ShortInt);
    function  GetGameTypeDescription(GameClass, BiosType: String): String;
    procedure ExecuteGame(GameName: String; RunStandard: Boolean; ShowAverageFPS: Boolean);

    procedure UpdateStatusBarGame;
    procedure AppException(Sender: TObject; E: Exception);
    function  LoadROMFilters(const GamesFilter: String): Boolean;
    function  SearchZIP(GameName: String): Boolean;
    function  SearchZIPFolder(GameName: String): String;
    function  SearchCHDFolder(GameName, DiskImageFileName: String): String;
    function  FoundMerged(GameName, OriginalGameName: String): Boolean;

    function  RunProcess(AppPath: String; MustWait: Boolean=FALSE;
                         Visibility: Word=SW_SHOWNORMAL; RunningGame: Boolean=True):DWORD;

    procedure LoadFolders(ExecutableString: String);

    procedure LoadRealIcons;
    procedure GetROMFields(const ROMLine: String);
    procedure GetGameROMs(ROMLine: String; Auditing: Boolean);
    function  GetEmulatorVersion(EmulatorNumber: ShortInt; ExeFileType: String): Boolean;
    function  GetExeType(const FileName: String): TExeType;
    procedure UpdateGeneralAppearance(FormName: TForm);
    procedure ReadTextViewerFont(FormID: Byte);
    procedure UpdateTextViewerFont(FormID: Byte);
    procedure CreateIniFile;
    function  ReadIniFile: Boolean;
    procedure UpdateIniFile;

    function  GetExecutableINIFileName(ExecutableFileName: String): String;
    function  CheckMAMEIniFiles: Boolean;

    function  CheckDOSMAMEConfigFile(ExecutableString: String): Boolean;
    procedure CreateDOSMAMEConfigFile(ExecutableString: String);
    procedure ReadDOSMAMEConfigFile(ExecutableString: String);
    procedure UpdateDOSMAMEConfigFile(ExecutableString: String);

    function  ReadMAMECustomCommandLine(GameName: String; CustomCmdType: ShortInt): String;
    procedure UpdateMAMECustomCommandLine(GameName, CustomExecutable, CustomParameters: String; CustomCmdType: ShortInt);
    procedure DeleteMAMECustomCommandLine(GameName: String; CustomCmdType: ShortInt);

    function  ReadCustomGameDescription(GameName: String; out DefaultDescription: String): String;
    function  UpdateCustomGameDescription(GameName, CustomDescription, DefaultDescription: String): Boolean;
    procedure DeleteCustomGameDescription(GameName: String);

    function  ReadCustomGameCategory(GameName: String): String;
    function  UpdateCustomGameCategory(GameName, CustomCategory, DefaultCategory: String): Boolean;
    procedure DeleteCustomGameCategory(GameName: String);

    // MAME Options grouped
    function  GetAspectRatio(AspectRatioHolder: TGaugeBar): String;
    function  GetBlitterEffect(BlitterEffectHolder: TGaugeBar): String;
    function  GetSampleRate(SampleRateHolder: TGaugeBar): String;
    function  GetResolution(ResolutionHolder: TGaugeBar): String;

    function  SetDefaultAspectRatio(const AspectRatioValue: String): Byte;
    function  SetResolution(ResolutionValue: String): ShortInt;
    function  SetBlitterEffect(BlitterEffectValue: String): ShortInt;

    // DOS MAME Options grouped
    function  GetDOSResolution(ResolutionHolder: TGaugeBar): String;
    function  GetDOSMonitor(MonitorHolder: TGaugeBar): String;
    function  GetDOSSoundCard(SoundCardHolder: TGaugeBar): String;
    function  GetDOSJoystick(JoystickHolder: TGaugeBar): String;
    function  GetDOSVesaMode(VESAHolder: TGaugeBar): String;
    function  GetDOSDepth(DepthHolder: TGaugeBar): String;

    function  SetDOSResolution(ResolutionValue: String): ShortInt;
    function  SetDOSJoystick(JoystickValue: String): ShortInt;
    function  SetDOSVesaMode(VesaModeValue: String): ShortInt;
    function  SetDOSScanlines(ScanlinesValue: String): ShortInt;

    function  CheckMAMEIniFile(ExecutableString: String): Boolean;
    procedure CreateMAMEIniFile(ExecutableString: String);
    procedure ReadMAMEIniFile(ExecutableString: String);
    procedure UpdateMAMEIniFile(ExecutableString: String);

    procedure SetCustomOptions(GameName: String; Driver: Boolean);
    procedure DeleteCustomOptions(GameName: String);

    procedure GetKeysMappingList(ExecutableString: String);
    procedure AddPopupItem(PopupHolder: TPopupMenu; Description: String; Duplicate, LoadDefault: Boolean);
    procedure GetControllersList(ListHolder: THashedStringList; FolderControllerKeys: String);

    procedure CallEmulatorOptions(ExecutableString: String);

    procedure ExtractROMsFolders(ROMsList: String);

    procedure GetMAMEExtendedPaths;
    procedure SmoothPicture(PictureHolder: TImage32);
    procedure SetAspectRatio(PictureHolder: TImage32);
    procedure ToggleVirtualPicturesList(EnableList: Boolean);
    procedure SetVirtualPictureType;
    procedure GetTotalPictures;
    procedure UpdateLabelPictures;

    procedure CromaKey(ABitmap: TBitmap32; TrColor: TColor32);
    function  SetPictureFileName(Picture: String): String;
    function  MountPicName(PictureName: String): String;
    procedure CyclePictureType;
    procedure InvertCyclePictureType;
    procedure ButtonViewPicture(ButtonCode: ShortInt);
    function  ShowPicture(GameName, CloneGameName: String; ImageHolder: TImage32; ImageType: Integer; CloseZIP: Boolean): String;
    procedure LoadPictureFromStream(StreamHolder: TMemoryStream; ImageHolder: TImage32; PicType: ShortInt);

    function  RefreshGame: Boolean;

    function  SearchString(const SubString, StringLine: String): Boolean;

    // ZIP functions
    //function  Subs(S: String; Sub, Sost: Char): String;
    function  GetContents(ZipFileName: String; DeleteList, DeleteParentList: Boolean): Boolean;
    function  UnZipFile(ZipFileName, ROMFileName: String): Boolean;
    function  UnZipFileMemory(ZipFileName, ROMFileName: String; StreamHolder: TMemoryStream): Boolean;

    function  DeleteFileInsideZip(ZipFileName, DelFileName: String): Boolean;
    function  DeleteExtraFileInsideZip(ZipFileName, DelFileName: String): Boolean;
    function  RenameFileInsideZip(ZipFileName, CurrentName, NewName: String): Boolean;
    function  ExtractFilesList(ZipFileName, FilesUnzip: String): Boolean;

    procedure ShowAutomaticGameInformation;

    function  GetCurrentEmulatorFormat: ShortInt;
    function  GetCurrentEmulatorExecutable: String;

    function  GetColumnIndex(ColumnTagIndex: ShortInt): ShortInt;
    procedure SetColumnPosition(ColumnID, NewPositionIndex: ShortInt; ForceUpdate: Boolean);

    // Columns visibility procedures
    procedure UpdateColumnsVisibility;
    procedure ChangeColumnStatus(ColumnTagIndex: ShortInt; DefaultColumnSize, CustomColumnSize: Integer; ColumnChecked: Boolean);

    function  CheckDefaultIconsFile: Boolean;
    procedure AddDefaultIcons(IconFileName: String; IconList: TImageList; IconType: ShortInt; GameIcons: Boolean);
    procedure ReadDefaultIconsFile;

    function  SaveLoadRealIcons(ActionIndex: Shortint): Boolean;
    procedure SelectItem(ItemIndex: Integer);

    // User Profile procedures
    procedure ResetUserProfileOptions;
    function  SetUserProfileOptions(UserProfile: String): Boolean;
    function  ReadUserProfileOptions(UserProfile: String): Boolean;
    function  UpdateUserProfileOptions(UserProfile: String): Boolean;
    procedure ResetProfileEditorOptions;
    function  VerifyProfileChanges(UserProfile: String): Boolean;

    procedure SetLockedGamesList(Mode: Boolean);

    // Language procedures
    function  GetLanguageText(const Section, Option, TextString: String): String;
    function  GetStatusMessage(MsgCode: String): String;
    procedure SetMessagesLanguage;
    procedure SetMainLanguage;
    procedure SetEmulatorsSetupLanguage;
    procedure SetAuditGamesLanguage;
    procedure SetParentalLockLogoutLanguage;
    procedure SetParentalLockLanguage;
    procedure SetUserProfileLoginLanguage;
    procedure SetUserProfileLanguage;
    procedure SetTextViewerLanguage;
    procedure SetDATViewerLanguage;
    procedure SetFavoriteUsersManagerLanguage;
    procedure SetCustomGamesLanguage;
    procedure SetGameColumnsLanguage;
    procedure SetMAMEConfigurationLanguage;
    procedure SetMAMECustomConfigurationLanguage;
    procedure SetDOSMAMEConfigurationLanguage;
    procedure SetDOSMAMECustomConfigurationLanguage;
    procedure SetPreferencesLanguage;
    procedure SetCustomCommandLineLanguage;
    procedure SetIconsLegendLanguage;
    procedure SetCustomGameDescriptionLanguage;
    procedure SetCustomGameCategoryLanguage;

    { Public declarations }
  end;

var
  FormMain: TFormMain;

implementation

uses uPreferences, uStatus, uMAMEKeysInfo, uFavoriteUsersManager,
     uAuditGames, uDOSMAMECustomConfig, uAbout,
     uTextFilesViewer, uDATViewer, uGamesListLegend,
     uCustomGames, uMessages, uGameInfo, uDOSMAMEConfig, uMAMEConfig,
     uEmulatorsSetup, uMAMECustomConfig,
     uGameColumns, uParentalLockManager, uParentalLockPasswordLogout,
     uCommon, uFilesUtil, uUserProfileEditor, uUserProfileUserLogin, uLanguage,
     uCustomCommandLine, uCustomGameDescription, uCustomGameCategory;

{$R *.DFM}
{$R Icons.res}

{function TFormMain.Subs(S: String; Sub, Sost: Char): String;
var
  Counter: Longint;
begin
  for Counter:= 0 to Length(S) do
    if S[Counter] = Sub then
       S[Counter]:= Sost;
  Result:= S;
end;}

function TFormMain.GetContents(ZipFileName: String; DeleteList, DeleteParentList: Boolean): Boolean;
var
  ArchiveItem: TZFArchiveItem;
begin
  AddParentSet:= DeleteParentList;
  if DeleteList then
     begin
       if Assigned(ListROMsName) then
          ListROMsName.Clear;
       if Assigned(ListROMsSize) then
          ListROMsSize.Clear;
       if Assigned(ListROMsCRC) then
          ListROMsCRC.Clear;

       if Assigned(ListROMsNameFullPath) then
          ListROMsNameFullPath.Clear;
     end;

  if DeleteParentList Then
     begin
       if Assigned(ParentListROMsName) then
          ParentListROMsName.Clear;
       if Assigned(ParentListROMsSize) then
          ParentListROMsSize.Clear;
       if Assigned(ParentListROMsCRC) then
          ParentListROMsCRC.Clear;

       if Assigned(ParentListROMsNameFullPath) then
          ParentListROMsNameFullPath.Clear;
     end;

  with ZipForge do
  begin
    FileName:= ZipFileName;

    // Open existing archive file
    OpenArchive(fmOpenRead);

    Result:= FileCount > 0;
    if Result then
       begin
         // Search text files stored inside the archive
         if (FindFirst('*.*', ArchiveItem, faAnyFile-faDirectory)) then
            begin
              case AddParentSet of
                False:
                  begin
                    repeat
                      if Assigned(ListROMsName) then
                         ListROMsName.Add(AnsiLowerCase(ArchiveItem.FileName));
                      if Assigned(ListROMsSize) then
                         ListROMsSize.Add(IntToStr(ArchiveItem.UncompressedSize));
                      if Assigned(ListROMsCRC) then
                         ListROMsCRC.Add(LowerCase(Format('%x', [ArchiveItem.CRC])));

                      if Assigned(ListROMsNameFullPath) then
                         ListROMsNameFullPath.Add(AnsiLowerCase(AnsiLowerCase(ArchiveItem.StoredPath+ArchiveItem.FileName)));
                    until (not FindNext(ArchiveItem));
                  end;
                True:
                  begin
                    repeat
                      if Assigned(ParentListROMsName) then
                         ParentListROMsName.Add(AnsiLowerCase(ArchiveItem.FileName));
                      if Assigned(ParentListROMsSize) then
                         ParentListROMsSize.Add(IntToStr(ArchiveItem.UncompressedSize));
                      if Assigned(ParentListROMsCRC) then
                         ParentListROMsCRC.Add(LowerCase(Format('%x', [ArchiveItem.CRC])));

                      if Assigned(ParentListROMsNameFullPath) then
                         ParentListROMsNameFullPath.Add(AnsiLowerCase(AnsiLowerCase(ArchiveItem.StoredPath+ArchiveItem.FileName)));
                    until (not FindNext(ArchiveItem));
                  end;
              end;
            end
         else
            Result:= False;
       end;
    // Close the archive
    CloseArchive;
  end;
  if not Result then
     begin
       GenerateMessage(GetLanguageText('Messages', 'ErrorTitle', 'Error'),
                       Format(GetLanguageText('Messages', 'FileOpenErrorMsg',
                                              'Could not open file "%s"! File can be damaged or incomplete. Please verify.'), [ZipFileName]), 2);
     end;
end;

function TFormMain.UnZipFile(ZipFileName, ROMFileName: String): Boolean;
begin
  with ZipForge do
  begin
    FileName:= ZipFileName;
    OpenArchive(fmOpenRead);

    Result:= FileCount > 0;
    if Result then
       begin
         BaseDir:= GetWinTempDir;
         ExtractFiles(ROMFileName);
       end;
    CloseArchive;
  end;
  if not Result then
     begin
       GenerateMessage(GetLanguageText('Messages', 'ErrorTitle', 'Error'),
                       Format(GetLanguageText('Messages', 'FileOpenErrorMsg',
                                              'Could not open file "%s"! File can be damaged or incomplete. Please verify.'), [ZipFileName]), 2);
     end;
end;

function TFormMain.UnZipFileMemory(ZipFileName, ROMFileName: String; StreamHolder: TMemoryStream): Boolean;
begin
  with ZipForge do
  begin
    FileName:= ZipFileName;
    OpenArchive(fmOpenRead);

    Result:= FileCount > 0;
    if Result then
       begin
         ExtractToStream(ROMFileName, StreamHolder);
       end;
    CloseArchive;
  end;
  if not Result then
     begin
       GenerateMessage(GetLanguageText('Messages', 'ErrorTitle', 'Error'),
                       Format(GetLanguageText('Messages', 'FileOpenErrorMsg',
                                              'Could not open file "%s"! File can be damaged or incomplete. Please verify.'), [ZipFileName]), 2);
     end;
end;

function TFormMain.DeleteFileInsideZip(ZipFileName, DelFileName: String): Boolean;
begin
  with ZipForge do
  begin
    FileName:= ZipFileName;
    OpenArchive(fmOpenReadWrite);

    Result:= FileCount > 0;
    if Result then
       begin
         DeleteFiles(DelFileName);
       end;
    CloseArchive;
  end;
  if not Result then
     begin
       GenerateMessage(GetLanguageText('Messages', 'ErrorTitle', 'Error'),
                       Format(GetLanguageText('Messages', 'FileOpenErrorMsg',
                                              'Could not open file "%s"! File can be damaged or incomplete. Please verify.'), [ZipFileName]), 2);
     end;
end;

function TFormMain.DeleteExtraFileInsideZip(ZipFileName, DelFileName: String): Boolean;
begin
  with ZipForge do
  begin
    FileName:= ZipFileName;
    OpenArchive(fmOpenReadWrite);

    Result:= FileCount > 0;
    if Result then
       begin
         DeleteFiles(DelFileName+'????.png', faAnyFile-faDirectory, DelFileName+'.png');
       end;
    CloseArchive;
    FileMasks:= nil;
    ExclusionMasks:= nil;
  end;
  if not Result then
     begin
       GenerateMessage(GetLanguageText('Messages', 'ErrorTitle', 'Error'),
                       Format(GetLanguageText('Messages', 'FileOpenErrorMsg',
                                              'Could not open file "%s"! File can be damaged or incomplete. Please verify.'), [ZipFileName]), 2);
     end;
end;

function TFormMain.RenameFileInsideZip(ZipFileName, CurrentName, NewName: String): Boolean;
begin
  with ZIPForge do
  begin
    FileName:= ZipFileName;
    OpenArchive(fmOpenReadWrite);

    Result:= FileCount > 0;
    if Result then
       begin
         RenameFile(CurrentName, NewName);
         //GenerateMessage(GetLanguageText('Messages', 'ErrorTitle', 'Error'),
         //                   Format(GetLanguageText('Messages', 'RenameInsideZIPFailedMsg', 'Could not rename "%s" to "%s".')   , [CurrentName, NewName]), 2);
       end;
    CloseArchive;
  end;
  if not Result then
     begin
       GenerateMessage(GetLanguageText('Messages', 'ErrorTitle', 'Error'),
                       Format(GetLanguageText('Messages', 'FileOpenErrorMsg',
                                              'Could not open file "%s"! File can be damaged or incomplete. Please verify.'), [ZipFileName]), 2);
     end;
end;

function TFormMain.ExtractFilesList(ZipFileName, FilesUnzip: String): Boolean;
begin
  with ZIPForge do
  begin
    FileName:= ZipFileName;
    OpenArchive(fmOpenRead);

    Result:= FileCount > 0;
    if Result then
       begin
         BaseDir:= GetWinTempDir;
         ExtractFiles(FilesUnzip);
         //GenerateMessage(GetLanguageText('Messages', 'ErrorTitle', 'Error'),
         //                   Format(GetLanguageText('Messages', 'RenameInsideZIPFailedMsg', 'Could not rename "%s" to "%s".')   , [CurrentName, NewName]), 2);
       end;
    CloseArchive;
  end;
  if not Result then
     begin
       GenerateMessage(GetLanguageText('Messages', 'ErrorTitle', 'Error'),
                       Format(GetLanguageText('Messages', 'FileOpenErrorMsg',
                                              'Could not open file "%s"! File can be damaged or incomplete. Please verify.'), [ZipFileName]), 2);
     end;
end;

// this is needed to free the memory used by each string within each record
procedure TFormMain.ClearEntries;
var
  Loop: Integer;
begin
  for Loop:=0 to Length(GamesList)-1 do
  begin
    Finalize(GamesList[Loop].eImageIndex);
    Finalize(GamesList[Loop].eROMIdentification);
    Finalize(GamesList[Loop].eDescription);
    Finalize(GamesList[Loop].eYear);
    Finalize(GamesList[Loop].eManufacturer);
    Finalize(GamesList[Loop].eSound);
    Finalize(GamesList[Loop].eFrequency);
    Finalize(GamesList[Loop].eSamples);
    Finalize(GamesList[Loop].eControlType);
    Finalize(GamesList[Loop].eVideo);
    Finalize(GamesList[Loop].eOrientation);
    Finalize(GamesList[Loop].eResolution);
    Finalize(GamesList[Loop].eDriverStatus);
    Finalize(GamesList[Loop].eSoundStatus);
    Finalize(GamesList[Loop].eColorStatus);
    Finalize(GamesList[Loop].eMerged);
    Finalize(GamesList[Loop].eName);
    Finalize(GamesList[Loop].eClone);
    Finalize(GamesList[Loop].eCategory);
    Finalize(GamesList[Loop].eVersionAdded);
    Finalize(GamesList[Loop].eDriver);
    Finalize(GamesList[Loop].eGameSize);
  end;
end;

procedure TFormMain.ClearMemoryColumnsVariables;
begin
  mROMIdentification:= -1;
  mDescription:= '';
  mYear:= '';
  mManufacturer:= '';
  mSound:= '';
  mFrequency:= '';
  mSamples:= '';
  mControlType:= '';
  mVideo:= '';
  mOrientation:= '';
  mResolution:= '';
  mDriverStatus:= '';
  mSoundStatus:= '';
  mColorStatus:= '';
  mMerged:= '';
  mName:= '';
  mClone:= '';
  mCategory:= '';
  mVersionAdded:= '';
  mDriver:= '';
end;

procedure TFormMain.SetGameMemoryInfo;
begin
  with GamesList[SelectedGame] do
  begin
    mROMIdentification:= eROMIdentification;
    mDescription:= eDescription;
    mYear:= eYear;
    mManufacturer:= eManufacturer;
    mSound:= eSound;
    mFrequency:= eFrequency;
    mSamples:= eSamples;
    mControlType:= eControlType;
    mVideo:= eVideo;
    mOrientation:= eOrientation;
    mResolution:= eResolution;
    mDriverStatus:= eDriverStatus;
    mSoundStatus:= eSoundStatus;
    mColorStatus:= eColorStatus;
    mMerged:= eMerged;
    mName:= eName;
    if eClone = eName then
       mClone:= ''
    else
       mClone:= eClone;
    mCategory:= eCategory;
    mVersionAdded:= eVersionAdded;
    mDriver:= eDriver;
  end;
end;

procedure TFormMain.InitializeColumnsSort;
var
  Loop: ShortInt;
begin
  // set 0 for Ascending
  // set 1 for Descending
  SetLength(ColumnsSort, 18);
  for Loop:=0 to Length(ColumnsSort) do
    ColumnsSort[Loop]:= 0;
end;

procedure TFormMain.InitializeEmulatorVariables;
var
  Loop: ShortInt;
begin
  for Loop:=0 to Length(EmulatorType) do
  begin
    EmulatorType[Loop]:= 0;
    EmulatorVersion[Loop]:= '';
    EmulatorExecutable[Loop]:= '';
  end;
end;

function CompareColumnsValue(var GameItem1, GameItem2: TGameInfo; var ColumnID: Integer): Integer;
begin
  case ColumnID of
     0: Result:= CompareStr(GameItem1.eDescription, GameItem2.eDescription);
     1: Result:= CompareStr(GameItem1.eYear, GameItem2.eYear);
     2: Result:= CompareStr(GameItem1.eManufacturer, GameItem2.eManufacturer);
     3: Result:= CompareStr(GameItem1.eSound, GameItem2.eSound);
     4: Result:= CompareStr(GameItem1.eFrequency, GameItem2.eFrequency);
     5: Result:= CompareStr(GameItem1.eSamples, GameItem2.eSamples);
     6: Result:= CompareStr(GameItem1.eControlType, GameItem2.eControlType);
     7: Result:= CompareStr(GameItem1.eVideo, GameItem2.eVideo);
     8: Result:= CompareStr(GameItem1.eOrientation, GameItem2.eOrientation);
     9: Result:= CompareStr(GameItem1.eResolution, GameItem2.eResolution);
    10: Result:= CompareStr(GameItem1.eDriverStatus, GameItem2.eDriverStatus);
    11: Result:= CompareStr(GameItem1.eSoundStatus, GameItem2.eSoundStatus);
    12: Result:= CompareStr(GameItem1.eColorStatus, GameItem2.eColorStatus);
    13: Result:= CompareStr(GameItem1.eMerged, GameItem2.eMerged);
    14: Result:= CompareStr(GameItem1.eName, GameItem2.eName);
    15: Result:= CompareStr(GameItem1.eClone, GameItem2.eClone);
    16: Result:= CompareStr(GameItem1.eCategory, GameItem2.eCategory);
    17: Result:= CompareStr(GameItem1.eVersionAdded, GameItem2.eVersionAdded);
    18: Result:= CompareStr(GameItem1.eDriver, GameItem2.eDriver);
  end;
end;

// Actual Quick Sorting routine
// ----------------------------
// Note1: You must pass a 'compare function'; return -1 if item1<item2, +1 if item1>item2 or 0 if item1=item2
// Note2: To sort descending reverse the above logic, ie. return +1 if item1<item2, -1 if item1>item2 or 0 if item1=item2
procedure TFormMain.QuickSort(const CompareFunction: TQuickSortCompare; const SortAscending: Boolean; const LoValue, HiValue, ColumnID: Integer);
var
  Lo, Hi, AscendFlag, mColumnID: Integer;
  MiddleEntry, TempEntryToSwap: TGameInfo;
begin
  if SortAscending then
     AscendFlag:= 1
  else
     AscendFlag:= -1;

  Lo:= LoValue;
  Hi:= HiValue;
  mColumnID:= ColumnID;

  MiddleEntry:= GamesList[(Lo+Hi) div 2];  // get a 'middle' value
  repeat
    // find a good start / finish
    while (CompareFunction(GamesList[Lo], MiddleEntry, mColumnID) * AscendFlag < 0) do Inc(Lo);
    while (CompareFunction(GamesList[Hi], MiddleEntry, mColumnID) * AscendFlag > 0) do Dec(Hi);

    // swap entry around
    if (Lo <= Hi) then
       begin
         TempEntryToSwap:= GamesList[Lo];
         GamesList[Lo]:= GamesList[Hi];
         GamesList[Hi]:= TempEntryToSwap;
         Inc(Lo);
         Dec(Hi);
       end;
  until (Lo > Hi);

  // still needs another sort: call itself recursively
  if (Hi > LoValue) then QuickSort(CompareFunction, SortAscending, LoValue, Hi, ColumnID);
  if (Lo < HiValue) then QuickSort(CompareFunction, SortAscending, Lo, HiValue, ColumnID);
end;

procedure TFormMain.SortColumn(ColumnID: ShortInt; ForceSortAscending: Boolean);
var
  CurrentGame: String;
begin
  if List.Selected <> nil then
     CurrentGame:= GamesList[SelectedGame].eDescription;

  if ForceSortAscending then
     ColumnsSort[ColumnID]:= 0;

  QuickSort(CompareColumnsValue, (ColumnsSort[ColumnID] = 0), Low(GamesList), High(GamesList), List.Column[ColumnID].ID);

  // toggle ascending/descending for column clicked on
  ColumnsSort[ColumnID]:= Ord(not Boolean(ColumnsSort[ColumnID]));
  List.Invalidate;

  if CurrentGame = '' then
     begin
       if (SelectedGame < Length(GamesList)) and (Length(GamesList) > 0) then
          SelectItem(SelectedGame)
       else
          SelectItem(0);
     end
  else
     SelectItem(FindGame(SelectedGame, CurrentGame));
  ColumnSorted:= List.Column[ColumnID].ID;
end;

function TFormMain.FindGame(CurrentIndex: Integer; GameDescription: String): Integer;
var
  ScanGame: Boolean;
  Loop: Integer;
begin
  if GameDescription = '' then
     begin
       Result:= 0;
       Exit;
     end;

  ScanGame:= False;
  if (CurrentIndex < Length(GamesList)) and (CurrentIndex > -1) then
     begin
       if GamesList[CurrentIndex].eDescription = GameDescription then
          Result:= CurrentIndex
       else
          ScanGame:= True;
     end
  else
     ScanGame:= True;

  if ScanGame then
     begin
       Result:= -1;
       for Loop:=0 to Length(GamesList)-1 do
       begin
         if GamesList[Loop].eDescription = GameDescription then
            begin
              Result:= Loop;
              Break;
            end;
       end;
       if Result = -1 then
          Result:= 0;
     end;
end;

function TFormMain.PopulateROMDataLine: String;
begin
  Result:= Format('%.2u', [mROMIdentification])+'¬'+mDescription+'¬'+mYear+'¬'+mManufacturer+'¬'+mSound+'¬'+mFrequency+'¬'+mSamples+'¬'+mControlType+'¬'+mVideo+'¬'+mOrientation+'¬'+mResolution+'¬'+mDriverStatus+'¬'+mSoundStatus+'¬'+mColorStatus+'¬'+mMerged+'¬'+mName+'¬'+mClone+'¬'+mCategory+'¬'+mVersionAdded+'¬'+mDriver+';';
end;

function TFormMain.SearchString(const SubString, StringLine: String): Boolean;
var
  Position: Integer;
begin
  Position:= Pos(SubString, StringLine);
  Result:= ((Position > 0) and (Copy(StringLine, Position, Length(SubString)) = SubString));
end;

procedure TFormMain.DialogOpenFile(FilterType: ShortInt; const DialogTitle: String; EditHolder: TEdit);
begin
  case FilterType of
    0: OpenDialog.Filter:= 'Executable files (*.exe)|*.exe'; // .exe
    1: OpenDialog.Filter:= 'Input files (*.inp)|*.inp'; // .inp
    2: OpenDialog.Filter:= 'Executable files (*.exe)|*.exe|Batch files (*.bat)|*.bat|All files (*.*)|*.*'; // .exe ; .bat ; *.*
    3: OpenDialog.Filter:= 'Data files (*.dat)|*.dat'; // .dat
    4: OpenDialog.Filter:= 'JPEG image file (*.jpg; *.jpeg)|*.jpg; *.jpeg'; // .jpeg image files
    5: OpenDialog.Filter:= 'PNG image file (*.png)|*.png'; // .png image files
  end;
  OpenDialog.Title:= DialogTitle;

  if OpenDialog.Execute then
     EditHolder.Text:= OpenDialog.FileName;
  SetCurrentDir(FrontendPath);
end;

function TFormMain.GetCurrentEmulatorFormat: ShortInt;
begin
  Result:= EmulatorType[ButtonExecutablesMode.Tag];
end;

function TFormMain.GetCurrentEmulatorExecutable: String;
begin
  Result:= EmulatorExecutable[ButtonExecutablesMode.Tag];
end;

procedure TFormMain.DialogSelectFolder(EditHolder: TEdit; MultipleFolders: Boolean);
var
  DialogText, Value: String;
begin
  if EditHolder.Name = 'FolderROMs' then
     DialogText:= GetLanguageText('MAME Options', 'ROMsFolderDialogText', 'Select a folder for ROMs')
  else
  if EditHolder.Name = 'FolderSamples' then
     DialogText:= GetLanguageText('MAME Options', 'SamplesFolderDialogText', 'Select a folder for Samples')
  else
  if EditHolder.Name = 'FolderINIFiles' then
     DialogText:= GetLanguageText('MAME Options', 'INIFilesFolderDialogText', 'Select a folder for games .ini files')
  else
  if EditHolder.Name = 'FolderGamesConfiguration' then
     DialogText:= GetLanguageText('MAME Options', 'GamesConfigurationFolderDialogText', 'Select a folder for Games Configuration')
  else
  if EditHolder.Name = 'FolderSaveStates' then
     DialogText:= GetLanguageText('MAME Options', 'SaveStateFolderDialogText', 'Select a folder for Save States')
  else
  if EditHolder.Name = 'FolderHighScores' then
     DialogText:= GetLanguageText('MAME Options', 'HighScoresFolderDialogText', 'Select a folder for High Scores')
  else
  if EditHolder.Name = 'FolderNVRAM' then
     DialogText:= GetLanguageText('MAME Options', 'NVRAMFolderDialogText', 'Select a folder for NVRAM')
  else
  if EditHolder.Name = 'FolderMemoryCards' then
     DialogText:= GetLanguageText('MAME Options', 'MemoryCardsFolderDialogText', 'Select a folder for Memory Cards')
  else
  if EditHolder.Name = 'FolderInputsRecording' then
     DialogText:= GetLanguageText('MAME Options', 'InputsRecordingFolderDialogText', 'Select a folder for Recording Games')
  else
  if EditHolder.Name = 'FolderArtworks' then
     DialogText:= GetLanguageText('MAME Options', 'ArtworksFolderDialogText', 'Select a folder for Artworks')
  else
  if EditHolder.Name = 'FolderDiff' then
     DialogText:= GetLanguageText('MAME Options', 'DiffFolderDialogText', 'Select a folder for HD Diff files')
  else
  if EditHolder.Name = 'FolderSnapshots' then
     DialogText:= GetLanguageText('MAME Options', 'SnapshotsFolderDialogText', 'Select a folder for Snapshots')
  else
  if EditHolder.Name = 'FolderCheats' then
     DialogText:= GetLanguageText('MAME Options', 'CheatsFolderDialogText', 'Select a folder for Cheats')
  else
  if EditHolder.Name = 'FolderKeysMapping' then
     DialogText:= GetLanguageText('MAME Options', 'KeysMappingDialogText', 'Select a folder for controllers keys .ini files')
  else
  if EditHolder.Name = 'FolderTitleSnapshots' then
     DialogText:= Format(GetLanguageText('Preferences', 'SelectFolderDialogText', 'Select a Folder for %s'),
                         [GetLanguageText('Resource', 'TitleSnapshotsDescription', 'Title Snapshots')])
  else
  if EditHolder.Name = 'FolderMarquees' then
     DialogText:= Format(GetLanguageText('Preferences', 'SelectFolderDialogText', 'Select a Folder for %s'),
                         [GetLanguageText('Resource', 'MarqueesDescription', 'Marquees')])
  else
  if EditHolder.Name = 'FolderFlyers' then
     DialogText:= Format(GetLanguageText('Preferences', 'SelectFolderDialogText', 'Select a Folder for %s'),
                         [GetLanguageText('Resource', 'FlyersDescription', 'Flyers')])
  else
  if EditHolder.Name = 'FolderCabinets' then
     DialogText:= Format(GetLanguageText('Preferences', 'SelectFolderDialogText', 'Select a Folder for %s'),
                         [GetLanguageText('Resource', 'CabinetsDesciption', 'Cabinets')])
  else
  if EditHolder.Name = 'FolderControlPanels' then
     DialogText:= Format(GetLanguageText('Preferences', 'SelectFolderDialogText', 'Select a Folder for %s'),
                         [GetLanguageText('Resource', 'ControlPanelsDescription', 'Control Panels')])
  else
  if EditHolder.Name = 'FolderControlPanelLayouts' then
     DialogText:= Format(GetLanguageText('Preferences', 'SelectFolderDialogText', 'Select a Folder for %s'),
                         [GetLanguageText('Resource', 'ControlPanelLayoutsDescription', 'Control Panel Layouts')])
  else
  if EditHolder.Name = 'FolderIcons' then
     DialogText:= Format(GetLanguageText('Preferences', 'SelectFolderDialogText', 'Select a Folder for %s'),
                         [GetLanguageText('Resource', 'IconsDescription', 'Real Icons')])
  else
  if EditHolder.Name = 'FolderGamesFAQ' then
     DialogText:= Format(GetLanguageText('Preferences', 'SelectFolderDialogText', 'Select a Folder for %s'),
                         [GetLanguageText('Resource', 'GamesFAQDescription', 'Games F.A.Q.')])
  else
  if EditHolder.Name = 'DefaultGameIconsFolder' then
     DialogText:= Format(GetLanguageText('Preferences', 'SelectFolderDialogText', 'Select a Folder for %s'),
                         [GetLanguageText('Resource', 'DefaultIconsDescription', 'Default Icons')]);

  if SelectDirectory(DialogText, '', Value) then
     begin
       case MultipleFolders of
         True:
           begin
             if EditHolder.Text <> '' then
                EditHolder.Text:= EditHolder.Text+';' + Value
             else
                EditHolder.Text:= Value;
           end;
         False:
           begin
             EditHolder.Text:= Value;
           end;
       end;
     end;
end;

procedure TFormMain.LoadIcon(ImageHolder: TImage32; ImageFileName: String);
begin
  if FileExists(FormMain.FrontendPath+'resources\images\icons\'+ImageFileName) then
     ImageHolder.Bitmap.LoadFromFile(FormMain.FrontendPath+'resources\images\icons\'+ImageFileName);
end;

// New Full Screen mode function
procedure TFormMain.WMSystemCommand(var Msg: TWMSysCommand);
begin
  case MenuFullScreen.Checked of
    True:
      begin
        if (Msg.cmdType = SC_MAXIMIZE) or (Msg.cmdType = SC_MINIMIZE) then
           Msg.Result:= -1
        else
        if Msg.cmdType = SC_CLOSE then
           Beep;
      end;
    False: inherited;
  end;
end;

function TFormMain.CheckWinXPThemes: Boolean;
begin
  with ThemeManager, ThemeServices do
  begin
    case ThemesAvailable of
      True : Result:= ThemesEnabled;
      False: Result:= False;
    end;
  end;
end;

function TFormMain.CheckFileAttributes(const FileNameString: String): Boolean;
var
  FileAttributes: Word;
begin
  FileAttributes:= FileGetAttr(FrontendPath+'\'+FileNameString);
  Result:= (FileAttributes and faReadOnly) = faReadOnly;
  //Result:= (FileAttributes and faArchive) = faArchive;
  //Result:= (FileAttributes and faSysFile) = faSysFile;
  //Result:= (FileAttributes and faHidden) = faHidden;
end;

function TFormMain.GetGameTypeDescription(GameClass, BiosType: String): String;
begin
  if GameClass = 'ClassicMR' then
     Result:= GetLanguageText('Resource', 'ClassicMasterRasterDescription', 'Classic Master Raster Games')
  else
  if GameClass = 'ClassicMV' then
     Result:= GetLanguageText('Resource', 'ClassicMasterVectorDescription', 'Classic Master Vector Games')
  else
  if GameClass = 'ClassicCR' then
     Result:= GetLanguageText('Resource', 'ClassicCloneRasterDescription', 'Classic Clone Raster Games')
  else
  if GameClass = 'ClassicCV' then
     Result:= GetLanguageText('Resource', 'ClassicCloneVectorDescription', 'Classic Clone Vector Games')
  else
  if GameClass = 'NeoGeoM' then
     Result:= GetLanguageText('Resource', 'NeoGeoMasterDescription', 'Neo Geo Master Games')
  else
  if GameClass = 'NeoGeoC' then
     Result:= GetLanguageText('Resource', 'NeoGeoCloneDescription', 'Neo Geo Clone Games')
  else
  if GameClass = 'UnClassicMR' then
     Result:= GetLanguageText('Resource', 'UnavailableClassicMasterRasterDescription', 'Unavailable Classic Master Raster Games')
  else
  if GameClass = 'UnClassicMV' then
     Result:= GetLanguageText('Resource', 'UnavailableClassicMasterVectorDescription', 'Unavailable Classic Master Vector Games')
  else
  if GameClass = 'UnClassicCR' then
     Result:= GetLanguageText('Resource', 'UnavailableClassicCloneRasterDescription', 'Unavailable Classic Clone Raster Games')
  else
  if GameClass = 'UnClassicCV' then
     Result:= GetLanguageText('Resource', 'UnavailableClassicCloneVectorDescription', 'Unavailable Classic Clone Vector Games')
  else
  if GameClass = 'UnNeoGeoM' then
     Result:= GetLanguageText('Resource', 'UnavailableNeoGeoMasterDescription', 'Unavailable Neo Geo Master Games')
  else
  if GameClass = 'UnNeoGeoC' then
     Result:= GetLanguageText('Resource', 'UnavailableNeoGeoCloneDescription', 'Unavailable Neo Geo Clone Games')
  else
  if GameClass = 'Bios' then
     begin
       if BiosType = 'ClassicBios' then
          Result:= GetLanguageText('Resource', 'ClassicBiosDescription', 'Classic Bios')
       else
       if BiosType = 'NeoGeoBios' then
          Result:= GetLanguageText('Resource', 'NeoGeoBiosDescription', 'Neo Geo Bios');
     end
  else
  if GameClass = 'UnBios' then
     begin
       if BiosType = 'UnClassicBios' then
          Result:= GetLanguageText('Resource', 'UnavailableClassicBiosDescription', 'Unavailable Classic Bios')
       else
       if BiosType = 'UnNeoGeoBios' then
          Result:= GetLanguageText('Resource', 'UnavailableNeoGeoBiosDescription', 'Unavailable Neo Geo Bios');
     end
  else
  if GameClass = 'CustomGames' then
     Result:= GetLanguageText('Resource', 'CustomGamesDescription', 'Custom Games')
  else
  if GameClass = 'UnCustomGames' then
     Result:= GetLanguageText('Resource', 'UnavailableCustomGamesDescription', 'Unavailable Custom Games')
  else
     Result:= Format(GetLanguageText('Resource', 'MiscGamesDescription', '%s Games'), [GameClass]); // this is for favorites games (which uses the filename for description)
end;

// Parental Lock procedures
procedure TFormMain.SetLockedGamesList(Mode: Boolean);
var
  Loop: Integer;
begin
  case Mode of
    True:
      begin
        ParentalLockGamesList:= THashedStringList.Create;
        ParentalLockGamesList.LoadFromFile(FrontendPath+'resources\BlockedGames.dat');
        if ParentalLockGamesList.Count > 0 then
           begin
             for Loop:=0 to ParentalLockGamesList.Count -1 do
             begin
               ParentalLockGamesList[Loop]:= DecryptData(ParentalLockGamesList[Loop]);
             end;
           end;
      end;
    False: FreeAndNil(ParentalLockGamesList);
  end;
end;
// End of Parental Lock procedures

procedure TFormMain.AppException(Sender: TObject; E: Exception);
begin
  GenerateMessage(GetLanguageText('Messages', 'ErrorTitle', 'Error'), E.Message, 2);
end;

function TFormMain.RunProcess(AppPath: String; MustWait: Boolean=FALSE;
  Visibility: Word=SW_SHOWNORMAL; RunningGame: Boolean=TRUE):DWORD;
var
  SI: TStartupInfo;
  PI: TProcessInformation;
  Proc: THandle;
  zFileName: array[0..255] of Char;
begin
  if Length(AppPath) > 254 then
     begin
       GenerateMessage(GetLanguageText('Messages', 'ErrorTitle', 'Error'),
                       Format(GetLanguageText('Messages', 'CommandLineLimitMsg',
                                              'The command line has more than 254 characters - [%u]'), [Length(AppPath)]), 2);
       Exit;
     end;
  FillChar(SI, SizeOf(SI), 0);
  SI.cb:= SizeOf(SI);
  SI.dwFlags:= StartF_UseShowWindow;
  SI.wShowWindow:= Visibility;
  StrPCopy(zFileName, AppPath);

  if not CreateProcess(nil, zFileName,
     nil, nil, False, Create_New_Console+Normal_Priority_Class, nil, nil, SI, PI) then
     begin
       GenerateMessage(GetLanguageText('Messages', 'FileExecutionErrorTitle', 'Execution Failed'),
                       Format(GetLanguageText('Messages', 'FileExecutionErrorMsg', 'Failed to excecute program "%s". Error Code %d'), [AppPath, GetLastError]), 2);
     end;

  Proc:= PI.hProcess;
  CloseHandle(PI.hThread);

  {// Original code
  if MustWait then
     begin
       if WaitForSingleObject(Proc, Infinite) <> Wait_Failed then
          GetExitCodeProcess(Proc, Result);
     end;}

  if MustWait then
     begin
       // it will wait 10 seconds and then test if MAME is still running
       // this is the first atempt to avoid EL crashing
       // and to avoid the crash of the entire system!
       // to change the wait time (in milliseconds), just change the
       // "10000" value on the "WaitForSingleObject" lines ;-)
       if WaitForSingleObject(Proc, 10000) <> Wait_Failed then
          begin
            GetExitCodeProcess(Proc, Result);
            while Result = STILL_ACTIVE do
            begin
              Application.ProcessMessages;
              if WaitForSingleObject(Proc, 10000) <> Wait_Failed then
                 GetExitCodeProcess(Proc, Result);
            end;
          end;
     end;

  CloseHandle(Proc);
{---PARAMETERS------------------------------------------------------------------
AppPath: The full path and Application Name to run ie. c:winnt notepad.exe

MustWait: true if the code must be paused until the termination of the launched
  Application. false if the code must run directly after launching the app.

AppParams: Commandline params to send to the app.

Visibility:
Can have any of the following values:
  Value Meaning
  SW_HIDE Hides the window and activates another window.
  SW_MAXIMIZE Maximizes the specified window.
  SW_MINIMIZE Minimizes the specified window and activates the next top-level
    window in the Z order.
  SW_RESTORE Activates and displays the window. If the window is minimized or
    maximized, Windows restores it to its original size and position. An
    application should specify this flag when restoring a minimized window.
  SW_SHOW Activates the window and displays it in its current size and position.
  SW_SHOWDEFAULT Sets the show state based on the SW_ flag specified in the
    STARTUPINFO structure passed to the CreateProcess function by the program
    that started the application.
  SW_SHOWMAXIMIZED Activates the window and displays it as a maximized window.
  SW_SHOWMINIMIZED Activates the window and displays it as a minimized window.
  SW_SHOWMINNOACTIVE Displays the window as a minimized window. The active
    window remains active.
  SW_SHOWNA Displays the window in its current state. The active window remains
    active.
  SW_SHOWNOACTIVATE Displays a window in its most recent size and position.
    The active window remains active.
  SW_SHOWNORMAL Activates and displays a window. If the window is minimized or
    maximized, Windows restores it to its original size and position. An
    application should specify this flag when displaying the window for the
    first time.
-------------------------------------------------------------------------------}
end;

function TFormMain.GetExeType(const FileName: String): TExeType;
var
  Signature, WinHdrOffset: Word;
  ExeFile: TFileStream;
begin
  Result:= etUnknown;
  try
    ExeFile:= TFileStream.Create(FileName, fmOpenRead or fmShareDenyNone);
    try
      ExeFile.ReadBuffer(Signature, Sizeof(Signature));
      if Signature = $5A4D then // 'MZ'
         begin
           Result:= etDOS;
           ExeFile.Seek($18, soFromBeginning);
           ExeFile.ReadBuffer(WinHdrOffset, Sizeof(WinHdrOffset));
           if WinHdrOffset >= $40 then
              begin
                ExeFile.Seek($3C, soFromBeginning);
                ExeFile.ReadBuffer(WinHdrOffset, Sizeof(WinHdrOffset));
                ExeFile.Seek(WinHdrOffset, soFrombeginning);
                ExeFile.ReadBuffer(Signature, Sizeof(Signature));
                if Signature = $454E then //'NE'
                   Result:= etWinNE
                else
                   if Signature = $4550 then //'PE'
                      Result:= etWinPE;
              end;
         end;
    finally
      ExeFile.Free;
    end;
  except

  end;
end;

function TFormMain.GetEmulatorVersion(EmulatorNumber: ShortInt; ExeFileType: String): Boolean;
var
  CommandLine: String;
  BatchFile: THashedStringList;
  Continue: Boolean;
begin
  Continue:= True;
  Result:= True;
  SetCurrentDir(FrontendPath);

  CommandLine:= SystemStr+EmulatorExecutable[EmulatorNumber]+ SystemStr+' -help > '+SystemStr+FrontendPath+'EmuVersion'+IntToStr(EmulatorNumber)+'.tmp'+SystemStr;

  if ExeFileType = 'DOS' then
     EmulatorType[EmulatorNumber]:= 2
  else
  if ExeFileType = 'Win32' then
     EmulatorType[EmulatorNumber]:= 1
  else
     begin
       Continue:= False;
       Result:= False;
     end;

  if Continue then
     begin
       case Win32Platform of
         0,1: RunProcess('command.com /c '+CommandLine, True, SW_SHOWMINIMIZED, False); //Win9x
         2  : RunProcess('cmd.exe /c '+SystemStr+CommandLine+SystemStr, True, SW_SHOWMINIMIZED, False); // Win2000 and WinXP
       end;

       if FileExists(FrontendPath+'EmuVersion'+IntToStr(EmulatorNumber)+'.tmp') then
          begin
            BatchFile:= THashedStringList.Create;
            BatchFile.LoadFromFile(FrontendPath+'EmuVersion'+IntToStr(EmulatorNumber)+'.tmp');
            case EmulatorNumber of
              1:
                begin
                  EmulatorVersion[1]:= BatchFile[0];
                  Delete(EmulatorVersion[1], (Pos(')', EmulatorVersion[1])+1), Length(EmulatorVersion[1]));
                end;
              2:
                begin
                  EmulatorVersion[2]:= BatchFile[0];
                  Delete(EmulatorVersion[2], (Pos(')', EmulatorVersion[2])+1), Length(EmulatorVersion[2]));
                end;
              3:
                begin
                  EmulatorVersion[3]:= BatchFile[0];
                  Delete(EmulatorVersion[3], (Pos(')', EmulatorVersion[3])+1), Length(EmulatorVersion[3]));
                end;
              4:
                begin
                  EmulatorVersion[4]:= BatchFile[0];
                  Delete(EmulatorVersion[4], (Pos(')', EmulatorVersion[4])+1), Length(EmulatorVersion[4]));
                end;
              5:
                begin
                  EmulatorVersion[5]:= BatchFile[0];
                  Delete(EmulatorVersion[5], (Pos(')', EmulatorVersion[5])+1), Length(EmulatorVersion[5]));
                end;
            end;
          end;
     end;

  FreeAndNil(BatchFile);
  if FileExists(FrontendPath+'EmuVersion'+IntToStr(EmulatorNumber)+'.tmp') then
     begin
       DeleteFile(FrontendPath+'EmuVersion'+IntToStr(EmulatorNumber)+'.tmp');
       Application.ProcessMessages;
    end;

  if EmulatorVersion[EmulatorNumber] = '' then
     EmulatorVersion[EmulatorNumber]:= InputBox(GetLanguageText('Messages', 'GetEmulatorVersionFailedTitle', 'Unable to get the file version!'),
                                   Format(GetLanguageText('Messages', 'GetEmulatorVersionFailedMsg', 'Enter a description for Executable %u'), [EmulatorNumber]),
                                   EmulatorVersion[EmulatorNumber]);

  {case EmulatorNumber of
    1:
      begin
        if EmulatorVersion[1] = '' then
           EmulatorVersion[1]:= InputBox(GetLanguageText('Messages', 'GetEmulatorVersionFailedTitle', 'Unable to get the file version!'),
                                      Format(GetLanguageText('Messages', 'GetEmulatorVersionFailedMsg', 'Enter a description for Executable %u'), [EmulatorNumber]),
                                      EmulatorVersion[1]);
      end;
    2:
      begin
        if EmulatorVersion[2] = '' then
           EmulatorVersion[2]:= InputBox(GetLanguageText('Messages', 'GetEmulatorVersionFailedTitle', 'Unable to get the file version!'),
                                      Format(GetLanguageText('Messages', 'GetEmulatorVersionFailedMsg', 'Enter a description for Executable %u'), [EmulatorNumber]),
                                      EmulatorVersion[2]);
      end;
    3:
      begin
        if EmulatorVersion[3] = '' then
           EmulatorVersion[3]:= InputBox(GetLanguageText('Messages', 'GetEmulatorVersionFailedTitle', 'Unable to get the file version!'),
                                      Format(GetLanguageText('Messages', 'GetEmulatorVersionFailedMsg', 'Enter a description for Executable %u'), [EmulatorNumber]),
                                      EmulatorVersion[3]);
      end;
    4:
      begin
        if EmulatorVersion[4] = '' then
           EmulatorVersion[4]:= InputBox(GetLanguageText('Messages', 'GetEmulatorVersionFailedTitle', 'Unable to get the file version!'),
                                      Format(GetLanguageText('Messages', 'GetEmulatorVersionFailedMsg', 'Enter a description for Executable %u'), [EmulatorNumber]),
                                      EmulatorVersion[4]);
      end;
    5:
      begin
        if EmulatorVersion[5] = '' then
           EmulatorVersion[5]:= InputBox(GetLanguageText('Messages', 'GetEmulatorVersionFailedTitle', 'Unable to get the file version!'),
                                      Format(GetLanguageText('Messages', 'GetEmulatorVersionFailedMsg', 'Enter a description for Executable %u'), [EmulatorNumber]),
                                      EmulatorVersion[5]);
      end;
  end;}

  LabelEmulatorVersion.Caption:= EmulatorVersion[ButtonExecutablesMode.Tag];
end;

procedure TFormMain.UpdateGeneralAppearance(FormName: TForm);
begin
  FormName.Font:= FormMain.Font;
  if (FormName.Name <> 'FormStatus') and (FormName.Name <> 'FormAbout') then
     FormName.Color:= FormMain.Color;
end;

procedure TFormMain.ReadTextViewerFont(FormID: Byte);
var
  INIFile: TIniFile;
begin
  // Read Text Viewer and DAT Viewer Font Style
  INIFile:= TIniFile.Create(FrontendPath+'EmuLoader.ini');
  case FormID of
    0:
      begin
        FormDATViewer.DATTextHolder.Font.Color:= INIFile.ReadInteger('Custom Colors', 'FileViewerFontColor', 0);
        FormDATViewer.DATTextHolder.Font.Name:= INIFile.ReadString('Custom Colors', 'FileViewerFontName', 'Courier New');
        FormDATViewer.DATTextHolder.Font.Size:= INIFile.ReadInteger('Custom Colors', 'FileViewerFontSize', 8);
        FormDATViewer.DATTextHolder.Font.Style:= TFontStyles(Byte(INIFile.ReadInteger('Custom Colors', 'FileViewerFontType', 0)));
      end;
    1:
      begin
        FormTextViewer.TextHolder.Font.Color:= INIFile.ReadInteger('Custom Colors', 'FileViewerFontColor', 0);;
        FormTextViewer.TextHolder.Font.Name:= INIFile.ReadString('Custom Colors', 'FileViewerFontName', 'Courier New');
        FormTextViewer.TextHolder.Font.Size:= INIFile.ReadInteger('Custom Colors', 'FileViewerFontSize', 8);
        FormTextViewer.TextHolder.Font.Style:= TFontStyles(Byte(INIFile.ReadInteger('Custom Colors', 'FileViewerFontType', 0)));
      end;
  end;
  FreeAndNil(INIFile);
end;

procedure TFormMain.UpdateTextViewerFont(FormID: Byte);
var
  INIFile: TIniFile;
begin
  // Read Text Viewer and DAT Viewer Font Style
  INIFile:= TIniFile.Create(FrontendPath+'EmuLoader.ini');
  case FormID of
    0:
      begin
        INIFile.WriteInteger('Custom Colors', 'FileViewerFontColor', Cardinal(FormDATViewer.DATTextHolder.Font.Color));
        INIFile.WriteString('Custom Colors', 'FileViewerFontName', FormDATViewer.DATTextHolder.Font.Name);
        INIFile.WriteInteger('Custom Colors', 'FileViewerFontSize', FormDATViewer.DATTextHolder.Font.Size);
        INIFile.WriteInteger('Custom Colors', 'FileViewerFontType', Byte(FormDATViewer.DATTextHolder.Font.Style));
      end;
    1:
      begin
        INIFile.WriteInteger('Custom Colors', 'FileViewerFontColor', Cardinal(FormTextViewer.TextHolder.Font.Color));
        INIFile.WriteString('Custom Colors', 'FileViewerFontName', FormTextViewer.TextHolder.Font.Name);
        INIFile.WriteInteger('Custom Colors', 'FileViewerFontSize', FormTextViewer.TextHolder.Font.Size);
        INIFile.WriteInteger('Custom Colors', 'FileViewerFontType', Byte(FormTextViewer.TextHolder.Font.Style));
      end;
  end;
  FreeAndNil(INIFile);
end;

procedure TFormMain.CreateIniFile;
var
  INIFile: TIniFile;
begin
  INIFile:= TIniFile.Create(FrontendPath+'EmuLoader.ini');
  INIFile.WriteInteger('Configuration', 'DefaultDatabaseBuilderExecutable', 1);
  INIFile.WriteString('Configuration', 'EmulatorName', EmulatorExecutable[1]);
  INIFile.WriteString('Configuration', 'EmulatorVersion', EmulatorVersion[1]);
  INIFile.WriteInteger('Configuration', 'EmulatorType', EmulatorType[1]);
  INIFile.WriteString('Configuration', 'EmulatorName2', EmulatorExecutable[2]);
  INIFile.WriteString('Configuration', 'EmulatorVersion2', EmulatorVersion[2]);
  INIFile.WriteInteger('Configuration', 'EmulatorType2', EmulatorType[2]);
  INIFile.WriteString('Configuration', 'EmulatorName3', EmulatorExecutable[3]);
  INIFile.WriteString('Configuration', 'EmulatorVersion3', EmulatorVersion[3]);
  INIFile.WriteInteger('Configuration', 'EmulatorType3', EmulatorType[3]);
  INIFile.WriteString('Configuration', 'EmulatorName4', EmulatorExecutable[4]);
  INIFile.WriteString('Configuration', 'EmulatorVersion4', EmulatorVersion[4]);
  INIFile.WriteInteger('Configuration', 'EmulatorType4', EmulatorType[4]);
  INIFile.WriteString('Configuration', 'EmulatorName5', EmulatorExecutable[5]);
  INIFile.WriteString('Configuration', 'EmulatorVersion5', EmulatorVersion[5]);
  INIFile.WriteInteger('Configuration', 'EmulatorType5', EmulatorType[5]);
  INIFile.WriteInteger('Configuration', 'ModeView', 3);
  INIFile.WriteInteger('Configuration', 'ListFilter', 0);
  INIFile.WriteInteger('Configuration', 'ListFilterID', 0);
  INIFile.WriteString('Configuration', 'WindowState', 'Normal');
  INIFile.WriteInteger('Configuration', 'UseExecutable', 1);
  INIFile.WriteInteger('Configuration', 'ScreenTop', (Screen.Height-460) div 2);
  INIFile.WriteInteger('Configuration', 'ScreenLeft', (Screen.Width-630) div 2);
  INIFile.WriteInteger('Configuration', 'ScreenWidthSize', 630);
  INIFile.WriteInteger('Configuration', 'ScreenHeightSize', 460);
  INIFile.WriteInteger('Configuration', 'SplitterPosition', 315);
  INIFile.WriteInteger('Configuration', 'SplitterMAMEInfoPosition', 86);
  INIFile.WriteInteger('Configuration', 'FullScreen', 0);
  INIFile.WriteInteger('Configuration', 'TextWordWrap', 0);
  INIFile.WriteInteger('Configuration', 'ParentalLock', 0);
  INIFile.WriteInteger('Configuration', 'UserProfile', 0);
  INIFile.WriteString('Configuration', 'UserProfileName', '');
  INIFile.WriteString('Configuration', 'Language', 'English');

  INIFile.WriteInteger('Preferences', 'AverageFPS', 0);
  INIFile.WriteInteger('Preferences', 'NewDescriptionFormat', 0);
  INIFile.WriteInteger('Preferences', 'RealIcons', 0);
  //INIFile.WriteInteger('Preferences', 'ShowOnlyParentIcon', 0); // will be activated later

  INIFile.WriteInteger('Preferences', 'LastGameSelected', 0);
  INIFile.WriteInteger('Preferences', 'LastColumnSorted', 0);
  INIFile.WriteInteger('Preferences', 'ColumnSortDirection', 0); // 0 - Ascending ; 1 - Descending

  INIFile.WriteInteger('Preferences', 'ShowGameSizeInfo', 1);
  INIFile.WriteInteger('Preferences', 'GameSizeType', 0);
  INIFile.WriteInteger('Preferences', 'AutoGameInformation', 0);
  INIFile.WriteInteger('Preferences', 'ShowStatistics', 0);
  INIFile.WriteInteger('Preferences', 'MinimizeFrontend', 0);
  INIFile.WriteInteger('Preferences', 'FillAllCloneColumns', 0);
  INIFile.WriteString('Preferences', 'DefaultIconsFolder', 'resources\defaulticons\gameslist');
  INIFile.WriteInteger('Preferences', 'ShowPreliminaryGamesDisabled', 1);
  INIFile.WriteInteger('Preferences', 'UseCustomOptionsDefault', 0);
  INIFile.WriteInteger('Preferences', 'UseCustomGameDescription', 0);
  INIFile.WriteInteger('Preferences', 'UseCustomGameCategory', 0);
  INIFile.WriteInteger('Preferences', 'AuditHardDiskImages', 0);

  INIFile.WriteInteger('MAME', 'UseCustomAspectRatio', 0); // OFF by default
  INIFile.WriteInteger('MAME', 'HorizontalGameAspectRatio', 14); // Default ratio is 4:3
  INIFile.WriteInteger('MAME', 'VerticalGameAspectRatio', 14); // Default ratio is 4:3
  INIFile.WriteInteger('MAME', 'UseExtraParametersMAME', 0);
  INIFile.WriteString('MAME', 'ExtraParametersMAME', '');
  INIFile.WriteString('MAME', 'ExtraParametersDOSMAME', '');

  INIFile.WriteInteger('GamesList', 'ClassicMasterRaster', 1);
  INIFile.WriteInteger('GamesList', 'ClassicMasterVector', 1);
  INIFile.WriteInteger('GamesList', 'ClassicCloneRaster', 1);
  INIFile.WriteInteger('GamesList', 'ClassicCloneVector', 1);
  INIFile.WriteInteger('GamesList', 'NeoGeoMaster', 1);
  INIFile.WriteInteger('GamesList', 'NeoGeoClone', 1);
  INIFile.WriteInteger('GamesList', 'UnavailableClassicMasterRaster', 1);
  INIFile.WriteInteger('GamesList', 'UnavailableClassicMasterVector', 1);
  INIFile.WriteInteger('GamesList', 'UnavailableClassicCloneRaster', 1);
  INIFile.WriteInteger('GamesList', 'UnavailableClassicCloneVector', 1);
  INIFile.WriteInteger('GamesList', 'UnavailableNeoGeoMaster', 1);
  INIFile.WriteInteger('GamesList', 'UnavailableNeoGeoClone', 1);
  INIFile.WriteInteger('GamesList', 'BiosClassic', 1);
  INIFile.WriteInteger('GamesList', 'BiosNeoGeo', 1);
  INIFile.WriteInteger('GamesList', 'UnavailableBiosClassic', 1);
  INIFile.WriteInteger('GamesList', 'UnavailableBiosNeoGeo', 1);
  INIFile.WriteInteger('GamesList', 'CustomGames', 1);
  INIFile.WriteInteger('GamesList', 'UnavailableCustomGames', 1);

  INIFile.WriteInteger('Favorites', 'Favorite', 0);
  INIFile.WriteString('Favorites', 'User', 'Default');

  INIFile.WriteInteger('Pictures', 'ShowPictures', 1);
  INIFile.WriteInteger('Pictures', 'ShowParentPictures', 1);
  INIFile.WriteInteger('Pictures', 'AspectRatio', 1);
  INIFile.WriteInteger('Pictures', 'SmoothPictures', 1);
  INIFile.WriteInteger('Pictures', 'PictureButton', 1); // Title Snapshot, In-Game Snapshot, Marquee, Flyer, Cabinet, Control Panel
  INIFile.WriteInteger('Pictures', 'Stretch', 1);
  INIFile.WriteInteger('Pictures', 'NewPictureNameFormat', 0);
  INIFile.WriteInteger('Pictures', 'StretchLargerPictures', 0);
  INIFile.WriteInteger('Pictures', 'CyclePictureTypes', 0);
  INIFile.WriteInteger('Pictures', 'PicturesTransparency', 0);
  INIFile.WriteInteger('Pictures', 'VirtualList', 0);

  INIFile.WriteInteger('Columns', 'Description', 300);
  INIFile.WriteInteger('Columns', 'Year', 65);
  INIFile.WriteInteger('Columns', 'Manufacturer', 150);
  INIFile.WriteInteger('Columns', 'Sound', 73);
  INIFile.WriteInteger('Columns', 'Frequency', 70);
  INIFile.WriteInteger('Columns', 'Samples', 83);
  INIFile.WriteInteger('Columns', 'ControlType', 110);
  INIFile.WriteInteger('Columns', 'Video', 70);
  INIFile.WriteInteger('Columns', 'Orientation', 100);
  INIFile.WriteInteger('Columns', 'Resolution', 95);
  INIFile.WriteInteger('Columns', 'DriverStatus', 85);
  INIFile.WriteInteger('Columns', 'SoundStatus', 85);
  INIFile.WriteInteger('Columns', 'ColorStatus', 85);
  INIFile.WriteInteger('Columns', 'Merged', 78);
  INIFile.WriteInteger('Columns', 'Name', 80);
  INIFile.WriteInteger('Columns', 'Clone', 80);
  INIFile.WriteInteger('Columns', 'Category', 180);
  INIFile.WriteInteger('Columns', 'VersionAdded', 100);
  INIFile.WriteInteger('Columns', 'Driver', 80);

  INIFile.WriteInteger('Columns', 'YearPosition', 1);
  INIFile.WriteInteger('Columns', 'ManufacturerPosition', 2);
  INIFile.WriteInteger('Columns', 'SoundPosition', 3);
  INIFile.WriteInteger('Columns', 'FrequencyPosition', 4);
  INIFile.WriteInteger('Columns', 'SamplesPosition', 5);
  INIFile.WriteInteger('Columns', 'ControlTypePosition', 6);
  INIFile.WriteInteger('Columns', 'VideoPosition', 7);
  INIFile.WriteInteger('Columns', 'OrientationPosition', 8);
  INIFile.WriteInteger('Columns', 'ResolutionPosition', 9);
  INIFile.WriteInteger('Columns', 'DriverStatusPosition', 10);
  INIFile.WriteInteger('Columns', 'SoundStatusPosition', 11);
  INIFile.WriteInteger('Columns', 'ColorStatusPosition', 12);
  INIFile.WriteInteger('Columns', 'MergedPosition', 13);
  INIFile.WriteInteger('Columns', 'NamePosition', 14);
  INIFile.WriteInteger('Columns', 'ClonePosition', 15);
  INIFile.WriteInteger('Columns', 'CategoryPosition', 16);
  INIFile.WriteInteger('Columns', 'VersionAddedPosition', 17);
  INIFile.WriteInteger('Columns', 'DriverPosition', 18);

  INIFile.WriteInteger('Columns', 'YearVisible', 1);
  INIFile.WriteInteger('Columns', 'ManufacturerVisible', 1);
  INIFile.WriteInteger('Columns', 'SoundVisible', 1);
  INIFile.WriteInteger('Columns', 'FrequencyVisible', 1);
  INIFile.WriteInteger('Columns', 'SamplesVisible', 1);
  INIFile.WriteInteger('Columns', 'ControlTypeVisible', 1);
  INIFile.WriteInteger('Columns', 'VideoVisible', 1);
  INIFile.WriteInteger('Columns', 'OrientationVisible', 1);
  INIFile.WriteInteger('Columns', 'ResolutionVisible', 1);
  INIFile.WriteInteger('Columns', 'DriverStatusVisible', 1);
  INIFile.WriteInteger('Columns', 'SoundStatusVisible', 1);
  INIFile.WriteInteger('Columns', 'ColorStatusVisible', 1);
  INIFile.WriteInteger('Columns', 'MergedVisible', 1);
  INIFile.WriteInteger('Columns', 'NameVisible', 1);
  INIFile.WriteInteger('Columns', 'CloneVisible', 1);
  INIFile.WriteInteger('Columns', 'CategoryVisible', 1);
  INIFile.WriteInteger('Columns', 'VersionAddedVisible', 1);
  INIFile.WriteInteger('Columns', 'DriverVisible', 1);


  INIFile.WriteString('Preferences', 'SplashLogoFile', 'resources\images\logo\Logo.jpg');

  INIFile.WriteInteger('X-Arcade', 'UseXArcade', 0);
  INIFile.WriteString('X-Arcade', 'ImageBackground', 'resources\images\controllers\X-Arcade.png');

  INIFile.WriteInteger('HotRod', 'UseHotRod', 0);
  INIFile.WriteString('HotRod', 'ImageBackground', 'resources\images\controllers\HotRodSE.png');

  INIFile.WriteInteger('SlikStik', 'UseSlikStik', 0);
  INIFile.WriteString('SlikStik', 'ImageBackground', 'resources\images\controllers\SlikStik.png');
  INIFile.WriteInteger('SlikStik', 'Swap2ndStick', 0);

  INIFile.WriteInteger('ExtraInfo', 'TotalPlayTime', 0);

  // Default General Font
  INIFile.WriteInteger('Appearance', 'GeneralBackgroundColor', Cardinal(TColor(clBtnFace)));
  INIFile.WriteString('Appearance', 'GeneralFontName', 'Tahoma');
  INIFile.WriteInteger('Appearance', 'GeneralFontSize', 8);
  INIFile.WriteInteger('Appearance', 'GeneralFontType', 0);

  // Default Games List Color and Font
  INIFile.WriteInteger('Appearance', 'GamesListBackgroundColor', 0);
  INIFile.WriteInteger('Appearance', 'GamesListFontColor', 16777215);
  INIFile.WriteString('Appearance', 'GamesListFontName', 'Tahoma');
  INIFile.WriteInteger('Appearance', 'GamesListFontSize', 8);
  INIFile.WriteInteger('Appearance', 'GamesListFontType', 0);

  // Default Pictures Colors
  INIFile.WriteInteger('Appearance', 'PicturesTitleSnapshotBackgroundColor', 0);
  INIFile.WriteInteger('Appearance', 'PicturesInGameSnapshotBackgroundColor', 0);
  INIFile.WriteInteger('Appearance', 'PicturesMarqueeBackgroundColor', 0);
  INIFile.WriteInteger('Appearance', 'PicturesFlyerBackgroundColor', 0);
  INIFile.WriteInteger('Appearance', 'PicturesCabinetBackgroundColor', 0);
  INIFile.WriteInteger('Appearance', 'PicturesControlPanelBackgroundColor', 16777215);
  INIFile.WriteInteger('Appearance', 'PicturesControlPanelLayoutBackgroundColor', 16777215);

  // Default Automatic Game Info Color and Font
  INIFile.WriteInteger('Appearance', 'AutomaticGameInfoBackgroundColor', Cardinal(TColor(clWindow)));
  INIFile.WriteInteger('Appearance', 'AutomaticGameInfoFontColor', 0);
  INIFile.WriteString('Appearance', 'AutomaticGameInfoFontName', 'Courier New');
  INIFile.WriteInteger('Appearance', 'AutomaticGameInfoFontSize', 8);
  INIFile.WriteInteger('Appearance', 'AutomaticGameInfoFontType', 0);

  // Default Text Viewer and DAT Viewer Font Style
  INIFile.WriteInteger('Appearance', 'FileViewerFontColor', 0);
  INIFile.WriteString('Appearance', 'FileViewerFontName', 'Courier New');
  INIFile.WriteInteger('Appearance', 'FileViewerFontSize', 8);
  INIFile.WriteInteger('Appearance', 'FileViewerFontType', 0);

  INIFile.WriteString('Folders', 'TitleSnapshotsFolder', 'title');
  INIFile.WriteString('Folders', 'MarqueesFolder', 'marquees');
  INIFile.WriteString('Folders', 'CabinetsFolder', 'cabinets');
  INIFile.WriteString('Folders', 'FlyersFolder', 'flyers');
  INIFile.WriteString('Folders', 'ControlPanelsFolder', 'cpanels');
  INIFile.WriteString('Folders', 'ControlPanelLayoutsFolder', 'cplayouts');
  INIFile.WriteString('Folders', 'IconsFolder', 'icons');
  INIFile.WriteString('Folders', 'GamesFAQFolder', 'faq');

  FreeAndNil(INIFile);
end;

function TFormMain.ReadIniFile: Boolean;
var
  INIFile: TIniFile;
  Loop: ShortInt;
begin
  Result:= True;
  INIFile:= TIniFile.Create(FrontendPath+'EmuLoader.ini');
  DefaultDatabaseBuilderExecutable:=INIFile.ReadString('Configuration', 'DefaultDatabaseBuilderExecutable', '1');
  EmulatorExecutable[1]:= INIFile.ReadString('Configuration', 'EmulatorName', '');
  EmulatorVersion[1]:= INIFile.ReadString('Configuration', 'EmulatorVersion', '');
  EmulatorType[1]:= INIFile.ReadInteger('Configuration', 'EmulatorType', EmulatorType[1]);
  EmulatorExecutable[2]:= INIFile.ReadString('Configuration', 'EmulatorName2', '');
  EmulatorVersion[2]:= INIFile.ReadString('Configuration', 'EmulatorVersion2', '');
  EmulatorType[2]:= INIFile.ReadInteger('Configuration', 'EmulatorType2', EmulatorType[2]);
  EmulatorExecutable[3]:= INIFile.ReadString('Configuration', 'EmulatorName3', '');
  EmulatorVersion[3]:= INIFile.ReadString('Configuration', 'EmulatorVersion3', '');
  EmulatorType[3]:= INIFile.ReadInteger('Configuration', 'EmulatorType3', EmulatorType[3]);
  EmulatorExecutable[4]:= INIFile.ReadString('Configuration', 'EmulatorName4', '');
  EmulatorVersion[4]:= INIFile.ReadString('Configuration', 'EmulatorVersion4', '');
  EmulatorType[4]:= INIFile.ReadInteger('Configuration', 'EmulatorType4', EmulatorType[4]);
  EmulatorExecutable[5]:= INIFile.ReadString('Configuration', 'EmulatorName5', '');
  EmulatorVersion[5]:= INIFile.ReadString('Configuration', 'EmulatorVersion5', '');
  EmulatorType[5]:= INIFile.ReadInteger('Configuration', 'EmulatorType5', EmulatorType[5]);
  LabelEmulatorVersion.Caption:= EmulatorVersion[1];

  if EmulatorExecutable[1] <> '' then
     begin
       if not FileExists(EmulatorExecutable[1]) then
          Result:= False;
     end
  else
     begin
       MenuUseExecutable1.Enabled:= False;
       ButtonUseExecutable1.Enabled:= False;
       MenuSet1stEmulatorDefaultOptions.Enabled:= False;
       MenuChange1stEmulatorDescription.Enabled:= False;
       MenuGet1stEmulatorDefaultDescription.Enabled:= False;
     end;

  if EmulatorExecutable[2] <> '' then
     begin
       if not FileExists(EmulatorExecutable[2]) then
          Result:= False;
     end
  else
     begin
       MenuUseExecutable2.Enabled:= False;
       ButtonUseExecutable2.Enabled:= False;
       MenuSet2ndEmulatorDefaultOptions.Enabled:= False;
       MenuChange2ndEmulatorDescription.Enabled:= False;
       MenuGet2ndEmulatorDefaultDescription.Enabled:= False;
     end;

  if EmulatorExecutable[3] <> '' then
     begin
       if not FileExists(EmulatorExecutable[3]) then
          Result:= False;
     end
  else
     begin
       MenuUseExecutable3.Enabled:= False;
       ButtonUseExecutable3.Enabled:= False;
       MenuSet3rdEmulatorDefaultOptions.Enabled:= False;
       MenuChange3rdEmulatorDescription.Enabled:= False;
       MenuGet3rdEmulatorDefaultDescription.Enabled:= False;
     end;

  if EmulatorExecutable[4] <> '' then
     begin
       if not FileExists(EmulatorExecutable[4]) then
          Result:= False;
     end
  else
     begin
       MenuUseExecutable4.Enabled:= False;
       ButtonUseExecutable4.Enabled:= False;
       MenuSet4thEmulatorDefaultOptions.Enabled:= False;
       MenuChange4thEmulatorDescription.Enabled:= False;
       MenuGet4thEmulatorDefaultDescription.Enabled:= False;
     end;

  if EmulatorExecutable[5] <> '' then
     begin
       if not FileExists(EmulatorExecutable[5]) then
          Result:= False;
     end
  else
     begin
       MenuUseExecutable5.Enabled:= False;
       ButtonUseExecutable5.Enabled:= False;
       MenuSet5thEmulatorDefaultOptions.Enabled:= False;
       MenuChange5thEmulatorDescription.Enabled:= False;
       MenuGet5thEmulatorDefaultDescription.Enabled:= False;
     end;

  ButtonModeView.Tag:= INIFile.ReadInteger('Configuration', 'ModeView', 3);
  ButtonGameType.Tag:= INIFile.ReadInteger('Configuration', 'ListFilter', 0);
  case ButtonGameType.Tag of
    //0: PopupAllGames.Checked:= True;
    1: PopupClassic.Checked:= True;
    2: PopupNeoGeo.Checked:= True;
    3: PopupOriginal.Checked:= True;
    4: PopupClone.Checked:= True;
    5: PopupRaster.Checked:= True;
    6: PopupVector.Checked:= True;
    7: PopupCustomGames.Checked:= True;
  end;

  ButtonGameFilters.Tag:= INIFile.ReadInteger('Configuration', 'ListFilterID', 0);
  case ButtonGameFilters.Tag of
    //0: ButtonShowAllGames.Down:=True;
    1: begin ButtonShowAvailableGames.Checked:= True; ButtonGameFilters.ImageIndex:= 66; end;
    2: begin ButtonShowUnavailableGames.Checked:= True; ButtonGameFilters.ImageIndex:= 67; end;
  end;

  if INIFile.ReadString('Configuration', 'WindowState', 'Normal') = 'Maximized' then
     FormMain.Tag:= 1;

  ButtonExecutablesMode.Tag:= INIFile.ReadInteger('Configuration', 'UseExecutable', 1);
  case ButtonExecutablesMode.Tag of
    1: MenuUseExecutable1.OnClick(Self);
    2: MenuUseExecutable2.Click;
    3: MenuUseExecutable3.Click;
    4: MenuUseExecutable4.Click;
    5: MenuUseExecutable5.Click;
  end;

  FormMain.Width:= INIFile.ReadInteger('Configuration', 'ScreenWidthSize', 630);
  FormMain.Height:= INIFile.ReadInteger('Configuration', 'ScreenHeightSize', 460);
  PanelPictures.Width:= INIFile.ReadInteger('Configuration', 'SplitterPosition', 315);
  PanelmameinfoDAT.Height:= INIFile.ReadInteger('Configuration', 'SplitterMAMEInfoPosition', 86);

  FormMain.Left:= INIFile.ReadInteger('Configuration', 'ScreenLeft', (Screen.Width shr 1)-(Width shr 1)-1);
  FormMain.Top:= INIFile.ReadInteger('Configuration', 'ScreenTop', (Screen.Height shr 1)-(Height shr 1)-1);
  MenuFullScreen.Tag:= INIFile.ReadInteger('Configuration', 'FullScreen', 0);

  TextWordWrap:= Boolean(INIFile.ReadInteger('Configuration', 'TextWordWrap', 0));

  MenuParentalLock.Tag:= INIFile.ReadInteger('Configuration', 'ParentalLock', 0);

  ActiveUserProfileDescription:= INIFile.ReadString('Configuration', 'UserProfileName', '');
  MenuUserProfile.Tag:= INIFile.ReadInteger('Configuration', 'UserProfile', 0);

  //if INIFile.ReadInteger('Preferences','ShowOnlyParentIcon', 0) = 1 then
  //   MenuShowOnlyParentIcon.Click;

  MenuRealIcons.Tag:= INIFile.ReadInteger('Preferences', 'RealIcons', 0);

  FrontendLanguage:= INIFile.ReadString('Configuration', 'Language', 'English');
  LabelPictureNumberValue:= '%.3d of %.3d pictures';
  if FrontendLanguage <> 'English' then
     SetMainLanguage;

  // read General Font Type
  FormMain.Font.Name:= INIFile.ReadString('Appearance', 'GeneralFontName', 'Tahoma');
  FormMain.Font.Size:= INIFile.ReadInteger('Appearance', 'GeneralFontSize', 8);
  FormMain.Font.Style:= TFontStyles(Byte(INIFile.ReadInteger('Appearance', 'GeneralFontType', 0)));

  // read Games Font Type and Color
  List.Font.Color:= INIFile.ReadInteger('Appearance', 'GamesListFontColor', 16777215);
  List.Font.Name:= INIFile.ReadString('Appearance', 'GamesListFontName', 'Tahoma');
  List.Font.Size:= INIFile.ReadInteger('Appearance', 'GamesListFontSize', 8);
  List.Font.Style:= TFontStyles(Byte(INIFile.ReadInteger('Appearance', 'GamesListFontType', 0)));

  with FormPreferences do
  begin
    GeneralBackgroundColor.Selected:= INIFile.ReadInteger('Appearance', 'GeneralBackgroundColor', Cardinal(TColor(clBtnFace)));
    GeneralBackgroundColor.OnSelect(Self);

    // read Games color
    ListBackgroundColor.Selected:= INIFile.ReadInteger('Appearance', 'GamesListBackgroundColor', 0);
    ListBackgroundColor.OnSelect(Self);

    // read all Pictures colors
    TitleSnapshotPicturesBackgroundColor.Selected:= INIFile.ReadInteger('Appearance', 'PicturesTitleSnapshotBackgroundColor', 0);
    InGameSnapshotPicturesBackgroundColor.Selected:= INIFile.ReadInteger('Appearance', 'PicturesInGameSnapshotBackgroundColor', 0);
    MarqueePicturesBackgroundColor.Selected:= INIFile.ReadInteger('Appearance', 'PicturesMarqueeBackgroundColor', 0);
    FlyerPicturesBackgroundColor.Selected:= INIFile.ReadInteger('Appearance', 'PicturesFlyerBackgroundColor', 0);
    CabinetPicturesBackgroundColor.Selected:= INIFile.ReadInteger('Appearance', 'PicturesCabinetBackgroundColor', 0);
    ControlPanelPicturesBackgroundColor.Selected:= INIFile.ReadInteger('Appearance', 'PicturesControlPanelBackgroundColor', 16777215);
    ControlPanelLayoutPicturesBackgroundColor.Selected:= INIFile.ReadInteger('Appearance', 'PicturesControlPanelLayoutBackgroundColor', 16777215);

    // read all Automatic Game Info Color and Font Type
    AutomaticGameInformationBackgroundColor.Selected:= INIFile.ReadInteger('Appearance', 'AutomaticGameInfoBackgroundColor', Cardinal(TColor(clWindow)));
    AutomaticGameInformationBackgroundColor.OnSelect(Self);
    MAMEInfoTextHolder.Font.Color:= INIFile.ReadInteger('Appearance', 'AutomaticGameInfoFontColor', 0);
    MAMEInfoTextHolder.Font.Name:= INIFile.ReadString('Appearance', 'AutomaticGameInfoFontName', 'Courier New');
    MAMEInfoTextHolder.Font.Size:= INIFile.ReadInteger('Appearance', 'AutomaticGameInfoFontSize', 8);
    MAMEInfoTextHolder.Font.Style:= TFontStyles(Byte(INIFile.ReadInteger('Appearance', 'AutomaticGameInfoFontType', 0)));

    UpdateGeneralAppearance(FormMain);
    UpdateGeneralAppearance(FormPreferences);
    UpdateGeneralAppearance(FormStatus);

    AverageFPS.Checked:= Boolean(INIFile.ReadInteger('Preferences', 'AverageFPS', 0));
    NewDescriptionFormat.Checked:= Boolean(INIFile.ReadInteger('Preferences', 'NewDescriptionFormat', 0));

    SelectedGame:= INIFile.ReadInteger('Preferences', 'LastGameSelected', 0);
    ColumnSorted:= INIFile.ReadInteger('Preferences', 'LastColumnSorted', 0);
    ColumnsSort[ColumnSorted]:= INIFile.ReadInteger('Preferences', 'ColumnSortDirection', 0); // 0 - Ascending ; 1 - Descending

    ShowGameSize.Checked:= Boolean(INIFile.ReadInteger('Preferences', 'ShowGameSizeInfo', 1));
    StatusBarGameSize.Caption:= '';

    case INIFile.ReadInteger('Preferences', 'GameSizeType', 0) of
      1: ShowGameSizeBytes.Checked:= True;
      2: ShowGameSizeCompressedZip.Checked:= True;
    end;

    ShowStatistics.Checked:= Boolean(INIFile.ReadInteger('Preferences', 'ShowStatistics', 0));
    MinimizeFrontend.Checked:= Boolean(INIFile.ReadInteger('Preferences', 'MinimizeFrontend', 0));
    FillAllCloneColumns.Checked:= Boolean(INIFile.ReadInteger('Preferences', 'FillAllCloneColumns', 0));
    DefaultGameIconsFolder.Text:= INIFile.ReadString('Preferences', 'DefaultIconsFolder', 'resources\defaulticons\gameslist');
    ShowPreliminaryGamesDisabled.Checked:= Boolean(INIFile.ReadInteger('Preferences', 'ShowPreliminaryGamesDisabled', 1));
    UseCustomOptionsDefault.Checked:= Boolean(INIFile.ReadInteger('Preferences', 'UseCustomOptionsDefault', 0));
    UseCustomGameDescription.Checked:= Boolean(INIFile.ReadInteger('Preferences', 'UseCustomGameDescription', 0));
    UseCustomGameCategory.Checked:= Boolean(INIFile.ReadInteger('Preferences', 'UseCustomGameCategory', 0));
    AuditCHDFiles.Checked:= Boolean(INIFile.ReadInteger('Preferences', 'AuditHardDiskImages', 0));

    // M.A.M.E. Tab
    // Emu Loader Folders
    FolderTitleSnapshots.Text:= INIFile.ReadString('Folders', 'TitleSnapshotsFolder', 'title');
    FolderMarquees.Text:= INIFile.ReadString('Folders', 'MarqueesFolder', 'marquees');
    FolderCabinets.Text:= INIFile.ReadString('Folders', 'CabinetsFolder', 'cabinets');
    FolderFlyers.Text:= INIFile.ReadString('Folders', 'FlyersFolder', 'flyers');
    FolderControlPanels.Text:= INIFile.ReadString('Folders', 'ControlPanelsFolder', 'cpanels');
    FolderControlPanelLayouts.Text:= INIFile.ReadString('Folders', 'ControlPanelLayoutsFolder', 'cplayouts');
    FolderIcons.Text:= INIFile.ReadString('Folders', 'IconsFolder', 'icons');
    FolderGamesFAQ.Text:= INIFile.ReadString('Folders', 'GamesFAQFolder', 'faq');

    // M.A.M.E. Extra Options
    UseCustomAspectRatio.Checked:= Boolean(INIFile.ReadInteger('MAME', 'UseCustomAspectRatio', 0)); // OFF by default
    HorizontalAspectRatio.Position:= INIFile.ReadInteger('MAME', 'HorizontalGameAspectRatio', 14); // Default ratio is 4:3
    VerticalAspectRatio.Position:= INIFile.ReadInteger('MAME', 'VerticalGameAspectRatio', 14); // Default ratio is 4:3

    UseExtraParametersMAME.Checked:= Boolean(INIFile.ReadInteger('MAME', 'UseExtraParametersMAME', 0)); // OFF by default
    ExtraParametersMAME.Text:= INIFile.ReadString('MAME', 'ExtraParametersMAME', '');
    ExtraParametersDOSMAME.Text:= INIFile.ReadString('MAME', 'ExtraParametersDOSMAME', '');
  end;

  MenuAutomaticGameInformation.Tag:= INIFile.ReadInteger('Preferences', 'AutoGameInformation', 0);

  ClassicMR:= Boolean(INIFile.ReadInteger('GamesList', 'ClassicMasterRaster', 1));
  ClassicMV:= Boolean(INIFile.ReadInteger('GamesList', 'ClassicMasterVector', 1));
  ClassicCR:= Boolean(INIFile.ReadInteger('GamesList', 'ClassicCloneRaster', 1));
  ClassicCV:= Boolean(INIFile.ReadInteger('GamesList', 'ClassicCloneVector', 1));
  NeoGeoM:= Boolean(INIFile.ReadInteger('GamesList', 'NeoGeoMaster', 1));
  NeoGeoC:= Boolean(INIFile.ReadInteger('GamesList', 'NeoGeoClone', 1));
  UnavailableClassicMR:= Boolean(INIFile.ReadInteger('GamesList', 'UnavailableClassicMasterRaster', 1));
  UnavailableClassicMV:= Boolean(INIFile.ReadInteger('GamesList', 'UnavailableClassicMasterVector', 1));
  UnavailableClassicCR:= Boolean(INIFile.ReadInteger('GamesList', 'UnavailableClassicCloneRaster', 1));
  UnavailableClassicCV:= Boolean(INIFile.ReadInteger('GamesList', 'UnavailableClassicCloneVector', 1));
  UnavailableNeoGeoM:= Boolean(INIFile.ReadInteger('GamesList', 'UnavailableNeoGeoMaster', 1));
  UnavailableNeoGeoC:= Boolean(INIFile.ReadInteger('GamesList', 'UnavailableNeoGeoClone', 1));
  BiosClassic:= Boolean(INIFile.ReadInteger('GamesList', 'BiosClassic', 1));
  BiosNeoGeo:= Boolean(INIFile.ReadInteger('GamesList', 'BiosNeoGeo', 1));
  UnavailableBiosClassic:= Boolean(INIFile.ReadInteger('GamesList', 'UnavailableBiosClassic', 1));
  UnavailableBiosNeoGeo:= Boolean(INIFile.ReadInteger('GamesList', 'UnavailableBiosNeoGeo', 1));
  CustomGames:= Boolean(INIFile.ReadInteger('GamesList', 'CustomGames', 1));
  UnavailableCustomGames:= Boolean(INIFile.ReadInteger('GamesList', 'UnavailableCustomGames', 1));

  FavoriteUser:= INIFile.ReadString('Favorites', 'User', 'Default');
  StatusBarFavoriteUser.Caption:= Format(GetLanguageText('Main', 'StatusBarFavoriteUser', 'Favorite User: %s'), [FavoriteUser]);

  // Title Snapshot, In-Game Snapshot, Marquee, Flyer, Cabinet, Control Panel, Control Panel Layout
  ButtonPicturesModeView.Tag:= INIFile.ReadInteger('Pictures', 'PictureButton', 1);
  case ButtonPicturesModeView.Tag of
    0:
      begin
        MenuShowTitleSnapshot.Click;
        FormPreferences.TitleSnapshotPicturesBackgroundColor.OnSelect(Self);
      end;
    1:
      begin
        MenuShowInGameSnapShot.Checked:= False;
        MenuShowInGameSnapshot.Click;
        FormPreferences.InGameSnapshotPicturesBackgroundColor.OnSelect(Self);
      end;
    2:
      begin
        MenuShowMarquee.Click;
        FormPreferences.MarqueePicturesBackgroundColor.OnSelect(Self);
      end;
    3:
      begin
        MenuShowFlyer.Click;
        FormPreferences.FlyerPicturesBackgroundColor.OnSelect(Self);
      end;
    4:
      begin
        MenuShowCabinet.Click;
        FormPreferences.CabinetPicturesBackgroundColor.OnSelect(Self);
      end;
    5:
      begin
        MenuShowControlPanel.Click;
        FormPreferences.ControlPanelPicturesBackgroundColor.OnSelect(Self);
      end;
    6:
      begin
        MenuShowControlPanelLayout.Click;
        FormPreferences.ControlPanelLayoutPicturesBackgroundColor.OnSelect(Self);
      end;
  end;

  with FormPreferences do
  begin
    ButtonShowFavorite.Down:= Boolean(INIFile.ReadInteger('Favorites', 'Favorite', 0));
    ButtonShowFavorite.Tag:= Ord(ButtonShowFavorite.Down);

    StretchPicture.Tag:= INIFile.ReadInteger('Pictures', 'Stretch', 1);
    AspectRatio.Checked:= Boolean(INIFile.ReadInteger('Pictures', 'AspectRatio', 1));
    SmoothPictures.Checked:= Boolean(INIFile.ReadInteger('Pictures', 'SmoothPictures', 1));
    ShowParentPictures.Checked:= Boolean(INIFile.ReadInteger('Pictures', 'ShowParentPictures', 1));
    NewPictureNameFormat.Checked:= Boolean(INIFile.ReadInteger('Pictures', 'NewPictureNameFormat', 0));
    StretchLargerPictures.Tag:= INIFile.ReadInteger('Pictures', 'StretchLargerPictures', 0);
    CyclePictureTypes.Checked:= Boolean(INIFile.ReadInteger('Pictures', 'CyclePictureTypes', 0));
    PicturesTransparency.Checked:= Boolean(INIFile.ReadInteger('Pictures', 'PicturesTransparency', 0));
    PicturesVirtualList.Checked:= Boolean(INIFile.ReadInteger('Pictures', 'VirtualList', 0));
  end;

  if not Boolean(INIFile.ReadInteger('Pictures', 'ShowPictures', 1)) then
     MenuShowPictures.Click;

  List.Items.BeginUpdate;
  SetColumnPosition(1, INIFile.ReadInteger('Columns', 'YearPosition', 1), False);
  SetColumnPosition(2, INIFile.ReadInteger('Columns', 'ManufacturerPosition', 2), False);
  SetColumnPosition(3, INIFile.ReadInteger('Columns', 'SoundPosition', 3), False);
  SetColumnPosition(4, INIFile.ReadInteger('Columns', 'FrequencyPosition', 4), False);
  SetColumnPosition(5, INIFile.ReadInteger('Columns', 'SamplesPosition', 5), False);
  SetColumnPosition(6, INIFile.ReadInteger('Columns', 'ControlTypePosition', 6), False);
  SetColumnPosition(7, INIFile.ReadInteger('Columns', 'VideoPosition', 7), False);
  SetColumnPosition(8, INIFile.ReadInteger('Columns', 'OrientationPosition', 8), False);
  SetColumnPosition(9, INIFile.ReadInteger('Columns', 'ResolutionPosition', 9), False);
  SetColumnPosition(10, INIFile.ReadInteger('Columns', 'DriverStatusPosition', 10), False);
  SetColumnPosition(11, INIFile.ReadInteger('Columns', 'SoundStatusPosition', 11), False);
  SetColumnPosition(12, INIFile.ReadInteger('Columns', 'ColorStatusPosition', 12), False);
  SetColumnPosition(13, INIFile.ReadInteger('Columns', 'MergedPosition', 13), False);
  SetColumnPosition(14, INIFile.ReadInteger('Columns', 'NamePosition', 14), False);
  SetColumnPosition(15, INIFile.ReadInteger('Columns', 'ClonePosition', 15), False);
  SetColumnPosition(16, INIFile.ReadInteger('Columns', 'CategoryPosition', 16), False);
  SetColumnPosition(17, INIFile.ReadInteger('Columns', 'VersionAddedPosition', 17), False);
  SetColumnPosition(18, INIFile.ReadInteger('Columns', 'DriverPosition', 18), False);

  List.Columns[GetColumnIndex(0)].Width:= INIFile.ReadInteger('Columns', 'Description', 300);

  case INIFile.ReadInteger('Columns', 'YearVisible', 1) of
    1: List.Columns[GetColumnIndex(1)].Width:= INIFile.ReadInteger('Columns', 'Year', 65);
    0: List.Columns[GetColumnIndex(1)].Tag:= 0;
  end;

  case INIFile.ReadInteger('Columns', 'ManufacturerVisible', 1) of
    1: List.Columns[GetColumnIndex(2)].Width:= INIFile.ReadInteger('Columns', 'Manufacturer', 150);
    0: List.Columns[GetColumnIndex(2)].Tag:= 0;
  end;

  case INIFile.ReadInteger('Columns', 'SoundVisible', 1) of
    1: List.Columns[GetColumnIndex(3)].Width:= INIFile.ReadInteger('Columns', 'Sound', 73);
    0: List.Columns[GetColumnIndex(3)].Tag:= 0;
  end;

  case INIFile.ReadInteger('Columns', 'FrequencyVisible', 1) of
    1: List.Columns[GetColumnIndex(4)].Width:= INIFile.ReadInteger('Columns', 'Frequency', 70);
    0: List.Columns[GetColumnIndex(4)].Tag:= 0;
  end;

  case INIFile.ReadInteger('Columns', 'SamplesVisible', 1) of
    1: List.Columns[GetColumnIndex(5)].Width:= INIFile.ReadInteger('Columns', 'Samples', 83);
    0: List.Columns[GetColumnIndex(5)].Tag:= 0;
  end;

  case INIFile.ReadInteger('Columns', 'ControlTypeVisible', 1) of
    1: List.Columns[GetColumnIndex(6)].Width:= INIFile.ReadInteger('Columns', 'ControlType', 110);
    0: List.Columns[GetColumnIndex(6)].Tag:= 0;
  end;

  case INIFile.ReadInteger('Columns', 'VideoVisible', 1) of
    1: List.Columns[GetColumnIndex(7)].Width:= INIFile.ReadInteger('Columns', 'Video', 70);
    0: List.Columns[GetColumnIndex(7)].Tag:= 0;
  end;

  case INIFile.ReadInteger('Columns', 'OrientationVisible', 1) of
    1: List.Columns[GetColumnIndex(8)].Width:= INIFile.ReadInteger('Columns', 'Orientation', 100);
    0: List.Columns[GetColumnIndex(8)].Tag:= 0;
  end;

  case INIFile.ReadInteger('Columns', 'ResolutionVisible', 1) of
    1: List.Columns[GetColumnIndex(9)].Width:= INIFile.ReadInteger('Columns', 'Resolution', 95);
    0: List.Columns[GetColumnIndex(9)].Tag:= 0;
  end;

  case INIFile.ReadInteger('Columns', 'DriverStatusVisible', 1) of
    1: List.Columns[GetColumnIndex(10)].Width:= INIFile.ReadInteger('Columns', 'DriverStatus', 85);
    0: List.Columns[GetColumnIndex(10)].Tag:= 0;
  end;

  case INIFile.ReadInteger('Columns', 'SoundStatusVisible', 1) of
    1: List.Columns[GetColumnIndex(11)].Width:= INIFile.ReadInteger('Columns', 'SoundStatus', 85);
    0: List.Columns[GetColumnIndex(11)].Tag:= 0;
  end;

  case INIFile.ReadInteger('Columns', 'ColorStatusVisible', 1) of
    1: List.Columns[GetColumnIndex(12)].Width:= INIFile.ReadInteger('Columns', 'ColorStatus', 85);
    0: List.Columns[GetColumnIndex(12)].Tag:= 0;
  end;

  case INIFile.ReadInteger('Columns', 'MergedVisible', 1) of
    1: List.Columns[GetColumnIndex(13)].Width:= INIFile.ReadInteger('Columns', 'Merged', 78);
    0: List.Columns[GetColumnIndex(13)].Tag:= 0;
  end;

  case INIFile.ReadInteger('Columns', 'NameVisible', 1) of
    1: List.Columns[GetColumnIndex(14)].Width:= INIFile.ReadInteger('Columns', 'Name', 80);
    0: List.Columns[GetColumnIndex(14)].Tag:= 0;
  end;

  case INIFile.ReadInteger('Columns', 'CloneVisible', 1) of
    1: List.Columns[GetColumnIndex(15)].Width:= INIFile.ReadInteger('Columns', 'Clone', 80);
    0: List.Columns[GetColumnIndex(15)].Tag:= 0;
  end;

  case INIFile.ReadInteger('Columns', 'CategoryVisible', 1) of
    1: List.Columns[GetColumnIndex(16)].Width:= INIFile.ReadInteger('Columns', 'Category', 180);
    0: List.Columns[GetColumnIndex(16)].Tag:= 0;
  end;

  case INIFile.ReadInteger('Columns', 'VersionAddedVisible', 1) of
    1: List.Columns[GetColumnIndex(17)].Width:= INIFile.ReadInteger('Columns', 'VersionAdded', 100);
    0: List.Columns[GetColumnIndex(17)].Tag:= 0;
  end;

  case INIFile.ReadInteger('Columns', 'DriverVisible', 1) of
    1: List.Columns[GetColumnIndex(18)].Width:= INIFile.ReadInteger('Columns', 'Driver', 80);
    0: List.Columns[GetColumnIndex(18)].Tag:= 0;
  end;

  for Loop:=1 to List.Columns.Count-1 do
  begin
    if List.Columns[Loop].Tag = 0 then
       List.Columns[Loop].Width:= 0;
  end;
  List.Items.EndUpdate;

  with FormPreferences do
  begin
    XArcade.Checked:= Boolean(INIFile.ReadInteger('X-Arcade', 'UseXArcade', 0));
    XArcadeImageFile.Text:= INIFile.ReadString('X-Arcade', 'ImageBackground', 'resources\images\controllers\X-Arcade.png');

    if not XArcade.Checked then
       HotRod.Checked:= Boolean(INIFile.ReadInteger('HotRod', 'UseHotRod', 0));
    HotRodSEImageFile.Text:= INIFile.ReadString('HotRod', 'ImageBackground', 'resources\images\controllers\HotRodSE.png');

    if (not XArcade.Checked) and (not HotRod.Checked) then
       SlikStik.Checked:= Boolean(INIFile.ReadInteger('SlikStik', 'UseSlikStik', 0));
    SlikStikImageFile.Text:= INIFile.ReadString('SlikStik', 'ImageBackground', 'resources\images\controllers\SlikStik.png');
    SlikStikSwap2ndPlayerStick.Checked:= Boolean(INIFile.ReadInteger('SlikStik', 'Swap2ndStick', 0));

    SplashLogo.Text:= INIFile.ReadString('Preferences', 'SplashLogoFile', 'resources\images\logo\Logo.jpg');
    if SplashLogo.Text = '' then
       SplashLogo.Text:= 'resources\images\logo\Logo.jpg';
  end;
  LogoFileName:= FormPreferences.SplashLogo.Text;
  FormStatus.OnActivate(Self);

  TotalPlayTime:= INIFile.ReadString('ExtraInfo', 'TotalPlayTime', '0');
  FreeAndNil(INIFile);
  CheckPlayTime;
end;

procedure TFormMain.UpdateIniFile;
var
  INIFile: TIniFile;
begin
  INIFile:= TIniFile.Create(FrontendPath+'EmuLoader.ini');
  INIFile.WriteString('Configuration', 'DefaultDatabaseBuilderExecutable', DefaultDatabaseBuilderExecutable);
  INIFile.WriteString('Configuration', 'EmulatorName', EmulatorExecutable[1]);
  INIFile.WriteString('Configuration', 'EmulatorVersion', EmulatorVersion[1]);
  INIFile.WriteInteger('Configuration', 'EmulatorType', EmulatorType[1]);
  INIFile.WriteString('Configuration', 'EmulatorName2', EmulatorExecutable[2]);
  INIFile.WriteString('Configuration', 'EmulatorVersion2', EmulatorVersion[2]);
  INIFile.WriteInteger('Configuration', 'EmulatorType2', EmulatorType[2]);
  INIFile.WriteString('Configuration', 'EmulatorName3', EmulatorExecutable[3]);
  INIFile.WriteString('Configuration', 'EmulatorVersion3', EmulatorVersion[3]);
  INIFile.WriteInteger('Configuration', 'EmulatorType3', EmulatorType[3]);
  INIFile.WriteString('Configuration', 'EmulatorName4', EmulatorExecutable[4]);
  INIFile.WriteString('Configuration', 'EmulatorVersion4', EmulatorVersion[4]);
  INIFile.WriteInteger('Configuration', 'EmulatorType4', EmulatorType[4]);
  INIFile.WriteString('Configuration', 'EmulatorName5', EmulatorExecutable[5]);
  INIFile.WriteString('Configuration', 'EmulatorVersion5', EmulatorVersion[5]);
  INIFile.WriteInteger('Configuration', 'EmulatorType5', EmulatorType[5]);

  INIFile.WriteInteger('Configuration', 'ModeView', ButtonModeView.Tag);
  INIFile.WriteInteger('Configuration', 'ListFilter', ButtonGameType.Tag);
  INIFile.WriteInteger('Configuration', 'ListFilterID', ButtonGameFilters.Tag);

  case FormMain.WindowState of
    wsNormal   : INIFile.WriteString('Configuration', 'WindowState', 'Normal');
    wsMaximized: INIFile.WriteString('Configuration', 'WindowState', 'Maximized');
    else
      INIFile.WriteString('Configuration', 'WindowState', 'Normal');
  end;

  INIFile.WriteInteger('Configuration', 'UseExecutable', ButtonExecutablesMode.Tag);

  if ((FormMain.WindowState <> wsMaximized) and (not MenuFullScreen.Checked)) then
     begin
       INIFile.WriteInteger('Configuration', 'ScreenTop', FormMain.Top);
       INIFile.WriteInteger('Configuration', 'ScreenLeft', FormMain.Left);
       INIFile.WriteInteger('Configuration', 'ScreenWidthSize', FormMain.Width);
       INIFile.WriteInteger('Configuration', 'ScreenHeightSize', FormMain.Height);
     end;
  INIFile.WriteInteger('Configuration', 'SplitterPosition', PanelPictures.Width);
  INIFile.WriteInteger('Configuration', 'SplitterMAMEInfoPosition', PanelmameinfoDAT.Height);
  INIFile.WriteInteger('Configuration', 'FullScreen', Ord(MenuFullScreen.Checked));

  INIFile.WriteInteger('Configuration', 'TextWordWrap', Ord(TextWordWrap));

  INIFile.WriteInteger('Configuration', 'ParentalLock', Ord(MenuParentalLock.Checked));
  INIFile.WriteInteger('Configuration', 'UserProfile', Ord(MenuUserProfile.Checked));
  case MenuUserProfile.Checked of
    True : INIFile.WriteString('Configuration', 'UserProfileName', ActiveUserProfileDescription);
    False: INIFile.WriteString('Configuration', 'UserProfileName', '');
  end;

  INIFile.WriteString('Configuration', 'Language', FrontendLanguage);

  INIFile.WriteInteger('Preferences', 'RealIcons', Ord(MenuRealIcons.Checked));
  //INIFile.WriteInteger('Preferences', 'ShowOnlyParentIcon', Ord(MenuShowOnlyParentIcon.Checked));

  // update General Font Style
  INIFile.WriteString('Appearance', 'GeneralFontName', FormMain.Font.Name);
  INIFile.WriteInteger('Appearance', 'GeneralFontSize', FormMain.Font.Size);
  INIFile.WriteInteger('Appearance', 'GeneralFontType', Byte(FormMain.Font.Style));

  // update Games List Font Style
  INIFile.WriteInteger('Appearance', 'GamesListFontColor', Cardinal(FormMain.List.Font.Color));
  INIFile.WriteString('Appearance', 'GamesListFontName', FormMain.List.Font.Name);
  INIFile.WriteInteger('Appearance', 'GamesListFontSize', FormMain.List.Font.Size);
  INIFile.WriteInteger('Appearance', 'GamesListFontType', Byte(FormMain.List.Font.Style));

  with FormPreferences do
  begin
    INIFile.WriteInteger('Appearance', 'GeneralBackgroundColor', Cardinal(GeneralBackgroundColor.Selected));

    // update all Games List Custom colors
    INIFile.WriteInteger('Appearance', 'GamesListBackgroundColor', Cardinal(ListBackgroundColor.Selected));

    // update all Pictures Custom colors
    INIFile.WriteInteger('Appearance', 'PicturesTitleSnapshotBackgroundColor', Cardinal(TitleSnapshotPicturesBackgroundColor.Selected));
    INIFile.WriteInteger('Appearance', 'PicturesInGameSnapshotBackgroundColor', Cardinal(InGameSnapshotPicturesBackgroundColor.Selected));
    INIFile.WriteInteger('Appearance', 'PicturesMarqueeBackgroundColor', Cardinal(MarqueePicturesBackgroundColor.Selected));
    INIFile.WriteInteger('Appearance', 'PicturesFlyerBackgroundColor', Cardinal(FlyerPicturesBackgroundColor.Selected));
    INIFile.WriteInteger('Appearance', 'PicturesCabinetBackgroundColor', Cardinal(CabinetPicturesBackgroundColor.Selected));
    INIFile.WriteInteger('Appearance', 'PicturesControlPanelBackgroundColor', Cardinal(ControlPanelPicturesBackgroundColor.Selected));
    INIFile.WriteInteger('Appearance', 'PicturesControlPanelLayoutBackgroundColor', Cardinal(ControlPanelLayoutPicturesBackgroundColor.Selected));

    // update all Automatic Game Info Color and Font Type
    INIFile.WriteInteger('Appearance', 'AutomaticGameInfoBackgroundColor', Cardinal(AutomaticGameInformationBackgroundColor.Selected));
    INIFile.WriteInteger('Appearance', 'AutomaticGameInfoFontColor', Cardinal(MAMEInfoTextHolder.Font.Color));
    INIFile.WriteString('Appearance', 'AutomaticGameInfoFontName', MAMEInfoTextHolder.Font.Name);
    INIFile.WriteInteger('Appearance', 'AutomaticGameInfoFontSize', MAMEInfoTextHolder.Font.Size);
    INIFile.WriteInteger('Appearance', 'AutomaticGameInfoFontType', Byte(MAMEInfoTextHolder.Font.Style));

    INIFile.WriteInteger('Preferences', 'AverageFPS', Ord(AverageFPS.Checked));
    INIFile.WriteInteger('Preferences', 'NewDescriptionFormat', Ord(NewDescriptionFormat.Checked));

    INIFile.WriteInteger('Preferences', 'LastGameSelected', SelectedGame);
    INIFile.WriteInteger('Preferences', 'LastColumnSorted', ColumnSorted);
    case List.Column[ColumnSorted].Tag of
      0: INIFile.WriteInteger('Preferences', 'ColumnSortDirection', 1);
      1: INIFile.WriteInteger('Preferences', 'ColumnSortDirection', 0);
    end;

    INIFile.WriteInteger('Preferences', 'ShowGameSizeInfo', Ord(ShowGameSize.Checked));

    if ShowGameSizeBits.Checked then
       INIFile.WriteInteger('Preferences', 'GameSizeType', 0)
    else
    if ShowGameSizeBytes.Checked then
       INIFile.WriteInteger('Preferences', 'GameSizeType', 1)
    else
       INIFile.WriteInteger('Preferences', 'GameSizeType', 2);

    INIFile.WriteInteger('Preferences', 'AutoGameInformation', Ord(MenuAutomaticGameInformation.Checked));
    INIFile.WriteInteger('Preferences', 'ShowStatistics', Ord(ShowStatistics.Checked));
    INIFile.WriteInteger('Preferences', 'MinimizeFrontend', Ord(MinimizeFrontend.Checked));
    INIFile.WriteInteger('Preferences', 'FillAllCloneColumns', Ord(FillAllCloneColumns.Checked));
    INIFile.WriteString('Preferences', 'DefaultIconsFolder', DefaultGameIconsFolder.Text);
    INIFile.WriteInteger('Preferences', 'ShowPreliminaryGamesDisabled', Ord(ShowPreliminaryGamesDisabled.Checked));
    INIFile.WriteInteger('Preferences', 'UseCustomOptionsDefault', Ord(UseCustomOptionsDefault.Checked));
    INIFile.WriteInteger('Preferences', 'UseCustomGameDescription', Ord(UseCustomGameDescription.Checked));
    INIFile.WriteInteger('Preferences', 'UseCustomGameCategory', Ord(UseCustomGameCategory.Checked));
    INIFile.WriteInteger('Preferences', 'AuditHardDiskImages', Ord(AuditCHDFiles.Checked));

    // M.A.M.E. Tab
    // Emu Loader Folders
    INIFile.WriteString('Folders', 'TitleSnapshotsFolder', FolderTitleSnapshots.Text);
    INIFile.WriteString('Folders', 'MarqueesFolder', FolderMarquees.Text);
    INIFile.WriteString('Folders', 'CabinetsFolder', FolderCabinets.Text);
    INIFile.WriteString('Folders', 'FlyersFolder', FolderFlyers.Text);
    INIFile.WriteString('Folders', 'ControlPanelsFolder', FolderControlPanels.Text);
    INIFile.WriteString('Folders', 'ControlPanelLayoutsFolder', FolderControlPanelLayouts.Text);
    INIFile.WriteString('Folders', 'IconsFolder', FolderIcons.Text);
    INIFile.WriteString('Folders', 'GamesFAQFolder', FolderGamesFAQ.Text);

    // M.A.M.E. Extra Options
    INIFile.WriteInteger('MAME', 'UseCustomAspectRatio', Ord(UseCustomAspectRatio.Checked)); // OFF by default
    INIFile.WriteInteger('MAME', 'HorizontalGameAspectRatio', HorizontalAspectRatio.Position); // Default ratio is 4:3
    INIFile.WriteInteger('MAME', 'VerticalGameAspectRatio', VerticalAspectRatio.Position); // Default ratio is 4:3

    INIFile.WriteInteger('MAME', 'UseExtraParametersMAME', Ord(UseExtraParametersMAME.Checked)); // OFF by default
    INIFile.WriteString('MAME', 'ExtraParametersMAME', ExtraParametersMAME.Text);
    INIFile.WriteString('MAME', 'ExtraParametersDOSMAME', ExtraParametersDOSMAME.Text);
  end;

  INIFile.WriteInteger('GamesList', 'ClassicMasterRaster', Ord(ClassicMR));
  INIFile.WriteInteger('GamesList', 'ClassicMasterVector', Ord(ClassicMV));
  INIFile.WriteInteger('GamesList', 'ClassicCloneRaster', Ord(ClassicCR));
  INIFile.WriteInteger('GamesList', 'ClassicCloneVector', Ord(ClassicCV));
  INIFile.WriteInteger('GamesList', 'NeoGeoMaster', Ord(NeoGeoM));
  INIFile.WriteInteger('GamesList', 'NeoGeoClone', Ord(NeoGeoC));
  INIFile.WriteInteger('GamesList', 'UnavailableClassicMasterRaster', Ord(UnavailableClassicMR));
  INIFile.WriteInteger('GamesList', 'UnavailableClassicMasterVector', Ord(UnavailableClassicMV));
  INIFile.WriteInteger('GamesList', 'UnavailableClassicCloneRaster', Ord(UnavailableClassicCR));
  INIFile.WriteInteger('GamesList', 'UnavailableClassicCloneVector', Ord(UnavailableClassicCV));
  INIFile.WriteInteger('GamesList', 'UnavailableNeoGeoMaster', Ord(UnavailableNeoGeoM));
  INIFile.WriteInteger('GamesList', 'UnavailableNeoGeoClone', Ord(UnavailableNeoGeoC));
  INIFile.WriteInteger('GamesList', 'BiosClassic', Ord(BiosClassic));
  INIFile.WriteInteger('GamesList', 'BiosNeoGeo', Ord(BiosNeoGeo));
  INIFile.WriteInteger('GamesList', 'UnavailableBiosClassic', Ord(UnavailableBiosClassic));
  INIFile.WriteInteger('GamesList', 'UnavailableBiosNeoGeo', Ord(UnavailableBiosNeoGeo));
  INIFile.WriteInteger('GamesList', 'CustomGames', Ord(CustomGames));
  INIFile.WriteInteger('GamesList', 'UnavailableCustomGames', Ord(UnavailableCustomGames));

  INIFile.WriteInteger('Favorites', 'Favorite', Ord(ButtonShowFavorite.Down));
  INIFile.WriteString('Favorites', 'User', FavoriteUser);

  with FormPreferences do
  begin
    INIFile.WriteInteger('Pictures', 'Stretch', Ord(StretchPicture.Checked));
    INIFile.WriteInteger('Pictures', 'ShowParentPictures', Ord(ShowParentPictures.Checked));
    INIFile.WriteInteger('Pictures', 'AspectRatio', Ord(AspectRatio.Checked));
    INIFile.WriteInteger('Pictures', 'SmoothPictures', Ord(SmoothPictures.Checked));
    INIFile.WriteInteger('Pictures', 'NewPictureNameFormat', Ord(NewPictureNameFormat.Checked));
    INIFile.WriteInteger('Pictures', 'StretchLargerPictures', Ord(StretchLargerPictures.Checked));
    INIFile.WriteInteger('Pictures', 'CyclePictureTypes', Ord(CyclePictureTypes.Checked));
    INIFile.WriteInteger('Pictures', 'PicturesTransparency', Ord(PicturesTransparency.Checked));
    INIFile.WriteInteger('Pictures', 'VirtualList', Ord(PicturesVirtualList.Checked));
  end;

  INIFile.WriteInteger('Pictures', 'ShowPictures', Ord(MenuShowPictures.Checked));
  INIFile.WriteInteger('Pictures', 'PictureButton', ButtonPicturesModeView.Tag);

  if List.Columns[GetColumnIndex(0)].Tag = 1 then
     INIFile.WriteInteger('Columns', 'Description', List.Columns[GetColumnIndex(0)].Width);
  if List.Columns[GetColumnIndex(1)].Tag = 1 then
     INIFile.WriteInteger('Columns', 'Year', List.Columns[GetColumnIndex(1)].Width);
  if List.Columns[GetColumnIndex(2)].Tag = 1 then
     INIFile.WriteInteger('Columns', 'Manufacturer', List.Columns[GetColumnIndex(2)].Width);
  if List.Columns[GetColumnIndex(3)].Tag = 1 then
     INIFile.WriteInteger('Columns', 'Sound', List.Columns[GetColumnIndex(3)].Width);
  if List.Columns[GetColumnIndex(4)].Tag = 1 then
     INIFile.WriteInteger('Columns', 'Frequency', List.Columns[GetColumnIndex(4)].Width);
  if List.Columns[GetColumnIndex(5)].Tag = 1 then
     INIFile.WriteInteger('Columns', 'Samples', List.Columns[GetColumnIndex(5)].Width);
  if List.Columns[GetColumnIndex(6)].Tag = 1 then
     INIFile.WriteInteger('Columns', 'ControlType', List.Columns[GetColumnIndex(6)].Width);
  if List.Columns[GetColumnIndex(7)].Tag = 1 then
     INIFile.WriteInteger('Columns', 'Video', List.Columns[GetColumnIndex(7)].Width);
  if List.Columns[GetColumnIndex(8)].Tag = 1 then
     INIFile.WriteInteger('Columns', 'Orientation', List.Columns[GetColumnIndex(8)].Width);
  if List.Columns[GetColumnIndex(9)].Tag = 1 then
     INIFile.WriteInteger('Columns', 'Resolution', List.Columns[GetColumnIndex(9)].Width);
  if List.Columns[GetColumnIndex(10)].Tag = 1 then
     INIFile.WriteInteger('Columns', 'DriverStatus', List.Columns[GetColumnIndex(10)].Width);
  if List.Columns[GetColumnIndex(11)].Tag = 1 then
     INIFile.WriteInteger('Columns', 'SoundStatus', List.Columns[GetColumnIndex(11)].Width);
  if List.Columns[GetColumnIndex(12)].Tag = 1 then
     INIFile.WriteInteger('Columns', 'ColorStatus', List.Columns[GetColumnIndex(12)].Width);
  if List.Columns[GetColumnIndex(13)].Tag = 1 then
     INIFile.WriteInteger('Columns', 'Merged', List.Columns[GetColumnIndex(13)].Width);
  if List.Columns[GetColumnIndex(14)].Tag = 1 then
     INIFile.WriteInteger('Columns', 'Name', List.Columns[GetColumnIndex(14)].Width);
  if List.Columns[GetColumnIndex(15)].Tag = 1 then
     INIFile.WriteInteger('Columns', 'Clone', List.Columns[GetColumnIndex(15)].Width);
  if List.Columns[GetColumnIndex(16)].Tag = 1 then
     INIFile.WriteInteger('Columns', 'Category', List.Columns[GetColumnIndex(16)].Width);
  if List.Columns[GetColumnIndex(17)].Tag = 1 then
     INIFile.WriteInteger('Columns', 'VersionAdded', List.Columns[GetColumnIndex(17)].Width);
  if List.Columns[GetColumnIndex(18)].Tag = 1 then
     INIFile.WriteInteger('Columns', 'Driver', List.Columns[GetColumnIndex(18)].Width);

  INIFile.WriteInteger('Columns', 'YearVisible', List.Columns[GetColumnIndex(1)].Tag);
  INIFile.WriteInteger('Columns', 'ManufacturerVisible', List.Columns[GetColumnIndex(2)].Tag);
  INIFile.WriteInteger('Columns', 'SoundVisible', List.Columns[GetColumnIndex(3)].Tag);
  INIFile.WriteInteger('Columns', 'FrequencyVisible', List.Columns[GetColumnIndex(4)].Tag);
  INIFile.WriteInteger('Columns', 'SamplesVisible', List.Columns[GetColumnIndex(5)].Tag);
  INIFile.WriteInteger('Columns', 'ControlTypeVisible', List.Columns[GetColumnIndex(6)].Tag);
  INIFile.WriteInteger('Columns', 'VideoVisible', List.Columns[GetColumnIndex(7)].Tag);
  INIFile.WriteInteger('Columns', 'OrientationVisible', List.Columns[GetColumnIndex(8)].Tag);
  INIFile.WriteInteger('Columns', 'ResolutionVisible', List.Columns[GetColumnIndex(9)].Tag);
  INIFile.WriteInteger('Columns', 'DriverStatusVisible', List.Columns[GetColumnIndex(10)].Tag);
  INIFile.WriteInteger('Columns', 'SoundStatusVisible', List.Columns[GetColumnIndex(11)].Tag);
  INIFile.WriteInteger('Columns', 'ColorStatusVisible', List.Columns[GetColumnIndex(12)].Tag);
  INIFile.WriteInteger('Columns', 'MergedVisible', List.Columns[GetColumnIndex(13)].Tag);
  INIFile.WriteInteger('Columns', 'NameVisible', List.Columns[GetColumnIndex(14)].Tag);
  INIFile.WriteInteger('Columns', 'CloneVisible', List.Columns[GetColumnIndex(15)].Tag);
  INIFile.WriteInteger('Columns', 'CategoryVisible', List.Columns[GetColumnIndex(16)].Tag);
  INIFile.WriteInteger('Columns', 'VersionAddedVisible', List.Columns[GetColumnIndex(17)].Tag);
  INIFile.WriteInteger('Columns', 'DriverVisible', List.Columns[GetColumnIndex(18)].Tag);

  INIFile.WriteInteger('Columns', 'YearPosition', List.Columns[GetColumnIndex(1)].Index);
  INIFile.WriteInteger('Columns', 'ManufacturerPosition', List.Columns[GetColumnIndex(2)].Index);
  INIFile.WriteInteger('Columns', 'SoundPosition', List.Columns[GetColumnIndex(3)].Index);
  INIFile.WriteInteger('Columns', 'FrequencyPosition', List.Columns[GetColumnIndex(4)].Index);
  INIFile.WriteInteger('Columns', 'SamplesPosition', List.Columns[GetColumnIndex(5)].Index);
  INIFile.WriteInteger('Columns', 'ControlTypePosition', List.Columns[GetColumnIndex(6)].Index);
  INIFile.WriteInteger('Columns', 'VideoPosition', List.Columns[GetColumnIndex(7)].Index);
  INIFile.WriteInteger('Columns', 'OrientationPosition', List.Columns[GetColumnIndex(8)].Index);
  INIFile.WriteInteger('Columns', 'ResolutionPosition', List.Columns[GetColumnIndex(9)].Index);
  INIFile.WriteInteger('Columns', 'DriverStatusPosition', List.Columns[GetColumnIndex(10)].Index);
  INIFile.WriteInteger('Columns', 'SoundStatusPosition', List.Columns[GetColumnIndex(11)].Index);
  INIFile.WriteInteger('Columns', 'ColorStatusPosition', List.Columns[GetColumnIndex(12)].Index);
  INIFile.WriteInteger('Columns', 'MergedPosition', List.Columns[GetColumnIndex(13)].Index);
  INIFile.WriteInteger('Columns', 'NamePosition', List.Columns[GetColumnIndex(14)].Index);
  INIFile.WriteInteger('Columns', 'ClonePosition', List.Columns[GetColumnIndex(15)].Index);
  INIFile.WriteInteger('Columns', 'CategoryPosition', List.Columns[GetColumnIndex(16)].Index);
  INIFile.WriteInteger('Columns', 'VersionAddedPosition', List.Columns[GetColumnIndex(17)].Index);
  INIFile.WriteInteger('Columns', 'DriverPosition', List.Columns[GetColumnIndex(18)].Index);

  with FormPreferences do
  begin
    INIFile.WriteInteger('X-Arcade', 'UseXArcade', Ord(XArcade.Checked));
    INIFile.WriteString('X-Arcade', 'ImageBackground', XArcadeImageFile.Text);

    INIFile.WriteInteger('HotRod', 'UseHotRod', Ord(HotRod.Checked));
    INIFile.WriteString('HotRod', 'ImageBackground', HotRodSEImageFile.Text);

    INIFile.WriteInteger('SlikStik', 'UseSlikStik', Ord(SlikStik.Checked));
    INIFile.WriteString('SlikStik', 'ImageBackground', SlikStikImageFile.Text);
    INIFile.WriteInteger('SlikStik', 'Swap2ndStick', Ord(SlikStikSwap2ndPlayerStick.Checked));

    INIFile.WriteString('Preferences', 'SplashLogoFile', SplashLogo.Text);
  end;

  CheckPlayTime;
  INIFile.WriteString('ExtraInfo', 'TotalPlayTime', TotalPlayTime);
  FreeAndNil(INIFile);
end;

procedure TFormMain.LoadRealIcons;
var
  Loop, IconIdx: Integer;
  FileIcon: TIcon;
  mGamesList, mTempList: THashedStringList;
  IconIdxVerify, WindowsTempDir: String;
  UseZIPIcons: Boolean;
  //StartClock, EndClock: Integer;

  procedure DeleteIconIndexFiles;
  var
    LoopIcon: Integer;
  begin
    if FileExists(FrontendPath+'resources\IconsIndex.dat') then
       DeleteFile(FrontendPath+'resources\IconsIndex.dat');
    if FileExists(FrontendPath+'resources\IconsList.ini') then
       DeleteFile(FrontendPath+'resources\IconsList.ini');

    if BigRealIconsImageList.Count > 1 then
     begin
       for LoopIcon:=BigRealIconsImageList.Count-1 downto 1 do
       begin
         BigRealIconsImageList.Delete(LoopIcon);
         SmallRealIconsImageList.Delete(LoopIcon);
       end;
     end;
  end;

begin
  //StartClock:= GetTickCount;

  Screen.Cursor:= crDefault;
  WindowsTempDir:= GetWinTempDir;
  RealIconsList:= THashedStringList.Create;
  FileIcon:= TIcon.Create;
  FileIcon.Width:= 32;
  FileIcon.Height:= 32;
  FileIcon.Transparent:= True;
  FormStatus.Show;
  FormStatus.LabelProgress.Caption:= '';
  case FileExists(iconDir+'\icons.zip') of
    True:
      begin
        ListROMsName:= THashedStringList.Create;
        ListROMsSize:= THashedStringList.Create;
        ListROMsCRC:= THashedStringList.Create;
        ListROMsNameFullPath:= THashedStringList.Create;
        UseZIPIcons:= True;
        GetContents(iconDir+'\icons.zip', True, False);

        FormStatus.LabelStatusType.Caption:= GetLanguageText('Status Messages', 'SearchRealIconsTitle', 'Search Zipped Real Icons');
        FormStatus.LabelMessage.Caption:= GetLanguageText('Status Messages', 'UnzipRealIcons', 'Unzipping real icons. Please, wait a moment...');
        FormStatus.Refresh;
        ExtractFilesList(iconDir+'\icons.zip', '*.ico');
        {for Loop:=0 to ListROMsName.Count -1 do
        begin
          if ((LowerCase(ExtractFileExt(ListROMsName[Loop])) = '.ico') and (Pos('!',ListROMsName[Loop]) = 0) and
              (LowerCase(ExtractFileExt(ListROMsName[Loop])) <> '.htm')) then
             begin
               if not FileExists(iconDir+'\'+ListROMsName[Loop]) then
                  UnZipFile(iconDir+'\icons.zip', ListROMsName[Loop]);
                  //UnZip_SelectedFiles(iconDir+'\icons.zip', ListROMsNameFullPath[Loop]);
             end;

          UpdateProgressLabel(Loop+1, ListROMsName.Count, False);
          Application.ProcessMessages;
        end;}
        FreeAndNil(ListROMsSize);
        FreeAndNil(ListROMsCRC);
        FreeAndNil(ListROMsNameFullPath);
      end;
    False: UseZIPIcons:= False;
  end;

  case ((FileExists(FrontendPath+'resources\IconsIndex.dat')) or (FileExists(FrontendPath+'resources\IconsList.ini'))) of
    False:
      begin
        FormStatus.LabelStatusType.Caption:= GetLanguageText('Status Messages', 'CreateRealIconsTitle', 'Create Real Icons');
        FormStatus.LabelMessage.Caption:= GetLanguageText('Status Messages', 'CreateRealIconsList', 'Creating icons list. Please, wait a moment...');
        FormStatus.LabelMessage.Refresh;
        mGamesList:= THashedStringList.Create;
        GetGamesList(mGamesList, True, True);

        mTempList:= THashedStringList.Create;
        mTempList.Add('[IconsOrder]');
        RealIconsList.Add('[IconsIndex]');
        FormStatus.LabelMessage.Caption:= GetLanguageText('Status Messages', 'VerifyGames', 'Verifying games. Please, wait a moment...');
        FormStatus.LabelMessage.Refresh;
        if MenuRealIcons.Checked then
           List.Items.BeginUpdate;
        for Loop:=0 to mGamesList.Count -1 do
        begin
          GetROMFields(mGamesList[Loop]);
          case FileExists(iconDir+'\'+mName+'.ico') of
            True:
              begin
                FileIcon.LoadFromFile(iconDir+'\'+mName+'.ico');
                IconIdx:= BigRealIconsImageList.AddIcon(FileIcon);
                SmallRealIconsImageList.AddIcon(FileIcon);
                RealIconsList.Add(IntToStr(IconIdx)+'='+mName);
                mTempList.Add(mName+'='+IntToStr(IconIdx));
              end;
            False:
              begin
                case UseZIPIcons of
                  True:
                    begin
                      case FileExists(GetWinTempDir+'\'+mName+'.ico') of
                        True:
                          begin
                            FileIcon.LoadFromFile(WindowsTempDir+'\'+mName+'.ico');
                            IconIdx:= BigRealIconsImageList.AddIcon(FileIcon);
                            SmallRealIconsImageList.AddIcon(FileIcon);
                            RealIconsList.Add(IntToStr(IconIdx)+'='+mName);
                            mTempList.Add(mName+'='+IntToStr(IconIdx));
                            DeleteFile(WindowsTempDir+'\'+mName+'.ico');
                          end;
                        False:
                          begin
                            if mClone <> '' then
                               begin
                                 IconIdxVerify:= mTempList.Values[mClone];
                                 mTempList.Add(mName+'='+IconIdxVerify);
                               end
                            else
                               mTempList.Add(mName+'=0');
                          end;
                      end;
                    end;
                  False:
                    begin
                      if mClone <> '' then
                         begin
                           IconIdxVerify:= mTempList.Values[mClone];
                           mTempList.Add(mName+'='+IconIdxVerify);
                         end
                      else
                         mTempList.Add(mName+'=0');
                    end;
                end;
              end;
          end;
          UpdateProgressLabel(Loop+1, mGamesList.Count, False);
          Application.ProcessMessages;
        end;
        if MenuRealIcons.Checked then
           List.Items.EndUpdate;
        Screen.Cursor:= crHourGlass;
        mTempList.SaveToFile(FrontendPath+'resources\IconsList.ini');
        FreeAndNil(mTempList);
        FreeAndNil(mGamesList);
        RealIconsList.SaveToFile(FrontendPath+'resources\IconsIndex.dat');
        FreeAndNil(RealIconsList);
        FormStatus.LabelProgress.Caption:= '';
        FormStatus.LabelStatusType.Caption:= GetLanguageText('Status Messages', 'SaveRealIconsTitle', 'Saving Real Icons Resource');
        FormStatus.LabelMessage.Caption:= GetLanguageText('Status Messages', 'SaveRealIconsDATFile', 'Saving icons to .dat files. Please, wait a moment...');
        FormStatus.LabelMessage.Refresh;

        if not SaveLoadRealIcons(0) then
           DeleteIconIndexFiles;
      end;
    True:
      begin
        FormStatus.LabelStatusType.Caption:= GetLanguageText('Status Messages', 'LoadRealIconsTitle', 'Load Real Icons Resource');
        RealIconsList.LoadFromFile(FrontendPath+'resources\IconsIndex.dat');

        FormStatus.LabelMessage.Caption:= GetLanguageText('Status Messages', 'LoadRealIconsDAT', 'Loading icons from .dat files. Please, wait a moment...');
        FormStatus.LabelMessage.Refresh;

        for Loop:=0 to RealIconsList.Count-1 do
        begin
          if Loop > 0 then
          begin
          if RealIconsList[Loop] <> '' then
             begin
               IconIdxVerify:= RealIconsList.Values[IntToStr(Loop)];
               case FileExists(iconDir+'\'+IconIdxVerify+'.ico') of
                 True: FileIcon.LoadFromFile(iconDir+'\'+IconIdxVerify+'.ico');
                 False:
                   begin
                     case FileExists(WindowsTempDir+'\'+IconIdxVerify+'.ico') of
                       True:
                         begin
                           FileIcon.LoadFromFile(WindowsTempDir+'\'+IconIdxVerify+'.ico');
                           DeleteFile(WindowsTempDir+'\'+IconIdxVerify+'.ico');
                         end;
                       False: BigRealIconsImageList.GetIcon(0, FileIcon);
                     end;
                   end;
               end;
               IconIdx:= BigRealIconsImageList.AddIcon(FileIcon);
               SmallRealIconsImageList.AddIcon(FileIcon);
               UpdateProgressLabel(Loop+1, RealIconsList.Count, False);
               Application.ProcessMessages;
             end
          else
             Break;
          end;
        end;
        Screen.Cursor:= crHourGlass;
        FreeAndNil(RealIconsList);
        FormStatus.LabelProgress.Caption:= '';
        FormStatus.LabelStatusType.Caption:= GetLanguageText('Status Messages', 'SaveRealIconsTitle', 'Saving Real Icons Resource');
        FormStatus.LabelMessage.Caption:= GetLanguageText('Status Messages', 'SaveRealIconsDATFile', 'Saving real icons to .dat files. Please, wait a moment...');
        FormStatus.LabelMessage.Refresh;

        if not SaveLoadRealIcons(0) then
           DeleteIconIndexFiles;
      end;
  end;

  FreeAndNil(FileIcon);
  if UseZIPIcons then
     begin
       for Loop:=0 to ListROMsName.Count -1 do
        begin
          if ((LowerCase(ExtractFileExt(ListROMsName[Loop])) = '.ico') and (Pos('!',ListROMsName[Loop]) = 0) and
              (LowerCase(ExtractFileExt(ListROMsName[Loop])) <> '.htm')) then
             begin
               if FileExists(WindowsTempDir+'\'+ListROMsName[Loop]) then
                  DeleteFile(WindowsTempDir+'\'+ListROMsName[Loop]);
             end;
        end;
        FreeAndNil(ListROMsName);
     end;
  FormStatus.Close;
  Screen.Cursor:= crHourGlass;

  //EndClock:= GetTickCount;
  //ShowMessage(IntToStr(EndClock-StartClock));
end;

function TFormMain.CheckDOSMAMEConfigFile(ExecutableString: String): Boolean;
begin
  Result:= FileExists(ExtractFilePath(ExecutableString)+'mame.cfg');
  if not Result then
     CreateDOSMAMEConfigFile(ExecutableString);
end;

procedure TFormMain.CreateDOSMAMEConfigFile(ExecutableString: String);
var
  MAMEcfgFile: THashedStringList;
  CommandLine: String;
begin
  SetCurrentDir(ExtractFilePath(ExecutableString));
  CommandLine:= SystemStr+ExecutableString+SystemStr+' -createconfig';
  case Win32Platform of
    0,1: RunProcess('command.com /c '+CommandLine, True, SW_SHOWNORMAL, False); //Win9x
    2  : RunProcess('cmd.exe /c '+SystemStr+CommandLine+SystemStr, True, SW_SHOWNORMAL, False); // Win2000 and WinXP
  end;
  Application.ProcessMessages;
  // still need to update this procedure... or maybe not (due to older DOS MAME builds)
  if not FileExists(ExtractFilePath(ExecutableString)+'mame.cfg') then
  begin
    MAMEcfgFile:= THashedStringList.Create;

    MAMEcfgFile.Add('emulate_three = no');
    MAMEcfgFile.Add('[directory]');
    MAMEcfgFile.Add('inp = INP');
    MAMEcfgFile.Add('hi = HI');
    MAMEcfgFile.Add('sta = STA');
    MAMEcfgFile.Add('cheat = .');
    MAMEcfgFile.Add('memcard = MEMCARD');
    MAMEcfgFile.Add('nvram = NVRAM');
    MAMEcfgFile.Add('artwork = ARTWORK');
    MAMEcfgFile.Add('cfg = CFG');
    MAMEcfgFile.Add('snap = SNAP');
    MAMEcfgFile.Add('rompath = ROMS');
    MAMEcfgFile.Add('samplepath = SAMPLES');
    MAMEcfgFile.Add(' ');
    MAMEcfgFile.Add('[config]');
    MAMEcfgFile.Add('scanlines = yes');
    MAMEcfgFile.Add('stretch = yes');
    MAMEcfgFile.Add('artwork = yes');
    MAMEcfgFile.Add('samples = yes');
    MAMEcfgFile.Add('vsync = no');
    MAMEcfgFile.Add('waitvsync = no');
    MAMEcfgFile.Add('triplebuffer = no');
    MAMEcfgFile.Add('tweak = no');
    MAMEcfgFile.Add('vesamode = vesa3');
    MAMEcfgFile.Add('mmx = auto');
    MAMEcfgFile.Add('dirty = auto');
    MAMEcfgFile.Add('antialias = yes');
    MAMEcfgFile.Add('translucency = yes');
    MAMEcfgFile.Add('vgafreq = -1');
    MAMEcfgFile.Add('alwayssynced = no');
    MAMEcfgFile.Add('depth = auto');
    MAMEcfgFile.Add('skiplines = 0');
    MAMEcfgFile.Add('skipcolumns = 0');
    MAMEcfgFile.Add('beam = 1.00');
    MAMEcfgFile.Add('flicker = 0.00');
    MAMEcfgFile.Add('gamma = 1.00');
    MAMEcfgFile.Add('frameskip = auto');
    MAMEcfgFile.Add('norotate = no');
    MAMEcfgFile.Add('ror = no');
    MAMEcfgFile.Add('rol = no');
    MAMEcfgFile.Add('flipx = no');
    MAMEcfgFile.Add('flipy = no');
    MAMEcfgFile.Add('soundcard = -1');
    MAMEcfgFile.Add('samplerate = 44100');
    MAMEcfgFile.Add('stereo = yes');
    MAMEcfgFile.Add('volume = 0');
    MAMEcfgFile.Add('sampleratedetect = yes');
    MAMEcfgFile.Add('resamplefilter = yes');
    MAMEcfgFile.Add('mouse = yes');
    MAMEcfgFile.Add('joystick = none');
    MAMEcfgFile.Add('steadykey = no');
    MAMEcfgFile.Add('hotrod = no');
    MAMEcfgFile.Add('hotrodse = no');
    MAMEcfgFile.Add('cheat = no');
    MAMEcfgFile.Add('cheatfile = CHEAT.DAT');
    MAMEcfgFile.Add('historyfile = HISTORY.DAT');
    MAMEcfgFile.Add('mameinfofile = MAMEINFO.DAT');
    MAMEcfgFile.Add('resolution = auto');
    MAMEcfgFile.Add('vectorres = auto');
    MAMEcfgFile.Add('language = english');
    MAMEcfgFile.Add('monitor = standard');
    MAMEcfgFile.Add('centerx = 0');
    MAMEcfgFile.Add('centery = 0');
    MAMEcfgFile.Add('waitinterlace = no');
    MAMEcfgFile.Add(' ');
    MAMEcfgFile.Add('[tweaked]');
    MAMEcfgFile.Add('224x288_h = 95');
    MAMEcfgFile.Add('224x288_v = 84');
    MAMEcfgFile.Add('240x256_h = 103');
    MAMEcfgFile.Add('240x256_v = 35');
    MAMEcfgFile.Add('256x240_h = 85');
    MAMEcfgFile.Add('256x240_v = 67');
    MAMEcfgFile.Add('256x256_h = 108');
    MAMEcfgFile.Add('256x256_v = 35');
    MAMEcfgFile.Add('256x256_hor_h = 85');
    MAMEcfgFile.Add('256x256_hor_v = 96');
    MAMEcfgFile.Add('288x224_h = 95');
    MAMEcfgFile.Add('288x224_v = 12');
    MAMEcfgFile.Add('240x320_h = 90');
    MAMEcfgFile.Add('240x320_v = 140');
    MAMEcfgFile.Add('320x240_h = 95');
    MAMEcfgFile.Add('320x240_v = 12');
    MAMEcfgFile.Add('336x240_h = 95');
    MAMEcfgFile.Add('336x240_v = 12');
    MAMEcfgFile.Add('384x224_h = 108');
    MAMEcfgFile.Add('384x224_v = 12');
    MAMEcfgFile.Add('384x240_h = 108');
    MAMEcfgFile.Add('384x240_v = 12');
    MAMEcfgFile.Add('384x256_h = 108');
    MAMEcfgFile.Add('384x256_v = 35');
    MAMEcfgFile.Add('224x288arc_h = 93');
    MAMEcfgFile.Add('224x288arc_v = 56');
    MAMEcfgFile.Add('288x224arc_h = 93');
    MAMEcfgFile.Add('288x224arc_v = 9');
    MAMEcfgFile.Add('256x240arc_h = 93');
    MAMEcfgFile.Add('256x240arc_v = 9');
    MAMEcfgFile.Add('256x256arc_h = 93');
    MAMEcfgFile.Add('256x256arc_v = 23');
    MAMEcfgFile.Add('320x240arc_h = 105');
    MAMEcfgFile.Add('320x240arc_v = 9');
    MAMEcfgFile.Add('320x256arc_h = 105');
    MAMEcfgFile.Add('320x256arc_v = 23');
    MAMEcfgFile.Add('352x240arc_h = 106');
    MAMEcfgFile.Add('352x240arc_v = 9');
    MAMEcfgFile.Add('352x256arc_h = 106');
    MAMEcfgFile.Add('352x256arc_v = 23');
    MAMEcfgFile.Add('368x224arc_h = 106');
    MAMEcfgFile.Add('368x224arc_v = 9');
    MAMEcfgFile.Add('368x240arc_h = 106');
    MAMEcfgFile.Add('368x240arc_v = 9');
    MAMEcfgFile.Add('368x256arc_h = 106');
    MAMEcfgFile.Add('368x256arc_v = 23');
    MAMEcfgFile.Add('512x224arc_h = 191');
    MAMEcfgFile.Add('512x224arc_v = 9');
    MAMEcfgFile.Add('512x256arc_h = 191');
    MAMEcfgFile.Add('512x256arc_v = 23');
    MAMEcfgFile.Add('512x448arc_h = 191');
    MAMEcfgFile.Add('512x448arc_v = 9');
    MAMEcfgFile.Add('512x512arc_h = 191');
    MAMEcfgFile.Add('512x512arc_v = 23');
    MAMEcfgFile.Add('640x480arc_h = 193');
    MAMEcfgFile.Add('640x480arc_v = 9');

    MAMEcfgFile.SaveToFile(ExtractFilePath(ExecutableString)+'mame.cfg');
    FreeAndNil(MAMEcfgFile);
    SetCurrentDir(FrontendPath);
  end;
end;

procedure TFormMain.ReadDOSMAMEConfigFile(ExecutableString: String);
var
  MAMEcfg: TIniFile;
  Result: String;
  ctrlrKeysList: THashedStringList;
begin
  MAMEcfg:= TIniFile.Create(ExtractFilePath(ExecutableString)+'mame.cfg');
  ThousandSeparator:= Char(',');
  DecimalSeparator:= Char('.');
  with MAMEcfg do
  begin
    with FormDOSMAMEConfiguration do
    begin
      // Read MAME Paths
      FolderROMs.Text:= ReadString('directory', 'rompath', 'roms');
      ExtractROMsFolders(FolderROMs.Text);
      FolderSamples.Text:= ReadString('directory', 'samplepath', 'samples');
      FolderGamesConfiguration.Text:= ReadString('directory', 'cfg', 'cfg');
      FolderSaveStates.Text:= ReadString('directory', 'sta', 'sta');
      FolderHighScores.Text:= ReadString('directory', 'hi', 'hi');
      FolderNVRAM.Text:= ReadString('directory', 'nvram', 'nvram');
      FolderMemoryCards.Text:= ReadString('directory', 'memcard', 'memcard');
      FolderInputsRecording.Text:= ReadString('directory', 'inp', 'inp');
      FolderArtworks.Text:= ReadString('directory', 'artwork', 'artwork');
      FolderSnapshots.Text:= ReadString('directory', 'snap', 'snap');
      FolderCheats.Text:= ReadString('directory', 'cheat', 'cheats');
      FolderDiff.Text:= ReadString('directory', 'diff', 'diff');
      FolderKeysMapping.Text:= ReadString('directory', 'ctrlr_directory', 'ctrlr');
      if FolderKeysMapping.Text <> '' then
         begin
           ctrlrKeysList:= THashedStringList.Create;
           if (Pos(':\', FolderKeysMapping.Text) > 0) or (Pos(':', FolderKeysMapping.Text) > 0) then
              GetControllersList(ctrlrKeysList, FolderKeysMapping.Text)
           else
              GetControllersList(ctrlrKeysList, ExtractFilePath(ExecutableString)+FolderKeysMapping.Text);

           if ctrlrKeysList.Count > 0 then
              ControllerKeysMapping.Items.AddStrings(ctrlrKeysList);
           FreeAndNil(ctrlrKeysList);
         end;

      // Read MAME Options

      // Display Options
      Result:= IntToStr(FormMain.SetResolution(ReadString('config', 'resolution', 'auto')));
      if Result = '-1' then
         CustomResolution.Text:= Result
      else
         Resolution.Position:= StrToInt(Result);

      Result:= ReadString('config', 'depth', 'auto');
      if Result = 'auto' then
         Depth.Position:= 0 else
      if Result = '8' then
         Depth.Position:= 1 else
      if Result = '15' then
         Depth.Position:= 2 else
      if Result = '16' then
         Depth.Position:= 3 else
      if Result = '24' then
         Depth.Position:= 4 else
         Depth.Position:= 5;

      VESA.Position:= SetDOSVesaMode(ReadString('config', 'vesamode', 'auto'));

      CenterX.Position:= ReadInteger('config', 'centerx', 0);
      CenterY.Position:= ReadInteger('config', 'centery', 0);

      SkipColumns.Position:= ReadInteger('config', 'skipcolumns', 0);
      SkipLines.Position:= ReadInteger('config', 'skiplines', 0);

      Result:= ReadString('config', 'monitor', 'standard');
      if Result = 'standard' then
         Monitor.Position:= 0 else
      if Result = 'ntsc' then
         Monitor.Position:= 1 else
      if Result = 'pal' then
         Monitor.Position:= 2 else
         Monitor.Position:= 3;

      Result:= ReadString('config', 'frameskip', 'auto');
      if Result = 'auto' then
         Frameskip.Position:= -1
      else
         Frameskip.Position:= StrToInt(Result);

      Gamma.Position:= StrToFloat(Format('%1.2f', [StrToFloat(TrimLeft(ReadString('config', 'gamma', '1.00')))]));

      DebuggerResolution.Position:= SetDOSResolution(ReadString('config', 'debug_resolution', 'auto'));
      Brightness.Position:= StrToFloat(Format('%1.2f', [StrToFloat(TrimLeft(ReadString('config', 'brightness', '1.00')))]));
      PauseBrightness.Position:= StrToFloat(Format('%1.2f', [StrToFloat(TrimLeft(ReadString('config', 'pause_brightness', '0.65')))]));

      // Vector Options
      Antialias.Checked:= ReadString('config', 'antialias', 'yes') = 'yes';
      Translucency.Checked:= ReadString('config', 'translucency', 'yes') = 'yes';
      Flicker.Position:= StrToFloat(Format('%3.2f', [StrToFloat(TrimLeft(ReadString('config', 'flicker', '0.00')))]));
      Beam.Position:= StrToFloat(Format('%2.2f', [StrToFloat(TrimLeft(ReadString('config', 'beam', '1.00')))]));
      Intensity.Position:= StrToFloat(Format('%1.2f', [StrToFloat(TrimLeft(ReadString('config', 'intensity', '1.50')))]));
      VectorResolution.Position:= SetResolution(ReadString('config', 'vectorres', 'auto'));

      VGAFrequency.Position:= ReadInteger('config', 'vgafreq', -1);
      // Sound Card Options
      Result:= ReadString('config', 'soundcard', '-1');
      case StrToInt(Result) of
       -1: SoundCard.Position:= 0;
        0: SoundCard.Position:= 1;
        1: SoundCard.Position:= 2;
        3: SoundCard.Position:= 3;
        4: SoundCard.Position:= 4;
        5: SoundCard.Position:= 5;
        6: SoundCard.Position:= 6;
        7: SoundCard.Position:= 7;
      end;

      Sound.Checked:= ReadString('config', 'sound', 'yes') = 'yes';

      Result:= ReadString('config', 'samplerate', '44100');
      case StrToInt(Result) of
        11025: SampleRate.Position:= 0;
        22050: SampleRate.Position:= 1;
        44100: SampleRate.Position:= 2;
        48000: SampleRate.Position:= 3;
        else   CustomSampleRate.Position:= StrToInt(Result);
      end;

      Volume.Position:= ReadInteger('config', 'volume', 0);

      Stereo.Checked:= ReadString('config', 'stereo', 'yes') = 'yes';
      Samples.Checked:= ReadString('config', 'samples', 'yes') = 'yes';
      DetectSampleRate.Checked:= ReadString('config', 'sampleratedetect', 'yes') = 'yes';
      ResampleFilter.Checked:= ReadString('config', 'resamplefilter', 'yes') = 'yes';

      // Controllers Options
      Joystick.Position:= SetDOSJoystick(ReadString('config', 'joystick', 'none'));
      Mouse.Checked:= ReadString('config', 'mouse', 'yes') = 'yes';
      KeyboardLEDs.Checked:= ReadString('config', 'keyboard_leds', 'yes') = 'yes';

      // Miscellaneous Options
      FilenameCheat.Text:= ReadString('config', 'cheatfile', 'CHEAT.DAT');
      FilenameMAMEInfo.Text:= ReadString('config', 'mameinfofile', 'MAMEINFO.DAT');
      FilenameHistory.Text:= ReadString('config', 'historyfile', 'HISTORY.DAT');

      SteadyKey.Checked:= ReadString('config', 'steadykey', 'no') = 'yes';
      ControllerKeysMapping.ItemIndex:= ControllerKeysMapping.Items.IndexOf(ReadString('config', 'ctrlr', 'standard'));
      if ControllerKeysMapping.ItemIndex = -1 then
         ControllerKeysMapping.ItemIndex:= 0;

      // Visual Effects Options
      Scanlines.Position:= SetDOSScanlines(ReadString('config', 'scanlines', 'yes'));
      Stretch.Checked:= ReadString('config', 'stretch', 'yes') = 'yes';
      VSync.Checked:= ReadString('config', 'vsync', 'yes') = 'yes';
      AlwaysSynced.Checked:= ReadString('config', 'alwayssynced', 'yes') = 'yes';
      WaitVSync.Checked:= ReadString('config', 'waitvsync', 'yes') = 'yes';
      RotateLeft.Checked:= ReadString('config', 'rol', 'yes') = 'yes';
      RotateRight.Checked:= ReadString('config', 'ror', 'yes') = 'yes';
      NoRotate.Checked:= ReadString('config', 'norotate', 'yes') = 'yes';
      TripleBuffer.Checked:= ReadString('config', 'triplebuffer', 'yes') = 'yes';
      WaitInterlace.Checked:= ReadString('config', 'waitinterlace', 'yes') = 'yes';

      Artwork.Checked:= ReadString('config', 'artwork', 'yes') = 'yes';
      Backdrop.Checked:= ReadString('config', 'use_backdrops' ,'yes') = 'yes';
      Overlay.Checked:= ReadString('config', 'use_overlays', 'yes') = 'yes';
      Bezel.Checked:= ReadString('config', 'use_bezels', 'yes') = 'yes';
      Crop.Checked:= ReadString('config', 'artwork_crop', 'no') = 'yes';
      Result:= ReadString('config', 'artwork_resolution', 'auto');
      if Result = 'auto' then
         ArtworkResolution.Position:= 0
      else
         ArtworkResolution.Position:= StrToInt(Result);

      Result:= ReadString('config', 'mmx', 'auto');
      if Result = 'auto' then
         MMX.Position:= -1 else
      if Result = 'yes' then
         MMX.Position:= 0 else
      if Result = 'no' then
         MMX.Position:= 1 else
         MMX.Position:= -1;

      Result:= ReadString('config', 'dirty', 'auto');
      if Result = 'auto' then
         Dirty.Position:= -1 else
      if Result = 'yes' then
         Dirty.Position:= 0 else
      if Result = 'no' then
         Dirty.Position:= 1 else
         Dirty.Position:= -1;


      FlipX.Checked:= ReadString('config', 'flipx', 'yes') = 'yes';
      FlipY.Checked:= ReadString('config', 'flipy', 'yes') = 'yes';

      // Tweaks Options
      Throttle.Checked:= ReadString('config', 'throttle', 'yes') = 'yes';
      Tweak.Checked:= ReadString('config', 'tweak', 'yes') = 'yes';
      Cheat.Checked:= ReadString('config', 'cheat', 'yes') = 'yes';
      SkipDisclaimer.Checked:= ReadString('config', 'skip_disclaimer', 'no') = 'yes';
      SkipGameInfo.Checked:= ReadString('config', 'skip_gameinfo', 'no') = 'yes';

      { -ignorecfg     ignore mame.cfg and start with default options
        -debug         Activates the integrated debugger.
                         During emulation, press the Tilde key (~) to activate the
                         debugger. This is available only if the program is compiled with
                         MAME_DEBUG defined

        theese are in-line options (does not have in mame.cfg) }
    end;
    FreeAndNil(MAMEcfg);
  end;
end;

procedure TFormMain.UpdateDOSMAMEConfigFile(ExecutableString: String);
var
  MAMEcfg: TIniFile;
begin
  MAMEcfg:= TIniFile.Create(ExtractFilePath(ExecutableString)+'mame.cfg');
  with MAMEcfg do
  begin
    // Write MAME Paths
    with FormDOSMAMEConfiguration do
    begin
      WriteString('directory', 'rompath', FolderROMs.Text);
      ExtractROMsFolders(FolderROMs.Text);
      WriteString('directory', 'samplepath', FolderSamples.Text);
      WriteString('directory', 'cfg', FolderGamesConfiguration.Text);
      WriteString('directory', 'sta', FolderSaveStates.Text);
      WriteString('directory', 'hi', FolderHighScores.Text);
      WriteString('directory', 'nvram', FolderNVRAM.Text);
      WriteString('directory', 'memcard', FolderMemoryCards.Text);
      WriteString('directory', 'inp', FolderInputsRecording.Text);
      WriteString('directory', 'artwork', FolderArtworks.Text);
      WriteString('directory', 'snap', FolderSnapshots.Text);
      WriteString('directory', 'cheat', FolderCheats.Text);
      WriteString('directory', 'diff', FolderDiff.Text);

      // Write MAME Options

      // Display Options
      if CustomResolution.Text = '' then
         WriteString('config', 'resolution', LowerCase(LabelResolutionValue.Caption))
      else
         WriteString('config', 'resolution', LowerCase(CustomResolution.Text));

      case Depth.Position of
        0: WriteString('config', 'depth', 'auto');
        1: WriteString('config', 'depth', '8');
        2: WriteString('config', 'depth', '15');
        3: WriteString('config', 'depth', '16');
        4: WriteString('config', 'depth', '24');
        5: WriteString('config', 'depth', '32');
      end;

      WriteString('config', 'vesamode', LowerCase(LabelVESAValue.Caption));

      WriteInteger('config', 'centerx', CenterX.Position);
      WriteInteger('config', 'centery', CenterY.Position);

      WriteInteger('config', 'skipcolumns', SkipColumns.Position);
      WriteInteger('config', 'skiplines', SkipLines.Position);

      case Monitor.Position of
        0: WriteString('config', 'monitor', 'standard');
        1: WriteString('config', 'monitor', 'ntsc');
        2: WriteString('config', 'monitor', 'pal');
        3: WriteString('config', 'monitor', 'arcade');
      end;

      if Frameskip.Position = -1 then
         WriteString('config', 'frameskip', 'auto') else
         WriteInteger('config', 'frameskip', Frameskip.Position);

      WriteString('config', 'scanlines', LowerCase(LabelScanlinesValue.Caption));
      WriteString('config', 'debug_resolution', LowerCase(LabelDebuggerResolutionValue.Caption));
      WriteString('config', 'brightness', LowerCase(LabelBrightnessValue.Caption));

      WriteString('config', 'gamma', LabelGammaValue.Caption);
      WriteInteger('config', 'vgafreq', VGAFrequency.Position);

      // Vector Options
      case Antialias.Checked of
        True : WriteString('config', 'antialias', 'yes');
        False: WriteString('config', 'antialias', 'no');
      end;

      case Translucency.Checked of
        True : WriteString('config', 'translucency', 'yes');
        False: WriteString('config', 'translucency', 'no');
      end;

      WriteString('config', 'flicker', LabelFlickerValue.Caption);
      WriteString('config', 'beam', LabelBeamValue.Caption);
      WriteString('config', 'intensity', LabelIntensityValue.Caption);
      WriteString('config', 'vectorres', LowerCase(LabelVectorResolutionValue.Caption));

      // Sound Card Options
      case SoundCard.Position of
        0: WriteString('config', 'soundcard', '-1');
        1: WriteString('config', 'soundcard', '0');
        2: WriteString('config', 'soundcard', '1');
        3: WriteString('config', 'soundcard', '3');
        4: WriteString('config', 'soundcard', '4');
        5: WriteString('config', 'soundcard', '5');
        6: WriteString('config', 'soundcard', '6');
        7: WriteString('config', 'soundcard', '7');
      end;

      case Sound.Checked of
        True : WriteString('config', 'sound', 'yes');
        False: WriteString('config', 'sound', 'no');
      end;

      if CustomSampleRate.Position = 4999 then
         begin
           case SampleRate.Position of
             0: WriteString('config', 'samplerate', '11025');
             1: WriteString('config', 'samplerate', '22050');
             2: WriteString('config', 'samplerate', '44100');
             3: WriteString('config', 'samplerate', '48000');
           end;
         end
      else
         WriteInteger('config', 'samplerate', CustomSampleRate.Position);

      WriteInteger('config', 'volume', Volume.Position);

      case Stereo.Checked of
        True : WriteString('config', 'stereo', 'yes');
        False: WriteString('config', 'stereo', 'no');
      end;

      case Samples.Checked of
        True : WriteString('config', 'samples', 'yes');
        False: WriteString('config', 'samples', 'no');
      end;

      case DetectSampleRate.Checked of
        True : WriteString('config', 'sampleratedetect', 'yes');
        False: WriteString('config', 'sampleratedetect', 'no');
      end;

      case ResampleFilter.Checked of
        True : WriteString('config', 'resamplefilter', 'yes');
        False: WriteString('config', 'resamplefilter', 'no');
      end;

      // Controllers Options
      case Joystick.Position of
         0: WriteString('config', 'joystick', 'none');
         1: WriteString('config', 'joystick', 'auto');
         2: WriteString('config', 'joystick', 'standard');
         3: WriteString('config', 'joystick', 'dual');
         4: WriteString('config', 'joystick', '4button');
         5: WriteString('config', 'joystick', '6button');
         6: WriteString('config', 'joystick', '8button');
         7: WriteString('config', 'joystick', 'fspro');
         8: WriteString('config', 'joystick', 'wingex');
         9: WriteString('config', 'joystick', 'wingwarrior');
        10: WriteString('config', 'joystick', 'sidewinder');
        11: WriteString('config', 'joystick', 'gamepadpro');
        12: WriteString('config', 'joystick', 'grip');
        13: WriteString('config', 'joystick', 'grip4');
        14: WriteString('config', 'joystick', 'sneslpt1');
        15: WriteString('config', 'joystick', 'sneslpt2');
        16: WriteString('config', 'joystick', 'sneslpt3');
        17: WriteString('config', 'joystick', 'psxlpt1');
        18: WriteString('config', 'joystick', 'psxlpt2');
        19: WriteString('config', 'joystick', 'psxlpt3');
        20: WriteString('config', 'joystick', 'n64lpt1');
        21: WriteString('config', 'joystick', 'n64lpt2');
        22: WriteString('config', 'joystick', 'n64lpt3');
        23: WriteString('config', 'joystick', 'segaisa');
        24: WriteString('config', 'joystick', 'segapci');
        25: WriteString('config', 'joystick', 'db9lpt1');
        26: WriteString('config', 'joystick', 'db9lpt2');
        27: WriteString('config', 'joystick', 'db9lpt3');
        28: WriteString('config', 'joystick', 'tgxlpt1');
        29: WriteString('config', 'joystick', 'tgxlpt2');
        30: WriteString('config', 'joystick', 'tgxlpt3');
      end;

      case Mouse.Checked of
        True : WriteString('config', 'mouse', 'yes');
        False: WriteString('config', 'mouse', 'no');
      end;

      case KeyboardLEDs.Checked of
        True : WriteString('config', 'keyboard_leds', 'yes');
        False: WriteString('config', 'keyboard_leds', 'no');
      end;

      // Miscellaneous Options
      WriteString('config', 'cheatfile', FilenameCheat.Text);
      WriteString('config', 'mameinfofile', FilenameMAMEInfo.Text);
      WriteString('config', 'historyfile', FilenameHistory.Text);

      case Artwork.Checked of
        True : WriteString('config', 'artwork', 'yes');
        False: WriteString('config', 'artwork', 'no');
      end;

      case Backdrop.Checked of
        True : WriteString('config', 'use_backdrops', 'yes');
        False: WriteString('config', 'use_backdrops', 'no');
      end;

      case Overlay.Checked of
        True : WriteString('config', 'use_overlays', 'yes');
        False: WriteString('config', 'use_overlays', 'no');
      end;

      case Bezel.Checked of
        True : WriteString('config', 'use_bezels', 'yes');
        False: WriteString('config', 'use_bezels', 'no');
      end;

      case Crop.Checked of
        True : WriteString('config', 'artwork_crop', 'yes');
        False: WriteString('config', 'artwork_crop', 'no');
      end;

      WriteString('config', 'artwork_resolution', 'auto');

      // Visual Effects Options
      case Stretch.Checked of
        True : WriteString('config', 'stretch', 'yes');
        False: WriteString('config', 'stretch', 'no');
      end;

      case VSync.Checked of
        True : WriteString('config', 'vsync', 'yes');
        False: WriteString('config', 'vsync', 'no');
      end;

      case AlwaysSynced.Checked of
        True : WriteString('config', 'alwayssynced', 'yes');
        False: WriteString('config', 'alwayssynced', 'no');
      end;

      case WaitVSync.Checked of
        True : WriteString('config', 'waitvsync', 'yes');
        False: WriteString('config', 'waitvsync', 'no');
      end;

      case RotateLeft.Checked of
        True : WriteString('config', 'rol', 'yes');
        False: WriteString('config', 'rol', 'no');
      end;

      case RotateRight.Checked of
        True : WriteString('config', 'ror', 'yes');
        False: WriteString('config', 'ror', 'no');
      end;

      case NoRotate.Checked of
        True : WriteString('config', 'norotate', 'yes');
        False: WriteString('config', 'norotate', 'no');
      end;

      case TripleBuffer.Checked of
        True : WriteString('config', 'triplebuffer', 'yes');
        False: WriteString('config', 'triplebuffer', 'no');
      end;

      case WaitInterlace.Checked of
        True : WriteString('config', 'waitinterlace', 'yes');
        False: WriteString('config', 'waitinterlace', 'no');
      end;

      WriteString('config', 'mmx', LowerCase(LabelMMXValue.Caption));
      WriteString('config', 'dirty', LowerCase(LabelDirtyValue.Caption));

      case FlipX.Checked of
        True : WriteString('config', 'flipx', 'yes');
        False: WriteString('config', 'flipx', 'no');
      end;

      case FlipY.Checked of
        True : WriteString('config', 'flipy', 'yes');
        False: WriteString('config', 'flipy', 'no');
      end;

      // Tweaks Options
      case Throttle.Checked of
        True : WriteString('config', 'throttle', 'yes');
        False: WriteString('config', 'throttle', 'no');
      end;

      case Tweak.Checked of
        True : WriteString('config', 'tweak', 'yes');
        False: WriteString('config', 'tweak', 'no');
      end;

      case Cheat.Checked of
        True : WriteString('config', 'cheat', 'yes');
        False: WriteString('config', 'cheat', 'no');
      end;

      case SteadyKey.Checked of
        True : WriteString('config', 'steadykey', 'yes');
        False: WriteString('config', 'steadykey', 'no');
      end;

      { -ignorecfg     ignore mame.cfg and start with default options
        -debug         Activates the integrated debugger.
                         During emulation, press the Tilde key (~) to activate the
                         debugger. This is available only if the program is compiled with
                         MAME_DEBUG defined

        theese are in-line options (does not have in mame.cfg) }
    end;
    FreeAndNil(MAMEcfg);
  end;
end;

function TFormMain.CheckMAMEIniFiles: Boolean;
begin
  Result:= True;
  case EmulatorType[1] of
    1:
      begin
        if not CheckMAMEIniFile(EmulatorExecutable[1]) then
           Result:= False;
      end;
    2:
      begin
        if not CheckDOSMAMEConfigFile(EmulatorExecutable[1]) then
           Result:= False;
      end;
  end;

  case EmulatorType[2] of
    1:
      begin
        if not CheckMAMEIniFile(EmulatorExecutable[2]) then
           Result:= False;
      end;
    2:
      begin
        if not CheckDOSMAMEConfigFile(EmulatorExecutable[2]) then
           Result:= False;
      end;
  end;

  case EmulatorType[3] of
    1:
      begin
        if not CheckMAMEIniFile(EmulatorExecutable[3]) then
           Result:= False;
      end;
    2:
      begin
        if CheckDOSMAMEConfigFile(EmulatorExecutable[3]) = False then
           Result:= False;
      end;
  end;

  case EmulatorType[4] of
    1:
      begin
        if not CheckMAMEIniFile(EmulatorExecutable[4]) then
           Result:= False;
      end;
    2:
      begin
        if not CheckDOSMAMEConfigFile(EmulatorExecutable[4]) then
           Result:= False;
      end;
  end;

  case EmulatorType[5] of
    1:
      begin
        if not CheckMAMEIniFile(EmulatorExecutable[5]) then
           Result:= False;
      end;
    2:
      begin
        if not CheckDOSMAMEConfigFile(EmulatorExecutable[5]) then
           Result:= False;
      end;
  end;
end;

function TFormMain.GetExecutableINIFileName(ExecutableFileName: String): String;
begin
  Result:= ExtractFileName(ExecutableFileName);
  Delete(Result, Pos('.', Result), Length(Result));
  Result:= Result+'.ini';
end;

function TFormMain.CheckMAMEIniFile(ExecutableString: String): Boolean;
begin
  Result:= True;
  if ExecutableString <> '' then
     begin
       if not FileExists(ExtractFilePath(ExecutableString)+GetExecutableINIFileName(ExecutableString)) then
          begin
            Result:= False;
            CreateMAMEIniFile(ExecutableString);
          end;
     end
  else
     Result:= False;
end;

function TFormMain.ReadMAMECustomCommandLine(GameName: String; CustomCmdType: ShortInt): String;
var
  CommandLineFile: THashedStringList;
  CommandLineExecutableString, CommandLineParametersString, Folder: String;
begin
  case CustomCmdType of
    0: Folder:= 'customcmd\';
    1: Folder:= 'drvcustomcmd\';
  end;
  case FileExists(FrontendPath+'resources\'+Folder+GameName+'.ini') of
    True:
      begin
        if GetFileSize(FrontendPath+'resources\'+Folder+GameName+'.ini') > 0 then
           begin
             CommandLineFile:= THashedStringList.Create;
             CommandLineFile.LoadFromFile(FrontendPath+'resources\'+Folder+GameName+'.ini');
             CommandLineExecutableString:= CommandLineFile.Values['Executable'];
             CommandLineParametersString:= CommandLineFile.Values['Parameters'];
             FreeAndNil(CommandLineFile);

             if CommandLineExecutableString = '' then
                Result:= 'Not Found'
               else
                  begin
                    case Assigned(FormCustomCommandLine) of
                      True:
                        begin
                          FormCustomCommandLine.CustomCommandLineExecutable.Text:= CommandLineExecutableString;
                          FormCustomCommandLine.CustomCommandLineParamaters.Text:= CommandLineParametersString
                        end;
                      False:
                        begin
                          Folder:= '';
                          Folder:= CommandLineExecutableString;
                          if Folder[1] = '"' then
                             begin
                               Delete(Folder, 1, 1);
                               Delete(Folder, Length(Folder), 1);
                             end;
                          SetCurrentDir(ExtractFilePath(Folder));
                        end;
                    end;

                    if CommandLineExecutableString[1] = '"' then
                       Result:= CommandLineExecutableString
                    else
                       Result:= SystemStr+CommandLineExecutableString+SystemStr;
                    if CommandLineParametersString <> '' then
                       Result:= Result+' '+CommandLineParametersString;
                  end;
           end
        else
           Result:= 'Not Found';
      end;
    False: Result:= 'Not Found';
  end;
end;

procedure TFormMain.UpdateMAMECustomCommandLine(GameName, CustomExecutable, CustomParameters: String; CustomCmdType: ShortInt);
var
  CommandLineFile: THashedStringList;
  Folder: String;
begin
  case CustomCmdType of
    0: Folder:= 'customcmd\';
    1: Folder:= 'drvcustomcmd\';
  end;
  if ((CustomExecutable = '') and (CustomParameters = '')) or
     (CustomExecutable = '') then
     begin
       DeleteMAMECustomCommandLine(GameName, CustomCmdType);
       Exit;
     end;

  CommandLineFile:= THashedStringList.Create;
  CommandLineFile.Add('Executable='+CustomExecutable);
  if CustomParameters <> '' then
     CommandLineFile.Add('Parameters='+CustomParameters);

  CommandLineFile.SaveToFile(FrontendPath+'resources\'+Folder+GameName+'.ini');
  FreeAndNil(CommandLineFile);
end;

procedure TFormMain.DeleteMAMECustomCommandLine(GameName: String; CustomCmdType: ShortInt);
var
  Folder: String;
begin
  case CustomCmdType of
    0: Folder:= 'customcmd\';
    1: Folder:= 'drvcustomcmd\';
  end;
  if FileExists(FrontendPath+'resources\'+Folder+GameName+'.ini') then
     DeleteFile(FrontendPath+'resources\'+Folder+GameName+'.ini');
end;


function TFormMain.ReadCustomGameDescription(GameName: String; out DefaultDescription: String): String;
var
  CustomDescriptionList: THashedStringList;
begin
  CustomDescriptionList:= THashedStringList.Create;
  case FileExists(FrontendPath+'GameDescription.ini') of
    True:
      begin
        CustomDescriptionList.LoadFromFile(FrontendPath+'GameDescription.ini');
        Result:= CustomDescriptionList.Values[GameName+'_custom'];
        DefaultDescription:= CustomDescriptionList.Values[GameName];
      end;
    False:
      begin
        Result:= '';
        DefaultDescription:= '';
      end;
  end;
  FreeAndNil(CustomDescriptionList);
end;

function TFormMain.UpdateCustomGameDescription(GameName, CustomDescription, DefaultDescription: String): Boolean;
var
  CustomDescriptionList: THashedStringList;
  GameIndex: Integer;
  DATFile, ROMDataLine: String;
begin
  Result:= LowerCase(CustomDescription) <> LowerCase(DefaultDescription);
  if not Result then
     Exit;

  CustomDescriptionList:= THashedStringList.Create;
  case FileExists(FrontendPath+'GameDescription.ini') of
    True:
      begin
        CustomDescriptionList.LoadFromFile(FrontendPath+'GameDescription.ini');
        GameIndex:= CustomDescriptionList.IndexOfName(GameName+'_custom');
        if GameIndex <> -1 then
           CustomDescriptionList.Values[GameName+'_custom']:= CustomDescription
        else
           begin
             CustomDescriptionList.Add(GameName+'='+DefaultDescription);
             CustomDescriptionList.Add(GameName+'_custom='+CustomDescription);
           end;
      end;
    False:
      begin
        CustomDescriptionList.Add(GameName+'='+DefaultDescription);
        CustomDescriptionList.Add(GameName+'_custom='+CustomDescription);
      end;
  end;
  if CustomDescriptionList.Count > 0 then
     CustomDescriptionList.SaveToFile(FrontendPath+'GameDescription.ini');
  FreeAndNil(CustomDescriptionList);

  // now, let's update the .dat file with the new description
  SetGameMemoryInfo;

  case mROMIdentification of
     0: DATFile:= FrontendPath+'resources\ClassicMR.dat';
     1: DATFile:= FrontendPath+'resources\ClassicMV.dat';
     2: DATFile:= FrontendPath+'resources\ClassicCR.dat';
     3: DATFile:= FrontendPath+'resources\ClassicCV.dat';
     4: DATFile:= FrontendPath+'resources\NeoGeoM.dat';
     5: DATFile:= FrontendPath+'resources\NeoGeoC.dat';
     6: DATFile:= FrontendPath+'resources\UnClassicMR.dat';
     7: DATFile:= FrontendPath+'resources\UnClassicMV.dat';
     8: DATFile:= FrontendPath+'resources\UnClassicCR.dat';
     9: DATFile:= FrontendPath+'resources\UnClassicCV.dat';
    10: DATFile:= FrontendPath+'resources\UnNeoGeoM.dat';
    11: DATFile:= FrontendPath+'resources\UnNeoGeoC.dat';
    12, 13: DATFile:= FrontendPath+'resources\BIOS.dat';
    14, 15: DATFile:= FrontendPath+'resources\UnBIOS.dat';
  end;
  case FileExists(DATFile) of
    True:
      begin
        ROMDataLine:= PopulateROMDataLine;
        CustomDescriptionList:= THashedStringList.Create;
        CustomDescriptionList.LoadFromFile(DATFile);
        GameIndex:= CustomDescriptionList.IndexOf(ROMDataLine);
        if GameIndex <> -1 then
           begin
             mDescription:= CustomDescription;
             ROMDataLine:= '';
             ROMDataLine:= PopulateROMDataLine;
             CustomDescriptionList[GameIndex]:= ROMDataLine;
             CustomDescriptionList.SaveToFile(DATFile);
           end
        else
           Result:= False;
        FreeAndNil(CustomDescriptionList);
      end;
    False: Result:= False;
  end;
end;

procedure TFormMain.DeleteCustomGameDescription(GameName: String);
var
  CustomDescriptionList: THashedStringList;
  GameIndex: Integer;
  DATFile, ROMDataLine, DefaultDescription: String;
  UpdateGame: Boolean;
begin
  UpdateGame:= True;
  if FileExists(FrontendPath+'GameDescription.ini') then
     begin
       CustomDescriptionList:= THashedStringList.Create;
       CustomDescriptionList.LoadFromFile(FrontendPath+'GameDescription.ini');
       GameIndex:= CustomDescriptionList.IndexOfName(GameName+'_custom');
       if GameIndex <> -1 then
          begin
            DefaultDescription:= CustomDescriptionList.Values[GameName];
            if DefaultDescription <> GamesList[SelectedGame].eDescription then
               begin
                 CustomDescriptionList.Delete(GameIndex);
                 CustomDescriptionList.Delete(GameIndex-1);
               end
            else
               UpdateGame:= False;
          end
       else
          UpdateGame:= False;
       if CustomDescriptionList.Count > 0 then
          begin
            CustomDescriptionList.SaveToFile(FrontendPath+'GameDescription.ini');
            FreeAndNil(CustomDescriptionList);
          end
       else
          begin
            FreeAndNil(CustomDescriptionList);
            DeleteFile(FrontendPath+'GameDescription.ini');
          end;
     end;

  // now, let's update the .dat file with the original description
  if UpdateGame then
     begin
       SetGameMemoryInfo;
       case mROMIdentification of
          0: DATFile:= FrontendPath+'resources\ClassicMR.dat';
          1: DATFile:= FrontendPath+'resources\ClassicMV.dat';
          2: DATFile:= FrontendPath+'resources\ClassicCR.dat';
          3: DATFile:= FrontendPath+'resources\ClassicCV.dat';
          4: DATFile:= FrontendPath+'resources\NeoGeoM.dat';
          5: DATFile:= FrontendPath+'resources\NeoGeoC.dat';
          6: DATFile:= FrontendPath+'resources\UnClassicMR.dat';
          7: DATFile:= FrontendPath+'resources\UnClassicMV.dat';
          8: DATFile:= FrontendPath+'resources\UnClassicCR.dat';
          9: DATFile:= FrontendPath+'resources\UnClassicCV.dat';
         10: DATFile:= FrontendPath+'resources\UnNeoGeoM.dat';
         11: DATFile:= FrontendPath+'resources\UnNeoGeoC.dat';
         12, 13: DATFile:= FrontendPath+'resources\BIOS.dat';
         14, 15: DATFile:= FrontendPath+'resources\UnBIOS.dat';
       end;
       if FileExists(DATFile) then
          begin
            ROMDataLine:= PopulateROMDataLine;
            CustomDescriptionList:= THashedStringList.Create;
            CustomDescriptionList.LoadFromFile(DATFile);
            GameIndex:= CustomDescriptionList.IndexOf(ROMDataLine);
            if GameIndex <> -1 then
               begin
                 mDescription:= DefaultDescription;
                 ROMDataLine:= '';
                 ROMDataLine:= PopulateROMDataLine;
                 CustomDescriptionList[GameIndex]:= ROMDataLine;
                 CustomDescriptionList.SaveToFile(DATFile);
                 List.Items.BeginUpdate;
                 GamesList[SelectedGame].eDescription:= DefaultDescription;
                 List.Items.EndUpdate;
                 List.Invalidate;
               end;
             FreeAndNil(CustomDescriptionList);
          end;
     end;
end;

function TFormMain.ReadCustomGameCategory(GameName: String): String;
var
  CustomCategoryList: THashedStringList;
begin
  CustomCategoryList:= THashedStringList.Create;
  Result:= '';
  if FileExists(FrontendPath+'GameCategory.ini') then
     begin
       CustomCategoryList.LoadFromFile(FrontendPath+'GameCategory.ini');
       Result:= CustomCategoryList.Values[GameName];
     end;
  FreeAndNil(CustomCategoryList);
end;

function TFormMain.UpdateCustomGameCategory(GameName, CustomCategory, DefaultCategory: String): Boolean;
var
  CustomCategoryList: THashedStringList;
  GameIndex: Integer;
  DATFile, ROMDataLine: String;
begin
  Result:= LowerCase(CustomCategory) <> LowerCase(DefaultCategory);
  if not Result then
     Exit;

  CustomCategoryList:= THashedStringList.Create;
  case FileExists(FrontendPath+'GameCategory.ini') of
    True:
      begin
        CustomCategoryList.LoadFromFile(FrontendPath+'GameCategory.ini');
        GameIndex:= CustomCategoryList.IndexOfName(GameName);
        if GameIndex <> -1 then
           CustomCategoryList.Values[GameName]:= CustomCategory
        else
           CustomCategoryList.Add(GameName+'='+CustomCategory);
      end;
    False:
      begin
        CustomCategoryList.Add(GameName+'='+CustomCategory);
      end;
  end;
  if CustomCategoryList.Count > 0 then
     CustomCategoryList.SaveToFile(FrontendPath+'GameCategory.ini');
  FreeAndNil(CustomCategoryList);

  // now, let's update the .dat file with the new description
  SetGameMemoryInfo;

  case mROMIdentification of
     0: DATFile:= FrontendPath+'resources\ClassicMR.dat';
     1: DATFile:= FrontendPath+'resources\ClassicMV.dat';
     2: DATFile:= FrontendPath+'resources\ClassicCR.dat';
     3: DATFile:= FrontendPath+'resources\ClassicCV.dat';
     4: DATFile:= FrontendPath+'resources\NeoGeoM.dat';
     5: DATFile:= FrontendPath+'resources\NeoGeoC.dat';
     6: DATFile:= FrontendPath+'resources\UnClassicMR.dat';
     7: DATFile:= FrontendPath+'resources\UnClassicMV.dat';
     8: DATFile:= FrontendPath+'resources\UnClassicCR.dat';
     9: DATFile:= FrontendPath+'resources\UnClassicCV.dat';
    10: DATFile:= FrontendPath+'resources\UnNeoGeoM.dat';
    11: DATFile:= FrontendPath+'resources\UnNeoGeoC.dat';
    12, 13: DATFile:= FrontendPath+'resources\BIOS.dat';
    14, 15: DATFile:= FrontendPath+'resources\UnBIOS.dat';
  end;
  case FileExists(DATFile) of
    True:
      begin
        ROMDataLine:= PopulateROMDataLine;
        CustomCategoryList:= THashedStringList.Create;
        CustomCategoryList.LoadFromFile(DATFile);
        GameIndex:= CustomCategoryList.IndexOf(ROMDataLine);
        if GameIndex <> -1 then
           begin
             mCategory:= CustomCategory;
             ROMDataLine:= '';
             ROMDataLine:= PopulateROMDataLine;
             CustomCategoryList[GameIndex]:= ROMDataLine;
             CustomCategoryList.SaveToFile(DATFile);
           end
        else
           Result:= False;
        FreeAndNil(CustomCategoryList);
      end;
    False: Result:= False;
  end;
end;

procedure TFormMain.DeleteCustomGameCategory(GameName: String);
var
  CustomCategoryList: THashedStringList;
  TempFile: TMemIniFile;
  GameIndex: Integer;
  DATFile, ROMDataLine, DefaultCategory: String;
  UpdateGame: Boolean;
begin
  UpdateGame:= True;
  if FileExists(FrontendPath+'catver.ini') then
     begin
       TempFile:= TMemIniFile.Create(FrontendPath+'catver.ini');
       DefaultCategory:= TempFile.ReadString('Category', GameName, '');
       FreeAndNil(TempFile);
     end;

  if FileExists(FrontendPath+'GameCategory.ini') then
     begin
       CustomCategoryList:= THashedStringList.Create;
       CustomCategoryList.LoadFromFile(FrontendPath+'GameCategory.ini');
       GameIndex:= CustomCategoryList.IndexOfName(GameName);
       if GameIndex <> -1 then
          begin
            if DefaultCategory <> GamesList[SelectedGame].eCategory then
               CustomCategoryList.Delete(GameIndex)
            else
               UpdateGame:= False;
          end
       else
          begin
            if DefaultCategory = GamesList[SelectedGame].eCategory then
               UpdateGame:= False;
          end;
       if CustomCategoryList.Count > 0 then
          begin
            CustomCategoryList.SaveToFile(FrontendPath+'GameCategory.ini');
            FreeAndNil(CustomCategoryList);
          end
       else
          begin
            FreeAndNil(CustomCategoryList);
            DeleteFile(FrontendPath+'GameCategory.ini');
          end;
     end;

  // now, let's update the .dat file with the original category (only if file "catver.ini" is available)
  if UpdateGame then
     begin
       SetGameMemoryInfo;
       case mROMIdentification of
          0: DATFile:= FrontendPath+'resources\ClassicMR.dat';
          1: DATFile:= FrontendPath+'resources\ClassicMV.dat';
          2: DATFile:= FrontendPath+'resources\ClassicCR.dat';
          3: DATFile:= FrontendPath+'resources\ClassicCV.dat';
          4: DATFile:= FrontendPath+'resources\NeoGeoM.dat';
          5: DATFile:= FrontendPath+'resources\NeoGeoC.dat';
          6: DATFile:= FrontendPath+'resources\UnClassicMR.dat';
          7: DATFile:= FrontendPath+'resources\UnClassicMV.dat';
          8: DATFile:= FrontendPath+'resources\UnClassicCR.dat';
          9: DATFile:= FrontendPath+'resources\UnClassicCV.dat';
         10: DATFile:= FrontendPath+'resources\UnNeoGeoM.dat';
         11: DATFile:= FrontendPath+'resources\UnNeoGeoC.dat';
         12, 13: DATFile:= FrontendPath+'resources\BIOS.dat';
         14, 15: DATFile:= FrontendPath+'resources\UnBIOS.dat';
       end;
       if FileExists(DATFile) then
          begin
            ROMDataLine:= PopulateROMDataLine;
            CustomCategoryList:= THashedStringList.Create;
            CustomCategoryList.LoadFromFile(DATFile);
            GameIndex:= CustomCategoryList.IndexOf(ROMDataLine);
            if GameIndex <> -1 then
               begin
                 mCategory:= DefaultCategory;
                 ROMDataLine:= '';
                 ROMDataLine:= PopulateROMDataLine;
                 CustomCategoryList[GameIndex]:= ROMDataLine;
                 CustomCategoryList.SaveToFile(DATFile);
                 List.Items.BeginUpdate;
                 GamesList[SelectedGame].eCategory:= DefaultCategory;
                 List.Items.EndUpdate;
                 List.Invalidate;
               end;
             FreeAndNil(CustomCategoryList);
          end;
     end;
end;

procedure TFormMain.GetKeysMappingList(ExecutableString: String);
var
  Loop: Byte;
  ctrlrKeysList: THashedStringList;
begin
  if PopupMenuControllerKeysMapping.Items.Count > 1 then
     begin
       for Loop:= PopupMenuControllerKeysMapping.Items.Count -1 downto 1 do
           PopupMenuControllerKeysMapping.Items.Delete(Loop);
     end;

  ctrlrKeysList:= THashedStringList.Create;
  if (Pos(':\', ctrlrDir) > 0) or (Pos(':', ctrlrDir) > 0) then
     GetControllersList(ctrlrKeysList, ctrlrDir)
  else
     GetControllersList(ctrlrKeysList, ExtractFilePath(ExecutableString)+ctrlrDir);

  if ctrlrKeysList.Count > 0 then
     begin
       for Loop:=0 to ctrlrKeysList.Count -1 do
           AddPopupItem(PopupMenuControllerKeysMapping, ctrlrKeysList[Loop], False, True);
     end;
  FreeAndNil(ctrlrKeysList);
end;

procedure TFormMain.AddPopupItem(PopupHolder: TPopupMenu; Description: String; Duplicate, LoadDefault: Boolean);
var
  NewMenuItem: TMenuItem;
  Loop: Integer;
begin
  if not Duplicate then
     begin
       if PopupHolder.Items.Count > 0 then
          begin
            for Loop:=0 to PopupHolder.Items.Count-1 do
            begin
              if PopupHolder.Items[Loop].Caption = Description then
                 Exit;
            end;
          end;
     end;

  NewMenuItem:= TMenuItem.Create(PopupHolder);
  NewMenuItem.Caption:= Description;
  NewMenuItem.AutoCheck:= True;
  NewMenuItem.RadioItem:= True;
  NewMenuItem.OnClick:= ctrlrDefaultClick;
  PopupHolder.Items.Add(NewMenuItem);
end;

procedure TFormMain.GetControllersList(ListHolder: THashedStringList; FolderControllerKeys: String);
begin
  if FolderControllerKeys <> '' then
     begin
       GetCtrlrList(FolderControllerKeys, '.zip', ListHolder, True);
       GetCtrlrList(FolderControllerKeys, '.ini', ListHolder, False);
       ListHolder.Sort;
     end;
end;

// Read / Write "mame.ini" and "mame.cfg" functions
function TFormMain.GetAspectRatio(AspectRatioHolder: TGaugeBar): String;
begin
  case AspectRatioHolder.Position of
     0: Result:= '1:2';
     1: Result:= '2:1';
     2: Result:= '2:2';
     3: Result:= '2:3';
     4: Result:= '2:4';
     5: Result:= '2:5';
     6: Result:= '3:2';
     7: Result:= '3:3';
     8: Result:= '3:4';
     9: Result:= '3:5';
    10: Result:= '3:6';
    11: Result:= '3:7';
    12: Result:= '3:8';
    13: Result:= '4:2';
    14: Result:= '4:3'; // Default Value
    15: Result:= '4:4';
    16: Result:= '4:5';
    17: Result:= '4:6';
    18: Result:= '4:7';
    19: Result:= '4:8';
    20: Result:= '5:2';
    21: Result:= '5:3';
    22: Result:= '5:4';
    23: Result:= '5:5';
    24: Result:= '5:6';
    25: Result:= '5:7';
    26: Result:= '5:8';
    27: Result:= '6:3';
    28: Result:= '6:4';
    29: Result:= '6:5';
    30: Result:= '6:6';
    31: Result:= '6:7';
    32: Result:= '6:8';
  end;
end;

function TFormMain.GetBlitterEffect(BlitterEffectHolder: TGaugeBar): String;
begin
  case BlitterEffectHolder.Position of
     0: Result:= 'None'; // Default  Value
     1: Result:= '25% Scanlines';
     2: Result:= '50% Scanlines';
     3: Result:= '75% Scanlines';
     4: Result:= 'RGB 16';
     5: Result:= 'RGB 6';
     6: Result:= 'RGB 4';
     7: Result:= 'RGB 4 Vertical';
     8: Result:= 'RGB 3';
     9: Result:= 'RGB Tiny';
    10: Result:= '75% Vertical Scanlines';
    11: Result:= 'Sharp';
  end;
end;

function TFormMain.GetSampleRate(SampleRateHolder: TGaugeBar): String;
begin
  case SampleRateHolder.Position of
    0: Result:= '11025 Hz';
    1: Result:= '22050 Hz';
    2: Result:= '44100 Hz';
    3: Result:= '48000 Hz';
  end;
end;

function TFormMain.GetResolution(ResolutionHolder: TGaugeBar): String;
begin
  case ResolutionHolder.Position of
     0: Result:= 'Auto';
     1: Result:= '320x200';
     2: Result:= '320x240';
     3: Result:= '400x300';
     4: Result:= '512x384';
     5: Result:= '640x400';
     6: Result:= '640x480';
     7: Result:= '800x600';
     8: Result:= '1024x768';
     9: Result:= '1152x864';
    10: Result:= '1280x1024';
    11: Result:= '1600x1200';
    12: Result:= '0x0x16';
    13: Result:= '320x200x16';
    14: Result:= '320x240x16';
    15: Result:= '400x300x16';
    16: Result:= '512x384x16';
    17: Result:= '640x400x16';
    18: Result:= '640x480x16';
    19: Result:= '800x600x16';
    20: Result:= '1024x768x16';
    21: Result:= '1152x864x16';
    22: Result:= '1280x1024x16';
    23: Result:= '1600x1200x16';
    24: Result:= '0x0x32';
    25: Result:= '320x200x32';
    26: Result:= '320x240x32';
    27: Result:= '400x300x32';
    28: Result:= '512x384x32';
    29: Result:= '640x400x32';
    30: Result:= '640x480x32';
    31: Result:= '800x600x32';
    32: Result:= '1024x768x32';
    33: Result:= '1152x864x32';
    34: Result:= '1280x1024x32';
    35: Result:= '1600x1200x32';
  end;
end;

function TFormMain.SetDefaultAspectRatio(const AspectRatioValue: String): Byte;
begin
  if AspectRatioValue = '1:2' then
     Result:= 0
  else
  if AspectRatioValue = '2:1' then
     Result:= 1
  else
  if AspectRatioValue = '2:2' then
     Result:= 2
  else
  if AspectRatioValue = '2:3' then
     Result:= 3
  else
  if AspectRatioValue = '2:4' then
     Result:= 4
  else
  if AspectRatioValue = '2:5' then
     Result:= 5
  else
  if AspectRatioValue = '3:2' then
     Result:= 6
  else
  if AspectRatioValue = '3:3' then
     Result:= 7
  else
  if AspectRatioValue = '3:4' then
     Result:= 8
  else
  if AspectRatioValue = '3:5' then
     Result:= 9
  else
  if AspectRatioValue = '3:6' then
     Result:= 10
  else
  if AspectRatioValue = '3:7' then
     Result:= 11
  else
  if AspectRatioValue = '3:8' then
     Result:= 12
  else
  if AspectRatioValue = '4:2' then
     Result:= 13
  else
  if AspectRatioValue = '4:3' then
     Result:= 14 // Default Value
  else
  if AspectRatioValue = '4:4' then
     Result:= 15
  else
  if AspectRatioValue = '4:5' then
     Result:= 16
  else
  if AspectRatioValue = '4:6' then
     Result:= 17
  else
  if AspectRatioValue = '4:7' then
     Result:= 18
  else
  if AspectRatioValue = '4:8' then
     Result:= 19
  else
  if AspectRatioValue = '5:2' then
     Result:= 20
  else
  if AspectRatioValue = '5:3' then
     Result:= 21
  else
  if AspectRatioValue = '5:4' then
     Result:= 22
  else
  if AspectRatioValue = '5:5' then
     Result:= 23
  else
  if AspectRatioValue = '5:6' then
     Result:= 24
  else
  if AspectRatioValue = '5:7' then
     Result:= 25
  else
  if AspectRatioValue = '5:8' then
     Result:= 26
  else
  if AspectRatioValue = '6:3' then
     Result:= 27
  else
  if AspectRatioValue = '6:4' then
     Result:= 28
  else
  if AspectRatioValue = '6:5' then
     Result:= 29
  else
  if AspectRatioValue = '6:6' then
     Result:= 30
  else
  if AspectRatioValue = '6:7' then
     Result:= 31
  else
  if AspectRatioValue = '6:8' then
     Result:= 32
  else
     Result:= 14; // No Valid value found, returning default value (4:3)
end;

function TFormMain.SetResolution(ResolutionValue: String): ShortInt;
begin
  if ResolutionValue = 'auto' then
     Result:= 0
  else
  if ResolutionValue = '320x200' then
     Result:= 1
  else
  if ResolutionValue = '320x240' then
     Result:= 2
  else
  if ResolutionValue = '400x300' then
     Result:= 3
  else
  if ResolutionValue = '512x384' then
     Result:= 4
  else
  if ResolutionValue = '640x400' then
     Result:= 5
  else
  if ResolutionValue = '640x480' then
     Result:= 6
  else
  if ResolutionValue = '800x600' then
     Result:= 7
  else
  if ResolutionValue = '1024x768' then
     Result:= 8
  else
  if ResolutionValue = '1152x864' then
     Result:= 9
  else
  if ResolutionValue = '1280x1024' then
     Result:= 10
  else
  if ResolutionValue = '1600x1200' then
     Result:= 11
  else
  if ResolutionValue = '0x0x16' then
     Result:= 12
  else
  if ResolutionValue = '320x200x16' then
     Result:= 13
  else
  if ResolutionValue = '320x240x16' then
     Result:= 14
  else
  if ResolutionValue = '400x300x16' then
     Result:= 15
  else
  if ResolutionValue = '512x384x16' then
     Result:= 16
  else
  if ResolutionValue = '640x400x16' then
     Result:= 17
  else
  if ResolutionValue = '640x480x16' then
     Result:= 18
  else
  if ResolutionValue = '800x600x16' then
     Result:= 19
  else
  if ResolutionValue = '1024x768x16' then
     Result:= 20
  else
  if ResolutionValue = '1152x864x16' then
     Result:= 21
  else
  if ResolutionValue = '1280x1024x16' then
     Result:= 22
  else
  if ResolutionValue = '1600x1200x16' then
     Result:= 23
  else
  if ResolutionValue = '0x0x32' then
     Result:= 24
  else
  if ResolutionValue = '320x200x32' then
     Result:= 25
  else
  if ResolutionValue = '320x240x32' then
     Result:= 26
  else
  if ResolutionValue = '400x300x32' then
     Result:= 27
  else
  if ResolutionValue = '512x384x32' then
     Result:= 28
  else
  if ResolutionValue = '640x400x32' then
     Result:= 29
  else
  if ResolutionValue = '640x480x32' then
     Result:= 30
  else
  if ResolutionValue = '800x600x32' then
     Result:= 31
  else
  if ResolutionValue = '1024x768x32' then
     Result:= 32
  else
  if ResolutionValue = '1152x864x32' then
     Result:= 33
  else
  if ResolutionValue = '1280x1024x32' then
     Result:= 34
  else
  if ResolutionValue = '1600x1200x32' then
     Result:= 35
  else
     Result:= -1;
end;

function TFormMain.SetBlitterEffect(BlitterEffectValue: String): ShortInt;
begin
  if BlitterEffectValue = 'none' then
     Result:= 0
  else
  if BlitterEffectValue = 'scan25' then
     Result:= 1
  else
  if BlitterEffectValue = 'scan50' then
     Result:= 2
  else
  if BlitterEffectValue = 'scan75' then
     Result:= 3
  else
  if BlitterEffectValue = 'rgb16' then
     Result:= 4
  else
  if BlitterEffectValue = 'rgb6' then
     Result:= 5
  else
  if BlitterEffectValue = 'rgb4' then
     Result:= 6
  else
  if BlitterEffectValue = 'rgb4v' then
     Result:= 7
  else
  if BlitterEffectValue = 'rgb3' then
     Result:= 8
  else
  if BlitterEffectValue = 'rgbtiny' then
     Result:= 9
  else
  if BlitterEffectValue = 'scan75v' then
     Result:= 10
  else
  if BlitterEffectValue = 'sharp' then
     Result:= 11;
end;

function TFormMain.GetDOSResolution(ResolutionHolder: TGaugeBar): String;
begin
  case ResolutionHolder.Position of
     0: Result:= 'Auto';
     1: Result:= '224x288';
     2: Result:= '240x256';
     3: Result:= '240x320';
     4: Result:= '256x240';
     5: Result:= '288x224';
     6: Result:= '320x200';
     7: Result:= '320x240';
     8: Result:= '320x256';
     9: Result:= '336x240';
    10: Result:= '352x240';
    11: Result:= '352x256';
    12: Result:= '368x224';
    13: Result:= '368x240';
    14: Result:= '368x256';
    15: Result:= '384x224';
    16: Result:= '384x240';
    17: Result:= '384x256';
    18: Result:= '400x300';
    19: Result:= '512x224';
    20: Result:= '512x256';
    21: Result:= '512x384';
    22: Result:= '512x448';
    23: Result:= '512x512';
    24: Result:= '640x350';
    25: Result:= '640x400';
    26: Result:= '640x480';
    27: Result:= '800x600';
    28: Result:= '1024x768';
    29: Result:= '1152x864';
    30: Result:= '1280x1024';
    31: Result:= '1600x1200';
  end;
end;

function TFormMain.GetDOSMonitor(MonitorHolder: TGaugeBar): String;
begin
 case MonitorHolder.Position of
    0: Result:= 'Standard (Standard PC Monitor)';
    1: Result:= 'NTSC Monitor';
    2: Result:= 'PAL Monitor';
    3: Result:= 'Arcade Monitor';
  end;
end;

function TFormMain.GetDOSSoundCard(SoundCardHolder: TGaugeBar): String;
begin
  case SoundCardHolder.Position of
    0: Result:= 'Auto Detect';
    1: Result:= 'Silence';
    2: Result:= 'Sound Blaster';
    3: Result:= 'Pro Audio Spectrum';
    4: Result:= 'Ultrasound Max (CS4231)';
    5: Result:= 'Ultrasound';
    6: Result:= 'Windows Sound System';
    7: Result:= 'Ensoniq Soundscape';
  end;
end;

function TFormMain.GetDOSJoystick(JoystickHolder: TGaugeBar): String;
begin
  case JoystickHolder.Position of
     0: Result:= 'No Joystick';
     1: Result:= 'Auto Detect';
     2: Result:= 'Standard (2 button joystick)';
     3: Result:= 'Dual Joysticks';
     4: Result:= 'Stick/Pad with 4 buttons';
     5: Result:= 'Stick/Pad with 6 buttons';
     6: Result:= 'Stick/Pad with 8 buttons';
     7: Result:= 'CH Flightstick Pro';
     8: Result:= 'Wingman Extreme';
     9: Result:= 'Wingman Warrior';
    10: Result:= 'Microsoft Sidewinder Gamepad (up to 4)';
    11: Result:= 'Gravis GamePad Pro';
    12: Result:= 'Gravis GrIP';
    13: Result:= 'Gravis GrIP (constrained to move only along the X and Y axes)';
    14: Result:= 'SNES pad on LPT1 (needs special hardware)';
    15: Result:= 'SNES pad on LPT2 (needs special hardware)';
    16: Result:= 'SNES pad on LPT3 (needs special hardware)';
    17: Result:= 'PSX pad on LPT1 (needs special hardware)';
    18: Result:= 'PSX pad on LPT2 (needs special hardware)';
    19: Result:= 'PSX pad on LPT3 (needs special hardware)';
    20: Result:= 'N64 pad on LPT1 (needs special hardware)';
    21: Result:= 'N64 pad on LPT2 (needs special hardware)';
    22: Result:= 'N64 pad on LPT3 (needs special hardware)';
    23: Result:= 'if SEGA ISA (needs special hardware)';
    24: Result:= 'if SEGA PCI (needs special hardware)';
    25: Result:= 'C64/Atari/Sinclair via DB9 on LPT1 (needs special hardware)';
    26: Result:= 'C64/Atari/Sinclair via DB9 on LPT2 (needs special hardware)';
    27: Result:= 'C64/Atari/Sinclair via DB9 on LPT3 (needs special hardware)';
    28: Result:= 'Turbografix Interface on LPT1 (needs special hardware)';
    29: Result:= 'Turbografix Interface on LPT2 (needs special hardware)';
    30: Result:= 'Turbografix Interface on LPT3 (needs special hardware)';
  end;
end;

function TFormMain.GetDOSVesaMode(VESAHolder: TGaugeBar): String;
begin
  case VESAHolder.Position of
    0: Result:= 'Yes';
    1: Result:= 'No';
    2: Result:= 'VESA1';
    3: Result:= 'VESA2b';
    4: Result:= 'VESA2l';
    5: Result:= 'VESA3';
  end;
end;

function TFormMain.GetDOSDepth(DepthHolder: TGaugeBar): String;
begin
  case DepthHolder.Position of
    0: Result:= 'Auto';
    1: Result:= '8 bpp';
    2: Result:= '15 bpp';
    3: Result:= '16 bpp';
    4: Result:= '24 bpp';
    5: Result:= '32 bpp';
  end;
end;

function TFormMain.SetDOSResolution(ResolutionValue: String): ShortInt;
begin
  if ResolutionValue = 'auto' then
     Result:= 0 else
  if ResolutionValue = '224x288' then
     Result:= 1 else
  if ResolutionValue = '240x256' then
     Result:= 2 else
  if ResolutionValue = '240x320' then
     Result:= 3 else
  if ResolutionValue = '256x240' then
     Result:= 4 else
  if ResolutionValue = '288x224' then
     Result:= 5 else
  if ResolutionValue = '320x200' then
     Result:= 6 else
  if ResolutionValue = '320x240' then
     Result:= 7 else
  if ResolutionValue = '320x256' then
     Result:= 8 else
  if ResolutionValue = '336x240' then
     Result:= 9 else
  if ResolutionValue = '352x240' then
     Result:= 10 else
  if ResolutionValue = '352x256' then
     Result:= 11 else
  if ResolutionValue = '368x224' then
     Result:= 12 else
  if ResolutionValue = '368x240' then
     Result:= 13 else
  if ResolutionValue = '368x256' then
     Result:= 14 else
  if ResolutionValue = '384x224' then
     Result:= 15 else
  if ResolutionValue = '384x240' then
     Result:= 16 else
  if ResolutionValue = '384x256' then
     Result:= 17 else
  if ResolutionValue = '400x300' then
     Result:= 18 else
  if ResolutionValue = '512x224' then
     Result:= 19 else
  if ResolutionValue = '512x256' then
     Result:= 20 else
  if ResolutionValue = '512x384' then
     Result:= 21 else
  if ResolutionValue = '512x448' then
     Result:= 22 else
  if ResolutionValue = '512x512' then
     Result:= 23 else
  if ResolutionValue = '640x350' then
     Result:= 24 else
  if ResolutionValue = '640x400' then
     Result:= 25 else
  if ResolutionValue = '640x480' then
     Result:= 26 else
  if ResolutionValue = '800x600' then
     Result:= 27 else
  if ResolutionValue = '1024x768' then
     Result:= 28 else
  if ResolutionValue = '1152x864' then
     Result:= 29 else
  if ResolutionValue = '1280x1024' then
     Result:= 30 else
  if ResolutionValue = '1600x1200' then
     Result:= 31 else
     Result:= 0;
end;

function TFormMain.SetDOSVesaMode(VesaModeValue: String): ShortInt;
begin
  if VesaModeValue = 'yes' then
     Result:= 0 else
  if VesaModeValue = 'no' then
     Result:= 1 else
  if VesaModeValue = 'vesa1' then
     Result:= 2 else
  if VesaModeValue = 'vesa2b' then
     Result:= 3 else
  if VesaModeValue = 'vesa2l' then
     Result:= 4 else
  if VesaModeValue = 'vesa3' then
     Result:= 5 else
     Result:= 0;
end;

function TFormMain.SetDOSScanlines(ScanlinesValue: String): ShortInt;
begin
  if ScanlinesValue = 'yes' then
     Result:= 0 else
  if ScanlinesValue = 'no' then
     Result:= 1 else
  if ScanlinesValue = 'horizontal' then
     Result:= 2 else
  if ScanlinesValue = 'vertical' then
     Result:= 3 else
     Result:= 0;
end;

function TFormMain.SetDOSJoystick(JoystickValue: String): ShortInt;
begin
  if JoystickValue = 'none' then
     Result:= 0 else
  if JoystickValue = 'auto' then
     Result:= 1 else
  if JoystickValue = 'standard' then
     Result:= 2 else
  if JoystickValue = 'dual' then
     Result:= 3 else
  if JoystickValue = '4button' then
     Result:= 4 else
  if JoystickValue = '6button' then
     Result:= 5 else
  if JoystickValue = '8button' then
     Result:= 6 else
  if JoystickValue = 'fspro' then
     Result:= 7 else
  if JoystickValue = 'wingex' then
     Result:= 8 else
  if JoystickValue = 'wingwarrior' then
     Result:= 9 else
  if JoystickValue = 'sidewinder' then
     Result:= 10 else
  if JoystickValue = 'gamepadpro' then
     Result:= 11 else
  if JoystickValue = 'grip' then
     Result:= 12 else
  if JoystickValue = 'grip4' then
     Result:= 13 else
  if JoystickValue = 'sneslpt1' then
     Result:= 14 else
  if JoystickValue = 'sneslpt2' then
     Result:= 15 else
  if JoystickValue = 'sneslpt3' then
     Result:= 16 else
  if JoystickValue = 'psxlpt1' then
     Result:= 17 else
  if JoystickValue = 'psxlpt2' then
     Result:= 18 else
  if JoystickValue = 'psxlpt3' then
     Result:= 19 else
  if JoystickValue = 'n64lpt1' then
     Result:= 20 else
  if JoystickValue = 'n64lpt2' then
     Result:= 21 else
  if JoystickValue = 'n64lpt3' then
     Result:= 22 else
  if JoystickValue = 'segaisa' then
     Result:= 23 else
  if JoystickValue = 'segapci' then
     Result:= 24 else
  if JoystickValue = 'db9lpt1' then
     Result:= 25 else
  if JoystickValue = 'db9lpt2' then
     Result:= 26 else
  if JoystickValue = 'db9lpt3' then
     Result:= 27 else
  if JoystickValue = 'tgxlpt1' then
     Result:= 28 else
  if JoystickValue = 'tgxlpt2' then
     Result:= 29 else
  if JoystickValue = 'tgxlpt3' then
     Result:= 30;
end;

procedure TFormMain.CreateMAMEIniFile(ExecutableString: String);
begin
  SetCurrentDir(ExtractFilePath(ExecutableString));
  RunProcess(SystemStr+ExecutableString+SystemStr+' -createconfig', True, SW_SHOWMINIMIZED, False);
  SetCurrentDir(FrontendPath);
end;

procedure TFormMain.ReadMAMEIniFile(ExecutableString: String);
var
  TextLine, Value: String;
  MAMEIniFile, ctrlrKeysList: THashedStringList;
  Loop: Integer;
begin
  if FileExists(ExtractFilePath(ExecutableString)+GetExecutableINIFileName(ExecutableString)) then
     begin
       ThousandSeparator:= Char(',');
       DecimalSeparator:= Char('.');
       MAMEIniFile:= THashedStringList.Create;
       MAMEIniFile.LoadFromFile(ExtractFilePath(ExecutableString)+GetExecutableINIFileName(ExecutableString));
       for Loop:=0 to MAMEIniFile.Count -1 do
       begin
         TextLine:= MAMEIniFile[Loop];
         with FormMAMEConfiguration do
         begin
           if (Pos('#', TextLine) <> 0) or (TextLine <> '') then
              begin
                if Copy(TextLine,1,7) = 'clones ' then
                   Clones.Checked:= Boolean(StrToInt(ExtractMAMEIniValue(TextLine)))
                else
                if Copy(TextLine,1,8) = 'rompath ' then
                   FolderROMs.Text:= ExtractMAMEIniValue(TextLine)
                else
                if Copy(TextLine,1,11) = 'samplepath ' then
                   FolderSamples.Text:= ExtractMAMEIniValue(TextLine)
                else
                if Copy(TextLine, 1, 10) = '# inipath ' then
                   FolderINIFiles.Text:= ''
                else
                if Copy(TextLine,1,8) = 'inipath ' then
                   begin
                     FolderINIFiles.Text:= ExtractMAMEIniValue(TextLine);
                     if FolderINIFiles.Text = '.;ini' then
                        FolderINIFiles.Text:= 'ini';
                   end
                else
                if Copy(TextLine,1,14) = 'cfg_directory ' then
                   FolderGamesConfiguration.Text:= ExtractMAMEIniValue(TextLine)
                else
                if Copy(TextLine,1,16) = 'nvram_directory ' then
                   FolderNVRAM.Text:= ExtractMAMEIniValue(TextLine)
                else
                if Copy(TextLine,1,18) = 'memcard_directory ' then
                   FolderMemoryCards.Text:= ExtractMAMEIniValue(TextLine)
                else
                if Copy(TextLine,1,16) = 'input_directory ' then
                   FolderInputsRecording.Text:= ExtractMAMEIniValue(TextLine)
                else
                if Copy(TextLine,1,18) = 'hiscore_directory ' then
                   FolderHighScores.Text:= ExtractMAMEIniValue(TextLine)
                else
                if Copy(TextLine,1,16) = 'state_directory ' then
                   FolderSaveStates.Text:= ExtractMAMEIniValue(TextLine)
                else
                if Copy(TextLine,1,18) = 'artwork_directory ' then
                   FolderArtworks.Text:= ExtractMAMEIniValue(TextLine)
                else
                if Copy(TextLine,1,19) = 'snapshot_directory ' then
                   FolderSnapshots.Text:= ExtractMAMEIniValue(TextLine)
                else
                if Copy(TextLine,1,15) = 'diff_directory ' then
                   FolderDiff.Text:= ExtractMAMEIniValue(TextLine)
                else
                if Copy(TextLine,1,11) = 'cheat_file ' then
                   FilenameCheat.Text:= ExtractMAMEIniValue(TextLine)
                else
                if Copy(TextLine,1,13) = 'history_file ' then
                   FilenameHistory.Text:= ExtractMAMEIniValue(TextLine)
                else
                if Copy(TextLine,1,14) = 'mameinfo_file ' then
                   FilenameMAMEInfo.Text:= ExtractMAMEIniValue(TextLine)
                else
                if Copy(TextLine,1,16) = 'ctrlr_directory ' then
                   begin
                     FolderKeysMapping.Text:= ExtractMAMEIniValue(TextLine);
                     ctrlrKeysList:= THashedStringList.Create;
                     if (Pos(':\', FolderKeysMapping.Text) > 0) or (Pos(':', FolderKeysMapping.Text) > 0) then
                        GetControllersList(ctrlrKeysList, FolderKeysMapping.Text)
                     else
                        GetControllersList(ctrlrKeysList, ExtractFilePath(ExecutableString)+FolderKeysMapping.Text);

                     if ctrlrKeysList.Count > 0 then
                        ControllerKeysMapping.Items.AddStrings(ctrlrKeysList);
                     FreeAndNil(ctrlrKeysList);
                   end
                else
                if Copy(TextLine,1,14) = 'autoframeskip ' then
                   AutoFrameSkip.Checked:= Boolean(StrToInt(ExtractMAMEIniValue(TextLine)))
                else
                if Copy(TextLine,1,10) = 'frameskip ' then
                   FrameSkip.Position:= StrToInt(ExtractMAMEIniValue(TextLine))
                else
                if Copy(TextLine,1,10) = 'waitvsync ' then
                   WaitVSync.Checked:= Boolean(StrToInt(ExtractMAMEIniValue(TextLine)))
                else
                if Copy(TextLine,1,13) = 'triplebuffer ' then
                   TripleBuffer.Checked:= Boolean(StrToInt(ExtractMAMEIniValue(TextLine)))
                else
                if Copy(TextLine,1,7) = 'window ' then
                   Window.Checked:= Boolean(StrToInt(ExtractMAMEIniValue(TextLine)))
                else
                if Copy(TextLine,1,6) = 'ddraw ' then
                   DirectDraw.Checked:= Boolean(StrToInt(ExtractMAMEIniValue(TextLine)))
                else
                if Copy(TextLine,1,10) = 'hwstretch ' then
                   HardwareStretch.Checked:= Boolean(StrToInt(ExtractMAMEIniValue(TextLine)))
                else
                if Copy(TextLine,1,11) = 'resolution ' then
                   begin
                     Value:= IntToStr(FormMain.SetResolution(ExtractMAMEIniValue(TextLine)));
                     if Value = '-1' then
                        CustomResolution.Text:= Value
                     else
                        Resolution.Position:= StrToInt(Value);
                   end
                else
                if Copy(TextLine,1,8) = 'refresh ' then
                   RefreshRate.Position:= StrToInt(ExtractMAMEIniValue(TextLine))
                else
                if Copy(TextLine,1,10) = 'scanlines ' then
                   Scanlines.Checked:= Boolean(StrToInt(ExtractMAMEIniValue(TextLine)))
                 else
                if Copy(TextLine,1,10) = 'switchres ' then
                   SwitchResolution.Checked:= Boolean(StrToInt(ExtractMAMEIniValue(TextLine)))
                else
                if Copy(TextLine,1,10) = 'switchbpp ' then
                   SwitchColorDepth.Checked:= Boolean(StrToInt(ExtractMAMEIniValue(TextLine)))
                else
                if Copy(TextLine,1,9) = 'maximize ' then
                   Maximize.Checked:= Boolean(StrToInt(ExtractMAMEIniValue(TextLine)))
                else
                if Copy(TextLine,1,11) = 'keepaspect ' then
                   KeepAspectRatio.Checked:= Boolean(StrToInt(ExtractMAMEIniValue(TextLine)))
                else
                if Copy(TextLine,1,13) = 'matchrefresh ' then
                   MatchRefreshRate.Checked:= Boolean(StrToInt(ExtractMAMEIniValue(TextLine)))
                else
                if Copy(TextLine,1,12) = 'syncrefresh ' then
                   SyncronizeRefreshRate.Checked:= Boolean(StrToInt(ExtractMAMEIniValue(TextLine)))
                else
                if Copy(TextLine,1,9) = 'throttle ' then
                   Throttle.Checked:= Boolean(StrToInt(ExtractMAMEIniValue(TextLine)))
                else
                if Copy(TextLine,1,23) = 'full_screen_brightness ' then
                   FullScreenBrightness.Position:= StrToFloat(Format('%1.2f', [StrToFloat(ExtractMAMEIniValue(TextLine))]))
                else
                if Copy(TextLine,1,14) = 'frames_to_run ' then
                   FramesToRun.Position:= StrToInt(ExtractMAMEIniValue(TextLine))
                else
                if Copy(TextLine,1,7) = 'effect ' then
                   Effect.Position:= SetBlitterEffect(ExtractMAMEIniValue(TextLine))
                else
                if Copy(TextLine, 1, 14) = 'screen_aspect ' then
                   begin
                     ScreenAspect.Position:= SetDefaultAspectRatio(ExtractMAMEIniValue(TextLine));
                   end
                else
                if Copy(TextLine, 1, 6) = 'sleep ' then
                   Sleep.Checked:= Boolean(StrToInt(ExtractMAMEIniValue(TextLine)))
                else
                if Copy(TextLine, 1, 6) = 'rdtsc ' then
                   rdtsc.Checked:= Boolean(StrToInt(ExtractMAMEIniValue(TextLine)))
                else
                if Copy(TextLine,1,6) = 'mouse ' then
                   Mouse.Checked:= Boolean(StrToInt(ExtractMAMEIniValue(TextLine)))
                else
                if Copy(TextLine,1,9) = 'joystick ' then
                   Joystick.Checked:= Boolean(StrToInt(ExtractMAMEIniValue(TextLine)))
                else
                if Copy(TextLine,1,9) = 'lightgun ' then
                   Lightgun.Checked:= Boolean(StrToInt(ExtractMAMEIniValue(TextLine)))
                else
                if Copy(TextLine,1,10) = 'steadykey ' then
                   SteadyKey.Checked:= Boolean(StrToInt(ExtractMAMEIniValue(TextLine)))
                else
                if Copy(TextLine,1,14) = 'keyboard_leds ' then
                   KeyboardLEDs.Checked:= Boolean(StrToInt(ExtractMAMEIniValue(TextLine)))
                else
                if Copy(TextLine,1,13) = 'a2d_deadzone ' then
                   AnalogDigitalDeadzone.Position:= StrToFloat(Format('%1.2f', [StrToFloat(ExtractMAMEIniValue(TextLine))]))
                else
                if Copy(TextLine, 1, 8) = '# ctrlr ' then
                   ControllerKeysMapping.ItemIndex:= 0
                else
                if Copy(TextLine, 1, 6) = 'ctrlr ' then
                    begin
                      ControllerKeysMapping.ItemIndex:= ControllerKeysMapping.Items.IndexOf(ExtractMAMEiniValue(TextLine));
                      if ControllerKeysMapping.ItemIndex = -1 then
                         ControllerKeysMapping.ItemIndex:= 0;
                    end
                else
                if Copy(TextLine,1,9) = 'norotate ' then
                   NoRotate.Checked:= Boolean(StrToInt(ExtractMAMEIniValue(TextLine)))
                else
                if Copy(TextLine,1,4) = 'ror ' then
                   RotateRight.Checked:= Boolean(StrToInt(ExtractMAMEIniValue(TextLine)))
                else
                if Copy(TextLine,1,4) = 'rol ' then
                   RotateLeft.Checked:= Boolean(StrToInt(ExtractMAMEIniValue(TextLine)))
                else
                if Copy(TextLine,1,6) = 'flipx ' then
                   FlipX.Checked:= Boolean(StrToInt(ExtractMAMEIniValue(TextLine)))
                else
                if Copy(TextLine,1,6) = 'flipy ' then
                   FlipY.Checked:= Boolean(StrToInt(ExtractMAMEIniValue(TextLine)))
                else
                if Copy(TextLine,1,17) = 'debug_resolution ' then
                   DebuggerResolution.Position:= SetDOSResolution(LowerCase(ExtractMAMEIniValue(TextLine)))
                else
                if Copy(TextLine,1,6) = 'gamma ' then
                   Gamma.Position:= StrToFloat(Format('%1.2f', [StrToFloat(ExtractMAMEIniValue(TextLine))]))
                else
                if Copy(TextLine,1,11) = 'brightness ' then
                   Brightness.Position:= StrToFloat(Format('%1.2f', [StrToFloat(ExtractMAMEIniValue(TextLine))]))
                else
                if Copy(TextLine, 1, 17) = 'pause_brightness ' then
                   PauseBrightness.Position:= StrToFloat(Format('%1.2f', [StrToFloat(ExtractMAMEIniValue(TextLine))]))
                else
                if Copy(TextLine,1,10) = 'antialias ' then
                   Antialias.Checked:= Boolean(StrToInt(ExtractMAMEIniValue(TextLine)))
                else
                if Copy(TextLine,1,13) = 'translucency ' then
                   Translucency.Checked:= Boolean(StrToInt(ExtractMAMEIniValue(TextLine)))
                else
                if Copy(TextLine,1,5) = 'beam ' then
                   Beam.Position:= StrToFloat(Format('%2.2f', [StrToFloat(ExtractMAMEIniValue(TextLine))]))
                else
                if Copy(TextLine,1,8) = 'flicker ' then
                   Flicker.Position:= StrToFloat(Format('%3.2f', [StrToFloat(ExtractMAMEIniValue(TextLine))]))
                else
                if Copy(TextLine,1,10) = 'intensity ' then
                   Intensity.Position:= StrToFloat(Format('%1.2f', [StrToFloat(ExtractMAMEIniValue(TextLine))]))
                else
                if Copy(TextLine,1,11) = 'samplerate ' then
                   begin
                     Value:= ExtractMAMEIniValue(TextLine);
                     case StrToInt(Value) of
                       11025: SampleRate.Position:= 0;
                       22050: SampleRate.Position:= 1;
                       44100: SampleRate.Position:= 2;
                       48000: SampleRate.Position:= 3;
                       else   CustomSampleRate.Position:= StrToInt(Value);
                     end;
                   end
                else
                if Copy(TextLine,1,8) = 'samples ' then
                   Samples.Checked:= Boolean(StrToInt(ExtractMAMEIniValue(TextLine)))
                else
                if Copy(TextLine,1,15) = 'resamplefilter ' then
                   ResampleFilter.Checked:= Boolean(StrToInt(ExtractMAMEIniValue(TextLine)))
                else
                if Copy(TextLine,1,6) = 'sound ' then
                   Sound.Checked:= Boolean(StrToInt(ExtractMAMEIniValue(TextLine)))
                else
                if Copy(TextLine,1,7) = 'volume ' then
                   Volume.Position:= StrToInt(ExtractMAMEIniValue(TextLine))
                else
                if Copy(TextLine,1,8) = 'artwork ' then
                   Artwork.Checked:= Boolean(StrToInt(ExtractMAMEIniValue(TextLine)))
                else
                if Copy(TextLine,1,14) = 'use_backdrops ' then
                   Backdrop.Checked:= Boolean(StrToInt(ExtractMAMEIniValue(TextLine)))
                else
                if Copy(TextLine,1,13) = 'use_overlays ' then
                   Overlay.Checked:= Boolean(StrToInt(ExtractMAMEIniValue(TextLine)))
                else
                if Copy(TextLine,1,11) = 'use_bezels ' then
                   Bezel.Checked:= Boolean(StrToInt(ExtractMAMEIniValue(TextLine)))
                else
                if Copy(TextLine,1,13) = 'artwork_crop ' then
                   Crop.Checked:= Boolean(StrToInt(ExtractMAMEIniValue(TextLine)))
                else
                if Copy(TextLine,1,19) = 'artwork_resolution ' then
                   ArtworkResolution.Position:= StrToInt(ExtractMAMEIniValue(TextLine))
                else
                if Copy(TextLine,1,6) = 'cheat ' then
                   Cheat.Checked:= Boolean(StrToInt(ExtractMAMEIniValue(TextLine)))
                else
                if Copy(TextLine,1,6) = 'debug ' then
                   Debug.Checked:= Boolean(StrToInt(ExtractMAMEIniValue(TextLine)))
                else
                if Copy(TextLine,1,4) = 'log ' then
                   Log.Checked:= Boolean(StrToInt(ExtractMAMEIniValue(TextLine)))
                else
                if Copy(TextLine, 1, 6) = 'oslog ' then
                   OSDebug.Checked:= Boolean(StrToInt(ExtractMAMEIniValue(TextLine)))
                else
                if Copy(TextLine, 1, 16) = 'skip_disclaimer ' then
                   SkipDisclaimer.Checked:= Boolean(StrToInt(ExtractMAMEIniValue(TextLine)))
                else
                if Copy(TextLine, 1, 14) = 'skip_gameinfo ' then
                   SkipGameInfo.Checked:= Boolean(StrToInt(ExtractMAMEIniValue(TextLine)))
                else
                if Copy(TextLine,1,11) = 'readconfig ' then
                   ReadConfigFile.Checked:= Boolean(StrToInt(ExtractMAMEIniValue(TextLine)))
                else
                if Copy(TextLine,1,8) = 'verbose ' then
                   Verbose.Checked:= Boolean(StrToInt(ExtractMAMEIniValue(TextLine)));
              end;
         end;
       end;
       FreeAndNil(MAMEIniFile);
     end;
end;

procedure TFormMain.UpdateMAMEIniFile(ExecutableString: String);
var
  MAMEIniFile: THashedStringList;
  Loop: Integer;
begin
  MAMEIniFile:= THashedStringList.Create;
  MAMEIniFile.LoadFromFile(ExtractFilePath(ExecutableString)+GetExecutableINIFileName(ExecutableString));
  for Loop:=0 to MAMEIniFile.Count-1 do
  begin
    if (Pos('#', MAMEIniFile[Loop]) <> 0) or (MAMEIniFile[Loop] <> '') then
       begin
         if Copy(MAMEIniFile[Loop],1,7) = 'clones ' then
            MAMEIniFile[Loop]:= 'clones                  '+IntToStr(Ord(FormMAMEConfiguration.Clones.Checked))
         else
         if Copy(MAMEIniFile[Loop],1,8) = 'rompath ' then
            MAMEIniFile[Loop]:= 'rompath                 '+FormMAMEConfiguration.FolderROMs.Text
         else
         if Copy(MAMEIniFile[Loop],1,11) = 'samplepath ' then
            MAMEIniFile[Loop]:= 'samplepath              '+FormMAMEConfiguration.FolderSamples.Text
         else
         if (Copy(MAMEIniFile[Loop], 1, 8) =  'inipath ') or (Copy(MAMEIniFile[Loop], 1, 10) =  '# inipath ') then
            begin
              if FormMAMEConfiguration.FolderSamples.Text = '' then
                 MAMEIniFile[Loop]:= '# inipath               <NULL> (not set)'
              else
                 MAMEIniFile[Loop]:= 'inipath                 '+FormMAMEConfiguration.FolderINIFiles.Text;
            end
         else
         if Copy(MAMEIniFile[Loop],1,14) = 'cfg_directory ' then
            MAMEIniFile[Loop]:= 'cfg_directory           '+FormMAMEConfiguration.FolderGamesConfiguration.Text
         else
         if Copy(MAMEIniFile[Loop],1,16) = 'nvram_directory ' then
            MAMEIniFile[Loop]:= 'nvram_directory         '+FormMAMEConfiguration.FolderNVRAM.Text
         else
         if Copy(MAMEIniFile[Loop],1,18) = 'memcard_directory ' then
            MAMEIniFile[Loop]:= 'memcard_directory       '+FormMAMEConfiguration.FolderMemoryCards.Text
         else
         if Copy(MAMEIniFile[Loop],1,16) = 'input_directory ' then
            MAMEIniFile[Loop]:= 'input_directory         '+FormMAMEConfiguration.FolderInputsRecording.Text
         else
         if Copy(MAMEIniFile[Loop],1,18) = 'hiscore_directory ' then
            MAMEIniFile[Loop]:= 'hiscore_directory       '+FormMAMEConfiguration.FolderHighScores.Text
         else
         if Copy(MAMEIniFile[Loop],1,16) = 'state_directory ' then
            MAMEIniFile[Loop]:= 'state_directory         '+FormMAMEConfiguration.FolderSaveStates.Text
         else
         if Copy(MAMEIniFile[Loop],1,18) = 'artwork_directory ' then
            MAMEIniFile[Loop]:= 'artwork_directory       '+FormMAMEConfiguration.FolderArtworks.Text
         else
         if Copy(MAMEIniFile[Loop],1,15) = 'diff_directory ' then
            MAMEIniFile[Loop]:= 'diff_directory          '+FormMAMEConfiguration.FolderDiff.Text
         else
         if Copy(MAMEIniFile[Loop],1,19) = 'snapshot_directory ' then
            MAMEIniFile[Loop]:= 'snapshot_directory      '+FormMAMEConfiguration.FolderSnapshots.Text
         else
         if Copy(MAMEIniFile[Loop],1,11) = 'cheat_file ' then
            MAMEIniFile[Loop]:= 'cheat_file              '+FormMAMEConfiguration.FilenameCheat.Text
         else
         if Copy(MAMEIniFile[Loop],1,13) = 'history_file ' then
            MAMEIniFile[Loop]:= 'history_file            '+FormMAMEConfiguration.FilenameHistory.Text
         else
         if Copy(MAMEIniFile[Loop],1,14) = 'mameinfo_file ' then
            MAMEIniFile[Loop]:= 'mameinfo_file           '+FormMAMEConfiguration.FilenameMAMEInfo.Text
         else
         if Copy(MAMEIniFile[Loop],1,16) = 'ctrlr_directory ' then
            MAMEIniFile[Loop]:= 'ctrlr_directory         '+FormMAMEConfiguration.FolderKeysMapping.Text
         else
         if Copy(MAMEIniFile[Loop],1,14) = 'autoframeskip ' then
            MAMEIniFile[Loop]:= 'autoframeskip           '+IntToStr(Ord(FormMAMEConfiguration.AutoFrameSkip.Checked))
         else
         if Copy(MAMEIniFile[Loop],1,10) = 'frameskip ' then
            MAMEIniFile[Loop]:= 'frameskip               '+IntToStr(FormMAMEConfiguration.FrameSkip.Position)
         else
         if Copy(MAMEIniFile[Loop],1,10) = 'waitvsync ' then
            MAMEIniFile[Loop]:= 'waitvsync               '+IntToStr(Ord(FormMAMEConfiguration.WaitVSync.Checked))
         else
         if Copy(MAMEIniFile[Loop],1,13) = 'triplebuffer ' then
            MAMEIniFile[Loop]:= 'triplebuffer            '+IntToStr(Ord(FormMAMEConfiguration.TripleBuffer.Checked))
         else
         if Copy(MAMEIniFile[Loop],1,7) = 'window ' then
            MAMEIniFile[Loop]:= 'window                  '+IntToStr(Ord(FormMAMEConfiguration.Window.Checked))
         else
         if Copy(MAMEIniFile[Loop],1,6) = 'ddraw ' then
            MAMEIniFile[Loop]:= 'ddraw                   '+IntToStr(Ord(FormMAMEConfiguration.DirectDraw.Checked))
         else
         if Copy(MAMEIniFile[Loop],1,10) = 'hwstretch ' then
            MAMEIniFile[Loop]:= 'hwstretch               '+IntToStr(Ord(FormMAMEConfiguration.HardwareStretch.Checked))
         else
         if Copy(MAMEIniFile[Loop],1,11) = 'resolution ' then
            begin
              if FormMAMEConfiguration.CustomResolution.Text = '' then
                 MAMEIniFile[Loop]:= 'resolution              '+LowerCase(FormMAMEConfiguration.LabelResolutionValue.Caption)
              else
                 MAMEIniFile[Loop]:= 'resolution              '+LowerCase(FormMAMEConfiguration.CustomResolution.Text);
            end
         else
         if Copy(MAMEIniFile[Loop],1,8) = 'refresh ' then
            MAMEIniFile[Loop]:= 'refresh                 '+IntToStr(FormMAMEConfiguration.RefreshRate.Position)
         else
         if Copy(MAMEIniFile[Loop],1,10) = 'scanlines ' then
            MAMEIniFile[Loop]:= 'scanlines               '+IntToStr(Ord(FormMAMEConfiguration.Scanlines.Checked))
         else
         if Copy(MAMEIniFile[Loop],1,10) = 'switchres ' then
            MAMEIniFile[Loop]:= 'switchres               '+IntToStr(Ord(FormMAMEConfiguration.SwitchResolution.Checked))
         else
         if Copy(MAMEIniFile[Loop],1,10) = 'switchbpp ' then
            MAMEIniFile[Loop]:= 'switchbpp               '+IntToStr(Ord(FormMAMEConfiguration.SwitchColorDepth.Checked))
         else
         if Copy(MAMEIniFile[Loop],1,9) = 'maximize ' then
            MAMEIniFile[Loop]:= 'maximize                '+IntToStr(Ord(FormMAMEConfiguration.Maximize.Checked))
         else
         if Copy(MAMEIniFile[Loop],1,11) = 'keepaspect ' then
            MAMEIniFile[Loop]:= 'keepaspect              '+IntToStr(Ord(FormMAMEConfiguration.KeepAspectRatio.Checked))
         else
         if Copy(MAMEIniFile[Loop],1,13) = 'matchrefresh ' then
            MAMEIniFile[Loop]:= 'matchrefresh            '+IntToStr(Ord(FormMAMEConfiguration.MatchRefreshRate.Checked))
         else
         if Copy(MAMEIniFile[Loop],1,12) = 'syncrefresh ' then
            MAMEIniFile[Loop]:= 'syncrefresh             '+IntToStr(Ord(FormMAMEConfiguration.SyncronizeRefreshRate.Checked))
         else
         if Copy(MAMEIniFile[Loop],1,9) = 'throttle ' then
            MAMEIniFile[Loop]:= 'throttle                '+IntToStr(Ord(FormMAMEConfiguration.Throttle.Checked))
         else
         if Copy(MAMEIniFile[Loop],1,23) = 'full_screen_brightness ' then
            MAMEIniFile[Loop]:= 'full_screen_brightness   '+FormMAMEConfiguration.LabelFullScreenBrightnessValue.Caption
         else
         if Copy(MAMEIniFile[Loop],1,14) = 'frames_to_run ' then
            MAMEIniFile[Loop]:= 'frames_to_run           '+IntToStr(FormMAMEConfiguration.FramesToRun.Position)
         else
         if Copy(MAMEIniFile[Loop],1,7) = 'effect ' then
            begin
              case FormMAMEConfiguration.Effect.Position of
                 0: MAMEIniFile[Loop]:= 'effect                  none';
                 1: MAMEIniFile[Loop]:= 'effect                  scan25';
                 2: MAMEIniFile[Loop]:= 'effect                  scan50';
                 3: MAMEIniFile[Loop]:= 'effect                  scan75';
                 4: MAMEIniFile[Loop]:= 'effect                  rgb16';
                 5: MAMEIniFile[Loop]:= 'effect                  rgb6';
                 6: MAMEIniFile[Loop]:= 'effect                  rgb4';
                 7: MAMEIniFile[Loop]:= 'effect                  rgb4v';
                 8: MAMEIniFile[Loop]:= 'effect                  rgb3';
                 9: MAMEIniFile[Loop]:= 'effect                  rgbtiny';
                10: MAMEIniFile[Loop]:= 'effect                  scan75v';
                11: MAMEIniFile[Loop]:= 'effect                  sharp';
              end;
            end
         else
         if Copy(MAMEIniFile[Loop],1,14) = 'screen_aspect ' then
            MAMEIniFile[Loop]:= 'screen_aspect           '+FormMAMEConfiguration.LabelScreenAspectValue.Caption
         else
         if Copy(MAMEIniFile[Loop],1,6) = 'sleep ' then
            MAMEIniFile[Loop]:= 'sleep                   '+IntToStr(Ord(FormMAMEConfiguration.Sleep.Checked))
         else
         if Copy(MAMEIniFile[Loop], 1, 6) = 'rdtsc ' then
            MAMEIniFile[Loop]:= 'rdtsc                   '+IntToStr(Ord(FormMAMEConfiguration.rdtsc.Checked))
         else
         if Copy(MAMEIniFile[Loop],1,6) = 'mouse ' then
            MAMEIniFile[Loop]:= 'mouse                   '+IntToStr(Ord(FormMAMEConfiguration.Mouse.Checked))
         else
         if Copy(MAMEIniFile[Loop],1,9) = 'joystick ' then
            MAMEIniFile[Loop]:= 'joystick                '+IntToStr(Ord(FormMAMEConfiguration.Joystick.Checked))
         else
         if Copy(MAMEIniFile[Loop],1,9) = 'lightgun ' then
            MAMEIniFile[Loop]:= 'lightgun                '+IntToStr(Ord(FormMAMEConfiguration.Lightgun.Checked))
         else
         if Copy(MAMEIniFile[Loop], 1, 10) = 'steadykey ' then
            MAMEIniFile[Loop]:= 'steadykey               '+IntToStr(Ord(FormMAMEConfiguration.SteadyKey.Checked))
         else
         if Copy(MAMEIniFile[Loop],1,14) = 'keyboard_leds ' then
            MAMEIniFile[Loop]:= 'keyboard_leds           '+IntToStr(Ord(FormMAMEConfiguration.KeyboardLEDs.Checked))
         else
         if Copy(MAMEIniFile[Loop],1,13) = 'a2d_deadzone ' then
            MAMEIniFile[Loop]:= 'a2d_deadzone            '+FormMAMEConfiguration.LabelAnalogDigitalDeadzoneValue.Caption
         else
         if (Copy(MAMEIniFile[Loop], 1, 8) = '# ctrlr ') or (Copy(MAMEIniFile[Loop], 1, 6) = 'ctrlr ') then
            begin
              if FormMAMEConfiguration.ControllerKeysMapping.ItemIndex = 0 then
                 MAMEIniFile[Loop]:= '# ctrlr                 <NULL> (not set)'
              else
                 MAMEIniFile[Loop]:= 'ctrlr                   '+FormMAMEConfiguration.ControllerKeysMapping.Text;
            end
         else
         if Copy(MAMEIniFile[Loop],1,9) = 'norotate ' then
            MAMEIniFile[Loop]:= 'norotate                '+IntToStr(Ord(FormMAMEConfiguration.NoRotate.Checked))
         else
         if Copy(MAMEIniFile[Loop],1,4) = 'ror ' then
            MAMEIniFile[Loop]:= 'ror                     '+IntToStr(Ord(FormMAMEConfiguration.RotateRight.Checked))
         else
         if Copy(MAMEIniFile[Loop],1,4) = 'rol ' then
            MAMEIniFile[Loop]:= 'rol                     '+IntToStr(Ord(FormMAMEConfiguration.RotateLeft.Checked))
         else
         if Copy(MAMEIniFile[Loop],1,6) = 'flipx ' then
            MAMEIniFile[Loop]:= 'flipx                   '+IntToStr(Ord(FormMAMEConfiguration.FlipX.Checked))
         else
         if Copy(MAMEIniFile[Loop],1,6) = 'flipy ' then
            MAMEIniFile[Loop]:= 'flipy                   '+IntToStr(Ord(FormMAMEConfiguration.FlipY.Checked))
         else
         if Copy(MAMEIniFile[Loop],1,17) = 'debug_resolution ' then
            MAMEIniFile[Loop]:= 'debug_resolution        '+ LowerCase(FormMAMEConfiguration.LabelDebuggerResolutionValue.Caption)
         else
         if Copy(MAMEIniFile[Loop],1,6) = 'gamma ' then
            MAMEIniFile[Loop]:= 'gamma                   '+FormMAMEConfiguration.LabelGammaValue.Caption
         else
         if Copy(MAMEIniFile[Loop],1,11) = 'brightness ' then
            MAMEIniFile[Loop]:= 'brightness              '+FormMAMEConfiguration.LabelBrightnessValue.Caption
         else
         if Copy(MAMEIniFile[Loop], 1, 17) = 'pause_brightness ' then
            MAMEIniFile[Loop]:= 'pause_brightness        '+FormMAMEConfiguration.LabelPauseBrightnessValue.Caption
         else
         if Copy(MAMEIniFile[Loop],1,10) = 'antialias ' then
            MAMEIniFile[Loop]:= 'antialias               '+IntToStr(Ord(FormMAMEConfiguration.Antialias.Checked))
         else
         if Copy(MAMEIniFile[Loop],1,13) = 'translucency ' then
            MAMEIniFile[Loop]:= 'translucency            '+IntToStr(Ord(FormMAMEConfiguration.Translucency.Checked))
         else
         if Copy(MAMEIniFile[Loop],1,5) = 'beam ' then
            MAMEIniFile[Loop]:= 'beam                    '+FormMAMEConfiguration.LabelBeamValue.Caption
         else
         if Copy(MAMEIniFile[Loop],1,8) = 'flicker ' then
            MAMEIniFile[Loop]:= 'flicker                 '+FormMAMEConfiguration.LabelFlickerValue.Caption
         else
         if Copy(MAMEIniFile[Loop],1,10) = 'intensity ' then
            MAMEIniFile[Loop]:= 'intensity               '+FormMAMEConfiguration.LabelIntensityValue.Caption
         else
         if Copy(MAMEIniFile[Loop],1,11) = 'samplerate ' then
            begin
              if FormMAMEConfiguration.CustomSampleRate.Position > 4999 then
                 MAMEIniFile[Loop]:= 'samplerate              '+IntToStr(FormMAMEConfiguration.CustomSampleRate.Position)
              else
                 begin
                   case FormMAMEConfiguration.SampleRate.Position of
                     0: MAMEIniFile[Loop]:= 'samplerate              11025';
                     1: MAMEIniFile[Loop]:= 'samplerate              22050';
                     2: MAMEIniFile[Loop]:= 'samplerate              44100';
                     3: MAMEIniFile[Loop]:= 'samplerate              48000';
                   end;
                 end;
            end
         else
         if Copy(MAMEIniFile[Loop],1,8) = 'samples ' then
            MAMEIniFile[Loop]:= 'samples                 '+IntToStr(Ord(FormMAMEConfiguration.Samples.Checked))
         else
         if Copy(MAMEIniFile[Loop],1,15) = 'resamplefilter ' then
            MAMEIniFile[Loop]:= 'resamplefilter          '+IntToStr(Ord(FormMAMEConfiguration.ResampleFilter.Checked))
         else
         if Copy(MAMEIniFile[Loop],1,6) = 'sound ' then
            MAMEIniFile[Loop]:= 'sound                   '+IntToStr(Ord(FormMAMEConfiguration.Sound.Checked))
         else
         if Copy(MAMEIniFile[Loop],1,7) = 'volume ' then
            MAMEIniFile[Loop]:= 'volume                  '+IntToStr(FormMAMEConfiguration.Volume.Position)
         else
         if Copy(MAMEIniFile[Loop],1,8) = 'artwork ' then
            MAMEIniFile[Loop]:= 'artwork                 '+IntToStr(Ord(FormMAMEConfiguration.Artwork.Checked))
         else
         if Copy(MAMEIniFile[Loop],1,14) = 'use_backdrops ' then
            MAMEIniFile[Loop]:= 'use_backdrops           '+IntToStr(Ord(FormMAMEConfiguration.Backdrop.Checked))
         else
         if Copy(MAMEIniFile[Loop],1,13) = 'use_overlays ' then
            MAMEIniFile[Loop]:= 'use_overlays            '+IntToStr(Ord(FormMAMEConfiguration.Overlay.Checked))
         else
         if Copy(MAMEIniFile[Loop],1,11) = 'use_bezels ' then
            MAMEIniFile[Loop]:= 'use_bezels              '+IntToStr(Ord(FormMAMEConfiguration.Bezel.Checked))
         else
         if Copy(MAMEIniFile[Loop],1,13) = 'artwork_crop ' then
            MAMEIniFile[Loop]:= 'artwork_crop            '+IntToStr(Ord(FormMAMEConfiguration.Crop.Checked))
         else
         if Copy(MAMEIniFile[Loop],1,19) = 'artwork_resolution ' then
            MAMEIniFile[Loop]:= 'artwork_resolution      '+IntToStr(FormMAMEConfiguration.ArtworkResolution.Position)
         else
         if Copy(MAMEIniFile[Loop],1,6) = 'cheat ' then
            MAMEIniFile[Loop]:= 'cheat                   '+IntToStr(Ord(FormMAMEConfiguration.Cheat.Checked))
         else
         if Copy(MAMEIniFile[Loop],1,6) = 'debug ' then
            MAMEIniFile[Loop]:= 'debug                   '+IntToStr(Ord(FormMAMEConfiguration.Debug.Checked))
         else
         if Copy(MAMEIniFile[Loop],1,4) = 'log ' then
            MAMEIniFile[Loop]:= 'log                     '+IntToStr(Ord(FormMAMEConfiguration.Log.Checked))
         else
         if Copy(MAMEIniFile[Loop], 1, 6) = 'oslog ' then
            MAMEIniFile[Loop]:= 'oslog                   '+IntToStr(Ord(FormMAMEConfiguration.OSDebug.Checked))
         else
         if Copy(MAMEIniFile[Loop], 1, 16) = 'skip_disclaimer ' then
            MAMEIniFile[Loop]:= 'skip_disclaimer         '+IntToStr(Ord(FormMAMEConfiguration.SkipDisclaimer.Checked))
         else
         if Copy(MAMEIniFile[Loop], 1, 14) = 'skip_gameinfo ' then
            MAMEIniFile[Loop]:= 'skip_gameinfo           '+IntToStr(Ord(FormMAMEConfiguration.SkipGameInfo.Checked))
         else
         if Copy(MAMEIniFile[Loop],1,11) = 'readconfig ' then
            MAMEIniFile[Loop]:= 'readconfig              '+IntToStr(Ord(FormMAMEConfiguration.ReadConfigFile.Checked))
         else
         if Copy(MAMEIniFile[Loop],1,8) = 'verbose ' then
            MAMEIniFile[Loop]:= 'verbose                 '+IntToStr(Ord(FormMAMEConfiguration.Verbose.Checked));
       end;
  end;
  MAMEIniFile.SaveToFile(ExtractFilePath(ExecutableString)+GetExecutableINIFileName(ExecutableString));
  FreeAndNil(MAMEIniFile);
end;

function TFormMain.GetPlayTime(Milliseconds: Int64): String;
var
  Hours, Minutes, Seconds, Days: Int64;
  Sec: Int64;
begin
  Sec:= Milliseconds div 1000;
  Days:= Sec div (3600*24);
  Hours:= (Sec-((Days*(3600*24)))) div 3600;
  Minutes:= (Sec-((Days*(3600*24))+(Hours*3600))) div 60;
  Seconds:= (Sec-((Days*(3600*24)) + (Hours*3600)+ (Minutes*60)));
  Result:= Format(GetLanguageText('Messages', 'DaysHoursPlayedMsg', '%.2d Days, %.2d:%.2d:%.2d hs'), [Days, Hours, Minutes, Seconds]);
end;

procedure TFormMain.ExecuteGame(GameName: String; RunStandard: Boolean; ShowAverageFPS: Boolean);
var
  ExeType: String[5];
  CommandLine, NewOption, NewOption2: String;
  Found2ndExecutable, Found3rdExecutable, Found4thExecutable, Found5thExecutable, UseCustomCommandLine: Boolean;
  OriginalFile: TIniFile;
  NewFile, CustomGame: THashedStringList;
  StartClock, EndClock: Int64;
  EmulatorFormat: Byte;

  function CheckGameDriverCustomCmd: String;
  var
    DriverName: String[12];
  begin
    DriverName:= GamesList[SelectedGame].eDriver;
    Delete(DriverName, Length(DriverName)-1, 2);
    case FileExists(FrontendPath+'resources\drvcustomcmd\'+DriverName+'.ini') of
      True : Result:= DriverName;
      False: Result:= 'Not Found';
    end;
  end;

  function SetCustomCmdDir(CommandLineCmd: String): String;
  var
    cmd: String;
  begin
    cmd:= CommandLineCmd;
    if cmd[1] = '"' then
       begin
         Delete(cmd, 1, 1);
         Delete(cmd, Length(cmd), 1);
       end;
    Result:= cmd;
  end;

  function CheckDOSoption(MAMEentry, FloatFormat: String): String;
  var
    OriginalValue: String;
  begin
    if FloatFormat = '' then
       OriginalValue:= OriginalFile.ReadString('config', MAMEentry, '')
    else
       OriginalValue:= (Format(FloatFormat, [OriginalFile.ReadFloat('config', 'beam', 10000)]));
    if OriginalValue = '10000' then // option doesn't exist on mame.cfg ???
       OriginalValue:= '';
       
    NewOption:= NewFile.Values[MAMEentry];
    if (OriginalValue = '') and (NewOption = '') then
       Result:= 'error'
    else
    if (NewOption <> OriginalValue) and (NewOption <> '') then
       Result:= NewOption
    else
       Result:= 'error';
  end;

begin
  if List.Selected = nil then
     Exit;
  Found2ndExecutable:= True;
  Found3rdExecutable:= True;
  Found4thExecutable:= True;
  Found5thExecutable:= True;
  UseCustomCommandLine:= False;
  if GamesList[SelectedGame].eROMIdentification in [12..15] then
     begin
       GenerateMessage(GetLanguageText('Messages', 'WarningTitle', 'Warning'),
                       GetLanguageText('Messages', 'BiosROMMsg', 'This is a Bios ROM. Please, select a valid game to play!'), 2);
     end
  else
  begin
    if GamesList[SelectedGame].eROMIdentification in [0..11] then
      begin
        case ButtonExecutablesMode.Tag of
          1:
            begin
              case FileExists(EmulatorExecutable[1]) of
                True:
                  begin
                    CommandLine:= SystemStr+EmulatorExecutable[1]+SystemStr+' '+GameName;
                    ExeType:= ExeStrings[GetExeType(EmulatorExecutable[1])];
                    EmulatorFormat:= EmulatorType[1];
                  end;
                False:
                  begin
                    GenerateMessage(GetLanguageText('Messages', 'FileNotFoundTitle', 'File Not Found'),
                                    GetLanguageText('Messages', 'Emulator1NotFoundMsg', '1st emulator not found. Aborted...'), 2);
                    Exit;
                  end;
              end;
            end;
          2:
            begin
              case FileExists(EmulatorExecutable[2]) of
                True:
                  begin
                    CommandLine:= SystemStr+EmulatorExecutable[2]+SystemStr+' '+GameName;
                    ExeType:= ExeStrings[GetExeType(EmulatorExecutable[2])];
                    EmulatorFormat:= EmulatorType[2];
                  end;
                False:
                  begin
                    case FileExists(EmulatorExecutable[1]) of
                      True:
                        begin
                          MenuUseExecutable1.Click;
                          CommandLine:= SystemStr+EmulatorExecutable[1]+SystemStr+' '+GameName;
                          Found2ndExecutable:= False;
                          ExeType:= ExeStrings[GetExeType(EmulatorExecutable[1])];
                          EmulatorFormat:= EmulatorType[1];
                        end;
                      False:
                        begin
                          GenerateMessage(GetLanguageText('Messages', 'FileNotFoundTitle', 'File Not Found'),
                                          GetLanguageText('Messages', 'Emulator2and1NotFoundMsg', '2nd and 1st emulators not found. Aborted...'), 2);
                          Exit;
                        end;
                    end;
                  end;
              end;
            end;
          3:
            begin
              case FileExists(EmulatorExecutable[3]) of
                True:
                  begin
                    CommandLine:= SystemStr+EmulatorExecutable[3]+SystemStr+' '+GameName;
                    ExeType:= ExeStrings[GetExeType(EmulatorExecutable[3])];
                    EmulatorFormat:= EmulatorType[3];
                  end;
                False:
                  begin
                    case FileExists(EmulatorExecutable[1]) of
                      True:
                        begin
                          MenuUseExecutable1.Click;
                          CommandLine:= SystemStr+EmulatorExecutable[1]+SystemStr+' '+GameName;
                          Found3rdExecutable:= False;
                          ExeType:= ExeStrings[GetExeType(EmulatorExecutable[1])];
                          EmulatorFormat:= EmulatorType[1];
                        end;
                      False:
                        begin
                          GenerateMessage(GetLanguageText('Messages', 'FileNotFoundTitle', 'File Not Found'),
                                          GetLanguageTexT('Messages', 'Emulator3and1NotFoundMsg', '3rd and 1st emulators not found. Aborted...'), 2);
                          Exit;
                        end;
                    end;
                  end;
              end;
            end;
          4:
            begin
              case FileExists(EmulatorExecutable[4]) of
                True:
                  begin
                    CommandLine:= SystemStr+EmulatorExecutable[4]+SystemStr+' '+GameName;
                    ExeType:= ExeStrings[GetExeType(EmulatorExecutable[4])];
                    EmulatorFormat:= EmulatorType[4];
                  end;
                False:
                  begin
                    case FileExists(EmulatorExecutable[1]) of
                      True:
                        begin
                          MenuUseExecutable1.Click;
                          CommandLine:= SystemStr+EmulatorExecutable[1]+SystemStr+' '+GameName;
                          Found4thExecutable:= False;
                          ExeType:= ExeStrings[GetExeType(EmulatorExecutable[1])];
                          EmulatorFormat:= EmulatorType[1];
                        end;
                      False:
                        begin
                          GenerateMessage(GetLanguageText('Messages', 'FileNotFoundTitle', 'File Not Found'),
                                          GetLanguageText('Messages', 'Emulator4and1NotFoundMsg', '4th and 1st emulators not found. Aborted...'), 2);
                          Exit;
                        end;
                    end;
                  end;
              end;
            end;
          5:
            begin
              case FileExists(EmulatorExecutable[5]) of
                True:
                  begin
                    CommandLine:= SystemStr+EmulatorExecutable[5]+SystemStr+' '+GameName;
                    ExeType:= ExeStrings[GetExeType(EmulatorExecutable[5])];
                    EmulatorFormat:= EmulatorType[5];
                  end;
                False:
                  begin
                    case FileExists(EmulatorExecutable[1]) of
                      True:
                        begin
                          MenuUseExecutable1.Click;
                          CommandLine:= SystemStr+EmulatorExecutable[1]+SystemStr+' '+GameName;
                          Found5thExecutable:= False;
                          ExeType:= ExeStrings[GetExeType(EmulatorExecutable[1])];
                          EmulatorFormat:= EmulatorType[1];
                        end;
                      False:
                        begin
                          GenerateMessage(GetLanguageText('Messages', 'FileNotFoundTitle', 'File Not Found'),
                                          GetLanguageText('Messages', 'Emulator5and1NotFoundMsg', '5th and 1st emulators not found. Aborted...'), 2);
                          Exit;
                        end;
                    end;
                  end;
              end;
            end;
        end;

        if not RunStandard then
           begin
             case FileExists(FrontendPath+'resources\customcmd\'+GameName+'.ini') of
               True:
                 begin
                   NewOption:= ReadMAMECustomCommandLine(GameName, 0);
                   if NewOption <> 'Not Found' then
                      begin
                        CommandLine:= NewOption;
                        UseCustomCommandLine:= True;
                      end;
                 end;
               False:
                 begin
                   NewOption2:= CheckGameDriverCustomCmd;
                   if NewOption2 <> 'Not Found' then
                      begin
                        NewOption:= ReadMAMECustomCommandLine(NewOption2, 1);
                        if Pos('%s', LowerCase(NewOption)) <> 0 then
                           begin
                             CommandLine:= Format(NewOption, [GameName]);
                             UseCustomCommandLine:= True;
                           end
                        else
                           NewOption:= 'Not Found';
                      end;
                 end;
             end;
             case EmulatorFormat of
               1: //MAME executable
                 begin
                   // do nothing... MAME automatically searches for gamename.ini file
                 end;
               2: //DOS MAME executable
                 begin
                   case FileExists(FrontendPath+'resources\dosgamecfg\'+GameName+'.cfg') of
                     True:
                      begin
                        if not UseCustomCommandLine then
                           begin
                              // verify new setting with original mame.cfg
                              NewFile:= THashedStringList.Create;
                              NewFile.LoadFromFile(FrontendPath+'resources\dosgamecfg\'+GameName+'.cfg');
                              OriginalFile:= TIniFile.Create(ExtractFilePath(GetCurrentEmulatorExecutable)+'mame.cfg'); // Load the default options file
                              //--------------------------------------------------- begin ---------------------------------------------------
                              if CheckDOSoption('scanlines', '') <> 'error' then
                                 CommandLine:= CommandLine+' -scanlines '+NewOption;

                              if CheckDOSoption('stretch', '') <> 'error' then
                                 begin
                                   if NewOption = 'no' then
                                      CommandLine:= CommandLine+' -nostretch'
                                   else
                                      CommandLine:= CommandLine+' -stretch';
                                 end;

                              if CheckDOSoption('artwork', '') <> 'error' then
                                 begin
                                   if NewOption = 'no' then
                                      CommandLine:= CommandLine+' -noartwork'
                                   else
                                      CommandLine:= CommandLine+' -artwork';
                                 end;

                              if CheckDOSoption('use_backdrops', '') <> 'error' then
                                 begin
                                   if NewOption = 'no' then
                                      CommandLine:= CommandLine+' -nouse_backdrops'
                                   else
                                      CommandLine:= CommandLine+' -use_backdrops';
                                 end;

                              if CheckDOSoption('use_overlays', '') <> 'error' then
                                 begin
                                   if NewOption = 'no' then
                                      CommandLine:= CommandLine+' -nouse_overlays'
                                   else
                                      CommandLine:= CommandLine+' -use_overlays';
                                 end;

                              if CheckDOSoption('use_bezels', '') <> 'error' then
                                 begin
                                   if NewOption = 'no' then
                                      CommandLine:= CommandLine+' -nouse_bezels'
                                   else
                                      CommandLine:= CommandLine+' -use_bezels';
                                 end;

                              if CheckDOSoption('artwork_crop', '') <> 'error' then
                                 begin
                                   if NewOption = 'no' then
                                      CommandLine:= CommandLine+' -noartwork_crop'
                                   else
                                      CommandLine:= CommandLine+' -artwork_crop';
                                 end;

                              if CheckDOSoption('artwork_resolution', '') <> 'error' then
                                 CommandLine:= CommandLine+' -artworkresolution '+NewOption;

                              if CheckDOSoption('samples', '') <> 'error' then
                                 begin
                                   if NewOption = 'no' then
                                      CommandLine:= CommandLine+' -nosamples'
                                   else
                                      CommandLine:= CommandLine+' -samples';
                                 end;

                              if CheckDOSoption('vsync', '') <> 'error' then
                                 begin
                                   if NewOption = 'no' then
                                      CommandLine:= CommandLine+' -novsync'
                                   else
                                      CommandLine:= CommandLine+' -vsync';
                                 end;

                              if CheckDOSoption('waitvsync', '') <> 'error' then
                                 begin
                                   if NewOption = 'no' then
                                      CommandLine:= CommandLine+' -nowaitvsync'
                                   else
                                      CommandLine:= CommandLine+' -waitvsync';
                                 end;

                              if CheckDOSoption('triplebuffer', '') <> 'error' then
                                 begin
                                   if NewOption = 'no' then
                                      CommandLine:= CommandLine+' -notriplebuffer'
                                   else
                                      CommandLine:= CommandLine+' -triplebuffer';
                                 end;

                              if CheckDOSoption('tweak', '') <> 'error' then
                                 begin
                                   if NewOption = 'no' then
                                      CommandLine:= CommandLine+' -notweak'
                                   else
                                      CommandLine:= CommandLine+' -tweak';
                                 end;

                              if CheckDOSoption('vesamode', '') <> 'error' then
                                 CommandLine:= CommandLine+' -vesamode '+NewOption;

                              if CheckDOSoption('mmx', '') <> 'error' then
                                 begin
                                   if NewOption = 'yes' then
                                      CommandLine:= CommandLine+' -mmx'
                                   else
                                      if NewOption = 'no' then
                                         CommandLine:= CommandLine+' -nommx'
                                 end;

                              if CheckDOSoption('dirty', '') <> 'error' then
                                 begin
                                   if NewOption = 'yes' then
                                      CommandLine:= CommandLine+' -dirty'
                                   else
                                      if NewOption = 'no' then
                                         CommandLine:= CommandLine+' -nodirty'
                                 end;

                              if CheckDOSoption('antialias', '') <> 'error' then
                                 begin
                                   if NewOption = 'no' then
                                      CommandLine:= CommandLine+' -noantialias'
                                   else
                                      CommandLine:= CommandLine+' -antialias';
                                 end;

                              if CheckDOSoption('translucency', '') <> 'error' then
                                 begin
                                   if NewOption = 'no' then
                                      CommandLine:= CommandLine+' -notranslucency'
                                   else
                                      CommandLine:= CommandLine+' -translucency';
                                 end;

                              if CheckDOSoption('vgafreq', '') <> 'error' then
                                 CommandLine:= CommandLine+' -vgafreq '+NewOption;

                              if CheckDOSoption('alwayssynced', '') <> 'error' then
                                 begin
                                   if NewOption = 'no' then
                                      CommandLine:= CommandLine+' -noalwayssynced'
                                   else
                                      CommandLine:= CommandLine+' -alwayssynced';
                                 end;

                              if CheckDOSoption('depth', '') <> 'error' then
                                 CommandLine:= CommandLine+' -depth '+NewOption;

                              if CheckDOSoption('skiplines', '') <> 'error' then
                                 CommandLine:= CommandLine+' -skiplines '+NewOption;

                              if CheckDOSoption('skipcolumns', '') <> 'error' then
                                 CommandLine:= CommandLine+' -skipcolumns '+NewOption;

                              if CheckDOSoption('beam', '%2.2f') <> 'error' then
                                 CommandLine:= CommandLine+' -beam '+NewOption;

                              if CheckDOSoption('flicker', '%3.2f') <> 'error' then
                                 CommandLine:= CommandLine+' -flicker '+NewOption;

                              if CheckDOSoption('intensity', '%1.2f') <> 'error' then
                                 CommandLine:= CommandLine+' -intensity '+NewOption;

                              if CheckDOSoption('gamma', '%1.2f') <> 'error' then
                                 CommandLine:= CommandLine+' -gamma '+NewOption;

                              if CheckDOSoption('brightness', '%1.2f') <> 'error' then
                                 CommandLine:= CommandLine+' -brightness '+NewOption;

                              if CheckDOSoption('pause_brightness', '%1.2f') <> 'error' then
                                 CommandLine:= CommandLine+' -pause_brightness '+NewOption;

                              if CheckDOSoption('frameskip', '') <> 'error' then
                                 CommandLine:= CommandLine+' -frameskip '+NewOption;

                              if CheckDOSoption('throttle', '') <> 'error' then
                                 begin
                                   if NewOption = 'no' then
                                      CommandLine:= CommandLine+' -nothrottle'
                                   else
                                      CommandLine:= CommandLine+' -throttle';
                                 end;

                              if CheckDOSoption('norotate', '') <> 'error' then
                                 begin
                                   if NewOption = 'yes' then
                                      CommandLine:= CommandLine+' -norotate';
                                 end;

                              if CheckDOSoption('ror', '') <> 'error' then
                                 begin
                                   if NewOption = 'yes' then
                                      CommandLine:= CommandLine+' -ror';
                                 end;

                              if CheckDOSoption('rol', '') <> 'error' then
                                 begin
                                   if NewOption = 'yes' then
                                      CommandLine:= CommandLine+' -rol';
                                 end;

                              if CheckDOSoption('flipx', '') <> 'error' then
                                 begin
                                   if NewOption = 'yes' then
                                      CommandLine:= CommandLine+' -flipx';
                                 end;

                              if CheckDOSoption('flipy', '') <> 'error' then
                                 begin
                                   if NewOption = 'yes' then
                                      CommandLine:= CommandLine+' -flipy';
                                 end;

                              if CheckDOSoption('soundcard', '') <> 'error' then
                                 CommandLine:= CommandLine+' -soundcard '+NewOption;

                              if CheckDOSoption('sound', '') <> 'error' then
                                 begin
                                   if NewOption = 'no' then
                                      CommandLine:= CommandLine+' -nosound'
                                   else
                                      CommandLine:= CommandLine+' -sound';
                                 end;

                              if CheckDOSoption('samplerate', '') <> 'error' then
                                 CommandLine:= CommandLine+' -samplerate '+NewOption;

                              if CheckDOSoption('stereo', '') <> 'error' then
                                 begin
                                   if NewOption = 'no' then
                                      CommandLine:= CommandLine+' -nostereo'
                                   else
                                      CommandLine:= CommandLine+' -stereo';
                                 end;

                              if CheckDOSoption('volume', '') <> 'error' then
                                 CommandLine:= CommandLine+' -volume '+NewOption;

                              if CheckDOSoption('sampleratedetect', '') <> 'error' then
                                 begin
                                   if NewOption = 'no' then
                                      CommandLine:= CommandLine+' -nosampleratedetect'
                                   else
                                      CommandLine:= CommandLine+' -sampleratedetect';
                                 end;

                              if CheckDOSoption('resamplefilter', '') <> 'error' then
                                 begin
                                   if NewOption = 'no' then
                                      CommandLine:= CommandLine+' -noresamplefilter'
                                   else
                                      CommandLine:= CommandLine+' -resamplefilter';
                                 end;

                              if CheckDOSoption('mouse', '') <> 'error' then
                                 begin
                                   if NewOption = 'no' then
                                      CommandLine:= CommandLine+' -nomouse'
                                   else
                                      CommandLine:= CommandLine+' -mouse';
                                 end;

                              if CheckDOSoption('joystick', '') <> 'error' then
                                 CommandLine:= CommandLine+' -joystick '+NewOption;

                              if CheckDOSoption('steadykey', '') <> 'error' then
                                 begin
                                   if NewOption = 'no' then
                                      CommandLine:= CommandLine+' -nosteadykey'
                                   else
                                   if NewOption = 'yes' then
                                      CommandLine:= CommandLine+' -steadykey';
                                 end;

                              if CheckDOSoption('keyboard_leds', '') <> 'error' then
                                 begin
                                   if NewOption = 'no' then
                                      CommandLine:= CommandLine+' -nokeyboard_leds'
                                   else
                                      CommandLine:= CommandLine+' -keyboard_leds';
                                 end;

                              if CheckDOSoption('cheat', '') <> 'error' then
                                 begin
                                   if NewOption = 'no' then
                                      CommandLine:= CommandLine+' -nocheat'
                                   else
                                   if NewOption = 'yes' then
                                      CommandLine:= CommandLine+' -cheat';
                                 end;

                              if CheckDOSoption('resolution', '') <> 'error' then
                                 CommandLine:= CommandLine+' -resolution '+NewOption;

                              if CheckDOSoption('vectorres', '') <> 'error' then
                                 CommandLine:= CommandLine+' -vectorres '+NewOption;

                              if CheckDOSoption('debug_resolution', '') <> 'error' then
                                 CommandLine:= CommandLine+' -debug_resolution '+NewOption;

                              // ------------------- future MAME option -------------------
                              {NewOption:=NewFile.Values['language'];
                              if NewOption <> (OriginalFile.Values['language']) then
                                 begin
                                   CommandLine:= CommandLine+' -language '+NewOption;
                                 end;}
                              // ------------------- future MAME option -------------------

                              if CheckDOSoption('monitor', '') <> 'error' then
                                 CommandLine:= CommandLine+' -monitor '+NewOption;

                              if CheckDOSoption('centerx', '') <> 'error' then
                                 CommandLine:= CommandLine+' -centerx '+NewOption;

                              if CheckDOSoption('centery', '') <> 'error' then
                                 CommandLine:= CommandLine+' -centery '+NewOption;

                              if CheckDOSoption('waitinterlace', '') <> 'error' then
                                 begin
                                   if NewOption = 'yes' then
                                      CommandLine:= CommandLine+' -waitinterlace';
                                 end;

                              if CheckDOSoption('skip_disclaimer', '') <> 'error' then
                                 begin
                                   if NewOption = 'yes' then
                                      CommandLine:= CommandLine+' -skip_disclaimer';
                                 end;

                              if CheckDOSoption('skip_gameinfo', '') <> 'error' then
                                 begin
                                   if NewOption = 'yes' then
                                      CommandLine:= CommandLine+' -skip_gameinfo';
                                 end;
                           end;
                        //---------------------------------------------------- end ----------------------------------------------------

                        FreeAndNil(NewFile);
                        FreeAndNil(OriginalFile);
                      end;
                     False:
                       begin
                         if not UseCustomCommandLine then
                            GenerateMessage(GetLanguageText('Messages', 'FileNotFoundTitle', 'File Not Found'),
                                            GetLanguageText('Messages', 'NoGameCustomOptionsMsg', 'There is no custom options for this game! Running with default options...'), 2);
                       end;
                   end;
                 end;
             end;
           end;
      end
    else
      begin
        // this is for the custom game
        if FileExists(FrontendPath+'resources\CustomGamesCmd.ini') then
           begin
             CustomGame:= THashedStringList.Create;
             CustomGame.LoadFromFile(FrontendPath+'resources\CustomGamesCmd.ini');
             CommandLine:= CustomGame.Values[GameName];
             if CommandLine <> '' then
                begin
                  SetCurrentDir(ExtractFilePath(SetCustomCmdDir(CommandLine)));
                  ExeType:= ExeStrings[GetExeType(CommandLine)];
                  CommandLine:= CommandLine+' '+CustomGame.Values[GameName+'Params'];
                end;
           end;
        FreeAndNil(CustomGame);

        if CommandLine = '' then
           begin
             SetCurrentDir(FrontendPath);
             Exit;
           end
        else
           UseCustomCommandLine:= True;
      end;

    if not UseCustomCommandLine then
       begin
         if MenuPlayRecordedGame.Checked then
            begin
              if INPFilename.Text = '' then
                 INPFilename.Text:= GameName;
              CommandLine:= CommandLine+' -playback '+ INPFilename.Text;
            end
         else
         if MenuRecordGame.Checked then
            begin
              if INPFilename.Text = '' then
                 INPFilename.Text:= GameName;
              CommandLine:= CommandLine+' -record '+ INPFilename.Text;
            end;

         if (FormPreferences.UseCustomAspectRatio.Checked) and (EmulatorFormat = 1) then
            begin
              if GamesList[SelectedGame].eOrientation = 'Horizontal' then
                 begin
                   if FormPreferences.HorizontalAspectRatio.Position <> FormPreferences.HorizontalAspectRatio.Tag then
                      CommandLine:= CommandLine+' -screen_aspect '+FormPreferences.LabelHorizontalAspectRatioValue.Caption;
                 end
              else
              if GamesList[SelectedGame].eOrientation = 'Vertical' then
                 begin
                   if FormPreferences.VerticalAspectRatio.Position <> FormPreferences.VerticalAspectRatio.Tag then
                      CommandLine:= CommandLine+' -screen_aspect '+FormPreferences.LabelVerticalAspectRatioValue.Caption;
                 end;
            end;

         if FormPreferences.UseExtraParametersMAME.Checked then
            begin
              case EmulatorFormat of
                1:
                  begin
                    if FormPreferences.ExtraParametersMAME.Text <> '' then
                       CommandLine:= CommandLine+' '+FormPreferences.ExtraParametersMAME.Text;
                  end;
                2:
                  begin
                    if FormPreferences.ExtraParametersDOSMAME.Text <> '' then
                       CommandLine:= CommandLine+' '+FormPreferences.ExtraParametersDOSMAME.Text;
                  end;
              end;
            end;
         SetCurrentDir(ExtractFilePath(GetCurrentEmulatorExecutable));

         if (not ctrlrDefault.Checked) and (not UseCustomCommandLine) then
            CommandLine:= CommandLine+' -ctrlr '+ButtonControllerKeysMapping.Hint;
       end;

    //ShowMessage(CommandLine); Exit; // uncomment this line only to debug the full command line

    Application.ProcessMessages;
    if FormPreferences.MinimizeFrontend.Checked then
       Application.Minimize;

    StartClock:= GetTickCount;
    case ShowAverageFPS of
      True:
        begin
          case UseCustomCommandLine of
            True:
              begin
                case Win32Platform of
                  0,1: RunProcess('command.com /c '+CommandLine, True, SW_SHOWNORMAL, True); //Win9x
                  2  : RunProcess('cmd.exe /c '+SystemStr+CommandLine+SystemStr, True, SW_SHOWNORMAL, True); // Win2000 and WinXP
                end;
              end;
            False:
              begin
                case Win32Platform of
                  0,1: RunProcess('command.com /c '+CommandLine+' > '+SystemStr+FrontendPath+'MAMEfps.log'+SystemStr, True, SW_SHOWNORMAL, True); //Win9x
                  2  : RunProcess('cmd.exe /c '+SystemStr+CommandLine+' > '+SystemStr+FrontendPath+'MAMEfps.log'+SystemStr+SystemStr, True, SW_SHOWNORMAL, True); // Win2000 and WinXP
                end;
              end;
          end;
        end;
      False:
        begin
          case Win32Platform of
            0,1: RunProcess('command.com /c '+CommandLine, True, SW_SHOWNORMAL, True); //Win9x
            2  : RunProcess('cmd.exe /c '+SystemStr+CommandLine+SystemStr, True, SW_SHOWNORMAL, True); // Win2000 and WinXP
          end;
        end;
    end;
    EndClock:= GetTickCount;
    ThousandSeparator:= Char(',');
    DecimalSeparator:= Char('.');
    if FormPreferences.MinimizeFrontend.Checked then
       Application.Restore;

    //this debugger message is only for variable tests
    {ShowMessage(#13+'"Total Play Time" current value: "'+TotalPlayTime+'" milliseconds'+#13+
                '"Start Clock" value: "'+IntToStr(StartClock)+'" milliseconds'+#13+
                '"End Clock" value: "'+IntToStr(EndClock)+'" milliseconds'+#13+
                '"Game Running Time" (EndClock-StartClock): "'+(IntToStr(EndClock-StartClock)+'" milliseconds')+#13+#13+
                '"Total Play Time" new value: "'+IntToStr(StrToInt(TotalPlayTime)+(EndClock-StartClock))+'" milliseconds'+#13);}

    CheckPlayTime;
    TotalPlayTime:= IntToStr((StrToInt64(TotalPlayTime)+ (EndClock-StartClock)));
    SetCurrentDir(FrontendPath);
    UpdateSelectedGamePlayTime(GameName, (EndClock-StartClock));
    ShowingPicture:= True;
    MenuShowPictures.OnClick(Self);

    if ShowAverageFPS then
       begin
         if FileExists(FrontendPath+'MAMEfps.log') then
            begin
              NewOption:= '';
              NewFile:= THashedStringList.Create;
              NewFile.LoadFromFile(FrontendPath+'MAMEfps.log');
              Application.MessageBox(PChar('ROMs Loading:'+#13+'-------------'+#13+#13+NewFile.Text), PChar(GamesList[SelectedGame].eDescription+ ' Results'), mb_Ok+mb_IconInformation);
              FreeAndNil(NewFile);
              DeleteFile(FrontendPath+'MAMEfps.log')
            end;
       end;
  end;
end;

function TFormMain.AddToFavorite: Boolean;
var
  FavoriteFile: THashedStringList;
  Loop: Integer;
  AddToList: Boolean;
  ROMDataLine: String;
begin
  Result:= False;
  if List.Selected = nil then
     Exit;
  Screen.Cursor:= crHourGlass;
  AddToList:= True;
  FavoriteFile:= THashedStringList.Create;
  if FileExists(FrontendPath+'resources\favorites\'+FavoriteUser+'.dat') then
     begin
       FavoriteFile.LoadFromFile(FrontendPath+'resources\favorites\'+FavoriteUser+'.dat');
       if FavoriteFile.Count > 0 then
          begin
            for Loop:=0 to FavoriteFile.Count -1 do
            begin
              if SearchString('¬'+GamesList[SelectedGame].eDescription+'¬', FavoriteFile[Loop]) then
                 begin
                   GenerateMessage(GetLanguageText('Messages', 'FavoriteGameNotAddedTitle', 'Game Not Added'),
                                   GetLanguageText('Messages', 'FavoriteGameNotAddedMsg', 'This game is already on the list!'), 2);
                   AddToList:= False;
                   Break;
                 end;
            end;
          end;
     end;
  if AddToList then
     begin
       SetGameMemoryInfo;
       ROMDataLine:= PopulateROMDataLine;
       FavoriteFile.BeginUpdate;
       FavoriteFile.Add(ROMDataLine);
       FavoriteFile.EndUpdate;
       FavoriteFile.SaveToFile(FrontendPath+'resources\favorites\'+FavoriteUser+'.dat');
     end;
  FreeAndNil(FavoriteFile);
  Result:= AddToList;
  Screen.Cursor:= crDefault;
end;

function TFormMain.DeleteFromFavorite: Boolean;
var
  FavoriteFile: THashedStringList;
  Loop, GameIndex: Integer;
begin
  Result:= False;
  if List.Selected = nil then
     Exit;
  Screen.Cursor:= crHourGlass;
  FavoriteFile:= THashedStringList.Create;
  case FileExists(FrontendPath+'resources\favorites\'+FavoriteUser+'.dat') of
   True:
     begin
       FavoriteFile.LoadFromFile(FrontendPath+'resources\favorites\'+FavoriteUser+'.dat');
       if FavoriteFile.Count > 0 then
          begin
            for Loop:=0 to FavoriteFile.Count -1 do
            begin
              if SearchString('¬'+GamesList[SelectedGame].eDescription+'¬', FavoriteFile[Loop]) then
                 begin
                   Result:= True;
                   FavoriteFile.Delete(Loop);
                   FavoriteFile.SaveToFile(FrontendPath+'resources\favorites\'+FavoriteUser+'.dat');
                   GameIndex:= SelectedGame;
                   Break;
                 end;
              if Loop = FavoriteFile.Count-1 then
                 GenerateMessage(GetLanguageText('Messages', 'FailedOperationTitle', 'Operation Failed'),
                                 GetLanguageText('Messages', 'FavoriteGameNotDeletedMsg', 'This game is not on the list!'), 2);
            end;
          end;
     end;
   False: GenerateMessage(GetLanguageText('Messages', 'ErrorTitle', 'Error'),
                          GetLanguageText('Messages', 'FavoriteFileNotFoundMsg', 'Favorite file not found!'), 2);
  end;


  if Result then
     begin
       if FavoriteFile.Count = 0 then
          begin
            Screen.Cursor:= crDefault;
            GenerateMessage(GetLanguageText('Messages', 'FavoriteGamesEmptyTitle', 'No Games In The List'),
                            GetLanguageText('Messages', 'FavoriteGamesEmptyMsg', 'This favorites list is empty!'), 2);
            MenuShowFavorite.Click;
          end
       else
          begin
            LoadROMClasses(True);
            List.Invalidate;
            SortColumn(ColumnSorted, True);
            if (GameIndex <= (Length(GamesList)-1)) then
               SelectItem(GameIndex)
            else
            if (GameIndex-1 <= (Length(GamesList)-1)) then
               SelectItem(GameIndex-1)
            else
               SelectItem(0);
          end;
     end;
  FreeAndNil(FavoriteFile);
  Screen.Cursor:= crDefault;
end;

procedure TFormMain.LoadFolders(ExecutableString: String);
var
  MAMEcfg: TIniFile;
  MAMEIniFile: THashedStringList;
  Folder, TextLine: String;
  ExeType: String[5];
  Loop: Integer;
begin
  ExecutableString:=EmulatorExecutable[StrToInt(ExecutableString)];

  ExeType:= ExeStrings[GetExeType(ExecutableString)];
  if ExeType = 'DOS' then
     begin
       MAMEcfg:= TIniFile.Create(ExtractFilePath(ExecutableString)+'mame.cfg');
       with MAMEcfg do
       begin
         Folder:= ReadString('directory', 'rompath', 'roms');
         snapingameDir:= ReadString('directory', 'snap', 'snap');

         mameinfoFile:= ReadString('config', 'mameinfofile', 'mameinfo.dat');
         historyFile:= ReadString('config', 'historyfile', 'history.dat');
       end;
       FreeAndNil(MAMEcfg);
     end
  else
  if ExeType = 'Win32' then
     begin
       MAMEIniFile:= THashedStringList.Create;
       MAMEIniFile.LoadFromFile(ExtractFilePath(ExecutableString)+GetExecutableINIFileName(ExecutableString));
       for Loop:=0 to MAMEIniFile.Count -1 do
       begin
         TextLine:= MAMEIniFile[Loop];
         if Copy(TextLine, 1, 8) = 'rompath ' then
            begin
              Folder:= ExtractMAMEIniValue(TextLine);
              ExtractROMsFolders(Folder);
            end;

         if Copy(TextLine, 1, 8) = 'inipath ' then
            IniFilesDir:= ExtractMAMEIniValue(TextLine);

         if Copy(TextLine, 1, 19) = 'snapshot_directory ' then
            snapingameDir:= ExtractMAMEIniValue(TextLine);

         if Copy(TextLine,1,16) = 'ctrlr_directory ' then
            begin
              ctrlrDir:= ExtractMAMEIniValue(TextLine);
              GetKeysMappingList(ExecutableString);
            end;

         if Copy(TextLine, 1, 13) = 'history_file ' then
            historyFile:= ExtractMAMEIniValue(TextLine);

         if Copy(TextLine, 1, 14) = 'mameinfo_file ' then
            mameinfoFile:= ExtractMAMEIniValue(TextLine);

         if Copy(TextLine,1,14) = 'screen_aspect ' then
            begin
              FormPreferences.HorizontalAspectRatio.Tag:= SetDefaultAspectRatio(ExtractMAMEIniValue(TextLine));
              FormPreferences.VerticalAspectRatio.Tag:= FormPreferences.HorizontalAspectRatio.Tag;
            end;
       end;
       FreeAndNil(MAMEIniFile);
     end;
  if Folder = '' then
     Folder:= ShortToLongPath(ExtractFilePath(Application.ExeName));
  ExtractROMsFolders(Folder);
end;

procedure TFormMain.ExtractROMsFolders(ROMsList: String);
var
  Loop: Integer;
  PathName: String;
begin
  if not Assigned(ROMsFolders) then
     ROMsFolders:= THashedStringList.Create
  else
     ROMsFolders.Clear;
  PathName:= '';

  for Loop:=1 to Length(ROMsList) do
  begin
    if (ROMsList[Loop] = ';') then
       begin
         ROMsFolders.Add(PathName);
         PathName:= '';
       end
    else
       begin
         PathName:= PathName+ROMsList[Loop];
         if Loop = Length(ROMsList) then
            ROMsFolders.Add(PathName);
       end;
  end;
end;

function TFormMain.SearchZIP(GameName: String): Boolean;
var
  Loop: Integer;
  //Drive: String;
begin
  Result:= False;
  for Loop:=0 to ROMsFolders.Count -1 do
  begin
    //Drive:= ExtractFileDrive(ROMsFolders.Strings[Loop]);
    //if DiskInDrive(Drive[1]) then
     //  begin
         if FileExists(ROMsFolders.Strings[Loop]+'\'+GameName+'.zip') then
            begin
              Result:= True;
              Break;
            end;
       //end;
  end;
end;

function TFormMain.SearchZIPFolder(GameName: String): String;
var
  Loop: Integer;
  //Drive: String;
begin
  Result:= 'Not Found';
  for Loop:=0 to ROMsFolders.Count -1 do
  begin
    //Drive:= ExtractFileDrive(ROMsFolders.Strings[Loop]);
    //if DiskInDrive(Drive[1]) then
      // begin
         if FileExists(ROMsFolders.Strings[Loop]+'\'+GameName+'.zip') then
            begin
              Result:= ROMsFolders.Strings[Loop]+'\'+GameName+'.zip';
              Break;
            end;
      // end;
  end;
end;

function TFormMain.SearchCHDFolder(GameName, DiskImageFileName: String): String;
var
  Loop: Integer;
begin
  Result:= 'Not Found';
  for Loop:=0 to ROMsFolders.Count -1 do
  begin
    if FileExists(ROMsFolders.Strings[Loop]+'\'+GameName+'\'+DiskImageFileName) then
       begin
         Result:= ROMsFolders.Strings[Loop]+'\'+GameName+'\'+DiskImageFileName;
         Break;
       end;
  end;
end;

function TFormMain.VerifyResourceFiles(Resource: Boolean; FileROM: String): Boolean;
begin
  if ((Pos('name neo-geo.rom', FileROM) = 0) and (Pos('name ng-sm1.rom', FileROM) = 0) and // Neo Geo
      (Pos('name ng-sfix.rom', FileROM) = 0) and (Pos('name ng-lo.rom', FileROM) = 0) and // Neo Geo

      (Pos('name pch1-c.8t', FileROM) = 0) and (Pos('name pch1-c.8p', FileROM) = 0) and (Pos('name pch1-c.8m', FileROM) = 0) and // Playchoice-10
      (Pos('name pch1-c.8k', FileROM) = 0) and (Pos('name 82s129.6f', FileROM) = 0) and (Pos('name 82s129.6e', FileROM) = 0) and // Playchoice-10
      (Pos('name 82s129.6d', FileROM) = 0) and // Playchoice-10

      (Pos('name 5b.bin', FileROM) = 0) and (Pos('name 82s185.10h', FileROM) = 0) and (Pos('name 82s123.10k', FileROM) = 0) and // CVS

      (Pos('name rms8.cpu', FileROM) = 0) and (Pos('name rms8.snd', FileROM) = 0) and (Pos('name cass8041.bin', FileROM) = 0) and // Deco
      (Pos('name dsp8.3m', FileROM) = 0) and (Pos('name dsp8.10d', FileROM) = 0) and (Pos('name rms8.j3', FileROM) = 0) and // Deco

      (Pos('name pgm_p01s.rom', FileROM) = 0) and (Pos('name pgm_t01s.rom', FileROM) = 0) and (Pos('name pgm_m01s.rom', FileROM) = 0) and // PGM

      (Pos('name sknsj1.u10', FileROM) = 0) and (Pos('name ksns-bio.eur', FileROM) = 0) and // Super Kaneko Nova System

      (Pos('name epr19730.ic8', FileROM) = 0) and (Pos('name mp17951a.s', FileROM) = 0) and (Pos('name mp17952a.s', FileROM) = 0)) then // ST-V Bios
     begin
       Result:= True;
     end
  else

  if ((Pos('name neo-geo.rom', FileROM) > 0) or (Pos('name ng-sm1.rom', FileROM) > 0) or
      (Pos('name ng-sfix.rom', FileROM) > 0) or (Pos('name ng-lo.rom', FileROM) > 0)) then
     begin
       Result:= Resource;
     end
  else

  if ((Pos('name pch1-c.8t', FileROM) > 0) or (Pos('name pch1-c.8p', FileROM) > 0) or (Pos('name pch1-c.8m', FileROM) > 0) or
      (Pos('name pch1-c.8k', FileROM) > 0) or (Pos('name 82s129.6f', FileROM) > 0) or (Pos('name 82s129.6e', FileROM) > 0) or
      (Pos('name 82s129.6d', FileROM) > 0)) then
     begin
       case Resource of
         True : Result:= True;
         False: Result:= not IsPlayChoice;
       end;
     end
  else

  if ((Pos('name 5b.bin', FileROM) > 0) or (Pos('name 82s185.10h', FileROM) > 0) or (Pos('name 82s123.10k', FileROM) > 0)) then
     begin
       case Resource of
         True : Result:= True;
         False: Result:= not IsCvs;
       end;
     end
  else

  if ((Pos('name rms8.cpu', FileROM) > 0) or (Pos('name rms8.snd', FileROM) > 0) or (Pos('name cass8041.bin', FileROM) > 0) or
      (Pos('dsp8.3m', FileROM) > 0) or (Pos('dsp8.10d', FileROM) > 0) or (Pos('rms8.j3', FileROM) > 0))then
     begin
       case Resource of
         True : Result:= True;
         False: Result:= not IsDecoSystem;
       end;
     end
  else

  if ((Pos('name pgm_p01s.rom', FileROM) > 0) or (Pos('name pgm_t01s.rom', FileROM) > 0) or (Pos('name pgm_m01s.rom', FileROM) > 0)) then
     begin
       case Resource of
         True : Result:= True;
         False: Result:= not IsPgm;
       end;
     end
  else

  if ((Pos('name sknsj1.u10', FileROM) > 0) or (Pos('name ksns-bio.eur', FileROM) > 0)) then
     begin
       case Resource of
         True : Result:= True;
         False: Result:= not IsSuperKanekoNova;
       end;
     end
  else

  if ((Pos('name epr19730.ic8', FileROM) > 0) and (Pos('name mp17951a.s', FileROM) > 0) and (Pos('name mp17952a.s', FileROM) > 0)) then // ST-V Bios
     begin
       case Resource of
         True : Result:= True;
         False: Result:= not IsSTV;
       end;
     end
end;

procedure TFormMain.ShowAutomaticGameInformation;
var
  LineIndex: Integer;
  AddLine: Boolean;
  FoundMAMEInfo, FoundHistory, FoundDriver, FoundFAQShowInfo, ShowInfo: Boolean;
  Loop, Loop2: Integer;
  DATVersion: String;
  TextStrings, InfoText: THashedStringList;
  MergedText: TMemoryStream;
begin
  if List.Selected = nil then
     Exit;
  ProcessingAutomaticMAMEInfoDAT:= True;
  FoundMAMEInfo:= False;
  FoundHistory:= False;
  FoundDriver:= False;
  AddLine:= False;
  MAMEInfoTextHolder.Lines.BeginUpdate;
  if MAMEInfoTextHolder.Lines.Count > 0 then
     MAMEInfoTextHolder.Clear;

  InfoText:= THashedStringList.Create;
  TextStrings:= THashedStringList.Create;
  TextStrings.BeginUpdate;
  if Assigned(AutoMAMEInfoDATFile) then
     begin
       LineIndex:= AutoMAMEInfoDATFile.IndexOf('$info='+GamesList[SelectedGame].eName);
       ShowInfo:= LineIndex > -1;

       if not ShowInfo then
          begin
            if (GamesList[SelectedGame].eClone <> '') and (GamesList[SelectedGame].eName <> GamesList[SelectedGame].eClone) then
               begin
                 LineIndex:= AutoMAMEInfoDATFile.IndexOf('$info='+GamesList[SelectedGame].eClone);
                 ShowInfo:= LineIndex > -1;
               end;
          end;
       if ShowInfo then
          begin
            FoundMAMEInfo:= True;
            Inc(LineIndex);
            InfoText.BeginUpdate;
            while Trim(AutoMAMEInfoDATFile[LineIndex]) <> '$end' do
            begin
              case AddLine of
                False:
                  begin
                    if Trim(AutoMAMEInfoDATFile[LineIndex]) = '$mame' then
                       begin
                         AddLine:= True;
                         InfoText.Add('---------- Information Data ----------'+#13#10);
                       end;
                  end;
                True: InfoText.Add(AutoMAMEInfoDATFile[LineIndex]);
              end;
              Inc(LineIndex);
            end;
            InfoText.EndUpdate;
            TextStrings.AddStrings(InfoText);
          end;

     end;

  if Assigned(AutoHistoryDATFile) then
     begin
       AddLine:= False;
       for Loop:=0 to AutoHistoryDATFile.Count -1 do
       begin
         if Copy(AutoHistoryDATFile[Loop], 1, 5) = '$info' then
            begin
              if GetGameHistory(GamesList[SelectedGame].eName, AutoHistoryDATFile[Loop]) then
                 begin
                   InfoText.BeginUpdate;
                   InfoText.Clear;
                   FoundHistory:= True;
                   Loop2:= Loop+1;
                   if FoundMAMEInfo then
                      InfoText.Add('');
                   InfoText.Add('---------- History Data ----------'+#13#10);
                   while Trim(AutoHistoryDATFile[Loop2]) <> '$end' do
                   begin
                     case AddLine of
                       False:
                         begin
                           if Trim(AutoHistoryDATFile[Loop2]) = '$bio' then
                              AddLine:= True;
                         end;
                       True: InfoText.Add(AutoHistoryDATFile[Loop2]);
                     end;
                     Inc(Loop2);
                   end;
                   InfoText.EndUpdate;
                   TextStrings.AddStrings(InfoText);
                 end;
            end;
        end;
     end;

  if Assigned(AutoMAMEInfoDATFile) then
     begin
       AddLine:= False;
       LineIndex:= AutoMAMEInfoDATFile.IndexOf('$info='+GamesList[SelectedGame].eDriver);
       if LineIndex > -1 then
          begin
            InfoText.BeginUpdate;
            InfoText.Clear;
            FoundDriver:= True;
            Inc(LineIndex);
            if FoundMAMEInfo or FoundHistory then
               InfoText.Add('');
            InfoText.Add('---------- Driver Data ----------'+#13#10);
            DATVersion:=AutoMAMEInfoDATFile[0];
            Delete(DATVersion, 1, 2);
            MAMEInfoTextHolder.Lines.Add(DATVersion+#13);
            while Trim(AutoMAMEInfoDATFile[LineIndex]) <> '$end' do
            begin
              case AddLine of
                False:
                  begin
                    if Trim(AutoMAMEInfoDATFile[LineIndex]) = '$drv' then
                       AddLine:= True;
                  end;
                True: InfoText.Add(AutoMAMEInfoDATFile[LineIndex]);
              end;
              Inc(LineIndex);
            end;
            InfoText.EndUpdate;
            TextStrings.AddStrings(InfoText);
          end;
     end;

  case FileExists(faqDir+'\'+GamesList[SelectedGame].eName+'.faq') of
    False:
      begin
        if (GamesList[SelectedGame].eClone <> '') and (GamesList[SelectedGame].eName <> GamesList[SelectedGame].eClone) then
            begin
              ShowInfo:= FileExists(faqDir+'\'+GamesList[SelectedGame].eClone+'.faq');
              if ShowInfo then
                 DATVersion:= faqDir+'\'+GamesList[SelectedGame].eClone+'.faq';
            end
        else
            ShowInfo:= False;
      end;
    True: DATVersion:= faqDir+'\'+GamesList[SelectedGame].eName+'.faq';
  end;
  if ShowInfo then
     begin
       InfoText.BeginUpdate;
       InfoText.Clear;
       FoundFAQShowInfo:= True;

       InfoText.LoadFromFile(DATVersion);
       if FoundMAMEInfo or FoundHistory or FoundDriver then
          begin
            InfoText.Insert(0, '');
            InfoText.Insert(1, '---------- Game FAQ Data ----------'+#13#10);
          end
       else
          InfoText.Insert(0, '---------- Game FAQ Data ----------'+#13#10);
       InfoText.EndUpdate;
       TextStrings.AddStrings(InfoText);
       FreeAndNil(InfoText);
     end;

  MergedText:= TMemoryStream.Create;
  TextStrings.SaveToStream(MergedText);
  FreeAndNil(TextStrings);
  MergedText.Seek(0, 0);
  MAMEInfoTextHolder.Lines.LoadFromStream(MergedText);
  MAMEInfoTextHolder.Lines.EndUpdate;
  FreeAndNil(MergedText);

  if (not FoundMAMEInfo) and (not FoundHistory) and (not FoundDriver) and (not FoundFAQShowInfo) then
     begin
       SplitterMAMEInfo.Visible:= False;
       PanelmameinfoDAT.Visible:= False;
     end
  else

  if (FoundMAMEInfo or FoundHistory or FoundDriver or FoundFAQShowInfo)   or
     (FoundMAMEInfo and FoundHistory and FoundDriver and FoundFAQShowInfo) then
     begin
       if not PanelmameinfoDAT.Visible then
          begin
            PanelmameinfoDAT.Visible:= True;
            SplitterMAMEInfo.Visible:= True;
          end;
     end;
  ProcessingAutomaticMAMEInfoDAT:= False;
end;

// new procedure
function TFormMain.CreateGamesList(ExecutableString: String; DefaultDatabase: Boolean): Boolean;
var
  ListInfoFile, ListDetailsFile, ROMsList, CustomDescriptionList, CustomCategoryList: THashedStringList;
  FileLine, ROMsDetailsLine, TempString, ROMDataLine, LineResult: String;
  MainLoop, Loop, Position, GameSize, TotalProgress: Integer;
  IsResource, CheckFolder: Boolean;
  TotalGamesFound, TotalMergedGamesFound, TotalResourcesFound, TotalNotFound: Integer;
  //StartClock, EndClock: Integer;

  BiosFoundMsg, GameFoundMsg, BiosMergedFoundMsg, GameMergedFoundMsg: String;
  FolderName: String;

  procedure RestoreHistoryFile;
  begin
    if FileExists(ExtractFilePath(ExecutableString)+'history.ren')then
       begin
         if not RenameFile(ExtractFilePath(ExecutableString)+'history.ren', ExtractFilePath(ExecutableString)+'history.dat') then
            GenerateMessage(GetLanguageText('Messages', 'ErrorTitle', 'Error'),
                            Format(GetLanguageText('Messages', 'RenameFailed2Msg', 'Could not rename "%s" file back to "%s"!. Please rename it manually.'), [ExtractFilePath(ExecutableString)+'history.ren', ExtractFilePath(ExecutableString)+'history.dat']), 2);
       end;
  end;

begin
  LoadFolders(ExecutableString);
  ExecutableString:= EmulatorExecutable[StrToInt(ExecutableString)];

  SetCurrentDir(FrontendPath);
  Result:= True;

  //StartClock:= GetTickCount;

  if FileExists(ExtractFilePath(ExecutableString)+'history.dat')then
     begin
       if not RenameFile(ExtractFilePath(ExecutableString)+'history.dat', ExtractFilePath(ExecutableString)+'history.ren') then
          GenerateMessage(GetLanguageText('Messages', 'ErrorTitle', 'Error'),
                          Format(GetLanguageText('Messages', 'RenameFailedMsg', 'Could not rename "%s" file!. To avoid major problems, please rename the file and click "Ok" to continue.'), [ExtractFilePath(ExecutableString)+'history.dat']), 2);
     end;

  FormStatus.LabelStatusType.Caption:= GetLanguageText('Status Messages', 'CreateGamesListTitle', 'Create Games List');
  FormStatus.LabelStatusType.Refresh;

  FormStatus.LabelMessage.Caption:= GetLanguageText('Status Messages', 'CreateListInfoFile', 'Creating temporary listinfo file. Please, wait a moment...');
  FormStatus.LabelMessage.Refresh;

  LineResult:= SystemStr+ExecutableString+SystemStr+' -listinfo > '+SystemStr+FrontendPath+'ListInfo.tmp'+SystemStr;
  case Win32Platform of
    0,1: RunProcess('command.com /c '+LineResult, True, SW_SHOWMINIMIZED, False); //Win9x
      2: RunProcess('cmd.exe /c ' +SystemStr+LineResult+SystemStr, True, SW_SHOWMINIMIZED, False); // Win2000 and WinXP
  end;

  FormStatus.LabelMessage.Caption:= GetLanguageText('Status Messages', 'CreateListDetailsFile', 'Creating temporary listdetails file. Please, wait a moment...');
  FormStatus.LabelMessage.Refresh;

  LineResult:= SystemStr+ExecutableString+SystemStr+' -listdetails > '+SystemStr+FrontendPath+'ListDetails.tmp'+SystemStr;
  case Win32Platform of
    0,1: RunProcess('command.com /c '+LineResult, True, SW_SHOWMINIMIZED, False); //Win9x
      2: RunProcess('cmd.exe /c '+SystemStr+LineResult+SystemStr, True, SW_SHOWMINIMIZED, False); // Win2000 and WinXP
  end;
  LineResult:= '';
  if FormMain.Visible then
     FormMain.Refresh;

  case FileExists(FrontendPath+'ListInfo.tmp') of
    True:
      begin
        if not FileExists(FrontendPath+'ListDetails.tmp') then
           begin
             GenerateMessage(GetLanguageText('Messages', 'FileCreationErrorTitle', 'File Creation Error'),
                             GetLanguageText('Messages', 'FileListDetailsNotCreated', '"ListDetails.tmp" not created! Aborting...'), 2);
             Exit;
           end;
      end;
    False:
      begin
        case FileExists(FrontendPath+'ListDetails.tmp') of
          True:
            begin
              GenerateMessage(GetLanguageText('Messages', 'FileCreationErrorTitle', 'File Creation Error'),
                              GetLanguageText('Messages', 'FileListInfoNotCreated', 'File "ListInfo.tmp" not created! Aborting...'), 2);
              Exit;
            end;
          False:
            begin
              GenerateMessage(GetLanguageText('Messages', 'FileCreationErrorTitle', 'File Creation Error'),
                              GetLanguageText('Messages', 'FileListInfoListDetailsNotCreated', 'Files "ListInfo.tmp" and "ListDetails.tmp" not created! Aborting...'), 2);
              Exit;
            end;
        end;
      end;
  end;

  // both temporary files are sucessfully created :-)
  ListDetailsFile:= THashedStringList.Create;
  ListDetailsFile.LoadFromFile(FrontendPath+'ListDetails.tmp');
  ListDetailsFile.BeginUpdate;
  for Loop:=0 to ListDetailsFile.Count -1 do
    ListDetailsFile[Loop]:= Trim(Copy(ListDetailsFile[Loop], 1, 8))+'='+Trim(Copy(ListDetailsFile[Loop], 10, 10));
  ListDetailsFile.EndUpdate;

  ListInfoFile:= THashedStringList.Create;
  ListInfoFile.LoadFromFile(FrontendPath+'ListInfo.tmp');

  FormStatus.LabelProgress.Caption:= '';
  TotalProgress:= ListInfoFile.Count-1;
  ClassicMRList:= THashedStringList.Create;
  ClassicMVList:= THashedStringList.Create;
  ClassicCRList:= THashedStringList.Create;
  ClassicCVList:= THashedStringList.Create;
  NeoGeoMList:= THashedStringList.Create;
  NeoGeoCList:= THashedStringList.Create;
  UnavailableClassicMRList:= THashedStringList.Create;
  UnavailableClassicMVList:= THashedStringList.Create;
  UnavailableClassicCRList:= THashedStringList.Create;
  UnavailableClassicCVList:= THashedStringList.Create;
  UnavailableNeoGeoMList:= THashedStringList.Create;
  UnavailableNeoGeoCList:= THashedStringList.Create;
  BiosList:= THashedStringList.Create;
  UnavailableBiosList:= THashedStringList.Create;

  ClassicMRList.BeginUpdate;
  ClassicMVList.BeginUpdate;
  ClassicCRList.BeginUpdate;
  ClassicCVList.BeginUpdate;
  NeoGeoMList.BeginUpdate;
  NeoGeoCList.BeginUpdate;
  UnavailableClassicMRList.BeginUpdate;
  UnavailableClassicMVList.BeginUpdate;
  UnavailableClassicCRList.BeginUpdate;
  UnavailableClassicCVList.BeginUpdate;
  UnavailableNeoGeoMList.BeginUpdate;
  UnavailableNeoGeoCList.BeginUpdate;
  BiosList.BeginUpdate;
  UnavailableBiosList.BeginUpdate;

  ROMsList:= THashedStringList.Create;
  ROMsList.BeginUpdate;

  case Assigned(GameSizeBits) of
    true : GameSizeBits.Clear;
    false: GameSizeBits:= THashedStringList.Create;
  end;
  GameSizeBits.BeginUpdate;
  GameSizeBits.Add('; Game Size (in bytes)');

  ListROMsName:= THashedStringList.Create;
  ListROMsSize:= THashedStringList.Create;
  ListROMsCRC:= THashedStringList.Create;
  ParentListROMsName:= THashedStringList.Create;
  ParentListROMsSize:= THashedStringList.Create;
  ParentListROMsCRC:= THashedStringList.Create;

  if FileExists(FrontendPath+'catver.ini') then
     CategoriesList:= TMemIniFile.Create(FrontendPath+'catver.ini');

  if FormPreferences.UseCustomGameDescription.Checked then
     begin
       if FileExists(FrontendPath+'GameDescription.ini') then
          begin
            CustomDescriptionList:= THashedStringList.Create;
            CustomDescriptionList.LoadFromFile(FrontendPath+'GameDescription.ini');
            if CustomDescriptionList.Count = 0 then
               FreeAndNil(CustomDescriptionList);
          end;
     end;

  if FormPreferences.UseCustomGameCategory.Checked then
     begin
       if FileExists(FrontendPath+'GameCategory.ini') then
          begin
            CustomCategoryList:= THashedStringList.Create;
            CustomCategoryList.LoadFromFile(FrontendPath+'GameCategory.ini');
            if CustomCategoryList.Count = 0 then
               FreeAndNil(CustomCategoryList);
          end;
     end;

  FormStatus.LabelMessage.Caption:= GetLanguageText('Status Messages', 'SearchGames', 'Searching for games. Please, wait a moment...');
  FormStatus.LabelMessage.Refresh;

  BiosFoundMsg:= GetLanguageText('Status Messages', 'BiosFound', 'Bios %s found...');
  GameFoundMsg:= GetLanguageText('Status Messages', 'GameFound', 'Game %s found...');
  BiosMergedFoundMsg:= GetLanguageText('Status Messages', 'BiosMergedFound', 'Bios %s found merged in %s...');
  GameMergedFoundMsg:= GetLanguageText('Status Messages', 'GameMergedFound', 'Game %s found merged in %s...');

  FormStatus.SetFocus;
  for MainLoop:=0 to ListInfoFile.Count -1 do
  begin
    FileLine:= ListInfoFile[MainLoop];
    if FileLine = 'game (' then
       begin
         ClearMemoryColumnsVariables;
         ROMsDetailsLine:= '';
         TempString:= '';
         GameSize:= 0;

         IsNeoGeo:= False;
         isResource:= False;
         IsPlayChoice:= False;
         IsCvs:= False;
         IsPgm:= False;
         IsSuperKanekoNova:= False;
         IsResource:= False;
         IsSTV:= False;

         ListROMsName.Clear;
         ListROMsSize.Clear;
         ListROMsCRC.Clear;
       end
    else

    if ListInfoFile[MainLoop-1] = 'game (' then
       begin
         Delete(FileLine, 1, 6);
         mName:= FileLine;
         if ROMsList.Count > 0 then
            ROMsList.Add(' ');
         ROMsList.Add('game '+mName);

         // will search for the game in "catver.ini"

         if Assigned(CustomCategoryList) then
            mCategory:= CustomCategoryList.Values[mName];

         if Assigned(CategoriesList) then
            begin
              if mCategory = '' then
                 mCategory:= CategoriesList.ReadString('Category', mName, '');
              mVersionAdded:= CategoriesList.ReadString('VerAdded', mName, '');
            end;
         mDriver:= ListDetailsFile.Values[mName];
       end
    else

    if FileLine ='resource (' then
       begin
         ClearMemoryColumnsVariables;
         ROMsDetailsLine:= '';
         TempString:= '';
         GameSize:= 0;
       end
    else

    if ListInfoFile[MainLoop-1] = 'resource (' then
       begin
         Delete(FileLine, 1, 6);
         mName:= FileLine;
         if ROMsList.Count > 0 then
            ROMsList.Add(' ');

         ROMsList.Add('bios '+mName);
         IsResource:= True;
         
         IsNeoGeo:= mName = 'neogeo';
         IsPlayChoice:= mName = 'playch10';
         IsCvs:= mName = 'cvs';
         IsDecoSystem:= mName = 'decocass';
         IsPgm:= mName = 'pgm';
         IsSuperKanekoNova:= mName = 'skns';
         IsSTV:= mName = 'stvbios';

         ListROMsName.Clear;
         ListROMsSize.Clear;
         ListROMsCRC.Clear;

         // will search for the game in "catver.ini"
         if Assigned(CustomCategoryList) then
            mCategory:= CustomCategoryList.Values[mName];

         if Assigned(CategoriesList) then
            begin
              if mCategory = '' then
                 mCategory:= CategoriesList.ReadString('Category', mName, 'BIOS');
              mVersionAdded:= CategoriesList.ReadString('VerAdded', mName, '');
            end;
         mDriver:= ListDetailsFile.Values[mName];
       end
    else

    if Pos('history ', FileLine) > 0 then
       begin
         // do nothing, this line will be ignored but I need to test it...
       end
    else

    if Pos('description ', FileLine) > 0 then
       begin
         if Assigned(CustomDescriptionList) then
            mDescription:= CustomDescriptionList.Values[mName+'_custom'];

           if mDescription = '' then
              begin
                Delete(FileLine, 1, Pos('"', FileLine));
                Delete(FileLine, Length(FileLine), 1);
                mDescription:= FileLine;
              end;
       end
    else

    if Pos('year ', FileLine) > 0 then
       begin
         Delete(FileLine, 1, 6);
         mYear:= FileLine;
       end
    else

    if Pos('manufacturer ', FileLine) > 0 then
       begin
         Delete(FileLine, 1, Pos('"', FileLine));
         Delete(FileLine, Length(FileLine), 1);
         mManufacturer:= FileLine;
       end
    else

    if Pos('cloneof ', FileLine) > 0 then
       begin
         Position:= Pos('cloneof', FileLine);
         Delete(FileLine, 1, Position+7);
         mClone:= FileLine;
         ROMsList.Add('cloneof '+mClone);

         IsNeoGeo:= ((mClone = 'cloneof 2020bb')   or (mClone = 'cloneof breakers') or (mClone = 'cloneof burningf') or
                     (mClone = 'cloneof maglord')  or (mClone = 'cloneof puzzledp') or (mClone = 'cloneof sengoku')  or
                     (mClone = 'cloneof shocktro') or (mClone = 'cloneof ridhero')  or (mClone = 'cloneof kof99')    or
                     (mClone = 'cloneof garou')    or (mClone = 'cloneof mslug3')   or (mClone = 'cloneof kof2000')  or
                     (mClone = 'cloneof aof'));
         if IsNeoGeo then
            mROMIdentification:= 5; // it's a Neo-Geo Clone

         IsCvs:= ((mClone = 'cloneof 8ball') or (mClone = 'cloneof radarzon')); // it's a Classic Clone (CVS)

         IsDecoSystem:= ((mClone = 'cloneof ctisland') or (mClone = 'cloneof cdiscon1') or (mClone = 'cloneof cburnrub') or
                         (mClone = 'cloneof cgraplop') or (mClone = 'cloneof clapapa')  or (mClone = 'cloneof cnightst') or
                         (mClone = 'cloneof cscrtry')  or (mClone = 'cloneof cppicf')); // it's a Classic Clone (DECO)

         IsPgm:= ((mClone = 'cloneof orlegend') or (mClone = 'cloneof kov')); // it's a Classic Clone (PGM)

         IsSuperKanekoNova:= (mClone = 'cloneof puzzloop'); // it's a Classic Clone (SKNS)
       end
    else

    if Pos('romof ', FileLine) > 0 then
       begin
         Delete(FileLine, 1, 1);

         IsNeoGeo:= ((FileLine = 'romof 2020bb')   or (FileLine = 'romof breakers') or (FileLine = 'romof burningf') or
                     (FileLine = 'romof maglord')  or (FileLine = 'romof puzzledp') or (FileLine = 'romof sengoku')  or
                     (FileLine = 'romof shocktro') or (FileLine = 'romof ridhero')  or (FileLine = 'romof kof99')    or
                     (FileLine = 'romof garou')    or (FileLine = 'romof mslug3')   or (FileLine = 'romof kof2000')  or
                     (FileLine = 'romof aof'));

         case IsNeoGeo of
           True: mROMIdentification:= 5; // it's a Neo-Geo Clone
           False:
             begin
               IsNeoGeo:= (FileLine = 'romof neogeo');
               if IsNeoGeo then
                  mROMIdentification:= 4; // it's a Neo-Geo Master
             end;
         end;

         IsPlayChoice:= (FileLine = 'romof playch10');

         IsCvs:= ((FileLine = 'romof cvs') or (FileLine = 'romof 8ball') or (FileLine = 'romof radarzon')); // it's a Classic Clone (CVS)

         IsDecoSystem:= ((FileLine = 'romof decocass') or (FileLine = 'romof ctisland') or (FileLine = 'romof cdiscon1') or
                         (FileLine = 'romof cburnrub') or (FileLine = 'romof cgraplop') or (FileLine = 'romof clapapa')  or
                         (FileLine = 'romof cnightst') or (FileLine = 'romof cscrtry')  or (FileLine = 'romof cppicf')); // it's a Classic Clone (DECO)

         IsPgm:= ((FileLine = 'romof pgm') or (FileLine = 'romof orlegend') or (FileLine = 'romof kov')); // it's a Classic Clone (PGM)

         IsSuperKanekoNova:= ((FileLine = 'romof skns') or (FileLine = 'romof puzzloop')); // it's a Classic Clone (SKNS)

         IsSTV:= (FileLine = 'romof stvbios');
       end
    else

    if (Pos('rom (', FileLine) > 0) or (Pos('disk (', FileLine) > 0) then
       begin
         // will need to test all the other resources files
         if VerifyResourceFiles(IsResource, FileLine) then
         begin
           TempString:= '';
           // Will get the name of the ROM first
           Position:= Pos('name ', FileLine);
           for Loop:=Position+5 to Length(FileLine) do
           begin
             if FileLine[Loop] <> ' ' then
                begin
                  ROMsDetailsLine:= ROMsDetailsLine+FileLine[Loop];
                  TempString:= TempString+FileLine[Loop];
                end
             else
                begin
                  ListROMsName.Add(TempString);
                  ROMsDetailsLine:= ROMsDetailsLine+'¬';
                  Break;
                end;
           end;
           // now will get the size of the ROM
           TempString:= '';
           Position:= Pos('size ', FileLine);
           if Position <> 0 then
              begin
                for Loop:= Position+5 to Length(FileLine) do
                begin
                  if FileLine[Loop] <> ' ' then
                     begin
                       ROMsDetailsLine:= ROMsDetailsLine+FileLine[Loop];
                       TempString:= TempString+FileLine[Loop];
                     end
                  else
                     begin
                       ListROMsSize.Add(TempString);
                       ROMsDetailsLine:= ROMsDetailsLine+'¬';
                       GameSize:= GameSize+StrToInt(TempString);
                       TempString:= '';
                       Break;
                     end;
                end;
              end
           else
           if Position = 0 then
              begin
                ListROMsSize.Add('0');
                ROMsDetailsLine:= ROMsDetailsLine+'0¬';
                GameSize:= GameSize+0;
              end;

           // now will get the crc of the ROM
           TempString:= '';
           Position:= Pos('crc ', FileLine);
           if Position <> 0 then
              begin
                for Loop:= Position+4 to Length(FileLine) do
                begin
                  if FileLine[Loop] <> ' ' then
                     begin
                       ROMsDetailsLine:= ROMsDetailsLine+FileLine[Loop];
                       TempString:= TempString+FileLine[Loop];
                     end
                  else
                     begin
                       ListROMsCRC.Add(TempString);
                       ROMsDetailsLine:= ROMsDetailsLine+';';
                       Break;
                     end;
                end;
              end
           else
           if Position = 0 then
              begin
                Position:= Pos('md5 ', FileLine);
                if Position <> 0 then
                   begin
                     for Loop:= Position+4 to Length(FileLine) do
                     begin
                       if FileLine[Loop] <> ' ' then
                          begin
                            ROMsDetailsLine:= ROMsDetailsLine+FileLine[Loop];
                            TempString:= TempString+FileLine[Loop];
                          end
                       else
                          begin
                            ListROMsCRC.Add(TempString);
                            ROMsDetailsLine:= ROMsDetailsLine+';';
                            Break;
                          end;
                     end;
                   end
              end;
           ROMsList.Add(ROMsDetailsLine);
           ROMsDetailsLine:= '';
         end;
       end
    else

    if Pos('sampleof ', FileLine) > 0 then
       begin
         if (mSamples = 'No') or (mSamples = '') then
            mSamples:= 'Yes';
       end
    else

    if Pos('sample ', FileLine) > 0 then
       begin
         if (mSamples = 'No') or (mSamples = '') then
            mSamples:= 'Yes';
       end;

    if Pos('chip (', FileLine) > 0 then
       begin
         if Pos('type audio name Samples', FileLine) > 0 then
            begin
              if (mSamples = 'No') or (mSamples = '') then
                 mSamples:= 'Yes';
            end;
       end
    else

    if Pos('video (', FileLine) > 0 then
       begin
         // will get the Video Type
         if Pos('screen raster', FileLine) > 0 then
            mVideo:= 'Raster' else
         if Pos('screen vector', FileLine) > 0 then
            mVideo:= 'Vector' else mVideo:= 'Unknown';

         // will get the orientation
         if Pos('orientation vertical', FileLine) > 0 then
            mOrientation:= 'Vertical' else
         if Pos('orientation horizontal', FileLine) > 0 then
            mOrientation:= 'Horizontal' else mOrientation:= 'Unknown';

         // will get the resolution
         if Pos(' x ', FileLine) > 0 then
            begin
              Position:= Pos(' x ', FileLine)+3;
              for Loop:=Position to Length(FileLine) do
              begin
                if FileLine[Loop] <> ' ' then
                   mResolution:= mResolution+FileLine[Loop]
                else
                   begin
                     mResolution:= mResolution+'x';
                     Break;
                   end;
              end;

              Position:= Pos(' y ', FileLine)+3;
              for Loop:=Position to Length(FileLine) do
              begin
                if FileLine[Loop] <> ' ' then
                   mResolution:= mResolution+FileLine[Loop]
                else
                   Break;
              end;
            end;

         // will get the frequency
         if Pos(' freq ', FileLine) > 0 then
            begin
              Position:= Pos(' freq ', FileLine)+6;
              for Loop:=Position to Length(FileLine) do
              begin
                if FileLine[Loop] <> '.' then
                   mFrequency:= mFrequency+FileLine[Loop]
                else
                   begin
                     mFrequency:= mFrequency+' Hz';
                     Break;
                   end;
              end;
            end else mFrequency:= 'Unknown';
       end
    else

    if Pos('sound (', FileLine) > 0 then
       begin
         if Pos('channels 0', FileLine) > 0 then
            mSound:= ''
         else
         if Pos('channels 1', FileLine) > 0 then
            mSound:= 'Mono'
         else
         if Pos('channels 2', FileLine) > 0 then
            mSound:= 'Stereo' else mSound:= 'Unknown';
       end
    else

    if Pos('input (', FileLine) > 0 then
       begin
         if Pos('control ', FileLine) > 0 then
            begin
              if Pos('joy4way', FileLine) > 0 then
                 mControlType:= 'Joy 4 Way'
              else
              if Pos('joy8way', FileLine) > 0 then
                 mControlType:= 'Joy 8 Way'
              else
              if Pos('doublejoy4way', FileLine) > 0 then
                 mControlType:= 'Double Joy 4 Way'
              else
              if Pos('doublejoy8way', FileLine) > 0 then
                 mControlType:= 'Double Joy 8 Way'
              else
              if Pos('dial', FileLine) > 0 then
                 mControlType:= 'Dial'
              else
              if Pos('paddle', FileLine) > 0 then
                 mControlType:= 'Paddle'
              else
              if Pos('stick', FileLine) > 0 then
                 mControlType:= 'Stick'
              else
              if Pos('trackball', FileLine) > 0 then
                 mControlType:= 'Trackball'
              else
              if Pos('lightgun', FileLine) > 0 then
                 mControlType:= 'Light Gun' else mControlType:= 'Unknown';
            end
         else
            mControlType:= 'Buttons';
       end
    else

    if Pos('driver (', FileLine) > 0 then
       begin
         if Pos('status good', FileLine) > 0 then
            mDriverStatus:= 'Good'
         else
         if Pos('status preliminary', FileLine) > 0 then
            mDriverStatus:= 'Preliminary'
         else
         if Pos('status imperfect', FileLine) > 0 then
            mDriverStatus:= 'Imperfect' else mDriverStatus:= 'Unknown';

         if Pos('color good', FileLine) > 0 then
            mColorStatus:= 'Good'
         else
         if Pos('color preliminary', FileLine) > 0 then
            mColorStatus:= 'Preliminary'
         else
         if Pos('color imperfect', FileLine) > 0 then
            mColorStatus:= 'Imperfect' else mColorStatus:= 'Unknown';

         if Pos('sound good', FileLine) > 0 then
            mSoundStatus:= 'Good'
         else
         if Pos('sound preliminary', FileLine) > 0 then
            mSoundStatus:= 'Preliminary'
         else
         if Pos('sound imperfect', FileLine) > 0 then
            mSoundStatus:= 'Imperfect' else mSoundStatus:= 'Unknown';
       end
    else

    if FileLine = ')' then
       begin
         // reached the end of the games details info
         // must verify if is clone or master
         // must verify if is neogeo or classic
         // must verify is is raster or vector

         if mVideo = 'Raster' then
            begin
              // it's a raster game
              if mClone = '' then
                 begin
                   // it's a master game
                   if mROMIdentification <> 4 then // if it's not a Neo-Geo Master
                      mROMIdentification:= 0; // it's a Classic Master Raster
                 end
              else
                 begin
                   // it's a clone game
                   if mROMIdentification <> 5 then // if it's not a Neo-Geo Clone
                      mROMIdentification:= 2;
                 end;
            end
         else
         if mVideo = 'Vector' then
            begin
              // it's a vector game
              if mClone = '' then
                 mROMIdentification:= 1  // it's a master game
              else
                 mROMIdentification:= 3; // it's a clone game
            end;

         if mName = 'neogeo' then
            mROMIdentification:= 13
         else
         if (mName = 'playch10') or (mName = 'cvs') or (mName = 'decocass') or (mName = 'pgm') or (mName = 'skns') or (mName = 'stvbios') then
            mROMIdentification:= 12;

         ROMDataLine:= PopulateROMDataLine;

         if GameSizeBits.IndexOfName(mName) = -1 then
            GameSizeBits.Add(mName+'='+IntToStr(GameSize)); // game not found, will add it to the list

         case SearchZIP(mName) of
           True:
             begin
               case isResource of
                 True:
                   begin
                     FormStatus.LabelMessage.Caption:= Format(BiosFoundMsg, [mName]);
                     Inc(TotalResourcesFound);
                   end;
                 False:
                   begin
                     FormStatus.LabelMessage.Caption:= Format(GameFoundMsg, [mName]);
                     Inc(TotalGamesFound);
                   end;
               end;
               FormStatus.LabelMessage.Refresh;

               case mROMIdentification of
                 0: ClassicMRList.Add(ROMDataLine);
                 1: ClassicMVList.Add(ROMDataLine);
                 2: ClassicCRList.Add(ROMDataLine);
                 3: ClassicCVList.Add(ROMDataLine);
                 4: NeoGeoMList.Add(ROMDataLine);
                 5: NeoGeoCList.Add(ROMDataLine);
                12, 13: BiosList.Add(ROMDataLine);
               end;
             end;
           False:
             begin
               // see if it's a clone game
               // if yes, search for merged
               if mClone <> '' then
                  begin
                    case FoundMerged(mName, mClone) of
                      True:
                        begin
                          mMerged:= 'Yes';
                          ROMDataLine:= PopulateROMDataLine;
                          case isResource of
                            True:
                              begin
                                FormStatus.LabelMessage.Caption:= Format(BiosMergedFoundMsg, [mName, mClone]);
                                Inc(TotalResourcesFound);
                              end;
                            False:
                              begin
                                FormStatus.LabelMessage.Caption:= Format(GameMergedFoundMsg, [mName, mClone]);
                                Inc(TotalMergedGamesFound);
                              end;
                          end;
                          FormStatus.LabelMessage.Refresh;

                          case mROMIdentification of
                            0: ClassicMRList.Add(ROMDataLine);
                            1: ClassicMVList.Add(ROMDataLine);
                            2: ClassicCRList.Add(ROMDataLine);
                            3: ClassicCVList.Add(ROMDataLine);
                            4: NeoGeoMList.Add(ROMDataLine);
                            5: NeoGeoCList.Add(ROMDataLine);
                           12, 13: BiosList.Add(ROMDataLine);
                          end;
                        end;
                      False:
                        begin
                          Inc(TotalNotFound);
                          case mROMIdentification of
                             0: mROMIdentification:= 6;
                             1: mROMIdentification:= 7;
                             2: mROMIdentification:= 8;
                             3: mROMIdentification:= 9;
                             4: mROMIdentification:= 10;
                             5: mROMIdentification:= 11;
                            12: mROMIdentification:= 14;
                            13: mROMIdentification:= 15;
                          end;

                          ROMDataLine:= PopulateROMDataLine;

                          case mROMIdentification of
                            6: UnavailableClassicMRList.Add(ROMDataLine);
                            7: UnavailableClassicMVList.Add(ROMDataLine);
                            8: UnavailableClassicCRList.Add(ROMDataLine);
                            9: UnavailableClassicCVList.Add(ROMDataLine);
                           10: UnavailableNeoGeoMList.Add(ROMDataLine);
                           11: UnavailableNeoGeoCList.Add(ROMDataLine);
                           14, 15: UnavailableBiosList.Add(ROMDataLine)
                          end;
                        end;
                    end;
                  end
               else
                  begin
                    Inc(TotalNotFound);
                    case mROMIdentification of
                       0: mROMIdentification:= 6;
                       1: mROMIdentification:= 7;
                       2: mROMIdentification:= 8;
                       3: mROMIdentification:= 9;
                       4: mROMIdentification:= 10;
                       5: mROMIdentification:= 11;
                      12: mROMIdentification:= 14;
                      13: mROMIdentification:= 15;
                    end;

                    ROMDataLine:= PopulateROMDataLine;

                    case mROMIdentification of
                      6: UnavailableClassicMRList.Add(ROMDataLine);
                      7: UnavailableClassicMVList.Add(ROMDataLine);
                      8: UnavailableClassicCRList.Add(ROMDataLine);
                      9: UnavailableClassicCVList.Add(ROMDataLine);
                     10: UnavailableNeoGeoMList.Add(ROMDataLine);
                     11: UnavailableNeoGeoCList.Add(ROMDataLine);
                     14, 15: UnavailableBiosList.Add(ROMDataLine)
                    end;
                  end;
             end;
         end;
       end;
    UpdateProgressLabel(MainLoop, TotalProgress, False);
    Application.ProcessMessages;


    if StopBuildDatabase then
       begin
         FreeAndNil(ListInfoFile);
         FreeAndNil(ROMsList);
         FreeAndNil(CustomDescriptionList);
         Result:= False;
         RestoreHistoryFile;
         GenerateMessage(GetLanguageText('Messages', 'CancelOperation', 'Operation Canceled'),
                         GetLanguageText('Messages', 'BuildGamesCancelMsg', 'Games list build is canceled!'), 2);
         Exit;
       end;
  end;
  FreeAndNil(ListInfoFile);
  FreeAndNil(ListDetailsFile);
  FreeAndNil(CustomDescriptionList);
  FreeAndNil(CustomCategoryList);

  ROMsList.EndUpdate;
  GameSizeBits.EndUpdate;
  GameSizeBits.Sort;

  FolderName:= '';
  CheckFolder:= False;
  case DefaultDatabase of
    True: FolderName:= FrontendPath+'resources\';
    False:
      begin
        //FolderName:=InputBox(GetLanguageText(FrontendLanguage, 'Messages', 'GetEmulatorVersionFailedTitle', 'Unable to get the file version!', False),
        //                             Format(GetLanguageText(FrontendLanguage, 'Messages', 'GetEmulatorVersionFailedMsg', 'Enter a description for Executable %u', False), [EmulatorNumber]),
        //                             EmulatorVersion);

        while FolderName = '' do
        begin
          FolderName:= InputBox('Folder Name', 'Enter a folder name', 'New DB');
        end;

        //while CheckFolder = False do
        while not CheckFolder do
        begin
          case DirectoryExists(FrontendPath+'resources\'+FolderName) of
            True:
             begin
                case GenerateMessage('Folder Found', 'The folder "'+FrontendPath+'resources\'+FolderName+'" already exists! Continue?', 1) of
                  mrYes: CheckFolder:= True;
                  mrNo:
                    begin
                      FolderName:= '';
                      while FolderName = '' do
                      begin
                        FolderName:= InputBox('Folder Name', 'Enter a folder name', 'New DB');
                      end;
                    end;
                end;
              end;
            False:
              begin
                CheckFolder:= True;
              end;
          end;
        end;
        FolderName:= FrontendPath+'resources\'+FolderName+'\';
        ForceDirectories(FolderName);
      end;
  end;
  FormStatus.LabelProgress.Caption:= '';
  if FileExists(FolderName+'ROMs.dat') then
     DeleteFile(FolderName+'ROMs.dat');

  ROMsList.SaveToFile(FolderName+'ROMs.dat');

  FreeAndNil(ROMsList);

  ClassicMRList.EndUpdate;
  ClassicMVList.EndUpdate;
  ClassicCRList.EndUpdate;
  ClassicCVList.EndUpdate;
  NeoGeoMList.EndUpdate;
  NeoGeoCList.EndUpdate;
  UnavailableClassicMRList.EndUpdate;
  UnavailableClassicMVList.EndUpdate;
  UnavailableClassicCRList.EndUpdate;
  UnavailableClassicCVList.EndUpdate;
  UnavailableNeoGeoMList.EndUpdate;
  UnavailableNeoGeoCList.EndUpdate;
  BiosList.EndUpdate;
  UnavailableBiosList.EndUpdate;

  FormStatus.LabelMessage.Caption:= GetStatusMessage('SaveClassicMR');
  FormStatus.LabelMessage.Refresh;
  ClassicMRList.SaveToFile(FolderName+'ClassicMR.dat');

  FormStatus.LabelMessage.Caption:= GetStatusMessage('SaveClassicMV');
  FormStatus.LabelMessage.Refresh;
  ClassicMVList.SaveToFile(FolderName+'ClassicMV.dat');

  FormStatus.LabelMessage.Caption:= GetStatusMessage('SaveClassicCR');
  FormStatus.LabelMessage.Refresh;
  ClassicCRList.SaveToFile(FolderName+'ClassicCR.dat');

  FormStatus.LabelMessage.Caption:= GetStatusMessage('SaveClassicCV');
  FormStatus.LabelMessage.Refresh;
  ClassicCVList.SaveToFile(FolderName+'ClassicCV.dat');

  FormStatus.LabelMessage.Caption:= GetStatusMessage('SaveNeoGeoM');
  FormStatus.LabelMessage.Refresh;
  NeoGeoMList.SaveToFile(FolderName+'NeoGeoM.dat');

  FormStatus.LabelMessage.Caption:= GetStatusMessage('SaveNeoGeoC');
  FormStatus.LabelMessage.Refresh;
  NeoGeoCList.SaveToFile(FolderName+'NeoGeoC.dat');

  FormStatus.LabelMessage.Caption:= GetStatusMessage('SaveBios');
  FormStatus.LabelMessage.Refresh;
  BiosList.SaveToFile(FolderName+'BIOS.dat');

  FormStatus.LabelMessage.Caption:= GetStatusMessage('SaveUnClassicMR');
  FormStatus.LabelMessage.Refresh;
  UnavailableClassicMRList.SaveToFile(FolderName+'UnClassicMR.dat');

  FormStatus.LabelMessage.Caption:= GetStatusMessage('SaveUnClassicMV');
  FormStatus.LabelMessage.Refresh;
  UnavailableClassicMVList.SaveToFile(FolderName+'UnClassicMV.dat');

  FormStatus.LabelMessage.Caption:= GetStatusMessage('SaveUnClassicCR');
  FormStatus.LabelMessage.Refresh;
  UnavailableClassicCRList.SaveToFile(FolderName+'UnClassicCR.dat');

  FormStatus.LabelMessage.Caption:= GetStatusMessage('SaveUnClassicCV');
  FormStatus.LabelMessage.Refresh;
  UnavailableClassicCVList.SaveToFile(FolderName+'UnClassicCV.dat');

  FormStatus.LabelMessage.Caption:= GetStatusMessage('SaveUnNeoGeoM');
  FormStatus.LabelMessage.Refresh;
  UnavailableNeoGeoMList.SaveToFile(FolderName+'UnNeoGeoM.dat');

  FormStatus.LabelMessage.Caption:= GetStatusMessage('SaveUnNeoGeoC');
  FormStatus.LabelMessage.Refresh;
  UnavailableNeoGeoCList.SaveToFile(FolderName+'UnNeoGeoC.dat');

  FormStatus.LabelMessage.Caption:= GetStatusMessage('SaveUnBios');
  FormStatus.LabelMessage.Refresh;
  UnavailableBiosList.SaveToFile(FolderName+'UnBIOS.dat');

  FreeAndNil(ClassicMRList);
  FreeAndNil(ClassicMVList);
  FreeAndNil(ClassicCRList);
  FreeAndNil(ClassicCVList);
  FreeAndNil(NeoGeoMList);
  FreeAndNil(NeoGeoCList);
  FreeAndNil(UnavailableClassicMRList);
  FreeAndNil(UnavailableClassicMVList);
  FreeAndNil(UnavailableClassicCRList);
  FreeAndNil(UnavailableClassicCVList);
  FreeAndNil(UnavailableNeoGeoMList);
  FreeAndNil(UnavailableNeoGeoCList);
  FreeAndNil(BiosList);
  FreeAndNil(UnavailableBiosList);
  FreeAndNil(CategoriesList);
  FreeAndNil(ListROMsName);
  FreeAndNil(ListROMsSize);
  FreeAndNil(ListROMsCRC);
  FreeAndNil(ParentListROMsName);
  FreeAndNil(ParentListROMsSize);
  FreeAndNil(ParentListROMsCRC);

  GameSizeBits.SaveToFile(FolderName+'GameSize.dat');

  RestoreHistoryFile;

  FormStatus.LabelMessage.Caption:= GetLanguageText('Status Messages', 'DeleteListInfoFile', 'Deleting file ListInfo.tmp from disk...');
  FormStatus.LabelMessage.Refresh;
  if FileExists(FrontendPath+'ListInfo.tmp') then
     DeleteFile(FrontendPath+'ListInfo.tmp');

  FormStatus.LabelMessage.Caption:= GetLanguageText('Status Messages', 'DeleteListDetailsFile', 'Deleting file ListDetails.tmp from disk...');
  FormStatus.LabelMessage.Refresh;
  if FileExists(FrontendPath+'ListDetails.tmp') then
     DeleteFile(FrontendPath+'ListDetails.tmp');

  //EndClock:=GetTickCount;
  //ShowMessage(IntToStr(EndClock-StartClock));
  FormMain.Visible:= True;
  Application.ProcessMessages;
  if FormPreferences.ShowStatistics.Checked then
     GenerateMessage('Database Build Statistics', 'Total Split Games Found: '+IntToStr(TotalGamesFound)+#13+
                     'Total Merged Games Found: '+IntToStr(TotalMergedGamesFound)+#13+
                     'Total Resources Found: '+IntToStr(TotalResourcesFound)+#13+
                     'Total Games Missing: '+IntToStr(TotalNotFound), 2);
end;

function TFormMain.StopBuildDatabase: Boolean;
begin
  Result:= False;
  if CancelCurrentOperation then
     begin
       case GenerateMessage(GetLanguageText('Messages', 'CancelTitle', 'Cancel'),
                            GetLanguageText('Messages', 'StopGamesBuildMsg', 'Stop building the games list ? The current games list will not be changed.'), 1) of
         mrYes:
           begin
             Result:= True;
             FreeAndNil(ClassicMRList);
             FreeAndNil(ClassicMVList);
             FreeAndNil(ClassicCRList);
             FreeAndNil(ClassicCVList);
             FreeAndNil(NeoGeoMList);
             FreeAndNil(NeoGeoCList);
             FreeAndNil(UnavailableClassicMRList);
             FreeAndNil(UnavailableClassicMVList);
             FreeAndNil(UnavailableClassicCRList);
             FreeAndNil(UnavailableClassicCVList);
             FreeAndNil(UnavailableNeoGeoMList);
             FreeAndNil(UnavailableNeoGeoCList);
             FreeAndNil(BiosList);
             FreeAndNil(UnavailableBiosList);
             FreeAndNil(CategoriesList);
             FreeAndNil(ListROMsName);
             FreeAndNil(ListROMsSize);
             FreeAndNil(ListROMsCRC);
             FreeAndNil(ParentListROMsName);
             FreeAndNil(ParentListROMsSize);
             FreeAndNil(ParentListROMsCRC);

             FormStatus.LabelMessage.Caption:= GetLanguageText('Status Messages', 'DeleteListInfoFile', 'Deleting file ListInfo.tmp from disk...');
             FormStatus.LabelMessage.Refresh;
             if FileExists(FrontendPath+'ListInfo.tmp') then
                DeleteFile(FrontendPath+'ListInfo.tmp');

             FormStatus.LabelMessage.Caption:= GetLanguageText('Status Messages', 'DeleteListDetailsFile', 'Deleting file ListDetails.tmp from disk...');
             FormStatus.LabelMessage.Refresh;
             if FileExists(FrontendPath+'ListDetails.tmp') then
                DeleteFile(FrontendPath+'ListDetails.tmp');

             FormStatus.KeyPreview:= False;
             FormStatus.LabelProgress.Caption:= '';
             FormStatus.Close;
             FormMain.Visible:= True;
             CancelCurrentOperation:= False;
             Application.ProcessMessages;
           end;
         mrNo: CancelCurrentOperation:= False;
       end;
     end;
end;
// end of new procedure

function TFormMain.LoadROMClasses(FavoriteList: Boolean): Boolean;
//var
//  StartClock, EndClock: Integer;
begin
  //StartClock:= GetTickCount;
  if CheckDefaultIconsFile then
     ReadDefaultIconsFile;

  CompleteGamesList:= THashedStringList.Create;
  if FormStatus.Visible then
     begin
       FormStatus.LabelStatusType.Caption:= GetLanguageText('Status Messages', 'LoadGamesTitle', 'Loading Games');
       FormStatus.LabelStatusType.Refresh;
     end;
  case FavoriteList of
    False:
      begin
        if ClassicMR              then LoadGames('ClassicMR', False, '');
        if ClassicMV              then LoadGames('ClassicMV', False, '');
        if ClassicCR              then LoadGames('ClassicCR', False, '');
        if ClassicCV              then LoadGames('ClassicCV', False, '');
        if NeoGeoM                then LoadGames('NeoGeoM', False, '');
        if NeoGeoC                then LoadGames('NeoGeoC', False, '');
        if UnavailableClassicMR   then LoadGames('UnClassicMR', False, '');
        if UnavailableClassicMV   then LoadGames('UnClassicMV', False, '');
        if UnavailableClassicCR   then LoadGames('UnClassicCR', False, '');
        if UnavailableClassicCV   then LoadGames('UnClassicCV', False, '');
        if UnavailableNeoGeoM     then LoadGames('UnNeoGeoM', False, '');
        if UnavailableNeoGeoC     then LoadGames('UnNeoGeoC', False, '');
        if BiosClassic            then LoadGames('Bios', False, 'ClassicBios');
        if BiosNeoGeo             then LoadGames('Bios', False, 'NeoGeoBios');
        if UnavailableBiosClassic then LoadGames('UnBios', False, 'UnClassicBios');
        if UnavailableBiosNeoGeo  then LoadGames('UnBios', False, 'UnNeoGeoBios');

        if CustomGames            then LoadGames('CustomGames', False, '');
        if UnavailableCustomGames then LoadGames('UnCustomGames', False, '');
      end;
    True: LoadGames(FavoriteUser, True, '');
  end;

  Result:= AddGames(True);
  FreeAndNil(CompleteGamesList);
  if Result then
     begin
       SetRealIcons;
       StatusBarShownGames.Caption:= Format(GetLanguageText('Main', 'StatusBarShownGames', '%u Games'), [Length(GamesList)]);
     end;
  ClearMemoryColumnsVariables;
  //EndClock:=GetTickCount;
  //ShowMessage(IntToStr(EndClock-StartClock));
end;

function TFormMain.LoadROMFilters(const GamesFilter: String): Boolean;
begin
  if GamesFilter = 'ClassicBios' then
     LoadGames('Bios', False, 'ClassicBios')
  else
  if GamesFilter = 'NeoGeoBios' then
     LoadGames('Bios', False, 'NeoGeoBios')
  else
  if GamesFilter = 'UnClassicBios' then
     LoadGames('UnBios', False, 'UnClassicBios')
  else
  if GamesFilter = 'UnNeoGeoBios' then
     LoadGames('UnBios', False, 'UnNeoGeoBios')
  else
     LoadGames(GamesFilter, False, '');
  Result:= True;
end;

procedure TFormMain.GetROMFields(const ROMLine: String);
var
  TempField: String;
  Loop, FieldNumber: Integer;
begin
  TempField:= '';
  FieldNumber:= 1;
  for Loop:=1 to Length(ROMLine) do
  begin
    if (ROMLine[Loop] = '¬') or (ROMLine[Loop] = ';') then
       begin
         case FieldNumber of
           1 : mROMIdentification:= StrToInt(TempField);
           2 : mDescription:= TempField;
           3 : mYear:= TempField;
           4 : mManufacturer:= TempField;
           5 : mSound:= TempField;
           6 : mFrequency:= TempField;
           7 : mSamples:= TempField;
           8 : mControlType:= TempField;
           9 : mVideo:= TempField;
           10: mOrientation:= TempField;
           11: mResolution:= TempField;
           12: mDriverStatus:= TempField;
           13: mSoundStatus:= TempField;
           14: mColorStatus:= TempField;
           15: mMerged:= TempField;
           16: mName:= TempField;
           17: mClone:= TempField;
           18: mCategory:= TempField;
           19: mVersionAdded:= TempField;
           20: mDriver:= TempField;
         end;
         TempField:= '';
         Inc(FieldNumber);
       end
    else
       TempField:= TempField+ROMLine[Loop];
  end;
end;

procedure TFormMain.GetGameROMs(ROMLine: String; Auditing: Boolean);
var
  TempField: String;
  Loop, FieldNumber: Integer;
begin
  TempField:= '';
  FieldNumber:= 1;
  for Loop:=1 to Length(ROMLine) do
  begin
    if (ROMLine[Loop] = '¬') or (ROMLine[Loop] = ';') then
       begin
         case Auditing of
           False:
             begin
               case FieldNumber of
                 1: ListROMsName.Add(TempField);
                 2: ListROMsSize.Add(TempField);
                 3: ListROMsCRC.Add(TempField);
               end;
             end;
           True:
             begin
               case FieldNumber of
                 1: FormAudit.ROMsName.Add(TempField);
                 2: FormAudit.ROMsSize.Add(TempField);
                 3: FormAudit.ROMsCRC.Add(TempField);
               end;
             end;
         end;
         TempField:= '';
         Inc(FieldNumber);
       end
    else
       TempField:= TempField+ROMLine[Loop];
  end;
end;

procedure TFormMain.SetRealIcons;
var
  Loop: Integer;
begin
  if not MenuRealIcons.Checked then
     Exit;

  if BigRealIconsImageList.Count = 1 then
     begin
       MenuRealIcons.OnClick(Self);
       Exit;
     end;

  if Length(GamesList) = 0 then
     Exit;

  RealIconsDAT:= TMemIniFile.Create(FrontendPath+'resources\IconsList.ini');
  List.LargeImages:= BigRealIconsImageList;
  List.SmallImages:= SmallRealIconsImageList;
  for Loop:=0 to Length(GamesList)-1 do
  begin
    GamesList[Loop].eImageIndex:= RealIconsDAT.ReadInteger('IconsOrder', GamesList[Loop].eName, 0);
  end;
  FreeAndNil(RealIconsDAT);
  List.Invalidate;
end;

function TFormMain.LoadGames(ClassificationName: String; IsFavorite: Boolean; BiosTypeName: String): Boolean;
var
  ClassFile: THashedStringList;
  ROMLine, DATFolder: String;
  AddToList: Boolean;
  Loop: Integer;
begin
  AddToList:= True;

  case IsFavorite of
    True : DATFolder:= FrontendPath+'resources\favorites\';
    False: DATFolder:= FrontendPath+'resources\';
  end;

  Result:= (FileExists(DATFolder+ClassificationName+'.dat')) or (GetFileSize(DATFolder+ClassificationName+'.dat') > 0);

  if Result then
     begin
       ClassFile:= THashedStringList.Create;
       ClassFile.LoadFromFile(DATFolder+ClassificationName+'.dat');
       for Loop:=0 to ClassFile.Count -1 do
       begin
         ROMLine:= ClassFile[Loop];

         if BiosTypeName = 'ClassicBios' then
            AddToList:= Copy(ROMLine, 1, 2) = '12'
         else
         if BiosTypeName = 'NeoGeoBios' then
            AddToList:= Copy(ROMLine, 1, 2) = '13'
         else
         if BiosTypeName = 'UnClassicBios' then
            AddToList:= Copy(ROMLine, 1, 2) = '14'
         else
         if BiosTypeName = 'UnNeoGeoBios' then
            AddToList:= Copy(ROMLine, 1, 2) = '15'
         else
           AddToList:= True;

         if AddToList then
            CompleteGamesList.Add(ClassFile[Loop]);
       end;
       FreeAndNil(ClassFile);
     end;
end;

procedure TFormMain.ScanLockedGames(mGamesList: THashedStringList);
var
  Loop: Integer;
  TempList: THashedStringList;
begin
  if not MenuParentalLock.Checked then
     Exit;

  TempList:= THashedStringList.Create;
  TempList.BeginUpdate;
  mGamesList.BeginUpdate;
  if FormStatus.Visible then
     begin
       FormStatus.LabelStatusType.Caption:= GetLanguageText('Status Messages', 'ParentalLockTitle', 'Parental Lock');
       FormStatus.LabelMessage.Caption:= GetLanguageText('Status Messages', 'ParentalLockVerifyLockedGames', 'Verifying locked games. Please, wait a moment...');
       FormStatus.LabelMessage.Refresh;
       FormStatus.LabelProgress.Caption:= '';
     end;
  for Loop:= mGamesList.Count-1 downto 0 do
  begin
    ClearMemoryColumnsVariables;
    GetROMFields(mGamesList[Loop]);
    if ParentalLockGamesList.IndexOf(mName) = -1 then
       TempList.Add(mGamesList[Loop]);
  end;
  TempList.EndUpdate;
  if TempList.Count > 0 then
     begin
       mGamesList.Clear;
       mGamesList.Assign(TempList);
     end;
  mGamesList.EndUpdate;
  FreeAndNil(TempList);
end;

function TFormMain.AddGames(ClearGames: Boolean): Boolean;
var
  Loop: Integer;
  NonWorkingGame: Boolean;
begin
  Result:= False;
  if CompleteGamesList.Count > 0 then
     begin
       ScanLockedGames(CompleteGamesList);
       if CompleteGamesList.Count = 0 then
          Exit;

       Result:= True;
       case ClearGames of
         True:
           begin
             ClearEntries;
             SetLength(GamesList, CompleteGamesList.Count);
           end;
         False:
           begin
             SetLength(GamesList, Length(GamesList)+CompleteGamesList.Count);
           end;
       end;

       if FormStatus.Visible then
          begin
            FormStatus.LabelStatusType.Caption:= GetLanguageText('Status Messages', 'LoadGamesTitle', 'Loading Games');
            FormStatus.LabelMessage.Caption:= GetLanguageText('Status Messages', 'LoadGamesList', 'Loading games list. Please wait a moment...');
            FormStatus.Refresh;
          end;
       ClearMemoryColumnsVariables;
       if not Assigned(GameSizeBits) then
          begin
            if FileExists(FrontendPath+'resources\GameSize.dat') then
               begin
                 GameSizeBits:= THashedStringList.Create;
                 GameSizeBits.LoadFromFile(FrontendPath+'resources\GameSize.dat');
               end;
          end;
       for Loop:=0 to CompleteGamesList.Count-1 do
       begin
         GetROMFields(CompleteGamesList[Loop]);
         NonWorkingGame:= mDriverStatus = 'Preliminary';
         mImageIndex:= mROMIdentification;

         if FormPreferences.NewDescriptionFormat.Checked then
            begin
              if (Copy(mDescription, 1, 4) = 'The ') then
                 mDescription:= Copy(mDescription, 5, Length(mDescription))+', The'
              else
              if (Copy(mDescription, 1, 3) = 'Le ') then
                 mDescription:= Copy(mDescription, 4, Length(mDescription))+', Le';
            end;

         if FormPreferences.FillAllCloneColumns.Checked then
            begin
              if mClone = '' then
                 mClone:= mName;
            end;

         with GamesList[Loop] do
         begin
           eImageIndex:= mImageIndex;
           eROMIdentification:= mROMIdentification;
           eDescription:= mDescription;
           eYear:= mYear;
           eManufacturer:= mManufacturer;
           eSound:= mSound;
           eFrequency:= mFrequency;
           eSamples:= mSamples;
           eControlType:= mControlType;
           eVideo:= mVideo;
           eOrientation:= mOrientation;
           eResolution:= mResolution;
           eDriverStatus:= mDriverStatus;
           eSoundStatus:= mSoundStatus;
           eColorStatus:= mColorStatus;
           eMerged:= mMerged;
           eName:= mName;
           eClone:= mClone;
           eCategory:= mCategory;
           eVersionAdded:= mVersionAdded;
           eDriver:= mDriver;
           case Assigned(GameSizeBits) of
             True : eGameSize:= GameSizeBits.Values[mName];
             False: eGameSize:= '';
           end;
         end;
       end;
       FreeAndNil(GameSizeBits);
       List.Items.Count:= CompleteGamesList.Count;
     end;
end;

procedure TFormMain.UpdateProgressLabel(Position, Total: Integer; IncValue: Boolean);
begin
  case IncValue of
    True:
      begin
        FormStatus.LabelProgress.Tag:= FormStatus.LabelProgress.Tag+1;
        FormStatus.LabelProgress.Caption:= Format(FormStatus.LabelProgress.Hint, [FormStatus.LabelProgress.Tag, Total]);
      end;
    False:
      begin
        FormStatus.LabelProgress.Caption:= Format(FormStatus.LabelProgress.Hint, [Position, Total]);
      end;
  end;
end;

procedure TFormMain.UpdateStatusBarGame;
var
  GameIcon: TIcon;
  GetDefaultIcon: Boolean;
begin
  if List.Selected = nil then
     Exit;
  GameIcon:= TIcon.Create;
  case MenuRealIcons.Checked of
    False:
      begin
        GetDefaultIcon:= False;
        if BuiltInSmallListImageList.Count >= GamesList[SelectedGame].eImageIndex then
           BuiltInSmallListImageList.GetIcon(GamesList[SelectedGame].eImageIndex, GameIcon);
      end;
    True:
      begin
        GetDefaultIcon:= BuiltInSmallListImageList.Count > 0;
      end;
  end;

  if GetDefaultIcon then
     begin
       if BuiltInSmallListImageList.Count >= GamesList[SelectedGame].eROMIdentification then
          BuiltInSmallListImageList.GetIcon(GamesList[SelectedGame].eROMIdentification, GameIcon);
     end;

  if not GameIcon.Empty then
     StatusBarImageList.ReplaceIcon(0, GameIcon);

  StatusBarGameName.Caption:= GamesList[SelectedGame].eName;
  if FormPreferences.ShowGameSize.Checked then
     FormPreferences.UpdateGameSize;
  FreeAndNil(GameIcon);
end;

// pictures procedures
procedure TFormMain.GetMAMEExtendedPaths;
begin
  with FormPreferences do
  begin
    snaptitleDir:= FolderTitleSnapshots.Text;
    marqueeDir:= FolderMarquees.Text;
    cabinetDir:= FolderCabinets.Text;
    flyerDir:= FolderFlyers.Text;
    controlpanelDir:= FolderControlPanels.Text;
    controlpanellayoutDir:= FolderControlPanelLayouts.Text;
    iconDir:= FolderIcons.Text;
    faqDir:= FolderGamesFAQ.Text;

    if LowerCase(snaptitleDir) = 'title' then
       snaptitleDir:= FrontendPath+'title';

    if LowerCase(marqueeDir) = 'marquees' then
       marqueeDir:= FrontendPath+'marquees';

    if LowerCase(flyerDir) = 'flyers' then
       flyerDir:= FrontendPath+'flyers';

    if LowerCase(cabinetDir) = 'cabinets' then
       cabinetDir:= FrontendPath+'cabinets';

    if LowerCase(controlpanelDir) = 'cpanels' then
       controlpanelDir:= FrontendPath+'cpanels';

    if LowerCase(iconDir) = 'icons' then
       iconDir:= FrontendPath+'icons';

    if LowerCase(faqDir) = 'faq' then
       faqDir:= FrontendPath+'faq';
  end;
end;

procedure TFormMain.SmoothPicture(PictureHolder: TImage32);
begin
  case FormPreferences.SmoothPictures.Checked of
    True : PictureHolder.Bitmap.StretchFilter:= sfLinear;
    False: PictureHolder.Bitmap.StretchFilter:= sfNearest;
  end;
  PictureHolder.Refresh;
end;

procedure TFormMain.SetAspectRatio(PictureHolder: TImage32);
begin
  case FormPreferences.AspectRatio.Checked of
    True:
      begin
        case FormPreferences.StretchPicture.Checked of
          True:
            begin
              case FormPreferences.StretchLargerPictures.Checked of
                True:
                  begin
                    if PictureHolder.Bitmap.Width > PictureHolder.Width then
                       PictureHolder.ScaleMode:= smResize
                    else
                    if PictureHolder.Bitmap.Height > PictureHolder.Height then
                       PictureHolder.ScaleMode:= smResize
                    else
                       PictureHolder.ScaleMode:= smNormal;
                  end;
                False: PictureHolder.ScaleMode:= smResize;
              end;
            end;
          False: PictureHolder.ScaleMode:= smNormal;
        end;
      end;
    False:
      begin
        case FormPreferences.StretchPicture.Checked of
          True : PictureHolder.ScaleMode:= smStretch;
          False: PictureHolder.ScaleMode:= smNormal;
        end;
      end;
  end;
  PictureHolder.Refresh;
end;

procedure TFormMain.ToggleVirtualPicturesList(EnableList: Boolean);
begin
  case EnableList of
    True:
      begin
        if not FileExists(FormMain.FrontendPath+'resources\pictures.dat') then
           MenuCreatePicturesList.OnClick(Self);
        SetVirtualPictureType;
      end;
    False: FreeAndNil(VirtualPicturesList);
  end;
end;

procedure TFormMain.SetVirtualPictureType;
var
  INIFile: TIniFile;
  MemINIFile: TMemIniFile;
  SectionName: String;
  MemoryFile: Boolean;
begin
  case ButtonPicturesModeView.Tag of
    0: SectionName:= 'Title Snapshot';
    1: SectionName:= 'In-Game Snapshot';
    2: SectionName:= 'Marquee';
    3: SectionName:= 'Flyer';
    4: SectionName:= 'Cabinet';
    5: SectionName:= 'Control Panel';
    6: SectionName:= 'Control Panel Layout';
  end;

  if not FileExists(FrontendPath+'resources\pictures.dat') then
     begin
       FreeAndNil(VirtualPicturesList);
       Exit;
     end;

  MemoryFile:= GetFileSize(FrontendPath+'resources\pictures.dat') > 32768;

  case MemoryFile of
    True:
      begin
        MemINIFile:= TMemIniFile.Create(FrontendPath+'resources\pictures.dat');
        case MemINIFile.SectionExists(SectionName) of
          True:
            begin
              case Assigned(VirtualPicturesList) of
                True : VirtualPicturesList.Clear;
                False: VirtualPicturesList:= THashedStringList.Create;
              end;
              MemINIFile.ReadSectionValues(SectionName, VirtualPicturesList);
              if VirtualPicturesList.Count = 0 then
                 FreeAndNil(VirtualPicturesList);
            end;
          False: FreeAndNil(VirtualPicturesList);
        end;
      end;
    False:
      begin
        INIFile:= TIniFile.Create(FrontendPath+'resources\pictures.dat');
        case INIFile.SectionExists(SectionName) of
          True:
            begin
              case Assigned(VirtualPicturesList) of
                True : VirtualPicturesList.Clear;
                False: VirtualPicturesList:= THashedStringList.Create;
              end;
              INIFile.ReadSectionValues(SectionName, VirtualPicturesList);
              if VirtualPicturesList.Count = 0 then
                 FreeAndNil(VirtualPicturesList);
            end;
          False: FreeAndNil(VirtualPicturesList);
        end;
      end;
  end;

  case MemoryFile of
    True : FreeAndNil(MemINIFile);
    False: FreeAndNil(INIFile);
  end;
end;

procedure TFormMain.GetTotalPictures;
var
  PicturesCount: String;
begin
  case Assigned(VirtualPicturesList) of
    True:
      begin
        PicturesCount:= VirtualPicturesList.Values[GamesList[SelectedGame].eName];
        if PicturesCount = '' then
           begin
             if (GamesList[SelectedGame].eClone <> '') and (GamesList[SelectedGame].eClone <> GamesList[SelectedGame].eName) then
                begin
                  PicturesCount:= VirtualPicturesList.Values[GamesList[SelectedGame].eClone];
                  if PicturesCount = '' then
                     PicturesToolBar.Tag:= 0
                  else
                     PicturesToolBar.Tag:= StrToInt(PicturesCount);
                end
             else
                PicturesToolBar.Tag:= 0;
           end
        else
           PicturesToolBar.Tag:= StrToInt(PicturesCount);
      end;
    False: PicturesToolBar.Tag:= 0;
  end;
end;

procedure TFormMain.UpdateLabelPictures;
begin
  case FormPreferences.PicturesVirtualList.Checked of
    True : LabelPictureNumber.Caption:= Format(LabelPictureNumberValue, [ButViewNextPicture.Tag, PicturesToolBar.Tag]);
    False: LabelPictureNumber.Caption:= Format('%.3d', [PictureNumber]);
  end;
  if not FormPreferences.CyclePictureTypes.Checked then
     begin
       case FormPreferences.PicturesVirtualList.Checked of
         True:
           begin
             if PicturesToolBar.Tag in [0..1] then
                 begin
                   ButViewPreviousPicture.ImageIndex:= 82;
                   ButViewNextPicture.ImageIndex:= 83;
                 end
             else
             if (PicturesToolBar.Tag > 1) and (ButViewNextPicture.Tag < PicturesToolBar.Tag) then
                begin
                  ButViewNextPicture.ImageIndex:= 81;
                  if ButViewNextPicture.Tag = 1 then
                     ButViewPreviousPicture.ImageIndex:= 82
                  else
                     ButViewPreviousPicture.ImageIndex:= 80;
                end
             else
             if ButViewNextPicture.Tag = PicturesToolBar.Tag then
                ButViewNextPicture.ImageIndex:= 83
             else
             if ButViewNextPicture.Tag = 1 then
                ButViewPreviousPicture.ImageIndex:= 82;
           end;
         False:
           begin
             if (Picture.Tag < 100) or (Picture.Tag = 1)  then
                begin
                  if Picture.Tag = 1 then
                     ButViewPreviousPicture.ImageIndex:= 82;
                  case ButViewPreviousPicture.Tag of
                     0: ButViewNextPicture.ImageIndex:= 81;
                    -1: ButViewNextPicture.ImageIndex:= 83;
                  end;
                end
             else
             if Picture.Tag = 100 then
                ButViewNextPicture.ImageIndex:= 83;

             if Picture.Tag > 1 then
                ButViewPreviousPicture.ImageIndex:= 80;

             ButViewPreviousPicture.Tag:= 0;
           end;
       end;
     end;
end;

function TFormMain.SetPictureFileName(Picture: String): String;
begin
  if Length(Picture) > 4 then
     Delete(Picture, 5, Length(Picture));
  Result:= Picture;
end;

function TFormMain.MountPicName(PictureName: String): String;
begin
  case FormPreferences.NewPictureNameFormat.Checked of
    True : Result:= PictureName+Format('%.4u', [PictureNumber-2]);
    False: Result:= SetPictureFileName(PictureName)+Format('%.4u', [PictureNumber-2]);
  end;
end;

procedure TFormMain.CyclePictureType;
begin
  ButViewNextPicture.Tag:= 1;
  Picture.Hint:= '';
  case ButtonPicturesModeView.Tag of
    0: MenuShowInGameSnapshot.Click;
    1: MenuShowMarquee.Click;
    2: MenuShowFlyer.Click;
    3: MenuShowCabinet.Click;
    4: MenuShowControlPanel.Click;
    5: MenuShowControlPanelLayout.Click;
    6: MenuShowTitleSnapshot.Click;
  end;
end;

procedure TFormMain.InvertCyclePictureType;
begin
  ButViewNextPicture.Tag:= 1;
  Picture.Hint:= '';
  case ButtonPicturesModeView.Tag of
    0: MenuShowControlPanelLayout.Click;
    1: MenuShowTitleSnapshot.Click;
    2: MenuShowInGameSnapshot.Click;
    3: MenuShowMarquee.Click;
    4: MenuShowFlyer.Click;
    5: MenuShowCabinet.Click;
    6: MenuShowControlPanel.Click;
  end;
end;

procedure TFormMain.LoadPictureFromStream(StreamHolder: TMemoryStream; ImageHolder: TImage32; PicType: ShortInt);
var
  pngImg: TPNGGraphic;
  jpgImg: TJPEGImage;
  gifImg: TGIFGraphic;
begin
  StreamHolder.Seek(0, 0);
  ImageHolder.Bitmap.BeginUpdate;
  case PicType of
    0: // .png
      begin
        pngImg:= TPNGGraphic.Create;
        pngImg.LoadFromStream(StreamHolder);
        ImageHolder.Bitmap.Assign(pngImg);
        FreeAndNil(pngImg);
      end;
    1: // .jpg
      begin
        jpgImg:= TJPEGImage.Create;
        jpgImg.LoadFromStream(StreamHolder);
        ImageHolder.Bitmap.Assign(jpgImg);
        FreeAndNil(jpgImg);
      end;
    2: // .gif
      begin
        gifImg:= TGIFGraphic.Create;
        gifImg.LoadFromStream(StreamHolder);
        ImageHolder.Bitmap.Assign(gifImg);
        FreeAndNil(gifImg);
      end;
  end;
  ImageHolder.Bitmap.EndUpdate;
end;

function TFormMain.ShowPicture(GameName, CloneGameName: String; ImageHolder: TImage32; ImageType: Integer; CloseZIP: Boolean): String;
var
  Folder, PictureName, PictureExt: String;
  PictureNotFound, ImageChanged, ImageFromZIP, SearchAllFormats: Boolean;
  PictureIndex: Integer;

  PictureStream: TMemoryStream;

  function GetParentPictureName: String;
  begin
    if PictureNumber = 1 then
       PictureName:= CloneGameName
    else
       PictureName:= MountPicName(CloneGameName);
  end;

  function UnzipToMemory: Boolean;
  begin
    PictureStream:= TMemoryStream.Create;
    UnZipFileMemory(Folder+PictureZIP, ListROMsNameFullPath[PictureIndex], PictureStream);
    ImageChanged:= True;
    ShowingPicture:= True;
    ImageFromZIP:= True;
  end;

  function SearchImageFile: Boolean;
  begin
    PictureExt:= '.png';
    Result:= FileExists(Folder+PictureName+PictureExt);
    if not Result then
       begin
         if SearchAllFormats then
            begin
              PictureExt:= '.jpg';
              Result:= FileExists(Folder+PictureName+PictureExt);
              if not Result then
                 begin
                   PictureExt:= '.gif';
                   Result:= FileExists(Folder+PictureName+PictureExt);
                 end;
            end;
       end;

    if Result then
       begin
         ImageChanged:= True;
         ShowingPicture:= True;
       end;
  end;

  function SearchZippedImageFile: Boolean;
  begin
    PictureExt:= '.png';
    PictureIndex:= ListROMsName.IndexOf(PictureName+PictureExt);
    if PictureIndex = -1 then
       begin
         if SearchAllFormats then
            begin
              PictureExt:= '.jpg';
              PictureIndex:= ListROMsName.IndexOf(PictureName+PictureExt);
              if PictureIndex = -1 then
                 begin
                   PictureExt:= '.gif';
                   PictureIndex:= ListROMsName.IndexOf(PictureName+PictureExt);
                 end;
            end;
       end;
    Result:= (PictureIndex > -1);
  end;

  function LoadUnzippedImage: String;
  begin
    ImageHolder.Bitmap.BeginUpdate;
    ImageHolder.Bitmap.LoadFromFile(Folder+PictureName+PictureExt);
    Result:= ShortToLongPath(Folder)+PictureName+PictureExt;
    ImageHolder.Tag:= PictureNumber;
    ImageHolder.Bitmap.EndUpdate;
  end;

  function IsNoPictureImage: Boolean;
  begin
    Result:= ((PictureName = 'NoTitleSnapshot') or (PictureName = 'NoInGameSnapshot') or
              (PictureName = 'NoMarquee')       or (PictureName = 'NoFlyer') or
              (PictureName = 'NoCabinet')       or (PictureName = 'NoControlPanel') or
              (PictureName = 'NoPanelLayout')   or (PictureName = 'NoGamesAvailable'));
  end;

  function FoundParentImage: Boolean;
  begin
    Result:= SearchString('\'+CloneGameName+'.', ImageHolder.Hint);
    if not Result then
       Result:= SearchString('['+CloneGameName+'.', ImageHolder.Hint);
  end;

begin
  if Length(GamesList) = 0 then
     Exit;
  PictureNotFound:= False;
  ImageChanged:= False;
  ImageFromZIP:= False;
  SearchAllFormats:= not (ImageType in [0, 1]);

  case ImageType of
   -1: begin
         Folder:= FrontendPath+'resources\images\';
         PictureZIP:= '';
       end;
    0: begin
         Folder:= snaptitleDir+'\';
         case FileExists(Folder+'title.zip') of
           True : PictureZIP:= 'title.zip';
           False: PictureZIP:= 'titles.zip';
         end;
       end;
    1: begin
         if Pos(':\', snapingameDir) = 0 then
            SetCurrentDir(ExtractFilePath(GetCurrentEmulatorExecutable));
         Folder:= snapingameDir+'\';
         case FileExists(Folder+'ingame.zip') of
           True : PictureZIP:= 'ingame.zip';
           False: PictureZIP:= 'snap.zip';
         end;
       end;
    2: begin
         Folder:= marqueeDir+'\';
         PictureZIP:= 'marquees.zip';
       end;
    3: begin
         Folder:= flyerDir+'\';
         PictureZIP:= 'flyers.zip';
       end;
    4: begin
         Folder:= cabinetDir+'\';
         PictureZIP:= 'cabinets.zip';
       end;
    5: begin
         Folder:= controlpanelDir+'\';
         PictureZIP:= 'cpanels.zip';
       end;
    6: begin
         Folder:= controlpanellayoutDir+'\';
         PictureZIP:= 'cplayouts.zip';
       end;
  end;

  if PictureNumber = 1 then
     PictureName:= GameName
  else
     PictureName:= MountPicName(GameName);

  if not SearchImageFile then
     begin
       if ImageType <> -1 then
       begin
         case FileExists(Folder+PictureZIP) of
           True:
             begin
               if not Assigned(ListROMsName) then
                  begin
                    ListROMsName:= THashedStringList.Create;
                    ListROMsNameFullPath:= THashedStringList.Create;
                  end;
               if ListROMsName.Count = 0 then
                  GetContents(Folder+PictureZIP, True, False);
               if SearchZippedImageFile then
                  UnzipToMemory
               else
                  begin
                    case FormPreferences.ShowParentPictures.Checked of
                      True:
                        begin
                          if (CloneGameName <> '') and (CloneGameName <> GameName) then
                             begin
                               ImageChanged:= not FoundParentImage;
                               ShowingPicture:= True;
                               if ImageChanged then
                                  begin
                                    GetParentPictureName;
                                    if not SearchImageFile then
                                       begin
                                         case SearchZippedImageFile of
                                           True : UnzipToMemory;
                                           False: PictureNotFound:= True;
                                         end;
                                       end;
                                  end;
                             end
                          else
                             PictureNotFound:= True; // it's not clone and file not found
                        end;
                      False: PictureNotFound:= True;
                    end;
                  end;
             end;
           False:
             begin
               // viewing a clone game... will search for its parent picture
               case FormPreferences.ShowParentPictures.Checked of
                 True:
                    begin
                      if (CloneGameName <> '') and (CloneGameName <> GameName) then
                         begin
                           ImageChanged:= not FoundParentImage;
                           ShowingPicture:= True;
                           if ImageChanged then
                              begin
                                GetParentPictureName;
                                if not SearchImageFile then
                                   PictureNotFound:= True;
                              end;
                         end
                      else
                         PictureNotFound:= True; // it's not clone and file not found
                    end;
                  False: PictureNotFound:= True;
               end;
             end;
         end;
       end;
     end;

  if ((PictureNotFound) and (ShowingPicture)) then
     begin
       Folder:= FrontendPath+'resources\images\';
       PictureExt:= '.png';
       case ImageType of
         0: PictureName:= 'NoTitleSnapshot';
         1: PictureName:= 'NoInGameSnapshot';
         2: PictureName:= 'NoMarquee';
         3: PictureName:= 'NoFlyer';
         4: PictureName:= 'NoCabinet';
         5: PictureName:= 'NoControlPanel';
         6: PictureName:= 'NoPanelLayout';
       end;
       ShowingPicture:= False;
       ImageChanged:= not SearchString(PictureName, ImageHolder.Hint);
       //ImageChanged:= True;
       if PicturesToolBar.Tag = 0 then
          ButViewNextPicture.Tag:= 0;
     end;

  if ImageChanged then
     begin
       case ImageFromZIP of
         True:
           begin
             if PictureStream.Size > 0 then
                begin
                  if PictureExt = '.png' then
                     LoadPictureFromStream(PictureStream, ImageHolder, 0)
                  else
                  if PictureExt = '.jpg' then
                     LoadPictureFromStream(PictureStream, ImageHolder, 1)
                  else
                  if PictureExt = '.gif' then
                     LoadPictureFromStream(PictureStream, ImageHolder, 2);
                  Result:= ShortToLongPath(Folder)+PictureZIP+' - ['+PictureName+PictureExt+']';
                  ImageHolder.Tag:= PictureNumber;
                end
             else
                begin
                  ImageHolder.Bitmap.BeginUpdate;
                  ImageHolder.Bitmap.Clear;
                  ImageHolder.Hint:= 'File not found';
                  Result:= 'No Change';
                  ImageHolder.Bitmap.EndUpdate;
                end;
             FreeAndNil(PictureStream);
           end;
         False:
           begin
             case FileExists(Folder+PictureName+PictureExt) of
               True:
                 begin
                   case IsNoPictureImage of
                     True:
                       begin
                         if PictureNumber = 1 then
                            Result:= LoadUnzippedImage
                         else
                            Result:= 'No Change';
                       end;
                     False: Result:= LoadUnzippedImage;
                   end;
                 end;
               False:
                 begin
                   if PictureNumber > 1 then
                      Result:= 'No Change'
                   else
                      begin
                        ImageHolder.Bitmap.BeginUpdate;
                        ImageHolder.Bitmap.Clear;
                        ImageHolder.Hint:= Format(GetLanguageText('Messages', 'FileNotFoundMsg', 'File "%s" not found'), [Folder+PictureName+PictureExt]);
                        ImageHolder.Tag:= PictureNumber;
                        ImageHolder.Bitmap.EndUpdate;
                        Result:= 'No Change';
                      end;
                 end;
             end;
           end;
       end;

       ImageHolder.Bitmap.BeginUpdate;
       if not IsNoPictureImage then
          begin
            if (ImageType in [4..6]) and (FormPreferences.PicturesTransparency.Checked) then
               begin
                 CromaKey(ImageHolder.Bitmap, clTrWhite32);
                 ImageHolder.Bitmap.DrawMode:= dmBlend;
               end;
          end
       else
          begin
            if CloseZIP then
               begin
                 CromaKey(ImageHolder.Bitmap, clTrWhite32);
                 ImageHolder.Bitmap.DrawMode:= dmBlend;
               end;
          end;
       if FormPreferences.StretchLargerPictures.Checked then
          SetAspectRatio(Picture);
       ImageHolder.Repaint;
       ImageHolder.Bitmap.EndUpdate;
     end
  else
     Result:= 'No Change';

  if CloseZIP then
     begin
       FreeAndNil(ListROMsName);
       FreeAndNil(ListROMsNameFullPath);
     end;
  SetCurrentDir(FrontendPath);
end;

procedure TFormMain.CromaKey(ABitmap: TBitmap32; TrColor: TColor32);
var
  P: PColor32;
  C: TColor32;
  I: Integer;
begin
  TrColor:= TrColor and $00FFFFFF; // erase alpha, (just in case it has some)
  with ABitmap do
  begin
    P:= PixelPtr[0, 0];
    for I:=0 to Width * Height - 1 do
    begin
      C:= P^ and $00FFFFFF; // get RGB without alpha
      if C = TrColor then // is this pixel "transparent"?
         P^:= C; // write RGB with "transparent" alpha back into the SrcBitmap
      Inc(P); // proceed to the next pixel
    end;
  end;
end;

function TFormMain.FoundMerged(GameName, OriginalGameName: String): Boolean;
var
  Loop, FileCounter, CRCNumber: Integer;
  FilePath, FixedCRCHex: String;
begin
  Result:= False;
  FileCounter:= 0;

  FilePath:= SearchZIPFolder(OriginalGameName);
  if FilePath <> 'Not Found' then
     begin
       GetContents(FilePath, False, True); // get files list (it's parent of a clone game)
       for Loop:=0 to ListROMsName.Count -1 do
       begin
         // search for the file in ParentROMsName and if found increment counter...
         if ParentListROMsName.IndexOf(ListROMsName[Loop]) > -1 then
            Inc(FileCounter)
         else
            begin
              if ((ListROMsCRC[Loop] <> '00000000') and (ListROMsCRC[Loop] <> '0000000') and
                  (ListROMsCRC[Loop] <> '000000')) then
                 begin
                   CRCNumber:= StrToInt('$'+ListROMsCRC[Loop]);
                   FixedCRCHex:= LowerCase(Format('%x', [CRCNumber]));
                   if ParentListROMsCRC.IndexOf(FixedCRCHex) > -1 then
                      Inc(FileCounter);
                 end
              else
                 begin
                   if ParentListROMsCRC.IndexOf(ListROMsCRC[Loop]) > -1 then
                      Inc(FileCounter);
                 end;
            end;
       end;
       Result:= (FileCounter = ListROMsName.Count);
     end;
end;

function TFormMain.RefreshGame: Boolean;
var
  GameFound, GameFoundMerged, ChangeGameStatus, NewVersionAdded: Boolean;
  DATFileName1, DATFileName2, ROMDataLine, CloneZIPFolder, LineResult: String;
  LinePosition, Loop: Integer;
  GameList1, GameList2: THashedStringList;
begin
  ChangeGameStatus:= True;
  Result:= True;

  case Assigned(CategoriesList) of
    True : LineResult:= CategoriesList.ReadString('VerAdded', mName, 'Error');
    False: LineResult:= 'Error';
  end;
  if LineResult <> 'Error' then
     begin
       if LineResult <> mVersionAdded then
          begin
            mVersionAdded:= LineResult;
            NewVersionAdded:= True;
          end;
     end;

  case mROMIdentification of
    0: DATFileName1:= FrontendPath+'resources\ClassicMR.dat';
    1: DATFileName1:= FrontendPath+'resources\ClassicMV.dat';
    2: DATFileName1:= FrontendPath+'resources\ClassicCR.dat';
    3: DATFileName1:= FrontendPath+'resources\ClassicCV.dat';
    4: DATFileName1:= FrontendPath+'resources\NeoGeoM.dat';
    5: DATFileName1:= FrontendPath+'resources\NeoGeoC.dat';
    6: DATFileName1:= FrontendPath+'resources\UnClassicMR.dat';
    7: DATFileName1:= FrontendPath+'resources\UnClassicMV.dat';
    8: DATFileName1:= FrontendPath+'resources\UnClassicCR.dat';
    9: DATFileName1:= FrontendPath+'resources\UnClassicCV.dat';
   10: DATFileName1:= FrontendPath+'resources\UnNeoGeoM.dat';
   11: DATFileName1:= FrontendPath+'resources\UnNeoGeoC.dat';
   12, 13: DATFileName1:= FrontendPath+'resources\BIOS.dat';
   14, 15: DATFileName1:= FrontendPath+'resources\UnBIOS.dat';
  end;

  case SearchZIP(mName) of
    True:
      begin
        GameFound:= True;
        GameFoundMerged:= False;
      end;
    False:
      begin
        if mClone <> '' then
           begin
             ListROMsName:= THashedStringList.Create;
             ListROMsSize:= THashedStringList.Create;
             ListROMsCRC:= THashedStringList.Create;

             ParentListROMsName:= THashedStringList.Create;
             ParentListROMsSize:= THashedStringList.Create;
             ParentListROMsCRC:= THashedStringList.Create;

             LinePosition:= ListROMs.IndexOf('game '+mName);

             for Loop:=LinePosition+1 to ListROMs.Count-1 do
             begin
               if ListROMs[Loop] <> ' ' then
                  GetGameROMs(ListROMs[Loop], False)
               else
                  Break;
             end;
             CloneZIPFolder:= SearchZIPFolder(mClone);
             if CloneZIPFolder <> 'Not Found' then
                begin
                  GetContents(CloneZIPFolder,False, True);
                  case FoundMerged(mName, mClone) of
                    True:
                      begin
                        GameFound:= False;
                        GameFoundMerged:= True;
                      end;
                    False:
                      begin
                        GameFound:= False;
                        GameFoundMerged:= False;
                      end;
                  end;
                end
             else
                begin
                  GameFound:= False;
                  GameFoundMerged:= False;
                end;

             FreeAndNil(ListROMsName);
             FreeAndNil(ListROMsSize);
             FreeAndNil(ListROMsCRC);
             FreeAndNil(ParentListROMsName);
             FreeAndNil(ParentListROMsSize);
             FreeAndNil(ParentListROMsCRC);
           end
        else
           begin
             GameFound:= False;
             GameFoundMerged:= False;
           end;
      end;
  end;

  case GameFound of
    True:
      begin
        case mROMIdentification of
          6:
           begin
             mROMIdentification:= 0;
             DATFileName2:= FrontendPath+'resources\ClassicMR.dat';
           end;
          7:
           begin
             mROMIdentification:= 1;
             DATFileName2:= FrontendPath+'resources\ClassicMV.dat';
           end;
          8:
           begin
             mROMIdentification:= 2;
             DATFileName2:= FrontendPath+'resources\ClassicCR.dat';
           end;
          9:
           begin
             mROMIdentification:= 3;
             DATFileName2:= FrontendPath+'resources\ClassicCV.dat';
           end;
          10:
           begin
             mROMIdentification:= 4;
             DATFileName2:= FrontendPath+'resources\NeoGeoM.dat';
           end;
          11:
           begin
             mROMIdentification:= 5;
             DATFileName2:= FrontendPath+'resources\NeoGeoC.dat';
           end;
          14:
           begin
             mROMIdentification:= 12;
             DATFileName2:= FrontendPath+'resources\BIOS.dat';
           end;
          15:
           begin
             mROMIdentification:= 13;
             DATFileName2:= FrontendPath+'resources\BIOS.dat';
           end;
        else
        if (mMerged = 'Yes') or (NewVersionAdded) then
           begin
             // gamefile was found but here is set as available and merged, so will change only the
             // "Merged" status
             if mMerged = 'Yes' then
                mMerged:= '';
             ChangeGameStatus:= False;
             ROMDataLine:= PopulateROMDataLine;
             GameList1:= THashedStringList.Create;
             GameList1.LoadFromFile(DATFileName1);
             for Loop:=0 to GameList1.Count -1 do
             begin
               if SearchString('¬'+mDescription+'¬', GameList1[Loop]) then
                  begin
                    GameList1[Loop]:= ROMDataLine;
                    Break;
                  end;
             end;
             GameList1.SaveToFile(DATFileName1);
             FreeAndNil(GameList1);
           end
        else
           begin
             ChangeGameStatus:= False;
             Result:= False;
           end;
        end;
      end;
    False:
      begin
        case GameFoundMerged of
          True:
            begin
              case mROMIdentification of
                6:
                 begin
                   mROMIdentification:= 0;
                   DATFileName2:= FrontendPath+'resources\ClassicMR.dat';
                   mMerged:= 'Yes';
                 end;
                7:
                 begin
                   mROMIdentification:= 1;
                   DATFileName2:= FrontendPath+'resources\ClassicMV.dat';
                   mMerged:= 'Yes';
                 end;
                8:
                 begin
                   mROMIdentification:= 2;
                   DATFileName2:= FrontendPath+'resources\ClassicCR.dat';
                   mMerged:= 'Yes';
                 end;
                9:
                 begin
                   mROMIdentification:= 3;
                   DATFileName2:= FrontendPath+'resources\ClassicCV.dat';
                   mMerged:= 'Yes';
                 end;
                10:
                 begin
                   mROMIdentification:= 4;
                   DATFileName2:= FrontendPath+'resources\NeoGeoM.dat';
                   mMerged:= 'Yes';
                 end;
                11:
                 begin
                   mROMIdentification:= 5;
                   DATFileName2:= FrontendPath+'resources\NeoGeoC.dat';
                   mMerged:= 'Yes';
                 end;
              else
              if (mMerged = '') or (NewVersionAdded) then
                 begin
                   ChangeGameStatus:= False;
                   // gamefile was found but here is set as available and not merged, so will change only the
                   // "Merged" status
                   if mMerged = '' then
                      mMerged:= 'Yes';
                   ROMDataLine:= PopulateROMDataLine;
                   GameList1:= THashedStringList.Create;
                   GameList1.LoadFromFile(DATFileName1);
                   for Loop:=0 to GameList1.Count -1 do
                   begin
                     if SearchString('¬'+mDescription+'¬', GameList1[Loop]) then
                        begin
                          GameList1[Loop]:= ROMDataLine;
                          Break;
                        end;
                   end;
                   GameList1.SaveToFile(DATFileName1);
                   FreeAndNil(GameList1);
                 end
              else
                 begin
                   ChangeGameStatus:= False;
                   Result:= False;
                 end;
              end;
            end;
          False:
            begin
              case mROMIdentification of
                0:
                 begin
                   mROMIdentification:= 6;
                   DATFileName2:= FrontendPath+'resources\UnClassicMR.dat';
                   mMerged:= '';
                 end;
                1:
                 begin
                   mROMIdentification:= 7;
                   DATFileName2:= FrontendPath+'resources\UnClassicMV.dat';
                   mMerged:= '';
                 end;
                2:
                 begin
                   mROMIdentification:= 8;
                   DATFileName2:= FrontendPath+'resources\UnClassicCR.dat';
                   mMerged:= '';
                 end;
                3:
                 begin
                   mROMIdentification:= 9;
                   DATFileName2:= FrontendPath+'resources\UnClassicCV.dat';
                   mMerged:= '';
                 end;
                4:
                 begin
                   mROMIdentification:= 10;
                   DATFileName2:= FrontendPath+'resources\UnNeoGeoM.dat';
                   mMerged:= '';
                 end;
                5:
                 begin
                   mROMIdentification:= 11;
                   DATFileName2:= FrontendPath+'resources\UnNeoGeoC.dat';
                   mMerged:= '';
                 end;
                12:
                 begin
                   mROMIdentification:= 14;
                   DATFileName2:= FrontendPath+'resources\UnBIOS.dat';
                   mMerged:= '';
                 end;
                13:
                 begin
                   mROMIdentification:= 15;
                   DATFileName2:= FrontendPath+'resources\UnBIOS.dat';
                   mMerged:= '';
                 end;
              else
                 begin
                   ChangeGameStatus:= False;
                   Result:= NewVersionAdded;
                   if Result then
                      begin
                        ROMDataLine:= PopulateROMDataLine;
                        GameList1:= THashedStringList.Create;
                        GameList1.LoadFromFile(DATFileName1);
                        for Loop:=0 to GameList1.Count -1 do
                        begin
                          if SearchString('¬'+mDescription+'¬', GameList1[Loop]) then
                             begin
                               GameList1[Loop]:= ROMDataLine;
                               Break;
                             end;
                        end;
                        GameList1.SaveToFile(DATFileName1);
                        FreeAndNil(GameList1);
                      end;
                 end;
              end;
            end;
        end;
      end;
  end;

  if ChangeGameStatus then
     begin
       ROMDataLine:= PopulateROMDataLine;
       GameList1:= THashedStringList.Create;
       GameList2:= THashedStringList.Create;
       GameList1.LoadFromFile(DATFileName1);
       GameList2.LoadFromFile(DATFileName2);
       GameList1.BeginUpdate;
       for Loop:=0 to GameList1.Count -1 do
       begin
         if SearchString('¬'+mDescription+'¬', GameList1[Loop]) then
            begin
              GameList1.Delete(Loop);
              Break;
            end;
       end;
       GameList1.EndUpdate;
       GameList1.SaveToFile(DATFileName1);
       FreeAndNil(GameList1);
       GameList2.Add(ROMDataLine);
       GameList2.SaveToFile(DATFileName2);
       FreeAndNil(GameList2);
     end;
end;

// This procedure is for the Full Database Refresh
// not for the single refresh
function TFormMain.RefreshGames(GamesList1: THashedStringList; GamesList2: THashedStringList; GamesList1Position: Integer): Boolean;
var
  GameFound, GameFoundMerged, ChangeGameStatus, NewVersionAdded: Boolean;
  LinePosition, Loop: Integer;
  ROMDataLine, CloneZIPFolder, LineResult: String;
begin
  ChangeGameStatus:= True;
  Result:= True;
  NewVersionAdded:= False;

  case Assigned(CategoriesList) of
    True : LineResult:= CategoriesList.ReadString('VerAdded', mName, 'Error');
    False: LineResult:= 'Error';
  end;
  if LineResult <> 'Error' then
     begin
       if LineResult <> mVersionAdded then
          begin
            mVersionAdded:= LineResult;
            NewVersionAdded:= True;
          end;
     end;

  case SearchZIP(mName) of
    True:
      begin
        GameFound:=True;
        GameFoundMerged:=False;
      end;
    False:
      begin
        if mClone <> '' then
           begin
             ListROMsName:= THashedStringList.Create;
             ListROMsSize:= THashedStringList.Create;
             ListROMsCRC:= THashedStringList.Create;

             ParentListROMsName:= THashedStringList.Create;
             ParentListROMsSize:= THashedStringList.Create;
             ParentListROMsCRC:= THashedStringList.Create;

             LinePosition:= ListROMs.IndexOf('game '+mName);

             for Loop:=LinePosition+1 to ListROMs.Count-1 do
             begin
               if ListROMs[Loop] <> ' ' then
                  GetGameROMs(ListROMs[Loop], False)
               else
                  Break;
             end;
             CloneZIPFolder:= SearchZIPFolder(mClone);
             if CloneZIPFolder <> 'Not Found' then
                begin
                  GetContents(CloneZIPFolder,False, True);
                  case FoundMerged(mName, mClone) of
                    True:
                      begin
                        GameFound:= False;
                        GameFoundMerged:= True;
                      end;
                    False:
                      begin
                        GameFound:= False;
                        GameFoundMerged:= False;
                      end;
                  end;
                end
             else
                begin
                  GameFound:= False;
                  GameFoundMerged:= False;
                end;

             FreeAndNil(ListROMsName);
             FreeAndNil(ListROMsSize);
             FreeAndNil(ListROMsCRC);
             FreeAndNil(ParentListROMsName);
             FreeAndNil(ParentListROMsSize);
             FreeAndNil(ParentListROMsCRC);
           end
        else
           begin
             GameFound:= False;
             GameFoundMerged:= False;
           end;
      end;
  end;

  case GameFound of
    True:
      begin
        case mROMIdentification of
           6: mROMIdentification:= 0;
           7: mROMIdentification:= 1;
           8: mROMIdentification:= 2;
           9: mROMIdentification:= 3;
          10: mROMIdentification:= 4;
          11: mROMIdentification:= 5;
          14: mROMIdentification:= 12;
          15: mROMIdentification:= 13;
        else
        if (mMerged = 'Yes') or (NewVersionAdded) then
           begin
             // gamefile was found but here is set as available and merged, so will change only the
             // "Merged" status
             if mMerged = 'Yes' then
                mMerged:= '';
             ChangeGameStatus:= False;
             ROMDataLine:= PopulateROMDataLine;
             GamesList1[GamesList1Position]:= ROMDataLine;
           end
        else
           begin
             ChangeGameStatus:= False;
             Result:= False;
           end;
        end;
      end;
    False:
      begin
        case GameFoundMerged of
          True:
            begin
              case mROMIdentification of
                6:
                 begin
                   mROMIdentification:= 0;
                   mMerged:= 'Yes';
                 end;
                7:
                 begin
                   mROMIdentification:= 1;
                   mMerged:= 'Yes';
                 end;
                8:
                 begin
                   mROMIdentification:= 2;
                   mMerged:= 'Yes';
                 end;
                9:
                 begin
                   mROMIdentification:= 3;
                   mMerged:= 'Yes';
                 end;
                10:
                 begin
                   mROMIdentification:= 4;
                   mMerged:= 'Yes';
                 end;
                11:
                 begin
                   mROMIdentification:= 5;
                   mMerged:= 'Yes';
                 end;
              else
              if (mMerged = '') or (NewVersionAdded) then
                 begin
                   ChangeGameStatus:= False;
                   // gamefile was found but here is set as available and not merged, so will change only the
                   // "Merged" status
                   if mMerged = '' then
                      mMerged:= 'Yes';
                   ROMDataLine:= PopulateROMDataLine;
                   GamesList1[GamesList1Position]:= ROMDataLine;
                 end
              else
                 begin
                   ChangeGameStatus:= False;
                   Result:= False;
                 end;
              end;
            end;
          False:
            begin
              case mROMIdentification of
                0:
                 begin
                   mROMIdentification:= 6;
                   mMerged:= '';
                 end;
                1:
                 begin
                   mROMIdentification:= 7;
                   mMerged:= '';
                 end;
                2:
                 begin
                   mROMIdentification:= 8;
                   mMerged:= '';
                 end;
                3:
                 begin
                   mROMIdentification:= 9;
                   mMerged:= '';
                 end;
                4:
                 begin
                   mROMIdentification:= 10;
                   mMerged:= '';
                 end;
                5:
                 begin
                   mROMIdentification:= 11;
                   mMerged:= '';
                 end;
                12:
                 begin
                   mROMIdentification:= 14;
                   mMerged:= '';
                 end;
                13:
                 begin
                   mROMIdentification:= 15;
                   mMerged:= '';
                 end;
              else
                 begin
                   ChangeGameStatus:= False;
                   Result:= NewVersionAdded;
                   if Result then
                      begin
                        ROMDataLine:= PopulateROMDataLine;
                        GamesList1[GamesList1Position]:= ROMDataLine;
                      end;
                 end;
              end;
            end;
        end;
      end;
  end;

  if ChangeGameStatus then
     begin
       ROMDataLine:= PopulateROMDataLine;
       GamesList1.Delete(GamesList1Position);
       GamesList2.Add(ROMDataLine);
       Result:= True;
     end;
end;

procedure TFormMain.SetCustomOptions(GameName: String; Driver: Boolean);
begin
  SetCurrentDir(ExtractFilePath(GetCurrentEmulatorExecutable));
  if not Assigned(FormMAMECustomConfiguration) then
     FormMAMECustomConfiguration:= TFormMAMECustomConfiguration.Create(Self);
  LoadMAMEConfigurationIcons(FormMAMECustomConfiguration.MAMEConfigImageList);
  FormMAMECustomConfiguration.GameName:= GameName;
  FormMAMECustomConfiguration.EmulatorString:= GetCurrentEmulatorExecutable;
  FormMAMECustomConfiguration.ButtonReadMAMEGamenameIni.Caption:= Format(GetLanguageText('Resource', 'ButtonReadIni', '&Read "%s"'), [GameName+'.ini']);
  FormMAMECustomConfiguration.ButtonReadMAMEGamenameIni.Hint:= Format(GetLanguageText('Resource', 'ButtonReadIniHint', 'Read all data from file "%s"'), [GameName+'.ini']);
  FormMAMECustomConfiguration.ShowModal;
  FreeAndNil(FormMAMECustomConfiguration);
  SetCurrentDir(FrontendPath);
end;

procedure TFormMain.DeleteCustomOptions(GameName: String);
begin
  SetCurrentDir(ExtractFilePath(GetCurrentEmulatorExecutable));
  if GenerateMessage(GetLanguageText('Messages', 'CustomInitializationDeleteTitle', 'Delete Custom Initialization File'),
                     Format(GetLanguageText('Messages', 'CustomInitializationDeleteMsg', 'Delete initialization file "%s". Are you sure ?'),
                            [IniFilesDir+'\'+GameName+'.ini']), 1) = mrYes then
     begin
       DeleteFile(IniFilesDir+'\'+GameName+'.ini');
     end;
  SetCurrentDir(FrontendPath);
end;

procedure TFormMain.CheckPlayTime;
begin
  if TotalPlayTime = '' then
     TotalPlayTime:= '0';
end;

function TFormMain.ReadSelectedGamePlayTime(GameName: String): String;
var
  INIFile: THashedStringList;
begin
  INIFile:= THashedStringList.Create;
  Result:= '';
  if FileExists(FrontendPath+'GamePlayTime.ini') then
     begin
       INIFile.LoadFromFile(FrontendPath+'GamePlayTime.ini');
       Result:= INIFile.Values[GameName];
     end;
  FreeAndNil(INIFile);
end;

procedure TFormMain.UpdateSelectedGamePlayTime(GameName: String; TotalPlayTime: Int64);
var
  INIFile: THashedStringList;
  ResultLine: String;
  PlayTime, NumberPlay: Int64;
begin
  if (FileExists(FrontendPath+'GamePlayTime.ini')) and (CheckFileAttributes('GamePlayTime.ini')) then
     Exit;

  INIFile:= THashedStringList.Create;
  ResultLine:= '';
  if FileExists(FrontendPath+'GamePlayTime.ini') then
     begin
       INIFile.LoadFromFile(FrontendPath+'GamePlayTime.ini');
       ResultLine:= INIFile.Values[GameName];
     end;

  if ResultLine <> '' then
     begin
       NumberPlay:= StrToInt64(Copy(ResultLine, Pos('¬',ResultLine)+1, Length(ResultLine)))+1;
       Delete(ResultLine, Pos('¬',ResultLine), Length(ResultLine));
       PlayTime:= StrToInt64(ResultLine)+TotalPlayTime;
       INIFile.Strings[INIFile.IndexOfName(GameName)]:= GameName+'='+IntToStr(PlayTime)+'¬'+IntToStr(NumberPlay);
     end
  else
     INIFile.Add(GameName+'='+IntToStr(TotalPlayTime)+'¬1');

  INIFile.SaveToFile(FrontendPath+'GamePlayTime.ini');
  FreeAndNil(INIFile);
end;

{
 Columns ID Index
   0 - Description
   1 - Year
   2 - Manufacturer
   3 - Sound
   4 - Frequency
   5 - Samples
   6 - Control Type
   7 - Video
   8 - Orientation
   9 - Resolution
  10 - Driver Status
  11 - Sound Status
  12 - Color Status
  13 - Merged
  14 - Name
  15 - Clone of
  16 - Category
  17 - Version Added
  18 - Driver
}

function TFormMain.GetColumnIndex(ColumnTagIndex: ShortInt): ShortInt;
var
  Loop: ShortInt;
begin
  Result:= -1;
  for Loop:=0 to List.Columns.Count -1 do
  begin
    if List.Columns[Loop].ID = ColumnTagIndex then
       begin
         Result:= Loop;
         Break;
       end
  end;
end;

procedure TFormMain.SetColumnPosition(ColumnID, NewPositionIndex: ShortInt; ForceUpdate: Boolean);
var
  Loop: ShortInt;
  Continue: Boolean;
begin
  case ForceUpdate of
    True : Continue:= True;
    False: Continue:= ColumnID <> NewPositionIndex;
  end;

  if Continue then
     begin
       for Loop:=0 to List.Columns.Count -1 do
       begin
         if List.Columns[Loop].ID = ColumnID then
            begin
              List.Columns[Loop].Index:= NewPositionIndex;
              Break;
            end;
       end;
     end;
end;

procedure TFormMain.ChangeColumnStatus(ColumnTagIndex: ShortInt; DefaultColumnSize, CustomColumnSize: Integer; ColumnChecked: Boolean);
begin
  case ColumnChecked of
    True:
      begin
        if List.Columns[ColumnTagIndex].Width = 0 then
           List.Columns[ColumnTagIndex].Width:= CustomColumnSize;
        if List.Columns[ColumnTagIndex].Width = 0 then
           List.Columns[ColumnTagIndex].Width:= DefaultColumnSize;
      end;
    False:
      begin
        if List.Columns[ColumnTagIndex].Width > 0 then
           List.Columns[ColumnTagIndex].Width:= 0;
      end;
  end;
end;

procedure TFormMain.UpdateColumnsVisibility;
var
  Loop, ColumnIndex: ShortInt;
  INIFile: TIniFile;
begin
  INIFile:= TIniFile.Create(FrontendPath+'EmuLoader.ini');

  List.Items.BeginUpdate;
  for Loop:= 0 to FormFilterGameColumns.ColumnsList.Items.Count-1 do
    SetColumnPosition(FormFilterGameColumns.ColumnsList.Items[Loop].ImageIndex, Loop+1, True);

  for Loop:= 0 to FormFilterGameColumns.ColumnsList.Items.Count-1 do
  begin
    case FormFilterGameColumns.ColumnsList.Items[Loop].Checked of
      True:
        begin
          case FormFilterGameColumns.ColumnsList.Items[Loop].ImageIndex of
             1: List.Columns[Loop+1].Width:= INIFile.ReadInteger('Columns', 'Year', 65);
             2: List.Columns[Loop+1].Width:= INIFile.ReadInteger('Columns', 'Manufacturer', 150);
             3: List.Columns[Loop+1].Width:= INIFile.ReadInteger('Columns', 'Sound', 73);
             4: List.Columns[Loop+1].Width:= INIFile.ReadInteger('Columns', 'Frequency', 70);
             5: List.Columns[Loop+1].Width:= INIFile.ReadInteger('Columns', 'Samples', 83);
             6: List.Columns[Loop+1].Width:= INIFile.ReadInteger('Columns', 'ControlType', 110);
             7: List.Columns[Loop+1].Width:= INIFile.ReadInteger('Columns', 'Video', 70);
             8: List.Columns[Loop+1].Width:= INIFile.ReadInteger('Columns', 'Orientation', 100);
             9: List.Columns[Loop+1].Width:= INIFile.ReadInteger('Columns', 'Resolution', 95);
            10: List.Columns[Loop+1].Width:= INIFile.ReadInteger('Columns', 'DriverStatus', 85);
            11: List.Columns[Loop+1].Width:= INIFile.ReadInteger('Columns', 'SoundStatus', 85);
            12: List.Columns[Loop+1].Width:= INIFile.ReadInteger('Columns', 'ColorStatus', 85);
            13: List.Columns[Loop+1].Width:= INIFile.ReadInteger('Columns', 'Merged', 78);
            14: List.Columns[Loop+1].Width:= INIFile.ReadInteger('Columns', 'Name', 80);
            15: List.Columns[Loop+1].Width:= INIFile.ReadInteger('Columns', 'Clone', 80);
            16: List.Columns[Loop+1].Width:= INIFile.ReadInteger('Columns', 'Category', 180);
            17: List.Columns[Loop+1].Width:= INIFile.ReadInteger('Columns', 'VersionAdded', 100);
            18: List.Columns[Loop+1].Width:= INIFile.ReadInteger('Columns', 'Driver', 80);
          end;
          List.Columns[Loop+1].Tag:= 1;
        end;
      False: List.Columns[Loop+1].Tag:= 0;
    end;
  end;
  for Loop:=1 to List.Columns.Count-1 do
  begin
    if List.Columns[Loop].Tag = 0 then
       List.Columns[Loop].Width:= 0;
  end;
  List.Items.EndUpdate;
  FreeAndNil(INIFile);
end;

// procedures to load icons into TImageList

// Main screen
function TFormMain.LoadToolbarIcons: Boolean;
var
  Loop: ShortInt;
begin
  Result:= True;
  for Loop:=0 to 83 do
  begin
    if not FileExists(FrontendPath+'resources\images\toolbars\Main\toolbar\'+IntToStr(Loop)+'.ico') then
       Result:= False;
  end;

  if Result then
     begin
       if ToolbarButtonsImageList.Count > 0 then
          ToolbarButtonsImageList.Clear;
       for Loop:= 0 to 83 do
         AddDefaultIcons('Main\toolbar\'+IntToStr(Loop)+'.ico', ToolbarButtonsImageList, 1, False);
     end;
end;

function TFormMain.LoadStatusBarIcons: Boolean;
begin
  Result:= ((FileExists(FrontendPath+'resources\images\toolbars\Main\statusbar\0.ico')) and
            (FileExists(FrontendPath+'resources\images\toolbars\Main\statusbar\1.ico')) and
            (FileExists(FrontendPath+'resources\images\toolbars\Main\statusbar\2.ico')) and
            (FileExists(FrontendPath+'resources\images\toolbars\Main\statusbar\3.ico')) and
            (FileExists(FrontendPath+'resources\images\toolbars\Main\statusbar\4.ico')) and
            (FileExists(FrontendPath+'resources\images\toolbars\Main\toolbar\72.ico')));

  if Result then
     begin
       AddDefaultIcons('Main\statusbar\0.ico', StatusBarImageList, 1, False);
       AddDefaultIcons('Main\statusbar\1.ico', StatusBarImageList, 1, False);
       AddDefaultIcons('Main\statusbar\2.ico', StatusBarImageList, 1, False);
       AddDefaultIcons('Main\statusbar\3.ico', StatusBarImageList, 1, False);
       AddDefaultIcons('Main\statusbar\4.ico', StatusBarImageList, 1, False);
       AddDefaultIcons('Main\toolbar\72.ico', StatusBarImageList, 1, False);
     end;
end;

function TFormMain.CheckDefaultIconsFile: Boolean;
begin
  Result:= ((FileExists(FormPreferences.DefaultGameIconsFolder.Text+'\ClassicMasterRaster.ico')) and
            (FileExists(FormPreferences.DefaultGameIconsFolder.Text+'\ClassicMasterVector.ico')) and
            (FileExists(FormPreferences.DefaultGameIconsFolder.Text+'\ClassicCloneRaster.ico'))  and
            (FileExists(FormPreferences.DefaultGameIconsFolder.Text+'\ClassicCloneVector.ico'))  and
            (FileExists(FormPreferences.DefaultGameIconsFolder.Text+'\NeoGeoMaster.ico'))        and
            (FileExists(FormPreferences.DefaultGameIconsFolder.Text+'\NeoGeoClone.ico'))         and
            (FileExists(FormPreferences.DefaultGameIconsFolder.Text+'\UnavailableMaster.ico'))   and
            (FileExists(FormPreferences.DefaultGameIconsFolder.Text+'\UnavailableClone.ico'))    and
            (FileExists(FormPreferences.DefaultGameIconsFolder.Text+'\Bios.ico'))                and
            (FileExists(FormPreferences.DefaultGameIconsFolder.Text+'\CustomGames.ico'))         and
            (FileExists(FormPreferences.DefaultGameIconsFolder.Text+'\NoRealIcon.ico')));
end;

procedure TFormMain.ReadDefaultIconsFile;
var
  FileString: String;
begin
  FileString:= FormPreferences.DefaultGameIconsFolder.Text+'\ClassicMasterRaster.ico';
  AddDefaultIcons(FileString, BuiltInBigListImageList, 0, True);
  AddDefaultIcons(FileString, BuiltInSmallListImageList, 1, True);

  FileString:= FormPreferences.DefaultGameIconsFolder.Text+'\ClassicMasterVector.ico';
  AddDefaultIcons(FileString, BuiltInBigListImageList, 0, True);
  AddDefaultIcons(FileString, BuiltInSmallListImageList, 1, True);

  FileString:= FormPreferences.DefaultGameIconsFolder.Text+'\ClassicCloneRaster.ico';
  AddDefaultIcons(FileString, BuiltInBigListImageList, 0, True);
  AddDefaultIcons(FileString, BuiltInSmallListImageList, 1, True);

  FileString:= FormPreferences.DefaultGameIconsFolder.Text+'\ClassicCloneVector.ico';
  AddDefaultIcons(FileString, BuiltInBigListImageList, 0, True);
  AddDefaultIcons(FileString, BuiltInSmallListImageList, 1, True);

  FileString:= FormPreferences.DefaultGameIconsFolder.Text+'\NeoGeoMaster.ico';
  AddDefaultIcons(FileString, BuiltInBigListImageList, 0, True);
  AddDefaultIcons(FileString, BuiltInSmallListImageList, 1, True);

  FileString:= FormPreferences.DefaultGameIconsFolder.Text+'\NeoGeoClone.ico';
  AddDefaultIcons(FileString, BuiltInBigListImageList, 0, True);
  AddDefaultIcons(FileString, BuiltInSmallListImageList, 1, True);

  FileString:= FormPreferences.DefaultGameIconsFolder.Text+'\UnavailableMaster.ico';
  AddDefaultIcons(FileString, BuiltInBigListImageList, 0, True);
  AddDefaultIcons(FileString, BuiltInSmallListImageList, 1, True);

  FileString:= FormPreferences.DefaultGameIconsFolder.Text+'\UnavailableMaster.ico';
  AddDefaultIcons(FileString, BuiltInBigListImageList, 0, True);
  AddDefaultIcons(FileString, BuiltInSmallListImageList, 1, True);

  FileString:= FormPreferences.DefaultGameIconsFolder.Text+'\UnavailableClone.ico';
  AddDefaultIcons(FileString, BuiltInBigListImageList, 0, True);
  AddDefaultIcons(FileString, BuiltInSmallListImageList, 1, True);

  FileString:= FormPreferences.DefaultGameIconsFolder.Text+'\UnavailableClone.ico';
  AddDefaultIcons(FileString, BuiltInBigListImageList, 0, True);
  AddDefaultIcons(FileString, BuiltInSmallListImageList, 1, True);

  FileString:= FormPreferences.DefaultGameIconsFolder.Text+'\UnavailableMaster.ico';
  AddDefaultIcons(FileString, BuiltInBigListImageList, 0, True);
  AddDefaultIcons(FileString, BuiltInSmallListImageList, 1, True);

  FileString:= FormPreferences.DefaultGameIconsFolder.Text+'\UnavailableClone.ico';
  AddDefaultIcons(FileString, BuiltInBigListImageList, 0, True);
  AddDefaultIcons(FileString, BuiltInSmallListImageList, 1, True);

  FileString:= FormPreferences.DefaultGameIconsFolder.Text+'\Bios.ico';
  AddDefaultIcons(FileString, BuiltInBigListImageList, 0, True);
  AddDefaultIcons(FileString, BuiltInSmallListImageList, 1, True);

  FileString:= FormPreferences.DefaultGameIconsFolder.Text+'\Bios.ico';
  AddDefaultIcons(FileString, BuiltInBigListImageList, 0, True);
  AddDefaultIcons(FileString, BuiltInSmallListImageList, 1, True);

  FileString:= FormPreferences.DefaultGameIconsFolder.Text+'\UnavailableMaster.ico';
  AddDefaultIcons(FileString, BuiltInBigListImageList, 0, True);
  AddDefaultIcons(FileString, BuiltInSmallListImageList, 1, True);

  FileString:= FormPreferences.DefaultGameIconsFolder.Text+'\UnavailableMaster.ico';
  AddDefaultIcons(FileString, BuiltInBigListImageList, 0, True);
  AddDefaultIcons(FileString, BuiltInSmallListImageList, 1, True);

  FileString:= FormPreferences.DefaultGameIconsFolder.Text+'\CustomGames.ico';
  AddDefaultIcons(FileString, BuiltInBigListImageList, 0, True);
  AddDefaultIcons(FileString, BuiltInSmallListImageList, 1, True);

  FileString:= FormPreferences.DefaultGameIconsFolder.Text+'\UnavailableMaster.ico';
  AddDefaultIcons(FileString, BuiltInBigListImageList, 0, True);
  AddDefaultIcons(FileString, BuiltInSmallListImageList, 1, True);

  FileString:= FormPreferences.DefaultGameIconsFolder.Text+'\NoRealIcon.ico';
  AddDefaultIcons(FileString, BigRealIconsImageList, 0, True);
  AddDefaultIcons(FileString, SmallRealIconsImageList, 1, True);
end;

// MAME Configuration screens
function TFormMain.LoadMAMEConfigurationIcons(IconList: TImageList): Boolean;
begin
  Result:= ((FileExists(FrontendPath+'resources\images\toolbars\Main\toolbar\77.ico')) and
            (FileExists(FrontendPath+'resources\images\toolbars\Main\toolbar\27.ico')) and
            (FileExists(FrontendPath+'resources\images\toolbars\MAMEConfiguration\2.ico')) and
            (FileExists(FrontendPath+'resources\images\toolbars\MAMEConfiguration\3.ico')) and
            (FileExists(FrontendPath+'resources\images\toolbars\MAMEConfiguration\4.ico')));

  if Result then
     begin
       AddDefaultIcons('Main\toolbar\77.ico', IconList, 1, False);
       AddDefaultIcons('Main\toolbar\27.ico', IconList, 1, False);
       AddDefaultIcons('MAMEConfiguration\2.ico', IconList, 1, False);
       AddDefaultIcons('MAMEConfiguration\3.ico', IconList, 1, False);
       AddDefaultIcons('MAMEConfiguration\4.ico', IconList, 1, False);
     end;
end;

procedure TFormMain.AddDefaultIcons(IconFileName: String; IconList: TImageList; IconType: ShortInt; GameIcons: Boolean);
var
  FileIcon: TIcon;
  IconIndex: Integer;
begin
  FileIcon:= TIcon.Create;
  FileIcon.Transparent:= True;
  case IconType of
    0: // Big Icons
      begin
        FileIcon.Width:= 32;
        FileIcon.Height:= 32;
      end;
    1: // Small Icons
      begin
        FileIcon.Width:= 16;
        FileIcon.Height:= 16;
      end;
  end;
  case GameIcons of
    True : FileIcon.LoadFromFile(IconFileName);
    False: FileIcon.LoadFromFile(FrontendPath+'resources\images\toolbars\'+IconFileName);
  end;

  if (IconList = SmallRealIconsImageList) or (IconList = BigRealIconsImageList) then
     begin
       if IconList.Count > 0 then
          begin
            if IconList.Count > 1 then
               begin
                 if Pos('NoRealIcon.ico', IconFileName) <> 0 then
                    IconList.ReplaceIcon(0, FileIcon);
               end
            else
               begin
                 if Pos('NoRealIcon.ico', IconFileName) <> 0 then
                    IconList.ReplaceIcon(0, FileIcon)
                 else
                    IconIndex:= IconList.AddIcon(FileIcon);
               end;
          end
       else
          IconIndex:= IconList.AddIcon(FileIcon);
     end
  else
     IconIndex:= IconList.AddIcon(FileIcon);
  FreeAndNil(FileIcon);
end;

// User profile procedures
procedure TFormMain.ResetUserProfileOptions;
begin
  // from main menu "File"
  //Menu "Create Games List"
  MenuCreateGamesList.Visible:= True;

  // Menu "Emulators Setup"
  MenuEmulatorSetup.Visible:= True;

  // Menu "Emulators Description"
  MenuEmulatorDescription.Visible:= True;

  // Change Between Emulator Executables? "Select Executable Buttons"
  ButtonExecutablesMode.Visible:= True;
  MenuCurrentEmulator.Visible:= True;
  MenuUseExecutable1.Visible:= True;
  MenuUseExecutable2.Visible:= True;
  MenuUseExecutable3.Visible:= True;
  MenuUseExecutable4.Visible:= True;
  MenuUseExecutable5.Visible:= True;
  ButtonUseExecutable1.Visible:= True;
  ButtonUseExecutable2.Visible:= True;
  ButtonUseExecutable3.Visible:= True;
  ButtonUseExecutable4.Visible:= True;
  ButtonUseExecutable5.Visible:= True;

  //Menu "Emulators Default Options
  MenuEmulatorDefaultOptions.Visible:= True;

  //Menu "Preferences" - "Let User Change Preferences?"
  MenuPreferences.Visible:= True;

  // from main menu "View"
  //Change View Modes??? (Big Icons, Small Icons, List, Details)
  MenuModeViewBigIcons.Visible:= True;
  MenuModeViewSmallIcons.Visible:= True;
  MenuModeViewList.Visible:= True;
  MenuModeViewDetails.Visible:= True;
  ButtonModeView.Visible:= True;
  ButtonModeViewBigIcons.Visible:= True;
  ButtonModeViewSmallIcons.Visible:= True;
  ButtonModeViewList.Visible:= True;
  ButtonModeViewDetails.Visible:= True;

  // Menu "Show Favorite User Games" - Switch to Favorites List???
  MenuShowFavorite.Visible:= True;
  ButtonShowFavorite.Visible:= True;
  PopupShowFavorite.Visible:= True;

  // Menu "Show / Hide Favorite Users Manager"
  MenuShowHideFavoriteUsersManager.Visible:= True;
  PopupShowHideFavoriteUsersManager.Visible:= True;

  // Menu "Show / Hide Games List Columns"
  MenuGamesColumnsEditor.Visible:= True;
  PopupGamesColumnsEditor.Visible:= True;

  // from buttons toolbar
  // Games Filter Drop-down button
  ButtonGameType.Visible:= True;
  ButtonGameFilters.Visible:= True;

  // from main menu "Games"
  // Menu "Custom Game Options" - let user change options for a specific game???
  MenuCustomGameOptions.Visible:= True;
  PopupCustomGameOptions.Visible:= True;

  // Menu "Custom Initialization Options (MAME Only)"
  MenuCustomInitializationOptions.Visible:= True;
  PopupCustomInitializationOptions.Visible:= True;

  // Menu "Custom Command Line"
  MenuCustomCommandLine.Visible:= True;
  PopupCustomCommandLine.Visible:= True;

  // Menu "Game Description" - let user change game's description ?
  MenuGameDescription.Visible:= True;
  PopupGameDescription.Visible:= True;

  // Menu "Game Category"
  MenuGameCategory.Visible:= True;
  PopupGameCategory.Visible:= True;

  // Menu "Games Audit" - set user audit games???
  MenuGamesAudit.Visible:= True;
  PopupGamesAudit.Visible:= True;

  // Menu "Play a Recorded Game"
  MenuPlayRecordedGame.Visible:= True;
  ButtonPlayRecordedGame.Visible:= True;
  PopupPlayRecordedGame.Visible:= True;

  // Menu "Record Game"
  MenuRecordGame.Visible:= True;
  ButtonRecordGame.Visible:= True;
  PopupRecordGame.Visible:= True;

  // INP Filename Box
  INPFileName.Visible:= True;

  // Menu "Games Data" - let user view MAMEINFO.DAT / HISTORY.DAT / FAQs and Automatic MAMEINFO.DAT ???
  MenuGamesData.Visible:= True;
  MenuGameInformation.Visible:= True;
  MenuGameHistory.Visible:= True;
  MenuGameDriverInformation.Visible:= True;
  MenuGameFAQ.Visible:= True;
  MenuAutomaticGameInformation.Visible:= True;
  PopupGamesData.Visible:= True;
  PopupGameInformation.Visible:= True;
  PopupGameHistory.Visible:= True;
  PopupGameDriverInformation.Visible:= True;
  PopupGameFAQ.Visible:= True;
  PopupAutomaticGameInformation.Visible:= True;

  ButtonGamesDataMode.Visible:= True;
  ButtonGameInformation.Visible:= True;
  ButtonGameHistory.Visible:= True;
  ButtonGameDriverInformation.Visible:= True;
  ButtonGameFAQ.Visible:= True;
  ButtonAutomaticGameInformation.Visible:= True;

  // Menu "Delete gamename.zip" - let user delete .ZIP files???
  MenuDeleteZIPFileName.Visible:= True;
  PopupDeleteZIPFileName.Visible:= True;

  // Menu "Add to Favorites" - let user add games to favorite lists???
  MenuAddToFavorites.Visible:= True;
  PopupAddToFavorites.Visible:= True;

  // Menu "Delete From Favorites" - let user delete games from favorite lists???
  MenuDeleteFromFavorites.Visible:= True;
  PopupDeleteFromFavorites.Visible:= True;

  // Menu "Add Game to Parental Lock" - let user add a game to blocked lists ?
  MenuAddGameParentalLock.Visible:= True;
  PopupAddGameParentalLock.Visible:= True;

  // Menu "Real Icons" - let user switch between default and real icons???
  MenuRealIconsItems.Visible:= True;
  PopupRealIconsItems.Visible:= True;

  // Menu "Create Icons List" - let user create/re-create a real icons list???
  MenuCreateIconsList.Visible:= True;
  PopupCreateIconsList.Visible:= True;

  // Menu "Refresh Games" - let user refresh games???
  MenuRefreshGames.Visible:= True;
  ButtonRefreshAllGames.Visible:= True;
  PopupRefreshGames.Visible:= True;

  // Menu "Custom Games Manager" - let user add/edit/delete games from custom games list???
  MenuCustomGamesManager.Visible:= True;
  PopupCustomGamesManager.Visible:= True;

  // from main menu "Pictures"
  // Menu "Show Pictures" - let user toggle between pictures and no pictures???
  MenuShowPictures.Visible:= True;
  PopupShowPictures.Visible:= True;

  // Picture Types - let user change between picture types???
  ButtonPicturesModeView.Visible:= True;
  MenuShowTitleSnapshot.Visible:= True;
  ButtonShowTitleSnapshot.Visible:= True;
  PopupShowTitleSnapshot.Visible:= True;
  MenuShowInGameSnapshot.Visible:= True;
  ButtonShowInGameSnapshot.Visible:= True;
  PopupShowInGameSnapshot.Visible:= True;
  MenuShowMarquee.Visible:= True;
  ButtonShowMarquee.Visible:= True;
  PopupShowMarquee.Visible:= True;
  MenuShowFlyer.Visible:= True;
  ButtonShowFlyer.Visible:= True;
  PopupShowFlyer.Visible:= True;
  MenuShowCabinet.Visible:= True;
  ButtonShowCabinet.Visible:= True;
  PopupShowCabinet.Visible:= True;
  MenuShowControlPanel.Visible:= True;
  ButtonShowControlPanel.Visible:= True;
  PopupShowControlPanel.Visible:= True;
  MenuShowControlPanelLayout.Visible:= True;
  ButtonShowControlPanelLayout.Visible:= True;
  PopupShowControlPanelLayout.Visible:= True;

  // Menu "Delete Current Picture"
  MenuDeleteCurrentPicture.Visible:= True;
  PopupDeleteCurrentPicture.Visible:= True;

  // Menu "Rename Current Picture"
  MenuRenameCurrentPicture.Visible:= True;
  PopupRenameCurrentPicture.Visible:= True;

  // Menu "Delete All Extra Pictures"
  MenuDeleteAllExtraPictures.Visible:= True;
  PopupDeleteAllExtraPictures.Visible:= True;

  // Menu "Create Pictures List"
  MenuCreatePicturesList.Visible:= True;
  PopupCreatePicturesList.Visible:= True;

  // from main menu "Advanced Tools"
  // Menu "Parental Lock" and "Parental Lock Manager"
  MenuParentalLock.Visible:= True;
  MenuParentalLockManager.Visible:= True;

  // Menu "User Profile" and "User Profile Manager"
  MenuUserProfile.Visible:= True;
  MenuUserProfileEditor.Visible:= True;

  // Menu "Full Screen"
  MenuFullScreen.Visible:= True;
  PopupFullScreen.Visible:= True;
  PopupExit.Visible:= True;

  ButtonControllerKeysMapping.Visible:= True;
  // All main menus are done!!!!!!
end;

function TFormMain.SetUserProfileOptions(UserProfile: String): Boolean;
var
  UserFileName: TIniFile;
begin
  Result:= True;
  case FileExists(FrontendPath+'resources\profiles\'+UserProfile+'.dat') of
    True:
      begin
        UserFileName:= TIniFile.Create(FrontendPath+'resources\profiles\'+UserProfile+'.dat');
        // Profile Password
        // UserFileName.Values['ProfilePassword'];
        // from main menu "File"
        //Menu "Create Games List"
        MenuCreateGamesList.Visible:= Boolean(UserFileName.ReadInteger('Miscellaneous', 'CreateGamesList', 1));

        // Menu "Emulators Setup"
        MenuEmulatorSetup.Visible:= Boolean(UserFileName.ReadInteger('Miscellaneous', 'EmulatorsSetup', 1));

        // Menu "Emulators Description"
        MenuEmulatorDescription.Visible:= Boolean(UserFileName.ReadInteger('Miscellaneous', 'EmulatorsDescription' ,1));

        // Change Between Emulator Executables? "Select Executable Buttons"
        MenuUseExecutable1.Visible:= Boolean(UserFileName.ReadInteger('Miscellaneous', 'SelectExecutable1', 1));
        ButtonUseExecutable1.Visible:= MenuUseExecutable1.Visible;

        MenuUseExecutable2.Visible:= Boolean(UserFileName.ReadInteger('Miscellaneous', 'SelectExecutable2', 1));
        ButtonUseExecutable2.Visible:= MenuUseExecutable2.Visible;

        MenuUseExecutable3.Visible:= Boolean(UserFileName.ReadInteger('Miscellaneous', 'SelectExecutable3', 1));
        ButtonUseExecutable3.Visible:= MenuUseExecutable3.Visible;

        MenuUseExecutable4.Visible:= Boolean(UserFileName.ReadInteger('Miscellaneous', 'SelectExecutable4', 1));
        ButtonUseExecutable4.Visible:= MenuUseExecutable4.Visible;

        MenuUseExecutable5.Visible:= Boolean(UserFileName.ReadInteger('Miscellaneous', 'SelectExecutable5', 1));
        ButtonUseExecutable5.Visible:= MenuUseExecutable5.Visible;

        if ((not ButtonUseExecutable1.Visible) and (not ButtonUseExecutable2.Visible) and (not ButtonUseExecutable3.Visible) and
            (not ButtonUseExecutable4.Visible) and (not ButtonUseExecutable5.Visible)) then
           begin
             MenuCurrentEmulator.Visible:= False;
             ButtonExecutablesMode.Visible:= False;
           end;

        //Menu "Emulators Default Options
        MenuEmulatorDefaultOptions.Visible:= Boolean(UserFileName.ReadInteger('Miscellaneous', 'EmulatorDefaultOptions' ,1));

        //Menu "Preferences" - "Let User Change Preferences?"
        MenuPreferences.Visible:= Boolean(UserFileName.ReadInteger('Miscellaneous', 'FrontendPreferences', 1));

        // from main menu "View"
        //Change View Modes??? (Big Icons, Small Icons, List, Details)
        MenuModeViewBigIcons.Visible:= Boolean(UserFileName.ReadInteger('Miscellaneous', 'GamesListShowBigIcons' ,1));
        ButtonModeViewBigIcons.Visible:= MenuModeViewBigIcons.Visible;

        MenuModeViewSmallIcons.Visible:= Boolean(UserFileName.ReadInteger('Miscellaneous', 'GamesListShowSmallIcons' ,1));
        ButtonModeViewSmallIcons.Visible:= MenuModeViewSmallIcons.Visible;

        MenuModeViewList.Visible:= Boolean(UserFileName.ReadInteger('Miscellaneous', 'GamesListShowList' ,1));
        ButtonModeViewList.Visible:= MenuModeViewList.Visible;

        MenuModeViewDetails.Visible:= Boolean(UserFileName.ReadInteger('Miscellaneous', 'GamesListShowDetails' ,1));
        ButtonModeViewDetails.Visible:= MenuModeViewDetails.Visible;

        if ((not ButtonModeViewBigIcons.Visible) and (not ButtonModeViewSmallIcons.Visible) and
           (not ButtonModeViewList.Visible)      and (not ButtonModeViewDetails.Visible)) then
           ButtonModeView.Visible:= False;

        // Menu "Show Favorite User Games" - Switch to Favorites List???
        MenuShowFavorite.Visible:= Boolean(UserFileName.ReadInteger('Miscellaneous', 'ShowFavoriteGames' ,1));
        ButtonShowFavorite.Visible:= MenuShowFavorite.Visible;
        PopupShowFavorite.Visible:= MenuShowFavorite.Visible;

        // Menu "Show / Hide Favorite Users Manager"
        MenuShowHideFavoriteUsersManager.Visible:= Boolean(UserFileName.ReadInteger('Miscellaneous', 'FavoriteUsersManager' ,1));
        PopupShowHideFavoriteUsersManager.Visible:= MenuShowHideFavoriteUsersManager.Visible;

        // Menu "Show / Hide Games List Columns"
        MenuGamesColumnsEditor.Visible:= Boolean(UserFileName.ReadInteger('Miscellaneous', 'GamesColumnsEditor' ,1));
        PopupGamesColumnsEditor.Visible:= MenuGamesColumnsEditor.Visible;

        // from buttons toolbar
        // Games Filter Drop-down button
        ButtonGameType.Visible:= Boolean(UserFileName.ReadInteger('Games', 'GamesFilterSelector', 1));
        ButtonGameFilters.Visible:= ButtonGameType.Visible;

        // from main menu "Games"
        // Menu "Custom Game Options" - let user change options for a specific game???
        MenuCustomGameOptions.Visible:= Boolean(UserFileName.ReadInteger('Games', 'CustomGameOptions', 1));
        PopupCustomGameOptions.Visible:= MenuCustomGameOptions.Visible;

        // Menu "Custom Initialization Options (MAME Only)"
        MenuCustomInitializationOptions.Visible:= Boolean(UserFileName.ReadInteger('Games', 'CustomInitializationOptions', 1));
        PopupCustomInitializationOptions.Visible:= MenuCustomInitializationOptions.Visible;

        // Menu "Custom Command Line"
        MenuCustomCommandLine.Visible:= Boolean(UserFileName.ReadInteger('Games', 'CustomCommandLine', 1));
        PopupCustomCommandLine.Visible:= MenuCustomCommandLine.Visible;

        // Menu "Game Description" - let user change game's description ?
        MenuGameDescription.Visible:= Boolean(UserFileName.ReadInteger('Games', 'CustomGameDescription', 1));
        PopupGameDescription.Visible:= MenuGameDescription.Visible;

        // Menu "Game Category"
        MenuGameCategory.Visible:= Boolean(UserFileName.ReadInteger('Games', 'CustomGameCategory', 1));
        PopupGameCategory.Visible:= MenuGameCategory.Visible;

        // Menu "Games Audit" - set user audit games???
        MenuGamesAudit.Visible:= Boolean(UserFileName.ReadInteger('Games', 'GamesAudit', 1));
        PopupGamesAudit.Visible:= MenuGamesAudit.Visible;

        // Menu "Play a Recorded Game"
        MenuPlayRecordedGame.Visible:= Boolean(UserFileName.ReadInteger('Games', 'PlayRecordedGame', 1));
        ButtonPlayRecordedGame.Visible:= MenuPlayRecordedGame.Visible;
        PopupPlayRecordedGame.Visible:= MenuPlayRecordedGame.Visible;

        // Menu "Record Game"
        MenuRecordGame.Visible:= Boolean(UserFileName.ReadInteger('Games', 'RecordGame', 1));
        ButtonRecordGame.Visible:= MenuRecordGame.Visible;
        PopupRecordGame.Visible:= MenuRecordGame.Visible;

        // INP Filename Box
        if (not MenuPlayRecordedGame.Visible) and (not MenuRecordGame.Visible) then
           INPFileName.Visible:= False
        else
        if (MenuPlayRecordedGame.Visible) or (MenuRecordGame.Visible) then
           INPFileName.Visible:= True;

        // Menu "Games Data" - let user view MAMEINFO.DAT / HISTORY.DAT / FAQs and Automatic MAMEINFO.DAT ???

        MenuGameInformation.Visible:= Boolean(UserFileName.ReadInteger('Games', 'GamesInformation', 1));
        MenuGameHistory.Visible:= Boolean(UserFileName.ReadInteger('Games', 'GamesHistory', 1));
        MenuGameDriverInformation.Visible:= Boolean(UserFileName.ReadInteger('Games', 'GamesDriverInformation', 1));
        MenuGameFAQ.Visible:= Boolean(UserFileName.ReadInteger('Games', 'GamesFAQ', 1));
        MenuAutomaticGameInformation.Visible:= Boolean(UserFileName.ReadInteger('Games', 'AutomaticGameInformation', 1));
        PopupGameInformation.Visible:= MenuGameInformation.Visible;
        PopupGameHistory.Visible:= MenuGameHistory.Visible;
        PopupGameDriverInformation.Visible:= MenuGameDriverInformation.Visible;
        PopupGameFAQ.Visible:= MenuGameFAQ.Visible;
        PopupAutomaticGameInformation.Visible:= MenuAutomaticGameInformation.Visible;
        ButtonGameInformation.Visible:= MenuGameInformation.Visible;
        ButtonGameHistory.Visible:= MenuGameHistory.Visible;
        ButtonGameDriverInformation.Visible:= MenuGameDriverInformation.Visible;
        ButtonGameFAQ.Visible:= MenuGameFAQ.Visible;
        ButtonAutomaticGameInformation.Visible:= MenuAutomaticGameInformation.Visible;

        if ((not ButtonGameInformation.Visible) and (not ButtonGameHistory.Visible) and (not ButtonGameDriverInformation.Visible) and
            (not ButtonGameFAQ.Visible) and (not ButtonAutomaticGameInformation.Visible)) then
           begin
             MenuGamesData.Visible:= False;
             PopupGamesData.Visible:= MenuGamesData.Visible;
             ButtonGamesDataMode.Visible:= MenuGamesData.Visible;
           end;

        // Menu "Delete gamename.zip" - let user delete .ZIP files???
        MenuDeleteZIPFileName.Visible:= Boolean(UserFileName.ReadInteger('Games', 'DeleteGameZIP', 1));
        PopupDeleteZIPFileName.Visible:= MenuDeleteZIPFileName.Visible;

        // Menu "Add to Favorites" - let user add games to favorite lists???
        MenuAddToFavorites.Visible:= Boolean(UserFileName.ReadInteger('Games', 'AddToFavorites', 1));
        PopupAddToFavorites.Visible:= MenuAddToFavorites.Visible;

        // Menu "Delete From Favorites" - let user delete games from favorite lists???
        MenuDeleteFromFavorites.Visible:= Boolean(UserFileName.ReadInteger('Games', 'DeleteFromFavorites', 1));
        PopupDeleteFromFavorites.Visible:= MenuDeleteFromFavorites.Visible;

        // Menu "Add Game to Parental Lock" - let user add a game to blocked lists ?
        MenuAddGameParentalLock.Visible:= Boolean(UserFileName.ReadInteger('Games', 'AddGameParentalLock', 1));
        PopupAddGameParentalLock.Visible:= MenuAddGameParentalLock.Visible;

        // Menu "Real Icons" - let user switch between default and real icons???
        MenuRealIconsItems.Visible:= Boolean(UserFileName.ReadInteger('Games', 'RealIcons', 1));
        PopupRealIconsItems.Visible:= MenuRealIconsItems.Visible;

        // Menu "Refresh Games" - let user refresh games???
        MenuRefreshGames.Visible:= Boolean(UserFileName.ReadInteger('Games', 'RefreshGames', 1));
        ButtonRefreshAllGames.Visible:= MenuRefreshGames.Visible;
        PopupRefreshGames.Visible:= MenuRefreshGames.Visible;

        // Menu "Custom Games Manager" - let user add/edit/delete games from custom games list???
        MenuCustomGamesManager.Visible:= Boolean(UserFileName.ReadInteger('Games', 'CustomGamesManager', 1));
        PopupCustomGamesManager.Visible:= MenuCustomGamesManager.Visible;

        // from main menu "Pictures"
        // Menu "Show Pictures" - let user toggle between pictures and no pictures???
        MenuShowPictures.Visible:= Boolean(UserFileName.ReadInteger('Pictures', 'ShowPictures', 1));
        PopupShowPictures.Visible:= MenuShowPictures.Visible;

        // Picture Types - let user change between picture types???
        MenuShowTitleSnapshot.Visible:= Boolean(UserFileName.ReadInteger('Pictures', 'ShowTitleSnapshots', 1));
        ButtonShowTitleSnapshot.Visible:= MenuShowTitleSnapshot.Visible;
        PopupShowTitleSnapshot.Visible:= MenuShowTitleSnapshot.Visible;

        MenuShowInGameSnapshot.Visible:= Boolean(UserFileName.ReadInteger('Pictures', 'ShowInGameSnapshots', 1));
        ButtonShowInGameSnapshot.Visible:= MenuShowInGameSnapshot.Visible;
        PopupShowInGameSnapshot.Visible:= MenuShowInGameSnapshot.Visible;

        MenuShowMarquee.Visible:= Boolean(UserFileName.ReadInteger('Pictures', 'ShowMarquees', 1));
        ButtonShowMarquee.Visible:= MenuShowMarquee.Visible;
        PopupShowMarquee.Visible:= MenuShowMarquee.Visible;

        MenuShowFlyer.Visible:= Boolean(UserFileName.ReadInteger('Pictures', 'ShowFlyers', 1));
        ButtonShowFlyer.Visible:= MenuShowFlyer.Visible;
        PopupShowFlyer.Visible:= MenuShowFlyer.Visible;

        MenuShowCabinet.Visible:= Boolean(UserFileName.ReadInteger('Pictures', 'ShowCabinets', 1));
        ButtonShowCabinet.Visible:= MenuShowCabinet.Visible;
        PopupShowCabinet.Visible:= MenuShowCabinet.Visible;

        MenuShowControlPanel.Visible:= Boolean(UserFileName.ReadInteger('Pictures', 'ShowControlPanels', 1));
        ButtonShowControlPanel.Visible:= MenuShowControlPanel.Visible;
        PopupShowControlPanel.Visible:= MenuShowControlPanel.Visible;

        MenuShowControlPanelLayout.Visible:= Boolean(UserFileName.ReadInteger('Pictures', 'ShowControlPanelLayouts', 1));
        ButtonShowControlPanelLayout.Visible:= MenuShowControlPanelLayout.Visible;
        PopupShowControlPanelLayout.Visible:= MenuShowControlPanelLayout.Visible;

        if ((not ButtonShowTitleSnapshot.Visible) and (not ButtonShowInGameSnapshot.Visible) and (not ButtonShowMarquee.Visible) and
            (not ButtonShowFlyer.Visible)         and (not ButtonShowCabinet.Visible)        and (not ButtonShowControlPanel.Visible) and
            (not ButtonShowControlPanelLayout.Visible)) then
           ButtonPicturesModeView.Visible:= False;;

        // Menu "Delete Current Picture"
        MenuDeleteCurrentPicture.Visible:= Boolean(UserFileName.ReadInteger('Pictures', 'DeletePictures', 1));
        PopupDeleteCurrentPicture.Visible:= MenuDeleteCurrentPicture.Visible;

        // Menu "Rename Current Picture"
        MenuRenameCurrentPicture.Visible:= Boolean(UserFileName.ReadInteger('Pictures', 'RenamePicture', 1));
        PopupRenameCurrentPicture.Visible:= MenuRenameCurrentPicture.Visible;

        // Menu "Delete All Extra Pictures"
        MenuDeleteAllExtraPictures.Visible:= Boolean(UserFileName.ReadInteger('Pictures', 'DeleteExtraPictures', 1));
        PopupDeleteAllExtraPictures.Visible:= MenuDeleteAllExtraPictures.Visible;

        // Menu "Create Pictures List"
        MenuCreatePicturesList.Visible:= Boolean(UserFileName.ReadInteger('Pictures', 'CreatePicturesList', 1));
        PopupCreatePicturesList.Visible:= MenuCreatePicturesList.Visible;

        // from main menu "Advanced Tools"
        // Menu "Parental Lock" and "Parental Lock Manager"
        MenuParentalLock.Visible:= Boolean(UserFileName.ReadInteger('Miscellaneous', 'ParentalLock', 1));
        MenuParentalLockManager.Visible:= MenuParentalLock.Visible;

        // Menu "User Profile" and "User Profile Manager"
        MenuUserProfile.Visible:= Boolean(UserFileName.ReadInteger('Miscellaneous', 'UserProfile', 1));
        MenuUserProfileEditor.Visible:= MenuUserProfile.Visible;

        // Menu "Full Screen"
        MenuFullScreen.Visible:= Boolean(UserFileName.ReadInteger('Miscellaneous', 'FullScreen', 1));
        PopupFullScreen.Visible:= MenuFullScreen.Visible;

        case MenuFullScreen.Visible of
          True : PopupExit.Visible:= Boolean(UserFileName.ReadInteger('Miscellaneous', 'FullScreenExit', 1));
          False: PopupExit.Visible:= False;
        end;

        ButtonControllerKeysMapping.Visible:= Boolean(UserFileName.ReadInteger('Miscellaneous', 'KeysMappingSelector', 1));
        StatusBarUserProfile.Visible:= MenuUserProfile.Checked;

        FreeAndNil(UserFileName);
        // All main menus are done!!!!!!
      end;
    False: Result:= False;
  end;
end;

function TFormMain.ReadUserProfileOptions(UserProfile: String): Boolean;
var
  UserFileName: TIniFile;
begin
  Result:= True;
  // Profile Password
  // UserFileName.Values['ProfilePassword'];

  UserFileName:= TIniFile.Create(FrontendPath+'resources\profiles\'+UserProfile+'.dat');
  with FormUserProfileEditor do
  begin
    // from main menu "File"
    //Menu "Create Games List"
    CreateGamesList.Checked:= Boolean(UserFileName.ReadInteger('Miscellaneous', 'CreateGamesList', 1));

    // Menu "Emulators Setup"
    EmulatorsSetup.Checked:= Boolean(UserFileName.ReadInteger('Miscellaneous', 'EmulatorsSetup', 1));

    // Menu "Emulators Description"
    EmulatorsDescriptions.Checked:= Boolean(UserFileName.ReadInteger('Miscellaneous', 'EmulatorsDescription', 1));

    // Change Between Emulator Executables? "Select Executable Buttons"
    SelectExecutable1.Checked:= Boolean(UserFileName.ReadInteger('Miscellaneous', 'SelectExecutable1', 1));
    SelectExecutable2.Checked:= Boolean(UserFileName.ReadInteger('Miscellaneous', 'SelectExecutable2', 1));
    SelectExecutable3.Checked:= Boolean(UserFileName.ReadInteger('Miscellaneous', 'SelectExecutable3', 1));
    SelectExecutable4.Checked:= Boolean(UserFileName.ReadInteger('Miscellaneous', 'SelectExecutable4', 1));
    SelectExecutable5.Checked:= Boolean(UserFileName.ReadInteger('Miscellaneous', 'SelectExecutable5', 1));

    //Menu "Emulators Default Options
    EmulatorsDefaultOptions.Checked:= Boolean(UserFileName.ReadInteger('Miscellaneous', 'EmulatorDefaultOptions', 1));

    //Menu "Preferences" - "Let User Change Preferences?"
    FrontendPreferences.Checked:= Boolean(UserFileName.ReadInteger('Miscellaneous', 'FrontendPreferences', 1));

    // from main menu "View"
    //Change View Modes??? (Big Icons, Small Icons, List, Details)
    GamesListShowBigIcons.Checked:= Boolean(UserFileName.ReadInteger('Miscellaneous', 'GamesListShowBigIcons', 1));
    GamesListShowSmallIcons.Checked:= Boolean(UserFileName.ReadInteger('Miscellaneous', 'GamesListShowSmallIcons', 1));
    GamesListShowList.Checked:= Boolean(UserFileName.ReadInteger('Miscellaneous', 'GamesListShowList', 1));
    GamesListShowDetails.Checked:= Boolean(UserFileName.ReadInteger('Miscellaneous', 'GamesListShowDetails', 1));

    // Menu "Show Favorite User Games" - Switch to Favorites List???
    FavoriteGames.Checked:= Boolean(UserFileName.ReadInteger('Miscellaneous', 'ShowFavoriteGames', 1));

    // Menu "Show / Hide Favorite Users Manager"
    FavoriteUsersManager.Checked:= Boolean(UserFileName.ReadInteger('Miscellaneous', 'FavoriteUsersManager', 1));

    // Menu "Show / Hide Games List Columns"
    GamesColumnsEditor.Checked:= Boolean(UserFileName.ReadInteger('Miscellaneous', 'GamesColumnsEditor', 1));

    // from buttons toolbar
    // Games Filter Drop-down button
    GamesFilterSelector.Checked:= Boolean(UserFileName.ReadInteger('Games', 'GamesFilterSelector', 1));

    // from main menu "Games"
    // Menu "Custom Game Options" - let user change options for a specific game???
    CustomGameOptions.Checked:= Boolean(UserFileName.ReadInteger('Games', 'CustomGameOptions', 1));

    // Menu "Custom Initialization Options (MAME Only)"
    CustomInitializationOptions.Checked:= Boolean(UserFileName.ReadInteger('Games', 'CustomInitializationOptions', 1));

    // Menu "Custom Command Line"
    CustomCommandLine.Checked:= Boolean(UserFileName.ReadInteger('Games', 'CustomCommandLine', 1));

    // Menu "Game Description" - let user change game's description ?
    CustomGameDescription.Checked:= Boolean(UserFileName.ReadInteger('Games', 'CustomGameDescription', 1));

    // Menu "Game Category"
    CustomGameCategory.Checked:= Boolean(UserFileName.ReadInteger('Games', 'CustomGameCategory', 1));


    // Menu "Games Audit" - set user audit games???
    GamesAudit.Checked:= Boolean(UserFileName.ReadInteger('Games', 'GamesAudit', 1));

    // Menu "Play a Recorded Game"
    PlayRecordedGame.Checked:= Boolean(UserFileName.ReadInteger('Games', 'PlayRecordedGame', 1));

    // Menu "Record Game"
    RecordGame.Checked:= Boolean(UserFileName.ReadInteger('Games', 'RecordGame', 1));

    // Menu "Games Data" - let user view MAMEINFO.DAT / HISTORY.DAT / FAQs and Automatic MAMEINFO.DAT ???
    GamesInformation.Checked:= Boolean(UserFileName.ReadInteger('Games', 'GamesInformation', 1));
    GamesHistory.Checked:= Boolean(UserFileName.ReadInteger('Games', 'GamesHistory', 1));
    GamesDriverInformation.Checked:= Boolean(UserFileName.ReadInteger('Games', 'GamesDriverInformation', 1));
    GamesFAQ.Checked:= Boolean(UserFileName.ReadInteger('Games', 'GamesFAQ', 1));
    AutomaticGameInformation.Checked:= Boolean(UserFileName.ReadInteger('Games', 'AutomaticGameInformation', 1));

    // Menu "Delete gamename.zip" - let user delete .ZIP files???
    DeleteGameZIP.Checked:= Boolean(UserFileName.ReadInteger('Games', 'DeleteGameZIP', 1));

    // Menu "Add to Favorites" - let user add games to favorite lists???
    AddGamesToFavorites.Checked:= Boolean(UserFileName.ReadInteger('Games', 'AddToFavorites', 1));

    // Menu "Delete From Favorites" - let user delete games from favorite lists???
    DeleteGamesFromFavorites.Checked:= Boolean(UserFileName.ReadInteger('Games', 'DeleteFromFavorites', 1));

    // Menu "Add Game to Parental Lock" - let user add a game to blocked lists ?
    AddGameParentalLock.Checked:= Boolean(UserFileName.ReadInteger('Games', 'AddGameParentalLock', 1));

    // Menu "Real Icons" - let user switch between default and real icons???
    RealIcons.Checked:= Boolean(UserFileName.ReadInteger('Games', 'RealIcons', 1));

    // Menu "Refresh Games" - let user refresh games???
    RefreshGames.Checked:= Boolean(UserFileName.ReadInteger('Games', 'RefreshGames', 1));

    // Menu "Custom Games Manager" - let user add/edit/delete games from custom games list???
    CustomGamesManager.Checked:= Boolean(UserFileName.ReadInteger('Games', 'CustomGamesManager', 1));

    // from main menu "Pictures"
    // Menu "Show Pictures" - let user toggle between pictures and no pictures???
    ShowPictures.Checked:= Boolean(UserFileName.ReadInteger('Pictures', 'ShowPictures', 1));

    // Picture Types - let user change between picture types???
    ShowTitleSnapshots.Checked:= Boolean(UserFileName.ReadInteger('Pictures', 'ShowTitleSnapshots', 1));
    ShowInGameSnapshots.Checked:= Boolean(UserFileName.ReadInteger('Pictures', 'ShowInGameSnapshots', 1));
    ShowMarquees.Checked:= Boolean(UserFileName.ReadInteger('Pictures', 'ShowMarquees', 1));
    ShowFlyers.Checked:= Boolean(UserFileName.ReadInteger('Pictures', 'ShowFlyers', 1));
    ShowCabinets.Checked:= Boolean(UserFileName.ReadInteger('Pictures', 'ShowCabinets', 1));
    ShowControlPanels.Checked:= Boolean(UserFileName.ReadInteger('Pictures', 'ShowControlPanels', 1));
    ShowControlPanelLayouts.Checked:= Boolean(UserFileName.ReadInteger('Pictures', 'ShowControlPanelLayouts', 1));

    // Menu "Delete Current Picture"
    DeletePictures.Checked:= Boolean(UserFileName.ReadInteger('Pictures', 'DeletePictures', 1));

    // Menu "Rename Current Picture"
    RenamePictures.Checked:= Boolean(UserFileName.ReadInteger('Pictures', 'RenamePictures', 1));

    // Menu "Delete All Extra Pictures"
    DeleteExtraPictures.Checked:= Boolean(UserFileName.ReadInteger('Pictures', 'DeleteExtraPictures', 1));

    // Menu "Create Pictures List"
    CreatePicturesList.Checked:= Boolean(UserFileName.ReadInteger('Pictures', 'CreatePicturesList', 1));

    // from main menu "Advanced Tools"
    // Menu "Parental Lock" and "Parental Lock Manager"
    ParentalLock.Checked:= Boolean(UserFileName.ReadInteger('Miscellaneous', 'ParentalLock', 1));

    // Menu "User Profile" and "User Profile Manager"
    UserProfile.Checked:= Boolean(UserFileName.ReadInteger('Miscellaneous', 'UserProfile', 1));

    // Menu "Full Screen"
    FullScreen.Checked:= Boolean(UserFileName.ReadInteger('Miscellaneous', 'FullScreen', 1));
    FullScreenExit.Checked:= Boolean(UserFileName.ReadInteger('Miscellaneous', 'FullScreenExit', 1));

    KeysMappingSelector.Checked:= Boolean(UserFileName.ReadInteger('Miscellaneous', 'KeysMappingSelector', 1));
  end;
  // All main menus are done!!!!!!
  FreeAndNil(UserFileName);
end;

function TFormMain.UpdateUserProfileOptions(UserProfile: String): Boolean;
var
  UserFileName: TIniFile;
begin
  // Profile Password
  // UserFileName.Values['ProfilePassword'];
  Result:= True;
  UserFileName:= TIniFile.Create(FrontendPath+'resources\profiles\'+UserProfile+'.dat');
  with FormUserProfileEditor do
  begin
    // from main menu "File"
    //Menu "Create Games List"
    UserFileName.WriteInteger('Miscellaneous', 'CreateGamesList', Ord(CreateGamesList.Checked));

    // Menu "Emulators Setup"
    UserFileName.WriteInteger('Miscellaneous', 'EmulatorsSetup', Ord(EmulatorsSetup.Checked));

    // Menu "Emulators Description"
    UserFileName.WriteInteger('Miscellaneous', 'EmulatorsDescription', Ord(EmulatorsDescriptions.Checked));

    // Change Between Emulator Executables? "Select Executable Buttons"
    UserFileName.WriteInteger('Miscellaneous', 'SelectExecutable1', Ord(SelectExecutable1.Checked));
    UserFileName.WriteInteger('Miscellaneous', 'SelectExecutable2', Ord(SelectExecutable2.Checked));
    UserFileName.WriteInteger('Miscellaneous', 'SelectExecutable3', Ord(SelectExecutable3.Checked));
    UserFileName.WriteInteger('Miscellaneous', 'SelectExecutable4', Ord(SelectExecutable4.Checked));
    UserFileName.WriteInteger('Miscellaneous', 'SelectExecutable5', Ord(SelectExecutable5.Checked));

    //Menu "Emulators Default Options
    UserFileName.WriteInteger('Miscellaneous', 'EmulatorDefaultOptions', Ord(EmulatorsDefaultOptions.Checked));

    //Menu "Preferences" - "Let User Change Preferences?"
    UserFileName.WriteInteger('Miscellaneous', 'FrontendPreferences', Ord(FrontendPreferences.Checked));

    // from main menu "View"
    //Change View Modes??? (Big Icons, Small Icons, List, Details)
    UserFileName.WriteInteger('Miscellaneous', 'GamesListShowBigIcons', Ord(GamesListShowBigIcons.Checked));
    UserFileName.WriteInteger('Miscellaneous', 'GamesListShowSmallIcons', Ord(GamesListShowSmallIcons.Checked));
    UserFileName.WriteInteger('Miscellaneous', 'GamesListShowList', Ord(GamesListShowList.Checked));
    UserFileName.WriteInteger('Miscellaneous', 'GamesListShowDetails', Ord(GamesListShowDetails.Checked));

    // Menu "Show Favorite User Games" - Switch to Favorites List???
    UserFileName.WriteInteger('Miscellaneous', 'ShowFavoriteGames', Ord(FavoriteGames.Checked));

    // Menu "Show / Hide Favorite Users Manager"
    UserFileName.WriteInteger('Miscellaneous', 'FavoriteUsersManager', Ord(FavoriteUsersManager.Checked));

    // Menu "Show / Hide Games List Columns"
    UserFileName.WriteInteger('Miscellaneous', 'GamesColumnsEditor', Ord(GamesColumnsEditor.Checked));

    // from buttons toolbar
    // Games Filter Drop-down button
    UserFileName.WriteInteger('Games', 'GamesFilterSelector', Ord(GamesFilterSelector.Checked));

    // from main menu "Games"
    // Menu "Custom Game Options" - let user change options for a specific game???
    UserFileName.WriteInteger('Games', 'CustomGameOptions', Ord(CustomGameOptions.Checked));

    // Menu "Custom Initialization Options (MAME Only)"
    UserFileName.WriteInteger('Games', 'CustomInitializationOptions', Ord(CustomInitializationOptions.Checked));

    // Menu "Custom Command Line"
    UserFileName.WriteInteger('Games', 'CustomCommandLine', Ord(CustomCommandLine.Checked));

    // Menu "Game Description" - let user change game's description ?
    UserFileName.WriteInteger('Games', 'CustomGameDescription', Ord(CustomGameDescription.Checked));

    // Menu "Game Category"
    UserFileName.WriteInteger('Games', 'CustomGameCategory', Ord(CustomGameCategory.Checked));

    // Menu "Games Audit" - set user audit games???
    UserFileName.WriteInteger('Games', 'GamesAudit', Ord(GamesAudit.Checked));

    // Menu "Play a Recorded Game"
    UserFileName.WriteInteger('Games', 'PlayRecordedGame', Ord(PlayRecordedGame.Checked));

    // Menu "Record Game"
    UserFileName.WriteInteger('Games', 'RecordGame', Ord(RecordGame.Checked));

    // Menu "Games Data" - let user view MAMEINFO.DAT / HISTORY.DAT / FAQs and Automatic MAMEINFO.DAT ???
    //UserFileName.WriteInteger('Games', 'GamesData', Ord(GamesData.Checked));

    UserFileName.WriteInteger('Games', 'GamesInformation', Ord(GamesInformation.Checked));
    UserFileName.WriteInteger('Games', 'GamesHistory', Ord(GamesHistory.Checked));
    UserFileName.WriteInteger('Games', 'GamesDriverInformation', Ord(GamesDriverInformation.Checked));
    UserFileName.WriteInteger('Games', 'GamesFAQ', Ord(GamesFAQ.Checked));
    UserFileName.WriteInteger('Games', 'AutomaticGameInformation', Ord(AutomaticGameInformation.Checked));

    // Menu "Delete gamename.zip" - let user delete .ZIP files???
    UserFileName.WriteInteger('Games', 'DeleteGameZIP', Ord(DeleteGameZIP.Checked));

    // Menu "Add to Favorites" - let user add games to favorite lists???
    UserFileName.WriteInteger('Games', 'AddToFavorites', Ord(AddGamesToFavorites.Checked));

    // Menu "Delete From Favorites" - let user delete games from favorite lists???
    UserFileName.WriteInteger('Games', 'DeleteFromFavorites', Ord(DeleteGamesFromFavorites.Checked));

    // Menu "Add Game to Parental Lock" - let user add a game to blocked lists ?
    UserFileName.WriteInteger('Games', 'AddGameParentalLock', Ord(AddGameParentalLock.Checked));

    // Menu "Real Icons" - let user switch between default and real icons???
    UserFileName.WriteInteger('Games', 'RealIcons', Ord(RealIcons.Checked));

    // Menu "Refresh Games" - let user refresh games???
    UserFileName.WriteInteger('Games', 'RefreshGames', Ord(RefreshGames.Checked));

    // Menu "Custom Games Manager" - let user add/edit/delete games from custom games list???
    UserFileName.WriteInteger('Games', 'CustomGamesManager', Ord(CustomGamesManager.Checked));

    // from main menu "Pictures"
    // Menu "Show Pictures" - let user toggle between pictures and no pictures???
    UserFileName.WriteInteger('Pictures', 'ShowPictures', Ord(ShowPictures.Checked));

    // Picture Types - let user change between picture types???
    UserFileName.WriteInteger('Pictures', 'ShowTitleSnapshots', Ord(ShowTitleSnapshots.Checked));
    UserFileName.WriteInteger('Pictures', 'ShowInGameSnapshots', Ord(ShowInGameSnapshots.Checked));
    UserFileName.WriteInteger('Pictures', 'ShowMarquees', Ord(ShowMarquees.Checked));
    UserFileName.WriteInteger('Pictures', 'ShowFlyers', Ord(ShowFlyers.Checked));
    UserFileName.WriteInteger('Pictures', 'ShowCabinets', Ord(ShowCabinets.Checked));
    UserFileName.WriteInteger('Pictures', 'ShowControlPanels', Ord(ShowControlPanels.Checked));
    UserFileName.WriteInteger('Pictures', 'ShowControlPanelLayouts', Ord(ShowControlPanelLayouts.Checked));

    // Menu "Delete Current Picture"
    UserFileName.WriteInteger('Pictures', 'DeletePictures', Ord(DeletePictures.Checked));

    // Menu "Rename Current Picture"
    UserFileName.WriteInteger('Pictures', 'RenamePictures', Ord(RenamePictures.Checked));

    // Menu "Delete All Extra Pictures"
    UserFileName.WriteInteger('Pictures', 'DeleteExtraPictures', Ord(DeleteExtraPictures.Checked));

    // Menu "Create Pictures List"
    UserFileName.ReadInteger('Pictures', 'CreatePicturesList', Ord(CreatePicturesList.Checked));

    // from main menu "Advanced Tools"
    // Menu "Parental Lock" and "Parental Lock Manager"
    UserFileName.WriteInteger('Miscellaneous', 'ParentalLock', Ord(ParentalLock.Checked));

    // Menu "User Profile" and "User Profile Manager"
    UserFileName.WriteInteger('Miscellaneous', 'UserProfile', Ord(UserProfile.Checked));

    // Menu "Full Screen"
    UserFileName.WriteInteger('Miscellaneous', 'FullScreen', Ord(FullScreen.Checked));
    UserFileName.WriteInteger('Miscellaneous', 'FullScreenExit', Ord(FullScreenExit.Checked));

    UserFileName.WriteInteger('Miscellaneous', 'KeysMappingSelector', Ord(KeysMappingSelector.Checked));
  end;
  // All main menus are done!!!!!!
  FreeAndNil(UserFileName);
end;

procedure TFormMain.ResetProfileEditorOptions;
begin
  with FormUserProfileEditor do
  begin
    // from main menu "File"
    //Menu "Create Games List"
    CreateGamesList.Checked:= True;

    // Menu "Emulators Setup"
    EmulatorsSetup.Checked:= True;

    // Menu "Emulators Description"
    EmulatorsDescriptions.Checked:= True;

    // Change Between Emulator Executables? "Select Executable Buttons"
    SelectExecutable1.Checked:= True;
    SelectExecutable2.Checked:= True;
    SelectExecutable3.Checked:= True;
    SelectExecutable4.Checked:= True;
    SelectExecutable5.Checked:= True;

    //Menu "Emulators Default Options
    EmulatorsDefaultOptions.Checked:= True;

    //Menu "Preferences" - "Let User Change Preferences?"
    FrontendPreferences.Checked:= True;

    // from main menu "View"
    //Change View Modes??? (Big Icons, Small Icons, List, Details)
    GamesListShowBigIcons.Checked:= True;
    GamesListShowSmallIcons.Checked:= True;
    GamesListShowList.Checked:= True;
    GamesListShowDetails.Checked:= True;

    // Menu "Show Favorite User Games" - Switch to Favorites List???
    FavoriteGames.Checked:= True;

    // Menu "Show / Hide Favorite Users Manager"
    FavoriteUsersManager.Checked:= True;

    // Menu "Show / Hide Games List Columns"
    GamesColumnsEditor.Checked:= True;

    // from buttons toolbar
    // Games Filter Drop-down button
    GamesFilterSelector.Checked:= True;

    // from main menu "Games"
    // Menu "Custom Game Options" - let user change options for a specific game???
    CustomGameOptions.Checked:= True;

    // Menu "Custom Initialization Options (MAME Only)"
    CustomInitializationOptions.Checked:= True;

    // Menu "Custom Command Line"
    CustomCommandLine.Checked:= True;

    // Menu "Game Description" - let user change game's description ?
    CustomGameDescription.Checked:= True;

    // Menu "Game Category"
    CustomGameCategory.Checked:= True;

    // Menu "Games Audit" - set user audit games???
    GamesAudit.Checked:= True;

    // Menu "Play a Recorded Game"
    PlayRecordedGame.Checked:= True;

    // Menu "Record Game"
    RecordGame.Checked:= True;

    // Menu "Games Data" - let user view MAMEINFO.DAT / HISTORY.DAT / FAQs and Automatic MAMEINFO.DAT ???
    GamesInformation.Checked:= True;
    GamesHistory.Checked:= True;
    GamesDriverInformation.Checked:= True;
    GamesFAQ.Checked:= True;
    AutomaticGameInformation.Checked:= True;

    // Menu "Delete gamename.zip" - let user delete .ZIP files???
    DeleteGameZIP.Checked:= True;

    // Menu "Add to Favorites" - let user add games to favorite lists???
    AddGamesToFavorites.Checked:= True;

    // Menu "Delete From Favorites" - let user delete games from favorite lists???
    DeleteGamesFromFavorites.Checked:= True;

    // Menu "Add Game to Parental Lock" - let user add a game to blocked lists ?
    AddGameParentalLock.Checked:= True;

    // Menu "Real Icons" - let user switch between default and real icons???
    RealIcons.Checked:= True;

    // Menu "Refresh Games" - let user refresh games???
    RefreshGames.Checked:= True;

    // Menu "Custom Games Manager" - let user add/edit/delete games from custom games list???
    CustomGamesManager.Checked:= True;

    // from main menu "Pictures"
    // Menu "Show Pictures" - let user toggle between pictures and no pictures???
    ShowPictures.Checked:= True;

    // Picture Types - let user change between picture types???
    ShowTitleSnapshots.Checked:= True;
    ShowInGameSnapshots.Checked:= True;
    ShowMarquees.Checked:= True;
    ShowFlyers.Checked:= True;
    ShowCabinets.Checked:= True;
    ShowControlPanels.Checked:= True;
    ShowControlPanelLayouts.Checked:= True;

    // Menu "Delete Current Picture"
    DeletePictures.Checked:= True;

    // Menu "Rename Current Picture"
    RenamePictures.Checked:= True;

    // Menu "Delete All Extra Pictures"
    DeleteExtraPictures.Checked:= True;

    // Menu "Create Pictures List"
    CreatePicturesList.Checked:= True;

    // from main menu "Advanced Tools"
    // Menu "Parental Lock" and "Parental Lock Manager"
    ParentalLock.Checked:= True;

    // Menu "User Profile" and "User Profile Manager"
    UserProfile.Checked:= True;

    // Menu "Full Screen"
    FullScreen.Checked:= True;
    FullScreenExit.Checked:= True;

    KeysMappingSelector.Checked:= True;
  end;
  // All main menus are done!!!!!!
end;

function TFormMain.VerifyProfileChanges(UserProfile: String): Boolean;
var
  UserFileName: TIniFile;
begin
  Result:= False;

  if not FileExists(FrontendPath+'resources\profiles\'+UserProfile+'.dat') then
     begin
       GenerateMessage(GetLanguageText('Messages', 'FileNotFoundTitle', 'File Not Found'),
                       Format(GetLanguageText('Messages', 'UserProfileNotCreatedMsg', 'The user profile "%s" is not created yet! It cannot be verifyed. Aborting...'), [UserProfile]), 2);
       Exit;
     end;
  UserFileName:= TIniFile.Create(FrontendPath+'resources\profiles\'+UserProfile+'.dat');
  with FormUserProfileEditor do
  begin
    // from main menu "File"
    //Menu "Create Games List"
    if CreateGamesList.Checked <> Boolean(UserFileName.ReadInteger('Miscellaneous', 'CreateGamesList', 1)) then
       Result:= True;

    // Menu "Emulators Setup"
    if EmulatorsSetup.Checked <> Boolean(UserFileName.ReadInteger('Miscellaneous', 'EmulatorsSetup', 1)) then
       Result:= True;

    // Menu "Emulators Description"
    if EmulatorsDescriptions.Checked <> Boolean(UserFileName.ReadInteger('Miscellaneous', 'EmulatorsDescription', 1)) then
       Result:= True;

    // Change Between Emulator Executables? "Select Executable Buttons"
    if SelectExecutable1.Checked <> Boolean(UserFileName.ReadInteger('Miscellaneous', 'SelectExecutable1', 1)) then
       Result:= True;
    if SelectExecutable2.Checked <> Boolean(UserFileName.ReadInteger('Miscellaneous', 'SelectExecutable2', 1)) then
       Result:= True;
    if SelectExecutable3.Checked <> Boolean(UserFileName.ReadInteger('Miscellaneous', 'SelectExecutable3', 1)) then
       Result:= True;
    if SelectExecutable4.Checked <> Boolean(UserFileName.ReadInteger('Miscellaneous', 'SelectExecutable4', 1)) then
       Result:= True;
    if SelectExecutable5.Checked <> Boolean(UserFileName.ReadInteger('Miscellaneous', 'SelectExecutable5', 1)) then
       Result:= True;

    //Menu "Emulators Default Options
    if EmulatorsDefaultOptions.Checked <> Boolean(UserFileName.ReadInteger('Miscellaneous', 'EmulatorDefaultOptions', 1)) then
       Result:= True;

    //Menu "Preferences" - "Let User Change Preferences?"
    if FrontendPreferences.Checked <> Boolean(UserFileName.ReadInteger('Miscellaneous', 'FrontendPreferences', 1)) then
       Result:= True;

    // from main menu "View"
    //Change View Modes??? (Big Icons, Small Icons, List, Details)
    if GamesListShowBigIcons.Checked <> Boolean(UserFileName.ReadInteger('Miscellaneous', 'GamesListShowBigIcons', 1)) then
       Result:= True;
    if GamesListShowSmallIcons.Checked <> Boolean(UserFileName.ReadInteger('Miscellaneous', 'GamesListShowSmallIcons', 1)) then
       Result:= True;
    if GamesListShowList.Checked <> Boolean(UserFileName.ReadInteger('Miscellaneous', 'GamesListShowList', 1)) then
       Result:= True;
    if GamesListShowDetails.Checked <> Boolean(UserFileName.ReadInteger('Miscellaneous', 'GamesListShowDetails', 1)) then
       Result:= True;

    // Menu "Show Favorite User Games" - Switch to Favorites List???
    if FavoriteGames.Checked <> Boolean(UserFileName.ReadInteger('Miscellaneous', 'ShowFavoriteGames', 1)) then
       Result:= True;

    // Menu "Show / Hide Favorite Users Manager"
    if FavoriteUsersManager.Checked <> Boolean(UserFileName.ReadInteger('Miscellaneous', 'FavoriteUsersManager', 1)) then
       Result:= True;

    // Menu "Show / Hide Games List Columns"
    if GamesColumnsEditor.Checked <> Boolean(UserFileName.ReadInteger('Miscellaneous', 'GamesColumnsEditor', 1)) then
       Result:= True;

    // from buttons toolbar
    // Games Filter Drop-down button
    if GamesFilterSelector.Checked <> Boolean(UserFileName.ReadInteger('Games', 'GamesFilterSelector', 1)) then
       Result:= True;

    // from main menu "Games"
    // Menu "Custom Game Options" - let user change options for a specific game???
    if CustomGameOptions.Checked <> Boolean(UserFileName.ReadInteger('Games', 'CustomGameOptions', 1)) then
       Result:= True;

    // Menu "Custom Initialization Options (MAME Only)"
    if CustomInitializationOptions.Checked <> Boolean(UserFileName.ReadInteger('Games', 'CustomInitializationOptions', 1)) then
       Result:= True;

    // Menu "Custom Command Line"
    if CustomCommandLine.Checked <> Boolean(UserFileName.ReadInteger('Games', 'CustomCommandLine', 1)) then
       Result:= True;

    // Menu "Game Description" - let user change game's description ?
    if CustomGameDescription.Checked <> Boolean(UserFileName.ReadInteger('Games', 'CustomGameDescription', 1)) then
       Result:= True;

    // Menu "Game Category"
    if CustomGameCategory.Checked <> Boolean(UserFileName.ReadInteger('Games', 'CustomGameCategory', 1)) then
       Result:= True;

    // Menu "Games Audit" - set user audit games???
    if GamesAudit.Checked <> Boolean(UserFileName.ReadInteger('Games', 'GamesAudit', 1)) then
       Result:= True;

    // Menu "Play a Recorded Game"
    if PlayRecordedGame.Checked <> Boolean(UserFileName.ReadInteger('Games', 'PlayRecordedGame', 1)) then
       Result:= True;

    // Menu "Record Game"
    if RecordGame.Checked <> Boolean(UserFileName.ReadInteger('Games', 'RecordGame', 1)) then
       Result:= True;

    // Menu "Games Data" - let user view MAMEINFO.DAT / HISTORY.DAT / FAQs and Automatic MAMEINFO.DAT ???
    if GamesInformation.Checked <> Boolean(UserFileName.ReadInteger('Games', 'GamesInformation', 1)) then
       Result:= True;
    if GamesHistory.Checked <> Boolean(UserFileName.ReadInteger('Games', 'GamesHistory', 1)) then
       Result:= True;
    if GamesDriverInformation.Checked <> Boolean(UserFileName.ReadInteger('Games', 'GamesDriverInformation', 1)) then
       Result:= True;
    if GamesFAQ.Checked <> Boolean(UserFileName.ReadInteger('Games', 'GamesFAQ', 1)) then
       Result:= True;
    if AutomaticGameInformation.Checked <> Boolean(UserFileName.ReadInteger('Games', 'AutomaticGameInformation', 1)) then
       Result:= True;

    // Menu "Delete gamename.zip" - let user delete .ZIP files???
    if DeleteGameZIP.Checked <> Boolean(UserFileName.ReadInteger('Games', 'DeleteGameZIP', 1)) then
       Result:= True;

    // Menu "Add to Favorites" - let user add games to favorite lists???
    if AddGamesToFavorites.Checked <> Boolean(UserFileName.ReadInteger('Games', 'AddToFavorites', 1)) then
       Result:= True;

    // Menu "Delete From Favorites" - let user delete games from favorite lists???
    if DeleteGamesFromFavorites.Checked <> Boolean(UserFileName.ReadInteger('Games', 'DeleteFromFavorites', 1)) then
       Result:= True;

    // Menu "Add Game to Parental Lock" - let user add a game to blocked lists ?
    if AddGameParentalLock.Checked <> Boolean(UserFileName.ReadInteger('Games', 'AddGameParentalLock', 1)) then
       Result:= True;

    // Menu "Real Icons" - let user switch between default and real icons???
    if RealIcons.Checked <> Boolean(UserFileName.ReadInteger('Games', 'RealIcons', 1)) then
       Result:= True;

    // Menu "Refresh Games" - let user refresh games???
    if RefreshGames.Checked <> Boolean(UserFileName.ReadInteger('Games', 'RefreshGames', 1)) then
       Result:= True;

    // Menu "Custom Games Manager" - let user add/edit/delete games from custom games list???
    if CustomGamesManager.Checked <> Boolean(UserFileName.ReadInteger('Games', 'CustomGamesManager', 1)) then
       Result:= True;

    // from main menu "Pictures"
    // Menu "Show Pictures" - let user toggle between pictures and no pictures???
    if ShowPictures.Checked <> Boolean(UserFileName.ReadInteger('Pictures', 'ShowPictures', 1)) then
       Result:= True;

    // Picture Types - let user change between picture types???
    if ShowTitleSnapshots.Checked <> Boolean(UserFileName.ReadInteger('Pictures', 'ShowTitleSnapshots', 1)) then
       Result:= True;
    if ShowInGameSnapshots.Checked <> Boolean(UserFileName.ReadInteger('Pictures', 'ShowInGameSnapshots', 1)) then
       Result:= True;
    if ShowMarquees.Checked <> Boolean(UserFileName.ReadInteger('Pictures', 'ShowMarquees', 1)) then
       Result:= True;
    if ShowFlyers.Checked <> Boolean(UserFileName.ReadInteger('Pictures', 'ShowFlyers', 1)) then
       Result:= True;
    if ShowCabinets.Checked <> Boolean(UserFileName.ReadInteger('Pictures', 'ShowCabinets', 1)) then
       Result:= True;
    if ShowControlPanels.Checked <> Boolean(UserFileName.ReadInteger('Pictures', 'ShowControlPanels', 1)) then
       Result:= True;
    if ShowControlPanelLayouts.Checked <> Boolean(UserFileName.ReadInteger('Pictures', 'ShowControlPanelLayouts', 1)) then
       Result:= True;

    // Menu "Delete Current Picture"
    if DeletePictures.Checked <> Boolean(UserFileName.ReadInteger('Pictures', 'DeletePictures', 1)) then
       Result:= True;

    // Menu "Rename Current Picture"
    if RenamePictures.Checked <> Boolean(UserFileName.ReadInteger('Pictures', 'RenamePictures', 1)) then
       Result:= True;

    // Menu "Delete All Extra Pictures"
    if DeleteExtraPictures.Checked <> Boolean(UserFileName.ReadInteger('Pictures', 'DeleteExtraPictures', 1)) then
       Result:= True;

    // Menu "Create Pictures List"
    if CreatePicturesList.Checked <> Boolean(UserFileName.ReadInteger('Pictures', 'CreatePicturesList', 1)) then
       Result:= True;

    // from main menu "Advanced Tools"
    // Menu "Parental Lock" and "Parental Lock Manager"
    if ParentalLock.Checked <> Boolean(UserFileName.ReadInteger('Miscellaneous', 'ParentalLock', 1)) then
       Result:= True;

    // Menu "User Profile" and "User Profile Manager"
    if UserProfile.Checked <> Boolean(UserFileName.ReadInteger('Miscellaneous', 'UserProfile', 1)) then
       Result:= True;

    // Menu "Full Screen"
    if FullScreen.Checked <> Boolean(UserFileName.ReadInteger('Miscellaneous', 'FullScreen', 1)) then
       Result:= True;

    if FullScreenExit.Checked <> Boolean(UserFileName.ReadInteger('Miscellaneous', 'FullScreenExit', 1)) then
       Result:= True;

    if KeysMappingSelector.Checked <> Boolean(UserFileName.ReadInteger('Miscellaneous', 'KeysMappingSelector', 1)) then
       Result:= True;
  end;
  FreeAndNil(UserFileName);
end;

// Language translation procedures

function TFormMain.GetStatusMessage(MsgCode: String): String;
var
  LngFile: TMemIniFile;
  FileFound: Boolean;
begin
  FileFound:= False;
  if FrontendLanguage <> 'Default' then
     begin
        if FileExists(FrontendPath+'resources\language\'+FrontendLanguage+'.lng') then
           begin
             FileFound:= True;
             LngFile:= TMemIniFile.Create(FrontendPath+'resources\language\'+FrontendLanguage+'.lng');
           end;
     end;

  if MsgCode = 'ReadIniFile' then
     begin
       case FileFound of
         True : Result:= LngFile.ReadString('Status Messages', MsgCode, 'Reading initialization file. Please, wait a moment...');
         False: Result:= 'Reading initialization file. Please, wait a moment...';
       end;
     end
  else
  if MsgCode = 'UpdateIniFile' then
     begin
       case FileFound of
         True : Result:= LngFile.ReadString('Status Messages', MsgCode, 'Updating initialization file. Please, wait a moment...');
         False: Result:= 'Updating initialization file. Please, wait a moment...';
       end;
     end
  else
  // Games Class strings
  if MsgCode = 'SaveClassicMR' then
     begin
       case FileFound of
         True : Result:= Format(LngFile.ReadString('Status Messages', 'SaveGamesMsg', 'Saving %s to file. Please, wait a moment...'), [GetGameTypeDescription('ClassicMR', '')]);
         False: Result:= Format('Saving %s to file. Please, wait a moment...', [GetGameTypeDescription('ClassicMR', '')]);
       end;
     end
  else
  if MsgCode = 'SaveClassicMV' then
     begin
       case FileFound of
         True : Result:= Format(LngFile.ReadString('Status Messages', 'SaveGamesMsg', 'Saving %s to file. Please, wait a moment...'), [GetGameTypeDescription('ClassicMV', '')]);
         False: Result:= Format('Saving %s to file. Please, wait a moment...', [GetGameTypeDescription('ClassicMV', '')]);
       end;
     end
  else
  if MsgCode = 'SaveClassicCR' then
     begin
       case FileFound of
         True : Result:= Format(LngFile.ReadString('Status Messages', 'SaveGamesMsg', 'Saving %s to file. Please, wait a moment...'), [GetGameTypeDescription('ClassicCR', '')]);
         False: Result:= Format('Saving %s to file. Please, wait a moment...', [GetGameTypeDescription('ClassicCR', '')]);
       end;
     end
  else
  if MsgCode = 'SaveClassicCV' then
     begin
       case FileFound of
         True : Result:= Format(LngFile.ReadString('Status Messages', 'SaveGamesMsg', 'Saving %s to file. Please, wait a moment...'), [GetGameTypeDescription('ClassicCV', '')]);
         False: Result:= Format('Saving %s to file. Please, wait a moment...', [GetGameTypeDescription('ClassicCV', '')]);
       end;
     end
  else
  if MsgCode = 'SaveNeoGeoM' then
     begin
       case FileFound of
         True : Result:= Format(LngFile.ReadString('Status Messages', 'SaveGamesMsg', 'Saving %s to file. Please, wait a moment...'), [GetGameTypeDescription('NeoGeoM', '')]);
         False: Result:= Format('Saving %s to file. Please, wait a moment...', [GetGameTypeDescription('NeoGeoM', '')]);
       end;
     end
  else
  if MsgCode = 'SaveNeoGeoC' then
     begin
       case FileFound of
         True : Result:= Format(LngFile.ReadString('Status Messages', 'SaveGamesMsg', 'Saving %s to file. Please, wait a moment...'), [GetGameTypeDescription('NeoGeoC', '')]);
         False: Result:= Format('Saving %s to file. Please, wait a moment...', [GetGameTypeDescription('NeoGeoC', '')]);
       end;
     end
  else
  if MsgCode = 'SaveClassicBios' then
     begin
       case FileFound of
         True : Result:= Format(LngFile.ReadString('Status Messages', 'SaveGamesMsg', 'Saving %s to file. Please, wait a moment...'), [GetGameTypeDescription('Bios', 'ClassicBios')]);
         False: Result:= Format('Saving %s to file. Please, wait a moment...', [GetGameTypeDescription('Bios', 'ClassicBios')]);
       end;
     end
  else
  if MsgCode = 'SaveNeoGeoBios' then
     begin
       case FileFound of
         True : Result:= Format(LngFile.ReadString('Status Messages', 'SaveGamesMsg', 'Saving %s to file. Please, wait a moment...'), [GetGameTypeDescription('Bios', 'NeoGeoBios')]);
         False: Result:= Format('Saving %s to file. Please, wait a moment...', [GetGameTypeDescription('Bios', 'NeoGeoBios')]);
       end;
     end
  else
  if MsgCode = 'SaveUnClassicMR' then
     begin
       case FileFound of
         True : Result:= Format(LngFile.ReadString('Status Messages', 'SaveGamesMsg', 'Saving %s to file. Please, wait a moment...'), [GetGameTypeDescription('UnClassicMR', '')]);
         False: Result:= Format('Saving %s to file. Please, wait a moment...', [GetGameTypeDescription('UnClassicMR', '')]);
       end;
     end
  else
  if MsgCode = 'SaveUnClassicMV' then
     begin
       case FileFound of
         True : Result:= Format(LngFile.ReadString('Status Messages', 'SaveGamesMsg', 'Saving %s to file. Please, wait a moment...'), [GetGameTypeDescription('UnClassicMV', '')]);
         False: Result:= Format('Saving %s to file. Please, wait a moment...', [GetGameTypeDescription('UnClassicMV', '')]);
       end;
     end
  else
  if MsgCode = 'SaveUnClassicCR' then
     begin
       case FileFound of
         True : Result:= Format(LngFile.ReadString('Status Messages', 'SaveGamesMsg', 'Saving %s to file. Please, wait a moment...'), [GetGameTypeDescription('UnClassicCR', '')]);
         False: Result:= Format('Saving %s to file. Please, wait a moment...', [GetGameTypeDescription('UnClassicCR', '')]);
       end;
     end
  else
  if MsgCode = 'SaveUnClassicCV' then
     begin
       case FileFound of
         True : Result:= Format(LngFile.ReadString('Status Messages', 'SaveGamesMsg', 'Saving %s to file. Please, wait a moment...'), [GetGameTypeDescription('UnClassicCV', '')]);
         False: Result:= Format('Saving %s to file. Please, wait a moment...', [GetGameTypeDescription('UnClassicCV', '')]);
       end;
     end
  else
  if MsgCode = 'SaveUnNeoGeoM' then
     begin
       case FileFound of
         True : Result:= Format(LngFile.ReadString('Status Messages', 'SaveGamesMsg', 'Saving %s to file. Please, wait a moment...'), [GetGameTypeDescription('UnNeoGeoM', '')]);
         False: Result:= Format('Saving %s to file. Please, wait a moment...', [GetGameTypeDescription('UnNeoGeoM', '')]);
       end;
     end
  else
  if MsgCode = 'SaveUnNeoGeoC' then
     begin
       case FileFound of
         True : Result:= Format(LngFile.ReadString('Status Messages', 'SaveGamesMsg', 'Saving %s to file. Please, wait a moment...'), [GetGameTypeDescription('UnNeoGeoC', '')]);
         False: Result:= Format('Saving %s to file. Please, wait a moment...', [GetGameTypeDescription('UnNeoGeoC', '')]);
       end;
     end
  else
  if MsgCode = 'SaveUnClassicBios' then
     begin
       case FileFound of
         True : Result:= Format(LngFile.ReadString('Status Messages', 'SaveGamesMsg', 'Saving %s to file. Please, wait a moment...'), [GetGameTypeDescription('UnBios', 'UnClassicBios')]);
         False: Result:= Format('Saving %s to file. Please, wait a moment...', [GetGameTypeDescription('UnBios', 'UnClassicBios')]);
       end;
     end
  else
  if MsgCode = 'SaveUnNeoGeoBios' then
     begin
       case FileFound of
         True : Result:= Format(LngFile.ReadString('Status Messages', 'SaveGamesMsg', 'Saving %s to file. Please, wait a moment...'), [GetGameTypeDescription('UnBios', 'UnNeoGeoBios')]);
         False: Result:= Format('Saving %s to file. Please, wait a moment...', [GetGameTypeDescription('UnBios', 'UnNeoGeoBios')]);
       end;
     end
  else
  if MsgCode = '' then
     begin
       case FileFound of
         True : Result:= LngFile.ReadString('Status Messages', MsgCode, '');
         False: Result:= '';
       end;
     end;

  if FileFound then
     FreeAndNil(LngFile);
end;

function TFormMain.GetLanguageText(const Section, Option, TextString: String): String;
var
  LngFile: TMemIniFile;
begin
  Result:= TextString;
  if FrontendLanguage <> 'Default' then
     begin
        if FileExists(FrontendPath+'resources\language\'+FrontendLanguage+'.lng') then
           begin
             LngFile:= TMemIniFile.Create(FrontendPath+'resources\language\'+FrontendLanguage+'.lng');
             Result:= LngFile.ReadString(Section, Option, TextString);
             FreeAndNil(LngFile);
           end;
     end
end;

procedure TFormMain.SetMessagesLanguage;
var
  LanguageFile: TMemIniFile;
begin
  if not FileExists(FrontendPath+'resources\language\'+FrontendLanguage+'.lng') then
     Exit;

  LanguageFile:= TMemIniFile.Create(FrontendPath+'resources\language\'+FrontendLanguage+'.lng');

  with FormMessages do
  begin
    // Buttons
    ButtonYes.Caption:= LanguageFile.ReadString('Resource', 'ButtonYes', '&Yes');

    if ButtonNoOk.Caption = '&No' then
       ButtonNoOk.Caption:= LanguageFile.ReadString('Resource', 'ButtonNo', '&No')
    else
    if ButtonNoOk.Caption = '&Ok' then
       ButtonNoOk.Caption:= LanguageFile.ReadString('Resource', 'ButtonOk', '&Ok');

    ButtonCancel.Caption:= LanguageFile.ReadString('Resource', 'ButtonCancel', 'C&ancel');
  end;
  FreeAndNil(LanguageFile);
end;

procedure TFormMain.SetMainLanguage;
var
  LanguageFile: TMemIniFile;
  CurrentItemIndex: Integer;
begin
  if not FileExists(FrontendPath+'resources\language\'+FrontendLanguage+'.lng') then
     Exit;

  LanguageFile:= TMemIniFile.Create(FrontendPath+'resources\language\'+FrontendLanguage+'.lng');

  //Main Menu
  MenuFile.Caption:= LanguageFile.ReadString('Main', 'MenuFile', '&File');
  MenuView.Caption:= LanguageFile.ReadString('Main', 'MenuView', '&View');
  MenuEmulator.Caption:= LanguageFile.ReadString('Main', 'MenuEmulator', '&Emulator');
  MenuGames.Caption:= LanguageFile.ReadString('Main', 'MenuGames', '&Games');
  MenuPictures.Caption:= LanguageFile.ReadString('Main', 'MenuPictures', '&Pictures');
  MenuAdvancedTools.Caption:= LanguageFile.ReadString('Main', 'MenuAdvancedTools', '&Advanced Tools');
  MenuHelp.Caption:= LanguageFile.ReadString('Main', 'MenuHelp', '&Help');

  MenuButFile.Caption:= MenuFile.Caption;
  MenuButView.Caption:= MenuView.Caption;
  MenuButEmulator.Caption:= MenuEmulator.Caption;
  MenuButGames.Caption:= MenuGames.Caption;
  MenuButPictures.Caption:= MenuPictures.Caption;
  MenuButAdvancedTools.Caption:= MenuAdvancedTools.Caption;
  MenuButHelp.Caption:= MenuHelp.Caption;

  // Menu "File"
  MenuCreateGamesList.Caption:= LanguageFile.ReadString('Main', 'MenuCreateGamesList', '&Create Games List (Default)');
  MenuCreateNewGamesList.Caption:= LanguageFile.ReadString('Main', 'MenuCreateNewDatabase', 'Create a &New Games List');
  MenuSwitchGamesList.Caption:= LanguageFile.ReadString('Main', 'MenuSwitchGamesList', '&Switch Games List');
  MenuExportGamesListTextFile.Caption:= LanguageFile.ReadString('Main', 'MenuExportGamesListTextFile', 'Export Games List to Text File');
  MenuPreferences.Caption:= LanguageFile.ReadString('Main', 'MenuPreferences', '&Preferences');
  MenuExit.Caption:= LanguageFile.ReadString('Main', 'MenuExit', 'E&xit');

  // Menu "View"
  MenuModeViewBigIcons.Caption:= LanguageFile.ReadString('Main', 'MenuModeViewBigIcons', 'Show &Big Icons');
  MenuModeViewSmallIcons.Caption:= LanguageFile.ReadString('Main', 'MenuModeViewSmallIcons', 'Show &Small Icons');
  MenuModeViewList.Caption:= LanguageFile.ReadString('Main', 'MenuModeViewList', 'Show &List');
  MenuModeViewDetails.Caption:= LanguageFile.ReadString('Main', 'MenuModeViewDetails', 'Show &Details');
  MenuShowFavorite.Caption:= LanguageFile.ReadString('Main', 'MenuShowFavorite', 'Show &Favorite User Games');
  MenuShowHideFavoriteUsersManager.Caption:= LanguageFile.ReadString('Main', 'MenuShowHideFavoriteUsersManager', 'Show / Hide Fa&vorite Users Manager');
  MenuGamesColumnsEditor.Caption:= LanguageFile.ReadString('Main', 'MenuGamesColumnsEditor', 'Games &Columns Editor');
  MenuShowActiveMAMEROMPaths.Caption:= LanguageFile.ReadString('Main', 'MenuShowActiveMAMEROMPaths', 'Show Active M.A.M.E. ROM &Paths');

  // Menu "Emulator"
  MenuEmulatorSetup.Caption:= LanguageFile.ReadString('Main', 'MenuEmulatorSetup', 'E&mulator Setup');
  MenuEmulatorDefaultOptions.Caption:= LanguageFile.ReadString('Main', 'MenuEmulatorDefaultOptions', 'Emulator Default Options');
  MenuSet1stEmulatorDefaultOptions.Caption:= LanguageFile.ReadString('Main', 'MenuSet1stEmulatorDefaultOptions', 'Set 1st Emulator Default Options');
  MenuSet2ndEmulatorDefaultOptions.Caption:= LanguageFile.ReadString('Main', 'MenuSet2ndEmulatorDefaultOptions', 'Set 2nd Emulator Default Options');
  MenuSet3rdEmulatorDefaultOptions.Caption:= LanguageFile.ReadString('Main', 'MenuSet3rdEmulatorDefaultOptions', 'Set 3rd Emulator Default Options');
  MenuSet4thEmulatorDefaultOptions.Caption:= LanguageFile.ReadString('Main', 'MenuSet4thEmulatorDefaultOptions', 'Set 4th Emulator Default Options');
  MenuSet5thEmulatorDefaultOptions.Caption:= LanguageFile.ReadString('Main', 'MenuSet5thEmulatorDefaultOptions', 'Set 5th Emulator Default Options');

  MenuEmulatorDescription.Caption:= LanguageFile.ReadString('Main', 'MenuEmulatorDescription', 'Emulator Description');
  MenuChange1stEmulatorDescription.Caption:= LanguageFile.ReadString('Main', 'MenuChange1stEmulatorDescription', 'Change 1st Emulator Description');
  MenuChange2ndEmulatorDescription.Caption:= LanguageFile.ReadString('Main', 'MenuChange2ndEmulatorDescription', 'Change 2nd Emulator Description');
  MenuChange3rdEmulatorDescription.Caption:= LanguageFile.ReadString('Main', 'MenuChange3rdEmulatorDescription', 'Change 3rd Emulator Description');
  MenuChange4thEmulatorDescription.Caption:= LanguageFile.ReadString('Main', 'MenuChange4thEmulatorDescription', 'Change 4th Emulator Description');
  MenuChange5thEmulatorDescription.Caption:= LanguageFile.ReadString('Main', 'MenuChange5thEmulatorDescription', 'Change 5th Emulator Description');
  MenuGet1stEmulatorDefaultDescription.Caption:= LanguageFile.ReadString('Main', 'MenuGet1stEmulatorDefaultDescription', 'Get 1st Emulator Default Description');
  MenuGet2ndEmulatorDefaultDescription.Caption:= LanguageFile.ReadString('Main', 'MenuGet2ndEmulatorDefaultDescription', 'Get 2nd Emulator Default Description');
  MenuGet3rdEmulatorDefaultDescription.Caption:= LanguageFile.ReadString('Main', 'MenuGet3rdEmulatorDefaultDescription', 'Get 3rd Emulator Default Description');
  MenuGet4thEmulatorDefaultDescription.Caption:= LanguageFile.ReadString('Main', 'MenuGet4thEmulatorDefaultDescription', 'Get 4th Emulator Default Description');
  MenuGet5thEmulatorDefaultDescription.Caption:= LanguageFile.ReadString('Main', 'MenuGet5thEmulatorDefaultDescription', 'Get 5th Emulator Default Description');

  MenuCurrentEmulator.Caption:= LanguageFile.ReadString('Main', 'MenuCurrentEmulator', 'Current Emulator');
  MenuUseExecutable1.Caption:= LanguageFile.ReadString('Main', 'MenuUseExecutable1', 'Use 1st Emulator Executable');
  MenuUseExecutable2.Caption:= LanguageFile.ReadString('Main', 'MenuUseExecutable2', 'Use 2nd Emulator Executable');
  MenuUseExecutable3.Caption:= LanguageFile.ReadString('Main', 'MenuUseExecutable3', 'Use 3rd Emulator Executable');
  MenuUseExecutable4.Caption:= LanguageFile.ReadString('Main', 'MenuUseExecutable4', 'Use 4th Emulator Executable');
  MenuUseExecutable5.Caption:= LanguageFile.ReadString('Main', 'MenuUseExecutable5', 'Use 5th Emulator Executable');

  // Menu "Games"
  MenuPlayGameStandard.Caption:= LanguageFile.ReadString('Main', 'MenuPlayGameStandard', '&Play Game (Standard)');

  MenuCustomGameOptions.Caption:= LanguageFile.ReadString('Main', 'MenuCustomGameOptions', 'Custom Game Options');
  MenuPlayGame.Caption:= LanguageFile.ReadString('Main', 'MenuPlayGame', 'Pl&ay Game');
  MenuSetCustomOptions.Caption:= LanguageFile.ReadString('Main', 'MenuSetCustomOptions', '&Set Custom Options (Selected Game)');
  MenuDeleteCustomOptions.Caption:= LanguageFile.ReadString('Main', 'MenuDeleteCustomOptions', '&Delete Custom Options (Selected Game)');

  MenuCustomInitializationOptions.Caption:= LanguageFile.ReadString('Main', 'MenuCustomInitializationOptions', 'Custom Initialization Options (MAME Only)');
  MenuSetGameDriverCustomOptions.Caption:= LanguageFile.ReadString('Main', 'MenuSetGameDriverCustomOptions', 'Set Game Driver Custom Options (Selected Game)');
  MenuDeleteGameDriverCustomOptions.Caption:= LanguageFile.ReadString('Main', 'MenuDeleteGameDriverCustomOptions', 'Delete Game Driver Custom Options (Selected Game)');
  MenuSetDebugCustomOptions.Caption:= LanguageFile.ReadString('Main', 'MenuSetDebugCustomOptions', 'Set Debug Custom Options');
  MenuDeleteDebugCustomOptions.Caption:= LanguageFile.ReadString('Main', 'MenuDeleteDebugCustomOptions', 'Delete Debug Custom Options');

  MenuCustomCommandLine.Caption:= LanguageFile.ReadString('Main', 'MenuCustomCommandLine', 'Custom Command Line');
  MenuSetCustomCommandLine.Caption:= LanguageFile.ReadString('Main', 'MenuSetCustomCommandLine', 'Set Custom Command Line');
  MenuDeleteCustomCommandLine.Caption:= LanguageFile.ReadString('Main', 'MenuDeleteCustomCommandLine', 'Delete Custom Command Line');
  MenuSetDriverCustomCommandLine.Caption:= LanguageFile.ReadString('Main', 'MenuSetDriverCustomCommandLine', 'Set Driver Custom Command Line');
  MenuDeleteDriverCustomCommandLine.Caption:= LanguageFile.ReadString('Main', 'MenuDeleteDriverCustomCommandLine', 'Delete Driver Custom Command Line');

  MenuGameDescription.Caption:= LanguageFile.ReadString('Main', 'MenuGameDescription', 'Game Description');
  MenuChangeGameDescription.Caption:= LanguageFile.ReadString('Main', 'MenuChangeGameDescription', 'Change Game Description');
  MenuDeleteCustomDescription.Caption:= LanguageFile.ReadString('Main', 'MenuDeleteCustomDescription', 'Delete Custom Description');
  MenuUpdateGamesDescriptions.Caption:= LanguageFile.ReadString('Main', 'MenuUpdateGamesDescriptions', 'Update Games Descriptions');

  MenuGameCategory.Caption:= LanguageFile.ReadString('Main', 'MenuGameCategory', 'Game Category');
  MenuChangeGameCategory.Caption:= LanguageFile.ReadString('Main', 'MenuChangeGameCategory', 'Change Game Category');
  MenuDeleteCustomCategory.Caption:= LanguageFile.ReadString('Main', 'MenuDeleteCustomCategory', 'Delete Custom Category');
  MenuUpdateGamesCategories.Caption:= LanguageFile.ReadString('Main', 'MenuUpdateGamesCategories', 'Update Games Categories');

  MenuGamesAudit.Caption:= LanguageFile.ReadString('Main', 'MenuGamesAudit', 'Games Audit');
  MenuAuditSelectedGame.Caption:= LanguageFile.ReadString('Main', 'MenuAuditSelectedGame', '&Selected Game');
  MenuAuditAvailableGames.Caption:= LanguageFile.ReadString('Main', 'MenuAuditAvailableGames', 'All A&vailable Games');
  MenuAuditAllGames.Caption:= LanguageFile.ReadString('Main', 'MenuAuditAllGames', '&All Games');
  MenuAuditSelectedGameUnneededFiles.Caption:= LanguageFile.ReadString('Main', 'MenuAuditSelectedGameUnneededFiles', 'Selected Game [Unneeded Files]');
  MenuAuditAvailableGamesUnneededFiles.Caption:= LanguageFile.ReadString('Main', 'MenuAuditAvailableGamesUnneededFiles', 'All A&vailable Games [Unneeded Files]');
  MenuAuditAllGamesUnneededFiles.Caption:= LanguageFile.ReadString('Main', 'MenuAuditAllGamesUnneededFiles', '&All Games [Unneeded Files]');

  MenuPlayRecordedGame.Caption:= LanguageFile.ReadString('Main', 'MenuPlayRecordedGame', 'Play a Re&corded Game');
  MenuRecordGame.Caption:= LanguageFile.ReadString('Main', 'MenuRecordGame', '&Record Game');

  MenuGamesData.Caption:= LanguageFile.ReadString('Main', 'MenuGamesData', 'Games Data');
  MenuGameInformation.Caption:= LanguageFile.ReadString('Main', 'MenuGameInformation', 'Game Information (requires "mameinfo.dat")');
  MenuGameHistory.Caption:= LanguageFile.ReadString('Main', 'MenuGameHistory', 'Game History (requires "history.dat")');
  MenuGameDriverInformation.Caption:= LanguageFile.ReadString('Main', 'MenuGameDriverInformation', 'Game Driver Information (requires "mameinfo.dat")');
  MenuAutomaticGameInformation.Caption:= LanguageFile.ReadString('Main', 'MenuAutomaticGameInformation', 'Automatic Game Information And History');
  MenuGameFAQ.Caption:= LanguageFile.ReadString('Main', 'MenuGameFAQ', 'Game F.A.Q. (requires "gamename.faq")');
  MenuShowGameInfo.Caption:= LanguageFile.ReadString('Main', 'MenuShowGameInfo', 'Show Game &Info');

  MenuAddToFavorites.Caption:= LanguageFile.ReadString('Main', 'MenuAddToFavorites', '&Add To Favorites');
  MenuDeleteFromFavorites.Caption:= LanguageFile.ReadString('Main', 'MenuDeleteFromFavorites', '&Delete From Favorites');

  MenuAddGameParentalLock.Caption:= LanguageFile.ReadString('Main', 'MenuAddGameParentalLock', 'Add Game to Parental &Lock');

  MenuRealIconsItems.Caption:= LanguageFile.ReadString('Main', 'MenuRealIconsItems', 'Real Icons');
  MenuRealIcons.Caption:= LanguageFile.ReadString('Main', 'MenuRealIcons', '&Real Icons');
  MenuShowOnlyParentIcon.Caption:= LanguageFile.ReadString('Main', 'MenuShowOnlyParentIcon', 'Show Only &Parent Icon');
  MenuCreateIconsList.Caption:= LanguageFile.ReadString('Main', 'MenuCreateIconsList', '&Create Icons List');
  MenuCheckMissingIcons.Caption:= LanguageFile.ReadString('Main', 'MenuCheckMissingIcons', 'Check For Missing Icons');
  MenuCheckUnneededIcons.Caption:= LanguageFile.ReadString('Main', 'MenuCheckUnneededIcons', 'Check For Unneeded Icons');

  MenuRefreshGames.Caption:= LanguageFile.ReadString('Main', 'MenuRefreshGames', 'Refresh Games');
  MenuRefreshSelectedGame.Caption:= LanguageFile.ReadString('Main', 'MenuRefreshSelectedGame', '&Selected Game');
  MenuRefreshAvailableGames.Caption:= LanguageFile.ReadString('Main', 'MenuRefreshAvailableGames', 'All A&vailable Games');
  MenuRefreshUnavailableGames.Caption:= LanguageFile.ReadString('Main', 'MenuRefreshUnavailableGames', 'All &Unavailable Games');
  MenuRefreshAllGames.Caption:= LanguageFile.ReadString('Main', 'MenuRefreshAllGames', 'A&ll Games');

  MenuGameDescription.Caption:= LanguageFile.ReadString('Main', 'MenuGameDescription', 'Game Description');
  MenuChangeGameDescription.Caption:= LanguageFile.ReadString('Main', 'MenuChangeGameDescription', 'Change Game Description');
  MenuDeleteCustomDescription.Caption:= LanguageFile.ReadString('Main', 'MenuDeleteCustomDescription', 'Delete Custom Description');

  MenuCustomGamesManager.Caption:= LanguageFile.ReadString('Main', 'MenuCustomGamesManager', 'Custom Games &Manager');

  // Menu "Pictures"
  MenuShowPictures.Caption:= LanguageFile.ReadString('Main', 'MenuShowPictures', '&Show Pictures');
  MenuShowTitleSnapshot.Caption:= LanguageFile.ReadString('Main', 'MenuShowTitleSnapshot', 'Show &Title Snapshots');
  MenuShowInGameSnapshot.Caption:= LanguageFile.ReadString('Main', 'MenuShowInGameSnapshot', 'Show &In Game Snapshots');
  MenuShowMarquee.Caption:= LanguageFile.ReadString('Main', 'MenuShowMarquee', 'Show &Marquees');
  MenuShowFlyer.Caption:= LanguageFile.ReadString('Main', 'MenuShowFlyer', 'Show &Flyers');
  MenuShowCabinet.Caption:= LanguageFile.ReadString('Main', 'MenuShowCabinet', 'Show &Cabinets');
  MenuShowControlPanel.Caption:= LanguageFile.ReadString('Main', 'MenuShowControlPanel', 'Show Control &Panels');
  MenuShowControlPanelLayout.Caption:= LanguageFile.ReadString('Main', 'MenuShowControlPanelLayout', 'Show Control Panel La&youts');

  MenuShowFirstPicture.Caption:= LanguageFile.ReadString('Main', 'MenuShowFirstPicture', 'Show Firs&t Picture');
  MenuDeleteCurrentPicture.Caption:= LanguageFile.ReadString('Main', 'MenuDeleteCurrentPicture', '&Delete Current Picture');
  MenuRenameCurrentPicture.Caption:= LanguageFile.ReadString('Main', 'MenuRenameCurrentPicture', '&Rename Current Picture');
  MenuDeleteAllExtraPictures.Caption:= LanguageFile.ReadString('Main', 'MenuDeleteAllExtraPictures', 'Delete All E&xtra Pictures');

  MenuCreatePicturesList.Caption:= LanguageFile.ReadString('Main', 'MenuCreatePicturesList', 'Create Pictures List');

  // Menu "Advanced Tools"
  MenuTotalPlayTime.Caption:= LanguageFile.ReadString('Main', 'MenuTotalPlayTime', 'Total Play &Time');
  MenuSelectGameTotalPlayTime.Caption:= LanguageFile.ReadString('Main', 'MenuSelectGameTotalPlayTime', 'Selected &Game Total Play Time');
  MenuParentalLock.Caption:= LanguageFile.ReadString('Main', 'MenuParentalLock', '&Parental Lock');
  MenuParentalLockManager.Caption:= LanguageFile.ReadString('Main', 'MenuParentalLockManager', 'Parental Lock &Manager');
  MenuUserProfile.Caption:= LanguageFile.ReadString('Main', 'MenuUserProfile', '&User Profile');
  MenuUserProfileEditor.Caption:= LanguageFile.ReadString('Main', 'MenuUserProfileEditor', 'User Profile &Editor');
  MenuKeysAssignment.Caption:= LanguageFile.ReadString('Main', 'MenuKeysAssignment', '&Keys Assignment');
  MenuFullScreen.Caption:= LanguageFile.ReadString('Main', 'MenuFullScreen', '&Full Screen');
  MenuRestoreMainScreenDefaultScreenSizePosition.Caption:= LanguageFile.ReadString('Main', 'MenuRestoreMainScreenDefaultScreenSizePosition', 'Restore Main Screen Default Scr&een Size/Position');

  // Menu "Help"
  MenuShowGamesIconsLegend.Caption:= LanguageFile.ReadString('Main', 'MenuShowGamesIconsLegend', 'Show Icons &Legend');
  MenuViewTextFiles.Caption:= LanguageFile.ReadString('Main', 'MenuViewTextFiles', 'View &Text Files');
  MenuVisitEmuLoaderHomepage.Caption:= LanguageFile.ReadString('Main', 'MenuVisitEmuLoaderHomepage', 'Visit Emu Loader &Homepage');
  SendEMailEmuLoader.Caption:= LanguageFile.ReadString('Main', 'SendEMailEmuLoader', 'Send an E-&Mail to Emu Loader');
  MenuVisitHotRodHomepage.Caption:= LanguageFile.ReadString('Main', 'MenuVisitHotRodHomepage', 'Visit Hot Rod Homepage');
  MenuVisitSlikStikHomepage.Caption:= LanguageFile.ReadString('Main', 'MenuVisitSlikStikHomepage', 'Visit SlikStik Homepage');
  MenuVisitXArcadeHomepage.Caption:= LanguageFile.ReadString('Main', 'MenuVisitXArcadeHomepage', 'Visit X-Arcade Homepage');

  MenuMAMEKeysInfo.Caption:= LanguageFile.ReadString('Main', 'MenuMAMEKeysInfo', '&MAME Keys Info');
  MenuAbout.Caption:= LanguageFile.ReadString('Main', 'MenuAbout', '&About...');

  // Popup Games
  PopupPlayGameStandard.Caption:= MenuPlayGameStandard.Caption;

  PopupPlayGame.Caption:= MenuPlayGame.Caption;
  PopupCustomGameOptions.Caption:= MenuCustomGameOptions.Caption;
  PopupSetCustomOptions.Caption:= MenuSetCustomOptions.Caption;
  PopupDeleteCustomOptions.Caption:= MenuDeleteCustomOptions.Caption;

  PopupCustomInitializationOptions.Caption:= MenuCustomInitializationOptions.Caption;
  PopupSetGameDriverCustomOptions.Caption:= MenuSetGameDriverCustomOptions.Caption;
  PopupDeleteGameDriverCustomOptions.Caption:= MenuDeleteGameDriverCustomOptions.Caption;
  PopupSetDebugCustomOptions.Caption:= MenuSetDebugCustomOptions.Caption;
  PopupDeleteDebugCustomOptions.Caption:= MenuDeleteDebugCustomOptions.Caption;

  PopupCustomCommandLine.Caption:= MenuCustomCommandLine.Caption;
  PopupSetCustomCommandLine.Caption:= MenuSetCustomCommandLine.Caption;
  PopupDeleteCustomCommandLine.Caption:= MenuDeleteCustomCommandLine.Caption;
  PopupSetDriverCustomCommandLine.Caption:= MenuSetDriverCustomCommandLine.Caption;
  PopupDeleteDriverCustomCommandLine.Caption:= MenuDeleteDriverCustomCommandLine.Caption;

  PopupGameDescription.Caption:= MenuGameDescription.Caption;
  PopupChangeGameDescription.Caption:= MenuChangeGameDescription.Caption;
  PopupDeleteCustomDescription.Caption:= MenuDeleteCustomDescription.Caption;

  PopupGameCategory.Caption:= MenuGameCategory.Caption;
  PopupChangeGameCategory.Caption:= MenuChangeGameCategory.Caption;
  PopupDeleteCustomCategory.Caption:= MenuDeleteCustomCategory.Caption;

  PopupGamesAudit.Caption:= MenuGamesAudit.Caption;
  PopupAuditSelectedGame.Caption:= MenuAuditSelectedGame.Caption;
  PopupAuditAvailableGames.Caption:= MenuAuditAvailableGames.Caption;
  PopupAuditAllGames.Caption:= MenuAuditAllGames.Caption;
  PopupAuditSelectedGameUnneededFiles.Caption:= MenuAuditSelectedGameUnneededFiles.Caption;
  PopupAuditAvailableGamesUnneededFiles.Caption:= MenuAuditAvailableGamesUnneededFiles.Caption;
  PopupAuditAllGamesUnneededFiles.Caption:= MenuAuditAllGamesUnneededFiles.Caption;

  PopupPlayRecordedGame.Caption:= MenuPlayRecordedGame.Caption;
  PopupRecordGame.Caption:= MenuRecordGame.Caption;

  PopupAddToFavorites.Caption:= MenuAddToFavorites.Caption;
  PopupDeleteFromFavorites.Caption:= MenuDeleteFromFavorites.Caption;

  PopupAddGameParentalLock.Caption:= MenuAddGameParentalLock.Caption;

  PopupView.Caption:= MenuView.Caption;
  PopupShowFavorite.Caption:= MenuShowFavorite.Caption;
  PopupShowHideFavoriteUsersManager.Caption:= MenuShowHideFavoriteUsersManager.Caption;
  PopupGamesColumnsEditor.Caption:= MenuGamesColumnsEditor.Caption;

  PopupGamesData.Caption:= MenuGamesData.Caption;
  PopupGameInformation.Caption:= MenuGameInformation.Caption;
  PopupGameHistory.Caption:= MenuGameHistory.Caption;
  PopupGameDriverInformation.Caption:= MenuGameDriverInformation.Caption;
  PopupGameFAQ.Caption:= MenuGameFAQ.Caption;
  PopupAutomaticGameInformation.Caption:= MenuAutomaticGameInformation.Caption;

  PopupShowGameInfo.Caption:= MenuShowGameInfo.Caption;

  PopupFullScreen.Caption:= MenuFullScreen.Caption;
  PopupExit.Caption:= MenuExit.Caption;

  PopupRealIconsItems.Caption:= MenuRealIconsItems.Caption;
  PopupRealIcons.Caption:= MenuRealIcons.Caption;
  PopupShowOnlyParentIcon.Caption:= MenuShowOnlyParentIcon.Caption;
  PopupCreateIconsList.Caption:= MenuCreateIconsList.Caption;
  PopupCheckMissingIcons.Caption:= MenuCheckMissingIcons.Caption;
  PopupCheckUnneededIcons.Caption:= MenuCheckUnneededIcons.Caption;

  PopupRefreshGames.Caption:= MenuRefreshGames.Caption;
  PopupRefreshSelectedGame.Caption:= MenuRefreshSelectedGame.Caption;
  PopupRefreshAvailableGames.Caption:= MenuRefreshAvailableGames.Caption;
  PopupRefreshUnavailableGames.Caption:= MenuRefreshUnavailableGames.Caption;
  PopupRefreshAllGames.Caption:= MenuRefreshAllGames.Caption;

  PopupGameDescription.Caption:= MenuGameDescription.Caption;
  PopupChangeGameDescription.Caption:= MenuChangeGameDescription.Caption;
  PopupDeleteCustomDescription.Caption:= MenuDeleteCustomDescription.Caption;

  PopupCustomGamesManager.Caption:= MenuCustomGamesManager.Caption;

  // Popup Pictures
  PopupShowPictures.Caption:= MenuShowPictures.Caption;
  PopupShowTitleSnapshot.Caption:= MenuShowTitleSnapshot.Caption;
  PopupShowInGameSnapshot.Caption:= MenuShowInGameSnapshot.Caption;
  PopupShowMarquee.Caption:= MenuShowMarquee.Caption;
  PopupShowFlyer.Caption:= MenuShowFlyer.Caption;
  PopupShowCabinet.Caption:= MenuShowCabinet.Caption;
  PopupShowControlPanel.Caption:= MenuShowControlPanel.Caption;
  PopupShowControlPanelLayout.Caption:= MenuShowControlPanelLayout.Caption;

  PopupShowFirstPicture.Caption:= MenuShowFirstPicture.Caption;

  PopupRenameCurrentPicture.Caption:= MenuRenameCurrentPicture.Caption;
  PopupDeleteCurrentPicture.Caption:= MenuDeleteCurrentPicture.Caption;
  PopupDeleteAllExtraPictures.Caption:= MenuDeleteAllExtraPictures.Caption;

  PopupCreatePicturesList.Caption:= MenuCreatePicturesList.Caption;

  // Games List Column Descriptions
  List.Column[0].Caption:=  LanguageFile.ReadString('Main', 'ListColumnDescription', 'Description');
  List.Column[GetColumnIndex(1)].Caption:=  LanguageFile.ReadString('Main', 'ListColumnYear', 'Year');
  List.Column[GetColumnIndex(2)].Caption:=  LanguageFile.ReadString('Main', 'ListColumnManufacturer', 'Manufacturer');
  List.Column[GetColumnIndex(3)].Caption:=  LanguageFile.ReadString('Main', 'ListColumnSound', 'Sound');
  List.Column[GetColumnIndex(4)].Caption:=  LanguageFile.ReadString('Main', 'ListColumnFrequency', 'Frequency');
  List.Column[GetColumnIndex(5)].Caption:=  LanguageFile.ReadString('Main', 'ListColumnSamples', 'Samples');
  List.Column[GetColumnIndex(6)].Caption:=  LanguageFile.ReadString('Main', 'ListColumnControlType', 'Control Type');
  List.Column[GetColumnIndex(7)].Caption:=  LanguageFile.ReadString('Main', 'ListColumnVideo', 'Video');
  List.Column[GetColumnIndex(8)].Caption:=  LanguageFile.ReadString('Main', 'ListColumnOrientation', 'Orientation');
  List.Column[GetColumnIndex(9)].Caption:=  LanguageFile.ReadString('Main', 'ListColumnResolution', 'Resolution');
  List.Column[GetColumnIndex(10)].Caption:= LanguageFile.ReadString('Main', 'ListColumnDriverStatus', 'Driver Status');
  List.Column[GetColumnIndex(11)].Caption:= LanguageFile.ReadString('Main', 'ListColumnSoundStatus', 'Sound Status');
  List.Column[GetColumnIndex(12)].Caption:= LanguageFile.ReadString('Main', 'ListColumnColorStatus', 'Color Status');
  List.Column[GetColumnIndex(13)].Caption:= LanguageFile.ReadString('Main', 'ListColumnMerged', 'Merged');
  List.Column[GetColumnIndex(14)].Caption:= LanguageFile.ReadString('Main', 'ListColumnName', 'Name');
  List.Column[GetColumnIndex(15)].Caption:= LanguageFile.ReadString('Main', 'ListColumnCloneOf', 'Clone of');
  List.Column[GetColumnIndex(16)].Caption:= LanguageFile.ReadString('Main', 'ListColumnCategory', 'Category');
  List.Column[GetColumnIndex(17)].Caption:= LanguageFile.ReadString('Main', 'ListColumnVersionAdded', 'Version Added');
  List.Column[GetColumnIndex(18)].Caption:= LanguageFile.ReadString('Main', 'ListColumnDriver', 'Driver');

  // Status Bar Buttons
  StatusBarShownGames.Caption:= Format(LanguageFile.ReadString('Main', 'StatusBarShownGames', '%u Games'), [Length(GamesList)]); // not needed
  StatusBarRandomGame.Caption:= LanguageFile.ReadString('Main', 'StatusBarRandomGame', 'Random Game');
  StatusBarFavoriteUser.Caption:= Format(LanguageFile.ReadString('Main', 'StatusBarFavoriteUser', 'Favorite User: %s'), [FavoriteUser]); // not needed
  StatusBarUserProfile.Caption:= Format(LanguageFile.ReadString('Main', 'StatusBarUserProfile', 'User Profile: %s'), [ActiveUserProfileDescription]); // not needed

  // Status Bar Buttons Hints
  StatusBarGameName.Hint:= LanguageFile.ReadString('Main', 'StatusBarGameNameHint', 'Short game name');
  StatusBarGameSize.Hint:=LanguageFile.ReadString('Main', 'StatusBarGameSizeHint', 'Size of game');
  StatusBarShownGames.Hint:= LanguageFile.ReadString('Main', 'StatusBarShownGamesHint', 'Total games shown');
  StatusBarRandomGame.Hint:= LanguageFile.ReadString('Main', 'StatusBarRandomGameHint', 'Select a random game to play');
  StatusBarFavoriteUser.Hint:= LanguageFile.ReadString('Main', 'StatusBarFavoriteUserHint', 'Show favorite users manager');
  StatusBarUserProfile.Hint:= LanguageFile.ReadString('Main', 'StatusBarUserProfileHint', 'Active user profile name');

  // Toolbar Buttons
  // Toolbar Games Filter
  CurrentItemIndex:= ButtonGameType.Tag;
  PopupAllGames.Caption:= LanguageFile.ReadString('Main', 'GameTypeAllGames', 'All Games');
  PopupClassic.Caption:= LanguageFile.ReadString('Main', 'GameTypeClassic', 'Classic');
  PopupNeoGeo.Caption:= LanguageFile.ReadString('Main', 'GameTypeNeoGeo', 'Neo Geo');
  PopupOriginal.Caption:= LanguageFile.ReadString('Main', 'GameTypeOriginal', 'Original');
  PopupClone.Caption:= LanguageFile.ReadString('Main', 'GameTypeClone', 'Clone');
  PopupRaster.Caption:= LanguageFile.ReadString('Main', 'GameTypeRaster', 'Raster');
  PopupVector.Caption:= LanguageFile.ReadString('Main', 'GameTypeVector', 'Vector');
  PopupCustomGames.Caption:= LanguageFile.ReadString('Main', 'GameTypeCustomGames', 'Custom Games');
  ButtonGameType.Hint:= LanguageFile.ReadString('Main', 'ButtonGameTypeHint', 'Select games filter');

  ButtonGameFilters.Hint:= ButtonGameType.Hint;
  ButtonShowAllGames.Caption:= LanguageFile.ReadString('Main', 'ButtonShowAllGames', 'Show All Games');
  ButtonShowAvailableGames.Caption:= LanguageFile.ReadString('Main', 'ButtonShowAvailableGames', 'Show Available Games Only');
  ButtonShowUnavailableGames.Hint:= LanguageFile.ReadString('Main', 'ButtonShowUnavailableGames', 'Show Unavailable Games Only');

  // Toolbar Buttons Hints

  ButtonModeView.Hint:= LanguageFile.ReadString('Main', 'ButtonModeViewHint', 'Games mode view');
  ButtonModeViewBigIcons.Caption:= MenuModeViewBigIcons.Caption;
  ButtonModeViewSmallIcons.Caption:= MenuModeViewSmallIcons.Caption;
  ButtonModeViewList.Caption:= MenuModeViewList.Caption;
  ButtonModeViewDetails.Caption:= MenuModeViewDetails.Caption;

  ButtonShowFavorite.Hint:= LanguageFile.ReadString('Main', 'ButtonShowFavoriteHint', 'Show Favorite User''s Games');

  ButtonPicturesModeView.Hint:= LanguageFile.ReadString('Main', 'ButtonPicturesModeViewHint', 'Pictures mode view');
  ButtonShowTitleSnapshot.Caption:= MenuShowTitleSnapshot.Caption;
  ButtonShowInGameSnapshot.Caption:= MenuShowInGameSnapshot.Caption;
  ButtonShowMarquee.Caption:= MenuShowMarquee.Caption;
  ButtonShowFlyer.Caption:= MenuShowFlyer.Caption;
  ButtonShowCabinet.Caption:= MenuShowCabinet.Caption;
  ButtonShowControlPanel.Caption:= MenuShowControlPanel.Caption;
  ButtonShowControlPanelLayout.Caption:= MenuShowControlPanelLayout.Caption;

  ButtonRefreshAllGames.Hint:= LanguageFile.ReadString('Main', 'ButtonRefreshAllGamesHint', 'Refresh all games');

  ButtonPlayRecordedGame.Hint:= LanguageFile.ReadString('Main', 'ButtonPlayRecordedGameHint', 'Playback a recorded game');
  ButtonRecordGame.Hint:= LanguageFile.ReadString('Main', 'ButtonRecordGameHint' ,'Record game');
  INPFilename.Hint:= LanguageFile.ReadString('Main', 'INPFilenameHint', 'INP Filename');

  ButtonExecutablesMode.Hint:= LanguageFile.ReadString('Main', 'ButtonExecutablesModeHint', 'Select executable to run games');
  ButtonUseExecutable1.Caption:= MenuUseExecutable1.Caption;
  ButtonUseExecutable2.Caption:= MenuUseExecutable2.Caption;
  ButtonUseExecutable3.Caption:= MenuUseExecutable3.Caption;
  ButtonUseExecutable4.Caption:= MenuUseExecutable4.Caption;
  ButtonUseExecutable5.Caption:= MenuUseExecutable5.Caption;

  ButtonGamesDataMode.Hint:= LanguageFile.ReadString('Main', 'ButtonGamesDataModeHint', 'Show various information for selected game');
  ButtonGameInformation.Caption:= MenuGameInformation.Caption;
  ButtonGameHistory.Caption:= MenuGameHistory.Caption;
  ButtonGameDriverInformation.Caption:= MenuGameDriverInformation.Caption;
  ButtonGameFAQ.Caption:= MenuGameFAQ.Caption;
  ButtonAutomaticGameInformation.Caption:= MenuAutomaticGameInformation.Caption;

  ButtonGameHistory.Hint:= LanguageFile.ReadString('Main', 'ButtonGameHistoryHint', 'Show the history for selected game');
  ButtonGameInformation.Hint:= LanguageFile.ReadString('Main', 'ButtonGameInformationHint', 'Show the information for selected game');
  ButtonGameDriverInformation.Hint:= LanguageFile.ReadString('Main', 'ButtonGameDriverInformationHint', 'Show the driver information for selected game');
  ButtonGameFAQ.Hint:= LanguageFile.ReadString('Main', 'ButtonGameFAQHint', 'Show the faq for selected game');

  // Picture Bottom Components
  ButViewPreviousPicture.Hint:= LanguageFile.ReadString('Main', 'ButViewPreviousPictureHint', 'View previous picture');
  ButViewNextPicture.Hint:= LanguageFile.ReadString('Main', 'ButViewNextPictureHint', 'View next picture');
  LabelPictureNumberValue:= LanguageFile.ReadString('Main', 'LabelPictureNumberValue', '%.3d of %.3d pictures');

  GamesListSaveDialog.Title:= LanguageFile.ReadString('Messages', 'GamesListSaveDialogTitle', 'Save Games List To a File');
  if ToolBarsPanel.Tag = 1 then
     begin
       UpdateStatusBarGame;
       ToolBarsPanel.Tag:= 0;
     end;

  FreeAndNil(LanguageFile);
end;

procedure TFormMain.SetEmulatorsSetupLanguage;
var
  LanguageFile: TMemIniFile;
  TranslationText: String;
begin
  if not FileExists(FrontendPath+'resources\language\'+FrontendLanguage+'.lng') then
     Exit;

  LanguageFile:= TMemIniFile.Create(FrontendPath+'resources\language\'+FrontendLanguage+'.lng');

  with FormEmulatorsSetup do
  begin
    // Screen Title
    LabelTopDescription.Caption:= LanguageFile.ReadString('Emulators Setup', 'Title', 'Emulators Setup');

    // Executable files
    ExecutableFileButtonSelect.Hint:= LanguageFile.ReadString('Emulators Setup', 'ExecutableFileButtonHint', 'Click here to select a file (MAME and DOS MAME only)');
    ExecutableFile2ButtonSelect.Hint:= ExecutableFileButtonSelect.Hint;
    ExecutableFile3ButtonSelect.Hint:= ExecutableFileButtonSelect.Hint;
    ExecutableFile4ButtonSelect.Hint:= ExecutableFileButtonSelect.Hint;
    ExecutableFile5ButtonSelect.Hint:= ExecutableFileButtonSelect.Hint;

    // Emulator Option buttons
    ButtonSet1stEmulatorOptions.Caption:= LanguageFile.ReadString('Emulators Setup', 'ButtonSet1stEmulatorOptionsCaption' ,'Set &1st Emulator Options');
    ButtonSet2ndEmulatorOptions.Caption:= LanguageFile.ReadString('Emulators Setup', 'ButtonSet2ndEmulatorOptionsCaption' ,'Set &2nd Emulator Options');
    ButtonSet3rdEmulatorOptions.Caption:= LanguageFile.ReadString('Emulators Setup', 'ButtonSet3rdEmulatorOptionsCaption' ,'Set &3rd Emulator Options');
    ButtonSet4thEmulatorOptions.Caption:= LanguageFile.ReadString('Emulators Setup', 'ButtonSet4thEmulatorOptionsCaption' ,'Set &4th Emulator Options');
    ButtonSet5thEmulatorOptions.Caption:= LanguageFile.ReadString('Emulators Setup', 'ButtonSet5thEmulatorOptionsCaption' ,'Set &5th Emulator Options');

    TranslationText:= LanguageFile.ReadString('Emulators Setup', 'ButtonSetEmulatorOptionsHint', 'Configure default data on "mame.ini" or "mame.cfg" for executable %u');

    ButtonSet1stEmulatorOptions.Hint:= Format(TranslationText, [1]);
    ButtonSet2ndEmulatorOptions.Hint:= Format(TranslationText, [2]);
    ButtonSet3rdEmulatorOptions.Hint:= Format(TranslationText, [3]);
    ButtonSet4thEmulatorOptions.Hint:= Format(TranslationText, [4]);
    ButtonSet5thEmulatorOptions.Hint:= Format(TranslationText, [5]);

    // Default Database Builder options
    LabelDefaultGamesListBuilder.Caption:= LanguageFile.ReadString('Emulators Setup', 'LabelDefaultGamesListBuilderCaption', 'Default Games List Builder');
    DefaultGamesListBuilder.Hint:= LanguageFile.ReadString('Emulators Setup', 'LabelDefaultGamesListBuildExecutableCaption', 'Emulator %u');

    // Buttons
    ButtonClearCommandLine1.Caption:= LanguageFile.ReadString('Resource', 'ButtonClear', 'Cl&ear');
    ButtonClearCommandLine2.Caption:= ButtonClearCommandLine1.Caption;
    ButtonClearCommandLine3.Caption:= ButtonClearCommandLine1.Caption;
    ButtonClearCommandLine4.Caption:= ButtonClearCommandLine1.Caption;
    ButtonClearCommandLine5.Caption:= ButtonClearCommandLine1.Caption;

    ButtonClearCommandLine1.Hint:= LanguageFile.ReadString('Emulators Setup', 'ButtonClearCommandLine1Hint', 'Clear the 1st emulator executable edit box');
    ButtonClearCommandLine2.Hint:= LanguageFile.ReadString('Emulators Setup', 'ButtonClearCommandLine2Hint', 'Clear the 2nd emulator executable edit box');
    ButtonClearCommandLine3.Hint:= LanguageFile.ReadString('Emulators Setup', 'ButtonClearCommandLine3Hint', 'Clear the 3rd emulator executable edit box');
    ButtonClearCommandLine4.Hint:= LanguageFile.ReadString('Emulators Setup', 'ButtonClearCommandLine4Hint', 'Clear the 4th emulator executable edit box');
    ButtonClearCommandLine5.Hint:= LanguageFile.ReadString('Emulators Setup', 'ButtonClearCommandLine5Hint', 'Clear the 5th emulator executable edit box');

    ButtonOk.Caption:= LanguageFile.ReadString('Resource', 'ButtonOk', '&Ok');
    ButtonOk.Hint:= LanguageFile.ReadString('Resource', 'ButtonOkHint', 'Close and update settings');

    ButtonCancel.Caption:= LanguageFile.ReadString('Resource', 'ButtonCancel', 'C&ancel');
    ButtonCancel.Hint:= LanguageFile.ReadString('Resource', 'ButtonCancelHint', 'Close without updating');
  end;
  FreeAndNil(LanguageFile);
end;

procedure TFormMain.SetAuditGamesLanguage;
var
  LanguageFile: TMemIniFile;
begin
  if not FileExists(FrontendPath+'resources\language\'+FrontendLanguage+'.lng') then
     Exit;

  LanguageFile:= TMemIniFile.Create(FrontendPath+'resources\language\'+FrontendLanguage+'.lng');

  with FormAudit do
  begin
    // Screen Title
    Caption:= LanguageFile.ReadString('Audit Games', 'Title', 'Audit Games');

    // Audited Labels
    LabelStatusFormat:= LanguageFile.ReadString('Audit Games', 'LabelStatusFormat', '%.6d of %.6d');

    LabelAudited.Caption:= LanguageFile.ReadString('Audit Games', 'LabelAudited', 'Audited');
    LabelGood.Caption:= LanguageFile.ReadString('Audit Games', 'LabelGood', 'Good');
    LabelMissingSets.Caption:= LanguageFile.ReadString('Audit Games', 'LabelMissingSets', 'Missing Sets');
    LabelErrors.Caption:= LanguageFile.ReadString('Audit Games', 'LabelErrors', 'Errors');

    LabelMergedMasterGame.Caption:= LanguageFile.ReadString('Audit Games', 'LabelMergedMasterGame', 'Merged in %s.zip');

    SaveAuditDialog.Title:= LanguageFile.ReadString('Audit Games', 'SaveAuditDialogTitle', 'Save Audit Results to a File');

    AuditROMsTree.Hint:= LanguageFile.ReadString('Audit Games', 'AuditROMsTreeHint', 'Right-click mouse for popup menu');

    // Popup Menu
    PopupAuditGameAgain.Caption:= LanguageFile.ReadString('Audit Games', 'PopupAuditGameAgain', 'Audit &Game Again...');
    PopupSaveResultstoHTMLFile.Caption:= LanguageFile.ReadString('Audit Games', 'PopupSaveResultstoHTMLFile', 'Save to HTML File');
    PopupSaveBadGamestoHTMLFile.Caption:= LanguageFile.ReadString('Audit Games', 'PopupSaveBadGamestoHTMLFile', 'Save Bad Games to HTML File');
    PopupShowOnlyBadGames.Caption:= LanguageFile.ReadString('Audit Games', 'PopupShowOnlyBadGames', 'Show Only Bad Games');
    PopupShowGamesDetails.Caption:= LanguageFile.ReadString('Audit Games', 'PopupShowGamesDetails', 'Show Games Details');
    PopupHideGamesDetails.Caption:= LanguageFile.ReadString('Audit Games', 'PopupHideGamesDetails', 'Hide Games Details');

    // buttons
    ButtonClose.Caption:= LanguageFile.ReadString('Resource', 'ButtonClose', '&Close');
    ButtonClose.Hint:= LanguageFile.ReadString('Resource', 'ButtonCloseHint', 'Close this window');

    ButtonCancel.Caption:= LanguageFile.ReadString('Resource', 'ButtonCancel', 'C&ancel');
    ButtonCancel.Hint:= LanguageFile.ReadString('Audit Games', 'ButtonCancelHint', 'Cancel the auditing');
  end;

  FreeAndNil(LanguageFile);
end;

procedure TFormMain.SetParentalLockLogoutLanguage;
var
  LanguageFile: TMemIniFile;
begin
  if not FileExists(FrontendPath+'resources\language\'+FrontendLanguage+'.lng') then
     Exit;

  LanguageFile:= TMemIniFile.Create(FrontendPath+'resources\language\'+FrontendLanguage+'.lng');

  with FormParentalLockPasswordLogout do
  begin
    LabelParentalLockLogout.Caption:= LanguageFile.ReadString('Login Logout', 'LabelParentalLockLogout', 'Parental Lock Logout');
    LabelEnterPassword.Caption:= LanguageFile.ReadString('Login Logout', 'LabelEnterPassword', 'Enter Password');
    LabelConfirmPassword.Caption:= LanguageFile.ReadString('Login Logout', 'LabelConfirmPassword', 'Confirm Password');

    // Buttons
    ButtonOk.Caption:= LanguageFile.ReadString('Resource', 'ButtonOk', '&Ok');
    ButtonOk.Hint:= LanguageFile.ReadString('Resource', 'ButtonOkHint', 'Close and update settings');

    ButtonCancel.Caption:= LanguageFile.ReadString('Resource', 'ButtonCancel', 'C&ancel');
    ButtonCancel.Hint:= LanguageFile.ReadString('Resource', 'ButtonCancelHint', 'Close without updating');
  end;
  FreeAndNil(LanguageFile);
end;

procedure TFormMain.SetParentalLockLanguage;
var
  LanguageFile: TMemIniFile;
begin
  if not FileExists(FrontendPath+'resources\language\'+FrontendLanguage+'.lng') then
     Exit;

  LanguageFile:= TMemIniFile.Create(FrontendPath+'resources\language\'+FrontendLanguage+'.lng');

  with FormParentalLockManager do
  begin
    // Screen Title
    Caption:= LanguageFile.ReadString('Parental Lock', 'Title', 'Parental Lock');

    // Tab Sheet's titles
    TabSheetSearchGames.Caption:= LanguageFile.ReadString('Parental Lock', 'TabSheetSearchGamesCaption', 'Search Games');
    TabSheetLockedGamesList.Caption:= LanguageFile.ReadString('Parental Lock', 'TabSheetLockedGamesListCaption', 'Locked Games List');

    // Keyword options
    LabelSearchKeywordsList.Caption:= LanguageFile.ReadString('Parental Lock', 'LabelSearchKeywordsList', 'Search Keywords List');
    LabelEnterKeyword.Caption:= LanguageFile.ReadString('Parental Lock', 'LabelEnterKeyword', 'Enter Keyword');

    ButtonAddKeyword.Caption:= LanguageFile.ReadString('Parental Lock', 'ButtonAddKeyword', 'A&dd');
    ButtonAddKeyword.Hint:= LanguageFile.ReadString('Parental Lock', 'ButtonAddKeywordHint', 'Add the keyword to the search criteria');

    ButtonBeginSearch.Caption:= LanguageFile.ReadString('Parental Lock', 'ButtonBeginSearch', 'Begin &Search');
    ButtonBeginSearch.Hint:= LanguageFile.ReadString('Parental Lock', 'ButtonBeginSearchHint', 'Start searching games based on keywords list (game and category description only)');

    ButtonDeleteSelectedKeywords.Caption:= LanguageFile.ReadString('Parental Lock', 'ButtonDeleteSelectedKeywords', 'Delete Selected');
    ButtonDeleteSelectedKeywords.Hint:= LanguageFile.ReadString('Parental Lock', 'ButtonDeleteSelectedKeywordsHint', 'Delete selected keywords from the list (can be more than one)');

    // Games Found options
    LabelGamesFound.Caption:= LanguageFile.ReadString('Parental Lock', 'LabelGamesFound', 'Games Found');

    ButtonDeleteSelectedGamesFound.Caption:= LanguageFile.ReadString('Parental Lock', 'ButtonDeleteSelectedGamesFound', 'Delete Selected');
    ButtonDeleteSelectedGamesFound.Hint:= LanguageFile.ReadString('Parental Lock', 'ButtonDeleteSelectedGamesFoundHint', 'Delete selected games from the list (can be more than one)');

    ButtonAddGames.Caption:= LanguageFile.ReadString('Parental Lock', 'ButtonAddGames', 'Add &Games To List');
    ButtonAddGames.Hint:= LanguageFile.ReadString('Parental Lock', 'ButtonAddGamesHint', 'Add found games to the list of locked games');

    // Locked Games options
    ButtonDeleteSelectedLockedGames.Caption:= LanguageFile.ReadString('Parental Lock', 'ButtonDeleteSelectedLockedGames', 'Delete Selected');
    ButtonDeleteSelectedLockedGames.Hint:= LanguageFile.ReadString('Parental Lock', 'ButtonDeleteSelectedLockedGamesHint', 'Delete selected locked games from the list (can be more than one)');

    // Games Found Columns
    GamesFoundList.Column[0].Caption:= LanguageFile.ReadString('Main', 'ListColumnDescription', 'Description');
    GamesFoundList.Column[1].Caption:= LanguageFile.ReadString('Main', 'ListColumnName', 'Name');
    GamesFoundList.Column[2].Caption:= LanguageFile.ReadString('Main', 'ListColumnCloneOf', 'Clone of');
    GamesFoundList.Column[3].Caption:= LanguageFile.ReadString('Main', 'ListColumnCategory', 'Category');

    // Locked Games Columns
    BlockedList.Column[0].Caption:= GamesFoundList.Column[0].Caption;
    BlockedList.Column[1].Caption:= GamesFoundList.Column[1].Caption;
    BlockedList.Column[2].Caption:= GamesFoundList.Column[2].Caption;
    BlockedList.Column[3].Caption:= GamesFoundList.Column[3].Caption;

    // Buttons
    ButtonReadLockGamesDAT.Caption:= Format(LanguageFile.ReadString('Resource', 'ButtonReadIni', '&Read "%s"'), ['BlockedGames.dat']);
    ButtonReadLockGamesDAT.Hint:= Format(LanguageFile.ReadString('Resource', 'ButtonReadIniHint', 'Read all data from file "%s"') ,['BlockedGames.dat']);

    ButtonPassword.Caption:= LanguageFile.ReadString('Resource', 'ButtonPassword', '&Password');
    ButtonPassword.Hint:= LanguageFile.ReadString('Resource', 'ButtonPasswordHint', 'Define/change password');

    ButtonOk.Caption:= LanguageFile.ReadString('Resource', 'ButtonOk', '&Ok');
    ButtonOk.Hint:= LanguageFile.ReadString('Resource', 'ButtonOkHint', 'Close and update settings');

    ButtonCancel.Caption:= LanguageFile.ReadString('Resource', 'ButtonCancel', 'C&ancel');
    ButtonCancel.Hint:= LanguageFile.ReadString('Resource', 'ButtonCancelHint', 'Close without updating');
  end;
  FreeAndNil(LanguageFile);
end;

procedure TFormMain.SetUserProfileLoginLanguage;
var
  LanguageFile: TMemIniFile;
begin
  if not FileExists(FrontendPath+'resources\language\'+FrontendLanguage+'.lng') then
     Exit;

  LanguageFile:= TMemIniFile.Create(FrontendPath+'resources\language\'+FrontendLanguage+'.lng');

  with FormUserProfileUserLogin do
  begin
    LabelSelectUserProfile.Caption:= LanguageFile.ReadString('Login Logout', 'LabelSelectUserProfile', 'Select User Profile');
    LabelEnterPassword.Caption:= LanguageFile.ReadString('Login Logout', 'LabelEnterPassword', 'Enter Password');
    LabelConfirmPassword.Caption:= LanguageFile.ReadString('Login Logout', 'LabelConfirmPassword', 'Confirm Password');
    
    // Buttons
    ButtonOk.Caption:= LanguageFile.ReadString('Resource', 'ButtonOk', '&Ok');
    ButtonOk.Hint:= LanguageFile.ReadString('Resource', 'ButtonOkHint', 'Close and update settings');

    ButtonCancel.Caption:= LanguageFile.ReadString('Resource', 'ButtonCancel', 'C&ancel');
    ButtonCancel.Hint:= LanguageFile.ReadString('Resource', 'ButtonCancelHint', 'Close without updating');
  end;
  FreeAndNil(LanguageFile);
end;

procedure TFormMain.SetUserProfileLanguage;
var
  LanguageFile: TMemIniFile;
begin
  if not FileExists(FrontendPath+'resources\language\'+FrontendLanguage+'.lng') then
     Exit;

  LanguageFile:= TMemIniFile.Create(FrontendPath+'resources\language\'+FrontendLanguage+'.lng');

  with FormUserProfileEditor do
  begin
    // Screen Title
    LabelCaption.Caption:= LanguageFile.ReadString('User Profile', 'Title', 'User Profile Editor');

    // Tab Sheet's titles
    TabSheetProfileMainData.Caption:= LanguageFile.ReadString('User Profile', 'TabSheetProfileMainDataCaption', 'Profile Main Data');
    TabSheetMiscellaneous.Caption:= LanguageFile.ReadString('User Profile', 'TabSheetMiscellaneousCaption', 'Miscellaneous');
    TabSheetPreviewPictures.Caption:= LanguageFile.ReadString('User Profile', 'TabSheetPreviewPicturesCaption', 'Preview Pictures');
    TabSheetGames.Caption:= LanguageFile.ReadString('User Profile', 'TabSheetGamesCaption', 'Games');

    // Labels & Options

    // Profile Main Data tab
    LabelSelectUserProfile.Caption:= LanguageFile.ReadString('User Profile', 'LabelSelectUserProfile', 'Select User Profile');
    SelectUserProfile.Hint:= LanguageFile.ReadString('User Profile', 'SelectUserProfileHint', 'Select an user profile (only when user profile is deactivated)');

    LabelProfileDescription.Caption:= LanguageFile.ReadString('User Profile', 'LabelProfileDescription', 'Profile Description');
    ProfileDescription.Hint:= LanguageFile.ReadString('User Profile', 'ProfileDescriptionHint', 'Enter a new description to change selected profile description');

    // Miscellaneous tab
    CreateGamesList.Caption:= LanguageFile.ReadString('User Profile', 'LabelCreateGamesList', 'Create GamesList');
    EmulatorsSetup.Caption:= LanguageFile.ReadString('User Profile', 'LabelEmulatorsSetup', 'Emulators Setup');
    EmulatorsDescriptions.Caption:= LanguageFile.ReadString('User Profile', 'LabelEmulatorsDescriptions', 'Emulators Descriptions');
    SelectExecutable1.Caption:= Format(LanguageFile.ReadString('User Profile', 'LabelSelectExecutable', 'Select Executable %s'), ['1']);
    SelectExecutable2.Caption:= Format(LanguageFile.ReadString('User Profile', 'LabelSelectExecutable', 'Select Executable %s'), ['2']);
    SelectExecutable3.Caption:= Format(LanguageFile.ReadString('User Profile', 'LabelSelectExecutable', 'Select Executable %s'), ['3']);
    SelectExecutable4.Caption:= Format(LanguageFile.ReadString('User Profile', 'LabelSelectExecutable', 'Select Executable %s'), ['4']);
    SelectExecutable5.Caption:= Format(LanguageFile.ReadString('User Profile', 'LabelSelectExecutable', 'Select Executable %s'), ['5']);
    EmulatorsDefaultOptions.Caption:= LanguageFile.ReadString('User Profile', 'LabelEmulatorsDefaultOptions', 'Emulators Default Options');
    FrontendPreferences.Caption:= LanguageFile.ReadString('User Profile', 'LabelFrontendPreferences', 'Frontend Preferences');
    FavoriteUsersManager.Caption:= LanguageFile.ReadString('User Profile', 'LabelFavoriteUsersManager', 'Favorite Users Manager');
    FavoriteGames.Caption:= LanguageFile.ReadString('User Profile', 'LabelFavoriteGames', 'Favorite Games');
    GamesColumnsEditor.Caption:= LanguageFile.ReadString('User Profile', 'LabelGamesColumnsEditor', 'Games Columns Editor');
    ParentalLock.Caption:= LanguageFile.ReadString('User Profile', 'LabelParentalLock', 'Parental Lock');
    UserProfile.Caption:= LanguageFile.ReadString('User Profile', 'LabelUserProfile', 'User Profile');
    FullScreen.Caption:= LanguageFile.ReadString('User Profile', 'LabelFullScreen', 'Full Screen');
    KeysMappingSelector.Caption:= LanguageFile.ReadString('User Profile', 'LabelKeysMappingSelector', 'Keys Mapping Selector');

    CreateGamesList.Hint:= LanguageFile.ReadString('User Profile', 'LabelCreateGamesListHint', 'Create MAME games list (.dat)');
    EmulatorsSetup.Hint:= LanguageFile.ReadString('User Profile', 'LabelEmulatorsSetupHint', 'Change MAME executables and default options');
    EmulatorsDescriptions.Hint:= LanguageFile.ReadString('User Profile', 'LabelEmulatorsDescriptionsHint', 'Change emulators descriptions');
    SelectExecutable1.Hint:= LanguageFile.ReadString('User Profile', 'LabelSelectExecutableHint', 'Change between available MAME executables');
    SelectExecutable2.Hint:= SelectExecutable1.Hint;
    SelectExecutable3.Hint:= SelectExecutable1.Hint;
    SelectExecutable4.Hint:= SelectExecutable1.Hint;
    SelectExecutable5.Hint:= SelectExecutable1.Hint;
    EmulatorsDefaultOptions.Hint:= LanguageFile.ReadString('User Profile', 'LabelEmulatorsDefaultOptionsHint', 'Change MAME default options');
    FrontendPreferences.Hint:= LanguageFile.ReadString('User Profile', 'LabelFrontendPreferencesHint', 'Access to "Preferences" screen');
    FavoriteUsersManager.Hint:= LanguageFile.ReadString('User Profile', 'LabelFavoriteUsersManagerHint', 'Access to favorite users manager');
    FavoriteGames.Hint:= LanguageFile.ReadString('User Profile', 'LabelFavoriteGamesHint', 'Switch to favorites games list');
    GamesColumnsEditor.Hint:= LanguageFile.ReadString('User Profile', 'LabelGamesColumnsEditorHint', 'Access to games columns editor');
    ParentalLock.Hint:= LanguageFile.ReadString('User Profile', 'LabelParentalLockHint', 'Access to parental lock');
    UserProfile.Hint:= LanguageFile.ReadString('User Profile', 'LabelUserProfileHint', 'Access to users profiles');
    FullScreen.Hint:= LanguageFile.ReadString('User Profile', 'LabelFullScreenHint', 'Toggle frontend''s main screen between window/full screen');
    KeysMappingSelector.Hint:= LanguageFile.ReadString('User Profile', 'LabelKeysMappingSelectorHint', 'Enable / disable the keys mapping button in the toolbar');

    // Games tab
    GamesFilterSelector.Caption:= LanguageFile.ReadString('User Profile', 'LabelGamesFilterSelector', 'Games Filter Selector');
    GamesListShowBigIcons.Caption:= LanguageFile.ReadString('User Profile', 'LabelGamesListShowBigIcons', 'Show Big Icons');
    GamesListShowSmallIcons.Caption:= LanguageFile.ReadString('User Profile', 'LabelGamesListShowSmallIcons', 'Show Small Icons');
    GamesListShowList.Caption:= LanguageFile.ReadString('User Profile', 'LabelGamesListShowList', 'Show List');
    GamesListShowDetails.Caption:= LanguageFile.ReadString('User Profile', 'LabelGamesListShowDetails', 'Show Details');
    CustomGameOptions.Caption:= LanguageFile.ReadString('User Profile', 'LabelCustomGameOptions', 'Custom Game Options');
    CustomInitializationOptions.Caption:= LanguageFile.ReadString('User Profile', 'LabelCustomInitializationOptions', 'Custom Initialization Options');
    CustomCommandLine.Caption:= LanguageFile.ReadString('User Profile', 'LabelCustomCommandLine', 'Custom Command Line');
    CustomGameDescription.Caption:= LanguageFile.ReadString('User Profile', 'LabelCustomGameDescription', 'Custom Game Description');
    CustomGameCategory.Caption:= LanguageFile.ReadString('User Profile', 'LabelCustomGameCategory', 'Custom Category');

    GamesAudit.Caption:= LanguageFile.ReadString('User Profile', 'LabelGamesAudit', 'Games Audit');
    PlayRecordedGame.Caption:= LanguageFile.ReadString('User Profile', 'LabelPlayRecordedGame', 'Play Recorded Game');
    RecordGame.Caption:= LanguageFile.ReadString('User Profile', 'LabelRecordGame', 'Record Game');

    GamesInformation.Caption:= LanguageFile.ReadString('User Profile', 'LabelGamesInformation', 'Games Information');
    GamesHistory.Caption:= LanguageFile.ReadString('User Profile', 'LabelGamesHistory', 'Games History');
    GamesDriverInformation.Caption:= LanguageFile.ReadString('User Profile', 'LabelGamesDriverInformation', 'Games Driver Information');
    GamesFAQ.Caption:= LanguageFile.ReadString('User Profile', 'LabelGamesFAQ', 'Games F.A.Q.');
    AutomaticGameInformation.Caption:= LanguageFile.ReadString('User Profile', 'LabelAutomaticGameInformation', 'Automatic Game Information');

    DeleteGameZIP.Caption:= LanguageFile.ReadString('User Profile', 'LabelDeleteGameZIP', 'Delete Game ZIP');
    AddGamesToFavorites.Caption:= LanguageFile.ReadString('User Profile', 'LabelAddGamesToFavorites', 'Add Games To Favorites');
    DeleteGamesFromFavorites.Caption:= LanguageFile.ReadString('User Profile', 'LabelDeleteGamesFromFavorites', 'Delete Games From Favorites');
    AddGameParentalLock.Caption:= LanguageFile.ReadString('User Profile', 'LabelAddGameParentalLock', 'Add Game to Parental Lock');
    RealIcons.Caption:= LanguageFile.ReadString('User Profile', 'LabelRealIcons', 'Real Icons');
    RefreshGames.Caption:= LanguageFile.ReadString('User Profile', 'LabelRefreshGames', 'Refresh Games');
    CustomGamesManager.Caption:= LanguageFile.ReadString('User Profile', 'LabelCustomGamesManager', 'Custom Games Manager');

    GamesFilterSelector.Hint:= LanguageFile.ReadString('User Profile', 'LabelGamesFilterSelectorHint', 'Change between games filter options (all games, neo geo, classic, etc...)');
    GamesListShowBigIcons.Hint:= LanguageFile.ReadString('User Profile', 'LabelGamesListShowBigIconsHint', 'Access to big icons games mode');
    GamesListShowSmallIcons.Hint:= LanguageFile.ReadString('User Profile', 'LabelGamesListShowSmallIconsHint', 'Access to small icons games mode');
    GamesListShowList.Hint:= LanguageFile.ReadString('User Profile', 'LabelGamesListShowListHint', 'Access to list games mode');
    GamesListShowDetails.Hint:= LanguageFile.ReadString('User Profile', 'LabelGamesListShowDetailsHint', 'Access to details games mode');
    CustomGameOptions.Hint:= LanguageFile.ReadString('User Profile', 'LabelCustomGameOptionsHint', 'Access to customize games options');
    CustomCommandLine.Hint:= LanguageFile.ReadString('User Profile', 'LabelCustomCommandLineHint', 'Access to create games custom command lines');
    CustomGameDescription.Hint:= LanguageFile.ReadString('User Profile', 'LabelCustomGameDescriptionHint', 'Access to customize games descriptions');
    CustomGameCategory.Hint:= LanguageFile.ReadString('User Profile', 'LabelCustomGameCategoryHint', 'Access to create custom categories for games');

    CustomInitializationOptions.Hint:= LanguageFile.ReadString('User Profile', 'LabelCustomInitializationOptionsHint', 'Access to customize game drivers & game resources (bios) options');
    GamesAudit.Hint:= LanguageFile.ReadString('User Profile', 'LabelGamesAuditHint', 'Access to games auditing');
    PlayRecordedGame.Hint:= LanguageFile.ReadString('User Profile', 'LabelPlayRecordedGameHint', 'Play recorded MAME games (.inp)');
    RecordGame.Hint:= LanguageFile.ReadString('User Profile', 'LabelRecordGameHint', 'Record games to .inp files');

    GamesInformation.Hint:= LanguageFile.ReadString('User Profile', 'LabelGamesInformationHint', 'Access to mameinfo.dat information');
    GamesHistory.Hint:= LanguageFile.ReadString('User Profile', 'LabelGamesHistoryHint', 'Access to history.dat information');
    GamesDriverInformation.Hint:= GamesInformation.Hint;
    GamesFAQ.Hint:= LanguageFile.ReadString('User Profile', 'LabelGamesFAQHint', 'Access to games f.a.q information');
    AutomaticGameInformation.Hint:= LanguageFile.ReadString('User Profile', 'LabelAutomaticGameInformationHint', 'Access to the automatic game information');

    DeleteGameZIP.Hint:= LanguageFile.ReadString('User Profile', 'LabelDeleteGameZIPHint', 'Physically delete MAME .zip files');
    AddGamesToFavorites.Hint:= LanguageFile.ReadString('User Profile', 'LabelAddGamesToFavoritesHint', 'Add games to favorites lists');
    DeleteGamesFromFavorites.Hint:= LanguageFile.ReadString('User Profile', 'LabelDeleteGamesFromFavoritesHint', 'Delete games from favorites lists');
    AddGameParentalLock.Hint:= LanguageFile.ReadString('User Profile', 'LabelAddGameParentalLockHint', 'Access to add games to blocked list option');
    RealIcons.Hint:= LanguageFile.ReadString('User Profile', 'LabelRealIconsHint', 'Access to MAMu_ icons');
    RefreshGames.Hint:= LanguageFile.ReadString('User Profile', 'LabelRefreshGamesHint', 'Refresh games list (all refresh types)');
    CustomGamesManager.Hint:= LanguageFile.ReadString('User Profile', 'LabelCustomGamesManagerHint', 'Access to the custom games manager');

    // Preview Pictures tab
    ShowPictures.Caption:= LanguageFile.ReadString('User Profile', 'LabelShowPictures', 'Show Pictures');
    ShowTitleSnapshots.Caption:= LanguageFile.ReadString('User Profile', 'LabelShowTitleSnapshots', 'Show Title Snapshots');
    ShowInGameSnapshots.Caption:= LanguageFile.ReadString('User Profile', 'LabelShowInGameSnapshots', 'Show In Game Snapshots');
    ShowMarquees.Caption:= LanguageFile.ReadString('User Profile', 'LabelShowMarquees', 'Show Marquees');
    ShowFlyers.Caption:= LanguageFile.ReadString('User Profile', 'LabelShowFlyers', 'Show Flyers');
    ShowCabinets.Caption:= LanguageFile.ReadString('User Profile', 'LabelShowCabinets', 'Show Cabinets');
    ShowControlPanels.Caption:= LanguageFile.ReadString('User Profile', 'LabelShowControlPanels', 'Show Control Panels');
    ShowControlPanelLayouts.Caption:= LanguageFile.ReadString('User Profile', 'LabelShowControlPanelLayouts', 'Show Control Panel Layouts');
    DeletePictures.Caption:= LanguageFile.ReadString('User Profile', 'LabelDeletePictures', 'Delete Pictures');
    RenamePictures.Caption:= LanguageFile.ReadString('User Profile', 'LabelRenamePictures', 'Rename Pictures');
    DeleteExtraPictures.Caption:= LanguageFile.ReadString('User Profile', 'LabelDeleteExtraPictures', 'Delete Extra Pictures');
    CreatePicturesList.Caption:= LanguageFile.ReadString('User Profile', 'LabelCreatePicturesList', 'Create Pictures List');

    ShowPictures.Hint:= LanguageFile.ReadString('User Profile', 'LabelShowPicturesHint', 'Access to preview pictures');
    ShowTitleSnapshots.Hint:= LanguageFile.ReadString('User Profile', 'LabelShowTitleSnapshotsHint', 'Access to title snapshots');
    ShowInGameSnapshots.Hint:= LanguageFile.ReadString('User Profile', 'LabelShowInGameSnapshotsHint', 'Access to in-game snapshots');
    ShowMarquees.Hint:= LanguageFile.ReadString('User Profile', 'LabelShowMarqueesHint', 'Access to marquees');
    ShowFlyers.Hint:= LanguageFile.ReadString('User Profile', 'LabelShowFlyersHint', 'Access to flyers');
    ShowCabinets.Hint:= LanguageFile.ReadString('User Profile', 'LabelShowCabinetsHint', 'Access to cabinets');
    ShowControlPanels.Hint:= LanguageFile.ReadString('User Profile', 'LabelShowControlPanelsHint', 'Access to control panels');
    ShowControlPanelLayouts.Hint:= LanguageFile.ReadString('User Profile', 'LabelShowControlPanelLayoutsHint', 'Access to control panel layouts');
    DeletePictures.Hint:= LanguageFile.ReadString('User Profile', 'LabelDeletePicturesHint', 'Delete in-game snapshots');
    RenamePictures.Hint:= LanguageFile.ReadString('User Profile', 'LabelRenamePicturesHint', 'Rename in-game snapshots');
    DeleteExtraPictures.Hint:= LanguageFile.ReadString('User Profile', 'LabelDeleteExtraPicturesHint', 'Delete extra in-game snapshots');
    CreatePicturesList.Hint:= LanguageFile.ReadString('User Profile', 'LabelCreatePicturesListHint', 'Access to create "pictures.dat" file for the virtual list');

    // Buttons
    ButtonOk.Caption:= LanguageFile.ReadString('Resource', 'ButtonOk', '&Ok');
    ButtonOk.Hint:= LanguageFile.ReadString('Resource', 'ButtonOkHint', 'Close and update settings');

    ButtonSave.Caption:= LanguageFile.ReadString('Resource', 'ButtonSave', '&Save');
    ButtonSave.Hint:= LanguageFile.ReadString('User Profile', 'ButtonSaveHint', 'Save changes on current profile');

    ButtonReadUserProfileDAT.Caption:= Format(LanguageFile.ReadString('Resource', 'ButtonReadIni', '&Read "%s"'), [UserProfileFileName+'.dat']);
    ButtonReadUserProfileDAT.Hint:= Format(LanguageFile.ReadString('Resource', 'ButtonReadIniHint', 'Read all data from file "%s"'), [UserProfileFileName+'.dat']);

    ButtonClose.Caption:= LanguageFile.ReadString('Resource', 'ButtonClose', '&Close');
    ButtonClose.Hint:= LanguageFile.ReadString('Resource', 'ButtonCloseHint', 'Close this window');

    ButtonPassword.Caption:= LanguageFile.ReadString('Resource', 'ButtonPassword', '&Password');
    ButtonPassword.Hint:= LanguageFile.ReadString('Resource', 'ButtonPasswordHint', 'Define/change password');

    ButtonCreateNewProfile.Caption:= LanguageFile.ReadString('User Profile', 'ButtonCreateNewProfile', 'Create &New Profile');
    ButtonCancelNewProfile.Caption:= LanguageFile.ReadString('User Profile', 'ButtonCancelNewProfile', 'Canc&el New Profile');
    ButtonDeleteSelectedProfile.Caption:= LanguageFile.ReadString('User Profile', 'ButtonDeleteSelecedProfile', '&Delete Profile');
    ButtonSaveProfile.Caption:= LanguageFile.ReadString('User Profile', 'ButtonSaveProfile', 'S&ave Profile');

    ButtonCreateNewProfile.Hint:= LanguageFile.ReadString('User Profile', 'ButtonCreateNewProfileHint', 'Create new user profile');
    ButtonCancelNewProfile.Hint:= LanguageFile.ReadString('User Profile', 'ButtonCancelNewProfileHint', 'Cancel new user profile (before saving to .dat file)');
    ButtonDeleteSelectedProfile.Hint:= LanguageFile.ReadString('User Profile', 'ButtonDeleteSelecedProfileHint', 'Delete the selected profile (only when users profile is not activated)');
    ButtonSaveProfile.Hint:= LanguageFile.ReadString('User Profile', 'ButtonSaveProfileHint', 'Update existing profile options or save new profile');
  end;
  FreeAndNil(LanguageFile);
end;

procedure TFormMain.SetTextViewerLanguage;
var
  LanguageFile: TMemIniFile;
begin
  if not FileExists(FrontendPath+'resources\language\'+FrontendLanguage+'.lng') then
     Exit;

  LanguageFile:= TMemIniFile.Create(FrontendPath+'resources\language\'+FrontendLanguage+'.lng');

  with FormTextViewer do
  begin
    // Screen Title
    LabelCaption.Caption:= LanguageFile.ReadString('Text Viewer', 'Title', 'Text Files Viewer');

    // Buttons
    ButtonTextFilesFont.Caption:= LanguageFile.ReadString('Resource', 'ButtonFont', 'Select Font');
    ButtonTextFilesFont.Hint:= LanguageFile.ReadString('Text Viewer', 'TextFontHint', 'Select font for the text');
    ButtonTextFilesDefaultFont.Caption:= LanguageFile.ReadString('Resource', 'ButtonDefault', 'Default');
    ButtonTextFilesDefaultFont.Hint:= LanguageFile.ReadString('Text Viewer', 'DefaultFontHint', 'Select default font for the text');
    ButtonClose.Caption:= LanguageFile.ReadString('Resource', 'ButtonClose', '&Close');
    ButtonClose.Hint:= LanguageFile.ReadString('Resource', 'ButtonCloseHint', 'Close this window');
  end;
  FreeAndNil(LanguageFile);
end;

procedure TFormMain.SetDATViewerLanguage;
var
  LanguageFile: TMemIniFile;
begin
  if not FileExists(FrontendPath+'resources\language\'+FrontendLanguage+'.lng') then
     Exit;

  LanguageFile:= TMemIniFile.Create(FrontendPath+'resources\language\'+FrontendLanguage+'.lng');

  with FormDATViewer do
  begin
    // Labels & Options
    WordWrap.Caption:= LanguageFile.ReadString('DAT Viewer', 'LabelWordWrap', 'Word Wrap');
    WordWrap.Hint:= LanguageFile.ReadString('DAT Viewer', 'LabelWordWrapHint', 'Breaks the text to fit on screen');

    // Buttons
    ButtonDATFilesFont.Caption:= LanguageFile.ReadString('Resource', 'ButtonFont', 'Select Font');
    ButtonDATFilesFont.Hint:= LanguageFile.ReadString('DAT Viewer', 'DATFilesFontHint', 'Select font for the text');
    ButtonTextFilesDefaultFont.Caption:= LanguageFile.ReadString('Resource', 'ButtonDefault', 'Default');
    ButtonTextFilesDefaultFont.Hint:= LanguageFile.ReadString('Text Viewer', 'DefaultFontHint', 'Select default font for the text');
    ButtonClose.Caption:= LanguageFile.ReadString('Resource', 'ButtonClose', '&Close');
    ButtonClose.Hint:= LanguageFile.ReadString('Resource', 'ButtonCloseHint', 'Close this window');
  end;
  FreeAndNil(LanguageFile);
end;

procedure TFormMain.SetFavoriteUsersManagerLanguage;
var
  LanguageFile: TMemIniFile;
begin
  if not FileExists(FrontendPath+'resources\language\'+FrontendLanguage+'.lng') then
     Exit;

  LanguageFile:= TMemIniFile.Create(FrontendPath+'resources\language\'+FrontendLanguage+'.lng');

  with FormFavoriteUsersManager do
  begin
    // Screen Title
    LabelCaption.Caption:= LanguageFile.ReadString('Favorite User', 'Title', 'Favorite Users Manager');

    // Labels & Options
    ButtonNewUser.Hint:= LanguageFile.ReadString('Favorite User', 'ButtonNewUserHint', 'Create a new user');
    ButtonEditUser.Hint:= LanguageFile.ReadString('Favorite User', 'ButtonEditUserHint', 'Edit current user');
    ButtonDeleteUser.Hint:= LanguageFile.ReadString('Favorite User', 'ButtonDeleteUserHint', 'Delete current user');
    ButtonUpdateFavoriteGamesList.Hint:= LanguageFile.ReadString('Favorite User', 'ButtonUpdateGamesListHint', 'Update favorite games list');

    TabSheetUsersList.Caption:= LanguageFile.ReadString('Favorite User', 'LabelUsersList', 'Users List');
    LabelSelectUser.Caption:= LanguageFile.ReadString('Favorite User', 'LabelSelectUser', 'Select an User');
    UsersList.Hint:= LanguageFile.ReadString('Favorite User', 'UsersListHint', 'Select an user to activate');

    LabelNewUser.Caption:= LanguageFile.ReadString('Favorite User', 'LabelNewUser', 'New User');
    LabelNewUserMessage.Caption:= LanguageFile.ReadString('Favorite User', 'LabelNewUserMessage', 'Type a name and press Enter (ESC to cancel)');

    // Buttons
    ButtonConfirmNewUser.Caption:= LanguageFile.ReadString('Resource', 'ButtonOk', '&Ok');
    ButtonConfirmNewUser.Hint:= LanguageFile.ReadString('Favorite User', 'ButtonOkNewUserHint', 'Add the new user');

    ButtonCancelNewUser.Caption:= LanguageFile.ReadString('Resource', 'ButtonCancel', 'C&ancel');
    ButtonCancelNewUser.Hint:= LanguageFile.ReadString('Favorite User', 'ButtonCancelNewUserHint', 'Do not add the new user');

    ButtonClose.Caption:= LanguageFile.ReadString('Resource', 'ButtonClose', '&Close');
    ButtonClose.Hint:= LanguageFile.ReadString('Resource', 'ButtonCloseHint', 'Close this window');
  end;
  FreeAndNil(LanguageFile);
end;

procedure TFormMain.SetCustomGamesLanguage;
var
  LanguageFile: TMemIniFile;
begin
  if not FileExists(FrontendPath+'resources\language\'+FrontendLanguage+'.lng') then
     Exit;

  LanguageFile:= TMemIniFile.Create(FrontendPath+'resources\language\'+FrontendLanguage+'.lng');

  with FormCustomGames do
  begin
    // Screen Title
    LabelCaption.Caption:= LanguageFile.ReadString('Custom Games', 'Title', 'Custom Games Manager');

    // Tab Sheet's titles
    TabSheetGameInformation.Caption:= LanguageFile.ReadString('Custom Games', 'TabSheetGameInformation', 'Game Information');
    TabSheetCustomGamesList.Caption:= LanguageFile.ReadString('Custom Games', 'TabSheetCustomGamesList', 'Custom Games List');
    TabSheetTutorial.Caption:= LanguageFile.ReadString('Custom Games', 'TabSheetTutorial', 'Tutorial');

    // Labels & Options
    LabelCommandLineMessage.Caption:= LanguageFile.ReadString('Custom Games', 'LabelCommandLineMessage', 'Custom Emulator Executable');
    CommandLineButtonSelect.Hint:= LanguageFile.ReadString('Custom Games', 'CommandLineButtonHint', 'Click here to select a file');

    LabelCommandLineParameters.Caption:= LanguageFile.ReadString('Custom Games', 'LabelCommandLineParameters', 'Command Line Parameters');
    CommandLineParameters.Hint:= LanguageFile.ReadString('Custom Games', 'CommandLineParametersHint', 'Type the parameters, surrounded by quotes if it has long name');

    LabelDescription.Caption:= LanguageFile.ReadString('Main', 'ListColumnDescription', 'Description');
    LabelYear.Caption:= LanguageFile.ReadString('Main', 'ListColumnYear', 'Year');
    LabelManufacturer.Caption:= LanguageFile.ReadString('Main', 'ListColumnManufacturer', 'Manufacturer');
    LabelSound.Caption:= LanguageFile.ReadString('Custom Games', 'LabelSound', 'Sound');
    LabelFrequency.Caption:= LanguageFile.ReadString('Main', 'ListColumnFrequency', 'Frequency');
    Samples.Caption:= LanguageFile.ReadString('Main', 'ListColumnSamples', 'Samples');
    LabelControlType.Caption:= LanguageFile.ReadString('Main', 'ListColumnControlType', 'Control Type');
    LabelVideo.Caption:= LanguageFile.ReadString('Main', 'ListColumnVideo', 'Video');
    LabelOrientation.Caption:= LanguageFile.ReadString('Main', 'ListColumnOrientation', 'Orientation');
    LabelResolution.Caption:= LanguageFile.ReadString('Main', 'ListColumnResolution', 'Resolution');
    LabelDriverStatus.Caption:= LanguageFile.ReadString('Main', 'ListColumnDriverStatus', 'Driver Status');
    LabelSoundStatus.Caption:= LanguageFile.ReadString('Main', 'ListColumnSoundStatus', 'Sound Status');
    LabelColorStatus.Caption:= LanguageFile.ReadString('Main', 'ListColumnColorStatus', 'Color Status');
    Merged.Caption:= LanguageFile.ReadString('Main', 'ListColumnMerged', 'Merged');
    LabelName.Caption:= LanguageFile.ReadString('Main', 'ListColumnName', 'Name');
    LabelCloneOf.Caption:= LanguageFile.ReadString('Main', 'ListColumnCloneOf', 'Clone of');
    LabelCategory.Caption:= LanguageFile.ReadString('Main', 'ListColumnCategory', 'Category');
    LabelVersionAdded.Caption:= LanguageFile.ReadString('Main', 'ListColumnVersionAdded', 'Version Added');
    LabelDriver.Caption:= LanguageFile.ReadString('Main', 'ListColumnDriver', 'Driver');

    Description.Hint:= LanguageFile.ReadString('Custom Games', 'DescriptionHint', 'Type anything you want');
    Manufacturer.Hint:= LanguageFile.ReadString('Custom Games', 'ManufacturerHint', 'Select a manufacturer');
    ManufacturerCustom.Hint:= LanguageFile.ReadString('Custom Games', 'ManufacturerCustomHint', 'Type a manufacturer description. This only is valid when selecting "Custom" on manufacturer');
    Resolution.Hint:= LanguageFile.ReadString('Custom Games', 'ResolutionHint', 'Select a resolution');
    ResolutionCustom.Hint:= LanguageFile.ReadString('Custom Games', 'ResolutionCustomHint', 'Type a resolution (format 0000x0000). This only is valid when selecting "Custom" on resolution');
    Year.Hint:= LanguageFile.ReadString('Custom Games', 'YearHint', 'Select an year');
    Frequency.Hint:= LanguageFile.ReadString('Custom Games', 'FrequencyHint', 'Select a frequency');
    Video.Hint:= LanguageFile.ReadString('Custom Games', 'VideoHint', 'Select a video type');
    DriverStatus.Hint:= LanguageFile.ReadString('Custom Games', 'DriverStatusHint', 'Select a driver status');
    SoundStatus.Hint:= LanguageFile.ReadString('Custom Games', 'SoundStatusHint', 'Select a sound status');
    ColorStatus.Hint:= LanguageFile.ReadString('Custom Games', 'ColorStatusHint', 'Select a color status');
    ControlType.Hint:= LanguageFile.ReadString('Custom Games', 'ControlTypeHint', 'Select the type of game controls');
    Orientation.Hint:= LanguageFile.ReadString('Custom Games', 'OrientationHint', 'Select an orientation');
    Sound.Hint:= LanguageFile.ReadString('Custom Games', 'SoundHint', 'Select a sound type');
    Name.Hint:= LanguageFile.ReadString('Custom Games', 'NameHint', 'Type the name of the game (8 characters max)');
    CloneOf.Hint:= LanguageFile.ReadString('Custom Games', 'CloneOfHint', 'Type the name of the clone game (8 characters max)');
    CategoriesList.Hint:= LanguageFile.ReadString('Custom Games', 'CategoriesListHint', 'Select a category');
    VersionAdded.Hint:= LanguageFile.ReadString('Custom Games', 'VersionAddedHint', 'Type the version that this game was added (20 characters max)');
    DriverFile.Hint:= LanguageFile.ReadString('Custom Games', 'DriverFileHint', 'Type the driver filename (MS-DOS 8.3 format only)');
    Samples.Hint:= LanguageFile.ReadString('Custom Games', 'LabelSamplesHint', 'The game has samples ?');
    Merged.Hint:= LanguageFile.ReadString('Custom Games', 'LabelMergedHint', 'The game is merged into the master game ?');

    ListCustomGames.Column[0].Caption:= FormMain.List.Column[0].Caption;
    ListCustomGames.Column[1].Caption:= FormMain.List.Column[GetColumnIndex(1)].Caption;
    ListCustomGames.Column[2].Caption:= FormMain.List.Column[GetColumnIndex(2)].Caption;
    ListCustomGames.Column[3].Caption:= FormMain.List.Column[GetColumnIndex(3)].Caption;
    ListCustomGames.Column[4].Caption:= FormMain.List.Column[GetColumnIndex(4)].Caption;
    ListCustomGames.Column[5].Caption:= FormMain.List.Column[GetColumnIndex(5)].Caption;
    ListCustomGames.Column[6].Caption:= FormMain.List.Column[GetColumnIndex(6)].Caption;
    ListCustomGames.Column[7].Caption:= FormMain.List.Column[GetColumnIndex(7)].Caption;
    ListCustomGames.Column[8].Caption:= FormMain.List.Column[GetColumnIndex(8)].Caption;
    ListCustomGames.Column[9].Caption:= FormMain.List.Column[GetColumnIndex(9)].Caption;
    ListCustomGames.Column[10].Caption:= FormMain.List.Column[GetColumnIndex(10)].Caption;
    ListCustomGames.Column[11].Caption:= FormMain.List.Column[GetColumnIndex(11)].Caption;
    ListCustomGames.Column[12].Caption:= FormMain.List.Column[GetColumnIndex(12)].Caption;
    ListCustomGames.Column[13].Caption:= FormMain.List.Column[GetColumnIndex(13)].Caption;
    ListCustomGames.Column[14].Caption:= FormMain.List.Column[GetColumnIndex(14)].Caption;
    ListCustomGames.Column[15].Caption:= FormMain.List.Column[GetColumnIndex(15)].Caption;
    ListCustomGames.Column[16].Caption:= FormMain.List.Column[GetColumnIndex(16)].Caption;
    ListCustomGames.Column[17].Caption:= FormMain.List.Column[GetColumnIndex(17)].Caption;
    ListCustomGames.Column[18].Caption:= FormMain.List.Column[GetColumnIndex(18)].Caption;

    // Buttons
    ButtonClearCommandLine.Caption:= LanguageFile.ReadString('Resource', 'ButtonClear', 'Cl&ear');
    ButtonClearCommandLine.Hint:= LanguageFile.ReadString('Custom Games', 'ButtonClearCommandLineHint', 'Clear the command line and command line parameters');

    ButtonNewGame.Caption:= LanguageFile.ReadString('Custom Games', 'ButtonNewGameCaption', '&New Game');
    ButtonNewGame.Hint:= LanguageFile.ReadString('Custom Games', 'ButtonNewGameHint', 'Clear all fields to add a new game and enter in the add mode');

    ButtonEditGame.Caption:= LanguageFile.ReadString('Custom Games', 'ButtonEditGameCaption', 'Edi&t Game');
    ButtonEditGame.Hint:= LanguageFile.ReadString('Custom Games', 'ButtonEdutGameHint', 'Edit current game');

    ButtonDeleteGame.Caption:= LanguageFile.ReadString('Custom Games', 'ButtonDeleteGameCaption', '&Delete Game');
    ButtonDeleteGame.Hint:= LanguageFile.ReadString('Custom Games', 'ButtonDeleteGameHint', 'Delete current game from the list');

    ButtonOk.Caption:= LanguageFile.ReadString('Resource', 'ButtonOk', '&Ok');
    ButtonOk.Hint:= LanguageFile.ReadString('Custom Games', 'ButtonOkHint', 'Save the new game into the custom list');

    ButtonCancel.Caption:= LanguageFile.ReadString('Resource', 'ButtonCancel', 'C&ancel');
    ButtonCancel.Hint:= LanguageFile.ReadString('Custom Games', 'ButtonCancelHint', 'Cancel any changes');

    ButtonClose.Caption:= LanguageFile.ReadString('Resource', 'ButtonClose', '&Close');
    ButtonClose.Hint:= LanguageFile.ReadString('Resource', 'ButtonCloseHint', 'Close this window');
  end;
  FreeAndNil(LanguageFile);
end;

procedure TFormMain.SetGameColumnsLanguage;
var
  LanguageFile: TMemIniFile;
begin
  if not FileExists(FrontendPath+'resources\language\'+FrontendLanguage+'.lng') then
     Exit;

  LanguageFile:= TMemIniFile.Create(FrontendPath+'resources\language\'+FrontendLanguage+'.lng');

  with FormFilterGameColumns do
  begin
    // Screen Title
    LabelCaption.Caption:= LanguageFile.ReadString('Game Columns', 'Title', 'Game Columns');

    // Buttons
    ButtonUp.Caption:= LanguageFile.ReadString('Resource', 'ButtonUp', '&Up');
    ButtonUp.Hint:= LanguageFile.ReadString('Resource', 'ButtonUpHint', 'Move selected column up');

    ButtonDown.Caption:= LanguageFile.ReadString('Resource', 'ButtonDown', '&Down');
    ButtonDown.Hint:= LanguageFile.ReadString('Resource', 'ButtonDownHint', 'Move selected column down');

    ButtonShowHide.Caption:= LanguageFile.ReadString('Resource', 'ButtonHide', '&Hide');
    ButtonShowHide.Hint:= LanguageFile.ReadString('Resource', 'ButtonShowHideHint', 'Show / hide column');

    ButtonOk.Caption:= LanguageFile.ReadString('Resource', 'ButtonOk', '&Ok');
    ButtonOk.Hint:= LanguageFile.ReadString('Resource', 'ButtonOkHint', 'Close and update settings');

    ButtonCancel.Caption:= LanguageFile.ReadString('Resource', 'ButtonCancel', 'C&ancel');
    ButtonCancel.Hint:= LanguageFile.ReadString('Resource', 'ButtonCancelHint', 'Close without updating');
  end;
  FreeAndNil(LanguageFile);
end;

procedure TFormMain.SetMAMEConfigurationLanguage;
var
  LanguageFile: TMemIniFile;
begin
  if not FileExists(FrontendPath+'resources\language\'+FrontendLanguage+'.lng') then
     Exit;

  LanguageFile:= TMemIniFile.Create(FrontendPath+'resources\language\'+FrontendLanguage+'.lng');

  with FormMAMEConfiguration do
  begin
    // Screen Title
    Caption:= LanguageFile.ReadString('MAME Options', 'MAMEConfigurationTitle', 'MAME Configuration');

    // Main Tab Sheet's titles
    TabSheetMAMEFolders.Caption:= LanguageFile.ReadString('MAME Options', 'TabSheetFoldersCaption', 'Folders');
    TabSheetMAMEOptions.Caption:= LanguageFile.ReadString('MAME Options', 'TabSheetOptionsCaption', 'Options');

    TabSheetMAMEDisplay.Caption:= LanguageFile.ReadString('MAME Options', 'TabSheetDisplay1Caption', 'Display');
    TabSheetMAMEDisplay2.Caption:= LanguageFile.ReadString('MAME Options', 'TabSheetDisplay2Caption', 'Display 2');
    TabSheetMAMESoundControllers.Caption:= LanguageFile.ReadString('MAME Options', 'TabSheetSoundControllersCaption', 'Sound / Controllers');
    TabSheetMAMEMiscellaneous.Caption:= LanguageFile.ReadString('MAME Options', 'TabSheetMiscellaneousCaption', 'Miscellaneous');

    // Tab Sheet "Display" Label & Options
    LabelResolution.Caption:= LanguageFile.ReadString('MAME Options', 'LabelResolution', 'Resolution');
    LabelCustomResolution.Caption:= LanguageFile.ReadString('MAME Options', 'LabelCustomResolution', 'Custom Res');

    Resolution.Hint:= LanguageFile.ReadString('MAME Options', 'ResolutionHint', 'Specifies an exact resolution to run in');
    CustomResolution.Hint:= LanguageFile.ReadString('MAME Options', 'CustomResolutionHint', 'Specifies a custom resolution to run in');

    LabelGamma.Caption:= LanguageFile.ReadString('MAME Options', 'LabelGamma', 'Gamma');
    Gamma.Hint:= LanguageFile.ReadString('MAME Options', 'GammaHint', 'Set the global gamma correction in the game');

    // "Display 2"
    LabelRefreshRate.Caption:= LanguageFile.ReadString('MAME Options', 'LabelRefreshRate', 'Refresh Rate');
    LabelFramesToRun.Caption:= LanguageFile.ReadString('MAME Options', 'LabelFramesToRun', 'Frames To Run');
    LabelEffect.Caption:= LanguageFile.ReadString('MAME Options', 'LabelEffect', 'Effect');
    LabelFullScreenBrightness.Caption:= LanguageFile.ReadString('MAME Options', 'LabelFullScreenBrightness', 'Full Screen Brightness');
    LabelScreenAspect.Caption:= LanguageFile.ReadString('MAME Options', 'LabelScreenAspectRatio', 'Screen Aspect Ratio');
    LabelDebuggerResolution.Caption:= LanguageFile.ReadString('MAME Options', 'LabelDebuggerResolution', 'Debugger Resolution');
    LabelFrameSkip.Caption:= LanguageFile.ReadString('MAME Options', 'LabelFrameSkip', 'Frame Skip');
    LabelBrightness.Caption:= LanguageFile.ReadString('MAME Options', 'LabelBrightness', 'Brightness');
    LabelPauseBrightness.Caption:= LanguageFile.ReadString('MAME Options', 'LabelPauseBrightness', 'Pause Brightness');

    RefreshRate.Hint:= LanguageFile.ReadString('MAME Options', 'RefreshRateHint', 'Set specific monitor refresh rate (direct draw must be on and run in window must be off)');
    FramesToRun.Hint:= LanguageFile.ReadString('MAME Options', 'FramesToRunHint', 'Sets the number of frames to run within the game');
    Effect.Hint:= LanguageFile.ReadString('MAME Options', 'EffectHint', 'Specify the blitting effect');
    FullScreenBrightness.Hint:= LanguageFile.ReadString('MAME Options', 'FullScreenBrightnessHint', 'Sets the brightness in full screen mode if available (direct draw must be on and run in window must be off)');
    ScreenAspect.Hint:= LanguageFile.ReadString('MAME Options', 'ScreenAspectRatioHint', 'Specify an alternate monitor aspect ratio');
    DebuggerResolution.Hint:= LanguageFile.ReadString('MAME Options', 'DebuggerResolutionHint', 'Set resolution for debugger window (run in window must be on)');
    FrameSkip.Hint:= LanguageFile.ReadString('MAME Options', 'FrameSkipHint', 'Set frameskip explicitly (autoframeskip needs to be off)');
    Brightness.Hint:= LanguageFile.ReadString('MAME Options', 'BrightnessHint', 'Brightness correction');
    PauseBrightness.Hint:= LanguageFile.ReadString('MAME Options', 'PauseBrightnessHint', 'Additional pause brightness');

    // "Display"
    AutoFrameSkip.Caption:= LanguageFile.ReadString('MAME Options', 'LabelAutoFrameSkip', 'Auto Frame Skip');
    KeepAspectRatio.Caption:= LanguageFile.ReadString('MAME Options', 'LabelKeepAspectRatio', 'Keep Aspect Ratio');
    SwitchColorDepth.Caption:= LanguageFile.ReadString('MAME Options', 'LabelSwitchColorDepth', 'Switch Color Depth');
    SwitchResolution.Caption:= LanguageFile.ReadString('MAME Options', 'LabelSwitchResolution', 'Switch Resolution');
    Window.Caption:= LanguageFile.ReadString('MAME Options', 'LabelRunInWindow', 'Run In Window');
    MatchRefreshRate.Caption:= LanguageFile.ReadString('MAME Options', 'LabelMatchRefreshRate', 'Match Refresh Rate');
    TripleBuffer.Caption:= LanguageFile.ReadString('MAME Options', 'LabelTripleBuffer', 'Triple Buffer');
    NoRotate.Caption:= LanguageFile.ReadString('MAME Options', 'LabelNoRotate', 'No Rotate');
    RotateLeft.Caption:= LanguageFile.ReadString('MAME Options', 'LabelRotateLeft', 'Rotate Left');
    RotateRight.Caption:= LanguageFile.ReadString('MAME Options', 'LabelRotateRight', 'Rotate Right');
    Maximize.Caption:= LanguageFile.ReadString('MAME Options', 'LabelMaximize', 'Maximize');
    WaitVSync.Caption:= LanguageFile.ReadString('MAME Options', 'LabelWaitVerticalSync', 'Wait Vertical Sync');
    DirectDraw.Caption:= LanguageFile.ReadString('MAME Options', 'LabelDirectDraw', 'Direct Draw');
    HardwareStretch.Caption:= LanguageFile.ReadString('MAME Options', 'LabelHardwareStretch', 'Hardware Stretch');
    SyncronizeRefreshRate.Caption:= LanguageFile.ReadString('MAME Options', 'LabelSyncRefreshRate', 'Sync Refresh Rate');
    Scanlines.Caption:= LanguageFile.ReadString('MAME Options', 'LabelScanlines', 'Scanlines');
    FlipX.Caption:= LanguageFile.ReadString('MAME Options', 'LabelFlipX', 'Flip X');
    FlipY.Caption:= LanguageFile.ReadString('MAME Options', 'LabelFlipY', 'Flip Y');
    Sleep.Caption:= LanguageFile.ReadString('MAME Options', 'LabelSleep', 'Sleep');
    RDTSC.Caption:= LanguageFile.ReadString('MAME Options', 'LabelRDTSC', 'RDTSC');

    AutoFrameSkip.Hint:= LanguageFile.ReadString('MAME Options', 'AutoFrameSkipHint', 'Automatically determines the frameskip level while you''re playing the game to keep the game running at full speed. It overrides the frameskip value');
    KeepAspectRatio.Hint:= LanguageFile.ReadString('MAME Options', 'KeepAspectRatioHint', 'Enforce aspect ratio');
    SwitchColorDepth.Hint:= LanguageFile.ReadString('MAME Options', 'SwitchColorDepthHint', 'Switch color depths to best fit (Direct Draw must be on)');
    SwitchResolution.Hint:= LanguageFile.ReadString('MAME Options', 'SwitchResolutionHint', 'Switch resolutions to best fit (direct draw and full screen must be on)');
    Window.Hint:= LanguageFile.ReadString('MAME Options', 'RunInWindowHint', 'Run in a window. Current Windows resolution and depth will be used');
    MatchRefreshRate.Hint:= LanguageFile.ReadString('MAME Options', 'MatchRefreshRateHint', 'Attempt to match the game''s refresh rate (direct draw must be on and run in window must be off)');
    TripleBuffer.Hint:= LanguageFile.ReadString('MAME Options', 'TripleBufferHint', 'Enable/disable triple buffering (only if fullscreen)');
    NoRotate.Hint:= LanguageFile.ReadString('MAME Options', 'NoRotateHint', 'Do not apply rotation in screen');
    RotateLeft.Hint:= LanguageFile.ReadString('MAME Options', 'RotateLeftHint', 'Rotate screen anti-clockwise');
    RotateRight.Hint:= LanguageFile.ReadString('MAME Options', 'RotateRightHint', 'Rotate screen clockwise');
    Maximize.Hint:= LanguageFile.ReadString('MAME Options', 'MaximizeHint', 'Controls initial window size in windowed mode (run in window must be on)');
    WaitVSync.Hint:= LanguageFile.ReadString('MAME Options', 'WaitVerticalSyncHint', 'Wait for vertical syncronization to reduce tearing (direct draw must be on)');
    DirectDraw.Hint:= LanguageFile.ReadString('MAME Options', 'DirectDrawHint', 'Use DirectDraw for rendering');
    HardwareStretch.Hint:= LanguageFile.ReadString('MAME Options', 'HardwareStretchHint', 'Stretch video using the hardware (direct draw must be on)');
    SyncronizeRefreshRate.Hint:= LanguageFile.ReadString('MAME Options', 'SyncRefreshRateHint', 'Syncronize only to the monitor refresh (direct draw must be on)');
    Scanlines.Hint:= LanguageFile.ReadString('MAME Options', 'ScanlinesHint', 'Emulate scanlines (hardware stretch needs to be off)');
    FlipX.Hint:= LanguageFile.ReadString('MAME Options', 'FlipXHint', 'Flip screen upside-down');
    FlipY.Hint:= LanguageFile.ReadString('MAME Options', 'FlipYHint', 'Flip screen left-right');
    Sleep.Hint:= LanguageFile.ReadString('MAME Options', 'LabelSleepHint', 'Allow MAME to give back time to the system when it''s not needed');
    RDTSC.Hint:= LanguageFile.ReadString('MAME Options', 'RDTSCHint', 'Prefer RDTSC over QueryPerformanceCounter for timing');

    // "Display 2" Options & Labels
    // Vector options
    LabelVector.Caption:= LanguageFile.ReadString('MAME Options', 'LabelVectorFrameBox', 'Vector');
    Antialias.Caption:= LanguageFile.ReadString('MAME Options', 'LabelAntialias', 'Antialias');
    Translucency.Caption:= LanguageFile.ReadString('MAME Options', 'LabelTranslucency', 'Translucency');
    LabelFlicker.Caption:= LanguageFile.ReadString('MAME Options', 'LabelFlicker', 'Flicker');
    LabelBeam.Caption:= LanguageFile.ReadString('MAME Options', 'LabelBeam', 'Beam');
    LabelIntensity.Caption:= LanguageFile.ReadString('MAME Options', 'LabelIntensity', 'Intensity');

    Antialias.Hint:= LanguageFile.ReadString('MAME Options', 'AntialiasHint', 'Draw antialiased vectors');
    Translucency.Hint:= LanguageFile.ReadString('MAME Options', 'TranslucencyHint', 'Draw translucent vectors');
    Flicker.Hint:= LanguageFile.ReadString('MAME Options', 'FlickerHint', 'Set flickering in vector games');
    Beam.Hint:= LanguageFile.ReadString('MAME Options', 'BeamHint', 'Set beam width in vector games');
    Intensity.Hint:= LanguageFile.ReadString('MAME Options', 'IntensityHint', 'Set intensity in vector games');

    // "Sound" Options & Labels
    LabelSoundOptions.Caption:= LanguageFile.ReadString('MAME Options', 'LabelSound', 'Sound');
    LabelSampleRate.Caption:= LanguageFile.ReadString('MAME Options', 'LabelSampleRate', 'Sample Rate');
    LabelCustomSampleRate.Caption:= LanguageFile.ReadString('MAME Options', 'LabelCustomSampleRate', 'Custom SR');
    LabelVolume.Caption:= LanguageFile.ReadString('MAME Options', 'LabelVolume', 'Volume');
    Sound.Caption:= LanguageFile.ReadString('MAME Options', 'LabelSound', 'Sound');
    Samples.Caption:= LanguageFile.ReadString('MAME Options', 'LabelSamples', 'Samples');
    ResampleFilter.Caption:= LanguageFile.ReadString('MAME Options', 'LabelResampleFilter', 'Resample Filter');

    SampleRate.Hint:= LanguageFile.ReadString('MAME Options', 'SampleRateHint', 'Set samplerate');
    CustomSampleRate.Hint:= LanguageFile.ReadString('MAME Options', 'CustomSampleRateHint', 'Set a custom samplerate (will override samplerate)');
    Volume.Hint:= LanguageFile.ReadString('MAME Options', 'VolumeHint', 'Volume attenuation (in dB)');
    Sound.Hint:= LanguageFile.ReadString('MAME Options', 'SoundHint', 'Enable/disable sound and sound CPUs');
    Samples.Hint:= LanguageFile.ReadString('MAME Options', 'SamplesHint', 'Use of samples files');
    ResampleFilter.Hint:= LanguageFile.ReadString('MAME Options', 'ResampleFilterHint', 'Resample if samplerate does not match');

    // "Controllers" Options & Labels
    LabelControllersOptions.Caption:= LanguageFile.ReadString('MAME Options', 'LabelControllerFrameBox', 'Controllers');
    Joystick.Caption:= LanguageFile.ReadString('MAME Options', 'LabelJoystick', 'Joystick');
    Mouse.Caption:= LanguageFile.ReadString('MAME Options', 'LabelMouse', 'Mouse');
    LightGun.Caption:= LanguageFile.ReadString('MAME Options', 'LabelLightGun', 'Light Gun');
    KeyboardLEDs.Caption:= LanguageFile.ReadString('MAME Options', 'LabelKeyboardLEDs', 'Keyboard LEDs');
    LabelAnalogDigitalDeadzone.Caption:= LanguageFile.ReadString('MAME Options', 'LabelAnalogDigitalDeadzone', 'Analog to Digital Deadzone');
    SteadyKey.Caption:= LanguageFile.ReadString('MAME Options', 'LabelSteadyKey', 'Steady Key');
    LabelControllerKeysMapping.Caption:= LanguageFile.ReadString('MAME Options', 'LabelKeysMapping', 'Keys Mapping');
    ControllerKeysMapping.Items[0]:= LanguageFile.ReadString('MAME Options', 'ControllerKeysMappingNone', '(None)');

    Joystick.Hint:= LanguageFile.ReadString('MAME Options', 'JoystickHint', 'Enable joystick input');
    Mouse.Hint:= LanguageFile.ReadString('MAME Options', 'MouseHint', 'Enable mouse input (Windows mouse will be unavailable)');
    LightGun.Hint:= LanguageFile.ReadString('MAME Options', 'LightGunHint', 'Enable lightgun input');
    KeyboardLEDs.Hint:= LanguageFile.ReadString('MAME Options', 'KeyboardLEDsHint', 'Enable keyboard LED emulation');
    AnalogDigitalDeadzone.Hint:= LanguageFile.ReadString('MAME Options', 'AnalogDigitalDeadzoneHint', 'Minimal analog value for digital input');
    SteadyKey.Hint:= LanguageFile.ReadString('MAME Options', 'SteadyKeyHint', 'It selects a different handling for simultaneous button presses but the controls are less responsive');
    ControllerKeysMapping.Hint:= LanguageFile.ReadString('MAME Options', 'ControllerKeysMappingHint', 'Pre-configure for specified controller');

    // "Tweaks" Options & Labels
    LabelTweaks.Caption:= LanguageFile.ReadString('MAME Options', 'LabelTweaksFrameBox', 'Tweaks');
    Throttle.Caption:= LanguageFile.ReadString('MAME Options', 'LabelThrottle', 'Throttle');
    Cheat.Caption:= LanguageFile.ReadString('MAME Options', 'LabelCheat', 'Cheat');
    Clones.Caption:= LanguageFile.ReadString('MAME Options', 'LabelClones', 'Clones');
    ReadConfigFile.Caption:= LanguageFile.ReadString('MAME Options', 'LabelReadConfigFile', 'Read Config File');
    Verbose.Caption:= LanguageFile.ReadString('MAME Options', 'LabelVerbose', 'Verbose');
    Log.Caption:= LanguageFile.ReadString('MAME Options', 'LabelLog', 'Log');
    OSDebug.Caption:= LanguageFile.ReadString('MAME Options', 'LabelOSDebug', 'Log to Debug');
    SkipDisclaimer.Caption:= LanguageFile.ReadString('MAME Options', 'LabelSkipDisclaimer', 'Skip Disclaimer');
    SkipGameInfo.Caption:= LanguageFile.ReadString('MAME Options', 'LabelSkipGameInfo', 'Skip Game Info');
    Debug.Caption:= LanguageFile.ReadString('MAME Options', 'LabelDebug', 'Debug');

    Throttle.Hint:= LanguageFile.ReadString('MAME Options', 'ThrottleHint', 'Throttle speed to the game''s framerate');
    Cheat.Hint:= LanguageFile.ReadString('MAME Options', 'CheatHint', 'Enable/disable cheat subsystem');
    Clones.Hint:= LanguageFile.ReadString('MAME Options', 'ClonesHint', 'Enable/disable clones');
    ReadConfigFile.Hint:= LanguageFile.ReadString('MAME Options', 'ReadConfigFileHint', 'Enable/disable the reading of the config files');
    Verbose.Hint:= LanguageFile.ReadString('MAME Options', 'VerboseHint', 'Displays some diagnostic information at startup');
    Log.Hint:= LanguageFile.ReadString('MAME Options', 'LogHint', 'Generate error.log file');
    OSDebug.Hint:= LanguageFile.ReadString('MAME Options', 'OSDebugHint', 'Output error log to debugger');
    SkipDisclaimer.Hint:= LanguageFile.ReadString('MAME Options', 'SkipDisclaimerHint', 'Skip displaying the disclaimer screen');
    SkipGameInfo.Hint:= LanguageFile.ReadString('MAME Options', 'SkipGameInfoHint', 'Skip displaying the game info screen');
    Debug.Hint:= LanguageFile.ReadString('MAME Options', 'DebugHint', 'Enable/disable debugger (only if available)');

    // "External Files" Options & Labels
    LabelExternalFiles.Caption:= LanguageFile.ReadString('MAME Options', 'LabelExternalFilesFrameBox', 'External Files');

    LabelCheatFile.Caption:= LanguageFile.ReadString('MAME Options', 'LabelCheatFile', 'Cheat File');
    LabelMAMEInfoFile.Caption:= LanguageFile.ReadString('MAME Options', 'LabelMAMEInfoFile', 'Info File');
    LabelHistoryFile.Caption:= LanguageFile.ReadString('MAME Options', 'LabelHistoryFile', 'History File');

    FilenameCheat.Hint:= LanguageFile.ReadString('MAME Options', 'CheatFileHint', 'Select a cheat filename');
    FilenameMAMEInfo.Hint:= LanguageFile.ReadString('MAME Options', 'MAMEInfoFileHint', 'Select a mameinfo filename');
    FilenameHistory.Hint:= LanguageFile.ReadString('MAME Options', 'HistoryFileHint', 'Select a history filename');

    FilenameCheatButtonSelect.Hint:= LanguageFile.ReadString('MAME Options', 'CheatFileButtonHint', 'Click here to select a cheat file');
    FilenameMAMEInfoButtonSelect.Hint:= LanguageFile.ReadString('MAME Options', 'MAMEInfoFileButtonHint', 'Click here to select a mameinfo file');
    FilenameHistoryButtonSelect.Hint:= LanguageFile.ReadString('MAME Options', 'HistoryFileButtonHint', 'Click here to select a history file');

    // "Artwork" Options
    LabelArtwork.Caption:= LanguageFile.ReadString('MAME Options', 'LabelArtworkFrameBox', 'Artwork');
    Artwork.Caption:= LanguageFile.ReadString('MAME Options', 'LabelArtwork', 'Artwork');
    Overlay.Caption:= LanguageFile.ReadString('MAME Options', 'LabelOverlay', 'Overlay');
    Backdrop.Caption:= LanguageFile.ReadString('MAME Options', 'LabelBackdrop', 'Backdrop');
    Bezel.Caption:= LanguageFile.ReadString('MAME Options', 'LabelBezel', 'Bezel');
    Crop.Caption:= LanguageFile.ReadString('MAME Options', 'LabelCrop', 'Crop');
    LabelArtworkResolution.Caption:= LanguageFile.ReadString('MAME Options', 'LabelArtworkResolution', 'Artwork Resolution');

    Artwork.Hint:= LanguageFile.ReadString('MAME Options', 'ArtworkHint', 'Use additional game artwork');
    Overlay.Hint:= LanguageFile.ReadString('MAME Options', 'OverlayHint', 'Use overlay artwork');
    Backdrop.Hint:= LanguageFile.ReadString('MAME Options', 'BackdropHint', 'Use backdrop artwork');
    Bezel.Hint:= LanguageFile.ReadString('MAME Options', 'BezelHint', 'Use bezel artwork');
    Crop.Hint:= LanguageFile.ReadString('MAME Options', 'CropHint', 'Crop artwork to game screen only');
    ArtworkResolution.Hint:= LanguageFile.ReadString('MAME Options', 'ArtworkResolutionHint', 'Artwork resolution');

    // "Folders" tab
    // "Folders" Options & Labels
    LabelFolderROMs.Caption:= LanguageFile.ReadString('MAME Options', 'LabelROMsFolder', 'ROMs');
    LabelFolderSamples.Caption:= LanguageFile.ReadString('MAME Options', 'LabelSamplesFolder', 'Samples');
    LabelFolderINIFiles.Caption:= LanguageFile.ReadString('MAME Options', 'LabelINIFilesFolder', 'INI Files');
    LabelFolderGamesConfiguration.Caption:= LanguageFile.ReadString('MAME Options', 'LabelGamesConfigurationFolder', 'Games Configuration');
    LabelFolderSaveStates.Caption:= LanguageFile.ReadString('MAME Options', 'LabelSaveStateFolder', 'Save States');
    LabelFolderHighScores.Caption:= LanguageFile.ReadString('MAME Options', 'LabelHighScoresFolder', 'High Scores');
    LabelFolderNVRAM.Caption:= LanguageFile.ReadString('MAME Options', 'LabelNVRAMFolder', 'NVRAM');
    LabelFolderMemoryCards.Caption:= LanguageFile.ReadString('MAME Options', 'LabelMemoryCardsFolder', 'Memory Cards');
    LabelFolderGamesRecording.Caption:= LanguageFile.ReadString('MAME Options', 'LabelInputsRecordingFolder', 'Inputs Recording');
    LabelFolderArtworks.Caption:= LanguageFile.ReadString('MAME Options', 'LabelArtworksFolder', 'Artworks');
    LabelFolderDiff.Caption:= LanguageFile.ReadString('MAME Options', 'LabelFolderDiff', 'Diff');
    LabelFolderInGameSnapshots.Caption:= LanguageFile.ReadString('MAME Options', 'LabelSnapshotsFolder', 'Snapshots');
    LabelFolderKeysMapping.Caption:= LanguageFile.ReadString('MAME Options', 'LabelKeysMapping', 'Keys Mapping');

    FolderROMs.Hint:= LanguageFile.ReadString('MAME Options', 'ROMsFolderHint', 'Path to romsets');
    FolderSamples.Hint:= LanguageFile.ReadString('MAME Options', 'SamplesFolderHint', 'Path to samplesets');
    FolderINIFiles.Hint:= LanguageFile.ReadString('MAME Options', 'INIFilesFolderHint', 'Path to ini files');
    FolderGamesConfiguration.Hint:= LanguageFile.ReadString('MAME Options', 'GamesConfigurationFolderHint', 'Directory to save configurations');
    FolderSaveStates.Hint:= LanguageFile.ReadString('MAME Options', 'SaveStateFolderHint', 'Directory to save states');
    FolderHighScores.Hint:= LanguageFile.ReadString('MAME Options', 'HighScoresFolderHint', 'Directory to save hiscores');
    FolderNVRAM.Hint:= LanguageFile.ReadString('MAME Options', 'NVRAMFolderHint', 'Directory to save nvram contents');
    FolderMemoryCards.Hint:= LanguageFile.ReadString('MAME Options', 'MemoryCardsFolderHint', 'Directory to save memory card contents');
    FolderInputsRecording.Hint:= LanguageFile.ReadString('MAME Options', 'InputsRecordingFolderHint', 'Directory for recordings');
    FolderArtworks.Hint:= LanguageFile.ReadString('MAME Options', 'ArtworksFolderHint', 'Directory for Artwork (Overlays etc.)');
    FolderDiff.Hint:= LanguageFile.ReadString('MAME Options', 'DiffFolderHint', 'Directory for hard drive image difference files');
    FolderSnapshots.Hint:= LanguageFile.ReadString('MAME Options', 'SnapshotsFolderHint', 'Directory for screenshots (.png format)');
    FolderKeysMapping.Hint:= LanguageFile.ReadString('MAME Options', 'KeysMappingHint', 'Directory for preconfigured controller keys');

    FolderROMsButtonSelect.Hint:= LanguageFile.ReadString('MAME Options', 'MultiButtonHint', 'Click here to select folders (can have more than one)');
    FolderSamplesButtonSelect.Hint:= LanguageFile.ReadString('MAME Options', 'SingleButtonHint', 'Click here to select a folder');
    FolderINIFilesButtonSelect.Hint:= FolderSamplesButtonSelect.Hint;
    FolderGamesConfigurationButtonSelect.Hint:= FolderSamplesButtonSelect.Hint;
    FolderSaveStatesButtonSelect.Hint:= FolderSamplesButtonSelect.Hint;
    FolderHighScoresButtonSelect.Hint:= FolderSamplesButtonSelect.Hint;
    FolderNVRAMButtonSelect.Hint:= FolderSamplesButtonSelect.Hint;
    FolderMemoryCardsButtonSelect.Hint:= FolderSamplesButtonSelect.Hint;
    FolderInputsRecordingButtonSelect.Hint:= FolderSamplesButtonSelect.Hint;
    FolderArtworksButtonSelect.Hint:= FolderSamplesButtonSelect.Hint;
    FolderDiffButtonSelect.Hint:= FolderSamplesButtonSelect.Hint;
    FolderSnapshotsButtonSelect.Hint:= FolderSamplesButtonSelect.Hint;
    FolderKeysMappingButtonSelect.Hint:= FolderSamplesButtonSelect.Hint;

    // Buttons
    ButtonOk.Caption:= LanguageFile.ReadString('Resource', 'ButtonOk', '&Ok');
    ButtonOk.Hint:= LanguageFile.ReadString('Resource', 'ButtonOkHint', 'Close and update settings');

    ButtonCancel.Caption:= LanguageFile.ReadString('Resource', 'ButtonCancel', 'C&ancel');
    ButtonCancel.Hint:= LanguageFile.ReadString('Resource', 'ButtonCancelHint', 'Close without updating');
  end;
  FreeAndNil(LanguageFile);
end;

procedure TFormMain.SetMAMECustomConfigurationLanguage;
var
  LanguageFile: TMemIniFile;
begin
  if not FileExists(FrontendPath+'resources\language\'+FrontendLanguage+'.lng') then
     Exit;

  LanguageFile:= TMemIniFile.Create(FrontendPath+'resources\language\'+FrontendLanguage+'.lng');

  with FormMAMECustomConfiguration do
  begin
    // Screen Title
    Caption:= LanguageFile.ReadString('MAME Options', 'MAMECustomConfigurationTitle', 'MAME Custom Configuration');

    // Main Tab Sheet's titles
    TabSheetMAMEFolders.Caption:= LanguageFile.ReadString('MAME Options', 'TabSheetFoldersCaption', 'Folders');
    TabSheetMAMEOptions.Caption:= LanguageFile.ReadString('MAME Options', 'TabSheetOptionsCaption', 'Options');
    TabSheetMAMEDisplay.Caption:= LanguageFile.ReadString('MAME Options', 'TabSheetDisplay1Caption', 'Display');
    TabSheetMAMEDisplay2.Caption:= LanguageFile.ReadString('MAME Options', 'TabSheetDisplay2Caption', 'Display 2');
    TabSheetMAMESoundControllers.Caption:= LanguageFile.ReadString('MAME Options', 'TabSheetSoundControllersCaption', 'Sound / Controllers');
    TabSheetMAMEMiscellaneous.Caption:= LanguageFile.ReadString('MAME Options', 'TabSheetMiscellaneousCaption', 'Miscellaneous');

    // Tab Sheet "Display" Label & Options
    LabelResolution.Caption:= LanguageFile.ReadString('MAME Options', 'LabelResolution', 'Resolution');
    LabelCustomResolution.Caption:= LanguageFile.ReadString('MAME Options', 'LabelCustomResolution', 'Custom Res');

    Resolution.Hint:= LanguageFile.ReadString('MAME Options', 'ResolutionHint', 'Specifies an exact resolution to run in');
    CustomResolution.Hint:= LanguageFile.ReadString('MAME Options', 'CustomResolutionHint', 'Specifies a custom resolution to run in');

    LabelGamma.Caption:= LanguageFile.ReadString('MAME Options', 'LabelGamma', 'Gamma');
    Gamma.Hint:= LanguageFile.ReadString('MAME Options', 'GammaHint', 'Set the global gamma correction in the game');

    // "Display 2"
    LabelRefreshRate.Caption:= LanguageFile.ReadString('MAME Options', 'LabelRefreshRate', 'Refresh Rate');
    LabelFramesToRun.Caption:= LanguageFile.ReadString('MAME Options', 'LabelFramesToRun', 'Frames To Run');
    LabelEffect.Caption:= LanguageFile.ReadString('MAME Options', 'LabelEffect', 'Effect');
    LabelFullScreenBrightness.Caption:= LanguageFile.ReadString('MAME Options', 'LabelFullScreenBrightness', 'Full Screen Brightness');
    LabelScreenAspect.Caption:= LanguageFile.ReadString('MAME Options', 'LabelScreenAspectRatio', 'Screen Aspect Ratio');
    LabelFrameSkip.Caption:= LanguageFile.ReadString('MAME Options', 'LabelFrameSkip', 'Frame Skip');
    LabelBrightness.Caption:= LanguageFile.ReadString('MAME Options', 'LabelBrightness', 'Brightness');
    LabelPauseBrightness.Caption:= LanguageFile.ReadString('MAME Options', 'LabelPauseBrightness', 'Pause Brightness');
    LabelDebuggerResolution.Caption:= LanguageFile.ReadString('MAME Options', 'LabelDebuggerResolution', 'Debugger Resolution');

    RefreshRate.Hint:= LanguageFile.ReadString('MAME Options', 'RefreshRateHint', 'Set specific monitor refresh rate (direct draw must be on and run in window must be off)');
    FramesToRun.Hint:= LanguageFile.ReadString('MAME Options', 'FramesToRunHint', 'Sets the number of frames to run within the game');
    Effect.Hint:= LanguageFile.ReadString('MAME Options', 'EffectHint', 'Specify the blitting effect');
    FullScreenBrightness.Hint:= LanguageFile.ReadString('MAME Options', 'FullScreenBrightnessHint', 'Sets the brightness in full screen mode if available (direct draw must be on and run in window must be off)');
    ScreenAspect.Hint:= LanguageFile.ReadString('MAME Options', 'ScreenAspectRatioHint', 'Specify an alternate monitor aspect ratio');
    FrameSkip.Hint:= LanguageFile.ReadString('MAME Options', 'FrameSkipHint', 'Set frameskip explicitly (autoframeskip needs to be off)');
    Brightness.Hint:= LanguageFile.ReadString('MAME Options', 'BrightnessHint', 'Brightness correction');
    PauseBrightness.Hint:= LanguageFile.ReadString('MAME Options', 'PauseBrightnessHint', 'Additional pause brightness');
    DebuggerResolution.Hint:= LanguageFile.ReadString('MAME Options', 'DebuggerResolutionHint', 'Set resolution for debugger window (run in window must be on)');

    // "Display"
    AutoFrameSkip.Caption:= LanguageFile.ReadString('MAME Options', 'LabelAutoFrameSkip', 'Auto Frame Skip');
    KeepAspectRatio.Caption:= LanguageFile.ReadString('MAME Options', 'LabelKeepAspectRatio', 'Keep Aspect Ratio');
    SwitchColorDepth.Caption:= LanguageFile.ReadString('MAME Options', 'LabelSwitchColorDepth', 'Switch Color Depth');
    SwitchResolution.Caption:= LanguageFile.ReadString('MAME Options', 'LabelSwitchResolution', 'Switch Resolution');
    Window.Caption:= LanguageFile.ReadString('MAME Options', 'LabelRunInWindow', 'Run In Window');
    MatchRefreshRate.Caption:= LanguageFile.ReadString('MAME Options', 'LabelMatchRefreshRate', 'Match Refresh Rate');
    TripleBuffer.Caption:= LanguageFile.ReadString('MAME Options', 'LabelTripleBuffer', 'Triple Buffer');
    NoRotate.Caption:= LanguageFile.ReadString('MAME Options', 'LabelNoRotate', 'No Rotate');
    RotateLeft.Caption:= LanguageFile.ReadString('MAME Options', 'LabelRotateLeft', 'Rotate Left');
    RotateRight.Caption:= LanguageFile.ReadString('MAME Options', 'LabelRotateRight', 'Rotate Right');
    Maximize.Caption:= LanguageFile.ReadString('MAME Options', 'LabelMaximize', 'Maximize');
    WaitVSync.Caption:= LanguageFile.ReadString('MAME Options', 'LabelWaitVerticalSync', 'Wait Vertical Sync');
    DirectDraw.Caption:= LanguageFile.ReadString('MAME Options', 'LabelDirectDraw', 'Direct Draw');
    HardwareStretch.Caption:= LanguageFile.ReadString('MAME Options', 'LabelHardwareStretch', 'Hardware Stretch');
    SyncronizeRefreshRate.Caption:= LanguageFile.ReadString('MAME Options', 'LabelSyncRefreshRate', 'Sync Refresh Rate');
    Scanlines.Caption:= LanguageFile.ReadString('MAME Options', 'LabelScanlines', 'Scanlines');
    FlipX.Caption:= LanguageFile.ReadString('MAME Options', 'LabelFlipX', 'Flip X');
    FlipY.Caption:= LanguageFile.ReadString('MAME Options', 'LabelFlipY', 'Flip Y');
    Sleep.Caption:= LanguageFile.ReadString('MAME Options', 'LabelSleep', 'Sleep');
    RDTSC.Caption:= LanguageFile.ReadString('MAME Options', 'LabelRDTSC', 'RDTSC');

    AutoFrameSkip.Hint:= LanguageFile.ReadString('MAME Options', 'AutoFrameSkipHint', 'Automatically determines the frameskip level while you''re playing the game to keep the game running at full speed. It overrides the frameskip value');
    KeepAspectRatio.Hint:= LanguageFile.ReadString('MAME Options', 'KeepAspectRatioHint', 'Enforce aspect ratio');
    SwitchColorDepth.Hint:= LanguageFile.ReadString('MAME Options', 'SwitchColorDepthHint', 'Switch color depths to best fit (Direct Draw must be on)');
    SwitchResolution.Hint:= LanguageFile.ReadString('MAME Options', 'SwitchResolutionHint', 'Switch resolutions to best fit (direct draw and full screen must be on)');
    Window.Hint:= LanguageFile.ReadString('MAME Options', 'RunInWindowHint', 'Run in a window. Current Windows resolution and depth will be used');
    MatchRefreshRate.Hint:= LanguageFile.ReadString('MAME Options', 'MatchRefreshRateHint', 'Attempt to match the game''s refresh rate (direct draw must be on and run in window must be off)');
    TripleBuffer.Hint:= LanguageFile.ReadString('MAME Options', 'TripleBufferHint', 'Enable/disable triple buffering (only if fullscreen)');
    NoRotate.Hint:= LanguageFile.ReadString('MAME Options', 'NoRotateHint', 'Do not apply rotation in screen');
    RotateLeft.Hint:= LanguageFile.ReadString('MAME Options', 'RotateLeftHint', 'Rotate screen anti-clockwise');
    RotateRight.Hint:= LanguageFile.ReadString('MAME Options', 'RotateRightHint', 'Rotate screen clockwise');
    Maximize.Hint:= LanguageFile.ReadString('MAME Options', 'MaximizeHint', 'Controls initial window size in windowed mode (run in window must be on)');
    WaitVSync.Hint:= LanguageFile.ReadString('MAME Options', 'WaitVerticalSyncHint', 'Wait for vertical syncronization to reduce tearing (direct draw must be on)');
    DirectDraw.Hint:= LanguageFile.ReadString('MAME Options', 'DirectDrawHint', 'Use DirectDraw for rendering');
    HardwareStretch.Hint:= LanguageFile.ReadString('MAME Options', 'HardwareStretchHint', 'Stretch video using the hardware (direct draw must be on)');
    SyncronizeRefreshRate.Hint:= LanguageFile.ReadString('MAME Options', 'SyncRefreshRateHint', 'Syncronize only to the monitor refresh (direct draw must be on)');
    Scanlines.Hint:= LanguageFile.ReadString('MAME Options', 'ScanlinesHint', 'Emulate scanlines (hardware stretch needs to be off)');
    FlipX.Hint:= LanguageFile.ReadString('MAME Options', 'FlipXHint', 'Flip screen upside-down');
    FlipY.Hint:= LanguageFile.ReadString('MAME Options', 'FlipYHint', 'Flip screen left-right');
    Sleep.Hint:= LanguageFile.ReadString('MAME Options', 'LabelSleepHint', 'Allow MAME to give back time to the system when it''s not needed');
    RDTSC.Hint:= LanguageFile.ReadString('MAME Options', 'RDTSCHint', 'Prefer RDTSC over QueryPerformanceCounter for timing');

    // "Display 2" Options & Labels
    // Vector options
    LabelVector.Caption:= LanguageFile.ReadString('MAME Options', 'LabelVectorFrameBox', 'Vector');
    Antialias.Caption:= LanguageFile.ReadString('MAME Options', 'LabelAntialias', 'Antialias');
    Translucency.Caption:= LanguageFile.ReadString('MAME Options', 'LabelTranslucency', 'Translucency');
    LabelFlicker.Caption:= LanguageFile.ReadString('MAME Options', 'LabelFlicker', 'Flicker');
    LabelBeam.Caption:= LanguageFile.ReadString('MAME Options', 'LabelBeam', 'Beam');
    LabelIntensity.Caption:= LanguageFile.ReadString('MAME Options', 'LabelIntensity', 'Intensity');

    Antialias.Hint:= LanguageFile.ReadString('MAME Options', 'AntialiasHint', 'Draw antialiased vectors');
    Translucency.Hint:= LanguageFile.ReadString('MAME Options', 'TranslucencyHint', 'Draw translucent vectors');
    Flicker.Hint:= LanguageFile.ReadString('MAME Options', 'FlickerHint', 'Set flickering in vector games');
    Beam.Hint:= LanguageFile.ReadString('MAME Options', 'BeamHint', 'Set beam width in vector games');
    Intensity.Hint:= LanguageFile.ReadString('MAME Options', 'IntensityHint', 'Set intensity in vector games');

    // "Sound" Options & Labels
    LabelSoundOptions.Caption:= LanguageFile.ReadString('MAME Options', 'LabelSound', 'Sound');
    LabelSampleRate.Caption:= LanguageFile.ReadString('MAME Options', 'LabelSampleRate', 'Sample Rate');
    LabelCustomSampleRate.Caption:= LanguageFile.ReadString('MAME Options', 'LabelCustomSampleRate', 'Custom SR');
    LabelVolume.Caption:= LanguageFile.ReadString('MAME Options', 'LabelVolume', 'Volume');
    Sound.Caption:= LanguageFile.ReadString('MAME Options', 'LabelSound', 'Sound');
    Samples.Caption:= LanguageFile.ReadString('MAME Options', 'LabelSamples', 'Samples');
    ResampleFilter.Caption:= LanguageFile.ReadString('MAME Options', 'LabelResampleFilter', 'Resample Filter');

    SampleRate.Hint:= LanguageFile.ReadString('MAME Options', 'SampleRateHint', 'Set samplerate');
    CustomSampleRate.Hint:= LanguageFile.ReadString('MAME Options', 'CustomSampleRateHint', 'Set a custom samplerate (will override samplerate)');
    Volume.Hint:= LanguageFile.ReadString('MAME Options', 'VolumeHint', 'Volume attenuation (in dB)');
    Sound.Hint:= LanguageFile.ReadString('MAME Options', 'SoundHint', 'Enable/disable sound and sound CPUs');
    Samples.Hint:= LanguageFile.ReadString('MAME Options', 'SamplesHint', 'Use of samples files');
    ResampleFilter.Hint:= LanguageFile.ReadString('MAME Options', 'ResampleFilterHint', 'Resample if samplerate does not match');

    // "Controllers" Options & Labels
    LabelControllersOptions.Caption:= LanguageFile.ReadString('MAME Options', 'LabelControllerFrameBox', 'Controllers');
    Joystick.Caption:= LanguageFile.ReadString('MAME Options', 'LabelJoystick', 'Joystick');
    Mouse.Caption:= LanguageFile.ReadString('MAME Options', 'LabelMouse', 'Mouse');
    LightGun.Caption:= LanguageFile.ReadString('MAME Options', 'LabelLightGun', 'Light Gun');
    KeyboardLEDs.Caption:= LanguageFile.ReadString('MAME Options', 'LabelKeyboardLEDs', 'Keyboard LEDs');
    LabelAnalogDigitalDeadzone.Caption:= LanguageFile.ReadString('MAME Options', 'LabelAnalogDigitalDeadzone', 'Analog to Digital Deadzone');
    SteadyKey.Caption:= LanguageFile.ReadString('MAME Options', 'LabelSteadyKey', 'Steady Key');
    LabelControllerKeysMapping.Caption:= LanguageFile.ReadString('MAME Options', 'LabelKeysMapping', 'Keys Mapping');
    ControllerKeysMapping.Items[0]:= LanguageFile.ReadString('MAME Options', 'ControllerKeysMappingNone', '(None)');

    Joystick.Hint:= LanguageFile.ReadString('MAME Options', 'JoystickHint', 'Enable joystick input');
    Mouse.Hint:= LanguageFile.ReadString('MAME Options', 'MouseHint', 'Enable mouse input (Windows mouse will be unavailable)');
    LightGun.Hint:= LanguageFile.ReadString('MAME Options', 'LightGunHint', 'Enable lightgun input');
    KeyboardLEDs.Hint:= LanguageFile.ReadString('MAME Options', 'KeyboardLEDsHint', 'Enable keyboard LED emulation');
    AnalogDigitalDeadzone.Hint:= LanguageFile.ReadString('MAME Options', 'AnalogDigitalDeadzoneHint', 'Minimal analog value for digital input');
    SteadyKey.Hint:= LanguageFile.ReadString('MAME Options', 'SteadyKeyHint', 'It selects a different handling for simultaneous button presses but the controls are less responsive');
    ControllerKeysMapping.Hint:= LanguageFile.ReadString('MAME Options', 'ControllerKeysMappingHint', 'Pre-configure for specified controller');

    // "Tweaks" Options & Labels
    LabelTweaks.Caption:= LanguageFile.ReadString('MAME Options', 'LabelTweaksFrameBox', 'Tweaks');
    Throttle.Caption:= LanguageFile.ReadString('MAME Options', 'LabelThrottle', 'Throttle');
    Cheat.Caption:= LanguageFile.ReadString('MAME Options', 'LabelCheat', 'Cheat');
    Clones.Caption:= LanguageFile.ReadString('MAME Options', 'LabelClones', 'Clones');
    ReadConfigFile.Caption:= LanguageFile.ReadString('MAME Options', 'LabelReadConfigFile', 'Read Config File');
    Verbose.Caption:= LanguageFile.ReadString('MAME Options', 'LabelVerbose', 'Verbose');
    Log.Caption:= LanguageFile.ReadString('MAME Options', 'LabelLog', 'Log');
    OSDebug.Caption:= LanguageFile.ReadString('MAME Options', 'LabelOSDebug', 'Log to Debug');
    SkipDisclaimer.Caption:= LanguageFile.ReadString('MAME Options', 'LabelSkipDisclaimer', 'Skip Disclaimer');
    SkipGameInfo.Caption:= LanguageFile.ReadString('MAME Options', 'LabelSkipGameInfo', 'Skip Game Info');
    Debug.Caption:= LanguageFile.ReadString('MAME Options', 'LabelDebug', 'Debug');

    Throttle.Hint:= LanguageFile.ReadString('MAME Options', 'ThrottleHint', 'Throttle speed to the game''s framerate');
    Cheat.Hint:= LanguageFile.ReadString('MAME Options', 'CheatHint', 'Enable/disable cheat subsystem');
    Clones.Hint:= LanguageFile.ReadString('MAME Options', 'ClonesHint', 'Enable/disable clones');
    ReadConfigFile.Hint:= LanguageFile.ReadString('MAME Options', 'ReadConfigFileHint', 'Enable/disable the reading of the config files');
    Verbose.Hint:= LanguageFile.ReadString('MAME Options', 'VerboseHint', 'Displays some diagnostic information at startup');
    Log.Hint:= LanguageFile.ReadString('MAME Options', 'LogHint', 'Generate error.log file');
    OSDebug.Hint:= LanguageFile.ReadString('MAME Options', 'OSDebugHint', 'Output error log to debugger');
    SkipDisclaimer.Hint:= LanguageFile.ReadString('MAME Options', 'SkipDisclaimerHint', 'Skip displaying the disclaimer screen');
    SkipGameInfo.Hint:= LanguageFile.ReadString('MAME Options', 'SkipGameInfoHint', 'Skip displaying the game info screen');
    Debug.Hint:= LanguageFile.ReadString('MAME Options', 'DebugHint', 'Enable/disable debugger (only if available)');

    // "Artwork" Options
    LabelArtwork.Caption:= LanguageFile.ReadString('MAME Options', 'LabelArtworkFrameBox', 'Artwork');
    Artwork.Caption:= LanguageFile.ReadString('MAME Options', 'LabelArtwork', 'Artwork');
    Overlay.Caption:= LanguageFile.ReadString('MAME Options', 'LabelOverlay', 'Overlay');
    Backdrop.Caption:= LanguageFile.ReadString('MAME Options', 'LabelBackdrop', 'Backdrop');
    Bezel.Caption:= LanguageFile.ReadString('MAME Options', 'LabelBezel', 'Bezel');
    Crop.Caption:= LanguageFile.ReadString('MAME Options', 'LabelCrop', 'Crop');
    LabelArtworkResolution.Caption:= LanguageFile.ReadString('MAME Options', 'LabelArtworkResolution', 'Artwork Resolution');

    Artwork.Hint:= LanguageFile.ReadString('MAME Options', 'ArtworkHint', 'Use additional game artwork');
    Overlay.Hint:= LanguageFile.ReadString('MAME Options', 'OverlayHint', 'Use overlay artwork');
    Backdrop.Hint:= LanguageFile.ReadString('MAME Options', 'BackdropHint', 'Use backdrop artwork');
    Bezel.Hint:= LanguageFile.ReadString('MAME Options', 'BezelHint', 'Use bezel artwork');
    Crop.Hint:= LanguageFile.ReadString('MAME Options', 'CropHint', 'Crop artwork to game screen only');
    ArtworkResolution.Hint:= LanguageFile.ReadString('MAME Options', 'ArtworkResolutionHint', 'Artwork resolution');

    // "Folders" tab
    // "Folders" Options & Labels
    LabelFolderROMs.Caption:= LanguageFile.ReadString('MAME Options', 'LabelROMsFolder', 'ROMs');
    LabelFolderSamples.Caption:= LanguageFile.ReadString('MAME Options', 'LabelSamplesFolder', 'Samples');
    LabelFolderGamesConfiguration.Caption:= LanguageFile.ReadString('MAME Options', 'LabelGamesConfigurationFolder', 'Games Configuration');
    LabelFolderSaveStates.Caption:= LanguageFile.ReadString('MAME Options', 'LabelSaveStateFolder', 'Save States');
    LabelFolderHighScores.Caption:= LanguageFile.ReadString('MAME Options', 'LabelHighScoresFolder', 'High Scores');
    LabelFolderNVRAM.Caption:= LanguageFile.ReadString('MAME Options', 'LabelNVRAMFolder', 'NVRAM');
    LabelFolderMemoryCards.Caption:= LanguageFile.ReadString('MAME Options', 'LabelMemoryCardsFolder', 'Memory Cards');
    LabelFolderGamesRecording.Caption:= LanguageFile.ReadString('MAME Options', 'LabelInputsRecordingFolder', 'Inputs Recording');
    LabelFolderArtworks.Caption:= LanguageFile.ReadString('MAME Options', 'LabelArtworksFolder', 'Artworks');
    LabelFolderDiff.Caption:= LanguageFile.ReadString('MAME Options', 'LabelFolderDiff', 'Diff');
    LabelFolderInGameSnapshots.Caption:= LanguageFile.ReadString('MAME Options', 'LabelSnapshotsFolder', 'Snapshots');
    LabelFolderKeysMapping.Caption:= LanguageFile.ReadString('MAME Options', 'LabelKeysMapping', 'Keys Mapping');

    FolderROMs.Hint:= LanguageFile.ReadString('MAME Options', 'ROMsFolderHint', 'Path to romsets');
    FolderSamples.Hint:= LanguageFile.ReadString('MAME Options', 'SamplesFolderHint', 'Path to samplesets');
    FolderGamesConfiguration.Hint:= LanguageFile.ReadString('MAME Options', 'GamesConfigurationFolderHint', 'Directory to save configurations');
    FolderSaveStates.Hint:= LanguageFile.ReadString('MAME Options', 'SaveStateFolderHint', 'Directory to save states');
    FolderHighScores.Hint:= LanguageFile.ReadString('MAME Options', 'HighScoresFolderHint', 'Directory to save hiscores');
    FolderNVRAM.Hint:= LanguageFile.ReadString('MAME Options', 'NVRAMFolderHint', 'Directory to save nvram contents');
    FolderMemoryCards.Hint:= LanguageFile.ReadString('MAME Options', 'MemoryCardsFolderHint', 'Directory to save memory card contents');
    FolderInputsRecording.Hint:= LanguageFile.ReadString('MAME Options', 'InputsRecordingFolderHint', 'Directory for recordings');
    FolderArtworks.Hint:= LanguageFile.ReadString('MAME Options', 'ArtworksFolderHint', 'Directory for Artwork (Overlays etc.)');
    FolderDiff.Hint:= LanguageFile.ReadString('MAME Options', 'DiffFolderHint', 'Directory for hard drive image difference files');
    FolderSnapshots.Hint:= LanguageFile.ReadString('MAME Options', 'SnapshotsFolderHint', 'Directory for screenshots (.png format)');
    FolderKeysMapping.Hint:= LanguageFile.ReadString('MAME Options', 'KeysMappingHint', 'Directory for preconfigured controller keys');

    FolderROMsButtonSelect.Hint:= LanguageFile.ReadString('MAME Options', 'MultiButtonHint', 'Click here to select folders (can have more than one)');
    FolderSamplesButtonSelect.Hint:= LanguageFile.ReadString('MAME Options', 'SingleButtonHint', 'Click here to select a folder');
    FolderGamesConfigurationButtonSelect.Hint:= FolderSamplesButtonSelect.Hint;
    FolderSaveStatesButtonSelect.Hint:= FolderSamplesButtonSelect.Hint;
    FolderHighScoresButtonSelect.Hint:= FolderSamplesButtonSelect.Hint;
    FolderNVRAMButtonSelect.Hint:= FolderSamplesButtonSelect.Hint;
    FolderMemoryCardsButtonSelect.Hint:= FolderSamplesButtonSelect.Hint;
    FolderInputsRecordingButtonSelect.Hint:= FolderSamplesButtonSelect.Hint;
    FolderArtworksButtonSelect.Hint:= FolderSamplesButtonSelect.Hint;
    FolderDiffButtonSelect.Hint:= FolderSamplesButtonSelect.Hint;
    FolderSnapshotsButtonSelect.Hint:= FolderSamplesButtonSelect.Hint;
    FolderKeysMappingButtonSelect.Hint:= FolderSamplesButtonSelect.Hint;

    // Buttons
    ButtonOk.Caption:= LanguageFile.ReadString('Resource', 'ButtonOk', '&Ok');
    ButtonOk.Hint:= LanguageFile.ReadString('Resource', 'ButtonOkHint', 'Close and update settings');

    ButtonCancel.Caption:= LanguageFile.ReadString('Resource', 'ButtonCancel', 'C&ancel');
    ButtonCancel.Hint:= LanguageFile.ReadString('Resource', 'ButtonCancelHint', 'Close without updating');
  end;
  FreeAndNil(LanguageFile);
end;

procedure TFormMain.SetDOSMAMEConfigurationLanguage;
var
  LanguageFile: TMemIniFile;
begin
  if not FileExists(FrontendPath+'resources\language\'+FrontendLanguage+'.lng') then
     Exit;

  LanguageFile:= TMemIniFile.Create(FrontendPath+'resources\language\'+FrontendLanguage+'.lng');

  with FormDOSMAMEConfiguration do
  begin
    // Screen Title
    Caption:= LanguageFile.ReadString('MAME Options', 'DOSMAMEConfigurationTitle', 'DOS MAME Configuration');

    // I need to find a way to create only one procedure for all MAME Configuration screens, but Delphi doesn't
    // accept a Form name as an input :-(((

    // Main Tab Sheet's titles
    TabSheetDOSMAMEFolders.Caption:= LanguageFile.ReadString('MAME Options', 'TabSheetFoldersCaption', 'Folders');
    TabSheetDOSMAMEOptions.Caption:= LanguageFile.ReadString('MAME Options', 'TabSheetOptionsCaption', 'Options');

    TabSheetDOSMAMEDisplay.Caption:= LanguageFile.ReadString('MAME Options', 'TabSheetDisplay1Caption', 'Display');
    TabSheetDOSMAMEDisplay2.Caption:= LanguageFile.ReadString('MAME Options', 'TabSheetDisplay2Caption', 'Display 2');
    TabSheetDOSMAMESoundControllers.Caption:= LanguageFile.ReadString('MAME Options', 'TabSheetSoundControllersCaption', 'Sound / Controllers');
    TabSheetDOSMAMEMiscellaneous.Caption:= LanguageFile.ReadString('MAME Options', 'TabSheetMiscellaneousCaption', 'Miscellaneous');

    // Tab Sheet "Display" Label & Options
    LabelResolution.Caption:= LanguageFile.ReadString('MAME Options', 'LabelResolution', 'Resolution');
    LabelCustomResolution.Caption:= LanguageFile.ReadString('MAME Options', 'LabelCustomResolution', 'Custom Res');

    Resolution.Hint:= LanguageFile.ReadString('MAME Options', 'ResolutionHint', 'Specifies an exact resolution to run in');
    CustomResolution.Hint:= LanguageFile.ReadString('MAME Options', 'CustomResolutionHint', 'Specifies a custom resolution to run in');

    LabelDepth.Caption:= LanguageFile.ReadString('MAME Options', 'LabelDepth', 'Depth');
    LabelFrameSkip.Caption:= LanguageFile.ReadString('MAME Options', 'LabelFrameSkip', 'Frame Skip');
    LabelGamma.Caption:= LanguageFile.ReadString('MAME Options', 'LabelGamma', 'Gamma');

    Depth.Hint:= LanguageFile.ReadString('MAME Options', 'DepthHint', 'Specify the colordepth the core should render in bits per pixel (bpp)');
    FrameSkip.Hint:= LanguageFile.ReadString('MAME Options', 'FrameSkipHint', 'Set frameskip explicitly (autoframeskip needs to be off)');
    Gamma.Hint:= LanguageFile.ReadString('MAME Options', 'GammaHint', 'Set the global gamma correction in the game');

    LabelMonitor.Caption:= LanguageFile.ReadString('MAME Options', 'LabelMonitor', 'Monitor');
    LabelVESA.Caption:= LanguageFile.ReadString('MAME Options', 'LabelVesa', 'VESA');
    LabelDOSMAMEVGAFrequency.Caption:= LanguageFile.ReadString('MAME Options', 'LabelVGAFrequency', 'VGA Frequency');

    Monitor.Hint:= LanguageFile.ReadString('MAME Options', 'MonitorHint', 'Selects the monitor type');
    VESA.Hint:= LanguageFile.ReadString('MAME Options', 'VesaHint', 'Forces the VESA mode. The best available one is used by default');
    VGAFrequency.Hint:= LanguageFile.ReadString('MAME Options', 'VGAFrequencyHint', 'Specifies different frequencies for the custom video modes. WARNING: IT IS POSSIBLE TO SET FREQUENCIES WAY OUTSIDE OF YOUR MONITOR''S RANGE, WHICH COULD DAMAGE YOUR MONITOR. USE THIS OPTION AT YOUR OWN RISK!');

    LabelCenterX.Caption:= LanguageFile.ReadString('MAME Options', 'LabelCenterX', 'Center X');
    LabelCenterY.Caption:= LanguageFile.ReadString('MAME Options', 'LabelCenterY', 'Center Y');

    CenterX.Hint:= LanguageFile.ReadString('MAME Options', 'CenterXHint', 'Center screen horizontally');
    CenterY.Hint:= LanguageFile.ReadString('MAME Options', 'CenterYHint', 'Center screen vertically');

    LabelSkipColumns.Caption:= LanguageFile.ReadString('MAME Options', 'LabelSkipColumns', 'Skip Columns');
    LabelSkipLines.Caption:= LanguageFile.ReadString('MAME Options', 'LabelSkipLines', 'Skip Lines');

    SkipColumns.Hint:= LanguageFile.ReadString('MAME Options', 'SkipColumnsHint', 'Adjust horizontal screen position');
    SkipLines.Hint:= LanguageFile.ReadString('MAME Options', 'SkipLinesHint', 'Adjust vertical screen position');

    // "Visual Effects" Options & Labels
    TripleBuffer.Caption:= LanguageFile.ReadString('MAME Options', 'LabelTripleBuffer', 'Triple Buffer');
    NoRotate.Caption:= LanguageFile.ReadString('MAME Options', 'LabelNoRotate', 'No Rotate');
    RotateLeft.Caption:= LanguageFile.ReadString('MAME Options', 'LabelRotateLeft', 'Rotate Left');
    RotateRight.Caption:= LanguageFile.ReadString('MAME Options', 'LabelRotateRight', 'Rotate Right');
    WaitVSync.Caption:= LanguageFile.ReadString('MAME Options', 'LabelWaitVerticalSync', 'Wait Vertical Sync');
    VSync.Caption:= LanguageFile.ReadString('MAME Options', 'LabelVSync', 'Vertical Sync');
    LabelScanlines.Caption:= LanguageFile.ReadString('MAME Options', 'LabelScanlines', 'Scanlines');
    FlipX.Caption:= LanguageFile.ReadString('MAME Options', 'LabelFlipX', 'Flip X');
    FlipY.Caption:= LanguageFile.ReadString('MAME Options', 'LabelFlipY', 'Flip Y');

    Stretch.Caption:= LanguageFile.ReadString('MAME Options', 'LabelStretch', 'Stretch');
    AlwaysSynced.Caption:= LanguageFile.ReadString('MAME Options', 'LabelAlwaysSynced', 'Always Synced');
    WaitInterlace.Caption:= LanguageFile.ReadString('MAME Options', 'LabelWaitInterlace', 'Wait Interlace');
    LabelMMX.Caption:= LanguageFile.ReadString('MAME Options', 'LabelMMX', 'MMX');
    LabelDirty.Caption:= LanguageFile.ReadString('MAME Options', 'LabelDirty', 'Dirty');

    TripleBuffer.Hint:= LanguageFile.ReadString('MAME Options', 'TripleBufferHint', 'Enable/disable triple buffering (only if fullscreen)');
    NoRotate.Hint:= LanguageFile.ReadString('MAME Options', 'NoRotateHint', 'Do not apply rotation in screen');
    RotateLeft.Hint:= LanguageFile.ReadString('MAME Options', 'RotateLeftHint', 'Rotate screen anti-clockwise');
    RotateRight.Hint:= LanguageFile.ReadString('MAME Options', 'RotateRightHint', 'Rotate screen clockwise');
    WaitVSync.Hint:= LanguageFile.ReadString('MAME Options', 'WaitVerticalSyncHint', 'Wait for vertical syncronization to reduce tearing (direct draw must be on)');
    VSync.Hint:= LanguageFile.ReadString('MAME Options', 'VSyncHint', 'Synchronize video display with the video beam instead of using the timer');
    Scanlines.Hint:= LanguageFile.ReadString('MAME Options', 'ScanlinesHint', 'Emulate scanlines (hardware stretch needs to be off)');
    FlipX.Hint:= LanguageFile.ReadString('MAME Options', 'FlipXHint', 'Flip screen upside-down');
    FlipY.Hint:= LanguageFile.ReadString('MAME Options', 'FlipYHint', 'Flip screen left-right');

    Stretch.Hint:= LanguageFile.ReadString('MAME Options', 'StretchHint', 'Stretch video');
    AlwaysSynced.Hint:= LanguageFile.ReadString('MAME Options', 'AlwaysSyncedHint', 'Always syncronize video display');
    WaitInterlace.Hint:= LanguageFile.ReadString('MAME Options', 'WaitInterlaceHint', 'Forces update of both odd and even fields of an interlaced low scanrate display (monitor=ntsc,pal,arcade) for each game loop');
    MMX.Hint:= LanguageFile.ReadString('MAME Options', 'MMXHint', 'Use Intel''s MMX instructions to speed up emulation (only if available)');
    Dirty.Hint:= LanguageFile.ReadString('MAME Options', 'DirtyHint', 'Enable dirty video optimization (speeds up vector games tremendously)');

    LabelDebuggerResolution.Caption:= LanguageFile.ReadString('MAME Options', 'LabelDebuggerResolution', 'Debugger Resolution');
    LabelBrightness.Caption:= LanguageFile.ReadString('MAME Options', 'LabelBrightness', 'Brightness');
    LabelPauseBrightness.Caption:= LanguageFile.ReadString('MAME Options', 'LabelPauseBrightness', 'Pause Brightness');

    DebuggerResolution.Hint:= LanguageFile.ReadString('MAME Options', 'DebuggerResolutionHint', 'Set resolution for debugger window (run in window must be on)');
    Brightness.Hint:= LanguageFile.ReadString('MAME Options', 'BrightnessHint', 'Brightness correction');
    PauseBrightness.Hint:= LanguageFile.ReadString('MAME Options', 'PauseBrightnessHint', 'Additional pause brightness');

    // Vector options
    LabelVector.Caption:= LanguageFile.ReadString('MAME Options', 'LabelVectorFrameBox', 'Vector');
    Antialias.Caption:= LanguageFile.ReadString('MAME Options', 'LabelAntialias', 'Antialias');
    Translucency.Caption:= LanguageFile.ReadString('MAME Options', 'LabelTranslucency', 'Translucency');
    LabelFlicker.Caption:= LanguageFile.ReadString('MAME Options', 'LabelFlicker', 'Flicker');
    LabelBeam.Caption:= LanguageFile.ReadString('MAME Options', 'LabelBeam', 'Beam');
    LabelIntensity.Caption:= LanguageFile.ReadString('MAME Options', 'LabelIntensity', 'Intensity');
    LabelVectorResolution.Caption:= LanguageFile.ReadString('MAME Options', 'LabelVectorResolution', 'Vector Resolution');

    Antialias.Hint:= LanguageFile.ReadString('MAME Options', 'AntialiasHint', 'Draw antialiased vectors');
    Translucency.Hint:= LanguageFile.ReadString('MAME Options', 'TranslucencyHint', 'Draw translucent vectors');
    Flicker.Hint:= LanguageFile.ReadString('MAME Options', 'FlickerHint', 'Set flickering in vector games');
    Beam.Hint:= LanguageFile.ReadString('MAME Options', 'BeamHint', 'Set beam width in vector games');
    Intensity.Hint:= LanguageFile.ReadString('MAME Options', 'IntensityHint', 'Set intensity in vector games');
    VectorResolution.Hint:= LanguageFile.ReadString('MAME Options', 'VectorResolutionHint', 'Set vector resolution');

    // "Sound" Options & Labels
    LabelSound.Caption:= LanguageFile.ReadString('MAME Options', 'LabelSound', 'Sound');
    LabelSoundCard.Caption:= LanguageFile.ReadString('MAME Options', 'LabelSoundCard', 'Sound Card');
    Sound.Caption:= LanguageFile.ReadString('MAME Options', 'LabelSound', 'Sound');
    LabelSampleRate.Caption:= LanguageFile.ReadString('MAME Options', 'LabelSampleRate', 'Sample Rate');
    LabelCustomSampleRate.Caption:= LanguageFile.ReadString('MAME Options', 'LabelCustomSampleRate', 'Custom SR');
    LabelVolume.Caption:= LanguageFile.ReadString('MAME Options', 'LabelVolume', 'Volume');
    Stereo.Caption:= LanguageFile.ReadString('MAME Options', 'LabelStereo', 'Stereo');
    Samples.Caption:= LanguageFile.ReadString('MAME Options', 'LabelSamples', 'Samples');
    ResampleFilter.Caption:= LanguageFile.ReadString('MAME Options', 'LabelResampleFilter', 'Resample Filter');
    DetectSampleRate.Caption:= LanguageFile.ReadString('MAME Options', 'LabelDetectSampleRate', 'Detect Sample Rate');

    SoundCard.Hint:= LanguageFile.ReadString('MAME Options', 'SoundCardHint', 'Selects sound card (If this is not specified, MAME will ask you)');
    Sound.Hint:= LanguageFile.ReadString('MAME Options', 'SoundHint', 'Enable/disable sound and sound CPUs');
    SampleRate.Hint:= LanguageFile.ReadString('MAME Options', 'SampleRateHint', 'Set samplerate');
    CustomSampleRate.Hint:= LanguageFile.ReadString('MAME Options', 'CustomSampleRateHint', 'Set a custom samplerate (will override samplerate)');
    Volume.Hint:= LanguageFile.ReadString('MAME Options', 'VolumeHint', 'Volume attenuation (in dB)');
    Stereo.Hint:= LanguageFile.ReadString('MAME Options', 'StereoHint', 'Selects stereo or mono output for games supporting stereo sound');
    Samples.Hint:= LanguageFile.ReadString('MAME Options', 'SamplesHint', 'Use of samples files');
    ResampleFilter.Hint:= LanguageFile.ReadString('MAME Options', 'ResampleFilterHint', 'Resample if samplerate does not match');
    DetectSampleRate.Hint:= LanguageFile.ReadString('MAME Options', 'DetectSampleRateHint', 'Use correct games''s sample rate');

    // "Controllers" Options & Labels
    LabelControllers.Caption:= LanguageFile.ReadString('MAME Options', 'LabelControllerFrameBox', 'Controllers');

    LabelJoystick.Caption:= LanguageFile.ReadString('MAME Options', 'LabelJoystick', 'Joystick');
    Mouse.Caption:= LanguageFile.ReadString('MAME Options', 'LabelMouse', 'Mouse');
    SteadyKey.Caption:= LanguageFile.ReadString('MAME Options', 'LabelSteadyKey', 'Steady Key');
    KeyboardLEDs.Caption:= LanguageFile.ReadString('MAME Options', 'LabelKeyboardLEDs', 'Keyboard LEDs');
    LabelControllerKeysMapping.Caption:= LanguageFile.ReadString('MAME Options', 'LabelKeysMapping', 'Keys Mapping');

    Joystick.Hint:= LanguageFile.ReadString('MAME Options', 'JoystickHint', 'Enable joystick input');
    Mouse.Hint:= LanguageFile.ReadString('MAME Options', 'MouseHint', 'Enable mouse input (Windows mouse will be unavailable)');
    SteadyKey.Hint:= LanguageFile.ReadString('MAME Options', 'SteadyKeyHint', 'It selects a different handling for simultaneous button presses but the controls are less responsive');
    KeyboardLEDs.Hint:= LanguageFile.ReadString('MAME Options', 'KeyboardLEDsHint', 'Enable keyboard LED emulation');
    ControllerKeysMapping.Hint:= LanguageFile.ReadString('MAME Options', 'ControllerKeysMappingHint', 'Pre-configure for specified controller');

    // "Tweaks" Options & Labels
    LabelTweaks.Caption:= LanguageFile.ReadString('MAME Options', 'LabelTweaksFrameBox', 'Tweaks');

    Throttle.Caption:= LanguageFile.ReadString('MAME Options', 'LabelThrottle', 'Throttle');
    Cheat.Caption:= LanguageFile.ReadString('MAME Options', 'LabelCheat', 'Cheat');
    Tweak.Caption:= LanguageFile.ReadString('MAME Options', 'LabelTweak', 'Tweak');
    SkipDisclaimer.Caption:= LanguageFile.ReadString('MAME Options', 'LabelSkipDisclaimer', 'Skip Disclaimer');
    SkipGameInfo.Caption:= LanguageFile.ReadString('MAME Options', 'LabelSkipGameInfo', 'Skip Game Info');

    Throttle.Hint:= LanguageFile.ReadString('MAME Options', 'ThrottleHint', 'Throttle speed to the game''s framerate');
    Cheat.Hint:= LanguageFile.ReadString('MAME Options', 'CheatHint', 'Enable/disable cheat subsystem');
    Tweak.Hint:= LanguageFile.ReadString('MAME Options', 'TweakHint', 'Use tweaked VGA modes whose resolutions matching those of the emulated games');
    SkipDisclaimer.Hint:= LanguageFile.ReadString('MAME Options', 'SkipDisclaimerHint', 'Skip displaying the disclaimer screen');
    SkipGameInfo.Hint:= LanguageFile.ReadString('MAME Options', 'SkipGameInfoHint', 'Skip displaying the game info screen');

    // "External Files" Options & Labels
    LabelExternalFiles.Caption:= LanguageFile.ReadString('MAME Options', 'LabelExternalFilesFrameBox', 'External Files');

    LabelCheatFile.Caption:= LanguageFile.ReadString('MAME Options', 'LabelCheatFile', 'Cheat File');
    LabelMAMEInfoFile.Caption:= LanguageFile.ReadString('MAME Options', 'LabelMAMEInfoFile', 'Info File');
    LabelHistoryFile.Caption:= LanguageFile.ReadString('MAME Options', 'LabelHistoryFile', 'History File');

    FilenameCheat.Hint:= LanguageFile.ReadString('MAME Options', 'CheatFileHint', 'Select a cheat filename');
    FilenameMAMEInfo.Hint:= LanguageFile.ReadString('MAME Options', 'MAMEInfoFileHint', 'Select a mameinfo filename');
    FilenameHistory.Hint:= LanguageFile.ReadString('MAME Options', 'HistoryFileHint', 'Select a history filename');

    FilenameCheatButtonSelect.Hint:= LanguageFile.ReadString('MAME Options', 'CheatFileButtonHint', 'Click here to select a cheat file');
    FilenameMAMEInfoButtonSelect.Hint:= LanguageFile.ReadString('MAME Options', 'MAMEInfoFileButtonHint', 'Click here to select a mameinfo file');
    FilenameHistoryButtonSelect.Hint:= LanguageFile.ReadString('MAME Options', 'HistoryFileButtonHint', 'Click here to select a history file');

    LabelArtwork.Caption:= LanguageFile.ReadString('MAME Options', 'LabelArtworkFrameBox', 'Artwork');
    Artwork.Caption:= LanguageFile.ReadString('MAME Options', 'LabelArtwork', 'Artwork');
    Overlay.Caption:= LanguageFile.ReadString('MAME Options', 'LabelOverlay', 'Overlay');
    Backdrop.Caption:= LanguageFile.ReadString('MAME Options', 'LabelBackdrop', 'Backdrop');
    Bezel.Caption:= LanguageFile.ReadString('MAME Options', 'LabelBezel', 'Bezel');
    Crop.Caption:= LanguageFile.ReadString('MAME Options', 'LabelCrop', 'Crop');
    LabelArtworkResolution.Caption:= LanguageFile.ReadString('MAME Options', 'LabelArtworkResolution', 'Artwork Resolution');

    Artwork.Hint:= LanguageFile.ReadString('MAME Options', 'ArtworkHint', 'Use additional game artwork');
    Overlay.Hint:= LanguageFile.ReadString('MAME Options', 'OverlayHint', 'Use overlay artwork');
    Backdrop.Hint:= LanguageFile.ReadString('MAME Options', 'BackdropHint', 'Use backdrop artwork');
    Bezel.Hint:= LanguageFile.ReadString('MAME Options', 'BezelHint', 'Use bezel artwork');
    Crop.Hint:= LanguageFile.ReadString('MAME Options', 'CropHint', 'Crop artwork to game screen only');
    ArtworkResolution.Hint:= LanguageFile.ReadString('MAME Options', 'ArtworkResolutionHint', 'Artwork resolution');

    // "Folders" tab
    // "Folders" Options & Labels
    LabelFolderROMs.Caption:= LanguageFile.ReadString('MAME Options', 'LabelROMsFolder', 'ROMs');
    LabelFolderSamples.Caption:= LanguageFile.ReadString('MAME Options', 'LabelSamplesFolder', 'Samples');
    LabelFolderGamesConfiguration.Caption:= LanguageFile.ReadString('MAME Options', 'LabelGamesConfigurationFolder', 'Games Configuration');
    LabelFolderSaveStates.Caption:= LanguageFile.ReadString('MAME Options', 'LabelSaveStateFolder', 'Save States');
    LabelFolderHighScores.Caption:= LanguageFile.ReadString('MAME Options', 'LabelHighScoresFolder', 'High Scores');
    LabelFolderNVRAM.Caption:= LanguageFile.ReadString('MAME Options', 'LabelNVRAMFolder', 'NVRAM');
    LabelFolderMemoryCards.Caption:= LanguageFile.ReadString('MAME Options', 'LabelMemoryCardsFolder', 'Memory Cards');
    LabelFolderGamesRecording.Caption:= LanguageFile.ReadString('MAME Options', 'LabelInputsRecordingFolder', 'Inputs Recording');
    LabelFolderArtworks.Caption:= LanguageFile.ReadString('MAME Options', 'LabelArtworksFolder', 'Artworks');
    LabelFolderInGameSnapshots.Caption:= LanguageFile.ReadString('MAME Options', 'LabelSnapshotsFolder', 'Snapshots');
    LabelFolderCheats.Caption:= LanguageFile.ReadString('MAME Options', 'LabelCheatsFolder', 'Cheats');
    LabelFolderDiff.Caption:= LanguageFile.ReadString('MAME Options', 'LabelFolderDiff', 'Diff');
    LabelFolderKeysMapping.Caption:= LanguageFile.ReadString('MAME Options', 'LabelKeysMapping', 'Keys Mapping');

    FolderROMs.Hint:= LanguageFile.ReadString('MAME Options', 'ROMsFolderHint', 'Path to romsets');
    FolderSamples.Hint:= LanguageFile.ReadString('MAME Options', 'SamplesFolderHint', 'Path to samplesets');
    FolderGamesConfiguration.Hint:= LanguageFile.ReadString('MAME Options', 'GamesConfigurationFolderHint', 'Directory to save configurations');
    FolderSaveStates.Hint:= LanguageFile.ReadString('MAME Options', 'SaveStateFolderHint', 'Directory to save states');
    FolderHighScores.Hint:= LanguageFile.ReadString('MAME Options', 'HighScoresFolderHint', 'Directory to save hiscores');
    FolderNVRAM.Hint:= LanguageFile.ReadString('MAME Options', 'NVRAMFolderHint', 'Directory to save nvram contents');
    FolderMemoryCards.Hint:= LanguageFile.ReadString('MAME Options', 'MemoryCardsFolderHint', 'Directory to save memory card contents');
    FolderInputsRecording.Hint:= LanguageFile.ReadString('MAME Options', 'InputsRecordingFolderHint', 'Directory for recordings');
    FolderArtworks.Hint:= LanguageFile.ReadString('MAME Options', 'ArtworksFolderHint', 'Directory for Artwork (Overlays etc.)');
    FolderSnapshots.Hint:= LanguageFile.ReadString('MAME Options', 'SnapshotsFolderHint', 'Directory for screenshots (.png format)');
    FolderCheats.Hint:= LanguageFile.ReadString('MAME Options', 'CheatsFolderHint', 'Directory for cheatfiles');
    FolderDiff.Hint:= LanguageFile.ReadString('MAME Options', 'DiffFolderHint', 'Directory for hard drive image difference files');
    FolderKeysMapping.Hint:= LanguageFile.ReadString('MAME Options', 'KeysMappingHint', 'Directory for preconfigured controller keys');

    FolderROMsButtonSelect.Hint:= LanguageFile.ReadString('MAME Options', 'MultiButtonHint', 'Click here to select folders (can have more than one)');
    FolderSamplesButtonSelect.Hint:= LanguageFile.ReadString('MAME Options', 'SingleButtonHint', 'Click here to select a folder');
    FolderGamesConfigurationButtonSelect.Hint:= FolderSamplesButtonSelect.Hint;
    FolderSaveStatesButtonSelect.Hint:= FolderSamplesButtonSelect.Hint;
    FolderHighScoresButtonSelect.Hint:= FolderSamplesButtonSelect.Hint;
    FolderNVRAMButtonSelect.Hint:= FolderSamplesButtonSelect.Hint;
    FolderMemoryCardsButtonSelect.Hint:= FolderSamplesButtonSelect.Hint;
    FolderInputsRecordingButtonSelect.Hint:= FolderSamplesButtonSelect.Hint;
    FolderArtworksButtonSelect.Hint:= FolderSamplesButtonSelect.Hint;
    FolderSnapshotsButtonSelect.Hint:= FolderSamplesButtonSelect.Hint;
    FolderCheatsButtonSelect.Hint:= FolderROMsButtonSelect.Hint;
    FolderDiffButtonSelect.Hint:= FolderSamplesButtonSelect.Hint;
    FolderKeysMappingButtonSelect.Hint:= FolderSamplesButtonSelect.Hint;

    // Buttons
    ButtonOk.Caption:= LanguageFile.ReadString('Resource', 'ButtonOk', '&Ok');
    ButtonOk.Hint:= LanguageFile.ReadString('Resource', 'ButtonOkHint', 'Close and update settings');

    ButtonCancel.Caption:= LanguageFile.ReadString('Resource', 'ButtonCancel', 'C&ancel');
    ButtonCancel.Hint:= LanguageFile.ReadString('Resource', 'ButtonCancelHint', 'Close without updating');
  end;
  FreeAndNil(LanguageFile);
end;

procedure TFormMain.SetDOSMAMECustomConfigurationLanguage;
var
  LanguageFile: TMemIniFile;
begin
  if not FileExists(FrontendPath+'resources\language\'+FrontendLanguage+'.lng') then
     Exit;

  LanguageFile:= TMemIniFile.Create(FrontendPath+'resources\language\'+FrontendLanguage+'.lng');

  with FormDOSMAMECustomConfiguration do
  begin
    // Screen Title
    Caption:= LanguageFile.ReadString('MAME Options', 'DOSMAMECustomConfigurationTitle', 'DOS MAME Custom Configuration');

    // Main Tab Sheet's titles
    TabSheetDOSMAMEOptions.Caption:= LanguageFile.ReadString('MAME Options', 'TabSheetOptionsCaption', 'Options');
    TabSheetDOSMAMEDisplay.Caption:= LanguageFile.ReadString('MAME Options', 'TabSheetDisplay1Caption', 'Display');
    TabSheetDOSMAMEDisplay2.Caption:= LanguageFile.ReadString('MAME Options', 'TabSheetDisplay2Caption', 'Display 2');
    TabSheetDOSMAMESoundControllers.Caption:= LanguageFile.ReadString('MAME Options', 'TabSheetSoundControllersCaption', 'Sound / Controllers');
    TabSheetDOSMAMEMiscellaneous.Caption:= LanguageFile.ReadString('MAME Options', 'TabSheetMiscellaneousCaption', 'Miscellaneous');

    // Tab Sheet "Display" Label & Options
    LabelResolution.Caption:= LanguageFile.ReadString('MAME Options', 'LabelResolution', 'Resolution');
    LabelCustomResolution.Caption:= LanguageFile.ReadString('MAME Options', 'LabelCustomResolution', 'Custom Res');

    Resolution.Hint:= LanguageFile.ReadString('MAME Options', 'ResolutionHint', 'Specifies an exact resolution to run in');
    CustomResolution.Hint:= LanguageFile.ReadString('MAME Options', 'CustomResolutionHint', 'Specifies a custom resolution to run in');

    LabelDepth.Caption:= LanguageFile.ReadString('MAME Options', 'LabelDepth', 'Depth');
    LabelFrameSkip.Caption:= LanguageFile.ReadString('MAME Options', 'LabelFrameSkip', 'Frame Skip');
    LabelGamma.Caption:= LanguageFile.ReadString('MAME Options', 'LabelGamma', 'Gamma');

    Depth.Hint:= LanguageFile.ReadString('MAME Options', 'DepthHint', 'Specify the colordepth the core should render in bits per pixel (bpp)');
    FrameSkip.Hint:= LanguageFile.ReadString('MAME Options', 'FrameSkipHint', 'Set frameskip explicitly (autoframeskip needs to be off)');
    Gamma.Hint:= LanguageFile.ReadString('MAME Options', 'GammaHint', 'Set the global gamma correction in the game');

    LabelMonitor.Caption:= LanguageFile.ReadString('MAME Options', 'LabelMonitor', 'Monitor');
    LabelVESA.Caption:= LanguageFile.ReadString('MAME Options', 'LabelVesa', 'VESA');
    LabelVGAFrequency.Caption:= LanguageFile.ReadString('MAME Options', 'LabelVGAFrequency', 'VGA Frequency');

    Monitor.Hint:= LanguageFile.ReadString('MAME Options', 'MonitorHint', 'Selects the monitor type');
    VESA.Hint:= LanguageFile.ReadString('MAME Options', 'VesaHint', 'Forces the VESA mode. The best available one is used by default');
    VGAFrequency.Hint:= LanguageFile.ReadString('MAME Options', 'VGAFrequencyHint', 'Specifies different frequencies for the custom video modes. WARNING: IT IS POSSIBLE TO SET FREQUENCIES WAY OUTSIDE OF YOUR MONITOR''S RANGE, WHICH COULD DAMAGE YOUR MONITOR. USE THIS OPTION AT YOUR OWN RISK!');

    LabelCenterX.Caption:= LanguageFile.ReadString('MAME Options', 'LabelCenterX', 'Center X');
    LabelCenterY.Caption:= LanguageFile.ReadString('MAME Options', 'LabelCenterY', 'Center Y');

    CenterX.Hint:= LanguageFile.ReadString('MAME Options', 'CenterXHint', 'Center screen horizontally');
    CenterY.Hint:= LanguageFile.ReadString('MAME Options', 'CenterYHint', 'Center screen vertically');

    LabelSkipColumns.Caption:= LanguageFile.ReadString('MAME Options', 'LabelSkipColumns', 'Skip Columns');
    LabelSkipLines.Caption:= LanguageFile.ReadString('MAME Options', 'LabelSkipLines', 'Skip Lines');

    SkipColumns.Hint:= LanguageFile.ReadString('MAME Options', 'SkipColumnsHint', 'Adjust horizontal screen position');
    SkipLines.Hint:= LanguageFile.ReadString('MAME Options', 'SkipLinesHint', 'Adjust vertical screen position');

    // "Visual Effects" Options & Labels
    TripleBuffer.Caption:= LanguageFile.ReadString('MAME Options', 'LabelTripleBuffer', 'Triple Buffer');
    NoRotate.Caption:= LanguageFile.ReadString('MAME Options', 'LabelNoRotate', 'No Rotate');
    RotateLeft.Caption:= LanguageFile.ReadString('MAME Options', 'LabelRotateLeft', 'Rotate Left');
    RotateRight.Caption:= LanguageFile.ReadString('MAME Options', 'LabelRotateRight', 'Rotate Right');
    WaitVSync.Caption:= LanguageFile.ReadString('MAME Options', 'LabelWaitVerticalSync', 'Wait Vertical Sync');
    LabelScanlines.Caption:= LanguageFile.ReadString('MAME Options', 'LabelScanlines', 'Scanlines');
    FlipX.Caption:= LanguageFile.ReadString('MAME Options', 'LabelFlipX', 'Flip X');
    FlipY.Caption:= LanguageFile.ReadString('MAME Options', 'LabelFlipY', 'Flip Y');

    Stretch.Caption:= LanguageFile.ReadString('MAME Options', 'LabelStretch', 'Stretch');
    WaitVSync.Caption:= LanguageFile.ReadString('MAME Options', 'LabelWaitVerticalSync', 'Wait Vertical Sync');
    VSync.Caption:= LanguageFile.ReadString('MAME Options', 'LabelVSync', 'Vertical Sync');
    AlwaysSynced.Caption:= LanguageFile.ReadString('MAME Options', 'LabelAlwaysSynced', 'Always Synced');
    WaitInterlace.Caption:= LanguageFile.ReadString('MAME Options', 'LabelWaitInterlace', 'Wait Interlace');
    LabelMMX.Caption:= LanguageFile.ReadString('MAME Options', 'LabelMMX', 'MMX');
    LabelDirty.Caption:= LanguageFile.ReadString('MAME Options', 'LabelDirty', 'Dirty');

    TripleBuffer.Hint:= LanguageFile.ReadString('MAME Options', 'TripleBufferHint', 'Enable/disable triple buffering (only if fullscreen)');
    NoRotate.Hint:= LanguageFile.ReadString('MAME Options', 'NoRotateHint', 'Do not apply rotation in screen');
    RotateLeft.Hint:= LanguageFile.ReadString('MAME Options', 'RotateLeftHint', 'Rotate screen anti-clockwise');
    RotateRight.Hint:= LanguageFile.ReadString('MAME Options', 'RotateRightHint', 'Rotate screen clockwise');
    WaitVSync.Hint:= LanguageFile.ReadString('MAME Options', 'WaitVerticalSyncHint', 'Wait for vertical syncronization to reduce tearing (direct draw must be on)');
    VSync.Hint:= LanguageFile.ReadString('MAME Options', 'VSyncHint', 'Synchronize video display with the video beam instead of using the timer');
    Scanlines.Hint:= LanguageFile.ReadString('MAME Options', 'ScanlinesHint', 'Emulate scanlines (hardware stretch needs to be off)');
    FlipX.Hint:= LanguageFile.ReadString('MAME Options', 'FlipXHint', 'Flip screen upside-down');
    FlipY.Hint:= LanguageFile.ReadString('MAME Options', 'FlipYHint', 'Flip screen left-right');

    Stretch.Hint:= LanguageFile.ReadString('MAME Options', 'StretchHint', 'Stretch video');
    WaitVSync.Hint:= LanguageFile.ReadString('MAME Options', 'WaitVerticalSyncHint', 'Synchronize video display with the video beam instead of using the timer');
    AlwaysSynced.Hint:= LanguageFile.ReadString('MAME Options', 'AlwaysSyncedHint', 'Always syncronize video display');
    WaitInterlace.Hint:= LanguageFile.ReadString('MAME Options', 'WaitInterlaceHint', 'Forces update of both odd and even fields of an interlaced low scanrate display (monitor=ntsc,pal,arcade) for each game loop');
    MMX.Hint:= LanguageFile.ReadString('MAME Options', 'MMXHint', 'Use Intel''s MMX instructions to speed up emulation (only if available)');
    Dirty.Hint:= LanguageFile.ReadString('MAME Options', 'DirtyHint', 'Enable dirty video optimization (speeds up vector games tremendously)');

    LabelDebuggerResolution.Caption:= LanguageFile.ReadString('MAME Options', 'LabelDebuggerResolution', 'Debugger Resolution');
    LabelBrightness.Caption:= LanguageFile.ReadString('MAME Options', 'LabelBrightness', 'Brightness');
    LabelPauseBrightness.Caption:= LanguageFile.ReadString('MAME Options', 'LabelPauseBrightness', 'Pause Brightness');

    DebuggerResolution.Hint:= LanguageFile.ReadString('MAME Options', 'DebuggerResolutionHint', 'Set resolution for debugger window (run in window must be on)');
    Brightness.Hint:= LanguageFile.ReadString('MAME Options', 'BrightnessHint', 'Brightness correction');
    PauseBrightness.Hint:= LanguageFile.ReadString('MAME Options', 'PauseBrightnessHint', 'Additional pause brightness');

    // Vector options
    LabelVector.Caption:= LanguageFile.ReadString('MAME Options', 'LabelVectorFrameBox', 'Vector');
    Antialias.Caption:= LanguageFile.ReadString('MAME Options', 'LabelAntialias', 'Antialias');
    Translucency.Caption:= LanguageFile.ReadString('MAME Options', 'LabelTranslucency', 'Translucency');
    LabelFlicker.Caption:= LanguageFile.ReadString('MAME Options', 'LabelFlicker', 'Flicker');
    LabelBeam.Caption:= LanguageFile.ReadString('MAME Options', 'LabelBeam', 'Beam');
    LabelIntensity.Caption:= LanguageFile.ReadString('MAME Options', 'LabelIntensity', 'Intensity');
    LabelVectorResolution.Caption:= LanguageFile.ReadString('MAME Options', 'LabelVectorResolution', 'Vector Resolution');

    Antialias.Hint:= LanguageFile.ReadString('MAME Options', 'AntialiasHint', 'Draw antialiased vectors');
    Translucency.Hint:= LanguageFile.ReadString('MAME Options', 'TranslucencyHint', 'Draw translucent vectors');
    Flicker.Hint:= LanguageFile.ReadString('MAME Options', 'FlickerHint', 'Set flickering in vector games');
    Beam.Hint:= LanguageFile.ReadString('MAME Options', 'BeamHint', 'Set beam width in vector games');
    Intensity.Hint:= LanguageFile.ReadString('MAME Options', 'IntensityHint', 'Set intensity in vector games');
    VectorResolution.Hint:= LanguageFile.ReadString('MAME Options', 'VectorResolutionHint', 'Set vector resolution');

    // "Sound" Options & Labels
    LabelSound.Caption:= LanguageFile.ReadString('MAME Options', 'LabelSound', 'Sound');
    LabelSoundCard.Caption:= LanguageFile.ReadString('MAME Options', 'LabelSoundCard', 'Sound Card');
    Sound.Caption:= LanguageFile.ReadString('MAME Options', 'LabelSound', 'Sound');
    LabelSampleRate.Caption:= LanguageFile.ReadString('MAME Options', 'LabelSampleRate', 'Sample Rate');
    LabelCustomSampleRate.Caption:= LanguageFile.ReadString('MAME Options', 'LabelCustomSampleRate', 'Custom SR');
    LabelVolume.Caption:= LanguageFile.ReadString('MAME Options', 'LabelVolume', 'Volume');
    Stereo.Caption:= LanguageFile.ReadString('MAME Options', 'LabelStereo', 'Stereo');
    Samples.Caption:= LanguageFile.ReadString('MAME Options', 'LabelSamples', 'Samples');
    ResampleFilter.Caption:= LanguageFile.ReadString('MAME Options', 'LabelResampleFilter', 'Resample Filter');
    DetectSampleRate.Caption:= LanguageFile.ReadString('MAME Options', 'LabelDetectSampleRate', 'Detect Sample Rate');

    SoundCard.Hint:= LanguageFile.ReadString('MAME Options', 'SoundCardHint', 'Selects sound card (If this is not specified, MAME will ask you)');
    Sound.Hint:= LanguageFile.ReadString('MAME Options', 'SoundHint', 'Enable/disable sound and sound CPUs');
    SampleRate.Hint:= LanguageFile.ReadString('MAME Options', 'SampleRateHint', 'Set samplerate');
    CustomSampleRate.Hint:= LanguageFile.ReadString('MAME Options', 'CustomSampleRateHint', 'Set a custom samplerate (will override samplerate)');
    Volume.Hint:= LanguageFile.ReadString('MAME Options', 'VolumeHint', 'Volume attenuation (in dB)');
    Stereo.Hint:= LanguageFile.ReadString('MAME Options', 'StereoHint', 'Selects stereo or mono output for games supporting stereo sound');
    Samples.Hint:= LanguageFile.ReadString('MAME Options', 'SamplesHint', 'Use of samples files');
    ResampleFilter.Hint:= LanguageFile.ReadString('MAME Options', 'ResampleFilterHint', 'Resample if samplerate does not match');
    DetectSampleRate.Hint:= LanguageFile.ReadString('MAME Options', 'DetectSampleRateHint', 'Use correct games''s sample rate');

    // "Controllers" Options & Labels
    LabelControllers.Caption:= LanguageFile.ReadString('MAME Options', 'LabelControllerFrameBox', 'Controllers');

    LabelJoystick.Caption:= LanguageFile.ReadString('MAME Options', 'LabelJoystick', 'Joystick');
    Mouse.Caption:= LanguageFile.ReadString('MAME Options', 'LabelMouse', 'Mouse');
    SteadyKey.Caption:= LanguageFile.ReadString('MAME Options', 'LabelSteadyKey', 'Steady Key');
    KeyboardLEDs.Caption:= LanguageFile.ReadString('MAME Options', 'LabelKeyboardLEDs', 'Keyboard LEDs');

    Joystick.Hint:= LanguageFile.ReadString('MAME Options', 'JoystickHint', 'Enable joystick input');
    Mouse.Hint:= LanguageFile.ReadString('MAME Options', 'MouseHint', 'Enable mouse input (Windows mouse will be unavailable)');
    SteadyKey.Hint:= LanguageFile.ReadString('MAME Options', 'SteadyKeyHint', 'It selects a different handling for simultaneous button presses but the controls are less responsive');
    KeyboardLEDs.Hint:= LanguageFile.ReadString('MAME Options', 'KeyboardLEDsHint', 'Enable keyboard LED emulation');

    LabelArtwork.Caption:= LanguageFile.ReadString('MAME Options', 'LabelArtworkFrameBox', 'Artwork');
    Artwork.Caption:= LanguageFile.ReadString('MAME Options', 'LabelArtwork', 'Artwork');
    Overlay.Caption:= LanguageFile.ReadString('MAME Options', 'LabelOverlay', 'Overlay');
    Backdrop.Caption:= LanguageFile.ReadString('MAME Options', 'LabelBackdrop', 'Backdrop');
    Bezel.Caption:= LanguageFile.ReadString('MAME Options', 'LabelBezel', 'Bezel');
    Crop.Caption:= LanguageFile.ReadString('MAME Options', 'LabelCrop', 'Crop');
    LabelArtworkResolution.Caption:= LanguageFile.ReadString('MAME Options', 'LabelArtworkResolution', 'Artwork Resolution');

    Artwork.Hint:= LanguageFile.ReadString('MAME Options', 'ArtworkHint', 'Use additional game artwork');
    Overlay.Hint:= LanguageFile.ReadString('MAME Options', 'OverlayHint', 'Use overlay artwork');
    Backdrop.Hint:= LanguageFile.ReadString('MAME Options', 'BackdropHint', 'Use backdrop artwork');
    Bezel.Hint:= LanguageFile.ReadString('MAME Options', 'BezelHint', 'Use bezel artwork');
    Crop.Hint:= LanguageFile.ReadString('MAME Options', 'CropHint', 'Crop artwork to game screen only');
    ArtworkResolution.Hint:= LanguageFile.ReadString('MAME Options', 'ArtworkResolutionHint', 'Artwork resolution');

    // "Tweaks" Options & Labels
    LabelTweaks.Caption:= LanguageFile.ReadString('MAME Options', 'LabelTweaksFrameBox', 'Tweaks');

    Throttle.Caption:= LanguageFile.ReadString('MAME Options', 'LabelThrottle', 'Throttle');
    Cheat.Caption:= LanguageFile.ReadString('MAME Options', 'LabelCheat', 'Cheat');
    Tweak.Caption:= LanguageFile.ReadString('MAME Options', 'LabelTweak', 'Tweak');
    SkipDisclaimer.Caption:= LanguageFile.ReadString('MAME Options', 'LabelSkipDisclaimer', 'Skip Disclaimer');
    SkipGameInfo.Caption:= LanguageFile.ReadString('MAME Options', 'LabelSkipGameInfo', 'Skip Game Info');

    Throttle.Hint:= LanguageFile.ReadString('MAME Options', 'ThrottleHint', 'Throttle speed to the game''s framerate');
    Cheat.Hint:= LanguageFile.ReadString('MAME Options', 'CheatHint', 'Enable/disable cheat subsystem');
    Tweak.Hint:= LanguageFile.ReadString('MAME Options', 'TweakHint', 'Use tweaked VGA modes whose resolutions matching those of the emulated games');
    SkipDisclaimer.Hint:= LanguageFile.ReadString('MAME Options', 'SkipDisclaimerHint', 'Skip displaying the disclaimer screen');
    SkipGameInfo.Hint:= LanguageFile.ReadString('MAME Options', 'SkipGameInfoHint', 'Skip displaying the game info screen');

    // Buttons
    ButtonOk.Caption:= LanguageFile.ReadString('Resource', 'ButtonOk', '&Ok');
    ButtonOk.Hint:= LanguageFile.ReadString('Resource', 'ButtonOkHint', 'Close and update settings');

    ButtonCancel.Caption:= LanguageFile.ReadString('Resource', 'ButtonCancel', 'C&ancel');
    ButtonCancel.Hint:= LanguageFile.ReadString('Resource', 'ButtonCancelHint', 'Close without updating');
  end;
  FreeAndNil(LanguageFile);
end;

procedure TFormMain.SetPreferencesLanguage;
var
  LanguageFile: TMemIniFile;
begin
  if not FileExists(FrontendPath+'resources\language\'+FrontendLanguage+'.lng') then
     Exit;

  LanguageFile:= TMemIniFile.Create(FrontendPath+'resources\language\'+FrontendLanguage+'.lng');

  with FormPreferences do
  begin
    // Screen Title
    Caption:= LanguageFile.ReadString('Preferences', 'Title', 'Preferences');

    // Main Tab Sheet's titles
    TabSheetGeneral.Caption:= LanguageFile.ReadString('Preferences', 'TabSheetGeneralCaption', 'General');
    TabSheetAppearance.Caption:= LanguageFile.ReadString('Preferences', 'TabSheetAppearanceCaption', 'Appearance');
    TabSheetHotRod.Caption:= LanguageFile.ReadString('Preferences', 'TabSheetHotRod.Caption', 'Hot Rod');
    TabSheetSlikStik.Caption:= LanguageFile.ReadString('Preferences', 'TabSheetSlikStikCaption', 'SlikStik');
    TabSheetXArcade.Caption:= LanguageFile.ReadString('Preferences', 'TabSheetXArcadeCaption', 'X-Arcade');

    // "General" tab
    // "General" Tab Sheet's titles
    TabSheetMiscellaneous.Caption:= LanguageFile.ReadString('Preferences', 'TabSheetMiscellaneousCaption', 'Miscellaneous');
    TabSheetGames.Caption:= LanguageFile.ReadString('Preferences', 'TabSheetGamesCaption', 'Games');
    TabSheetPictures.Caption:= LanguageFile.ReadString('Preferences', 'TabSheetPicturesCaption', 'Pictures');

    // "Miscellaneous" Labels & Options
    AverageFPS.Caption:= LanguageFile.ReadString('Preferences', 'LabelAverageFPS', 'Show Average FPS On MAME Exit');
    LabelSplashLogo.Caption:= LanguageFile.ReadString('Preferences', 'LabelSplashLogo', 'Splash Logo');
    LabelGameSize.Caption:= LanguageFile.ReadString('Preferences', 'LabelGameSize', 'Game Size');
    ShowGameSize.Caption:= LanguageFile.ReadString('Preferences', 'LabelShowGameSize', 'Show Game Size');
    ShowGameSizeBits.Caption:= LanguageFile.ReadString('Preferences', 'LabelShowGameSizeBits', 'Game Size in Bits (Default)');
    ShowGameSizeBytes.Caption:= LanguageFile.ReadString('Preferences', 'LabelShowGameSizeBytes', 'Game Size in Bytes');
    ShowGameSizeCompressedZip.Caption:= LanguageFile.ReadString('Preferences', 'LabelShowGameSizeCompressedZip', 'Zipped Game Size in Bytes');
    ShowStatistics.Caption:= LanguageFile.ReadString('Preferences', 'LabelShowStatistics', 'Show Statistics');
    MinimizeFrontend.Caption:= LanguageFile.ReadString('Preferences', 'LabelMinimizeFrontend', 'Minimize Frontend');

    AverageFPS.Hint:= LanguageFile.ReadString('Preferences', 'AverageFPSHint', 'Show the average frames per second of the last executed game (it also shows the loading process)');
    SplashLogo.Hint:= LanguageFile.ReadString('Preferences', 'SplashLogoHint', 'Select a logo to use on splash screen');
    SplashLogoButtonSelect.Hint:= LanguageFile.ReadString('Preferences', 'SplashLogoButtonSelectHint', 'Click here to select a logo file');
    ShowGameSize.Hint:= LanguageFile.ReadString('Preferences', 'ShowGameSizeHint', 'Enable / disable the game size in status bar (speed up the scrolling)');
    ShowGameSizeBits.Hint:= LanguageFile.ReadString('Preferences', 'ShowGameSizeBitsHint', 'Shows the game size in bits (see status bar)');
    ShowGameSizeBytes.Hint:= LanguageFile.ReadString('Preferences', 'ShowGameSizeBytesHint', 'Shows the game size in bytes (see status bar)');
    ShowGameSizeCompressedZip.Hint:= LanguageFile.ReadString('Preferences', 'ShowGameSizeCompressedZipHint', 'Shows the game''s ZIP file size in bytes (see status bar)');
    ShowStatistics.Hint:= LanguageFile.ReadString('Preferences', 'ShowStatisticsHint', 'Shows the statistic after building/refreshing a games list');
    MinimizeFrontend.Hint:= LanguageFile.ReadString('Preferences', 'MinimizeFrontendHint', 'It minimizes the frontend before game starts and restores after quitting game');

    // "Games" Labels & Options
    NewDescriptionFormat.Caption:= LanguageFile.ReadString('Preferences', 'LabelNewDescriptionFormat', 'New Description Format');
    FillAllCloneColumns.Caption:= LanguageFile.ReadString('Preferences', 'LabelFillAllCloneColumns', 'Fill All Clone Columns');
    ShowPreliminaryGamesDisabled.Caption:= LanguageFile.ReadString('Preferences', 'LabelShowPreliminaryGamesDisabled', 'Show Preliminary Games Disabled');
    UseCustomOptionsDefault.Caption:= LanguageFile.ReadString('Preferences', 'LabelUseCustomOptionsDefault', 'Use Custom Options by Default');
    UseCustomGameDescription.Caption:= LanguageFile.ReadString('Preferences', 'LabelUseCustomGameDescription', 'Use Custom Game Description');
    UseCustomGameCategory.Caption:= LanguageFile.ReadString('Preferences', 'LabelUseCustomGameCategory', 'Use Custom Game Category');
    AuditCHDFiles.Caption:= LanguageFile.ReadString('Preferences', 'LabelAuditCHDFiles', 'Audit Hard Disk Images');
    LabelDefaultGameIconsFolder.Caption:= LanguageFile.ReadString('Preferences', 'LabelDefaultGameIconsFolder', 'Default Game Icons Folder');
    ButtonUpdateGameIconsFolder.Caption:= LanguageFile.ReadString('Resource', 'LabelButtonUpdate', 'Update');

    NewDescriptionFormat.Hint:= LanguageFile.ReadString('Preferences', 'NewDescriptionFormatHint', 'Show a different description for some games');
    FillAllCloneColumns.Hint:= LanguageFile.ReadString('Preferences', 'FillAllCloneColumnsHint', 'Add the parent name in all "clone of" columns (for the master games)');
    ShowPreliminaryGamesDisabled.Hint:= LanguageFile.ReadString('Preferences', 'ShowPreliminaryGamesDisabledHint', 'Makes all games with a preliminary driver, in gray color and striked out');
    DefaultGameIconsFolder.Hint:= LanguageFile.ReadString('Preferences', 'DefaultGameIconsFolderHint', 'Select a folder where the default icons are');
    UseCustomOptionsDefault.Hint:= LanguageFile.ReadString('Preferences', 'UseCustomOptionsDefaultHint', 'Run game with custom command line, custom options or default options with a single click');
    UseCustomGameDescription.Hint:= LanguageFile.ReadString('Preferences', 'UseCustomGameDescriptionHint', 'Use custom game descriptions when creating a new games list');
    UseCustomGameCategory.Hint:= LanguageFile.ReadString('Preferences', 'UseCustomGameCategoryHint', 'Use custom game categories when creating a new games list');
    AuditCHDFiles.Hint:= LanguageFile.ReadString('Preferences', 'AuditCHDFilesHint', 'Verify the MD5 checksum on .chd files when auditing a game');
    DefaultGameIconsFolderButtonSelect.Hint:= LanguageFile.ReadString('MAME Options', 'SingleButtonHint', 'Click here to select a folder');
    ButtonUpdateGameIconsFolder.Hint:= LanguageFile.ReadString('Preferences', 'ButtonUpdateHint', 'Update icons on games list');

    // "Pictures" Labels & Options
    ShowParentPictures.Caption:= LanguageFile.ReadString('Preferences', 'LabelShowParentPictures', 'Show Parent Pictures');
    NewPictureNameFormat.Caption:= LanguageFile.ReadString('Preferences', 'LabelNewPictureNameFormat', 'New Picture Name Format');
    CyclePictureTypes.Caption:= LanguageFile.ReadString('Preferences', 'LabelCyclePictureTypes', 'Cycle Picture Types');

    LabelPicturesVisualEffects.Caption:= LanguageFile.ReadString('MAME Options', 'LabelVisualEffectsFrameBox', 'Visual Effects');
    StretchPicture.Caption:= LanguageFile.ReadString('Preferences', 'PictureStretch', 'Stretch');
    StretchLargerPictures.Caption:= LanguageFile.ReadString('Preferences', 'LabelStretchLargerPictures', 'Stretch Larger Pictures Only');
    SmoothPictures.Caption:= LanguageFile.ReadString('Preferences', 'LabelSmoothPictures', 'Smooth Pictures');
    AspectRatio.Caption:= LanguageFile.ReadString('Preferences', 'LabelAspectRatio', 'Aspect Ratio');
    PicturesTransparency.Caption:= LanguageFile.ReadString('Preferences', 'LabelUsePicturesTransparency', 'Use Pictures Transparency');
    PicturesVirtualList.Caption:= LanguageFile.ReadString('Preferences', 'LabelUseVirtualList', 'Use Virtual List');

    ShowParentPictures.Hint:= LanguageFile.ReadString('Preferences', 'ShowParentPicturesHint', 'Show the master picture when the clone picture doesn''t exist');
    NewPictureNameFormat.Hint:= LanguageFile.ReadString('Preferences', 'NewPictureNameFormatHint', 'Use pictures names with format gamename0000.ext instead of game0000.ext');
    CyclePictureTypes.Hint:= LanguageFile.ReadString('Preferences', 'CyclePictureTypesHint', 'Cycle thru all picture types automatically when viewing pictures');

    StretchPicture.Hint:= LanguageFile.ReadString('Preferences', 'StretchPictureHint', 'Stretch pictures to pit in the preview area');
    StretchLargerPictures.Hint:= LanguageFile.ReadString('Preferences', 'StretchLargerPicturesHint', 'It will stretch down all images that can''t fit on preview area (Stretch must be ON)');
    SmoothPictures.Hint:= LanguageFile.ReadString('Preferences', 'SmoothPicturesHint', 'This gives a nice touch for preview pictures');
    AspectRatio.Hint:= LanguageFile.ReadString('Preferences', 'AspectRatioHint', 'Show the pictures in it''s correct aspect when resizing');
    PicturesTransparency.Hint:= LanguageFile.ReadString('Preferences', 'UsePicturesTransparencyHint', 'Show snaps, marquees, flyers, cabinets and control panels with transparent background');
    PicturesVirtualList.Hint:= LanguageFile.ReadString('Preferences', 'UseVirtualListHint', 'Enable/disable the virtual list of the game''s total pictures');

    // "M.A.M.E." Tab
    // "M.A.M.E." Labels & Options

    // Options & Labels
    TabSheetMAMEFolders.Caption:= LanguageFile.ReadString('MAME Options', 'TabSheetFoldersCaption', 'Folders');
    LabelFolderTitleSnapshots.Caption:= LanguageFile.ReadString('Resource', 'TitleSnapshotsDescription', 'Title Snapshots');
    LabelFolderMarquees.Caption:= LanguageFile.ReadString('Resource', 'MarqueesDescription', 'Marquees');
    LabelFolderFlyers.Caption:= LanguageFile.ReadString('Resource', 'FlyersDescription', 'Flyers');
    LabelFolderCabinets.Caption:= LanguageFile.ReadString('Resource', 'CabinetsDesciption', 'Cabinets');
    LabelFolderControlPanels.Caption:= LanguageFile.ReadString('Resource', 'ControlPanelsDescription', 'Control Panels');
    LabelFolderControlPanelLayouts.Caption:= LanguageFile.ReadString('Resource', 'ControlPanelLayoutsDescription', 'Control Panel Layouts');
    LabelFolderIcons.Caption:= LanguageFile.ReadString('Resource', 'IconsDescription', 'Real Icons');
    LabelFolderGamesFAQ.Caption:= LanguageFile.ReadString('Resource', 'GamesFAQDescription', 'Games F.A.Q.');

    FolderTitleSnapshotsButtonSelect.Hint:= LanguageFile.ReadString('MAME Options', 'SingleButtonHint', 'Click here to select a folder');
    FolderMarqueesButtonSelect.Hint:= FolderTitleSnapshotsButtonSelect.Hint;
    FolderFlyersButtonSelect.Hint:= FolderTitleSnapshotsButtonSelect.Hint;
    FolderCabinetsButtonSelect.Hint:= FolderTitleSnapshotsButtonSelect.Hint;
    FolderControlPanelsButtonSelect.Hint:= FolderTitleSnapshotsButtonSelect.Hint;
    FolderControlPanelLayoutsButtonSelect.Hint:= FolderTitleSnapshotsButtonSelect.Hint;
    FolderIconsButtonSelect.Hint:= FolderTitleSnapshotsButtonSelect.Hint;
    FolderGamesFAQButtonSelect.Hint:= FolderTitleSnapshotsButtonSelect.Hint;

    LabelCustomAspectRatioMAME.Caption:= LanguageFile.ReadString('Preferences', 'LabelCustomAspectRatioMAME', 'Custom Aspect Ratio');
    UseCustomAspectRatio.Caption:= LanguageFile.ReadString('Preferences', 'LabelUseCustomAspectRatio', 'Use Custom Aspect Ratio');
    LabelHorizontalAspectRatio.Caption:= LanguageFile.ReadString('Preferences', 'LabelHorizontalAspectRatio', 'Horizontal Aspect Ratio');
    LabelVerticalAspectRatio.Caption:= LanguageFile.ReadString('Preferences', 'LabelVerticalAspectRatio', 'Vertical Aspect Ratio');

    LabelExtraParametersMAME.Caption:= LanguageFile.ReadString('Preferences', 'LabelExtraParametersMAME', 'Extra Command Line Parameters');
    UseExtraParametersMAME.Caption:= LanguageFile.ReadString('Preferences', 'UseExtraParametersMAME', 'Use Extra Parameters');
    LabelMAMEExecutables.Caption:= LanguageFile.ReadString('Preferences', 'LabelMAMEExecutables', 'MAME Executables');
    LabelDOSMAMEExecutables.Caption:= LanguageFile.ReadString('Preferences', 'LabelDOSMAMEExecutables', 'DOS MAME Executables');

    UseExtraParametersMAME.Hint:= LanguageFile.ReadString('Preferences', 'UseExtraParametersMAMEHint', 'Activate / deactivate extra command line parameters to use with MAME');
    ExtraParametersMAME.Hint:= LanguageFile.ReadString('Preferences', 'ExtraParametersMAMEHint', 'Specify an extra command line parameter for MAME executables');
    ExtraParametersDOSMAME.Hint:= LanguageFile.ReadString('Preferences', 'ExtraParametersDOSMAMEHint', 'Specify an extra command line parameter for DOS MAME executables');

    UseCustomAspectRatio.Hint:= LanguageFile.ReadString('Preferences', 'UseCustomAspectRatioHint', 'Activate / deactivate custom aspect ratio for horizontal and vertical games');
    HorizontalAspectRatio.Hint:= LanguageFile.ReadString('Preferences', 'HorizontalAspectRatioHint', 'Specify a custom aspect ratio for horizontal games');
    VerticalAspectRatio.Hint:= LanguageFile.ReadString('Preferences', 'VerticalAspectRatioHint', 'Specify a custom aspect ratio for vertical games');

    // "Appearance" Labels & Options
    // "General" Box
    LabelCustomColorsGeneral.Caption:= TabSheetGeneral.Caption;
    LabelGeneralBackgroundColor.Caption:= LanguageFile.ReadString('Preferences', 'LabelBackgroundColor', 'Background Color');
    ButtonGeneralFont.Caption:= LanguageFile.ReadString('Resource', 'ButtonFont', 'Font');
    ButtonGeneralDefaultFont.Caption:= LanguageFile.ReadString('Resource', 'ButtonDefault', 'Default');

    ButtonGeneralFont.Hint:= LanguageFile.ReadString('Preferences', 'ButtonGeneralFontHint', 'Select general font for the frontend');
    ButtonGeneralDefaultFont.Hint:= LanguageFile.ReadString('Resource', 'ButtonDefaultHint', 'Set default value(s)');

    // "Games" Box
    LabelCustomColorsGamesList.Caption:= TabSheetGames.Caption;
    LabelListBackground.Caption:= LabelGeneralBackgroundColor.Caption;
    ButtonGamesListFont.Caption:= ButtonGeneralFont.Caption;
    ButtonGamesListDefaultFont.Caption:= ButtonGeneralDefaultFont.Caption;

    ButtonGamesListFont.Hint:= LanguageFile.ReadString('Preferences', 'ButtonGamesListFontHint', 'Select font for the games list');
    ButtonGamesListDefaultFont.Hint:= ButtonGeneralDefaultFont.Hint;

    // "Pictures" Box
    LabelPicturesColors.Caption:= TabSheetPictures.Caption;
    LabelTitleSnapshotPicturesBackgroundColor.Caption:= LanguageFile.ReadString('Resource', 'TitleSnapshotsDescription', 'Title Snapshots');
    LabelInGameSnapshotPicturesBackgroundColor.Caption:= LanguageFile.ReadString('Resource', 'InGameSnapshotsDescription', 'In-Game Snapshots');
    LabelMarqueePicturesBackgroundColor.Caption:= LanguageFile.ReadString('Resource', 'MarqueesDescription', 'Marquees');
    LabelFlyerPicturesBackgroundColor.Caption:= LanguageFile.ReadString('Resource', 'FlyersDescription', 'Flyers');
    LabelCabinetPicturesBackgroundColor.Caption:= LanguageFile.ReadString('Resource', 'CabinetsDesciption', 'Cabinets');
    LabelControlPanelPicturesBackgroundColor.Caption:= LanguageFile.ReadString('Resource', 'ControlPanelsDescription', 'Control Panels');
    LabelControlPanelLayoutPicturesBackgroundColor.Caption:= LanguageFile.ReadString('Resource', 'ControlPanelLayoutsDescription', 'Control Panel Layouts');

    // "Automatic Game Information" Box
    LabelAutomaticGameInfo.Caption:= MenuAutomaticGameInformation.Caption;
    LabelAutomaticGameInformationFont.Caption:= LabelGeneralBackgroundColor.Caption;
    ButtonAutomaticGameInfoFont.Caption:= ButtonGeneralFont.Caption;
    ButtonAutomaticGameInfoDefaultColorFont.Caption:= ButtonGeneralDefaultFont.Caption;

    ButtonAutomaticGameInfoFont.Hint:= LanguageFile.ReadString('Preferences', 'ButtonAutomaticGameInfoFontHint', 'Select font for the automatic game information window');
    ButtonAutomaticGameInfoDefaultColorFont.Hint:= ButtonGeneralDefaultFont.Hint;

    // "Hot Rod" Labels & Options
    HotRod.Caption:= Format(LanguageFile.ReadString('Preferences', 'LabelUseController', 'Use %s'), [TabSheetHotRod.Caption]);

    HotRod.Hint:= Format(LanguageFile.ReadString('Preferences', 'UseControllerHint', 'Enable %s joysticks to control frontend''s functions'), [TabSheetHotRod.Caption]);
    VisitHotRodImage.Hint:= Format(LanguageFile.ReadString('Preferences', 'VisitHomepage', 'Click here to visit %s homepage'), [TabSheetHotRod.Caption]);
    HotRodSEImageFile.Hint:= Format(LanguageFile.ReadString('Preferences', 'ControllerImageFileHint', '%s image filename'), [TabSheetHotRod.Caption]);
    HotRodSEImageFileButtonSelect.Hint:= LanguageFile.ReadString('Custom Games', 'CommandLineButtonHint', 'Click here to select a file');

    // "SlikStik" Labels & Options
    SlikStik.Caption:= Format(LanguageFile.ReadString('Preferences', 'LabelUseController', 'Use %s'), [TabSheetSlikStik.Caption]);
    SlikStikSwap2ndPlayerStick.Caption:= LanguageFile.ReadString('Preferences', 'LabelSlikStikSwap2ndPlayerStick', 'Swap Stick');

    SlikStik.Hint:= Format(LanguageFile.ReadString('Preferences', 'UseControllerHint', 'Enable %s joysticks to control frontend''s functions'), [TabSheetSlikStik.Caption]);
    SlikStikSwap2ndPlayerStick.Hint:= LanguageFile.ReadString('Preferences', 'SlikStikSwap2ndPlayerStickHint', 'Swap 2nd player stick Up / Down (for new controllers)');
    VisitSlikStikImage.Hint:= Format(LanguageFile.ReadString('Preferences', 'VisitHomepage', 'Click here to visit %s homepage'), [TabSheetSlikStik.Caption]);
    SlikStikImageFile.Hint:= Format(LanguageFile.ReadString('Preferences', 'ControllerImageFileHint', '%s image filename'), [TabSheetSlikStik.Caption]);
    SlikStikImageFileButtonSelect.Hint:= HotRodSEImageFileButtonSelect.Hint;

    // "X-Arcade" Labels & Options
    XArcade.Caption:= Format(LanguageFile.ReadString('Preferences', 'LabelUseController', 'Use %s'), [TabSheetXArcade.Caption]);

    XArcade.Hint:= Format(LanguageFile.ReadString('Preferences', 'UseControllerHint', 'Enable %s joysticks to control frontend''s functions'), [TabSheetXArcade.Caption]);
    VisitXArcadeImage.Hint:= Format(LanguageFile.ReadString('Preferences', 'VisitHomepage', 'Click here to visit %s homepage'), [TabSheetXArcade.Caption]);
    XArcadeImageFile.Hint:= Format(LanguageFile.ReadString('Preferences', 'ControllerImageFileHint', '%s image filename'), [TabSheetXArcade.Caption]);
    XArcadeImageFileButtonSelect.Hint:= HotRodSEImageFileButtonSelect.Hint;

    // Buttons
    ButtonUpdateGameIconsFolder.Caption:= LanguageFile.ReadString('Resource', 'ButtonUpdate', 'Update');
    ButtonUpdateGameIconsFolder.Hint:= LanguageFile.ReadString('Preferences', 'ButtonUpdateHint', 'Update icons on games list');

    ButtonUpdateEmuLoaderFolders.Caption:= ButtonUpdateGameIconsFolder.Caption;
    ButtonUpdateEmuLoaderFolders.Hint:= LanguageFile.ReadString('Preferences', 'ButtonUpdateFoldersHint', 'Update folders on memory');

    ButtonClose.Caption:= LanguageFile.ReadString('Resource', 'ButtonClose', '&Close');
    ButtonClose.Hint:= LanguageFile.ReadString('Resource', 'ButtonCloseHint', 'Close this window');
  end;
  FreeAndNil(LanguageFile);
end;

procedure TFormMain.SetCustomCommandLineLanguage;
var
  LanguageFile: TMemIniFile;
begin
  if not FileExists(FrontendPath+'resources\language\'+FrontendLanguage+'.lng') then
     Exit;

  LanguageFile:= TMemIniFile.Create(FrontendPath+'resources\language\'+FrontendLanguage+'.lng');

  with FormCustomCommandLine do
  begin
    // Screen Title
    LabelCaption.Caption:= LanguageFile.ReadString('Custom Command Line', 'Title', 'Custom Command Line');

    // Options & Labels
    LabelCustomCommandLineExecutable.Caption:= LanguageFile.ReadString('Custom Command Line', 'LabelCustomCommandLineExecutable', 'Command Line Executable');
    LabelCustomCommandLineParamaters.Caption:= LanguageFile.ReadString('Custom Command Line', 'LabelCustomCommandLineParamaters', 'Command Line Parameters');
    CommandLineButtonSelect.Hint:= LanguageFile.ReadString('Custom Games', 'CommandLineButtonHint', 'Click here to select a file');

    CustomCommandLineParamaters.Hint:= LanguageFile.ReadString('Custom Games', 'CommandLineParametersHint', 'Type the parameters, surrounded by quotes if it has long name');
    // Buttons
    ButtonClearCustomCommandLine.Caption:= LanguageFile.ReadString('Resource', 'ButtonClear', 'Cl&ear');
    ButtonClearCustomCommandLine.Hint:= LanguageFile.ReadString('Custom Games', 'ButtonClearCommandLineHint', 'Clear the command line and command line parameters');

    ButtonOk.Caption:= LanguageFile.ReadString('Resource', 'ButtonOk', '&Ok');
    ButtonOk.Hint:= LanguageFile.ReadString('Resource', 'ButtonOkHint', 'Close and update settings');

    ButtonCancel.Caption:= LanguageFile.ReadString('Resource', 'ButtonCancel', 'C&ancel');
    ButtonCancel.Hint:= LanguageFile.ReadString('Resource', 'ButtonCancelHint', 'Close without updating');
  end;
end;

procedure TFormMain.SetIconsLegendLanguage;
var
  LanguageFile: TMemIniFile;
begin
  if not FileExists(FrontendPath+'resources\language\'+FrontendLanguage+'.lng') then
     Exit;

  LanguageFile:= TMemIniFile.Create(FrontendPath+'resources\language\'+FrontendLanguage+'.lng');

  with FormGamesListLegend do
  begin
    // Labels
    LabelClassicMR.Caption:= LanguageFile.ReadString('Resource', 'ClassicMasterRasterDescription', 'Classic Master Raster Games');
    LabelClassicMV.Caption:= LanguageFile.ReadString('Resource', 'ClassicMasterVectorDescription', 'Classic Master Vector Games');
    LabelClassicCR.Caption:= LanguageFile.ReadString('Resource', 'ClassicCloneRasterDescription', 'Classic Clone Raster Games');
    LabelClassicCV.Caption:= LanguageFile.ReadString('Resource', 'ClassicCloneVectorDescription', 'Classic Clone Vector Games');
    LabelNeoGeoM.Caption:= LanguageFile.ReadString('Resource', 'NeoGeoMasterDescription', 'Neo Geo Master Games');
    LabelNeoGeoC.Caption:= LanguageFile.ReadString('Resource', 'NeoGeoCloneDescription', 'Neo Geo Clone Games');
    LabelClassicBios.Caption:= LanguageFile.ReadString('Resource', 'ClassicBiosDescription', 'Classic Bios');
    LabelNeoGeoBios.Caption:= LanguageFile.ReadString('Resource', 'NeoGeoBiosDescription', 'Neo Geo Bios');
    LabelCustomGames.Caption:= LanguageFile.ReadString('Resource', 'CustomGamesDescription', 'Custom Games');
    LabelRealIcon.Caption:= LanguageFile.ReadString('Resource', 'IconsDescription', 'Real Icons');

    LabelUnClassicMR.Caption:= LanguageFile.ReadString('Resource', 'UnavailableClassicMasterRasterDescription', 'Unavailable Classic Master Raster Games');
    LabelUnClassicMV.Caption:= LanguageFile.ReadString('Resource', 'UnavailableClassicMasterVectorDescription', 'Unavailable Classic Master Vector Games');
    LabelUnClassicCR.Caption:= LanguageFile.ReadString('Resource', 'UnavailableClassicCloneRasterDescription', 'Unavailable Classic Clone Raster Games');
    LabelUnClassicCV.Caption:= LanguageFile.ReadString('Resource', 'UnavailableClassicCloneVectorDescription', 'Unavailable Classic Clone Vector Games');
    LabelUnNeoGeoM.Caption:= LanguageFile.ReadString('Resource', 'UnavailableNeoGeoMasterDescription', 'Unavailable Neo Geo Master Games');
    LabelUnNeoGeoC.Caption:= LanguageFile.ReadString('Resource', 'UnavailableNeoGeoCloneDescription', 'Unavailable Neo Geo Clone Games');
    LabelUnClassicBios.Caption:= LanguageFile.ReadString('Resource', 'UnavailableClassicBiosDescription', 'Unavailable Classic Bios');
    LabelUnNeoGeoBios.Caption:= LanguageFile.ReadString('Resource', 'UnavailableNeoGeoBiosDescription', 'Unavailable Neo Geo Bios');
    LabelUnCustomGames.Caption:= LanguageFile.ReadString('Resource', 'UnavailableCustomGamesDescription', 'Unavailable Custom Games');
  end;
end;

procedure TFormMain.SetCustomGameDescriptionLanguage;
var
  LanguageFile: TMemIniFile;
begin
  if not FileExists(FrontendPath+'resources\language\'+FrontendLanguage+'.lng') then
     Exit;

  LanguageFile:= TMemIniFile.Create(FrontendPath+'resources\language\'+FrontendLanguage+'.lng');

  with FormCustomGameDescription do
  begin
    // Screen Title
    LabelCaption.Caption:= LanguageFile.ReadString('Custom Game Description', 'Title', 'Custom Game Description');

    // Options & Labels
    LabelNewDescription.Caption:= LanguageFile.ReadString('Custom Game Description', 'LabelNewDescription', 'New Description');
    NewDescription.Hint:= LanguageFile.ReadString('Custom Game Description', 'NewDescriptionHint', 'Type the new description (mouse double-click to reset description)');

    // Buttons
    ButtonOriginalDescription.Caption:= LanguageFile.ReadString('Custom Game Description', 'ButtonOriginalDescription', 'Original &Description');
    ButtonOriginalDescription.Hint:= LanguageFile.ReadString('Custom Game Description', 'ButtonOriginalDescriptionHint', 'Set the original MAME description');

    ButtonClearNewDescription.Caption:= LanguageFile.ReadString('Resource', 'ButtonClear', 'Cl&ear');
    ButtonClearNewDescription.Hint:= LanguageFile.ReadString('Custom Game Description', 'ButtonClearNewDescriptionHint', 'Clear the new description');

    ButtonOk.Caption:= LanguageFile.ReadString('Resource', 'ButtonOk', '&Ok');
    ButtonOk.Hint:= LanguageFile.ReadString('Resource', 'ButtonOkHint', 'Close and update settings');

    ButtonCancel.Caption:= LanguageFile.ReadString('Resource', 'ButtonCancel', 'C&ancel');
    ButtonCancel.Hint:= LanguageFile.ReadString('Resource', 'ButtonCancelHint', 'Close without updating');
  end;
end;

procedure TFormMain.SetCustomGameCategoryLanguage;
var
  LanguageFile: TMemIniFile;
begin
  if not FileExists(FrontendPath+'resources\language\'+FrontendLanguage+'.lng') then
     Exit;

  LanguageFile:= TMemIniFile.Create(FrontendPath+'resources\language\'+FrontendLanguage+'.lng');

  with FormCustomGameCategory do
  begin
    // Screen Title
    LabelCaption.Caption:= LanguageFile.ReadString('Custom Game Category', 'Title', 'Custom Game Category');

    // Options & Labels
    LabelDefaultCategories.Caption:= LanguageFile.ReadString('Custom Game Category', 'LabelDefaultCategories', 'Default Categories');
    LabelCustomCategories.Caption:= LanguageFile.ReadString('Custom Game Category', 'LabelCustomCategories', 'Custom Categories');

    DefaultCategoriesList.Hint:= LanguageFile.ReadString('Custom Game Category', 'DefaultCategoriesListHint', 'Select a category');
    CustomCategoriesList.Hint:= LanguageFile.ReadString('Custom Game Category', 'CustomCategoriesListHint', 'Select a custom category');
    NewCategory.Hint:= LanguageFile.ReadString('Custom Game Category', 'NewCategoryHint', 'Type the new category, if not exist on the above categories list');

    // Buttons
    ButtonOriginalCategory.Caption:= LanguageFile.ReadString('Custom Game Category', 'ButtonOriginalCategory', 'Original &Category');
    ButtonOriginalCategory.Hint:= LanguageFile.ReadString('Custom Game Category', 'ButtonOriginalCategoryHint', 'Set the original category from "catver.ini"');

    ButtonClearNewCategory.Caption:= LanguageFile.ReadString('Resource', 'ButtonClear', 'Cl&ear');
    ButtonClearNewCategory.Hint:= LanguageFile.ReadString('Custom Game Category', 'ButtonClearNewCategoryHint', 'Clear the new category');

    ButtonOk.Caption:= LanguageFile.ReadString('Resource', 'ButtonOk', '&Ok');
    ButtonOk.Hint:= LanguageFile.ReadString('Resource', 'ButtonOkHint', 'Close and update settings');

    ButtonCancel.Caption:= LanguageFile.ReadString('Resource', 'ButtonCancel', 'C&ancel');
    ButtonCancel.Hint:= LanguageFile.ReadString('Resource', 'ButtonCancelHint', 'Close without updating');
  end;
end;

// End of procedures

procedure TFormMain.MenuExitClick(Sender: TObject);
begin
  Close;
end;

procedure TFormMain.MenuPreferencesClick(Sender: TObject);
begin
  FormPreferences.ShowModal;
end;

procedure TFormMain.ListColumnClick(Sender: TObject; Column: TListColumn);
begin
  SortColumn(Column.ID, False);
end;

procedure TFormMain.MenuEmulatorSetupClick(Sender: TObject);
begin
  if not Assigned(FormEmulatorsSetup) then
     FormEmulatorsSetup:= TFormEmulatorsSetup.Create(Self);
  FormEmulatorsSetup.ShowModal;
  FreeAndNil(FormEmulatorsSetup);
end;

procedure TFormMain.ButtonShowTitleSnapshotClick(Sender: TObject);
begin
  MenuShowTitleSnapshot.Click;
end;

procedure TFormMain.ButtonShowInGameSnapshotClick(Sender: TObject);
begin
  MenuShowInGameSnapshot.Click;
end;

procedure TFormMain.ButtonShowMarqueeClick(Sender: TObject);
begin
  MenuShowMarquee.Click;
end;

procedure TFormMain.ButtonShowFlyerClick(Sender: TObject);
begin
  MenuShowFlyer.Click;
end;

procedure TFormMain.ButtonShowCabinetClick(Sender: TObject);
begin
  MenuShowCabinet.Click;
end;

procedure TFormMain.ButtonShowControlPanelClick(Sender: TObject);
begin
  MenuShowControlPanel.Click;
end;

procedure TFormMain.FormCreate(Sender: TObject);
var
  FavoritesIni: THashedStringList;
  FavoriteFile: TextFile;
begin
  ClearEntries;
  CloseStatusWindow:= False;
  Application.OnException:= AppException;
  FrontendPath:= ShortToLongPath(ExtractFilePath(Application.ExeName));
  ThousandSeparator:= Char(',');
  DecimalSeparator:= Char('.');

  Auditing:= False;
  CancelCurrentOperation:= False;
  ProcessingAutomaticMAMEInfoDAT:= False;
  Caption:= Caption+' - [v'+FrontendVersion+']';
  if not DirectoryExists(FrontendPath+'resources') then
     begin
       Application.MessageBox('The folder "resources" could not be found!'+#13+
                              'This is a required folder and the frontend will not work without it.'+#13+
                              'Please, make sure to create the folder and all it''s sub-folders as well.',
                              'Fatal Error', mb_Ok+mb_IconError);
       Application.Terminate;
       Exit;
     end;

  if DirectoryExists(FrontendPath+'resources\favorites') then
     begin
       if not FileExists(FrontendPath+'resources\favorites\default.dat') then
          begin
            if DirectoryExists(FrontendPath+'resources\favorites') then
               begin
                 AssignFile(FavoriteFile,FrontendPath+'resources\favorites\default.dat');
                 ReWrite(FavoriteFile);
                 CloseFile(FavoriteFile);
               end;
          end;

       if not FileExists(FrontendPath+'Favorites.ini') then
          begin
            FavoritesIni:= THashedStringList.Create;
            FavoritesIni.BeginUpdate;
            FavoritesIni.Add('[Default]');
            FavoritesIni.Add('file=default.dat');
            FavoritesIni.EndUpdate;
            FavoritesIni.SaveToFile(FrontendPath+'Favorites.ini');
            FreeAndNil(FavoritesIni);
          end;
     end;

  PictureNumber:= 1;
  LoadToolbarIcons;
  LoadStatusBarIcons;
  SetLength(EmulatorType, 5);
  SetLength(EmulatorVersion, 6);
  SetLength(EmulatorExecutable, 6);
  InitializeEmulatorVariables;
  InitializeColumnsSort;
end;

procedure TFormMain.FormShow(Sender: TObject);
var
  INIFile: TIniFile;
begin
  FormStatus.Show;
  FormStatus.Refresh;

  AbortExecution:= True;
  case FileExists(FrontendPath+'EmuLoader.ini') of
    True:
      begin
        FormStatus.LabelMessage.Caption:= GetStatusMessage('ReadIniFile');
        FormStatus.LabelMessage.Refresh;
        case ReadINIFile of
          False:
            begin
              GenerateMessage(GetLanguageText('Messages', 'FileNotFoundTitle', 'File Not Found'),
                              GetLanguageText('Messages', 'EmulatorFileNotFoundMsg', 'One or more of the emulator executables were not found. Please, select valid executable(s)'), 2);
              MenuEmulatorSetup.OnClick(Self);
              INIFile:= TIniFile.Create(FrontendPath+'EmuLoader.ini');
              INIFile.WriteString('Configuration', 'DefaultDatabaseBuilderExecutable', DefaultDatabaseBuilderExecutable);
              INIFile.WriteString('Configuration', 'EmulatorName', EmulatorExecutable[1]);
              INIFile.WriteString('Configuration', 'EmulatorVersion', EmulatorVersion[1]);
              INIFile.WriteInteger('Configuration', 'EmulatorType', EmulatorType[1]);
              INIFile.WriteString('Configuration', 'EmulatorName2', EmulatorExecutable[2]);
              INIFile.WriteString('Configuration', 'EmulatorVersion2', EmulatorVersion[2]);
              INIFile.WriteInteger('Configuration', 'EmulatorType2', EmulatorType[2]);
              INIFile.WriteString('Configuration', 'EmulatorName3', EmulatorExecutable[3]);
              INIFile.WriteString('Configuration', 'EmulatorVersion3', EmulatorVersion[3]);
              INIFile.WriteInteger('Configuration', 'EmulatorType3', EmulatorType[3]);
              INIFile.WriteString('Configuration', 'EmulatorName4', EmulatorExecutable[4]);
              INIFile.WriteString('Configuration', 'EmulatorVersion4', EmulatorVersion[4]);
              INIFile.WriteInteger('Configuration', 'EmulatorType4', EmulatorType[4]);
              INIFile.WriteString('Configuration', 'EmulatorName5', EmulatorExecutable[5]);
              INIFile.WriteString('Configuration', 'EmulatorVersion5', EmulatorVersion[5]);
              INIFile.WriteInteger('Configuration', 'EmulatorType5', EmulatorType[5]);
              FreeAndNil(INIFile);

              if not ReadINIFile then
                 begin
                   GenerateMessage(GetLanguageText('Messages', 'FatalErrorTitle', 'Fatal Error'),
                                   GetLanguageText('Messages', 'NoValidEmulatorFilesMsg', 'There are no valid emulators to use! The frontend will be terminated.'), 2);
                   Application.Terminate;
                   PostMessage(Handle, wm_Close, 0, 0);
                   Exit;
                 end;
            end;
          True:
            begin
              if not CheckMAMEIniFiles then
                 begin
                   GenerateMessage(GetLanguageText('Messages', 'ErrorTitle', 'Error'),
                                   GetLanguageText('Messages', 'NoEmulatorIniFileFoundMsg', 'One or more MAME initialization files were not found! Please, verify your MAME executables and their options to continue.'), 2);

                   MenuEmulatorSetup.OnClick(Self);
                   if MainMenu.Tag = 1 then
                      begin
                        Application.Terminate;
                        PostMessage(Handle, wm_Close, 0, 0);
                        Exit;
                      end;
                 end;
            end;
        end;
        // load EmuLoader.ini options
        if not ((FileExists(FrontendPath+'resources\ClassicMR.dat'))   and (FileExists(FrontendPath+'resources\ClassicMV.dat'))   and
                (FileExists(FrontendPath+'resources\ClassicCR.dat'))   and (FileExists(FrontendPath+'resources\ClassicCV.dat'))   and
                (FileExists(FrontendPath+'resources\NeoGeoM.dat'))     and (FileExists(FrontendPath+'resources\NeoGeoC.dat'))     and
                (FileExists(FrontendPath+'resources\UnClassicMR.dat')) and (FileExists(FrontendPath+'resources\UnClassicMV.dat')) and
                (FileExists(FrontendPath+'resources\UnClassicCR.dat')) and (FileExists(FrontendPath+'resources\UnClassicCV.dat')) and
                (FileExists(FrontendPath+'resources\UnNeoGeoM.dat'))   and (FileExists(FrontendPath+'resources\UnNeoGeoC.dat'))   and
                (FileExists(FrontendPath+'resources\Bios.dat'))        and (FileExists(FrontendPath+'resources\UnBios.dat'))) then
               begin
                 LoadFolders(DefaultDatabaseBuilderExecutable);
                 CreateGamesList(DefaultDatabaseBuilderExecutable, True);
               end;
      end;
    False:
      begin
        DefaultDatabaseBuilderExecutable:= '1';
        if not ((FileExists(FrontendPath+'resources\ClassicMR.dat'))   and (FileExists(FrontendPath+'resources\ClassicMV.dat'))   and
                (FileExists(FrontendPath+'resources\ClassicCR.dat'))   and (FileExists(FrontendPath+'resources\ClassicCV.dat'))   and
                (FileExists(FrontendPath+'resources\NeoGeoM.dat'))     and (FileExists(FrontendPath+'resources\NeoGeoC.dat'))     and
                (FileExists(FrontendPath+'resources\UnClassicMR.dat')) and (FileExists(FrontendPath+'resources\UnClassicMV.dat')) and
                (FileExists(FrontendPath+'resources\UnClassicCR.dat')) and (FileExists(FrontendPath+'resources\UnClassicCV.dat')) and
                (FileExists(FrontendPath+'resources\UnNeoGeoM.dat'))   and (FileExists(FrontendPath+'resources\UnNeoGeoC.dat'))   and
                (FileExists(FrontendPath+'resources\Bios.dat'))        and (FileExists(FrontendPath+'resources\UnBios.dat'))) then
           begin
             // there is no "EmuLoader.ini" and no .dat files - 1st time execution
             GenerateMessage(GetLanguageText('Messages', 'WelcomeTitle', 'Welcome to Emu Loader'),
                             GetLanguageText('Messages', 'WelcomeMsg', 'Please, configure the software!'), 2);
             AbortExecution:= True;
             MenuEmulatorSetup.OnClick(Self);
             case MainMenu.Tag of
               0:
                 begin
                   //AbortExecution:=True;
                   LoadFolders(DefaultDatabaseBuilderExecutable);
                   CreateGamesList(DefaultDatabaseBuilderExecutable, True);
                 end;
               1:
                 begin
                   Application.Terminate;
                   PostMessage(Handle, wm_Close, 0, 0);
                   Exit;
                 end;
             end;
           end
        else
           begin
             // there is no "EmuLoader.ini" but all .dat files exists - just create the ini file
             GenerateMessage(GetLanguageText('Messages', 'IniFileMissingTitle', 'File Missing'),
                             Format(GetLanguageText('Messages', 'IniFileMissingMsg',
                                                    '%sEmuLoader.ini" not found. Please, re-configure the software!'),
                                    [FrontendPath]), 2);
             AbortExecution:= True;
             MenuEmulatorSetup.OnClick(Self);
             case MainMenu.Tag of
               0: LoadFolders(DefaultDatabaseBuilderExecutable);
               1:
                 begin
                   Application.Terminate;
                   PostMessage(Handle, wm_Close, 0, 0);
                   Exit;
                 end;
             end;
           end;
        CreateINIFile;
        FormStatus.LabelMessage.Caption:= GetStatusMessage('ReadIniFile');
        FormStatus.LabelMessage.Refresh;
        ReadINIFile;
        FormStatus.SetFocus;
      end;
  end;

  Screen.Cursor:= crHourGlass;
  GetMAMEExtendedPaths; // get snap, marquee, flyer, cabinet, control panel, icons and faq paths

  ClearEntries;

  if CheckDefaultIconsFile then
     ReadDefaultIconsFile;

  if MenuRealIcons.Tag = 1 then
     begin
       FormStatus.LabelStatusType.Caption:= GetLanguageText('Status Messages', 'LoadRealIconsTitle', 'Load Real Icons Resource');
       FormStatus.LabelMessage.Caption:= GetLanguageText('Status Messages', 'LoadRealIconsDAT', 'Loading icons from .dat files. Please, wait a moment...');
       FormStatus.LabelMessage.Refresh;
       MenuRealIcons.Click;
     end;

  if MenuParentalLock.Tag = 1 then
     begin
       FormStatus.LabelMessage.Caption:= GetLanguageText('Status Messages', 'ParentalLockActivate',
                                                         'Activating parental lock. Please, wait a moment...');
       FormStatus.LabelMessage.Refresh;
       MenuParentalLock.Tag:= 0;
       MenuParentalLock.Checked:= True;
       SetLockedGamesList(True);
     end;

  FormStatus.LabelProgress.Caption:= '';
  case ButtonShowFavorite.Down of
    True : ButtonShowFavorite.OnClick(Self);
    False: LoadROMClasses(False);
  end;

  Screen.Cursor:= crHourGlass;
  FormStatus.LabelProgress.Caption:= '';

  LoadFolders(IntToStr(ButtonExecutablesMode.Tag));

  if MenuUserProfile.Tag = 1 then
     begin
       Screen.Cursor:= crDefault;
       FormStatus.LabelMessage.Caption:= GetLanguageText('Status Messages', 'LoadUserProfile',
                                                         'Loading user profile options. Please, wait a moment...');
       FormStatus.LabelMessage.Refresh;
       MenuUserProfile.Tag:= 0;
       MenuUserProfile.Click;
     end;
  SetPreferencesLanguage;
  ShowingPicture:= True;
  if Length(GamesList) > 0 then
     SortColumn(ColumnSorted, False);
  CloseStatusWindow:= True;
  Screen.Cursor:= crDefault;
end;

procedure TFormMain.SelectItem(ItemIndex: Integer);
begin
  if ItemIndex > (Length(GamesList)-1) then
     ItemIndex:= 0;
  List.ItemFocused:= List.Items[ItemIndex];
  List.ItemIndex:= ItemIndex;
  List.Selected.MakeVisible(False);
  UpdateStatusBarGame;
end;

procedure TFormMain.ListSelectItem(Sender: TObject; Item: TListItem;
  Selected: Boolean);
var
  PictureName: String;
begin
  if Selected then
  //if Item.Focused then
     begin
       if Item.Index <> SelectedGame then
          SelectedGame:= Item.Index;
       if MenuShowPictures.Checked then
          begin
            if MenuAutomaticGameInformation.Checked then
               if not ProcessingAutomaticMAMEInfoDAT then
                  begin
                    if not Assigned(AutoMAMEInfoDATFile) then
                       MenuAutomaticGameInformation.OnClick(Self);
                    ShowAutomaticGameInformation;
                  end;
            PictureNumber:= 1;
            ButViewNextPicture.Tag:= 1;
            GetTotalPictures;
            PictureName:= ShowPicture(GamesList[SelectedGame].eName, GamesList[SelectedGame].eClone, Picture, PictureType, True);
            if PictureName <> 'No Change' then
               begin
                 Picture.Hint:= PictureName;
                 UpdateLabelPictures;
               end;
          end;
       UpdateStatusBarGame;
       if ((MenuPlayRecordedGame.Checked) or (MenuRecordGame.Checked)) then
          INPFilename.Text:= GamesList[SelectedGame].eName;
     end;
end;

procedure TFormMain.MenuCreateGamesListClick(Sender: TObject);
var
  Loop: Integer;
  ExeType: String[5];
begin
  FormStatus.Show;
  FormStatus.LabelMessage.Caption:= GetLanguageText('Status Messages', 'DetectEmulatorVersion',
                                                    'Detecting emulator version. Please, wait a moment...');
  FormStatus.LabelMessage.Refresh;

  ExeType:= ExeStrings[GetExeType(EmulatorExecutable[StrToInt(DefaultDatabaseBuilderExecutable)])];

  if not GetEmulatorVersion(StrToInt(DefaultDatabaseBuilderExecutable), ExeType) then
     begin
       GenerateMessage(GetLanguageText('Messages', 'InvalidEmulatorFileFormatTitle', 'Invalid Executable File'),
                                      Format(GetLanguageText('Messages', 'InvalidEmulatorFileFormatMsg', 'Executable %d is not valid!')+#13+
                                             GetLanguageText('Messages', 'SelectValidEmulatorFileMsg', 'Please, select a valid executable (MAME and DOS MAME only).'), [1]), 2);
       Exit;
     end;

  CancelCurrentOperation:= False;
  FormStatus.KeyPreview:= True;

  ShowingPicture:= True;

  LoadFolders(DefaultDatabaseBuilderExecutable);
  SetCurrentDir(ExtractFilePath(DefaultDatabaseBuilderExecutable));

  if CreateGamesList(DefaultDatabaseBuilderExecutable, True) then
     begin
       Picture.Bitmap.Clear;
       Picture.Hint:= '';
       LabelPictureNumber.Caption:= '';

       if BigRealIconsImageList.Count > 1 then
          begin
            FormStatus.LabelMessage.Caption:= GetLanguageText('Status Messages', 'ClearRealIcons',
                                                              'Cleaning real icons list. Please, wait a moment...');
            FormStatus.LabelMessage.Refresh;
            for Loop:=BigRealIconsImageList.Count-1 downto 1 do
            begin
              BigRealIconsImageList.Delete(Loop);
              SmallRealIconsImageList.Delete(Loop);
            end;
          end;
       Application.ProcessMessages;

       FormStatus.LabelMessage.Caption:= GetLanguageText('Status Messages', 'DeleteRealIconsDAT',
                                                         'Deleting real icons .dat files. Please, wait a moment...');
       FormStatus.LabelMessage.Refresh;
       if FileExists(FrontendPath+'resources\IconsIndex.dat') then
          DeleteFile(FrontendPath+'resources\IconsIndex.dat');
       if FileExists(FrontendPath+'resources\IconsList.ini') then
          DeleteFile(FrontendPath+'resources\IconsList.ini');
       if FileExists(FrontendPath+'resources\BigIconsList.dat') then
           DeleteFile(FrontendPath+'resources\BigIconsList.dat');
        if FileExists(FrontendPath+'resources\SmallIconsList.dat') then
           DeleteFile(FrontendPath+'resources\SmallIconsList.dat');

       if MenuRealIcons.Checked then
          MenuRealIcons.OnClick(Self);

       Application.ProcessMessages;
       LoadROMClasses(False);
       SortColumn(ColumnSorted, True);
       SelectedGame:= 0;
       SelectItem(SelectedGame);
     end;
  SetCurrentDir(FrontendPath);
  FormStatus.KeyPreview:= False;
  FormStatus.Close;
end;

function TFormMain.SaveLoadRealIcons(ActionIndex: Shortint): Boolean;
var
  GamesFileName: TMemoryStream;
begin
  Result:= True;
  case ActionIndex of
    0: //Save current real icons list
      begin
        if FileExists(FrontendPath+'resources\BigIconsList.dat') then
           DeleteFile(FrontendPath+'resources\BigIconsList.dat');
        if FileExists(FrontendPath+'resources\SmallIconsList.dat') then
           DeleteFile(FrontendPath+'resources\SmallIconsList.dat');

        Application.ProcessMessages;

        try
          GamesFileName:= TMemoryStream.Create;
          GamesFileName.WriteComponent(BigRealIconsImageList);
          GamesFileName.SaveToFile(FrontendPath+'resources\BigIconsList.dat');
        except
          on EStreamError do begin
                               GenerateMessage(GetLanguageText('Messages', 'OutOfMemoryTitle', 'Out of Memory'),
                                               Format(GetLanguageText('Messages', 'OutOfMemoryMsg', 'There is not enough memory to save %s file! Please restart Windows and try again.'), [FrontendPath+'resources\BigIconsList.dat']), 2);
                               Result:= False;
                             end;
        end;
        FreeAndNil(GamesFileName);

        if Result then
           begin
             try
               GamesFileName:= TMemoryStream.Create;
               GamesFileName.WriteComponent(SmallRealIconsImageList);
               GamesFileName.SaveToFile(FrontendPath+'resources\SmallIconsList.dat');
             except
               on EStreamError do begin
                                    GenerateMessage(GetLanguageText('Messages', 'OutOfMemoryTitle', 'Out of Memory'),
                                                    Format(GetLanguageText('Messages', 'OutOfMemoryMsg', 'There is not enough memory to save %s file! Please restart Windows and try again.'), [FrontendPath+'resources\SmallIconsList.dat']), 2);
                                    Result:= False;
                                  end;
             end;
             FreeAndNil(GamesFileName);
           end;
      end;
    1: //Load real icons to the icons list
      begin
        case FileExists(FrontendPath+'resources\BigIconsList.dat') and FileExists(FrontendPath+'resources\SmallIconsList.dat') of
          True:
            begin
              BigRealIconsImageList.Clear;
              SmallRealIconsImageList.Clear;
              Application.ProcessMessages;

              try
                GamesFileName:= TMemoryStream.Create;
                GamesFileName.LoadFromFile(FrontendPath+'resources\BigIconsList.dat');
                GamesFileName.ReadComponent(BigRealIconsImageList);
              except
                Result:= False;
              end;
              FreeAndNil(GamesFileName);

              if Result then
                 begin
                   try
                     GamesFileName:= TMemoryStream.Create;
                     GamesFileName.LoadFromFile(FrontendPath+'resources\SmallIconsList.dat');
                     GamesFileName.ReadComponent(SmallRealIconsImageList);
                   except
                     Result:= False;
                   end;
                   FreeAndNil(GamesFileName);
                 end;

              if (CheckDefaultIconsFile) and (Result) then
                 ReadDefaultIconsFile;
            end;
          False: Result:= False;
        end;
      end;
  end;
end;

procedure TFormMain.ButtonShowFavoriteClick(Sender: TObject);
begin
  MenuShowFavorite.Click;
end;

procedure TFormMain.PopupShowHideFavoriteUsersManagerClick(
  Sender: TObject);
begin
  MenuShowHideFavoriteUsersManager.Click;
end;

function TFormMain.VerifyFiles(VClassicMR: Boolean; VClassicMV: Boolean; VClassicCR: Boolean; VClassicCV: Boolean; VNeoGeoM: Boolean; VNeoGeoC: Boolean;
                               VUnClassicMR: Boolean; VUnClassicMV: Boolean; VUnClassicCR: Boolean; VUnClassicCV: Boolean; VUnNeoGeoM: Boolean; VUnNeoGeoC: Boolean;
                               VBios: Boolean; VUnBios: Boolean;
                               VCustomGames: Boolean; VUnCustomGames: Boolean; IsCustomList: Boolean): Boolean;
begin
  Result:= False;

  if VClassicMR then
     begin
       if FileExists(FrontendPath+'resources\ClassicMR.dat') then
          if GetFileSize(FrontendPath+'resources\ClassicMR.dat') > 0 then
             Result:= True;
     end;

  if VClassicMV then
     begin
       if FileExists(FrontendPath+'resources\ClassicMV.dat') then
          if GetFileSize(FrontendPath+'resources\ClassicMV.dat') > 0 then
             Result:= True;
     end;

  if VClassicCR then
     begin
       if FileExists(FrontendPath+'resources\ClassicCR.dat') then
          if GetFileSize(FrontendPath+'resources\ClassicCR.dat') > 0 then
             Result:= True;
     end;

  if VClassicCV then
     begin
       if FileExists(FrontendPath+'resources\ClassicCV.dat') then
          if GetFileSize(FrontendPath+'resources\ClassicCV.dat') > 0 then
             Result:= True;
     end;

  if VNeoGeoM then
     begin
       if FileExists(FrontendPath+'resources\NeoGeoM.dat') then
          if GetFileSize(FrontendPath+'resources\NeoGeoM.dat') > 0 then
             Result:= True;
     end;

  if VNeoGeoC then
     begin
       if FileExists(FrontendPath+'resources\NeoGeoC.dat') then
          if GetFileSize(FrontendPath+'resources\NeoGeoC.dat') > 0 then
             Result:= True;
     end;

  if VUnClassicMR then
     begin
       if FileExists(FrontendPath+'resources\UnClassicMR.dat') then
          if GetFileSize(FrontendPath+'resources\UnClassicMR.dat') > 0 then
             Result:= True;
     end;

  if VUnClassicMV then
     begin
       if FileExists(FrontendPath+'resources\UnClassicMV.dat') then
          if GetFileSize(FrontendPath+'resources\UnClassicMV.dat') > 0 then
             Result:= True;
     end;

  if VUnClassicCR then
     begin
       if FileExists(FrontendPath+'resources\UnClassicCR.dat') then
          if GetFileSize(FrontendPath+'resources\UnClassicCR.dat') > 0 then
             Result:= True;
     end;

  if VUnClassicCV then
     begin
       if FileExists(FrontendPath+'resources\UnClassicCV.dat') then
          if GetFileSize(FrontendPath+'resources\UnClassicCV.dat') > 0 then
             Result:= True;
     end;

  if VUnNeoGeoM then
     begin
       if FileExists(FrontendPath+'resources\UnNeoGeoM.dat') then
          if GetFileSize(FrontendPath+'resources\UnNeoGeoM.dat') > 0 then
             Result:= True;
     end;

  if VUnNeoGeoC then
     begin
       if FileExists(FrontendPath+'resources\UnNeoGeoC.dat') then
          if GetFileSize(FrontendPath+'resources\UnNeoGeoC.dat') > 0 then
             Result:= True;
     end;

  if VBios then
     begin
       if FileExists(FrontendPath+'resources\Bios.dat') then
          if GetFileSize(FrontendPath+'resources\Bios.dat') > 0 then
             Result:= True;
     end;

  if VUnBios then
     begin
       if FileExists(FrontendPath+'resources\UnBios.dat') then
          if GetFileSize(FrontendPath+'resources\UnBios.dat') > 0 then
             Result:= True;
     end;

  if VCustomGames then
     begin
       case FileExists(FrontendPath+'resources\CustomGames.dat') of
         True:
           begin
             if GetFileSize(FrontendPath+'resources\CustomGames.dat') > 0 then
                Result:= True;
           end;
         False:
           begin
             case IsCustomList of
               True: Result:= False;
               False:
                 case Result of
                   True : Result:= True;
                   False: Result:= False;
                 end;
             end;
           end;
       end;
     end;

  if VUnCustomGames then
     begin
       case FileExists(FrontendPath+'resources\UnCustomGames.dat') of
         True:
           begin
             if GetFileSize(FrontendPath+'resources\UnCustomGames.dat') > 0 then
                Result:= True;
           end;
         False:
           begin
             case IsCustomList of
               True: Result:= False;
               False:
                 case Result of
                   True : Result:= True;
                   False: Result:= False;
                 end;
             end;
           end;
       end;
     end;
end;

procedure TFormMain.SetGameType(GameTypeIndex: ShortInt);
var
  ChangeOption, ShowWarning: Boolean;
  SelectedGameCaption: String;
begin
 {Classic Master Raster
  Classic Master Vector
  Classic Clone Raster
  Classic Clone Vector
  Neo Geo Master
  Neo Geo Clone
  Un. Classic Master Raster
  Un. Classic Master Vector
  Un. Classic Clone Raster
  Un. Classic Clone Vector
  Un. Neo Geo Master
  Un. Neo Geo Clone
  Classic BIOS
  Neo Geo BIOS
  Un. Classic BIOS
  Un. Neo Geo BIOS
  Custom Games
  Un. Custom Games}

  Screen.Cursor:= crHourGlass;

  ChangeOption:= True;
  ShowWarning:= False;
  if List.Selected <> nil then
     SelectedGameCaption:= GamesList[SelectedGame].eDescription;

  if FormStatus.Visible then
     FormStatus.LabelProgress.Caption:= '';

  if GameTypeIndex = -1 then
     GameTypeIndex:= 0;
  CompleteGamesList:= THashedStringList.Create;
  case GameTypeIndex of
    0: // All games
      begin
        case ButtonGameFilters.Tag of
          0:
           begin
             case VerifyFiles(True, True, True, True, True, True, True, True, True, True, True, True, True, True, True, True, False) of
               True:
                 begin
                   ClassicMR:= LoadROMFilters('ClassicMR');
                   ClassicMV:= LoadROMFilters('ClassicMV');
                   ClassicCR:= LoadROMFilters('ClassicCR');
                   ClassicCV:= LoadROMFilters('ClassicCV');
                   NeoGeoM:= LoadROMFilters('NeoGeoM');
                   NeoGeoC:= LoadROMFilters('NeoGeoC');
                   UnavailableClassicMR:= LoadROMFilters('UnClassicMR');
                   UnavailableClassicMV:= LoadROMFilters('UnClassicMV');
                   UnavailableClassicCR:= LoadROMFilters('UnClassicCR');
                   UnavailableClassicCV:= LoadROMFilters('UnClassicCV');
                   UnavailableNeoGeoM:= LoadROMFilters('UnNeoGeoM');
                   UnavailableNeoGeoC:= LoadROMFilters('UnNeoGeoC');
                   BiosClassic:= LoadROMFilters('ClassicBios');
                   BiosNeoGeo:= LoadROMFilters('NeoGeoBios');
                   UnavailableBiosClassic:= LoadROMFilters('UnClassicBios');
                   UnavailableBiosNeoGeo:= LoadROMFilters('UnNeoGeoBios');
                   CustomGames:= LoadROMFilters('CustomGames');
                   UnavailableCustomGames:= LoadROMFilters('UnCustomGames');
                 end;
               False: ShowWarning:= True;
             end;
           end;
          1:
           begin
             case VerifyFiles(True, True, True, True, True, True, False, False, False, False, False, False, True, False, True, False, False) of
               True:
                 begin
                   UnavailableClassicMR:= False;
                   UnavailableClassicMV:= False;
                   UnavailableClassicCR:= False;
                   UnavailableClassicCV:= False;
                   UnavailableNeoGeoM:= False;
                   UnavailableNeoGeoC:= False;
                   UnavailableBiosClassic:= False;
                   UnavailableBiosNeoGeo:= False;
                   UnavailableCustomGames:= False;

                   ClassicMR:= LoadROMFilters('ClassicMR');
                   ClassicMV:= LoadROMFilters('ClassicMV');
                   ClassicCR:= LoadROMFilters('ClassicCR');
                   ClassicCV:= LoadROMFilters('ClassicCV');
                   NeoGeoM:= LoadROMFilters('NeoGeoM');
                   NeoGeoC:= LoadROMFilters('NeoGeoC');
                   BiosClassic:= LoadROMFilters('ClassicBios');
                   BiosNeoGeo:= LoadROMFilters('NeoGeoBios');
                   CustomGames:= LoadROMFilters('CustomGames');
                 end;
               False: ShowWarning:= True;
             end;
           end;
          2:
           begin
             case VerifyFiles(False, False, False, False, False, False, True, True, True, True, True, True, False, True, False, True, False) of
               True:
                 begin
                   ClassicMR:= False;
                   ClassicMV:= False;
                   ClassicCR:= False;
                   ClassicCV:= False;
                   NeoGeoM:= False;
                   NeoGeoC:= False;
                   BiosClassic:= False;
                   BiosNeoGeo:= False;
                   CustomGames:= False;

                   UnavailableClassicMR:= LoadROMFilters('UnClassicMR');
                   UnavailableClassicMV:= LoadROMFilters('UnClassicMV');
                   UnavailableClassicCR:= LoadROMFilters('UnClassicCR');
                   UnavailableClassicCV:= LoadROMFilters('UnClassicCV');
                   UnavailableNeoGeoM:= LoadROMFilters('UnNeoGeoM');
                   UnavailableNeoGeoC:= LoadROMFilters('UnNeoGeoC');
                   UnavailableBiosClassic:= LoadROMFilters('UnClassicBios');
                   UnavailableBiosNeoGeo:= LoadROMFilters('UnNeoGeoBios');
                   UnavailableCustomGames:= LoadROMFilters('UnCustomGames');
                 end;
               False: ShowWarning:= True;
             end;
           end;
        end;
      end;
    1: // Classic games only
      begin
        case ButtonGameFilters.Tag of
          0:
           begin
             case VerifyFiles(True, True, True, True, False, False, True, True, True, True, False, False, True, True, False, False, False) of
               True:
                 begin
                   NeoGeoM:= False;
                   NeoGeoC:= False;
                   UnavailableNeoGeoM:= False;
                   UnavailableNeoGeoC:= False;
                   BiosNeoGeo:= False;
                   UnavailableBiosNeoGeo:= False;
                   CustomGames:= False;
                   UnavailableCustomGames:= False;

                   ClassicMR:= LoadROMFilters('ClassicMR');
                   ClassicMV:= LoadROMFilters('ClassicMV');
                   ClassicCR:= LoadROMFilters('ClassicCR');
                   ClassicCV:= LoadROMFilters('ClassicCV');
                   UnavailableClassicMR:= LoadROMFilters('UnClassicMR');
                   UnavailableClassicMV:= LoadROMFilters('UnClassicMV');
                   UnavailableClassicCR:= LoadROMFilters('UnClassicCR');
                   UnavailableClassicCV:= LoadROMFilters('UnClassicCV');
                   BiosClassic:= LoadROMFilters('ClassicBios');
                   UnavailableBiosClassic:= LoadROMFilters('UnClassicBios');
                 end;
               False: ShowWarning:= True;
             end;
           end;
          1:
           begin
             case VerifyFiles(True, False, True, False, False, False, False, False, False, False, False, False, True, False, False, False, False) of
               True:
                 begin
                   ClassicMV:= False;
                   ClassicCV:= False;
                   NeoGeoM:= False;
                   NeoGeoC:= False;
                   BiosNeoGeo:= False;
                   CustomGames:= False;

                   UnavailableClassicMR:= False;
                   UnavailableClassicMV:= False;
                   UnavailableClassicCR:= False;
                   UnavailableClassicCV:= False;
                   UnavailableNeoGeoM:= False;
                   UnavailableNeoGeoC:= False;
                   UnavailableBiosClassic:= False;
                   UnavailableBiosNeoGeo:= False;
                   UnavailableCustomGames:= False;

                   ClassicMR:= LoadROMFilters('ClassicMR');
                   ClassicCR:= LoadROMFilters('ClassicCR');
                   BiosClassic:= LoadROMFilters('ClassicBios');
                 end;
               False: ShowWarning:= True;
             end;
           end;
          2:
           begin
             case VerifyFiles(False, False, False, False, False, False, True, False, True, False, False, False, False, True, False, False, False) of
               True:
                 begin
                   ClassicMR:= False;
                   ClassicMV:= False;
                   ClassicCR:= False;
                   ClassicCV:= False;
                   NeoGeoM:= False;
                   NeoGeoC:= False;
                   BiosClassic:= False;
                   BiosNeoGeo:= False;
                   CustomGames:= False;
                   UnavailableClassicMV:= False;
                   UnavailableClassicCV:= False;
                   UnavailableNeoGeoM:= False;
                   UnavailableNeoGeoC:= False;
                   UnavailableBiosNeoGeo:= False;
                   UnavailableCustomGames:= False;

                   UnavailableClassicMR:= LoadROMFilters('UnClassicMR');
                   UnavailableClassicCR:= LoadROMFilters('UnClassicCR');
                   UnavailableBiosClassic:= LoadROMFilters('UnClassicBios');
                 end;
               False: ShowWarning:= True;
             end;
           end;
        end;
      end;
    2: // Neo Geo games only
      begin
        case ButtonGameFilters.Tag of
          0:
           begin
             case VerifyFiles(False, False, False, False, True, True, False, False, False, False, True, True, True, True, False, False, False) of
               True:
                 begin
                   ClassicMR:= False;
                   ClassicMV:= False;
                   ClassicCR:= False;
                   ClassicCV:= False;
                   UnavailableClassicMR:= False;
                   UnavailableClassicMV:= False;
                   UnavailableClassicCR:= False;
                   UnavailableClassicCV:= False;
                   BiosClassic:= False;
                   UnavailableBiosClassic:= False;
                   CustomGames:= False;
                   UnavailableCustomGames:= False;

                   NeoGeoM:= LoadROMFilters('NeoGeoM');
                   NeoGeoC:= LoadROMFilters('NeoGeoC');
                   UnavailableNeoGeoM:= LoadROMFilters('UnNeoGeoM');
                   UnavailableNeoGeoC:= LoadROMFilters('UnNeoGeoC');
                   BiosNeoGeo:= LoadROMFilters('NeoGeoBios');
                   UnavailableBiosNeoGeo:= LoadROMFilters('UnNeoGeoBios');
                 end;
               False: ShowWarning:= True;
             end;
           end;
          1:
           begin
             case VerifyFiles(False, False, False, False, True, True, False, False, False, False, False, False, True, False, False, False, False) of
               True:
                 begin
                   ClassicMR:= False;
                   ClassicMV:= False;
                   ClassicCR:= False;
                   ClassicCV:= False;
                   UnavailableClassicMR:= False;
                   UnavailableClassicMV:= False;
                   UnavailableClassicCR:= False;
                   UnavailableClassicCV:= False;
                   UnavailableNeoGeoM:= False;
                   UnavailableNeoGeoC:= False;
                   BiosClassic:= False;
                   UnavailableBiosClassic:= False;
                   UnavailableBiosNeoGeo:= False;
                   CustomGames:= False;
                   UnavailableCustomGames:= False;

                   NeoGeoM:= LoadROMFilters('NeoGeoM');
                   NeoGeoC:= LoadROMFilters('NeoGeoC');
                   BiosNeoGeo:= LoadROMFilters('NeoGeoBios');
                 end;
               False: ShowWarning:= True;
             end;
           end;
          2:
           begin
             case VerifyFiles(False, False, False, False, False, False, False, False, False, False, True, True, False, True, False, False, False) of
               True:
                 begin
                   ClassicMR:= False;
                   ClassicMV:= False;
                   ClassicCR:= False;
                   ClassicCV:= False;
                   NeoGeoM:= False;
                   NeoGeoC:= False;
                   UnavailableClassicMR:= False;
                   UnavailableClassicMV:= False;
                   UnavailableClassicCR:= False;
                   UnavailableClassicCV:= False;
                   BiosClassic:= False;
                   BiosNeoGeo:= False;
                   UnavailableBiosClassic:= False;
                   UnavailableBiosNeoGeo:= False;
                   CustomGames:= False;
                   UnavailableCustomGames:= False;

                   UnavailableNeoGeoM:= LoadROMFilters('UnNeoGeoM');
                   UnavailableNeoGeoC:= LoadROMFilters('UnNeoGeoC');
                   UnavailableBiosNeoGeo:= LoadROMFilters('UnNeoGeoBios');
                 end;
               False: ShowWarning:= True;
             end;
           end;
        end;
      end;
    3: // Master games only
      begin
        case ButtonGameFilters.Tag of
          0:
           begin
             case VerifyFiles(True, True, False, False, True, False, True, True, False, False, True, False, True, True, False, False, False) of
               True:
                 begin
                   ClassicCR:= False;
                   ClassicCV:= False;
                   NeoGeoC:= False;
                   UnavailableClassicCR:= False;
                   UnavailableClassicCV:= False;
                   UnavailableNeoGeoC:= False;
                   CustomGames:= False;
                   UnavailableCustomGames:= False;

                   ClassicMR:= LoadROMFilters('ClassicMR');
                   ClassicMV:= LoadROMFilters('ClassicMV');
                   NeoGeoM:= LoadROMFilters('NeoGeoM');
                   UnavailableClassicMR:= LoadROMFilters('UnClassicMR');
                   UnavailableClassicMV:= LoadROMFilters('UnClassicMV');
                   UnavailableNeoGeoM:= LoadROMFilters('UnNeoGeoM');
                   BiosClassic:= LoadROMFilters('ClassicBios');
                   BiosNeoGeo:= LoadROMFilters('NeoGeoBios');
                   UnavailableBiosClassic:= LoadROMFilters('UnClassicBios');
                   UnavailableBiosNeoGeo:= LoadROMFilters('UnNeoGeoBios');
                 end;
               False: ShowWarning:= True;
             end;
           end;
          1:
           begin
             case VerifyFiles(True, True, False, False, True, False, False, False, False, False, False, False, True, False, False, False, False) of
               True:
                 begin
                   ClassicCR:= False;
                   ClassicCV:= False;
                   NeoGeoC:= False;
                   UnavailableClassicMR:= False;
                   UnavailableClassicMV:= False;
                   UnavailableClassicCR:= False;
                   UnavailableClassicCV:= False;
                   UnavailableNeoGeoM:= False;
                   UnavailableNeoGeoC:= False;
                   UnavailableBiosClassic:= False;
                   UnavailableBiosNeoGeo:= False;
                   CustomGames:= False;
                   UnavailableCustomGames:= False;

                   ClassicMR:= LoadROMFilters('ClassicMR');
                   ClassicMV:= LoadROMFilters('ClassicMV');
                   NeoGeoM:= LoadROMFilters('NeoGeoM');
                   BiosClassic:= LoadROMFilters('ClassicBios');
                   BiosNeoGeo:= LoadROMFilters('NeoGeoBios');
                 end;
               False: ShowWarning:= True;
             end;
           end;
          2:
           begin
             case VerifyFiles(False, False, False, False, False, False, True, True, False, False, True, False, False, True, False, False, False) of
               True:
                 begin
                   ClassicMR:= False;
                   ClassicMV:= False;
                   ClassicCR:= False;
                   ClassicCV:= False;
                   NeoGeoM:= False;
                   NeoGeoC:= False;
                   UnavailableClassicCR:= False;
                   UnavailableClassicCV:= False;
                   UnavailableNeoGeoC:= False;
                   BiosClassic:= False;
                   BiosNeoGeo:= False;
                   CustomGames:= False;
                   UnavailableCustomGames:= False;

                   UnavailableClassicMR:= LoadROMFilters('UnClassicMR');
                   UnavailableClassicMV:= LoadROMFilters('UnClassicMV');
                   UnavailableNeoGeoM:= LoadROMFilters('UnNeoGeoM');
                   UnavailableBiosClassic:= LoadROMFilters('UnClassicBios');
                   UnavailableBiosNeoGeo:= LoadROMFilters('UnNeoGeoBios');
                 end;
               False: ShowWarning:= True;
             end;
           end;
        end;
      end;
    4: // Clone games only
      begin
        case ButtonGameFilters.Tag of
          0:
           begin
             case VerifyFiles(False, False, True, True, False, True, False, False, True, True, False, True, True, True, False, False, False) of
               True:
                 begin
                   ClassicMR:= False;
                   ClassicMV:= False;
                   NeoGeoM:= False;
                   UnavailableClassicMR:= False;
                   UnavailableClassicMV:= False;
                   UnavailableNeoGeoM:= False;
                   BiosClassic:= False;
                   UnavailableBiosClassic:= False;
                   BiosNeoGeo:= False;
                   UnavailableBiosNeoGeo:= False;
                   CustomGames:= False;
                   UnavailableCustomGames:= False;

                   ClassicCR:= LoadROMFilters('ClassicCR');
                   ClassicCV:= LoadROMFilters('ClassicCV');
                   NeoGeoC:= LoadROMFilters('NeoGeoC');
                   UnavailableClassicCR:= LoadROMFilters('UnClassicCR');
                   UnavailableClassicCV:= LoadROMFilters('UnClassicCV');
                   UnavailableNeoGeoC:= LoadROMFilters('UnNeoGeoC');
                 end;
               False: ShowWarning:= True;
             end;
           end;
          1:
           begin
             case VerifyFiles(False, False, True, True, False, True, False, False, False, False, False, False, False, False, False, False, False) of
               True:
                 begin
                   ClassicMR:= False;
                   ClassicMV:= False;
                   NeoGeoM:= False;
                   UnavailableClassicMR:= False;
                   UnavailableClassicMV:= False;
                   UnavailableClassicCR:= False;
                   UnavailableClassicCV:= False;
                   UnavailableNeoGeoM:= False;
                   UnavailableNeoGeoC:= False;
                   BiosClassic:= False;
                   UnavailableBiosClassic:= False;
                   BiosNeoGeo:= False;
                   UnavailableBiosNeoGeo:= False;
                   CustomGames:= False;
                   UnavailableCustomGames:= False;

                   ClassicCR:= LoadROMFilters('ClassicCR');
                   ClassicCV:= LoadROMFilters('ClassicCV');
                   NeoGeoC:= LoadROMFilters('NeoGeoC');
                 end;
               False: ShowWarning:= True;
             end;
           end;
          2:
           begin
             case VerifyFiles(False, False, False, False, False, False, False, False, True, True, False, True, False, False, False, False, False) of
               True:
                 begin
                   ClassicMR:= False;
                   ClassicMV:= False;
                   ClassicCR:= False;
                   ClassicCV:= False;
                   NeoGeoM:= False;
                   NeoGeoC:= False;
                   UnavailableClassicMR:= False;
                   UnavailableClassicMV:= False;
                   UnavailableNeoGeoM:= False;
                   BiosClassic:= False;
                   UnavailableBiosClassic:= False;
                   BiosNeoGeo:= False;
                   UnavailableBiosNeoGeo:= False;
                   CustomGames:= False;
                   UnavailableCustomGames:= False;

                   UnavailableClassicCR:= LoadROMFilters('UnClassicCR');
                   UnavailableClassicCV:= LoadROMFilters('UnClassicCV');
                   UnavailableNeoGeoC:= LoadROMFilters('UnNeoGeoC');
                 end;
               False: ShowWarning:= True;
             end;
           end;
        end;
      end;
    5: // Raster games only
      begin
        case ButtonGameFilters.Tag of
          0:
           begin
             case VerifyFiles(True, False, True, False, True, True, True, False, True, False, True, True, True, True, False, False, False) of
               True:
                 begin
                   ClassicMV:= False;
                   ClassicCV:= False;
                   UnavailableClassicMV:= False;
                   UnavailableClassicCV:= False;
                   CustomGames:= False;
                   UnavailableCustomGames:= False;

                   ClassicMR:= LoadROMFilters('ClassicMR');
                   ClassicCR:= LoadROMFilters('ClassicCR');
                   NeoGeoM:= LoadROMFilters('NeoGeoM');
                   NeoGeoC:= LoadROMFilters('NeoGeoC');
                   UnavailableClassicMR:= LoadROMFilters('UnClassicMR');
                   UnavailableClassicCR:= LoadROMFilters('UnClassicCR');
                   UnavailableNeoGeoM:= LoadROMFilters('UnNeoGeoM');
                   UnavailableNeoGeoC:= LoadROMFilters('UnNeoGeoC');
                   BiosClassic:= LoadROMFilters('ClassicBios');
                   BiosNeoGeo:= LoadROMFilters('NeoGeoBios');
                   UnavailableBiosClassic:= LoadROMFilters('UnClassicBios');
                   UnavailableBiosNeoGeo:= LoadROMFilters('UnNeoGeoBios');
                 end;
               False: ShowWarning:= True;
             end;
           end;
          1:
           begin
             case VerifyFiles(True, False, True, False, True, True, False, False, False, False, False, False, True, False, False, False, False) of
               True:
                 begin
                   ClassicMV:= False;
                   ClassicCV:= False;
                   UnavailableClassicMR:= False;
                   UnavailableClassicMV:= False;
                   UnavailableClassicCR:= False;
                   UnavailableClassicCV:= False;
                   UnavailableNeoGeoM:= False;
                   UnavailableNeoGeoC:= False;
                   UnavailableBiosClassic:= False;
                   UnavailableBiosNeoGeo:= False;
                   CustomGames:= False;
                   UnavailableCustomGames:= False;

                   ClassicMR:= LoadROMFilters('ClassicMR');
                   ClassicCR:= LoadROMFilters('ClassicCR');
                   NeoGeoM:= LoadROMFilters('NeoGeoM');
                   NeoGeoC:= LoadROMFilters('NeoGeoC');
                   BiosClassic:= LoadROMFilters('ClassicBios');
                   BiosNeoGeo:= LoadROMFilters('NeoGeoBios');
                 end;
               False: ShowWarning:= True;
             end;
           end;
          2:
           begin
             case VerifyFiles(True, False, True, False, True, True, True, False, True, False, True, True, True, True, False, False, False) of
               True:
                 begin
                   ClassicMR:= False;
                   ClassicMV:= False;
                   ClassicCR:= False;
                   ClassicCV:= False;
                   NeoGeoM:= False;
                   NeoGeoC:= False;
                   UnavailableClassicMV:= False;
                   UnavailableClassicCV:= False;
                   BiosClassic:= False;
                   BiosNeoGeo:= False;
                   CustomGames:= False;
                   UnavailableCustomGames:= False;

                   UnavailableClassicMR:= LoadROMFilters('UnClassicMR');
                   UnavailableClassicCR:= LoadROMFilters('UnClassicCR');
                   UnavailableNeoGeoM:= LoadROMFilters('UnNeoGeoM');
                   UnavailableNeoGeoC:= LoadROMFilters('UnNeoGeoC');
                   UnavailableBiosClassic:= LoadROMFilters('UnClassicBios');
                   UnavailableBiosNeoGeo:= LoadROMFilters('UnNeoGeoBios');
                 end;
               False: ShowWarning:= True;
             end;
           end;
        end;
      end;
    6: // Vector games only
      begin
        case ButtonGameFilters.Tag of
          0:
           begin
             case VerifyFiles(False, True, False, True, False, False, False, True, False, True, False, False, False, False, False, False, False) of
               True:
                 begin
                   ClassicMR:= False;
                   ClassicCR:= False;
                   NeoGeoM:= False;
                   NeoGeoC:= False;
                   UnavailableClassicMR:= False;
                   UnavailableClassicCR:= False;
                   UnavailableNeoGeoM:= False;
                   UnavailableNeoGeoC:= False;
                   BiosClassic:= False;
                   UnavailableBiosClassic:= False;
                   BiosNeoGeo:= False;
                   UnavailableBiosNeoGeo:= False;
                   CustomGames:= False;
                   UnavailableCustomGames:= False;

                   ClassicMV:= LoadROMFilters('ClassicMV');
                   ClassicCV:= LoadROMFilters('ClassicCV');
                   UnavailableClassicMV:= LoadROMFilters('UnClassicMV');
                   UnavailableClassicCV:= LoadROMFilters('UnClassicCV');
                 end;
               False: ShowWarning:= True;
             end;
           end;
          1:
           begin
             case VerifyFiles(False, True, False, True, False, False, False, False, False, False, False, False, False, False, False, False, False) of
               True:
                 begin
                   ClassicMR:= False;
                   ClassicCR:= False;
                   NeoGeoM:= False;
                   NeoGeoC:= False;
                   UnavailableClassicMR:= False;
                   UnavailableClassicMV:= False;
                   UnavailableClassicCR:= False;
                   UnavailableClassicCV:= False;
                   UnavailableNeoGeoM:= False;
                   UnavailableNeoGeoC:= False;
                   BiosClassic:= False;
                   UnavailableBiosClassic:= False;
                   BiosNeoGeo:= False;
                   UnavailableBiosNeoGeo:= False;
                   CustomGames:= False;
                   UnavailableCustomGames:= False;

                   ClassicMV:= LoadROMFilters('ClassicMV');
                   ClassicCV:= LoadROMFilters('ClassicCV');
                 end;
               False: ShowWarning:= True;
             end;
           end;
          2:
           begin
             case VerifyFiles(False, False, False, False, False, False, False, True, False, True, False, False, False, False, False, False, False) of
               True:
                 begin
                   ClassicMR:= False;
                   ClassicMV:= False;
                   ClassicCR:= False;
                   ClassicCV:= False;
                   NeoGeoM:= False;
                   NeoGeoC:= False;
                   UnavailableClassicMR:= False;
                   UnavailableClassicCR:= False;
                   UnavailableNeoGeoM:= False;
                   UnavailableNeoGeoC:= False;
                   BiosClassic:= False;
                   UnavailableBiosClassic:= False;
                   BiosNeoGeo:= False;
                   UnavailableBiosNeoGeo:= False;
                   CustomGames:= False;
                   UnavailableCustomGames:= False;

                   UnavailableClassicMV:= LoadROMFilters('UnClassicMV');
                   UnavailableClassicCV:= LoadROMFilters('UnClassicCV');
                 end;
               False: ShowWarning:= True;
             end;
           end;
        end;
      end;
    7: // Custom Games
      begin
        case VerifyFiles(False, False, False, False, False, False, False, False, False, False, False, False, False, False, True, True, True) of
          True:
            begin
              ClassicMR:= False;
              ClassicMV:= False;
              ClassicCR:= False;
              ClassicCV:= False;
              NeoGeoM:= False;
              NeoGeoC:= False;
              UnavailableClassicMR:= False;
              UnavailableClassicMV:= False;
              UnavailableClassicCR:= False;
              UnavailableClassicCV:= False;
              UnavailableNeoGeoM:= False;
              UnavailableNeoGeoC:= False;
              BiosClassic:= False;
              UnavailableBiosClassic:= False;
              BiosNeoGeo:= False;
              UnavailableBiosNeoGeo:= False;

              CustomGames:= LoadROMFilters('CustomGames');
              UnavailableCustomGames:= LoadROMFilters('UnCustomGames');
            end;
          False: ShowWarning:= True;
        end;
      end;
  end;

  if ShowWarning then
     begin
       ShowPicture('NoGamesAvailable', '', Picture, -1, True);
       // no games on list, show the "No Games Available" image
       ChangeOption:= False;
     end;

  case ChangeOption of
    False: GameTypeIndex:= ListFilterActualSelection;
    True:
      begin
        if not AddGames(True) then
           Application.MessageBox('Oops. Could not add games. This error cannot happen! Please contact Emu Loader author at emuloader@mameworld.net', 'Fatal Error', mb_Ok+mb_IconError);

        StatusBarShownGames.Caption:= Format(GetLanguageText('Main', 'StatusBarShownGames', '%u Games'), [Length(GamesList)]);
        SetRealIcons;
        ShowingPicture:= True;
        ListFilterActualSelection:= ButtonGameType.Tag;
        SortColumn(ColumnSorted, True);
        SelectItem(FindGame(SelectedGame, SelectedGameCaption));
      end;
  end;
  FreeAndNil(CompleteGamesList);

  ButtonGameType.Tag:= GameTypeIndex;
  case ButtonGameFilters.Tag of
    0: ButtonGameFilters.ImageIndex:= 65;
    1: ButtonGameFilters.ImageIndex:= 66;
    2: ButtonGameFilters.ImageIndex:= 67;
  end;
  List.SetFocus;
  Screen.Cursor:= crDefault;
end;

procedure TFormMain.ButtonViewPicture(ButtonCode: ShortInt);
var
  LoopPicture: ShortInt;
  PictureName: String;

  procedure FreeMemoryFiles;
  begin
    FreeAndNil(ListROMsName);
    FreeAndNil(ListROMsSize);
    FreeAndNil(ListROMsCRC);
    FreeAndNil(ListROMsNameFullPath);
  end;

begin
  if MenuShowPictures.Checked then
     begin
       if (FormPreferences.PicturesVirtualList.Checked) and (PicturesToolBar.Tag in [0..1]) and (not FormPreferences.CyclePictureTypes.Checked) then
          Exit;
       Screen.Cursor:= crHourGlass;
       case ButtonCode of
         1: // Next Button
           begin
             Inc(PictureNumber);
             if PictureNumber > 100 then
                begin
                  if FormPreferences.CyclePictureTypes.Checked then
                     CyclePictureType
                  else
                     begin
                       if not FormPreferences.PicturesVirtualList.Checked then
                          ButViewPreviousPicture.Tag:= -1;
                       PictureNumber:= Picture.Tag;
                     end;
                end
             else
                begin
                  for LoopPicture:=PictureNumber to 101 do
                  begin
                    PictureName:= ShowPicture(GamesList[SelectedGame].eName, GamesList[SelectedGame].eClone, Picture, PictureType, False);
                    if PictureName <> 'No Change' then
                       begin
                         Picture.Hint:= PictureName;
                         ButViewNextPicture.Tag:= ButViewNextPicture.Tag+1;
                         PictureNumber:= LoopPicture;
                         Break;
                       end;
                    Inc(PictureNumber);
                  end;
                  FreeMemoryFiles;
                  if PictureNumber > 100 then
                     begin
                       if FormPreferences.CyclePictureTypes.Checked then
                          CyclePictureType
                       else
                          begin
                            if not FormPreferences.PicturesVirtualList.Checked then
                               ButViewPreviousPicture.Tag:= -1;
                            PictureNumber:= Picture.Tag;
                          end;
                     end;
                end;
           end;
         0: // Previous Button
           begin
             Dec(PictureNumber);
             if PictureNumber < 1 then
                begin
                  if FormPreferences.CyclePictureTypes.Checked then
                     InvertCyclePictureType
                  else
                     PictureNumber:= Picture.Tag;
                end
             else
                begin
                  for LoopPicture:=PictureNumber downto 0 do
                  begin
                    PictureName:= ShowPicture(GamesList[SelectedGame].eName, GamesList[SelectedGame].eClone, Picture, PictureType, False);
                    if PictureName <> 'No Change' then
                       begin
                         Picture.Hint:= PictureName;
                         ButViewNextPicture.Tag:= ButViewNextPicture.Tag-1;
                         PictureNumber:= LoopPicture;
                         Break;
                       end;
                    Dec(PictureNumber);
                  end;
                  FreeMemoryFiles;
                  if PictureNumber < 1 then
                     begin
                       if FormPreferences.CyclePictureTypes.Checked then
                          InvertCyclePictureType
                       else
                          PictureNumber:= 1;
                     end;
                end;
           end;
       end;
       UpdateLabelPictures;
       Screen.Cursor:= crDefault;
       ShowingPicture:= True;
     end;
end;

procedure TFormMain.PopupShowInGameSnapshotClick(Sender: TObject);
begin
  MenuShowInGameSnapshot.Click;
end;

procedure TFormMain.PopupShowMarqueeClick(Sender: TObject);
begin
  MenuShowMarquee.Click;
end;

procedure TFormMain.PopupShowFlyerClick(Sender: TObject);
begin
  MenuShowFlyer.Click;
end;

procedure TFormMain.PopupShowCabinetClick(Sender: TObject);
begin
  MenuShowCabinet.Click;
end;

procedure TFormMain.PopupShowControlPanelClick(Sender: TObject);
begin
  MenuShowControlPanel.Click;
end;

procedure TFormMain.MenuAboutClick(Sender: TObject);
var
  LanguageFile: TMemIniFile;
begin
  if not Assigned(FormAbout) then
     FormAbout:= TFormAbout.Create(Self);
  if FileExists(FrontendPath+'resources\language\'+FrontendLanguage+'.lng') then
     begin
       LanguageFile:= TMemIniFile.Create(FrontendPath+'resources\language\'+FrontendLanguage+'.lng');

       FormAbout.ButtonClose.Caption:= GetLanguageText('Resource', 'ButtonClose', '&Close');
       FormAbout.ButtonClose.Hint:= GetLanguageText('Resource', 'ButtonCloseHint', 'Close this window');
     end;
  FreeAndNil(LanguageFile);

  FormAbout.ShowModal;
  FreeAndNil(FormAbout);
end;

procedure TFormMain.MenuViewTextFilesClick(Sender: TObject);
begin
  if not Assigned(FormTextViewer) then
     FormTextViewer:= TFormTextViewer.Create(Self);

  FormTextViewer.EmulatorPath:= ShortToLongPath(ExtractFilePath(GetCurrentEmulatorExecutable))+'docs\';

  FormTextViewer.ShowModal;
  FreeAndNil(FormTextViewer);
end;

procedure TFormMain.FormActivate(Sender: TObject);
var
  DefColor: Integer;
begin
  // Need to do this trick or everytime you click on the main screen
  // or call another screen, these lines always keep executing
  // This is ment to be executed only one time (when initializing the frontend)
  if ToolBarsPanel.Tag = 0 then
     begin
       if Tag = 1 then
          WindowState:= wsMaximized
       else
          begin
            if ((FormMain.Top = 0) and (FormMain.Left = 0)) then
               begin
                 FormMain.Top:= (Screen.Height-FormMain.Height) div 2;
                 FormMain.Left:= (Screen.Width-FormMain.Width) div 2;
               end;
          end;

       if FormPreferences.StretchLargerPictures.Tag = 1 then
          FormPreferences.StretchLargerPictures.Checked:= True
       else
          SetAspectRatio(Picture);

       ToolBarsPanel.Tag:= 1;
       ListFilterActualSelection:= ButtonGameType.Tag;
       case FormPreferences.StretchPicture.Tag of
         0: //False
           begin
             FormPreferences.StretchPicture.Tag:= 1;
             FormPreferences.StretchPicture.Checked:= False;
             FormPreferences.StretchPicture.Tag:= 0;
           end;
         1: FormPreferences.StretchPicture.Tag:= 0;
       end;

       case ButtonModeView.Tag of
         0: MenuModeViewBigIcons.Click;
         1: MenuModeViewSmallIcons.Click;
         2: MenuModeViewList.Click;
       end;
       FormPreferences.ShowPreliminaryGamesDisabled.Tag:= 0;
       Application.ProcessMessages;

       if MenuAutomaticGameInformation.Tag = 1 then
          begin
            MenuAutomaticGameInformation.Tag:= 0;
            MenuAutomaticGameInformation.Click;
          end;

       if MenuFullScreen.Tag = 1 then
          MenuFullScreen.Click;

       FormStatus.LabelProgress.Caption:= '';
       FormStatus.Close;
     end;
end;

procedure TFormMain.MenuShowGamesIconsLegendClick(Sender: TObject);
begin
  case MenuShowGamesIconsLegend.Checked of
    True:
      begin
        if not Assigned(FormGamesListLegend) then
           FormGamesListLegend:= TFormGamesListLegend.Create(Self);
        FormGamesListLegend.Show;
      end;
    False:
      begin
        FormGamesListLegend.Release;
        FormGamesListLegend:= nil;
      end;
  end;
end;

procedure TFormMain.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
var
  Loop: ShortInt;
begin
  // Check "EmuLoader.ini" file not "Read Only" attribute
  if not CheckFileAttributes('EmuLoader.ini') then
     UpdateINIFile;

  if Assigned(FormFavoriteUsersManager) then
     FreeAndNil(FormFavoriteUsersManager);

  if Assigned(FormGamesListLegend) then
     FreeAndNil(FormGamesListLegend);

  if Assigned(AutoMAMEInfoDATFile) then
     FreeAndNil(AutoMAMEInfoDATFile);

  if MenuFullScreen.Checked then
     MenuFullScreen.Click;

  // free any created entries
  ClearEntries;
  for Loop:=0 to Length(EmulatorType) do
  begin
    Finalize(EmulatorType[Loop]);
    Finalize(EmulatorVersion[Loop]);
    Finalize(EmulatorExecutable[Loop]);
  end;
end;

procedure TFormMain.ListKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (FormPreferences.HotRod.Checked) or (FormPreferences.XArcade.Checked) then
     begin
       if (Key = VK_NUMPAD8) and (Shift = [ssCtrl]) then
          begin
            // Simutate a "Page Up" key pressing
            KeyBd_Event(VK_PRIOR, 0, 0, KEYEVENTF_KEYUP);
          end
       else
       if (Key = VK_NUMPAD2) and (Shift = [ssCtrl]) then
          begin
            // Simutate a "Page Down" key pressing
            KeyBd_Event(VK_NEXT, 0, 0, KEYEVENTF_KEYUP);
          end
       else
       if (Key = VK_NUMPAD4) and (Shift = [ssCtrl]) then
          begin
            // Simutate a "Left Key " key pressing
            KeyBd_Event(VK_LEFT, 0, 0, KEYEVENTF_KEYUP);
          end
       else
       if (Key = VK_NUMPAD6) and (Shift = [ssCtrl]) then
          begin
            // Simutate a "Right Key" key pressing
            KeyBd_Event(VK_RIGHT, 0, 0, KEYEVENTF_KEYUP);
          end
       else
       if Shift = [ssAlt] then
          begin
            // Simutate a "Home Key" key pressing
            KeyBd_Event(VK_HOME, 0, 0, KEYEVENTF_KEYUP);
          end
       else
       if (Key = Ord('Z')) or (Key = Ord('z')) then
          begin
            // Simutate a "End Key" key pressing
            KeyBd_Event(VK_END, 0, 0, KEYEVENTF_KEYUP);
          end
       else
       if Key = VK_NUMPAD8 then
          begin
            // Simutate a "Up Key" key pressing
            KeyBd_Event(VK_UP, 0, 0, KEYEVENTF_KEYUP);
          end
       else
       if Key = VK_NUMPAD2 then
          begin
            // Simutate a "Down Key" key pressing
            KeyBd_Event(VK_DOWN, 0, 0, KEYEVENTF_KEYUP);
          end
       else
       if Key = VK_NUMPAD4 then
          begin
            List.Scroll(-5,0);
          end
       else
       if Key = VK_NUMPAD6 then
          begin
            List.Scroll(5,0);
          end;

       {if Shift = [ssAlt] then
          begin
            // Simutate a "Home Key" key pressing
            KeyBd_Event(VK_HOME, 0, 0, KEYEVENTF_KEYUP);
          end
       else
       if (Key = Ord('Z')) or (Key = Ord('z')) then
          begin
            // Simutate a "End Key" key pressing
            KeyBd_Event(VK_END, 0, 0, KEYEVENTF_KEYUP);
          end;}
     end
  else
  if FormPreferences.SlikStik.Checked then
     begin
       if Shift = [ssShift] then
          begin
            if MenuFullScreen.Visible then
               MenuFullScreen.Click;
          end
       else
       if Key = Ord('7') then
          begin
            // Simutate a "Page Up" key pressing
            KeyBd_Event(VK_PRIOR, 0, 0, KEYEVENTF_KEYUP);
          end
       else
       if Key = Ord('0') then
          begin
            // Simutate a "Page Down" key pressing
            KeyBd_Event(VK_NEXT, 0, 0, KEYEVENTF_KEYUP);
          end
       else
       if (Key = Ord('H')) or (Key = Ord('h')) then
          begin
            // Simutate a "Home Key" key pressing
            KeyBd_Event(VK_HOME, 0, 0, KEYEVENTF_KEYUP);
          end
       else
       if (Key = Ord('Z')) or (Key = Ord('z')) then
          begin
            // Simutate a "End Key" key pressing
            KeyBd_Event(VK_END, 0, 0, KEYEVENTF_KEYUP);
          end;
     end;
end;

procedure TFormMain.MenuCustomGamesManagerClick(Sender: TObject);
begin
  if not Assigned(FormCustomGames) then
     FormCustomGames:= TFormCustomGames.Create(Self);
  FormCustomGames.ShowModal;
  FreeAndNil(FormCustomGames);
  if ((FileExists(FrontendPath+'resources\CustomGames.dat')) and
      (FileExists(FrontendPath+'resources\UnCustomGames.dat'))) then
     begin
       if ((GetFileSize(FrontendPath+'resources\CustomGames.dat') = 0) and
           (GetFileSize(FrontendPath+'resources\UnCustomGames.dat') = 0)) then
          begin
            DeleteFile(FrontendPath+'resources\CustomGames.dat');
            DeleteFile(FrontendPath+'resources\UnCustomGames.dat');
            if FileExists(FrontendPath+'resources\CustomGamesCmd.ini') then
               DeleteFile(FrontendPath+'resources\CustomGamesCmd.ini');
          end;
     end;
end;

procedure TFormMain.MenuPlayGameStandardClick(Sender: TObject);
begin
  case FormPreferences.UseCustomOptionsDefault.Checked of
    True : MenuPlayGame.OnClick(Self);
    False: ExecuteGame(GamesList[SelectedGame].eName, True, FormPreferences.AverageFPS.Checked);
  end;
end;

procedure TFormMain.MenuGamesClick(Sender: TObject);
var
  CheckFile: String;
begin
  if GamesList[SelectedGame].eDescription <> '' then
  begin
    case ButtonShowFavorite.Down of
      True:
        begin
          MenuAddToFavorites.Enabled:= False;
          MenuDeleteFromFavorites.Enabled:= True;

          PopupAddToFavorites.Enabled:= False;
          PopupDeleteFromFavorites.Enabled:= True;
        end;
      False:
        begin
          MenuAddToFavorites.Enabled:= True;
          MenuDeleteFromFavorites.Enabled:= False;

          PopupAddToFavorites.Enabled:= True;
          PopupDeleteFromFavorites.Enabled:= False;
        end;
    end;

    if GamesList[SelectedGame].eROMIdentification in [0..15] then
       begin
         MenuCustomGameOptions.Enabled:= True;
         PopupCustomGameOptions.Enabled:= True;
         MenuCustomCommandLine.Enabled:= True;
         MenuGameDescription.Enabled:= True;
         MenuGameCategory.Enabled:= True;

         PopupCustomCommandLine.Enabled:= True;
         PopupGameDescription.Enabled:= True;
         PopupGameCategory.Enabled:= True;

         MenuAuditSelectedGame.Enabled:= True;
         PopupAuditSelectedGame.Enabled:= True;

         case GetCurrentEmulatorFormat of
           1: begin
                CheckFile:= IniFilesDir+'\'+GamesList[SelectedGame].eName+'.ini';
                SetCurrentDir(ExtractFilePath(GetCurrentEmulatorExecutable));
                MenuCustomInitializationOptions.Enabled:= True;
                PopupCustomInitializationOptions.Enabled:= True;
              end;
           2: begin
                CheckFile:= FrontendPath+'resources\dosgamecfg\'+GamesList[SelectedGame].eName+'.cfg';
                MenuCustomInitializationOptions.Enabled:= False;
                PopupCustomInitializationOptions.Enabled:= False;
              end;
         end;

         case FileExists(CheckFile) of
           True:
             begin
               MenuPlayGame.Enabled:= True;
               MenuSetCustomOptions.Enabled:= True;
               MenuDeleteCustomOptions.Enabled:= True;

               PopupPlayGame.Enabled:= True;
               PopupSetCustomOptions.Enabled:= True;
               PopupDeleteCustomOptions.Enabled:= True;
             end;
           False:
             begin
               MenuPlayGame.Enabled:= False;
               MenuSetCustomOptions.Enabled:= True;
               MenuDeleteCustomOptions.Enabled:= False;

               PopupPlayGame.Enabled:= False;
               PopupSetCustomOptions.Enabled:= True;
               PopupDeleteCustomOptions.Enabled:= False;
             end;
         end;

         case FileExists(FrontendPath+'resources\customcmd\'+GamesList[SelectedGame].eName+'.ini') of
           True:
             begin
               MenuPlayGame.Enabled:= True;
               MenuSetCustomCommandLine.Enabled:= True;
               MenuDeleteCustomCommandLine.Enabled:= True;

               PopupPlayGame.Enabled:= True;
               PopupSetCustomCommandLine.Enabled:= True;
               PopupDeleteCustomCommandLine.Enabled:= True;
             end;
           False:
             begin
               MenuSetCustomCommandLine.Enabled:= True;
               MenuDeleteCustomCommandLine.Enabled:= False;

               PopupSetCustomCommandLine.Enabled:= True;
               PopupDeleteCustomCommandLine.Enabled:= False;
             end;
         end;

         CheckFile:= GamesList[SelectedGame].eDriver;
         Delete(CheckFile, Length(CheckFile)-1, 2);
         case FileExists(FrontendPath+'resources\drvcustomcmd\'+CheckFile+'.ini') of
           True:
             begin
               MenuPlayGame.Enabled:= True;
               MenuSetDriverCustomCommandLine.Enabled:= True;
               MenuDeleteDriverCustomCommandLine.Enabled:= True;

               PopupPlayGame.Enabled:= True;
               PopupSetDriverCustomCommandLine.Enabled:= True;
               PopupDeleteDriverCustomCommandLine.Enabled:= True;
             end;
           False:
             begin
               MenuSetDriverCustomCommandLine.Enabled:= True;
               MenuDeleteDriverCustomCommandLine.Enabled:= False;

               PopupSetDriverCustomCommandLine.Enabled:= True;
               PopupDeleteDriverCustomCommandLine.Enabled:= False;
             end;
         end;

         MenuAuditAllGames.Enabled:= not Assigned(FormAudit);
         MenuAuditAvailableGames.Enabled:= MenuAuditAllGames.Enabled;
         PopupAuditAllGames.Enabled:= MenuAuditAllGames.Enabled;
         PopupAuditAvailableGames.Enabled:= MenuAuditAllGames.Enabled;
       end
    else
       begin
         MenuPlayGame.Enabled:= False;
         MenuCustomGameOptions.Enabled:= False;
         MenuCustomInitializationOptions.Enabled:= False;
         MenuCustomCommandLine.Enabled:= False;
         MenuGameDescription.Enabled:= False;
         MenuGameCategory.Enabled:= False;
         MenuDeleteCustomOptions.Enabled:= False;
         MenuAuditSelectedGame.Enabled:= False;

         PopupPlayGame.Enabled:= False;
         PopupCustomGameOptions.Enabled:= False;
         PopupCustomInitializationOptions.Enabled:= False;
         PopupCustomCommandLine.Enabled:= False;
         PopupGameDescription.Enabled:= False;
         PopupGameCategory.Enabled:= False;
         PopupDeleteCustomOptions.Enabled:= False;
         PopupAuditSelectedGame.Enabled:= False;

         MenuDeleteZIPFileName.Enabled:= False;
         PopupDeleteZIPFileName.Enabled:= False;
       end;

    MenuGameHistory.Enabled:= FileExists(historyFile);
    PopupGameHistory.Enabled:= MenuGameHistory.Enabled;

    MenuGameInformation.Enabled:= FileExists(mameinfoFile);
    PopupGameInformation.Enabled:= MenuGameInformation.Enabled;
    MenuGameDriverInformation.Enabled:= MenuGameInformation.Enabled;
    PopupGameDriverInformation.Enabled:= MenuGameInformation.Enabled;

    MenuDeleteZIPFileName.Caption:= Format(GetLanguageText('Main', 'MenuDeleteZIPFileName', 'Delete File %s'),
                                           [LowerCase(GamesList[SelectedGame].eName)+'.zip']);
    PopupDeleteZIPFileName.Caption:= MenuDeleteZIPFileName.Caption;

    MenuAddGameParentalLock.Enabled:= FileExists(FrontendPath+'ParentalLock.pwd') and FileExists(FrontendPath+'resources\BlockedGames.dat');
    PopupAddGameParentalLock.Enabled:= MenuAddGameParentalLock.Enabled;

    SetCurrentDir(FrontendPath);
  end;
end;

procedure TFormMain.MenuPlayGameClick(Sender: TObject);
begin
  ExecuteGame(GamesList[SelectedGame].eName, False, FormPreferences.AverageFPS.Checked);
end;

procedure TFormMain.MenuSetCustomOptionsClick(Sender: TObject);
begin
{
Emulator Types
--------------
1: MAME
2: DOS MAME
}
  case GetCurrentEmulatorFormat of
    1: SetCustomOptions(GamesList[SelectedGame].eName, False);
    2:
      begin
        if not Assigned(FormDOSMAMECustomConfiguration) then
           FormDOSMAMECustomConfiguration:= TFormDOSMAMECustomConfiguration.Create(Self);
        LoadMAMEConfigurationIcons(FormDOSMAMECustomConfiguration.MAMEConfigImageList);
        FormDOSMAMECustomConfiguration.GameName:= GamesList[SelectedGame].eName;
        FormDOSMAMECustomConfiguration.EmulatorString:= GetCurrentEmulatorExecutable;
        FormDOSMAMECustomConfiguration.ReadMAMEcfg.Caption:= Format(GetLanguageText('Resource', 'ButtonReadIni', '&Read "%s"'), [GamesList[SelectedGame].eName+'.cfg']);
        FormDOSMAMECustomConfiguration.ReadMAMEcfg.Hint:= Format(GetLanguageText('Resource', 'ButtonReadIniHint', 'Read all data from file "%s"'), [GamesList[SelectedGame].eName+'.cfg']);
        FormDOSMAMECustomConfiguration.ShowModal;
        FreeAndNil(FormDOSMAMECustomConfiguration);
      end;
    else
        GenerateMessage(GetLanguageText('Messages', 'CustomOptionsNotAvailableTitle', 'Custom Options Not Available'),
                        GetLanguageText('Messages', 'CustomOptionsNotAvailableMsg', 'This executable format does not have custom options availale! Valid executable are MAME and DOS MAME only.'), 2);
  end;
end;

procedure TFormMain.MenuDeleteCustomOptionsClick(Sender: TObject);
begin
  case GetCurrentEmulatorFormat of
    1: DeleteCustomOptions(GamesList[SelectedGame].eName); //MAME
    2: //DOS MAME
      begin
        if GenerateMessage(GetLanguageText('Messages', 'CustomOptionsDeleteTitle', 'Delete Custom Options'),
                           Format(GetLanguageText('Messages', 'CustomOptionsDeleteMsg',
                                  'Delete configuration file "%s"". Are you sure ?'), [FrontendPath+'resources\dosgamecfg\'+GamesList[SelectedGame].eName+'.cfg']), 1) = mrYes then
           begin
             DeleteFile(FrontendPath+'resources\dosgamecfg\'+GamesList[SelectedGame].eName+'.cfg');
           end;
      end;
  end;
end;

procedure TFormMain.MenuAuditSelectedGameClick(Sender: TObject);
begin
  if List.Selected = nil then
     Exit;
  case Assigned(FormAudit) of
    False: FormAudit:= TFormAudit.Create(Self);
    True:
      begin
        FormAudit.ROMsName:= THashedStringList.Create;
        FormAudit.ROMsSize:= THashedStringList.Create;
        FormAudit.ROMsCRC:= THashedStringList.Create;

        ListROMsName:= THashedStringList.Create;
        ListROMsSize:= THashedStringList.Create;
        ListROMsCRC:= THashedStringList.Create;
        ParentListROMsName:= THashedStringList.Create;
        ParentListROMsSize:= THashedStringList.Create;
        ParentListROMsCRC:= THashedStringList.Create;
      end;
  end;
  SetAuditGamesLanguage;
  FormAudit.GameName:= GamesList[SelectedGame].eName;
  FormAudit.ParentGameName:= GamesList[SelectedGame].eClone;
  FormAudit.AuditMode:= 0;
  FormAudit.LabelGameDescription.Caption:= GamesList[SelectedGame].eDescription;
  FormAudit.Show;
  FormAudit.Audit;
end;

procedure TFormMain.MenuAuditAllGamesClick(Sender: TObject);
begin
  if not Assigned(FormAudit) then
     FormAudit:= TFormAudit.Create(Self);
  SetAuditGamesLanguage;
  FormAudit.AuditMode:= 1;
  FormAudit.Show;
  FormAudit.Audit;
end;

procedure TFormMain.MenuAuditAvailableGamesClick(Sender: TObject);
begin
  if not Assigned(FormAudit) then
     FormAudit:= TFormAudit.Create(Self);
  SetAuditGamesLanguage;
  FormAudit.AuditMode:= 2;
  FormAudit.Show;
  FormAudit.Audit;
end;

procedure TFormMain.ButtonPlayRecordedGameClick(Sender: TObject);
begin
  MenuPlayRecordedGame.Click;
end;

procedure TFormMain.ButtonRecordGameClick(Sender: TObject);
begin
  MenuRecordGame.Click;
end;

procedure TFormMain.MenuGameHistoryClick(Sender: TObject);
var
  HistoryDATFile: THashedStringList;
  Loop, Loop2: Integer;
  AddLine: Boolean;
  PathDAT: String;
begin
  if List.Selected = nil then
     Exit;

  if Pos(':\', historyFile) = 0 then
     PathDAT:= ExtractFilePath(GetCurrentEmulatorExecutable)+historyFile
  else
     PathDAT:= historyFile;

  if (historyFile = '') or ((historyFile <> '') and (not FileExists(PathDAT))) then
     begin
       GenerateMessage(GetLanguageText('Messages', 'FileNotFoundTitle', 'File Not Found'),
                       Format(GetLanguageText('Messages', 'FileNotFoundMsg', 'File "%s" not found'), [PathDAT]), 2);
       Exit;
     end;

  HistoryDATFile:= THashedStringList.Create;
  HistoryDATFile.LoadFromFile(PathDAT);
  PathDAT:= '';
  // need to find the selected gamename in file "history.dat"
  // if found creates the History Form and copy all the info the text holder and shows the form
  AddLine:= False;
  for Loop:=0 to HistoryDATFile.Count -1 do
  begin
    if Copy(HistoryDATFile[Loop],1,5) = '$info' then
       begin
         if GetGameHistory(GamesList[SelectedGame].eName, HistoryDATFile[Loop]) then
            begin
              if not Assigned(FormDATViewer) then
                 FormDATViewer:= TFormDATViewer.Create(Self);
              if TextWordWrap then
                 begin
                   FormDATViewer.WordWrap.Checked:= True;
                   FormDATViewer.WordWrap.OnClick(Self);
                 end;
              Loop2:= Loop+1;
              while Trim(HistoryDATFile[Loop2]) <> '$end' do
              begin
                case AddLine of
                  False:
                    begin
                      if Trim(HistoryDATFile[Loop2]) = '$bio' then
                         AddLine:= True;
                    end;
                  True: FormDATViewer.DATTextHolder.Lines.Add(HistoryDATFile[Loop2]);
                end;
                Inc(Loop2);
              end;

              FreeAndNil(HistoryDATFile);

              FormDATViewer.Caption:= Format(GetLanguageText('DAT Viewer', 'Title1' ,'Viewing %s - [file "%s"]'),
                                             [(GetLanguageText('DAT Viewer', 'GameHistory', 'Game History')), historyFile]);
              FormDATViewer.LabelGameDescription.Caption:= GamesList[SelectedGame].eDescription;
              FormDATViewer.ShowModal;
              TextWordWrap:= FormDATViewer.WordWrap.Checked;
              FreeAndNil(FormDATViewer);
              Exit;
            end;
       end;
  end;
  GenerateMessage(GetLanguageText('Messages', 'NoGameHistoryTitle', 'History Not Found'),
                  GetLanguageText('Messages', 'NoGameHistoryMsg', 'There is no history for this game.'), 2);
end;

procedure TFormMain.MenuGameInformationClick(Sender: TObject);
var
  MAMEInfoDATFile: THashedStringList;
  LineIndex: Integer;
  AddLine, ShowInfo: Boolean;
  DATVersion: String;
begin
  if List.Selected = nil then
     Exit;

  if Pos(':\', mameinfoFile) = 0 then
     DATVersion:= ExtractFilePath(GetCurrentEmulatorExecutable)+mameinfoFile
  else
     DATVersion:= mameinfoFile;

  if (mameinfoFile = '') or ((mameinfoFile <> '') and (not FileExists(DATVersion))) then
     begin
       GenerateMessage(GetLanguageText('Messages', 'FileNotFoundTitle', 'File Not Found'),
                       Format(GetLanguageText('Messages', 'FileNotFoundMsg', 'File "%s" not found'), [DATVersion]), 2);
       Exit;
     end;

  MAMEInfoDATFile:= THashedStringList.Create;
  MAMEInfoDATFile.LoadFromFile(DATVersion);
  DATVersion:= '';

  // need to find for the selected gamename in the file
  // if found, creates the Information Form and copy all the info the text holder and
  // shows the form

  AddLine:= False;
  LineIndex:= MAMEInfoDATFile.IndexOf('$info='+GamesList[SelectedGame].eName);
  ShowInfo:= LineIndex > -1;

  if not ShowInfo then
     begin
       if (GamesList[SelectedGame].eClone <> '') and (GamesList[SelectedGame].eName <> GamesList[SelectedGame].eClone) then
          begin
            LineIndex:= MAMEInfoDATFile.IndexOf('$info='+GamesList[SelectedGame].eClone);
            ShowInfo:= LineIndex > -1;
          end;
     end;

  if ShowInfo then
     begin
       if not Assigned(FormDATViewer) then
          FormDATViewer:= TFormDATViewer.Create(Self);
       if TextWordWrap then
          begin
            FormDATViewer.WordWrap.Checked:= True;
            FormDATViewer.WordWrap.OnClick(Self);
          end;
       Inc(LineIndex);
       FormDATViewer.DATTextHolder.Lines.BeginUpdate;
       DATVersion:= MAMEInfoDATFile[0];
       Delete(DATVersion, 1, 2);
       FormDATViewer.DATTextHolder.Lines.Add(DATVersion+#13);
       while Trim(MAMEInfoDATFile[LineIndex]) <> '$end' do
       begin
         case AddLine of
           False:
             begin
               if Trim(MAMEInfoDATFile[LineIndex]) = '$mame' then
                  AddLine:= True;
             end;
           True: FormDATViewer.DATTextHolder.Lines.Add(MAMEInfoDATFile[LineIndex]);
         end;
         Inc(LineIndex);
       end;
       FormDATViewer.DATTextHolder.Lines.EndUpdate;
       FreeAndNil(MAMEInfoDATFile);

       FormDATViewer.Caption:= Format(GetLanguageText('DAT Viewer', 'Title1' ,'Viewing %s - [file "%s"]'),
                                      [(GetLanguageText('DAT Viewer', 'GameInformation', 'Game Information')), mameinfoFile]);
       FormDATViewer.LabelGameDescription.Caption:= GamesList[SelectedGame].eDescription;
       FormDATViewer.ShowModal;
       TextWordWrap:= FormDATViewer.WordWrap.Checked;
       FreeAndNil(FormDATViewer);
       Exit;
     end;
  GenerateMessage(GetLanguageText('Messages', 'NoGameInformationTitle', 'Information Not Found'),
                  GetLanguageText('Messages', 'NoGameInformationMsg', 'There is no information for this game.'), 2);
end;

procedure TFormMain.MenuGameDriverInformationClick(Sender: TObject);
var
  MAMEInfoDATFile: THashedStringList;
  LineIndex: Integer;
  AddLine: Boolean;
  DATVersion: String;
begin
  if List.Selected = nil then
     Exit;

  if Pos(':\', mameinfoFile) = 0 then
     DATVersion:= ExtractFilePath(GetCurrentEmulatorExecutable)+mameinfoFile
  else
     DATVersion:= mameinfoFile;

  if (mameinfoFile = '') or ((mameinfoFile <> '') and (not FileExists(DATVersion))) then
     begin
       GenerateMessage(GetLanguageText('Messages', 'FileNotFoundTitle', 'File Not Found'),
                       Format(GetLanguageText('Messages', 'FileNotFoundMsg', 'File "%s" not found'), [DATVersion]), 2);
       Exit;
     end;

  MAMEInfoDATFile:= THashedStringList.Create;
  MAMEInfoDATFile.LoadFromFile(DATVersion);
  DATVersion:= '';

  // need to find for the selected gamename in the file
  // if found, creates the Information Form and copy all the info the text holder and
  // shows the form

  AddLine:= False;
  LineIndex:= MAMEInfoDATFile.IndexOf('$info='+GamesList[SelectedGame].eDriver);
  if LineIndex > -1 then
     begin
       if not Assigned(FormDATViewer) then
          FormDATViewer:= TFormDATViewer.Create(Self);
       if TextWordWrap then
          begin
            FormDATViewer.WordWrap.Checked:= True;
            FormDATViewer.WordWrap.OnClick(Self);
          end;
       Inc(LineIndex);
       FormDATViewer.DATTextHolder.Lines.BeginUpdate;
       DATVersion:= MAMEInfoDATFile[0];
       Delete(DATVersion, 1, 2);
       FormDATViewer.DATTextHolder.Lines.Add(DATVersion+#13);
       while Trim(MAMEInfoDATFile[LineIndex]) <> '$end' do
       begin
         case AddLine of
           False: AddLine:= Trim(MAMEInfoDATFile[LineIndex]) = '$drv';
           True : FormDATViewer.DATTextHolder.Lines.Add(MAMEInfoDATFile[LineIndex]);
         end;
         Inc(LineIndex);
       end;
       FormDATViewer.DATTextHolder.Lines.EndUpdate;
       FreeAndNil(MAMEInfoDATFile);

       FormDATViewer.Caption:= Format(GetLanguageText('DAT Viewer', 'Title2' ,'Viewing %s [%s] - [file "%s"]'),
                                      [(GetLanguageText('DAT Viewer', 'GameDriverInformation', 'Game Driver Information')), GamesList[SelectedGame].eDriver, mameinfoFile]);
       FormDATViewer.LabelGameDescription.Caption:= GamesList[SelectedGame].eDescription;
       FormDATViewer.ShowModal;
       TextWordWrap:= FormDATViewer.WordWrap.Checked;
       FreeAndNil(FormDATViewer);
       Exit;
     end;
  GenerateMessage(GetLanguageText('Messages', 'NoGameDriverInformationTitle', 'Driver Information Not Found'),
                  GetLanguageText('Messages', 'NoGameDriverInformationMsg', 'There is no driver information for this game.'), 2);
end;

procedure TFormMain.MenuAddToFavoritesClick(Sender: TObject);
begin
  AddToFavorite;
end;

procedure TFormMain.MenuDeleteFromFavoritesClick(Sender: TObject);
begin
  DeleteFromFavorite;
end;

procedure TFormMain.MenuCreateIconsListClick(Sender: TObject);
var
  Loop: Integer;
  UpdateGameMsg: String;
begin
  Screen.Cursor:= crHourGlass;
  FormStatus.Show;

  FormStatus.LabelStatusType.Caption:= GetLanguageText('Status Messages', 'CreateRealIconsTitle', 'Create Real Icons');
  FormStatus.Refresh;

  if BigRealIconsImageList.Count > 1 then
     begin
       for Loop:=BigRealIconsImageList.Count-1 downto 1 do
       begin
         BigRealIconsImageList.Delete(Loop);
         SmallRealIconsImageList.Delete(Loop);
       end;
     end;
  if FileExists(FrontendPath+'resources\IconsIndex.dat') then
     DeleteFile(FrontendPath+'resources\IconsIndex.dat');
  if FileExists(FrontendPath+'resources\IconsList.ini') then
     DeleteFile(FrontendPath+'resources\IconsList.ini');

  LoadRealIcons;

  if (MenuRealIcons.Checked) and
     (FileExists(FrontendPath+'resources\IconsIndex.dat')) and (FileExists(FrontendPath+'resources\IconsList.ini')) then
     begin
       FormStatus.LabelProgress.Caption:= '';
       RealIconsDAT:= TMemIniFile.Create(FrontendPath+'resources\IconsList.ini');

       List.LargeImages:= BigRealIconsImageList;
       List.SmallImages:= SmallRealIconsImageList;
       UpdateGameMsg:= GetLanguageText('Status Messages', 'UpdateGame', 'Updating game %s. Please wait a moment...');
       for Loop:=0 to Length(GamesList)-1 do
       begin
         FormStatus.LabelMessage.Caption:= Format(UpdateGameMsg, [GamesList[Loop].eName]);
         FormStatus.LabelMessage.Refresh;
         GamesList[Loop].eImageIndex:= RealIconsDAT.ReadInteger('IconsOrder', GamesList[Loop].eName, 0);
         UpdateProgressLabel(Loop, Length(GamesList), False);
       end;
       FormStatus.LabelProgress.Caption:= '';
       FreeAndNil(RealIconsDAT);
       List.Invalidate;
     end;
  FormStatus.Close;
end;

procedure TFormMain.MenuRefreshSelectedGameClick(Sender: TObject);
var
  GameIndex: Integer;
begin
  if List.Selected = nil then
     Exit;
  SetGameMemoryInfo;

  ListROMs:= THashedStringList.Create;
  ListROMs.LoadFromFile(FrontendPath+'resources\ROMs.dat');

  if FileExists(FrontendPath+'catver.ini') then
     CategoriesList:= TMemIniFile.Create(FrontendPath+'catver.ini');

  SetCurrentDir(ExtractFilePath(GetCurrentEmulatorExecutable));
  if RefreshGame then
     begin
       GameIndex:= SelectedGame;
       if ((mROMIdentification in [6..11, 14..15, 17]) and (ButtonShowUnavailableGames.Checked)) or
          ((mROMIdentification in [0..5, 12..13, 16])  and (ButtonShowAvailableGames.Checked)) then
          begin
            LoadROMClasses(False);

            if Length(GamesList) > 0 then
               begin
                 if (GameIndex <= (Length(GamesList)-1)) then
                    SelectItem(GameIndex)
                 else
                 if (GameIndex-1 <= (Length(GamesList)-1)) then
                    SelectItem(GameIndex-1)
                 else
                 SelectItem(0);
               end
            else
               begin
                 ShowPicture('NoGamesAvailable', '', Picture, -1, True);
                 // no games on the list, will show the "No Available Games" image
               end;
          end
       else
         begin
           GamesList[GameIndex].eROMIdentification:= mROMIdentification;
           GamesList[GameIndex].eMerged:= mMerged;
           GamesList[GameIndex].eVersionAdded:= mVersionAdded;
           if not MenuRealIcons.Checked then
              begin
                GamesList[GameIndex].eImageIndex:= mROMIdentification;
                List.Invalidate;
              end;
         end;
     end;
  FreeAndNil(ListROMs);
  FreeAndNil(CategoriesList);
  UpdateStatusBarGame;
  SetCurrentDir(FrontendPath);
end;

procedure TFormMain.MenuRefreshAllGamesClick(Sender: TObject);
var
  {StartClock, EndClock, }NumGamesChanged: Integer;
  ListGamesTemp: THashedStringList;
  Loop, TotalProgress: Integer;
  DelClassicMR, DelClassicMV, DelClassicCR, DelClassicCV, DelNeoGeoM, DelNeoGeoC, DelClassicBIOS, DelNeoGeoBIOS: Boolean;
  DelUnClassicMR, DelUnClassicMV, DelUnClassicCR, DelUnClassicCV, DelUnNeoGeoM, DelUnNeoGeoC, DelUnClassicBIOS, DelUnNeoGeoBIOS: Boolean;

  VerifyGameMsg, VerifyBiosMsg, SelectedGameCaption: String;
begin
  if List.Selected = nil then
     Exit;
  FormStatus.Show;
  FormStatus.LabelProgress.Caption:= '';
  FormStatus.KeyPreview:= True;
  FormStatus.LabelStatusType.Caption:= GetLanguageText('Status Messages', 'RefreshGamesListTitle', 'Refresh Games List');
  SelectedGameCaption:= GamesList[SelectedGame].eDescription;
  NumGamesChanged:= 0;
  //StartClock:= GetTickCount();
  DelClassicMR:= False;
  DelClassicMV:= False;
  DelClassicCR:= False;
  DelClassicCV:= False;
  DelNeoGeoM:= False;
  DelNeoGeoC:= False;
  DelClassicBIOS:= False;
  DelNeoGeoBIOS:= False;
  DelUnClassicMR:= False;
  DelUnClassicMV:= False;
  DelUnClassicCR:= False;
  DelUnClassicCV:= False;
  DelUnNeoGeoM:= False;
  DelUnNeoGeoC:= False;
  DelUnClassicBIOS:= False;
  DelUnNeoGeoBIOS:= False;

  FormStatus.LabelMessage.Caption:= GetLanguageText('Status Messages', 'LoadGamesDATFile',
                                                    'Loading .dat games files to memory. Please, wait a moment...');
  FormStatus.LabelMessage.Refresh;
  ClassicMRList:= THashedStringList.Create;
  ClassicMVList:= THashedStringList.Create;
  ClassicCRList:= THashedStringList.Create;
  ClassicCVList:= THashedStringList.Create;
  NeoGeoMList:= THashedStringList.Create;
  NeoGeoCList:= THashedStringList.Create;
  UnavailableClassicMRList:= THashedStringList.Create;
  UnavailableClassicMVList:= THashedStringList.Create;
  UnavailableClassicCRList:= THashedStringList.Create;
  UnavailableClassicCVList:= THashedStringList.Create;
  UnavailableNeoGeoMList:= THashedStringList.Create;
  UnavailableNeoGeoCList:= THashedStringList.Create;
  BiosList:= THashedStringList.Create;
  UnavailableBiosList:= THashedStringList.Create;

  ClassicMRList.LoadFromFile(FrontendPath+'resources\ClassicMR.dat');
  ClassicMVList.LoadFromFile(FrontendPath+'resources\ClassicMV.dat');
  ClassicCRList.LoadFromFile(FrontendPath+'resources\ClassicCR.dat');
  ClassicCVList.LoadFromFile(FrontendPath+'resources\ClassicCV.dat');
  NeoGeoMList.LoadFromFile(FrontendPath+'resources\NeoGeoM.dat');
  NeoGeoCList.LoadFromFile(FrontendPath+'resources\NeoGeoC.dat');
  UnavailableClassicMRList.LoadFromFile(FrontendPath+'resources\UnClassicMR.dat');
  UnavailableClassicMVList.LoadFromFile(FrontendPath+'resources\UnClassicMV.dat');
  UnavailableClassicCRList.LoadFromFile(FrontendPath+'resources\UnClassicCR.dat');
  UnavailableClassicCVList.LoadFromFile(FrontendPath+'resources\UnClassicCV.dat');
  UnavailableNeoGeoMList.LoadFromFile(FrontendPath+'resources\UnNeoGeoM.dat');
  UnavailableNeoGeoCList.LoadFromFile(FrontendPath+'resources\UnNeoGeoC.dat');
  BiosList.LoadFromFile(FrontendPath+'resources\BIOS.dat');
  UnavailableBiosList.LoadFromFile(FrontendPath+'resources\UnBIOS.dat');

  TotalProgress:= (UnavailableClassicMRList.Count+UnavailableClassicMVList.Count+UnavailableClassicCRList.Count+UnavailableClassicCVList.Count+
                   UnavailableNeoGeoMList.Count+UnavailableNeoGeoCList.Count+UnavailableBiosList.Count+
                   ClassicMRList.Count+ClassicMVList.Count+ClassicCRList.Count+ClassicCVList.Count+NeoGeoMList.Count+NeoGeoCList.Count+BiosList.Count);

  ClassicMRList.BeginUpdate;
  ClassicMVList.BeginUpdate;
  ClassicCRList.BeginUpdate;
  ClassicCVList.BeginUpdate;
  NeoGeoMList.BeginUpdate;
  NeoGeoCList.BeginUpdate;
  UnavailableClassicMRList.BeginUpdate;
  UnavailableClassicMVList.BeginUpdate;
  UnavailableClassicCRList.BeginUpdate;
  UnavailableClassicCVList.BeginUpdate;
  UnavailableNeoGeoMList.BeginUpdate;
  UnavailableNeoGeoCList.BeginUpdate;
  BiosList.BeginUpdate;
  UnavailableBiosList.BeginUpdate;

  FormStatus.LabelMessage.Caption:= GetLanguageText('Status Messages', 'LoadROMsDATFile',
                                                    'Loading file "ROMs.dat" to memory. Please, wait a moment...');
  FormStatus.LabelMessage.Refresh;
  ListROMs:= THashedStringList.Create;
  ListROMs.LoadFromFile(FrontendPath+'resources\ROMs.dat');

  ListGamesTemp:= THashedStringList.Create;

  LoadFolders(DefaultDatabaseBuilderExecutable);
  SetCurrentDir(ExtractFilePath(GetCurrentEmulatorExecutable));

  if FileExists(FrontendPath+'catver.ini') then
     CategoriesList:= TMemIniFile.Create(FrontendPath+'catver.ini');

  // Get Verify Game message
  VerifyGameMsg:= GetLanguageText('Status Messages', 'VerifyGame', 'Verifying game %s. Please, wait a moment...');
  VerifyBiosMsg:= GetLanguageText('Status Messages', 'VerifyBios', 'Verifying bios %s. Please, wait a moment...');

  FormStatus.LabelProgress.Tag:= 0;
  // Refresh Unavailable Classic Master Raster
  for Loop:= UnavailableClassicMRList.Count -1 downto 0 do
  begin
    GetROMFields(UnavailableClassicMRList[Loop]);
    FormStatus.LabelMessage.Caption:= Format(VerifyGameMsg, [mName]);
    FormStatus.LabelMessage.Refresh;
    if RefreshGames(UnavailableClassicMRList, ClassicMRList, Loop) then
       begin
         Inc(NumGamesChanged);
         ListGamesTemp.Add(mName);
         DelUnClassicMR:= True;
         DelClassicMR:= True;
       end;
    UpdateProgressLabel(0, TotalProgress, True);
    Application.ProcessMessages;
    if StopRefreshAllGames then
       begin
         RefreshGamesCanceledMessage;
         Exit;
       end;
  end;

  // Refresh Unavailable Classic Master Vector
  for Loop:= UnavailableClassicMVList.Count -1 downto 0 do
  begin
    GetROMFields(UnavailableClassicMVList[Loop]);
    FormStatus.LabelMessage.Caption:= Format(VerifyGameMsg, [mName]);
    FormStatus.LabelMessage.Refresh;
    if RefreshGames(UnavailableClassicMVList, ClassicMVList, Loop) then
       begin
         Inc(NumGamesChanged);
         ListGamesTemp.Add(mName);
         DelUnClassicMV:= True;
         DelClassicMV:= True;
       end;
    UpdateProgressLabel(0, TotalProgress, True);
    Application.ProcessMessages;
    if StopRefreshAllGames then
       begin
         RefreshGamesCanceledMessage;
         Exit;
       end;
  end;

  // Refresh Unavailable Classic Clone Raster
  for Loop:= UnavailableClassicCRList.Count -1 downto 0 do
  begin
    GetROMFields(UnavailableClassicCRList[Loop]);
    FormStatus.LabelMessage.Caption:= Format(VerifyGameMsg, [mName]);
    FormStatus.LabelMessage.Refresh;
    if RefreshGames(UnavailableClassicCRList, ClassicCRList, Loop) then
       begin
         Inc(NumGamesChanged);
         ListGamesTemp.Add(mName);
         DelUnClassicCR:= True;
         DelClassicCR:= True;
       end;
    UpdateProgressLabel(0, TotalProgress, True);
    Application.ProcessMessages;
    if StopRefreshAllGames then
       begin
         RefreshGamesCanceledMessage;
         Exit;
       end;
  end;

  // Refresh Unavailable Classic Clone Vector
  for Loop:= UnavailableClassicCVList.Count -1 downto 0 do
  begin
    GetROMFields(UnavailableClassicCVList[Loop]);
    FormStatus.LabelMessage.Caption:= Format(VerifyGameMsg, [mName]);
    FormStatus.LabelMessage.Refresh;
    if RefreshGames(UnavailableClassicCVList, ClassicCVList, Loop) then
       begin
         Inc(NumGamesChanged);
         ListGamesTemp.Add(mName);
         DelUnClassicCV:= True;
         DelClassicCV:= True;
       end;
    UpdateProgressLabel(0, TotalProgress, True);
    Application.ProcessMessages;
    if StopRefreshAllGames then
       begin
         RefreshGamesCanceledMessage;
         Exit;
       end;
  end;

  // Refresh Unavailable Neo Geo Master
  for Loop:= UnavailableNeoGeoMList.Count -1 downto 0 do
  begin
    GetROMFields(UnavailableNeoGeoMList[Loop]);
    FormStatus.LabelMessage.Caption:= Format(VerifyGameMsg, [mName]);
    FormStatus.LabelMessage.Refresh;
    if RefreshGames(UnavailableNeoGeoMList, NeoGeoMList, Loop) then
       begin
         Inc(NumGamesChanged);
         ListGamesTemp.Add(mName);
         DelUnNeoGeoM:= True;
         DelNeoGeoM:= True;
       end;
    UpdateProgressLabel(0, TotalProgress, True);
    Application.ProcessMessages;
    if StopRefreshAllGames then
       begin
         RefreshGamesCanceledMessage;
         Exit;
       end;
  end;

  // Refresh Unavailable Neo Geo Clone
  for Loop:= UnavailableNeoGeoCList.Count -1 downto 0 do
  begin
    GetROMFields(UnavailableNeoGeoCList[Loop]);
    FormStatus.LabelMessage.Caption:= Format(VerifyGameMsg, [mName]);
    FormStatus.LabelMessage.Refresh;
    if RefreshGames(UnavailableNeoGeoCList, NeoGeoCList, Loop) then
       begin
         Inc(NumGamesChanged);
         ListGamesTemp.Add(mName);
         DelUnNeoGeoC:= True;
         DelNeoGeoC:= True;
       end;
    UpdateProgressLabel(0, TotalProgress, True);
    Application.ProcessMessages;
    if StopRefreshAllGames then
       begin
         RefreshGamesCanceledMessage;
         Exit;
       end;
  end;

  // Refresh Unavailable Bios
  for Loop:= UnavailableBiosList.Count -1 downto 0 do
  begin
    GetROMFields(UnavailableBiosList[Loop]);
    FormStatus.LabelMessage.Caption:= Format(VerifyBiosMsg, [mName]);
    FormStatus.LabelMessage.Refresh;
    if RefreshGames(UnavailableBiosList, BiosList, Loop) then
       begin
         Inc(NumGamesChanged);
         ListGamesTemp.Add(mName);
         DelUnClassicBIOS:= True;
         DelUnNeoGeoBIOS:= True;
         DelClassicBIOS:= True;
         DelNeoGeoBIOS:= True;
       end;
    UpdateProgressLabel(0, TotalProgress, True);
    Application.ProcessMessages;
    if StopRefreshAllGames then
       begin
         RefreshGamesCanceledMessage;
         Exit;
       end;
  end;

  // Refresh Classic Master Raster
  for Loop:= ClassicMRList.Count -1 downto 0 do
  begin
    GetROMFields(ClassicMRList[Loop]);
    FormStatus.LabelMessage.Caption:= Format(VerifyGameMsg, [mName]);
    FormStatus.LabelMessage.Refresh;
    if ListGamesTemp.IndexOf(mName) = -1 then
       begin
         if RefreshGames(ClassicMRList, UnavailableClassicMRList, Loop) then
            begin
              Inc(NumGamesChanged);
              DelClassicMR:= True;
              DelUnClassicMR:= True;
            end;
       end;
    UpdateProgressLabel(0, TotalProgress, True);
    Application.ProcessMessages;
    if StopRefreshAllGames then
       begin
         RefreshGamesCanceledMessage;
         Exit;
       end;
  end;

  // Refresh Classic Master Vector
  for Loop:= ClassicMVList.Count -1 downto 0 do
  begin
    GetROMFields(ClassicMVList[Loop]);
    FormStatus.LabelMessage.Caption:= Format(VerifyGameMsg, [mName]);
    FormStatus.LabelMessage.Refresh;
    if ListGamesTemp.IndexOf(mName) = -1 then
       begin
        if RefreshGames(ClassicMVList, UnavailableClassicMVList, Loop) then
           begin
             Inc(NumGamesChanged);
             DelClassicMV:= True;
             DelUnClassicMV:= True;
           end;
       end;
    UpdateProgressLabel(0, TotalProgress, True);
    Application.ProcessMessages;
    if StopRefreshAllGames then
       begin
         RefreshGamesCanceledMessage;
         Exit;
       end;
  end;

  // Refresh Classic Clone Raster
  for Loop:= ClassicCRList.Count -1 downto 0 do
  begin
    GetROMFields(ClassicCRList[Loop]);
    FormStatus.LabelMessage.Caption:= Format(VerifyGameMsg, [mName]);
    FormStatus.LabelMessage.Refresh;
    if ListGamesTemp.IndexOf(mName) = -1 then
       begin
         if RefreshGames(ClassicCRList, UnavailableClassicCRList, Loop) then
            begin
              Inc(NumGamesChanged);
              DelClassicCR:= True;
              DelUnClassicCR:= True;
            end;
       end;
    UpdateProgressLabel(0, TotalProgress, True);
    Application.ProcessMessages;
    if StopRefreshAllGames then
       begin
         RefreshGamesCanceledMessage;
         Exit;
       end;
  end;

  // Refresh Classic Clone Vector
  for Loop:= ClassicCVList.Count -1 downto 0 do
  begin
    GetROMFields(ClassicCVList[Loop]);
    FormStatus.LabelMessage.Caption:= Format(VerifyGameMsg, [mName]);
    FormStatus.LabelMessage.Refresh;
    if ListGamesTemp.IndexOf(mName) = -1 then
       begin
         if RefreshGames(ClassicCVList, UnavailableClassicCVList, Loop) then
            begin
              Inc(NumGamesChanged);
              DelClassicCV:= True;
              DelUnClassicCV:= True;
            end;
       end;
    UpdateProgressLabel(0, TotalProgress, True);
    Application.ProcessMessages;
    if StopRefreshAllGames then
       begin
         RefreshGamesCanceledMessage;
         Exit;
       end;
  end;

  // Refresh Neo Geo Master
  for Loop:= NeoGeoMList.Count -1 downto 0 do
  begin
    GetROMFields(NeoGeoMList[Loop]);
    FormStatus.LabelMessage.Caption:= Format(VerifyGameMsg, [mName]);
    FormStatus.LabelMessage.Refresh;
    if ListGamesTemp.IndexOf(mName) = -1 then
       begin
         if RefreshGames(NeoGeoMList, UnavailableNeoGeoMList, Loop) then
            begin
              Inc(NumGamesChanged);
              DelNeoGeoM:= True;
              DelUnNeoGeoM:= True;
            end;
       end;
    UpdateProgressLabel(0, TotalProgress, True);
    Application.ProcessMessages;
    if StopRefreshAllGames then
       begin
         RefreshGamesCanceledMessage;
         Exit;
       end;
  end;

  // Refresh Neo Geo Clone
  for Loop:= NeoGeoCList.Count -1 downto 0 do
  begin
    GetROMFields(NeoGeoCList[Loop]);
    FormStatus.LabelMessage.Caption:= Format(VerifyGameMsg, [mName]);
    FormStatus.LabelMessage.Refresh;
    if ListGamesTemp.IndexOf(mName) = -1 then
       begin
         if RefreshGames(NeoGeoCList, UnavailableNeoGeoCList, Loop) then
            begin
              Inc(NumGamesChanged);
              DelNeoGeoC:= True;
              DelUnNeoGeoC:= True;
            end;
       end;
    UpdateProgressLabel(0, TotalProgress, True);
    Application.ProcessMessages;
    if StopRefreshAllGames then
       begin
         RefreshGamesCanceledMessage;
         Exit;
       end;
  end;

  // Refresh Bios
  for Loop:= BiosList.Count -1 downto 0 do
  begin
    GetROMFields(BiosList[Loop]);
    FormStatus.LabelMessage.Caption:= Format(VerifyBiosMsg, [mName]);
    FormStatus.LabelMessage.Refresh;
    if ListGamesTemp.IndexOf(mName) = -1 then
       begin
         if RefreshGames(BiosList, UnavailableBiosList, Loop) then
            begin
              Inc(NumGamesChanged);
              DelClassicBIOS:= True;
              DelNeoGeoBIOS:= True;
              DelUnClassicBIOS:= True;
              DelUnNeoGeoBIOS:= True;
            end;
       end;
    UpdateProgressLabel(0, TotalProgress, True);
    Application.ProcessMessages;
    if StopRefreshAllGames then
       begin
         RefreshGamesCanceledMessage;
         Exit;
       end;
  end;
  // I think that the Bios refreshing is working correctly now...
  ClassicMRList.EndUpdate;
  ClassicMVList.EndUpdate;
  ClassicCRList.EndUpdate;
  ClassicCVList.EndUpdate;
  NeoGeoMList.EndUpdate;
  NeoGeoCList.EndUpdate;
  UnavailableClassicMRList.EndUpdate;
  UnavailableClassicMVList.EndUpdate;
  UnavailableClassicCRList.EndUpdate;
  UnavailableClassicCVList.EndUpdate;
  UnavailableNeoGeoMList.EndUpdate;
  UnavailableNeoGeoCList.EndUpdate;
  BiosList.EndUpdate;

  FreeAndNil(ListGamesTemp);
  SetCurrentDir(FrontendPath);
  FreeAndNil(CategoriesList);
  
  if DelUnClassicMR then
     begin
       FormStatus.LabelMessage.Caption:= GetStatusMessage('SaveUnClassicMR');
       FormStatus.LabelMessage.Refresh;
       UnavailableClassicMRList.SaveToFile(FrontendPath+'resources\UnClassicMR.dat');
     end;

  if DelUnClassicMV then
     begin
       FormStatus.LabelMessage.Caption:= GetStatusMessage('SaveUnClassicMV');
       FormStatus.LabelMessage.Refresh;
       UnavailableClassicMVList.SaveToFile(FrontendPath+'resources\UnClassicMV.dat');
     end;

  if DelUnClassicCR then
     begin
       FormStatus.LabelMessage.Caption:= GetStatusMessage('SaveUnClassicCR');
       FormStatus.LabelMessage.Refresh;
       UnavailableClassicCRList.SaveToFile(FrontendPath+'resources\UnClassicCR.dat');
     end;

  if DelUnClassicCV then
     begin
       FormStatus.LabelMessage.Caption:= GetStatusMessage('SaveUnClassicCV');
       FormStatus.LabelMessage.Refresh;
       UnavailableClassicCVList.SaveToFile(FrontendPath+'resources\UnClassicCV.dat');
     end;

  if DelUnNeoGeoM then
     begin
       FormStatus.LabelMessage.Caption:= GetStatusMessage('SaveUnNeoGeoM');
       FormStatus.LabelMessage.Refresh;
       UnavailableNeoGeoMList.SaveToFile(FrontendPath+'resources\UnNeoGeoM.dat');
     end;

  if DelUnNeoGeoC then
     begin
       FormStatus.LabelMessage.Caption:= GetStatusMessage('SaveUnNeoGeoC');
       FormStatus.LabelMessage.Refresh;
       UnavailableNeoGeoCList.SaveToFile(FrontendPath+'resources\UnNeoGeoC.dat');
     end;

  if ((DelUnClassicBIOS) or (DelUnNeoGeoBIOS)) then
     begin
       FormStatus.LabelMessage.Caption:= GetStatusMessage('SaveUnClassicBios');
       FormStatus.LabelMessage.Refresh;
       FormStatus.LabelMessage.Caption:= GetStatusMessage('SaveUnNeoGeoBios');
       FormStatus.LabelMessage.Refresh;
       UnavailableBiosList.SaveToFile(FrontendPath+'resources\UnBIOS.dat');
     end;

  if DelClassicMR then
     begin
       FormStatus.LabelMessage.Caption:= GetStatusMessage('SaveClassicMR');
       FormStatus.LabelMessage.Refresh;
       ClassicMRList.SaveToFile(FrontendPath+'resources\ClassicMR.dat');
     end;

  if DelClassicMV then
     begin
       FormStatus.LabelMessage.Caption:= GetStatusMessage('SaveClassicMV');
       FormStatus.LabelMessage.Refresh;
       ClassicMVList.SaveToFile(FrontendPath+'resources\ClassicMV.dat');
     end;

  if DelClassicCR then
     begin
       FormStatus.LabelMessage.Caption:= GetStatusMessage('SaveClassicCR');
       FormStatus.LabelMessage.Refresh;
       ClassicCRList.SaveToFile(FrontendPath+'resources\ClassicCR.dat');
     end;

  if DelClassicCV then
     begin
       FormStatus.LabelMessage.Caption:= GetStatusMessage('SaveClassicCV');
       FormStatus.LabelMessage.Refresh;
       ClassicCVList.SaveToFile(FrontendPath+'resources\ClassicCV.dat');
     end;

  if DelNeoGeoM then
     begin
       FormStatus.LabelMessage.Caption:= GetStatusMessage('SaveNeoGeoM');
       FormStatus.LabelMessage.Refresh;
       NeoGeoMList.SaveToFile(FrontendPath+'resources\NeoGeoM.dat');
     end;

  if DelNeoGeoC then
     begin
       FormStatus.LabelMessage.Caption:= GetStatusMessage('SaveNeoGeoC');
       FormStatus.LabelMessage.Refresh;
       NeoGeoCList.SaveToFile(FrontendPath+'resources\NeoGeoC.dat');
     end;

  if ((DelClassicBIOS) or (DelNeoGeoBIOS)) then
     begin
       FormStatus.LabelMessage.Caption:= GetStatusMessage('SaveClassicBios');
       FormStatus.LabelMessage.Refresh;
       FormStatus.LabelMessage.Caption:= GetStatusMessage('SaveNeoGeoBios');
       FormStatus.LabelMessage.Refresh;
       BiosList.SaveToFile(FrontendPath+'resources\Bios.dat');
     end;

  FreeAndNil(ClassicMRList);
  FreeAndNil(ClassicMVList);
  FreeAndNil(ClassicCRList);
  FreeAndNil(ClassicCVList);
  FreeAndNil(NeoGeoMList);
  FreeAndNil(NeoGeoCList);
  FreeAndNil(UnavailableClassicMRList);
  FreeAndNil(UnavailableClassicMVList);
  FreeAndNil(UnavailableClassicCRList);
  FreeAndNil(UnavailableClassicCVList);
  FreeAndNil(UnavailableNeoGeoMList);
  FreeAndNil(UnavailableNeoGeoCList);
  FreeAndNil(BiosList);
  FreeAndNil(UnavailableBiosList);
  FreeAndNil(ListROMs);

  //EndClock:= GetTickCount();

  FormStatus.LabelProgress.Caption:= '';
  FormStatus.LabelProgress.Tag:= 0;
  if NumGamesChanged <> 0 then
     LoadROMClasses(False);

  if Length(GamesList) > 0 then
     begin
        SortColumn(ColumnSorted, True);
        SelectItem(FindGame(SelectedGame, SelectedGameCaption));
     end
  else
     begin
       ShowPicture('NoGamesAvailable', '', Picture, -1, True);
       // no games on list, show the "No Games Available" image
     end;
  FormStatus.Close;
end;

procedure TFormMain.RefreshGamesCanceledMessage;
begin
  GenerateMessage(GetLanguageText('Messages', 'CancelOperationTitle', 'Operation Canceled'),
                  GetLanguageText('Messages', 'RefreshGamesCancelMsg', 'Refresh games list is canceled!'), 2);
end;

function TFormMain.StopRefreshAllGames: Boolean;
begin
  Result:= False;
  if CancelCurrentOperation then
     begin
       case GenerateMessage(GetLanguageText('Messages', 'CancelTitle', 'Cancel'),
                            GetLanguageText('Messages', 'StopRefreshGamesMsg', 'Stop refreshing the games list ? The current games list will not be changed.'), 1) of
         mrYes:
           begin
             Result:= True;
             FreeAndNil(ClassicMRList);
             FreeAndNil(ClassicMVList);
             FreeAndNil(ClassicCRList);
             FreeAndNil(ClassicCVList);
             FreeAndNil(NeoGeoMList);
             FreeAndNil(NeoGeoCList);
             FreeAndNil(UnavailableClassicMRList);
             FreeAndNil(UnavailableClassicMVList);
             FreeAndNil(UnavailableClassicCRList);
             FreeAndNil(UnavailableClassicCVList);
             FreeAndNil(UnavailableNeoGeoMList);
             FreeAndNil(UnavailableNeoGeoCList);
             FreeAndNil(BiosList);
             FreeAndNil(UnavailableBiosList);
             FreeAndNil(ListROMs);

             CancelCurrentOperation:= False;
             FormStatus.KeyPreview:= False;
             FormStatus.LabelProgress.Caption:= '';
             FormStatus.LabelProgress.Tag:= 0;
             FormStatus.Close;
             SetCurrentDir(FrontendPath);
           end;
         mrNo: CancelCurrentOperation:= False;
       end;
     end;
end;

procedure TFormMain.MenuRenameCurrentPictureClick(Sender: TObject);
var
  Result, PictureFileName, ZIPFile: String;
  Index: Integer;
begin
  if ButtonPicturesModeView.Tag = 1 then
     begin
       if Pos(':\', snapingameDir) = 0 then
          SetCurrentDir(ExtractFilePath(GetCurrentEmulatorExecutable));
     end;
  Index:= Pos('[', Picture.Hint);
  if Index = 0 then
     begin
       Result:= InputBox(GetLanguageText('Messages', 'RenamePictureTitle', 'Rename Picture'),
                         GetLanguageText('Messages', 'RenamePictureMsg', 'Enter New Filename'),
                         ExtractFileName(Picture.Hint));
       if Result <> ExtractFileName(Picture.Hint) then
          begin
            RenameFile(Picture.Hint, ExtractFilePath(Picture.Hint)+Result);
          end;
     end
  else
     begin
       ZIPFile:= Picture.Hint;
       Delete(ZIPFile, Pos(' -', ZIPFile), Length(ZIPFile));
       if FileExists(ZIPFile) then
          begin
            PictureFileName:= Picture.Hint;
            Delete(PictureFileName, 1, Index);
            Delete(PictureFileName, Length(PictureFileName), 1);
            Result:= InputBox(GetLanguageText('Messages', 'RenamePictureTitle', 'Rename Picture'),
                              GetLanguageText('Messages', 'RenamePictureMsg', 'Enter New Filename'),
                              PictureFileName);
            Application.ProcessMessages;
            if Result <> PictureFileName then
               begin
                 RenameFileInsideZip(ZIPFile, PictureFileName, Result);
               end;
          end;
     end;
  if ButtonPicturesModeView.Tag = 1 then
     SetCurrentDir(FrontendPath);
  MenuShowPictures.OnClick(Self);
end;

procedure TFormMain.MenuDeleteCurrentPictureClick(Sender: TObject);
var
  PictureFileName, ZIPFile: String;
  Index: Integer;
begin
  if GenerateMessage(GetLanguageText('Messages', 'DeletePictureTitle', 'Delete Picture'),
                     Format(GetLanguageText('Messages', 'DeletePictureMsg', 'Delete picture "%s". Are you sure ?'), [Picture.Hint]), 1) = mrYes then
     begin
       Application.ProcessMessages;
       if ButtonPicturesModeView.Tag = 1 then
          begin
            if Pos(':\', snapingameDir) = 0 then
               SetCurrentDir(ExtractFilePath(GetCurrentEmulatorExecutable));
          end;
       Index:= Pos('[', Picture.Hint);
       if Index = 0 then
          DeleteFile(Picture.Hint)
       else
          begin
            ZIPFile:= Picture.Hint;
            Delete(ZIPFile, Pos(' -', ZIPFile), Length(ZIPFile));

            if FileExists(ZIPFile) then
               begin
                 PictureFileName:= Picture.Hint;
                 Delete(PictureFileName, 1, Index);
                 Delete(PictureFileName, Length(PictureFileName), 1);
                 DeleteFileInsideZip(ZIPFile, PictureFileName);
               end;
          end;
       if ButtonPicturesModeView.Tag = 1 then
          SetCurrentDir(FrontendPath);
       MenuShowPictures.OnClick(Self);
     end;
end;

procedure TFormMain.MenuDeleteAllExtraPicturesClick(Sender: TObject);
var
  Loop: Integer;
  PictureName, PictureExt, ZIPFile: String;
begin
  if GenerateMessage(GetLanguageText('Messages', 'DeleteExtraPicturesTitle', 'Delete Extra Pictures'),
                     GetLanguageText('Messages', 'DeleteExtraPicturesMsg', 'This will permanently delete all extra snapshots for the selected game! Are you sure ?'), 1) = mrYes then
     begin
       Application.ProcessMessages;
       if Pos(':\', snapingameDir) = 0 then
          SetCurrentDir(ExtractFilePath(GetCurrentEmulatorExecutable));

       for Loop:=0 to 100 do
       begin
         case FormPreferences.NewPictureNameFormat.Checked of
           True : PictureName:= GamesList[SelectedGame].eName+Format('%.4u', [Loop]);
           False: PictureName:= SetPictureFileName(GamesList[SelectedGame].eName)+Format('%.4u', [Loop]);
         end;

         if FileExists(snapingameDir+'\'+PictureName+'.png') then
            DeleteFile(snapingameDir+'\'+PictureName+'.png');
       end;

       // Delete extra file inside .ZIP
       case FileExists(snapingameDir+'\ingame.zip') of
         True : ZIPFile:= snapingameDir+'\ingame.zip';
         False: ZIPFile:= snapingameDir+'\snap.zip';
       end;
       if FileExists(ZIPFile) then
          begin
            case FormPreferences.NewPictureNameFormat.Checked of
              True : PictureName:= GamesList[SelectedGame].eName;
              False: PictureName:= SetPictureFileName(GamesList[SelectedGame].eName);
            end;
            DeleteExtraFileInsideZip(ZIPFile, PictureName);
          end;
       GenerateMessage(GetLanguageText('Messages', 'CompleteOperationTitle', 'Operation Complete'),
                       GetLanguageText('Messages', 'DeletedExtraPicturesMsg', 'All extra snapshots are deleted.'), 2);
       if PictureNumber > 1 then
          PictureNumber:= 1;
       SetCurrentDir(FrontendPath);
       MenuShowPictures.OnClick(Self);
     end;
end;

procedure TFormMain.MenuPicturesClick(Sender: TObject);
begin
  MenuDeleteCurrentPicture.Enabled:= ShowingPicture;
end;

procedure TFormMain.SendEMailEmuLoaderClick(Sender: TObject);
begin
  ShellExecute(Handle, 'open', 'mailto:emuloader@mameworld.net?subject=Bugs Report / Suggestions / Questions', nil, nil, SW_SHOWNORMAL);
end;

procedure TFormMain.MenuVisitEmuLoaderHomepageClick(Sender: TObject);
begin
  ShellExecute(Handle, 'open', 'http://www.mameworld.net/emuloader', nil, nil, SW_SHOWNORMAL);
end;

procedure TFormMain.ToolBarButtonsResize(Sender: TObject);
begin
  ToolBarButtons.Width:= 609;
end;

procedure TFormMain.MenuModeViewBigIconsClick(Sender: TObject);
begin
  ButtonModeViewBigIcons.Checked:= MenuModeViewBigIcons.Checked;
  ButtonModeView.ImageIndex:= 0;
  ButtonModeView.Tag:= 0;
  List.ViewStyle:= vsIcon;
  SortColumn(0, True);
end;

procedure TFormMain.MenuModeViewSmallIconsClick(Sender: TObject);
begin
  ButtonModeViewSmallIcons.Checked:= MenuModeViewSmallIcons.Checked;
  ButtonModeView.ImageIndex:= 1;
  ButtonModeView.Tag:= 1;
  List.ViewStyle:= vsSmallIcon;
  SortColumn(0, True);
end;

procedure TFormMain.MenuModeViewListClick(Sender: TObject);
begin
  ButtonModeViewList.Checked:= MenuModeViewList.Checked;
  ButtonModeView.ImageIndex:= 2;
  ButtonModeView.Tag:= 2;
  List.ViewStyle:= vsList;
  SortColumn(0, True);
end;

procedure TFormMain.MenuModeViewDetailsClick(Sender: TObject);
begin
  ButtonModeViewDetails.Checked:= MenuModeViewDetails.Checked;
  ButtonModeView.ImageIndex:= 3;
  ButtonModeView.Tag:= 3;
  List.ViewStyle:= vsReport;
  SortColumn(ColumnSorted, True);
end;

procedure TFormMain.MenuUseExecutable1Click(Sender: TObject);
begin
  if MenuUseExecutable1.Checked then
     begin
       ButtonUseExecutable1.Checked:= True;
       ButtonExecutablesMode.ImageIndex:= 15;
       ButtonExecutablesMode.Tag:= 1;
       LabelEmulatorVersion.Caption:= EmuLatorVersion[1];
       LoadFolders('1');
     end;
end;

procedure TFormMain.MenuUseExecutable2Click(Sender: TObject);
begin
  if EmulatorExecutable[2] <> '' then
     begin
       if MenuUseExecutable2.Checked then
          begin
            ButtonUseExecutable2.Checked:= True;
            ButtonExecutablesMode.ImageIndex:= 16;
            ButtonExecutablesMode.Tag:= 2;
            LabelEmulatorVersion.Caption:= EmuLatorVersion[2];
            LoadFolders('2');
          end;
     end
  else
     MenuUseExecutable1.Click;
end;

procedure TFormMain.MenuUseExecutable3Click(Sender: TObject);
begin
  if EmulatorExecutable[3] <> '' then
     begin
       if MenuUseExecutable3.Checked then
          begin
            ButtonUseExecutable3.Checked:= True;
            ButtonExecutablesMode.ImageIndex:= 47;
            ButtonExecutablesMode.Tag:= 3;
            LabelEmulatorVersion.Caption:= EmuLatorVersion[3];
            LoadFolders('3');
          end;
     end
  else
     MenuUseExecutable1.Click;
end;

procedure TFormMain.MenuUseExecutable4Click(Sender: TObject);
begin
  if EmulatorExecutable[4] <> '' then
     begin
       if MenuUseExecutable4.Checked then
          begin
            ButtonUseExecutable4.Checked:= True;
            ButtonExecutablesMode.ImageIndex:= 61;
            ButtonExecutablesMode.Tag:= 4;
            LabelEmulatorVersion.Caption:= EmuLatorVersion[4];
            LoadFolders('4');
          end;
     end
  else
     MenuUseExecutable1.Click;
end;

procedure TFormMain.MenuUseExecutable5Click(Sender: TObject);
begin
  if EmulatorExecutable[5] <> '' then
     begin
       if MenuUseExecutable5.Checked then
          begin
            ButtonUseExecutable5.Checked:= True;
            ButtonExecutablesMode.ImageIndex:= 62;
            ButtonExecutablesMode.Tag:= 5;
            LabelEmulatorVersion.Caption:= EmuLatorVersion[5];
            LoadFolders('5');
          end;
     end
  else
     MenuUseExecutable1.Click;
end;

procedure TFormMain.MenuShowFavoriteClick(Sender: TObject);
var
  NoFavoriteGames: Boolean;
  SelectedGameDescription: String;
begin
  Screen.Cursor:= crHourGlass;
  NoFavoriteGames:= False;
  if List.Selected <> nil then
     SelectedGameDescription:= GamesList[SelectedGame].eDescription;
  case MenuShowFavorite.Checked of
    True:
      begin
        ButtonShowFavorite.Down:= True;
        PopupShowFavorite.Checked:= True;
        if GetFileSize(FrontendPath+'resources\favorites\'+FavoriteUser+'.dat') > 0 then
           begin
             MenuShowHideFavoriteUsersManager.Enabled:= False;
             PopupShowHideFavoriteUsersManager.Enabled:= False;

             MenuRefreshAllGames.Enabled:= False;
             ButtonRefreshAllGames.Enabled:= False;
             PopupRefreshAllGames.Enabled:= False;

             MenuRefreshSelectedGame.Enabled:= False;
             PopupRefreshSelectedGame.Enabled:= False;

             MenuRefreshAvailableGames.Enabled:= False;
             PopupRefreshAvailableGames.Enabled:= False;

             MenuRefreshUnavailableGames.Enabled:= False;
             PopupRefreshUnavailableGames.Enabled:= False;

             MenuCustomGamesManager.Enabled:= False;
             PopupCustomGamesManager.Enabled:= False;

             ButtonGameType.Enabled:= False;
             ButtonGameFilters.Enabled:= False;

             ButtonShowFavorite.Tag:= 0;

             case LoadROMClasses(True) of
               True : StatusBarFavoriteUser.Hint:= Format('%s - [%s]', [GetLanguageText('Main', 'StatusBarFavoriteUserHint', 'Show favorite users manager'),
                                                          GetLanguageText('Resources', 'DisabledStatus', 'Disabled')]);
               False: MenuShowFavorite.Click;
             end;
           end
        else
           begin
             GenerateMessage(GetLanguageText('Messages', 'NoFavoriteGamesTitle', 'No Favorite Games'),
                             GetLanguageText('Messages', 'NoFavoriteGamesMsg', 'There are no games for this user!'), 2);
             MenuShowFavorite.Checked:= False;
             ButtonShowFavorite.Down:= False;
             PopupShowFavorite.Checked:= False;
             NoFavoriteGames:= True;
           end;
      end;
    False:
      begin
        ButtonShowFavorite.Down:= False;
        PopupShowFavorite.Checked:= False;

        MenuShowHideFavoriteUsersManager.Enabled:= True;
        PopupShowHideFavoriteUsersManager.Enabled:= True;

        MenuRefreshAllGames.Enabled:= True;
        ButtonRefreshAllGames.Enabled:= True;
        PopupRefreshAllGames.Enabled:= True;

        MenuRefreshSelectedGame.Enabled:= True;
        PopupRefreshSelectedGame.Enabled:= True;

        MenuRefreshAvailableGames.Enabled:= True;
        PopupRefreshAvailableGames.Enabled:= True;

        MenuRefreshUnavailableGames.Enabled:= True;
        PopupRefreshUnavailableGames.Enabled:= True;

        MenuCustomGamesManager.Enabled:= True;
        PopupCustomGamesManager.Enabled:= True;

        ButtonGameType.Enabled:= True;
        ButtonGameFilters.Enabled:= True;

        LoadROMClasses(False);
        StatusBarFavoriteUser.Hint:= GetLanguageText('Main', 'StatusBarFavoriteUserHint', 'Show favorite users manager');
      end;
  end;

  if not NoFavoriteGames then
     begin
       if not FormStatus.Visible then
          begin
            SortColumn(ColumnSorted, True);
            if SelectedGameDescription <> '' then
               SelectItem(FindGame(SelectedGame, SelectedGameDescription))
            else
               begin
                 if (SelectedGame <= (Length(GamesList)-1)) then
                     SelectItem(SelectedGame)
                  else
                     SelectItem(0);
               end;
          end;
     end;
  if Assigned(FormFavoriteUsersManager) then
     FormFavoriteUsersManager.ButtonUpdateFavoriteGamesList.Enabled:= not MenuShowFavorite.Checked;
  Screen.Cursor:= crDefault;
end;

procedure TFormMain.MenuShowFirstPictureClick(Sender: TObject);
begin
  PictureNumber:= 1;
  MenuShowPictures.OnClick(Self);
end;

procedure TFormMain.MenuRefreshAvailableGamesClick(Sender: TObject);
var
  {StartClock, EndClock,} NumGamesChanged: Integer;
  Loop, TotalProgress: Integer;
  DelClassicMR, DelClassicMV, DelClassicCR, DelClassicCV, DelNeoGeoM, DelNeoGeoC, DelClassicBIOS, DelNeoGeoBIOS: Boolean;
  DelUnClassicMR, DelUnClassicMV, DelUnClassicCR, DelUnClassicCV, DelUnNeoGeoM, DelUnNeoGeoC, DelUnClassicBIOS, DelUnNeoGeoBIOS: Boolean;

  VerifyGameMsg, VerifyBiosMsg, SelectedGameCaption: String;
begin
  if List.Selected = nil then
     Exit;
  FormStatus.Show;
  FormStatus.KeyPreview:= True;
  FormStatus.LabelStatusType.Caption:= GetLanguageText('Status Messages', 'RefreshGamesListAvailableTitle',
                                                       'Refresh Games List (Available Games Only)');

  SelectedGameCaption:= GamesList[SelectedGame].eDescription;
  NumGamesChanged:= 0;
  //StartClock:= GetTickCount();
  DelClassicMR:= False;
  DelClassicMV:= False;
  DelClassicCR:= False;
  DelClassicCV:= False;
  DelNeoGeoM:= False;
  DelNeoGeoC:= False;
  DelClassicBIOS:= False;
  DelNeoGeoBIOS:= False;
  DelUnClassicMR:= False;
  DelUnClassicMV:= False;
  DelUnClassicCR:= False;
  DelUnClassicCV:= False;
  DelUnNeoGeoM:= False;
  DelUnNeoGeoC:= False;
  DelUnClassicBIOS:= False;
  DelUnNeoGeoBIOS:= False;

  FormStatus.LabelMessage.Caption:= GetLanguageText('Status Messages', 'LoadGamesDATFile',
                                                    'Loading .dat games files to memory. Please, wait a moment...');
  FormStatus.LabelMessage.Refresh;
  ClassicMRList:= THashedStringList.Create;
  ClassicMVList:= THashedStringList.Create;
  ClassicCRList:= THashedStringList.Create;
  ClassicCVList:= THashedStringList.Create;
  NeoGeoMList:= THashedStringList.Create;
  NeoGeoCList:= THashedStringList.Create;
  UnavailableClassicMRList:= THashedStringList.Create;
  UnavailableClassicMVList:= THashedStringList.Create;
  UnavailableClassicCRList:= THashedStringList.Create;
  UnavailableClassicCVList:= THashedStringList.Create;
  UnavailableNeoGeoMList:= THashedStringList.Create;
  UnavailableNeoGeoCList:= THashedStringList.Create;
  BiosList:= THashedStringList.Create;
  UnavailableBiosList:= THashedStringList.Create;

  ClassicMRList.LoadFromFile(FrontendPath+'resources\ClassicMR.dat');
  ClassicMVList.LoadFromFile(FrontendPath+'resources\ClassicMV.dat');
  ClassicCRList.LoadFromFile(FrontendPath+'resources\ClassicCR.dat');
  ClassicCVList.LoadFromFile(FrontendPath+'resources\ClassicCV.dat');
  NeoGeoMList.LoadFromFile(FrontendPath+'resources\NeoGeoM.dat');
  NeoGeoCList.LoadFromFile(FrontendPath+'resources\NeoGeoC.dat');
  UnavailableClassicMRList.LoadFromFile(FrontendPath+'resources\UnClassicMR.dat');
  UnavailableClassicMVList.LoadFromFile(FrontendPath+'resources\UnClassicMV.dat');
  UnavailableClassicCRList.LoadFromFile(FrontendPath+'resources\UnClassicCR.dat');
  UnavailableClassicCVList.LoadFromFile(FrontendPath+'resources\UnClassicCV.dat');
  UnavailableNeoGeoMList.LoadFromFile(FrontendPath+'resources\UnNeoGeoM.dat');
  UnavailableNeoGeoCList.LoadFromFile(FrontendPath+'resources\UnNeoGeoC.dat');
  BiosList.LoadFromFile(FrontendPath+'resources\BIOS.dat');
  UnavailableBiosList.LoadFromFile(FrontendPath+'resources\UnBIOS.dat');

  TotalProgress:= (ClassicMRList.Count+ClassicMVList.Count+ClassicCRList.Count+ClassicCVList.Count+NeoGeoMList.Count+NeoGeoCList.Count+
                   BiosList.Count);

  FormStatus.LabelProgress.Caption:= '';

  ClassicMRList.BeginUpdate;
  ClassicMVList.BeginUpdate;
  ClassicCRList.BeginUpdate;
  ClassicCVList.BeginUpdate;
  NeoGeoMList.BeginUpdate;
  NeoGeoCList.BeginUpdate;
  UnavailableClassicMRList.BeginUpdate;
  UnavailableClassicMVList.BeginUpdate;
  UnavailableClassicCRList.BeginUpdate;
  UnavailableClassicCVList.BeginUpdate;
  UnavailableNeoGeoMList.BeginUpdate;
  UnavailableNeoGeoCList.BeginUpdate;
  BiosList.BeginUpdate;
  UnavailableBiosList.BeginUpdate;

  FormStatus.LabelMessage.Caption:= GetLanguageText('Status Messages', 'LoadROMsDATFile',
                                                    'Loading file "ROMs.dat" to memory. Please, wait a moment...');
  FormStatus.LabelMessage.Refresh;
  ListROMs:= THashedStringList.Create;
  ListROMs.LoadFromFile(FrontendPath+'resources\ROMs.dat');

  LoadFolders(DefaultDatabaseBuilderExecutable);
  SetCurrentDir(ExtractFilePath(GetCurrentEmulatorExecutable));

  if FileExists(FrontendPath+'catver.ini') then
     CategoriesList:= TMemIniFile.Create(FrontendPath+'catver.ini');

  // Get Verify Game message
  VerifyGameMsg:= GetLanguageText('Status Messages', 'VerifyGame', 'Verifying game %s. Please, wait a moment...');
  VerifyBiosMsg:= GetLanguageText('Status Messages', 'VerifyBios', 'Verifying bios %s. Please, wait a moment...');

  FormStatus.LabelProgress.Tag:= 0;
  // Refresh Classic Master Raster
  for Loop:= ClassicMRList.Count -1 downto 0 do
  begin
    GetROMFields(ClassicMRList[Loop]);
    FormStatus.LabelMessage.Caption:= Format(VerifyGameMsg, [mName]);
    if RefreshGames(ClassicMRList, UnavailableClassicMRList, Loop) then
       begin
         Inc(NumGamesChanged);
         DelClassicMR:= True;
         DelUnClassicMR:= True;
       end;
    UpdateProgressLabel(0, TotalProgress, True);
    Application.ProcessMessages;
    if StopRefreshAllGames then
       begin
         RefreshGamesCanceledMessage;
         Exit;
       end;
  end;

  // Refresh Classic Master Vector
  for Loop:= ClassicMVList.Count -1 downto 0 do
  begin
    GetROMFields(ClassicMVList[Loop]);
    FormStatus.LabelMessage.Caption:= Format(VerifyGameMsg, [mName]);
    FormStatus.LabelMessage.Refresh;
    if RefreshGames(ClassicMVList, UnavailableClassicMVList, Loop) then
       begin
         Inc(NumGamesChanged);
         DelClassicMV:= True;
         DelUnClassicMV:= True;
       end;
    UpdateProgressLabel(0, TotalProgress, True);
    Application.ProcessMessages;
    if StopRefreshAllGames then
       begin
         RefreshGamesCanceledMessage;
         Exit;
       end;
  end;

  // Refresh Classic Clone Raster
  for Loop:= ClassicCRList.Count -1 downto 0 do
  begin
    GetROMFields(ClassicCRList[Loop]);
    FormStatus.LabelMessage.Caption:= Format(VerifyGameMsg, [mName]);
    FormStatus.LabelMessage.Refresh;
    if RefreshGames(ClassicCRList, UnavailableClassicCRList, Loop) then
       begin
         Inc(NumGamesChanged);
         DelClassicCR:= True;
         DelUnClassicCR:= True;
       end;
    UpdateProgressLabel(0, TotalProgress, True);
    Application.ProcessMessages;
    if StopRefreshAllGames then
       begin
         RefreshGamesCanceledMessage;
         Exit;
       end;
  end;

  // Refresh Classic Clone Vector
  for Loop:= ClassicCVList.Count -1 downto 0 do
  begin
    GetROMFields(ClassicCVList[Loop]);
    FormStatus.LabelMessage.Caption:= Format(VerifyGameMsg, [mName]);
    FormStatus.LabelMessage.Refresh;
    if RefreshGames(ClassicCVList, UnavailableClassicCVList, Loop) then
       begin
         Inc(NumGamesChanged);
         DelClassicCV:= True;
         DelUnClassicCV:= True;
       end;
    UpdateProgressLabel(0, TotalProgress, True);
    Application.ProcessMessages;
    if StopRefreshAllGames then
       begin
         RefreshGamesCanceledMessage;
         Exit;
       end;
  end;

  // Refresh Neo Geo Master
  for Loop:= NeoGeoMList.Count -1 downto 0 do
  begin
    GetROMFields(NeoGeoMList[Loop]);
    FormStatus.LabelMessage.Caption:= Format(VerifyGameMsg, [mName]);
    FormStatus.LabelMessage.Refresh;

    if RefreshGames(NeoGeoMList, UnavailableNeoGeoMList, Loop) then
       begin
         Inc(NumGamesChanged);
         DelNeoGeoM:= True;
         DelUnNeoGeoM:= True;
       end;
    UpdateProgressLabel(0, TotalProgress, True);
    Application.ProcessMessages;
    if StopRefreshAllGames then
       begin
         RefreshGamesCanceledMessage;
         Exit;
       end;
  end;

  // Refresh Neo Geo Clone
  for Loop:= NeoGeoCList.Count -1 downto 0 do
  begin
    GetROMFields(NeoGeoCList[Loop]);
    FormStatus.LabelMessage.Caption:= Format(VerifyGameMsg, [mName]);
    FormStatus.LabelMessage.Refresh;
    if RefreshGames(NeoGeoCList, UnavailableNeoGeoCList, Loop) then
       begin
         Inc(NumGamesChanged);
         DelNeoGeoC:= True;
         DelUnNeoGeoC:= True;
       end;
    UpdateProgressLabel(0, TotalProgress, True);
    Application.ProcessMessages;
    if StopRefreshAllGames then
       begin
         RefreshGamesCanceledMessage;
         Exit;
       end;
  end;

  // Refresh BIOS
  for Loop:= BiosList.Count -1 downto 0 do
  begin
    GetROMFields(BiosList[Loop]);
    FormStatus.LabelMessage.Caption:= Format(VerifyBiosMsg, [mName]);
    FormStatus.LabelMessage.Refresh;
    if RefreshGames(BiosList, UnavailableBiosList, Loop) then
       begin
         Inc(NumGamesChanged);
         DelClassicBIOS:= True;
         DelNeoGeoBIOS:= True;
         DelUnClassicBIOS:= True;
         DelUnNeoGeoBIOS:= True;
       end;
    UpdateProgressLabel(0, TotalProgress, True);
    Application.ProcessMessages;
    if StopRefreshAllGames then
       begin
         RefreshGamesCanceledMessage;
         Exit;
       end;
  end;
  // I think that the BIOS refreshing is working correctly now...
  ClassicMRList.EndUpdate;
  ClassicMVList.EndUpdate;
  ClassicCRList.EndUpdate;
  ClassicCVList.EndUpdate;
  NeoGeoMList.EndUpdate;
  NeoGeoCList.EndUpdate;
  UnavailableClassicMRList.EndUpdate;
  UnavailableClassicMVList.EndUpdate;
  UnavailableClassicCRList.EndUpdate;
  UnavailableClassicCVList.EndUpdate;
  UnavailableNeoGeoMList.EndUpdate;
  UnavailableNeoGeoCList.EndUpdate;
  BiosList.EndUpdate;

  SetCurrentDir(FrontendPath);
  FreeAndNil(CategoriesList);
  if DelUnClassicMR then
     begin
       FormStatus.LabelMessage.Caption:= GetStatusMessage('SaveUnClassicMR');
       FormStatus.LabelMessage.Refresh;
       UnavailableClassicMRList.SaveToFile(FrontendPath+'resources\UnClassicMR.dat');
     end;

  if DelUnClassicMV then
     begin
       FormStatus.LabelMessage.Caption:= GetStatusMessage('SaveUnClassicMV');
       FormStatus.LabelMessage.Refresh;
       UnavailableClassicMVList.SaveToFile(FrontendPath+'resources\UnClassicMV.dat');
     end;

  if DelUnClassicCR then
     begin
       FormStatus.LabelMessage.Caption:= GetStatusMessage('SaveUnClassicCR');
       FormStatus.LabelMessage.Refresh;
       UnavailableClassicCRList.SaveToFile(FrontendPath+'resources\UnClassicCR.dat');
     end;

  if DelUnClassicCV then
     begin
       FormStatus.LabelMessage.Caption:= GetStatusMessage('SaveUnClassicCV');
       FormStatus.LabelMessage.Refresh;
       UnavailableClassicCVList.SaveToFile(FrontendPath+'resources\UnClassicCV.dat');
     end;

  if DelUnNeoGeoM then
     begin
       FormStatus.LabelMessage.Caption:= GetStatusMessage('SaveUnNeoGeoM');
       FormStatus.LabelMessage.Refresh;
       UnavailableNeoGeoMList.SaveToFile(FrontendPath+'resources\UnNeoGeoM.dat');
     end;

  if DelUnNeoGeoC then
     begin
       FormStatus.LabelMessage.Caption:= GetStatusMessage('SaveUnNeoGeoC');
       FormStatus.LabelMessage.Refresh;
       UnavailableNeoGeoCList.SaveToFile(FrontendPath+'resources\UnNeoGeoC.dat');
     end;

  if ((DelUnClassicBIOS) or (DelUnNeoGeoBIOS)) then
     begin
       FormStatus.LabelMessage.Caption:= GetStatusMessage('SaveUnClassicBios');
       FormStatus.LabelMessage.Refresh;
       FormStatus.LabelMessage.Caption:= GetStatusMessage('SaveUnNeoGeoBios');
       FormStatus.LabelMessage.Refresh;
       UnavailableBiosList.SaveToFile(FrontendPath+'resources\UnBios.dat');
     end;

  if DelClassicMR then
     begin
       FormStatus.LabelMessage.Caption:= GetStatusMessage('SaveClassicMR');
       FormStatus.LabelMessage.Refresh;
       ClassicMRList.SaveToFile(FrontendPath+'resources\ClassicMR.dat');
     end;

  if DelClassicMV then
     begin
       FormStatus.LabelMessage.Caption:= GetStatusMessage('SaveClassicMV');
       FormStatus.LabelMessage.Refresh;
       ClassicMVList.SaveToFile(FrontendPath+'resources\ClassicMV.dat');
     end;

  if DelClassicCR then
     begin
       FormStatus.LabelMessage.Caption:= GetStatusMessage('SaveClassicCR');
       FormStatus.LabelMessage.Refresh;
       ClassicCRList.SaveToFile(FrontendPath+'resources\ClassicCR.dat');
     end;

  if DelClassicCV then
     begin
       FormStatus.LabelMessage.Caption:= GetStatusMessage('SaveClassicCV');
       FormStatus.LabelMessage.Refresh;
       ClassicCVList.SaveToFile(FrontendPath+'resources\ClassicCV.dat');
     end;

  if DelNeoGeoM then
     begin
       FormStatus.LabelMessage.Caption:= GetStatusMessage('SaveNeoGeoM');
       FormStatus.LabelMessage.Refresh;
       NeoGeoMList.SaveToFile(FrontendPath+'resources\NeoGeoM.dat');
     end;

  if DelNeoGeoC then
     begin
       FormStatus.LabelMessage.Caption:= GetStatusMessage('SaveNeoGeoC');
       FormStatus.LabelMessage.Refresh;
       NeoGeoCList.SaveToFile(FrontendPath+'resources\NeoGeoC.dat');
     end;

  if ((DelClassicBIOS) or (DelNeoGeoBIOS)) then
     begin
       FormStatus.LabelMessage.Caption:= GetStatusMessage('SaveClassicBios');
       FormStatus.LabelMessage.Refresh;
       FormStatus.LabelMessage.Caption:= GetStatusMessage('SaveNeoGeoBios');
       FormStatus.LabelMessage.Refresh;
       BiosList.SaveToFile(FrontendPath+'resources\Bios.dat');
     end;

  FreeAndNil(ClassicMRList);
  FreeAndNil(ClassicMVList);
  FreeAndNil(ClassicCRList);
  FreeAndNil(ClassicCVList);
  FreeAndNil(NeoGeoMList);
  FreeAndNil(NeoGeoCList);
  FreeAndNil(UnavailableClassicMRList);
  FreeAndNil(UnavailableClassicMVList);
  FreeAndNil(UnavailableClassicCRList);
  FreeAndNil(UnavailableClassicCVList);
  FreeAndNil(UnavailableNeoGeoMList);
  FreeAndNil(UnavailableNeoGeoCList);
  FreeAndNil(BiosList);
  FreeAndNil(UnavailableBiosList);
  FreeAndNil(ListROMs);

  //EndClock:= GetTickCount();

  FormStatus.LabelProgress.Caption:= '';
  FormStatus.LabelProgress.Tag:= 0;
  if NumGamesChanged <> 0 then
     LoadROMClasses(False);

  if Length(GamesList) > 0 then
     begin
      SortColumn(ColumnSorted, True);
      SelectItem(FindGame(SelectedGame, SelectedGameCaption));
     end
  else
     begin
       ShowPicture('NoGamesAvailable', '', Picture, -1, True);
       // no games on the list, will show the "No Available Games" image
     end;
  FormStatus.Close;
end;

procedure TFormMain.MenuRefreshUnavailableGamesClick(Sender: TObject);
var
  {StartClock, EndClock,} NumGamesChanged: Integer;
  Loop, TotalProgress: Integer;
  DelClassicMR, DelClassicMV, DelClassicCR, DelClassicCV, DelNeoGeoM, DelNeoGeoC, DelClassicBIOS, DelNeoGeoBIOS: Boolean;
  DelUnClassicMR, DelUnClassicMV, DelUnClassicCR, DelUnClassicCV, DelUnNeoGeoM, DelUnNeoGeoC, DelUnClassicBIOS, DelUnNeoGeoBIOS: Boolean;

  VerifyGameMsg, VerifyBiosMsg, SelectedGameCaption: String;
begin
  if List.Selected = nil then
     Exit;
  FormStatus.Show;
  FormStatus.KeyPreview:= True;
  FormStatus.LabelStatusType.Caption:= GetLanguageText('Status Messages', 'RefreshGamesListUnavailableTitle',
                                                       'Refresh Games List(Unavailable Games Only)');
  SelectedGameCaption:= GamesList[SelectedGame].eDescription;
  NumGamesChanged:= 0;
  //StartClock:= GetTickCount();
  DelClassicMR:= False;
  DelClassicMV:= False;
  DelClassicCR:= False;
  DelClassicCV:= False;
  DelNeoGeoM:= False;
  DelNeoGeoC:= False;
  DelClassicBIOS:= False;
  DelNeoGeoBIOS:= False;
  DelUnClassicMR:= False;
  DelUnClassicMV:= False;
  DelUnClassicCR:= False;
  DelUnClassicCV:= False;
  DelUnNeoGeoM:= False;
  DelUnNeoGeoC:= False;
  DelUnClassicBIOS:= False;
  DelUnNeoGeoBIOS:= False;

  FormStatus.LabelMessage.Caption:= GetLanguageText('Status Messages', 'LoadGamesDATFile',
                                                    'Loading .dat games files to memory. Please, wait a moment...');
  FormStatus.LabelMessage.Refresh;
  ClassicMRList:= THashedStringList.Create;
  ClassicMVList:= THashedStringList.Create;
  ClassicCRList:= THashedStringList.Create;
  ClassicCVList:= THashedStringList.Create;
  NeoGeoMList:= THashedStringList.Create;
  NeoGeoCList:= THashedStringList.Create;
  UnavailableClassicMRList:= THashedStringList.Create;
  UnavailableClassicMVList:= THashedStringList.Create;
  UnavailableClassicCRList:= THashedStringList.Create;
  UnavailableClassicCVList:= THashedStringList.Create;
  UnavailableNeoGeoMList:= THashedStringList.Create;
  UnavailableNeoGeoCList:= THashedStringList.Create;
  BiosList:= THashedStringList.Create;
  UnavailableBiosList:= THashedStringList.Create;

  ClassicMRList.LoadFromFile(FrontendPath+'resources\ClassicMR.dat');
  ClassicMVList.LoadFromFile(FrontendPath+'resources\ClassicMV.dat');
  ClassicCRList.LoadFromFile(FrontendPath+'resources\ClassicCR.dat');
  ClassicCVList.LoadFromFile(FrontendPath+'resources\ClassicCV.dat');
  NeoGeoMList.LoadFromFile(FrontendPath+'resources\NeoGeoM.dat');
  NeoGeoCList.LoadFromFile(FrontendPath+'resources\NeoGeoC.dat');
  UnavailableClassicMRList.LoadFromFile(FrontendPath+'resources\UnClassicMR.dat');
  UnavailableClassicMVList.LoadFromFile(FrontendPath+'resources\UnClassicMV.dat');
  UnavailableClassicCRList.LoadFromFile(FrontendPath+'resources\UnClassicCR.dat');
  UnavailableClassicCVList.LoadFromFile(FrontendPath+'resources\UnClassicCV.dat');
  UnavailableNeoGeoMList.LoadFromFile(FrontendPath+'resources\UnNeoGeoM.dat');
  UnavailableNeoGeoCList.LoadFromFile(FrontendPath+'resources\UnNeoGeoC.dat');
  BiosList.LoadFromFile(FrontendPath+'resources\BIOS.dat');
  UnavailableBiosList.LoadFromFile(FrontendPath+'resources\UnBIOS.dat');

  TotalProgress:= (UnavailableClassicMRList.Count+UnavailableClassicMVList.Count+UnavailableClassicCRList.Count+UnavailableClassicCVList.Count+
                   UnavailableNeoGeoMList.Count+UnavailableNeoGeoCList.Count+UnavailableBiosList.Count);
  FormStatus.LabelProgress.Caption:= '';

  ClassicMRList.BeginUpdate;
  ClassicMVList.BeginUpdate;
  ClassicCRList.BeginUpdate;
  ClassicCVList.BeginUpdate;
  NeoGeoMList.BeginUpdate;
  NeoGeoCList.BeginUpdate;
  UnavailableClassicMRList.BeginUpdate;
  UnavailableClassicMVList.BeginUpdate;
  UnavailableClassicCRList.BeginUpdate;
  UnavailableClassicCVList.BeginUpdate;
  UnavailableNeoGeoMList.BeginUpdate;
  UnavailableNeoGeoCList.BeginUpdate;
  BiosList.BeginUpdate;
  UnavailableBiosList.BeginUpdate;

  FormStatus.LabelMessage.Caption:= GetLanguageText('Status Messages', 'LoadROMsDATFile',
                                                    'Loading file "ROMs.dat" to memory. Please, wait a moment...');
  FormStatus.LabelMessage.Refresh;
  ListROMs:= THashedStringList.Create;
  ListROMs.LoadFromFile(FrontendPath+'resources\ROMs.dat');

  LoadFolders(DefaultDatabaseBuilderExecutable);
  SetCurrentDir(ExtractFilePath(GetCurrentEmulatorExecutable));

  if FileExists(FrontendPath+'catver.ini') then
     CategoriesList:= TMemIniFile.Create(FrontendPath+'catver.ini');

  // Get Verify Game message
  VerifyGameMsg:= GetLanguageText('Status Messages', 'VerifyGame', 'Verifying game %s. Please, wait a moment...');
  VerifyBiosMsg:= GetLanguageText('Status Messages', 'VerifyBios', 'Verifying bios %s. Please, wait a moment...');

  FormStatus.LabelProgress.Tag:= 0;
  // Refresh Unavailable Classic Master Raster
  for Loop:= UnavailableClassicMRList.Count -1 downto 0 do
  begin
    GetROMFields(UnavailableClassicMRList[Loop]);
    FormStatus.LabelMessage.Caption:= Format(VerifyGameMsg, [mName]);
    FormStatus.LabelMessage.Refresh;

    if RefreshGames(UnavailableClassicMRList, ClassicMRList, Loop) then
       begin
         Inc(NumGamesChanged);
         DelUnClassicMR:= True;
         DelClassicMR:= True;
       end;
    UpdateProgressLabel(0, TotalProgress, True);
    Application.ProcessMessages;
    if StopRefreshAllGames then
       begin
         RefreshGamesCanceledMessage;
         Exit;
       end;
  end;

  // Refresh Unavailable Classic Master Vector
  for Loop:= UnavailableClassicMVList.Count -1 downto 0 do
  begin
    GetROMFields(UnavailableClassicMVList[Loop]);
    FormStatus.LabelMessage.Caption:= Format(VerifyGameMsg, [mName]);
    FormStatus.LabelMessage.Refresh;
    if RefreshGames(UnavailableClassicMVList, ClassicMVList, Loop) then
       begin
         Inc(NumGamesChanged);
         DelUnClassicMV:= True;
         DelClassicMV:= True;
       end;
    UpdateProgressLabel(0, TotalProgress, True);
    Application.ProcessMessages;
    if StopRefreshAllGames then
       begin
         RefreshGamesCanceledMessage;
         Exit;
       end;
  end;

  // Refresh Unavailable Classic Clone Raster
  for Loop:= UnavailableClassicCRList.Count -1 downto 0 do
  begin
    GetROMFields(UnavailableClassicCRList[Loop]);
    FormStatus.LabelMessage.Caption:= Format(VerifyGameMsg, [mName]);
    FormStatus.LabelMessage.Refresh;
    if RefreshGames(UnavailableClassicCRList, ClassicCRList, Loop) then
       begin
         Inc(NumGamesChanged);
         DelUnClassicCR:= True;
         DelClassicCR:= True;
       end;
    UpdateProgressLabel(0, TotalProgress, True);
    Application.ProcessMessages;
    if StopRefreshAllGames then
       begin
         RefreshGamesCanceledMessage;
         Exit;
       end;
  end;

  // Refresh Unavailable Classic Clone Vector
  for Loop:= UnavailableClassicCVList.Count -1 downto 0 do
  begin
    GetROMFields(UnavailableClassicCVList[Loop]);
    FormStatus.LabelMessage.Caption:= Format(VerifyGameMsg, [mName]);
    FormStatus.LabelMessage.Refresh;
    if RefreshGames(UnavailableClassicCVList, ClassicCVList, Loop) then
       begin
         Inc(NumGamesChanged);
         DelUnClassicCV:= True;
         DelClassicCV:= True;
       end;
    UpdateProgressLabel(0, TotalProgress, True);
    Application.ProcessMessages;
    if StopRefreshAllGames then
       begin
         RefreshGamesCanceledMessage;
         Exit;
       end;
  end;

  // Refresh Unavailable Neo Geo Master
  for Loop:= UnavailableNeoGeoMList.Count -1 downto 0 do
  begin
    GetROMFields(UnavailableNeoGeoMList[Loop]);
    FormStatus.LabelMessage.Caption:= Format(VerifyGameMsg, [mName]);
    FormStatus.LabelMessage.Refresh;
    if RefreshGames(UnavailableNeoGeoMList, NeoGeoMList, Loop) then
       begin
         Inc(NumGamesChanged);
         DelUnNeoGeoM:= True;
         DelNeoGeoM:= True;
       end;
    UpdateProgressLabel(0, TotalProgress, True);
    Application.ProcessMessages;
    if StopRefreshAllGames then
       begin
         RefreshGamesCanceledMessage;
         Exit;
       end;
  end;

  // Refresh Unavailable Neo Geo Clone
  for Loop:= UnavailableNeoGeoCList.Count -1 downto 0 do
  begin
    GetROMFields(UnavailableNeoGeoCList[Loop]);
    FormStatus.LabelMessage.Caption:= Format(VerifyGameMsg, [mName]);
    FormStatus.LabelMessage.Refresh;
    if RefreshGames(UnavailableNeoGeoCList, NeoGeoCList, Loop) then
       begin
         Inc(NumGamesChanged);
         DelUnNeoGeoC:= True;
         DelNeoGeoC:= True;
       end;
    UpdateProgressLabel(0, TotalProgress, True);
    Application.ProcessMessages;
    if StopRefreshAllGames then
       begin
         RefreshGamesCanceledMessage;
         Exit;
       end;
  end;

  // Refresh Unavailable BIOS
  for Loop:= UnavailableBiosList.Count -1 downto 0 do
  begin
    GetROMFields(UnavailableBiosList[Loop]);
    FormStatus.LabelMessage.Caption:= Format(VerifyBiosMsg, [mName]);
    FormStatus.LabelMessage.Refresh;
    if RefreshGames(UnavailableBiosList, BiosList, Loop) then
       begin
         Inc(NumGamesChanged);
         DelUnClassicBIOS:= True;
         DelUnNeoGeoBIOS:= True;
         DelClassicBIOS:= True;
         DelNeoGeoBIOS:= True;
       end;
    UpdateProgressLabel(0, TotalProgress, True);
    Application.ProcessMessages;
    if StopRefreshAllGames then
       begin
         RefreshGamesCanceledMessage;
         Exit;
       end;
  end;
  // I think that the BIOS refreshing is working correctly now...
  ClassicMRList.EndUpdate;
  ClassicMVList.EndUpdate;
  ClassicCRList.EndUpdate;
  ClassicCVList.EndUpdate;
  NeoGeoMList.EndUpdate;
  NeoGeoCList.EndUpdate;
  UnavailableClassicMRList.EndUpdate;
  UnavailableClassicMVList.EndUpdate;
  UnavailableClassicCRList.EndUpdate;
  UnavailableClassicCVList.EndUpdate;
  UnavailableNeoGeoMList.EndUpdate;
  UnavailableNeoGeoCList.EndUpdate;
  BiosList.EndUpdate;

  SetCurrentDir(FrontendPath);

  FreeAndNil(CategoriesList);

  if DelUnClassicMR then
     begin
       FormStatus.LabelMessage.Caption:= GetStatusMessage('SaveUnClassicMR');
       FormStatus.LabelMessage.Refresh;
       UnavailableClassicMRList.SaveToFile(FrontendPath+'resources\UnClassicMR.dat');
     end;

  if DelUnClassicMV then
     begin
       FormStatus.LabelMessage.Caption:= GetStatusMessage('SaveUnClassicMV');
       FormStatus.LabelMessage.Refresh;
       UnavailableClassicMVList.SaveToFile(FrontendPath+'resources\UnClassicMV.dat');
     end;

  if DelUnClassicCR then
     begin
       FormStatus.LabelMessage.Caption:= GetStatusMessage('SaveUnClassicCR');
       FormStatus.LabelMessage.Refresh;
       UnavailableClassicCRList.SaveToFile(FrontendPath+'resources\UnClassicCR.dat');
     end;

  if DelUnClassicCV then
     begin
       FormStatus.LabelMessage.Caption:= GetStatusMessage('SaveUnClassicCV');
       FormStatus.LabelMessage.Refresh;
       UnavailableClassicCVList.SaveToFile(FrontendPath+'resources\UnClassicCV.dat');
     end;

  if DelUnNeoGeoM then
     begin
       FormStatus.LabelMessage.Caption:= GetStatusMessage('SaveUnNeoGeoM');
       FormStatus.LabelMessage.Refresh;
       UnavailableNeoGeoMList.SaveToFile(FrontendPath+'resources\UnNeoGeoM.dat');
     end;

  if DelUnNeoGeoC then
     begin
       FormStatus.LabelMessage.Caption:= GetStatusMessage('SaveUnNeoGeoC');
       FormStatus.LabelMessage.Refresh;
       UnavailableNeoGeoCList.SaveToFile(FrontendPath+'resources\UnNeoGeoC.dat');
     end;

  if ((DelUnClassicBIOS) or (DelUnNeoGeoBIOS)) then
     begin
       FormStatus.LabelMessage.Caption:= GetStatusMessage('SaveUnClassicBios');
       FormStatus.LabelMessage.Refresh;
       FormStatus.LabelMessage.Caption:= GetStatusMessage('SaveUnNeoGeoBios');
       FormStatus.LabelMessage.Refresh;
       UnavailableBiosList.SaveToFile(FrontendPath+'resources\UnBios.dat');
     end;

  if DelClassicMR then
     begin
       FormStatus.LabelMessage.Caption:= GetStatusMessage('SaveClassicMR');
       FormStatus.LabelMessage.Refresh;
       ClassicMRList.SaveToFile(FrontendPath+'resources\ClassicMR.dat');
     end;

  if DelClassicMV then
     begin
       FormStatus.LabelMessage.Caption:= GetStatusMessage('SaveClassicMV');
       FormStatus.LabelMessage.Refresh;
       ClassicMVList.SaveToFile(FrontendPath+'resources\ClassicMV.dat');
     end;

  if DelClassicCR then
     begin
       FormStatus.LabelMessage.Caption:= GetStatusMessage('SaveClassicCR');
       FormStatus.LabelMessage.Refresh;
       ClassicCRList.SaveToFile(FrontendPath+'resources\ClassicCR.dat');
     end;

  if DelClassicCV then
     begin
       FormStatus.LabelMessage.Caption:= GetStatusMessage('SaveClassicCV');
       FormStatus.LabelMessage.Refresh;
       ClassicCVList.SaveToFile(FrontendPath+'resources\ClassicCV.dat');
     end;

  if DelNeoGeoM then
     begin
       FormStatus.LabelMessage.Caption:= GetStatusMessage('SaveNeoGeoM');
       FormStatus.LabelMessage.Refresh;
       NeoGeoMList.SaveToFile(FrontendPath+'resources\NeoGeoM.dat');
     end;

  if DelNeoGeoC then
     begin
       FormStatus.LabelMessage.Caption:= GetStatusMessage('SaveNeoGeoC');
       FormStatus.LabelMessage.Refresh;
       NeoGeoCList.SaveToFile(FrontendPath+'resources\NeoGeoC.dat');
     end;

  if ((DelClassicBIOS) or (DelNeoGeoBIOS)) then
     begin
       FormStatus.LabelMessage.Caption:= GetStatusMessage('SaveClassicBios');
       FormStatus.LabelMessage.Refresh;
       FormStatus.LabelMessage.Caption:= GetStatusMessage('SaveNeoGeoBios');
       FormStatus.LabelMessage.Refresh;
       BiosList.SaveToFile(FrontendPath+'resources\Bios.dat');
     end;

  FreeAndNil(ClassicMRList);
  FreeAndNil(ClassicMVList);
  FreeAndNil(ClassicCRList);
  FreeAndNil(ClassicCVList);
  FreeAndNil(NeoGeoMList);
  FreeAndNil(NeoGeoCList);
  FreeAndNil(UnavailableClassicMRList);
  FreeAndNil(UnavailableClassicMVList);
  FreeAndNil(UnavailableClassicCRList);
  FreeAndNil(UnavailableClassicCVList);
  FreeAndNil(UnavailableNeoGeoMList);
  FreeAndNil(UnavailableNeoGeoCList);
  FreeAndNil(BiosList);
  FreeAndNil(UnavailableBiosList);
  FreeAndNil(ListROMs);

  //EndClock:= GetTickCount();

  FormStatus.LabelProgress.Caption:= '';
  FormStatus.LabelProgress.Tag:= 0;
  if NumGamesChanged <> 0 then
     LoadROMClasses(False);

  if Length(GamesList) > 0 then
     begin
       SortColumn(ColumnSorted, True);
       SelectItem(FindGame(SelectedGame, SelectedGameCaption));
     end
  else
     begin
       ShowPicture('NoGamesAvailable', '', Picture, -1, True);
       // no games on the list, will show the "No Available Games" image
     end;
  FormStatus.Close;
end;

procedure TFormMain.PictureClick(Sender: TObject);
begin
  if ButtonPicturesModeView.Visible then
     CyclePictureType;
end;

procedure TFormMain.MenuRestoreMainScreenDefaultScreenSizePositionClick(
  Sender: TObject);
begin
  if FormMain.WindowState = wsNormal then
     begin
       FormMain.Width:= 630;
       FormMain.Height:= 460;
       PanelPictures.Width:= 315;
       FormMain.Top:= (Screen.Height shr 1)-(Height shr 1)-1;
       FormMain.Left:= (Screen.Width shr 1)-(Width shr 1)-1;
     end;
end;

procedure TFormMain.ButtonUseExecutable3Click(Sender: TObject);
begin
  MenuUseExecutable3.Click;
end;

procedure TFormMain.MenuAutomaticGameInformationClick(Sender: TObject);
var
  PathDAT1, PathDAT2, PathDAT3: String;
begin
  PopupAutomaticGameInformation.Checked:= MenuAutomaticGameInformation.Checked;
  ButtonAutomaticGameInformation.Checked:= MenuAutomaticGameInformation.Checked;

  if Pos(':\', mameinfoFile) = 0 then
     PathDAT1:= ExtractFilePath(GetCurrentEmulatorExecutable)+mameinfoFile
  else
     PathDAT1:= mameinfoFile;

  if Pos(':\', historyFile) = 0 then
     PathDAT2:= ExtractFilePath(GetCurrentEmulatorExecutable)+historyFile
  else
     PathDAT2:= historyFile;

  if Pos(':\', faqDir) = 0 then
     PathDAT3:= FrontendPath+faqDir+'\'+GamesList[SelectedGame].eName+'.faq';


  if (PathDAT1 <> '') or (PathDAT2 <> '') or (PathDAT3 <> '') then
     begin
       case MenuAutomaticGameInformation.Checked of
         True:
           begin
             if (FileExists(PathDAT1)) or (FileExists(PathDAT2)) or (FileExists(PathDAT3)) then
                begin
                  if FileExists(PathDAT1) then
                     begin
                       AutoMAMEInfoDATFile:= THashedStringList.Create;
                       AutoMAMEInfoDATFile.LoadFromFile(PathDAT1);
                     end;

                  if FileExists(PathDAT2) then
                     begin
                       AutoHistoryDATFile:= THashedStringList.Create;
                       AutoHistoryDATFile.LoadFromFile(PathDAT2);
                     end;
                  ShowAutomaticGameInformation;
                end
             else
                MenuAutomaticGameInformation.Checked:= False;
           end;
         False:
           begin
             FreeAndNil(AutoMAMEInfoDATFile);
             FreeAndNil(AutoHistoryDATFile);
             SplitterMAMEInfo.Visible:= False;
             PanelmameinfoDAT.Visible:= False;
           end;
       end;
  end;
end;

procedure TFormMain.MenuShowGameInfoClick(Sender: TObject);
var
  GameIcon: TIcon;
  LanguageFile: TMemIniFile;
begin
  if not Assigned(FormGameInfo) then
     FormGameInfo:= TFormGameInfo.Create(Self);

  if FileExists(FrontendPath+'resources\language\'+FrontendLanguage+'.lng') then
     begin
       LanguageFile:= TMemIniFile.Create(FrontendPath+'resources\language\'+FrontendLanguage+'.lng');

       FormGameInfo.ButtonClose.Caption:= GetLanguageText('Resource', 'ButtonClose', '&Close');
       FormGameInfo.ButtonClose.Hint:= GetLanguageText('Resource', 'ButtonCloseHint', 'Close this window');
     end;
  FreeAndNil(LanguageFile);

  GameIcon:= TIcon.Create;
  with FormGameInfo do
  begin
    case MenuRealIcons.Checked of
      True : BigRealIconsImageList.GetIcon(GamesList[SelectedGame].eImageIndex, GameIcon);
      False: BuiltInBigListImageList.GetIcon(GamesList[SelectedGame].eImageIndex, GameIcon);
    end;
    ImageGameIcon.Picture.Icon:= GameIcon;
    Application.ProcessMessages;
    FreeAndNil(GameIcon);

    LabelGameDescription.Caption:= GamesList[SelectedGame].eDescription;
    Manufacturer.Caption:= '(C) '+GamesList[SelectedGame].eManufacturer;
    Year.Caption:= GamesList[SelectedGame].eYear;
    if GamesList[SelectedGame].eSound = '' then
       Sound.Caption:= 'No Sound'
    else
       Sound.Caption:= GamesList[SelectedGame].eSound;

    Frequency.Caption:= GamesList[SelectedGame].eFrequency;
    if GamesList[SelectedGame].eSamples = 'Yes' then
       Samples.Caption:= 'Present'
    else
    if GamesList[SelectedGame].eSamples = 'No' then
       Samples.Caption:= 'Missing'
    else
       Samples.Caption:= 'No';

    ControlType.Caption:= GamesList[SelectedGame].eControlType;
    Video.Caption:= GamesList[SelectedGame].eVideo;
    Orientation.Caption:= GamesList[SelectedGame].eOrientation;
    Resolution.Caption:= GamesList[SelectedGame].eResolution;
    Name.Caption:= GamesList[SelectedGame].eName;
    if (GamesList[SelectedGame].eClone <> '') and (GamesList[SelectedGame].eClone <> GamesList[SelectedGame].eName) then
       CloneOf.Caption:= GamesList[SelectedGame].eClone
    else
       CloneOf.Caption:= '';
    if GamesList[SelectedGame].eMerged = 'Yes' then
       Merged.Caption:= GamesList[SelectedGame].eClone
    else
       Merged.Caption:= '';

    DriverStatus.Caption:= GamesList[SelectedGame].eDriverStatus;
    SoundStatus.Caption:= GamesList[SelectedGame].eSoundStatus;
    ColorStatus.Caption:= GamesList[SelectedGame].eColorStatus;
    Category.Caption:= GamesList[SelectedGame].eCategory;
    VersionAdded.Caption:= GamesList[SelectedGame].eVersionAdded;
    Driver.Caption:= GamesList[SelectedGame].eDriver;
  end;
  FormGameInfo.ShowModal;
  FreeAndNil(FormGameInfo);
end;

procedure TFormMain.MenuFileClick(Sender: TObject);
begin
  MenuSet1stEmulatorDefaultOptions.Enabled:= EmulatorExecutable[1] <> '';
  MenuChange1stEmulatorDescription.Enabled:= MenuSet1stEmulatorDefaultOptions.Enabled;
  MenuGet1stEmulatorDefaultDescription.Enabled:= MenuSet1stEmulatorDefaultOptions.Enabled;
  MenuUseExecutable1.Enabled:= MenuSet1stEmulatorDefaultOptions.Enabled;
  ButtonUseExecutable1.Enabled:= MenuSet1stEmulatorDefaultOptions.Enabled;

  MenuSet2ndEmulatorDefaultOptions.Enabled:= EmulatorExecutable[2] <> '';
  MenuChange2ndEmulatorDescription.Enabled:= MenuSet2ndEmulatorDefaultOptions.Enabled;
  MenuGet2ndEmulatorDefaultDescription.Enabled:= MenuSet2ndEmulatorDefaultOptions.Enabled;
  MenuUseExecutable2.Enabled:= MenuSet2ndEmulatorDefaultOptions.Enabled;
  ButtonUseExecutable2.Enabled:= MenuSet2ndEmulatorDefaultOptions.Enabled;

  MenuSet3rdEmulatorDefaultOptions.Enabled:= EmulatorExecutable[3] <> '';
  MenuGet3rdEmulatorDefaultDescription.Enabled:= MenuSet3rdEmulatorDefaultOptions.Enabled;
  MenuChange3rdEmulatorDescription.Enabled:= MenuSet3rdEmulatorDefaultOptions.Enabled;
  MenuUseExecutable3.Enabled:= MenuSet3rdEmulatorDefaultOptions.Enabled;
  ButtonUseExecutable3.Enabled:= MenuSet3rdEmulatorDefaultOptions.Enabled;

  MenuSet4thEmulatorDefaultOptions.Enabled:= EmulatorExecutable[4] <> '';
  MenuGet4thEmulatorDefaultDescription.Enabled:= MenuSet4thEmulatorDefaultOptions.Enabled;
  MenuChange4thEmulatorDescription.Enabled:= MenuSet4thEmulatorDefaultOptions.Enabled;
  MenuUseExecutable4.Enabled:= MenuSet4thEmulatorDefaultOptions.Enabled;
  ButtonUseExecutable4.Enabled:= MenuSet4thEmulatorDefaultOptions.Enabled;

  MenuSet5thEmulatorDefaultOptions.Enabled:= EmulatorExecutable[5] <> '';
  MenuGet5thEmulatorDefaultDescription.Enabled:= MenuSet5thEmulatorDefaultOptions.Enabled;
  MenuChange5thEmulatorDescription.Enabled:= MenuSet5thEmulatorDefaultOptions.Enabled;
  MenuUseExecutable5.Enabled:= MenuSet5thEmulatorDefaultOptions.Enabled;
  ButtonUseExecutable5.Enabled:= MenuSet5thEmulatorDefaultOptions.Enabled;
end;

procedure TFormMain.MenuAdvancedToolsClick(Sender: TObject);
begin
  MenuRestoreMainScreenDefaultScreenSizePosition.Enabled:= FormMain.WindowState = wsNormal;
end;

procedure TFormMain.MenuTotalPlayTimeClick(Sender: TObject);
begin
  CheckPlayTime;
  GenerateMessage(GetLanguageText('Messages', 'TotalPlayTimeTitle', 'Total Time Played'),
                  Format(GetLanguageText('Messages', 'TotalPlayTimeMsg', 'Time played since last install of Emu Loader: %s'),
                         [GetPlayTime(StrToInt64(TotalPlayTime))]), 2);
end;

procedure TFormMain.CallEmulatorOptions(ExecutableString: String);
var
  ExeType: String[5];
begin
  if ExecutableString <> '' then
     begin
       ExeType:= ExeStrings[GetExeType(ExecutableString)];
       if ExeType = 'DOS' then
          begin
            if not Assigned(FormDOSMAMEConfiguration) then
               FormDOSMAMEConfiguration:= TFormDOSMAMEConfiguration.Create(Self);
            LoadMAMEConfigurationIcons(FormDOSMAMEConfiguration.MAMEConfigImageList);
            FormDOSMAMEConfiguration.EmulatorString:=ExecutableString;
            FormDOSMAMEConfiguration.ReadMAMEcfg.Caption:= Format(GetLanguageText('Resource', 'ButtonReadIni', '&Read "%s"'), ['mame.cfg']);
            FormDOSMAMEConfiguration.ReadMAMEcfg.Hint:= Format(GetLanguageText('Resource', 'ButtonReadIniHint', 'Read all data from file "%s"'), ['mame.cfg']);
            FormDOSMAMEConfiguration.Caption:=FormDOSMAMEConfiguration.Caption;
            FormDOSMAMEConfiguration.ShowModal;
            FreeAndNil(FormDOSMAMEConfiguration);
          end
       else
       if ExeType = 'Win32' then
          begin
            SetCurrentDir(ExtractFilePath(ExecutableString));
            if not Assigned(FormMAMEConfiguration) then
               FormMAMEConfiguration:= TFormMAMEConfiguration.Create(Self);
            LoadMAMEConfigurationIcons(FormMAMEConfiguration.MAMEConfigImageList);
            FormMAMEConfiguration.EmulatorString:= ExecutableString;
            FormMAMEConfiguration.ReadMAMEini.Caption:= Format(GetLanguageText('Resource', 'ButtonReadIni', '&Read "%s"'), [GetExecutableINIFileName(ExecutableString)]);
            FormMAMEConfiguration.ReadMAMEini.Hint:= Format(GetLanguageText('Resource', 'ButtonReadIniHint', 'Read all data from file "%s"'), [GetExecutableINIFileName(ExecutableString)]);
            FormMAMEConfiguration.ShowModal;
            FreeAndNil(FormMAMEConfiguration);
            SetCurrentDir(FrontendPath);
          end
       else
          begin
            GenerateMessage(GetLanguageText('Messages', 'InvalidEmulatorFileFormatTitle', 'Invalid Executable File'),
                            GetLanguageText('Messages', 'SelectValidEmulatorFileMsg', 'Please, select a valid executable (MAME and DOS MAME only).'), 2);
          end;
     end
  else
     GenerateMessage(GetLanguageText('Messages', 'NoExecutableSelectedTitle', 'MAME Executable Not Selected'),
                     GetLanguageText('Messages', 'SelectEmulatorFileMsg', 'Select a executable before continue!'), 2);
end;

procedure TFormMain.MenuSet1stEmulatorDefaultOptionsClick(Sender: TObject);
begin
  CallEmulatorOptions(EmulatorExecutable[1]);
  if MenuUseExecutable1.Checked then
     LoadFolders('1');
end;

procedure TFormMain.MenuSet2ndEmulatorDefaultOptionsClick(Sender: TObject);
begin
  CallEmulatorOptions(EmulatorExecutable[2]);
  if MenuUseExecutable2.Checked then
     LoadFolders('2');
end;

procedure TFormMain.MenuSet3rdEmulatorDefaultOptionsClick(Sender: TObject);
begin
  CallEmulatorOptions(EmulatorExecutable[3]);
  if MenuUseExecutable3.Checked then
  LoadFolders('3');
end;

procedure TFormMain.MenuSet4thEmulatorDefaultOptionsClick(Sender: TObject);
begin
  CallEmulatorOptions(EmulatorExecutable[4]);
  if MenuUseExecutable4.Checked then
     LoadFolders('4');
end;

procedure TFormMain.MenuSet5thEmulatorDefaultOptionsClick(Sender: TObject);
begin
  CallEmulatorOptions(EmulatorExecutable[5]);
  if MenuUseExecutable5.Checked then
     LoadFolders('5');
end;

procedure TFormMain.MenuGameFAQClick(Sender: TObject);
var
  FileFound: Boolean;
  FilenameString: String;
begin
  if List.Selected = nil then
     Exit;
  SetCurrentDir(FrontendPath);

  FileFound:= True;
  case FileExists(faqDir+'\'+GamesList[SelectedGame].eName+'.faq') of
    False:
      begin
        if (GamesList[SelectedGame].eClone <> '') and (GamesList[SelectedGame].eName <> GamesList[SelectedGame].eClone) then
            begin
              FileFound:= FileExists(faqDir+'\'+GamesList[SelectedGame].eClone+'.faq');
              if FileFound then
                 FilenameString:= faqDir+'\'+GamesList[SelectedGame].eClone+'.faq';
            end
        else
            FileFound:= False;
      end;
    True: FilenameString:= faqDir+'\'+GamesList[SelectedGame].eName+'.faq';
  end;

  case FileFound of
    True:
      begin
        if not Assigned(FormDATViewer) then
           FormDATViewer:= TFormDATViewer.Create(Self);

        if TextWordWrap then
           begin
             FormDATViewer.WordWrap.Checked:= True;
             FormDATViewer.WordWrap.OnClick(Self);
           end;
        FormDATViewer.DATTextHolder.Lines.BeginUpdate;
        FormDATViewer.DATTextHolder.Lines.LoadFromFile(FilenameString);
        FormDATViewer.DATTextHolder.Lines.EndUpdate;
        FormDATViewer.Caption:= Format(GetLanguageText('DAT Viewer', 'Title3' ,'Viewing [%s] - F.A.Q. - Frequently Asked Questions'),
                                      [ExtractFileName(FilenameString)]);
        FormDATViewer.LabelGameDescription.Caption:= GamesList[SelectedGame].eDescription;
        FormDATViewer.ShowModal;
        TextWordWrap:= FormDATViewer.WordWrap.Checked;
        FreeAndNil(FormDATViewer);
      end;
    False:
      begin
        GenerateMessage(GetLanguageText('Messages', 'NoGameFAQInformationTitle', 'F.A.Q. Information Not Found'),
                        GetLanguageText('Messages', 'NoGameFAQInformationMsg', 'There is no F.A.Q. information for this game.'), 2);
      end;
  end;
end;

procedure TFormMain.MenuSetDebugCustomOptionsClick(Sender: TObject);
begin
  SetCustomOptions('debug', True);
end;

procedure TFormMain.MenuDeleteDebugCustomOptionsClick(Sender: TObject);
begin
  DeleteCustomOptions('debug');
end;

procedure TFormMain.MenuDeleteGameDriverCustomOptionsClick(
  Sender: TObject);
begin
  DeleteCustomOptions(CurrentGameDriver);
end;

procedure TFormMain.MenuGamesColumnsEditorClick(Sender: TObject);
begin
  if not Assigned(FormFilterGameColumns) then
     FormFilterGameColumns:= TFormFilterGameColumns.Create(Self);
  FormFilterGameColumns.ShowModal;
  FreeAndNil(FormFilterGameColumns);
end;

procedure TFormMain.MenuSetGameDriverCustomOptionsClick(Sender: TObject);
begin
  SetCustomOptions(CurrentGameDriver, True);
end;

procedure TFormMain.MenuCustomInitializationOptionsClick(Sender: TObject);

  procedure ToggleOptions(Filename: String; MenuSetName, MenuDeleteName, PopupSetName, PopupDeleteName: TMenuItem);
  begin
    SetCurrentDir(ExtractFilePath(GetCurrentEmulatorExecutable));
    case FileExists(IniFilesDir+'\'+Filename) of
      True:
        begin
          MenuSetName.Enabled:= True;
          MenuDeleteName.Enabled:= True;

          PopupSetName.Enabled:= True;
          PopupDeleteName.Enabled:= True;
        end;
      False:
        begin
          MenuSetName.Enabled:= True;
          MenuDeleteName.Enabled:= False;

          PopupSetName.Enabled:= True;
          PopupDeleteName.Enabled:= False;
        end;
    end;
    SetCurrentDir(FrontendPath);
  end;
begin
  if GamesList[SelectedGame].eDescription <> '' then
     begin
       case GetCurrentEmulatorFormat of
         1:
           begin
             MenuCustomInitializationOptions.Enabled:= True;
             PopupCustomInitializationOptions.Enabled:= True;

             CurrentGameDriver:= GamesList[SelectedGame].eDriver;
             if CurrentGameDriver <> '' then
                begin
                   Delete(CurrentGameDriver, Length(CurrentGameDriver)-1, Length(CurrentGameDriver));
                   ToggleOptions(CurrentGameDriver+'.ini',
                                 MenuSetGameDriverCustomOptions, MenuDeleteGameDriverCustomOptions,
                                 PopupSetGameDriverCustomOptions, PopupDeleteGameDriverCustomOptions);
                end
             else
                begin
                  MenuSetGameDriverCustomOptions.Enabled:= False;
                  MenuDeleteGameDriverCustomOptions.Enabled:= False;

                  PopupSetGameDriverCustomOptions.Enabled:= False;
                  PopupDeleteGameDriverCustomOptions.Enabled:= False;
                end;

             ToggleOptions('debug.ini',
                           MenuSetDebugCustomOptions, MenuDeleteDebugCustomOptions,
                           PopupSetDebugCustomOptions, PopupDeleteDebugCustomOptions);
           end;
         else
           begin
             MenuCustomInitializationOptions.Enabled:= False;
             PopupCustomInitializationOptions.Enabled:= False;
           end;
       end;
     end;
end;

procedure TFormMain.MenuSelectGameTotalPlayTimeClick(Sender: TObject);
var
  PlayTime, NumberPlay: String;
begin
  PlayTime:= ReadSelectedGamePlayTime(GamesList[SelectedGame].eName);
  if PlayTime <> '' then
     begin
       NumberPlay:= Copy(PlayTime, Pos('¬',PlayTime)+1, Length(PlayTime));
       Delete(PlayTime, Pos('¬',PlayTime), Length(PlayTime));
       GenerateMessage(GetLanguageText('Messages', 'TotalPlayTimeTitle', 'Total Time Played'),
                       GamesList[SelectedGame].eDescription+#13#10+#13#10+
                       Format(GetLanguageText('Messages', 'TotalPlayTimeMsg', 'Time played since last install: %s'), [GetPlayTime(StrToInt64(PlayTime))])+#13#10+
                       Format(GetLanguageText('Messages', 'TotalPlayTimeNumberPlayMsg', 'Times Played: %s'), [NumberPlay]), 2);
     end
  else
     GenerateMessage(GetLanguageText('Messages', 'NoInformationAvailableTitle', 'No Information Available'),
                     GetLanguageText('Messages', 'TotalPlayTimeNoInformationMsg', 'This game does not have any info... Please, play it at least once.'), 2);
end;

procedure TFormMain.ButtonShowControlPanelLayoutClick(Sender: TObject);
begin
  MenuShowControlPanelLayout.Click;
end;

procedure TFormMain.PopupShowControlPanelLayoutClick(Sender: TObject);
begin
  MenuShowControlPanelLayout.Click;
end;

procedure TFormMain.StatusBarRandomGameClick(Sender: TObject);
begin
  ShowingPicture:= True;
  Randomize;
  SelectItem(Random(Length(GamesList)-1));
end;

procedure TFormMain.MenuChange1stEmulatorDescriptionClick(Sender: TObject);
begin
  ChangeEmulatorDescription(1);
end;

procedure TFormMain.MenuChange2ndEmulatorDescriptionClick(Sender: TObject);
begin
  ChangeEmulatorDescription(2);
end;

procedure TFormMain.MenuChange3rdEmulatorDescriptionClick(Sender: TObject);
begin
  ChangeEmulatorDescription(3);
end;

procedure TFormMain.MenuChange4thEmulatorDescriptionClick(Sender: TObject);
begin
  ChangeEmulatorDescription(4);
end;

procedure TFormMain.MenuChange5thEmulatorDescriptionClick(Sender: TObject);
begin
  ChangeEmulatorDescription(5);
end;

procedure TFormMain.ChangeEmulatorDescription(EmulatorNumber: ShortInt);
var
  NewDescription: String;
begin
  NewDescription:= InputBox(EmulatorVersion[EmulatorNumber],
                            Format(GetLanguageText('Messages', 'EmulatorEnterNewDescriptionMsg',
                                                   'Enter a new description for Executable %d'), [EmulatorNumber]),
                            EmulatorVersion[EmulatorNumber]);
  if NewDescription <> EmulatorVersion[EmulatorNumber] then
     begin
       EmulatorVersion[EmulatorNumber]:= NewDescription;
       case EmulatorNumber of
         1:
           begin
             if MenuUseExecutable1.Checked then
                LabelEmulatorVersion.Caption:= EmulatorVersion[1];
           end;
         2:
           begin
             if MenuUseExecutable2.Checked then
                LabelEmulatorVersion.Caption:= EmulatorVersion[2];
           end;
         3:
           begin
             if MenuUseExecutable3.Checked then
                LabelEmulatorVersion.Caption:= EmulatorVersion[3];
           end;
         4:
           begin
             if MenuUseExecutable4.Checked then
                LabelEmulatorVersion.Caption:= EmulatorVersion[4];
           end;
         5:
           begin
             if MenuUseExecutable5.Checked then
                LabelEmulatorVersion.Caption:= EmulatorVersion[5];
           end;
       end;
     end;
end;

procedure TFormMain.GetEmulatorDefaultDescription(const EmulatorFileName: String; EmulatorNumber: ShortInt);
var
  ExeType: String[5];
begin
  ExeType:= ExeStrings[GetExeType(EmulatorFileName)];
  if not GetEmulatorVersion(EmulatorNumber, ExeType) then
     begin
       GenerateMessage(GetLanguageText('Messages', 'InvalidEmulatorFileFormatTitle', 'Invalid Executable File'),
                       Format(GetLanguageText('Messages', 'InvalidEmulatorFileFormatMsg', 'Executable %d is not valid!')+#13+
                              GetLanguageText('Messages', 'SelectValidEmulatorFileMsg', 'Please, select a valid executable (MAME and DOS MAME only).'), [EmulatorNumber]), 2);
       Exit;
     end;
end;

procedure TFormMain.MenuGet1stEmulatorDefaultDescriptionClick(
  Sender: TObject);
begin
  GetEmulatorDefaultDescription(EmulatorExecutable[1], 1);
end;

procedure TFormMain.MenuGet2ndEmulatorDefaultDescriptionClick(
  Sender: TObject);
begin
  GetEmulatorDefaultDescription(EmulatorExecutable[2], 2);
end;

procedure TFormMain.MenuGet3rdEmulatorDefaultDescriptionClick(
  Sender: TObject);
begin
  GetEmulatorDefaultDescription(EmulatorExecutable[3], 3);
end;

procedure TFormMain.MenuGet4thEmulatorDefaultDescriptionClick(
  Sender: TObject);
begin
  GetEmulatorDefaultDescription(EmulatorExecutable[4], 4);
end;

procedure TFormMain.MenuGet5thEmulatorDefaultDescriptionClick(
  Sender: TObject);
begin
  GetEmulatorDefaultDescription(EmulatorExecutable[5], 5);
end;

procedure TFormMain.MenuDeleteZIPFileNameClick(Sender: TObject);
var
  ZIPFileName, ZIPFolderName, DeleteMessage: String;
  MergedGame, DeleteFileName: Boolean;
begin
  if List.Selected = nil then
     Exit;

  LoadFolders(IntToStr(ButtonExecutablesMode.Tag));
  SetCurrentDir(ExtractFilePath(GetCurrentEmulatorExecutable));
  DeleteFileName:= False;
  MergedGame:= False;
  ZIPFileName:= GamesList[SelectedGame].eName;
  ZIPFolderName:= SearchZIPFolder(ZIPFileName);
  if ZIPFolderName = 'Not Found' then
     begin
       if GamesList[SelectedGame].eMerged <> '' then
          begin
            // this is a merged game
            MergedGame:= True;
            ZIPFileName:= GamesList[SelectedGame].eClone;
            ZIPFolderName:= SearchZIPFolder(ZIPFileName);
            if ZIPFolderName = 'Not Found' then
               begin
                 // Parent filename not found
                 GenerateMessage(GetLanguageText('Messages', 'FileNotFoundTitle', 'File Not Found'),
                                 GetLanguageText('Messages', 'DeleteFileFailedMsg', 'There is no file to delete! Try selecting a different MAME Executable.'), 2);
                 Exit;
               end
            else
               begin
                 // Parent filename found
                 DeleteFileName:= True;
               end;
          end
       else
          begin
            GenerateMessage(GetLanguageText('Messages', 'FileNotFoundTitle', 'File Not Found'),
                            GetLanguageText('Messages', 'DeleteFileFailedMsg', 'There is no file to delete! Try selecting a different MAME Executable.'), 2);
            Exit;
          end;
     end
  else
     begin
       // ZIP filename found
       DeleteFileName:= True;
     end;

  if DeleteFileName then
     begin
       case MergedGame of
         False:
           begin
             if ((GamesList[SelectedGame].eClone = '') or (GamesList[SelectedGame].eName = GamesList[SelectedGame].eClone)) then
                DeleteMessage:=Format(GetLanguageText('Messages', 'DeleteFileMasterMsg',
                                                      'This will physically delete the file "%s" from disk! If there are clones of this game, they will stop working. Are you sure ?'), [ZIPFolderName])
             else
                DeleteMessage:=Format(GetLanguageText('Messages', 'DeleteFileCloneMsg',
                                                      'This will physically delete the file "%s" from disk! Are you sure ?'), [ZIPFolderName]);
           end;
         True: DeleteMessage:=Format(GetLanguageText('Messages', 'DeleteFileCloneMergedMsg',
                                                     'This will physically delete the file "%s" from disk! The game "%s" is merged, which means that the parent game will also be lost. Are you sure ?'), [ZIPFolderName, GamesList[SelectedGame].eName]);
       end;

       case GenerateMessage(MenuDeleteZIPFileName.Caption+' [MAME '+IntToStr(ButtonExecutablesMode.Tag)+']', DeleteMessage, 1) of
         mrYes:
           begin
             DeleteFile(ZIPFolderName);
             Application.ProcessMessages;
             MenuRefreshSelectedGame.OnClick(Self);
             GenerateMessage(GetLanguageText('Messages', 'CompleteOperationTitle', 'Operation Complete'),
                             Format(GetLanguageText('Messages', 'DeleteFileCompleteMsg', 'The file "%s" is deleted!'), [ZIPFolderName]), 2);
           end;
         mrNo:
           begin
             // File not deleted
           end;
       end;
     end;
  SetCurrentDir(FrontendPath);
end;

procedure TFormMain.MenuParentalLockClick(Sender: TObject);
var
  SelectedGameCaption: String;
begin
  if List.Selected <> nil then
     SelectedGameCaption:= GamesList[SelectedGame].eDescription;
  Screen.Cursor:= crHourGlass;
  case MenuParentalLock.Checked of
    True:
      begin
        if (not FileExists(FrontendPath+'ParentalLock.pwd')) and (not FileExists(FrontendPath+'resources\BlockedGames.dat')) then
           begin
             // start new session
             if not Assigned(FormParentalLockManager) then
                FormParentalLockManager:= TFormParentalLockManager.Create(Self);
             GenerateMessage(GetLanguageText('Messages', 'ParentalLockWelcomeTitle', 'Welcome To Parental Lock Mode'),
                             GetLanguageText('Messages', 'ParentalLockWelcomeMsg', 'Please, add keywords to the keywords list and choose the games to lock.'), 2);
             FormParentalLockManager.HaveProtectedGames:= False;
             FormParentalLockManager.ShowModal;
             FreeAndNil(FormParentalLockManager);
             case MenuParentalLock.Tag of
               0: begin
                    SetLockedGamesList(True);
                    LoadROMClasses(False);
                  end;
               1: begin
                    MenuParentalLock.Tag:= 1;
                    MenuParentalLock.Click;
                  end;
             end;
           end
        else
           begin
             if GetFileSize(FrontendPath+'ParentalLock.pwd') > 0 then
                begin
                  if MenuParentalLock.Tag = 0 then
                     begin
                       ParentalLockPasswordString:=LoadParentalLockPassword;
                       if GetFileSize(FrontendPath+'resources\BlockedGames.dat') > 0 then
                          begin
                            SetLockedGamesList(True);
                            LoadROMClasses(False);
                          end
                       else
                          begin
                            GenerateMessage(GetLanguageText('Messages', 'NoLockedGamesFoundTitle', 'No Locked Games'),
                                            GetLanguageText('Messages', 'NoLockedGamesFoundMsg', 'There are no games on the locked list! You must select at least one game for this to work.'), 2);
                            MenuParentalLock.Tag:= 1;
                            MenuParentalLock.Click;
                          end;
                     end
                  else
                     MenuParentalLock.Tag:= 0;
                end
             else
                begin
                  GenerateMessage(GetLanguageText('Messages', 'NoLockedGamesFoundTitle', 'No Locked Games'),
                                  GetLanguageText('Messages', 'NoLockedGamesFoundMsg', 'There are no games on the locked list! You must select at least one game for this to work.'), 2);
                  MenuParentalLock.Tag:= 1;
                  MenuParentalLock.Click;
                end;
           end;
      end;
    False:
      begin
        if MenuParentalLock.Tag = 0 then
           begin
             // call the password screen to deactivate the lock
             // if password accepted, then the games are unlocked
             if not Assigned(FormParentalLockPasswordLogout) then
                FormParentalLockPasswordLogout:= TFormParentalLockPasswordLogout.Create(Self);
             FormParentalLockPasswordLogout.Password.Tag:= 0;
             FormParentalLockPasswordLogout.ShowModal;
             FreeAndNil(FormParentalLockPasswordLogout);
             case MenuParentalLock.Tag of
               0: begin
                    SetLockedGamesList(False);
                    case ButtonShowFavorite.Down of
                      True : ButtonShowFavorite.OnClick(Self);
                      False: LoadROMClasses(False);
                    end;
                  end;
               1: begin
                    MenuParentalLock.Tag:= 1;
                    MenuParentalLock.Click;
                  end;
             end;
           end
        else
           MenuParentalLock.Tag:= 0;
      end;
  end;
  if CloseStatusWindow then
     FormStatus.Close;
  if Length(GamesList) > 0 then
     begin
       SortColumn(ColumnSorted, True);
       SelectItem(FindGame(SelectedGame, SelectedGameCaption));
     end;
  Screen.Cursor:= crDefault;
end;

procedure TFormMain.ListKeyPress(Sender: TObject; var Key: Char);
begin
  if (FormPreferences.HotRod.Checked) or (FormPreferences.XArcade.Checked) or
     (FormPreferences.SlikStik.Checked) then
     Key:= Char(0); //reset key pressed
end;

procedure TFormMain.ListKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (FormPreferences.HotRod.Checked) or (FormPreferences.XArcade.Checked) or (FormPreferences.SlikStik.Checked) then
      begin
        if (Key = VK_NUMPAD2) or (Key = VK_NUMPAD6) or (Key = VK_NUMPAD4) or (Key = VK_NUMPAD8) then
           Exit;

        if Key = Ord('1') then // Player 1 Start button starts game with default options
           MenuPlayGameStandard.OnClick(Self)
        else

        if Key = Ord('2') then // Player 2 Start button starts game with custom options
           begin
             if MenuPlayGame.Enabled then
                MenuPlayGame.OnClick(Self);
           end
        else

        if (Key = Ord('3')) or (Key = Ord('5')) then // Player 1 side button change MAME executable, Player 1 Coin button for SlikStik
           begin
             case ButtonExecutablesMode.Tag of
               1:
                begin
                  if MenuUseExecutable2.Enabled then
                     MenuUseExecutable2.Click
                  else
                  if MenuUseExecutable3.Enabled then
                     MenuUseExecutable3.Click
                  else
                  if MenuUseExecutable4.Enabled then
                     MenuUseExecutable4.Click
                  else
                  if MenuUseExecutable5.Enabled then
                     MenuUseExecutable5.Click;
                end;
               2:
                begin
                  if MenuUseExecutable3.Enabled then
                     MenuUseExecutable3.Click
                  else
                  if MenuUseExecutable4.Enabled then
                     MenuUseExecutable4.Click
                  else
                  if MenuUseExecutable5.Enabled then
                     MenuUseExecutable5.Click
                  else
                  if MenuUseExecutable1.Enabled then
                     MenuUseExecutable1.Click;
                end;
               3:
                begin
                  if MenuUseExecutable4.Enabled then
                     MenuUseExecutable4.Click
                  else
                  if MenuUseExecutable5.Enabled then
                     MenuUseExecutable5.Click
                  else
                  if MenuUseExecutable1.Enabled then
                     MenuUseExecutable1.Click;
                end;
               4:
                begin
                  if MenuUseExecutable5.Enabled then
                     MenuUseExecutable5.Click
                  else
                  if MenuUseExecutable1.Enabled then
                     MenuUseExecutable1.Click;
                end;
               5:
                begin
                  if MenuUseExecutable1.Enabled then
                     MenuUseExecutable1.Click;
                end;
             end;
             // will have to check what button is selected, then need to see if next button
             // is enabled, then try to check it
             // if it could not be selected, restore first selection
           end
        else

        if (Key = Ord('4')) or (Key = Ord('6')) then
           begin
             if MenuShowPictures.Visible then
                MenuShowPictures.Click;
           end
        else

        if (Key = Ord('R')) or (Key = Ord('r')) then
           begin
             case FormPreferences.SlikStikSwap2ndPlayerStick.Checked of
               True : InvertCyclePictureType;
               False: CyclePictureType; //SlikStik UP/DOWN is inverted, "R" means "DOWN" (old controllers)
             end;
           end
        else

        if (Key = Ord('F')) or (Key = Ord('f')) then
           begin
             case FormPreferences.SlikStikSwap2ndPlayerStick.Checked of
               True : CyclePictureType;
               False: InvertCyclePictureType; //SlikStik UP/DOWN is inverted, "F" means "UP" (old controllers)
             end;
           end
        else

        if (Key = Ord('D')) or (Key = Ord('d')) then
           ButViewPreviousPicture.OnClick(Self)
        else

        if (Key = Ord('G')) or (Key = Ord('g')) then
           ButViewNextPicture.OnClick(Self)
        else
           Key:= 0;
      end
  else

  if (not FormPreferences.HotRod.Checked) and (not FormPreferences.XArcade.Checked) and (not FormPreferences.SlikStik.Checked) then
     begin
        if (Key = VK_F2) and (Shift = [ssShift]) then
           begin
             if MenuFullScreen.Visible then
                MenuFullScreen.Click;
           end
        else
        if Key = VK_F6 then
           begin
             if MenuShowPictures.Visible then
                MenuShowPictures.Click;
           end
        else
        if Key = VK_F3 then
           begin
             if MenuAutomaticGameInformation.Visible then
                MenuAutomaticGameInformation.Click;
           end
        else
        if Key = VK_F11 then
           begin
             if MenuShowPictures.Visible then
                ButViewPreviousPicture.OnClick(Self);
           end
        else
        if Key = VK_F12 then
           begin
             if MenuShowPictures.Visible then
                ButViewNextPicture.OnClick(Self);
           end
        else
        if Key = VK_F9 then
           Picture.OnClick(Self);
     end;
end;

procedure TFormMain.MenuMAMEKeysInfoClick(Sender: TObject);
var
  LanguageFile: TMemIniFile;
begin
  if not Assigned(FormMAMEKeysInfo) then
     FormMAMEKeysInfo:= TFormMAMEKeysInfo.Create(Self);

  if FileExists(FrontendPath+'resources\images\topwindow\MAMEKeysInfo.png') then
     FormMAMEKeysInfo.TopImage.Picture.LoadFromFile(FrontendPath+'resources\images\topwindow\MAMEKeysInfo.png');

  if FileExists(FrontendPath+'resources\language\'+FrontendLanguage+'.lng') then
     begin
       LanguageFile:= TMemIniFile.Create(FrontendPath+'resources\language\'+FrontendLanguage+'.lng');

       FormMAMEKeysInfo.ButtonClose.Caption:= GetLanguageText('Resource', 'ButtonClose', '&Close');
       FormMAMEKeysInfo.ButtonClose.Hint:= GetLanguageText('Resource', 'ButtonCloseHint', 'Close this window');
     end;
  FreeAndNil(LanguageFile);

  FormMAMEKeysInfo.LabelCaption.Caption:= MenuMAMEKeysInfo.Caption;
  FormMAMEKeysInfo.ShowModal;
  FreeAndNil(FormMAMEKeysInfo);
end;

procedure TFormMain.ButtonUseExecutable1Click(Sender: TObject);
begin
  MenuUseExecutable1.Click;
end;

procedure TFormMain.ButtonUseExecutable2Click(Sender: TObject);
begin
  MenuUseExecutable2.Click;
end;

procedure TFormMain.MenuPlayRecordedGameClick(Sender: TObject);
begin
  ButtonPlayRecordedGame.Down:= MenuPlayRecordedGame.Checked;
  PopupPlayRecordedGame.Checked:= MenuPlayRecordedGame.Checked;
  case MenuPlayRecordedGame.Checked of
    True: INPFilename.Text:= GamesList[SelectedGame].eName;
    False:
      begin
        if not MenuRecordGame.Checked then
           INPFilename.Clear;
      end;
  end;
end;

procedure TFormMain.MenuRecordGameClick(Sender: TObject);
begin
  ButtonRecordGame.Down:= MenuRecordGame.Checked;
  PopupRecordGame.Checked:= MenuRecordGame.Checked;
  case MenuRecordGame.Checked of
    True: INPFilename.Text:= GamesList[SelectedGame].eName;
    False:
      begin
        if not MenuPlayRecordedGame.Checked then
           INPFilename.Clear;
      end;
  end;
end;

procedure TFormMain.MenuShowHideFavoriteUsersManagerClick(Sender: TObject);
begin
  PopupShowHideFavoriteUsersManager.Checked:= MenuShowHideFavoriteUsersManager.Checked;
  case MenuShowHideFavoriteUsersManager.Checked of
    False:
      begin
        FormFavoriteUsersManager.Release;
        FormFavoriteUsersManager:= nil;
      end;
    True:
      begin
        if not Assigned(FormFavoriteUsersManager) then
           FormFavoriteUsersManager:= TFormFavoriteUsersManager.Create(Self);
        FormFavoriteUsersManager.Show;
      end;
  end;
end;

procedure TFormMain.MenuShowTitleSnapshotClick(Sender: TObject);
begin
  PictureNumber:= 1;
  PictureType:= 0;
  ButtonShowTitleSnapshot.Checked:= True;
  ButtonPicturesModeView.ImageIndex:= 37;
  ButtonPicturesModeView.Tag:= PictureType;
  PopupShowTitleSnapshot.Checked:= True;
  ShowingPicture:= True;
  if not FormStatus.Visible then
     begin
       FormPreferences.TitleSnapshotPicturesBackgroundColor.OnSelect(Self);
       MenuShowPictures.OnClick(Self);
     end;
end;

procedure TFormMain.MenuShowInGameSnapshotClick(Sender: TObject);
begin
  PictureNumber:= 1;
  PictureType:= 1;
  ButtonShowInGameSnapshot.Checked:= True;
  ButtonPicturesModeView.ImageIndex:= 5;
  ButtonPicturesModeView.Tag:= PictureType;
  PopupShowInGameSnapshot.Checked:= True;
  ShowingPicture:= True;
  if not FormStatus.Visible then
     begin
       FormPreferences.InGameSnapshotPicturesBackgroundColor.OnSelect(Self);
       MenuShowPictures.OnClick(Self);
     end;
end;

procedure TFormMain.MenuShowMarqueeClick(Sender: TObject);
begin
  PictureNumber:= 1;
  PictureType:= 2;
  ButtonShowMarquee.Checked:= True;
  ButtonPicturesModeView.ImageIndex:= 6;
  ButtonPicturesModeView.Tag:= PictureType;
  PopupShowMarquee.Checked:= True;
  ShowingPicture:= True;
  if not FormStatus.Visible then
     begin
       FormPreferences.MarqueePicturesBackgroundColor.OnSelect(Self);
       MenuShowPictures.OnClick(Self);
     end;
end;

procedure TFormMain.MenuShowFlyerClick(Sender: TObject);
begin
  PictureNumber:= 1;
  PictureType:= 3;
  ButtonShowFlyer.Checked:= True;
  ButtonPicturesModeView.ImageIndex:= 7;
  ButtonPicturesModeView.Tag:= PictureType;
  PopupShowFlyer.Checked:= True;
  ShowingPicture:= True;
  if not FormStatus.Visible then
     begin
       FormPreferences.FlyerPicturesBackgroundColor.OnSelect(Self);
       MenuShowPictures.OnClick(Self);
     end;
end;

procedure TFormMain.MenuShowCabinetClick(Sender: TObject);
begin
  PictureNumber:= 1;
  PictureType:= 4;
  ButtonShowCabinet.Checked:= True;
  ButtonPicturesModeView.ImageIndex:= 8;
  ButtonPicturesModeView.Tag:= PictureType;
  PopupShowCabinet.Checked:= True;
  ShowingPicture:= True;
  if not FormStatus.Visible then
     begin
       FormPreferences.CabinetPicturesBackgroundColor.OnSelect(Self);
       MenuShowPictures.OnClick(Self);
     end;
end;

procedure TFormMain.MenuShowControlPanelClick(Sender: TObject);
begin
  PictureNumber:= 1;
  PictureType:= 5;
  ButtonShowControlPanel.Checked:= True;
  ButtonPicturesModeView.ImageIndex:= 17;
  ButtonPicturesModeView.Tag:= PictureType;
  PopupShowControlPanel.Checked:= True;
  ShowingPicture:= True;
  if not FormStatus.Visible then
     begin
       FormPreferences.ControlPanelPicturesBackgroundColor.OnSelect(Self);
       MenuShowPictures.OnClick(Self);
     end;
end;

procedure TFormMain.MenuShowControlPanelLayoutClick(Sender: TObject);
begin
  PictureNumber:= 1;
  PictureType:= 6;
  ButtonShowControlPanelLayout.Checked:= True;
  ButtonPicturesModeView.ImageIndex:= 59;
  ButtonPicturesModeView.Tag:= PictureType;
  PopupShowControlPanelLayout.Checked:= True;
  ShowingPicture:= True;
  if not FormStatus.Visible then
     begin
       FormPreferences.ControlPanelLayoutPicturesBackgroundColor.OnSelect(Self);
       MenuShowPictures.OnClick(Self);
     end;
end;

procedure TFormMain.PopupShowTitleSnapshotClick(Sender: TObject);
begin
  MenuShowTitleSnapshot.Click;
end;

procedure TFormMain.PopupShowFavoriteClick(Sender: TObject);
begin
  MenuShowFavorite.Click;
end;

procedure TFormMain.MenuRealIconsClick(Sender: TObject);
var
  Loop: Integer;
begin
  Screen.Cursor:= crHourGlass;
  case MenuRealIcons.Checked of
    True:
      begin
        PopupRealIcons.Checked:= True;
        if BigRealIconsImageList.Count = 1 then
           begin
             if not SaveLoadRealIcons(1) then
                LoadRealIcons;
           end;

        if (Length(GamesList) > 0) and (FileExists(FrontendPath+'resources\IconsIndex.dat')) and (FileExists(FrontendPath+'resources\IconsList.ini')) then
           begin
             RealIconsDAT:= TMemIniFile.Create(FrontendPath+'resources\IconsList.ini');
             List.LargeImages:= BigRealIconsImageList;
             List.SmallImages:= SmallRealIconsImageList;

             for Loop:=0 to Length(GamesList)-1 do
               GamesList[Loop].eImageIndex:= RealIconsDAT.ReadInteger('IconsOrder', GamesList[Loop].eName, 0);
             FreeAndNil(RealIconsDAT);
           end
        else
           begin
             case MenuRealIcons.Tag of
               0: MenuRealIcons.Click;
               1: begin
                    List.LargeImages:= BigRealIconsImageList;
                    List.SmallImages:= SmallRealIconsImageList;
                  end;
             end;
           end;
      end;
    False:
      begin
        PopupRealIcons.Checked:= False;
        List.LargeImages:= BuiltInBigListImageList;
        List.SmallImages:= BuiltInSmallListImageList;
        for Loop:=0 to Length(GamesList)-1 do
          GamesList[Loop].eImageIndex:= GamesList[Loop].eROMIdentification;
        // will change the icons to the bult-in ones
      end;
  end;
  List.Invalidate;
  if MenuRealIcons.Tag = 1 then
     MenuRealIcons.Tag:= 0;
  Screen.Cursor:= crDefault;
end;

procedure TFormMain.MenuParentalLockManagerClick(
  Sender: TObject);
begin
  case MenuParentalLock.Checked of
    False:
      begin
        if not Assigned(FormParentalLockManager) then
           FormParentalLockManager:= TFormParentalLockManager.Create(Self);
        if (not FileExists(FrontendPath+'ParentalLock.pwd')) and (not FileExists(FrontendPath+'resources\BlockedGames.dat')) then
           begin
              GenerateMessage(GetLanguageText('Messages', 'ParentalLockWelcomeTitle', 'Welcome To Parental Lock Mode'),
                             GetLanguageText('Messages', 'ParentalLockWelcomeMsg', 'Please, add keywords to the keywords list and choose the games to lock.'), 2);
              FormParentalLockManager.HaveProtectedGames:= False;
           end
        else
           FormParentalLockManager.HaveProtectedGames:= (FileExists(FrontendPath+'resources\BlockedGames.dat')) and (GetFileSize(FrontendPath+'resources\BlockedGames.dat') > 0);

        FormParentalLockManager.ShowModal;
        FreeAndNil(FormParentalLockManager);
      end;
    True:
      begin
        GenerateMessage(GetLanguageText('Messages', 'ParentalLockActivatedTitle', 'Parental Lock Activated'),
                        GetLanguageText('Messages', 'ParentalLockActivatedMsg', 'Access to parental lock manager denied! To add/delete games from the locked games list, the parental lock must be deactivated.'), 2);
      end;
  end;
end;

procedure TFormMain.PopupRealIconsClick(Sender: TObject);
begin
  MenuRealIcons.Click;
end;

procedure TFormMain.PopupPlayRecordedGameClick(Sender: TObject);
begin
  MenuPlayRecordedGame.Click;
end;

procedure TFormMain.PopupRecordGameClick(Sender: TObject);
begin
  MenuRecordGame.Click;
end;

procedure TFormMain.MenuShowActiveMAMEROMPathsClick(Sender: TObject);
var
  Counter: Integer;
  ROMsString: String;
begin
  ROMsString:= '';
  for Counter:=0 to ROMsFolders.Count-1 do
      ROMsString:= ROMsString+ROMsFolders[Counter]+#13#10;

  Delete(ROMsString, Length(ROMsString)-1, 2);
  GenerateMessage(GetLanguageText('Messages', 'MAMEROMsPathsTitle', 'M.A.M.E. ROM Paths'), ROMsString, 2);
end;

procedure TFormMain.MenuUserProfileClick(Sender: TObject);
var
  Profiles: Boolean;
begin
  Profiles:= False;
  case MenuUserProfile.Checked of
    True:
      begin
        if ActiveUserProfileDescription = '' then
           begin
             case FileExists(FrontendPath+'UserProfiles.ini') of
               False:
                 begin
                    GenerateMessage(GetLanguageText('Messages', 'UserProfileWelcomeTitle', 'Welcome To User Profile Mode'),
                                    GetLanguageText('Messages', 'UserProfileWelcomeMsg', 'Please, create a new profile.'), 2);
                 end;
               True:
                 begin
                   if GetFileSize(FrontendPath+'UserProfiles.ini') = 0 then
                      GenerateMessage(GetLanguageText('Messages', 'UserProfileWelcomeTitle', 'Welcome To User Profile Mode'),
                                      GetLanguageText('Messages', 'UserProfileWelcomeMsg', 'Please, create a new profile.'), 2)
                   else
                      Profiles:= True;
                 end;
             end;

             case Profiles of
               True:
                 begin
                   // this will open the login screen so you can select an user (without entering the password)
                   if not Assigned(FormUserProfileUserLogin) then
                      FormUserProfileUserLogin:=TFormUserProfileUserLogin.Create(Self);
                   with FormUserProfileUserLogin do
                   begin
                     LabelEnterPassword.Enabled:= False;
                     Password.Enabled:= False;
                     LabelConfirmPassword.Enabled:= False;
                     ConfirmPassword.Enabled:= False;
                     CurrentUserProfile:= '';
                     Password.Tag:= 1;
                     UserProfile.Items.BeginUpdate;
                     GetProfiles(UserProfile.Items);
                     UserProfile.Items.EndUpdate;
                   end;
                   FormUserProfileUserLogin.ShowModal;
                   StatusBarUserProfile.Caption:= Format(GetLanguageText('Main', 'StatusBarUserProfile', 'User Profile: %s'), [ActiveUserProfileDescription]);
                   case MenuUserProfile.Tag of
                     0:
                       begin
                         FreeAndNil(FormUserProfileUserLogin);
                         case SetUserProfileOptions(ActiveUserProfileDescription) of
                           False:
                             begin
                               ActiveUserProfileDescription:= '';
                               MenuUserProfile.Checked:= False;
                               FreeAndNil(FormUserProfileUserLogin);
                               StatusBarUserProfile.Visible:= MenuUserProfile.Checked;
                               GenerateMessage(GetLanguageText('Messages', 'ErrorTitle', 'Error'),
                                               Format(GetLanguageText('Messages', 'UserProfileReadOptionsErrorMsg', 'Could not read profile options! Profile "%s" not activated!'), [ActiveUserProfileDescription]), 2);
                               Exit;
                             end;
                           True:
                             begin
                               StatusBarUserProfile.Visible:= MenuUserProfile.Checked;
                               ToolbarStatusBar.Repaint;
                             end;
                         end;
                       end;
                     1:
                       begin
                         ActiveUserProfileDescription:= '';
                         MenuUserProfile.Checked:= False;
                         MenuUserProfile.Tag:= 0;
                         FreeAndNil(FormUserProfileUserLogin);
                         StatusBarUserProfile.Visible:= MenuUserProfile.Checked;
                         Exit;
                       end;
                   end;
                 end;
               False:
                 begin
                   ActiveUserProfileDescription:= '';
                   MenuUserProfile.Checked:= False;
                   MenuUserProfile.Tag:= 0;
                   if GenerateMessage(GetLanguageText('Messages', 'NoUserProfileTitle', 'No User Profiles'),
                                      GetLanguageText('Messages', 'NoUserProfileMsg', 'There are no profiles to activate! Do you want to create a profile now ?'), 1) = mrYes then
                      begin
                        if not Assigned(FormUserProfileEditor) then
                           FormUserProfileEditor:= TFormUserProfileEditor.Create(Self);
                        FormUserProfileEditor.UserProfileFileName:= '';
                        FormUserProfileEditor.HaveProfiles:= False;
                        FormUserProfileEditor.ShowModal;
                        FreeAndNil(FormUserProfileEditor);
                      end;
                   StatusBarUserProfile.Visible:= MenuUserProfile.Checked;
                 end;
             end;
           end
        else
           begin
             // it has a user profile. All I need to do is to try activate it
             StatusBarUserProfile.Caption:= Format(GetLanguageText('Main', 'StatusBarUserProfile', 'User Profile: %s'), [ActiveUserProfileDescription]);
             if not SetUserProfileOptions(ActiveUserProfileDescription) then
                begin
                  MenuUserProfile.Checked:= False;
                  FreeAndNil(FormUserProfileUserLogin);
                  GenerateMessage(GetLanguageText('Messages', 'ErrorTitle', 'Error'),
                                  Format(GetLanguageText('Messages', 'UserProfileSetOptionsErrorMsg', 'Could not set profile options, please verify! Profile "%s" not activated.'), [ActiveUserProfileDescription]), 2);
                  ActiveUserProfileDescription:= '';
                  StatusBarUserProfile.Visible:= MenuUserProfile.Checked;
                  Exit;
                end;
           end;
      end;
    False:
      begin
        // it has an activated user profile. I need to call the password screen to deactivate it, and
        // maybe call the login again to activate another profile
        if not Assigned(FormUserProfileUserLogin) then
           FormUserProfileUserLogin:= TFormUserProfileUserLogin.Create(Self);
        with FormUserProfileUserLogin do
        begin
          LabelSelectUserProfile.Enabled:= False;
          UserProfile.Enabled:= False;
          CurrentUserProfile:= ActiveUserProfileDescription;
          Password.Tag:= 0;
          UserProfile.Items.BeginUpdate;
          GetProfiles(UserProfile.Items);
          UserProfile.Items.EndUpdate;
          UserProfile.ItemIndex:= UserProfile.Items.IndexOf(ActiveUserProfileDescription);
          LabelUserProfileLogin.Caption:= GetLanguageText('Login Logout', 'LabelUserProfileLogout', 'User Profile Logout');
        end;
        FormUserProfileUserLogin.ShowModal;
        case MenuUserProfile.Tag of
          0:
            begin
              FreeAndNil(FormUserProfileUserLogin);
              ResetUserProfileOptions;
              GenerateMessage(GetLanguageText('Messages', 'CompleteOperationTitle', 'Operation Complete'),
                              GetLanguageText('Messages', 'UserProfileDeactivated', 'User Profile is deactivated!'), 2);
              ActiveUserProfileDescription:= '';
              StatusBarUserProfile.Visible:= MenuUserProfile.Checked;
              ToolbarStatusBar.Repaint;
            end;
          1:
            begin
              MenuUserProfile.Checked:= True;
              MenuUserProfile.Tag:= 0;
              FreeAndNil(FormUserProfileUserLogin);
              StatusBarUserProfile.Visible:= MenuUserProfile.Checked;
              ToolbarStatusBar.Repaint;
            end;
        end;
      end;
  end;
end;

procedure TFormMain.MenuFullScreenClick(Sender: TObject);
begin
  if FormMain.BorderStyle <> bsSizeable then
     FormMain.BorderStyle:= bsSizeable;

  PopupExit.Enabled:= MenuFullScreen.Checked;
  case MenuFullScreen.Checked of
    True:
      begin
        PopupFullScreen.Checked:= MenuFullScreen.Checked;
        if FormMain.WindowState = wsMaximized then
           begin
             MenuFullScreen.Tag:= 1;
             FormMain.WindowState:= wsNormal;
           end;
        FormMainWidth:= FormMain.Width;
        FormMainHeight:= FormMain.Height;
        FormMainTop:= FormMain.Top;
        FormMainLeft:= FormMain.Left;
        ToolbarsPanel.Visible:= False;
        ToolbarStatusBar.Visible:= False;

        SetWindowLong(FormMain.Handle, GWL_STYLE,GetWindowLong(FormMain.Handle, GWL_STYLE) and not WS_CAPTION);
        SetWindowPos(FormMain.Handle, HWND_TOP, 0, 0, GetSystemMetrics(SM_CXSCREEN),
                     GetSystemMetrics(SM_CYSCREEN), SWP_SHOWWINDOW or SWP_NOACTIVATE);
        SetForegroundWindow(FormMain.Handle);
        SetActiveWindow(Application.Handle);
      end;
    False:
      begin
        SetWindowLong(FormMain.Handle, GWL_STYLE, GetWindowLong(FormMain.Handle, GWL_STYLE) or WS_CAPTION);
        SetWindowPos(FormMain.Handle, HWND_TOP, 0, 0, GetSystemMetrics(SM_CXSCREEN),
                     GetSystemMetrics(SM_CYSCREEN), SWP_SHOWWINDOW or SWP_NOACTIVATE);
        SetForegroundWindow(FormMain.Handle);
        SetActiveWindow(Application.Handle);
        LockWindowUpdate(FormMain.Handle);
        FormMain.WindowState:= wsNormal;

        { Make the form normal }
        MoveWindow(FormMain.Handle, FormMainLeft, FormMainTop, FormMainWidth, FormMainHeight, True);
        LockWindowUpdate(0);

        ToolbarsPanel.Visible:= True;
        ToolbarStatusBar.Visible:= True;
        if MenuFullScreen.Tag = 1 then
           FormMain.WindowState:= wsMaximized;
      end;
  end;
  FormMain.Refresh;
  Application.ProcessMessages;
end;

procedure TFormMain.MenuShowPicturesClick(Sender: TObject);
var
  PictureName: String;
begin
  PopupShowPictures.Checked:= MenuShowPictures.Checked;

  case MenuShowPictures.Checked of
    True:
      begin
        if List.Selected = nil then
           Exit;
        PanelPictures.Visible:= True;
        PanelPicture1.Visible:= True;
        PicturesToolBar.Visible:= True;
        Splitter.Visible:= True;

        SetVirtualPictureType;
        GetTotalPictures;
        PictureName:= ShowPicture(GamesList[SelectedGame].eName, GamesList[SelectedGame].eClone, Picture, PictureType, True);
        if PictureName <> 'No Change' then
           begin
             Picture.Hint:= PictureName;
             Picture.Refresh;
           end;
        UpdateLabelPictures;
      end;
    False:
      begin
        Picture.Bitmap.Clear;
        Picture.Hint:= '';
        LabelPictureNumber.Caption:= '';

        PanelPictures.Visible:= False;
        Splitter.Visible:= False;
      end;
  end;
end;

procedure TFormMain.PopupShowPicturesClick(Sender: TObject);
begin
  MenuShowPictures.Click;
end;

procedure TFormMain.MenuUserProfileEditorClick(Sender: TObject);
var
  OpenProfileEditor, Profiles: Boolean;
begin
  OpenProfileEditor:= True;
  Profiles:= False;
  case FileExists(FrontendPath+'UserProfiles.ini') of
    False:
      begin
         GenerateMessage(GetLanguageText('Messages', 'UserProfileWelcomeTitle', 'Welcome To User Profile Mode'),
                         GetLanguageText('Messages', 'UserProfileWelcomeMsg', 'Please, create a new profile.'), 2);
      end;
    True:
      begin
        if GetFileSize(FrontendPath+'UserProfiles.ini') = 0 then
           GenerateMessage(GetLanguageText('Messages', 'UserProfileWelcomeTitle', 'Welcome To User Profile Mode'),
           GetLanguageText('Messages', 'UserProfileWelcomeMsg', 'Please, create a new profile.'), 2)
        else
           Profiles:= True;
      end;
  end;

  if (MenuUserProfile.Checked) and (Profiles) then
     begin
       if not FileExists(FrontendPath+'resources\profiles\'+ActiveUserProfileDescription+'.dat') then
          begin
            GenerateMessage(GetLanguageText('Messages', 'FileNotFoundTitle', 'File Not Found'),
                            Format(GetLanguageText('Messages', 'UserProfileFileNotFoundMsg', 'File "%s.dat" not found! Please, set profile options again.'), [ActiveUserProfileDescription]), 2);
          end;
       // this will open then current user profile for editing, after verifying password
       if not Assigned(FormUserProfileUserLogin) then
          FormUserProfileUserLogin:= TFormUserProfileUserLogin.Create(Self);
       with FormUserProfileUserLogin do
       begin
         LabelSelectUserProfile.Enabled:= False;
         UserProfile.Enabled:= False;
         CurrentUserProfile:= ActiveUserProfileDescription;
         Password.Tag:= 0;
         UserProfile.Items.BeginUpdate;
         GetProfiles(UserProfile.Items);
         UserProfile.Items.EndUpdate;
         UserProfile.ItemIndex:= UserProfile.Items.IndexOf(ActiveUserProfileDescription);
       end;
       FormUserProfileUserLogin.ShowModal;
       FreeAndNil(FormUserProfileUserLogin);
       if MenuUserProfile.Tag = 1 then
          OpenProfileEditor:= False;
     end;

  if OpenProfileEditor then
     begin
        if not Assigned(FormUserProfileEditor) then
           FormUserProfileEditor:= TFormUserProfileEditor.Create(Self);
        with FormUserProfileEditor do
        begin
          UserProfileFileName:= ActiveUserProfileDescription;
          HaveProfiles:= Profiles;
          if MenuUserProfile.Checked then
             begin
               LabelSelectUserProfile.Enabled:= False;
               SelectUserProfile.Enabled:= False;
               ButtonCreateNewProfile.Enabled:= False;
               ButtonSaveProfile.Enabled:= True;
             end;
        end;
        FormUserProfileEditor.ShowModal;
        FreeAndNil(FormUserProfileEditor);
     end;
end;

procedure TFormMain.MenuLanguageClick(Sender: TObject);
begin
  if not Assigned(FormLanguage) then
     FormLanguage:= TFormLanguage.Create(Self);
  UpdateGeneralAppearance(FormLanguage);
  FormLanguage.ShowModal;
  FreeAndNil(FormLanguage);
end;

procedure TFormMain.ButtonShowAllGamesClick(Sender: TObject);
begin
  if ButtonShowAllGames.Checked then
     begin
       ButtonGameFilters.Tag:= 0;
       SetGameType(ButtonGameType.Tag);
     end;
end;

procedure TFormMain.ButtonShowAvailableGamesClick(Sender: TObject);
begin
  if ButtonShowAvailableGames.Checked then
     begin
       ButtonGameFilters.Tag:= 1;
       SetGameType(ButtonGameType.Tag);
     end;
end;

procedure TFormMain.ButtonShowUnavailableGamesClick(Sender: TObject);
begin
  if ButtonShowUnavailableGames.Checked then
     begin
       ButtonGameFilters.Tag:= 2;
       SetGameType(ButtonGameType.Tag);
     end;
end;

procedure TFormMain.PopupFullScreenClick(Sender: TObject);
begin
  MenuFullScreen.Click;
end;

procedure TFormMain.ButtonUseExecutable4Click(Sender: TObject);
begin
  MenuUseExecutable4.Click;
end;

procedure TFormMain.ButtonUseExecutable5Click(Sender: TObject);
begin
  MenuUseExecutable5.Click;
end;

procedure TFormMain.MenuCreateNewGamesListClick(Sender: TObject);
var
  Loop: Integer;
  ExeType: String[5];
begin
  FormStatus.Show;
  FormStatus.LabelProgress.Caption:= '';
  FormStatus.LabelMessage.Caption:= GetLanguageText('Status Messages', 'DetectEmulatorVersion',
                                                    'Detecting emulator version. Please, wait a moment...');
  FormStatus.LabelMessage.Refresh;

  ExeType:= ExeStrings[GetExeType(EmulatorExecutable[StrToInt(DefaultDatabaseBuilderExecutable)])];

  if not GetEmulatorVersion(StrToInt(DefaultDatabaseBuilderExecutable), ExeType) then
     begin
       GenerateMessage(GetLanguageText('Messages', 'InvalidEmulatorFileFormatTitle', 'Invalid Executable File'),
                       Format(GetLanguageText('Messages', 'InvalidEmulatorFileFormatMsg', 'Executable %d is not valid!')+#13+
                              GetLanguageText('Messages', 'SelectValidEmulatorFileMsg', 'Please, select a valid executable (MAME and DOS MAME only).'), [1]), 2);
       Exit;
     end;

  CancelCurrentOperation:= False;
  FormStatus.KeyPreview:= True;

  ShowingPicture:= True;

  LoadFolders(DefaultDatabaseBuilderExecutable);
  CreateGamesList(DefaultDatabaseBuilderExecutable, False);

  FormStatus.LabelProgress.Caption:= '';
  FormStatus.Close;
  FormStatus.KeyPreview:= False;
end;

procedure TFormMain.MenuVisitXArcadeHomepageClick(Sender: TObject);
begin
  ShellExecute(Handle, 'open', 'http://www.x-arcade.com', nil, nil, SW_SHOWNORMAL);
end;

procedure TFormMain.MenuVisitSlikStikHomepageClick(Sender: TObject);
begin
  ShellExecute(Handle, 'open', 'http://www.slikstik.com', nil, nil, SW_SHOWNORMAL);
end;

procedure TFormMain.MenuVisitHotRodHomepageClick(Sender: TObject);
begin
  ShellExecute(Handle, 'open', 'http://www.hanaho.com', nil, nil, SW_SHOWNORMAL);
end;

procedure TFormMain.StatusBarFavoriteUserClick(Sender: TObject);
begin
  if MenuShowHideFavoriteUsersManager.Enabled then
     MenuShowHideFavoriteUsersManager.Click;
end;


procedure TFormMain.ButtonModeViewBigIconsClick(Sender: TObject);
begin
  MenuModeViewBigIcons.Click;
end;

procedure TFormMain.ButtonModeViewSmallIconsClick(Sender: TObject);
begin
  MenuModeViewSmallIcons.Click;
end;

procedure TFormMain.ButtonModeViewListClick(Sender: TObject);
begin
  MenuModeViewList.Click;
end;

procedure TFormMain.ButtonModeViewDetailsClick(Sender: TObject);
begin
  MenuModeViewDetails.Click;
end;

procedure TFormMain.PopupAutomaticGameInformationClick(Sender: TObject);
begin
  MenuAutomaticGameInformation.Click;
end;

procedure TFormMain.ButtonAutomaticGameInformationClick(Sender: TObject);
begin
  MenuAutomaticGameInformation.Click;
end;

// this is called when the listview needs to display an item
procedure TFormMain.ListData(Sender: TObject; Item: TListItem);
begin
  if (Item.Index > (Length(GamesList)-1)) or (Item.Index < 0) then
     Exit;
  with GamesList[Item.Index] do
  begin
    Item.ImageIndex:= eImageIndex;
    Item.Caption:= eDescription;

    if ButtonModeView.Tag = 3 then
       begin
         Item.SubItems.Add(eYear);
         Item.SubItems.Add(eManufacturer);
         Item.SubItems.Add(eSound);
         Item.SubItems.Add(eFrequency);
         Item.SubItems.Add(eSamples);
         Item.SubItems.Add(eControlType);
         Item.SubItems.Add(eVideo);
         Item.SubItems.Add(eOrientation);
         Item.SubItems.Add(eResolution);
         Item.SubItems.Add(eDriverStatus);
         Item.SubItems.Add(eSoundStatus);
         Item.SubItems.Add(eColorStatus);
         Item.SubItems.Add(eMerged);
         Item.SubItems.Add(eName);
         Item.SubItems.Add(eClone);
         Item.SubItems.Add(eCategory);
         Item.SubItems.Add(eVersionAdded);
         Item.SubItems.Add(eDriver);
       end;
  end;
end;

procedure TFormMain.ListDataFind(Sender: TObject; Find: TItemFind;
  const FindString: String; const FindPosition: TPoint; FindData: Pointer;
  StartIndex: Integer; Direction: TSearchDirection; Wrap: Boolean;
  var Index: Integer);
var
  bFirstPass: Boolean;
  nMaxLen, nLoop: Integer;
begin
  // NOTE: only parameters used for strings are: FindString, StartIndex and Wrap

  // default no item found
  Index:= -1;

  // this is the first pass (for wrap-around searches)
  bFirstPass:= True;

  // API BUG?: typing in listview window only generates an ifExactString so I always do a partial
  repeat
    // partial string search - just compare upto x characters
{//APIBUG    if (Find=ifPartialString) then begin//APIBUG}
      // avoid repeated calls to Length() : get number of characters to match to ONCE
      nMaxLen:= Length(FindString);

      for nLoop:=StartIndex to Length(GamesList)-1 do
      begin
        // ansi string compare x characters no case-senstivity!
        if AnsiStrLIComp(PChar(GamesList[nLoop].eDescription), PChar(FindString), nMaxLen) = 0 then
           begin
             Index:= nLoop;
             Break;
           end;
      end;
{//APIBUG
    // exact string search
    end else if (Find=ifExactString) then begin
      for nLoop:=StartIndex to Length(aEntries)-1 do begin
        if AnsiStrIComp(PChar(aEntries[nLoop].Caption),PChar(FindString))=0 then begin
          Index:=nLoop;
          break;
        end;
      end;
    end;//APIBUG}

    // not found; first pass and wrap-around search - try again
    if (Index = -1) and (bFirstPass) and (Wrap) then
       begin
         bFirstPass:= False;
         StartIndex:= 0;
         // yes - found one
       end
    else
       begin
         Break;
       end;
  until (False);
end;

procedure TFormMain.ListCustomDrawItem(Sender: TCustomListView;
  Item: TListItem; State: TCustomDrawState; var DefaultDraw: Boolean);
begin
  if Item.Index > Length(GamesList) then
     List.Canvas.Font.Style:= List.Canvas.Font.Style - [fsStrikeOut]
  else
  if (GamesList[Item.Index].eDriverStatus = 'Preliminary') and (FormPreferences.ShowPreliminaryGamesDisabled.Checked) then
     begin
       List.Canvas.Font.Style:= List.Canvas.Font.Style + [fsStrikeOut];
       List.Canvas.Font.Color:= clGrayText;
     end
  else
     List.Canvas.Font.Style:= List.Canvas.Font.Style - [fsStrikeOut];
end;

procedure TFormMain.ctrlrDefaultClick(Sender: TObject);
begin
  ButtonControllerKeysMapping.Hint:= TMenuItem(Sender).Caption;
end;

procedure TFormMain.MenuExportGamesListTextFileClick(Sender: TObject);
var
  ExportGames: THashedStringList;
  Loop: Integer;

begin
  if Length(GamesList) = 0 then
     Exit;
  ExportGames:= THashedStringList.Create;
  ExportGames.BeginUpdate;
  for Loop:=0 to Length(GamesList)-1 do
  begin
    ExportGames.Add(Format('%s [%s]', [GamesList[Loop].eDescription, GamesList[Loop].eName]));
  end;
  ExportGames.Sort;
  ExportGames.EndUpdate;
  if ExportGames.Count > 0 then
     begin
       GamesListSaveDialog.FilterIndex:= 3;
       if GamesListSaveDialog.Execute then
          begin
            if LowerCase(ExtractFileExt(GamesListSaveDialog.FileName)) <> '.txt' then
               GamesListSaveDialog.FileName:= GamesListSaveDialog.FileName+'.txt';
            ExportGames.SaveToFile(GamesListSaveDialog.FileName);
          end;
       GamesListSaveDialog.FilterIndex:= 1;
     end;
  FreeAndNil(ExportGames);
end;

procedure TFormMain.PopupAllGamesClick(Sender: TObject);
begin
  SetGameType(TMenuItem(Sender).Tag);
end;

procedure TFormMain.PopupClassicClick(Sender: TObject);
begin
  SetGameType(TMenuItem(Sender).Tag);
end;

procedure TFormMain.PopupNeoGeoClick(Sender: TObject);
begin
  SetGameType(TMenuItem(Sender).Tag);
end;

procedure TFormMain.PopupOriginalClick(Sender: TObject);
begin
  SetGameType(TMenuItem(Sender).Tag);
end;

procedure TFormMain.PopupCloneClick(Sender: TObject);
begin
  SetGameType(TMenuItem(Sender).Tag);
end;

procedure TFormMain.PopupRasterClick(Sender: TObject);
begin
  SetGameType(TMenuItem(Sender).Tag);
end;

procedure TFormMain.PopupVectorClick(Sender: TObject);
begin
  SetGameType(TMenuItem(Sender).Tag);
end;

procedure TFormMain.PopupCustomGamesClick(Sender: TObject);
begin
  SetGameType(TMenuItem(Sender).Tag);
end;

procedure TFormMain.MenuCheckMissingIconsClick(Sender: TObject);
var
  Loop: Integer;
  Folder, IconName, VerifyGameMsg: String;
  CheckCloneGames, SearchIcon, IsCloneGame, UseZIPFile: Boolean;
  NoIconsList: THashedStringList;
  MissingGamesCount: Integer;
begin
  if GenerateMessage(GetLanguageText('Messages', 'SearchCloneIconsTitle', 'Search Clone Icons'),
                     GetLanguageText('Messages', 'SearchCloneIconsMsg', 'Search missing icons for clone games ?'), 1) = mrYes then
     CheckCloneGames:= True
  else
     CheckCloneGames:= False;

  Screen.Cursor:= crHourGlass;
  GetMAMEExtendedPaths;
  Folder:= iconDir+'\';
  MissingGamesCount:= 0;
  UseZIPFile:= FileExists(Folder+'icons.zip');

  if UseZIPFile then
     begin
       ListROMsName:= THashedStringList.Create;
       ListROMsSize:= THashedStringList.Create;
       ListROMsCRC:=  THashedStringList.Create;
       GetContents(Folder+'icons.zip', True, False);
     end;

  NoIconsList:= THashedStringList.Create;

  for Loop:=0 to Length(GamesList)-1 do
  begin
    if (GamesList[Loop].eClone <> '') and (GamesList[Loop].eName <> GamesList[Loop].eClone) then
       begin
         SearchIcon:= CheckCloneGames;
         IsCloneGame:= True;
       end
    else
       begin
         SearchIcon:= True;
         IsCloneGame:= False;
       end;

    if (SearchIcon) and  (GamesList[Loop].eROMIdentification in [0..5, 12..13, 16]) then
       begin
         IconName:= GamesList[Loop].eName;
         if not FileExists(Folder+IconName+'.ico') then
            begin
              case UseZIPFile of
                True:
                  begin
                    if ListROMsName.IndexOf(IconName+'.ico') = -1 then
                       begin
                         // Icon Not Found anywhere, will add game to the list
                         Inc(MissingGamesCount);
                         case IsCloneGame of
                           True:
                             begin
                               NoIconsList.Add('<tr>');
                               NoIconsList.Add('<td nowrap>'+GamesList[Loop].eDescription+' ['+GamesList[Loop].eName+']</td>');
                               if CheckCloneGames then
                                  begin
                                    if (GamesList[Loop].eClone <> '') and (GamesList[Loop].eName <> GamesList[Loop].eClone) then
                                       NoIconsList.Add('<td nowrap>'+GamesList[Loop].eClone+'</td>')
                                    else
                                       NoIconsList.Add('<td nowrap><BR></td>');
                                  end;
                               NoIconsList.Add('</tr>');
                             end;
                           False:
                             begin
                               NoIconsList.Add('<tr>');
                               NoIconsList.Add('<td nowrap>'+GamesList[Loop].eDescription+' ['+GamesList[Loop].eName+']</td>');
                               if CheckCloneGames then
                                  NoIconsList.Add('<td nowrap><BR></td>');
                               NoIconsList.Add('</tr>');
                             end;
                         end;
                       end;
                  end;
                False:
                  begin
                    // Picture Not Found anywhere, will add game to the list
                    Inc(MissingGamesCount);

                    NoIconsList.Add('<tr>');
                    NoIconsList.Add('<td nowrap>'+GamesList[Loop].eDescription+' ['+GamesList[Loop].eName+']</td>');
                    if CheckCloneGames then
                       begin
                         case IsCloneGame of
                           True:
                             begin
                               if (GamesList[Loop].eClone <> '') and (GamesList[Loop].eName <> GamesList[Loop].eClone) then
                                  NoIconsList.Add('<td nowrap>'+GamesList[Loop].eClone+'</td>')
                               else
                                  NoIconsList.Add('<td nowrap><BR></td>');
                             end;
                           False: NoIconsList.Add('<td nowrap><BR></td>');
                         end;
                       end;
                    NoIconsList.Add('</tr>');
                  end;
              end;
            end;
       end;
  end;

  if UseZIPFile then
     begin
       FreeAndNil(ListROMsName);
       FreeAndNil(ListROMsSize);
       FreeAndNil(ListROMsCRC);
     end;

  Screen.Cursor:= crDefault;
  if NoIconsList.Count > 0 then
     begin
       NoIconsList.Insert(0, '<p align="center"><font face="Tahoma" color="#FF0000" size="3"><b>Missing Real Icons</b></font></p>');
       NoIconsList.Insert(1, '<table border="1" cellspacing="0" width="100%">');
       NoIconsList.Insert(2, '<tr>');
       NoIconsList.Insert(3, '<td nowrap BGCOLOR="#D4D0C8"><B>Description [Game Name]</B></td>');
       if CheckCloneGames then
          NoIconsList.Insert(4, '<td nowrap BGCOLOR="#D4D0C8"><B>Clone of</B></td>');
       NoIconsList.Insert(5, '</tr>');
       NoIconsList.Add('</table><p>');
       NoIconsList.Add('<p><font face="Tahoma" size="2"><b>Total Games: '+IntToStr(MissingGamesCount)+'<br></b><font color="#008000">Generated by Emu Loader v'+FrontendVersion+'<br>Date: '+DateToStr(Date)+' - Time: '+TimeToStr(Time)+'</font></font></p>');

       if GamesListSaveDialog.Execute then
          NoIconsList.SaveToFile(GamesListSaveDialog.Filename);

       FreeAndNil(NoIconsList);
     end;
end;

procedure TFormMain.MenuCheckUnneededIconsClick(Sender: TObject);
var
  UnneededIconsList, GamesListDAT: THashedStringList;
  Loop, FileIndex, UnnededIconsCount: Integer;
  Folder, VerifyFileMsg: String;
begin
  GetMAMEExtendedPaths;
  Folder:= iconDir+'\';
  case FileExists(Folder+'icons.zip') of
    True:
      begin
        Screen.Cursor:= crHourGlass;
        GamesListDAT:= THashedStringList.Create;
        GetGamesList(GamesListDAT, True, True);
        GamesListDAT.BeginUpdate;

        for Loop:=0 to GamesListDAT.Count-1 do
        begin
          GetROMFields(GamesListDAT[Loop]);
          GamesListDAT[Loop]:= LowerCase(mName)+'.ico';
        end;
        GamesListDAT.Sort;
        GamesListDAT.EndUpdate;

        UnnededIconsCount:= 0;
        UnneededIconsList:= THashedStringList.Create;
        UnneededIconsList.BeginUpdate;

        ListROMsName:= THashedStringList.Create;
        ListROMsSize:= THashedStringList.Create;
        ListROMsCRC:=  THashedStringList.Create;
        GetContents(Folder+'icons.zip', True, False);
        UnneededIconsList.BeginUpdate;
        for Loop:=0 to ListROMsName.Count -1 do
        begin
          FileIndex:= GamesListDAT.IndexOf(LowerCase(ListROMsName[Loop]));
          if FileIndex = -1 then
             begin
               // file not found in games list, will add to the unneeded files list
               Inc(UnnededIconsCount);
               UnneededIconsList.Add('<tr>');
               UnneededIconsList.Add('<td nowrap>'+ListROMsName[Loop]+'</td>');
               UnneededIconsList.Add('<td nowrap>'+Folder+ListROMsName[Loop]+'</td>');
               UnneededIconsList.Add('</tr>');
             end;
        end;
        UnneededIconsList.EndUpdate;
        Screen.Cursor:= crDefault;
        if UnneededIconsList.Count > 0 then
           begin
             UnneededIconsList.Insert(0, '<p align="center"><font face="Tahoma" color="#FF0000" size="3"><b>Unneeded Real Icon Files</b></font></p>');
             UnneededIconsList.Insert(1, '<table border="1" cellspacing="0" width="100%">');
             UnneededIconsList.Insert(2, '<tr>');
             UnneededIconsList.Insert(3, '<td nowrap BGCOLOR="#D4D0C8"><B>File Name</B></td>');
             UnneededIconsList.Insert(4, '<td nowrap BGCOLOR="#D4D0C8"><B>File Path</B></td>');
             UnneededIconsList.Insert(5, '</tr>');
             UnneededIconsList.Add('</table><p>');
             UnneededIconsList.Add('<p><font face="Tahoma" size="2"><b>Search Path: '+Folder+'<br>');
             UnneededIconsList.Add('Total Files: '+IntToStr(UnnededIconsCount)+'<br></b><font color="#008000">Generated by Emu Loader v'+FrontendVersion+'<br>Date: '+DateToStr(Date)+' - Time: '+TimeToStr(Time)+'</font></p>');

             if GamesListSaveDialog.Execute then
                UnneededIconsList.SaveToFile(GamesListSaveDialog.Filename);

             FreeAndNil(UnneededIconsList);
             FreeAndNil(ListROMsName);
             FreeAndNil(ListROMsSize);
             FreeAndNil(ListROMsCRC);
           end;
      end;
    False:
      begin
        GenerateMessage(GetLanguageText('Messages', 'FileNotFoundTitle', 'File Not Found'),
                        GetLanguageText('Messages', 'NoIconsZipFileFound', 'File "icons.zip" not found! Please, verify the "Icons" path in "MAME Extended Options" screen and try again...'), 2);
      end;
  end;
end;

procedure TFormMain.MenuSetCustomCommandLineClick(Sender: TObject);
begin
  if not Assigned(FormCustomCommandLine) then
     FormCustomCommandLine:= TFormCustomCommandLine.Create(Self);
  FormCustomCommandLine.GameName:= GamesList[SelectedGame].eName;
  FormCustomCommandLine.GameIcon.Tag:= 0;
  FormCustomCommandLine.ShowModal;
  FreeAndNil(FormCustomCommandLine);
  SetCurrentDir(FrontendPath);
end;

procedure TFormMain.MenuDeleteCustomCommandLineClick(Sender: TObject);
begin
  if GenerateMessage(GetLanguageText('Messages', 'CustomCommandLineDeleteTitle', 'Delete Custom Command Line File'),
                     Format(GetLanguageText('Messages', 'CustomCommandLineDeleteMsg', 'Delete custom command line file "%s". Are you sure ?'),
                            [FrontendPath+'resources\customcmd\'+GamesList[SelectedGame].eName+'.ini']), 1) = mrYes then
     begin
       DeleteMAMECustomCommandLine(GamesList[SelectedGame].eName, 0);
     end;
end;

procedure TFormMain.MenuSetDriverCustomCommandLineClick(Sender: TObject);
begin
  if not Assigned(FormCustomCommandLine) then
     FormCustomCommandLine:= TFormCustomCommandLine.Create(Self);
  FormCustomCommandLine.GameName:= GamesList[SelectedGame].eDriver;
  Delete(FormCustomCommandLine.GameName, Length(FormCustomCommandLine.GameName)-1, 2);
  FormCustomCommandLine.GameIcon.Tag:= 1;
  FormCustomCommandLine.ShowModal;
  FreeAndNil(FormCustomCommandLine);
  SetCurrentDir(FrontendPath);
end;

procedure TFormMain.MenuDeleteDriverCustomCommandLineClick(
  Sender: TObject);
var
  GameName: String[12];
begin
  GameName:= GamesList[SelectedGame].eDriver;
  Delete(GameName, Length(GameName)-1, 2);
  if GenerateMessage(GetLanguageText('Messages', 'CustomCommandLineDeleteTitle', 'Delete Custom Command Line File'),
                     Format(GetLanguageText('Messages', 'CustomCommandLineDeleteMsg', 'Delete custom command line file "%s". Are you sure ?'),
                            [FrontendPath+'resources\drvcustomcmd\'+GameName+'.ini']), 1) = mrYes then
     begin
       DeleteMAMECustomCommandLine(GameName, 1);
     end;
end;

procedure TFormMain.ButViewPreviousPictureClick(Sender: TObject);
begin
  ButtonViewPicture(0);
end;

procedure TFormMain.ButViewNextPictureClick(Sender: TObject);
begin
  ButtonViewPicture(1);
end;

procedure TFormMain.MenuCreatePicturesListClick(Sender: TObject);
var
  PictureFiles, GamesListDAT, IniFilePictures: THashedStringList;
  Folder: String;
  Loop, PicturesCount: Integer;
  Loop2: ShortInt;
  UseZIPFile, AddHeader: Boolean;

  function MountPictureName(const PictureName: String; PictureNum: ShortInt): String;
  begin
    case FormPreferences.NewPictureNameFormat.Checked of
      True : Result:= PictureName+Format('%.4u', [PictureNum]);
      False: Result:= SetPictureFileName(PictureName)+Format('%.4u', [PictureNum]);
    end;
  end;

  function DetectZIPFile(const ZIPFileName: String; PictureType: ShortInt): Boolean;
  begin
    PictureZIP:= '';
    case PictureType of
      0: // Title Snapshots
        begin
          Result:= True;
          case FileExists(Folder+'title.zip') of
            True: PictureZIP:= 'title.zip';
            False:
              begin
                 Result:= FileExists(Folder+'titles.zip');
                 if Result then
                    PictureZIP:= 'titles.zip';
              end;
          end;
        end;
      1: // In-Game Snapshots
        begin
          Result:= True;
          case FileExists(Folder+'ingame.zip') of
            True: PictureZIP:= 'ingame.zip';
            False:
              begin
                 Result:= FileExists(Folder+'snap.zip');
                 if Result then
                    PictureZIP:= 'snap.zip';
              end;
          end;
        end;
      2..6: // Marquees, Flyers, Cabinets, Control Panels, Control Panel Layouts
        begin
          Result:= FileExists(Folder+ZIPFileName);
          if Result then
             PictureZIP:= ZIPFileName;
        end;
    end;
  end;

  function SearchPictureFile(const GameName: String): Boolean;
  begin
    if PictureFiles.IndexOf(LowerCase(GameName+'.png')) <> -1 then
       Result:= True
    else
    if PictureFiles.IndexOf(LowerCase(GameName+'.jpg')) <> -1 then
       Result:= True
    else
    if PictureFiles.IndexOf(LowerCase(GameName+'.gif')) <> -1 then
       Result:= True
    else
       begin
         case UseZIPFile of
           True:
             begin
               if ListROMsName.IndexOf(LowerCase(GameName+'.png')) <> -1 then
                  Result:= True
               else
               if ListROMsName.IndexOf(LowerCase(GameName+'.jpg')) <> -1 then
                  Result:= True
               else
               if ListROMsName.IndexOf(LowerCase(GameName+'.gif')) <> -1 then
                  Result:= True
               else
                  Result:= False;
             end;
           False: Result:= False;
         end;
       end;
  end;

  procedure CreatePicturesList(const SectionTitle: String);
  var
    Loop: Integer;
    Loop2: ShortInt;
  begin
    // Get unzipped files
    PictureFiles:= THashedStringList.Create;
    GetFilesList(Folder, '.png', PictureFiles, False, True);
    GetFilesList(Folder, '.jpg', PictureFiles, False, False);
    GetFilesList(Folder, '.gif', PictureFiles, False, False);

    if UseZIPFile then
       begin
         ListROMsName:= THashedStringList.Create;
         ListROMsSize:= THashedStringList.Create;
         ListROMsCRC:=  THashedStringList.Create;
         GetContents(Folder+PictureZIP, True, False);
         UseZIPFile:= ListROMsName.Count > 0;
         if not UseZIPFile then
            begin
              FreeAndNil(ListROMsName);
              FreeAndNil(ListROMsSize);
              FreeAndNil(ListROMsCRC);
            end;
       end;

    // Scan unzipped files
    if GamesListDAT.Count > 0 then
       begin
         AddHeader:= True;
         for Loop:=0 to GamesListDAT.Count -1 do
         begin
           // Search main picture (gamename.ext)
           PicturesCount:= 0;
           if SearchPictureFile(GamesListDAT[Loop]) then
              begin
                Inc(PicturesCount);
                // Search for extra pictures (only if main picture is found!)
                for Loop2:=0 to 100 do
                begin
                  if SearchPictureFile(MountPictureName(GamesListDAT[Loop], Loop2)) then
                     Inc(PicturesCount);
                end;
              end;
           if PicturesCount > 0 then
              begin
                if AddHeader then
                   begin
                     if IniFilePictures.Count > 0 then
                        IniFilePictures.Add('');
                     IniFilePictures.Add(Format('[%s]', [SectionTitle]));
                     AddHeader:= False;
                   end;
                IniFilePictures.Add(Format('%s=%u', [LowerCase(GamesListDAT[Loop]), PicturesCount]));
              end;
         end;
       end;
    FreeAndNil(PictureFiles);
    if UseZIPFile then
       begin
         FreeAndNil(ListROMsName);
         FreeAndNil(ListROMsSize);
         FreeAndNil(ListROMsCRC);
       end;
  end;

begin
  Screen.Cursor:= crHourGlass;
  GamesListDAT:= THashedStringList.Create;
  GetGamesList(GamesListDAT, True, True);
  GamesListDAT.BeginUpdate;

  for Loop:=0 to GamesListDAT.Count-1 do
  begin
    GetROMFields(GamesListDAT[Loop]);
    GamesListDAT[Loop]:= LowerCase(mName);
  end;
  GamesListDAT.Sort;
  GamesListDAT.EndUpdate;

  IniFilePictures:= THashedStringList.Create;
  IniFilePictures.BeginUpdate;

  // Get Title Snapshots files
  Folder:= snaptitleDir+'\';
  UseZIPFile:= DetectZIPFile('', 0);
  CreatePicturesList('Title Snapshot');

  // Get In-Game Snapshots files
  if Pos(':\', snapingameDir) = 0 then
     SetCurrentDir(ExtractFilePath(GetCurrentEmulatorExecutable));
  Folder:= snapingameDir+'\';
  UseZIPFile:= DetectZIPFile('', 1);
  CreatePicturesList('In-Game Snapshot');
  SetCurrentDir(FrontendPath);

  // Get Marquees files
  Folder:= marqueeDir+'\';
  UseZIPFile:= DetectZIPFile('marquees.zip', 2);
  CreatePicturesList('Marquee');

  // Get Flyers files
  Folder:= flyerDir+'\';
  UseZIPFile:= DetectZIPFile('flyers.zip', 3);
  CreatePicturesList('Flyer');

  // Get Cabinets files
  Folder:= cabinetDir+'\';
  UseZIPFile:= DetectZIPFile('cabinets.zip', 4);
  CreatePicturesList('Cabinet');

  // Get Control Panels files
  Folder:= controlpanelDir+'\';
  UseZIPFile:= DetectZIPFile('cpanels.zip', 5);
  CreatePicturesList('Control Panel');

  // Get Control Panel Layouts files
  Folder:= controlpanellayoutDir+'\';
  UseZIPFile:= DetectZIPFile('cplayouts.zip', 6);
  CreatePicturesList('Control Panel Layout');

  if IniFilePictures.Count > 0 then
     begin
       if FileExists(FrontendPath+'resources\pictures.dat') then
          DeleteFile(FrontendPath+'resources\pictures.dat');
       IniFilePictures.SaveToFile(FrontendPath+'resources\pictures.dat');
       FormPreferences.PicturesVirtualList.OnClick(Self);
     end;
  FreeAndNil(IniFilePictures);
  Screen.Cursor:= crDefault;
end;

procedure TFormMain.MenuAddGameParentalLockClick(Sender: TObject);
var
  BlockedGames: THashedStringList;
  Loop, GameIndex: Integer;
  AddToList: Boolean;
  ROMDataLine: String;
begin
  if List.Selected = nil then
     Exit;
  Screen.Cursor:= crHourGlass;
  AddToList:= True;
  case FileExists(FrontendPath+'resources\BlockedGames.dat') of
    True:
      begin
        BlockedGames:= THashedStringList.Create;
        BlockedGames.LoadFromFile(FrontendPath+'resources\BlockedGames.dat');
        if BlockedGames.Count > 0 then
           begin
             for Loop:=0 to BlockedGames.Count -1 do
             begin
               if DecryptData(BlockedGames[Loop]) = GamesList[SelectedGame].eName then
                  begin
                    GenerateMessage(GetLanguageText('Messages', 'FavoriteGameNotAddedTitle', 'Game Not Added'),
                                    GetLanguageText('Messages', 'FavoriteGameNotAddedMsg', 'This game is already on the list!'), 2);
                    AddToList:= False;
                    Break;
                  end;
             end;
           end;
      end;
    False: AddToList:= False;
  end;
  if AddToList then
     begin
       BlockedGames.BeginUpdate;
       BlockedGames.Add(EncryptData(GamesList[SelectedGame].eName));
       BlockedGames.EndUpdate;
       BlockedGames.SaveToFile(FrontendPath+'resources\BlockedGames.dat');
       if MenuParentalLock.Checked then
          begin
            GameIndex:= SelectedGame;
            SetLockedGamesList(False);
            SetLockedGamesList(True);
            LoadROMClasses(False);
            SortColumn(ColumnSorted, True);
            if (GameIndex <= (Length(GamesList)-1)) then
               SelectItem(GameIndex)
            else
            if (GameIndex-1 <= (Length(GamesList)-1)) then
               SelectItem(GameIndex-1)
            else
               SelectItem(0);
          end;
     end;
  FreeAndNil(BlockedGames);
  Screen.Cursor:= crDefault;
end;

procedure TFormMain.MenuChangeGameDescriptionClick(Sender: TObject);
begin
  if not Assigned(FormCustomGameDescription) then
     FormCustomGameDescription:= TFormCustomGameDescription.Create(Self);
  FormCustomGameDescription.GameName:= GamesList[SelectedGame].eName;
  FormCustomGameDescription.ShowModal;
  FreeAndNil(FormCustomGameDescription);
  SetCurrentDir(FrontendPath);
end;

procedure TFormMain.MenuDeleteCustomDescriptionClick(Sender: TObject);
begin
  DeleteCustomGameDescription(GamesList[SelectedGame].eName);
end;

procedure TFormMain.MenuChangeGameCategoryClick(Sender: TObject);
begin
  if not Assigned(FormCustomGameCategory) then
     FormCustomGameCategory:= TFormCustomGameCategory.Create(Self);
  FormCustomGameCategory.GameName:= GamesList[SelectedGame].eName;
  FormCustomGameCategory.ShowModal;
  FreeAndNil(FormCustomGameCategory);
  SetCurrentDir(FrontendPath);
end;

procedure TFormMain.MenuDeleteCustomCategoryClick(Sender: TObject);
begin
  DeleteCustomGameCategory(GamesList[SelectedGame].eName);
end;

procedure TFormMain.MenuUpdateGamesDescriptionsClick(Sender: TObject);
var
  CustomDescriptionList, GamesListDAT: THashedStringList;
  Loop, Loop2: Integer;
  DATFile, ROMDataLine, GameString, DescriptionString: String;
  DATChanged, UpdateGames: Boolean;
begin
  if not FileExists(FrontendPath+'GameDescription.ini') then
     Exit;

  Screen.Cursor:= crHourGlass;
  UpdateGames:= False;
  CustomDescriptionList:= THashedStringList.Create;
  CustomDescriptionList.LoadFromFile(FrontendPath+'GameDescription.ini');
  UpdateGames:= False;
  for Loop:=0 to 13 do
  begin
    DATChanged:= False;
    case Loop of
       0: DATFile:= FrontendPath+'resources\ClassicMR.dat';
       1: DATFile:= FrontendPath+'resources\ClassicMV.dat';
       2: DATFile:= FrontendPath+'resources\ClassicCR.dat';
       3: DATFile:= FrontendPath+'resources\ClassicCV.dat';
       4: DATFile:= FrontendPath+'resources\NeoGeoM.dat';
       5: DATFile:= FrontendPath+'resources\NeoGeoC.dat';
       6: DATFile:= FrontendPath+'resources\UnClassicMR.dat';
       7: DATFile:= FrontendPath+'resources\UnClassicMV.dat';
       8: DATFile:= FrontendPath+'resources\UnClassicCR.dat';
       9: DATFile:= FrontendPath+'resources\UnClassicCV.dat';
      10: DATFile:= FrontendPath+'resources\UnNeoGeoM.dat';
      11: DATFile:= FrontendPath+'resources\UnNeoGeoC.dat';
      12: DATFile:= FrontendPath+'resources\BIOS.dat';
      13: DATFile:= FrontendPath+'resources\UnBIOS.dat';
    end;

    if (FileExists(DATFile)) and (GetFileSize(DATFile) > 0) then
       begin
         GamesListDAT:= THashedStringList.Create;
         GamesListDAT.LoadFromFile(DATFile);
         for Loop2:=0 to GamesListDAT.Count -1 do
         begin
           GameString:= GamesListDAT[Loop2];
           GetROMFields(GameString);
           DescriptionString:= '';
           DescriptionString:= CustomDescriptionList.Values[mName+'_custom'];
           if (DescriptionString <> mDescription) and (DescriptionString <> '') then
              begin
                ROMDataLine:= PopulateROMDataLine;
                GamesListDAT[Loop2]:= ROMDataLine;
                DATChanged:= True;
                UpdateGames:= True;
              end;
         end;
       end;
    if DATChanged then
       begin
         GamesListDAT.SaveToFile(DATFile);
         UpdateGames:= True;
       end;
    FreeAndNil(GamesListDAT);
  end;
  FreeAndNil(CustomDescriptionList);
  Screen.Cursor:= crDefault;
  if UpdateGames then
     SetGameType(ButtonGameType.Tag);
end;

procedure TFormMain.MenuUpdateGamesCategoriesClick(Sender: TObject);
var
  CustomCategoryList, DefaultCategoryList, GamesListDAT: THashedStringList;
  TempList: TMemIniFile;
  Loop, Loop2: Integer;
  DATFile, ROMDataLine, GameString, CategoryString: String;
  DATChanged, UpdateGames: Boolean;
begin
  if (not FileExists(FrontendPath+'GameCategory.ini')) and (not FileExists(FrontendPath+'catver.ini')) then
     Exit;

  Screen.Cursor:= crHourGlass;
  UpdateGames:= False;
  if FileExists(FrontendPath+'GameCategory.ini') then
     begin
       CustomCategoryList:= THashedStringList.Create;
       CustomCategoryList.LoadFromFile(FrontendPath+'GameCategory.ini');
     end;

  if FileExists(FrontendPath+'catver.ini') then
     begin
       DefaultCategoryList:= THashedStringList.Create;
       TempList:= TMemIniFile.Create(FrontendPath+'catver.ini');
       TempList.ReadSectionValues('Category', DefaultCategoryList);
       if DefaultCategoryList.Count = 0 then
          FreeAndNil(DefaultCategoryList);
       FreeAndNil(TempList);
     end;

  for Loop:=0 to 13 do
  begin
    DATChanged:= False;
    case Loop of
       0: DATFile:= FrontendPath+'resources\ClassicMR.dat';
       1: DATFile:= FrontendPath+'resources\ClassicMV.dat';
       2: DATFile:= FrontendPath+'resources\ClassicCR.dat';
       3: DATFile:= FrontendPath+'resources\ClassicCV.dat';
       4: DATFile:= FrontendPath+'resources\NeoGeoM.dat';
       5: DATFile:= FrontendPath+'resources\NeoGeoC.dat';
       6: DATFile:= FrontendPath+'resources\UnClassicMR.dat';
       7: DATFile:= FrontendPath+'resources\UnClassicMV.dat';
       8: DATFile:= FrontendPath+'resources\UnClassicCR.dat';
       9: DATFile:= FrontendPath+'resources\UnClassicCV.dat';
      10: DATFile:= FrontendPath+'resources\UnNeoGeoM.dat';
      11: DATFile:= FrontendPath+'resources\UnNeoGeoC.dat';
      12: DATFile:= FrontendPath+'resources\BIOS.dat';
      13: DATFile:= FrontendPath+'resources\UnBIOS.dat';
    end;

    if (FileExists(DATFile)) and (GetFileSize(DATFile) > 0) then
       begin
         GamesListDAT:= THashedStringList.Create;
         GamesListDAT.LoadFromFile(DATFile);
         for Loop2:=0 to GamesListDAT.Count -1 do
         begin
           GameString:= GamesListDAT[Loop2];
           GetROMFields(GameString);
           CategoryString:= '';
           case Assigned(CustomCategoryList) of
             True:
               begin
                 CategoryString:= CustomCategoryList.Values[mName];
                 if CategoryString = '' then
                    begin
                      if Assigned(DefaultCategoryList) then
                         CategoryString:= DefaultCategoryList.Values[mName];
                    end;
               end;
             False:
               begin
                 if Assigned(DefaultCategoryList) then
                    CategoryString:= DefaultCategoryList.Values[mName];
               end;
           end;
           if (CategoryString <> '') and (CategoryString <> mCategory) then
              begin
                mCategory:= CategoryString;
                ROMDataLine:= PopulateROMDataLine;
                GamesListDAT[Loop2]:= ROMDataLine;
                DATChanged:= True;
              end;
         end;
       end;
    if DATChanged then
       begin
         GamesListDAT.SaveToFile(DATFile);
         UpdateGames:= True;
       end;
    FreeAndNil(GamesListDAT);
  end;
  FreeAndNil(CustomCategoryList);
  FreeAndNil(DefaultCategoryList);
  Screen.Cursor:= crDefault;
  if UpdateGames then
     SetGameType(ButtonGameType.Tag);
end;

procedure TFormMain.ListColumnRightClick(Sender: TObject;
  Column: TListColumn; Point: TPoint);
begin
  // need to find a way to cancel the games popup menu from showing
  MenuGamesColumnsEditor.Click;
end;

procedure TFormMain.ZipForgeProcessFileFailure(Sender: TObject;
  FileName: String; Operation: TZFProcessOperation; NativeError,
  ErrorCode: Integer; ErrorMessage: String; var Action: TZFAction);
begin
  case Operation of
    poExtract:
      begin
        GenerateMessage(GetLanguageText('Messages', 'ErrorTitle', 'Error'),
                        Format(GetLanguageText('Messages', 'ExtractFailedMsg',
                               'An error has occurred while extracting from file "%s".'+#13#10+#13#10+'%s'), [FileName, ErrorMessage]), 2);
      end;
    poDelete:
      begin
        GenerateMessage(GetLanguageText('Messages', 'ErrorTitle', 'Error'),
                        Format(GetLanguageText('Messages', 'DeleteFailedMsg',
                               'An error has occurred while deleting from file "%s".'+#13#10+#13#10+'%s'), [FileName, ErrorMessage]), 2);
      end;
  end;
end;

procedure TFormMain.ZipForgeOverallProgress(Sender: TObject;
  Progress: Double; Operation: TZFProcessOperation;
  ProgressPhase: TZFProgressPhase; var Cancel: Boolean);
begin
  if Operation = poExtract then
     begin
       if FormStatus.Visible then
          begin
            FormStatus.LabelProgress.Caption:= IntToStr(Trunc(Progress))+'%';
            Application.ProcessMessages;
          end;
     end;
  GetFileSize('teste');
end;

end.


