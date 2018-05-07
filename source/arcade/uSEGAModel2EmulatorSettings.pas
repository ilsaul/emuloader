unit uSEGAModel2EmulatorSettings;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ComCtrls, IniFiles,
  ImgList, MPCommonObjects, EasyListview, ShadowLabel, PanelEx,
  Buttons, AdvGroupBox, AdvOfficeButtons;

const
  FolderROM_Status: packed array[0..1] of String = ('Inactive', 'Active');

type
  TFormSEGAModel2EmulatorSettings = class(TForm)
    TopBar: TPanelEx;
    LabelGameTitle: TShadowLabel;
    LabelEmulatorVersion: TShadowLabel;
    SystemIcon: TImage;
    GameIcon: TImage;
    LabelGameStatus: TShadowLabel;
    Label1: TLabel;
    FolderROMs: TEasyListview;
    ButtonUp: TBitBtn;
    ButtonDown: TBitBtn;
    FolderROMButtonSelect: TBitBtn;
    FolderROMsButtonSetActiveInactive: TBitBtn;
    FolderROMsButtonEdit: TBitBtn;
    FolderROMsButtonDelete: TBitBtn;
    FolderROMsButtonClear: TBitBtn;
    GroupBox2: TAdvGroupBox;
    LabelFullScreenResolution: TLabel;
    LabelWidescreenWindow: TLabel;
    FullScreenResolution: TComboBox;
    AutoSwitchFullScreen: TAdvOfficeCheckBox;
    ForceSync: TAdvOfficeCheckBox;
    WidescreenWindow: TComboBox;
    Frameskip: TComboBox;
    LabelFrameskip: TLabel;
    EnableSound: TAdvOfficeCheckBox;
    AdvGroupBox1: TAdvGroupBox;
    ReturnToNeutral: TAdvOfficeCheckBox;
    UseRawInput: TAdvGroupBox;
    LabelRawDevicePlayer1: TLabel;
    LabelRawDevicePlayer2: TLabel;
    RawDevicePlayer1: TComboBox;
    RawDevicePlayer2: TComboBox;
    ForceFeedbackEnable: TAdvOfficeCheckBox;
    XInput: TAdvOfficeCheckBox;
    Label2: TLabel;
    ForceManagedTextures: TComboBox;
    SoftwareVertexProcessing: TAdvOfficeCheckBox;
    Wireframe: TAdvOfficeCheckBox;
    FakeGouraud: TAdvOfficeCheckBox;
    BilinearFiltering: TAdvOfficeCheckBox;
    FilterTilemaps: TAdvOfficeCheckBox;
    TrilinearFiltering: TAdvOfficeCheckBox;
    AutoMipMap: TAdvOfficeCheckBox;
    MeshTransparency: TAdvOfficeCheckBox;
    Crosshair: TAdvOfficeCheckBox;
    ButtonReadFile: TBitBtn;
    LabelReadFileIni: TShadowLabel;
    ButtonOk: TBitBtn;
    ButtonCancel: TBitBtn;
    FSAA: TAdvOfficeCheckBox;
    procedure FormShow(Sender: TObject);
    procedure ButtonReadFileClick(Sender: TObject);
    procedure FolderROMButtonSelectClick(Sender: TObject);
    procedure FolderROMsButtonEditClick(Sender: TObject);
    procedure FolderROMsButtonDeleteClick(Sender: TObject);
    procedure FolderROMsButtonClearClick(Sender: TObject);
    procedure FolderROMsButtonSetActiveInactiveClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FolderROMsItemPaintText(Sender: TCustomEasyListview;
      Item: TEasyItem; Position: Integer; ACanvas: TCanvas);
    procedure FolderROMsKeyAction(Sender: TCustomEasyListview;
      var CharCode: Word; var Shift: TShiftState; var DoDefault: Boolean);
    procedure FolderROMsItemSelectionChanged(
      Sender: TCustomEasyListview; Item: TEasyItem);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FolderROMsItemEdited(Sender: TCustomEasyListview;
      Item: TEasyItem; var NewValue: Variant; var Accept: Boolean);
    procedure FolderROMsItemEditEnd(Sender: TCustomEasyListview;
      Item: TEasyItem);
    procedure ButtonUpClick(Sender: TObject);
  private
    { Private declarations }
    customResolution: String;
    //procedure PopulateScreenResolution;
  public
    { Public declarations }
    emuIni,
    GameIni,
    emuFileExec,
    emuVersionStr: String;
    SaveCfg: Boolean;

    procedure ReadEmulatorIniFile(const IniFile: String);
    procedure WriteEmulatorIniFile(const CustomIni: String);
  end;

