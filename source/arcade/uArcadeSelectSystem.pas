unit uArcadeSelectSystem;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  ComCtrls, StdCtrls, MPCommonObjects, MPCommonUtilities, EasyListview,
  ExtCtrls, ShadowLabel, Buttons, PanelEx, uCommon, uCommonCustom, AdvOfficeButtons,
  AdvGroupBox, ImgList, ButtonsEx;

const
  ActionModeStr: array[-1..6] of String = (
    '', // -1 (all systems, available or not)
    '', // 0 (available only, emu + games)
    'Create MAME/Arcade Games List', // 1 (available emu only)
    //'MAME/Arcade Emulator Default Settings', // 2 (available emu only)
    'Emulator Default Settings', // 2 (available emu only)
    'MAME/Arcade Games ROMs Paths', // 3 (available emu only) ... this is no longer used by anything ? (March 15, 2018)
    'Scan MAME/Arcade Games', // 4 (available system, emu + games)
    'Scan MAME/Arcade Games With Missing ROMs/CHDs', // 5 (only systems that have 'sysname.miss' file)
    'Create Software Games List' // 6 (create MAME/HBMAME software lists only... option selected in main menu "Arcade") 
    );

type
  TFormArcadeSelectSystem = class(TForm)
    PanelList: TPanelEx;
    LabelSystemTitle: TShadowLabel;
    SystemsListView: TEasyListview;
    PanelBottom: TPanelEx;
    ButtonOk: TBitBtnEx;
    ButtonCancel: TBitBtnEx;
    AddMAMEDeviceSetWithNoROMs: TAdvOfficeCheckBoxEx;
    MAMESoftwareListBox: TAdvGroupBoxEx;
    MAMESoftwareList_Disabled: TAdvOfficeRadioButtonEx;
    MAMESoftwareList_EnabledUpdate: TAdvOfficeRadioButtonEx;
    MAMESoftwareList_EnabledOverwrite: TAdvOfficeRadioButtonEx;
    LabelMAMESoftwareList_Disabled: TShadowLabel;
    LabelMAMESoftwareList_EnabledUpdate: TShadowLabel;
    LabelMAMESoftwareList_EnabledOverwrite: TShadowLabel;
    ButtonHelpCreateMAMESoftwareListGames: TBitBtnEx;
    LabelCustomizeMAMESoftwareList: TShadowLabel;
    ImageMAMESoftwareList: TImage;
    LabelMAMESoftwareListBox: TShadowLabel;
    ScanModeBox: TAdvGroupBoxEx;
    LabelForceAllAvailable: TShadowLabel;
    LabelQuickScan: TShadowLabel;
    LabelFullScan: TShadowLabel;
    ScanModeIcon: TImage;
    ScanModeCurrentTaskOnly: TAdvOfficeCheckBoxEx;
    QuickScan: TAdvOfficeRadioButtonEx;
    FullScan: TAdvOfficeRadioButtonEx;
    ScanMAMESetsBox: TAdvGroupBoxEx;
    ImageScanMAME: TImage;
    ScanMAMEAllSets: TAdvOfficeRadioButtonEx;
    ScanMAMEArcadeMachines: TAdvOfficeRadioButtonEx;
    ScanMAMESoftwareListGames: TAdvOfficeRadioButtonEx;
    LabelScanModeCurrentTaskOnly_BlankLine: TShape;
    LabelMAMESoftwareListBox_BlankLine: TShape;
    ForceAllAvailable: TAdvOfficeRadioButtonEx;
    LabelMultiSelect: TShadowLabel;
    IL_Systems: TImageList;
    LabelMAMESoftwareListBox_BlankLine2: TShape;
    LabelScanModeCurrentTaskOnly_BlankLine2: TShape;
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
    procedure ScanMAMEAllSetsClick(Sender: TObject);
    procedure AddMAMEDeviceSetWithNoROMsClick(Sender: TObject);
    procedure ButtonHelpCreateMAMESoftwareListGamesClick(Sender: TObject);
    procedure LabelCustomizeMAMESoftwareListMouseEnter(Sender: TObject);
    procedure LabelCustomizeMAMESoftwareListMouseLeave(Sender: TObject);
    procedure LabelCustomizeMAMESoftwareListClick(Sender: TObject);
    procedure MAMESoftwareList_EnabledUpdateClick(Sender: TObject);
    procedure FullScanClick(Sender: TObject);
  private
    { Private declarations }
    procedure SetSystemsState;
    procedure ResizeForm;
  public
    { Public declarations }
    ActionMode, selSysID: ShortInt;
  end;

