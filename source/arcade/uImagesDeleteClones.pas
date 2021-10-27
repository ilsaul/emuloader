unit uImagesDeleteClones;

interface

uses
  Windows, SysUtils, Classes, Graphics, Controls, Forms,
  StdCtrls, MPCommonObjects, MPCommonUtilities,
  EasyListview, ImgList, uMain, ExtCtrls, ComCtrls,
  uCommon, ToolWin, Buttons, PanelEx, GR32_Image, ShadowLabel,
  Menus, BarMenus, ButtonsEx, SplitterEx, IniFiles;

type
  TEasyGameInfo_dc = class(TEasyItemStored)
  private
    fROMIdentification: Integer;
    fIsFavorite: Boolean;
    fTitle: WideString;
    fName,
    fClone,
    fDriverName,
    fSoftwareName: String;
    fScreenOrientation,
    fDriverStatus,
    fSystem,
    fGameStatus,
    fDeleteFromList: ShortInt;
    fFileFullPath: String;
    fCloneFileFullPath: String;
  protected
    function GetCaptions(Column: Integer): WideString; override;
  public
    property eROMIdentification: Integer read fROMIdentification write fROMIdentification;
    property eIsFavorite: Boolean read fIsFavorite write fIsFavorite;
    property eTitle: WideString read fTitle write fTitle;
    property eName: String read fName write fName;
    property eClone: String read fClone write fClone;
    property eDriverName: String read fDriverName write fDriverName;
    property eScreenOrientation: ShortInt read fScreenOrientation write fScreenOrientation;
    property eDriverStatus: ShortInt read fDriverStatus write fDriverStatus;
    property eSystem: ShortInt read fSystem write fSystem;
    property eSoftwareName: String read fSoftwareName write fSoftwareName;
    property eGameStatus: ShortInt read fGameStatus write fGameStatus;
    property eDeleteFromList: ShortInt read fDeleteFromList write fDeleteFromList;
    property eFileFullPath: String read fFileFullPath write fFileFullPath;
    property eCloneFileFullPath: String read fCloneFileFullPath write fCloneFileFullPath;
  end;

type
  TFormImagesDeleteClones = class(TForm)
    PanelImages: TPanelEx;
    PanelGameScr1: TPanelEx;
    ImageScr1: TImage32;
    PanelParentGameScr1: TPanelEx;
    ImageParentScr1: TImage32;
    BarTextInfoScr1: TPanelEx;
    LabelTextInfoScr1: TShadowLabel;
    BarTextInfoParentScr1: TPanelEx;
    LabelTextInfoParentScr1: TShadowLabel;
    PanelGames: TPanelEx;
    DeleteClonesList: TEasyListview;
    PanelTop: TPanelEx;
    SystemIcon: TImage;
    ImageCategoryIcon: TImage;
    ButtonScan: TBitBtnEx;
    ButtonDeleteImages: TBitBtnEx;
    ButtonDeleteSelected: TBitBtnEx;
    ButtonHelp: TBitBtnEx;
    ButtonRemoveSelected: TBitBtnEx;
    ButtonRenameToParent: TBitBtnEx;
    IL_ToolBar: TImageList;
    LabelSystem: TShadowLabel;
    LabelImageCategory: TShadowLabel;
    Splitter: TSplitterEx;
    procedure FormShow(Sender: TObject);
    procedure DeleteClonesListItemPaintText(Sender: TCustomEasyListview;
      Item: TEasyItem; Position: Integer; ACanvas: TCanvas);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure DeleteClonesListColumnClick(Sender: TCustomEasyListview;
      Button: TCommonMouseButton; ShiftState: TShiftState;
      const Column: TEasyColumn);
    procedure DeleteClonesListItemSelectionChanged(
      Sender: TCustomEasyListview; Item: TEasyItem);
    procedure DeleteClonesListKeyAction(Sender: TCustomEasyListview;
      var CharCode: Word; var Shift: TShiftState; var DoDefault: Boolean);
    procedure ButtonHelpClick(Sender: TObject);
    procedure ButtonRenameToParentClick(Sender: TObject);
    procedure ButtonRemoveSelectedClick(Sender: TObject);
    procedure ButtonScanClick(Sender: TObject);
    procedure ButtonDeleteImagesClick(Sender: TObject);
    procedure ButtonDeleteSelectedClick(Sender: TObject);
    function DeleteClonesListItemCompare(Sender: TCustomEasyListview;
      Column: TEasyColumn; Group: TEasyGroup; Item1, Item2: TEasyItem;
      var DoDefault: Boolean): Integer;
    procedure SystemIconClick(Sender: TObject);
    procedure ImageCategoryIconClick(Sender: TObject);
    procedure PanelImagesResize(Sender: TObject);
    procedure PanelGamesResize(Sender: TObject);
  private
    { Private declarations }
    SelectedItem: TEasyItem;
    ImageFullPath: String;
    WindowTitleError: String;
    procedure ReadSettings;
    procedure WriteSettings;
    procedure LoadImages;
    procedure DeleteFiles(SelectedOnly: Boolean = False);
    procedure RenameImages;
    procedure SelectImageCategory;
    procedure SelectSystem;
    procedure UpdateTotalGamesLabel;
    procedure BuildGamesList;
    procedure SetSelectedGame(AutoSelect: Boolean = True);
    procedure ClearScreens;
    procedure FixBackgroundColor;
  public
    { Public declarations }
  end;

