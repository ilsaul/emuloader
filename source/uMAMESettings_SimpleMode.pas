unit uMAMESettings_SimpleMode;

interface

uses
  Windows, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ImgList, ComCtrls, Buttons, IniFiles,
  ExtCtrls, GR32_RangeBars, uGR32Extra, MPCommonObjects, EasyListview,
  Registry, uCommon, PanelEx, AdvOfficeButtons, AdvGroupBox,
  ShadowLabel, ExTrackBar, ToolWin;

type
  TFormMAMESettings_SimpleMode = class(TForm)
    TopBar: TPanelEx;
    NotebookPages: TNotebook;
    VectorGroupBox: TAdvGroupBox;
    Antialias: TAdvOfficeCheckBox;
    LabelVideoOutputMode: TAdvGroupBox;
    WindowMode: TAdvOfficeCheckBox;
    MaximizeWindow: TAdvOfficeCheckBox;
    KeepAspectRatio: TAdvOfficeCheckBox;
    WaitVerticalSync: TAdvOfficeCheckBox;
    HardwareStretch: TAdvOfficeCheckBox;
    ButtonReadFile: TBitBtn;
    ButtonOk: TBitBtn;
    ButtonCancel: TBitBtn;
    ToolBarPages: TToolBar;
    ButtonPageFolders: TToolButton;
    ButtonPageVideo1: TToolButton;
    FolderROMsDisksBox: TLabel;
    FolderROMs: TEasyListview;
    FolderROMsButtonUp: TBitBtn;
    FolderROMsButtonDown: TBitBtn;
    FolderROMsButtonSelect: TBitBtn;
    FolderROMsButtonEdit: TBitBtn;
    FolderROMsButtonDelete: TBitBtn;
    FolderROMsButtonClear: TBitBtn;
    FolderSamples: TEdit;
    FolderSamplesButtonSelect: TBitBtn;
    LabelFolderGameSnapshots: TLabel;
    FolderGameSnapshots: TEdit;
    FolderGameSnapshotsButtonSelect: TBitBtn;
    LabelFolderNVRAM: TLabel;
    FolderNVRAM: TEdit;
    FolderNVRAMButtonSelect: TBitBtn;
    LabelFolderArtworks: TLabel;
    FolderArtworks: TEasyListview;
    FolderArtworksButtonUp: TBitBtn;
    FolderArtworksButtonDown: TBitBtn;
    FolderArtworksButtonSelect: TBitBtn;
    FolderArtworksButtonEdit: TBitBtn;
    FolderArtworksButtonDelete: TBitBtn;
    FolderArtworksButtonClear: TBitBtn;
    LabelFolderSamples: TLabel;
    LabelFolderInputDeviceLogs: TLabel;
    FolderInputDeviceLogs: TEdit;
    FolderInputDeviceLogsButtonSelect: TBitBtn;
    LabelVectorBeamWidth: TLabel;
    VectorBeamWidth: TGaugeBar2;
    LabelVectorFlickerEffect: TLabel;
    VectorFlickerEffect: TGaugeBar2;
    LabelGameTitle: TShadowLabel;
    LabelEmulatorVersion: TShadowLabel;
    SystemIcon: TImage;
    GameIcon: TImage;
    LabelGameStatus: TShadowLabel;
    ButtonResetToDefault: TBitBtn;
    ButtonReadFileHelp: TBitBtn;
    PerformanceGroupBox: TAdvGroupBox;
    AutoFrameskip: TAdvOfficeCheckBox;
    Throttle: TAdvOfficeCheckBox;
    SyncronizeRefreshRate: TAdvOfficeCheckBox;
    FullScreenBox: TAdvGroupBox;
    TripleBuffer: TAdvOfficeCheckBox;
    SwitchResolution: TAdvOfficeCheckBox;
    GroupBoxAudio: TAdvGroupBox;
    LabelSampleRate: TLabel;
    LabelVolume: TLabel;
    Samples: TAdvOfficeCheckBox;
    SampleRate: TComboBox;
    Volume: TGaugeBar;
    Mouse: TAdvOfficeCheckBox;
    Joystick: TAdvOfficeCheckBox;
    SkipGameInfo: TAdvOfficeCheckBox;
    Cheat: TAdvOfficeCheckBox;
    ScreenResolution: TComboBox;
    LabelScreenResolution: TLabel;
    ScreenRefreshRate: TComboBox;
    LabelScreenRefreshRate_Custom: TLabel;
    LabelFolderIniFiles: TLabel;
    FolderIniFiles: TEasyListview;
    FolderIniFilesButtonUp: TBitBtn;
    FolderIniFilesButtonDown: TBitBtn;
    FolderIniFilesButtonSelect: TBitBtn;
    FolderIniFilesButtonEdit: TBitBtn;
    FolderIniFilesButtonDelete: TBitBtn;
    FolderIniFilesButtonClear: TBitBtn;
    LabelScreenRotation: TAdvGroupBox;
    FlipX: TAdvOfficeCheckBox;
    FlipY: TAdvOfficeCheckBox;
    RotateRight: TAdvOfficeCheckBox;
    RotateLeft: TAdvOfficeCheckBox;
    ReadConfigFiles: TAdvOfficeCheckBox;
    SaveValidateAllCustomFiles: TAdvOfficeCheckBox;
    ButtonHelpSaveValidateAllCustomFiles: TBitBtn;
    EnableSound: TAdvOfficeCheckBox;
    Frameskip: TGaugeBar;
    LabelFrameskip: TLabel;
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure ButtonReadFileClick(Sender: TObject);
    procedure FolderROMsButtonSelectClick(Sender: TObject);
    procedure FolderSamplesButtonSelectClick(Sender: TObject);
    procedure FolderInputDeviceLogsButtonSelectClick(Sender: TObject);
    procedure FolderGameSnapshotsButtonSelectClick(Sender: TObject);
    procedure FolderROMsButtonClearClick(Sender: TObject);
    procedure VolumeChange(Sender: TObject);
    procedure VectorBeamWidthChange(Sender: TObject);
    procedure VectorFlickerEffectChange(Sender: TObject);
    procedure FolderROMsButtonEditClick(Sender: TObject);
    procedure FolderROMsButtonDeleteClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FolderNVRAMButtonSelectClick(Sender: TObject);
    procedure FolderROMsKeyAction(Sender: TCustomEasyListview;
      var CharCode: Word; var Shift: TShiftState; var DoDefault: Boolean);
    procedure FolderROMsItemEditEnd(Sender: TCustomEasyListview;
      Item: TEasyItem);
    procedure FolderROMsItemEdited(Sender: TCustomEasyListview;
      Item: TEasyItem; var NewValue: Variant; var Accept: Boolean);
    procedure FolderROMsButtonUpClick(Sender: TObject);
    procedure FolderArtworksKeyAction(Sender: TCustomEasyListview;
      var CharCode: Word; var Shift: TShiftState; var DoDefault: Boolean);
    procedure FolderArtworksButtonUpClick(Sender: TObject);
    procedure FolderArtworksButtonSelectClick(Sender: TObject);
    procedure FolderArtworksButtonEditClick(Sender: TObject);
    procedure FolderArtworksButtonDeleteClick(Sender: TObject);
    procedure FolderArtworksButtonClearClick(Sender: TObject);
    procedure ButtonPageFoldersClick(Sender: TObject);
    procedure ButtonResetToDefaultClick(Sender: TObject);
    procedure ButtonReadFileHelpClick(Sender: TObject);
    procedure FolderIniFilesButtonUpClick(Sender: TObject);
    procedure FolderIniFilesButtonSelectClick(Sender: TObject);
    procedure FolderIniFilesButtonEditClick(Sender: TObject);
    procedure FolderIniFilesButtonDeleteClick(Sender: TObject);
    procedure FolderIniFilesButtonClearClick(Sender: TObject);
    procedure FolderIniFilesKeyAction(Sender: TCustomEasyListview;
      var CharCode: Word; var Shift: TShiftState; var DoDefault: Boolean);
    procedure SaveValidateAllCustomFilesClick(Sender: TObject);
    procedure ButtonHelpSaveValidateAllCustomFilesClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FrameskipChange(Sender: TObject);
  private
    { Private declarations }
    IsSDLMAME, IsOldResolutionEntry: Boolean;
    IniCustomList: packed array[1..11] of THashedStringList; // 1 -> debug.ini; 11 -> parent_game.ini
    //function  RemoveQuotes(const DataString: String): String;

    function  GetCustomIniFile(FileID: ShortInt): String;
    procedure LoadIniToStringList(FileID: ShortInt; var ListHolder: THashedStringList);
    procedure LoadCustomSettingsFiles;
    procedure LoadCustomFilesArray;
    procedure CheckOldResolutionEntry;
    procedure ReadMAMEIniFile(const IniFile: String; EmuDefaultSettings: Boolean = False);
    procedure WriteMAMEIniFile(const customIni: String; CustomGameOption: Boolean);
  public
    { Public declarations }
    emuIni,
    GameIni: String;
    sysID, ActiveFileID: ShortInt;
    IsAlterMAME: Boolean;
    BuildNumber: Integer;
  end;

