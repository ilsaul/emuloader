unit uSupermodelSettings;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  StdCtrls, MPCommonObjects, EasyListview, ComCtrls, IniFiles,
  ImgList, GR32_RangeBars, ExtCtrls, Buttons, PanelEx,
  ShadowLabel, AdvGroupBox, AdvOfficeButtons, ButtonsEx, EditEx, ColorBoxEx;

type
  TFormSupermodelSettings = class(TForm)
    TopBar: TPanelEx;
    Multithreading: TAdvOfficeCheckBoxEx;
    ButtonReadFile: TBitBtnEx;
    LabelReadFileIni: TShadowLabel;
    ButtonOk: TBitBtnEx;
    ButtonCancel: TBitBtnEx;
    SystemIcon: TImage;
    GameIcon: TImage;
    LabelGameTitle: TShadowLabel;
    LabelEmulatorVersion: TShadowLabel;
    LabelGameStatus: TShadowLabel;
    FolderROMsGroupBox: TPanelEx;
    FolderROMsGroupBoxLabel: TShadowLabel;
    VideoGroupBox: TPanelEx;
    VideoGroupBoxLabel: TShadowLabel;
    FolderROMs: TEasyListview;
    FolderROMsButtonUp: TBitBtnEx;
    FolderROMsButtonDown: TBitBtnEx;
    FolderROMsButtonSelect: TBitBtnEx;
    FolderROMsButtonEdit: TBitBtnEx;
    FolderROMsButtonDelete: TBitBtnEx;
    FolderROMsButtonClear: TBitBtnEx;
    AudioGroupBox: TPanelEx;
    AudioGroupBoxLabel: TShadowLabel;
    ScreenResolutionLabel: TShadowLabel;
    Real3DVertexShaderLabel: TShadowLabel;
    Real3DFragmentShaderLabel: TShadowLabel;
    Video3DEngineLabel: TShadowLabel;
    LoadTileMapVertexShader2DLabel: TShadowLabel;
    LoadTileMapFragmentShader2DLabel: TShadowLabel;
    LoadReal3DScrollFogVertexShaderLabel: TShadowLabel;
    LoadReal3DScrollFogFragmentShaderLabel: TShadowLabel;
    ScreenResolution: TComboBox2Ex;
    DisableThrottle: TAdvOfficeCheckBoxEx;
    ShowFPS: TAdvOfficeCheckBoxEx;
    Real3DVertexShader: TEditEx;
    Real3DFragmentShader: TEditEx;
    Real3DVertexShaderButtonSelect: TBitBtnEx;
    Real3DFragmentShaderButtonSelect: TBitBtnEx;
    Widescreen: TAdvOfficeCheckBoxEx;
    FullScreen: TAdvOfficeCheckBoxEx;
    GPUMultithreading: TAdvOfficeCheckBoxEx;
    Video3DEngine: TComboBox2Ex;
    DisableVSync: TAdvOfficeCheckBoxEx;
    Stretch: TAdvOfficeCheckBoxEx;
    LoadTileMapVertexShader2D: TEditEx;
    LoadTileMapVertexShader2DButtonSelect: TBitBtnEx;
    LoadTileMapFragmentShader2D: TEditEx;
    LoadTileMapFragmentShader2DButtonSelect: TBitBtnEx;
    MultiTexture: TAdvOfficeCheckBoxEx;
    LoadReal3DScrollFogVertexShader: TEditEx;
    LoadReal3DScrollFogVertexShaderButtonSelect: TBitBtnEx;
    LoadReal3DScrollFogFragmentShaderButtonSelect: TBitBtnEx;
    LoadReal3DScrollFogFragmentShader: TEditEx;
    Video3DEngineButtonReset: TBitBtnEx;
    QuadRendering: TAdvOfficeCheckBoxEx;
    InputGroupBox: TPanelEx;
    InputGroupBoxLabel: TShadowLabel;
    PowerPCFrequencyGroupBox: TPanelEx;
    PowerPCFrequencyGroupBoxLabel: TShadowLabel;
    PowerPCFrequency: TGaugeBar;
    PowerPCFrequencyLabel: TShadowLabel;
    PowerPCFrequencyUseCustom: TAdvOfficeCheckBoxEx;
    PowerPCFrequencyCustomLabel: TShadowLabel;
    PowerPCFrequencyCustom: TGaugeBar;
    CrosshairsLabel: TShadowLabel;
    InputSystem: TComboBox2Ex;
    InputSystemConfigButton: TBitBtnEx;
    EnableForceFeedback: TAdvOfficeCheckBoxEx;
    Crosshairs: TComboBox2Ex;
    SoundVolumeLabel: TShadowLabel;
    MusicVolumeLabel: TShadowLabel;
    AudioBalanceFrontRearLabel: TShadowLabel;
    SoundVolume: TGaugeBar;
    DisableSound: TAdvOfficeCheckBoxEx;
    DisableMusic: TAdvOfficeCheckBoxEx;
    MusicVolume: TGaugeBar;
    FlipStereo: TAdvOfficeCheckBoxEx;
    AudioBalanceFrontRear: TGaugeBar;
    SoundVolumeButtonLast: TBitBtnEx;
    MusicVolumeButtonLast: TBitBtnEx;
    SoundVolumeButtonReset: TBitBtnEx;
    MusicVolumeButtonReset: TBitBtnEx;
    AudioBalanceFrontRearButtonLast: TBitBtnEx;
    AudioBalanceFrontRearButtonReset: TBitBtnEx;
    NetworkBoardGroupBox: TPanelEx;
    NetworkBoardGroupBoxLabel: TShadowLabel;
    NetworkEnable: TAdvOfficeCheckBoxEx;
    NetworkSimulateNetBoard: TAdvOfficeCheckBoxEx;
    NetworkEmulateNetBoard: TAdvOfficeCheckBoxEx;
    NetworkAddressOut: TEditEx;
    NetworkAddressOutLabel: TShadowLabel;
    NetworkPortIn: TEditEx;
    NetworkPortInLabel: TShadowLabel;
    NetworkButtonReset: TBitBtnEx;
    NetworkPortOutLabel: TShadowLabel;
    NetworkPortOut: TEditEx;
    NetworkButtonHelp: TBitBtnEx;
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
    procedure FolderROMsButtonUpClick(Sender: TObject);
    procedure FolderROMsButtonSelectClick(Sender: TObject);
    procedure FolderROMsButtonEditClick(Sender: TObject);
    procedure FolderROMsButtonDeleteClick(Sender: TObject);
    procedure FolderROMsButtonClearClick(Sender: TObject);
    procedure Real3DVertexShaderButtonSelectClick(Sender: TObject);
    procedure Real3DFragmentShaderButtonSelectClick(Sender: TObject);
    procedure SoundVolumeChange(Sender: TObject);
    procedure MusicVolumeChange(Sender: TObject);
    procedure InputSystemConfigButtonClick(Sender: TObject);
    procedure InputSystemSelect(Sender: TObject);
    procedure AudioBalanceFrontRearChange(Sender: TObject);
    procedure SoundVolumeMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure MusicVolumeMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure AudioBalanceFrontRearMouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure Video3DEngineButtonResetClick(Sender: TObject);
    procedure LoadReal3DScrollFogVertexShaderButtonSelectClick(
      Sender: TObject);
    procedure LoadReal3DScrollFogFragmentShaderButtonSelectClick(
      Sender: TObject);
    procedure LoadTileMapVertexShader2DButtonSelectClick(Sender: TObject);
    procedure LoadTileMapFragmentShader2DButtonSelectClick(
      Sender: TObject);
    procedure PowerPCFrequencyCustomChange(Sender: TObject);
    procedure FolderROMsItemPaintText(Sender: TCustomEasyListview;
      Item: TEasyItem; Position: Integer; ACanvas: TCanvas);
    procedure SoundVolumeButtonResetClick(Sender: TObject);
    procedure MusicVolumeButtonResetClick(Sender: TObject);
    procedure AudioBalanceFrontRearButtonResetClick(Sender: TObject);
    procedure SoundVolumeButtonLastClick(Sender: TObject);
    procedure MusicVolumeButtonLastClick(Sender: TObject);
    procedure AudioBalanceFrontRearButtonLastClick(Sender: TObject);
    procedure NetworkButtonResetClick(Sender: TObject);
    procedure NetworkButtonHelpClick(Sender: TObject);
    procedure NetworkPortInKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    //procedure PopulateScreenResolution;
    emuConfigFile: String;
    function  StrIndexOfName(const FindString: String; ListOfStrings: TStrings): Integer;
    procedure ReadEmulatorConfigFile(const iniFile: String; IsCustom: Boolean);
    procedure WriteEmulatorConfigFile(const iniFile: String; IsCustom: Boolean);
    procedure ChangeLabelColorGauge(GaugeBarSource: TGaugeBar; DefaultPosition: Integer; GaugeBarLabel: TShadowLabel);
    procedure ReadSupermodelIni;
    procedure WriteSupermodelIni;
    procedure Resize4K;
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

