unit uArcadeGamesScanResults;

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
    fStateImageIndex,
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
    fBiosText,

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
    fROMCRC32: String;
    fROMSHA1: String;
    fROMTagIndex: Byte; // 0 -> game ROM; 1 -> device ROM; 2 -> bios ROM; 3 -> chd file

    fROMIsFromParentSet: Boolean;

    fSoftwareTitle,
    fSoftwareName: String;
    //fCategory: String;
  protected
    function GetCaptions(Column: Integer): WideString; override;
    function GetImageIndexes(Column: Integer): TCommonImageIndexInteger; override;
    function GetStateImageIndexes(Column: Integer): TCommonImageIndexInteger; override;
  public
    property eImageIndex: Integer read fImageIndex write fImageIndex;
    property eStateImageIndex: Integer read fStateImageIndex write fStateImageIndex;
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

    property eROMIsFromParentSet: Boolean read fROMIsFromParentSet write fROMIsFromParentSet; // for clone games... and for game ROMs only (no CHDs, bios/device ROMs)
    property eSoftwareTitle: String read fSoftwareTitle write fSoftwareTitle;
    property eSoftwareName: String read fSoftwareName write fSoftwareName;
  end;

  TEasyScanGroupInfo = class(TEasyGroupStored)
  private
    fImageIndex,
    fStateImageIndex,
    fSystem: Integer;
    fSystemType: ShortInt;
    fLineMode: ShortInt;

    fIsDevice: Boolean;
    fIsBios: Boolean;
    fGameName,
    fParentGameName,
    fBiosName: String;
    fGameTitle: WideString;
    fSoftwareTitle: String;
    fSoftwareName: String;
  protected
    function GetCaptions(Column: Integer): WideString; override;
    function GetImageIndexes(Column: Integer): TCommonImageIndexInteger; override;
  public
    property eImageIndex: Integer read fImageIndex write fImageIndex;
    property eStateImageIndex: Integer read fStateImageIndex write fStateImageIndex;
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

    property eSoftwareTitle: String read fSoftwareTitle write fSoftwareTitle;
    property eSoftwareName: String read fSoftwareName write fSoftwareName;
  end;

type
  TFormArcadeGamesScanResults = class(TForm)
    IL_ScanResults: TImageList;
    ROMsListView: TEasyListview;
    CoolBarTop: TCoolBar;
    PanelTop: TPanel;
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
  FormArcadeGamesScanResults: TFormArcadeGamesScanResults;

implementation

uses uMain, uStatus;

{$R *.dfm}

function TFormArcadeGamesScanResults.CheckEmptyVar(const VarStr: String): String;
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
          //2: Result:= eNameZipStatus;
          //3: Result:= eParentZipStatus;
          //4: Result:= eBiosZipStatus;
          //5: Result:= eSoftwareTitle;
          6: Result:= eROMCRC32;
        //else
        //  if eLineMode > 6 then
        //     Result:= eDeviceZipStatus
        else
           Result:= '';
        end;
      end;
    2:
      begin
        case eLineMode of
          2: Result:= eNameZipStatus;
          3: Result:= eParentZipStatus;
          4: Result:= eBiosZipStatus;
          5: Result:= eSoftwareTitle;
          6: Result:= eROMSHA1;
        else
          if eLineMode > 6 then
             Result:= eDeviceZipStatus
        else
           Result:= '';
        end;
      end;
    3:
      begin
        if eLineMode = 6 then
           begin
             case eROMTagIndex of
               1, 4, 7, 10: // device ROM
                 begin
                   if not eIsDevice then
                      Result:= 'Device';
                 end;
               2, 5, 8, 11: // bios ROM
                 begin
                   if not eIsBios then
                      begin
                        if eSystem = idSegaModel2 then
                           begin
                             if eGameName  <> 'model2' then
                                Result:= 'Board ROM';
                           end
                        else
                           Result:= 'Bios';
                      end;
                 end;
             end;

             if (eROMCRC32 = '') and (eROMSHA1 = '') then
                Result:= FormArcadeGamesScanResults.CheckEmptyVar(Result)+'No Dump'
             else
             case eStateImageIndex of
               MaxArcadeSystems+1: Result:= FormArcadeGamesScanResults.CheckEmptyVar(Result)+'Ok';
               MaxArcadeSystems+2: Result:= FormArcadeGamesScanResults.CheckEmptyVar(Result)+'Missing';
               MaxArcadeSystems+3:
                 begin
                   if eROMCRC32 <> '' then
                      begin
                        // this is usually for ROM/Disk/Floppy/Cassette
                        Result:= FormArcadeGamesScanResults.CheckEmptyVar(Result)+'Bad CRC-32';//Checksum';
                      end
                   else
                      begin
                        // CHDs usually don't have CRC32 checksum!!!!
                        if Length(eROMSHA1) > 32 then
                           Result:= Result+'Bad SHA-1'
                        else
                           Result:= Result+'Bad MD5';
                      end;
                 end;
               //MaxArcadeSystems+3: Result:= FormScanResults.CheckEmptyVar(Result)+'Bad Checksum';
             end;
             if eROMIsFromParentSet then
                Result:= 'Parent '+Result;
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

