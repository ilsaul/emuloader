unit uDeleteMultipleGamesViewFiles;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, EasyListview, MPCommonObjects, MPCommonUtilities, ExtCtrls,
  ImgList, IniFiles, FileCtrl, PanelEx, ShadowLabel, uCommon, uCommonCustom,
  Buttons, ButtonsEx;

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
    FilesListViewDeleteMulti: TEasyListview;
    IL_MediaType: TImageList;
    PanelBottom: TPanelEx;
    LabelTotalItems: TShadowLabel;
    ButtonShowFileTypes: TBitBtnEx;
    LabelGhostedFiles: TShadowLabel;
    ButtonClose: TBitBtnEx;
    procedure FormShow(Sender: TObject);
    procedure FilesListViewDeleteMultiItemPaintText(Sender: TCustomEasyListview;
      Item: TEasyItem; Position: Integer; ACanvas: TCanvas);
    procedure FilesListViewDeleteMultiKeyAction(Sender: TCustomEasyListview;
      var CharCode: Word; var Shift: TShiftState; var DoDefault: Boolean);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FilesListViewDeleteMultiGroupImageDraw(Sender: TCustomEasyListview;
      Group: TEasyGroup; ACanvas: TCanvas;
      const RectArray: TEasyRectArrayObject;
      AlphaBlender: TEasyAlphaBlender);
    procedure FilesListViewDeleteMultiGroupImageDrawIsCustom(
      Sender: TCustomEasyListview; Group: TEasyGroup;
      var IsCustom: Boolean);
    procedure ButtonShowFileTypesClick(Sender: TObject);
    procedure FilesListViewDeleteMultiGroupPaintText(Sender: TCustomEasyListview;
      Group: TEasyGroup; ACanvas: TCanvas);
  private
    { Private declarations }
    EmuConIcon: TImage;
    FileTextMaxCount: Integer;
    procedure Resize4K;
    procedure ResizeForm;
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
        Result:= '';
        //for ExtraCount:= 1 to 87 do Result:= Result+'j'; Exit; // debug only, do not enabled (March 22, 2021)
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
        case FormDeleteMultipleGamesViewFiles.FilesListViewDeleteMulti.Scrollbars.VertBarVisible of
          True : VertBar:= 2;
          False: VertBar:= 0;
        end;
        ExtraCount:= FormDeleteMultipleGamesViewFiles.FileTextMaxCount-VertBar;
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
              Result:= eCustomGameFileShowText;
            end;
          False:
            begin
              if extraStr <> '' then
                 begin
                   //extraStr:= '['+extraStr+'] ';
                   ExtraCount:= ExtraCount-Length(extraStr);
                 end;
              Result:= Format(extraStr+'%-'+IntToStr(ExtraCount)+'s', [ShortDirString(eFileName, ExtraCount)]);
            end;
        end;
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

procedure TFormDeleteMultipleGamesViewFiles.Resize4K;
begin
  if not Is4KMode then //FormMain.Menu4KMode2160pEnable.Checked then
     begin
       ResizeForm;
       Exit;
     end;

  with FormDeleteMultipleGamesViewFiles do
  begin
    Font.Size:= 16;
    ClientWidth:= 1400;

    FormMain.Set4KImageListSpecs(IL_MediaType, 68);

    FilesListViewDeleteMulti.Width:= ClientWidth;
    FilesListViewDeleteMulti.CellSizes.Tile.Width:= FilesListViewDeleteMulti.Width-1;
    FilesListViewDeleteMulti.CellSizes.Tile.Height:= 98;// IL_MediaType.Height+10;
    FilesListViewDeleteMulti.Width:= FilesListViewDeleteMulti.Width+GetSystemMetrics(SM_CXVSCROLL);

    FilesListViewDeleteMulti.Font.Size:= 16;
    FilesListViewDeleteMulti.GroupFont.Size:= 18;
    FilesListViewDeleteMulti.ImagesGroup:= FormMain.IL_StandardIconsExtraLarge; // FormDeleteMultipleGamesFiles.IL_StandardIcons68;

    FilesListViewDeleteMulti.PaintInfoItem.ImageIndent:= 48+2;

    FilesListViewDeleteMulti.PaintInfoGroup.BandIndent:= FormMain.IL_StandardIconsExtraLarge.Width+10;
    FilesListViewDeleteMulti.PaintInfoGroup.BandLength:= FilesListViewDeleteMulti.Width-FormMain.IL_StandardIconsExtraLarge.Width-48;
    FilesListViewDeleteMulti.PaintInfoGroup.MarginTop.Size:= FormMain.IL_StandardIconsExtraLarge.Width+8+3;
    FilesListViewDeleteMulti.PaintInfoGroup.CaptionIndent:= 48*2+16;

    PanelBottom.Height:= 85;

    FormMain.Set4KButtonSpecs(ButtonShowFileTypes, 10, 30, 260, 45, 16);
    FormMain.Set4KButtonSpecs(ButtonClose,       1222, 30, 168, 45, 16);

    FormMain.Set4KLabelSpecs(LabelTotalItems,   280, 37,  -1, -1, 16);
    FormMain.Set4KLabelSpecs(LabelGhostedFiles, 595, 14, 413, -1, 16);
  end;