var
  FormMAMESettings_SimpleMode: TFormMAMESettings_SimpleMode;

implementation

uses uMain;

{$R *.dfm}

{function TFormMAMESettings_SimpleMode.RemoveQuotes(const DataString: String): String;
begin
  Result:= DataString;
  if DataString = '' then
     begin
       Result:= 'Lucida Console';
       Exit;
     end;
  if Result[1] = '"' then
     Delete(Result, 1, 1);
  if Result[Length(Result)] = '"' then
     Delete(Result, Length(Result), 1);
  if Result = '' then
     Result:= 'Lucida Console';
end;}

procedure TFormMAMESettings_SimpleMode.CheckOldResolutionEntry;
var
  TextLine, EntryString: String;
  MAMEIniFile: THashedStringList;
  Loop: Integer;
  CheckedCount: Byte;
  FoundIniPath: Boolean;
begin
  IsOldResolutionEntry:= False;
  if not FileExists(emuIni) then
     Exit;

  CheckedCount:= 0;
  FoundIniPath:= False;

  MAMEIniFile:= THashedStringList.Create;
  MAMEIniFile.LoadFromFile(emuIni);
  for Loop:=0 to MAMEIniFile.Count -1 do
  begin
    TextLine:= MAMEIniFile[Loop];
    if TextLine <> '' then
       begin
         EntryString:= XML_GetEntryName(TextLine);
         if EntryString <> '' then
            EntryString:= EntryString+' ';

         if ((EntryString = 'inipath ') or (Copy(TextLine, 1, 10) = '# inipath ')) then
            begin
              FoundIniPath:= True;
              Inc(CheckedCount);
            end
         else
         if EntryString = 'refresh ' then
            begin
              IsOldResolutionEntry:= True;
              Inc(CheckedCount);
            end;
       end;
    // validate 'refresh', 'inipath', '# inipath' entries
    if CheckedCount = 2 then
       Break;
  end;
  FreeAndNil(MAMEIniFile);
  if ButtonPageFolders.Visible and (not FoundIniPath) then
     begin
       LabelFolderIniFiles.Enabled:= False;
       FolderIniFiles.Enabled:= False;
       FolderIniFilesButtonUp.Enabled:= False;
       FolderIniFilesButtonDown.Enabled:= False;
       FolderIniFilesButtonSelect.Enabled:= False;
       FolderIniFilesButtonEdit.Enabled:= False;
       FolderIniFilesButtonDelete.Enabled:= False;
       FolderIniFilesButtonClear.Enabled:= False;
     end;
end;

// from src\emu\emuopts.h
// command-line options are HIGH priority
// OPTION_PRIORITY_CMDLINE = OPTION_PRIORITY_HIGH,

// INI-based options are NORMAL priority, in increasing order:
// OPTION_PRIORITY_INI = OPTION_PRIORITY_NORMAL,
// OPTION_PRIORITY_MAME_INI,
// OPTION_PRIORITY_DEBUG_INI,
// OPTION_PRIORITY_ORIENTATION_INI,
// OPTION_PRIORITY_SYSTYPE_INI,
// OPTION_PRIORITY_VECTOR_INI,
// OPTION_PRIORITY_SOURCE_INI,
// OPTION_PRIORITY_GPARENT_INI,
// OPTION_PRIORITY_PARENT_INI,
// OPTION_PRIORITY_DRIVER_INI

// load settings from file in the following order

// mame.ini
// debug.ini
// vertical.ini // orientation_ini
// horizont.ini // orientation_ini
// arcade.ini   // systype_ini
// console.ini  // systype_ini
// computer.ini // systype_ini
// othersys.ini // systype_ini ??????
// vector.ini
// source\sourcefile.ini // source_ini
// sourcefile.ini        // source_ini
// biosname.ini   // grandparent_ini
// parentgame.ini // parent_ini (if current game is clone)
// gamename.ini   // driver_ini

procedure TFormMAMESettings_SimpleMode.ReadMAMEIniFile(const IniFile: String; EmuDefaultSettings: Boolean = False);
var
  TextLine, Value, EntryString, cResolution, cRefreshRate: String;
  MAMEIniFile: THashedStringList;
  Loop: Integer;

  function SetComboBoxItemZero(ComboBoxHolder: TComboBox): Boolean;
  begin
    Result:= True;
    if ComboBoxHolder.ItemIndex = -1 then
       ComboBoxHolder.ItemIndex:= 0;
  end;

  function SetResolutionComboBox: Boolean;
  var
    sIndex: Integer;
  begin
    Result:= True;
    if (cResolution = '') or (cResolution = '0x0') then
       cResolution:= 'auto';

    if cResolution = 'auto' then
       ScreenResolution.ItemIndex:= 0
    else
       begin
         sIndex:= ScreenResolution.Items.IndexOf(cResolution);
         if sIndex = -1 then
            sIndex:= 0; // reset to "auto"
         SetSelectedComboBox(sIndex, ScreenResolution);
       end;
  end;

  function SetRefreshRateComboBox: Boolean;
  var
    sIndex: Integer;
  begin
    Result:= True;
    if (cRefreshRate = '') or (cRefreshRate = '0') then
       cRefreshRate:= 'auto';
    if cRefreshRate = 'auto' then
       ScreenRefreshRate.ItemIndex:= 0
    else
       begin
         sIndex:= ScreenRefreshRate.Items.IndexOf(cRefreshRate);
         if sIndex = -1 then
            sIndex:= 0;
         SetSelectedComboBox(sIndex, ScreenRefreshRate);
       end;
  end;

  function SetResolutionOption(nScreenIdx: ShortInt): Boolean;
  var
    Loop, Position{, sIndex}: Integer;
    TempString: String;
  begin
    Result:= True;
    Value:= ExtractMAMEIniValue(TextLine);

    case SameText(Value, 'auto') of
      True:
        begin
          cResolution:= 'auto';
          if not IsOldResolutionEntry then
             cRefreshRate:= 'auto';
        end;
      False:
        begin
          if IsOldResolutionEntry then
             cResolution:= Value
          else
          begin
            Position:= Pos('@', Value);
            if Position <> 0 then
               cRefreshRate:= Copy(Value, Position+1, Length(Value)-Position);
            TempString:= '';
            for Loop:= 1 to Length(Value) do
            begin
              if (Loop = Length(Value)) then
                 TempString:= TempString+Value[Loop];
              if (Value[Loop] = '@') or (Loop = Length(Value)) then
                 begin
                   cResolution:= TempString;
                   Break;
                 end
              else
                 TempString:= TempString+Value[Loop];
            end;
          end;
        end;
    end;
    //if (cResolution = '') or (cResolution = '0x0') then
    //   cResolution:= 'auto';
    //if not IsOldResolutionEntry then
    //   begin
    //     if (cRefreshRate = '') or (cRefreshRate = '0') then
    //        cRefreshRate:= 'auto';
    //   end;

    // resolution
    SetResolutionComboBox;
    {if cResolution = 'auto' then
       ScreenResolution.ItemIndex:= 0
    else
       begin
         sIndex:= ScreenResolution.Items.IndexOf(cResolution);
         if sIndex = -1 then
            sIndex:= 0; // reset to "auto"
         SetSelectedComboBox(sIndex, ScreenResolution);
       end;}

    // refresh rate
    if not IsOldResolutionEntry then
       SetRefreshRateComboBox;
    {if cRefreshRate = 'auto' then
       ScreenRefreshRate.ItemIndex:= 0
    else
       begin
         sIndex:= ScreenRefreshRate.Items.IndexOf(cRefreshRate);
         if sIndex = -1 then
            sIndex:= 0;
         SetSelectedComboBox(sIndex, ScreenRefreshRate);
       end;}
  end;

  // for future improvement... and to avoid repeting the same code over and over again!
  function GetStringValue: String;
  begin
    Result:= ExtractMAMEIniValue(TextLine);
  end;

  function GetIntegerValue: Integer;
  begin
    Result:= StrToInt(GetStringValue);
  end;

  function GetBooleanValue: Boolean;
  begin
    Result:= Boolean(GetIntegerValue);
  end;

  function GetFloatValue(const StrFormat: String): Extended;
  begin
    Result:= StrToFloat(Format(StrFormat, [StrToFloat(GetStringValue)]));
  end;

