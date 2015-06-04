unit uDeleteCloneImages;

interface

uses
  Windows, SysUtils, Classes, Graphics, Controls, Forms,
  StdCtrls, MPCommonObjects, MPCommonUtilities,
  EasyListview, ImgList, uMain, ExtCtrls, ComCtrls,
  uCommon, ToolWin, Buttons, PanelEx, GR32_Image, ShadowLabel,
  AdvOfficeButtons, Menus, BarMenus;

type
  TEasyGameInfo_dc = class(TEasyItemStored)
  private
    fROMIdentification: Integer;
    fTitle,
    fName,
    fClone,
    fDriverName: String;
    fScreenOrientation,
    fDriverStatus,
    fSystem,
    fGameStatus,
    fDeleteFromList: ShortInt;
  protected
    function GetCaptions(Column: Integer): WideString; override;
  public
    property eROMIdentification: Integer read fROMIdentification write fROMIdentification;
    property eTitle: String read fTitle write fTitle;
    property eName: String read fName write fName;
    property eClone: String read fClone write fClone;
    property eDriverName: String read fDriverName write fDriverName;
    property eScreenOrientation: ShortInt read fScreenOrientation write fScreenOrientation;
    property eDriverStatus: ShortInt read fDriverStatus write fDriverStatus;
    property eSystem: ShortInt read fSystem write fSystem;
    property eGameStatus: ShortInt read fGameStatus write fGameStatus;
    property eDeleteFromList: ShortInt read fDeleteFromList write fDeleteFromList;
  end;

type
  TFormDeleteCloneImages = class(TForm)
    PanelImages: TPanelEx;
    PanelScreen1: TPanel;
    ImageScr1: TImage32;
    PanelParentGameScr1: TPanel;
    ImageParentScr1: TImage32;
    IL_Systems: TImageList;
    BarTextInfoScr1: TPanelEx;
    LabelTextInfoScr1: TShadowLabel;
    BarTextInfoParentScr1: TPanelEx;
    LabelTextInfoParentScr1: TShadowLabel;
    PanelGames: TPanel;
    DeleteClonesList: TEasyListview;
    Shape1: TShape;
    PanelEx1: TPanelEx;
    ButtonSystem: TBitBtn;
    SystemIcon: TImage;
    ImageCategoryIcon: TImage;
    ButtonImageCategory: TBitBtn;
    ButtonScan: TBitBtn;
    ButtonDeleteImages: TBitBtn;
    ButtonDeleteSelected: TBitBtn;
    ButtonHelp: TBitBtn;
    ButtonClose: TBitBtn;
    ButtonRemoveSelected: TBitBtn;
    PanelEx2: TPanelEx;
    ButtonRenameToParent: TBitBtn;
    IL_ToolBar: TImageList;
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
    procedure ButtonCloseClick(Sender: TObject);
    procedure ButtonSystemClick(Sender: TObject);
    procedure ButtonImageCategoryClick(Sender: TObject);
    procedure ButtonScanClick(Sender: TObject);
    procedure ButtonDeleteImagesClick(Sender: TObject);
    procedure ButtonDeleteSelectedClick(Sender: TObject);
    function DeleteClonesListItemCompare(Sender: TCustomEasyListview;
      Column: TEasyColumn; Group: TEasyGroup; Item1, Item2: TEasyItem;
      var DoDefault: Boolean): Integer;
  private
    { Private declarations }
    SelectedItem: TEasyItem;
    ImageFullPath: String;
    WindowTitleError: String;
    procedure UpdateVertScrollbar;
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
  FormDeleteCloneImages: TFormDeleteCloneImages;

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

procedure TFormDeleteCloneImages.UpdateVertScrollbar;
begin
  if DeleteClonesList.Scrollbars.VertBarVisible then
     DeleteClonesList.Header.Columns[0].Width:= 383
  else
     DeleteClonesList.Header.Columns[0].Width:= 400;
end;

procedure TFormDeleteCloneImages.LoadImages;
var
  FileStr, FileExt: String;
