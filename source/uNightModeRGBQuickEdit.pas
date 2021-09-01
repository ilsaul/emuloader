unit uNightModeRGBQuickEdit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  StdCtrls, ButtonsEx, ExtCtrls, EditEx, ShadowLabel, XiTrackBar, PanelEx,
  AdvOfficeButtons;

type
  TFormNightModeRGBQuickEdit = class(TForm)
    NightModeRGBQuickEdit_RedLabel: TShadowLabel;
    NightModeRGBQuickEdit_Red: TEditEx;
    NightModeRGBQuickEdit_GreenLabel: TShadowLabel;
    NightModeRGBQuickEdit_Green: TEditEx;
    NightModeRGBQuickEdit_BlueLabel: TShadowLabel;
    NightModeRGBQuickEdit_Blue: TEditEx;
    NightModeKeysHintLabel: TShadowLabel;
    NightModeRGBQuickEdit_ButtonApply: TBitBtnEx;
    NightModeColorBoxExHint: TShadowLabel;
    NightModeRGBQuickEdit_HexLabel2: TShadowLabel;
    NightModeRGBQuickEdit_ButtonAbort: TBitBtnEx;
    NightModeRGBQuickEdit_ColorSampleLabel: TShadowLabel;
    NightModeRGBQuickEdit_ColorSample_CurrentLabel: TShadowLabel;
    TrackBarColorR: TXiTrackBar;
    TrackBarColorG: TXiTrackBar;
    TrackBarColorB: TXiTrackBar;
    TrackBarColorR_ButtonDec: TBitBtnEx;
    TrackBarColorR_ButtonInc: TBitBtnEx;
    TrackBarColorG_ButtonDec: TBitBtnEx;
    TrackBarColorG_ButtonInc: TBitBtnEx;
    TrackBarColorB_ButtonDec: TBitBtnEx;
    TrackBarColorB_ButtonInc: TBitBtnEx;
    NightModeRGBQuickEdit_ColorSample: TPanelEx;
    NightModeRGBQuickEdit_ColorSample_Current: TPanelEx;
    NightModeRGBQuickEdit_HexLabel: TShadowLabel;
    LockSliders: TAdvOfficeCheckBoxEx;
    procedure NightModeRGBQuickEdit_RedKeyPress(Sender: TObject;
      var Key: Char);
    procedure NightModeRGBQuickEdit_RedChange(Sender: TObject);
    procedure NightModeRGBQuickEdit_ColorSample_CurrentMouseUp(
      Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure TrackBarColorRChange(Sender: TObject);
    procedure TrackBarColorGChange(Sender: TObject);
    procedure TrackBarColorBChange(Sender: TObject);
    procedure TrackBarColorR_ButtonDecClick(Sender: TObject);
    procedure TrackBarColorG_ButtonDecClick(Sender: TObject);
    procedure TrackBarColorB_ButtonDecClick(Sender: TObject);
  private
    { Private declarations }
    procedure NightModeRGBQuickEdit_ChangeColorSample;
    procedure LockSliderMove(SliderSource, Slider2, Slider3: TXiTrackBar);
  public
    { Public declarations }
  end;

var
  FormNightModeRGBQuickEdit: TFormNightModeRGBQuickEdit;

implementation

{$R *.dfm}

procedure TFormNightModeRGBQuickEdit.NightModeRGBQuickEdit_ChangeColorSample;
var
  Red, Green, Blue: Byte;
begin
  if NightModeRGBQuickEdit_Red.Text <> '' then
     Red:= StrToInt(NightModeRGBQuickEdit_Red.Text)
  else
     Red:= 0; // set it to black

  if NightModeRGBQuickEdit_Green.Text <> '' then
     Green:= StrToInt(NightModeRGBQuickEdit_Green.Text)
  else
     Green:= 0; // set it to black

  if NightModeRGBQuickEdit_Blue.Text <> '' then
     Blue:= StrToInt(NightModeRGBQuickEdit_Blue.Text)
  else
     Blue:= 0; // set it to black

  NightModeRGBQuickEdit_ColorSample.Color1:= RGB(Red, Green, Blue);
  NightModeRGBQuickEdit_HexLabel.Caption:= Format('%.2x%.2x%.2x', [Red, Green, Blue]);
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
  if not (Key in ['0'..'9', Chr(VK_BACK)]) then
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
          iNumber:= 255;
          
       if TEditEx(Sender).Text <> IntToStr(iNumber) then
          TEditEx(Sender).Text:=  IntToStr(iNumber);

       if TEditEx(Sender).Name = 'NightModeRGBQuickEdit_Red' then
          begin
            if TrackBarColorR.Position <> iNumber then
               TrackBarColorR.Position:=  iNumber;
          end
       else
       if TEditEx(Sender).Name = 'NightModeRGBQuickEdit_Green' then
          begin
            if TrackBarColorG.Position <> iNumber then
               TrackBarColorG.Position:=  iNumber
          end
       else
       if TEditEx(Sender).Name = 'NightModeRGBQuickEdit_Blue' then
          begin
            if TrackBarColorB.Position <> iNumber then
               TrackBarColorB.Position:=  iNumber;
          end;

       NightModeRGBQuickEdit_ChangeColorSample;
     end;
end;

procedure TFormNightModeRGBQuickEdit.NightModeRGBQuickEdit_ColorSample_CurrentMouseUp(
  Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  iColor: TColor;
begin
  if Button = mbLeft then
     begin
       iColor:= NightModeRGBQuickEdit_ColorSample_Current.Color1;
       TrackBarColorR.Position:= GetRValue(iColor);
       TrackBarColorG.Position:= GetGValue(iColor);
       TrackBarColorB.Position:= GetBValue(iColor);
     end;
end;

procedure TFormNightModeRGBQuickEdit.LockSliderMove(SliderSource, Slider2, Slider3: TXiTrackBar);
begin
  if not LockSliders.Checked then
     Exit;


end;

procedure TFormNightModeRGBQuickEdit.TrackBarColorRChange(Sender: TObject);
begin
  if NightModeRGBQuickEdit_Red.Text <> IntToStr(TrackBarColorR.Position) then
     NightModeRGBQuickEdit_Red.Text:=  IntToStr(TrackBarColorR.Position);
end;

procedure TFormNightModeRGBQuickEdit.TrackBarColorGChange(Sender: TObject);
begin
  if NightModeRGBQuickEdit_Green.Text <> IntToStr(TrackBarColorG.Position) then
     NightModeRGBQuickEdit_Green.Text:=  IntToStr(TrackBarColorG.Position);
end;

procedure TFormNightModeRGBQuickEdit.TrackBarColorBChange(Sender: TObject);
begin
  if NightModeRGBQuickEdit_Blue.Text <> IntToStr(TrackBarColorB.Position) then
     NightModeRGBQuickEdit_Blue.Text:=  IntToStr(TrackBarColorB.Position);
end;

procedure TFormNightModeRGBQuickEdit.TrackBarColorR_ButtonDecClick(
  Sender: TObject);
begin
  TrackBarColorR.Position:= TrackBarColorR.Position+TBitBtnEx(Sender).Tag;
end;

procedure TFormNightModeRGBQuickEdit.TrackBarColorG_ButtonDecClick(
  Sender: TObject);
begin
  TrackBarColorG.Position:= TrackBarColorG.Position+TBitBtnEx(Sender).Tag;
end;

procedure TFormNightModeRGBQuickEdit.TrackBarColorB_ButtonDecClick(
  Sender: TObject);
begin
  TrackBarColorB.Position:= TrackBarColorB.Position+TBitBtnEx(Sender).Tag;
end;

end.
