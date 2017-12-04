unit uDeleteMultipleGamesFiles;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  StdCtrls, IniFiles, Dialogs,
  uMain, EasyListview, MPCommonObjects, MPCommonUtilities, ImgList,
  ExtCtrls, uCommon, uCommonCustom, Buttons, PanelEx, ShadowLabel,
  AdvOfficeButtons, AdvGroupBox, Menus, BarMenus;

type
  TGameInfo = class(TEasyItemStored)
  private
    fSystemID: ShortInt;
    fCustomSystemID: ShortInt;
    fROMIdentification: Integer;
    fMediaType: ShortInt;
    fCustomMediaType: ShortInt; // 0 -> ROM; 1 -> Cartridge; 2 -> Disc Image; 3 -> Floppy; 4 -> Cassette; 5 -> Hard Disk Drive
    fTitle: WideString;
    fName: WideString;
    fClone: String;
    fCloneParent: WideString;
    fDriverName: String;
    fMerged: Boolean;
    fHaveROMsArcade, fHaveCHDsArcade, fHaveCFGsArcade: Boolean;
    fROMSizeArcade, fCHDSizeArcade, fCFGSizeArcade, fCustomGameSize: Int64;
    fCHDsCount: Integer;
    fCFGsCount: Integer;
    fDriverStatus: ShortInt;
    fSoftwareName: String;
    fCategory: WideString;
    fGameStatus: ShortInt;
    fGameFiles: THashedStringList;
    fIsCustomGame: Boolean;
    fIsUnicode: Boolean;
    fCustomGameFileFullPath: WideString;
    fCustomGameFileShowText: WideString;

  protected
    function GetCaptions(Column: Integer): WideString; override;
    function GetImageIndexes(Column: Integer): TCommonImageIndexInteger; override;
    function GetStateImageIndexes(Column: Integer): TCommonImageIndexInteger; override;
  public
    property eSystemID: ShortInt read fSystemID write fSystemID;
    property eCustomSystemID: ShortInt read fCustomSystemID write fCustomSystemID;
    property eROMIdentification: Integer read fROMIdentification write fROMIdentification;
    property eMediaType: ShortInt read fMediaType write fMediaType;
    property eCustomMediaType: ShortInt read fCustomMediaType write fCustomMediaType; // 0 -> ROM; 1 -> Cartridge; 2 -> Disc Image; 3 -> Floppy; 4 -> Cassette; 5 -> Hard Disk Drive
    property eTitle: WideString read fTitle write fTitle;
    property eName: WideString read fName write fName;
    property eClone: String read fClone write fClone;
    property eCloneParent: WideString read fCloneParent write fCloneParent;
    property eDriverName: String read fDriverName write fDriverName;
    property eMerged: Boolean read fMerged write fMerged;
    property eHaveROMsArcade: Boolean read fHaveROMsArcade write fHaveROMsArcade;
    property eHaveCHDsArcade: Boolean read fHaveCHDsArcade write fHaveCHDsArcade;
    property eHaveCFGsArcade: Boolean read fHaveCFGsArcade write fHaveCFGsArcade;
    property eROMSizeArcade: Int64 read fROMSizeArcade write fROMSizeArcade;
    property eCHDSizeArcade: Int64 read fCHDSizeArcade write fCHDSizeArcade;
    property eCFGSizeArcade: Int64 read fCFGSizeArcade write fCFGSizeArcade;
    property eCustomGameSize: Int64 read fCustomGameSize write fCustomGameSize;

    property eCHDsCount: Integer read fCHDsCount write fCHDsCount;
    property eCFGsCount: Integer read fCFGsCount write fCFGsCount;

    property eDriverStatus: ShortInt read fDriverStatus write fDriverStatus;
    property eSoftwareName: String read fSoftwareName write fSoftwareName;
    property eCategory: WideString read fCategory write fCategory;
    property eGameStatus: ShortInt read fGameStatus write fGameStatus; // 0 - have 1 - miss; 2 - missing ROMs/CHDs
    property eGameFiles: THashedStringList read fGameFiles write fGameFiles;

    property eIsCustomGame: Boolean read fIsCustomGame write fIsCustomGame;
    property eIsUnicode: Boolean read fIsUnicode write fIsUnicode;
    property eCustomGameFileFullPath: WideString read fCustomGameFileFullPath write fCustomGameFileFullPath;
    property eCustomGameFileShowText: WideString read fCustomGameFileShowText write fCustomGameFileShowText;

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
    PanelOptions: TPanelEx;
    IL_DeleteGameIcons: TImageList;
    FileTypesGroupBox: TAdvGroupBox;
    DeleteROMs: TAdvOfficeCheckBox;
    DeleteCHDs: TAdvOfficeCheckBox;
    DeleteCFGsNVRAMs: TAdvOfficeCheckBox;
    ButtonDeleteFiles: TBitBtn;
    ButtonNo: TBitBtn;
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
    DeleteGameFromGamesList: TAdvOfficeCheckBox;
    DeleteGameFileFromDisk: TAdvOfficeCheckBox;
    DeleteGameConsoleComputerIcon: TImage;
    GamesList: TEasyListview;
    Panel1: TPanel;
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
    procedure GamesListItemImageDraw(Sender: TCustomEasyListview;
      Item: TEasyItem; Column: TEasyColumn; ACanvas: TCanvas;
      const RectArray: TEasyRectArrayObject;
      AlphaBlender: TEasyAlphaBlender);
    procedure GamesListItemImageDrawIsCustom(Sender: TCustomEasyListview;
      Item: TEasyItem; Column: TEasyColumn; var IsCustom: Boolean);
    procedure GamesListItemImageGetSize(Sender: TCustomEasyListview;
      Item: TEasyItem; Column: TEasyColumn; var ImageWidth,
      ImageHeight: Integer);
  private
    { Private declarations }
    SelectedItem: TEasyItem;
    ArcadeSystemAffected: array[1..MaxArcadeSystems] of Boolean;
    tempFilesList, SoftListAffected: THashedStringList;
    FileFullPathConsoleComputer: WideString;
    FolderCFG: array[1..MaxArcadeSystems] of String;
    FolderNVRAM: array[1..MaxArcadeSystems] of String;
    ActionString: String;
    ROMsTotalSize, CHDsTotalSize, CFGsTotalSize: Int64;
    ROMsTotalFiles, CHDsTotalFiles, CFGsTotalFiles: Integer;
    ConsCompTotalSize: Int64;
    ConsCompTotalFiles: Integer;

    FileTextMaxCount: Integer;
    HaveArcade, HaveConsoleComputer: Boolean;
    procedure SetCheckBoxColor(Enabled: Boolean; CheckBoxHolder: TAdvOfficeCheckBox);
    procedure SetSelectedGame(ELV_Item: TEasyItem);
    procedure UpdateTotalFilesLabel;
    procedure SearchROMsFiles(eROMsList: TStringList; var MergedSetVar: Boolean; var HaveROMsVar: Boolean; var HaveCHDsVar: Boolean; var CHDFilesCountVar: Integer; var ROMFileTotalSizeVar: Int64; var CHDFilesTotalSizeVar: Int64);
    procedure SearchConfigFiles(var HaveCFGsVar: Boolean; var CFGFilesCountVar: Integer; var CFGTotalFilesSize: Int64);
    procedure SearchConsCompGameFile(var VarFileFullPath: WideString; var HaveROMsVar: Boolean; var HaveCHDsVar: Boolean);
    function  DeleteConsoleComputerGames: Boolean;
    procedure ResizeForm;
    procedure AddGamesToList;
    procedure GetSoftwareNames;
    function  ProcessGamesFiles: Boolean;
  public
    { Public declarations }
    ActionMode: Integer; // 0 -> delete games files; 1 -> copy games files; 2 -> move games files; -1 -> delete console/computer/handheld games
  end;

