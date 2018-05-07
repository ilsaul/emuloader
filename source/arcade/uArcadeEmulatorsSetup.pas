unit uArcadeEmulatorsSetup;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  StdCtrls, ExtCtrls, ComCtrls, IniFiles, Buttons, FileCtrl,
  MPCommonObjects, EasyListview, uCommon, ImgList, ToolWin,
  ShadowLabel, PanelEx, AdvOfficeButtons, ShellAPI;

type
  TFormArcadeEmulatorsSetup = class(TForm)
    LabelArcade_exec: TShadowLabel;
    Arcade_exec: TEdit;
    ButtonBrowseArcade_exec: TBitBtn;
    LabelArcade_versioninfo: TShadowLabel;
    Arcade_versioninfo: TEdit;
    LabelAlterMAME: TShadowLabel;
    AlterMAME_exec: TEdit;
    ButtonBrowseAlterMAME: TBitBtn;
    ButtonClearAlterMAME: TBitBtn;
    ButtonHelpAlterMAME: TBitBtn;
    PanelSystemsSelect: TPanelEx;
    LabelSystemTitle: TShadowLabel;
    SystemSelector: TEasyListview;
    AlterMAME_Autorun: TAdvOfficeCheckBox;
    PanelButtons: TPanelEx;
    ButtonOk: TBitBtn;
    ButtonCancel: TBitBtn;
    LabelAlterMAME_versioninfo: TShadowLabel;
    AlterMAME_versioninfo: TEdit;
    PanelMAMEEmulatorsText: TPanelEx;
    ShadowLabel1: TShadowLabel;
    ShadowLabel2: TShadowLabel;
    ShadowLabel5: TShadowLabel;
    ShadowLabel6: TShadowLabel;
    ButtonSetOptionsAlterMAME: TBitBtn;
    LabelAlterMAME_Autorun: TShadowLabel;
    ShadowLabel7: TShadowLabel;
    ShadowLabel3: TShadowLabel;
    ShadowLabel4: TShadowLabel;
    ButtonSetOptions: TBitBtn;
    ButtonUpdateSystem: TBitBtn;
    ButtonClearSystem: TBitBtn;
    IL_Systems: TImageList;
    procedure ButtonCancelClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ButtonOkClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure ButtonSetOptionsClick(Sender: TObject);
    procedure Arcade_execChange(Sender: TObject);
    procedure ButtonBrowseArcade_execClick(Sender: TObject);
    procedure ButtonClearSystemClick(Sender: TObject);
    procedure SystemSelectorItemSelectionChanged(
      Sender: TCustomEasyListview; Item: TEasyItem);
    procedure ButtonHelpAlterMAMEClick(Sender: TObject);
    procedure ButtonBrowseAlterMAMEClick(Sender: TObject);
    procedure AlterMAME_execChange(Sender: TObject);
    procedure ButtonClearAlterMAMEClick(Sender: TObject);
    procedure ButtonUpdateSystemClick(Sender: TObject);
    procedure AlterMAME_AutorunClick(Sender: TObject);
    procedure Arcade_versioninfoChange(Sender: TObject);
    procedure AlterMAME_versioninfoChange(Sender: TObject);
    procedure ShadowLabel1MouseEnter(Sender: TObject);
    procedure ShadowLabel1MouseLeave(Sender: TObject);
    procedure ShadowLabel1Click(Sender: TObject);
    procedure ButtonSetOptionsAlterMAMEClick(Sender: TObject);
  private
    { Private declarations }
    newEmulatorFile,
    newEmulatorVersion: packed array[1..MaxArcadeSystems] of String;
    newEmulatorDateTime: packed array[1..MaxArcadeSystems] of Integer;
    newAlterMAMEFile, newAlterMAMEVersion: String;
    newAlterMAMEDateTime: Integer;
    newbuildMAME, newbuildAlterMAME, newbuildHBMAME: String;
    IsExeMAME: Boolean; // for AlterMAME default settings button
    elIni: TMemIniFile;
    function  VerifyEmulator(SystemID: Byte): Boolean;
    function  VerifyAlterMAME: Boolean;
    procedure GetEmulatorDefaultDescription(SystemID: Byte; UpdateLabel: Boolean = True);
    procedure ValidateAlterMAMEExecutable;
    procedure SetAlterMAMEPanel(Enabled: Boolean);
    procedure SetAlterMAMEText;
    //procedure ClearEmulatorIcon(AlterMAME: Boolean);
    //function  SetEmulatorIcon(sysID: ShortInt; IsAlterMAME: Boolean): Integer;
    procedure ResizeForm;
    procedure SetSystemInfo(sysID: ShortInt);
  public
    { Public declarations }
  end;