begin
  if not FileExists(IniFile) then
     Exit;

   ThousandSeparator:= Char(',');
   DecimalSeparator:= Char('.');
   cResolution:= '';
   cRefreshRate:= '';
   MAMEIniFile:= THashedStringList.Create;
   MAMEIniFile.LoadFromFile(IniFile);
   for Loop:=0 to MAMEIniFile.Count -1 do
   begin
     TextLine:= MAMEIniFile[Loop];
     with FormMAMESettings_SimpleMode do
     begin
       if TextLine <> '' then
          begin
            EntryString:= XML_GetEntryName(TextLine);
            if EntryString <> '' then
               EntryString:= EntryString+' ';
            // # CORE CONFIGURATION OPTIONS
            if (EntryString =  'readconfig ') or
               (EntryString = 'rc ') then
               ReadConfigFiles.Checked:= GetBooleanValue
            else

            // # CORE SEARCH PATH OPTIONS
            if ((EntryString = 'rompath ') or
                (EntryString = 'rp ')) and EmuDefaultSettings then
               FormMain.ExtractROMsFolders(GetStringValue, sysID, FolderROMs)
            else
            if ((EntryString = 'samplepath ') or
                (EntryString = 'sp ')) and EmuDefaultSettings then
               FolderSamples.Text:= GetStringValue
            else
            if ((EntryString = 'artpath ') or
                (EntryString = 'artwork_directory ')) and EmuDefaultSettings then
               FormMain.ExtractMultiFolders(GetStringValue, sysID, FolderArtworks)
            else
            if (EntryString = 'inipath ') and EmuDefaultSettings then
               FormMain.ExtractMultiFolders(GetStringValue, sysID, FolderIniFiles)
            else
            if (EntryString = '# inipath ') and EmuDefaultSettings then
               begin
                 Value:= GetStringValue;
                 if SameText(Value, '<NULL> (not set)') then
                    Value:= '.;ini';
                 FormMain.ExtractMultiFolders(Value, sysID, FolderIniFiles);
               end;
            // # CORE OUTPUT DIRECTORY OPTIONS
            if (EntryString = 'nvram_directory ') and EmuDefaultSettings then
               FolderNVRAM.Text:= GetStringValue
            else
            if (EntryString = 'input_directory ') and EmuDefaultSettings then
               FolderInputDeviceLogs.Text:= GetStringValue
            else
            if (EntryString = 'snapshot_directory ') and EmuDefaultSettings then
               FolderGameSnapshots.Text:= GetStringValue
            else
            // # CORE PERFORMANCE OPTIONS
            if (EntryString = 'autoframeskip ') or
               (EntryString = 'afs ') then
               AutoFrameSkip.Checked:= GetBooleanValue
            else
            if (EntryString = 'frameskip ') or
               (EntryString = 'fs ') then
               FrameSkip.Position:= GetIntegerValue
            else
            if EntryString = 'throttle ' then
               Throttle.Checked:= GetBooleanValue
            else
            // # CORE ROTATION OPTIONS
            if EntryString = 'ror ' then
               RotateRight.Checked:= GetBooleanValue
            else
            if EntryString = 'rol ' then
               RotateLeft.Checked:= GetBooleanValue
            else
            if EntryString = 'flipx ' then
               FlipX.Checked:= GetBooleanValue
            else
            if EntryString = 'flipy ' then
               FlipY.Checked:= GetBooleanValue
            else
            // # CORE VECTOR OPTIONS
            if (EntryString = 'antialias ') or
               (EntryString = 'aa ') then
               Antialias.Checked:= GetBooleanValue
            else
            if EntryString = 'beam ' then
               VectorBeamWidth.Position:= GetFloatValue('%2.2f') // StrToFloat(Format('%2.2f', [StrToFloat(GetStringValue)]))
            else
            if EntryString = 'flicker ' then
               VectorFlickerEffect.Position:= GetFloatValue('%3.2f') //StrToFloat(Format('%3.2f', [StrToFloat(GetStringValue)]))
            else
            // # CORE SOUND OPTIONS
            if EntryString = 'sound ' then
               EnableSound.Checked:= GetBooleanValue
            else
            if (EntryString = 'samplerate ') or
               (EntryString = 'sr ') then
               begin
                 Value:= GetStringValue;
                 case StrToInt(Value) of
                   11025 : SampleRate.ItemIndex:= 0;
                   22050 : SampleRate.ItemIndex:= 1;
                   44100 : SampleRate.ItemIndex:= 2;
                   48000 : SampleRate.ItemIndex:= 3;
                   96000 : SampleRate.ItemIndex:= 4;
                   192000: SampleRate.ItemIndex:= 5;
                   else    SampleRate.ItemIndex:= 3;
                 end;
               end
            else
            if EntryString = 'samples ' then
               Samples.Checked:= GetBooleanValue
            else
            if (EntryString = 'volume ') or
               (EntryString = 'vol ') then
               Volume.Position:= GetIntegerValue
            else
            // # CORE INPUT OPTIONS
            if EntryString = 'mouse ' then
               Mouse.Checked:= GetBooleanValue
            else
            if (EntryString = 'joystick ') or
               (EntryString = 'joy ') then
               Joystick.Checked:= GetBooleanValue
            else
            // # CORE MISC OPTIONS
            if (EntryString = 'cheat ') or
               (EntryString = 'c ') then
               Cheat.Checked:= GetBooleanValue
            else
            if EntryString = 'skip_gameinfo ' then
               SkipGameInfo.Checked:= GetBooleanValue
            else
            // # WINDOWS VIDEO OPTIONS
            if (EntryString = 'window ') or
               (EntryString = 'w ') then
               WindowMode.Checked:= GetBooleanValue
            else
            if (EntryString = 'maximize ') or
               (EntryString = 'max ') then
               MaximizeWindow.Checked:= GetBooleanValue
            else
            if (EntryString = 'keepaspect ') or
               (EntryString = 'ka ') then
               KeepAspectRatio.Checked:= GetBooleanValue
            else
            if (EntryString = 'waitvsync ') or
               (EntryString = 'vs ') then
               WaitVerticalSync.Checked:= GetBooleanValue
            else
            if (EntryString = 'syncrefresh ') or
               (EntryString = 'srf ') then
               SyncronizeRefreshRate.Checked:= GetBooleanValue
            else
            // # DIRECTDRAW-SPECIFIC OPTIONS
            if (EntryString = 'hwstretch ') or
               (EntryString = 'hws ') then
               HardwareStretch.Checked:= GetBooleanValue
            else
            // # PER-WINDOW VIDEO OPTIONS
            if (EntryString = 'resolution ') or
               (EntryString = 'r ') then
               SetResolutionOption(-1)
            else
            if EntryString = 'refresh ' then // for MAME 0.106 and older
               begin
                 cRefreshRate:= GetStringValue;
                 SetRefreshRateComboBox;
               end
            else
            // # FULL SCREEN OPTIONS
            if (EntryString = 'triplebuffer ') or
               (EntryString = 'tb ') then
               TripleBuffer.Checked:= Boolean(StrToInt(ExtractMAMEIniValue(TextLine)))
            else
            if EntryString = 'switchres ' then
               SwitchResolution.Checked:= Boolean(StrToInt(ExtractMAMEIniValue(TextLine)));
          end;
     end;
   end;
   FreeAndNil(MAMEIniFile);
