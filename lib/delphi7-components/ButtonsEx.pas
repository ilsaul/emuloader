unit ButtonsEx;

{$S-,W-,R-,H+,X+}
{$C PRELOAD}

interface

uses Windows, Messages, Classes, Controls, Forms, Graphics, StdCtrls,
     ExtCtrls, CommCtrl, ImgList, Math, Themes;

type
  TButtonLayoutEx = (blGlyphLeft, blGlyphRight, blGlyphTop, blGlyphBottom);
  TButtonStateEx  = (bsUp, bsDisabled, bsDown, bsExclusive);
  TButtonStyleEx  = (bsAutoDetect, bsWin31, bsNew);

  TSpeedButtonEx = class;

  TSpeedButtonExActionLink = class(TControlActionLink)
  protected
    FClient:  TSpeedButtonEx;
    procedure AssignClient(AClient: TObject); override;
    function  IsCheckedLinked: Boolean; override;
    function  IsGroupIndexLinked: Boolean; override;
    procedure SetGroupIndex(Value: Integer); override;
    procedure SetChecked(Value: Boolean); override;
  end;

  TSpeedButtonEx = class(TGraphicControl)
  private
    FGroupIndex: Integer;

    FImageChangeLink: TChangeLink; // added June 03, 2019
    FImageIndex: TImageIndex;      // added June 03, 2019
    FImages: TCustomImageList;     // added June 03, 2019

    FDown: Boolean;
    FDragging: Boolean;
    FAllowAllUp: Boolean;
    FLayout: TButtonLayoutEx;
    FSpacing: Integer;
    FTransparent: Boolean;
    FMargin: Integer;
    FFlat: Boolean;
    FMouseInControl: Boolean;

    // custom colors
    FGradientColorTop,
    FGradientColorBottom,
    FFrameColor,
    FFrameColor_Focused,

    FGradientColorTop_Hover,
    FGradientColorBottom_Hover,
    FFrameColor_Hover,

    FGradientColorTop_Down,
    FGradientColorBottom_Down,
    FFrameColor_Down,

    FFontColorDisabled,
    FFontShadowColorDisabled,
    FGradientColorTop_Disabled,
    FGradientColorBottom_Disabled,
    FFrameColor_Disabled: TColor;

    FShowFontShadow_Disabled: Boolean;

    FUseCustomDraw: Boolean;

    FCaptionVertIndent: Integer; // added by Ciro Alfredo Consentino (XXX) readded by Moreno Cattaneo for missing source

    procedure ImageListChange(Sender: TObject);      // added June 04, 2019
    procedure SetImageIndex(Value: TImageIndex);     // added June 04, 2019
    procedure SetImages(Value: TCustomImageList);    // added June 04, 2019

    procedure UpdateExclusive;
    procedure SetDown(Value: Boolean);
    procedure SetFlat(Value: Boolean);
    procedure SetAllowAllUp(Value: Boolean);
    procedure SetGroupIndex(Value: Integer);
    procedure SetLayout(Value: TButtonLayoutEx);
    procedure SetSpacing(Value: Integer);
    procedure SetTransparent(Value: Boolean);
    procedure SetMargin(Value: Integer);
    procedure UpdateTracking;
    procedure WMLButtonDblClk(var Message: TWMLButtonDown); message WM_LBUTTONDBLCLK;
    procedure CMEnabledChanged(var Message: TMessage); message CM_ENABLEDCHANGED;
    procedure CMButtonPressed(var Message: TMessage); message CM_BUTTONPRESSED;
    procedure CMDialogChar(var Message: TCMDialogChar); message CM_DIALOGCHAR;
    procedure CMFontChanged(var Message: TMessage); message CM_FONTCHANGED;
    procedure CMTextChanged(var Message: TMessage); message CM_TEXTCHANGED;
    procedure CMSysColorChange(var Message: TMessage); message CM_SYSCOLORCHANGE;
    procedure CMMouseEnter(var Message: TMessage); message CM_MOUSEENTER;
    procedure CMMouseLeave(var Message: TMessage); message CM_MOUSELEAVE;

    // custom colors
    procedure SetGradientColorTop(Value: TColor);
    procedure SetGradientColorBottom(Value: TColor);
    procedure SetFrameColor(Value: TColor);
    procedure SetFrameColor_Focused(Value: TColor);

    procedure SetGradientColorTop_Hover(Value: TColor);
    procedure SetGradientColorBottom_Hover(Value: TColor);
    procedure SetFrameColor_Hover(Value: TColor);

    procedure SetGradientColorTop_Down(Value: TColor);
    procedure SetGradientColorBottom_Down(Value: TColor);
    procedure SetFrameColor_Down(Value: TColor);

    procedure SetFontColorDisabled(Value: TColor);
    procedure SetFontShadowColorDisabled(Value: TColor);
    procedure SetGradientColorTop_Disabled(Value: TColor);
    procedure SetGradientColorBottom_Disabled(Value: TColor);
    procedure SetFrameColor_Disabled(Value: TColor);

    procedure SetShowFontShadow_Disabled(Value: Boolean);

    procedure SetUseCustomDraw(Value: Boolean);
    procedure SetCaptionVertIndent(Value: Integer); // added by Ciro Alfredo Consentino (XXX) readded by Moreno Cattaneo for missing source

    procedure WMERASEBKGND(var Message: TWMEraseBkgnd); message WM_ERASEBKGND;

  protected
    FState  : TButtonStateEx;
    procedure ActionChange(Sender: TObject; CheckDefaults: Boolean); override;
    function  GetActionLinkClass: TControlActionLinkClass; override;
    procedure Loaded; override;
    procedure MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Integer); override;
    procedure MouseMove(Shift: TShiftState; X, Y: Integer); override;
    procedure MouseUp(Button: TMouseButton; Shift: TShiftState; X, Y: Integer); override;
    procedure Paint; override;
    property  MouseInControl: Boolean read FMouseInControl;
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    procedure   Click; override;
  published
    property Action;
    property AllowAllUp: Boolean read FAllowAllUp write SetAllowAllUp default False;
    property Anchors;
    property BiDiMode;
    property Constraints;
    property GroupIndex: Integer read FGroupIndex write SetGroupIndex default 0;
    property Down: Boolean read FDown write SetDown default False;
    property Caption;
    property Enabled;
    property Flat: Boolean read FFlat write SetFlat default False;
    property Font;

    property ImageIndex: TImageIndex read FImageIndex write SetImageIndex default -1;  // added June 04, 2019
    property Images: TCustomImageList read FImages write SetImages;                    // added June 04, 2019

    property Layout: TButtonLayoutEx read FLayout write SetLayout default blGlyphLeft;
    property Margin: Integer read FMargin write SetMargin default -1;
    property ParentFont;
    property ParentShowHint;
    property ParentBiDiMode;
    property PopupMenu;
    property ShowHint;
    property Spacing: Integer read FSpacing write SetSpacing default 4; // image spacing
    property Transparent: Boolean read FTransparent write SetTransparent default True;
    property Visible;
    property OnClick;
    property OnDblClick;
    property OnMouseDown;
    property OnMouseMove;
    property OnMouseUp;

    // custom colors
    property GradientColorTop: TColor read FGradientColorTop write SetGradientColorTop default $004e4e4e; // (78,78,78)
    property GradientColorBottom: TColor read FGradientColorBottom write SetGradientColorBottom default $00323232; // (50,50,50)
    property FrameColor: TColor read FFrameColor write SetFrameColor default $00222222; // (34,34,34)
    property FrameColor_Focused: TColor read FFrameColor_Focused write SetFrameColor_Focused default $00c0804c; // (76,128,192)

    property GradientColorTop_Hover: TColor read FGradientColorTop_Hover write SetGradientColorTop_Hover default $00b97137; // (55,113,185)
    property GradientColorBottom_Hover: TColor read FGradientColorBottom_Hover write SetGradientColorBottom_Hover default $009b5c2a; // (42,92,155)
    property FrameColor_Hover: TColor read FFrameColor_Hover write SetFrameColor_Hover default $00222222; // (34,34,34)

    property GradientColorTop_Down: TColor read FGradientColorTop_Down write SetGradientColorTop_Down default $00a66632; // (50,102,166)
    property GradientColorBottom_Down: TColor read FGradientColorBottom_Down write SetGradientColorBottom_Down default $008c5326; // (38,83,140)
    property FrameColor_Down: TColor read FFrameColor_Down write SetFrameColor_Down default clBlack;

    property FontColorDisabled: TColor read FFontColorDisabled write SetFontColorDisabled default clBtnShadow;
    property FontShadowColorDisabled: TColor read FFontShadowColorDisabled write SetFontShadowColorDisabled default clBtnHighlight;
    property GradientColorTop_Disabled: TColor read FGradientColorTop_Disabled write SetGradientColorTop_Disabled default clSilver;
    property GradientColorBottom_Disabled: TColor read FGradientColorBottom_Disabled write SetGradientColorBottom_Disabled default clMedGray;
    property FrameColor_Disabled: TColor read FFrameColor_Disabled write SetFrameColor_Disabled default clGray;

    property FontShadowShow_Disabled: Boolean read FShowFontShadow_Disabled write SetShowFontShadow_Disabled default True;

    property UseCustomDraw: Boolean read FUseCustomDraw write SetUseCustomDraw default False;
    property CaptionVertIndent: Integer read FCaptionVertIndent write SetCaptionVertIndent default 0; // added by Ciro Alfredo Consentino (XXX) readded by Moreno Cattaneo for missing source
  end;
    
  TBitBtnKindEx = (bkCustom, bkOK, bkCancel, bkHelp, bkYes, bkNo, bkClose, bkAbort, bkRetry, bkIgnore, bkAll);

  TBitBtnEx = class(TButton)
  private
    FCanvas: TCanvas;
    FStyle: TButtonStyleEx;
    FKind: TBitBtnKindEx;
    FLayout: TButtonLayoutEx;
    FSpacing: Integer;
    FMargin: Integer;
    IsFocused: Boolean;
    FMouseInControl: Boolean;

    FImageChangeLink: TChangeLink; // added June 04, 2019
    FImageIndex: TImageIndex;      // added June 04, 2019
    FImages: TCustomImageList;     // added June 04, 2019
    
    // custom colors
    FGradientColorTop,
    FGradientColorBottom,
    FFrameColor,
    FFrameColor_Focused,

    FGradientColorTop_Hover,
    FGradientColorBottom_Hover,
    FFrameColor_Hover,

    FGradientColorTop_Down,
    FGradientColorBottom_Down,
    FFrameColor_Down,

    FFontColorDisabled,
    FFontShadowColorDisabled,
    FGradientColorTop_Disabled,
    FGradientColorBottom_Disabled,
    FFrameColor_Disabled: TColor;

    FShowFontShadow_Disabled: Boolean;
    
    FUseCustomDraw: Boolean;
    FCaptionVertIndent: Integer; // added by Ciro Alfredo Consentino (XXX) readded by Moreno Cattaneo for missing source

    procedure ImageListChange(Sender: TObject);      // added June 04, 2019
    procedure SetImageIndex(Value: TImageIndex);     // added June 04, 2019
    procedure SetImages(Value: TCustomImageList);    // added June 04, 2019

    procedure DrawItem(const DrawItemStruct: TDrawItemStruct);
    function  IsCustom: Boolean;
    function  IsCustomCaption: Boolean;
    procedure SetStyle(Value: TButtonStyleEx);
    procedure SetKind(Value: TBitBtnKindEx);
    function  GetKind: TBitBtnKindEx;
    procedure SetLayout(Value: TButtonLayoutEx);
    procedure SetSpacing(Value: Integer);
    procedure SetMargin(Value: Integer);
    procedure CNMeasureItem(var Message: TWMMeasureItem); message CN_MEASUREITEM;
    procedure CNDrawItem(var Message: TWMDrawItem); message CN_DRAWITEM;
    procedure CMFontChanged(var Message: TMessage); message CM_FONTCHANGED;
    procedure CMEnabledChanged(var Message: TMessage); message CM_ENABLEDCHANGED;
    procedure CMMouseEnter(var Message: TMessage); message CM_MOUSEENTER;
    procedure CMMouseLeave(var Message: TMessage); message CM_MOUSELEAVE;
    procedure WMLButtonDblClk(var Message: TWMLButtonDblClk); message WM_LBUTTONDBLCLK;

    // custom colors
    procedure SetGradientColorTop(Value: TColor);
    procedure SetGradientColorBottom(Value: TColor);
    procedure SetFrameColor(Value: TColor);
    procedure SetFrameColor_Focused(Value: TColor);

    procedure SetGradientColorTop_Hover(Value: TColor);
    procedure SetGradientColorBottom_Hover(Value: TColor);
    procedure SetFrameColor_Hover(Value: TColor);

    procedure SetGradientColorTop_Down(Value: TColor);
    procedure SetGradientColorBottom_Down(Value: TColor);
    procedure SetFrameColor_Down(Value: TColor);

    procedure SetFontColorDisabled(Value: TColor);
    procedure SetFontShadowColorDisabled(Value: TColor);
    procedure SetGradientColorTop_Disabled(Value: TColor);
    procedure SetGradientColorBottom_Disabled(Value: TColor);
    procedure SetFrameColor_Disabled(Value: TColor);

    procedure SetShowFontShadow_Disabled(Value: Boolean);
    
    procedure SetUseCustomDraw(Value: Boolean);
    procedure SetCaptionVertIndent(Value: Integer); // added by Ciro Alfredo Consentino (XXX) readded by Moreno Cattaneo for missing source
    procedure WMERASEBKGND(var Message: TWMEraseBkgnd); message WM_ERASEBKGND;
  protected
    procedure ActionChange(Sender: TObject; CheckDefaults: Boolean); override;
    procedure CreateHandle; override;
    procedure CreateParams(var Params: TCreateParams); override;
    procedure SetButtonStyle(ADefault: Boolean); override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    procedure   Click; override;
  published
    property Action;
    property Anchors;
    property BiDiMode;
    property Cancel stored IsCustom;
    property Caption stored IsCustomCaption;
    property Constraints;
    property Default stored IsCustom;
    property Enabled;

    property ImageIndex: TImageIndex read FImageIndex write SetImageIndex default -1;  // added June 04, 2019
    property Images: TCustomImageList read FImages write SetImages;                    // added June 04, 2019
    
    property Kind: TBitBtnKindEx read GetKind write SetKind default bkCustom;
    property Layout: TButtonLayoutEx read FLayout write SetLayout default blGlyphLeft;
    property Margin: Integer read FMargin write SetMargin default -1;
    property ModalResult stored IsCustom;
    property ParentShowHint;
    property ParentBiDiMode;
    property ShowHint;
    property Style: TButtonStyleEx read FStyle write SetStyle default bsAutoDetect;
    property Spacing: Integer read FSpacing write SetSpacing default 4;
    property TabOrder;
    property TabStop;
    property Visible;
    property OnEnter;
    property OnExit;

    // custom colors
    property GradientColorTop: TColor read FGradientColorTop write SetGradientColorTop default $004e4e4e; // (78,78,78)
    property GradientColorBottom: TColor read FGradientColorBottom write SetGradientColorBottom default $00323232; // (50,50,50)
    property FrameColor: TColor read FFrameColor write SetFrameColor default $00222222; // (34,34,34)
    property FrameColor_Focused: TColor read FFrameColor_Focused write SetFrameColor_Focused default $00c0804c; // (76,128,192)

    property GradientColorTop_Hover: TColor read FGradientColorTop_Hover write SetGradientColorTop_Hover default $00b97137; // (55,113,185)
    property GradientColorBottom_Hover: TColor read FGradientColorBottom_Hover write SetGradientColorBottom_Hover default $009b5c2a; // (42,92,155)
    property FrameColor_Hover: TColor read FFrameColor_Hover write SetFrameColor_Hover default $00222222; // (34,34,34)

    property GradientColorTop_Down: TColor read FGradientColorTop_Down write SetGradientColorTop_Down default $00a66632; // (50,102,166)
    property GradientColorBottom_Down: TColor read FGradientColorBottom_Down write SetGradientColorBottom_Down default $008c5326; // (38,83,140)
    property FrameColor_Down: TColor read FFrameColor_Down write SetFrameColor_Down default clBlack;

    property FontColorDisabled: TColor read FFontColorDisabled write SetFontColorDisabled default clBtnShadow;
    property FontShadowColorDisabled: TColor read FFontShadowColorDisabled write SetFontShadowColorDisabled default clBtnHighlight;
    property GradientColorTop_Disabled: TColor read FGradientColorTop_Disabled write SetGradientColorTop_Disabled default clSilver;
    property GradientColorBottom_Disabled: TColor read FGradientColorBottom_Disabled write SetGradientColorBottom_Disabled default clMedGray;
    property FrameColor_Disabled: TColor read FFrameColor_Disabled write SetFrameColor_Disabled default clGray;

    property FontShadowShow_Disabled: Boolean read FShowFontShadow_Disabled write SetShowFontShadow_Disabled default True;
    
    property UseCustomDraw: Boolean read FUseCustomDraw write SetUseCustomDraw default False;
    property CaptionVertIndent: Integer read FCaptionVertIndent write SetCaptionVertIndent default 0; // added by Ciro Alfredo Consentino (XXX) readded by Moreno Cattaneo for missing source
  end;
    
