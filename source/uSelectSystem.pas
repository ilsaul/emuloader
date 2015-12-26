unit uSelectSystem;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  ComCtrls, StdCtrls, MPCommonObjects, MPCommonUtilities, EasyListview,
  ExtCtrls, ShadowLabel, Buttons, PanelEx, uCommon, AdvOfficeButtons,
  AdvGroupBox;

const
  ActionModeStr: array[-1..7] of String = (
    '', // -1 (all systems, available or not)
    '', // 0 (available only, emu + games)
    'Create Games List', // 1 (available emu only)
    'Emulator Default Settings', // 2 (available emu only)
    'Games ROMs Paths', // 3 (available emu only) // July 14, 2015 -> THIS MODE IS NO LONGER USED!!!!!!!!!
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
    FullScan: TAdvOfficeRadioButton;
    LabelFullScan: TLabel;
    QuickScan: TAdvOfficeRadioButton;
    LabelQuickScan: TLabel;
    ForceAllAvailable: TAdvOfficeRadioButton;
    LabelForceAllAvailable: TLabel;
    LabelSelectMode: TLabel;
    ScanModeCurrentTaskOnly: TAdvOfficeCheckBox;
    ScanModeIcon: TImage;
    CreateSoftwareListGames: TAdvOfficeCheckBox;
    ButtonHelpCreateSoftwareListGames: TBitBtn;
    LabelCreateSoftwareListGames: TShadowLabel;
    ScanMAMESetsBox: TAdvGroupBox;
    ScanMAMEAllSets: TAdvOfficeRadioButton;
    ScanMAMEArcadeMachines: TAdvOfficeRadioButton;
    ScanMAMESoftwareListGames: TAdvOfficeRadioButton;
    ImageScanMAME: TImage;
    AddMAMEDeviceSetWithNoROMs: TAdvOfficeCheckBox;
    LabelAddMAMEDeviceSetWithNoROMs: TShadowLabel;
    LabelMultiSelect: TShadowLabel;
    LabelCustomizeSoftwareList: TShadowLabel;
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
    procedure CreateSoftwareListGamesClick(Sender: TObject);
    procedure ScanMAMEAllSetsClick(Sender: TObject);
    procedure AddMAMEDeviceSetWithNoROMsClick(Sender: TObject);
    procedure ButtonHelpCreateSoftwareListGamesClick(Sender: TObject);
    procedure LabelCustomizeSoftwareListMouseEnter(Sender: TObject);
    procedure LabelCustomizeSoftwareListMouseLeave(Sender: TObject);
    procedure LabelCustomizeSoftwareListClick(Sender: TObject);
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
    ScanMAMESetsBox.Left:= ScanMAMESetsBox.Left-PixelsToMove;
  end;

begin
  if Screen.Width > 720 then
     Exit;

  if Screen.Width = 720 then
     begin
       if SystemsListView.Width = 720 then
          begin
             SystemsListView.Left:= 1;
             //LabelMultiSelect.Left:= LabelMultiSelect.Left-14;
             //ButtonOk.Left:= ButtonOk.Left-7;
             //ButtonCancel.Left:= ButtonCancel.Left-7;

             AddMAMEDeviceSetWithNoROMs.Left:= AddMAMEDeviceSetWithNoROMs.Left-14;
             LabelAddMAMEDeviceSetWithNoROMs.Left:= LabelAddMAMEDeviceSetWithNoROMs.Left-14;

             MoveSettingsLeft(14);
             FormSelectSystem.ClientWidth:= 704;
          end;
     end
  else
  if Screen.Width = 640 then
     begin
       //if ActionMode <> 2 then
       begin
         // Emulator default settings; Show ROMs Paths
         SystemsListView.ImagesLarge:= FormMain.IL_ArcadeSystem_ExtraLarge; //FormMain.IL_Systems
         SystemsListView.CellSizes.Icon.Width:= 58;
         SystemsListView.CellSizes.Icon.Height:= 72;
         SystemsListView.Font.Name:= 'Tahoma';
         SystemsListView.Font.Size:= 7;
       end;

       FormSelectSystem.ClientHeight:= FormSelectSystem.ClientHeight-20;//+92;
       ForceAllAvailable.Top:= ForceAllAvailable.Top-20;//+92;
       LabelForceAllAvailable.Top:=  LabelForceAllAvailable.Top-20;//+92;
       QuickScan.Top:= QuickScan.Top-20;//+92;
       LabelQuickScan.Top:= LabelQuickScan.Top-20;//+92;
       FullScan.Top:= FullScan.Top-20;//+92;
       LabelFullScan.Top:= LabelFullScan.Top-20;//+92;
       ScanModeIcon.Top:= ScanModeIcon.Top-20;//+92;
       LabelSelectMode.Top:= LabelSelectMode.Top-20;//+92;
       ScanModeCurrentTaskOnly.Top:= ScanModeCurrentTaskOnly.Top-20;//+92;
       LabelMultiSelect.Top:= LabelMultiSelect.Top-20;

       ScanMAMESetsBox.Top:= ScanMAMESetsBox.Top-20;//+92;

       PanelList.Height:= PanelList.Height-20;//+92;
       LabelEmuTitle.Top:= LabelEmuTitle.Top-20;//+92;
       SystemsListView.Height:= SystemsListView.Height-20;//+92;
       if SystemsListView.Width = 720 then
          begin
            //LabelMultiSelect.Left:= LabelMultiSelect.Left-180;//-234;
            ButtonOk.Left:= ButtonOk.Left-48;//117;
            ButtonOk.Width:= 63;
            ButtonCancel.Left:= ButtonCancel.Left-78;//117;
            ButtonCancel.Width:= 63;

            AddMAMEDeviceSetWithNoROMs.Left:= AddMAMEDeviceSetWithNoROMs.Left-173;
            LabelAddMAMEDeviceSetWithNoROMs.Left:= LabelAddMAMEDeviceSetWithNoROMs.Left-173;

            MoveSettingsLeft(90);//(117);
            SystemsListView.Width:= SystemsListView.Width-180;//-234;
            FormSelectSystem.ClientWidth:= FormSelectSystem.ClientWidth-180;// -234;
          end
       else
          begin
            LabelMultiSelect.Left:= LabelMultiSelect.Left-160;//102;//-156;
            ButtonOk.Left:= ButtonOk.Left-78;
            ButtonCancel.Left:= ButtonCancel.Left-78;
            AddMAMEDeviceSetWithNoROMs.Left:= AddMAMEDeviceSetWithNoROMs.Left-170;
            LabelAddMAMEDeviceSetWithNoROMs.Left:= LabelAddMAMEDeviceSetWithNoROMs.Left-170;
            MoveSettingsLeft(51);//(78);
            SystemsListView.Width:= SystemsListView.Width-160;//102;//156;
            FormSelectSystem.ClientWidth:= FormSelectSystem.ClientWidth-160;//102;//-156;
          end;
       LabelMultiSelect.Font.Size:= 8;
     end;
  LabelEmuTitle.Width:= FormSelectSystem.ClientWidth;
end;

procedure TFormSelectSystem.FormShow(Sender: TObject);
begin
  FormMain.ELV_ResetNormalColors(SystemsListView);
  CreateSoftwareListGames.Visible:= ActionMode = 1; // create games list "ActionMode" only
  LabelCreateSoftwareListGames.Visible:= CreateSoftwareListGames.Visible;
  ButtonHelpCreateSoftwareListGames.Visible:= CreateSoftwareListGames.Visible;
  LabelCustomizeSoftwareList.Visible:= CreateSoftwareListGames.Visible;

  AddMAMEDeviceSetWithNoROMs.Visible:= CreateSoftwareListGames.Visible;
  LabelAddMAMEDeviceSetWithNoROMs.Visible:= AddMAMEDeviceSetWithNoROMs.Visible;

  if CreateSoftwareListGames.Visible then
     CreateSoftwareListGames.Checked:= Boolean(FormMain.MenuCreateSoftwareListGames.Tag);

  if AddMAMEDeviceSetWithNoROMs.Visible then
     AddMAMEDeviceSetWithNoROMs.Checked:= Boolean(FormMain.MenuAddMAMEDeviceSetsWithNoROMs.Tag);

  ScanMAMESetsBox.Tag:= FormMain.MenuCreateSoftwareListGames.HelpContext;
  ScanMAMESetsBox.Visible:= (ActionMode in [1, 4, 5]);
  //if ScanMAMESetsBox.Visible then
  //   ScanMAMESetsBox.Visible:= FormMain.IsSystemAvailable(idMAME) and FileExists(FormMain.GetMAMEMachineSoftListFile(False));

  case ScanMAMESetsBox.Visible of
    True:
      begin
        if ScanMAMESetsBox.Tag <> 0 then
           ScanMAMEAllSets.Font.Style:= [];
        case ScanMAMESetsBox.Tag of
          1: ScanMAMEArcadeMachines.Font.Style:= [fsBold];
          2: ScanMAMESoftwareListGames.Font.Style:= [fsBold];
        end;
      end;
    False:
      begin
        //if ActionMode in [4, 5] then
        //   ScanMAMEAllSets.Checked:= True; // reset to all sets since mame.elsoftlist doesn't exist (older than MAME v0.162...)
        ClientHeight:= ClientHeight-46;
      end;
  end;

  SystemsListView.Selection.MultiSelect:= ActionMode in [1, 4, 5]; // create games list, audit games can have multi-selection!!!!
  if not SystemsListView.Selection.MultiSelect then
     begin
       Caption:= 'Select a System';
       ClientWidth:= ClientWidth-SystemsListView.CellSizes.Icon.Width;//78;
       //Width:= Width-78;
       SystemsListView.Width:= SystemsListView.Width-SystemsListView.CellSizes.Icon.Width;//-78;
       LabelEmuTitle.Width:= ClientWidth;//LabelEmuTitle.Width+78;
       ButtonOk.Left:= ButtonOk.Left-39;
       ButtonCancel.Left:= ButtonCancel.Left-39;
       LabelMultiSelect.Visible:= False;
     end;

  if ActionMode in [1..5] then
     Caption:= Caption+' ['+ActionModeStr[ActionMode]+']';

  if ScanMAMESetsBox.Visible then
     begin
       FormMain.IL_StandardIconsSmall.GetIcon(MaxGameID+1, ImageScanMAME.Picture.Icon);
       case ScanMAMESetsBox.Tag of
         1: ScanMAMEArcadeMachines.Checked:= True;
         2: ScanMAMESoftwareListGames.Checked:= True;  
       end;
     end;
     
  if ActionMode in [1, 4, 5] then
     begin
       FormMain.IL_MenuPopup.GetIcon(8, ScanModeIcon.Picture.Icon);
       case FormMain.PopupSelectScanGamesMode.Tag of
         1: QuickScan.Checked:= True;
         2: ForceAllAvailable.Checked:= True;
       end;
     end
  else
     ClientHeight:= 180; // only scan games and create games list can show the scan mode settings
  ResizeFormSize;
end;

procedure TFormSelectSystem.FormActivate(Sender: TObject);
begin
  if FormSelectSystem.Tag = 1 then
     Exit;

  FormMain.ELV_PopulateSystems(SystemsListView, True, True, Ord(not SystemsListView.Selection.MultiSelect));//1); stars on zero if multi systems
  SystemsListView.BeginUpdate;
  SystemsListView.Items.Items[SystemsListView.Groups.ItemCount-2].Caption:= 'Model 2';
  SystemsListView.EndUpdate;
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

procedure TFormSelectSystem.CreateSoftwareListGamesClick(Sender: TObject);
begin
  if CreateSoftwareListGames.Checked then
     CreateSoftwareListGames.Font.Color:= clBlack
  else
     CreateSoftwareListGames.Font.Color:= $0078695b;
end;

procedure TFormSelectSystem.ScanMAMEAllSetsClick(Sender: TObject);
begin
  ScanMAMESetsBox.Tag:= TAdvOfficeRadioButton(Sender).Tag;
  TAdvOfficeRadioButton(Sender).Font.Style:= [fsBold];
  case TAdvOfficeRadioButton(Sender).Tag of
    0:
      begin
        ScanMAMEArcadeMachines.Font.Style:= [];
        ScanMAMESoftwareListGames.Font.Style:= [];
      end;
    1:
      begin
        ScanMAMEAllSets.Font.Style:= [];
        ScanMAMESoftwareListGames.Font.Style:= [];
      end;
    2:
      begin
        ScanMAMEAllSets.Font.Style:= [];
        ScanMAMEArcadeMachines.Font.Style:= [];
      end;
  end;
end;

procedure TFormSelectSystem.AddMAMEDeviceSetWithNoROMsClick(
  Sender: TObject);
begin
  if AddMAMEDeviceSetWithNoROMs.Checked then
     AddMAMEDeviceSetWithNoROMs.Font.Color:= clBlack
  else
     AddMAMEDeviceSetWithNoROMs.Font.Color:= $0078695b;
end;

procedure TFormSelectSystem.ButtonHelpCreateSoftwareListGamesClick(
  Sender: TObject);
begin
  CallMessageBox;
  FormMain.AddMsgText('    Starting from v0.162, you can run ');
  FormMain.AddMsgText('non-arcade', clBlack, [fsBold]);
  FormMain.AddMsgText(' games with MAME (consoles/computers).'+#13#10+
                      'There is one important rule you must follow to use software list games with Emu Loader:'+#13#10+#13#10);
  FormMain.AddMsgText('    Game files must be in sub-folders with the same name as XML filenames from ', clBlack, [fsBold]);
  FormMain.AddMsgText('mamedir\hash\', $00a65300, [fsBold, fsItalic]);
  FormMain.AddMsgText(' folder.', clBlack, [fsBold]);
  FormMain.AddMsgText(#13#10+#13#10+'    Say you have ');
  FormMain.AddMsgText('rompath d:\emu\mame_roms;d:\emu\mess_roms', $00a65300, [fsBold], taLeftJustify, 9, 'Consolas');
  FormMain.AddMsgText(' in ');
  FormMain.AddMsgText('mame.ini', clBlack, [fsItalic]);
  FormMain.AddMsgText(', and have ');
  FormMain.AddMsgText('H.E.R.O.', clBlack, [fsBold]);
  FormMain.AddMsgText(' (hero.zip)', clMaroon, [fsBold]);
  FormMain.AddMsgText(' game for two different software lists, ');
  FormMain.AddMsgText('Atari 2600', clBlack, [fsBold]);
  FormMain.AddMsgText(' (a2600.xml)', clMaroon, [fsBold]);
  FormMain.AddMsgText(' and ');
  FormMain.AddMsgText('MSX1 Cartridges', clBlack, [fsBold]);
  FormMain.AddMsgText(' (msx1_cart.xml)', clMaroon, [fsBold]);
  FormMain.AddMsgText('. '+#13#10+
                      'Both files should be in the following folders (softlist sub-folders are not required in ');
  FormMain.AddMsgText('mame.ini', clBlack, [fsItalic]);
  FormMain.AddMsgText('):'+#13#10#13#10);
  FormMain.AddMsgText('    Atari 2600', clBlack, [fsBold, fsItalic]);
  FormMain.AddMsgText(' (console system)');
  FormMain.AddMsgText(#13#10+'d:\emu\mame_roms\a2600\hero.zip', clMaroon, [fsBold], taLeftJustify, 9, 'Consolas');
  FormMain.AddMsgText('  or  ', $00a65300, [fsBold]);
  FormMain.AddMsgText('d:\emu\mess_roms\a2600\hero.zip', clMaroon, [fsBold], taLeftJustify, 9, 'Consolas');
  FormMain.AddMsgText(#13#10+#13#10+'    MSX1 Cartridge', clBlack, [fsBold, fsItalic]);
  FormMain.AddMsgText(' (computer system)');
  FormMain.AddMsgText(#13#10+'d:\emu\mame_roms\msx1_cart\hero.zip', clMaroon, [fsBold], taLeftJustify, 9, 'Consolas');
  FormMain.AddMsgText('  or  ', $00a65300, [fsBold]);
  FormMain.AddMsgText('d:\emu\mess_roms\msx1_cart\hero.zip', clMaroon, [fsBold], taLeftJustify, 9, 'Consolas');
  FormMain.AddMsgText(#13#10+#13#10+'    Easy. The same rule applies to game snapshots and video previews. '+
                      'Go here for more details:'+#13#10);
  FormMain.AddMsgText('http://www.mameworld.info/ubbthreads/showthreaded.php?Cat=&Number=341588&page=0&view=collapsed&sb=5&o=&fpart=1&vc=1&new=',
                      $00a65300);
  GenerateMessage('Help', 'Create Software List Games');
end;

procedure TFormSelectSystem.LabelCustomizeSoftwareListMouseEnter(Sender: TObject);
begin
  TShadowLabel(Sender).Font.Color:= clBlue;
  TShadowLabel(Sender).Font.Style:= [fsUnderline];
end;

procedure TFormSelectSystem.LabelCustomizeSoftwareListMouseLeave(Sender: TObject);
begin
  TShadowLabel(Sender).Font.Color:= clNavy;
  TShadowLabel(Sender).Font.Style:= [];
end;

procedure TFormSelectSystem.LabelCustomizeSoftwareListClick(Sender: TObject);
begin
  FormMain.MenuCustomizeSoftwareList.Click;
end;

end.