function TEasyScanInfo.GetStateImageIndexes(Column: Integer): TCommonImageIndexInteger;
begin
  case Column of
    0: Result:= eStateImageIndex
  else
       Result:= -1;
  end;
end;

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

procedure TFormArcadeGamesScanResults.GetGamesListVersions;
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

procedure TFormArcadeGamesScanResults.LoadScanResultsFile(sysID: ShortInt; const SoftwareName: String);
var
  missFile: TMemIniFile;
  missGamesList: THashedStringList;
  tmpString, MissingROMsFileName: String;
  addGroup, checkGroup: TEasyGroup;
  addItem, checkItem: TEasyItem;
  IsSegaModel2: Boolean;
  tmpFileID: Integer;

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
    // 6 -> CRC32 / SHA-1
//////////    // 7 -> SHA-1
    // 7 - n -> device sets
    Result:= True;
    if TypeIndex > 6 then // in [7..n] then
       begin
         if not missFile.ValueExists(FormMain.TempGameVars.eName, 'device'+IntToStr(TypeIndex-6)) then
            Exit;
       end;
    addItem:= ROMsListView.Items.AddCustom(TEasyScanInfo, addGroup);
    TEasyScanInfo(addItem).eImageIndex:= 200;// dummy image index to align text with game filenames (1st column)-1;
    TEasyScanInfo(addItem).eStateImageIndex:= 200;
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
    TEasyScanInfo(addItem).eROMCRC32:= '';
    TEasyScanInfo(addItem).eROMSHA1:= '';
    TEasyScanInfo(addItem).eROMTagIndex:= 0;
  end;

  function AddGame: Boolean;
  var
    LoopROMs, BaseIconIndex: Integer;
    LineStr, iNameEntry, romName, romCRC32, romSHA1, chdParentName: String;
    romTagIndex: Byte; // 0 -> game ROM; 1 -> device ROM; 2 -> bios ROM; 3 -> chd file (game, bios, device)
    IsParentROM: Boolean;
    IsCHD: Boolean;
  begin
    Result:= True;
    // create game title ELV group
    addGroup:= ROMsListView.Groups.AddCustom(TEasyScanGroupInfo, nil);
    TEasyScanGroupInfo(addGroup).eSystem:= sysID;
    TEasyScanGroupInfo(addGroup).eImageIndex:= FormMain.TempGameVars.eROMIdentification;
    TEasyScanGroupInfo(addGroup).eStateImageIndex:= 200;
    TEasyScanGroupInfo(addGroup).eLineMode:= 1;
    TEasyScanGroupInfo(addGroup).eIsDevice:= FormMain.IsROM_Device(FormMain.TempGameVars.eROMIdentification);
    TEasyScanGroupInfo(addGroup).eIsBios:= FormMain.IsROM_Bios(FormMain.TempGameVars.eROMIdentification);
    TEasyScanGroupInfo(addGroup).eGameName:= FormMain.TempGameVars.eName;
    TEasyScanGroupInfo(addGroup).eParentGameName:= FormMain.TempGameVars.eClone;
    TEasyScanGroupInfo(addGroup).eBiosName:= FormMain.TempGameVars.eBiosName;
    TEasyScanGroupInfo(addGroup).eGameTitle:= FormMain.TempGameVars.eTitle;
    TEasyScanGroupInfo(addGroup).eSoftwareTitle:= FormMain.TempGameVars.eCategory;
    TEasyScanGroupInfo(addGroup).eSoftwareName:= FormMain.TempGameVars.eSoftwareName;

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

    BaseIconIndex:= MaxArcadeSystems+3; // from IL_ScanResults index... 0 + MaxArcadeSytems + 3 (result OK, result Not Found, result Bad CRC)
    // add ROMs entries ELV
    for LoopROMs:=0 to TEasyGameInfo(checkItem).eROMInfo.Count-1 do
    begin
      LineStr:= TEasyGameInfo(checkItem).eROMInfo[LoopROMs];
      romTagIndex:= 0; // set to ROM file type
      if FormMain.IsROMsListBasedSys(sysID) then // Daphne doesn't have this... no ROMs list
         romTagIndex:= StrToInt(LineStr[1]+LineStr[2]);

      IsParentROM:= LineStr[6] = '1';
      FormMain.GetROMDetailsInfo(LineStr, FormMain.GameIsClone(TEasyGameInfo(checkItem).eClone), romName, romCRC32, romSHA1, chdParentName);
      IsCHD:= Boolean(StrToInt(LineStr[3])); // LineStr[4] is CRC32_collision
      //IsCHD:= ((romCRC32 = '') and (romSHA1 <> '')) or
      //        (SameText(ExtractFileExt(romName), '.chd'));
      // crc32;sha1=ikaruga.chd
      iNameEntry:= FormMain.GetMissCheckEntry(romCRC32, romSHA1);

      tmpString:= missFile.ReadString(FormMain.TempGameVars.eName, iNameEntry, '');

      addItem:= ROMsListView.Items.AddCustom(TEasyScanInfo, addGroup);
      if tmpString = '' then
         TEasyScanInfo(addItem).eStateImageIndex:= MaxArcadeSystems+1 // file Ok
      else
         begin
            if tmpString = '0' then
               TEasyScanInfo(addItem).eStateImageIndex:= MaxArcadeSystems+2 // file Missing
            else
            if tmpString = '1' then
               TEasyScanInfo(addItem).eStateImageIndex:= MaxArcadeSystems+3; // CHD file found with bad SHA-1
         end;

      case isCHD of
        True:
          begin
            case romTagIndex of
              12, 13, 14: tmpFileID:= BaseIconIndex+5; // HDD (also general CHD)
              15, 16, 17: tmpFileID:= BaseIconIndex+6; // CD
              18, 19, 20: tmpFileID:= BaseIconIndex+7; // Compact Flash Card

              //12, 13, 14: tmpFileID:= 19; // HDD (also general CHD)
              //15, 16, 17: tmpFileID:= 20; // CD
              //18, 19, 20: tmpFileID:= 21; // Compact Flash Card
            end;
            //Item.ImageIndex:= 16;
          end;
        False:
          begin
            case romTagIndex of
              00, 01, 02: tmpFileID:= BaseIconIndex+1; // ROM
              03, 04, 05: tmpFileID:= BaseIconIndex+2; // Cartridge
              06, 07, 08: tmpFileID:= BaseIconIndex+3; // Floppy Disk
              09, 10, 11: tmpFileID:= BaseIconIndex+4; // Cassette Tape
              18, 19, 20: tmpFileID:= BaseIconIndex+7; // Compact Flash Card (but it's not a CHD file)

              //00, 01, 02: tmpFileID:= 15; // ROM
              //03, 04, 05: tmpFileID:= 16; // Cartridge
              //06, 07, 08: tmpFileID:= 17; // Floppy Disk
              //09, 10, 11: tmpFileID:= 18; // Cassette Tape
              //18, 19, 20: tmpFileID:= 21; // Compact Flash Card (but it's not a CHD file)
            end;
          end;
      end;
      {case isCHD of
        True:
          begin
            case romTagIndex of
              12, 13, 14: Item.ImageIndex:= 19; // HDD (also general CHD)
              15, 16, 17: Item.ImageIndex:= 20; // CD
              18, 19, 20: Item.ImageIndex:= 21; // Compact Flash Card
            end;
            //Item.ImageIndex:= 16;
          end;
        False:
          begin
            case romTagIndex of
              00, 01, 02: Item.ImageIndex:= 15; // ROM
              03, 04, 05: Item.ImageIndex:= 16; // Cartridge
              06, 07, 08: Item.ImageIndex:= 17; // Floppy Disk
              09, 10, 11: Item.ImageIndex:= 18; // Cassette Tape
              18, 19, 20: Item.ImageIndex:= 21; // Compact Flash Card (but it's not a CHD file)
            end;
          end;
      end;}
      {
      if romTag > 2 then
         tmpFileID:= 16
      else
         begin
           if FormMain.TempGameVars.eSoftwareName = '' then
              begin
                if FormMain.IsDecoCassMachine(FormMain.TempGameVars.eDriverName) then
                   begin
                     case SameText(ExtractFileExt(romName), '.cas') of
                       True : tmpFileID:= 19;
                       False: tmpFileID:= 15;
                     end;
                   end
                else
                if FormMain.IsSEGASystem24Machine(FormMain.MemGameInfo.eDriverName) then
                   begin
                     case SameText(ExtractFileExt(romName), '.img') of
                       True : tmpFileID:= 18;
                       False: tmpFileID:= 15;
                     end;
                   end
                else
                   tmpFileID:= 15
              end
           else
              begin
                if PosEx('cart', FormMain.TempGameVars.eSoftwareExecParameter) <> 0 then
                   tmpFileID:= 17
                else
                if PosEx('flop', FormMain.TempGameVars.eSoftwareExecParameter) <> 0 then
                   tmpFileID:= 18
                else
                if PosEx('cass', FormMain.TempGameVars.eSoftwareExecParameter) <> 0 then
                   tmpFileID:= 19
                else
                   tmpFileID:= 15; // ROM image
              end;
         end;
      }
      TEasyScanInfo(addItem).eImageIndex:= tmpFileID;
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
      TEasyScanInfo(addItem).eROMTagIndex:= romTagIndex;
      TEasyScanInfo(addItem).eROMIsFromParentSet:= IsParentROM;
      TEasyScanInfo(addItem).eSoftwareName:= TEasyScanGroupInfo(addGroup).eSoftwareName;
      TEasyScanInfo(addItem).eSoftwareTitle:= TEasyScanGroupInfo(addGroup).eSoftwareTitle;
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

