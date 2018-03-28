unit uDeleteMultipleGamesViewFiles;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, MPCommonObjects, EasyListview, ExtCtrls,
  ImgList, IniFiles, FileCtrl, PanelEx, ShadowLabel, uCommon, uCommonCustom,
  Buttons;

type
  TViewFileInfo = class(TEasyItemStored)
  private
    // MAME based (0 -> CFG; >= 1 -> NVRAM, EEPROM, FLASH and maybe others (MAME gamename config folder);
    // ZiNc (0 -> CFG);
    // SEGA Model 2 (0; INPUT; 1 -> NVDATA);
    // Demul (2 -> EEPROM; 3 -> SRAM; 4 -> FLASH);
    // Supermodel: SEGA Model 3 ( 1 -> NVRAM);
    fSystemID: ShortInt;
    fCustomSystemID: ShortInt;
    fROMIdentification: Integer;
    fMediaType: ShortInt; // 0 -> ROM; >= 1 -> CHD (for ROMs and CHD only)... -1 -> game config file
    fCustomMediaType: ShortInt; // 0 -> ROM; 1 -> Cartridge; 2 -> Disc Image; 3 -> Floppy; 4 -> Cassette; 5 -> Hard Disk Drive
    fFileType: ShortInt; // cfg; nvram; eeprom (game config files)
                         // 12, 13, 14 -> HDD/general CHD;  15, 16, 17 -> CD;  18, 19, 20 -> Compact Flash Card
    {fName: String;
    fClone: String;
    fDriverName: String;
    fBiosName : String;}
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
    fCustomGameFileFullPath: WideString;
    fCustomGameFileShowText: WideString;
  protected
    function GetCaptions(Column: Integer): WideString; override;
    function GetImageIndexes(Column: Integer): TCommonImageIndexInteger; override;
  public
    property eSystemID: ShortInt read fSystemID write fSystemID;
    property eCustomSystemID: ShortInt read fCustomSystemID write fCustomSystemID;
    property eROMIdentification: Integer read fROMIdentification write fROMIdentification;
    property eMediaType: ShortInt read fMediaType write fMediaType;
    property eCustomMediaType: ShortInt read fCustomMediaType write fCustomMediaType; // 0 -> ROM; 1 -> Cartridge; 2 -> Disc Image; 3 -> Floppy; 4 -> Cassette; 5 -> Hard Disk Drive
    property eFileType: ShortInt read fFileType write fFileType;
    {property eName: String read fName write fName;
    property eClone: String read fClone write fClone;
    property eDriverName: String read fDriverName write fDriverName;
    property eBiosName: String read fBiosName write fBiosName;}
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
    property eCustomGameFileFullPath: WideString read fCustomGameFileFullPath write fCustomGameFileFullPath;
    property eCustomGameFileShowText: WideString read fCustomGameFileShowText write fCustomGameFileShowText;
  end;

  TViewGameInfoGroup = class(TEasyGroupStored)
  private
    fSystemID: ShortInt;
    fCustomSystemID: ShortInt;
    fROMIdentification: Integer;
    fMediaType: ShortInt;
    fCustomMediaType: ShortInt; // 0 -> ROM; 1 -> Cartridge; 2 -> Disc Image; 3 -> Floppy; 4 -> Cassette; 5 -> Hard Disk Drive
    fTitle: WideString;
    fName: WideString;
    fClone: String;
    fCloneParent: String;
    fMerged: Boolean;
    fHaveROMsArcade, fHaveCHDsArcade, fHaveCFGsArcade: Boolean;
    fDriverStatus: ShortInt;
    fBiosName: String;
    fSoftwareName: String;
    fGameStatus: ShortInt;
    fIsCustomGame: Boolean;
  protected
    function GetCaptions(Column: Integer): WideString; override;
    //function GetImageIndexes(Column: Integer): TCommonImageIndexInteger; override;
    //function GetStateImageIndexes(Column: Integer): TCommonImageIndexInteger; override;
  public
    property eSystemID: ShortInt read fSystemID write fSystemID;
    property eCustomSystemID: ShortInt read fCustomSystemID write fCustomSystemID;
    property eROMIdentification: Integer read fROMIdentification write fROMIdentification;
    property eMediaType: ShortInt read fMediaType write fMediaType;
    property eCustomMediaType: ShortInt read fCustomMediaType write fCustomMediaType; // 0 -> ROM; 1 -> Cartridge; 2 -> Disc Image; 3 -> Floppy; 4 -> Cassette; 5 -> Hard Disk Drive
    property eTitle: WideString read fTitle write fTitle;
    property eName: WideString read fName write fName;
    property eClone: String read fClone write fClone;
    property eCloneParent: String read fCloneParent write fCloneParent;
    property eMerged: Boolean read fMerged write fMerged;
    property eHaveROMsArcade: Boolean read fHaveROMsArcade write fHaveROMsArcade;
    property eHaveCHDsArcade: Boolean read fHaveCHDsArcade write fHaveCHDsArcade;
    property eHaveCFGsArcade: Boolean read fHaveCFGsArcade write fHaveCFGsArcade;
    property eDriverStatus: ShortInt read fDriverStatus write fDriverStatus;
    property eBiosName: String read fBiosName write fBiosName;
    property eSoftwareName: String read fSoftwareName write fSoftwareName;
    property eGameStatus: ShortInt read fGameStatus write fGameStatus; // 0 - have 1 - miss; 2 - missing ROMs/CHDs
    property eIsCustomGame: Boolean read fIsCustomGame write fIsCustomGame;
  end;

