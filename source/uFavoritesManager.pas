unit uFavoritesManager;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ToolWin, IniFiles, PanelEx, MPCommonObjects,
  MPCommonUtilities, MPThreadManager, EasyListview, StdCtrls, Buttons,
  ShadowLabel, ExtCtrls, ImgList, AdvOfficeButtons, ButtonsEx, Themes,
  Menus, BarMenus;
type
  TFavFileInfo = class(TEasyItemStored)
  private
    fTitle: String;
    fFileName: String;
    fDateTime: Integer;
    fDateTimeText: String;
    fGamesCount: Integer;
  protected
    function GetCaptions(Column: Integer): WideString; override;
  public
    property eTitle: String read fTitle write fTitle;
    property eFileName: String read fFileName write fFileName;
    property eDateTime: Integer read fDateTime write fDateTime;
    property eDateTimeText: String read fDateTimeText write fDateTimeText;
    property eGamesCount: Integer read fGamesCount write fGamesCount;
  end;

  TFavCleanseInfo = class(TEasyItemStored)
  private
    fImageIndex: Integer;
    fSystemID: Integer;
    fSystemTitle: String;
    fMediaType: Integer;
    fIsCustomGame: Boolean;
    fName: WideString;
    fEntryString: String;
  protected
    function GetCaptions(Column: Integer): WideString; override;
  public
    property eImageIndex: Integer read fImageIndex write fImageIndex;
    property eSystemID: Integer read fSystemID write fSystemID;
    property eSystemTitle: String read fSystemTitle write fSystemTitle; 
    property eMediaType: Integer read fMediaType write fMediaType;
    property eIsCustomGame: Boolean read fIsCustomGame write fIsCustomGame;
    property eName: WideString read fName write fName;
    property eEntryString: String read fEntryString write fEntryString;
  end;

type
  TFormFavoritesManager = class(TForm)
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
  FormFavoritesManager: TFormFavoritesManager;

implementation

{$R *.dfm}

uses uMain, uCommon, uCommonCustom, uFavoritesManagerCleanseProfile;

function TFavFileInfo.GetCaptions(Column: Integer): WideString;
begin
  case Column of
    0: Result:= eTitle;
    1: Result:= IntToStr(eGamesCount);
    2: Result:= eFileName;
    3: Result:= eDateTimeText;
  end;
end;

function TFavCleanseInfo.GetCaptions(Column: Integer): WideString;
begin
  case Column of
    0: Result:= eName;
    1: Result:= eSystemTitle;
  end;
end;

procedure TFormFavoritesManager.UpdateDateTime(destItem: TEasyItem; const fFile: String);
begin
  TFavFileInfo(destItem).eDateTime:= FileAgeW(fFile);
  TFavFileInfo(destItem).eDateTimeText:= FormMain.GetDateTimeStr(TFavFileInfo(destItem).eDateTime);
end;

function TFormFavoritesManager.ELV_AddItem(const fFile: String): TEasyItem;
var
  Item: TEasyItem;
  favList: THashedStringList;
  HaveTitle: Integer;
  FoundTxt: Boolean;
begin
  favList:= THashedStringList.Create;
  FoundTxt:= FileExists(FormMain.GetFavoritesFolder+fFile);
  if FoundTxt then
     favList.LoadFromFile(FormMain.GetFavoritesFolder+fFile);

  Item:= FavoritesList.Items.AddCustom(TFavFileInfo, nil);
  Item.ImageIndex:= -1;
  if FormMain.IsFavoriteDefault(fFile) then
     begin
       HaveTitle:= 0;
       TFavFileInfo(Item).eTitle:= 'Default';
       Item.Bold:= True;
     end
  else
     begin
       if FoundTxt then
          TFavFileInfo(Item).eTitle:= favList.Values['favorite_title'];
       if TFavFileInfo(Item).eTitle = '' then
          TFavFileInfo(Item).eTitle:= ChangeFileExt(fFile, '');

       if FoundTxt then
       begin
         HaveTitle:= Ord(favList.IndexOfName('favorite_title') <> -1);
         if HaveTitle = 0 then
            begin
              // favorites profile have no title so, give it one!!!!
              favList.Insert(0, 'favorite_title='+TFavFileInfo(Item).eTitle);
              favList.SaveToFile(FormMain.GetFavoritesFolder+fFile);
              HaveTitle:= 1;
            end;
       end;
     end;

  TFavFileInfo(Item).eFileName:= fFile;
  if FoundTxt then
     begin
       UpdateDateTime(Item, FormMain.GetFavoritesFolder+fFile);
       TFavFileInfo(Item).eGamesCount:= favList.Count-HaveTitle;
     end;

  FreeAndNil(favList);
  Result:= Item;
end;

procedure TFormFavoritesManager.GetFavFilesList;
begin
  FullFavFilesList:= THashedStringList.Create;
  FullFavFilesList.Sorted:= True;
  FullFavFilesList.Duplicates:= dupIgnore;
  GetFilesList(FormMain.GetFavoritesFolder, '.txt', '*.txt', FullFavFilesList, False, True, False);
  FullFavFilesList.Sorted:= False;

  if FullFavFilesList.Count = 0 then
     FreeAndNil(FullFavFilesList);
end;

procedure TFormFavoritesManager.LoadFavoritesProfiles;
var
  //favFiles: THashedStringList;
  Loop: Integer;
  fFileStr: String;
  defaultProfileAdded: Boolean;
begin
  GetFavFilesList;
  defaultProfileAdded:= False;
  if FullFavFilesList.Count = 0 then
     begin
       fFileStr:= CreateNewValidFileName(''); // this will create the default profile favorites.txt
       if fFileStr <> '' then
          begin
            if not defaultProfileAdded then
               begin
                 FullFavFilesList.Add(fFileStr); // add default profile favorites.txt to the files list
                 defaultProfileAdded:= True;
               end;
          end
       else
          begin
            GenerateMessage('Error', 'No files found.', '    No favorites files were found an failed to '+
                            'create the default profile "favorites.txt".', 2, False, 1);
            FreeAndNil(FullFavFilesList);
            Exit;
          end;
     end;

  FavoritesList.BeginUpdate;
  FavoritesList.Items.ReIndexDisable:= True;
  //favFiles.Sorted:= False;
  for Loop:=0 to FullFavFilesList.Count-1 do
      ELV_AddItem(FullFavFilesList[Loop]);

  FreeAndNil(FullFavFilesList);
  //FreeAndNil(favFiles);
  FavoritesList.Items.ReIndexDisable:= False;
  FavoritesList.EndUpdate;
  FavoritesList.Sort.SortAll;
end;

procedure TFormFavoritesManager.SelectCurrentProfile;
var
  Item: TEasyItem;
  iFound: Boolean;
begin
  if not FormMain.CheckTotal(FavoritesList) then
     Exit;
  Item:= FavoritesList.Groups.FirstItem;
  iFound:= False;
  repeat
    if TFavFileInfo(Item).eFileName = FormMain.FavoriteProfile[1] then
       begin
         FormMain.ELV_SelectItem(FavoritesList, Item.Index);
         iFound:= True;
         if ActiveProfileItem <> nil then
            ActiveProfileItem.ImageIndex:= -1;
         ActiveProfileItem:= Item;
         Item.ImageIndex:= 3;
       end;
    Item:= FavoritesList.Groups.NextItem(Item);
  until (Item = nil) or iFound;
end;

function TFormFavoritesManager.CheckIfAvailable(iStr: String; IsTitle: Boolean): Boolean;
var
  Item: TEasyItem;
  fileStr: String;
