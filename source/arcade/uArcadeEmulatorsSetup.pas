unit uArcadeEmulatorsSetup;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  StdCtrls, ExtCtrls, ComCtrls, IniFiles, Buttons, FileCtrl,
  MPCommonObjects, EasyListview, uCommon, ImgList, ToolWin,
  ShadowLabel, PanelEx, AdvOfficeButtons, ShellAPI, EditEx, ButtonsEx;

type
  TFormArcadeEmulatorsSetup = class(TForm)
    PanelSystemsSelect: TPanelEx;
    SystemSelector: TEasyListview;
    PanelBottom: TPanelEx;
    ButtonOk: TBitBtnEx;
    ButtonCancel: TBitBtnEx;
    ButtonSetOptions: TBitBtnEx;
    ButtonUpdateSystem: TBitBtnEx;
    ButtonClearSystem: TBitBtnEx;
    IL_Systems: TImageList;
    UseLargeIcons: TAdvOfficeCheckBoxEx;
    PanelEmulatorDetails: TPanelEx;
    LabelArcade_versioninfo: TShadowLabel;
    LabelAlterMAME1: TShadowLabel;
    LabelAlterMAME1_versioninfo: TShadowLabel;
    LabelArcade_exec: TShadowLabel;
    LabelAlterMAME1_Autorun: TShadowLabel;
    LabelAlterMAME1_Tip1: TShadowLabel;
    ButtonBrowseArcade_exec: TBitBtnEx;
    Arcade_versioninfo: TEditEx;
    AlterMAME1_exec: TEditEx;
    ButtonBrowseAlterMAME1: TBitBtnEx;
    ButtonClearAlterMAME1: TBitBtnEx;
    ButtonHelpAlterMAME: TBitBtnEx;
    AlterMAME1_Autorun: TAdvOfficeCheckBoxEx;
    AlterMAME1_versioninfo: TEditEx;
    PanelMAMEEmulatorsText: TPanelEx;
    LabelMAMELink_Tabs: TShadowLabel;
    LabelMAMELink1: TShadowLabel;
    LabelMAMELink3: TShadowLabel;
    LabelMAMELink4: TShadowLabel;
    LabelMAMELink2: TShadowLabel;
    Arcade_exec: TEditEx;
    LabelAlterMAME2: TShadowLabel;
    LabelAlterMAME2_versioninfo: TShadowLabel;
    LabelAlterMAME2_Tip1: TShadowLabel;
    AlterMAME2_exec: TEditEx;
    ButtonBrowseAlterMAME2: TBitBtnEx;
    ButtonClearAlterMAME2: TBitBtnEx;
    AlterMAME2_versioninfo: TEditEx;
    IconEmulator: TImage;
    IconEmulatorAlterMAME1: TImage;
    IconEmulatorAlterMAME2: TImage;
    LabelAlterMAME2_Autorun: TShadowLabel;
    AlterMAME2_Autorun: TAdvOfficeCheckBoxEx;
    PanelSystemTitleBottom: TPanelEx;
    PanelSystemTitle: TPanelEx;
    LabelSystemTitle: TShadowLabel;
    ButtonClearArcade_exec: TBitBtnEx;
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
    procedure ButtonBrowseAlterMAME1Click(Sender: TObject);
    procedure AlterMAME1_execChange(Sender: TObject);
    procedure ButtonClearAlterMAME1Click(Sender: TObject);
    procedure ButtonUpdateSystemClick(Sender: TObject);
    procedure AlterMAME1_AutorunClick(Sender: TObject);
    procedure Arcade_versioninfoChange(Sender: TObject);
    procedure AlterMAME1_versioninfoChange(Sender: TObject);
    procedure LabelMAMELink1MouseEnter(Sender: TObject);
    procedure LabelMAMELink1MouseLeave(Sender: TObject);
    procedure LabelMAMELink1Click(Sender: TObject);
    procedure UseLargeIconsClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure AlterMAME2_AutorunClick(Sender: TObject);
    procedure ButtonBrowseAlterMAME2Click(Sender: TObject);
    procedure AlterMAME2_execChange(Sender: TObject);
    procedure AlterMAME2_versioninfoChange(Sender: TObject);
    procedure ButtonClearAlterMAME2Click(Sender: TObject);
    procedure ButtonClearArcade_execClick(Sender: TObject);
  private
    { Private declarations }
    newEmulatorFile,
    newEmulatorVersion: packed array[1..MaxArcadeSystems] of String;
    newEmulatorDateTime: packed array[1..MaxArcadeSystems] of Integer;
    newAlterMAMEFile, newAlterMAMEVersion, newbuildAlterMAME: packed array[1..2] of String;
    newAlterMAMEDateTime: packed array[1..2] of Integer;
    newbuildMAME, newbuildHBMAME: String;
    //IsExeMAME: Boolean; // for AlterMAME default settings button
    elIni: TMemIniFile;
    procedure Resize4K;
    function  VerifyEmulator(SystemID: Byte): Boolean;
    function  VerifyAlterMAME1: Boolean;
    function  VerifyAlterMAME2: Boolean;
    procedure GetEmulatorDefaultDescription(SystemID: Byte; UpdateLabel: Boolean = True);
    procedure SetAlterMAMEPanel(Enabled: Boolean);
    procedure SetAlterMAMEText;
    procedure SetAlterMAME2Text;
    //procedure ClearEmulatorIcon(AlterMAME: Boolean);
    //function  SetEmulatorIcon(sysID: ShortInt; IsAlterMAME: Boolean): Integer;
    procedure SetSystemInfo(sysID: ShortInt);
    procedure ReadWriteSettings(ReadMode: Boolean);
  public
    { Public declarations }
  end;