var
  FormArcadeEmulatorsSetup: TFormArcadeEmulatorsSetup;

implementation

uses uMain, uPreferences, uStatus;

{$R *.DFM}

procedure TFormArcadeEmulatorsSetup.GetEmulatorDefaultDescription(SystemID: Byte; UpdateLabel: Boolean = True);
var
  iVersion: String;
begin
  case SystemID of
    idMAME:   FormMain.GetArcadeEmulatorVersion(SystemID, newEmulatorFile[SystemID], newEmulatorVersion[SystemID], newbuildMAME);
    idHBMAME: FormMain.GetArcadeEmulatorVersion(SystemID, newEmulatorFile[SystemID], newEmulatorVersion[SystemID], newbuildHBMAME);
  else
    FormMain.GetArcadeEmulatorVersion(SystemID, newEmulatorFile[SystemID], newEmulatorVersion[SystemID], iVersion);
  end;
  if UpdateLabel then
     Arcade_versioninfo.Text:= newEmulatorVersion[SystemID];
end;

procedure TFormArcadeEmulatorsSetup.ValidateAlterMAMEExecutable;
var
  sFile: String;
begin
  IsExeMAME:= False;
  ButtonSetOptionsAlterMAME.Enabled:= False;
  if AlterMAME_exec.Text = '' then
     Exit;
  sFile:= LowerCase(AlterMAME_exec.Text);
  IsExeMAME:= PosEx('mame', sFile) <> 0;
  if not IsExeMAME then
     IsExeMAME:= PosEx('ume', sFile) <> 0;
  ButtonSetOptionsAlterMAME.Enabled:= IsExeMAME;
end;

procedure TFormArcadeEmulatorsSetup.SetAlterMAMEPanel(Enabled: Boolean);
begin
  if LabelAlterMAME.Enabled = Enabled then
     Exit;
  LabelAlterMAME.Enabled:= Enabled;
  LabelAlterMAME_versioninfo.Enabled:= Enabled;
  AlterMAME_versioninfo.Enabled:= Enabled;
  AlterMAME_exec.Enabled:= Enabled;
  ButtonBrowseAlterMAME.Enabled:= Enabled;
  ButtonClearAlterMAME.Enabled:= Enabled;
  ButtonHelpAlterMAME.Enabled:= Enabled;
  AlterMAME_Autorun.Enabled:= Enabled;
  ButtonSetOptionsAlterMAME.Enabled:= Enabled;
end;

procedure TFormArcadeEmulatorsSetup.SetAlterMAMEText;
begin
  if newAlterMAMEVersion <> '' then
     AlterMAME_versioninfo.Text:= newAlterMAMEVersion
  else
     AlterMAME_versioninfo.Text:= '';
end;

procedure TFormArcadeEmulatorsSetup.ButtonCancelClick(Sender: TObject);
begin
  FormMain.MainMenuOptions.Tag:= 1;
  Close;
end;

procedure TFormArcadeEmulatorsSetup.FormShow(Sender: TObject);
var
  Loop: Integer;
