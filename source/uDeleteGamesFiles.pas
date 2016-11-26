unit uDeleteGamesFiles;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, MPCommonObjects, EasyListview, ExtCtrls,
  ImgList, IniFiles, FileCtrl, PanelEx, ShadowLabel, uCommon,
  AdvOfficeButtons, AdvGroupBox, CommCtrl, Buttons;

type
  TGameInfo = class(TEasyItemStored)
  private
    // MAME based (0 -> CFG; -> 1 -> NVRAM, EEPROM, FLASH and maybe others (MAME gamename config folder);
    // ZiNc (0 -> CFG);
    // SEGA Model 2 (0-> INPUT; 1 -> NVDATA);
    // Demul (2 -> EEPROM; 3 -> SRAM; 4 -> FLASH);
    // Supermodel: SEGA Model 3 ( 1 -> NVRAM);
    fSystemID: ShortInt;
    fROMIdentification: Integer;
    fMediaType: ShortInt; // 0 -> ROM; >= 1 -> CHD (for ROMs and CHD only)... -1 -> game config file
    fFileType: ShortInt; // cfg; nvram; eeprom (game config files)
                         // 12, 13, 14 -> HDD/general CHD;  15, 16, 17 -> CD;  18, 19, 20 -> Compact Flash Card
    fSoftwareName: String;
    fGameStatus: ShortInt;

    fFileName: String;
    fFileSize: Int64;
    fFileSizeText: String;
    fDateTimeText: String;
    fMerged: Boolean;
    fParentFile: Boolean;
    fHeaderVerCHD: Byte;
  protected
    function GetCaptions(Column: Integer): WideString; override;
    function GetImageIndexes(Column: Integer): TCommonImageIndexInteger; override;
  public
    property eSystemID: ShortInt read fSystemID write fSystemID;
    property eROMIdentification: Integer read fROMIdentification write fROMIdentification;
    property eMediaType: ShortInt read fMediaType write fMediaType; // 0 -> ROMs; 1 -> CHD; -1 -> config files
    property eFileType: ShortInt read fFileType write fFileType; // what file ID the media_type is (for config files and CHDs)
    property eSoftwareName: String read fSoftwareName write fSoftwareName;
    property eGameStatus: ShortInt read fGameStatus write fGameStatus; // 0 - have; 1 - miss; 2 - missing ROMs/CHDs
    property eFileName: String read fFileName write fFileName;
    property eFileSize: Int64 read fFileSize write fFileSize;
    property eFileSizeText: String read fFileSizeText write fFileSizeText;
    property eDateTimeText: String read fDateTimeText write fDateTimeText;
    property eMerged: Boolean read fMerged write fMerged;
    property eParentFile: Boolean read fParentFile write fParentFile;
    property eHeaderVerCHD: Byte read fHeaderVerCHD write fHeaderVerCHD;
  end;

type
  TFormDeleteGamesFiles = class(TForm)
    IL_MediaType: TImageList;
    TopBar: TPanelEx;
    FilesListView: TEasyListview;
    PanelBottom: TPanelEx;
    ButtonNo: TBitBtn;
    ButtonYes: TBitBtn;
    FileTypesGroupBox: TAdvGroupBox;
    DeleteCFGsNVRAMs: TAdvOfficeCheckBox;
    DeleteROMs: TAdvOfficeCheckBox;
    DeleteCHDs: TAdvOfficeCheckBox;
    SystemIcon: TImage;
    GameIcon: TImage;
    LabelGameTitle: TShadowLabel;
    LabelGameStatus: TShadowLabel;
    LabelTotalFiles: TShadowLabel;
    LabelTotalFilesChecked: TShadowLabel;
    PanelDestinationFolder: TPanelEx;
    LabelCopyMoveDestination: TShadowLabel;
    DestinationFolder: TEdit;
    CopyMoveOverwriteFiles: TAdvOfficeCheckBox;
    ButtonSelectROMsFolder: TBitBtn;
    LabelGameDetails: TLabel;
    LabelEmulatorVersion: TLabel;
    LabelSoftwareListTitle: TShadowLabel;
    LabelSoftwareList: TLabel;
    procedure FormShow(Sender: TObject);
    procedure FilesListViewItemPaintText(Sender: TCustomEasyListview;
      Item: TEasyItem; Position: Integer; ACanvas: TCanvas);
    procedure FilesListViewKeyAction(Sender: TCustomEasyListview;
      var CharCode: Word; var Shift: TShiftState; var DoDefault: Boolean);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure ButtonYesClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FilesListViewItemCheckChange(Sender: TCustomEasyListview;
      Item: TEasyItem);
    procedure DeleteCHDsClick(Sender: TObject);
    procedure ButtonSelectROMsFolderClick(Sender: TObject);
  private
    { Private declarations }
    ZiNcFilePath, ActionString: String; //, DestinationPath: String;
    ROMsTotalSize, CHDsTotalSize, CFGsTotalSize: Int64;
    ROMsTotalFiles, CHDsTotalFiles, CFGsTotalFiles: Integer;
    procedure SetCheckBoxColor(Enabled: Boolean; CheckBoxHolder: TAdvOfficeCheckBox);
    procedure LoadMediaIcons;
    procedure GetFilesCountSize;
    procedure AddFiles; // ROMs and CHDs
    procedure AddConfigFiles; // Config files
    function  ProcessGamesFiles: Boolean;
    procedure UpdateTotalCheckedLabel;
    //function  DeleteFiles: Boolean; // ROMs, CHDs and config files
  public
    { Public declarations }
    FolderCFG, FolderNVRAM: String;
    GameChanged: Boolean;
    ActionMode: Integer; // 0 -> delete games files; 1 -> copy games files; 2 -> move games files
  end;

var
  FormDeleteGamesFiles: TFormDeleteGamesFiles;

implementation

uses uMain, uCopyMoveGameFiles;

{$R *.dfm}

function TGameInfo.GetCaptions(Column: Integer): WideString;
var
  extraStr: String;
  FillBlank: String;
  ExtraCount, VertBar: Integer;
