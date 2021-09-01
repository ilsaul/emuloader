unit uArcadeScanGamesResults;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  StdCtrls, ImgList, IniFiles, ComCtrls, uCommon, MPCommonObjects,
  MPCommonUtilities, EasyListview, ExtCtrls, ToolWin, Buttons, ShadowLabel,
  PanelEx, Menus, BarMenus, ColorBoxEx, ButtonsEx, TntStdCtrls, TntEditEx,
  AdvOfficeButtons;

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

    fGameSize,

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

    fROMName,
    fROMCRC32,
    fROMSHA1,
    fROMSize: String;
    fROMTagIndex: Byte; // 0 -> game ROM; 1 -> device ROM; 2 -> bios ROM; 3 -> chd file

    fROMIsFromParentSet: Boolean;
    fROMDeviceName: String;

    fSoftwareTitle,
    fSoftwareName: String;

    fIsMerged: Boolean;

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

    property eGameSize: String read fGameSize write fGameSize;
    
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
    property eROMCRC32: String read fROMCRC32 write fROMCRC32;
    property eROMSHA1: String read fROMSHA1 write fROMSHA1;
    property eROMSize: String read fROMSize write fROMSize;
    property eROMTagIndex: Byte read fROMTagIndex write fROMTagIndex;

    property eROMIsFromParentSet: Boolean read fROMIsFromParentSet write fROMIsFromParentSet; // for clone games... and for game ROMs only (no CHDs, bios/device ROMs)
    property eROMDeviceName: String read fROMDeviceName write fROMDeviceName; // for

    property eSoftwareTitle: String read fSoftwareTitle write fSoftwareTitle;
    property eSoftwareName: String read fSoftwareName write fSoftwareName;

    property eIsMerged: Boolean read fIsMerged write fIsMerged;
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
    fIsMerged: Boolean;
    fHaveGameROMs: ShortInt; // 1 - have game ROMs; 0 -> no game ROMs, maybe only bios ROMs, device ROMs
    fCHDsCount: Byte;
    fHavedeviceROMs: Boolean;
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

    property eIsMerged: Boolean read fIsMerged write fIsMerged;
    property eHaveGameROMs: ShortInt read fHaveGameROMs write fHaveGameROMs; // game ROMs ? or it's just bios ROMs and/or device ROMs or nothing at all
    property eCHDsCount: Byte read fCHDsCount write fCHDsCount;
    property eHaveDeviceROMs: Boolean read fHaveDeviceROMs write fHaveDeviceROMs;
  end;

type
  TFormArcadeScanGamesResults = class(TForm)
    ROMsListView: TEasyListview;
    TopBar: TPanelEx;
    SystemIcon: TImage;
    LabelEmulatorVersion: TShadowLabel;
    LabelGamesListVersion: TShadowLabel;
    LabelTotalGames: TShadowLabel;
    MAMEMachinesFilterIcon: TImage;
    MAMEMachinesFilter: TComboBox2Ex;
    ButtonToggleTree: TBitBtnEx;
    SearchBarEdit: TTntEditEx;
    LabelSearchBar: TShadowLabel;
    SetsFilter_CHDs: TAdvOfficeCheckBoxEx;
    SetsFilter_DeviceROMs: TAdvOfficeCheckBoxEx;
    SetsFilter_BiosROMs: TAdvOfficeCheckBoxEx;
    ButtonFilterTitleApply_ToolBar: TSpeedButtonEx;
    sysMAME: TSpeedButtonEx;
    sysSupermodelSEGAModel3: TSpeedButtonEx;
    sysDemul: TSpeedButtonEx;
    sysHBMAME: TSpeedButtonEx;
    sysDICE: TSpeedButtonEx;
    sysSEGAModel2: TSpeedButtonEx;
    sysZiNc: TSpeedButtonEx;
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
    procedure PopupSplittersMeasureMenuItem(Sender: TObject;
      AMenuItem: TMenuItem; ACanvas: TCanvas; var Width, Height: Integer;
      ABarVisible: Boolean; var DefaultMeasure: Boolean);
    procedure ButtonFilterTitleApply_ToolBarClick(Sender: TObject);
    procedure SearchBarEditKeyPress(Sender: TObject; var Key: Char);
    procedure SetsFilter_CHDsClick(Sender: TObject);
  private
    { Private declarations }
    GamesListVersion: packed array[1..MaxArcadeSystems] of String;
    sysSelectButton: Integer;
    HaveDevices: Boolean;
    
    function  CheckEmptyVar(const VarStr: String): String;
    procedure GetGamesListVersions;
    procedure LoadScanResultsFile(sysID: ShortInt; const SoftwareName: String);
    procedure FilterGamesList;
    procedure SearchGame;
    procedure Resize4K;
  public
    { Public declarations }
    SingleGame: Boolean;
  end;

var
  FormArcadeScanGamesResults: TFormArcadeScanGamesResults;

implementation

uses uMain, uStatus;

{$R *.dfm}

