unit uSelectSystem;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  ComCtrls, StdCtrls, MPCommonObjects, MPCommonUtilities, EasyListview,
  ExtCtrls, ShadowLabel, Buttons, PanelEx, uCommon, AdvOfficeButtons;

const
  ActionModeStr: array[-1..7] of String = (
    '', // -1 (all systems, available or not)
    '', // 0 (available only, emu + games)
    'Create Games List', // 1 (available emu only)
    'Emulator Default Settings', // 2 (available emu only)
    'Games ROMs Paths', // 3 (available emu only)
    'Scan Games', // 4 (available system, emu + games)
    'Scan Games', // 5 (available system, emu + games... except Daphne)
    '', // 6 (available games only)
    'Games With Missing ROMs/CHDs' // only systems that have the 'sysname.miss' file
    );

type
  TFormSelectSystem = class(TForm)
    PanelList: TPanelEx;
    LabelEmuTitle: TShadowLabel;
    SystemsListView: TEasyListview;
    PanelButtons: TPanelEx;
    ButtonOk: TBitBtn;
    ButtonCancel: TBitBtn;
    LabelMultiSelect: TShadowLabel;
    FullScan: TAdvOfficeRadioButton;
    LabelFullScan: TLabel;
    QuickScan: TAdvOfficeRadioButton;
    LabelQuickScan: TLabel;
    ForceAllAvailable: TAdvOfficeRadioButton;
    LabelForceAllAvailable: TLabel;
    LabelSelectMode: TLabel;
    ScanModeCurrentTaskOnly: TAdvOfficeCheckBox;
    ScanModeIcon: TImage;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure SystemsListViewItemPaintText(Sender: TCustomEasyListview;
      Item: TEasyItem; Position: Integer; ACanvas: TCanvas);
    procedure SystemsListViewItemSelectionChanged(
      Sender: TCustomEasyListview; Item: TEasyItem);
    procedure SystemsListViewKeyAction(Sender: TCustomEasyListview;
      var CharCode: Word; var Shift: TShiftState; var DoDefault: Boolean);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure SystemsListViewDblClick(Sender: TCustomEasyListview;
      Button: TCommonMouseButton; MousePos: TPoint;
      ShiftState: TShiftState; var Handled: Boolean);
  private
    { Private declarations }
    procedure SetSystemsState;
    procedure ResizeFormSize;
  public
    { Public declarations }
    ActionMode, selSysID: ShortInt;
  end;

var
  FormSelectSystem: TFormSelectSystem;

implementation

uses uMain;

{$R *.dfm}

procedure TFormSelectSystem.SetSystemsState;
var
  ShowItem: Boolean;
  Item: TEasyItem;
begin
  SystemsListView.BeginUpdate;
  Item:= SystemsListView.Groups.FirstItem;
  repeat
    ShowItem:= True;
    case ActionMode of
      1, 2, 3: ShowItem:= FormMain.ValidateEmulatorFile(Item.ImageIndex);
      0, 4, 5: ShowItem:= FormMain.IsSystemAvailable(Item.ImageIndex);
      7: ShowItem:= FormMain.ValidateFile(FormMain.GetGamesFolderEL+ChangeFileExt(GetSystemFileName(Item.ImageIndex), '.miss'));
    end;
    if ShowItem then
       begin
         case ActionMode of
           2: ShowItem:= not (Item.ImageIndex in [idDemul, idDICE{, idSegaModel2}]); // default settings, no Demul / DICE emu settings screen
           3: ShowItem:= not (Item.ImageIndex in [idDaphne, idDICE]); // ROMs paths, no Daphne; no DICE
           5: ShowItem:= Item.ImageIndex <> idDaphne; // scan games with missing ROMs/CHDs, no Daphne
         end;
       end;
    if (not ShowItem) and (Item.ImageIndex > 0) then
       Item.State:= Item.State+[esosGhosted];
    Item:= SystemsListView.Groups.NextItem(Item);
  until Item = nil;
  SystemsListView.EndUpdate(False);
  FormMain.ELV_SelectItem(SystemsListView, selSysID-SystemsListView.Groups.FirstItem.ImageIndex)//1);