begin
  FileStr:= ImageFullPath+TEasyGameInfo_dc(SelectedItem).eName;
  FileExt:= '.png';
  case FileExists(FileStr+FileExt) of
    True : ImageScr1.Bitmap.LoadFromFile(FileStr+FileExt);
    False:
      begin
        if not FormMain.ImagesPNGOnly(ButtonImageCategory.Tag) then
           begin
             FileExt:= '.jpg';
             if FileExists(FileStr+FileExt) then
                ImageScr1.Bitmap.LoadFromFile(FileStr+FileExt);
           end;
      end;
  end;
  if not ImageScr1.Bitmap.Empty then
     LabelTextInfoScr1.Caption:= 'GAME -- '+UpperCase(ExtractFileName(FileStr)+FileExt);

   // load parent image, if found
  if FormMain.GameIsClone(TEasyGameInfo_dc(SelectedItem).eClone) then
     begin
       FileStr:= ImageFullPath+TEasyGameInfo_dc(SelectedItem).eClone;
       FileExt:= '.png';
       case FileExists(FileStr+FileExt) of
         True : ImageParentScr1.Bitmap.LoadFromFile(FileStr+FileExt);
         False:
           begin
             if not FormMain.ImagesPNGOnly(ButtonImageCategory.Tag) then
                begin
                  FileExt:= '.jpg';
                  if FileExists(FileStr+FileExt) then
                     ImageParentScr1.Bitmap.LoadFromFile(FileStr+FileExt);
                end;
           end;
       end;
     end;
  if not ImageParentScr1.Bitmap.Empty then
     LabelTextInfoParentScr1.Caption:= 'PARENT GAME -- '+UpperCase(ExtractFileName(FileStr)+FileExt);

  SetCurrentDir(FormMain.FrontendPath);
end;

procedure TFormDeleteCloneImages.DeleteFiles(SelectedOnly: Boolean = False);
var
  Item, ItemToDelete: TEasyItem;
  FileStr, FileExt: String;
  Loop: Integer;
  imgDeleted: Boolean;
begin
  if not FormMain.CheckTotal(DeleteClonesList) then
     Exit;
  if not SelectedOnly then
     if GenerateMessage('Delete Files', 'Delete clone images.', '    You are about to delete all files in the list. '+
                     'Recycle bin is not supported. Are you sure ? Click No button to cancel.', 1) = mrNo then
        Exit;
  FormStatus.Show;
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
  repeat
    imgDeleted:= False;
    ItemToDelete:= nil;
    for Loop:=1 to 99 do
    begin
      FileStr:= FormMain.GetImageName(TEasyGameInfo_dc(Item).eName, Loop, 0);
      FileExt:= '.png';
      case FileExists(ImageFullPath+FileStr+FileExt) of
        True:
          begin
            if DeleteFile(ImageFullPath+FileStr+FileExt) then
               imgDeleted:= True;
          end;
        False:
          begin
            if not FormMain.ImagesPNGOnly(ButtonImageCategory.Tag) then
               begin
                 FileExt:= '.jpg';
                 if FileExists(ImageFullPath+FileStr+FileExt) then
                    begin
                      if DeleteFile(ImageFullPath+FileStr+FileExt) then
                         imgDeleted:= True;
                    end;
               end;
          end;
      end;
    end;
    case SelectedOnly of
      True:
        begin
          if not imgDeleted then
             Item.Selected:= False;
          Item:= DeleteClonesList.Selection.Next(Item);
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
  UpdateVertScrollbar;
  DeleteClonesList.EndUpdate;
  FormStatus.Close;
  ClearScreens;
  FormMain.ELV_SelectItem(DeleteClonesList, 0);
  DeleteClonesList.SetFocus;
  UpdateTotalGamesLabel;
end;

procedure TFormDeleteCloneImages.RenameImages;
var
  oldName, newName, FileExt: String;
  Loop: ShortInt;
  FileRenamed: Boolean;

  function RenameImageFile(ScreenIndex: ShortInt): Boolean;
  begin
    Result:= False;
    if (ScreenIndex > 1) and (not FormMain.ImagesPNGOnly(ButtonImageCategory.Tag)) then
       Exit;
    FileExt:= '.png';
    oldName:= ImageFullPath+FormMain.GetImageName(TEasyGameInfo_dc(SelectedItem).eName, ScreenIndex, 0);
    Result:= FileExists(oldName+FileExt);
    if (not Result) and (not FormMain.ImagesPNGOnly(ButtonImageCategory.Tag)) then
       begin
         FileExt:= '.jpg';
         Result:= FileExists(oldName+FileExt);
       end;
    if Result then
       newName:= ImageFullPath+FormMain.GetImageName(TEasyGameInfo_dc(SelectedItem).eClone, ScreenIndex, 0);
  end;
  
begin
  if FormMain.CheckMultipleSelected(DeleteClonesList) then
     Exit;
  if not FormMain.CheckSelected(DeleteClonesList) then
     Exit;
  if not FormMain.GameIsClone(TEasyGameInfo_dc(SelectedItem).eClone) then
     Exit;

  FileRenamed:= False;
  for Loop:= 1 to 10 do
  begin
    if RenameImageFile(Loop) then
       begin
         if RenameFile(oldName+FileExt, newName+FileExt) then
            FileRenamed:= True;
       end;
  end;
  if FileRenamed then
     begin
       ClearScreens;
       LoadImages;
     end;