begin
  ResizeForm;

  FormMain.ELV_ResetNormalColors(SystemSelector);
  FormMain.LoadSystemsIcons(IL_Systems, False);

  // show emulator icon like in EmuCon ???
  //GetExtIcon('.exe', IL_EmulatorIcon); // .exe files
  //GetExtIcon('.bat', IL_EmulatorIcon); // .bat files
  //GetExtIcon('.exe', IL_EmulatorIcon); // emulator executable files
  //GetExtIcon('.exe', IL_EmulatorIcon); // AlterMAME icon (if available)

  for Loop:= 1 to MaxArcadeSystems do
  begin
    newEmulatorFile[Loop]:= FormMain.EmulatorFile[Loop];
    newEmulatorVersion[Loop]:= FormMain.EmulatorVersion[Loop];
    newEmulatorDateTime[Loop]:= FormMain.EmulatorDateTime[Loop];
  end;
  newbuildMAME:= FormMain.buildMAME;
  newAlterMAMEFile:= FormMain.AlterMAMEFile;
  newAlterMAMEVersion:= FormMain.AlterMAMEVersion;
  newAlterMAMEDateTime:= FormMain.AlterMAMEDateTime;
  newbuildAlterMAME:= FormMain.buildAlterMAME;
  newbuildHBMAME:= FormMain.buildHBMAME;

  AlterMAME_versioninfo.Text:= newAlterMAMEVersion;
  AlterMAME_Autorun.Tag:= 1;
  AlterMAME_Autorun.Checked:= FormMain.PopupAutorunGameAlterMAME.Checked;
  AlterMAME_Autorun.Tag:= 0;

  FormMain.ELV_PopulateSystems(SystemSelector, True, True, 1);
  FormMain.ELV_SelectItem(SystemSelector, 0);
end;

function TFormArcadeEmulatorsSetup.VerifyEmulator(SystemID: Byte): Boolean;
var
  emuFile, SectionString: String;
begin
  Application.ProcessMessages;
  emuFile:= newEmulatorFile[SystemID];
  Result:= (emuFile <> '') and (FileExists(emuFile));
  if not Result then
     begin
       elIni.DeleteKey(SectionString, 'emu_FileName');
       elIni.DeleteKey(SectionString, 'emu_VersionInfo');
       elIni.DeleteKey(SectionString, 'emu_DateTime');
       if FormMain.IsMAMEBasedSys(SystemID) then
          begin
            elIni.DeleteKey(SectionString, 'emu_ListXML');
            elIni.DeleteKey(SectionString, 'emu_Build');
          end;
       Exit;
     end;

  case FormMain.IsMAMEBasedSys(SystemID) of
    True : Result:= FormMain.CheckMAMEIniFile(emuFile, SystemID);
    False: Result:= True;
  end;
  if Result then
     GetEmulatorDefaultDescription(SystemID, False);
     
  SectionString:= FormMain.GetArcadeSystemIniSection(SystemID);
  elIni.WriteString(SectionString, 'emu_FileName', newEmulatorFile[SystemID]);
  elIni.WriteString(SectionString, 'emu_VersionInfo', newEmulatorVersion[SystemID]);
  elIni.WriteInteger(SectionString, 'emu_DateTime', newEmulatorDateTime[SystemID]);

  case SystemID of
    idMAME: elIni.WriteString(SectionString, 'emu_Build', newbuildMAME);
    idHBMAME: elIni.WriteString(SectionString, 'emu_Build', newbuildHBMAME);
  end;
end;

