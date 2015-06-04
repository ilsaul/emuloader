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
    fROMIdentification: Integer;
    fSystemID: ShortInt;
    fMediaType: ShortInt;
    fTitle: String;
    fName: String;
    fClone: String;
    fCloneParent: String;
    fDriverName: String;
    fMerged: Boolean;
    fHaveROMs, fHaveCHDs, fHaveCFGs: Boolean;
    fDriverStatus: ShortInt;
    fBiosName: String;
    fGameStatus: ShortInt;
    fGameFiles: THashedStringList;
  protected
    function GetCaptions(Column: Integer): WideString; override;
    function GetImageIndexes(Column: Integer): TCommonImageIndexInteger; override;
    function GetStateImageIndexes(Column: Integer): TCommonImageIndexInteger; override;
  public
    property eROMIdentification: Integer read fROMIdentification write fROMIdentification;
    property eSystemID: ShortInt read fSystemID write fSystemID;
    property eMediaType: ShortInt read fMediaType write fMediaType;
    property eTitle: String read fTitle write fTitle;
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
    property eGameStatus: ShortInt read fGameStatus write fGameStatus; // 0 - have 1 - miss; 2 - missing ROMs/CHDs
    property eGameFiles: THashedStringList read fGameFiles write fGameFiles;
    // game files.... file type ("filetype" ONLY if media type is "-1"!!!)
    // mediatype=filetype fullpath_filename
    //  0 -> ROM
    //  1 -> CHD
    // -1 -> config files

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
    FindGame: TEdit;
    ButtonFindGame: TBitBtn;
    LabelSearchGame: TShadowLabel;
    PopupGames: TBcBarPopupMenu;
    PopupRemoveSelectedGames: TMenuItem;
    PopupParentGame: TMenuItem;
    N1: TMenuItem;
    PopupViewSelectedFilesList: TMenuItem;
    PopupViewFilesListAllGames: TMenuItem;
    ButtonHelp: TBitBtn;
    LabelTotalItems: TShadowLabel;
    PanelDestinationFolder: TPanelEx;
    LabelDestinationFolder: TShadowLabel;
    DestinationFolder: TEdit;
    LabelCopyMoveDestination: TShadowLabel;
    ButtonSelectROMsFolder: TBitBtn;
    CopyMoveOverwriteFiles: TAdvOfficeCheckBox;
    procedure FormShow(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure ButtonHelpClick(Sender: TObject);
    procedure GamesListItemPaintText(Sender: TCustomEasyListview;
      Item: TEasyItem; Position: Integer; ACanvas: TCanvas);
    procedure GamesListItemSelectionChanged(
      Sender: TCustomEasyListview; Item: TEasyItem);
    procedure ButtonFindGameClick(Sender: TObject);
    procedure FindGameEnter(Sender: TObject);
    procedure FindGameExit(Sender: TObject);
    procedure FindGameKeyPress(Sender: TObject; var Key: Char);
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
  private
    { Private declarations }
    SelectedItem: TEasyItem;
    SystemAffected: array[1..MaxArcadeSystems] of Boolean;
    tempFilesList: THashedStringList;
    MergedSets: array[0..1] of THashedStringList;
    FolderCFG: array[1..MaxArcadeSystems] of String;
    FolderNVRAM: array[1..MaxArcadeSystems] of String;
    ActionString: String;
    ROMsTotalSize, CHDsTotalSize, CFGsTotalSize: Int64;
    ROMsTotalFiles, CHDsTotalFiles, CFGsTotalFiles, StatusIconIndex: Integer;
    procedure SetCheckBoxColor(Enabled: Boolean; CheckBoxHolder: TAdvOfficeCheckBox);
    procedure SetSelectedGame(ELV_Item: TEasyItem);
    procedure UpdateTotalFilesLabel;
    procedure SearchROMsFiles(eROMsList: TStringList; var MergedSetVar: Boolean; var HaveROMsVar: Boolean; var HaveCHDsVar: Boolean);
    procedure SearchConfigFiles(var HaveCFGsVar: Boolean);
    procedure AdjustWindowSize;
    procedure AddGamesToList;
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
    4: Result:= eDriverName;
    8:
      begin
        case eMerged of
          True : Result:= 'Yes';
          False: Result:= '';
        end;
      end;
  end;
end;

function TGameInfo.GetImageIndexes(Column: Integer): TCommonImageIndexInteger;
begin
  case Column of
    0: Result:= eROMIdentification;
    5:
      begin
        if eHaveROMs then
           Result:= FormDeleteMultipleGamesFiles.DeleteROMs.Tag// MaxGameID+MaxArcadeSystems+1
        else
           Result:= -1;
      end;
    6:
      begin
        if eHaveCHDs then
           Result:= FormDeleteMultipleGamesFiles.DeleteCHDs.Tag //MaxGameID+MaxArcadeSystems+2
        else
           Result:= -1;
      end;
    7:
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

function TGameInfo.GetStateImageIndexes(Column: Integer): TCommonImageIndexInteger;
begin
  case Column of
    0: Result:= MaxGameID+eSystemID;
    //4:
    //  begin
    //    if eDriverStatus <> -1 then
    //       Result:= eDriverStatus+FormDeleteMultipleGamesFiles.StatusIconIndex;
    //  end;
  else
       Result:= -1;
  end;
end;

procedure TFormDeleteMultipleGamesFiles.SetCheckBoxColor(Enabled: Boolean; CheckBoxHolder: TAdvOfficeCheckBox);
begin
  if Enabled then
     CheckBoxHolder.Font.Color:= clNavy
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
  LabelTotalItems.Caption:= IntToStr(GamesList.Groups.ItemCount)+' Games';
end;

procedure TFormDeleteMultipleGamesFiles.SearchROMsFiles(eROMsList: TStringList; var MergedSetVar: Boolean; var HaveROMsVar: Boolean; var HaveCHDsVar: Boolean);
var
  FileFullPath, ZiNcFilePath: String;
  IsZiNcSystem, IsParentCHD: Boolean;
  Loop: Integer;
  chdName, chdParentName, DiskFile, romName, romCRC: String;
begin
  IsZiNcSystem:= FormMain.TempGameVars.eSystemID = idZiNc;
  ZiNcFilePath:= '';

  MergedSetVar:= False;
  FileFullPath:= FormMain.SearchZIPFolder(FormMain.TempGameVars.eName, FormMain.TempGameVars.eSystemID);
  if (FileFullPath = '') and FormMain.GameIsClone(FormMain.TempGameVars.eClone) and
     FormMain.IsMAMEBasedSys(FormMain.TempGameVars.eSystemID) then
     begin
       // MergedSets[1] -> MAME
       // MergedSets[0] -> HBMAME
       // check for merged game
       if Assigned(MergedSets[Ord(FormMain.TempGameVars.eSystemID = idMAME)]) then
          begin
            if not FormMain.IsROM_HaveMissROMs(FormMain.TempGameVars.eGameSetStatus) then
               begin
                 MergedSetVar:= MergedSets[Ord(FormMain.TempGameVars.eSystemID = idMAME)].IndexOf(FormMain.TempGameVars.eName) <> -1;
                 if MergedSetVar then
                    FileFullPath:= FormMain.SearchZIPFolder(FormMain.TempGameVars.eClone, FormMain.TempGameVars.eSystemID);
               end;
          end;
     end;
  if FileFullPath <> '' then
     begin
       // found gamename.zip or parentname.zip for merged sets
       tempFilesList.Add('0='+FileFullPath);
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
      romCRC:= eROMsList.Names[Loop];
      romName:= eROMsList.ValueFromIndex[Loop];
      if (romName[1] = '3') and (romCRC <> '') then
         begin
           Delete(romName, 1, 2);
           FormMain.GetCHDName(romName, FormMain.GameIsClone(FormMain.TempGameVars.eClone), chdName, chdParentName); // get correct chdName and chdParentName (for MAME)
           DiskFile:= FormMain.SearchCHDSimpleScan(FormMain.TempGameVars.eSystemID, romName, FormMain.TempGameVars.eName, FormMain.TempGameVars.eClone, FormMain.TempGameVars.eBiosName);

           if DiskFile <> '' then
              begin
                // CHD file found...
                IsParentCHD:= FormMain.GameIsClone(FormMain.TempGameVars.eClone) and (not SameText(chdName+'.chd', ExtractFileName(DiskFile)));
                tempFilesList.Add('1='+Format('%d %s', [Ord(IsParentCHD), DiskFile]));
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
    Loop: Integer;
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
               tempFilesList.Add('-1='+Format('%d %s', [FileType, FileFullPath]));
               HaveCFGsVar:= True;
               CFGsTotalSize:= CFGsTotalSize+GetFileSize(FileFullPath);
               Inc(CFGsTotalFiles);
             end;
           1: // nvram\gamename\ for MAME; .nv; .dat;
             begin
               if not haveMAMEnvram then // .nv; .dat
                  begin
                    tempFilesList.Add('-1=1 '+FileFullPath);
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
                        tempFilesList.Add('-1=1 '+nvram_MAME[Loop]);
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
  if FormMain.TempGameVars.eSystemID = idDaphne then
     Exit; // Daphne doesn't have any config files to delete (EL doesn't delete them!!!)
     
  AddItem_ELV(0); // .cfg; .input (segamodel2)
  AddItem_ELV(1); // .dat; .nv; nvram
  AddItem_ELV(2); // .eeprom
  AddItem_ELV(3); // .sram
  AddItem_ELV(4); // .flash
end;

procedure TFormDeleteMultipleGamesFiles.AddGamesToList;
var
  Loop: Integer;
  gItem, addItem: TEasyItem;
  GameIsMerged, FoundROMs, FoundCHDs, FoundCFGs: Boolean;
  HaveCHDs, HaveMerged, HaveBiosSets: Boolean;

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
    TGameInfo(addItem).eGameStatus:= FormMain.TempGameVars.eGameSetStatus;
    TGameInfo(addItem).eMerged:= GameIsMerged;
    TGameInfo(addItem).eHaveROMs:= FoundROMs; // useful for a future expansion ???
    TGameInfo(addItem).eHaveCHDs:= FoundCHDs; // useful for a future expansion ???
    TGameInfo(addItem).eHaveCFGs:= FoundCFGs; // useful for a future expansion ???
    TGameInfo(addItem).eGameFiles:= THashedStringList.Create;
    TGameInfo(addItem).eGameFiles.AddStrings(tempFilesList);
  end;

begin
  HaveCHDs:= False;
  HaveMerged:= False;
  HaveBiosSets:= False;
  for Loop:= 1 to MaxArcadeSystems do
  begin
    SystemAffected[Loop]:= False;
    if ActionMode = 0 then
       FormMain.LoadFolders_ConfigFiles(Loop, FolderCFG[Loop], FolderNVRAM[Loop]);

    if FileExists(FormMain.GetGamesFolderEL+FormMain.GetSystemIniSection(Loop, True)+'_merged.ini') then
       begin
         MergedSets[Ord(Loop = idMAME)]:= THashedStringList.Create;
         MergedSets[Ord(Loop = idMAME)].LoadFromFile(FormMain.GetGamesFolderEL+FormMain.GetSystemIniSection(Loop, True)+'_merged.ini');
       end;
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
    if AddGame then
       begin
         if uMain.TEasyGameInfo(gItem).eCHDsCount > 0 then
            HaveCHDs:= True;
         if GameIsMerged then
            HaveMerged:= True;
         if FormMain.ValidateBiosName(uMain.TEasyGameInfo(gItem).eBiosName, uMain.TEasyGameInfo(gItem).eName) then
            HaveBiosSets:= True;
       end;       
    gItem:= FormMain.GamesListView.Selection.Next(gItem);
    Application.ProcessMessages;
  until gItem = nil;

  //ShowMessage('ROMs total size: '+IntToStr(ROMsTotalSize)+#13#10+
  //            'CHDs total size: '+IntToStr(CHDsTotalSize)+#13#10+
  //            'CFGs total size: '+IntToStr(CFGsTotalSize));

  if FormMain.CheckTotal(GamesList) then
     GamesList.Sort.SortAll;
  GamesList.Items.ReIndexDisable:= False;
  GamesList.EndUpdate(False);
  FreeAndNil(MergedSets[1]); // MAME
  FreeAndNil(MergedSets[0]); // HBMAME
  FreeAndNil(tempFilesList);
  FormMain.ClearMemGameInfo(FormMain.TempGameVars);

  UpdateTotalFilesLabel;
  if not FormMain.CheckTotal(GamesList) then
     GenerateMessage(FormDeleteMultipleGamesFiles.Caption, 'Games list is empty.',
                     'No files found. There are no files to be processed.', 2, False, 1)
  else
    begin
      if not HaveCHDs then
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
                LabelTotalItems.Left:= 428+((ButtonHelp.Left-428-100) div 2);
              end;
         end;
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
  gListSize, bPanelSize, iScrSize: Integer;
  iAdjustSize: Boolean;
begin
  if not FormMain.CheckTotal(GamesList) then
     Exit;
  gListSize:= GamesList.Groups.ItemCount;
  iAdjustSize:= gListSize < 20;
  if not iAdjustSize then
     begin
       if PanelDestinationFolder.Visible then
          FormDeleteMultipleGamesFiles.ClientHeight:= FormDeleteMultipleGamesFiles.ClientHeight-4;
       Exit;
     end;
     
  gListSize:= gListSize*GamesList.CellSizes.Report.Height;
  gListSize:= gListSize+GamesList.Header.Height+6;


  if PanelDestinationFolder.Visible then
     bPanelSize:= (PanelOptions.Height+PanelDestinationFolder.Height)
  else
     bPanelSize:= PanelOptions.Height;

  iScrSize:= Screen.Height-95-30;

  if gListSize+bPanelSize < Screen.Height then
     FormDeleteMultipleGamesFiles.ClientHeight:= gListSize+bPanelSize;
  //else
  //   CallMaximizeWindow(FormDeleteMultipleGamesFiles);
  //FormDeleteMultipleGamesFiles.Top:= 30;
  //FormDeleteMultipleGamesFiles.Height:= Screen.Height-95;
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
       GamesList.Header.Columns[0].Width:= GamesList.Header.Columns[0].Width+GamesList.Header.Columns[7].Width;
       GamesList.Header.Columns[7].Visible:= False;
     end;
  //StatusIconIndex:= IL_DeleteGameIcons.Count-3;

  AddGamesToList;
  if FormStatus.Visible then
     FormStatus.Close;

  AdjustWindowSize;
  FormDeleteMultipleGamesFiles.Left:= (Screen.Width shr 1)-(FormDeleteMultipleGamesFiles.Width shr 1)-1;
  FormDeleteMultipleGamesFiles.Top:= (Screen.Height shr 1)-(FormDeleteMultipleGamesFiles.Height shr 1)-1;
  if GamesList.Scrollbars.VertBarVisible then
     begin
       GamesList.BeginUpdate;
       GamesList.Header.Columns[0].Width:= GamesList.Header.Columns[0].Width-16;
       GamesList.EndUpdate;
     end;
  Application.ProcessMessages;
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
  FormMain.AddMsgText(' menu item to view selected games only or ');
  FormMain.AddMsgText('View Files List (All Games)', $00a65300, [fsBold]);
  FormMain.AddMsgText(' menu item to view files list of all games in the list.'+#13#10+#13#10+'    To ');
  FormMain.AddMsgText(LowerCase(ActionString), $00a65300, [fsBold]);
  FormMain.AddMsgText(' files, click ');
  FormMain.AddMsgText(ActionString+' Files', $00a65300, [fsBold]);
  FormMain.AddMsgText(' button. You can follow the progress in a dialog box. If there are errors, they will be listed in the log '+
                      'panel.'+#13#10+#13#10);
  if ActionMode = 0 then
     FormMain.AddMsgText('    When deleting files, if there are changes, you will be prompted to update the main games list. '+
                         'Be aware that recycle bin is not supported. Files cannot be recovered afterwards.'+#13#10+#13#10);
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
  FormMain.GetCanvasFontCustom(TGameInfo(Item).eGameStatus,
                         TGameInfo(Item).eDriverStatus,
                         TGameInfo(Item).eClone, ACanvas, True);
end;

procedure TFormDeleteMultipleGamesFiles.GamesListItemSelectionChanged(
  Sender: TCustomEasyListview; Item: TEasyItem);
begin
  if Item.Selected then
     begin
       SetSelectedGame(Item);
     end;
end;

procedure TFormDeleteMultipleGamesFiles.ButtonFindGameClick(
  Sender: TObject);
var
  Item: TEasyItem;
  Found: Boolean;
begin
  if (not FormMain.CheckTotal(GamesList)) or (FindGame.Text = '') then
     begin
       GamesList.SetFocus;
       Exit;
     end;

  Found:= False;
  Item:= GamesList.Groups.FirstItem;
  repeat
    if WideIncrementalSearch(TGameInfo(Item).eName, FindGame.Text) = 0 then
       Found:= True;
    if not Found then
       Item:= GamesList.Groups.NextItem(Item);
  until Found or (Item = nil);
  if Found then
     begin
       GamesList.Selection.ClearAll;
       Item.Selected:= True;
       GamesList.Selection.FocusedItem:= Item;
       Item.MakeVisible(emvAuto);
     end;
  GamesList.SetFocus;
end;

procedure TFormDeleteMultipleGamesFiles.FindGameEnter(Sender: TObject);
begin
  FindGame.Font.Color:= clBlack;
end;

procedure TFormDeleteMultipleGamesFiles.FindGameExit(Sender: TObject);
begin
  FindGame.Font.Color:= clGray;
end;

procedure TFormDeleteMultipleGamesFiles.FindGameKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then
     ButtonFindGame.Click;
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
          SelectedItem.MakeVisible(emvAuto)
       else
          begin
            Item:= GamesList.Selection.First;
            if Item <> nil then
               Item.MakeVisible(emvAuto);
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
  if Column.Index <> 8 then
     begin
       DoDefault:= False;
       FormMain.ELV_GetSortDirection(Column, Item1, Item2, gItem1, gItem2);
     end;
  case Column.Index of
    0: Result:= FormMain.iCompare(TGameInfo(gItem1).eTitle, TGameInfo(gItem2).eTitle);
    1: Result:= FormMain.iCompare(TGameInfo(gItem1).eName, TGameInfo(gItem2).eName);
    2: Result:= FormMain.iCompare(TGameInfo(gItem1).eCloneParent, TGameInfo(gItem2).eCloneParent);
     {begin
       // "clone of" column
       //DoDefault:= False;
       case Column.SortDirection of
         esdAscending : Result:= CompareText(TGameInfo(Item1).eCloneParent, TGameInfo(Item2).eCloneParent);
         esdDescending: Result:= CompareText(TGameInfo(Item2).eCloneParent, TGameInfo(Item1).eCloneParent);
       end;
     end;}
    3: Result:= FormMain.iCompare(TGameInfo(gItem1).eBiosName, TGameInfo(gItem2).eBiosName);
    4: Result:= FormMain.iCompare(TGameInfo(gItem1).eDriverName, TGameInfo(gItem2).eDriverName);
    5, 6, 7:
     begin
       case Column.Index of
         5:
           begin
             tmpItem1:= TGameInfo(gItem1).eHaveROMs;
             tmpItem2:= TGameInfo(gItem2).eHaveROMs;
           end;
         6:
           begin
             tmpItem1:= TGameInfo(gItem1).eHaveCHDs;
             tmpItem2:= TGameInfo(gItem2).eHaveCHDs;
           end;
         7:
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

  FileTypeStr:= '';
  if ActionMode <> 0 then
     begin
        FileTypeStr:= Trim(ExtractFileDrive(DestinationFolder.Text));
        if FileTypeStr = '' then
           begin
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
                     FormMain.CallScanGames(0, False, Loop);
                end;
              end;
          end;
     end;
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
         if TGameInfo(Item).eSystemID = TGameInfo(selItem).eSystemID then
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
       Item.MakeVisible(emvAuto);
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

end.
