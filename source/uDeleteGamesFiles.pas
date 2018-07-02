unit uDeleteGamesFiles;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, MPCommonObjects, EasyListview, ExtCtrls,
  ImgList, IniFiles, FileCtrl, PanelEx, ShadowLabel, uCommon, uCommonCustom,
  AdvOfficeButtons, AdvGroupBox, CommCtrl, Buttons, uMain;

type
  TGameInfo = class(TEasyItemStored)
  private
    // MAME based (0 -> CFG; -> 1 -> NVRAM, EEPROM, FLASH and maybe others (MAME gamename config folder);
    // ZiNc (0 -> CFG);
    // SEGA Model 2 (0-> INPUT; 1 -> NVDATA);
    // Demul (2 -> EEPROM; 3 -> SRAM; 4 -> FLASH);
    // Supermodel: SEGA Model 3 ( 1 -> NVRAM);
    fSystemID: ShortInt;
    fCustomSystemID: ShortInt;
    fROMIdentification: Integer;
    fMediaType: ShortInt; // 0 -> ROM; >= 1 -> CHD (for ROMs and CHD only)... -1 -> game config file
    fCustomMediaType: ShortInt; // 0 -> ROM; 1 -> Cartridge; 2 -> Disc Image; 3 -> Floppy; 4 -> Cassette; 5 -> Hard Disk Drive
    fFileType: ShortInt; // cfg; nvram; eeprom (game config files)
                         // 12, 13, 14 -> HDD/general CHD;  15, 16, 17 -> CD;  18, 19, 20 -> Compact Flash Card; 21, 22, 23 -> Video Tape (VHS)
    fSoftwareName: String;
    fGameStatus: ShortInt;

    fFileName: WideString;
    fFileSize: Int64;
    fFileSizeText: String;
    fDateTimeText: String;
    fMerged: Boolean;
    fParentFile: Boolean;
    fHeaderVerCHD: Byte;
    fIsCustomGame: Boolean;
    fIsUnicode: Boolean;
  protected
    function GetCaptions(Column: Integer): WideString; override;
    function GetImageIndexes(Column: Integer): TCommonImageIndexInteger; override;
  public
    property eSystemID: ShortInt read fSystemID write fSystemID;
    property eCustomSystemID: ShortInt read fCustomSystemID write fCustomSystemID;
    property eROMIdentification: Integer read fROMIdentification write fROMIdentification;
    property eMediaType: ShortInt read fMediaType write fMediaType; // 0 -> ROMs; 1 -> CHD; -1 -> config files
    property eCustomMediaType: ShortInt read fCustomMediaType write fCustomMediaType; // 0 -> ROM; 1 -> Cartridge; 2 -> Disc Image; 3 -> Floppy; 4 -> Cassette; 5 -> Hard Disk Drive
    property eFileType: ShortInt read fFileType write fFileType; // what file ID the media_type is (for config files and CHDs)
    property eSoftwareName: String read fSoftwareName write fSoftwareName;
    property eGameStatus: ShortInt read fGameStatus write fGameStatus; // 0 - have; 1 - miss; 2 - missing ROMs/CHDs
    property eFileName: WideString read fFileName write fFileName;
    property eFileSize: Int64 read fFileSize write fFileSize;
    property eFileSizeText: String read fFileSizeText write fFileSizeText;
    property eDateTimeText: String read fDateTimeText write fDateTimeText;
    property eMerged: Boolean read fMerged write fMerged;
    property eParentFile: Boolean read fParentFile write fParentFile;
    property eHeaderVerCHD: Byte read fHeaderVerCHD write fHeaderVerCHD;
    property eIsCustomGame: Boolean read fIsCustomGame write fIsCustomGame;
    property eIsUnicode: Boolean read fIsUnicode write fIsUnicode;
  end;