var
  FormImagesDeleteClones: TFormImagesDeleteClones;

implementation

uses uStatus;

{$R *.dfm}

function TEasyGameInfo_dc.GetCaptions(Column: Integer): WideString;
begin
  case Column of
    0: Result:= eTitle;
    1: Result:= eName;
    2: Result:= eClone;
    3: Result:= IntToStr(eSystem);
  end;
end;

procedure TFormImagesDeleteClones.LoadImages;
var
  FileStr, FileExt, SoftNameFolder: String;
begin
  if (TEasyGameInfo_dc(SelectedItem).eFileFullPath = '') and (TEasyGameInfo_dc(SelectedItem).eCloneFileFullPath = '') then
     Exit;

  FileStr:= TEasyGameInfo_dc(SelectedItem).eFileFullPath;
  if FileExistsW(FileStr) then
     ImageScr1.Bitmap.LoadFromFile(FileStr);

  if not ImageScr1.Bitmap.Empty then
     LabelTextInfoScr1.Caption:= 'GAME -- '+UpperCase(ExtractFileName(FileStr));

  // load parent image, if found
  FileStr:= TEasyGameInfo_dc(SelectedItem).eCloneFileFullPath;
  if FileExistsW(FileStr) then
     ImageParentScr1.Bitmap.LoadFromFile(FileStr);
  if not ImageParentScr1.Bitmap.Empty then
     LabelTextInfoParentScr1.Caption:= 'PARENT GAME -- '+UpperCase(ExtractFileName(FileStr));

  SetCurrentDir(FrontendPath);
end;

procedure TFormImagesDeleteClones.DeleteFiles(SelectedOnly: Boolean = False);
var
  Item, ItemToDelete: TEasyItem;
  FileStr, FileExt, FolderStr: String;
  Loop, selItem: Integer;
  imgDeleted: Boolean;
begin
  if not FormMain.CheckTotal(DeleteClonesList) then
     Exit;
  if not SelectedOnly then
     if FormMain.ShowMessageBox('Delete Files', 'Delete clone images.', '    You are about to delete all files in the list. '+
                     'Images of parent games will not be deleted.'+#13#10+
                     '    Recycle bin is not supported. Are you sure ? Click No button to cancel.', 1) = mrNo then
        Exit;
  FormMain.ShowStatusForm;
  FormStatus.StartThreadClock;
  FormStatus.TitleStr('Delete Clone Images');
  case SelectedOnly of
    True : FormStatus.MessageStr('Deleting all images (.png; .jpg) for the selected games...');
    False: FormStatus.MessageStr('Deleting all images (.png; .jpg)...');
  end;
  DeleteClonesList.BeginUpdate;
  DeleteClonesList.Items.ReIndexDisable:= True;
  case SelectedOnly of
    True : Item:= DeleteClonesList.Selection.First;
    False: Item:= DeleteClonesList.Groups.LastItem;
  end;
  selItem:= 1;
  repeat
    imgDeleted:= False;
    ItemToDelete:= nil;
    
    FolderStr:= ExtractFilePath(TEasyGameInfo_dc(Item).eFileFullPath);

    for Loop:=1 to 99 do
    begin
      FileExt:= '.png';
      if Loop = 1 then
         FileStr:= TEasyGameInfo_dc(Item).eFileFullPath
      else
         begin
           FileStr:= FormMain.GetImageName(TEasyGameInfo_dc(Item).eName, Loop, 0);
           FileStr:= FolderStr+FileStr+FileExt;
         end;

      if FileExistsW(FileStr) then
         begin
           if DeleteFile(FileStr) then
              imgDeleted:= True;
         end;

      if not FormMain.ImagesPNGOnly(ImageCategoryIcon.Tag) then
         begin
           FileExt:= '.jpg';
           if Loop = 1 then
              FileStr:= ChangeFileExt(TEasyGameInfo_dc(Item).eFileFullPath, FileExt)
           else
              begin
                FileStr:= FormMain.GetImageName(TEasyGameInfo_dc(Item).eName, Loop, 0);
                FileStr:= FolderStr+FileStr+FileExt;
              end;

           if FileExistsW(FileStr) then
              begin
                if DeleteFile(FileStr) then
                   imgDeleted:= True;
              end;
         end;
    end;
    case SelectedOnly of
      True:
        begin
          if not imgDeleted then
             Item.Selected:= False;
          Item:= FormMain.ELV_GetNextSelected(DeleteClonesList, Item, selItem);
        end;
      False:
        begin
          if imgDeleted then
             ItemToDelete:= Item;
          Item:= DeleteClonesList.Groups.PrevItem(Item);
          if ItemToDelete <> nil then
             DeleteClonesList.Groups.DeleteItem(ItemToDelete);
        end;
    end;
    Application.ProcessMessages;
  until Item = nil;
  DeleteClonesList.Items.ReIndexDisable:= False;
  if SelectedOnly then
     DeleteClonesList.Selection.DeleteSelected;
  DeleteClonesList.EndUpdate;
  FormStatus.Close;
  ClearScreens;
  FormMain.ELV_SelectItem(DeleteClonesList, 0);
  DeleteClonesList.SetFocus;
  UpdateTotalGamesLabel;