var
  FormArcadeEmulatorsSetup: TFormArcadeEmulatorsSetup;

implementation

uses uMain, uStatus;

{$R *.DFM}

procedure TFormArcadeEmulatorsSetup.Resize4K;

  procedure  SetEmulatorPos4K(iIconEmulator: TImage; iIconEmulatorTop: Integer;
                             iEmulatorTitle: TShadowLabel;
                             iEmulatorFile: TEditEx;
                             iSelectButton, iClearButton: TBitBtnEx;
                             iLabelVersionInfo: TShadowLabel;
                             iVersionInfo: TEditEx);
  begin
    FormMain.Set4KImageIconSpecs(iIconEmulator,  32, 10, iIconEmulatorTop);

    FormMain.Set4KLabelSpecs(iEmulatorTitle, 49, iIconEmulator.Top,      -1, -1, 16);
    FormMain.Set4KLabelFontNameSpecs(iEmulatorTitle);

    FormMain.Set4KEditFontNameSpecs(iEmulatorFile);
    FormMain.Set4KButtonSpecs(iClearButton,  ClientWidth-89-10,       iIconEmulator.Top+40,      89, 36, 16);
    FormMain.Set4KButtonSpecs(iSelectButton, iClearButton.Left-3-89,  iIconEmulator.Top+40,      89, 36, 16);
    FormMain.Set4KEditSpecs(iEmulatorFile, 10, iIconEmulator.Top+40, iSelectButton.Left-5-10, 36, 16);

    //FormMain.Set4KEditSpecs(iEmulatorFile,     10, iIconEmulator.Top+40, 1058, 36, 16);
    //FormMain.Set4KButtonSpecs(iSelectButton, 1073, iEmulatorFile.Top,      89, 36, 16);
    //FormMain.Set4KButtonSpecs(iClearButton,  1165, iEmulatorFile.Top,      89, 36, 16);
                                                                   //+47 ?

    FormMain.Set4KEditFontNameSpecs(iVersionInfo);
    FormMain.Set4KEditSpecs(iVersionInfo,       10, iEmulatorFile.Top+46, 1244, 36, 16);
    FormMain.Set4KLabelSpecs(iLabelVersionInfo, 14, iVersionInfo.Top+3,     -1, -1, 16);
    FormMain.Set4KLabelFontNameSpecs(iLabelVersionInfo);
  end;
  
