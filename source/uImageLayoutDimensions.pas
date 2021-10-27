unit uImageLayoutDimensions;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  StdCtrls, uCommon, ExtCtrls, IniFiles, ShadowLabel, PanelEx,
  GraphicEx, GR32_Image;

type
  TFormImageLayoutDimensions = class(TForm)
    PanelImageLayoutDimensions: TPanelEx;
    PanelImageLayoutDimensLabel: TShadowLabel;
    PanelImageLayoutDimensButtonClose: TShadowLabel;
    LabelImage4: TShadowLabel;
    LabelImage3: TShadowLabel;
    LabelImage2: TShadowLabel;
    LabelImage1: TShadowLabel;
    LabelLayoutTitle: TShadowLabel;
    LabelImagesPanel: TShadowLabel;
    LabelImagesPanelDimensions: TShadowLabel;
    LabelImage1Dimensions: TShadowLabel;
    LabelImage2Dimensions: TShadowLabel;
    LabelImage3Dimensions: TShadowLabel;
    LabelImage4Dimensions: TShadowLabel;
    ImageScrLayout: TImage32;
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure PanelImageLayoutDimensButtonCloseMouseEnter(
      Sender: TObject);
    procedure PanelImageLayoutDimensButtonCloseMouseLeave(
      Sender: TObject);
    procedure PanelImageLayoutDimensButtonCloseClick(
      Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
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

  function SetBoxCloseButton(iButtonLabel, iPanelCaption: TShadowLabel; CustomLeftPos: Integer = -1): Boolean;
  var
    iLeft, iTop: Integer;
  begin
    if CustomLeftPos = -1 then
       begin
         iLeft:= 12;
         iTop:=  12;
       end
    else
       begin
         iLeft:= CustomLeftPos;
         iTop:=  24;
       end;

    FormMain.Set4KLabelSpecs(iButtonLabel, iLeft, iTop, 50, 30, 14);
    if iPanelCaption <> nil then
       FormMain.Set4KLabelSpecs(iPanelCaption, 72, 10, -1, -1, 16);
  end;

begin
  if not Is4KMode then
     Exit;

  FormMain.Set4KPanelSpecs(PanelImageLayoutDimensions,-1, -1, 558, 680);

  SetBoxCloseButton(PanelImageLayoutDimensButtonClose, PanelImageLayoutDimensLabel);

  FormMain.Set4KImageSpecs(ImageScrLayout, 530, 330, 12, 54);
  FormMain.Set4KLabelSpecs(LabelLayoutTitle, 127, 395, 300, 30, 18);
  FormMain.Set4KLabelSpecs(LabelImagesPanel, 106, 444, 146, 33, 18);
  FormMain.Set4KLabelSpecs(LabelImagesPanelDimensions, 265, LabelImagesPanel.Top, 183, 33, 18);
  FormMain.Set4KLabelSpecs(LabelImage1, 131, 496, -1, -1, 18);
  FormMain.Set4KLabelSpecs(LabelImage2, 131, 540, -1, -1, 18);
  FormMain.Set4KLabelSpecs(LabelImage3, 131, 584, -1, -1, 18);
  FormMain.Set4KLabelSpecs(LabelImage4, 131, 628, -1, -1, 18);

  FormMain.Set4KLabelSpecs(LabelImage1Dimensions, 236, 496, 116, 33, 18);
  FormMain.Set4KLabelSpecs(LabelImage2Dimensions, 236, 540, 116, 33, 18);
  FormMain.Set4KLabelSpecs(LabelImage3Dimensions, 236, 584, 116, 33, 18);
  FormMain.Set4KLabelSpecs(LabelImage4Dimensions, 236, 628, 116, 33, 18);
end;

procedure TFormImageLayoutDimensions.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if CanClose then
     begin
       FormMain.PopupImageShowLayoutDimensions.Checked:= False;
       FormImageLayoutDimensions.Release;
       FormImageLayoutDimensions:= nil;
     end;
end;

procedure TFormImageLayoutDimensions.PanelImageLayoutDimensButtonCloseMouseEnter(
  Sender: TObject);
begin
  FormMain.SetCloseButtonColorsFloatingPanel_Enter(TShadowLabel(Sender), True);
end;

procedure TFormImageLayoutDimensions.PanelImageLayoutDimensButtonCloseMouseLeave(
  Sender: TObject);
begin
  FormMain.SetCloseButtonColorsFloatingPanel(TShadowLabel(Sender), True);
end;

procedure TFormImageLayoutDimensions.PanelImageLayoutDimensButtonCloseClick(
  Sender: TObject);
begin
  Close;
end;

procedure TFormImageLayoutDimensions.FormCreate(Sender: TObject);
begin
  Resize4K;
  PanelImageLayoutDimensions.ParentWindow:= Application.MainForm.Handle;
  PanelImageLayoutDimensions.Parent:= FormMain.GamesListView;
end;

end.