function  DrawButtonFace(Canvas: TCanvas; const Client: TRect;
                         BevelWidth: Integer; Style: TButtonStyleEx; IsRounded, IsDown, IsFocused: Boolean): TRect;

function  DrawButtonCustomColors(ButtonSender: TObject; ACanvas: TCanvas; ARect: TRect; var ButtonBMP: TBitmap; IsSpeedButton: Boolean;
                                 IsEnabled, IsDown, IsMouseInControl, IsFocused, IsDefault: Boolean): TRect;

procedure CalcButtonLayout(Canvas: TCanvas; const Client: TRect; const Offset: TPoint; const Caption: String; Layout: TButtonLayoutEx;
                           Margin, Spacing: Integer; var GlyphPos: TPoint; var TextBounds: TRect; BiDiFlags: LongInt;
                           ComponentSource: TObject; IsSpeedButton: Boolean);

function  DrawButton(Canvas: TCanvas; const Client: TRect; const Offset: TPoint; const Caption: String; Layout: TButtonLayoutEx;
                     Margin, Spacing: Integer; State: TButtonStateEx; Transparent: Boolean; BiDiFlags: LongInt;
                     ComponentSource: TObject; IsSpeedButton: Boolean): TRect;

procedure DrawButtonGlyph(Canvas: TCanvas; const GlyphPos: TPoint; State: TButtonStateEx; Transparent: Boolean;
                          ComponentSource: TObject; IsSpeedButton: Boolean);
procedure DrawButtonText(Canvas: TCanvas; const Caption: String; TextBounds: TRect; State: TButtonStateEx; BiDiFlags: LongInt; ComponentSource: TObject; IsSpeedButton: Boolean);


procedure Register;

implementation

uses Consts, SysUtils, ActnList;

procedure Register;
begin
  RegisterComponents('Components', [TBitBtnEx, TSpeedButtonEx]);
end;

//{$R Buttons.res} // gives error, do not enable
    
// TBitBtnEx data
var
  BitBtnModalResultsEx: array[TBitBtnKindEx] of TModalResult = (
    0, mrOk, mrCancel, 0, mrYes, mrNo, 0, mrAbort, mrRetry, mrIgnore, mrAll);

function GetCaptionButton(AType: TBitBtnKindEx): Pointer;
begin
  Result := nil;
  case AType of
    bkOK     : Result := @SOKButton;
    bkCancel : Result := @SCancelButton;
    bkHelp   : Result := @SHelpButton;
    bkYes    : Result := @SYesButton;
    bkNo     : Result := @SNoButton;
    bkClose  : Result := @SCloseButton;
    bkAbort  : Result := @SAbortButton;
    bkRetry  : Result := @SRetryButton;
    bkIgnore : Result := @SIgnoreButton;
    bkAll    : Result := @SAllButton;
  end;
end;

// DrawButtonFace - returns the remaining usable area inside the Client rect.
function DrawButtonFace(Canvas: TCanvas; const Client: TRect;
                        BevelWidth: Integer; Style: TButtonStyleEx; IsRounded, IsDown, IsFocused: Boolean): TRect;
var
  NewStyle: Boolean;
  R: TRect;
  DC: THandle;
begin
  NewStyle := ((Style = bsAutoDetect) and NewStyleControls) or (Style = bsNew);
    
  R := Client;
  with Canvas do
  begin
    if NewStyle then
    begin
      Brush.Color := clBtnFace;
      Brush.Style := bsSolid;
      DC := Canvas.Handle;    // Reduce calls to GetHandle

      if IsDown then
      begin    // DrawEdge is faster than Polyline
        DrawEdge(DC, R, BDR_SUNKENINNER, BF_TOPLEFT);              // black
        DrawEdge(DC, R, BDR_SUNKENOUTER, BF_BOTTOMRIGHT);          // btnhilite
        Dec(R.Bottom);
        Dec(R.Right);
        Inc(R.Top);
        Inc(R.Left);
        DrawEdge(DC, R, BDR_SUNKENOUTER, BF_TOPLEFT or BF_MIDDLE); // btnshadow
      end
      else
      begin
        DrawEdge(DC, R, BDR_RAISEDOUTER, BF_BOTTOMRIGHT);          // black
        Dec(R.Bottom);
        Dec(R.Right);
        DrawEdge(DC, R, BDR_RAISEDINNER, BF_TOPLEFT);              // btnhilite
        Inc(R.Top);
        Inc(R.Left);
        DrawEdge(DC, R, BDR_RAISEDINNER, BF_BOTTOMRIGHT or BF_MIDDLE); // btnshadow
      end;
    end
    else
    begin
      Pen.Color := clWindowFrame;
      Brush.Color := clBtnFace;
      Brush.Style := bsSolid;
      Rectangle(R.Left, R.Top, R.Right, R.Bottom);
    
      // round the corners - only applies to Win 3.1 style buttons
      if IsRounded then
      begin
        Pixels[R.Left, R.Top] := clBtnFace;
        Pixels[R.Left, R.Bottom - 1] := clBtnFace;
        Pixels[R.Right - 1, R.Top] := clBtnFace;
        Pixels[R.Right - 1, R.Bottom - 1] := clBtnFace;
      end;
    
      if IsFocused then
      begin
        InflateRect(R, -1, -1);
        Brush.Style := bsClear;
        Rectangle(R.Left, R.Top, R.Right, R.Bottom);
      end;
    
      InflateRect(R, -1, -1);
      if not IsDown then
         Frame3D(Canvas, R, clBtnHighlight, clBtnShadow, BevelWidth)
      else
      begin
         Pen.Color := clBtnShadow;
         PolyLine([Point(R.Left, R.Bottom - 1), Point(R.Left, R.Top), Point(R.Right, R.Top)]);
      end;
    end;
  end;
    
  Result := Rect(Client.Left + 1, Client.Top + 1, Client.Right - 2, Client.Bottom - 2);
  if IsDown then
     OffsetRect(Result, 1, 1);
end;

function Blend(Color1, Color2: TColor; A: Byte): TColor;
var
  c1, c2: LongInt;
  R, G, B, v1, v2: Byte;
begin
  A := Round(2.55 * A);
  c1 := ColorToRGB(Color1);
  c2 := ColorToRGB(Color2);
  v1 := Byte(c1);
  v2 := Byte(c2);
  R := Byte(A * (v1 - v2) shr 8 + v2);
  v1 := Byte(c1 shr 8);
  v2 := Byte(c2 shr 8);
  G := Byte(A * (v1 - v2) shr 8 + v2);
  v1 := Byte(c1 shr 16);
  v2 := Byte(c2 shr 16);
  B := Byte(A * (v1 - v2) shr 8 + v2);
  Result := (B shl 16) + (G shl 8) + R;
end;

procedure DrawGradient(ACanvas: TCanvas; ColorTop: TColor; ColorBottom: TColor; Steps: Integer = 64);
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

  imgWidth  := (ACanvas.ClipRect.Right-ACanvas.ClipRect.Left)-2;
  imgHeight := (ACanvas.ClipRect.Bottom-ACanvas.ClipRect.Top)-2;

  if imgWidth < 1 then
     Exit;
  if imgHeight < 1 then
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
  ACanvas.Draw(1, 1, bmp);
  bmp.Free;
end;

function DarkenColor(Color: TColor; Perc: Integer): TColor;
var
  r, g, b: Integer;
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

function BrightenColor(Color: TColor; Factor: Integer): TColor;
const
  MaxFactor = 100;
begin
  Color := ColorToRGB(Color);
  if 0 < Factor then             // 0 = no changes
  begin
    if Factor > MaxFactor then
       Factor := MaxFactor;
    Result := (          (((255 - ((Color shr 16) and $FF)) * Factor) div MaxFactor)) shl 8;
    Result := (Result or (((255 - ((Color shr  8) and $FF)) * Factor) div MaxFactor)) shl 8;
    Result := (Result or (((255 - ( Color         and $FF)) * Factor) div MaxFactor));
    Result := Color + Result;
  end
  else
    Result := Color;
end;