begin
  if not Is4KMode then
     Exit;

  with FormArcadeEmulatorsSetup do
  begin
    ClientWidth:= 1264;
    ClientHeight:= 890;
    Font.Size:= 16;
    FormMain.Set4KImageListSpecs(IL_Systems, 128);

    PanelBottom.Height:= 71;
    FormMain.Set4KButtonSpecs(ButtonSetOptions,    10, 16, 168, 45, 16);
    FormMain.Set4KButtonSpecs(ButtonUpdateSystem, 188, 16, 168, 45, 16);
    FormMain.Set4KButtonSpecs(ButtonClearSystem,  366, 16, 168, 45, 16);
    FormMain.Set4KButtonSpecs(ButtonOk,           908, 16, 168, 45, 16);
    FormMain.Set4KButtonSpecs(ButtonCancel,      1086, 16, 168, 45, 16);

    FormMain.Set4KArcadeSysPanel(PanelSystemsSelect, SystemSelector, PanelSystemTitle, LabelSystemTitle, PanelSystemTitleBottom);

    FormMain.Set4KPanelSpecs(PanelEmulatorDetails, -1, PanelSystemTitleBottom.Top+PanelSystemTitleBottom.Height{238}, ClientWidth, 570);

    SetEmulatorPos4K(IconEmulator, 10, LabelArcade_exec, Arcade_exec, ButtonBrowseArcade_exec, ButtonClearArcade_exec,
                     LabelArcade_versionInfo, Arcade_versioninfo);

    FormMain.Set4KPanelSpecs(PanelMAMEEmulatorsText, 607, 10, 495, 31);

    FormMain.Set4KLabelSpecs(LabelMAMELink_Tabs, 74, 0, -1, -1, 16);//348, 31, 16);
    LabelMAMELink_Tabs.Caption:= '•                                •                     •';
    FormMain.Set4KLabelSpecs(LabelMAMELink1,   1, 0, -1, -1, 16);
    FormMain.Set4KLabelSpecs(LabelMAMELink2,  92, 0, -1, -1, 16);
    FormMain.Set4KLabelSpecs(LabelMAMELink3, 295, 0, -1, -1, 16);
    FormMain.Set4KLabelSpecs(LabelMAMELink4, 428, 0, -1, -1, 16);

                                          // Arcade_versioninfo.Top+68 // or +69 ?  // 32 pixels of space
    SetEmulatorPos4K(IconEmulatorAlterMAME1, 164, LabelAlterMAME1, AlterMAME1_exec, ButtonBrowseAlterMAME1, ButtonClearAlterMAME1,
                     LabelAlterMAME1_versioninfo, AlterMAME1_versioninfo);
    FormMain.Set4KLabelSpecs(LabelAlterMAME1_Tip1, 674, LabelAlterMAME1.Top, -1, -1, 16);

    SetEmulatorPos4K(IconEmulatorAlterMAME2, 318, LabelAlterMAME2, AlterMAME2_exec, ButtonBrowseAlterMAME2, ButtonClearAlterMAME2,
                     LabelAlterMAME2_versioninfo, AlterMAME2_versioninfo);
    FormMain.Set4KLabelSpecs(LabelAlterMAME2_Tip1, 697, LabelAlterMAME2.Top, -1, -1, 16);

    FormMain.Set4KCheckBoxSpecs(AlterMAME1_Autorun, 10, 477, 355, 36, 16);
    FormMain.Set4KCheckBoxFontNameSpecs(AlterMAME1_Autorun);
    FormMain.Set4KLabelSpecs(LabelAlterMAME1_Autorun, 453, AlterMAME1_Autorun.Top+2, -1, -1, 16);

    FormMain.Set4KCheckBoxSpecs(AlterMAME2_Autorun, 10, 512, 355, 36, 16); // 512, not 514
    FormMain.Set4KCheckBoxFontNameSpecs(AlterMAME2_Autorun);
    FormMain.Set4KLabelSpecs(LabelAlterMAME2_Autorun, 453, AlterMAME2_Autorun.Top+2, -1, -1, 16);

    FormMain.Set4KButtonSpecs(ButtonHelpAlterMAME, ClientWidth-168-10, 494, 168, 36, 16);

    FormMain.Set4KCheckBoxSpecs(UseLargeIcons, 640, 20, 140, 36, 16);
    UseLargeIcons.Visible:= False; // this setting is useless in 4K mode

    if Is4KMode then
       begin
         FormMain.IL_Misc_Large.GetIcon(1, IconEmulator.Picture.Icon);
         FormMain.IL_Misc_Large.GetIcon(1, IconEmulatorAlterMAME1.Picture.Icon);
         FormMain.IL_Misc_Large.GetIcon(1, IconEmulatorAlterMAME2.Picture.Icon);
       end
    else
       begin
         FormMain.IL_LeftPanel.GetIcon(1, IconEmulator.Picture.Icon);
         FormMain.IL_LeftPanel.GetIcon(1, IconEmulatorAlterMAME1.Picture.Icon);
         FormMain.IL_LeftPanel.GetIcon(1, IconEmulatorAlterMAME2.Picture.Icon);
       end;

    // FormArcadeEmulatorsSetup.Color:= clBlue; // debug only
  end;
end;

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

procedure TFormArcadeEmulatorsSetup.SetAlterMAMEPanel(Enabled: Boolean);
begin
  if LabelAlterMAME1.Enabled = Enabled then
     Exit;
  LabelAlterMAME1.Enabled:= Enabled;
  LabelAlterMAME1_versioninfo.Enabled:= Enabled;
  LabelAlterMAME1_Tip1.Enabled:= Enabled;
  IconEmulatorAlterMAME1.Visible:= Enabled;
  AlterMAME1_versioninfo.Enabled:= Enabled;
  AlterMAME1_exec.Enabled:= Enabled;
  ButtonBrowseAlterMAME1.Enabled:= Enabled;
  ButtonClearAlterMAME1.Enabled:= Enabled;
  ButtonHelpAlterMAME.Enabled:= Enabled;
  AlterMAME1_Autorun.Enabled:= Enabled;
  LabelAlterMAME1_Autorun.Enabled:= Enabled;

  LabelAlterMAME2.Enabled:= Enabled;
  LabelAlterMAME2_versioninfo.Enabled:= Enabled;
  LabelAlterMAME2_Tip1.Enabled:= Enabled;
  IconEmulatorAlterMAME2.Visible:= Enabled;
  AlterMAME2_versioninfo.Enabled:= Enabled;
  AlterMAME2_exec.Enabled:= Enabled;
  ButtonBrowseAlterMAME2.Enabled:= Enabled;
  ButtonClearAlterMAME2.Enabled:= Enabled;
  AlterMAME2_Autorun.Enabled:= Enabled;
  LabelAlterMAME2_Autorun.Enabled:= Enabled;
