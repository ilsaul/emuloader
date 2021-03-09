unit uMessageBox;

interface

uses
  Windows, Classes, Graphics, Controls, Forms, SysUtils,
  Buttons, StdCtrls, ComCtrls, ExtCtrls, ShadowLabel, Messages, PanelEx,
  ShellAPI, AdvOfficeButtons, ButtonsEx, TntComCtrls;

type
  TFormMessageBox = class(TForm)
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
    NightMode: TAdvOfficeCheckBoxEx;
    LabelMessageW: TTntRichEdit;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure NightModeClick(Sender: TObject);
    procedure LabelMessageWResizeRequest(Sender: TObject; Rect: TRect);
    procedure LabelMessageWURLClick(Sender: TObject; const URL: WideString);
  private
    { Private declarations }
    RichEditHeight: Integer;
    procedure WMSysCommand(var MSG: TWMSysCommand); message WM_SYSCOMMAND;
    //procedure Resize_4K;
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
          SetFormColors(nil, nil, nil, LabelGameTitle, LabelGameName, nil, MessageIcon.Tag, IsNightMode);

       SetColorsGameTopBar(MessageIcon.Tag, PanelTop, IsNightMode); // blue for -1 or game set status (green, red, gray)
     end;

  if IsNightMode then
     begin
       FormMain.SetCheckBoxExCustomIcon(NightMode);
       FormMain.SetButtonExColors(ButtonYestoAll);
       FormMain.SetButtonExColors(ButtonYes);
       FormMain.SetButtonExColors(ButtonNo);
       FormMain.SetButtonExColors(ButtonAbort);
       FormMain.SetWin10DarkScrollBar(LabelMessageW);
     end;

  if IconMediaType.Tag <> -1 then
     FormMain.GetMediaTypeIconMsgBox(FormMain.MemGameInfo.eCustomMediaType, FormMain.MemGameInfo.eIsCustomGame, FormMain.MemGameInfo.eMediaType,
                                     FormMain.MemGameInfo.eArcadeCHDMediaType, IconMediaType,
                                     FormMain.MemGameInfo.eSoftwareExecParameter, FormMain.MemGameInfo.eSoftwareName, True);

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
       newHeight:= FormMessageBox.LabelMessageW.Top+RichEditHeight+PanelBottom.Height+16;
       if newHeight <= scrMaxHeight then
          begin
            // size of URLRichEdit changes according to the text length
            FormMessageBox.ClientHeight:= newHeight;
            LabelMessageW.Height:= RichEditHeight+1;
          end
       else
          begin
            // height must be lowered even more due to screen height
            FormMessageBox.ClientHeight:= scrMaxHeight;
            LabelMessageW.Height:= RichEditHeight-(newHeight-scrMaxHeight);
          end;
     end;
  BringToFront;
end;

{procedure TFormMessageBox.Resize_4K;
begin
    FormMessageBox.ClientWidth:= 1280;
    FormMessageBox.ClientHeight:= 799;
    FormMessageBox.Font.Size:= 16;
    FormMessageBox.PanelTop.Height:= 150;
    FormMessageBox.PanelBottom.Height:= 71;
    FormMessageBox.LabelMessageW.Top:= 150;
    FormMessageBox.LabelMessageW.Left:= 10;
    FormMessageBox.LabelMessageW.Width:= 1260;
    //FormMessageBox.LabelMessageW.Height:= 577;
    FormMessageBox.MessageIcon.Width:= 128;
    FormMessageBox.MessageIcon.Height:= 128;
    FormMessageBox.IconMediaType.Top:= 84;
    FormMessageBox.IconMediaType.Left:= 143;
    FormMessageBox.LabelGameTitle.Left:= 144;
    FormMessageBox.LabelGameTitle.Width:= 1125;
    FormMessageBox.LabelGameTitle.Height:= 59;
    FormMessageBox.LabelGameTitle.Font.Size:= 18;
    FormMessageBox.LabelGameName.Top:= 84;
    FormMessageBox.LabelGameName.Left:= 199;
    FormMessageBox.LabelGameName.Width:= 1069;
    FormMessageBox.LabelGameName.Height:= 47;
    FormMessageBox.NightMode.Top:= 17;
    FormMessageBox.NightMode.Left:= 24;
    FormMessageBox.ButtonYestoAll.Top:= 14;
    FormMessageBox.ButtonYestoAll.Left:= 281;
    FormMessageBox.ButtonYestoAll.Width:= 168;
    FormMessageBox.ButtonYestoAll.Height:= 45;
    FormMessageBox.ButtonYes.Top:= 14;
    FormMessageBox.ButtonYes.Left:= 448;
    FormMessageBox.ButtonYes.Width:= 168;
    FormMessageBox.ButtonYes.Height:= 45;
    FormMessageBox.ButtonNo.Top:= 14;
    FormMessageBox.ButtonNo.Left:= 640;
    FormMessageBox.ButtonNo.Width:= 168;
    FormMessageBox.ButtonNo.Height:= 45;
    FormMessageBox.ButtonAbort.Top:= 14;
    FormMessageBox.ButtonAbort.Left:= 831;
    FormMessageBox.ButtonAbort.Width:= 168;
    FormMessageBox.ButtonAbort.Height:= 45;
end;}

procedure TFormMessageBox.FormCreate(Sender: TObject);
begin
  //if FormMain.MenuEnable4KMode2160p then
  //   Resize_4K;
  LabelMessageW.Height:= 1500; // without this hack-fix, form height goes nuts, DO NOT REMOVE!
end;

procedure TFormMessageBox.NightModeClick(Sender: TObject);
begin
  IsNightMode:= NightMode.Checked;
  FormMain.MenuEnableNightMode.Checked:= IsNightMode;
  PopulateMsgColors;
  FormMain.MenuEnableNightMode.OnClick(Self);
end;

procedure TFormMessageBox.LabelMessageWResizeRequest(Sender: TObject;
  Rect: TRect);
begin
  RichEditHeight:= Rect.Bottom-Rect.Top;
end;

procedure TFormMessageBox.LabelMessageWURLClick(Sender: TObject; const URL: WideString);
begin
  CallShellExecute(Sender, URL);
end;

end.
