unit uEmulatorsSetup;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, ComCtrls, INIFiles, ImgList, GR32_RangeBars;

type
  TFormEmulatorsSetup = class(TForm)
    ButtonOk: TButton;
    ButtonCancel: TButton;
    PageControlEmulatorsFileName: TPageControl;
    TabSheetEmulator1: TTabSheet;
    ExecutableFile: TEdit;
    ButtonClearCommandLine1: TButton;
    ButtonSet1stEmulatorOptions: TButton;
    ExecutableFileButtonSelect: TButton;
    TabSheetEmulator2: TTabSheet;
    ExecutableFile2: TEdit;
    ButtonClearCommandLine2: TButton;
    ButtonSet2ndEmulatorOptions: TButton;
    ExecutableFile2ButtonSelect: TButton;
    TabSheetEmulator3: TTabSheet;
    ExecutableFile3: TEdit;
    ButtonClearCommandLine3: TButton;
    ButtonSet3rdEmulatorOptions: TButton;
    ExecutableFile3ButtonSelect: TButton;
    TabSheetEmulator4: TTabSheet;
    ExecutableFile4: TEdit;
    ButtonClearCommandLine4: TButton;
    ButtonSet4thEmulatorOptions: TButton;
    ExecutableFile4ButtonSelect: TButton;
    TabSheetEmulator5: TTabSheet;
    ExecutableFile5: TEdit;
    ButtonClearCommandLine5: TButton;
    ButtonSet5thEmulatorOptions: TButton;
    ExecutableFile5ButtonSelect: TButton;
    DefaultGamesListBuilder: TGaugeBar;
    LabelDefaultGamesListBuilderValue: TLabel;
    LabelDefaultEmulator: TLabel;
    procedure ButtonCancelClick(Sender: TObject);
    procedure ExecutableFileChange(Sender: TObject);
    procedure ButtonSet1stEmulatorOptionsClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ButtonOkClick(Sender: TObject);
    procedure ExecutableFileAfterDialog(Sender: TObject; var Name: String;
      var Action: Boolean);
    procedure ExecutableFile2Change(Sender: TObject);
    procedure ExecutableFile2AfterDialog(Sender: TObject; var Name: String;
      var Action: Boolean);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure ButtonClearCommandLine1Click(Sender: TObject);
    procedure ButtonClearCommandLine2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ExecutableFile3AfterDialog(Sender: TObject; var Name: String;
      var Action: Boolean);
    procedure ExecutableFile3Change(Sender: TObject);
    procedure ButtonClearCommandLine3Click(Sender: TObject);
    procedure ButtonSet2ndEmulatorOptionsClick(Sender: TObject);
    procedure ButtonSet3rdEmulatorOptionsClick(Sender: TObject);
    procedure ButtonClearCommandLine4Click(Sender: TObject);
    procedure ButtonClearCommandLine5Click(Sender: TObject);
    procedure ExecutableFile4AfterDialog(Sender: TObject; var Name: String;
      var Action: Boolean);
    procedure ExecutableFile5AfterDialog(Sender: TObject; var Name: String;
      var Action: Boolean);
    procedure ExecutableFile4Change(Sender: TObject);
    procedure ExecutableFile5Change(Sender: TObject);
    procedure ButtonSet4thEmulatorOptionsClick(Sender: TObject);
    procedure ButtonSet5thEmulatorOptionsClick(Sender: TObject);
    procedure ExecutableFileButtonSelectClick(Sender: TObject);
    procedure ExecutableFile2ButtonSelectClick(Sender: TObject);
    procedure ExecutableFile3ButtonSelectClick(Sender: TObject);
    procedure ExecutableFile4ButtonSelectClick(Sender: TObject);
    procedure ExecutableFile5ButtonSelectClick(Sender: TObject);
    procedure DefaultGamesListBuilderChange(Sender: TObject);
  private
    { Private declarations }
    ExeChanged: Boolean;
    BackupEmulatorExecutable, BackupEmulatorExecutable2, BackupEmulatorExecutable3: String;
    BackupEmulatorExecutable4, BackupEmulatorExecutable5: String;
    function  VerifyExecutable(ExecutableNumber: ShortInt): Boolean;
  public
    Folders: THashedStringList;
    SaveCfg: Boolean;
    { Public declarations }
  end;

