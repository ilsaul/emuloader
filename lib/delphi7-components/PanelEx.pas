unit PanelEx;

// PanelEx
// © 2012 by Ciro Alfredo Consentino. All rights reserved
//
// This file is not distributable without permission by Ciro Alfredo Consentino
// website: http://emuloader.mameworld.info
// e-mail: emuloader@gmail.com
//
// version 1.0, April 08, 2012
// version 1.1, January 10, 2018 -> added "Windows Theme" paint style
// version 1.2, May 09, 2018 -> added "InnerColorBorder" (TColor) and "EnableInnerBorder" (Boolean) options
// version 1.3, May 23, 2018 -> added "EnableCustomBorder" option to paint a border outside the client area (child controls are adjusted after on/off)
//                              - gradient painting adjusts to the new custom border! :)
//                              - this approach is much better than the frame + inner frame that paints over the client area
// version 1.4, June 27, 2018 -> inner border was not paiting the very end-corners like the outer frame
// version 1.5, July 11, 2018 -> replaced "EnableCustomBorder" TRUE/FALSE value by "ecbNone", "ecbSingle", "ecbDouble"
//                               - make sure to copy the code from "TBorderStyle" so all 3 options are available in design time
//                               - style "ecbSingle" uses the outer frame color (FColorBorder)
// version 1.6, June 03, 2019 -> fixed bad Windows theme drawing that messes up panel's child components
// version 1.7, June 24, 2019 -> removed BitBlt() function and restored "DrawParentImage() function to copy bk image because BitBlt() was causing severe painting problems
// version 1.8, June 16, 2020 -> OnResize was not working, added a "inherited Resize;" line in the "Resize" procedure to fix this

interface

uses
  Windows, SysUtils, Classes, Controls, ExtCtrls, Graphics, Forms, Messages, Themes;

type
  TvgStyle = (vgVista, vgGlass, vgSimple, vgMulti, vgAlpha, vgDual, vgSolid, vgWindowsTheme);

  TFrameOptions = set of (frLeft, frTop, frRight, frBottom);

  TCustomBorder = (ecbNone, ecbSingle, ecbDouble);

  TPanelEx = class(TCustomControl)
  private
    FBorderStyle: TBorderStyle;
    FCenter: Boolean;
    FColor1: TColor;
    FColor2: TColor;
    FColor3: TColor;
    FColor4: TColor;
    FColorBorder: TColor;
    fColorInnerBorder: TColor;
    FFrames: TFrameOptions;
    FEnableInnerFrame: Boolean; // added May 18, 2018
    FEnableCustomBorder: TCustomBorder; // added May 18, 2018 - modified July 11, 2018
    FStyle: TvgStyle;
    FOpacity: Byte;
    FSteps: Byte;
    FDualGradTopPercent: Byte;
    FOnMouseEnter: TNotifyEvent;
    FOnMouseLeave: TNotifyEvent;
    procedure CMMouseEnter(var Msg: TMessage); message CM_MOUSEENTER;
    procedure CMMouseLeave(var Msg: TMessage); message CM_MOUSELEAVE;
    procedure CMCtl3DChanged(var Message: TMessage); message CM_CTL3DCHANGED;
    procedure CMIsToolControl(var Message: TMessage); message CM_ISTOOLCONTROL;
    procedure SetBorderStyle(Value: TBorderStyle);
    procedure SetColor1(const Value: TColor);
    procedure SetColor2(const Value: TColor);
    procedure SetColor3(const Value: TColor);
    procedure SetColor4(const Value: TColor);
    procedure WMERASEBKGND(var Message: TWMEraseBkgnd); message WM_ERASEBKGND;
    procedure WMWindowPosChanged(var Message: TWMWindowPosChanged); message WM_WINDOWPOSCHANGED;
    procedure WMPaint(var Message: TWMPaint); message WM_PAINT;
    procedure WMNCCalcSize(var Message: TWMNCCalcSize); message WM_NCCALCSIZE;
    procedure WMNCPaint(var Msg: TWMNCPaint); message WM_NCPaint;
    procedure SetColorFrame(const Value: TColor);
    procedure SetColorInnerFrame(const Value: TColor);
    procedure SetInnerFrame(const Value: Boolean);
    procedure SetEnableCustomBorder(const Value: TCustomBorder); // added May 18, 2018 - modified July 11, 2018
    procedure SetCenter(const Value: Boolean);
    procedure SetStyle(const Value: TvgStyle);
    procedure WinGradient(ACanvas: TCanvas);
    procedure GlassGradient(ACanvas: TCanvas);
    procedure SetFrames(const Value: TFrameOptions);
    procedure SetOpacity(const Value: Byte);
    procedure SetSteps(const Value: Byte);
    procedure SetDualGradTopPercent(const Value: Byte);
    procedure Alpha(Src: TBitmap; Dst: TCanvas);
    procedure VistaGradient(ACanvas: TCanvas);
    procedure DrawGradient(ACanvas: TCanvas; Steps: Integer; ColorTop: TColor; ColorBottom: TColor);
    procedure GradientMulti(ACanvas: TCanvas; Horizontal: Boolean; Colors: array of TColor);
    procedure DrawDualGradient(ACanvas: TCanvas);
    procedure DrawSolid(ACanvas: TCanvas);
    procedure DrawWindowsTheme(ACanvas: TCanvas);
    procedure PaintPanel;
    { Private declarations }
  protected
    { Protected declarations }
    procedure CreateParams(var Params: TCreateParams); override;
    procedure PaintWindow(DC: HDC); override;
    procedure Resize; override;
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    property Canvas;
  published
    { Published declarations }
    property Align;
    property Anchors;
    property AutoSize;
    property BevelInner;
    property BevelOuter;
    property BevelKind;
    property BevelWidth;
    property BorderStyle: TBorderStyle read FBorderStyle write SetBorderStyle
      default bsNone;
    property BorderWidth;
    property Center: Boolean read FCenter write SetCenter default False;
    property Color1: TColor read FColor1 write SetColor1 default clBlack;
    property Color2: TColor read FColor2 write SetColor2 default clBlack;
    property Color3: TColor read FColor3 write SetColor3 default clBlack;
    property Color4: TColor read FColor4 write SetColor4 default clBlack;
    property ColorFrame: TColor read FColorBorder write SetColorFrame default $00c8ba90;
    property ColorInnerFrame: TColor read FColorInnerBorder write SetColorInnerFrame default $00c8ba90;
    property EnableInnerFrame: Boolean read FEnableInnerFrame write SetInnerFrame default False;
    property EnableCustomBorder: TCustomBorder read FEnableCustomBorder write SetEnableCustomBorder default ecbNone; // added May 18, 2018
    property Constraints;
    property Enabled;
    property Frames: TFrameOptions read FFrames write SetFrames;
    property Height;
    property Left;
    property Opacity: Byte read FOpacity write SetOpacity default 255;
    property ParentBackground;
    property ShowHint;
    property Style: TvgStyle read FStyle write SetStyle;
    property Steps: Byte read FSteps write SetSteps default 64;
    property DualGradTopPercent: Byte read FDualGradTopPercent write SetDualGradTopPercent default 50;
    property Top;
    property Visible;
    property Width;
    property OnEnter;
    property OnExit;
    property OnResize;
    property OnClick;
    property OnDblClick;
    property OnMouseEnter: TNotifyEvent read FOnMouseEnter write FOnMouseEnter;
    property OnMouseLeave: TNotifyEvent read FOnMouseLeave write FOnMouseLeave;
    property OnMouseDown;
    property OnMouseUp;
    property OnMouseMove;
    property OnKeyDown;
    property OnKeyUp;
  end;

