unit uImageLayoutDimensions;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  StdCtrls, uCommon, ExtCtrls, IniFiles, ShadowLabel, PanelEx,
  GraphicEx, GR32_Image;

type
  TFormImageLayoutDimensions = class(TForm)
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
    LabelImage4: TShadowLabel;
    LabelImage4Dimensions: TShadowLabel;
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
  FormImageLayoutDimensions: TFormImageLayoutDimensions;

implementation

{$R *.dfm}

uses uMain;

procedure TFormImageLayoutDimensions.ReadSettings;
var
  strFile: TMemIniFile;
begin
  try
    strFile:= TMemIniFile.Create(FormMain.FrontendPath+'el_extras.ini');
    FormImageLayoutDimensions.Left:= strFile.ReadInteger('Layout Dimensions', 'ScreenLeft', (Screen.Width shr 1)-(Width shr 1)-1);
    FormImageLayoutDimensions.Top:= strFile.ReadInteger('Layout Dimensions', 'ScreenTop', (Screen.Height shr 1)-(Height shr 1)-1);
  finally
    FreeAndNil(strFile);
  end;
end;

procedure TFormImageLayoutDimensions.SaveSettings;
var
  strFile: TMemIniFile;
begin
  try
    strFile:= TMemIniFile.Create(FormMain.FrontendPath+'el_extras.ini');
    strFile.WriteInteger('Layout Dimensions', 'ScreenLeft', FormImageLayoutDimensions.Left);
    strFile.WriteInteger('Layout Dimensions', 'ScreenTop', FormImageLayoutDimensions.Top);
  finally
    strFile.UpdateFile;
    FreeAndNil(strFile);
  end;
end;

procedure TFormImageLayoutDimensions.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  SaveSettings;
  FormMain.PopupImageShowLayoutDimensions.Checked:= False;
  FormImageLayoutDimensions.Release;
  FormImageLayoutDimensions:= nil;
end;

procedure TFormImageLayoutDimensions.FormShow(Sender: TObject);
begin
  if Tag = 0 then
     begin
       ReadSettings;
       Tag:= 1;
     end;
end;

end.
