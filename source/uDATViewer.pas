unit uDATViewer;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  ExtCtrls, StdCtrls, ShellApi, ComCtrls, RichEdit;

type
  TFormDATViewer = class(TForm)
    LabelGameDescription: TLabel;
    TopImage: TImage;
    WordWrap: TCheckBox;
    DATTextHolder: TRichEdit;
    ButtonClose: TButton;
    ButtonDATFilesFont: TButton;
    ButtonTextFilesDefaultFont: TButton;
    BottomLine: TBevel;
    procedure ButtonCloseClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure WordWrapClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ButtonDATFilesFontClick(Sender: TObject);
    procedure ButtonTextFilesDefaultFontClick(Sender: TObject);
  private
    procedure GotoTop;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormDATViewer: TFormDATViewer;

implementation

uses uMain;

{$R *.DFM}

procedure TFormDATViewer.ButtonCloseClick(Sender: TObject);
begin
  FormMain.UpdateTextViewerFont(0);
  Close;
end;

procedure TFormDATViewer.GotoTop;
var
 ScrollMessage:TWMVScroll;
begin
  ScrollMessage.Msg:=WM_VScroll;
  ScrollMessage.ScrollCode:=Sb_Top;
  //ScrollMessage.Pos:=0;
  DATTextHolder.Dispatch(ScrollMessage);
end;

procedure TFormDATViewer.FormActivate(Sender: TObject);
begin
  GotoTop;
end;

procedure TFormDATViewer.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if ((Key = #27) or (Key = #13)) then
     ButtonClose.OnClick(Self);
end;

procedure TFormDATViewer.WordWrapClick(Sender: TObject);
begin
  DATTextHolder.WordWrap:=WordWrap.Checked;
end;

procedure TFormDATViewer.FormCreate(Sender: TObject);
begin
  DATTextHolder.Color:= FormMain.MAMEInfoTextHolder.Color;
  if FileExists(FormMain.FrontendPath+'resources\images\topwindow\FileViewer.png') then
     TopImage.Picture.LoadFromFile(FormMain.FrontendPath+'resources\images\topwindow\FileViewer.png');
end;

procedure TFormDATViewer.FormShow(Sender: TObject);
begin
  FormMain.UpdateGeneralAppearance(FormDATViewer);
  FormMain.SetDATViewerLanguage;
  FormMain.ReadTextViewerFont(0);
end;

procedure TFormDATViewer.ButtonDATFilesFontClick(Sender: TObject);
begin
  FormMain.FontDialog.Font:= DATTextHolder.Font;
  if FormMain.FontDialog.Execute then
     DATTextHolder.Font:= FormMain.FontDialog.Font;
end;

procedure TFormDATViewer.ButtonTextFilesDefaultFontClick(Sender: TObject);
begin
  DATTextHolder.Font.Color:= 0;
  DATTextHolder.Font.Name:= 'Courier New';
  DATTextHolder.Font.Size:= 8;
  DATTextHolder.Font.Style:= [];
end;

end.
