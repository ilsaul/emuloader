unit uCustomCommandLine;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, GR32_Image, StdCtrls, ExtCtrls, ComCtrls;

type
  TFormCustomCommandLine = class(TForm)
    TopImage: TImage;
    LabelCaption: TLabel;
    PageControlCustomCommandLine: TPageControl;
    TabSheetCustomCommandLine: TTabSheet;
    BottomLine: TBevel;
    ButtonOk: TButton;
    ButtonCancel: TButton;
    GameIcon: TImage;
    LabelGameDescription: TLabel;
    LabelCustomCommandLineExecutable: TGroupBox;
    CustomCommandLineExecutable: TEdit;
    CommandLineButtonSelect: TButton;
    ButtonClearCustomCommandLine: TButton;
    LabelCustomCommandLineParamaters: TGroupBox;
    CustomCommandLineParamaters: TEdit;
    procedure ButtonClearCustomCommandLineClick(Sender: TObject);
    procedure ButtonCancelClick(Sender: TObject);
    procedure CommandLineButtonSelectClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ButtonOkClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure CustomCommandLineExecutableChange(Sender: TObject);
    procedure CustomCommandLineParamatersChange(Sender: TObject);
  private
    { Private declarations }
    procedure CheckBlankFields;
  public
    GameName: String[12];
    { Public declarations }
  end;

var
  FormCustomCommandLine: TFormCustomCommandLine;

implementation

uses uMain;

{$R *.dfm}

procedure TFormCustomCommandLine.CheckBlankFields;
begin
  ButtonOk.Enabled:= (CustomCommandLineExecutable.Text <> '') and (CustomCommandLineParamaters.Text <> '');
end;

procedure TFormCustomCommandLine.ButtonClearCustomCommandLineClick(
  Sender: TObject);
begin
  CustomCommandLineExecutable.Clear;
  CustomCommandLineParamaters.Clear;
end;

procedure TFormCustomCommandLine.ButtonCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TFormCustomCommandLine.CommandLineButtonSelectClick(
  Sender: TObject);
begin
  FormMain.DialogOpenFile(2, FormMain.GetLanguageText('Custom Games', 'CommandLineDialogTitle', 'Select a file for the command line'), CustomCommandLineExecutable);
  if CustomCommandLineExecutable.Text <> '' then
     begin
       if Pos(' ', CustomCommandLineExecutable.Text) <> 0 then
          CustomCommandLineExecutable.Text:= Format('"%s"', [CustomCommandLineExecutable.Text]);
     end;
  SetCurrentDir(FormMain.FrontendPath);
end;

procedure TFormCustomCommandLine.FormShow(Sender: TObject);
begin
  FormMain.UpdateGeneralAppearance(FormCustomCommandLine);
  FormMain.SetCustomCommandLineLanguage;
  case FormMain.MenuRealIcons.Checked of
    True : FormMain.BigRealIconsImageList.GetIcon(FormMain.GamesList[FormMain.SelectedGame].eImageIndex, GameIcon.Picture.Icon);
    False: FormMain.BuiltInBigListImageList.GetIcon(FormMain.GamesList[FormMain.SelectedGame].eImageIndex, GameIcon.Picture.Icon);
  end;
  case GameIcon.Tag of
    0: TabSheetCustomCommandLine.Caption:= Format('%s: %s', [FormMain.List.Column[14].Caption, GameName]);
    1: TabSheetCustomCommandLine.Caption:= Format('%s: %s', [FormMain.List.Column[18].Caption, GameName]);
  end;
  
  LabelGameDescription.Caption:= FormMain.GamesList[FormMain.SelectedGame].eDescription;
  FormMain.ReadMAMECustomCommandLine(GameName, GameIcon.Tag);
  CheckBlankFields;
end;

procedure TFormCustomCommandLine.ButtonOkClick(Sender: TObject);
begin
  FormMain.UpdateMAMECustomCommandLine(GameName, CustomCommandLineExecutable.Text, CustomCommandLineParamaters.Text, GameIcon.Tag);
  Close;
end;

procedure TFormCustomCommandLine.FormCreate(Sender: TObject);
begin
  if FileExists(FormMain.FrontendPath+'resources\images\topwindow\CustomCommandLine.png') then
     TopImage.Picture.LoadFromFile(FormMain.FrontendPath+'resources\images\topwindow\CustomCommandLine.png');
end;

procedure TFormCustomCommandLine.CustomCommandLineExecutableChange(
  Sender: TObject);
begin
  CheckBlankFields;
end;

procedure TFormCustomCommandLine.CustomCommandLineParamatersChange(
  Sender: TObject);
begin
  CheckBlankFields;
end;

end.