var
  FormArcadeSelectSystem: TFormArcadeSelectSystem;

implementation

uses uMain;

{$R *.dfm}

procedure TFormArcadeSelectSystem.SetSystemsState;
var
  ShowItem, HaveSystemsEnabled: Boolean;
  Item: TEasyItem;
begin
  HaveSystemsEnabled:= False;
  SystemsListView.BeginUpdate;
  Item:= SystemsListView.Groups.FirstItem;
  repeat
    ShowItem:= True;
    case ActionMode of
      1, 2, 3, 6: ShowItem:= FormMain.ValidateArcadeEmulatorFile(Item.ImageIndex);
      0, 4: ShowItem:= FormMain.ValidateArcadeEmulatorFile(Item.ImageIndex) and FormMain.IsSystemAvailable(Item.ImageIndex);
      5: ShowItem:= FormMain.ValidateArcadeEmulatorFile(Item.ImageIndex) and FormMain.IsSystemAvailable(Item.ImageIndex) and FormMain.ValidateFile(FormMain.GetGamesFolderEL+GetSystemFileName(Item.ImageIndex, 3));
    end;
    if ShowItem then
       begin
         case ActionMode of
           2: ShowItem:= not (Item.ImageIndex in [idDemul, idDICE]); // default settings; no settings screen for Demul / DICE emulators
           3: ShowItem:= not (Item.ImageIndex in [idDaphne, idDICE]); // ROMs paths, no Daphne; no DICE
           5: ShowItem:= Item.ImageIndex <> idDaphne; // scan games with missing ROMs/CHDs; no Daphne
           6: ShowItem:= Item.ImageIndex = selSysID; 
         end;
         if Item.ImageIndex > 0 then
            HaveSystemsEnabled:= True;
       end;
    if (not ShowItem) and (Item.ImageIndex > 0) then
       begin
         Item.State:= Item.State+[esosGhosted];
         if ActionMode = 6 then
            Item.Enabled:= False; // create MAME/HBMAME software games list
       end;
    Item:= SystemsListView.Groups.NextItem(Item);
  until Item = nil;
  if not HaveSystemsEnabled then
     begin
       if SystemsListView.Selection.MultiSelect then // stars on zero if multi systems
          begin
            Item:= SystemsListView.Groups.FirstItem;
            Item.State:= Item.State+[esosGhosted];
          end;
     end;
  SystemsListView.EndUpdate(False);
  if SystemsListView.Selection.MultiSelect then
     FormMain.ELV_SelectItem(SystemsListView, selSysID)
  else
     FormMain.ELV_SelectItem(SystemsListView, selSysID-1);
end;

procedure TFormArcadeSelectSystem.FormKeyPress(Sender: TObject; var Key: Char);
begin
  case Key of
    #13: if ButtonOk.Enabled then ButtonOk.Click;
    #27: ButtonCancel.Click;
  end;
end;

procedure TFormArcadeSelectSystem.ResizeForm;
var
  iScreenWidth, iScreenHeight: Integer;

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
    ScanModeCurrentTaskOnly.Left:= ScanModeCurrentTaskOnly.Left-PixelsToMove;
    ScanMAMESetsBox.Left:= ScanMAMESetsBox.Left-PixelsToMove;
  end;

