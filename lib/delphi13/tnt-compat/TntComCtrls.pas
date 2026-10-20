unit TntComCtrls;

// Delphi 13 compatibility shim for the TntWare Unicode Controls.
// TTntRichEdit maps onto the native Unicode TRichEdit and keeps the
// EmuLoader-specific OnURLClick event (automatic URL detection + EN_LINK).

interface

uses
  Winapi.Windows, Winapi.Messages, Winapi.RichEdit, System.Classes,
  Vcl.Controls, Vcl.ComCtrls;

type
  TURLClickEvent = procedure(Sender: TObject; const URL: WideString) of object;

  TTntCustomRichEdit = class(TCustomRichEdit)
  private
    FOnURLClick: TURLClickEvent;
    procedure CNNotify(var Message: TWMNotify); message CN_NOTIFY;
  protected
    procedure CreateWnd; override;
    procedure DoURLClick(const URL: WideString); virtual;
  published
    property OnURLClick: TURLClickEvent read FOnURLClick write FOnURLClick;
  end;

  TTntRichEdit = class(TTntCustomRichEdit)
  published
    property Align;
    property Alignment;
    property Anchors;
    property BevelEdges;
    property BevelInner;
    property BevelOuter;
    property BevelKind default bkNone;
    property BevelWidth;
    property BiDiMode;
    property BorderStyle;
    property BorderWidth;
    property Color;
    property Ctl3D;
    property DragCursor;
    property DragKind;
    property DragMode;
    property Enabled;
    property Font;
    property HideSelection;
    property HideScrollBars;
    property ImeMode;
    property ImeName;
    property Constraints;
    property Lines;
    property MaxLength;
    property ParentBiDiMode;
    property ParentColor;
    property ParentCtl3D;
    property ParentFont;
    property ParentShowHint;
    property PlainText;
    property PopupMenu;
    property ReadOnly;
    property ScrollBars;
    property ShowHint;
    property TabOrder;
    property TabStop default True;
    property Visible;
    property WantTabs;
    property WantReturns;
    property WordWrap;
    property OnChange;
    property OnClick;
    property OnContextPopup;
    property OnDblClick;
    property OnDragDrop;
    property OnDragOver;
    property OnEndDock;
    property OnEndDrag;
    property OnEnter;
    property OnExit;
    property OnKeyDown;
    property OnKeyPress;
    property OnKeyUp;
    property OnMouseActivate;
    property OnMouseDown;
    property OnMouseEnter;
    property OnMouseLeave;
    property OnMouseMove;
    property OnMouseUp;
    property OnMouseWheel;
    property OnMouseWheelDown;
    property OnMouseWheelUp;
    property OnProtectChange;
    property OnResizeRequest;
    property OnSaveClipboard;
    property OnSelectionChange;
    property OnStartDock;
    property OnStartDrag;
  end;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('Tnt Standard', [TTntRichEdit]);
end;

procedure TTntCustomRichEdit.CreateWnd;
var
  Mask: LRESULT;
begin
  inherited;
  SendMessage(Handle, EM_AUTOURLDETECT, 1, 0);
  Mask := SendMessage(Handle, EM_GETEVENTMASK, 0, 0);
  SendMessage(Handle, EM_SETEVENTMASK, 0, Mask or ENM_LINK);
  SendMessage(Handle, EM_EXLIMITTEXT, 0, $FFFFFF);
end;

procedure TTntCustomRichEdit.CNNotify(var Message: TWMNotify);
var
  Link: PENLink;
begin
  if Message.NMHdr^.code = EN_LINK then
  begin
    Link := PENLink(Message.NMHdr);
    if Link^.msg = WM_LBUTTONDOWN then
    begin
      SendMessage(Handle, EM_EXSETSEL, 0, LPARAM(@Link^.chrg));
      DoURLClick(SelText);
    end;
  end;
  inherited;
end;

procedure TTntCustomRichEdit.DoURLClick(const URL: WideString);
begin
  if Assigned(FOnURLClick) then
    FOnURLClick(Self, URL);
end;

initialization
  RegisterClass(TTntRichEdit);

end.
