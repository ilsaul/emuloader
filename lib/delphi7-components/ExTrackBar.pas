{
        TExTrackBar v.2.0 (C) 1996 - 2002 Oleg Tchenski, oleg@incom-service.de

        Additionals:

          property Labels: Boolean;
          property LabelsFirstLast: Boolean;
          property LabelsLeftTop: Integer;
          property LabelsText: String;
          property LabelsFactor: Integer;
          property LabelsFactorOperation: TLabelsFactorOperation;
          property LabelsInterval: Integer;
          property SelEnable: Boolean;

}

unit ExTrackBar;

interface

uses
  Windows, Messages, ComCtrls, CommCtrl, Graphics, Classes,
  Controls, SysUtils, Themes;

type
  TLabelsFactorOperation = (foMul, foDiv);

  TExTrackBar = class(TTrackBar)
  private
    FCanvas: TCanvas;
    FLabels: Boolean;
    FLabelsFirstLast: Boolean;
    FLabelsLeftTop: Integer;
    FLabelsText: String;
    FLabelsFactor: Integer;
    FLabelsFactorOperation: TLabelsFactorOperation;
    FLabelsInterval: Integer;
    FSelEnable: Boolean;
    FPosition: Integer;
    procedure WMPaint(var Message: TWMPaint); message WM_PAINT;
    procedure SetLabels(Value: Boolean);
    procedure SetLabelsFirstLast(Value: Boolean);
    procedure SetLabelsLeftTop(Value: Integer);
    procedure SetLabelsText(Value: String);
    procedure SetLabelsFactor(Value: Integer);
    procedure SetLabelsFactorOperation(Value: TLabelsFactorOperation);
    procedure SetLabelsInterval(Value: Integer);
    procedure SetSelEnable(Value: Boolean);
    procedure CMEnabledChanged(var Message: TMessage); message CM_ENABLEDCHANGED;
    procedure CMParentColorChanged(var Message: TMessage); message CM_PARENTCOLORCHANGED;
    procedure CMColorChanged(var Message: TMessage); message CM_COLORCHANGED;
    procedure CMSysColorChange(var Message: TMessage); message CM_SYSCOLORCHANGE;
  protected
    procedure Paint;
    procedure PaintWindow(DC: HDC); override;
    property  Canvas: TCanvas read FCanvas;
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    procedure   CreateParams(var Params: TCreateParams); override;
  published
    property Color;
    property Font;
    property ParentColor;
    property ParentFont;
    property Labels: Boolean read FLabels write SetLabels default True;
    property LabelsFirstLast: Boolean read FLabelsFirstLast write SetLabelsFirstLast default True;
    property LabelsLeftTop: Integer read FLabelsLeftTop write SetLabelsLeftTop default 30;
    property LabelsText: String read FLabelsText write SetLabelsText;
    property LabelsFactor: Integer read FLabelsFactor write SetLabelsFactor;
    property LabelsFactorOperation: TLabelsFactorOperation read FLabelsFactorOperation write SetLabelsFactorOperation;
    property LabelsInterval: Integer read FLabelsInterval write SetLabelsInterval;
    property SelEnable: Boolean read FSelEnable write SetSelEnable;
  end;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('Components', [TExTrackBar]);
end;

{ TExTrackBar }

constructor TExTrackBar.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FCanvas := TControlCanvas.Create;
  TControlCanvas(FCanvas).Control := Self;
  FLabels := True;
  FLabelsFirstLast := True;
  FLabelsLeftTop := 30;
  FLabelsText := '';
  FLabelsFactor := 1;
  FLabelsInterval := PageSize;
  FSelEnable := False;
  FPosition := 0;
end;

destructor TExTrackBar.Destroy;
begin
  FCanvas.Free;
  inherited Destroy;
end;

procedure TExTrackBar.CreateParams(var Params: TCreateParams);
begin
  inherited CreateParams(Params);
  Params.Style := Params.Style and not TBS_ENABLESELRANGE;