procedure Register;

implementation

type
  PRGB = ^TRGB;
  TRGB = record b, g, r: Byte;
  end;
  PRGBArray = ^TRGBArray;
  TRGBARRAY = array[0..0] of TRGB;

  TRIVERTEX = packed record
    X, Y: DWORD;
    Red, Green, Blue, Alpha: Word;
  end;
  
function GradientFill(DC: hDC; pVertex: Pointer; dwNumVertex: DWORD;
  pMesh: Pointer; dwNumMesh, dwMode: DWORD): DWord; stdcall;
		external 'msimg32.dll';
    
procedure TPanelEx.CMMouseEnter(var Msg: TMessage);
begin
  if Assigned(FOnMouseEnter) then
    FOnMouseEnter(self);
  inherited;
end;

procedure TPanelEx.CMMouseLeave(var Msg: TMessage);
begin
  if Assigned(FOnMouseLeave) then
    FOnMouseLeave(self);
  inherited;
end;

procedure DrawParentImage(Control: TControl; Dest: TCanvas);
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
{$IFDEF DFS_COMPILER_2}
    GetViewportOrgEx(DC, @Position);
{$ELSE}
    GetViewportOrgEx(DC, Position);
{$ENDIF}
    SetViewportOrgEx(DC, Position.X - Left, Position.Y - Top, nil);
    IntersectClipRect(DC, 0, 0, Parent.ClientWidth, Parent.ClientHeight);
    Parent.Perform(WM_ERASEBKGND, DC, 0);
    Parent.Perform(WM_PAINT, DC, 0);
    RestoreDC(DC, SaveIndex);
  end;
end;

procedure TPanelEx.WMERASEBKGND(var Message: TWMEraseBkgnd);
begin
  Message.Result := 1;
end;

procedure TPanelEx.WMPaint(var Message: TWMPaint);
begin
  PaintHandler(Message);
end;

procedure TPanelEx.WMNCCalcSize(var Message: TWMNCCalcSize);
var
  EdgeSize: Integer;