end;

procedure TFormMAMESettings_SimpleMode.LoadCustomFilesArray;
var
  Loop: ShortInt;
  strFile, FileFolder: String;
begin
  if (ActiveFileID = 1) or (not SaveValidateAllCustomFiles.Checked) then
     Exit; // debug.ini; there's no need to use the array as 'debug.ini' will be tested directly against 'mame.ini' (use current validation mode)

  for Loop:= (ActiveFileID-1) downto 1 do
  begin
    strFile:= GetCustomIniFile(Loop);
    if strFile <> '' then
    begin
      if IsAlterMAME then
         FileFolder:= FormMain.AlterMAMEIniFilesDir
      else
         FileFolder:= FormMain.IniFilesDir[sysID];

      if Loop = 9 then
         begin
           // driver .ini file
           if FileExists(FileFolder+strFile+'.ini') then
              strFile:= FileFolder+strFile+'.ini'
           else
              begin
                if BuildNumber > 118 then
                   strFile:= FileFolder+'source\'+strFile+'.ini'; // from 0.37b15 (v0.51) to 0.118 there is no "ini\source\" sub-folder support!
              end;
         end
      else
         strFile:= FileFolder+strFile+'.ini';

      LoadIniToStringList(Loop, IniCustomList[Loop]); // convert 'entry    value' format to 'entry=value' so EL can read settings easier
      //ReadMAMEIniFile(strFile); // read all gamename.ini options
    end;
  end;

  //ReadMAMEIniFile(GameIni); // read all gamename.ini options
  //SaveValidateAllCustomFiles
end;

procedure TFormMAMESettings_SimpleMode.WriteMAMEIniFile(const customIni: String; CustomGameOption: Boolean);
var
  MAMEIniFile, GameIniFile: THashedStringList;
  Loop: Integer;
  Value, tmpEntryStr, EntryString, cResolution, cRefreshRate: String;

  //if (data->data != NULL)
	//   fprintf(inifile, "%-25s %s\n", data->names[0], data->data);
  //else
  //   fprintf(inifile, "# %-23s <NULL> (not set)\n", data->names[0]);

  function WriteLine(const Entry, Value: String): String;
  begin
    if BuildNumber > 106 then
       Result:= Format('%-25s %s', [Entry, Value]) // 0.107 changed .ini files format
    else
       Result:= Format('%-23s %s', [Entry, Value]);
  end;

  function IsValueDifferent(const FileValue, NewValue: String; IsFloat: Boolean): Boolean;
  begin
    Result:= False;
    case IsFloat of
      True:
        begin
          if StrToFloat(FileValue) <> StrToFloat(NewValue) then
             Result:= True;
        end;
      False:
        begin
          if FileValue <> NewValue then
             Result:= True;
        end;
    end;
  end;

  function UpdateMAMELine(const Entry, ValueHolder: String; FloatValue: Boolean = False): Boolean;
  var
    ValueStr: String;
    AddEntry: Boolean;
    iLoop, IndexEntry: Integer;
  begin
    Result:= True;
    case CustomGameOption of
      True:
        begin
          AddEntry:= True;
          if SaveValidateAllCustomFiles.Checked and (ActiveFileID > 1) then
             begin
               for iLoop:= (ActiveFileID-1) downto 1 do // down to debug.ini
               begin
                 if Assigned(IniCustomList[iLoop]) then
                    begin
                      IndexEntry:= IniCustomList[iLoop].IndexOfName(Entry);
                      if IndexEntry <> -1 then
                         begin
                           ValueStr:= IniCustomList[iLoop].ValueFromIndex[IndexEntry];
                           if IsValueDifferent(ValueStr, ValueHolder, FloatValue) then
                              GameIniFile.Add(WriteLine(Entry, ValueHolder));
                           AddEntry:= False; // prevent from checking against 'mame.ini'
                           Break; // stop scanning other previous files...
                         end;
                    end;
               end;
             end;

          if AddEntry then
             begin
               // need to check against mame.ini now (default emu settings)
               if IsValueDifferent(ExtractMAMEIniValue(MAMEIniFile[Loop]), ValueHolder, FloatValue) then
                  GameIniFile.Add(WriteLine(Entry, ValueHolder));
               // old code
               //case FloatValue of
               //  True:
               //    begin
               //      if StrToFloat(ExtractMAMEIniValue(MAMEIniFile[Loop])) <>
               //         StrToFloat(ValueHolder) then
               //         GameIniFile.Add(WriteLine(Entry, ValueHolder));
               //    end;
               //  False:
               //    begin
               //      if ExtractMAMEIniValue(MAMEIniFile[Loop]) <> ValueHolder then
               //         GameIniFile.Add(WriteLine(Entry, ValueHolder));
               //    end;
               //end;
             end;
        end;
      False: MAMEIniFile[Loop]:= WriteLine(Entry, ValueHolder);
    end;
  end;
  {function UpdateMAMELine(const Entry, ValueHolder: String; FloatValue: Boolean = False): Boolean;
  begin
    Result:= True;
    case CustomGameOption of
      True:
        begin
          case FloatValue of
            True:
              begin
                if StrToFloat(ExtractMAMEIniValue(MAMEIniFile[Loop])) <>
                   StrToFloat(ValueHolder) then
                   GameIniFile.Add(WriteLine(Entry, ValueHolder));
              end;
            False:
              begin
                if ExtractMAMEIniValue(MAMEIniFile[Loop]) <> ValueHolder then
                   GameIniFile.Add(WriteLine(Entry, ValueHolder));
              end;
          end;
        end;
      False: MAMEIniFile[Loop]:= WriteLine(Entry, ValueHolder);
    end;
  end;}

  function SetScreenResolution(EntryStr: String): Boolean;
  begin
    Result:= True;
    Value:= cResolution;
    if not IsOldResolutionEntry then
       begin
         if cResolution <> 'auto' then
            begin
              // only check refresh rate if resolution is not 'auto'
              if cRefreshRate <> 'auto' then
                 Value:= Value+'@'+cRefreshRate;
            end
         else
            begin
              if cRefreshRate <> 'auto' then
                 Value:= '0x0@'+cRefreshRate;
            end;
       end;
    UpdateMAMELine(EntryStr, Value);
  end;

  function GetBooleanValue(BooleanValue: Boolean): String;
  begin
    Result:= IntToStr(Ord(BooleanValue));
  end;

  function GetFloatValue(const StrFormat: String; ComponentValue: Extended): String;
  begin
    Result:= Format(StrFormat, [ComponentValue]);
  end;