function DrawButtonCustomColors(ButtonSender: TObject; ACanvas: TCanvas; ARect: TRect; var ButtonBMP: TBitmap; IsSpeedButton: Boolean;
                                IsEnabled, IsDown, IsMouseInControl, IsFocused, IsDefault: Boolean): TRect;
var
  R_Frame: TRect;
  iColor, iBkColor, iBkColor2, iColorPixel: TColor;
begin
  BitBlt(ButtonBMP.Canvas.Handle, 0, 0, ButtonBMP.Width, ButtonBMP.Height, ACanvas.Handle, 1, 1, SRCCOPY); // copy background image

    if not IsEnabled then
       begin
         // disabled state
         if IsSpeedButton then
            begin
              iBkColor  := TSpeedButtonEx(ButtonSender).FGradientColorTop_Disabled;
              iBkColor2 := TSpeedButtonEx(ButtonSender).FGradientColorBottom_Disabled;
              iColor    := TSpeedButtonEx(ButtonSender).FFrameColor_Disabled;
            end
         else
            begin
              iBkColor  := TBitBtnEx(ButtonSender).FGradientColorTop_Disabled;
              iBkColor2 := TBitBtnEx(ButtonSender).FGradientColorBottom_Disabled;
              iColor    := TBitBtnEx(ButtonSender).FFrameColor_Disabled;
            end;
       end
    else
    if IsDown then
       begin
         // pressed state
         if IsSpeedButton then
            begin
              iBkColor  := TSpeedButtonEx(ButtonSender).FGradientColorTop_Down;
              iBkColor2 := TSpeedButtonEx(ButtonSender).FGradientColorBottom_Down;
              iColor    := TSpeedButtonEx(ButtonSender).FFrameColor_Down;
            end
         else
            begin
              iBkColor  := TBitBtnEx(ButtonSender).FGradientColorTop_Down;
              iBkColor2 := TBitBtnEx(ButtonSender).FGradientColorBottom_Down;
              iColor    := TBitBtnEx(ButtonSender).FFrameColor_Down;
            end;
       end
    else
    if IsMouseInControl then
       begin
         // mouse on top
         if IsSpeedButton then
            begin
              iBkColor  := TSpeedButtonEx(ButtonSender).FGradientColorTop_Hover;
              iBkColor2 := TSpeedButtonEx(ButtonSender).FGradientColorBottom_Hover;
              iColor    := TSpeedButtonEx(ButtonSender).FFrameColor_Hover;
            end
         else
            begin
              iBkColor  := TBitBtnEx(ButtonSender).FGradientColorTop_Hover;
              iBkColor2 := TBitBtnEx(ButtonSender).FGradientColorBottom_Hover;
              iColor    := TBitBtnEx(ButtonSender).FFrameColor_Hover;
            end;
       end
    else
    if IsFocused or IsDefault then
       begin
         // focused or default state
         if IsSpeedButton then
            begin
              iBkColor  := TSpeedButtonEx(ButtonSender).FGradientColorTop;
              iBkColor2 := TSpeedButtonEx(ButtonSender).FGradientColorBottom;
              iColor    := TSpeedButtonEx(ButtonSender).FFrameColor;
            end
         else
            begin
              iBkColor  := TBitBtnEx(ButtonSender).FGradientColorTop;
              iBkColor2 := TBitBtnEx(ButtonSender).FGradientColorBottom;
              iColor    := TBitBtnEx(ButtonSender).FFrameColor;
            end;
       end
    else
       begin
         // normal state
         if IsSpeedButton then
            begin
              iBkColor  := TSpeedButtonEx(ButtonSender).FGradientColorTop;
              iBkColor2 := TSpeedButtonEx(ButtonSender).FGradientColorBottom;
              iColor    := TSpeedButtonEx(ButtonSender).FFrameColor;
            end
         else
            begin
              iBkColor  := TBitBtnEx(ButtonSender).FGradientColorTop;
              iBkColor2 := TBitBtnEx(ButtonSender).FGradientColorBottom;
              iColor    := TBitBtnEx(ButtonSender).FFrameColor;
            end;
       end;

    DrawGradient(ButtonBMP.Canvas, iBkColor, iBkColor2);

    ARect := ButtonBMP.Canvas.ClipRect; // set button canvas TRect to ButtonBMP size

    // draw rounded frame
    ButtonBMP.Canvas.Pen.Color:= iColor;
    ButtonBMP.Canvas.RoundRect(ARect.Left, ARect.Top, ARect.Right, ARect.Bottom, 5, 5);

    if not IsSpeedButton then
    if (IsFocused or IsDefault) and ((not IsDown) and (not IsMouseInControl) and (IsEnabled)) then
       begin
         // draw focused frame
         R_Frame := ARect;
         InflateRect(R_Frame, -1, -1);
         ButtonBMP.Canvas.Pen.Color:= TBitBtnEx(ButtonSender).FFrameColor_Focused;
         ButtonBMP.Canvas.RoundRect(R_Frame.Left, R_Frame.Top, R_Frame.Right, R_Frame.Bottom, 5, 5);// FrameRect(R_Frame);
         InflateRect(R_Frame, -1, -1);
         ButtonBMP.Canvas.Brush.Color:= TBitBtnEx(ButtonSender).FFrameColor_Focused;
         ButtonBMP.Canvas.FrameRect(R_Frame);
         InflateRect(R_Frame, 1, 1);

         // top left
         ButtonBMP.Canvas.Pixels[ARect.Left+R_Frame.Left+1, ARect.Top+R_Frame.Top+0] :=
                     Blend(ButtonBMP.Canvas.Pixels[ARect.Left+R_Frame.Left+1, ARect.Top+R_Frame.Top+0],
                           TBitBtnEx(ButtonSender).FFrameColor_Focused, 25);

         // top right
         ButtonBMP.Canvas.Pixels[R_Frame.Right-(ARect.Right-R_Frame.Right)-1, ARect.Top+R_Frame.Top+0] :=
                     Blend(ButtonBMP.Canvas.Pixels[R_Frame.Right-(ARect.Right-R_Frame.Right)-1, ARect.Top+R_Frame.Top+0],
                           TBitBtnEx(ButtonSender).FFrameColor_Focused, 25);

         // top+1 left
         ButtonBMP.Canvas.Pixels[ARect.Left+R_Frame.Left, ARect.Top+R_Frame.Top+1] :=
                     Blend(ButtonBMP.Canvas.Pixels[ARect.Left+R_Frame.Left, ARect.Top+R_Frame.Top+1],
                           TBitBtnEx(ButtonSender).FFrameColor_Focused, 25);

         // top+1 right
         ButtonBMP.Canvas.Pixels[R_Frame.Right-(ARect.Right-R_Frame.Right), ARect.Top+R_Frame.Top+1] :=
                     Blend(ButtonBMP.Canvas.Pixels[R_Frame.Right-(ARect.Right-R_Frame.Right), ARect.Top+R_Frame.Top+1],
                           TBitBtnEx(ButtonSender).FFrameColor_Focused, 25);

         // bottom left
         ButtonBMP.Canvas.Pixels[ARect.Left+R_Frame.Left, R_Frame.Bottom-(ARect.Bottom-R_Frame.Bottom)-1] :=
                     Blend(ButtonBMP.Canvas.Pixels[ARect.Left+R_Frame.Left, R_Frame.Bottom-(ARect.Bottom-R_Frame.Bottom)-1],
                           TBitBtnEx(ButtonSender).FFrameColor_Focused, 25);

         // bottom right
         ButtonBMP.Canvas.Pixels[R_Frame.Right-(ARect.Right-R_Frame.Right), R_Frame.Bottom-(ARect.Bottom-R_Frame.Bottom)-1] :=
                     Blend(ButtonBMP.Canvas.Pixels[R_Frame.Right-(ARect.Right-R_Frame.Right), R_Frame.Bottom-(ARect.Bottom-R_Frame.Bottom)-1],
                           TBitBtnEx(ButtonSender).FFrameColor_Focused, 25);

         // bottom+1 left
         ButtonBMP.Canvas.Pixels[ARect.Left+R_Frame.Left+1, R_Frame.Bottom-(ARect.Bottom-R_Frame.Bottom)] :=
                     Blend(ButtonBMP.Canvas.Pixels[ARect.Left+R_Frame.Left+1, R_Frame.Bottom-(ARect.Bottom-R_Frame.Bottom)],
                           TBitBtnEx(ButtonSender).FFrameColor_Focused, 25);

         // bottom+1 right
         ButtonBMP.Canvas.Pixels[R_Frame.Right-(ARect.Right-R_Frame.Right)-1, R_Frame.Bottom-(ARect.Bottom-R_Frame.Bottom)] :=
                     Blend(ButtonBMP.Canvas.Pixels[R_Frame.Right-(ARect.Right-R_Frame.Right)-1, R_Frame.Bottom-(ARect.Bottom-R_Frame.Bottom)],
                           TBitBtnEx(ButtonSender).FFrameColor_Focused, 25);
       end;

    // draw corner pixels of rounded frame
    iColorPixel:= BrightenColor(iColor, 2);
    ButtonBMP.Canvas.Pixels[ARect.Left+2, 0]:= iColorPixel;
    ButtonBMP.Canvas.Pixels[ARect.Left+1, 1]:= iColorPixel;
    ButtonBMP.Canvas.Pixels[ARect.Left,   2]:= iColorPixel;

    ButtonBMP.Canvas.Pixels[ARect.Right-3, 0]:= iColorPixel;
    ButtonBMP.Canvas.Pixels[ARect.Right-2, 1]:= iColorPixel;
    ButtonBMP.Canvas.Pixels[ARect.Right-1, 2]:= iColor;

    ButtonBMP.Canvas.Pixels[0, ARect.Bottom-3]:= iColorPixel;
    ButtonBMP.Canvas.Pixels[1, ARect.Bottom-2]:= iColorPixel;
    ButtonBMP.Canvas.Pixels[2, ARect.Bottom-1]:= iColorPixel;

    ButtonBMP.Canvas.Pixels[ARect.Right-3, ARect.Bottom-1]:= iColorPixel;
    ButtonBMP.Canvas.Pixels[ARect.Right-2, ARect.Bottom-2]:= iColorPixel;
    ButtonBMP.Canvas.Pixels[ARect.Right-1, ARect.Bottom-3]:= iColorPixel;

    // draw blended pixels of rounded frame

    // top left
    ButtonBMP.Canvas.Pixels[ARect.Left+1, 0] := Blend(ButtonBMP.Canvas.Pixels[ARect.Left+1, 0], iColor, 25);

    // top right
    ButtonBMP.Canvas.Pixels[ARect.Right-2, 0] := Blend(ButtonBMP.Canvas.Pixels[ARect.Right-2, 0], iColor, 25);

    // top+1 left
    ButtonBMP.Canvas.Pixels[ARect.Left, 1] := Blend(ButtonBMP.Canvas.Pixels[ARect.Left, 1], iColor, 25);

    // top+1 right
    ButtonBMP.Canvas.Pixels[ARect.Right-1, 1] := Blend(ButtonBMP.Canvas.Pixels[ARect.Right-1, 1], iColor, 25);

    // bottom left
    ButtonBMP.Canvas.Pixels[0, ARect.Bottom-2] := Blend(ButtonBMP.Canvas.Pixels[0, ARect.Bottom-2], iColor, 25);

    // bottom right
    ButtonBMP.Canvas.Pixels[ARect.Right-1, ARect.Bottom-2] := Blend(ButtonBMP.Canvas.Pixels[ARect.Right-1, ARect.Bottom-2], iColor, 25);

    // bottom+1 left
    ButtonBMP.Canvas.Pixels[1, ARect.Bottom-1] := Blend(ButtonBMP.Canvas.Pixels[1, ARect.Bottom-1], iColor, 25);

    // bottom+1 right
    ButtonBMP.Canvas.Pixels[ARect.Right-2, ARect.Bottom-1] := Blend(ButtonBMP.Canvas.Pixels[ARect.Right-2, ARect.Bottom-1], iColor, 25);
end;

procedure DrawButtonGlyph(Canvas: TCanvas; const GlyphPos: TPoint; State: TButtonStateEx; Transparent: Boolean;
                          ComponentSource: TObject; IsSpeedButton: Boolean);
var
  Index: Integer;
  Details: TThemedElementDetails;
  R: TRect;
  Button: TThemedButton;
  //ToolButton: TThemedToolBar;
  HaveGlyph: Boolean;
  iWidth, iHeight: Integer;
  IconStyle: Cardinal;