end;

procedure TFormDeleteMultipleGamesViewFiles.ResizeForm;
var
  iScreenWidth, iScreenHeight, MaxHeight: Integer;
begin
  iScreenWidth:=  Screen.Width;
  iScreenHeight:= Screen.Height;// Screen.WorkAreaRect.Bottom-Screen.WorkAreaRect.Top;

  if iScreenWidth < 1024 then
     Exit; // resolution less than 1024x768 is no longer supported

  MaxHeight:= iScreenHeight-300;

  if (iScreenWidth > 1023) and (iScreenWidth < 1920) then
     begin
       ClientWidth:= 700;
       FileTextMaxCount:= 81;
     end
  else
  if iScreenWidth > 1919 then
     begin
       ClientWidth:= 1400;
       FileTextMaxCount:= 181;
     end;

  ButtonClose.Left:= ClientWidth-ButtonClose.Width-9;
  LabelGhostedFiles.Left:= (ClientWidth div 2)-(LabelGhostedFiles.Width div 2);
  FilesListViewDeleteMulti.Width:= ClientWidth;
  FilesListViewDeleteMulti.CellSizes.Tile.Width:= FilesListViewDeleteMulti.Width-1;
  FilesListViewDeleteMulti.Width:= FilesListViewDeleteMulti.Width+GetSystemMetrics(SM_CXVSCROLL);
  FilesListViewDeleteMulti.PaintInfoItem.CaptionIndent:= 0;
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
    0: Item:=  FormDeleteMultipleGamesFiles.GamesListDeleteMulti.Groups.FirstItem; // all games
    1: Item:=  FormDeleteMultipleGamesFiles.GamesListDeleteMulti.Selection.First;  // all games
  end;
  GroupToFocus:= nil;
  if Item = nil then
  begin
    GroupGameTitle:= '';
    GroupSoftwareName:= '';
  end
  else
  begin
    GroupGameTitle:= uDeleteMultipleGamesFiles.TGameInfoDeleteMulti(Item).eTitle;
    GroupSoftwareName:= uDeleteMultipleGamesFiles.TGameInfoDeleteMulti(Item).eSoftwareName;
  end;
  repeat
    addGroup:= FilesListViewDeleteMulti.Groups.AddCustom(TViewGameInfoGroup, nil);

    TViewGameInfoGroup(addGroup).eROMIdentification:= uDeleteMultipleGamesFiles.TGameInfoDeleteMulti(Item).eROMIdentification;
    TViewGameInfoGroup(addGroup).eSystemID:= uDeleteMultipleGamesFiles.TGameInfoDeleteMulti(Item).eSystemID;
    TViewGameInfoGroup(addGroup).eMediaType:= uDeleteMultipleGamesFiles.TGameInfoDeleteMulti(Item).eMediaType;
    TViewGameInfoGroup(addGroup).eCustomSystemID:= uDeleteMultipleGamesFiles.TGameInfoDeleteMulti(Item).eCustomSystemID;
    TViewGameInfoGroup(addGroup).eCustomMediaType:= uDeleteMultipleGamesFiles.TGameInfoDeleteMulti(Item).eCustomMediaType;
    TViewGameInfoGroup(addGroup).eTitle:= uDeleteMultipleGamesFiles.TGameInfoDeleteMulti(Item).eTitle;
    TViewGameInfoGroup(addGroup).eName:= uDeleteMultipleGamesFiles.TGameInfoDeleteMulti(Item).eName;
    TViewGameInfoGroup(addGroup).eClone:= uDeleteMultipleGamesFiles.TGameInfoDeleteMulti(Item).eClone;
    TViewGameInfoGroup(addGroup).eCloneParent:= uDeleteMultipleGamesFiles.TGameInfoDeleteMulti(Item).eCloneParent;
    TViewGameInfoGroup(addGroup).eMerged:= uDeleteMultipleGamesFiles.TGameInfoDeleteMulti(Item).eMerged;
    TViewGameInfoGroup(addGroup).eHaveROMsArcade:= uDeleteMultipleGamesFiles.TGameInfoDeleteMulti(Item).eHaveROMsArcade;
    TViewGameInfoGroup(addGroup).eHaveCHDsArcade:= uDeleteMultipleGamesFiles.TGameInfoDeleteMulti(Item).eHaveCHDsArcade;
    TViewGameInfoGroup(addGroup).eHaveCFGsArcade:= uDeleteMultipleGamesFiles.TGameInfoDeleteMulti(Item).eHaveCFGsArcade;
    TViewGameInfoGroup(addGroup).eDriverStatus:= uDeleteMultipleGamesFiles.TGameInfoDeleteMulti(Item).eDriverStatus;
    TViewGameInfoGroup(addGroup).eSoftwareName:= uDeleteMultipleGamesFiles.TGameInfoDeleteMulti(Item).eSoftwareName;
    TViewGameInfoGroup(addGroup).eGameStatus:= uDeleteMultipleGamesFiles.TGameInfoDeleteMulti(Item).eGameStatus;
    TViewGameInfoGroup(addGroup).eIsCustomGame:= uDeleteMultipleGamesFiles.TGameInfoDeleteMulti(Item).eIsCustomGame;

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
    if uDeleteMultipleGamesFiles.TGameInfoDeleteMulti(Item).eIsCustomGame then
    begin
      // for console/computer/handheld only (EmuCon)

      tmpFileName:= uDeleteMultipleGamesFiles.TGameInfoDeleteMulti(Item).eCustomGameFileFullPath;
      addItem:= FilesListViewDeleteMulti.Items.AddCustom(TViewFileInfo, addGroup);
      TViewFileInfo(addItem).eROMIdentification:= TViewGameInfoGroup(addGroup).eROMIdentification;
      TViewFileInfo(addItem).eSystemID:= uDeleteMultipleGamesFiles.TGameInfoDeleteMulti(Item).eSystemID;
      TViewFileInfo(addItem).eMediaType:= 0;
      TViewFileInfo(addItem).eCustomSystemID:= uDeleteMultipleGamesFiles.TGameInfoDeleteMulti(Item).eCustomSystemID;
      TViewFileInfo(addItem).eCustomMediaType:= uDeleteMultipleGamesFiles.TGameInfoDeleteMulti(Item).eCustomMediaType;
      TViewFileInfo(addItem).eFileType:= -1;
      TViewFileInfo(addItem).eSoftwareName:= uDeleteMultipleGamesFiles.TGameInfoDeleteMulti(Item).eSoftwareName; // might not be needed!!
      TViewFileInfo(addItem).eGameStatus:= uDeleteMultipleGamesFiles.TGameInfoDeleteMulti(Item).eGameStatus; // might not be needed!!
      TViewFileInfo(addItem).eFileName:= tmpFileName; // uDeleteMultipleGamesFiles.TGameInfoDeleteMulti(Item).eName;
      TViewFileInfo(addItem).eFileSize:= GetFileSizeW(tmpFileName);
      TViewFileInfo(addItem).eFileSizeText:= FormMain.GetSizeType(TViewFileInfo(addItem).eFileSize, False);
      TViewFileInfo(addItem).eDateTimeText:= FormMain.GetDateTimeStr(FileAgeW(tmpFileName));
      TViewFileInfo(addItem).eMerged:= False; // always false
      TViewFileInfo(addItem).eParentFile:= False; // always false, used by CHDs only
      TViewFileInfo(addItem).eHeaderVerCHD:= 0;
      TViewFileInfo(addItem).eIsCustomGame:= True;
      TViewFileInfo(addItem).eIsUnicode:= uDeleteMultipleGamesFiles.TGameInfoDeleteMulti(Item).eIsUnicode;
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
      if Assigned(uDeleteMultipleGamesFiles.TGameInfoDeleteMulti(Item).eGameFiles) and
         (uDeleteMultipleGamesFiles.TGameInfoDeleteMulti(Item).eGameFiles.Count > 0) then
         begin
           for Loop:=0 to uDeleteMultipleGamesFiles.TGameInfoDeleteMulti(Item).eGameFiles.Count-1 do
           begin
             // 00 -> rom; 01 -> CHD; -1 -> config files
             // media_type FileID IsParentCHD filename
             // 01120 simpbowl.chd
             // 00000 elvator.rom
             // -1000 elvator.cfg

             tmpStr:= uDeleteMultipleGamesFiles.TGameInfoDeleteMulti(Item).eGameFiles[Loop];
             tmpMediaType:= StrToInt(tmpStr[1]+tmpStr[2]);
             tmpFileType:= StrToInt(tmpStr[3]+tmpStr[4]);
             IsParentCHD:= StrToInt(tmpStr[5]);

             tmpFileName:= tmpStr;
             Delete(tmpFileName, 1, 6);

             addItem:= FilesListViewDeleteMulti.Items.AddCustom(TViewFileInfo, addGroup);
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
             TViewFileInfo(addItem).eDateTimeText:= FormMain.GetDateTimeStr(FileAgeW(tmpFileName));
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
      0: Item:= FormDeleteMultipleGamesFiles.GamesListDeleteMulti.Groups.NextItem(Item); // all games
      1: Item:= FormMain.ELV_GetNextSelected(FormDeleteMultipleGamesFiles.GamesListDeleteMulti, Item, selIndex); // all games
    end;
  until Item = nil;
