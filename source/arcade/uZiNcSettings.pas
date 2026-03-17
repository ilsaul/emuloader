unit uZiNcSettings;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, GR32_RangeBars, ComCtrls,
  ExtCtrls, IniFiles, ToolWin, ImgList, MPCommonObjects,
  EasyListview, PanelEx, ShadowLabel, AdvGroupBox,
  AdvOfficeButtons, ButtonsEx, EditEx, ColorBoxEx;

type
  TFormZiNcSettings = class(TForm)
    TopBar: TPanelEx;
    GameIcon: TImage;
    LabelGameTitle: TShadowLabel;
    LabelEmulatorVersion: TShadowLabel;
    SystemIcon: TImage;
    ButtonReadFile: TBitBtnEx;
    LabelReadFileIni: TShadowLabel;
    ButtonOk: TBitBtnEx;
    ButtonCancel: TBitBtnEx;
    LabelGameStatus: TShadowLabel;
    FolderROMsGroupBox: TPanelEx;
    FolderROMsGroupBoxLabel: TShadowLabel;
    ControllerZNCGroupBox: TPanelEx;
    ControllerZNCGroupBoxLabel: TShadowLabel;
    FolderROMs: TEasyListview;
    FolderROMsButtonUp: TBitBtnEx;
    FolderROMsButtonDown: TBitBtnEx;
    FolderROMsButtonSelect: TBitBtnEx;
    FolderROMsButtonEdit: TBitBtnEx;
    FolderROMsButtonDelete: TBitBtnEx;
    FolderROMsButtonClear: TBitBtnEx;
    AudioGroupBox: TPanelEx;
    AudioGroupBoxLabel: TShadowLabel;
    ControllerZNCButtonSelect: TBitBtnEx;
    ControllerZNC: TEditEx;
    ControllerConfigFileGroupBox: TPanelEx;
    ControllerConfigFileGroupBoxLabel: TShadowLabel;
    ControllerConfigFileButtonSelect: TBitBtnEx;
    ControllerConfigFile: TEditEx;
    RendererZNCGroupBox: TPanelEx;
    RendererZNCGroupBoxLabel: TShadowLabel;
    RendererZNCButtonSelect: TBitBtnEx;
    RendererZNC: TEditEx;
    RendererConfigFileGroupBox: TPanelEx;
    RendererConfigFileGroupBoxLabel: TShadowLabel;
    RendererConfigFileButtonSelect: TBitBtnEx;
    RendererConfigFile: TEditEx;
    OpenGLD3DRendererGroupBox: TPanelEx;
    OpenGLD3DRendererGroupBoxLabel: TShadowLabel;
    ResolutionLabel: TShadowLabel;
    ColorDepthLabel: TShadowLabel;
    ScanLinesLabel: TShadowLabel;
    BlendingLabel: TShadowLabel;
    FramerateManualLabel: TShadowLabel;
    TurnDisplayLabel: TShadowLabel;
    TextureSettingsLabel: TShadowLabel;
    TextureTypeLabel: TShadowLabel;
    TextureCacheLabel: TShadowLabel;
    TextureFilterLabel: TShadowLabel;
    Resolution: TComboBox2Ex;
    FullScreen: TAdvOfficeCheckBoxEx;
    ColorDepth: TComboBox2Ex;
    Scanlines: TComboBox2Ex;
    Blending: TComboBox2Ex;
    Dithering: TAdvOfficeCheckBoxEx;
    ShowFPS: TAdvOfficeCheckBoxEx;
    FrameLimitation: TAdvOfficeCheckBoxEx;
    FrameSkip: TAdvOfficeCheckBoxEx;
    FramerateDetection: TAdvOfficeCheckBoxEx;
    TurnDisplay: TComboBox2Ex;
    EnableKeys: TAdvOfficeCheckBoxEx;
    TextureType: TComboBox2Ex;
    TextureCache: TComboBox2Ex;
    TextureFilter: TComboBox2Ex;
    FramerateManual: TGaugeBar;
    VideoGroupBox: TPanelEx;
    VideoGroupBoxLabel: TShadowLabel;
    RotateLabel: TShadowLabel;
    NetGameConnectLabel: TShadowLabel;
    SlowGeometry: TAdvOfficeCheckBoxEx;
    MemoryPrediction: TAdvOfficeCheckBoxEx;
    StackInRAMHack: TAdvOfficeCheckBoxEx;
    Rotate: TComboBox2Ex;
    NetGameServer: TAdvOfficeCheckBoxEx;
    NetGameConnect: TEditEx;
    SoundFilterCutoffLabel: TShadowLabel;
    LabelSoundLiteSurroundMultiplier: TShadowLabel;
    SoundFilter: TAdvOfficeCheckBoxEx;
    SoundStereoExciter: TAdvOfficeCheckBoxEx;
    SoundLiteSurround: TAdvOfficeCheckBoxEx;
    SoundFilterCutoff: TComboBox2Ex;
    SoundLiteSurroundMultiplier: TGaugeBar;
    SoundEnableSound: TAdvOfficeCheckBoxEx;
    procedure ButtonReadFileClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SoundLiteSurroundMultiplierChange(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure RendererZNCChange(Sender: TObject);
    procedure ControllerZNCButtonSelectClick(Sender: TObject);
    procedure ControllerConfigFileButtonSelectClick(Sender: TObject);
    procedure RendererZNCButtonSelectClick(Sender: TObject);
    procedure RendererConfigFileButtonSelectClick(Sender: TObject);
    procedure FolderROMsButtonSelectClick(Sender: TObject);
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
    procedure FolderROMsButtonUpClick(Sender: TObject);
    procedure ControllerZNCChange(Sender: TObject);
    procedure FolderROMsItemPaintText(Sender: TCustomEasyListview;
      Item: TEasyItem; Position: Integer; ACanvas: TCanvas);
    procedure FramerateManualChange(Sender: TObject);
  private
    { Private declarations }
    procedure ReadZiNc_cfg(iniFile: String);
    procedure WriteZiNc_cfg(const customIniFile: String);
    procedure RemovePathFromFileName(EditHolder: TEditEx);
    procedure Resize4K;
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

procedure TFormZiNcSettings.Resize4K;
var
  iTopValue: Integer;

  function GetTopPos(iPos: Integer): Integer;
  begin
    if iPos = -1 then
       Result:= iTopValue
    else
       Result:= iPos;
  end;

  function MoveCheckBox(iCheckBox: TAdvOfficeCheckBoxEx; iTop: Integer = -1; iLeft: Integer = 10;  iWidth: Integer = 287): Boolean;
  begin
    Result:= True;
    iTopValue:= GetTopPos(iTop);
    FormMain.Set4KCheckBoxSpecs(iCheckBox, iLeft, iTopValue, iWidth, 36, 16);
    iTopValue:= iTopValue+47;
  end;

  function MoveGaugeBar(iGaugeBar: TGaugeBar;  iLabelTitle: TShadowLabel; iTop: Integer = -1; iLeft: Integer = 10; iWidth: Integer = 287): Boolean;
  begin
    Result:= True;
    iTopValue:= GetTopPos(iTop);
    if iLabelTitle <> nil then
       FormMain.Set4KLabelSpecs(iLabelTitle, iLeft, iTopValue, iWidth, 31, 16);

    FormMain.Set4KGaugeBarSpecs(iGaugeBar, iLeft, iTopValue+36, iWidth, 36);
    iTopValue:= iTopValue+82;
  end;

  function MoveEdit(iEdit: TEditEx; iLabelTitle: TShadowLabel; iButton: TBitBtnEx = nil; iTop: Integer = -1; iLeft: Integer = 10; iWidth: Integer = 287): Boolean;
  var
    iSize: Integer;
  begin
    Result:= True;
    iTopValue:= GetTopPos(iTop);
    if iLabelTitle <> nil then
       FormMain.Set4KLabelSpecs(iLabelTitle, iLeft, iTopValue, -1, -1, 16);
    iSize:= iWidth;
    if iButton <> nil then
       iSize:= iSize-70-5;

    FormMain.Set4KEditSpecs(iEdit, iLeft, iTopValue+36, iSize, 36, 16);
    if iButton <> nil then
       FormMain.Set4KButtonSpecs(iButton, iLeft+iSize+5, iTopValue+36, 70, 36, 16);
    iTopValue:= iTopValue+82;
  end;

  function MoveComboBox(iComboBox: TComboBox2Ex; iLabelTitle: TShadowLabel; iTop: Integer = -1; iLeft: Integer = 10; iWidth: Integer = 587): Boolean;
  begin
    Result:= True;
    iTopValue:= GetTopPos(iTop);
    if iLabelTitle <> nil then
       FormMain.Set4KLabelSpecs(iLabelTitle, iLeft, iTopValue, -1, -1, 16);
    FormMain.Set4KComboBoxSpecs(iComboBox, iLeft, iTopValue+36, iWidth, 16);
    iTopValue:= iTopValue+82;
  end;
  
begin
  if not Is4KMode then
     Exit;

  with FormZiNcSettings do
  begin
    ClientWidth:=  1677;
    ClientHeight:= 1206;
    Font.Size:= 16;

    FormMain.Set4KEmuGameTopPanel(TopBar, SystemIcon, GameIcon, LabelGameTitle, 1515, LabelEmulatorVersion, 1245, LabelGameStatus, 1460);

    // Path to ROM Sets
    FormMain.Set4KBoxLabel(FolderROMsGroupBox, FolderROMsGroupBoxLabel, 16, 160, 329, 1645);
    FormMain.Set4KListViewSpecs(FolderROMs, 10, 45, 1538, 272, 16);
    FolderROMs.CellSizes.Report.Height:= 32;

    FormMain.Set4KButtonSpecs(FolderROMsButtonUp    , FolderROMsGroupBox.Width-12-75, 45,                     75, 36, 16);
    FormMain.Set4KButtonSpecs(FolderROMsButtonDown  , FolderROMsButtonUp.Left, FolderROMsButtonUp.Top+41,     75, 36, 16);
    FormMain.Set4KButtonSpecs(FolderROMsButtonSelect, FolderROMsButtonUp.Left, 158,                           75, 36, 16);
    FormMain.Set4KButtonSpecs(FolderROMsButtonEdit  , FolderROMsButtonUp.Left, FolderROMsButtonSelect.Top+41, 75, 36, 16);
    FormMain.Set4KButtonSpecs(FolderROMsButtonDelete, FolderROMsButtonUp.Left, FolderROMsButtonEdit.Top+41,   75, 36, 16);
    FormMain.Set4KButtonSpecs(FolderROMsButtonClear , FolderROMsButtonUp.Left, FolderROMsButtonDelete.Top+41, 75, 36, 16);

    // Controller [.znc file]
    FormMain.Set4KBoxLabel(ControllerZNCGroupBox, ControllerZNCGroupBoxLabel, 16, 514, 93, 643);
    MoveEdit(ControllerZNC, nil, ControllerZNCButtonSelect, 45-36, 10, 621);

    // Controller Config [.cfg file]
    FormMain.Set4KBoxLabel(ControllerConfigFileGroupBox, ControllerConfigFileGroupBoxLabel, 684, 514, 93, 643);
    MoveEdit(ControllerConfigFile, nil, ControllerConfigFileButtonSelect, 45-36, 10, 621);

    // Renderer [.znc file]
    FormMain.Set4KBoxLabel(RendererZNCGroupBox, RendererZNCGroupBoxLabel, 16, 632, 93, 643);
    MoveEdit(RendererZNC, nil, RendererZNCButtonSelect, 45-36, 10, 621);

    // Renderer Config [.cfg file]
    FormMain.Set4KBoxLabel(RendererConfigFileGroupBox, RendererConfigFileGroupBoxLabel, 684, 632, 93, 643);
    MoveEdit(RendererConfigFile, nil, RendererConfigFileButtonSelect, 45-36, 10, 621);

    // OpenGL / Direct3D Renderer
    FormMain.Set4KBoxLabel(OpenGLD3DRendererGroupBox, OpenGLD3DRendererGroupBoxLabel, 16, 750, 375, 977);

    MoveComboBox(Resolution, ResolutionLabel, 45, 10, 187);
    MoveComboBox(ColorDepth, ColorDepthLabel, -1, 10, 187);
    MoveComboBox(Scanlines,  ScanlinesLabel,  -1, 10, 187);
    MoveGaugeBar(FramerateManual, FramerateManualLabel, -1, 10, OpenGLD3DRendererGroupBox.Width-22);

    MoveComboBox(Blending, BlendingLabel, 45, 222, 221);

    FormMain.Set4KLabelSpecs(TextureSettingsLabel, 559, 45, -1, -1, 16);
    FormMain.Set4KLabelSpecs(TextureTypeLabel, 559, 83, -1, -1, 16);
    MoveComboBox(TextureType,   nil, 81-36, 610, 90);
    FormMain.Set4KLabelSpecs(TextureCacheLabel, 717, 83, -1, -1, 16);
    MoveComboBox(TextureCache,  nil, 81-36, 779, 60);
    FormMain.Set4KLabelSpecs(TextureFilterLabel, 854, 83, -1, -1, 16);
    MoveComboBox(TextureFilter, nil, 81-36, 905, 60);

    MoveCheckBox(Dithering, 128, 222, 195);
    MoveCheckBox(FullScreen, -1, 222, 135);

    MoveCheckBox(ShowFPS   , 128, 511, 140);
    MoveCheckBox(FrameSkip ,  -1, 511, 140);
    MoveCheckBox(EnableKeys,  -1, 511, 235);

    MoveCheckBox(FramerateDetection, 128, 751, 220);
    MoveCheckBox(FrameLimitation   ,  -1, 751, 190);

    FormMain.Set4KLabelSpecs(TurnDisplayLabel, 222, 247, -1, -1, 16);
    MoveComboBox(TurnDisplay, nil, 245-36, 383, 60);

    // Video
    FormMain.Set4KBoxLabel(VideoGroupBox, VideoGroupBoxLabel, 1018, 750, 375, 309);
    MoveCheckBox(SlowGeometry, 44);
    MoveCheckBox(MemoryPrediction);
    MoveCheckBox(StackInRAMHack);

    FormMain.Set4KLabelSpecs(RotateLabel, 10, 187, -1, -1, 16);
    MoveComboBox(Rotate, nil, 185-36, 75, 222);
    MoveCheckBox(NetGameServer, 244, 10, 195);
    MoveEdit(NetGameConnect, NetGameConnectLabel, nil, -1, 10, 287);

    // Audio
    FormMain.Set4KBoxLabel(AudioGroupBox, AudioGroupBoxLabel, 1352, 514, 354, 309);
    MoveCheckBox(SoundEnableSound, 44);
    MoveCheckBox(SoundStereoExciter);
    MoveCheckBox(SoundLiteSurround);
    MoveGaugeBar(SoundLiteSurroundMultiplier, nil, 185-36, 10, 250);
    FormMain.Set4KLabelSpecs(LabelSoundLiteSurroundMultiplier, 266, 187, 40, 31, 16);
    MoveCheckBox(SoundFilter);
    FormMain.Set4KLabelSpecs(SoundFilterCutoffLabel, 37, 270, -1, -1, 16);
    MoveComboBox(SoundFilterCutoff, nil, 306-36, 37, 260);

    FormMain.Set4KButtonSpecs(ButtonReadFile, 16, ClientHeight-16-45, 168, 45, 16);
    FormMain.Set4KButtonSpecs(ButtonCancel, ClientWidth-16-168,   ButtonReadFile.Top, 168, 45, 16);
    FormMain.Set4KButtonSpecs(ButtonOk, ButtonCancel.Left-10-168, ButtonReadFile.Top, 168, 45, 16);
    FormMain.Set4KLabelSpecs(LabelReadFileIni, 200, ButtonReadFile.Top+7, 1100, 31, 16);




  end;
end;

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
       SoundEnableSound.Checked:= LowerCase(ZiNcFileCfg.ValueFromIndex[Loop]) = 'yes'
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
              tempStr:= FixValueString(ZiNcFileCfg.ValueFromIndex[Loop]);
              if tempStr = '' then
                 tempStr:= '100'
              else
                 begin
                   Position:= StrToInt(tempStr);
                   if (Position < 0) or (Position > 1000) then
                      tempStr:= '100';
                 end;
              FramerateManual.Position:= StrToInt(tempstr);
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

  if not SoundEnableSound.Checked then // Sound.Checked then
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
  ZiNcFileCfg.Add(WriteRendererLine('ScanLines',          IntToStr(Scanlines.ItemIndex),             'Scannlines: 0=none, 1=black, 2=bright'));
  ZiNcFileCfg.Add(WriteRendererLine('Filtering',          IntToStr(TextureFilter.ItemIndex),         'Texture filtering: 0-3'));
  ZiNcFileCfg.Add(WriteRendererLine('Blending',           IntToStr(Blending.ItemIndex),              'Enhanced color blend: ogl: 0/1; D3D: 0-2'));
  ZiNcFileCfg.Add(WriteRendererLine('Dithering',          IntToStr(Ord(Dithering.Checked)),          'Dithering: 0/1'));
  ZiNcFileCfg.Add(WriteRendererLine('ShowFPS',            IntToStr(Ord(ShowFPS.Checked)),            'FPS display on startup: 0/1'));
  ZiNcFileCfg.Add(WriteRendererLine('FrameLimitation',    IntToStr(Ord(FrameLimitation.Checked)),    'Frame limit: 0/1'));
  ZiNcFileCfg.Add(WriteRendererLine('FrameSkipping',      IntToStr(Ord(FrameSkip.Checked)),          'Frame skip: 0/1'));
  ZiNcFileCfg.Add(WriteRendererLine('FramerateDetection', IntToStr(Ord(FramerateDetection.Checked)), 'Auto framerate detection: 0/1'));
  ZiNcFileCfg.Add(WriteRendererLine('FramerateManual',    IntToStr(FramerateManual.Position),        'Manual framerate: 0-1000'));
  ZiNcFileCfg.Add(WriteRendererLine('TextureType',        IntToStr(TextureType.ItemIndex),           'Textures: 0=default, 1=4 bit, 2=5bit, 3=8bit'));
  ZiNcFileCfg.Add(WriteRendererLine('TextureCaching',     IntToStr(TextureCache.ItemIndex),          'Caching type: 0-2'));
  ZiNcFileCfg.Add(WriteRendererLine('TurnDisplay',        IntToStr(TurnDisplay.ItemIndex),           'Turn the whole display (0-2, 0=default)'));
  ZiNcFileCfg.Add(WriteRendererLine('EnableKeys',         IntToStr(Ord(EnableKeys.Checked)),         'Enable renderer keys: 0/1, def=1 (enables keys for the fps menu/pause)'));

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
var
  Loop: Integer;
  iStr: String;
begin
  Resize4K;
  FormMain.ELV_ResetNormalColors(FolderROMs);
  if IsNightMode then
  begin
    for Loop:= 0 to FormZiNcSettings.ComponentCount-1 do
    begin
      if FormZiNcSettings.Components[Loop] is TPanelEx then
      begin
        iStr:= TPanelEx(FormZiNcSettings.Components[Loop]).Name;
        if PosEx('GroupBox', iStr) <> 0 then
           begin
             SetPanelColors(TPanelEx(FormZiNcSettings.Components[Loop]), clrMedDarkGray, -1, True);
             SetPanelBorderColors(TPanelEx(FormZiNcSettings.Components[Loop]), clrLightGrayFrame, clrBorderGroupBoxGrayBk);
           end;
      end
      else
      if FormZiNcSettings.Components[Loop] is TBitBtnEx then
         FormMain.SetButtonExColors(TBitBtnEx(FormZiNcSettings.Components[Loop]))
      else
      if FormZiNcSettings.Components[Loop] is TEditEx then
         SetEditNightColors(TEditEx(FormZiNcSettings.Components[Loop]))
      else
      if FormZiNcSettings.Components[Loop] is TComboBox2Ex then
         SetComboBox2ExColors(TComboBox2Ex(FormZiNcSettings.Components[Loop]), True)
      else
      if FormZiNcSettings.Components[Loop] is TGaugeBar then
         SetGaugeBarColors(TGaugeBar(FormZiNcSettings.Components[Loop]))
      else
      if FormZiNcSettings.Components[Loop] is TAdvOfficeCheckBoxEx then
         begin
           SetCheckBoxColors(TAdvOfficeCheckBoxEx(FormZiNcSettings.Components[Loop]), item_caption_active_color[1], item_caption_active_shadow_color[1]);
           TAdvOfficeCheckBoxEx(FormZiNcSettings.Components[Loop]).DisabledFontColor:= clGray;
           TAdvOfficeCheckBoxEx(FormZiNcSettings.Components[Loop]).DisabledFontShadowColor:= clrMedDarkGray;
           FormMain.SetCheckBoxExCustomIcon(TAdvOfficeCheckBoxEx(FormZiNcSettings.Components[Loop]));
         end;
      if FormZiNcSettings.Components[Loop] is TShadowLabel then
         begin
           iStr:= TPanelEx(FormZiNcSettings.Components[Loop]).Name;
           if PosEx('GroupBoxLabel', iStr) <> 0 then
           begin
             SetLabelBkFrameColors(TShadowLabel(FormZiNcSettings.Components[Loop]), clrBorderGroupBoxGrayBk, $00404040, clBlack);
             SetLabelColors(TShadowLabel(FormZiNcSettings.Components[Loop]), clCream);
           end
           else
           begin
             SetLabelColors(TShadowLabel(FormZiNcSettings.Components[Loop]), item_caption_active_color[1], item_caption_active_shadow_color[1]);
             if not TShadowLabel(FormZiNcSettings.Components[Loop]).Transparent then
                    TShadowLabel(FormZiNcSettings.Components[Loop]).Color:= clrMedDarkGray;
           end;
         end
    end;
    SetFormColors(FormZiNcSettings, nil, nil, LabelGameTitle, LabelEmulatorVersion, LabelGameStatus, -1, IsNightMode);
    SetColorEmulatorTopBar(TopBar, idZiNc, True);
    FormMain.SetEasyListViewColors(FolderROMs, FormZiNcSettings.Color, clWhite, -1, clGray);
    FormMain.ELV_SetEditBkColor(FolderROMs);
    FormMain.ELV_SetRibbonNightColors(0, FolderROMs, True);
    FormMain.SetWin10DarkScrollBar(FolderROMs);
  end;

  LabelGameTitle.Caption:= FormMain.GetArcadeGameSysTitle(Tag = 1, idZiNc, emuVersionStr);

  if Tag = 0 then
     begin
       //LabelEmulatorVersion.Caption:= FormMain.EmulatorFile[idZiNc]+#13#10+LabelReadFileIni.Caption;
       LabelEmulatorVersion.Caption:= emuFileExec+#13#10+LabelReadFileIni.Caption;
       LabelReadFileIni.Visible:= False;
       SetColorEmulatorTopBar(TopBar, idZiNc, True); // TopBar.Color1:= $00c0cddc;
       FormMain.LoadSystemIcon(idZiNc, SystemIcon, False);
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
       FolderROMsGroupBox.Enabled:= False;
       FolderROMs.Enabled:= False;
       //FolderROMs.Font.Color:= clSilver;
       FolderROMsButtonUp.Enabled:= False;
       FolderROMsButtonDown.Enabled:= False;
       FolderROMsButtonSelect.Enabled:= False;
       FolderROMsButtonEdit.Enabled:= False;
       FolderROMsButtonDelete.Enabled:= False;
       FolderROMsButtonClear.Enabled:= False;

       FormMain.LoadSystemROMIdIcon(FormMain.MemGameInfo.eSystemID, FormMain.MemGameInfo.eCustomSystemID, FormMain.MemGameInfo.eROMIdentification, SystemIcon, FormMain.MemGameInfo.eSoftwareName, FormMain.MemGameInfo.eGameSetStatus, FormMain.MemGameInfo.eIsCustomGame);
       FormMain.LoadGameIcon(GameIcon, False);

       SetColorsGameTopBar(FormMain.MemGameInfo.eGameSetStatus, TopBar);
       //case FormMain.MemGameInfo.eGameSetStatus of
       //  0: TopBar.Color1:= $00f0fae5; // green
       //  1: TopBar.Color1:= $00e5f0fa; // red (based on green)
       //  2: TopBar.Color1:= $00eeeeee; // silver (base on green)
       //end;
     end;

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
       SetCurrentDir(FrontendPath);
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

procedure TFormZiNcSettings.RemovePathFromFileName(EditHolder: TEditEx);
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

procedure TFormZiNcSettings.FolderROMsButtonSelectClick(Sender: TObject);
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

procedure TFormZiNcSettings.FolderROMsButtonUpClick(Sender: TObject);
begin
  FormMain.ELV_MoveItem(FolderROMs, Boolean(TBitBtnEx(Sender).Tag));
end;

procedure TFormZiNcSettings.FolderROMsItemPaintText(
  Sender: TCustomEasyListview; Item: TEasyItem; Position: Integer;
  ACanvas: TCanvas);
begin
  FormMain.ELV_ItemPaintText_General(Sender, Item, ACanvas);
end;

procedure TFormZiNcSettings.FramerateManualChange(Sender: TObject);
begin
  FramerateManualLabel.Caption:= FramerateManualLabel.Hint+IntToStr(FramerateManual.Position)+' fps]';
end;

end.
