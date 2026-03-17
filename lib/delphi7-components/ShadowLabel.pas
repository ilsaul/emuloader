unit ShadowLabel;

// ShadowLabel by Ciro Alfredo Consentino
// © 2014 by Ciro Alfredo Consentino. All rights reserved
//
// This file is not distributable without permission by Ciro Alfredo Consentino
// website: http://emuloader.mameworld.info
// e-mail: emuloader@gmail.com
//
// version 1.0, August 03, 2014
// version 1.1, February 18, 2105 -> added support for Unicode texts (WideString)
// version 1.2, June 27, 2018 -> added "ColorBorder", "InnerColorBorder" (TColor) "Frames", "EnableInnerBorder" (Boolean) options
//                               - show a border in the client area; enable/disable "left", "top", "right", "bottom" borders
// version 1.3, July 28, 2019 -> fixed caption at "Create" event, it should not initialize FCaption with a text when you have an empty caption property
//                            -> new property "Caption Indent", default value is "0"; to be used with TPanelLabelEx component
//
// version 1.4, October 27, 2019 -> new property "WordWrapSpaceless", to perform word wrap on texts that have no spaces
//                                  - WordWrap property must be enabled
//                                  - AutoSize property must be disabled

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls;

type
  TEllipsType = (etNone, etEndEllips, etPathEllips);
  TLabelFrameOptions = set of (lfrLeft, lfrTop, lfrRight, lfrBottom);

  TShadowLabel = class(TCustomLabel)
  private
    FCaption: WideString;
    FCaptionIndent: Integer; // added July 31, 2019
    FShadowColor: TColor;
    FShadowEnabled: Boolean;
    FEllipsType: TEllipsType;

    FColorBorder: TColor; // added June 27, 2018
    fColorInnerBorder: TColor; // added June 27, 2018
    FFrames: TLabelFrameOptions; // added June 27, 2018
    FEnableInnerFrame: Boolean; // added June 27, 2018

    FDisabledFontColor: TColor; // clGray;
    FDisabledFontShadowColor: TColor; // clrMedDarkGray;
    FUseCustomDisabledFontColor: Boolean;
    FWordWrapSpaceless: Boolean;

    procedure SetCaption(const ACaption: WideString);
    procedure SetCaptionIndent(Value: Integer); // added July 31, 2019
    procedure SetFShadowEnabled(ShadowEnabled: Boolean);
    procedure SetShadowColor(Value: TColor);
    procedure SetEllipsType(const Value: TEllipsType);

    procedure SetColorFrame(const Value: TColor); // added June 27, 2018
    procedure SetColorInnerFrame(const Value: TColor); // added June 27, 2018
    procedure SetInnerFrame(const Value: Boolean); // added June 27, 2018
    procedure SetFrames(const Value: TLabelFrameOptions); // added June 27, 2018

    procedure SetDisabledFontColor(Value: TColor);
    procedure SetDisabledFontShadowColor(Value: TColor);
    procedure SetUseCustomDisabledFontColor(Value: Boolean);

    procedure SetWordWrapSpaceless(Value: Boolean);
  protected
    procedure Paint; override;
    function  Blend(Color1, Color2: TColor; A: Byte): TColor;
    procedure DoDrawText(var Rect: TRect; Flags: Longint); override;
    procedure AdjustBounds; override;
  public
    constructor Create(AOwner: TComponent); override;
  published
    property Align;
    property Alignment;
    property Anchors;
    property AutoSize;
    property BiDiMode;
    property Caption: WideString read FCaption write SetCaption;
    property CaptionIndent: Integer read FCaptionIndent write SetCaptionIndent default 0; // added July 31, 2019
    property Color;
    property Constraints;
    property DragCursor;
    property DragKind;
    property DragMode;
    property Enabled;
    property FocusControl;
    property Font;
    property ParentBiDiMode;
    property ParentColor;
    property ParentFont;
    property ParentShowHint;
    property PopupMenu;
    property ShowAccelChar;
    property ShowHint;
    property ShadowColor: TColor read FShadowColor write SetShadowColor;
    property ShadowEnabled: Boolean read FShadowEnabled write SetFShadowEnabled;
    property EllipsType: TEllipsType read FEllipsType write SetEllipsType;

    property ColorFrame: TColor read FColorBorder write SetColorFrame default $00c8ba90; // added June 27, 2018
    property ColorInnerFrame: TColor read FColorInnerBorder write SetColorInnerFrame default $00c8ba90; // added June 27, 2018
    property EnableInnerFrame: Boolean read FEnableInnerFrame write SetInnerFrame default False; // added June 27, 2018
    property Frames: TLabelFrameOptions read FFrames write SetFrames; // added June 27, 2018

    property DisabledFontColor: TColor read FDisabledFontColor write SetDisabledFontColor default clGray;
    property DisabledFontShadowColor: TColor read FDisabledFontShadowColor write SetDisabledFontShadowColor default $00505050; // RGB(80, 80, 80)
    property UseCustomDisabledFontColor: Boolean read FUseCustomDisabledFontColor write SetUseCustomDisabledFontColor default False;

    property WordWrapSpaceless: Boolean read FWordWrapSpaceless write SetWordWrapSpaceless default False;

    property Transparent;
    property Layout;
    property Visible;
    property WordWrap;
    property OnClick;
    property OnContextPopup;
    property OnDblClick;
    property OnDragDrop;
    property OnDragOver;
    property OnEndDock;
    property OnEndDrag;
    property OnMouseDown;
    property OnMouseMove;
    property OnMouseUp;
    property OnMouseEnter;
    property OnMouseLeave;
    property OnStartDock;
    property OnStartDrag;
  end;

