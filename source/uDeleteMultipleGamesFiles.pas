unit uDeleteMultipleGamesFiles;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  StdCtrls, IniFiles, Dialogs,
  uMain, EasyListview, MPCommonObjects, MPCommonUtilities, ImgList,
  ExtCtrls, uCommon, Buttons, PanelEx, ShadowLabel,
  AdvOfficeButtons, AdvGroupBox, Menus, BarMenus;

type
  TGameInfo = class(TEasyItemStored)
  private
    fSystemID: ShortInt;
    fROMIdentification: Integer;
    fMediaType: ShortInt;
    fTitle: WideString;
    fName: String;
    fClone: String;
    fCloneParent: String;
    fDriverName: String;
    fMerged: Boolean;
    fHaveROMs, fHaveCHDs, fHaveCFGs: Boolean;
    fDriverStatus: ShortInt;
    fBiosName: String;
    fSoftwareName: String;
    fCategory: String;
    fGameStatus: ShortInt;
    fGameFiles: THashedStringList;
  protected
    function GetCaptions(Column: Integer): WideString; override;
    function GetImageIndexes(Column: Integer): TCommonImageIndexInteger; override;
    function GetStateImageIndexes(Column: Integer): TCommonImageIndexInteger; override;
  public
    property eSystemID: ShortInt read fSystemID write fSystemID;
    property eROMIdentification: Integer read fROMIdentification write fROMIdentification;
    property eMediaType: ShortInt read fMediaType write fMediaType;
    property eTitle: WideString read fTitle write fTitle;
    property eName: String read fName write fName;
    property eClone: String read fClone write fClone;
    property eCloneParent: String read fCloneParent write fCloneParent;
    property eDriverName: String read fDriverName write fDriverName;
    property eMerged: Boolean read fMerged write fMerged;
    property eHaveROMs: Boolean read fHaveROMs write fHaveROMs;
    property eHaveCHDs: Boolean read fHaveCHDs write fHaveCHDs;
    property eHaveCFGs: Boolean read fHaveCFGs write fHaveCFGs;
    property eDriverStatus: ShortInt read fDriverStatus write fDriverStatus;
    property eBiosName: String read fBiosName write fBiosName;
    property eSoftwareName: String read fSoftwareName write fSoftwareName;
    property eCategory: String read fCategory write fCategory;
    property eGameStatus: ShortInt read fGameStatus write fGameStatus; // 0 - have 1 - miss; 2 - missing ROMs/CHDs
    property eGameFiles: THashedStringList read fGameFiles write fGameFiles;
    // CHD file found...
    // media_type FileID IsParentCHD filename
    // 00 -> rom; 01 -> CHD; -1 -> config files

    // MAME based (0 -> CFG; -> 1 -> NVRAM, EEPROM, FLASH and maybe others (MAME gamename config folder);
    // ZiNc (0 -> CFG);
    // SEGA Model 2 (0 -> INPUT; 1 -> NVDATA);
    // Demul (2 -> EEPROM; 3 -> SRAM; 4 -> FLASH);
    // Supermodel: SEGA Model 3 ( 1 -> NVRAM);
  end;

