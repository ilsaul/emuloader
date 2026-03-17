unit uArcadeScanGamesMode;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  StdCtrls, Buttons, PanelEx, AdvOfficeButtons, ShellAPI,
  ShadowLabel, ExtCtrls, AdvGroupBox, ButtonsEx;

type
  TFormArcadeScanGamesMode = class(TForm)
    PanelBottom: TPanelEx;
    ButtonOk: TBitBtnEx;
    ScanModeBox: TAdvGroupBoxEx;
    ScanModeIcon: TImage;
    FullScan: TAdvOfficeRadioButtonEx;
    QuickScan: TAdvOfficeRadioButtonEx;
    ForceAllAvailable: TAdvOfficeRadioButtonEx;
    ScanMAMESetsBox: TAdvGroupBoxEx;
    ImageScanMAME: TImage;
    ScanMAMEAllSets: TAdvOfficeRadioButtonEx;
    ScanMAMEArcadeMachines: TAdvOfficeRadioButtonEx;
    ScanMAMESoftwareListGames: TAdvOfficeRadioButtonEx;
    LabelFullScan: TShadowLabel;
    LabelQuickScan: TShadowLabel;
    LabelForceAllAvailable: TShadowLabel;
    LabelImportantTips: TShadowLabel;
    MAMESoftwareListBox: TAdvGroupBoxEx;
    LabelMAMESoftwareList_Disabled: TShadowLabel;
    LabelMAMESoftwareList_EnabledUpdate: TShadowLabel;
    LabelMAMESoftwareList_EnabledOverwrite: TShadowLabel;
    ImageMAMESoftwareList: TImage;
    LabelMAMESoftwareListBox_BlankLine: TShape;
    LabelMAMESoftwareListBox: TShadowLabel;
    MAMESoftwareList_Disabled: TAdvOfficeRadioButtonEx;
    MAMESoftwareList_EnabledUpdate: TAdvOfficeRadioButtonEx;
    MAMESoftwareList_EnabledOverwrite: TAdvOfficeRadioButtonEx;
    ButtonHelpCreateMAMESoftwareListGames: TBitBtnEx;
    LabelCustomizeMAMESoftwareList: TShadowLabel;
    AddMAMEDeviceSetWithNoROMs: TAdvOfficeCheckBoxEx;
    LabelMAMESoftwareListBox_BlankLine2: TShape;
    ButtonCancel: TBitBtnEx;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure AddMAMEDeviceSetWithNoROMsClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ScanMAMEAllSetsClick(Sender: TObject);
    procedure LabelCustomizeMAMESoftwareListClick(Sender: TObject);
    procedure LabelCustomizeMAMESoftwareListMouseEnter(Sender: TObject);
    procedure LabelCustomizeMAMESoftwareListMouseLeave(Sender: TObject);
    procedure FullScanClick(Sender: TObject);
    procedure MAMESoftwareList_EnabledUpdateClick(Sender: TObject);
    procedure ButtonHelpCreateMAMESoftwareListGamesClick(Sender: TObject);
  private
    { Private declarations }
    procedure Resize4K;
  public
    { Public declarations }
  end;

var
  FormArcadeScanGamesMode: TFormArcadeScanGamesMode;

implementation

uses uCommon, uCommonCustom, uMain;

{$R *.dfm}

procedure TFormArcadeScanGamesMode.Resize4K;
begin
  if not Is4KMode then
     Exit;

  with FormArcadeScanGamesMode do
  begin
    ClientWidth:=  710;
    ClientHeight:= 811;
    Font.Size:= 16;

    PanelBottom.Height:= 71;
    FormMain.Set4KButtonsOkCancelPanel(PanelBottom, ButtonOk, ButtonCancel);

    FormMain.Set4KLabelSpecs(LabelImportantTips, 62, 678, 588, 55, 16);
    FormMain.Set4KCheckBoxSpecs(AddMAMEDeviceSetWithNoROMs, 294, 624, 400, 36, 16);

    FormMain.Set4KGroupBoxSpecs(ScanModeBox, 10, 10, 690, 294, 16);
    ScanModeBox.Caption:= '         Choose Scan Mode ';

    FormMain.Set4KImageIconSpecs(ScanModeIcon, 32);

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

    FormMain.Set4KGroupBoxSpecs(MAMESoftwareListBox, 10, 352, 690, 249, 16);
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
  end;
end;