function TFormArcadeScanGamesResults.CheckEmptyVar(const VarStr: String): String;
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
          6: Result:= eROMCRC32;
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
    3: // file size
      begin
        Result:= eROMSize;
      end;
    4: // device name
      begin
        if eLineMode = 6 then
           begin
             if FormMain.IsFileID_DeviceROM(eROMTagIndex) then
                begin
                  if not eIsDevice then
                     Result:= eROMDeviceName;
                end;
           end;
      end;
    5: // file status
      begin
        if eLineMode = 6 then
           begin
             if eROMIsFromParentSet and
                (not eIsDevice) and
                (not eIsBios) then //and
                //FormMain.IsFileID_GameROM(eROMTagIndex) and FormMain.IsFileID_GameCHD(eROMTagIndex) then
                Result:= 'Parent';

             if FormMain.IsFileID_DeviceROM(eROMTagIndex) then
                begin // device ROM
                  if not eIsDevice then
                     Result:= FormArcadeScanGamesResults.CheckEmptyVar(Result)+'Device';
                     //Result:= 'Device';
                end
             else
             if FormMain.IsFileID_BiosROM(eROMTagIndex) then
                begin // bios ROM
                  if not eIsBios then
                     begin
                       if eSystem = idSegaModel2 then
                          begin
                            if eGameName  <> 'model2' then
                               Result:= FormArcadeScanGamesResults.CheckEmptyVar(Result)+'Board ROM';// Result:= 'Board ROM';
                          end
                       else
                          Result:= FormArcadeScanGamesResults.CheckEmptyVar(Result)+'Bios';// Result:= 'Bios';
                     end;
                end;

             if (eROMCRC32 = '') and (eROMSHA1 = '') then
                Result:= FormArcadeScanGamesResults.CheckEmptyVar(Result)+'No Dump'
             else
             case eStateImageIndex of
               0: {MaxArcadeSystems+1: }Result:= FormArcadeScanGamesResults.CheckEmptyVar(Result)+'Ok';
               1: {MaxArcadeSystems+2: }Result:= FormArcadeScanGamesResults.CheckEmptyVar(Result)+'Missing';
               2: //MaxArcadeSystems+3:
                 begin
                   if eROMCRC32 <> '' then
                      begin
                        // this is usually for ROM/Disk/Floppy/Cassette
                        Result:= FormArcadeScanGamesResults.CheckEmptyVar(Result)+'Bad CRC-32';
                      end
                   else
                      begin
                        // CHDs usually don't have CRC32 checksum
                        if Length(eROMSHA1) > 32 then
                           Result:= Result+'Bad SHA-1'
                        else
                           Result:= Result+'Bad MD5';
                      end;
                 end;
             end;

             //if eROMIsFromParentSet and
             //   (not eIsDevice) and
             //   (not eIsBios) then //and
             //   //FormMain.IsFileID_GameROM(eROMTagIndex) and FormMain.IsFileID_GameCHD(eROMTagIndex) then
             //   Result:= 'Parent '+Result;
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
    0: Result:= FormMain.GetMAMEImageIndex(eImageIndex, eSoftwareName, 0) // game status is always "HAVE"
  else
     Result:= -1;
  end;
end;

procedure TFormArcadeScanGamesResults.Resize4K;

  procedure MoveButton(iButton: TSpeedButtonEx; iNextButton: TSpeedButtonEx);
  var
    iPos2, iW, iTop: Integer;
  begin
    iW:= 36;
    iTop:= -1;

    if iNextButton <> nil then
       iPos2:= iNextButton.Left-iW-1
    else
       iPos2:= ClientWidth-10-iW;

    FormMain.Set4KButtonSpecs(iButton, iPos2, 10, iW, iW+1, 16, -1, FormMain.IL_StandardIconsLarge);
  end;

begin
  if not Is4KMode then
     Exit;

  with FormArcadeScanGamesResults do
  begin
    ClientWidth:= 1938;
    ClientHeight:= 1200;
    Font.Size:= 16;

    TopBar.Height:= 150;
    FormMain.Set4KImageIconSpecs(SystemIcon, 128, 10, 10);
    FormMain.Set4KLabelSpecs(LabelEmulatorVersion,   150, 10,  -1, -1, 18);
    FormMain.Set4KLabelSpecs(LabelGamesListVersion,  150, 54,  -1, -1, 14);
    FormMain.Set4KLabelSpecs(LabelTotalGames,        150, 105, -1, -1, 16);

    FormMain.Set4KImageIconSpecs(MAMEMachinesFilterIcon, 32, 539, 98);
    FormMain.Set4KComboBoxSpecs(MAMEMachinesFilter, MAMEMachinesFilterIcon.Left+MAMEMachinesFilterIcon.Width+10, MAMEMachinesFilterIcon.Top-1, 215);

    FormMain.Set4KCheckBoxSpecs(SetsFilter_CHDs, MAMEMachinesFilter.Left+MAMEMachinesFilter.Width+20, MAMEMachinesFilter.Top, 135, 36, 16);
    FormMain.Set4KCheckBoxSpecs(SetsFilter_DeviceROMs, SetsFilter_CHDs.Left+144,                      SetsFilter_CHDs.Top,    157, 36, 16);
    FormMain.Set4KCheckBoxSpecs(SetsFilter_BiosROMs, SetsFilter_DeviceROMs.Left+167,                  SetsFilter_CHDs.Top,    132, 36, 16);

    MoveButton(sysZiNc, nil);
    MoveButton(sysSEGAModel2,           sysZiNc);
    MoveButton(sysDICE,                 sysSEGAModel2);
    MoveButton(sysHBMAME,               sysDICE);
    MoveButton(sysDemul,                sysHBMAME);
    MoveButton(sysSupermodelSEGAModel3, sysDemul);
    MoveButton(sysMAME,                 sysSupermodelSEGAModel3);

    FormMain.Set4KButtonSpecs(ButtonFilterTitleApply_ToolBar, ClientWidth-36-10, SetsFilter_CHDs.Top, 36, 37);

    FormMain.Set4KEditSpecs(SearchBarEdit, ButtonFilterTitleApply_ToolBar.Left-250-4, SetsFilter_CHDs.Top, 250, 36, 16);
    FormMain.Set4KEditFontNameSpecs(SearchBarEdit);
    FormMain.Set4KLabelSpecs(LabelSearchBar, -1, SearchBarEdit.Top+2, -1, -1, 16);
    LabelSearchBar.Left:= SearchBarEdit.Left-LabelSearchBar.Width-10;

    FormMain.Set4KButtonSpecs(ButtonToggleTree, 0, ROMsListView.Top, 39, 39, 14);

    ROMsListView.CellSizes.Report.Height:= 38;
    FormMain.Set4KListViewSpecs(ROMsListView, -1, -1, -1, -1, 16, True, 18);
    FormMain.Set4KListViewHeaderFontSizeSpecs(ROMsListView);

    ROMsListView.ImagesGroup:= FormMain.IL_StandardIconsLarge;
    ROMsListView.ImagesSmall:= FormMain.IL_MediaType_Large;
    ROMsLisTView.ImagesState:= FormMain.IL_Misc_Large;

    ROMsListView.Header.Columns[0].Caption:= '      Name';
    ROMsListView.Header.Columns[0].Width:= 704;
    ROMsListView.Header.Columns[1].Width:= 120;
    ROMsListView.Header.Columns[2].Width:= 504;
    ROMsListView.Header.Columns[3].Width:= 180;
    ROMsListView.Header.Columns[4].Width:= 250;
    ROMsListView.Header.Columns[5].Width:= 180;

    ROMsListView.PaintInfoColumn.CaptionIndent:= 4; // reset to default value
    ROMsListView.PaintInfoGroup.MarginTop.Size:= 50;
    ROMsListView.PaintInfoGroup.ImageIndent:= 25;
    ROMsListView.PaintInfoGroup.BandIndent:= ButtonToggleTree.Width;
    ROMsListView.PaintInfoGroup.BandLength:= 1180;
  end;
