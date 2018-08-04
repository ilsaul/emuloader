unit uImagesManager;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, ToolWin,
  ComCtrls, StdCtrls, ImgList, GraphicEx, GR32_Image, GR32, GR32_Resamplers,
  ExtCtrls, Buttons, Menus, BarMenus, MPCommonObjects, ShellAPI,
  MPCommonUtilities, EasyListview, IniFiles, uCommon, SplitterEx, PanelEx;

type
  TMissingImageInfo = class(TEasyItemStored)
  private
    fROMIdentification: Integer;
    fSystemID: ShortInt;
    fSystemType: ShortInt;
    fImageCategory: ShortInt;
    fTitle: WideString;
    fName: String;
    fClone: String;
    fCloneParent: String;
    fDriverName: String;
    fSoftwareName: String;
    fSoftwareTitle: WideString;
    fDriverStatus: ShortInt;
    fEmulationStatus: ShortInt;
    fColorStatus: ShortInt;
    fSoundStatus: ShortInt;
    fGraphicStatus: ShortInt;
    fIsFavorite: Boolean;
    fGameStatus: ShortInt; // 0 - have; 1 - missing ROMs/CHDs; 2 - miss
    fFoundImageMissingGame: String;
  protected
    function GetCaptions(Column: Integer): WideString; override;
    function GetImageIndexes(Column: Integer): TCommonImageIndexInteger; override;
    function GetStateImageIndexes(Column: Integer): TCommonImageIndexInteger; override;
  public
    property eROMIdentification: Integer read fROMIdentification write fROMIdentification;
    property eSystemID: ShortInt read fSystemID write fSystemID;
    property eSystemType: ShortInt read fSystemType write fSystemType;
    property eImageCategory: ShortInt read fImageCategory write fImageCategory;
    property eTitle: WideString read fTitle write fTitle;
    property eName: String read fName write fName;
    property eClone: String read fClone write fClone;
    property eCloneParent: String read fCloneParent write fCloneParent;
    property eDriverName: String read fDriverName write fDriverName;
    property eSoftwareName: String read fSoftwareName write fSoftwareName;
    property eSoftwareTitle: WideString read fSoftwareTitle write fSoftwareTitle;
    property eDriverStatus: ShortInt read fDriverStatus write fDriverStatus;
    property eEmulationStatus: ShortInt read fEmulationStatus write fEmulationStatus;
    property eColorStatus: ShortInt read fColorStatus write fColorStatus;
    property eSoundStatus: ShortInt read fSoundStatus write fSoundStatus;
    property eGraphicStatus: ShortInt read fGraphicStatus write fGraphicStatus;
    property eIsFavorite: Boolean read fIsFavorite write fIsFavorite;
    property eGameStatus: ShortInt read fGameStatus write fGameStatus;
    property eFoundImageMissingGame: String read fFoundImageMissingGame write fFoundImageMissingGame;
  end;

  TNotUsedImageInfo = class(TEasyItemStored)
  private
    fImageIndex: Integer;
    fImageLoaded: Boolean;
    fImageCategory: ShortInt;
    fFileName: String;
    fSize: Int64;
    fSizeText: String;
    fDateTime: Integer;
    fDateTimeText: String;
    fFullPath: String;
    fFullPathText: String;
    fNameOriginal: String;
  protected
    function GetCaptions(Column: Integer): WideString; override;
    function GetImageIndexes(Column: Integer): TCommonImageIndexInteger; override;
  public
    property eImageIndex: Integer read fImageIndex write fImageIndex;
    property eImageLoaded: Boolean read fImageLoaded write fImageLoaded;
    property eImageCategory: ShortInt read fImageCategory write fImageCategory;
    property eFileName: String read fFileName write fFileName;
    property eSize: Int64 read fSize write fSize;
    property eSizeText: String read fSizeText write fSizeText;
    property eDateTime: Integer read fDateTime write fDateTime;
    property eDateTimeText: String read fDateTimeText write fDateTimeText;
    property eFullPath: String read fFullPath write fFullPath;
    property eFullPathText: String read fFullPathText write fFullPathText;
    property eNameOriginal: String read fNameOriginal write fNameOriginal;
  end;

type
  TFormImagesManager = class(TForm)
    IL_Buttons: TImageList;
    IL_SystemsImages: TImageList;
    MissingImagesList: TEasyListview;
    PanelNotUsed: TPanel;
    BottomBar: TCoolBar;
    ImagePreview: TImage32;
    NotUsedImagesList: TEasyListview;
    PopupMissingImages: TBcBarPopupMenu;
    PopupPlayGame: TMenuItem;
    N2: TMenuItem;
    PopupSearchCloneImages: TMenuItem;
    PopupScanMissingGames: TMenuItem;
    PopupScanBiosGames: TMenuItem;
    N1: TMenuItem;
    PopupMissingRemoveSelected: TMenuItem;
    PopupMissingClearList: TMenuItem;
    PopupShowAllGames: TMenuItem;
    PopupShowParentGamesOnly: TMenuItem;
    PopupShowCloneGamesOnly: TMenuItem;
    N3: TMenuItem;
    PopupMissingSaveToFile: TMenuItem;
    LabelTotalItemsMissing: TLabel;
    LabelTotalItemsNotUsed: TLabel;
    ButtonInvalidImagesDeleteFiles: TSpeedButton;
    PopupGamesFilter: TMenuItem;
    PopupRestoreColumnsSizes: TMenuItem;
    IL_NotUsedImages: TImageList;
    PopupNotUsedIcons: TBcBarPopupMenu;
    PopupNotUsedViewFullScreen: TMenuItem;
    PopupNotUsedRenameFile: TMenuItem;
    MenuItem1: TMenuItem;
    PopupNotUsedUpdateIconInfoSelectedIcons: TMenuItem;
    PopupNotUsedUpdateIconInfoAllIcons: TMenuItem;
    N7: TMenuItem;
    PopupNotUsedClearFilesList: TMenuItem;
    PopupNotUsedRemoveSelected: TMenuItem;
    PopupNotUsedRemoveRenamedIcons: TMenuItem;
    PopupMoveSelectedToFolder: TMenuItem;
    N4: TMenuItem;
    PopupNotUsedSaveIconsListToFile: TMenuItem;
    IL_ImageCategory: TImageList;
    SplitterList: TSplitterEx;
    SplitterNotUsed: TSplitterEx;
    PopupScanDeviceSets: TMenuItem;
    PanelToolBarButtons: TPanelEx;
    ImageCategoryIcon: TImage;
    ButtonImageCategory: TBitBtn;
    ButtonHelp: TBitBtn;
    ButtonScanMissing: TBitBtn;
    ButtonScanInvalidImages: TBitBtn;
    PopupScanSoftwareListGames: TMenuItem;
    PopupScanNonArcadeMachines: TMenuItem;
    N5: TMenuItem;
    ButtonScanNotUsedImages: TBitBtn;
    ButtonNotUsedImagesDeleteFiles: TSpeedButton;
    PopupScanArcadeMachines: TMenuItem;
    procedure FormShow(Sender: TObject);
    procedure MissingImagesListColumnClick(Sender: TCustomEasyListview;
      Button: TCommonMouseButton; ShiftState: TShiftState;
      const Column: TEasyColumn);
    procedure MissingImagesListDblClick(Sender: TCustomEasyListview;
      Button: TCommonMouseButton; MousePos: TPoint;
      ShiftState: TShiftState; var Handled: Boolean);
    function MissingImagesListItemCompare(Sender: TCustomEasyListview;
      Column: TEasyColumn; Group: TEasyGroup; Item1, Item2: TEasyItem;
      var DoDefault: Boolean): Integer;
    procedure MissingImagesListItemPaintText(Sender: TCustomEasyListview;
      Item: TEasyItem; Position: Integer; ACanvas: TCanvas);
    procedure MissingImagesListItemSelectionChanged(
      Sender: TCustomEasyListview; Item: TEasyItem);
    procedure MissingImagesListKeyAction(Sender: TCustomEasyListview;
      var CharCode: Word; var Shift: TShiftState; var DoDefault: Boolean);
    procedure MissingImagesListColumnSizeChanged(
      Sender: TCustomEasyListview; Column: TEasyColumn);
    procedure PopupPlayGameClick(Sender: TObject);
    procedure FormCanResize(Sender: TObject; var NewWidth,
      NewHeight: Integer; var Resize: Boolean);
    procedure FormActivate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure PopupMissingClearListClick(Sender: TObject);
    procedure PopupMissingRemoveSelectedClick(Sender: TObject);
    procedure PopupShowAllGamesClick(Sender: TObject);
    procedure PopupRestoreColumnsSizesClick(Sender: TObject);
    procedure PopupMissingImagesMeasureMenuItem(Sender: TObject;
      AMenuItem: TMenuItem; ACanvas: TCanvas; var Width, Height: Integer;
      ABarVisible: Boolean; var DefaultMeasure: Boolean);
    procedure PopupMissingSaveToFileClick(Sender: TObject);
    procedure NotUsedImagesListItemPaintText(Sender: TCustomEasyListview;
      Item: TEasyItem; Position: Integer; ACanvas: TCanvas);
    procedure NotUsedImagesListItemSelectionChanged(
      Sender: TCustomEasyListview; Item: TEasyItem);
    procedure NotUsedImagesListKeyAction(Sender: TCustomEasyListview;
      var CharCode: Word; var Shift: TShiftState; var DoDefault: Boolean);
    procedure PopupNotUsedRemoveSelectedClick(Sender: TObject);
    procedure PopupNotUsedUpdateIconInfoSelectedIconsClick(
      Sender: TObject);
    procedure PopupNotUsedClearFilesListClick(Sender: TObject);
    procedure PopupNotUsedRemoveRenamedIconsClick(Sender: TObject);
    procedure PopupMoveSelectedToFolderClick(Sender: TObject);
    procedure PopupNotUsedSaveIconsListToFileClick(Sender: TObject);
    procedure ImagePreviewClick(Sender: TObject);
    procedure PopupNotUsedViewFullScreenClick(Sender: TObject);
    procedure PopupNotUsedRenameFileClick(Sender: TObject);
    procedure NotUsedImagesListDblClick(Sender: TCustomEasyListview;
      Button: TCommonMouseButton; MousePos: TPoint;
      ShiftState: TShiftState; var Handled: Boolean);
    procedure ButtonInvalidImagesDeleteFilesClick(Sender: TObject);
    procedure SplitterListMoved(Sender: TObject);
    procedure ButtonImageCategoryClick(Sender: TObject);
    procedure ButtonHelpClick(Sender: TObject);
    procedure ButtonScanMissingClick(Sender: TObject);
    procedure ButtonScanInvalidImagesClick(Sender: TObject);
    procedure MissingImagesListColumnSizeChanging(
      Sender: TCustomEasyListview; Column: TEasyColumn; Width,
      NewWidth: Integer; var Allow: Boolean);
    procedure ButtonScanNotUsedImagesClick(Sender: TObject);
    procedure ButtonNotUsedImagesDeleteFilesClick(Sender: TObject);
  private
    { Private declarations }
    SelectedItemMissing, SelectedItemNotUsed: TEasyItem;

    // image preview form, dinamically created...
    FormImageFoundMissingGame: TForm;
    SnapPreview: TImage32;

    procedure SelectImageCategory;

    procedure ReadIniFile;
    procedure WriteIniFile;

    function  ValidateImageFolder: Boolean;

    // missing images / not used images functions
    procedure ShowPreviewImage; // for Scan Not Used Images
    procedure SetSelectedMissingGame(AutoSelect: Boolean = True);
    procedure UpdateTotalGamesLabelMissing;
    procedure ClearSelectedMissing;

    function  LoadGamesToMissingList(ShowFolderMessage: Boolean = True): Boolean; // scan all games for missing images
    function  ScanNotUsedImagesToMissingList(ShowFolderMessage: Boolean = True): Boolean; // scan missing games for available images

    procedure CreateImagePanelForm;
    procedure FreeImagePanelForm;

    //function  SearchName(GameName: String): TEasyItem;

    // not used images functions
    function  RenameImageFile(OldName, NewName, FilePath: String): Boolean;
    procedure ClearSelectedNotUsed;
    procedure UpdateTotalFilesLabelNotUsed;
    procedure ScanFiles(ShowFolderMessage: Boolean = True);
    function  LoadImageNotUsed(const ImageName: String): Integer;
    procedure ViewImageFullScreen;
    procedure ResetNotUsedImagesList;
  public
    { Public declarations }
  end;

var
  FormImagesManager: TFormImagesManager;

implementation

uses uMain, uStatus, uRenameImageFile;//, uRenameFile;

{$R *.dfm}