var
  FormSEGAModel2EmulatorSettings: TFormSEGAModel2EmulatorSettings;

implementation

uses uMain, uCommon;

{$R *.dfm}

procedure TFormSEGAModel2EmulatorSettings.ReadEmulatorIniFile(const IniFile: String);
var
  Value, EntryString: String;
  Model2Ini: THashedStringList;
  Loop, dirIndex: Integer;
  ActiveROMFolder: Boolean;

  function ReadEntry(const EntryStr, DefaultValue: String): Boolean;
  var
    cIndex: Integer;
  begin
    Value:= '';
    Result:= Model2Ini.IndexOfName(EntryStr) <> -1;
    if Result then
       begin
         Value:= Model2Ini.Values[EntryStr];
         if Value = '' then
            Value:= DefaultValue
         else
            begin
              cIndex:= PosEx(';', Value);
              if cIndex <> 0 then
                 Delete(Value, cIndex, Length(Value));
              Value:= Trim(Value);
            end;
       end;
  end;

begin
  if not FileExists(IniFile) then
     Exit;

  ThousandSeparator:= Char(',');
  DecimalSeparator:= Char('.');
  Model2Ini:= THashedStringList.Create;
  Model2Ini.LoadFromFile(IniFile);

  FormMain.ClearListView(FolderROMs);
  FolderROMs.BeginUpdate;
  for Loop:=1 to 10 do
  begin
    Value:= '';
    ActiveROMFolder:= False;
    dirIndex:= Model2Ini.IndexOfName('Dir'+IntToStr(Loop));
    if dirIndex = -1 then
       dirIndex:= Model2Ini.IndexOfName(';Dir'+IntToStr(Loop));
    if dirIndex <> -1 then
       begin
         EntryString:= Model2Ini.Names[dirIndex];
         ActiveROMFolder:= EntryString[1] <> ';';
         Value:= Model2Ini.ValueFromIndex[dirIndex];
       end;
    if Value <> '' then
       begin
         with FolderROMs.Items.Add do
         begin
           ImageIndex:= 4;
           Caption:= Value;
           Captions[1]:= FolderROM_Status[Ord(ActiveROMFolder)];
         end;
       end;
  end;
  FolderROMs.EndUpdate;

  if ReadEntry('SoftwareVertexProcessing', '0') then
     SoftwareVertexProcessing.Checked:= Boolean(StrToInt(Value));

  if ReadEntry('Wireframe', '0') then
     Wireframe.Checked:= Boolean(StrToInt(Value));

  if ReadEntry('FakeGouraud', '0') then
     FakeGouraud.Checked:= Boolean(StrToInt(Value));

  if ReadEntry('Bilinear', '1') then
     BilinearFiltering.Checked:= Boolean(StrToInt(Value));

  if ReadEntry('Trilinear', '0') then
     TrilinearFiltering.Checked:= Boolean(StrToInt(Value));

  if ReadEntry('FilterTilemaps', '0') then
     FilterTilemaps.Checked:= Boolean(StrToInt(Value));

  if ReadEntry('ForceManaged', '0') then
     ForceManagedTextures.ItemIndex:= StrToInt(Value);

  if ReadEntry('ForceSync', '0') then
     ForceSync.Checked:= Boolean(StrToInt(Value));

  if ReadEntry('FullScreenWidth', '640') then
     customResolution:= Value;
  if ReadEntry('FullScreenHeight', '480') then
     customResolution:= customResolution+'x'+Value;

  if ReadEntry('AutoMip', '0') then
     AutoMipMap.Checked:= Boolean(StrToInt(Value));

  if ReadEntry('MeshTransparency', '0') then
     MeshTransparency.Checked:= Boolean(StrToInt(Value));

  if ReadEntry('DrawCross', '1') then
     Crosshair.Checked:= Boolean(StrToInt(Value));

  if ReadEntry('WideScreenWindow', '0') then
     WideScreenWindow.ItemIndex:= StrToInt(Value);

  if ReadEntry('FSAA', '0') then
     FSAA.Checked:= Boolean(StrToInt(Value));

  if ReadEntry('FullMode', '0') then
     begin
       dirIndex:= StrToInt(Value);
       if dirIndex = 4 then
          begin
            dirIndex:= FullScreenResolution.Items.IndexOf(customResolution);
            if dirIndex <> -1 then
               FullScreenResolution.ItemIndex:= dirIndex
            else
               FullScreenResolution.ItemIndex:= 0;
          end
       else
          FullScreenResolution.ItemIndex:= dirIndex;
     end;

  if ReadEntry('Sound', '1') then
     EnableSound.Checked:= Boolean(StrToInt(Value));

  if ReadEntry('Frameskip', '-1') then
     begin
       if Value = '-1' then
          Frameskip.ItemIndex:= 0
       else
          Frameskip.ItemIndex:= StrToInt(Value)+1;
     end;
     
  if ReadEntry('AutoFull', '0') then
     AutoSwitchFullScreen.Checked:= Boolean(StrToInt(Value));

  if ReadEntry('XInput', '0') then
     XInput.Checked:= Boolean(StrToInt(Value));

  if ReadEntry('EnableFF', '0') then
     ForceFeedbackEnable.Checked:= Boolean(StrToInt(Value));

  if ReadEntry('HoldGears', '0') then
     ReturnToNeutral.Checked:= Boolean(StrToInt(Value));

  if ReadEntry('UseRawInput', '0') then
     UseRawInput.CheckBox.Checked:= Boolean(StrToInt(Value));

  if ReadEntry('RawDevP1', '0') then
     RawDevicePlayer1.ItemIndex:= StrToInt(Value);

  if ReadEntry('RawDevP2', '1') then
     RawDevicePlayer2.ItemIndex:= StrToInt(Value);

  {
  // force feedback settings
  // FE_CENTERING Effect (Spring centering effect)

  if ReadEntry('FE_CENTERING_Gain', '0.5') then
     FE_Centering_GlobalGain.Position:= StrToFloat(Value);
  if ReadEntry('FE_CENTERING_Coefficient', '10000') then
     FE_Centering_Coefficient.Position:= StrToInt(Value);
  if ReadEntry('FE_CENTERING_Saturation', '10000') then
     FE_Centering_Saturation.Position:= StrToInt(Value);
  if ReadEntry('FE_CENTERING_Deadband', '1000') then
     FE_Centering_Deadband.Position:= StrToInt(Value);

  //FE_CLUTCH Effect (Friction, wheel turn hardness)
  if ReadEntry('FE_CLUTCH_Gain', '1.0') then
     FE_Clutch_GlobalGain.Position:= StrToFloat(Value);
  if ReadEntry('FE_CLUTCH_Coefficient', '10000') then
     FE_Clutch_Coefficient.Position:= StrToInt(Value);

  //FE_LEFT,FE_RIGHT (Constant force in a direction)
  if ReadEntry('FE_LEFT_Gain', '1.0') then
     FE_Left_GlobalGain.Position:= StrToFloat(Value);
  if ReadEntry('FE_LEFT_Magnitude', '10000') then
     FE_Left_Magnitude.Position:= StrToInt(Value);
  if ReadEntry('FE_RIGHT_Gain', '1.0') then
     FE_Right_GlobalGain.Position:= StrToFloat(Value);
  if ReadEntry('FE_RIGHT_Magnitude', '10000') then
     FE_Right_Magnitude.Position:= StrToInt(Value);

  //FE_UNCENTERING (Sine force, wave the wheel, rumble)
  if ReadEntry('FE_UNCENTERING_Gain', '1.0') then
     FE_Uncentering_GlobalGain.Position:= StrToFloat(Value);
  if ReadEntry('FE_UNCENTERING_Magnitude', '10000') then
     FE_Uncentering_Magnitude.Position:= StrToInt(Value);
  if ReadEntry('FE_UNCENTERING_Offset', '-200') then
     FE_Uncentering_Offset.Position:= StrToInt(Value);
  if ReadEntry('FE_UNCENTERING_Phase', '0') then
     FE_Uncentering_Phase.Position:= StrToInt(Value);
  if ReadEntry('FE_UNCENTERING_Period', '56000') then
     FE_Uncentering_Period.Position:= StrToInt(Value);
  }
  FreeAndNil(Model2Ini);
