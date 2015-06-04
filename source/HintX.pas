unit HintX;

interface

uses
  Windows, Messages, Controls, Classes, Graphics, SysUtils,
  Dialogs;

type
  TIconHintX = class(THintWindow)
  private
    FIsPainting: Boolean;
    FIsActivating: boolean;
  protected
    procedure Paint; override;
    procedure CreateParams(var Params: TCreateParams); override;
    procedure WMEraseBkGnd(var Message:TMessage); message WM_ERASEBKGND;
  public
    procedure ActivateHint(Rect: TRect; const AHint: string); override;
    constructor Create(AOwner: TComponent); override;
    function CalcHintRect(MaxWidth: Integer; const AHint: string; AData: Pointer): TRect; override;
  end;

implementation

uses Forms;

{ TIconHintX }

procedure DrawGradient(Canvas: TCanvas; FromColor,ToColor: TColor; Steps: Integer;R:TRect; Direction: Boolean);
var
  diffr,startr,endr: Integer;
  diffg,startg,endg: Integer;
  diffb,startb,endb: Integer;
  iend: Integer;
  rstepr,rstepg,rstepb,rstepw: Real;
  i,stepw: Word;
begin
  if Steps = 0 then
    Steps := 1;

  if R.Right <= R.Left then
    Exit;
  if R.Bottom <= R.Top then
    Exit;

  FromColor := ColorToRGB(FromColor);
  ToColor := ColorToRGB(ToColor);

  startr := (FromColor and $0000FF);
  startg := (FromColor and $00FF00) shr 8;
  startb := (FromColor and $FF0000) shr 16;
  endr := (ToColor and $0000FF);
  endg := (ToColor and $00FF00) shr 8;
  endb := (ToColor and $FF0000) shr 16;

  diffr := endr - startr;
  diffg := endg - startg;
  diffb := endb - startb;

  rstepr := diffr / (steps - 1);
  rstepg := diffg / (steps - 1);
  rstepb := diffb / (steps - 1);

  if Direction then
    rstepw := (R.Right - R.Left) / (Steps )
  else
    rstepw := (R.Bottom - R.Top) / (Steps );

  with Canvas do
  begin
    for i := 0 to Steps - 1 do
    begin
      endr := startr + Round(rstepr*i);
      endg := startg + Round(rstepg*i);
      endb := startb + Round(rstepb*i);
      stepw := Round(i * rstepw);
      Pen.Color := endr + (endg shl 8) + (endb shl 16);
      Brush.Color := Pen.Color;
      if Direction then
      begin
        iend := R.Left + stepw + Trunc(rstepw) + 1;
        if iend > R.Right then
          iend := R.Right;
        Rectangle(R.Left + stepw,R.Top,iend,R.Bottom)
      end
      else
      begin
        iend := R.Top + stepw + Trunc(rstepw)+1;
        if iend > r.Bottom then
          iend := r.Bottom;
        Rectangle(R.Left,R.Top + stepw,R.Right,iend);
      end;
    end;
  end;
end;

{function DTFlags(DrawStyle: integer; BidiMode: TBidiMode): integer;
var
  bool : boolean;
begin
  bool := SysLocale.MiddleEast and (BiDiMode = bdRightToLeft);
  Result := DrawStyle;
  // do not change center alignment
  if bool then
    if Result and DT_RIGHT = DT_RIGHT then
      Result := Result and not DT_RIGHT // removing DT_RIGHT, makes it DT_LEFT
    else
    if not (Result and DT_CENTER = DT_CENTER) then
      Result := Result or DT_RIGHT;

  bool := SysLocale.MiddleEast and (BiDiMode <> bdLeftToRight);

  if bool then
    Result := Result or DT_RTLREADING;
end;}

procedure TIconHintX.ActivateHint(Rect: TRect; const AHint: string);
var
  Pnt, P: TPoint;
  hr, hhr: TRect;
  ImgW, ImgH, TxtH, TxtHDiv: integer;
  s: string;
  dtfmt: DWORD;
  i, w: Integer;
  CurrentMonRect: TRect;
