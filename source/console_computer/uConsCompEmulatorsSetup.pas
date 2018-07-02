unit uConsCompEmulatorsSetup;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, ComCtrls, StdCtrls, IniFiles, FileCtrl, Menus, uCommon,
  uCommonCustom,
  MPCommonObjects, EasyListview, ExtCtrls, ShadowLabel, PanelEx,
  AdvOfficeButtons, ImgList;

type
  TFormConsCompEmulatorsSetup = class(TForm)
    PanelEmulators: TPanelEx;
    LabelEmulatorFile: TShadowLabel;
    LabelEmuTitle: TShadowLabel;
    LabelEmuCartridgeParameter: TShadowLabel;
    LabelEmuDiscImageParameter: TShadowLabel;
    LabelEmuBootDiscParameter: TShadowLabel;
    ButtonClearEmulator: TBitBtn;
    LabelDaemonToolsFile: TShadowLabel;
    LabelDaemonToolsMount: TShadowLabel;
    LabelDaemonToolsUnmount: TShadowLabel;
    ButtonDaemonToolsHelp: TBitBtn;
    Systems: TEasyListview;
    DaemonToolsFile: TEdit;
    ButtonSelectDaemonTools: TBitBtn;
    DaemonToolsMount: TEdit;
    DaemonToolsUnmount: TEdit;
    EmulatorFile: TEdit;
    ButtonSelectEmulator: TBitBtn;
    EmuDescription: TEdit;
    EmuCartridgeParameter: TEdit;
    EmuDiscImageParameter: TEdit;
    EmuBootDiscParameter: TEdit;
    LabelEmuFloppyDiskParameter: TShadowLabel;
    LabelEmuCassetteTapeParameter: TShadowLabel;
    EmuFloppyDiskParameter: TEdit;
    EmuCassetteTapeParameter: TEdit;
    LabelEmuCartridgeParameter1: TShadowLabel;
    LabelEmuCartridgeParameter2: TShadowLabel;
    EmuCartridgeParameter2: TEdit;
    LabelEmuDiscImageParameter1: TShadowLabel;
    LabelEmuDiscImageParameter2: TShadowLabel;
    EmuDiscImageParameter2: TEdit;
    LabelEmuBootDiscParameter1: TShadowLabel;
    LabelEmuBootDiscParameter2: TShadowLabel;
    EmuBootDiscParameter2: TEdit;
    LabelEmuFloppyDiskParameter1: TShadowLabel;
    LabelEmuFloppyDiskParameter2: TShadowLabel;
    EmuFloppyDiskParameter2: TEdit;
    LabelEmuCassetteTapeParameter1: TShadowLabel;
    LabelEmuCassetteTapeParameter2: TShadowLabel;
    EmuCassetteTapeParameter2: TEdit;
    IconCartridge: TImage;
    IconDiscImage: TImage;
    IconBootDisc: TImage;
    IconFloppyDisk: TImage;
    IconCassetteTape: TImage;
    EmuIcon: TImage;
    IL_EmulatorIcon: TImageList;
    EmuIconFrame: TBevel;
    VirtualDriveIconFrame: TBevel;
    VirtualDriveIcon: TImage;
    PanelBottomButtons: TPanelEx;
    ButtonInstructions: TBitBtn;
    ButtonOk: TBitBtn;
    ButtonCancel: TBitBtn;
    IconCartridgeReset: TImage;
    IconDiscImageReset: TImage;
    IconBootDiscReset: TImage;
    IconFloppyDiskReset: TImage;
    IconCassetteTapeReset: TImage;
    ButtonSelectFolders: TBitBtn;
    Emulator1PageButton: TSpeedButton;
    Emulator2PageButton: TSpeedButton;
    Emulator3PageButton: TSpeedButton;
    Emulator4PageButton: TSpeedButton;
    Bevel1: TBevel;
    IL_Systems: TImageList;
    LabelEmuHardDiskDriveParameter: TShadowLabel;
    LabelEmuHardDiskDriveParameter1: TShadowLabel;
    LabelEmuHardDiskDriveParameter2: TShadowLabel;
    IconHardDiskDrive: TImage;
    IconHardDiskDriveReset: TImage;
    EmuHardDiskDriveParameter: TEdit;
    EmuHardDiskDriveParameter2: TEdit;
    BitBtn1: TBitBtn;
    PanelSystemTitle: TPanelEx;
    LabelSystemTitle: TShadowLabel;
    LabelSystemType: TShadowLabel;
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure EmulatorFileChange(Sender: TObject);
    procedure EmuDescriptionChange(Sender: TObject);
    procedure ButtonClearEmulatorClick(Sender: TObject);
    procedure ButtonSelectEmulatorClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure EmuCartridgeParameterChange(Sender: TObject);
    procedure EmuBootDiscParameterChange(Sender: TObject);
    procedure EmuDiscImageParameterChange(Sender: TObject);
    procedure ButtonInstructionsClick(Sender: TObject);
    procedure SystemsItemSelectionChanged(
      Sender: TCustomEasyListview; Item: TEasyItem);
    procedure DaemonToolsFileChange(Sender: TObject);
    procedure DaemonToolsMountChange(Sender: TObject);
    procedure DaemonToolsUnmountChange(Sender: TObject);
    procedure ButtonSelectDaemonToolsClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure ButtonDaemonToolsHelpClick(Sender: TObject);
    procedure ButtonSelectFoldersClick(Sender: TObject);
    procedure EmuFloppyDiskParameterChange(Sender: TObject);
    procedure EmuCassetteTapeParameterChange(Sender: TObject);
    procedure EmuCartridgeParameter2Change(Sender: TObject);
    procedure EmuDiscImageParameter2Change(Sender: TObject);
    procedure EmuBootDiscParameter2Change(Sender: TObject);
    procedure EmuFloppyDiskParameter2Change(Sender: TObject);
    procedure EmuCassetteTapeParameter2Change(Sender: TObject);
    procedure IconCartridgeResetMouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure IconCartridgeResetMouseUp(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure Emulator1PageButtonClick(Sender: TObject);
    procedure IconCartridgeResetClick(Sender: TObject);
    procedure EmuHardDiskDriveParameterChange(Sender: TObject);
    procedure EmuHardDiskDriveParameter2Change(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure SystemsItemPaintText(Sender: TCustomEasyListview;
      Item: TEasyItem; Position: Integer; ACanvas: TCanvas);
  private
    { Private declarations }
    newEmulatorFileCustom,
    newEmulatorVersionCustom,

    newEmuCartridgeParameterCustom,
    newEmuDiscImageParameterCustom,
    newEmuLoadFromDiscCustom,
    newEmuFloppyDiskParameterCustom,
    newEmuCassetteTapeParameterCustom,
    newEmuHardDiskDriveParameterCustom,

    newEmuCartridgeParameter2Custom,
    newEmuDiscImageParameter2Custom,
    newEmuLoadFromDisc2Custom,
    newEmuFloppyDiskParameter2Custom,
    newEmuCassetteTapeParameter2Custom,
    newEmuHardDiskDriveParameter2Custom: packed array[1..MaxConsoleComputerSystems] of packed array[1..4] of String;

    newVirtualDriveFile, newVirtualDriveMount, newVirtualDriveUnmount: String;

    EmuParametersCustom, EmuDefaultParametersCustom: TMemIniFile;

    procedure ResizeForm;

    function  SetEmulatorIcon(sysID, EmulatorIndex: Integer): Integer;
    function  SetVirtualDriveIcon(const vtFileName: String): Integer;
    procedure SetResetParameterIcon(IconHolder: TImage; ButtonPressed: Boolean = False);

    procedure UpdateMemParameter(EditHolder: TEdit; var MemVarParameter: String);

    function  GetEmuNameParametersIni(sysID, MediaTypeID: Integer; const EmulatorFileName: String; var KeysListHolder: TStringList; CheckDefaultIni: Boolean): String;
    procedure ReadEmuParameters(EmulatorIndex: ShortInt);
    procedure ResetParametersToDefault(ParameterTag: ShortInt);
    procedure ShowEmulatorDetails(EmulatorIndex: Byte);

    function  ReadFromIni(emulatorStr: String; sysID, EmulatorIndex, MediaTypeID: Integer; var Parameter1Var, Parameter2Var: String; ResetToDefault: Boolean = False): Boolean;
    procedure LoadEmuParameter(SystemID: Integer; EmulatorIndex: ShortInt);
    procedure LoadEmuParametersToRAM;

    procedure InitializeEmulatorVariablesTemp;
    procedure ToggleControls(const sysID: Integer);
    procedure UpdateEmulatorInfo;
  public
    { Public declarations }
  end;

var
  FormConsCompEmulatorsSetup: TFormConsCompEmulatorsSetup;

implementation

uses uMain;

{$R *.dfm}

function TFormConsCompEmulatorsSetup.GetEmuNameParametersIni(sysID, MediaTypeID: Integer; const EmulatorFileName: String; var KeysListHolder: TStringList; CheckDefaultIni: Boolean): String;
var
  emuStr, LineStr, mediaTypeStr: String;
  Loop: Integer;
  IniToRead: TMemIniFile;
begin
  Result:= '';
  emuStr:= ChangeFileExt(ExtractFileName(EmulatorFileName), '');

  mediaTypeStr:= GetMediaTypeName(MediaTypeID, 1, True);
  //ShowMessage('emulator: '+Result+#13#10+
  //'section: '+SystemsList[sysID, 0]+#13#10+
  //'entry: '+Result+mediaTypeStr); // for debug only... do not delete, do not uncomment
  if CheckDefaultIni then
     IniToRead:= EmuDefaultParametersCustom
  else
     IniToRead:= EmuParametersCustom;

  if IniToRead.ValueExists(SystemsListCustom[sysID, 0], emuStr+mediaTypeStr) then
     begin
       Result:= emuStr;
       Exit;
     end;

  // try to get an approximate
  KeysListHolder:= TStringList.Create;
  KeysListHolder.BeginUpdate;
  IniToRead.ReadSection(SystemsListCustom[sysID, 0], KeysListHolder);
  for Loop:= 0 to KeysListHolder.Count-1 do
  begin
    LineStr:= KeysListHolder[Loop];
    KeysListHolder[Loop]:= Copy(LineStr, 1, Pos(mediaTypeStr, LineStr)-1);
  end;
  KeysListHolder.EndUpdate;

  for Loop:=0 to KeysListHolder.Count-1 do
  begin
    if Pos(KeysListHolder[Loop], emuStr) <> 0 then
       begin
         Result:= KeysListHolder[Loop];
         Break;
       end;
  end;
  FreeAndNil(KeysListHolder);
end;

procedure TFormConsCompEmulatorsSetup.ReadEmuParameters(EmulatorIndex: ShortInt);
begin
  LoadEmuParameter(Systems.Tag, EmulatorIndex);
  SetEmulatorIcon(Systems.Tag, EmulatorIndex);
  EmuDescription.Text:= newEmulatorVersionCustom[Systems.Tag, EmulatorIndex];
  EmuCartridgeParameter.Text:= newEmuCartridgeParameterCustom[Systems.Tag, EmulatorIndex];
  EmuDiscImageParameter.Text:= newEmuDiscImageParameterCustom[Systems.Tag, EmulatorIndex];
  EmuBootDiscParameter.Text:= newEmuLoadFromDiscCustom[Systems.Tag, EmulatorIndex];
  EmuFloppyDiskParameter.Text:= newEmuFloppyDiskParameterCustom[Systems.Tag, EmulatorIndex];
  EmuCassetteTapeParameter.Text:= newEmuCassetteTapeParameterCustom[Systems.Tag, EmulatorIndex];
  EmuHardDiskDriveParameter.Text:= newEmuHardDiskDriveParameterCustom[Systems.Tag, EmulatorIndex];

  EmuCartridgeParameter2.Text:= newEmuCartridgeParameter2Custom[Systems.Tag, EmulatorIndex];
  EmuDiscImageParameter2.Text:= newEmuDiscImageParameter2Custom[Systems.Tag, EmulatorIndex];
  EmuBootDiscParameter2.Text:= newEmuLoadFromDisc2Custom[Systems.Tag, EmulatorIndex];
  EmuFloppyDiskParameter2.Text:= newEmuFloppyDiskParameter2Custom[Systems.Tag, EmulatorIndex];
  EmuCassetteTapeParameter2.Text:= newEmuCassetteTapeParameter2Custom[Systems.Tag, EmulatorIndex];
  EmuHardDiskDriveParameter2.Text:= newEmuHardDiskDriveParameter2Custom[Systems.Tag, EmulatorIndex];
end;

procedure TFormConsCompEmulatorsSetup.ResetParametersToDefault(ParameterTag: ShortInt);
var
  //iParamStr: String;
  tempStr: String;
begin
  // to be used with the new "Reset to Default" buttons on each parameter TEdit boxes

  //iParamStr:= EmuDefaultParameters.ReadString(Systems.Tag,)
  //iParamStr:=ExtraDefaultParameters.ReadString(SystemsList[MemGameInfo.eSystemID, 0],
  //                                 ExtractFileName(ChangeFileExt(EmulatorString, ''))+
  //                                 GetMediaTypeName(mediaIdx, ParameterIndex, True), '');

  {if FormMain.SystemUseCartridge(Systems.Tag) then
     ReadFromIni(tempStr, Systems.Tag, PanelEmulators.Tag, 1, newEmuCartridgeParameter[Systems.Tag, PanelEmulators.Tag],
                                                              newEmuCartridgeParameter2[Systems.Tag, PanelEmulators.Tag]);

  if FormMain.SystemUseDisc(Systems.Tag) then
     ReadFromIni(tempStr, Systems.Tag, PanelEmulators.Tag, 2, newEmuDiscImageParameter[Systems.Tag, PanelEmulators.Tag],
                                                              newEmuDiscImageParameter2[Systems.Tag, PanelEmulators.Tag]);

  if FormMain.SystemUseFloppyDisk(Systems.Tag) then
     ReadFromIni(tempStr, Systems.Tag, PanelEmulators.Tag, 3, newEmuFloppyDiskParameter[Systems.Tag, PanelEmulators.Tag],
                                                              newEmuFloppyDiskParameter2[Systems.Tag, PanelEmulators.Tag]);

  if FormMain.SystemUseCassetteTape(Systems.Tag) then
     ReadFromIni(tempStr, Systems.Tag, PanelEmulators.Tag, 4, newEmuCassetteTapeParameter[Systems.Tag, PanelEmulators.Tag],
                                                              newEmuCassetteTapeParameter2[Systems.Tag, PanelEmulators.Tag]);}

  if newEmulatorFileCustom[Systems.Tag, PanelEmulators.Tag] = '' then
     Exit;

  case ParameterTag of
    1: // cartridge
      begin
        if ReadFromIni(tempStr, Systems.Tag, PanelEmulators.Tag, 1, newEmuCartridgeParameterCustom[Systems.Tag, PanelEmulators.Tag],
                                                                    newEmuCartridgeParameter2Custom[Systems.Tag, PanelEmulators.Tag], True) then
           begin
             EmuCartridgeParameter.Text:= newEmuCartridgeParameterCustom[Systems.Tag, PanelEmulators.Tag];
             EmuCartridgeParameter2.Text:= newEmuCartridgeParameter2Custom[Systems.Tag, PanelEmulators.Tag];
           end;

        //EmuCartridgeParameter.Text:= FormMain.  newEmuCartridgeParameter[Systems.Tag, EmulatorIndex];
      end;
    21, 22: // disc image, boot disc ... there is no way to read one without the other
      begin
        if ReadFromIni(tempStr, Systems.Tag, PanelEmulators.Tag, 2, newEmuDiscImageParameterCustom[Systems.Tag, PanelEmulators.Tag],
                                                                    newEmuDiscImageParameter2Custom[Systems.Tag, PanelEmulators.Tag], True) then
           begin
             EmuDiscImageParameter.Text:= newEmuDiscImageParameterCustom[Systems.Tag, PanelEmulators.Tag];
             EmuBootDiscParameter.Text:= newEmuLoadFromDiscCustom[Systems.Tag, PanelEmulators.Tag];

             EmuDiscImageParameter2.Text:= newEmuDiscImageParameter2Custom[Systems.Tag, PanelEmulators.Tag];
             EmuBootDiscParameter2.Text:= newEmuLoadFromDisc2Custom[Systems.Tag, PanelEmulators.Tag];
           end;
      end;
    3: // floppy disk
      begin
        if ReadFromIni(tempStr, Systems.Tag, PanelEmulators.Tag, 3, newEmuFloppyDiskParameterCustom[Systems.Tag, PanelEmulators.Tag],
                                                                    newEmuFloppyDiskParameter2Custom[Systems.Tag, PanelEmulators.Tag], True) then
           begin
             EmuFloppyDiskParameter.Text:= newEmuFloppyDiskParameterCustom[Systems.Tag, PanelEmulators.Tag];
             EmuFloppyDiskParameter2.Text:= newEmuFloppyDiskParameter2Custom[Systems.Tag, PanelEmulators.Tag];
           end;
      end;
    4: // cassette tape
      begin
        if ReadFromIni(tempStr, Systems.Tag, PanelEmulators.Tag, 4, newEmuCassetteTapeParameterCustom[Systems.Tag, PanelEmulators.Tag],
                                                                    newEmuCassetteTapeParameter2Custom[Systems.Tag, PanelEmulators.Tag], True) then
           begin
             EmuCassetteTapeParameter.Text:= newEmuCassetteTapeParameterCustom[Systems.Tag, PanelEmulators.Tag];
             EmuCassetteTapeParameter2.Text:= newEmuCassetteTapeParameter2Custom[Systems.Tag, PanelEmulators.Tag];
           end;
      end;
    5: // hard disk drive
      begin
        if ReadFromIni(tempStr, Systems.Tag, PanelEmulators.Tag, 5, newEmuHardDiskDriveParameterCustom[Systems.Tag, PanelEmulators.Tag],
                                                                    newEmuHardDiskDriveParameter2Custom[Systems.Tag, PanelEmulators.Tag], True) then
           begin
             EmuHardDiskDriveParameter.Text:= newEmuHardDiskDriveParameterCustom[Systems.Tag, PanelEmulators.Tag];
             EmuHardDiskDriveParameter2.Text:= newEmuHardDiskDriveParameter2Custom[Systems.Tag, PanelEmulators.Tag];
           end;
      end;

  end;
  //PanelEmulators.Tag is EmulatorIndex parameter
end;

procedure TFormConsCompEmulatorsSetup.ShowEmulatorDetails(EmulatorIndex: Byte);
begin
  EmuDescription.Text:= newEmulatorVersionCustom[Systems.Tag, PanelEmulators.Tag];
  EmulatorFile.Tag:= 1;
  EmulatorFile.Text:= newEmulatorFileCustom[Systems.Tag, PanelEmulators.Tag];
  EmulatorFile.Tag:= 0;
  EmulatorFile.OnChange(Self); // need to force the OnChange event to update info on screen
end;

function TFormConsCompEmulatorsSetup.ReadFromIni(emulatorStr: String; sysID, EmulatorIndex, MediaTypeID: Integer; var Parameter1Var, Parameter2Var: String; ResetToDefault: Boolean = False): Boolean;
var
  IniToRead: TMemIniFile;
  tempStr: String;
  emuFileStr: String;
  KeysList: TStringList;
begin
  Result:= Parameter1Var <> '';
  if (not Result) or ResetToDefault then
     begin
       case ResetToDefault of
         True:
           begin
             tempStr:= GetEmuNameParametersIni(sysID, MediaTypeID, ExtractFileName(newEmulatorFileCustom[sysID, EmulatorIndex]), KeysList, True);
             Result:= tempStr <> '';
             case Result of
               True : IniToRead:= EmuDefaultParametersCustom;
               False: Exit; // there is nothing to read... abort!!!
             end;
           end;
         False:
           begin
             tempStr:= GetEmuNameParametersIni(sysID, MediaTypeID, ExtractFileName(newEmulatorFileCustom[sysID, EmulatorIndex]), KeysList, False);
             if tempStr <> '' then
                IniToRead:= EmuParametersCustom
             else
             begin
               tempStr:= GetEmuNameParametersIni(sysID, MediaTypeID, ExtractFileName(newEmulatorFileCustom[sysID, EmulatorIndex]), KeysList, True);
               if tempStr <> '' then
                  IniToRead:= EmuDefaultParametersCustom
               else
               begin
                 tempStr:= ChangeFileExt(ExtractFileName(newEmulatorFileCustom[sysID, EmulatorIndex]), '');
                 IniToRead:= EmuParametersCustom;
               end;
             end;
           end;
       end;

       Parameter1Var:= IniToRead.ReadString(SystemsListCustom[sysID, 0],
                               tempStr+GetMediaTypeName(MediaTypeID, 1, True), '');
       Parameter2Var:= IniToRead.ReadString(SystemsListCustom[sysID, 0],
                               tempStr+GetMediaTypeName(MediaTypeID, 2, True), '');

       //showmessage('filename: '+tempStr+#13#10+tempStr+FormMain.GetMediaTypeName(MediaTypeID, 1, True)+#13#10+
       //            tempStr+FormMain.GetMediaTypeName(MediaTypeID, 2, True)); // for debug only...

       if MediaTypeID = 2 then
          begin
            // need to read LoadDISC parameter as well
            newEmuLoadFromDiscCustom[sysID, EmulatorIndex]:=
                     IniToRead.ReadString(SystemsListCustom[sysID, 0], tempStr+GetMediaTypeName(0, 1, True), '');
            newEmuLoadFromDisc2Custom[sysID, EmulatorIndex]:=
                     IniToRead.ReadString(SystemsListCustom[sysID, 0], tempStr+GetMediaTypeName(0, 2, True), '');
          end;
       emuFileStr:= tempStr;
     end;
end;

procedure TFormConsCompEmulatorsSetup.LoadEmuParameter(SystemID: Integer; EmulatorIndex: ShortInt);
var
  tempStr, iFileStr, iFileStr2: String;
begin
  if newEmulatorFileCustom[SystemID, EmulatorIndex] = '' then
     Exit;

  if SystemUseCartridge(SystemID) then
     ReadFromIni(tempStr, SystemID, EmulatorIndex, 1, newEmuCartridgeParameterCustom[SystemID, EmulatorIndex],
                                                      newEmuCartridgeParameter2Custom[SystemID, EmulatorIndex]);

  if SystemUseDisc(SystemID) then
     ReadFromIni(tempStr, SystemID, EmulatorIndex, 2, newEmuDiscImageParameterCustom[SystemID, EmulatorIndex],
                                                      newEmuDiscImageParameter2Custom[SystemID, EmulatorIndex]);

  if SystemUseFloppyDisk(SystemID) then
     ReadFromIni(tempStr, SystemID, EmulatorIndex, 3, newEmuFloppyDiskParameterCustom[SystemID, EmulatorIndex],
                                                      newEmuFloppyDiskParameter2Custom[SystemID, EmulatorIndex]);

  if SystemUseCassetteTape(SystemID) then
     ReadFromIni(tempStr, SystemID, EmulatorIndex, 4, newEmuCassetteTapeParameterCustom[SystemID, EmulatorIndex],
                                                      newEmuCassetteTapeParameter2Custom[SystemID, EmulatorIndex]);

  if SystemUseHardDiskDrive(SystemID) then
     ReadFromIni(tempStr, SystemID, EmulatorIndex, 5, newEmuHardDiskDriveParameterCustom[SystemID, EmulatorIndex],
                                                      newEmuHardDiskDriveParameter2Custom[SystemID, EmulatorIndex]);

  if newEmulatorVersionCustom[SystemID, EmulatorIndex] = '' then
     begin
       iFileStr:= ChangeFileExt(ExtractFileName(newEmulatorFileCustom[SystemID, EmulatorIndex]), ''); // actual emufilename.exe name
       iFileStr2:= tempStr; // approximate name if emufilename.exe not found
       tempStr:= EmuDefaultParametersCustom.ReadString('Emulator Title', iFileStr, '');
       if (tempStr = '') and (iFileStr <> iFileStr2) then
          begin
            tempStr:= EmuParametersCustom.ReadString('Emulator Title', iFileStr2, '');
            if tempStr = '' then
               tempStr:= EmuDefaultParametersCustom.ReadString('Emulator Title', iFileStr2, '');
          end;
       if tempStr = '' then
          tempStr:= iFileStr;
          
       newEmulatorVersionCustom[SystemID, EmulatorIndex]:= tempStr;
     end;
end;

procedure TFormConsCompEmulatorsSetup.LoadEmuParametersToRAM;
var
  LoopSys, LoopEmu: Integer;
begin
  // get emulator name to read from emulator_parameters.ini (will guess a filename if not found)
  for LoopSys:= 1 to MaxConsoleComputerSystems do
  begin
    for LoopEmu:= 1 to Length(newEmulatorFileCustom[LoopSys]) do
        LoadEmuParameter(LoopSys, LoopEmu);
  end;
end;

procedure TFormConsCompEmulatorsSetup.InitializeEmulatorVariablesTemp;
var
  Loop, Loop2: Integer;
begin
  // define values for all arrays or exception error will occur....
  try
    for Loop:= 1 to MaxConsoleComputerSystems do
    begin
      for Loop2:= 1 to Length(newEmulatorFileCustom[Loop]) do
      begin
        newEmulatorFileCustom[Loop, Loop2]:= EmulatorFileCustom[Loop, Loop2];
        newEmulatorVersionCustom[Loop, Loop2]:= EmulatorVersionCustom[Loop, Loop2];

        newEmuCartridgeParameterCustom[Loop, Loop2]:= '';
        newEmuDiscImageParameterCustom[Loop, Loop2]:= '';
        newEmuLoadFromDiscCustom[Loop, Loop2]:= '';
        newEmuFloppyDiskParameterCustom[Loop, Loop2]:= '';
        newEmuCassetteTapeParameterCustom[Loop, Loop2]:= '';
        newEmuHardDiskDriveParameterCustom[Loop, Loop2]:= '';

        newEmuCartridgeParameter2Custom[Loop, Loop2]:= '';
        newEmuDiscImageParameter2Custom[Loop, Loop2]:= '';
        newEmuLoadFromDisc2Custom[Loop, Loop2]:= '';
        newEmuFloppyDiskParameter2Custom[Loop, Loop2]:= '';
        newEmuCassetteTapeParameter2Custom[Loop, Loop2]:= '';
        newEmuHardDiskDriveParameter2Custom[Loop, Loop2]:= '';
      end;
    end;
    newVirtualDriveFile:= VirtualDriveFile;
    newVirtualDriveMount:= VirtualDriveMount;
    newVirtualDriveUnmount:= VirtualDriveUnmount;
  except
  end;
end;

procedure TFormConsCompEmulatorsSetup.UpdateEmulatorInfo;
var
  Loop: Byte;
  UpdateIniFile: Boolean;

  function WriteToIni(emulatorStr, ParameterVar: String; sysID, MediaTypeID, ParameterID: Integer): Boolean;
  begin
    Result:= False;
    case MediaTypeID of
      1: Result:= SystemUseCartridge(sysID);
      2: Result:= SystemUseDisc(sysID);
      0: Result:= SystemUseDisc(sysID); // "Boot from CD" parameter...
      3: Result:= SystemUseFloppyDisk(sysID);
      4: Result:= SystemUseCassetteTape(sysID);
      5: Result:= SystemUseHardDiskDrive(sysID);
    end;
    if Result then
       EmuParametersCustom.WriteString(SystemsListCustom[sysID, 0],
                                 emulatorStr+GetMediaTypeName(MediaTypeID, ParameterID, True), ParameterVar);
  end;

  function VerifyEmulator(const SystemID, EmulatorNumber: ShortInt): Boolean;
  var
    emuStr: String;
  begin
    Result:= newEmulatorFileCustom[SystemID, EmulatorNumber] <> '';
    if Result then
       begin
         emuStr:= ChangeFileExt(ExtractFileName(newEmulatorFileCustom[SystemID, EmulatorNumber]), '');

         WriteToIni(emuStr, newEmuCartridgeParameterCustom[SystemID, EmulatorNumber], SystemID, 1, 1);
         WriteToIni(emuStr, newEmuDiscImageParameterCustom[SystemID, EmulatorNumber], SystemID, 2, 1);
         WriteToIni(emuStr, newEmuLoadFromDiscCustom[SystemID, EmulatorNumber], SystemID, 0, 1);
         WriteToIni(emuStr, newEmuFloppyDiskParameterCustom[SystemID, EmulatorNumber], SystemID, 3, 1);
         WriteToIni(emuStr, newEmuCassetteTapeParameterCustom[SystemID, EmulatorNumber], SystemID, 4, 1);
         WriteToIni(emuStr, newEmuHardDiskDriveParameterCustom[SystemID, EmulatorNumber], SystemID, 5, 1);

         WriteToIni(emuStr, newEmuCartridgeParameter2Custom[SystemID, EmulatorNumber], SystemID, 1, 2);
         WriteToIni(emuStr, newEmuDiscImageParameter2Custom[SystemID, EmulatorNumber], SystemID, 2, 2);
         WriteToIni(emuStr, newEmuLoadFromDisc2Custom[SystemID, EmulatorNumber], SystemID, 0, 2);
         WriteToIni(emuStr, newEmuFloppyDiskParameter2Custom[SystemID, EmulatorNumber], SystemID, 3, 2);
         WriteToIni(emuStr, newEmuCassetteTapeParameter2Custom[SystemID, EmulatorNumber], SystemID, 4, 2);
         WriteToIni(emuStr, newEmuHardDiskDriveParameter2Custom[SystemID, EmulatorNumber], SystemID, 5, 2);
       end
    else
       begin
         newEmulatorVersionCustom[SystemID, EmulatorNumber]:= '';

         newEmuCartridgeParameterCustom[SystemID, EmulatorNumber]:= '';
         newEmuDiscImageParameterCustom[SystemID, EmulatorNumber]:= '';
         newEmuLoadFromDiscCustom[SystemID, EmulatorNumber]:= '';
         newEmuFloppyDiskParameterCustom[SystemID, EmulatorNumber]:= '';
         newEmuCassetteTapeParameterCustom[SystemID, EmulatorNumber]:= '';
         newEmuHardDiskDriveParameterCustom[SystemID, EmulatorNumber]:= '';

         newEmuCartridgeParameter2Custom[SystemID, EmulatorNumber]:= '';
         newEmuDiscImageParameter2Custom[SystemID, EmulatorNumber]:= '';
         newEmuLoadFromDisc2Custom[SystemID, EmulatorNumber]:= '';
         newEmuFloppyDiskParameter2Custom[SystemID, EmulatorNumber]:= '';
         newEmuCassetteTapeParameter2Custom[SystemID, EmulatorNumber]:= '';
         newEmuHardDiskDriveParameter2Custom[SystemID, EmulatorNumber]:= '';
       end;

    EmulatorFileCustom[SystemID, EmulatorNumber]:= newEmulatorFileCustom[SystemID, EmulatorNumber];
    EmulatorVersionCustom[SystemID, EmulatorNumber]:= newEmulatorVersionCustom[SystemID, EmulatorNumber];
  end;

  function VerifyDaemonTools: Boolean;
  var
    dtIniSection: String;
  begin
    Result:= False;
    if newVirtualDriveFile <> VirtualDriveFile then
       begin
         Result:= True;
         VirtualDriveFile:= newVirtualDriveFile;
         EmuParametersCustom.WriteString('Daemon Tools', 'File', newVirtualDriveFile);
       end;

    dtIniSection:= GetVirtualDriveIniSection(newVirtualDriveFile);
    if newVirtualDriveFile <> '' then // ... if you haven't selected a virtual drive filename (May 08, 2016)
    begin
      if newVirtualDriveMount <> VirtualDriveMount then
         begin
           Result:= True;
           VirtualDriveMount:= newVirtualDriveMount;
           EmuParametersCustom.WriteString(dtIniSection, 'Mount', newVirtualDriveMount);
         end;
      if newVirtualDriveUnmount <> VirtualDriveUnmount then
         begin
           Result:= True;
           VirtualDriveUnmount:= newVirtualDriveUnmount;
           EmuParametersCustom.WriteString(dtIniSection, 'Unmount', newVirtualDriveUnmount);
         end;
    end;
  end;

  function CheckEmulatorEmpty(sysID: Integer): ShortInt;
  begin
    Result:= EmulatorIndexToUseCustom[sysID];
    if Result = -1 then
       Result:= 1
    else
    begin
      if EmulatorFileCustom[sysID, Result] = '' then
         begin
           if EmulatorFileCustom[sysID, 1] <> '' then
              Result:= 1
           else
           if EmulatorFileCustom[sysID, 2] <> '' then
              Result:= 2
           else
           if EmulatorFileCustom[sysID, 3] <> '' then
              Result:= 3
           else
           if EmulatorFileCustom[sysID, 4] <> '' then
              Result:= 4
           else
              Result:= 1;
         end;
    end;
  end;

begin
  UpdateIniFile:= False;
  for Loop:=1 to MaxConsoleComputerSystems do
  begin
    if VerifyEmulator(Loop, 1) then
       UpdateIniFile:= True;
    if VerifyEmulator(Loop, 2) then
       UpdateIniFile:= True;
    if VerifyEmulator(Loop, 3) then
       UpdateIniFile:= True;
    if VerifyEmulator(Loop, 4) then
       UpdateIniFile:= True;

    EmulatorIndexToUseCustom[Loop]:= CheckEmulatorEmpty(Loop);
  end;

  //FormMain.PopupGames.HelpContext:= 1; // what is this for ? is it still used ??? December 29, 2016
  if VerifyDaemonTools then
     UpdateIniFile:= True;

  if UpdateIniFile then
     EmuParametersCustom.UpdateFile;
end;

procedure TFormConsCompEmulatorsSetup.ToggleControls(const sysID: Integer);

  procedure SetControlStatus(ctrlEnabled: Boolean; IconImgDest, IconDefaultParamDest: TImage;
                 LabelMediaType,
                 LabelParameter1, LabelParameter2: TShadowLabel;
                 ParameterEdit1, ParameterEdit2: TEdit);
  begin
    IconImgDest.Visible:= ctrlEnabled;
    IconDefaultParamDest.Visible:= ctrlEnabled; // disabled for now... enable for a future expansion maybe ???
    LabelMediaType.Enabled:= ctrlEnabled;
    LabelParameter1.Enabled:= ctrlEnabled;
    LabelParameter2.Enabled:= ctrlEnabled;
    ParameterEdit1.Enabled:= ctrlEnabled;
    ParameterEdit2.Enabled:= ctrlEnabled;
  end;

begin
  SetControlStatus(SystemUseCartridge(sysID), IconCartridge, IconCartridgeReset,
                   LabelEmuCartridgeParameter,
                   LabelEmuCartridgeParameter1, LabelEmuCartridgeParameter2,
                   EmuCartridgeParameter, EmuCartridgeParameter2);

  SetControlStatus(SystemUseDisc(sysID), IconDiscImage, IconDiscImageReset,
                   LabelEmuDiscImageParameter,
                   LabelEmuDiscImageParameter1, LabelEmuDiscImageParameter2,
                   EmuDiscImageParameter, EmuDiscImageParameter2);

  SetControlStatus(EmuDiscImageParameter.Enabled, IconBootDisc, IconBootDiscReset,
                   LabelEmuBootDiscParameter,
                   LabelEmuBootDiscParameter1, LabelEmuBootDiscParameter2,
                   EmuBootDiscParameter, EmuBootDiscParameter2);

  SetControlStatus(SystemUseFloppyDisk(sysID), IconFloppyDisk, IconFloppyDiskReset,
                   LabelEmuFloppyDiskParameter,
                   LabelEmuFloppyDiskParameter1, LabelEmuFloppyDiskParameter2,
                   EmuFloppyDiskParameter, EmuFloppyDiskParameter2);

  SetControlStatus(SystemUseCassetteTape(sysID), IconCassetteTape, IconCassetteTapeReset,
                   LabelEmuCassetteTapeParameter,
                   LabelEmuCassetteTapeParameter1, LabelEmuCassetteTapeParameter2,
                   EmuCassetteTapeParameter, EmuCassetteTapeParameter2);

  SetControlStatus(SystemUseHardDiskDrive(sysID), IconHardDiskDrive, IconHardDiskDriveReset,
                   LabelEmuHardDiskDriveParameter,
                   LabelEmuHardDiskDriveParameter1, LabelEmuHardDiskDriveParameter2,
                   EmuHardDiskDriveParameter, EmuHardDiskDriveParameter2);
end;

procedure TFormConsCompEmulatorsSetup.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if CanClose then
     begin
       if FormConsCompEmulatorsSetup.ModalResult = mrOk then
          begin
            UpdateEmulatorInfo; // emu parameters and virtual drive
            UpdateCustomEmulatorsInfo; // emu file, title, param index to use
          end;
       FreeAndNil(EmuParametersCustom);
       FreeAndNil(EmuDefaultParametersCustom);
     end;
end;

procedure TFormConsCompEmulatorsSetup.ButtonClearEmulatorClick(Sender: TObject);
begin
  if EmulatorFile.Text <> '' then
     EmulatorFile.Clear;
  EmuDescription.Clear;

  EmuCartridgeParameter.Clear;
  EmuDiscImageParameter.Clear;
  EmuBootDiscParameter.Clear;
  EmuFloppyDiskParameter.Clear;
  EmuCassetteTapeParameter.Clear;
  EmuHardDiskDriveParameter.Clear;

  EmuCartridgeParameter2.Clear;
  EmuDiscImageParameter2.Clear;
  EmuBootDiscParameter2.Clear;
  EmuFloppyDiskParameter2.Clear;
  EmuCassetteTapeParameter2.Clear;
  EmuHardDiskDriveParameter2.Clear;
  EmuIcon.Picture.Icon:= nil;
  EmuIconFrame.Visible:= True;
end;

procedure TFormConsCompEmulatorsSetup.ButtonSelectEmulatorClick(Sender: TObject);
var
  fileStr: String;
begin
  if FormMain.DialogOpenFile(2, 'Select an emulator file for '+Systems.Selection.First.Caption,
                             EmulatorFile, False) <> '' then
     begin
       EmulatorFile.Tag:= 0;
       fileStr:= EmulatorFile.Text;
       ButtonClearEmulator.Click;
       EmulatorFile.Text:= fileStr;
     end;
end;

function TFormConsCompEmulatorsSetup.SetEmulatorIcon(sysID, EmulatorIndex: Integer): Integer;
begin
  if newEmulatorFileCustom[sysID, EmulatorIndex] = '' then
     begin
       Result:= -1; // emulator not defined, icon is NIL
       EmuIcon.Picture.Icon:= nil;
       EmuIconFrame.Visible:= True;
       Exit;
     end;
  Result:= GetAppIcon(newEmulatorFileCustom[sysID, EmulatorIndex], IL_EmulatorIcon, 2);
  if Result = -1 then
     Result:= 0+(Ord(FormMain.IsExeBatchFile(newEmulatorFileCustom[sysID, EmulatorIndex])));
  IL_EmulatorIcon.GetIcon(Result, EmuIcon.Picture.Icon);
  EmuIconFrame.Visible:= False;
end;

function TFormConsCompEmulatorsSetup.SetVirtualDriveIcon(const vtFileName: String): Integer;
begin
  if vtFileName = '' then
     begin
       Result:= -1; // emulator not defined, icon is NIL
       VirtualDriveIcon.Picture.Icon:= nil;
       VirtualDriveIconFrame.Visible:= True;
       Exit;
     end;

  Result:= GetAppIcon(vtFileName, IL_EmulatorIcon, 3);
  if Result = -1 then
     begin
       VirtualDriveIcon.Picture.Icon:= nil;
       VirtualDriveIconFrame.Visible:= True;
     end
  else
     begin
       IL_EmulatorIcon.GetIcon(3, VirtualDriveIcon.Picture.Icon);
       VirtualDriveIconFrame.Visible:= False;
     end;
end;

procedure TFormConsCompEmulatorsSetup.SetResetParameterIcon(IconHolder: TImage; ButtonPressed: Boolean = False);
begin
  IconHolder.Picture.Icon:= nil;
  // re-enable these later... HUH ? December 11, 2017
  //if ButtonPressed then
  //   FormMain.IL_PopupMenu.GetIcon(3, IconHolder.Picture.Icon, dsSelected, itImage)
  //else
  //   FormMain.IL_PopupMenu.GetIcon(3, IconHolder.Picture.Icon);
end;

procedure TFormConsCompEmulatorsSetup.ResizeForm;
var
  iDiff, iScreenWidth, iScreenHeight: Integer;
begin
  iScreenWidth:= Screen.Width;
  iScreenHeight:= Screen.Height;

  // no resize necessary for 1280x800 with 68x68 icons
  if (iScreenWidth < 1280) or (iScreenHeight < 800) then
  begin // go back to 48x48 icons
    IL_Systems.Width:= 48;
    IL_Systems.Height:= 48;
    Systems.CellSizes.Icon.Width:= 62;
    Systems.CellSizes.Icon.Height:= 82;
    Systems.Width:= 577;
    Systems.Height:= 672;
    LabelSystemTitle.Width:= 558;
    PanelEmulators.Left:= 558;
    PanelEmulators.Height:= 672;
    if FormConsCompEmulatorsSetup.ClientWidth <> 984 then
       FormConsCompEmulatorsSetup.ClientWidth:= 984;// .Width:= 1000;
    if FormConsCompEmulatorsSetup.ClientHeight <> 672 then
       FormConsCompEmulatorsSetup.ClientHeight:= 672;// Height:= 710;

    if iScreenHeight = 720 then
       begin
         PanelSystemTitle.Left:= 0;
         PanelSystemTitle.Top:= (Systems.CellSizes.Icon.Height*7);
         PanelSystemTitle.Width:= PanelEmulators.Left;
         PanelSystemTitle.Height:= Systems.Height-PanelSystemTitle.Top;
         PanelSystemTitle.Frames:= [frTop];
       end
    else
       begin
         PanelSystemTitle.Left:= (Systems.CellSizes.Icon.Width*2)+2; // +2 for border
         PanelSystemTitle.Top:= (Systems.CellSizes.Icon.Height*7)+2;
         PanelSystemTitle.Width:= PanelEmulators.Left-PanelSystemTitle.Left;
       end;

    LabelSystemType.Left:= (PanelSystemTitle.Width-LabelSystemType.Width) div 2;
    LabelSystemTitle.Left:= (PanelSystemTitle.Width-LabelSystemTitle.Width) div 2;
  end;

  if iScreenHeight < 720 then
     begin
       //FormMain.ResizeFormAddScrollBars(FormConsCompEmulatorsSetup);
       Exit;
     end;

  if iScreenHeight = 720 then
     begin
       iDiff:= FormConsCompEmulatorsSetup.Height-670;
       FormConsCompEmulatorsSetup.Height:= 670;
       Systems.Width:= Systems.Width+(Systems.CellSizes.Icon.Width);
       Systems.Height:= FormConsCompEmulatorsSetup.ClientHeight;
       PanelSystemTitle.Height:= PanelSystemTitle.Height-iDiff;
       PanelEmulators.Left:= PanelEmulators.Left+(Systems.CellSizes.Icon.Width);
       PanelEmulators.Height:= PanelEmulators.Height-iDiff;

       LabelSystemType.Top:= LabelSystemType.Top-9;
       LabelSystemTitle.Top:= LabelSystemTitle.Top-9;
       PanelSystemTitle.Width:= PanelEmulators.Left;
       PanelSystemTitle.Height:= Systems.Height-PanelSystemTitle.Top;
       LabelSystemTitle.Width:= PanelEmulators.Left-1;
       LabelSystemType.Left:= (PanelSystemTitle.Width-LabelSystemType.Width) div 2;
       LabelSystemTitle.Left:= (PanelSystemTitle.Width-LabelSystemTitle.Width) div 2;
       PanelBottomButtons.Align:= alNone;
       PanelBottomButtons.Top:= PanelBottomButtons.Top+5;
       FormConsCompEmulatorsSetup.ClientWidth:= PanelEmulators.Left+PanelEmulators.Width;
     end;
end;

procedure TFormConsCompEmulatorsSetup.FormShow(Sender: TObject);
begin
  
  ResizeForm;

  FormMain.ELV_ResetNormalColors(Systems);
  GetExtIcon('.exe', IL_EmulatorIcon); // .exe files
  GetExtIcon('.bat', IL_EmulatorIcon); // .bat files
  GetExtIcon('.exe', IL_EmulatorIcon); // emulator executable files
  GetExtIcon('.exe', IL_EmulatorIcon); // virtual drive executable files

  FormMain.LoadNonArcadeSystemIcons(IL_Systems, False);

  EmuParametersCustom:= TMemIniFile.Create(GetEmuParametersFile);
  if EmuParametersCustom.SectionExists('Emulator Title') then
     begin
       EmuParametersCustom.EraseSection('Emulator Title');
       EmuParametersCustom.UpdateFile;
     end;
  EmuDefaultParametersCustom:= TMemIniFile.Create(GetEmuParametersFile(True, True));
  InitializeEmulatorVariablesTemp;
  LoadEmuParametersToRAM;
  DaemonToolsFile.Text:= newVirtualDriveFile;
  DaemonToolsMount.Text:= newVirtualDriveMount;
  DaemonToolsUnmount.Text:= newVirtualDriveUnmount;
  SetVirtualDriveIcon(newVirtualDriveFile);

  ELV_PopulateCustomSystems(Systems, FormMain.GetSystemIDGamesList(True), -1, True);

  //case FormMain.CheckSelected(FormMain.GamesListView) of
  //  True : FormMain.ELV_PopulateSystems(Systems, FormMain.MemGameInfo.eSystemID, -1, True);
  //  False: FormMain.ELV_PopulateSystems(Systems, -1, -1, True);
  //end;

  // for a future expansion maybe ??? it will not be enabled for now
  SetResetParameterIcon(IconCartridgeReset);
  SetResetParameterIcon(IconDiscImageReset);
  SetResetParameterIcon(IconBootDiscReset);
  SetResetParameterIcon(IconFloppyDiskReset);
  SetResetParameterIcon(IconCassetteTapeReset);
  SetResetParameterIcon(IconHardDiskDriveReset);

  FormMain.IL_LeftPanel.GetIcon(16, IconCartridge.Picture.Icon);
  FormMain.IL_LeftPanel.GetIcon(20, IconDiscImage.Picture.Icon);
  FormMain.IL_LeftPanel.GetIcon(20, IconBootDisc.Picture.Icon);
  FormMain.IL_LeftPanel.GetIcon(17, IconFloppyDisk.Picture.Icon);
  FormMain.IL_LeftPanel.GetIcon(18, IconCassetteTape.Picture.Icon);
  FormMain.IL_LeftPanel.GetIcon(22, IconHardDiskDrive.Picture.Icon);
end;

procedure TFormConsCompEmulatorsSetup.EmulatorFileChange(Sender: TObject);
begin
  //UpdateMemParameter(TEdit(Sender), newEmulatorFile[Systems.Tag, PanelEmulators.Tag]); // can't use this or it doesn't update the internal vars correctly (August 11, 2017)
  if newEmulatorFileCustom[Systems.Tag, PanelEmulators.Tag] <> EmulatorFile.Text then
     newEmulatorFileCustom[Systems.Tag, PanelEmulators.Tag]:= EmulatorFile.Text;
  if EmulatorFile.Text <> '' then
     begin
       if EmulatorFile.Tag = 0 then // when clicking "Select" button, the TEdit(Sender).OnChange is already called!!!!!
          ReadEmuParameters(PanelEmulators.Tag);
     end
  else
     ButtonClearEmulator.Click;
end;

procedure TFormConsCompEmulatorsSetup.EmuDescriptionChange(
  Sender: TObject);
begin
  UpdateMemParameter(TEdit(Sender), newEmulatorVersionCustom[Systems.Tag, PanelEmulators.Tag]);
  //if newEmulatorVersion[Systems.Tag, PanelEmulators.Tag] <> EmuDescription.Text  then
  //   newEmulatorVersion[Systems.Tag, PanelEmulators.Tag]:= EmuDescription.Text;
end;

procedure TFormConsCompEmulatorsSetup.UpdateMemParameter(EditHolder: TEdit; var MemVarParameter: String);
begin
  if MemVarParameter <> EditHolder.Text then
     MemVarParameter:= EditHolder.Text;
end;

procedure TFormConsCompEmulatorsSetup.EmuCartridgeParameterChange(Sender: TObject);
begin
  UpdateMemParameter(TEdit(Sender), newEmuCartridgeParameterCustom[Systems.Tag, PanelEmulators.Tag]);
  //if newEmuCartridgeParameter[Systems.Tag, PanelEmulators.Tag] <> EmuCartridgeParameter.Text then
  //   newEmuCartridgeParameter[Systems.Tag, PanelEmulators.Tag]:= EmuCartridgeParameter.Text;
end;

procedure TFormConsCompEmulatorsSetup.EmuDiscImageParameterChange(Sender: TObject);
begin
  UpdateMemParameter(TEdit(Sender), newEmuDiscImageParameterCustom[Systems.Tag, PanelEmulators.Tag]);
  //if newEmuDiscImageParameter[Systems.Tag, PanelEmulators.Tag] <> EmuDiscImageParameter.Text then
  //   newEmuDiscImageParameter[Systems.Tag, PanelEmulators.Tag]:= EmuDiscImageParameter.Text;
end;

procedure TFormConsCompEmulatorsSetup.EmuBootDiscParameterChange(Sender: TObject);
begin
  UpdateMemParameter(TEdit(Sender), newEmuLoadFromDiscCustom[Systems.Tag, PanelEmulators.Tag]);
  //if newEmuLoadFromDisc[Systems.Tag, PanelEmulators.Tag] <> EmuBootDiscParameter.Text then
  //   newEmuLoadFromDisc[Systems.Tag, PanelEmulators.Tag]:= EmuBootDiscParameter.Text;
end;

procedure TFormConsCompEmulatorsSetup.EmuFloppyDiskParameterChange(Sender: TObject);
begin
  UpdateMemParameter(TEdit(Sender), newEmuFloppyDiskParameterCustom[Systems.Tag, PanelEmulators.Tag]);
  //if newEmuFloppyDiskParameter[Systems.Tag, PanelEmulators.Tag] <> EmuFloppyDiskParameter.Text then
  //   newEmuFloppyDiskParameter[Systems.Tag, PanelEmulators.Tag]:= EmuFloppyDiskParameter.Text;
end;

procedure TFormConsCompEmulatorsSetup.EmuCassetteTapeParameterChange(
  Sender: TObject);
begin
  UpdateMemParameter(TEdit(Sender), newEmuCassetteTapeParameterCustom[Systems.Tag, PanelEmulators.Tag]);
  //if newEmuCassetteTapeParameter[Systems.Tag, PanelEmulators.Tag] <> EmuCassetteTapeParameter.Text then
  //   newEmuCassetteTapeParameter[Systems.Tag, PanelEmulators.Tag]:= EmuCassetteTapeParameter.Text;
end;

procedure TFormConsCompEmulatorsSetup.EmuCartridgeParameter2Change(Sender: TObject);
begin
  UpdateMemParameter(TEdit(Sender), newEmuCartridgeParameter2Custom[Systems.Tag, PanelEmulators.Tag]);
  //if newEmuCartridgeParameter2[Systems.Tag, PanelEmulators.Tag] <> EmuCartridgeParameter2.Text then
  //   newEmuCartridgeParameter2[Systems.Tag, PanelEmulators.Tag]:= EmuCartridgeParameter2.Text;
end;

procedure TFormConsCompEmulatorsSetup.EmuDiscImageParameter2Change(Sender: TObject);
begin
  UpdateMemParameter(TEdit(Sender), newEmuDiscImageParameter2Custom[Systems.Tag, PanelEmulators.Tag]);
  //if newEmuDiscImageParameter2[Systems.Tag, PanelEmulators.Tag] <> EmuDiscImageParameter2.Text then
  //   newEmuDiscImageParameter2[Systems.Tag, PanelEmulators.Tag]:= EmuDiscImageParameter2.Text;
end;

procedure TFormConsCompEmulatorsSetup.EmuBootDiscParameter2Change(Sender: TObject);
begin
  UpdateMemParameter(TEdit(Sender), newEmuDiscImageParameter2Custom[Systems.Tag, PanelEmulators.Tag]);
  //if newEmuLoadFromDisc2[Systems.Tag, PanelEmulators.Tag] <> EmuBootDiscParameter2.Text then
  //   newEmuLoadFromDisc2[Systems.Tag, PanelEmulators.Tag]:= EmuBootDiscParameter2.Text;
end;

procedure TFormConsCompEmulatorsSetup.EmuFloppyDiskParameter2Change(
  Sender: TObject);
begin
  UpdateMemParameter(TEdit(Sender), newEmuFloppyDiskParameter2Custom[Systems.Tag, PanelEmulators.Tag]);
  //if newEmuFloppyDiskParameter2[Systems.Tag, PanelEmulators.Tag] <> EmuFloppyDiskParameter2.Text then
  //   newEmuFloppyDiskParameter2[Systems.Tag, PanelEmulators.Tag]:= EmuFloppyDiskParameter2.Text;
end;

procedure TFormConsCompEmulatorsSetup.EmuCassetteTapeParameter2Change(
  Sender: TObject);
begin
  UpdateMemParameter(TEdit(Sender), newEmuCassetteTapeParameter2Custom[Systems.Tag, PanelEmulators.Tag]);
  //if newEmuCassetteTapeParameter2[Systems.Tag, PanelEmulators.Tag] <> EmuCassetteTapeParameter2.Text then
  //   newEmuCassetteTapeParameter2[Systems.Tag, PanelEmulators.Tag]:= EmuCassetteTapeParameter2.Text;
end;

procedure TFormConsCompEmulatorsSetup.EmuHardDiskDriveParameterChange(
  Sender: TObject);
begin
  UpdateMemParameter(TEdit(Sender), newEmuHardDiskDriveParameterCustom[Systems.Tag, PanelEmulators.Tag]);
  //if newEmuCassetteTapeParameter[Systems.Tag, PanelEmulators.Tag] <> EmuCassetteTapeParameter.Text then
  //   newEmuCassetteTapeParameter[Systems.Tag, PanelEmulators.Tag]:= EmuCassetteTapeParameter.Text;
end;

procedure TFormConsCompEmulatorsSetup.EmuHardDiskDriveParameter2Change(
  Sender: TObject);
begin
  UpdateMemParameter(TEdit(Sender), newEmuHardDiskDriveParameter2Custom[Systems.Tag, PanelEmulators.Tag]);
  //if newEmuHardDiskDriveParameter2[Systems.Tag, PanelEmulators.Tag] <> EmuHardDiskDriveParameter2.Text then
  //   newEmuHardDiskDriveParameter2[Systems.Tag, PanelEmulators.Tag]:= EmuHardDiskDriveParameter2.Text;
end;

procedure TFormConsCompEmulatorsSetup.ButtonInstructionsClick(Sender: TObject);
begin
  CallMessageBox;
  FormMain.AddMsgText('    Set ');
  FormMain.AddMsgText('emulators filenames', MsgTxtColors.colorFileName, [fsBold]);
  FormMain.AddMsgText(', ');
  FormMain.AddMsgText('titles', MsgTxtColors.colorFileName, [fsBold]);
  FormMain.AddMsgText(', ');
  FormMain.AddMsgText('emulator command line parameters', MsgTxtColors.colorFileName, [fsBold]);
  FormMain.AddMsgText(' and ');
  FormMain.AddMsgText('games folders', MsgTxtColors.colorFileName, [fsBold]);
  FormMain.AddMsgText('.'+#13#10+#13#10+
                      'Remember to insert a ');
  FormMain.AddMsgText('%s', MsgTxtColors.colorWarning, [fsBold]);
  FormMain.AddMsgText(' tag in the parameter so it can be replaced by the game filename.'+#13#10+#13#10+
                      '    Emulator parameters are read from ');
  FormMain.AddMsgText(GetEmuParametersFile(False), MsgTxtColors.colorFileName, [fsBold]);
  FormMain.AddMsgText(' file, but for games with ');
  FormMain.AddMsgText('multiple floppy disks', MsgTxtColors.colorBoldTitle, [fsBold]);
  FormMain.AddMsgText(', the extra parameters required by a few emulators are hard-coded in frontend''s '+
                      'source code.'+#13#10+
                     'Read the docs in ');
  FormMain.AddMsgText('custom_games\docs\special_rules\', MsgTxtColors.colorFileName, [fsBold]);
  FormMain.AddMsgText(' folder for more details.'#13#10+#13#10+
                     '    You can use ');
  FormMain.AddMsgText('four (4) emulators per system', MsgTxtColors.colorFileName, [fsBold]);
  FormMain.AddMsgText('. Do not use the same emulator filename more than once in the same system.'+#13#10+#13#10+
                     '    The ');
  FormMain.AddMsgText('Boot Disc Parameter', MsgTxtColors.colorFileName, [fsBold]);
  FormMain.AddMsgText(' setting is used for CD/DVD images mounted on a virtual drive ');
  FormMain.AddMsgText('(Daemon Tools / Virtual CloneDrive / Alcohol 120%)', MsgTxtColors.colorBoldTitle, [fsBold]);
  FormMain.AddMsgText('.'+#13#10+
                     'Some emulators, like SSF (Sega Saturn), do not support loading games from a CD image.'+#13#10+#13#10+'    ');
  FormMain.AddMsgText('Parameter 2', MsgTxtColors.colorFileName, [fsBold]);
  FormMain.AddMsgText(' is optional. You can use it to launch a game with different parameters. Most emulators don''t need this.');

  FormMain.AddMsgText(#13#10+#13#10+'    Want to reset emulator title to default ? Clear the title edit box, select another system and back or click "Apply" button to exit.');

  GenerateMessage ('Info', 'Emulators Setup'+#13#10+'Usage Instructions');
end;

procedure TFormConsCompEmulatorsSetup.SystemsItemSelectionChanged(
  Sender: TCustomEasyListview; Item: TEasyItem);
begin
  if Item.Selected then
     begin
       Systems.Tag:= Systems.Selection.First.ImageIndex;
       ELV_GetSystemTitleConsoleComputer(Systems, Item, LabelSystemTitle, LabelSystemType);
       ToggleControls(Systems.Tag);
       if PanelEmulators.Tag <> 1 then
          begin
            Emulator1PageButton.Down:= True;
            Emulator1PageButton.Click;
          end
       else
          ShowEmulatorDetails(PanelEmulators.Tag);
     end;
end;

procedure TFormConsCompEmulatorsSetup.DaemonToolsFileChange(Sender: TObject);
begin
  if newVirtualDriveFile <> DaemonToolsFile.Text then
     begin
       newVirtualDriveFile:= DaemonToolsFile.Text;
       SetVirtualDriveIcon(newVirtualDriveFile);
     end;
end;

procedure TFormConsCompEmulatorsSetup.DaemonToolsMountChange(Sender: TObject);
begin
  UpdateMemParameter(TEdit(Sender), newVirtualDriveMount);
  //if newDaemonToolsMount <> DaemonToolsMount.Text then
  //   newDaemonToolsMount:= DaemonToolsMount.Text;
end;

procedure TFormConsCompEmulatorsSetup.DaemonToolsUnmountChange(Sender: TObject);
begin
  UpdateMemParameter(TEdit(Sender), newVirtualDriveUnmount);
  //if newDaemonToolsUnmount <> DaemonToolsUnmount.Text then
  //   newDaemonToolsUnmount:= DaemonToolsUnmount.Text;
end;

procedure TFormConsCompEmulatorsSetup.ButtonSelectDaemonToolsClick(Sender: TObject);
begin
  if FormMain.DialogOpenFile(0, 'Select an application to mount/unmount disc images',
                            DaemonToolsFile, False) <> '' then
     begin
       //SetVirtualDriveIcon(newDaemonToolsFile); // not needed as it's called in DaemonToolsFile.OnChange() event... TEdit
       ReadDaemonToolsSettings(False, DaemonToolsFile, DaemonToolsMount, DaemonToolsUnmount);
     end;
end;

procedure TFormConsCompEmulatorsSetup.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #27 then
     ButtonCancel.Click;
end;

procedure TFormConsCompEmulatorsSetup.ButtonDaemonToolsHelpClick(Sender: TObject);
begin
  // adds margin to a TEdit - MakeLong(left margin, right margin)...
  //SendMessage(Edit1.Handle, EM_SETMARGINS, EC_LEFTMARGIN or EC_RIGHTMARGIN, MakeLong(0, 30));
  CallMessageBox;
  FormMain.AddMsgText('    Some emulators require a real CD/DVD for proper emulation instead of loading an image file. '+
                      'Only disc images mounted on a virtual drive can be used.'+#13#10+#13#10+
                      '    Officially, three virtual drive applications are supported, and have separate mount/unmount parameters for '+
                      'each of them in ');
  FormMain.AddMsgText(GetEmuParametersFile, MsgTxtColors.colorFileName, [fsBold]);
  FormMain.AddMsgText(': ');
  FormMain.AddMsgText('Daemon Tools', MsgTxtColors.colorBoldTitle, [fsBold]);
  FormMain.AddMsgText(', ');
  FormMain.AddMsgText('Elby Virtual CloneDrive', MsgTxtColors.colorBoldTitle, [fsBold]);
  FormMain.AddMsgText(', ');
  FormMain.AddMsgText('Alcohol 120% / 52%', MsgTxtColors.colorBoldTitle, [fsBold]);
  FormMain.AddMsgText('.'+#13#10+#13#10+
                      '    The frontend tries to detect which tool you are using based on the executable file:'+#13#10+'- ');
  FormMain.AddMsgText('Daemon Tools', MsgTxtColors.colorBoldTitle, [fsBold]);
  FormMain.AddMsgText(': ');
  FormMain.AddMsgText('DTLite*.exe', MsgTxtColors.colorFileName, [fsBold]);
  FormMain.AddMsgText('; ');
  FormMain.AddMsgText('Daemon*.exe', MsgTxtColors.colorFileName, [fsBold]);
  FormMain.AddMsgText(#13#10+'- ');
  FormMain.AddMsgText('Virtual CloneDrive', MsgTxtColors.colorBoldTitle, [fsBold]);
  FormMain.AddMsgText(': ');
  FormMain.AddMsgText('VCDMount*.exe', MsgTxtColors.colorFileName, [fsBold]);
  FormMain.AddMsgText(#13#10+'- ');
  FormMain.AddMsgText('Alcohol 120% / 52%', MsgTxtColors.colorBoldTitle, [fsBold]);
  FormMain.AddMsgText(': ');
  FormMain.AddMsgText('AxCmd.exe', MsgTxtColors.colorFileName, [fsBold]);
  FormMain.AddMsgText(#13#10+#13#10+
                      '    If editing the parameters manually in ');
  FormMain.AddMsgText(GetEmuParametersFile(False), MsgTxtColors.colorFileName, [fsBold]);
  FormMain.AddMsgText(', please use the proper section related to the application you are using.'+#13#10+
                      'The ');
  FormMain.AddMsgText('[Custom Virtual Drive]', MsgTxtColors.colorWarning, [fsBold]);
  FormMain.AddMsgText(' section can be used for any other virtual drive application (like UltraISO).'+#13#10+#13#10+
                      '    To enable/disable mounting images on virtual drive, select a game in main '+
                      'games list and open the popup menu (mouse right-click). Choose ');
  FormMain.AddMsgText('Play +mount image in virtual drive', MsgTxtColors.colorFileName, [fsBold]);
  FormMain.AddMsgText(' option.'+#13#10+#13#10+
                      '    You only need to do that once for each system. When running other games, you can simply '+
                      'mouse double-click or press ENTER key. The last selected ');
  FormMain.AddMsgText('play with...', MsgTxtColors.colorFileName, [fsBold]);
  FormMain.AddMsgText(' option will be used.');

  GenerateMessage('Info', 'Mouting Disc Images on a Virtual Drive');
end;

procedure TFormConsCompEmulatorsSetup.ButtonSelectFoldersClick(Sender: TObject);
begin
  FormMain.MenuCustomSystemsFoldersSettings.Click;
end;

procedure TFormConsCompEmulatorsSetup.IconCartridgeResetMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  SetResetParameterIcon(TImage(Sender), True);
end;

procedure TFormConsCompEmulatorsSetup.IconCartridgeResetMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  SetResetParameterIcon(TImage(Sender));
end;

procedure TFormConsCompEmulatorsSetup.Emulator1PageButtonClick(Sender: TObject);

  function UncheckButton(ButtonHolder: TSpeedButton): Boolean;
  begin
    Result:= TSpeedButton(ButtonHolder).Top = TSpeedButton(Sender).Top;
    if Result then
       begin
         TSpeedButton(ButtonHolder).Top:= TSpeedButton(ButtonHolder).Top+3;
         TSpeedButton(ButtonHolder).Height:= TSpeedButton(ButtonHolder).Height-3;
         TSpeedButton(ButtonHolder).Font.Color:= clrDarkGray;
       end;
  end;

begin
  if TSpeedButton(Sender).Tag = PanelEmulators.Tag then
     Exit;
  TSpeedButton(Sender).Top:= TSpeedButton(Sender).Top-3;
  TSpeedButton(Sender).Height:= TSpeedButton(Sender).Height+3;
  TSpeedButton(Sender).Font.Color:= clBlack;

  case TSpeedButton(Sender).Tag of
    1:
      begin
        UncheckButton(Emulator2PageButton);
        UncheckButton(Emulator3PageButton);
        UncheckButton(Emulator4PageButton);
      end;
    2:
      begin
        UncheckButton(Emulator1PageButton);
        UncheckButton(Emulator3PageButton);
        UncheckButton(Emulator4PageButton);
      end;
    3:
      begin
        UncheckButton(Emulator1PageButton);
        UncheckButton(Emulator2PageButton);
        UncheckButton(Emulator4PageButton);
      end;
    4:
      begin
        UncheckButton(Emulator1PageButton);
        UncheckButton(Emulator2PageButton);
        UncheckButton(Emulator3PageButton);
      end;
  end;

  PanelEmulators.Tag:= TSpeedButton(Sender).Tag;

  //TAdvOfficeRadioButton(Sender).Font.Color:= clMaroon;
  //TAdvOfficeRadioButton(Sender).ShadowColor:= $00c0c0dc;
  //TAdvOfficeRadioButton(Sender).Font.Style:= [fsBold, fsUnderline];

  LabelEmulatorFile.Caption:= Format(LabelEmulatorFile.Hint, [PanelEmulators.Tag]);
  //LabelEmuTitle.Caption:= Format(LabelEmuTitle.Hint, [PanelEmulators.Tag]);
  ButtonClearEmulator.Hint:= 'Clear emulator '+IntToStr(PanelEmulators.Tag)+' settings (emulator and parameters)';
  //LabelEmulatorFile.Caption:= 'Emulator '+IntToStr(PanelEmulators.Tag)+' Executable (.exe; .bat; .cmd)';
  ShowEmulatorDetails(PanelEmulators.Tag);
end;


procedure TFormConsCompEmulatorsSetup.IconCartridgeResetClick(Sender: TObject);
begin
  ResetParametersToDefault(TImage(Sender).Tag);
end;

procedure TFormConsCompEmulatorsSetup.BitBtn1Click(Sender: TObject);
begin
  if TBitBtn(Sender).Tag = 0 then
     begin
       TBitBtn(Sender).Tag:= 1;
       //IL_Systems.Width:= 32;
       //IL_Systems.Height:= 32;
     end
  else
     begin
       TBitBtn(Sender).Tag:= 0;
       IL_Systems.Width:= 48;
       IL_Systems.Height:= 48;
     end;

  FormMain.LoadNonArcadeSystemIcons(IL_Systems, False);

  if TBitBtn(Sender).Tag = 0 then
     begin
       Systems.View:= elsIcon;
       Systems.PaintInfoItem.TileDetailCount:= 1;
       Systems.Font.Name:= 'Tahoma';
       Systems.Font.Size:= 7;

     end
  else
     begin
       Systems.View:= elsTile;
       Systems.Font.Name:= 'Trebuchet MS';
       Systems.PaintInfoItem.TileDetailCount:= 2;
       Systems.Font.Size:= 9;
     end;
end;

procedure TFormConsCompEmulatorsSetup.SystemsItemPaintText(
  Sender: TCustomEasyListview; Item: TEasyItem; Position: Integer;
  ACanvas: TCanvas);
begin
  if Systems.View = elsTile then
     begin
       if Position = 1 then
         begin
           ACanvas.Font.Name:= 'Segoe UI';
           ACAnvas.Font.Size:= 9;
           ACanvas.Font.Style:= [fsItalic];
           ACanvas.Font.Color:= clMedGray;
         end;
     end;
end;

end.