procedure TFormArcadeGamesScanResults.ResizeForm;
begin
  if Screen.Width > 2560 then
     begin
       // for 4K resolution 3840x2160
       ROMsListView.ImagesGroup:= FormMain.IL_StandardIconsStandard;
       ROMsListView.ImagesSmall:= IL_ScanResults;
       FormArcadeGamesScanResults.ClientWidth:= FormArcadeGamesScanResults.ClientWidth+500;
       ROMsListView.Font.Size:= 14;
       ROMsListView.GroupFont.Size:= 15;
       ROMsListView.PaintInfoGroup.MarginTop.Size:= 40;
       //ROMsListView.PaintInfoGroup.MarginBottom.Size:= 38;
       ROMsListView.PaintInfoItem.ImageIndent:= 5;
       ROMsListView.CellSizes.Report.Height:= 28;//40;
       ROMsListView.Header.Columns[0].Width:= 618; // 281 is the difference...
       ROMsListView.Header.Columns[1].Width:= 88;
       ROMsListView.Header.Columns[2].Width:= 408;
       ROMsListView.Header.Columns[3].Width:= 195;

       IL_ScanResults.Width:=  24;
       IL_ScanResults.Height:= 24;

       Exit;
     end;

  if Screen.Width >= 1024 then
     Exit;

  if Screen.Height = 600 then
     begin
       FormArcadeGamesScanResults.ClientHeight:= 500;
       SystemSelectorToolBar.Left:= SystemSelectorToolBar.Left-35;
       ButtonClose.Left:= ButtonClose.Left-35;
       FormArcadeGamesScanResults.ClientWidth:= 774;
       ROMsListView.Header.Columns[0].Width:= ROMsListView.Header.Columns[0].Width-35;
     end
  else
  if Screen.Height = 480 then
     begin
       SystemSelectorToolBar.Left:= SystemSelectorToolBar.Left-190;
       ButtonClose.Left:= ButtonClose.Left-190;
       LabelEmulatorVersion.Font.Size:= 7;
       LabelGamesListList.Font.Size:= 7;
       LabelGamesListList.Font.Name:= 'Segoe UI';
       LabelGamesListList.Caption:= 'List :';
       LabelGamesListVersion.Font.Size:= 7;
       LabelGamesListVersion.Font.Name:= 'Segoe UI';
       LabelGamesListVersion.Left:= 73;
       SystemSelectorToolBar.Left:= 404;
       MAMEMachinesFilterIcon.Left:= 240;
       MAMEMachinesFilter.Left:= 259;
       FormArcadeGamesScanResults.ClientWidth:= 624;
       ROMsListView.Header.Columns[0].Width:= ROMsListView.Header.Columns[0].Width-60;
       //ROMsListView.Header.Columns[0].Width:= 262;
     end;