begin
  case Column of
    0:
      begin
        Result:= FormMain.GetFileTypeText(eSystemID, eMediaType, eFileType); // need to make sure this is OK...
      end;
    1:
      begin
        if eMediaType = 0 then
           begin
             if eMerged then
                extraStr:= 'Merged Set';
           end
        else
           begin
             extraStr:= '';
             if (not FormMain.IsROM_Bios(eROMIdentification)) and (not FormMain.IsROM_Device(eROMIdentification)) then
             begin
               case eFileType of
                 13, 16, 19: extraStr:= 'Device';
                 14, 17, 20: extraStr:= 'Bios';
               end;
             end;

             if eParentFile then
                begin
                  if extraStr = '' then
                     extraStr:= 'Parent'
                  else
                     extraStr:= 'Parent '+extraStr;
                end;
           end;

        case FormDeleteGamesFiles.FilesListView.Scrollbars.VertBarVisible of
          True : VertBar:= 2;
          False: VertBar:= 0;
        end;

        ExtraCount:= 71-VertBar;
        if extraStr <> '' then
           begin
             extraStr:= '['+extraStr+'] ';
             ExtraCount:= ExtraCount-Length(extraStr);
           end;
        Result:= Format(extraStr+'%-'+IntToStr(ExtraCount)+'s', [ShortDirString(eFileName, ExtraCount)]);
      end;
    2:
      begin
        if FormDeleteGamesFiles.FilesListView.Scrollbars.VertBarVisible then
           FillBlank:= '104'
        else
           FillBlank:= '107';
        Result:= 'Size: '+eFileSizeText+'  Date Modified: '+eDateTimeText;
        if eMediaType > 0 then
           begin
             if eHeaderVerCHD > 0 then
                Result:= Result+'  [Header v'+IntToStr(eHeaderVerCHD)+']'
             else
                Result:= Result+ '  [Invalid Header]';
           end;
        Result:= Format('%-'+FillBlank+'s', [Result]);
      end;
  end;
end;

function TGameInfo.GetImageIndexes(Column: Integer): TCommonImageIndexInteger;
begin
  if Column = 0 then
     begin
       if eMediaType <> -1 then
          begin
            if eFileType = 0 then
               Result:= eMediaType // ROM
            else
               begin
                 case eFileType of
                   0: Result:= eMediaType; // ROM (.zip file)
                   15, 16, 17: Result:= 2;
                   18, 19, 20: Result:= 3;
                 else
                    Result:= 1;
                 end;
               end;
          end
       else
          Result:= eFileType+4; // game config files
     end
  else
     Result:= -1;
end;

procedure TFormDeleteGamesFiles.SetCheckBoxColor(Enabled: Boolean; CheckBoxHolder: TAdvOfficeCheckBox);
var
  Item: TEasyItem;
  sFileType: Integer;
begin
  if Enabled then
     CheckBoxHolder.Font.Color:= $00a65300 //clNavy
  else
     CheckBoxHolder.Font.Color:= clGray;//$00e6e6e6;

  if not FormMain.CheckTotal(FilesListView) then
     Exit;
  Item:= FilesListView.Groups.FirstItem;
  if Item = nil then
     Exit;
  sFileType:= CheckBoxHolder.HelpContext;
  if sFileType = 2 then
     sFileType:= -1; // correct config file type... to support an older EL games list!!!

  FilesListView.BeginUpdate;
  repeat
    if TGameInfo(Item).eMediaType = sFileType then
       Item.Checked:= Enabled;
    Item:= FilesListView.Groups.NextItem(Item);
  until Item = nil;
  FilesListView.EndUpdate;
end;

procedure TFormDeleteGamesFiles.LoadMediaIcons;
var
  Loop: ShortInt;
  Folder: String;
begin
  Folder:= FormMain.GetFolderFull(32);
  for Loop:=Low(aMediaType)+1 to High(aMediaType) do
      FormMain.AddDefaultIcons(aMediaType[Loop, 1]+'.ico', Folder, IL_MediaType);

  FormMain.AddDefaultIcons('chd_cd.ico', Folder, IL_MediaType);    // 2
  FormMain.AddDefaultIcons('chd_cfcard.ico', Folder, IL_MediaType);// 3

  FormMain.AddDefaultIcons('settings.ico', Folder, IL_MediaType);  // 4
  FormMain.AddDefaultIcons('bios_chip.ico', Folder, IL_MediaType); // 5
  FormMain.AddDefaultIcons('bios_chip.ico', Folder, IL_MediaType); // 6
  FormMain.AddDefaultIcons('bios_chip.ico', Folder, IL_MediaType); // 7
  FormMain.AddDefaultIcons('bios_chip.ico', Folder, IL_MediaType); // 8
end;

procedure TFormDeleteGamesFiles.AddFiles;
var
  addItem: TEasyItem;
  FileFullPath: String;
  GameIsMerged, IsZiNcSystem: Boolean;
  Loop: Integer;
  FileID: ShortInt;
  chdParentName, DiskFile, ChecksumCHD, romName, romCRC32, romSHA1: String;
  HeaderVerCHD: Byte;
