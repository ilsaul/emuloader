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
    procedure Resize4K;
  public
    { Public declarations }
    ActionMode, selSysID: ShortInt;
  end;

var
  FormArcadeSelectSystem: TFormArcadeSelectSystem;

implementation

uses uMain;

{$R *.dfm}

procedure TFormArcadeSelectSystem.Resize4K;
var
  iPos: Integer;
begin
  if not Is4KMode then
     Exit;

  with FormArcadeSelectSystem do
  begin
    FormMain.Set4KImageListSpecs(IL_Systems, 128);
    FormMain.Set4KArcadeSysPanel(PanelList, SystemsListView, nil, LabelSystemTitle, nil, True);
    ClientWidth:= PanelList.Width+10+710;
    ClientHeight:= 721;//811;
    Font.Size:= 16;

    iPos:= PanelList.Width;
    PanelBottom.Height:= 71;
    FormMain.Set4KButtonsOkCancelPanel(PanelBottom, ButtonOk, ButtonCancel, False);

    //FormMain.Set4KLabelSpecs(LabelImportantTips, 62, 678, 588, 55, 16);
    FormMain.Set4KCheckBoxSpecs(AddMAMEDeviceSetWithNoROMs, iPos+294, 624, 400, 36, 16);

    FormMain.Set4KGroupBoxSpecs(ScanModeBox, iPos+10, 10, 690, 294, 16);
    ScanModeBox.Caption:= '         Choose Scan Mode ';

    FormMain.Set4KImageIconSpecs(ScanModeIcon, 32);

    FormMain.Set4KCheckBoxSpecs(ScanModeCurrentTaskOnly, 470, -1, 195, 36, 16);

    FormMain.Set4KShapeSpecs(LabelScanModeCurrentTaskOnly_BlankLine,  ScanModeCurrentTaskOnly.Left-9, 16, ScanModeCurrentTaskOnly.Width+18);
    FormMain.Set4KShapeSpecs(LabelScanModeCurrentTaskOnly_BlankLine2, ScanModeCurrentTaskOnly.Left-9, 17, ScanModeCurrentTaskOnly.Width+18);

    FormMain.Set4KRadioButtonSpecs(FullScan,          10,  46, 120, 36, 16);
    FormMain.Set4KRadioButtonSpecs(QuickScan,         10,  96, 140, 36, 16);
    FormMain.Set4KRadioButtonSpecs(ForceAllAvailable, 10, 146, 250, 36, 16);
    FormMain.Set4KRadioButtonFontNameSpecs(FullScan);

    FormMain.Set4KLabelSpecs(LabelFullScan,          209,  48, -1, -1, 16);
    FormMain.Set4KLabelSpecs(LabelQuickScan,         224,  98, -1, -1, 16);
    FormMain.Set4KLabelSpecs(LabelForceAllAvailable, 350, 148, -1, -1, 16);

    FormMain.Set4KGroupBoxSpecs(ScanMAMESetsBox, 7, 208, 679, 83, 16);
    ScanMAMESetsBox.Caption:= '        Scan MAME Sets (v0.162 or newer)';

    FormMain.Set4KImageIconSpecs(ImageScanMAME, 32);

    FormMain.Set4KRadioButtonSpecs(ScanMAMEAllSets,             2, 46, 105, 36, 16);
    FormMain.Set4KRadioButtonSpecs(ScanMAMEArcadeMachines,    180, 46, 200, 36, 16);
    FormMain.Set4KRadioButtonSpecs(ScanMAMESoftwareListGames, 452, 46, 225, 36, 16);
    FormMain.Set4KRadioButtonFontNameSpecs(ScanMAMEAllSets);

    FormMain.Set4KGroupBoxSpecs(MAMESoftwareListBox, iPos+10, 352, 690, 249, 16);
    MAMESoftwareListBox.Caption:= '         MAME Software List Games ';

    FormMain.Set4KImageIconSpecs(ImageMAMESoftwareList, 32);

    FormMain.Set4KLabelSpecs(LabelMAMESoftwareListBox, 356, 1, -1, -1, 16);
    LabelMAMESoftwareListBox.Caption:= 'console/computer/handheld';
    FormMain.Set4KButtonSpecs(ButtonHelpCreateMAMESoftwareListGames, 628, 0, 36, 36, 16);

    FormMain.Set4KShapeSpecs(LabelMAMESoftwareListBox_BlankLine,  347, 16, 327);
    FormMain.Set4KShapeSpecs(LabelMAMESoftwareListBox_BlankLine2, 347, 17, 327);

    FormMain.Set4KRadioButtonSpecs(MAMESoftwareList_Disabled,         10,  46, 140, 36, 16);
    FormMain.Set4KRadioButtonSpecs(MAMESoftwareList_EnabledUpdate,    10,  96, 240, 36, 16);
    FormMain.Set4KRadioButtonSpecs(MAMESoftwareList_EnabledOverwrite, 10, 146, 270, 36, 16);
    FormMain.Set4KRadioButtonFontNameSpecs(MAMESoftwareList_EnabledUpdate);

    FormMain.Set4KLabelSpecs(LabelMAMESoftwareList_Disabled,         356,  48, -1, -1, 16);
    FormMain.Set4KLabelSpecs(LabelMAMESoftwareList_EnabledUpdate,    338,  98, -1, -1, 16);
    FormMain.Set4KLabelSpecs(LabelMAMESoftwareList_EnabledOverwrite, 352, 148, -1, -1, 16);

    FormMain.Set4KLabelSpecs(LabelCustomizeMAMESoftwareList, 112, 202, -1, -1, 14);

    LabelMultiSelect.Font.Size:= 16;
    FormMain.Set4KLabelSpecs(LabelMultiSelect, (PanelList.Width-LabelMultiSelect.Width) div 2, -1, -1, -1, 16);
 end;