begin
  Exit; // will do nothing for now... (March 19, 2018)
  iScreenWidth:= Screen.Width;
  iScreenHeight:= Screen.Height;

  if iScreenWidth > 720 then
     Exit;

  if iScreenWidth = 720 then
     begin
       if SystemsListView.Width = 720 then
          begin
             SystemsListView.Left:= 1;

             AddMAMEDeviceSetWithNoROMs.Left:= AddMAMEDeviceSetWithNoROMs.Left-14;

             MoveSettingsLeft(14);
             FormArcadeSelectSystem.ClientWidth:= 704;
          end;
     end
  else
  if iScreenWidth = 640 then
     begin
       //if ActionMode <> 2 then
       begin
         // Emulator default settings; Show ROMs Paths
         SystemsListView.ImagesLarge:= FormMain.IL_ArcadeSystem_ExtraLarge;
         SystemsListView.CellSizes.Icon.Width:= 58;
         SystemsListView.CellSizes.Icon.Height:= 72;
         SystemsListView.Font.Name:= 'Tahoma';
         SystemsListView.Font.Size:= 7;
       end;

       FormArcadeSelectSystem.ClientHeight:= FormArcadeSelectSystem.ClientHeight-20;//+92;
       ForceAllAvailable.Top:= ForceAllAvailable.Top-20;//+92;
       LabelForceAllAvailable.Top:=  LabelForceAllAvailable.Top-20;//+92;
       QuickScan.Top:= QuickScan.Top-20;//+92;
       LabelQuickScan.Top:= LabelQuickScan.Top-20;//+92;
       FullScan.Top:= FullScan.Top-20;//+92;
       LabelFullScan.Top:= LabelFullScan.Top-20;//+92;
       ScanModeIcon.Top:= ScanModeIcon.Top-20;//+92;
       ScanModeCurrentTaskOnly.Top:= ScanModeCurrentTaskOnly.Top-20;//+92;
       LabelMultiSelect.Top:= LabelMultiSelect.Top-20;

       ScanMAMESetsBox.Top:= ScanMAMESetsBox.Top-20;//+92;

       PanelList.Height:= PanelList.Height-20;//+92;
       LabelSystemTitle.Top:= LabelSystemTitle.Top-20;//+92;
       SystemsListView.Height:= SystemsListView.Height-20;//+92;
       if SystemsListView.Width = 720 then
          begin
            ButtonOk.Left:= ButtonOk.Left-48;//117;
            ButtonOk.Width:= 63;
            ButtonCancel.Left:= ButtonCancel.Left-78;//117;
            ButtonCancel.Width:= 63;

            AddMAMEDeviceSetWithNoROMs.Left:= AddMAMEDeviceSetWithNoROMs.Left-173;

            MoveSettingsLeft(90);//(117);
            SystemsListView.Width:= SystemsListView.Width-180;//-234;
            FormArcadeSelectSystem.ClientWidth:= FormArcadeSelectSystem.ClientWidth-180;// -234;
          end
       else
          begin
            LabelMultiSelect.Left:= LabelMultiSelect.Left-160;//102;//-156;
            ButtonOk.Left:= ButtonOk.Left-78;
            ButtonCancel.Left:= ButtonCancel.Left-78;
            AddMAMEDeviceSetWithNoROMs.Left:= AddMAMEDeviceSetWithNoROMs.Left-170;

            MoveSettingsLeft(51);//(78);
            SystemsListView.Width:= SystemsListView.Width-160;//102;//156;
            FormArcadeSelectSystem.ClientWidth:= FormArcadeSelectSystem.ClientWidth-160;//102;//-156;
          end;
       LabelMultiSelect.Font.Size:= 8;
     end;
  LabelSystemTitle.Width:= FormArcadeSelectSystem.ClientWidth;
end;