end;

procedure TFormImagesDeleteClones.RenameImages;
var
  oldName, newName, FileExt, FolderStr: String;
  Loop: ShortInt;
  ItemRename: TEasyItem;
  selItem: Integer;
  Renamed: Boolean;

  function RenameImageFile(ScreenIndex: ShortInt): Boolean;
  begin
    Result:= False;
    if (ScreenIndex > 1) and (not FormMain.ImagesPNGOnly(ImageCategoryIcon.Tag)) then
       Exit;
    FileExt:= '.png';

    if ScreenIndex = 1 then
       oldName:= TEasyGameInfo_dc(ItemRename).eFileFullPath // ImageFullPath+SoftNameFolder+FormMain.GetImageName(TEasyGameInfo_dc(SelectedItem).eName, ScreenIndex, 0);
    else
       oldName:= FolderStr+FormMain.GetImageName(TEasyGameInfo_dc(ItemRename).eName, ScreenIndex, 0)+FileExt;
    Result:= FileExists(oldName);
    if (not Result) and (not FormMain.ImagesPNGOnly(ImageCategoryIcon.Tag)) then
       begin
         FileExt:= '.jpg';
         oldName:= ChangeFileExt(oldName, FileExt);
         Result:= FileExists(oldName);
       end;
    if Result then
       begin
         if ScreenIndex = 1 then
            newName:= FolderStr+TEasyGameInfo_dc(ItemRename).eClone+FileExt
         else
            newName:= FolderStr+ FormMain.GetImageName(TEasyGameInfo_dc(ItemRename).eClone, ScreenIndex, 0)+FileExt;
       end;
  end;
  
begin
  if FormMain.CheckSingleSelected(DeleteClonesList) then
     begin
       if not FormMain.GameIsClone(TEasyGameInfo_dc(SelectedItem).eClone) then
          Exit;
     end;

  if not FormMain.CheckSelected(DeleteClonesList) then
     Exit;

  ItemRename:= DeleteClonesList.Selection.First;
  selItem:= 1;
  repeat
    if FormMain.GameIsClone(TEasyGameInfo_dc(ItemRename).eClone) then
    begin
      FolderStr:= ExtractFilePath(TEasyGameInfo_dc(ItemRename).eFileFullPath);
      Renamed:= False;
      for Loop:= 1 to 30 do
      begin
        if RenameImageFile(Loop) then
           begin
             if RenameFile(oldName, newName) then
                begin
                  if not Renamed then
                     begin
                       Renamed:= True;
                       TEasyGameInfo_dc(ItemRename).eFileFullPath:= '';
                       TEasyGameInfo_dc(ItemRename).eCloneFileFullPath:= newName;
                     end;
                end;
           end;
      end;
    end;
    ItemRename:= FormMain.ELV_GetNextSelected(DeleteClonesList, ItemRename, selItem);
  until ItemRename = nil;

  {for Loop:= 1 to 10 do
  begin
    FolderStr:= ExtractFilePath(TEasyGameInfo_dc(SelectedItem).eFileFullPath);
    if RenameImageFile(Loop) then
       begin
         if RenameFile(oldName, newName) then
            begin
              TEasyGameInfo_dc(SelectedItem).eFileFullPath:= '';
              TEasyGameInfo_dc(SelectedItem).eCloneFileFullPath:= newName;
              FileRenamed:= True;
            end;
       end;
  end;}

  ClearScreens;
  LoadImages;
end;

procedure TFormImagesDeleteClones.SelectImageCategory;
var
  selCat: ShortInt;
begin
  selCat:= FormMain.CallSelectImageCategory(ImageCategoryIcon.Tag, False, True, True);
  if selCat = -1 then
     Exit;
  ImageCategoryIcon.Tag:= selCat;
  LabelImageCategory.Caption:= GetImageCategoryTitle(ImageCategoryIcon.Tag);
  FormMain.AddDefaultIcons(ImageCategoryArray[ImageCategoryIcon.Tag, 0], '', nil, 2, ImageCategoryIcon);