end;

procedure TFormDeleteMultipleGamesViewFiles.UpdateTotalFilesLabel;
begin
  LabelTotalItems.Caption:= IntToStr(FilesListViewDeleteMulti.Groups.VisibleCount)+' Games';
  //if FilesListView.Scrollbars.VertBarVisible then
  //   FilesListView.CellSizes.Tile.Width:= 732-GetSystemMetrics(SM_CXVSCROLL)// 565
  //else
  //   FilesListView.CellSizes.Tile.Width:= 732;// 582;
end;

procedure TFormDeleteMultipleGamesViewFiles.FormShow(Sender: TObject);
var
  SearchGroup: TEasyGroup;
  tGroup, tItem, hSize, MaxSize: Integer;

begin
  case Is4KMode of //FormMain.Menu4KMode2160pEnable.Checked of
    True : FileTextMaxCount:= 124;
    False: FileTextMaxCount:= 90; // this is for TGameInfoDeleteMulti.GetCaptions
  end;

  EmuConIcon:= TImage.Create(nil);
  EmuConIcon.Transparent:= True;
  case Is4KMode of //FormMain.Menu4KMode2160pEnable.Checked of
    True : FormMain.Set4KImageIconSpecs(EmuConIcon, 48);
    False: FormMain.Set4KImageIconSpecs(EmuConIcon, 32);
  end;
  FormMain.LoadGameIcon(EmuConIcon, True);

  FormMain.ELV_ResetNormalColors(FilesListViewDeleteMulti);
  FormMain.ELV_SetRibbonNightColors(0, FilesListViewDeleteMulti, True);
  Resize4K;
  FormMain.LoadMediaIcons(IL_MediaType);

  FormMain.SetWin10DarkScrollBar(FilesListViewDeleteMulti);

  // add all files in the list
  FilesListViewDeleteMulti.BeginUpdate;
  FilesListViewDeleteMulti.Items.ReIndexDisable:= True;
  AddGames(SearchGroup);
  FormMain.ELV_RemoveDefaultGroup(FilesListViewDeleteMulti);
  FilesListViewDeleteMulti.Items.ReIndexDisable:= False;
  //FilesListViewDeleteMulti.Invalidate;
  FilesListViewDeleteMulti.EndUpdate;
  FilesListViewDeleteMulti.SetFocus;

  tGroup:= FilesListViewDeleteMulti.Groups.Count;
  tItem:=  FilesListViewDeleteMulti.Groups.ItemCount;

  MaxSize:= Screen.Height-PanelBottom.Height-300;

  tGroup:= tGroup*(FilesListViewDeleteMulti.PaintInfoGroup.MarginTop.Size+FilesListViewDeleteMulti.PaintInfoGroup.MarginBottom.Size);
  tItem:=  tItem * FilesListViewDeleteMulti.CellSizes.Tile.Height;

  hSize:= tGroup+tItem;
  if hSize > MaxSize then
     hSize:= MaxSize;
  //else
  //   hSize:= hSize+PanelBottom.Height;

  FilesListViewDeleteMulti.Height:= hSize;

  FormDeleteMultipleGamesViewFiles.ClientHeight:= hSize+PanelBottom.Height;

  if FilesListViewDeleteMulti.Scrollbars.VertBarVisible then
     begin
       //FilesListView.Width:= FilesListView.Width+GetSystemMetrics(SM_CXVSCROLL);
       FormDeleteMultipleGamesViewFiles.ClientWidth:= FilesListViewDeleteMulti.Width;
       ButtonClose.Left:= ButtonClose.Left+GetSystemMetrics(SM_CXVSCROLL);
     end;

  CallCenterWindow(FormDeleteMultipleGamesViewFiles);
  //FormDeleteMultipleGamesViewFiles.Left:= (Screen.Width shr 1)-((FormDeleteMultipleGamesViewFiles.Width shr 1)-1); // to center the form

  if SearchGroup <> nil then
     begin
       FilesListViewDeleteMulti.Selection.FocusedGroup:= SearchGroup;
       SearchGroup.MakeVisible(emvMiddle) //(emvAuto);
     end;

  UpdateTotalFilesLabel;
  Application.ProcessMessages;