function TMissingImageInfo.GetCaptions(Column: Integer): WideString;
begin
  case Column of
    0: Result:= eTitle;
    1: Result:= eName;
    2: Result:= eClone;
    3: Result:= eSoftwareTitle;
    4: Result:= eDriverName;
    5: Result:= aStatus[eDriverStatus];
    20:
      begin
        Result:= eName;
        if FormMain.GameIsClone(eClone) then
           Result:= Result+'  ['+eClone+']';
      end;
  end;
end;

function TMissingImageInfo.GetImageIndexes(Column: Integer): TCommonImageIndexInteger;
begin
  case Column of
    0: Result:= FormMain.GetMAMEImageIndex(eROMIdentification, eSoftwareName);
  else
       Result:= -1;
  end;
end;

function TMissingImageInfo.GetStateImageIndexes(Column: Integer): TCommonImageIndexInteger;
begin
  Result:= -1;
  case Column of
    0:
      begin
        case eIsFavorite of
          True : Result:= 3;
          False: Result:= 100; // non-existing index to show an empty space in place of the fav icon
        end;
      end;
    5: Result:= eDriverStatus;
    6: Result:= eEmulationStatus;
    7: Result:= eColorStatus;
    8: Result:= eSoundStatus;
    9: Result:= eGraphicStatus;
  end;
end;

function TNotUsedImageInfo.GetCaptions(Column: Integer): WideString;
begin
  case Column of
    0: Result:= eFileName;
    1: Result:= eSizeText+'  '+eDateTimeText;
    2: Result:= eFullPath;
  end;
end;

function TNotUsedImageInfo.GetImageIndexes(Column: Integer): TCommonImageIndexInteger;
begin
  case Column of
    0:
      begin
        case eImageLoaded of
          True : Result:= eImageIndex;
          False:
            begin
              eImageIndex:= FormImagesManager.LoadImageNotUsed(IncludeTrailingPathDelimiter(eFullPath)+eFileName);
              eImageLoaded:= eImageIndex <> -1;
              Result:= eImageIndex;
            end;
        end;
      end;
  else
       Result:= -1;
  end;
end;

procedure TFormImagesManager.SelectImageCategory;
var
  selCat: ShortInt;
begin
  selCat:= FormMain.CallSelectImageCategory(ButtonImageCategory.Tag, False, True, True);
  if selCat = -1 then
     Exit;
  ButtonImageCategory.Tag:= selCat;
  ButtonImageCategory.Caption:= GetImageCategoryTitle(ButtonImageCategory.Tag);
  FormMain.LoadIconIntoImage(ImageCategoryArray[ButtonImageCategory.Tag, 0], ImageCategoryIcon);
end;

procedure TFormImagesManager.ReadIniFile;
var
  INIFile: TMemIniFile;
  Loop: Integer;
begin
  try
    INIFile:= TMemIniFile.Create(FormMain.GetFrontendExtraIniFile);
    FormImagesManager.Tag:= Ord(INIFile.ReadString('ImagesManager', 'WindowState', 'Normal') = 'Maximized');
    FormImagesManager.Width:= INIFile.ReadInteger('ImagesManager', 'ScreenWidth', 1200);
    FormImagesManager.Height:= INIFile.ReadInteger('ImagesManager', 'ScreenHeight', 600);
    FormImagesManager.Left:= INIFile.ReadInteger('ImagesManager', 'ScreenLeft', (Screen.Width shr 1)-(Width shr 1)-1);
    FormImagesManager.Top:= INIFile.ReadInteger('ImagesManager', 'ScreenTop', (Screen.Height shr 1)-(Height shr 1)-1);
    PanelNotUsed.Width:= INIFile.ReadInteger('ImagesManager', 'MainSplitterPos', 594);
    ImagePreview.Height:= INIFile.ReadInteger('ImagesManager', 'ImageSplitterPos', 200);

    PopupSearchCloneImages.Checked:= Boolean(INIFile.ReadInteger('ImagesManager', 'SearchCloneImages', 0));
    PopupScanMissingGames.Checked:= Boolean(INIFile.ReadInteger('ImagesManager', 'ScanMissingGames', 0));
    PopupScanBiosGames.Checked:= Boolean(INIFile.ReadInteger('ImagesManager', 'ScanBiosSets', 0));
    PopupScanDeviceSets.Checked:= Boolean(INIFile.ReadInteger('ImagesManager', 'ScanDeviceSets', 0));
    PopupScanArcadeMachines.Checked:= Boolean(INIFile.ReadInteger('ImagesManager', 'ScanArcadeMachines', 1));
    PopupScanSoftwareListGames.Checked:= Boolean(INIFile.ReadInteger('ImagesManager', 'ScanSoftwareListGames', 0));
    PopupScanNonArcadeMachines.Checked:= Boolean(INIFile.ReadInteger('ImagesManager', 'ScanNonArcadeMachines', 1));

    for Loop:=0 to 3 do
        MissingImagesList.Header.Columns[Loop].Width:= INIFile.ReadInteger('ImagesManager', 'MissingListColWidth_'+IntToStr(Loop),
                                                      MissingImagesList.Header.Columns[Loop].Width);
  finally
    FreeAndNil(INIFile);
  end;
end;

procedure TFormImagesManager.WriteIniFile;
var
  INIFile: TMemIniFile;
  Loop: Integer;
begin
  try
    INIFile:= TMemIniFile.Create(FormMain.GetFrontendExtraIniFile);
    INIFile.EraseSection('ImagesManager');
    case FormImagesManager.WindowState of
      wsNormal   : INIFile.WriteString('ImagesManager', 'WindowState', 'Normal');
      wsMaximized: INIFile.WriteString('ImagesManager', 'WindowState', 'Maximized');
      else
        INIFile.WriteString('ImagesManager', 'WindowState', 'Normal');
    end;
    if FormImagesManager.WindowState <> wsMaximized then
       begin
         INIFile.WriteInteger('ImagesManager', 'ScreenTop', FormImagesManager.Top);
         INIFile.WriteInteger('ImagesManager', 'ScreenLeft', FormImagesManager.Left);
         INIFile.WriteInteger('ImagesManager', 'ScreenWidth', FormImagesManager.Width);
         INIFile.WriteInteger('ImagesManager', 'ScreenHeight', FormImagesManager.Height);
       end;
    INIFile.WriteInteger('ImagesManager', 'MainSplitterPos', PanelNotUsed.Width);
    INIFile.WriteInteger('ImagesManager', 'ImageSplitterPos', ImagePreview.Height);

    INIFile.WriteInteger('ImagesManager', 'SearchCloneImages', Ord(PopupSearchCloneImages.Checked));
    INIFile.WriteInteger('ImagesManager', 'ScanMissingGames', Ord(PopupScanMissingGames.Checked));
    INIFile.WriteInteger('ImagesManager', 'ScanBiosSets', Ord(PopupScanBiosGames.Checked));
    INIFile.WriteInteger('ImagesManager', 'ScanDeviceSets', Ord(PopupScanDeviceSets.Checked));
    INIFile.WriteInteger('ImagesManager', 'ScanArcadeMachines', Ord(PopupScanArcadeMachines.Checked));
    INIFile.WriteInteger('ImagesManager', 'ScanSoftwareListGames', Ord(PopupScanSoftwareListGames.Checked));
    INIFile.WriteInteger('ImagesManager', 'ScanNonArcadeMachines', Ord(PopupScanNonArcadeMachines.Checked));

    for Loop:=0 to 3 do
        INIFile.WriteInteger('ImagesManager', 'MissingListColWidth_'+IntToStr(Loop), MissingImagesList.Header.Columns[Loop].Width);

    INIFile.UpdateFile;
  finally
    FreeAndNil(INIFile);
  end;
end;

function TFormImagesManager.ValidateImageFolder: Boolean;
var
  tmpFolder: String;
begin
  tmpFolder:= FormMain.GetFolderFull(ButtonImageCategory.Tag, idMAME);
  Result:= tmpFolder <> '';// DirectoryExists(tmpFolder);
  if Result then
     Exit;

  if GenerateMessage('Error', FormMain.GetArcadeEmulatorDescription(idMAME),
                     'No folder is selected for '+ButtonImageCategory.Caption+'. Would you like to select one now ?', 1) = mrYes then
     begin
       FormMain.MenuImageCategorySettings.Click;
       ValidateImageFolder;
       //tmpFolder:= FormMain.GetFolderFull(ButtonImageCategory.Tag, ButtonSystem.Tag);
       //Result:= DirectoryExists(tmpFolder);
     end;
end;

procedure TFormImagesManager.ShowPreviewImage;
var
  iFileExt: String;
  iType: TImageType;
begin
  if FormImageFoundMissingGame = nil then
     Exit;
  if TMissingImageInfo(SelectedItemMissing).eFoundImageMissingGame = '' then
     Exit;
  if not FileExistsW(TMissingImageInfo(SelectedItemMissing).eFoundImageMissingGame) then
     Exit;

  iType:= FormMain.LoadPreviewImage(TMissingImageInfo(SelectedItemMissing).eFoundImageMissingGame, SnapPreview);
  iFileExt:= ExtractFileExtW(TMissingImageInfo(SelectedItemMissing).eFoundImageMissingGame);

  //SnapPreview.Bitmap.LoadFromFile(TMissingImageInfo(SelectedItemMissing).eFoundImageMissingGame);
  if FormImageFoundMissingGame.Tag = 1 then
     begin
       FormImageFoundMissingGame.ClientWidth:= SnapPreview.Bitmap.Width;
       FormImageFoundMissingGame.ClientHeight:= SnapPreview.Bitmap.Height;
     end;
end;

procedure TFormImagesManager.SetSelectedMissingGame(AutoSelect: Boolean = True);
begin
  if SelectedItemMissing = nil then
     Exit;
  if not AutoSelect then
     begin
       TMissingImageInfo(SelectedItemMissing).Selected:= True;
       MissingImagesList.Selection.FocusedItem:= SelectedItemMissing;
       SelectedItemMissing.MakeVisible(emvMiddle); //(emvAuto);
     end;
  FormMain.ELV_SetSelectRibbon(TMissingImageInfo(SelectedItemMissing).eGameStatus, MissingImagesList);
  if LabelTotalItemsMissing.Tag = 1 then
     ShowPreviewImage;
end;

procedure TFormImagesManager.UpdateTotalGamesLabelMissing;
begin
  case LabelTotalItemsMissing.Tag of
    0: LabelTotalItemsMissing.Caption:= ' '+IntToStr(MissingImagesList.Groups.ItemCount)+' Missing Images';
    1: LabelTotalItemsMissing.Caption:= ' '+IntToStr(MissingImagesList.Groups.ItemCount)+' Images Found';
  end;
end;

procedure TFormImagesManager.ClearSelectedMissing;
begin
  MissingImagesList.Selection.ClearAll;
  SelectedItemMissing:= nil;
end;