type
  TFormDeleteGamesFiles = class(TForm)
    IL_MediaType: TImageList;
    TopBar: TPanelEx;
    FilesListView: TEasyListview;
    BottomBar: TPanelEx;
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
    LabelGameDetails: TShadowLabel;
    LabelEmulatorVersion: TShadowLabel;
    LabelSoftwareListTitle: TShadowLabel;
    LabelSoftwareList: TShadowLabel;
    DeleteGameFromGamesList: TAdvOfficeCheckBox;
    DeleteGameFileFromDisk: TAdvOfficeCheckBox;
    ButtonHelp: TBitBtn;
    CopyMoveAddSystemFolder: TAdvOfficeCheckBox;
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
    procedure ButtonHelpClick(Sender: TObject);
  private
    { Private declarations }
    ZiNcFilePath, ActionString: String; //, DestinationPath: String;
    ROMsTotalSize, CHDsTotalSize, CFGsTotalSize: Int64;
    ROMsTotalFiles, CHDsTotalFiles, CFGsTotalFiles: Integer;

    procedure ChangeCheckBoxColor(Enabled: Boolean; CheckBoxHolder: TAdvOfficeCheckBox);
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

uses uCopyMoveGameFiles;

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
        Result:= FormMain.GetFileTypeText(eSystemID, eMediaType, eFileType, eIsCustomGame, eCustomMediaType); // need to make sure this is OK...
      end;
    1:
      begin
        //if eMediaType = 0 then
        if not FormMain.IsMediaTypeCHD(eMediaType, False) then
           begin
             if eMerged then
                extraStr:= 'Merged Set';
           end
        else
           begin
             extraStr:= '';
             if not eIsCustomGame then
             begin
               if (not FormMain.IsROM_Bios(eROMIdentification)) and (not FormMain.IsROM_Device(eROMIdentification)) then
               begin
                 // for CHDs only
                 if FormMain.IsFileID_DeviceCHD(eFileType) then
                    extraStr:= 'Device'
                 else
                 if FormMain.IsFileID_BiosCHD(eFileType) then
                    extraStr:= 'Bios';
               end;

               if eParentFile then
                  begin
                    if extraStr = '' then
                       extraStr:= 'Parent'
                    else
                       extraStr:= 'Parent '+extraStr;
                  end;
             end;
           end;

        case FormDeleteGamesFiles.FilesListView.Scrollbars.VertBarVisible of
          True : VertBar:= 2;
          False: VertBar:= 0;
        end;

        if Screen.Width > 720 then
           ExtraCount:= 91-VertBar
        else
           ExtraCount:= 71-VertBar;

        //case eIsUnicode of
        //  True:
        //    begin
        //      if Screen.Width > 720 then
        //         ExtraCount:= 91-VertBar
        //      else
        //         ExtraCount:= 71-VertBar;
        //    end;
        //  False:
        //    begin
        //      if Screen.Width > 720 then
        //         ExtraCount:= 91-VertBar
        //      else
        //         ExtraCount:= 71-VertBar;
        //    end;
        //end;

        case eIsCustomGame of
          True:
            begin
              Result:= WideFormat('%-'+IntToStr(ExtraCount)+'s', [ShortDirStringW(eFileName, ExtraCount)]);
            end;
          False:
            begin
              if extraStr <> '' then
                 begin
                   extraStr:= '['+extraStr+'] ';
                   ExtraCount:= ExtraCount-Length(extraStr);
                 end;
              Result:= Format(extraStr+'%-'+IntToStr(ExtraCount)+'s', [ShortDirString(eFileName, ExtraCount)]);
            end;
        end;
      end;
    2:
      begin
        if FormDeleteGamesFiles.FilesListView.Scrollbars.VertBarVisible then
           FillBlank:= '104'
        else
           FillBlank:= '107';

        //if Screen.Width > 720 then
        //   FillBlank:= IntToStr(StrToInt(FillBlank)+25);
        Result:= 'Size: '+eFileSizeText+'  Date Modified: '+eDateTimeText;
        if not eIsCustomGame then
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
       if eIsCustomGame then
       begin
         Result:= eCustomMediaType+8;
       end
       else
       begin
         if eMediaType <> -1 then
            begin
              if eFileType = 0 then
                 Result:= eMediaType // ROM
              else
                 begin
                   case eFileType of
                     0: Result:= eMediaType;  // ROM (.zip file)
                     15, 16, 17: Result:= 2;  // Disc
                     18, 19, 20: Result:= 3;  // Compact Flash Card
                     21, 22, 23: Result:= 14; // Video Tape (VHS)
                   else
                      Result:= 1;
                   end;
                 end;
            end
         else
            Result:= eFileType+4; // game config files
       end;
     end
  else
     Result:= -1;
end;

procedure TFormDeleteGamesFiles.ChangeCheckBoxColor(Enabled: Boolean; CheckBoxHolder: TAdvOfficeCheckBox);
var
  Item: TEasyItem;
  sFileType: Integer;