begin
  IsZiNcSystem:= FormMain.MemGameInfo.eSystemID = idZiNc;
  ZiNcFilePath:= '';

  GameIsMerged:= False;
  FileFullPath:= FormMain.SearchZIPFolder(FormMain.MemGameInfo.eName, FormMain.MemGameInfo.eSystemID, FormMain.MemGameInfo.eSoftwareName);
  if (FileFullPath = '') and FormMain.GameIsClone(FormMain.MemGameInfo.eClone) then
     begin
       // check for merged game MAME and HBMAME
       if not FormMain.IsROM_HaveMissROMs(FormMain.MemGameInfo.eGameSetStatus) then
          begin
            GameIsMerged:= FormMain.MemGameInfo.eIsMerged;
            if GameIsMerged then
               FileFullPath:= FormMain.SearchZIPFolder(FormMain.MemGameInfo.eClone, FormMain.MemGameInfo.eSystemID, FormMain.MemGameInfo.eSoftwareName);
          end;
     end;
  if FileFullPath <> '' then
     begin
       // add .zip file
       addItem:= FilesListView.Items.AddCustom(TGameInfo, nil);
       TGameInfo(addItem).eSystemID:= FormMain.MemGameInfo.eSystemID;
       TGameInfo(addItem).eROMIdentification:= FormMain.MemGameInfo.eROMIdentification;
       TGameInfo(addItem).eMediaType:= 0;
       TGameInfo(addItem).eFileType:= 0;
       TGameInfo(addItem).eSoftwareName:= FormMain.MemGameInfo.eSoftwareName;
       TGameInfo(addItem).eMerged:= GameIsMerged;
       TGameInfo(addItem).eFileName:= FileFullPath;
       TGameInfo(addItem).eFileSize:= GetFileSize(FileFullPath);
       TGameInfo(addItem).eFileSizeText:= FormMain.GetSizeType(TGameInfo(addItem).eFileSize, False);
       TGameInfo(addItem).eDateTimeText:= FormMain.GetDateTimeStr(FileAge(FileFullPath));
       TGameInfo(addItem).eParentFile:= GameIsMerged;
       TGameInfo(addItem).eHeaderVerCHD:= 0;
       if IsZiNcSystem then
          ZiNcFilePath:= ExtractFilePath(FileFullPath);
       addItem.Details[1]:= 1;
       addItem.Details[2]:= 2;
       addItem.Checked:=  Boolean(DeleteROMs.Checked);
       if not addItem.Checked then
          addItem.State:= addItem.State+[esosGhosted];
     end;
  if (FormMain.MemGameInfo.eMediaType > 0) and (FormMain.MemGameInfo.eCHDsCount > 0) then
     begin
       // check for CHD files
       if uMain.TEasyGameInfo(FormMain.SelectedEasyItem).eROMInfo <> nil then
       begin
         for Loop:=0 to uMain.TEasyGameInfo(FormMain.SelectedEasyItem).eROMInfo.Count-1 do
         begin
           DiskFile:= uMain.TEasyGameInfo(FormMain.SelectedEasyItem).eROMInfo[Loop];
           if DiskFile[3] = '1' then // is CHD file ? (3rd position is 0 -> ROM/Cart/Floppy/Cass; 1 -> CHD... "<rom" and "<disk" entries from -listxml output
           begin
             FileID:= StrToInt(DiskFile[1]+DiskFile[2]);
             FormMain.GetROMDetailsInfo(DiskFile, FormMain.GameIsClone(uMain.TEasyGameInfo(FormMain.SelectedEasyItem).eName), romName, romCRC32, romSHA1, chdParentName);
             // [konam80a]
             // 1510<name>826aaa01.chd/><sha1>be5f8b31fd18ba631fe98c2132c56abf20193419/><parentname>826eaa01.chd/>

             //if (romName[1] = '3') and (romCRC <> '') then
             //if (StrToInt(DiskFile[1]) > 2) and (romSHA1 <> '') then
             if romSHA1 <> '' then
                begin
                  DiskFile:= FormMain.SearchCHDSimpleScan(FormMain.MemGameInfo.eSystemID, romName, chdParentName, FormMain.MemGameInfo.eName, FormMain.MemGameInfo.eClone,
                                                          FormMain.MemGameInfo.eBiosName, FormMain.MemGameInfo.eSoftwareName);
                  if DiskFile <> '' then
                     begin
                       // file found...
                       // read version and SHA-1 from CHD's header
                       FormMain.CreateCHD_SHA1(DiskFile, '', ChecksumCHD, HeaderVerCHD);

                       addItem:= FilesListView.Items.AddCustom(TGameInfo, nil);
                       TGameInfo(addItem).eROMIdentification:= FormMain.MemGameInfo.eROMIdentification;
                       TGameInfo(addItem).eSystemID:= FormMain.MemGameInfo.eSystemID;
                       TGameInfo(addItem).eMediaType:= 1;
                       TGameInfo(addItem).eFileType:= FileID;
                       TGameInfo(addItem).eSoftwareName:= FormMain.MemGameInfo.eSoftwareName;
                       TGameInfo(addItem).eMerged:= False;
                       TGameInfo(addItem).eFileName:= DiskFile;
                       TGameInfo(addItem).eFileSize:= GetFileSize(DiskFile);
                       TGameInfo(addItem).eFileSizeText:= FormMain.GetSizeType(TGameInfo(addItem).eFileSize, False);
                       TGameInfo(addItem).eDateTimeText:= FormMain.GetDateTimeStr(FileAge(DiskFile));
                       TGameInfo(addItem).eParentFile:= FormMain.GameIsClone(FormMain.MemGameInfo.eClone) and (not SameText(romName, ExtractFileName(DiskFile)));
                       TGameInfo(addItem).eHeaderVerCHD:= HeaderVerCHD;
                       addItem.Details[1]:= 1;
                       addItem.Details[2]:= 2;
                       addItem.Checked:=  Boolean(DeleteCHDs.Checked);
                       if not addItem.Checked then
                          addItem.State:= addItem.State+[esosGhosted];
                     end;
                end;
           end;
         end;
       end;
     end;
end;

function TFormDeleteGamesFiles.ProcessGamesFiles: Boolean;
begin
  if not Assigned(FormCopyMoveGameFiles) then
     FormCopyMoveGameFiles:= TFormCopyMoveGameFiles.Create(nil);
  FormCopyMoveGameFiles.DoubleBuffered:= True;
  FormCopyMoveGameFiles.Tag:= ActionMode;

  FormCopyMoveGameFiles.iTotalFiles:= 0;
  FormCopyMoveGameFiles.iTotalFilesSize:= 0;
  FormCopyMoveGameFiles.iTotalFilesSizeLeft:= 0;
  FormCopyMoveGameFiles.OverwriteFiles:= CopyMoveOverwriteFiles.Checked;

  FormCopyMoveGameFiles.iTotalFiles:= FormCopyMoveGameFiles.iTotalFiles+ROMsTotalFiles+CHDsTotalFiles+CFGsTotalFiles;
  FormCopyMoveGameFiles.iTotalFilesSize:= FormCopyMoveGameFiles.iTotalFilesSize+ROMsTotalSize+CHDsTotalSize+CFGsTotalSize;

  if ActionMode = 0 then
     FormCopyMoveGameFiles.LabelCopyTo.Visible:= False;
     
  FormCopyMoveGameFiles.iTotalFilesSizeLeft:= FormCopyMoveGameFiles.iTotalFilesSize;
  FormCopyMoveGameFiles.Caption:= FormDeleteGamesFiles.Caption;

  FormCopyMoveGameFiles.ShowModal;
  Result:= FormCopyMoveGameFiles.SingleSystemChanged; // only for delete game files (ROMs/CHDs)
  FreeAndNil(FormCopyMoveGameFiles);