function TFormImagesManager.LoadGamesToMissingList(ShowFolderMessage: Boolean = True): Boolean;
var
  tempFolder, ExtraFolderStrMAME, SoftwareNameDir: String;
  NewMAMESnapName: String; // used by in-game snapshot only "gamename\0000.png"
  ImageFound, SearchFile: Boolean;
  ELFormat: String;

  gItem, Item: TEasyItem;
  gGroup: TEasyGroup;

  function AddItem: Boolean;
  begin
    Result:= FormMain.TempGameVars.eSystemID = idMAME;
    if not Result then
       Exit;

    case FormMain.GameIsClone(FormMain.TempGameVars.eClone) of
      True : SearchFile:= PopupSearchCloneImages.Checked;
      False: SearchFile:= True;
    end;

    if SearchFile and ((FormMain.TempGameVars.eSystemType = 0) and (FormMain.TempGameVars.eSoftwareName = '')) then
       SearchFile:= PopupScanArcadeMachines.Checked;

    if SearchFile and (FormMain.TempGameVars.eSoftwareName <> '') then
       SearchFile:= PopupScanSoftwareListGames.Checked;

    //if SearchFile and (not PopupScanSoftwareListGames.Checked) then
    //   SearchFile:= FormMain.TempGameVars.eSoftwareName = '';

    if SearchFile and ((FormMain.TempGameVars.eSystemType = 1) and (FormMain.TempGameVars.eSoftwareName = '')) then
       SearchFile:= PopupScanNonArcadeMachines.Checked; // 0 -> arcade; 1 -> non-arcade (MESS machines); this requires mess.ini

    if SearchFile and (not PopupScanDeviceSets.Checked) then
       begin
         SearchFile:= not FormMain.IsROM_Device(FormMain.TempGameVars.eROMIdentification);
         if SearchFile then
            SearchFile:= FormMain.GameHaveROMs(FormMain.TempGameVars.eHaveGameROMs);
       end;
    if SearchFile and (not PopupScanMissingGames.Checked) then
       SearchFile:= FormMain.IsROM_Have(FormMain.TempGameVars.eROMIdentification);
    if SearchFile and (not PopupScanBiosGames.Checked) then
       SearchFile:= not FormMain.IsROM_Bios(FormMain.TempGameVars.eROMIdentification);

    Result:= SearchFile;
    if not Result then
       Exit;
       
    if SearchFile then
       begin
         ELFormat:=  FormMain.GetImageName(FormMain.TempGameVars.eName, ButtonImageCategory.Tag, 0);//, FormMain.TempGameVars.eSoftwareName);
         SoftwareNameDir:= FormMain.TempGameVars.eSoftwareName;
         if SoftwareNameDir <> '' then
            SoftwareNameDir:= SoftwareNameDir+'\';
         NewMAMESnapName:= ''; // used by in-game snapshot only "gamename\0000.png"
         // EL format
         ImageFound:= FileExists(tempFolder+SoftwareNameDir+ELFormat+'.png'); // search unzipped image
         if (not ImageFound) and (not FormMain.ImagesPNGOnly(ButtonImageCategory.Tag)) then
            ImageFound:= FileExists(tempFolder+SoftwareNameDir+ELFormat+'.jpg');

         if (not ImageFound) and FormMain.IsMAMEBasedSys(FormMain.TempGameVars.eSystemID) then
            begin
              ImageFound:= FileExists(tempFolder+ExtraFolderStrMAME+SoftwareNameDir+ELFormat+'.png'); // search unzipped image
              if (not ImageFound) and (not FormMain.ImagesPNGOnly(ButtonImageCategory.Tag)) then
                 ImageFound:= FileExists(tempFolder+ExtraFolderStrMAME+SoftwareNameDir+ELFormat+'.jpg');

              if (not ImageFound) and (ButtonImageCategory.Tag = 1) then
              begin
                // for game snapshots only
                NewMAMESnapName:= FormMain.GetImageName(FormMain.TempGameVars.eName, ButtonImageCategory.Tag, 1);//, FormMain.TempGameVars.eSoftwareName); // used by in-game snapshot only "gamename\0000.png"

                ImageFound:= FileExists(tempFolder+SoftwareNameDir+NewMAMESnapName+'.png'); // search unzipped image
                if (not ImageFound) and (not FormMain.ImagesPNGOnly(ButtonImageCategory.Tag)) then
                   ImageFound:= FileExists(tempFolder+SoftwareNameDir+NewMAMESnapName+'.jpg');
              end;
            end;
       end;

    if not ImageFound then
       begin
         FormMain.TempGameVars.eImageIndex:= FormMain.TempGameVars.eROMIdentification;
         Item:= MissingImagesList.Items.AddCustom(TMissingImageInfo, nil);
         TMissingImageInfo(Item).eROMIdentification:= FormMain.TempGameVars.eROMIdentification;
         TMissingImageInfo(Item).eSystemID:= FormMain.TempGameVars.eSystemID;
         TMissingImageInfo(Item).eSystemType:= FormMain.TempGameVars.eSystemType;
         TMissingImageInfo(Item).eImageCategory:= ButtonImageCategory.Tag;
         TMissingImageInfo(Item).eTitle:= FormMain.TempGameVars.eTitle;
         TMissingImageInfo(Item).eName:= FormMain.TempGameVars.eName;
         TMissingImageInfo(Item).eClone:= FormMain.TempGameVars.eClone;
         case FormMain.GameIsClone(FormMain.TempGameVars.eClone) of
           True : TMissingImageInfo(Item).eCloneParent:= FormMain.TempGameVars.eClone;
           False: TMissingImageInfo(Item).eCloneParent:= FormMain.TempGameVars.eName;
         end;
         TMissingImageInfo(Item).eSoftwareName:= FormMain.TempGameVars.eSoftwareName;
         if FormMain.TempGameVars.eSoftwareName <> '' then
            TMissingImageInfo(Item).eSoftwareTitle:= FormMain.TempGameVars.eCategory
         else
            TMissingImageInfo(Item).eSoftwareTitle:= '';
         TMissingImageInfo(Item).eDriverName:= FormMain.TempGameVars.eDriverName;
         TMissingImageInfo(Item).eDriverStatus:= FormMain.TempGameVars.eDriverStatus;
         TMissingImageInfo(Item).eEmulationStatus:= FormMain.TempGameVars.eEmulationStatus;
         TMissingImageInfo(Item).eColorStatus:= FormMain.TempGameVars.eColorStatus;
         TMissingImageInfo(Item).eSoundStatus:= FormMain.TempGameVars.eSoundStatus;
         TMissingImageInfo(Item).eGraphicStatus:= FormMain.TempGameVars.eGraphicStatus;
         TMissingImageInfo(Item).eIsFavorite:= FormMain.TempGameVars.eIsFavorite;
         TMissingImageInfo(Item).eGameStatus:= FormMain.TempGameVars.eGameSetStatus;
         TMissingImageInfo(Item).eFoundImageMissingGame:= ''; // not used in this function!
         Item.Details[1]:= 20;
       end;
    Application.ProcessMessages;
  end;

begin
  Result:= FormMain.CheckTotal(FormMain.GamesListView);
  if not Result then
     Exit;

  FreeImagePanelForm;
  if ShowFolderMessage then
     begin
       if not ValidateImageFolder then
          Exit;
       FormStatus.Show;
       FormStatus.StartThreadClock;
       FormStatus.TitleStr(FormImagesManager.Caption);
     end;
  LabelTotalItemsMissing.Tag:= 0;
  FormStatus.MessageStr('Scanning for games with missing images');
  tempFolder:= FormMain.GetFolderFull(ButtonImageCategory.Tag, idMAME); // [imgType, sysID]

  ExtraFolderStrMAME:= ImageCategoryArray[ButtonImageCategory.Tag, 3]+'\';

  ButtonNotUsedImagesDeleteFiles.Visible:= False;
  FormMain.ClearListView(MissingImagesList);
  MissingImagesList.BeginUpdate;
  MissingImagesList.Items.ReIndexDisable:= True;

  if FormMain.IsGroupedView then
  begin
    gGroup:= FormMain.GamesListView.Groups.FirstGroup;
    repeat
      gItem:= FormMain.GamesListView.Groups.FirstInGroup(gGroup);
      repeat
        FormMain.FillTempGameInfo(gItem);
        AddItem;
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
      AddItem;
      gItem:= FormMain.GamesListView.Groups.NextItem(gItem);
    until gItem = nil;
  end;
  MissingImagesList.Items.ReIndexDisable:= False;
  MissingImagesList.Sort.SortAll;
  MissingImagesList.EndUpdate;
  Result:= FormMain.CheckTotal(MissingImagesList);
  UpdateTotalGamesLabelMissing;
  if ShowFolderMessage then
     FormStatus.Close;

  case Result of
    True:
      begin
        MissingImagesList.Groups.FirstGroup.Caption:= ButtonImageCategory.Caption+' [Scan Missing Images]';
        MissingImagesList.Groups.FirstGroup.ImageIndex:= ButtonImageCategory.Tag;
      end;
    False:
      begin
        FormMain.ClearListView(MissingImagesList);
        GenerateMessage(FormImagesManager.Caption, FormMain.GetArcadeEmulatorDescription(idMAME),
                           '    Scan complete, but it seems that all games have images. If you want to more scan options, '+
                           'open the popup menu (mouse right-click).', 2);
      end;
  end;
end;

procedure TFormImagesManager.CreateImagePanelForm;

  function ReadSettingsF: Boolean;
  var
    sIni: TMemIniFile;
  begin
    if not FileExists(FormMain.GetFrontendExtraIniFile) then
       Exit;

    sIni:= TMemIniFile.Create(FormMain.GetFrontendExtraIniFile);

    FormImageFoundMissingGame.Tag:= sIni.ReadInteger('ImagesManager_SnapPreview', 'AdjustWindowToSnapSize', 1);
    FormImageFoundMissingGame.Width:= sIni.ReadInteger('ImagesManager_SnapPreview', 'ScreenWidth', 320);
    FormImageFoundMissingGame.Height:= sIni.ReadInteger('ImagesManager_SnapPreview', 'ScreenHeight', 240);
    FormImageFoundMissingGame.Left:= sIni.ReadInteger('ImagesManager_SnapPreview', 'ScreenLeft', (Screen.Width shr 1)-(Width shr 1)-1);
    FormImageFoundMissingGame.Top:= sIni.ReadInteger('ImagesManager_SnapPreview', 'ScreenTop', (Screen.Height shr 1)-(Height shr 1)-1);

    FreeAndNil(sIni);
  end;

begin
  if not Assigned(FormImageFoundMissingGame) then
     begin
       FormImageFoundMissingGame:= TForm.Create(FormImagesManager);
       FormImageFoundMissingGame.DefaultMonitor:= dmMainForm;
       FormImageFoundMissingGame.BorderStyle:= bsSizeToolWin;
       FormImageFoundMissingGame.BorderIcons:= [biSystemMenu];
       FormImageFoundMissingGame.Scaled:= False;
       FormImageFoundMissingGame.Width:= 320;
       FormImageFoundMissingGame.Height:= 240;
       FormImageFoundMissingGame.Font.Name:= 'Segoe UI';
       FormImageFoundMissingGame.Font.Size:= 9;
       FormImageFoundMissingGame.Font.Color:= clBlack;
       FormImageFoundMissingGame.Tag:= 1; // always adjust window to image size... no stretch
       FormImageFoundMissingGame.Caption:= 'Not Used Image';

       SnapPreview:= TImage32.Create(FormImageFoundMissingGame);
       SnapPreview.Parent:= FormImageFoundMissingGame;
       SnapPreview.Align:= alClient;
       SnapPreview.Color:= clBlack;
       SnapPreview.ScaleMode:= smResize;
       //SnapPreview.Bitmap.DrawMode:= dmBlend;

       FormImageFoundMissingGame.FormStyle:= fsStayOnTop;
       ReadSettingsF;
     end;
  if not FormImageFoundMissingGame.Visible then
     begin
       FormImageFoundMissingGame.Show;
       //FormImageFoundMissingGame.BringToFront; // might not be needed
     end;
end;

procedure TFormImagesManager.FreeImagePanelForm;

  function WriteSettingsF: Boolean;
  var
    sIni: TMemIniFile;
  begin
    if FormMain.CheckReadOnly(FormMain.GetFrontendExtraIniFile) then
       Exit;

    sIni:= TMemIniFile.Create(FormMain.GetFrontendExtraIniFile);
    sIni.EraseSection('ImagesManager_SnapPreview');

    sIni.WriteInteger('ImagesManager_SnapPreview', 'AdjustWindowToSnapSize', FormImageFoundMissingGame.Tag);
    sIni.WriteInteger('ImagesManager_SnapPreview', 'ScreenTop', FormImageFoundMissingGame.Top);
    sIni.WriteInteger('ImagesManager_SnapPreview', 'ScreenLeft', FormImageFoundMissingGame.Left);
    sIni.WriteInteger('ImagesManager_SnapPreview', 'ScreenWidth', FormImageFoundMissingGame.Width);
    sIni.WriteInteger('ImagesManager_SnapPreview', 'ScreenHeight', FormImageFoundMissingGame.Height);

    sIni.UpdateFile;
    FreeAndNil(sIni);
  end;
  
begin
  if FormImageFoundMissingGame = nil then
     Exit;
  WriteSettingsF;
  SnapPreview.Bitmap:= nil;
  //SnapPreview:= nil;
  //SnapPreview.Free;

  //FormImageFoundMissingGame:= nil;
  //FormImageFoundMissingGame.Free;
  FreeAndNil(SnapPreview);
  FreeAndNil(FormImageFoundMissingGame);
end;

