unit BevelEx;

interface

uses Messages, Windows, SysUtils, Classes,
     Controls, Forms, Menus, Graphics, StdCtrls;

type
  TBevelStyleEx = (bsLowered, bsRaised, bsCustomColors);
  TBevelShapeEx = (bsBox, bsFrame, bsTopLine, bsBottomLine, bsLeftLine, bsRightLine, bsSpacer, bsDualFrame);

  TBevelEx = class(TGraphicControl)
  private
    FStyle: TBevelStyleEx;
    FShape: TBevelShapeEx;
    FCustomColor1: TColor;
    FCustomColor2: TColor;
    procedure SetStyle(Value: TBevelStyleEx);
    procedure SetShape(Value: TBevelShapeEx);
    procedure SetCustomColor1(Value: TColor);
    procedure SetCustomColor2(Value: TColor);
  protected
    procedure Paint; override;
  public
    constructor Create(AOwner: TComponent); override;
  published
    property Align;
    property Anchors;
    property Constraints;
    property ParentShowHint;
    property Shape: TBevelShapeEx read FShape write SetShape default bsBox;
    property ShowHint;
    property Style: TBevelStyleEx read FStyle write SetStyle default bsLowered;
    property Visible;

    property CustomColor1: TColor read FCustomColor1 write SetCustomColor1 default $0078695b; // RGB(171, 173, 179)
    property CustomColor2: TColor read FCustomColor2 write SetCustomColor2 default $00323232; // RGB(50, 50 ,50);
  end;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('Components', [TBevelEx]);
end;

constructor TBevelEx.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  ControlStyle := ControlStyle + [csReplicatable];
  FStyle := bsLowered;
  FShape := bsBox;
  FCustomColor1 := $0078695b;
  FCustomColor2 := $00323232;
  Width  := 50;
  Height := 50;
end;

procedure TBevelEx.SetStyle(Value: TBevelStyleEx);
begin
  if Value <> FStyle then
  begin
    FStyle := Value;
    Invalidate;
  end;
end;

procedure TBevelEx.SetShape(Value: TBevelShapeEx);
begin
  if Value <> FShape then
  begin
    FShape := Value;
    Invalidate;
  end;
end;

procedure TBevelEx.SetCustomColor1(Value: TColor);
begin
  if Value <> FCustomColor1 then
     begin
       FCustomColor1 := Value;
       Invalidate;
     end;
end;

procedure TBevelEx.SetCustomColor2(Value: TColor);
begin
  if Value <> FCustomColor2 then
     begin
       FCustomColor2 := Value;
       Invalidate;
     end;
end;

procedure TBevelEx.Paint;
const
  XorColor = $00FFD8CE;
var
  Color1, Color2: TColor;
  Temp: TColor;
  ARect: TRect;

  procedure BevelRect(const R: TRect);
  begin
    with Canvas do
    begin
      Pen.Color := Color1;
      PolyLine([Point(R.Left, R.Bottom), Point(R.Left, R.Top),
        Point(R.Right, R.Top)]);
      Pen.Color := Color2;
      PolyLine([Point(R.Right, R.Top), Point(R.Right, R.Bottom),
        Point(R.Left, R.Bottom)]);
    end;
  end;

  procedure BevelLine(var C: TColor; X1, Y1, X2, Y2: Integer);
  begin
    if C = clNone then Exit;
    with Canvas do
    begin
      Pen.Color := C;
      MoveTo(X1, Y1);
      LineTo(X2, Y2);
    end;
  end;

begin
  with Canvas do
  begin
    if (csDesigning in ComponentState) then
    begin
      if (FShape = bsSpacer) then
      begin
        Pen.Style := psDot;
        Pen.Mode := pmXor;
        Pen.Color := XorColor;
        Brush.Style := bsClear;
        Rectangle(0, 0, ClientWidth, ClientHeight);
        Exit;
      end
      else
      begin
        Pen.Style := psSolid;
        Pen.Mode  := pmCopy;
        Pen.Color := clBlack;
        Brush.Style := bsSolid;
      end;
    end;

    Pen.Width := 1;

    case FStyle of
      bsCustomColors:
        begin
          Color1 := FCustomColor1;
          Color2 := FCustomColor2;
        end;
      bsLowered:
        begin
          Color1 := clBtnShadow;
          Color2 := clBtnHighlight;
        end;
      bsRaised:
        begin
          Color1 := clBtnHighlight;
          Color2 := clBtnShadow;
        end;
    end;

    case FShape of
      bsBox: BevelRect(Rect(0, 0, Width - 1, Height - 1));
      bsFrame:
        begin
          Temp := Color1;
          Color1 := Color2;
          BevelRect(Rect(1, 1, Width - 1, Height - 1));
          Color2 := Temp;
          Color1 := Temp;
          BevelRect(Rect(0, 0, Width - 2, Height - 2));
        end;
      bsDualFrame:
        begin
          Brush.Style:= bsClear;
          ARect:= Canvas.ClipRect;
          InflateRect(ARect, -1, -1);
          Pen.Color:= Color2;
          Rectangle(ARect);
          Pen.Color:= Color1;
          Rectangle(ClipRect);
        end;
      bsTopLine:
        begin
          BevelLine(Color1, 0, 0, Width, 0);
          BevelLine(Color2, 0, 1, Width, 1);
        end;
      bsBottomLine:
        begin
          BevelLine(Color1, 0, Height - 2, Width, Height - 2);
          BevelLine(Color2, 0, Height - 1, Width, Height - 1);
        end;
      bsLeftLine:
        begin
          BevelLine(Color1, 0, 0, 0, Height);
          BevelLine(Color2, 1, 0, 1, Height);
        end;
      bsRightLine:
        begin
          BevelLine(Color1, Width - 2, 0, Width - 2, Height);
          BevelLine(Color2, Width - 1, 0, Width - 1, Height);
        end;
    end;
  end;
end;

end.
 