unit uScanGamesMode;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  StdCtrls, Buttons, PanelEx, AdvOfficeButtons, ShellAPI,
  ShadowLabel, ExtCtrls, AdvGroupBox;

type
  TFormScanGamesMode = class(TForm)
    LabelSelectMode: TLabel;
    FullScan: TAdvOfficeRadioButton;
    QuickScan: TAdvOfficeRadioButton;
    ForceAllAvailable: TAdvOfficeRadioButton;
    PanelEx1: TPanelEx;
    ButtonOk: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    LabelClrMAME: TLabel;
    LabelRomCenter: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    ScanMAMESetsBox: TAdvGroupBox;
    ImageScanMAME: TImage;
    ScanMAMEAllSets: TAdvOfficeRadioButton;
    ScanMAMEArcadeMachines: TAdvOfficeRadioButton;
    ScanMAMESoftwareListGames: TAdvOfficeRadioButton;
    ScanModeIcon: TImage;
    ButtonHelpCreateSoftwareListGames: TBitBtn;
    LabelCustomizeSoftwareList: TShadowLabel;
    LabelCreateSoftwareListGames: TShadowLabel;
    CreateSoftwareListGames: TAdvOfficeCheckBox;
    AddMAMEDeviceSetWithNoROMs: TAdvOfficeCheckBox;
    LabelAddMAMEDeviceSetWithNoROMs: TShadowLabel;
    Label6: TLabel;
    procedure LabelClrMAMEMouseEnter(Sender: TObject);
    procedure LabelClrMAMEMouseLeave(Sender: TObject);
    procedure LabelClrMAMEClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure CreateSoftwareListGamesClick(Sender: TObject);
    procedure AddMAMEDeviceSetWithNoROMsClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ScanMAMEAllSetsClick(Sender: TObject);
    procedure ButtonHelpCreateSoftwareListGamesClick(Sender: TObject);
    procedure LabelCustomizeSoftwareListClick(Sender: TObject);
    procedure LabelCustomizeSoftwareListMouseEnter(Sender: TObject);
    procedure LabelCustomizeSoftwareListMouseLeave(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormScanGamesMode: TFormScanGamesMode;

implementation

uses uCommon, uMain;

{$R *.dfm}

procedure TFormScanGamesMode.LabelClrMAMEMouseEnter(Sender: TObject);
begin
  TLabel(Sender).Font.Color:= clBlue;
  TLabel(Sender).Font.Style:= [fsUnderline];
end;

procedure TFormScanGamesMode.LabelClrMAMEMouseLeave(Sender: TObject);
begin
  TLabel(Sender).Font.Color:= $00a65300;
  TLabel(Sender).Font.Style:= [fsBold];
end;

procedure TFormScanGamesMode.LabelClrMAMEClick(Sender: TObject);
begin
  ShellExecute(Handle, 'open', PChar(TLabel(Sender).Hint), nil, nil, SW_SHOWNORMAL);
end;

procedure TFormScanGamesMode.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key in [#13, #27] then
     Close;
end;

procedure TFormScanGamesMode.CreateSoftwareListGamesClick(Sender: TObject);
begin
  if CreateSoftwareListGames.Checked then
     CreateSoftwareListGames.Font.Color:= clBlack
  else
     CreateSoftwareListGames.Font.Color:= $0078695b;
end;

procedure TFormScanGamesMode.AddMAMEDeviceSetWithNoROMsClick(
  Sender: TObject);
begin
  if AddMAMEDeviceSetWithNoROMs.Checked then
     AddMAMEDeviceSetWithNoROMs.Font.Color:= clBlack
  else
     AddMAMEDeviceSetWithNoROMs.Font.Color:= $0078695b;
end;

procedure TFormScanGamesMode.FormShow(Sender: TObject);
begin
  ScanMAMESetsBox.Tag:= FormMain.MenuCreateSoftwareListGames.HelpContext;
  FormMain.IL_StandardIconsSmall.GetIcon(MaxGameID+1, ImageScanMAME.Picture.Icon);
  if ScanMAMESetsBox.Tag <> 0 then
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
  end;
end;

procedure TFormScanGamesMode.ScanMAMEAllSetsClick(Sender: TObject);
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

procedure TFormScanGamesMode.ButtonHelpCreateSoftwareListGamesClick(
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

procedure TFormScanGamesMode.LabelCustomizeSoftwareListClick(Sender: TObject);
begin
  FormMain.MenuCustomizeSoftwareList.Click;
end;

procedure TFormScanGamesMode.LabelCustomizeSoftwareListMouseEnter(Sender: TObject);
begin
  TShadowLabel(Sender).Font.Color:= clBlue;
  TShadowLabel(Sender).Font.Style:= [fsUnderline];
end;

procedure TFormScanGamesMode.LabelCustomizeSoftwareListMouseLeave(Sender: TObject);
begin
  TShadowLabel(Sender).Font.Color:= clNavy;
  TShadowLabel(Sender).Font.Style:= [];
end;

end.