end;

procedure TFormSEGAModel2EmulatorSettings.WriteEmulatorIniFile(const CustomIni: String);
var
  EntryString: String;
  Model2Ini: TStringList;
  Loop, DirEntryIndex: Integer;

  function GetLastDirEntryPos: Integer;
  var
    dLoop, titleIndex: Byte;
  begin
    titleIndex:= Model2Ini.IndexOf('[RomDirs]');
    Result:= titleIndex+1;
    if Model2Ini[Result] = '' then
       Exit;
       
    for dLoop:=titleIndex+1 to 15 do
    begin
      if Model2Ini[dLoop] = '' then
         begin
           Result:= dLoop;
           Break;
         end;
    end;
    if Result > titleIndex+1 then
       begin
         for dLoop:= Result-1 downto titleIndex+1 do
         Model2Ini.Delete(dLoop);
       end;
    Result:= titleIndex+1;
  end;

  function UpdateSetting(const EntryStr, NewValue: String): Boolean;
  var
    iComment: String;
    cPos: Integer;
    eIndex: Integer;
  begin
    eIndex:= Model2Ini.IndexOfName(EntryStr);
    Result:= eIndex <> -1;
    if not Result then
       Exit; // entry doesn't exist... skip it

    iComment:= '';
    cPos:= PosEx(';', Model2Ini[eIndex]);
    if cPos <> 0 then
       begin
         iComment:= Copy(Model2Ini[eIndex], cPos, Length(Model2Ini[eIndex]));
         Model2Ini[eIndex]:= Format('%-32s', [EntryStr+'='+NewValue])+iComment;
       end
    else
       Model2Ini[eIndex]:= EntryStr+'='+NewValue;
  end;