end;

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

procedure TFormArcadeSelectSystem.FormShow(Sender: TObject);
var
  Loop: Integer;
begin
  Resize4K;
  FormMain.ELV_ResetNormalColors(SystemsListView);
  if IsNightMode then
     begin
       FormArcadeSelectSystem.Color:= menu_background_color[1];
       FormArcadeSelectSystem.PanelList.Color1:= menu_background_color[1];
       SetBottomPanelColors(PanelBottom);

       FormMain.SetEasyListViewColors(SystemsListView, menu_background_color[1], item_caption_active_color[1]);

       FormMain.SetSystemTitleLabelColors(LabelSystemTitle);
       LabelSystemTitle.Transparent:= True;

       for Loop:= 0 to FormArcadeSelectSystem.ComponentCount-1 do
       begin
         if FormArcadeSelectSystem.Components[Loop] is TAdvOfficeRadioButtonEx then
         begin
           SetRadioButtonColors(TAdvOfficeRadioButtonEx(FormArcadeSelectSystem.Components[Loop]), item_caption_active_color[1], item_caption_active_shadow_color[1]);
           FormMain.SetRadioButtonExCustomIcon(TAdvOfficeRadioButtonEx(FormArcadeSelectSystem.Components[Loop]));
         end
         else
         if FormArcadeSelectSystem.Components[Loop] is TAdvOfficeCheckBoxEx then
         begin
           SetCheckBoxColors(TAdvOfficeCheckBoxEx(FormArcadeSelectSystem.Components[Loop]), item_caption_active_color[1], item_caption_active_shadow_color[1]);
           FormMain.SetCheckBoxExCustomIcon(TAdvOfficeCheckBoxEx(FormArcadeSelectSystem.Components[Loop]));
         end
         else
         if FormArcadeSelectSystem.Components[Loop] is TAdvGroupBoxEx then
         begin
           SetGroupBoxBorderStyle(TAdvGroupBoxEx(FormArcadeSelectSystem.Components[Loop]));
           SetGroupBoxColors(TAdvGroupBoxEx(FormArcadeSelectSystem.Components[Loop]), clrBorderGroupBoxGrayBk, clrInnerBorderGroupBoxGrayBk, item_caption_active_color[1], item_caption_active_shadow_color[1], -1, clrMedDarkGray, False);
         end
         else
         if FormArcadeSelectSystem.Components[Loop] is TBitBtnEx then
            FormMain.SetButtonExColors(TBitBtnEx(FormArcadeSelectSystem.Components[Loop]));
       end;

       SetLabelColors(LabelFullScan,          clrLightBlue, clNavy);
       SetLabelColors(LabelQuickScan,         clrLightBlue, clNavy);
       SetLabelColors(LabelForceAllAvailable, clrLightBlue, clNavy);

       SetLabelColors(LabelMAMESoftwareListBox,               clrLightBlue, clNavy);
       SetLabelColors(LabelMAMESoftwareList_Disabled,         clrLightRed, clMaroon);
       SetLabelColors(LabelMAMESoftwareList_EnabledUpdate,    clrLightRed, clMaroon);
       SetLabelColors(LabelMAMESoftwareList_EnabledOverwrite, clrLightRed, clMaroon);
       SetLabelColors(LabelCustomizeMAMESoftwareList,         item_shortcut_color[1], item_shortcut_selected_color[1]);

       SetLabelColors(LabelMultiSelect, item_caption_active_color[1], item_caption_active_shadow_color[1]);

       LabelMAMESoftwareListBox_BlankLine.Pen.Color:=      FormArcadeSelectSystem.Color;
       LabelMAMESoftwareListBox_BlankLine2.Pen.Color:=     FormArcadeSelectSystem.Color;
       LabelScanModeCurrentTaskOnly_BlankLine.Pen.Color:=  FormArcadeSelectSystem.Color;
       LabelScanModeCurrentTaskOnly_BlankLine2.Pen.Color:= FormArcadeSelectSystem.Color;

       FormMain.ELV_SetNightModeColors(SystemsListView);
     end;

  FormMain.LoadSystemsIcons(IL_Systems, False);
  FormMain.ShowIconErrorMessage;
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

       if Is4KMode then
          begin
            case ScanMAMESetsBox.Tag of
              1: FormMain.Set4KRadioButtonFontNameSpecs(ScanMAMEArcadeMachines);
              2: FormMain.Set4KRadioButtonFontNameSpecs(ScanMAMESoftwareListGames);
            end;
          end
       else
          begin
            case ScanMAMESetsBox.Tag of
              1: ScanMAMEArcadeMachines.Font.Style:= [fsBold];
              2: ScanMAMESoftwareListGames.Font.Style:= [fsBold];
            end;
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
       ClientWidth:= PanelList.Width;
       // ClientWidth:= 250;

       if Is4KMode then
          FormMain.Set4KButtonsOkCancelPanel(PanelBottom, ButtonOk, ButtonCancel)
       else
          begin
            ButtonOk.Left:= (ClientWidth-((ButtonOk.Width*2)+9)) div 2;
            ButtonCancel.Left:= ButtonOk.Left+ButtonOk.Width+9;
          end;

       LabelMultiSelect.Visible:= False;

       if ActionMode = 2 then // MAME/Arcade default settings
       begin
         ScanModeBox.Visible:= False;
         PanelList.Width:= PanelList.Width+SystemsListView.CellSizes.Icon.Width;
         PanelList.Height:= PanelList.Height-SystemsListView.CellSizes.Icon.Height;
         SystemsListView.Width:= SystemsListView.Width+SystemsListView.CellSizes.Icon.Width;
         SystemsListView.Height:= SystemsListView.Height-SystemsListView.CellSizes.Icon.Height;
         ClientWidth:= ClientWidth+SystemsListView.CellSizes.Icon.Width;

         if Is4KMode then
            FormMain.Set4KButtonsOkCancelPanel(PanelBottom, ButtonOk, ButtonCancel)
         else
            begin
              ButtonOk.Left:= (ClientWidth-((ButtonOk.Width*2)+9)) div 2;
              ButtonCancel.Left:= ButtonOk.Left+ButtonOk.Width+9;
            end;

         LabelSystemTitle.Width:= LabelSystemTitle.Width+SystemsListView.CellSizes.Icon.Width;
         LabelSystemTitle.Top:= LabelSystemTitle.Top-SystemsListView.CellSizes.Icon.Height;
         ClientHeight:= ClientHeight-SystemsListView.CellSizes.Icon.Height;
       end;
     end;

  if ActionMode > 0 then
     Caption:= Caption+' ['+ActionModeStr[ActionMode]+']';

  if ScanMAMESetsBox.Visible then
     begin
       if Is4KMode then
          FormMain.IL_StandardIconsLarge.GetIcon(MaxGameID+MaxConsoleComputerSystems+idMAME, ImageScanMAME.Picture.Icon)
       else
          FormMain.IL_StandardIconsSmall.GetIcon(MaxGameID+MaxConsoleComputerSystems+idMAME, ImageScanMAME.Picture.Icon);
       case ScanMAMESetsBox.Tag of
         1: ScanMAMEArcadeMachines.Checked:= True;
         2: ScanMAMESoftwareListGames.Checked:= True;
       end;
     end;

  if MAMESoftwareListBox.Visible then
     begin
       if Is4KMode then
          FormMain.IL_StandardIconsLarge.GetIcon(MaxGameID+MaxConsoleComputerSystems+MaxArcadeSystems+1, ImageMAMESoftwareList.Picture.Icon)
       else
          FormMain.IL_StandardIconsSmall.GetIcon(MaxGameID+MaxConsoleComputerSystems+MaxArcadeSystems+1, ImageMAMESoftwareList.Picture.Icon);
     end;

  if ActionMode in [1, 4, 5, 6] then
     begin
       if Is4KMode then
          FormMain.IL_MediaType_Large.GetIcon(0, ScanModeIcon.Picture.Icon)
       else        // IL_LeftPanel will always be 16x16 (April 14, 2021)
          FormMain.IL_LeftPanel.GetIcon(15, ScanModeIcon.Picture.Icon);
       case FormMain.PopupSelectScanGamesMode.Tag of
         1: QuickScan.Checked:= True;
         2: ForceAllAvailable.Checked:= True;
       end;
     end;
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
  FormMain.ELV_SetGhostedIconText(Item, SystemsListView, ACanvas);
  //if Item.Ghosted then
  //   ACanvas.Font.Color:= clMedGray;
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
  if Is4KMode then
     FormMain.Set4KRadioButtonFontNameSpecs(TAdvOfficeRadioButtonEx(Sender))
  else
     TAdvOfficeRadioButtonEx(Sender).Font.Style:= [fsBold];
  case TAdvOfficeRadioButtonEx(Sender).Tag of
    0:
      begin
        ScanMAMEArcadeMachines.Font.Style:= [];
        ScanMAMESoftwareListGames.Font.Style:= [];
        if Is4KMode then
           begin
             ScanMAMEArcadeMachines.Font.Name:= FormArcadeSelectSystem.Font.Name;
             ScanMAMESoftwareListGames.Font.Name:= FormArcadeSelectSystem.Font.Name;
           end;
      end;
    1:
      begin
        ScanMAMEAllSets.Font.Style:= [];
        ScanMAMESoftwareListGames.Font.Style:= [];
        if Is4KMode then
           begin
             ScanMAMEAllSets.Font.Name:= FormArcadeSelectSystem.Font.Name;
             ScanMAMESoftwareListGames.Font.Name:= FormArcadeSelectSystem.Font.Name;
           end;
      end;
    2:
      begin
        ScanMAMEAllSets.Font.Style:= [];
        ScanMAMEArcadeMachines.Font.Style:= [];
        if Is4KMode then
           begin
             ScanMAMEAllSets.Font.Name:= FormArcadeSelectSystem.Font.Name;
             ScanMAMEArcadeMachines.Font.Name:= FormArcadeSelectSystem.Font.Name;
           end;
      end;
  end;