function TFormArcadeEmulatorsSetup.VerifyAlterMAME: Boolean;
begin
  Result:= (newAlterMAMEFile <> '') and (FileExists(newAlterMAMEFile));
  case Result of
    True:
      begin
        elIni.WriteString(FormMain.GetArcadeSystemIniSection(idMAME), 'emu_AlterMAMEFile', newAlterMAMEFile);
        elIni.WriteString(FormMain.GetArcadeSystemIniSection(idMAME), 'emu_AlterMAMEVersion', newAlterMAMEVersion);
        elIni.WriteInteger(FormMain.GetArcadeSystemIniSection(idMAME), 'emu_AlterMAMEDateTime', newAlterMAMEDateTime);
        elIni.WriteString(FormMain.GetArcadeSystemIniSection(idMAME), 'emu_AlterMAMEBuild', newbuildAlterMAME);
      end;
    False:
      begin
        elIni.DeleteKey(FormMain.GetArcadeSystemIniSection(idMAME), 'emu_AlterMAMEFile');
        elIni.DeleteKey(FormMain.GetArcadeSystemIniSection(idMAME), 'emu_AlterMAMEVersion');
        elIni.DeleteKey(FormMain.GetArcadeSystemIniSection(idMAME), 'emu_AlterMAMEDateTime');
        elIni.DeleteKey(FormMain.GetArcadeSystemIniSection(idMAME), 'emu_AlterMAMEBuild');
      end;
  end;
end;

procedure TFormArcadeEmulatorsSetup.ButtonOkClick(Sender: TObject);
var
  Loop: Integer;
  EmulatorFound: Boolean;
begin
  EmulatorFound:= False;
  for Loop:=1 to MaxArcadeSystems do
  begin
    if newEmulatorFile[Loop] <> '' then
       EmulatorFound:= True;
  end;
  if not EmulatorFound then
     begin
       GenerateMessage('Error', FormArcadeEmulatorsSetup.Caption, '    No emulator filenames were selected. '+
                       'Please select at least one emulator or hit cancel button to terminate '+
                       'the application...', 2, False, 1);
       Exit;
     end;
  FormMain.MainMenuOptions.Tag:= 0;

  FormArcadeEmulatorsSetup.Hide;
  elIni:= TMemIniFile.Create(FormMain.GetArcadeEmulatorsFile);

  for Loop:= 1 to MaxArcadeSystems do
  begin
    FormMain.EmulatorFile[Loop]:= newEmulatorFile[Loop];
    FormMain.EmulatorVersion[Loop]:= newEmulatorVersion[Loop];
    FormMain.EmulatorDateTime[Loop]:= newEmulatorDateTime[Loop];
    VerifyEmulator(Loop);
  end;
  FormMain.buildMAME:= newbuildMAME;
  FormMain.AlterMAMEFile:= '';
  FormMain.AlterMAMEVersion:= '';
  FormMain.AlterMAMEDateTime:= -1;
  FormMain.buildAlterMAME:= '';
  FormMain.buildHBMAME:= newbuildHBMAME;

  if VerifyAlterMAME then
     begin
       FormMain.AlterMAMEFile:= newAlterMAMEFile;
       FormMain.AlterMAMEVersion:= newAlterMAMEVersion;
       FormMain.AlterMAMEDateTime:= newAlterMAMEDateTime;
       FormMain.buildAlterMAME:= newbuildAlterMAME;
     end;
  if not FormMain.CheckReadOnly(FormMain.GetArcadeEmulatorsFile) then
     elIni.UpdateFile;
  FreeAndNil(elIni);
  Close;
end;

procedure TFormArcadeEmulatorsSetup.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #27 then
     ButtonCancel.Click;
end;

procedure TFormArcadeEmulatorsSetup.ButtonSetOptionsClick(Sender: TObject);
var
  iVersion: String;
begin
  if not FormMain.CheckSelected(SystemSelector) then
     Exit;
  if (Arcade_exec.Text = '') or (not FileExists(Arcade_exec.Text)) then
     begin
       FormMain.BlinkBkEdit(Arcade_exec);
       Exit;
     end;
     
  case SystemSelector.Tag of
    idMAME:   iVersion:= newBuildMAME;
    idHBMAME: iVersion:= newBuildHBMAME;
  else
    iVersion:= '';
  end;
  FormMain.CallEmulatorOptions(newEmulatorFile[SystemSelector.Tag], newEmulatorVersion[SystemSelector.Tag], SystemSelector.Tag, False, iVersion);
