unit ColorBoxEx;

interface

uses Messages, {$IFDEF LINUX} WinUtils, {$ENDIF} Windows, SysUtils, Classes,
     Controls, Forms, Menus, Graphics, StdCtrls, ExtCtrls, Themes, UxTheme;

type
  TColorBoxEx = class(TCustomColorBox)
  private
    FCustomColorsEnabled: Boolean;
    FSelectionBarCustomColor_Top: TColor;
    FSelectionBarCustomColor_Bottom: TColor;
    FSelectionFontCustomColor: TColor;
    FSelectionShowFrame: Boolean;
    FSelectionShowFrameColor: TColor;
    FShowFocusRect: Boolean;

    FCustomFontColorDisabled: TColor;
    FCustomColorBk: TColor;
    FCustomColorFont: TColor;

    FFrameColor: TColor;
    FFrameColorFocused: TColor;
    FFrameColorDisabled: TColor;

    FMouseInControl: Boolean;

    FButtonArrow: TBitmap;
    FButtonArrowNewStyle: Boolean;
    FButtonWidth: Integer;
    //FButtonColor: TColor;
    FButtonColorHover: TColor;
    FButtonArrowColor: TColor;
    FButtonArrowColorHover: TColor;
    FButtonArrowColorDisabled: TColor;

    FWindows10DarkMode: Boolean;

    procedure WMPaint(var Message: TWMPaint); message WM_PAINT;

    procedure CNDrawItem(var Message: TWMDrawItem); message CN_DRAWITEM;
    procedure SetCustomColorsEnabled(Value: Boolean);
    procedure SetSelectionBarCustomColor_Top(Value: TColor);
    procedure SetSelectionBarCustomColor_Bottom(Value: TColor);
    procedure SetSelectionFontCustomColor(Value: TColor);
    procedure SetSelectionShowFrame(Value: Boolean);
    procedure SetSelectionShowFrameColor(Value: TColor);
    procedure SetShowFocusRect(Value: Boolean);
    procedure SetCustomFontColorDisabled(Value: TColor);
    procedure SetCustomColorBk(Value: TColor);
    procedure SetCustomColorFont(Value: TColor);
    procedure SetFrameColor(Value: TColor);
    procedure SetFrameColorFocused(Value: TColor);
    procedure SetFrameColorDisabled(Value: TColor);

    procedure SetButtonArrowNewStyle(Value: Boolean);
    procedure SetButtonColorHover(Value: TColor);
    procedure SetButtonArrowColor(Value: TColor);
    procedure SetButtonArrowColorHover(Value: TColor);
    procedure SetButtonArrowColorDisabled(Value: TColor);

    procedure SetWindows10DarkMode(Value: Boolean);
  protected
    procedure DrawItem(Index: Integer; Rect: TRect; State: TOwnerDrawState); override;
    function  GetCustomColorRGBText(cColor: TColor): String;
    procedure WndProc(var Message: TMessage); override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
  published
    property AutoComplete;
    property AutoDropDown;
    property DefaultColorColor;
    property NoneColorColor;
    property Selected;
    property Style;

    property Anchors;
    property BevelEdges;
    property BevelInner;
    property BevelKind;
    property BevelOuter;
    property BiDiMode;
    property Color;
    property Constraints;
    property Ctl3D;
    property DropDownCount;
    property Enabled;
    property Font;
    property ItemHeight;
    property ParentBiDiMode;
    property ParentColor;
    property ParentCtl3D;
    property ParentFont;
    property ParentShowHint;
    property PopupMenu;
    property ShowHint;
    property TabOrder;
    property TabStop;
    property Visible;
    property OnChange;
    property OnCloseUp;
    property OnClick;
    property OnContextPopup;
    property OnDblClick;
    property OnDragDrop;
    property OnDragOver;
    property OnDropDown;
    property OnEndDock;
    property OnEndDrag;
    property OnEnter;
    property OnExit;
    property OnKeyDown;
    property OnKeyPress;
    property OnKeyUp;
    property OnSelect;
    property OnStartDock;
    property OnStartDrag;

    property CustomColorsEnabled: Boolean read FCustomColorsEnabled write SetCustomColorsEnabled default False;
    property SelectionBarCustomColor_Top: TColor read FSelectionBarCustomColor_Top write SetSelectionBarCustomColor_Top default clHighlight;
    property SelectionBarCustomColor_Bottom: TColor read FSelectionBarCustomColor_Bottom write SetSelectionBarCustomColor_Bottom default clHighlight;
    property SelectionFontCustomColor: TColor read FSelectionFontCustomColor write SetSelectionFontCustomColor default clHighlightText;
    property SelectionShowFrame: Boolean read FSelectionShowFrame write SetSelectionShowFrame default False;
    property SelectionShowFrameColor: TColor read FSelectionShowFrameColor write SetSelectionShowFrameColor default clNone;
    property ShowFocusRect: Boolean read FShowFocusRect write SetShowFocusRect default True;
    property CustomColorBk: TColor read FCustomColorBk write SetCustomColorBk default clWindow;
    property CustomColorFont: TColor read FCustomColorFont write SetCustomColorFont default clBlack;
    property CustomColorFontDisabled: TColor read FCustomFontColorDisabled write SetCustomFontColorDisabled default clGray;
    property FrameColor: TColor read FFrameColor write SetFrameColor default clGray;
    property FrameColorFocused: TColor read FFrameColorFocused write SetFrameColorFocused default clSilver;
    property FrameColorDisabled: TColor read FFrameColorDisabled write SetFrameColorDisabled default $00505050;

    property ButtonColorHover: TColor read FButtonColorHover write SetButtonColorHover default clNone;
    property ButtonArrowColor: TColor read FButtonArrowColor write SetButtonArrowColor default $00bfdfe0; // RGB(224, 223, 191)
    property ButtonArrowColorHover: TColor read FButtonArrowColorHover write SetButtonArrowColorHover default clCream;
    property ButtonArrowColorDisabled: TColor read FButtonArrowColorDisabled write SetButtonArrowColorDisabled default clGray;
    property ButtonArrowNewStyle: Boolean read FButtonArrowNewStyle write SetButtonArrowNewStyle default True;

    property Windows10DarkMode: Boolean read FWindows10DarkMode write SetWindows10DarkMode default False;
  end;

  TComboBox2Ex = class(TCustomComboBox)
  private
    FCustomColorsEnabled: Boolean;
    FSelectionBarCustomColor_Top: TColor;
    FSelectionBarCustomColor_Bottom: TColor;
    FSelectionFontCustomColor: TColor;
    FSelectionShowFrame: Boolean;
    FSelectionShowFrameColor: TColor;
    FShowFocusRect: Boolean;
    FLastUsedStyle: TComboBoxStyle;

    FCustomFontColorDisabled: TColor;
    FCustomColorBk: TColor;
    FCustomColorFont: TColor;

    FFrameColor: TColor;
    FFrameColorFocused: TColor;
    FFrameColorDisabled: TColor;

    FMouseInControl: Boolean;

    FButtonArrow: TBitmap;
    FButtonArrowNewStyle: Boolean;
    FButtonWidth: Integer;
    //FButtonColor: TColor;
    FButtonColorHover: TColor;
    FButtonArrowColor: TColor;
    FButtonArrowColorHover: TColor;
    FButtonArrowColorDisabled: TColor;

    FWindows10DarkMode: Boolean;

    procedure WMPaint(var Message: TWMPaint); message WM_PAINT;

    procedure CNDrawItem(var Message: TWMDrawItem); message CN_DRAWITEM;
    procedure SetCustomColorsEnabled(Value: Boolean);
    procedure SetSelectionBarCustomColor_Top(Value: TColor);
    procedure SetSelectionBarCustomColor_Bottom(Value: TColor);
    procedure SetSelectionFontCustomColor(Value: TColor);
    procedure SetSelectionShowFrame(Value: Boolean);
    procedure SetSelectionShowFrameColor(Value: TColor);
    procedure SetShowFocusRect(Value: Boolean);
    procedure SetCustomFontColorDisabled(Value: TColor);
    procedure SetCustomColorBk(Value: TColor);
    procedure SetCustomColorFont(Value: TColor);

    procedure SetFrameColor(Value: TColor);
    procedure SetFrameColorFocused(Value: TColor);
    procedure SetFrameColorDisabled(Value: TColor);

    procedure SetButtonArrowNewStyle(Value: Boolean);
    procedure SetButtonColorHover(Value: TColor);
    procedure SetButtonArrowColor(Value: TColor);
    procedure SetButtonArrowColorHover(Value: TColor);
    procedure SetButtonArrowColorDisabled(Value: TColor);

    procedure SetWindows10DarkMode(Value: Boolean);
  protected
    procedure DrawItem(Index: Integer; Rect: TRect; State: TOwnerDrawState); override;
    procedure SetStyle(Value: TComboBoxStyle); override;
    procedure WndProc(var Message: TMessage); override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
  published
    property AutoComplete default True;
    property AutoDropDown default False;
    property AutoCloseUp default False;
    property BevelEdges;
    property BevelInner;
    property BevelKind default bkNone;
    property BevelOuter;
    property Style; {Must be published before Items}
    property Anchors;
    property BiDiMode;
    property CharCase;
    property Color;
    property Constraints;
    property Ctl3D;
    property DragCursor;
    property DragKind;
    property DragMode;
    property DropDownCount;
    property Enabled;
    property Font;
    property ImeMode;
    property ImeName;
    property ItemHeight;
    property ItemIndex default -1;
    property MaxLength;
    property ParentBiDiMode;
    property ParentColor;
    property ParentCtl3D;
    property ParentFont;
    property ParentShowHint;
    property PopupMenu;
    property ShowHint;
    property Sorted;
    property TabOrder;
    property TabStop;
    property Text;
    property Visible;
    property OnChange;
    property OnClick;
    property OnCloseUp;
    property OnContextPopup;
    property OnDblClick;
    property OnDragDrop;
    property OnDragOver;
    property OnDrawItem;
    property OnDropDown;
    property OnEndDock;
    property OnEndDrag;
    property OnEnter;
    property OnExit;
    property OnKeyDown;
    property OnKeyPress;
    property OnKeyUp;
    property OnMeasureItem;
    property OnSelect;
    property OnStartDock;
    property OnStartDrag;
    property Items; { Must be published after OnMeasureItem }
    
    property CustomColorsEnabled: Boolean read FCustomColorsEnabled write SetCustomColorsEnabled default False;
    property SelectionBarCustomColor_Top: TColor read FSelectionBarCustomColor_Top write SetSelectionBarCustomColor_Top default clHighlight;
    property SelectionBarCustomColor_Bottom: TColor read FSelectionBarCustomColor_Bottom write SetSelectionBarCustomColor_Bottom default clHighlight;
    property SelectionFontCustomColor: TColor read FSelectionFontCustomColor write SetSelectionFontCustomColor default clHighlightText;
    property SelectionShowFrame: Boolean read FSelectionShowFrame write SetSelectionShowFrame default False;
    property SelectionShowFrameColor: TColor read FSelectionShowFrameColor write SetSelectionShowFrameColor default clNone;
    property ShowFocusRect: Boolean read FShowFocusRect write SetShowFocusRect default True;
    property CustomColorBk: TColor read FCustomColorBk write SetCustomColorBk default clWindow;
    property CustomColorFont: TColor read FCustomColorFont write SetCustomColorFont default clBlack;
    property CustomColorFontDisabled: TColor read FCustomFontColorDisabled write SetCustomFontColorDisabled default clGray;
    property FrameColor: TColor read FFrameColor write SetFrameColor default clGray;
    property FrameColorFocused: TColor read FFrameColorFocused write SetFrameColorFocused default clSilver;
    property FrameColorDisabled: TColor read FFrameColorDisabled write SetFrameColorDisabled default $00505050;

    property ButtonColorHover: TColor read FButtonColorHover write SetButtonColorHover default clNone;
    property ButtonArrowColor: TColor read FButtonArrowColor write SetButtonArrowColor default $00bfdfe0; // RGB(224, 223, 191)
    property ButtonArrowColorHover: TColor read FButtonArrowColorHover write SetButtonArrowColorHover default clCream;
    property ButtonArrowColorDisabled: TColor read FButtonArrowColorDisabled write SetButtonArrowColorDisabled default clGray;
    property ButtonArrowNewStyle: Boolean read FButtonArrowNewStyle write SetButtonArrowNewStyle default True;

    property Windows10DarkMode: Boolean read FWindows10DarkMode write SetWindows10DarkMode default False;
  end;

