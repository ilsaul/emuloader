unit uParentalLockPasswordLogout;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  ExtCtrls, StdCtrls, IniFiles, Mask;

type
  TFormParentalLockPasswordLogout = class(TForm)
    LabelEnterPassword: TLabel;
    Password: TMaskEdit;
    ButtonOk: TButton;
    ButtonCancel: TButton;
    LabelConfirmPassword: TLabel;
    ConfirmPassword: TMaskEdit;
    procedure ButtonCancelClick(Sender: TObject);
    procedure ButtonOkClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure PasswordKeyPress(Sender: TObject; var Key: Char);
    procedure PanelFormMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure PanelFormMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure PanelFormMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
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
    CurrentPassword: String;
    { Public declarations }
  end;

var
  FormParentalLockPasswordLogout: TFormParentalLockPasswordLogout;

implementation

uses uMain, uCommon;

{$R *.dfm}

procedure TFormParentalLockPasswordLogout.ButtonCancelClick(
  Sender: TObject);
begin
  FormMain.MenuParentalLock.Tag:= 1;
  Close;
end;

procedure TFormParentalLockPasswordLogout.ButtonOkClick(Sender: TObject);
var
  PasswordFile: THashedStringList;
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
            FormMain.GetMessagesLng('Messages', 'IncorrectPasswordTitle', 'Password Confirmation',
                                    'Messages', 'IncorrectPasswordMsg', 'The password is incorrect! Try again.');
            GenerateMessage(FormMain.MessageText[0], FormMain.MessageText[1], 2);
            Password.SelectAll;
            Password.SetFocus;
            Exit;
          end;
     end;

  case ValidateParentalLockPassword(Password.Text, Password.Tag) of
    True:
      begin
        case Password.Tag of
          0: //this is for login (no changes). Will deactivate if password is OK
            begin
              FormMain.MenuParentalLock.Tag:= 0;
              Close;
            end;
          1: //this is for changing the password
            begin
              if Password.Text <> '' then
                 begin
                    FormMain.ParentalLockPasswordString:=EncryptData(Password.Text);
                    PasswordFile:= THashedStringList.Create;
                    PasswordFile.Add(FormMain.ParentalLockPasswordString);
                    PasswordFile.SaveToFile(FormMain.FrontendPath+'ParentalLock.pwd');
                    FreeAndNil(PasswordFile);
                    FormMain.MenuParentalLock.Tag:= 0;
                    Close;
                 end
              else
                 begin
                   FormMain.GetMessagesLng('Messages', 'NoPasswordTitle', 'No Password',
                                           'Messages', 'NoPasswordMsg', 'The password is empty! Please, enter a valid password.');
                   GenerateMessage(FormMain.MessageText[0], FormMain.MessageText[1], 2);
                 end;
            end;
        end;
      end;
    False:
      begin
        case Password.Tag of
          0:
            begin
              FormMain.GetMessagesLng('Messages', 'ErrorTitle', 'Error',
                                      'Messages', 'IncorrectPasswordMsg', 'The password is incorrect! Try again.');
              GenerateMessage(FormMain.MessageText[0], FormMain.MessageText[1], 2);
              Password.SetFocus;
              Password.SelectAll;
            end;
        end;
      end;
  end;
end;

procedure TFormParentalLockPasswordLogout.FormShow(Sender: TObject);
begin
  FormMain.UpdateGeneralAppearance(FormParentalLockPasswordLogout);
  FormMain.SetParentalLockLogoutLanguage;
  ConfirmPassword.Clear;
  Password.SetFocus;
  case Password.Tag of
    0: begin
         LabelEnterPassword.Caption:= FormMain.GetLanguageText('Login Logout', 'LabelEnterPassword', 'Enter Password');
         Password.Clear;
         ConfirmPassword.Clear;
         LabelConfirmPassword.Enabled:= False;
         ConfirmPassword.Enabled:= False;
       end;
    1: begin
         FormMain.GetMessagesLng('Login Logout', 'LabelCreateEditPassword', 'Create/Edit Password',
                                 'Login Logout', 'LabelEnterNewPassword', 'Enter New Password');
         Caption:= FormMain.MessageText[0];
         LabelEnterPassword.Caption:= FormMain.MessageText[1];
         Password.Text:= DecryptData(FormMain.ParentalLockPasswordString);
         Password.SelectAll;
       end;
  end;
end;

procedure TFormParentalLockPasswordLogout.PasswordKeyPress(Sender: TObject;
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

procedure TFormParentalLockPasswordLogout.ConfirmPasswordKeyPress(
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

procedure TFormParentalLockPasswordLogout.PanelFormMouseDown(
  Sender: TObject; Button: TMouseButton; Shift: TShiftState; X,
  Y: Integer);
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

procedure TFormParentalLockPasswordLogout.PanelFormMouseMove(
  Sender: TObject; Shift: TShiftState; X, Y: Integer);
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

procedure TFormParentalLockPasswordLogout.PanelFormMouseUp(Sender: TObject;
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

end.