var
  FormDeleteMultipleGamesFiles: TFormDeleteMultipleGamesFiles;

implementation

uses uStatus, uDeleteMultipleGamesViewFiles, uCopyMoveGameFiles;

{$R *.dfm}

function TGameInfo.GetCaptions(Column: Integer): WideString;
var
  ExtraCount, VertBar: Integer;
begin
  case Column of
    0: Result:= eTitle;
    1: Result:= eName;
    2: Result:= eClone;
    3: Result:= eCategory;
    4: Result:= eDriverName;
    20:
      begin
        case FormDeleteMultipleGamesFiles.GamesList.Scrollbars.VertBarVisible of
          True : VertBar:= 2;
          False: VertBar:= 0;
        end;
        ExtraCount:= FormDeleteMultipleGamesFiles.FileTextMaxCount-VertBar;

        case eIsCustomGame of
          True:
            begin
              if eCustomGameFileShowText = '' then
                 eCustomGameFileShowText:= WideFormat('%-'+IntToStr(ExtraCount)+'s', [ShortDirStringW(eCustomGameFileFullPath, ExtraCount)]);
              Result:= eCustomGameFileShowText;
            end;
          False:
            begin
              Result:= 'name: '+eName;
             if eClone <> '' then
                Result:= Result+' [clone of '+eClone+']';
             if eSoftwareName <> '' then
                Result:= Result+' [softlist: '+eSoftwareName+']';
             if eDriverName <> '' then
                Result:= Result+' [driver: '+eDriverName+']';
             Result:= Format('%-'+IntToStr(ExtraCount)+'s', [Result]);

              //if extraStr <> '' then
              //   begin
              //     extraStr:= '['+extraStr+'] ';
              //     ExtraCount:= ExtraCount-Length(extraStr);
              //   end;
              //Result:= Format({extraStr+}'%-'+IntToStr(ExtraCount)+'s', [ShortDirString(eFileName, ExtraCount)]);
            end;
        end;
      end;
  end;
end;

function TGameInfo.GetImageIndexes(Column: Integer): TCommonImageIndexInteger;
begin
  if Column = 0 then
     begin
       case eIsCustomGame of
         True : Result:= MaxGameID+eCustomSystemID;
         False: Result:= FormMain.GetMAMEImageIndex(eROMIdentification, eSoftwareName)
       end;
     end
  else
     Result:= -1;
end;

function TGameInfo.GetStateImageIndexes(Column: Integer): TCommonImageIndexInteger;
begin
  case Column of
    0:
      begin
        if eIsCustomGame then
           Result:= 0
        else
           Result:= eSystemID;//-1;
      end;
    6:
      begin
        if eHaveROMsArcade then
           Result:= FormDeleteMultipleGamesFiles.DeleteROMs.Tag+1// MaxGameID+MaxArcadeSystems+1
        else
           Result:= -1;
      end;
    7:
      begin
        if eHaveCHDsArcade then
           Result:= FormDeleteMultipleGamesFiles.DeleteCHDs.Tag+1 //MaxGameID+MaxArcadeSystems+2
        else
           Result:= -1;
      end;
    8:
      begin
        if eHaveCFGsArcade then
           Result:= FormDeleteMultipleGamesFiles.DeleteCFGsNVRAMs.Tag+1 //MaxGameID+MaxArcadeSystems+3
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
       if TGameInfo(ELV_Item).eIsCustomGame then
          PopupParentGame.Visible:= False
       else
          PopupParentGame.Enabled:= FormMain.GameIsClone(TGameInfo(ELV_Item).eClone);
     end
  else
     begin
       if TGameInfo(ELV_Item).eIsCustomGame then
          PopupParentGame.Visible:= False
       else
          PopupParentGame.Enabled:= False;
       SelectedItem:= nil;
     end;
end;

procedure TFormDeleteMultipleGamesFiles.UpdateTotalFilesLabel;
begin
  FormDeleteMultipleGamesFiles.Caption:= FormDeleteMultipleGamesFiles.Hint+' ['+IntToStr(GamesList.Groups.ItemCount)+' Games]';

  // this is for debugging only... never uncomment this!!!
  //Panel1.Caption:= 'ROMsTotalSize: '+IntToStr(ROMsTotalSize)+' - CHDsTotalSize: '+IntToStr(CHDsTotalSize)+' - CFGsTotalSize: '+IntToStr(CFGsTotalSize)+
  //                 ' - ROMsTotalFiles: '+IntToStr(ROMsTotalFiles)+' - CHDsTotalFiles: '+IntToStr(CHDsTotalFiles)+' - CFGsTotalFiles: '+IntToStr(CFGsTotalFiles)+
  //                 ' - ConsCompTotalSize: '+ IntToStr(ConsCompTotalSize)+' - ConsCompTotalFiles: '+IntToStr(ConsCompTotalFiles);

  //LabelTotalItems.Caption:= IntToStr(GamesList.Groups.ItemCount)+' Games';
end;

procedure TFormDeleteMultipleGamesFiles.SearchROMsFiles(eROMsList: TStringList; var MergedSetVar: Boolean; var HaveROMsVar: Boolean; var HaveCHDsVar: Boolean; var CHDFilesCountVar: Integer; var ROMFileTotalSizeVar: Int64; var CHDFilesTotalSizeVar: Int64);
var
  StrDOSName, ZiNcFilePath: String;
  IsZiNcSystem, IsParentCHD: Boolean;
  Loop: Integer;
  FileFullPath: WideString;
  chdName, chdParentName, DiskFile, romName, romCRC32, romSHA1: String;
  CHDFileID: ShortInt;
  tmpFileSize: Int64;