end;

procedure TFormArcadeScanGamesResults.GetGamesListVersions;
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

procedure TFormArcadeScanGamesResults.LoadScanResultsFile(sysID: ShortInt; const SoftwareName: String);
var
  missFile: TMemIniFile;
  missGamesList: THashedStringList;
  tmpString, MissingROMsFileName: String;
  addGroup, checkGroup: TEasyGroup;
  addItem, checkItem: TEasyItem;
  IsSegaModel2: Boolean;
  tmpFileID: Integer;

  function IsCHDGameOnly: Boolean;
  begin
    // no game set, no bios set, no device sets
    Result:= not FormMain.GameHaveROMs(FormMain.TempGameVars.eHaveGameROMs);
    if Result then
       begin
         Result:= FormMain.TempGameVars.eCHDsCount > 0;
         if Result then
            begin
              Result:= uMain.TEasyGameInfo(checkItem).eDeviceSets = nil;
              if Result then
                 Result:= not FormMain.ValidateBiosName(FormMain.MemGameInfo.eBiosName, FormMain.MemGameInfo.eName);
            end;
       end;
  end;

  function IsBiosSetOnly: Boolean;
  begin
    // if is a bios set (gamename=bios, biosname = '' or biosname=gamename), return FALSE, and ADD string "zip not found".
    // if is a game set, check for Taito G-NET and others alike... bios set only + CHD file
    // return TRUE, and DO NOT add string "zip not found"
    Result:= FormMain.ValidateBiosName(FormMain.MemGameInfo.eBiosName, FormMain.MemGameInfo.eName);
    if Result then
       Result:= not FormMain.GameHaveROMs(FormMain.MemGameInfo.eHaveGameROMs);
  end;

  function IsDeviceSetOnly: Boolean;
  begin
    // no main game set, just device sets
    Result:= uMain.TEasyGameInfo(checkItem).eDeviceSets <> nil;
    if Result then
       Result:= not FormMain.GameHaveROMs(FormMain.MemGameInfo.eHaveGameROMs);
  end;

  function GetZipStatusText(FileTypeIndex: Integer; const Data_String: String; Data_FileStatus: Boolean; ShowMergedStatus: Boolean = False): String;
  var
    tmpString2: String;
  begin
    Result:= '';
    if Data_String = '' then
       Exit;

    if ShowMergedStatus and FormMain.TempGameVars.eIsMerged then
       begin
         Result:= Data_String+' (merged)';
       end
    else
       begin
         case FileTypeIndex of
           2: // game name
             begin
               if FormMain.TempGameVars.eIsMerged then
                  Result:= Data_String+' (merged)'
               else
               if FormMain.TempGameVars.eGameROMsNoDump then
                  Result:= Data_String+' (No Game ROMs)'
               else
               begin
                  if Data_FileStatus then
                     tmpString2:= ''
                  else
                     tmpString2:= 'not ';
                  Result:= Data_String+'.zip '+tmpString2+'found';
               end;
             end;
           3: // parent game name (clone of)
             begin
               if FormMain.TempGameVars.eParentGameROMsNoDump then
                  Result:= Data_String+' (No Game ROMs)'
               else
               begin
                 if Data_FileStatus then
                     tmpString2:= ''
                  else
                     tmpString2:= 'not ';
                  Result:= Data_String+'.zip '+tmpString2+'found';
               end;
             end;
           else // all other indexes 4..?
             begin
               if Data_FileStatus then
                  tmpString2:= ''
               else
                  tmpString2:= 'not ';
               Result:= Data_String+'.zip '+tmpString2+'found';
             end;
         end;
         //// original code
         //case Data_FileStatus of
         //  True : tmpString2:= '';
         //  False: tmpString2:= 'not ';
         //end;
         //Result:= Data_String+'.zip '+tmpString2+'found';
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
         TEasyScanInfo(addItem).eNameZipStatus:= GetZipStatusText(TypeIndex, FormMain.TempGameVars.eName, Boolean(StrToInt(missFile.ReadString(FormMain.TempGameVars.eName, 'zip_game', '0'))));//, FormMain.GameIsClone(FormMain.TempGameVars.eClone));
       end;

    if TypeIndex = 3 then
       begin
         TEasyScanInfo(addItem).eParentText:= Format('%-9s: %s', ['parent', FormMain.TempGameVars.eClone]);
         TEasyScanInfo(addItem).eParentZipStatus:= GetZipStatusText(TypeIndex, FormMain.TempGameVars.eClone, Boolean(StrToInt(missFile.ReadString(FormMain.TempGameVars.eName, 'zip_parentgame', '0'))));
       end;

    if TypeIndex = 4 then
       begin
         if IsSegaModel2 then
            TEasyScanInfo(addItem).eBiosText:= Format('%-9s: %s', ['board', FormMain.TempGameVars.eBiosName])
         else
            TEasyScanInfo(addItem).eBiosText:= Format('%-9s: %s', ['bios', FormMain.TempGameVars.eBiosName]);
         TEasyScanInfo(addItem).eBiosZipStatus:= GetZipStatusText(TypeIndex, FormMain.TempGameVars.eBiosName, Boolean(StrToInt(missFile.ReadString(FormMain.TempGameVars.eName, 'zip_bios', '0'))));
       end;

    if TypeIndex = 5 then
       begin
         TEasyScanInfo(addItem).eSoftwareName:= Format('%-9s: %s', ['software', FormMain.TempGameVars.eSoftwareName]);
         TEasyScanInfo(addItem).eSoftwareTitle:= FormMain.TempGameVars.eCategory;
       end;

    if TypeIndex > 6 then // in [7..n] then
       begin
         DeviceName:= missFile.ReadString(FormMain.TempGameVars.eName, 'device'+IntToStr(TypeIndex-6), '');
         ZipStatus:= GetZipStatusText(TypeIndex, DeviceName, Boolean(StrToInt(missFile.ReadString(FormMain.TempGameVars.eName, 'zip_device'+IntToStr(TypeIndex-6), '0'))));
         DeviceName:= Format('device %.2u: %s', [(TypeIndex-6), DeviceName]);
         TEasyScanInfo(addItem).eDeviceText:= DeviceName;
         TEasyScanInfo(addItem).eDeviceZipStatus:= ZipStatus;
       end;

    TEasyScanInfo(addItem).eROMName:= '';
    TEasyScanInfo(addItem).eROMCRC32:= '';
    TEasyScanInfo(addItem).eROMSHA1:= '';
    TEasyScanInfo(addItem).eROMSize:= '';
    TEasyScanInfo(addItem).eROMTagIndex:= 0;
    TEasyScanInfo(addItem).eROMDeviceName:= '';
  end;

  function FileSizeStr(iFileSize: Int64; const CHDFileName: WideString; iArcadeMediaType: Integer): String;
  var
    iSize: Int64;
  begin
    Result:= '';

    iSize:= 0;
    if iArcadeMediaType > 11 then
       begin
         // it's a CHD file; must get the file size, if file exists
         if CHDFileName <> '' then
            begin
              iSize:= GetFileSizeW(CHDFileName);
              if iSize < 1 then
                 Exit;
            end;
       end
    else
       iSize:= iFileSize;
    if iSize > 0 then
       Result:= FormMain.GetSizeType(iSize, (iArcadeMediaType in [3, 4, 5])); // ROM size
  end;

  function AddGame(HaveDeviceSets: Boolean): Boolean;
  var
    LoopROMs, IcoIndexSubtract: Integer;
    LineStr, iNameEntry, romName, romCRC32, romSHA1, chdParentName, romDeviceName: String;
    iCHDFile: WideString;
    romSize: Int64;
    romTagIndex: Byte;
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

    TEasyScanGroupInfo(addGroup).eIsMerged:= FormMain.TempGameVars.eIsMerged;
    TEasyScanGroupInfo(addGroup).eHaveGameROMs:= FormMain.TempGameVars.eHaveGameROMs;
    TEasyScanGroupInfo(addGroup).eCHDsCount:= FormMain.TempGameVars.eCHDsCount;
    TEasyScanGroupInfo(addGroup).eHaveDeviceROMs:= HaveDeviceSets;

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

    //HaveMultipleDeviceSets:= Assigned(TEasyGameInfo(checkItem).eDeviceSets) and (TEasyGameInfo(checkItem).eDeviceSets.Count > 1);

    if Is4KMode then
       IcoIndexSubtract:= 15 // IL_MediaType_Large (32x32)
    else
       IcoIndexSubtract:= 0; // IL_LeftPanel (16x16)

    //BaseIconIndex:= MaxArcadeSystems+3; // from IL_ScanResults index... 0 + MaxArcadeSytems + 3 (result OK, result Not Found, result Bad CRC)
    // add ROMs entries ELV
    for LoopROMs:=0 to TEasyGameInfo(checkItem).eROMInfo.Count-1 do
    begin
      LineStr:= TEasyGameInfo(checkItem).eROMInfo[LoopROMs];
      romTagIndex:= 0; // set to ROM file type
      if FormMain.IsROMsListBasedSys(sysID) then // Daphne doesn't have this... no ROMs list
         romTagIndex:= StrToInt(LineStr[1]+LineStr[2]);

      IsParentROM:= LineStr[6] = '1';
      FormMain.GetROMDetailsInfo(LineStr, FormMain.GameIsClone(TEasyGameInfo(checkItem).eClone), romName, romCRC32, romSHA1, chdParentName, romDeviceName);

      romSize:= 0;
      tmpString:= SoftListGetEntryValue(LineStr, 'size');
      if tmpString <> '' then
         romSize:= StrToInt(tmpString);

      IsCHD:= Boolean(StrToInt(LineStr[3])); // LineStr[4] is CRC32_collision

      // crc32;sha1=ikaruga.chd
      iNameEntry:= FormMain.GetMissCheckEntry(romCRC32, romSHA1);

      tmpString:= missFile.ReadString(FormMain.TempGameVars.eName, iNameEntry, '');

      addItem:= ROMsListView.Items.AddCustom(TEasyScanInfo, addGroup);
      if tmpString = '' then
         TEasyScanInfo(addItem).eStateImageIndex:= 0 //MaxArcadeSystems+1 // file Ok
      else
         begin
            if tmpString = '0' then
               TEasyScanInfo(addItem).eStateImageIndex:= 1 //MaxArcadeSystems+2 // file Missing
            else
            if tmpString = '1' then
               TEasyScanInfo(addItem).eStateImageIndex:= 2 //MaxArcadeSystems+3; // CHD file found with bad SHA-1
         end;

      iCHDFile:= '';
      case isCHD of
        True:
          begin
            case romTagIndex of
              12, 13, 14: tmpFileID:= 22-IcoIndexSubtract; // HDD (also general CHD)
              15, 16, 17: tmpFileID:= 20-IcoIndexSubtract; // CD
              18, 19, 20: tmpFileID:= 21-IcoIndexSubtract; // Compact Flash Card
              21, 22, 23: tmpFileID:= 23-IcoIndexSubtract; // Video Tape (VHS)
            end;

            if TEasyScanInfo(addItem).eStateImageIndex in [0, 2] then // [MaxArcadeSystems+1, MaxArcadeSystems+3] then
               begin
                 // CHD is OK or have bad SHA-1 / MD-5 checksum
                 iCHDFile:= FormMain.SearchCHDFolder(romName, FormMain.TempGameVars.eName, FormMain.TempGameVars.eBiosName, FormMain.TempGameVars.eClone, FormMain.TempGameVars.eSystemID, FormMain.TempGameVars.eSoftwareName);

                 //if sysID = idZiNc then
                 //   iCHDFile:= FormMain.SearchZiNcCHDFolder(romName, FormMain.TempGameVars.eName, ZiNcFilePath)
                 //else
                 //   iCHDFile:= FormMain.SearchCHDFolder(romName, FormMain.TempGameVars.eName, FormMain.TempGameVars.eBiosName, FormMain.TempGameVars.eClone, FormMain.TempGameVars.eSystemID, FormMain.TempGameVars.eSoftwareName);
               end;
          end;
        False:
          begin
            if FormMain.TempGameVars.eSoftwareName = 'vgmplay' then
               tmpFileID:= 24-IcoIndexSubtract
            else
            case romTagIndex of
              00, 01, 02: tmpFileID:= 15-IcoIndexSubtract; // ROM
              03, 04, 05: tmpFileID:= 16-IcoIndexSubtract; // Cartridge
              06, 07, 08: tmpFileID:= 17-IcoIndexSubtract; // Floppy Disk
              09, 10, 11: tmpFileID:= 18-IcoIndexSubtract; // Cassette Tape
              12, 13, 14: tmpFileID:= 22-IcoIndexSubtract; // HDD... is there any game ROMs with region="hdd" ???? not sure but better to have this here!!!
              15, 16, 17: tmpFileID:= 20-IcoIndexSubtract; // CD (Demul (v5.8.2) have .bin files ROMs that are actually image CDs
              18, 19, 20: tmpFileID:= 21-IcoIndexSubtract; // Compact Flash Card (but it's not a CHD file)... "Konami System 573"
              21, 22, 23: tmpFileID:= 23-IcoIndexSubtract; // Video Tape (VHS) (but it's not a CHD file)...
            end;
          end;
      end;
      
      TEasyScanInfo(addItem).eImageIndex:= tmpFileID;
      TEasyScanInfo(addItem).eLineMode:= 6;
      TEasyScanInfo(addItem).eIsDevice:= TEasyScanGroupInfo(addGroup).eIsDevice;
      TEasyScanInfo(addItem).eIsBios:= TEasyScanGroupInfo(addGroup).eIsBios;
      TEasyScanInfo(addItem).eGameName:= '';
      TEasyScanInfo(addItem).eParentGameName:= '';
      TEasyScanInfo(addItem).eBiosName:= '';
      TEasyScanInfo(addItem).eGameTitle:= '';
      TEasyScanInfo(addItem).eROMName:= romName;
      TEasyScanInfo(addItem).eROMCRC32:= romCRC32;
      TEasyScanInfo(addItem).eROMSHA1:= romSHA1;
      TEasyScanInfo(addItem).eROMSize:= FileSizeStr(romSize, iCHDFile, romTagIndex); // ROM size
      TEasyScanInfo(addItem).eROMTagIndex:= romTagIndex;
      //if HaveMultipleDeviceSets then
         TEasyScanInfo(addItem).eROMDeviceName:= romDeviceName;
      //else
      //   TEasyScanInfo(addItem).eROMDeviceName:= '';
      TEasyScanInfo(addItem).eROMIsFromParentSet:= IsParentROM;
      TEasyScanInfo(addItem).eSoftwareName:= TEasyScanGroupInfo(addGroup).eSoftwareName;
      TEasyScanInfo(addItem).eSoftwareTitle:= TEasyScanGroupInfo(addGroup).eSoftwareTitle;

      if not TEasyScanInfo(addItem).eIsDevice then
         begin
           if romDeviceName <> '' then
              HaveDevices:= True;
         end;
    end;
  end;

  function CheckSysToSelect: Boolean;
  begin
    if sysSelectButton = sysID then
       sysSelectButton:= -1;
    Result:= True;
  end;

  procedure EnableToolButton(iButton: TSpeedButtonEx);
  begin
    iButton.Enabled:= True;
    if iButton.Tag = sysSelectButton then
       iButton.Down:= True;
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

  case sysID of
    1: EnableToolButton(sysMAME);
    2: EnableToolButton(sysSupermodelSEGAModel3);
    4: EnableToolButton(sysDemul);
    5: EnableToolButton(sysHBMAME);
    6: EnableToolButton(sysDICE);
    7: EnableToolButton(sysSEGAModel2);
    8: EnableToolButton(sysZiNc);
  end;

  missFile:= TMemIniFile.Create(MissingROMsFileName); // sys_missgames.miss

  case SingleGame of
    True:
      begin
        FormMain.FillMemGameInfo(FormMain.TempGameVars);
        checkItem:= FormMain.SelectedEasyItem;
        AddGame(Assigned(uMain.TEasyGameInfo(FormMain.SelectedEasyItem).eDeviceSets));
      end;
    False:
      begin
        missGamesList:= THashedStringList.Create;
        missFile.ReadSections(missGamesList); // read games list from missing file

        checkGroup:= FormMain.GamesListView.Groups.FirstGroup;
        repeat
          checkItem:= FormMain.GamesListView.Groups.FirstInGroup(checkGroup);
          repeat
            if (uMain.TEasyGameInfo(checkItem).eSystemID = sysID) and (uMain.TEasyGameInfo(checkItem).eSoftwareName = SoftwareName) then
               begin
                 if missGamesList.IndexOf(uMain.TEasyGameInfo(checkItem).eName) <> -1 then
                    begin
                      if uMain.TEasyGameInfo(checkItem).eROMInfo <> nil then
                         begin
                           FormMain.ClearMemGameInfo(FormMain.TempGameVars);
                           FormMain.FillTempGameInfo(checkItem);
                           AddGame(Assigned(uMain.TEasyGameInfo(checkItem).eDeviceSets));
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
  if not HaveDevices then
     begin
       ROMsListView.Header.Columns[4].Visible:= False;
       ROMsListView.Header.Columns[0].Width:= ROMsListView.Header.Columns[0].Width+ROMsListView.Header.Columns[4].Width;
     end;