end;

procedure TFormDeleteCloneImages.SelectImageCategory;
var
  selCat: ShortInt;
begin
  selCat:= FormMain.CallSelectImageCategory(ButtonImageCategory.Tag);
  if selCat = -1 then
     Exit;
  ButtonImageCategory.Tag:= selCat;
  ButtonImageCategory.Caption:= FormMain.PopupMenuImageCategories.Items[ButtonImageCategory.Tag].Caption;
  FormMain.IL_ImagesCategory_Small.GetIcon(ButtonImageCategory.Tag, ImageCategoryIcon.Picture.Icon);
end;

procedure TFormDeleteCloneImages.SelectSystem;
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

procedure TFormDeleteCloneImages.BuildGamesList;
var
  Item, addItem: TEasyItem;
  FolderStr: String;

  function AddGameToList: Boolean;
  var
    FileExtension: String;
  begin
    FileExtension:= '.png';
    Result:= (FormMain.TempGameVars.eSystemID = ButtonSystem.Tag) and
             FormMain.GameIsClone(FormMain.TempGameVars.eClone);

    if not Result then
       Exit;
    Result:= (not FormMain.IsROM_Bios(FormMain.TempGameVars.eROMIdentification)) and
             (not FormMain.IsROM_Device(FormMain.TempGameVars.eROMIdentification));

    if not Result then
       Exit;
    Result:= FileExists(FolderStr+FormMain.TempGameVars.eName+FileExtension);
    if not Result then
       begin
         if not FormMain.ImagesPNGOnly(ButtonImageCategory.Tag) then
            begin
              FileExtension:= '.jpg';
              Result:= FileExists(FolderStr+FormMain.TempGameVars.eName+FileExtension);
            end;
       end;
    if not Result then
       Exit;

    addItem:= DeleteClonesList.Items.AddCustom(TEasyGameInfo_dc, nil);
    addItem.ImageIndex:= FormMain.TempGameVars.eROMIdentification;
    addItem.StateImageIndexes[0]:= FormMain.TempGameVars.eSystemID;
    TEasyGameInfo_dc(addItem).eTitle:= FormMain.TempGameVars.eTitle;
    TEasyGameInfo_dc(addItem).eName:= FormMain.TempGameVars.eName;
    TEasyGameInfo_dc(addItem).eClone:= FormMain.TempGameVars.eClone;
    TEasyGameInfo_dc(addItem).eDriverName:= FormMain.TempGameVars.eDriverName;
    TEasyGameInfo_dc(addItem).eScreenOrientation:= FormMain.TempGameVars.eScreenOrientation;
    TEasyGameInfo_dc(addItem).eDriverStatus:= FormMain.TempGameVars.eDriverStatus;
    TEasyGameInfo_dc(addItem).eSystem:= FormMain.TempGameVars.eSystemID;
    TEasyGameInfo_dc(addItem).eGameStatus:= FormMain.TempGameVars.eGameSetStatus;
    TEasyGameInfo_dc(addItem).eDeleteFromList:= 0;
  end;

begin
  FormMain.ClearListView(DeleteClonesList);
  UpdateTotalGamesLabel;
  ImageFullPath:= '';
  FixBackgroundColor;

  if not FormMain.CheckTotal(FormMain.GamesListView) then
     begin
       SetSelectedGame;
       Exit;
     end;
  FolderStr:= FormMain.GetFolderFull(ButtonImageCategory.Tag, ButtonSystem.Tag);
  if (FolderStr = '') or (not DirectoryExists(FolderStr)) then
     Exit;
  FormStatus.Show;
  FormStatus.StartThreadClock;
  FormStatus.TitleStr('Scan Games Images');
  FormStatus.MessageStr('Validating images of clone games.');
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
  UpdateVertScrollbar;
  DeleteClonesList.EndUpdate;
  UpdateTotalGamesLabel;
  SelectedItem:= DeleteClonesList.Groups.FirstItem;
  DeleteClonesList.SetFocus;
  FormStatus.Close;
  SetSelectedGame(False);
end;

procedure TFormDeleteCloneImages.SetSelectedGame(AutoSelect: Boolean = True);
begin
  ClearScreens;
  if SelectedItem = nil then
     Exit;
  if not AutoSelect then
     begin
       TEasyGameInfo_dc(SelectedItem).Selected:= True;
       DeleteClonesList.Selection.FocusedItem:= SelectedItem;
       SelectedItem.MakeVisible(emvAuto);
     end;
  FormMain.ELV_SetSelectRibbon(TEasyGameInfo_dc(SelectedItem).eGameStatus, DeleteClonesList);
  LoadImages;