end;

procedure TFormArcadeSelectSystem.AddMAMEDeviceSetWithNoROMsClick(
  Sender: TObject);
begin
  if AddMAMEDeviceSetWithNoROMs.Checked then
     begin
       if IsNightMode then
          SetCheckBoxColors(AddMAMEDeviceSetWithNoROMs, item_caption_active_color[1], item_caption_active_shadow_color[1])
       else
          AddMAMEDeviceSetWithNoROMs.Font.Color:= clBlack
     end
  else
     begin
       if IsNightMode then
          SetCheckBoxColors(AddMAMEDeviceSetWithNoROMs, clrLightGrayFrame, clrDarkGray)
       else
          AddMAMEDeviceSetWithNoROMs.Font.Color:= clrLightGrayFrame;
     end;
end;

procedure TFormArcadeSelectSystem.ButtonHelpCreateMAMESoftwareListGamesClick(
  Sender: TObject);
begin
  FormMain.SelectScanGamesModeHelpButton;
end;

procedure TFormArcadeSelectSystem.LabelCustomizeMAMESoftwareListMouseEnter(Sender: TObject);
begin
  if IsNightMode then
     SetLabelColors(TShadowLabel(Sender), clCream)
  else
     TShadowLabel(Sender).Font.Color:= clBlue;
