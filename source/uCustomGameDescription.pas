unit uCustomGameDescription;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ComCtrls;

type
  TFormCustomGameDescription = class(TForm)
    PageControlCustomCommandLine: TPageControl;
    TabSheetCustomCommandLine: TTabSheet;
    ButtonOk: TButton;
    ButtonCancel: TButton;
    GameIcon: TImage;
    LabelGameDescription: TLabel;
    ButtonClearNewDescription: TButton;
    LabelNewDescription: TGroupBox;
    NewDescription: TEdit;
    ButtonOriginalDescription: TButton;
    procedure ButtonClearNewDescriptionClick(Sender: TObject);
    procedure ButtonCancelClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ButtonOkClick(Sender: TObject);
    procedure NewDescriptionChange(Sender: TObject);
    procedure NewDescriptionDblClick(Sender: TObject);
    procedure ButtonOriginalDescriptionClick(Sender: TObject);
  private
    { Private declarations }
    procedure CheckBlankFields;
  public
    GameName: String[12];
    OriginalDescription: String;
    { Public declarations }
  end;

var
  FormCustomGameDescription: TFormCustomGameDescription;

implementation

uses uMain;

{$R *.dfm}

procedure TFormCustomGameDescription.CheckBlankFields;
begin
  ButtonOk.Enabled:= (NewDescription.Text <> '') and (NewDescription.Text <> OriginalDescription);
  ButtonOriginalDescription.Enabled:= not (OriginalDescription = '');
end;

procedure TFormCustomGameDescription.ButtonClearNewDescriptionClick(
  Sender: TObject);
begin
  NewDescription.Clear;
end;

procedure TFormCustomGameDescription.ButtonCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TFormCustomGameDescription.FormShow(Sender: TObject);
begin
  FormMain.UpdateGeneralAppearance(FormCustomGameDescription);
  FormMain.SetCustomGameDescriptionLanguage;
  case FormMain.MenuGamesIcons.Checked of
    True : FormMain.BigGamesIconsImageList.GetIcon(FormMain.GamesList[FormMain.SelectedGame].eImageIndex, GameIcon.Picture.Icon);
    False: FormMain.BuiltInBigListImageList.GetIcon(FormMain.GamesList[FormMain.SelectedGame].eImageIndex, GameIcon.Picture.Icon);
  end;
  TabSheetCustomCommandLine.Caption:= Format('%s: %s', [FormMain.List.Column[FormMain.GetColumnIndex(14)].Caption, GameName]);
  LabelGameDescription.Caption:= FormMain.GamesList[FormMain.SelectedGame].eDescription;
  NewDescription.Text:= FormMain.ReadCustomGameDescription(GameName, OriginalDescription);
  if NewDescription.Text = '' then
     NewDescription.Text:= LabelGameDescription.Caption;
  CheckBlankFields;
end;

procedure TFormCustomGameDescription.ButtonOkClick(Sender: TObject);
begin
  if OriginalDescription = '' then
     OriginalDescription:= LabelGameDescription.Caption;
  if FormMain.UpdateCustomGameDescription(GameName, NewDescription.Text, OriginalDescription) then
     begin
       FormMain.List.Items.BeginUpdate;
       FormMain.GamesList[FormMain.SelectedGame].eDescription:= NewDescription.Text;
       FormMain.List.Items.EndUpdate;
       FormMain.List.Invalidate;
     end;
  Close;
end;

procedure TFormCustomGameDescription.NewDescriptionChange(
  Sender: TObject);
begin
  CheckBlankFields;
end;

procedure TFormCustomGameDescription.NewDescriptionDblClick(
  Sender: TObject);
begin
  NewDescription.Text:= LabelGameDescription.Caption;
end;

procedure TFormCustomGameDescription.ButtonOriginalDescriptionClick(
  Sender: TObject);
begin
  NewDescription.Text:= OriginalDescription;
end;

end.