procedure TFormSupermodelSettings.Resize4K;
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

  function MoveGaugeBar(iGaugeBar: TGaugeBar;  iLabelTitle: TShadowLabel; iButton1: TBitBtnEx = nil; iButton2: TBitBtnEx = nil; iTop: Integer = -1; iLeft: Integer = 10; iWidth: Integer = 287): Boolean;
  var
    iSize: Integer;
  begin
    Result:= True;
    iTopValue:= GetTopPos(iTop);
    if iLabelTitle <> nil then
    begin
      if iLabelTitle.AutoSize then
         iSize:= -1
      else
         iSize:= iWidth;
      FormMain.Set4KLabelSpecs(iLabelTitle, iLeft, iTopValue, iSize, 31, 16);
    end;

    iSize:= iWidth;
    if iButton1 <> nil then
       begin
         iSize:= iSize-70-5;
           if iButton2 <> nil then
              iSize:= iSize-70-3;
       end;

    FormMain.Set4KGaugeBarSpecs(iGaugeBar, iLeft, iTopValue+36, iSize, 36);
    if iButton1 <> nil then
       begin
         FormMain.Set4KButtonSpecs(iButton1, iLeft+iSize+5, iTopValue+36, 70, 36, 16);
         if iButton2 <> nil then
            FormMain.Set4KButtonSpecs(iButton2, iButton1.Left+iButton1.Width+3, iTopValue+36, 70, 36, 16);
       end;
    iTopValue:= iTopValue+82;
  end;

  function MoveEdit(iEdit: TEditEx; iLabelTitle: TShadowLabel; iButton1: TBitBtnEx; iTop: Integer = -1; iLeft: Integer = 10; iWidth: Integer = 587): Boolean;
  var
    iSize: Integer;
  begin
    Result:= True;
    iTopValue:= GetTopPos(iTop);
    if iLabelTitle <> nil then
       FormMain.Set4KLabelSpecs(iLabelTitle, iLeft, iTopValue, -1, -1, 16);

    iSize:= iWidth;
    if iButton1 <> nil then
       iSize:= iSize-5-70;
    FormMain.Set4KEditSpecs(iEdit, iLeft, iTopValue+36, iSize, 36, 16);
    if iButton1 <> nil then
       FormMain.Set4KButtonSpecs(iButton1, iLeft+iSize+5, iTopValue+36, 70, 36, 16);
    iTopValue:= iTopValue+82;
  end;

  function MoveComboBox(iComboBox: TComboBox2Ex; iLabelTitle: TShadowLabel; iButton: TBitBtnEx = nil; iTop: Integer = -1; iLeft: Integer = 10; iWidth: Integer = 587): Boolean;
  var
    iSize: Integer;
  begin
    Result:= True;
    iTopValue:= GetTopPos(iTop);
    if iLabelTitle <> nil then
       FormMain.Set4KLabelSpecs(iLabelTitle, iLeft, iTopValue, -1, -1, 16);

    iSize:= iWidth;
    if iButton <> nil then
       iSize:= iSize-5-70;
    FormMain.Set4KComboBoxSpecs(iComboBox, iLeft, iTopValue+36, iSize, 16);
    if iButton <> nil then
       FormMain.Set4KButtonSpecs(iButton, iLeft+iSize+5, iTopValue+36, 70, 36, 16);
    iTopValue:= iTopValue+82;
  end;
  