var
  FormEmulatorsSetup: TFormEmulatorsSetup;

implementation

uses uMain, uPreferences, uCommon, uFilesUtil;

{$R *.DFM}

procedure TFormEmulatorsSetup.ButtonCancelClick(Sender: TObject);
begin
  FormMain.MainMenu.Tag:= 1;
  Close;
end;

procedure TFormEmulatorsSetup.ExecutableFileChange(Sender: TObject);
begin
  ExeChanged:= True;
end;

procedure TFormEmulatorsSetup.ButtonSet1stEmulatorOptionsClick(Sender: TObject);
begin
  FormMain.CallEmulatorOptions(ExecutableFile.Text);
end;

procedure TFormEmulatorsSetup.FormShow(Sender: TObject);
begin
  FormMain.UpdateGeneralAppearance(FormEmulatorsSetup);
  FormMain.SetEmulatorsSetupLanguage;
  ButtonCancel.Enabled:= FormMain.AbortExecution;

  if FormMain.EmulatorExecutable[1] <> '' then
     begin
       ExecutableFile.Text:= FormMain.EmulatorExecutable[1];
       BackupEmulatorExecutable:= ExecutableFile.Text;
     end;

  if FormMain.EmulatorExecutable[2] <> '' then
     begin
       ExecutableFile2.Text:= FormMain.EmulatorExecutable[2];
       BackupEmulatorExecutable2:= ExecutableFile2.Text;
     end;

  if FormMain.EmulatorExecutable[3] <> '' then
     begin
       ExecutableFile3.Text:= FormMain.EmulatorExecutable[3];
       BackupEmulatorExecutable3:= ExecutableFile3.Text;
     end;

  if FormMain.EmulatorExecutable[4] <> '' then
     begin
       ExecutableFile4.Text:= FormMain.EmulatorExecutable[4];
       BackupEmulatorExecutable4:= ExecutableFile4.Text;
     end;

  if FormMain.EmulatorExecutable[5] <> '' then
     begin
       ExecutableFile5.Text:= FormMain.EmulatorExecutable[5];
       BackupEmulatorExecutable5:= ExecutableFile5.Text;
     end;

  DefaultGamesListBuilder.Position:= FormMain.MenuCurrentEmulator.Tag;
  DefaultGameSListBuilder.OnChange(Self);
end;

function TFormEmulatorsSetup.VerifyExecutable(ExecutableNumber: ShortInt): Boolean;
var
  ExecutableFileName: String;
  ExeType: String[5];