end;

procedure TFormDeleteGamesFiles.AddConfigFiles;
var
  addItem: TEasyItem;
  FileFullPath: String;
  nvram_MAME: THashedStringList;

  function GetFiles_nvramMAME: Boolean;
  var
    Loop: Integer;
  begin
    // for FileType = 1 only!!!
    nvram_MAME:= THashedStringList.Create;
    GetFilesList(FolderNVRAM+FormMain.MemGameInfo.eName, '.???', '*.*', nvram_MAME, False, True, True);
    if FormMain.MemGameInfo.eBiosName <> '' then
       begin
         for Loop:=1 to 65 do
         begin
           if DirectoryExists(FolderNVRAM+FormMain.MemGameInfo.eName+'_'+IntToStr(Loop)) then
              GetFilesList(FolderNVRAM+FormMain.MemGameInfo.eName+'_'+IntToStr(Loop), '.???', '*.*', nvram_MAME, False, False, True);
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
    case FileType of
      0:
        begin
          if FolderCFG = '' then
             Exit;
          if FormMain.MemGameInfo.eSystemID <> idSegaModel2 then
             FileFullPath:= FolderCFG+FormMain.MemGameInfo.eName+'.cfg'
          else
             FileFullPath:= FolderCFG+FormMain.MemGameInfo.eName+'.input';
        end;
      1:
        begin
          if FolderNVRAM = '' then
             Exit;
          case FormMain.MemGameInfo.eSystemID of
            idSegaModel2: FileFullPath:= FolderNVRAM+FormMain.MemGameInfo.eName+'.dat'; // SEGA Model 2
            idSupermodel: FileFullPath:= FolderNVRAM+FormMain.MemGameInfo.eName+'.nv'; // Supermodel: SEGA Model 3
            idMAME, idHBMAME: // MAME and HBMAME
              begin
                FileFullPath:= FolderNVRAM+FormMain.MemGameInfo.eName+'.nv'; // old nvram method
                haveMAMEnvram:= GetFiles_nvramMAME; // new nvram files (nvram\gamename\*.*)
              end;
          else
               FileFullPath:= FolderNVRAM+FormMain.MemGameInfo.eName+'.nv'; // MAME based and other emulators ????
          end;
        end;
      2, 3, 4:
        begin
          if FolderNVRAM = '' then
             Exit;
          FileFullPath:= FolderNVRAM+FormMain.MemGameInfo.eName;
          case FileType of
            2: FileFullPath:= FileFullPath+'.eeprom'; // Demul EEPROM
            3: FileFullPath:= FileFullPath+'.sram'; // Demul SRAM
            4: FileFullPath:= FileFullPath+'.flash'; // Demul FLASH
          end;
        end;
    end;
    Result:= FileExists(FileFullPath);
    if FileType <> 1 then
       begin
         if not Result then
            Exit;
       end
    else
       begin
         if FormMain.IsMAMEBasedSys(FormMain.MemGameInfo.eSystemID) then
            begin
              // check new MAME nvram sub-folder
              if not haveMAMEnvram then
                 begin
                   FreeAndNil(nvram_MAME);
                   if not Result then
                      Exit;
                 end;
            end
         else
            begin
              // all other systems
              if not Result then
                 Exit;
            end;
       end;

    // add .zip file
    if Result then
       begin
          addItem:= FilesListView.Items.AddCustom(TGameInfo, nil);
          TGameInfo(addItem).eSystemID:= FormMain.MemGameInfo.eSystemID;
          TGameInfo(addItem).eMediaType:= -1; // for config files
          TGameInfo(addItem).eFileType:= FileType;
          TGameInfo(addItem).eSoftwareName:= FormMain.MemGameInfo.eSoftwareName;
          TGameInfo(addItem).eMerged:= False;
          TGameInfo(addItem).eFileName:= FileFullPath;
          TGameInfo(addItem).eFileSize:= GetFileSize(FileFullPath);
          TGameInfo(addItem).eFileSizeText:= FormMain.GetSizeType(TGameInfo(addItem).eFileSize, False);
          TGameInfo(addItem).eDateTimeText:= FormMain.GetDateTimeStr(FileAge(FileFullPath));
          TGameInfo(addItem).eParentFile:= False;
          TGameInfo(addItem).eHeaderVerCHD:= 0;
          addItem.Details[1]:= 1;
          addItem.Details[2]:= 2;
          addItem.Checked:=  Boolean(DeleteCFGsNVRAMs.Checked);
          if not addItem.Checked then
             addItem.State:= addItem.State+[esosGhosted];
       end;

    if FormMain.IsMAMEBasedSys(FormMain.MemGameInfo.eSystemID) and (FileType = 1) and haveMAMEnvram then
       begin
         for Loop:=0 to nvram_MAME.Count-1 do
         begin
           addItem:= FilesListView.Items.AddCustom(TGameInfo, nil);
           fixFileType:= FileType;
           if FormMain.IsMAMEBasedSys(FormMain.MemGameInfo.eSystemID) then
              fixFileType:= FormMain.FixMAMENVRAMFileType(nvram_MAME[Loop]);
           TGameInfo(addItem).eROMIdentification:= FormMain.MemGameInfo.eSystemID;
           TGameInfo(addItem).eSystemID:= FormMain.MemGameInfo.eSystemID;
           TGameInfo(addItem).eMediaType:= -1; // for config files
           TGameInfo(addItem).eFileType:= fixFileType;
           TGameInfo(addItem).eSoftwareName:= FormMain.MemGameInfo.eSoftwareName;
           TGameInfo(addItem).eMerged:= False;
           TGameInfo(addItem).eFileName:= nvram_MAME[Loop];
           TGameInfo(addItem).eFileSize:= GetFileSize(nvram_MAME[Loop]);
           TGameInfo(addItem).eFileSizeText:= FormMain.GetSizeType(TGameInfo(addItem).eFileSize, False);
           TGameInfo(addItem).eDateTimeText:= FormMain.GetDateTimeStr(FileAge(nvram_MAME[Loop]));
           TGameInfo(addItem).eParentFile:= False;
           TGameInfo(addItem).eHeaderVerCHD:= 0;
           addItem.Details[1]:= 1;
           addItem.Details[2]:= 2;
           addItem.Checked:=  Boolean(DeleteCFGsNVRAMs.Checked);
           if not addItem.Checked then
              addItem.State:= addItem.State+[esosGhosted];
           //addItem.Checked:= True;
         end;
         FreeAndNil(nvram_MAME);
       end;
  end;

