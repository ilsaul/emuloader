unit uUserProfileEditor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ComCtrls, IniFiles, ImgList;

type
  TFormUserProfileEditor = class(TForm)
    UserProfileImageList: TImageList;
    PageControlMainOptions: TPageControl;
    TabSheetProfileMainData: TTabSheet;
    ButtonCreateNewProfile: TButton;
    ButtonCancelNewProfile: TButton;
    ButtonDeleteSelectedProfile: TButton;
    ButtonSaveProfile: TButton;
    ButtonPassword: TButton;
    TabSheetMiscellaneous: TTabSheet;
    CreateGamesListImage: TImage;
    EmulatorsSetupImage: TImage;
    EmulatorsDescriptionImage: TImage;
    SelectExecutable1Image: TImage;
    EmulatorsDefaultOptionsImage: TImage;
    FrontendPreferencesImage: TImage;
    FavoriteGamesImage: TImage;
    SelectExecutable2Image: TImage;
    SelectExecutable3Image: TImage;
    SelectExecutable4Image: TImage;
    SelectExecutable5Image: TImage;
    FavoriteUsersManagerImage: TImage;
    ShowHideGamesListColumnsImage: TImage;
    ParentalLockImage: TImage;
    UserProfileImage: TImage;
    FullScreenImage: TImage;
    CreateGamesList: TCheckBox;
    EmulatorsSetup: TCheckBox;
    EmulatorsDescriptions: TCheckBox;
    SelectExecutable1: TCheckBox;
    EmulatorsDefaultOptions: TCheckBox;
    FrontendPreferences: TCheckBox;
    FavoriteGames: TCheckBox;
    FavoriteUsersManager: TCheckBox;
    GamesColumnsEditor: TCheckBox;
    ParentalLock: TCheckBox;
    UserProfile: TCheckBox;
    FullScreen: TCheckBox;
    SelectExecutable2: TCheckBox;
    SelectExecutable3: TCheckBox;
    SelectExecutable4: TCheckBox;
    SelectExecutable5: TCheckBox;
    TabSheetPreviewPictures: TTabSheet;
    ShowPicturesImage: TImage;
    ShowTitleSnapshotsImage: TImage;
    DeletePicturesImage: TImage;
    RenamePicturesImage: TImage;
    DeleteExtraPicturesImage: TImage;
    ShowInGameSnapshotsImage: TImage;
    ShowMarqueesImage: TImage;
    ShowFlyersImage: TImage;
    ShowCabinetsImage: TImage;
    ShowControlPanelsImage: TImage;
    ShowControlPanelLayoutsImage: TImage;
    ShowTitleSnapshots: TCheckBox;
    DeletePictures: TCheckBox;
    RenamePictures: TCheckBox;
    DeleteExtraPictures: TCheckBox;
    ShowPictures: TCheckBox;
    ShowInGameSnapshots: TCheckBox;
    ShowMarquees: TCheckBox;
    ShowFlyers: TCheckBox;
    ShowCabinets: TCheckBox;
    ShowControlPanels: TCheckBox;
    ShowControlPanelLayouts: TCheckBox;
    TabSheetGames: TTabSheet;
    ButtonSave: TButton;
    ButtonClose: TButton;
    ButtonOk: TButton;
    ButtonReadUserProfileDAT: TButton;
    FullScreenExit: TCheckBox;
    FullScreenExitImage: TImage;
    KeysMappingSelectorImage: TImage;
    KeysMappingSelector: TCheckBox;
    LabelSelectUserProfile: TGroupBox;
    SelectUserProfile: TComboBox;
    LabelProfileDescription: TLabel;
    ProfileDescription: TEdit;
    PageControlGames: TPageControl;
    TabSheetGames1: TTabSheet;
    GamesFilterSelectionImage: TImage;
    GamesFilterSelector: TCheckBox;
    GamesListShowBigIconsImage: TImage;
    GamesListShowBigIcons: TCheckBox;
    GamesListShowSmallIconsImage: TImage;
    GamesListShowSmallIcons: TCheckBox;
    GamesListShowListImage: TImage;
    GamesListShowList: TCheckBox;
    GamesListShowDetailsImage: TImage;
    GamesListShowDetails: TCheckBox;
    PlayRecordedGameImage: TImage;
    PlayRecordedGame: TCheckBox;
    RecordGameImage: TImage;
    RecordGame: TCheckBox;
    CustomGameOptionsImage: TImage;
    CustomGameOptions: TCheckBox;
    CustomInitializationOptionsImage: TImage;
    CustomInitializationOptions: TCheckBox;
    CustomGameDescriptionImage: TImage;
    CustomGameDescription: TCheckBox;
    GamesInformationImage: TImage;
    GamesInformation: TCheckBox;
    GamesHistoryImage: TImage;
    GamesHistory: TCheckBox;
    GamesDriverInformationImage: TImage;
    GamesDriverInformation: TCheckBox;
    GamesFAQImage: TImage;
    GamesFAQ: TCheckBox;
    CreatePicturesListImage: TImage;
    CreatePicturesList: TCheckBox;
    CustomCommandLine: TCheckBox;
    CustomCommandLineImage: TImage;
    CustomGameCategoryImage: TImage;
    CustomGameCategory: TCheckBox;
    AutomaticGameInformationImage: TImage;
    AutomaticGameInformation: TCheckBox;
    DeleteGameZIP: TCheckBox;
    DeleteGameZIPImage: TImage;
    AddGamesToFavoritesImage: TImage;
    DeleteGamesFromFavoritesImage: TImage;
    RealIconsImage: TImage;
    AddGameParentalLockImage: TImage;
    GamesAuditImage: TImage;
    RefreshGamesImage: TImage;
    AddGamesToFavorites: TCheckBox;
    DeleteGamesFromFavorites: TCheckBox;
    GamesIcons: TCheckBox;
    AddGameParentalLock: TCheckBox;
    GamesAudit: TCheckBox;
    RefreshGames: TCheckBox;
    procedure ButtonReadUserProfileDATClick(Sender: TObject);
    procedure ButtonOkClick(Sender: TObject);
    procedure ButtonPasswordClick(Sender: TObject);
    procedure SelectUserProfileChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ButtonCreateNewProfileClick(Sender: TObject);
    procedure ButtonCancelNewProfileClick(Sender: TObject);
    procedure ButtonSaveProfileClick(Sender: TObject);
    procedure ProfileDescriptionKeyPress(Sender: TObject; var Key: Char);
    procedure ButtonDeleteSelectedProfileClick(Sender: TObject);
    procedure ButtonSaveClick(Sender: TObject);
    procedure ButtonCloseClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    function  SaveProfile: Boolean;
    function  LoadToolbarIcons: Boolean;
  public
    UserProfileFileName: String;
    HaveProfiles, HavePassword: Boolean;
    { Public declarations }
  end;