type
  TFormDeleteMultipleGamesViewFiles = class(TForm)
    FilesListView: TEasyListview;
    IL_MediaType: TImageList;
    BottomBar: TPanelEx;
    LabelTotalItems: TShadowLabel;
    ButtonShowFileTypes: TBitBtn;
    LabelGhostedFiles: TShadowLabel;
    ButtonClose: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure FilesListViewItemPaintText(Sender: TCustomEasyListview;
      Item: TEasyItem; Position: Integer; ACanvas: TCanvas);
    procedure FilesListViewKeyAction(Sender: TCustomEasyListview;
      var CharCode: Word; var Shift: TShiftState; var DoDefault: Boolean);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FilesListViewGroupImageDraw(Sender: TCustomEasyListview;
      Group: TEasyGroup; ACanvas: TCanvas;
      const RectArray: TEasyRectArrayObject;
      AlphaBlender: TEasyAlphaBlender);
    procedure FilesListViewGroupImageDrawIsCustom(
      Sender: TCustomEasyListview; Group: TEasyGroup;
      var IsCustom: Boolean);
    procedure ButtonShowFileTypesClick(Sender: TObject);
  private
    { Private declarations }
    procedure LoadMediaIcons;
    procedure AddGames(var GroupToFocus: TEasyGroup);
    procedure UpdateTotalFilesLabel;
  public
    { Public declarations }
  end;

var
  FormDeleteMultipleGamesViewFiles: TFormDeleteMultipleGamesViewFiles;

implementation

uses uMain, uStatus, uDeleteMultipleGamesFiles;

{$R *.dfm}

function TViewFileInfo.GetCaptions(Column: Integer): WideString;
var
  extraStr: String;
  ExtraCount, VertBar: Integer;