end;

procedure TExTrackBar.WMPaint(var Message: TWMPaint);
begin
  PaintHandler(Message);
  inherited;
end;

procedure TExTrackBar.PaintWindow(DC: HDC);
begin
  inherited PaintWindow(DC);
  if FLabels then begin
    if TickStyle = tsAuto then begin
      FCanvas.Lock;
      try
        FCanvas.Handle := DC;
        try
          TControlCanvas(FCanvas).UpdateTextFlags;
          Paint;
        finally
          FCanvas.Handle := 0;
        end;
      finally
        FCanvas.Unlock;
      end;
    end else FLabels := False;
  end;
end;

procedure TExTrackBar.SetLabels(Value: Boolean);
begin
  if Value <> FLabels then begin
    FLabels := Value;
    if FLabels then begin
      if TickMarks = tmTopLeft then TickMarks := tmBottomRight;
      if TickStyle <> tsAuto then TickStyle := tsAuto;
    end;
    Invalidate;
  end;
end;

procedure TExTrackBar.SetLabelsFirstLast(Value: Boolean);
begin
  if FLabelsFirstLast <> Value then begin
    FLabelsFirstLast := Value;
    Invalidate;
  end;;
end;

procedure TExTrackBar.SetLabelsLeftTop(Value: Integer);
begin
  if FLabelsLeftTop <> Value then begin
    FLabelsLeftTop := Value;
    Invalidate;
  end;
end;

procedure TExTrackBar.SetLabelsText(Value: String);
begin
  if FLabelsText <> Value then begin
    FLabelsText := Value;
    Invalidate;
  end;
end;

procedure TExTrackBar.Paint;

  function _GetTextString(Value: Integer): String;
   var E: Double;
  begin
    if FLabelsFactorOperation = foMul then E := Value * FLabelsFactor else E := Value / FLabelsFactor;
    Result := IntToStr(Round(E)) + FLabelsText;
  end;

 var
   I, K: Integer;
   RC, RT: TRect;
   S: String;
