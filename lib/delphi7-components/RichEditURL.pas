{
Article:

TRichEditURL - hyperlink aware RichEdit

http://delphi.about.com/library/weekly/aa051804a.htm

Full source code of the TRichEditURL Delphi component,
an extension to the standard RichEdit component. The
TRichEditURL automatically recognizes URLs. Whenever the
text in a RichEditURL matches the format of a URL, the
control will display it as a hyperlink - when the link is
clicked an event is raised enabling you to, for example,
open a browser or send an email. The TRichEditURL works
correctly event when placed on a Panel or any other container control.

********************************************
Zarko Gajic
About.com Guide to Delphi Programming
http://delphi.about.com
email: delphi.guide@about.com
free newsletter: http://delphi.about.com/library/blnewsletter.htm
forum: http://forums.about.com/ab-delphi/start/
********************************************
}
unit RichEditURL;

interface

uses
  Windows, Messages, SysUtils, Classes, Controls,
  ComCtrls, ExtCtrls, RichEdit, Graphics;

type
  TURLClickEvent = procedure(Sender :TObject; const URL: string) of object;

  TRichEditURL = class(TRichEdit)
  private
    FOnURLClick: TURLClickEvent;
    procedure CNNotify(var Msg: TWMNotify); message CN_NOTIFY;
  protected
    procedure DoURLClick (const URL : string);
    procedure DoSetMaxLength(Value: Integer);
    procedure CreateWnd; override;
  public
    procedure TextBKColor(bkColor: TColor);
  published
    property OnURLClick : TURLClickEvent read FOnURLClick write FOnURLClick;
  end;

procedure Register;


implementation

procedure Register;
begin
  RegisterComponents('Components', [TRichEditURL]);
end;

procedure TRichEditURL.DoURLClick(const URL : string);
begin
  if Assigned(FOnURLClick) then OnURLClick(Self, URL);
end; // DoURLClick

procedure TRichEditURL.CNNotify(var Msg: TWMNotify);
var
  p: TENLink;
  sURL: string;
begin
  if (Msg.NMHdr^.code = EN_LINK) then
  begin
   p := TENLink(Pointer(Msg.NMHdr)^);
   if (p.Msg = WM_LBUTTONDOWN) then
   begin
    try
     SendMessage(Handle, EM_EXSETSEL, 0, Longint(@(p.chrg)));
     sURL := SelText;
     DoURLClick(sURL);
    except
    end;
   end;
  end;

 inherited;
end; // CNNotify

procedure TRichEditURL.DoSetMaxLength(Value: Integer);
begin
  // The rich edit control's default maximum amount of text is 32K
  // Let's set it at 16MB by default
  if Value = 0 then
     Value := $FFFFFF; //$7FFFFFF0;
  SendMessage(Handle, EM_EXLIMITTEXT, 0, Value);
end;

procedure TRichEditURL.CreateWnd;
//var
//  mask: Word;
begin
  inherited CreateWnd;
  SendMessage(Handle, EM_AUTOURLDETECT, 1, 0);
  // not needed anymore as I've already set the ENM_LINK in the TCustomRichEdit.CreateWnd function!!!!!
  //mask := SendMessage(Handle, EM_GETEVENTMASK, 0, 0);
  //SendMessage(Handle, EM_SETEVENTMASK, 0, mask or ENM_LINK);

  DoSetMaxLength(MaxLength);
end; // CreateWnd

procedure TRichEditURL.TextBKColor(bkColor: TColor);
var
  Format: TCharFormat2;
begin
  FillChar(Format, SizeOf(Format), 0);
  with Format do
  begin
    cbSize:= SizeOf(Format);
    dwMask:= CFM_BACKCOLOR; // Background color
    crBackColor:= bkColor;
    SendMessage(Handle, EM_SETCHARFORMAT, SCF_SELECTION {Apply to the selection}, LPARAM(@Format));
  end;
end;


end.
