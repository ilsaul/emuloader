unit EKLabel;

interface

uses
  Windows, SysUtils, Classes, Controls, Graphics, mATH;

type
  TEKLabel = class(TGraphicControl)
  private
    pAngle : Integer;
    pColor : tColor;
    pCaption : String;
    pPen : TPen;
    pBrush : TBrush;
    pFont : TFont;
    pTransparent : Boolean;
    function GetCaption: String;
    procedure SetCaption(const Value: String);
    function GetBrush: TBrush;
    function GetFont: TFont;
    function GetPen: TPen;
    procedure SetBrush(const Value: TBrush);
    procedure SetFont(const Value: TFont);
    procedure SetPen(const Value: TPen);
    function getTransparency: Boolean;
    procedure setTransparency(const Value: Boolean);
    function GetColor: TColor;
    procedure SetColor(const Value: TColor);
    function GetAngle: Integer;
    procedure SetAngle(const Value: Integer);
    { Private declarations }
  protected
    { Protected declarations }
  public
    { Public declarations }
    constructor Create(AOwner : TComponent); override;
    destructor Destroy; override;
    procedure Paint; override;
  published
    { Published declarations }
    property Angle : Integer read GetAngle write SetAngle;
    property Color : TColor read GetColor write SetColor;
    property IsTransparent : Boolean read getTransparency write setTransparency;
    property Caption : String read GetCaption write SetCaption;
    property Pen : TPen read GetPen write SetPen;
    property Brush : TBrush read GetBrush write SetBrush;
    property Font : TFont read GetFont write SetFont;
    property Align;
    property Anchors;
  end;

procedure Register;

implementation

uses ComObj;

procedure Register;
begin
  RegisterComponents('Components', [TEKLabel]);
end;

{ TEKLabel }

constructor TEKLabel.Create(AOwner: TComponent);
begin
  pCaption := 'DENEME';
  pFont := TFont.Create;
  pPen := TPen.Create;
  pBrush := TBrush.Create;
  inherited;

end;

destructor TEKLabel.Destroy;
begin
  if Assigned(pFont) then
    pFont.Free;
  if Assigned(pBrush) then
    pBrush.Free;
  if Assigned(pPen) then
    pPen.Free;

  inherited;
end;

function TEKLabel.GetAngle: Integer;
begin
  Result := pAngle;
end;

function TEKLabel.GetBrush: TBrush;
begin
  Result := pBrush;
end;

function TEKLabel.GetCaption: String;
begin
  Result := pCaption;
end;

type
  pPoint = ^TPoint;
function GetPath(DC : HDC; Points : pPoint; Types : PByte; nSize : Integer) : Integer; stdcall; external 'GDI32.DLL';
function PolyDraw(DC : HDC; Points : pPoint; Types : PByte; nSize : Integer) : LongBool; stdcall; external 'GDI32.DLL';

function TEKLabel.GetColor: TColor;
begin
  Result := pColor;
end;

function TEKLabel.GetFont: TFont;
begin
  Result := pFont;
end;

function TEKLabel.GetPen: TPen;
begin
  Result := pPen;
end;

function TEKLabel.getTransparency: Boolean;
begin
  Result := pTransparent;
end;

procedure TEKLabel.Paint;
var
  NumPoints : Integer;
  Points : pPoint;
  Types : pByte;
  RGN : HRGN;
  OldPen : HPEN;
  OldBrush : HBRUSH;
  OldFont : HFONT;
  Flag : Boolean;
  PP : PPoint;
  PS : PPOINT;
  PB : pByte;
  I : Integer;
  Cnt : Integer;
  RGN2 : HRGN;
  X, Y, xx, yy : Integer;
  lf : TagLogFontA;
  FH : THandle;
  SZ : tSize;
