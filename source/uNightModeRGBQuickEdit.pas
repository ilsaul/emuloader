unit uNightModeRGBQuickEdit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  StdCtrls, ButtonsEx, ExtCtrls, EditEx, ShadowLabel;

type
  TFormNightModeRGBQuickEdit = class(TForm)
    NightModeRGBQuickEdit_RedLabel: TShadowLabel;
    NightModeRGBQuickEdit_Red: TEditEx;
    NightModeRGBQuickEdit_GreenLabel: TShadowLabel;
    NightModeRGBQuickEdit_Green: TEditEx;
    NightModeRGBQuickEdit_BlueLabel: TShadowLabel;
    NightModeRGBQuickEdit_Blue: TEditEx;
    NightModeRGBQuickEdit_ColorSample: TShape;
    NightModeKeysHintLabel: TShadowLabel;
    NightModeRGBQuickEdit_ButtonApply: TBitBtnEx;
    NightModeColorBoxExHint: TShadowLabel;
    NightModeRGBQuickEdit_HexLabel: TShadowLabel;
    NightModeRGBQuickEdit_ButtonAbort: TBitBtnEx;
    NightModeRGBQuickEdit_ColorSampleLabel: TShadowLabel;
    NightModeRGBQuickEdit_ColorSample_Current: TShape;
    NightModeKeysHint2Label: TShadowLabel;
    NightModeRGBQuickEdit_ColorSample_CurrentLabel: TShadowLabel;
    procedure NightModeRGBQuickEdit_RedKeyPress(Sender: TObject;
      var Key: Char);
    procedure NightModeRGBQuickEdit_RedChange(Sender: TObject);
    procedure NightModeRGBQuickEdit_ColorSample_CurrentMouseUp(
      Sender: TObject; Button: TMouseButton; Shift: TShiftState; X,
      Y: Integer);
  private
    { Private declarations }
    procedure NightModeRGBQuickEdit_ChangeColorSample;
  public
    { Public declarations }
  end;

var
  FormNightModeRGBQuickEdit: TFormNightModeRGBQuickEdit;

implementation

{$R *.dfm}

procedure TFormNightModeRGBQuickEdit.NightModeRGBQuickEdit_ChangeColorSample;
var
  R, G, B: Byte;
begin
  if NightModeRGBQuickEdit_Red.Text <> '' then
     R:= StrToInt(NightModeRGBQuickEdit_Red.Text)
  else
     R:= 0; // set it to black

  if NightModeRGBQuickEdit_Green.Text <> '' then
     G:= StrToInt(NightModeRGBQuickEdit_Green.Text)
  else
     G:= 0; // set it to black

  if NightModeRGBQuickEdit_Blue.Text <> '' then
     B:= StrToInt(NightModeRGBQuickEdit_Blue.Text)
  else
     B:= 0; // set it to black

  NightModeRGBQuickEdit_ColorSample.Brush.Color:= RGB(R, G, B);
  NightModeRGBQuickEdit_HexLabel.Caption:= 'Hex   '+Format('%.2x%.2x%.2x', [R, G, B]);
end;

procedure TFormNightModeRGBQuickEdit.NightModeRGBQuickEdit_RedKeyPress(
  Sender: TObject; var Key: Char);
begin
  if Key = #13 then
     NightModeRGBQuickEdit_ButtonApply.Click
  else
  if Key = #27 then
     Close
  else
  if not (Key in [#8, '0'..'9']) then
     Key:= #0;
end;

procedure TFormNightModeRGBQuickEdit.NightModeRGBQuickEdit_RedChange(
  Sender: TObject);
var
  iNumber: Integer;
begin
  if TEditEx(Sender).Text <> '' then
     begin
       iNumber:= StrToInt(TEditEx(Sender).Text);
       if iNumber > 255 then
          TEditEx(Sender).Text:= '255';
       NightModeRGBQuickEdit_ChangeColorSample;
     end;
end;

procedure TFormNightModeRGBQuickEdit.NightModeRGBQuickEdit_ColorSample_CurrentMouseUp(
  Sender: TObject; Button: TMouseButton; Shift: TShiftState; X,
  Y: Integer);
var
  iColor: TColor;
begin
  if Button = mbLeft then
     begin
       iColor:= NightModeRGBQuickEdit_ColorSample_Current.Brush.Color;
       NightModeRGBQuickEdit_Red.Text:= IntToStr(GetRValue(iColor));
       NightModeRGBQuickEdit_Green.Text:= IntToStr(GetGValue(iColor));
       NightModeRGBQuickEdit_Blue.Text:= IntToStr(GetBValue(iColor));
     end;
end;

end.
