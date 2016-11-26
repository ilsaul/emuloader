unit uScanResults;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  StdCtrls, ImgList, IniFiles, ComCtrls, uCommon, MPCommonObjects,
  EasyListview, ExtCtrls, ToolWin, Buttons, PanelEx,
  ShadowLabel;

type
  TEasyScanInfo = class(TEasyItemStored)
  private
    fImageIndex,
    fSystem: Integer;
    fSystemType: ShortInt;
    fLineMode: ShortInt;

    fIsDevice: Boolean;
    fIsBios: Boolean;
    fGameName,
    fParentGameName,
    fBiosName: String;
    fGameTitle: WideString;

    fNameText,
    fParentText,
    fBiosText: String;

    fNameZipStatus,
    fParentZipStatus,
    fBiosZipStatus,

    fDeviceText,
    fDeviceZipStatus: String;

    //fNameZipSize: Int64;
    //fNameSizeText: String;
    //fParentZipSize: Int64;
    //fParentSizeText: String;
    //fBiosZipSize: Int64;
    //fBiosSizeText: String;
    //fDeviceZipSize: Int64;
    //fDeviceSizeText: String;

    fROMName: String;
    //fROMChecksum: String;
    fROMCRC32: String;
    fROMSHA1: String;
    fROMTagIndex: Byte; // 0 -> game ROM; 1 -> device ROM; 2 -> bios ROM; 3 -> chd file
    
    fSoftwareName: String;
    fSoftwareTitle: String;
    //fCategory: String;
  protected
    function GetCaptions(Column: Integer): WideString; override;
    function GetImageIndexes(Column: Integer): TCommonImageIndexInteger; override;
  public
    property eImageIndex: Integer read fImageIndex write fImageIndex;
    property eSystem: Integer read fSystem write fSystem;
    property eSystemType: ShortInt read fSystemType write fSystemType; // 0 -> arcade; 1 -> MESS (everything not arcade machines); requires "mess.ini" from AntoPISA
    property eLineMode: ShortInt read fLineMode write fLineMode;
    // 0 -> system
    // 1 -> game title
    // 2 -> game name -> zip found or not
    // 3 -> parent name -> zip found or not
    // 4 -> bios name -> bios found or not
    // 5 -> ROM entry
    // 6...n Device Set status
    property eIsDevice: Boolean read fIsDevice write fIsDevice;
    property eIsBios: Boolean read fIsBios write fIsBios;
    property eGameName: String read fGameName write fGameName;
    property eParentGameName: String read fParentGameName write fParentGameName;
    property eBiosName: String read fBiosName write fBiosName;
    property eGameTitle: WideString read fGameTitle write fGameTitle;

    property eNameText: String read fNameText write fNameText;
    property eParentText: String read fParentText write fParentText;
    property eBiosText: String read fBiosText write fBiosText;

    property eNameZipStatus: String read fNameZipStatus write fNameZipStatus;
    property eParentZipStatus: String read fParentZipStatus write fParentZipStatus;
    property eBiosZipStatus: String read fBiosZipStatus write fBiosZipStatus;

    property eDeviceText: String read fDeviceText write fDeviceText;
    property eDeviceZipStatus: String read fDeviceZipStatus write fDeviceZipStatus;

    //property eNameZipSize: Int64 read fNameZipSize write fNameZipSize;
    //property eNameSizeText: String read fNameSizeText write fNameSizeText;
    //property eParentZipSize: Int64 read fParentZipSize write fParentZipSize;
    //property eParentSizeText: String read fParentSizeText write fParentSizeText;
    //property eBiosZipSize: Int64 read fBiosZipSize write fBiosZipSize;
    //property eBiosSizeText: String read fBiosSizeText write fBiosSizeText;
    //property eDeviceZipSize: Int64 read fDeviceZipSize write fDeviceZipSize;
    //property eDeviceSizeText: String read fDeviceSizeText write fDeviceSizeText;

    property eROMName: String read fROMName write fROMName;
    //property eROMChecksum: String read fROMChecksum write fROMChecksum;
    property eROMCRC32: String read fROMCRC32 write fROMCRC32;
    property eROMSHA1: String read fROMSHA1 write fROMSHA1;
    property eROMTagIndex: Byte read fROMTagIndex write fROMTagIndex; // 0 -> game ROM; 1 -> device ROM; 2 -> bios ROM; 3 -> chd file

    property eSoftwareName: String read fSoftwareName write fSoftwareName;
    property eSoftwareTitle: String read fSoftwareTitle write fSoftwareTitle;
  end;

  TEasyScanGroupInfo = class(TEasyGroupStored)
  private
    fImageIndex,
    fSystem: Integer;
    fSystemType: ShortInt;
    fLineMode: ShortInt;

    fIsDevice: Boolean;
    fIsBios: Boolean;
    fGameName,
    fParentGameName,
    fBiosName: String;
    fGameTitle: WideString;
    fSoftwareName: String;
    fSoftwareTitle: String;
  protected
    function GetCaptions(Column: Integer): WideString; override;
    function GetImageIndexes(Column: Integer): TCommonImageIndexInteger; override;
  public
    property eImageIndex: Integer read fImageIndex write fImageIndex;
    property eSystem: Integer read fSystem write fSystem;
    property eSystemType: ShortInt read fSystemType write fSystemType;
    property eLineMode: ShortInt read fLineMode write fLineMode;
    // 0 -> system
    // 1 -> game title
    // 2 -> game name -> zip found or not
    // 3 -> parent name -> zip found or not
    // 4 -> bios name -> bios found or not
    // 5 -> software name and software title ???
    // 6 -> ROM entry
    // 7..n -> device sets entries
    property eIsDevice: Boolean read fIsDevice write fIsDevice;
    property eIsBios: Boolean read fIsBios write fIsBios;
    property eGameName: String read fGameName write fGameName;
    property eParentGameName: String read fParentGameName write fParentGameName;
    property eBiosName: String read fBiosName write fBiosName;
    property eGameTitle: WideString read fGameTitle write fGameTitle;

    property eSoftwareName: String read fSoftwareName write fSoftwareName;
    property eSoftwareTitle: String read fSoftwareTitle write fSoftwareTitle;
  end;