begin
  if not Is4KMode then
     Exit;

  with FormSupermodelSettings do
  begin
    ClientWidth:=  1677;
    ClientHeight:= 1551;
    Font.Size:= 16;

    FormMain.Set4KEmuGameTopPanel(TopBar, SystemIcon, GameIcon, LabelGameTitle, 1515, LabelEmulatorVersion, 1245, LabelGameStatus, 1460);

    // Path to ROM Sets and CHD Files
    FormMain.Set4KBoxLabel(FolderROMsGroupBox, FolderROMsGroupBoxLabel, 16, 160, 329, 1645);
    FormMain.Set4KListViewSpecs(FolderROMs, 10, 45, 1538, 272, 16);
    FolderROMs.CellSizes.Report.Height:= 32;

    FormMain.Set4KButtonSpecs(FolderROMsButtonUp    , FolderROMsGroupBox.Width-12-75, 45,                     75, 36, 16);
    FormMain.Set4KButtonSpecs(FolderROMsButtonDown  , FolderROMsButtonUp.Left, FolderROMsButtonUp.Top+41,     75, 36, 16);
    FormMain.Set4KButtonSpecs(FolderROMsButtonSelect, FolderROMsButtonUp.Left, 158,                           75, 36, 16);
    FormMain.Set4KButtonSpecs(FolderROMsButtonEdit  , FolderROMsButtonUp.Left, FolderROMsButtonSelect.Top+41, 75, 36, 16);
    FormMain.Set4KButtonSpecs(FolderROMsButtonDelete, FolderROMsButtonUp.Left, FolderROMsButtonEdit.Top+41,   75, 36, 16);
    FormMain.Set4KButtonSpecs(FolderROMsButtonClear , FolderROMsButtonUp.Left, FolderROMsButtonDelete.Top+41, 75, 36, 16);

    // Video Options
    FormMain.Set4KBoxLabel(VideoGroupBox, VideoGroupBoxLabel, 16, 514, 381, 1645);
    MoveComboBox(Video3DEngine, Video3DEngineLabel, Video3DEngineButtonReset, 45);
    MoveEdit(Real3DVertexShader, Real3DVertexShaderLabel, Real3DVertexShaderButtonSelect);
    MoveEdit(Real3DFragmentShader, Real3DFragmentShaderLabel, Real3DFragmentShaderButtonSelect);
    MoveEdit(LoadReal3DScrollFogVertexShader, LoadReal3DScrollFogVertexShaderLabel, LoadReal3DScrollFogVertexShaderButtonSelect);

    MoveComboBox(ScreenResolution, ScreenResolutionLabel, nil, 45, 623, 512);
    MoveEdit(LoadTileMapVertexShader2D, LoadTileMapVertexShader2DLabel, LoadTileMapVertexShader2DButtonSelect, -1, 623);
    MoveEdit(LoadTileMapFragmentShader2D, LoadTileMapFragmentShader2DLabel, LoadTileMapFragmentShader2DButtonSelect, -1, 623);
    MoveEdit(LoadReal3DScrollFogFragmentShader, LoadReal3DScrollFogFragmentShaderLabel, LoadReal3DScrollFogFragmentShaderButtonSelect, -1, 623);

    MoveCheckBox(QuadRendering    , 44, 1228, 410);
    MoveCheckBox(FullScreen       , -1, 1235, 135);
    MoveCheckBox(Stretch          , -1, 1235,  95);
    MoveCheckBox(GPUMultithreading, -1, 1235, 220);
    MoveCheckBox(DisableVSync     , -1, 1235, 175);
    MoveCheckBox(DisableThrottle  , -1, 1235, 180);
    MoveCheckBox(MultiTexture     , -1, 1235, 340);

    MoveCheckBox(Widescreen       , FullScreen.Top, 1500, 140);
    MoveCheckBox(ShowFPS          ,             -1, 1500, 125);

    // PowerPC Bus Frequency (PPC)
    FormMain.Set4KBoxLabel(PowerPCFrequencyGroupBox, PowerPCFrequencyGroupBoxLabel, 16, 920, 93, 1645);
    MoveGaugeBar(PowerPCFrequency, nil, nil, nil, 45-36, 10, 145);
    FormMain.Set4KLabelSpecs(PowerPCFrequencyLabel, 164, 48, 73, 31, 16);
    MoveCheckBox(PowerPCFrequencyUseCustom, 45, 261, 145);

    FormMain.Set4KLabelSpecs(PowerPCFrequencyCustomLabel, 423, 48, 95, 31, 16);
    MoveGaugeBar(PowerPCFrequencyCustom, nil, nil, nil, 45-36, 524, 1109);

    // Audio Options
    FormMain.Set4KBoxLabel(AudioGroupBox, AudioGroupBoxLabel, 16, 1038, 339, 997);
    MoveCheckBox(FlipStereo, 44, 10, 130);
    MoveCheckBox(DisableSound, 44, 260, 170);
    MoveCheckBox(DisableMusic, 44, 546, 425);

    MoveGaugeBar(SoundVolume, SoundVolumeLabel, SoundVolumeButtonLast, SoundVolumeButtonReset, -1, 10, AudioGroupBox.Width-22);
    MoveGaugeBar(MusicVolume, MusicVolumeLabel, MusicVolumeButtonLast, MusicVolumeButtonReset, -1, 10, AudioGroupBox.Width-22);
    MoveGaugeBar(AudioBalanceFrontRear, AudioBalanceFrontRearLabel, AudioBalanceFrontRearButtonLast, AudioBalanceFrontRearButtonReset, -1, 10, AudioGroupBox.Width-22);

    // Input Options
    FormMain.Set4KBoxLabel(InputGroupBox, InputGroupBoxLabel, 1038, 1038, 185, 623);
    MoveComboBox(InputSystem, nil, InputSystemConfigButton, 45-36, 10, 601);
    MoveCheckBox(EnableForceFeedback, -1, 10, 450);

    FormMain.Set4KLabelSpecs(CrosshairsLabel, 10, 141, -1, -1, 16);
    FormMain.Set4KComboBoxSpecs(Crosshairs, 244, 138, 292, 16);

    MoveCheckBox(Multithreading, 1422, 826, 175);

    // Network Board
    FormMain.Set4KBoxLabel(NetworkBoardGroupBox, NetworkBoardGroupBoxLabel, 1038, 1248, 222, 623);
    MoveCheckBox(NetworkEnable, 44, 10, 240);
    MoveCheckBox(NetworkSimulateNetBoard, -1, 10, 385);
    MoveCheckBox(NetworkEmulateNetBoard, 44, 326, 295);

    MoveEdit(NetworkAddressOut, NetworkAddressOutLabel, nil, 138, 10, 263);
    MoveEdit(NetworkPortIn,   NetworkPortInLabel, nil, 138, 278, 90);
    MoveEdit(NetworkPortOut, NetworkPortOutLabel, nil, 138, 373, 90);
    FormMain.Set4KButtonSpecs(NetworkButtonReset, NetworkPortOut.Left+NetworkPortOut.Width+5,         174, 70, 36, 16);
    FormMain.Set4KButtonSpecs(NetworkButtonHelp,  NetworkButtonReset.Left+NetworkButtonReset.Width+3, 174, 70, 36, 16);

    FormMain.Set4KButtonSpecs(ButtonReadFile, 16, ClientHeight-16-45, 168, 45, 16);
    FormMain.Set4KButtonSpecs(ButtonCancel, ClientWidth-16-168,   ButtonReadFile.Top, 168, 45, 16);
    FormMain.Set4KButtonSpecs(ButtonOk, ButtonCancel.Left-10-168, ButtonReadFile.Top, 168, 45, 16);
    FormMain.Set4KLabelSpecs(LabelReadFileIni, 200, ButtonReadFile.Top+7, 1100, 31, 16);
  end;