end;

procedure TFormSelectSystem.FormKeyPress(Sender: TObject; var Key: Char);
begin
  case Key of
    #13: if ButtonOk.Enabled then ButtonOk.Click;
    #27: ButtonCancel.Click;
  end;
end;

procedure TFormSelectSystem.ResizeFormSize;

  function MoveSettingsLeft(PixelsToMove: Integer): Boolean;
  begin
    Result:= True;
    ForceAllAvailable.Left:= ForceAllAvailable.Left-PixelsToMove;
    LabelForceAllAvailable.Left:= LabelForceAllAvailable.Left-PixelsToMove;
    QuickScan.Left:= QuickScan.Left-PixelsToMove;
    LabelQuickScan.Left:= LabelQuickScan.Left-PixelsToMove;
    FullScan.Left:= FullScan.Left-PixelsToMove;
    LabelFullScan.Left:= LabelFullScan.Left-PixelsToMove;
    ScanModeIcon.Left:= ScanModeIcon.Left-PixelsToMove;
    LabelSelectMode.Left:= LabelSelectMode.Left-PixelsToMove;
    ScanModeCurrentTaskOnly.Left:= ScanModeCurrentTaskOnly.Left-PixelsToMove;
  end;

begin
  if Screen.Width > 720 then
     Exit;

  if Screen.Width = 720 then
     begin
       if SystemsListView.Width = 720 then
          begin
             SystemsListView.Left:= 1;
             LabelMultiSelect.Left:= LabelMultiSelect.Left-14;
             ButtonOk.Left:= ButtonOk.Left-7;
             ButtonCancel.Left:= ButtonCancel.Left-7;
             MoveSettingsLeft(14);
             FormSelectSystem.ClientWidth:= 704;
          end;
     end
  else
  if Screen.Width = 640 then
     begin
       FormSelectSystem.ClientHeight:= FormSelectSystem.ClientHeight+92;
       ForceAllAvailable.Top:= ForceAllAvailable.Top+92;
       LabelForceAllAvailable.Top:=  LabelForceAllAvailable.Top+92;
       QuickScan.Top:= QuickScan.Top+92;
       LabelQuickScan.Top:= LabelQuickScan.Top+92;
       FullScan.Top:= FullScan.Top+92;
       LabelFullScan.Top:= LabelFullScan.Top+92;
       ScanModeIcon.Top:= ScanModeIcon.Top+92;
       LabelSelectMode.Top:= LabelSelectMode.Top+92;
       ScanModeCurrentTaskOnly.Top:= ScanModeCurrentTaskOnly.Top+92;

       PanelList.Height:= PanelList.Height+92;
       LabelEmuTitle.Top:= LabelEmuTitle.Top+92;
       SystemsListView.Height:= SystemsListView.Height+92;
       if SystemsListView.Width = 720 then
          begin
            LabelMultiSelect.Left:= LabelMultiSelect.Left-234;
            ButtonOk.Left:= ButtonOk.Left-117;
            ButtonCancel.Left:= ButtonCancel.Left-117;
            MoveSettingsLeft(117);
            SystemsListView.Width:= SystemsListView.Width-234;
            FormSelectSystem.ClientWidth:= FormSelectSystem.ClientWidth-234;
          end
       else
          begin
            LabelMultiSelect.Left:= LabelMultiSelect.Left-156;
            ButtonOk.Left:= ButtonOk.Left-78;
            ButtonCancel.Left:= ButtonCancel.Left-78;
            MoveSettingsLeft(78);
            SystemsListView.Width:= SystemsListView.Width-156;
            FormSelectSystem.ClientWidth:= FormSelectSystem.ClientWidth-156;
          end;
     end;
  LabelEmuTitle.Width:= FormSelectSystem.ClientWidth;
end;