begin
  case Column of
    0:
      begin
        if eIsCustomGame then
           Result:= FormMain.GetFileTypeText(eCustomSystemID, eMediaType, eFileType, eIsCustomGame, eCustomMediaType)
        else
           Result:= FormMain.GetFileTypeText(eSystemID, eMediaType, eFileType, not eIsCustomGame, eCustomMediaType);
      end;
    1:
      begin
        extraStr:= '';
        if not eIsCustomGame then
        begin
          //if eMediaType = 0 then
          if not FormMain.IsMediaTypeCHD(eMediaType, False) then
             begin
               if eMerged then
                  extraStr:= 'Merged Set';
             end
          else
             begin
               if (not FormMain.IsROM_Bios(eROMIdentification)) and (not FormMain.IsROM_Device(eROMIdentification)) then
               begin
                 if FormMain.IsFileID_DeviceCHD(eFileType) then
                    extraStr:= 'Device'
                 else
                 if FormMain.IsFileID_BiosCHD(eFileType) then
                    extraStr:= 'Bios';
                 //case eFileType of
                 //  13, 16, 19, 22: extraStr:= 'Device';
                 //  14, 17, 20, 23: extraStr:= 'Bios';
                 //end;
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
        case FormDeleteMultipleGamesViewFiles.FilesListView.Scrollbars.VertBarVisible of
          True : VertBar:= 2;
          False: VertBar:= 0;
        end;
        ExtraCount:= 71-VertBar;
        if extraStr <> '' then
           begin
             extraStr:= '['+extraStr+'] ';
             ExtraCount:= ExtraCount-Length(extraStr);
           end;

        case eIsCustomGame of
          True:
            begin
              if eCustomGameFileShowText = '' then
                 eCustomGameFileShowText:= WideFormat('%-'+IntToStr(ExtraCount)+'s', [ShortDirStringW(eFileName, ExtraCount)]);

              Result:= eCustomGameFileShowText;// WideFormat('%-'+IntToStr(ExtraCount)+'s', [ShortDirStringW(eCustomGameFileFullPath, ExtraCount)]);
              //Result:= WideFormat('%-'+IntToStr(ExtraCount)+'s', [ShortDirStringW(eFileName, ExtraCount)]);
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

        //Result:= Format(extraStr+'%-'+IntToStr(ExtraCount)+'s', [ShortDirString(eFileName, ExtraCount)]);
      end;
    2:
      begin
        Result:= 'Size: '+eFileSizeText;
        Result:= Result+'  Date Modified: '+eDateTimeText; // Format('  Date/Time: %s', [eDateTimeText]);
        if eMediaType > 0 then
           begin
             if eHeaderVerCHD > 0 then
                Result:= Result+'  [Header v'+IntToStr(eHeaderVerCHD)+']'
             else
                Result:= Result+ '  [Invalid Header]';
           end;
      end;
  end;
end;

function TViewFileInfo.GetImageIndexes(Column: Integer): TCommonImageIndexInteger;
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
              // rom or CHD files
              case FormMain.IsMediaTypeCHD(eMediaType, False) of
                True:
                  begin
                    case eFileType of
                      12, 13, 14: Result:= eMediaType;
                      15, 16, 17: Result:= eMediaType+1;
                      18, 19, 20: Result:= eMediaType+2;
                      21, 22, 23: Result:= 14; // this will need to be updated!!! (December 28, 2017)
                    end;
                  end;
                False:
                  begin
                    Result:= eMediaType;
                  end;
              end;

              //case eMediaType of
              //  0: Result:= eMediaType;
              //  1:
              //    begin
              //      case eFileType of
              //        12, 13, 14: Result:= eMediaType;
              //        15, 16, 17: Result:= eMediaType+1;
              //        18, 19, 20: Result:= eMediaType+2;
              //      end;
              //    end;
              //end;
            end
         else
            Result:= eFileType+4; // game config files
       end;
     end
  else
     Result:= -1;
end;

function TViewGameInfoGroup.GetCaptions(Column: Integer): WideString;
begin
  if Column = 0 then
     Result:= eTitle
  else
     Result:= ''
end;

procedure TFormDeleteMultipleGamesViewFiles.LoadMediaIcons;
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

  FormMain.AddDefaultIcons('media_vhs.ico', Folder, IL_MediaType); // 14
end;

procedure TFormDeleteMultipleGamesViewFiles.AddGames(var GroupToFocus: TEasyGroup);
var
  Item, addItem: TEasyItem;
  addGroup: TEasyGroup;
  Loop, tmpMediaType, tmpFileType, IsParentCHD, selIndex: Integer;
  ChecksumCHD, tmpStr: String;
  tmpFileName: WideString;
  GroupGameTitle: WideString;
  GroupSoftwareName: String;
  HeaderVerCHD: Byte;
  GhostItem: Boolean;