end;

procedure TFormSupermodelSettings.ReadEmulatorConfigFile(const iniFile: String; IsCustom: Boolean);
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
  // see OSD\SDL\Main.cpp for "-net" options (and more)
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

  if CustomSettingExist('MultiThreaded') then
     Multithreading.Checked:= Boolean(emuFile.ReadInteger('Emulation', 'MultiThreaded', 1));

  if CustomSettingExist('GPUMultiThreaded') then
     GPUMultithreading.Checked:= Boolean(emuFile.ReadInteger('Emulation', 'GPUMultiThreaded', 1));

  if CustomSettingExist('PowerPCFrequency') then
     begin
       IntValue:= emuFile.ReadInteger('Emulation', 'PowerPCFrequency', 5);
       if not (IntValue in [0..8]) then
          IntValue:= 5; // 50 MHz (default)
       PowerPCFrequency.Position:= IntValue;
     end;

  if CustomSettingExist('PowerPCFrequencyEnableCustom') then
     PowerPCFrequencyUseCustom.Checked:= Boolean(emuFile.ReadInteger('Emulation', 'PowerPCFrequencyEnableCustom', 0));

  if CustomSettingExist('PowerPCFrequencyCustom') then
     begin
       StrValue:= emuFile.ReadString('Emulation', 'PowerPCFrequencyCustom', '');
       if StrValue = '' then
          IntValue:= 50 // default frequency
       else
          IntValue:= StrToInt(StrValue);
       PowerPCFrequencyCustom.Position:= IntValue;
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

  if CustomSettingExist('QuadRendering') then
     QuadRendering.Checked:= Boolean(emuFile.ReadInteger('Video', 'QuadRendering', 1));

  if CustomSettingExist('FullScreen') then
     FullScreen.Checked:= Boolean(emuFile.ReadInteger('Video', 'FullScreen', 0));

  if CustomSettingExist('WideScreen') then
     Widescreen.Checked:= Boolean(emuFile.ReadInteger('Video', 'WideScreen', 0));

  if CustomSettingExist('Stretch') then
     Stretch.Checked:= Boolean(emuFile.ReadInteger('Video', 'Stretch', 0));

  if CustomSettingExist('MultiTexture') then
     MultiTexture.Checked:= Boolean(emuFile.ReadInteger('Video', 'MultiTexture', 0));

  if CustomSettingExist('DisableThrottle') then
     DisableThrottle.Checked:= Boolean(emuFile.ReadInteger('Video', 'DisableThrottle', 0));

  if CustomSettingExist('DisableVSync') then
     DisableVSync.Checked:= Boolean(emuFile.ReadInteger('Video', 'DisableVSync', 0));

  if CustomSettingExist('ShowFrameRate') then
     ShowFPS.Checked:= Boolean(emuFile.ReadInteger('Video', 'ShowFrameRate', 0));

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
       SoundVolumeButtonLast.Tag:= IntValue;
       if not IsCustom then
          SoundVolume.Tag:= IntValue;
     end;

  if CustomSettingExist('MusicVolume') then
     begin
       IntValue:= emuFile.ReadInteger('Audio', 'MusicVolume', 100);
       if (IntValue < MusicVolume.Min) or (IntValue > MusicVolume.Max) then
          IntValue:= 100;
       MusicVolume.Position:= IntValue;
       MusicVolumeButtonLast.Tag:= IntValue;
       if not IsCustom then
          MusicVolume.Tag:= IntValue;
     end;

  if CustomSettingExist('Balance') then
     begin
       IntValue:= emuFile.ReadInteger('Audio', 'Balance', 0);
       if (IntValue < AudioBalanceFrontRear.Min) or (IntValue > AudioBalanceFrontRear.Max) then
          IntValue:= 0;
       AudioBalanceFrontRear.Position:= IntValue;
       AudioBalanceFrontRearButtonLast.Tag:= IntValue;
       if not IsCustom then
          AudioBalanceFrontRear.Tag:= IntValue;
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

  if CustomSettingExist('ForceFeedback') then
     EnableForceFeedback.Checked:= Boolean(emuFile.ReadInteger('Controls', 'ForceFeedback', 0));

  if CustomSettingExist('VertexShader') then
     Real3DVertexShader.Text:= emuFile.ReadString('Shaders', 'VertexShader', '');

  if CustomSettingExist('FragmentShader') then
     Real3DFragmentShader.Text:= emuFile.ReadString('Shaders', 'FragmentShader', '');

  if CustomSettingExist('VertexShaderFog') then
     LoadReal3DScrollFogVertexShader.Text:= emuFile.ReadString('Shaders', 'VertexShaderFog', '');

  if CustomSettingExist('FragmentShaderFog') then
     LoadReal3DScrollFogFragmentShader.Text:= emuFile.ReadString('Shaders', 'FragmentShaderFog', '');

  if CustomSettingExist('VertexShader2D') then
     LoadTileMapVertexShader2D.Text:= emuFile.ReadString('Shaders', 'VertexShader2D', '');

  if CustomSettingExist('FragmentShader2D') then
     LoadTileMapFragmentShader2D.Text:= emuFile.ReadString('Shaders', 'FragmentShader2D', '');

  FreeAndNil(emuFile);
  if IsCustom then
     FreeAndNil(CustomEntryList);
