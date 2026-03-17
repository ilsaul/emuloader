unit GlowLabel;
      {******************************************************************}
      { GlowLabel                                                        }
      {                                                                  }
      { home page : http://www.winningcubed.de                           }
      { email     : martin.walter@winningcubed.de                        }
      {                                                                  }
      { date      : 15-04-2007                                           }
      {                                                                  }
      { version   : 1.0                                                  }
      {                                                                  }
      { Use of this file is permitted for commercial and non-commercial  }
      { use, as long as the author is credited.                          }
      { This file (c) 2007 Martin Walter                                 }
      {                                                                  }
      { This Software is distributed on an "AS IS" basis, WITHOUT        }
      { WARRANTY OF ANY KIND, either express or implied.                 }
      {                                                                  }
      { *****************************************************************}


interface

uses
  Windows, Classes, Controls, StdCtrls, SysUtils, ExtCtrls,
  Graphics, Math, Forms, DwmApi, Themes, UxTheme;

  //Windows, SysUtils, Classes, Controls, ExtCtrls, Graphics, Forms, Messages,
  //ImgList, Math, Menus, Dialogs;

type
  TWinControlCracker = class(TWinControl);
    PRGB24 = ^TRGB24;
    TRGB24 = packed record B: Byte;
    G: Byte;
    R: Byte;
  end;

  PLine24 = ^TLine24;
  TLine24 = array [0 .. 0] of TRGB24;
  PRGBArray = ^TRGBArray;
  TRGBArray = array [0 .. 0] of TRGB24;
  TShadowStyle = (ssNone, ssGlow, ssDrop);
  
  TCustomGlowLabel = class(TCustomLabel)
  private
    FGlow: Boolean;
    FGlowSize: Integer;
    FOldGlowSize: Integer;
    FBoundsWithGlow: Boolean;

    // alphatext
    //TextX, TextY: Integer;
    //TextRect: TRect;
    FBmp: TBitmap;
    FBlurLevel: Integer;
    FFont: TFont;
    FColorGlow: TColor;
    GlowColor: TRGB24;
    FShadowStyle: TShadowStyle;

    procedure SetGlow(const Value: Boolean);
    procedure SetGlowSize(const Value: Integer);

    function IsGlow: Boolean;
    function IsShadowStyle: Boolean;
    function GetExpansion(GlowSize: Integer): Integer;

    // alphatext
    procedure SetShadowColor(const Value: TColor);
    procedure SetShadowStyle(const Value: TShadowStyle);
    procedure InitPos;
    procedure PaintAlphaTxt(const Text: WideString; TextRect: TRect; TextFlags: Cardinal);
  protected
    procedure DoDrawText(var Rect: TRect; Flags: Longint); override;
    procedure AdjustBounds; override;
    property Glow: Boolean read FGlow write SetGlow;
    property GlowSize: Integer read FGlowSize write SetGlowSize;
    property ColorShadow
      : TColor read FColorGlow write SetShadowColor default clBlack;
    property ShadowStyle
      : TShadowStyle read FShadowStyle write SetShadowStyle
      default ssGlow;
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
  end;

  TGlowLabel = class(TCustomGlowLabel)
  published
    property Align;
    property Alignment;
    property Anchors;
    property AutoSize;
    property BiDiMode;
    property Caption;
    property Color nodefault;
    property ColorShadow;
    property Constraints;
    property DragCursor;
    property DragKind;
    property DragMode;
    property Enabled;
    property FocusControl;
    property Font;
    property Glow;
    property GlowSize;
    property ParentBiDiMode;
    property ParentColor;
    property ParentFont;
    property ParentShowHint;
    property PopupMenu;
    property ShadowStyle;
    property ShowAccelChar;
    property ShowHint;
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
    //property OnMouseActivate;
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

//uses
//  Controls, Forms, Graphics, SysUtils, Math, DwmApi, Themes, UxTheme;

function StrScanW(const Str: PWideChar; Chr: WideChar): PWideChar;
begin
  Result := Str;
  while Result^ <> Chr do
  begin
    if Result^ = #0 then
    begin
      Result := nil;
      Exit;
    end;
    Inc(Result);
  end;
end;

function LastDelimiterW(const Delimiters, S: WideString): Integer;
var
  P: PWideChar;
begin
  Result := Length(S);
  P := PWideChar(Delimiters);
  while Result > 0 do
  begin
    if (S[Result] <> #0) and (StrScanW(P, S[Result]) <> nil) then
      Exit;

    Dec(Result);
  end;
end;

procedure InitPos;
begin
  TextRect:= ClientRect;

  case Alignment of
    taLeftJustify : TextRect.Left:= 3;
    taRightJustify: TextRect.Right:= ClientWidth-3;
  end;

  if not (Alignment = taCenter) then
  case Layout of
    tlTop   : TextRect.Top := 1; // move a little lower to avoid cutting the glow effect
    tlBottom: TextRect.Bottom:= ClientHeight-1;
  end;

  TextX := 0;//FImageOffset;
  TextY := (ClientHeight - ts.cy) shr 1;
  TextRect.Top := 0;
  TextRect.Bottom := ClientHeight;
  TextRect.Left := TextX;
  TextRect.Right := ClientWidth;
end;}

procedure fxBoxBlur(Src: TBitmap; radius, rep: Integer);
type
  PintRGB = ^TintRGB;

  TintRGB = packed record
    iB: Integer;
    iG: Integer;
    iR: Integer;
  end;
var
  j, divF, i, w, h, X, Y, ny, tx, ty, prg, rad1: Integer;
  ox, radm1, boxW, boxH: Integer;
  p: PRGB24;
  ptrS, ptrD, pv: Integer;
  s0, s1: PRGB24;
  bool: Boolean;
  lutRGB: array of TintRGB;
  R, G, B: Byte;
begin
  if radius = 0 then
    Exit;
  divF := (radius * 2) + 1;
  w := Src.Width - 1;
  h := Src.Height - 1;
  SetLength(lutRGB, Max(w, h) + 1 + (radius * 2));
  s1 := Src.ScanLine[0];
  ptrD := Integer(Src.ScanLine[1]) - Integer(s1);
  rad1 := radius - 1;
  ny := Integer(s1);
  for Y := 0 to h do
  begin
    for j := 1 to rep do
    begin
      for i := -radius to 0 do
      begin
        with PRGB24(ny)^, lutRGB[i + radius] do
        begin
          iR := R + lutRGB[i + radius - 1].iR;
          iG := G + lutRGB[i + radius - 1].iG;
          iB := B + lutRGB[i + radius - 1].iB;
        end;
      end;
      for i := 1 to w do
      begin
        tx := i;
        with PRGB24(ny + tx * 3)^, lutRGB[i + radius] do
        begin
          iR := R + lutRGB[i + radius - 1].iR;
          iG := G + lutRGB[i + radius - 1].iG;
          iB := B + lutRGB[i + radius - 1].iB;
        end;
      end;
      prg := w * 3;
      for i := w + 1 to w + radius do
      begin
        with PRGB24(ny + prg)^, lutRGB[i + radius] do
        begin
          iR := R + lutRGB[i + radius - 1].iR;
          iG := G + lutRGB[i + radius - 1].iG;
          iB := B + lutRGB[i + radius - 1].iB;
        end;
      end;
      ox := 0;
      for X := 0 to w do
      begin
        tx := X + radius;
        with PRGB24(ny + ox)^, lutRGB[tx + radius] do
        begin
          R := ((iR - lutRGB[tx - radius - 1].iR) div divF);
          G := ((iG - lutRGB[tx - radius - 1].iG) div divF);
          B := ((iB - lutRGB[tx - radius - 1].iB) div divF);
        end;
        inc(ox, 3);
      end;
    end;
    inc(ny, ptrD);
  end;
  ox := 0;
  for X := 0 to w do
  begin
    for j := 0 to rep do
    begin
      ny := Integer(s1);
      for i := -radius to 0 do
      begin
        with PRGB24(ny + X * 3)^, lutRGB[i + radius] do
        begin
          iR := R + lutRGB[i + radius - 1].iR;
          iG := G + lutRGB[i + radius - 1].iG;
          iB := B + lutRGB[i + radius - 1].iB;
        end;
      end;
      for i := 1 to h do
      begin
        inc(ny, ptrD);
        with PRGB24(ny + X * 3)^, lutRGB[i + radius] do
        begin
          iR := R + lutRGB[i + radius - 1].iR;
          iG := G + lutRGB[i + radius - 1].iG;
          iB := B + lutRGB[i + radius - 1].iB;
        end;
      end;
      for i := h + 1 to h + radius do
      begin
        with PRGB24(ny + X * 3)^, lutRGB[i + radius] do
        begin
          iR := R + lutRGB[i + radius - 1].iR;
          iG := G + lutRGB[i + radius - 1].iG;
          iB := B + lutRGB[i + radius - 1].iB;
        end;
      end;
      ny := Integer(s1);
      for Y := 0 to h do
      begin
        ty := Y + radius;
        with PRGB24(ny + ox)^, lutRGB[ty + radius] do
        begin
          R := ((iR - lutRGB[ty - radius - 1].iR) div divF);
          G := ((iG - lutRGB[ty - radius - 1].iG) div divF);
          B := ((iB - lutRGB[ty - radius - 1].iB) div divF);
        end;
        inc(ny, ptrD);
      end;
    end;
    inc(ox, 3);
  end;
  SetLength(lutRGB, 0);
  // Convert to greyscale
  s1 := Src.ScanLine[0];
  for Y := 0 to h do
  begin
    for X := 0 to w do
    begin
      R := PRGBArray(s1)[X].R;
      G := PRGBArray(s1)[X].G;
      B := PRGBArray(s1)[X].B;
      R := Byte((R + G + B) div 3);
      PRGBArray(s1)[X].B := R;
      PRGBArray(s1)[X].G := R;
      PRGBArray(s1)[X].R := R;
    end;
    inc(Integer(s1), ptrD);
  end;
end;

function Blend(Color1, Color2: TColor; A: Byte): TColor;
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

{ TGlowCustomLabel }

procedure TCustomGlowLabel.AdjustBounds;
const
  WordWraps: array[Boolean] of Word = (0, DT_WORDBREAK);
var
  DC: HDC;
  Rect, Bounds, CalcRect: TRect;
  AAlignment: TAlignment;
  Expand: Integer;
  DoSetBounds: Boolean;
begin
  DoSetBounds := False;
  Bounds := BoundsRect;
  Rect := Bounds;

  if (IsGlow and (csReading in ComponentState)) then
  begin
    FBoundsWithGlow := True;
    FOldGlowSize := FGlowSize;
  end;

  if FBoundsWithGlow then
  begin
    Expand := GetExpansion(FOldGlowSize);
    Inc(Rect.Left, Expand);
    Inc(Rect.Top, Expand);
    Dec(Rect.Right, Expand);
    Dec(Rect.Bottom, Expand);
    FBoundsWithGlow := False;
    DoSetBounds := True;
  end;

  if not ((csReading in ComponentState) or
          (csLoading in ComponentState)) and
     AutoSize then
  begin
    DC := GetDC(0);
    Canvas.Handle := DC;
    CalcRect.Left := 0;
    CalcRect.Top := 0;
    DoDrawText(CalcRect, (DT_EXPANDTABS or DT_CALCRECT) or WordWraps[WordWrap]);
    Canvas.Handle := 0;
    ReleaseDC(0, DC);
    AAlignment := Alignment;
    if UseRightToLeftAlignment then
      ChangeBiDiModeAlignment(AAlignment);

    if AAlignment = taRightJustify then
      Rect.Left := Rect.Right - CalcRect.Right;

    Rect.Right := Rect.Left + CalcRect.Right;
    Rect.Bottom := Rect.Top + CalcRect.Bottom;
    DoSetBounds := True;
  end;

  if IsGlow then
  begin
    FBoundsWithGlow := True;
    Expand := GetExpansion(FGlowSize);
    Dec(Rect.Left, Expand);
    Dec(Rect.Top, Expand);
    Inc(Rect.Right, Expand);
    Inc(Rect.Bottom, Expand);
    FOldGlowSize := FGlowSize;
    DoSetBounds := True;
  end;

  if DoSetBounds then
  begin
    SetBounds(Rect.Left, Rect.Top, Rect.Right - Rect.Left, Rect.Bottom - Rect.Top);
    FBmp.Width := ClientWidth;
    FBmp.Height := ClientHeight;
  end;
end;

constructor TCustomGlowLabel.Create(AOwner: TComponent);
begin
  inherited;
  FGlow := False;
  FGlowSize := 10;
  FOldGlowSize := 0;
  FBoundsWithGlow := False;

  ColorShadow := clBlack;
  FShadowStyle := ssGlow;
  FBmp := TBitmap.Create;
  FBmp.PixelFormat := pf24bit;

  FFont:= TFont.Create;
  FFont.Name:= Self.Font.Name;
  FFont.Color:= Self.Font.Color;
  FFont.Size:= Self.Font.Size;
  FFont.Style:= Self.Font.Style;

  InitPos;


  FBmp.Canvas.Brush.Style := bsClear;
  FBlurLevel := 1;
  //SetShadowColor(clNavy);

  FBmp.Width := ClientWidth;
  FBmp.Height := ClientHeight;
  FBmp.Canvas.Font.Assign(Font);
end;

destructor TCustomGlowLabel.Destroy;
begin
  FBmp.Free;
  inherited Destroy;
end;

procedure TCustomGlowLabel.SetShadowColor(const Value: TColor);
var
  C: Integer;
begin
  FColorGlow := Value;
  C := ColorToRGB(FColorGlow);
  GlowColor.R := Byte(C);
  GlowColor.G := Byte(C shr 8);
  GlowColor.B := Byte(C shr 16);
  Invalidate;
end;

procedure TCustomGlowLabel.SetShadowStyle(const Value: TShadowStyle);
begin
  FShadowStyle := Value;
  Invalidate;
end;

procedure TCustomGlowLabel.PaintAlphaTxt(const Text: WideString; TextRect: TRect; TextFlags: Cardinal);
//const
//  txtLeft = DT_END_ELLIPSIS or DT_SINGLELINE or DT_LEFT or DT_VCENTER;
//  txtCenter = DT_END_ELLIPSIS or DT_SINGLELINE or DT_CENTER or DT_VCENTER;
//  txtRight = DT_END_ELLIPSIS or DT_SINGLELINE or DT_RIGHT or DT_VCENTER;
var
  row, slSize, X, Y, off, i: Integer;
  rowSrc, slSizeSrc: Integer;
  slPnt, slPntSrc: PRGB24;
  ts: TSize;
  {Bmp, }BmpAlpha: TBitmap;
  //DC: HDC;
  tr: TRect;
  //t: String;
begin
  i := 0;
  if FShadowStyle <> ssNone then
  begin
    BmpAlpha := TBitmap.Create;
    try
      BmpAlpha.PixelFormat := pf24bit;
      BmpAlpha.Width := FBmp.Width - 2;
      BmpAlpha.Height := FBmp.Height - 2;
      BmpAlpha.Canvas.Brush.Color := clWhite;
      BmpAlpha.Canvas.FillRect(BmpAlpha.Canvas.ClipRect);
      if Text <> '' then
      begin
        BmpAlpha.Canvas.Font.Assign(Font);
        ts := BmpAlpha.Canvas.TextExtent(Caption);
        BmpAlpha.Canvas.Brush.Style := bsClear;
        BmpAlpha.Canvas.Font.Color := clBlack;
        if FShadowStyle <> ssGlow then
          off := 1
        else
          off := 0;
        tr := TextRect;
        tr.Left := tr.Left + off;
        tr.Top := tr.Top + off;
        tr.Right := tr.Right + off;
        tr.Bottom := tr.Bottom + off;
        //Alignment

        DrawText(BmpAlpha.Canvas.Handle, PChar(Caption), Length(Caption),
              tr, TextFlags);

        {case FTextAlign of
          taLeft:
            DrawText(BmpAlpha.Canvas.Handle, PChar(Caption), Length(Caption),
              tr, txtLeft);
          taCenter:
            DrawText(BmpAlpha.Canvas.Handle, PChar(Caption), Length(Caption),
              tr, txtCenter);
          taRight:
            DrawText(BmpAlpha.Canvas.Handle, PChar(Caption), Length(Caption),
              tr, txtRight);
        else
        end;}
      end;
      fxBoxBlur(BmpAlpha, FBlurLevel, 3);
      row := Integer(FBmp.ScanLine[i]);
      slSize := Integer(FBmp.ScanLine[i + 1]) - row;
      rowSrc := Integer(BmpAlpha.ScanLine[0]);
      slSizeSrc := Integer(BmpAlpha.ScanLine[1]) - rowSrc;
      row := row + (i * 3);
      for Y := 0 to BmpAlpha.Height - 1 do
      begin
        slPnt := PRGB24(row);
        slPntSrc := PRGB24(rowSrc);
        for X := 0 to BmpAlpha.Width - 1 do
        begin
          slPnt.R := Byte(slPntSrc.R * (slPnt.R - GlowColor.R)
              shr 8 + GlowColor.R);
          slPnt.G := Byte(slPntSrc.R * (slPnt.G - GlowColor.G)
              shr 8 + GlowColor.G);
          slPnt.B := Byte(slPntSrc.R * (slPnt.B - GlowColor.B)
              shr 8 + GlowColor.B);
          inc(slPnt);
          inc(slPntSrc);
        end;
        inc(row, slSize);
        inc(rowSrc, slSizeSrc);
      end;
    finally
      BmpAlpha.Free;
    end;
  end;
  {tr := TextRect;
  tr.Left := tr.Left + i;
  tr.Top := tr.Top + i;
  tr.Right := tr.Right + i;
  tr.Bottom := tr.Bottom + i;}
  if not Enabled then
    FBmp.Canvas.Font.Color := clBtnShadow//FDisabledColor
  else
    FBmp.Canvas.Font.Color := Font.Color;
  FBmp.Canvas.Brush.Style := bsClear;
  DrawText(FBmp.Canvas.Handle, PChar(Caption), Length(Caption), tr,
        TextFlags);//txtLeft);

  {case FTextAlign of
    taLeft:
      DrawText(FBmp.Canvas.Handle, PChar(Caption), Length(Caption), tr,
        txtLeft);
    taCenter:
      DrawText(FBmp.Canvas.Handle, PChar(Caption), Length(Caption), tr,
        txtCenter);
    taRight:
      DrawText(FBmp.Canvas.Handle, PChar(Caption), Length(Caption), tr,
        txtRight);
  else
  end;}
  //BitBlt(Canvas.Handle, 5, 5, FBmp.Width, FBmp.Height, FBmp.Canvas.Handle, 0, 0, SRCCOPY);
end;

procedure TCustomGlowLabel.DoDrawText(var Rect: TRect; Flags: Integer);

  procedure DoDrawThemeTextEx(DC: HDC; const Text: WideString; TextLen: Integer;
    var TextRect: TRect; TextFlags: Cardinal);
  begin
    PaintAlphaTxt(Text, TextRect, TextFlags);
    //BitBlt(Canvas.Handle, 5, 5, FBmp.Width, FBmp.Height, FBmp.Canvas.Handle, 0, 0, SRCCOPY);

    {FillChar(Options, SizeOf(Options), 0);
    Options.dwSize := SizeOf(Options);
    Options.dwFlags := DTT_TEXTCOLOR or DTT_COMPOSITED;
    if IsGlow then
    begin
      Options.dwFlags := Options.dwFlags or DTT_GLOWSIZE;
      Options.iGlowSize := FGlowSize;
    end;
    Options.crText := ColorToRGB(Canvas.Font.Color);

    with ThemeServices.GetElementDetails(teEditTextNormal) do
      DrawThemeTextEx(ThemeServices.Theme[teEdit], DC, Part, State,
        PWideChar(Text), TextLen, TextFlags, @TextRect, Options);}
  end;

  procedure DrawText(DC: HDC; const Text: WideString; TextLen: Integer;
    var TextRect: TRect; TextFlags: Cardinal);
  var
    LForm: TCustomForm;
    PaintOnGlass: Boolean;
    Expand: Integer;
  begin
    PaintOnGlass := not (csDesigning in ComponentState) and IsShadowStyle;
    //if PaintOnGlass then
    //begin
    //  LForm := GetParentForm(Self);
    //  PaintOnGlass := (LForm <> nil);
    //end;

    if IsGlow and (Flags and DT_CALCRECT = 0) then
    begin
      Expand := GetExpansion(FGlowSize);
      case Alignment of
        taLeftJustify: OffsetRect(TextRect, Expand, 0);
        taRightJustify: OffsetRect(TextRect, -Expand, 0);
      end;

      case Layout of
        tlTop: OffsetRect(TextRect, 0, Expand);
        tlBottom: OffsetRect(TextRect, 0, -Expand);
      end;
    end;

    if PaintOnGlass then//and (Flags and DT_CALCRECT = 0) then
      DoDrawThemeTextEx(DC, Text, TextLen, TextRect, TextFlags)
    else
      Windows.DrawTextW(DC, PWideChar(Text), TextLen, TextRect, TextFlags);
  end;

var
  Text, DText: WideString;
  NewRect: TRect;
  Height, Delim: Integer;
begin
  Text := Caption;
  if (Flags and DT_CALCRECT <> 0) and ((Text = '') or ShowAccelChar and
    (Text[1] = '&') and (Text[2] = #0)) then
      Text := Text + ' ';
  if not ShowAccelChar then
    Flags := Flags or DT_NOPREFIX;
  Flags := DrawTextBiDiModeFlags(Flags);
  Canvas.Font := Font;
  if not Enabled then
  begin
    OffsetRect(Rect, 1, 1);
    Canvas.Font.Color := clBtnHighlight;
    DrawText(Canvas.Handle, Text, Length(Text), Rect, Flags);
    OffsetRect(Rect, -1, -1);
    Canvas.Font.Color := clBtnShadow;
    DrawText(Canvas.Handle, Text, Length(Text), Rect, Flags);
  end
  else
    DrawText(Canvas.Handle, Text, Length(Text), Rect, Flags);
end;

function TCustomGlowLabel.GetExpansion(GlowSize: Integer): Integer;
begin
  Result := Ceil(GlowSize / 2) + 1;
end;

function TCustomGlowLabel.IsGlow: Boolean;
begin
  Result := FGlow and (FGlowSize > 0);
end;

function TCustomGlowLabel.IsShadowStyle: Boolean;
begin
  Result := FShadowStyle <> ssNone;
  case FShadowStyle of
    ssNone: Beep;
    ssGlow: Beep;
    ssDrop: Beep;
  end;
end;

procedure TCustomGlowLabel.SetGlow(const Value: Boolean);
begin
  if FGlow <> Value then
  begin
    FGlow := Value;
    AdjustBounds;
    Invalidate;
  end;
end;

procedure TCustomGlowLabel.SetGlowSize(const Value: Integer);
begin
  if FGlowSize <> Value then
  begin
    FGlowSize := Value;
    AdjustBounds;
    Invalidate;
  end;
end;


procedure Register;
begin
  RegisterComponents('Components', [TGlowLabel]);
end;

end.