procedure Register;
procedure DrawGradient(ACanvas: TCanvas; ColorTop: TColor; ColorBottom: TColor; ARect: TRect; Steps: Integer = 64);
function  DarkenColor(Color: TColor; Perc: Integer): TColor;
function  Blend(Color1, Color2: TColor; A: Byte): TColor;

implementation

{$R ColorBoxEx.res}

procedure Register;
begin
  RegisterComponents('Components', [TColorBoxEx, TComboBox2Ex]);
end;

constructor TColorBoxEx.Create(AOwner: TComponent);
begin
  inherited;
  FCustomColorsEnabled:= False;
  FSelectionBarCustomColor_Top:= clHighlight;
  FSelectionBarCustomColor_Bottom:= clHighlight;
  FSelectionFontCustomColor:= clHighlightText;;
  FSelectionShowFrame:= False;
  FSelectionShowFrameColor:= clNone;
  FShowFocusRect:= True;
  FCustomColorBk:= clWindow;
  FCustomColorFont:= clBlack;
  FCustomFontColorDisabled:= clGray;
  FFrameColor:= clGray;
  FFrameColorFocused:= clSilver;
  FFrameColorDisabled:= $00505050;

  FMouseInControl := False;
  FButtonWidth:= GetSystemMetrics(SM_CXVSCROLL);//+2;

  FButtonColorHover := clNone;
  FButtonArrowColor := $00bfdfe0; // RGB(224, 223, 191)
  FButtonArrowColorHover := clCream;
  FButtonArrowColorDisabled := clGray;

  FButtonArrowNewStyle:= True;
  FButtonArrow:= TBitmap.Create;
  FButtonArrow.Transparent:= True;
  FButtonArrow.TransparentColor:= clWhite;
  FButtonArrow.Handle:= LoadBitmap(HInstance, PChar('DOWNARROW2'));

  FWindows10DarkMode := False;
