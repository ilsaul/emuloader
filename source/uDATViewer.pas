unit uDATViewer;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  ExtCtrls, StdCtrls, ComCtrls, OleCtrls;

type
  TFormDATViewer = class(TForm)
    LabelGameDescription: TLabel;
    ButtonClose: TButton;
    GameIcon: TImage;
    DATTextHolder: TRichEdit;
    procedure ButtonCloseClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure FormActivate(Sender: TObject);
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

procedure TFormDATViewer.GotoTop;
var
  ScrollMessage:TWMVScroll;
begin
  ScrollMessage.Msg:= WM_VScroll;
  ScrollMessage.ScrollCode:= Sb_Top;
  //ScrollMessage.Pos:=0;
  DATTextHolder.Dispatch(ScrollMessage);
end;

procedure TFormDATViewer.ButtonCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TFormDATViewer.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if ((Key = #27) or (Key = #13)) then
     ButtonClose.OnClick(Self);
end;

procedure TFormDATViewer.FormShow(Sender: TObject);
var
  Flags: OLEVariant;

begin
  FormMain.UpdateGeneralAppearance(FormDATViewer);
  FormMain.SetDATViewerLanguage;
  case FormMain.MenuGamesIcons.Checked of
    True : FormMain.SmallGamesIconsImageList.GetIcon(FormMain.GamesList[FormMain.SelectedGame].eImageIndex, GameIcon.Picture.Icon);
    False: FormMain.BuiltInSmallListImageList.GetIcon(FormMain.GamesList[FormMain.SelectedGame].eImageIndex, GameIcon.Picture.Icon);
  end;
end;

procedure TFormDATViewer.FormActivate(Sender: TObject);
begin
  GotoTop;
end;

end.
