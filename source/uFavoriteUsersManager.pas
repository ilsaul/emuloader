unit uFavoriteUsersManager;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, ComCtrls, ToolWin, IniFiles, StdCtrls;

type
  TFormFavoriteUsersManager = class(TForm)
    PageControlUsersList: TPageControl;
    TabSheetUsersList: TTabSheet;
    LabelNewUser: TGroupBox;
    LabelNewUserMessage: TLabel;
    NewUser: TEdit;
    ButtonCancelNewUser: TButton;
    ButtonConfirmNewUser: TButton;
    LabelSelectUser: TGroupBox;
    UsersList: TComboBox;
    TopImage: TImage;
    LabelCaption: TLabel;
    BottomLine: TBevel;
    ButtonClose: TButton;
    ToolBarButtons: TToolBar;
    ButtonNewUser: TToolButton;
    ButtonEditUser: TToolButton;
    ButtonDeleteUser: TToolButton;
    ToolButton2: TToolButton;
    ButtonUpdateFavoriteGamesList: TToolButton;
    procedure FormCreate(Sender: TObject);
    procedure ButtonNewUserClick(Sender: TObject);
    procedure UsersListChange(Sender: TObject);
    procedure ButtonEditUserClick(Sender: TObject);
    procedure ButtonDeleteUserClick(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ButtonCancelNewUserClick(Sender: TObject);
    procedure ButtonConfirmNewUserClick(Sender: TObject);
    procedure NewUserKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure ButtonUpdateFavoriteGamesListClick(Sender: TObject);
    procedure ButtonCloseClick(Sender: TObject);
  private
    { Private declarations }
    ActionType: Integer;
    procedure ManageUser(Username: String);
  public
    { Public declarations }
  end;

var
  FormFavoriteUsersManager: TFormFavoriteUsersManager;

implementation

uses uMain, uCommon, uFilesUtil, uStatus;

{$R *.DFM}

// procedures ----------------------
procedure TFormFavoriteUsersManager.ManageUser(Username: String);
var
  FavoriteIni: TIniFile;
  FavoriteFile: THashedStringList;
  UserIndex: Integer;
begin
  FavoriteIni:= TIniFile.Create(FormMain.FrontendPath+'Favorites.ini');
  case ActionType of
    0: // Create a new user
      begin
        if UsersList.Items.IndexOf(NewUser.Text) = -1 then
           begin
             UsersList.Items.Add(NewUser.Text);
             FavoriteIni.WriteString(NewUser.Text, 'File', 'resources\favorites\'+NewUser.Text+'.dat');
             if not FileExists(FormMain.FrontendPath+'resources\favorites\'+NewUser.Text+'.dat') then
                begin
                  FavoriteFile:= THashedStringList.Create;
                  FavoriteFile.Clear;
                  FavoriteFile.SaveToFile(FormMain.FrontendPath+'resources\favorites\'+NewUser.Text+'.dat');
                  FreeAndNil(FavoriteFile);
                  LabelNewUser.Visible:= False;
                end;
             NewUser.Text:= '';
           end
        else
           GenerateMessage(FormMain.GetLanguageText('Messages', 'ErrorTitle', 'Error'),
                           FormMain.GetLanguageText('Messages', 'FavoriteUserFoundMsg', 'This user already exists!'), 2);
      end;
    1: // Edit a existing user
      begin
        UserIndex:= UsersList.Items.IndexOf(NewUser.Text);
        if UserIndex = -1 then
           begin
             if RenameFile(FormMain.FrontendPath+'resources\favorites\'+UsersList.Text+'.dat', FormMain.FrontendPath+'resources\favorites\'+NewUser.Text+'.dat') = False then
                GenerateMessage(FormMain.GetLanguageText('Messages', 'ErrorTitle', 'Error'),
                                FormMain.GetLanguageText('Messages', 'FavoriteUserRenameErrorMsg', 'An error has occurred trying to rename the favorite file!'), 2);

             if (NewUser.Text <> UsersList.Text) and (NewUser.Text <> '') then
                begin
                  FavoriteIni.WriteString(NewUser.Text, 'File', 'resources\favorites\'+NewUser.Text+'.dat');
                  if FavoriteIni.SectionExists(UsersList.Text) then
                     FavoriteIni.EraseSection(UsersList.Text);
                  FavoriteIni.UpdateFile;
                end;
             UsersList.DeleteSelected;
             UsersList.Items.Add(NewUser.Text);

             UserIndex:= UsersList.Items.IndexOf(NewUser.Text);
             UsersList.ItemIndex:= UserIndex;
             UsersList.OnChange(Self);
             NewUser.Text:= '';
             LabelNewUser.Visible:= False;
           end
        else
           GenerateMessage(FormMain.GetLanguageText('Messages', 'ErrorTitle', 'Error'),
                           FormMain.GetLanguageText('Messages', 'FavoriteUserFoundMsg', 'This user already exists!'), 2);
      end;
    2: // Delete a existing user
      begin
        FavoriteIni.EraseSection(UsersList.Text);
        UsersList.Items.Delete(UsersList.ItemIndex);
        DeleteFile(FormMain.FrontendPath+'resources\favorites\'+UsersList.Text+'.dat');
        UsersList.ItemIndex:= 0;
        LabelNewUser.Visible:= False;
      end;
  end;
  FavoriteIni.UpdateFile;
  FreeAndNil(FavoriteIni);
  {if GetFileSize(FormMain.FrontendPath+'resources\favorites\'+UsersList.Text+'.dat') < 32768 then
     begin
       FavoriteFile:= THashedStringList.Create;
       FavoriteFile.BeginUpdate;
       FavoriteIni.GetStrings(FavoriteFile);
       FavoriteFile.EndUpdate;
       FavoriteIni.Free;
       FavoriteFile.SaveToFile(FormMain.FrontendPath+'Favorites.ini');
       FavoriteFile.Free;
       FavoriteFile:=nil;
     end
  else
     FavoriteIni.Free;}
end;

procedure TFormFavoriteUsersManager.FormCreate(Sender: TObject);
var
  FavoritesIni: TIniFile;
  FavUsersList: THashedStringList;
  Loop: Integer;
begin
  if FileExists(FormMain.FrontendPath+'resources\images\topwindow\FavoriteUsersManager.png') then
     TopImage.Picture.LoadFromFile(FormMain.FrontendPath+'resources\images\topwindow\FavoriteUsersManager.png');

  ButtonUpdateFavoriteGamesList.Enabled:= not FormMain.MenuShowFavorite.Checked;
  FavUsersList:= THashedStringList.Create;
  FavoritesIni:= TIniFile.Create(FormMain.FrontendPath+'Favorites.ini');
  FavoritesIni.ReadSections(FavUsersList);
  FavoritesIni.Free;
  UsersList.Items.BeginUpdate;
  FavUsersList.Sort;
  for Loop:=0 to FavUsersList.Count -1 do
  begin
    if FavUsersList[Loop] <> 'Default' then
       begin
         if UsersList.Items.IndexOf(FavUsersList[Loop]) = -1 then
            UsersList.Items.Add(FavUsersList[Loop]);
       end;
    if FormMain.FavoriteUser = 'Default' then
       UsersList.ItemIndex:= 0
    else
       UsersList.ItemIndex:= UsersList.Items.IndexOf(FormMain.FavoriteUser);
  end;
  UsersList.Items.EndUpdate;
end;

procedure TFormFavoriteUsersManager.ButtonNewUserClick(Sender: TObject);
begin
  FormFavoriteUsersManager.KeyPreview:= False;
  LabelNewUser.Visible:= True;
  ActionType:= 0;
  NewUser.SetFocus;
end;

procedure TFormFavoriteUsersManager.UsersListChange(Sender: TObject);
begin
  if UsersList.Text = '(Default)' then
     FormMain.FavoriteUser:= 'Default'
  else
     FormMain.FavoriteUser:= UsersList.Text;
  FormMain.StatusBarFavoriteUser.Caption:= Format(FormMain.GetLanguageText('Main', 'StatusBarFavoriteUser', 'Favorite User: %s'), [FormMain.FavoriteUser]);
end;

procedure TFormFavoriteUsersManager.ButtonEditUserClick(Sender: TObject);
begin
  FormFavoriteUsersManager.KeyPreview:= False;
  ActionType:= 1;
  LabelNewUser.Visible:= True;
  NewUser.Text:= UsersList.Text;
  NewUser.SelectAll;
  NewUser.SetFocus;
end;

procedure TFormFavoriteUsersManager.ButtonDeleteUserClick(Sender: TObject);
begin
  if UsersList.Text <> '(Default)' then
     begin
       if GenerateMessage(FormMain.GetLanguageText('Messages', 'FavoriteUserDeleteTitle', 'Delete Favorite User'),
                          FormMain.GetLanguageText('Messages', 'FavoriteUserDeleteMsg', 'Delete current user. Are you sure ?'), 1) = mrYes then
          begin
            ActionType:= 2;
            ManageUser(UsersList.Text);
          end;
     end
  else
     GenerateMessage(FormMain.GetLanguageText('Messages', 'ErrorTitle', 'Error'),
                     FormMain.GetLanguageText('Messages', 'FavoriteUserDeleteErrorMsg', 'The "Default" user cannot be deleted!'), 2);
end;

procedure TFormFavoriteUsersManager.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
     ButtonClose.OnClick(Self);
end;

procedure TFormFavoriteUsersManager.ButtonCancelNewUserClick(Sender: TObject);
begin
  NewUser.Text:= '';
  LabelNewUser.Visible:= False;
  ToolBarButtons.SetFocus;
  FormFavoriteUsersManager.KeyPreview:= True;
end;

procedure TFormFavoriteUsersManager.ButtonConfirmNewUserClick(Sender: TObject);
begin
  ManageUser(NewUser.Text);
  FormFavoriteUsersManager.KeyPreview:= True;
end;

procedure TFormFavoriteUsersManager.NewUserKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_RETURN:
     begin
       Key:= 0;
       ButtonConfirmNewUser.Click;
     end;
    VK_ESCAPE:
     begin
       Key:= 0;
       ButtonCancelNewUser.Click;
     end;
  end;
end;

procedure TFormFavoriteUsersManager.FormShow(Sender: TObject);
begin
  FormMain.UpdateGeneralAppearance(FormFavoriteUsersManager);
  FormMain.SetFavoriteUsersManagerLanguage;
end;

procedure TFormFavoriteUsersManager.ButtonUpdateFavoriteGamesListClick(
  Sender: TObject);
var
  GamesListGrid: array of array of String;
  FavoriteGamesList, mGamesList: THashedStringList;
  Loop, Loop2, GamesListCount, GameIndex: Integer;
  FavoriteListChanged, ReloadFavorites: Boolean;
begin
  if GetFileSize(FormMain.FrontendPath+'resources\favorites\'+UsersList.Text+'.dat') = 0 then
     begin
       GenerateMessage(FormMain.GetLanguageText('Messages', 'FavoriteGamesEmptyTitle', 'No Games In The List'),
                       FormMain.GetLanguageText('Messages', 'FavoriteGamesEmptyMsg', 'This favorites list is empty!'), 2);
       Exit;
     end;

  mGamesList:= THashedStringList.Create;
  GetGamesList(mGamesList, True, True);
  GamesListCount:= mGamesList.Count-1;

  SetLength(GamesListGrid, 20, GamesListCount+1);
  for Loop:=0 to GamesListCount do
  begin
    FormMain.GetROMFields(mGamesList[Loop]);
    GamesListGrid[ 0, Loop]:= IntToStr(FormMain.mROMIdentification);
    GamesListGrid[ 1, Loop]:= FormMain.mDescription;
    GamesListGrid[ 2, Loop]:= FormMain.mYear;
    GamesListGrid[ 3, Loop]:= FormMain.mManufacturer;
    GamesListGrid[ 4, Loop]:= FormMain.mSound;
    GamesListGrid[ 5, Loop]:= FormMain.mFrequency;
    GamesListGrid[ 6, Loop]:= FormMain.mSamples;
    GamesListGrid[ 7, Loop]:= FormMain.mControlType;
    GamesListGrid[ 8, Loop]:= FormMain.mVideo;
    GamesListGrid[ 9, Loop]:= FormMain.mOrientation;
    GamesListGrid[10, Loop]:= FormMain.mResolution;
    GamesListGrid[11, Loop]:= FormMain.mDriverStatus;
    GamesListGrid[12, Loop]:= FormMain.mSoundStatus;
    GamesListGrid[13, Loop]:= FormMain.mColorStatus;
    GamesListGrid[14, Loop]:= FormMain.mMerged;
    GamesListGrid[15, Loop]:= FormMain.mName;
    GamesListGrid[16, Loop]:= FormMain.mClone;
    GamesListGrid[17, Loop]:= FormMain.mCategory;
    GamesListGrid[18, Loop]:= FormMain.mVersionAdded;
    GamesListGrid[19, Loop]:= FormMain.mDriver;
  end;
  FreeAndNil(mGamesList);

  Application.ProcessMessages;
  FavoriteGamesList:= THashedStringList.Create;
  FavoriteGamesList.LoadFromFile(FormMain.FrontendPath+'resources\favorites\'+UsersList.Text+'.dat');

  mGamesList:= THashedStringList.Create;
  mGamesList.Assign(FavoriteGamesList);
  for Loop:=0 to FavoriteGamesList.Count -1 do
  begin
    FormMain.GetROMFields(FavoriteGamesList[Loop]);
    GameIndex:= -1;
    for Loop2:=0 to GamesListCount do
    begin
      if GamesListGrid[15, Loop2] = FormMain.mName then
         begin
           GameIndex:= Loop2;
           Break;
         end;
    end;
    if GameIndex = -1 then
       mGamesList.Delete(mGamesList.IndexOf(FavoriteGamesList[Loop]));

    Application.ProcessMessages;
  end;
  FreeAndNil(FavoriteGamesList);

  ReloadFavorites:= False;
  for Loop:=0 to mGamesList.Count -1 do
  begin
    FavoriteListChanged:= False;
    FormMain.GetROMFields(mGamesList[Loop]);
    GameIndex:= -1;
    for Loop2:=0 to GamesListCount do
    begin
      if GamesListGrid[15, Loop2] = FormMain.mName then
         begin
           GameIndex:= Loop2;
           Break;
         end;
    end;
    if GameIndex <> -1 then
       begin
         if IntToStr(FormMain.mROMIdentification) <> GamesListGrid[0, GameIndex] then
            begin
              FavoriteListChanged:= True;
              FormMain.mROMIdentification:= StrToInt(GamesListGrid[0, GameIndex]);
            end;
         if FormMain.mDescription <> GamesListGrid[1, GameIndex] then
            begin
              FavoriteListChanged:= True;
              FormMain.mDescription:= GamesListGrid[1, GameIndex];
            end;
         if FormMain.mYear <> GamesListGrid[2, GameIndex] then
            begin
              FavoriteListChanged:= True;
              FormMain.mYear:= GamesListGrid[2, GameIndex];
            end;
         if FormMain.mManufacturer <> GamesListGrid[3, GameIndex] then
            begin
              FavoriteListChanged:= True;
              FormMain.mManufacturer:= GamesListGrid[3, GameIndex];
            end;
         if FormMain.mSound <> GamesListGrid[4, GameIndex] then
            begin
              FavoriteListChanged:= True;
              FormMain.mSound:= GamesListGrid[4, GameIndex];
            end;
         if FormMain.mFrequency <> GamesListGrid[5, GameIndex] then
            begin
              FavoriteListChanged:= True;
              FormMain.mFrequency:= GamesListGrid[5, GameIndex];
            end;
         if FormMain.mSamples <> GamesListGrid[6, GameIndex] then
            begin
              FavoriteListChanged:= True;
              FormMain.mSamples:= GamesListGrid[6, GameIndex];
            end;
         if FormMain.mControlType <> GamesListGrid[7, GameIndex] then
            begin
              FavoriteListChanged:= True;
              FormMain.mControlType:= GamesListGrid[7, GameIndex];
            end;
         if FormMain.mVideo <> GamesListGrid[8, GameIndex] then
            begin
              FavoriteListChanged:= True;
              FormMain.mVideo:= GamesListGrid[8, GameIndex];
            end;
         if FormMain.mOrientation <> GamesListGrid[9, GameIndex] then
            begin
              FavoriteListChanged:= True;
              FormMain.mOrientation:= GamesListGrid[9, GameIndex];
            end;
         if FormMain.mResolution <> GamesListGrid[10, GameIndex] then
            begin
              FavoriteListChanged:= True;
              FormMain.mResolution:= GamesListGrid[10, GameIndex];
            end;
         if FormMain.mDriverStatus <> GamesListGrid[11, GameIndex] then
            begin
              FavoriteListChanged:= True;
              FormMain.mDriverStatus:= GamesListGrid[11, GameIndex];
            end;
         if FormMain.mSoundStatus <> GamesListGrid[12, GameIndex] then
            begin
              FavoriteListChanged:= True;
              FormMain.mSoundStatus:= GamesListGrid[12, GameIndex];
            end;
         if FormMain.mColorStatus <> GamesListGrid[13, GameIndex] then
            begin
              FavoriteListChanged:= True;
              FormMain.mColorStatus:= GamesListGrid[13, GameIndex];
            end;
         if FormMain.mMerged <> GamesListGrid[14, GameIndex] then
            begin
              FavoriteListChanged:= True;
              FormMain.mMerged:= GamesListGrid[14, GameIndex];
            end;
         if FormMain.mName <> GamesListGrid[15, GameIndex] then
            begin
              FavoriteListChanged:= True;
              FormMain.mName:= GamesListGrid[15, GameIndex];
            end;
         if FormMain.mClone <> GamesListGrid[16, GameIndex] then
            begin
              FavoriteListChanged:= True;
              FormMain.mClone:= GamesListGrid[16, GameIndex];
            end;
         if FormMain.mCategory <> GamesListGrid[17, GameIndex] then
            begin
              FavoriteListChanged:= True;
              FormMain.mCategory:= GamesListGrid[17, GameIndex];
            end;
         if FormMain.mVersionAdded <> GamesListGrid[18, GameIndex] then
            begin
              FavoriteListChanged:= True;
              FormMain.mVersionAdded:= GamesListGrid[18, GameIndex];
            end;
         if FormMain.mDriver <> GamesListGrid[19, GameIndex] then
            begin
              FavoriteListChanged:= True;
              FormMain.mDriver:= GamesListGrid[19, GameIndex];
            end;
       end;
    Application.ProcessMessages;
    if FavoriteListChanged then
       begin
         mGamesList[Loop]:= FormMain.PopulateROMDataLine;
         ReloadFavorites:= True;
       end;
  end;
  FreeAndNil(GamesListGrid);
  if ReloadFavorites then
     begin
       mGamesList.SaveToFile(FormMain.FrontendPath+'resources\favorites\'+UsersList.Text+'.dat');
       GenerateMessage(FormMain.GetLanguageText('Messages', 'CompleteOperationTitle', 'Operation Complete'),
                       Format(FormMain.GetLanguageText('Messages', 'FavoriteGamesUpdatedMsg', '"%s" favorite games updated!'), [UsersList.Text]), 2);
     end;
  FreeAndNil(mGamesList);
end;

procedure TFormFavoriteUsersManager.ButtonCloseClick(Sender: TObject);
begin
  FormMain.MenuShowHideFavoriteUsersManager.Click;
end;

end.
