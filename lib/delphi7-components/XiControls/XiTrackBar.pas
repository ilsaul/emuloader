{================================================================

    XiTrackBar 1.01
    Written by Eugene Genev

    updates by Ciro Alfredo Consentino:
    v1.02 - September 16, 2019
     - added "Transparent" property, enabled by default
     - added a InflateRect() code in GradientFillRect() function to fix border painting on top of gradient bar
     - added new code to validate start/end color in GradientFillRect() function, if colors are the same, FillRect() is used instead
     - changes to "Paint" function:
        - replaced Pixel[] code by RoundRect() to fix transparent corners when Transparent property is enabled
        - added Brush.Style:= bsClear before painting the border frames, to fix a gradient fill bug
        - added ScrBmp Canvas Lock/UnLock code for faster bitmap drawing
     - added new color schemes "csWhite" and "csDark"
     - fixed var initialization FMin, FMax, FPosition
        - FMax must be initialized first, followed by FMin and finally FPosition
        - properties "Min", "Max", "Position" were initialized incorrectly and set to wrong values at designtime
        - moved constructor Create() to "Public" section, without it, FMin, FMax, FPosition vars fail to initialize correctly
        - added "default 0"  to property Min
        - added "default 10" to property Max
        - added "default 1"  to property Frequency
        - added "default 0"  to property Position

=================================================================}


unit XiTrackBar;

interface

uses
  Windows, Classes, Controls, Graphics, Messages, Forms, Dialogs,
  Math, SysUtils, ExtCtrls, ComCtrls;

