{*************************************************************************}
{ TAdvOfficeButtons components                                            }
{ for Delphi & C++Builder                                                 }
{                                                                         }
{ written by                                                              }
{    TMS Software                                                         }
{    copyright � 2007 - 2017                                              }
{    Email : info@tmssoftware.com                                         }
{    Web : http://www.tmssoftware.com                                     }
{                                                                         }
{ The source code is given as is. The author is not responsible           }
{ for any possible damage done due to the use of this code.               }
{ The component can be freely used in any application. The complete       }
{ source code remains property of the author and may not be distributed,  }
{ published, given or sold in any form as such. No parts of the source    }
{ code can be included in any other component or application without      }
{ written authorization of the author.                                    }
{*************************************************************************}

unit AdvOfficeButtons;

{$I TMSDEFS.INC}
{$R AdvOfficeButtons.res}
{$DEFINE REMOVESTRIP}
{$DEFINE REMOVEDRAW}

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls, StdCtrls,
  AdvGroupBox, AOBXPVS;

const
  MAJ_VER = 1; // Major version nr.
  MIN_VER = 5; // Minor version nr.
  REL_VER = 0; // Release nr.
  BLD_VER = 9; // Build nr.

  // version history
  // 1.0.0.1 : Fixed compatibility issue with TRadioGroup of TAdvOfficeRadioGroup
  // 1.0.1.0 : Improved : exposed Visible property in TAdvOfficeRadioButton
  // 1.0.2.0 : New : Added OnEnter, OnExit events in TAdvOfficeRadioButton, TAdvOfficeCheckBox
  // 1.0.3.0 : Improved : painting hot state of controls
  // 1.1.0.0 : New property Value added in AdvOfficeCheckGroup
  //         : New component TDBAdvOfficeCheckGroup added
  // 1.1.0.1 : Improved : painting of focus rectangle
  // 1.1.0.2 : Fixed : issue with ImageIndex for caption
  // 1.1.0.3 : Fixed : issue with arrow keys & TAdvOfficeRadioGroup
  // 1.1.0.4 : Fixed : issue with dbl click & mouseup handling
  // 1.1.0.5 : Fixed : small painting issue with ClearType fonts
  // 1.1.0.6 : Fixed : issue with runtime creating controls
  // 1.1.0.7 : Fixed : issue with setting separate radiobuttons in group as disabled
  // 1.1.0.8 : Fixed : issue with OnClick event for TAdvOfficeRadioGroup
  // 1.1.0.9 : Fixed : issue with vertical alignment of radiobutton label text
  // 1.1.1.0 : Improved : BidiMode RightToLeft support
  // 1.1.1.1 : Fixed : painting issue with BiDiMode bdRightToLeft for radiobutton
  // 1.1.1.2 : Fixed : issue with transparency on Windows Vista
  // 1.1.1.3 : Improved : tab key handling for TAdvOfficeCheckGroup
  // 1.1.1.4 : Fixed : background painting issue with Delphi 2009
  // 1.1.2.0 : Improved : shows native Windows Vista checkbox & radiobutton on themed Windows Vista
  // 1.2.0.0 : New : DisabledFontColor added for all controls
  // 1.2.1.0 : New : property Themed added to control style of checkbox/radiobutton
  // 1.2.2.0 : Improved : painting of cbGrayed state
  // 1.2.2.1 : Fixed : issue with setting focus on disabled checkboxes in AdvOfficeCheckGroup
  // 1.2.3.0 : New : ShowFocus property added for controls
  // 1.2.3.1 : Fixed : issue with empty caption
  // 1.2.3.2 : Improved : vertical top text alignment
  // 1.2.3.3 : Improved : focus painting
  // 1.2.4.0 : Improved : handling of actions with TAdvOfficeCheckBox
  // 1.2.4.1 : Changed : OnClick event triggered in TAdvOfficeCheckBox for programmatic changes
  // 1.2.4.2 : Improved : bdRightToLeft text drawing for non HTML formatted text
  // 1.2.5.0 : New : Support for cbGrayed state in not themed mode
  // 1.3.0.0 : New : AllowGrayed property added
  // 1.3.1.0 : New : Event OnCheckBoxClick added in TAdvOfficeCheckGroup
  // 1.3.1.1 : Improved : Themed drawing of checkboxes in TAdvOfficeCheckBox
  // 1.3.1.2 : Fixed : Paint issue with Alignment = taRightJustify in TAdvOfficeRadioButton
  // 1.3.1.3 : Fixed : Issue with right-click handling of TAdvOfficeCheckBox
  // 1.3.1.4 : Fixed : Painting issue with taCenter aligned TAdvOfficeRadioGroup
  // 1.3.2.0 : New : Function XYToItem() added in TAdvOfficeCheckGroup, TAdvOfficeRadioGroup
  // 1.3.2.1 : Improved : BiDiMode support for TAdvOfficeRadioButton
  // 1.3.3.0 : New : Event OnGroupCheckClick added in TAdvOfficeCheckGroup
  // 1.3.4.0 : New : Property AdvOfficeRadioGroup.RadioButtons[index]: TAdvOfficeRadioButton;
  // 1.3.4.1 : Fixed : Issue with transparency when BidiMode = bdRightToLeft
  // 1.3.4.2 : Fixed : Issue with OnCheckBoxClick in TAdvOfficeRadioGroup
  // 1.3.4.3 : Fixed : Regression in TAdvOfficeRadioButton
  // 1.3.5.0 : New : Support for use of Actions with TAdvOfficeRadioButton
  // 1.3.5.1 : Fixed : Focus indication in TAdvOfficeCheckGroup
  // 1.3.6.0 : New: ControlIndent property added for single column TAdvOfficeRadioGroup
  //         : New: ControlIndent property added for single column TAdvOfficeCheckGroup
  // 1.3.6.1 : Fixed : Issue with setting Visible/Enabled before control is shown
  // 1.3.6.2 : Fixed : Issue with ItemIndex in TAdvOfficeRadioGroup
  // 1.3.6.3 : Fixed : Issue with setting ItemIndex from OnClick event
  // 1.3.6.4 : Fixed : Issue with TAdvOfficeRadioGroup, TAdvOfficeCheckGroup enabling when CheckBox is unchecked
  // 1.3.6.5 : Fixed : Issue with OnClick event handler and use of actions
  // 1.3.7.0 : New: OnRadioButtonClick event added in TAdvOfficeRadioGroup
  // 1.3.8.0 : Improved : Changed AdvOfficeCheckGroup.Value to int64 type to support more than 32 checkboxes
  // 1.3.8.1 : Fixed : Issue with AdvOfficeRadioGroup focus handling
  // 1.3.8.2 : Fixed : Issue with programmatically setting focus to TAdvOfficeRadioGroup
  // 1.3.8.3 : Fixed : Issue with triggering OnRadioButtonClick
  // 1.3.8.4 : Fixed : Issue with arrow key handling in TAdvOfficeRadioGroup
  // 1.3.8.5 : Fixed : Regression issue with arrow key handling in TAdvOfficeRadioGroup
  // 1.3.8.6 : Fixed : Issue with TAdvOfficeRadioGroup getting focus & checking radiobutton when TabStop = false
  // 1.3.8.7 : Fixed : Issue with OnRadioButtonClick in TAdvOfficeRadioGroup
  // 1.3.8.8 : Fixed : Issue with TabStop in TAdvOfficeRadioGroup
  // 1.3.8.9 : Fixed : Issue with ButtonAlign for TAdvOfficeCheckGroup
  // 1.3.9.0 : Improved : Made ArrangeButtons virtual protected methods
  // 1.3.9.1 : Fixed : Issue with TabStop for TAdvOfficeRadioGroup
  // 1.4.0.0 : New : TAdvFormStyler awareness added for TAdvOfficeRadioGroup, TAdvOfficeCheckGroup
  // 1.4.0.1 : Improved : Disabled drawing from Windows 7 & newer
  // 1.4.0.2 : Fixed : Issue with OnClick in specific combination with mouse & keyboard
  // 1.4.0.3 : Fixed : Issue with DisabledFontColor for group caption
  // 1.4.0.4 : Fixed : Issue with OnClick event for programmatic change in TAdvOfficeRadioGroup
  // 1.4.1.0 : Improved : High DPI support
  // 1.4.1.1 : Fixed : Regression with non-themed drawing in config iwithout high-DPI
  // 1.4.1.2 : Fixed : Issue with TAdvOfficeCheckGroup with more than 32 checkboxes
  // 1.5.0.0 : New : AutoSize property added for TAdvOfficeCheckBox, TAdvOfficeRadioButton
  // 1.5.0.1 : Fixed : Issue with OnClick event triggered on already selected radiobutton
  // 1.5.0.2 : New : Property AutoCheck added in TAdvOfficeRadioButton
  // 1.5.0.3 : Improved : Behavior with tabbing and AutoCheck = true
  // 1.5.0.4 : Fixed : Issue with OnIsEnabled in TAdvOfficeRadioGroup
  // 1.5.0.5 : Improved : Public update call to reinvoke OnIsEnabled for changes in TAdvOfficeRadioGroup
  // 1.5.0.6 : Improved : HTML engine drawing in high DPI mode with form.Scaled = false
  // 1.5.0.7 : Fixed : Issue with BidiRightToLeft for TAdvOfficeRadioButton
  // 1.5.0.8 : Fixed: Issue with background color drawing
  // 1.5.0.9 : Fixed: Issue with background color in group for radiobutton & checkbox

const
  {$IFDEF DELPHI9_LVL}
  DefDisabledColor = clDkGray;
  {$ENDIF}
  {$IFNDEF DELPHI9_LVL}
  DefDisabledColor = clGray;
  {$ENDIF}

type
  TCheckBoxClick = procedure(Sender: TObject; CheckBoxIndex: Integer; Value: Boolean) of object;

  TCustomAdvOfficeCheckBox = class;

  TAdvOfficeCheckBoxActionLink = class(TControlActionLink)
  protected
    FImageIndex: Integer;
    FClient: TCustomAdvOfficeCheckBox;
    function IsCaptionLinked: Boolean; override;
    function IsCheckedLinked: Boolean; override;
    procedure AssignClient(AClient: TObject); override;
    procedure SetChecked(Value: Boolean); override;
    procedure SetCaption(const Value: String); override;
  end;

  TCustomAdvOfficeCheckBox = class(TCustomControl)
  private
    FAllowGrayed: Boolean;
    FDown:Boolean;
    FState:TCheckBoxState;
    FFocused:Boolean;
    FReturnIsTab:Boolean;
    FImages:TImageList;
    FBtnVAlign: TTextLayout;
    FAlignment: TLeftRight;
    FEllipsis: Boolean;
    FCaption: String;
    FShadowEnabled: Boolean;
    FShadowColor: TColor;
    FIsWinXP: Boolean;
    FHot: Boolean;
    FClicksDisabled: Boolean;
    FOldCursor: TCursor;
    FReadOnly: Boolean;
    FBkgBmp: TBitmap;
    FBkgCache: Boolean;
    FTransparentCaching: Boolean;
    FDrawBkg: Boolean;
    FGotClick: Boolean;
    FDisabledFontColor: TColor;
    FDisabledFontShadowColor: TColor;
    FInternalClick: Boolean;
    FThemed: Boolean;
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
    icoCheckBox_Unchecked_Disabled: TIcon; // added by Ciro Alfredo Consentino (August 16, 2019)
    FParentBk: TBitmap; // added by Ciro Alfredo Consentino (August 24, 2019)
    FCaptionIndent: Integer;      // added by Ciro Alfredo Consentino (XXX) readded by Moreno Cattaneo for missing source
    FCustomEnableIconHD: Boolean; // added by Ciro Alfredo Consentino (XXX) readded by Moreno Cattaneo for missing source

    procedure WMEraseBkGnd(var Message:TMessage); message WM_ERASEBKGND;
    procedure CMEnabledChanged(var Message: TMessage); message CM_ENABLEDCHANGED;
    procedure CMDialogChar(var Message: TCMDialogChar); message CM_DIALOGCHAR;
    procedure CMMouseLeave(var Message: TMessage); message CM_MOUSELEAVE;
    procedure CMMouseEnter(var Message: TMessage); message CM_MOUSEENTER;
    procedure SetState(Value:TCheckBoxState);
    procedure SetCaption(Value: String);
    procedure SetImages(const Value: TImageList);
    procedure SetButtonVertAlign(const Value: TTextLayout);
    procedure SetAlignment(const Value: TLeftRight);
    procedure SetEllipsis(const Value: Boolean);
    procedure SetShadowEnabled(const Value: Boolean);
    procedure SetShadowColor(const Value: TColor);
    procedure SetThemed(const Value: Boolean);
    procedure SetCustomIconsDirectory(Value: String); // added by Ciro Alfredo Consentino (August 16, 2019)
    procedure SetCustomIconsEnabled(Value: Boolean);  // added by Ciro Alfredo Consentino (August 16, 2019)
    procedure LoadCustomIcons; // added by Ciro Alfredo Consentino (August 16, 2019)
    procedure DrawParentImage (Control: TControl; Dest: TCanvas);
  protected
    procedure Notification(AComponent: TComponent; AOperation: TOperation); override;
    procedure DrawCheck(ACanvas: TCanvas);
    procedure Paint; override;
    procedure SetChecked(Value: Boolean); virtual;
    function  GetChecked: Boolean; virtual;
    procedure MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Integer); override;
    procedure MouseUp(Button: TMouseButton; Shift: TShiftState; X, Y: Integer); override;
    procedure MouseMove(Shift: TShiftState;X, Y: Integer); override;
    procedure KeyDown(var Key: Word; Shift: TShiftSTate); override;
    procedure KeyUp(var Key: Word; Shift: TShiftSTate); override;
    procedure SetDown(Value: Boolean);
    procedure Loaded; override;
    procedure DoEnter; override;
    procedure DoExit; override;
    procedure WndProc(var Message: TMessage); override;
    property  Checked: Boolean read GetChecked write SetChecked default False;
    property  ClicksDisabled: Boolean read FClicksDisabled write FClicksDisabled;
    function  GetActionLinkClass: TControlActionLinkClass; override;
    procedure ActionChange(Sender: TObject; CheckDefaults: Boolean); override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    procedure Toggle; virtual;
    procedure SetBounds(ALeft, ATop, AWidth, AHeight: Integer); override;
    property TransparentChaching: Boolean read FTransparentCaching write FTransparentCaching;
    property DrawBkg: Boolean read FDrawBkg write FDrawBkg;
    property Alignment: TLeftRight read FAlignment write SetAlignment;
    property ButtonVertAlign: TTextLayout read FBtnVAlign write setButtonVertAlign default tlTop;
    property Caption: String read FCaption write SetCaption;
    property DisabledFontColor: TColor read FDisabledFontColor write FDisabledFontColor default DefDisabledColor;
    property DisabledFontShadowColor: TColor read FDisabledFontShadowColor write FDisabledFontShadowColor default clWhite;
    property AllowGrayed: Boolean read FAllowGrayed write FAllowGrayed default False;
    property Down: Boolean read FDown write SetDown default False;
    property Ellipsis: Boolean read FEllipsis write SetEllipsis default False;
    property Images: TImageList read FImages write SetImages;
    property ReadOnly: Boolean read FReadOnly write FReadOnly default False;
    property ReturnIsTab: Boolean read FReturnIsTab write FReturnIsTab;
    property ShadowEnabled: Boolean read FShadowEnabled write SetShadowEnabled default False;
    property ShadowColor: TColor read FShadowColor write SetShadowColor default clGray;
    property State: TCheckBoxState read FState write SetState default cbUnchecked;
    property Themed: Boolean read FThemed write SetThemed default False;
    property CustomIconsDirectory: String read FCustomIconsDirectory write SetCustomIconsDirectory; // added by Ciro Alfredo Consentino (August 16, 2019)
    property CustomIconsEnabled: Boolean read FCustomIconsEnabled write SetCustomIconsEnabled;      // added by Ciro Alfredo Consentino (August 16, 2019)
    property CaptionIndent: Integer read FCaptionIndent write FCaptionIndent;             // added by Ciro Alfredo Consentino (XXX) readded by Moreno Cattaneo for missing source
    property CustomEnableIconHD: Boolean read FCustomEnableIconHD write FCustomEnableIconHD; // added by Ciro Alfredo Consentino (XXX) readded by Moreno Cattaneo for missing source
  end;

  //{$IFDEF DELPHIXE2_LVL}
  //[ComponentPlatformsAttribute(pidWin32 or pidWin64)]
  //{$ENDIF}
  TAdvOfficeCheckBoxEx = class(TCustomAdvOfficeCheckBox)
  published
    property Action;
    property Align;
    property AllowGrayed; // added by Ciro Alfredo Consentino (August 13, 2015)
    property Anchors;
    property BiDiMode;
    property Constraints;
    property Color;
    property Checked;
    property DragCursor;
    property DragKind;
    property DragMode;
    property Enabled;
    property Font;
    property ParentFont;
    property ParentColor;
    property PopupMenu;
    property ShowHint;
    property TabOrder;
    property TabStop;
    property Visible;
    property OnClick;
    property OnDragDrop;
    property OnDragOver;
    property OnEndDrag;
    property OnEnter;
    property OnExit;
    property OnKeyDown;
    property OnKeyPress;
    property OnKeyUp;
    property OnMouseDown;
    property OnMouseMove;
    property OnMouseUp;

    property Alignment;
    property ButtonVertAlign;
    property Caption;
    property DisabledFontColor;
    property DisabledFontShadowColor;
    property Down;
    property Ellipsis;
    property Images;
    property ReadOnly;
    property ReturnIsTab;
    property ShadowEnabled;
    property ShadowColor;
    property State;
    property Themed;
    property CustomIconsDirectory; // added by Ciro Alfredo Consentino (August 16, 2019)
    property CustomIconsEnabled;   // added by Ciro Alfredo Consentino (August 16, 2019)
    property CaptionIndent;        // added by Ciro Alfredo Consentino (XXX) readded by Moreno Cattaneo for missing source
    property CustomEnableIconHD;   // added by Ciro Alfredo Consentino (XXX) readded by Moreno Cattaneo for missing source
  end;

  TCustomAdvOfficeRadioButton = class;

  TAdvOfficeRadioButtonActionLink = class(TControlActionLink)
  protected
    FImageIndex: Integer;
    FClient: TCustomAdvOfficeRadioButton;
    procedure AssignClient(AClient: TObject); override;
    procedure SetChecked(Value: Boolean); override;
    procedure SetCaption(const Value: String); override;
  end;

  TCustomAdvOfficeRadioButton = class(TCustomControl)
  private
    FDown: Boolean;
    FChecked: Boolean;
    FFocused: Boolean;
    FGroupIndex: Byte;
    FReturnIsTab: Boolean;
    FImages: TImageList;
    FBtnVAlign: TTextLayout;
    FAlignment: TLeftRight;
    FEllipsis: Boolean;
    FCaption: String;
    FShadowEnabled: Boolean;
    FShadowColor: TColor;
    FIsWinXP: Boolean;
    FHot: Boolean;
    FClicksDisabled: Boolean;
    FOldCursor: TCursor;
    FBkgBmp: TBitmap;
    FBkgCache: boolean;
    FTransparentCaching: Boolean;
    FDrawBkg: Boolean;
    FGotClick: boolean;
    FDisabledFontColor: TColor;
    FDisabledFontShadowColor: TColor;
    FThemed: Boolean;
    FCheckDown: Boolean;

    FCustomIconsDirectory: String; // added by Ciro Alfredo Consentino (August 16, 2019)
    FCustomIconsEnabled: Boolean;  // added by Ciro Alfredo Consentino (August 16, 2019)

    icoRadioButton_Checked,
    icoRadioButton_Checked_Down,
    icoRadioButton_Checked_Hot,
    icoRadioButton_Checked_Disabled,
    icoRadioButton_Unchecked,
    icoRadioButton_Unchecked_Down,
    icoRadioButton_Unchecked_Hot,
    icoRadioButton_Unchecked_Disabled: TIcon; // added by Ciro Alfredo Consentino (August 16, 2019)
    FParentBk: TBitmap; // added by Ciro Alfredo Consentino (August 24, 2019)

    procedure TurnSiblingsOff;
    procedure SetDown(Value:Boolean);
    procedure SetChecked(Value:Boolean);
    procedure SetImages(const Value: TImageList);
    procedure WMLButtonDblClk(var Message: TWMLButtonDblClk); message WM_LBUTTONDBLCLK;
    procedure WMLButtonDown(var Message:TWMLButtonDown); message WM_LBUTTONDOWN;
    procedure WMEraseBkGnd(var Message:TMessage); message WM_ERASEBKGND;
    procedure CMEnabledChanged(var Message: TMessage); message CM_ENABLEDCHANGED;
    procedure CMDialogChar(var Message: TCMDialogChar); message CM_DIALOGCHAR;
    procedure CMMouseLeave(var Message: TMessage); message CM_MOUSELEAVE;
    procedure CMMouseEnter(var Message: TMessage); message CM_MOUSEENTER;
    procedure SetButtonVertAlign(const Value: TTextLayout);
    procedure SetAlignment(const Value: TLeftRight);
    procedure SetEllipsis(const Value: Boolean);
    procedure SetCaption(const Value: string);
    procedure SetShadowEnabled(const Value: Boolean);
    procedure SetShadowColor(const Value: TColor);
    procedure SetThemed(const Value: Boolean);
    procedure SetCustomIconsDirectory(Value: String); // added by Ciro Alfredo Consentino (August 16, 2019)
    procedure SetCustomIconsEnabled(Value: Boolean);  // added by Ciro Alfredo Consentino (August 16, 2019)
    procedure LoadCustomIcons; // added by Ciro Alfredo Consentino (August 16, 2019)
    procedure DrawParentImage (Control: TControl; Dest: TCanvas);
  protected
    procedure DrawRadio(ACanvas: TCanvas);
    procedure Paint; override;
    procedure Notification(AComponent: TComponent; AOperation: TOperation); override;
    procedure MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Integer); override;
    procedure MouseUp(Button: TMouseButton; Shift: TShiftState; X, Y: Integer); override;
    procedure MouseMove(Shift: TShiftState; X, Y: Integer); override;
    procedure KeyDown(var Key: Word; Shift: TShiftSTate); override;
    procedure KeyUp(var Key: Word; Shift: TShiftSTate); override;
    procedure DoEnter; override;
    procedure DoExit; override;
    procedure Loaded; override;
    procedure Click; override;
    procedure DoClick; virtual;
    function  GetActionLinkClass: TControlActionLinkClass; override;
    procedure ActionChange(Sender: TObject; CheckDefaults: Boolean); override;
    property  ClicksDisabled: Boolean read FClicksDisabled write FClicksDisabled;
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    procedure SetBounds(ALeft, ATop, AWidth, AHeight: Integer); override;
    property TransparentChaching: boolean read FTransparentCaching write FTransparentCaching;
    property DrawBkg: Boolean read FDrawBkg write FDrawBkg;
    property Alignment: TLeftRight read fAlignment write SetAlignment;
    property ButtonVertAlign: TTextLayout read fBtnVAlign write SetButtonVertAlign default tlTop;
    property Caption: String read FCaption write SetCaption;
    property Checked: Boolean read FChecked write SetChecked default False;
    property DisabledFontColor: TColor read FDisabledFontColor write FDisabledFontColor default DefDisabledColor;
    property DisabledFontShadowColor: TColor read FDisabledFontShadowColor write FDisabledFontShadowColor default clWhite;
    property Down: Boolean read FDown write SetDown default False;
    property Ellipsis: Boolean read FEllipsis write SetEllipsis default False;
    property GroupIndex: Byte read FGroupIndex write FGroupIndex default 0;
    property Images: TImageList read fImages write SetImages;
    property ReturnIsTab: Boolean read FReturnIsTab write FReturnIsTab;
    property ShadowEnabled: Boolean read FShadowEnabled write SetShadowEnabled default False;
    property ShadowColor: TColor read FShadowColor write SetShadowColor default clGray;
    property Themed: Boolean read FThemed write SetThemed default False;
    property CustomIconsDirectory: String read FCustomIconsDirectory write SetCustomIconsDirectory; // added by Ciro Alfredo Consentino (August 16, 2019)
    property CustomIconsEnabled: Boolean read FCustomIconsEnabled write SetCustomIconsEnabled;      // default False; // added by Ciro Alfredo Consentino (August 16, 2019)
  end;

  //{$IFDEF DELPHIXE2_LVL}
  //[ComponentPlatformsAttribute(pidWin32 or pidWin64)]
  //{$ENDIF}
  TAdvOfficeRadioButtonEx = class(TCustomAdvOfficeRadioButton)
  published
    property Align;
    property Action;
    property Anchors;
    property BiDiMode;
    property Constraints;
    property Color;
    property DragCursor;
    property DragKind;
    property DragMode;
    property Enabled;
    property Font;
    property ParentFont;
    property ParentColor;
    property PopupMenu;
    property ShowHint;
    property TabOrder;
    property TabStop;
    property OnClick;
    property OnDragDrop;
    property OnDragOver;
    property OnEndDrag;
    property OnEnter;
    property OnExit;
    property OnKeyDown;
    property OnKeyPress;
    property OnKeyUp;
    property OnMouseDown;
    property OnMouseMove;
    property OnMouseUp;
    property Visible;

    property Alignment;
    property ButtonVertAlign;
    property Caption;
    property Checked;
    property DisabledFontColor;
    property DisabledFontShadowColor;
    property Down;
    property Ellipsis;
    property GroupIndex;
    property Images;
    property ReturnIsTab;
    property ShadowEnabled;
    property ShadowColor;
    property Themed;
    property CustomIconsDirectory; // added by Ciro Alfredo Consentino (August 16, 2019)
    property CustomIconsEnabled;   // added by Ciro Alfredo Consentino (August 16, 2019)
  end;

  TEnabledEvent = procedure (Sender:TObject; ItemIndex: Integer; var Enabled: Boolean) of object;

  TCustomAdvOfficeRadioGroup = class(TAdvGroupBoxEx)
  private
    FButtons: TList;
    FItems: TStrings;
    FItemIndex: Integer;
    FColumns: Integer;
    FReading: Boolean;
    FUpdating: Boolean;
    FAlignment: TAlignment;
    FBtnVAlign: TTextLayout;
    FImages: TImageList;
    FEllipsis: Boolean;
    FShadowEnabled: Boolean;
    FShadowColor: TColor;
    FOnIsEnabled: TEnabledEvent;
    FIsReadOnly: Boolean;
    FDisabledFontColor: TColor;
    FDisabledFontShadowColor: TColor;
    FThemed: Boolean;
    FClicksDisabled: Boolean;
    FOnRadioButtonClick: TNotifyEvent;
    FFocusButtonIdx: Integer;

    procedure ButtonClick(Sender: TObject);
    procedure ItemsChange(Sender: TObject);
    procedure SetButtonCount(Value: Integer);
    procedure SetColumns(Value: Integer);
    procedure SetItemIndex(Value: Integer);
    procedure SetItems(Value: TStrings);
    procedure CheckFocus(Sender: TObject);
    procedure CMEnabledChanged(var Message: TMessage); message CM_ENABLEDCHANGED;
    procedure CMFontChanged(var Message: TMessage); message CM_FONTCHANGED;
    procedure WMSize(var Message: TWMSize); message WM_SIZE;
    procedure SetAlignment(const Value: TAlignment);
    procedure SetButtonVertAlign(const Value: TTextLayout);
    procedure SetImages(const Value: TImageList);
    procedure SetEllipsis(const Value: Boolean);
    procedure SetShadowEnabled(const Value: Boolean);
    procedure SetShadowColor(const Value: TColor);
    procedure SetThemed(const Value: Boolean);
    procedure SetClicksDisabled(const Value: Boolean);
    function  GetRadioButton(Index: Integer): TAdvOfficeRadioButtonEx;
  protected
    procedure Loaded; override;
    procedure ReadState(Reader: TReader); override;
    procedure ArrangeButtons; virtual;
    function  CanModify: Boolean; virtual;
    procedure Notification(AComponent: TComponent; AOperation: TOperation); override;
    property Columns: Integer read FColumns write SetColumns default 1;
    property ItemIndex: Integer read FItemIndex write SetItemIndex default -1;
    property Items: TStrings read FItems write SetItems;
    property IsReadOnly: Boolean read FIsReadOnly write FIsReadOnly;
    property Themed: Boolean read FThemed write SetThemed default False;
    procedure UpdateButtons;
    property ClicksDisabled: Boolean read FClicksDisabled write SetClicksDisabled;
    procedure DoRadioButtonClick; virtual;
    procedure DoEnter; override;
    procedure DoExit; override;
  public
    procedure GetChildren(Proc: TGetChildProc; Root: TComponent); override;
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    procedure PushKey(var Key: Char);
    procedure PushKeyDown(var Key: Word; Shift: TShiftState);
    function XYToItem(X, Y: Integer): Integer;
    property Alignment: TAlignment read FAlignment write SetAlignment default taLeftJustify;
    property ButtonVertAlign: TTextLayout read fBtnVAlign write SetButtonVertAlign default tlTop;
    property RadioButtons[Index: Integer]: TAdvOfficeRadioButtonEx read GetRadioButton;
    property DisabledFontColor: TColor read FDisabledFontColor write FDisabledFontColor default DefDisabledColor;
    property DisabledFontShadowColor: TColor read FDisabledFontShadowColor write FDisabledFontShadowColor default clWhite;
    property Ellipsis: Boolean read FEllipsis write SetEllipsis;
    property Images: TImageList read FImages write SetImages;
    property ShadowEnabled: Boolean read FShadowEnabled write SetShadowEnabled default False;
    property ShadowColor: TColor read FShadowColor write SetShadowColor default clSilver;
    property OnIsEnabled: TEnabledEvent read FOnIsEnabled write FOnIsEnabled;
    property OnRadioButtonClick: TNotifyEvent read FOnRadioButtonClick write FOnRadioButtonClick;
  end;

  //{$IFDEF DELPHIXE2_LVL}
  //[ComponentPlatformsAttribute(pidWin32 or pidWin64)]
  //{$ENDIF}
  TAdvOfficeRadioGroupEx = class(TCustomAdvOfficeRadioGroup)
  private
  protected
  public
  published
    property Align;
    property Anchors;
    property Constraints;
    property DragKind;
    property ParentBiDiMode;
    property Caption;
    property Color;
    property Columns;
    property Ctl3D;
    property DragCursor;
    property DragMode;
    property Enabled;
    property Font;
    property ItemIndex;
    property Items;
    property ParentColor;
    property ParentCtl3D;
    property ParentFont;
    property ParentShowHint;
    property PopupMenu;
    property ShowHint;
    property TabOrder;
    property TabStop;
    property Themed;
    property Visible;
    property OnClick;
    property OnContextPopup;
    property OnDragDrop;
    property OnDragOver;
    property OnEndDrag;
    property OnEnter;
    property OnExit;
    property OnEndDock;
    property OnStartDock;
    property OnStartDrag;

    property Alignment;
    property ButtonVertAlign;
    property DisabledFontColor;
    property DisabledFontShadowColor;
    property Ellipsis;
    property Images;
    property ShadowEnabled;
    property ShadowColor;
    property OnRadioButtonClick;
    property OnIsEnabled;
  end;

  TCustomAdvOfficeCheckGroup = class(TAdvGroupBoxEx)
  private
    FButtons: TList;
    FItems: TStrings;
    FColumns: Integer;
    FReading: Boolean;
    FUpdating: Boolean;
    FAlignment: TAlignment;
    FBtnVAlign: TTextLayout;
    FImages: TImageList;
    FEllipsis: Boolean;
    FShadowEnabled: Boolean;
    FShadowColor: TColor;
    FOnIsEnabled: TEnabledEvent;
    FValue: Int64;
    FFocusButtonIdx: Integer;
    FDisabledFontColor: TColor;
    FDisabledFontShadowColor: TColor;
    FThemed: Boolean;
    FOnCheckBoxClick: TCheckBoxClick;
    FOnGroupCheckClick: TNotifyEvent;
    procedure ButtonClick(Sender: TObject);
    procedure CheckFocus(Sender: TObject);
    procedure ItemsChange(Sender: TObject);
    procedure SetButtonCount(Value: Integer);
    procedure SetColumns(Value: Integer);
    procedure SetItems(Value: TStrings);
    procedure UpdateButtons;
    procedure CMEnabledChanged(var Message: TMessage); message CM_ENABLEDCHANGED;
    procedure CMFontChanged(var Message: TMessage); message CM_FONTCHANGED;
    procedure WMSize(var Message: TWMSize); message WM_SIZE;
    procedure SetAlignment(const Value: TAlignment);
    procedure SetButtonVertAlign(const Value: TTextLayout);
    procedure SetImages(const Value: TImageList);
    procedure SetEllipsis(const Value: Boolean);
    procedure SetShadowEnabled(const Value: Boolean);
    procedure SetShadowColor(const Value: TColor);
    function  GetReadOnly(Index: Integer): Boolean;
    procedure SetReadOnly(Index: Integer; const Value: Boolean);
    procedure SetValue(const Value: Int64);
    function  GetValue: Int64;
    procedure SetThemed(const Value: Boolean);
  protected
    procedure Loaded; override;
    procedure DoEnter; override;
    procedure DoExit; override;
    procedure ArrangeButtons; virtual;
    procedure PerformCheckBoxAction; override;
    procedure ReadState(Reader: TReader); override;
    function  CanModify: Boolean; virtual;
    function  GetChecked(Index: Integer): Boolean; virtual;
    procedure SetChecked(Index: Integer; const Value: Boolean); virtual;
    procedure Notification(AComponent: TComponent; AOperation: TOperation); override;
    property  Columns: Integer read FColumns write SetColumns default 1;
    property  Items: TStrings read FItems write SetItems;
    property  Value: Int64 read GetValue write SetValue;
    property  Themed: Boolean read FThemed write SetThemed default False;
    procedure DoCheckBoxClick(Index: integer; Value: Boolean); virtual;
    procedure DoGroupCheckClick; override;
  public
    procedure GetChildren(Proc: TGetChildProc; Root: TComponent); override;
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    procedure UpdateValue;
    procedure PushKey(var Key: Char);
    procedure PushKeyDown(var Key: Word; Shift: TShiftState);
    property Checked[Index: Integer]: Boolean read GetChecked write SetChecked;
    property ReadOnly[Index: Integer]: Boolean read GetReadOnly write SetReadOnly;
    function XYToItem(X, Y: Integer): Integer;

    property Alignment: TAlignment read FAlignment write SetAlignment default taLeftJustify;
    property ButtonVertAlign: TTextLayout read fBtnVAlign write SetButtonVertAlign default tlTop;
    property Ellipsis: Boolean read FEllipsis write SetEllipsis;
    property DisabledFontColor: TColor read FDisabledFontColor write FDisabledFontColor default DefDisabledColor;
    property DisabledFontShadowColor: TColor read FDisabledFontShadowColor write FDisabledFontShadowColor default clWhite;
    property Images: TImageList read FImages write SetImages;
    property ShadowEnabled: Boolean read FShadowEnabled write SetShadowEnabled default False;
    property ShadowColor: TColor read FShadowColor write SetShadowColor default clSilver;
    property OnIsEnabled: TEnabledEvent read FOnIsEnabled write FOnIsEnabled;
    property OnCheckBoxClick: TCheckBoxClick read FOnCheckBoxClick write FOnCheckBoxClick;
    property OnGroupCheckClick: TNotifyEvent read FOnGroupCheckClick write FOnGroupCheckClick;
  end;

  //{$IFDEF DELPHIXE2_LVL}
  //[ComponentPlatformsAttribute(pidWin32 or pidWin64)]
  //{$ENDIF}
  TAdvOfficeCheckGroupEx = class(TCustomAdvOfficeCheckGroup)
  private
  protected
  public
    property Value;
  published
    property Align;
    property Anchors;
    property Constraints;
    property DragKind;
    property ParentBiDiMode;
    property Caption;
    property Color;
    property Columns;
    property Ctl3D;
    property DragCursor;
    property DragMode;
    property Enabled;
    property Font;
    property Items;
    property ParentColor;
    property ParentCtl3D;
    property ParentFont;
    property ParentShowHint;
    property PopupMenu;
    property ShowHint;
    property TabOrder;
    property TabStop;
    property Themed;
    property Visible;
    property OnClick;
    property OnContextPopup;
    property OnDragDrop;
    property OnDragOver;
    property OnEndDrag;
    property OnEnter;
    property OnExit;
    property OnEndDock;
    property OnStartDock;
    property OnStartDrag;

    property Alignment;
    property ButtonVertAlign;
    property Ellipsis;
    property DisabledFontColor;
    property DisabledFontShadowColor;
    property Images;
    property ShadowEnabled;
    property ShadowColor;
    property OnCheckBoxClick;
    property OnIsEnabled;
    property OnGroupCheckClick;
  end;