end;

procedure TFormSupermodelSettings.WriteEmulatorConfigFile(const iniFile: String; IsCustom: Boolean);
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

  function CheckEmulatorIniValue(const EntryStr, EntryValue: String; ForceCustomSetting: Boolean = False): Boolean;
  begin
    case IsCustom of
      True:
        begin
          if not ForceCustomSetting then
             Result:= CustomEntryList.IndexOf(EntryStr+'='+EntryValue) = -1
          else
             Result:= True;
        end;
      False: Result:= True; // always return TRUE; default settings is being written!!!
    end;
  end;

begin
  if FormSupermodelSettings.Tag = 0 then
     begin
        // save ROMs folders in '\arcade\emulators.ini'; for default emulator settings only
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

  StrValue:= ExtractFilePath(iniFile);
  CheckAndCreateFolder(StrValue);

  if FileExists(iniFile) then
     DeleteFile(iniFile);
  emuFile:= TMemIniFile.Create(iniFile);

  if CheckEmulatorIniValue('MultiThreaded', IntToStr(Ord(Multithreading.Checked))) then
     emuFile.WriteInteger('Emulation', 'MultiThreaded', Ord(Multithreading.Checked));

  if CheckEmulatorIniValue('GPUMultiThreaded', IntToStr(Ord(GPUMultithreading.Checked))) then
     emuFile.WriteInteger('Emulation', 'GPUMultiThreaded', Ord(GPUMultithreading.Checked));

  if CheckEmulatorIniValue('PowerPCFrequency', IntToStr(PowerPCFrequency.Position)) then
     emuFile.WriteInteger('Emulation', 'PowerPCFrequency', PowerPCFrequency.Position);

  if CheckEmulatorIniValue('PowerPCFrequencyEnableCustom', IntToStr(Ord(PowerPCFrequencyUseCustom.Checked))) then //, True) then
     emuFile.WriteInteger('Emulation', 'PowerPCFrequencyEnableCustom', Ord(PowerPCFrequencyUseCustom.Checked));

  if CheckEmulatorIniValue('PowerPCFrequencyCustom', IntToStr(PowerPCFrequencyCustom.Position)) then
     emuFile.WriteInteger('Emulation', 'PowerPCFrequencyCustom', PowerPCFrequencyCustom.Position);

  StrValue:= ScreenResolution.Text;
  if Strvalue = '' then
     StrValue:= 'auto';

     // XResolution // YResolution
  if CheckEmulatorIniValue('Resolution', StrValue) then
     emuFile.WriteString('Video', 'Resolution', StrValue);

  if Video3DEngine.ItemIndex = -1 then
     Video3DEngine.ItemIndex:= 1;

  if CheckEmulatorIniValue('New3DEngine', IntToStr(Video3DEngine.ItemIndex)) then
     emuFile.WriteInteger('Video', 'New3DEngine', Video3DEngine.ItemIndex);

  if CheckEmulatorIniValue('QuadRendering', IntToStr(Ord(QuadRendering.Checked))) then
     emuFile.WriteInteger('Video', 'QuadRendering', Ord(QuadRendering.Checked));

  if CheckEmulatorIniValue('FullScreen', IntToStr(Ord(FullScreen.Checked))) then
     emuFile.WriteInteger('Video', 'FullScreen', Ord(FullScreen.Checked));

  if CheckEmulatorIniValue('WideScreen', IntToStr(Ord(Widescreen.Checked))) then
     emuFile.WriteInteger('Video', 'WideScreen', Ord(Widescreen.Checked));

  if CheckEmulatorIniValue('Stretch', IntToStr(Ord(Stretch.Checked))) then
     emuFile.WriteInteger('Video', 'Stretch', Ord(Stretch.Checked));

  if CheckEmulatorIniValue('MultiTexture', IntToStr(Ord(MultiTexture.Checked))) then
     emuFile.WriteInteger('Video', 'MultiTexture', Ord(MultiTexture.Checked));

  if CheckEmulatorIniValue('DisableThrottle', IntToStr(Ord(DisableThrottle.Checked))) then
     emuFile.WriteInteger('Video', 'DisableThrottle', Ord(DisableThrottle.Checked));

  if CheckEmulatorIniValue('DisableVSync', IntToStr(Ord(DisableVSync.Checked))) then
     emuFile.WriteInteger('Video', 'DisableVSync', Ord(DisableVSync.Checked));

  if CheckEmulatorIniValue('ShowFrameRate', IntToStr(Ord(ShowFPS.Checked))) then
     emuFile.WriteInteger('Video', 'ShowFrameRate', Ord(ShowFPS.Checked));

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

  if CheckEmulatorIniValue('ForceFeedback', IntToStr(Ord(EnableForceFeedback.Checked))) then
     emuFile.WriteInteger('Controls', 'ForceFeedback', Ord(EnableForceFeedback.Checked));

  if CheckEmulatorIniValue('VertexShader', Real3DVertexShader.Text) then
     emuFile.WriteString('Shaders', 'VertexShader', Real3DVertexShader.Text);

  if CheckEmulatorIniValue('FragmentShader', Real3DFragmentShader.Text) then
     emuFile.WriteString('Shaders', 'FragmentShader', Real3DFragmentShader.Text);

  if CheckEmulatorIniValue('VertexShaderFog', LoadReal3DScrollFogVertexShader.Text) then
     emuFile.WriteString('Shaders', 'VertexShaderFog', LoadReal3DScrollFogVertexShader.Text);

  if CheckEmulatorIniValue('FragmentShaderFog', LoadReal3DScrollFogFragmentShader.Text) then
     emuFile.WriteString('Shaders', 'FragmentShaderFog', LoadReal3DScrollFogFragmentShader.Text);

  if CheckEmulatorIniValue('VertexShader2D', LoadTileMapVertexShader2D.Text) then
     emuFile.WriteString('Shaders', 'VertexShader2D', LoadTileMapVertexShader2D.Text);

  if CheckEmulatorIniValue('FragmentShader2D', LoadTileMapFragmentShader2D.Text) then
     emuFile.WriteString('Shaders', 'FragmentShader2D', LoadTileMapFragmentShader2D.Text);

  emuFile.UpdateFile;
  FreeAndNil(emuFile);
  if IsCustom then
     begin
       FreeAndNil(CustomEntryList);
       if not FormMain.ValidateFile(iniFile) then
          DeleteFile(iniFile); // settings are the same as "Supermodel.ini", no need to create a game custom settings file
     end;