begin
  if EnableCustomBorder <> ecbNone then
  begin
    inherited;
    with Message.CalcSize_Params^ do
    begin
      InflateRect(rgrc[0], -BorderWidth, -BorderWidth);
      EdgeSize := 0;
      case EnableCustomBorder of
        ecbSingle: Inc(EdgeSize, BevelWidth);
        ecbDouble:
          begin
            Inc(EdgeSize, BevelWidth);
            Inc(EdgeSize, BevelWidth);
          end;
      end;
      with rgrc[0] do
      begin
        Inc(Left, EdgeSize);
        Inc(Top, EdgeSize);
        Dec(Right, EdgeSize);
        Dec(Bottom, EdgeSize);
      end;
    end;
  end
  else
     inherited;
end;

procedure TPanelEx.WMNCPaint(var Msg: TWMNCPaint);
var
  DC: HDC;
  RC, RW, SaveRW: TRect;
  EdgeSize: Integer;
begin
  if FEnableCustomBorder <> ecbNone then
  begin
    // Get window DC that is clipped to the non-client area
    DC := GetWindowDC(Handle);
    try
      Windows.GetClientRect(Handle, RC);
      GetWindowRect(Handle, RW);
      MapWindowPoints(0, Handle, RW, 2);
      OffsetRect(RC, -RW.Left, -RW.Top);
      ExcludeClipRect(DC, RC.Left, RC.Top, RC.Right, RC.Bottom);
      // Draw borders in non-client area
      SaveRW := RW;
      InflateRect(RC, BorderWidth, BorderWidth);
      RW := RC;
      begin
        EdgeSize := 0;
        case EnableCustomBorder of
          ecbSingle: Inc(EdgeSize, BevelWidth);
          ecbDouble:
            begin
              Inc(EdgeSize, BevelWidth);
              Inc(EdgeSize, BevelWidth);
            end;
        end;

        with RW do
        begin
          Dec(Left, EdgeSize);
          Dec(Top, EdgeSize);
          Inc(Right, EdgeSize);
          Inc(Bottom, EdgeSize);
        end;
      end;
      IntersectClipRect(DC, RW.Left, RW.Top, RW.Right, RW.Bottom);
      RW := SaveRW;
      // Erase parts not drawn
      OffsetRect(RW, -RW.Left, -RW.Top);
      Brush.Color:= FColorBorder;
      Windows.FillRect(DC, RW, Brush.Handle); // draw the outer frame
      if EnableCustomBorder = ecbDouble then
         begin
           Brush.Color:= FColorInnerBorder;
           FrameRect(DC, Rect(RW.Left+1, RW.Top+1, RW.Right-1, RW.Bottom-1), Brush.Handle); // draw the inner frame
         end;
    finally
      ReleaseDC(Handle, DC);
    end;
  end
  else
     inherited;

  //inherited;
  //
  //if ThemeServices.ThemesEnabled and (csNeedsBorderPaint in ControlStyle) then
  //  ThemeServices.PaintBorder(Self, False);
end;

procedure TPanelEx.CMCtl3DChanged(var Message: TMessage);
begin
  if NewStyleControls and (FBorderStyle = bsSingle) then
    RecreateWnd;
  inherited;
end;

procedure TPanelEx.CMIsToolControl(var Message: TMessage);
begin
  Message.Result := 1;
end;

procedure TPanelEx.WMWindowPosChanged(var Message: TWMWindowPosChanged);
begin
  Invalidate;
  inherited;
  if not (csLoading in ComponentState) then
    Resize;
end;

procedure TPanelEx.SetBorderStyle(Value: TBorderStyle);
begin
  if Value <> FBorderStyle then
  begin
    FBorderStyle := Value;
    RecreateWnd;
  end;
end;

procedure TPanelEx.SetCenter(const Value: Boolean);
begin
  FCenter := Value;
  Invalidate;
end;

procedure TPanelEx.SetColor1(const Value: TColor);
begin
  FColor1 := Value;
  Invalidate;
end;

procedure TPanelEx.SetColor2(const Value: TColor);
begin
  FColor2 := Value;
  Invalidate;
end;

procedure TPanelEx.SetColor3(const Value: TColor);
begin
  FColor3 := Value;
  Invalidate;
end;

procedure TPanelEx.SetColor4(const Value: TColor);
begin
  FColor4 := Value;
  Invalidate;
end;

procedure TPanelEx.SetColorFrame(const Value: TColor);
begin
  FColorBorder := Value;
  if FEnableCustomBorder <> ecbNone then
     Perform(CM_BORDERCHANGED, 0, 0) //RecreateWnd -> calling this flickers the entire panel (it gets destroyed and recreated again
  else
     Invalidate;
end;

procedure TPanelEx.SetColorInnerFrame(const Value: TColor);
begin
  FColorInnerBorder := Value;
  if FEnableCustomBorder <> ecbNone then
     Perform(CM_BORDERCHANGED, 0, 0) //RecreateWnd -> calling this flickers the entire panel (it gets destroyed and recreated again
  else
     Invalidate;
end;

procedure TPanelEx.SetInnerFrame(const Value: Boolean);
begin
  FEnableInnerFrame := Value;
  Invalidate;
end;

procedure TPanelEx.SetEnableCustomBorder(const Value: TCustomBorder);
begin
  if Value <> FEnableCustomBorder then
  begin
    FEnableCustomBorder := Value;
    RecreateWnd; // this will destroy the panel and recreated it again, there's no other way; this cannot be set at runtime!
  end;
