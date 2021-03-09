{***************************************************************************}
{ TAdvGroupBox component                                                    }
{ for Delphi & C++Builder                                                   }
{                                                                           }
{ written by TMS Software                                                   }
{            copyright © 2007 - 2017                                        }
{            Email : info@tmssoftware.com                                   }
{            Web : http://www.tmssoftware.com                               }
{                                                                           }
{ The source code is given as is. The author is not responsible             }
{ for any possible damage done due to the use of this code.                 }
{ The component can be freely used in any application. The complete         }
{ source code remains property of the author and may not be distributed,    }
{ published, given or sold in any form as such. No parts of the source      }
{ code can be included in any other component or application without        }
{ written authorization of the author.                                      }
{***************************************************************************}

unit AdvGroupBox;

{$I TMSDEFS.INC}
{$R AdvGroupBox.res}


interface

uses
  Classes, Windows, Forms, Dialogs, Controls, Graphics, Messages, ExtCtrls,
  SysUtils, StdCtrls, ImgList;

const

  MAJ_VER = 1; // Major version nr.
  MIN_VER = 1; // Minor version nr.
  REL_VER = 4; // Release nr.
  BLD_VER = 1; // Build nr.

  // version history
  // v1.0.0.0 : first release
  // v1.0.0.1 : fixed issue for XP theming
  // v1.0.0.2 : fixed issue with persisting Ctl3D property setting
  // v1.1.0.0 : New : CheckBox property added
  // v1.1.0.1 : Fixed : Issue with checkbox hint
  // v1.1.0.2 : Fixed : Issue with initial checkbox state for caDisable
  // v1.1.0.3 : Improved : Caption will be painted in gray when control is disabled
  // v1.1.0.4 : Improved : Caption rectangle calculation
  // v1.1.0.5 : Fixed : Issue with border drawing when caption is empty
  // v1.1.0.6 : Improved : Handling of AdvGroupBox within AdvGroupBox
  // v1.1.1.0 : New : Checkbox action caControlsDisable added
  // v1.1.2.0 : Improved : Appearance matches Windows control class GROUPBOX better
  // v1.1.3.0 : New : Property DisabledFontColor added
  // v1.1.3.1 : Fixed : Issue with BorderColor & Ctl3D on Windows 7
  // v1.1.4.0 : New : Exposed OnMouseEnter, OnMouseLeave events
  // v1.1.4.1 : Fixed : Issue with BorderStyle = bsDouble


type
  TAdvCustomGroupBox = class;

  TCaptionPosition = (cpTopLeft, cpTopRight, cpTopCenter, cpBottomLeft, cpBottomRight, cpBottomCenter);
  TAdvBorderStyle = (bsAdvNone, bsAdvSingle, bsAdvDouble, bsAdvDualColors);
  TCheckBoxPos = (cpLeft, cpRight);
  TCheckBoxAction = (caNone, caDisable, caCheckAll);

  TWinCtrl = class(TWinControl)
  public
    procedure PaintCtrls(DC: HDC; First: TControl);
  end;

  TGroupBoxCheck = class(TPersistent)
  private
    FHint: String;
    FState: TCheckBoxState;
    FThemed: Boolean;
    FAllowGrayed: Boolean;
    FOnChange: TNotifyEvent;
    FAction: TCheckBoxAction;
    FPosition: TCheckBoxPos;
    FVisible: Boolean;
    FHot: Boolean;
    FDown: Boolean;
    FGroupBox: TAdvCustomGroupBox;
    FCustomIconsDirectory: String; // added by Ciro Alfredo Consentino (August 16, 2019)
    FCustomIconsEnabled: Boolean;  // added by Ciro Alfredo Consentino (August 16, 2019)
    icoCheckBox_Checked,
    icoCheckBox_Checked_Down,
    icoCheckBox_Checked_Hot,
    icoCheckBox_Checked_Disabled,
    icoCheckBox_Grayed,
    icoCheckBox_Grayed_Down,
    icoCheckBox_Grayed_Hot,
    icoCheckBox_Grayed_Disabled,
    icoCheckBox_Unchecked,
    icoCheckBox_Unchecked_Down,
    icoCheckBox_Unchecked_Hot,
    icoCheckBox_Unchecked_Disabled: TIcon; // added by Ciro Alfredo Consentino (August 17, 2019)
    procedure SetAction(const Value: TCheckBoxAction);
    procedure SetAllowGrayed(const Value: Boolean);
    procedure SetChecked(const Value: Boolean);
    procedure SetPosition(const Value: TCheckBoxPos);
    procedure SetState(const Value: TCheckBoxState);
    procedure SetThemed(const Value: Boolean);
    procedure SetVisible(const Value: Boolean);
    procedure SetDown(const Value: Boolean);
    procedure SetHot(const Value: Boolean);
    function GetChecked: Boolean;
    procedure SetHint(const Value: string);
    procedure SetCustomIconsDirectory(Value: String); // added by Ciro Alfredo Consentino (August 16, 2019)
    procedure SetCustomIconsEnabled(Value: Boolean);  // added by Ciro Alfredo Consentino (August 16, 2019)
    procedure LoadCustomIcons; // added by Ciro Alfredo Consentino (August 17, 2019)
  protected
    procedure Changed;
    property OnChange: TNotifyEvent read FOnChange write FOnChange;
    property Down: Boolean read FDown write SetDown default False;
    property Hot: Boolean read FHot write SetHot default False;
    property GroupBox: TAdvCustomGroupBox read FGroupBox;
  public
    constructor Create(AOwner: TAdvCustomGroupBox);
    destructor  Destroy; override;
    procedure Assign(Source: TPersistent); override;
  published
    property Checked: Boolean read GetChecked write SetChecked default False;
    property Position: TCheckBoxPos read FPosition write SetPosition default cpLeft; //(left or right from caption)
    property Action: TCheckBoxAction read FAction write SetAction default caDisable;
    property Hint: string read FHint write SetHint;
    property AllowGrayed: Boolean read FAllowGrayed write SetAllowGrayed default False;
    property State: TCheckBoxState read FState write SetState default cbUnchecked;
    property Themed: Boolean read FThemed write SetThemed default True;
    property Visible: Boolean read FVisible write SetVisible default False;
    property CustomIconsDirectory: String read FCustomIconsDirectory write SetCustomIconsDirectory; // added by Ciro Alfredo Consentino (August 16, 2019)
    property CustomIconsEnabled: Boolean read FCustomIconsEnabled write SetCustomIconsEnabled;      // added by Ciro Alfredo Consentino (August 16, 2019)
  end;

  TAdvCustomGroupBox = class(TCustomGroupBox)
  private
    FTransparent: Boolean;
    FBorderColor: TColor;
    FBorderInnerColor: TColor; // added by Ciro Alfredo Consentino (May 19, 2018)
    FImageIndex: Integer;
    FImages: TCustomImageList;
    FBorderStyle: TAdvBorderStyle;
    FCaptionPosition: TCaptionPosition;
    FRoundEdges: Boolean;
    FShadowEnabled: Boolean;
    FShadowColor: TColor;
    FCheckBox: TGroupBoxCheck;
    FOnCheckBoxClick: TNotifyEvent;
    FDisabledFontColor: TColor; // added by Ciro Alfredo Consentino (July 12, 2019)
    FDisabledFontShadowColor: TColor; // added by Ciro Alfredo Consentino (July 12, 2019)
    FParentBk: TBitmap; // added by Ciro Alfredo Consentino (August 24, 2019)
    FOnMouseLeave: TNotifyEvent;
    FOnMouseEnter: TNotifyEvent;
    procedure CMEnabledChanged(var Message: TMessage); message CM_ENABLEDCHANGED;
    procedure CMMouseLeave(var Message: TMessage); message CM_MOUSELEAVE;
    procedure CMMouseEnter(var Message: TMessage); message CM_MOUSEENTER;
    procedure CMHintShow(var Msg: TMessage); message CM_HINTSHOW;
    procedure SetTransparent(const Value: Boolean);
    procedure SetBorderColor(const Value: TColor);
    procedure SetBorderInnerColor(const Value: TColor); // added by Ciro Alfredo Consentino (May 19, 2018)
    procedure SetImageIndex(const Value: Integer);
    procedure SetImages(const Value: TCustomImageList);
    procedure SetBorderStyle(const Value: TAdvBorderStyle);
    procedure SetCaptionPosition(const Value: TCaptionPosition);
    procedure SetRoundEdges(const Value: Boolean);
    procedure SetShadowEnabled(const Value: Boolean);
    procedure SetShadowColor(const Value: TColor);
    procedure SetCheckBox(const Value: TGroupBoxCheck);
    procedure OnCheckBoxChanged(Sender: TObject);
  protected
    procedure CreateWnd; override;
    procedure Loaded; override;
    procedure Paint; override;
    procedure PaintTransparency; virtual;
    procedure DrawParentImage(Control: TControl; Dest: TCanvas);
    procedure DrawCheck(ACanvas: TCanvas);
    procedure Notification(AComponent: TComponent; AOperation: TOperation); override;
    procedure AdjustClientRect(var Rect: TRect); override;
    procedure MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Integer); override;
    procedure MouseUp(Button: TMouseButton; Shift: TShiftState; X, Y: Integer); override;
    procedure MouseMove(Shift: TShiftState;X, Y: Integer); override;
    function  GetCaptionHeight: Integer;
    function  GetCaptionRect: TRect;
    function  GetBorderWidth: Integer;
    function  HasCaption: Boolean;
    function  GetBorderRect: TRect;
    function  CalculateRect(var CheckBoxR, ImgTextR: TRect): TRect;
    function  GetCheckBoxRect: TRect;
    procedure ToggleCheck;
    function  PtOnCaption(P: TPoint): Boolean;
    procedure PerformCheckBoxAction; virtual;
    procedure DoGroupCheckClick; virtual;
    property CaptionPosition: TCaptionPosition read FCaptionPosition write SetCaptionPosition default cpTopLeft;
    property BorderStyle: TAdvBorderStyle read FBorderStyle write SetBorderStyle default bsAdvSingle;
    property Transparent: Boolean read FTransparent write SetTransparent default true;
    property BorderColor: TColor read FBorderColor write SetBorderColor default clSilver;
    property BorderInnerColor: TColor read FBorderInnerColor write SetBorderInnerColor default clSilver; // added by Ciro Alfredo Consentino (May 19, 2018)
    property Images: TCustomImageList read FImages write SetImages;
    property ImageIndex: Integer read FImageIndex write SetImageIndex default -1;
    property RoundEdges: Boolean read FRoundEdges write SetRoundEdges default False;
    property ShadowEnabled: Boolean read FShadowEnabled write SetShadowEnabled default False;
    property ShadowColor: TColor read FShadowColor write SetShadowColor default clGray;
    property CheckBox: TGroupBoxCheck read FCheckBox write SetCheckBox;
    property OnCheckBoxClick: TNotifyEvent read FOnCheckBoxClick write FOnCheckBoxClick;
    property DisabledFontColor: TColor read FDisabledFontColor write FDisabledFontColor default clGray; // added by Ciro Alfredo Consentino (July 12, 2019)
    property DisabledFontShadowColor: TColor read FDisabledFontShadowColor write FDisabledFontShadowColor default clWhite; // added by Ciro Alfredo Consentino (July 12, 2019)
    property OnMouseEnter: TNotifyEvent read FOnMouseEnter write FOnMouseEnter;
    property OnMouseLeave: TNotifyEvent read FOnMouseLeave write FOnMouseLeave;
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
  end;

  //{$IFDEF DELPHIXE2_LVL}
  //[ComponentPlatformsAttribute(pidWin32 or pidWin64)]
  //{$ENDIF}
  TAdvGroupBoxEx = class(TAdvCustomGroupBox)
  published
    property BorderColor;
    property BorderInnerColor; // added by Ciro Alfredo Consentino (May 19, 2018)
    property BorderStyle;
    property CaptionPosition;
    property CheckBox;
    property Images;
    property ImageIndex;
    property Transparent;
    property RoundEdges;
    property ShadowEnabled;
    property ShadowColor;

    property DisabledFontColor;       // added by Ciro Alfredo Consentino (July 12, 2019)
    property DisabledFontShadowColor; // added by Ciro Alfredo Consentino (July 12, 2019)

    property Align;
    property Anchors;
    property BiDiMode;
    property Caption;
    property Color;
    property Constraints;
    property Ctl3D default False;
    property DockSite;
    property DragCursor;
    property DragKind;
    property DragMode;
    property Enabled;
    property Font;
    property ParentBackground default True;
    property ParentBiDiMode;
    property ParentColor;
    property ParentCtl3D default False;
    property ParentFont;
    property ParentShowHint;
    property PopupMenu;
    property ShowHint;
    property TabOrder;
    property TabStop;
    property Visible;
    property OnClick;
    property OnContextPopup;
    property OnDblClick;
    property OnDragDrop;
    property OnDockDrop;
    property OnDockOver;
    property OnDragOver;
    property OnEndDock;
    property OnEndDrag;
    property OnEnter;
    property OnExit;
    property OnGetSiteInfo;
    property OnMouseDown;
    property OnMouseMove;
    property OnMouseUp;
    //{$IFDEF DELPHI2007_LVL}
    property OnMouseEnter;
    property OnMouseLeave;
    //{$ENDIF}
    property OnStartDock;
    property OnStartDrag;
    property OnUnDock;
    property OnCheckBoxClick;
  end;