procedure Register;

implementation

const
  ELLIPSSTYLE : array[TEllipsType] of DWORD = (0, DT_END_ELLIPSIS, DT_PATH_ELLIPSIS);

procedure Register;
begin
  RegisterComponents('Components', [TShadowLabel]);
end;

constructor TShadowLabel.Create(AOwner: TComponent);
begin
  FShadowColor := clGray;
  FShadowEnabled := True;
  FEllipsType := etNone;
  if (csDesigning in ComponentState) and not
     ((csReading in Owner.ComponentState) or (csLoading in Owner.ComponentState)) then
     FCaption:= Self.ClassName;

  //FCaption:= 'ShadowLabel'; // cannot set this here; if caption is to be an empty string, it will never work (July 28, 2019)
  //FCaptionIndent := 0; // added July 31, 2019

  FDisabledFontColor := clGray;
  FDisabledFontShadowColor := $00505050; // RGB(80, 80, 80)
  FUseCustomDisabledFontColor:= False;

  FWordWrapSpaceless:= False;

  ShowAccelChar := False;
  inherited Create(AOwner);
end;

procedure TShadowLabel.SetCaption(const ACaption: WideString);
begin
  if ACaption <> FCaption then
     begin
       //SetWindowTextW(Handle, PWideChar(ACaption));
       FCaption := ACaption;
       if AutoSize then
          AdjustBounds;
       Invalidate;
     end;
end;

procedure TShadowLabel.SetCaptionIndent(Value: Integer);
begin
  if FCaptionIndent <> Value then
     begin
       FCaptionIndent := Value;
       if AutoSize then
          begin
            if (Alignment = taLeftJustify) then
               AdjustBounds;
          end;
       Invalidate;
     end;
end;

procedure TShadowLabel.SetFShadowEnabled(ShadowEnabled: Boolean);
begin
  if ShadowEnabled <> FShadowEnabled then
  begin
    FShadowEnabled := ShadowEnabled;
    Invalidate;
  end;
end;

procedure TShadowLabel.SetShadowColor(Value: TColor);
begin
  if FShadowColor <> Value then
  begin
    FShadowColor := Value;
    Invalidate;
  end;
end;

procedure TShadowLabel.SetColorFrame(const Value: TColor);
begin
  FColorBorder := Value;
  Invalidate;
end;

procedure TShadowLabel.SetColorInnerFrame(const Value: TColor);
begin
  FColorInnerBorder := Value;
  Invalidate;
end;

procedure TShadowLabel.SetInnerFrame(const Value: Boolean);
begin
  FEnableInnerFrame := Value;
  Invalidate;
end;

procedure TShadowLabel.SetFrames(const Value: TLabelFrameOptions);
begin
  FFrames := Value;
  Invalidate;
end;

procedure TShadowLabel.SetDisabledFontColor(Value: TColor);
begin
  FDisabledFontColor:= Value;
  Invalidate;
end;

procedure TShadowLabel.SetDisabledFontShadowColor(Value: TColor);
begin
  FDisabledFontShadowColor := Value;
  Invalidate;
end;

procedure TShadowLabel.SetUseCustomDisabledFontColor(Value: Boolean);
begin
  FUseCustomDisabledFontColor := Value;
  Invalidate;
end;

procedure TShadowLabel.SetWordWrapSpaceless(Value: Boolean);
begin
  FWordWrapSpaceless := Value;
  Invalidate;
end;

procedure TShadowLabel.SetEllipsType(const Value: TEllipsType);
begin
  if FEllipsType <> Value then
  begin
    FEllipsType := Value;
    Invalidate;
  end;
end;