end;

procedure TPanelEx.SetFrames(const Value: TFrameOptions);
begin
  FFrames := Value;
  Invalidate;
end;

procedure TPanelEx.SetOpacity(const Value: Byte);
begin
  FOpacity := Value;
  Invalidate;
end;

procedure TPanelEx.SetSteps(const Value: Byte);
begin
  FSteps := Value;
  Invalidate;
end;

procedure TPanelEx.SetDualGradTopPercent(const Value: Byte);
begin
  if Value < 5 then
     FDualGradTopPercent := 5
  else
  if Value > 50 then
     FDualGradTopPercent := 50
  else
     FDualGradTopPercent := Value;
  Invalidate;
end;

procedure TPanelEx.SetStyle(const Value: TvgStyle);
begin
  FStyle := Value;
  Invalidate;
end;

procedure SetVertex(var Vertex: TTriVertex; X, Y: Integer; Color: TColor);
begin
  Vertex.X      := X;
  Vertex.Y      := Y;
  Vertex.Red    := (Color and $000000FF) shl 8;
  Vertex.Green  := (Color and $0000FF00);
  Vertex.Blue   := (Color and $00FF0000) shr 8;
  Vertex.Alpha  := 0;
end;

procedure TPanelEx.WinGradient(ACanvas: TCanvas);
var
  Vertexs: array[0..1] of TTriVertex;
  GRect: TGradientRect;
begin
  SetVertex(Vertexs[0], ClientRect.Left, ClientRect.Top, FColor1);
  SetVertex(Vertexs[1], ClientRect.Right, ClientRect.Bottom, FColor2);
  GRect.UpperLeft := 0;
  GRect.LowerRight := 1;
  GradientFill(ACanvas.Handle, @Vertexs, 2, @GRect, 1, GRADIENT_FILL_RECT_V);
end;

procedure TPanelEx.GlassGradient(ACanvas: TCanvas);
var
  rc1, gc1, bc1, rc2, gc2, bc2, rc3, gc3, bc3, y1, i, GSize: Integer;
  Row: PRGBArray;
  GradCol: TRGB;
  GradientBmp: TBitmap;
begin
  rc1 := GetRValue(ColorToRGB(FColor1));
  gc1 := GetGValue(ColorToRGB(FColor1));
  bc1 := GetBValue(ColorToRGB(FColor1));
  rc2 := GetRValue(ColorToRGB(FColor2));
  gc2 := GetGValue(ColorToRGB(FColor2));
  bc2 := GetBValue(ColorToRGB(FColor2));
  rc3 := rc1 + (((rc2 - rc1) * 15) div 9);
  gc3 := gc1 + (((gc2 - gc1) * 15) div 9);
  bc3 := bc1 + (((bc2 - bc1) * 15) div 9);
  if rc3 < 0 then
    rc3 := 0
  else if rc3 > 255 then
    rc3 := 255;
  if gc3 < 0 then
    gc3 := 0
  else if gc3 > 255 then
    gc3 := 255;
  if bc3 < 0 then
    bc3 := 0
  else if bc3 > 255 then
    bc3 := 255;
  GradientBMP := TBitmap.Create;
  GradientBmp.PixelFormat := pf24bit;
  GradientBmp.Width := 1;
  GradientBmp.Height := ClientHeight - 1;
  GradientBmp.Canvas.Lock; // added May 22,2019
  GSize := GradientBmp.Height;
  y1 := GSize div 2;
  for i := 0 to y1 - 1 do
  begin
    Row := PRGBArray(GradientBmp.ScanLine[i]);
    GradCol.r := Byte(rc1 + ((rc2 - rc1) * i) div y1);
    GradCol.g := Byte(gc1 + ((gc2 - gc1) * i) div y1);
    GradCol.b := Byte(bc1 + ((bc2 - bc1) * i) div y1);
    Row[0] := GradCol;
  end;
  for i := y1 to GSize - 1 do
  begin
    Row := PRGBArray(GradientBmp.ScanLine[i]);
    GradCol.r := Byte(rc3 + ((rc2 - rc3) * i) div GSize);
    GradCol.g := Byte(gc3 + ((gc2 - gc3) * i) div GSize);
    GradCol.b := Byte(bc3 + ((bc2 - bc3) * i) div GSize);
    Row[0] := GradCol;
  end;
  GradientBmp.Canvas.UnLock; // added May 22,2019
  ACanvas.StretchDraw(ClientRect, GradientBmp);
  GradientBmp.Free;
end;

procedure TPanelEx.VistaGradient(ACanvas: TCanvas);
var
  rc1, gc1, bc1, rc2, gc2, bc2, rc3, gc3, bc3: Integer;
  x, y, w, h: Integer;
  i, w1: Integer;
  Row: PRGBArray;
  C: TRGB;
  bmp: TBitmap;
  slMain, slSize, slPtr: Integer;
  QCol: array of TRGB;
  r, g, b: Byte;