begin
  if FormMain.MemGameInfo.eSystemID = idDaphne then
     Exit; // Daphne doesn't have any config files to delete
  AddItem_ELV(0); // .cfg; .input (segamodel2)
  AddItem_ELV(1); // .dat; .nv; nvram
  AddItem_ELV(2); // .eeprom
  AddItem_ELV(3); // .sram
  AddItem_ELV(4); // .flash
end;

procedure TFormDeleteGamesFiles.UpdateTotalCheckedLabel;
begin
  LabelTotalFilesChecked.Caption:= Format('%.2u Files Checked', [FilesListView.CheckManager.Count]);
end;

procedure TFormDeleteGamesFiles.FormShow(Sender: TObject);
var
  HeightDiff: Integer;
  Screen480, ScreenHighRes: Boolean;

  {function RemovePixels(PixelsToShrink: Integer): Boolean;
  begin
    Result:= True;
    FilesListView.CellSizes.Tile.Width:=  FilesListView.CellSizes.Tile.Width-PixelsToShrink;
    FilesListView.Width:= FilesListView.Width-PixelsToShrink;
    LabelGameTitle.Width:= LabelGameTitle.Width-PixelsToShrink;
    LabelGameStatus.Left:= LabelGameStatus.Left-PixelsToShrink;
    DestinationFolder.Width:= DestinationFolder.Width-PixelsToShrink;
    ButtonSelectROMsFolder.Left:= ButtonSelectROMsFolder.Left-PixelsToShrink;
    CopyMoveOverwriteFiles.Left:= CopyMoveOverwriteFiles.Left-PixelsToShrink;
    LabelTotalFiles.Left:= LabelTotalFiles.Left-(PixelsToShrink div 2);
    LabelTotalFilesChecked.Left:= LabelTotalFiles.Left;
    ButtonYes.Left:= ButtonYes.Left-PixelsToShrink;
    ButtonNo.Left:= ButtonNo.Left-PixelsToShrink;
    FormDeleteGamesFiles.Width:= FormDeleteGamesFiles.Width-PixelsToShrink;
  end;}