procedure TShadowLabel.Paint;
begin
  inherited;

  if FEnableInnerFrame then
  begin
    Canvas.Pen.Color := FColorInnerBorder;
    if lfrLeft in FFrames then
    begin
      Canvas.MoveTo(ClientRect.Left+1, ClientRect.Top);
      Canvas.LineTo(ClientRect.Left+1, ClientRect.Bottom);
    end;
    if lfrTop in FFrames then
    begin
      Canvas.MoveTo(ClientRect.Left{+1}, ClientRect.Top+1);
      Canvas.LineTo(ClientRect.Right{-1}, ClientRect.Top+1);
    end;
    if lfrRight in FFrames then
    begin
      Canvas.MoveTo(ClientRect.Right - 2, ClientRect.Top);
      Canvas.LineTo(ClientRect.Right - 2, ClientRect.Bottom);
    end;
      if lfrBottom in FFrames then
    begin
      Canvas.MoveTo(ClientRect.Left, ClientRect.Bottom - 2);
      Canvas.LineTo(ClientRect.Right, ClientRect.Bottom - 2);
    end;
  end;

  Canvas.Pen.Color := FColorBorder;
  if lfrLeft in FFrames then
  begin
    Canvas.MoveTo(ClientRect.Left, ClientRect.Top);
    Canvas.LineTo(ClientRect.Left, ClientRect.Bottom);
  end;
  if lfrTop in FFrames then
  begin
    Canvas.MoveTo(ClientRect.Left, ClientRect.Top);
    Canvas.LineTo(ClientRect.Right, ClientRect.Top);
  end;
  if lfrRight in FFrames then
  begin
    Canvas.MoveTo(ClientRect.Right - 1, ClientRect.Top);
    Canvas.LineTo(ClientRect.Right - 1, ClientRect.Bottom);
  end;
    if lfrBottom in FFrames then
  begin
    Canvas.MoveTo(ClientRect.Left, ClientRect.Bottom - 1);
    Canvas.LineTo(ClientRect.Right, ClientRect.Bottom - 1);
  end;
end;

function TShadowLabel.Blend(Color1, Color2: TColor; A: Byte): TColor;
var
  c1, c2: LongInt;
  R, G, B, v1, v2: Byte;
begin
  A := Round(2.55 * A);
  c1 := ColorToRGB(Color1);
  c2 := ColorToRGB(Color2);
  v1 := Byte(c1);
  v2 := Byte(c2);
  R := Byte(A * (v1 - v2) shr 8 + v2);
  v1 := Byte(c1 shr 8);
  v2 := Byte(c2 shr 8);
  G := Byte(A * (v1 - v2) shr 8 + v2);
  v1 := Byte(c1 shr 16);
  v2 := Byte(c2 shr 16);
  B := Byte(A * (v1 - v2) shr 8 + v2);
  Result := (B shl 16) + (G shl 8) + R;
end;

procedure TShadowLabel.DoDrawText(var Rect: TRect; Flags: Longint);
var
  Text: WideString;
begin
  Canvas.Lock;

  Text := FCaption;
  if (Flags and DT_CALCRECT <> 0) and ((Text = '') or ShowAccelChar and
    (Text[1] = '&') and (Text[2] = #0)) then Text := Text + ' ';
  if not ShowAccelChar then Flags := Flags or DT_NOPREFIX;

  if EllipsType <> etNone then Flags := Flags or ELLIPSSTYLE[FEllipsType];

  if WordWrap and WordWrapSpaceless and (not AutoSize) then
     Flags := Flags or DT_EDITCONTROL;
     
  Flags := DrawTextBiDiModeFlags(Flags);

  Canvas.Font := Font;
  if (Alignment = taLeftJustify) and (CaptionIndent > 0) then
     begin
       if Flags and DT_CALCRECT = 0 then
          Rect.Left:= CaptionIndent;
     end;


  if FShadowEnabled then
  begin
    OffsetRect(Rect, 1, 1);
    if Enabled then
       Canvas.Font.Color := FShadowColor
    else
    begin
      if Self.UseCustomDisabledFontColor then
         Canvas.Font.Color := FDisabledFontShadowColor
      else
         Canvas.Font.Color := clBtnHighlight;
    end;
    DrawTextW(Canvas.Handle, PWideChar(Text), Length(Text), Rect, Flags);
    OffsetRect(Rect, -1, -1);
  end;
  if Enabled then
     Canvas.Font.Color := Font.Color
  else
  begin
    if FUseCustomDisabledFontColor then
       Canvas.Font.Color := FDisabledFontColor
    else
       Canvas.Font.Color := clBtnShadow;
  end;
  DrawTextW(Canvas.Handle, PWideChar(Text), Length(Text), Rect, Flags);

    Canvas.UnLock;
end;

procedure TShadowLabel.AdjustBounds;
const
  WordWraps: array[Boolean] of Word = (0, DT_WORDBREAK);
var
  DC: HDC;
  X: Integer;
  Rect: TRect;
  AAlignment: TAlignment;
begin
  if not (csReading in ComponentState) and AutoSize then
  begin
    Rect := ClientRect;
    DC := GetDC(0);
    Canvas.Handle := DC;
    DoDrawText(Rect, (DT_EXPANDTABS or DT_CALCRECT) or WordWraps[WordWrap]);
    Canvas.Handle := 0;
    ReleaseDC(0, DC);
    X := Left;
    AAlignment := Alignment;
    if UseRightToLeftAlignment then
       ChangeBiDiModeAlignment(AAlignment);
    if AAlignment = taRightJustify then
       Inc(X, Width - Rect.Right);
    case AAlignment of
      taCenter:       SetBounds(X, Top, Rect.Right, Rect.Bottom+1);
      taLeftJustify:  SetBounds(X, Top, Rect.Right+FCaptionIndent+3, Rect.Bottom+1);
      taRightJustify: SetBounds(X-3, Top, Rect.Right+3, Rect.Bottom+1);
    end;
  end;
end;

end.