implementation

uses
  Math, AOBXPVS, Types;

function IsWin8: Boolean;
var
  VerInfo: TOSVersionInfo;
begin
  VerInfo.dwOSVersionInfoSize := SizeOf(TOSVersionInfo);
  GetVersionEx(verinfo);
  Result := (verinfo.dwMajorVersion > 6) or
            ((verinfo.dwMajorVersion = 6) and (verinfo.dwMinorVersion >= 2));
end;

{TWinCtrl}

procedure TWinCtrl.PaintCtrls(DC: HDC; First: TControl);
begin
  PaintControls(DC, First);
end;

function GetFileVersion(filename: String): Integer;
const
  MAX_TEXTSIZE = 1024;
var
  fileHandle: DWORD;
  l: Integer;
  pvs: PVSFixedFileInfo;
  lptr: UInt;
  querybuf: array[0..MAX_TEXTSIZE - 1] of Char;
  buf: PChar;
begin
  Result := -1;
  StrpCopy(querybuf, filename);
  l := GetFileVersionInfoSize(querybuf, fileHandle);
  if (l > 0) then
  begin
    GetMem(buf, l);
    GetFileVersionInfo(querybuf, fileHandle, l, buf);
    if VerQueryValue(buf, '\', Pointer(pvs), lptr) then
    begin
      if (pvs^.dwSignature = $FEEF04BD) then
      begin
        Result := pvs^.dwFileVersionMS;
      end;
    end;
    FreeMem(buf);
  end;
end;

function IsThemedApp: Boolean;
var
  i: Integer;
begin
  // app is linked with COMCTL32 v6 or higher -> xp themes enabled
  i := GetFileVersion('COMCTL32.DLL');
  i := (i shr 16) and $FF;
  Result := (i > 5);
end;

function IsVista: Boolean;
var
  hKernel32: HMODULE;
begin
  hKernel32 := GetModuleHandle('kernel32');
  if (hKernel32 > 0) then
  begin
    Result := GetProcAddress(hKernel32, 'GetLocaleInfoEx') <> nil;
  end
  else
    Result := False;
end;

{ TAdvCustomGroupBox }

constructor TAdvCustomGroupBox.Create(AOwner: TComponent);
begin
  inherited;
  ControlStyle := ControlStyle - [csOpaque];
  FCheckBox := TGroupBoxCheck.Create(Self);
  FCheckBox.OnChange := OnCheckBoxChanged;
  FTransparent := True;
  FImages := nil;
  FImageIndex := -1;
  FBorderStyle := bsAdvSingle;
  FCaptionPosition := cpTopLeft;
  FRoundEdges := False;
  FShadowEnabled := False;
  FShadowColor := clGray;
  Ctl3D := False;
  ParentCtl3D := False;
  FBorderColor := clSilver;
  FBorderInnerColor := clSilver;       // added by Ciro Alfredo Consentino (May 19, 2018)
  FDisabledFontColor := clGray;        // added by Ciro Alfredo Consentino (July 12, 2019)
  FDisabledFontShadowColor := clWhite; // added by Ciro Alfredo Consentino (July 12, 2019)

  FParentBk := TBitmap.Create;         // added by Ciro Alfredo Consentino (August 2019)
end;

procedure TAdvCustomGroupBox.CreateWnd;
begin
  inherited;
  if not (csDesigning in ComponentState) and CheckBox.Visible and (CheckBox.Action <> caNone) then
     PerformCheckBoxAction;
end;

destructor TAdvCustomGroupBox.Destroy;
begin
  FCheckBox.Free;
  FParentBk.Free;
  inherited;
end;

procedure TAdvCustomGroupBox.DoGroupCheckClick;
begin
  if Assigned(OnCheckBoxClick) then
     OnCheckBoxClick(Self);
end;

procedure TAdvCustomGroupBox.Loaded;
begin
  inherited;
  if not (csDesigning in ComponentState) and CheckBox.Visible and (CheckBox.Action <> caNone) then
     PerformCheckBoxAction;
end;

procedure TAdvCustomGroupBox.MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;

  if (csDesigning in ComponentState) then
    Exit;

  if Enabled and CheckBox.Visible then
  begin
//    if MouseCapture then
    begin
      CheckBox.Down := PtOnCaption(Point(X, Y));
      MouseCapture := CheckBox.Down;
    end;
  end;
end;

procedure TAdvCustomGroupBox.MouseMove(Shift: TShiftState; X, Y: Integer);
begin
  inherited;

  if (csDesigning in ComponentState) then
    Exit;

  if Enabled and CheckBox.Visible then
  begin
    CheckBox.Hot := PtOnCaption(Point(X, Y));
    if MouseCapture then
    begin
      CheckBox.Down := CheckBox.Hot;
    end;
  end;
end;

procedure TAdvCustomGroupBox.MouseUp(Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;

  if (csDesigning in ComponentState) then
     Exit;

  if Enabled and CheckBox.Visible then
  begin
    if CheckBox.Down then
    begin
      MouseCapture := False;
      CheckBox.Down := False;
      if PtOnCaption(Point(X, Y)) then
         ToggleCheck;
    end;
  end;
end;

procedure TAdvCustomGroupBox.CMEnabledChanged(var Message: TMessage);
begin
  inherited;
  Invalidate;

  { // should this code be enabled ? (it is in latest TMS component version)
  if (CheckBox.Action = caDisable) then
  begin
    CheckBox.Checked := Enabled;

    for I := 0 to ControlCount - 1 do
    begin
      if (CheckBox.Action = caDisable) then
      begin
        Controls[I].Enabled := Enabled;
      end
    end;
  end;}
end;

procedure TAdvCustomGroupBox.CMHintShow(var Msg: TMessage);
var
  hi: PHintInfo;
  r: TRect;
begin
  hi := PHintInfo(Msg.LParam);

  r := GetCheckBoxRect;

  if PtInRect(r, hi^.CursorPos) then
  begin
    if CheckBox.Hint <> '' then
       hi^.HintStr := CheckBox.Hint;
  end;

  inherited;
end;

procedure TAdvCustomGroupBox.CMMouseEnter(var Message: TMessage);
begin
  inherited;
  if Assigned(FOnMouseEnter) then
     FOnMouseEnter(Self);
end;

procedure TAdvCustomGroupBox.CMMouseLeave(var Message: TMessage);
begin
  inherited;

  if Enabled and CheckBox.Visible then
  begin
    CheckBox.Hot := False;
    CheckBox.Down := False;
  end;
  if Assigned(FOnMouseLeave) then
     FOnMouseLeave(Self);
end;

procedure TAdvCustomGroupBox.Notification(AComponent: TComponent;
  AOperation: TOperation);
begin
  inherited;
  if not (csDestroying in ComponentState) and (AOperation = opRemove) then
  begin
    if AComponent = Images then
       Images := nil;
  end;
end;

procedure TAdvCustomGroupBox.AdjustClientRect(var Rect: TRect);
var
  R: TRect;
begin
  R := Rect;
  inherited  AdjustClientRect(Rect);
  Rect := R;
  if CaptionPosition in [cpTopLeft, cpTopCenter, cpTopRight] then
  begin
    Inc(Rect.Top, Max(GetBorderWidth,GetCaptionHeight));
    Rect := Classes.Rect(Rect.Left + GetBorderWidth, Rect.Top, Rect.Right -GetBorderWidth, Rect.Bottom-GetBorderWidth);
  end
  else if CaptionPosition in [cpBottomLeft, cpBottomCenter, cpBottomRight] then
  begin
    Dec(Rect.Bottom, Max(GetBorderWidth,GetCaptionHeight));
    Rect := Classes.Rect(Rect.Left + GetBorderWidth, Rect.Top + GetBorderWidth, Rect.Right -GetBorderWidth, Rect.Bottom);
  end;

  InflateRect(Rect, -1, -1);
end;

procedure TAdvCustomGroupBox.DrawCheck(ACanvas: TCanvas);
var
  bmp: TBitmap;
  HTheme: THandle;
  r: TRect;
  DrawThemed: Boolean;
  IsDesignTime: Boolean;
  //icoHeight: Integer;
  DrawCustom, LoadedCustom: Boolean;
  ico: TIcon;
  //iSize: TSize;
  //Err: HResult;
  resStr: String;
  ThemedStateID: Integer;

  function AssignIconCustom(icoVar: TIcon): Boolean;
  begin
    Result:= icoVar <> nil;
    if Result then
       ico.Assign(icoVar);
  end;

begin
  if not CheckBox.Visible then
    Exit;

  if ((csReading in Owner.ComponentState) or (csLoading in Owner.ComponentState)) then
     Exit;

  DrawThemed := IsVista and CheckBox.Themed and IsThemeActive and IsThemedApp;

  IsDesignTime:= csDesigning in ComponentState;

  DrawCustom := CheckBox.CustomIconsEnabled and (CheckBox.CustomIconsDirectory <> '') and (not IsDesignTime);
  LoadedCustom := False;

  r := GetCheckBoxRect;

  //FParentBk.SaveToFile('d:\testbitmap.bmp'); // for debug only, do not enable (August 24, 2019)
  BitBlt(ACanvas.Handle, r.Left, r.Top, (r.Right-r.Left), (r.Bottom-r.Top), FParentBk.Canvas.Handle, r.Left, r.Top, SRCCOPY); // draw parent image into canvas

  if DrawCustom then
  begin
    //ExtraBW := 4;
    //icoHeight:= 13;
    ico := TIcon.Create;
    ico.Transparent:= True;
    try
      case CheckBox.State of
      cbChecked:
        begin
          if not Enabled then
             AssignIconCustom(CheckBox.icoCheckBox_Checked_Disabled)
          else
          if CheckBox.Down then
             AssignIconCustom(CheckBox.icoCheckBox_Checked_Down)
          else
          if CheckBox.Hot then
             AssignIconCustom(CheckBox.icoCheckBox_Checked_Hot)
          else
             AssignIconCustom(CheckBox.icoCheckBox_Checked);
        end;
      cbUnchecked:
        begin
          if not Enabled then
             AssignIconCustom(CheckBox.icoCheckBox_Unchecked_Disabled)
          else
          if CheckBox.Down then
             AssignIconCustom(CheckBox.icoCheckBox_Unchecked_Down)
          else
          if CheckBox.Hot then
             AssignIconCustom(CheckBox.icoCheckBox_Unchecked_Hot)
          else
             AssignIconCustom(CheckBox.icoCheckBox_Unchecked);
        end;
      cbGrayed:
        begin
          if not Enabled then
             AssignIconCustom(CheckBox.icoCheckBox_Grayed_Disabled)
          else
          if CheckBox.Down then
             AssignIconCustom(CheckBox.icoCheckBox_Grayed_Down)
          else
          if CheckBox.Hot then
             AssignIconCustom(CheckBox.icoCheckBox_Grayed_Hot)
          else
             AssignIconCustom(CheckBox.icoCheckBox_Grayed);
        end;
      end;

      LoadedCustom := not ico.Empty;
      if LoadedCustom then
         ACanvas.Draw(r.Left+1, r.Top+1, ico); // +1 added by Ciro Alfredo Consentino, to align with themed painted checkbox in run time (August 05, 2019)
    finally
      ico.Free;
    end;
    if LoadedCustom then
       Exit;
  end;
  
  if DrawThemed then
  begin
    HTheme := OpenThemeData(Self.Handle,'button');
    if HTheme <> 0 then
    begin
      //Err:= GetThemePartSize(HTheme, Self.Handle, BP_CHECKBOX, CBS_CHECKEDNORMAL, nil, TS_TRUE, iSize); // added by Ciro Alfredo Consentino (August 05, 2019)
      case CheckBox.State of
      cbChecked:
        begin
          if not Enabled then
             ThemedStateID:= CBS_CHECKEDDISABLED
          else
          if CheckBox.Down then
             ThemedStateID:= CBS_CHECKEDNORMAL or CBS_PUSHED
          else
          if CheckBox.Hot then
             ThemedStateID:= CBS_CHECKEDHOT or CBS_HOT
          else
             ThemedStateID:= CBS_CHECKEDNORMAL;
        end;
      cbUnChecked:
        begin
          if not Enabled then
             ThemedStateID:= CBS_UNCHECKEDDISABLED
          else
          if CheckBox.Down then
             ThemedStateID:= CBS_UNCHECKEDNORMAL or CBS_PUSHED
          else
          if CheckBox.Hot then
             ThemedStateID:= CBS_HOT
          else
             ThemedStateID:= CBS_UNCHECKEDNORMAL;
        end;
      cbGrayed:
        begin
          if not Enabled then
             ThemedStateID:= CBS_MIXEDDISABLED
          else
          if CheckBox.Down then
             ThemedStateID:= CBS_MIXEDPRESSED
          else
          if CheckBox.Hot then
             ThemedStateID:= CBS_MIXEDHOT or CBS_HOT
          else
             ThemedStateID:= CBS_MIXEDNORMAL;
         end;
      end;
      DrawThemeBackground(HTheme, ACanvas.Handle, BP_CHECKBOX, ThemedStateID, @r, nil);
      CloseThemeData(HTheme);
    end
    else
      DrawThemed := False;
  end;

  if not DrawThemed then
  begin
    bmp := TBitmap.Create;
    case CheckBox.State of
    cbChecked:
      begin
        if IsDesignTime then
           resStr:= 'GROUPBOX_CHECKED'
        else
        if CheckBox.Down then
           resStr:= 'GROUPBOX_CHECKED_DOWN'
        else
        if CheckBox.Hot then
           resStr:= 'GROUPBOX_CHECKED_HOT'
        else
           resStr:= 'GROUPBOX_CHECKED';
      end;
    cbUnchecked:
      begin
        if IsDesignTime then
           resStr:= 'GROUPBOX_UNCHECKED'
        else
        if CheckBox.Down then
           resStr:= 'GROUPBOX_UNCHECKED_DOWN'
        else
        if CheckBox.Hot then
           resStr:= 'GROUPBOX_UNCHECKED_HOT'
        else
           resStr:= 'GROUPBOX_UNCHECKED';
      end;
    cbGrayed:
      begin
        if IsDesignTime then
           resStr:= 'GROUPBOX_GRAYED'
        else
        if CheckBox.Down then
           resStr:= 'GROUPBOX_GRAYED_DOWN'
        else
        if CheckBox.Hot then
           resStr:= 'GROUPBOX_GRAYED_HOT'
        else
           resStr:= 'GROUPBOX_GRAYED';
      end;
    end;

    bmp.LoadFromResourceName(hInstance, resStr);
    bmp.TransparentColor:= clFuchsia; // added by Ciro Alfredo Consentino (July 30, 2019)
    bmp.Transparent:= True;
    bmp.TransparentMode:= tmFixed;// modified by Ciro Alfredo Consentino (July 30, 2019)

    ACanvas.Draw(r.Left+1, r.Top+1, bmp); // +1 added by Ciro Alfredo Consentino, to align with themed painted checkbox in run time (August 05, 2019)
    bmp.Free;
  end;
end;

procedure TAdvCustomGroupBox.DrawParentImage(Control: TControl; Dest: TCanvas);
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

procedure TAdvCustomGroupBox.PaintTransparency;
var
  i: Integer;
  P: TPoint;
begin
  i := SaveDC(Canvas.Handle);
  p := ClientOrigin;
  Windows.ScreenToClient(Parent.Handle, p);
  p.x := -p.x;
  p.y := -p.y;
  MoveWindowOrg(Canvas.Handle, p.x, p.y);

  SendMessage(Parent.Handle, WM_ERASEBKGND, Canvas.Handle, 0);
  // transparency ?
  SendMessage(Parent.Handle, WM_PAINT, Canvas.Handle, 0);

  if (Parent is TWinCtrl) then
     (Parent as TWinCtrl).PaintCtrls(Canvas.Handle, nil);

  RestoreDC(Canvas.Handle, i);
end;

procedure TAdvCustomGroupBox.Paint;
var
  R, CapR, FCR: TRect;
  i, rt: Integer;
  bmp, CanvasBMP: TBitmap;
  FontColor: TColor;
begin
  FCR := CalculateRect(R, CapR);
  R := ClientRect;
  CapR := GetCaptionRect;

  bmp := TBitmap.Create;
  bmp.Height := (FCR.Bottom - FCR.Top);
  bmp.Width := (FCR.Right - FCR.Left) + 2;
  i := CapR.Left;
  rt := 6;

  CanvasBMP := TBitmap.Create;
  CanvasBMP.Width := Self.Width;
  CanvasBMP.Height:= Self.Height;
  CanvasBMP.Canvas.Brush.Style:= bsClear;
  CanvasBMP.Canvas.Lock;

  FParentBk.Width := Self.Width;
  FParentBk.Height:= Self.Height;

  if Transparent then
     DrawParentImage(Self, CanvasBMP.Canvas);

  FParentBk.Canvas.CopyRect(FParentBk.Canvas.ClipRect, CanvasBMP.Canvas, Canvas.ClipRect);

  //PaintTransparency; // original code, no longer used, replaced by DrawParentImage()

  //--- Draw Check
  DrawCheck(CanvasBMP.Canvas);

  //--- Draw Image
  if Assigned(Images) and (ImageIndex >= 0) then
  begin
    Images.Draw(CanvasBMP.Canvas, CapR.Left, CapR.Top, ImageIndex, Enabled);
    i := CapR.Left + Images.Width + 3;
  end;

  //Canvas.Brush.Style := bsClear;
  //--- Draw Caption
  if (Caption <> '') then
  begin
    CanvasBMP.Canvas.Font.Assign(Self.Font);
    R := Rect(i, CapR.Top, CapR.Right, CapR.Bottom);

    if FShadowEnabled then
    begin
      if not Enabled then
         begin
           FontColor:= Self.DisabledFontColor;
           CanvasBMP.Canvas.Font.Color:= FDisabledFontShadowColor
         end
      else
         begin
           FontColor:= Self.Font.Color;
           CanvasBMP.Canvas.Font.Color := FShadowColor;
         end;
      OffsetRect(R, 1, 1);
      DrawText(CanvasBMP.Canvas.Handle, PChar(Caption), Length(Caption), R, DT_SINGLELINE or DT_LEFT or DT_VCENTER);
      CanvasBMP.Canvas.Font.Color := FontColor;
      OffsetRect(R, -1, -1);
    end;
    DrawText(CanvasBMP.Canvas.Handle, PChar(Caption),Length(Caption), R, DT_SINGLELINE or DT_LEFT or DT_VCENTER);
  end;

  bmp.Canvas.CopyRect(Rect(0, 0, bmp.Width, bmp.Height), CanvasBMP.Canvas, Rect(FCR.Left-1, FCR.Top, FCR.Right+1, FCR.Bottom));

  R := GetBorderRect;
  //--- Draw Borders
  case BorderStyle of
    bsAdvSingle:
    begin
      CanvasBMP.Canvas.Brush.Style := bsClear;
      CanvasBMP.Canvas.Pen.Color := BorderColor;
      if FRoundEdges then
         CanvasBMP.Canvas.RoundRect(R.Left, R.Top, R.Right, R.Bottom, rt, rt)
      else
         CanvasBMP.Canvas.Rectangle(R);
    end;
    bsAdvDouble:
    begin
      if Ctl3D then
      begin
        CanvasBMP.Canvas.Brush.Style := bsClear;
        CanvasBMP.Canvas.Pen.Color := clWhite;
        R.Left := R.Left + 1;
        R.Top := R.Top + 1;
        if FRoundEdges then
           CanvasBMP.Canvas.RoundRect(R.Left, R.Top, R.Right, R.Bottom, rt, rt)
        else
           CanvasBMP.Canvas.Rectangle(R);
        CanvasBMP.Canvas.Pen.Color := clGray;
        R.Bottom := R.Bottom -1;
        R.Right := R.Right - 1;
        R.Left := R.Left - 1;
        R.Top := R.Top - 1;
        if FRoundEdges then
           CanvasBMP.Canvas.RoundRect(R.Left, R.Top, R.Right, R.Bottom, rt, rt)
        else
           CanvasBMP.Canvas.Rectangle(R);

        R.Bottom := R.Bottom +1;
        R.Right := R.Right + 1;

        R := Rect(R.Left+2, R.Top+2, R.Right-2, R.Bottom-2);

        CanvasBMP.Canvas.Pen.Color := clWhite;
        R.Left := R.Left + 1;
        R.Top := R.Top + 1;
        if FRoundEdges then
           CanvasBMP.Canvas.RoundRect(R.Left, R.Top, R.Right, R.Bottom, rt, rt)
        else
           CanvasBMP.Canvas.Rectangle(R);
        CanvasBMP.Canvas.Pen.Color := clGray;
        R.Bottom := R.Bottom -1;
        R.Right := R.Right - 1;
        R.Left := R.Left - 1;
        R.Top := R.Top - 1;
        if FRoundEdges then
           CanvasBMP.Canvas.RoundRect(R.Left, R.Top, R.Right, R.Bottom, rt, rt)
        else
           CanvasBMP.Canvas.Rectangle(R);
      end
      else
      begin
        CanvasBMP.Canvas.Brush.Style := bsClear;
        CanvasBMP.Canvas.Pen.Color := BorderColor;
        if FRoundEdges then
           CanvasBMP.Canvas.RoundRect(R.Left, R.Top, R.Right, R.Bottom, rt, rt)
        else
           CanvasBMP.Canvas.Rectangle(R);
        R := Rect(R.Left+2, R.Top+2, R.Right-2, R.Bottom-2);
        if FRoundEdges then
           CanvasBMP.Canvas.RoundRect(R.Left, R.Top, R.Right, R.Bottom, rt, rt)
        else
           CanvasBMP.Canvas.Rectangle(R);
      end;
    end;
    bsAdvDualColors:
    begin
      CanvasBMP.Canvas.Brush.Style := bsClear;
      CanvasBMP.Canvas.Pen.Color := BorderInnerColor;
      R := Rect(R.Left+1, R.Top+1, R.Right-1, R.Bottom-1);
      CanvasBMP.Canvas.Rectangle(R);
      if FRoundEdges then
      begin
        CanvasBMP.Canvas.Pixels[R.Left+1, R.Top+1]:=     BorderInnerColor;
        CanvasBMP.Canvas.Pixels[R.Left+1, R.Bottom-2]:=  BorderInnerColor;
        CanvasBMP.Canvas.Pixels[R.Right-2, R.Top+1]:=    BorderInnerColor;
        CanvasBMP.Canvas.Pixels[R.Right-2, R.Bottom-2]:= BorderInnerColor;
      end;

      CanvasBMP.Canvas.Pen.Color := BorderColor;
      R := Rect(R.Left-1, R.Top-1, R.Right+1, R.Bottom+1);
      if FRoundEdges then
         CanvasBMP.Canvas.RoundRect(R.Left, R.Top, R.Right, R.Bottom, rt, rt)
      else
         CanvasBMP.Canvas.Rectangle(R);
    end;
  end;

  if HasCaption then // copy text canvas to remove the frame line below the text
     CanvasBMP.Canvas.CopyRect(Rect(FCR.Left-1, FCR.Top, FCR.Right+1, FCR.Bottom), bmp.Canvas, Rect(0, 0, bmp.Width, bmp.Height));

  bmp.Free;

  CanvasBMP.Canvas.Unlock;
  Canvas.Draw(0, 0, CanvasBMP);
  CanvasBMP.Free;
end;

procedure TAdvCustomGroupBox.SetBorderColor(const Value: TColor);
begin
  if FBorderColor <> Value then
  begin
    FBorderColor := Value;
    Invalidate;
  end;
end;

procedure TAdvCustomGroupBox.SetBorderInnerColor(const Value: TColor);
begin
  if FBorderInnerColor <> Value then
  begin
    FBorderInnerColor := Value;
    Invalidate;
  end;
end;

procedure TAdvCustomGroupBox.SetImageIndex(const Value: Integer);
begin
  if FImageIndex <> Value then
  begin
    FImageIndex := Value;
    Invalidate;
    Realign;
  end;
end;

procedure TAdvCustomGroupBox.SetImages(const Value: TCustomImageList);
begin
  if FImages <> Value then
  begin
    FImages := Value;
    if not Assigned(FImages) then
    begin
      ImageIndex := -1;
    end;
    Invalidate;
    Realign;
  end;
end;

procedure TAdvCustomGroupBox.SetTransparent(const Value: Boolean);
begin
  if FTransparent <> Value then
  begin
    FTransparent := Value;
    RecreateWnd; // must redraw the entire control to fix child controls drawing; added by Ciro Alfredo Consentino (July 01, 2019)
  end;
end;

function TAdvCustomGroupBox.HasCaption: Boolean;
begin
  Result:= (Caption <> '') or CheckBox.Visible or ((ImageIndex >= 0) and Assigned(Images));
end;

function TAdvCustomGroupBox.GetCaptionHeight: Integer;
var
  R, R1, R2: TRect;
begin
  R := CalculateRect(R1, R2); //GetCaptionRect;
  Result := Max(GetBorderWidth, R.Bottom - R.Top);
end;

function TAdvCustomGroupBox.GetBorderWidth: Integer;
begin
  Result := 0;
  case BorderStyle of
    bsAdvNone: Result := 1;
    bsAdvSingle:
    begin
      Result := 1;
      if Ctl3D then
         Result := Result + 1;
    end;
    bsAdvDouble, bsAdvDualColors:
    begin
      Result := 2;
      if Ctl3D then
         Result := Result + 2;
    end;
  end;
end;

function TAdvCustomGroupBox.GetBorderRect: TRect;
begin
  Result := ClientRect;
  if HasCaption and (CaptionPosition in [cpTopLeft, cpTopCenter, cpTopRight]) then
  begin
    Result.Top := Result.Top + (GetCaptionHeight div 2);
  end
  else
  if CaptionPosition in [cpBottomLeft, cpBottomCenter, cpBottomRight] then
  begin
    if HasCaption then
    begin
      Result.Bottom := Result.Bottom - (GetCaptionHeight div 2);
      if (BorderStyle in [bsAdvDouble, bsAdvDualColors]) then
         Result.Bottom := Result.Bottom + 1;
    end;  
  end;
end;

function TAdvCustomGroupBox.GetCaptionRect: TRect;
var
  R: TRect;
begin
  Result := Rect(0, 0, 0, 0);
  CalculateRect(R, Result);
end;

function TAdvCustomGroupBox.CalculateRect(var CheckBoxR, ImgTextR: TRect): TRect;
var
  ImgH, ImgW, CapH, CapW, sp, st, w, h, cksz, cksp: Integer;
  R: TRect;
begin
  Result := Rect(0, 0, 0, 0);
  CheckBoxR := Rect(-1, -1, -1, -1);
  ImgTextR := Result;

  ImgH := 0;
  ImgW := 0;
  CapH := 0;
  CapW := 0;
  st := 7; // -1 to match Delphi's themed VCL checkbox
  sp := 0;
  cksz := 0;
  cksp := 0;
  if Caption <> '' then
  begin
    Canvas.Font.Assign(Self.Font);
    R := Rect(0, 0, 1000, 100);
    DrawText(Canvas.Handle, PChar(Caption), Length(Caption), R, DT_CALCRECT or DT_LEFT or DT_SINGLELINE);
    CapH := R.Bottom - R.Top;
    CapW := R.Right - R.Left;
  end;

  if Assigned(Images) and (ImageIndex >= 0) then
  begin
    ImgH := Images.Height;
    ImgW := Images.Width;
  end;

  if (CapW > 0) and (ImgW > 0) then
  begin
    sp := 3;
  end;

  if CheckBox.Visible then
  begin
    //if CheckBox.Themed then // modified by Ciro Alfredo Consentino (August 05, 2019)
    cksz := 16;
    //else
    //  cksz := 14;
    if (CapW > 0) or (ImgW > 0) then
       cksp := 3;
  end;

  w := cksz + cksp + ImgW + sp + CapW;
  h := Max(cksz, Max(ImgH, CapH)) + 2;
  case CaptionPosition of
    cpTopLeft:
    begin
      Result.Left   := st;
      Result.Right  := Result.Left + w;
      Result.Bottom := Result.Top + h;
    end;
    cpTopRight:
    begin
      Result.Right  := Width - st;
      Result.Left   := Result.Right - w;
      Result.Bottom := Result.Top + h;
    end;
    cpTopCenter:
    begin
      Result.Left   := (Width - w) div 2;
      Result.Right  := Result.Left + w;
      Result.Bottom := Result.Top + h;
    end;
    cpBottomLeft:
    begin
      Result.Left   := st;
      Result.Right  := Result.Left + w;
      Result.Top    := Height - h;
      Result.Bottom := Result.Top + h;
    end;
    cpBottomRight:
    begin
      Result.Right  := Width - st;
      Result.Left   := Result.Right - w;
      Result.Top    := Height - h;
      Result.Bottom := Result.Top + h;
    end;
    cpBottomCenter:
    begin
      Result.Left   := (Width - w) div 2;
      Result.Right  := Result.Left + w;
      Result.Top    := Height - h;
      Result.Bottom := Result.Top + h;
    end;
  end;

  ImgTextR := Result;
  if CheckBox.Visible then
  begin
    if CheckBox.Position = cpLeft then
    begin
      CheckBoxR := Rect(Result.Left, Result.Top + ((h - cksz) div 2), Result.Left + cksz, Result.Top + ((h - cksz) div 2) + cksz);
      ImgTextR.Left := CheckBoxR.Right + cksp;
    end
    else //if (CheckBox.Position = cpRight) then
    begin
      CheckBoxR := Rect(Result.Right - cksz, Result.Top + ((h - cksz) div 2), Result.Right, Result.Top + ((h - cksz) div 2) + cksz);
      ImgTextR.Right := CheckBoxR.Left - cksp;
    end;
  end;
end;

procedure TAdvCustomGroupBox.ToggleCheck;
begin
  if CheckBox.AllowGrayed then
  begin
    case CheckBox.State of
      cbUnchecked: CheckBox.State := cbGrayed;
      cbChecked:   CheckBox.State := cbUnchecked;
      cbGrayed:    CheckBox.State := cbChecked;
    end;
  end
  else
    CheckBox.Checked := not CheckBox.Checked;
end;

procedure TAdvCustomGroupBox.PerformCheckBoxAction;
var
  i: Integer;
begin
  if not (csDesigning in ComponentState) and Enabled and CheckBox.Visible and
         (CheckBox.State in [cbChecked, cbUnChecked]) and (CheckBox.Action <> caNone) then
  begin
    for I := 0 to ControlCount - 1 do
    begin
      if CheckBox.Action = caDisable then
      begin
        Controls[I].Enabled := (CheckBox.State = cbChecked);
      end
      else
      if CheckBox.Action = caCheckAll then
      begin
        if (Controls[I] is TCheckBox) then
        begin
          TCheckBox(Controls[I]).Checked := (CheckBox.State = cbChecked);
        end
        else
        if (Controls[I] is TWinControl) and SameText(Controls[I].ClassName, 'TAdvOfficeCheckBoxEx') then
        begin
          SendMessage(TWinControl(Controls[I]).Handle, BM_SETCHECK, Integer(CheckBox.State), 0);
        end;
      end;
    end;
  end;
end;

function TAdvCustomGroupBox.PtOnCaption(P: TPoint): Boolean;
var
  R, R1, R2: TRect;
begin
  R := CalculateRect(R1, R2);
  Result := PtInRect(R, p);
end;

function TAdvCustomGroupBox.GetCheckBoxRect: TRect;
var
  R: TRect;
begin
  Result := Rect(-1, -1, -1, -1);
  CalculateRect(Result, R);
end;

procedure TAdvCustomGroupBox.SetCheckBox(const Value: TGroupBoxCheck);
begin
  FCheckBox.Assign(Value);
end;

procedure TAdvCustomGroupBox.OnCheckBoxChanged(Sender: TObject);
begin
  Invalidate;
end;

procedure TAdvCustomGroupBox.SetBorderStyle(const Value: TAdvBorderStyle);
begin
  if FBorderStyle <> Value then
  begin
    FBorderStyle := Value;
    Invalidate;
    Realign;
  end;
end;

procedure TAdvCustomGroupBox.SetCaptionPosition(const Value: TCaptionPosition);
begin
  if FCaptionPosition <> Value then
  begin
    FCaptionPosition := Value;
    Invalidate;
    Realign;
  end;
end;

procedure TAdvCustomGroupBox.SetRoundEdges(const Value: Boolean);
begin
  if FRoundEdges <> Value then
  begin
    FRoundEdges := Value;
    Invalidate;
  end;
end;

procedure TAdvCustomGroupBox.SetShadowEnabled(const Value: Boolean);
begin
  if FShadowEnabled <> Value then
  begin
    FShadowEnabled := Value;
    Invalidate;
  end;
end;

procedure TAdvCustomGroupBox.SetShadowColor(const Value: TColor);
begin
  if FShadowColor <> Value then
  begin
    FShadowColor := Value;
    Invalidate;
  end;
end;

{ TGroupBoxCheck }

procedure TGroupBoxCheck.Assign(Source: TPersistent);
begin
  if Source is TGroupBoxCheck then
  begin
    FHint := (Source as TGroupBoxCheck).Hint;
    State := (Source as TGroupBoxCheck).State;
    FThemed := (Source as TGroupBoxCheck).Themed;

    FCustomIconsEnabled := (Source as TGroupBoxCheck).CustomIconsEnabled;     // added by Ciro Alfredo Consentino (August 16, 2019)
    FCustomIconsDirectory := (Source as TGroupBoxCheck).CustomIconsDirectory; // added by Ciro Alfredo Consentino (August 16, 2019)

    icoCheckBox_Checked := (Source as TGroupBoxCheck).icoCheckBox_Checked;
    icoCheckBox_Checked_Down := (Source as TGroupBoxCheck).icoCheckBox_Checked_Down;
    icoCheckBox_Checked_Hot := (Source as TGroupBoxCheck).icoCheckBox_Checked_Hot;
    icoCheckBox_Checked_Disabled := (Source as TGroupBoxCheck).icoCheckBox_Checked_Disabled;
    icoCheckBox_Grayed := (Source as TGroupBoxCheck).icoCheckBox_Grayed;
    icoCheckBox_Grayed_Down := (Source as TGroupBoxCheck).icoCheckBox_Grayed_Down;
    icoCheckBox_Grayed_Hot := (Source as TGroupBoxCheck).icoCheckBox_Grayed_Hot;
    icoCheckBox_Grayed_Disabled := (Source as TGroupBoxCheck).icoCheckBox_Grayed_Disabled;
    icoCheckBox_Unchecked := (Source as TGroupBoxCheck).icoCheckBox_Unchecked;
    icoCheckBox_Unchecked_Down := (Source as TGroupBoxCheck).icoCheckBox_Unchecked_Down;
    icoCheckBox_Unchecked_Hot := (Source as TGroupBoxCheck).icoCheckBox_Unchecked_Hot;
    icoCheckBox_Unchecked_Disabled := (Source as TGroupBoxCheck).icoCheckBox_Unchecked_Disabled;

    FAllowGrayed := (Source as TGroupBoxCheck).AllowGrayed;
    FAction := (Source as TGroupBoxCheck).Action;
    Checked := (Source as TGroupBoxCheck).Checked;
    Position := (Source as TGroupBoxCheck).Position;
  end
  else
    inherited;
end;

constructor TGroupBoxCheck.Create(AOwner: TAdvCustomGroupBox);
begin
  inherited Create;
  FGroupBox := AOwner;
  FHint := '';
  FState := cbUnChecked;
  FThemed := True;

  //FCustomIconsDirectory := '';
  FCustomIconsEnabled := False;

  FAllowGrayed := False;
  FAction := caDisable;
  FPosition := cpLeft;

  if not (csDesigning in AOwner.ComponentState) then
  begin
    icoCheckBox_Checked := TIcon.Create;
    icoCheckBox_Checked_Down := TIcon.Create;
    icoCheckBox_Checked_Hot := TIcon.Create;
    icoCheckBox_Checked_Disabled := TIcon.Create;
    icoCheckBox_Grayed := TIcon.Create;
    icoCheckBox_Grayed_Down := TIcon.Create;
    icoCheckBox_Grayed_Hot := TIcon.Create;
    icoCheckBox_Grayed_Disabled := TIcon.Create;
    icoCheckBox_Unchecked := TIcon.Create;
    icoCheckBox_Unchecked_Down := TIcon.Create;
    icoCheckBox_Unchecked_Hot := TIcon.Create;
    icoCheckBox_Unchecked_Disabled := TIcon.Create;
  end;
end;

destructor TGroupBoxCheck.Destroy;
begin
  if not (csDesigning in FGroupBox.ComponentState) then
  begin
    icoCheckBox_Checked.Free;
    icoCheckBox_Checked_Down.Free;
    icoCheckBox_Checked_Hot.Free;
    icoCheckBox_Checked_Disabled.Free;
    icoCheckBox_Grayed.Free;
    icoCheckBox_Grayed_Down.Free;
    icoCheckBox_Grayed_Hot.Free;
    icoCheckBox_Grayed_Disabled.Free;
    icoCheckBox_Unchecked.Free;
    icoCheckBox_Unchecked_Down.Free;
    icoCheckBox_Unchecked_Hot.Free;
    icoCheckBox_Unchecked_Disabled.Free;
  end;

  inherited;
end;

function TGroupBoxCheck.GetChecked: Boolean;
begin
  Result := State = cbChecked;
end;

procedure TGroupBoxCheck.Changed;
begin
  if Assigned(FOnChange) then
     FOnChange(Self);
end;

procedure TGroupBoxCheck.SetAction(const Value: TCheckBoxAction);
begin
  if FAction <> Value then
  begin
    FAction := Value;
  end;
end;

procedure TGroupBoxCheck.SetAllowGrayed(const Value: Boolean);
begin
  if FAllowGrayed <> Value then
  begin
    FAllowGrayed := Value;
    Changed;
  end;
end;

procedure TGroupBoxCheck.SetChecked(const Value: Boolean);
begin
  if Value <> (State = cbChecked) then
  begin
    if Value then
       State := cbChecked
    else
       State := cbUnchecked;
  end;
end;

procedure TGroupBoxCheck.SetDown(const Value: Boolean);
begin
  if FDown <> Value then
  begin
    FDown := Value;
    FGroupBox.DrawCheck(FGroupBox.Canvas);
  end;
end;

procedure TGroupBoxCheck.SetHint(const Value: string);
begin
  if FHint <> Value then
  begin
    FHint := Value;
    Changed;
  end;
end;

procedure TGroupBoxCheck.SetHot(const Value: Boolean);
begin
  if FHot <> Value then
  begin
    FHot := Value;
    FGroupBox.DrawCheck(FGroupBox.Canvas);
  end;
end;

procedure TGroupBoxCheck.SetPosition(const Value: TCheckBoxPos);
begin
  if FPosition <> Value then
  begin
    FPosition := Value;
    Changed;
  end;
end;

procedure TGroupBoxCheck.SetState(const Value: TCheckBoxState);
begin
  if FState <> Value then
  begin
    FState := Value;
    FGroupBox.DrawCheck(FGroupBox.Canvas);
    FGroupBox.PerformCheckBoxAction;
    FGroupBox.DoGroupCheckClick;
  end;
end;

procedure TGroupBoxCheck.SetThemed(const Value: Boolean);
begin
  if FThemed <> Value then
  begin
    FThemed := Value;
    Changed;
  end;
end;

procedure TGroupBoxCheck.SetCustomIconsDirectory(Value: String); // added by Ciro Alfredo Consentino (August 16, 2019)
begin
  if FCustomIconsDirectory <> Value then
  begin
    FCustomIconsDirectory:= Value;
    if csDesigning in FGroupBox.ComponentState then
       Exit;
    if FCustomIconsEnabled then
       LoadCustomIcons;
    Changed;
  end;
end;

procedure TGroupBoxCheck.SetCustomIconsEnabled(Value: Boolean);  // added by Ciro Alfredo Consentino (August 16, 2019)
begin
  if FCustomIconsEnabled <> Value then
  begin
    FCustomIconsEnabled:= Value;
    if FCustomIconsDirectory = '' then
       Exit; // do not let icons be initialized

    if csDesigning in FGroupBox.ComponentState then
       Exit;

    if FCustomIconsEnabled then
       LoadCustomIcons;

    Changed;
  end;
end;

procedure TGroupBoxCheck.LoadCustomIcons;

  procedure LoadIconFile(var iIconVar: TIcon; const iFileName: String);
  begin
    if FCustomIconsDirectory <> '' then
       if FileExists(FCustomIconsDirectory+iFileName) then
          iIconVar.LoadFromFile(FCustomIconsDirectory+iFileName);
  end;

begin
  LoadIconFile(icoCheckBox_Checked,            'checkbox_checked.ico');
  LoadIconFile(icoCheckBox_Checked_Down,       'checkbox_checked_down.ico');
  LoadIconFile(icoCheckBox_Checked_Hot,        'checkbox_checked_hot.ico');
  LoadIconFile(icoCheckBox_Checked_Disabled,   'checkbox_checked_disabled.ico');
  LoadIconFile(icoCheckBox_Grayed,             'checkbox_grayed.ico');
  LoadIconFile(icoCheckBox_Grayed_Down,        'checkbox_grayed_down.ico');
  LoadIconFile(icoCheckBox_Grayed_Hot,         'checkbox_grayed_hot.ico');
  LoadIconFile(icoCheckBox_Grayed_Disabled,    'checkbox_grayed_disabled.ico');
  LoadIconFile(icoCheckBox_Unchecked,          'checkbox_unchecked.ico');
  LoadIconFile(icoCheckBox_Unchecked_Down,     'checkbox_unchecked_down.ico');
  LoadIconFile(icoCheckBox_Unchecked_Hot,      'checkbox_unchecked_hot.ico');
  LoadIconFile(icoCheckBox_Unchecked_Disabled, 'checkbox_unchecked_disabled.ico');
end;

procedure TGroupBoxCheck.SetVisible(const Value: Boolean);
begin
  if FVisible <> Value then
  begin
    FVisible := Value;
    Changed;
  end;
end;

{$IFDEF FREEWARE}
{$I TRIAL.INC}
{$ENDIF}



end.