var
  FormUserProfileEditor: TFormUserProfileEditor;

implementation

uses uMain, uCommon, uUserProfileUserLogin, uPreferences;

{$R *.dfm}

function TFormUserProfileEditor.LoadToolbarIcons: Boolean;

  procedure LoadOptionIcon(IconIndex: ShortInt; ImageHolder: TImage);
  var
    IconFile: TIcon;
  begin
    if FormMain.ToolbarButtonsImageList.Count > 0 then
       begin
         IconFile:= TIcon.Create;
         IconFile.Width:= 16;
         IconFile.Height:= 16;
         IconFile.Transparent:= True;
         FormMain.ToolbarButtonsImageList.GetIcon(IconIndex, ImageHolder.Picture.Icon);
         FreeAndNil(IconFile);
       end;
  end;

begin
  Result:= ((FileExists(FormMain.FrontendPath+'resources\images\toolbars\Main\toolbar\72.ico')) and
            (FileExists(FormMain.FrontendPath+'resources\images\toolbars\MAMEConfiguration\5.ico')) and
            (FileExists(FormMain.FrontendPath+'resources\images\toolbars\Main\toolbar\25.ico')) and
            (FileExists(FormMain.FrontendPath+'resources\images\toolbars\Preferences\7.ico')));

  if Result then
     begin
       FormMain.AddDefaultIcons('Main\toolbar\72.ico', UserProfileImageList, 1, False);
       FormMain.AddDefaultIcons('MAMEConfiguration\5.ico', UserProfileImageList, 1, False);
       FormMain.AddDefaultIcons('Main\toolbar\25.ico', UserProfileImageList, 1, False);
       FormMain.AddDefaultIcons('Preferences\7.ico', UserProfileImageList, 1, False);
     end;

  // Load Icons directly from main screen's ImageList
  LoadOptionIcon(35, CreateGamesListImage);
  LoadOptionIcon(55, EmulatorsSetupImage);
  //LoadOptionIcon(??, EmulatorsDescriptionImage);
  LoadOptionIcon(15, SelectExecutable1Image);
  LoadOptionIcon(16, SelectExecutable2Image);
  LoadOptionIcon(47, SelectExecutable3Image);
  LoadOptionIcon(61, SelectExecutable4Image);
  LoadOptionIcon(62, SelectExecutable5Image);
  LoadOptionIcon(69, EmulatorsDefaultOptionsImage);
  LoadOptionIcon(33, FrontendPreferencesImage);
  LoadOptionIcon(9,  FavoriteUsersManagerImage);
  LoadOptionIcon(4,  FavoriteGamesImage);
  LoadOptionIcon(46, ShowHideGamesListColumnsImage);
  LoadOptionIcon(60, ParentalLockImage);
  LoadOptionIcon(72, UserProfileImage);
  LoadOptionIcon(64, FullScreenImage);
  LoadOptionIcon(34, FullScreenExitImage);
  LoadOptionIcon(57, KeysMappingSelectorImage);
  LoadOptionIcon(65, GamesFilterSelectionImage);
  LoadOptionIcon(0,  GamesListShowBigIconsImage);
  LoadOptionIcon(1,  GamesListShowSmallIconsImage);
  LoadOptionIcon(2,  GamesListShowListImage);
  LoadOptionIcon(3,  GamesListShowDetailsImage);
  LoadOptionIcon(70, CustomGameOptionsImage);
  LoadOptionIcon(70, CustomInitializationOptionsImage);
  LoadOptionIcon(44, CustomCommandLineImage);
  //LoadOptionIcon(??, CustomGameDescriptionImage);
  //LoadOptionIcon(??, CustomGameCategoryImage);
  LoadOptionIcon(12, PlayRecordedGameImage);
  LoadOptionIcon(13, RecordGameImage);
  LoadOptionIcon(21, GamesInformationImage);
  LoadOptionIcon(20, GamesHistoryImage);
  LoadOptionIcon(48, GamesDriverInformationImage);
  LoadOptionIcon(75, GamesFAQImage);
  //LoadOptionIcon(??, AutomaticGameInformationImage);
  LoadOptionIcon(71, DeleteGameZIPImage);
  LoadOptionIcon(30, AddGamesToFavoritesImage);
  LoadOptionIcon(31, DeleteGamesFromFavoritesImage);
  LoadOptionIcon(60, AddGameParentalLockImage);
  LoadOptionIcon(68, RealIconsImage);
  LoadOptionIcon(11, RefreshGamesImage);
  LoadOptionIcon(29, GamesAuditImage);
  LoadOptionIcon(63, ShowPicturesImage);
  LoadOptionIcon(37, ShowTitleSnapshotsImage);
  LoadOptionIcon(5,  ShowInGameSnapshotsImage);
  LoadOptionIcon(6,  ShowMarqueesImage);
  LoadOptionIcon(7,  ShowFlyersImage);
  LoadOptionIcon(8,  ShowCabinetsImage);
  LoadOptionIcon(17, ShowControlPanelsImage);
  LoadOptionIcon(59, ShowControlPanelLayoutsImage);
  LoadOptionIcon(49, RenamePicturesImage);
  LoadOptionIcon(28, DeletePicturesImage);
  LoadOptionIcon(28, DeleteExtraPicturesImage);
  //LoadOptionIcon(??, CreatePicturesListImage);
