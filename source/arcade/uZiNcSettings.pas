unit uZiNcSettings;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, GR32_RangeBars, ComCtrls,
  ExtCtrls, IniFiles, ToolWin, ImgList, MPCommonObjects,
  EasyListview, PanelEx, ShadowLabel, AdvGroupBox,
  AdvOfficeButtons;

type
  TFormZiNcSettings = class(TForm)
    TopBar: TPanelEx;
    GameIcon: TImage;
    LabelGameTitle: TShadowLabel;
    AudioBox: TAdvGroupBoxEx;
    AdvGroupBox3: TAdvGroupBoxEx;
    SoundFilter: TAdvOfficeCheckBoxEx;
    SoundStereoExciter: TAdvOfficeCheckBoxEx;
    SoundLiteSurround: TAdvOfficeCheckBoxEx;
    Label12: TLabel;
    SoundFilterCutoff: TComboBox;
    LabelSoundLiteSurroundMultiplier: TLabel;
    SoundLiteSurroundMultiplier: TGaugeBar;
    SlowGeometry: TAdvOfficeCheckBoxEx;
    MemoryPrediction: TAdvOfficeCheckBoxEx;
    StackInRAMHack: TAdvOfficeCheckBoxEx;
    Label10: TLabel;
    Rotate: TComboBox;
    NetGameServer: TAdvOfficeCheckBoxEx;
    LabelNetGameConnect: TLabel;
    NetGameConnect: TEdit;
    OpenGLD3DRendererBox: TAdvGroupBoxEx;
    LabelResolution: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    LabelFramerateManual: TLabel;
    LabelTurnDisplay: TLabel;
    Resolution: TComboBox;
    FullScreen: TAdvOfficeCheckBoxEx;
    ColorDepth: TComboBox;
    Scanlines: TComboBox;
    Blending: TComboBox;
    Dithering: TAdvOfficeCheckBoxEx;
    ShowFPS: TAdvOfficeCheckBoxEx;
    FrameLimitation: TAdvOfficeCheckBoxEx;
    FrameSkip: TAdvOfficeCheckBoxEx;
    FramerateDetection: TAdvOfficeCheckBoxEx;
    LabelEmulatorVersion: TShadowLabel;
    SystemIcon: TImage;
    ButtonReadFile: TBitBtn;
    LabelReadFileIni: TShadowLabel;
    ButtonOk: TBitBtn;
    ButtonCancel: TBitBtn;
    LabelControllerZNC: TLabel;
    ControllerZNC: TEdit;
    ControllerZNCButtonSelect: TBitBtn;
    LabelRendererZNC: TLabel;
    RendererZNC: TEdit;
    RendererZNCButtonSelect: TBitBtn;
    LabelControllerConfigFile: TLabel;
    ControllerConfigFile: TEdit;
    ControllerConfigFileButtonSelect: TBitBtn;
    LabelRendererConfigFile: TLabel;
    RendererConfigFile: TEdit;
    RendererConfigFileButtonSelect: TBitBtn;
    LabelROMsFolders: TLabel;
    FolderROMs: TEasyListview;
    ButtonUp: TBitBtn;
    ButtonDown: TBitBtn;
    FolderROMButtonSelect: TBitBtn;
    FolderROMsButtonEdit: TBitBtn;
    FolderROMsButtonDelete: TBitBtn;
    FolderROMsButtonClear: TBitBtn;
    LabelGameStatus: TShadowLabel;
    TurnDisplay: TComboBox;
    FramerateManual: TEdit;
    LabelFramerateManualRange: TLabel;
    EnableKeys: TAdvOfficeCheckBoxEx;
    LabelTextureSettings: TLabel;
    Label4: TLabel;
    TextureType: TComboBox;
    LabelTextureCache: TLabel;
    TextureCache: TComboBox;
    TextureFilter: TComboBox;
    LabelTextureFilter: TLabel;
    procedure ButtonReadFileClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SoundLiteSurroundMultiplierChange(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure RendererZNCChange(Sender: TObject);
    procedure ControllerZNCButtonSelectClick(Sender: TObject);
    procedure ControllerConfigFileButtonSelectClick(Sender: TObject);
    procedure RendererZNCButtonSelectClick(Sender: TObject);
    procedure RendererConfigFileButtonSelectClick(Sender: TObject);
    procedure FolderROMButtonSelectClick(Sender: TObject);
    procedure FolderROMsButtonEditClick(Sender: TObject);
    procedure FolderROMsButtonDeleteClick(Sender: TObject);
    procedure FolderROMsButtonClearClick(Sender: TObject);
    procedure FolderROMsItemEditEnd(Sender: TCustomEasyListview;
      Item: TEasyItem);
    procedure FolderROMsKeyAction(Sender: TCustomEasyListview;
      var CharCode: Word; var Shift: TShiftState; var DoDefault: Boolean);
    procedure FolderROMsItemEdited(Sender: TCustomEasyListview;
      Item: TEasyItem; var NewValue: Variant; var Accept: Boolean);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure ButtonUpClick(Sender: TObject);
    procedure FramerateManualKeyPress(Sender: TObject; var Key: Char);
    procedure ControllerZNCChange(Sender: TObject);
  private
    { Private declarations }
    procedure ReadZiNc_cfg(iniFile: String);
    procedure WriteZiNc_cfg(const customIniFile: String);
    procedure RemovePathFromFileName(EditHolder: TEdit);
  public
    emuIni,
    GameIni,
    emuFileExec,
    emuVersionStr: String;
    { Public declarations }
  end;

var
  FormZiNcSettings: TFormZiNcSettings;

implementation

uses uMain, uCommon;

{$R *.dfm}

procedure TFormZiNcSettings.ReadZiNc_cfg(iniFile: String);
var
  ZiNcFileCfg, tempList: THashedStringList;
  cmdString, tempStr, xResolution, yResolution: String;
  Loop, Position: Integer;
  elCFG: TMemIniFile;

  function FixValueString(StringValue: String): String;
  begin
    Position:= PosEx(';', StringValue);
    if Position <> 0 then
       Result:= Copy(StringValue, 1, Position-1);
    Result:= Trim(Result);
  end;

  procedure FillFileNames;
  begin
    FormMain.FixEmptyValue(RendererZNC, 'renderer.znc');
    FormMain.FixEmptyValue(RendererConfigFile, 'renderer.cfg');
    FormMain.FixEmptyValue(ControllerZNC, 'controller.znc');
  end;

begin
  try
    elCFG:= TMemIniFile.Create(FormMain.GetArcadeEmulatorsFile);
    cmdString:= elCFG.ReadString(FormMain.GetArcadeSystemIniSection(idZiNc), 'roms_path', 'roms');
  finally
     FreeAndNil(elCFG);
  end;
  if cmdString = '' then
     cmdString:= 'roms';
  FormMain.ClearListView(FolderROMs);
  FormMain.ExtractROMsFolders(cmdString, idZiNc, FolderROMs);

  if not FileExists(iniFile) then
     begin
       FillFileNames;
       Exit;
     end;
  Position:= 0;
  ZiNcFileCfg:= THashedStringList.Create;
  if FileExists(iniFile) then
     begin
       ZiNcFileCfg.LoadFromFile(iniFile);
       Position:= PosEx(' ', ZiNcFileCfg[0]);
     end;

  if Position <> 0 then
     begin
       // one line parameters
       tempList:= THashedStringList.Create;
       tempList.BeginUpdate;
       tempStr:= '';
       cmdString:= ZiNcFileCfg[0];
       for Loop:= 1 to Length(cmdString)+1 do
       begin
         if (Loop > Length(cmdString)) or (cmdString[Loop] = ' ') then
            begin
              tempList.Add(tempStr);
              tempStr:= '';
            end
         else
            tempStr:= tempStr+cmdString[Loop];
       end;
       tempList.EndUpdate;
       ZiNcFileCfg.BeginUpdate;
       ZiNcFileCfg.Clear;
       ZiNcFileCfg.AddStrings(tempList);
       ZiNcFileCfg.EndUpdate;
       FreeAndNil(tempList);
     end;

  for Loop:=0 to ZiNcFileCfg.Count-1 do
  begin
    if ZiNcFileCfg.Names[Loop] = '--use-sound' then
       AudioBox.CheckBox.Checked:= LowerCase(ZiNcFileCfg.ValueFromIndex[Loop]) = 'yes'
       //Sound.Checked:= LowerCase(ZiNcFileCfg.ValueFromIndex[Loop]) = 'yes'
    else
    if ZiNcFileCfg.Names[Loop] = '--renderer' then
       RendererZNC.Text:= ShortToLongPath(ZiNcFileCfg.ValueFromIndex[Loop])
    else
    if ZiNcFileCfg.Names[Loop] = '--use-renderer-cfg-file' then
       RendererConfigFile.Text:= ShortToLongPath(ZiNcFileCfg.ValueFromIndex[Loop])
    else
    if ZiNcFileCfg.Names[Loop] = '--rotate' then
       Rotate.ItemIndex:= StrToInt(ZiNcFileCfg.ValueFromIndex[Loop])
    else
    if ZiNcFileCfg.Names[Loop] = '--controller' then
       ControllerZNC.Text:= ShortToLongPath(ZiNcFileCfg.ValueFromIndex[Loop])
    else
    if ZiNcFileCfg.Names[Loop] = '--use-controller-cfg-file' then
       ControllerConfigFile.Text:= ShortToLongPath(ZiNcFileCfg.ValueFromIndex[Loop])
    else
    if ZiNcFileCfg.Names[Loop] = '--sound-filter-enable' then
       SoundFilter.Checked:= LowerCase(ZiNcFileCfg.ValueFromIndex[Loop]) = 'yes'
    else
    if ZiNcFileCfg.Names[Loop] = '--sound-filter-cutoff' then
       begin
         case StrToInt(ZiNcFileCfg.ValueFromIndex[Loop]) of
           11025: SoundFilterCutoff.ItemIndex:= 0;
           22050: SoundFilteRCutoff.ItemIndex:= 1;
           44100: SoundFilteRCutoff.ItemIndex:= 2;
           48000: SoundFilteRCutoff.ItemIndex:= 3;
         end;
       end
    else
    if ZiNcFileCfg.Names[Loop] = '--sound-surround-lite-enable' then
       SoundLiteSurround.Checked:= LowerCase(ZiNcFileCfg.ValueFromIndex[Loop]) = 'yes'
    else
    if ZiNcFileCfg.Names[Loop] = '--sound-surround_lite-multiplier' then
       SoundLiteSurroundMultiplier.Position:= StrToInt(ZiNcFileCfg.ValueFromIndex[Loop])
    else
    if ZiNcFileCfg.Names[Loop] = '--sound-stereo-exciter' then
       SoundStereoExciter.Checked:= LowerCase(ZiNcFileCfg.ValueFromIndex[Loop]) = 'yes'
    else
    if ZiNcFileCfg.Names[Loop] = '--use-slow-geometry' then
       SlowGeometry.Checked:= LowerCase(ZiNcFileCfg.ValueFromIndex[Loop]) = 'yes';
    NetGameServer.Checked:= (ZiNcFileCfg.Names[Loop] = '--netgame-server');
    //if ZiNcFileCfg.Names[Loop] = '--netgame-server' then
    //   NetGameServer.Checked:= LowerCase(ZiNcFileCfg.ValueFromIndex[Loop]) = 'yes';
    if ZiNcFileCfg.Names[Loop] = '--netgame-connect' then
       NetGameConnect.Text:= ZiNcFileCfg.ValueFromIndex[Loop];
    if ZiNcFileCfg.Names[Loop] = '--use-mem-predict' then
       MemoryPrediction.Checked:= LowerCase(ZiNcFileCfg.ValueFromIndex[Loop]) = 'yes';
    if ZiNcFileCfg.Names[Loop] = '--use-stackinram-hack' then
       StackInRAMHack.Checked:= LowerCase(ZiNcFileCfg.ValueFromIndex[Loop]) = 'yes';
  end;
  FillFileNames;
  if FormMain.ValidateFile(RendererConfigFile.Text) then
     begin
       ZiNcFileCfg.Clear;
       if PosEx(':', RendererConfigFile.Text) = 0 then
          ZiNcFileCfg.LoadFromFile(ExtractFilePath(FormMain.EmulatorFile[idZiNc])+RendererConfigFile.Text)
       else
          ZiNcFileCfg.LoadFromFile(RendererConfigFile.Text);

       for Loop:=0 to ZiNcFileCfg.Count-1 do
       begin
         if Trim(ZiNcFileCfg.Names[Loop]) = 'XSize' then
            xResolution:= FixValueString(ZiNcFileCfg.ValueFromIndex[Loop])
         else
         if Trim(ZiNcFileCfg.Names[Loop]) = 'YSize' then
            yResolution:= FixValueString(ZiNcFileCfg.ValueFromIndex[Loop])
         else
         if Trim(ZiNcFileCfg.Names[Loop]) = 'FullScreen' then
            FullScreen.Checked:= Boolean(StrToInt(FixValueString(ZiNcFileCfg.ValueFromIndex[Loop])))
         else
         if Trim(ZiNcFileCfg.Names[Loop]) = 'ColorDepth' then
            ColorDepth.ItemIndex:= Ord((FixValueString(ZiNcFileCfg.ValueFromIndex[Loop]) = '32'))
         else
         if Trim(ZiNcFileCfg.Names[Loop]) = 'ScanLines' then
            Scanlines.ItemIndex:= StrToInt(FixValueString(ZiNcFileCfg.ValueFromIndex[Loop]))
         else
         if Trim(ZiNcFileCfg.Names[Loop]) = 'Filtering' then
            TextureFilter.ItemIndex:= StrToInt(FixValueString(ZiNcFileCfg.ValueFromIndex[Loop]))
         else
         if Trim(ZiNcFileCfg.Names[Loop]) = 'Blending' then
            Blending.ItemIndex:= StrToInt(FixValueString(ZiNcFileCfg.ValueFromIndex[Loop]))
         else
         if Trim(ZiNcFileCfg.Names[Loop]) = 'Dithering' then
            Dithering.Checked:= Boolean(StrToInt(FixValueString(ZiNcFileCfg.ValueFromIndex[Loop])))
         else
         if Trim(ZiNcFileCfg.Names[Loop]) = 'ShowFPS' then
            ShowFPS.Checked:= Boolean(StrToInt(FixValueString(ZiNcFileCfg.ValueFromIndex[Loop])))
         else
         if Trim(ZiNcFileCfg.Names[Loop]) = 'FrameLimitation' then
            FrameLimitation.Checked:= Boolean(StrToInt(FixValueString(ZiNcFileCfg.ValueFromIndex[Loop])))
         else
         if Trim(ZiNcFileCfg.Names[Loop]) = 'FrameSkipping' then
            FrameSkip.Checked:= Boolean(StrToInt(FixValueString(ZiNcFileCfg.ValueFromIndex[Loop])))
         else
         if Trim(ZiNcFileCfg.Names[Loop]) = 'FramerateDetection' then
            FramerateDetection.Checked:= Boolean(StrToInt(FixValueString(ZiNcFileCfg.ValueFromIndex[Loop])))
         else
         if Trim(ZiNcFileCfg.Names[Loop]) = 'FramerateManual' then
            begin
              FramerateManual.Text:= FixValueString(ZiNcFileCfg.ValueFromIndex[Loop]);
              if FramerateManual.Text = '' then
                 FramerateManual.Text:= '100'
              else
                 begin
                   Position:= StrToInt(FramerateManual.Text);
                   if (Position < 0) or (Position > 1000) then
                      FramerateManual.Text:= '100';
                 end;
            end
         else
         if Trim(ZiNcFileCfg.Names[Loop]) = 'TextureType' then
            TextureType.ItemIndex:= StrToInt(FixValueString(ZiNcFileCfg.ValueFromIndex[Loop]))
         else
         if Trim(ZiNcFileCfg.Names[Loop]) = 'TextureCaching' then
            TextureCache.ItemIndex:= StrToInt(FixValueString(ZiNcFileCfg.ValueFromIndex[Loop]))
         else
         if Trim(ZiNcFileCfg.Names[Loop]) = 'TurnDisplay' then
            TurnDisplay.ItemIndex:= StrToInt(FixValueString(ZiNcFileCfg.ValueFromIndex[Loop]))
         else
         if Trim(ZiNcFileCfg.Names[Loop]) = 'EnableKeys' then
            EnableKeys.Checked:= Boolean(StrToInt(FixValueString(ZiNcFileCfg.ValueFromIndex[Loop])))
       end;
       if (xResolution <> '') and (yResolution <> '') then
          begin
            tempStr:= xResolution+'x'+yResolution;
            Resolution.ItemIndex:= Resolution.Items.IndexOf(tempStr);
            if Resolution.ItemIndex = -1 then
               Resolution.ItemIndex:= 2;
          end;
     end;
  FreeAndNil(ZiNcFileCfg);
end;

procedure TFormZiNcSettings.WriteZiNc_cfg(const customIniFile: String);
var
  ZiNcFileCfg: THashedStringList;
  elCFG: TMemIniFile;
  cmdString, xResolution, yResolution: String;
  Position: Integer;
  tempFileName: String;

  function WriteRendererLine(Entry, Value, Comment: String): String;
  begin
    Result:= Format('%-24s= %-6s; %s', [Entry, Value, Comment]);
  end;

  procedure AddSetting(SettingString: String);
  begin
    if cmdString = '' then
       cmdString:= SettingString
    else
       cmdString:= cmdString+' '+SettingString;
  end;

begin
  CheckAndCreateFolder(ExtractFilePath(customIniFile));
  ZiNcFileCfg:= THashedStringList.Create;
  ZiNcFileCfg.BeginUpdate;
  ZiNcFileCfg.Clear;
  cmdString:= '';
  if FormZiNcSettings.Tag = 0 then
     begin
        cmdString:= FormMain.MountFoldersListMAME(FolderROMs);
        if cmdString = '' then
           cmdString:= 'roms';
        try
          elCFG:= TMemIniFile.Create(FormMain.GetArcadeEmulatorsFile);
          elCFG.WriteString(FormMain.GetArcadeSystemIniSection(idZiNc), 'roms_path', cmdString);
          elCFG.UpdateFile;
        finally
          FreeAndNil(elCFG);
        end;
        cmdString:= '';
     end;

  if not AudioBox.CheckBox.Checked then // Sound.Checked then
     AddSetting('--use-sound=no');

  if (RendererZNC.Text <> '') and (LowerCase(RendererZNC.Text) <> 'renderer.znc') then
     AddSetting('--renderer='+GetShortFileNameW(RendererZNC.Text)); // ExtractShortPathName(RendererZNC.Text));
     //AddSetting('--renderer='+LongToShortPath(RendererZNC.Text));

  if (RendererConfigFile.Text <> '') and (LowerCase(RendererConfigFile.Text) <> 'renderer.cfg') then
     AddSetting('--use-renderer-cfg-file='+GetShortFileNameW(RendererConfigFile.Text)); // ExtractShortPathName(RendererConfigFile.Text));
     //AddSetting('--use-renderer-cfg-file='+LongToShortPath(RendererConfigFile.Text));

  if Rotate.ItemIndex > 0 then
     AddSetting('--rotate='+IntToStr(Rotate.ItemIndex));

  if (ControllerZNC.Text <> '') and (LowerCase(ControllerZNC.Text) <> 'controller.znc') then
     AddSetting('--controller='+GetShortFileNameW(ControllerZNC.Text)); // ExtractShortPathName(ControllerZNC.Text));
     //AddSetting('--controller='+LongToShortPath(ControllerZNC.Text));

  if ControllerConfigFile.Text <> '' then
     AddSetting('--use-controller-cfg-file='+GetShortFileNameW(ControllerConfigFile.Text)); //ExtractShortPathName(ControllerConfigFile.Text));
     //AddSetting('--use-controller-cfg-file='+LongToShortPath(ControllerConfigFile.Text));

  if SoundFilter.Checked then
     AddSetting('--sound-filter-enable=yes');

  if SoundFilteRCutoff.Text <> '22050 Hz' then
     AddSetting('--sound-filter-cutoff='+Copy(SoundFilteRCutoff.Text, 1, (PosEx(' ', SoundFilteRCutoff.Text)-1)));

  if SoundLiteSurround.Checked then
     AddSetting('--sound-surround-lite-enable=yes');

  if SoundLiteSurroundMultiplier.Position <> 40 then
     AddSetting('--sound-surround_lite-multiplier='+IntToStr(SoundLiteSurroundMultiplier.Position));

  if SoundStereoExciter.Checked then
     AddSetting('--sound-stereo-exciter=yes');

  if SlowGeometry.Checked then
     AddSetting('--use-slow-geometry=yes');

  if NetGameServer.Checked then
     AddSetting('--netgame-server');

  if NetGameConnect.Text <> '' then
     AddSetting('--netgame-connect='+NetGameConnect.Text);

  if MemoryPrediction.Checked then
     AddSetting('--use-mem-predict');

  if StackInRAMHack.Checked then
     AddSetting('--use-stackinram-hack');

  ZiNcFileCfg.Add(cmdString);
  ZiNcFileCfg.EndUpdate;
  try
    ZiNcFileCfg.SaveToFile(customIniFile);
  finally
  end;
  ZiNcFileCfg.Clear;

  ZiNcFileCfg.Add('; renderer settings');
  ZiNcFileCfg.Add('');
  Position:= PosEx('x', Resolution.Text);
  xResolution:= Copy(Resolution.Text, 1, Position-1);
  yResolution:= Copy(Resolution.Text, Position+1, Length(Resolution.Text)-Position);
  ZiNcFileCfg.Add(WriteRendererLine('XSize', xResolution, 'window/fullscreen X size'));
  ZiNcFileCfg.Add(WriteRendererLine('YSize', yResolution, 'window/fullscreen Y size'));
  ZiNcFileCfg.Add(WriteRendererLine('FullScreen', IntToStr(Ord(FullScreen.Checked)), 'Fullscreen mode: 0/1'));
  case ColorDepth.ItemIndex of
    0: ZiNcFileCfg.Add(WriteRendererLine('ColorDepth', '16', 'Fullscreen color depth: 16/32'));
    1: ZiNcFileCfg.Add(WriteRendererLine('ColorDepth', '32', 'Fullscreen color depth: 16/32'));
  end;
  ZiNcFileCfg.Add(WriteRendererLine('ScanLines', IntToStr(Scanlines.ItemIndex), 'Scannlines: 0=none, 1=black, 2=bright'));
  ZiNcFileCfg.Add(WriteRendererLine('Filtering', IntToStr(TextureFilter.ItemIndex), 'Texture filtering: 0-3'));
  ZiNcFileCfg.Add(WriteRendererLine('Blending', IntToStr(Blending.ItemIndex), 'Enhanced color blend: ogl: 0/1; D3D: 0-2'));
  ZiNcFileCfg.Add(WriteRendererLine('Dithering', IntToStr(Ord(Dithering.Checked)), 'Dithering: 0/1'));
  ZiNcFileCfg.Add(WriteRendererLine('ShowFPS', IntToStr(Ord(ShowFPS.Checked)), 'FPS display on startup: 0/1'));
  ZiNcFileCfg.Add(WriteRendererLine('FrameLimitation', IntToStr(Ord(FrameLimitation.Checked)), 'Frame limit: 0/1'));
  ZiNcFileCfg.Add(WriteRendererLine('FrameSkipping', IntToStr(Ord(FrameSkip.Checked)), 'Frame skip: 0/1'));
  ZiNcFileCfg.Add(WriteRendererLine('FramerateDetection', IntToStr(Ord(FramerateDetection.Checked)), 'Auto framerate detection: 0/1'));
  ZiNcFileCfg.Add(WriteRendererLine('FramerateManual', FramerateManual.Text, 'Manual framerate: 0-1000'));
  ZiNcFileCfg.Add(WriteRendererLine('TextureType', IntToStr(TextureType.ItemIndex), 'Textures: 0=default, 1=4 bit, 2=5bit, 3=8bit'));
  ZiNcFileCfg.Add(WriteRendererLine('TextureCaching', IntToStr(TextureCache.ItemIndex), 'Caching type: 0-2'));
  ZiNcFileCfg.Add(WriteRendererLine('TurnDisplay', IntToStr(TurnDisplay.ItemIndex), 'Turn the whole display (0-2, 0=default)'));
  ZiNcFileCfg.Add(WriteRendererLine('EnableKeys', IntToStr(Ord(EnableKeys.Checked)), 'Enable renderer keys: 0/1, def=1 (enables keys for the fps menu/pause)'));

  if PosEx(':', RendererConfigFile.Text) = 0 then
     tempFileName:= ExtractFilePath(FormMain.EmulatorFile[idZiNc])+RendererConfigFile.Text
  else
     tempFileName:= RendererConfigFile.Text;
  try
    ZiNcFileCfg.SaveToFile(tempFileName);
  finally
  end;

  if RendererConfigFile.Text <> '' then
     begin
       if PosEx(':', RendererConfigFile.Text) = 0 then
          tempFileName:= ExtractFilePath(FormMain.EmulatorFile[idZiNc])+RendererConfigFile.Text
       else
          tempFileName:= RendererConfigFile.Text;
       try
         ZiNcFileCfg.SaveToFile(tempFileName);
       finally
       end;
     end;
  FreeAndNil(ZiNcFileCfg);
end;

procedure TFormZiNcSettings.ButtonReadFileClick(Sender: TObject);
begin
  ReadZiNc_cfg(emuIni);
  if Tag = 1 then
     ReadZiNc_cfg(GameIni);
end;

procedure TFormZiNcSettings.FormShow(Sender: TObject);
begin
  FormMain.ELV_ResetNormalColors(FolderROMs);
  LabelGameTitle.Caption:= FormMain.GetArcadeGameSysTitle(Tag = 1, idZiNc, emuVersionStr);

  //if FormMain.EmulatorVersion[idZiNc] <> '' then
  //   LabelEmulatorVersion.Caption:= FormMain.EmulatorVersion[idZiNc]
  //else
  //   LabelEmulatorVersion.Caption:= '';

  if Tag = 0 then
     begin
       //LabelEmulatorVersion.Caption:= FormMain.EmulatorFile[idZiNc]+#13#10+LabelReadFileIni.Caption;
       LabelEmulatorVersion.Caption:= emuFileExec+#13#10+LabelReadFileIni.Caption;
       LabelReadFileIni.Visible:= False;
       TopBar.Color1:= $00c0cddc;
       FormMain.LoadIconIntoImage(FormMain.GetArcadeSystemIconFileName(idZiNc), SystemIcon);
       //FormMain.IL_ArcadeSystem_ExtraLarge.GetIcon(idZiNc, SystemIcon.Picture.Icon);
       FormMain.LoadMessageIcon(GameIcon, 'info.ico');
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
       LabelROMsFolders.Enabled:= False;
       FolderROMs.Enabled:= False;
       FolderROMs.Font.Color:= clSilver;
       ButtonUp.Enabled:= False;
       ButtonDown.Enabled:= False;
       FolderROMButtonSelect.Enabled:= False;
       FolderROMsButtonEdit.Enabled:= False;
       FolderROMsButtonDelete.Enabled:= False;
       FolderROMsButtonClear.Enabled:= False;

       FormMain.LoadGameIconIntoImage(FormMain.MemGameInfo.eSystemID, FormMain.MemGameInfo.eCustomSystemID, FormMain.MemGameInfo.eROMIdentification, SystemIcon, FormMain.MemGameInfo.eSoftwareName, FormMain.MemGameInfo.eIsCustomGame);
       //FormMain.IL_StandardIconsExtraLarge.GetIcon(FormMain.MemGameInfo.eROMIdentification, SystemIcon.Picture.Icon);
       FormMain.IL_ArcadeSystem_Small.GetIcon(FormMain.MemGameInfo.eSystemID, GameIcon.Picture.Icon);

       case FormMain.MemGameInfo.eGameSetStatus of
         0: TopBar.Color1:= $00f0fae5; // green
         1: TopBar.Color1:= $00e5f0fa; // red (based on green)
         2: TopBar.Color1:= $00eeeeee; // silver (base on green)
       end;
     end;
  OpenGLD3DRendererBox.DoubleBuffered:= True;
  AudioBox.DoubleBuffered:= True;
  PopulateScreenResolution(Resolution);
  ButtonReadFile.Click;
  Screen.Cursor:= crDefault;
end;

procedure TFormZiNcSettings.SoundLiteSurroundMultiplierChange(
  Sender: TObject);
begin
  LabelSoundLiteSurroundMultiplier.Caption:= IntToStr(SoundLiteSurroundMultiplier.Position);
end;

procedure TFormZiNcSettings.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  CanClose:= not FormMain.ELV_IsEditing(FolderROMs);
  if CanClose then
     begin
       if ModalResult = mrOk then
          begin
            case FormZiNcSettings.Tag of
              0: WriteZiNc_cfg(emuIni); // default options
              1: WriteZiNc_cfg(GameIni); // game options
            end;
          end;
       SetCurrentDir(FormMain.FrontendPath);
     end;
end;

procedure TFormZiNcSettings.ControllerZNCChange(Sender: TObject);
//var
//  iFolder: String;
begin
// disabled for now!!!!! March 14, 2016
//  iFolder:= FormMain.FullFolderFix(ControllerZNC.Text, FormMain.EmulatorFile[idZiNc]);
//  case FileExists(iFolder) of
//    True : LabelControllerZNC.Caption:= 'Controller ['+GetFileInfo2(iFolder, VersionInfo[2])+']';
//    False: LabelControllerZNC.Caption:= 'Controller';
//  end;
end;

procedure TFormZiNcSettings.RemovePathFromFileName(EditHolder: TEdit);
var
  iEmuPath, iFilePath: String;
begin
  if EditHolder.Text = '' then
     Exit;

  iFilePath:= ExtractFilePath(EditHolder.Text);
  if iFilePath = '' then
     Exit;

  iEmuPath:= ExtractFilePath(emuFileExec);
  if SameText(iFilePath, iEmuPath) then
     EditHolder.Text:= ExtractFileName(EditHolder.Text);
end;

procedure TFormZiNcSettings.RendererZNCChange(Sender: TObject);
begin
// disabled for now!!!!! March 14, 2016
//  case FileExists(RendererZNC.Text) of
//    True : LabelRendererZNC.Caption:= 'Renderer ['+GetFileInfo2(RendererZNC.Text, VersionInfo[2])+']';
//    False: LabelRendererZNC.Caption:= 'Renderer';
//  end;
end;

procedure TFormZiNcSettings.ControllerZNCButtonSelectClick(
  Sender: TObject);
begin
  FormMain.DialogOpenFile(9, 'Select a controller plugin', ControllerZNC, False);
  RemovePathFromFileName(ControllerZNC);
end;

procedure TFormZiNcSettings.ControllerConfigFileButtonSelectClick(
  Sender: TObject);
begin
  FormMain.DialogOpenFile(10, 'Select a controller config file', ControllerConfigFile, False);
  RemovePathFromFileName(ControllerConfigFile);
end;

procedure TFormZiNcSettings.RendererZNCButtonSelectClick(Sender: TObject);
begin
  FormMain.DialogOpenFile(9, 'Select a video renderer plugin', RendererZNC, False);
  RemovePathFromFileName(RendererZNC);
end;

procedure TFormZiNcSettings.RendererConfigFileButtonSelectClick(
  Sender: TObject);
begin
  FormMain.DialogOpenFile(10, 'Select a video renderer config file', RendererConfigFile, False);
  RemovePathFromFileName(RendererConfigFile);
end;

procedure TFormZiNcSettings.FolderROMButtonSelectClick(Sender: TObject);
begin
  FormMain.DialogSelectMultiFolders(FolderROMs);
end;

procedure TFormZiNcSettings.FolderROMsButtonEditClick(Sender: TObject);
begin
  FormMain.ELV_EnableEdit(FolderROMs);
end;

procedure TFormZiNcSettings.FolderROMsButtonDeleteClick(Sender: TObject);
begin
  FormMain.ELV_DeleteSelected(FolderROMs);
end;

procedure TFormZiNcSettings.FolderROMsButtonClearClick(Sender: TObject);
begin
  FormMain.ClearListView(FolderROMs);
end;

procedure TFormZiNcSettings.FolderROMsItemEditEnd(
  Sender: TCustomEasyListview; Item: TEasyItem);
begin
  FormMain.ELV_SetEditManager(FolderROMs, False);
end;

procedure TFormZiNcSettings.FolderROMsKeyAction(
  Sender: TCustomEasyListview; var CharCode: Word; var Shift: TShiftState;
  var DoDefault: Boolean);
begin
  case CharCode of
    VK_DELETE: FolderROMsButtonDelete.Click;
    VK_F2: FolderROMsButtonEdit.Click;
  end;
end;

procedure TFormZiNcSettings.FolderROMsItemEdited(
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

procedure TFormZiNcSettings.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #27 then
     ButtonCancel.Click;
end;

procedure TFormZiNcSettings.ButtonUpClick(Sender: TObject);
begin
  FormMain.ELV_MoveItem(FolderROMs, Boolean(TBitBtn(Sender).Tag));
end;

procedure TFormZiNcSettings.FramerateManualKeyPress(Sender: TObject;
  var Key: Char);
begin
  if not (Key in ['0'..'9', Chr(VK_BACK)]) then
     Key:= Char(0);
end;


end.