end;

destructor TColorBoxEx.Destroy;
begin
  FButtonArrow.Free;
  inherited Destroy;
end;

procedure TColorBoxEx.SetCustomColorsEnabled(Value: Boolean);
begin
  if FCustomColorsEnabled <> Value then
     begin
       FCustomColorsEnabled:= Value;
       RecreateWnd;
     end;
end;

procedure TColorBoxEx.SetSelectionBarCustomColor_Top(Value: TColor);
begin
  if FSelectionBarCustomColor_Top <> Value then
     begin
       FSelectionBarCustomColor_Top:= Value;
       Invalidate;
     end;
end;

procedure TColorBoxEx.SetSelectionBarCustomColor_Bottom(Value: TColor);
begin
  if FSelectionBarCustomColor_Bottom <> Value then
     begin
       FSelectionBarCustomColor_Bottom:= Value;
       Invalidate;
     end;
end;

procedure TColorBoxEx.SetSelectionFontCustomColor(Value: TColor);
begin
  if FSelectionFontCustomColor <> Value then
     begin
       FSelectionFontCustomColor:= Value;
       Invalidate;
     end;
end;

procedure TColorBoxEx.SetSelectionShowFrame(Value: Boolean);
begin
  if FSelectionShowFrame <> Value then
     begin
       FSelectionShowFrame:= Value;
       Invalidate;
     end;
end;

procedure TColorBoxEx.SetSelectionShowFrameColor(Value: TColor);
begin
  if FSelectionShowFrameColor <> Value then
     begin
       FSelectionShowFrameColor:= Value;
       Invalidate;
     end;
end;

procedure TColorBoxEx.SetShowFocusRect(Value: Boolean);
begin
  if FShowFocusRect <> Value then
     begin
       FShowFocusRect:= Value;
       Invalidate;
     end;
end;

procedure TColorBoxEx.SetCustomColorBk(Value: TColor);
begin
  if FCustomColorBk <> Value then
     begin
       FCustomColorBk:= Value;
       Invalidate;
     end;
end;

procedure TColorBoxEx.SetCustomColorFont(Value: TColor);
begin
  if FCustomColorFont <> Value then
     begin
       FCustomColorFont:= Value;
       Invalidate;
     end;
end;

procedure TColorBoxEx.SetCustomFontColorDisabled(Value: TColor);
begin
  if FCustomFontColorDisabled <> Value then
     begin
       FCustomFontColorDisabled:= Value;
       Invalidate;
     end;
end;

procedure TColorBoxEx.SetFrameColor(Value: TColor);
begin
  if FFrameColor <> Value then
     begin
       FFrameColor:= Value;
         if FCustomColorsEnabled and (not (csDesigning in ComponentState)) then
            Invalidate;
     end;
end;

procedure TColorBoxEx.SetFrameColorFocused(Value: TColor);
begin
  if FFrameColorFocused <> Value then
     begin
       FFrameColorFocused:= Value;
       if FCustomColorsEnabled and (not (csDesigning in ComponentState)) then
          Invalidate;
     end;
end;

procedure TColorBoxEx.SetFrameColorDisabled(Value: TColor);
begin
  if FFrameColorDisabled <> Value then
     begin
       FFrameColorDisabled:= Value;
       if FCustomColorsEnabled and (not (csDesigning in ComponentState)) then
          Invalidate;
     end;
end;