end;

procedure TFormDeleteMultipleGamesViewFiles.FilesListViewDeleteMultiItemPaintText(
  Sender: TCustomEasyListview; Item: TEasyItem; Position: Integer;
  ACanvas: TCanvas);
begin
  case Position of
    0:
      begin
        ACanvas.Font.Name:= FormMain.Get4KSystemFont;
        ACanvas.Font.Size:= ACanvas.Font.Size+2; // 11
        if LabelTotalItems.Tag = 0 then
           ACanvas.Font.Color:= clMaroon // light mode
        else
           ACanvas.Font.Color:= clrLightRed; // night mode

        //if FormDeleteMultipleGamesFiles.DestinationFolderLabel.Tag = 1 then
        //   ACanvas.Font.Style:= [fsItalic];
      end;
    1:
      begin
        ACanvas.Font.Name:= 'Consolas';
      end;
    2:
      begin
        ACanvas.Font.Name:= 'Consolas';
      end;
  end;
  if Position in [1, 2] then
     if Is4KMode then //FormMain.Menu4KMode2160pEnable.Checked then
        ACanvas.Font.Size:= 14;
        
  if Item.Ghosted then
     begin
       if Position = 0 then
          ACanvas.Font.Color:= $00707070// clSilver
       else
          ACanvas.Font.Color:= $00464646;//clMedGray;
     end;