begin
  if IsNightMode then
  begin
    if Enabled then
       SetCheckBoxColors(CheckBoxHolder, MsgTxtColors.colorFileName, clNavy)
    else
       SetCheckBoxColors(CheckBoxHolder, clMedGray, clBlack);
  end
  else
  begin
    if Enabled then
       CheckBoxHolder.Font.Color:= MsgTxtColors.colorFileName// $00a65300 //clNavy
    else
       CheckBoxHolder.Font.Color:= clGray;//$00e6e6e6;
  end;

  if CheckBoxHolder.Tag = -1 then
     Exit; // for "Delete Game From Games List"; this one shouldn't do anything to the files list
  if not FormMain.CheckTotal(FilesListView) then
     Exit;
  Item:= FilesListView.Groups.FirstItem;
  if Item = nil then
     Exit;

  if not FormMain.MemGameInfo.eIsCustomGame then
     begin
       sFileType:= CheckBoxHolder.HelpContext;
       if sFileType = 2 then
          sFileType:= -1; // correct config file type... to support an older EL games list!!!
     end;

  FilesListView.BeginUpdate;
  repeat
    if FormMain.MemGameInfo.eIsCustomGame then
       begin
         Item.Checked:= Enabled;
       end
    else
       begin
         if TGameInfo(Item).eMediaType = sFileType then
            Item.Checked:= Enabled;
       end;
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
      FormMain.AddDefaultIcons(aMediaType[Loop, 1]+'.ico', Folder, IL_MediaType); // zipfile.ico and chd.ico

  FormMain.AddDefaultIcons('media_disc.ico', Folder, IL_MediaType);      // 2
  FormMain.AddDefaultIcons('media_flashcard.ico', Folder, IL_MediaType); // 3

  FormMain.AddDefaultIcons('settings.ico', Folder, IL_MediaType);        // 4
  FormMain.AddDefaultIcons('bios_chip.ico', Folder, IL_MediaType);       // 5
  FormMain.AddDefaultIcons('bios_chip.ico', Folder, IL_MediaType);       // 6
  FormMain.AddDefaultIcons('bios_chip.ico', Folder, IL_MediaType);       // 7
  FormMain.AddDefaultIcons('bios_chip.ico', Folder, IL_MediaType);       // 8

  for Loop:= 1 to Length(MediaTypeCustom) do
      FormMain.AddDefaultIcons(MediaTypeCustom[Loop, 1], Folder, IL_MediaType); // 9..13

  FormMain.AddDefaultIcons('media_vhs.ico', Folder, IL_MediaType);       // 14
end;

procedure TFormDeleteGamesFiles.AddFiles;
var
  addItem: TEasyItem;
  FileFullPath: WideString;
  GameIsMerged, IsZiNcSystem: Boolean;
  Loop: Integer;
  FileID: ShortInt;
  chdParentName, DiskFile, ChecksumCHD, romName, romCRC32, romSHA1, romDeviceName: String;
  HeaderVerCHD: Byte;