begin
  bmp := TBitmap.Create;
  bmp.PixelFormat := pf24Bit;
  bmp.Width := ClientWidth;
  bmp.Height := ClientHeight;
  bmp.Canvas.Lock; // added May 22,2019

  h := bmp.Height;
  w := bmp.Width;
  SetLength(QCol, h);
  // Get colors for first gradient
  i:= ColorToRGB(FColor1);
  rc1 := Byte(i);
  gc1 := Byte(i shr 8);
  bc1 := Byte(i shr 16);
  i := ColorToRGB(FColor2);
  rc2 := Byte(i);
  gc2 := Byte(i shr 8);
  bc2 := Byte(i shr 16);
  rc3 := rc1 + (((rc2 - rc1) * 7) div 2);
  gc3 := gc1 + (((gc2 - gc1) * 7) div 2);
  bc3 := bc1 + (((bc2 - bc1) * 7) div 2);
  if rc3 < 0 then
    rc3 := 0
  else if rc3 > 255 then
    rc3 := 255;
  if gc3 < 0 then
    gc3 := 0
  else if gc3 > 255 then
    gc3 := 255;
  if bc3 < 0 then
    bc3 := 0
  else if bc3 > 255 then
    bc3 := 255;
  // Calc first gradient
  y := h div 2;
  for i := 0 to y - 1 do
  begin
    C.r := Byte(rc1 + (((rc2 - rc1) * (i)) div y));
    C.g := Byte(gc1 + (((gc2 - gc1) * (i)) div y));
    C.b := Byte(bc1 + (((bc2 - bc1) * (i)) div y));
    QCol[i] := C;
  end;
  if rc2 > rc1 then
  begin
    rc3 := rc2;
    gc3 := gc2;
    bc3 := bc2;
  end;
  for i := y to h - 1 do
  begin
    C.r := Byte(rc3 + (((rc2 - rc3) * (i)) div h));
    C.g := Byte(gc3 + (((gc2 - gc3) * (i)) div h));
    C.b := Byte(bc3 + (((bc2 - bc3) * (i)) div h));
    QCol[i] := C;
  end;
  // First gradient done
  // Get colors for second gradient
  i := ColorToRGB(FColor3);
  rc1 := Byte(i);
  gc1 := Byte(i shr 8);
  bc1 := Byte(i shr 16);
  i := ColorToRGB(FColor4);
  rc2 := Byte(i);
  gc2 := Byte(i shr 8);
  bc2 := Byte(i shr 16);
  w1 := w - 1;
  if Center then
    w := (w shr 1) + (w and 1);
  // Init scanline accsess
  slMain := Integer(bmp.ScanLine[0]);
  slSize := Integer(bmp.ScanLine[1]) - slMain;
  // Paint gradient
  for x := 0 to w - 1 do
  begin
    C.b := Byte(bc1 + (((bc2 - bc1) * x) div w));
    C.g := Byte(gc1 + (((gc2 - gc1) * x) div w));
    C.r := Byte(rc1 + (((rc2 - rc1) * x) div w));
    slPtr := slMain;
    for y := 0 to h - 1 do
    begin
      Row := PRGBArray(slPtr);
      r := QCol[y].r;
      g := QCol[y].g;
      b := QCol[y].b;
      Row[x].r := (C.r - r) shr 1 + r;
      Row[x].g := (C.g - g) shr 1 + g;
      Row[x].b := (C.b - b) shr 1 + b;
      if (Center) and (x < (w1 - x)) then
      begin
        Row[w1 - x].r := (C.r - r) shr 1 + r;
        Row[w1 - x].g := (C.g - g) shr 1 + g;
        Row[w1 - x].b := (C.b - b) shr 1 + b;
      end;
      slPtr := slPtr + slSize;
    end;
  end;
  QCol := nil;
  bmp.Canvas.UnLock; // added May 22,2019
  ACanvas.Draw(0, 0, bmp);
  bmp.Free;
end;

procedure TPanelEx.DrawGradient(ACanvas: TCanvas; Steps: Integer; ColorTop: TColor; ColorBottom: TColor);
var
  diffr,startr,endr: Integer;
  diffg,startg,endg: Integer;
  diffb,startb,endb: Integer;
  iend: Integer;
  rstepr,rstepg,rstepb,rstepw: Real;
  i,stepw: Word;
  bmp: TBitmap;
  FromColor, ToColor: TColor;