begin
  if emuIni = '' then
     begin
       GenerateMessage('Error', 'Failed to update settings.', '    Emulator .ini filename is blank. '+
                       'Please try selecting an emulator again in Emulators Setup screen. Aborting...', 2, False, 1);
       Exit;
     end;
  case CustomGameOption of
    True:
      begin
        if customIni = '' then
           begin
             GenerateMessage('Error', 'Failed to update settings.', '    Custom .ini filename is blank. '+
                             'Please make sure that a game or a system is selected in the main screen. Aborting...', 2, False, 1);
             Exit;
           end
        else
           begin
             CheckAndCreateFolder(ExtractFilePath(customIni));
             if FileExists(customIni) then
                DeleteFile(customIni);
             LoadCustomFilesArray;
             GameIniFile:= THashedStringList.Create;
             GameIniFile.BeginUpdate;
           end;
      end;
    False:
      begin
        if FormMain.CheckReadOnly(emuIni) then
           Exit;
      end;
  end;

  cResolution:= ScreenResolution.Text;
  if cResolution = '' then
     cResolution:= 'auto';
  cRefreshRate:= ScreenRefreshRate.Text;
  if cRefreshRate = '' then
     cRefreshRate:= 'auto';
  MAMEIniFile:= THashedStringList.Create;
  MAMEIniFile.LoadFromFile(emuIni);

  for Loop:=0 to MAMEIniFile.Count-1 do
  begin
    if MAMEIniFile[Loop] <> '' then
       begin
         EntryString:= XML_GetEntryName(MAMEIniFile[Loop]);
         tmpEntryStr:= EntryString+' ';
         // # CORE CONFIGURATION OPTIONS
         if (tmpEntryStr = 'readconfig ') or
            (tmpEntryStr = 'rc ') then
            UpdateMAMELine(EntryString, GetBooleanValue(ReadConfigFiles.Checked))
         else
         // # CORE SEARCH PATH OPTIONS
         if ((tmpEntryStr = 'rompath ') or
             (tmpEntryStr = 'rp ')) and (not CustomGameOption) then
            UpdateMAMELine(EntryString, FormMain.MountFoldersListMAME(FolderROMs))
         else
         if ((tmpEntryStr = 'samplepath ') or
             (tmpEntryStr = 'sp ')) and (not CustomGameOption) then
            UpdateMAMELine(EntryString, FolderSamples.Text)
         else
         if ((tmpEntryStr = 'artpath ') or
             (tmpEntryStr = 'artwork_directory ')) and (not CustomGameOption) then
            UpdateMAMELine(EntryString, FormMain.MountFoldersListMAME(FolderArtworks))
         else
         if (tmpEntryStr = 'inipath ') and (not CustomGameOption) then
            UpdateMAMELine(EntryString, FormMain.MountFoldersListMAME(FolderIniFiles))
         else
         if (tmpEntryStr = '# inipath ') and (not CustomGameOption) then
            begin
              if FormMain.CheckTotal(FolderROMs) then
                 UpdateMAMELine('inipath', FormMain.MountFoldersListMAME(FolderIniFiles))
              else
                 UpdateMAMELine('inipath', '.;ini');
            end
         else
         // # CORE OUTPUT DIRECTORY OPTIONS
         if (tmpEntryStr = 'nvram_directory ') and (not CustomGameOption) then
            UpdateMAMELine(EntryString, FolderNVRAM.Text)
         else
         if (tmpEntryStr = 'input_directory ') and (not CustomGameOption) then
            UpdateMAMELine(EntryString, FolderInputDeviceLogs.Text)
         else
         if (tmpEntryStr = 'snapshot_directory ') and (not CustomGameOption) then
            UpdateMAMELine(EntryString, FolderGameSnapshots.Text)
         else

         // # CORE PERFORMANCE OPTIONS
         if (tmpEntryStr = 'autoframeskip ') or
            (tmpEntryStr = 'afs ') then
            UpdateMAMELine(EntryString, GetBooleanValue(AutoFrameSkip.Checked))
         else
         if (tmpEntryStr = 'frameskip ') or
            (tmpEntryStr = 'fs ') then
            UpdateMAMELine(EntryString, IntToStr(FrameSkip.Position))
         else
         if tmpEntryStr = 'throttle ' then
            UpdateMAMELine(EntryString, GetBooleanValue(Throttle.Checked))
         else

         // # CORE ROTATION OPTIONS
         if tmpEntryStr = 'ror ' then
            UpdateMAMELine(EntryString, GetBooleanValue(RotateRight.Checked))
         else
         if tmpEntryStr = 'rol ' then
            UpdateMAMELine(EntryString, GetBooleanValue(RotateLeft.Checked))
         else
         if tmpEntryStr = 'flipx ' then
            UpdateMAMELine(EntryString, GetBooleanValue(FlipX.Checked))
         else
         if tmpEntryStr = 'flipy ' then
            UpdateMAMELine(EntryString, GetBooleanValue(FlipY.Checked))
         else

         // # CORE VECTOR OPTIONS
         if (tmpEntryStr = 'antialias ') or
            (tmpEntryStr = 'aa ') then
            UpdateMAMELine(EntryString, GetBooleanValue(Antialias.Checked))
         else
         if tmpEntryStr = 'beam ' then
            UpdateMAMELine(EntryString, Format('%2.2f', [VectorBeamWidth.Position]), True)
         else
         if tmpEntryStr = 'flicker ' then
            UpdateMAMELine(EntryString, Format('%3.2f', [VectorFlickerEffect.Position]), True)
         else
         
         // # CORE SOUND OPTIONS
         if tmpEntryStr = 'sound ' then
            UpdateMAMELine(EntryString, GetBooleanValue(EnableSound.Checked))
         else
         if (tmpEntryStr = 'samplerate ') or
            (tmpEntryStr = 'sr ') then
            begin
              Value:= '48000'; // default value
              case SampleRate.ItemIndex of
                0: Value:= '11025';
                1: Value:= '22050';
                2: Value:= '44100';
                3: Value:= '48000';
                4: Value:= '96000';
                5: Value:= '192000';
              end;
              UpdateMAMELine(EntryString, Value);
            end
         else
         if tmpEntryStr = 'samples ' then
            UpdateMAMELine(EntryString, GetBooleanValue(Samples.Checked))
         else
         if (tmpEntryStr = 'volume ') or
            (tmpEntryStr = 'vol ') then
            UpdateMAMELine(EntryString, IntToStr(Volume.Position))
         else
         // # CORE INPUT OPTIONS
         if tmpEntryStr = 'mouse ' then
            UpdateMAMELine(EntryString, GetBooleanValue(Mouse.Checked))
         else
         if (tmpEntryStr = 'joystick ') or
            (tmpEntryStr = 'joy ') then
            UpdateMAMELine(EntryString, GetBooleanValue(Joystick.Checked))
         else
         
         // # CORE MISC OPTIONS
         if (tmpEntryStr = 'cheat ') or
            (tmpEntryStr = 'c ') then
            UpdateMAMELine(EntryString, GetBooleanValue(Cheat.Checked))
         else
         if tmpEntryStr = 'skip_gameinfo ' then
            UpdateMAMELine(EntryString, GetBooleanValue(SkipGameInfo.Checked))
         else

         // # WINDOWS VIDEO OPTIONS
         if (tmpEntryStr = 'window ') or
            (tmpEntryStr = 'w ') then
            UpdateMAMELine(EntryString, GetBooleanValue(WindowMode.Checked))
         else
         if (tmpEntryStr = 'maximize ') or
            (tmpEntryStr = 'max ') then
            UpdateMAMELine(EntryString, GetBooleanValue(MaximizeWindow.Checked))
         else
         if (tmpEntryStr = 'keepaspect ') or
            (tmpEntryStr = 'ka') then
            UpdateMAMELine(EntryString, GetBooleanValue(KeepAspectRatio.Checked))
         else
         if (tmpEntryStr = 'waitvsync ') or
            (tmpEntryStr = 'vs ') then
            UpdateMAMELine(EntryString, GetBooleanValue(WaitVerticalSync.Checked))
         else
         if (tmpEntryStr = 'syncrefresh ') or
            (tmpEntryStr = 'srf ') then
            UpdateMAMELine(EntryString, GetBooleanValue(SyncronizeRefreshRate.Checked))
         else
         
         // # DIRECTDRAW-SPECIFIC OPTIONS
         if (tmpEntryStr = 'hwstretch ') or
            (tmpEntryStr = 'hws ') then
            UpdateMAMELine(EntryString, GetBooleanValue(HardwareStretch.Checked))
         else

         // # PER-WINDOW VIDEO OPTIONS
         if (tmpEntryStr = 'resolution ') or
            (tmpEntryStr = 'r ') then
            SetScreenResolution(EntryString)
         else
         if tmpEntryStr = 'refresh ' then
            begin
              Value:= cRefreshRate;
              if Value = 'auto' then
                 Value:= '0';
              UpdateMAMELine(EntryString, Value);
            end
         else
         // # FULL SCREEN OPTIONS
         if (tmpEntryStr = 'triplebuffer ') or
            (tmpEntryStr = 'tb ') then
            UpdateMAMELine(EntryString, GetBooleanValue(TripleBuffer.Checked))
         else
         if tmpEntryStr = 'switchres ' then
            UpdateMAMELine(EntryString, GetBooleanValue(SwitchResolution.Checked));
       end;
  end;
  case CustomGameOption of
    True:
      begin
        try
          if GameIniFile.Count > 0 then
             GameIniFile.SaveToFile(customIni);
        finally
          FreeAndNil(GameIniFile);
          for Loop:=Low(IniCustomList) to (ActiveFileID-1) do
              FreeandNil(IniCustomList[Loop]);
        end;
      end;
    False:
      begin
        try
          MAMEIniFile.SaveToFile(emuIni);
        finally
        end;
      end;
  end;
  FreeAndNil(MAMEIniFile);