procedure TFormArcadeSelectSystem.FormShow(Sender: TObject);
begin
  FormMain.ELV_ResetNormalColors(SystemsListView);
  if IsNightMode then
     FormMain.ELV_SetNightModeColors(SystemsListView);
  FormMain.LoadSystemsIcons(IL_Systems, False);
  MAMESoftwareListBox.Tag:= FormMain.MenuCreateMAMESoftwareListGames.Tag; // set MAME Software List mode
  MAMESoftwareListBox.Visible:= ActionMode in [1, 6]; // create games list / create MAME/HBMAME software list "ActionMode" only

  AddMAMEDeviceSetWithNoROMs.Visible:= MAMESoftwareListBox.Visible and (ActionMode <> 6); // only visible when creating games list

  if MAMESoftwareListBox.Visible then
     begin
       case MAMESoftwareListBox.Tag of
         0: MAMESoftwareList_Disabled.Checked:= True;
         2: MAMESoftwareList_EnabledOverwrite.Checked:= True;
       end;
     end;

  if AddMAMEDeviceSetWithNoROMs.Visible then
     AddMAMEDeviceSetWithNoROMs.Checked:= Boolean(FormMain.MenuAddMAMEDeviceSetsWithNoROMs.Tag);

  ScanMAMESetsBox.Tag:= FormMain.MenuCreateMAMESoftwareListGames.HelpContext;
  ScanMAMESetsBox.Visible:= (ActionMode in [1, 4, 5]);

  if ScanMAMESetsBox.Visible then
     begin
       if ScanMAMESetsBox.Tag <> 0 then
          ScanMAMEAllSets.Font.Style:= [];
       case ScanMAMESetsBox.Tag of
         1: ScanMAMEArcadeMachines.Font.Style:= [fsBold];
         2: ScanMAMESoftwareListGames.Font.Style:= [fsBold];
       end;
     end;
     
  SystemsListView.Selection.MultiSelect:= ActionMode in [1, 4, 5]; // create games list / audit games can have multi-selection

  if ActionMode = 6 then
     begin
       Caption:= 'Select a Scan Mode and a Software List Mode';
       LabelMultiSelect.Visible:= False;
     end
  else
  if not SystemsListView.Selection.MultiSelect then
     begin
       Caption:= 'Select a System';
       ClientWidth:= 250;
       ButtonOk.Left:= (ClientWidth-((ButtonOk.Width*2)+9)) div 2;
       ButtonCancel.Left:= ButtonOk.Left+ButtonOk.Width+9;
       //ButtonOk.Left:= ButtonOk.Left-189;
       //ButtonCancel.Left:= ButtonCancel.Left-189;
       LabelMultiSelect.Visible:= False;

       if ActionMode = 2 then // MAME/Arcade default settings
       begin
         ScanModeBox.Visible:= False;
         PanelList.Width:= PanelList.Width+SystemsListView.CellSizes.Icon.Width;
         PanelList.Height:= PanelList.Height-SystemsListView.CellSizes.Icon.Height;
         SystemsListView.Width:= SystemsListView.Width+SystemsListView.CellSizes.Icon.Width;
         SystemsListView.Height:= SystemsListView.Height-SystemsListView.CellSizes.Icon.Height;
         ClientWidth:= ClientWidth+SystemsListView.CellSizes.Icon.Width;

         ButtonOk.Left:= (ClientWidth-((ButtonOk.Width*2)+9)) div 2;
         ButtonCancel.Left:= ButtonOk.Left+ButtonOk.Width+9;

         LabelSystemTitle.Width:= LabelSystemTitle.Width+SystemsListView.CellSizes.Icon.Width;
         LabelSystemTitle.Top:= LabelSystemTitle.Top-SystemsListView.CellSizes.Icon.Height;
         ClientHeight:= ClientHeight-SystemsListView.CellSizes.Icon.Height;
       end;
     end;

  if ActionMode > 0 then
     Caption:= Caption+' ['+ActionModeStr[ActionMode]+']';

  if ScanMAMESetsBox.Visible then
     begin
       FormMain.IL_StandardIconsSmall.GetIcon(MaxGameID+MaxConsoleComputerSystems+1, ImageScanMAME.Picture.Icon);
       case ScanMAMESetsBox.Tag of
         1: ScanMAMEArcadeMachines.Checked:= True;
         2: ScanMAMESoftwareListGames.Checked:= True;
       end;
     end;

  if MAMESoftwareListBox.Visible then
     FormMain.LoadIconIntoImage('emu_ume', ImageMAMESoftwareList);

  if ActionMode in [1, 4, 5, 6] then
     begin
       FormMain.IL_MenuPopup.GetIcon(8, ScanModeIcon.Picture.Icon);
       case FormMain.PopupSelectScanGamesMode.Tag of
         1: QuickScan.Checked:= True;
         2: ForceAllAvailable.Checked:= True;
       end;
     end;
     
  ResizeForm;