end;

procedure TFormArcadeEmulatorsSetup.SetAlterMAMEText;
begin
  if newAlterMAMEVersion[1] <> '' then
     AlterMAME1_versioninfo.Text:= newAlterMAMEVersion[1]
  else
     AlterMAME1_versioninfo.Text:= '';
end;

procedure TFormArcadeEmulatorsSetup.SetAlterMAME2Text;
begin
  if newAlterMAMEVersion[2] <> '' then
     AlterMAME2_versioninfo.Text:= newAlterMAMEVersion[2]
  else
     AlterMAME2_versioninfo.Text:= '';
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
  Resize4K;

  if IsNightMode then
     begin
       FormArcadeEmulatorsSetup.Color:= menu_background_color[1];
       SetBottomPanelColors(PanelBottom);

       PanelSystemsSelect.Color1:= clrBlackBk;
       PanelEmulatorDetails.Color1:= menu_background_color[1];

       FormMain.SetEasyListViewColors(SystemSelector, clrBlackBk, clWhite);

       FormMain.SetSystemTitleLabelColors(LabelSystemTitle);
       SetSystemTitleBarNightColors(PanelSystemTitle, PanelSystemTitleBottom);

       SetLabelColors(LabelArcade_exec,        item_caption_active_color[1], item_caption_active_shadow_color[1]);
       SetLabelColors(LabelArcade_versioninfo, item_caption_active_color[1], item_caption_active_shadow_color[1]);

       SetLabelColors(LabelMAMELink_Tabs, clSilver, clBlue);
       SetLabelColors(LabelMAMELink1, clSilver, clrMedBlue);
       SetLabelColors(LabelMAMELink2, clSilver, clrMedBlue);
       SetLabelColors(LabelMAMELink3, clSilver, clrMedBlue);
       SetLabelColors(LabelMAMELink4, clSilver, clrMedBlue);

       SetLabelColors(LabelAlterMAME1,             item_caption_active_color[1], item_caption_active_shadow_color[1]);
       SetLabelColors(LabelAlterMAME1_versioninfo, item_caption_active_color[1], item_caption_active_shadow_color[1]);
       SetLabelColors(LabelAlterMAME1_Tip1,        clSilver, item_caption_active_shadow_color[1]);

       SetLabelColors(LabelAlterMAME2,             item_caption_active_color[1], item_caption_active_shadow_color[1]);
       SetLabelColors(LabelAlterMAME2_versioninfo, item_caption_active_color[1], item_caption_active_shadow_color[1]);
       SetLabelColors(LabelAlterMAME2_Tip1,        clSilver, item_caption_active_shadow_color[1]);

       SetCheckBoxColors(AlterMAME1_Autorun, item_caption_active_color[1], item_caption_active_shadow_color[1]);
       SetCheckBoxColors(AlterMAME2_Autorun, item_caption_active_color[1], item_caption_active_shadow_color[1]);

       SetLabelColors(LabelAlterMAME1_Autorun, clSilver, item_caption_active_shadow_color[1]);
       SetLabelColors(LabelAlterMAME2_Autorun, clSilver, item_caption_active_shadow_color[1]);

       SetCheckBoxColors(UseLargeIcons, clWhite, item_caption_active_shadow_color[1]);

       SetEditNightColors(Arcade_exec);
       SetEditNightColors(Arcade_versioninfo);
       SetEditNightColors(AlterMAME1_exec);
       SetEditNightColors(AlterMAME1_versioninfo);
       SetEditNightColors(AlterMAME2_exec);
       SetEditNightColors(AlterMAME2_versioninfo);

       PanelMAMEEmulatorsText.Color1:= PanelEmulatorDetails.Color1;

       for Loop:= 0 to FormArcadeEmulatorsSetup.ComponentCount-1 do
       begin
         if FormArcadeEmulatorsSetup.Components[Loop] is TShadowLabel then
            TShadowLabel(FormArcadeEmulatorsSetup.Components[Loop]).UseCustomDisabledFontColor:= True
         else
         if FormArcadeEmulatorsSetup.Components[Loop] is TAdvOfficeCheckBoxEx then
            begin
              TAdvOfficeCheckBoxEx(FormArcadeEmulatorsSetup.Components[Loop]).DisabledFontColor:= clGray;
              TAdvOfficeCheckBoxEx(FormArcadeEmulatorsSetup.Components[Loop]).DisabledFontShadowColor:= clrMedDarkGray;
              FormMain.SetCheckBoxExCustomIcon(TAdvOfficeCheckBoxEx(FormArcadeEmulatorsSetup.Components[Loop]));
            end
         else
         if FormArcadeEmulatorsSetup.Components[Loop] is TBitBtnEx then
            FormMain.SetButtonExColors(TBitBtnEx(FormArcadeEmulatorsSetup.Components[Loop]));
       end;
     end;

  ReadWriteSettings(True);

  if not Is4KMode then //FormMain.Menu4KMode2160pEnable.Checked then
     begin
       FormMain.IL_LeftPanel.GetIcon(1, IconEmulator.Picture.Icon);
       FormMain.IL_LeftPanel.GetIcon(1, IconEmulatorAlterMAME1.Picture.Icon);
       FormMain.IL_LeftPanel.GetIcon(1, IconEmulatorAlterMAME2.Picture.Icon);
     end;

  FormMain.ELV_ResetNormalColors(SystemSelector);
  if IsNightMode then
     FormMain.ELV_SetNightModeColors(SystemSelector);
     
  FormMain.LoadSystemsIcons(IL_Systems, False);
  FormMain.ShowIconErrorMessage;

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
  newbuildHBMAME:= FormMain.buildHBMAME;

  for Loop:= Low(FormMain.AlterMAMEFile) to High(FormMain.AlterMAMEFile) do
  begin
    newAlterMAMEFile[Loop]:= FormMain.AlterMAMEFile[Loop];
    newAlterMAMEVersion[Loop]:= FormMain.AlterMAMEVersion[Loop];
    newAlterMAMEDateTime[Loop]:= FormMain.AlterMAMEDateTime[Loop];
    newbuildAlterMAME[Loop]:= FormMain.buildAlterMAME[Loop];
  end;

  AlterMAME1_versioninfo.Text:= newAlterMAMEVersion[1];
  AlterMAME1_Autorun.Tag:= 1;
  AlterMAME1_Autorun.Checked:= FormMain.PopupAutorunGameAlterMAME.Checked;
  AlterMAME1_Autorun.Tag:= 0;

  AlterMAME2_versioninfo.Text:= newAlterMAMEVersion[2];
  AlterMAME2_Autorun.Tag:= 1;
  AlterMAME2_Autorun.Checked:= FormMain.PopupAutorunGameAlterMAME2.Checked;
  AlterMAME2_Autorun.Tag:= 0;

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