end;

procedure TFormMAMESettings_SimpleMode.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  CanClose:= not FormMain.ELV_IsEditing(FolderROMs);
  if CanClose then
     begin
       if ModalResult = mrOk then
          begin
            FormMain.PopupCustomMAME.Tag:= Ord(SaveValidateAllCustomFiles.Checked);
            WriteMAMEIniFile(GameIni, Boolean(Tag));// update all mame.ini options
          end;
       SetCurrentDir(FormMain.FrontendPath);
     end;
end;

procedure TFormMAMESettings_SimpleMode.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #27 then
     ButtonCancel.Click;
end;

function TFormMAMESettings_SimpleMode.GetCustomIniFile(FileID: ShortInt): String;
begin
  Result:= '';
  case FileID of
     1: Result:= 'debug';
     2:
       begin
         if FormMain.MemGameInfo.eScreenOrientation = 1 then
            Result:= 'vertical';
       end;
     3:
       begin
         if FormMain.MemGameInfo.eScreenOrientation = 0 then
            Result:= 'horizont';
       end;
     4: Result:= 'arcade';   // UME only
     5: Result:= 'console';  // UME only
     6: Result:= 'computer'; // UME only
     7: Result:= 'othersys'; // othersys // systype_ini ?????? UME only
     8:
       begin
         if FormMain.MemGameInfo.eScreenType = 1 then
            Result:= 'vector';
       end;
     9: Result:= ChangeFileExt(FormMain.MemGameInfo.eDriverName, ''); // source\sourcefile.ini or sourcefile.ini // source_ini
    10: Result:= FormMain.MemGameInfo.eBiosName; // biosname.ini   // grandparent_ini
    11: Result:= FormMain.MemGameInfo.eClone;    // parentgame.ini // parent_ini (if current game is clone)
    12: Result:= FormMain.MemGameInfo.eName;     // gamename.ini   // driver_ini
  end;
end;

// IniFileList: packed array[1..12] of THashedStringList;
procedure TFormMAMESettings_SimpleMode.LoadIniToStringList(FileID: ShortInt; var ListHolder: THashedStringList);
var
  //mameFile: THashedStringList;
  Loop, iPos: Integer;
  strLine, strFile, FileFolder: String;
begin
  strFile:= GetCustomIniFile(FileID);
  if strFile = '' then
     Exit;

  if IsAlterMAME then
     FileFolder:= FormMain.AlterMAMEIniFilesDir
  else
     FileFolder:= FormMain.IniFilesDir[sysID];

  if FileID = 9 then
     begin
       // for driver (source\drivername.ini or drivername.ini)
       if FileExists(FileFolder+strFile+'.ini') then
          strFile:= FileFolder+strFile+'.ini'
       else
          strFile:= FileFolder+'source\'+strFile+'.ini';
     end
  else
     strFile:= FileFolder+strFile+'.ini';

  if not FileExists(strFile) then
     Exit;

  ListHolder:= THashedStringList.Create;
  ListHolder.LoadFromFile(strFile);
  //ShowMessage(ListHolder.Text);
  ListHolder.BeginUpdate;
  for Loop:=0 to ListHolder.Count-1 do
  begin
    strLine:= TrimLeft(ListHolder[Loop]);
    if strLine <> '' then
       if strLine[1] <> '#' then
          begin
            iPos:= Pos(' ', strLine);
            if iPos <> 0 then
               ListHolder[Loop]:= Copy(strLine, 1, iPos-1)+'='+Trim(Copy(strLine, iPos, Length(strLine)));
          end;
  end;
  ListHolder.EndUpdate;
  //ShowMessage(ListHolder.Text);
  //ListHolder.SaveToFile('D:\emulators\mame\ume\ume-modified-for-emuloader.ini');
  //FreeAndNil(mameFile);
end;

procedure TFormMAMESettings_SimpleMode.LoadCustomSettingsFiles;
var
  Loop: ShortInt;
  strFile, FileFolder: String;
begin
  if ActiveFileID = -1 then
     Exit;

  for Loop:= 1 to 12 do
  begin
    if Loop < ActiveFileID  then
    begin
      strFile:= GetCustomIniFile(Loop);
      if strFile <> '' then
      begin
        if IsAlterMAME then
           FileFolder:= FormMain.AlterMAMEIniFilesDir
        else
           FileFolder:= FormMain.IniFilesDir[sysID];

        if Loop = 9 then
           begin
             if FileExists(FileFolder+strFile+'.ini') then
                strFile:= FileFolder+strFile+'.ini'
             else
                strFile:= FileFolder+'source\'+strFile+'.ini';
           end
        else
           strFile:= FileFolder+strFile+'.ini';

        ReadMAMEIniFile(strFile); // read all gamename.ini options
      end;
    end
    else
       Break;
  end;
  
  ReadMAMEIniFile(GameIni); // read all gamename.ini options
end;

procedure TFormMAMESettings_SimpleMode.ButtonReadFileClick(Sender: TObject);
begin
  ReadMAMEIniFile(emuIni, True); // read all mame.ini options
  if Tag = 1 then
     LoadCustomSettingsFiles;
     //ReadMAMEIniFile(GameIni); // read all gamename.ini options
  //ScreensSelector.OnSelect(Self);
end;

procedure TFormMAMESettings_SimpleMode.FolderROMsButtonSelectClick(
  Sender: TObject);
begin
  FormMain.DialogSelectMultiFolders(FolderROMs);
end;

procedure TFormMAMESettings_SimpleMode.FolderSamplesButtonSelectClick(
  Sender: TObject);
begin
  FormMain.DialogSelectFolder(FolderSamples, True);
end;

procedure TFormMAMESettings_SimpleMode.FolderInputDeviceLogsButtonSelectClick(
  Sender: TObject);
begin
  FormMain.DialogSelectFolder(FolderInputDeviceLogs, False);
end;

procedure TFormMAMESettings_SimpleMode.FolderGameSnapshotsButtonSelectClick(
  Sender: TObject);
begin
  FormMain.DialogSelectFolder(FolderGameSnapshots, False);
end;

procedure TFormMAMESettings_SimpleMode.FolderROMsButtonClearClick(
  Sender: TObject);
begin
  FormMain.ClearListView(FolderROMs);
end;

procedure TFormMAMESettings_SimpleMode.VolumeChange(Sender: TObject);
begin
  LabelVolume.Caption:= Format(LabelVolume.Hint, [Volume.Position]);
end;

procedure TFormMAMESettings_SimpleMode.VectorBeamWidthChange(Sender: TObject);
begin
  LabelVectorBeamWidth.Caption:= Format(LabelVectorBeamWidth.Hint, [VectorBeamWidth.Position]);
end;