end;

procedure TFormImagesDeleteClones.SelectSystem;
var
  selSys: ShortInt;
begin
  selSys:= FormMain.CallSelectArcadeSystem(0, SystemIcon.Tag-1);
  if selSys = -1 then
     Exit;
  SystemIcon.Tag:= selSys;
  LabelSystem.Caption:= FormMain.GetArcadeSystemShortTitle(selSys);
  FormMain.LoadSystemIcon(SystemIcon.Tag, SystemIcon, False);
end;

procedure TFormImagesDeleteClones.BuildGamesList;
var
  Item, addItem: TEasyItem;
  FolderStr, SoftListFolderStr, FileFullStr, CloneFileFullStr: String;

  function AddGameToList: Boolean;
  var
    FileExtension, ExtraMAMEImageFolderStr: String;
    iLoopMAME: Integer;
  begin
    Result:= (FormMain.TempGameVars.eSystemID = SystemIcon.Tag) and
             FormMain.GameIsClone(FormMain.TempGameVars.eClone);

    if not Result then
       Exit;
    Result:= (not FormMain.IsROM_Bios(FormMain.TempGameVars.eROMIdentification)) and
             (not FormMain.IsROM_Device(FormMain.TempGameVars.eROMIdentification));

    if not Result then
       Exit;

    FileExtension:= '.png';
    SoftListFolderStr:= '';
    ExtraMAMEImageFolderStr:= '';
    if FormMain.TempGameVars.eSoftwareName <> '' then
       SoftListFolderStr:= FormMain.TempGameVars.eSoftwareName+'\';

    FileFullStr:= '';
    CloneFileFullStr:= '';
    if FormMain.IsMAMEBasedSys(FormMain.TempGameVars.eSystemID) then
       begin
         if FormMain.imgFolderMAME[Ord(FormMain.TempGameVars.eSystemID <> idMAME)+1, ImageCategoryIcon.Tag] <> nil then
         begin
           ExtraMAMEImageFolderStr:= ImageCategoryArray[ImageCategoryIcon.Tag, 3]+'\';
           for iLoopMAME:=0 to FormMain.imgFolderMAME[Ord(FormMain.TempGameVars.eSystemID <> idMAME)+1, ImageCategoryIcon.Tag].Count-1 do
           begin
             FolderStr:= FormMain.imgFolderMAME[Ord(FormMain.TempGameVars.eSystemID <> idMAME)+1, ImageCategoryIcon.Tag].Strings[iLoopMAME];
             FolderStr:= FormMain.FullEmuFolderFix(FolderStr, FormMain.TempGameVars.eSystemID, True); // for zipped images
             Result:= FileExistsW(FolderStr+SoftListFolderStr+FormMain.TempGameVars.eName+FileExtension);
             if Result then
                FileFullStr:= FolderStr+SoftListFolderStr+FormMain.TempGameVars.eName+FileExtension;

             Result:= FileExistsW(FolderStr+SoftListFolderStr+FormMain.TempGameVars.eClone+FileExtension);
             if Result then
                CloneFileFullStr:= FolderStr+SoftListFolderStr+FormMain.TempGameVars.eClone+FileExtension;

             if (FileFullStr <> '') and (CloneFileFullStr <> '') then
                Break
             else
             begin
               if FileFullStr = '' then
               begin
                 Result:= FileExistsW(FolderStr+ExtraMAMEImageFolderStr+SoftListFolderStr+FormMain.TempGameVars.eName+FileExtension);
                 if Result then
                    FileFullStr:= FolderStr+ExtraMAMEImageFolderStr+SoftListFolderStr+FormMain.TempGameVars.eName+FileExtension;
               end;
               if CloneFileFullStr = '' then
               begin
                 Result:= FileExistsW(FolderStr+ExtraMAMEImageFolderStr+SoftListFolderStr+FormMain.TempGameVars.eClone+FileExtension);
                 if Result then
                    CloneFileFullStr:= FolderStr+ExtraMAMEImageFolderStr+SoftListFolderStr+FormMain.TempGameVars.eClone+FileExtension;
               end;

               if (FileFullStr <> '') and (CloneFileFullStr <> '') then
                  Break
               else
               begin
                 if (not FormMain.ImagesPNGOnly(ImageCategoryIcon.Tag)) then
                 begin
                   FileExtension:= '.jpg';
                   if FileFullStr = '' then
                   begin
                     Result:= FileExistsW(FolderStr+SoftListFolderStr+FormMain.TempGameVars.eName+FileExtension);
                     if Result then
                        FileFullStr:= FolderStr+SoftListFolderStr+FormMain.TempGameVars.eName+FileExtension;
                   end;
                   if CloneFileFullStr = '' then
                   begin
                     Result:= FileExistsW(FolderStr+SoftListFolderStr+FormMain.TempGameVars.eClone+FileExtension);
                     if Result then
                        CloneFileFullStr:= FolderStr+SoftListFolderStr+FormMain.TempGameVars.eClone+FileExtension;
                   end;
                   if (FileFullStr <> '') and (CloneFileFullStr <> '') then
                      Break
                   else
                   begin
                     if FileFullStr = '' then
                     begin
                       Result:= FileExistsW(FolderStr+ExtraMAMEImageFolderStr+SoftListFolderStr+FormMain.TempGameVars.eName+FileExtension);
                       if Result then
                          FileFullStr:= FolderStr+ExtraMAMEImageFolderStr+SoftListFolderStr+FormMain.TempGameVars.eName+FileExtension;
                     end;
                     if CloneFileFullStr = '' then
                     begin
                       Result:= FileExistsW(FolderStr+ExtraMAMEImageFolderStr+SoftListFolderStr+FormMain.TempGameVars.eClone+FileExtension);
                       if Result then
                          CloneFileFullStr:= FolderStr+ExtraMAMEImageFolderStr+SoftListFolderStr+FormMain.TempGameVars.eClone+FileExtension;
                     end;
                     if (FileFullStr <> '') and (CloneFileFullStr <> '') then
                        Break;
                   end;
                 end;
               end;
             end;
           end;
         end;
       end
    else
       begin
          Result:= FileExists(FolderStr+SoftListFolderStr+FormMain.TempGameVars.eName+FileExtension);
          if Result then
             FileFullStr:= FolderStr+SoftListFolderStr+FormMain.TempGameVars.eName+FileExtension;

          Result:= FileExists(FolderStr+SoftListFolderStr+FormMain.TempGameVars.eClone+FileExtension);
          if Result then
             CloneFileFullStr:= FolderStr+SoftListFolderStr+FormMain.TempGameVars.eClone+FileExtension;

          if (FileFullStr <> '') and (CloneFileFullStr <> '') then
             Exit;
          if not FormMain.ImagesPNGOnly(ImageCategoryIcon.Tag) then
             begin
               FileExtension:= '.jpg';
               if FileFullStr = '' then
               begin
                 Result:= FileExists(FolderStr+SoftListFolderStr+FormMain.TempGameVars.eName+FileExtension);
                 if Result then
                    FileFullStr:= FolderStr+SoftListFolderStr+FormMain.TempGameVars.eName+FileExtension;
               end;
               if CloneFileFullStr = '' then
               begin
                 Result:= FileExists(FolderStr+SoftListFolderStr+FormMain.TempGameVars.eClone+FileExtension);
                 if Result then
                    CloneFileFullStr:= FolderStr+SoftListFolderStr+FormMain.TempGameVars.eClone+FileExtension;
               end;
             end;
       end;

    if FileFullStr = '' then
       Exit;

    addItem:= DeleteClonesList.Items.AddCustom(TEasyGameInfo_dc, nil);
    addItem.ImageIndex:= FormMain.GetMAMEImageIndex(FormMain.TempGameVars.eROMIdentification, FormMain.TempGameVars.eSoftwareName, FormMain.TempGameVars.eGameSetStatus);

    addItem.StateImageIndexes[0]:= FormMain.GetImageIndexSystemID(FormMain.TempGameVars.eSystemID);
    TEasyGameInfo_dc(addItem).eIsFavorite:= FormMain.TempGameVars.eIsFavorite;
    TEasyGameInfo_dc(addItem).eTitle:= FormMain.TempGameVars.eTitle;
    TEasyGameInfo_dc(addItem).eName:= FormMain.TempGameVars.eName;
    TEasyGameInfo_dc(addItem).eClone:= FormMain.TempGameVars.eClone;
    TEasyGameInfo_dc(addItem).eDriverName:= FormMain.TempGameVars.eDriverName;
    TEasyGameInfo_dc(addItem).eScreenOrientation:= FormMain.TempGameVars.eScreenOrientation;
    TEasyGameInfo_dc(addItem).eDriverStatus:= FormMain.TempGameVars.eDriverStatus;
    TEasyGameInfo_dc(addItem).eSystem:= FormMain.TempGameVars.eSystemID;
    TEasyGameInfo_dc(addItem).eSoftwareName:= FormMain.TempGameVars.eSoftwareName;
    TEasyGameInfo_dc(addItem).eGameStatus:= FormMain.TempGameVars.eGameSetStatus;
    TEasyGameInfo_dc(addItem).eDeleteFromList:= 0;
    TEasyGameInfo_dc(addItem).eFileFullPath:= FileFullStr;
    TEasyGameInfo_dc(addItem).eCloneFileFullPath:= CloneFileFullStr;
  end;

