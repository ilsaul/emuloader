unit uFavoritesManager;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ToolWin, IniFiles, PanelEx, MPCommonObjects,
  MPCommonUtilities, MPThreadManager, EasyListview, StdCtrls, Buttons,
  ShadowLabel, ExtCtrls;
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

type
  TFormFavoritesManager = class(TForm)
    ToolbarButtons: TToolBar;
    ToolButtonNew: TToolButton;
    FavoritesList: TEasyListview;
    ToolButtonDuplicate: TToolButton;
    ToolButtonDelete: TToolButton;
    NewFavoritePanel: TPanelEx;
    ToolButton3: TToolButton;
    ToolBarSetSelectedProfileActive: TToolButton;
    ToolButtonClearGames: TToolButton;
    ToolButtonRemoveInvalidEntries: TToolButton;
    LabelHotkeyText: TShadowLabel;
    LabelTaskMessage: TShadowLabel;
    PanelUpdatingFavTagInGames: TPanelEx;
    LabelHotkeyKeys: TShadowLabel;
    procedure ToolbarButtonsCustomDraw(Sender: TToolBar;
      const ARect: TRect; var DefaultDraw: Boolean);
    procedure FavoritesListKeyAction(Sender: TCustomEasyListview;
      var CharCode: Word; var Shift: TShiftState; var DoDefault: Boolean);
    procedure ToolButtonNewClick(Sender: TObject);
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
    procedure ToolBarSetSelectedProfileActiveClick(Sender: TObject);
    procedure FavoritesListDblClick(Sender: TCustomEasyListview;
      Button: TCommonMouseButton; MousePos: TPoint;
      ShiftState: TShiftState; var Handled: Boolean);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FavoritesListItemPaintText(Sender: TCustomEasyListview;
      Item: TEasyItem; Position: Integer; ACanvas: TCanvas);
  private
    { Private declarations }
    UpdateFavStatusInGames: Boolean;
    LastActiveFavFilter: String;
    ActiveProfileItem: TEasyItem;
    procedure UpdateDateTime(destItem: TEasyItem; const fFile: String);
    function  ELV_AddItem(const fFile: String): TEasyItem;
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
  public
    { Public declarations }
  end;

var
  FormFavoritesManager: TFormFavoritesManager;

implementation

{$R *.dfm}

uses uMain, uCommon;

function TFavFileInfo.GetCaptions(Column: Integer): WideString;
begin
  case Column of
    0: Result:= eTitle;
    1: Result:= IntToStr(eGamesCount);
    2: Result:= eFileName;
    3: Result:= eDateTimeText;
  end;
end;

procedure TFormFavoritesManager.UpdateDateTime(destItem: TEasyItem; const fFile: String);
begin
  TFavFileInfo(destItem).eDateTime:= FileAge(fFile);
  TFavFileInfo(destItem).eDateTimeText:= FormMain.GetDateTimeStr(TFavFileInfo(destItem).eDateTime);
end;

function TFormFavoritesManager.ELV_AddItem(const fFile: String): TEasyItem;
var
  Item: TEasyItem;
  favList: THashedStringList;
  HaveTitle: Integer;
begin
  favList:= THashedStringList.Create;
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
       TFavFileInfo(Item).eTitle:= favList.Values['favorite_title'];
       if TFavFileInfo(Item).eTitle = '' then
          TFavFileInfo(Item).eTitle:= ChangeFileExt(fFile, '');
       HaveTitle:= Ord(favList.IndexOfName('favorite_title') <> -1);
       if HaveTitle = 0 then
          begin
            // favorites profile have no title so, give it one!!!!
            favList.Insert(0, 'favorite_title='+TFavFileInfo(Item).eTitle);
            favList.SaveToFile(FormMain.GetFavoritesFolder+fFile);
            HaveTitle:= 1;
          end;
     end;

  TFavFileInfo(Item).eFileName:= fFile;
  UpdateDateTime(Item, FormMain.GetFavoritesFolder+fFile);
  TFavFileInfo(Item).eGamesCount:= favList.Count-HaveTitle;
  FreeAndNil(favList);
  Result:= Item;
end;

procedure TFormFavoritesManager.LoadFavoritesProfiles;
var
  favFiles: THashedStringList;
  Loop: Integer;
  fFileStr: String;