type
  TColorScheme = (csCustom, csDesert, csGrass, csSilver, csSky, csRose, csSun, csWhite, csDark);
  TBtnState = (bsUp, bsOver, bsDown, bsOut);
  TFillDirection = (fdHorizontal, fdVertical, fdDiagonal);
  TXiTrackBar = class(TCustomControl)
  private
    FTransparent: Boolean;
    FBackColor: TColor;
    FTickColor: TColor;
    FDisabledTickColor: TColor;
    FSlideBorderColor: TColor;
    FSlideFaceColor: TColor;
    FSlideGradColor: TColor;
    FDisabledSlideBorderColor: TColor;
    FDisabledSlideFaceColor: TColor;
    FDisabledSlideGradColor: TColor;
    FThumbBorderColor: TColor;
    FThumbFaceColor: TColor;
    FThumbGradColor: TColor;
    FOverThumbBorderColor: TColor;
    FOverThumbFaceColor: TColor;
    FOverThumbGradColor: TColor;
    FDownThumbBorderColor: TColor;
    FDownThumbFaceColor: TColor;
    FDownThumbGradColor: TColor;
    FDisabledThumbBorderColor: TColor;
    FDisabledThumbFaceColor: TColor;
    FDisabledThumbGradColor: TColor;

    FColorScheme: TColorScheme;
    FOrientation: TTrackBarOrientation;
    FTickMarks: TTickMark;
    FTickStyle: TTickStyle;
    FSmoothCorners: Boolean;
    FMin: Integer;
    FMax: Integer;
    FFrequency: Integer;
    FPosition: Integer;

    FOnChange: TNotifyEvent;

    FThumbState: TBtnState;
    FSlideRect: TRect;
    FThumbRect: TRect;
    FAbsLength: Integer;
    FAbsPos: Integer;
    FThumbWidth: Integer;
    FThumbLength: Integer;

    procedure SetTransparent(const Value: Boolean);
    procedure SetColors(Index: Integer; Value: TColor);
    procedure SetPosition(Value: Integer);
    procedure SetMin(Value: Integer);
    procedure SetMax(Value: Integer);
    procedure SetFrequency(Value: Integer);
    procedure SetThumbLength(Value: Integer);
    procedure SetThumbWidth(Value: Integer);
    procedure SetTickStyle(Value: TTickStyle);
    procedure SetTickMarks(Value: TTickMark);
    procedure SetOrientation(Value: TTrackBarOrientation);
    procedure SetSmoothCorners(Value: Boolean);
    procedure SetColorScheme(Value: TColorScheme);
    function  PointInRect(X, Y: Integer; R: TRect): Boolean;
  protected
    procedure Paint; override;
    procedure MouseEnter(var msg: TMessage); message CM_MOUSEENTER;
    procedure MouseLeave(var msg: TMessage); message CM_MOUSELEAVE;
    procedure MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Integer); override;
    procedure MouseUp(Button: TMouseButton; Shift: TShiftState; X, Y: Integer); override;
    procedure MouseMove (Shift: TShiftState; X, Y: Integer); override;
    procedure Resize; override;
    procedure CMEnabledChanged (var msg: TMessage); message CM_ENABLEDCHANGED;
    procedure DrawParentImage(Control: TControl; Dest: TCanvas);
  public
    constructor Create(AOwner: TComponent); override;
    procedure   GradientFillRect(Canvas: TCanvas; Rect: TRect;
                                 StartColor, EndColor: TColor; Direction: TFillDirection);
    function    GetColorScheme: TStringList;
  published
    property Transparent: Boolean read FTransparent write SetTransparent default True;
    property BackColor: TColor index 0 read FBackColor write SetColors;
    property TickColor: TColor index 1 read FTickColor write SetColors;
    property DisabledTickColor: TColor index 2 read FDisabledTickColor write SetColors;
    property SlideBorderColor: TColor index 10 read FSlideBorderColor write SetColors;
    property SlideFaceColor: TColor index 11 read FSlideFaceColor write SetColors;
    property SlideGradColor: TColor index 12 read FSlideGradColor write SetColors;
    property DisabledSlideBorderColor: TColor index 13 read FDisabledSlideBorderColor write SetColors;
    property DisabledSlideFaceColor: TColor index 14 read FDisabledSlideFaceColor write SetColors;
    property DisabledSlideGradColor: TColor index 15 read FDisabledSlideGradColor write SetColors;
    property DisabledThumbBorderColor: TColor index 16 read FDisabledThumbBorderColor write SetColors;
    property DisabledThumbFaceColor: TColor index 17 read FDisabledThumbFaceColor write SetColors;
    property DisabledThumbGradColor: TColor index 18 read FDisabledThumbGradColor write SetColors;
    property ThumbBorderColor: TColor index 20 read FThumbBorderColor write SetColors;
    property ThumbFaceColor: TColor index 21 read FThumbFaceColor write SetColors;
    property ThumbGradColor: TColor index 22 read FThumbGradColor write SetColors;
    property OverThumbBorderColor: TColor index 30 read FOverThumbBorderColor write SetColors;
    property OverThumbFaceColor: TColor index 31 read FOverThumbFaceColor write SetColors;
    property OverThumbGradColor: TColor index 32 read FOverThumbGradColor write SetColors;
    property DownThumbBorderColor: TColor index 40 read FDownThumbBorderColor write SetColors;
    property DownThumbFaceColor: TColor index 41 read FDownThumbFaceColor write SetColors;
    property DownThumbGradColor: TColor index 42 read FDownThumbGradColor write SetColors;
    property SmoothCorners: Boolean read FSmoothCorners write SetSmoothCorners;
    property ColorScheme: TColorScheme read FColorScheme write SetColorScheme;
    property Max: Integer read FMax write SetMax default 10;
    property Min: Integer read FMin write SetMin default 0;
    property Position: Integer read FPosition write SetPosition default 0;
    property Frequency: Integer read FFrequency write SetFrequency default 1;
    property TickStyle: TTickStyle read FTickStyle write SetTickStyle;
    property TickMarks: TTickMark read FTickMarks write SetTickMarks;
    property Orientation: TTrackBarOrientation read FOrientation write SetOrientation;

    property Align;
    property Anchors;
    property BorderWidth;
    property Constraints;
    property Ctl3D;
    property Cursor;
    property DragCursor;
    property DragKind;
    property DragMode;
    property Enabled;
    property HelpContext;
  //  property HelpKeyword;
  //  property HelpType;
    property Hint;
    property ParentShowHint;
    property PopupMenu;
    property ShowHint;
    // property TabOrder;
    // property TabStop;
    property Tag;
    property Visible;

    property OnChange: TNotifyEvent read FOnChange write FOnChange;
end;


procedure Register;