begin
  if FIsActivating then
     Exit;

  //ShowMessage(Format('%u, %u, %u, %u'+#13#10+'%u', [ Rect.Left, Rect.Top, Rect.Right, Rect.Bottom, (Rect.Bottom-Rect.Top)]));
  Caption:= AHint;
  //Canvas.Font.Name:= 'Segoe UI';
  //Canvas.Font.Size:= 9;
  //Canvas.Font.Color:= $006e1500;

  FIsActivating:= True;

  P:= Point(-100, -100);

  Rect.Right := Rect.Right + 7;

  BoundsRect:= Rect;

  if (P.X > 0) and (P.Y > 0) then
    Pnt := P
  else
    Pnt := ClientToScreen(Point(0, 0));

  SetWindowPos(Handle, HWND_TOPMOST, Pnt.X, Pnt.Y, 0, 0,
               SWP_SHOWWINDOW or SWP_NOACTIVATE or SWP_NOSIZE);

  FIsActivating:= False;

  Invalidate;
end;

procedure TIconHintX.CreateParams(var Params: TCreateParams);
const
  CS_DROPSHADOW = $00020000;
begin
  inherited CreateParams(Params);
  Params.Style:= Params.Style - WS_BORDER;

  if (Win32Platform = VER_PLATFORM_WIN32_NT) and
     ((Win32MajorVersion > 5) or
      ((Win32MajorVersion = 5) and (Win32MinorVersion >= 1))) then
    Params.WindowClass.Style:= Params.WindowClass.Style or CS_DROPSHADOW;
end;

constructor TIconHintX.Create(AOwner: TComponent);
begin
  inherited;
  Canvas.Font.Name:= 'Segoe UI';
  //Canvas.Font.Size:= 9;
  Canvas.Font.Color:= $000000;// $00808080;
end;

// Calculate the new size of the hint window to support an icon
function TIconHintX.CalcHintRect(MaxWidth: Integer; const AHint: string;
  AData: Pointer): TRect;
begin
  Result:= inherited CalcHintRect(MaxWidth, AHint, AData);
  Result.Bottom:= Result.Bottom+6;
end;

procedure TIconHintX.Paint;
var
  R: TRect;
  rgn: THandle;
  DS: DWORD;
begin
  if FIsPainting then
     Exit;
  FIsPainting:= True;

  rgn:= CreateRoundRectRgn(0, 0, ClientRect.Right-ClientRect.Left, ClientRect.Bottom-ClientRect.Top, 4, 4);//4, 4);
  if rgn > 0 then
     begin
       try
         SetWindowRgn(Handle, rgn, True);
       finally
         DeleteObject(rgn);
       end;
     end;

  // draw background
  R := ClientRect;
  //InflateRect(R, -1, -1);
  DrawGradient(Canvas, $ffffff, $00f0e5e4, 128, R, False);
  Canvas.Pen.Color:= clGray;
  Canvas.Pen.Width:= 1;
  Canvas.Brush.Style:= bsClear;
  Canvas.RoundRect(R.Left, R.Top, R.Right-1, R.Bottom-1, 6, 6);
  {Canvas.Pixels[1,0]:= $00b4b4b4;//$00444444;
  Canvas.Pixels[0,1]:= $00b4b4b4;//$00444444;
  Canvas.Pixels[1, R.Bottom-2]:= $00b4b4b4;//$00444444;
  Canvas.Pixels[0, R.Bottom-3]:= $00b4b4b4;//$00444444;
  Canvas.Pixels[R.Right-3, 0]:= $00b4b4b4;//$00444444;
  Canvas.Pixels[R.Right-2, 1]:= $00b4b4b4;//$00444444;
  Canvas.Pixels[R.Right-3, R.Bottom-2]:= $00b4b4b4;//$00444444;
  Canvas.Pixels[R.Right-2, R.Bottom-3]:= $00b4b4b4;//$00444444;}
  R.Top:= R.Top + 4;//HINTROUNDING;
  R.Left:= R.Left + 6;

  DS:= DT_LEFT or DT_WORDBREAK;
  DrawText(Canvas.Handle, PChar(Caption), Length(Caption), R, DS);
  FIsPainting:= False;
end;

procedure TIconHintX.WMEraseBkGnd(var Message: TMessage);
begin
  Message.Result:= 1;
end;

initialization
  //this assigns our new class as the default hint window class:
  HintWindowClass:= TIconHintX;


end.