begin
  ThousandSeparator:= Char(',');
  DecimalSeparator:= Char('.');
  CheckAndCreateFolder(ExtractFilePath(customIni));
  Model2Ini:= TStringList.Create;
  Model2Ini.LoadFromFile(customIni);
  Model2Ini.BeginUpdate;
  DirEntryIndex:= GetLastDirEntryPos; // clear RomsDir section
  if FolderROMs.Items.Count > 0 then
     begin
       for Loop:=FolderROMs.Items.Count-1 downto 0 do
       begin
         EntryString:= 'Dir'+IntToStr(Loop+1);
         if FolderROMs.Items[Loop].Captions[1] = FolderROM_Status[0] then
            EntryString:= ';'+EntryString;
         Model2Ini.Insert(DirEntryIndex, EntryString+'='+FolderROMs.Items[Loop].Caption);
       end;
     end;

  UpdateSetting('SoftwareVertexProcessing', IntToStr(Ord(SoftwareVertexProcessing.Checked)));
  UpdateSetting('Wireframe', IntToStr(Ord(Wireframe.Checked)));
  UpdateSetting('FakeGouraud', IntToStr(Ord(FakeGouraud.Checked)));
  UpdateSetting('Bilinear', IntToStr(Ord(BilinearFiltering.Checked)));
  UpdateSetting('Trilinear', IntToStr(Ord(TrilinearFiltering.Checked)));
  UpdateSetting('FilterTilemaps', IntToStr(Ord(FilterTilemaps.Checked)));
  UpdateSetting('ForceManaged', IntToStr(ForceManagedTextures.ItemIndex));

  UpdateSetting('ForceSync', IntToStr(Ord(ForceSync.Checked)));

  if FullScreenResolution.ItemIndex > 3 then
     begin
       UpdateSetting('FullMode', '4');
       UpdateSetting('FullScreenWidth', Copy(FullScreenResolution.Text, 1, PosEx('x', FullScreenResolution.Text)-1));
       UpdateSetting('FullScreenHeight', Copy(FullScreenResolution.Text, PosEx('x', FullScreenResolution.Text)+1, Length(FullScreenResolution.Text)));
     end
  else
     UpdateSetting('FullMode', IntToStr(FullScreenResolution.ItemIndex));

  UpdateSetting('AutoMip', IntToStr(Ord(AutoMipMap.Checked)));
  UpdateSetting('MeshTransparency', IntToStr(Ord(MeshTransparency.Checked)));

  UpdateSetting('DrawCross', IntToStr(Ord(Crosshair.Checked)));
  UpdateSetting('WideScreenWindow', IntToStr(WideScreenWindow.ItemIndex));

  UpdateSetting('FSAA', IntToStr(Ord(FSAA.Checked)));

  UpdateSetting('Sound', IntToStr(Ord(EnableSound.Checked)));
  if Frameskip.ItemIndex = 0 then
     UpdateSetting('Frameskip', '-1')
  else
     UpdateSetting('Frameskip', IntToStr(FrameSkip.ItemIndex-1));
  UpdateSetting('AutoFull', IntToStr(Ord(AutoSwitchFullScreen.Checked)));

  UpdateSetting('XInput', IntToStr(Ord(XInput.Checked)));
  UpdateSetting('EnableFF', IntToStr(Ord(ForceFeedbackEnable.Checked)));
  UpdateSetting('HoldGears', IntToStr(Ord(ReturnToNeutral.Checked)));

  UpdateSetting('UseRawInput', IntToStr(Ord(UseRawInput.CheckBox.Checked)));
  UpdateSetting('RawDevP1', IntToStr(RawDevicePlayer1.ItemIndex));
  UpdateSetting('RawDevP2', IntToStr(RawDevicePlayer2.ItemIndex));

  Model2Ini.SaveToFile(customIni);
  FreeAndNil(Model2Ini);