//var
//  TMS_NoClickForProgrammaticCheck: boolean = true; // useless and makes CheckBox not work correctly


implementation

uses
  ShellApi, CommCtrl, Math, Imglist, ActnList, Forms;

const
  BW = 12;

function IsVista: Boolean;
var
//  hKernel32: HMODULE;
  dwVersion:Dword;
  dwWindowsMajorVersion,dwWindowsMinorVersion:Dword;

begin
  dwVersion := GetVersion;
  dwWindowsMajorVersion :=  DWORD(LOBYTE(LOWORD(dwVersion)));
  dwWindowsMinorVersion :=  DWORD(HIBYTE(LOWORD(dwVersion)));

  Result := (dwWindowsMajorVersion > 5) or
    ((dwWindowsMajorVersion = 5) and (dwWindowsMinorVersion >= 1));

  (*
  hKernel32 := GetModuleHandle('kernel32');
  if (hKernel32 > 0) then
  begin
    Result := GetProcAddress(hKernel32, 'GetLocaleInfoEx') <> nil;
  end
  else
    Result := false;
  *)
end;

function IsWin7: Boolean;
var
  //  hKernel32: HMODULE;
  dwVersion:Dword;
  dwWindowsMajorVersion,dwWindowsMinorVersion:Dword;

begin
  dwVersion := GetVersion;
  dwWindowsMajorVersion :=  DWORD(LOBYTE(LOWORD(dwVersion)));
  dwWindowsMinorVersion :=  DWORD(HIBYTE(LOWORD(dwVersion)));

  Result := (dwWindowsMajorVersion = 6) and (dwWindowsMinorVersion = 1);
  (*
  hKernel32 := GetModuleHandle('kernel32');
  if (hKernel32 > 0) then
  begin
    Result := GetProcAddress(hKernel32, 'GetLocaleInfoEx') <> nil;
  end
  else
    Result := false;
  *)
