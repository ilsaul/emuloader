unit uUserProfileUserLogin;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  StdCtrls, ExtCtrls, IniFiles, Mask, GraphicEx;

type
  TFormUserProfileUserLogin = class(TForm)
    LabelUserProfileLogin: TLabel;
    LabelEnterPassword: TLabel;
    LabelSelectUserProfile: TLabel;
    Password: TMaskEdit;
    UserProfile: TComboBox;
    ButtonOk: TButton;
    ButtonCancel: TButton;
    TopImage: TImage;
    BottomLine: TBevel;
    LabelConfirmPassword: TLabel;
    ConfirmPassword: TMaskEdit;
    procedure ButtonCancelClick(Sender: TObject);
    procedure ButtonOkClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure UserProfileKeyPress(Sender: TObject; var Key: Char);
    procedure PasswordKeyPress(Sender: TObject; var Key: Char);
    procedure PanelFormMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure PanelFormMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure PanelFormMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure UserProfileChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ConfirmPasswordKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    OldX,
    OldY,
    OldLeft,
    OldTop,
    ScreenDC           : HDC;
    MoveRect           : TRect;
    Moving             : Boolean;
  public
    { Public declarations }
    CurrentPassword, CurrentUserProfile: String;
  end;

var
  FormUserProfileUserLogin: TFormUserProfileUserLogin;

implementation

uses uMain, uCommon, uFilesUtil;

{$R *.dfm}

procedure TFormUserProfileUserLogin.ButtonCancelClick(Sender: TObject);
begin
  if Password.Tag = 2 then
     FormMain.MenuUserProfile.Tag:= 2
  else
     FormMain.MenuUserProfile.Tag:= 1;
  Close;
end;

procedure TFormUserProfileUserLogin.ButtonOkClick(Sender: TObject);
var
  PasswordFile: TIniFile;
  MemPasswordFile: TMemIniFile;