end;

procedure TFormDeleteMultipleGamesViewFiles.FilesListViewDeleteMultiKeyAction(
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
     begin
       FormMain.ClearListView(FilesListViewDeleteMulti);
       FreeAndNil(EmuConIcon);
     end;
end;

procedure TFormDeleteMultipleGamesViewFiles.FilesListViewDeleteMultiGroupImageDraw(
  Sender: TCustomEasyListview; Group: TEasyGroup; ACanvas: TCanvas;
  const RectArray: TEasyRectArrayObject; AlphaBlender: TEasyAlphaBlender);
begin
  if Is4KMode then //FormMain.Menu4KMode2160pEnable.Checked then
  begin
    if TViewGameInfoGroup(Group).eIsCustomGame then
       begin
         //draw 48x48 emucon.ico
         if Assigned(EmuConIcon) then
            ACanvas.Draw(Group.BoundsRectTopMargin.Left+4, Group.BoundsRectTopMargin.Top+4, EmuConIcon.Picture.Graphic);
         //FormMain.IL_MenuPopup.Draw(ACanvas, Group.BoundsRectTopMargin.Left+4, Group.BoundsRectTopMargin.Top+4, 23); // load EmuCon icon

         // game icon
         FilesListViewDeleteMulti.ImagesGroup.Draw(ACanvas, Group.BoundsRectTopMargin.Left+8+EmuConIcon.Width{48}, Group.BoundsRectTopMargin.Top+4,
                                                   MaxGameID+TViewGameInfoGroup(Group).eCustomSystemID);
       end
    else
       begin
         // system icon
         FilesListViewDeleteMulti.ImagesGroup.Draw(ACanvas, Group.BoundsRectTopMargin.Left+4, Group.BoundsRectTopMargin.Top+4,
                                                   MaxGameID+MaxConsoleComputerSystems+TViewGameInfoGroup(Group).eSystemID);

         // game icon
         FilesListViewDeleteMulti.ImagesGroup.Draw(ACanvas, Group.BoundsRectTopMargin.Left+8+48, Group.BoundsRectTopMargin.Top+4,
                                                   FormMain.GetMAMEImageIndex(TViewGameInfoGroup(Group).eROMIdentification, TViewGameInfoGroup(Group).eSoftwareName, TViewGameInfoGroup(Group).eGameStatus));
       end;
  end
  else
  begin
    if TViewGameInfoGroup(Group).eIsCustomGame then
       begin
         // draw 32x32 emucon.ico
         if Assigned(EmuConIcon) then
            ACanvas.Draw(Group.BoundsRectTopMargin.Left+4, Group.BoundsRectTopMargin.Top+4, EmuConIcon.Picture.Graphic);
         //FormMain.IL_MenuPopup.Draw(ACanvas, Group.BoundsRectTopMargin.Left+4, Group.BoundsRectTopMargin.Top+12, 23); // load EmuCon icon

         //game icon
         FilesListViewDeleteMulti.ImagesGroup.Draw(ACanvas, Group.BoundsRectTopMargin.Left+8+EmuConIcon.Width{28}, Group.BoundsRectTopMargin.Top+4,
                                                   MaxGameID+TViewGameInfoGroup(Group).eCustomSystemID);

         //FormMain.IL_StandardIconsStandard.Draw(ACanvas, Group.BoundsRectTopMargin.Left+26, Group.BoundsRectTopMargin.Top+8,
         //                                       MaxGameID+TViewGameInfoGroup(Group).eCustomSystemID);
       end
    else
       begin
         // system icon
         //FormMain.IL_StandardIconsSmall.
         FilesListViewDeleteMulti.ImagesGroup.Draw(ACanvas, Group.BoundsRectTopMargin.Left+4, Group.BoundsRectTopMargin.Top+4,
                                                   MaxGameID+MaxConsoleComputerSystems+TViewGameInfoGroup(Group).eSystemID);

         // game icon
         FilesListViewDeleteMulti.ImagesGroup.Draw(ACanvas, Group.BoundsRectTopMargin.Left+8+EmuConIcon.Width{28}, Group.BoundsRectTopMargin.Top+4,
                                                   FormMain.GetMAMEImageIndex(TViewGameInfoGroup(Group).eROMIdentification, TViewGameInfoGroup(Group).eSoftwareName, TViewGameInfoGroup(Group).eGameStatus));

         //FormMain.IL_StandardIconsStandard.Draw(ACanvas, Group.BoundsRectTopMargin.Left+26, Group.BoundsRectTopMargin.Top+8,
         //                                    FormMain.GetMAMEImageIndex(TViewGameInfoGroup(Group).eROMIdentification, TViewGameInfoGroup(Group).eSoftwareName));
       end;
  end;
end;

procedure TFormDeleteMultipleGamesViewFiles.FilesListViewDeleteMultiGroupImageDrawIsCustom(
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
  FilesListViewDeleteMulti.BeginUpdate;
  FilesListViewDeleteMulti.Groups.MakeAllVisible;
  FilesListViewDeleteMulti.Groups.Rebuild(True); // need to rebuild to list gets messed up
  Item:= FilesListViewDeleteMulti.Groups.FirstItem;
  repeat
    if Item.Ghosted then
       Item.Visible:= ButtonShowFileTypes.Tag = 0;
    Item:= FilesListViewDeleteMulti.Groups.NextItem(Item);
  until Item = nil;
  FilesListViewDeleteMulti.Groups.Rebuild(True); // need to rebuild to list gets messed up

  Group:= FilesListViewDeleteMulti.Groups.FirstGroup;
  repeat
    if Group.VisibleCount = 0 then
       Group.Visible:= False;
    Group:= FilesListViewDeleteMulti.Groups.NextGroup(Group);
  until Group = nil;
  FilesListViewDeleteMulti.EndUpdate;
  UpdateTotalFilesLabel;
end;

procedure TFormDeleteMultipleGamesViewFiles.FilesListViewDeleteMultiGroupPaintText(
  Sender: TCustomEasyListview; Group: TEasyGroup; ACanvas: TCanvas);
begin
  FormMain.GetCanvasFont(TViewGameInfoGroup(Group).eSystemID,
                         TViewGameInfoGroup(Group).eCustomSystemID,
                         TViewGameInfoGroup(Group).eIsCustomGame,
                         TViewGameInfoGroup(Group).eGameStatus,
                         TViewGameInfoGroup(Group).eDriverStatus,
                         TViewGameInfoGroup(Group).eClone,
                         ACanvas, False, FilesListViewDeleteMulti);

  ACanvas.Font.Style:= [fsBold];
  case Is4KMode of //FormMain.Menu4KMode2160pEnable.Checked of
    True : ACanvas.Font.Size:= 18; // fixed font size
    False: ACanvas.Font.Size:= 10;
  end;
end;

end.