begin
  FormMain.ClearListView(DeleteClonesList);
  UpdateTotalGamesLabel;
  ImageFullPath:= '';
  FolderStr:= '';
  FixBackgroundColor;

  if not FormMain.CheckTotal(FormMain.GamesListView) then
     begin
       SetSelectedGame;
       Exit;
     end;
  if FormMain.IsMAMEBasedSys(SystemIcon.Tag) then
     begin
       if FormMain.imgFolderMAME[Ord(SystemIcon.Tag <> idMAME)+1, ImageCategoryIcon.Tag] = nil then
          Exit;
     end
  else
     begin
       FolderStr:= FormMain.GetFolderFull(ImageCategoryIcon.Tag, SystemIcon.Tag);
       if (FolderStr = '') or (not DirectoryExists(FolderStr)) then
          Exit;
     end;

  FormMain.ShowStatusForm;
  FormStatus.StartThreadClock;
  FormStatus.TitleStr('Scan Games Images');
  FormStatus.MessageStr('Validating images of clone games.');
  if not FormMain.IsMAMEBasedSys(SystemIcon.Tag) then
     ImageFullPath:= FolderStr;
  DeleteClonesList.BeginUpdate;
  DeleteClonesList.Items.ReIndexDisable:= True;

  Item:= FormMain.GamesListView.Groups.FirstItem;
  repeat
    FormMain.FillTempGameInfo(Item);
    AddGameToList;
    Item:= FormMain.GamesListView.Groups.NextItem(Item);
  until Item = nil;

  DeleteClonesList.Items.ReIndexDisable:= False;
  DeleteClonesList.Sort.SortAll;
  DeleteClonesList.EndUpdate;
  UpdateTotalGamesLabel;
  SelectedItem:= DeleteClonesList.Groups.FirstItem;
  DeleteClonesList.SetFocus;
  FormStatus.Close;
  SetSelectedGame(False);