end;

{procedure TFormEmulatorsSetup.ClearEmulatorIcon(AlterMAME: Boolean);
begin
  case AlterMAME of
    True:
      begin
        AlterMAMEIcon.Picture.Icon:= nil;
        AlterMAMEIconFrame.Visible:= True;
      end;
    False:
      begin
        EmuIcon.Picture.Icon:= nil;
        EmuIconFrame.Visible:= True;
      end;
  end;
end;

function TFormEmulatorsSetup.SetEmulatorIcon(sysID: ShortInt; IsAlterMAME: Boolean): Integer;
var
  emuStr: String;
begin
  case IsAlterMAME of
    True : emuStr:= newAlterMAMEFile;
    False: emuStr:= newEmulatorFile[sysID];
  end;
  if emuStr = '' then
     begin
       Result:= -1; // emulator not defined, icon is NIL
       ClearEmulatorIcon(IsAlterMAME);
       Exit;
     end;
  Result:= GetAppIcon(emuStr, IL_EmulatorIcon, 2+Ord(IsAlterMAME));
  if Result = -1 then
     Result:= 0+Ord(SameText(ExtractFileExt(emuStr), '.bat'));
  case IsAlterMAME of
    True:
      begin
        IL_EmulatorIcon.GetIcon(Result, AlterMAMEIcon.Picture.Icon);
        EmuIconFrame.Visible:= False;
      end;
    False:
      begin
        IL_EmulatorIcon.GetIcon(Result, EmuIcon.Picture.Icon);
        AlterMAMEIconFrame.Visible:= False;
      end;
  end;
end;}

procedure TFormArcadeEmulatorsSetup.SetSystemInfo(sysID: ShortInt);
begin
  Arcade_exec.Text:= newEmulatorFile[sysID];
  Arcade_versioninfo.Text:= newEmulatorVersion[sysID];
  SetAlterMAMEPanel(sysID = idMAME);
  AlterMAME_exec.Text:= newAlterMAMEFile;
  SetAlterMAMEText;
  //SetEmulatorIcon(sysID, False);
  //if sysID = idMAME then
  //   SetEmulatorIcon(-1, True);

  ButtonSetOptions.Enabled:= not (sysID in [idDemul, idDICE]);
  LabelSystemTitle.Caption:= UpperCase(FormMain.GetArcadeEmulatorDescription(sysID));

  PanelMAMEEmulatorsText.Visible:= sysID = idMAME;
  //case sysID of
  //  idMAME:       PanelEx3.Color1:= $00fef0e0;
  //  idSupermodel: PanelEx3.Color1:= $00efe8e2;
  //  idDaphne:     PanelEx3.Color1:= $00e1fdfd;
  //  idDemul:      PanelEx3.Color1:= $00fdf0f0;
  //  idHBMAME:     PanelEx3.Color1:= $00f0fde1;
  //  idDICE:       PanelEx3.Color1:= $00efe8e2;
  //  idSegaModel2: PanelEx3.Color1:= $00f8f1fe;
  //  idZiNc:       PanelEx3.Color1:= $00e1f0fd;
  //end;
end;

procedure TFormArcadeEmulatorsSetup.ResizeForm;
var
  Loop: Integer;
