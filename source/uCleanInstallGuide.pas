unit uCleanInstallGuide;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  StdCtrls, ShadowLabel, Buttons, AdvOfficeButtons, ShellAPI, uCommon,
  ButtonsEx, ExtCtrls, GraphicEx, GR32_Image;

type
  TFormCleanInstallGuide = class(TForm)
    ImageCleanInstall: TImage32;
    LabelQuickSetupGuide: TShadowLabel;
    LabelOption_SelectArcadeEmulators_FileStatus: TShadowLabel;
    LabelOption_SelectConsoleComputerGamesFolders_FileStatus: TShadowLabel;
    Option_SelectArcadeEmulators: TAdvOfficeCheckBoxEx;
    Option_CreateArcadeGamesList: TAdvOfficeCheckBoxEx;
    Option_SelectConsoleComputerEmulators: TAdvOfficeCheckBoxEx;
    Option_SelectConsoleComputerGamesFolders: TAdvOfficeCheckBoxEx;
    Option_CreateConsoleComputerGamesList: TAdvOfficeCheckBoxEx;
    NightMode: TAdvOfficeCheckBoxEx;
    UseAlternateFrontendIcons: TAdvOfficeCheckBoxEx;
    ButtonSkip: TBitBtnEx;
    ButtonOk: TBitBtnEx;
    ButtonCancel: TBitBtnEx;
    procedure LabelQuickSetupGuideMouseEnter(Sender: TObject);
    procedure LabelQuickSetupGuideMouseLeave(Sender: TObject);
    procedure LabelQuickSetupGuideClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure NightModeClick(Sender: TObject);
    procedure ButtonCancelClick(Sender: TObject);
  private
    { Private declarations }
    IsNightMode_Restore: Boolean;
  public
    { Public declarations }
  end;

var
  FormCleanInstallGuide: TFormCleanInstallGuide;

implementation

uses uMain;

{$R *.dfm}

procedure TFormCleanInstallGuide.FormCreate(Sender: TObject);
begin
  IsNightMode_Restore:= IsNightMode;
  NightMode.Checked:= IsNightMode;
  UseAlternateFrontendIcons.Checked:= FormMain.MenuUseAlternateFrontendIcons.Checked;
  FormMain.SetButtonExColors(ButtonOk);
  FormMain.SetButtonExColors(ButtonCancel);
  FormMain.SetButtonExColors(ButtonSkip);
  FormMain.SetCheckBoxExCustomIcon(Option_SelectArcadeEmulators);
  FormMain.SetCheckBoxExCustomIcon(Option_CreateArcadeGamesList);
  FormMain.SetCheckBoxExCustomIcon(Option_SelectConsoleComputerEmulators);
  FormMain.SetCheckBoxExCustomIcon(Option_SelectConsoleComputerGamesFolders);
  FormMain.SetCheckBoxExCustomIcon(Option_CreateConsoleComputerGamesList);
  FormMain.SetCheckBoxExCustomIcon(NightMode);
  FormMain.SetCheckBoxExCustomIcon(UseAlternateFrontendIcons);

  if FileExists(FormMain.GetFolderFull(35)+'clean_install.png') then
     ImageCleanInstall.Bitmap.LoadFromFile(FormMain.GetFolderFull(35)+'clean_install.png');
end;

procedure TFormCleanInstallGuide.LabelQuickSetupGuideMouseEnter(Sender: TObject);
begin
  TShadowLabel(Sender).Font.Color:= clLime;
  TShadowLabel(Sender).ShadowColor:= clGreen;
  TShadowLabel(Sender).Font.Style:= [fsUnderline];
end;

procedure TFormCleanInstallGuide.LabelQuickSetupGuideMouseLeave(Sender: TObject);
begin
  TShadowLabel(Sender).Font.Color:= $00c2ffc2;
  TShadowLabel(Sender).ShadowColor:= $00003d00;
  TShadowLabel(Sender).Font.Style:= [];
end;

procedure TFormCleanInstallGuide.LabelQuickSetupGuideClick(Sender: TObject);
begin
  case FileExists(FormMain.FrontendPath+'docs\el-quick-setup-quide.txt') of
    True : CallShellExecute(nil, FormMain.FrontendPath+'docs\el-quick-setup-quide.txt'); // ShellExecute(Handle, 'open', PChar(FormMain.FrontendPath+'docs\el-quick-setup-quide.txt'), nil, nil, SW_SHOWNORMAL);
    False: GenerateMessage('Error', 'File access error.',
                                    'File "'+FormMain.FrontendPath+'docs\el-quick-setup-quide.txt " was not found. ', 2, False, 1);
  end;
end;

procedure TFormCleanInstallGuide.NightModeClick(Sender: TObject);
begin
  IsNightMode:= NightMode.Checked;
  FormMain.SetButtonExColors(ButtonOk);
  FormMain.SetButtonExColors(ButtonCancel);
  FormMain.SetButtonExColors(ButtonSkip);
  FormMain.SetCheckBoxExCustomIcon(Option_SelectArcadeEmulators);
  FormMain.SetCheckBoxExCustomIcon(Option_CreateArcadeGamesList);
  FormMain.SetCheckBoxExCustomIcon(Option_SelectConsoleComputerEmulators);
  FormMain.SetCheckBoxExCustomIcon(Option_SelectConsoleComputerGamesFolders);
  FormMain.SetCheckBoxExCustomIcon(Option_CreateConsoleComputerGamesList);
  FormMain.SetCheckBoxExCustomIcon(NightMode);
  FormMain.SetCheckBoxExCustomIcon(UseAlternateFrontendIcons);

  Option_SelectArcadeEmulators.CustomIconsEnabled:= IsNightMode;
  Option_CreateArcadeGamesList.CustomIconsEnabled:= IsNightMode;
  Option_SelectConsoleComputerEmulators.CustomIconsEnabled:= IsNightMode;
  Option_SelectConsoleComputerGamesFolders.CustomIconsEnabled:= IsNightMode;
  Option_CreateConsoleComputerGamesList.CustomIconsEnabled:= IsNightMode;
  NightMode.CustomIconsEnabled:= IsNightMode;
  UseAlternateFrontendIcons.CustomIconsEnabled:= IsNightMode;
end;

procedure TFormCleanInstallGuide.ButtonCancelClick(Sender: TObject);
begin
  IsNightMode:= IsNightMode_Restore;
end;


end.
