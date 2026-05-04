unit uColorUtils;

interface

uses
  Graphics, Windows, SysUtils;

type
  TRGB24 = record R, G, B: Byte end;

  function Blend(Color1, Color2: TColor; A: Byte): TColor;

  procedure RGBtoHSB (const cRed, cGreen, cBlue: Byte; var H, S, B: Word);
  procedure HSBtoRGB (const H,S,B: Word; var cRed, cGreen, cBlue : Byte);

  procedure RGBtoHSL(R, G, B: Integer; out H, S, L: Byte);
  procedure HSLtoRGB(H, S, L: Integer; var R, G, B: Byte);

  procedure HEXtoRGB(const HexColor: String; var R, G, B: Byte);
  function  HEXtoTColor(const HexColor: String; var DelphiColor: TColor): Boolean;
  function  CheckHexForHash(const HexColor: String): String;

  function  RGB2BGR(R, G, B: Byte): COLORREF; overload; // BGR is the TColor format in Delphi 
  function  RGB2BGR(RGB: Integer): COLORREF; overload;

implementation

function Blend(Color1, Color2: TColor; A: Byte): TColor;
var
  c1, c2: LongInt;
  r, g, b, v1, v2: byte;
begin
  A:= Round(2.55 * A);
  c1 := ColorToRGB(Color1);
  c2 := ColorToRGB(Color2);
  v1:= Byte(c1);
  v2:= Byte(c2);
  r:= A * (v1 - v2) shr 8 + v2;
  v1:= Byte(c1 shr 8);
  v2:= Byte(c2 shr 8);
  g:= A * (v1 - v2) shr 8 + v2;
  v1:= Byte(c1 shr 16);
  v2:= Byte(c2 shr 16);
  b:= A * (v1 - v2) shr 8 + v2;
  Result := (b shl 16) + (g shl 8) + r;
end;

function Max3(const A, B, C: Integer): Integer;
asm
  CMP EDX,EAX
  CMOVG EAX,EDX
  CMP ECX,EAX
  CMOVG EAX,ECX
end;

function Min3(const A, B, C: Integer): Integer;
asm
  CMP EDX,EAX
  CMOVL EAX,EDX
  CMP ECX,EAX
  CMOVL EAX,ECX
end;

procedure MinMax(const i,j,k: Byte; var min: Integer; var max: Word); // Inline;
begin
  if i > j then begin
    if i > k then max := i else max := k;
    if j < k then min := j else min := k
  end else begin
    if j > k then max := j else max := k;
    if i < k then min := i else min := k
  end;
end;

function RGB2BGR(R, G, B: Byte): COLORREF; overload;
begin
  Result := (Integer(B) shl 16) + (Integer(G) shl 8) + R;
end;

function RGB2BGR(RGB: Integer): COLORREF; overload;
var
  R, G, B: Integer;
begin
  R      := RGB div $10000;
  G      := ((RGB mod $10000) div $100) shl 8;
  B      := (RGB mod $100) shl 16;
  Result := B + G + R;
end;

procedure RGBtoHSB(const cRed, cGreen, cBlue: Byte; var H, S, B: Word);
var
  Delta, MinValue, tmpH: Integer;
begin
  tmpH:= 0;
  MinMax(cRed, cGreen, cBlue, MinValue, B);
  Delta := B - MinValue;
  if B = 0 then S := 0 else S := (255 * Delta) div B;
  if S = 0 then tmpH := 0
  else begin
    if cRed = B then tmpH := (60 * (cGreen - cBlue)) div Delta
      else
    if cGreen = B then tmpH := 120 + (60 * (cBlue - cRed)) div Delta
      else
    if cBlue = B then tmpH := 240 + (60 * (cRed - cGreen)) div Delta;
    if tmpH < 0 then tmpH := tmpH + 360;
  end;
  H := tmpH;
end;

procedure HSBtoRGB(const H, S, B: Word; var cRed, cGreen, cBlue : Byte);
const
  divisor:  Integer = 255*60;
var
  f    :  Integer;
  hTemp:  Integer;
  p,q,t:  Integer;
  VS   :  Integer;