begin
  Index:= -1;
  if IsSpeedButton then
     begin
       HaveGlyph := Assigned(TSpeedButtonEx(ComponentSource).Images) and (TSpeedButtonEx(ComponentSource).ImageIndex <> -1);
       if HaveGlyph then
       begin
         iWidth  := TSpeedButtonEx(ComponentSource).Images.Width;
         iHeight := TSpeedButtonEx(ComponentSource).Images.Height;
         Index   := TSpeedButtonEx(ComponentSource).ImageIndex;
       end;
     end
  else
     begin
       HaveGlyph := Assigned(TBitBtnEx(ComponentSource).Images) and (TBitBtnEx(ComponentSource).ImageIndex <> -1);
       if HaveGlyph then
       begin
         iWidth  := TBitBtnEx(ComponentSource).Images.Width;
         iHeight := TBitBtnEx(ComponentSource).Images.Height;
         Index   := TBitBtnEx(ComponentSource).ImageIndex;
       end;
     end;

  if not HaveGlyph then
     Exit;

  with GlyphPos do
  begin
    if State = bsDisabled then
       IconStyle:= ILD_Transparent or ILD_BLEND50
    else
       IconStyle:= ILD_Transparent;

    if ThemeServices.ThemesEnabled then
    begin
      R.TopLeft := GlyphPos;
      R.Right := R.Left + iWidth;
      R.Bottom := R.Top + iHeight;
      case State of
        bsDisabled:
          Button := tbPushButtonDisabled;
        bsDown,
        bsExclusive:
          Button := tbPushButtonPressed;
      else
        // bsUp
        Button := tbPushButtonNormal;
      end;
      Details := ThemeServices.GetElementDetails(Button);
      
      //if IsSpeedButton then
      //   ThemeServices.DrawIcon(Canvas.Handle, Details, R, TSpeedButtonEx(ComponentSource).Images.Handle, Index)
      //else
      //   ThemeServices.DrawIcon(Canvas.Handle, Details, R, TBitBtnEx(ComponentSource).Images.Handle, Index);
    end
    else
    begin
      {if Transparent or (State = bsExclusive) then
         begin
           if IsSpeedButton then
              ImageList_DrawEx(TSpeedButtonEx(ComponentSource).Images.Handle, Index, Canvas.Handle, X, Y, 0, 0, clNone, clNone, ILD_Transparent)
           else
              ImageList_DrawEx(TBitBtnEx(ComponentSource).Images.Handle, Index, Canvas.Handle, X, Y, 0, 0, clNone, clNone, ILD_Transparent);
         end
      else
         begin
           if IsSpeedButton then
              ImageList_DrawEx(TSpeedButtonEx(ComponentSource).Images.Handle, Index, Canvas.Handle, X, Y, 0, 0, ColorToRGB(clBtnFace), clNone, ILD_Normal)
           else
              ImageList_DrawEx(TBitBtnEx(ComponentSource).Images.Handle, Index, Canvas.Handle, X, Y, 0, 0, ColorToRGB(clBtnFace), clNone, ILD_Normal);
         end;}
    end;
    if Transparent or (State = bsExclusive) then
       begin
         if IsSpeedButton then
            ImageList_DrawEx(TSpeedButtonEx(ComponentSource).Images.Handle, Index, Canvas.Handle, X, Y, 0, 0, clNone, clNone, IconStyle)
         else
            ImageList_DrawEx(TBitBtnEx(ComponentSource).Images.Handle, Index, Canvas.Handle, X, Y, 0, 0, clNone, clNone, IconStyle);
       end
    else
       begin
         if IsSpeedButton then
            ImageList_DrawEx(TSpeedButtonEx(ComponentSource).Images.Handle, Index, Canvas.Handle, X, Y, 0, 0, clNone{ColorToRGB(clBtnFace)}, clNone, IconStyle)
         else
            ImageList_DrawEx(TBitBtnEx(ComponentSource).Images.Handle, Index, Canvas.Handle, X, Y, 0, 0, clNone{ColorToRGB(clBtnFace)}, clNone, IconStyle);
       end;

  end;
end;

procedure DrawButtonText(Canvas: TCanvas; const Caption: String; TextBounds: TRect; State: TButtonStateEx; BiDiFlags: LongInt; ComponentSource: TObject; IsSpeedButton: Boolean);
var
  iFontColor, iFontShadowColor: TColor;
  iCustomDraw, IsFlat, iShadowEnabled, IsDesignTime: Boolean;
begin
  iCustomDraw:= False;
  IsFlat:= False;
  iShadowEnabled:= True;
  IsDesignTime:= True;

  if IsSpeedButton then
     begin
       iCustomDraw:= TSpeedButtonEx(ComponentSource).FUseCustomDraw;
       IsFlat:= TSpeedButtonEx(ComponentSource).Flat;
       iShadowEnabled:= TSpeedButtonEx(ComponentSource).FShowFontShadow_Disabled;
       IsDesignTime:= (csDesigning in TSpeedButtonEx(ComponentSource).ComponentState);
     end
  else
     begin
       iCustomDraw:= TBitBtnEx(ComponentSource).FUseCustomDraw;
       iShadowEnabled:= TBitBtnEx(ComponentSource).FShowFontShadow_Disabled;
       IsDesignTime:= (csDesigning in TBitBtnEx(ComponentSource).ComponentState);
     end;

  if (not iShadowEnabled) and ((not iCustomDraw) and (not IsFlat)) then
     iShadowEnabled:= True;

  with Canvas do
  begin
    Brush.Style := bsClear;
    if State = bsDisabled then
    begin
      if IsSpeedButton then
      begin
        iFontColor:= TSpeedButtonEx(ComponentSource).FFontColorDisabled;
        iFontShadowColor:= TSpeedButtonEx(ComponentSource).FFontShadowColorDisabled;
      end
      else
      begin
        iFontColor:= TBitBtnEx(ComponentSource).FFontColorDisabled;
        iFontShadowColor:= TBitBtnEx(ComponentSource).FFontShadowColorDisabled;
      end;
      //  iFontColor:= clBtnShadow;
      //  iFontShadowColor:= clBtnHighlight;

      if iShadowEnabled then
         begin
           OffsetRect(TextBounds, 1, 1);
           Font.Color := iFontShadowColor;//clBtnHighlight;
           DrawText(Handle, PChar(Caption), Length(Caption), TextBounds, DT_CENTER or DT_VCENTER or BiDiFlags);
           OffsetRect(TextBounds, -1, -1);
         end;
      Font.Color := iFontColor;// clBtnShadow;
      DrawText(Handle, PChar(Caption), Length(Caption), TextBounds, DT_CENTER or DT_VCENTER or BiDiFlags);
    end
    else
      begin
        if IsDesignTime and (not IsFlat) then
        begin
         if Font.Color <> clBlack then
            Font.Color:= clBlack;
        end
        else
        if (not iCustomDraw) and (not IsFlat) and ThemeServices.ThemesEnabled then
           begin
             if Font.Color <> clBlack then
                Font.Color:= clBlack
           end;
        DrawText(Handle, PChar(Caption), Length(Caption), TextBounds, DT_CENTER or DT_VCENTER or BiDiFlags);
      end;
  end;
end;

procedure CalcButtonLayout(Canvas: TCanvas; const Client: TRect; const Offset: TPoint; const Caption: String; Layout: TButtonLayoutEx;
            Margin, Spacing: Integer; var GlyphPos: TPoint; var TextBounds: TRect; BiDiFlags: LongInt; ComponentSource: TObject; IsSpeedButton: Boolean);
var
  TextPos: TPoint;
  ClientSize, GlyphSize, TextSize: TPoint;
  TotalSize: TPoint;
  iWidth, iHeight: Integer;
begin
  if (BiDiFlags and DT_RIGHT) = DT_RIGHT then
  begin
    if Layout = blGlyphLeft then
       Layout := blGlyphRight
    else
    if Layout = blGlyphRight then
       Layout := blGlyphLeft;
  end;

  // calculate the item sizes
  ClientSize := Point(Client.Right - Client.Left, Client.Bottom - Client.Top);
  iWidth  := 0;
  iHeight := 0;

  if IsSpeedButton then
     begin
       if Assigned(TSpeedButtonEx(ComponentSource).Images) and (TSpeedButtonEx(ComponentSource).ImageIndex <> -1) then
          begin
            iWidth  := TSpeedButtonEx(ComponentSource).Images.Width;
            iHeight := TSpeedButtonEx(ComponentSource).Images.Height;
          end;
     end
  else
     begin
       if Assigned(TBitBtnEx(ComponentSource).Images) and (TBitBtnEx(ComponentSource).ImageIndex <> -1) then
          begin
            iWidth  := TBitBtnEx(ComponentSource).Images.Width;
            iHeight := TBitBtnEx(ComponentSource).Images.Height;
          end;
     end;
  GlyphSize := Point(iWidth, iHeight);

  if Length(Caption) > 0 then
  begin
    TextBounds := Rect(0, 0, Client.Right - Client.Left, 0);
    DrawText(Canvas.Handle, PChar(Caption), Length(Caption), TextBounds, DT_CALCRECT or BiDiFlags);
    TextSize := Point(TextBounds.Right - TextBounds.Left, TextBounds.Bottom - TextBounds.Top);
  end
  else
  begin
    TextBounds := Rect(0, 0, 0, 0);
    TextSize := Point(0,0);
  end;

  // if the layout has the glyph on the right or the left, then both the
  // text and the glyph are centered vertically.  If the glyph is on the top
  // or the bottom, then both the text and the glyph are centered horizontally.
  if Layout in [blGlyphLeft, blGlyphRight] then
  begin
    GlyphPos.Y := (ClientSize.Y - GlyphSize.Y + 1) div 2;
    TextPos.Y  := (ClientSize.Y - TextSize.Y + 1) div 2;
  end
  else
  begin
    GlyphPos.X := (ClientSize.X - GlyphSize.X + 1) div 2;
    TextPos.X  := (ClientSize.X - TextSize.X + 1) div 2;
  end;
    
  // if there is no text or no bitmap, then Spacing is irrelevant
  if (TextSize.X = 0) or (GlyphSize.X = 0) then
     Spacing := 0;

  // adjust Margin and Spacing
  if Margin = -1 then
  begin
    if Spacing = -1 then
    begin
      TotalSize := Point(GlyphSize.X + TextSize.X, GlyphSize.Y + TextSize.Y);
      if Layout in [blGlyphLeft, blGlyphRight] then
         Margin := (ClientSize.X - TotalSize.X) div 3
      else
         Margin := (ClientSize.Y - TotalSize.Y) div 3;
      Spacing := Margin;
    end
    else
    begin
      TotalSize := Point(GlyphSize.X + Spacing + TextSize.X, GlyphSize.Y + Spacing + TextSize.Y);
      if Layout in [blGlyphLeft, blGlyphRight] then
         Margin := (ClientSize.X - TotalSize.X + 1) div 2
      else
         Margin := (ClientSize.Y - TotalSize.Y + 1) div 2;
    end;
  end
  else
  begin
    if Spacing = -1 then
    begin
      TotalSize := Point(ClientSize.X - (Margin + GlyphSize.X), ClientSize.Y - (Margin + GlyphSize.Y));
      if Layout in [blGlyphLeft, blGlyphRight] then
         Spacing := (TotalSize.X - TextSize.X) div 2
      else
         Spacing := (TotalSize.Y - TextSize.Y) div 2;
    end;
  end;
    
  case Layout of
    blGlyphLeft:
      begin
        GlyphPos.X := Margin;
        TextPos.X  := GlyphPos.X + GlyphSize.X + Spacing;
      end;
    blGlyphRight:
      begin
        GlyphPos.X := ClientSize.X - Margin - GlyphSize.X;
        TextPos.X  := GlyphPos.X - Spacing - TextSize.X;
      end;
    blGlyphTop:
      begin
        GlyphPos.Y := Margin;
        TextPos.Y  := GlyphPos.Y + GlyphSize.Y + Spacing;
      end;
    blGlyphBottom:
      begin
        GlyphPos.Y := ClientSize.Y - Margin - GlyphSize.Y;
        TextPos.Y  := GlyphPos.Y - Spacing - TextSize.Y;
      end;
  end;
    
  // fixup the result variables
  with GlyphPos do
  begin
    Inc(X, Client.Left + Offset.X);
    Inc(Y, Client.Top + Offset.Y);
  end;

  // Themed text is not shifted, but gets a different color
  if ThemeServices.ThemesEnabled then
     OffsetRect(TextBounds, TextPos.X + Client.Left, TextPos.Y + Client.Top)
  else
     OffsetRect(TextBounds, TextPos.X + Client.Left + Offset.X, TextPos.Y + Client.Top + Offset.Y);
end;

function DrawButton(Canvas: TCanvas; const Client: TRect; const Offset: TPoint; const Caption: String; Layout: TButtonLayoutEx;
                    Margin, Spacing: Integer; State: TButtonStateEx; Transparent: Boolean; BiDiFlags: LongInt;
                    ComponentSource: TObject; IsSpeedButton: Boolean): TRect;