begin
  if Steps = 0 then
    Steps := 1;

  if ClientWidth < 1 then
    Exit;
  if ClientHeight < 1 then
    Exit;

  FromColor := ColorToRGB(ColorTop);
  ToColor := ColorToRGB(ColorBottom);

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

  //if Direction then
  //  rstepw := (R.Right - R.Left) / (Steps ) // horizontal
  //else
    rstepw := ClientHeight / Steps; // (R.Bottom - R.Top) / (Steps ); // vertical

  bmp := TBitmap.Create;
  bmp.PixelFormat := pf24Bit;
  bmp.Width := ClientWidth;
  bmp.Height := ClientHeight;
  bmp.Canvas.Lock; // added May 22,2019

  with bmp.Canvas do
  begin
    for i := 0 to Steps - 1 do
    begin
      endr := startr + Round(rstepr*i);
      endg := startg + Round(rstepg*i);
      endb := startb + Round(rstepb*i);
      stepw := Round(i * rstepw);
      Pen.Color := endr + (endg shl 8) + (endb shl 16);
      Brush.Color := Pen.Color;
      {if Direction then
      begin
        iend := R.Left + stepw + Trunc(rstepw) + 1;
        if iend > R.Right then
          iend := R.Right;
        Rectangle(R.Left + stepw,R.Top,iend,R.Bottom)
      end
      else
      begin}
        iend := ClipRect.Top + stepw + Trunc(rstepw)+1;
        if iend > ClipRect.Bottom then
          iend := ClipRect.Bottom;
        Rectangle(ClipRect.Left, ClipRect.Top + stepw, ClipRect.Right, iend);
      //end;
    end;
  end;
  bmp.Canvas.UnLock; // added May 22,2019
  ACanvas.Draw(0, 0, bmp);
  bmp.Free;
end;

procedure TPanelEx.GradientMulti(ACanvas: TCanvas; Horizontal: Boolean;
           Colors: array of TColor);//; PaintBorder: Boolean; BorderColor: TColor);
type
  RGBArray = array[0..2] of Byte;
var
  x, y, z, stelle, mx, bis, faColorsh, mass: Integer;
  Faktor: double;
  A: RGBArray;
  B: array of RGBArray;
  merkw: integer;
  merks: TPenStyle;
  merkp: TColor;
  bmp: TBitmap;
begin
  mx := High(Colors);
  if mx > 0 then
  begin
    if Horizontal then
      mass := ACanvas.ClipRect.Right - ACanvas.ClipRect.Left
    else
      mass := ACanvas.ClipRect.Bottom - ACanvas.ClipRect.Top;
    SetLength(b, mx + 1);
    for x := 0 to mx do
    begin
      Colors[x] := ColorToRGB(Colors[x]);
      b[x][0] := GetRValue(Colors[x]);
      b[x][1] := GetGValue(Colors[x]);
      b[x][2] := GetBValue(Colors[x]);
    end;
    bmp := TBitmap.Create;
    bmp.PixelFormat := pf24Bit;
    bmp.Width := ClientWidth;
    bmp.Height := ClientHeight;
    bmp.Canvas.Lock; // added May 22, 2019
    with bmp.Canvas do
    begin
      merkw := Pen.Width;
      merks := Pen.Style;
      merkp := Pen.Color;
      Pen.Width := 1;
      Pen.Style := psSolid;
      Brush.Color := Pen.Color;
      faColorsh := Round(mass / mx);
      for y := 0 to mx - 1 do
      begin
        if y = mx - 1 then
          bis := mass - y * faColorsh - 1
        else
          bis := faColorsh;
        for x := 0 to bis do
        begin
          Stelle := x + y * faColorsh;
          faktor := x / bis;
          for z := 0 to 3 do
            a[z] := Trunc(b[y][z] + ((b[y + 1][z] - b[y][z]) * Faktor));
          Pen.Color := RGB(a[0], a[1], a[2]);
          if Horizontal then
          begin
            MoveTo(ClientRect.Left + Stelle, ClientRect.Top);
            LineTo(ClientRect.Left + Stelle, ClientRect.Bottom);
          end
          else
          begin
            MoveTo(ClientRect.Left, ClientRect.Top + Stelle);
            LineTo(ClientRect.Right, ClientRect.Top + Stelle);
          end;
        end;
      end;
      b := nil;
      Pen.Width := merkw;
      Pen.Style := merks;
      Pen.Color := merkp;
    end
  end
  else
    // Please specify at least two colors
    raise EMathError.Create('Please specify at least two colors.');
  {if PaintBorder then
     begin
       ACanvas.Brush.Color:= BorderColor; // dual-gradient outer frame
       ACanvas.FrameRect(ACanvas.ClipRect);
     end;}
  bmp.Canvas.UnLock; // added May 22, 2019
  ACanvas.Draw(0, 0, bmp);
  bmp.Free;
end;

procedure TPanelEx.DrawDualGradient(ACanvas: TCanvas);
var
  BitmapGrad: TBitmap;
  TopGradHeight, BottomGradHeight: Integer;
  PercentValue: Real;
