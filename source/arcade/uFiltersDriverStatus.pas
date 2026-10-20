unit uFiltersDriverStatus;

interface

uses
  Windows, SysUtils, Classes, Graphics, Controls, Forms,
  StdCtrls, Buttons, PanelEx, AdvGroupBox, AdvOfficeButtons,
  ExtCtrls, ShadowLabel, ButtonsEx, ColorBoxEx, ImgList;

type
  TFormArcadeFiltersDriverStatus = class(TForm)
    PanelBottom: TPanelEx;
    ButtonOk: TBitBtnEx;
    ButtonCancel: TBitBtnEx;
    LabelSelectCategory: TShadowLabel;
    LabelFilterStatus: TShadowLabel;
    IconListAll: TImage;
    IconGoodImperfect: TImage;
    IconImperfect: TImage;
    ListAll: TAdvOfficeRadioButtonEx;
    DriverStatusCategory: TComboBox2Ex;
    GoodImperfect: TAdvOfficeRadioButtonEx;
    Imperfect: TAdvOfficeRadioButtonEx;
    Preliminary: TAdvOfficeRadioButtonEx;
    Good: TAdvOfficeRadioButtonEx;
    IconGood: TImage;
    IconPreliminary: TImage;
    procedure ListAllClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
    {$IF CompilerVersion >= 20}
    procedure AdjustStatusLayout;
    {$IFEND}
  end;

var
  FormArcadeFiltersDriverStatus: TFormArcadeFiltersDriverStatus;

implementation

uses uMain, uCommon, Math;

{$R *.dfm}

{$IF CompilerVersion >= 20}
procedure TFormArcadeFiltersDriverStatus.AdjustStatusLayout;
var
  GlyphInset, Gap, RequiredWidth, ButtonsWidth: Integer;

  procedure MeasureGlyph(RadioButton: TAdvOfficeRadioButtonEx);
  begin
    RadioButton.CaptionIndent:= 0;
    GlyphInset:= Max(GlyphInset, RadioButton.CaptionTextInset);
  end;

  procedure AlignRow(RadioButton: TAdvOfficeRadioButtonEx; StatusIcon: TImage);
  begin
    StatusIcon.Left:= RadioButton.Left+GlyphInset+Gap;
    RadioButton.CaptionIndent:= StatusIcon.Left+StatusIcon.Width+Gap-RadioButton.Left;
    Canvas.Font:= RadioButton.Font;
    RequiredWidth:= Max(RequiredWidth, RadioButton.Left+
      RadioButton.CaptionIndent+Canvas.TextWidth(RadioButton.Caption)+2*Gap);
    RadioButton.Invalidate;
  end;

  procedure SetRowWidth(RadioButton: TAdvOfficeRadioButtonEx);
  begin
    RadioButton.Width:= ClientWidth-RadioButton.Left-Gap;
  end;

begin
  Gap:= 6;
  if Is4KMode then
     Gap:= 10;
  GlyphInset:= 0;
  MeasureGlyph(ListAll);
  MeasureGlyph(GoodImperfect);
  MeasureGlyph(Good);
  MeasureGlyph(Imperfect);
  MeasureGlyph(Preliminary);

  RequiredWidth:= ClientWidth;
  AlignRow(ListAll, IconListAll);
  AlignRow(GoodImperfect, IconGoodImperfect);
  AlignRow(Good, IconGood);
  AlignRow(Imperfect, IconImperfect);
  AlignRow(Preliminary, IconPreliminary);
  ClientWidth:= RequiredWidth;
  SetRowWidth(ListAll);
  SetRowWidth(GoodImperfect);
  SetRowWidth(Good);
  SetRowWidth(Imperfect);
  SetRowWidth(Preliminary);
  DriverStatusCategory.Width:= ClientWidth-2*DriverStatusCategory.Left;

  ButtonsWidth:= ButtonOk.Width+Gap+ButtonCancel.Width;
  ButtonOk.Left:= (ClientWidth-ButtonsWidth) div 2;
  ButtonCancel.Left:= ButtonOk.Left+ButtonOk.Width+Gap;
end;
{$IFEND}

procedure TFormArcadeFiltersDriverStatus.ListAllClick(Sender: TObject);
begin
  LabelFilterStatus.Tag:= TAdvOfficeRadioButtonEx(Sender).Tag;
end;

procedure TFormArcadeFiltersDriverStatus.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #27 then
     ButtonCancel.Click;
end;

end.
