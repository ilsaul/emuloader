unit uLanguage;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ComCtrls, IniFiles, GR32_Image, GR32,
  uGR32Extra;

type
  TFormLanguage = class(TForm)
    ButtonCancel: TButton;
    ButtonOk: TButton;
    PageControlLanguage: TPageControl;
    TabSheetLanguage: TTabSheet;
    SelectLanguage: TComboBox;
    LanguageInfoBox: TGroupBox;
    LabelAuthor: TLabel;
    Author: TEdit;
    LabelEMail: TLabel;
    EMail: TEdit;
    LabelVersion: TLabel;
    FrontendVersionString: TEdit;
    BottomLine: TBevel;
    TopImage: TImage;
    LabelCaption: TLabel;
    LanguageIcon: TImage32Ex;
    procedure ButtonOkClick(Sender: TObject);
    procedure ButtonCancelClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SelectLanguageChange(Sender: TObject);
  private
    { Private declarations }
    procedure AddLanguageFiles(Folder: String; Destination: TComboBox);
  public
    { Public declarations }
  end;

var
  FormLanguage: TFormLanguage;

implementation

uses uMain, uCommon;

{$R *.dfm}

procedure TFormLanguage.AddLanguageFiles(Folder: String; Destination: TComboBox);
var
  SearchRecord: TSearchRec;
  _l : Longint;
  FileIndex: Integer;
  FileName: String;
begin
  _l:=Length(Folder);
  if (_l=0) then Exit;

  // rewrite path
  if (Folder[_l] <> ':') and (Folder[_l] <> '\') then
     Folder:= Folder+'\';

  // Add files.
  FileIndex:= FindFirst(Folder + '*.lng', $37, SearchRecord);
  while (FileIndex = 0) do
    begin
      FileName:= SearchRecord.Name;
      Delete(FileName, Length(FileName)-3, 4);
      if LowerCase(FileName) <> 'english' then
         Destination.Items.Add(FileName);
      FileIndex:= FindNext(SearchRecord);
    end;
  FindClose(SearchRecord);
end;

procedure TFormLanguage.ButtonOkClick(Sender: TObject);
begin
  FormMain.ToolBarsPanel.Tag:= 1;
  if SelectLanguage.Text = 'English (Default)' then
     FormMain.FrontendLanguage:= 'English'
  else
     FormMain.FrontendLanguage:= SelectLanguage.Text;
  FormMain.SetMainLanguage;
  FormMain.SetPreferencesLanguage;
  FormMain.UpdateLabelPictures;
  Close;
end;

procedure TFormLanguage.ButtonCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TFormLanguage.FormCreate(Sender: TObject);
begin
  if FileExists(FormMain.FrontendPath+'resources\images\topwindow\Language.png') then
     TopImage.Picture.LoadFromFile(FormMain.FrontendPath+'resources\images\topwindow\Language.png');

  SelectLanguage.Sorted:= True;
  AddLanguageFiles(FormMain.FrontendPath+'resources\language', SelectLanguage);
  SelectLanguage.Sorted:= False;
  SelectLanguage.Items.Insert(0, 'English (Default)');
  if FormMain.FrontendLanguage = 'English' then
     SelectLanguage.ItemIndex:= 0
  else
     SelectLanguage.ItemIndex:= SelectLanguage.Items.IndexOf(FormMain.FrontendLanguage);
  SelectLanguage.OnChange(Self);
end;

procedure TFormLanguage.SelectLanguageChange(Sender: TObject);
var
  LngFile: TMemIniFile;
  LanguageIconFileName: String;
begin
  if SelectLanguage.ItemIndex = 0 then
     begin
       Author.Text:= 'Ciro Alfredo Consentino';
       EMail.Text:= 'emuloader@mameworld.net';
       FrontendVersionString.Text:= FrontendVersion;
       LanguageIconFileName:= 'English.png';
     end
  else
     begin
       LngFile:= TMemIniFile.Create(FormMain.FrontendPath+'resources\language\'+SelectLanguage.Text+'.lng');
       Author.Text:= LngFile.ReadString('Version Information', 'Author', '');
       EMail.Text:= LngFile.ReadString('Version Information', 'E-Mail', '');
       FrontendVersionString.Text:= LngFile.ReadString('Version Information', 'FrontendVersion', '');
       LanguageIconFileName:= LngFile.ReadString('Version Information', 'Icon', SelectLanguage.Text);
     end;
  FreeAndNil(LngFile);
  case FileExists(FormMain.FrontendPath+'resources\language\'+LanguageIconFileName) of
    True : LanguageIcon.Bitmap.LoadFromFile(FormMain.FrontendPath+'resources\language\'+LanguageIconFileName);
    False: LanguageIcon.Bitmap:= nil;
  end;
end;

end.