end;

function TFormSupermodelSettings.StrIndexOfName(const FindString: String; ListOfStrings: TStrings): Integer;
var
  Loop, Size: Integer;
  LineStr: String;
begin
  Result:= -1;
  Size:= Length(FindString);
  for Loop:=0 to ListOfStrings.Count-1 do
  begin
    LineStr:= ListOfStrings[Loop];
    if LineStr <> '' then
    begin
      if SameText(Copy(LineStr, 1, Size), FindString) then
         begin
           Result:= Loop;
           Break;
         end;
    end;
  end;
end;

procedure TFormSupermodelSettings.ReadSupermodelIni;
var
  iFolder, iValue: String;
  iFile: TStrings;

  function GetValue(KeyName: String): String;
  var
    iPos: Integer;
  begin
    iPos:= StrIndexOfName(KeyName, iFile);
    Result:= '';
    if iPos <> -1 then
       Result:= Trim(iFile.ValueFromIndex[iPos]);
  end;

begin
  iFolder:= ExtractFilePath(emuFileExec);
  if not FileExists(iFolder+emuConfigFile) then
     begin
       NetworkButtonReset.Click;
       Exit;
     end;

  iFile:= TStringList.Create;
  iFile.LoadFromFile(iFolder+emuConfigFile);
  iValue:= GetValue('Network');
  if iValue <> '' then
     NetworkEnable.Checked:= Boolean(StrToInt(iValue));

  iValue:= GetValue('SimulateNet');
  if iValue <> '' then
     NetworkSimulateNetBoard.Checked:= Boolean(StrToInt(iValue));

  iValue:= GetValue('AddressOut');
  if iValue <> '' then
     begin
       iValue:= RemoveQuotes(iValue);
       NetworkAddressOut.Text:= iValue;
     end;

  iValue:= GetValue('PortIn');
  if iValue <> '' then
     NetworkPortIn.Text:= iValue;

  iValue:= GetValue('PortOut');
  if iValue <> '' then
     NetworkPortOut.Text:= iValue;

  FreeAndNil(iFile);
end;

procedure TFormSupermodelSettings.WriteSupermodelIni;
begin

end;

procedure TFormSupermodelSettings.FormShow(Sender: TObject);
var
  Loop: Integer;
  iStr: String;
begin
  Resize4K;
  FormMain.ELV_ResetNormalColors(FolderROMs);
  if IsNightMode then
  begin
    for Loop:= 0 to FormSupermodelSettings.ComponentCount-1 do
    begin
      if FormSupermodelSettings.Components[Loop] is TPanelEx then
      begin
        iStr:= TPanelEx(FormSupermodelSettings.Components[Loop]).Name;
        if PosEx('GroupBox', iStr) <> 0 then
           begin
             SetPanelColors(TPanelEx(FormSupermodelSettings.Components[Loop]), clrMedDarkGray, -1, True);
             SetPanelBorderColors(TPanelEx(FormSupermodelSettings.Components[Loop]), clrLightGrayFrame, clrBorderGroupBoxGrayBk);
           end;
      end
      else
      if FormSupermodelSettings.Components[Loop] is TBitBtnEx then
         FormMain.SetButtonExColors(TBitBtnEx(FormSupermodelSettings.Components[Loop]))
      else
      if FormSupermodelSettings.Components[Loop] is TEditEx then
         SetEditNightColors(TEditEx(FormSupermodelSettings.Components[Loop]))
      else
      if FormSupermodelSettings.Components[Loop] is TComboBox2Ex then
         SetComboBox2ExColors(TComboBox2Ex(FormSupermodelSettings.Components[Loop]), True)
      else
      if FormSupermodelSettings.Components[Loop] is TGaugeBar then
         SetGaugeBarColors(TGaugeBar(FormSupermodelSettings.Components[Loop]))
      else
      if FormSupermodelSettings.Components[Loop] is TAdvOfficeCheckBoxEx then
         begin
           SetCheckBoxColors(TAdvOfficeCheckBoxEx(FormSupermodelSettings.Components[Loop]), item_caption_active_color[1], item_caption_active_shadow_color[1]);
           TAdvOfficeCheckBoxEx(FormSupermodelSettings.Components[Loop]).DisabledFontColor:= clGray;
           TAdvOfficeCheckBoxEx(FormSupermodelSettings.Components[Loop]).DisabledFontShadowColor:= clrMedDarkGray;
           FormMain.SetCheckBoxExCustomIcon(TAdvOfficeCheckBoxEx(FormSupermodelSettings.Components[Loop]));
         end;
      if FormSupermodelSettings.Components[Loop] is TShadowLabel then
         begin
           iStr:= TPanelEx(FormSupermodelSettings.Components[Loop]).Name;
           if PosEx('GroupBoxLabel', iStr) <> 0 then
           begin
             SetLabelBkFrameColors(TShadowLabel(FormSupermodelSettings.Components[Loop]), clrBorderGroupBoxGrayBk, $00404040, clBlack);
             SetLabelColors(TShadowLabel(FormSupermodelSettings.Components[Loop]), clCream);
           end
           else
           begin
             SetLabelColors(TShadowLabel(FormSupermodelSettings.Components[Loop]), item_caption_active_color[1], item_caption_active_shadow_color[1]);
             if not TShadowLabel(FormSupermodelSettings.Components[Loop]).Transparent then
                    TShadowLabel(FormSupermodelSettings.Components[Loop]).Color:= clrMedDarkGray;
           end;
         end;
    end;
    SetFormColors(FormSupermodelSettings, nil, nil, LabelGameTitle, LabelEmulatorVersion, LabelGameStatus, -1, IsNightMode);
    SetColorEmulatorTopBar(TopBar, idSupermodel, True);
    FormMain.SetEasyListViewColors(FolderROMs, FormSupermodelSettings.Color, clWhite, -1, clGray);
    FormMain.ELV_SetEditBkColor(FolderROMs);
    FormMain.ELV_SetRibbonNightColors(0, FolderROMs, True);
    FormMain.SetWin10DarkScrollBar(FolderROMs);
  end;

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
       SetColorEmulatorTopBar(TopBar, idSupermodel, True); // TopBar.Color1:= $00c0cddc;
       FormMain.LoadSystemIcon(idSupermodel, SystemIcon, False);
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
       //LabelFolderROMs.Enabled:= False;
       FolderROMs.Enabled:= False;
       //FolderROMs.Font.Color:= clSilver;
       FolderROMsButtonUp.Enabled:=     False;
       FolderROMsButtonDown.Enabled:=   False;
       FolderROMsButtonSelect.Enabled:= False;
       FolderROMsButtonEdit.Enabled:=   False;
       FolderROMsButtonDelete.Enabled:= False;
       FolderROMsButtonClear.Enabled:=  False;

       //NetworkBoardGroupBox.Enabled:= False; // no network support for game custom settings

       FormMain.LoadSystemROMIdIcon(FormMain.MemGameInfo.eSystemID, FormMain.MemGameInfo.eCustomSystemID, FormMain.MemGameInfo.eROMIdentification, SystemIcon, FormMain.MemGameInfo.eSoftwareName, FormMain.MemGameInfo.eGameSetStatus, FormMain.MemGameInfo.eIsCustomGame);
       FormMain.LoadGameIcon(GameIcon, False);

       SetColorsGameTopBar(FormMain.MemGameInfo.eGameSetStatus, TopBar);
       //case FormMain.MemGameInfo.eGameSetStatus of
       //  0: TopBar.Color1:= $00f0fae5; // green
       //  1: TopBar.Color1:= $00e5f0fa; // red (based on green)
       //  2: TopBar.Color1:= $00eeeeee; // silver (base on green)
       //end;
     end;
  AudioGroupBox.DoubleBuffered:= True;
  PopulateScreenResolution(ScreenResolution, True);
  //PopulateScreenResolution;
  emuConfigFile:= 'Config\Supermodel.ini'; // this folder/filename is fixed and doesn't change
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
              0: WriteEmulatorConfigFile(emuIni, False); // default options
              1: WriteEmulatorConfigFile(GameIni, True); // game options
            end;
          end;
       SetCurrentDir(FrontendPath);
     end;
