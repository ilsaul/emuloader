unit uImageLayoutDimensions;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  StdCtrls, uCommon, ExtCtrls, IniFiles, ShadowLabel, PanelEx,
  GraphicEx, GR32_Image;

type
  TFormImageLayoutDimensions = class(TForm)
    ImageScrLayout: TImage32;
    LabelLayoutTitle: TShadowLabel;
    LabelImagesPanel: TShadowLabel;
    LabelImagesPanelDimensions: TShadowLabel;
    LabelImage1Dimensions: TShadowLabel;
    LabelImage2Dimensions: TShadowLabel;
    LabelImage3Dimensions: TShadowLabel;
    LabelImage4Dimensions: TShadowLabel;
    LabelImage4: TShadowLabel;
    LabelImage3: TShadowLabel;
    LabelImage2: TShadowLabel;
    LabelImage1: TShadowLabel;
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    procedure ReadSettings;
    procedure SaveSettings;
    procedure Resize4K;
  public
    { Public declarations }

  end;

var
  FormImageLayoutDimensions: TFormImageLayoutDimensions;

implementation

{$R *.dfm}

uses uMain;

procedure TFormImageLayoutDimensions.Resize4K;
begin
  if not Is4KMode then
     Exit;

  with FormImageLayoutDimensions do
  begin
    ClientWidth:= 550;
    ClientHeight:= 655;
    FormMain.Set4KImageSpecs(ImageScrLayout, 530, 330, 10, 10);
    FormMain.Set4KLabelSpecs(LabelLayoutTitle, 125, 351, 300, 30, 18);
    FormMain.Set4KLabelSpecs(LabelImagesPanel, 104, 400, 146, 33, 18);
    FormMain.Set4KLabelSpecs(LabelImagesPanelDimensions, 263, LabelImagesPanel.Top, 183, 33, 18);
    FormMain.Set4KLabelSpecs(LabelImage1, 129, 452, -1, -1, 18);
    FormMain.Set4KLabelSpecs(LabelImage2, 129, 496, -1, -1, 18);
    FormMain.Set4KLabelSpecs(LabelImage3, 129, 540, -1, -1, 18);
    FormMain.Set4KLabelSpecs(LabelImage4, 129, 584, -1, -1, 18);

    FormMain.Set4KLabelSpecs(LabelImage1Dimensions, 234, 452, 116, 33, 18);
    FormMain.Set4KLabelSpecs(LabelImage2Dimensions, 234, 496, 116, 33, 18);
    FormMain.Set4KLabelSpecs(LabelImage3Dimensions, 234, 540, 116, 33, 18);
    FormMain.Set4KLabelSpecs(LabelImage4Dimensions, 234, 584, 116, 33, 18);
  end;  
end;

procedure TFormImageLayoutDimensions.ReadSettings;
var
  strFile: TMemIniFile;
begin
  try
    strFile:= TMemIniFile.Create(FormMain.GetFrontendExtraIniFile);
    FormImageLayoutDimensions.Left:= strFile.ReadInteger('Layout Dimensions', 'ScreenLeft', (Screen.Width shr 1)- (Width shr 1) -1);
    FormImageLayoutDimensions.Top:=  strFile.ReadInteger('Layout Dimensions', 'ScreenTop',  (Screen.Height shr 1)-(Height shr 1)-1);
  finally
    FreeAndNil(strFile);
  end;
end;

procedure TFormImageLayoutDimensions.SaveSettings;
var
  strFile: TMemIniFile;
begin
  try
    strFile:= TMemIniFile.Create(FormMain.GetFrontendExtraIniFile);
    strFile.WriteInteger('Layout Dimensions', 'ScreenLeft', FormImageLayoutDimensions.Left);
    strFile.WriteInteger('Layout Dimensions', 'ScreenTop',  FormImageLayoutDimensions.Top);
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
       Resize4K;
       ReadSettings;
       Tag:= 1;
     end;
end;

end.