end;

{procedure TFormSEGAModel2EmulatorSettings.WriteEmulatorIniFile(const CustomIni: String);
var
  EntryString, CommentStr: String;
  Model2MemIni: TMemIniFile;
  Loop: Integer;
  AddSpaces: Byte;

  function UpdateSetting(const SectionStr, EntryStr, NewValue: String): Boolean;
  var
    iValue, iComment: String;
    cPos: Integer;
  begin
    iValue:= Model2MemIni.ReadString(SectionStr, EntryStr, '');
    Result:= iValue <> '';
    if not Result then
       Exit; // entry doesn't exist... skip it
    iComment:= '';
    cPos:= Pos(';', iValue);
    if cPos <> 0 then
       iComment:= Copy(iValue, cPos, Length(iValue));
    iValue:= NewValue;
    if iComment <> '' then
       begin
         AddSpaces:= 15-Length(NewValue);
         iValue:= NewValue+Format('%'+IntToStr(AddSpaces)+'s', [''])+iComment;
         ShowMessage('"'+iComment+'"'+#13#10+iValue);
       end;
    Model2MemIni.WriteString(SectionStr, EntryStr, iValue);
  end;

begin
  ThousandSeparator:= Char(',');
  DecimalSeparator:= Char('.');
  CheckAndCreateFolder(ExtractFilePath(customIni));
  Model2MemIni:= TMemIniFile.Create(CustomIni);
  if FolderROMs.Items.Count > 0 then
     begin
       for Loop:=0 to FolderROMs.Items.Count-1 do
       begin
         EntryString:= 'Dir'+IntToStr(Loop+1);
         if FolderROMs.Items[Loop].Captions[1] = FolderROM_Status[0] then
            EntryString:= ';'+EntryString;
         Model2MemIni.WriteString('RomDirs', EntryString, FolderROMs.Items[Loop].Caption);
       end;
     end;


  UpdateSetting('Renderer', 'SoftwareVertexProcessing', IntToStr(Ord(SoftwareVertexProcessing.Checked)));
  UpdateSetting('Renderer', 'Wireframe', IntToStr(Ord(Wireframe.Checked)));
  UpdateSetting('Renderer', 'FakeGouraud', IntToStr(Ord(FakeGouraud.Checked)));
  UpdateSetting('Renderer', 'Bilinear', IntToStr(Ord(BilinearFiltering.Checked)));
  UpdateSetting('Renderer', 'Trilinear', IntToStr(Ord(TrilinearFiltering.Checked)));
  UpdateSetting('Renderer', 'FilterTilemaps', IntToStr(Ord(FilterTilemaps.Checked)));
  UpdateSetting('Renderer', 'ForceManaged', IntToStr(ForceManagedTextures.ItemIndex));

  UpdateSetting('Renderer', 'ForceSync', IntToStr(Ord(ForceSync.Checked)));

  if FullScreenResolution.ItemIndex > 3 then
     begin
       UpdateSetting('Renderer', 'FullMode', '4');
       UpdateSetting('Renderer', 'FullScreenWidth', Copy(FullScreenResolution.Text, 1, Pos('x', FullScreenResolution.Text)-1));
       UpdateSetting('Renderer', 'FullScreenHeight', Copy(FullScreenResolution.Text, Pos('x', FullScreenResolution.Text)+1, Length(FullScreenResolution.Text)));
     end
  else
     UpdateSetting('Renderer', 'FullMode', IntToStr(FullScreenResolution.ItemIndex));

  UpdateSetting('Renderer', 'AutoMip', IntToStr(Ord(AutoMipMap.Checked)));
  UpdateSetting('Renderer', 'MeshTransparency', IntToStr(Ord(MeshTransparency.Checked)));

  UpdateSetting('Renderer', 'DrawCross', IntToStr(Ord(Crosshair.Checked)));
  UpdateSetting('Renderer', 'WideScreenWindow', IntToStr(WideScreenWindow.ItemIndex));

  UpdateSetting('Renderer', 'Sound', IntToStr(Ord(EnableSound.Checked)));
  if Frameskip.ItemIndex = 0 then
     UpdateSetting('Renderer', 'Frameskip', '-1')
  else
     UpdateSetting('Renderer', 'Frameskip', IntToStr(FrameSkip.ItemIndex-1));
  UpdateSetting('Renderer', 'AutoFull', IntToStr(Ord(AutoSwitchFullScreen.Checked)));

  UpdateSetting('Input', 'XInput', IntToStr(Ord(XInput.Checked)));
  UpdateSetting('Input', 'EnableFF', IntToStr(Ord(ForceFeedbackEnable.Checked)));
  UpdateSetting('Input', 'HoldGears', IntToStr(Ord(ReturnToNeutral.Checked)));

  UpdateSetting('Input', 'UseRawInput', IntToStr(Ord(UseRawInput.CheckBox.Checked)));
  UpdateSetting('Input', 'RawDevP1', IntToStr(RawDevicePlayer1.ItemIndex));
  UpdateSetting('Input', 'RawDevP2', IntToStr(RawDevicePlayer2.ItemIndex));

  {
  // force feedback settings
  // FE_CENTERING Effect (Spring centering effect)
  Model2MemIni.WriteString('Input', 'FE_CENTERING_Gain', Format('%1.1f', [FE_Centering_GlobalGain.Position]));
  Model2MemIni.WriteInteger('Input', 'FE_CENTERING_Coefficient', FE_Centering_Coefficient.Position);
  Model2MemIni.WriteInteger('Input', 'FE_CENTERING_Saturation', FE_Centering_Saturation.Position);
  Model2MemIni.WriteInteger('Input', 'FE_CENTERING_Deadband', FE_Centering_Deadband.Position);

  //FE_CLUTCH Effect (Friction, wheel turn hardness)
  Model2MemIni.WriteString('Input', 'FE_CLUTCH_Gain', Format('%1.1f', [FE_Clutch_GlobalGain.Position]));
  Model2MemIni.WriteInteger('Input', 'FE_CLUTCH_Coefficient', FE_Clutch_Coefficient.Position);

  //FE_LEFT,FE_RIGHT (Constant force in a direction)
  Model2MemIni.WriteString('Input', 'FE_LEFT_Gain', Format('%1.1f', [FE_Left_GlobalGain.Position]));
  Model2MemIni.WriteInteger('Input', 'FE_LEFT_Magnitude', FE_Left_Magnitude.Position);
  Model2MemIni.WriteString('Input', 'FE_RIGHT_Gain', Format('%1.1f', [FE_Right_GlobalGain.Position]));
  Model2MemIni.WriteInteger('Input', 'FE_RIGHT_Magnitude', FE_Right_Magnitude.Position);

  //FE_UNCENTERING (Sine force, wave the wheel, rumble)
  Model2MemIni.WriteString('Input', 'FE_UNCENTERING_Gain', Format('%1.1f', [FE_Uncentering_GlobalGain.Position]));
  Model2MemIni.WriteInteger('Input', 'FE_UNCENTERING_Magnitude', FE_Uncentering_Magnitude.Position);
  Model2MemIni.WriteInteger('Input', 'FE_UNCENTERING_Offset', FE_Uncentering_Offset.Position);
  Model2MemIni.WriteInteger('Input', 'FE_UNCENTERING_Phase', FE_Uncentering_Phase.Position);
  Model2MemIni.WriteInteger('Input', 'FE_UNCENTERING_Period', FE_Uncentering_Period.Position);
  }
//  Model2MemIni.UpdateFile;
//  FreeAndNil(Model2MemIni);
//end;}

{procedure TFormSEGAModel2EmulatorSettings.PopulateScreenResolution;
var
  ScreenResolutions: TStringList;
begin
  ScreenResolutions:= TStringList.Create;
  ListScreenModes(ScreenResolutions, True);
  ScreenResolutions.BeginUpdate;
  ScreenResolutions.CustomSort(CompareStringListNatural);
  ScreenResolutions.EndUpdate;
  FullScreenResolution.Items.AddStrings(ScreenResolutions);
  FullScreenResolution.Items.EndUpdate;
  FullScreenResolution.ItemIndex:= 0;
  FreeAndNil(ScreenResolutions);
end;}

procedure TFormSEGAModel2EmulatorSettings.FormShow(Sender: TObject);
begin
  FormMain.ELV_ResetNormalColors(FolderROMs);
  LabelGameTitle.Caption:= FormMain.GetArcadeGameSysTitle(Tag = 1, idSegaModel2, emuVersionStr);

  //LabelEmulatorVersion.Caption:= FormMain.EmulatorFile[idSegaModel2]+#13#10+LabelReadFileIni.Caption;
  LabelEmulatorVersion.Caption:= emuFileExec+#13#10+LabelReadFileIni.Caption;

  //if FormMain.EmulatorVersion[idSegaModel2] <> '' then
  //   LabelEmulatorVersion.Caption:= FormMain.EmulatorVersion[idSegaModel2]
  //else
  //   LabelEmulatorVersion.Caption:= '';

  if Tag = 0 then
     begin
       FormMain.IL_ArcadeSystem_ExtraLarge.GetIcon(idSegaModel2, SystemIcon.Picture.Icon);
       FormMain.LoadMessageIcon(GameIcon, 'info.ico');
       LabelGameStatus.Visible:= False;
       LabelReadFileIni.Visible:= False;
     end;

  PopulateScreenResolution(FullScreenResolution);
  ButtonReadFile.Click;
  Screen.Cursor:= crDefault;
end;

procedure TFormSEGAModel2EmulatorSettings.ButtonReadFileClick(
  Sender: TObject);
begin
  ReadEmulatorIniFile(emuIni);
  //if Tag = 1 then
  //   ReadEmulatorIniFile(GameIni);
end;

procedure TFormSEGAModel2EmulatorSettings.FolderROMButtonSelectClick(
  Sender: TObject);
begin
  if FolderROMs.Groups.Count < 10 then
     FormMain.DialogSelectMultiFolders(FolderROMs)
  else
     GenerateMessage('Info', 'Folders limit reached.', '    SEGA Model 2 emulator support a '+
                     'maximum of 10 ROMs folders. Please remove some before adding more folders.', 2);
end;

procedure TFormSEGAModel2EmulatorSettings.FolderROMsButtonEditClick(
  Sender: TObject);
begin
  FormMain.ELV_EnableEdit(FolderROMs);
end;

procedure TFormSEGAModel2EmulatorSettings.FolderROMsButtonDeleteClick(
  Sender: TObject);
begin
  FormMain.ELV_DeleteSelected(FolderROMs);
end;

procedure TFormSEGAModel2EmulatorSettings.FolderROMsButtonClearClick(
  Sender: TObject);
begin
  FormMain.ClearListView(FolderROMs);
end;

procedure TFormSEGAModel2EmulatorSettings.FolderROMsButtonSetActiveInactiveClick(
  Sender: TObject);
begin
  if FolderROMs.Selection.Count <> 1 then
     Exit;
  FolderROMs.SetFocus;
  if FolderROMs.Selection.First.Captions[1] = 'Active' then
     begin
       FolderROMs.Selection.First.Captions[1]:= 'Inactive';
       FolderROMsButtonSetActiveInactive.Caption:= 'Enable';
     end
  else
     begin
       FolderROMs.Selection.First.Captions[1]:= 'Active';
       FolderROMsButtonSetActiveInactive.Caption:= 'Disable';
     end;
end;

procedure TFormSEGAModel2EmulatorSettings.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  CanClose:= not FormMain.ELV_IsEditing(FolderROMs);
  if CanClose then
     begin
       if ModalResult = mrOk then
          begin
            case FormSEGAModel2EmulatorSettings.Tag of
              0: WriteEmulatorIniFile(emuIni); // default options
              1: WriteEmulatorIniFile(GameIni); // game options
            end;
          //WriteEmulatorIniFile(ReadFileIni.Caption);
          end;
       SetCurrentDir(FormMain.FrontendPath);
     end;
end;

procedure TFormSEGAModel2EmulatorSettings.FolderROMsItemPaintText(
  Sender: TCustomEasyListview; Item: TEasyItem; Position: Integer;
  ACanvas: TCanvas);
begin
  FormMain.ELV_ItemPaintText_General(Sender, Item, ACanvas);
  if SameText(Item.Captions[1], 'Inactive') then
     ACanvas.Font.Color:= clGray;
end;

procedure TFormSEGAModel2EmulatorSettings.FolderROMsKeyAction(
  Sender: TCustomEasyListview; var CharCode: Word; var Shift: TShiftState;
  var DoDefault: Boolean);
begin
  case CharCode of
    VK_DELETE: FolderROMsButtonDelete.Click;
    VK_F2: FolderROMsButtonEdit.Click;
  end;
end;

procedure TFormSEGAModel2EmulatorSettings.FolderROMsItemSelectionChanged(
  Sender: TCustomEasyListview; Item: TEasyItem);
begin
  if not Item.Selected then
     Exit;
  FolderROMsButtonSetActiveInactive.Enabled:= FolderROMs.Selection.Count = 1;
  if FolderROMsButtonSetActiveInactive.Enabled then
     begin
       case SameText(Item.Captions[1], 'Active') of
         True : FolderROMsButtonSetActiveInactive.Caption:= 'Disable';
         False: FolderROMsButtonSetActiveInactive.Caption:= 'Enable';
       end;
     end;
end;

procedure TFormSEGAModel2EmulatorSettings.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #27 then
     ButtonCancel.Click;
end;

procedure TFormSEGAModel2EmulatorSettings.FolderROMsItemEdited(
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

procedure TFormSEGAModel2EmulatorSettings.FolderROMsItemEditEnd(
  Sender: TCustomEasyListview; Item: TEasyItem);
begin
  FormMain.ELV_SetEditManager(FolderROMs, False);
end;

procedure TFormSEGAModel2EmulatorSettings.ButtonUpClick(Sender: TObject);
begin
  FormMain.ELV_MoveItem(FolderROMs, Boolean(TButton(Sender).Tag));
end;

end.