end;

procedure TFormArcadeGamesScanResults.FormShow(Sender: TObject);
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
      FormMain.AddDefaultIcons(FormMain.GetArcadeSystemIconFileName(Loop), tempFolder, IL_ScanResults);
  FormMain.AddDefaultIcons('scanresult_ok.ico', tempFolder, IL_ScanResults);            // 09
  FormMain.AddDefaultIcons('scanresult_notfound.ico', tempFolder, IL_ScanResults);      // 10
  FormMain.AddDefaultIcons('scanresult_badcrc.ico', tempFolder, IL_ScanResults);        // 11

  FormMain.AddDefaultIcons('bios_chip.ico', tempFolder, IL_ScanResults);                // 12

  FormMain.AddDefaultIcons('media_cartridge.ico', tempFolder, IL_ScanResults);          // 13
  FormMain.AddDefaultIcons('media_floppydisk.ico', tempFolder, IL_ScanResults);         // 14
  FormMain.AddDefaultIcons('media_cassettetape.ico', tempFolder, IL_ScanResults);       // 15

  FormMain.AddDefaultIcons('chd.ico', tempFolder, IL_ScanResults);                      // 16 -> this is also used for "Hard Disk Drive" media type... 
  FormMain.AddDefaultIcons('media_disc.ico', tempFolder, IL_ScanResults);               // 17
  FormMain.AddDefaultIcons('media_flashcard.ico', tempFolder, IL_ScanResults);          // 18

  for Loop:=0 to SystemSelectorToolBar.ButtonCount-1 do
      SystemSelectorToolBar.Buttons[Loop].Hint:= FormMain.GetArcadeEmulatorDescription(SystemSelectorToolBar.Buttons[Loop].ImageIndex);

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
     begin
       ROMsListView.BeginUpdate;
       ROMsListView.Header.Columns[0].Width:= ROMsListView.Header.Columns[0].Width-GetSystemMetrics(SM_CXVSCROLL);
       ROMsListView.EndUpdate;
     end;

  if FormStatus.Visible then
     FormStatus.Close;
