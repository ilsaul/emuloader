unit uMessageBox;

interface

uses
  Windows, Classes, Graphics, Controls, Forms, SysUtils,
  Buttons, StdCtrls, ComCtrls, ExtCtrls, ShadowLabel, Messages, PanelEx,
  RichEditURL, ShellAPI, AdvOfficeButtons, ButtonsEx;

type
  TFormMessageBox = class(TForm)
    LabelMessage: TRichEditURL;
    PanelBottom: TPanelEx;
    ButtonYes: TBitBtnEx;
    ButtonNo: TBitBtnEx;
    PanelTop: TPanelEx;
    MessageIcon: TImage;
    LabelGameTitle: TShadowLabel;
    LabelGameName: TShadowLabel;
    ButtonYestoAll: TBitBtnEx;
    ButtonAbort: TBitBtnEx;
    IconMediaType: TImage;
    NightMode: TAdvOfficeCheckBox;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure LabelMessageURLClick(Sender: TObject; const URL: String);
    procedure LabelMessageResizeRequest(Sender: TObject; Rect: TRect);
    procedure FormCreate(Sender: TObject);
    procedure NightModeClick(Sender: TObject);
  private
    { Private declarations }
    RichEditHeight: Integer;
    procedure WMSysCommand(var MSG: TWMSysCommand); message WM_SYSCOMMAND;
  public
    LabelMessageTitle: WideString;
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
  newHeight, scrMaxHeight{, MediaTypeIconID}: Integer;
begin
  // icon index:
  // -1 -> Game ID Icon
  // 00 -> Info (default icon)
  // 01 -> Error
  // 02 -> Question
  // 03 -> Command Line
  // 04 -> Run Neo-Geo MVS multi-slot games
  // 05 -> Run Sega Mega-Tech System multi-slot games
  // 06 -> Run Nintendo PlayChoice-10 multi-slot games
  // 07 -> Run Sega Titan-Video multi-slot games
  //if PanelMessages.Tag <> -1 then
  //   PanelMessages.Hint:= 'EmuLoader_Orb.ico';
  if not LabelGameName.Visible then
  begin
    case PanelBottom.Tag of
      0: PanelBottom.Hint:= 'info.ico';
      1: PanelBottom.Hint:= 'error.ico';
      2: PanelBottom.Hint:= 'question.ico';
      3: PanelBottom.Hint:= 'cmdline.ico';
      //4: PanelMessages.Hint:= 'NeoGeoMVS.ico'; // Run Neo-Geo MVS multi-slot games
      //5: PanelMessages.Hint:= 'SegaMegaTech.ico'; // Run Sega Mega-Tech multi-slot games
      //6: PanelMessages.Hint:= 'cmdline.ico'; // Run Nintendo PlayChoice-10 multi-slot games
      //7: PanelMessages.Hint:= 'cmdline.ico'; // Run Sega Titan-Video (ST-V) multi-slot games
    end;
  end;

  if PanelBottom.Tag = 1 then
     SetColorsGameTopBar(1, PanelTop, IsNightMode)
  else
     begin
       if PanelBottom.Tag = 4 then // multi-slot arcade machines
          MessageIcon.Tag:= -1;
       if MessageIcon.Tag <> -1 then
          SetFormColors(nil, nil, nil, LabelGameTitle, LabelGameName, MessageIcon.Tag, IsNightMode);

       SetColorsGameTopBar(MessageIcon.Tag{-1}, PanelTop, IsNightMode); // blue for -1 or game set status (green, red, gray)
     end;

  if IsNightMode then
     begin
       FormMain.SetButtonExColors(ButtonYestoAll);
       FormMain.SetButtonExColors(ButtonYes);
       FormMain.SetButtonExColors(ButtonNo);
       FormMain.SetButtonExColors(ButtonAbort);

  //     FormMessageBox.Color:= menu_background_color[1];
  //     LabelMessage.Color:= menu_background_color[1];
  //     SetPanelColors(PanelBottom, menu_background_color[1], clrMedDarkGray);
     end;

  if IconMediaType.Tag <> -1 then
     FormMain.GetMediaTypeIconMsgBox(FormMain.MemGameInfo.eCustomMediaType, FormMain.MemGameInfo.eIsCustomGame, FormMain.MemGameInfo.eMediaType, IconMediaType, FormMain.MemGameInfo.eSoftwareExecParameter, True);

  if (PanelBottom.Tag = -1) or (LabelGameName.Visible and (PanelBottom.Tag <> 4)) then
     FormMain.LoadGameIconIntoImage(FormMain.MemGameInfo.eSystemID, FormMain.MemGameInfo.eCustomSystemID, FormMain.MemGameInfo.eROMIdentification, MessageIcon, FormMain.MemGameInfo.eSoftwareName, FormMain.MemGameInfo.eIsCustomGame)
  else
  if PanelBottom.Tag = 4 then // for Multi-cart loading systems
     FormMain.LoadIconIntoImage(FormMain.GetArcadeSystemIconFileName(FormMain.MemGameInfo.eSystemID), MessageIcon)
  else
     FormMain.LoadMessageIcon(MessageIcon, PanelBottom.Hint);

  LabelGameTitle.Caption:= LabelMessageTitle;

  if Screen.Cursor <> crDefault then
     Screen.Cursor:= crDefault;

  if (RichEditHeight > 0) then
     begin
       //scrMaxHeight:= 400; // for debugging 640x840 resolution
       scrMaxHeight:= Screen.Height-80;
       newHeight:= FormMessageBox.LabelMessage.Top+RichEditHeight+PanelBottom.Height+16;
       if newHeight <= scrMaxHeight then
          begin
            // size of URLRichEdit changes according to the text length
            FormMessageBox.ClientHeight:= newHeight;
            LabelMessage.Height:= RichEditHeight+1;
          end
       else
          begin
            // height must be lowered even more due to screen height
            FormMessageBox.ClientHeight:= scrMaxHeight;
            LabelMessage.Height:= RichEditHeight-(newHeight-scrMaxHeight);
          end;
     end;
  BringToFront;
end;

procedure TFormMessageBox.LabelMessageURLClick(Sender: TObject;
  const URL: String);
begin
  CallShellExecute(Sender, URL);
  //ShellExecute(Handle, 'open', PChar(URL), nil, nil, SW_SHOWNORMAL);
end;
    
procedure TFormMessageBox.LabelMessageResizeRequest(Sender: TObject;
  Rect: TRect);
begin
  RichEditHeight:= Rect.Bottom-Rect.Top;
end;

procedure TFormMessageBox.FormCreate(Sender: TObject);
begin
  LabelMessage.Height:= 1300; // without this hack-fix, form height goes nuts, DO NOT REMOVE!
end;

procedure TFormMessageBox.NightModeClick(Sender: TObject);
begin
  IsNightMode:= NightMode.Checked;
  FormMain.MenuEnableNightMode.Checked:= IsNightMode;
  PopulateMsgColors;
  FormMain.MenuEnableNightMode.OnClick(Self);
end;


end.