end;

procedure TFormArcadeSelectSystem.LabelCustomizeMAMESoftwareListMouseLeave(Sender: TObject);
begin
  if IsNightMode then
     SetLabelColors(TShadowLabel(Sender), item_shortcut_color[1], item_shortcut_selected_color[1])
  else
     TShadowLabel(Sender).Font.Color:= clNavy;
end;

procedure TFormArcadeSelectSystem.LabelCustomizeMAMESoftwareListClick(Sender: TObject);
begin
  FormMain.MenuCustomizeMAMESoftwareList.Click;
end;

procedure TFormArcadeSelectSystem.MAMESoftwareList_EnabledUpdateClick(
  Sender: TObject);
begin
  MAMESoftwareListBox.Tag:= TAdvOfficeRadioButtonEx(Sender).Tag;
  if Is4KMode then
     FormMain.Set4KRadioButtonFontNameSpecs(TAdvOfficeRadioButtonEx(Sender))
  else
     TAdvOfficeRadioButtonEx(Sender).Font.Style:= [fsBold];
  case TAdvOfficeRadioButtonEx(Sender).Tag of
    0:
      begin
        MAMESoftwareList_EnabledUpdate.Font.Style:= [];
        MAMESoftwareList_EnabledOverwrite.Font.Style:= [];
        if Is4KMode then
           begin
             MAMESoftwareList_EnabledUpdate.Font.Name:= FormArcadeSelectSystem.Font.Name;
             MAMESoftwareList_EnabledOverwrite.Font.Name:= FormArcadeSelectSystem.Font.Name;
           end;
      end;
    1:
      begin
        MAMESoftwareList_Disabled.Font.Style:= [];
        MAMESoftwareList_EnabledOverwrite.Font.Style:= [];
        if Is4KMode then
           begin
             MAMESoftwareList_Disabled.Font.Name:= FormArcadeSelectSystem.Font.Name;
             MAMESoftwareList_EnabledOverwrite.Font.Name:= FormArcadeSelectSystem.Font.Name;
           end;
      end;
    2:
      begin
        MAMESoftwareList_Disabled.Font.Style:= [];
        MAMESoftwareList_EnabledUpdate.Font.Style:= [];
        if Is4KMode then
           begin
             MAMESoftwareList_Disabled.Font.Name:= FormArcadeSelectSystem.Font.Name;
             MAMESoftwareList_EnabledUpdate.Font.Name:= FormArcadeSelectSystem.Font.Name;
           end;
      end;
  end;

  if ActionMode = 6 then
     ButtonOk.Enabled:= MAMESoftwareListBox.Tag <> 0;