begin
  IsZiNcSystem:= FormMain.MemGameInfo.eSystemID = idZiNc;
  ZiNcFilePath:= '';
  FileFullPath:= '';

  GameIsMerged:= False;
  case FormMain.MemGameInfo.eIsCustomGame of
    True:
      begin
        FormMain.SearchGameFile(FormMain.MemGameInfo.eName, FormMain.MemGameInfo.eCustomSystemID, FormMain.MemGameInfo.eCustomMediaType, False, False, FileFullPath);
      end;
    False:
      begin
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

      end;
  end;

  if FileFullPath <> '' then
     begin
       // add .zip file
       addItem:= FilesListView.Items.AddCustom(TGameInfo, nil);
       TGameInfo(addItem).eSystemID:= FormMain.MemGameInfo.eSystemID;
       TGameInfo(addItem).eCustomSystemID:= FormMain.MemGameInfo.eCustomSystemID;
       TGameInfo(addItem).eROMIdentification:= FormMain.MemGameInfo.eROMIdentification;
       TGameInfo(addItem).eMediaType:= 0;
       TGameInfo(addItem).eCustomMediaType:= FormMain.MemGameInfo.eCustomMediaType;
       TGameInfo(addItem).eFileType:= 0;
       TGameInfo(addItem).eSoftwareName:= FormMain.MemGameInfo.eSoftwareName;
       TGameInfo(addItem).eMerged:= GameIsMerged;
       TGameInfo(addItem).eFileName:= FileFullPath;
       TGameInfo(addItem).eFileSize:= GetFileSizeW(FileFullPath);
       TGameInfo(addItem).eFileSizeText:= FormMain.GetSizeType(TGameInfo(addItem).eFileSize, False);
       TGameInfo(addItem).eDateTimeText:= FormMain.GetDateTimeStr(FileAgeW(FileFullPath));
       TGameInfo(addItem).eParentFile:= GameIsMerged;
       TGameInfo(addItem).eHeaderVerCHD:= 0;
       TGameInfo(addItem).eIsCustomGame:= FormMain.MemGameInfo.eIsCustomGame;
       TGameInfo(addItem).eIsUnicode:= FormMain.MemGameInfo.eIsUnicode;
       if IsZiNcSystem then
          ZiNcFilePath:= ExtractFilePathW(FileFullPath);
       addItem.Details[1]:= 1;
       addItem.Details[2]:= 2;
       if FormMain.MemGameInfo.eIsCustomGame then
          addItem.Checked:= Boolean(DeleteGameFileFromDisk.Checked) // for console/computer systems only
       else
          addItem.Checked:=  Boolean(DeleteROMs.Checked); // for MAME and arcade systems only
       if not addItem.Checked then
          addItem.State:= addItem.State+[esosGhosted];
     end;

  case FormMain.MemGameInfo.eIsCustomGame of
    True:
      begin

      end;
    False:
      begin
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
                   FormMain.GetROMDetailsInfo(DiskFile, FormMain.GameIsClone(uMain.TEasyGameInfo(FormMain.SelectedEasyItem).eName), romName, romCRC32, romSHA1, chdParentName, romDeviceName);
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
                             TGameInfo(addItem).eCustomSystemID:= FormMain.MemGameInfo.eCustomSystemID;
                             TGameInfo(addItem).eMediaType:= 1;
                             TGameInfo(addItem).eCustomMediaType:= FormMain.MemGameInfo.eCustomMediaType;
                             TGameInfo(addItem).eFileType:= FileID;
                             TGameInfo(addItem).eSoftwareName:= FormMain.MemGameInfo.eSoftwareName;
                             TGameInfo(addItem).eMerged:= False;
                             TGameInfo(addItem).eFileName:= DiskFile;
                             TGameInfo(addItem).eFileSize:= GetFileSizeW(DiskFile);
                             TGameInfo(addItem).eFileSizeText:= FormMain.GetSizeType(TGameInfo(addItem).eFileSize, False);
                             TGameInfo(addItem).eDateTimeText:= FormMain.GetDateTimeStr(FileAgeW(DiskFile));
                             TGameInfo(addItem).eParentFile:= FormMain.GameIsClone(FormMain.MemGameInfo.eClone) and (not SameText(romName, ExtractFileNameW(DiskFile)));
                             TGameInfo(addItem).eHeaderVerCHD:= HeaderVerCHD;
                             TGameInfo(addItem).eIsCustomGame:= FormMain.MemGameInfo.eIsCustomGame;
                             TGameInfo(addItem).eIsUnicode:= FormMain.MemGameInfo.eIsUnicode;
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
  FormCopyMoveGameFiles.AddSystemFolder:= CopyMoveAddSystemFolder.Checked;

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
          TGameInfo(addItem).eCustomSystemID:= FormMain.MemGameInfo.eCustomSystemID;
          TGameInfo(addItem).eMediaType:= -1; // for config files
          TGameInfo(addItem).eFileType:= FileType;
          TGameInfo(addItem).eSoftwareName:= FormMain.MemGameInfo.eSoftwareName;
          TGameInfo(addItem).eMerged:= False;
          TGameInfo(addItem).eFileName:= FileFullPath;
          TGameInfo(addItem).eFileSize:= GetFileSizeW(FileFullPath);
          TGameInfo(addItem).eFileSizeText:= FormMain.GetSizeType(TGameInfo(addItem).eFileSize, False);
          TGameInfo(addItem).eDateTimeText:= FormMain.GetDateTimeStr(FileAgeW(FileFullPath));
          TGameInfo(addItem).eParentFile:= False;
          TGameInfo(addItem).eHeaderVerCHD:= 0;
          TGameInfo(addItem).eIsCustomGame:= FormMain.MemGameInfo.eIsCustomGame;
          TGameInfo(addItem).eIsUnicode:= FormMain.MemGameInfo.eIsUnicode;
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
           TGameInfo(addItem).eCustomSystemID:= FormMain.MemGameInfo.eCustomSystemID;
           TGameInfo(addItem).eMediaType:= -1; // for config files
           TGameInfo(addItem).eCustomMediaType:= FormMain.MemGameInfo.eCustomMediaType;
           TGameInfo(addItem).eFileType:= fixFileType;
           TGameInfo(addItem).eSoftwareName:= FormMain.MemGameInfo.eSoftwareName;
           TGameInfo(addItem).eMerged:= False;
           TGameInfo(addItem).eFileName:= nvram_MAME[Loop];
           TGameInfo(addItem).eFileSize:= GetFileSizeW(nvram_MAME[Loop]);
           TGameInfo(addItem).eFileSizeText:= FormMain.GetSizeType(TGameInfo(addItem).eFileSize, False);
           TGameInfo(addItem).eDateTimeText:= FormMain.GetDateTimeStr(FileAgeW(nvram_MAME[Loop]));
           TGameInfo(addItem).eParentFile:= False;
           TGameInfo(addItem).eHeaderVerCHD:= 0;
           TGameInfo(addItem).eIsCustomGame:= FormMain.MemGameInfo.eIsCustomGame;
           TGameInfo(addItem).eIsUnicode:= FormMain.MemGameInfo.eIsUnicode;
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
begin
  FormMain.CheckSevenZip(FormMain.MemGameInfo.eSystemID);
  FormMain.ELV_ResetNormalColors(FilesListView);

  FormMain.LoadGameIconIntoImage(FormMain.MemGameInfo.eSystemID, FormMain.MemGameInfo.eCustomSystemID, FormMain.MemGameInfo.eROMIdentification, SystemIcon, FormMain.MemGameInfo.eSoftwareName, FormMain.MemGameInfo.eIsCustomGame);
  case FormMain.MemGameInfo.eIsCustomGame of
    True:
      begin
        //FormMain.IL_StandardIconsExtraLarge.GetIcon(MaxGameID+FormMain.MemGameInfo.eCustomSystemID, SystemIcon.Picture.Icon);
        FormMain.IL_MainMenuOptions.GetIcon(15, GameIcon.Picture.Icon);

        FileTypesGroupBox.Visible:= False;
        DeleteGameFromGamesList.Left:= 8;
        DeleteGameFileFromDisk.Left:= 8;
        DeleteGameFileFromDisk.Visible:= True;
        DeleteGameFromGamesList.Visible:= True;
        DeleteGameFileFromDisk.Enabled:= ActionMode = 0;
        DeleteGameFromGamesList.Enabled:= ActionMode = 0;
        //FormMain.IL_PopupPlayCustomEmulators.GetIcon(FormMain.MemGameInfo.eCustomMediaType+11, GameIcon.Picture.Icon);
        // not used here...//FormMain.GetMediaTypeIconMsgBox(FormMain.MemGameInfo.eCustomMediaType, FormMain.MemGameInfo.eIsCustomGame, FormMain.MemGameInfo.eMediaType, GameIcon, FormMain.MemGameInfo.eSoftwareExecParameter);
      end;
    False:
      begin
        //FormMain.IL_StandardIconsExtraLarge.GetIcon(FormMain.GetMAMEImageIndex(FormMain.MemGameInfo.eROMIdentification, FormMain.MemGameInfo.eSoftwareName),
        //                                            SystemIcon.Picture.Icon);
        FormMain.IL_ArcadeSystem_Small.GetIcon(FormMain.MemGameInfo.eSystemID, GameIcon.Picture.Icon);
      end;
  end;
  
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
       ButtonHelp.Left:= ButtonHelp.Left-HeightDiff;
       FilesListView.Width:= FilesListView.Width-HeightDiff;
       FilesListView.CellSizes.Tile.Width:= FilesListView.CellSizes.Tile.Width-HeightDiff;
       CopyMoveAddSystemFolder.Caption:= 'Add Sys Folder';
       FormDeleteGamesFiles.Width:= FormDeleteGamesFiles.Width-HeightDiff;
     end
  else
  if ScreenHighRes then
     begin
       HeightDiff:= FilesListView.CellSizes.Tile.Height*2;
       FilesListView.Height:= FilesListView.Height+HeightDiff;
       FormDeleteGamesFiles.Height:= FormDeleteGamesFiles.Height+HeightDiff;
     end;

  case FormMain.MemGameInfo.eIsCustomGame of
    True:
      begin
        LabelGameStatus.Visible:= False;
        LabelGameDetails.Caption:= SystemsListCustom[FormMain.MemGameInfo.eCustomSystemID, 0]+#13#10+
                                   GetSystemTypeTitle(FormMain.MemGameInfo.eCustomSystemID, False);
        //LabelGameDetails.Caption:= SystemsListCustom[FormMain.MemGameInfo.eCustomSystemID, 0]; // MediaTypeCustom[FormMain.MemGameInfo.eCustomMediaType, 0]+'; file extension '+ExtractFileExtW(FormMain.MemGameInfo.eName);
        LabelEmulatorVersion.Visible:= False;
        //LabelGameDetails.Top:= LabelGameDetails.Top+7;
      end;
    False:
      begin
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

        LabelGameStatus.Caption:= LabelGameStatus.Hint+#13#10+FormMain.GetGameStatusText(FormMain.MemGameInfo.eGameSetStatus, FormMain.MemGameInfo.eROMIdentification);
      end;
  end;

  GameChanged:= False;
  //LabelGameStatus.Caption:= LabelGameStatus.Hint+#13#10+FormMain.GetGameStatusText(FormMain.MemGameInfo.eGameSetStatus, FormMain.MemGameInfo.eROMIdentification);

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

  ChangeCheckBoxColor(DeleteROMs.Checked, DeleteROMs);
  ChangeCheckBoxColor(DeleteCHDs.Checked, DeleteCHDs);
  ChangeCheckBoxColor(DeleteCFGsNVRAMs.Checked, DeleteCFGsNVRAMs);

  ChangeCheckBoxColor(DeleteGameFromGamesList.Checked, DeleteGameFromGamesList);
  ChangeCheckBoxColor(DeleteGameFileFromDisk.Checked, DeleteGameFileFromDisk);

  if IsNightMode then
  begin
    SetFormColors(FormDeleteGamesFiles, TopBar, BottomBar, LabelGameTitle, LabelGameDetails, FormMain.MemGameInfo.eGameSetStatus);
    SetLabelColors(LabelGameDetails, LabelGameDetails.Font.Color, LabelGameDetails.ShadowColor);
    SetLabelColors(LabelEmulatorVersion, LabelGameDetails.Font.Color, LabelGameDetails.ShadowColor);
    SetLabelColors(LabelSoftwareList, LabelGameDetails.Font.Color, LabelGameDetails.ShadowColor);
                                        // 200,83,0   200,200,0
    SetLabelColors(LabelSoftwareListTitle, $000053e6, clMaroon);//$0040d6d6);
    SetLabelColors(LabelGameStatus, MsgTxtColors.colorMachineName, clNavy);
    FilesListView.Color:= FormDeleteGamesFiles.Color;
    FilesListView.Font.Color:= clWhite;
    FilesListView.HotTrack.Color:= clWhite;

    PanelDestinationFolder.Color1:= FormDeleteGamesFiles.Color;
    SetLabelColors(LabelCopyMoveDestination, LabelGameDetails.Font.Color, LabelGameDetails.ShadowColor);
    DestinationFolder.Color:= FormDeleteGamesFiles.Color;
    DestinationFolder.Font.Color:= clWhite;

    SetCheckBoxColors(CopyMoveOverwriteFiles, clWhite, clBlue);
    SetCheckBoxColors(CopyMoveAddSystemFolder, clWhite, clBlue);

    FileTypesGroupBox.BorderStyle:= bsDualColors;
    SetGroupBoxColors(FileTypesGroupBox, $00ff9933, clBlue, clWhite, clNavy);

    SetLabelColors(LabelTotalFiles, MsgTxtColors.colorFileName, clNavy);
    SetLabelColors(LabelTotalFilesChecked, MsgTxtColors.colorFileName, clNavy);
  end;

  SetColorsGameTopBar(FormMain.MemGameInfo.eGameSetStatus, TopBar, False); // change top bar color based on game set status
  
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

  if FilesListView.Scrollbars.VertBarVisible then
     begin
       FilesListView.CellSizes.Tile.Width:= FilesListView.CellSizes.Tile.Width-GetSystemMetrics(SM_CXVSCROLL);
       FilesListView.HotTrack.Enabled:= False; // disable to fix hot track painting bug
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
        case FormMain.MemGameInfo.eIsCustomGame of
          True:
            begin
              FormMain.EnableMsgMediaTypeLabel(False);
              FormMain.AddMsgText('System   ', MsgTxtColors.colorKeyTitle, [fsItalic, fsBold], taCenter);
              FormMain.AddMsgText(SystemsListCustom[FormMain.MemGameInfo.eCustomSystemID, 0]+#13#10, MsgTxtColors.colorKeyValue, [fsItalic, fsBold], taCenter);
              case FormMain.MemGameInfo.eIsUnicode of
                True : FormMain.AddMsgText('    Game file');
                False:
                  begin
                    FormMain.AddMsgText('    File ');
                    FormMain.AddMsgText(FormMain.MemGameInfo.eName, MsgTxtColors.colorFileName, [fsBold]);
                  end;
              end;
              FormMain.AddMsgText(' was not found to ');
              FormMain.AddMsgText(LowerCase(ActionString), MsgTxtColors.colorFileName, [fsBold]);
            end;
          False:
            begin
              FormMain.ShowGameNameEntryMsgBox;
              FormMain.AddMsgText('Emulator   ', MsgTxtColors.colorKeyTitle, [fsItalic, fsBold], taCenter);
              FormMain.AddMsgText(FormMain.EmulatorVersion[FormMain.MemGameInfo.eSystemID]+#13#10, MsgTxtColors.colorKeyValue, [fsItalic, fsBold], taCenter);
              FormMain.AddMsgText(FormMain.EmulatorFile[FormMain.MemGameInfo.eSystemID]+#13#10+#13#10, clBlack, [fsBold], taCenter);

              if FormMain.MemGameInfo.eSoftwareName <> '' then
                 begin
                   FormMain.AddMsgText('Software List   ', MsgTxtColors.colorKeyTitle, [fsItalic, fsBold], taCenter);
                   FormMain.AddMsgText(FormMain.MemGameInfo.eCategory+#13#10+#13#10, clGray, [fsItalic, fsBold], taCenter, 9);
                 end;

              if uMain.TEasyGameInfo(FormMain.SelectedEasyItem).eROMInfo <> nil then
                 begin
                   FormMain.AddMsgText('    No files were found to ');
                   FormMain.AddMsgText(LowerCase(ActionString), MsgTxtColors.colorFileName, [fsBold]);
                 end
              else
                 begin
                   FormMain.AddMsgText('    This game does not use any ROMs. There are no extra files to ');
                   FormMain.AddMsgText(LowerCase(ActionString), MsgTxtColors.colorFileName, [fsBold]);
                 end;
            end;
        end;
        FormMain.AddMsgText('.');

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
        ACanvas.Font.Color:= MsgTxtColors.colorWarning;//clMaroon;
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
          ACanvas.Font.Color:= $00707070 // (112, 112, 112) // clSilver
       else
          ACanvas.Font.Color:= $00464646; // (70, 70, 70) //clMedGray;
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
             FormMain.AddMsgText('    There was an error trying to detect the required free space in destination path (');
             FormMain.AddMsgText(FileTypeStr, MsgTxtColors.colorFileName, [fsBold]);
             FormMain.AddMsgText('.'#13#10+#13#10+'Error code '+IntToStr(ErrorMsg)+': ');
             FormMain.AddMsgText(SysErrorMessage(ErrorMsg), MsgTxtColors.colorExitCode, [fsBold]);
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
             FormMain.AddMsgText(FileTypeStr, MsgTxtColors.colorFileName, [fsBold]);
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
  FormMain.AddMsgText(LowerCase(ActionString), MsgTxtColors.colorFileName, [fsBold]);
  FormMain.AddMsgText(' the checked files of the selected game.'+#13#10+'Click ');
  FormMain.AddMsgText('No', MsgTxtColors.colorFileName, [fsBold]);
  FormMain.AddMsgText(' button if you want to go back and review the files or click ');
  FormMain.AddMsgText('Yes', MsgTxtColors.colorFileName, [fsBold]);
  FormMain.AddMsgText(' button to confirm.'+#13#10+#13#10);
  FormMain.AddMsgText(ActionString+' files. ');
  FormMain.AddMsgText('Are you sure ?', MsgTxtColors.colorWarning, [fsBold, fsItalic]);

  if GenerateMessage(FormDeleteGamesFiles.Caption, FormMain.MemGameInfo.eTitle, '', 1, True, -1) = mrNo then
     Exit;
     
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
  ChangeCheckBoxColor(TAdvOfficeCheckBox(Sender).Checked, TAdvOfficeCheckBox(Sender));
  if FormDeleteGamesFiles.Visible then
     FilesListView.SetFocus;
end;

procedure TFormDeleteGamesFiles.ButtonSelectROMsFolderClick(
  Sender: TObject);
begin
  FormMain.DialogSelectFolder(DestinationFolder, False);
end;

procedure TFormDeleteGamesFiles.ButtonHelpClick(Sender: TObject);
begin
  CallMessageBox;
  FormMain.AddMsgText('    You can choose what files will be processed in the ');
  FormMain.AddMsgText('Check Arcade File Types To '+ActionString, MsgTxtColors.colorFileName, [fsBold]);
  FormMain.AddMsgText(' group box. These settings are for ');
  FormMain.AddMsgText('MAME and arcade', clBlack, [fsBold, fsItalic]);
  FormMain.AddMsgText(' systems only!'+#13#10+
                      '    You can manually check of uncheck each listed file to be ');
  FormMain.AddMsgText(LowerCase(ActionString), MsgTxtColors.colorFileName, [fsBold]);
  FormMain.AddMsgText('. Doing so, settings from the file type panel are ignored.'+#13#10+
                      '    To delete game files of ');
  FormMain.AddMsgText('console/computer/handheld', clBlack, [fsBold, fsItalic]);
  FormMain.AddMsgText(' systems, check ');
  FormMain.AddMsgText('Delete Game File From Disk', MsgTxtColors.colorFileName, [fsBold]);
  FormMain.AddMsgText(' option (not compatible with MAME and arcade games).'+#13#10+#13#10+
                      '    If you want to delete ');
  FormMain.AddMsgText('console/computer/handheld', clBlack, [fsBold, fsItalic]);
  FormMain.AddMsgText(' games from main games list (why wouldn''t you ?), check ');
  FormMain.AddMsgText('Delete Game From Games List', MsgTxtColors.colorFileName, [fsBold]);
  FormMain.AddMsgText('. This option is not compatible with MAME and arcade games.'+#13#10+#13#10+
                      '    To ');
  FormMain.AddMsgText(LowerCase(ActionString), MsgTxtColors.colorFileName, [fsBold]);
  FormMain.AddMsgText(' files, click ');
  FormMain.AddMsgText(ActionString+' Files', MsgTxtColors.colorFileName, [fsBold]);
  FormMain.AddMsgText(' button. You can follow the progress in a detailed dialog box. If there are errors, they will be listed in the log '+
                      'panel.'+#13#10+#13#10);

  case ActionMode of
    0: FormMain.AddMsgText('    When deleting files, if there are changes in arcade games, you will be prompted to update the main games list. '+
                           'Be aware that recycle bin is not supported. Files cannot be recovered afterwards.'+#13#10+#13#10);
    1, 2:
      begin
        FormMain.AddMsgText('    When copying/moving files, MAME and arcade CHD files are sent to a ');
        FormMain.AddMsgText('\chd_files\', MsgTxtColors.colorFileName, [fsBold]);
        FormMain.AddMsgText(' sub-folder and MAME software list game files are sent to a ');
        FormMain.AddMsgText('\softlistname\', MsgTxtColors.colorFileName, [fsBold]);
        FormMain.AddMsgText(' sub-folder.'+#13#10+#13#10+
                            '    Console/computer/handheld games files are sent to a ');
        FormMain.AddMsgText('\system_name\media_type_name\', MsgTxtColors.colorFileName, [fsBold]);
        FormMain.AddMsgText(' sub-folder. You can find more details in ');
        FormMain.AddMsgText(FormMain.GetFolderFull(37)+'systemsfolders.txt', MsgTxtColors.colorFileName, [fsBold]);
        FormMain.AddMsgText(' file.');
      end;
  end;

  GenerateMessage('Help', 'Things you can do here.', '', 2);
  FilesListView.SetFocus;
end;


end.