end;

function TFormUserProfileEditor.SaveProfile: Boolean;
begin
  Result:= True;
  if ((SelectUserProfile.Text = '') and (ProfileDescription.Text = '')) or (SelectUserProfile.Text = '') then
     begin
       FormMain.GetMessagesLng('Messages', 'NoProfileSelectedTitle', 'No Profile Selected',
                               'Messages', 'NoProfileSelectedMsg', 'There is no profile created/selected! Please, create or select a profile before saving it.');
       GenerateMessage(FormMain.MessageText[0], FormMain.MessageText[1], 2);
       Result:= False;
       Exit;
     end;
  if LowerCase(ProfileDescription.Text) = 'new user' then
     begin
       FormMain.GetMessagesLng('Messages', 'InvalidProfileTitle', 'Invalid Profile Name',
                               'Messages', 'InvalidProfileMsg', 'This profile is not valid! Please, enter a different name.');
       GenerateMessage(FormMain.MessageText[0], FormMain.MessageText[1], 2);
       Result:= False;
       Exit;
     end;
  if not HavePassword then
     begin
       FormMain.GetMessagesLng('Messages', 'NoPasswordTitle', 'No Password',
                               'Messages', 'NoPasswordMsg', 'The password is empty! Please, enter a valid password.');
       GenerateMessage(FormMain.MessageText[0], FormMain.MessageText[1], 2);
       Result:= False;
       Exit;
     end;

  {if SelectUserProfile.Items.IndexOf(ProfileDescription.Text) <> -1 then
     begin
       GenerateMessage('Profile Found', 'The profile "'+ProfileDescription.Text+'" already exists!'+#13+
                              'Please, choose another description for this profile.', 2);
       Result:=False;
       Exit;
     end;}

  if LowerCase(ProfileDescription.Text) <> LowerCase(SelectUserProfile.Text) then
     begin
       if SelectUserProfile.Items.IndexOf(ProfileDescription.Text) = -1 then
          begin
            if LowerCase(ProfileDescription.Text) = 'new user' then
               begin
                 FormMain.GetMessagesLng('Messages', 'InvalidProfileTitle', 'Invalid Profile Name',
                                         'Messages', 'InvalidProfileMsg', 'This profile is not valid! Please, enter a different name.');
                 GenerateMessage(FormMain.MessageText[0], FormMain.MessageText[1], 2);
                 Result:= False;
                 Exit;
               end;
          end
       else
          begin
            FormMain.GetMessagesLng('Messages', 'UseProfileFoundTitle', 'Profile Found',
                                    'Messages', 'UseProfileFoundMsg', 'The profile "%s" already exists! Please, choose another description for this profile.');
            GenerateMessage(FormMain.MessageText[0],
                            Format(FormMain.MessageText[1], [ProfileDescription.Text]), 2);
            Result:= False;
            Exit;
          end;

      if SelectUserProfile.Text = 'New User' then
         begin
           if SelectUserProfile.Items.IndexOf(ProfileDescription.Text) = -1 then
              begin
                SelectUserProfile.Items.BeginUpdate;
                SelectUserProfile.Items.Strings[SelectUserProfile.Items.IndexOf('New User')]:= ProfileDescription.Text;
                SelectUserProfile.Items.EndUpdate;
                SelectUserProfile.ItemIndex:=SelectUserProfile.Items.IndexOf(ProfileDescription.Text);
              end
           else
              begin
                FormMain.GetMessagesLng('Messages', 'UseProfileFoundTitle', 'Profile Found',
                                        'Messages', 'UseProfileFoundMsg', 'The profile "%s" already exists! Please, choose another description for this profile.');
                GenerateMessage(FormMain.MessageText[0],
                                Format(FormMain.MessageText[1], [ProfileDescription.Text]), 2);
                Result:= False;
                Exit;
              end;
         end
      else
         begin
           FormMain.GetMessagesLng('Messages', 'NewProfileDescriptionTitle', 'New Profile Description',
                                   'Messages', 'NewProfileDescriptionMsg', 'The profile description has changed! Do you wish to update it ?');
           case GenerateMessage(FormMain.MessageText[0], FormMain.MessageText[1], 1) of
             mrYes:
               begin
                 if SelectUserProfile.Items.IndexOf(ProfileDescription.Text) <> -1 then
                    begin
                      FormMain.GetMessagesLng('Messages', 'ErrorTitle', 'Error',
                                              'Messages', 'NewProfileDescriptionErrorMsg', 'Could not change profile description because there is another profile with the same name! Please, enter a different name.');
                      GenerateMessage(FormMain.MessageText[0], FormMain.MessageText[1], 2);
                      Result:= False;
                      Exit;
                    end;
                 if not RenameProfileDescription(SelectUserProfile.Text, ProfileDescription.Text) then
                    begin
                      FormMain.GetMessagesLng('Messages', 'ErrorTitle', 'Error',
                                              'Messages', 'NewProfileDescriptionError2Msg', 'Could not change profile description in UserProfiles.ini! Please, try again.');
                      GenerateMessage(FormMain.MessageText[0], FormMain.MessageText[1], 2);
                      Result:= False;
                      Exit;
                    end;
                 if not RenameFile(FormMain.FrontendPath+'resources\profiles\'+SelectUserProfile.Text, FormMain.FrontendPath+'resources\profiles\'+UserProfileFileName) then
                    begin
                      if not DeleteFile(FormMain.FrontendPath+'resources\profiles\'+SelectUserProfile.Text) then
                         begin
                           FormMain.GetMessagesLng('Messages', 'ErrorTitle', 'Error',
                                                   'Messages', 'UserProfileRenameDeleteErrorMsg', 'Could not rename nor delete profile "%s.dat". Please, delete file "resources\profiles\%s.dat" manually...');
                           GenerateMessage(FormMain.MessageText[0],
                                           Format(FormMain.MessageText[1], [UserProfileFileName, SelectUserProfile.Text]), 2);
                         end;
                    end;
                 UserProfileFileName:= ProfileDescription.Text;
                 SelectUserProfile.Items.BeginUpdate;
                 SelectUserProfile.Items.Strings[SelectUserProfile.Items.IndexOf(SelectUserProfile.Text)]:= ProfileDescription.Text;
                 SelectUserProfile.Items.EndUpdate;
                 SelectUserProfile.ItemIndex:= SelectUserProfile.Items.IndexOf(ProfileDescription.Text);
                 if FormMain.MenuUserProfile.Checked then
                    FormMain.StatusBarUserProfile.Caption:= Format(FormMain.GetLanguageText('Main', 'StatusBarUserProfile', 'User Profile: %s'), [UserProfileFileName]);
               end;
             mrNo : ProfileDescription.Text:= SelectUserProfile.Text;
           end;
         end;
     end;
  UserProfileFileName:= ProfileDescription.Text;
  FormMain.UpdateUserProfileOptions(UserProfileFileName);
  FormMain.MenuUserProfile.Tag:= 0;
  case FormMain.MenuUserProfile.Checked of
    True:
      begin
        FormMain.ActiveUserProfileDescription:= UserProfileFileName;
        FormMain.SetUserProfileOptions(UserProfileFileName);
      end;
    False: FormMain.ActiveUserProfileDescription:= '';
  end;
end;

procedure TFormUserProfileEditor.ButtonReadUserProfileDATClick(
  Sender: TObject);
begin
  if (HaveProfiles) and (SelectUserProfile.Text <> 'New User') then
     begin
       if not FormMain.ReadUserProfileOptions(UserProfileFileName) then
          begin
            FormMain.GetMessagesLng('Messages', 'ErrorTitle', 'Error',
                                    'Messages', 'ReadConfigFileErrorMsg', 'Could not read options from "%s" file! Please, verify if file is in place.');
            GenerateMessage(FormMain.MessageText[0],
                            Format(FormMain.MessageText[1], [UserProfileFileName+'.ini']), 2);
          end;
     end;
end;

procedure TFormUserProfileEditor.ButtonOkClick(Sender: TObject);
begin
  case ButtonSaveProfile.Enabled of
    True:
      begin
        case FileExists(FormMain.FrontendPath+'resources\profiles\'+ProfileDescription.Text+'.dat') of
          True:
            begin
              if FormMain.VerifyProfileChanges(ProfileDescription.Text) then
                 begin
                   FormMain.GetMessagesLng('Messages', 'UserProfileChangedTitle', 'Profile Changed',
                                           'Messages', 'UserProfileChangedMsg', 'The user profile "%s" has changed. Do you want to save and apply changes ?');
                   case GenerateMessage(FormMain.MessageText[0],
                                        Format(FormMain.MessageText[1], [ProfileDescription.Text]), 1) of
                     mrYes:
                       begin
                         if SaveProfile then
                            begin
                              if FormMain.MenuUserProfile.Checked then
                                 FormMain.SetUserProfileOptions(UserProfileFileName);
                              Close;
                            end;
                       end;
                     mrNo: Close;
                   end;
                 end;
              Close;
            end;
          False:
            begin
              if SaveProfile then
                 begin
                   if FormMain.MenuUserProfile.Checked then
                      FormMain.SetUserProfileOptions(UserProfileFileName);
                   Close;
                 end;
            end;
        end;
      end;
    False:
      begin
        if FormMain.VerifyProfileChanges(ProfileDescription.Text) then
           begin
             FormMain.GetMessagesLng('Messages', 'UserProfileChangedTitle', 'Profile Changed',
                                     'Messages', 'UserProfileChangedMsg', 'The user profile "%s" has changed. Do you want to save and apply changes ?');
             case GenerateMessage(FormMain.MessageText[0],
                                  Format(FormMain.MessageText[1], [ProfileDescription.Text]), 1) of
               mrYes:
                 begin
                   if SaveProfile then
                      begin
                        if FormMain.MenuUserProfile.Checked then
                           FormMain.SetUserProfileOptions(UserProfileFileName);
                        Close;
                      end;
                 end;
               mrNo: Close;
             end;
           end;
      end;
  end;
end;

procedure TFormUserProfileEditor.ButtonPasswordClick(Sender: TObject);
begin
  if ProfileDescription.Text <> '' then
     begin
        if SelectUserProfile.Text <> '' then
           begin
              if LowerCase(ProfileDescription.Text) = 'new user' then
                 begin
                   FormMain.GetMessagesLng('Messages', 'InvalidProfileTitle', 'Invalid Profile Name',
                                           'Messages', 'InvalidProfileMsg', 'This profile is not valid! Please, enter a different name.');
                   GenerateMessage(FormMain.MessageText[0], FormMain.MessageText[1], 2);
                   Exit;
                 end;
           end
        else
           begin
             FormMain.GetMessagesLng('Messages', 'NoProfileSelectedTitle', 'No Profile Selected',
                                     'Messages', 'NoProfileSelectedMsg', 'There is no profile created/selected! Please, create or select a profile before saving it.');
             GenerateMessage(FormMain.MessageText[0], FormMain.MessageText[1], 2);
             Exit;
           end;
        if not Assigned(FormUserProfileUserLogin) then
           FormUserProfileUserLogin:= TFormUserProfileUserLogin.Create(Self);
        with FormUserProfileUserLogin do
        begin
          Caption:= FormMain.GetLanguageText('Login Logout', 'LabelCreateEditPassword', 'Create/Edit Password');
          UserProfile.Enabled:= False;
          CurrentUserProfile:= ProfileDescription.Text;
          Password.Tag:= 2;
          UserProfile.Items.BeginUpdate;
          GetProfiles(UserProfile.Items);
          UserProfile.Items.EndUpdate;
          UserProfile.ItemIndex:= UserProfile.Items.IndexOf(SelectUserProfile.Text);
        end;
        FormUserProfileUserLogin.ShowModal;
        FreeAndNil(FormUserProfileUserLogin);
        HavePassword:= FormMain.MenuUserProfile.Tag = 0;
     end
  else
     begin
       FormMain.GetMessagesLng('Messages', 'ErrorTitle', 'Error',
                               'Messages', 'UserProfileDescriptionErrorMsg', 'Profile description is empty! Please, enter a description before choosing a password.');
       GenerateMessage(FormMain.MessageText[0], FormMain.MessageText[1], 2);
     end;
end;

procedure TFormUserProfileEditor.SelectUserProfileChange(Sender: TObject);
begin
  // this will open then current user profile for editing, after verifying password
  if SelectUserProfile.Items.Count > 0 then
     begin
       case FormMain.MenuUserProfile.Checked of
         False:
           begin
             if not Assigned(FormUserProfileUserLogin) then
                FormUserProfileUserLogin:= TFormUserProfileUserLogin.Create(Self);
             with FormUserProfileUserLogin do
             begin
               UserProfile.Enabled:= False;
               CurrentUserProfile:= SelectUserProfile.Text;
               Password.Tag:= 3;
               UserProfile.Items.BeginUpdate;
               GetProfiles(UserProfile.Items);
               UserProfile.Items.EndUpdate;
               UserProfile.ItemIndex:= UserProfile.Items.IndexOf(SelectUserProfile.Text);
             end;
             FormUserProfileUserLogin.ShowModal;
             FreeAndNil(FormUserProfileUserLogin);
             case FormMain.MenuUserProfile.Tag of
               0:
                 begin
                   UserProfileFileName:= SelectUserProfile.Text;
                   ProfileDescription.Text:= UserProfileFileName;
                   FormMain.GetMessagesLng('Resource', 'ButtonReadIni', '&Read "%s"',
                                           'Resource', 'ButtonReadIniHint', 'Read all data from file "%s"');
                   ButtonReadUserProfileDAT.Caption:= Format(FormMain.MessageText[0], [UserProfileFileName+'.dat']);
                   ButtonReadUserProfileDAT.Hint:= Format(FormMain.MessageText[1], [UserProfileFileName+'.dat']);
                   ButtonReadUserProfileDAT.OnClick(Self);
                   HavePassword:= True;
                   ButtonSaveProfile.Enabled:= True;
                   ButtonDeleteSelectedProfile.Enabled:= True;
                 end;
               1:
                 begin
                   if UserProfileFileName <> '' then
                      SelectUserProfile.ItemIndex:= SelectUserProfile.Items.IndexOf(UserProfileFileName)
                   else
                      SelectUserProfile.ItemIndex:= -1;
                   HavePassword:= False;
                   ButtonSaveProfile.Enabled:= False;
                   ButtonDeleteSelectedProfile.Enabled:= False;
                 end;
             end;
           end;
         True:
           begin
             UserProfileFileName:= SelectUserProfile.Text;
             ProfileDescription.Text:= UserProfileFileName;
             FormMain.GetMessagesLng('Resource', 'ButtonReadIni', '&Read "%s"',
                                     'Resource', 'ButtonReadIniHint', 'Read all data from file "%s"');
             ButtonReadUserProfileDAT.Caption:= Format(FormMain.MessageText[0], [UserProfileFileName+'.dat']);
             ButtonReadUserProfileDAT.Hint:= Format(FormMain.MessageText[1], [UserProfileFileName+'.dat']);
             ButtonReadUserProfileDAT.OnClick(Self);
             HavePassword:= True;
           end;
       end;
     end;
end;

procedure TFormUserProfileEditor.FormShow(Sender: TObject);
begin
  FormMain.UpdateGeneralAppearance(FormUserProfileEditor);
  FormMain.SetUserProfileLanguage;
  if HaveProfiles then
     begin
       SelectUserProfile.Items.BeginUpdate;
       GetProfiles(SelectUserProfile.Items);
       SelectUserProfile.Items.EndUpdate;
       if UserProfileFileName <> '' then
          begin
            SelectUserProfile.ItemIndex:= SelectUserProfile.Items.IndexOf(UserProfileFileName);
            SelectUserProfile.OnChange(Self);
          end;
     end;
  if SelectUserProfile.Enabled then
     begin
       if HaveProfiles then
          ButtonDeleteSelectedProfile.Visible:= True;
       ButtonCreateNewProfile.Visible:= True;
       ButtonCancelNewProfile.Visible:= True;
     end;
end;

procedure TFormUserProfileEditor.ButtonCreateNewProfileClick(
  Sender: TObject);
begin
  ButtonCreateNewProfile.Enabled:= False;
  SelectUserProfile.Items.Add('New User');
  SelectUserProfile.ItemIndex:= SelectUserProfile.Items.IndexOf('New User');
  ButtonCancelNewProfile.Enabled:= True;
  ButtonDeleteSelectedProfile.Enabled:= False;
  ButtonSaveProfile.Enabled:= True;
  SelectUserProfile.Enabled:= False;
  HavePassword:= False;
  FormMain.ResetProfileEditorOptions;
  ProfileDescription.Text:= 'Choose a user name';
  ProfileDescription.SelectAll;
  ProfileDescription.SetFocus;

end;

procedure TFormUserProfileEditor.ButtonCancelNewProfileClick(
  Sender: TObject);
begin
  FormMain.GetMessagesLng('Messages', 'UserProfileCancelNewProfileTitle', 'Cancel New Profile',
                          'Messages', 'UserProfileCancelNewProfileMsg', 'Cancel the creation of the new profile. Are you sure ?');
  if GenerateMessage(FormMain.MessageText[0], FormMain.MessageText[1], 1) = mrYes then
     begin
       ButtonCancelNewProfile.Enabled:= False;
       SelectUserProfile.Items.Delete(SelectUserProfile.ItemIndex);
       SelectUserProfile.ItemIndex:= -1;
       ProfileDescription.Text:= '';
       ButtonCreateNewProfile.Enabled:= True;
       SelectUserProfile.Enabled:= True;
       ButtonSaveProfile.Enabled:= False;
       ButtonDeleteSelectedProfile.Enabled:= False;
       FormMain.ResetProfileEditorOptions;
       HavePassword:= False;
     end;
end;

procedure TFormUserProfileEditor.ButtonSaveProfileClick(Sender: TObject);
begin
  if SaveProfile then
     begin
       if not FormMain.MenuUserProfile.Checked then
          begin
            ButtonCreateNewProfile.Enabled:= True;
            ButtonCancelNewProfile.Enabled:= False;
            ButtonDeleteSelectedProfile.Enabled:= True;
            SelectUserProfile.Enabled:= True;
          end;
     end;
end;

procedure TFormUserProfileEditor.ProfileDescriptionKeyPress(
  Sender: TObject; var Key: Char);
begin
  if Key in [';', '.', ',', '<', '>', '[', ']', '{', '}', '(', ')', '=', '+', '*',
             '@', '$', '^', '~', '#', '%', '¨', ':', '/', '|', '\', '?', '!', '&',
             '´', '`', '''', '"'] then
     Key:= Char(0);
end;

procedure TFormUserProfileEditor.ButtonDeleteSelectedProfileClick(
  Sender: TObject);
begin
  FormMain.GetMessagesLng('Messages', 'UserProfileDeleteTitle', 'Delete Profile',
                          'Messages', 'UserProfileDeleteMsg', 'Delete profile "%s" from disk. Are you sure ?');
  if GenerateMessage(FormMain.MessageText[0],
                     Format(FormMain.MessageText[1], [UserProfileFileName]), 1) = mrNo then
     Exit;
  case DeleteUserProfile(UserProfileFileName) of
    True:
      begin
        if not DeleteFile(FormMain.FrontendPath+'resources\profiles\'+UserProfileFileName+'.dat') then
           begin
             FormMain.GetMessagesLng('Messages', 'ErrorTitle', 'Error',
                                     'Messages', 'UserProfileDeleteErrorMsg', 'Could not delete profile "%s.dat". Please, delete file "resources\profiles\%s.dat" before using this name description again...');
             GenerateMessage(FormMain.MessageText[0],
                             Format(FormMain.MessageText[1], [UserProfileFileName, UserProfileFileName]), 2);
           end;
        // must delete the file is file size is zero (0)
        SelectUserProfile.DeleteSelected;
        SelectUserProfile.ItemIndex:= -1;
        //VerifyUserProfilesCount;
        ButtonSaveProfile.Enabled:= False;
        ButtonDeleteSelectedProfile.Enabled:= False;
        ProfileDescription.Text:= '';
        if SelectUserProfile.Items.Count = 0 then
           HaveProfiles:= False;
        HavePassword:= False;
        FormMain.ResetProfileEditorOptions;
      end;
    False:
      begin
        FormMain.GetMessagesLng('Messages', 'ErrorTitle', 'Error',
                                'Messages', 'UserProfileDeleteError2Msg', 'Could not delete section "[%s]" from UserProfiles.ini! Please, try again or verify UserProfiles.ini file contents.');
        GenerateMessage(FormMain.MessageText[0],
                        Format(FormMain.MessageText[1], [UserProfileFileName]), 2);
      end;
  end;
end;

procedure TFormUserProfileEditor.ButtonSaveClick(Sender: TObject);
begin
  if SaveProfile then
     begin
       if not FormMain.MenuUserProfile.Checked then
          begin
            ButtonCreateNewProfile.Enabled:= True;
            ButtonCancelNewProfile.Enabled:= False;
            ButtonDeleteSelectedProfile.Enabled:= True;
            SelectUserProfile.Enabled:= True;
          end;
     end;
end;

procedure TFormUserProfileEditor.ButtonCloseClick(Sender: TObject);
begin
  if ButtonSaveProfile.Enabled then
     begin
       case FileExists(FormMain.FrontendPath+'resources\profiles\'+ProfileDescription.Text+'.dat') of
          True:
            begin
              if FormMain.VerifyProfileChanges(ProfileDescription.Text) then
                 begin
                   FormMain.GetMessagesLng('Messages', 'UserProfileChangedTitle', 'Profile Changed',
                                           'Messages', 'UserProfileChangedMsg', 'The user profile "%s" has changed. Do you want to save and apply changes ?');
                   case GenerateMessage(FormMain.MessageText[0],
                                        Format(FormMain.MessageText[1], [ProfileDescription.Text]), 1) of
                     mrYes:
                       begin
                         if SaveProfile then
                            begin
                              if FormMain.MenuUserProfile.Checked then
                                 FormMain.SetUserProfileOptions(UserProfileFileName);
                              Close;
                            end;
                       end;
                     mrNo: Close;
                   end;
                 end;
              Close;
            end;
          False:
            begin
              FormMain.GetMessagesLng('Messages', 'UserProfileNotSavedTitle', 'Profile Not Saved',
                                      'Messages', 'UserProfileNotSavedMsg', 'There is a unsaved profile. You will loose all settings! Are you sure ?');
              if GenerateMessage(FormMain.MessageText[0], FormMain.MessageText[1], 1) = mrNo then
                 Exit;
            end;
        end;
     end;
  Close;
end;

procedure TFormUserProfileEditor.FormCreate(Sender: TObject);
begin
  // Load Icons
  LoadToolbarIcons;
end;

end.