procedure TFormSelectSystem.FormShow(Sender: TObject);
begin
  FormMain.ELV_ResetNormalColors(SystemsListView);
  SystemsListView.Selection.MultiSelect:= ActionMode in [1, 4, 5]; // create games list, audit games can have multi-selection!!!!
  if not SystemsListView.Selection.MultiSelect then
     begin
       Caption:= 'Select a System';
       ClientWidth:= ClientWidth-78;
       //Width:= Width-78;
       SystemsListView.Width:= SystemsListView.Width-78;
       LabelEmuTitle.Width:= ClientWidth;//LabelEmuTitle.Width+78;
       //PanelButtons.Width:= ClientWidth;//PanelButtons.Width+78;
       ButtonOk.Left:= ButtonOk.Left-39;
       ButtonCancel.Left:= ButtonCancel.Left-39;
       LabelMultiSelect.Visible:= False;
     end;

  if ActionMode in [1..5] then
     Caption:= Caption+' ['+ActionModeStr[ActionMode]+']';

  if ActionMode in [1, 4, 5] then
     begin
       FormMain.IL_MenuPopup.GetIcon(8, ScanModeIcon.Picture.Icon);
       case FormMain.PopupSelectScanGamesMode.Tag of
         1: QuickScan.Checked:= True;
         2: ForceAllAvailable.Checked:= True;
       end
     end
  else
     ClientHeight:= 180; // only scan games and create games list can show the scan mode settings
  ResizeFormSize;
  //FormMain.ELV_GenerateVistaBackground(SystemsListView);
end;

procedure TFormSelectSystem.FormActivate(Sender: TObject);
begin
  if FormSelectSystem.Tag = 1 then
     Exit;

  FormMain.ELV_PopulateSystems(SystemsListView, True, True, Ord(not SystemsListView.Selection.MultiSelect));//1); stars on zero if multi systems
  //FormMain.ELV_SystemsShortTitle(SystemsListView);
  SetSystemsState;
  FormSelectSystem.Tag:= 1;
end;

procedure TFormSelectSystem.SystemsListViewItemPaintText(
  Sender: TCustomEasyListview; Item: TEasyItem; Position: Integer;
  ACanvas: TCanvas);
begin
  //FormMain.ELV_ItemPaintText_General(Sender, Item, ACanvas);
  if Item.Ghosted then // esosGhosted in Item.State then
     begin
       ACanvas.Font.Color:= clSilver;//Gray;
       ACanvas.Font.Style:= [fsStrikeOut];
     end;
end;

procedure TFormSelectSystem.SystemsListViewItemSelectionChanged(
  Sender: TCustomEasyListview; Item: TEasyItem);
begin
  if Item.Selected then
     begin
       LabelEmuTitle.Caption:= UpperCase(FormMain.GetEmulatorDescription(Item.ImageIndex));
       ButtonOk.Enabled:= not ((Item.Ghosted) and (SystemsListView.Selection.Count = 1));
       FormMain.ELV_SetSelectRibbon(Ord(Item.Ghosted), SystemsListView);
       Sender.Tag:= Item.ImageIndex;
     end;
end;

procedure TFormSelectSystem.SystemsListViewKeyAction(
  Sender: TCustomEasyListview; var CharCode: Word; var Shift: TShiftState;
  var DoDefault: Boolean);
begin
  case CharCode of
    VK_RETURN: if ButtonOk.Enabled then ButtonOk.Click;
    VK_ESCAPE: ButtonCancel.Click;
  end;
end;

procedure TFormSelectSystem.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if ModalResult = mrOk then
     CanClose:= FormMain.CheckSelected(SystemsListView);
end;

procedure TFormSelectSystem.SystemsListViewDblClick(
  Sender: TCustomEasyListview; Button: TCommonMouseButton;
  MousePos: TPoint; ShiftState: TShiftState; var Handled: Boolean);
begin
  if ButtonOk.Enabled then ButtonOk.Click;
end;

end.