procedure TColorBoxEx.SetButtonColorHover(Value: TColor);
begin
  if FButtonColorHover <> Value then
     begin
       FButtonColorHover:= Value;
       if FCustomColorsEnabled and (not (csDesigning in ComponentState)) then
          Invalidate;
     end;
end;

procedure TColorBoxEx.SetButtonArrowColor(Value: TColor);
begin
  if FButtonArrowColor <> Value then
     begin
       FButtonArrowColor:= Value;
       if FCustomColorsEnabled and (not (csDesigning in ComponentState)) then
          Invalidate;
     end;
end;

procedure TColorBoxEx.SetButtonArrowColorHover(Value: TColor);
begin
  if FButtonArrowColorHover <> Value then
     begin
       FButtonArrowColorHover:= Value;
       if FCustomColorsEnabled and (not (csDesigning in ComponentState)) then
          Invalidate;
     end;
end;

procedure TColorBoxEx.SetButtonArrowColorDisabled(Value: TColor);
begin
  if FButtonArrowColorDisabled <> Value then
     begin
       FButtonArrowColorDisabled:= Value;
       if FCustomColorsEnabled and (not (csDesigning in ComponentState)) then
          Invalidate;
     end;
end;

procedure TColorBoxEx.SetButtonArrowNewStyle(Value: Boolean);
begin
  if FButtonArrowNewStyle <> Value then
     begin
       FButtonArrowNewStyle:= Value;
       if FCustomColorsEnabled and (not (csDesigning in ComponentState)) then
          begin
            FButtonArrow:= nil;
            if FButtonArrowNewStyle then
               FButtonArrow.Handle:= LoadBitmap(HInstance, PChar('DOWNARROW2'))
            else
               FButtonArrow.Handle:= LoadBitmap(HInstance, PChar('DOWNARROW'));
            Invalidate;
          end;
     end;
end;

procedure TColorBoxEx.SetWindows10DarkMode(Value: Boolean);
begin
  //FEditHandle: HWnd;
  //FListHandle: HWnd;
  //FDropHandle
  if FWindows10DarkMode <> Value then
  begin
    FWindows10DarkMode := Value;

    //if FWindows10DarkMode then
    //begin
    //  SetWindowTheme(FListHandle, 'DarkMode_Explorer', nil);
    //  SetWindowTheme(FDropHandle, 'DarkMode_Explorer', nil);
    //end
    //else
    //begin
    //  SetWindowTheme(FListHandle, nil, nil);
    //  SetWindowTheme(FDropHandle, nil, nil);
    //end
  end;

end;

function TColorBoxEx.GetCustomColorRGBText(cColor: TColor): String;
var
  iColor: TColor;
  R, G, B: Byte;
begin
  if cColor = clNone then
     begin
       Result:= '';
       Exit;
     end;

  iColor:= ColorToRGB(cColor);
  R := GetRValue(iColor);
  G := GetGValue(iColor);
  B := GetBValue(iColor);

  Result:= 'Custom RGB('+
           IntToStr(R) + ', ' +
           IntToStr(G) + ', ' +
           IntToStr(B) + ')';
end;

procedure TColorBoxEx.WndProc(var Message: TMessage);
begin
  case Message.Msg of
    CM_MouseEnter:
      begin
        if not FMouseInControl then
           FMouseInControl := True;
      end;
    CM_MouseLeave:
      begin
        if FMouseInControl then
           FMouseInControl := False;
      end;
  end;
  inherited;
end;

procedure TColorBoxEx.DrawItem(Index: Integer; Rect: TRect;
  State: TOwnerDrawState);

  function ColorToBorderColor(AColor: TColor): TColor;
  begin
    if odSelected in State then
       Result := clWhite
    else
       Result := clGray;
  end;

var
  LRect: TRect;
  LBackground: TColor;
  iColorCaption: String;
  iFrame, iGradient: Boolean;
begin
  // modified to show "Custom RGB(???, ???, ???)" label, and gradient bk selection bar
  iGradient:= FCustomColorsEnabled and (FSelectionBarCustomColor_Top <> FSelectionBarCustomColor_Bottom);
  if iGradient and (odSelected in State) then
     DrawGradient(Canvas, FSelectionBarCustomColor_Top, FSelectionBarCustomColor_Bottom, Rect);
  with Canvas do
  begin
    if (not iGradient) or (not ((odSelected in State))) then
       FillRect(Rect);
    LBackground := Brush.Color;

    LRect := Rect;
    LRect.Right := LRect.Bottom - LRect.Top + LRect.Left;
    InflateRect(LRect, -1, -1);
    Brush.Color := Colors[Index];
    if Brush.Color = clDefault then
       Brush.Color := DefaultColorColor
    else if Brush.Color = clNone then
       Brush.Color := NoneColorColor;
    FillRect(LRect);
    Brush.Color := ColorToBorderColor(ColorToRGB(Brush.Color));
    FrameRect(LRect);

    Brush.Color := LBackground;

    if Pos('Custom', Items[Index]) <> 0 then
       iColorCaption:= GetCustomColorRGBText(TColor(Items.Objects[Index]))
    else
       iColorCaption:= Items[Index];

    if (odSelected in State) then
    begin
      iFrame:= FSelectionShowFrame and FCustomColorsEnabled;
      if iFrame then
      begin
        if not iGradient then
           iFrame:= (FSelectionShowFrameColor <> clNone) and (FSelectionShowFrameColor <> FSelectionBarCustomColor_Top);
      end;
      if iFrame then
      begin
        Canvas.Brush.Color := FSelectionShowFrameColor;
        FrameRect(Rect);
      end;
    end;
    Brush.Style:= bsClear;
    Rect.Left := LRect.Right + 5;

    if not Enabled then
       Canvas.Font.Color:= FCustomFontColorDisabled;
    TextRect(Rect, Rect.Left,
             Rect.Top + (Rect.Bottom - Rect.Top - TextHeight(Items[Index])) div 2,
             iColorCaption);
  end;