var
  GlyphPos: TPoint;
begin
  CalcButtonLayout(Canvas, Client, Offset, Caption, Layout, Margin, Spacing, GlyphPos, Result, BiDiFlags, ComponentSource, IsSpeedButton);
  DrawButtonGlyph(Canvas, GlyphPos, State, Transparent, ComponentSource, IsSpeedButton);
  DrawButtonText(Canvas, Caption, Result, State, BiDiFlags, ComponentSource, IsSpeedButton);
end;

var
  ButtonCount: Integer = 0; // for TSpeedButtonEx

{
function TButtonGlyphEx.CreateButtonGlyph(State: TButtonStateEx): Integer;
const
  ROP_DSPDxax = $00E20746;
var
  TmpImage, DDB, MonoBmp: TBitmap;
  IWidth, IHeight: Integer;
  IRect, ORect: TRect;
  I: TButtonStateEx;
  DestDC: HDC;
begin
  if (State = bsDown) and (NumGlyphs < 3) then
     State := bsUp;
  Result := FIndexs[State];
  if Result <> -1 then
     Exit;
  if (FOriginal.Width or FOriginal.Height) = 0 then
     Exit;
  IWidth := FOriginal.Width div FNumGlyphs;
  IHeight := FOriginal.Height;
  if FGlyphList = nil then
  begin
    if GlyphCache = nil then
       GlyphCache := TGlyphCacheEx.Create;
    FGlyphList := GlyphCache.GetList(IWidth, IHeight);
  end;
  TmpImage := TBitmap.Create;
  try
    TmpImage.Width := IWidth;
    TmpImage.Height := IHeight;
    IRect := Rect(0, 0, IWidth, IHeight);
    TmpImage.Canvas.Brush.Color := clBtnFace;
    TmpImage.Palette := CopyPalette(FOriginal.Palette);
    I := State;
    if Ord(I) >= NumGlyphs then
       I := bsUp;
    ORect := Rect(Ord(I) * IWidth, 0, (Ord(I) + 1) * IWidth, IHeight);
    case State of
      bsUp, bsDown,
      bsExclusive:
        begin
          TmpImage.Canvas.CopyRect(IRect, FOriginal.Canvas, ORect);
          if FOriginal.TransparentMode = tmFixed then
             FIndexs[State] := FGlyphList.AddMasked(TmpImage, FTransparentColor)
          else
             FIndexs[State] := FGlyphList.AddMasked(TmpImage, clDefault);
        end;
      bsDisabled:
        begin
          MonoBmp := nil;
          DDB := nil;
          try
            MonoBmp := TBitmap.Create;
            DDB := TBitmap.Create;
            DDB.Assign(FOriginal);
            DDB.HandleType := bmDDB;
            if NumGlyphs > 1 then
            with TmpImage.Canvas do
            begin    // Change white & gray to clBtnHighlight and clBtnShadow
              CopyRect(IRect, DDB.Canvas, ORect);
              MonoBmp.Monochrome := True;
              MonoBmp.Width := IWidth;
              MonoBmp.Height := IHeight;

              // Convert white to clBtnHighlight
              DDB.Canvas.Brush.Color := clWhite;
              MonoBmp.Canvas.CopyRect(IRect, DDB.Canvas, ORect);
              Brush.Color := clBtnHighlight;
              DestDC := Handle;
              SetTextColor(DestDC, clBlack);
              SetBkColor(DestDC, clWhite);
              BitBlt(DestDC, 0, 0, IWidth, IHeight, MonoBmp.Canvas.Handle, 0, 0, ROP_DSPDxax);

              // Convert gray to clBtnShadow
              DDB.Canvas.Brush.Color := clGray;
              MonoBmp.Canvas.CopyRect(IRect, DDB.Canvas, ORect);
              Brush.Color := clBtnShadow;
              DestDC := Handle;
              SetTextColor(DestDC, clBlack);
              SetBkColor(DestDC, clWhite);
              BitBlt(DestDC, 0, 0, IWidth, IHeight, MonoBmp.Canvas.Handle, 0, 0, ROP_DSPDxax);

              // Convert transparent color to clBtnFace
              DDB.Canvas.Brush.Color := ColorToRGB(FTransparentColor);
              MonoBmp.Canvas.CopyRect(IRect, DDB.Canvas, ORect);
              Brush.Color := clBtnFace;
              DestDC := Handle;
              SetTextColor(DestDC, clBlack);
              SetBkColor(DestDC, clWhite);
              BitBlt(DestDC, 0, 0, IWidth, IHeight, MonoBmp.Canvas.Handle, 0, 0, ROP_DSPDxax);
            end
            else
            begin
              // Create a disabled version
              with MonoBmp do
              begin
                Assign(FOriginal);
                HandleType := bmDDB;
                Canvas.Brush.Color := clBlack;
                Width := IWidth;
                if Monochrome then
                begin
                  Canvas.Font.Color := clWhite;
                  Monochrome := False;
                  Canvas.Brush.Color := clWhite;
                end;
                Monochrome := True;
              end;
              with TmpImage.Canvas do
              begin
                Brush.Color := clBtnFace;
                FillRect(IRect);
                Brush.Color := clBtnHighlight;
                SetTextColor(Handle, clBlack);
                SetBkColor(Handle, clWhite);
                BitBlt(Handle, 1, 1, IWidth, IHeight, MonoBmp.Canvas.Handle, 0, 0, ROP_DSPDxax);
                Brush.Color := clBtnShadow;
                SetTextColor(Handle, clBlack);
                SetBkColor(Handle, clWhite);
                BitBlt(Handle, 0, 0, IWidth, IHeight, MonoBmp.Canvas.Handle, 0, 0, ROP_DSPDxax);
              end;
            end;
          finally
            DDB.Free;
            MonoBmp.Free;
          end;
          FIndexs[State] := FGlyphList.AddMasked(TmpImage, clDefault);
        end;
    end;
  finally
    TmpImage.Free;
  end;
  Result := FIndexs[State];
  FOriginal.Dormant;
end;
}

// TSpeedButtonActionLink
procedure TSpeedButtonExActionLink.AssignClient(AClient: TObject);
begin
  inherited AssignClient(AClient);
  FClient := AClient as TSpeedButtonEx;
end;

function TSpeedButtonExActionLink.IsCheckedLinked: Boolean;
begin
  Result := inherited IsCheckedLinked and (FClient.GroupIndex <> 0) and
            FClient.AllowAllUp and (FClient.Down = (Action as TCustomAction).Checked);
end;

function TSpeedButtonExActionLink.IsGroupIndexLinked: Boolean;
begin
  Result := (FClient is TSpeedButtonEx) and
            (TSpeedButtonEx(FClient).GroupIndex = (Action as TCustomAction).GroupIndex);
end;

procedure TSpeedButtonExActionLink.SetChecked(Value: Boolean);
begin
  if IsCheckedLinked then
     TSpeedButtonEx(FClient).Down := Value;
end;

procedure TSpeedButtonExActionLink.SetGroupIndex(Value: Integer);
begin
  if IsGroupIndexLinked then
     TSpeedButtonEx(FClient).GroupIndex := Value;
end;

// TSpeedButton

constructor TSpeedButtonEx.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  SetBounds(0, 0, 23, 22);
  ControlStyle := [csCaptureMouse, csDoubleClicks];
  ParentFont := True;
  Color := clBtnFace;
  FSpacing := 4;
  FMargin := -1;
  FLayout := blGlyphLeft;
  FTransparent := True;

  FImageChangeLink := TChangeLink.Create;       // added June 04, 2019
  FImageChangeLink.OnChange := ImageListChange; // added June 04, 2019

  FImageIndex := -1;                            // added June 04, 2019

  // custom colors
  FGradientColorTop := $004e4e4e; // (78,78,78)
  FGradientColorBottom := $00323232; // (50,50,50)
  FFrameColor := $00222222; // (34,34,34)
  FFrameColor_Focused := $00c0804c; // (76,128,192)

  FGradientColorTop_Hover := $00b97137; // (55,113,185)
  FGradientColorBottom_Hover := $009b5c2a; // (42,92,155)
  FFrameColor_Hover := $00222222; // (34,34,34)

  FGradientColorTop_Down := $00a66632; // (50,102,166)
  FGradientColorBottom_Down := $008c5326; // (38,83,140)
  FFrameColor_Down := clBlack;

  FFontColorDisabled := clBtnShadow;
  FFontShadowColorDisabled := clBtnHighlight;
  FGradientColorTop_Disabled := clSilver;
  FGradientColorBottom_Disabled := clMedGray;
  FFrameColor_Disabled := clGray;

  FShowFontShadow_Disabled := True;
  
  FUseCustomDraw := False;
  FCaptionVertIndent := 0; // MC

  Inc(ButtonCount);
end;
    
destructor TSpeedButtonEx.Destroy;
begin
  Dec(ButtonCount);
  FImageChangeLink.Free;
  inherited Destroy;
end;

procedure TSpeedButtonEx.Paint;
const
  DownStyles: array[Boolean] of Integer = (BDR_RAISEDINNER, BDR_SUNKENOUTER);
  FillStyles: array[Boolean] of Integer = (BF_MIDDLE, 0);
var
  PaintRect: TRect;
  DrawFlags: Integer;
  Offset: TPoint;
  Button: TThemedButton;
  ToolButton: TThemedToolBar;
  Details: TThemedElementDetails;

  // custom colors
  ButtonBMP: TBitmap;
begin
  PaintRect := ClientRect;
  if not Enabled then
  begin
    FState := bsDisabled;
    FDragging := False;
  end
  else
  if FState = bsDisabled then
  begin
    if FDown and (GroupIndex <> 0) then
       FState := bsExclusive
    else
       FState := bsUp;
  end;
  Canvas.Font := Self.Font;

  if FUseCustomDraw and (not FFlat) and (not (csDesigning in ComponentState)) then
  begin
    PaintRect := ClientRect;
    ButtonBMP:= TBitmap.Create;
    ButtonBMP.PixelFormat := pf24bit;
    ButtonBMP.Width  := (PaintRect.Right-PaintRect.Left)-2;
    ButtonBMP.Height := (PaintRect.Bottom-PaintRect.Top)-2;
    ButtonBMP.Canvas.Brush.Style:= bsClear;
    ButtonBMP.Canvas.Lock;

    PaintRect := ButtonBMP.Canvas.ClipRect; // set TRect to ButtonBMP size

    DrawButtonCustomColors(Self, Canvas, PaintRect, ButtonBMP, True, Enabled, FState in [bsDown, bsExclusive], MouseInControl, False, False);

    Offset := Point(0, 0);
    ButtonBMP.Canvas.Font := Canvas.Font;

    DrawButton(ButtonBMP.Canvas, PaintRect, Offset, Caption, FLayout, FMargin, FSpacing, FState, Transparent, DrawTextBiDiModeFlags(0), Self, True);

    //TButtonGlyphEx(FGlyph).Draw(ButtonBMP.Canvas, PaintRect, Offset, Caption, FLayout, FMargin, FSpacing, FState, Transparent, DrawTextBiDiModeFlags(0), Self, True);

    ButtonBMP.Canvas.Unlock;
    BitBlt(Canvas.Handle, 1, 1, ButtonBMP.Width, ButtonBMP.Height, ButtonBMP.Canvas.Handle, 0, 0, SRCCOPY);
    //Canvas.Draw(1, 1, ButtonBMP);
    ButtonBMP.Free;
  end
  else
  if ThemeServices.ThemesEnabled then
  begin
    PerformEraseBackground(Self, Canvas.Handle);

    if not Enabled then
      Button := tbPushButtonDisabled
    else
    if FState in [bsDown, bsExclusive] then
       Button := tbPushButtonPressed
    else
    if MouseInControl then
       Button := tbPushButtonHot
    else
       Button := tbPushButtonNormal;

    ToolButton := ttbToolbarDontCare;
    if FFlat then
    begin
      case Button of
        tbPushButtonDisabled:
          ToolButton := ttbButtonDisabled;
        tbPushButtonPressed:
          ToolButton := ttbButtonPressed;
        tbPushButtonHot:
          ToolButton := ttbButtonHot;
        tbPushButtonNormal:
          ToolButton := ttbButtonNormal;
      end;
    end;

    PaintRect := ClientRect;
    if ToolButton = ttbToolbarDontCare then
       Details := ThemeServices.GetElementDetails(Button)
    else
       Details := ThemeServices.GetElementDetails(ToolButton);
       
    ThemeServices.DrawElement(Canvas.Handle, Details, PaintRect);
    PaintRect := ThemeServices.ContentRect(Canvas.Handle, Details, PaintRect);

    Offset := Point(0, 0);
    //if Button = tbPushButtonPressed then
    //begin
    //  // A pressed speed button has a white text. This applies however only to flat buttons.
    //  //if ToolButton <> ttbToolbarDontCare then
    //  //   Canvas.Font.Color := clHighlightText;
    //  //Offset := Point(1, 0);
    //end
    //else
    //  //Offset := Point(0, 0);
    DrawButton(Canvas, PaintRect, Offset, Caption, FLayout, FMargin, FSpacing, FState, Transparent, DrawTextBiDiModeFlags(0), Self, True);
    //TButtonGlyphEx(FGlyph).Draw(Canvas, PaintRect, Offset, Caption, FLayout, FMargin, FSpacing, FState, Transparent, DrawTextBiDiModeFlags(0), Self, True);
  end
  else
  begin
    PaintRect := Rect(0, 0, Width, Height);
    if not FFlat then
    begin
      DrawFlags := DFCS_BUTTONPUSH or DFCS_ADJUSTRECT;
      if FState in [bsDown, bsExclusive] then
         DrawFlags := DrawFlags or DFCS_PUSHED;
      DrawFrameControl(Canvas.Handle, PaintRect, DFC_BUTTON, DrawFlags);
    end
    else
    begin
      if (FState in [bsDown, bsExclusive]) or
         (FMouseInControl and (FState <> bsDisabled)) or
         (csDesigning in ComponentState) then
         DrawEdge(Canvas.Handle, PaintRect, DownStyles[FState in [bsDown, bsExclusive]], FillStyles[Transparent] or BF_RECT)
      else
      if not Transparent then
      begin
        Canvas.Brush.Color := Color;
        Canvas.FillRect(PaintRect);
      end;
      InflateRect(PaintRect, -1, -1);
    end;
    if FState in [bsDown, bsExclusive] then
    begin
      if (FState = bsExclusive) and (not FFlat or not FMouseInControl) then
      begin
        Canvas.Brush.Bitmap := AllocPatternBitmap(clBtnFace, clBtnHighlight);
        Canvas.FillRect(PaintRect);
      end;
      Offset.X := 0;//1;
      Offset.Y := 0;//1;
    end
    else
    begin
      Offset.X := 0;
      Offset.Y := 0;
    end;
    DrawButton(Canvas, PaintRect, Offset, Caption, FLayout, FMargin, FSpacing, FState, Transparent, DrawTextBiDiModeFlags(0), Self, True);
    //TButtonGlyphEx(FGlyph).Draw(Canvas, PaintRect, Offset, Caption, FLayout, FMargin, FSpacing, FState, Transparent, DrawTextBiDiModeFlags(0), Self, True);
  end;
