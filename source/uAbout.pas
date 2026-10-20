unit uAbout;

interface

uses
  Windows, SysUtils, Classes, Graphics, Controls, Forms, ExtCtrls,
  StdCtrls, GraphicEx, Messages, GR32_Image, ShadowLabel;

type
  TFormAbout = class(TForm)
    ImageAbout: TImage32;
    procedure FormCreate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure ImageAboutClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormAbout: TFormAbout;

implementation

uses uMain, uCommon;

{$R *.DFM}

procedure TFormAbout.FormCreate(Sender: TObject);
{$IF CompilerVersion >= 20}
var
  VersionPanel: TPanel;
{$IFEND}
begin
  if FileExists(FormMain.GetFolderFull(35)+'about.png') then
     ImageAbout.Bitmap.LoadFromFile(FormMain.GetFolderFull(35)+'about.png');
  {$IF CompilerVersion >= 20}
  VersionPanel:= TPanel.Create(Self);
  VersionPanel.Parent:= Self;
  VersionPanel.Height:= MulDiv(32, PixelsPerInch, 96);
  ClientHeight:= ClientHeight+VersionPanel.Height;
  VersionPanel.Align:= alBottom;
  VersionPanel.BevelOuter:= bvNone;
  VersionPanel.Color:= clBlack;
  VersionPanel.ParentBackground:= False;
  VersionPanel.Font.Color:= clWhite;
  VersionPanel.Caption:= 'Emu Loader '+FrontendVersionCaption;
  VersionPanel.OnClick:= ImageAboutClick;
  {$IFEND}
end;

procedure TFormAbout.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key in [#27, #13] then
     Close;
end;

procedure TFormAbout.ImageAboutClick(Sender: TObject);
begin
  Close;
end;

end.