begin
  Result:=True;
  case ExecutableNumber of
    1: ExecutableFileName:= ExecutableFile.Text;
    2: ExecutableFileName:= ExecutableFile2.Text;
    3: ExecutableFileName:= ExecutableFile3.Text;
    4: ExecutableFileName:= ExecutableFile4.Text;
    5: ExecutableFileName:= ExecutableFile5.Text;
  end;

  if ExecutableFileName <> '' then
     begin
       ExeType:= ExeStrings[FormMain.GetExeType(ExecutableFileName)];
       if ExeType = 'NoFmt' then
          begin
            FormMain.GetMessagesLng('Messages', 'UnknownEmulatorFileFormatMsg', 'Executable %d has an unknown format!',
                                    'Messages', 'SelectValidEmulatorFileMsg', 'Please, select a valid executable (MAME only).');
            GenerateMessage(FormMain.GetLanguageText('Messages', 'UnknownEmulatorFileFormatTitle', 'Unknown Executable Format'),
                            Format(FormMain.MessageText[0]+#13+FormMain.MessageText[1], [ExecutableNumber]), 2);
            Result:= False;
            Exit;
          end
       else
       if (ExeType = 'DOS') and (ExecutableNumber = DefaultGamesListBuilder.Position) then
          begin
            FormMain.GetMessagesLng('Messages', 'ErrorTitle', 'Error',
                           'Messages', 'InvalidBinaryDOSMAMEMsg', 'A DOS MAME binary can''t be used as the default games list binary. Please use a Win32 MAME binary.');
            GenerateMessage(FormMain.MessageText[0], FormMain.MessageText[1], 2);
            Result:= False;
            Exit;
          end
       else
       if ((ExeType = 'DOS') or (ExeType = 'Win32')) then
          begin
            case FormMain.GetEmulatorVersion(ExecutableNumber) of
              True:
                begin
                  if ExeType = 'Win32' then
                     FormMain.CheckMAMEIniFile(ExecutableFileName);
                end;
              False:
                begin
                  FormMain.GetMessagesLng('Messages', 'InvalidEmulatorFileFormatMsg', 'Executable %d is not valid!',
                                          'Messages', 'SelectValidEmulatorFileMsg', 'Please, select a valid executable (MAME only).');
                  GenerateMessage(FormMain.GetLanguageText('Messages', 'InvalidEmulatorFileFormatTitle', 'Invalid Executable File'),
                                  Format(FormMain.MessageText[0]+#13+FormMain.MessageText[1], [ExecutableNumber]), 2);
                  Result:= False;
                  Exit;
                end;
            end;
          end;
     end
  else
     Result:= False;
end;

procedure TFormEmulatorsSetup.ButtonOkClick(Sender: TObject);
begin
  FormMain.MainMenu.Tag:= 0;
  FormMain.ShowingPicture:= True;
  FormMain.EmulatorVersion[1]:= '';
  FormMain.EmulatorVersion[2]:= '';
  FormMain.EmulatorVersion[3]:= '';
  FormMain.EmulatorVersion[4]:= '';
  FormMain.EmulatorVersion[5]:= '';

  if ExecutableFile.Text = '' then
     begin
       FormMain.GetMessagesLng('Messages', 'NoExecutableSelectedTitle', 'MAME Executable Not Selected',
                               'Messages', 'NoExecutableSelectedMsg', 'Select a primary executable first (MAME only)! The others are optional.');
       GenerateMessage(FormMain.MessageText[0], FormMain.MessageText[1], 2);
       Exit;
     end;

  FormMain.EmulatorExecutable[1]:= ExecutableFile.Text;
  case VerifyExecutable(1) of
    True:
      begin
        FormMain.MenuUseExecutable1.Enabled:= True;
        FormMain.ButtonUseExecutable1.Enabled:= True;
        FormMain.MenuSet1stEmulatorDefaultOptions.Enabled:= True;
        FormMain.MenuChange1stEmulatorDescription.Enabled:= True;
        FormMain.MenuGet1stEmulatorDefaultDescription.Enabled:= True;
        BackupEmulatorExecutable:= FormMain.EmulatorExecutable[1];
      end;
    False: Exit;
  end;
  Application.ProcessMessages;

  FormMain.EmulatorExecutable[2]:= ExecutableFile2.Text;
  case VerifyExecutable(2) of
    True:
      begin
        FormMain.MenuUseExecutable2.Enabled:= True;
        FormMain.ButtonUseExecutable2.Enabled:= True;
        FormMain.MenuSet2ndEmulatorDefaultOptions.Enabled:= True;
        FormMain.MenuChange2ndEmulatorDescription.Enabled:= True;
        FormMain.MenuGet2ndEmulatorDefaultDescription.Enabled:= True;
        BackupEmulatorExecutable2:= FormMain.EmulatorExecutable[2];
      end;
    False:
      begin
        FormMain.EmulatorExecutable[2]:= '';
        FormMain.EmulatorVersion[2]:= '';
        FormMain.EmulatorType[2]:= 0;
        FormMain.MenuUseExecutable2.Enabled:= False;
        FormMain.ButtonUseExecutable2.Enabled:= False;
        FormMain.MenuSet2ndEmulatorDefaultOptions.Enabled:= False;
        FormMain.MenuChange2ndEmulatorDescription.Enabled:= False;
        FormMain.MenuGet2ndEmulatorDefaultDescription.Enabled:= False;
        if not FormMain.MenuUseExecutable1.Checked then
           FormMain.MenuUseExecutable1.Click;
      end;
  end;
  Application.ProcessMessages;

  FormMain.EmulatorExecutable[3]:= ExecutableFile3.Text;
  case VerifyExecutable(3) of
    True:
      begin
        FormMain.MenuUseExecutable3.Enabled:= True;
        FormMain.ButtonUseExecutable3.Enabled:= True;
        FormMain.MenuSet3rdEmulatorDefaultOptions.Enabled:= True;
        FormMain.MenuChange3rdEmulatorDescription.Enabled:= True;
        FormMain.MenuGet3rdEmulatorDefaultDescription.Enabled:= True;
        BackupEmulatorExecutable3:= FormMain.EmulatorExecutable[3];
      end;
    False:
      begin
        FormMain.EmulatorExecutable[3]:= '';
        FormMain.EmulatorVersion[3]:= '';
        FormMain.EmulatorType[3]:= 0;
        FormMain.MenuUseExecutable3.Enabled:= False;
        FormMain.ButtonUseExecutable3.Enabled:= False;
        FormMain.MenuSet3rdEmulatorDefaultOptions.Enabled:= False;
        FormMain.MenuChange3rdEmulatorDescription.Enabled:= False;
        FormMain.MenuGet3rdEmulatorDefaultDescription.Enabled:= False;
        if not FormMain.MenuUseExecutable1.Checked then
           FormMain.MenuUseExecutable1.Click;
      end;
  end;
  Application.ProcessMessages;

  FormMain.EmulatorExecutable[4]:= ExecutableFile4.Text;
  case VerifyExecutable(4) of
    True:
      begin
        FormMain.MenuUseExecutable4.Enabled:= True;
        FormMain.ButtonUseExecutable4.Enabled:= True;
        FormMain.MenuSet4thEmulatorDefaultOptions.Enabled:= True;
        FormMain.MenuChange4thEmulatorDescription.Enabled:= True;
        FormMain.MenuGet4thEmulatorDefaultDescription.Enabled:= True;
        BackupEmulatorExecutable4:= FormMain.EmulatorExecutable[4];
      end;
    False:
      begin
        FormMain.EmulatorExecutable[4]:= '';
        FormMain.EmulatorVersion[4]:= '';
        FormMain.EmulatorType[4]:= 0;
        FormMain.MenuUseExecutable4.Enabled:= False;
        FormMain.ButtonUseExecutable4.Enabled:= False;
        FormMain.MenuSet4thEmulatorDefaultOptions.Enabled:= False;
        FormMain.MenuChange4thEmulatorDescription.Enabled:= False;
        FormMain.MenuGet4thEmulatorDefaultDescription.Enabled:= False;
        if not FormMain.MenuUseExecutable1.Checked then
           FormMain.MenuUseExecutable1.Click;
      end;
  end;
  Application.ProcessMessages;

  FormMain.EmulatorExecutable[5]:= ExecutableFile5.Text;
  case VerifyExecutable(5) of
    True:
      begin
        FormMain.MenuUseExecutable5.Enabled:= True;
        FormMain.ButtonUseExecutable5.Enabled:= True;
        FormMain.MenuSet5thEmulatorDefaultOptions.Enabled:= True;
        FormMain.MenuChange5thEmulatorDescription.Enabled:= True;
        FormMain.MenuGet5thEmulatorDefaultDescription.Enabled:= True;
        BackupEmulatorExecutable5:= FormMain.EmulatorExecutable[5];
      end;
    False:
      begin
        FormMain.EmulatorExecutable[5]:= '';
        FormMain.EmulatorVersion[5]:= '';
        FormMain.EmulatorType[5]:= 0;
        FormMain.MenuUseExecutable5.Enabled:= False;
        FormMain.ButtonUseExecutable5.Enabled:= False;
        FormMain.MenuSet5thEmulatorDefaultOptions.Enabled:= False;
        FormMain.MenuChange5thEmulatorDescription.Enabled:= False;
        FormMain.MenuGet5thEmulatorDefaultDescription.Enabled:= False;
        if not FormMain.MenuUseExecutable1.Checked then
           FormMain.MenuUseExecutable1.Click;
      end;
  end;
  Application.ProcessMessages;
  FormMain.MenuCurrentEmulator.Tag:= DefaultGamesListBuilder.Position;
  FormMain.SelectExecutable(FormMain.MenuCurrentEmulator.Tag);
  Close;
end;

procedure TFormEmulatorsSetup.ExecutableFileAfterDialog(
  Sender: TObject; var Name: String; var Action: Boolean);
begin
  ExeChanged:= Action;
  SetCurrentDir(FormMain.FrontendPath);
end;

procedure TFormEmulatorsSetup.ExecutableFile2Change(Sender: TObject);
begin
  ExeChanged:= True;
end;

procedure TFormEmulatorsSetup.ExecutableFile2AfterDialog(
  Sender: TObject; var Name: String; var Action: Boolean);
begin
  ExeChanged:= Action;
  SetCurrentDir(FormMain.FrontendPath);
end;

procedure TFormEmulatorsSetup.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #27 then
     ButtonCancel.OnClick(Self);
end;

procedure TFormEmulatorsSetup.ButtonClearCommandLine1Click(Sender: TObject);
begin
  ExecutableFile.Clear;
end;

procedure TFormEmulatorsSetup.ButtonClearCommandLine2Click(
  Sender: TObject);
begin
  ExecutableFile2.Clear;
end;

procedure TFormEmulatorsSetup.ButtonClearCommandLine3Click(
  Sender: TObject);
begin
  ExecutableFile3.Clear;
end;

procedure TFormEmulatorsSetup.ButtonClearCommandLine4Click(
  Sender: TObject);
begin
  ExecutableFile4.Clear;
end;

procedure TFormEmulatorsSetup.ButtonClearCommandLine5Click(
  Sender: TObject);
begin
  ExecutableFile5.Clear;
end;

procedure TFormEmulatorsSetup.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if (BackupEmulatorExecutable <> ExecutableFile.Text) and
     (ExecutableFile.Text <> '') then
     FormMain.EmulatorExecutable[1]:= BackupEmulatorExecutable;

  if (BackupEmulatorExecutable2 <> ExecutableFile2.Text) and
     (ExecutableFile2.Text <> '') then
     FormMain.EmulatorExecutable[2]:= BackupEmulatorExecutable2;

  if (BackupEmulatorExecutable3 <> ExecutableFile3.Text) and
     (ExecutableFile3.Text <> '') then
     FormMain.EmulatorExecutable[3]:= BackupEmulatorExecutable3;

  if (BackupEmulatorExecutable4 <> ExecutableFile4.Text) and
     (ExecutableFile4.Text <> '') then
     FormMain.EmulatorExecutable[4]:= BackupEmulatorExecutable4;

  if (BackupEmulatorExecutable5 <> ExecutableFile5.Text) and
     (ExecutableFile5.Text <> '') then
     FormMain.EmulatorExecutable[5]:= BackupEmulatorExecutable5;
end;

procedure TFormEmulatorsSetup.ExecutableFile3AfterDialog(
  Sender: TObject; var Name: String; var Action: Boolean);
begin
  ExeChanged:= Action;
  SetCurrentDir(FormMain.FrontendPath);
end;

procedure TFormEmulatorsSetup.ExecutableFile3Change(Sender: TObject);
begin
  ExeChanged:= True;
end;

procedure TFormEmulatorsSetup.ButtonSet2ndEmulatorOptionsClick(
  Sender: TObject);
begin
  FormMain.CallEmulatorOptions(ExecutableFile2.Text);
end;

procedure TFormEmulatorsSetup.ButtonSet3rdEmulatorOptionsClick(
  Sender: TObject);
begin
  FormMain.CallEmulatorOptions(ExecutableFile3.Text);
end;

procedure TFormEmulatorsSetup.ExecutableFile4AfterDialog(Sender: TObject;
  var Name: String; var Action: Boolean);
begin
  ExeChanged:= Action;
  SetCurrentDir(FormMain.FrontendPath);
end;

procedure TFormEmulatorsSetup.ExecutableFile5AfterDialog(Sender: TObject;
  var Name: String; var Action: Boolean);
begin
  ExeChanged:= Action;
  SetCurrentDir(FormMain.FrontendPath);
end;

procedure TFormEmulatorsSetup.ExecutableFile4Change(Sender: TObject);
begin
  ExeChanged:= True;
end;

procedure TFormEmulatorsSetup.ExecutableFile5Change(Sender: TObject);
begin
  ExeChanged:= True;
end;

procedure TFormEmulatorsSetup.ButtonSet4thEmulatorOptionsClick(Sender: TObject);
begin
  FormMain.CallEmulatorOptions(ExecutableFile4.Text);
end;

procedure TFormEmulatorsSetup.ButtonSet5thEmulatorOptionsClick(Sender: TObject);
begin
  FormMain.CallEmulatorOptions(ExecutableFile5.Text);
end;

procedure TFormEmulatorsSetup.ExecutableFileButtonSelectClick(
  Sender: TObject);
begin
  FormMain.DialogOpenFile(0, FormMain.GetLanguageText('Emulators Setup', 'ExecutableFileDialogTitle', 'Select a M.A.M.E. executable'), ExecutableFile);
end;

procedure TFormEmulatorsSetup.ExecutableFile2ButtonSelectClick(Sender: TObject);
begin
  FormMain.DialogOpenFile(0, FormMain.GetLanguageText('Emulators Setup', 'ExecutableFileDialogTitle', 'Select a M.A.M.E. executable'), ExecutableFile2);
end;

procedure TFormEmulatorsSetup.ExecutableFile3ButtonSelectClick(
  Sender: TObject);
begin
  FormMain.DialogOpenFile(0, FormMain.GetLanguageText('Emulators Setup', 'ExecutableFileDialogTitle', 'Select a M.A.M.E. executable'), ExecutableFile3);
end;

procedure TFormEmulatorsSetup.ExecutableFile4ButtonSelectClick(
  Sender: TObject);
begin
  FormMain.DialogOpenFile(0, FormMain.GetLanguageText('Emulators Setup', 'ExecutableFileDialogTitle', 'Select a M.A.M.E. executable'), ExecutableFile4);
end;

procedure TFormEmulatorsSetup.ExecutableFile5ButtonSelectClick(
  Sender: TObject);
begin
  FormMain.DialogOpenFile(0, FormMain.GetLanguageText('Emulators Setup', 'ExecutableFileDialogTitle', 'Select a M.A.M.E. executable'), ExecutableFile5);
end;

procedure TFormEmulatorsSetup.DefaultGamesListBuilderChange(
  Sender: TObject);
begin
  LabelDefaultGamesListBuilderValue.Caption:= Format(DefaultGamesListBuilder.Hint, [DefaultGamesListBuilder.Position]);
  case DefaultGamesListBuilder.Position of
    2:
      begin
        if ExecutableFile2.Text = '' then
           DefaultGamesListBuilder.Position:= 3;
      end;
    3:
      begin
        if ExecutableFile3.Text = '' then
           DefaultGamesListBuilder.Position:= 4;
      end;
    4:
      begin
        if ExecutableFile4.Text = '' then
           DefaultGamesListBuilder.Position:= 5;
      end;
    5:
      begin
        if ExecutableFile5.Text = '' then
           DefaultGamesListBuilder.Position:= 1;
      end;
  end;
end;

end.