begin
  inherited;

  lf.lfHeight := pfont.Height;
  lf.lfWidth := 0;
  lf.lfEscapement := pAngle;
  lf.lfOrientation := pAngle;
  if fsBold in pFont.Style then
    lf.lfWeight := 700
  else
    lf.lfWeight := 400;
  if fsItalic in pFont.Style then
    lf.lfItalic := 1
  else
    lf.lfItalic := 0;
  if fsUnderline in pFont.Style then
    lf.lfUnderline := 1
  else
    lf.lfUnderline := 0;
  if fsStrikeout in pFont.Style then
    lf.lfStrikeOut := 1
  else
    lf.lfStrikeOut := 0;
  lf.lfCharSet := pFont.Charset;
  lf.lfOutPrecision := OUT_DEFAULT_PRECIS;
  lf.lfClipPrecision := CLIP_DEFAULT_PRECIS;
  lf.lfQuality := ANTIALIASED_QUALITY;
  lf.lfPitchAndFamily := DEFAULT_PITCH;
  StrCopy(@lf.lfFaceName[0], PAnsiChar(pFont.Name+#0));
  fh := CreateFontIndirect(lf);

  BeginPath(Canvas.Handle);
  OldFont := SelectObject(Canvas.Handle, FH);
  SetBkMode(Canvas.Handle, TRANSPARENT);

  GetTextExtentPoint32(CANVAS.Handle, PCHAR(PCAPTION+#0),
  LENGTH(pCaption), SZ);
  X := SZ.cx;
  Y := SZ.cy;

  xx := trunc(x * cos((pAngle * 3.14159) / 1800.0));
  xx :=xx + trunc(y * sin((pAngle * 3.14159) / 1800.0));
  yy := trunc(y * cos((pAngle * 3.14159) / 1800.0));
  yy := yy + trunc(x * sin((pAngle * 3.14159) / 1800.0));
  X := (ClientWidth - XX) div 2;
  Y := (ClientHeight - YY) div 2;

  Y := Y - trunc(SZ.CY * cos((pAngle * 3.14159) / 1800.0));
//  RECTANGLE(CANVAS.Handle, X, Y, X+XX, Y+YY);
  Y := Y + YY;
//  ELLIPSE(CANVAS.Handle, X-5, Y-5, X+5, Y+5);
  SelectObject(Canvas.Handle, fh);
//  y := 0;
//  X := 0;


  TextOut(Canvas.Handle, X, Y, PAnsiChar(pCaption+#0), Length(pCaption));
  SelectObject(Canvas.Handle, OldFont);
  DeleteObject(fh);
  EndPath(Canvas.Handle);
  FlattenPath(Canvas.Handle);
  if not pTransparent then
    begin
      Canvas.Brush.Color := pColor;
      Canvas.FillRect(ClientRect);
    end;
  NumPoints := GetPath(Canvas.Handle, Nil, Nil, 0);
  Points := GetMemory(Sizeof(TPoint) * NumPoints);
  if Points <> Nil then
    begin
      Types := GetMemory(NumPoints);
      if Types <> Nil then
        begin

          if GetPath(Canvas.Handle, Points, Types, NumPoints) >= 0 then
            begin
              OldPen := SelectObject(Canvas.Handle, pPen.Handle);
              OldBrush := SelectObject(Canvas.Handle, pBrush.Handle);

              PP := Points;
              PB := Types;
              PS := PP;
              Cnt := 0;
              Flag := False;
              Rgn2 := 0;
              for I := 1 to NumPoints do
                begin
                  if (PB^ = PT_MOVETO)  then
                    begin
                      IF CNT > 0 THEN
                        BEGIN
                          RGN := CreatePolygonRgn(PS^, Cnt, WINDING);
                          if Rgn2 <> 0 then
                            CombineRgn(Rgn, Rgn, Rgn2, rgn_xor);
                          Rgn2 := Rgn;
                          Flag := True;
                          Cnt := 0;
                          PS := PP;
                          INC(PS);
                          FLAG := TRUE;
                        END
//                      ELSE
//                        INC(CNT);
                    end
                  else
                    INC(Cnt);
                  INC(PB);
                  INC(PP);
                end;

              RGN := CreatePolygonRgn(PS^, Cnt, WINDING);
              if Rgn2 <> 0 then
                CombineRgn(Rgn, Rgn, Rgn2, rgn_xor);
              paintRgn(Canvas.Handle, RGN);
              DeleteObject(RGN);
              if Rgn2 <> 0 then
                DeleteObject(RGN2);
              PolyDraw(Canvas.Handle, Points, Types, NumPoints);
              SelectObject(Canvas.Handle, OldBrush);
              SelectObject(Canvas.Handle, OldPen);
            end;
        end;
      FreeMemory(Points);
    end;

end;

procedure TEKLabel.SetAngle(const Value: Integer);
begin
   if pAngle = Value then
      Exit;
   pAngle := Value;
   Paint;
end;

procedure TEKLabel.SetBrush(const Value: TBrush);
begin
  if Value <> pBrush then
    pBrush.Assign(Value);
  Invalidate;
end;

procedure TEKLabel.SetCaption(const Value: String);
begin
  if pCaption = Value then
    Exit;
  pCaption := Value;
  Paint;
end;

procedure TEKLabel.SetColor(const Value: TColor);
begin
  if pColor = Value then
    Exit;
  pColor := Value;
  Paint;
end;

procedure TEKLabel.SetFont(const Value: TFont);
begin
  if Value <> pFont then
    pFont.Assign(Value);
  Paint;
end;

procedure TEKLabel.SetPen(const Value: TPen);
begin
  if Value <> pPen then
    pPen.Assign(Value);
  Paint;
end;

procedure TEKLabel.setTransparency(const Value: Boolean);
begin
  if pTransparent = Value then
    Exit;
  pTransparent := Value;
  Paint;
end;

end.