end;

procedure TFormImagesDeleteClones.SetSelectedGame(AutoSelect: Boolean = True);
begin
  ClearScreens;
  if SelectedItem = nil then
     Exit;
  if not AutoSelect then
     begin
       TEasyGameInfo_dc(SelectedItem).Selected:= True;
       DeleteClonesList.Selection.FocusedItem:= SelectedItem;
       SelectedItem.MakeVisible(emvMiddle) //(emvAuto);
     end;
  FormMain.ELV_SetSelectRibbon(TEasyGameInfo_dc(SelectedItem).eGameStatus, DeleteClonesList);
  LoadImages;
end;

procedure TFormImagesDeleteClones.ClearScreens;
begin
  ImageScr1.Bitmap:= nil;
  ImageParentScr1.Bitmap:= nil;
  LabelTextInfoScr1.Caption:= LabelTextInfoScr1.Hint;
  LabelTextInfoParentScr1.Caption:= LabelTextInfoParentScr1.Hint;
end;

procedure TFormImagesDeleteClones.FixBackgroundColor;
begin
  ImageScr1.Color:= FormMain.ImageCategorySettings[ImageCategoryIcon.Tag].BackgroundColor;
  ImageParentScr1.Color:= ImageScr1.Color;
end;

procedure TFormImagesDeleteClones.UpdateTotalGamesLabel;
begin
  //LabelTotalItems.Caption:= Format(' %.5u Games', [DeleteClonesList.Groups.ItemCount]);
end;

procedure TFormImagesDeleteClones.ReadSettings;
var
  INIFile: TMemIniFile;
begin
  try
    INIFile:= TMemIniFile.Create(FormMain.GetFrontendExtraIniFile);

    FormImagesDeleteClones.Width:= INIFile.ReadInteger('ImagesDeleteClones', 'ScreenWidth', 1006);
    FormImagesDeleteClones.Height:= INIFile.ReadInteger('ImagesDeleteClones', 'ScreenHeight', 610);
    PanelImages.Width:= INIFile.ReadInteger('ImagesDeleteClones', 'SplitterPos', 352);
  finally
    FreeAndNil(INIFile);
  end;
end;

procedure TFormImagesDeleteClones.WriteSettings;
var
  INIFile: TMemIniFile;
begin
  try
    INIFile:= TMemIniFile.Create(FormMain.GetFrontendExtraIniFile);
    INIFile.EraseSection('ImagesDeleteClones');
    INIFile.WriteInteger('ImagesDeleteClones', 'ScreenWidth', FormImagesDeleteClones.Width);
    INIFile.WriteInteger('ImagesDeleteClones', 'ScreenHeight', FormImagesDeleteClones.Height);
    INIFile.WriteInteger('ImagesDeleteClones', 'SplitterPos', PanelImages.Width);
    INIFile.UpdateFile;
  finally
    FreeAndNil(INIFile);
  end;
