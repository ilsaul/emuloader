unit uImagesManager;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, ToolWin,
  ComCtrls, StdCtrls, ImgList, GraphicEx, GR32_Image, GR32, GR32_Resamplers,
  ExtCtrls, Buttons, Menus, BarMenus, MPCommonObjects, ShellAPI,
  MPCommonUtilities, EasyListview, IniFiles, uCommon, SplitterEx, PanelEx,
  ShadowLabel;

type
  TMissingImageInfo = class(TEasyItemStored)
  private
    fROMIdentification: Integer;
    fSystemID: Integer;
    fSystemType: ShortInt;
    fImageCategory: ShortInt;
    fTitle: WideString;
    fName: String;
    fClone: String;
    fCloneParent: String;
    fDriverName: String;
    fSoftwareName: String;
    fDriverStatus: ShortInt;
    fEmulationStatus: ShortInt;
    fColorStatus: ShortInt;
    fSoundStatus: ShortInt;
    fGraphicStatus: ShortInt;
    fGameStatus: ShortInt; // 0 - have or miss; 1 - missing ROMs/CHDs
  protected
    function GetCaptions(Column: Integer): WideString; override;
    function GetImageIndexes(Column: Integer): TCommonImageIndexInteger; override;
    function GetStateImageIndexes(Column: Integer): TCommonImageIndexInteger; override;
  public
    property eROMIdentification: Integer read fROMIdentification write fROMIdentification;
    property eSystemID: Integer read fSystemID write fSystemID;
    property eSystemType: ShortInt read fSystemType write fSystemType;
    property eImageCategory: ShortInt read fImageCategory write fImageCategory;
    property eTitle: WideString read fTitle write fTitle;
    property eName: String read fName write fName;
    property eClone: String read fClone write fClone;
    property eCloneParent: String read fCloneParent write fCloneParent;
    property eDriverName: String read fDriverName write fDriverName;
    property eSoftwareName: String read fSoftwareName write fSoftwareName;
    property eDriverStatus: ShortInt read fDriverStatus write fDriverStatus;
    property eEmulationStatus: ShortInt read fEmulationStatus write fEmulationStatus;
    property eColorStatus: ShortInt read fColorStatus write fColorStatus;
    property eSoundStatus: ShortInt read fSoundStatus write fSoundStatus;
    property eGraphicStatus: ShortInt read fGraphicStatus write fGraphicStatus;

    property eGameStatus: ShortInt read fGameStatus write fGameStatus;
  end;

  TNotUsedImageInfo = class(TEasyItemStored)
  private
    fImageIndex: Integer;
    fImageLoaded: Boolean;
    fSystemID: Integer;
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
    property eSystemID: Integer read fSystemID write fSystemID;
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
    BottomBar: TCoolBar;
    LabelTotalItemsNotUsed: TLabel;
    ButtonNotUsedDeleteFiles: TSpeedButton;
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
    PanelToolBarButtons: TPanelEx;
    SystemIcon: TImage;
    ImageCategoryIcon: TImage;
    ButtonHelp: TBitBtn;
    ButtonScanNotUsed: TBitBtn;
    NotUsedImagesList: TEasyListview;
    SplitterNotUsed: TSplitterEx;
    ImagePreview: TImage32;
    LabelSystemSelector: TShadowLabel;
    LabelImageCategory: TShadowLabel;
    procedure FormShow(Sender: TObject);
    procedure FormCanResize(Sender: TObject; var NewWidth,
      NewHeight: Integer; var Resize: Boolean);
    procedure FormActivate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure PopupMissingImagesMeasureMenuItem(Sender: TObject;
      AMenuItem: TMenuItem; ACanvas: TCanvas; var Width, Height: Integer;
      ABarVisible: Boolean; var DefaultMeasure: Boolean);
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
    procedure ButtonNotUsedDeleteFilesClick(Sender: TObject);
    procedure ButtonHelpClick(Sender: TObject);
    procedure ButtonScanNotUsedClick(Sender: TObject);
    procedure SystemIconClick(Sender: TObject);
    procedure ImageCategoryIconClick(Sender: TObject);
  private
    { Private declarations }
    SelectedItemNotUsed: TEasyItem;

    procedure SelectSystem;
    procedure SelectImageCategory;

    procedure ReadIniFile;
    procedure WriteIniFile;

    function  ValidateImageFolder: Boolean;

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
    3: Result:= eDriverName;
    //3: Result:= aStatus[eDriverStatus];
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
  if Column = 4 then
     Result:= eDriverStatus
  else
     begin
        if not (eSystemID in [idMAME, idHBMAME]) then
           Exit;
       case Column of
         5: Result:= eEmulationStatus;
         6: Result:= eColorStatus;
         7: Result:= eSoundStatus;
         8: Result:= eGraphicStatus;
       end;
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