end;

procedure TFormSupermodelSettings.PowerPCFrequencyChange(Sender: TObject);
begin
  PowerPCFrequencyLabel.Caption:= Format('%u Mhz', [Model3PowerPCFrequency[PowerPCFrequency.Position]]);
  ChangeLabelColorGauge(PowerPCFrequency, 5, PowerPCFrequencyLabel);
end;

procedure TFormSupermodelSettings.ButtonReadFileClick(Sender: TObject);
begin
  ReadEmulatorConfigFile(emuIni, False);
  ReadSupermodelIni;
  if FormSupermodelSettings.Tag = 1 then
     ReadEmulatorConfigFile(GameIni, True);
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

procedure TFormSupermodelSettings.FolderROMsButtonUpClick(Sender: TObject);
begin
  FormMain.ELV_MoveItem(FolderROMs, Boolean(TBitBtnEx(Sender).Tag));
end;

procedure TFormSupermodelSettings.FolderROMsButtonSelectClick(
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

procedure TFormSupermodelSettings.Real3DVertexShaderButtonSelectClick(
  Sender: TObject);
begin
  FormMain.DialogOpenFile(12, 'Select a vertex shader file', Real3DVertexShader, False);
end;

procedure TFormSupermodelSettings.Real3DFragmentShaderButtonSelectClick(
  Sender: TObject);
begin
  FormMain.DialogOpenFile(12, 'Select a frament shader file', Real3DFragmentShader, False);
end;

procedure TFormSupermodelSettings.LoadReal3DScrollFogVertexShaderButtonSelectClick(
  Sender: TObject);
begin
  FormMain.DialogOpenFile(12, 'Select a scroll fog vertex shader file', LoadReal3DScrollFogVertexShader, False);
end;

procedure TFormSupermodelSettings.LoadReal3DScrollFogFragmentShaderButtonSelectClick(
  Sender: TObject);
begin
  FormMain.DialogOpenFile(12, 'Select a scroll fog frament shader file', LoadReal3DScrollFogFragmentShader, False);
end;

procedure TFormSupermodelSettings.LoadTileMapVertexShader2DButtonSelectClick(
  Sender: TObject);
begin
  FormMain.DialogOpenFile(12, 'Select a tile map vertex shader file', LoadTileMapVertexShader2D, False);
end;

procedure TFormSupermodelSettings.LoadTileMapFragmentShader2DButtonSelectClick(
  Sender: TObject);
begin
  FormMain.DialogOpenFile(12, 'Select a tile map frament shader file', LoadTileMapFragmentShader2D, False);
end;

procedure TFormSupermodelSettings.ChangeLabelColorGauge(GaugeBarSource: TGaugeBar; DefaultPosition: Integer; GaugeBarLabel: TShadowLabel);
begin
  if GaugeBarSource.Position <> DefaultPosition then
     begin
       if IsNightMode then
       begin
         if GaugeBarLabel.Font.Color <> clrLightRed then
            GaugeBarLabel.Font.Color:=  clrLightRed;
       end
       else
       begin
         if GaugeBarLabel.Font.Color <> clRed then
            GaugeBarLabel.Font.Color:=  clRed;
       end;
     end
  else
     begin
       if IsNightMode then
          GaugeBarLabel.Font.Color:= item_caption_active_color[1]
       else
          GaugeBarLabel.Font.Color:= clBlack;
     end;
end;

procedure TFormSupermodelSettings.SoundVolumeChange(Sender: TObject);
begin
  SoundVolumeLabel.Caption:= Format(SoundVolumeLabel.Hint, [SoundVolume.Position])+' %]';
  ChangeLabelColorGauge(SoundVolume, 100, SoundVolumeLabel);
end;

procedure TFormSupermodelSettings.MusicVolumeChange(Sender: TObject);
begin
  MusicVolumeLabel.Caption:= Format(MusicVolumeLabel.Hint, [MusicVolume.Position])+' %]';
  ChangeLabelColorGauge(MusicVolume, 100, MusicVolumeLabel);
end;

procedure TFormSupermodelSettings.AudioBalanceFrontRearChange(
  Sender: TObject);
begin
  AudioBalanceFrontRearLabel.Caption:= Format(AudioBalanceFrontRearLabel.Hint, [AudioBalanceFrontRear.Position])+' %]';
  ChangeLabelColorGauge(AudioBalanceFrontRear, 0, AudioBalanceFrontRearLabel);
end;

procedure TFormSupermodelSettings.InputSystemConfigButtonClick(Sender: TObject);
var
  ExecLine: String;
begin
  if not (InputSystem.ItemIndex in [0, 1]) then
     Exit;

  if FormMain.ShowMessageBox('INFO', 'Configure Supermodel Inputs', '    Supermodel emulator will be executed so you can configure inputs.'+#13#10+'Continue ?', 1, False, 2) = mrNo then
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
  InputSystemConfigButton.Enabled:= InputSystem.ItemIndex in [0, 1];
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

procedure TFormSupermodelSettings.Video3DEngineButtonResetClick(
  Sender: TObject);
begin
  Video3DEngine.ItemIndex:= 1; // New 3D Engine
end;

procedure TFormSupermodelSettings.PowerPCFrequencyCustomChange(
  Sender: TObject);
begin
  PowerPCFrequencyCustomLabel.Caption:= IntToStr(PowerPCFrequencyCustom.Position)+' MHz';
end;

procedure TFormSupermodelSettings.FolderROMsItemPaintText(
  Sender: TCustomEasyListview; Item: TEasyItem; Position: Integer;
  ACanvas: TCanvas);
begin
  FormMain.ELV_ItemPaintText_General(Sender, Item, ACanvas);
end;

procedure TFormSupermodelSettings.SoundVolumeButtonResetClick(
  Sender: TObject);
begin
  SoundVolume.Position:= SoundVolume.Tag;
end;

procedure TFormSupermodelSettings.MusicVolumeButtonResetClick(
  Sender: TObject);
begin
  MusicVolume.Position:= MusicVolume.Tag;
end;

procedure TFormSupermodelSettings.AudioBalanceFrontRearButtonResetClick(
  Sender: TObject);
begin
  AudioBalanceFrontRear.Position:= AudioBalanceFrontRear.Tag;
end;

procedure TFormSupermodelSettings.SoundVolumeButtonLastClick(
  Sender: TObject);
begin
  SoundVolume.Position:= SoundVolumeButtonLast.Tag;
end;

procedure TFormSupermodelSettings.MusicVolumeButtonLastClick(
  Sender: TObject);
begin
  MusicVolume.Position:= MusicVolumeButtonLast.Tag;
end;

procedure TFormSupermodelSettings.AudioBalanceFrontRearButtonLastClick(
  Sender: TObject);
begin
  AudioBalanceFrontRear.Position:= AudioBalanceFrontRearButtonLast.Tag;
end;

procedure TFormSupermodelSettings.NetworkButtonResetClick(Sender: TObject);
begin
  NetworkAddressOut.Text:= '127.0.0.1';
  NetworkPortIn.Text:=  '1970';
  NetworkPortOut.Text:= '1971';
end;

procedure TFormSupermodelSettings.NetworkButtonHelpClick(Sender: TObject);
begin
  FormMain.InitMessageBox;
  FormMain.AddMsgText('    This info is extracted from "Src\Network\NetBoard.cpp".'+#13+
                      'Make sure to enable the network setting on all cabinets/virtual cabinets config files. Change port/IP to whatever you want.'+#13+
                      'These settings go in "emu_path\Config\Supermodel.ini" file.'+#13+
                      'Use the following settings for the master cabinet:'+#13);

  FormMain.AddMsgText(#13+'Network = 1'+#13+'PortIn = 1970'+#13+'PortOut =  1971'+#13+'AddressOut = "127.0.0.1"'+#13, -1, [], taLeftJustify, -1, 'Consolas');

  FormMain.AddMsgText(#13+'Use the following settings for the slave cabinet:'+#13);
  FormMain.AddMsgText(#13+'Network = 1'+#13+'PortIn  = 1971'+#13+'PortOut = 1970'+#13+'AddressOut = "127.0.0.1"'+#13, -1, [], taLeftJustify, -1, 'Consolas');

  // 3 cabinets config
  FormMain.AddMsgText(#13+'In case you want to setup 3 cabinets, use the following settings for the master cabinet:'+#13);
  FormMain.AddMsgText(#13+'Network = 1'+#13+'PortIn  = 1970'+#13+'PortOut = 1971'+#13+'AddressOut = "127.0.0.1"'+#13, -1, [], taLeftJustify, -1, 'Consolas');

  FormMain.AddMsgText(#13+'Use the following settings for the slave1 cabinet:'+#13);
  FormMain.AddMsgText(#13+'Network = 1'+#13+'PortIn  = 1971'+#13+'PortOut = 1972'+#13+'AddressOut = "127.0.0.1"'+#13, -1, [], taLeftJustify, -1, 'Consolas');

  FormMain.AddMsgText(#13+'Use the following settings for the slave2 cabinet:'+#13);
  FormMain.AddMsgText(#13+'Network = 1'+#13+'PortIn  = 1972'+#13+'PortOut = 1970'+#13+'AddressOut = "127.0.0.1"'+#13, -1, [], taLeftJustify, -1, 'Consolas');

  FormMain.ShowMessageBox('Help', 'How to setup multiple cabinets');

{
 add for master
 Network=1
 PortIn = 1970
 PortOut = 1971
 addr_out = "127.0.0.1"

 add for slave
 Network=1
 PortIn = 1971
 PortOut = 1970
 addr_out = "127.0.0.1"

 or in case of 3 cabs

 add for master
 Network=1
 PortIn = 1970
 PortOut = 1971
 addr_out = "127.0.0.1"

 add for slave1
 Network=1
 PortIn = 1971
 PortOut = 1972
 addr_out = "127.0.0.1"

 add for slave2
 Network=1
 PortIn = 1972
 PortOut = 1970
 addr_out = "127.0.0.1"}

end;

procedure TFormSupermodelSettings.NetworkPortInKeyPress(Sender: TObject;
  var Key: Char);
begin
  Key:= FormMain.KeyPressValidateNumbers(Key);
end;

end.