begin
  IsZiNcSystem:= FormMain.TempGameVars.eSystemID = idZiNc;
  ZiNcFilePath:= '';

  HaveROMsVar:= False;
  MergedSetVar:= False;
  HaveCHDsVar:= False;

  // CHD file found...
  // arcade
  // 00 -> rom; 01 -> CHD; -1 -> config files
  // media_type FileID IsParentCHD filename
  // 01120 simpbowl.chd
  // 00000 elvator.rom
  // -1000 elvator.cfg

  // console/computer
  // media_type -> MediaTypeCustom[] array indexes 01..05
  // media_type IsUnicode filename
  // 00         1         blal-filename-fullpath.rom
  // 01         0         blal-cd-file-fullpath.iso

  // if 4th char position is a space char, then it's a EmuCon game... 
  if FormMain.TempGameVars.eIsCustomGame then
     begin
       {FileFullPath:= FormMain.TempGameVars.eName;
       FormMain.SearchGameFile(FormMain.TempGameVars.eName, FormMain.MemGameInfo.eCustomSystemID, FormMain.MemGameInfo.eCustomMediaType, False, False, FileFullPath, StrDOSName);
       if FileFullPath <> '' then
          begin
            if FormMain.MemGameInfo.eIsUnicode then
               tempFilesList.Add(IntToStr(FormMain.MemGameInfo.eCustomMediaType)+'1 '+UTF8Encode(FileFullPath))
            else
               tempFilesList.Add(IntToStr(FormMain.MemGameInfo.eCustomMediaType)+'0 '+FileFullPath);

            HaveROMsVar:= True;
            ROMsTotalSize:= ROMsTotalSize+GetFileSizeW(FileFullPath);
          end;}
     end
  else
     begin
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

            tmpFileSize:= GetFileSize(FileFullPath);;
            ROMFileTotalSizeVar:= ROMFileTotalSizeVar+tmpFileSize;

            HaveROMsVar:= True;
            ROMsTotalSize:= ROMsTotalSize+tmpFileSize;
            Inc(ROMsTotalFiles);
          end;
     end;
  if FormMain.TempGameVars.eIsCustomGame then
     Exit;

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
                // arcade
                // 00 -> rom; 01 -> CHD; -1 -> config files
                // media_type FileID IsParentCHD filename
                // 01120 simpbowl.chd
                // 00000 elvator.rom
                // -1000 elvator.cfg

                // console/computer
                // media_type -> MediaTypeCustom[] array indexes 01..05
                // media_type IsUnicode filename
                // 00         1         blal-filename-fullpath.rom
                // 01         0         blal-cd-file-fullpath.iso
                
                IsParentCHD:= FormMain.GameIsClone(FormMain.TempGameVars.eClone) and (not SameText(chdName+'.chd', ExtractFileName(DiskFile)));
                tempFilesList.Add('01'+Format('%.2u%d %s', [CHDFileID, Ord(IsParentCHD), DiskFile]));
                HaveCHDsVar:= True;

                tmpFileSize:= GetFileSize(DiskFile);


                CHDFilesTotalSizeVar:= CHDFilesTotalSizeVar+tmpFileSize; // this is a game local var...
                Inc(CHDFilesCountVar);

                CHDsTotalSize:= CHDsTotalSize+tmpFileSize; // this is a global var for ALL listed games
                Inc(CHDsTotalFiles);
              end;
         end;
    end;
  end;
end;

procedure TFormDeleteMultipleGamesFiles.SearchConfigFiles(var HaveCFGsVar: Boolean; var CFGFilesCountVar: Integer; var CFGTotalFilesSize: Int64);
var
  FileFullPath: String;
  nvram_MAME: THashedStringList;
  tmpFileSize: Int64;

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

               tmpFileSize:= GetFileSize(FileFullPath);

               CFGTotalFilesSize:= CFGTotalFilesSize+tmpFileSize; // this is a local game var...
               Inc(CFGFilesCountVar);

               CFGsTotalSize:= CFGsTotalSize+tmpFileSize; // this is a globar var for ALL listed games.
               Inc(CFGsTotalFiles);
             end;
           1: // nvram\gamename\ for MAME; .nv; .dat;
             begin
               if not haveMAMEnvram then // .nv; .dat
                  begin
                    // this is for old MAME buids that have gamename.nv and for other emulators
                    tempFilesList.Add('-1010 '+FileFullPath);
                    HaveCFGsVar:= True;

                    tmpFileSize:= GetFileSize(FileFullPath);

                    CFGTotalFilesSize:= CFGTotalFilesSize+tmpFileSize; // this is a local game var...
                    Inc(CFGFilesCountVar);

                    CFGsTotalSize:= CFGsTotalSize+tmpFileSize; // this is a global var for ALL listed games...
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

                      tmpFileSize:= GetFileSize(nvram_MAME[Loop]);

                      CFGTotalFilesSize:= CFGTotalFilesSize+tmpFileSize; // this is a local game var...
                      Inc(CFGFilesCountVar);

                      CFGsTotalSize:= CFGsTotalSize+tmpFileSize; // this is a global var for ALL listed games...
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

procedure TFormDeleteMultipleGamesFiles.SearchConsCompGameFile(var VarFileFullPath: WideString; var HaveROMsVar: Boolean; var HaveCHDsVar: Boolean);
var
  //FileFullPath: WideString;
  DOSNameStr: String;
begin
  // this function is not being used anywhere!!! (November 09, 2017)
  //case FormMain.SearchGameFile(MemGameInfo.eName, MemGameInfo.eCustomSystemID, MemGameInfo.eCustomMediaType, ButtonImageCUE.Down, True, TempGameVars.eName, StrDOSName) of
  HaveROMsVar:= False;
  HaveCHDsVar:= False;
  FormMain.SearchGameFile(FormMain.TempGameVars.eName, FormMain.TempGameVars.eCustomSystemID, FormMain.TempGameVars.eCustomMediaType, False, False, VarFileFullPath, DOSNameStr);

  if VarFileFullPath <> '' then
     begin
       // found game_filename
       //VarFileFullPath:= media_type is_unicode file_fullpath
       VarFileFullPath:= WideFormat('%.2u%d %s', [FormMain.TempGameVars.eCustomMediaType, Ord(FormMain.TempGameVars.eIsUnicode), VarFileFullPath]);

       ConsCompTotalSize:= ConsCompTotalSize+GetFileSizeW(VarFileFullPath);
       Inc(ConsCompTotalFiles);
       //if FormMain.TempGameVars.eCustomMediaType <> 2 then
       //   HaveROMsVar:= True
       //else
       //   HaveCHDsVar:= True;
       //ROMsTotalSize:= ROMsTotalSize+GetFileSizeW(VarFileFullPath);
       //Inc(ROMsTotalFiles);
     end;
end;

procedure TFormDeleteMultipleGamesFiles.AddGamesToList;
var
  Loop, Loop2, SelectionIndex: Integer;
  gItem, addItem: TEasyItem;
  GameIsMerged, FoundROMsArcade, FoundCHDsArcade, FoundCFGsArcade: Boolean;
  CustomGameFullPath: WideString;
  DOSNameStr: String;
  ROMsSize, CHDsSize, CFGsSize, CustomGameSize: Int64;

  ArcadeCHDCount, ArcadeCFGCount: Integer;

  function AddGame: Boolean;
  begin
    case FormMain.TempGameVars.eIsCustomGame of
      True : Result:= CustomGameFullPath <> '';
      False: Result:= tempFilesList.Count > 0;
    end;
    if not Result then
       Exit;
    //Result:= FormMain.IsROM_Have(FormMain.TempGameVars.eROMIdentification); // comment this line to add all selected games
    //if not Result then
    //   Result:= FormMain.IsROM_HaveMissROMs(FormMain.TempGameVars.eGameSetStatus);

    addItem:= GamesList.Items.AddCustom(TGameInfo, nil);
    TGameInfo(addItem).eROMIdentification:= FormMain.TempGameVars.eROMIdentification;
    TGameInfo(addItem).eSystemID:= FormMain.TempGameVars.eSystemID;
    TGameInfo(addItem).eCustomSystemID:= FormMain.TempGameVars.eCustomSystemID;
    TGameInfo(addItem).eMediaType:= FormMain.TempGameVars.eMediaType;
    TGameInfo(addItem).eCustomMediaType:= FormMain.TempGameVars.eCustomMediaType;
    TGameInfo(addItem).eTitle:= FormMain.TempGameVars.eTitle;
    TGameInfo(addItem).eName:= FormMain.TempGameVars.eName;
    TGameInfo(addItem).eClone:= FormMain.TempGameVars.eClone;

    if FormMain.TempGameVars.eIsCustomGame then
       begin
         if ActionMode <> -1 then
            HaveConsoleComputer:= True;
         TGameInfo(addItem).eCloneParent:= '';
       end
    else
       begin
         // this will probably be removed! (November 11, 2017)
         case FormMain.GameIsClone(FormMain.TempGameVars.eClone) of
           True : TGameInfo(addItem).eCloneParent:= FormMain.TempGameVars.eClone;
           False: TGameInfo(addItem).eCloneParent:= FormMain.TempGameVars.eName;
         end;
         if ActionMode <> -1 then
            HaveArcade:= True;
       end;

    TGameInfo(addItem).eDriverName:= FormMain.TempGameVars.eDriverName;
    TGameInfo(addItem).eDriverStatus:= FormMain.TempGameVars.eDriverStatus;
    TGameInfo(addItem).eSoftwareName:= FormMain.TempGameVars.eSoftwareName;
    if FormMain.TempGameVars.eSoftwareName = '' then
       TGameInfo(addItem).eCategory:= ''
    else
       TGameInfo(addItem).eCategory:= FormMain.TempGameVars.eCategory;
    TGameInfo(addItem).eGameStatus:= FormMain.TempGameVars.eGameSetStatus;
    TGameInfo(addItem).eMerged:= GameIsMerged;
    TGameInfo(addItem).eHaveROMsArcade:= FoundROMsArcade;
    TGameInfo(addItem).eHaveCHDsArcade:= FoundCHDsArcade;
    TGameInfo(addItem).eHaveCFGsArcade:= FoundCFGsArcade;
    TGameInfo(addItem).eROMSizeArcade:= ROMsSize;
    TGameInfo(addItem).eCHDSizeArcade:= CHDsSize;
    TGameInfo(addItem).eCFGSizeArcade:= CFGsSize;
    TGameInfo(addItem).eCustomGameSize:= CustomGameSize;

    TGameInfo(addItem).eCHDsCount:= ArcadeCHDCount;
    TGameInfo(addItem).eCFGsCount:= ArcadeCFGCount;

    TGameInfo(addItem).eIsCustomGame:= FormMain.TempGameVars.eIsCustomGame;
    TGameInfo(addItem).eIsUnicode:= FormMain.TempGameVars.eIsUnicode;
    TGameInfo(addItem).eCustomGameFileFullPath:= CustomGameFullPath;
    if not FormMain.TempGameVars.eIsCustomGame then
       begin
         TGameInfo(addItem).eGameFiles:= THashedStringList.Create;
         TGameInfo(addItem).eGameFiles.AddStrings(tempFilesList);
       end;
    addItem.Details[1]:= 20;
  end;