procedure TFormImagesManager.SelectSystem;
var
  selSys: ShortInt;
begin
  selSys:= FormMain.CallSelectSystem(0, SystemIcon.Tag);
  if selSys = -1 then
     Exit;
  SystemIcon.Tag:= selSys;
  LabelSystemSelector.Caption:= FormMain.GetSystemShortTitle(selSys);
  FormMain.IL_ArcadeSystem_Small.GetIcon(SystemIcon.Tag, SystemIcon.Picture.Icon);
end;

procedure TFormImagesManager.SelectImageCategory;
var
  selCat: ShortInt;
begin
  selCat:= FormMain.CallSelectImageCategory(ImageCategoryIcon.Tag);
  if selCat = -1 then
     Exit;
  ImageCategoryIcon.Tag:= selCat;
  LabelImageCategory.Caption:= FormMain.PopupMenuImageCategories.Items[ImageCategoryIcon.Tag].Caption;
  FormMain.IL_ImagesCategory_Small.GetIcon(ImageCategoryIcon.Tag, ImageCategoryIcon.Picture.Icon);
end;

procedure TFormImagesManager.ReadIniFile;
var
  INIFile: TMemIniFile;
begin
  try
    INIFile:= TMemIniFile.Create(FormMain.FrontendPath+'el_extras.ini');
    FormImagesManager.Tag:= Ord(INIFile.ReadString('ImagesManager', 'WindowState', 'Normal') = 'Maximized');
    FormImagesManager.Width:= INIFile.ReadInteger('ImagesManager', 'ScreenWidth', 1200);
    FormImagesManager.Height:= INIFile.ReadInteger('ImagesManager', 'ScreenHeight', 600);
    FormImagesManager.Left:= INIFile.ReadInteger('ImagesManager', 'ScreenLeft', (Screen.Width shr 1)-(Width shr 1)-1);
    FormImagesManager.Top:= INIFile.ReadInteger('ImagesManager', 'ScreenTop', (Screen.Height shr 1)-(Height shr 1)-1);

    //PanelNotUsed.Width:= INIFile.ReadInteger('ImagesManager', 'MainSplitterPos', 594);
    //ImagePreview.Height:= INIFile.ReadInteger('ImagesManager', 'ImageSplitterPos', 200);
  finally
    FreeAndNil(INIFile);
  end;
end;

procedure TFormImagesManager.WriteIniFile;
var
  INIFile: TMemIniFile;
begin
  try
    INIFile:= TMemIniFile.Create(FormMain.FrontendPath+'el_extras.ini');
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
    //INIFile.WriteInteger('ImagesManager', 'MainSplitterPos', PanelNotUsed.Width);
    //INIFile.WriteInteger('ImagesManager', 'ImageSplitterPos', ImagePreview.Height);

    INIFile.UpdateFile;
  finally
    FreeAndNil(INIFile);
  end;
end;

function TFormImagesManager.ValidateImageFolder: Boolean;
var
  tmpFolder: String;