end;

procedure TSpeedButtonEx.UpdateTracking;
var
  P: TPoint;
begin
  if FFlat then
  begin
    if Enabled then
    begin
      GetCursorPos(P);
      FMouseInControl := not (FindDragTarget(P, True) = Self);
      if FMouseInControl then
         Perform(CM_MOUSELEAVE, 0, 0)
      else
         Perform(CM_MOUSEENTER, 0, 0);
    end;
  end;
end;
    
procedure TSpeedButtonEx.Loaded;
var
  State: TButtonStateEx;
begin
  inherited Loaded;
  if Enabled then
     State := bsUp
  else
     State := bsDisabled;
  //TButtonGlyphEx(FGlyph).CreateButtonGlyph(State); // no longer needed
end;
    
procedure TSpeedButtonEx.MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited MouseDown(Button, Shift, X, Y);
  if (Button = mbLeft) and Enabled then
  begin
    if not FDown then
    begin
      FState := bsDown;
      Invalidate;
    end;
    FDragging := True;
  end;
end;

procedure TSpeedButtonEx.MouseMove(Shift: TShiftState; X, Y: Integer);
var
  NewState: TButtonStateEx;
begin
  inherited MouseMove(Shift, X, Y);
  if FDragging then
  begin
    if not FDown then
       NewState := bsUp
    else
       NewState := bsExclusive;
    if (X >= 0) and (X < ClientWidth) and (Y >= 0) and (Y <= ClientHeight) then
    begin
      if FDown then
         NewState := bsExclusive
      else
         NewState := bsDown;
    end;
    if NewState <> FState then
    begin
      FState := NewState;
      Invalidate;
    end;
  end
  else
  if not FMouseInControl then
     UpdateTracking;
end;