begin
  selIndex:= 1;
  case FormDeleteMultipleGamesViewFiles.Tag of
    0: Item:=  FormDeleteMultipleGamesFiles.GamesList.Groups.FirstItem; // all games
    1: Item:=  FormDeleteMultipleGamesFiles.GamesList.Selection.First; // all games
  end;
  GroupToFocus:= nil;
  if Item = nil then
  begin
    GroupGameTitle:= '';
    GroupSoftwareName:= '';
  end
  else
  begin
    GroupGameTitle:= uDeleteMultipleGamesFiles.TGameInfo(Item).eTitle;
    GroupSoftwareName:= uDeleteMultipleGamesFiles.TGameInfo(Item).eSoftwareName;
  end;
  repeat
    addGroup:= FilesListView.Groups.AddCustom(TViewGameInfoGroup, nil);

    TViewGameInfoGroup(addGroup).eROMIdentification:= uDeleteMultipleGamesFiles.TGameInfo(Item).eROMIdentification;
    TViewGameInfoGroup(addGroup).eSystemID:= uDeleteMultipleGamesFiles.TGameInfo(Item).eSystemID;
    TViewGameInfoGroup(addGroup).eMediaType:= uDeleteMultipleGamesFiles.TGameInfo(Item).eMediaType;
    TViewGameInfoGroup(addGroup).eCustomSystemID:= uDeleteMultipleGamesFiles.TGameInfo(Item).eCustomSystemID;
    TViewGameInfoGroup(addGroup).eCustomMediaType:= uDeleteMultipleGamesFiles.TGameInfo(Item).eCustomMediaType;
    TViewGameInfoGroup(addGroup).eTitle:= uDeleteMultipleGamesFiles.TGameInfo(Item).eTitle;
    TViewGameInfoGroup(addGroup).eName:= uDeleteMultipleGamesFiles.TGameInfo(Item).eName;
    TViewGameInfoGroup(addGroup).eClone:= uDeleteMultipleGamesFiles.TGameInfo(Item).eClone;
    TViewGameInfoGroup(addGroup).eCloneParent:= uDeleteMultipleGamesFiles.TGameInfo(Item).eCloneParent;
    TViewGameInfoGroup(addGroup).eMerged:= uDeleteMultipleGamesFiles.TGameInfo(Item).eMerged;
    TViewGameInfoGroup(addGroup).eHaveROMsArcade:= uDeleteMultipleGamesFiles.TGameInfo(Item).eHaveROMsArcade;
    TViewGameInfoGroup(addGroup).eHaveCHDsArcade:= uDeleteMultipleGamesFiles.TGameInfo(Item).eHaveCHDsArcade;
    TViewGameInfoGroup(addGroup).eHaveCFGsArcade:= uDeleteMultipleGamesFiles.TGameInfo(Item).eHaveCFGsArcade;
    TViewGameInfoGroup(addGroup).eDriverStatus:= uDeleteMultipleGamesFiles.TGameInfo(Item).eDriverStatus;
    TViewGameInfoGroup(addGroup).eSoftwareName:= uDeleteMultipleGamesFiles.TGameInfo(Item).eSoftwareName;
    TViewGameInfoGroup(addGroup).eGameStatus:= uDeleteMultipleGamesFiles.TGameInfo(Item).eGameStatus;
    TViewGameInfoGroup(addGroup).eIsCustomGame:= uDeleteMultipleGamesFiles.TGameInfo(Item).eIsCustomGame;

    if GroupGameTitle <> '' then
       begin
         if GroupToFocus = nil then
         begin
           if (TViewGameInfoGroup(addGroup).eTitle = GroupGameTitle) and
              (TViewGameInfoGroup(addGroup).eSoftwareName = GroupSoftwareName) then
               GroupToFocus:= addGroup;
         end;
       end;

    // add files
    if uDeleteMultipleGamesFiles.TGameInfo(Item).eIsCustomGame then
    begin
      // for console/computer/handheld only (EmuCon)

      tmpFileName:= uDeleteMultipleGamesFiles.TGameInfo(Item).eCustomGameFileFullPath;
      addItem:= FilesListView.Items.AddCustom(TViewFileInfo, addGroup);
      TViewFileInfo(addItem).eROMIdentification:= TViewGameInfoGroup(addGroup).eROMIdentification;
      TViewFileInfo(addItem).eSystemID:= uDeleteMultipleGamesFiles.TGameInfo(Item).eSystemID;
      TViewFileInfo(addItem).eMediaType:= 0;
      TViewFileInfo(addItem).eCustomSystemID:= uDeleteMultipleGamesFiles.TGameInfo(Item).eCustomSystemID;
      TViewFileInfo(addItem).eCustomMediaType:= uDeleteMultipleGamesFiles.TGameInfo(Item).eCustomMediaType;
      TViewFileInfo(addItem).eFileType:= -1;
      TViewFileInfo(addItem).eSoftwareName:= uDeleteMultipleGamesFiles.TGameInfo(Item).eSoftwareName; // might not be needed!!
      TViewFileInfo(addItem).eGameStatus:= uDeleteMultipleGamesFiles.TGameInfo(Item).eGameStatus; // might not be needed!!
      TViewFileInfo(addItem).eFileName:= tmpFileName; // uDeleteMultipleGamesFiles.TGameInfo(Item).eName;
      TViewFileInfo(addItem).eFileSize:= GetFileSizeW(tmpFileName);
      TViewFileInfo(addItem).eFileSizeText:= FormMain.GetSizeType(TViewFileInfo(addItem).eFileSize, False);
      TViewFileInfo(addItem).eDateTimeText:= FormMain.GetDateTimeStr(FileAgeW(tmpFileName));
      TViewFileInfo(addItem).eMerged:= False; // always false
      TViewFileInfo(addItem).eParentFile:= False; // always false, used by CHDs only
      TViewFileInfo(addItem).eHeaderVerCHD:= 0;
      TViewFileInfo(addItem).eIsCustomGame:= True;
      TViewFileInfo(addItem).eIsUnicode:= uDeleteMultipleGamesFiles.TGameInfo(Item).eIsUnicode;
      TViewFileInfo(addItem).eCustomGameFileFullPath:= tmpFileName;
             
      addItem.Details[1]:= 1;
      addItem.Details[2]:= 2;
      GhostItem:= not FormDeleteMultipleGamesFiles.DeleteGameFileFromDisk.Checked;
      if GhostItem then
         addItem.State:= addItem.State+[esosGhosted]; // if showing ghosted files...
    end
    else
    begin
      // for MAME and arcade only
      if Assigned(uDeleteMultipleGamesFiles.TGameInfo(Item).eGameFiles) and
         (uDeleteMultipleGamesFiles.TGameInfo(Item).eGameFiles.Count > 0) then
         begin
           for Loop:=0 to uDeleteMultipleGamesFiles.TGameInfo(Item).eGameFiles.Count-1 do
           begin
             // 00 -> rom; 01 -> CHD; -1 -> config files
             // media_type FileID IsParentCHD filename
             // 01120 simpbowl.chd
             // 00000 elvator.rom
             // -1000 elvator.cfg

             tmpStr:= uDeleteMultipleGamesFiles.TGameInfo(Item).eGameFiles[Loop];
             tmpMediaType:= StrToInt(tmpStr[1]+tmpStr[2]);
             tmpFileType:= StrToInt(tmpStr[3]+tmpStr[4]);
             IsParentCHD:= StrToInt(tmpStr[5]);

             tmpFileName:= tmpStr;
             Delete(tmpFileName, 1, 6);

             addItem:= FilesListView.Items.AddCustom(TViewFileInfo, addGroup);
             TViewFileInfo(addItem).eROMIdentification:= TViewGameInfoGroup(addGroup).eROMIdentification;
             TViewFileInfo(addItem).eSystemID:= TViewGameInfoGroup(addGroup).eSystemID;
              // 0 - .cfg; .input
              // 1 - .dat; .nv; nvram
              // 2 - .eeprom
              // 3 - .sram
              // 4 - .flash
              // 12-20 CHD file IDs

             TViewFileInfo(addItem).eMediaType:= tmpMediaType;
             TViewFileInfo(addItem).eFileType:= tmpFileType;
             TViewFileInfo(addItem).eSoftwareName:= TViewGameInfoGroup(addGroup).eSoftwareName; // might not be needed!!
             TViewFileInfo(addItem).eGameStatus:= TViewGameInfoGroup(addGroup).eGameStatus; // might not be needed!!
             TViewFileInfo(addItem).eFileName:= tmpFileName;
             TViewFileInfo(addItem).eFileSize:= GetFileSize(tmpFileName);
             TViewFileInfo(addItem).eFileSizeText:= FormMain.GetSizeType(TViewFileInfo(addItem).eFileSize, False);
             TViewFileInfo(addItem).eDateTimeText:= FormMain.GetDateTimeStr(FileAge(tmpFileName));
             TViewFileInfo(addItem).eMerged:= False; // always false
             //if tmpMediaType = 0 then
             if not FormMain.IsMediaTypeCHD(tmpMediaType, False) then
                TViewFileInfo(addItem).eMerged:= TViewGameInfoGroup(addGroup).eMerged; // only set this to true for .zip files!!!
             TViewFileInfo(addItem).eParentFile:= False; // always false, used by CHDs only
             HeaderVerCHD:= 0; // temp var to hold CHD header version...

             if FormMain.IsMediaTypeCHD(tmpMediaType, False) then
                begin
                  TViewFileInfo(addItem).eParentFile:= Boolean(IsParentCHD);
                  FormMain.CreateCHD_SHA1(tmpFileName, '', ChecksumCHD, HeaderVerCHD); // read version and SHA-1 from CHD's header
                end;
             TViewFileInfo(addItem).eHeaderVerCHD:= HeaderVerCHD;

             TViewFileInfo(addItem).eCustomSystemID:= -1;
             TViewFileInfo(addItem).eCustomMediaType:= -1;
             TViewFileInfo(addItem).eIsCustomGame:= False;
             TViewFileInfo(addItem).eIsUnicode:= False;
             TViewFileInfo(addItem).eCustomGameFileFullPath:= '';
             
             addItem.Details[1]:= 1;
             addItem.Details[2]:= 2;
             GhostItem:= False;
             case tmpMediaType of
                0: GhostItem:= not FormDeleteMultipleGamesFiles.DeleteROMs.Checked;
                1: GhostItem:= not FormDeleteMultipleGamesFiles.DeleteCHDs.Checked;
               -1: GhostItem:= not FormDeleteMultipleGamesFiles.DeleteCFGsNVRAMs.Checked;
             end;
             if GhostItem then
                addItem.State:= addItem.State+[esosGhosted]; // if showing ghosted files...
           end;
         end;
    end;
    case FormDeleteMultipleGamesViewFiles.Tag of
      0: Item:= FormDeleteMultipleGamesFiles.GamesList.Groups.NextItem(Item); // all games
      1: Item:= FormMain.ELV_GetNextSelected(FormDeleteMultipleGamesFiles.GamesList, Item, selIndex); // all games
    end;
  until Item = nil;
