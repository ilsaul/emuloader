unit uCleanInstallGuide;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  StdCtrls, ShadowLabel, PanelEx, Buttons, AdvOfficeButtons, ShellAPI, uCommon;

type
  TFormCleanInstallGuide = class(TForm)
    PanelEx1: TPanelEx;
    PanelEx2: TPanelEx;
    ShadowLabel1: TShadowLabel;
    ShadowLabel2: TShadowLabel;
    PanelButtons: TPanelEx;
    ButtonOk: TBitBtn;
    ButtonCancel: TBitBtn;
    PanelEx4: TPanelEx;
    PanelEx5: TPanelEx;
    ShadowLabel5: TShadowLabel;
    ShadowLabel6: TShadowLabel;
    LabelOption_SelectArcadeEmulators_FileStatus: TShadowLabel;
    LabelOption_SelectConsoleComputerGamesFolders_FileStatus: TShadowLabel;
    ShadowLabel4: TShadowLabel;
    Option_SelectArcadeEmulators: TAdvOfficeCheckBox;
    Option_CreateArcadeGamesList: TAdvOfficeCheckBox;
    Option_SelectConsoleComputerEmulators: TAdvOfficeCheckBox;
    Option_SelectConsoleComputerGamesFolders: TAdvOfficeCheckBox;
    Option_CreateConsoleComputerGamesList: TAdvOfficeCheckBox;
    LabelSelectOptions: TShadowLabel;
    ShadowLabel3: TShadowLabel;
    procedure ShadowLabel4MouseEnter(Sender: TObject);
    procedure ShadowLabel4MouseLeave(Sender: TObject);
    procedure ShadowLabel4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormCleanInstallGuide: TFormCleanInstallGuide;

implementation

uses uMain;

{$R *.dfm}

procedure TFormCleanInstallGuide.ShadowLabel4MouseEnter(Sender: TObject);
begin
  TShadowLabel(Sender).Font.Color:= clLime;
  TShadowLabel(Sender).ShadowColor:= clGreen;
  TShadowLabel(Sender).Font.Style:= [fsUnderline];
end;

procedure TFormCleanInstallGuide.ShadowLabel4MouseLeave(Sender: TObject);
begin
  TShadowLabel(Sender).Font.Color:= $00c2ffc2;
  TShadowLabel(Sender).ShadowColor:= $00003d00;
  TShadowLabel(Sender).Font.Style:= [];
end;

procedure TFormCleanInstallGuide.ShadowLabel4Click(Sender: TObject);
begin
  case FileExists(FormMain.FrontendPath+'docs\el-quick-setup-quide.txt') of
    True : CallShellExecute(nil, FormMain.FrontendPath+'docs\el-quick-setup-quide.txt'); // ShellExecute(Handle, 'open', PChar(FormMain.FrontendPath+'docs\el-quick-setup-quide.txt'), nil, nil, SW_SHOWNORMAL);
    False: GenerateMessage('Error', 'File access error.',
                                    'File "'+FormMain.FrontendPath+'docs\el-quick-setup-quide.txt " was not found. ', 2, False, 1);
  end;
end;


end.