procedure TFormMAMESettings_SimpleMode.VectorFlickerEffectChange(Sender: TObject);
begin
  LabelVectorFlickerEffect.Caption:= Format(LabelVectorFlickerEffect.Hint, [VectorFlickerEffect.Position]);
end;

procedure TFormMAMESettings_SimpleMode.FolderROMsButtonEditClick(
  Sender: TObject);
begin
  FormMain.ELV_EnableEdit(FolderROMs);
end;

procedure TFormMAMESettings_SimpleMode.FolderROMsButtonDeleteClick(
  Sender: TObject);
begin
  FormMain.ELV_DeleteSelected(FolderROMs);
end;

procedure TFormMAMESettings_SimpleMode.FormShow(Sender: TObject);
var
  iStr: String;
begin
  VectorGroupBox.DoubleBuffered:= True;
  PerformanceGroupBox.DoubleBuffered:= True;
  GroupBoxAudio.DoubleBuffered:= True;
  FullScreenBox.DoubleBuffered:= True;

  {SDLOutputModeBox.DoubleBuffered:= True;
  GLSL_GroupBox.DoubleBuffered:= True;
  SDLLowLevelDriver.DoubleBuffered:= True;
  SDKKeyboardMappingBox.DoubleBuffered:= True;
  SDLJoystickMappingBox.DoubleBuffered:= True;
  SDLLightgunMappingBox.DoubleBuffered:= True;
  SDL2MouseMappingBox.DoubleBuffered:= True;
  SDL2KeyboardMappingBox.DoubleBuffered:= True;}

  FormMain.ELV_ResetNormalColors(FolderROMs);
  FormMain.ELV_ResetNormalColors(FolderIniFiles);
  FormMain.ELV_ResetNormalColors(FolderArtworks);

  SaveValidateAllCustomFiles.Checked:= Boolean(FormMain.PopupCustomMAME.Tag);
  if IsAlterMAME then
     FormMAMESettings_SimpleMode.Caption:= 'AlterMAME '+FormMAMESettings_SimpleMode.Caption;
  IsSDLMAME:= False;

  case SystemIcon.Tag of
    0: LabelGameTitle.Caption:= FormMain.GetGameSysTitle(Tag = 1, sysID, IsAlterMAME);
    1: LabelGameTitle.Caption:= FormMain.GetGameSysTitle(False, sysID, IsAlterMAME);
  end;

  if (Tag = 0) or (SystemIcon.Tag = 1) then
     begin
       case IsAlterMAME of
         True : LabelEmulatorVersion.Caption:= FormMain.AlterMAMEFile+#13#10+emuIni;//GameIni;//LabelReadFileIni.Caption;
         False: LabelEmulatorVersion.Caption:= FormMain.EmulatorFile[sysID]+#13#10+emuIni;//GameIni;//LabelReadFileIni.Caption;
       end;
       //LabelReadFileIni.Visible:= False;
       case sysID of
         idMAME  : TopBar.Color1:= clSkyBlue; // MAME
         idHBMAME: TopBar.Color1:= $00b4bf8f;//$00bfb490; // HBMAME
       end;
       FormMain.IL_ArcadeSystem_ExtraLarge.GetIcon(sysID, SystemIcon.Picture.Icon);
       FormMain.LoadMessageIcon(GameIcon, 'info.ico');

       //FormMain.IL_Systems.GetIcon(sysID, SystemIcon.Picture.Icon);
       //FormMain.LoadMessageIcon(GameIcon, 'info.ico');
       LabelGameStatus.Visible:= False;

       // custom settings only. folders settings are only available when configuring MAME/HBMAME main settings (mame.ini; ume.ini; hbmame.ini)
       if SystemIcon.Tag = 1 then
          ButtonPageFolders.Visible:= False;
     end
  else
  if Tag = 1 then
     begin
       case IsAlterMAME of
         True : iStr:= FormMain.AlterMAMEVersion;
         False: iStr:= FormMain.EmulatorVersion[sysID];
       end;
       if iStr <> '' then
          LabelEmulatorVersion.Caption:= iStr
       else
          LabelEmulatorVersion.Caption:= '';

       //if FormMain.EmulatorVersion[sysID] <> '' then
       //   LabelEmulatorVersion.Caption:= FormMain.EmulatorVersion[sysID]
       //else
       //   LabelEmulatorVersion.Caption:= '';

       if LabelEmulatorVersion.Caption = '' then
          LabelEmulatorVersion.Caption:= 'name: '+FormMain.StatusBar_GamesGameName.Caption
       else
          LabelEmulatorVersion.Caption:= 'name: '+FormMain.StatusBar_GamesGameName.Caption+#13#10+
                                         LabelEmulatorVersion.Caption;

       LabelGameStatus.Caption:= LabelGameStatus.Hint+#13#10+FormMain.GetGameStatusText(FormMain.MemGameInfo.eGameSetStatus, FormMain.MemGameInfo.eROMIdentification);

       FormMain.IL_StandardIconsExtraLarge.GetIcon(FormMain.MemGameInfo.eROMIdentification, SystemIcon.Picture.Icon);
       FormMain.IL_ArcadeSystem_Small.GetIcon(FormMain.MemGameInfo.eSystemID, GameIcon.Picture.Icon);

       //FormMain.LoadGameIDThumbIcon(SystemIcon, FormMain.MemGameInfo.eROMIdentification);
       //FormMain.IL_ArcadeSystem_Large.GetIcon(sysID, GameIcon.Picture.Icon);
       case FormMain.MemGameInfo.eGameSetStatus of
         0: TopBar.Color1:= $00f0fae5; //green
         1: TopBar.Color1:= $00e5f0fa; // red (based on green)
         2: TopBar.Color1:= $00eeeeee; // silver (base on green)
       end;
       // custom settings only. folders settings are only available when configuring MAME/HBMAME main settings (mame.ini; ume.ini; hbmame.ini)
       ButtonPageFolders.Visible:= False;
     end;

  ButtonResetToDefault.Visible:= not ButtonPageFolders.Visible;
  if not ButtonResetToDefault.Visible then
     begin
       ButtonReadFileHelp.Visible:= False;
       //LabelReadFileIni.Left:= 109;
       //LabelReadFileIni.Width:= LabelReadFileIni.Width+130;
     end;
  CheckOldResolutionEntry;
  ButtonReadFile.Click;

  Screen.Cursor:= crDefault;
end;

procedure TFormMAMESettings_SimpleMode.FolderNVRAMButtonSelectClick(Sender: TObject);
begin
  FormMain.DialogSelectFolder(FolderNVRAM, False);
end;

procedure TFormMAMESettings_SimpleMode.FolderROMsKeyAction(
  Sender: TCustomEasyListview; var CharCode: Word; var Shift: TShiftState;
  var DoDefault: Boolean);
begin
  case CharCode of
    VK_F2: FolderROMsButtonEdit.Click;
    VK_DELETE: FolderROMsButtonDelete.Click;
  end;
end;

procedure TFormMAMESettings_SimpleMode.FolderROMsItemEditEnd(
  Sender: TCustomEasyListview; Item: TEasyItem);
begin
  FormMain.ELV_SetEditManager(TEasyListView(Sender), False);
end;

