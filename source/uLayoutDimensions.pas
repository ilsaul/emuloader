unit uLayoutDimensions;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  StdCtrls, uCommon, ExtCtrls, IniFiles, ShadowLabel, PanelEx,
  GraphicEx, GR32_Image;

type
  TFormLayoutDimensions = class(TForm)
    PanelEx2: TPanelEx;
    LabelImagesPanel: TShadowLabel;
    LabelImagesPanelDimensions: TShadowLabel;
    LabelImage1: TShadowLabel;
    LabelImage1Dimensions: TShadowLabel;
    LabelImage2Dimensions: TShadowLabel;
    LabelImage2: TShadowLabel;
    LabelImage3: TShadowLabel;
    LabelImage3Dimensions: TShadowLabel;
    ImageScrLayout: TImage32;
    LabelLayoutTitle: TShadowLabel;
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    procedure ReadSettings;
    procedure SaveSettings;
  public
    { Public declarations }

  end;

var
  FormLayoutDimensions: TFormLayoutDimensions;

implementation

{$R *.dfm}

uses uMain;

procedure TFormLayoutDimensions.ReadSettings;
var
  strFile: TMemIniFile;
begin
  try
    strFile:= TMemIniFile.Create(FormMain.FrontendPath+'el_extras.ini');
    FormLayoutDimensions.Left:= strFile.ReadInteger('Layout Dimensions', 'ScreenLeft', (Screen.Width shr 1)-(Width shr 1)-1);
    FormLayoutDimensions.Top:= strFile.ReadInteger('Layout Dimensions', 'ScreenTop', (Screen.Height shr 1)-(Height shr 1)-1);
  finally
    FreeAndNil(strFile);
  end;
end;

procedure TFormLayoutDimensions.SaveSettings;
var
  strFile: TMemIniFile;
begin
  try
    strFile:= TMemIniFile.Create(FormMain.FrontendPath+'el_extras.ini');
    strFile.WriteInteger('Layout Dimensions', 'ScreenLeft', FormLayoutDimensions.Left);
    strFile.WriteInteger('Layout Dimensions', 'ScreenTop', FormLayoutDimensions.Top);
  finally
    strFile.UpdateFile;
    FreeAndNil(strFile);
  end;
end;

procedure TFormLayoutDimensions.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  SaveSettings;
  FormMain.PopupImageShowLayoutDimensions.Checked:= False;
  FormLayoutDimensions.Release;
  FormLayoutDimensions:= nil;
end;

procedure TFormLayoutDimensions.FormShow(Sender: TObject);
begin
  if Tag = 0 then
     begin
       ReadSettings;
       Tag:= 1;
     end;
end;

end.