end;

procedure TFormArcadeScanGamesResults.FormShow(Sender: TObject);
var
  Loop: Integer;
  missSoftListFiles: THashedStringList;
  
  function DarkColorsCheckBox(iCheckBox: TAdvOfficeCheckBoxEx): Boolean;
  begin
    Result:= True;
    SetCheckBoxColors(iCheckBox, clCream, item_caption_active_shadow_color[1], clrMedDarkGray, clrLightBlack);
    FormMain.SetCheckBoxExCustomIcon(iCheckBox);
  end;

  function SetButtonImageIndexHint(iButton: TSpeedButtonEx): Boolean;
  begin
    Result:= True;
    iButton.ImageIndex:= FormMain.GetImageIndexSystemID(iButton.Tag);
    iButton.Hint:= FormMain.GetArcadeEmulatorDescription(iButton.Tag);
  end;

  function ExecClickButton(iButton: TSpeedButtonEx): Boolean;
  begin
    Result:= Loop = 0;
    if not Result then
       Exit;
    if iButton.Enabled then
       begin
         if iButton.Down then
            begin
              Loop:= 1; // found pressed button, execute its code and ignore other system buttons
              iButton.Click;
            end;
       end;
  end;
  
begin
  Resize4K;
  FormMain.ELV_ResetNormalColors(ROMsListView);

  sysMAME.Tag:=                 idMAME;
  sysSupermodelSEGAModel3.Tag:= idSupermodel;
  sysDemul.Tag:=                idDemul;
  sysHBMAME.Tag:=               idHBMAME;
  sysDICE.Tag:=                 idDICE;
  sysSEGAModel2.Tag:=           idSEGAModel2;
  sysZiNc.Tag:=                 idZiNc;

  SetButtonImageIndexHint(sysMAME);
  SetButtonImageIndexHint(sysSupermodelSEGAModel3);
  SetButtonImageIndexHint(sysDemul);
  SetButtonImageIndexHint(sysHBMAME);
  SetButtonImageIndexHint(sysDICE);
  SetButtonImageIndexHint(sysSEGAModel2);
  SetButtonImageIndexHint(sysZiNc);

  SystemIcon.Tag:= 0;

  CallMaximizeWindow(TForm(Sender));

  if IsNightMode then
     begin
       SetFormColors(FormArcadeScanGamesResults, TopBar, nil, LabelEmulatorVersion, LabelGamesListVersion, nil, -1, True);
       SetLabelColors(LabelTotalGames,    clWhite, clrDarkOrange);
       SetLabelColors(LabelSearchBar,     clWhite, clrMedBlue);
       SetComboBox2ExColors(MAMEMachinesFilter, True);

       DarkColorsCheckBox(SetsFilter_CHDs);
       DarkColorsCheckBox(SetsFilter_DeviceROMs);
       DarkColorsCheckBox(SetsFilter_BiosROMs);

       FormMain.SetEasyListViewColors(ROMsListView, menu_background_color[1], clWhite, clrOrangeBarTop);
       FormMain.SetEasyListViewHeaderColors(ROMsListView, True, False, Is4KMode);
       FormMain.ELV_SetRibbonNightColors(0, ROMsListView, True);
       FormMain.SetWin10DarkScrollBar(ROMsListView);

       SetEditNightColors(SearchBarEdit);
       FormMain.SetButtonExColors(ButtonToggleTree);
     end;

  FormMain.LoadSystemIcon(-1, MAMEMachinesFilterIcon, False);
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

  HaveDevices:= False;
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

  Loop:= 0;
  ExecClickButton(sysMAME);
  ExecClickButton(sysSupermodelSEGAModel3);
  ExecClickButton(sysDemul);
  ExecClickButton(sysHBMAME);
  ExecClickButton(sysDICE);
  ExecClickButton(sysSEGAModel2);
  ExecClickButton(sysZiNc);

  if not Is4KMode then
  begin
    // file size column
    MAMEMachinesFilterIcon.Tag:= ROMsListView.Header.Columns[3].Width;
    ROMsListView.Header.Columns[3].AutoSizeToFit;
    if ROMsListView.Header.Columns[3].Width < 35 then
       begin
         ROMsListView.Header.Columns[3].Width:= 35;
         MAMEMachinesFilterIcon.Tag:= 0;
       end
    else
    if ROMsListView.Header.Columns[3].Width > 35 then
       MAMEMachinesFilterIcon.Tag:= ROMsListView.Header.Columns[3].Width-MAMEMachinesFilterIcon.Tag;

    Loop:= ROMsListView.Header.Columns[4].Width;
    ROMsListView.Header.Columns[4].AutoSizeToFit;
    if ROMsListView.Header.Columns[4].Width < 50 then
       begin
         Loop:= 0;
         ROMsListView.Header.Columns[4].Width:= 50
       end
    else
    if ROMsListView.Header.Columns[4].Width > 50 then
       Loop:= ROMsListView.Header.Columns[4].Width-Loop;

    if MAMEMachinesFilterIcon.Tag+Loop > 0 then
       ROMsListView.Header.Columns[0].Width:= ROMsListView.Header.Columns[0].Width-(MAMEMachinesFilterIcon.Tag+Loop);
  end;

  if SingleGame then
     begin
       Loop:= (ROMsListView.Header.Height+2+4)+ // +4 for the bottom border
              (ROMsListView.Groups.ItemCount*ROMsListView.CellSizes.Report.Height)+
              (ROMsListView.PaintInfoGroup.MarginTop.Size)+
               TopBar.Height;

       if Loop < (Screen.Height-100) then
          begin
            FormArcadeScanGamesResults.ClientHeight:= Loop;
            FormArcadeScanGamesResults.Top:= (Screen.Height shr 1)-(FormArcadeScanGamesResults.Height shr 1)-1;
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