procedure TFormArcadeScanGamesMode.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key in [#13, #27] then
     Close;
end;

procedure TFormArcadeScanGamesMode.AddMAMEDeviceSetWithNoROMsClick(
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

procedure TFormArcadeScanGamesMode.FormShow(Sender: TObject);
var
  Loop: Integer;
begin
  //ScanMAMESetsBox.Tag:= FormMain.MenuCreateMAMESoftwareListGames.HelpContext;
  Resize4K;
  if IsNightMode then
     begin
       FormArcadeScanGamesMode.Color:= menu_background_color[1];
       SetBottomPanelColors(PanelBottom);

       for Loop:= 0 to FormArcadeScanGamesMode.ComponentCount-1 do
       begin
         if FormArcadeScanGamesMode.Components[Loop] is TAdvOfficeRadioButtonEx then
         begin
           SetRadioButtonColors(TAdvOfficeRadioButtonEx(FormArcadeScanGamesMode.Components[Loop]), item_caption_active_color[1], item_caption_active_shadow_color[1]);
           FormMain.SetRadioButtonExCustomIcon(TAdvOfficeRadioButtonEx(FormArcadeScanGamesMode.Components[Loop]));
         end
         else
         if FormArcadeScanGamesMode.Components[Loop] is TAdvOfficeCheckBoxEx then
         begin
           SetCheckBoxColors(TAdvOfficeCheckBoxEx(FormArcadeScanGamesMode.Components[Loop]), item_caption_active_color[1], item_caption_active_shadow_color[1]);
           FormMain.SetCheckBoxExCustomIcon(TAdvOfficeCheckBoxEx(FormArcadeScanGamesMode.Components[Loop]));
         end
         else
         if FormArcadeScanGamesMode.Components[Loop] is TAdvGroupBoxEx then
         begin
           SetGroupBoxBorderStyle(TAdvGroupBoxEx(FormArcadeScanGamesMode.Components[Loop]));
           SetGroupBoxColors(TAdvGroupBoxEx(FormArcadeScanGamesMode.Components[Loop]), clrBorderGroupBoxGrayBk, clrInnerBorderGroupBoxGrayBk, item_caption_active_color[1], item_caption_active_shadow_color[1], -1, clrMedDarkGray, False);
         end
         else
         if FormArcadeScanGamesMode.Components[Loop] is TBitBtnEx then
            FormMain.SetButtonExColors(TBitBtnEx(FormArcadeScanGamesMode.Components[Loop]));
       end;

       LabelMAMESoftwareListBox_BlankLine.Pen.Color:= FormArcadeScanGamesMode.Color;
       LabelMAMESoftwareListBox_BlankLine2.Pen.Color:= FormArcadeScanGamesMode.Color;
       SetLabelColors(LabelFullScan,          clrLightBlue, clNavy);
       SetLabelColors(LabelQuickScan,         clrLightBlue, clNavy);
       SetLabelColors(LabelForceAllAvailable, clrLightBlue, clNavy);

       SetLabelColors(LabelMAMESoftwareListBox,               clrLightBlue, clNavy);
       SetLabelColors(LabelMAMESoftwareList_Disabled,         clrLightRed, clMaroon);
       SetLabelColors(LabelMAMESoftwareList_EnabledUpdate,    clrLightRed, clMaroon);
       SetLabelColors(LabelMAMESoftwareList_EnabledOverwrite, clrLightRed, clMaroon);
       SetLabelColors(LabelCustomizeMAMESoftwareList,         item_shortcut_color[1], item_shortcut_selected_color[1]);

       SetLabelColors(LabelImportantTips, clrLightRed, clMaroon);
     end;

  if Is4KMode then
     begin
       FormMain.IL_MediaType_Large.GetIcon(0, ScanModeIcon.Picture.Icon);
       FormMain.IL_StandardIconsLarge.GetIcon(MaxGameID+MaxConsoleComputerSystems+idMAME, ImageScanMAME.Picture.Icon);
       FormMain.IL_StandardIconsLarge.GetIcon(MaxGameID+MaxConsoleComputerSystems+MaxArcadeSystems+1, ImageMAMESoftwareList.Picture.Icon);
     end
  else
     begin   // IL_LeftPanel will always be 16x16 (April 14, 2021)
       FormMain.IL_LeftPanel.GetIcon(15, ScanModeIcon.Picture.Icon);
       FormMain.IL_StandardIconsSmall.GetIcon(MaxGameID+MaxConsoleComputerSystems+idMAME, ImageScanMAME.Picture.Icon);
       FormMain.IL_StandardIconsSmall.GetIcon(MaxGameID+MaxConsoleComputerSystems+MaxArcadeSystems+1, ImageMAMESoftwareList.Picture.Icon);
     end;

  case FormMain.PopupSelectScanGamesMode.Tag of
    1: QuickScan.Checked:= True;
    2: ForceAllAvailable.Checked:= True;
  end;

  case FormMain.MenuCreateMAMESoftwareListGames.HelpContext of
    1: ScanMAMEArcadeMachines.Checked:= True;
    2: ScanMAMESoftwareListGames.Checked:= True;
  end;
  
  case FormMain.MenuCreateMAMESoftwareListGames.Tag of
    0: MAMESoftwareList_Disabled.Checked:= True;
    2: MAMESoftwareList_EnabledOverwrite.Checked:= True;
  end;

  AddMAMEDeviceSetWithNoROMs.Checked:= Boolean(FormMain.MenuAddMAMEDeviceSetsWithNoROMs.Tag);
end;

procedure TFormArcadeScanGamesMode.ScanMAMEAllSetsClick(Sender: TObject);
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
             ScanMAMEArcadeMachines.Font.Name:= FormArcadeScanGamesMode.Font.Name;
             ScanMAMESoftwareListGames.Font.Name:= FormArcadeScanGamesMode.Font.Name;
           end;
      end;
    1:
      begin
        ScanMAMEAllSets.Font.Style:= [];
        ScanMAMESoftwareListGames.Font.Style:= [];
        if Is4KMode then
           begin
             ScanMAMEAllSets.Font.Name:= FormArcadeScanGamesMode.Font.Name;
             ScanMAMESoftwareListGames.Font.Name:= FormArcadeScanGamesMode.Font.Name;
           end;
      end;
    2:
      begin
        ScanMAMEAllSets.Font.Style:= [];
        ScanMAMEArcadeMachines.Font.Style:= [];
        if Is4KMode then
           begin
             ScanMAMEAllSets.Font.Name:= FormArcadeScanGamesMode.Font.Name;
             ScanMAMEArcadeMachines.Font.Name:= FormArcadeScanGamesMode.Font.Name;
           end;
      end;
  end;
end;

procedure TFormArcadeScanGamesMode.LabelCustomizeMAMESoftwareListClick(Sender: TObject);
begin
  FormMain.MenuCustomizeMAMESoftwareList.Click;
end;

procedure TFormArcadeScanGamesMode.LabelCustomizeMAMESoftwareListMouseEnter(Sender: TObject);
begin
  if IsNightMode then
     SetLabelColors(TShadowLabel(Sender), clCream)
  else
     TShadowLabel(Sender).Font.Color:= clBlue;
end;

procedure TFormArcadeScanGamesMode.LabelCustomizeMAMESoftwareListMouseLeave(Sender: TObject);
begin
  if IsNightMode then
     SetLabelColors(TShadowLabel(Sender), item_shortcut_color[1], item_shortcut_selected_color[1])
  else
     TShadowLabel(Sender).Font.Color:= clNavy;
end;

procedure TFormArcadeScanGamesMode.FullScanClick(Sender: TObject);
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
             QuickScan.Font.Name:= FormArcadeScanGamesMode.Font.Name;
             ForceAllAvailable.Font.Name:= FormArcadeScanGamesMode.Font.Name;
           end;
      end;
    1:
      begin
        FullScan.Font.Style:= [];
        ForceAllAvailable.Font.Style:= [];
        if Is4KMode then
           begin
             FullScan.Font.Name:= FormArcadeScanGamesMode.Font.Name;
             ForceAllAvailable.Font.Name:= FormArcadeScanGamesMode.Font.Name;
           end;
      end;
    2:
      begin
        FullScan.Font.Style:= [];
        QuickScan.Font.Style:= [];
        if Is4KMode then
           begin
             FullScan.Font.Name:= FormArcadeScanGamesMode.Font.Name;
             QuickScan.Font.Name:= FormArcadeScanGamesMode.Font.Name;
           end;
      end;
  end;
end;

procedure TFormArcadeScanGamesMode.MAMESoftwareList_EnabledUpdateClick(
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
             MAMESoftwareList_EnabledUpdate.Font.Name:= FormArcadeScanGamesMode.Font.Name;
             MAMESoftwareList_EnabledOverwrite.Font.Name:= FormArcadeScanGamesMode.Font.Name;
           end;
      end;
    1:
      begin
        MAMESoftwareList_Disabled.Font.Style:= [];
        MAMESoftwareList_EnabledOverwrite.Font.Style:= [];
        if Is4KMode then
           begin
             MAMESoftwareList_Disabled.Font.Name:= FormArcadeScanGamesMode.Font.Name;
             MAMESoftwareList_EnabledOverwrite.Font.Name:= FormArcadeScanGamesMode.Font.Name;
           end;
      end;
    2:
      begin
        MAMESoftwareList_Disabled.Font.Style:= [];
        MAMESoftwareList_EnabledUpdate.Font.Style:= [];
        if Is4KMode then
           begin
             MAMESoftwareList_Disabled.Font.Name:= FormArcadeScanGamesMode.Font.Name;
             MAMESoftwareList_EnabledUpdate.Font.Name:= FormArcadeScanGamesMode.Font.Name;
           end;
      end;
  end;
end;

procedure TFormArcadeScanGamesMode.ButtonHelpCreateMAMESoftwareListGamesClick(
  Sender: TObject);
begin
  FormMain.SelectScanGamesModeHelpButton;
end;


end.