begin
  TopGradHeight:= Trunc(ClientHeight / 2);
  if FDualGradTopPercent <> 50 then
     begin
       PercentValue:= (FDualGradTopPercent * 2) / 100;
       TopGradHeight:= Round(TopGradHeight*PercentValue);// TopGradHeight - (TopGradHeight * PercentValue));//0.2));
     end;
  if frTop in FFrames then
     TopGradHeight:= TopGradHeight-1;

  BottomGradHeight:= (ClientHeight-TopGradHeight);
  if frBottom in FFrames then
     BottomGradHeight:= BottomGradHeight-1;

  BitmapGrad := TBitmap.Create;
  BitmapGrad.PixelFormat := pf24Bit;
  BitmapGrad.Width:= ClientWidth;
  BitmapGrad.Height:= TopGradHeight;

  // draw top gradient
  DrawGradient(BitmapGrad.Canvas, FSteps, FColor1, FColor2);
  ACanvas.Draw(0, 0+Ord(frTop in FFrames), BitmapGrad);
  BitmapGrad.Width:= 0;
  BitmapGrad.Height:= 0;

  // draw bottom gradient
  BitmapGrad.Width:= ClientWidth;
  BitmapGrad.Height:= BottomGradHeight;
  DrawGradient(BitmapGrad.Canvas, FSteps, FColor3, FColor4);
  ACanvas.Draw(0, TopGradHeight+Ord(frTop in FFrames), BitmapGrad);

  BitmapGrad.Free;
end;

procedure TPanelEx.DrawSolid(ACanvas: TCanvas);
begin
  ACanvas.Brush.Color:= FColor1;
  ACanvas.FillRect(ACanvas.ClipRect);
end;

procedure TPanelEx.DrawWindowsTheme(ACanvas: TCanvas);
var
  ElementDetails: TThemedElementDetails;
  bmp: TBitmap;
begin
  bmp := TBitmap.Create;
  bmp.PixelFormat := pf24Bit;
  bmp.Width := ClientWidth;
  bmp.Height := ClientHeight;
  
  bmp.Canvas.Lock; // added May 22,2019

  if (ThemeServices.ThemesEnabled) and (not (csDesigning in componentState)) then
  begin
    ElementDetails:= ThemeServices.GetElementDetails(trRebarRoot);
    ThemeServices.DrawElement(bmp.Canvas.Handle, ElementDetails, bmp.Canvas.ClipRect);
  end
  else
    DrawSolid(bmp.Canvas); // paint a solid background if Windows themes is not available

  bmp.Canvas.Unlock;
  ACanvas.Draw(0, 0, bmp);
  bmp.Free;
end;

procedure TPanelEx.PaintPanel;
var
  ACanvas: TCanvas;
  Bmp: TBitmap;
begin
  Bmp:= nil;
  if (FOpacity <> 255) and (FStyle <> vgAlpha) then
  begin
    Bmp := TBitmap.Create;
    Bmp.PixelFormat := pf24Bit;
    Bmp.Width := ClientWidth;
    Bmp.Height := ClientHeight;
    ACanvas:= Bmp.Canvas;
  end
  else
    ACanvas:= Canvas;

  case FStyle of
    vgVista:
      VistaGradient(ACanvas);
    vgGlass:
      GlassGradient(ACanvas);
    vgSimple: // simple gradient, 2 colors
      DrawGradient(ACanvas, FSteps, FColor1, FColor2);
      //WinGradient(ACanvas);
    vgMulti:
      GradientMulti(ACanvas, False, [FColor1, FColor2, FColor3, FColor4]);
    vgDual:
      DrawDualGradient(ACanvas);
    vgSolid:
      DrawSolid(ACanvas);
    vgWindowsTheme:
      DrawWindowsTheme(ACanvas);
  else
  end;

  if FOpacity <> 255 then
  begin
    Alpha(Bmp, Canvas);
    if (FStyle <> vgAlpha) then
      Bmp.Free;
  end;

  if FEnableInnerFrame then
  begin
    Canvas.Pen.Color := FColorInnerBorder;
    if frLeft in FFrames then
    begin
      Canvas.MoveTo(ClientRect.Left+1, ClientRect.Top);
      Canvas.LineTo(ClientRect.Left+1, ClientRect.Bottom);
    end;
    if frTop in FFrames then
    begin
      Canvas.MoveTo(ClientRect.Left, ClientRect.Top+1);
      Canvas.LineTo(ClientRect.Right, ClientRect.Top+1);
    end;
    if frRight in FFrames then
    begin
      Canvas.MoveTo(ClientRect.Right - 2, ClientRect.Top);
      Canvas.LineTo(ClientRect.Right - 2, ClientRect.Bottom);
    end;
      if frBottom in FFrames then
    begin
      Canvas.MoveTo(ClientRect.Left, ClientRect.Bottom - 2);
      Canvas.LineTo(ClientRect.Right, ClientRect.Bottom - 2);
    end;
  end;

  Canvas.Pen.Color := FColorBorder;
  if frLeft in FFrames then
  begin
    Canvas.MoveTo(ClientRect.Left, ClientRect.Top);
    Canvas.LineTo(ClientRect.Left, ClientRect.Bottom);
  end;
  if frTop in FFrames then
  begin
    Canvas.MoveTo(ClientRect.Left, ClientRect.Top);
    Canvas.LineTo(ClientRect.Right, ClientRect.Top);
  end;
  if frRight in FFrames then
  begin
    Canvas.MoveTo(ClientRect.Right - 1, ClientRect.Top);
    Canvas.LineTo(ClientRect.Right - 1, ClientRect.Bottom);
  end;
    if frBottom in FFrames then
  begin
    Canvas.MoveTo(ClientRect.Left, ClientRect.Bottom - 1);
    Canvas.LineTo(ClientRect.Right, ClientRect.Bottom - 1);
  end;