begin
  FormMain.CheckSevenZip(FormMain.MemGameInfo.eSystemID);
  FormMain.ELV_ResetNormalColors(FilesListView);

  FormMain.IL_StandardIconsExtraLarge.GetIcon(FormMain.GetMAMEImageIndex(FormMain.MemGameInfo.eROMIdentification, FormMain.MemGameInfo.eSoftwareName),
                                              SystemIcon.Picture.Icon);
  FormMain.IL_ArcadeSystem_Small.GetIcon(FormMain.MemGameInfo.eSystemID, GameIcon.Picture.Icon);

  //FormMain.LoadGameIDThumbIcon(SystemIcon, FormMain.MemGameInfo.eROMIdentification);
  //FormMain.IL_ArcadeSystem_Large.GetIcon(FormMain.MemGameInfo.eSystemID, GameIcon.Picture.Icon);
  
  ScreenHighRes:= Screen.Height > 800;
  Screen480:= Screen.Height = 480;
  //Screen480:= True; // for debugging (October 27, 2016)

  if Screen.Width < 800 then
     begin
       HeightDiff:= FormDeleteGamesFiles.Width-(Screen.Width-15); //635; 715
       //HeightDiff:= FormDeleteGamesFiles.Width-(640-15); // for debugging only
       LabelGameTitle.Width:= LabelGameTitle.Width-HeightDiff;
       LabelGameStatus.Left:= LabelGameStatus.Left-HeightDiff;
       ButtonYes.Left:= ButtonYes.Left-HeightDiff;
       ButtonNo.Left:= ButtonNo.Left-HeightDiff;
       FilesListView.Width:= FilesListView.Width-HeightDiff;
       FilesListView.CellSizes.Tile.Width:= FilesListView.CellSizes.Tile.Width-HeightDiff;
       FormDeleteGamesFiles.Width:= FormDeleteGamesFiles.Width-HeightDiff;
     end
  else
  if ScreenHighRes then
     begin
       HeightDiff:= FilesListView.CellSizes.Tile.Height*2;
       FilesListView.Height:= FilesListView.Height+HeightDiff;
       FormDeleteGamesFiles.Height:= FormDeleteGamesFiles.Height+HeightDiff;
     end;
     
  LabelGameDetails.Caption:= 'name: '+FormMain.StatusBar_GamesGameName.Caption;
  if FormMain.EmulatorVersion[FormMain.MemGameInfo.eSystemID] <> '' then
     LabelEmulatorVersion.Caption:= FormMain.EmulatorVersion[FormMain.MemGameInfo.eSystemID]
  else
     begin
       LabelEmulatorVersion.Visible:= False;
       LabelGameDetails.Top:= LabelGameDetails.Top+7;
     end;
  if FormMain.MemGameInfo.eSoftwareName <> '' then
     begin
       LabelSoftwareList.Visible:= True;
       LabelSoftwareListTitle.Caption:= FormMain.MemGameInfo.eCategory;
       LabelSoftwareListTitle.Visible:= True;
     end;

  GameChanged:= False;
  LabelGameStatus.Caption:= LabelGameStatus.Hint+#13#10+FormMain.GetGameStatusText(FormMain.MemGameInfo.eGameSetStatus, FormMain.MemGameInfo.eROMIdentification);
  
  case FormMain.MemGameInfo.eGameSetStatus of
    0: TopBar.Color1:= $00f0fae5; // green
    1: TopBar.Color1:= $00e5f0fa; // red (based on green)
    2: TopBar.Color1:= $00eeeeee; // silver (base on green)
  end;
  case ActionMode of
    0: ActionString:= 'Delete';
    1: ActionString:= 'Copy';
    2: ActionString:= 'Move';
  end;

  LoadMediaIcons;
  if ActionMode = 0 then
     begin
       PanelDestinationFolder.Visible:= False;
       FormDeleteGamesFiles.Height:= FormDeleteGamesFiles.Height-PanelDestinationFolder.Height; // 50
     end
  else
     begin
       //LabelWarning.Caption:= 'Uncheck files you do NOT want to '+LowerCase(ActionString)+'. Network paths are not supported!';
       ButtonYes.Caption:= ActionString+' Files';
       DeleteCFGsNVRAMs.Font.Color:= clSilver;
       DeleteCFGsNVRAMs.Font.Style:= [fsBold, fsStrikeout];
       DeleteCFGsNVRAMs.Checked:= False;
       DeleteCFGsNVRAMs.Enabled:= False;
       //LabelTotalFiles.Left:= LabelTotalFiles.Left-59;
       //LabelTotalFilesChecked.Left:= LabelTotalFilesChecked.Left-59;
     end;
  //else
  //   FileTypesGroupBox.Width:= 131;

  // add all files in the list
  Application.ProcessMessages;
  FilesListView.BeginUpdate;
  FilesListView.Items.ReIndexDisable:= True;
  AddFiles; // add ROMs/CHDs files
  if ActionMode = 0 then
     AddConfigFiles; // add game config files... delete files mode only!!!
  FilesListView.Items.ReIndexDisable:= False;
  //if FilesListView.Groups.ItemCount > 6 then
  //   FilesListView.CellSizes.Tile.Width:= FilesListView.CellSizes.Tile.Width-16;
  FilesListView.EndUpdate;

  if Screen480 then
     begin
       if FilesListView.Groups.ItemCount > 4 then
          begin
            HeightDiff:= FilesListView.Height;
            FilesListView.Height:= FilesListView.Height-(FilesListView.CellSizes.Tile.Height*2);
            HeightDiff:= HeightDiff-FilesListView.Height;
            FormDeleteGamesFiles.Height:= FormDeleteGamesFiles.Height-HeightDiff;
          end;
     end;
  //else
  //if ScreenHighRes then
  //   begin
  //     HeightDiff:= FilesListView.Height;
  //     FilesListView.Height:= FilesListView.Height+(FilesListView.CellSizes.Tile.Height*2);
  //     HeightDiff:= FilesListView.Height-HeightDiff;
  //     FormDeleteGamesFiles.Height:= FormDeleteGamesFiles.Height+HeightDiff;
  //   end;
     
  {case Screen.Width of
    720: RemovePixels(20);
    640: RemovePixels(90);
  end;
  RemovePixels(90);}

  if FilesListView.Scrollbars.VertBarVisible then
     begin
       FilesListView.CellSizes.Tile.Width:= FilesListView.CellSizes.Tile.Width-GetSystemMetrics(SM_CXVSCROLL);
       FilesListView.HotTrack.Enabled:= False; // disable to fix hot track painting bug :_((
     end
  else
     begin
       // try to adjust the height of the files list and the window height...
       // 480p = 4 files
       // 600p = 6 files
       // 720p = 8 files
       // 768p = 9 files
       // higher = ? files (all files, no limit)
       if FormMain.CheckTotal(FilesListView) then
       if ((not Screen480) and (not ScreenHighRes) and (FilesListView.Groups.ItemCount < 6)) or
          ((ScreenHighRes) and (FilesListView.Groups.ItemCount < 8)) or
          ((Screen480) and (FilesListView.Groups.ItemCount < 4)) then
       //if FilesListView.Groups.Count < 6 then
          begin
            HeightDiff:= FilesListView.Height;
            FilesListView.Height:= FilesListView.CellSizes.Tile.Height*FilesListView.Groups.ItemCount;
            HeightDiff:= HeightDiff-FilesListView.Height;
            FormDeleteGamesFiles.Height:= FormDeleteGamesFiles.Height-HeightDiff;
          end;
       //else
       //if Screen.Height > 600 then
       //   begin
       //     HeightDiff:= FilesListView.Height;
       //     FilesListView.Height:= FilesListView.Height+(FilesListView.CellSizes.Tile.Height*2);
       //     HeightDiff:= FilesListView.Height-HeightDiff;
       //     FormDeleteGamesFiles.Height:= FormDeleteGamesFiles.Height+HeightDiff;
       //   end;
     end;
  // end of add files functions

  case FormMain.CheckTotal(FilesListView) of
    True:
      begin
        LabelGameTitle.Caption:= FormMain.MemGameInfo.eTitle;
        LabelTotalFiles.Caption:= Format('%.2u Total Files', [FilesListView.Groups.ItemCount]);
        UpdateTotalCheckedLabel;
      end;
    False:
      begin
        CallMessageBox;
        FormMain.ShowGameNameEntryMsgBox;
        FormMain.AddMsgText('Emulator   ', $000053a6, [fsItalic, fsBold], taCenter);
        FormMain.AddMsgText(FormMain.EmulatorVersion[FormMain.MemGameInfo.eSystemID]+#13#10, clGray, [fsItalic, fsBold], taCenter);
        FormMain.AddMsgText(FormMain.EmulatorFile[FormMain.MemGameInfo.eSystemID]+#13#10+#13#10, clBlack, [fsBold], taCenter);

        if FormMain.MemGameInfo.eSoftwareName <> '' then
           begin
             FormMain.AddMsgText('Software List   ', $000053a6, [fsItalic, fsBold], taCenter);
             FormMain.AddMsgText(FormMain.MemGameInfo.eCategory+#13#10+#13#10, clGray, [fsItalic, fsBold], taCenter, 9);
           end;

        if uMain.TEasyGameInfo(FormMain.SelectedEasyItem).eROMInfo <> nil then // .Count > 0
           begin
             FormMain.AddMsgText('    No files were found to ');
             FormMain.AddMsgText(LowerCase(ActionString), $00a65300, [fsBold]);
           end
        else
           begin
             FormMain.AddMsgText('    This game does not use any ROMs. There are no extra files to ');
             FormMain.AddMsgText(LowerCase(ActionString), $00a65300, [fsBold]);
           end;
        FormMain.AddMsgText('.');//+#13#10+#13#10);
        //FormMain.AddMsgText(#13#10+#13#10+'Emulator File: ');
        //FormMain.AddMsgText(FormMain.EmulatorFile[FormMain.MemGameInfo.eSystemID]+#13#10+#13#10, clBlack, [fsBold]);

        

        //FormMain.AddMsgText('Emulator File: ');
        //FormMain.AddMsgText(FormMain.EmulatorFile[FormMain.MemGameInfo.eSystemID], clBlack, [fsBold]);


        {if uMain.TEasyGameInfo(FormMain.SelectedEasyItem).eROMInfo <> nil then // .Count > 0
           begin
             FormMain.AddMsgText('    No files were found to ');
             FormMain.AddMsgText(LowerCase(ActionString), $00a65300, [fsBold]);
           end
        else
           begin
             FormMain.AddMsgText('    This game does not use any ROMs. There are no extra files to ');
             FormMain.AddMsgText(LowerCase(ActionString), $00a65300, [fsBold]);
           end;
        FormMain.AddMsgText('.'+#13#10+#13#10);
        FormMain.AddMsgText(FormMain.GetEmulatorDescription(FormMain.MemGameInfo.eSystemID, True)+#13#10, clGray, [fsBold, fsItalic], taCenter);
        if FormMain.MemGameInfo.eSoftwareName <> '' then
           FormMain.AddMsgText(FormMain.MemGameInfo.eCategory+#13#10, $000053a6, [fsBold], taCenter, 9);
        FormMain.AddMsgText('Emulator File: ');
        FormMain.AddMsgText(FormMain.EmulatorFile[FormMain.MemGameInfo.eSystemID], clBlack, [fsBold]);}
        GenerateMessage(FormDeleteGamesFiles.Caption, FormMain.MemGameInfo.eTitle, '', 2, False, -1);
        PostMessage(Handle, wm_Close, 0, 0);
        Close;
      end;
  end;
end;

procedure TFormDeleteGamesFiles.FilesListViewItemPaintText(
  Sender: TCustomEasyListview; Item: TEasyItem; Position: Integer;
  ACanvas: TCanvas);
begin
  case Position of
    0:
      begin
        ACanvas.Font.Name:= 'Trebuchet MS';
        ACanvas.Font.Size:= ACanvas.Font.Size+2;
        ACanvas.Font.Color:= clMaroon;
        ACanvas.Font.Style:= [fsItalic];
      end;
    1:
      begin
        ACanvas.Font.Name:= 'Consolas';
        //ACanvas.Font.Name:= 'Lucida Console';//'Consolas';
        //ACanvas.Font.Size:= 8;//ACanvas.Font.Size;//+1;
      end;
    2:
      begin
        ACanvas.Font.Name:= 'Consolas';
        //ACanvas.Font.Name:= 'Verdana';
        //ACanvas.Font.Size:= 7;//ACanvas.Font.Size-1;
      end;
  end;
  if Item.Ghosted then
     begin
       if Position = 0 then
          ACanvas.Font.Color:= $00707070// clSilver
       else
          ACanvas.Font.Color:= $00464646;//clMedGray;
     end;
end;

procedure TFormDeleteGamesFiles.FilesListViewKeyAction(
  Sender: TCustomEasyListview; var CharCode: Word; var Shift: TShiftState;
  var DoDefault: Boolean);
begin
  case CharCode of
    //VK_RETURN: ButtonYes.Click;
    VK_ESCAPE: ButtonNo.Click;
  end;
end;

procedure TFormDeleteGamesFiles.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
  case Key of
    //#13: ButtonYes.Click;
    #27: ButtonNo.Click;
  end;
end;

procedure TFormDeleteGamesFiles.GetFilesCountSize;
var
  Item: TEasyItem;
begin
  // procedure used only when hitting Delete/Copy/Move Files button
  ROMsTotalSize:= 0;
  CHDsTotalSize:= 0;
  CFGsTotalSize:= 0;
  ROMsTotalFiles:= 0;
  CHDsTotalFiles:= 0;
  CFGsTotalFiles:= 0;

  Item:= FilesListView.Groups.FirstItem;
  repeat
    if Item.Checked then
       begin
         case TGameInfo(Item).eMediaType of
           0: // ROMs
             begin
               ROMsTotalSize:= ROMsTotalSize+TGameInfo(Item).eFileSize;
               Inc(ROMsTotalFiles);
             end;
           1: // CHDs
             begin
               CHDsTotalSize:= CHDsTotalSize+TGameInfo(Item).eFileSize;
               Inc(CHDsTotalFiles);
             end;
           -1: // CFGs
             begin
               CFGsTotalSize:= CFGsTotalSize+TGameInfo(Item).eFileSize;
               Inc(CFGsTotalFiles);
             end;
         end;
       end;
    Item:= FilesListView.Groups.NextItem(Item);
  until Item = nil;
end;

procedure TFormDeleteGamesFiles.ButtonYesClick(Sender: TObject);
var
  FileTypeStr: String;
  iFreeAvailable, iTotalAvailable, iFreeRequired: Int64;
  ErrorMsg: DWORD;
begin
  if not FormMain.CheckTotal(FilesListView) then
     Exit;

  if not FormMain.HaveItemsChecked(FilesListView) then
     begin
       CallMessageBox;
       FormMain.ShowGameNameEntryMsgBox;
       GenerateMessage(FormDeleteGamesFiles.Caption, FormMain.MemGameInfo.eTitle, '    You haven''t checked '+
                       'any files. Please select at least one.', 2, False, -1);
       Exit;
     end;

  if ActionMode <> 0 then
     begin
       if DestinationFolder.Text = '' then
       begin
         CallMessageBox;
         FormMain.ShowGameNameEntryMsgBox;
         GenerateMessage(FormDeleteGamesFiles.Caption, FormMain.MemGameInfo.eTitle, '    You haven''t selected a destination '+
                         'folder. Use only full paths. Cannot continue.', 2, False, -1);
         Exit;
       end;
     end;

  GetFilesCountSize;
  // 0 -> delete files
  // 1 -> copy files
  // 2 -> move files
  FileTypeStr:= '';
  if ActionMode <> 0 then
     begin
        FileTypeStr:= Trim(ExtractFileDrive(DestinationFolder.Text));
        if FileTypeStr = '' then
           begin
             CallMessageBox;
             FormMain.ShowGameNameEntryMsgBox;
             GenerateMessage(FormDeleteGamesFiles.Caption, FormMain.MemGameInfo.eTitle, '    Could not detect the destination drive letter. '+
                             'Please make sure you enter a full destination path.', 2, False, -1);
             Exit;
           end;
        iFreeRequired:= ROMsTotalSize+CHDsTotalSize+CFGsTotalSize;

        if not SysUtils.GetDiskFreeSpaceEx(PChar(FileTypeStr), iFreeAvailable, iTotalAvailable, nil) then
           begin
             ErrorMsg:= GetLastError;
             CallMessageBox;
             FormMain.ShowGameNameEntryMsgBox;
             FormMain.AddMsgText('    There was an error trying to detect the required free space in the destination path (');
             FormMain.AddMsgText(FileTypeStr, $00a65300, [fsBold]);
             FormMain.AddMsgText('.'#13#10+#13#10+'Error code '+IntToStr(ErrorMsg)+': ');
             FormMain.AddMsgText(SysErrorMessage(ErrorMsg), $00a65300, [fsBold]);
             GenerateMessage(FormDeleteGamesFiles.Caption, FormMain.MemGameInfo.eTitle, '', 2, False, -1);
             Exit;
           end;
        if iFreeAvailable <= iFreeRequired then
           begin
             CallMessageBox;
             FormMain.ShowGameNameEntryMsgBox;
             FormMain.AddMsgText('    Can''t ');
             FormMain.AddMsgText(LowerCase(ActionString), clBlack, [fsBold]);
             FormMain.AddMsgText(' files. There is not enough free space in drive ');
             FormMain.AddMsgText(FileTypeStr, $00a65300, [fsBold]);
             FormMain.AddMsgText(#13#10+'The drive letter might also be invalid. Please select another destination, '+
                                 'and make sure to enter a full path, including the drive letter.');
             GenerateMessage(FormDeleteGamesFiles.Caption, FormMain.MemGameInfo.eTitle, '', 2, False, -1);
             Exit;
           end;
     end;

  FileTypeStr:= '';
  CallMessageBox;
  FormMain.ShowGameNameEntryMsgBox;
  FormMain.AddMsgText('    You are about to ');
  FormMain.AddMsgText(LowerCase(ActionString), $00a65300, [fsBold]);
  FormMain.AddMsgText(' the checked files of the selected game.'+#13#10+'Click ');
  FormMain.AddMsgText('No', $00a65300, [fsBold]);
  FormMain.AddMsgText(' button if you want to go back and review the files or click ');
  FormMain.AddMsgText('Yes', $00a65300, [fsBold]);
  FormMain.AddMsgText(' button to confirm.'+#13#10+#13#10);
  FormMain.AddMsgText(ActionString+' files. ');
  FormMain.AddMsgText('Are you sure ?', clMaroon { $00a65300 }, [fsBold, fsItalic]);

  if GenerateMessage(FormDeleteGamesFiles.Caption, FormMain.MemGameInfo.eTitle, '', 1, True, -1) = mrNo then
     Exit;
  //if GenerateMessage(FormDeleteGamesFiles.Caption, FormMain.MemGameInfo.eTitle,
  //                   '    You are about to '+LowerCase(ActionString)+' the checked files of the selected game.'+#13#10+
  //                   '    Click "No" button if you want to go back and review the files to '+LowerCase(ActionString)+', or '+
  //                   'click "Yes" button to continue.'+#13#10+#13#10+
  //                   'Continue. Are you sure ?', 1, True, 2) = mrNo then
  //   Exit;
  GameChanged:= ProcessGamesFiles;
  Close;
end;

procedure TFormDeleteGamesFiles.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if CanClose then
     begin
       FormMain.ClearListView(FilesListView);
     end;
end;

procedure TFormDeleteGamesFiles.FilesListViewItemCheckChange(
  Sender: TCustomEasyListview; Item: TEasyItem);
begin
  case Item.Checked of
    True : Item.State:= Item.State-[esosGhosted];
    False: Item.State:= Item.State+[esosGhosted];
  end;
  UpdateTotalCheckedLabel;
end;

procedure TFormDeleteGamesFiles.DeleteCHDsClick(Sender: TObject);
begin
  SetCheckBoxColor(TAdvOfficeCheckBox(Sender).Checked, TAdvOfficeCheckBox(Sender));
  if FormDeleteGamesFiles.Visible then
     FilesListView.SetFocus;
end;

procedure TFormDeleteGamesFiles.ButtonSelectROMsFolderClick(
  Sender: TObject);
begin
  FormMain.DialogSelectFolder(DestinationFolder, False);
end;

end.