{//$R XiTrackBar.res}

implementation

procedure Register;
begin
  RegisterComponents('XiControls', [TXiTrackBar]);
end;

constructor TXiTrackBar.Create(AOwner: TComponent);
begin
  inherited;
  Width:= 100;
  Height:= 28;
  FThumbLength:= 20;
  FThumbWidth:= 10;
  FMin:= 0;
  FMax:= 10;
  FFrequency:= 1;
  FPosition := 0;
  FSmoothCorners:= True;
  FBackColor:= clBtnFace;
  ColorScheme:= csDesert;

  FThumbState:= bsOut;
  FTransparent:= True;
end;

procedure TXiTrackBar.DrawParentImage(Control: TControl; Dest: TCanvas);
var
  SaveIndex: Integer;
  DC: HDC;
  Position: TPoint;
begin
  with Control do
  begin
    if Parent = nil then
       Exit;

    DC := Dest.Handle;
    SaveIndex := SaveDC(DC);
    GetViewportOrgEx(DC, Position);
    SetViewportOrgEx(DC, Position.X - Left, Position.Y - Top, nil);
    IntersectClipRect(DC, 0, 0, Parent.ClientWidth, Parent.ClientHeight);

    Parent.Perform(WM_ERASEBKGND, DC, 0);
    Parent.Perform(WM_PAINT, DC, 0);

    RestoreDC(DC, SaveIndex);
  end;
end;

procedure TXiTrackBar.SetTransparent(const Value: Boolean);
begin
  if FTransparent <> Value then
  begin
    FTransparent := Value;
    RecreateWnd;
  end;
end;

procedure TXiTrackBar.Paint;
var
  SlideBorderColor, SlideFaceColor, SlideGradColor, TickColor: TColor;
  ThumbBorderColor, ThumbFaceColor, ThumbGradColor: TColor;
  ScrBmp: TBitmap;
  i: integer;
begin
  SlideBorderColor:= FSlideBorderColor;
  SlideFaceColor:= FSlideFaceColor;
  SlideGradColor:= FSlideGradColor;
  TickColor:= FTickColor;
  Color:= FBackColor;

  case FThumbState of
    bsOut:  begin
              ThumbBorderColor:= FThumbBorderColor;
              ThumbFaceColor:= FThumbFaceColor;
              ThumbGradColor:= FThumbGradColor;
            end;
    bsOver: begin
              ThumbBorderColor:= FOverThumbBorderColor;
              ThumbFaceColor:= FOverThumbFaceColor;
              ThumbGradColor:= FOverThumbGradColor;
            end;
    bsDown: begin
              ThumbBorderColor:= FDownThumbBorderColor;
              ThumbFaceColor:= FDownThumbFaceColor;
              ThumbGradColor:= FDownThumbGradColor;
            end;
  end;

  if not Enabled then begin
    SlideBorderColor:= FDisabledSlideBorderColor;
    SlideFaceColor:= FDisabledSlideFaceColor;
    SlideGradColor:= FDisabledSlideGradColor;
    ThumbBorderColor:= FDisabledThumbBorderColor;
    ThumbFaceColor:= FDisabledThumbFaceColor;
    ThumbGradColor:= FDisabledThumbGradColor;
    TickColor:= FDisabledTickColor;
  end;

  ScrBmp:= TBitmap.Create;
  ScrBmp.Width:= ClientWidth;
  ScrBmp.Height:= ClientHeight;

  ScrBmp.Canvas.Lock;

  if FTransparent then
     DrawParentImage(Self, ScrBmp.Canvas)
  else
     begin
       ScrBmp.Canvas.Brush.Style:= bsSolid;
       ScrBmp.Canvas.Brush.Color:= Color;
       ScrBmp.Canvas.Rectangle(-1, -1, ScrBmp.Width+1, ScrBmp.Height+1);
     end;

  if FOrientation = trHorizontal then begin
    FThumbLength:= ClientHeight - 8;
    FThumbWidth:= FThumbLength div 2;
    FAbsLength:= ClientWidth - FThumbWidth;

    FThumbRect.Top:= 4;
    FThumbRect.Bottom:= FThumbRect.Top + FThumbLength;
    FThumbRect.Left:= FAbsPos;
    FThumbRect.Right:= FThumbRect.Left + (FThumbRect.Bottom - FThumbRect.Top) div 2;

    FSlideRect.Left:= 0;
    FSlideRect.Right:= ClientWidth;
    FSlideRect.Top:= ClientHeight div 3 + 1;
    FSlideRect.Bottom:= ClientHeight - FSlideRect.Top;
  end else begin
    FThumbLength:= ClientWidth - 8;
    FThumbWidth:= FThumbLength div 2;
    FAbsLength:= ClientHeight - FThumbWidth;

    FPosition:= Round(FAbsPos * (FMax - FMin) / FAbsLength) + FMin;
    FAbsPos:= Round((FAbsLength / (FMax - FMin)) * (FPosition - FMin));

    FThumbRect.Left:= 4;
    FThumbRect.Right:= FThumbRect.Left + FThumbLength;
    FThumbRect.Top:= FAbsPos;
    FThumbRect.Bottom:= FThumbRect.Top + FThumbWidth;

    FSlideRect.Left:= ClientWidth div 3 + 1;
    FSlideRect.Right:= ClientWidth - FSlideRect.Left;
    FSlideRect.Top:= 0;
    FSlideRect.Bottom:= ClientHeight;
  end;

  with ScrBmp.Canvas do
  begin
    Brush.Style:= bsClear;

    if FOrientation = trHorizontal then
       GradientFillRect(ScrBmp.Canvas, FSlideRect, SlideFaceColor, SlideGradColor, fdVertical)
    else
       GradientFillRect(ScrBmp.Canvas, FSlideRect, SlideFaceColor, SlideGradColor, fdHorizontal);

    Pen.Color:= SlideBorderColor;
    Brush.Style:= bsClear;
    if FSmoothCorners then
       RoundRect(FSlideRect.Left, FSlideRect.Top, FSlideRect.Right, FSlideRect.Bottom, 2, 2)
    else
       Rectangle(FSlideRect.Left, FSlideRect.Top, FSlideRect.Right, FSlideRect.Bottom);

    if FOrientation = trHorizontal then
       GradientFillRect(ScrBmp.Canvas, FThumbRect, ThumbFaceColor, ThumbGradColor, fdHorizontal)
    else
       GradientFillRect(ScrBmp.Canvas, FThumbRect, ThumbFaceColor, ThumbGradColor, fdVertical);

    Pen.Color:= ThumbBorderColor;
    Brush.Style:= bsClear;
    if FSmoothCorners then
       RoundRect(FThumbRect.Left, FThumbRect.Top, FThumbRect.Right, FThumbRect.Bottom, 2, 2)
    else
       Rectangle(FThumbRect.Left, FThumbRect.Top, FThumbRect.Right, FThumbRect.Bottom);


    for i:= 0 to (FMax-FMin) do begin
      if FTickStyle = tsNone then Break;
      if FTickStyle = tsManual then if not ((i = 0) or (i = FMax-FMin)) then Continue;
      if not ((i = FMax-FMin)) then if FFrequency <> 0 then if i div FFrequency * FFrequency <> i then Continue;

      Pen.Color:= TickColor;
      if FOrientation = trHorizontal then begin
        if (FTickMarks = tmTopLeft) or (FTickMarks = tmBoth) then begin
          MoveTo(Round(FAbsLength * i / (FMax - FMin) + FThumbWidth / 2), 0);
          LineTo(Round(FAbsLength * i / (FMax - FMin) + FThumbWidth / 2), 3);
        end;
        if (FTickMarks = tmBottomRight) or (FTickMarks = tmBoth) then begin
          MoveTo(Round(FAbsLength * i / (FMax - FMin)) + FThumbWidth div 2, ScrBmp.Height-3);
          LineTo(Round(FAbsLength * i / (FMax - FMin)) + FThumbWidth div 2, ScrBmp.Height);
        end;
      end else begin
        if (FTickMarks = tmTopLeft) or (FTickMarks = tmBoth) then begin
          MoveTo(0, Round(FAbsLength * i / (FMax - FMin)) + (FThumbRect.Bottom - FThumbRect.Top) div 2);
          LineTo(3, Round(FAbsLength * i / (FMax - FMin)) + (FThumbRect.Bottom - FThumbRect.Top) div 2);
        end;
        if (FTickMarks = tmBottomRight) or (FTickMarks = tmBoth) then begin
          MoveTo(ScrBmp.Width-3, Round(FAbsLength * i / (FMax - FMin)) + (FThumbRect.Bottom - FThumbRect.Top) div 2);
          LineTo(ScrBmp.Width, Round(FAbsLength * i / (FMax - FMin)) + (FThumbRect.Bottom - FThumbRect.Top) div 2);
        end;
      end;
    end;
  end;

  ScrBmp.Canvas.UnLock;
  Canvas.Draw(0, 0, ScrBmp);
  ScrBmp.Free;
end;

procedure TXiTrackBar.MouseEnter(var msg: TMessage);
begin
  Paint;
end;

procedure TXiTrackBar.MouseLeave(var msg: TMessage);
begin
  if not Enabled then Exit;
  if FThumbState <> bsDown then FThumbState:= bsOut;
  Paint;
end;

procedure TXiTrackBar.MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if not Enabled then Exit;
  if PointInRect(X, Y, FThumbRect) then FThumbState:= bsDown;
  Paint;
end;

procedure TXiTrackBar.MouseUp(Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if not Enabled then Exit;
  if PointInRect(X, Y, FThumbRect) then FThumbState:= bsOver
  else FThumbState:= bsOut;
  Paint;
end;

procedure TXiTrackBar.MouseMove(Shift: TShiftState; X, Y: Integer);
begin
  if not Enabled then Exit;
  if FThumbState <> bsDown then
    if PointInRect(X, Y, FThumbRect) then FThumbState:= bsOver
    else FThumbState:= bsOut;

  if FThumbState = bsDown then begin
    if FOrientation = trHorizontal then begin
      FAbsPos:= X - FThumbWidth div 2;
      if FAbsPos < 0 then FAbsPos:= 0;
      if FAbsPos > FAbsLength then FAbsPos:= FAbsLength;
    end else begin
      FAbsPos:= Y - 5;
      if FAbsPos < 0 then FAbsPos:= 0;
      if FAbsPos > FAbsLength then FAbsPos:= FAbsLength;
    end;

    FPosition:= Round(FAbsPos * (FMax - FMin) / FAbsLength) + FMin;
    FAbsPos:= Round((FAbsLength / (FMax - FMin)) * (FPosition - FMin));
   if Assigned(FOnChange) then FOnChange(Self);
  end;

  Paint;
end;

procedure TXiTrackBar.Resize;
begin
  Paint;
end;

procedure TXiTrackBar.CMEnabledChanged(var msg: TMessage);
begin
  inherited;
  Paint;
end;

procedure TXiTrackBar.SetColors(Index: Integer; Value: TColor);
begin
  case Index of
    0:  FBackColor:= Value;
    1:  FTickColor:= Value;
    2:  FDisabledTickColor:= Value;
    10: FSlideBorderColor:= Value;
    11: FSlideFaceColor:= Value;
    12: FSlideGradColor:= Value;
    13: FDisabledSlideBorderColor:= Value;
    14: FDisabledSlideFaceColor:= Value;
    15: FDisabledSlideGradColor:= Value;
    16: FDisabledThumbBorderColor:= Value;
    17: FDisabledThumbFaceColor:= Value;
    18: FDisabledThumbGradColor:= Value;
    20: FThumbBorderColor:= Value;
    21: FThumbFaceColor:= Value;
    22: FThumbGradColor:= Value;
    30: FOverThumbBorderColor:= Value;
    31: FOverThumbFaceColor:= Value;
    32: FOverThumbGradColor:= Value;
    40: FDownThumbBorderColor:= Value;
    41: FDownThumbFaceColor:= Value;
    42: FDownThumbGradColor:= Value;
  end;
  FColorScheme:= csCustom;
  Paint;
end;

procedure TXiTrackBar.SetPosition(Value: Integer);
begin
  if (Value < FMin) then Value:= FMin;
  if (Value > FMax) then Value:= FMax;
  FPosition:= Value;
  FAbsPos:= Round((FAbsLength / (FMax - FMin)) * (FPosition - FMin));
  Paint;
  if Assigned(FOnChange) then FOnChange(Self);
end;

procedure TXiTrackBar.SetMin(Value: Integer);
begin
  if Value > FMax then
     Exit;
  FMin:= Value;
  if FPosition < FMin then FPosition:= FMin;
  FAbsPos:= Round((FAbsLength / (FMax - FMin)) * (FPosition - FMin));
  Paint;
end;

procedure TXiTrackBar.SetMax(Value: Integer);
begin
  if Value < FMin then
     Exit;
  FMax:= Value;
  if FPosition > FMax then FPosition:= FMax;
  FAbsPos:= Round((FAbsLength / (FMax - FMin)) * (FPosition - FMin));
  Paint;
end;

procedure TXiTrackBar.SetFrequency(Value: Integer);
begin
  if Value <> FFrequency then
     begin
       FFrequency:= Value;
       Paint;
     end;
end;

procedure TXiTrackBar.SetThumbLength(Value: Integer);
begin
  FThumbLength:= Value;
  Paint;
end;

procedure TXiTrackBar.SetThumbWidth(Value: Integer);
begin
  FThumbWidth:= Value;
  Paint;
end;


procedure TXiTrackBar.SetTickStyle(Value: TTickStyle);
begin
  if Value <> FTickStyle then
     begin
       FTickStyle:= Value;
       Paint;
     end;
end;

procedure TXiTrackBar.SetTickMarks(Value: TTickMark);
begin
  FTickMarks:= Value;
  Paint;
end;

procedure TXiTrackBar.SetOrientation(Value: TTrackBarOrientation);
begin
  FOrientation:= Value;
  Paint;
end;

procedure TXiTrackBar.SetSmoothCorners(Value: Boolean);
begin
  FSmoothCorners:= Value;
  Paint;
end;

procedure TXiTrackBar.SetColorScheme(Value: TColorScheme);
begin
  FColorScheme:= Value;
  case FColorScheme of
    csDesert: begin
                FBackColor:=clBtnFace;
                FTickColor:=$00006A9D;
                FSlideBorderColor:=$000082BF;
                FSlideFaceColor:=$0028B9FF;
                FSlideGradColor:=$00BBE9FF;
                FThumbBorderColor:=$00005B88;
                FThumbFaceColor:=$008CDAFF;
                FThumbGradColor:=$000093D9;
                FOverThumbBorderColor:=$00005680;
                FOverThumbFaceColor:=$005ECBFF;
                FOverThumbGradColor:=$00007BB7;
                FDownThumbBorderColor:=$00005680;
                FDownThumbFaceColor:=$000083C1;
                FDownThumbGradColor:=$001AB5FF;
                FDisabledTickColor:=clSilver;
                FDisabledSlideBorderColor:=$00BEBEBE;
                FDisabledSlideFaceColor:=$00D8D8D8;
                FDisabledSlideGradColor:=$00E8E8E8;
                FDisabledThumbBorderColor:=$00B5B5B5;
                FDisabledThumbFaceColor:=$00EAEAEA;
                FDisabledThumbGradColor:=$00CFCFCF;
              end;
    csGrass:  begin
                FBackColor:=clBtnFace;
                FTickColor:=$001D9A4B;
                FSlideBorderColor:=$0020A452;
                FSlideFaceColor:=$003ED978;
                FSlideGradColor:=$00C1F4D6;
                FThumbBorderColor:=$00126732;
                FThumbFaceColor:=$0082E8AA;
                FThumbGradColor:=$0021AB55;
                FOverThumbBorderColor:=$00156F37;
                FOverThumbFaceColor:=$007CE7A7;
                FOverThumbGradColor:=$001E954A;
                FDownThumbBorderColor:=$00156F37;
                FDownThumbFaceColor:=$0020A251;
                FDownThumbGradColor:=$005EE193;
                FDisabledTickColor:=clSilver;
                FDisabledSlideBorderColor:=$00BEBEBE;
                FDisabledSlideFaceColor:=$00D8D8D8;
                FDisabledSlideGradColor:=$00E8E8E8;
                FDisabledThumbBorderColor:=$00B5B5B5;
                FDisabledThumbFaceColor:=$00EAEAEA;
                FDisabledThumbGradColor:=$00CFCFCF;
              end;
    csSky:    begin
                FBackColor:=clBtnFace;
                FTickColor:=$00C88D2D;
                FSlideBorderColor:=$00F47A00;
                FSlideFaceColor:=$00FFBA75;
                FSlideGradColor:=$00FFE9D2;
                FThumbBorderColor:=$00C66300;
                FThumbFaceColor:=$00FFD9B3;
                FThumbGradColor:=$00FF9224;
                FOverThumbBorderColor:=$00B35900;
                FOverThumbFaceColor:=$00FFCF9F;
                FOverThumbGradColor:=$00F97C00;
                FDownThumbBorderColor:=$00B35900;
                FDownThumbFaceColor:=$00FF8C1A;
                FDownThumbGradColor:=$00FFBF80;
                FDisabledTickColor:=clSilver;
                FDisabledSlideBorderColor:=$00BEBEBE;
                FDisabledSlideFaceColor:=$00D8D8D8;
                FDisabledSlideGradColor:=$00E8E8E8;
                FDisabledThumbBorderColor:=$00B5B5B5;
                FDisabledThumbFaceColor:=$00EAEAEA;
                FDisabledThumbGradColor:=$00CFCFCF;
              end;
    csSun:    begin
                FBackColor:=clBtnFace;
                FTickColor:=$0000A4A4;
                FSlideBorderColor:=$000077AA;
                FSlideFaceColor:=$001AD9FB;
                FSlideGradColor:=$00DAFAFE;
                FThumbBorderColor:=$00004F84;
                FThumbFaceColor:=$00C6FFFF;
                FThumbGradColor:=$0000B8E6;
                FOverThumbBorderColor:=$00004F84;
                FOverThumbFaceColor:=$006AFFFF;
                FOverThumbGradColor:=$00009CC4;
                FDownThumbBorderColor:=$00004F84;
                FDownThumbFaceColor:=$0000B8E6;
                FDownThumbGradColor:=$0091E9FF;
                FDisabledTickColor:=clSilver;
                FDisabledSlideBorderColor:=$00BEBEBE;
                FDisabledSlideFaceColor:=$00D8D8D8;
                FDisabledSlideGradColor:=$00E8E8E8;
                FDisabledThumbBorderColor:=$00B5B5B5;
                FDisabledThumbFaceColor:=$00EAEAEA;
                FDisabledThumbGradColor:=$00CFCFCF;
              end;
    csRose:   begin
                FBackColor:=clBtnFace;
                FTickColor:=$005B5BFF;
                FSlideBorderColor:=$004242FF;
                FSlideFaceColor:=$008282FF;
                FSlideGradColor:=$00C6DBFF;
                FThumbBorderColor:=$000000D7;
                FThumbFaceColor:=$009DC2FF;
                FThumbGradColor:=$006666FF;
                FOverThumbBorderColor:=$000000D7;
                FOverThumbFaceColor:=$008CB8FF;
                FOverThumbGradColor:=$005151FF;
                FDownThumbBorderColor:=$000000D7;
                FDownThumbFaceColor:=$006666FF;
                FDownThumbGradColor:=$008CB8FF;
                FDisabledTickColor:=clSilver;
                FDisabledSlideBorderColor:=$00BEBEBE;
                FDisabledSlideFaceColor:=$00D8D8D8;
                FDisabledSlideGradColor:=$00E8E8E8;
                FDisabledThumbBorderColor:=$00B5B5B5;
                FDisabledThumbFaceColor:=$00EAEAEA;
                FDisabledThumbGradColor:=$00CFCFCF;
              end;
    csSilver: begin
                FBackColor:=clBtnFace;
                FTickColor:=$00888888;
                FSlideBorderColor:=$00727272;
                FSlideFaceColor:=clSilver;
                FSlideGradColor:=$00EAEAEA;
                FThumbBorderColor:=$00616161;
                FThumbFaceColor:=$00E1E1E1;
                FThumbGradColor:=$00A3A3A3;
                FOverThumbBorderColor:=$00747474;
                FOverThumbFaceColor:=clSilver;
                FOverThumbGradColor:=$00959595;
                FDownThumbBorderColor:=$00747474;
                FDownThumbFaceColor:=$00999999;
                FDownThumbGradColor:=$00C1C1C1;
                FDisabledTickColor:=clSilver;
                FDisabledSlideBorderColor:=$00BEBEBE;
                FDisabledSlideFaceColor:=$00D8D8D8;
                FDisabledSlideGradColor:=$00E8E8E8;
                FDisabledThumbBorderColor:=$00B5B5B5;
                FDisabledThumbFaceColor:=$00EAEAEA;
                FDisabledThumbGradColor:=$00CFCFCF;
              end;
    csWhite:  begin
                FBackColor:= $00F1F1F1;
                FTickColor:= $00727272;
                FSlideBorderColor:= $00727272;
                FSlideFaceColor:= clWhite;
                FSlideGradColor:= $00EAEAEA;
                FThumbBorderColor:= $00616161;
                FThumbFaceColor:= clWhite;
                FThumbGradColor:= $00D7D7D7;
                FOverThumbBorderColor:= $00747474;
                FOverThumbFaceColor:= $00D1D1D1;
                FOverThumbGradColor:= $00959595;
                FDownThumbBorderColor:= $00747474;
                FDownThumbFaceColor:= $00999999;
                FDownThumbGradColor:= $00C1C1C1;
                FDisabledTickColor:= clSilver;
                FDisabledSlideBorderColor:= $00BEBEBE;
                FDisabledSlideFaceColor:= $00D8D8D8;
                FDisabledSlideGradColor:= $00E8E8E8;
                FDisabledThumbBorderColor:= $00B5B5B5;
                FDisabledThumbFaceColor:= $00EAEAEA;
                FDisabledThumbGradColor:= $00CFCFCF;
              end;
    csDark:   begin
                FBackColor:= $00272727;
                FTickColor:= $00bfdfe0;
                FSlideBorderColor:= $00141414;
                FSlideFaceColor:= $00323232;
                FSlideGradColor:= $00505050;
                FThumbBorderColor:= $00141414;
                FThumbFaceColor:= clGray;
                FThumbGradColor:= $004C4C4C;
                FOverThumbBorderColor:= $00141414;
                FOverThumbFaceColor:= clMedGray;
                FOverThumbGradColor:= $00959595;
                FDownThumbBorderColor:= $00141414;
                FDownThumbFaceColor:= $00606060;
                FDownThumbGradColor:= $00393939;
                FDisabledTickColor:= clGray;
                FDisabledSlideBorderColor:= $00242424;
                FDisabledSlideFaceColor:= $00272727;
                FDisabledSlideGradColor:= $00323232;
                FDisabledThumbBorderColor:= $00242424;
                FDisabledThumbFaceColor:= $00323232;
                FDisabledThumbGradColor:= $00424242;
              end;
  end;
  Invalidate;
end;

function TXiTrackBar.GetColorScheme: TStringList;
const
  t = '                ';
begin
  Result:= TStringList.Create;
  with Result do begin
    Add(t+'FBackColor:='+ColorToString(FBackColor)+';');
    Add(t+'FTickColor:='+ColorToString(FTickColor)+';');
    Add(t+'FSlideBorderColor:='+ColorToString(FSlideBorderColor)+';');
    Add(t+'FSlideFaceColor:='+ColorToString(FSlideFaceColor)+';');
    Add(t+'FSlideGradColor:='+ColorToString(FSlideGradColor)+';');
    Add(t+'FThumbBorderColor:='+ColorToString(FThumbBorderColor)+';');
    Add(t+'FThumbFaceColor:='+ColorToString(FThumbFaceColor)+';');
    Add(t+'FThumbGradColor:='+ColorToString(FThumbGradColor)+';');
    Add(t+'FOverThumbBorderColor:='+ColorToString(FOverThumbBorderColor)+';');
    Add(t+'FOverThumbFaceColor:='+ColorToString(FOverThumbFaceColor)+';');
    Add(t+'FOverThumbGradColor:='+ColorToString(FOverThumbGradColor)+';');
    Add(t+'FDownThumbBorderColor:='+ColorToString(FDownThumbBorderColor)+';');
    Add(t+'FDownThumbFaceColor:='+ColorToString(FDownThumbFaceColor)+';');
    Add(t+'FDownThumbGradColor:='+ColorToString(FDownThumbGradColor)+';');

    Add(t+'FDisabledTickColor:='+ColorToString(FDisabledTickColor)+';');
    Add(t+'FDisabledSlideBorderColor:='+ColorToString(FDisabledSlideBorderColor)+';');
    Add(t+'FDisabledSlideFaceColor:='+ColorToString(FDisabledSlideFaceColor)+';');
    Add(t+'FDisabledSlideGradColor:='+ColorToString(FDisabledSlideGradColor)+';');
    Add(t+'FDisabledThumbBorderColor:='+ColorToString(FDisabledThumbBorderColor)+';');
    Add(t+'FDisabledThumbFaceColor:='+ColorToString(FDisabledThumbFaceColor)+';');
    Add(t+'FDisabledThumbGradColor:='+ColorToString(FDisabledThumbGradColor)+';');
  end;
end;

procedure TXiTrackBar.GradientFillRect(Canvas: TCanvas; Rect: TRect;
                StartColor, EndColor: TColor; Direction: TFillDirection);
var
  Steps: Integer;
  StartR, StartG, StartB, EndR, EndG, EndB: Byte;
  CrrR, CrrG, CrrB: Double;
  IncR, IncG, incB: Double;
  i: integer;
  ARect: TRect;
begin
  ARect:= Rect;
  InflateRect(ARect, -1, -1);
  if StartColor = EndColor then
     begin
       Canvas.Brush.Color:= StartColor;
       Canvas.FillRect(ARect);
       Exit;
     end;
  case Direction of
    fdVertical:   Steps:= ARect.Bottom - ARect.Top;
    fdHorizontal: Steps:= ARect.Right - ARect.Left;
    fdDiagonal:   Steps:= ARect.Bottom - ARect.Top + ARect.Right - ARect.Left;
  end;

  StartR:= GetRValue(StartColor);  EndR:= GetRValue(EndColor);
  StartG:= GetGValue(StartColor);  EndG:= GetGValue(EndColor);
  StartB:= GetBValue(StartColor);  EndB:= GetBValue(EndColor);
                 
  IncR:= (EndR - StartR) / steps;
  IncG:= (EndG - StartG) / steps;
  IncB:= (EndB - StartB) / steps;

  CrrR:= StartR;
  CrrG:= StartG;
  CrrB:= StartB;

  for i:= 0 to Steps-1 do begin
    Canvas.Pen.Color:= RGB(Round(CrrR), Round(CrrG), Round(CrrB));
    case Direction of
      fdVertical:   begin
                      Canvas.MoveTo(ARect.Left, ARect.Top + i);
                      Canvas.LineTo(ARect.Right, ARect.Top + i);
                    end;
      fdHorizontal: begin
                      Canvas.MoveTo(ARect.Left+i, ARect.Top);
                      Canvas.LineTo(ARect.Left+i, ARect.Bottom);
                    end;
      fdDiagonal:   begin
                      Canvas.MoveTo(i, ARect.Top);
                      Canvas.LineTo(ARect.Left, i);
                    end;
    end;
    CrrR:= CrrR + IncR;
    CrrG:= CrrG + IncG;
    CrrB:= CrrB + IncB;
  end;
end;

function TXiTrackBar.PointInRect(X, Y: Integer; R: TRect): Boolean;
begin
  if (X > R.Left) and (X < R.Right) and (Y > R.Top) and (Y < R.Bottom) then
    Result:= true
  else
    Result:= false;
end;


end.
