unit uMAMu_IconsManager;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, unitExIcon,
  StdCtrls, ImgList, ExtCtrls, MPCommonObjects, MPCommonUtilities,
  EasyListview, Menus, BarMenus, IniFiles, ShellAPI, Buttons,
  ComCtrls, ToolWin, SplitterEx, PanelEx;

type
  TMissingIconInfo = class(TEasyItemStored)
  private
    fImageIndex: Integer;
    fIconLoaded: Boolean;
    fROMIdentification: Integer;
    fSystemID: Integer;
    fSystemType: ShortInt;
    fTitle: WideString;
    fManufacturer: String;
    fName: String;
    fClone: String;
    fCloneParent: String;
    fDriverName: String;
    fBiosName: String;
    fSoftwareName: String;
    fDriverStatus: ShortInt;
    fVersionAdded: String;
    fMechanical: Boolean;
    fGameStatus: ShortInt; // 0 - have or miss; 1 - missing ROMs/CHDs
    fIsIconZZZ: Boolean;
    //fIconZZZFileName: String;
  protected
    function GetCaptions(Column: Integer): WideString; override;
    function GetImageIndexes(Column: Integer): TCommonImageIndexInteger; override;
    function GetStateImageIndexes(Column: Integer): TCommonImageIndexInteger; override;
  public
    property eImageIndex: Integer read fImageIndex write fImageIndex;
    property eIconLoaded: Boolean read fIconLoaded write fIconLoaded;
    property eROMIdentification: Integer read fROMIdentification write fROMIdentification;
    property eSystemID: Integer read fSystemID write fSystemID;
    property eSystemType: ShortInt read fSystemType write fSystemType;
    property eTitle: WideString read fTitle write fTitle;
    property eManufacturer: String read fManufacturer write fManufacturer;
    property eName: String read fName write fName;
    property eClone: String read fClone write fClone;
    property eCloneParent: String read fCloneParent write fCloneParent;
    property eDriverName: String read fDriverName write fDriverName;
    property eBiosName: String read fBiosName write fBiosName;
    property eSoftwareName: String read fSoftwareName write fSoftwareName; // softwarelist name "msx1_cart" (games from MSX1 cartridge software list); a800; vectrex; empty: is arcade game or MESS machine
    property eDriverStatus: ShortInt read fDriverStatus write fDriverStatus;
    property eVersionAdded: String read fVersionAdded write fVersionAdded;
    property eMechanical: Boolean read fMechanical write fMechanical;
    property eGameStatus: ShortInt read fGameStatus write fGameStatus;
    property eIsIconZZZ: Boolean read fIsIconZZZ write fIsIconZZZ;
    //property eIconZZZFileName: String read fIconZZZFileName write fIconZZZFileName;
  end;

  TNotUsedIconInfo = class(TEasyItemStored)
  private
    fImageIndex: Integer;
    fIconLoaded: Boolean;
    fSystemID: Integer;
    fFileName: String;
    fSize: Int64;
    fSizeText: String;
    fDateTime: Integer;
    fDateTimeText: String;
    fFullPath: String;
    fNameOriginal: String;
    fSaveHistory: Boolean;
    fHistory: TStringList;
  protected
    function GetCaptions(Column: Integer): WideString; override;
    function GetImageIndexes(Column: Integer): TCommonImageIndexInteger; override;
  public
    property eImageIndex: Integer read fImageIndex write fImageIndex;
    property eIconLoaded: Boolean read fIconLoaded write fIconLoaded;
    property eSystemID: Integer read fSystemID write fSystemID;
    property eFileName: String read fFileName write fFileName;
    property eSize: Int64 read fSize write fSize;
    property eSizeText: String read fSizeText write fSizeText;
    property eDateTime: Integer read fDateTime write fDateTime;
    property eDateTimeText: String read fDateTimeText write fDateTimeText;
    property eFullPath: String read fFullPath write fFullPath;
    property eNameOriginal: String read fNameOriginal write fNameOriginal;
    property eSaveHistory: Boolean read fSaveHistory write fSaveHistory;
    property eHistory: TStringList read fHistory write fHistory;
  end;
  