end;

procedure TFormArcadeSelectSystem.FullScanClick(Sender: TObject);
begin
  ScanModeBox.Tag:= TAdvOfficeRadioButtonEx(Sender).Tag;
  if Is4KMode then
     FormMain.Set4KRadioButtonFontNameSpecs(TAdvOfficeRadioButtonEx(Sender))
  else
     TAdvOfficeRadioButtonEx(Sender).Font.Style:= [fsBold];
  case TAdvOfficeRadioButtonEx(Sender).Tag of
    0:
      begin
        QuickScan.Font.Style:= [];
        ForceAllAvailable.Font.Style:= [];
        if Is4KMode then
           begin
             QuickScan.Font.Name:= FormArcadeSelectSystem.Font.Name;
             ForceAllAvailable.Font.Name:= FormArcadeSelectSystem.Font.Name;
           end;
      end;
    1:
      begin
        FullScan.Font.Style:= [];
        ForceAllAvailable.Font.Style:= [];
        if Is4KMode then
           begin
             FullScan.Font.Name:= FormArcadeSelectSystem.Font.Name;
             ForceAllAvailable.Font.Name:= FormArcadeSelectSystem.Font.Name;
           end;
      end;
    2:
      begin
        FullScan.Font.Style:= [];
        QuickScan.Font.Style:= [];
        if Is4KMode then
           begin
             FullScan.Font.Name:= FormArcadeSelectSystem.Font.Name;
             QuickScan.Font.Name:= FormArcadeSelectSystem.Font.Name;
           end;
      end;
  end;
end;


end.