begin
  for Loop:= 1 to MaxArcadeSystems do
  begin
    ArcadeSystemAffected[Loop]:= False;
    if ActionMode = 0 then
       FormMain.LoadFolders_ConfigFiles(Loop, FolderCFG[Loop], FolderNVRAM[Loop]);
  end;
  ROMsTotalSize:= 0;
  CHDsTotalSize:= 0;
  CFGsTotalSize:= 0;
  ROMsTotalFiles:= 0;
  CHDsTotalFiles:= 0;
  CFGsTotalFiles:= 0;

  ConsCompTotalSize:= 0;
  ConsCompTotalFiles:= 0;

  Application.ProcessMessages;

  tempFilesList:= THashedStringList.Create; // temp list to hold files list for each game...
  GamesList.BeginUpdate;
  GamesList.Items.ReIndexDisable:= True;

  gItem:= FormMain.GamesListView.Selection.First;
  SelectionIndex:= 1;
  repeat
    FormMain.FillTempGameInfo(gItem);
    if ActionMode <> -1 then
    begin
      CustomGameFullPath:= '';

      if not uMain.TEasyGameInfo(gItem).eIsCustomGame then
         begin
           tempFilesList.Clear;
           tempFilesList.BeginUpdate;
         end;
      FoundROMsArcade:= False;
      FoundCHDsArcade:= False;
      FoundCFGsArcade:= False;
      ROMsSize:= 0;
      CHDsSize:= 0;
      CFGsSize:= 0;
      CustomGameSize:= 0;

      ArcadeCHDCount:= 0;
      ArcadeCFGCount:= 0;

      case uMain.TEasyGameInfo(gItem).eIsCustomGame of
        True:
          begin
            FormMain.SearchGameFile(uMain.TEasyGameInfo(gItem).eName, uMain.TEasyGameInfo(gItem).eCustomSystemID, uMain.TEasyGameInfo(gItem).eCustomMediaType, False, False, CustomGameFullPath, DOSNameStr);
            if CustomGameFullPath <> '' then
               begin
                 CustomGameSize:= GetFileSizeW(CustomGameFullPath);
                 ConsCompTotalSize:= ConsCompTotalSize+CustomGameSize;
                 Inc(ConsCompTotalFiles);
               end;
          end;
        False:
          begin
            SearchROMsFiles(uMain.TEasyGameInfo(gItem).eROMInfo, GameIsMerged, FoundROMsArcade, FoundCHDsArcade, ArcadeCHDCount, ROMsSize, CHDsSize);
            if ActionMode = 0 then
               SearchConfigFiles(FoundCFGsArcade, ArcadeCFGCount, CFGsSize);
          end;
      end;
      if not uMain.TEasyGameInfo(gItem).eIsCustomGame then
         tempFilesList.EndUpdate;
      //ShowMessage(tempFilesList.Text); // for debugging only; keep it disabled
    end
    else
    begin
      // this will only delete console/computer/handheld games from the main games list files. game files will NOT be processed
      if uMain.TEasyGameInfo(gItem).eIsCustomGame then
         CustomGameFullPath:= uMain.TEasyGameInfo(gItem).eName;
    end;

    if AddGame then
       begin
         // BLEH! BLEH! BLEH!
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
                     'No files found. There are no files to be processed.', 2, False, 1);
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
       if DeleteCFGsNVRAMs.Checked then // for MAME and arcade systems
          begin
            FormCopyMoveGameFiles.iTotalFiles:= FormCopyMoveGameFiles.iTotalFiles+CFGsTotalFiles;
            FormCopyMoveGameFiles.iTotalFilesSize:= FormCopyMoveGameFiles.iTotalFilesSize+CFGsTotalSize;
          end;
       FormCopyMoveGameFiles.LabelCopyTo.Visible:= False;

       if DeleteGameFileFromDisk.Checked then // for console/computer/handheld systems
          begin
            FormCopyMoveGameFiles.iTotalFiles:= FormCopyMoveGameFiles.iTotalFiles+ConsCompTotalFiles;
            FormCopyMoveGameFiles.iTotalFilesSize:= FormCopyMoveGameFiles.iTotalFilesSize+ConsCompTotalSize;
          end;
     end;
  FormCopyMoveGameFiles.iTotalFilesSizeLeft:= FormCopyMoveGameFiles.iTotalFilesSize;
  FormCopyMoveGameFiles.Caption:= FormDeleteMultipleGamesFiles.Caption;

  FormCopyMoveGameFiles.ShowModal;

  fChanged:= False;
  for Loop:= 1 to MaxArcadeSystems do
  begin
    ArcadeSystemAffected[Loop]:= FormCopyMoveGameFiles.ArcadeSystemChanged[Loop];
    if ArcadeSystemAffected[Loop] then
       fChanged:= True;
  end;
  FreeAndNil(FormCopyMoveGameFiles);

  Result:= fChanged;
end;

function TFormDeleteMultipleGamesFiles.DeleteConsoleComputerGames: Boolean;
var
  Item: TEasyItem;
  Loop: Integer;
  GamesDeleted: Boolean;
  gList: array[1..MaxConsoleComputerSystems] of THashedStringList;
  delList: array[1..MaxConsoleComputerSystems] of Boolean;
  sysFile, SingleGameEntryStr, EntryStr: String;