begin
  if ConfirmPassword.Enabled then
     begin
       if ConfirmPassword.Text = '' then
          begin
            ConfirmPassword.SelectAll;
            ConfirmPassword.SetFocus;
            Exit;
          end;

       if Password.Text <> ConfirmPassword.Text then
          begin
            GenerateMessage(FormMain.GetLanguageText('Messages', 'IncorrectPasswordTitle', 'Password Confirmation'),
                            FormMain.GetLanguageText('Messages', 'IncorrectPasswordMsg', 'The password is incorrect! Try again.'), 2);
            Password.SelectAll;
            Password.SetFocus;
            Exit;
          end;
     end;

  case ValidateUserProfilePassword(Password.Text, CurrentUserProfile, Password.Tag) of
    True:
      begin
        // 0 - enter a password
        // 1 - select a profile
        // 2 - change password
        case Password.Tag of
          0, 3: //this is for login (no changes). Will allow access to Users Profiles Manager if OK
            begin
              FormMain.MenuUserProfile.Tag:= 0;
              Close;
            end;
          1: // this is for select a user profile
            begin
              if (FileExists(FormMain.FrontendPath+'resources\profiles\'+CurrentUserProfile+'.dat')) and
                 (GetFileSize(FormMain.FrontendPath+'resources\profiles\'+CurrentUserProfile+'.dat') > 0) then
                 begin
                   FormMain.MenuUserProfile.Tag:= 0;
                   Close;
                 end
              else
                 begin
                   GenerateMessage(FormMain.GetLanguageText('Messages', 'ErrorTitle', 'Error'),
                                   Format(FormMain.GetLanguageText('Messages', 'UserProfileNotFoundMsg', 'File "%s.dat" not found or is empty! Please, select another profile or configure the options for this user on Users Profile Manager.'), [CurrentUserProfile]), 2);
                 end;
            end;
          2: //this is for changing the password
            begin
              if Password.Text <> '' then
                 begin
                    case FileExists(FormMain.FrontendPath+'UserProfiles.ini') of
                      True:
                        begin
                          if GetFileSize(FormMain.FrontendPath+'UserProfiles.ini') > 32768 then
                             begin
                               MemPasswordFile:= TMemIniFile.Create(FormMain.FrontendPath+'UserProfiles.ini');
                               MemPasswordFile.WriteString(CurrentUserProfile, 'Password', EncryptData(Password.Text));
                               FreeAndNil(MemPasswordFile);
                             end
                          else
                             begin
                               PasswordFile:= TIniFile.Create(FormMain.FrontendPath+'UserProfiles.ini');
                               PasswordFile.WriteString(CurrentUserProfile, 'Password', EncryptData(Password.Text));
                               FreeAndNil(PasswordFile);
                             end;
                        end;
                      False:
                        begin
                          PasswordFile:= TIniFile.Create(FormMain.FrontendPath+'UserProfiles.ini');
                          PasswordFile.WriteString(CurrentUserProfile, 'Password', EncryptData(Password.Text));
                          FreeAndNil(PasswordFile);
                        end;
                    end;
                    FormMain.MenuUserProfile.Tag:= 0;
                    Close;
                 end
              else
                 begin
                   GenerateMessage(FormMain.GetLanguageText('Messages', 'NoPasswordTitle', 'No Password'),
                                   FormMain.GetLanguageText('Messages', 'NoPasswordMsg', 'The password is empty! Please, enter a valid password.'), 2);
                 end;
            end;
        end;
      end;
    False:
      begin
        case Password.Tag of
          0, 3:
            begin
              GenerateMessage(FormMain.GetLanguageText('Messages', 'ErrorTitle', 'Error'),
                              FormMain.GetLanguageText('Messages', 'IncorrectPasswordMsg', 'The password is incorrect! Try again.'), 2);
              Password.SetFocus;
              Password.SelectAll;
            end;
        end;
      end;
  end;
end;

procedure TFormUserProfileUserLogin.FormShow(Sender: TObject);
begin
  FormMain.UpdateGeneralAppearance(FormUserProfileUserLogin);
  FormMain.SetUserProfileLoginLanguage;
  case Password.Tag of
    0: begin
         LabelUserProfileLogin.Caption:= FormMain.GetLanguageText('Login Logout', 'LabelUserProfileLogout', 'User Profile Logout');
         Password.Clear;
         ConfirmPassword.Clear;
         LabelConfirmPassword.Enabled:= False;
         ConfirmPassword.Enabled:= False;
       end;
    1: begin
         LabelUserProfileLogin.Caption:= FormMain.GetLanguageText('Login Logout', 'LabelUserProfileLogin', 'User Profile Login');
       end;
    2: begin
         LabelEnterPassword.Caption:= FormMain.GetLanguageText('Login Logout', 'LabelEnterNewPassword', 'Enter New Password');
         Password.Text:= DecryptData(FormMain.ParentalLockPasswordString);
         Password.SelectAll;
       end;
    3: begin
         LabelUserProfileLogin.Caption:= FormMain.GetLanguageText('Login Logout', 'LabelUserProfileLogin', 'User Profile Login');
         Password.Clear;
         ConfirmPassword.Clear;
       end;
  end;
  if Password.Enabled then
     Password.SetFocus
  else
  if UserProfile.Enabled then
     UserProfile.SetFocus;
end;

procedure TFormUserProfileUserLogin.UserProfileKeyPress(Sender: TObject;
  var Key: Char);
begin
  case Password.Enabled of
    True:
      begin
        Password.SelectAll;
        Password.SetFocus;
      end;
    False:
      begin
        if Key = #13 then
           ButtonOk.OnClick(Self)
        else
        if Key = #27 then
           ButtonCancel.OnClick(Self);
      end;
  end;
end;

procedure TFormUserProfileUserLogin.PasswordKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key in [';', '.', ',', '<', '>', '[', ']', '{', '}', '(', ')', '=', '+', '*',
             '@', '$', '^', '~', '#', '%', '¨', ':', '/', '|', '\', '?', '!', '&',
             '´', '`', '''', '"'] then
     Key:= Char(0)
  else
  if Key = #13 then
     begin
       case ConfirmPassword.Enabled of
         True:
           begin
             ConfirmPassword.Clear;
             ConfirmPassword.SetFocus;
           end;
         False: ButtonOk.OnClick(Self);
       end;
     end
  else
  if Key = #27 then
     ButtonCancel.OnClick(Self);
end;

procedure TFormUserProfileUserLogin.ConfirmPasswordKeyPress(
  Sender: TObject; var Key: Char);
begin
  if Key in [';', '.', ',', '<', '>', '[', ']', '{', '}', '(', ')', '=', '+', '*',
             '@', '$', '^', '~', '#', '%', '¨', ':', '/', '|', '\', '?', '!', '&',
             '´', '`', '''', '"'] then
     Key:= Char(0)
  else
  if Key = #13 then
     ButtonOk.OnClick(Self)
  else
  if Key = #27 then
     ButtonCancel.OnClick(Self);
end;

procedure TFormUserProfileUserLogin.PanelFormMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if Button = mbLeft then
     begin
       ScreenDC:= GetDC(0);
       OldX:= X;
       OldY:= Y;
       OldLeft:= X;
       OldTop:= Y;
       MoveRect:= BoundsRect;
       DrawFocusRect(ScreenDC,MoveRect);
       Moving:= True;
     end;
end;

procedure TFormUserProfileUserLogin.PanelFormMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  if Moving then
     begin
       DrawFocusRect(ScreenDC,MoveRect);
       OldX:= X;
       OldY:= Y;
       MoveRect:= Rect(Left+OldX-OldLeft,Top+OldY-OldTop,
                       Left+Width+OldX-OldLeft,Top+Height+OldY-OldTop);
       DrawFocusRect(ScreenDC,MoveRect);
     end;
end;

procedure TFormUserProfileUserLogin.PanelFormMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if Button = mbLeft then
     begin
       ReleaseCapture;
       DrawFocusRect(ScreenDC,MoveRect);
       Left:= Left+X-OldLeft;
       Top:= Top+Y-OldTop;
       ReleaseDC(0,ScreenDC);
       Moving:= False;
     end;
end;

procedure TFormUserProfileUserLogin.UserProfileChange(Sender: TObject);
begin
  FormMain.ActiveUserProfileDescription:= UserProfile.Text;
  CurrentUserProfile:= UserProfile.Text;
end;

procedure TFormUserProfileUserLogin.FormCreate(Sender: TObject);
begin
  if FileExists(FormMain.FrontendPath+'resources\images\topwindow\Users.png') then
     TopImage.Picture.LoadFromFile(FormMain.FrontendPath+'resources\images\topwindow\Users.png');
end;


end.