procedure TFormArcadeScanGamesResults.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #27 then
     Close;
end;

procedure TFormArcadeScanGamesResults.ButtonToggleTreeClick(Sender: TObject);
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

procedure TFormArcadeScanGamesResults.FilterGamesList;
var
  vGroup: TEasyGroup;
  ShowItem: Boolean;
begin
  if not FormMain.CheckTotal(ROMsListView) then
     Exit;

  ROMsListView.BeginUpdate;
  vGroup:= ROMsListView.Groups.FirstGroup;
  repeat
    ShowItem:= TEasyScanGroupInfo(vGroup).eSystem = SystemIcon.Tag;
    if ShowItem and (SystemIcon.Tag = idMAME) then
    begin
      case MAMEMachinesFilter.ItemIndex of
        //0: ShowItem:= True;
        1: ShowItem:= TEasyScanGroupInfo(vGroup).eSoftwareName = '';
        2: ShowItem:= TEasyScanGroupInfo(vGroup).eSoftwareName <> '';
      end;

      if ShowItem and (SetsFilter_CHDs.Checked) then
         ShowItem:= TEasyScanGroupInfo(vGroup).eCHDsCount > 0; // this filter takes priority over other CheckBox filters

      if ShowItem and (TEasyScanGroupInfo(vGroup).eBiosName <> '') then
         ShowItem:= SetsFilter_BiosROMs.Checked;

      if ShowItem and TEasyScanGroupInfo(vGroup).eHaveDeviceROMs then
         ShowItem:= SetsFilter_DeviceROMs.Checked;
    end;

    vGroup.Visible:= ShowItem;

    vGroup:= ROMsListView.Groups.NextGroup(vGroup);
  until vGroup = nil;
  ROMsListView.EndUpdate;
  LabelTotalGames.Caption:= IntToStr(ROMsListView.Groups.VisibleCount)+' Games';
  ROMsListView.SetFocus;
