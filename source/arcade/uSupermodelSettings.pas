unit uSupermodelSettings;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  StdCtrls, MPCommonObjects, EasyListview, ComCtrls, IniFiles,
  ImgList, GR32_RangeBars, ExtCtrls, Buttons, PanelEx,
  ShadowLabel, AdvGroupBox, AdvOfficeButtons;

type
  TFormSupermodelSettings = class(TForm)
    TopBar: TPanelEx;
    VideoGroupBox: TAdvGroupBox;
    LabelResolution: TLabel;
    LabelVertexShader: TLabel;
    LabelFragmentShader: TLabel;
    ScreenResolution: TComboBox;
    DisableThrottle: TAdvOfficeCheckBox;
    ShowFPS: TAdvOfficeCheckBox;
    VertexShader: TEdit;
    FragmentShader: TEdit;
    ButtonSelectVertexShader: TBitBtn;
    ButtonSelectFragmentShader: TBitBtn;
    Widescreen: TAdvOfficeCheckBox;
    FullScreen: TAdvOfficeCheckBox;
    MultiTexture: TAdvOfficeCheckBox;
    InputGroupBox: TAdvGroupBox;
    InputSystem: TComboBox;
    ButtonConfigInput: TBitBtn;
    EnableForceFeedback: TAdvOfficeCheckBox;
    AudioGroupBox: TAdvGroupBox;
    LabelSoundVolume: TLabel;
    LabelMusicVolume: TLabel;
    LabelAudioBalanceFrontRear: TLabel;
    SoundVolume: TGaugeBar;
    DisableSound: TAdvOfficeCheckBox;
    DisableMusic: TAdvOfficeCheckBox;
    MusicVolume: TGaugeBar;
    FlipStereo: TAdvOfficeCheckBox;
    AudioBalanceFrontRear: TGaugeBar;
    PowerPCFrequencyBox: TAdvGroupBox;
    LabelPowerPCFrequency: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    PowerPCFrequency: TGaugeBar;
    PowerPCFrequencyCustom: TEdit;
    Multithreading: TAdvOfficeCheckBox;
    GPUMultithreading: TAdvOfficeCheckBox;
    ButtonReadFile: TBitBtn;
    LabelReadFileIni: TShadowLabel;
    ButtonOk: TBitBtn;
    ButtonCancel: TBitBtn;
    LabelFolderROMs: TLabel;
    FolderROMs: TEasyListview;
    ButtonUp: TBitBtn;
    ButtonDown: TBitBtn;
    FolderROMButtonSelect: TBitBtn;
    FolderROMsButtonEdit: TBitBtn;
    FolderROMsButtonDelete: TBitBtn;
    FolderROMsButtonClear: TBitBtn;
    SystemIcon: TImage;
    GameIcon: TImage;
    LabelGameTitle: TShadowLabel;
    LabelEmulatorVersion: TShadowLabel;
    LabelGameStatus: TShadowLabel;
    LabelVideo3DEngine: TLabel;
    Video3DEngine: TComboBox;
    Crosshairs: TComboBox;
    LabelCrosshairs: TLabel;
    Label1: TLabel;
    DisableVSync: TAdvOfficeCheckBox;
    procedure FormShow(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure PowerPCFrequencyChange(Sender: TObject);
    procedure ButtonReadFileClick(Sender: TObject);
    procedure FolderROMsKeyAction(Sender: TCustomEasyListview;
      var CharCode: Word; var Shift: TShiftState; var DoDefault: Boolean);
    procedure FolderROMsItemEdited(Sender: TCustomEasyListview;
      Item: TEasyItem; var NewValue: Variant; var Accept: Boolean);
    procedure FolderROMsItemEditEnd(Sender: TCustomEasyListview;
      Item: TEasyItem);
    procedure ButtonUpClick(Sender: TObject);
    procedure FolderROMButtonSelectClick(Sender: TObject);
    procedure FolderROMsButtonEditClick(Sender: TObject);
    procedure FolderROMsButtonDeleteClick(Sender: TObject);
    procedure FolderROMsButtonClearClick(Sender: TObject);
    procedure PowerPCFrequencyCustomKeyPress(Sender: TObject;
      var Key: Char);
    procedure ButtonSelectVertexShaderClick(Sender: TObject);
    procedure ButtonSelectFragmentShaderClick(Sender: TObject);
    procedure SoundVolumeChange(Sender: TObject);
    procedure MusicVolumeChange(Sender: TObject);
    procedure ButtonConfigInputClick(Sender: TObject);
    procedure InputSystemSelect(Sender: TObject);
    procedure AudioBalanceFrontRearChange(Sender: TObject);
    procedure SoundVolumeMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure MusicVolumeMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure AudioBalanceFrontRearMouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
  private
    { Private declarations }
    //procedure PopulateScreenResolution;
    procedure ReadSupermodelIni(const iniFile: String; IsCustom: Boolean);
    procedure WriteSupermodelIni(const iniFile: String; IsCustom: Boolean);
  public
    { Public declarations }
    emuIni,
    GameIni,
    emuFileExec,
    emuVersionStr: String;
  end;

var
  FormSupermodelSettings: TFormSupermodelSettings;

implementation

uses uMain, uCommon;

{$R *.dfm}

{procedure TFormSupermodelSettings.PopulateScreenResolution;
var
  ScreenResolutions: TStringList;
begin
  ScreenResolutions:= TStringList.Create;
  ListScreenModes(ScreenResolutions, True);
  ScreenResolutions.BeginUpdate;
  ScreenResolutions.CustomSort(CompareStringListNatural);
  ScreenResolution.Items.Add('Auto');
  ScreenResolution.Items.AddStrings(ScreenResolutions);
  ScreenResolution.Items.EndUpdate;
  ScreenResolution.ItemIndex:= 0;
  FreeAndNil(ScreenResolutions);
end;}

procedure TFormSupermodelSettings.ReadSupermodelIni(const iniFile: String; IsCustom: Boolean);
var
  elCFG, emuFile: TMemIniFile;
  StrValue: String;
  IntValue: Integer;
  CustomEntryList: TStringList;

  function GetInputSystemIndex(const InputStr: String): Integer;
  begin
    Result:= 0;
    if InputStr = 'dinput' then
       Result:= 0
    else
    if InputStr = 'xinput' then
       Result:= 1
    else
    if InputStr = 'rawinput' then
       Result:= 2
    else
    if InputStr = 'sdl' then
       Result:= 3;
  end;

  function CustomSettingExist(const EntryStr: String): Boolean;
  begin
    case IsCustom of
      True : Result:= CustomEntryList.IndexOf(EntryStr) <> -1;
      False: Result:= True; // always return TRUE; default settings is being read!!!
    end;
  end;

begin
  try
    elCFG:= TMemIniFile.Create(FormMain.GetArcadeEmulatorsFile);
    StrValue:= elCFG.ReadString(FormMain.GetArcadeSystemIniSection(idSupermodel), 'roms_path', 'roms');
  finally
     FreeAndNil(elCFG);
  end;
  FormMain.ClearListView(FolderROMs);
  if StrValue = '' then
     StrValue:= 'roms';
  if StrValue <> '' then
     FormMain.ExtractROMsFolders(StrValue, idSupermodel, FolderROMs);

  if not FileExists(iniFile) then
     Exit;

  emuFile:= TMemIniFile.Create(iniFile);

  if IsCustom then
  begin
    CustomEntryList:= TStringList.Create;
    CustomEntryList.LoadFromFile(iniFile);
    CustomEntryList.BeginUpdate;
    for IntValue:=CustomEntryList.Count-1 downto 0 do
    begin
      StrValue:= CustomEntryList[IntValue];
      if StrValue <> '' then
      begin
        if StrValue[1] = '[' then
           CustomEntryList.Delete(IntValue)
        else
        if PosEx('=', StrValue) <> 0 then
           CustomEntryList[IntValue]:= CustomEntryList.Names[IntValue];
      end;
    end;
    CustomEntryList.EndUpdate;
  end;

  if CustomSettingExist('Multithreading') then
     Multithreading.Checked:= Boolean(emuFile.ReadInteger('Emulation', 'Multithreading', 1));

  if CustomSettingExist('GPUMultithreading') then
     GPUMultithreading.Checked:= Boolean(emuFile.ReadInteger('Emulation', 'GPUMultithreading', 1));

  if CustomSettingExist('PowerPCFrequency') then
     begin
       IntValue:= emuFile.ReadInteger('Emulation', 'PowerPCFrequency', 5);
       if not (IntValue in [0..8]) then
          IntValue:= 5; // 50 MHz (default)
       PowerPCFrequency.Position:= IntValue;
     end;
  if CustomSettingExist('PowerPCFrequencyCustom') then
     begin
       StrValue:= emuFile.ReadString('Emulation', 'PowerPCFrequencyCustom', '');
       PowerPCFrequencyCustom.Text:= StrValue;
     end;

  if CustomSettingExist('Resolution') then
     begin
       StrValue:= emuFile.ReadString('Video', 'Resolution', 'auto');
       IntValue:= ScreenResolution.Items.IndexOf(StrValue);
       if IntValue <> -1 then
          ScreenResolution.ItemIndex:= IntValue
       else
          ScreenResolution.ItemIndex:= 0;
     end;

  if CustomSettingExist('New3DEngine') then
     begin
       Video3DEngine.ItemIndex:= emuFile.ReadInteger('Video', 'New3DEngine', 1);
       if Video3DEngine.ItemIndex = -1 then
          Video3DEngine.ItemIndex:= 1; // new 3D engine is the default
     end;

  if CustomSettingExist('FullScreen') then
     FullScreen.Checked:= Boolean(emuFile.ReadInteger('Video', 'FullScreen', 0));

  if CustomSettingExist('Widescreen') then
     Widescreen.Checked:= Boolean(emuFile.ReadInteger('Video', 'Widescreen', 0));

  if CustomSettingExist('MultiTexture') then
     MultiTexture.Checked:= Boolean(emuFile.ReadInteger('Video', 'MultiTexture', 1));

  if CustomSettingExist('DisableThrottle') then
     DisableThrottle.Checked:= Boolean(emuFile.ReadInteger('Video', 'DisableThrottle', 0));

  if CustomSettingExist('DisableVSync') then
     DisableVSync.Checked:= Boolean(emuFile.ReadInteger('Video', 'DisableVSync', 0));

  if CustomSettingExist('ShowFPS') then
     ShowFPS.Checked:= Boolean(emuFile.ReadInteger('Video', 'ShowFPS', 0));

  if CustomSettingExist('DisableSound') then
     DisableSound.Checked:= Boolean(emuFile.ReadInteger('Audio', 'DisableSound', 0));

  if CustomSettingExist('DisableMusic') then
     DisableMusic.Checked:= Boolean(emuFile.ReadInteger('Audio', 'DisableMusic', 0));

  if CustomSettingExist('FlipStereo') then
     FlipStereo.Checked:= Boolean(emuFile.ReadInteger('Audio', 'FlipStereo', 0));

  if CustomSettingExist('SoundVolume') then
     begin
       IntValue:= emuFile.ReadInteger('Audio', 'SoundVolume', 100);
       if (IntValue < SoundVolume.Min) or (IntValue > SoundVolume.Max) then
          IntValue:= 100;
       SoundVolume.Position:= IntValue;
     end;

  if CustomSettingExist('MusicVolume') then
     begin
       IntValue:= emuFile.ReadInteger('Audio', 'MusicVolume', 100);
       if (IntValue < MusicVolume.Min) or (IntValue > MusicVolume.Max) then
          IntValue:= 100;
       MusicVolume.Position:= IntValue;
     end;

  if CustomSettingExist('Balance') then
     begin
       IntValue:= emuFile.ReadInteger('Audio', 'Balance', 0);
       if (IntValue < AudioBalanceFrontRear.Min) or (IntValue > AudioBalanceFrontRear.Max) then
          IntValue:= 0;
       AudioBalanceFrontRear.Position:= IntValue;
     end;

  if CustomSettingExist('InputSystem') then
     begin
       StrValue:= emuFile.ReadString('Controls', 'InputSystem', 'dinput');
       InputSystem.ItemIndex:= GetInputSystemIndex(StrValue);
     end;

  if CustomSettingExist('Crosshairs') then
     begin
       Crosshairs.ItemIndex:= emuFile.ReadInteger('Controls', 'Crosshairs', 0); // 0 = none (default)
       if Crosshairs.ItemIndex = -1 then
          Crosshairs.ItemIndex:= 0;
     end;

  if CustomSettingExist('EnableForceFeedback') then
     EnableForceFeedback.Checked:= Boolean(emuFile.ReadInteger('Controls', 'EnableForceFeedback', 0));

  if CustomSettingExist('VertexShader') then
     VertexShader.Text:= emuFile.ReadString('Debug', 'VertexShader', '');

  if CustomSettingExist('FragmentShader') then
     FragmentShader.Text:= emuFile.ReadString('Debug', 'FragmentShader', '');

  FreeAndNil(emuFile);
  if IsCustom then
     FreeAndNil(CustomEntryList);
end;

procedure TFormSupermodelSettings.WriteSupermodelIni(const iniFile: String; IsCustom: Boolean);
var
  elCFG, emuFile: TMemIniFile;
  StrValue: String;
  IntValue: Integer;
  CustomEntryList: TStringList;

  function GetInputSystemName: String;
  begin
    case InputSystem.ItemIndex of
      0: Result:= 'dinput';
      1: Result:= 'xinput';
      2: Result:= 'rawinput';
      3: Result:= 'sdl';
    else
      Result:= 'dinput';
    end;
  end;

  function CheckEmulatorIniValue(const EntryStr, EntryValue: String): Boolean;
  begin
    case IsCustom of
      True : Result:= CustomEntryList.IndexOf(EntryStr+'='+EntryValue) = -1;
      False: Result:= True; // always return TRUE; default settings is being written!!!
    end;
  end;

begin
  if FormSupermodelSettings.Tag = 0 then
     begin
        // default emulator settings only!
        StrValue:= FormMain.MountFoldersListMAME(FolderROMs);
        if StrValue = '' then
           StrValue:= 'roms';
        try
          elCFG:= TMemIniFile.Create(FormMain.GetArcadeEmulatorsFile);
          elCFG.WriteString(FormMain.GetArcadeSystemIniSection(idSupermodel), 'roms_path', StrValue);
          elCFG.UpdateFile;
        finally
          FreeAndNil(elCFG);
        end;
     end;

  if IsCustom then
  begin
    CustomEntryList:= TStringList.Create;
    if FileExists(emuIni) then // in case the file doesn't exist
    begin
      CustomEntryList.LoadFromFile(emuIni);
      CustomEntryList.BeginUpdate;
      for IntValue:=CustomEntryList.Count-1 downto 0 do
      begin
        StrValue:= CustomEntryList[IntValue];
        if StrValue <> '' then
        begin
          if StrValue[1] = '[' then
             CustomEntryList.Delete(IntValue);
        end;
      end;
      CustomEntryList.EndUpdate;
    end;
  end;

  CheckAndCreateFolder(ExtractFilePath(iniFile));
  if FileExists(iniFile) then
     DeleteFile(iniFile);
  emuFile:= TMemIniFile.Create(iniFile);

  if CheckEmulatorIniValue('Multithreading', IntToStr(Ord(Multithreading.Checked))) then
     emuFile.WriteInteger('Emulation', 'Multithreading', Ord(Multithreading.Checked));

  if CheckEmulatorIniValue('GPUMultithreading', IntToStr(Ord(GPUMultithreading.Checked))) then
     emuFile.WriteInteger('Emulation', 'GPUMultithreading', Ord(GPUMultithreading.Checked));

  if CheckEmulatorIniValue('PowerPCFrequency', IntToStr(PowerPCFrequency.Position)) then
     emuFile.WriteInteger('Emulation', 'PowerPCFrequency', PowerPCFrequency.Position);

  if PowerPCFrequencyCustom.Text = '' then
     PowerPCFrequencyCustom.Text:= '1000'
  else
  if StrToInt(PowerPCFrequencyCustom.Text) < 1 then
     PowerPCFrequencyCustom.Text:= '1'
  else
  if StrToInt(PowerPCFrequencyCustom.Text) > 1000 then
     PowerPCFrequencyCustom.Text:= '1000';

  if CheckEmulatorIniValue('PowerPCFrequencyCustom', PowerPCFrequencyCustom.Text) then
     emuFile.WriteString('Emulation', 'PowerPCFrequencyCustom', PowerPCFrequencyCustom.Text);

  StrValue:= ScreenResolution.Text;
  if Strvalue = '' then
     StrValue:= 'auto';

  if CheckEmulatorIniValue('Resolution', StrValue) then
     emuFile.WriteString('Video', 'Resolution', StrValue);

  if Video3DEngine.ItemIndex = -1 then
     Video3DEngine.ItemIndex:= 1;

  if CheckEmulatorIniValue('New3DEngine', IntToStr(Video3DEngine.ItemIndex)) then
     emuFile.WriteInteger('Video', 'New3DEngine', Video3DEngine.ItemIndex);

  if CheckEmulatorIniValue('FullScreen', IntToStr(Ord(FullScreen.Checked))) then
     emuFile.WriteInteger('Video', 'FullScreen', Ord(FullScreen.Checked));

  if CheckEmulatorIniValue('Widescreen', IntToStr(Ord(Widescreen.Checked))) then
     emuFile.WriteInteger('Video', 'Widescreen', Ord(Widescreen.Checked));

  if CheckEmulatorIniValue('MultiTexture', IntToStr(Ord(MultiTexture.Checked))) then
     emuFile.WriteInteger('Video', 'MultiTexture', Ord(MultiTexture.Checked));

  if CheckEmulatorIniValue('DisableThrottle', IntToStr(Ord(DisableThrottle.Checked))) then
     emuFile.WriteInteger('Video', 'DisableThrottle', Ord(DisableThrottle.Checked));

  if CheckEmulatorIniValue('DisableVSync', IntToStr(Ord(DisableVSync.Checked))) then
     emuFile.WriteInteger('Video', 'DisableVSync', Ord(DisableVSync.Checked));

  if CheckEmulatorIniValue('ShowFPS', IntToStr(Ord(ShowFPS.Checked))) then
     emuFile.WriteInteger('Video', 'ShowFPS', Ord(ShowFPS.Checked));

  if CheckEmulatorIniValue('DisableSound', IntToStr(Ord(DisableSound.Checked))) then
     emuFile.WriteInteger('Audio', 'DisableSound', Ord(DisableSound.Checked));

  if CheckEmulatorIniValue('DisableMusic', IntToStr(Ord(DisableMusic.Checked))) then
     emuFile.WriteInteger('Audio', 'DisableMusic', Ord(DisableMusic.Checked));

  if CheckEmulatorIniValue('FlipStereo', IntToStr(Ord(FlipStereo.Checked))) then
     emuFile.WriteInteger('Audio', 'FlipStereo', Ord(FlipStereo.Checked));

  if CheckEmulatorIniValue('SoundVolume', IntToStr(SoundVolume.Position)) then
     emuFile.WriteInteger('Audio', 'SoundVolume', SoundVolume.Position);

  if CheckEmulatorIniValue('MusicVolume', IntToStr(MusicVolume.Position)) then
     emuFile.WriteInteger('Audio', 'MusicVolume', MusicVolume.Position);

  if CheckEmulatorIniValue('Balance', IntToStr(AudioBalanceFrontRear.Position)) then
     emuFile.WriteInteger('Audio', 'Balance', AudioBalanceFrontRear.Position);

  if CheckEmulatorIniValue('InputSystem', GetInputSystemName) then
     emuFile.WriteString('Controls', 'InputSystem', GetInputSystemName);

  if CheckEmulatorIniValue('Crosshairs', IntToStr(Crosshairs.ItemIndex)) then
     emuFile.WriteInteger('Controls', 'Crosshairs', Crosshairs.ItemIndex); // 0 = none (default)

  if CheckEmulatorIniValue('EnableForceFeedback', IntToStr(Ord(EnableForceFeedback.Checked))) then
     emuFile.WriteInteger('Controls', 'EnableForceFeedback', Ord(EnableForceFeedback.Checked));

  if CheckEmulatorIniValue('VertexShader', VertexShader.Text) then
     emuFile.WriteString('Debug', 'VertexShader', VertexShader.Text);

  if CheckEmulatorIniValue('FragmentShader', FragmentShader.Text) then
     emuFile.WriteString('Debug', 'FragmentShader', FragmentShader.Text);

  emuFile.UpdateFile;
  FreeAndNil(emuFile);
  if IsCustom then
     FreeAndNil(CustomEntryList);
end;

procedure TFormSupermodelSettings.FormShow(Sender: TObject);
begin
  FormMain.ELV_ResetNormalColors(FolderROMs);
  FormMain.IL_Systems.GetIcon(idSupermodel, SystemIcon.Picture.Icon);
  //FormMain.LoadSystemThumbIcon(SystemIcon, 6);
  LabelGameTitle.Caption:= FormMain.GetArcadeGameSysTitle(Tag = 1, idSupermodel, emuVersionStr);
  //LabelEmulatorVersion.Visible:= Tag = 1;
  //if FormMain.EmulatorVersion[idSupermodel] <> '' then
  //   LabelEmulatorVersion.Caption:= FormMain.EmulatorVersion[idSupermodel]
  //else
  //   LabelEmulatorVersion.Caption:= '';

  if Tag = 0 then
     begin
       //LabelEmulatorVersion.Caption:= FormMain.EmulatorFile[idSupermodel]+#13#10+LabelReadFileIni.Caption;
       LabelEmulatorVersion.Caption:= emuFileExec+#13#10+LabelReadFileIni.Caption;
       LabelReadFileIni.Visible:= False;
       TopBar.Color1:= $00dccdc0;
       FormMain.IL_ArcadeSystem_ExtraLarge.GetIcon(idSupermodel, SystemIcon.Picture.Icon);
       FormMain.LoadMessageIcon(GameIcon, 'info.ico');
       //FormMain.IL_Systems.GetIcon(idSupermodel, SystemIcon.Picture.Icon);
       //FormMain.LoadMessageIcon(GameIcon, 'info.ico');
       LabelGameStatus.Visible:= False;
     end
  else
  if Tag = 1 then
     begin
       if emuVersionStr <> '' then
          LabelEmulatorVersion.Caption:= emuVersionStr
       else
          LabelEmulatorVersion.Caption:= '';

       if LabelEmulatorVersion.Caption = '' then
          LabelEmulatorVersion.Caption:= 'name: '+FormMain.StatusBar_GamesGameName.Caption
       else
          LabelEmulatorVersion.Caption:= 'name: '+FormMain.StatusBar_GamesGameName.Caption+#13#10+
                                         LabelEmulatorVersion.Caption;
       LabelGameStatus.Caption:= LabelGameStatus.Hint+#13#10+FormMain.GetGameStatusText(FormMain.MemGameInfo.eGameSetStatus, FormMain.MemGameInfo.eROMIdentification);

       LabelFolderROMs.Enabled:= False;
       FolderROMs.Enabled:= False;
       FolderROMs.Font.Color:= clSilver;
       ButtonUp.Enabled:= False;
       ButtonDown.Enabled:= False;
       FolderROMButtonSelect.Enabled:= False;
       FolderROMsButtonEdit.Enabled:= False;
       FolderROMsButtonDelete.Enabled:= False;
       FolderROMsButtonClear.Enabled:= False;
       FormMain.IL_StandardIconsExtraLarge.GetIcon(FormMain.MemGameInfo.eROMIdentification, SystemIcon.Picture.Icon);
       FormMain.IL_ArcadeSystem_Small.GetIcon(FormMain.MemGameInfo.eSystemID, GameIcon.Picture.Icon);
       //FormMain.LoadGameIDThumbIcon(SystemIcon, FormMain.MemGameInfo.eROMIdentification);
       //FormMain.IL_ArcadeSystem_Large.GetIcon(idSupermodel, GameIcon.Picture.Icon);
       case FormMain.MemGameInfo.eGameSetStatus of
         0: TopBar.Color1:= $00f0fae5; // green
         1: TopBar.Color1:= $00e5f0fa; // red (based on green)
         2: TopBar.Color1:= $00eeeeee; // silver (base on green)
       end;
     end;
  AudioGroupBox.DoubleBuffered:= True;
  PopulateScreenResolution(ScreenResolution, True);
  //PopulateScreenResolution;
  ButtonReadFile.Click;
  Screen.Cursor:= crDefault;
end;

procedure TFormSupermodelSettings.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #27 then
     ButtonCancel.Click;
end;

procedure TFormSupermodelSettings.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  CanClose:= not FormMain.ELV_IsEditing(FolderROMs);
  if CanClose then
     begin
       if ModalResult = mrOk then
          begin
            case FormSupermodelSettings.Tag of
              0: WriteSupermodelIni(emuIni, False); // default options
              1: WriteSupermodelIni(GameIni, True); // game options
            end;
          end;
       SetCurrentDir(FormMain.FrontendPath);
     end;
end;

procedure TFormSupermodelSettings.PowerPCFrequencyChange(Sender: TObject);
begin
  LabelPowerPCFrequency.Caption:= Format('%u Mhz', [Model3PowerPCFrequency[PowerPCFrequency.Position]]);
  if PowerPCFrequency.Position <> 5 then
     begin
       if LabelPowerPCFrequency.Font.Color <> clRed then
          LabelPowerPCFrequency.Font.Color:= clRed;
     end
  else
     LabelPowerPCFrequency.Font.Color:= clBlack;

end;

procedure TFormSupermodelSettings.ButtonReadFileClick(Sender: TObject);
begin
  ReadSupermodelIni(emuIni, False);
  if Tag = 1 then
     ReadSupermodelIni(GameIni, True);
end;

procedure TFormSupermodelSettings.FolderROMsKeyAction(
  Sender: TCustomEasyListview; var CharCode: Word; var Shift: TShiftState;
  var DoDefault: Boolean);
begin
  case CharCode of
    VK_DELETE: FolderROMsButtonDelete.Click;
    VK_F2: FolderROMsButtonEdit.Click;
  end;
end;

procedure TFormSupermodelSettings.FolderROMsItemEdited(
  Sender: TCustomEasyListview; Item: TEasyItem; var NewValue: Variant;
  var Accept: Boolean);
begin
  if not Item.Selected then
     Exit;
  if NewValue = '' then
     Accept:= False
  else
     begin
       if Item.Caption <> NewValue then
          Item.Caption:= NewValue;
     end;
end;

procedure TFormSupermodelSettings.FolderROMsItemEditEnd(
  Sender: TCustomEasyListview; Item: TEasyItem);
begin
  FormMain.ELV_SetEditManager(FolderROMs, False);
end;

procedure TFormSupermodelSettings.ButtonUpClick(Sender: TObject);
begin
  FormMain.ELV_MoveItem(FolderROMs, Boolean(TBitBtn(Sender).Tag));
end;

procedure TFormSupermodelSettings.FolderROMButtonSelectClick(
  Sender: TObject);
begin
  FormMain.DialogSelectMultiFolders(FolderROMs);
end;

procedure TFormSupermodelSettings.FolderROMsButtonEditClick(
  Sender: TObject);
begin
  FormMain.ELV_EnableEdit(FolderROMs);
end;

procedure TFormSupermodelSettings.FolderROMsButtonDeleteClick(
  Sender: TObject);
begin
  FormMain.ELV_DeleteSelected(FolderROMs);
end;

procedure TFormSupermodelSettings.FolderROMsButtonClearClick(
  Sender: TObject);
begin
  FormMain.ClearListView(FolderROMs);
end;

procedure TFormSupermodelSettings.PowerPCFrequencyCustomKeyPress(
  Sender: TObject; var Key: Char);
begin
  if not (Key in ['0'..'9', Chr(VK_BACK)]) then
     Key:= Char(0);
end;

procedure TFormSupermodelSettings.ButtonSelectVertexShaderClick(
  Sender: TObject);
begin
  FormMain.DialogOpenFile(12, 'Select a shader file', VertexShader, False);
end;

procedure TFormSupermodelSettings.ButtonSelectFragmentShaderClick(
  Sender: TObject);
begin
  FormMain.DialogOpenFile(12, 'Select a shader file', FragmentShader, False);
end;

procedure TFormSupermodelSettings.SoundVolumeChange(Sender: TObject);
begin
  LabelSoundVolume.Caption:= Format(LabelSoundVolume.Hint, [SoundVolume.Position])+' %]';
  if SoundVolume.Position <> 100 then
     begin
       if LabelSoundVolume.Font.Color <> clRed then
          LabelSoundVolume.Font.Color:= clRed;
     end
  else
     LabelSoundVolume.Font.Color:= clBlack;
end;

procedure TFormSupermodelSettings.MusicVolumeChange(Sender: TObject);
begin
  LabelMusicVolume.Caption:= Format(LabelMusicVolume.Hint, [MusicVolume.Position])+' %]';
  if MusicVolume.Position <> 100 then
     begin
       if LabelMusicVolume.Font.Color <> clRed then
          LabelMusicVolume.Font.Color:= clRed;
     end
  else
     LabelMusicVolume.Font.Color:= clBlack;
end;

procedure TFormSupermodelSettings.ButtonConfigInputClick(Sender: TObject);
var
  ExecLine: String;
begin
  if not (InputSystem.ItemIndex in [0, 1]) then
     Exit;

  ExecLine:= SystemStr+FormMain.EmulatorFile[idSupermodel]+SystemStr+' -config-inputs -input-system=';
  case InputSystem.ItemIndex of
    0: ExecLine:= ExecLine+'dinput';
    1: ExecLine:= ExecLine+'xinput';
  end;
  FormMain.RunProcess(ExecLine, False, SW_SHOWNORMAL);//, False);
end;

procedure TFormSupermodelSettings.InputSystemSelect(Sender: TObject);
begin
  ButtonConfigInput.Enabled:= InputSystem.ItemIndex in [0, 1];
end;

procedure TFormSupermodelSettings.AudioBalanceFrontRearChange(
  Sender: TObject);
begin
  LabelAudioBalanceFrontRear.Caption:= Format(LabelAudioBalanceFrontRear.Hint, [AudioBalanceFrontRear.Position])+' %]';
  if AudioBalanceFrontRear.Position <> 0 then
     begin
       if LabelAudioBalanceFrontRear.Font.Color <> clRed then
          LabelAudioBalanceFrontRear.Font.Color:= clRed;
     end
  else
     LabelAudioBalanceFrontRear.Font.Color:= clBlack;
end;

procedure TFormSupermodelSettings.SoundVolumeMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if Button = mbRight then
     SoundVolume.Position:= 100; // reset to default
end;

procedure TFormSupermodelSettings.MusicVolumeMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if Button = mbRight then
     MusicVolume.Position:= 100; // reset to default
end;

procedure TFormSupermodelSettings.AudioBalanceFrontRearMouseDown(
  Sender: TObject; Button: TMouseButton; Shift: TShiftState; X,
  Y: Integer);
begin
  if Button = mbRight then
     AudioBalanceFrontRear.Position:= 0; // reset to default
end;

end.