end;

procedure TColorBoxEx.CNDrawItem(var Message: TWMDrawItem);
var
  State: TOwnerDrawState;
  iFrame, iGradient: Boolean;
begin
  iFrame:= False;
  iGradient:= FCustomColorsEnabled and (FSelectionBarCustomColor_Top <> FSelectionBarCustomColor_Bottom);
  with Message.DrawItemStruct^ do
  begin
    State := TOwnerDrawState(LongRec(itemState).Lo);
    if itemState and ODS_COMBOBOXEDIT <> 0 then
       Include(State, odComboBoxEdit);
    if itemState and ODS_DEFAULT <> 0 then
       Include(State, odDefault);
    Canvas.Handle := hDC;
    Canvas.Font := Font;
    Canvas.Brush := Brush;
    if FCustomColorsEnabled then
       begin
         Canvas.Font.Color:= FCustomColorFont;
         Canvas.Brush.Color:= FCustomColorBk;
       end;
    if (Integer(itemID) >= 0) and (odSelected in State) then
    begin
      if FCustomColorsEnabled then
      begin
        Canvas.Brush.Color := FSelectionBarCustomColor_Top;
        Canvas.Font.Color := FSelectionFontCustomColor;
      end
      else
      begin
        Canvas.Brush.Color := clHighlight;
        Canvas.Font.Color := clHighlightText;
      end;
    end;
    if Integer(itemID) >= 0 then
    begin
      DrawItem(itemID, rcItem, State);

      if (odSelected in State) then
      begin
        iFrame:= FSelectionShowFrame and FCustomColorsEnabled;
        if iFrame then
        begin
          if not iGradient then
             iFrame:= (FSelectionShowFrameColor <> clNone) and (FSelectionShowFrameColor <> FSelectionBarCustomColor_Top);
        end;
      end
    end
    else
       Canvas.FillRect(rcItem);

    if ShowFocusRect and not iFrame then
       if odFocused in State then DrawFocusRect(hDC, rcItem);

    Canvas.Handle := 0;
  end;
end;

procedure TColorBoxEx.WMPaint(var Message: TWMPaint);
var
  //C: TControlCanvas;
  R: TRect;
  aColor: TColor;
  DC: HDC;

  procedure DrawButton;
  var
    ARect: TRect;
    //pt: array of TPoint;
  begin
    ARect.Top:= ClientRect.Top+1;
    ARect.Bottom:= ClientRect.Bottom-1;
    ARect.Left:= ClientRect.Right-FButtonWidth-1;
    ARect.Right:= ClientRect.Right-1;

    //Canvas.Brush.Color:= FCustomColorBk;
    if FMouseInControl or Self.Focused or Self.DroppedDown then
       begin
         if FButtonColorHover <> clNone then
            Canvas.Brush.Color:= FButtonColorHover
         else
            Canvas.Brush.Color:= FCustomColorBk;
       end
    else
       Canvas.Brush.Color:= FCustomColorBk;

    Canvas.FillRect(ARect);

    // polygon painting doesn't work properly; pen color keep resseting to black and there's massive flickering/repainting
    //Canvas.Brush.Color:= aColor;
    //Canvas.Pen.Color:= aColor;
    //SetLength(pt, 3);
    //pt[0].X := ARect.Left + 5;
    //pt[0].y := ARect.Top + 8;

    //pt[1].X := ARect.Left + 11;
    //pt[1].y := ARect.Top + 8;

    //pt[2].X := ARect.Left + 8;
    //pt[2].y := ARect.Top + 11;

    //Canvas.Polygon(pt);

    SetTextColor(Canvas.Handle, ColorToRGB(aColor));
    //SetBkColor(Canvas.Handle WParam, ColorToRGB(Brush.Color));

    BitBlt(DC, ARect.Left+5, ARect.Top+8, FButtonArrow.Width, FButtonArrow.Height, FButtonArrow.Canvas.Handle, 0, 0, SRCCOPY);
    //Canvas.Draw( ARect.Left+5{6}, ARect.Top+8{9}, FButtonArrow); // results is heavy flickering and repainting nightmare!
  end;

begin
  inherited;
  if (not FCustomColorsEnabled) or (csDesigning in ComponentState) then
     Exit;

  DC:= GetWindowDC(Handle);
  SaveDC(DC);
  try
    try
      Canvas.Handle:= DC;
      //Canvas.Lock;

      R := ClientRect;
      if not Enabled then
      begin
        aColor:= FButtonArrowColorDisabled;
        Canvas.Brush.Color := FFrameColorDisabled;
      end
      else
      if FMouseInControl or Self.Focused or Self.DroppedDown then
      begin
        aColor:= FButtonArrowColorHover;
        Canvas.Brush.Color := FFrameColorFocused;
      end
      else
         begin
           aColor:= FButtonArrowColor;
           Canvas.Brush.Color := FFrameColor;
         end;

      Canvas.FrameRect(R);
      DrawButton;

      Canvas.Brush.Color := FCustomColorBk;
      InflateRect(R, -1, -1);
      R.Right:= R.Right-FButtonWidth;// 17;

      Canvas.FrameRect(R);
      InflateRect(R, -1, -1);
      Canvas.FrameRect(R);

      //DrawButton;

    finally
      //Canvas.Unlock;
    end;
  finally
    RestoreDC(DC, -1);
    ReleaseDC(Handle, DC);
  end;
end;

// TComboBox2Ex