type
  TFormScanResults = class(TForm)
    IL_ScanResults: TImageList;
    ROMsListView: TEasyListview;
    CoolBarTop: TCoolBar;
    Panel1: TPanel;
    LabelEmulatorVersion: TShadowLabel;
    LabelGamesListVersion: TShadowLabel;
    ButtonToggleTree: TBitBtn;
    ButtonClose: TBitBtn;
    BottomBar: TPanelEx;
    LabelTotalGames: TShadowLabel;
    LabelGamesListList: TShadowLabel;
    SystemSelectorToolBar: TToolBar;
    sysMAME: TToolButton;
    sysSupermodelSEGAModel3: TToolButton;
    sysDemul: TToolButton;
    sysHBMAME: TToolButton;
    sysDICE: TToolButton;
    sysSEGAModel2: TToolButton;
    sysZiNc: TToolButton;
    IconPanel: TPanelEx;
    SysIcon: TImage;
    MAMEMachinesFilter: TComboBox;
    MAMEMachinesFilterIcon: TImage;
    procedure FormShow(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure ButtonToggleTreeClick(Sender: TObject);
    procedure sysMAMEClick(Sender: TObject);
    procedure ROMsListViewItemPaintText(Sender: TCustomEasyListview;
      Item: TEasyItem; Position: Integer; ACanvas: TCanvas);
    function ROMsListViewItemCompare(Sender: TCustomEasyListview;
      Column: TEasyColumn; Group: TEasyGroup; Item1, Item2: TEasyItem;
      var DoDefault: Boolean): Integer;
    procedure ROMsListViewItemSelectionChanged(Sender: TCustomEasyListview;
      Item: TEasyItem);
    function ROMsListViewGroupCompare(Sender: TCustomEasyListview; Item1,
      Item2: TEasyGroup): Integer;
    procedure MAMEMachinesFilterSelect(Sender: TObject);
  private
    { Private declarations }
    GamesListVersion: packed array[1..MaxArcadeSystems] of String;
    sysSelectButton: Integer;
    function  CheckEmptyVar(const VarStr: String): String;
    procedure GetGamesListVersions;
    procedure LoadScanResultsFile(sysID: ShortInt; const SoftwareName: String);
    procedure ResizeForm;
    procedure FilterGamesList;
  public
    { Public declarations }
    SingleGame: Boolean;
  end;

var
  FormScanResults: TFormScanResults;

implementation

uses uMain, uStatus;

{$R *.dfm}

function TFormScanResults.CheckEmptyVar(const VarStr: String): String;
begin
  Result:= '';
  if VarStr <> '' then
     Result:= VarStr+', ';
end;

function TEasyScanInfo.GetCaptions(Column: Integer): WideString;
begin
  // 0 -> system
  // 1 -> game title
  // 2 -> game name -> game.zip found or not
  // 3 -> parent game name -> parent.zip found or not
  // 4 -> bios name -> bios.zip found or not
  // 5 -> software list name + title
  // 6 -> ROM entry
  // 7..n -> Device Sets
  case Column of
    0:
      begin
        case eLineMode of
          1: Result:= eGameTitle;
          2: Result:= eNameText;
          3: Result:= eParentText;
          4: Result:= eBiosText;
          5: Result:= eSoftwareName;
          6: Result:= eROMName; // name
        else
          if eLineMode > 6 then
             Result:= eDeviceText;
        end;
      end;
    1:
      begin
        case eLineMode of
          2: Result:= eNameZipStatus;
          3: Result:= eParentZipStatus;
          4: Result:= eBiosZipStatus;
          5: Result:= eSoftwareTitle;
          6: Result:= eROMCRC32;
        else
          if eLineMode > 6 then
             Result:= eDeviceZipStatus
        else
           Result:= '';
        end;
      end;
    2:
      begin
        if eLineMode = 6 then
           begin
             case eROMTagIndex of
               1: // device ROM
                 begin
                   if not eIsDevice then
                      Result:= 'Device ROM';
                 end;
               2: // bios ROM
                 begin
                   if not eIsBios then
                      begin
                        if eSystem = idSegaModel2 then
                           begin
                             if eGameName  <> 'model2' then
                                Result:= 'Board ROM';
                           end
                        else
                           Result:= 'Bios ROM';
                      end;
                 end;
             end;

             case eImageIndex of
               MaxArcadeSystems+1: Result:= FormScanResults.CheckEmptyVar(Result)+'Ok';
               MaxArcadeSystems+2: Result:= FormScanResults.CheckEmptyVar(Result)+'Missing';
               MaxArcadeSystems+3: Result:= FormScanResults.CheckEmptyVar(Result)+'Bad Checksum';
             end;
             //if eROMChecksum = '' then
             if (eROMCRC32 = '') and (eROMSHA1 = '') then
                Result:= FormScanResults.CheckEmptyVar(Result)+'No Dump';
           end
        else
           Result:= '';
      end;
  end;
end;

function TEasyScanInfo.GetImageIndexes(Column: Integer): TCommonImageIndexInteger;
begin
  case Column of
    0: Result:= eImageIndex // FormMain.GetMAMEImageIndex(eImageIndex, eSoftwareName);
  else
     Result:= -1;
  end;
end;

// ----> icons index <----
// 00 to MaxArcadeSystems-1 -> system icons
// MaxArcadeSystems    -> ROM/CHD Ok
// MarArcadeSystems+1  -> ROM/CHD not found
// MarArcadeSystems+2  -> CHD bad SHA-1 checksum

function TEasyScanGroupInfo.GetCaptions(Column: Integer): WideString;
begin
  if Column = 0 then
     Result:= eGameTitle
  else
     Result:= ''
end;

function TEasyScanGroupInfo.GetImageIndexes(Column: Integer): TCommonImageIndexInteger;
begin
  case Column of
    0: Result:= FormMain.GetMAMEImageIndex(eImageIndex, eSoftwareName) // eImageIndex;
  else
     Result:= -1;
  end;
end;

procedure TFormScanResults.GetGamesListVersions;
var
  Loop: ShortInt;

  function GetGamesListVersion: String;
  var
    tmpFile: TMemIniFile;
  begin
    Result:= '';
    if not FileExists(FormMain.GetGamesFolderEL+GetSystemFileName(Loop)) then
       Exit;

    tmpFile:= TMemIniFile.Create(FormMain.GetGamesFolderEL+GetSystemFileName(Loop));
    Result:= tmpFile.ReadString('info_file', 'version', '');
    FreeAndNil(tmpFile);
  end;
    
begin
  for Loop:=1 to MaxArcadeSystems do
  begin
    case FormMain.ValidateFile(FormMain.GetGamesFolderEL+GetSystemFileName(Loop)) of
      True : GamesListVersion[Loop]:= GetGamesListVersion;
      False: GamesListVersion[Loop]:= '';
    end;
  end;
end;

procedure TFormScanResults.LoadScanResultsFile(sysID: ShortInt; const SoftwareName: String);
var
  missFile: TMemIniFile;
  missGamesList: THashedStringList;
  tmpString, MissingROMsFileName: String;
  addGroup, checkGroup: TEasyGroup;
  addItem, checkItem: TEasyItem;
  IsSegaModel2: Boolean;

  function GetZipStatusText(const Data_String: String; Data_FileStatus: Boolean): String;
  var
    tmpString: String;
  begin
    Result:= '';
    if Data_String <> '' then
       begin
         case Data_FileStatus of
           True : tmpString:= '';
           False: tmpString:= 'not ';
         end;
         Result:= Data_String+'.zip '+tmpString+'found';
       end;
  end;

  function CreateNameNodes(TypeIndex: ShortInt): Boolean;
  var
    DeviceName, ZipStatus: String;
  begin
    // 2 -> game name
    // 3 -> parent game name
    // 4 -> bios name
    // 5 -> software name/title
    // 7 - n -> device sets
    Result:= True;
    if TypeIndex > 6 then // in [7..n] then
       begin
         if not missFile.ValueExists(FormMain.TempGameVars.eName, 'device'+IntToStr(TypeIndex-6)) then
            Exit;
       end;
    addItem:= ROMsListView.Items.AddCustom(TEasyScanInfo, addGroup);
    TEasyScanInfo(addItem).eImageIndex:= 200;// dummy image index to align text with game filenames (1st column)-1;
    TEasyScanInfo(addItem).eSystem:= sysID;
    TEasyScanInfo(addItem).eLineMode:= TypeIndex;
    TEasyScanInfo(addItem).eIsDevice:= TEasyScanGroupInfo(addGroup).eIsDevice;
    TEasyScanInfo(addItem).eIsBios:= TEasyScanGroupInfo(addGroup).eIsBios;
    TEasyScanInfo(addItem).eGameName:= FormMain.TempGameVars.eName;
    TEasyScanInfo(addItem).eParentGameName:= FormMain.TempGameVars.eClone;

    if IsSegaModel2 then
       FormMain.TempGameVars.eBiosName:= 'model2';

    TEasyScanInfo(addItem).eBiosName:= FormMain.TempGameVars.eBiosName;
    TEasyScanInfo(addItem).eGameTitle:= '';

    if TypeIndex = 2 then
       begin
         TEasyScanInfo(addItem).eNameText:= Format('%-9s: %s', ['name', FormMain.TempGameVars.eName]);
         TEasyScanInfo(addItem).eNameZipStatus:= GetZipStatusText(FormMain.TempGameVars.eName, Boolean(StrToInt(missFile.ReadString(FormMain.TempGameVars.eName, 'zip_game', '0'))));
       end;

    if TypeIndex = 3 then
       begin
         TEasyScanInfo(addItem).eParentText:= Format('%-9s: %s', ['parent', FormMain.TempGameVars.eClone]);
         TEasyScanInfo(addItem).eParentZipStatus:= GetZipStatusText(FormMain.TempGameVars.eClone, Boolean(StrToInt(missFile.ReadString(FormMain.TempGameVars.eName, 'zip_parentgame', '0'))));
       end;

    if TypeIndex = 4 then
       begin
         if IsSegaModel2 then
            TEasyScanInfo(addItem).eBiosText:= Format('%-9s: %s', ['board', FormMain.TempGameVars.eBiosName])
         else
            TEasyScanInfo(addItem).eBiosText:= Format('%-9s: %s', ['bios', FormMain.TempGameVars.eBiosName]);
         TEasyScanInfo(addItem).eBiosZipStatus:= GetZipStatusText(FormMain.TempGameVars.eBiosName, Boolean(StrToInt(missFile.ReadString(FormMain.TempGameVars.eName, 'zip_bios', '0'))));
       end;

    if TypeIndex = 5 then
       begin
         TEasyScanInfo(addItem).eSoftwareName:= Format('%-9s: %s', ['software', FormMain.TempGameVars.eSoftwareName]);
         TEasyScanInfo(addItem).eSoftwareTitle:= FormMain.TempGameVars.eCategory;
       end;

    if TypeIndex > 6 then // in [7..n] then
       begin
         DeviceName:= missFile.ReadString(FormMain.TempGameVars.eName, 'device'+IntToStr(TypeIndex-6), '');
         ZipStatus:= GetZipStatusText(DeviceName, Boolean(StrToInt(missFile.ReadString(FormMain.TempGameVars.eName, 'zip_device'+IntToStr(TypeIndex-6), '0'))));
         DeviceName:= Format('device %.2u: %s', [(TypeIndex-6), DeviceName]);
         TEasyScanInfo(addItem).eDeviceText:= DeviceName;
         TEasyScanInfo(addItem).eDeviceZipStatus:= ZipStatus;
       end;

    TEasyScanInfo(addItem).eROMName:= '';
    //TEasyScanInfo(addItem).eROMChecksum:= '';
    TEasyScanInfo(addItem).eROMCRC32:= '';
    TEasyScanInfo(addItem).eROMSHA1:= '';
    TEasyScanInfo(addItem).eROMTagIndex:= 0;
  end;

  function AddGame: Boolean;
  var
    LoopROMs: Integer;
    LineStr, iChecksum, romName, romCRC32, romSHA1, chdParentName: String;

    romTag: Byte; // 0 -> game ROM; 1 -> device ROM; 2 -> bios ROM; 3 -> chd file (game, bios, device)
  begin
    Result:= True;
    // create game title ELV group
    addGroup:= ROMsListView.Groups.AddCustom(TEasyScanGroupInfo, nil);
    TEasyScanGroupInfo(addGroup).eSystem:= sysID;
    TEasyScanGroupInfo(addGroup).eImageIndex:= FormMain.TempGameVars.eROMIdentification;
    TEasyScanGroupInfo(addGroup).eLineMode:= 1;
    TEasyScanGroupInfo(addGroup).eIsDevice:= FormMain.IsROM_Device(FormMain.TempGameVars.eROMIdentification);
    TEasyScanGroupInfo(addGroup).eIsBios:= FormMain.IsROM_Bios(FormMain.TempGameVars.eROMIdentification);
    TEasyScanGroupInfo(addGroup).eGameName:= FormMain.TempGameVars.eName;
    TEasyScanGroupInfo(addGroup).eParentGameName:= FormMain.TempGameVars.eClone;
    TEasyScanGroupInfo(addGroup).eBiosName:= FormMain.TempGameVars.eBiosName;
    TEasyScanGroupInfo(addGroup).eGameTitle:= FormMain.TempGameVars.eTitle;
    TEasyScanGroupInfo(addGroup).eSoftwareName:= FormMain.TempGameVars.eSoftwareName;
    TEasyScanGroupInfo(addGroup).eSoftwareTitle:= FormMain.TempGameVars.eCategory;

    case FormMain.GameIsClone(FormMain.TempGameVars.eClone) of
      True: TEasyScanGroupInfo(addGroup).eImageIndex:= 1;
      False:
        begin
          case TEasyScanGroupInfo(addGroup).eIsBios of
            False:
              begin
                case TEasyScanGroupInfo(addGroup).eIsDevice of
                  True : TEasyScanGroupInfo(addGroup).eImageIndex:= 3;
                  False: TEasyScanGroupInfo(addGroup).eImageIndex:= 0;
                end;
              end;
            True: TEasyScanGroupInfo(addGroup).eImageIndex:= 2;
          end;
        end;
    end;
    case sysID of
      idSupermodel: TEasyScanGroupInfo(addGroup).eImageIndex:= TEasyScanGroupInfo(addGroup).eImageIndex+8;
      idDemul: TEasyScanGroupInfo(addGroup).eImageIndex:= TEasyScanGroupInfo(addGroup).eImageIndex+16;
      idHBMAME: TEasyScanGroupInfo(addGroup).eImageIndex:= TEasyScanGroupInfo(addGroup).eImageIndex+22;
      idDICE: TEasyScanGroupInfo(addGroup).eImageIndex:= TEasyScanGroupInfo(addGroup).eImageIndex+30;
      idSegaModel2: TEasyScanGroupInfo(addGroup).eImageIndex:= TEasyScanGroupInfo(addGroup).eImageIndex+34;
      idZiNc: TEasyScanGroupInfo(addGroup).eImageIndex:= TEasyScanGroupInfo(addGroup).eImageIndex+38;
    end;
    IsSegaModel2:= sysID = idSegaModel2;

    if (not FormMain.TempGameVars.eROMsAllNoDump) then
       begin
         if FormMain.TempGameVars.eHaveGameROMs = 1 then
            begin
              CreateNameNodes(2); // game name node
              if (FormMain.TempGameVars.eClone <> '') and (sysID <> idSupermodel) then
                 CreateNameNodes(3); // parent game name node
            end;

         if FormMain.ValidateBiosName(FormMain.TempGameVars.eBiosName, FormMain.TempGameVars.eName) then
            CreateNameNodes(4); // bios name node

         if FormMain.TempGameVars.eSoftwareName <> '' then
            CreateNameNodes(5); // software name / title

         if not TEasyScanGroupInfo(addGroup).eIsDevice then
            begin
              for LoopROMs:= 7 to 35 do
                  CreateNameNodes(LoopROMs); // device sets name nodes
            end;
       end;

    // add ROMs entries ELV
    if TEasyGameInfo(checkItem).eROMInfo <> nil then
    begin
      for LoopROMs:=0 to TEasyGameInfo(checkItem).eROMInfo.Count-1 do
      begin
        LineStr:= TEasyGameInfo(checkItem).eROMInfo[LoopROMs];
        romTag:= 0; // set to ROM file type
        if FormMain.IsROMsListBasedSys(sysID) then // Daphne doesn't have this... no ROMs list
           romTag:= StrToInt(LineStr[1]);

        FormMain.GetROMDetailsInfo(LineStr, FormMain.GameIsClone(TEasyGameInfo(checkItem).eClone), romName, romCRC32, romSHA1, chdParentName);

        //romCRC32:= TEasyGameInfo(checkItem).eROMInfo.Names[LoopROMs];
        //romName:= TEasyGameInfo(checkItem).eROMInfo.ValueFromIndex[LoopROMs];

        //if FormMain.IsROMsListBasedSys(sysID) then
        //   begin
        //     romTag:= StrToInt(romName[1]);
        //     Delete(romName, 1, 2);
        //   end;
        iChecksum:= romCRC32+';'+romSHA1;
        tmpString:= missFile.ReadString(FormMain.TempGameVars.eName, iChecksum, '');
        //if Length(romCRC) > 8 then
        //   tmpString:= missFile.ReadString(FormMain.TempGameVars.eName, romName, '') // CHD file
        //else
        //   tmpString:= missFile.ReadString(FormMain.TempGameVars.eName, romCRC, ''); // ROM file

        addItem:= ROMsListView.Items.AddCustom(TEasyScanInfo, addGroup);
        if tmpString = '' then
           TEasyScanInfo(addItem).eImageIndex:= MaxArcadeSystems+1 // file Ok
        else
           begin
              if tmpString = '0' then
                 TEasyScanInfo(addItem).eImageIndex:= MaxArcadeSystems+2 // file Missing
              else
              if tmpString = '1' then
                 TEasyScanInfo(addItem).eImageIndex:= MaxArcadeSystems+3; // CHD file found with bad SHA-1
           end;

        TEasyScanInfo(addItem).eLineMode:= 6;
        TEasyScanInfo(addItem).eIsDevice:= TEasyScanGroupInfo(addGroup).eIsDevice;
        TEasyScanInfo(addItem).eIsBios:= TEasyScanGroupInfo(addGroup).eIsBios;
        TEasyScanInfo(addItem).eGameName:= '';
        TEasyScanInfo(addItem).eParentGameName:= '';
        TEasyScanInfo(addItem).eBiosName:= '';
        TEasyScanInfo(addItem).eGameTitle:= '';
        TEasyScanInfo(addItem).eROMName:= romName;
        //TEasyScanInfo(addItem).eROMChecksum:= romCRC;
        TEasyScanInfo(addItem).eROMCRC32:= romCRC32;
        TEasyScanInfo(addItem).eROMSHA1:= romSHA1;
        TEasyScanInfo(addItem).eROMTagIndex:= romTag;
        TEasyScanInfo(addItem).eSoftwareName:= TEasyScanGroupInfo(addGroup).eSoftwareName;
        TEasyScanInfo(addItem).eSoftwareTitle:= TEasyScanGroupInfo(addGroup).eSoftwareTitle;
      end;
    end;
  end;

  function CheckSysToSelect: Boolean;
  begin
    if sysSelectButton = sysID then
       sysSelectButton:= -1;
    Result:= True;
  end;

  procedure EnableToolButton(sysID: ShortInt);
  var
    ButtonID: Integer;
  begin
    if sysID > idDaphne then
       ButtonID:= sysID-2
    else
       ButtonID:= sysID-1;
    SystemSelectorToolBar.Buttons[ButtonID].Enabled:= True;
    if sysID = sysSelectButton then
       SystemSelectorToolBar.Buttons[ButtonID].Down:= True;
  end;

begin
  if not FormMain.IsROMsListBasedSys(sysID) then
     Exit;
  MissingROMsFileName:= FormMain.GetGamesFolderEL(Ord(SoftwareName <> ''))+GetSystemFileName(sysID, 3, SoftwareName);
  if not FileExists(MissingROMsFileName) then
     begin
       CheckSysToSelect;
       Exit;
     end;

  if not FileExists(FormMain.GetGamesFolderEL(Ord(SoftwareName <> ''))+GetSystemFileName(sysID, 1, SoftwareName)) then
     begin
       CheckSysToSelect;
       Exit;
     end;

  EnableToolButton(sysID);
  missFile:= TMemIniFile.Create(MissingROMsFileName); // sys_missgames.miss

  case SingleGame of
    True:
      begin
        FormMain.FillMemGameInfo(FormMain.TempGameVars);
        checkItem:= FormMain.SelectedEasyItem;
        AddGame;
      end;
    False:
      begin
        missGamesList:= THashedStringList.Create;
        missFile.ReadSections(missGamesList); // read games list from missing file
        {
        checkItem:= FormMain.GamesListView.Groups.FirstItem;
          repeat
            if (TEasyGameInfo(checkItem).eSystemID = sysID) and (TEasyGameInfo(checkItem).eSoftwareName = '') then
               begin
                 if missGamesList.IndexOf(TEasyGameInfo(checkItem).eName) <> -1 then
                    begin
                      if TEasyGameInfo(checkItem).eROMInfo <> nil then
                         begin
                           FormMain.ClearMemGameInfo(FormMain.TempGameVars);
                           FormMain.FillTempGameInfo(checkItem);
                           AddGame;
                         end;
                    end;
               end;
            checkItem:= FormMain.GamesListView.Groups.NextItem(checkItem);
          until checkItem = nil;
        }
        checkGroup:= FormMain.GamesListView.Groups.FirstGroup;
        repeat
          checkItem:= FormMain.GamesListView.Groups.FirstInGroup(checkGroup);
          repeat
            if (TEasyGameInfo(checkItem).eSystemID = sysID) and (TEasyGameInfo(checkItem).eSoftwareName = SoftwareName) then
               begin
                 if missGamesList.IndexOf(TEasyGameInfo(checkItem).eName) <> -1 then
                    begin
                      if TEasyGameInfo(checkItem).eROMInfo <> nil then
                         begin
                           FormMain.ClearMemGameInfo(FormMain.TempGameVars);
                           FormMain.FillTempGameInfo(checkItem);
                           AddGame;
                         end;
                    end;
               end;
            checkItem:= FormMain.GamesListView.Groups.NextInGroup(checkGroup, checkItem);
          until checkItem = nil;
          checkGroup:= FormMain.GamesListView.Groups.NextGroup(checkGroup);
        until checkGroup = nil;
        FreeAndNil(missGamesList);
      end;
  end;
  FormMain.ClearMemGameInfo(FormMain.TempGameVars);
  FreeAndNil(missFile);
end;

procedure TFormScanResults.ResizeForm;
begin
  if Screen.Width > 640 then
     Exit;

  LabelEmulatorVersion.Font.Size:= 7;
  LabelGamesListList.Font.Size:= 7;
  LabelGamesListList.Font.Name:= 'Segoe UI';
  LabelGamesListList.Caption:= 'List :';
  LabelGamesListVersion.Font.Size:= 7;
  LabelGamesListVersion.Font.Name:= 'Segoe UI';
  LabelGamesListVersion.Left:= 73;
  SystemSelectorToolBar.Left:= 404;
  ButtonClose.Left:= 528;
  MAMEMachinesFilterIcon.Left:= 240;
  MAMEMachinesFilter.Left:= 259;
  FormScanResults.ClientWidth:= 624;
  ROMsListView.Header.Columns[0].Width:= 262;
end;

procedure TFormScanResults.FormShow(Sender: TObject);
var
  tempFolder: String;
  Loop: Integer;
  missSoftListFiles: THashedStringList;
begin
  ResizeForm;
  CallMaximizeWindow(TForm(Sender));
  FormMain.ELV_ResetNormalColors(ROMsListView);
  tempFolder:= FormMain.GetFolderFull(32);
  FormMain.AddDefaultIcons('option_radiogroup_on.ico', tempFolder, IL_ScanResults);
  for Loop:=1 to MaxArcadeSystems do
      FormMain.AddDefaultIcons(FormMain.GetSystemIconFileName(Loop), tempFolder, IL_ScanResults);
  FormMain.AddDefaultIcons('scanresult_ok.ico', tempFolder, IL_ScanResults);
  FormMain.AddDefaultIcons('scanresult_notfound.ico', tempFolder, IL_ScanResults);
  FormMain.AddDefaultIcons('scanresult_badcrc.ico', tempFolder, IL_ScanResults);
  for Loop:=0 to SystemSelectorToolBar.ButtonCount-1 do
      SystemSelectorToolBar.Buttons[Loop].Hint:= FormMain.GetEmulatorDescription(SystemSelectorToolBar.Buttons[Loop].ImageIndex);

  IL_ScanResults.GetIcon(idMAME, MAMEMachinesFilterIcon.Picture.Icon);
  GetGamesListVersions;
  sysSelectButton:= -1;
  case SingleGame of
    True : sysSelectButton:= FormMain.MemGameInfo.eSystemID;
    False:
      begin
        if FormMain.CheckSelected(FormMain.GamesListView) then
           sysSelectButton:= FormMain.MemGameInfo.eSystemID;
      end;
  end;
  if sysSelectButton = idDaphne then
     sysSelectButton:= -1;

  ROMsListView.BeginUpdate;
  ROMsListView.Items.ReIndexDisable:= True;
  case SingleGame of
    True: LoadScanResultsFile(FormMain.MemGameInfo.eSystemID, FormMain.MemGameInfo.eSoftwareName);
    False:
      begin
        for Loop:=1 to MaxArcadeSystems do
            LoadScanResultsFile(Loop, '');
        missSoftListFiles:= THashedStringList.Create;
        GetFilesList(FormMain.GetGamesFolderEL(1), '.miss', '*.miss', missSoftListFiles, False, False, False);
        if missSoftListFiles.Count > 0 then
        begin
          for Loop:=0 to missSoftListFiles.Count-1 do
              LoadScanResultsFile(idMAME, ChangeFileExt(missSoftListFiles[Loop], ''));
        end;
        FreeAndNil(missSoftListFiles);
      end;
  end;
  FormMain.ELV_RemoveDefaultGroup(ROMsListView);
  ROMsListView.Sort.SortAll;

  ROMsListView.Items.ReIndexDisable:= False;
  ROMsListView.EndUpdate(False);

  for Loop:=0 to SystemSelectorToolBar.ButtonCount-1 do
  begin
    if SystemSelectorToolBar.Buttons[Loop].Enabled then
       begin
         if sysSelectButton <> -1 then
            begin
              if SystemSelectorToolBar.Buttons[Loop].Down then
                 begin
                   SystemSelectorToolBar.Buttons[Loop].Click;
                   Break;
                 end;
            end
         else
            begin
              SystemSelectorToolBar.Buttons[Loop].Down:= True;
              SystemSelectorToolBar.Buttons[Loop].Click;
              Break;
            end;
       end;
  end;
  FormMain.ELV_SelectItem(ROMsListView, 0);
  if ROMsListView.Scrollbars.VertBarVisible then
     ROMsListView.Header.Columns[0].Width:= ROMsListView.Header.Columns[0].Width-GetSystemMetrics(SM_CXVSCROLL);
  if FormStatus.Visible then
     FormStatus.Close;
end;

procedure TFormScanResults.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #27 then
     ButtonClose.Click;
end;

procedure TFormScanResults.ButtonToggleTreeClick(Sender: TObject);
begin
  if not FormMain.CheckTotal(ROMsListView) then
     Exit;
  ROMsListView.BeginUpdate;
  case ButtonToggleTree.Tag of
    0: ROMsListView.Groups.CollapseAll;
    1: ROMsListView.Groups.ExpandAll;
  end;
  ROMsListView.EndUpdate;
  ButtonToggleTree.Tag:= Ord(not Boolean(ButtonToggleTree.Tag));
  ROMsListView.SetFocus;
end;

procedure TFormScanResults.FilterGamesList;
var
  vGroup: TEasyGroup;
  ShowItem: Boolean;
begin
  if not FormMain.CheckTotal(ROMsListView) then
     Exit;

  ROMsListView.BeginUpdate;
  vGroup:= ROMsListView.Groups.FirstGroup;
  repeat
    ShowItem:= TEasyScanGroupInfo(vGroup).eSystem = SystemSelectorToolBar.Tag;
    if ShowItem and (SystemSelectorToolBar.Tag = idMAME) then
    begin
      case MAMEMachinesFilter.ItemIndex of
        //0: ShowItem:= True;
        1: ShowItem:= TEasyScanGroupInfo(vGroup).eSoftwareName = '';
        2: ShowItem:= TEasyScanGroupInfo(vGroup).eSoftwareName <> '';
      end;
    end;
    vGroup.Visible:= ShowItem; //vGroup.Visible:= TEasyScanGroupInfo(vGroup).eSystem = SystemSelectorToolBar.Tag;

    vGroup:= ROMsListView.Groups.NextGroup(vGroup);
  until vGroup = nil;
  ROMsListView.EndUpdate;
  LabelTotalGames.Caption:= IntToStr(ROMsListView.Groups.VisibleCount)+' Games';
  ROMsListView.SetFocus;
end;

procedure TFormScanResults.sysMAMEClick(Sender: TObject);
begin
  SystemSelectorToolBar.Tag:= TToolButton(Sender).ImageIndex;
  SysIcon.Picture:= nil;
  FormMain.IL_ArcadeSystem_ExtraLarge.GetIcon(SystemSelectorToolBar.Tag, SysIcon.Picture.Icon);
  LabelEmulatorVersion.Caption:=  FormMain.EmulatorVersion[SystemSelectorToolBar.Tag];
  LabelGamesListVersion.Caption:= GamesListVersion[SystemSelectorToolBar.Tag];
  //FormScanResults.Caption:= FormMain.GetEmulatorDescription(SystemSelectorToolBar.Tag, True)+' - Games with Missing ROMs/CHDs';
  //IL_ScanResults.GetIcon(SystemSelectorToolBar.Tag, FormScanResults.Icon);

  MAMEMachinesFilter.Visible:= sysMAME.Down;
  MAMEMachinesFilterIcon.Visible:= MAMEMachinesFilter.Visible;

  FilterGamesList;
end;

procedure TFormScanResults.ROMsListViewItemPaintText(
  Sender: TCustomEasyListview; Item: TEasyItem; Position: Integer;
  ACanvas: TCanvas);
begin
  case Position of
    0: // file name
      begin
        if (TEasyScanInfo(Item).eLineMode in [2..5]) or (TEasyScanInfo(Item).eLineMode > 6) then
           begin
             ACanvas.Font.Name:= 'Consolas';
             //ACanvas.Font.Size:= 9;
             //ACanvas.Font.Style:= [fsBold];
             //ACanvas.Font.Color:= $00a65300;
           end;
      end;
    1: // CRC32
      begin
        if TEasyScanInfo(Item).eLineMode = 6 then
        //if not (TEasyScanInfo(Item).eLineMode in [2..5]) then
        //if TEasyScanInfo(Item).eLineMode <> 5 then
           ACanvas.Font.Name:= 'Consolas';
        //ACanvas.Font.Size:= 9;
      end;
    2: // SHA-1 (new September 14, 2016)
      begin
        //if TEasyScanInfo(Item).eLineMode = 7 then // shoud I use eLineMode = 7 ??????
        //   ACanvas.Font.Name:= 'Consolas';
      end;
    3: // Status
      begin
        // MarArcadeSystems+1
        //if (TEasyScanInfo(Item).eLineMode > 5) then//and (TEasyScanInfo(Item).eImageIndex = MaxArcadeSystems+1) then
        if TEasyScanInfo(Item).eImageIndex in [MaxArcadeSystems+2, MaxArcadeSystems+3] then
           ACanvas.Font.Color:= clRed;
      end;
  end;
end;

function TFormScanResults.ROMsListViewItemCompare(
  Sender: TCustomEasyListview; Column: TEasyColumn; Group: TEasyGroup;
  Item1, Item2: TEasyItem; var DoDefault: Boolean): Integer;
begin
  DoDefault:= False;
  Result:= -1;
end;

procedure TFormScanResults.ROMsListViewItemSelectionChanged(
  Sender: TCustomEasyListview; Item: TEasyItem);
var
  BarMode: ShortInt;
begin
  // MaxArcadeSystems    -> ROM/CHD Ok
  // MarArcadeSystems+1  -> ROM/CHD not found
  // MarArcadeSystems+2  -> CHD bad SHA-1 checksum
  if Item.Selected then
     begin
       BarMode:= Ord(TEasyScanInfo(Item).eImageIndex = MaxArcadeSystems+3);
       FormMain.ELV_SetSelectRibbon(BarMode, ROMsListView);
     end;
end;

function TFormScanResults.ROMsListViewGroupCompare(
  Sender: TCustomEasyListview; Item1, Item2: TEasyGroup): Integer;
var
  Item1Bios, Item2Bios, Item1Device, Item2Device, Item1Game, Item2Game: Boolean;
  Item1Title, Item2Title: String;
  //Item1Sys, Item2Sys: Byte;
begin
  // list device sets A..Z first, then bios A..Z, then games A..Z
  Item1Device:= TEasyScanGroupInfo(Item1).eIsDevice;
  Item2Device:= TEasyScanGroupInfo(Item2).eIsDevice;
  Item1Bios:= TEasyScanGroupInfo(Item1).eIsBios;
  Item2Bios:= TEasyScanGroupInfo(Item2).eIsBios;
  Item1Game:= (not Item1Device) and (not Item1Bios);
  Item2Game:= (not Item2Device) and (not Item2Bios);

  Item1Title:= TEasyScanGroupInfo(Item1).eGameTitle;
  Item2Title:= TEasyScanGroupInfo(Item2).eGameTitle;

  if TEasyScanGroupInfo(Item1).eSystem <> TEasyScanGroupInfo(Item2).eSystem then
     Exit;

  if Item1Game and Item2Game then
     Result:= FormMain.iCompare(Item1Title, Item2Title)
     //Result:= CompareText(Item1Title, Item2Title)
  else
  if (not Item1Game) and (not Item1Game) then
     begin
       if Item1Device and Item2Bios then
          Result:= -1
       else
       if Item1Bios and Item2Device then
          Result:= 1
       else
          Result:= FormMain.iCompare(Item1Title, Item2Title);
          //Result:= CompareText(Item1Title, Item2Title)
     end
  else
  if (not Item1Game) and Item2Game then
     Result:= -1
  else
     Result:= 1;

  {if (not Item1Bios) and (not Item2Bios) then
     Result:= CompareText(Item1Title, Item2Title)
  else
  if Item1Bios and Item2Bios then
     Result:= CompareText(Item1Title, Item2Title)
  else
  if Item1Bios and (not Item2Bios) then
     Result:= -1
  else
     Result:= 1;}
end;


procedure TFormScanResults.MAMEMachinesFilterSelect(Sender: TObject);
begin
  FilterGamesList;
end;


end.