end;

procedure TFormArcadeScanGamesResults.SearchGame;
var
  vGroup: TEasyGroup;
  FoundItem: Boolean;
  StrToSearch: String;
  //iSearchTitle, iSearchName: Integer;
begin
  if not FormMain.CheckTotal(ROMsListView) then
     Exit;

  StrToSearch:= SearchBarEdit.Text;
  if StrToSearch = '' then
     Exit;

  FoundItem:= False;
  vGroup:= ROMsListView.Groups.FirstVisibleGroup;
  repeat
    if vGroup.Visible then
       begin
         // WideIncrementalSearch() -> 0: means it found a match (partial string...); -1 or 1: no match
         //iSearchTitle:= WideIncrementalSearch(TEasyScanGroupInfo(vGroup).eGameTitle, StrToSearch); // for debugging only, do not enable
         //iSearchName:= WideIncrementalSearch(TEasyScanGroupInfo(vGroup).eGameName, StrToSearch); // for debugging only, do not enable
         //ShowMessageW('title: '+TEasyScanGroupInfo(vGroup).eGameTitle+#13#10+'iSearch: '+IntToStr(iSearchTitle)+#13#10+#13#10+
         //            'name : '+TEasyScanGroupInfo(vGroup).eGameName+#13#10+'iSearch: '+IntToStr(iSearchName)); // for debugging only, do not enable

         if WideIncrementalSearch(TEasyScanGroupInfo(vGroup).eGameTitle, StrToSearch) = 0 then
            FoundItem:= True
         else
         if WideIncrementalSearch(TEasyScanGroupInfo(vGroup).eGameName, StrToSearch) = 0 then
            FoundItem:= True;
       end;
    if not FoundItem then
       vGroup:= ROMsListView.Groups.NextVisibleGroup(vGroup);
  until (vGroup = nil) or FoundItem;

  if FoundItem then
     ROMsListView.Groups.FirstVisibleInGroup(vGroup).MakeVisible(emvMiddle)
  else
     FormMain.BlinkBkEdit(SearchBarEdit);