constructor TComboBox2Ex.Create(AOwner: TComponent);
begin
  inherited;
  FLastUsedStyle:= Style;
  FCustomColorsEnabled:= False;
  FSelectionBarCustomColor_Top:= clHighlight;
  FSelectionBarCustomColor_Bottom:= clHighlight;
  FSelectionFontCustomColor:= clHighlightText;
  FSelectionShowFrame:= False;
  FSelectionShowFrameColor:= clNone;
  FShowFocusRect:= True;
  FCustomColorBk:= clWindow;
  FCustomColorFont:= clBlack;
  FCustomFontColorDisabled:= clGray;

  FFrameColor:= clGray;
  FFrameColorFocused:= clSilver;
  FFrameColorDisabled:= $00505050;

  FMouseInControl := False;
  FButtonWidth:= GetSystemMetrics(SM_CXVSCROLL)+2;

  FButtonColorHover := clNone;
  FButtonArrowColor := $00bfdfe0; // RGB(224, 223, 191)
  FButtonArrowColorHover := clCream;
  FButtonArrowColorDisabled := clGray;

  FButtonArrowNewStyle:= True;
  FButtonArrow:= TBitmap.Create;
  //FButtonArrow.PixelFormat:= pf1bit;
  FButtonArrow.Transparent:= True;
  FButtonArrow.TransparentColor:= clWhite;
  FButtonArrow.Handle:= LoadBitmap(HInstance, PChar('DOWNARROW2'));

  FWindows10DarkMode := False;
end;

destructor TComboBox2Ex.Destroy;
begin
  FButtonArrow.Free;
  inherited Destroy;
end;

procedure TComboBox2Ex.SetStyle(Value: TComboBoxStyle);
begin
  inherited;
  if not FCustomColorsEnabled then
     FLastUsedStyle := Value;
end;

procedure TComboBox2Ex.SetCustomColorsEnabled(Value: Boolean);
begin
  if FCustomColorsEnabled <> Value then
     begin
       if Value then
          FLastUsedStyle := Style;
       FCustomColorsEnabled:= Value;
       if Value then
          SetStyle(csOwnerDrawFixed) // to disable Windows theme painting
       else
          SetStyle(FLastUsedStyle);
       RecreateWnd;
     end;
end;

procedure TComboBox2Ex.SetSelectionBarCustomColor_Top(Value: TColor);
begin
  if FSelectionBarCustomColor_Top <> Value then
     begin
       FSelectionBarCustomColor_Top:= Value;
       Invalidate;
     end;
end;

procedure TComboBox2Ex.SetSelectionBarCustomColor_Bottom(Value: TColor);
begin
  if FSelectionBarCustomColor_Bottom <> Value then
     begin
       FSelectionBarCustomColor_Bottom:= Value;
       Invalidate;
     end;
end;

procedure TComboBox2Ex.SetSelectionFontCustomColor(Value: TColor);
begin
  if FSelectionFontCustomColor <> Value then
     begin
       FSelectionFontCustomColor:= Value;
       Invalidate;
     end;
end;

procedure TComboBox2Ex.SetSelectionShowFrame(Value: Boolean);
begin
  if FSelectionShowFrame <> Value then
     begin
       FSelectionShowFrame:= Value;
       Invalidate;
     end;
end;

procedure TComboBox2Ex.SetSelectionShowFrameColor(Value: TColor);
begin
  if FSelectionShowFrameColor <> Value then
     begin
       FSelectionShowFrameColor:= Value;
       Invalidate;
     end;
end;

procedure TComboBox2Ex.SetShowFocusRect(Value: Boolean);
begin
  if FShowFocusRect <> Value then
     begin
       FShowFocusRect:= Value;
       Invalidate;
     end;
end;

procedure TComboBox2Ex.SetCustomColorBk(Value: TColor);
begin
  if FCustomColorBk <> Value then
     begin
       FCustomColorBk:= Value;
       Invalidate;
     end;
end;

procedure TComboBox2Ex.SetCustomColorFont(Value: TColor);
begin
  if FCustomColorFont <> Value then
     begin
       FCustomColorFont:= Value;
       Invalidate;
     end;
end;

procedure TComboBox2Ex.SetCustomFontColorDisabled(Value: TColor);
begin
  if FCustomFontColorDisabled <> Value then
     begin
       FCustomFontColorDisabled:= Value;
       Invalidate;
     end;
end;

procedure TComboBox2Ex.SetFrameColor(Value: TColor);
begin
  if FFrameColor <> Value then
     begin
       FFrameColor:= Value;
         if FCustomColorsEnabled and (not (csDesigning in ComponentState)) then
            Invalidate;
     end;
end;

procedure TComboBox2Ex.SetFrameColorFocused(Value: TColor);
begin
  if FFrameColorFocused <> Value then
     begin
       FFrameColorFocused:= Value;
       if FCustomColorsEnabled and (not (csDesigning in ComponentState)) then
          Invalidate;
     end;
end;

procedure TComboBox2Ex.SetFrameColorDisabled(Value: TColor);
begin
  if FFrameColorDisabled <> Value then
     begin
       FFrameColorDisabled:= Value;
       if FCustomColorsEnabled and (not (csDesigning in ComponentState)) then
          Invalidate;
     end;
end;

procedure TComboBox2Ex.SetButtonColorHover(Value: TColor);
begin
  if FButtonColorHover <> Value then
     begin
       FButtonColorHover:= Value;
       if FCustomColorsEnabled and (not (csDesigning in ComponentState)) then
          Invalidate;
     end;
end;

procedure TComboBox2Ex.SetButtonArrowColor(Value: TColor);
begin
  if FButtonArrowColor <> Value then
     begin
       FButtonArrowColor:= Value;
       if FCustomColorsEnabled and (not (csDesigning in ComponentState)) then
          Invalidate;
     end;
end;

procedure TComboBox2Ex.SetButtonArrowColorHover(Value: TColor);
begin
  if FButtonArrowColorHover <> Value then
     begin
       FButtonArrowColorHover:= Value;
       if FCustomColorsEnabled and (not (csDesigning in ComponentState)) then
          Invalidate;
     end;
end;

procedure TComboBox2Ex.SetButtonArrowColorDisabled(Value: TColor);
begin
  if FButtonArrowColorDisabled <> Value then
     begin
       FButtonArrowColorDisabled:= Value;
       if FCustomColorsEnabled and (not (csDesigning in ComponentState)) then
          Invalidate;
     end;
end;