end;

procedure TFormDeleteMultipleGamesViewFiles.UpdateTotalFilesLabel;
begin
  LabelTotalItems.Caption:= IntToStr(FilesListView.Groups.VisibleCount)+' Games';
  if FilesListView.Scrollbars.VertBarVisible then
     FilesListView.CellSizes.Tile.Width:= 617-GetSystemMetrics(SM_CXVSCROLL)// 565
  else
     FilesListView.CellSizes.Tile.Width:= 617;// 582;
end;

procedure TFormDeleteMultipleGamesViewFiles.FormShow(Sender: TObject);
var
  SearchGroup: TEasyGroup;
begin
  //CallMaximizeWindow(TForm(Sender));
  FormMain.ELV_ResetNormalColors(FilesListView);
  LoadMediaIcons;
  if Screen.Height = 480 then
     begin
       FormDeleteMultipleGamesViewFiles.ClientHeight:= 402;
     end;

  FormDeleteMultipleGamesViewFiles.Left:= (Screen.Width shr 1)-((FormDeleteMultipleGamesViewFiles.Width shr 1)-1); // to center the form


  // add all files in the list
  FilesListView.BeginUpdate;
  FilesListView.Items.ReIndexDisable:= True;
  AddGames(SearchGroup);
  FormMain.ELV_RemoveDefaultGroup(FilesListView);
  FilesListView.Items.ReIndexDisable:= False;

  //if FilesListView.Scrollbars.VertBarVisible then
  //   FilesListView.CellSizes.Tile.Width:= FilesListView.CellSizes.Tile.Width-GetSystemMetrics(SM_CXVSCROLL);

  FilesListView.Invalidate;
  FilesListView.EndUpdate;
  FilesListView.SetFocus;

  if SearchGroup <> nil then
     begin
       FilesListView.Selection.FocusedGroup:= SearchGroup;
       SearchGroup.MakeVisible(emvMiddle) //(emvAuto);
     end;

  UpdateTotalFilesLabel;
  Application.ProcessMessages;