procedure TFormMAMESettings_SimpleMode.FolderROMsItemEdited(
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

procedure TFormMAMESettings_SimpleMode.FolderROMsButtonUpClick(Sender: TObject);
begin
  FormMain.ELV_MoveItem(FolderROMs, Boolean(TBitBtn(Sender).Tag));
end;

procedure TFormMAMESettings_SimpleMode.FolderArtworksKeyAction(
  Sender: TCustomEasyListview; var CharCode: Word; var Shift: TShiftState;
  var DoDefault: Boolean);
begin
  case CharCode of
    VK_F2: FolderArtworksButtonEdit.Click;
    VK_DELETE: FolderArtworksButtonDelete.Click;
  end;
end;

procedure TFormMAMESettings_SimpleMode.FolderArtworksButtonUpClick(Sender: TObject);
begin
  FormMain.ELV_MoveItem(FolderArtworks, Boolean(TBitBtn(Sender).Tag));
end;

procedure TFormMAMESettings_SimpleMode.FolderArtworksButtonSelectClick(
  Sender: TObject);
begin
  FormMain.DialogSelectMultiFolders(FolderArtworks);
end;

procedure TFormMAMESettings_SimpleMode.FolderArtworksButtonEditClick(Sender: TObject);
begin
  FormMain.ELV_EnableEdit(FolderArtworks);
end;

procedure TFormMAMESettings_SimpleMode.FolderArtworksButtonDeleteClick(
  Sender: TObject);
begin
  FormMain.ELV_DeleteSelected(FolderArtworks);
end;

procedure TFormMAMESettings_SimpleMode.FolderArtworksButtonClearClick(
  Sender: TObject);
begin
  FormMain.ClearListView(FolderArtworks);
end;

procedure TFormMAMESettings_SimpleMode.ButtonPageFoldersClick(Sender: TObject);
begin
  NotebookPages.PageIndex:= TToolButton(Sender).Tag;
  if ToolBarPages.Tag <> NotebookPages.PageIndex then
     ToolBarPages.Buttons[ToolBarPages.Tag].ImageIndex:= 500;
  ToolBarPages.Tag:= TToolButton(Sender).Tag;
  TToolButton(Sender).ImageIndex:= 1;
end;

procedure TFormMAMESettings_SimpleMode.ButtonResetToDefaultClick(Sender: TObject);
begin
  ReadMAMEIniFile(emuIni, True); // read all mame.ini options
end;

procedure TFormMAMESettings_SimpleMode.ButtonReadFileHelpClick(Sender: TObject);
begin
  CallMessageBox;
  FormMain.AddMsgText('    Button ');
  FormMain.AddMsgText('Reload Settings', $00a65300, [fsBold]);
  FormMain.AddMsgText(' will load a list of custom files one by one, overwriting settings from the previous one.'+
                      ' MAME does this when loading games.'+#13#10);
  FormMain.AddMsgText('- mame.ini; ume.ini; hbmame.ini; emufilename.ini'+#13#10+
                      '- debug.ini'+#13#10+
                      '- vertical.ini (if screen game is vertical)'+#13#10+
                      '- horizont.ini (if screen game is horizontal)'+#13#10+
                      '- arcade.ini (UME only)'+#13#10+
                      '- console.ini (UME only)'+#13#10+
                      '- computer.ini (UME only)'+#13#10+
                      '- othersys.ini (UME only; this filename and its purpose is a mistery to me!)'+#13#10+
                      '- vector.ini (if game is vector)'+#13#10+
                      '- source\sourcefile.ini or sourcefile.ini'+#13#10+
                      '- biosname.ini'+#13#10+
                      '- parentgame.ini (if current game is clone)'+#13#10+
                      '- gamename.ini'+#13#10+#13#10);
  FormMain.AddMsgText('    Button ');
  FormMain.AddMsgText('Reset to Default', $00a65300, [fsBold]);
  FormMain.AddMsgText(' will only load emulator default settings: mame.ini; ume.ini; hbmame.ini; ignoring everything else.');
  GenerateMessage('Help', 'Why two reload buttons ?');
end;

procedure TFormMAMESettings_SimpleMode.FolderIniFilesButtonUpClick(
  Sender: TObject);
begin
  FormMain.ELV_MoveItem(FolderIniFiles, Boolean(TBitBtn(Sender).Tag));
end;

procedure TFormMAMESettings_SimpleMode.FolderIniFilesButtonSelectClick(
  Sender: TObject);
begin
  FormMain.DialogSelectMultiFolders(FolderIniFiles);
end;

procedure TFormMAMESettings_SimpleMode.FolderIniFilesButtonEditClick(
  Sender: TObject);
begin
  FormMain.ELV_EnableEdit(FolderIniFiles);
end;

procedure TFormMAMESettings_SimpleMode.FolderIniFilesButtonDeleteClick(
  Sender: TObject);
begin
  FormMain.ELV_DeleteSelected(FolderIniFiles);
end;

procedure TFormMAMESettings_SimpleMode.FolderIniFilesButtonClearClick(
  Sender: TObject);
begin
  FormMain.ClearListView(FolderIniFiles);
end;

procedure TFormMAMESettings_SimpleMode.FolderIniFilesKeyAction(
  Sender: TCustomEasyListview; var CharCode: Word; var Shift: TShiftState;
  var DoDefault: Boolean);
begin
  case CharCode of
    VK_F2: FolderIniFilesButtonEdit.Click;
    VK_DELETE: FolderIniFilesButtonDelete.Click;
  end;
end;

procedure TFormMAMESettings_SimpleMode.SaveValidateAllCustomFilesClick(
  Sender: TObject);
begin
  if SaveValidateAllCustomFiles.Checked then
     SaveValidateAllCustomFiles.Font.Color:= clBlue
  else
     SaveValidateAllCustomFiles.Font.Color:= $00323232;
end;

procedure TFormMAMESettings_SimpleMode.ButtonHelpSaveValidateAllCustomFilesClick(
  Sender: TObject);
begin
  CallMessageBox;
  FormMain.AddMsgText('    This feature is used only when saving custom settings.'+#13#10+#13#10);
  FormMain.AddMsgText('Disabled / Unchecked'+#13#10+#13#10, $00a65300, [fsItalic], taCenter);
  FormMain.AddMsgText('    Custom settings are validated only against emulator default settings ');
  FormMain.AddMsgText('(mame.ini; ume.ini; hbmame.ini; emufilename.ini)', clBlack, [fsItalic]);
  FormMain.AddMsgText(', ignoring all custom files.'+#13#10+
                      'This is the old frontend''s saving method and I for one, prefer this way.'+#13#10+#13#10);
  FormMain.AddMsgText('Enabled / Checked'+#13#10+#13#10, $00a65300, [fsItalic], taCenter);
  FormMain.AddMsgText('    It will keep custom settings files clean and avoid duplicated settings across files. '+
                      'All files will be scanned accordingly ');
  FormMain.AddMsgText('(debug.ini; vector.ini; drivername.ini; etc)', clBlack, [fsItalic]);
  FormMain.AddMsgText('.'+#13#10+'    There''s one major downside. Say you have settings in ');
  FormMain.AddMsgText('drivername.ini', clBlack, [fsItalic]);
  FormMain.AddMsgText(' and ');
  FormMain.AddMsgText('gamename.ini', clBlack, [fsItalic]);
  FormMain.AddMsgText('. Then you decide to delete ');
  FormMain.AddMsgText('drivername.ini', clBlack, [fsItalic]);
  FormMain.AddMsgText('. All its settings will be lost as they are not listed in later files, '+
                      'forcing you to set them again in ');
  FormMain.AddMsgText('gamename.ini', clBlack, [fsItalic]);
  FormMain.AddMsgText('.'+#13#10+#13#10+'In doubt, keep this feature ');
  FormMain.AddMsgText('disabled/unchecked.', clBlack, [fsItalic]);

  GenerateMessage('Help', 'Validate All Custom Files on Save');
end;

procedure TFormMAMESettings_SimpleMode.FormActivate(Sender: TObject);
begin
  SaveValidateAllCustomFiles.Visible:= not ButtonPageFolders.Visible;
  ButtonHelpSaveValidateAllCustomFiles.Visible:= SaveValidateAllCustomFiles.Visible;
  if not ButtonPageFolders.Visible then
     begin
       ToolBarPages.Width:= ToolBarPages.Width-ButtonPageFolders.Width;
       ToolBarPages.Left:= ToolBarPages.Left+ButtonPageFolders.Width;
       ButtonPageVideo1.Down:= True;
       ButtonPageVideo1.Click;
     end;
end;

procedure TFormMAMESettings_SimpleMode.FrameskipChange(Sender: TObject);
begin
  LabelFrameskip.Caption:= IntToStr(Frameskip.Position);
end;

end.