end;

procedure TPanelEx.Alpha(Src: TBitmap; Dst: TCanvas);
var
  i, x, y: Integer;
  Row, Row2: PRGBArray;
  bmp: TBitmap;
  SCL, SCL2: Integer;
  SCLStep, SCL2Step: Integer;
  r, g, b: Byte;
  LutA: array[0..768] of Byte;
begin
  bmp := TBitmap.Create;
  bmp.PixelFormat := pf24Bit;
  bmp.Width := ClientWidth;
  bmp.Height := ClientHeight;
  bmp.Canvas.Lock; // added May 22, 2019

  //BitBlt(bmp.Canvas.Handle, 0, 0, bmp.Width, bmp.Height, Self.Canvas.Handle, 0, 0, SRCCOPY); // copy background image (this doesn't work!!!)

  DrawParentImage(Self, bmp.Canvas);
  SCL:= Integer(bmp.ScanLine[0]);
  SCLStep:= Integer(bmp.ScanLine[1]) - SCL;
  if Src = nil then
  begin
    r:= Byte(FColor1);
    g:= Byte(FColor1 shr 8);
    b:= Byte(FColor1 shr 16);
    for i := 0 to 255 do
    begin
      LutA[i] := Byte(Opacity * (r - i) shr 8 + i);
      LutA[i + 256] := Byte(Opacity * (g - i) shr 8 + i);
      LutA[i + 512] := Byte(Opacity * (b - i) shr 8 + i);
    end;
    for y := 0 to bmp.Height - 1 do
    begin
      Row:= PRGBArray(SCL);
      for x := 0 to bmp.Width - 1 do
      begin
        Row[x].R := LutA[Row[x].R];
        Row[x].G := LutA[Row[x].G + 256];
        Row[x].B := LutA[Row[x].B + 512];
      end;
      SCL:= SCL + SCLStep;
    end;
    bmp.Canvas.UnLock; // added May 22, 2019
    Dst.Draw(0, 0, bmp);
    bmp.Free;
  end
  else
  begin
    SCL2:= Integer(Src.ScanLine[0]);
    SCL2Step:= Integer(Src.ScanLine[1]) - SCL2;
    for y := 0 to bmp.Height - 1 do
    begin
      Row:= PRGBArray(SCL);
      Row2:= PRGBArray(SCL2);
      for x := 0 to bmp.Width - 1 do
      begin
        Row[x].r := Byte(Opacity * (Row2[x].r - Row[x].r) shr 8 + Row[x].r);
        Row[x].g := Byte(Opacity * (Row2[x].g - Row[x].g) shr 8 + Row[x].g);
        Row[x].b := Byte(Opacity * (Row2[x].b - Row[x].b) shr 8 + Row[x].b);
      end;
      SCL:= SCL + SCLStep;
      SCL2:= SCL2 + SCL2Step;
    end;
    bmp.Canvas.UnLock; // added May 22, 2019
    Dst.Draw(0, 0, bmp);
    bmp.Free;
  end
end;

procedure TPanelEx.PaintWindow(DC: HDC);
begin
  Canvas.Lock;
  try
    Canvas.Handle := DC;
    try
      PaintPanel;
    finally
      Canvas.Handle := 0;
    end;
  finally
    Canvas.Unlock;
  end;
end;

constructor TPanelEx.Create(AOwner: TComponent);
begin
  inherited;
  ControlStyle := ControlStyle + [csOpaque, csAcceptsControls, csReplicatable, csNeedsBorderPaint];
  FBorderStyle := bsNone;
  FEnableCustomBorder := ecbNone;
  FColor1 := clWhite;
  FColor2 := clSilver;
  FColor3 := clYellow;
  FColor4 := clTeal;
  FColorBorder := clGreen;
  FColorInnerBorder := clGreen;
  FEnableInnerFrame := False;
  FSteps := 64;
  FDualGradTopPercent := 50;
  FCenter := False;
  FFrames := [];
  FOpacity:= 255;
  FStyle:= vgVista;
end;

destructor TPanelEx.Destroy;
begin
  //FPicture.Free;
  inherited Destroy;
end;

procedure TPanelEx.Resize;
begin
  Invalidate;
  if Assigned(OnResize) then
     OnResize(Self);
  //inherited Resize;
end;

procedure TPanelEx.CreateParams(var Params: TCreateParams);
const
  BorderStyles: array[TBorderStyle] of DWord = (0, WS_BORDER);
begin
  inherited CreateParams(Params);
  with Params do
  begin
    Style := Style or BorderStyles[FBorderStyle];
    if NewStyleControls and Ctl3D and (FBorderStyle = bsSingle) then
    begin
      Style := Style and not WS_BORDER;
      ExStyle := ExStyle or WS_EX_CLIENTEDGE;
    end;
  end;
end;

procedure Register;
begin
  RegisterComponents('Components', [TPanelEx]);
end;

end.