end;

procedure TFormArcadeSelectSystem.FormActivate(Sender: TObject);
begin
  if FormArcadeSelectSystem.Tag = 1 then
     Exit;

  FormMain.ELV_PopulateSystems(SystemsListView, True, True, Ord(not SystemsListView.Selection.MultiSelect));// stars on zero if multi systems
  SystemsListView.BeginUpdate;
  SystemsListView.EndUpdate;
  SetSystemsState;
  FormArcadeSelectSystem.Tag:= 1;
end;

procedure TFormArcadeSelectSystem.SystemsListViewItemPaintText(
  Sender: TCustomEasyListview; Item: TEasyItem; Position: Integer;
  ACanvas: TCanvas);
begin
  if Item.Ghosted then
     begin
       ACanvas.Font.Color:= clMedGray;
     end;
end;

procedure TFormArcadeSelectSystem.SystemsListViewItemSelectionChanged(
  Sender: TCustomEasyListview; Item: TEasyItem);
begin
  if Item.Selected then
     begin
       LabelSystemTitle.Caption:= UpperCase(FormMain.GetArcadeEmulatorDescription(Item.ImageIndex));
       if ActionMode <> 6 then
          ButtonOk.Enabled:= not ((Item.Ghosted) and (SystemsListView.Selection.Count = 1))
       else
          ButtonOk.Enabled:= (SystemsListView.Selection.Count = 1) and (MAMESoftwareListBox.Tag <> 0);

       FormMain.ELV_SetSelectRibbon(Ord(Item.Ghosted), SystemsListView);
       Sender.Tag:= Item.ImageIndex;
     end;
end;

procedure TFormArcadeSelectSystem.SystemsListViewKeyAction(
  Sender: TCustomEasyListview; var CharCode: Word; var Shift: TShiftState;
  var DoDefault: Boolean);
begin
  case CharCode of
    VK_RETURN: if ButtonOk.Enabled then ButtonOk.Click;
    VK_ESCAPE: ButtonCancel.Click;
  end;
end;

procedure TFormArcadeSelectSystem.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if ModalResult = mrOk then
     CanClose:= FormMain.CheckSelected(SystemsListView);
end;

procedure TFormArcadeSelectSystem.SystemsListViewDblClick(
  Sender: TCustomEasyListview; Button: TCommonMouseButton;
  MousePos: TPoint; ShiftState: TShiftState; var Handled: Boolean);
begin
  if ButtonOk.Enabled then ButtonOk.Click;
end;

procedure TFormArcadeSelectSystem.ScanMAMEAllSetsClick(Sender: TObject);
begin
  ScanMAMESetsBox.Tag:= TAdvOfficeRadioButtonEx(Sender).Tag;
  TAdvOfficeRadioButtonEx(Sender).Font.Style:= [fsBold];
  case TAdvOfficeRadioButtonEx(Sender).Tag of
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

procedure TFormArcadeSelectSystem.AddMAMEDeviceSetWithNoROMsClick(
  Sender: TObject);
begin
  if AddMAMEDeviceSetWithNoROMs.Checked then
     begin
       if IsNightMode then
          SetCheckBoxColors(AddMAMEDeviceSetWithNoROMs, item_caption_active_color[1], item_caption_active_shadow_color[1], False)
       else
          AddMAMEDeviceSetWithNoROMs.Font.Color:= clBlack
     end
  else
     begin
       if IsNightMode then
          SetCheckBoxColors(AddMAMEDeviceSetWithNoROMs, clrLightGrayFrame, clrDarkGray, False)
       else
          AddMAMEDeviceSetWithNoROMs.Font.Color:= clrLightGrayFrame;
     end;
end;

procedure TFormArcadeSelectSystem.ButtonHelpCreateMAMESoftwareListGamesClick(
  Sender: TObject);