type
  TFormDeleteMultipleGamesFiles = class(TForm)
    GamesList: TEasyListview;
    PanelOptions: TPanelEx;
    IL_DeleteGameIcons: TImageList;
    FileTypesGroupBox: TAdvGroupBox;
    DeleteROMs: TAdvOfficeCheckBox;
    DeleteCHDs: TAdvOfficeCheckBox;
    DeleteCFGsNVRAMs: TAdvOfficeCheckBox;
    ButtonDeleteFiles: TBitBtn;
    ButtonNo: TBitBtn;
    LabelSearchGameName: TShadowLabel;
    PopupGames: TBcBarPopupMenu;
    PopupRemoveSelectedGames: TMenuItem;
    PopupParentGame: TMenuItem;
    N1: TMenuItem;
    PopupViewSelectedFilesList: TMenuItem;
    PopupViewFilesListAllGames: TMenuItem;
    ButtonHelp: TBitBtn;
    PanelDestinationFolder: TPanelEx;
    DestinationFolder: TEdit;
    LabelCopyMoveDestination: TShadowLabel;
    ButtonSelectROMsFolder: TBitBtn;
    CopyMoveOverwriteFiles: TAdvOfficeCheckBox;
    PanelSearchGameName: TPanel;
    FindGameName: TEdit;
    SearchGameNameBox: TPanelEx;
    ButtonFindGameName: TLabel;
    procedure FormShow(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure ButtonHelpClick(Sender: TObject);
    procedure GamesListItemPaintText(Sender: TCustomEasyListview;
      Item: TEasyItem; Position: Integer; ACanvas: TCanvas);
    procedure GamesListItemSelectionChanged(
      Sender: TCustomEasyListview; Item: TEasyItem);
    procedure GamesListKeyAction(Sender: TCustomEasyListview;
      var CharCode: Word; var Shift: TShiftState; var DoDefault: Boolean);
    procedure GamesListColumnClick(Sender: TCustomEasyListview;
      Button: TCommonMouseButton; ShiftState: TShiftState;
      const Column: TEasyColumn);
    function GamesListItemCompare(Sender: TCustomEasyListview;
      Column: TEasyColumn; Group: TEasyGroup; Item1, Item2: TEasyItem;
      var DoDefault: Boolean): Integer;
    procedure GamesListItemFreeing(Sender: TCustomEasyListview;
      Item: TEasyItem);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure DeleteCHDsClick(Sender: TObject);
    procedure ButtonDeleteFilesClick(Sender: TObject);
    procedure ButtonSelectROMsFolderClick(Sender: TObject);
    procedure PopupGamesMeasureMenuItem(Sender: TObject;
      AMenuItem: TMenuItem; ACanvas: TCanvas; var Width, Height: Integer;
      ABarVisible: Boolean; var DefaultMeasure: Boolean);
    procedure PopupViewFilesListAllGamesClick(Sender: TObject);
    procedure PopupParentGameClick(Sender: TObject);
    procedure PopupRemoveSelectedGamesClick(Sender: TObject);
    procedure GamesListColumnPaintText(Sender: TCustomEasyListview;
      Column: TEasyColumn; ACanvas: TCanvas);
    procedure ButtonFindGameNameClick(Sender: TObject);
    procedure FindGameNameEnter(Sender: TObject);
    procedure FindGameNameExit(Sender: TObject);
    procedure FindGameNameKeyPress(Sender: TObject; var Key: Char);
    procedure ButtonFindGameNameMouseEnter(Sender: TObject);
    procedure ButtonFindGameNameMouseLeave(Sender: TObject);
  private
    { Private declarations }
    SelectedItem: TEasyItem;
    SystemAffected: array[1..MaxArcadeSystems] of Boolean;
    tempFilesList, SoftListAffected: THashedStringList;
    FolderCFG: array[1..MaxArcadeSystems] of String;
    FolderNVRAM: array[1..MaxArcadeSystems] of String;
    ActionString: String;
    ROMsTotalSize, CHDsTotalSize, CFGsTotalSize: Int64;
    ROMsTotalFiles, CHDsTotalFiles, CFGsTotalFiles{, StatusIconIndex}: Integer;
    procedure SetCheckBoxColor(Enabled: Boolean; CheckBoxHolder: TAdvOfficeCheckBox);
    procedure SetSelectedGame(ELV_Item: TEasyItem);
    procedure UpdateTotalFilesLabel;
    procedure SearchROMsFiles(eROMsList: TStringList; var MergedSetVar: Boolean; var HaveROMsVar: Boolean; var HaveCHDsVar: Boolean);
    procedure SearchConfigFiles(var HaveCFGsVar: Boolean);
    procedure AdjustWindowSize;
    procedure AddGamesToList;
    procedure GetSoftwareNames;
    function  ProcessGamesFiles: Boolean;
  public
    { Public declarations }
    ActionMode: Integer; // 0 -> delete games files; 1 -> copy games files; 2 -> move games files
  end;

var
  FormDeleteMultipleGamesFiles: TFormDeleteMultipleGamesFiles;

implementation

uses uStatus, uDeleteMultipleGamesViewFiles, uCopyMoveGameFiles;

{$R *.dfm}

function TGameInfo.GetCaptions(Column: Integer): WideString;
begin
  case Column of
    0: Result:= eTitle;
    1: Result:= eName;
    2: Result:= eClone;
    3: Result:= eBiosName;
    4: Result:= eCategory;//eDriverName;
    5: Result:= eDriverName;
    {8:
      begin
        case eMerged of
          True : Result:= 'Yes';
          False: Result:= '';
        end;
      end;}
  end;
end;

function TGameInfo.GetImageIndexes(Column: Integer): TCommonImageIndexInteger;
begin
  if Column = 0 then
     Result:= FormMain.GetMAMEImageIndex(eROMIdentification, eSoftwareName)
  else
     Result:= -1;
end;

function TGameInfo.GetStateImageIndexes(Column: Integer): TCommonImageIndexInteger;
begin
  case Column of
    0: Result:= eSystemID-1;
    6:
      begin
        if eHaveROMs then
           Result:= FormDeleteMultipleGamesFiles.DeleteROMs.Tag// MaxGameID+MaxArcadeSystems+1
        else
           Result:= -1;
      end;
    7:
      begin
        if eHaveCHDs then
           Result:= FormDeleteMultipleGamesFiles.DeleteCHDs.Tag //MaxGameID+MaxArcadeSystems+2
        else
           Result:= -1;
      end;
    8:
      begin
        if eHaveCFGs then
           Result:= FormDeleteMultipleGamesFiles.DeleteCFGsNVRAMs.Tag //MaxGameID+MaxArcadeSystems+3
        else
           Result:= -1;
      end;
  else
       Result:= -1;
  end;
end;

procedure TFormDeleteMultipleGamesFiles.SetCheckBoxColor(Enabled: Boolean; CheckBoxHolder: TAdvOfficeCheckBox);
begin
  if Enabled then
     CheckBoxHolder.Font.Color:= $00a65300 //clNavy
  else
     CheckBoxHolder.Font.Color:= clGray;
end;

procedure TFormDeleteMultipleGamesFiles.SetSelectedGame(ELV_Item: TEasyItem);
begin
  FormMain.ELV_SetSelectRibbon(TGameInfo(ELV_Item).eGameStatus, GamesList);
  if GamesList.Selection.Count = 1 then
     begin
       if SelectedItem <> ELV_Item then
          SelectedItem:= ELV_Item;
       PopupParentGame.Enabled:= FormMain.GameIsClone(TGameInfo(ELV_Item).eClone);
     end
  else
     begin
       PopupParentGame.Enabled:= False;
       SelectedItem:= nil;
     end;
end;

procedure TFormDeleteMultipleGamesFiles.UpdateTotalFilesLabel;
begin
  FormDeleteMultipleGamesFiles.Caption:= FormDeleteMultipleGamesFiles.Hint+' ['+IntToStr(GamesList.Groups.ItemCount)+' Games]';
  //LabelTotalItems.Caption:= IntToStr(GamesList.Groups.ItemCount)+' Games';
end;

procedure TFormDeleteMultipleGamesFiles.SearchROMsFiles(eROMsList: TStringList; var MergedSetVar: Boolean; var HaveROMsVar: Boolean; var HaveCHDsVar: Boolean);
var
  FileFullPath, ZiNcFilePath, ROMFullInfo: String;
  IsZiNcSystem, IsParentCHD: Boolean;
  Loop: Integer;
  chdName, chdParentName, DiskFile, romName, romCRC32, romSHA1: String;
  CHDFileID: ShortInt;
begin
  IsZiNcSystem:= FormMain.TempGameVars.eSystemID = idZiNc;
  ZiNcFilePath:= '';

  HaveROMsVar:= False;
  MergedSetVar:= False;
  HaveCHDsVar:= False;
  FileFullPath:= FormMain.SearchZIPFolder(FormMain.TempGameVars.eName, FormMain.TempGameVars.eSystemID, FormMain.TempGameVars.eSoftwareName);
  if (FileFullPath = '') and FormMain.GameIsClone(FormMain.TempGameVars.eClone) and
     FormMain.IsMAMEBasedSys(FormMain.TempGameVars.eSystemID) then
     begin
       // check for merged game
       if not FormMain.IsROM_HaveMissROMs(FormMain.TempGameVars.eGameSetStatus) then
          begin
            MergedSetVar:= FormMain.TempGameVars.eIsMerged;
            if MergedSetVar then
               FileFullPath:= FormMain.SearchZIPFolder(FormMain.TempGameVars.eClone, FormMain.TempGameVars.eSystemID, FormMain.TempGameVars.eSoftwareName);
          end;
     end;
  if FileFullPath <> '' then
     begin
       // found gamename.zip or parentname.zip for merged sets
       tempFilesList.Add('00000 '+FileFullPath);
       if IsZiNcSystem then
          ZiNcFilePath:= ExtractFilePath(FileFullPath);
       HaveROMsVar:= True;
       ROMsTotalSize:= ROMsTotalSize+GetFileSize(FileFullPath);
       Inc(ROMsTotalFiles);
     end;
  if FormMain.TempGameVars.eMediaType = 0 then
     Exit;

  if FormMain.TempGameVars.eCHDsCount = 0 then
     Exit;

  if eROMsList <> nil then
  begin
    for Loop:=0 to eROMsList.Count-1 do
    begin
      DiskFile:= eROMsList[Loop];
      FormMain.GetROMDetailsInfo(DiskFile, FormMain.GameIsClone(FormMain.TempGameVars.eName), romName, romCRC32, romSHA1, chdParentName);
      //if (romName[1] = '3') and (romCRC <> '') then
      CHDFileID:= StrToInt(DiskFile[1]+DiskFile[2]);
      if (CHDFileID >= 12) and (DiskFile[3] = '1') and (romSHA1 <> '') then
         begin
           DiskFile:= FormMain.SearchCHDSimpleScan(FormMain.TempGameVars.eSystemID, romName, chdParentName, FormMain.TempGameVars.eName, FormMain.TempGameVars.eClone, FormMain.TempGameVars.eBiosName, FormMain.TempGameVars.eSoftwareName);
           if DiskFile <> '' then
              begin
                // CHD file found...
                // 00 -> rom; 01 -> CHD; -1 -> config files
                // media_type FileID IsParentCHD filename
                // 01120 simpbowl.chd
                // 00000 elvator.rom
                // -1000 elvator.cfg
                IsParentCHD:= FormMain.GameIsClone(FormMain.TempGameVars.eClone) and (not SameText(chdName+'.chd', ExtractFileName(DiskFile)));
                tempFilesList.Add('01'+Format('%.2u%d %s', [CHDFileID, Ord(IsParentCHD), DiskFile]));
                HaveCHDsVar:= True;
                CHDsTotalSize:= CHDsTotalSize+GetFileSize(DiskFile);
                Inc(CHDsTotalFiles);
              end;
         end;
    end;
  end;
end;

procedure TFormDeleteMultipleGamesFiles.SearchConfigFiles(var HaveCFGsVar: Boolean);
var
  FileFullPath: String;
  nvram_MAME: THashedStringList;

  function GetFiles_nvramMAME: Boolean;
  var
    Loop: Integer;
  begin
    // for FileType = 1 only!!!
    nvram_MAME:= THashedStringList.Create;
    GetFilesList(FolderNVRAM[FormMain.TempGameVars.eSystemID]+FormMain.TempGameVars.eName, '.???', '*.*', nvram_MAME, False, True, True);
    if FormMain.TempGameVars.eBiosName <> '' then
       begin
         for Loop:=1 to 65 do
         begin
           if DirectoryExists(FolderNVRAM[FormMain.TempGameVars.eSystemID]+FormMain.TempGameVars.eName+'_'+IntToStr(Loop)) then
              GetFilesList(FolderNVRAM[FormMain.TempGameVars.eSystemID]+FormMain.TempGameVars.eName+'_'+IntToStr(Loop), '.???', '*.*', nvram_MAME, False, False, True);
         end;
       end;
    Result:= nvram_MAME.Count > 0;
    if not Result then
       FreeAndNil(nvram_MAME);
  end;

  function AddItem_ELV(FileType: ShortInt): Boolean;
  var
    haveMAMEnvram: Boolean;
    Loop, fixFileType: Integer;
  begin
    Result:= False;
    haveMAMEnvram:= False;
    case FileType of
      0:
        begin
          if FolderCFG[FormMain.TempGameVars.eSystemID] = '' then
             Exit;
          if FormMain.TempGameVars.eSystemID <> idSegaModel2 then
             FileFullPath:= FolderCFG[FormMain.TempGameVars.eSystemID]+FormMain.TempGameVars.eName+'.cfg'
          else
             FileFullPath:= FolderCFG[FormMain.TempGameVars.eSystemID]+FormMain.TempGameVars.eName+'.input';
        end;
      1:
        begin
          if FolderNVRAM[FormMain.TempGameVars.eSystemID] = '' then
             Exit;
          FileFullPath:= FolderNVRAM[FormMain.TempGameVars.eSystemID]+FormMain.TempGameVars.eName;
          case FormMain.TempGameVars.eSystemID of
            idMAME, idHBMAME:
              begin
                FileFullPath:= FileFullPath+'.nv'; // old nvram method (just in case...)
                haveMAMEnvram:= GetFiles_nvramMAME; // new nvram files (nvram\gamename\*.*)
              end;
            idSegaModel2: FileFullPath:= FileFullPath+'.dat'; // SEGA Model 2
            idSupermodel: FileFullPath:= FileFullPath+'.nv'; // Supermodel: SEGA Model 3
          else
            FileFullPath:= FileFullPath+'.nv'; // MAME based and other emulators ????
          end;
        end;
      2, 3, 4:
        begin
          if FolderNVRAM[FormMain.TempGameVars.eSystemID] = '' then
             Exit;
          FileFullPath:= FolderNVRAM[FormMain.TempGameVars.eSystemID]+FormMain.TempGameVars.eName;
          case FileType of
            2: FileFullPath:= FileFullPath+'.eeprom'; // Demul EEPROM
            3: FileFullPath:= FileFullPath+'.sram'; // Demul SRAM
            4: FileFullPath:= FileFullPath+'.flash'; // Demul FLASH
          end;
        end;
    end;
    Result:= FileExists(FileFullPath);
    if not Result then
       begin
         if FileType <> 1 then
            Exit
         else
            begin
              if haveMAMEnvram then
                 Result:= True;
            end;
       end;

    // add config file into the temp list
    if Result then
       begin
         case FileType of
           0, 2, 3, 4: // .input (segamodel2); .cfg; .eeprom; .sram; .flash
             begin
               tempFilesList.Add('-1'+Format('%.2u0 %s', [FileType, FileFullPath]));
               HaveCFGsVar:= True;
               CFGsTotalSize:= CFGsTotalSize+GetFileSize(FileFullPath);
               Inc(CFGsTotalFiles);
             end;
           1: // nvram\gamename\ for MAME; .nv; .dat;
             begin
               if not haveMAMEnvram then // .nv; .dat
                  begin
                    // this is for old MAME buids that have gamename.nv and for other emulators
                    tempFilesList.Add('-1010 '+FileFullPath);
                    HaveCFGsVar:= True;
                    CFGsTotalSize:= CFGsTotalSize+GetFileSize(FileFullPath);
                    Inc(CFGsTotalFiles);
                  end
               else
                  begin
                    // go thru MAME's nvram files and add all of them to the temp files list
                    // nvram\gamename\*.* (not known filename or extension)
                    for Loop:=0 to nvram_MAME.Count-1 do
                    begin
                      fixFileType:= FormMain.FixMAMENVRAMFileType(nvram_MAME[Loop]);
                      tempFilesList.Add('-1'+Format('%.2u0 %s', [fixFileType, nvram_MAME[Loop]]));
                      //tempFilesList.Add('-1010 '+nvram_MAME[Loop]);
                      CFGsTotalSize:= CFGsTotalSize+GetFileSize(nvram_MAME[Loop]);
                      Inc(CFGsTotalFiles);
                    end;
                    FreeAndNil(nvram_MAME);
                    HaveCFGsVar:= True;
                  end;
             end;
         end;
       end;
  end;

begin
  if (FormMain.TempGameVars.eSystemID = idDaphne) or (FormMain.TempGameVars.eSoftwareName <> '') then
     Exit; // Daphne doesn't have any config files to delete (EL doesn't delete them!!!)
           // do not add config files for software list games, they are not created by MAME... yet? then     
  AddItem_ELV(0); // .cfg; .input (segamodel2)
  AddItem_ELV(1); // .dat; .nv; nvram
  AddItem_ELV(2); // .eeprom
  AddItem_ELV(3); // .sram
  AddItem_ELV(4); // .flash
end;

procedure TFormDeleteMultipleGamesFiles.AddGamesToList;
var
  Loop, Loop2, SelectionIndex: Integer;
  gItem, addItem: TEasyItem;
  GameIsMerged, FoundROMs, FoundCHDs, FoundCFGs: Boolean;
  HaveROMs, HaveCHDs, HaveCFGs, HaveMerged, HaveBiosSets, HaveClones, HaveCategory, HaveDriverName: Boolean;

  function AddGame: Boolean;
  begin
    Result:= tempFilesList.Count > 0;
    if not Result then
       Exit;
    //Result:= FormMain.IsROM_Have(FormMain.TempGameVars.eROMIdentification); // comment this line to add all selected games
    //if not Result then
    //   Result:= FormMain.IsROM_HaveMissROMs(FormMain.TempGameVars.eGameSetStatus);

    addItem:= GamesList.Items.AddCustom(TGameInfo, nil);
    TGameInfo(addItem).eROMIdentification:= FormMain.TempGameVars.eROMIdentification;
    TGameInfo(addItem).eSystemID:= FormMain.TempGameVars.eSystemID;
    TGameInfo(addItem).eMediaType:= FormMain.TempGameVars.eMediaType;
    TGameInfo(addItem).eTitle:= FormMain.TempGameVars.eTitle;
    TGameInfo(addItem).eName:= FormMain.TempGameVars.eName;
    TGameInfo(addItem).eClone:= FormMain.TempGameVars.eClone;
    case FormMain.GameIsClone(FormMain.TempGameVars.eClone) of
      True : TGameInfo(addItem).eCloneParent:= FormMain.TempGameVars.eClone;
      False: TGameInfo(addItem).eCloneParent:= FormMain.TempGameVars.eName;
    end;
    TGameInfo(addItem).eDriverName:= FormMain.TempGameVars.eDriverName;
    TGameInfo(addItem).eDriverStatus:= FormMain.TempGameVars.eDriverStatus;
    TGameInfo(addItem).eBiosName:= FormMain.TempGameVars.eBiosName;
    TGameInfo(addItem).eSoftwareName:= FormMain.TempGameVars.eSoftwareName;
    if FormMain.TempGameVars.eSoftwareName = '' then
       TGameInfo(addItem).eCategory:= ''
    else
       TGameInfo(addItem).eCategory:= FormMain.TempGameVars.eCategory;
    TGameInfo(addItem).eGameStatus:= FormMain.TempGameVars.eGameSetStatus;
    TGameInfo(addItem).eMerged:= GameIsMerged;
    TGameInfo(addItem).eHaveROMs:= FoundROMs; // useful for a future expansion ???
    TGameInfo(addItem).eHaveCHDs:= FoundCHDs; // useful for a future expansion ???
    TGameInfo(addItem).eHaveCFGs:= FoundCFGs; // useful for a future expansion ???
    TGameInfo(addItem).eGameFiles:= THashedStringList.Create;
    TGameInfo(addItem).eGameFiles.AddStrings(tempFilesList);
  end;

  function HideColumn(ColumnIndex: Integer): Boolean;
  begin
    //FormDeleteMultipleGamesFiles.ClientWidth:= FormDeleteMultipleGamesFiles.ClientWidth-GamesList.Header.Columns[ColumnIndex].Width;
    //ButtonDeleteFiles.Left:= ButtonDeleteFiles.Left-GamesList.Header.Columns[ColumnIndex].Width;
    //ButtonNo.Left:= ButtonNo.Left-GamesList.Header.Columns[ColumnIndex].Width;
    //ButtonHelp.Left:= ButtonHelp.Left-GamesList.Header.Columns[ColumnIndex].Width;
    Loop:= Loop-GamesList.Header.Columns[ColumnIndex].Width;
    GamesList.Header.Columns[ColumnIndex].Visible:= False;
  end;

  function AutoSizeColumn(const iColumnIndex, iMinimumSize: Integer): Boolean;
  begin
    Result:= True;
    GamesList.Header.Columns[iColumnIndex].AutoSizeToFit;
    if GamesList.Header.Columns[iColumnIndex].Width < iMinimumSize then
       GamesList.Header.Columns[iColumnIndex].Width:= iMinimumSize;
  end;

begin
  HaveROMs:= False;
  HaveCHDs:= False;
  HaveCFGs:= False;
  HaveMerged:= False;
  HaveBiosSets:= False;
  HaveClones:= False;
  HaveCategory:= False;
  HaveDriverName:= False;
  for Loop:= 1 to MaxArcadeSystems do
  begin
    SystemAffected[Loop]:= False;
    if ActionMode = 0 then
       FormMain.LoadFolders_ConfigFiles(Loop, FolderCFG[Loop], FolderNVRAM[Loop]);
  end;
  ROMsTotalSize:= 0;
  CHDsTotalSize:= 0;
  CFGsTotalSize:= 0;
  ROMsTotalFiles:= 0;
  CHDsTotalFiles:= 0;
  CFGsTotalFiles:= 0;
  Application.ProcessMessages;

  tempFilesList:= THashedStringList.Create; // temp list to hold files list for each game...
  GamesList.BeginUpdate;
  GamesList.Items.ReIndexDisable:= True;

  gItem:= FormMain.GamesListView.Selection.First;
  SelectionIndex:= 1;
  repeat
    FormMain.FillTempGameInfo(gItem);
    tempFilesList.Clear;
    tempFilesList.BeginUpdate;
    FoundROMs:= False;
    FoundCHDs:= False;
    FoundCFGs:= False;
    SearchROMsFiles(uMain.TEasyGameInfo(gItem).eROMInfo, GameIsMerged, FoundROMs, FoundCHDs);
    if ActionMode = 0 then
       SearchConfigFiles(FoundCFGs);
    tempFilesList.EndUpdate;
    //ShowMessage(tempFilesList.Text); // for debugging only; keep it disabled

    if AddGame then
       begin
         if FoundROMs then
            HaveROMs:= True;
         if uMain.TEasyGameInfo(gItem).eCHDsCount > 0 then
            HaveCHDs:= True;
         if FoundCFGs then
            HaveCFGs:= True;
         if GameIsMerged then
            HaveMerged:= True;
         if FormMain.ValidateBiosName(uMain.TEasyGameInfo(gItem).eBiosName, uMain.TEasyGameInfo(gItem).eName) then
            HaveBiosSets:= True;
         if FormMain.GameIsClone(uMain.TEasyGameInfo(gItem).eClone) then
            HaveClones:= True;
         if uMain.TEasyGameInfo(gItem).eSoftwareName <> '' then
            HaveCategory:= True;
         if uMain.TEasyGameInfo(gItem).eDriverName <> '' then
            HaveDriverName:= True;
       end;

    gItem:= FormMain.ELV_GetNextSelected(FormMain.GamesListView, gItem, SelectionIndex);
    //if SelectionIndex < FormMain.GamesListView.Selection.Count then
    //   gItem:= FormMain.GamesListView.Selection.Next(gItem)
    //else
    //   gItem:= nil;
    //Inc(SelectionIndex);
    Application.ProcessMessages;
  until gItem = nil;

  //ShowMessage('ROMs total size: '+IntToStr(ROMsTotalSize)+#13#10+
  //            'CHDs total size: '+IntToStr(CHDsTotalSize)+#13#10+
  //            'CFGs total size: '+IntToStr(CFGsTotalSize));

  if FormMain.CheckTotal(GamesList) then
     GamesList.Sort.SortAll;
  GamesList.Items.ReIndexDisable:= False;
  GamesList.EndUpdate(False);
  FreeAndNil(tempFilesList);
  FormMain.ClearMemGameInfo(FormMain.TempGameVars);

  UpdateTotalFilesLabel;
  if not FormMain.CheckTotal(GamesList) then
     GenerateMessage(FormDeleteMultipleGamesFiles.Caption, 'Games list is empty.',
                     'No files found. There are no files to be processed.', 2, False, 1)
  else
    begin
      if Screen.Width < 1000 then
         begin
           AutoSizeColumn(1, 80);
           if HaveClones then
              AutoSizeColumn(2, 60);

           if HaveBiosSets then
              AutoSizeColumn(3, 70);

           if HaveCategory then
              begin
                AutoSizeColumn(4, 80);
                if GamesList.Header.Columns[4].Width > 200 then
                   GamesList.Header.Columns[4].Width:= 200;
              end;

           if HaveDriverName then
              AutoSizeColumn(5, 80);
           AutoSizeColumn(0, 200);
         end;

      //GamesList.BeginUpdate;
      //if not HaveMerged then
      //   HideColumn(8);

      Loop:= GamesList.Width;
      if not HaveCFGs then
         HideColumn(8);
      if not HaveCHDs then
         HideColumn(7);
      if not HaveROMs then
         HideColumn(6);
      if not HaveDriverName then
         HideColumn(5);
      if not HaveCategory then
         HideColumn(4);
      if not HaveBiosSets then
         HideColumn(3);
      if not HaveClones then
         HideColumn(2);

      SelectionIndex:=0;
      for Loop2:=0 to GamesList.Header.Columns.Count-1 do
      begin
        if GamesList.Header.Columns[Loop2].Visible then
           SelectionIndex:= SelectionIndex+GamesList.Header.Columns[Loop2].Width;
      end;
      if SelectionIndex < 620 then
         begin
           GamesList.Header.Columns[0].Width:= GamesList.Header.Columns[0].Width+(620-SelectionIndex-1);
           Loop:= 620;
         end;

      //if Loop < 620 then
      //   begin
      //     GamesList.Header.Columns[0].Width:= GamesList.Header.Columns[0].Width+(620-Loop)-5;
      //     Loop:= 620-5;
      //   end;

      ButtonDeleteFiles.Left:= ButtonDeleteFiles.Left-(FormDeleteMultipleGamesFiles.Width-Loop)+5;
      ButtonNo.Left:= ButtonNo.Left-(FormDeleteMultipleGamesFiles.Width-Loop)+5;
      ButtonHelp.Left:= ButtonHelp.Left-(FormDeleteMultipleGamesFiles.Width-Loop)+5;
      FormDeleteMultipleGamesFiles.ClientWidth:= Loop;

      // useless code... should remove it later... ?
      {if not HaveCHDs then
         begin
           FormDeleteMultipleGamesFiles.Width:= FormDeleteMultipleGamesFiles.Width-GamesList.Header.Columns[6].Width;
           ButtonDeleteFiles.Left:= ButtonDeleteFiles.Left-GamesList.Header.Columns[6].Width;
           ButtonNo.Left:= ButtonNo.Left-GamesList.Header.Columns[6].Width;
           GamesList.Header.Columns[6].Visible:= False;
         end;
      if not HaveMerged then
         begin
           FormDeleteMultipleGamesFiles.Width:= FormDeleteMultipleGamesFiles.Width-GamesList.Header.Columns[8].Width;
           ButtonDeleteFiles.Left:= ButtonDeleteFiles.Left-GamesList.Header.Columns[8].Width;
           ButtonNo.Left:= ButtonNo.Left-GamesList.Header.Columns[8].Width;
           GamesList.Header.Columns[8].Visible:= False;
         end;
      if not HaveBiosSets then
         begin
           FormDeleteMultipleGamesFiles.Width:= FormDeleteMultipleGamesFiles.Width-GamesList.Header.Columns[3].Width;
           ButtonDeleteFiles.Left:= ButtonDeleteFiles.Left-GamesList.Header.Columns[3].Width;
           ButtonNo.Left:= ButtonNo.Left-GamesList.Header.Columns[3].Width;
           GamesList.Header.Columns[3].Visible:= False;
           if ButtonDeleteFiles.Left < ButtonHelp.Left+ButtonHelp.Width+8 then
              begin
                ButtonHelp.Caption:= '?';
                ButtonHelp.Width:= 23;
                ButtonHelp.Left:= ButtonDeleteFiles.Left-27;
                //LabelTotalItems.Left:= 428+((ButtonHelp.Left-428-100) div 2);
              end;
         end;}
      //GamesList.EndUpdate(False);
    end;
end;

function TFormDeleteMultipleGamesFiles.ProcessGamesFiles: Boolean;
var
  Loop: Integer;
  fChanged: Boolean;
begin
  if not Assigned(FormCopyMoveGameFiles) then
     FormCopyMoveGameFiles:= TFormCopyMoveGameFiles.Create(nil);
  FormCopyMoveGameFiles.DoubleBuffered:= True;
  FormCopyMoveGameFiles.Tag:= ActionMode;

  FormCopyMoveGameFiles.iTotalFiles:= 0;
  FormCopyMoveGameFiles.iTotalFilesSize:= 0;
  FormCopyMoveGameFiles.iTotalFilesSizeLeft:= 0;
  FormCopyMoveGameFiles.OverwriteFiles:= CopyMoveOverwriteFiles.Checked;

  if DeleteROMs.Checked then
     begin
       FormCopyMoveGameFiles.iTotalFiles:= FormCopyMoveGameFiles.iTotalFiles+ROMsTotalFiles;
       FormCopyMoveGameFiles.iTotalFilesSize:= FormCopyMoveGameFiles.iTotalFilesSize+ROMsTotalSize;
     end;
  if DeleteCHDs.Checked then
     begin
       FormCopyMoveGameFiles.iTotalFiles:= FormCopyMoveGameFiles.iTotalFiles+CHDsTotalFiles;
       FormCopyMoveGameFiles.iTotalFilesSize:= FormCopyMoveGameFiles.iTotalFilesSize+CHDsTotalSize;
     end;

  if ActionMode = 0 then
     begin
       if DeleteCFGsNVRAMs.Checked then
          begin
            FormCopyMoveGameFiles.iTotalFiles:= FormCopyMoveGameFiles.iTotalFiles+CFGsTotalFiles;
            FormCopyMoveGameFiles.iTotalFilesSize:= FormCopyMoveGameFiles.iTotalFilesSize+CFGsTotalSize;
          end;
       FormCopyMoveGameFiles.LabelCopyTo.Visible:= False;
     end;
  FormCopyMoveGameFiles.iTotalFilesSizeLeft:= FormCopyMoveGameFiles.iTotalFilesSize;
  FormCopyMoveGameFiles.Caption:= FormDeleteMultipleGamesFiles.Caption;

  FormCopyMoveGameFiles.ShowModal;

  fChanged:= False;
  for Loop:= 1 to MaxArcadeSystems do
  begin
    SystemAffected[Loop]:= FormCopyMoveGameFiles.SystemChanged[Loop];
    if SystemAffected[Loop] then
       fChanged:= True;
  end;
  FreeAndNil(FormCopyMoveGameFiles);

  Result:= fChanged;
end;

procedure TFormDeleteMultipleGamesFiles.AdjustWindowSize;
var
  gListSize, bPanelSize, iScrSize, MaxGameCount: Integer;
  iScreenWidth, iScreenHeight: Integer;
begin
  if not FormMain.CheckTotal(GamesList) then
     Exit;

  iScreenWidth:= Screen.Width-20;
  iScreenHeight:= Screen.WorkAreaRect.Bottom-Screen.WorkAreaRect.Top;

  if FormdeleteMultipleGamesFiles.Width > iScreenWidth then
     begin
       // if Screen.Width < 1280, shrink columns width
       ButtonHelp.Left:= ButtonHelp.Left-(FormdeleteMultipleGamesFiles.Width-iScreenWidth);
       ButtonDeleteFiles.Left:= ButtonDeleteFiles.Left-(FormdeleteMultipleGamesFiles.Width-iScreenWidth);
       ButtonNo.Left:= ButtonNo.Left-(FormdeleteMultipleGamesFiles.Width-iScreenWidth);
       FormdeleteMultipleGamesFiles.Width:= iScreenWidth;

       GamesList.Header.Columns[0].Width:= 300;
       GamesList.Header.Columns[1].Width:= 80;
       GamesList.Header.Columns[2].Width:= 80;
       GamesList.Header.Columns[3].Width:= 80;
       GamesList.Header.Columns[4].Width:= 150;
       GamesList.Header.Columns[5].Width:= 95;
       GamesList.Header.Columns[6].Width:= 30;
       GamesList.Header.Columns[7].Width:= 30;
       GamesList.Header.Columns[8].Width:= 30;
     end;

  if PanelDestinationFolder.Visible then
     bPanelSize:= PanelOptions.Height+PanelDestinationFolder.Height
  else
     bPanelSize:= PanelOptions.Height;

  MaxGameCount:= GamesList.Groups.ItemCount;
  if MaxGameCount > 20 then
     MaxGameCount:= 20;
  case Screen.Height of
    768: MaxGameCount:= 18;
    720: MaxGameCount:= 17;
    600: MaxGameCount:= 14;
    480: MaxGameCount:= 10;
  end;

  gListSize:= MaxGameCount*GamesList.CellSizes.Report.Height;
  gListSize:= gListSize+GamesList.Header.Height+6;

  iScrSize:= iScreenHeight-30-40;//-bPanelSize; // max form height // GetSystemMetrics(SM_CYCAPTION); 30 -> form caption height; 405 -> small border

  FormDeleteMultipleGamesFiles.ClientHeight:= gListSize+bPanelSize;
  if FormDeleteMultipleGamesFiles.Height > iScrSize then
     FormDeleteMultipleGamesFiles.Height:= iScrSize;
end;

procedure TFormDeleteMultipleGamesFiles.FormShow(Sender: TObject);
begin
  //CallMaximizeWindow(TForm(Sender));
  FormMain.ELV_ResetNormalColors(GamesList);
  FormMain.CheckSevenZip(-1);

  case ActionMode of
    0: ActionString:= 'Delete';
    1: ActionString:= 'Copy';
    2: ActionString:= 'Move';
  end;

  FormDeleteMultipleGamesFiles.Height:= 800;
  if ActionMode = 0 then
     begin
       PanelDestinationFolder.Visible:= False;
     end
  else
     begin
       ButtonDeleteFiles.Caption:= ActionString+' Files';
       FileTypesGroupBox.Caption:= 'Check File Types to '+ActionString;

       DeleteCFGsNVRAMs.Font.Color:= clGray;
       DeleteCFGsNVRAMs.Font.Style:= [fsBold, fsStrikeout];
       DeleteCFGsNVRAMs.Checked:= False;
       DeleteCFGsNVRAMs.Enabled:= False;
       //GamesList.Header.Columns[0].Width:= GamesList.Header.Columns[0].Width+GamesList.Header.Columns[8].Width; // merged set column
       //GamesList.Header.Columns[8].Visible:= False; // merged set column
     end;
  //StatusIconIndex:= IL_DeleteGameIcons.Count-3;

  AddGamesToList;
  if FormStatus.Visible then
     FormStatus.Close;

  AdjustWindowSize;

  if GamesList.Scrollbars.VertBarVisible then
     begin
       GamesList.BeginUpdate;
       GamesList.Header.Columns[0].Width:= GamesList.Header.Columns[0].Width-GetSystemMetrics(SM_CXVSCROLL); //16;
       GamesList.EndUpdate;
     end;
  //if FormDeleteMultipleGamesFiles.Width > Screen.Width then
  //   begin
  //     FormDeleteMultipleGamesFiles.Width:= 780;//Screen.Width-20;
  //     if GamesList.Scrollbars.HorzBarVisible then
  //        FormDeleteMultipleGamesFiles.ClientHeight:= FormDeleteMultipleGamesFiles.ClientHeight+GetSystemMetrics(SM_CYHSCROLL);
  //   end;

  FormDeleteMultipleGamesFiles.Left:= (Screen.Width shr 1)-(FormDeleteMultipleGamesFiles.Width shr 1)-1;
  FormDeleteMultipleGamesFiles.Top:= (Screen.Height shr 1)-(FormDeleteMultipleGamesFiles.Height shr 1)-1;

  Application.ProcessMessages;
  if not FormMain.CheckTotal(GamesList) then
     PostMessage(Handle, wm_Close, 0, 0); // force auto-close if there are no games to process
end;

procedure TFormDeleteMultipleGamesFiles.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #27 then
     ButtonNo.Click;
end;

procedure TFormDeleteMultipleGamesFiles.ButtonHelpClick(Sender: TObject);
begin
  CallMessageBox;
  FormMain.AddMsgText('    Remove all games from the list that you do not want to ');
  FormMain.AddMsgText(LowerCase(ActionString), $00a65300, [fsBold]);
  FormMain.AddMsgText('. Select one or more games and click ');
  FormMain.AddMsgText('Remove Selected Games', $00a65300, [fsBold]);
  FormMain.AddMsgText(' menu item (popup menu, mouse right-click) or press ');
  FormMain.AddMsgText('Delete', $00a65300, [fsBold]);
  FormMain.AddMsgText(' hotkey.'+#13#10+'To quickly find a parent game, click ');
  FormMain.AddMsgText('Select Parent Game', $00a65300, [fsBold]);
  FormMain.AddMsgText(' menu item (popup menu).'+#13#10+#13#10+
                      '    You can choose what files will be processed in the ');
  FormMain.AddMsgText('Check File Types To '+ActionString, $00a65300, [fsBold]);
  FormMain.AddMsgText(' group box.'+#13#10+
                      'You can also view a list of files that will be ');
  FormMain.AddMsgText(LowerCase(ActionString), $00a65300, [fsBold]);
  FormMain.AddMsgText(' for each game. Select one or more games and call the popup menu. Click ');
  FormMain.AddMsgText('View Selected Files List', $00a65300, [fsBold]);
  FormMain.AddMsgText(' menu item to view only selected games or ');
  FormMain.AddMsgText('View Files List (All Games)', $00a65300, [fsBold]);
  FormMain.AddMsgText(' to view files list of all games in the list.'+#13#10+#13#10+'    To ');
  FormMain.AddMsgText(LowerCase(ActionString), $00a65300, [fsBold]);
  FormMain.AddMsgText(' files, click ');
  FormMain.AddMsgText(ActionString+' Files', $00a65300, [fsBold]);
  FormMain.AddMsgText(' button. You can follow the progress in a dialog box. If there are errors, they will be listed in the log '+
                      'panel.'+#13#10+#13#10);
  case ActionMode of
    0: FormMain.AddMsgText('    When deleting files, if there are changes, you will be prompted to update the main games list. '+
                           'Be aware that recycle bin is not supported. Files cannot be recovered afterwards.'+#13#10+#13#10);
    1, 2:
      begin
        FormMain.AddMsgText('    CHD files are sent to a ');
        FormMain.AddMsgText('\chd_files\', $00a65300, [fsBold]);
        FormMain.AddMsgText(' sub-folder and software list game files are sent to a ');
        FormMain.AddMsgText('\softlistname\', $00a65300, [fsBold]);
        FormMain.AddMsgText(' sub-folder.'+#13#10+#13#10);
      end;
  end;

  FormMain.AddMsgText('    Incremental search is supported (quick search), just type a game title. To search by game name, use the ');
  FormMain.AddMsgText('Search Game Name', $00a65300, [fsBold]);
  FormMain.AddMsgText(' bar.');

  GenerateMessage('Help', 'Things you can do here.', '', 2);
  GamesList.SetFocus;
end;

procedure TFormDeleteMultipleGamesFiles.GamesListItemPaintText(
  Sender: TCustomEasyListview; Item: TEasyItem; Position: Integer;
  ACanvas: TCanvas);
begin
  FormMain.GetCanvasFontCustom(TGameInfo(Item).eSystemID, TGameInfo(Item).eGameStatus,
                         TGameInfo(Item).eDriverStatus,
                         TGameInfo(Item).eClone, ACanvas, True);
  //if GamesList.Width > 1000 then
  //   Exit;
  if (Position > 0) and (Position <> 4) then
     begin
       ACanvas.Font.Name:= 'Tahoma';
       ACanvas.Font.Size:= 8;
     end;
end;

procedure TFormDeleteMultipleGamesFiles.GamesListItemSelectionChanged(
  Sender: TCustomEasyListview; Item: TEasyItem);
begin
  if Item.Selected then
     begin
       SetSelectedGame(Item);
     end;
end;

procedure TFormDeleteMultipleGamesFiles.GamesListKeyAction(
  Sender: TCustomEasyListview; var CharCode: Word; var Shift: TShiftState;
  var DoDefault: Boolean);
begin
  case CharCode of
    VK_ESCAPE: ButtonNo.Click;
    VK_DELETE: PopupRemoveSelectedGames.Click;
  end;
end;

procedure TFormDeleteMultipleGamesFiles.GamesListColumnClick(
  Sender: TCustomEasyListview; Button: TCommonMouseButton;
  ShiftState: TShiftState; const Column: TEasyColumn);
var
  Item: TEasyItem;
begin
  GamesList.BeginUpdate;
  GamesList.Sort.SortAll;
  GamesList.EndUpdate;
  if FormMain.CheckSelected(GamesList) then
     begin
       if SelectedItem <> nil then
          SelectedItem.MakeVisible(emvMiddle) //(emvAuto)
       else
          begin
            Item:= GamesList.Selection.First;
            if Item <> nil then
               Item.MakeVisible(emvMiddle) //(emvAuto);
          end;
     end;
end;

function TFormDeleteMultipleGamesFiles.GamesListItemCompare(
  Sender: TCustomEasyListview; Column: TEasyColumn; Group: TEasyGroup;
  Item1, Item2: TEasyItem; var DoDefault: Boolean): Integer;
var
  tmpItem1, tmpItem2: Boolean;
  gItem1, gItem2: TEasyItem;
begin
  DoDefault:= False;
  FormMain.ELV_GetSortDirection(Column, Item1, Item2, gItem1, gItem2);
  case Column.Index of
    0: Result:= FormMain.iCompare(TGameInfo(gItem1).eTitle, TGameInfo(gItem2).eTitle);
    1: Result:= FormMain.iCompare(TGameInfo(gItem1).eName, TGameInfo(gItem2).eName);
    2: Result:= FormMain.iCompare(TGameInfo(gItem1).eCloneParent, TGameInfo(gItem2).eCloneParent);
    3: Result:= FormMain.iCompare(TGameInfo(gItem1).eBiosName, TGameInfo(gItem2).eBiosName);
    4: Result:= FormMain.iCompare(TGameInfo(gItem1).eCategory, TGameInfo(gItem2).eCategory);
    5: Result:= FormMain.iCompare(TGameInfo(gItem1).eDriverName, TGameInfo(gItem2).eDriverName);
    6, 7, 8:
     begin
       case Column.Index of
         6:
           begin
             tmpItem1:= TGameInfo(gItem1).eHaveROMs;
             tmpItem2:= TGameInfo(gItem2).eHaveROMs;
           end;
         7:
           begin
             tmpItem1:= TGameInfo(gItem1).eHaveCHDs;
             tmpItem2:= TGameInfo(gItem2).eHaveCHDs;
           end;
         8:
           begin
             tmpItem1:= TGameInfo(gItem1).eHaveCFGs;
             tmpItem2:= TGameInfo(gItem2).eHaveCFGs;
           end;
       end;
       Result:= CompareIntValue(Ord(tmpItem1), Ord(tmpItem2));
     end;
  end;
end;

procedure TFormDeleteMultipleGamesFiles.GamesListItemFreeing(
  Sender: TCustomEasyListview; Item: TEasyItem);
begin
  if Assigned(TGameInfo(Item).eGameFiles) then
     TGameInfo(Item).eGameFiles.Clear;
  TGameInfo(Item).eGameFiles.Free;
  TGameInfo(Item).eGameFiles:= nil;
end;

procedure TFormDeleteMultipleGamesFiles.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  FormMain.ClearListView(GamesList);
end;

procedure TFormDeleteMultipleGamesFiles.DeleteCHDsClick(Sender: TObject);
begin
  SetCheckBoxColor(TAdvOfficeCheckBox(Sender).Checked, TAdvOfficeCheckBox(Sender));
  if FormDeleteMultipleGamesFiles.Visible then
     GamesList.SetFocus;
end;

procedure TFormDeleteMultipleGamesFiles.GetSoftwareNames;
var
  Item: TEasyItem;
begin
  FreeAndNil(SoftListAffected);
  if not FormMain.CheckTotal(GamesList) then
     Exit;

  Item:= GamesList.Groups.FirstItem;
  repeat
    if TGameInfo(Item).eSoftwareName <> '' then
       begin
         if not Assigned(SoftListAffected) then
            begin
              SoftListAffected:= THashedStringList.Create;
              SoftListAffected.Sorted:= True;
              SoftListAffected.Duplicates:= dupIgnore;
              SoftListAffected.BeginUpdate;
            end;
         SoftListAffected.Add(TGameInfo(Item).eSoftwareName);
       end;
    Item:= GamesList.Groups.NextItem(Item);
  until Item = nil;
  if Assigned(SoftListAffected) then
     begin
       SoftListAffected.Sorted:= False;
       SoftListAffected.EndUpdate;
       if SoftListAffected.Count = 0 then
          FreeAndNil(SoftListAffected);
     end;
end;

procedure TFormDeleteMultipleGamesFiles.ButtonDeleteFilesClick(
  Sender: TObject);
var
  Loop: ShortInt;
  NewEasyItem: TEasyItem;
  FileTypeStr: String;
  iFreeAvailable, iTotalAvailable, iFreeRequired: Int64;
  ErrorMsg: DWORD;
begin
  if not FormMain.CheckTotal(GamesList) then
     Exit;

  //case ActionMode of
  //  0: ActionString:= 'delete';
  //  1: ActionString:= 'copy';
  //  2: ActionString:= 'move';
  //end;

  Loop:= 1;
  if ActionMode = 0 then
     begin
       if (not DeleteROMs.Checked) and (not DeleteCHDs.Checked) and (not DeleteCFGsNVRAMs.Checked) then
          Loop:= 0;
     end
  else
     begin
       if (not DeleteROMs.Checked) and (not DeleteCHDs.Checked) then
          Loop:= 0;
     end;

  if Loop = 0 then
     begin
       GenerateMessage('Error', FormDeleteMultipleGamesFiles.Caption, '    You haven''t checked '+
                       'any file type to '+LowerCase(ActionString)+'. Please select at least one.', 2, False, 1);
       Exit;
     end;

  if ActionMode <> 0 then
     begin
       if DestinationFolder.Text = '' then
       begin
         CallMessageBox;
         FormMain.ShowGameNameEntryMsgBox;
         GenerateMessage('Error', FormDeleteMultipleGamesFiles.Caption, '    You haven''t selected a destination '+
                         'folder. Use only full paths. Cannot continue.', 2, False, -1);
         Exit;
       end;
     end;

  FileTypeStr:= '';
  if ActionMode <> 0 then
     begin
        FileTypeStr:= Trim(ExtractFileDrive(DestinationFolder.Text));
        if FileTypeStr = '' then
           begin
             CallMessageBox;
             FormMain.ShowGameNameEntryMsgBox;
             GenerateMessage('Error', FormDeleteMultipleGamesFiles.Caption, '    Could not detect the destination drive letter. '+
                             'Please make sure you enter a full destination path.', 2, False, 1);
             Exit;
           end;
        iFreeRequired:= 0;
        if DeleteROMs.Checked then
           iFreeRequired:= ROMsTotalSize;
        if DeleteCHDs.Checked then
           iFreeRequired:= iFreeRequired+CHDsTotalSize;

        if not SysUtils.GetDiskFreeSpaceEx(PChar(FileTypeStr), iFreeAvailable, iTotalAvailable, nil) then
           begin
             ErrorMsg:= GetLastError;
             CallMessageBox;
             FormMain.AddMsgText('    There was an error trying to detect the required free space in the destination path (');
             FormMain.AddMsgText(FileTypeStr, $00a65300, [fsBold]);
             FormMain.AddMsgText('.'#13#10+#13#10+'Error code '+IntToStr(ErrorMsg)+': ');
             FormMain.AddMsgText(SysErrorMessage(ErrorMsg), $00a65300, [fsBold]);
             GenerateMessage('Error', FormDeleteMultipleGamesFiles.Caption, '', 2, False, 1);

             Exit;
           end;
        if iFreeAvailable <= iFreeRequired then
           begin
             CallMessageBox;
             FormMain.AddMsgText('    Can''t ');
             FormMain.AddMsgText(LowerCase(ActionString), clBlack, [fsBold]);
             FormMain.AddMsgText(' files. There is not enough free space in drive ');
             FormMain.AddMsgText(FileTypeStr, $00a65300, [fsBold]);
             FormMain.AddMsgText(#13#10+'The drive letter might also be invalid. Please select another destination, '+
                                 'and make sure to enter a full path, including the drive letter.');
             GenerateMessage('Error', FormDeleteMultipleGamesFiles.Caption, '', 2, False, 1);
             Exit;
           end;
     end;

  FileTypeStr:= '';
  if DeleteROMs.Checked then
     FileTypeStr:= 'Game ROMs [.zip / .7z File]'+#13#10;
  if DeleteCHDs.Checked then
     FileTypeStr:= FileTypeStr+'Compressed Hunks of Data [.chd Files]'+#13#10;
  if (ActionMode = 0) and DeleteCFGsNVRAMs.Checked then
     FileTypeStr:= FileTypeStr+'Game Config/NVRAM Files [CFG, NVRAM, EEPROM, SRAM, FLASH]'+#13#10;

  CallMessageBox;
  FormMain.AddMsgText('    You are about to ');
  FormMain.AddMsgText(LowerCase(ActionString), $00a65300, [fsBold]);
  FormMain.AddMsgText(' the following file types of listed games:'+#13#10+#13#10+FileTypeStr+#13#10+
                      'Click ');
  FormMain.AddMsgText('No', $00a65300, [fsBold]);
  FormMain.AddMsgText(' button if you want to go back and review the files or click ');
  FormMain.AddMsgText('Yes', $00a65300, [fsBold]);
  FormMain.AddMsgText(' button to confirm.'+#13#10+#13#10);
  FormMain.AddMsgText(ActionString+' files. ');
  FormMain.AddMsgText('Are you sure ?', clMaroon { $00a65300 }, [fsBold, fsItalic]);

  if GenerateMessage(ActionString, FormDeleteMultipleGamesFiles.Caption, '', 1, True, 2) = mrNo then
     Exit;

  GetSoftwareNames;
  if ProcessGamesFiles then
     begin
       if ActionMode = 0 then
          begin
           if GenerateMessage(ActionString, 'One or more files were deleted.', '    Would you like to update the games list '+
                              'now (it might take some time) ? Click No button if you want to scan the games '+
                              'list later.', 1, False, 2) = mrYes then
              begin
                if FormDeleteMultipleGamesFiles.Tag <> 1 then
                   begin
                     FormDeleteMultipleGamesFiles.Tag:= 1;
                     FormMain.SelectNearGame(NewEasyItem);
                   end;
                for Loop:= 1 to MaxArcadeSystems do
                begin
                  if SystemAffected[Loop] then
                     FormMain.CallScanGames(0, False, Loop, '', True);
                  Application.ProcessMessages;
                end;
                if Assigned(SoftListAffected) then
                begin
                  for Loop:=0 to SoftListAffected.Count-1 do
                  begin
                    FormMain.CallScanGames(0, False, idMAME, SoftListAffected[Loop], True);
                    Application.ProcessMessages;
                  end;
                end;
                FormStatus.Close;
              end;
          end;
     end;
  if Assigned(SoftListAffected) then
     FreeAndNil(SoftListAffected);
  Application.ProcessMessages;
  //ButtonClose.Click; // won't be closing the dialog after process is concluded... no sir!
end;

procedure TFormDeleteMultipleGamesFiles.ButtonSelectROMsFolderClick(
  Sender: TObject);
begin
  FormMain.DialogSelectFolder(DestinationFolder, False);
end;

procedure TFormDeleteMultipleGamesFiles.PopupGamesMeasureMenuItem(
  Sender: TObject; AMenuItem: TMenuItem; ACanvas: TCanvas; var Width,
  Height: Integer; ABarVisible: Boolean; var DefaultMeasure: Boolean);
begin
  FormMain.SetPopupMenuMeasureItem(AMenuItem, ACanvas, Width, Height);
end;

procedure TFormDeleteMultipleGamesFiles.PopupViewFilesListAllGamesClick(
  Sender: TObject);
begin
  case TMenuItem(Sender).Tag of
    0: // all games
      begin
        if not FormMain.CheckTotal(GamesList) then
           Exit;
      end;
    1: // selected games
      begin
        if not FormMain.CheckSelected(GamesList) then
           Exit;
      end;
  end;
  //Application.ProcessMessages;
  if not Assigned(FormDeleteMultipleGamesViewFiles) then
     FormDeleteMultipleGamesViewFiles:= TFormDeleteMultipleGamesViewFiles.Create(nil);
  FormDeleteMultipleGamesViewFiles.Tag:= TMenuItem(Sender).Tag;
  FormDeleteMultipleGamesViewFiles.ShowModal;
  FreeAndNil(FormDeleteMultipleGamesViewFiles);
  FormDeleteMultipleGamesFiles.BringToFront;
  FormDeleteMultipleGamesFiles.SetFocus;
  GamesList.SetFocus;
end;

procedure TFormDeleteMultipleGamesFiles.PopupParentGameClick(
  Sender: TObject);
var
  Item, selItem: TEasyItem;
  ParentFound: Boolean;
begin
  if not FormMain.CheckTotal(GamesList) then
     Exit;
  if GamesList.Selection.Count <> 1 then
     Exit;
  selItem:= GamesList.Selection.First;
  ParentFound:= False;
  Item:= GamesList.Groups.FirstVisibleItem;
  repeat
    if TGameInfo(Item).eName = TGameInfo(selItem).eClone then
       begin
         if (TGameInfo(Item).eSystemID = TGameInfo(selItem).eSystemID) and
            (TGameInfo(Item).eSoftwareName = TGameInfo(selItem).eSoftwareName) then
            ParentFound:= True;
       end;
    if not ParentFound then
       Item:= GamesList.Groups.NextVisibleItem(Item);
  until (Item = nil) or (ParentFound);
  if ParentFound then
     begin
       GamesList.Selection.ClearAll;
       Item.Selected:= True;
       GamesList.Selection.FocusedItem:= Item;
       Item.MakeVisible(emvMiddle) //(emvAuto);
     end;
  GamesList.SetFocus;
end;

procedure TFormDeleteMultipleGamesFiles.PopupRemoveSelectedGamesClick(
  Sender: TObject);
begin
  if FormMain.CheckSelected(GamesList) then
     begin
       GamesList.Selection.DeleteSelected(True);
       UpdateTotalFilesLabel;
     end;
  GamesList.SetFocus;
end;

procedure TFormDeleteMultipleGamesFiles.GamesListColumnPaintText(
  Sender: TCustomEasyListview; Column: TEasyColumn; ACanvas: TCanvas);
begin
  if Column.Index > 5 then
     begin
       ACanvas.Font.Name:= 'Consolas';
       ACanvas.Font.Size:= ACanvas.Font.Size-1;
     end;
end;

procedure TFormDeleteMultipleGamesFiles.ButtonFindGameNameClick(
  Sender: TObject);
var
  Item: TEasyItem;
  Found: Boolean;
begin
  if (not FormMain.CheckTotal(GamesList)) or (FindGameName.Text = '') or (SameText(' Type a game name...', FindGameName.Text)) then
     begin
       FormMain.BlinkBkEdit(FindGameName);
       GamesList.SetFocus;
       Exit;
     end;

  Found:= False;
  Item:= GamesList.Groups.FirstItem;
  repeat
    if WideIncrementalSearch(TGameInfo(Item).eName, FindGameName.Text) = 0 then
       Found:= True;
    if not Found then
       Item:= GamesList.Groups.NextItem(Item);
  until Found or (Item = nil);
  if Found then
     begin
       GamesList.Selection.ClearAll;
       Item.Selected:= True;
       GamesList.Selection.FocusedItem:= Item;
       Item.MakeVisible(emvMiddle) //(emvAuto);
     end;
  GamesList.SetFocus;
end;

procedure TFormDeleteMultipleGamesFiles.FindGameNameEnter(
  Sender: TObject);
begin
  if SameText(' Type a game name...', TEdit(Sender).Text) then
     begin
       TEdit(Sender).Font.Color:= clBlack;
       TEdit(Sender).Text:= '';
     end;
  TEdit(Sender).Font.Color:= clBlack;
end;

procedure TFormDeleteMultipleGamesFiles.FindGameNameExit(
  Sender: TObject);
begin
  if TEdit(Sender).Text = '' then
     begin
       TEdit(Sender).Font.Color:= clSilver;
       TEdit(Sender).Text:= ' Type a game name...';
     end;
  //TEdit(Sender).Font.Color:= clGray;
end;

procedure TFormDeleteMultipleGamesFiles.FindGameNameKeyPress(
  Sender: TObject; var Key: Char);
begin
  if Key = #13 then
     ButtonFindGameName.OnClick(Self);
end;

procedure TFormDeleteMultipleGamesFiles.ButtonFindGameNameMouseEnter(
  Sender: TObject);
begin
  SearchGameNameBox.Color1:= clSkyBlue;
end;

procedure TFormDeleteMultipleGamesFiles.ButtonFindGameNameMouseLeave(
  Sender: TObject);
begin
  SearchGameNameBox.Color1:= clWhite;
end;

end.