end;

procedure TFormImagesDeleteClones.FormShow(Sender: TObject);
begin
  ReadSettings;
  FormMain.LoadSystemIcon(SystemIcon.Tag, SystemIcon, False);
  FormMain.AddDefaultIcons(ImageCategoryArray[ImageCategoryIcon.Tag, 0], '', nil, 2, ImageCategoryIcon);

  LabelSystem.Caption:= FormMain.GetArcadeSystemShortTitle(SystemIcon.Tag);
  LabelImageCategory.Caption:= GetImageCategoryTitle(ImageCategoryIcon.Tag);

  WindowTitleError:= 'Error: '+FormImagesDeleteClones.Caption;

  FormMain.ELV_ResetNormalColors(DeleteClonesList);
  FixBackgroundColor;

  DeleteClonesList.Color:= FormMain.GamesListView.Color;
  if FormMain.GamesListView.BackGround.Enabled then
     begin
       DeleteClonesList.BackGround.Image.Assign(FormMain.GamesListView.BackGround.Image);
       DeleteClonesList.BackGround.Tile:= FormMain.GamesListView.BackGround.Tile;
       DeleteClonesList.BackGround.Enabled:= True;
     end;

  DeleteClonesList.Font:= FormMain.GamesListView.Font;

  if IsNightMode then
     begin
       FormImagesDeleteClones.Color:= menu_background_color[1];
       SetPanelColors(PanelTop, FormMain.PanelSearchGames_ToolBar.Color1, FormMain.PanelSearchGames_ToolBar.Color2, (FormMain.PanelSearchGames_ToolBar.Style <> vgSimple));

       SetLabelColors(LabelSystem,        item_caption_active_color[1], item_caption_active_shadow_color[1]);
       SetLabelColors(LabelImageCategory, item_caption_active_color[1], item_caption_active_shadow_color[1]);

       SetLabelColors(LabelTextInfoScr1, clCream,  clrDarkGray);
       LabelTextInfoScr1.Color:= clrMedDarkGray;
       SetLabelColors(LabelTextInfoParentScr1, clCream,  clrDarkGray);
       LabelTextInfoParentScr1.Color:= clrMedDarkGray;

       BarTextInfoScr1.Color1:= FormImagesDeleteClones.Color;
       BarTextInfoParentScr1.Color1:= FormImagesDeleteClones.Color;
       PanelParentGameScr1.Color1:= FormImagesDeleteClones.Color;
       PanelGameScr1.Color1:= FormImagesDeleteClones.Color;

       FormMain.SetButtonExColors(ButtonScan);
       FormMain.SetButtonExColors(ButtonRemoveSelected);
       FormMain.SetButtonExColors(ButtonRenameToParent);
       FormMain.SetButtonExColors(ButtonDeleteImages);
       FormMain.SetButtonExColors(ButtonDeleteSelected);
       FormMain.SetButtonExColors(ButtonHelp);

       FormMain.SetEasyListViewColors(DeleteClonesList, -1, -1, clrOrangeBarTop);
       FormMain.SetEasyListViewHeaderColors(DeleteClonesList, True, False, False);
       FormMain.SetWin10DarkScrollBar(DeleteClonesList);
     end;
     
  UpdateTotalGamesLabel;
end;

procedure TFormImagesDeleteClones.DeleteClonesListItemPaintText(
  Sender: TCustomEasyListview; Item: TEasyItem; Position: Integer;
  ACanvas: TCanvas);
begin
  FormMain.GetCanvasFont(TEasyGameInfo_dc(Item).eSystem,
                         -1,
                         False,
                         TEasyGameInfo_dc(Item).eGameStatus,
                         TEasyGameInfo_dc(Item).eDriverStatus,
                         TEasyGameInfo_dc(Item).eClone, ACanvas, False, DeleteClonesList);
  if ACanvas.Font.Size <> 9 then
     ACanvas.Font.Size:= 9;
  FormMain.ELV_ItemPaintText_General(Sender, Item, ACanvas, TEasyGameInfo_dc(Item).eGameStatus);
end;


procedure TFormImagesDeleteClones.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  WriteSettings;
  ClearScreens;
  FormMain.ClearListView(DeleteClonesList);
end;

procedure TFormImagesDeleteClones.DeleteClonesListColumnClick(
  Sender: TCustomEasyListview; Button: TCommonMouseButton;
  ShiftState: TShiftState; const Column: TEasyColumn);
begin
  if Button = cmbLeft then
     begin
       DeleteClonesList.BeginUpdate;
       DeleteClonesList.Sort.SortAll;
       DeleteClonesList.EndUpdate(False);
     end;
end;

procedure TFormImagesDeleteClones.DeleteClonesListItemSelectionChanged(
  Sender: TCustomEasyListview; Item: TEasyItem);