begin
  tmpFolder:= FormMain.GetFolderFull(ImageCategoryIcon.Tag, SystemIcon.Tag);
  Result:= tmpFolder <> '';// DirectoryExists(tmpFolder);
  if Result then
     Exit;

  if GenerateMessage('Error', FormMain.GetEmulatorDescription(SystemIcon.Tag),
                     'No folder is selected for '+LabelImageCategory.Caption+'. Would you like to select one now ?', 1) = mrYes then
     begin
       FormMain.MenuImageCategoryLayoutSettings.Click;
       ValidateImageFolder;
       //tmpFolder:= FormMain.GetFolderFull(ButtonImageCategory.Tag, ButtonSystem.Tag);
       //Result:= DirectoryExists(tmpFolder);
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
  el_GamesList, tempList: THashedStringList;
  WindowTitleError, ActiveFolder, AddToFolder: String;
  gItem, Item: TEasyItem;
  MainFolderGroup, Group: TEasyGroup;
  Loop2: Integer;
  Folder: String;

  function CheckGameFiles(FileIndex: Integer; ImageExt: String): Boolean;
  var
    iLoop: Byte;
    strName, tempString: String;
  begin
    Result:= True;
    strName:= el_GamesList[FileIndex];
    for iLoop:=1 to 10 do
    begin
      tempString:= Folder+
                   Format('%s%s', [FormMain.GetImageName(strName, iLoop, 0), ImageExt]);

      FileIndex:= tempList.IndexOf(tempString);
      if FileIndex <> -1 then
         tempList.Delete(FileIndex)
      else
         Break;
         // stop scan since files need to be sequential
         // valid  : gamename.png; gamename0000.png; gamename0001.png; gamename0002.png
         // invalid: gamename.png; gamename0000.png; gamename0002.png
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
             MainFolderGroup.ImageIndex:= ImageCategoryIcon.Tag;
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
             Group.ImageIndex:= ImageCategoryIcon.Tag;
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
  tempList:= THashedStringList.Create;
  //FormMain.GetGamesList(tempList, ButtonSystem.Tag, 0,

  gItem:= FormMain.GamesListView.Groups.FirstItem;
  repeat
    FormMain.FillTempGameInfo(gItem);
    if TEasyGameInfo(gItem).eSystemID = SystemIcon.Tag then
       el_GamesList.Add(TEasyGameInfo(gItem).eName);
    gItem:= FormMain.GamesListView.Groups.NextItem(gItem);
  until gItem = nil;

  el_GamesList.EndUpdate;
  el_GamesList.Sorted:= False;

  // scan image files
  FormStatus.MessageStr('Building images files list');
  Folder:= FormMain.GetFolderFull(ImageCategoryIcon.Tag, SystemIcon.Tag);
  tempList:= THashedStringList.Create;
  GetFilesList(Folder, '.png', '*.*', tempList, True, False, True);
  if not FormMain.ImagesPNGOnly(ImageCategoryIcon.Tag) then
     GetFilesList(Folder, '.jpg', '*.*', tempList, True, False, True);

  Loop2:= Ord(tempList.Count > 0);
  case Boolean(Loop2) of
    True:
      begin
        tempList.BeginUpdate;
        FormStatus.MessageStr('Validating files (up to 10 images per game)');
        for Loop2:=0 to el_GamesList.Count-1 do
        begin
          CheckGameFiles(Loop2, '.png');
          if not FormMain.ImagesPNGOnly(ImageCategoryIcon.Tag) then
             CheckGameFiles(Loop2, '.jpg');
          FormStatus.UpdateProgressBar(Loop2, el_GamesList.Count-1);
          Application.ProcessMessages;
        end;
        tempList.EndUpdate;
        if tempList.Count > 0 then
           begin
             FormMain.ClearListView(NotUsedImagesList);
             NotUsedImagesList.BeginUpdate;
             NotUsedImagesList.Items.ReIndexDisable:= True;
             ActiveFolder:= '';
             AddToFolder:= '';
             for Loop2:=0 to tempList.Count-1 do
             begin
               AddToFolder:= ExtractFilePath(tempList[Loop2]);
               if ActiveFolder = '' then
                  ActiveFolder:= AddToFolder;

               Item:= AddToGroup(tempList[Loop2]);
               TNotUsedImageInfo(Item).eImageLoaded:= False;
               TNotUsedImageInfo(Item).eSystemID:= SystemIcon.Tag;
               TNotUsedImageInfo(Item).eImageCategory:= ImageCategoryIcon.Tag;
               TNotUsedImageInfo(Item).eFileName:= ExtractFileName(tempList[Loop2]);
               TNotUsedImageInfo(Item).eSize:= GetFileSize(tempList[Loop2]);
               TNotUsedImageInfo(Item).eSizeText:= FormMain.GetSizeType(TNotUsedImageInfo(Item).eSize, False);
               TNotUsedImageInfo(Item).eDateTime:= FileAge(tempList[Loop2]);
               TNotUsedImageInfo(Item).eDateTimeText:= FormMain.GetDateTimeStr(TNotUsedImageInfo(Item).eDateTime);
               TNotUsedImageInfo(Item).eFullPath:= ExtractFilePath(tempList[Loop2]);
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
             GenerateMessage(FormImagesManager.Caption, FormMain.GetEmulatorDescription(SystemIcon.Tag),
                             'Scanning complete but nothing was found.', 2);
           end;
      end;
    False:
      begin
        case DirectoryExists(Folder) of
          True : GenerateMessage(FormImagesManager.Caption,
                      'Search for not used images.'+#13#10+
                        FormMain.GetEmulatorDescription(SystemIcon.Tag),
                        '    No files were found in '+Folder, 2);
          False: GenerateMessage(FormImagesManager.Caption,
                      'Search for not used images.'+#13#10+
                        FormMain.GetEmulatorDescription(SystemIcon.Tag),
                        '    No files were found in '+Folder+#13#10+'Folder does not exist.', 2);
        end;
      end;
  end;
  FreeAndNil(tempList);
  FreeAndNil(el_GamesList);
  UpdateTotalFilesLabelNotUsed;
  if ShowFolderMessage then
     FormStatus.Close;
end;

function TFormImagesManager.LoadImageNotUsed(const ImageName: String): Integer;
var
  ImageToLoad, DestImage: TBitmap32;
  newWidth,
  newHeight,
  leftPos,
  topPos,
  IconSize: Integer;
  addImage: TBitmap;

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
  IconSize:= IL_NotUsedImages.Width;
  ImageToLoad:= TBitmap32.Create;
  ImageToLoad.Clear;
  TKernelResampler.Create(ImageToLoad);
  TKernelResampler(ImageToLoad.Resampler).Kernel:=
             TCustomKernelClass(THermiteKernel).Create; // Hermite (used to be Lanczos filter)

  ImageToLoad.LoadFromFile(ImageName);
  if (ImageToLoad.Width/ImageToLoad.Height) <= (IconSize/IconSize) then
     begin
       // stretch height to match
       NewWidth:= MulDiv(IconSize, ImageToLoad.Width, ImageToLoad.Height);
       MakeThumbNail(ImageToLoad, NewWidth, IconSize);
       // center horizontally
       leftPos:= Trunc((IconSize-DestImage.Width) div 2);
       topPos:= 0;
     end
  else
     begin
       // stretch width to match
       NewHeight:= MulDiv(IconSize, ImageToLoad.Height, ImageToLoad.Width);
       MakeThumbNail(ImageToLoad, IconSize, NewHeight);
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
     ShellExecute(Handle, 'open', PChar(imgFile), nil, nil, SW_SHOWNORMAL);
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
                    TCustomKernelClass(THermiteKernel).Create;
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

  FormMain.IL_ArcadeSystem_Small.GetIcon(SystemIcon.Tag, SystemIcon.Picture.Icon);
  FormMain.IL_ImagesCategory_Small.GetIcon(ImageCategoryIcon.Tag, ImageCategoryIcon.Picture.Icon);

  LabelSystemSelector.Caption:= FormMain.GetSystemShortTitle(SystemIcon.Tag);
  LabelImageCategory.Caption:= FormMain.PopupMenuImageCategories.Items[ImageCategoryIcon.Tag].Caption;

  FormMain.ELV_ResetNormalColors(NotUsedImagesList);
end;

procedure TFormImagesManager.FormCanResize(Sender: TObject; var NewWidth,
  NewHeight: Integer; var Resize: Boolean);
begin
  if NewWidth < 931 then
     Resize:= False;
  //LabelTotalItemsNotUsed.Left:= PanelNotUsed.Left;
  //ButtonNotUsedDeleteFiles.Left:= BottomBar.Width-166;
end;

procedure TFormImagesManager.FormActivate(Sender: TObject);
begin
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
end;

procedure TFormImagesManager.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if FormImagesManager.WindowState = wsMinimized then
     begin
       CanClose:= False;
       Exit;
     end;
  FormMain.ClearListView(NotUsedImagesList);
  WriteIniFile;
  FormImagesManager.Release;
  FormImagesManager:= nil;
end;

procedure TFormImagesManager.PopupMissingImagesMeasureMenuItem(
  Sender: TObject; AMenuItem: TMenuItem; ACanvas: TCanvas; var Width,
  Height: Integer; ABarVisible: Boolean; var DefaultMeasure: Boolean);
begin
  FormMain.SetPopupMenuMeasureItem(AMenuItem, ACanvas, Width, Height);
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
begin
  if Item.Selected and (NotUsedImagesList.Selection.Count = 1) then
     begin
       SelectedItemNotUsed:= Item;
       FormMain.ELV_SetSelectRibbon(Ord((not SameText(TNotUsedImageInfo(Item).eFileName, TNotUsedImageInfo(Item).eNameOriginal))),
                                    NotUsedImagesList);
       try
         ImagePreview.Bitmap.LoadFromFile(TNotUsedImageInfo(Item).eFullPath+TNotUsedImageInfo(Item).eFileName);
       except
         ImagePreview.Bitmap:= nil;
       end;
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
  FileStr:= FormMain.DialogSaveFile(4, 'Save Not Used Images List To a File');
  if FileStr = '' then
     Exit;

  ListOutput:= THashedStringList.Create;
  ListOutput.BeginUpdate;
  ListOutput.Add('----------> Not Used Images <----------'+#13#10);
  ListOutput.Add('  -> System: '+FormMain.GetEmulatorDescription(TNotUsedImageInfo(Item).eSystemID));
  ListOutput.Add('  -> Image Category: '+FormMain.PopupMenuImageCategories.Items[TNotUsedImageInfo(Item).eImageCategory].Caption);
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

  FormRenameImageFile.Left:= NotUsedImagesList.Left+FormImagesManager.Left+10;
  FormRenameImageFile.Top:= NotUsedImagesList.Top+FormImagesManager.Top+28;

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

procedure TFormImagesManager.ButtonNotUsedDeleteFilesClick(
  Sender: TObject);
var
  Item, ItemToDelete: TEasyItem;
begin
   if not FormMain.CheckTotal(NotUsedImagesList) then
      begin
        NotUsedImagesList.SetFocus;
        Exit;
      end;
   if GenerateMessage(UpperCase(FormImagesManager.Caption), 'Delete not used files',
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

procedure TFormImagesManager.ButtonHelpClick(Sender: TObject);
begin
  CallMessageBox;
  FormMain.AddMsgText('Games With Missing Images', $00a65300, [fsBold], taCenter);
  FormMain.AddMsgText(#13#10+'How to create a list of all games without a snapshot'+#13#10+#13#10, $00323232, [], taCenter, 8, 'Verdana');
  FormMain.AddMsgText('    Select a ');
  FormMain.AddMsgText('system', $00a65300, [fsBold]);
  FormMain.AddMsgText(' and an ');
  FormMain.AddMsgText('image category', $00a65300, [fsBold]);
  FormMain.AddMsgText('. More scan options are found in popup menu. Click ');
  FormMain.AddMsgText('Scan Missing', $00a65300, [fsBold]);
  FormMain.AddMsgText(' button. Only one system and one image category can be listed at a time (no mixed lists).'+
  #13#10+'    To ');
  FormMain.AddMsgText('create a snapshot', $00a65300, [fsBold]);
  FormMain.AddMsgText(' (if emulator supports it), run selected game with ');
  FormMain.AddMsgText('Enter', $00a65300, [fsBold]);
  FormMain.AddMsgText(' key, mouse double-click or ');
  FormMain.AddMsgText('Play', $00a65300, [fsBold]);
  FormMain.AddMsgText(' in popup menu. To remove games from the list use ');
  FormMain.AddMsgText('Delete', $00a65300, [fsBold]);
  FormMain.AddMsgText(' key or ');
  FormMain.AddMsgText('Remove Selected', $00a65300, [fsBold]);
  FormMain.AddMsgText(' in popup menu.'+#13#10+'You can also ');
  FormMain.AddMsgText('export', $00a65300, [fsBold]);
  FormMain.AddMsgText(' the list to a ');
  FormMain.AddMsgText('.txt file', $00a65300, [fsBold]);
  FormMain.AddMsgText(' with ');
  FormMain.AddMsgText('Save Games List To File', $00a65300, [fsBold]);
  FormMain.AddMsgText(' in popup menu.'+#13#10+#13#10);
  FormMain.AddMsgText('Not Used Images', $00a65300, [fsBold], taCenter);
  FormMain.AddMsgText(#13#10+'How to delete images not used by any game. '+#13#10+#13#10, $00323232, [], taCenter, 8, 'Verdana');
  FormMain.AddMsgText('    Select a ');
  FormMain.AddMsgText('system', $00a65300, [fsBold]);
  FormMain.AddMsgText(' and an ');
  FormMain.AddMsgText('image category', $00a65300, [fsBold]);
  FormMain.AddMsgText('. Click ');
  FormMain.AddMsgText('Scan Not Used', $00a65300, [fsBold]);
  FormMain.AddMsgText(' button. If you want to keep a file, remove it from the list with ');
  FormMain.AddMsgText('Delete', $00a65300, [fsBold]);
  FormMain.AddMsgText(' key or ');
  FormMain.AddMsgText('Remove Selected', $00a65300, [fsBold]);
  FormMain.AddMsgText(' in popup menu.'+#13#10+
    'You can also ');
  FormMain.AddMsgText('export', $00a65300, [fsBold]);
  FormMain.AddMsgText('the list to a ');
  FormMain.AddMsgText('.txt file', $00a65300, [fsBold]);
  FormMain.AddMsgText(' with ');
  FormMain.AddMsgText('Save List To File', $00a65300, [fsBold]);
  FormMain.AddMsgText(' in popup menu.'+#13#10+'    Click ');
  FormMain.AddMsgText('Delete Not Used Images', $00a65300, [fsBold]);
  FormMain.AddMsgText(' button to delete all files listed. Recycle bin is NOT supported.'+#13#10+#13#10+'You can use ');
  FormMain.AddMsgText('Scan Both', $00a65300, [fsBold]);
  FormMain.AddMsgText(' to scan missing and not used images at once.');
  GenerateMessage('Images Manager', 'Usage tips.'+#13#10+
                  'Note: a minimum resolution of 1024x768 is required!', '', 2);
end;

procedure TFormImagesManager.ButtonScanNotUsedClick(Sender: TObject);
begin
  // from "Scan Both"
  //if not ValidateImageFolder then
  //   Exit;
  //FormStatus.Show;
  //FormStatus.StartThreadClock;
  //FormStatus.TitleStr(FormImagesManager.Caption);
  //ScanFiles(False);
  //FormStatus.Close;
  ScanFiles; // this is from "Scan Not Used" button
end;

procedure TFormImagesManager.SystemIconClick(Sender: TObject);
begin
  SelectSystem;
end;

procedure TFormImagesManager.ImageCategoryIconClick(Sender: TObject);
begin
  SelectImageCategory;
end;

end.