end;

procedure TFormArcadeScanGamesResults.sysMAMEClick(Sender: TObject);
begin
  SystemIcon.Tag:= TToolButton(Sender).Tag;
  SystemIcon.Picture:= nil;
  FormMain.LoadSystemIcon(SystemIcon.Tag, SystemIcon, False);
  LabelEmulatorVersion.Caption:=  FormMain.EmulatorVersion[SystemIcon.Tag];
  LabelGamesListVersion.Caption:= 'Games List: '+GamesListVersion[SystemIcon.Tag];

  MAMEMachinesFilter.Visible:= sysMAME.Down;
  MAMEMachinesFilterIcon.Visible:= MAMEMachinesFilter.Visible;

  FilterGamesList;
end;

procedure TFormArcadeScanGamesResults.ROMsListViewItemPaintText(
  Sender: TCustomEasyListview; Item: TEasyItem; Position: Integer;
  ACanvas: TCanvas);

  function GetFileColor(const FileStr: String): TColor;
  begin
    if PosEx('(No Game ROMs)', FileStr) <> 0 then
       Result:= ACanvas.Font.Color
    else
    if PosEx(' not ', FileStr) = 0 then
       begin
         if IsNightMode then
            Result:= clrLightGreen
         else
            Result:= clrDarkGreen;
       end
    else
       begin
         if IsNightMode then
            Result:= clrLightRed
         else
            Result:= clRed;
       end;
  end;