procedure TComboBox2Ex.SetButtonArrowNewStyle(Value: Boolean);
begin
  if FButtonArrowNewStyle <> Value then
     begin
       FButtonArrowNewStyle:= Value;
       if FCustomColorsEnabled and (not (csDesigning in ComponentState)) then
          begin
            FButtonArrow:= nil;
            if FButtonArrowNewStyle then
               FButtonArrow.Handle:= LoadBitmap(HInstance, PChar('DOWNARROW2'))
            else
               FButtonArrow.Handle:= LoadBitmap(HInstance, PChar('DOWNARROW'));
            Invalidate;
          end;
     end;
end;

procedure TComboBox2Ex.SetWindows10DarkMode(Value: Boolean);
begin
  if FWindows10DarkMode <> Value then
     FWindows10DarkMode := Value;
end;

procedure TComboBox2Ex.WndProc(var Message: TMessage);
begin
  case Message.Msg of
    CM_MouseEnter:
      begin
        if not FMouseInControl then
           FMouseInControl := True;
      end;
    CM_MouseLeave:
      begin
        if FMouseInControl then
           FMouseInControl := False;
      end;
  end;
  inherited;
end;

procedure TComboBox2Ex.DrawItem(Index: Integer; Rect: TRect; State: TOwnerDrawState);
var
  iFrame, iGradient: Boolean;
  fR: TRect;
begin
  iGradient:= FCustomColorsEnabled and (FSelectionBarCustomColor_Top <> FSelectionBarCustomColor_Bottom);

  TControlCanvas(Canvas).UpdateTextFlags;
  if Assigned(OnDrawItem) then OnDrawItem(Self, Index, Rect, State)
  else
  begin
    if iGradient and (odSelected in State) and (Index >= 0) then
       DrawGradient(Canvas, FSelectionBarCustomColor_Top, FSelectionBarCustomColor_Bottom, Rect)
    else
       Canvas.FillRect(Rect);

    if (odSelected in State) then
    begin
      iFrame:= FSelectionShowFrame and FCustomColorsEnabled;
      if iFrame then
      begin
        if not iGradient then
           iFrame:= (FSelectionShowFrameColor <> clNone) and (FSelectionShowFrameColor <> FSelectionBarCustomColor_Top);
      end;
      if iFrame then
      begin
        fR:= Rect;
        if not Self.DroppedDown then
           fR.Right:= fR.Right-2;
        Canvas.Brush.Color := FSelectionShowFrameColor;
        FrameRect(Canvas.Handle, fR, Canvas.Brush.Handle);
      end;
    end;

    Canvas.Brush.Style:= bsClear;
    if not Enabled then
       Canvas.Font.Color:= FCustomFontColorDisabled;

    if Index >= 0 then
       Canvas.TextOut(Rect.Left + 2, Rect.Top, Items[Index]); // TextOut goes beyond the Rect, TextRect cuts text out if it doesn't fit

    {if Index >= 0 then
       begin
         if (odSelected in State) then
         begin
           iFrame:= FSelectionShowFrame and FCustomColorsEnabled;
           if iFrame then
           begin
             if not iGradient then
                iFrame:= (FSelectionShowFrameColor <> clNone) and (FSelectionShowFrameColor <> FSelectionBarCustomColor_Top);
           end;
           if iFrame then
           begin
             Canvas.Brush.Color := FSelectionShowFrameColor;
             FrameRect(Canvas.Handle, Rect, Canvas.Brush.Handle);
           end;
         end;

         Canvas.Brush.Style:= bsClear;
         if not Enabled then
            Canvas.Font.Color:= FCustomFontColorDisabled;
         Canvas.TextOut(Rect.Left + 2, Rect.Top, Items[Index]); // TextOut goes beyond the Rect, TextRect cuts text out if it doesn't fit
       end;}
  end;
end;

procedure TComboBox2Ex.CNDrawItem(var Message: TWMDrawItem);
var
  State: TOwnerDrawState;
  iFrame, iGradient: Boolean;
begin
  iFrame:= False;
  iGradient:= FCustomColorsEnabled and (FSelectionBarCustomColor_Top <> FSelectionBarCustomColor_Bottom);
  with Message.DrawItemStruct^ do
  begin
    State := TOwnerDrawState(LongRec(itemState).Lo);
    if itemState and ODS_COMBOBOXEDIT <> 0 then
       Include(State, odComboBoxEdit);
    if itemState and ODS_DEFAULT <> 0 then
       Include(State, odDefault);
    Canvas.Handle := hDC;
    Canvas.Font := Font;
    Canvas.Brush := Brush;
    if FCustomColorsEnabled then
       begin
         Canvas.Font.Color:= FCustomColorFont;
         Canvas.Brush.Color:= FCustomColorBk;
       end;
    if (Integer(itemID) >= 0) and (odSelected in State) then
    begin
      if FCustomColorsEnabled then
      begin
        Canvas.Brush.Color := FSelectionBarCustomColor_Top;
        Canvas.Font.Color := FSelectionFontCustomColor;
      end
      else
      begin
        Canvas.Brush.Color := clHighlight;
        Canvas.Font.Color := clHighlightText
      end;
    end;

    {if (odSelected in State) then
    begin
      iFrame:= FSelectionShowFrame and FCustomColorsEnabled;
      if iFrame then
      begin
        if not iGradient then
           iFrame:= (FSelectionShowFrameColor <> clNone) and (FSelectionShowFrameColor <> FSelectionBarCustomColor_Top);
      end;
    end;
    DrawItem(itemID, rcItem, State);}

    if Integer(itemID) >= 0 then
    begin
      DrawItem(itemID, rcItem, State);

      if (odSelected in State) then
      begin
        iFrame:= FSelectionShowFrame and FCustomColorsEnabled;
        if iFrame then
        begin
          if not iGradient then
             iFrame:= (FSelectionShowFrameColor <> clNone) and (FSelectionShowFrameColor <> FSelectionBarCustomColor_Top);
        end;
      end;
    end
    else
      Canvas.FillRect(rcItem); //DrawItem(itemID, rcItem, State); //Canvas.FillRect(rcItem);}

    if ShowFocusRect and (not iFrame) then
       if odFocused in State then DrawFocusRect(hDC, rcItem);

    Canvas.Handle := 0;
  end;