begin
  if iStr = '' then
     begin
       Result:= False;
       Exit;
     end;
  Result:= True;
  Item:= FavoritesList.Groups.FirstItem;
  fileStr:= ChangeFileExt(iStr, '.txt');
  repeat
    case IsTitle of
      True:
        begin
          if SameText(iStr, TFavFileInfo(Item).eTitle) then
             Result:= False;
        end;
      False:
        begin
          if SameText(fileStr, TFavFileInfo(Item).eFileName) then
             Result:= False;
        end;
    end;
    Item:= FavoritesList.Groups.NextItem(Item);
  until (Item = nil) or (not Result);
end;

procedure TFormFavoritesManager.UpdateTitleInfo(newStr, favFileName: String; ShowErrorMessage: Boolean = False);
var
  favFile: THashedStringList;
  tIndex: Integer;
  UpdTxt: Boolean;

  function UpdateFavFile: Boolean;
  begin
    Result:= True;
    favFile:= THashedStringList.Create;
    favFile.LoadFromFile(FormMain.GetFavoritesFolder+favFileName);
    tIndex:= favFile.IndexOfName('favorite_title');
    if tIndex <> -1 then
       favFile[tIndex]:= 'favorite_title='+newStr
    else
       favFile.Insert(0, 'favorite_title='+newStr);
    favFile.SaveToFile(FormMain.GetFavoritesFolder+favFileName);
    FreeAndNil(favFile);
    UpdateDateTime(FavoritesList.Selection.First, FormMain.GetFavoritesFolder+favFileName);
  end;

