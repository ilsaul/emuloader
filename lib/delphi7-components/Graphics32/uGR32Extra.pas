// Changes:
//  - Replaced the "Extended" type for "Single" type (Jan 26, 2007)
//  - Removed the Round() from the "SetPosition" function so component select
//    all values from the "min" / "max" settings

unit uGR32Extra;

interface



uses Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
     ExtCtrls, GR32_Image, GR32, GR32_RangeBars;

type
  TCustomGaugeBar2 = class(TArrowBar)
  private
    FHandleSize: Integer;
    FLargeChange: Single;
    FMax: Single;
    FMin: Single;
    FPosition: Single;
    FSmallChange: Single;
    FThreeDecimalDigits: Boolean;
    procedure SetHandleSize(Value: Integer);
    procedure SetMax(Value: Single);
    procedure SetMin(Value: Single);
    procedure SetPosition(Value: Single);
    procedure SetLargeChange(Value: Single);
    procedure SetSmallChange(Value: Single);
    procedure SetThreeDecimalDigits(Value: Boolean);
  protected
    procedure AdjustPosition;
    //function  DoMouseWheel(Shift: TShiftState; WheelDelta: Integer;
    //  MousePos: TPoint): Boolean; override;
    function  GetHandleRect: TRect; override;
    function  GetHandleSize: Integer;
    procedure MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Integer); override;
    procedure MouseMove(Shift: TShiftState; X, Y: Integer); override;
    procedure TimerHandler(Sender: TObject); override;
  public
    constructor Create(AOwner: TComponent); override;
    property HandleSize: Integer read FHandleSize write SetHandleSize default 0;
    property LargeChange: Single read FLargeChange write SetLargeChange;
    property Max: Single read FMax write SetMax;
    property Min: Single read FMin write SetMin;
    property Position: Single read FPosition write SetPosition;
    property SmallChange: Single read FSmallChange write SetSmallChange;
    property ThreeDecimalDigits: Boolean read FThreeDecimalDigits write SetThreeDecimalDigits default False;
    property OnChange;
    property OnUserChange;
  end;

  TGaugeBar2 = class(TCustomGaugeBar2)
  published
    property Align;
    property Anchors;
    property Constraints;
    property Color;
    property Backgnd;
    property BorderStyle;
    property ButtonSize;
    property Enabled;
    property HandleColor;
    property ButtonColor;
    property HighLightColor;
    property ShadowColor;
    property BorderColor;
    property ArrowColor; // added by Ciro Alfredo Consentino (July 12, 2019)
    property HandleSize;
    property Kind;
    property LargeChange;
    property Max;
    property Min;
    property ThreeDecimalDigits;
    property ShowArrows;
    property ShowHint; // added by Ciro Alfredo Consentino (February 26, 2007)
    property ShowHandleGrip;
    property Style;
    property SmallChange;
    property Visible;
    property Position;
    property OnChange;
    property OnDragDrop;
    property OnDragOver;
    property OnEndDrag;
    property OnMouseDown;
    property OnMouseMove;
    property OnMouseUp;
    property OnStartDrag;
    property OnUserChange;
  end;

procedure Register;

implementation

{ TCustomGaugeBar2 }

procedure Register;
begin
  RegisterComponents('Graphics32', [TGaugeBar2]);
end;


// GaugeBar2 with float values, adapted by Ciro Aflredo Consentino

procedure TCustomGaugeBar2.AdjustPosition;
begin
  if Position < Min then Position := Min
  else if Position > Max then Position := Max;
end;

constructor TCustomGaugeBar2.Create(AOwner: TComponent);
begin
  inherited;
  FLargeChange := 0.1;
  FMax := 100;
  FSmallChange := 0.01;
  FThreeDecimalDigits:= False;
end;

{function TCustomGaugeBar2.DoMouseWheel(Shift: TShiftState;
  WheelDelta: Integer; MousePos: TPoint): Boolean;
begin
  Result := inherited DoMouseWheel(Shift, WheelDelta, MousePos);
  if not Result then Position := Position + FSmallChange * WheelDelta div 120;
  Result := True;
end;}

function TCustomGaugeBar2.GetHandleRect: TRect;
var
  Sz, HandleSz: Integer;
  Horz: Boolean;
  Pos: Integer;
begin
  Result := GetTrackBoundary;
  Horz := Kind = sbHorizontal;
  HandleSz := GetHandleSize;

  if Horz then Sz := Result.Right - Result.Left
  else Sz := Result.Bottom - Result.Top;

  // Pos := Round((Position - Min) / (Max - Min) * (Sz - GetHandleSize)); // new code...!!!
  Pos := Round((Position - Min) * (Sz - GetHandleSize) / (Max - Min));

  if Horz then
  begin
    Inc(Result.Left, Pos);
    Result.Right := Result.Left + HandleSz;
  end
  else
  begin
    Inc(Result.Top, Pos);
    Result.Bottom := Result.Top + HandleSz;
  end;
