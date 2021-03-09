unit EditEx;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls;

type
  TEditEx = class(TEdit)
  private
    { Private declarations }
    FColorFrame: TColor;
    FColorFrameFocused: TColor;

    FColorDisabled: TColor;
    FColorFrameDisabled: TColor;

    FUseCustomBorder: Boolean;

    FFocused: Boolean;
    FMouseInControl: Boolean;

    procedure WMNCPAINT(var Msg: TMessage); message WM_NCPAINT;
  protected
    procedure WndProc(var Message: TMessage); override;
    function  DarkenColor(Color: TColor; Perc: Integer): TColor;
    function  Blend(Color1, Color2: TColor; A: Byte): TColor;
    procedure SetBorderColor(Value: TColor);
    procedure SetColorFrameFocused(Value: TColor);

    procedure SetColorDisabled(Value: TColor);
    procedure SetColorFrameDisabled(Value: TColor);

    procedure SetUseCustomBorder(Value: Boolean);
  public
    constructor Create(aOwner: TComponent); override;
  published
    property ColorFrame: TColor read FColorFrame write SetBorderColor default clGray;
    property ColorFrameFocused: TColor read FColorFrameFocused write SetColorFrameFocused default clSilver;

    property ColorDisabled: TColor read FColorDisabled write SetColorDisabled default $00272727;
    property ColorFrameDisabled: TColor read FColorFrameDisabled write SetColorFrameDisabled default $00505050;

    property UseCustomBorder: Boolean read FUseCustomBorder write SetUseCustomBorder default False;
  end;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('Components', [TEditEx]);
end;

constructor TEditEx.Create(aOwner: TComponent);
begin
  inherited;
  FColorFrame := clGray;
  FColorFrameFocused := clSilver;
  FColorDisabled := $00272727;
  FColorFrameDisabled := $00505050;
  FUseCustomBorder := False;
  FFocused:= False;
  FMouseInControl := False;
end;

procedure TEditEx.WndProc(var Message: TMessage);
begin
  inherited;
  if not FUseCustomBorder then
     Exit;

  case Message.Msg of
    CM_MouseEnter: begin
                     if not FMouseInControl then
                        begin
                          FMouseInControl := True;
                          Repaint;
                        end;
                   end;
    CM_MouseLeave: begin
                     if FMouseInControl then
                        begin
                          FMouseInControl := False;
                          Repaint;
                        end;
                   end;
    CM_Enter: begin
                if not FFocused then
                   begin
                     FFocused := True;
                     Repaint;
                   end;
              end;
    CM_Exit: begin
               if FFocused then
                  begin
                    FFocused := False;
                    Repaint;
                  end;
             end;
  end;
end;

procedure TEditEx.WMNCPaint(var msg: TMessage);
var
  cv: TCanvas;
  dc: HDC;
  r, r2: TRect;
  CornerPixelColor: TColor;
begin
  inherited;
  if (not FUseCustomBorder) or (csDesigning in ComponentState) then
     Exit;

  dc := GetWindowDC(Handle);
  SaveDC(dc);
  try
    cv := TCanvas.Create;
    try
      cv.Handle := dc;
      cv.Lock;
      r  := Rect(0, 0, Width, Height);
      r2 := r;
      InflateRect(r2, -1, -1);
      cv.Brush.Style := bsSolid;

      cv.Brush.Color := Color;
      CornerPixelColor := DarkenColor(Color, 8);

      cv.FrameRect(r2);

      if not Enabled then
         cv.Brush.Color := FColorFrameDisabled
      else
      if FMouseInControl or FFocused then
         cv.Brush.Color := FColorFrameFocused
      else
         cv.Brush.Color := FColorFrame;

      cv.FrameRect(r);

      cv.Pixels[r.Left+1,  r.Top+1]    := CornerPixelColor;
      cv.Pixels[r.Left+1,  r.Bottom-2] := CornerPixelColor;
      cv.Pixels[r.Right-2, r.Top+1]    := CornerPixelColor;
      cv.Pixels[r.Right-2, r.Bottom-2] := CornerPixelColor;

      CornerPixelColor := DarkenColor(cv.Brush.Color, 8);
      cv.Pixels[r.Left,    r.Top]      := CornerPixelColor;
      cv.Pixels[r.Left,    r.Bottom-1] := CornerPixelColor;
      cv.Pixels[r.Right-1, r.Top]      := CornerPixelColor;
      cv.Pixels[r.Right-1, r.Bottom-1] := CornerPixelColor;

    finally
      cv.Unlock;
      cv.Free;
    end;
  finally
    RestoreDC(dc, -1);
    ReleaseDC(Handle, dc);
  end;
end;

function TEditEx.DarkenColor(Color: TColor; Perc: Integer): TColor;
var
  r, g, b: Integer;//longint;
  l: Longint;
begin
  l := ColorToRGB(Color);
  r := ((l AND $FF0000) shr 16) and $FF;
  g := ((l AND $FF00) shr 8) and $FF;
  b := (l AND $FF);

  r := Round(r * (100 - Perc)/100);
  g := Round(g * (100 - Perc)/100);
  b := Round(b * (100 - Perc)/100);

  Result := (r shl 16) or (g shl 8) or b;
end;

function TEditEx.Blend(Color1, Color2: TColor; A: Byte): TColor;
var
  c1, c2: Integer; //LongInt;
  R, G, B, v1, v2: Byte;
begin
  A  := Round(2.55 * A);
  c1 := ColorToRGB(Color1);
  c2 := ColorToRGB(Color2);
  v1 := Byte(c1);
  v2 := Byte(c2);
  R  := Byte(A * (v1 - v2) shr 8 + v2);
  v1 := Byte(c1 shr 8);
  v2 := Byte(c2 shr 8);
  G  := Byte(A * (v1 - v2) shr 8 + v2);
  v1 := Byte(c1 shr 16);
  v2 := Byte(c2 shr 16);
  B  := Byte(A * (v1 - v2) shr 8 + v2);
  Result := (B shl 16) + (G shl 8) + R;
end;

procedure TEditEx.SetBorderColor(Value: TColor);
begin
  if FColorFrame <> Value then
     begin
       FColorFrame:= Value;
         if FUseCustomBorder and (not (csDesigning in ComponentState)) then
            RecreateWnd; // must force the entire control to repaint itself; "Invalidate" does not work
     end;
end;

procedure TEditEx.SetColorFrameFocused(Value: TColor);
begin
  if FColorFrameFocused <> Value then
     begin
       FColorFrameFocused:= Value;
       if FUseCustomBorder and (not (csDesigning in ComponentState)) then
          Invalidate;
     end;
end;

procedure TEditEx.SetColorDisabled(Value: TColor);
begin
  if FColorDisabled <> Value then
     begin
       FColorDisabled:= Value;
       if FUseCustomBorder and (not (csDesigning in ComponentState)) then
          if not Enabled then
             RecreateWnd; // must force the entire control to repaint itself; "Invalidate" does not work
     end;
end;

procedure TEditEx.SetColorFrameDisabled(Value: TColor);
begin
  if FColorFrameDisabled <> Value then
     begin
       FColorFrameDisabled:= Value;
       if FUseCustomBorder and (not (csDesigning in ComponentState)) then
          Invalidate;
     end;
end;

procedure TEditEx.SetUseCustomBorder(Value: Boolean);
begin
  if FUseCustomBorder <> Value then
     begin
       FUseCustomBorder:= Value;
       if not (csDesigning in ComponentState) then
          RecreateWnd;
     end;
end;


end.