type
  TFormMAMu_IconsManager = class(TForm)
    IL_MissingIcons: TImageList;
    IL_NotUsedIcons: TImageList;
    PanelNotUsedIcons: TPanel;
    NotUsedIconsList: TEasyListview;
    PopupMissingIcons: TBcBarPopupMenu;
    PopupRunGame: TMenuItem;
    N1: TMenuItem;
    PopupClearGamesList: TMenuItem;
    PopupMissingRemoveSelected: TMenuItem;
    N2: TMenuItem;
    PopupCreateEditIcon: TMenuItem;
    PopupCreateBiosEditIcon: TMenuItem;
    PopupCreateDriverEditIcon: TMenuItem;
    N3: TMenuItem;
    PopupReloadIcons: TMenuItem;
    PopupReloadIconsSelectedGames: TMenuItem;
    PopupNotUsedIcons: TBcBarPopupMenu;
    PopupNotUsedClearFilesList: TMenuItem;
    PopupEditIcon: TMenuItem;
    MenuItem1: TMenuItem;
    PopupNotUsedRemoveSelected: TMenuItem;
    PopupMoveSelectedToFolder: TMenuItem;
    MenuItem3: TMenuItem;
    PopupAddSelectedToExcludeFilesList: TMenuItem;
    PopupViewExcludedList: TMenuItem;
    PopupReloadExcludedList: TMenuItem;
    PopupNotUsedRenameFile: TMenuItem;
    N4: TMenuItem;
    PopupNotUsedSaveIconsListToFile: TMenuItem;
    PopupNotUsedRemoveRenamedIcons: TMenuItem;
    BottomBar: TCoolBar;
    LabelTotalItemsMissing: TLabel;
    LabelTotalItemsNotUsed: TLabel;
    ButtonNotUsedDeleteFiles: TSpeedButton;
    PopupNotUsedClearFileHistory: TMenuItem;
    NotUsedIconHistory: TRichEdit;
    PopupNotUsedUpdateIconInfoSelectedIcons: TMenuItem;
    PopupNotUsedUpdateIconInfoAllIcons: TMenuItem;
    N7: TMenuItem;
    CoolBarNotUsedIconHistory: TCoolBar;
    LabelFileHistory: TLabel;
    ButtonClearHistoryNotUsed: TSpeedButton;
    N9: TMenuItem;
    PopupUpdateNotWorkingIconGames: TMenuItem;
    PopupUpdateNotWorkingIconGamesHelp: TMenuItem;
    PopupCopyIconZZZtoSelectedGames: TMenuItem;
    ToolBarMissingIcons: TToolBar;
    ButtonOptionsMissingGameIcons: TToolButton;
    PopupMissingIconsOptions: TBcBarPopupMenu;
    PopupSearchCloneIcons: TMenuItem;
    MenuItem12: TMenuItem;
    PopupShowGameBiosIcons: TMenuItem;
    PopupShowGameDriverIcons: TMenuItem;
    MenuItem17: TMenuItem;
    PopupMissingIconsViewMode: TMenuItem;
    PopupMissDetailsViewSmallIcons: TMenuItem;
    PopupMissDetailsViewLargeIcons: TMenuItem;
    PopupMissLargeIconsView: TMenuItem;
    MenuItem26: TMenuItem;
    PopupGamesViewMode: TMenuItem;
    PopupShowAllGames: TMenuItem;
    PopupShowParentGamesOnly: TMenuItem;
    PopupShowCloneGamesOnly: TMenuItem;
    PopupShowBiosOnly: TMenuItem;
    MenuItem32: TMenuItem;
    PopupShowAllDriverStatus: TMenuItem;
    PopupShowPreliminaryDriverStatus: TMenuItem;
    PopupSaveListToFile: TMenuItem;
    PopupRestoreColumnsSizes: TMenuItem;
    N5: TMenuItem;
    PopupMissSearchforGameTitle: TMenuItem;
    PopupMissSearchforManufacturer: TMenuItem;
    PopupMissSearchforTitleManufacturer: TMenuItem;
    PopupShowMechanicalOnly: TMenuItem;
    SplitterIconHistory: TSplitterEx;
    MissingIconsList: TEasyListview;
    SplitterList: TSplitterEx;
    PanelButtons: TPanelEx;
    PanelToolBarButtons: TPanelEx;
    SystemIcon: TImage;
    ButtonSystem: TBitBtn;
    ButtonScanBoth: TBitBtn;
    ButtonScanMissing: TBitBtn;
    ButtonScanNotUsed: TBitBtn;
    BitBtn3: TBitBtn;
    PopupShowDevicesOnly: TMenuItem;
    N6: TMenuItem;
    PopupNotUsedSortListbyFilenames: TMenuItem;
    PopupNotUsedSortListbyNewestDateTime: TMenuItem;
    PopupSearchIconsSoftwarelistGames: TMenuItem;
    PopupShowSoftwarelistGamesOnly: TMenuItem;
    PopupSearchIconsDeviceSets: TMenuItem;
    procedure FormShow(Sender: TObject);
    function MissingIconsListItemCompare(Sender: TCustomEasyListview;
      Column: TEasyColumn; Group: TEasyGroup; Item1, Item2: TEasyItem;
      var DoDefault: Boolean): Integer;
    procedure MissingIconsListItemPaintText(Sender: TCustomEasyListview;
      Item: TEasyItem; Position: Integer; ACanvas: TCanvas);
    procedure MissingIconsListColumnClick(Sender: TCustomEasyListview;
      Button: TCommonMouseButton; ShiftState: TShiftState;
      const Column: TEasyColumn);
    procedure MissingIconsListDblClick(Sender: TCustomEasyListview;
      Button: TCommonMouseButton; MousePos: TPoint;
      ShiftState: TShiftState; var Handled: Boolean);
    procedure MissingIconsListItemSelectionChanged(
      Sender: TCustomEasyListview; Item: TEasyItem);
    procedure PopupRunGameClick(Sender: TObject);
    procedure PopupClearGamesListClick(Sender: TObject);
    procedure PopupCreateEditIconClick(Sender: TObject);
    procedure PopupReloadIconsClick(Sender: TObject);
    procedure PopupReloadIconsSelectedGamesClick(Sender: TObject);
    procedure NotUsedIconsListItemPaintText(Sender: TCustomEasyListview;
      Item: TEasyItem; Position: Integer; ACanvas: TCanvas);
    procedure NotUsedIconsListItemSelectionChanged(
      Sender: TCustomEasyListview; Item: TEasyItem);
    procedure MissingIconsListKeyAction(Sender: TCustomEasyListview;
      var CharCode: Word; var Shift: TShiftState; var DoDefault: Boolean);
    procedure NotUsedIconsListKeyAction(Sender: TCustomEasyListview;
      var CharCode: Word; var Shift: TShiftState; var DoDefault: Boolean);
    procedure PopupNotUsedClearFilesListClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure PopupEditIconClick(Sender: TObject);
    procedure PopupNotUsedRemoveSelectedClick(Sender: TObject);
    procedure PopupMissingRemoveSelectedClick(Sender: TObject);
    procedure PopupMoveSelectedToFolderClick(Sender: TObject);
    procedure PopupAddSelectedToExcludeFilesListClick(Sender: TObject);
    procedure PopupViewExcludedListClick(Sender: TObject);
    procedure PopupReloadExcludedListClick(Sender: TObject);
    procedure PopupNotUsedRenameFileClick(Sender: TObject);
    procedure PopupNotUsedSaveIconsListToFileClick(Sender: TObject);
    procedure PopupNotUsedRemoveRenamedIconsClick(Sender: TObject);
    procedure FormCanResize(Sender: TObject; var NewWidth,
      NewHeight: Integer; var Resize: Boolean);
    procedure ButtonCloseClick(Sender: TObject);
    procedure ButtonNotUsedDeleteFilesClick(Sender: TObject);
    procedure NotUsedIconsListItemFreeing(Sender: TCustomEasyListview;
      Item: TEasyItem);
    procedure PopupNotUsedClearFileHistoryClick(Sender: TObject);
    procedure ButtonClearHistoryNotUsedClick(Sender: TObject);
    procedure PopupNotUsedUpdateIconInfoSelectedIconsClick(Sender: TObject);
    procedure SplitterListMoved(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure MissingIconsListColumnSizeChanged(
      Sender: TCustomEasyListview; Column: TEasyColumn);
    procedure PopupMissingIconsMeasureMenuItem(Sender: TObject;
      AMenuItem: TMenuItem; ACanvas: TCanvas; var Width, Height: Integer;
      ABarVisible: Boolean; var DefaultMeasure: Boolean);
    procedure PopupUpdateNotWorkingIconGamesHelpClick(Sender: TObject);
    procedure PopupCopyIconZZZtoSelectedGamesClick(Sender: TObject);
    procedure PopupMissDetailsViewSmallIconsClick(Sender: TObject);
    procedure PopupShowAllGamesClick(Sender: TObject);
    procedure PopupSaveListToFileClick(Sender: TObject);
    procedure PopupRestoreColumnsSizesClick(Sender: TObject);
    procedure PopupMissingIconsPopup(Sender: TObject);
    procedure PopupMissSearchforGameTitleClick(Sender: TObject);
    procedure ButtonSystemClick(Sender: TObject);
    procedure ButtonScanBothClick(Sender: TObject);
    procedure ButtonScanMissingClick(Sender: TObject);
    procedure ButtonScanNotUsedClick(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure MissingIconsListColumnSizeChanging(
      Sender: TCustomEasyListview; Column: TEasyColumn; Width,
      NewWidth: Integer; var Allow: Boolean);
    function NotUsedIconsListItemCompare(Sender: TCustomEasyListview;
      Column: TEasyColumn; Group: TEasyGroup; Item1, Item2: TEasyItem;
      var DoDefault: Boolean): Integer;
    procedure PopupNotUsedSortListbyFilenamesClick(Sender: TObject);
  private
    { Private declarations }
    IconHistoryFolder: String;
    SelectedItemMissing, SelectedItemNotUsed: TEasyItem;

    ExcludeFiles: THashedStringList; // Not Used Icons
    ExcludeFileStr: String; // Not Used Icons

    function  IsFolderEmpty: Boolean;
    procedure ReadIniFile;
    procedure WriteIniFile;

    procedure AddFileHistory(ELV_Item: TEasyItem; TextString: String);

    function  ValidateMAMu_Folders: Boolean;

    procedure SetSelectedMissingGame(AutoSelect: Boolean = True);

    // missing icons functions
    procedure ApplyFilter;
    procedure UpdateTotalGamesLabelMissing;
    procedure ResetMissingIconsList;
    procedure ClearSelectedMissing;
    function  AddMAMu_MissingIcon(sysID: Integer; const GameName, CloneName, DriverName, BiosName, SoftwareName: String; IconList: TImageList): Integer;
    function  LoadGamesToMissingList(ShowFolderMessage: Boolean = True): Boolean;
    procedure GenerateNotWorkingIconsDeleteCopy(ActionIndex: Integer);
    function  SearchName(const GameName, SoftwareName: String): TEasyItem;

    // not used icons functions
    function  RenameIconFile(OldName, NewName, FilePath: String): Boolean;
    procedure ClearSelectedNotUsed;
    procedure UpdateTotalFilesLabelNotUsed;
    procedure ScanFiles(ShowFolderMessage: Boolean = True);
    function  LoadIconNotUsed(const IconName: String; UpdateIcon: Boolean = False; UpdateIndex: Integer = -1): Integer;
    procedure ResetNotUsedIconsList;
    procedure UpdateHistoryPanel(ELV_Item: TEasyItem);
    function  SaveHistoryToFile(ELV_Item: TEasyItem; OldIconName: String = ''): Boolean;

    procedure SelectSystem;
    procedure CreateEditIcon(const IconName, SoftwareName: String; sysID: Integer);
  public
    { Public declarations }
    SourceIconFile: String;
    ZZZIconList: THashedStringList;
    procedure DetectFileMD5;
  end;

var
  FormMAMu_IconsManager: TFormMAMu_IconsManager;

implementation

uses uMain, uStatus, uCommon, uMAMu_ExcludedList, uRenameIconFile,
  uDeleteMAMu_NotWorkingIcons;

{$R *.dfm}

function TMissingIconInfo.GetCaptions(Column: Integer): WideString;
begin
  case Column of
    0: Result:= eTitle;
    1: Result:= eName;
    2: Result:= eClone;
    3:
      begin
        case FormMain.ValidateBiosName(eBiosName, eName) of
          True : Result:= eBiosName;
          False: Result:= '';
        end;
      end;
    4: Result:= eDriverName;
    5: Result:= aStatus[eDriverStatus];
    6: Result:= eManufacturer;
    7: Result:= eVersionAdded;
    8:
      begin
        case eMechanical of
          True : Result:= 'Yes';
          False: Result:= '';
        end;
      end;
  end;
end;

function TMissingIconInfo.GetImageIndexes(Column: Integer): TCommonImageIndexInteger;
begin
  Result:= -1;
  if Column = 0 then
     begin
       if not eIconLoaded then
          begin
            eImageIndex:= FormMAMu_IconsManager.AddMAMu_MissingIcon(eSystemID, eName, eClone,
                                                eDriverName, eBiosName, eSoftwareName, FormMAMu_IconsManager.IL_MissingIcons);
            if eImageIndex = -1 then
               eImageIndex:= FormMain.GetMAMEImageIndex(eROMIdentification, eSoftwareName);
            eIconLoaded:= True;
          end;
       Result:= eImageIndex;
     end;
  {case Column of
    0:
      begin
        if not eIconLoaded then
           begin
             eImageIndex:= FormMAMu_IconsManager.AddMAMu_MissingIcon(eSystemID, eName, eClone,
                                                 eDriverName, eBiosName, eSoftwareName, FormMAMu_IconsManager.IL_MissingIcons);
             if eImageIndex = -1 then
                eImageIndex:= eROMIdentification;
             eIconLoaded:= True;
           end;
        Result:= eImageIndex;
      end;
  end;}
end;

function TMissingIconInfo.GetStateImageIndexes(Column: Integer): TCommonImageIndexInteger;
begin
  Result:= -1;
  if Column = 5 then
     Result:= eDriverStatus;
end;

function TNotUsedIconInfo.GetCaptions(Column: Integer): WideString;
begin
  case Column of
    0: Result:= eFileName;
    1: Result:= eSizeText+'   '+eDateTimeText;
    2: Result:= eFullPath;
  end;
end;

function TNotUsedIconInfo.GetImageIndexes(Column: Integer): TCommonImageIndexInteger;
begin
  case Column of
    0:
      begin
        case eIconLoaded of
          True : Result:= eImageIndex;
          False:
            begin
              eImageIndex:= FormMAMu_IconsManager.LoadIconNotUsed(IncludeTrailingPathDelimiter(eFullPath)+eFileName);
              eIconLoaded:= eImageIndex <> -1;
              Result:= eImageIndex;
            end;
        end;
      end;
  else
       Result:= -1;
  end;
end;

function TFormMAMu_IconsManager.IsFolderEmpty: Boolean;
var
  Search: TSearchRec;
begin
  Result:= FindFirst(FormMain.MAMu_Folder+'*.ico', $37, Search) = 0;
  FindClose(Search);
     
  if not Result then
     GenerateMessage('Warning', 'Folder is empty.',
                     '    No icons could be found in icons folder. MAMu_ icons manager only works with '+
                     'unzipped icons.'+#13#10+'    Please make sure the folder exists and there are .ico files '+
                     'in there.', 2);
end;

procedure TFormMAMu_IconsManager.ReadIniFile;
var
  INIFile: TMemIniFile;
  Loop: Integer;
begin
  try
    INIFile:= TMemIniFile.Create(FormMain.FrontendPath+'el_extras.ini');
    FormMAMu_IconsManager.Tag:= Ord(INIFile.ReadString('MAMu_IconsManager', 'WindowState', 'Normal') = 'Maximized');
    FormMAMu_IconsManager.Width:= INIFile.ReadInteger('MAMu_IconsManager', 'ScreenWidth', 1200);
    FormMAMu_IconsManager.Height:= INIFile.ReadInteger('MAMu_IconsManager', 'ScreenHeight', 600);
    FormMAMu_IconsManager.Left:= INIFile.ReadInteger('MAMu_IconsManager', 'ScreenLeft', (Screen.Width shr 1)-(Width shr 1)-1);
    FormMAMu_IconsManager.Top:= INIFile.ReadInteger('MAMu_IconsManager', 'ScreenTop', (Screen.Height shr 1)-(Height shr 1)-1);
    PanelNotUsedIcons.Width:= INIFile.ReadInteger('MAMu_IconsManager', 'MainSplitterPos', 350);
    NotUsedIconsList.Height:= INIFile.ReadInteger('MAMu_IconsManager', 'HistorySplitterPos', 370);
    PopupSearchCloneIcons.Checked:= Boolean(INIFile.ReadInteger('MAMu_IconsManager', 'SearchCloneGames', 0));
    PopupSearchIconsSoftwarelistGames.Checked:= Boolean(INIFile.ReadInteger('MAMu_IconsManager', 'SearchSoftlistGames', 0));

    if INIFile.ReadInteger('MAMu_IconsManager', 'NotUsedIconsSortByDateTime', 0) = 1 then
       PopupNotUsedSortListbyNewestDateTime.Checked:= True;

    for Loop:=0 to MissingIconsList.Header.Columns.Count-1 do
    begin
      if Loop < 8 then
         MissingIconsList.Header.Columns[Loop].Width:= INIFile.ReadInteger('MAMu_IconsManager', 'MissingListColWidth_'+IntToStr(Loop),
                                                                           MissingIconsList.Header.Columns[Loop].Width);
    end;
  finally
    FreeAndNil(INIFile);
  end;
end;

procedure TFormMAMu_IconsManager.WriteIniFile;
var
  INIFile: TMemIniFile;
  Loop: Integer;
begin
  try
    INIFile:= TMemIniFile.Create(FormMain.FrontendPath+'el_extras.ini');
    INIFile.EraseSection('MAMu_IconsManager');
    case FormMAMu_IconsManager.WindowState of
      wsNormal   : INIFile.WriteString('MAMu_IconsManager', 'WindowState', 'Normal');
      wsMaximized: INIFile.WriteString('MAMu_IconsManager', 'WindowState', 'Maximized');
      else
        INIFile.WriteString('MAMu_IconsManager', 'WindowState', 'Normal');
    end;
    if FormMAMu_IconsManager.WindowState <> wsMaximized then
       begin
         INIFile.WriteInteger('MAMu_IconsManager', 'ScreenTop', FormMAMu_IconsManager.Top);
         INIFile.WriteInteger('MAMu_IconsManager', 'ScreenLeft', FormMAMu_IconsManager.Left);
         INIFile.WriteInteger('MAMu_IconsManager', 'ScreenWidth', FormMAMu_IconsManager.Width);
         INIFile.WriteInteger('MAMu_IconsManager', 'ScreenHeight', FormMAMu_IconsManager.Height);
       end;
    INIFile.WriteInteger('MAMu_IconsManager', 'MainSplitterPos', PanelNotUsedIcons.Width);
    INIFile.WriteInteger('MAMu_IconsManager', 'HistorySplitterPos', NotUsedIconsList.Height);
    INIFile.WriteInteger('MAMu_IconsManager', 'SearchCloneGames', Ord(PopupSearchCloneIcons.Checked));
    INIFile.WriteInteger('MAMu_IconsManager', 'SearchSoftlistGames', Ord(PopupSearchIconsSoftwarelistGames.Checked));

    INIFile.WriteInteger('MAMu_IconsManager', 'NotUsedIconsSortByDateTime', Ord(PopupNotUsedSortListbyNewestDateTime.Checked));

    for Loop:=0 to MissingIconsList.Header.Columns.Count-1 do
    begin
      if Loop < 8 then
         INIFile.WriteInteger('MAMu_IconsManager', 'MissingListColWidth_'+IntToStr(Loop), MissingIconsList.Header.Columns[Loop].Width);
    end;
    INIFile.UpdateFile;
  finally
    FreeAndNil(INIFile);
  end;
end;

procedure TFormMAMu_IconsManager.AddFileHistory(ELV_Item: TEasyItem; TextString: String);
begin
  TNotUsedIconInfo(ELV_Item).eHistory.Add(Format('%s - %s', [FormMain.GetDateTimeStr(DateTimeToFileDate(Now)), TextString]));
  TNotUsedIconInfo(ELV_Item).eSaveHistory:= True;
end;

function TFormMAMu_IconsManager.ValidateMAMu_Folders: Boolean;
begin
  Result:= FormMain.CheckMAMu_Folder;
  if Result then
     Exit;

  if GenerateMessage('Error', FormMAMu_IconsManager.Caption,
                     'No folder is selected for MAMu_ icons. Would you like to select one now ?', 1) = mrYes then
     begin
       FormMain.PopupSetFoldersMAMu_.Click;
       Result:= FormMain.CheckMAMu_Folder;
     end;
  if Result then
     Result:= IsFolderEmpty;
end;

// missing icons functions
procedure TFormMAMu_IconsManager.SetSelectedMissingGame(AutoSelect: Boolean = True);
begin
  if SelectedItemMissing = nil then
     Exit;
  if not AutoSelect then
     begin
       TMissingIconInfo(SelectedItemMissing).Selected:= True;
       MissingIconsList.Selection.FocusedItem:= SelectedItemMissing;
       SelectedItemMissing.MakeVisible(emvMiddle) //(emvAuto);
     end;
  FormMain.ELV_SetSelectRibbon(TMissingIconInfo(SelectedItemMissing).eGameStatus, MissingIconsList);
end;

procedure TFormMAMu_IconsManager.UpdateTotalGamesLabelMissing;
begin
  LabelTotalItemsMissing.Caption:= IntToStr(MissingIconsList.Groups.VisibleItemCount);
  if not (PopupGamesViewMode.Tag in [4, 5]) then
     LabelTotalItemsMissing.Caption:= LabelTotalItemsMissing.Caption+' Missing Game Icons'
  else
     LabelTotalItemsMissing.Caption:= LabelTotalItemsMissing.Caption+' Games With "Not Working" Icons';
end;

procedure TFormMAMu_IconsManager.ResetMissingIconsList;
var
  Item: TEasyItem;
begin
  IL_MissingIcons.Clear;
  FormMain.AddGamesSystemsIcons(IL_MissingIcons);
  if not FormMain.CheckTotal(MissingIconsList) then
     Exit;
  MissingIconsList.BeginUpdate;
  Item:= MissingIconsList.Groups.FirstItem;
  repeat
    TMissingIconInfo(Item).eIconLoaded:= False;
    TMissingIconInfo(Item).eImageIndex:= TMissingIconInfo(Item).eROMIdentification;
    Item:= MissingIconsList.Groups.NextItem(Item);
  until Item = nil;
  MissingIconsList.EndUpdate;
end;

procedure TFormMAMu_IconsManager.ClearSelectedMissing;
begin
  MissingIconsList.Selection.ClearAll;
  SelectedItemMissing:= nil;
end;

function TFormMAMu_IconsManager.AddMAMu_MissingIcon(sysID: Integer; const GameName, CloneName, DriverName, BiosName, SoftwareName: String; IconList: TImageList): Integer;
var
  Icon32: TExIcon;
  FileFullPath: String;
  icoIndex: Integer;

  function AddIcon: Integer;
  var
    tmpIco: TIcon;
  begin
    Icon32.CurrentImage:= icoIndex;
    tmpIco:= TIcon.Create;
    tmpIco.Width:= 32;//Icon32.Images[icoLoop].Width;
    tmpIco.Height:= 32;//Icon32.Images[icoLoop].Width;
    tmpIco.Handle:= Icon32.Handle;
    Result:= IconList.AddIcon(tmpIco);
    FreeAndNil(tmpIco);
    FreeAndNil(Icon32);
  end;

  function LoadBiosIcon: Integer;
  begin
    Result:= -1;
    if BiosName <> '' then
       begin
         if FormMain.ScanFoldersIcon(BiosName, SoftwareName, sysID, FileFullPath, False) then
            begin
              if FormMain.LoadMAMu_Icon(FileFullPath, Icon32, icoIndex, False) then
                 Result:= AddIcon;
            end;
       end;
  end;

  function LoadDriverIcon: Integer;
  begin
    Result:= -1;
    if DriverName <> '' then
       begin
         if FormMain.ScanFoldersIcon(ChangeFileExt(DriverName, ''), SoftwareName, sysID, FileFullPath, False) then
            begin
              if FormMain.LoadMAMu_Icon(FileFullPath, Icon32, icoIndex, False) then
                 Result:= AddIcon;
            end;
       end;
  end;

begin
  Result:= -1;
  if PopupShowGameBiosIcons.Checked then
     Result:= LoadBiosIcon;

  if (Result = -1) and PopupShowGameDriverIcons.Checked then
     Result:= LoadDriverIcon;

  if Result = -1 then
     begin
       // load regular MAMu_ game icon
       if FormMain.ScanFoldersIcon(GameName, SoftwareName, sysID, FileFullPath, False) then
          begin
            if FormMain.LoadMAMu_Icon(FileFullPath, Icon32, icoIndex, False) then
               Result:= AddIcon;
          end;
     end;
end;

function TFormMAMu_IconsManager.LoadGamesToMissingList(ShowFolderMessage: Boolean = True): Boolean;
var
  FileFullPath: String;
  //IconFound: Boolean;
  Item, gItem: TEasyItem;
  gGroup: TEasyGroup;
  TotalGames, GamesCount, zzzIconIndex: Integer;

  function IsValidGame: Boolean;
  begin
    Result:= uMain.TEasyGameInfo(gItem).eSystemID = ButtonSystem.Tag;
    if Result then
       Result:= uMain.TEasyGameInfo(gItem).eSoftwareName = '';

    if Result then
       FormMain.FillTempGameInfo(gItem);
  end;

  function AddItem: Boolean;
  var
    addGameItem, iszzzIcon: Boolean;
    IconMD5: String;
  begin
    Result:= IsValidGame;
    if not Result then
       Exit;
    //Result:= FormMain.TempGameVars.eSystemID = ButtonSystem.Tag;
    //if not Result then
    //   Exit;
    //if FormMain.TempGameVars.eSoftwareName <> '' then
    //   Exit; // no software list games support!!!!

    //if not PopupSearchIconsSoftwarelistGames.Checked then
    //   Result:= FormMain.TempGameVars.eSoftwareName = '';

    if Result then
       begin
         if FormMain.IsROM_Device(FormMain.TempGameVars.eROMIdentification) then
            Result:= PopupSearchIconsDeviceSets.Checked;
       end;
       
    if Result then
       if FormMain.GameIsClone(FormMain.TempGameVars.eClone) then
          Result:= PopupSearchCloneIcons.Checked;

    addGameItem:= not Result;
    case Result of
      True:
        begin
          addGameItem:= FormMain.ScanFoldersIcon(FormMain.TempGameVars.eName, FormMain.TempGameVars.eSoftwareName, ButtonSystem.Tag, FileFullPath, False);
          //addGameItem:= not addGameItem; // not needed, just for testing
        end;
      False: Exit; // for clone games, "SearchCloneGames" is disabled... need to exit, nothing to add!!
    end;
    iszzzIcon:= False;

    case addGameItem of
      True:
        begin
          //if FormMain.TempGameVars.eDriverStatus = 2 then
          //   Exit; // do not add game since driver is preliminary. MAMu_ only wants games that are NOT preliminary driver status!

          addGameItem:= ZZZIconList.Count > 0;
          case addGameItem of
            True:
              begin
                IconMD5:= GetMD5_Value(FileFullPath);
                zzzIconIndex:= ZZZIconList.IndexOfName(IconMD5);
                addGameItem:= zzzIconIndex <> -1;
                if addGameItem then
                   iszzzIcon:= True;
              end;
            False: Exit; // might not be needed!!!!
          end;
        end;
      False:
        begin
          addGameItem:= True;
        end;
    end;

    if addGameItem then
       begin
         Item:= MissingIconsList.Items.AddCustom(TMissingIconInfo, nil);
         TMissingIconInfo(Item).eIconLoaded:= False;
         TMissingIconInfo(Item).eImageIndex:= FormMain.TempGameVars.eROMIdentification;
         TMissingIconInfo(Item).eROMIdentification:= FormMain.TempGameVars.eROMIdentification;
         TMissingIconInfo(Item).eSystemID:= FormMain.TempGameVars.eSystemID;
         TMissingIconInfo(Item).eSystemType:= FormMain.TempGameVars.eSystemType;
         TMissingIconInfo(Item).eTitle:= FormMain.TempGameVars.eTitle;
         TMissingIconInfo(Item).eManufacturer:= FormMain.TempGameVars.eManufacturer;
         TMissingIconInfo(Item).eName:= FormMain.TempGameVars.eName;
         TMissingIconInfo(Item).eClone:= FormMain.TempGameVars.eClone;
         case FormMain.GameIsClone(FormMain.TempGameVars.eClone) of
           True : TMissingIconInfo(Item).eCloneParent:= FormMain.TempGameVars.eClone;
           False: TMissingIconInfo(Item).eCloneParent:= FormMain.TempGameVars.eName;
         end;
         TMissingIconInfo(Item).eDriverName:= FormMain.TempGameVars.eDriverName;
         TMissingIconInfo(Item).eBiosName:= FormMain.TempGameVars.eBiosName;
         TMissingIconInfo(Item).eSoftwareName:= FormMain.TempGameVars.eSoftwareName;

         TMissingIconInfo(Item).eDriverStatus:= FormMain.TempGameVars.eDriverStatus;

         TMissingIconInfo(Item).eVersionAdded:= FormMain.TempGameVars.eVersionAdded;
         TMissingIconInfo(Item).eMechanical:= FormMain.TempGameVars.eMechanical;
         TMissingIconInfo(Item).eGameStatus:= FormMain.TempGameVars.eGameSetStatus;
         TMissingIconInfo(Item).eIsIconZZZ:= iszzzIcon;
         //Item.Details[1]:= 500;
       end;
    Application.ProcessMessages;
  end;

begin
  Result:= FormMain.CheckTotal(FormMain.GamesListView);
  if not Result then
     Exit;

  if ShowFolderMessage then
     begin
       if not ValidateMAMu_Folders then
          Exit;
       FormStatus.Show;
       FormStatus.StartThreadClock;
       FormStatus.TitleStr(FormMAMu_IconsManager.Caption);
     end;
  DetectFileMD5;
  FormStatus.MessageStr('Scanning for games with missing icons and validating '+
                        '"not working" icons.');
  IL_MissingIcons.Clear;
  FormMain.AddGamesSystemsIcons(IL_MissingIcons);
  FormMain.ClearListView(MissingIconsList);
  TotalGames:= FormMain.GamesListView.Groups.ItemCount;
  GamesCount:= 0;
  MissingIconsList.BeginUpdate;
  MissingIconsList.Items.ReIndexDisable:= True;
  if FormMain.IsGroupedView then
  begin
    gGroup:= FormMain.GamesListView.Groups.FirstGroup;
    repeat
      gItem:= FormMain.GamesListView.Groups.FirstInGroup(gGroup);
      repeat
        //FormMain.FillTempGameInfo(gItem);
        AddItem;
        gItem:= FormMain.GamesListView.Groups.NextInGroup(gGroup, gItem);
        Inc(GamesCount);
        FormStatus.UpdateProgressBar(GamesCount, TotalGames);
        Application.ProcessMessages;
      until gItem = nil;
      gGroup:= FormMain.GamesListView.Groups.NextGroup(gGroup);
    until gGroup = nil;
  end
  else
  begin
    gItem:= FormMain.GamesListView.Groups.FirstItem;
    repeat
      //FormMain.FillTempGameInfo(gItem);
      AddItem;
      gItem:= FormMain.GamesListView.Groups.NextItem(gItem);
      Inc(GamesCount);
      FormStatus.UpdateProgressBar(GamesCount, TotalGames);
      Application.ProcessMessages;
    until gItem = nil;
  end;
  MissingIconsList.Items.ReIndexDisable:= False;
  MissingIconsList.Sort.SortAll;
  MissingIconsList.EndUpdate;
  Result:= FormMain.CheckTotal(MissingIconsList);
  UpdateTotalGamesLabelMissing;
  FormStatus.SetProgressPos(0);
  FormStatus.MessageStr('Generating list of "not working" icons to delete.');
  GenerateNotWorkingIconsDeleteCopy(0);
  ApplyFilter;
  if ShowFolderMessage then
     begin
       FormStatus.Close;
       if not Result then
          GenerateMessage(FormMAMu_IconsManager.Caption, FormMain.GetEmulatorDescription(ButtonSystem.Tag),
                          '    Scan complete, but it seems that all games have icons. If you want to scan clone icons, '+
                          'make sure to select the "Search Clone Icons" check box.', 2);
     end;
end;

procedure TFormMAMu_IconsManager.GenerateNotWorkingIconsDeleteCopy(ActionIndex: Integer);
var
  Item: TEasyItem;
  FileStr, IconFolder: String;
  GameSelected, CloseFormStatus: Boolean;

  function SelectGameMissList: Boolean;
  var
    gamesItem: TEasyItem;
  begin
    Result:= False;
    gamesItem:= MissingIconsList.Groups.FirstItem;
    repeat
      IconFolder:= FormMain.GetMAMu_IconFolder(TMissingIconInfo(MissingIconsList.Selection.First).eSystemID, False,
                                               TMissingIconInfo(MissingIconsList.Selection.First).eSoftwareName);
      if (TMissingIconInfo(gamesItem).eName = TNotWorkingGameInfo(Item).eName) and
         (TMissingIconInfo(gamesItem).eSoftwareName = TNotWorkingGameInfo(Item).eSoftwareName) then
         begin
           Result:= True;
           TMissingIconInfo(gamesItem).eIsIconZZZ:= (ActionIndex in [1, 2]);
           TMissingIconInfo(gamesItem).eIconLoaded:= False;
           GameSelected:= True;
           gamesItem.Selected:= True;
         end;
      gamesItem:= MissingIconsList.Groups.NextItem(gamesItem);
    until GameSelected or (gamesItem = nil);
  end;

  procedure FreeDelForm;
  begin
    FreeAndNil(FormDeleteMAMu_NotWorkingIcons);
    MissingIconsList.SetFocus;
  end;

begin
  if not FormMain.CheckTotal(MissingIconsList) then
     Exit;
  if ActionIndex <> 0 then
     begin
       if not FormMain.CheckSelected(MissingIconsList) then
          Exit;
       IconFolder:= FormMain.GetMAMu_IconFolder(TMissingIconInfo(MissingIconsList.Selection.First).eSystemID, False,
                                                TMissingIconInfo(MissingIconsList.Selection.First).eSoftwareName);
       if not FileExists(FormMain.MAMu_Folder+'zzz.ico') then
          begin
            GenerateMessage('Error', 'File not found', '    File zzz.ico was not found. This file is required for this '+
                            'feature to work properly! Cannot proceed...', 2, False, 1);
            Exit;
          end;
     end;
  // Tag = 0 -> delete files
  // Tag = 1 -> copy files
  // Tag = 2 -> update files

  if not Assigned(FormDeleteMAMu_NotWorkingIcons) then
     FormDeleteMAMu_NotWorkingIcons:= TFormDeleteMAMu_NotWorkingIcons.Create(nil);
  FormDeleteMAMu_NotWorkingIcons.LabelHotkeys.Tag:= ActionIndex;
  FormDeleteMAMu_NotWorkingIcons.SetMode;
  if not FormMain.CheckTotal(FormDeleteMAMu_NotWorkingIcons.NotWorkingIcons) then
     begin
       FreeDelForm;
       Exit;
     end;

  FormDeleteMAMu_NotWorkingIcons.ShowModal;
  if FormDeleteMAMu_NotWorkingIcons.mmResult = mrCancel then
     begin
       FreeDelForm;
       Exit;
     end;
  if FormDeleteMAMu_NotWorkingIcons.NotWorkingIcons.CheckManager.Count = 0 then
     begin
       FreeDelForm;
       Exit;
     end;

  CloseFormStatus:= not FormStatus.Visible;
  if CloseFormStatus then
     begin
       FormStatus.Show;
       FormStatus.StartThreadClock;
     end;
  case ActionIndex of
    0: FormStatus.TitleStr('Delete "Not Working" Icons');
    1: FormStatus.TitleStr('Copy "zzz" Icon To Selected Games');
    2: FormStatus.TitleStr('Update "Not Working" Icons');
  end;
  FormStatus.MessageStr('Processing games.');
  ClearSelectedMissing;
  MissingIconsList.BeginUpdate;
  Item:= FormDeleteMAMu_NotWorkingIcons.NotWorkingIcons.Groups.FirstItem;
  repeat
    if Item.Checked then
       begin
         GameSelected:= False;
         // need to add SoftwareName here!!!!!!!!
         FileStr:= FormMain.GetMAMu_IconFolder(FormDeleteMAMu_NotWorkingIcons.Tag, False)+
                   TNotWorkingGameInfo(Item).eName+'.ico';
         case ActionIndex of
           0: // delete files
             begin
               if DeleteFile(FileStr) then
                  begin
                    SelectGameMissList;
                  end;
             end;
           1, 2: // copy / update "zzz" icon to games
             begin
               if CopyFile(PAnsiChar(IconFolder+FormMAMu_IconsManager.SourceIconFile), PAnsiChar(FileStr), False) then
                  SelectGameMissList;

               //if CopyFile(PAnsiChar(IconFolder+'zzz.ico'), PAnsiChar(FileStr), False) then
               //   begin
                    //Sleep(80);
               //     SelectGameMissList;
               //   end;
             end;
         end;
       end;
    Item:= FormDeleteMAMu_NotWorkingIcons.NotWorkingIcons.Groups.NextItem(Item);
    Application.ProcessMessages;
  until Item = nil;
  MissingIconsList.EndUpdate;
  FreeDelForm;
  ClearSelectedMissing;
  PopupReloadIconsSelectedGames.Click;
  if CloseFormStatus then
     FormStatus.Close;
end;

function TFormMAMu_IconsManager.SearchName(const GameName, SoftwareName: String): TEasyItem;
var
  Item: TEasyItem;
begin
  Result:= nil;
  if not FormMain.CheckTotal(MissingIconsList) then
     Exit;
  Item:= MissingIconsList.Groups.FirstItem;
  repeat
    if (TMissingIconInfo(Item).eName =  GameName) and (TMissingIconInfo(Item).eSoftwareName = SoftwareName) then
       Result:= Item;
    Item:= MissingIconsList.Groups.NextItem(Item);
  until (Item = nil) or (Result <> nil);
end;
// end of missing icons functions

// not used icons functions
function TFormMAMu_IconsManager.RenameIconFile(OldName, NewName, FilePath: String): Boolean;
begin
  CallMessageBox;
  FormMain.AddMsgText('    Rename file'+#13#10+'From ');
  FormMain.AddMsgText(FilePath+OldName, $00a65300, [fsBold]);
  FormMain.AddMsgText(#13#10+'To ');
  FormMain.AddMsgText(FilePath+NewName, $00a65300, [fsBold]);

  if FileExists(FilePath+NewName) then
     begin
       FormMain.AddMsgText(#13#10+#13#10+'    File ');
       FormMain.AddMsgText(FilePath+NewName, $00a65300, [fsBold]);
       FormMain.AddMsgText(' already exists. Both .ico and .txt history will be overwritten.');
     end;
  FormMain.AddMsgText(#13#10+#13#10+'Are you sure you want to continue ?');

  Result:= GenerateMessage('Rename File', 'A filename is about to be changed.', '', 1, False, 2) = mrYes;
  if not Result then
     Exit;

  Result:= RenameFile(FilePath+OldName, FilePath+NewName);
  Sleep(50);
  if not Result then
     GenerateMessage('Error', 'Failed to rename file.',
                     '    The file could not be renamed. Make sure the file is not being used by '+
                     'another application and is not locked by Windows.', 2, False, 1);
end;

procedure TFormMAMu_IconsManager.ClearSelectedNotUsed;
begin
  NotUsedIconsList.Selection.ClearAll;
  SelectedItemNotUsed:= nil;
end;

procedure TFormMAMu_IconsManager.UpdateTotalFilesLabelNotUsed;
begin
  LabelTotalItemsNotUsed.Caption:= ' '+IntToStr(NotUsedIconsList.Groups.ItemCount)+' Not Used Icons';
end;

procedure TFormMAMu_IconsManager.ScanFiles(ShowFolderMessage: Boolean = True); // function for not used icons!!!!!
var
  el_GamesList, tempList: THashedStringList;
  FileIndex: Integer;
  tmpString: String;
  gItem, addItem: TEasyItem;
  gGroup: TEasyGroup;
  Loop2: Integer;
  HistoryFileStr: String;

  function AddToHashedList(NameStr: String): Boolean;
  begin
    Result:= True;
    if NameStr <> '' then
       el_GamesList.Add(NameStr+'.ico');
  end;

begin
  if not FormMain.CheckTotal(FormMain.GamesListView) then
     Exit;
  if ShowFolderMessage then
     begin
       if not ValidateMAMu_Folders then
          Exit;
       FormStatus.Show;
       FormStatus.StartThreadClock;
       FormStatus.TitleStr(FormMAMu_IconsManager.Caption);
     end
  else
     FormStatus.BringToFront;
  FormStatus.MessageStr('Parsing games names.');
  el_GamesList:= THashedStringList.Create;
  el_GamesList.BeginUpdate;
  el_GamesList.Sorted:= True;
  el_GamesList.Duplicates:= dupIgnore;
  el_GamesList.BeginUpdate;

  if FormMain.IsGroupedView then
  begin
    gGroup:= FormMain.GamesListView.Groups.FirstGroup;
    repeat
      gItem:= FormMain.GamesListView.Groups.FirstInGroup(gGroup);
      repeat
        FormMain.FillTempGameInfo(gItem);
        if TEasyGameInfo(gItem).eSystemID = ButtonSystem.Tag then
           begin
             el_GamesList.Add(TEasyGameInfo(gItem).eName+'.ico');
             AddToHashedList(TEasyGameInfo(gItem).eBiosName);
             tmpString:= ChangeFileExt(TEasyGameInfo(gItem).eDriverName, '');
             AddToHashedList(tmpString);
           end;
        gItem:= FormMain.GamesListView.Groups.NextInGroup(gGroup, gItem);
      until gItem = nil;
      gGroup:= FormMain.GamesListView.Groups.NextGroup(gGroup);
    until gGroup = nil;
  end
  else
  begin
    gItem:= FormMain.GamesListView.Groups.FirstItem;
    repeat
      FormMain.FillTempGameInfo(gItem);
      if TEasyGameInfo(gItem).eSystemID = ButtonSystem.Tag then
         begin
           el_GamesList.Add(TEasyGameInfo(gItem).eName+'.ico');
           AddToHashedList(TEasyGameInfo(gItem).eBiosName);
           tmpString:= ChangeFileExt(TEasyGameInfo(gItem).eDriverName, '');
           AddToHashedList(tmpString);
         end;
      gItem:= FormMain.GamesListView.Groups.NextItem(gItem);
    until gItem = nil;
  end;

  el_GamesList.EndUpdate;
  el_GamesList.Sorted:= False;

  // scan icon files
  FormStatus.MessageStr('Building icons files list');
  tempList:= THashedStringList.Create;
  GetFilesList(FormMain.GetMAMu_IconFolder(ButtonSystem.Tag, False), '.ico', '*.ico', tempList, False, False, True);
  Loop2:= Ord(tempList.Count > 0);
  case Boolean(Loop2) of
    True:
      begin
        tempList.BeginUpdate;
        for Loop2:=tempList.Count-1 downto 0 do
        begin
          tmpString:= ExtractFileName(tempList[Loop2]);
          if ExcludeFiles.IndexOf(tmpString) = -1 then
             begin
               if tmpString = 'deviceset.ico' then
                  tempList.Delete(Loop2)
               else
               begin
                 FileIndex:= el_GamesList.IndexOf(tmpString);
                 if FileIndex <> -1 then
                    tempList.Delete(Loop2);
               end;
             end
          else
             tempList.Delete(Loop2);
          FormStatus.UpdateProgressBar(Loop2, tempList.Count-1);
          Application.ProcessMessages;
        end;
        tempList.EndUpdate;
        if tempList.Count > 0 then
           begin
             FormMain.ClearListView(NotUsedIconsList);
             NotUsedIconsList.BeginUpdate;
             NotUsedIconsList.Items.ReIndexDisable:= True;
             for Loop2:=0 to tempList.Count-1 do
             begin
               addItem:= NotUsedIconsList.Items.AddCustom(TNotUsedIconInfo, nil);
               TNotUsedIconInfo(addItem).eIconLoaded:= False;
               TNotUsedIconInfo(addItem).eSystemID:= ButtonSystem.Tag;
               TNotUsedIconInfo(addItem).eFileName:= ExtractFileName(tempList[Loop2]);
               TNotUsedIconInfo(addItem).eSize:= GetFileSize(tempList[Loop2]);
               TNotUsedIconInfo(addItem).eSizeText:= FormMain.GetSizeType(TNotUsedIconInfo(addItem).eSize, False);
               TNotUsedIconInfo(addItem).eDateTime:= FileAge(tempList[Loop2]);
               TNotUsedIconInfo(addItem).eDateTimeText:= FormMain.GetDateTimeStr(TNotUsedIconInfo(addItem).eDateTime);
               TNotUsedIconInfo(addItem).eFullPath:= ExtractFilePath(tempList[Loop2]);
               TNotUsedIconInfo(addItem).eNameOriginal:= TNotUsedIconInfo(addItem).eFileName;
               TNotUsedIconInfo(addItem).eSaveHistory:= False;
               TNotUsedIconInfo(addItem).eHistory:= TStringList.Create;
               HistoryFileStr:= ChangeFileExt(TNotUsedIconInfo(addItem).eFileName, '.txt');
               if FileExists(IconHistoryFolder+HistoryFileStr) then
                  TNotUsedIconInfo(addItem).eHistory.LoadFromFile(IconHistoryFolder+HistoryFileStr);
               addItem.Details[1]:= 1;
               addItem.Details[2]:= 2;
               Application.ProcessMessages;
             end;
             NotUsedIconsList.Items.ReIndexDisable:= False;
             NotUsedIconsList.Sort.SortAll;
             NotUsedIconsList.EndUpdate;
           end
        else
           begin
             GenerateMessage(FormMAMu_IconsManager.Caption, FormMain.GetEmulatorDescription(ButtonSystem.Tag),
                             'Scanning complete but nothing was found.', 2);
           end;
      end;
    False:
      begin
        GenerateMessage('Error', FormMain.GetEmulatorDescription(ButtonSystem.Tag),
                        'Could not find any icon files in the following folders.'+#13#10+
                        FormMain.GetMAMu_IconFolder(ButtonSystem.Tag, False), 2);
      end;
  end;
  FreeAndNil(tempList);
  FreeAndNil(el_GamesList);
  UpdateTotalFilesLabelNotUsed;
  if ShowFolderMessage then
     FormStatus.Close;
end;

function TFormMAMu_IconsManager.LoadIconNotUsed(const IconName: String; UpdateIcon: Boolean = False; UpdateIndex: Integer = -1): Integer;
var
  Iico: PWORD;
  tmpIcon: TIcon;
  Icon32: TExIcon;
  icoIndex: Integer;
begin
  Result:= -1;
  case SameText(ExtractFileExt(IconName), '.ico') of
    True:
      begin
        if FormMain.LoadMAMu_Icon(IconName, Icon32, icoIndex, False) then
           begin
             Icon32.CurrentImage:= icoIndex;
             tmpIcon:= TIcon.Create;
             tmpIcon.Width:= 32;//Icon32.Images[icoLoop].Width;
             tmpIcon.Height:= 32;//Icon32.Images[icoLoop].Width;
             tmpIcon.Handle:= Icon32.Handle;
             case UpdateIcon of
               True:
                 begin
                   IL_NotUsedIcons.ReplaceIcon(UpdateIndex, tmpIcon);
                   Result:= UpdateIndex;
                 end;
               False: Result:= IL_NotUsedIcons.AddIcon(tmpIcon);
             end;
             FreeAndNil(tmpIcon);
             FreeAndNil(Icon32);
           end;
      end;
    False:
      begin
        GetMem(Iico, SizeOf(Word));
        Iico^:= 0;
        tmpIcon:= TIcon.Create;
        tmpIcon.Width:= 32;
        tmpIcon.Height:= 32;
        tmpIcon.Handle:= ExtractAssociatedIcon(Handle, PChar(IconName), Iico^);
        case UpdateIcon of
          True:
            begin
              IL_NotUsedIcons.ReplaceIcon(UpdateIndex, tmpIcon);
              Result:= UpdateIndex;
            end;
          False: Result:= IL_NotUsedIcons.AddIcon(tmpIcon);
        end;
        FreeMem(Iico, SizeOf(Word));
        FreeAndNil(tmpIcon);
      end;
  end;
end;

procedure TFormMAMu_IconsManager.ResetNotUsedIconsList;
var
  Item: TEasyItem;
begin
  IL_NotUsedIcons.Clear;
  if not FormMain.CheckTotal(NotUsedIconsList) then
     Exit;
  NotUsedIconsList.BeginUpdate;
  Item:= NotUsedIconsList.Groups.FirstItem;
  repeat
    TNotUsedIconInfo(Item).eIconLoaded:= False;
    Item:= NotUsedIconsList.Groups.NextItem(Item);
  until Item = nil;
  NotUsedIconsList.EndUpdate;
end;

procedure TFormMAMu_IconsManager.UpdateHistoryPanel(ELV_Item: TEasyItem);
begin
  NotUsedIconHistory.Lines.BeginUpdate;
  NotUsedIconHistory.Lines.Clear;
  NotUsedIconHistory.Lines.AddStrings(TNotUsedIconInfo(ELV_Item).eHistory);
  NotUsedIconHistory.Lines.EndUpdate;
end;

function TFormMAMu_IconsManager.SaveHistoryToFile(ELV_Item: TEasyItem; OldIconName: String = ''): Boolean;
var
  SaveToFileStr: String;
begin
  Result:= TNotUsedIconInfo(ELV_Item).eSaveHistory;
  if not Result then
     Exit;
  if OldIconName <> '' then
     begin
       // only used when renaming .ico file and the "old_filename.txt" exists
       DeleteFile(IconHistoryFolder+ChangeFileExt(OldIconName, '.txt'));
       Sleep(80);
     end;
  SaveToFileStr:= TNotUsedIconInfo(ELV_Item).eFileName;
  SaveToFileStr:= ChangeFileExt(SaveToFileStr, '.txt');
  TNotUsedIconInfo(ELV_Item).eHistory.SaveToFile(IconHistoryFolder+SaveToFileStr);
  TNotUsedIconInfo(ELV_Item).eSaveHistory:= False;
end;
// end of not used icons functions

procedure TFormMAMu_IconsManager.SelectSystem;
var
  selSys: ShortInt;
begin
  selSys:= FormMain.CallSelectSystem(0, ButtonSystem.Tag);
  if selSys = -1 then
     Exit;
  ButtonSystem.Tag:= selSys;
  ButtonSystem.Caption:= FormMain.GetEmulatorDescription(selSys);
  FormMain.IL_ArcadeSystem_Small.GetIcon(ButtonSystem.Tag, SystemIcon.Picture.Icon);
end;

procedure TFormMAMu_IconsManager.CreateEditIcon(const IconName, SoftwareName: String; sysID: Integer);
var
  BlankIcon: String;
  IconFullPath, SoftNameFolder: String;
begin
  BlankIcon:= FormMain.FrontendPath+'resources\blank_icon.ico';
  case FileExists(BlankIcon) of
    True:
      begin
        IconFullPath:= FormMain.GetMAMu_IconFolder(sysID, False);
        SoftNameFolder:= '';
        if SoftwareName <> '' then
           SoftNameFolder:= SoftwareName+'\';
        if not FileExists(IconFullPath+SoftNameFolder+IconName) then
           begin
             if SoftNameFolder <> '' then
                ForceDirectories(IconFullPath+SoftNameFolder);
             CopyFile(PChar(BlankIcon), PChar(IconFullPath+SoftNameFolder+IconName), False);
             Sleep(80);
             Application.ProcessMessages;
           end;
        case FileExists(IconFullPath+SoftNameFolder+IconName) of
          True : ShellExecute(Handle, nil, PAnsiChar(IconFullPath+SoftNameFolder+IconName), nil, nil, SW_SHOWNORMAL);
          False: GenerateMessage('Error', PopupCreateEditIcon.Caption,
                        Format('    Failed to create file "%s" or your computer needs a pause higher than 80 milliseconds.',
                               [IconFullPath+SoftNameFolder+IconName]), 2, False, 1);
        end;
      end;
    False:
      begin
        CallMessageBox;
        FormMain.AddMsgText('    Failed to create a blank icon file. File ');
        FormMain.AddMsgText(BlankIcon, $00a65300, [fsBold]);
        FormMain.AddMsgText(' was not found!');
        GenerateMessage('Error', PopupCreateEditIcon.Caption, '', 2, False, 1);
      end;
  end;
  Application.ProcessMessages;
end;

procedure TFormMAMu_IconsManager.FormShow(Sender: TObject);
var
  Folder: String;
begin
  ReadIniFile;
  IconHistoryFolder:= FormMain.FrontendPath+'resources\icons_history\';
  CheckAndCreateFolder(IconHistoryFolder);
  Folder:= FormMain.GetFolderFull(32);
  
  FormMain.ELV_ResetNormalColors(MissingIconsList);
  FormMain.ELV_ResetNormalColors(NotUsedIconsList);
  ButtonSystem.Caption:= '  '+FormMain.GetEmulatorDescription(ButtonSystem.Tag);
  FormMain.AddGamesSystemsIcons(IL_MissingIcons);
  FormMain.IL_ArcadeSystem_Small.GetIcon(ButtonSystem.Tag, SystemIcon.Picture.Icon);

  ExcludeFileStr:= FormMain.GetIniFilesFolder+'el_mamu_exclude.ini';
  ExcludeFiles:= THashedStringList.Create;
  if FileExists(ExcludeFileStr) then
     ExcludeFiles.LoadFromFile(ExcludeFileStr);
  ZZZIconList:= THashedStringList.Create;
  DetectFileMD5;
end;

function TFormMAMu_IconsManager.MissingIconsListItemCompare(
  Sender: TCustomEasyListview; Column: TEasyColumn; Group: TEasyGroup;
  Item1, Item2: TEasyItem; var DoDefault: Boolean): Integer;
var
  gItem1, gItem2: TEasyItem;
begin
  DoDefault:= False;
  FormMain.ELV_GetSortDirection(Column, Item1, Item2, gItem1, gItem2);

  case Column.Index of
    0: Result:= FormMain.iCompare(TMissingIconInfo(gItem1).eTitle, TMissingIconInfo(gItem2).eTitle);
    1: Result:= FormMain.iCompare(TMissingIconInfo(gItem1).eName, TMissingIconInfo(gItem2).eName);
    2: Result:= FormMain.iCompare(TMissingIconInfo(gItem1).eCloneParent, TMissingIconInfo(gItem2).eCloneParent);
    3: Result:= FormMain.iCompare(TMissingIconInfo(gItem1).eBiosName, TMissingIconInfo(gItem2).eBiosName);
    4: Result:= FormMain.iCompare(TMissingIconInfo(gItem1).eDriverName, TMissingIconInfo(gItem2).eDriverName);
    5: Result:= AnsiCompareText(aStatus[TMissingIconInfo(gItem1).eDriverStatus], aStatus[TMissingIconInfo(gItem2).eDriverStatus]);
    6: Result:= FormMain.iCompare(TMissingIconInfo(gItem1).eManufacturer, TMissingIconInfo(gItem2).eManufacturer);
    7: Result:= AnsiCompareText(TMissingIconInfo(gItem1).eVersionAdded, TMissingIconInfo(gItem2).eVersionAdded);
    8: Result:= CompareIntValue(Ord(TMissingIconInfo(gItem1).eMechanical), Ord(TMissingIconInfo(gItem2).eMechanical))
   end;
end;

procedure TFormMAMu_IconsManager.MissingIconsListItemPaintText(
  Sender: TCustomEasyListview; Item: TEasyItem; Position: Integer;
  ACanvas: TCanvas);
begin
  FormMain.GetCanvasFontCustom(TMissingIconInfo(Item).eGameStatus,
                TMissingIconInfo(Item).eDriverStatus,
                TMissingIconInfo(Item).eClone, ACanvas, True);
  if MissingIconsList.View = elsTile then
     begin
       if Position > 0 then
          begin
            ACanvas.Font.Color:= clMaroon;
            ACanvas.Font.Name:= 'Consolas';
            ACanvas.Font.Size:= 8;//ACanvas.Font.Size-1;
            ACanvas.Font.Style:= [];//ACanvas.Font.Style+[fsItalic];
          end;
     end
  else
  begin
    if not (Position in [0, 6]) then
       begin
         // only columns Title and Manufacturer will use user defined font
         // all others will use Tahoma, size 8 
         ACanvas.Font.Name:= 'Tahoma';
         ACanvas.Font.Size:= 8;
       end;
  end;
end;

procedure TFormMAMu_IconsManager.MissingIconsListColumnClick(
  Sender: TCustomEasyListview; Button: TCommonMouseButton;
  ShiftState: TShiftState; const Column: TEasyColumn);
begin
  if Button = cmbLeft then
     begin
       MissingIconsList.BeginUpdate;
       MissingIconsList.Sort.SortAll;
       MissingIconsList.EndUpdate(False);
     end;
end;

procedure TFormMAMu_IconsManager.MissingIconsListDblClick(
  Sender: TCustomEasyListview; Button: TCommonMouseButton;
  MousePos: TPoint; ShiftState: TShiftState; var Handled: Boolean);
begin
  PopupRunGame.Click;
end;

procedure TFormMAMu_IconsManager.MissingIconsListItemSelectionChanged(
  Sender: TCustomEasyListview; Item: TEasyItem);
begin
  if Item.Selected then
     begin
       SelectedItemMissing:= Item;
       SetSelectedMissingGame;
     end;
end;

procedure TFormMAMu_IconsManager.PopupRunGameClick(Sender: TObject);
var
  GameEasy: TEasyItem;
  RunGame: Boolean;

  function ShowInvisibleGameMsg: Boolean;
  begin
    Result:= GenerateMessage('Warning', 'Run selected game.', '    The game is not visible in '+
              'main games list, probably due to selected games filters.'+
              #13#10+'The game might not run properly. Would you like to try it anyway ?', 1) = mrYes;
    if not Result then
       RunGame:= False;
  end;

  function ShowGameNotFoundMsg: Boolean;
  begin
    GenerateMessage('Error', FormMain.GetEmulatorDescription(TMissingIconInfo(SelectedItemMissing).eSystemID),
                    '    Could not find the game in main games list. For this feature to work, '+
                    'the game must be valid and visible on the main screen. Make sure that the games list for '+
                    'this system is loaded.', 2, False, 1);
    RunGame:= False;
    Result:= RunGame;
  end;

begin
  if MissingIconsList.Selection.Count <> 1 then
     Exit;

  RunGame:= True;
  FormMain.FindGameName(TMissingIconInfo(SelectedItemMissing).eName, TMissingIconInfo(SelectedItemMissing).eSystemID,
                                                                     TMissingIconInfo(SelectedItemMissing).eSoftwareName, GameEasy, False);

  if GameEasy <> nil then
     begin
       case GameEasy.Visible of
         True: FormMain.SelectEasyItem(GameEasy);
         False:
           begin
             if not ShowInvisibleGameMsg then
                Exit;
             FormMain.SelectEasyItem(GameEasy);
           end;
       end;
     end
  else
     ShowGameNotFoundMsg;

  if RunGame then
     begin
       Application.ProcessMessages;
       Sleep(150);
       FormMain.ExecuteGame;
     end;
  MissingIconsList.SetFocus;
end;

procedure TFormMAMu_IconsManager.PopupClearGamesListClick(
  Sender: TObject);
begin
  FormMain.ClearListView(MissingIconsList);
  ClearSelectedMissing;
  IL_MissingIcons.Clear;
  UpdateTotalGamesLabelMissing;
end;

procedure TFormMAMu_IconsManager.PopupCreateEditIconClick(Sender: TObject);
begin
  if MissingIconsList.Selection.Count <> 1 then
     Exit;
  if TMissingIconInfo(SelectedItemMissing).eSoftwareName <> '' then
     begin
       GenerateMessage('Info', TMenuItem(Sender).Caption,
                       '    You can only create a game icon for software list games. Aborting...');
       Exit;
     end;
  case TMenuItem(Sender).Tag of
    0: CreateEditIcon(TMissingIconInfo(SelectedItemMissing).eName+'.ico', TMissingIconInfo(SelectedItemMissing).eSoftwareName, TMissingIconInfo(SelectedItemMissing).eSystemID);
    1: CreateEditIcon(TMissingIconInfo(SelectedItemMissing).eBiosName+'.ico', TMissingIconInfo(SelectedItemMissing).eSoftwareName, TMissingIconInfo(SelectedItemMissing).eSystemID);
    2: CreateEditIcon(ChangeFileExt(TMissingIconInfo(SelectedItemMissing).eDriverName, '.ico'), TMissingIconInfo(SelectedItemMissing).eSoftwareName, TMissingIconInfo(SelectedItemMissing).eSystemID);
  end;
end;

procedure TFormMAMu_IconsManager.PopupReloadIconsClick(Sender: TObject);
begin
  ResetMissingIconsList;
end;

procedure TFormMAMu_IconsManager.PopupReloadIconsSelectedGamesClick(
  Sender: TObject);
var
  Item: TEasyItem;
begin
  if not FormMain.CheckTotal(MissingIconsList) then
     Exit;
  if not FormMain.CheckSelected(MissingIconsList) then
     Exit;
  MissingIconsList.BeginUpdate;
  Item:= MissingIconsList.Selection.First;
  repeat
    TMissingIconInfo(Item).eIconLoaded:= False;
    TMissingIconInfo(Item).eImageIndex:= TMissingIconInfo(Item).eROMIdentification;
    Item:= MissingIconsList.Selection.Next(Item);
  until Item = nil;
  MissingIconsList.EndUpdate;
end;

procedure TFormMAMu_IconsManager.ApplyFilter;
var
  Item: TEasyItem;

  function IconZZZPreliminary: Boolean;
  begin
    Result:= (not TMissingIconInfo(Item).eIsIconZZZ);
  end;

begin
  if not FormMain.CheckTotal(MissingIconsList) then
     Exit;
  MissingIconsList.BeginUpdate;
  Item:= MissingIconsList.Groups.FirstItem;
  repeat
    case PopupGamesViewMode.Tag of
      0: Item.Visible:= IconZZZPreliminary;// True; // show all games
      1: Item.Visible:= not FormMain.GameIsClone(TMissingIconInfo(Item).eClone) and IconZZZPreliminary; // show parents only
      2: Item.Visible:= FormMain.GameIsClone(TMissingIconInfo(Item).eClone) and IconZZZPreliminary; // show clones only
      3: Item.Visible:= FormMain.IsROM_Bios(TMissingIconInfo(Item).eROMIdentification) and IconZZZPreliminary; // show bios sets only
      4: Item.Visible:= TMissingIconInfo(Item).eMechanical and IconZZZPreliminary; // show mechanical sets only
      5: Item.Visible:= TMissingIconInfo(Item).eIsIconZZZ;// True; // show games with "Not Working" icon (from zzz.ico)
      6: Item.Visible:= (TMissingIconInfo(Item).eDriverStatus <> 2) and TMissingIconInfo(Item).eIsIconZZZ;
      7: Item.Visible:= FormMain.IsROM_Device(TMissingIconInfo(Item).eROMIdentification); // show device sets only
    //  8: Item.Visible:= (TMissingIconInfo(Item).eSoftwareName <> '') and IconZZZPreliminary; // show software list games only
    end;
    Item:= MissingIconsList.Groups.NextItem(Item);
  until Item = nil;
  MissingIconsList.EndUpdate;
  UpdateTotalGamesLabelMissing;
end;

procedure TFormMAMu_IconsManager.NotUsedIconsListItemPaintText(
  Sender: TCustomEasyListview; Item: TEasyItem; Position: Integer;
  ACanvas: TCanvas);
begin
  if not SameText(TNotUsedIconInfo(Item).eFileName, TNotUsedIconInfo(Item).eNameOriginal) then
     begin
       ACanvas.Font.Color:= clMaroon;
       ACAnvas.Font.Style:= [fsBold];
     end;
  if Position > 0 then
     begin
       ACanvas.Font.Name:= 'Consolas';
       ACanvas.Font.Size:= 8;
     end;
       //ACanvas.Font.Size:= ACanvas.Font.Size-2;
end;

procedure TFormMAMu_IconsManager.NotUsedIconsListItemSelectionChanged(
  Sender: TCustomEasyListview; Item: TEasyItem);
begin
  if Item.Selected and (NotUsedIconsList.Selection.Count = 1) then
     begin
       SelectedItemNotUsed:= Item;
       FormMain.ELV_SetSelectRibbon(Ord((not SameText(TNotUsedIconInfo(Item).eFileName, TNotUsedIconInfo(Item).eNameOriginal))),
                                    NotUsedIconsList);
       UpdateHistoryPanel(Item);
     end;
end;

procedure TFormMAMu_IconsManager.MissingIconsListKeyAction(
  Sender: TCustomEasyListview; var CharCode: Word; var Shift: TShiftState;
  var DoDefault: Boolean);
begin
  case CharCode of
    VK_DELETE: PopupMissingRemoveSelected.Click;
    VK_RETURN: PopupRunGame.Click;
    VK_F3: PopupCreateEditIcon.Click;
    VK_F4: PopupCreateBiosEditIcon.Click;
    VK_F5: PopupCreateDriverEditIcon.Click;
  end;
end;

procedure TFormMAMu_IconsManager.NotUsedIconsListKeyAction(
  Sender: TCustomEasyListview; var CharCode: Word; var Shift: TShiftState;
  var DoDefault: Boolean);
begin
  if FormMain.ELV_IsEditing(TEasyListView(Sender)) then
     Exit;
  case CharCode of
    VK_F2: PopupNotUsedRenameFile.Click;
    VK_RETURN: PopupEditIcon.Click;
    VK_DELETE: PopupNotUsedRemoveSelected.Click;
  end;
end;

procedure TFormMAMu_IconsManager.PopupNotUsedClearFilesListClick(
  Sender: TObject);
begin
  ClearSelectedNotUsed;
  FormMain.ClearListView(NotUsedIconsList);
  IL_NotUsedIcons.Clear;
end;

procedure TFormMAMu_IconsManager.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if FormMAMu_IconsManager.WindowState = wsMinimized then
     begin
       CanClose:= False;
       Exit;
     end;
  FreeAndNil(ExcludeFiles);
  FreeAndNil(ZZZIconList);
  FormMain.ClearListView(MissingIconsList);
  FormMain.ClearListView(NotUsedIconsList);
  WriteIniFile;
  FormMAMu_IconsManager.Release;
  FormMAMu_IconsManager:= nil;
end;

procedure TFormMAMu_IconsManager.PopupEditIconClick(Sender: TObject);
begin
  if NotUsedIconsList.Selection.Count <> 1 then
     Exit;
  if FileExists(TNotUsedIconInfo(SelectedItemNotUsed).eFullPath+TNotUsedIconInfo(SelectedItemNotUsed).eFileName) then
     begin
       AddFileHistory(SelectedItemNotUsed, 'Edit with associated editor');
       SaveHistoryToFile(SelectedItemNotUsed);
       UpdateHistoryPanel(SelectedItemNotUsed);
       ShellExecute(Handle, nil, PAnsiChar(TNotUsedIconInfo(SelectedItemNotUsed).eFullPath+TNotUsedIconInfo(SelectedItemNotUsed).eFileName), nil, nil, SW_SHOWNORMAL);
     end;
end;

procedure TFormMAMu_IconsManager.PopupNotUsedRemoveSelectedClick(
  Sender: TObject);
var
  Item: TEasyItem;
begin
  if not FormMain.CheckSelected(NotUsedIconsList) then
     Exit;
  Item:= NotUsedIconsList.Selection.First;
  repeat
    SaveHistoryToFile(Item);
    Item:= NotUsedIconsList.Selection.Next(Item);
  until Item = nil;
  NotUsedIconsList.Selection.DeleteSelected(True);
  UpdateTotalFilesLabelNotUsed;
  NotUsedIconsList.SetFocus;
end;

procedure TFormMAMu_IconsManager.PopupMissingRemoveSelectedClick(
  Sender: TObject);
begin
  if not FormMain.CheckSelected(MissingIconsList) then
     Exit;
  MissingIconsList.Selection.DeleteSelected(True);
  ResetMissingIconsList;
  UpdateTotalGamesLabelMissing;
end;

procedure TFormMAMu_IconsManager.PopupMoveSelectedToFolderClick(
  Sender: TObject);
var
  Item, ItemToMove: TEasyItem;
  FolderStr: String;
begin
  if not FormMain.CheckSelected(NotUsedIconsList) then
     Exit;

  FolderStr:= FormMain.DialogSelectFolderStr('Move Selected Files To Folder');
  if FolderStr = '' then
     begin
       NotUsedIconsList.SetFocus;
       Exit;
     end;
  NotUsedIconsList.BeginUpdate;
  Item:= NotUsedIconsList.Selection.Prev(NotUsedIconsList.Groups.LastItem);
  repeat
    ItemToMove:= nil;
    if MoveFile(PChar(IncludeTrailingPathDelimiter(TNotUsedIconInfo(Item).eFullPath)+TNotUsedIconInfo(Item).eFileName),
                PChar(FolderStr+TNotUsedIconInfo(Item).eFileName), True) then
       begin
         AddFileHistory(Item, Format('File moved from "%s" to "%s" folder',
                    [IncludeTrailingPathDelimiter(TNotUsedIconInfo(Item).eFullPath), FolderStr]));
         SaveHistoryToFile(Item);
         ItemToMove:= Item;
       end;
    Item:= NotUsedIconsList.Selection.Prev(Item);
    if ItemToMove <> nil then
       NotUsedIconsList.Groups.DeleteItem(ItemToMove);
  until Item = nil;
  NotUsedIconsList.EndUpdate;
  ClearSelectedNotUsed;
  ResetNotUsedIconsList;
  UpdateTotalFilesLabelNotUsed;
end;

procedure TFormMAMu_IconsManager.PopupAddSelectedToExcludeFilesListClick(
  Sender: TObject);
var
  Item: TEasyItem;
begin
  if not FormMain.CheckSelected(NotUsedIconsList) then
     Exit;

  Item:= NotUsedIconsList.Selection.First;
  repeat
    if ExcludeFiles.IndexOf(TNotUsedIconInfo(Item).eFileName) = -1 then
       ExcludeFiles.Add(TNotUsedIconInfo(Item).eFileName);
    Item:= NotUsedIconsList.Selection.Next(Item);
  until Item = nil;
  ExcludeFiles.SaveToFile(ExcludeFileStr);
  NotUsedIconsList.Selection.DeleteSelected(True);
  ResetNotUsedIconsList;
  UpdateTotalFilesLabelNotUsed;
end;

procedure TFormMAMu_IconsManager.PopupViewExcludedListClick(
  Sender: TObject);
begin
  if not Assigned(FormMAMu_ExcludedList) then
     FormMAMu_ExcludedList:= TFormMAMu_ExcludedList.Create(nil);
  if ExcludeFiles.Count > 0 then
     FormMAMu_ExcludedList.ExcludedFiles.Lines.AddStrings(ExcludeFiles);
  if FormMAMu_ExcludedList.ShowModal = mrOk then
     begin
       ExcludeFiles.Clear;
       ExcludeFiles.AddStrings(FormMAMu_ExcludedList.ExcludedFiles.Lines);
       ExcludeFiles.SaveToFile(ExcludeFileStr);
     end;
  FreeAndNil(FormMAMu_ExcludedList);
end;

procedure TFormMAMu_IconsManager.PopupReloadExcludedListClick(
  Sender: TObject);
begin
  if FileExists(ExcludeFileStr) then
     begin
       ExcludeFiles.Clear;
       ExcludeFiles.LoadFromFile(ExcludeFileStr);
     end;
end;

procedure TFormMAMu_IconsManager.PopupNotUsedRenameFileClick(
  Sender: TObject);
var
  OldName, NewName: String;

  procedure UpdateMissingIcon(const GameName, SoftwareName: String);
  var
    MissingItem: TEasyItem;
  begin
    MissingItem:= SearchName(ChangeFileExt(GameName, ''), SoftwareName);
    if MissingItem <> nil then
       begin
         TMissingIconInfo(MissingItem).eIconLoaded:= False;
         if SoftwareName = '' then
            TMissingIconInfo(MissingItem).eImageIndex:= TMissingIconInfo(MissingItem).eROMIdentification
         else
            TMissingIconInfo(MissingItem).eImageIndex:= TMissingIconInfo(MissingItem).eROMIdentification; // this is new softlist game image index uMain "MaxGameID"
         MissingItem.Invalidate(True);
       end;
  end;
  
begin
  if NotUsedIconsList.Selection.Count <> 1 then
     Exit;
  OldName:= TNotUsedIconInfo(SelectedItemNotUsed).eFileName;
  if not Assigned(FormRenameIconFile) then
     FormRenameIconFile:= TFormRenameIconFile.Create(nil);

  IL_NotUsedIcons.GetIcon(TNotUsedIconInfo(SelectedItemNotUsed).eImageIndex, FormRenameIconFile.Icon.Picture.Icon);
  FormRenameIconFile.Left:= PanelNotUsedIcons.Left+FormMAMu_IconsManager.Left+10;
  FormRenameIconFile.Top:= PanelNotUsedIcons.Top+FormMAMu_IconsManager.Top+28;

  FormRenameIconFile.OldFileName:= OldName;
  FormRenameIconFile.NewFilename.Text:= OldName;
  FormRenameIconFile.NewFilename.SelectAll;
  FormRenameIconFile.ShowModal;
  NewName:= Trim(FormRenameIconFile.NewFilename.Text);
  if FormRenameIconFile.mmResult = mrOk then
     begin
       NewName:= ChangeFileExt(NewName, '.ico');
       case RenameIconFile(OldName, NewName, TNotUsedIconInfo(SelectedItemNotUsed).eFullPath) of
         True:
           begin
             AddFileHistory(SelectedItemNotUsed, Format('Rename from "%s" to "%s" (ok)', [ExtractFileName(OldName), ExtractFileName(NewName)]));
             TNotUsedIconInfo(SelectedItemNotUsed).eFileName:= NewName;
             SelectedItemNotUsed.Invalidate(True);
             FormMain.ELV_SetSelectRibbon(Ord((not SameText(TNotUsedIconInfo(SelectedItemNotUsed).eFileName,
                                                            TNotUsedIconInfo(SelectedItemNotUsed).eNameOriginal))),
                                          NotUsedIconsList);
             UpdateMissingIcon(OldName, ''); // need to add SoftwareName here ????
             UpdateMissingIcon(NewName, ''); // need to add SoftwareName here ????
           end;
         False:
           begin
             AddFileHistory(SelectedItemNotUsed, Format('Rename from "%s" to "%s" (failed)', [ExtractFileName(OldName), ExtractFileName(NewName)]));
           end;
       end;
       SaveHistoryToFile(SelectedItemNotUsed, OldName);
       UpdateHistoryPanel(SelectedItemNotUsed);
     end;
  FreeAndNil(FormRenameIconFile);
end;

procedure TFormMAMu_IconsManager.PopupNotUsedSaveIconsListToFileClick(
  Sender: TObject);
var
  Item: TEasyItem;
  ListOutput: THashedStringList;
  AddHeader: Boolean;
  FileStr: String;
begin
  if not FormMain.CheckTotal(NotUsedIconsList) then
     Exit;

   FileStr:= FormMain.DialogSaveFile(4, 'Save Not Used MAMu_ Icons List To a File');
   if FileStr = '' then
      begin
        NotUsedIconsList.SetFocus;
        Exit;
      end;

   AddHeader:= True;
   ListOutput:= THashedStringList.Create;
   ListOutput.BeginUpdate;
   ListOutput.Add('----------> Not Used MAMu_ Icons <----------'+#13#10);
   Item:= NotUsedIconsList.Groups.FirstItem;
   repeat
     if AddHeader then
        begin
          ListOutput.Add(#13#10+'-> '+FormMain.GetEmulatorDescription(TNotUsedIconInfo(Item).eSystemID));
          ListOutput.Add('   '+'Total files: '+IntToStr(NotUsedIconsList.Groups.ItemCount));
          AddHeader:= False;
        end;
     ListOutput.Add('    '+TNotUsedIconInfo(Item).eFullPath+TNotUsedIconInfo(Item).eFileName);
     Item:= NotUsedIconsList.Groups.NextItem(Item);
   until Item = nil;
   ListOutput.EndUpdate;
   ListOutput.SaveToFile(FileStr);
   FreeAndNil(ListOutput);
   GenerateMessage(FormMAMu_IconsManager.Caption, 'Save files list to a text file.',
                   Format('    File "%s" was created based on the current files list, '+
                          'separated by system.', [FileStr]), 2);
   NotUsedIconsList.SetFocus;
end;

procedure TFormMAMu_IconsManager.PopupNotUsedRemoveRenamedIconsClick(
  Sender: TObject);
var
  Item, ItemToRemove: TEasyItem;
begin
  if not FormMain.CheckTotal(NotUsedIconsList) then
     Exit;
  ClearSelectedNotUsed;
  Item:= NotUsedIconsList.Groups.LastItem;
  NotUsedIconsList.BeginUpdate;
  repeat
    ItemToRemove:= nil;
    if not SameText(TNotUsedIconInfo(Item).eFileName, TNotUsedIconInfo(Item).eNameOriginal) then
       begin
         SaveHistoryToFile(Item);
         ItemToRemove:= Item;
       end;
    Item:= NotUsedIconsList.Groups.PrevItem(Item);
    if ItemToRemove <> nil then
       NotUsedIconsList.Groups.DeleteItem(ItemToRemove);
  until Item = nil;
  NotUsedIconsList.EndUpdate;
  ResetNotUsedIconsList;
  UpdateTotalFilesLabelNotUsed;
  NotUsedIconsList.SetFocus;
end;

procedure TFormMAMu_IconsManager.DetectFileMD5;
var
  MD5Str: String;
  Loop: Integer;
begin
  GetFilesList(FormMain.MAMu_Folder, '.ico', 'zzz*.ico', ZZZIconList, False, True, True);
  ZZZIconList.Sorted:= False;
  if ZZZIconList.Count > 0 then
     begin
       ZZZIconList.BeginUpdate;
       for Loop:=0 to ZZZIconList.Count-1 do
       begin
         MD5Str:= GetMD5_Value(ZZZIconList[Loop]);
         ZZZIconList[Loop]:= MD5Str+'='+ExtractFileName(ZZZIconList[Loop]);
       end;
       ZZZIconList.EndUpdate;
     end;
end;

procedure TFormMAMu_IconsManager.FormCanResize(Sender: TObject;
  var NewWidth, NewHeight: Integer; var Resize: Boolean);
begin
  if NewWidth < 790 then
     Resize:= False;
  LabelTotalItemsNotUsed.Left:= PanelNotUsedIcons.Left;
  ButtonNotUsedDeleteFiles.Left:= BottomBar.Width-159;
end;

procedure TFormMAMu_IconsManager.ButtonCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TFormMAMu_IconsManager.ButtonNotUsedDeleteFilesClick(Sender: TObject);
var
  Item, ItemToDelete: TEasyItem;
begin
   if not FormMain.CheckTotal(NotUsedIconsList) then
      begin
        NotUsedIconsList.SetFocus;
        Exit;
      end;
   if GenerateMessage(FormMAMu_IconsManager.Caption, 'Delete not used files.',
                     '    You are about to delete all files on the list. '+
                     'Recycled bin is not supported. If for any reason a file cannot be deleted, it will not '+
                     'be removed from the list. History files will not be deleted. Click No button to cancel this operation.'+#13#10+
                     'Are you sure you want to continue ?', 1, False, 2) = mrNo then
      begin
        NotUsedIconsList.SetFocus;
        Exit;
      end;
   NotUsedIconsList.BeginUpdate;
   Item:= NotUsedIconsList.Groups.LastItem;
   repeat
     ItemToDelete:= nil;
     if DeleteFile(TNotUsedIconInfo(Item).eFullPath+TNotUsedIconInfo(Item).eFileName) then
        ItemToDelete:= Item;
     Item:= NotUsedIconsList.Groups.PrevItem(Item);
     if ItemToDelete <> nil then
        NotUsedIconsList.Groups.DeleteItem(ItemToDelete);
   until Item = nil;
   NotUsedIconsList.EndUpdate;
   ClearSelectedNotUsed;
   ResetNotUsedIconsList;
   UpdateTotalFilesLabelNotUsed;
   NotUsedIconsList.SetFocus;
end;

procedure TFormMAMu_IconsManager.NotUsedIconsListItemFreeing(
  Sender: TCustomEasyListview; Item: TEasyItem);
begin
  TNotUsedIconInfo(Item).eHistory.Clear;
  TNotUsedIconInfo(Item).eHistory.Free;
  TNotUsedIconInfo(Item).eHistory:= nil;
end;

procedure TFormMAMu_IconsManager.PopupNotUsedClearFileHistoryClick(
  Sender: TObject);
begin
  if NotUsedIconsList.Selection.Count <> 1 then
     Exit;
  TNotUsedIconInfo(SelectedItemNotUsed).eHistory.Clear;
  TNotUsedIconInfo(SelectedItemNotUsed).eSaveHistory:= True;
  NotUsedIconHistory.Lines.Clear;
end;

procedure TFormMAMu_IconsManager.ButtonClearHistoryNotUsedClick(
  Sender: TObject);
begin
  PopupNotUsedClearFileHistory.Click;
end;

procedure TFormMAMu_IconsManager.PopupNotUsedUpdateIconInfoSelectedIconsClick(
  Sender: TObject);
var
  Item: TEasyItem;
  FileFull: String;
begin
  if not FormMain.CheckTotal(NotUsedIconsList) then
     Exit;
  if TMenuItem(Sender).Tag = 0 then
     begin
       if not FormMain.CheckSelected(NotUsedIconsList) then
          Exit;
     end;

  NotUsedIconsList.BeginUpdate;
  case TMenuItem(Sender).Tag of
    0: Item:= NotUsedIconsList.Selection.First;
    1: Item:= NotUsedIconsList.Groups.FirstItem;
  end;
  repeat
    FileFull:= TNotUsedIconInfo(Item).eFullPath+TNotUsedIconInfo(Item).eFileName;
    TNotUsedIconInfo(Item).eSize:= GetFileSize(FileFull);
    TNotUsedIconInfo(Item).eSizeText:= FormMain.GetSizeType(TNotUsedIconInfo(Item).eSize, False);
    TNotUsedIconInfo(Item).eDateTime:= FileAge(FileFull);
    TNotUsedIconInfo(Item).eDateTimeText:= FormMain.GetDateTimeStr(TNotUsedIconInfo(Item).eDateTime);
    LoadIconNotUsed(FileFull, True, TNotUsedIconInfo(Item).eImageIndex);
    case TMenuItem(Sender).Tag of
      0: Item:= NotUsedIconsList.Selection.Next(Item);
      1: Item:= NotUsedIconsList.Groups.NextItem(Item);
    end;
  until Item = nil;
  NotUsedIconsList.EndUpdate;
end;

procedure TFormMAMu_IconsManager.SplitterListMoved(Sender: TObject);
begin
  NotUsedIconsList.CellSizes.Tile.Width:= NotUsedIconsList.Width-18;
  LabelTotalItemsNotUsed.Left:= PanelNotUsedIcons.Left;
  LabelFileHistory.Left:= Round(LabelFileHistory.Parent.Width div 2);
end;

procedure TFormMAMu_IconsManager.FormActivate(Sender: TObject);
begin
  if MissingIconsList.Tag = 1 then
     Exit;
  if FormMAMu_IconsManager.Tag = 1 then
     WindowState:= wsMaximized
  else
     begin
       if ((FormMAMu_IconsManager.Top = 0) and (FormMAMu_IconsManager.Left = 0)) then
          begin
            FormMAMu_IconsManager.Top:= (Screen.Height-FormMAMu_IconsManager.Height) div 2;
            FormMAMu_IconsManager.Left:= (Screen.Width-FormMAMu_IconsManager.Width) div 2;
          end;
     end;
  MissingIconsList.Tag:= 1;
end;

procedure TFormMAMu_IconsManager.MissingIconsListColumnSizeChanged(
  Sender: TCustomEasyListview; Column: TEasyColumn);
begin
  case Column.Index of
    2: // game name
      begin
        MissingIconsList.Header.Columns[3].Width:= Column.Width;
        MissingIconsList.Header.Columns[4].Width:= Column.Width;
      end;
    3: // clone of
      begin
        MissingIconsList.Header.Columns[2].Width:= Column.Width;
        MissingIconsList.Header.Columns[4].Width:= Column.Width;
      end;
    4: // bios name
      begin
        MissingIconsList.Header.Columns[2].Width:= Column.Width;
        MissingIconsList.Header.Columns[3].Width:= Column.Width;
      end;
  end;
end;

procedure TFormMAMu_IconsManager.PopupMissingIconsMeasureMenuItem(
  Sender: TObject; AMenuItem: TMenuItem; ACanvas: TCanvas; var Width,
  Height: Integer; ABarVisible: Boolean; var DefaultMeasure: Boolean);
begin
  FormMain.SetPopupMenuMeasureItem(AMenuItem, ACanvas, Width, Height);
end;

procedure TFormMAMu_IconsManager.PopupUpdateNotWorkingIconGamesHelpClick(Sender: TObject);
begin
  GenerateMessage('Help', 'Update "Not Working" Icon Games'+#13#10+
                            'What this feature does ?',
                  '    Games that have the "not working" icon are a copy of "zzz.ico" '+
                  'file. If you edit "zzz.ico", the MD5 checksum of these icons will not match.'+#13#10+#13#10+
                  '    Here''s how to update the icons of those games:'+#13#10+
                  '1. Click on "Scan Missing" button (if you haven''t done it already).'+#13#10+
                  '2. Edit file "zzz.ico" with you favorite icons editor software.'+#13#10+
                  '3. Select "Update Not Working Icon Games" (missing icons popup menu).'+#13#10+
                  '4. Click "Yes" button on confirmation dialog to update the icons.'
                  +#13#10+#13#10+'NOTES:'+#13#10+
                  '- the MD5 checksum of all "zzz" icons are always generated on "Scan Missing"'+#13#10+
                  '- all "not working" icons will be updated (good/imperfect/preliminary driver status)'+#13#10+
                  '- a message box will be displayed with results', 2);
end;

procedure TFormMAMu_IconsManager.PopupCopyIconZZZtoSelectedGamesClick(
  Sender: TObject);
begin
  GenerateNotWorkingIconsDeleteCopy(TMenuItem(Sender).Tag);
  ApplyFilter;
end;

procedure TFormMAMu_IconsManager.PopupMissDetailsViewSmallIconsClick(Sender: TObject);
var
  RefreshIcons: Boolean;
begin
  RefreshIcons:= False;
  if TMenuItem(Sender).Tag = IL_MissingIcons.Tag then
     begin
       if not TMenuItem(Sender).Checked then
          TMenuItem(Sender).Checked:= True;
       Exit;
     end;
  IL_MissingIcons.Tag:= TMenuItem(Sender).Tag;
  case TMenuItem(Sender).Tag of
    0: // details view, small scons
      begin
        IL_MissingIcons.Width:= 16;
        IL_MissingIcons.Height:= 16;
        MissingIconsList.CellSizes.Report.Height:= 20;
        RefreshIcons:= True;
      end;
    1, 2: // details view large icons / tiles view
      begin
        if IL_MissingIcons.Width <> 32 then
           begin
             IL_MissingIcons.Width:= 32;
             IL_MissingIcons.Height:= 32;
             RefreshIcons:= True;
           end;
        MissingIconsList.CellSizes.Report.Height:= 36;
      end;
  end;
  MissingIconsList.BeginUpdate;
  case TMenuItem(Sender).Tag of
    0, 1: if MissingIconsList.View <> elsReport then MissingIconsList.View:= elsReport; // report view
    2: if MissingIconsList.View <> elsTile then MissingIconsList.View:= elsTile;// tiles view
  end;
  MissingIconsList.EndUpdate;
  if RefreshIcons then
     ResetMissingIconsList;
  SetSelectedMissingGame(False);
end;

procedure TFormMAMu_IconsManager.PopupShowAllGamesClick(Sender: TObject);
begin
  if PopupGamesViewMode.Tag = TMenuItem(Sender).Tag then
     Exit;
  PopupGamesViewMode.Tag:= TMenuItem(Sender).Tag;
  ApplyFilter;
end;

procedure TFormMAMu_IconsManager.PopupSaveListToFileClick(Sender: TObject);
var
  Item: TEasyItem;
  ListOutput: THashedStringList;
  StrTemp, FileStr: String;
begin
  if not FormMain.CheckTotal(MissingIconsList) then
     Exit;

  FileStr:= FormMain.DialogSaveFile(4, 'Save Missing MAMu_ Icons List To a File');
  if FileStr = '' then
     Exit;

  ListOutput:= THashedStringList.Create;
  ListOutput.BeginUpdate;
  ListOutput.Add('----------> Missing MAMu_ Icons <----------'+#13#10);
  ListOutput.Add('  -> System: '+FormMain.GetEmulatorDescription(TMissingIconInfo(Item).eSystemID));
  ListOutput.Add('     Total Games: '+IntToStr(MissingIconsList.Groups.ItemCount)+#13#10);
  ListOutput.Add(Format('%16s %16s %16s %13s %7s %s', ['[Name]', '[Clone of]', '[Bios]', '[Driver Stat]', '[Mechncl]', '[Title]']));
  Item:= MissingIconsList.Groups.FirstItem;
  repeat
    case TMissingIconInfo(Item).eMechanical of
      False: StrTemp:= '';
      True : StrTemp:= 'Yes';
    end;
    ListOutput.Add(Format('%-16s %-16s %-16s %-13s %7s %s',
                   [TMissingIconInfo(Item).eName, TMissingIconInfo(Item).eClone, TMissingIconInfo(Item).eBiosName,
                    aStatus[TMissingIconInfo(Item).eDriverStatus], StrTemp, TMissingIconInfo(Item).eTitle]));
    Item:= MissingIconsList.Groups.NextItem(Item);
  until Item = nil;
  ListOutput.EndUpdate;
  ListOutput.SaveToFile(FileStr);
  FreeAndNil(ListOutput);
  GenerateMessage(FormMAMu_IconsManager.Caption, 'Save games list to a text file.',
                  Format('    File "%s" was created based on the current games list, '+
                         'separated by system.', [FileStr]), 2);
end;

procedure TFormMAMu_IconsManager.PopupRestoreColumnsSizesClick(Sender: TObject);
begin
  // column.position changes, column.index does not!!!
  MissingIconsList.Header.Columns[0].Width:= 270;
  MissingIconsList.Header.Columns[1].Width:= 85;
  MissingIconsList.Header.Columns[2].Width:= 85;
  MissingIconsList.Header.Columns[3].Width:= 85;
  MissingIconsList.Header.Columns[4].Width:= 90;
  MissingIconsList.Header.Columns[5].Width:= 80;
  MissingIconsList.Header.Columns[6].Width:= 170;
  MissingIconsList.Header.Columns[7].Width:= 85;
  Application.ProcessMessages;
end;

procedure TFormMAMu_IconsManager.PopupMissingIconsPopup(Sender: TObject);
begin
  PopupCopyIconZZZtoSelectedGames.Visible:= not (PopupGamesViewMode.Tag in [4, 5]);
end;

procedure TFormMAMu_IconsManager.PopupMissSearchforGameTitleClick(
  Sender: TObject);
var
  SearchString: String;
begin
  if not FormMain.CheckSelected(MissingIconsList) then
     Exit;

  case TMenuItem(Sender).Tag of
    0: SearchString:= TMissingIconInfo(SelectedItemMissing).eTitle;
    1: SearchString:= TMissingIconInfo(SelectedItemMissing).eManufacturer;
    2: SearchString:= TMissingIconInfo(SelectedItemMissing).eManufacturer+' '+TMissingIconInfo(SelectedItemMissing).eTitle;
  end;
  SearchString:= 'http://www.google.com/search?q='+SearchString;
  ShellExecute(Handle, 'open', PAnsiChar(SearchString), nil, nil, SW_SHOWNORMAL);
end;

procedure TFormMAMu_IconsManager.ButtonSystemClick(Sender: TObject);
begin
  SelectSystem;
end;

procedure TFormMAMu_IconsManager.ButtonScanBothClick(Sender: TObject);
begin
  if not ValidateMAMu_Folders then
     Exit;
  FormStatus.Show;
  FormStatus.StartThreadClock;
  FormStatus.TitleStr(FormMAMu_IconsManager.Caption);
  LoadGamesToMissingList(False);
  ScanFiles(False);
  FormStatus.Close;
end;

procedure TFormMAMu_IconsManager.ButtonScanMissingClick(Sender: TObject);
begin
  LoadGamesToMissingList;
end;

procedure TFormMAMu_IconsManager.ButtonScanNotUsedClick(Sender: TObject);
begin
  ScanFiles;
end;

procedure TFormMAMu_IconsManager.BitBtn3Click(Sender: TObject);
begin
  // missing icons
  CallMessageBox;
  FormMain.AddMsgText('Games With Missing Icons', $00a65300, [fsBold], taCenter);
  FormMain.AddMsgText(#13#10+'How to create a list of all games without an icon'+#13#10+#13#10, $00323232, [], taCenter, 8, 'Verdana');
  FormMain.AddMsgText('    Select a system. There are extra search options in popup menu. Click ');
  FormMain.AddMsgText('Scan Missing', $00a65300, [fsBold]);
  FormMain.AddMsgText(' button. Only one system can be listed at a time (no multiple lists).'+#13#10+
                      '    To create a snapshot, run selected game with ');
  FormMain.AddMsgText('Enter', $00a65300, [fsBold]);
  FormMain.AddMsgText(' key, mouse double-click or ');
  FormMain.AddMsgText('Play', $00a65300, [fsBold]);
  FormMain.AddMsgText(' in popup menu. You can remove games from the list after taking snapshots with ');
  FormMain.AddMsgText('Delete', $00a65300, [fsBold]);
  FormMain.AddMsgText(' key or ');
  FormMain.AddMsgText('Remove Selected', $00a65300, [fsBold]);
  FormMain.AddMsgText(' in popup menu.'+#13#10+
                      '    Use the popup menu to filter your games list. '+
                      'You can also export the list to a .txt file with ');
  FormMain.AddMsgText('Save Games List To File', $00a65300, [fsBold]);
  FormMain.AddMsgText('.'+#13#10+#13#10);
  FormMain.AddMsgText('Not Used Icons', $00a65300, [fsBold], taCenter);
  FormMain.AddMsgText(#13#10+'How to delete icon files that are not used by the games list'+#13#10+#13#10, $00323232, [], taCenter, 8, 'Verdana');
  FormMain.AddMsgText('    Select a system then click ');
  FormMain.AddMsgText('Scan Not Used', $00a65300, [fsBold]);
  FormMain.AddMsgText(' button. If you want to keep a file, remove it from the list with ');
  FormMain.AddMsgText('Delete', $00a65300, [fsBold]);
  FormMain.AddMsgText(' key or ');
  FormMain.AddMsgText('Remove Selected', $00a65300, [fsBold]);
  FormMain.AddMsgText(' in popup menu ');
  FormMain.AddMsgText('(files are not actually deleted).', $00323232, [fsItalic]);
  FormMain.AddMsgText(#13#10+
                      '    If needed, you can update ');
  FormMain.AddMsgText('el_dir\ini_files\el_mamu_exclude.ini', $00a65300, [fsBold]);
  FormMain.AddMsgText(' file with icon file names you want to exclude from the scan (you have to scan files again though).'+
                      #13#10+'You can also export the current list to a .txt file with ');
  FormMain.AddMsgText('Save To File', $00a65300, [fsBold]);
  FormMain.AddMsgText(' button.'+#13#10+
                      '    To edit icons, select one and press ');
  FormMain.AddMsgText('Enter', $00a65300, [fsBold]);
  FormMain.AddMsgText(' key, mouse double-click or ');
  FormMain.AddMsgText('Edit With Associated Editor', $00a65300, [fsBold]);
  FormMain.AddMsgText(' in popup menu.'+#13#10+
                      '    To rename an icon, press ');
  FormMain.AddMsgText('F2', $00a65300, [fsBold]);
  FormMain.AddMsgText(' key or ');
  FormMain.AddMsgText('Rename File', $00a65300, [fsBold]);
  FormMain.AddMsgText(' in the popup menu.'+#13#10+
                      'History files are stored in ');
  FormMain.AddMsgText('el_dir\icons_history\', $00a65300, [fsBold]);
  FormMain.AddMsgText(' folder as ');
  FormMain.AddMsgText('icon_filename.txt', $00a65300, [fsBold]);
  FormMain.AddMsgText(' format.'+#13#10+
                      '    After editing an icon, the info must be update manually with ');
  FormMain.AddMsgText('Update Icon Info', $00a65300, [fsBold]);
  FormMain.AddMsgText(' in popup menu.'+#13#10+
                      'Only 1 (one) system is supported at a time. Click ');
  FormMain.AddMsgText('Delete Not Used Icons', $00a65300, [fsBold]);
  FormMain.AddMsgText(' button to delete all files listed. Recycle bin is NOT supported.');
  GenerateMessage('Help', 'Usage tips.', '', 2);

  {GenerateMessage('Help', 'Usage tips.',
    '--> Games With Missing Icons <--'+#13#10+#13#10+
    '    How to create a list of all games without an icon. Select a system and then click on '+
    '"Scan Missing" button. If you want to search icons for clone games, '+
    'check "Search Icons for Clone Games" option in popup menu. Only one system can be '+
    'listed at a time (no multiple lists).'+#13#10+
    '    To create a snapshot, run the selected game by pressing ENTER key, mouse double-click '+
    'or selecting "Play" in the popup menu". After taking the snapshot you can remove the game '+
    'from the list by pressing DELETE key or selecting "Remove Selected" in the popup menu.'+#13#10+
    'In the popup menu you will find a games filter to list only parents, clones or bios. '+
    'You can also export the list to a .txt file, by using the "Save Games List To File" in popup menu.'+#13#10+#13#10+
    //'Do a mouse right-click to call the popup menu for more options. To create an icon select "Create [gamename] And Edit With Associated Editor". After you're done, select "Remove Game From List [system_name]" to delete the game from the list. Non-working games have a "Preliminary" driver status.

  // not used icons
    '--> Not Used Icons <--'+#13#10+#13#10+
    '    How to delete icon files that are not used by the games list. Select a system '+
    'then click "Scan Not Used" button. If you want to keep a file, remove it from the list '+
    'by pressing "DELETE" key or using the "Remove Selected" popup menu (files are not actually deleted).'+#13#10+
    '    If needed, you can update the file "<emuloader>\ini_files\el_mamu_exclude.ini" with file names that '+
    'you want to exclude from the scan (you have to scan files again though).'+#13#10+'You can also export the '+
    'current list to a .txt file by using the "Save To File" button.'+#13#10+
    ' You can edit icons by selecting one and pressing ENTER key, or mouse double-click or using the '+
    'popup menu.'+#13#10+
    ' To rename an icon, press "F2" hotkey or use "Rename File" option in the popup menu.'+#13#10+
    '    History files are stored in "el_folder\icons_history\" folder and the filename is the icon filename but '+
    'with ".txt" extension.'+#13#10+
    ' After editing an icon, the info needs to be update manually. Use "Update Icon Info" in popup menu.'+#13#10+
    '    Only 1 (one) system is supported at a time. Click "DELETE NOT USED ICONS" button to delete all files listed. '+
    'Recycle bin is NOT supported.', 2);}
end;

procedure TFormMAMu_IconsManager.MissingIconsListColumnSizeChanging(
  Sender: TCustomEasyListview; Column: TEasyColumn; Width,
  NewWidth: Integer; var Allow: Boolean);
begin
  if Column.Index = TEasyListView(Sender).Header.Columns.Count-1 then
     Allow:= False;
end;

function TFormMAMu_IconsManager.NotUsedIconsListItemCompare(
  Sender: TCustomEasyListview; Column: TEasyColumn; Group: TEasyGroup;
  Item1, Item2: TEasyItem; var DoDefault: Boolean): Integer;
begin
  if Column.Index = 0 then
     begin
       DoDefault:= False;
       if PopupNotUsedSortListbyFilenames.Checked then
          Result:= FormMain.iCompare(TNotUsedIconInfo(Item1).eFileName, TNotUsedIconInfo(Item2).eFileName)
       else
          Result:= CompareIntValue(TNotUsedIconInfo(Item2).eDateTime, TNotUsedIconInfo(Item1).eDateTime);
     end;
end;

procedure TFormMAMu_IconsManager.PopupNotUsedSortListbyFilenamesClick(
  Sender: TObject);
begin
  if not FormMain.CheckTotal(NotUsedIconsList) then
     Exit;
  NotUsedIconsList.BeginUpdate;
  NotUsedIconsList.Sort.SortAll;
  NotUsedIconsList.EndUpdate;
end;

end.