begin
  with FCanvas do begin
    Brush.Color := Color;
    Brush.Style := bsClear;
    Font := Self.Font;
    K := 0;
    SendMessage(Self.Handle, TBM_GETCHANNELRECT, 0, Integer(@RC));
    SendMessage(Self.Handle, TBM_GETTHUMBRECT, 0, Integer(@RT));

    case Orientation of
      trHorizontal: begin
        for I := Min + 1 to Max - 1 do begin
          if I mod FLabelsInterval = 0 then begin
            S := _GetTextString(I);
            if Enabled then TextOut(SendMessage(Self.Handle, TBM_GETTICPOS, K, 0) - TextWidth(S) div 2, FLabelsLeftTop, S) else begin
              Font.Color := clBtnHighlight;
              TextOut((SendMessage(Self.Handle, TBM_GETTICPOS, K, 0) - TextWidth(S) div 2) + 1, FLabelsLeftTop + 1, S);
              Font.Color := clBtnShadow;
              TextOut(SendMessage(Self.Handle, TBM_GETTICPOS, K, 0) - TextWidth(S) div 2, FLabelsLeftTop, S);
            end;
          end;
          Inc(K);
        end;
        if FLabelsFirstLast then begin
          S := _GetTextString(Min);
          K := RC.Left + (RT.Right - RT.Left) div 2 - TextWidth(S) div 2;
          if K < 1 then K := 1;
          if Enabled then TextOut(K, FLabelsLeftTop, S) else begin
            Font.Color := clBtnHighlight;
            TextOut(K + 1, FLabelsLeftTop + 1, S);
            Font.Color := clBtnShadow;
            TextOut(K, FLabelsLeftTop, S);
          end;
          S := _GetTextString(Max);
          K := RC.Right - (RT.Right - RT.Left) div 2 - TextWidth(S) div 2;
          if K + TextWidth(S) >= Self.Width then K := Self.Width - TextWidth(S) - 1;
          if Enabled then TextOut(K, FLabelsLeftTop, S) else begin
            Font.Color := clBtnHighlight;
            TextOut(K + 1, FLabelsLeftTop + 1, S);
            Font.Color := clBtnShadow;
            TextOut(K, FLabelsLeftTop, S);
          end;
        end;
      end;
      trVertical: begin
        for I := Min + 1 to Max - 1 do begin
          if I mod FLabelsInterval = 0 then begin
            S := _GetTextString(I);
            if Enabled then TextOut(FLabelsLeftTop, SendMessage(Self.Handle, TBM_GETTICPOS, K, 0) - TextHeight(S) div 2, S) else begin
              Font.Color := clBtnHighlight;
              TextOut(FLabelsLeftTop + 1, (SendMessage(Self.Handle, TBM_GETTICPOS, K, 0) - TextHeight(S) div 2) + 1, S);
              Font.Color := clBtnShadow;
              TextOut(FLabelsLeftTop, SendMessage(Self.Handle, TBM_GETTICPOS, K, 0) - TextHeight(S) div 2, S);
            end;
          end;
          Inc(K);
        end;
        if FLabelsFirstLast then begin
          S := _GetTextString(Min);
          K := RC.Left + (RT.Bottom - RT.Top) div 2 - TextHeight(S) div 2;
          if K < 1 then K := 1;
          if Enabled then TextOut(FLabelsLeftTop, K, S) else begin
            Font.Color := clBtnHighlight;
            TextOut(FLabelsLeftTop + 1, K + 1, S);
            Font.Color := clBtnShadow;
            TextOut(FLabelsLeftTop, K, S);
          end;
          S := _GetTextString(Max);
          K := RC.Right - (RT.Bottom - RT.Top) div 2 - TextHeight(S) div 2;
          if K + TextHeight(S) >= Self.Height then K := Self.Height - TextHeight(S) - 1;
          if Enabled then TextOut(FLabelsLeftTop, K, S) else begin
            Font.Color := clBtnHighlight;
            TextOut(FLabelsLeftTop + 1, K + 1, S);
            Font.Color := clBtnShadow;
            TextOut(FLabelsLeftTop, K, S);
          end;
        end;
      end;
    end;
  end;
end;

procedure TExTrackBar.SetLabelsFactor(Value: Integer);
begin
  if (Value <> 0) and (Value <> FLabelsFactor) then begin
    FLabelsFactor := Value;
    Invalidate;
  end;
end;

procedure TExTrackBar.SetLabelsFactorOperation(
  Value: TLabelsFactorOperation);
begin
  if Value <> FLabelsFactorOperation then begin
    FLabelsFactorOperation := Value;
    Invalidate;
  end;
end;

procedure TExTrackBar.SetLabelsInterval(Value: Integer);
begin
  if Value < 1 then Value := 1;
  if Value <> FLabelsInterval then begin
    FLabelsInterval := Value;
    Invalidate;
  end;
end;

procedure TExTrackBar.SetSelEnable(Value: Boolean);
begin
  if Value <> FSelEnable then begin
    FSelEnable := Value;
    if FSelEnable then SetWindowLong(Handle, GWL_STYLE, GetWindowLong(Handle, GWL_STYLE) or TBS_ENABLESELRANGE)
    else SetWindowLong(Handle, GWL_STYLE, GetWindowLong(Handle, GWL_STYLE) and not TBS_ENABLESELRANGE);
  end;
end;

procedure TExTrackBar.CMEnabledChanged(var Message: TMessage);
begin
  inherited;
  Invalidate;
end;

procedure TExTrackBar.CMParentColorChanged(var Message: TMessage);
begin
  inherited;
  RecreateWnd;
end;

procedure TExTrackBar.CMSysColorChange(var Message: TMessage);
begin
  inherited;
  RecreateWnd;
end;

procedure TExTrackBar.CMColorChanged(var Message: TMessage);
begin
  inherited;
  RecreateWnd;
end;

end.