function TFormArcadeEmulatorsSetup.VerifyAlterMAME1: Boolean;
begin
  Result:= (newAlterMAMEFile[1] <> '') and (FileExists(newAlterMAMEFile[1]));
  case Result of
    True:
      begin
        elIni.WriteString(FormMain.GetArcadeSystemIniSection(idMAME), 'emu_AlterMAMEFile', newAlterMAMEFile[1]);
        elIni.WriteString(FormMain.GetArcadeSystemIniSection(idMAME), 'emu_AlterMAMEVersion', newAlterMAMEVersion[1]);
        elIni.WriteInteger(FormMain.GetArcadeSystemIniSection(idMAME), 'emu_AlterMAMEDateTime', newAlterMAMEDateTime[1]);
        elIni.WriteString(FormMain.GetArcadeSystemIniSection(idMAME), 'emu_AlterMAMEBuild', newbuildAlterMAME[1]);
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

function TFormArcadeEmulatorsSetup.VerifyAlterMAME2: Boolean;
begin
  Result:= (newAlterMAMEFile[2] <> '') and (FileExists(newAlterMAMEFile[2]));
  case Result of
    True:
      begin
        elIni.WriteString(FormMain.GetArcadeSystemIniSection(idMAME), 'emu_AlterMAME2File', newAlterMAMEFile[2]);
        elIni.WriteString(FormMain.GetArcadeSystemIniSection(idMAME), 'emu_AlterMAME2Version', newAlterMAMEVersion[2]);
        elIni.WriteInteger(FormMain.GetArcadeSystemIniSection(idMAME), 'emu_AlterMAME2DateTime', newAlterMAMEDateTime[2]);
        elIni.WriteString(FormMain.GetArcadeSystemIniSection(idMAME), 'emu_AlterMAME2Build', newbuildAlterMAME[2]);
      end;
    False:
      begin
        elIni.DeleteKey(FormMain.GetArcadeSystemIniSection(idMAME), 'emu_AlterMAME2File');
        elIni.DeleteKey(FormMain.GetArcadeSystemIniSection(idMAME), 'emu_AlterMAME2Version');
        elIni.DeleteKey(FormMain.GetArcadeSystemIniSection(idMAME), 'emu_AlterMAME2DateTime');
        elIni.DeleteKey(FormMain.GetArcadeSystemIniSection(idMAME), 'emu_AlterMAME2Build');
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
       FormMain.ShowMessageBox('Error', FormArcadeEmulatorsSetup.Caption, '    No emulator filenames were selected. '+
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
  FormMain.buildHBMAME:= newbuildHBMAME;

  for Loop:= Low(FormMain.AlterMAMEFile) to High(FormMain.AlterMAMEFile) do
  begin
    // clear vars contents, just in case
    FormMain.AlterMAMEFile[Loop]:= '';
    FormMain.AlterMAMEVersion[Loop]:= '';
    FormMain.AlterMAMEDateTime[Loop]:= -1;
    FormMain.buildAlterMAME[Loop]:= '';
  end;

  if VerifyAlterMAME1 then
     begin
       FormMain.AlterMAMEFile[1]:= newAlterMAMEFile[1];
       FormMain.AlterMAMEVersion[1]:= newAlterMAMEVersion[1];
       FormMain.AlterMAMEDateTime[1]:= newAlterMAMEDateTime[1];
       FormMain.buildAlterMAME[1]:= newbuildAlterMAME[1];
     end;

  if VerifyAlterMAME2 then
     begin
       FormMain.AlterMAMEFile[2]:= newAlterMAMEFile[2];
       FormMain.AlterMAMEVersion[2]:= newAlterMAMEVersion[2];
       FormMain.AlterMAMEDateTime[2]:= newAlterMAMEDateTime[2];
       FormMain.buildAlterMAME[2]:= newbuildAlterMAME[2];
     end;

  if not CheckReadOnly(FormMain.GetArcadeEmulatorsFile) then
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
  FormMain.CallEmulatorOptions(newEmulatorFile[SystemSelector.Tag], newEmulatorVersion[SystemSelector.Tag], SystemSelector.Tag, iVersion);
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
  AlterMAME1_exec.Text:= newAlterMAMEFile[1];
  AlterMAME2_exec.Text:= newAlterMAMEFile[2];
  SetAlterMAMEText;
  SetAlterMAME2Text;
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
       newEmulatorDateTime[SystemSelector.Tag]:= FileAgeW(Arcade_exec.Text); // get modified date/time
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

  if ButtonClearSystem.Tag = 0 then
     begin
       if LabelAlterMAME1.Enabled then
          ButtonClearAlterMAME1.Click;
       if LabelAlterMAME2.Enabled then
          ButtonClearAlterMAME2.Click;
     end;
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
  FormMain.InitMessageBox;
  FormMain.AddMsgText('    You can select a second and a third MAME emulator to run games. Handy when you want/need to run a game that '+
                      'requires a different MAME build or a MAME variant like ');
  FormMain.AddMsgText('SDLMAME', MsgTxtColors.colorKeyTitle, [fsBold]);
  FormMain.AddMsgText('.'+#13#10+#13#10);//+'You can also use ');
  FormMain.AddMsgText('Raine Arcade Emulator ', MsgTxtColors.colorKeyTitle, [fsBold]);
  FormMain.AddMsgText('http://raine.1emulation.com', MsgTxtcolors.colorFileName, [fsUnderline]); // http://rainemu.swishparty.co.uk (no longer valid)
  FormMain.AddMsgText(' and ');
  FormMain.AddMsgText('FinalBurn Alpha ', MsgTxtColors.colorKeyTitle, [fsBold]);
  FormMain.AddMsgText('https://www.fbalpha.com', MsgTxtcolors.colorFileName, [fsUnderline]);

  FormMain.AddMsgText(' emulators can be used (other third-party emulators and/or variants are not supported at this time).'+#13#10+#13#10+
                      '    There are two ways to use AlterMAME. By ');
  FormMain.AddMsgText('autorun', MsgTxtColors.colorExitCode, [fsBold]);
  FormMain.AddMsgText('; make sure to check ');
  FormMain.AddMsgText('Autorun Game With AlterMAME', MsgTxtColors.colorKeyTitle, [fsBold]);
  FormMain.AddMsgText(' options, also available in games popup menu (mouse right-click). It only works if the primary MAME fails to load the game.'+#13#10+
                      'Or run a game directly with AlterMAME by selecting ');
  FormMain.AddMsgText('Run Game With AlterMAME', MsgTxtColors.colorKeyTitle, [fsBold]);
  FormMain.AddMsgText(' in games popup menu.'+#13#10+#13#10+
                      '    No ROMs validation is made so, make sure to audit your ROMs with a ROMs manager '+
                      'tool like ClrMAME or RomCenter. The emulators must also be fully configured before you can use them.');
  FormMain.ShowMessageBox('Help', 'What is AlterMAME ?', '', 2);
end;

procedure TFormArcadeEmulatorsSetup.ButtonBrowseAlterMAME1Click(Sender: TObject);
begin
  if FormMain.DialogOpenFile(2, 'Select an emulator file for AlterMAME',
                             AlterMAME1_exec, False) = '' then
     Exit;
  if FileExists(AlterMAME1_exec.Text) then
     begin
       Screen.Cursor:= crHourGlass;
       FormMain.GetArcadeEmulatorVersion(idMAME, newAlterMAMEFile[1], newAlterMAMEVersion[1], newbuildAlterMAME[1]);
       newAlterMAMEDateTime[1]:= FileAgeW(AlterMAME1_exec.Text); // get modified date/time
       SetAlterMAMEText;
       //SetEmulatorIcon(-1, True);
       Screen.Cursor:= crDefault;
     end;
end;

procedure TFormArcadeEmulatorsSetup.AlterMAME1_execChange(Sender: TObject);
begin
  newAlterMAMEFile[1]:= AlterMAME1_exec.Text;
end;

procedure TFormArcadeEmulatorsSetup.AlterMAME1_versioninfoChange(Sender: TObject);
begin
  newAlterMAMEVersion[1]:= AlterMAME1_versioninfo.Text;
end;

procedure TFormArcadeEmulatorsSetup.ButtonClearAlterMAME1Click(Sender: TObject);
begin
  AlterMAME1_exec.Clear;
  newAlterMAMEVersion[1]:= '';
  newAlterMAMEDateTime[1]:= -1;
  newbuildAlterMAME[1]:= '';
  SetAlterMAMEText;
  //ClearEmulatorIcon(True);
end;

procedure TFormArcadeEmulatorsSetup.ButtonUpdateSystemClick(Sender: TObject);
begin
  Screen.Cursor:= crHourGlass;
  if FileExists(Arcade_exec.Text) then
     begin
       GetEmulatorDefaultDescription(SystemSelector.Tag); // get emulator version info
       newEmulatorDateTime[SystemSelector.Tag]:= FileAgeW(Arcade_exec.Text); // get modified date/time
     end;
  if LabelAlterMAME1.Enabled then
     begin
       if (AlterMAME1_exec.Text <> '') and FileExists(newAlterMAMEFile[1]) then
          begin
            FormMain.GetArcadeEmulatorVersion(idMAME, newAlterMAMEFile[1], newAlterMAMEVersion[1], newbuildAlterMAME[1]);
            newAlterMAMEDateTime[1]:= FileAgeW(AlterMAME1_exec.Text); // get modified date/time
            SetAlterMAMEText;
          end;

       if (AlterMAME2_exec.Text <> '') and FileExists(newAlterMAMEFile[2]) then
          begin
            FormMain.GetArcadeEmulatorVersion(idMAME, newAlterMAMEFile[2], newAlterMAMEVersion[2], newbuildAlterMAME[2]);
            newAlterMAMEDateTime[2]:= FileAgeW(AlterMAME2_exec.Text); // get modified date/time
            SetAlterMAME2Text;
          end;
     end;
  Screen.Cursor:= crDefault;
end;

procedure TFormArcadeEmulatorsSetup.AlterMAME1_AutorunClick(Sender: TObject);
begin
  if AlterMAME1_Autorun.Tag = 0 then
     FormMain.PopupAutorunGameAlterMAME.Checked:= AlterMAME1_Autorun.Checked;
end;

procedure TFormArcadeEmulatorsSetup.AlterMAME2_AutorunClick(
  Sender: TObject);
begin
  if AlterMAME2_Autorun.Tag = 0 then
     FormMain.PopupAutorunGameAlterMAME2.Checked:= AlterMAME2_Autorun.Checked;
end;

procedure TFormArcadeEmulatorsSetup.LabelMAMELink1MouseEnter(Sender: TObject);
begin
  if IsNightMode then
     SetLabelColors(TShadowLabel(Sender), clrLightBlue, clrMedBlue)
  else
     SetLabelColors(TShadowLabel(Sender), clBlue, clSilver);

  TShadowLabel(Sender).Font.Style:= [fsUnderline];
end;

procedure TFormArcadeEmulatorsSetup.LabelMAMELink1MouseLeave(Sender: TObject);
begin
  if IsNightMode then
     SetLabelColors(TShadowLabel(Sender), clSilver, clrMedBlue)
  else
     SetLabelColors(TShadowLabel(Sender), clNavy, clSilver);

  TShadowLabel(Sender).Font.Style:= [];
end;

procedure TFormArcadeEmulatorsSetup.LabelMAMELink1Click(Sender: TObject);
begin
  CallShellExecute(Sender);
end;

procedure TFormArcadeEmulatorsSetup.ReadWriteSettings(ReadMode: Boolean);
var
  INIFile: TMemIniFile;
  SectionStr: String;
begin
  if not FileExists(FormMain.GetFrontendExtraIniFile) then
     Exit;
  SectionStr:= 'UseLargeIcons';
  try
    INIFile:= TMemIniFile.Create(FormMain.GetFrontendExtraIniFile);
    if ReadMode then
       UseLargeIcons.Checked:= Boolean(INIFile.ReadInteger(SectionStr, 'ArcadeEmulatorsSetup', 0))
    else
       INIFile.WriteInteger(SectionStr, 'ArcadeEmulatorsSetup', Ord(UseLargeIcons.Checked));
  finally
    if not ReadMode then
       INIFile.UpdateFile;
    FreeAndNil(INIFile);
  end;
end;

procedure TFormArcadeEmulatorsSetup.UseLargeIconsClick(Sender: TObject);
var
  iDiff: Integer;
begin
  if Is4KMode then //FormMain.Menu4KMode2160pEnable.Checked then
     Exit;
  if Screen.Height < 720 then
     Exit;
  if UseLargeIcons.Checked then
     IL_Systems.Width:= 128
  else
     IL_Systems.Width:= 68;

  IL_Systems.Height:= IL_Systems.Width;

  FormMain.LoadSystemsIcons(IL_Systems);
  FormMain.ShowIconErrorMessage;

  if UseLargeIcons.Checked then
  begin
    if SystemSelector.CellSizes.Icon.Height = 166 then
       Exit;

    SystemSelector.PaintInfoItem.IconViewRemoveIconTopBorder:= True;
    iDiff:=(166*2)-SystemSelector.Height;

    FormArcadeEmulatorsSetup.ClientHeight:= FormArcadeEmulatorsSetup.ClientHeight+iDiff;
    PanelEmulatorDetails.Top:= PanelEmulatorDetails.Top+iDiff;
    PanelSystemsSelect.Height:= PanelSystemsSelect.Height+iDiff;

    PanelSystemTitle.Top:= PanelSystemTitle.Top+iDiff;
    PanelSystemTitleBottom.Top:= PanelSystemTitleBottom.Top+iDiff;
    SystemSelector.Height:= 166*2;
    SystemSelector.CellSizes.Icon.Height:= 166;
    SystemSelector.CellSizes.Icon.Width:= 156;
  end
  else
  begin
    if SystemSelector.CellSizes.Icon.Height = 92 then
       Exit;
    SystemSelector.PaintInfoItem.IconViewRemoveIconTopBorder:= False;
    iDiff:= SystemSelector.Height-92;
    SystemSelector.Height:= 92;
    SystemSelector.CellSizes.Icon.Height:= 92;
    SystemSelector.CellSizes.Icon.Width:= 78;
    PanelSystemTitle.Top:= PanelSystemTitle.Top-iDiff;
    PanelSystemTitleBottom.Top:= PanelSystemTitleBottom.Top-iDiff;
    PanelSystemsSelect.Height:= PanelSystemsSelect.Height-iDiff; // 125;
    PanelEmulatorDetails.Top:= PanelEmulatorDetails.Top-iDiff; // 136;
    FormArcadeEmulatorsSetup.ClientHeight:= FormArcadeEmulatorsSetup.ClientHeight-iDiff; //392;
  end;

  if FormMain.CheckTotal(SystemSelector) then
     FormArcadeEmulatorsSetup.Top:= (Screen.Height shr 1)-(FormArcadeEmulatorsSetup.Height shr 1)-1;
end;

procedure TFormArcadeEmulatorsSetup.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if CanClose then
     ReadWriteSettings(False);
end;

procedure TFormArcadeEmulatorsSetup.ButtonBrowseAlterMAME2Click(
  Sender: TObject);
begin
  if FormMain.DialogOpenFile(2, 'Select an emulator file for AlterMAME 2',
                             AlterMAME2_exec, False) = '' then
     Exit;
  if FileExists(AlterMAME2_exec.Text) then
     begin
       Screen.Cursor:= crHourGlass;
       FormMain.GetArcadeEmulatorVersion(idMAME, newAlterMAMEFile[2], newAlterMAMEVersion[2], newbuildAlterMAME[2]);
       newAlterMAMEDateTime[2]:= FileAgeW(AlterMAME2_exec.Text); // get modified date/time
       SetAlterMAME2Text;
       //SetEmulatorIcon(-1, True);
       Screen.Cursor:= crDefault;
     end;
end;

procedure TFormArcadeEmulatorsSetup.ButtonClearAlterMAME2Click(
  Sender: TObject);
begin
  AlterMAME2_exec.Clear;
  newAlterMAMEVersion[2]:= '';
  newAlterMAMEDateTime[2]:= -1;
  newbuildAlterMAME[2]:= '';
  SetAlterMAME2Text;
  //ClearEmulatorIcon(True);
end;

procedure TFormArcadeEmulatorsSetup.AlterMAME2_execChange(Sender: TObject);
begin
  newAlterMAMEFile[2]:= AlterMAME2_exec.Text;
end;

procedure TFormArcadeEmulatorsSetup.AlterMAME2_versioninfoChange(
  Sender: TObject);
begin
  newAlterMAMEVersion[2]:= AlterMAME2_versioninfo.Text;
end;

procedure TFormArcadeEmulatorsSetup.ButtonClearArcade_execClick(
  Sender: TObject);
begin
  ButtonClearSystem.Tag:= 1;
  ButtonClearSystem.Click;
  Sleep(20);
  ButtonClearSystem.Tag:= 0;
end;

end.