end;

procedure TFormDeleteMultipleGamesViewFiles.FilesListViewItemPaintText(
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

procedure TFormDeleteMultipleGamesViewFiles.FilesListViewKeyAction(
  Sender: TCustomEasyListview; var CharCode: Word; var Shift: TShiftState;
  var DoDefault: Boolean);
begin
  case CharCode of
    //VK_RETURN: ButtonYes.Click;
    VK_ESCAPE: ButtonClose.Click;
  end;
end;

procedure TFormDeleteMultipleGamesViewFiles.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #27 then
     ButtonClose.Click;
end;

procedure TFormDeleteMultipleGamesViewFiles.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if CanClose then
     FormMain.ClearListView(FilesListView);
end;

procedure TFormDeleteMultipleGamesViewFiles.FilesListViewGroupImageDraw(
  Sender: TCustomEasyListview; Group: TEasyGroup; ACanvas: TCanvas;
  const RectArray: TEasyRectArrayObject; AlphaBlender: TEasyAlphaBlender);
begin
  //FormMain.IL_StandardIconsStandard.Draw(ACanvas, Group.BoundsRectTopMargin.Left+4, Group.BoundsRectTopMargin.Top+8,
  //                                       MaxGameID+TViewGameInfoGroup(Group).eSystemID);
  if TViewGameInfoGroup(Group).eIsCustomGame then
     begin
       FormMain.IL_MenuPopup.Draw(ACanvas, Group.BoundsRectTopMargin.Left+4, Group.BoundsRectTopMargin.Top+12, 23); // load EmuCon icon

       FormMain.IL_StandardIconsStandard.Draw(ACanvas, Group.BoundsRectTopMargin.Left+26, Group.BoundsRectTopMargin.Top+8,
                                              MaxGameID+TViewGameInfoGroup(Group).eCustomSystemID);
     end
  else
     begin
       FormMain.IL_StandardIconsSmall.Draw(ACanvas, Group.BoundsRectTopMargin.Left+4, Group.BoundsRectTopMargin.Top+12,
                                           MaxGameID+MaxConsoleComputerSystems+TViewGameInfoGroup(Group).eSystemID);
       FormMain.IL_StandardIconsStandard.Draw(ACanvas, Group.BoundsRectTopMargin.Left+26, Group.BoundsRectTopMargin.Top+8,
                                           FormMain.GetMAMEImageIndex(TViewGameInfoGroup(Group).eROMIdentification, TViewGameInfoGroup(Group).eSoftwareName));
     end;
end;

procedure TFormDeleteMultipleGamesViewFiles.FilesListViewGroupImageDrawIsCustom(
  Sender: TCustomEasyListview; Group: TEasyGroup; var IsCustom: Boolean);
begin
  IsCustom:= True;
end;

procedure TFormDeleteMultipleGamesViewFiles.ButtonShowFileTypesClick(
  Sender: TObject);
var
  Group: TEasyGroup;
  Item: TEasyItem;
begin
  // Tag = 0 -> show all files
  // Tag = 1 -> show files to delete only
  ButtonShowFileTypes.Tag:= Ord(not (Boolean(ButtonShowFileTypes.Tag)));

  case ButtonShowFileTypes.Tag of
    0: ButtonShowFileTypes.Caption:= 'Show Only Files to Delete';
    1: ButtonShowFileTypes.Caption:= 'Show All Files';
  end;
  FilesListView.BeginUpdate;
  FilesListView.Groups.MakeAllVisible;
  FilesListView.Groups.Rebuild(True); // need to rebuild to list gets messed up
  Item:= FilesListView.Groups.FirstItem;
  repeat
    if Item.Ghosted then
       Item.Visible:= ButtonShowFileTypes.Tag = 0;
    Item:= FilesListView.Groups.NextItem(Item);
  until Item = nil;
  FilesListView.Groups.Rebuild(True); // need to rebuild to list gets messed up

  Group:= FilesListView.Groups.FirstGroup;
  repeat
    if Group.VisibleCount = 0 then
       Group.Visible:= False;
    Group:= FilesListView.Groups.NextGroup(Group);
  until Group = nil;
  FilesListView.EndUpdate;
  UpdateTotalFilesLabel;
end;

end.