begin
  favFiles:= THashedStringList.Create;
  GetFilesList(FormMain.GetFavoritesFolder, '.ini', '*.ini', favFiles, False, True, False);
  if favFiles.Count = 0 then
     begin
       fFileStr:= CreateNewValidFileName(''); // this will create the default profile favorites.ini
       if fFileStr <> '' then
          favFiles.Add(fFileStr) // add default profile favorites.ini to the files list
       else
          begin
            GenerateMessage('Error', 'No files found.', '    No favorites files were found an failed to '+
                            'create the default profile favorites.ini!', 2, False, 1);
            FreeAndNil(favFiles);
            Exit;
          end;
     end;

  FavoritesList.BeginUpdate;
  FavoritesList.Items.ReIndexDisable:= True;
  favFiles.Sorted:= False;
  for Loop:=0 to favFiles.Count-1 do
      ELV_AddItem(favFiles[Loop]);

  FreeAndNil(favFiles);
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
  fileStr:= ChangeFileExt(iStr, '.ini');
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
begin
  if FormMain.IsFavoriteDefault(favFileName) then
     Exit; // default profile favorites.ini have a fixed "Default" title
  if not FileExists(FormMain.GetFavoritesFolder+favFileName) then
     begin
       if ShowErrorMessage then
          begin
            CallMessageBox;
            FormMain.AddMsgText('    File ');
            FormMain.AddMsgText(FormMain.GetFavoritesFolder+favFileName, $00a65300,[fsBold]);
            FormMain.AddMsgText(' was not found. Cannot change title.'+#13#10+'Aborting...');
            GenerateMessage('Error', 'Change favorite title.', '', 2, False, 1);
          end;
       Exit;
     end;
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
  if FormMain.FavoriteProfile[1] = favFileName then
     FormMain.FavoriteProfile[0]:= newStr;
end;

procedure TFormFavoritesManager.UpdateFileNameInfo(OldFile, NewFile: String; ShowErrorMessage: Boolean = False);
begin
  if RenameFile(FormMain.GetFavoritesFolder+OldFile, FormMain.GetFavoritesFolder+NewFile) then
     begin
       if FormMain.FavoriteProfile[1] = oldFile then
          FormMain.FavoriteProfile[1]:= NewFile;
       if LastActiveFavFilter = oldFile then
          LastActiveFavFilter:= NewFile;
     end
  else
     if ShowErrorMessage then
        begin
          CallMessageBox;
          FormMain.AddMsgText('    Failed to rename a file.'+#13#10+'From ');
          FormMain.AddMsgText(FormMain.GetFavoritesFolder+OldFile, $00a65300,[fsBold]);
          FormMain.AddMsgText(#13#10+'to ');
          FormMain.AddMsgText(FormMain.GetFavoritesFolder+NewFile, $00a65300,[fsBold]);
          FormMain.AddMsgText(#13#10+#13#10+'Please try again.');
          GenerateMessage('Error', 'Rename file.', '', 2, False, 1);
        end;
end;

function TFormFavoritesManager.CreateNewValidFileName(DuplicateFile: String): String;
var
  fIndex, titleIndex: Integer;
  fExt, defFile: String;
  gFile: THashedStringList;

  procedure CreateFileFav(Index: Integer);
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
  fExt:= '.ini';
  if DuplicateFile = '' then
     defFile:= 'favorites'
  else
     deffile:= DuplicateFile;
  Result:= '';
  if not FileExists(FormMain.GetFavoritesFolder+defFile+fExt) then
     begin
       // mostly, this case fall on create a new file, and for favorites.ini... I hope
       // copy a file will never enter this case
       CreateFileFav(-1);
       Result:= defFile+fExt;
       Exit;
     end
  else
  begin
    for fIndex:= 1 to 1000 do
    begin
      if not FileExists(FormMain.GetFavoritesFolder+defFile+IntToStr(fIndex)+fExt) then
         begin
           if DuplicateFile = '' then
              CreateFileFav(fIndex) // create new profile only
           else
              begin
                // copy files only
                CopyFile(PChar(FormMain.GetFavoritesFolder+DuplicateFile+fExt), PChar(FormMain.GetFavoritesFolder+defFile+IntToStr(fIndex)+fExt), False);
                Sleep(50);
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
                 GenerateMessage('Info', 'No profile selected.', '    You haven''t selected a profile to '+ActionString[ActionIndex]+
                                 '. Please select one and try again.', 2);
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
            GenerateMessage('Error', 'Create profile.', '    Failed to create a new profile... you have more than 1000 files named '+
                            'favorites????.ini in your favorites folder! Rename or delete a few before creating new ones.', 2, False, 1);
            Exit;
          end;
     end
  else
     begin
       if not FormMain.CheckSelected(FavoritesList) then
          begin
            GenerateMessage('Info', 'No profile selected.', '    You haven''t selected a profile to '+ActionString[ActionIndex]+
                            '. Please select one and try again.', 2);
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
             if GenerateMessage('Purge', 'Clear game entries.', '    This task will delete all game entries from the file, except "favorite_title".'+#13#10+#13#10+
                TFavFileInfo(Item).eTitle+#13#10+'File: '+TFavFileInfo(Item).eFileName+#13#10+
                'Date Modified: '+TFavFileInfo(Item).eDateTimeText+#13#10+#13#10+'Are you sure ?', 1, True, 2) = mrYes then
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

                  if LastActiveFavFilter = TFavFileInfo(Item).eFileName then
                     UpdateFavStatusInGames:= True;

                  GenerateMessage('Purge', 'Clear game entries. ', 'All game entries were deleted. File '+TFavFileInfo(Item).eFileName+
                                  ' is clean.', 2);
                end;
           end;
         4: // delete selected profile
           begin
             if FormMain.IsFavoriteDefault(TFavFileInfo(Item).eFileName) then
                begin
                  GenerateMessage('Error, Cannot Compute', 'Delete profile.', '    You are trying to terminate the default favorites profile. Wel... you can''t.'+#13#10+
                                  'If you want to empty this profile, please use "Clear Games", or select another profile.'+#13#10+#13#10+
                                  '    There must be at least one favorites profile for this feature to work properly.', 2);
                  Exit;
                end;
             if GenerateMessage('Delete File', 'Delete profile', '   You are about to delete a favorites profile.'+#13#10+#13#10+
                TFavFileInfo(Item).eTitle+#13#10+'file: '+TFavFileInfo(Item).eFileName+#13#10+
                'Games count: '+IntToStr(TFavFileInfo(Item).eGamesCount)+#13#10+
                'Date modified: '+TFavFileInfo(Item).eDateTimeText+#13#10+#13#10+
                '    If this is the active profile, the previous listed profile will be set active.'+#13#10+'Are you sure ?', 1, True, 2) = mrYes then
                begin
                  if DeleteFile(FormMain.GetFavoritesFolder+TFavFileInfo(Item).eFileName) then
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
  FavoriteGamesList, mGamesList: THashedStringList;
  Loop, GameIndex, TitleIndex, RemovedCount: Integer;
  ErrorMsgTitle, FavMsgTitle: String;
  gItem, favItem: TEasyItem;
  gGroup: TEasyGroup;

  function AddGameHashedList: Boolean;
  begin
    //error! update to 'softlistname\gamename=?????'
    mGamesList.Add(FormMain.GetPlayedGamesNameEntry(FormMain.TempGameVars.eName, FormMain.TempGameVars.eSoftwareName)+'='+FormMain.GetSystemIniSection(FormMain.TempGameVars.eSystemID, True));
    //if FormMain.TempGameVars.eSoftwareName = '' then
    //   mGamesList.Add(FormMain.TempGameVars.eName+'='+FormMain.GetSystemIniSection(FormMain.TempGameVars.eSystemID, True))
    //else
    //   mGamesList.Add(FormMain.TempGameVars.eName+'_'+FormMain.TempGameVars.eSoftwareName+'='+FormMain.GetSystemIniSection(FormMain.TempGameVars.eSystemID, True));
    Result:= True;
  end;

begin
  if not FormMain.CheckSelected(FavoritesList) then
     Exit;
  if not FormMain.CheckTotal(FormMain.GamesListView) then
     Exit;

  favItem:= FavoritesList.Selection.First;

  ErrorMsgTitle:= 'Error: Cleanse';
  FavMsgTitle:= 'Cleanse';
  // Button Maintenance !
  if not FileExists(FormMain.GetFavoritesFolder+TFavFileInfo(favItem).eFileName) then
     begin
       GenerateMessage(ErrorMsgTitle, 'Could not access the file.', '    File '+TFavFileInfo(favItem).eFileName+
                       ' was not found. The list cannot be cleansed. Aborting...', 2, False, 1);
       Exit;
     end;

  if FormMain.CheckReadOnly(FormMain.GetFavoritesFolder+TFavFileInfo(favItem).eFileName) then
     begin
       GenerateMessage(ErrorMsgTitle, 'A file that needs to be updated cannot be opened.', '    File '+
                       TFavFileInfo(favItem).eFileName+' is marked read-only. Cannot continue...', 2);
       Exit;
     end;

  if GenerateMessage(FavMsgTitle, 'A file is about to be changed.',
                     '    File '+TFavFileInfo(favItem).eFileName+
                     ' will be cleansed of all impurities, based on current games list. '+#13#10+
                     'Valid game entries of systems that are not available anymore will also be removed.'+
                     'Click No button if you want to abort.'+
                      #13#10+'Continue ?', 1, False, 2) = mrNo then
     Exit;

  LabelTaskMessage.Caption:= 'Cleansing favorite file of impurities, please wait...';
  PanelUpdatingFavTagInGames.Visible:= True;
  Application.ProcessMessages;
  Screen.Cursor:= crHourGlass;
  
  mGamesList:= THashedStringList.Create;
  mGamesList.BeginUpdate;

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

  mGamesList.EndUpdate;
  if mGamesList.Count = 0 then
     begin
       PanelUpdatingFavTagInGames.Visible:= False;
       Screen.Cursor:= crDefault;
       FreeAndNil(mGamesList);
       GenerateMessage('Error', 'Main games list is empty.', '    Failed to parse games list to validate games. '+
                       'Somehow the main games list is empty.'+#13#10+'Aborting...', 2, False, 1);
       Exit;
     end;
  FavoriteGamesList:= THashedStringList.Create;
  FavoriteGamesList.LoadFromFile(FormMain.GetFavoritesFolder+TFavFileInfo(favItem).eFileName);

  TitleIndex:= FavoriteGamesList.IndexOfName('favorite_title');
  RemovedCount:= 0;

  FavoriteGamesList.BeginUpdate;
  for Loop:=FavoriteGamesList.Count-1 downto 0 do
  begin
    if Loop <> TitleIndex then
       begin
         GameIndex:= mGamesList.IndexOf(FavoriteGamesList[Loop]);
         if GameIndex = -1 then
            begin
              Inc(RemovedCount);
              FavoriteGamesList.Delete(Loop);
            end;
       end;
  end;
  FavoriteGamesList.EndUpdate;
  FreeAndNil(mGamesList);
  if TitleIndex = -1 then
     TitleIndex:= 0
  else
     TitleIndex:= 1;

  PanelUpdatingFavTagInGames.Visible:= False;
  Screen.Cursor:= crDefault;
  Application.ProcessMessages;
  if RemovedCount > 0 then
     begin
       FavoriteGamesList.SaveToFile(FormMain.GetFavoritesFolder+TFavFileInfo(favItem).eFileName);
       TFavFileInfo(favItem).eGamesCount:= FavoriteGamesList.Count-TitleIndex;
       if LastActiveFavFilter = TFavFileInfo(favItem).eFileName then
          UpdateFavStatusInGames:= True;
       CallMessageBox;
       FormMain.AddMsgText('    File ');
       FormMain.AddMsgText(TFavFileInfo(favItem).eFileName, $00a65300,[fsBold]);
       FormMain.AddMsgText(' was successfully cleansed of ');
       FormMain.AddMsgText(IntToStr(RemovedCount), $00a65300,[fsBold]);
       FormMain.AddMsgText(' impurities! ');
       GenerateMessage(FavMsgTitle, 'The contents of a file have changed.', '', 2);
     end
  else
     GenerateMessage(FavMsgTitle, 'No changes have been made.',
                     '    No impurities were found in file '+TFavFileInfo(favItem).eFileName, 2);
  FreeAndNil(FavoriteGamesList);
end;

function TFormFavoritesManager.ValidateGamesActiveProfile: Boolean;
var
  favFile: THashedStringList;
  tIndex: Integer;
  Item: TEasyItem;
  Group: TEasyGroup;
  StrToSearch: String;
begin
  Result:= FileExists(FormMain.GetFavoritesFile);
  if not Result then
     begin
       GenerateMessage('Error', 'File not found.', '    The active favorites profile file was '+
                       'not found but is listed anyway. Please make sure to select a valid profile.'+#13#10+#13#10+
                       FormMain.FavoriteProfile[0]+#13#10+
                       'File: '+FormMain.FavoriteProfile[1], 2, False, 1);
       Exit;
     end;
  if not FormMain.CheckTotal(FormMain.GamesListView) then
     Exit;

  if (not UpdateFavStatusInGames) and (LastActiveFavFilter = FormMain.FavoriteProfile[1]) then
     Exit;

  LabelTaskMessage.Caption:= 'Updating favorite tags in games list, please wait...';
  PanelUpdatingFavTagInGames.Visible:= True;
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
        StrToSearch:= FormMain.GetPlayedGamesNameEntry(uMain.TEasyGameInfo(Item).eName, uMain.TEasyGameInfo(Item).eSoftwareName)+'='+FormMain.GetSystemIniSection(uMain.TEasyGameInfo(Item).eSystemID, True);
        //if uMain.TEasyGameInfo(Item).eSoftwareName = '' then
        //   StrToSearch:= uMain.TEasyGameInfo(Item).eName+'='+FormMain.GetSystemIniSection(uMain.TEasyGameInfo(Item).eSystemID, True)
        //else
        //   StrToSearch:= uMain.TEasyGameInfo(Item).eName+'_'+uMain.TEasyGameInfo(Item).eSoftwareName+'='+FormMain.GetSystemIniSection(uMain.TEasyGameInfo(Item).eSystemID, True);
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
      StrToSearch:= FormMain.GetPlayedGamesNameEntry(uMain.TEasyGameInfo(Item).eName, uMain.TEasyGameInfo(Item).eSoftwareName)+'='+FormMain.GetSystemIniSection(uMain.TEasyGameInfo(Item).eSystemID, True);
      //if uMain.TEasyGameInfo(Item).eSoftwareName = '' then
      //   StrToSearch:= uMain.TEasyGameInfo(Item).eName+'='+FormMain.GetSystemIniSection(uMain.TEasyGameInfo(Item).eSystemID, True)
      //else
      //   StrToSearch:= uMain.TEasyGameInfo(Item).eName+'_'+uMain.TEasyGameInfo(Item).eSoftwareName+'='+FormMain.GetSystemIniSection(uMain.TEasyGameInfo(Item).eSystemID, True);
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
  PanelUpdatingFavTagInGames.Visible:= False;
end;

procedure TFormFavoritesManager.ToolbarButtonsCustomDraw(Sender: TToolBar;
  const ARect: TRect; var DefaultDraw: Boolean);
begin
  FormMain.PaintToolBarTheme(Sender);
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
        ToolBarSetSelectedProfileActive.Click;
        if FormMain.CheckSelected(FavoritesList) then
           Close;
      end;
    VK_SPACE: ToolBarSetSelectedProfileActive.Click;
    VK_F2: EditTitleFileName(0);
    VK_F3: EditTitleFileName(2);
    VK_DELETE: ToolButtonDelete.Click;
    VK_ESCAPE: Close;
  end;
end;

procedure TFormFavoritesManager.ToolButtonNewClick(Sender: TObject);
begin
  ExecuteFavAction(TToolButton(Sender).Tag);
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
  Loop: Byte;
begin
  if FormMain.PopupEnableFavorites.Checked then
     begin
       FormFavoritesManager.Caption:= 'Select a Favorites Profile';
       for Loop:=0 to 5 do
           ToolbarButtons.Buttons[Loop].Enabled:= False;
     end;
  ToolBarSetSelectedProfileActive.Enabled:= True;
  FormMain.ELV_ResetNormalColors(FavoritesList);
  FavoritesList.Header.Columns[0].SortDirection:= esdNone;
  FavoritesList.Header.Columns[3].SortDirection:= esdDescending;
  LastActiveFavFilter:= FormMain.FavoriteProfile[1];
  ActiveProfileItem:= nil;
  UpdateFavStatusInGames:= False;
  LoadFavoritesProfiles;
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
        NewValue:= ChangeFileExt(NewValue, '.ini');
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

procedure TFormFavoritesManager.ToolBarSetSelectedProfileActiveClick(
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

procedure TFormFavoritesManager.FavoritesListDblClick(
  Sender: TCustomEasyListview; Button: TCommonMouseButton;
  MousePos: TPoint; ShiftState: TShiftState; var Handled: Boolean);
begin
  ToolBarSetSelectedProfileActive.Click;
  if FormMain.CheckSelected(FavoritesList) then
     Close;
end;

procedure TFormFavoritesManager.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  CanClose:= not FormMain.ELV_IsEditing(FavoritesList);
  if CanClose then
     CanClose:= ValidateGamesActiveProfile;
end;

procedure TFormFavoritesManager.FavoritesListItemPaintText(
  Sender: TCustomEasyListview; Item: TEasyItem; Position: Integer;
  ACanvas: TCanvas);
begin
  //if Position = 3 then
  //   ACanvas.Font.Size:= 8;
end;

end.
