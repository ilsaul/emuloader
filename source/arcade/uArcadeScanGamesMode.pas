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
begin
  //ScanMAMESetsBox.Tag:= FormMain.MenuCreateMAMESoftwareListGames.HelpContext;
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
     SetLabelColors(TShadowLabel(Sender), clrLightBlue, clrMedBlue)
  else
     TShadowLabel(Sender).Font.Color:= clBlue;
  TShadowLabel(Sender).Font.Style:= [fsUnderline];
end;

procedure TFormArcadeScanGamesMode.LabelCustomizeMAMESoftwareListMouseLeave(Sender: TObject);
begin
  if IsNightMode then
     SetLabelColors(TShadowLabel(Sender), item_shortcut_color[1], item_shortcut_selected_color[1])
  else
     TShadowLabel(Sender).Font.Color:= clNavy;
  TShadowLabel(Sender).Font.Style:= [];
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
  CallMessageBox;
  FormMain.AddMsgText('    Starting from v0.162, you can run ');
  FormMain.AddMsgText('non-arcade', clBlack, [fsBold]);
  FormMain.AddMsgText(' games with MAME (consoles/computers).'+
                      ' One important rule you must follow to use software list games with Emu Loader:'+#13#10+#13#10);
  FormMain.AddMsgText('    Game files must be in sub-folders named the same name as XML filenames from ', clBlack, [fsBold]);
  FormMain.AddMsgText('mamedir\hash\', MsgTxtColors.colorFileName, [fsBold, fsItalic]);
  FormMain.AddMsgText(' folder.', clBlack, [fsBold]);
  FormMain.AddMsgText(#13#10+#13#10+'    There are three options to choose from:'+#13#10);
  FormMain.AddMsgText('1. ', clMaroon, [fsBold]);
  FormMain.AddMsgText('Disable', MsgTxtColors.colorFileName, [fsBold]);
  FormMain.AddMsgText(': software lists will not be created and all frontend games list files deleted.'+#13#10);
  FormMain.AddMsgText('2. ', clMaroon, [fsBold]);
  FormMain.AddMsgText('Enable, Update Mode', MsgTxtColors.colorFileName, [fsBold]);
  FormMain.AddMsgText(': new software lists will be created and current ones updated only if ');
  FormMain.AddMsgText('CRC32 checksum', clBlack, [fsItalic]);
  FormMain.AddMsgText(' of MAME ');
  FormMain.AddMsgText('softlist.xml', clBlack, [fsItalic]);
  FormMain.AddMsgText(' file is different than the checksum in frontend ');
  FormMain.AddMsgText('softlist.el', clBlack, [fsItalic]);
  FormMain.AddMsgText(' file.'+#13#10);
  FormMain.AddMsgText('3. ', clMaroon, [fsBold]);
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

end.