end;

function TCustomGaugeBar2.GetHandleSize: Integer;
var
  R: TRect;
  Sz: Integer;
begin
  Result := HandleSize;
  if Result = 0 then
  begin
    if Kind = sbHorizontal then Result := ClientHeight else Result := ClientWidth;
  end;
  R := GetTrackBoundary;
  if Kind = sbHorizontal then Sz := R.Right - R.Left
  else Sz := R.Bottom - R.Top;
  if Sz - Result < 1 then Result := Sz - 1;
  if Result < 0 then Result := 0;
end;

procedure TCustomGaugeBar2.MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  if DragZone = zHandle then
  begin
    StopDragTracking;
    PosBeforeDrag := Position;
  end;
end;

procedure TCustomGaugeBar2.MouseMove(Shift: TShiftState; X, Y: Integer);
var
  Delta: Single;
  R: TRect;
  ClientSz: Integer;
begin
  inherited;
  if DragZone = zHandle then
  begin
    if Kind = sbHorizontal then Delta := X - StoredX else Delta := Y - StoredY;
    R := GetTrackBoundary;

    if Kind = sbHorizontal then ClientSz := R.Right - R.Left
    else ClientSz := R.Bottom - R.Top;

    Delta := Delta * (Max - Min) / (ClientSz - GetHandleSize);
    
    GenChange := True;
    Position := Round(PosBeforeDrag + Delta);
    GenChange := False;
  end;
end;

procedure TCustomGaugeBar2.SetHandleSize(Value: Integer);
begin
  if Value < 0 then Value := 0;
  if Value <> FHandleSize then
  begin
    FHandleSize := Value;
    Invalidate;
  end;
end;

procedure TCustomGaugeBar2.SetLargeChange(Value: Single);
begin
  if FThreeDecimalDigits then
     begin
       if Value < 0.001 then Value := 0.001;
     end
  else
     begin
       if Value < 0.01 then Value := 0.01;
     end;
  FLargeChange := Value;
end;

procedure TCustomGaugeBar2.SetMax(Value: Single);
begin
  if (Value <= FMin) and not (csLoading in ComponentState) then
     begin
       if FThreeDecimalDigits then
          Value := FMin + 0.001
       else
          Value := FMin + 0.01;
     end;
  if Value <> FMax then
  begin
    FMax := Value;
    AdjustPosition;
    Invalidate;
  end;
end;

procedure TCustomGaugeBar2.SetMin(Value: Single);
begin
  if (Value >= FMax) and not (csLoading in ComponentState) then
     begin
       if FThreeDecimalDigits then
          Value := FMax - 0.001
       else
          Value := FMax - 0.01;
     end;
  if Value <> FMin then
  begin
    FMin := Value;
    AdjustPosition;
    Invalidate;
  end;
end;

procedure TCustomGaugeBar2.SetPosition(Value: Single);
begin
  if Value < Min then Value := Min
  else if Value > Max then Value := Max;
  // original code: // if Round(FPosition) <> Value then
  if FPosition <> Value then
  begin
    FPosition := Value;
    Invalidate;
    DoChange;
  end;
end;

procedure TCustomGaugeBar2.SetSmallChange(Value: Single);
begin
  if FThreeDecimalDigits then
     begin
       if Value < 0.001 then Value := 0.001;
     end
  else
     begin
       if Value < 0.01 then Value := 0.01;
     end;
  FSmallChange := Value;
end;

procedure TCustomGaugeBar2.SetThreeDecimalDigits(Value: Boolean);
begin
  FThreeDecimalDigits:= Value;
end;

procedure TCustomGaugeBar2.TimerHandler(Sender: TObject);
var
  OldPosition: Single;
  Pt: TPoint;

  function MousePos: TPoint;
  begin
    Result := ScreenToClient(Mouse.CursorPos);
    if Result.X < 0 then Result.X := 0;
    if Result.Y < 0 then Result.Y := 0;
    if Result.X >= ClientWidth then Result.X := ClientWidth - 1;
    if Result.Y >= ClientHeight then Result.Y := ClientHeight - 1
  end;

begin
  inherited;
  GenChange := True;
  OldPosition := Position;

  case DragZone of
    zBtnPrev:
      begin
        Position := Position - SmallChange;
        if Position = OldPosition then StopDragTracking;
      end;

    zBtnNext:
      begin
        Position := Position + SmallChange;
        if Position = OldPosition then StopDragTracking;
      end;

    zTrackNext:
      begin
        Pt := MousePos;
        if GetZone(Pt.X, Pt.Y) in [zTrackNext, zBtnNext] then
        Position := Position + LargeChange;
      end;

    zTrackPrev:
      begin
        Pt := MousePos;
        if GetZone(Pt.X, Pt.Y) in [zTrackPrev, zBtnPrev] then
        Position := Position - LargeChange;
      end;
  end;
  GenChange := False;
end;


end.