end;

procedure TComboBox2Ex.WMPaint(var Message: TWMPaint);
var
  //C: TControlCanvas;
  R: TRect;
  aColor: TColor;
  DC: HDC;

  procedure DrawButton;
  var
    ARect: TRect;
    //pt: array of TPoint;
  begin
    ARect.Top:= ClientRect.Top+1;
    ARect.Bottom:= ClientRect.Bottom-1;
    ARect.Left:= ClientRect.Right-FButtonWidth-1;
    ARect.Right:= ClientRect.Right-1;

    //Canvas.Brush.Color:= FCustomColorBk;
    if FMouseInControl or Self.Focused or Self.DroppedDown then
       begin
         if FButtonColorHover <> clNone then
            Canvas.Brush.Color:= FButtonColorHover
         else
            Canvas.Brush.Color:= FCustomColorBk;
       end
    else
       Canvas.Brush.Color:= FCustomColorBk;

    Canvas.FillRect(ARect);

    // polygon painting doesn't work properly; pen color keep resseting to black and there's massive flickering/repainting
    //Canvas.Brush.Color:= aColor;
    //Canvas.Pen.Color:= aColor;
    //SetLength(pt, 3);
    //pt[0].X := ARect.Left + 5;
    //pt[0].y := ARect.Top + 8;

    //pt[1].X := ARect.Left + 11;
    //pt[1].y := ARect.Top + 8;

    //pt[2].X := ARect.Left + 8;
    //pt[2].y := ARect.Top + 11;

    //Canvas.Polygon(pt);

    SetTextColor(Canvas.Handle, ColorToRGB(aColor));
    //SetBkColor(Canvas.Handle WParam, ColorToRGB(Brush.Color));

    BitBlt(DC, ARect.Left+5, ARect.Top+8, FButtonArrow.Width, FButtonArrow.Height, FButtonArrow.Canvas.Handle, 0, 0, SRCCOPY);
    //Canvas.Draw( ARect.Left+5{6}, ARect.Top+8{9}, FButtonArrow); // results is heavy flickering and repainting nightmare!
  end;

begin
  inherited;
  if (not FCustomColorsEnabled) or (csDesigning in ComponentState) then
     Exit;

  DC:= GetWindowDC(Handle);
  SaveDC(DC);
  try
    try
      Canvas.Handle:= DC;
      //Canvas.Lock;

      R := ClientRect;
      if not Enabled then
      begin
        aColor:= FButtonArrowColorDisabled;
        Canvas.Brush.Color := FFrameColorDisabled;
      end
      else
      if FMouseInControl or Self.Focused or Self.DroppedDown then
      begin
        aColor:= FButtonArrowColorHover;
        Canvas.Brush.Color := FFrameColorFocused;
      end
      else
         begin
           aColor:= FButtonArrowColor;
           Canvas.Brush.Color := FFrameColor;
         end;

      Canvas.FrameRect(R);
      DrawButton;

      Canvas.Brush.Color := FCustomColorBk;
      InflateRect(R, -1, -1);
      R.Right:= R.Right-FButtonWidth;

      Canvas.FrameRect(R);
      InflateRect(R, -1, -1);
      Canvas.FrameRect(R);
    finally
      //Canvas.Unlock;
    end;
  finally
    RestoreDC(DC, -1);
    ReleaseDC(Handle, DC);
  end;

  //C := TControlCanvas.Create;
  //try
  //  C.Control:= Self;
  //  with C do
  //  begin
  //    R := ClientRect;
  //    if not Enabled then
  //       C.Brush.Color := FFrameColorDisabled
  //    else
  //    if FMouseInControl or Self.Focused or Self.DroppedDown then
  //       C.Brush.Color := FFrameColorFocused
  //    else
  //       C.Brush.Color := FFrameColor;

  //    C.FrameRect(R);
  //    C.Brush.Color := FCustomColorBk;
  //    InflateRect(R, -1, -1);
  //    R.Right:= R.Right-FButtonWidth;// 17;
  //    C.FrameRect(R);
  //    InflateRect(R, -1, -1);
  //    C.FrameRect(R);
  //  end;
  //finally
  //  C.Free;
  //end;
end;

procedure DrawGradient(ACanvas: TCanvas; ColorTop: TColor; ColorBottom: TColor; ARect: TRect; Steps: Integer = 64);
var
  diffr, startr, endr: Integer;
  diffg, startg, endg: Integer;
  diffb, startb, endb: Integer;
  iend: Integer;
  imgWidth, imgHeight: Integer;
  rstepr, rstepg, rstepb, rstepw: Real;
  i,stepw: Word;
  bmp: TBitmap;
  FromColor, ToColor: TColor;
begin
  if Steps = 0 then
     Steps := 1;

  imgWidth  := (ARect.Right-ARect.Left);
  imgHeight := (ARect.Bottom-ARect.Top);

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

  rstepw := (imgHeight) / Steps; // (R.Bottom - R.Top) / (Steps ); // vertical

  bmp := TBitmap.Create;
  bmp.PixelFormat := pf24Bit;
  bmp.Width := imgWidth;
  bmp.Height := imgHeight;

  bmp.Canvas.Lock;

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

      iend := ClipRect.Top + stepw + Trunc(rstepw)+1;
      if iend > ClipRect.Bottom then
        iend := ClipRect.Bottom;
      Rectangle(ClipRect.Left, ClipRect.Top + stepw, ClipRect.Right, iend);
    end;
  end;
  bmp.Canvas.UnLock;
  ACanvas.Draw(ARect.Left, ARect.Top, bmp);
  bmp.Free;
end;

function DarkenColor(Color: TColor; Perc: Integer): TColor;
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

function Blend(Color1, Color2: TColor; A: Byte): TColor;
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


end.