begin
  CallMessageBox;
  FormMain.AddMsgText('    Starting from v0.162, you can run ');
  FormMain.AddMsgText('non-arcade', clBlack, [fsBold]);
  FormMain.AddMsgText(' games with MAME (consoles/computers).'+
                      ' One important rule you must follow to use software list games with Emu Loader:'+#13#10+#13#10);
  FormMain.AddMsgText('    Game files must be in sub-folders named the same name as XML filenames from ', clBlack, [fsBold]);
  FormMain.AddMsgText('mamedir\hash\', MsgTxtColors.colorFileName, [fsBold, fsItalic]);
  FormMain.AddMsgText(' folder.', clBlack, [fsBold]);
  FormMain.AddMsgText(#13#10+#13#10+'    There are three options to choose from:'+#13#10);
  FormMain.AddMsgText('1. ', MsgTxtColors.colorWarning, [fsBold]);
  FormMain.AddMsgText('Disable', MsgTxtColors.colorFileName, [fsBold]);
  FormMain.AddMsgText(': software lists will not be created and all frontend games list files deleted.'+#13#10);
  FormMain.AddMsgText('2. ', MsgTxtColors.colorWarning, [fsBold]);
  FormMain.AddMsgText('Enable, Update Mode', MsgTxtColors.colorFileName, [fsBold]);
  FormMain.AddMsgText(': new software lists will be created and current ones updated only if ');
  FormMain.AddMsgText('CRC32 checksum', clBlack, [fsItalic]);
  FormMain.AddMsgText(' of MAME ');
  FormMain.AddMsgText('softlist.xml', clBlack, [fsItalic]);
  FormMain.AddMsgText(' file is different than the checksum in frontend ');
  FormMain.AddMsgText('softlist.el', clBlack, [fsItalic]);
  FormMain.AddMsgText(' file.'+#13#10);
  FormMain.AddMsgText('3. ', MsgTxtColors.colorWarning, [fsBold]);
  FormMain.AddMsgText('Enable, Overwrite Mode', MsgTxtColors.colorFileName, [fsBold]);
  FormMain.AddMsgText(': all software lists will be created, overwriting current frontend lists even if file checksums match.'+#13#10+#13#10+
                      '    Say you have ');
  FormMain.AddMsgText('rompath d:\emu\mame_roms;d:\emu\mess_roms', MsgTxtColors.colorCmdLine, [fsBold], taLeftJustify, 9, 'Consolas');
  FormMain.AddMsgText(' in ');
  FormMain.AddMsgText('mame.ini', clBlack, [fsItalic]);
  FormMain.AddMsgText(', and have ');
  FormMain.AddMsgText('H.E.R.O.', clBlack, [fsBold]);
  FormMain.AddMsgText(' (hero.zip)', MsgTxtColors.colorWarning, [fsBold]);
  FormMain.AddMsgText(' game for two different software lists, ');
  FormMain.AddMsgText('Atari 2600', clBlack, [fsBold]);
  FormMain.AddMsgText(' (a2600.xml)', MsgTxtColors.colorWarning, [fsBold]);
  FormMain.AddMsgText(' and ');
  FormMain.AddMsgText('MSX1 Cartridges', clBlack, [fsBold]);
  FormMain.AddMsgText(' (msx1_cart.xml)', MsgTxtColors.colorWarning, [fsBold]);
  FormMain.AddMsgText('. '+#13#10+
                      'Both files should be in the following folders (softlist sub-folders are not required in ');
  FormMain.AddMsgText('mame.ini', clBlack, [fsItalic]);
  FormMain.AddMsgText('):'+#13#10#13#10);
  FormMain.AddMsgText('    Atari 2600', clBlack, [fsBold, fsItalic]);
  FormMain.AddMsgText(' (console system)');
  FormMain.AddMsgText(#13#10+'d:\emu\mame_roms\a2600\hero.zip', MsgTxtColors.colorWarning, [fsBold], taLeftJustify, 9, 'Consolas');
  FormMain.AddMsgText('  or  ', MsgTxtColors.colorFileName, [fsBold]);
  FormMain.AddMsgText('d:\emu\mess_roms\a2600\hero.zip', MsgTxtColors.colorWarning, [fsBold], taLeftJustify, 9, 'Consolas');
  FormMain.AddMsgText(#13#10+#13#10+'    MSX1 Cartridge', clBlack, [fsBold, fsItalic]);
  FormMain.AddMsgText(' (computer system)');
  FormMain.AddMsgText(#13#10+'d:\emu\mame_roms\msx1_cart\hero.zip', MsgTxtColors.colorWarning, [fsBold], taLeftJustify, 9, 'Consolas');
  FormMain.AddMsgText('  or  ', MsgTxtColors.colorFileName, [fsBold]);
  FormMain.AddMsgText('d:\emu\mess_roms\msx1_cart\hero.zip', MsgTxtColors.colorWarning, [fsBold], taLeftJustify, 9, 'Consolas');
  FormMain.AddMsgText(#13#10+#13#10+'    Easy. The same rule applies to game snapshots and video previews. '+
                      'Go here for more details:'+#13#10);
  FormMain.AddMsgText('http://www.mameworld.info/ubbthreads/showthreaded.php?Cat=&Number=341588&page=0&view=collapsed&sb=5&o=&fpart=1&vc=1&new=',
                      MsgTxtColors.colorFileName);
  GenerateMessage('Help', 'Software List Games');
end;

procedure TFormArcadeSelectSystem.LabelCustomizeMAMESoftwareListMouseEnter(Sender: TObject);
begin
  if IsNightMode then
     SetLabelColors(TShadowLabel(Sender), clCream, -1, False) // clrLightBlue, clrMedBlue, False)
  else
     TShadowLabel(Sender).Font.Color:= clBlue;
  //TShadowLabel(Sender).Font.Style:= [fsUnderline];
end;

procedure TFormArcadeSelectSystem.LabelCustomizeMAMESoftwareListMouseLeave(Sender: TObject);
begin
  if IsNightMode then
     SetLabelColors(TShadowLabel(Sender), item_shortcut_color[1], item_shortcut_selected_color[1], False)
  else
     TShadowLabel(Sender).Font.Color:= clNavy;
  //TShadowLabel(Sender).Font.Style:= [];
end;

procedure TFormArcadeSelectSystem.LabelCustomizeMAMESoftwareListClick(Sender: TObject);
begin
  FormMain.MenuCustomizeMAMESoftwareList.Click;
end;

procedure TFormArcadeSelectSystem.MAMESoftwareList_EnabledUpdateClick(
  Sender: TObject);
begin
  MAMESoftwareListBox.Tag:= TAdvOfficeRadioButtonEx(Sender).Tag;
  TAdvOfficeRadioButtonEx(Sender).Font.Style:= [fsBold];
  case TAdvOfficeRadioButtonEx(Sender).Tag of
    0:
      begin
        MAMESoftwareList_EnabledUpdate.Font.Style:= [];
        MAMESoftwareList_EnabledOverwrite.Font.Style:= [];
      end;
    1:
      begin
        MAMESoftwareList_Disabled.Font.Style:= [];
        MAMESoftwareList_EnabledOverwrite.Font.Style:= [];
      end;
    2:
      begin
        MAMESoftwareList_Disabled.Font.Style:= [];
        MAMESoftwareList_EnabledUpdate.Font.Style:= [];
      end;
  end;
  if ActionMode = 6 then
     ButtonOk.Enabled:= MAMESoftwareListBox.Tag <> 0;
end;

procedure TFormArcadeSelectSystem.FullScanClick(Sender: TObject);
begin
  ScanModeBox.Tag:= TAdvOfficeRadioButtonEx(Sender).Tag;
  TAdvOfficeRadioButtonEx(Sender).Font.Style:= [fsBold];
  case TAdvOfficeRadioButtonEx(Sender).Tag of
    0:
      begin
        QuickScan.Font.Style:= [];
        ForceAllAvailable.Font.Style:= [];
      end;
    1:
      begin
        FullScan.Font.Style:= [];
        ForceAllAvailable.Font.Style:= [];
      end;
    2:
      begin
        FullScan.Font.Style:= [];
        QuickScan.Font.Style:= [];
      end;
  end;
end;

end.