end;

procedure TFormDeleteCloneImages.ClearScreens;
begin
  ImageScr1.Bitmap:= nil;
  ImageParentScr1.Bitmap:= nil;
  LabelTextInfoScr1.Caption:= LabelTextInfoScr1.Hint;
  LabelTextInfoParentScr1.Caption:= LabelTextInfoParentScr1.Hint;
end;

procedure TFormDeleteCloneImages.FixBackgroundColor;
begin
  ImageScr1.Color:= FormMain.PopupMenuImageCategories.Items[ButtonImageCategory.Tag].Tag;
  ImageParentScr1.Color:= ImageScr1.Color;
end;

procedure TFormDeleteCloneImages.UpdateTotalGamesLabel;
begin
  //LabelTotalItems.Caption:= Format(' %.5u Games', [DeleteClonesList.Groups.ItemCount]);
end;

procedure TFormDeleteCloneImages.FormShow(Sender: TObject);
begin
  FormMain.IL_ArcadeSystem_Small.GetIcon(ButtonSystem.Tag, SystemIcon.Picture.Icon);
  FormMain.IL_ImagesCategory_Small.GetIcon(ButtonImageCategory.Tag, ImageCategoryIcon.Picture.Icon);

  ButtonSystem.Caption:= FormMain.GetEmulatorDescription(ButtonSystem.Tag);
  ButtonImageCategory.Caption:= FormMain.PopupMenuImageCategories.Items[ButtonImageCategory.Tag].Caption;

  WindowTitleError:= 'Error: '+FormDeleteCloneImages.Caption;

  FormMain.ELV_ResetNormalColors(DeleteClonesList);
  FixBackgroundColor;
  FormMain.LoadSystemsIcons(IL_Systems);
  UpdateTotalGamesLabel;
end;

procedure TFormDeleteCloneImages.DeleteClonesListItemPaintText(
  Sender: TCustomEasyListview; Item: TEasyItem; Position: Integer;
  ACanvas: TCanvas);
begin
  FormMain.GetCanvasFontCustom(TEasyGameInfo_dc(Item).eGameStatus,
                TEasyGameInfo_dc(Item).eDriverStatus,
                TEasyGameInfo_dc(Item).eClone, ACanvas, True);
end;


procedure TFormDeleteCloneImages.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  ClearScreens;
  FormMain.ClearListView(DeleteClonesList);
end;

procedure TFormDeleteCloneImages.DeleteClonesListColumnClick(
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

procedure TFormDeleteCloneImages.DeleteClonesListItemSelectionChanged(
  Sender: TCustomEasyListview; Item: TEasyItem);
begin
  if Item.Selected then
     begin
       SelectedItem:= Item;
       SetSelectedGame;
     end;
end;

procedure TFormDeleteCloneImages.DeleteClonesListKeyAction(
  Sender: TCustomEasyListview; var CharCode: Word; var Shift: TShiftState;
  var DoDefault: Boolean);
begin
  if CharCode = VK_DELETE then
     ButtonRemoveSelected.Click;
end;

procedure TFormDeleteCloneImages.ButtonHelpClick(Sender: TObject);
begin
  GenerateMessage('Help', 'How to use this feature ?',
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

procedure TFormDeleteCloneImages.ButtonRenameToParentClick(
  Sender: TObject);
begin
  RenameImages;
  DeleteClonesList.SetFocus;
end;

procedure TFormDeleteCloneImages.ButtonRemoveSelectedClick(Sender: TObject);
begin
  DeleteClonesList.Selection.DeleteSelected(True);
  UpdateVertScrollbar;
  UpdateTotalGamesLabel;
  DeleteClonesList.SetFocus;
end;

procedure TFormDeleteCloneImages.ButtonCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TFormDeleteCloneImages.ButtonSystemClick(Sender: TObject);
begin
  SelectSystem;
end;

procedure TFormDeleteCloneImages.ButtonImageCategoryClick(Sender: TObject);
begin
  SelectImageCategory;
end;

procedure TFormDeleteCloneImages.ButtonScanClick(Sender: TObject);
begin
  BuildGamesList;
end;

procedure TFormDeleteCloneImages.ButtonDeleteImagesClick(Sender: TObject);
begin
  DeleteFiles;
end;

procedure TFormDeleteCloneImages.ButtonDeleteSelectedClick(Sender: TObject);
begin
  DeleteFiles(True);
end;


function TFormDeleteCloneImages.DeleteClonesListItemCompare(
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

end.