begin
  if Item.Selected then
     begin
       SelectedItem:= Item;
       SetSelectedGame;
     end;
end;

procedure TFormImagesDeleteClones.DeleteClonesListKeyAction(
  Sender: TCustomEasyListview; var CharCode: Word; var Shift: TShiftState;
  var DoDefault: Boolean);
begin
  if CharCode = VK_DELETE then
     ButtonRemoveSelected.Click;
end;

procedure TFormImagesDeleteClones.ButtonHelpClick(Sender: TObject);
begin
  FormMain.ShowMessageBox('Help', 'How to use this feature ?',
                  '    Select an image category and a system, then hit the "Scan" button at the top bar.'+#13#10+
                  'If a valid folder for the category + system selected is found, all clone games will be scanned for '+
                  'valid screenshots (list is always cleaned on a new scan).'+#13#10+
                  'Only unzipped images are scanned!'+#13#10+
                  '    After the list is built, you have 4 options:'+#13#10+
                  '1. Remove all games from the list that you want to keep the screenshot, by using the "Remove '+
                  'Selected" button or hitting the DELETE hot-key.'+#13#10+
                  '2. If a game have clone screenshots but not parent ones, you can rename it '+
                  'to save the trouble of taking the screenshot again for the parent game. Use the "Rename To Parent"'+
                  'button.'+#13#10+
                  '3. Delete images of all clones listed by using the "Delete Images" button. Recycle bin is "not"'+
                  'supported!'+#13#10+
                  '4. Change image category and/or system and repeat from step #1.'+#13#10+#13#10+
                  '    Multiple selection is supported to remove games from list but not for renaming. Incremental search '+
                  'is also supported: type the description of the game you want to find.'+#13#10+
                  '    To make this easy, a screenshot of the parent game is shown at the bottom of the preview area named '+
                  '"PARENT GAME". So, if a clone game have an identical screenshot you will only need the one from the '+
                  'parent game.'+#13#10+'Missing games are also scanned and shown in the list.', 2);
end;

procedure TFormImagesDeleteClones.ButtonRenameToParentClick(
  Sender: TObject);
begin
  RenameImages;
  DeleteClonesList.SetFocus;
end;

procedure TFormImagesDeleteClones.ButtonRemoveSelectedClick(Sender: TObject);
begin
  DeleteClonesList.Selection.DeleteSelected(True);
  UpdateTotalGamesLabel;
  DeleteClonesList.SetFocus;
end;

procedure TFormImagesDeleteClones.ButtonScanClick(Sender: TObject);
begin
  BuildGamesList;
end;

procedure TFormImagesDeleteClones.ButtonDeleteImagesClick(Sender: TObject);
begin
  DeleteFiles;
end;

procedure TFormImagesDeleteClones.ButtonDeleteSelectedClick(Sender: TObject);
begin
  DeleteFiles(True);
end;

function TFormImagesDeleteClones.DeleteClonesListItemCompare(
  Sender: TCustomEasyListview; Column: TEasyColumn; Group: TEasyGroup;
  Item1, Item2: TEasyItem; var DoDefault: Boolean): Integer;
var
  gItem1, gItem2: TEasyItem;
begin
  DoDefault:= False;
  FormMain.ELV_GetSortDirection(Column, Item1, Item2, gItem1, gItem2);
  case Column.Index of
    0: Result:= FormMain.iCompare(TEasyGameInfo_dc(gItem1).eTitle, TEasyGameInfo_dc(gItem2).eTitle);
    1: Result:= FormMain.iCompare(TEasyGameInfo_dc(gItem1).eName, TEasyGameInfo_dc(gItem2).eName);
    2: Result:= FormMain.iCompare(TEasyGameInfo_dc(gItem1).eClone, TEasyGameInfo_dc(gItem2).eClone);
  end;
end;

procedure TFormImagesDeleteClones.SystemIconClick(Sender: TObject);
begin
  SelectSystem;
end;

procedure TFormImagesDeleteClones.ImageCategoryIconClick(Sender: TObject);
begin
  SelectImageCategory;
end;

procedure TFormImagesDeleteClones.PanelImagesResize(Sender: TObject);
var
  iSize: Integer;
begin
  iSize:= PanelImages.Height div 2;
  if PanelGameScr1.Height <> iSize then
     PanelGameScr1.Height:= iSize;
end;

procedure TFormImagesDeleteClones.PanelGamesResize(Sender: TObject);
var
  iSize: Integer;
begin
  iSize:= DeleteClonesList.Width-(DeleteClonesList.Header.Columns[1].Width+DeleteClonesList.Header.Columns[2].Width)-2-GetSystemMetrics(SM_CXVSCROLL);
  if DeleteClonesList.Header.Columns[0].Width <> iSize then
     DeleteClonesList.Header.Columns[0].Width:= iSize;
end;

end.