end;

function GetFileVersion(FileName: String): Integer;
var
  FileHandle: DWord;
  l: Integer;
  pvs: PVSFixedFileInfo;
  lptr: UInt;
  querybuf: array[0..255] of Char;
  buf: PChar;
begin
  Result := -1;

  StrPCopy(querybuf, FileName);
  l := GetFileVersionInfoSize(querybuf, FileHandle);
  if (l > 0) then
  begin
    GetMem(buf, l);
    GetFileVersionInfo(querybuf, FileHandle, l, buf);
    if VerQueryValue(buf,'\',Pointer(pvs), lptr) then
    begin
      if (pvs^.dwSignature = $FEEF04BD) then
      begin
        Result := pvs^.dwFileVersionMS;
      end;
    end;
    FreeMem(buf);
  end;
end;

function DoThemeDrawing: Boolean;
var
  VerInfo: TOSVersioninfo;
  FIsWinXP, FIsComCtl6: Boolean;
  i: Integer;
begin
  VerInfo.dwOSVersionInfoSize := SizeOf(TOSVersionInfo);

  GetVersionEx(verinfo);

  FIsWinXP := (verinfo.dwMajorVersion > 5) or
              ((verinfo.dwMajorVersion = 5) and (verinfo.dwMinorVersion >= 1));

  i := GetFileVersion('COMCTL32.DLL');
  i := (i shr 16) and $FF;

  FIsComCtl6 := (i > 5);

  Result := FIsComCtl6 and FIsWinXP;
end;

{ TCustomAdvOfficeCheckBox }

constructor TCustomAdvOfficeCheckBox.Create(AOwner: TComponent);
var
  VerInfo: TOSVersioninfo;
  FDesignTime: Boolean;
begin
  inherited Create(AOwner);
  Width := 120;
  Height := 20;
  FBtnVAlign := tlTop;

  FDesignTime := (csDesigning in ComponentState) and not
                 ((csReading in Owner.ComponentState) or (csLoading in Owner.ComponentState));

  if FDesignTime then
     FCaption := Self.ClassName;

  FShadowEnabled := False;
  FShadowColor := clGray;
  FDisabledFontColor := DefDisabledColor;
  FDisabledFontShadowColor := clWhite;

  //FCustomIconsDirectory := '';  // added by Ciro Alfredo Consentino (August 16, 2019)
  FCustomIconsEnabled := False; // added by Ciro Alfredo Consentino (August 16, 2019)

  VerInfo.dwOSVersionInfoSize := SizeOf(TOSVersionInfo);

  GetVersionEx(verinfo);

  FIsWinXP := (verinfo.dwMajorVersion > 5) or
              ((verinfo.dwMajorVersion = 5) and (verinfo.dwMinorVersion >= 1));

  ControlStyle := ControlStyle - [csClickEvents];
  FReadOnly := False;

  FBkgBmp := TBitmap.Create;
  FBkgCache := False;
  FTransparentCaching := False;
  FDrawBkg := True;

  FParentBk := TBitmap.Create; // added by Ciro Alfredo Consentino (August 24, 2019)
  
  if not FDesignTime then
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

procedure TCustomAdvOfficeCheckBox.DrawParentImage(Control: TControl; Dest: TCanvas);
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

procedure TCustomAdvOfficeCheckBox.SetBounds(ALeft, ATop, AWidth, AHeight: Integer);
begin
  inherited;
  FBkgCache := False;
  Repaint;
end;

procedure TCustomAdvOfficeCheckBox.DrawCheck(ACanvas: TCanvas);
var
  bmp: TBitmap;
  BL,BT: Integer;
  icoHeight: Integer;
  HTheme: THandle;
  r: TRect;
  FIsComCtl6: Boolean;
  i: Integer;
  DrawThemed: Boolean;
  IsDesignTime: Boolean;
  DrawCustom, LoadedCustom: Boolean;
  iSize: TSize;
  Err: HResult;
  ico: TIcon;
  resStr: String;
  ThemedStateID: Integer;

  function AssignIconCustom(var icoVar: TIcon): Boolean;
  begin
    Result:= icoVar <> nil;
    if Result then
       ico.Assign(icoVar);
  end;

  function DrawBk(iLeft, iTop, iSize: Integer): Boolean;
  begin
    //FParentBk.SaveToFile('d:\testbitmap.bmp'); // for debug only, do not enable (August 24, 2019)
    BitBlt(ACanvas.Handle, iLeft, iTop, iSize, iSize, FParentBk.Canvas.Handle, iLeft, iTop, SRCCOPY); // draw parent image into canvas
  end;

begin
  if ((csReading in Owner.ComponentState) or (csLoading in Owner.ComponentState)) then
     Exit;
     
  BT := 4;

  i := GetFileVersion('COMCTL32.DLL');
  i := (i shr 16) and $FF;

  FIsComCtl6 := (i > 5);

  DrawThemed := IsVista and Themed and IsThemeActive and FIsComCtl6;

  IsDesignTime := csDesigning in ComponentState;
  DrawCustom := CustomIconsEnabled and (CustomIconsDirectory <> '') and (not IsDesignTime);
  LoadedCustom := False;

  if DrawCustom then
  begin
    //ExtraBW := 4;
    icoHeight:= 13;
    ico := TIcon.Create;
    try
      case State of
      cbChecked:
        begin
          if not Enabled then
             AssignIconCustom(icoCheckBox_Checked_Disabled)
          else
          if Down then
             AssignIconCustom(icoCheckBox_Checked_Down)
          else
          if FHot then
             AssignIconCustom(icoCheckBox_Checked_Hot)
          else
             AssignIconCustom(icoCheckBox_Checked);
        end;
      cbUnChecked:
        begin
          if not Enabled then
             AssignIconCustom(icoCheckBox_Unchecked_Disabled)
          else
          if Down then
             AssignIconCustom(icoCheckBox_Unchecked_Down)
          else
          if FHot then
             AssignIconCustom(icoCheckBox_Unchecked_Hot)
          else
             AssignIconCustom(icoCheckBox_Unchecked);
        end;
      cbGrayed:
        begin
          if not Enabled then
             AssignIconCustom(icoCheckBox_Grayed_Disabled)
          else
          if Down then
             AssignIconCustom(icoCheckBox_Grayed_Down)
          else
          if FHot then
             AssignIconCustom(icoCheckBox_Grayed_Hot)
          else
             AssignIconCustom(icoCheckBox_Grayed);
        end;
      end;

      LoadedCustom := not ico.Empty;
      if LoadedCustom then
      begin
        case FBtnVAlign of
          tlTop:    BT := 2 + (ACanvas.TextHeight('gh') - icoHeight) div 2;
          tlCenter: BT := (ClientRect.Bottom - ClientRect.Top) div 2 - (icoHeight div 2);
          tlBottom: BT := ClientRect.Bottom - icoHeight;
        end;

        if (FAlignment = taRightJustify) or UseRightToLeftAlignment then
          BL := ClientRect.Right - icoHeight - 1
        else
          BL := 0;

        DrawBk(BL, BT, icoHeight);
        ACanvas.Draw(BL, BT, ico);
      end;
    finally
    end;
    ico.Free;
    if LoadedCustom then
       Exit;
  end;

  if DrawThemed then
  begin
    HTheme := OpenThemeData(Self.Handle,'button');
    Err:= GetThemePartSize(HTheme, Self.Handle, BP_CHECKBOX, CBS_CHECKEDNORMAL, nil, TS_TRUE, iSize); // added by Ciro Alfredo Consentino (August 05, 2019)

    // new code added by Ciro Alfredo Consentino (August 05, 2019)
    case FBtnVAlign of
    tlTop:    BT := 2 + (ACanvas.TextHeight('gh') - iSize.cy) div 2;
    tlCenter: BT := (ClientRect.Bottom - ClientRect.Top) div 2 - (iSize.cy div 2);
    tlBottom: BT := ClientRect.Bottom - iSize.cy;
    end;

    if (FAlignment = taRightJustify) or UseRightToLeftAlignment then
      BL := ClientRect.Right - iSize.cy
    else
      BL := 0;

    r := Rect(BL, BT, BL + iSize.cy, BT + iSize.cy);

    if HTheme <> 0 then
    begin
      DrawBk(r.Left, r.Top, iSize.cy);
      case State of
      cbChecked:
        begin
          if not Enabled then
             ThemedStateID:= CBS_CHECKEDDISABLED
          else
          if Down then
             ThemedStateID:= CBS_CHECKEDNORMAL or CBS_PUSHED
          else
          if FHot then
             ThemedStateID:= CBS_CHECKEDHOT or CBS_HOT
          else
             ThemedStateID:= CBS_CHECKEDNORMAL;
        end;
      cbUnChecked:
        begin
          if not Enabled then
             ThemedStateID:= CBS_UNCHECKEDDISABLED
          else
          if Down then
             ThemedStateID:= CBS_UNCHECKEDNORMAL or CBS_PUSHED
          else
          if FHot then
             ThemedStateID:= CBS_HOT
          else
             ThemedStateID:= CBS_UNCHECKEDNORMAL;
        end;
      cbGrayed:
        begin
          if not Enabled then
             ThemedStateID:= CBS_MIXEDDISABLED
          else
          if Down then
             ThemedStateID:= CBS_MIXEDPRESSED
          else
          if FHot then
             ThemedStateID:= CBS_MIXEDHOT or CBS_HOT
          else
             ThemedStateID:= CBS_MIXEDNORMAL;
         end;
      end;
      DrawThemeBackground(HTheme, ACanvas.Handle, BP_CHECKBOX, ThemedStateID, @r, nil);
      CloseThemeData(HTheme);
    end
    else
      DrawThemed := false;
  end;

  if not DrawThemed then
  begin
    //ExtraBW := 4;
    bmp := TBitmap.Create;
    try
      case State of
      cbChecked:
        begin
          if IsDesignTime then
             resStr:= 'CHECKBOX_CHECKED'
          else
          if Down then
             resStr:= 'CHECKBOX_CHECKED_DOWN'
          else
          if FHot then
             resStr:= 'CHECKBOX_CHECKED_HOT'
          else
             resStr:= 'CHECKBOX_CHECKED';
        end;
      cbUnChecked:
        begin
          if IsDesignTime then
             resStr:= 'CHECKBOX_UNCHECKED'
          else
          if Down then
             resStr:= 'CHECKBOX_UNCHECKED_DOWN'
          else
          if FHot then
             resStr:= 'CHECKBOX_UNCHECKED_HOT'
          else
             resStr:= 'CHECKBOX_UNCHECKED';
        end;
      cbGrayed:
        begin
          if IsDesignTime then
             resStr:= 'CHECKBOX_GRAYED'
          else
          if Down then
             resStr:= 'CHECKBOX_GRAYED_DOWN'
          else
          if FHot then
             resStr:= 'CHECKBOX_GRAYED_HOT'
          else
             resStr:= 'CHECKBOX_GRAYED';
        end;
      end;

      bmp.LoadFromResourceName(hInstance, resStr);
      bmp.TransparentColor:= clFuchsia; // added by Ciro Alfredo Consentino (July 30, 2019)
      bmp.Transparent := True;
      bmp.TransparentMode := tmFixed;//  tmAuto; // modified by Ciro Alfredo Consentino (July 30, 2019)

      case FBtnVAlign of
      tlTop:    BT := 2 + (ACanvas.TextHeight('gh') - bmp.Height) div 2;
      tlCenter: BT := (ClientRect.Bottom - ClientRect.Top) div 2 - (bmp.Height div 2);
      tlBottom: BT := ClientRect.Bottom - bmp.Height;
      end;

      if (FAlignment = taRightJustify) or UseRightToLeftAlignment then
        BL := ClientRect.Right - bmp.Width - 1
      else
        BL := 0;

      DrawBk(BL, BT, bmp.Width);
      ACanvas.Draw(BL, BT, bmp);
    finally
      bmp.free;
    end;
  end;
end;

procedure TCustomAdvOfficeCheckBox.Paint;
var
  R: TRect;
  text: String;
  ExtraBW: Integer;
  FontColor: TColor;
  CanvasBMP: TBitmap;
begin
  Canvas.Brush.Style := bsClear;
  CanvasBMP := TBitmap.Create;
  CanvasBMP.Width := Self.Width;
  CanvasBMP.Height:= Self.Height;
  CanvasBMP.Canvas.Brush.Style:= bsClear;
  CanvasBMP.Canvas.Lock;

  if FTransparentCaching then
  begin
    if FBkgCache then
    begin
      Canvas.Draw(0, 0, FBkgBmp);
    end
    else
    begin
      FBkgBmp.Width := Self.Width;
      FBkgBmp.Height := Self.Height;
      DrawParentImage(Self, FBkgBmp.Canvas);
      Canvas.Draw(0, 0, FBkgBmp);
      FBkgCache := True;
    end;
  end
  else
  begin
    if FDrawBkg or IsVista then
       DrawParentImage(Self, CanvasBMP.Canvas);
  end;

  FParentBk.Width := Self.Width;
  FParentBk.Height:= Self.Height;

  FParentBk.Canvas.CopyRect(FParentBk.Canvas.ClipRect, CanvasBMP.Canvas, Canvas.ClipRect);

  Canvas.Font := Font;
  CanvasBMP.Canvas.Font := Font;
  if not Enabled then
     CanvasBMP.Canvas.Font.Color := DisabledFontColor;

  with CanvasBMP.Canvas do
  begin
    CanvasBMP.Canvas.Brush.Style := bsClear;
    Text := Caption;

    DrawCheck(CanvasBMP.Canvas);

    ExtraBW := 4;

    R := GetClientRect;

    if (FAlignment = taRightJustify) or UseRightToLeftAlignment then
    begin
      r.Left := 0;
      r.Right := r.Right - BW - ExtraBW;
    end
    else
      r.Left := r.Left + BW + ExtraBW;

    r.top := r.top + 2;

    CanvasBMP.Canvas.Brush.Style := bsClear;

    if (BidiMode = bdRightToLeft) then
    begin
      if FShadowEnabled then
      begin
        if not Enabled then
           begin
             FontColor:= DisabledFontColor;
             CanvasBMP.Canvas.Font.Color := DisabledFontShadowColor;
           end
        else
           begin
             FontColor:= Font.Color;
             CanvasBMP.Canvas.Font.Color := FShadowColor;
           end;
        OffsetRect(r, 1, 1);

        CanvasBMP.Canvas.Brush.Style := bsClear;
        DrawText(CanvasBMP.Canvas.Handle, PChar(Text), Length(Text), r, DT_RIGHT);

        CanvasBMP.Canvas.Font.Color := FontColor;
        OffsetRect(r, -1, -1);
      end;
      DrawText(CanvasBMP.Canvas.Handle, PChar(Text), Length(Text), r, DT_RIGHT);
    end
    else
    begin
      if FShadowEnabled then
      begin
        if not Enabled then
        begin
          FontColor:= DisabledFontColor;
          CanvasBMP.Canvas.Font.Color := FDisabledFontShadowColor;
        end
        else
        begin
          FontColor:= Font.Color;
          CanvasBMP.Canvas.Font.Color := FShadowColor;
        end;

        OffsetRect(r, 1, 1);
        DrawText(CanvasBMP.Canvas.Handle, PChar(Text), Length(Text), r, DT_LEFT);

        CanvasBMP.Canvas.Font.Color := FontColor;
        OffsetRect(r, -1, -1);
      end;
      DrawText(CanvasBMP.Canvas.Handle, PChar(Text), Length(Text), r, DT_LEFT);
    end;
  end;

  CanvasBMP.Canvas.Unlock;
  Canvas.Draw(0, 0, CanvasBMP);
  CanvasBMP.Free;
end;

procedure TCustomAdvOfficeCheckBox.SetDown(Value: Boolean);
begin
  if FDown <> Value then
  begin
    FDown := Value;
  end;
end;

procedure TCustomAdvOfficeCheckBox.SetState(Value: TCheckBoxState);
var
  r: TRect;
begin
  if FState <> Value then
  begin
    FState := Value;

    if HandleAllocated and HasParent then
    begin
      r := GetClientRect;
      case Alignment of
        taLeftJustify: r.Right := 20;
        taRightJustify: r.Left := r.Right - 20;
      end;

      InvalidateRect(Self.Handle, @r, True);
    end;
  end;
end;

procedure TCustomAdvOfficeCheckBox.SetThemed(const Value: Boolean);
begin
  if Value <> FThemed then
  begin
    FThemed := Value;
    Invalidate;
  end;
end;

function TCustomAdvOfficeCheckBox.GetChecked: Boolean;
begin
  Result := State = cbChecked;
end;

procedure TCustomAdvOfficeCheckBox.SetChecked(Value: Boolean);
begin
  if Value then
     State := cbChecked
  else
     State := cbUnchecked;

  Invalidate;

  if not FInternalClick and Assigned(OnClick) then //and not TMS_NoClickForProgrammaticCheck then
     OnClick(Self);
end;

{$IFDEF DELPHI6_LVL}
procedure TCustomAdvOfficeCheckBox.ActionChange(Sender: TObject; CheckDefaults: Boolean);
begin
  inherited ActionChange(Sender, CheckDefaults);
  if Sender is TCustomAction then
  begin
    Caption := TCustomAction(Sender).Caption;
    Checked := TCustomAction(Sender).Checked;
    Enabled := TCustomAction(Sender).Enabled;
  end;
end;

function TCustomAdvOfficeCheckBox.GetActionLinkClass: TControlActionLinkClass;
begin
  Result := TAdvOfficeCheckBoxActionLink;
end;
{$ENDIF}

procedure TCustomAdvOfficeCheckBox.DoEnter;
{$IFNDEF DELPHI9_LVL}
var
  R: TRect;
{$ENDIF}  
begin
  inherited DoEnter;
  FFocused := True;
  {$IFDEF DELPHI9_LVL}
  Repaint;
  {$ELSE}
  R := ClientRect;
  R.Right := 16;
  InvalidateRect(self.Handle, @R, true);
  {$ENDIF}
end;

procedure TCustomAdvOfficeCheckBox.DoExit;
var
  db: Boolean;
begin
  inherited DoExit;
  FFocused := False;
  db := FDrawBkg;
  FDrawBkg := True;
  Repaint;
  FDrawBkg := db;
end;

procedure TCustomAdvOfficeCheckBox.MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  R: TRect;
begin
  if Button <> mbLeft then
  begin
    inherited;
    Exit;
  end;

  FGotClick := True;

  if FFocused then
  begin
  end
  else
  begin
    if (Self.CanFocus and not (csDesigning in ComponentState)) then
    begin
      SetFocus;
      FFocused := True;
    end;
  end;

  inherited MouseDown(Button, Shift, X, Y);
  MouseCapture := True;
  Down := True;

  R := ClientRect;
  R.Right := 16;
  InvalidateRect(Self.Handle, @R, True);
end;

procedure TCustomAdvOfficeCheckBox.MouseUp(Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  R: TRect;
begin
  MouseCapture := False;
  Down := False;

  if (X >= 0) and (X <= Width) and (Y >= 0) and (Y <= Height) and FFocused and FGotClick then
  begin
    ClicksDisabled := True;
    Toggle;
    ClicksDisabled := False;
    Click;
  end;

  inherited MouseUp(Button, Shift, X, Y);

  if HandleAllocated and not (csDestroying in ComponentState) and Visible then
  begin
    R := ClientRect;
    R.Right := 16;
    InvalidateRect(Handle, @R, True);
  end;

  FGotClick := False;
end;

procedure TCustomAdvOfficeCheckBox.MouseMove(Shift: TShiftState; X, Y: Integer);
begin
  if MouseCapture then
     Down := (X >= 0) and (X <= Width) and (Y >= 0) and (Y <= Height);
  inherited MouseMove(Shift, X, Y);
end;

procedure TCustomAdvOfficeCheckBox.KeyDown(var Key: Word; Shift: TShiftState);
begin
  if (Key = VK_RETURN) and (fReturnIsTab) then
  begin
    Key := VK_TAB;
    PostMessage(Self.Handle, WM_KEYDOWN, VK_TAB, 0);
  end;

  if Key = VK_SPACE then
     Down := True;

  inherited KeyDown(Key, Shift);
end;

procedure TCustomAdvOfficeCheckBox.KeyUp(var Key: Word; Shift: TShiftState);
begin
  if Key = VK_SPACE then
  begin
    Down := False;
    Toggle;
    Click;
  end;
end;

procedure TCustomAdvOfficeCheckBox.SetImages(const Value: TImageList);
begin
  FImages := Value;
  Invalidate;
end;

procedure TCustomAdvOfficeCheckBox.Notification(AComponent: TComponent; AOperation: TOperation);
begin
  inherited;
  if (AOperation = opRemove) and (AComponent = FImages) then
     FImages:= nil;
end;

procedure TCustomAdvOfficeCheckBox.CMEnabledChanged(var Message: TMessage);
begin
  inherited;
  Invalidate;
end;

procedure TCustomAdvOfficeCheckBox.SetButtonVertAlign(const Value: TTextLayout);
begin
  if Value <> FBtnVAlign then
  begin
    FBtnVAlign := Value;
    Invalidate;
  end;
end;

procedure TCustomAdvOfficeCheckBox.SetAlignment(const Value: TLeftRight);
begin
  if FAlignment <> Value then
  begin
    FAlignment := Value;
    Invalidate;
  end;
end;

destructor TCustomAdvOfficeCheckBox.Destroy;
begin
  FBkgBmp.Free;
  FParentBk.Free;
  //FImageCache.Free;

  if not (csDesigning in ComponentState) then
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

procedure TCustomAdvOfficeCheckBox.SetEllipsis(const Value: Boolean);
begin
  if FEllipsis <> Value then
  begin
    FEllipsis := Value;
    Invalidate
  end;
end;

procedure TCustomAdvOfficeCheckBox.SetCaption(Value: String);
begin
  SetWindowText(Handle, PChar(Value));
  FCaption := Value;
  Invalidate;
end;

procedure TCustomAdvOfficeCheckBox.Toggle;
begin
  if not FReadOnly then
  begin
    FInternalClick := True;

    if AllowGrayed then
    begin
      case State of
        cbUnchecked: State := cbGrayed;
        cbChecked:   State := cbUnchecked;
        cbGrayed:    State := cbChecked;
      end;
    end
    else
      Checked := not Checked;

    FInternalClick := False;
  end;
end;

procedure TCustomAdvOfficeCheckBox.WMEraseBkGnd(var Message: TMessage);
begin
  {$IFDEF DELPHI_UNICODE}
  inherited;
  {$ENDIF}
  {$IFNDEF DELPHI_UNICODE}
  Message.Result := 1;
  {$ENDIF}  
end;

procedure TCustomAdvOfficeCheckBox.WndProc(var Message: TMessage);
begin
  if (Message.Msg = BM_SETCHECK) and (Message.WParam in [0..2]) then
  begin
    if TCheckBoxState(Message.WParam) = cbGrayed then
       State := TCheckBoxState(Message.WParam)
    else
    begin
      Checked := TCheckBoxState(Message.WParam) = cbChecked;
      Click;
    end;
  end;

  inherited WndProc(Message);
end;

procedure TCustomAdvOfficeCheckBox.CMDialogChar(var Message: TCMDialogChar);
begin
  with Message do
  begin
    if IsAccel(CharCode, FCaption) and CanFocus then
    begin
      Toggle;
      if Assigned(OnClick) then
         OnClick(Self);
      if TabStop then
         if (Self.CanFocus and not (csDesigning in ComponentState)) then
            SetFocus;
      Result := 1;
    end
    else
      inherited;
  end;
end;

procedure TCustomAdvOfficeCheckBox.SetShadowEnabled(const Value: Boolean);
begin
  if FShadowEnabled <> Value then
  begin
    FShadowEnabled := Value;
    Invalidate;
  end;
end;

procedure TCustomAdvOfficeCheckBox.SetShadowColor(const Value: TColor);
begin
  if FShadowColor <> Value then
  begin
    FShadowColor := Value;
    Invalidate;
  end;
end;

procedure TCustomAdvOfficeCheckBox.SetCustomIconsEnabled(Value: Boolean); // added by Ciro Alfredo Consentino (August 16, 2019)
begin
  if FCustomIconsEnabled <> Value then
  begin
    FCustomIconsEnabled:= Value;
    if FCustomIconsDirectory = '' then
       Exit; // do not let icons be initialized

    if csDesigning in ComponentState then
       Exit;
    if FCustomIconsEnabled then
       LoadCustomIcons;
    Invalidate;
  end;
end;

procedure TCustomAdvOfficeCheckBox.SetCustomIconsDirectory(Value: String); // added by Ciro Alfredo Consentino (August 16, 2019)
begin
  if FCustomIconsDirectory <> Value then
  begin
    FCustomIconsDirectory:= Value;
    if csDesigning in ComponentState then
       Exit;
    if FCustomIconsEnabled then
    begin
      LoadCustomIcons;
      Invalidate;
    end;
  end;
end;

procedure TCustomAdvOfficeCheckBox.LoadCustomIcons;
var
  iFolder: String;

  procedure LoadIconFile(var iIconVar: TIcon; const iFileName: String);
  begin
    if FileExists(iFolder+iFileName) then
       iIconVar.LoadFromFile(iFolder+iFileName);
  end;

begin
  if csDesigning in ComponentState then
     Exit;

  if FCustomIconsDirectory = '' then
     Exit;
  iFolder:= IncludeTrailingPathDelimiter(FCustomIconsDirectory);

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

procedure TCustomAdvOfficeCheckBox.CMMouseEnter(var Message: TMessage);
begin
  FHot := True;
  DrawCheck(Self.Canvas);
  inherited;
end;

procedure TCustomAdvOfficeCheckBox.CMMouseLeave(var Message: TMessage);
begin
  FHot := False;
  DrawCheck(Self.Canvas);
  inherited;
end;

procedure TCustomAdvOfficeCheckBox.Loaded;
begin
  inherited;
  FOldCursor := Cursor;
end;

{ TCustomAdvOfficeRadioButton }

constructor TCustomAdvOfficeRadioButton.Create(AOwner: TComponent);
var
  VerInfo: TOSVersionInfo;
  FDesignTime: Boolean;
begin
  inherited Create(AOwner);
  Width := 135;
  Height := 20;
  FBtnVAlign := tlTop;

  FDesignTime := (csDesigning in ComponentState) and not
                 ((csReading in Owner.ComponentState) or (csLoading in Owner.ComponentState));

  if FDesignTime then
     FCaption := Self.ClassName;

  FShadowEnabled := False;
  FShadowColor := clGray;
  FDisabledFontColor := DefDisabledColor;
  FDisabledFontShadowColor := clWhite;

  //FCustomIconsDirectory := '';
  FCustomIconsEnabled := False;

  VerInfo.dwOSVersionInfoSize := SizeOf(TOSVersionInfo);

  GetVersionEx(verinfo);

  FIsWinXP := (verinfo.dwMajorVersion > 5) or
              ((verinfo.dwMajorVersion = 5) and (verinfo.dwMinorVersion >= 1));

  FBkgBmp := TBitmap.Create;
  FBkgCache := False;
  FTransparentCaching := False;
  FDrawBkg := True;

  FParentBk := TBitmap.Create;
  if not FDesignTime then
  begin
    icoRadioButton_Checked := TIcon.Create;
    icoRadioButton_Checked_Down := TIcon.Create;
    icoRadioButton_Checked_Hot := TIcon.Create;
    icoRadioButton_Checked_Disabled := TIcon.Create;
    icoRadioButton_Unchecked := TIcon.Create;
    icoRadioButton_Unchecked_Down := TIcon.Create;
    icoRadioButton_Unchecked_Hot := TIcon.Create;
    icoRadioButton_Unchecked_Disabled := TIcon.Create;
  end;
end;

procedure TCustomAdvOfficeRadioButton.DrawParentImage(Control: TControl; Dest: TCanvas);
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
    Parent.Perform(WM_ERASEBKGND, Integer(DC), Integer(0));
    Parent.Perform(WM_PAINT, Integer(DC), Integer(0));
    RestoreDC(DC, SaveIndex);
  end;
end;

procedure TCustomAdvOfficeRadioButton.SetBounds(ALeft, ATop, AWidth, AHeight: Integer);
begin
  inherited;
  FBkgCache := False;
  Repaint;
end;

procedure TCustomAdvOfficeRadioButton.DrawRadio(ACanvas: TCanvas);
var
  bmp: TBitmap;
  BT, BL: Integer;
  i: Integer;
  HTheme: THandle;
  FIsComCtl6: Boolean;
  r: TRect;
  DrawThemed: Boolean;
  IsDesignTime: Boolean;
  iSize: TSize;
  Err: HResult;
  icoHeight: Integer;
  DrawCustom, LoadedCustom: Boolean;
  ico: TIcon;
  resStr: String;
  ThemedStateID: Integer;

  function AssignIconCustom(var icoVar: TIcon): Boolean;
  begin
    Result:= icoVar <> nil;
    if Result then
       ico.Assign(icoVar);
  end;

  function DrawBk(iLeft, iTop, iSize: Integer): Boolean;
  begin
    //FParentBk.SaveToFile('d:\testbitmap.bmp'); // for debug only, do not enable (August 24, 2019)
    Result:= True;
    BitBlt(ACanvas.Handle, iLeft, iTop, iSize, iSize, FParentBk.Canvas.Handle, iLeft, iTop, SRCCOPY); // draw parent image into canvas
  end;
  
begin
  if ((csReading in Owner.ComponentState) or (csLoading in Owner.ComponentState)) then
     Exit;

  BT := 4;

  i := GetFileVersion('COMCTL32.DLL');
  i := (i shr 16) and $FF;

  FIsComCtl6 := (i > 5);

  DrawThemed := IsVista and Themed and IsThemeActive and FIsComCtl6;

  IsDesignTime:= csDesigning in ComponentState;
  DrawCustom := CustomIconsEnabled and (CustomIconsDirectory <> '') and (not IsDesignTime);
  LoadedCustom := False;

  if DrawCustom then
  begin
    icoHeight:= 13;
    ico := TIcon.Create;
    try
      if Checked then
      begin
        if not Enabled then
           AssignIconCustom(icoRadioButton_Checked_Disabled)
        else
        if Down then
           AssignIconCustom(icoRadioButton_Checked_Down)
        else
        if FHot then
           AssignIconCustom(icoRadioButton_Checked_Hot)
        else
           AssignIconCustom(icoRadioButton_Checked);
      end
      else
      begin
        if not Enabled then
           AssignIconCustom(icoRadioButton_Unchecked_Disabled)
        else
        if Down then
           AssignIconCustom(icoRadioButton_Unchecked_Down)
        else
        if FHot then
           AssignIconCustom(icoRadioButton_Unchecked_Hot)
        else
           AssignIconCustom(icoRadioButton_Unchecked);
      end;

      LoadedCustom := not ico.Empty;
      if LoadedCustom then
      begin
        case FBtnVAlign of
          //tlTop: BT := 4;
          tlTop: BT    := 2 + (ACanvas.TextHeight('gh') - icoHeight) div 2;
          tlCenter: BT := (ClientRect.Bottom-ClientRect.Top) div 2 - (icoHeight div 2);
          tlBottom: BT := ClientRect.Bottom - icoHeight - 2;
        end;

        if (FAlignment = taRightJustify) or UseRightToLeftAlignment then
          BL := ClientRect.Right - icoHeight
        else
          BL := 0;

        DrawBk(BL, BT, icoHeight);
        ACanvas.Draw(BL, BT, ico);
      end;
    finally
    end;
    ico.Free;
    if LoadedCustom then
       Exit;
  end;

  if DrawThemed then
  begin
    HTheme := OpenThemeData(Self.Handle, 'button');
    Err:= GetThemePartSize(HTheme, Self.Handle, BP_RADIOBUTTON, RBS_CHECKEDNORMAL, nil, TS_TRUE, iSize); // added by Ciro Alfredo Consentino (August 05, 2019)

    case FBtnVAlign of
    //tlTop: BT := 4;
    tlTop:    BT := 2 + (ACanvas.TextHeight('gh') - iSize.cy) div 2;
    tlCenter: BT := (ClientRect.Bottom - ClientRect.Top) div 2 - (iSize.cy div 2);
    tlBottom: BT := ClientRect.Bottom - iSize.cy;
    end;

    if (FAlignment = taRightJustify) or UseRightToLeftAlignment then
       BL := ClientRect.Right - iSize.cy - 1
    else
       BL := 0; // -> fix to match Delphi's VCL themed TRadioButton

    r := Rect(BL, BT, BL + iSize.cy, BT + iSize.cy);

    if HTheme <> 0 then
    begin
      DrawBk(r.Left, r.Top, iSize.cy);
      if Checked then
      begin
        if not Enabled then
           ThemedStateID:= RBS_CHECKEDDISABLED
        else
        if Down then
           ThemedStateID:= RBS_CHECKEDNORMAL or RBS_PUSHED
        else
        if FHot then
           ThemedStateID:= RBS_CHECKEDHOT or RBS_HOT
        else
           ThemedStateID:= RBS_CHECKEDNORMAL;
      end
      else
      begin
        if not Enabled then
           ThemedStateID:= RBS_UNCHECKEDDISABLED
        else
        if Down then
           ThemedStateID:= RBS_UNCHECKEDNORMAL or RBS_PUSHED
        else
        if FHot then
           ThemedStateID:= RBS_UNCHECKEDHOT or RBS_HOT
        else
           ThemedStateID:= RBS_UNCHECKEDNORMAL;
      end;

      DrawThemeBackground(HTheme, ACanvas.Handle, BP_RADIOBUTTON, ThemedStateID, @r, nil);
      CloseThemeData(HTheme);
    end
    else
      DrawThemed := False;
  end;

  if not DrawThemed then
  begin
    bmp := TBitmap.Create;
    if Checked then
    begin
      if IsDesignTime then // added by Ciro Alfredo Consentino (August 06, 2019)
         resStr:= 'RADIOBUTTON_CHECKED'
      else
      if Down then
         resStr:= 'RADIOBUTTON_CHECKED_DOWN'
      else
      if FHot then
         resStr:= 'RADIOBUTTON_CHECKED_HOT'
      else
         resStr:= 'RADIOBUTTON_CHECKED';
    end
    else
    begin
      if IsDesignTime then // added by Ciro Alfredo Consentino (August 06, 2019)
         resStr:= 'RADIOBUTTON_UNCHECKED'
      else
      if Down then
         resStr:= 'RADIOBUTTON_UNCHECKED_DOWN'
      else
      if FHot then
         resStr:= 'RADIOBUTTON_UNCHECKED_HOT'
      else
         resStr:= 'RADIOBUTTON_UNCHECKED';
    end;

    bmp.LoadFromResourceName(hInstance, resStr);
    bmp.Transparent:= True;
    bmp.TransparentMode:= tmAuto;

    case FBtnVAlign of
    //tlTop: BT := 4;
    tlTop:    BT := 2 + (ACanvas.TextHeight('gh') - bmp.Height) div 2;
    tlCenter: BT := (ClientRect.Bottom-ClientRect.Top) div 2 - (bmp.Height div 2);
    tlBottom: BT := ClientRect.Bottom - bmp.Height - 2;
    end;

    if (FAlignment = taRightJustify) or UseRightToLeftAlignment then
      BL := ClientRect.Right - bmp.Width
    else
      BL := 0;

    DrawBk(BL, BT, bmp.Width);
    ACanvas.Draw(BL, BT, bmp);
    bmp.Free;
  end;
end;

procedure TCustomAdvOfficeRadioButton.Paint;
var
  BR:Integer;
  R: TRect;
  text: String;
  XSize, YSize: Integer;
  FontColor: TColor;
  CanvasBMP: TBitmap;
begin
  Canvas.Brush.Style:= bsClear;
  
  CanvasBMP := TBitmap.Create;
  CanvasBMP.Width := Self.Width;
  CanvasBMP.Height:= Self.Height;
  CanvasBMP.Canvas.Brush.Style:= bsClear;
  CanvasBMP.Canvas.Lock;

  if FTransparentCaching then
  begin
    if FBkgCache then
    begin
      Self.Canvas.Draw(0, 0, FBkgBmp);
    end
    else
    begin
      FBkgBmp.Width := Self.Width;
      FBkgBmp.Height := Self.Height;
      //FBkgBmp.PixelFormat := pf32bit;
      DrawParentImage(Self, FBkgBmp.Canvas);
      Self.Canvas.Draw(0, 0, FBkgBmp);
      FBkgCache := True;
    end;
  end
  else
  begin
    if DrawBkg or IsVista then
       DrawParentImage(Self, CanvasBMP.Canvas);
  end;

  FParentBk.Width  := Self.Width;
  FParentBk.Height := Self.Height;
  FParentBk.Canvas.CopyRect(FParentBk.Canvas.ClipRect, CanvasBMP.Canvas, Canvas.ClipRect);

  Canvas.Font := Font;
  CanvasBMP.Canvas.Font := Font;
  if not Enabled then
     CanvasBMP.Canvas.Font.Color := DisabledFontColor;

  Text := Caption;

  with CanvasBMP.Canvas do
  begin
    CanvasBMP.Canvas.Brush.Style := bsClear;
    BR := 13;
    DrawRadio(CanvasBMP.Canvas);

    r := GetClientRect;
    if (FAlignment = taRightJustify) or UseRightToLeftAlignment then
    begin
      r.Left := 0;
      r.Right := r.Right - BR - 3; // fix to match Delphi's VCL theme RadioButton's text
    end
    else
      r.Left := r.Left + BR + 3; // fix to match Delphi's VCL theme RadioButton's text

    r.Top := r.Top + 4;

    CanvasBMP.Canvas.Brush.Style := bsClear;
    if (BidiMode = bdRightToLeft) then// and (pos('</',Text) = 0) then
    begin
      if FShadowEnabled then
      begin
        if not Enabled then
           begin
             FontColor := DisabledFontColor;
             CanvasBMP.Canvas.Font.Color:= FDisabledFontShadowColor;
           end
        else
           begin
             FontColor:= Font.Color;
             CanvasBMP.Canvas.Font.Color := FShadowColor;
           end;
        OffsetRect(r, 1, 1);

        DrawText(CanvasBMP.Canvas.Handle, PChar(Text), Length(Text), r, DT_RIGHT);

        CanvasBMP.Canvas.Font.Color := FontColor;
        OffsetRect(r, -1, -1);
      end;
      DrawText(CanvasBMP.Canvas.Handle, PChar(Text), Length(Text), r, DT_RIGHT);
    end
    else
    begin
      CanvasBMP.Canvas.Brush.Style := bsClear;
      if UseRightToLeftAlignment then
         r.Left := r.Right - Xsize - 3;

      //if ButtonVertAlign in [tlCenter, tlBottom, tlTop] then
      //begin
        YSize:= CanvasBMP.Canvas.TextHeight('gh');
        case ButtonVertAlign of
          tlCenter: r.Top := r.Top - 3 + (r.Bottom - r.Top - YSize) div 2;
          tlBottom: r.Top := r.Bottom - YSize - 3;
          tlTop   : r.Top := r.Top -2;
        end;
      //end;

      if FShadowEnabled then
      begin
        if not Enabled then
           begin
             FontColor := DisabledFontColor;
             CanvasBMP.Canvas.Font.Color := FDisabledFontShadowColor;
           end
        else
           begin
             FontColor:= Font.Color;
             CanvasBMP.Canvas.Font.Color := FShadowColor;
           end;
        OffsetRect(r, 1, 1);

        DrawText(CanvasBMP.Canvas.Handle, PChar(Text), Length(Text), r, DT_LEFT);
        CanvasBMP.Canvas.Font.Color := FontColor;
        OffsetRect(r, -1, -1);
      end;
      DrawText(CanvasBMP.Canvas.Handle, PChar(Text), Length(Text), r, DT_LEFT);
    end;

    R.Right := R.Left + XSize + 1;
    R.Left := ClientRect.Left;
    R.Bottom := ClientRect.Bottom - 1;
    R.Top := R.Top - 1;
  end;

  CanvasBMP.Canvas.Unlock;
  Canvas.Draw(0, 0, CanvasBMP);
  CanvasBMP.Free;
end;

procedure TCustomAdvOfficeRadioButton.SetDown(Value: Boolean);
begin
  if FDown <> Value then
  begin
    FDown := Value;
  end;
end;

procedure TCustomAdvOfficeRadioButton.TurnSiblingsOff;
var
  i:Integer;
  Sibling: TAdvOfficeRadioButtonEx;
begin
  if Parent <> nil then
  for i:=0 to Parent.ControlCount-1 do
  begin
    if Parent.Controls[i] is TAdvOfficeRadioButtonEx then
    begin
      Sibling := TAdvOfficeRadioButtonEx(Parent.Controls[i]);
      if (Sibling <> Self) and (Sibling.GroupIndex = GroupIndex) then
         Sibling.SetChecked(False);
    end;
  end;
end;

procedure TCustomAdvOfficeRadioButton.SetChecked(Value: Boolean);
{$IFDEF DELPHI2006_LVL}
var
  r: TRect;
{$ENDIF}
begin
  if FChecked <> Value then
  begin
    TabStop := Value;
    FChecked := Value;
    if Value then
    begin
      TurnSiblingsOff;
      if not FClicksDisabled then
         DoClick;
    end;

    {$IFDEF DELPHI2006_LVL}
    if HandleAllocated and HasParent then
    begin
      R := ClientRect;
      if (BiDiMode = bdLeftToRight) and (Alignment = taLeftJustify) then
      begin
        R.Right := 16; // should this be commented ? it is on latest TMS component version
        InvalidateRect(Self.Handle, @r, true);
      end
      else
        Invalidate;
    end;
    {$ENDIF}

    {$IFNDEF DELPHI2006_LVL}
    Invalidate;
    {$ENDIF}
  end;
end;

procedure TCustomAdvOfficeRadioButton.DoClick;
begin
  if not (csLoading in ComponentState) then
  begin
    {$IFDEF DELPHI_UNICODE}
    if Assigned(OnClick) and (Action <> nil) and not DelegatesEqual(@OnClick, @Action.OnExecute) then
       OnClick(Self)
    else
    {$ENDIF}

    if not (csDesigning in ComponentState) and (ActionLink <> nil) then
       ActionLink.Execute(Self)
    else

    if Assigned(OnClick) then
      OnClick(Self);
  end;
end;

procedure TCustomAdvOfficeRadioButton.DoEnter;
{$IFNDEF DELPHI9_LVL}
var
  R: TRect;
{$ENDIF}
begin
  FCheckDown := Checked;
  inherited DoEnter;
  FFocused := True;
  Checked := True;
  {$IFDEF DELPHI9_LVL}
  Repaint;
  {$ELSE}
  R := ClientRect;
  R.Right := 16;
  InvalidateRect(Self.Handle, @R, true);
  {$ENDIF}
end;

procedure TCustomAdvOfficeRadioButton.DoExit;
var
  db: Boolean;
begin
  inherited DoExit;
  FFocused := False;
  db := FDrawBkg;
  FDrawBkg := True;
  Repaint;
  FDrawBkg := db;
end;

procedure TCustomAdvOfficeRadioButton.MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
  {$IFDEF DELPHI2006_LVL}
var
  R: TRect;
  {$ENDIF}
begin
  FGotClick := True;

  if (Self.CanFocus and not (csDesigning in ComponentState)) then
  begin
    SetFocus;
    FFocused := True;
  end;

  inherited MouseDown(Button, Shift, X, Y);
  MouseCapture := True;
  Down := True;

  {$IFNDEF DELPHI2006_LVL}
  Invalidate;
  {$ENDIF}
  {$IFDEF DELPHI2006_LVL}

  if Alignment = taLeftJustify then
  begin
    R := ClientRect;
    R.Right := 16;
    InvalidateRect(self.Handle, @r, true);
  end
  else
    Invalidate;
  {$ENDIF}
end;

procedure TCustomAdvOfficeRadioButton.MouseUp(Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
{$IFDEF DELPHI2006_LVL}
var
  R: TRect;
{$ENDIF}
begin
  MouseCapture := False;
  Down := False;

  if (X >= 0) and (X <= Width) and (Y >= 0) and (Y <= Height) and not Checked and FGotClick then
  begin
    Checked := True;
  end;

  inherited MouseUp(Button, Shift, X, Y);

  if FGotClick then
     DoClick;

  {$IFNDEF DELPHI2006_LVL}
  Invalidate;
  {$ENDIF}
  {$IFDEF DELPHI2006_LVL}
  if Alignment = taLeftJustify then
  begin
    R := ClientRect;
    R.Right := 16;
    InvalidateRect(self.Handle, @r, true);
  end
  else
    Invalidate;
  {$ENDIF}
  FGotClick := False;
end;

procedure TCustomAdvOfficeRadioButton.MouseMove(Shift: TShiftState; X, Y: Integer);
begin
  if MouseCapture then
     Down := (X >= 0) and (X <= Width) and (Y >= 0) and (Y <= Height);
  inherited MouseMove(Shift, X, Y);
end;

procedure TCustomAdvOfficeRadioButton.KeyDown(var Key: Word; Shift: TShiftState);
begin
  if (Key = VK_RETURN) and (FReturnIsTab) then
  begin
    Key := VK_TAB;
    PostMessage(Self.Handle, WM_KEYDOWN, VK_TAB, 0);
  end;

  if Key = VK_SPACE then
     Down := True;

  inherited KeyDown(Key, Shift);
end;

procedure TCustomAdvOfficeRadioButton.KeyUp(var Key: Word; Shift: TShiftState);
begin
  if Key = VK_SPACE then
  begin
    Down := False;
    if not Checked then
       begin
         Checked := True;
         DoClick; // is this necessary ??
       end;
  end;
end;

procedure TCustomAdvOfficeRadioButton.SetImages(const Value: TImageList);
begin
  FImages := Value;
  Invalidate;
end;

procedure TCustomAdvOfficeRadioButton.Notification(AComponent: TComponent; AOperation: TOperation);
begin
  inherited;
  if (AOperation = opRemove) and (AComponent = FImages) then
    FImages := nil;
end;

procedure TCustomAdvOfficeRadioButton.CMEnabledChanged(var Message: TMessage);
begin
  inherited;
  Invalidate;
end;

procedure TCustomAdvOfficeRadioButton.SetButtonVertAlign(const Value: TTextLayout);
begin
  if Value <> FBtnVAlign then
  begin
    FBtnVAlign := Value;
    Invalidate;
  end;
end;

procedure TCustomAdvOfficeRadioButton.SetAlignment(const Value: TLeftRight);
begin
  if FAlignment <> Value then
  begin
    FAlignment := Value;
    Invalidate;
  end;
end;

destructor TCustomAdvOfficeRadioButton.Destroy;
begin
  FBkgBmp.Free;
  FParentBk.Free;
  //FImageCache.Free;
  if not (csDesigning in ComponentState) then
  begin
    icoRadioButton_Checked.Free;
    icoRadioButton_Checked_Down.Free;
    icoRadioButton_Checked_Hot.Free;
    icoRadioButton_Checked_Disabled.Free;
    icoRadioButton_Unchecked.Free;
    icoRadioButton_Unchecked_Down.Free;
    icoRadioButton_Unchecked_Hot.Free;
    icoRadioButton_Unchecked_Disabled.Free;
  end;

  inherited;
end;

procedure TCustomAdvOfficeRadioButton.SetEllipsis(const Value: Boolean);
begin
  if FEllipsis <> Value then
  begin
    FEllipsis := Value;
    Invalidate;
  end;
end;

procedure TCustomAdvOfficeRadioButton.SetCaption(const Value: String);
begin
  inherited Caption := Value;
  FCaption := Value;
  Invalidate;
end;

procedure TCustomAdvOfficeRadioButton.Click;
begin
//  inherited;
end;

procedure TCustomAdvOfficeRadioButton.CMDialogChar(var Message: TCMDialogChar);
begin
  with Message do
  begin
    if IsAccel(CharCode, FCaption) and CanFocus then
    begin
      Checked := True;
      if TabStop then
         if (Self.CanFocus and not (csDesigning in ComponentState)) then
            SetFocus;
      Result := 1;
    end
    else
      inherited;
  end;
end;

procedure TCustomAdvOfficeRadioButton.SetShadowEnabled(const Value: Boolean);
begin
  if FShadowEnabled <> Value then
  begin
    FShadowEnabled := Value;
    Invalidate;
  end;
end;

procedure TCustomAdvOfficeRadioButton.SetShadowColor(const Value: TColor);
begin
  if FShadowColor <> Value then
  begin
    FShadowColor := Value;
    Invalidate;
  end;
end;

procedure TCustomAdvOfficeRadioButton.SetThemed(const Value: boolean);
begin
  if Value <> FThemed then
  begin
    FThemed := Value;
    Invalidate;
  end;
end;

procedure TCustomAdvOfficeRadioButton.SetCustomIconsEnabled(Value: Boolean);  // added by Ciro Alfredo Consentino (August 16, 2019)
begin
  if FCustomIconsEnabled <> Value then
  begin
    FCustomIconsEnabled:= Value;
    if FCustomIconsDirectory = '' then
       Exit; // do not let icons be initialized
    if csDesigning in ComponentState then
       Exit;
    if FCustomIconsEnabled then
       LoadCustomIcons;
    Invalidate;
  end;
end;

procedure TCustomAdvOfficeRadioButton.SetCustomIconsDirectory(Value: String); // added by Ciro Alfredo Consentino (August 16, 2019)
begin
  if FCustomIconsDirectory <> Value then
  begin
    FCustomIconsDirectory:= Value;
    if csDesigning in ComponentState then
       Exit;
    if FCustomIconsEnabled then
    begin
      LoadCustomIcons;
      Invalidate;
    end;
  end;
end;

procedure TCustomAdvOfficeRadioButton.LoadCustomIcons;

  procedure LoadIconFile(var iIconVar: TIcon; const iFileName: String);
  begin
    if FCustomIconsDirectory <> '' then
       if FileExists(FCustomIconsDirectory+iFileName) then
          iIconVar.LoadFromFile(FCustomIconsDirectory+iFileName);
  end;

begin
  if csDesigning in ComponentState then
     Exit;
  LoadIconFile(icoRadioButton_Checked,            'radiobutton_checked.ico');
  LoadIconFile(icoRadioButton_Checked_Down,       'radiobutton_checked_down.ico');
  LoadIconFile(icoRadioButton_Checked_Hot,        'radiobutton_checked_hot.ico');
  LoadIconFile(icoRadioButton_Checked_Disabled,   'radiobutton_checked_disabled.ico');
  LoadIconFile(icoRadioButton_Unchecked,          'radiobutton_unchecked.ico');
  LoadIconFile(icoRadioButton_Unchecked_Down,     'radiobutton_unchecked_down.ico');
  LoadIconFile(icoRadioButton_Unchecked_Hot,      'radiobutton_unchecked_hot.ico');
  LoadIconFile(icoRadioButton_Unchecked_Disabled, 'radiobutton_unchecked_disabled.ico');
end;

procedure TCustomAdvOfficeRadioButton.CMMouseEnter(var Message: TMessage);
begin
  FHot := True;
  DrawRadio(Self.Canvas);
  inherited;
end;

procedure TCustomAdvOfficeRadioButton.CMMouseLeave(var Message: TMessage);
begin
  FHot := False;
  DrawRadio(Self.Canvas);
  inherited;
end;

procedure TCustomAdvOfficeRadioButton.WMEraseBkGnd(var Message: TMessage);
begin
  {$IFDEF DELPHI_UNICODE}
  inherited;
  {$ENDIF}
  {$IFNDEF DELPHI_UNICODE}
  Message.Result := 1;
  {$ENDIF}
end;

procedure TCustomAdvOfficeRadioButton.WMLButtonDblClk(var Message: TWMLButtonDblClk);
begin
  inherited;
  if Assigned(Parent) and (Parent is TCustomAdvOfficeRadioGroup) then
  begin
    if Assigned((Parent as TCustomAdvOfficeRadioGroup).OnDblClick) then
      (Parent as TCustomAdvOfficeRadioGroup).OnDblClick(Parent);
  end;
end;

procedure TCustomAdvOfficeRadioButton.WMLButtonDown(var Message: TWMLButtonDown);
begin
  FClicksDisabled := True;
  if (Self.CanFocus and not (csDesigning in ComponentState)) then
     SetFocus;
  FClicksDisabled := False;
  inherited;
end;

procedure TCustomAdvOfficeRadioButton.Loaded;
begin
  inherited;
  FOldCursor := Cursor;
end;

procedure TCustomAdvOfficeRadioButton.ActionChange(Sender: TObject; CheckDefaults: Boolean);
begin
  inherited ActionChange(Sender, CheckDefaults);
  if Sender is TCustomAction then
  begin
    Caption := TCustomAction(Sender).Caption;
    Checked := TCustomAction(Sender).Checked;
    Enabled := TCustomAction(Sender).Enabled;
  end;
end;

function TCustomAdvOfficeRadioButton.GetActionLinkClass: TControlActionLinkClass;
begin
  Result := TAdvOfficeRadioButtonActionLink;
end;


{ TAdvOfficeRadioButtonActionLink }

procedure TAdvOfficeRadioButtonActionLink.AssignClient(AClient: TObject);
begin
  inherited AssignClient(AClient);
  FClient := AClient as TCustomAdvOfficeRadioButton;
end;

procedure TAdvOfficeRadioButtonActionLink.SetChecked(Value: Boolean);
begin
  FClient.FClicksDisabled := True;
  FClient.Checked := Value;
  FClient.FClicksDisabled := False;
end;

procedure TAdvOfficeRadioButtonActionLink.SetCaption(const Value: string);
begin
  FClient.Caption := Value;
end;


{ TAdvGroupButton }

type
  TAdvGroupButton = class(TAdvOfficeRadioButtonEx)
  private
    FInClick: Boolean;
    procedure CNCommand(var Message: TWMCommand); message CN_COMMAND;
  protected
    procedure MouseMove(Shift: TShiftState; X, Y: Integer); override;
    procedure KeyDown(var Key: Word; Shift: TShiftState); override;
    procedure KeyPress(var Key: Char); override;
  public
    constructor InternalCreate(RadioGroup: TCustomAdvOfficeRadioGroup);
    destructor Destroy; override;
  end;

constructor TAdvGroupButton.InternalCreate(RadioGroup: TCustomAdvOfficeRadioGroup);
begin
  inherited Create(RadioGroup);
  RadioGroup.FButtons.Add(Self);
  Visible := False;
  Enabled := RadioGroup.Enabled;
  ParentShowHint := False;
  OnClick := RadioGroup.ButtonClick;
  OnEnter := RadioGroup.CheckFocus;
  Parent := RadioGroup;
end;

destructor TAdvGroupButton.Destroy;
begin
  TCustomAdvOfficeRadioGroup(Owner).FButtons.Remove(Self);
  inherited Destroy;
end;

procedure TAdvGroupButton.CNCommand(var Message: TWMCommand);
begin
  if not FInClick then
  begin
    FInClick := True;
    try
      if ((Message.NotifyCode = BN_CLICKED) or
         (Message.NotifyCode = BN_DOUBLECLICKED)) and
         TCustomAdvOfficeRadioGroup(Parent).CanModify then
         inherited;
    except
      Application.HandleException(Self);
    end;
    FInClick := False;
  end;
end;

procedure TAdvGroupButton.KeyPress(var Key: Char);
begin
  inherited KeyPress(Key);

  TCustomAdvOfficeRadioGroup(Parent).PushKey(Key);

  if (Key = #8) or (Key = ' ') then
  begin
    if not TCustomAdvOfficeRadioGroup(Parent).CanModify then
       Key := #0;
  end;
end;

procedure TAdvGroupButton.MouseMove(Shift: TShiftState; X, Y: Integer);
begin
  inherited;

  if Assigned((Parent as TCustomAdvOfficeRadioGroup).OnMouseMove) then
  begin
    (Parent as TCustomAdvOfficeRadioGroup).OnMouseMove(Parent, Shift, X + Left, Y + Top);
  end;
end;

procedure TAdvGroupButton.KeyDown(var Key: Word; Shift: TShiftState);
begin
  inherited KeyDown(Key, Shift);
  TCustomAdvOfficeRadioGroup(Parent).PushKeyDown(Key, Shift);
end;

{ TCustomAdvOfficeRadioGroup }

constructor TCustomAdvOfficeRadioGroup.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  ControlStyle := [csSetCaption];
  FButtons := TList.Create;
  FItems := TStringList.Create;
  TStringList(FItems).OnChange := ItemsChange;
  FItemIndex := -1;
  FColumns := 1;
  FAlignment := taLeftJustify;
  FBtnVAlign := tlTop;
  ShadowEnabled := False;
  ShadowColor := clSilver;
  FIsReadOnly := False;
  FDisabledFontColor := DefDisabledColor;
  FDisabledFontShadowColor := clWhite;
end;

destructor TCustomAdvOfficeRadioGroup.Destroy;
begin
  SetButtonCount(0);
  TStringList(FItems).OnChange := nil;
  FItems.Free;
  FButtons.Free;
  inherited Destroy;
end;

procedure TCustomAdvOfficeRadioGroup.DoEnter;
begin
  inherited;

  if FButtons.Count > FFocusButtonIdx then
  begin
    if TAdvGroupButton(FButtons[FFocusButtonIdx]).HandleAllocated then
    begin
      TAdvGroupButton(FButtons[FFocusButtonIdx]).SetFocus;
      Invalidate;
    end;
  end;
end;

procedure TCustomAdvOfficeRadioGroup.DoExit;
begin
  inherited;
end;

procedure TCustomAdvOfficeRadioGroup.DoRadioButtonClick;
begin
  if Assigned(OnRadioButtonClick) then
     OnRadioButtonClick(Self);
end;

procedure TCustomAdvOfficeRadioGroup.PushKey(var Key: Char);
begin
  KeyPress(Key);
end;

procedure TCustomAdvOfficeRadioGroup.PushKeyDown(var Key: Word; Shift: TShiftState);
begin
  KeyDown(Key, Shift);
end;

procedure TCustomAdvOfficeRadioGroup.ArrangeButtons;
var
  ButtonsPerCol, ButtonWidth, ButtonHeight, TopMargin, I: Integer;
  DC: HDC;
  SaveFont: HFont;
  Metrics: TTextMetric;
  DeferHandle: THandle;
  ALeft: Integer;
  RadioEnable: Boolean;

begin
  if csLoading in ComponentState then
     Exit;

  if not HandleAllocated then
    Exit;

  if (FButtons.Count <> 0) and not FReading then
  begin
    DC := GetDC(0);
    SaveFont := SelectObject(DC, Font.Handle);
    GetTextMetrics(DC, Metrics);
    SelectObject(DC, SaveFont);
    ReleaseDC(0, DC);
    ButtonsPerCol := (FButtons.Count + FColumns - 1) div FColumns;
    ButtonWidth := (Width - 10) div FColumns;
    I := Height - Metrics.tmHeight - 5;
    ButtonHeight := I div ButtonsPerCol;
    TopMargin := Metrics.tmHeight + 1 + (I mod ButtonsPerCol) div 2;

    if Length(Caption) <= 0 then
       TopMargin := TopMargin - Metrics.tmHeight div 2;

    DeferHandle := BeginDeferWindowPos(FButtons.Count);
    try
      for I := 0 to FButtons.Count - 1 do
      begin
        with TAdvGroupButton(FButtons[I]) do
        begin
          BiDiMode := Self.BiDiMode;
          DrawBkg := False;
          Alignment := Self.Alignment;
          ButtonVertAlign := Self.ButtonVertAlign;
          Images := Self.Images;
          Ellipsis := Self.Ellipsis;
          ShadowEnabled := Self.ShadowEnabled;
          ShadowColor := Self.ShadowColor;
          DisabledFontColor := Self.DisabledFontColor;
          DisabledFontShadowColor := Self.DisabledFontShadowColor;
          Themed := Self.Themed;

          RadioEnable := Self.Enabled and not FIsReadOnly;

          if Assigned(FOnIsEnabled) then
             FOnIsEnabled(Self, I, RadioEnable);

          Enabled := RadioEnable; // Make sure Enabled setting before ArrangeButtons is preserved

          ALeft := (I div ButtonsPerCol) * ButtonWidth + 8;
          if UseRightToLeftAlignment then
             ALeft := Self.ClientWidth - ALeft - ButtonWidth;

          DeferHandle := DeferWindowPos(DeferHandle, Handle, 0,
                         ALeft,
                         (I mod ButtonsPerCol) * ButtonHeight + TopMargin,
                         ButtonWidth, ButtonHeight,
                         SWP_NOZORDER or SWP_NOACTIVATE);

          Visible := True; // should this be disabled ? (it is in latest TMS component version)
        end;
      end;
    finally
      EndDeferWindowPos(DeferHandle);
    end;
  end;
end;

procedure TCustomAdvOfficeRadioGroup.ButtonClick(Sender: TObject);
begin
  if not FUpdating then
  begin
    if CanModify then
    begin
      FItemIndex := FButtons.IndexOf(Sender);
      Changed;
      Click;
    end;
  end;
end;

procedure TCustomAdvOfficeRadioGroup.ItemsChange(Sender: TObject);
begin
  if not FReading then
  begin
    if FItemIndex >= FItems.Count then
       FItemIndex := FItems.Count - 1;
    UpdateButtons;
  end;
end;

procedure TCustomAdvOfficeRadioGroup.Loaded;
begin
  inherited Loaded;
  ArrangeButtons;
end;

procedure TCustomAdvOfficeRadioGroup.ReadState(Reader: TReader);
begin
  FReading := True;
  inherited ReadState(Reader);
  FReading := False;
  UpdateButtons;
end;

procedure TCustomAdvOfficeRadioGroup.SetButtonCount(Value: Integer);
begin
  while FButtons.Count < Value do TAdvGroupButton.InternalCreate(Self);
  while FButtons.Count > Value do TAdvGroupButton(FButtons.Last).Free;
end;

procedure TCustomAdvOfficeRadioGroup.SetClicksDisabled(const Value: Boolean);
var
  i: Integer;
begin
  FClicksDisabled := Value;

  for i := 0 to FButtons.Count - 1 do
      TAdvGroupButton(FButtons[i]).ClicksDisabled := Value;
end;

procedure TCustomAdvOfficeRadioGroup.SetColumns(Value: Integer);
begin
  if Value < 1 then Value := 1;
  if Value > 16 then Value := 16;
  if FColumns <> Value then
  begin
    FColumns := Value;
    ArrangeButtons;
    Invalidate;
  end;
end;

procedure TCustomAdvOfficeRadioGroup.SetItemIndex(Value: Integer);
begin
  if FReading then
     FItemIndex := Value
  else
  begin
    if Value < -1 then
       Value := -1;
    if Value >= FButtons.Count then
       Value := FButtons.Count - 1;
    if FItemIndex <> Value then
    begin
      if FItemIndex >= 0 then
         TAdvGroupButton(FButtons[FItemIndex]).Checked := False;
      FItemIndex := Value;
      if FItemIndex >= 0 then
         TAdvGroupButton(FButtons[FItemIndex]).Checked := True;
    end;
  end;
end;

procedure TCustomAdvOfficeRadioGroup.SetItems(Value: TStrings);
begin
  FItems.Assign(Value);
end;

procedure TCustomAdvOfficeRadioGroup.UpdateButtons;
var
  I: Integer;
begin
  SetButtonCount(FItems.Count);
  for I := 0 to FButtons.Count - 1 do
      TAdvGroupButton(FButtons[I]).Caption := FItems[I];

  if FItemIndex >= 0 then
  begin
    FUpdating := True;
    TAdvGroupButton(FButtons[FItemIndex]).Checked := True;
    FUpdating := False;
  end;

  ArrangeButtons;
  Invalidate;
end;

procedure TCustomAdvOfficeRadioGroup.CMEnabledChanged(var Message: TMessage);
var
  I: Integer;
begin
  inherited;

  //if CheckBox.Visible and not CheckBox.Checked then Exit; // should this code be enabled ? (it is in latest TMS components version)
  for I := 0 to FButtons.Count - 1 do
      TAdvGroupButton(FButtons[I]).Enabled := Enabled;
end;

procedure TCustomAdvOfficeRadioGroup.CMFontChanged(var Message: TMessage);
begin
  inherited;
  ArrangeButtons;
end;

procedure TCustomAdvOfficeRadioGroup.WMSize(var Message: TWMSize);
begin
  inherited;
  ArrangeButtons;
end;

function TCustomAdvOfficeRadioGroup.XYToItem(X, Y: Integer): Integer;
var
  i: Integer;
  r: TRect;
  pt: TPoint;
begin
  Result := -1;
  pt := Point(X, Y);
  for i := 0 to FButtons.Count - 1 do
  begin
    r := TAdvGroupButton(FButtons[i]).ClientRect;
    OffsetRect(r, TAdvGroupButton(FButtons[i]).Left, TAdvGroupButton(FButtons[i]).Top);
    if PtInRect(r, pt) then
    begin
      Result := i;
      Break;
    end;
  end;
end;

function TCustomAdvOfficeRadioGroup.CanModify: Boolean;
begin
  Result := True;
end;

procedure TCustomAdvOfficeRadioGroup.CheckFocus(Sender: TObject);
var
  i: integer;
begin
  for i := 0 to FButtons.Count - 1 do
  begin
    if TAdvGroupButton(FButtons[i]).Focused then
       FFocusButtonIdx := i;
  end;
end;

procedure TCustomAdvOfficeRadioGroup.GetChildren(Proc: TGetChildProc; Root: TComponent);
begin
end;

function TCustomAdvOfficeRadioGroup.GetRadioButton(Index: Integer): TAdvOfficeRadioButtonEx;
begin
  Result := TAdvGroupButton(FButtons[Index]);
end;

procedure TCustomAdvOfficeRadioGroup.SetAlignment(const Value: TAlignment);
begin
  FAlignment := Value;
  ArrangeButtons;
end;

procedure TCustomAdvOfficeRadioGroup.SetButtonVertAlign(const Value: TTextLayout);
begin
  fBtnVAlign := Value;
  ArrangeButtons;
end;

procedure TCustomAdvOfficeRadioGroup.SetImages(const Value: TImageList);
begin
  inherited Images := Value;
  FImages := Value;
  ArrangeButtons;
end;

procedure TCustomAdvOfficeRadioGroup.Notification(AComponent: TComponent; AOperation: TOperation);
begin
  inherited;

  if (AOperation = opRemove) and (AComponent = FImages) then
     FImages:= nil;
end;

procedure TCustomAdvOfficeRadioGroup.SetEllipsis(const Value: Boolean);
begin
  FEllipsis := Value;
  ArrangeButtons;
end;

procedure TCustomAdvOfficeRadioGroup.SetShadowEnabled(const Value: Boolean);
begin
  FShadowEnabled := Value;
  ArrangeButtons;
end;

procedure TCustomAdvOfficeRadioGroup.SetShadowColor(const Value: TColor);
begin
  FShadowColor := Value;
  ArrangeButtons;
end;

procedure TCustomAdvOfficeRadioGroup.SetThemed(const Value: Boolean);
begin
  if FThemed <> Value then
  begin
    FThemed := Value;
    ArrangeButtons;
  end;
end;


{ TGroupCheck }

type
  TGroupCheck = class(TAdvOfficeCheckBoxEx)
  private
    FInClick: Boolean;
    procedure CNCommand(var Message: TWMCommand); message CN_COMMAND;
  protected
    procedure MouseMove(Shift: TShiftState;X, Y: Integer); override;
    procedure KeyDown(var Key: Word; Shift: TShiftState); override;
    procedure KeyPress(var Key: Char); override;
  public
    constructor InternalCreate(CheckGroup: TCustomAdvOfficeCheckGroup);
    destructor  Destroy; override;
  end;

constructor TGroupCheck.InternalCreate(CheckGroup: TCustomAdvOfficeCheckGroup);
begin
  inherited Create(CheckGroup);
  CheckGroup.FButtons.Add(Self);
  Visible := False;
  Enabled := CheckGroup.Enabled;
  ParentShowHint := False;
  OnClick := CheckGroup.ButtonClick;
  OnEnter := CheckGroup.CheckFocus;
  Parent := CheckGroup;
end;

destructor TGroupCheck.Destroy;
begin
  TCustomAdvOfficeCheckGroup(Owner).FButtons.Remove(Self);
  inherited Destroy;
end;

procedure TGroupCheck.CNCommand(var Message: TWMCommand);
begin
  if not FInClick then
  begin
    FInClick := True;
    try
      if ((Message.NotifyCode = BN_CLICKED) or
         (Message.NotifyCode = BN_DOUBLECLICKED)) and
         TCustomAdvOfficeCheckGroup(Parent).CanModify then
         inherited;
    except
      Application.HandleException(Self);
    end;
    FInClick := False;
  end;
end;

procedure TGroupCheck.KeyPress(var Key: Char);
begin
  inherited KeyPress(Key);
  TCustomAdvOfficeCheckGroup(Parent).PushKey(Key);
  if (Key = #8) or (Key = ' ') then
  begin
    if not TCustomAdvOfficeCheckGroup(Parent).CanModify then
       Key := #0;
  end;
end;

procedure TGroupCheck.MouseMove(Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  if Assigned((Parent as TCustomAdvOfficeCheckGroup).OnMouseMove) then
  begin
    (Parent as TCustomAdvOfficeCheckGroup).OnMouseMove(Parent, Shift, X + Left, Y + Top);
  end;
end;

procedure TGroupCheck.KeyDown(var Key: Word; Shift: TShiftState);
begin
  inherited KeyDown(Key, Shift);
  TCustomAdvOfficeCheckGroup(Parent).PushKeyDown(Key, Shift);
end;


{ TCustomAdvOfficeCheckGroup }

constructor TCustomAdvOfficeCheckGroup.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  ControlStyle := [csSetCaption, csDoubleClicks];
  FButtons := TList.Create;
  FItems := TStringList.Create;
  TStringList(FItems).OnChange := ItemsChange;
  FColumns := 1;
  FAlignment := taLeftJustify;
  FBtnVAlign := tlTop;
  ShadowEnabled := False;
  ShadowColor := clSilver;
  FDisabledFontColor := DefDisabledColor;
  FDisabledFontShadowColor := clWhite;  
  FValue := 0;
end;

destructor TCustomAdvOfficeCheckGroup.Destroy;
begin
  SetButtonCount(0);
  TStringList(FItems).OnChange := nil;
  FItems.Free;
  FButtons.Free;
  inherited Destroy;
end;

procedure TCustomAdvOfficeCheckGroup.PerformCheckBoxAction;
var
  i: Integer;
begin
  if not (csDesigning in ComponentState) and Enabled and CheckBox.Visible and
         (CheckBox.State in [cbChecked, cbUnChecked]) and (CheckBox.Action <> AdvGroupBox.caNone) then
  begin
    if (CheckBox.Action = caCheckAll) then
    begin
      for i := 0 to Fbuttons.Count - 1 do
          Checked[I] := CheckBox.State = cbChecked;
    end;
  end;
end;

procedure TCustomAdvOfficeCheckGroup.PushKey(var Key: Char);
begin
  KeyPress(Key);
end;

procedure TCustomAdvOfficeCheckGroup.PushKeyDown(var Key: Word; Shift: TShiftState);
begin
  KeyDown(Key, Shift);
end;

procedure TCustomAdvOfficeCheckGroup.ArrangeButtons;
var
  ButtonsPerCol, ButtonWidth, ButtonHeight, TopMargin, I: Integer;
  DC: HDC;
  SaveFont: HFont;
  Metrics: TTextMetric;
  DeferHandle: THandle;
  ALeft: Integer;
  RadioEnable: Boolean;
begin
  if (FButtons.Count <> 0) and not FReading then
  begin
    DC := GetDC(0);
    SaveFont := SelectObject(DC, Font.Handle);
    GetTextMetrics(DC, Metrics);
    SelectObject(DC, SaveFont);
    ReleaseDC(0, DC);
    ButtonsPerCol := (FButtons.Count + FColumns - 1) div FColumns;
    ButtonWidth := (Width - 10) div FColumns;
    I := Height - Metrics.tmHeight - 5;
    ButtonHeight := I div ButtonsPerCol;
    TopMargin := Metrics.tmHeight + 1 + (I mod ButtonsPerCol) div 2;

	if Length(Caption) <= 0 then
     TopMargin := TopMargin - Metrics.tmHeight div 2;

    DeferHandle := BeginDeferWindowPos(FButtons.Count);
    try
      for I := 0 to FButtons.Count - 1 do
      begin
        with TGroupCheck(FButtons[I]) do
        begin
          BiDiMode := Self.BiDiMode;
          DrawBkg := False;
          Alignment := Self.Alignment;
          ButtonVertAlign := Self.ButtonVertAlign;
          Images := Self.Images;
          Ellipsis := Self.Ellipsis;
          ShadowEnabled := Self.ShadowEnabled;
          ShadowColor := self.ShadowColor;
          DisabledFontColor := Self.DisabledFontColor;
          DisabledFontShadowColor := Self.DisabledFontShadowColor;
          Themed := Self.Themed;

          RadioEnable := Self.Enabled;
          if Assigned(FOnIsEnabled) then
             FOnIsEnabled(Self, I, RadioEnable);

          Enabled := RadioEnable;

          ALeft := (I div ButtonsPerCol) * ButtonWidth + 8;
          if UseRightToLeftAlignment then
             ALeft := Self.ClientWidth - ALeft - ButtonWidth;

          DeferHandle := DeferWindowPos(DeferHandle, Handle, 0,
                         ALeft,
                         (I mod ButtonsPerCol) * ButtonHeight + TopMargin,
                         ButtonWidth, ButtonHeight,
                         SWP_NOZORDER or SWP_NOACTIVATE);
          Visible := True;
        end;
      end;
    finally
      EndDeferWindowPos(DeferHandle);
    end;
  end;
end;

procedure TCustomAdvOfficeCheckGroup.CheckFocus(Sender: TObject);
var
  i: Integer;
begin
  for i := 0 to FButtons.Count - 1 do
  begin
    if TGroupCheck(FButtons[i]).Focused then
       FFocusButtonIdx := i;
  end;
end;

procedure TCustomAdvOfficeCheckGroup.ButtonClick(Sender: TObject);
begin
  if not FUpdating then
  begin
    Changed;
    Click;
    DoCheckBoxClick((Sender as TGroupCheck).Tag, (Sender as TGroupCheck).Checked);
  end;
  UpdateValue;
end;

procedure TCustomAdvOfficeCheckGroup.ItemsChange(Sender: TObject);
begin
  if not FReading then
  begin
    UpdateButtons;
  end;
end;

procedure TCustomAdvOfficeCheckGroup.DoExit;
begin
  inherited;
end;

procedure TCustomAdvOfficeCheckGroup.DoGroupCheckClick;
begin
  inherited;
  if Assigned(OnGroupCheckClick) then
     OnGroupCheckClick(Self);
end;

procedure TCustomAdvOfficeCheckGroup.DoCheckBoxClick(Index: Integer; Value: Boolean);
begin
  if Assigned(OnCheckBoxClick) then
     OnCheckBoxClick(Self, Index, Value);
end;

procedure TCustomAdvOfficeCheckGroup.DoEnter;
var
  i: Integer;
  found: Boolean;
begin
  inherited;

  if FButtons.Count > FFocusButtonIdx then
  begin
    if TGroupCheck(FButtons[FFocusButtonIdx]).HandleAllocated then
    begin
      if ReadOnly[FFocusButtonIdx] then
      begin
        found := False;
        for i := 0 to Items.Count - 1 do
        begin
          if not ReadOnly[i] then
          begin
            FFocusButtonIdx := i;
            found := True;
            Break;
          end;
        end;
        if not found then
           Exit;
      end;

      TGroupCheck(FButtons[FFocusButtonIdx]).SetFocus;
      Invalidate;
    end;
  end;
end;

procedure TCustomAdvOfficeCheckGroup.Loaded;
begin
  inherited Loaded;
  ArrangeButtons;
  Value := Value;
end;

procedure TCustomAdvOfficeCheckGroup.ReadState(Reader: TReader);
begin
  FReading := True;
  inherited ReadState(Reader);
  FReading := False;
  UpdateButtons;
end;

procedure TCustomAdvOfficeCheckGroup.SetButtonCount(Value: Integer);
begin
  while FButtons.Count < Value do
        TGroupCheck.InternalCreate(Self);
  while FButtons.Count > Value do
        TGroupCheck(FButtons.Last).Free;
end;

procedure TCustomAdvOfficeCheckGroup.SetColumns(Value: Integer);
begin
  if Value < 1 then Value := 1;
  if Value > 16 then Value := 16;
  if FColumns <> Value then
  begin
    FColumns := Value;
    ArrangeButtons;
    Invalidate;
  end;
end;

procedure TCustomAdvOfficeCheckGroup.SetItems(Value: TStrings);
begin
  FItems.Assign(Value);
end;

procedure TCustomAdvOfficeCheckGroup.UpdateButtons;
var
  I: Integer;
begin
  SetButtonCount(FItems.Count);
  for I := 0 to FButtons.Count - 1 do
  begin
    TGroupCheck(FButtons[I]).Caption := FItems[I];
    TGroupCheck(FButtons[I]).Tag := I;
  end;
  ArrangeButtons;
  Invalidate;
end;

procedure TCustomAdvOfficeCheckGroup.CMEnabledChanged(var Message: TMessage);
var
  I: Integer;
begin
  inherited;
  for I := 0 to FButtons.Count - 1 do
      TGroupCheck(FButtons[I]).Enabled := Enabled;
end;

procedure TCustomAdvOfficeCheckGroup.CMFontChanged(var Message: TMessage);
begin
  inherited;
  ArrangeButtons;
end;

procedure TCustomAdvOfficeCheckGroup.WMSize(var Message: TWMSize);
begin
  inherited;
  ArrangeButtons;
end;

function TCustomAdvOfficeCheckGroup.XYToItem(X, Y: Integer): Integer;
var
  i: Integer;
  r: TRect;
  pt: TPoint;
begin
  Result := -1;
  pt := Point(X, Y);
  for i := 0 to FButtons.Count - 1 do
  begin
    r :=  TGroupCheck(FButtons[i]).ClientRect;
    OffsetRect(r, TGroupCheck(FButtons[i]).Left, TGroupCheck(FButtons[i]).Top);
    if PtInRect(r, pt) then
    begin
      Result := i;
      Break;
    end;
  end;
end;

function TCustomAdvOfficeCheckGroup.CanModify: Boolean;
begin
  Result := True;
end;

procedure TCustomAdvOfficeCheckGroup.GetChildren(Proc: TGetChildProc; Root: TComponent);
begin
end;

procedure TCustomAdvOfficeCheckGroup.SetAlignment(const Value: TAlignment);
begin
  FAlignment := Value;
  ArrangeButtons;
end;

procedure TCustomAdvOfficeCheckGroup.SetButtonVertAlign(const Value: TTextLayout);
begin
  fBtnVAlign := Value;
  ArrangeButtons;
end;

procedure TCustomAdvOfficeCheckGroup.SetImages(const Value: TImageList);
begin
  inherited Images := Value;
  FImages := Value;
  ArrangeButtons;
end;

procedure TCustomAdvOfficeCheckGroup.Notification(AComponent: TComponent; AOperation: TOperation);
begin
  inherited;
  if (AOperation = opRemove) and (AComponent = FImages) then
     FImages := nil;
end;

procedure TCustomAdvOfficeCheckGroup.SetEllipsis(const Value: Boolean);
begin
  if FEllipsis <> Value then
  begin
    FEllipsis := Value;
    ArrangeButtons;
  end;
end;

procedure TCustomAdvOfficeCheckGroup.SetShadowEnabled(const Value: Boolean);
begin
  if FShadowEnabled <> Value then
  begin
    FShadowEnabled := Value;
    ArrangeButtons;
  end;
end;

procedure TCustomAdvOfficeCheckGroup.SetShadowColor(const Value: TColor);
begin
  if FShadowColor <> Value then
  begin
    FShadowColor := Value;
    ArrangeButtons;
  end;
end;

procedure TCustomAdvOfficeCheckGroup.SetThemed(const Value: Boolean);
begin
  if FThemed <> Value then
  begin
    FThemed := Value;
    ArrangeButtons;
  end;
end;

function TCustomAdvOfficeCheckGroup.GetChecked(Index: Integer): Boolean;
begin
  if (Index < FButtons.Count)  and (Index >= 0) then
     Result := TGroupCheck(FButtons[Index]).Checked
  else
     raise Exception.Create('Invalid checkbox index');
end;

procedure TCustomAdvOfficeCheckGroup.SetChecked(Index: Integer; const Value: Boolean);
begin
  if (Index < FButtons.Count)  and (Index >= 0) then
  begin
    TGroupCheck(FButtons[Index]).FInternalClick := True;
    TGroupCheck(FButtons[Index]).Checked := Value;
    TGroupCheck(FButtons[Index]).FInternalClick := False;
  end;
end;

function TCustomAdvOfficeCheckGroup.GetReadOnly(Index: Integer): Boolean;
begin
  if (Index < FButtons.Count)  and (Index >= 0) then
     Result := not TGroupCheck(FButtons[Index]).Enabled
  else
     raise Exception.Create('Invalid checkbox index');
end;

procedure TCustomAdvOfficeCheckGroup.SetReadOnly(Index: Integer; const Value: Boolean);
begin
  if (Index < FButtons.Count)  and (Index >= 0) then
     TGroupCheck(FButtons[Index]).Enabled := not Value;
end;

procedure TCustomAdvOfficeCheckGroup.UpdateValue;
var
  i, j: Integer;
  BitMask: Int64;
begin
  FValue := Value;
  j := Min(FButtons.Count, SizeOf(DWord) * 8);
  BitMask := 1;
  FValue := 0;
  for i := 0 to j - 1 do
  begin
    if TGroupCheck(FButtons[i]).Checked then
    begin
      FValue := FValue or BitMask;
    end;
    BitMask := BitMask * 2;
  end;
end;

function TCustomAdvOfficeCheckGroup.GetValue: Int64;
begin
  Result := FValue;
end;

procedure TCustomAdvOfficeCheckGroup.SetValue(const Value: Int64);
var
  i, j: Integer;
  BitMask: Int64;
begin
  //if (FValue <> Value) then
  begin
    FValue := Value;
    j := Min(FButtons.Count, SizeOf(Int64) * 8);
    BitMask := 1;
    for i := 0 to j - 1 do
    begin
      TGroupCheck(FButtons[i]).Checked := ((FValue And BitMask) > 0);
      BitMask := BitMask * 2;
    end;
  end;
end;

procedure TAdvOfficeCheckBoxActionLink.AssignClient(AClient: TObject);
begin
  inherited AssignClient(AClient);
  FClient := AClient as TCustomAdvOfficeCheckBox;
end;

procedure TAdvOfficeCheckBoxActionLink.SetChecked(Value: Boolean);
begin
  FClient.FInternalClick := True;
  FClient.Checked := Value;
  FClient.FInternalClick := False;
end;

procedure TAdvOfficeCheckBoxActionLink.SetCaption(const Value: String);
begin
  FClient.Caption := Value;
end;

function TAdvOfficeCheckBoxActionLink.IsCaptionLinked: Boolean;
begin
  Result := inherited IsCaptionLinked;
end;

function TAdvOfficeCheckBoxActionLink.IsCheckedLinked: Boolean;
begin
  Result := inherited IsCheckedLinked;
end;

{$IFDEF FREEWARE}
{$I TRIAL.INC}
{$ENDIF}


end.