procedure TSpeedButtonEx.MouseUp(Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  DoClick: Boolean;
begin
  inherited MouseUp(Button, Shift, X, Y);
  if FDragging then
  begin
    FDragging := False;
    DoClick := (X >= 0) and (X < ClientWidth) and (Y >= 0) and (Y <= ClientHeight);
    if FGroupIndex = 0 then
    begin
      // Redraw face in-case mouse is captured
      FState := bsUp;
      FMouseInControl := False;
      if DoClick and not (FState in [bsExclusive, bsDown]) then
        Invalidate;
    end
    else
      if DoClick then
      begin
        SetDown(not FDown);
        if FDown then
           Repaint;
      end
      else
      begin
        if FDown then
           FState := bsExclusive;
        Repaint;
      end;
    if DoClick then
       Click;
    UpdateTracking;
  end;
end;

procedure TSpeedButtonEx.Click;
begin
  inherited Click;
end;

function TSpeedButtonEx.GetActionLinkClass: TControlActionLinkClass;
begin
  Result := TSpeedButtonExActionLink;
end;

procedure TSpeedButtonEx.SetImages(Value: TCustomImageList);
begin
  if FImages <> nil then
     FImages.UnRegisterChanges(FImageChangeLink);
  FImages := Value;
  if FImages <> nil then
  begin
    FImages.RegisterChanges(FImageChangeLink);
    FImages.FreeNotification(Self);
  end;
  Invalidate;
end;

procedure TSpeedButtonEx.SetImageIndex(Value: TImageIndex);
begin
  if FImageIndex <> Value then
  begin
    FImageIndex := Value;
    if Assigned(Images) then
       Invalidate;
  end;
end;

procedure TSpeedButtonEx.ImageListChange(Sender: TObject);
begin
  if Sender = Images then
     Invalidate;
end;

procedure TSpeedButtonEx.UpdateExclusive;
var
  Msg: TMessage;
begin
  if (FGroupIndex <> 0) and (Parent <> nil) then
  begin
    Msg.Msg := CM_BUTTONPRESSED;
    Msg.WParam := FGroupIndex;
    Msg.LParam := Longint(Self);
    Msg.Result := 0;
    Parent.Broadcast(Msg);
  end;
end;
    
procedure TSpeedButtonEx.SetDown(Value: Boolean);
begin
  if FGroupIndex = 0 then
     Value := False;
  if Value <> FDown then
  begin
    if FDown and (not FAllowAllUp) then
       Exit;
    FDown := Value;
    if Value then
    begin
      if FState = bsUp then
         Invalidate;
      FState := bsExclusive;
    end
    else
    begin
      FState := bsUp;
      Repaint;
    end;
    if Value then
       UpdateExclusive;
  end;
end;
    
procedure TSpeedButtonEx.SetFlat(Value: Boolean);
begin
  if Value <> FFlat then
  begin
    FFlat := Value;
    Invalidate;
  end;
end;

procedure TSpeedButtonEx.SetGroupIndex(Value: Integer);
begin
  if FGroupIndex <> Value then
  begin
    FGroupIndex := Value;
    UpdateExclusive;
  end;
end;

procedure TSpeedButtonEx.SetLayout(Value: TButtonLayoutEx);
begin
  if FLayout <> Value then
  begin
    FLayout := Value;
    Invalidate;
  end;
end;
    
procedure TSpeedButtonEx.SetMargin(Value: Integer);
begin
  if (Value <> FMargin) and (Value >= -1) then
  begin
    FMargin := Value;
    Invalidate;
  end;
end;
    
procedure TSpeedButtonEx.SetSpacing(Value: Integer);
begin
  if Value <> FSpacing then
  begin
    FSpacing := Value;
    Invalidate;
  end;
end;

procedure TSpeedButtonEx.SetTransparent(Value: Boolean);
begin
  if Value <> FTransparent then
  begin
    FTransparent := Value;
    if Value then
       ControlStyle := ControlStyle - [csOpaque]
    else
       ControlStyle := ControlStyle + [csOpaque];
    Invalidate;
  end;
end;

procedure TSpeedButtonEx.SetAllowAllUp(Value: Boolean);
begin
  if FAllowAllUp <> Value then
  begin
    FAllowAllUp := Value;
    UpdateExclusive;
  end;
end;

procedure TSpeedButtonEx.WMLButtonDblClk(var Message: TWMLButtonDown);
begin
  inherited;
  if FDown then
     DblClick;
end;
    
procedure TSpeedButtonEx.CMEnabledChanged(var Message: TMessage);
const
  NewState: array[Boolean] of TButtonStateEx = (bsDisabled, bsUp);
begin
  //TButtonGlyphEx(FGlyph).CreateButtonGlyph(NewState[Enabled]); // no longer needed
  UpdateTracking;
  Repaint;
end;

procedure TSpeedButtonEx.CMButtonPressed(var Message: TMessage);
var
  Sender: TSpeedButtonEx;
begin
  if Message.WParam = FGroupIndex then
  begin
    Sender := TSpeedButtonEx(Message.LParam);
    if Sender <> Self then
    begin
      if Sender.Down and FDown then
      begin
        FDown := False;
        FState := bsUp;
        if (Action is TCustomAction) then
           TCustomAction(Action).Checked := False;
        Invalidate;
      end;
      FAllowAllUp := Sender.AllowAllUp;
    end;
  end;
end;

procedure TSpeedButtonEx.CMDialogChar(var Message: TCMDialogChar);
begin
  with Message do
  begin
    if IsAccel(CharCode, Caption) and Enabled and Visible and (Parent <> nil) and Parent.Showing then
    begin
      Click;
      Result := 1;
    end
    else
      inherited;
  end;
end;
    
procedure TSpeedButtonEx.CMFontChanged(var Message: TMessage);
begin
  Invalidate;
end;

procedure TSpeedButtonEx.CMTextChanged(var Message: TMessage);
begin
  Invalidate;
end;

procedure TSpeedButtonEx.CMSysColorChange(var Message: TMessage);
begin
  Invalidate;
  //with TButtonGlyphEx(FGlyph) do
  //begin
  //  Invalidate;
  //  CreateButtonGlyph(FState); // no longer needed
  //end;
end;
    
procedure TSpeedButtonEx.CMMouseEnter(var Message: TMessage);
var
  NeedRepaint: Boolean;
begin
  inherited;
  // don't draw a border if DragMode <> dmAutomatic since this button is meant to be used as a dock client
  NeedRepaint := FFlat and not FMouseInControl and Enabled and (DragMode <> dmAutomatic) and (GetCapture = 0);

  // Windows XP introduced hot states also for non-flat buttons
  if (NeedRepaint or ThemeServices.ThemesEnabled) and not (csDesigning in ComponentState) then
  begin
    FMouseInControl := True;
    if Enabled then
       Repaint;
  end;
end;

procedure TSpeedButtonEx.CMMouseLeave(var Message: TMessage);
var
  NeedRepaint: Boolean;
begin
  inherited;
  NeedRepaint := FFlat and FMouseInControl and Enabled and not FDragging;

  // Windows XP introduced hot states also for non-flat buttons
  if NeedRepaint or ThemeServices.ThemesEnabled then
  begin
    FMouseInControl := False;
    if Enabled then
       Repaint;
  end;
end;

procedure TSpeedButtonEx.ActionChange(Sender: TObject; CheckDefaults: Boolean);

  //procedure CopyImage(ImageList: TCustomImageList; Index: Integer);
  //begin
  //  with Glyph do
  //  begin
  //    Width := ImageList.Width;
  //    Height := ImageList.Height;
  //    Canvas.Brush.Color := clFuchsia; //! for lack of a better color
  //    Canvas.FillRect(Rect(0,0, Width, Height));
  //    ImageList.Draw(Canvas, 0, 0, Index);
  //  end;
  //end;

begin
  inherited ActionChange(Sender, CheckDefaults);
  if Sender is TCustomAction then
  begin
    with TCustomAction(Sender) do
    begin
      if CheckDefaults or (Self.GroupIndex = 0) then
         Self.GroupIndex := GroupIndex;

      //// copy image from action's imagelist
      //if (Glyph.Empty) and (ActionList <> nil) and (ActionList.Images <> nil) and
      //   (ImageIndex >= 0) and (ImageIndex < ActionList.Images.Count) then
      //  CopyImage(ActionList.Images, ImageIndex);

      Self.ImageIndex := ImageIndex; // added June 04, 2019
    end;
  end;
end;

// custom colors
procedure TSpeedButtonEx.SetGradientColorTop(Value: TColor);
begin
  if FGradientColorTop <> Value then
     begin
       FGradientColorTop:= Value;
       if FUseCustomDraw and (not (csDesigning in ComponentState)) then
          Invalidate;
     end;
end;

procedure TSpeedButtonEx.SetGradientColorBottom(Value: TColor);
begin
  if FGradientColorBottom <> Value then
     begin
       FGradientColorBottom:= Value;
       if FUseCustomDraw and (not (csDesigning in ComponentState)) then
          Invalidate;
     end;
end;

procedure TSpeedButtonEx.SetFrameColor(Value: TColor);
begin
  if FFrameColor <> Value then
     begin
       FFrameColor:= Value;
       if FUseCustomDraw and (not (csDesigning in ComponentState)) then
          Invalidate;
     end;
end;

procedure TSpeedButtonEx.SetFrameColor_Focused(Value: TColor);
begin
  if FFrameColor_Focused <> Value then
     begin
       FFrameColor_Focused:= Value;
       if FUseCustomDraw and (not (csDesigning in ComponentState)) then
          Invalidate;
     end;
end;

procedure TSpeedButtonEx.SetGradientColorTop_Hover(Value: TColor);
begin
  if FGradientColorTop_Hover <> Value then
     begin
       FGradientColorTop_Hover:= Value;
       if FUseCustomDraw and (not (csDesigning in ComponentState)) then
          Invalidate;
     end;
end;

procedure TSpeedButtonEx.SetGradientColorBottom_Hover(Value: TColor);
begin
  if FGradientColorBottom_Hover <> Value then
     begin
       FGradientColorBottom_Hover:= Value;
       if FUseCustomDraw and (not (csDesigning in ComponentState)) then
          Invalidate;
     end;
end;

procedure TSpeedButtonEx.SetFrameColor_Hover(Value: TColor);
begin
  if FFrameColor_Hover <> Value then
     begin
       FFrameColor_Hover:= Value;
       if FUseCustomDraw and (not (csDesigning in ComponentState)) then
          Invalidate;
     end;
end;

procedure TSpeedButtonEx.SetGradientColorTop_Down(Value: TColor);
begin
  if FGradientColorTop_Down <> Value then
     begin
       FGradientColorTop_Down:= Value;
       if FUseCustomDraw and (not (csDesigning in ComponentState)) then
          Invalidate;
     end;
end;

procedure TSpeedButtonEx.SetGradientColorBottom_Down(Value: TColor);
begin
  if FGradientColorBottom_Down <> Value then
     begin
       FGradientColorBottom_Down:= Value;
       if FUseCustomDraw and (not (csDesigning in ComponentState)) then
          Invalidate;
     end;
end;

procedure TSpeedButtonEx.SetFrameColor_Down(Value: TColor);
begin
  if FFrameColor_Down <> Value then
     begin
       FFrameColor_Down:= Value;
       if FUseCustomDraw and (not (csDesigning in ComponentState)) then
          Invalidate;
     end;
end;

procedure TSpeedButtonEx.SetFontColorDisabled(Value: TColor);
begin
  if FFontColorDisabled <> Value then
     begin
       FFontColorDisabled:= Value;
       if FUseCustomDraw and (not (csDesigning in ComponentState)) then
          Invalidate;
     end;
end;

procedure TSpeedButtonEx.SetFontShadowColorDisabled(Value: TColor);
begin
  if FFontShadowColorDisabled <> Value then
     begin
       FFontShadowColorDisabled:= Value;
       if FUseCustomDraw and (not (csDesigning in ComponentState)) then
          Invalidate;
     end;
end;

procedure TSpeedButtonEx.SetGradientColorTop_Disabled(Value: TColor);
begin
  if FGradientColorTop_Disabled <> Value then
     begin
       FGradientColorTop_Disabled:= Value;
       if FUseCustomDraw and (not (csDesigning in ComponentState)) then
          Invalidate;
     end;
end;

procedure TSpeedButtonEx.SetGradientColorBottom_Disabled(Value: TColor);
begin
  if FGradientColorBottom_Disabled <> Value then
     begin
       FGradientColorBottom_Disabled:= Value;
       if FUseCustomDraw and (not (csDesigning in ComponentState)) then
          Invalidate;
     end;
end;

procedure TSpeedButtonEx.SetFrameColor_Disabled(Value: TColor);
begin
  if FFrameColor_Disabled <> Value then
     begin
       FFrameColor_Disabled:= Value;
       if FUseCustomDraw and (not (csDesigning in ComponentState)) then
          Invalidate;
     end;
end;

procedure TSpeedButtonEx.SetShowFontShadow_Disabled(Value: Boolean);
begin
  if FShowFontShadow_Disabled <> Value then
  begin
    FShowFontShadow_Disabled := Value;
    if not (csDesigning in ComponentState) then
       Invalidate;
  end;
end;

procedure TSpeedButtonEx.SetUseCustomDraw(Value: Boolean);
begin
  if FUseCustomDraw <> Value then
     begin
       FUseCustomDraw:= Value;
       if not (csDesigning in ComponentState) then
          Invalidate;
     end;
end;

// added by Ciro Alfredo Consentino (XXX) readded by Moreno Cattaneo for missing source
procedure TSpeedButtonEx.SetCaptionVertIndent(Value: Integer);
begin
  if FCaptionVertIndent <> Value then
  begin
    FCaptionVertIndent := Value;
    if not (csDesigning in ComponentState) then
       Invalidate;
  end;
end;

procedure TSpeedButtonEx.WMERASEBKGND(var Message: TWMEraseBkgnd);
begin
  Message.Result := 1;
end;

// TBitBtn
constructor TBitBtnEx.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FCanvas := TCanvas.Create;
  FStyle := bsAutoDetect;
  FKind := bkCustom;
  FLayout := blGlyphLeft;
  FSpacing := 4;
  FMargin := -1;

  FImageChangeLink := TChangeLink.Create;       // added June 04, 2019
  FImageChangeLink.OnChange := ImageListChange; // added June 04, 2019

  FImageIndex := -1;                            // added June 04, 2019
  
  // custom colors
  FGradientColorTop := $004e4e4e; // (78,78,78)
  FGradientColorBottom := $00323232; // (50,50,50)
  FFrameColor := $00222222; // (34,34,34)
  FFrameColor_Focused := $00c0804c; // (76,128,192)

  FGradientColorTop_Hover := $00b97137; // (55,113,185)
  FGradientColorBottom_Hover := $009b5c2a; // (42,92,155)
  FFrameColor_Hover := $00222222; // (34,34,34)

  FGradientColorTop_Down := $00a66632; // (50,102,166)
  FGradientColorBottom_Down := $008c5326; // (38,83,140)
  FFrameColor_Down := clBlack;

  FFontColorDisabled := clBtnShadow;
  FFontShadowColorDisabled := clBtnHighlight;
  FGradientColorTop_Disabled := clSilver;
  FGradientColorBottom_Disabled := clMedGray;
  FFrameColor_Disabled := clGray;

  FShowFontShadow_Disabled := True;
  
  FUseCustomDraw := False;
  FCaptionVertIndent := 0; //MC

  ControlStyle := ControlStyle + [csReflector];
  DoubleBuffered := True;
end;
    
destructor TBitBtnEx.Destroy;
begin
  FImageChangeLink.Free;
  FCanvas.Free;
  inherited Destroy;
end;

procedure TBitBtnEx.SetImages(Value: TCustomImageList);
begin
  if FImages <> nil then
     FImages.UnRegisterChanges(FImageChangeLink);
  FImages := Value;
  if FImages <> nil then
  begin
    FImages.RegisterChanges(FImageChangeLink);
    FImages.FreeNotification(Self);
  end;
  Invalidate;
end;

procedure TBitBtnEx.SetImageIndex(Value: TImageIndex);
begin
  if FImageIndex <> Value then
  begin
    FImageIndex := Value;
    if Assigned(Images) then
       Invalidate;
  end;
end;

procedure TBitBtnEx.ImageListChange(Sender: TObject);
begin
  if Sender = Images then
     Invalidate;
end;

procedure TBitBtnEx.CreateHandle;
var
  State: TButtonStateEx;
begin
  if Enabled then
     State := bsUp
  else
     State := bsDisabled;
  inherited CreateHandle;
  //TButtonGlyphEx(FGlyph).CreateButtonGlyph(State); // no longer needed
end;

procedure TBitBtnEx.CreateParams(var Params: TCreateParams);
begin
  inherited CreateParams(Params);
  with Params do Style := Style or BS_OWNERDRAW;
end;
    
procedure TBitBtnEx.SetButtonStyle(ADefault: Boolean);
begin
  if ADefault <> IsFocused then
  begin
    IsFocused := ADefault;
    Refresh;
  end;
end;
    
procedure TBitBtnEx.Click;
var
  Form: TCustomForm;
  Control: TWinControl;
begin
  case FKind of
    bkClose:
      begin
        Form := GetParentForm(Self);
        if Form <> nil then
           Form.Close
        else
           inherited Click;
      end;
    bkHelp:
      begin
        Control := Self;
        while (Control <> nil) and (Control.HelpContext = 0) do
              Control := Control.Parent;
        if Control <> nil then
           Application.HelpContext(Control.HelpContext)
        else
           inherited Click;
      end;
    else
      inherited Click;
  end;
end;

procedure TBitBtnEx.CNMeasureItem(var Message: TWMMeasureItem);
begin
  with Message.MeasureItemStruct^ do
  begin
    itemWidth := Width;
    itemHeight := Height;
  end;
end;

procedure TBitBtnEx.CNDrawItem(var Message: TWMDrawItem);
begin
  DrawItem(Message.DrawItemStruct^);
end;

procedure TBitBtnEx.DrawItem(const DrawItemStruct: TDrawItemStruct);
var
  IsDown, IsDefault: Boolean;
  State: TButtonStateEx;
  //R, R_Frame: TRect;
  R: TRect;
  Flags: Longint;
  Details: TThemedElementDetails;
  Button: TThemedButton;
  Offset: TPoint;

  // custom colors
  ButtonBMP: TBitmap;
begin
  FCanvas.Handle := DrawItemStruct.hDC;
  R := ClientRect;

  with DrawItemStruct do
  begin
    FCanvas.Handle := hDC;
    FCanvas.Font := Self.Font;
    IsDown := itemState and ODS_SELECTED <> 0;
    IsDefault := itemState and ODS_FOCUS <> 0;

    if not Enabled then
       State := bsDisabled
    else
    if IsDown then State := bsDown
    else
       State := bsUp;
  end;

  if FUseCustomDraw and (not (csDesigning in ComponentState)) then
  begin
    ButtonBMP:= TBitmap.Create;
    ButtonBMP.PixelFormat := pf24bit;
    ButtonBMP.Width  := (R.Right-R.Left)-2;
    ButtonBMP.Height := (R.Bottom-R.Top)-2;
    ButtonBMP.Canvas.Brush.Style:= bsClear;
    ButtonBMP.Canvas.Lock;

    R := ButtonBMP.Canvas.ClipRect; // set TRect to ButtonBMP size

    DrawButtonCustomColors(Self, FCanvas, R, ButtonBMP, False, Enabled, IsDown, FMouseInControl, IsFocused, IsDefault);

    Offset := Point(0, 0);
    ButtonBMP.Canvas.Font := Self.Font;
    DrawButton(ButtonBMP.Canvas, R, Offset, Caption, FLayout, FMargin, FSpacing, State, False, DrawTextBiDiModeFlags(0), Self, False);
    //TButtonGlyphEx(FGlyph).Draw(ButtonBMP.Canvas, R, Offset, Caption, FLayout, FMargin, FSpacing, State, False, DrawTextBiDiModeFlags(0), Self, False);

    ButtonBMP.Canvas.Unlock;
    BitBlt(FCanvas.Handle, 1, 1, ButtonBMP.Width, ButtonBMP.Height, ButtonBMP.Canvas.Handle, 0, 0, SRCCOPY);
    //FCanvas.Draw(1, 1, ButtonBMP);
    ButtonBMP.Free;
  end
  else
  if ThemeServices.ThemesEnabled then
  begin
    if not Enabled then
       Button := tbPushButtonDisabled
    else
    if IsDown then
       Button := tbPushButtonPressed
    else
    if FMouseInControl then
       Button := tbPushButtonHot
    else
    if IsFocused or IsDefault then
       Button := tbPushButtonDefaulted
    else
       Button := tbPushButtonNormal;

    Details := ThemeServices.GetElementDetails(Button);
    // parent background
    ThemeServices.DrawParentBackground(Handle, DrawItemStruct.hDC, @Details, True);
    // button shape
    ThemeServices.DrawElement(DrawItemStruct.hDC, Details, DrawItemStruct.rcItem);
    R := ThemeServices.ContentRect(FCanvas.Handle, Details, DrawItemStruct.rcItem);

    Offset := Point(0, 0);
    //if Button = tbPushButtonPressed then
    //   Offset := Point(1, 0)
    //else
    //   Offset := Point(0, 0);
    DrawButton(FCanvas, R, Offset, Caption, FLayout, FMargin, FSpacing, State, False, DrawTextBiDiModeFlags(0), Self, False);
    //TButtonGlyphEx(FGlyph).Draw(FCanvas, R, Offset, Caption, FLayout, FMargin, FSpacing, State, False, DrawTextBiDiModeFlags(0), Self, False);

    if IsFocused and IsDefault then
    begin
      FCanvas.Pen.Color := clWindowFrame;
      FCanvas.Brush.Color := clBtnFace;
      DrawFocusRect(FCanvas.Handle, R);
    end;
  end
  else
  begin
    R := ClientRect;

    Flags := DFCS_BUTTONPUSH or DFCS_ADJUSTRECT;
    if IsDown then
       Flags := Flags or DFCS_PUSHED;
    if DrawItemStruct.itemState and ODS_DISABLED <> 0 then
       Flags := Flags or DFCS_INACTIVE;

    // DrawFrameControl doesn't allow for drawing a button as the default button, so it must be done here
    if IsFocused or IsDefault then
    begin
      FCanvas.Pen.Color := clWindowFrame;
      FCanvas.Pen.Width := 1;
      FCanvas.Brush.Style := bsClear;
      FCanvas.Rectangle(R.Left, R.Top, R.Right, R.Bottom);

      // DrawFrameControl must draw within this border
      InflateRect(R, -1, -1);
    end;

    // DrawFrameControl does not draw a pressed button correctly
    if IsDown then
    begin
      FCanvas.Pen.Color := clBtnShadow;
      FCanvas.Pen.Width := 1;
      FCanvas.Brush.Color := clBtnFace;
      FCanvas.Rectangle(R.Left, R.Top, R.Right, R.Bottom);
      InflateRect(R, -1, -1);
    end
    else
      DrawFrameControl(DrawItemStruct.hDC, R, DFC_BUTTON, Flags);

    if IsFocused then
    begin
      R := ClientRect;
      InflateRect(R, -1, -1);
    end;

    FCanvas.Font := Self.Font;
    if IsDown then
       OffsetRect(R, 1, 1);
    DrawButton(FCanvas, R, Point(0, 0), Caption, FLayout, FMargin, FSpacing, State, False, DrawTextBiDiModeFlags(0), Self, False);
    //TButtonGlyphEx(FGlyph).Draw(FCanvas, R, Point(0,0), Caption, FLayout, FMargin, FSpacing, State, False, DrawTextBiDiModeFlags(0), Self, False);

    if IsFocused and IsDefault then
    begin
      R := ClientRect;
      InflateRect(R, -4, -4);
      FCanvas.Pen.Color := clWindowFrame;
      FCanvas.Brush.Color := clBtnFace;
      DrawFocusRect(FCanvas.Handle, R);
    end;
  end;

  FCanvas.Handle := 0;
end;
    
procedure TBitBtnEx.CMFontChanged(var Message: TMessage);
begin
  inherited;
  Invalidate;
end;

procedure TBitBtnEx.CMEnabledChanged(var Message: TMessage);
begin
  inherited;
  Invalidate;
end;

procedure TBitBtnEx.WMLButtonDblClk(var Message: TWMLButtonDblClk);
begin
  Perform(WM_LBUTTONDOWN, Message.Keys, Longint(Message.Pos));
end;

function TBitBtnEx.IsCustom: Boolean;
begin
  Result := Kind = bkCustom;
end;

procedure TBitBtnEx.SetStyle(Value: TButtonStyleEx);
begin
  if Value <> FStyle then
  begin
    FStyle := Value;
    Invalidate;
  end;
end;

procedure TBitBtnEx.SetKind(Value: TBitBtnKindEx);
begin
  if Value <> FKind then
  begin
    if Value <> bkCustom then
    begin
      Default := Value in [bkOK, bkYes];
      Cancel := Value in [bkCancel, bkNo];
    
      if ((csLoading in ComponentState) and (Caption = '')) or (not (csLoading in ComponentState)) then
      begin
        Caption := LoadResString(GetCaptionButton(Value));
      end;

      ModalResult := BitBtnModalResultsEx[Value];
    end;
    FKind := Value;
    Invalidate;
  end;
end;

function TBitBtnEx.IsCustomCaption: Boolean;
begin
  Result := AnsiCompareStr(Caption, LoadResString(GetCaptionButton(FKind))) <> 0;
end;

function TBitBtnEx.GetKind: TBitBtnKindEx;
begin
  if FKind <> bkCustom then
  begin
    if ((FKind in [bkOK, bkYes]) xor Default) or
       ((FKind in [bkCancel, bkNo]) xor Cancel) or
       (ModalResult <> BitBtnModalResultsEx[FKind]) then
       FKind := bkCustom;
  end;
  Result := FKind;
end;
    
procedure TBitBtnEx.SetLayout(Value: TButtonLayoutEx);
begin
  if FLayout <> Value then
  begin
    FLayout := Value;
    Invalidate;
  end;
end;

procedure TBitBtnEx.SetSpacing(Value: Integer);
begin
  if FSpacing <> Value then
  begin
    FSpacing := Value;
    Invalidate;
  end;
end;
    
procedure TBitBtnEx.SetMargin(Value: Integer);
begin
  if (Value <> FMargin) and (Value >= - 1) then
  begin
    FMargin := Value;
    Invalidate;
  end;
end;

procedure TBitBtnEx.ActionChange(Sender: TObject; CheckDefaults: Boolean);

  //procedure CopyImage(ImageList: TCustomImageList; Index: Integer);
  //begin
  //  with Glyph do
  //  begin
  //    Width := ImageList.Width;
  //    Height := ImageList.Height;
  //    Canvas.Brush.Color := clFuchsia;//! for lack of a better color
  //    Canvas.FillRect(Rect(0,0, Width, Height));
  //    ImageList.Draw(Canvas, 0, 0, Index);
  //  end;
  //end;

begin
  inherited ActionChange(Sender, CheckDefaults);
  if Sender is TCustomAction then
  begin
    with TCustomAction(Sender) do
    begin
      //// copy image from action's imagelist
      //if (Glyph.Empty) and (ActionList <> nil) and (ActionList.Images <> nil) and
      //   (ImageIndex >= 0) and (ImageIndex < ActionList.Images.Count) then
      //   CopyImage(ActionList.Images, ImageIndex);
    end;
  end;
end;

procedure TBitBtnEx.CMMouseEnter(var Message: TMessage);
begin
  inherited;
  if ThemeServices.ThemesEnabled and not FMouseInControl and not (csDesigning in ComponentState) then
  begin
    FMouseInControl := True;
    Repaint;
  end;
end;

procedure TBitBtnEx.CMMouseLeave(var Message: TMessage);
begin
  inherited;
  if ThemeServices.ThemesEnabled and FMouseInControl then
  begin
    FMouseInControl := False;
    Repaint;
  end;
end;

// custom colors
procedure TBitBtnEx.SetGradientColorTop(Value: TColor);
begin
  if FGradientColorTop <> Value then
     begin
       FGradientColorTop:= Value;
       if FUseCustomDraw and (not (csDesigning in ComponentState)) then
          Invalidate;
     end;
end;

procedure TBitBtnEx.SetGradientColorBottom(Value: TColor);
begin
  if FGradientColorBottom <> Value then
     begin
       FGradientColorBottom:= Value;
       if FUseCustomDraw and (not (csDesigning in ComponentState)) then
          Invalidate;
     end;
end;

procedure TBitBtnEx.SetFrameColor(Value: TColor);
begin
  if FFrameColor <> Value then
     begin
       FFrameColor:= Value;
       if FUseCustomDraw and (not (csDesigning in ComponentState)) then
          Invalidate;
     end;
end;

procedure TBitBtnEx.SetFrameColor_Focused(Value: TColor);
begin
  if FFrameColor_Focused <> Value then
     begin
       FFrameColor_Focused:= Value;
       if FUseCustomDraw and (not (csDesigning in ComponentState)) then
          Invalidate;
     end;
end;

procedure TBitBtnEx.SetGradientColorTop_Hover(Value: TColor);
begin
  if FGradientColorTop_Hover <> Value then
     begin
       FGradientColorTop_Hover:= Value;
       if FUseCustomDraw and (not (csDesigning in ComponentState)) then
          Invalidate;
     end;
end;

procedure TBitBtnEx.SetGradientColorBottom_Hover(Value: TColor);
begin
  if FGradientColorBottom_Hover <> Value then
     begin
       FGradientColorBottom_Hover:= Value;
       if FUseCustomDraw and (not (csDesigning in ComponentState)) then
          Invalidate;
     end;
end;

procedure TBitBtnEx.SetFrameColor_Hover(Value: TColor);
begin
  if FFrameColor_Hover <> Value then
     begin
       FFrameColor_Hover:= Value;
       if FUseCustomDraw and (not (csDesigning in ComponentState)) then
          Invalidate;
     end;
end;

procedure TBitBtnEx.SetGradientColorTop_Down(Value: TColor);
begin
  if FGradientColorTop_Down <> Value then
     begin
       FGradientColorTop_Down:= Value;
       if FUseCustomDraw and (not (csDesigning in ComponentState)) then
          Invalidate;
     end;
end;

procedure TBitBtnEx.SetGradientColorBottom_Down(Value: TColor);
begin
  if FGradientColorBottom_Down <> Value then
     begin
       FGradientColorBottom_Down:= Value;
       if FUseCustomDraw and (not (csDesigning in ComponentState)) then
          Invalidate;
     end;
end;

procedure TBitBtnEx.SetFrameColor_Down(Value: TColor);
begin
  if FFrameColor_Down <> Value then
     begin
       FFrameColor_Down:= Value;
       if FUseCustomDraw and (not (csDesigning in ComponentState)) then
          Invalidate;
     end;
end;

procedure TBitBtnEx.SetFontColorDisabled(Value: TColor);
begin
  if FFontColorDisabled <> Value then
     begin
       FFontColorDisabled:= Value;
       if FUseCustomDraw and (not (csDesigning in ComponentState)) then
          Invalidate;
     end;
end;

procedure TBitBtnEx.SetFontShadowColorDisabled(Value: TColor);
begin
  if FFontShadowColorDisabled <> Value then
     begin
       FFontShadowColorDisabled:= Value;
       if FUseCustomDraw and (not (csDesigning in ComponentState)) then
          Invalidate;
     end;
end;

procedure TBitBtnEx.SetGradientColorTop_Disabled(Value: TColor);
begin
  if FGradientColorTop_Disabled <> Value then
     begin
       FGradientColorTop_Disabled:= Value;
       if FUseCustomDraw and (not (csDesigning in ComponentState)) then
          Invalidate;
     end;
end;

procedure TBitBtnEx.SetGradientColorBottom_Disabled(Value: TColor);
begin
  if FGradientColorBottom_Disabled <> Value then
     begin
       FGradientColorBottom_Disabled:= Value;
       if FUseCustomDraw and (not (csDesigning in ComponentState)) then
          Invalidate;
     end;
end;

procedure TBitBtnEx.SetFrameColor_Disabled(Value: TColor);
begin
  if FFrameColor_Disabled <> Value then
     begin
       FFrameColor_Disabled:= Value;
       if FUseCustomDraw and (not (csDesigning in ComponentState)) then
          Invalidate;
     end;
end;

procedure TBitBtnEx.SetShowFontShadow_Disabled(Value: Boolean);
begin
  if FShowFontShadow_Disabled <> Value then
  begin
    FShowFontShadow_Disabled := Value;
    if not (csDesigning in ComponentState) then
       Invalidate;
  end;
end;

procedure TBitBtnEx.SetUseCustomDraw(Value: Boolean);
begin
  if FUseCustomDraw <> Value then
     begin
       FUseCustomDraw:= Value;
       if not (csDesigning in ComponentState) then
          Invalidate;
     end;
end;

// added by Ciro Alfredo Consentino (XXX) readded by Moreno Cattaneo for missing source
procedure TBitBtnEx.SetCaptionVertIndent(Value: Integer);
begin
  if FCaptionVertIndent <> Value then
  begin
    FCaptionVertIndent := Value;
    if not (csDesigning in ComponentState) then
       Invalidate;
  end;
end;

procedure TBitBtnEx.WMERASEBKGND(var Message: TWMEraseBkgnd);
begin
  Message.Result := 1;
end;

initialization

finalization


end.