begin
  FormStatus.TitleStr(FormDeleteMultipleGamesFiles.Caption);
  FormStatus.MessageStr('Scanning frontend games list files and deleting game entries...');
  FormStatus.Show;
  FormStatus.StartThreadClock;
  Application.ProcessMessages;
  for Loop:=Low(delList) to High(delList) do
      delList[Loop]:= False;
  Item:= GamesList.Groups.FirstItem;
  repeat
    if not Assigned(gList[TGameInfo(Item).eCustomSystemID]) then
       begin
         sysFile:= FormMain.GetGamesFolderEL(2)+SystemsListCustom[TGameInfo(Item).eCustomSystemID, 2];
         if FileExists(sysFile) then
            begin
              gList[TGameInfo(Item).eCustomSystemID]:= THashedStringList.Create;
              gList[TGameInfo(Item).eCustomSystemID].LoadFromFile(sysFile);
              gList[TGameInfo(Item).eCustomSystemID].BeginUpdate;
            end;
       end;

    SingleGameEntryStr:= '';
    EntryStr:= '';
    if Assigned(gList[TGameInfo(Item).eCustomSystemID]) then
    begin
      SingleGameEntryStr:= Format('%.3u', [TGameInfo(Item).eCustomSystemID])+
                           IntToStr(TGameInfo(Item).eCustomMediaType)+
                           IntToStr(Ord(TGameInfo(Item).eIsUnicode));
      if TGameInfo(Item).eIsUnicode then
         SingleGameEntryStr:= SingleGameEntryStr+FormMain.MountGameInfoFieldStr('file', UTF8Encode(TGameInfo(Item).eName))
      else
         SingleGameEntryStr:= SingleGameEntryStr+FormMain.MountGameInfoFieldStr('file', TGameInfo(Item).eName);

      for Loop:=0 to gList[TGameInfo(Item).eCustomSystemID].Count-1 do
      begin
        EntryStr:= gList[TGameInfo(Item).eCustomSystemID].Strings[Loop];
        if PosEx(SingleGameEntryStr, EntryStr) <> 0 then
           begin
             GamesDeleted:= True;
             gList[TGameInfo(Item).eCustomSystemID].Delete(Loop);
             delList[TGameInfo(Item).eCustomSystemID]:= True;
             Break;
           end;
      end;
    end;

    Item:= GamesList.Groups.NextItem(Item);
  until Item = nil;

  // check if "\console_computer\games\sysname.txt" files were changed and save them to disk
  for Loop:=Low(delList) to High(delList) do
  begin
    if delList[Loop] then
       begin
         gList[Loop].EndUpdate;
         sysFile:= FormMain.GetGamesFolderEL(2)+SystemsListCustom[Loop, 2];
         gList[Loop].SaveToFile(sysFile);
         FreeAndNil(gList[Loop]);
       end;
  end;

  FormStatus.Close;
  Result:= GamesDeleted;
end;

procedure TFormDeleteMultipleGamesFiles.ResizeForm;
var
  gListSize, bPanelSize, iScrSize, MaxGameCount: Integer;
  iScreenWidth, iScreenHeight: Integer;
  ItemsColumnCount, ItemsLineCount, MaxItemsLineCount: Integer;
begin
  if not FormMain.CheckTotal(GamesList) then
     Exit;

  //iScreenWidth:= 2560;
  //iScreenHeight:= 1440;

  iScreenWidth:= Screen.Width;
  iScreenHeight:= Screen.Height;// Screen.WorkAreaRect.Bottom-Screen.WorkAreaRect.Top;

  ItemsColumnCount:= 2;
  ItemsLineCount:= -1;
  MaxItemsLineCount:= -1;

  if iScreenWidth < 1024 then
     ItemsColumnCount:= 1;

  case iScreenWidth of
    1024:
      begin
        GamesList.CellSizes.Tile.Width:= 492;
        FileTextMaxCount:= 66;
      end;
    1152:
      begin
        GamesList.CellSizes.Tile.Width:= 550;
        FileTextMaxCount:= 76;
      end;
    1920:
      begin
        if GamesList.Groups.VisibleItemCount > 38 then
           ItemsColumnCount:= 3;
      end;
    2048:
      begin
        if GamesList.Groups.VisibleItemCount > 56 then
           ItemsColumnCount:= 3;
      end;
    2560:
      begin
        if GamesList.Groups.VisibleItemCount > 54 then
           ItemsColumnCount:= 3;
      end;
    3840:
      begin
        if GamesList.Groups.VisibleItemCount > 178 then
           ItemsColumnCount:= 5
        else
        if GamesList.Groups.VisibleItemCount > 120 then
           ItemsColumnCount:= 4
        else
        if GamesList.Groups.VisibleItemCount > 70 then
           ItemsColumnCount:= 3;
      end;
  end;

  case iScreenHeight of
    480: // 640x480 / 720x480
      begin
        if ActionMode = 0 then
           MaxItemsLineCount:= 7
        else
           MaxItemsLineCount:= 6;
      end;
    600: // 800x600 / 960x600
      begin
        if ActionMode = 0 then
           MaxItemsLineCount:= 10
        else
           MaxItemsLineCount:= 9;
      end;
    720: // 1280x720
      begin
        if ActionMode = 0 then
           MaxItemsLineCount:= 11
        else
           MaxItemsLineCount:= 10;
      end;
    768, 800: // 1024x768 / 1366x768 / 1280x800 
      begin
        if ActionMode = 0 then
           MaxItemsLineCount:= 12
        else
           MaxItemsLineCount:= 11;
      end;
    864: // 1152x864
      begin
        if ActionMode = 0 then
           MaxItemsLineCount:= 14
        else
           MaxItemsLineCount:= 13;
      end;
    900, 960: // 1600x900 // 1280x960
      begin
        if ActionMode = 0 then
           MaxItemsLineCount:= 15
        else
           MaxItemsLineCount:= 14;
      end;
    1024, 1050: // 1280x1024 // 1680x1050
      begin
        if ActionMode = 0 then
           MaxItemsLineCount:= 18
        else
           MaxItemsLineCount:= 17;
      end;
    1200: // 1600x1200 // 1920x1200
      begin
        if ActionMode = 0 then
           MaxItemsLineCount:= 22
        else
           MaxItemsLineCount:= 21;
      end;
    1080: // 1920x1080
      begin
        if ActionMode = 0 then
           MaxItemsLineCount:= 19
        else
           MaxItemsLineCount:= 18;
      end;
    1440: // 1920x1440 / 2560x1440
      begin
        if ActionMode = 0 then
           MaxItemsLineCount:= 27
        else
           MaxItemsLineCount:= 26;
      end;
    1536: // 2048x1536
      begin
        if ActionMode = 0 then
           MaxItemsLineCount:= 29
        else
           MaxItemsLineCount:= 28;
      end;
    1600: // 2560x1600
      begin
        if ActionMode = 0 then
           MaxItemsLineCount:= 30
        else
           MaxItemsLineCount:= 29;
      end;
    2160: // 3840x2160
      begin
        if ActionMode = 0 then
           MaxItemsLineCount:= 42
        else
           MaxItemsLineCount:= 41;
      end;
  end;

  GamesList.Width:= (GamesList.CellSizes.Tile.Width*ItemsColumnCount)+GetSystemMetrics(SM_CXVSCROLL);
  FormDeleteMultipleGamesFiles.ClientWidth:= GamesList.Width-GetSystemMetrics(SM_CXVSCROLL);
  GamesList.Width:= GamesList.Width+GamesList.PaintInfoItem.Border; // to fix a bug when scrollbar is enabled

  ItemsLineCount:= GamesList.Groups.VisibleItemCount div ItemsColumnCount;
  if ItemsLineCount = 0 then
     ItemsLineCount:= 1
  else
     begin
       if GamesList.Groups.VisibleItemCount mod ItemsColumnCount <> 0 then
          Inc(ItemsLineCount);
     end;

  if ItemsLineCount > MaxItemsLineCount then
     ItemsLineCount:= MaxItemsLineCount;

  GamesList.Height:= (ItemsLineCount*GamesList.CellSizes.Tile.Height)+GamesList.PaintInfoItem.Border;

  if PanelDestinationFolder.Visible then
     bPanelSize:= PanelOptions.Height+PanelDestinationFolder.Height
  else
     bPanelSize:= PanelOptions.Height;

  FormDeleteMultipleGamesFiles.ClientHeight:= GamesList.Height+bPanelSize;

  if GamesList.Scrollbars.VertBarVisible then
     begin
       GamesList.Width:= GamesList.Width-2; // this is to remove a redundant 2 extra pixels next to the vertical scroll bar... WEIRD BUG!!! :_((
       FormDeleteMultipleGamesFiles.ClientWidth:= GamesList.Width;//FormDeleteMultipleGamesFiles.ClientWidth+GetSystemMetrics(SM_CXVSCROLL)+2;
       //GamesList.HotTrack.Enabled:= False; // disable to fix hot track painting bug :_((
     end;

  if FormDeleteMultipleGamesFiles.ClientWidth <> 1230 then
     begin
       if ItemsColumnCount = 1 then
          begin
            ButtonDeleteFiles.Caption:= ActionString;
            ButtonHelp.Caption:= '?';
            ButtonHelp.Width:= 23;
            ButtonNo.Width:= 53;
            ButtonDeleteFiles.Width:= 53;
          end;
       ButtonNo.Left:= (FormdeleteMultipleGamesFiles.ClientWidth-ButtonNo.Width)-4;
       ButtonDeleteFiles.Left:= ButtonNo.Left-ButtonDeleteFiles.Width-4;
       ButtonHelp.Left:= ButtonDeleteFiles.Left-ButtonHelp.Width-4;
     end;