begin
  if Screen.Height > 480 then
     Exit;
  SystemSelector.Left:= 0;
  SystemSelector.Top:= 0;
  LabelSystemTitle.Top:= LabelSystemTitle.Top-16;
  PanelSystemsSelect.Height:= PanelSystemsSelect.Height-16;

  LabelArcade_exec.Top:= LabelArcade_exec.Top-24;
  PanelMAMEEmulatorsText.Top:=PanelMAMEEmulatorsText.Top-24;
  Arcade_exec.Top:=Arcade_exec.Top-24;
  ButtonBrowseArcade_exec.Top:=ButtonBrowseArcade_exec.Top-24;
  LabelArcade_versioninfo.Top:= LabelArcade_versioninfo.Top-24;
  Arcade_versioninfo.Top:= Arcade_versioninfo.Top-24;
  LabelAlterMAME.Top:= LabelAlterMAME.Top-24;
  AlterMAME_exec.Top:= AlterMAME_exec.Top-24;
  ButtonBrowseAlterMAME.Top:= ButtonBrowseAlterMAME.Top-24;
  ButtonClearAlterMAME.Top:= ButtonClearAlterMAME.Top-24;
  ButtonHelpAlterMAME.Top:= ButtonHelpAlterMAME.Top-24;
  LabelAlterMAME_versioninfo.Top:= LabelAlterMAME_versioninfo.Top-24;
  AlterMAME_versioninfo.Top:= AlterMAME_versioninfo.Top-24;
  ButtonSetOptionsAlterMAME.Top:= ButtonSetOptionsAlterMAME.Top-24;
  AlterMAME_Autorun.Top:= AlterMAME_Autorun.Top-24;
  LabelAlterMAME_Autorun.Top:= LabelAlterMAME_Autorun.Top-24;
  ButtonSetOptions.Top:= ButtonSetOptions.Top-28;
  ButtonUpdateSystem.Top:= ButtonUpdateSystem.Top-28;
  ButtonClearSystem.Top:= ButtonClearSystem.Top-28;

  FormArcadeEmulatorsSetup.ClientHeight:= 392;
  FormArcadeEmulatorsSetup.ClientWidth:= FormArcadeEmulatorsSetup.ClientWidth-16;

  Arcade_exec.Width:= Arcade_exec.Width-16;
  ButtonBrowseArcade_exec.Left:= ButtonBrowseArcade_exec.Left-16;
  Arcade_versioninfo.Width:= Arcade_versioninfo.Width-16;
  AlterMAME_exec.Width:= AlterMAME_exec.Width-16;
  ButtonBrowseAlterMAME.Left:= ButtonBrowseAlterMAME.Left-16;
  ButtonClearAlterMAME.Left:= ButtonClearAlterMAME.Left-16;
  ButtonHelpAlterMAME.Left:= ButtonHelpAlterMAME.Left-16;
  AlterMAME_versioninfo.Width:= AlterMAME_versioninfo.Width-16;
  ButtonSetOptionsAlterMAME.Left:= ButtonSetOptionsAlterMAME.Left-16;
  ButtonSetOptions.Left:= ButtonSetOptions.Left-8;
  ButtonUpdateSystem.Left:= ButtonUpdateSystem.Left-8;
  ButtonClearSystem.Left:= ButtonClearSystem.Left-8;

  ButtonOk.Left:= ButtonOk.Left-8;
  ButtonCancel.Left:= ButtonCancel.Left-8;
end;

procedure TFormArcadeEmulatorsSetup.Arcade_execChange(Sender: TObject);
begin
  newEmulatorFile[SystemSelector.Tag]:= Arcade_exec.Text;
end;

procedure TFormArcadeEmulatorsSetup.Arcade_versioninfoChange(Sender: TObject);
begin
  newEmulatorVersion[SystemSelector.Tag]:= Arcade_versioninfo.Text;
end;

procedure TFormArcadeEmulatorsSetup.ButtonBrowseArcade_execClick(
  Sender: TObject);
begin
  if FormMain.DialogOpenFile(2, 'Select an emulator file for '+FormMain.GetArcadeEmulatorDescription(SystemSelector.Tag),
                             Arcade_exec, False) = '' then
     Exit;
  if FileExists(Arcade_exec.Text) then
     begin
       Screen.Cursor:= crHourGlass;
       GetEmulatorDefaultDescription(SystemSelector.Tag); // get emulator version info
       newEmulatorDateTime[SystemSelector.Tag]:= FileAge(Arcade_exec.Text); // get modified date/time
       //SetEmulatorIcon(SystemSelector.Tag, False);
       Screen.Cursor:= crDefault;
     end;
