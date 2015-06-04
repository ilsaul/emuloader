unit uMessageBox;

interface

uses
  Windows, Classes, Graphics, Controls, Forms, SysUtils,
  Buttons, StdCtrls, ComCtrls, ExtCtrls, ShadowLabel, Messages, PanelEx,
  RichEditURL, ShellAPI;

type
  TFormMessageBox = class(TForm)
    LabelMessage: TRichEditURL;
    PanelMessages: TPanelEx;
    ButtonYes: TBitBtn;
    ButtonNo: TBitBtn;
    PanelTop: TPanelEx;
    MessageIcon: TImage;
    LabelTitle: TShadowLabel;
    LabelGameNameCloneOf: TShadowLabel;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure LabelMessageURLClick(Sender: TObject; const URL: String);
    procedure LabelMessageResizeRequest(Sender: TObject; Rect: TRect);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    RichEditHeight: Integer;
    procedure WMSysCommand(var MSG: TWMSysCommand); message WM_SYSCOMMAND;
  public
    LabelMessageTitle: String;
    { Public declarations }
  end;

var
  FormMessageBox: TFormMessageBox;

implementation

uses uMain, uCommon;

{$R *.dfm}

procedure TFormMessageBox.WMSYSCommand(var MSG:  TWMSysCommand);
begin
  inherited;
  if MSG.CmdType = SC_CLOSE then
     begin
       if ButtonNo.Visible then
          FormMessageBox.ModalResult:= mrNo;
     end;
end;

procedure TFormMessageBox.FormKeyPress(Sender: TObject; var Key: Char);

  procedure CheckFocusedButton;
  begin
    if ButtonYes.Focused then
       ButtonYes.Click
    else
    if ButtonNo.Focused then
       ButtonNo.Click
    else
       ButtonYes.Click;
  end;

begin
  case FormMain.MenuArcadeBrowseGames.Tag of
    0:
      begin
        case Key of
          #13: CheckFocusedButton;
          #27: ButtonNo.Click;
        end;
      end;
    else
      begin
        case Key of
         'S', 's': CheckFocusedButton;
         'Q', 'q': ButtonNo.Click;
        end;
      end;
  end;
end;

procedure TFormMessageBox.FormShow(Sender: TObject);
var
  newHeight, scrMaxHeight: Integer;
begin
  // icon index:
  // -1 -> Game ID Icon
  // 00 -> Info (default icon)
  // 01 -> Error
  // 02 -> Question
  // 03 -> Command Line
  // 04 -> Zip File ... not used anymore!
  case PanelMessages.Tag of
    0: PanelMessages.Hint:= 'info.ico';
    1: PanelMessages.Hint:= 'error.ico';
    2: PanelMessages.Hint:= 'question.ico';
    3: PanelMessages.Hint:= 'cmdline.ico';
  end;

  if PanelMessages.Tag = 1 then
     PanelTop.Color1:= $00e5f0fa // red
  else
     PanelTop.Color1:= $00faf0e5; // blue

  // $00faf0e5 // blue
  // $00e5f0fa // red
  // $00f0fae5 // green
  // $00e5fafa // yellow
  // $00eeeeee // silver

  if PanelMessages.Tag = -1 then
     FormMain.IL_StandardIconsExtraLarge.GetIcon(FormMain.MemGameInfo.eROMIdentification, MessageIcon.Picture.Icon)
  else
     FormMain.LoadMessageIcon(MessageIcon, PanelMessages.Hint);

  LabelTitle.Caption:= LabelMessageTitle;

  if Screen.Cursor <> crDefault then
     Screen.Cursor:= crDefault;
  if not FormMessageBox.LabelGameNameCloneOf.Visible then
     LabelMessage.Top:= 60;
  if (RichEditHeight > 0) then//and (RichEditHeight < LabelMessage.Height) then
     begin
       //scrMaxHeight:= 400; // for testing 640x840 res
       scrMaxHeight:= Screen.Height-80;
       newHeight:= FormMessageBox.LabelMessage.Top+RichEditHeight+PanelMessages.Height+16;
       if newHeight <= scrMaxHeight then
          begin
            // size of URLRichEdit changes according to the text length!!! :)
            FormMessageBox.ClientHeight:= newHeight;
            LabelMessage.Height:= RichEditHeight+1;
          end
       else
          begin
            // height must be lowered even more due to screen height!!!
            FormMessageBox.ClientHeight:= scrMaxHeight;
            LabelMessage.Height:= RichEditHeight-(newHeight-scrMaxHeight);
          end;
     end;
  BringToFront;
end;

procedure TFormMessageBox.LabelMessageURLClick(Sender: TObject;
  const URL: String);
begin
  ShellExecute(Handle, 'open', PChar(URL), nil, nil, SW_SHOWNORMAL);
end;
    
procedure TFormMessageBox.LabelMessageResizeRequest(Sender: TObject;
  Rect: TRect);
begin
  RichEditHeight:= Rect.Bottom-Rect.Top;
end;

procedure TFormMessageBox.FormCreate(Sender: TObject);
begin
  LabelMessage.Height:= 1300;
  {if Screen.Height > 480 then
     Exit;
  if Screen.Width > 720 then
     Exit;

  // resize window and controls to fit 640x480 resolution
  // on 720x480 resolution only the height needs to be resized
  if Screen.Width < 720 then
     begin
       LabelTitle.Width:= LabelTitle.Width-15;
       PanelTop.Width:= PanelTop.Width-15;
       LabelMessage.Width:= LabelMessage.Width-15;
       ButtonYes.Left:= ButtonYes.Left-8;
       ButtonNo.Left:= ButtonNo.Left-8;
       Width:= Width-15;
     end;
  Height:= Height-35;}
end;

end.
