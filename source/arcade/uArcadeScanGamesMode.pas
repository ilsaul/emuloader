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
  public
    { Public declarations }
  end;

var
  FormArcadeScanGamesMode: TFormArcadeScanGamesMode;

implementation

uses uCommon, uCommonCustom, uMain;

{$R *.dfm}

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

  FormMain.IL_MenuPopup.GetIcon(8, ScanModeIcon.Picture.Icon);
  FormMain.IL_StandardIconsSmall.GetIcon(MaxGameID+MaxConsoleComputerSystems+1, ImageScanMAME.Picture.Icon);
  FormMain.LoadIconIntoImage('emu_ume', ImageMAMESoftwareList);

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

  {if ScanMAMESetsBox.Tag <> 0 then
     ScanMAMEAllSets.Font.Style:= [];

  case ScanMAMESetsBox.Tag of
    1:
      begin
        ScanMAMEArcadeMachines.Font.Style:= [fsBold];
        ScanMAMEArcadeMachines.Checked:= True;
      end;
    2:
      begin
        ScanMAMESoftwareListGames.Font.Style:= [fsBold];
        ScanMAMESoftwareListGames.Checked:= True;
      end;
  end;}
end;

procedure TFormArcadeScanGamesMode.ScanMAMEAllSetsClick(Sender: TObject);
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

procedure TFormArcadeScanGamesMode.MAMESoftwareList_EnabledUpdateClick(
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
end;

procedure TFormArcadeScanGamesMode.ButtonHelpCreateMAMESoftwareListGamesClick(
  Sender: TObject);
begin
  FormMain.SelectScanGamesModeHelpButton;
end;


end.