end;

procedure TFormArcadeEmulatorsSetup.ButtonClearSystemClick(Sender: TObject);
begin
  if not FormMain.CheckSelected(SystemSelector) then
     Exit;
  Arcade_exec.Clear;
  newEmulatorVersion[SystemSelector.Tag]:= '';
  Arcade_versioninfo.Text:= '';
  newEmulatorDateTime[SystemSelector.Tag]:= -1;
  case SystemSelector.Tag of
    idMAME  : newbuildMAME:= '';
    idHBMAME: newbuildHBMAME:= '';
  end;
  //ClearEmulatorIcon(False);
  if LabelAlterMAME.Enabled then
     ButtonClearAlterMAME.Click;
end;

procedure TFormArcadeEmulatorsSetup.SystemSelectorItemSelectionChanged(
  Sender: TCustomEasyListview; Item: TEasyItem);
begin
  if Item.Selected then
     begin
       SystemSelector.Tag:= Item.ImageIndex;
       SetSystemInfo(SystemSelector.Tag);
       SystemSelector.SetFocus;
     end;
end;

procedure TFormArcadeEmulatorsSetup.ButtonHelpAlterMAMEClick(Sender: TObject);
begin
  CallMessageBox;
  FormMain.AddMsgText('    Select a second MAME emulator to run games. Handy when you want/need to run a game that '+
                      'requires a different MAME build or a MAME variant like ');
  FormMain.AddMsgText('SDLMAME', MsgTxtColors.colorFileName, [fsBold]);
  FormMain.AddMsgText('. You can even use, to some extent, ');
  FormMain.AddMsgText('Raine Arcade Emulator ', MsgTxtColors.colorFileName, [fsBold]);
  FormMain.AddMsgText('http://raine.1emulation.com', MsgTxtcolors.colorFileName{clBlue}, [fsUnderline]); // http://rainemu.swishparty.co.uk (no longer valid)
  FormMain.AddMsgText(#13#10+'    You can set emulator default settings and game custom settings for AlterMAME as well.'+#13#10+
                      'There are two ways to use AlterMAME. By ');
  FormMain.AddMsgText('autorun', MsgTxtColors.colorFileName, [fsBold]);
  FormMain.AddMsgText('; make sure to check ');
  FormMain.AddMsgText('Autorun Game With AlterMAME', MsgTxtColors.colorFileName, [fsBold]);
  FormMain.AddMsgText(', also available in games popup menu (mouse right-click). It only works if the primary MAME fails to load the game.'+#13#10+
                      '    You can also run a game directly with AlterMAME by selecting ');
  FormMain.AddMsgText('Run Game With AlterMAME', MsgTxtColors.colorFileName, [fsBold]);
  FormMain.AddMsgText(' in games popup menu.'+#13#10+#13#10+
                      '    Emu Loader does not validate games for AlterMAME so, make sure to audit your ROMs with a ROMs manager '+
                      'tool like ClrMAME or RomCenter.');
  GenerateMessage('Help', 'What is AlterMAME ?', '', 2);
end;

procedure TFormArcadeEmulatorsSetup.ButtonBrowseAlterMAMEClick(Sender: TObject);
begin
  if FormMain.DialogOpenFile(2, 'Select an emulator file for AlterMAME',
                             AlterMAME_exec, False) = '' then
     Exit;
  if FileExists(AlterMAME_exec.Text) then
     begin
       Screen.Cursor:= crHourGlass;
       FormMain.GetArcadeEmulatorVersion(idMAME, newAlterMAMEFile, newAlterMAMEVersion, newbuildAlterMAME);
       newAlterMAMEDateTime:= FileAge(AlterMAME_exec.Text); // get modified date/time
       SetAlterMAMEText;
       //SetEmulatorIcon(-1, True);
       Screen.Cursor:= crDefault;
     end;