end;

procedure TFormDeleteMultipleGamesFiles.FormShow(Sender: TObject);
begin
  FormMain.ELV_ResetNormalColors(GamesList);
  FormMain.CheckSevenZip(-1);

  if DeleteGameConsoleComputerIcon.Enabled then
     FormMain.IL_MainMenuOptions.GetIcon(15, DeleteGameConsoleComputerIcon.Picture.Icon);

  case ActionMode of
    0, -1: ActionString:= 'Delete';
    1: ActionString:= 'Copy';
    2: ActionString:= 'Move';
  end;

  if (ActionMode = 0) or (ActionMode = -1) then
     begin
       PanelDestinationFolder.Visible:= False;
       if ActionMode = -1 then
          begin
            ButtonDeleteFiles.Caption:= ActionString+' Games';
            ButtonDeleteFiles.Hint:= 'Click here to delete all games on the list';
            PopupViewSelectedFilesList.Visible:= False;
            PopupViewFilesListAllGames.Visible:= False;
            ButtonHelp.Visible:= False;
          end;
     end
  else
     begin
       ButtonDeleteFiles.Caption:= ActionString+' Files';
       FileTypesGroupBox.Caption:= 'Check Arcade File Types to '+ActionString;

       DeleteCFGsNVRAMs.Font.Color:= clGray;
       DeleteCFGsNVRAMs.Font.Style:= [fsBold, fsStrikeout];
       //DeleteCFGsNVRAMs.Checked:= False;
       DeleteCFGsNVRAMs.Enabled:= False;
     end;
  //StatusIconIndex:= IL_DeleteGameIcons.Count-3;

  FileTextMaxCount:= 87; // this is for TGameInfo.GetCaptions
  HaveArcade:= False;
  HaveConsoleComputer:= False;
  AddGamesToList;

  if not HaveArcade then
     begin
       FileTypesGroupBox.Visible:= False;
       DeleteGameFromGamesList.Left:= 8;
       DeleteGameFileFromDisk.Left:= 8;
       DeleteGameConsoleComputerIcon.Left:= DeleteGameFileFromDisk.Left+16;
     end;

  if not HaveConsoleComputer then
     begin
       DeleteGameFromGamesList.Visible:= False;
       DeleteGameFileFromDisk.Visible:= False;
       DeleteGameConsoleComputerIcon.Picture.Icon:= nil;
       DeleteGameConsoleComputerIcon.Visible:= False;
     end;

  if FormStatus.Visible then
     FormStatus.Close;

  ResizeForm;

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
  FormMain.AddMsgText(' hotkey (keyboard).'+#13#10+'To quickly find a parent game (MAME and arcade only), click ');
  FormMain.AddMsgText('Select Parent Game', $00a65300, [fsBold]);
  FormMain.AddMsgText(' menu item (popup menu).'+#13#10+#13#10+
                      '    You can choose what files will be processed in the ');
  FormMain.AddMsgText('Check Arcade File Types To '+ActionString, $00a65300, [fsBold]);
  FormMain.AddMsgText(' group box. These settings are for ');
  FormMain.AddMsgText('MAME and arcade', clBlack, [fsBold, fsItalic]);
  FormMain.AddMsgText(' systems only!'+#13#10+
                      '    To delete game files of ');
  FormMain.AddMsgText('console/computer/handheld', clBlack, [fsBold, fsItalic]);
  FormMain.AddMsgText(' systems, check ');
  FormMain.AddMsgText('Delete Game File From Disk', $00a65300, [fsBold]);
  FormMain.AddMsgText(' option (not compatible with MAME and arcade games).'+#13#10+#13#10+
                      '    If you want to delete console/computer/handheld games from '+
                      'main games list (why wouldn''t you ?), check ');
  FormMain.AddMsgText('Delete Game From Games List', $00a65300, [fsBold]);
  FormMain.AddMsgText('. This option is not compatible with MAME and arcade games.'+
                      #13#10+#13#10+'    You can also view a list of files to be ');
  FormMain.AddMsgText(LowerCase(ActionString), $00a65300, [fsBold]);
  FormMain.AddMsgText(' for each game. Select one or more games and call the popup menu. Click ');
  FormMain.AddMsgText('View Selected Files List', $00a65300, [fsBold]);
  FormMain.AddMsgText(' menu item to view only selected games or ');
  FormMain.AddMsgText('View Files List (All Games)', $00a65300, [fsBold]);
  FormMain.AddMsgText(' to view files list of all games in the list.'+#13#10+
                     ('Console/computer/handheld systems will show the ghost icon from EmuCon frontend.')+
                     #13#10+#13#10+'    To ');
  FormMain.AddMsgText(LowerCase(ActionString), $00a65300, [fsBold]);
  FormMain.AddMsgText(' files, click ');
  FormMain.AddMsgText(ActionString+' Files', $00a65300, [fsBold]);
  FormMain.AddMsgText(' button. You can follow the progress in a detailed dialog box. If there are errors, they will be listed in the log '+
                      'panel.'+#13#10+#13#10);
  FormMain.AddMsgText('    Each MAME and arcade game can have three (3) file type icons at the right side of the item''s cell:'+#13#10);
  FormMain.AddMsgText('Zip', $00a65300, [fsBold]);
  FormMain.AddMsgText(' icon for the gamename.zip, if found'+#13#10);
  FormMain.AddMsgText('CHD', $00a65300, [fsBold]);
  FormMain.AddMsgText(' icon for the game CHD file(s), if found'+#13#10);
  FormMain.AddMsgText('Config', $00a65300, [fsBold]);
  FormMain.AddMsgText(' icon for the game settings files, if found'+#13#10+#13#10+
                      'Console/computer/handheld games do not need them because they have a single game file.'+#13#10+#13#10);

  case ActionMode of
    0: FormMain.AddMsgText('    When deleting files, if there are changes in arcade games, you will be prompted to update the main games list. '+
                           'Be aware that recycle bin is not supported. Files cannot be recovered afterwards.'+#13#10+#13#10);
    1, 2:
      begin
        FormMain.AddMsgText('    When copying/moving files, MAME and arcade CHD files are sent to a ');
        FormMain.AddMsgText('\chd_files\', $00a65300, [fsBold]);
        FormMain.AddMsgText(' sub-folder and MAME software list game files are sent to a ');
        FormMain.AddMsgText('\softlistname\', $00a65300, [fsBold]);
        FormMain.AddMsgText(' sub-folder.'+#13#10+#13#10+
                            '    Console/computer/handheld games files are sent to a ');
        FormMain.AddMsgText('\system_name\media_type_name\', $00a65300, [fsBold]);
        FormMain.AddMsgText(' sub-folder. You can find more details in ');
        FormMain.AddMsgText(FormMain.GetFolderFull(37)+'systemsfolders.txt', $00a65300, [fsBold]);
        FormMain.AddMsgText(' file.'+#13#10);
      end;
  end;

  FormMain.AddMsgText('    Incremental search is supported (quick search), just type a game title.');

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

  case Position of
    0:
      begin
        ACanvas.Font.Name:= 'Verdana';
        ACanvas.Font.Style:= [fsBold];
      end;
    1:
     begin
       ACanvas.Font.Name:= 'Consolas';
       ACanvas.Font.Size:= 8; //9;
       ACanvas.Font.Color:= clBlack;
     end;
  end;
  //else
  //if (Position > 0) and (Position <> 4) then
  //   begin
  //     ACanvas.Font.Name:= 'Tahoma';
  //     ACanvas.Font.Size:= 8;
  //   end;
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
    3: Result:= FormMain.iCompare(TGameInfo(gItem1).eCategory, TGameInfo(gItem2).eCategory);
    4: Result:= FormMain.iCompare(TGameInfo(gItem1).eDriverName, TGameInfo(gItem2).eDriverName);
    5, 6, 7:
     begin
       case Column.Index of
         5:
           begin
             tmpItem1:= TGameInfo(gItem1).eHaveROMsArcade;
             tmpItem2:= TGameInfo(gItem2).eHaveROMsArcade;
           end;
         6:
           begin
             tmpItem1:= TGameInfo(gItem1).eHaveCHDsArcade;
             tmpItem2:= TGameInfo(gItem2).eHaveCHDsArcade;
           end;
         7:
           begin
             tmpItem1:= TGameInfo(gItem1).eHaveCFGsArcade;
             tmpItem2:= TGameInfo(gItem2).eHaveCFGsArcade;
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
       if (not DeleteROMs.Checked) and (not DeleteCHDs.Checked) and (not DeleteCFGsNVRAMs.Checked) and (not DeleteGameFileFromDisk.Checked) then
          Loop:= 0;
     end
  else
  if ActionMode <> -1 then
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

  if ActionMode > 0 then
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
  if ActionMode > 0 then
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
        if DeleteGameFileFromDisk.Checked then
           iFreeRequired:= iFreeRequired+ConsCompTotalSize;


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
  if ActionMode <> -1 then
  begin
    if FileTypesGroupBox.Visible then
    begin
      if DeleteROMs.Checked then
         FileTypeStr:= 'Game ROMs [.zip / .7z File]'+#13#10;
      if DeleteCHDs.Checked then
         FileTypeStr:= FileTypeStr+'Compressed Hunks of Data [.chd Files]'+#13#10;
      if (ActionMode = 0) and DeleteCFGsNVRAMs.Checked then
         FileTypeStr:= FileTypeStr+'Game Config/NVRAM Files [CFG, NVRAM, EEPROM, SRAM, FLASH]'+#13#10;
    end;

    if DeleteGameFromGamesList.Visible and DeleteGameFromGamesList.Checked then
       FileTypeStr:= FileTypeStr+'Console/Computer/Handheld Games From Games List'+#13#10;

    if DeleteGameFileFromDisk.Visible and DeleteGameFileFromDisk.Checked then
       FileTypeStr:= FileTypeStr+'Console/Computer/Handheld Game Files'+#13#10;
  end
  else
     FileTypeStr:= ' console/computer/handheld games.';


  CallMessageBox;
  FormMain.AddMsgText('    You are about to ');
  FormMain.AddMsgText(LowerCase(ActionString), $00a65300, [fsBold]);
  if ActionMode <> -1 then
     FormMain.AddMsgText(':'+#13#10+#13#10+FileTypeStr+#13#10)
  else
     FormMain.AddMsgText(FileTypeStr+#13#10);
  FormMain.AddMsgText('Click ');
  FormMain.AddMsgText('No', $00a65300, [fsBold]);
  FormMain.AddMsgText(' button if you want to go back and review the list or click ');
  FormMain.AddMsgText('Yes', $00a65300, [fsBold]);
  FormMain.AddMsgText(' button to confirm.'+#13#10+#13#10);
  if ActionMode <> -1 then
     FormMain.AddMsgText(ActionString+' files. ')
  else
     FormMain.AddMsgText(ActionString+' games. ');
  FormMain.AddMsgText('Are you sure ?', clMaroon { $00a65300 }, [fsBold, fsItalic]);

  if GenerateMessage(ActionString, FormDeleteMultipleGamesFiles.Caption, '', 1, True, 2) = mrNo then
     Exit;

  if ActionMode <> -1 then
     begin
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
                       if ArcadeSystemAffected[Loop] then
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
       if (ActionMode = 0) and HaveConsoleComputer and (DeleteGameFromGamesList.Checked) then
       begin
         if DeleteConsoleComputerGames then
            begin
              GenerateMessage(ActionString, 'Games were deleted from the list (game entries, not game files!).',
                              '    The main games list must be reloaded as the frontend cannot delete items directly from the list.'
                              +#13#10+'Please restart the frontend when you''re done.');
            end;
       end;
     end
  else
     begin
       if DeleteConsoleComputerGames then
          begin
            GenerateMessage(ActionString, 'Games were deleted from the list (game entries, not game files!).',
                              '    The main games list must be reloaded as the frontend cannot delete items directly from the list.'
                              +#13#10+'Please restart the frontend when you''re done.');
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
    if not TGameInfo(Item).eIsCustomGame then
    begin
      if TGameInfo(Item).eName = TGameInfo(selItem).eClone then
         begin
           if (TGameInfo(Item).eSystemID = TGameInfo(selItem).eSystemID) and
              (TGameInfo(Item).eSoftwareName = TGameInfo(selItem).eSoftwareName) then
              ParentFound:= True;
         end;
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
var
  sItem: TEasyItem;
  SelectionIndex: Integer;

  function SubtractTotalSize(GameInfoSource: Int64; var VarInfoDest: Int64): Boolean;
  begin
    Result:= True;
    VarInfoDest:= VarInfoDest-GameInfoSource;
  end;

  function SubtractTotalFiles(GameInfoSource: Integer; var VarInfoDest: Integer): Boolean;
  begin
    Result:= True;
    VarInfoDest:= VarInfoDest-GameInfoSource;
  end;

begin
  if FormMain.CheckSelected(GamesList) then
     begin
       sItem:= GamesList.Selection.First;
       SelectionIndex:= 1;
       repeat
         SubtractTotalSize(TGameInfo(sItem).eROMSizeArcade, ROMsTotalSize);
         SubtractTotalSize(TGameInfo(sItem).eCHDSizeArcade, CHDsTotalSize);
         SubtractTotalSize(TGameInfo(sItem).eCFGSizeArcade, CFGsTotalSize);
         SubtractTotalSize(TGameInfo(sItem).eCustomGameSize, ConsCompTotalSize);

         if TGameInfo(sItem).eHaveROMsArcade then
            Dec(ROMsTotalFiles); // remove ONE gamename.zip file from the total count (for ALL listed games)

         SubtractTotalFiles(TGameInfo(sItem).eCHDsCount, CHDsTotalFiles);
         SubtractTotalFiles(TGameInfo(sItem).eCFGsCount, CFGsTotalFiles);

         if TGameInfo(sItem).eIsCustomGame then
            Dec(ConsCompTotalFiles);

         //ROMsTotalSize, CHDsTotalSize, CFGsTotalSize: Int64;
         //ROMsTotalFiles, CHDsTotalFiles, CFGsTotalFiles: Integer;
         //ConsCompTotalSize: Int64;
         //ConsCompTotalFiles: Integer;

         sItem:= FormMain.ELV_GetNextSelected(GamesList, sItem, SelectionIndex);
       until sItem = nil;
       GamesList.Selection.DeleteSelected(True);
       UpdateTotalFilesLabel;
     end;
  GamesList.SetFocus;
  if not FormMain.CheckTotal(GamesList) then
     begin
       GenerateMessage('Info', PopupRemoveSelectedGames.Caption, 'All games were removed from the list. Aborting...');
       ButtonNo.Click;
     end;
end;

procedure TFormDeleteMultipleGamesFiles.GamesListItemImageDraw(
  Sender: TCustomEasyListview; Item: TEasyItem; Column: TEasyColumn;
  ACanvas: TCanvas; const RectArray: TEasyRectArrayObject;
  AlphaBlender: TEasyAlphaBlender);
var
  iLeft, iTop: Integer;
begin
  // this is for tiles view mode
  iLeft:= RectArray.IconRect.Left+GamesList.PaintInfoItem.ImageIndent+1;
  iTop:=  RectArray.IconRect.Top+1;

  if TGameInfo(Item).eIsCustomGame then
     begin
       GamesList.ImagesExLarge.Draw(ACanvas, iLeft, iTop, MaxGameID+TGameInfo(Item).eCustomSystemID);

       iLeft:= iLeft+GamesList.ImagesExLarge.Width+4;
       iTop:= iTop+((GamesList.ImagesExLarge.Height-IL_DeleteGameIcons.Height) div 2);
       //iTop:= (iTop+GamesList.ImagesExLarge.Height)-IL_DeleteGameIcons.Height; //FormMain.IL_StandardIconsSmall.Height;

       IL_DeleteGameIcons.Draw(ACanvas, iLeft, iTop, 17+TGameInfo(Item).eCustomMediaType); // show EmuCon icon

       //IL_DeleteGameIcons.Draw(ACanvas, iLeft, iTop, 0); // show EmuCon icon
       //FormMain.IL_MenuPopup.Draw(ACanvas, iLeft, iTop, 23); // load EmuCon icon

       //FormMain.IL_StandardIconsStandard.Draw(ACanvas, Group.BoundsRectTopMargin.Left+26, Group.BoundsRectTopMargin.Top+8,
       //                                       MaxGameID+TViewGameInfoGroup(Group).eCustomSystemID);
     end
  else
     begin
       GamesList.ImagesExLarge.Draw(ACanvas, iLeft, iTop, FormMain.GetMAMEImageIndex(TGameInfo(Item).eROMIdentification, TGameInfo(Item).eSoftwareName));

       iLeft:= iLeft+GamesList.ImagesExLarge.Width+4;
       iTop:= iTop+ ((GamesList.ImagesExLarge.Height-IL_DeleteGameIcons.Height) div 2);
       //iTop:= (iTop+GamesList.ImagesExLarge.Height)-FormMain.IL_StandardIconsSmall.Height;

       IL_DeleteGameIcons.Draw(ACanvas, iLeft, iTop, TGameInfo(Item).eSystemID);
       //FormMain.IL_StandardIconsSmall.Draw(ACanvas, iLeft, iTop, MaxGameID+MaxConsoleComputerSystems+TGameInfo(Item).eSystemID);

       iLeft:= RectArray.LabelRect.Right-(IL_DeleteGameIcons.Width*3);

       iTop:= (RectArray.IconRect.Top+1+GamesList.ImagesExLarge.Height)-IL_DeleteGameIcons.Height;// FormMain.IL_StandardIconsSmall.Height;
       if TGameInfo(Item).eHaveCFGsArcade then
          begin
            IL_DeleteGameIcons.Draw(ACanvas, iLeft, iTop, FormDeleteMultipleGamesFiles.DeleteCFGsNVRAMs.Tag+1); //MaxGameID+MaxArcadeSystems+3
            iLeft:= (iLeft-IL_DeleteGameIcons.Width)-4;
          end;

       if TGameInfo(Item).eHaveCHDsArcade then
          begin
            IL_DeleteGameIcons.Draw(ACanvas, iLeft, iTop, FormDeleteMultipleGamesFiles.DeleteCHDs.Tag+1);
            iLeft:= (iLeft-IL_DeleteGameIcons.Width)-4;
          end;

       if TGameInfo(Item).eHaveROMsArcade then
          begin
            IL_DeleteGameIcons.Draw(ACanvas, iLeft, iTop, FormDeleteMultipleGamesFiles.DeleteROMs.Tag+1);
            //iLeft:= (iLeft-IL_DeleteGameIcons.Width)-4; // no need as this is the last icon to be added (back to front)...
          end;

       //FormMain.IL_StandardIconsStandard.Draw(ACanvas, Group.BoundsRectTopMargin.Left+26, Group.BoundsRectTopMargin.Top+8,
       //                                    FormMain.GetMAMEImageIndex(TViewGameInfoGroup(Group).eROMIdentification, TViewGameInfoGroup(Group).eSoftwareName));
     end;
  //Item.PaintInfo.CaptionIndent:= FormMain.IL_StandardIconsExtraLarge.Width;
  //RectArray.TextRect.Left:= RectArray.TextRect.Left+FormMain.IL_StandardIconsExtraLarge.Width;
end;

procedure TFormDeleteMultipleGamesFiles.GamesListItemImageDrawIsCustom(
  Sender: TCustomEasyListview; Item: TEasyItem; Column: TEasyColumn;
  var IsCustom: Boolean);
begin
  IsCustom:= True; // this is for tiles view mode
end;

procedure TFormDeleteMultipleGamesFiles.GamesListItemImageGetSize(
  Sender: TCustomEasyListview; Item: TEasyItem; Column: TEasyColumn;
  var ImageWidth, ImageHeight: Integer);
begin
  // this is for tiles view mode
  ImageWidth:= GamesList.ImagesExLarge.Width+16; // +16 is 16x16 icon size, plus 2 pixels border
  ImageHeight:= GamesList.ImagesExLarge.Height;
end;

end.