function TFormImagesManager.ScanNotUsedImagesToMissingList(ShowFolderMessage: Boolean = True): Boolean;
var
  tempFolder, ExtraFolderStrMAME, SoftwareNameDir, FileFullPath: String;
  ImageFound, SearchFile: Boolean;
  ELFormat, NewMAMESnapName: String;

  gItem, Item: TEasyItem;
  gGroup: TEasyGroup;

  function AddItem: Boolean;
  begin
    Result:= FormMain.TempGameVars.eSystemID = idMAME;
    if not Result then
       Exit;

    Result:= FormMain.IsROM_Miss(FormMain.TempGameVars.eROMIdentification) and (not FormMain.IsROM_HaveMissROMs(FormMain.TempGameVars.eGameSetStatus));
    if not Result then
       Exit;
       
    case FormMain.GameIsClone(FormMain.TempGameVars.eClone) of
      True : SearchFile:= PopupSearchCloneImages.Checked;
      False: SearchFile:= True;
    end;

    if SearchFile and ((FormMain.TempGameVars.eSystemType = 0) and (FormMain.TempGameVars.eSoftwareName = '')) then
       SearchFile:= PopupScanArcadeMachines.Checked;

    if SearchFile and (FormMain.TempGameVars.eSoftwareName <> '') then
       SearchFile:= PopupScanSoftwareListGames.Checked;

    if SearchFile and ((FormMain.TempGameVars.eSystemType = 1) and (FormMain.TempGameVars.eSoftwareName = '')) then
       SearchFile:= PopupScanNonArcadeMachines.Checked; // 0 -> arcade; 1 -> non-arcade (MESS machines); this requires mess.ini

    if SearchFile and (not PopupScanDeviceSets.Checked) then
       begin
         SearchFile:= not FormMain.IsROM_Device(FormMain.TempGameVars.eROMIdentification);
         if SearchFile then
            SearchFile:= FormMain.GameHaveROMs(FormMain.TempGameVars.eHaveGameROMs);
       end;
       
    if SearchFile and (not PopupScanBiosGames.Checked) then
       SearchFile:= not FormMain.IsROM_Bios(FormMain.TempGameVars.eROMIdentification);

    Result:= SearchFile;
    if not Result then
       Exit;
       
    if SearchFile then
       begin
         ELFormat:= FormMain.GetImageName(FormMain.TempGameVars.eName, ButtonImageCategory.Tag, 0);//, FormMain.TempGameVars.eSoftwareName);
         SoftwareNameDir:= FormMain.TempGameVars.eSoftwareName;
         if SoftwareNameDir <> '' then
            SoftwareNameDir:= SoftwareNameDir+'\';
         NewMAMESnapName:= ''; // used by in-game snapshot only "gamename\0000.png"
         FileFullPath:= '';

         // EL format
         FileFullPath:= tempFolder+SoftwareNameDir+ELFormat+'.png';
         ImageFound:= FileExists(FileFullPath); // search unzipped image
         if (not ImageFound) and (not FormMain.ImagesPNGOnly(ButtonImageCategory.Tag)) then
            begin
              FileFullPath:= tempFolder+SoftwareNameDir+ELFormat+'.jpg';
              ImageFound:= FileExists(FileFullPath);
            end;

         if (not ImageFound) and FormMain.IsMAMEBasedSys(FormMain.TempGameVars.eSystemID) then
            begin
              FileFullPath:= tempFolder+ExtraFolderStrMAME+SoftwareNameDir+ELFormat+'.png';
              ImageFound:= FileExists(FileFullPath); // search unzipped image
              if (not ImageFound) and (not FormMain.ImagesPNGOnly(ButtonImageCategory.Tag)) then
                 begin
                   FileFullPath:= tempFolder+ExtraFolderStrMAME+SoftwareNameDir+ELFormat+'.jpg';
                   ImageFound:= FileExists(FileFullPath);
                 end;

              if (not ImageFound) and (ButtonImageCategory.Tag = 1) then
              begin
                // for game snapshots only
                NewMAMESnapName:= FormMain.GetImageName(FormMain.TempGameVars.eName, ButtonImageCategory.Tag, 1);//, FormMain.TempGameVars.eSoftwareName); // used by in-game snapshot only "gamename\0000.png"

                FileFullPath:= tempFolder+SoftwareNameDir+NewMAMESnapName+'.png';
                ImageFound:= FileExists(FileFullPath); // search unzipped image
                if (not ImageFound) and (not FormMain.ImagesPNGOnly(ButtonImageCategory.Tag)) then
                   begin
                     FileFullPath:= tempFolder+SoftwareNameDir+NewMAMESnapName+'.jpg';
                     ImageFound:= FileExists(FileFullPath);
                   end;
              end;
            end;
       end;

    if ImageFound then
       begin
         FormMain.TempGameVars.eImageIndex:= FormMain.TempGameVars.eROMIdentification;
         Item:= MissingImagesList.Items.AddCustom(TMissingImageInfo, nil);
         TMissingImageInfo(Item).eROMIdentification:= FormMain.TempGameVars.eROMIdentification;
         TMissingImageInfo(Item).eSystemID:= FormMain.TempGameVars.eSystemID;
         TMissingImageInfo(Item).eSystemType:= FormMain.TempGameVars.eSystemType;
         TMissingImageInfo(Item).eImageCategory:= ButtonImageCategory.Tag;
         TMissingImageInfo(Item).eTitle:= FormMain.TempGameVars.eTitle;
         TMissingImageInfo(Item).eName:= FormMain.TempGameVars.eName;
         TMissingImageInfo(Item).eClone:= FormMain.TempGameVars.eClone;
         case FormMain.GameIsClone(FormMain.TempGameVars.eClone) of
           True : TMissingImageInfo(Item).eCloneParent:= FormMain.TempGameVars.eClone;
           False: TMissingImageInfo(Item).eCloneParent:= FormMain.TempGameVars.eName;
         end;
         TMissingImageInfo(Item).eSoftwareName:= FormMain.TempGameVars.eSoftwareName;
         if FormMain.TempGameVars.eSoftwareName <> '' then
            TMissingImageInfo(Item).eSoftwareTitle:= FormMain.TempGameVars.eCategory
         else
            TMissingImageInfo(Item).eSoftwareTitle:= '';
         TMissingImageInfo(Item).eDriverName:= FormMain.TempGameVars.eDriverName;
         TMissingImageInfo(Item).eDriverStatus:= FormMain.TempGameVars.eDriverStatus;
         TMissingImageInfo(Item).eEmulationStatus:= FormMain.TempGameVars.eEmulationStatus;
         TMissingImageInfo(Item).eColorStatus:= FormMain.TempGameVars.eColorStatus;
         TMissingImageInfo(Item).eSoundStatus:= FormMain.TempGameVars.eSoundStatus;
         TMissingImageInfo(Item).eGraphicStatus:= FormMain.TempGameVars.eGraphicStatus;
         TMissingImageInfo(Item).eIsFavorite:= FormMain.TempGameVars.eIsFavorite;
         TMissingImageInfo(Item).eGameStatus:= FormMain.TempGameVars.eGameSetStatus;
         TMissingImageInfo(Item).eFoundImageMissingGame:= FileFullPath;
         Item.Details[1]:= 20;
       end;
    Application.ProcessMessages;
  end;

begin
  Result:= FormMain.CheckTotal(FormMain.GamesListView);
  if not Result then
     Exit;

  if ShowFolderMessage then
     begin
       if not ValidateImageFolder then
          Exit;
       FormStatus.Show;
       FormStatus.StartThreadClock;
       FormStatus.TitleStr(FormImagesManager.Caption);
     end;
  LabelTotalItemsMissing.Tag:= 1;
  FormStatus.MessageStr('Scanning available images on missing games');
  tempFolder:= FormMain.GetFolderFull(ButtonImageCategory.Tag, idMAME); // [imgType, sysID]

  ExtraFolderStrMAME:= ImageCategoryArray[ButtonImageCategory.Tag, 3]+'\';

  ButtonNotUsedImagesDeleteFiles.Visible:= False;
  FormMain.ClearListView(MissingImagesList);
  MissingImagesList.BeginUpdate;
  MissingImagesList.Items.ReIndexDisable:= True;

  if FormMain.IsGroupedView then
  begin
    gGroup:= FormMain.GamesListView.Groups.FirstGroup;
    repeat
      gItem:= FormMain.GamesListView.Groups.FirstInGroup(gGroup);
      repeat
        FormMain.FillTempGameInfo(gItem);
        AddItem;
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
      AddItem;
      gItem:= FormMain.GamesListView.Groups.NextItem(gItem);
    until gItem = nil;
  end;
  MissingImagesList.Items.ReIndexDisable:= False;
  MissingImagesList.Sort.SortAll;
  MissingImagesList.EndUpdate;
  Result:= FormMain.CheckTotal(MissingImagesList);
  UpdateTotalGamesLabelMissing;
  if ShowFolderMessage then
     FormStatus.Close;

  case Result of
    True:
      begin
        MissingImagesList.Groups.FirstGroup.Caption:= ButtonImageCategory.Caption+' [Scan Images of Missing Games]';
        MissingImagesList.Groups.FirstGroup.ImageIndex:= ButtonImageCategory.Tag;
        ButtonNotUsedImagesDeleteFiles.Visible:= True;
        CreateImagePanelForm;
        FormMain.ELV_SelectItem(MissingImagesList, 0);
        MissingImagesList.SetFocus;
      end;
    False:
      begin
        FormMain.ClearListView(MissingImagesList);
        FreeImagePanelForm;
        GenerateMessage(FormImagesManager.Caption, FormMain.GetArcadeEmulatorDescription(idMAME),
                           '    Scan complete, but no images were found for missing games. If you want to more scan options, '+
                           'open the popup menu (mouse right-click).', 2);
      end;
  end;
end;

{function TFormImagesManager.SearchName(GameName: String): TEasyItem;
var
  Item: TEasyItem;
begin
  Result:= nil;
  if not FormMain.CheckTotal(MissingImagesList) then
     Exit;
  Item:= MissingImagesList.Groups.FirstItem;
  repeat
    if SameText(TMissingImageInfo(Item).eName, GameName) then
       Result:= Item;
    Item:= MissingImagesList.Groups.NextItem(Item);
  until (Item = nil) or (Result <> nil);
end;}

