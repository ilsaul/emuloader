unit uAbout;

interface

uses
  Windows, SysUtils, Classes, Graphics, Controls, Forms, TextFade, ExtCtrls,
  StdCtrls, jpeg;

type
  TFormAbout = class(TForm)
    ImageLogo: TImage;
    LabelFrontendVersion: TLabel;
    ButtonClose: TButton;
    TextFader: TTextFader;
    procedure FormCreate(Sender: TObject);
    procedure ButtonCloseClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormAbout: TFormAbout;

implementation

uses uCommon, uMain;

{$R *.DFM}

procedure TFormAbout.FormCreate(Sender: TObject);
begin
  if FileExists(FormMain.FrontendPath+'resources\images\logo\About.jpg') then
     ImageLogo.Picture.LoadFromFile(FormMain.FrontendPath+'resources\images\logo\About.jpg');

  LabelFrontendVersion.Caption:='v'+FrontendVersion;
  TextFader.Active:= True;
end;

procedure TFormAbout.ButtonCloseClick(Sender: TObject);
begin
  TextFader.Active:= False;
  Close;
end;

procedure TFormAbout.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if ((Key = #27) or (Key = #13)) then
     ButtonClose.OnClick(Self);
end;

procedure TFormAbout.FormShow(Sender: TObject);
begin
  FormMain.UpdateGeneralAppearance(FormAbout);
end;

end.


