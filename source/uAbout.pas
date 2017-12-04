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

uses uMain;

{$R *.DFM}

procedure TFormAbout.FormCreate(Sender: TObject);
begin
  if FileExists(FormMain.GetFolderFull(35)+'about.png') then
     ImageAbout.Bitmap.LoadFromFile(FormMain.GetFolderFull(35)+'about.png');
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