// not used images functions
function TFormImagesManager.RenameImageFile(OldName, NewName, FilePath: String): Boolean;
begin
  CallMessageBox;
  FormMain.AddMsgText('    Rename file'+#13#10+'From ');
  FormMain.AddMsgText(FilePath+OldName, MsgTxtColors.colorFileName, [fsBold]);
  FormMain.AddMsgText(#13#10+'To ');
  FormMain.AddMsgText(FilePath+NewName, MsgTxtColors.colorFileName, [fsBold]);

  if FileExists(FilePath+NewName) then
     begin
       FormMain.AddMsgText(#13#10+#13#10+'    File ');
       FormMain.AddMsgText(FilePath+NewName, MsgTxtColors.colorFileName, [fsBold]);
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

procedure TFormImagesManager.ClearSelectedNotUsed;
begin
  NotUsedImagesList.Selection.ClearAll;
  SelectedItemNotUsed:= nil;
end;

procedure TFormImagesManager.UpdateTotalFilesLabelNotUsed;
begin
  LabelTotalItemsNotUsed.Caption:= ' '+IntToStr(NotUsedImagesList.Groups.ItemCount)+' Not Used Images';
end;

procedure TFormImagesManager.ScanFiles(ShowFolderMessage: Boolean = True);
var
  el_GamesList, FilesList: THashedStringList;
  WindowTitleError, ActiveFolder, AddToFolder: String;
  gItem, Item: TEasyItem;
  gGroup: TEasyGroup;
  MainFolderGroup, Group: TEasyGroup;
  Loop2, iPos, TotalGamesCount: Integer;
  strName, strCloneOf, strSoftwareName, Folder: String;
  ExtraFolderStrMAME, SoftwareNameDir: String;
  NewMAMESnapName, NewMAMESnapCloneName: String; // used by in-game snapshot only "gamename\0000.png"

  function CheckGameFiles(FileIndex: Integer; iGameName: String): Boolean;
  var
    imgCatLoop: Byte;
    tempString: String;
    iImageName: String;
  begin
    Result:= True;
    //strName:= el_GamesList.Names[FileIndex];
    //strSoftwareName:= el_GamesList.ValueFromIndex[FileIndex];
    for imgCatLoop:=1 to MaxImagePerCategory do
    begin
      iImageName:= FormMain.GetImageName(iGameName, imgCatLoop, 0);//, strSoftwareName)
      tempString:= Folder+SoftwareNameDir+iImageName;//+'.png';
      FileIndex:= FilesList.IndexOf(tempString+'.png');
      if (FileIndex = -1) and (not FormMain.ImagesPNGOnly(ButtonImageCategory.Tag)) then
         FileIndex:= FilesList.IndexOf(tempString+'.jpg');

      if (FileIndex = -1) then //and FormMain.IsMAMEBasedSys(FormMain.TempGameVars.eSystemID) then
         begin
           tempString:= Folder+ExtraFolderStrMAME+SoftwareNameDir+iImageName;
           FileIndex:= FilesList.IndexOf(tempString+'.png');
           if (FileIndex = -1) and (not FormMain.ImagesPNGOnly(ButtonImageCategory.Tag)) then
              FileIndex:= FilesList.IndexOf(tempString+'.jpg');
         end;

      if (FileIndex = -1) and (ButtonImageCategory.Tag = 1) then
         begin
           NewMAMESnapName:= FormMain.GetImageName(iGameName, imgCatLoop, 1);//, strSoftwareName); // used by in-game snapshot only "gamename\0000.png"
           tempString:= Folder+SoftwareNameDir+NewMAMESnapName;
           FileIndex:= FilesList.IndexOf(tempString+'.png');
           if FileIndex = -1 then
              begin
                tempString:= Folder+ExtraFolderStrMAME+SoftwareNameDir+NewMAMESnapName;
                FileIndex:= FilesList.IndexOf(tempString+'.png');
              end;
         end;

      if FileIndex <> -1 then
         FilesList.Delete(FileIndex);
    end;
  end;

  function AddToGroup(FileToAdd: String): TEasyItem;
  begin
    Result:= nil;
    case SameText(AddToFolder, Folder) of
      True:
        begin
          // it means it's in the main folder
          if MainFolderGroup = nil then
             begin
               MainFolderGroup:= NotUsedImagesList.Groups.Add;
               MainFolderGroup.Caption:= ExtractFilePath(FileToAdd);
             end;
          Result:= MainFolderGroup.Items.AddCustom(TNotUsedImageInfo, nil);
          if Result <> nil then
             MainFolderGroup.ImageIndex:= ButtonImageCategory.Tag;
        end;
      False:
        begin
          if not SameText(AddToFolder, ActiveFolder) then
             begin
               Group:= nil;
               ActiveFolder:= AddToFolder;
             end;
          if Group = nil then
             begin
               Group:= NotUsedImagesList.Groups.Add;
               Group.Caption:= AddToFolder;
             end;
          Result:= Group.Items.AddCustom(TNotUsedImageInfo, nil);
          if Result <> nil then
             Group.ImageIndex:= ButtonImageCategory.Tag;
        end;
    end;
  end;

begin
  WindowTitleError:= 'Error: '+FormImagesManager.Caption;
  if not FormMain.CheckTotal(FormMain.GamesListView) then
     Exit;
  if ShowFolderMessage then
     begin
       if not ValidateImageFolder then
          Exit;
       FormStatus.Show;
       FormStatus.StartThreadClock;
       FormStatus.TitleStr(FormImagesManager.Caption);
     end;

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
        if TEasyGameInfo(gItem).eSystemID = idMAME then
        begin
          FormMain.FillTempGameInfo(gItem);
          if FormMain.GameIsClone(TEasyGameInfo(gItem).eClone) then
             el_GamesList.Add(TEasyGameInfo(gItem).eName+';'+TEasyGameInfo(gItem).eClone+'='+TEasyGameInfo(gItem).eSoftwareName)
          else
             el_GamesList.Add(TEasyGameInfo(gItem).eName+'='+TEasyGameInfo(gItem).eSoftwareName);
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
      if TEasyGameInfo(gItem).eSystemID = idMAME then
      begin
        FormMain.FillTempGameInfo(gItem);
        if FormMain.GameIsClone(TEasyGameInfo(gItem).eClone) then
           el_GamesList.Add(TEasyGameInfo(gItem).eName+';'+TEasyGameInfo(gItem).eClone+'='+TEasyGameInfo(gItem).eSoftwareName)
        else
           el_GamesList.Add(TEasyGameInfo(gItem).eName+'='+TEasyGameInfo(gItem).eSoftwareName);
      end;
      gItem:= FormMain.GamesListView.Groups.NextItem(gItem);
    until gItem = nil;
  end;

  el_GamesList.EndUpdate;
  el_GamesList.Sorted:= False;

  // scan image files
  FormStatus.MessageStr('Building images files list');
  Folder:= FormMain.GetFolderFull(ButtonImageCategory.Tag, idMAME);
  FilesList:= THashedStringList.Create;
  GetFilesList(Folder, '.png', '*.*', FilesList, True, False, True);
  if not FormMain.ImagesPNGOnly(ButtonImageCategory.Tag) then
     GetFilesList(Folder, '.jpg', '*.*', FilesList, True, False, True);

  Loop2:= Ord(FilesList.Count > 0);
  case Boolean(Loop2) of
    True:
      begin
        ExtraFolderStrMAME:= ImageCategoryArray[ButtonImageCategory.Tag, 3]+'\';
        FilesList.BeginUpdate;
        FormStatus.MessageStr('Validating '+IntToStr(el_GamesList.Count)+' games (up to '+IntToStr(MaxImagePerCategory)+' images per game)'+#13#10+
                              'Image category: '+GetImageCategoryTitle(ButtonImageCategory.Tag));

        TotalGamesCount:= el_GamesList.Count;
        for Loop2:=0 to el_GamesList.Count-1 do
        begin
          strName:= el_GamesList.Names[Loop2];
          iPos:= PosEx(';', strName);
          if iPos <> 0 then
             begin
               strCloneOf:= Copy(strName, iPos+1, Length(strName));
               Delete(strName, iPos, Length(strName));
             end
          else
             strCloneOf:= '';
          strSoftwareName:= el_GamesList.ValueFromIndex[Loop2];
          SoftwareNameDir:= strSoftwareName;
          if SoftwareNameDir <> '' then
             SoftwareNameDir:= SoftwareNameDir+'\';

          CheckGameFiles(Loop2, strName);
          if FormMain.GameIsClone(strCloneOf) then
             CheckGameFiles(Loop2, strCloneOf);
             
          FormStatus.UpdateProgressBar(Loop2, el_GamesList.Count-1);
          Application.ProcessMessages;
        end;
        FormStatus.LabelSoftwareScanCount.Visible:= False;
        FilesList.EndUpdate;
        if FilesList.Count > 0 then
           begin
             //FilesList.SaveToFile(FormMain.FrontendPath+'invalid_images.txt');
             FormMain.ClearListView(NotUsedImagesList);
             NotUsedImagesList.BeginUpdate;
             NotUsedImagesList.Items.ReIndexDisable:= True;
             ActiveFolder:= '';
             AddToFolder:= '';
             for Loop2:=0 to FilesList.Count-1 do
             begin
               AddToFolder:= ExtractFilePath(FilesList[Loop2]);
               if ActiveFolder = '' then
                  ActiveFolder:= AddToFolder;

               Item:= AddToGroup(FilesList[Loop2]);
               TNotUsedImageInfo(Item).eImageLoaded:= False;
               TNotUsedImageInfo(Item).eImageCategory:= ButtonImageCategory.Tag;
               TNotUsedImageInfo(Item).eFileName:= ExtractFileName(FilesList[Loop2]);
               TNotUsedImageInfo(Item).eSize:= GetFileSize(FilesList[Loop2]);
               TNotUsedImageInfo(Item).eSizeText:= FormMain.GetSizeType(TNotUsedImageInfo(Item).eSize, False);
               TNotUsedImageInfo(Item).eDateTime:= FileAge(FilesList[Loop2]);
               TNotUsedImageInfo(Item).eDateTimeText:= FormMain.GetDateTimeStr(TNotUsedImageInfo(Item).eDateTime);
               TNotUsedImageInfo(Item).eFullPath:= ExtractFilePath(FilesList[Loop2]);
               if Length(TNotUsedImageInfo(Item).eFullPath) > 36 then
                  TNotUsedImageInfo(Item).eFullPathText:= ShortDirString(TNotUsedImageInfo(Item).eFullPath, 36)
               else
                  TNotUsedImageInfo(Item).eFullPathText:= TNotUsedImageInfo(Item).eFullPath;
               TNotUsedImageInfo(Item).eNameOriginal:= TNotUsedImageInfo(Item).eFileName;
               Item.Details[1]:= 1;
               Item.Details[2]:= 2;
               Application.ProcessMessages;
             end;
             FormMain.ELV_RemoveDefaultGroup(NotUsedImagesList);
             NotUsedImagesList.Items.ReIndexDisable:= False;
             NotUsedImagesList.Sort.SortAll;
             NotUsedImagesList.EndUpdate;
           end
        else
           begin
             GenerateMessage(FormImagesManager.Caption, FormMain.GetArcadeEmulatorDescription(idMAME),
                             'Scanning complete but nothing was found.', 2);
           end;
      end;
    False:
      begin
        case DirectoryExists(Folder) of
          True : GenerateMessage(FormImagesManager.Caption,
                      'Search for not used images.'+#13#10+
                        FormMain.GetArcadeEmulatorDescription(idMAME),
                        '    No files were found in '+Folder, 2);
          False: GenerateMessage(FormImagesManager.Caption,
                      'Search for not used images.'+#13#10+
                        FormMain.GetArcadeEmulatorDescription(idMAME),
                        '    No files were found in '+Folder+#13#10+'Folder does not exist.', 2);
        end;
      end;
  end;
  FreeAndNil(FilesList);
  FreeAndNil(el_GamesList);
  UpdateTotalFilesLabelNotUsed;
  if ShowFolderMessage then
     FormStatus.Close;
end;

function TFormImagesManager.LoadImageNotUsed(const ImageName: String): Integer;
var
  DestImage: TBitmap32;
  newWidth,
  newHeight,
  leftPos,
  topPos,
  IconSize: Integer;
  addImage: TBitmap;
  ImageToLoad: TImage32;
  iType: TImageType;

  procedure MakeThumbNail(aSource: TBitmap32; iWidth, iHeight: Integer);
  begin
    DestImage:= TBitmap32.Create;
    DestImage.BeginUpdate;
    DestImage.Clear;
    DestImage.Width:= iWidth;
    DestImage.Height:= iHeight;
    aSource.DrawTo(DestImage, DestImage.BoundsRect);
    DestImage.EndUpdate;
  end;

begin
  //if ImageName ='D:\EmuLoader\snap\a2600\a2600 - Copy.png' then
  //   beep;
  IconSize:= IL_NotUsedImages.Width;
  //ImageToLoad:= TBitmap32.Create;
  //ImageToLoad.Clear;
  //TKernelResampler.Create(ImageToLoad);
  //TKernelResampler(ImageToLoad.Resampler).Kernel:=
  //           TCustomKernelClass(THermiteKernel).Create; // Hermite (used to be Lanczos filter)

  ImageToLoad:= TImage32.Create(nil);
  TKernelResampler.Create(ImageToLoad.Bitmap);
  TKernelResampler(ImageToLoad.Bitmap.Resampler).Kernel:=
             TCustomKernelClass(TCosineKernel).Create; // Hermite (used to be Lanczos filter)

  iType:= FormMain.LoadPreviewImage(ImageName, ImageToLoad);
  if (ImageToLoad.Bitmap.Width/ImageToLoad.Bitmap.Height) <= (IconSize/IconSize) then
     begin
       // stretch height to match
       NewWidth:= MulDiv(IconSize, ImageToLoad.Bitmap.Width, ImageToLoad.Bitmap.Height);
       MakeThumbNail(ImageToLoad.Bitmap, NewWidth, IconSize);
       // center horizontally
       leftPos:= Trunc((IconSize-DestImage.Width) div 2);
       topPos:= 0;
     end
  else
     begin
       // stretch width to match
       NewHeight:= MulDiv(IconSize, ImageToLoad.Bitmap.Height, ImageToLoad.Bitmap.Width);
       MakeThumbNail(ImageToLoad.Bitmap, IconSize, NewHeight);
       // center vertically
       leftPos:= 0;
       topPos:= Trunc((IconSize-DestImage.Height) div 2);
     end;

  addImage:= TBitmap.Create;
  addImage.Width:= IconSize;
  addImage.Height:= IconSize;
  addImage.PixelFormat:= pf24Bit;
  DestImage.DrawTo(addImage.Canvas.Handle, leftPos, topPos);
  Result:= IL_NotUsedImages.Add(addImage, addImage);
  FreeAndNil(DestImage);
  FreeAndNil(addImage);
  ImageToLoad.Bitmap:= nil;
  FreeAndNil(ImageToLoad);
end;

procedure TFormImagesManager.ViewImageFullScreen;
var
  imgForm: TForm;
  imgHolder: TImage32;
  imgFile: String;
begin
  if NotUsedImagesList.Selection.Count <> 1 then
     Exit;

  imgFile:= TNotUsedImageInfo(SelectedItemNotUsed).eFullPath+TNotUsedImageInfo(SelectedItemNotUsed).eFileName;
  if FileExists(imgFile) then
     CallShellExecute(nil, imgFile); // ShellExecute(Handle, 'open', PChar(imgFile), nil, nil, SW_SHOWNORMAL);
     {begin
       imgFile:= '%SystemRoot%\System32\rundll32.exe "%ProgramFiles%\Windows Photo Viewer\PhotoViewer.dll", ImageView_Fullscreen '+imgFile; // this is the one!!!!!!
       //imgFile:= 'rundll32.exe "%ProgramFiles%\Windows Photo Viewer\PhotoViewer.dll", '+imgFile;
       //imgFile:= '"'+GetSystemDir+'\rundll32.exe" "'+GetSystemDir+'\shimgvw.dll",'+imgFile;
       Application.MessageBox(PChar(imgFile), 'test');
       //WinExec(PChar(imgFile), SW_SHOWNORMAL);
       //FormMain.RunProcess(imgFile, False, SW_SHOWNORMAL, False);
       ShellExecute(Handle, 'open', PChar(imgFile), nil, nil, SW_SHOWNORMAL);
     end;}
  NotUsedImagesList.SetFocus;
  Exit;

  //CSIDL_PROGRAM_FILES = $0026;
   //GetSystemFolder(CSIDL_PROGRAM_FILES);

  imgForm:= TForm.Create(nil);
  imgForm.DefaultMonitor:= dmMainForm;
  imgForm.Caption:= TNotUsedImageInfo(SelectedItemNotUsed).eFullPath+TNotUsedImageInfo(SelectedItemNotUsed).eFileName;
  imgForm.Scaled:= False;
  imgForm.BorderStyle:= bsDialog;
  imgForm.Width:= Screen.Width-120;
  imgForm.Height:= Screen.Height-120;
  imgForm.Position:= poScreenCenter;
  imgHolder:= TImage32.Create(imgForm);
  imgHolder.ParentWindow:= imgForm.Handle;
  imgHolder.Align:= alClient;
  imgHolder.Color:= clBlack;
  imgHolder.BitmapAlign:= baCenter;
  imgHolder.BeginUpdate;
  TKernelResampler.Create(imgHolder.Bitmap);
      TKernelResampler(imgHolder.Bitmap.Resampler).Kernel:=
                    TCustomKernelClass(TCosineKernel).Create;
  imgHolder.ScaleMode:= smResize;
  imgHolder.Width:= imgForm.ClientWidth;
  imgHolder.Height:= imgForm.ClientHeight;
  if FileExists(imgForm.Caption) then
     imgHolder.Bitmap.LoadFromFile(imgForm.Caption);
  //if FileExists(TNotUsedImageInfo(SelectedItemNotUsed).eFullPath+TNotUsedImageInfo(SelectedItemNotUsed).eFileName) then
  //   imgHolder.Bitmap.LoadFromFile(TNotUsedImageInfo(SelectedItemNotUsed).eFullPath+TNotUsedImageInfo(SelectedItemNotUsed).eFileName);
  imgHolder.EndUpdate;
  Application.ProcessMessages;
  imgForm.ShowModal;
  FreeAndNil(imgForm);
  NotUsedImagesList.SetFocus;
end;

procedure TFormImagesManager.ResetNotUsedImagesList;
var
  Item: TEasyItem;
begin
  IL_NotUsedImages.Clear;
  if not FormMain.CheckTotal(NotUsedImagesList) then
     Exit;
  NotUsedImagesList.BeginUpdate;
  Item:= NotUsedImagesList.Groups.FirstItem;
  repeat
    TNotUsedImageInfo(Item).eImageLoaded:= False;
    Item:= NotUsedImagesList.Groups.NextItem(Item);
  until Item = nil;
  NotUsedImagesList.EndUpdate;
end;

procedure TFormImagesManager.FormShow(Sender: TObject);
var
  Folder: String;
begin
  ReadIniFile;
  Folder:= FormMain.GetFolderFull(32);
  FormMain.AddDefaultIcons('image.ico', Folder, IL_Buttons); // 00
  FormMain.AddDefaultIcons('exit.ico', Folder, IL_Buttons); // 01
  FormMain.AddDefaultIcons('help.ico', Folder, IL_Buttons); // 02
  FormMain.AddDefaultIcons('delete.ico', Folder, IL_Buttons); // 02

  FormMain.LoadSystemsIcons(IL_SystemsImages);
  FormMain.LoadCategoriesIcons(IL_SystemsImages);
  FormMain.LoadCategoriesIcons(IL_ImageCategory);

  FormMain.LoadIconIntoImage(ImageCategoryArray[ButtonImageCategory.Tag, 0], ImageCategoryIcon);
  ButtonImageCategory.Caption:= GetImageCategoryTitle(ButtonImageCategory.Tag);

  FormMain.ELV_ResetNormalColors(MissingImagesList);
  FormMain.ELV_ResetNormalColors(NotUsedImagesList);
end;

procedure TFormImagesManager.MissingImagesListColumnClick(
  Sender: TCustomEasyListview; Button: TCommonMouseButton;
  ShiftState: TShiftState; const Column: TEasyColumn);
begin
  if Button = cmbLeft then
     begin
       MissingImagesList.BeginUpdate;
       MissingImagesList.Sort.SortAll;
       MissingImagesList.EndUpdate(False);
     end;
end;

procedure TFormImagesManager.MissingImagesListDblClick(
  Sender: TCustomEasyListview; Button: TCommonMouseButton;
  MousePos: TPoint; ShiftState: TShiftState; var Handled: Boolean);
begin
  PopupPlayGame.Click;
end;

function TFormImagesManager.MissingImagesListItemCompare(
  Sender: TCustomEasyListview; Column: TEasyColumn; Group: TEasyGroup;
  Item1, Item2: TEasyItem; var DoDefault: Boolean): Integer;
var
  gItem1, gItem2: TEasyItem;
begin
  DoDefault:= False;
  FormMain.ELV_GetSortDirection(Column, Item1, Item2, gItem1, gItem2);

  case Column.Index of
    0: Result:= FormMain.iCompare(TMissingImageInfo(gItem1).eTitle, TMissingImageInfo(gItem2).eTitle);
    1: Result:= FormMain.iCompare(TMissingImageInfo(gItem1).eName, TMissingImageInfo(gItem2).eName);
    2: Result:= FormMain.iCompare(TMissingImageInfo(gItem1).eCloneParent, TMissingImageInfo(gItem2).eCloneParent);
    //2: //CompareText(TMissingImageInfo(gItem1).eCloneParent, TMissingImageInfo(gItem2).eCloneParent);
    3: Result:= FormMain.iCompare(TMissingImageInfo(gItem1).eDriverName, TMissingImageInfo(gItem2).eDriverName);
    4: Result:= AnsiCompareText(aStatus[TMissingImageInfo(gItem1).eDriverStatus], aStatus[TMissingImageInfo(gItem2).eDriverStatus]);
    5: Result:= AnsiCompareText(aStatus[TMissingImageInfo(gItem1).eEmulationStatus], aStatus[TMissingImageInfo(gItem2).eEmulationStatus]);
    6: Result:= AnsiCompareText(aStatus[TMissingImageInfo(gItem1).eColorStatus], aStatus[TMissingImageInfo(gItem2).eColorStatus]);
    7: Result:= AnsiCompareText(aStatus[TMissingImageInfo(gItem1).eSoundStatus], aStatus[TMissingImageInfo(gItem2).eSoundStatus]);
    8: Result:= AnsiCompareText(aStatus[TMissingImageInfo(gItem1).eGraphicStatus], aStatus[TMissingImageInfo(gItem2).eGraphicStatus]);
  end;
end;

procedure TFormImagesManager.MissingImagesListItemPaintText(
  Sender: TCustomEasyListview; Item: TEasyItem; Position: Integer;
  ACanvas: TCanvas);
begin
  FormMain.GetCanvasFontCustom(
                TMissingImageInfo(Item).eSystemID,
                TMissingImageInfo(Item).eGameStatus,
                TMissingImageInfo(Item).eDriverStatus,
                TMissingImageInfo(Item).eClone, ACanvas, True, False);
  if MissingImagesList.View = elsTile then
     begin
       if Position > 0 then
          begin
            ACanvas.Font.Color:= clMaroon;
            ACanvas.Font.Size:= 8;//ACanvas.Font.Size-1;
            //ACanvas.Font.Style:= ACanvas.Font.Style+[fsItalic];
          end;
     end
  else
  if Position in [1, 2, 4, 5] then
     begin
       ACanvas.Font.Name:= 'Tahoma';
       ACanvas.Font.Size:= 8;
     end;
end;

procedure TFormImagesManager.MissingImagesListItemSelectionChanged(
  Sender: TCustomEasyListview; Item: TEasyItem);
begin
  if Item.Selected then
     begin
       if Item <> SelectedItemMissing then
          begin
            SelectedItemMissing:= Item;
            SetSelectedMissingGame;
          end;
     end;
end;

procedure TFormImagesManager.MissingImagesListKeyAction(
  Sender: TCustomEasyListview; var CharCode: Word; var Shift: TShiftState;
  var DoDefault: Boolean);
begin
  case CharCode of
    VK_RETURN: PopupPlayGame.Click;
    VK_DELETE: PopupMissingRemoveSelected.Click;
  end;
end;

procedure TFormImagesManager.MissingImagesListColumnSizeChanged(
  Sender: TCustomEasyListview; Column: TEasyColumn);
begin
  // force game name and clone of columns to have same width!
  case Column.Index of
    1: MissingImagesList.Header.Columns[2].Width:= Column.Width;
    2: MissingImagesList.Header.Columns[1].Width:= Column.Width;
  end;
end;

procedure TFormImagesManager.PopupPlayGameClick(Sender: TObject);
var
  GameEasy: TEasyItem;
  RunGame: Boolean;

  function ShowInvisibleGameMsg: Boolean;
  begin
    Result:= GenerateMessage('WARNING', 'Run selected game.', '    The game is not visible in '+
              'main games list, either because is set as missing or due to selected games filters.'+
              #13#10+'The game might not run properly. Would you like to try it anyway ?', 1) = mrYes;
    if not Result then
       RunGame:= False;
  end;

  function ShowGameNotFoundMsg: Boolean;
  begin
    GenerateMessage('Error', FormMain.GetArcadeEmulatorDescription(idMAME),
                    '    Could not find the game in main games list. For this feature to work, '+
                    'the game must be valid and visible on the main screen. Make sure the games list for '+
                    'this system is loaded.', 2, False, 1);
    RunGame:= False;
    Result:= RunGame;
  end;

begin
  if MissingImagesList.Selection.Count <> 1 then
     Exit;

  RunGame:= True;
  FormMain.FindGameName(TMissingImageInfo(SelectedItemMissing).eName, idMAME, -1, False,
                        TMissingImageInfo(SelectedItemMissing).eSoftwareName, GameEasy, False);
  if Assigned(FormImageFoundMissingGame) then
     FormImageFoundMissingGame.Hide;
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
       FormMain.ExecuteGame;
     end;
  if Assigned(FormImageFoundMissingGame) then
     FormImageFoundMissingGame.Show;
  //FormImageFoundMissingGame.FormStyle:= fsStayOnTop;
  MissingImagesList.SetFocus;
end;

procedure TFormImagesManager.FormCanResize(Sender: TObject; var NewWidth,
  NewHeight: Integer; var Resize: Boolean);
begin
  if NewWidth < 931 then
     Resize:= False;
  LabelTotalItemsNotUsed.Left:= PanelNotUsed.Left;
  ButtonInvalidImagesDeleteFiles.Left:= BottomBar.Width-158
end;

procedure TFormImagesManager.FormActivate(Sender: TObject);
begin
  if MissingImagesList.Tag = 1 then
     Exit;
  if FormImagesManager.Tag = 1 then
     WindowState:= wsMaximized
  else
     begin
       if ((FormImagesManager.Top = 0) and (FormImagesManager.Left = 0)) then
          begin
            FormImagesManager.Top:= (Screen.Height-FormImagesManager.Height) div 2;
            FormImagesManager.Left:= (Screen.Width-FormImagesManager.Width) div 2;
          end;
     end;
  MissingImagesList.Tag:= 1;
end;

procedure TFormImagesManager.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if FormImagesManager.WindowState = wsMinimized then
     begin
       CanClose:= False;
       Exit;
     end;
  FormMain.ClearListView(MissingImagesList);
  FormMain.ClearListView(NotUsedImagesList);
  WriteIniFile;

  FreeImagePanelForm;

  //FormImagesManager.Release;
  //FormImagesManager:= nil;
end;

procedure TFormImagesManager.PopupMissingClearListClick(Sender: TObject);
begin
  FormMain.ClearListView(MissingImagesList);
  ClearSelectedMissing;
end;

procedure TFormImagesManager.PopupMissingRemoveSelectedClick(Sender: TObject);
begin
  if not FormMain.CheckSelected(MissingImagesList) then
     Exit;
  MissingImagesList.Selection.DeleteSelected(True);
  UpdateTotalGamesLabelMissing;
end;

procedure TFormImagesManager.PopupShowAllGamesClick(Sender: TObject);
var
  Item: TEasyItem;
begin
  if PopupGamesFilter.Tag = TMenuItem(Sender).Tag then
     Exit;

  if not FormMain.CheckTotal(MissingImagesList) then
     Exit;

  PopupGamesFilter.Tag:= TMenuItem(Sender).Tag;

  MissingImagesList.BeginUpdate;
  Item:= MissingImagesList.Groups.FirstItem;
  repeat
    case TMenuItem(Sender).Tag of
      0: Item.Visible:= True; // show all games
      1: Item.Visible:= not FormMain.GameIsClone(TMissingImageInfo(Item).eClone); // show parents only
      2: Item.Visible:= FormMain.GameIsClone(TMissingImageInfo(Item).eClone); // show clones only
    end;
    Item:= MissingImagesList.Groups.NextItem(Item);
  until Item = nil;
  MissingImagesList.EndUpdate;
end;

procedure TFormImagesManager.PopupRestoreColumnsSizesClick(Sender: TObject);
begin
  // column.position changes, column.index does not!!!
  MissingImagesList.Header.Columns[0].Width:= 270;
  MissingImagesList.Header.Columns[1].Width:= 85;
  MissingImagesList.Header.Columns[2].Width:= 85;
  MissingImagesList.Header.Columns[3].Width:= 150;
  MissingImagesList.Header.Columns[4].Width:= 90;
  MissingImagesList.Header.Columns[5].Width:= 85;
  Application.ProcessMessages;
end;

procedure TFormImagesManager.PopupMissingImagesMeasureMenuItem(
  Sender: TObject; AMenuItem: TMenuItem; ACanvas: TCanvas; var Width,
  Height: Integer; ABarVisible: Boolean; var DefaultMeasure: Boolean);
begin
  FormMain.SetPopupMenuMeasureItem(AMenuItem, ACanvas, Width, Height);
end;

procedure TFormImagesManager.PopupMissingSaveToFileClick(Sender: TObject);
var
  Item: TEasyItem;
  ListOutput: THashedStringList;
  FileStr: String;
begin
  if not FormMain.CheckTotal(MissingImagesList) then
     Exit;
  FileStr:= FormMain.DialogSaveFile(4, 'Save Missing Images List To a File');
  if FileStr = '' then
     Exit;

  ListOutput:= THashedStringList.Create;
  ListOutput.BeginUpdate;
  ListOutput.Add('----------> Missing Images <----------'+#13#10);
  ListOutput.Add('  -> System: '+FormMain.GetArcadeEmulatorDescription(idMAME));
  ListOutput.Add('  -> Image Category: '+GetImageCategoryTitle(TMissingImageInfo(Item).eImageCategory));
  ListOutput.Add('     Total Games: '+IntToStr(MissingImagesList.Groups.ItemCount)+#13#10);
  ListOutput.Add(Format('%16s %16s %s', ['[Name]', '[Clone of]', '[Title]']));

  Item:= MissingImagesList.Groups.FirstItem;
  repeat
    ListOutput.Add(Format('%-16s %-16s ', [TMissingImageInfo(Item).eName, TMissingImageInfo(Item).eClone])+FormMain.EncodeUnicodeStr(TMissingImageInfo(Item).eTitle));
    Item:= MissingImagesList.Groups.NextItem(Item);
  until Item = nil;
  ListOutput.EndUpdate;
  ListOutput.SaveToFile(FileStr);
  FreeAndNil(ListOutput);
  GenerateMessage(FormImagesManager.Caption, 'Save games list to a text file.',
                  Format('The file "%s" was created based on the current games list.',
                         [FileStr]), 2);
end;

procedure TFormImagesManager.NotUsedImagesListItemPaintText(
  Sender: TCustomEasyListview; Item: TEasyItem; Position: Integer;
  ACanvas: TCanvas);
begin
  if not SameText(TNotUsedImageInfo(Item).eFileName, TNotUsedImageInfo(Item).eNameOriginal) then
     begin
       ACanvas.Font.Color:= clMaroon;
       ACAnvas.Font.Style:= [fsBold];
     end;
  if Position > 0 then
     begin
       ACanvas.Font.Name:= 'Consolas';
       ACanvas.Font.Size:= 8;
       ACanvas.Font.Color:= clNavy;
     end;
       //ACanvas.Font.Size:= ACanvas.Font.Size-2;
end;

procedure TFormImagesManager.NotUsedImagesListItemSelectionChanged(
  Sender: TCustomEasyListview; Item: TEasyItem);
var
  iType: TImageType;
begin
  if Item.Selected and (NotUsedImagesList.Selection.Count = 1) then
     begin
       SelectedItemNotUsed:= Item;
       FormMain.ELV_SetSelectRibbon(Ord((not SameText(TNotUsedImageInfo(Item).eFileName, TNotUsedImageInfo(Item).eNameOriginal))),
                                    NotUsedImagesList);

       iType:= FormMain.LoadPreviewImage(TNotUsedImageInfo(Item).eFullPath+TNotUsedImageInfo(Item).eFileName, ImagePreview);

       if iType = ifUnknown then
          ImagePreview.Bitmap:= nil;
     end;
end;

procedure TFormImagesManager.NotUsedImagesListKeyAction(
  Sender: TCustomEasyListview; var CharCode: Word; var Shift: TShiftState;
  var DoDefault: Boolean);
begin
  if FormMain.ELV_IsEditing(TEasyListView(Sender)) then
     Exit;
  case CharCode of
    VK_F2: PopupNotUsedRenameFile.Click;
    VK_RETURN: PopupNotUsedViewFullScreen.Click;
    VK_DELETE: PopupNotUsedRemoveSelected.Click;
  end;
end;

procedure TFormImagesManager.PopupNotUsedRemoveSelectedClick(
  Sender: TObject);
begin
  if not FormMain.CheckSelected(NotUsedImagesList) then
     Exit;
  NotUsedImagesList.Selection.DeleteSelected(True);
  FormMain.ELV_RemoveEmptyGroups(NotUsedImagesList);
  UpdateTotalFilesLabelNotUsed;
  NotUsedImagesList.SetFocus;
end;

procedure TFormImagesManager.PopupNotUsedUpdateIconInfoSelectedIconsClick(
  Sender: TObject);
var
  Item: TEasyItem;
  FileFull: String;
begin
  if not FormMain.CheckTotal(NotUsedImagesList) then
     Exit;
  if TMenuItem(Sender).Tag = 0 then
     begin
       if not FormMain.CheckSelected(NotUsedImagesList) then
          Exit;
     end;

  NotUsedImagesList.BeginUpdate;
  case TMenuItem(Sender).Tag of
    0: Item:= NotUsedImagesList.Selection.First;
    1: Item:= NotUsedImagesList.Groups.FirstItem;
  end;
  repeat
    FileFull:= TNotUsedImageInfo(Item).eFullPath+TNotUsedImageInfo(Item).eFileName;
    TNotUsedImageInfo(Item).eSize:= GetFileSize(FileFull);
    TNotUsedImageInfo(Item).eSizeText:= FormMain.GetSizeType(TNotUsedImageInfo(Item).eSize, False);
    TNotUsedImageInfo(Item).eDateTime:= FileAge(FileFull);
    TNotUsedImageInfo(Item).eDateTimeText:= FormMain.GetDateTimeStr(TNotUsedImageInfo(Item).eDateTime);
    case TMenuItem(Sender).Tag of
      0: Item:= NotUsedImagesList.Selection.Next(Item);
      1: Item:= NotUsedImagesList.Groups.NextItem(Item);
    end;
  until Item = nil;
  NotUsedImagesList.EndUpdate;
end;

procedure TFormImagesManager.PopupNotUsedClearFilesListClick(
  Sender: TObject);
begin
  ClearSelectedNotUsed;
  FormMain.ClearListView(NotUsedImagesList);
  IL_NotUsedImages.Clear;
end;

procedure TFormImagesManager.PopupNotUsedRemoveRenamedIconsClick(
  Sender: TObject);
var
  Item, ItemToRemove: TEasyItem;
begin
  if not FormMain.CheckTotal(NotUsedImagesList) then
     Exit;
  ClearSelectedNotUsed;
  Item:= NotUsedImagesList.Groups.LastItem;
  NotUsedImagesList.BeginUpdate;
  repeat
    ItemToRemove:= nil;
    if not SameText(TNotUsedImageInfo(Item).eFileName, TNotUsedImageInfo(Item).eNameOriginal) then
       ItemToRemove:= Item;
    Item:= NotUsedImagesList.Groups.PrevItem(Item);
    if ItemToRemove <> nil then
       NotUsedImagesList.Groups.DeleteItem(ItemToRemove);
  until Item = nil;
  NotUsedImagesList.EndUpdate;
  FormMain.ELV_RemoveEmptyGroups(NotUsedImagesList);
  ResetNotUsedImagesList;
  UpdateTotalFilesLabelNotUsed;
  NotUsedImagesList.SetFocus;
end;

procedure TFormImagesManager.PopupMoveSelectedToFolderClick(
  Sender: TObject);
var
  Item, ItemToMove: TEasyItem;
  FolderStr: String;
begin
  if not FormMain.CheckSelected(NotUsedImagesList) then
     Exit;

  FolderStr:= FormMain.DialogSelectFolderStr('Move Selected Files To Folder');
  if FolderStr = '' then
     begin
       NotUsedImagesList.SetFocus;
       Exit;
     end;
  NotUsedImagesList.BeginUpdate;
  Item:= NotUsedImagesList.Selection.Prev(NotUsedImagesList.Groups.LastItem);
  repeat
    ItemToMove:= nil;
    if MoveFile(PChar(IncludeTrailingPathDelimiter(TNotUsedImageInfo(Item).eFullPath)+TNotUsedImageInfo(Item).eFileName),
                PChar(FolderStr+TNotUsedImageInfo(Item).eFileName), True) then
       ItemToMove:= Item;
    Item:= NotUsedImagesList.Selection.Prev(Item);
    if ItemToMove <> nil then
       NotUsedImagesList.Groups.DeleteItem(ItemToMove);
  until Item = nil;
  NotUsedImagesList.EndUpdate;
  ClearSelectedNotUsed;
  ResetNotUsedImagesList;
  UpdateTotalFilesLabelNotUsed;
end;

procedure TFormImagesManager.PopupNotUsedSaveIconsListToFileClick(
  Sender: TObject);
var
  Item: TEasyItem;
  ListOutput: THashedStringList;
  FileStr: String;
begin
  if not FormMain.CheckTotal(NotUsedImagesList) then
     Exit;
  FileStr:= FormMain.DialogSaveFile(4, 'Save Images List of Missing Games To a File');
  if FileStr = '' then
     Exit;

  ListOutput:= THashedStringList.Create;
  ListOutput.BeginUpdate;
  ListOutput.Add('----------> Images of Missing Games <----------'+#13#10);
  ListOutput.Add('  -> System: '+FormMain.GetArcadeEmulatorDescription(idMAME));
  ListOutput.Add('  -> Image Category: '+GetImageCategoryTitle(TNotUsedImageInfo(Item).eImageCategory));
  ListOutput.Add('     Total Files: '+IntToStr(NotUsedImagesList.Groups.ItemCount)+#13#10);
  Item:= NotUsedImagesList.Groups.FirstItem;
  repeat
    ListOutput.Add(TNotUsedImageInfo(Item).eFullPath+TNotUsedImageInfo(Item).eFileName);
    Item:= NotUsedImagesList.Groups.NextItem(Item);
  until Item = nil;
  ListOutput.EndUpdate;
  ListOutput.SaveToFile(FileStr);
  FreeAndNil(ListOutput);
  GenerateMessage(FormImagesManager.Caption, 'Save games list to a text file.',
                  Format('The file "%s" was created based on the current files list.',
                         [FileStr]), 2);
end;

procedure TFormImagesManager.ImagePreviewClick(Sender: TObject);
begin
  ViewImageFullScreen;
end;

procedure TFormImagesManager.PopupNotUsedViewFullScreenClick(Sender: TObject);
begin
  ViewImageFullScreen;
end;

procedure TFormImagesManager.PopupNotUsedRenameFileClick(Sender: TObject);
var
  OldName, NewName: String;
  //newWidth,
  //newHeight,
  //leftPos,
  //topPos,
begin
  if NotUsedImagesList.Selection.Count <> 1 then
     Exit;
  OldName:= TNotUsedImageInfo(SelectedItemNotUsed).eFileName;
  if not Assigned(FormRenameImageFile) then
     FormRenameImageFile:= TFormRenameImageFile.Create(nil);

  IL_NotUsedImages.GetIcon(TNotUsedImageInfo(SelectedItemNotUsed).eImageIndex, FormRenameImageFile.Icon.Picture.Icon);
  //IL_NotUsedImages.Draw(FormRenameImageFile.IconBar.Bitmap.Canvas, 1, 2, TNotUsedImageInfo(SelectedItemNotUsed).eImageIndex);
  {ImageIcon:= TBitmap32.Create;
  TKernelResampler.Create(ImageIcon);
  TKernelResampler(ImageIcon.Resampler).Kernel:=
             TCustomKernelClass(THermiteKernel).Create; // Hermite filter

  ImageIcon.BeginUpdate;
  ImageIcon.Clear;
  ImageIcon.LoadFromFile(TNotUsedImageInfo(SelectedItemNotUsed).eFullPath+OldName);
  IconSize:= FormRenameImageFile.Icon.Width;
  if (ImageIcon.Width/ImageIcon.Height) <= (IconSize/IconSize) then
     begin
       // stretch height to match
       NewWidth:= MulDiv(IconSize, ImageIcon.Width, ImageIcon.Height);
       MakeThumbNail(ImageIcon, NewWidth, IconSize);
       // center horizontally
       //leftPos:= Trunc((IconSize-DestImage.Width) div 2);
       //topPos:= 0;
     end
  else
     begin
       // stretch width to match
       NewHeight:= MulDiv(IconSize, ImageIcon.Height, ImageIcon.Width);
       MakeThumbNail(ImageIcon, IconSize, NewHeight);
       // center vertically
       //leftPos:= 0;
       //topPos:= Trunc((IconSize-DestImage.Height) div 2);
     end;
  FreeAndNil(DestImage);
  FreeAndNil(ImageIcon);}

  FormRenameImageFile.Left:= PanelNotUsed.Left+FormImagesManager.Left+10;
  FormRenameImageFile.Top:= PanelNotUsed.Top+FormImagesManager.Top+28;

  FormRenameImageFile.OldFileName:= OldName;
  FormRenameImageFile.NewFilename.Text:= OldName;
  FormRenameImageFile.NewFilename.SelectAll;
  FormRenameImageFile.ShowModal;
  NewName:= Trim(FormRenameImageFile.NewFilename.Text);
  if FormRenameImageFile.mmResult = mrOk then
     begin
       NewName:= ChangeFileExt(NewName, ExtractFileExt(oldName));
       if RenameImageFile(OldName, NewName, TNotUsedImageInfo(SelectedItemNotUsed).eFullPath) then
          begin
            TNotUsedImageInfo(SelectedItemNotUsed).eFileName:= NewName;
            SelectedItemNotUsed.Invalidate(True);
            FormMain.ELV_SetSelectRibbon(Ord((not SameText(TNotUsedImageInfo(SelectedItemNotUsed).eFileName,
                                                           TNotUsedImageInfo(SelectedItemNotUsed).eNameOriginal))),
                                         NotUsedImagesList);
          end;
     end;
  FreeAndNil(FormRenameImageFile);
end;

procedure TFormImagesManager.NotUsedImagesListDblClick(
  Sender: TCustomEasyListview; Button: TCommonMouseButton;
  MousePos: TPoint; ShiftState: TShiftState; var Handled: Boolean);
begin
  PopupNotUsedViewFullScreen.Click;
end;

procedure TFormImagesManager.ButtonInvalidImagesDeleteFilesClick(
  Sender: TObject);
var
  Item, ItemToDelete: TEasyItem;
begin
   if not FormMain.CheckTotal(NotUsedImagesList) then
      begin
        NotUsedImagesList.SetFocus;
        Exit;
      end;
   if GenerateMessage(UpperCase(FormImagesManager.Caption), 'Delete invalid image files.',
                     '    You are about to delete all files on the list. '+
                     'Recycled bin is not supported. If for any reason a file cannot be deleted, it will not '+
                     'be removed from the list. Click No to cancel this operation.'+#13#10+
                     'Continue ?', 1, False, 2) = mrNo then
      begin
        NotUsedImagesList.SetFocus;
        Exit;
      end;
   NotUsedImagesList.BeginUpdate;
   Item:= NotUsedImagesList.Groups.LastItem;
   repeat
     ItemToDelete:= nil;
     if DeleteFile(TNotUsedImageInfo(Item).eFullPath+TNotUsedImageInfo(Item).eFileName) then
        ItemToDelete:= Item;
     Item:= NotUsedImagesList.Groups.PrevItem(Item);
     if ItemToDelete <> nil then
        NotUsedImagesList.Groups.DeleteItem(ItemToDelete);
   until Item = nil;
   NotUsedImagesList.EndUpdate;
   ClearSelectedNotUsed;
   IL_NotUsedImages.Clear;
   ResetNotUsedImagesList;
   UpdateTotalFilesLabelNotUsed;
   NotUsedImagesList.SetFocus;
end;

procedure TFormImagesManager.SplitterListMoved(Sender: TObject);
begin
  LabelTotalItemsNotUsed.Left:= PanelNotUsed.Left;
end;

procedure TFormImagesManager.ButtonImageCategoryClick(Sender: TObject);
begin
  SelectImageCategory;
end;

procedure TFormImagesManager.ButtonHelpClick(Sender: TObject);
begin
  CallMessageBox;
  FormMain.AddMsgText('Games With Missing Images', MsgTxtColors.colorFileName, [fsBold], taCenter);
  FormMain.AddMsgText(#13#10+'How to create a list of all games without a snapshot'+#13#10+#13#10, MsgTxtColors.colorBoldTitle, [], taCenter, 8, 'Verdana');
  FormMain.AddMsgText('    Select an ');
  FormMain.AddMsgText('image category', MsgTxtColors.colorFileName, [fsBold]);
  FormMain.AddMsgText('. More scan options are found in popup menu. Click ');
  FormMain.AddMsgText('Scan Missing Images', MsgTxtColors.colorFileName, [fsBold]);
  FormMain.AddMsgText(' button. Only one image category can be listed at a time (no mixed lists).'+
  #13#10+'    To ');
  FormMain.AddMsgText('create a snapshot', MsgTxtColors.colorFileName, [fsBold]);
  FormMain.AddMsgText(' (if emulator supports it), run selected game with ');
  FormMain.AddMsgText('Enter', MsgTxtColors.colorFileName, [fsBold]);
  FormMain.AddMsgText(' key, mouse double-click or ');
  FormMain.AddMsgText('Play', MsgTxtColors.colorFileName, [fsBold]);
  FormMain.AddMsgText(' in popup menu. To remove games from the list use ');
  FormMain.AddMsgText('Delete', MsgTxtColors.colorFileName, [fsBold]);
  FormMain.AddMsgText(' key or ');
  FormMain.AddMsgText('Remove Selected', MsgTxtColors.colorFileName, [fsBold]);
  FormMain.AddMsgText(' in popup menu.'+#13#10+'You can also ');
  FormMain.AddMsgText('export', MsgTxtColors.colorFileName, [fsBold]);
  FormMain.AddMsgText(' the list to a ');
  FormMain.AddMsgText('.txt file', MsgTxtColors.colorFileName, [fsBold]);
  FormMain.AddMsgText(' with ');
  FormMain.AddMsgText('Save Games List To File', MsgTxtColors.colorFileName, [fsBold]);
  FormMain.AddMsgText(' in popup menu.'+#13#10+'    Setting ');
  FormMain.AddMsgText('Scan Device Sets', MsgTxtColors.colorFileName, [fsBold]);
  FormMain.AddMsgText(' does not add device sets with no ROMs.'+#13#10+'    Setting ');
  FormMain.AddMsgText('Scan Non-Arcade Machines', MsgTxtColors.colorFileName, [fsBold]);
  FormMain.AddMsgText(' require ');
  FormMain.AddMsgText('mess.ini', MsgTxtColors.colorFileName, [fsBold]);
  FormMain.AddMsgText(' file created by AntoPISA (available in "version.ini" pack).'+#13#10+#13#10);

  FormMain.AddMsgText('Invalid Images Filenames', MsgTxtColors.colorFileName, [fsBold], taCenter);
  FormMain.AddMsgText(#13#10+'How to delete images not used by any game. '+#13#10+#13#10, MsgTxtColors.colorBoldTitle, [], taCenter, 8, 'Verdana');
  FormMain.AddMsgText('    Select an ');
  FormMain.AddMsgText('image category', MsgTxtColors.colorFileName, [fsBold]);
  FormMain.AddMsgText('. Click ');
  FormMain.AddMsgText('Scan Invalid Images', MsgTxtColors.colorFileName, [fsBold]);
  FormMain.AddMsgText(' button. Only one image category can be listed at a time (no mixed lists).'+
                      ' If you want to keep a file, remove it from the list with ');
  FormMain.AddMsgText('Delete', MsgTxtColors.colorFileName, [fsBold]);
  FormMain.AddMsgText(' key or ');
  FormMain.AddMsgText('Remove Selected', MsgTxtColors.colorFileName, [fsBold]);
  FormMain.AddMsgText(' in popup menu.'+#13#10+
    'You can also ');
  FormMain.AddMsgText('export', MsgTxtColors.colorFileName, [fsBold]);
  FormMain.AddMsgText('the list to a ');
  FormMain.AddMsgText('.txt file', MsgTxtColors.colorFileName, [fsBold]);
  FormMain.AddMsgText(' with ');
  FormMain.AddMsgText('Save List To File', MsgTxtColors.colorFileName, [fsBold]);
  FormMain.AddMsgText(' in popup menu.'+#13#10+'    Click ');
  FormMain.AddMsgText('Delete Invalid Images', MsgTxtColors.colorFileName, [fsBold]);
  FormMain.AddMsgText(' button to delete all files listed. Recycle bin is NOT supported.'+#13#10+#13#10);

  FormMain.AddMsgText('Available Images for Missing Games', MsgTxtColors.colorFileName, [fsBold], taCenter);
  FormMain.AddMsgText(#13#10+'How to delete available images for games you don''t have. '+#13#10+#13#10, MsgTxtColors.colorBoldTitle, [], taCenter, 8, 'Verdana');
  FormMain.AddMsgText('    Select an ');
  FormMain.AddMsgText('image category', MsgTxtColors.colorFileName, [fsBold]);
  FormMain.AddMsgText('. Click ');
  FormMain.AddMsgText('Scan Not Used Images', MsgTxtColors.colorFileName, [fsBold]);
  FormMain.AddMsgText(' button. If you want to keep an image file, remove the game from the list with ');
  FormMain.AddMsgText('Delete', MsgTxtColors.colorFileName, [fsBold]);
  FormMain.AddMsgText(' key or ');
  FormMain.AddMsgText('Remove Selected', MsgTxtColors.colorFileName, [fsBold]);
  FormMain.AddMsgText(' in popup menu.'+#13#10+
    '    You can also ');
  FormMain.AddMsgText('export', MsgTxtColors.colorFileName, [fsBold]);
  FormMain.AddMsgText(' the list to a ');
  FormMain.AddMsgText('.txt file', MsgTxtColors.colorFileName, [fsBold]);
  FormMain.AddMsgText(' with ');
  FormMain.AddMsgText('Save List To File', MsgTxtColors.colorFileName, [fsBold]);
  FormMain.AddMsgText(' in popup menu.'+#13#10+
                      'You can see the image of current selected games in the floating preview image window.');

  GenerateMessage('Images Manager', 'Usage tips.'+#13#10+
                  'Note: a minimum resolution of 1024x768 is required!', '', 2);
end;

procedure TFormImagesManager.ButtonScanMissingClick(Sender: TObject);
begin
  LoadGamesToMissingList;
end;

procedure TFormImagesManager.ButtonScanNotUsedImagesClick(Sender: TObject);
begin
  ScanNotUsedImagesToMissingList;
end;

procedure TFormImagesManager.ButtonScanInvalidImagesClick(Sender: TObject);
begin
  ScanFiles;
end;

procedure TFormImagesManager.MissingImagesListColumnSizeChanging(
  Sender: TCustomEasyListview; Column: TEasyColumn; Width,
  NewWidth: Integer; var Allow: Boolean);
begin
  if Column.Index > 3 then
     Allow:= False;
end;

procedure TFormImagesManager.ButtonNotUsedImagesDeleteFilesClick(
  Sender: TObject);
var
  Item, ItemToDelete: TEasyItem;
begin
   if not FormMain.CheckTotal(NotUsedImagesList) then
      begin
        NotUsedImagesList.SetFocus;
        Exit;
      end;
   if GenerateMessage(UpperCase(FormImagesManager.Caption), 'Delete image files of missing games.',
                     '    You are about to delete all files on the list. '+
                     'Recycled bin is not supported. If for any reason a file cannot be deleted, it will not '+
                     'be removed from the list. Click No to cancel this operation.'+#13#10+
                     'Continue ?', 1, False, 2) = mrNo then
      begin
        NotUsedImagesList.SetFocus;
        Exit;
      end;
   NotUsedImagesList.BeginUpdate;
   Item:= NotUsedImagesList.Groups.LastItem;
   repeat
     ItemToDelete:= nil;
     if TMissingImageInfo(Item).eFoundImageMissingGame <> '' then
     begin
       if DeleteFile(TMissingImageInfo(Item).eFoundImageMissingGame) then
          ItemToDelete:= Item;
     end;
     Item:= NotUsedImagesList.Groups.PrevItem(Item);
     if ItemToDelete <> nil then
        NotUsedImagesList.Groups.DeleteItem(ItemToDelete);
   until Item = nil;
   NotUsedImagesList.EndUpdate;
   ClearSelectedNotUsed;
   IL_NotUsedImages.Clear;
   ResetNotUsedImagesList;
   UpdateTotalGamesLabelMissing;
   NotUsedImagesList.SetFocus;
end;


end.