begin
  if s = 0 then begin
    cRed:=   B;
    cGreen:= B;
    cBlue:=  B;
  end else begin
    if H = 360 then hTemp:= 0 else hTemp:= H;
    f:= hTemp mod 60;
    VS:= B*S;
    p:= B - VS div 255;
    q:= B - (VS*f) div divisor;
    t:= B - (VS*(60 - f)) div divisor;
    hTemp:= hTemp div 60;
    case hTemp of
      0:  begin  cRed := B;   cGreen := t;   cBlue := p  end;
      1:  begin  cRed := q;   cGreen := B;   cBlue := p  end;
      2:  begin  cRed := p;   cGreen := B;   cBlue := t  end;
      3:  begin  cRed := p;   cGreen := q;   cBlue := B  end;
      4:  begin  cRed := t;   cGreen := p;   cBlue := B  end;
      5:  begin  cRed := B;   cGreen := p;   cBlue := q  end;
    end;
  end;
end;

procedure RGBtoHSL(R, G, B: Integer; out H, S, L: Byte);
var
  D, Cmax, Cmin, HL: Integer;
begin
  Cmax := Max3(R, G, B);
  Cmin := Min3(R, G, B);
  L := (Cmax + Cmin) div 2;
  if Cmax = Cmin then begin
    H := 0;
    S := 0;
  end else begin
    D := (Cmax - Cmin) * 255;
    if L <= $7F then S := D div (Cmax + Cmin)
    else             S := D div (255 * 2 - Cmax - Cmin);
    D := D * 6;
    if R = Cmax then
      HL := (G - B) * 255 * 255 div D
    else if G = Cmax then
      HL := 255 * 2 div 6 + (B - R) * 255 * 255 div D
    else
      HL := 255 * 4 div 6 + (R - G) * 255 * 255 div D;
    if HL < 0 then HL := HL + 255 * 2;
    H := HL;
  end;
end;

procedure HSLtoRGB(H, S, L: Integer; var R, G, B: Byte);
var
  V, M, M1, M2, VSF: Integer;
begin
  if L <= $7F then V := L * (256 + S) shr 8
  else             V := L + S - L * S div 255;
  if V <= 0 then begin
    r:= 0; g:= 0; b:= 0;
  end else begin
    M := L * 2 - V;
    H := H * 6;
    VSF := (V - M) * (H and $ff) shr 8;
    M1 := M + VSF;
    M2 := V - VSF;
    case H shr 8 of
      0: begin R:= v; g:= m1; b:= m; end;
      1: begin R:= m2; g:= v; b:= m; end;
      2: begin R:= m; g:= v; b:= m1; end;
      3: begin R:= m; g:= m2; b:= v; end;
      4: begin R:= m1; g:= m; b:= v; end;
      5: begin R:= v; g:= m; b:= m2; end;
    end;
  end;
end;

procedure HEXtoRGB(const HexColor: String; var R, G, B: Byte);
var
  iColor: TColor;
begin
  if HEXtoTColor(HexColor, iColor) then
     begin
       R := GetRValue(iColor);
       G := GetGValue(iColor);
       B := GetBValue(iColor);
     end;
end;

function HEXtoTColor(const HexColor: String; var DelphiColor: TColor): Boolean;
var
  iStr: String;
  iColor: TColor;
begin
  Result:= HexColor <> '';
  if not Result then
     Exit;

  iStr:= CheckHexForHash(HexColor);
  Result:= Length(iStr) = 6;
  if not Result then
     Exit;
  // remember, TColor is bgr not rgb, so you need to switch them around
  iStr:= '$00'+Copy(iStr, 5, 2)+Copy(iStr, 3, 2)+Copy(iStr, 1, 2);
  try
    iColor:= StrToInt(iStr);
  except
    Result:= False;
    Exit;
  end;
  DelphiColor:= iColor;
end;

function CheckHexForHash(const HexColor: String): String;
begin
  Result:= HexColor;
  if HexColor <> '' then
     if HexColor[1] = '#' then
        Delete(Result, 1, 1);
end;               

end.