end;

procedure TFormArcadeGamesScanResults.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #27 then
     ButtonClose.Click;
end;

procedure TFormArcadeGamesScanResults.ButtonToggleTreeClick(Sender: TObject);
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

procedure TFormArcadeGamesScanResults.FilterGamesList;
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

procedure TFormArcadeGamesScanResults.sysMAMEClick(Sender: TObject);
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

procedure TFormArcadeGamesScanResults.ROMsListViewItemPaintText(
  Sender: TCustomEasyListview; Item: TEasyItem; Position: Integer;
  ACanvas: TCanvas);

  function LowerFontSize: Boolean;
  begin
    if IL_ScanResults.Width > 16 then
       begin
         if ACanvas.Font.Size > 10 then
            ACanvas.Font.Size:= ACanvas.Font.Size-1;
       end;
  end;

begin
  case Position of
    0: // file name
      begin
        if (TEasyScanInfo(Item).eLineMode in [2..5]) or (TEasyScanInfo(Item).eLineMode > 6) then
           begin
             ACanvas.Font.Name:= 'Consolas';
             //ACanvas.Font.Style:= [fsBold];
             //ACanvas.Font.Color:= $00a65300;
           end
        else
           LowerFontSize;
      end;
    1: // CRC32
      begin
        if TEasyScanInfo(Item).eLineMode = 6 then
           begin
             ACanvas.Font.Name:= 'Consolas';
           end;
        //if not (TEasyScanInfo(Item).eLineMode in [2..5]) then
        //if TEasyScanInfo(Item).eLineMode <> 5 then
        //ACanvas.Font.Size:= 9;
      end;
    2: // SHA-1 (new September 14, 2016)
      begin
        if TEasyScanInfo(Item).eLineMode = 6 then // shoud I use eLineMode = 7 ??????
           begin
             ACanvas.Font.Name:= 'Consolas';
           end;
      end;
    3: // Status
      begin
        // MarArcadeSystems+1
        //if (TEasyScanInfo(Item).eLineMode > 5) then//and (TEasyScanInfo(Item).eImageIndex = MaxArcadeSystems+1) then
        if TEasyScanInfo(Item).eStateImageIndex in [MaxArcadeSystems+2, MaxArcadeSystems+3] then
           ACanvas.Font.Color:= clRed;
        LowerFontSize;
      end;
  end;
end;

function TFormArcadeGamesScanResults.ROMsListViewItemCompare(
  Sender: TCustomEasyListview; Column: TEasyColumn; Group: TEasyGroup;
  Item1, Item2: TEasyItem; var DoDefault: Boolean): Integer;
begin
  DoDefault:= False;
  Result:= -1;
end;

procedure TFormArcadeGamesScanResults.ROMsListViewItemSelectionChanged(
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

function TFormArcadeGamesScanResults.ROMsListViewGroupCompare(
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


procedure TFormArcadeGamesScanResults.MAMEMachinesFilterSelect(Sender: TObject);
begin
  FilterGamesList;
end;


end.