begin
  //FormMain.ELV_ItemPaintText_General(ROMsListView, Item, ACanvas);
  if TEasyScanInfo(Item).eStateImageIndex in [1, 2] then // [MaxArcadeSystems+2, MaxArcadeSystems+3] then
     begin // missing file and CHD with bad SHA-1 / MD-5 checksum
       if IsNightMode then
          ACanvas.Font.Color:= clSilver
       else
          ACanvas.Font.Color:= clrMedDarkGray;
     end;
  case Position of
    0: // file name
      begin
        if (TEasyScanInfo(Item).eLineMode in [2..5]) or (TEasyScanInfo(Item).eLineMode > 6) then
           begin
             ACanvas.Font.Name:= 'Consolas';
             //ACanvas.Font.Style:= [fsBold];
             //ACanvas.Font.Color:= $00a65300;
           end;
      end;
    1: // CRC32
      begin
        if TEasyScanInfo(Item).eLineMode = 6 then
           begin
             ACanvas.Font.Name:= 'Consolas';
           end;
      end;
    2: // SHA-1 (new September 14, 2016)
      begin
        case TEasyScanInfo(Item).eLineMode of
          2: ACanvas.Font.Color:= GetFileColor(TEasyScanInfo(Item).eNameZipStatus);
          3: ACanvas.Font.Color:= GetFileColor(TEasyScanInfo(Item).eParentZipStatus);
          4: ACanvas.Font.Color:= GetFileColor(TEasyScanInfo(Item).eBiosZipStatus);
          6: ACanvas.Font.Name:= 'Consolas';
        else
          if TEasyScanInfo(Item).eLineMode > 6 then
             ACanvas.Font.Color:= GetFileColor(TEasyScanInfo(Item).eDeviceZipStatus);
        end;
      end;
    3: // file size
      begin

      end;
    4: // device names
      begin

      end;
    5: // Status
      begin
        // MaxArcadeSystems+1
        
        if TEasyScanInfo(Item).eStateImageIndex in [1, 2] then //in [MaxArcadeSystems+2, MaxArcadeSystems+3] then
           begin
             if IsNightMode then
                ACanvas.Font.Color:= clrLightRed
             else
                ACanvas.Font.Color:= clRed;
           end;
      end;
  end;
end;

function TFormArcadeScanGamesResults.ROMsListViewItemCompare(
  Sender: TCustomEasyListview; Column: TEasyColumn; Group: TEasyGroup;
  Item1, Item2: TEasyItem; var DoDefault: Boolean): Integer;
begin
  DoDefault:= False;
  Result:= -1;
end;

procedure TFormArcadeScanGamesResults.ROMsListViewItemSelectionChanged(
  Sender: TCustomEasyListview; Item: TEasyItem);
var
  BarMode: ShortInt;
begin
  // MaxArcadeSystems    -> ROM/CHD Ok
  // MarArcadeSystems+1  -> ROM/CHD not found
  // MarArcadeSystems+2  -> CHD bad SHA-1 checksum
  if Item.Selected then
     begin
       BarMode:= Ord(TEasyScanInfo(Item).eStateImageIndex = 2); //= MaxArcadeSystems+3);
       if IsNightMode then
          FormMain.ELV_SetRibbonNightColors(BarMode, ROMsListView)
       else
          FormMain.ELV_SetSelectRibbon(BarMode, ROMsListView);
     end;
end;

function TFormArcadeScanGamesResults.ROMsListViewGroupCompare(
  Sender: TCustomEasyListview; Item1, Item2: TEasyGroup): Integer;
var
  Item1Bios, Item2Bios, Item1Device, Item2Device, Item1Game, Item2Game: Boolean;
  Item1Title, Item2Title: String;
begin
  // list device sets A..Z first, then bios A..Z, then games A..Z
  if TEasyScanGroupInfo(Item1).eSystem <> TEasyScanGroupInfo(Item2).eSystem then
     Exit;

  Item1Device:= TEasyScanGroupInfo(Item1).eIsDevice;
  Item2Device:= TEasyScanGroupInfo(Item2).eIsDevice;
  Item1Bios:= TEasyScanGroupInfo(Item1).eIsBios;
  Item2Bios:= TEasyScanGroupInfo(Item2).eIsBios;
  Item1Game:= (not Item1Device) and (not Item1Bios);
  Item2Game:= (not Item2Device) and (not Item2Bios);

  Item1Title:= TEasyScanGroupInfo(Item1).eGameTitle;
  Item2Title:= TEasyScanGroupInfo(Item2).eGameTitle;

  //if TEasyScanGroupInfo(Item1).eSystem <> TEasyScanGroupInfo(Item2).eSystem then
  //   Exit;

  if Item1Game and Item2Game then
     Result:= FormMain.iCompare(Item1Title, Item2Title)
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
     end
  else
  if (not Item1Game) and Item2Game then
     Result:= -1
  else
     Result:= 1;
end;

procedure TFormArcadeScanGamesResults.MAMEMachinesFilterSelect(Sender: TObject);
begin
  FilterGamesList;
end;

procedure TFormArcadeScanGamesResults.PopupSplittersMeasureMenuItem(
  Sender: TObject; AMenuItem: TMenuItem; ACanvas: TCanvas; var Width,
  Height: Integer; ABarVisible: Boolean; var DefaultMeasure: Boolean);
begin
  FormMain.SetPopupMenuMeasureItem(AMenuItem, ACanvas, Width, Height);
end;

procedure TFormArcadeScanGamesResults.ButtonFilterTitleApply_ToolBarClick(
  Sender: TObject);
begin
  SearchGame;
end;

procedure TFormArcadeScanGamesResults.SearchBarEditKeyPress(
  Sender: TObject; var Key: Char);
begin
  if Key = #13 then
     begin
       Key:= #0; // to remove the "ding" sound when pressing keys like ENTER, ESC
       ButtonFilterTitleApply_ToolBar.Click;
     end
end;

procedure TFormArcadeScanGamesResults.SetsFilter_CHDsClick(
  Sender: TObject);
begin
  FilterGamesList;
end;

end.