begin
  if FormMain.IsFavoriteDefault(favFileName) then
     Exit; // default profile favorites.txt have a fixed "Default" title
  UpdTxt:= FileExists(FormMain.GetFavoritesFolder+favFileName);

  if not UpdTxt then
     begin
       if ShowErrorMessage then
          begin
            CallMessageBox;
            FormMain.AddMsgText('    File ');
            FormMain.AddMsgText(favFileName, MsgTxtColors.colorFileName, [fsBold]);
            FormMain.AddMsgText(' was not found. Cannot change title.'+#13#10+'Aborting...');
            GenerateMessage('Error', 'Change favorite title.', '', 2, False, 1);
          end;
       Exit;
     end;

  if UpdTxt then
     UpdateFavFile;

  if FormMain.FavoriteProfile[1] = favFileName then
     FormMain.FavoriteProfile[0]:= newStr;
end;

procedure TFormFavoritesManager.UpdateFileNameInfo(OldFile, NewFile: String; ShowErrorMessage: Boolean = False);
var
  UpdTxt, RenamedTxt, ErrorMsg: Boolean;
begin
  UpdTxt:= FileExists(FormMain.GetFavoritesFolder+OldFile);

  RenamedTxt:= not UpdTxt;
  ErrorMsg:= False;

  if UpdTxt then
     begin
       if RenameFile(FormMain.GetFavoritesFolder+OldFile, FormMain.GetFavoritesFolder+NewFile) then
          RenamedTxt:= True;
     end;

  if (UpdTxt and RenamedTxt) then
     begin
       if FormMain.FavoriteProfile[1] = oldFile then
          FormMain.FavoriteProfile[1]:= NewFile;
       if LastActiveFavFilter = oldFile then
          LastActiveFavFilter:= NewFile;
     end;

  if UpdTxt and (not RenamedTxt) then
     ErrorMsg:= True;

  if ErrorMsg and ShowErrorMessage then
     begin
       CallMessageBox;
       if not RenamedTxt then
          begin
            FormMain.AddMsgText('    Failed to rename a file.'+#13#10+'From ');
            FormMain.AddMsgText(FormMain.GetFavoritesFolder+OldFile, MsgTxtColors.colorFileName, [fsBold]);
            FormMain.AddMsgText(#13#10+'to ');
            FormMain.AddMsgText(FormMain.GetFavoritesFolder+NewFile, MsgTxtColors.colorFileName, [fsBold]);
          end;
       FormMain.AddMsgText(#13#10+#13#10+'Please try again.');
       GenerateMessage('Error', 'Rename file.', '', 2, False, 1);
     end;
end;

function TFormFavoritesManager.CreateNewValidFileName(DuplicateFile: String): String;
var
  fIndex, titleIndex: Integer;
  fExt, defFile, DestinationFileName: String;
  gFile: THashedStringList;
  FoundTxt: Boolean;

  function CreateFileFav(Index: Integer): Boolean;
  begin
    gFile:= THashedStringList.Create;
    if Index <> -1 then
       begin
         gFile.Add('favorite_title='+defFile+IntToStr(Index));
         gFile.SaveToFile(FormMain.GetFavoritesFolder+defFile+IntToStr(Index)+fExt);
       end
    else
       begin
         // default profile have a fixed title
         gFile.SaveToFile(FormMain.GetFavoritesFolder+defFile+fExt);
       end;
    FreeAndNil(gFile);
  end;
  
begin
  fExt:= '.txt';
  if DuplicateFile = '' then
     defFile:= 'favorites'
  else
     deffile:= DuplicateFile;
  Result:= '';

  FoundTxt:= FileExists(FormMain.GetFavoritesFolder+defFile+fExt);

  if not FoundTxt then
     begin
       // mostly, this case fall on create a new file, and for favorites.txt... I hope
       // copy a file (DuplicateFile) will never enter this case
       CreateFileFav(-1);
       Result:= defFile+fExt;
       Exit;
     end
  else
     begin
       // if one of the files is found, must create a new profile ("favorite1.ini" to "favorite1000.ini")
       for fIndex:= 1 to 1000 do
       begin
         FoundTxt:= FileExists(FormMain.GetFavoritesFolder+defFile+IntToStr(fIndex)+fExt);
         if not FoundTxt then
            begin
              if DuplicateFile = '' then
                 begin
                   CreateFileFav(fIndex); // create new profile only
                 end
              else
                 begin
                   // if DuplicateFile is not empty, it mens the user wants to copy an existing profile
                   // copy files only
                   DestinationFileName:= FormMain.GetFavoritesFolder+defFile+IntToStr(fIndex)+fExt;
                   if FileExists(FormMain.GetFavoritesFolder+DuplicateFile+fExt) then
                      CopyFile(PChar(FormMain.GetFavoritesFolder+DuplicateFile+fExt), PChar(FormMain.GetFavoritesFolder+defFile+IntToStr(fIndex)+fExt), False)
                   else
                      CreateFileFav(fIndex); // file doesn't exist, create a new one
                      
                   Sleep(50); // give Windows some time to fush HDD write

                   // check if "favorite_title" entry exists... if not, add one at the top of the file
                   gFile:= THashedStringList.Create;
                   gFile.LoadFromFile(FormMain.GetFavoritesFolder+defFile+IntToStr(fIndex)+fExt);
                   titleIndex:= gFile.IndexOfName('favorite_title');
                   if titleIndex = -1 then
                      gFile.Insert(0, 'favorite_title='+defFile+IntToStr(fIndex))
                   else
                      gFile[titleIndex]:= 'favorite_title='+defFile+IntToStr(fIndex);
                   gFile.SaveToFile(FormMain.GetFavoritesFolder+defFile+IntToStr(fIndex)+fExt);
                   FreeAndNil(gFile);
                 end;
              Result:= defFile+IntToStr(fIndex)+fExt;
              Break;
            end;
       end;
     end;
end;


procedure TFormFavoritesManager.ExecuteFavAction(ActionIndex: Integer);
const
  ActionString: array[0..4] of String =
    (('create'),
     ('cleanse'),
     ('clear'),
     ('replicate'),
     ('exterminate'));
var
  NewFile: String;
  Item: TEasyItem;
  favList: THashedStringList;
  DeleteActiveProfile: Boolean;
  FoundTxtFile, DeleteTxtFile: Boolean;
begin
  if FormMain.PopupEnableFavorites.Checked then
     Exit; // is favorites filter is enabled, can't anything than selecting a different favorites profile!!!

  ////////////////////////////// still need to finish messages in here!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
  // Action index
  // 0 -> create new favorites profile
  // 1 -> edit selected favorites profile (title + filename)
  // 2 -> clear games of selected favorites profile
  // 3 -> duplicate current favorites profile
  // 4 -> delete selected favorites profile
  if ActionIndex in [0, 3] then
     begin
       // create new file or duplicate file
       if ActionIndex = 0 then
          NewFile:= CreateNewValidFileName('')
       else
          begin
            if not FormMain.CheckSelected(FavoritesList) then
               begin
                 CallMessageBox;
                 FormMain.AddMsgText('    You haven''t selected a profile to ');
                 FormMain.AddMsgText(ActionString[ActionIndex], clBlack, [fsBold]);
                 FormMain.AddMsgText('. Please select one and try again.');
                 GenerateMessage('Info', 'No profile selected.', '', 2);
                 Exit;
               end
            else
               NewFile:= CreateNewValidFileName(ChangeFileExt(TFavFileInfo(FavoritesList.Selection.First).eFileName, ''));
          end;
       if NewFile <> '' then
          begin
            FavoritesList.BeginUpdate;
            FavoritesList.Items.ReIndexDisable:= True;
            Item:= ELV_AddItem(NewFile);
            FavoritesList.Items.ReIndexDisable:= False;
            FavoritesList.EndUpdate;
            FavoritesList.Sort.SortAll;
            if Item <> nil then
               begin
                 Item.Selected:= True;
                 FavoritesList.Selection.FocusedItem:= Item;
                 Item.MakeVisible(emvMiddle) //(emvAuto);
               end;
          end
       else
          begin
            CallMessageBox;
            FormMain.AddMsgText('    Failed to create a new profile... you have more than 1000 files named ');
            FormMain.AddMsgText('favorites????.txt', MsgTxtColors.colorFileName, [fsBold]);
            FormMain.AddMsgText(' in your favorites folder! Rename or delete a few before creating new ones.');
            GenerateMessage('Error', 'Create favorites profile.', '', 2, False, 1);
            Exit;
          end;
     end
  else
     begin
       if not FormMain.CheckSelected(FavoritesList) then
          begin
            FormMain.AddMsgText('    You haven''t selected a profile to ');
            FormMain.AddMsgText(ActionString[ActionIndex], clBlack, [fsBold]);
            FormMain.AddMsgText('. Please select one and try again.');
            GenerateMessage('Info', 'No profile selected.', '', 2);
            Exit;
          end;
       Item:= FavoritesList.Selection.First;
       case ActionIndex of
         1: // remove invalid entries (cleanse)
           begin
             RemoveInvalidEntries;
           end;
         2: // clear all games in favorites file
           begin
             FoundTxtFile:= FileExists(FormMain.GetFavoritesFolder+TFavFileInfo(Item).eFileName);

             CallMessageBox;
             FormMain.AddMsgText('    This task will delete all game entries from the file, except ');
             FormMain.AddMsgText('favorite_title', clBlack,[fsBold]);
             FormMain.AddMsgText('.'+#13#10+#13#10+'Title: ');
             FormMain.AddMsgText(TFavFileInfo(Item).eTitle, MsgTxtColors.colorFileName, [fsBold]);
             FormMain.AddMsgText(#13#10+'File: ');
             FormMain.AddMsgText(TFavFileInfo(Item).eFileName, MsgTxtColors.colorFileName, [fsBold]);
             if FoundTxtFile then
                begin
                  FormMain.AddMsgText(#13#10+'Date Modified: ');
                  FormMain.AddMsgText(TFavFileInfo(Item).eDateTimeText, MsgTxtColors.colorFileName, [fsBold]);
                end;
             FormMain.AddMsgText(#13#10+#13#10+'Are you sure ?');
             if GenerateMessage('Purge', 'Clear game entries.', '', 1, False, 2) = mrYes then
                begin
                  if FoundTxtFile then
                  begin
                    favList:= THashedStringList.Create;
                    favList.LoadFromFile(FormMain.GetFavoritesFolder+TFavFileInfo(Item).eFileName);
                    if not FormMain.IsFavoriteDefault(TFavFileInfo(Item).eFileName) then
                       begin
                         NewFile:= favList.Values['favorite_title'];
                         if NewFile = '' then
                            NewFile:= ChangeFileExt(TFavFileInfo(Item).eFileName, '');
                       end;
                    favList.Clear;
                    if FormMain.IsFavoriteDefault(TFavFileInfo(Item).eFileName) then
                       favList.Add('favorite_title='+NewFile);
                    favList.SaveToFile(FormMain.GetFavoritesFolder+TFavFileInfo(Item).eFileName);
                    FreeAndNil(favList);
                    UpdateDateTime(Item, TFavFileInfo(Item).eFileName);
                    TFavFileInfo(Item).eGamesCount:= 0;
                  end;

                  if FoundTxtFile then
                     begin
                       if LastActiveFavFilter = TFavFileInfo(Item).eFileName then
                          UpdateFavStatusInGames:= True;
                       GenerateMessage('Purge', 'Clear game entries. ', 'All game entries were deleted. File '+TFavFileInfo(Item).eFileName+
                                       ' is clear.', 2);
                     end;
                end;
           end;
         4: // delete selected profile
           begin
             if FormMain.IsFavoriteDefault(TFavFileInfo(Item).eFileName) then
                begin
                  GenerateMessage('Error, Cannot Compute', 'Delete profile.', '    You are trying to terminate the default favorites profile. Well... you can''t.'+#13#10+
                                  'If you want to empty this profile, please use "Clear Games", or select another profile.'+#13#10+#13#10+
                                  '    There must be at least one custom favorites profile for this feature to work properly.', 2);
                  Exit;
                end;
             FoundTxtFile:= FileExists(FormMain.GetFavoritesFolder+TFavFileInfo(Item).eFileName);

             CallMessageBox;
             FormMain.AddMsgText('    You are about to delete a favorites profile.');
             FormMain.AddMsgText(#13#10+#13#10+'Title: ');
             FormMain.AddMsgText(TFavFileInfo(Item).eTitle, MsgTxtColors.colorFileName, [fsBold]);
             FormMain.AddMsgText(#13#10+'File: ');
             FormMain.AddMsgText(TFavFileInfo(Item).eFileName, MsgTxtColors.colorFileName, [fsBold]);
             if FoundTxtFile then
                begin
                  FormMain.AddMsgText(#13#10+'Games Count: ');
                  FormMain.AddMsgText(IntToStr(TFavFileInfo(Item).eGamesCount), MsgTxtColors.colorFileName, [fsBold]);

                  FormMain.AddMsgText(#13#10+'Date Modified: ');
                  FormMain.AddMsgText(TFavFileInfo(Item).eDateTimeText, MsgTxtColors.colorFileName, [fsBold]);
                end;
             FormMain.AddMsgText(#13#10+#13#10+'    If this is the active profile, the previous listed profile will be set active.'+#13#10+'Are you sure ?');
             if GenerateMessage('Delete File', 'Delete favorites profile.', '', 1, True, 2) = mrYes then
                begin
                  if FoundTxtFile then
                     DeleteTxtFile:= DeleteFile(FormMain.GetFavoritesFolder+TFavFileInfo(Item).eFileName);

                  //if DeleteFile(FormMain.GetFavoritesFolder(True)+TFavFileInfo(Item).eFileName) then
                  if DeleteTxtFile then
                     begin
                       DeleteActiveProfile:= Item = ActiveProfileItem;
                       if LastActiveFavFilter = TFavFileInfo(Item).eFileName then
                          UpdateFavStatusInGames:= True;
                       FavoritesList.Selection.DeleteSelected(True);
                       Item:= FavoritesList.Selection.First;
                       if DeleteActiveProfile then
                          begin
                            ActiveProfileItem:= Item;
                            Item.ImageIndex:= 3;
                            FormMain.FavoriteProfile[0]:= TFavFileInfo(Item).eTitle;
                            FormMain.FavoriteProfile[1]:= TFavFileInfo(Item).eFileName;
                            FormMain.PopupEnableFavorites.Hint:= FormMain.FavoriteProfile[0];
                          end;
                     end
                  else
                     GenerateMessage('Error', 'Delete selected profile.', 'Failed to delete file '+TFavFileInfo(Item).eFileName, 2, False, 1);
                end;
            end;
       end;
     end;
end;

procedure TFormFavoritesManager.EditTitleFileName(ColumnIndex: Integer);
begin
  if FormMain.PopupEnableFavorites.Checked then
     Exit;
  if not FormMain.CheckSelected(FavoritesList) then
     Exit;
  if FormMain.IsFavoriteDefault(TFavFileInfo(FavoritesList.Selection.First).eFileName) then
     begin
       GenerateMessage('Info', 'Edit profile.', 'Default profile cannot be edited, please select another.', 2);
       Exit;
     end;

  FormMain.SetFormKeyPreview(FormFavoritesManager);
  FavoritesList.Tag:= ColumnIndex;
  FormMain.ELV_EnableEdit(FavoritesList, ColumnIndex);
end;

procedure TFormFavoritesManager.RemoveInvalidEntries;
var
  GamesListFull, FavoriteGamesList: THashedStringList;
  Loop, RemovedCount, TitleIndex: Integer;
  ErrorMsgTitle, FavMsgTitle: String;
  gItem, favItem, addItem: TEasyItem;
  gGroup: TEasyGroup;
  UpdTxt, HaveTitle: Boolean;
  LineStr: String;

  // this function is not used anywhere (August 28, 2018)
  {function SearchAndDelete: Boolean;
  var
    favIndex: Integer;
  begin
    favStr:= '';

    if UpdTxt then
       begin
         if FormMain.TempGameVars.eIsCustomGame then
            begin
              if FormMain.TempGameVars.eIsUnicode then
                 favStr:= UTF8Encode(FormMain.TempGameVars.eName)
              else
                 favStr:= FormMain.TempGameVars.eName;
              favStr:= Format('%.3u %u', [FormMain.TempGameVars.eCustomSystemID, FormMain.TempGameVars.eCustomMediaType])+' <file>'+favStr;
            end
         else
            favStr:= FormMain.GetPlayedGamesNameEntry(FormMain.TempGameVars.eName, FormMain.TempGameVars.eSoftwareName)+'='+FormMain.GetArcadeSystemIniSection(FormMain.TempGameVars.eSystemID, True);

         if favStr <> '' then
            begin
              favIndex:= FavoriteGamesList.IndexOf(favStr);
              if favIndex <> -1 then
                 begin
                   Inc(RemovedCount);
                   FavoriteGamesList.Delete(favIndex);
                 end;
            end;
       end;
  end;}

  function AddGameHashedList: Boolean;
  var
    tStr: String;
  begin
    //error! update to 'softlistname\gamename=?????'
    tStr:= '';
    if FormMain.TempGameVars.eIsCustomGame then
       begin
         if FormMain.TempGameVars.eIsUnicode then
            tStr:= UTF8Encode(FormMain.TempGameVars.eName)
          else
            tStr:= FormMain.TempGameVars.eName;
          tStr:= Format('%.3u %u', [FormMain.TempGameVars.eCustomSystemID, FormMain.TempGameVars.eCustomMediaType])+' <file>'+tStr;
       end
    else
       tStr:= FormMain.GetPlayedGamesNameEntry(FormMain.TempGameVars.eName, FormMain.TempGameVars.eSoftwareName)+'='+FormMain.GetArcadeSystemIniSection(FormMain.TempGameVars.eSystemID, True);

    GamesListFull.Add(tStr);
    Result:= True;
  end;

begin
  // this new function is all wrong!
  // need to create a list of valid games and then search for them in the fav.ini files...
  if not FormMain.CheckSelected(FavoritesList) then
     Exit;
  ErrorMsgTitle:= 'Error: Cleanse';
  FavMsgTitle:= 'Cleanse';

  if not FormMain.CheckTotal(FormMain.GamesListView) then
     begin
       GenerateMessage(ErrorMsgTitle, 'No games list found.', '    Failed to parse games list to validate games. '+
                       'The main games list is empty.'+#13#10+'Aborting...', 2, False, 1);
       Exit;
     end;

  favItem:= FavoritesList.Selection.First;

  // Button Maintenance !
  UpdTxt:= FileExists(FormMain.GetFavoritesFolder+TFavFileInfo(favItem).eFileName);

  if not UpdTxt then
     begin
       CallMessageBox;
       FormMain.AddMsgText('    File ');
       FormMain.AddMsgText(TFavFileInfo(favItem).eFileName, MsgTxtColors.colorFileName, [fsBold]);
       FormMain.AddMsgText(' was not found. The list cannot be cleansed. Aborting...');
       GenerateMessage(ErrorMsgTitle, 'Could not access the file.', '', 2, False, 1);
       Exit;
     end;

  if FormMain.CheckReadOnly(FormMain.GetFavoritesFolder+TFavFileInfo(favItem).eFileName) then
     begin
       CallMessageBox;
       FormMain.AddMsgText('    File ');
       FormMain.AddMsgText(FormMain.GetFavoritesFolder+TFavFileInfo(favItem).eFileName, MsgTxtColors.colorFileName, [fsBold]);
       FormMain.AddMsgText(' is marked read-only. Cannot continue...');
       GenerateMessage(ErrorMsgTitle, 'A file that needs to be updated cannot be opened.', '', 2);
       Exit;
     end;

  FormMain.ShowFilterMsgBox('Favorites Manager', 'Generating list of impurities, please wait...', True);

  Application.ProcessMessages;
  Screen.Cursor:= crHourGlass;

  GamesListFull:= THashedStringList.Create;
  GamesListFull.BeginUpdate;

  if FormMain.IsGroupedView then
  begin
    gGroup:= FormMain.GamesListView.Groups.FirstGroup;
    repeat
      gItem:= FormMain.GamesListView.Groups.FirstInGroup(gGroup);
      repeat
        FormMain.FillTempGameInfo(gItem);
        AddGameHashedList;
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
      AddGameHashedList;
      gItem:= FormMain.GamesListView.Groups.NextItem(gItem);
    until gItem = nil;
  end;
  GamesListFull.EndUpdate;
  Application.ProcessMessages;

  RemovedCount:= 0;
  HaveTitle:= False;

  if UpdTxt then
     begin
       if not Assigned(FormFavoritesManagerCleanseProfile) then
          FormFavoritesManagerCleanseProfile:= TFormFavoritesManagerCleanseProfile.Create(nil);

       FormMain.ELV_ResetNormalColors(FormFavoritesManagerCleanseProfile.FavoritesCleanseList);

       if IsNightMode then
          begin
            FormFavoritesManagerCleanseProfile.Color:= menu_background_color[1];
            SetPanelColors(FormFavoritesManagerCleanseProfile.PanelBottom, menu_background_color[1], clrMedDarkGray);
            SetLabelColors(FormFavoritesManagerCleanseProfile.LabelTopMessage, item_caption_active_color[1], item_caption_active_shadow_color[1]);
            SetLabelColors(FormFavoritesManagerCleanseProfile.LabelTotal,      item_caption_active_color[1], item_caption_active_shadow_color[1]);

            FormFavoritesManagerCleanseProfile.FavoritesCleanseList.ShowThemedBorder:= False;
            FormMain.SetEasyListViewColors(FormFavoritesManagerCleanseProfile.FavoritesCleanseList, menu_background_color[1], item_caption_active_color[1]);
            FormMain.SetEasyListViewHeaderColors(FormFavoritesManagerCleanseProfile.FavoritesCleanseList, True);
            FormMain.ELV_SetEditBkColor(FormFavoritesManagerCleanseProfile.FavoritesCleanseList);
            FormMain.ELV_SetRibbonNightColors(0, FormFavoritesManagerCleanseProfile.FavoritesCleanseList, True);

            FormMain.SetButtonExColors(FormFavoritesManagerCleanseProfile.ButtonConfirm);
            FormMain.SetButtonExColors(FormFavoritesManagerCleanseProfile.ButtonAbort);
            FormMain.SetButtonExColors(FormFavoritesManagerCleanseProfile.ButtonRemoveSelected);

            FormMain.SetWin10DarkScrollBar(FormFavoritesManagerCleanseProfile.FavoritesCleanseList);
           end;

       FormFavoritesManagerCleanseProfile.FavoritesCleanseList.BeginUpdate;
       FormFavoritesManagerCleanseProfile.FavoritesCleanseList.Items.ReIndexDisable:= True;
       LoadCustomMAMEIconToForm(FormFavoritesManagerCleanseProfile, 3);
       FormMain.LoadSystemsIcons(FormFavoritesManagerCleanseProfile.IL_Systems, False);
       FormMain.LoadNonArcadeSystemIcons(FormFavoritesManagerCleanseProfile.IL_Systems, False, False);

       FavoriteGamesList:= THashedStringList.Create;
       FavoriteGamesList.LoadFromFile(FormMain.GetFavoritesFolder+TFavFileInfo(favItem).eFileName);
       TitleIndex:= FavoriteGamesList.IndexOfName('favorite_title');
       HaveTitle:= TitleIndex <> -1;

       FormFavoritesManagerCleanseProfile.LabelTotal.Tag:= FavoriteGamesList.Count-Ord(HaveTitle);

       for Loop:=0 to FavoriteGamesList.Count-1 do
       begin
         if Loop <> TitleIndex then
         begin
           LineStr:= FavoriteGamesList[Loop];
           if LineStr <> '' then
           begin
             if GamesListFull.IndexOf(LineStr) = -1 then
                 begin
                   addItem:= FormFavoritesManagerCleanseProfile.FavoritesCleanseList.Items.AddCustom(TFavCleanseInfo, nil);

                   TFavCleanseInfo(addItem).eIsCustomGame:= PosEx('<file>', LineStr) <> 0;

                   TFavCleanseInfo(addItem).eEntryString:= LineStr; // full string line from profile ".ini"

                   case TFavCleanseInfo(addItem).eIsCustomGame of
                     True:
                       begin
                         TFavCleanseInfo(addItem).eSystemID:= StrToInt(Copy(LineStr, 1, 3));
                         TFavCleanseInfo(addItem).eSystemTitle:= SystemsListCustom[TFavCleanseInfo(addItem).eSystemID, 0];
                         TFavCleanseInfo(addItem).eImageIndex:= MaxArcadeSystems+1+TFavCleanseInfo(addItem).eSystemID;
                         TFavCleanseInfo(addItem).eMediaType:= StrToInt(LineStr[5]);
                         TFavCleanseInfo(addItem).eName:= FormMain.DecodeUnicodeStr(Copy(LineStr, PosEx('<file>', LineStr)+6, Length(LineStr)));
                         if SystemIsConsole(TFavCleanseInfo(addItem).eSystemID) then
                            addItem.StateImageIndexes[1]:= 25
                         else
                         if SystemIsComputer(TFavCleanseInfo(addItem).eSystemID) then
                            addItem.StateImageIndexes[1]:= 26
                         else
                         if SystemIsHandheld(TFavCleanseInfo(addItem).eSystemID) then
                            addItem.StateImageIndexes[1]:= 27;
                       end;
                     False:
                       begin
                         TFavCleanseInfo(addItem).eSystemID:= FormMain.GetArcadeSysIDFromName(FavoriteGamesList.ValueFromIndex[Loop]);
                         TFavCleanseInfo(addItem).eSystemTitle:= FormMain.GetArcadeEmulatorDescription(TFavCleanseInfo(addItem).eSystemID);
                         TFavCleanseInfo(addItem).eImageIndex:= TFavCleanseInfo(addItem).eSystemID;
                         TFavCleanseInfo(addItem).eMediaType:= -1;
                         TFavCleanseInfo(addItem).eName:= FavoriteGamesList.Names[Loop];
                         addItem.StateImageIndexes[1]:= 24; // arcade icon
                       end;
                   end;
                   addItem.ImageIndex:= TFavCleanseInfo(addItem).eImageIndex;
                 end;
              end;
           end;
       end;

       FormFavoritesManagerCleanseProfile.FavoritesCleanseList.Items.ReIndexDisable:= False;
       FormFavoritesManagerCleanseProfile.FavoritesCleanseList.EndUpdate;
       FormFavoritesManagerCleanseProfile.FavoritesCleanseList.Sort.SortAll;

       if FormMain.CheckTotal(FormFavoritesManagerCleanseProfile.FavoritesCleanseList) then
       begin
         case FormFavoritesManagerCleanseProfile.ShowModal of
           mrOk:
            begin
              if FormMain.CheckTotal(FormFavoritesManagerCleanseProfile.FavoritesCleanseList) then
              begin
                CallMessageBox;
                FormMain.AddMsgText('    File ');
                FormMain.AddMsgText(TFavFileInfo(favItem).eFileName, MsgTxtColors.colorFileName, [fsBold]);
                FormMain.AddMsgText(' will be cleansed of all impurities, based on current games list.'+#13#10);
                FormMain.AddMsgText('(arcade/console/computer)', MsgTxtColors.colorFileName, [fsBold]);
                FormMain.AddMsgText('.'+#13#10+'Valid game entries of systems that are not available anymore will also be removed. Click ');
                FormMain.AddMsgText('No', MsgTxtColors.colorFileName, [fsBold]);
                FormMain.AddMsgText(' button if you want to abort.'+#13#10+#13#10+'Continue ?');
                if GenerateMessage(FavMsgTitle, 'A file is about to be changed.', '', 1, False, 2) = mrYes then
                   begin
                     FormMain.ShowFilterMsgBox('Favorites Manager', 'Cleansing profile of impure data, please wait...', True);
                     //LabelTaskMessage.Caption:= 'Cleansing profile of impure data, please wait...';
                     //ShowUpdateFavGamesListPanel;
                     FavoriteGamesList.BeginUpdate;
                     // remove all games from fav .ini file...

                     addItem:= FormFavoritesManagerCleanseProfile.FavoritesCleanseList.Groups.FirstItem;
                     repeat
                       Loop:= FavoriteGamesList.IndexOf(TFavCleanseInfo(addItem).eEntryString);
                       if Loop <> -1 then
                       begin
                         if GamesListFull.IndexOf(TFavCleanseInfo(addItem).eEntryString) = -1 then
                         begin
                           Inc(RemovedCount);
                           FavoriteGamesList.Delete(Loop);
                         end;
                       end;
                       addItem:= FormFavoritesManagerCleanseProfile.FavoritesCleanseList.Groups.NextItem(addItem);
                       Application.ProcessMessages;
                     until addItem = nil;
                     FavoriteGamesList.EndUpdate;
                   end
                else
                   RemovedCount:= -1;
              end;
            end;
           mrCancel: RemovedCount:= -1;
         end;
       end;
       FreeAndNil(FormFavoritesManagerCleanseProfile);

       {FavoriteGamesList.BeginUpdate;
       for Loop:= FavoriteGamesList.Count-1 downto 0 do
       begin
         if Loop <> TitleIndex then
            begin
            if GamesListFull.IndexOf(FavoriteGamesList[Loop]) = -1 then
               begin
                 Inc(RemovedCount);
                 FavoriteGamesList.Delete(Loop);
               end;
            end;
       end;
       FavoriteGamesList.EndUpdate;}
     end;

  FormMain.HideFilterMsgBox;
  Screen.Cursor:= crDefault;
  Application.ProcessMessages;

  if UpdTxt then
  begin
    // re-enable this later! (August 28, 2018)
    if RemovedCount > 0 then
       begin
         FavoriteGamesList.SaveToFile(FormMain.GetFavoritesFolder+TFavFileInfo(favItem).eFileName);
         TFavFileInfo(favItem).eGamesCount:= FavoriteGamesList.Count-Ord(HaveTitle);
       end;
    FreeAndNil(FavoriteGamesList);
  end;

  FreeAndNil(GamesListFull);

  if RemovedCount = 0 then
     begin
       CallMessageBox;
       FormMain.AddMsgText('    No impurities were found in file ');
       FormMain.AddMsgText(TFavFileInfo(favItem).eFileName, MsgTxtColors.colorFileName, [fsBold]);
       FormMain.AddMsgText('.');
       GenerateMessage(FavMsgTitle, 'No changes have been made.', '', 2);
     end
  else
  if RemovedCount > 0 then
     begin
       CallMessageBox;
       FormMain.AddMsgText('    File ');
       FormMain.AddMsgText(FormMain.GetFavoritesFolder+TFavFileInfo(favItem).eFileName, MsgTxtColors.colorFileName, [fsBold]);
       FormMain.AddMsgText(' was successfully cleansed of ');
       FormMain.AddMsgText(IntToStr(RemovedCount), MsgTxtColors.colorFileName, [fsBold]);
       FormMain.AddMsgText(' impurities! ');

       GenerateMessage(FavMsgTitle, 'The contents of a file have changed.', '', 2);

       if LastActiveFavFilter = TFavFileInfo(favItem).eFileName then
          UpdateFavStatusInGames:= True;
     end;
end;

function TFormFavoritesManager.ValidateGamesActiveProfile: Boolean;
var
  favFile: THashedStringList;
  tIndex: Integer;
  Item: TEasyItem;
  Group: TEasyGroup;
  StrToSearch: String;
  FoundTxtFile: Boolean;
begin
  FoundTxtFile:= FileExists(FormMain.GetFavoritesFile);
  Result:= FoundTxtFile;
  if not Result then
     begin
       CallMessageBox;
       FormMain.AddMsgText('    The .txt file for the active favorites profile was not found but is listed anyway.'+
                           ' Please make sure to select a valid profile.'+#13#10+#13#10+'Title: ');
       FormMain.AddMsgText(FormMain.FavoriteProfile[0], MsgTxtColors.colorFileName, [fsBold]);
       FormMain.AddMsgText(#13#10+'File: ');
       FormMain.AddMsgText(FormMain.FavoriteProfile[1], MsgTxtColors.colorFileName, [fsBold]);
       GenerateMessage('Error', 'File not found.', '', 2, False, 1);
       Exit;
     end;
  if not FormMain.CheckTotal(FormMain.GamesListView) then
     Exit;

  if (not UpdateFavStatusInGames) and (LastActiveFavFilter = FormMain.FavoriteProfile[1]) then
     Exit;

  FormMain.ShowFilterMsgBox('Favorites Manager', 'Updating favorite tags in games list, please wait...', True);

  Application.ProcessMessages;
  Screen.Cursor:= crHourGlass;

  favFile:= THashedStringList.Create;
  favFile.LoadFromFile(FormMain.GetFavoritesFile);
  tIndex:= favFile.IndexOfName('favorite_title');
  if tIndex <> -1 then
     favFile.Delete(tIndex);

  tIndex:= favFile.Count;

  FormMain.GamesListView.BeginUpdate;
  GlobalThreadManager.FlushMessageCache(FormMain.GamesListView, TID_START); // remove any pending requests before reloading them
  if FormMain.IsGroupedView then
  begin
    Group:= FormMain.GamesListView.Groups.FirstGroup;
    repeat
      Item:= FormMain.GamesListView.Groups.FirstInGroup(Group);
      repeat
        if uMain.TEasyGameInfo(Item).eIsCustomGame then
           begin
             if FormMain.TempGameVars.eIsUnicode then
                StrToSearch:= UTF8Encode(uMain.TEasyGameInfo(Item).eName)
             else
               StrToSearch:= uMain.TEasyGameInfo(Item).eName;
             StrToSearch:= Format('%.3u %u', [uMain.TEasyGameInfo(Item).eCustomSystemID, uMain.TEasyGameInfo(Item).eCustomMediaType])+' <file>'+StrToSearch;
           end
        else
           begin
             StrToSearch:= FormMain.GetPlayedGamesNameEntry(uMain.TEasyGameInfo(Item).eName, uMain.TEasyGameInfo(Item).eSoftwareName)+'='+FormMain.GetArcadeSystemIniSection(uMain.TEasyGameInfo(Item).eSystemID, True);
           end;

        if tIndex > 0 then
           uMain.TEasyGameInfo(Item).eIsFavorite:= (favFile.IndexOf(StrToSearch) <> -1)
        else
           uMain.TEasyGameInfo(Item).eIsFavorite:= False;
           
        Item:= FormMain.GamesListView.Groups.NextInGroup(Group, Item);
      until Item = nil; // repeat items
      Group:= FormMain.GamesListView.Groups.NextGroup(Group);
    until Group = nil;
  end
  else
  begin
    Item:= FormMain.GamesListView.Groups.FirstItem;
    repeat
      if uMain.TEasyGameInfo(Item).eIsCustomGame then
         begin
           if FormMain.TempGameVars.eIsUnicode then
              StrToSearch:= UTF8Encode(uMain.TEasyGameInfo(Item).eName)
           else
             StrToSearch:= uMain.TEasyGameInfo(Item).eName;
           StrToSearch:= Format('%.3u %u', [uMain.TEasyGameInfo(Item).eCustomSystemID, uMain.TEasyGameInfo(Item).eCustomMediaType])+' <file>'+StrToSearch;
         end
      else
         begin
           StrToSearch:= FormMain.GetPlayedGamesNameEntry(uMain.TEasyGameInfo(Item).eName, uMain.TEasyGameInfo(Item).eSoftwareName)+'='+FormMain.GetArcadeSystemIniSection(uMain.TEasyGameInfo(Item).eSystemID, True);
         end;

      if tIndex > 0 then
         uMain.TEasyGameInfo(Item).eIsFavorite:= (favFile.IndexOf(StrToSearch) <> -1)
      else
         uMain.TEasyGameInfo(Item).eIsFavorite:= False;
         
      Item:= FormMain.GamesListView.Groups.NextItem(Item);
    until Item = nil;
  end;
  FreeAndNil(favFile);
  FormMain.GamesListView.EndUpdate(False);
  if FormMain.IsThumbnailView then
     FormMain.ResetThumbnails;
  Screen.Cursor:= crDefault;
  FormMain.HideFilterMsgBox;
end;

procedure TFormFavoritesManager.FavoritesListKeyAction(
  Sender: TCustomEasyListview; var CharCode: Word; var Shift: TShiftState;
  var DoDefault: Boolean);
begin
  if FormMain.ELV_IsEditing(TEasyListView(Sender)) then
     begin
       CharCode:= 0;
       Exit;
     end;
  case CharCode of
    VK_RETURN:
      begin
        ButtonSetSelectedProfileActive.Click;
        if FormMain.CheckSelected(FavoritesList) then
           Close;
      end;
    VK_SPACE: ButtonSetSelectedProfileActive.Click;
    VK_F2: EditTitleFileName(0);
    VK_F3: EditTitleFileName(2);
    VK_DELETE: ButtonDelete.Click;
    VK_ESCAPE: Close;
  end;
end;

procedure TFormFavoritesManager.FavoritesListColumnClick(
  Sender: TCustomEasyListview; Button: TCommonMouseButton;
  ShiftState: TShiftState; const Column: TEasyColumn);
begin
  if Button = cmbLeft then
     begin
       FavoritesList.BeginUpdate;
       FavoritesList.Sort.SortAll;
       FavoritesList.EndUpdate(False);
       FormMain.ELV_MakeVisible(FavoritesList, FavoritesList.Selection.First);
     end;
end;

function TFormFavoritesManager.FavoritesListItemCompare(
  Sender: TCustomEasyListview; Column: TEasyColumn; Group: TEasyGroup;
  Item1, Item2: TEasyItem; var DoDefault: Boolean): Integer;
var
  gItem1, gItem2: TEasyItem;
begin
  DoDefault:= False;
  FormMain.ELV_GetSortDirection(Column, Item1, Item2, gItem1, gItem2);
  case Column.Index of
    0: Result:= FormMain.iCompare(TFavFileInfo(gItem1).eTitle, TFavFileInfo(gItem2).eTitle);
    1: Result:= CompareIntValue(TFavFileInfo(gItem1).eGamesCount, TFavFileInfo(gItem2).eGamesCount);
    2: Result:= FormMain.iCompare(TFavFileInfo(gItem1).eFileName, TFavFileInfo(gItem2).eFileName);
    3: Result:= CompareIntValue(TFavFileInfo(gItem1).eDateTime, TFavFileInfo(gItem2).eDateTime);
  end;
end;

procedure TFormFavoritesManager.FormShow(Sender: TObject);
var
  Loop: Integer;
begin
  LoadCustomMAMEIconToForm(TForm(Sender), 3);
  FormMain.AddDefaultIcons('systemtype_arcade.ico', FormMain.GetFolderFull(32), IL_SystemType);
  FormMain.AddDefaultIcons('systemtype_computer.ico', FormMain.GetFolderFull(32), IL_SystemType);

  FormMain.ELV_ResetNormalColors(FavoritesList);

  if IsNightMode then
     begin
       SetFormColors(FormFavoritesManager, nil, nil, nil, nil, nil, -1, False);
       FormMain.SetToolBarPanelColors(FormMain.PanelSearchGames_ToolBar, NewFavoritePanel);

       SetLabelColors(FormFavoritesManager.LabelHotkeyText, clCream, item_caption_active_shadow_color[1]);
       SetLabelColors(FormFavoritesManager.LabelHotkeyKeys, clrLightRed, item_caption_active_shadow_color[1]);

       for Loop:= 0 to FormFavoritesManager.ComponentCount-1 do
       begin
         if FormFavoritesManager.Components[Loop] is TSpeedButtonEx then
            TSpeedButtonEx(FormFavoritesManager.Components[Loop]).Font.Color:= clWhite;
       end;

       FormMain.SetEasyListViewColors(FavoritesList, menu_background_color[1], clWhite);
       FormMain.SetEasyListViewHeaderColors(FavoritesList, True);
       FormMain.ELV_SetEditBkColor(FavoritesList);
       FormMain.ELV_SetRibbonNightColors(0, FavoritesList, True);
       FormMain.SetWin10DarkScrollBar(FavoritesList);
     end;

  ReadSettings;

  //if (Screen.Width < 960) and (FormFavoritesManager.WindowState <> wsMaximized) then
  //   FormFavoritesManager.Width:= Screen.Width-5;

  if FormMain.PopupEnableFavorites.Checked then
     begin
       FormFavoritesManager.Caption:= 'Select a Favorites Profile';
       ButtonSettings.Enabled:= False;
       ButtonNew.Enabled:= False;
       ButtonClearGames.Enabled:= False;
       ButtonRemoveInvalidEntries.Enabled:= False;
       ButtonReplicate.Enabled:= False;
       ButtonDelete.Enabled:= False;
     end;
  ButtonSetSelectedProfileActive.Enabled:= True;

  FavoritesList.Header.Columns[0].SortDirection:= esdNone;
  FavoritesList.Header.Columns[3].SortDirection:= esdDescending;
  LastActiveFavFilter:= FormMain.FavoriteProfile[1];
  ActiveProfileItem:= nil;
  UpdateFavStatusInGames:= False;
  LoadFavoritesProfiles;
  FormMain.HideFilterMsgBox;
  SelectCurrentProfile;
end;

procedure TFormFavoritesManager.FavoritesListItemEdited(
  Sender: TCustomEasyListview; Item: TEasyItem; var NewValue: Variant;
  var Accept: Boolean);
var
  oFile: String;
begin
  oFile:= TFavFileInfo(Item).eFileName;
  case FavoritesList.Tag of
    0: // edit title, column 0
      begin
        if NewValue = '' then
           begin
             Accept:= False;
             Exit;
           end;
        if SameText(NewValue, TFavFileInfo(Item).eTitle) then
           TFavFileInfo(Item).eTitle:= NewValue
        else
        if CheckIfAvailable(NewValue, True) then
           TFavFileInfo(Item).eTitle:= NewValue
        else
           Accept:= False;
        if Accept then
           begin
             UpdateTitleInfo(NewValue, oFile, True);
           end;
      end;
    2: // edit filename, column 0
      begin
        if NewValue = '' then
           begin
             Accept:= False;
             Exit;
           end;
        NewValue:= ChangeFileExt(NewValue, '.txt');
        if SameText(NewValue, TFavFileInfo(Item).eFileName) then
           TFavFileInfo(Item).eFileName:= NewValue
        else
        if CheckIfAvailable(NewValue, False) then
           TFavFileInfo(Item).eFileName:= NewValue
        else
           Accept:= False;
        if Accept then
           begin
             UpdateFileNameInfo(oFile, NewValue, True);
           end;
      end;
  end;
end;

procedure TFormFavoritesManager.FavoritesListItemEditEnd(
  Sender: TCustomEasyListview; Item: TEasyItem);
begin
  FormMain.ELV_SetEditManager(FavoritesList, False);
  FormMain.SetFormKeyPreview(FormFavoritesManager);
end;

procedure TFormFavoritesManager.FavoritesListDblClick(
  Sender: TCustomEasyListview; Button: TCommonMouseButton;
  MousePos: TPoint; ShiftState: TShiftState; var Handled: Boolean);
begin
  ButtonSetSelectedProfileActive.Click;
  if FormMain.CheckSelected(FavoritesList) then
     Close;
end;

procedure TFormFavoritesManager.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  CanClose:= not FormMain.ELV_IsEditing(FavoritesList);
  if CanClose then
     CanClose:= ValidateGamesActiveProfile;
  if CanClose then
     WriteSettings;
end;

procedure TFormFavoritesManager.FavoritesListColumnSizeChanging(
  Sender: TCustomEasyListview; Column: TEasyColumn; Width,
  NewWidth: Integer; var Allow: Boolean);
begin
  if Column.Index = 1 then
     Allow:= False;
end;

procedure TFormFavoritesManager.ReadSettings;
var
  iniFile: TMemIniFile;
begin
  iniFile:= TMemIniFile.Create(FormMain.GetFrontendExtraIniFile);

  FormFavoritesManager.Tag:= Ord(iniFile.ReadString('FavoritesManager', 'WindowState', 'Normal') = 'Maximized');

  FormFavoritesManager.Width:= iniFile.ReadInteger('FavoritesManager', 'ScreenWidth', 797);
  FormFavoritesManager.Height:= iniFile.ReadInteger('FavoritesManager', 'ScreenHeight', 440);
  //FormFavoritesManager.Left:= iniFile.ReadInteger('FavoritesManager', 'ScreenLeft', (Screen.Width shr 1)-(Width shr 1)-1);
  //FormFavoritesManager.Top:= iniFile.ReadInteger('FavoritesManager', 'ScreenTop', (Screen.Height shr 1)-(Height shr 1)-1);

  FavoritesList.Header.Columns[0].Width:= iniFile.ReadInteger('FavoritesManager', 'ColumnTitleWidth', 300);
  FavoritesList.Header.Columns[1].Width:= iniFile.ReadInteger('FavoritesManager', 'ColumnGamesCountWidth', 70);
  FavoritesList.Header.Columns[2].Width:= iniFile.ReadInteger('FavoritesManager', 'ColumnFileNameWidth', 250);
  FavoritesList.Header.Columns[3].Width:= iniFile.ReadInteger('FavoritesManager', 'ColumnDateModifiedWidth', 155);

  case iniFile.ReadInteger('FavoritesManager', 'FavoritesListFontSize', 0) of
    //0: PopupSettingsSmallFont.Checked:= True;
    1: PopupSettingsMediumFont.Click;
    2: PopupSettingsLargeFont.Click;
  end;

  FreeAndNil(iniFile);
  if FormFavoritesManager.Tag = 1 then
     FormFavoritesManager.WindowState:= wsMaximized
  else
     begin
       FormFavoritesManager.Top:= (Screen.Height-FormFavoritesManager.Height) div 2;
       FormFavoritesManager.Left:= (Screen.Width-FormFavoritesManager.Width) div 2;
     end;
end;

procedure TFormFavoritesManager.WriteSettings;
var
  iniFile: TMemIniFile;
  tmpString: String;
begin
  if FormMain.CheckReadOnly(FormMain.GetFrontendExtraIniFile) then
     Exit;

  iniFile:= TMemIniFile.Create(FormMain.GetFrontendExtraIniFile);

  tmpString:= 'Normal';
  if FormFavoritesManager.WindowState = wsMaximized then
     tmpString:= 'Maximized';

  iniFile.WriteString('FavoritesManager', 'WindowState', tmpString);
  tmpString:= '';

  if FormFavoritesManager.WindowState <> wsMaximized then
     begin
       iniFile.WriteInteger('FavoritesManager', 'ScreenWidth', FormFavoritesManager.Width);
       iniFile.WriteInteger('FavoritesManager', 'ScreenHeight', FormFavoritesManager.Height);
     end;

  iniFile.WriteInteger('FavoritesManager', 'ColumnTitleWidth', FavoritesList.Header.Columns[0].Width);
  iniFile.WriteInteger('FavoritesManager', 'ColumnGamesCountWidth', FavoritesList.Header.Columns[1].Width);
  iniFile.WriteInteger('FavoritesManager', 'ColumnFileNameWidth', FavoritesList.Header.Columns[2].Width);
  iniFile.WriteInteger('FavoritesManager', 'ColumnDateModifiedWidth', FavoritesList.Header.Columns[3].Width);

  tmpString:= '0';
  if PopupSettingsSmallFont.Checked then
     tmpString:= IntToStr(PopupSettingsSmallFont.Tag)
  else
  if PopupSettingsMediumFont.Checked then
     tmpString:= IntToStr(PopupSettingsMediumFont.Tag)
  else
  if PopupSettingsLargeFont.Checked then
     tmpString:= IntToStr(PopupSettingsLargeFont.Tag);
  iniFile.WriteString('FavoritesManager', 'FavoritesListFontSize', tmpString);

  iniFile.UpdateFile;
  FreeAndNil(iniFile);
end;

procedure TFormFavoritesManager.ButtonSettingsClick(Sender: TObject);
begin
  case FormFavoritesManager.WindowState of
    wsNormal:
      begin
        if not PopupSettingsCenterWindow.Enabled then
           PopupSettingsCenterWindow.Enabled:= True;
      end;
    wsMaximized: PopupSettingsCenterWindow.Enabled:= False;
  end;
  ShowDropdownMenu(ButtonSettings, PopupSettings);
end;

procedure TFormFavoritesManager.ButtonNewClick(Sender: TObject);
begin
  ExecuteFavAction(TSpeedButtonEx(Sender).Tag);
end;

procedure TFormFavoritesManager.ButtonSetSelectedProfileActiveClick(
  Sender: TObject);
var
  Item: TEasyItem;
begin
  if not FormMain.CheckSelected(FavoritesList) then
     begin
       GenerateMessage('Info', 'No profile selected.', '    You haven''t selected a profile to set active'+
                       '. Please try again.', 2);
       Exit;
     end;
  Item:= FavoritesList.Selection.First;
  FormMain.FavoriteProfile[0]:= TFavFileInfo(Item).eTitle;
  FormMain.FavoriteProfile[1]:= TFavFileInfo(Item).eFileName;
  if ActiveProfileItem <> nil then
     ActiveProfileItem.ImageIndex:= -1;
  ActiveProfileItem:= Item;
  Item.ImageIndex:= 3;
  FormMain.PopupEnableFavorites.Hint:= FormMain.FavoriteProfile[0];
end;

procedure TFormFavoritesManager.FormCreate(Sender: TObject);
begin
  if FormMain.MenuCustomizeSplashScreen.Tag = 0 then //if Screen.Fonts.IndexOf('Terminal') = -1 then
     begin
       FormMain.ChangeLabelFontConsolas(LabelHotkeyKeys, 7);
       FormMain.ChangeLabelFontConsolas(LabelHotkeyText, 7);
     end;
end;

procedure TFormFavoritesManager.PopupSettingsMeasureMenuItem(
  Sender: TObject; AMenuItem: TMenuItem; ACanvas: TCanvas; var Width,
  Height: Integer; ABarVisible: Boolean; var DefaultMeasure: Boolean);
begin
  FormMain.SetPopupMenuMeasureItem(AMenuItem, ACanvas, Width, Height);
end;

procedure TFormFavoritesManager.PopupSettingsSmallFontClick(
  Sender: TObject);
begin
  FavoritesList.BeginUpdate;
  case TMenuItem(Sender).Tag of
    0:
      begin
        FavoritesList.CellSizes.Report.Height:= 22;
        FavoritesList.Font.Size:= 9;
        FavoritesList.Header.Font.Size:= 9;
      end;
    1:
      begin
        FavoritesList.CellSizes.Report.Height:= 28;
        FavoritesList.Font.Size:= 12;
        FavoritesList.Header.Font.Size:= 12;
      end;
    2:
      begin
        FavoritesList.CellSizes.Report.Height:= 32;
        FavoritesList.Font.Size:= 14;
        FavoritesList.Header.Font.Size:= 12;
      end;
  end;
  FavoritesList.EndUpdate;
  FavoritesList.SetFocus;
end;

procedure TFormFavoritesManager.PopupSettingsCenterWindowClick(
  Sender: TObject);
begin
  if FormFavoritesManager.WindowState = wsNormal then
     begin
       FormFavoritesManager.Left:= (Screen.Width shr 1)-(FormFavoritesManager.Width shr 1)-1;
       FormFavoritesManager.Top:= (Screen.Height shr 1)-(FormFavoritesManager.Height shr 1)-1;
     end;
end;

procedure TFormFavoritesManager.FavoritesListItemPaintText(
  Sender: TCustomEasyListview; Item: TEasyItem; Position: Integer;
  ACanvas: TCanvas);
begin
  FormMain.ELV_SetEditingFontColor(TEasyListView(Sender), Item, ACanvas);
end;

end.