end;

procedure TFormArcadeEmulatorsSetup.AlterMAME_execChange(Sender: TObject);
begin
  newAlterMAMEFile:= AlterMAME_exec.Text;
  ValidateAlterMAMEExecutable;
end;

procedure TFormArcadeEmulatorsSetup.AlterMAME_versioninfoChange(Sender: TObject);
begin
  newAlterMAMEVersion:= AlterMAME_versioninfo.Text;
end;

procedure TFormArcadeEmulatorsSetup.ButtonClearAlterMAMEClick(Sender: TObject);
begin
  AlterMAME_exec.Clear;
  newAlterMAMEVersion:= '';
  newAlterMAMEDateTime:= -1;
  newbuildAlterMAME:= '';
  SetAlterMAMEText;
  //ClearEmulatorIcon(True);
end;

procedure TFormArcadeEmulatorsSetup.ButtonUpdateSystemClick(Sender: TObject);
begin
  Screen.Cursor:= crHourGlass;
  if FileExists(Arcade_exec.Text) then
     begin
       GetEmulatorDefaultDescription(SystemSelector.Tag); // get emulator version info
       newEmulatorDateTime[SystemSelector.Tag]:= FileAge(Arcade_exec.Text); // get modified date/time
     end;
  if LabelAlterMAME.Enabled then
     begin
       if (AlterMAME_exec.Text <> '') and FileExists(newAlterMAMEFile) then
          begin
            FormMain.GetArcadeEmulatorVersion(idMAME, newAlterMAMEFile, newAlterMAMEVersion, newbuildAlterMAME);
            newAlterMAMEDateTime:= FileAge(AlterMAME_exec.Text); // get modified date/time
            SetAlterMAMEText;
          end;
     end;
  Screen.Cursor:= crDefault;
end;

procedure TFormArcadeEmulatorsSetup.AlterMAME_AutorunClick(Sender: TObject);
begin
  if AlterMAME_Autorun.Tag = 0 then
     FormMain.PopupAutorunGameAlterMAME.Checked:= AlterMAME_Autorun.Checked;
end;

procedure TFormArcadeEmulatorsSetup.ShadowLabel1MouseEnter(Sender: TObject);
begin
  TShadowLabel(Sender).Font.Color:= clBlue;
  TShadowLabel(Sender).Font.Style:= [fsBold, fsUnderline];
end;

procedure TFormArcadeEmulatorsSetup.ShadowLabel1MouseLeave(Sender: TObject);
begin
  TShadowLabel(Sender).Font.Color:= clNavy;
  TShadowLabel(Sender).Font.Style:= [fsBold];
end;

procedure TFormArcadeEmulatorsSetup.ShadowLabel1Click(Sender: TObject);
begin
  CallShellExecute(Sender);
end;

procedure TFormArcadeEmulatorsSetup.ButtonSetOptionsAlterMAMEClick(
  Sender: TObject);
begin
  if not FormMain.CheckSelected(SystemSelector) then
     Exit;
  if not IsExeMAME then
     Exit;
  if (AlterMAME_exec.Text = '') or (not FileExists(AlterMAME_exec.Text)) then
     begin
       FormMain.BlinkBkEdit(AlterMAME_exec);
       Exit;
     end;
  if FormMain.IsMAMEBasedSys(SystemSelector.Tag) then
     begin
       if not FileExists(FormMain.GetArcadeEmuIniFileName(SystemSelector.Tag, newAlterMAMEFile)) then
          FormMain.CreateMAMEIniFile(newAlterMAMEFile);
     end;
  FormMain.CallEmulatorOptions(newAlterMAMEFile, newAlterMAMEVersion, SystemSelector.Tag, True, newbuildAlterMAME);
end;


end.

