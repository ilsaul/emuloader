unit uCopyMoveGameFiles;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, uCommon, uCommonCustom, MPCommonObjects, MPCommonUtilities, EasyListview,
  ImgList, StdCtrls, Buttons, ComCtrls, ShadowLabel, PanelEx, ExtCtrls,
  IniFiles, GraphicEx, RichEditURL, ButtonsEx, XiProgressBar;

type
  TFormCopyMoveGameFiles = class(TForm)
    PanelProgress: TPanelEx;
    ButtonPause: TBitBtnEx;
    ButtonCancel: TBitBtnEx;
    PanelTop: TPanelEx;
    SystemIcon: TImage;
    LabelGameTitle: TShadowLabel;
    IL_MediaType: TImageList;
    LabelGameNameCloneOf: TShadowLabel;
    LabelCopyToTitle: TShadowLabel;
    LabelCopyTo: TShadowLabel;
    Log: TRichEditURL;
    LabelCanceledByUser: TShadowLabel;
    LabelRemainingFiles: TShadowLabel;
    PanelFileInfo: TPanelEx;
    IconFileType: TImage;
    LabelGameFile: TShadowLabel;
    LabelFileSizeDate: TShadowLabel;
    LabelFileType: TShadowLabel;
    ProgressBar: TXiProgressBar;
    procedure FormShow(Sender: TObject);
    procedure ButtonPauseClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure ButtonCancelClick(Sender: TObject);
  private
    { Private declarations }
    DestinationFullPath: String;
    MultiSystems: Boolean;
    FilesListMAME: THashedStringList;
    procedure LoadMediaIcons;
    procedure SetProgressPos(Position: Integer);
    procedure UpdateProgressBar(Position, Total: Integer);
    procedure UpdateTotalLeftLabel(TotalFilesLeft: Integer);
    procedure ProcessFiles;
  public
    { Public declarations }
    iTotalFiles: Integer;
    iTotalFilesSize, iTotalFilesSizeLeft: Int64;
    ArcadeSystemChanged: packed array[1..MaxArcadeSystems] of Boolean;
    SingleSystemChanged, OverwriteFiles, AddSystemFolder: Boolean;
  end;

var
  FormCopyMoveGameFiles: TFormCopyMoveGameFiles;

implementation

uses uMain, uDeleteMultipleGamesFiles, uDeleteGamesFiles;

{$R *.dfm}

procedure TFormCopyMoveGameFiles.LoadMediaIcons;
var
  Loop: ShortInt;
  Folder: String;
begin
  Folder:= FormMain.GetFolderFull(32);
  for Loop:=Low(aMediaType)+1 to High(aMediaType) do
      FormMain.AddDefaultIcons(aMediaType[Loop, 1]+'.ico', Folder, IL_MediaType); // zipfile.ico and chd.ico

  FormMain.AddDefaultIcons('media_disc.ico', Folder, IL_MediaType);             // 2
  FormMain.AddDefaultIcons('media_flashcard.ico', Folder, IL_MediaType);        // 3

  FormMain.AddDefaultIcons('settings.ico', Folder, IL_MediaType);               // 4
  FormMain.AddDefaultIcons('bios_chip.ico', Folder, IL_MediaType);              // 5
  FormMain.AddDefaultIcons('bios_chip.ico', Folder, IL_MediaType);              // 6
  FormMain.AddDefaultIcons('bios_chip.ico', Folder, IL_MediaType);              // 7
  FormMain.AddDefaultIcons('bios_chip.ico', Folder, IL_MediaType);              // 8

  for Loop:=Low(MediaTypeCustom) to High(MediaTypeCustom) do
      FormMain.AddDefaultIcons(MediaTypeCustom[Loop, 1], Folder, IL_MediaType); // 9..13

  FormMain.AddDefaultIcons('media_vhs.ico', Folder, IL_MediaType);              // 14
  FormMain.AddDefaultIcons('media_videogamemusic.ico', Folder, IL_MediaType);   // 15
end;

procedure TFormCopyMoveGameFiles.SetProgressPos(Position: Integer);
begin
  ProgressBar.Position:= Position;
end;

procedure TFormCopyMoveGameFiles.UpdateProgressBar(Position, Total: Integer);
var
  CalculatePosition: LongInt;
begin
  if Total in [0, 1] then
     Exit;
  CalculatePosition:= Trunc((Position * 100) / Total);
  if CalculatePosition > ProgressBar.Position then
     ProgressBar.Position:= CalculatePosition;
end;

procedure TFormCopyMoveGameFiles.FormShow(Sender: TObject);
var
  Item: TEasyItem;
  Loop, CurrentSystem, CurrentCustomSystem: Integer;
  CurrentSoftwareName: String;
  ActionStr: String;
  HasMAME: Boolean;
begin
  if IsNightMode then
     begin
       SetFormColors(FormCopyMoveGameFiles, PanelTop, nil, LabelGameTitle, LabelGameNameCloneOf, nil, -1, True);

       ProgressBar.ColorScheme:= csMetal;
       
       PanelFileInfo.Color1:= FormCopyMoveGameFiles.Color;
       PanelProgress.Style:= vgSolid;
       PanelProgress.Color1:= FormCopyMoveGameFiles.Color;

       SetLabelColors(LabelFileType, clrLightRed, clMaroon);

       SetLabelColors(LabelGameFile,       clCream, item_caption_active_shadow_color[1]);
       SetLabelColors(LabelFileSizeDate,   clCream, item_caption_active_shadow_color[1]);
       SetLabelColors(LabelCopyToTitle,    clrLightBlue, clNavy);
       SetLabelColors(LabelRemainingFiles, clCream, item_caption_active_shadow_color[1]);
       SetLabelColors(LabelCopyTo,         clrOrangeBarTop, -1);
       SetLabelColors(LabelCanceledByUser, clrLightRed, clMaroon);

       Log.BorderStyle:= bsNone;
       Log.Color:= FormCopyMoveGameFiles.Color;
       Log.Font.Color:= item_caption_active_color[1];

       FormMain.SetWin10DarkScrollBar(Log);

       FormMain.SetButtonExColors(ButtonCancel);
       FormMain.SetButtonExColors(ButtonPause);
     end;

  //FormCopyMoveGameFiles.Color:= clrDarkGray; // must set TRichEdit bk color here; it crashes at .onFormCreate() event
  //Exit; // for debugging only, do not enable
  Left:= (Screen.Width shr 1)-(Width shr 1)-1;
  Top:= (Screen.Height shr 1)-(Height shr 1)-1;

  LoadMediaIcons;

  SingleSystemChanged:= False;
  for Loop:= 1 to MaxArcadeSystems do
      ArcadeSystemChanged[Loop]:= False;

  MultiSystems:= False;
  HasMAME:= False;
  if Assigned(FormDeleteMultipleGamesFiles) then
     begin
       CurrentSystem:= -1;
       CurrentCustomSystem:= -1;
       CurrentSoftwareName:= '';
       Item:= FormDeleteMultipleGamesFiles.GamesList.Groups.FirstItem;
       repeat
         if CurrentSystem = -1 then
            begin
              CurrentSystem:= uDeleteMultipleGamesFiles.TGameInfo(Item).eSystemID;
              CurrentCustomSystem:= uDeleteMultipleGamesFiles.TGameInfo(Item).eCustomSystemID;
              CurrentSoftwareName:= uDeleteMultipleGamesFiles.TGameInfo(Item).eSoftwareName;
            end
         else
            begin
              if (uDeleteMultipleGamesFiles.TGameInfo(Item).eSystemID <> CurrentSystem) or
                 (uDeleteMultipleGamesFiles.TGameInfo(Item).eSoftwareName <> CurrentSoftwareName) or
                 (uDeleteMultipleGamesFiles.TGameInfo(Item).eCustomSystemID <> CurrentCustomSystem) then
                 MultiSystems:= True;
            end;
         if uDeleteMultipleGamesFiles.TGameInfo(Item).eSystemID = idMAME then
            HasMAME:= True;
         Item:= FormDeleteMultipleGamesFiles.GamesList.Groups.NextItem(Item);
       until (Item = nil) or MultiSystems;
     end;
  
  if Assigned(FormDeleteMultipleGamesFiles) then
     DestinationFullPath:= FormDeleteMultipleGamesFiles.DestinationFolder.Text
  else
  if Assigned(FormDeleteGamesFiles) then
     DestinationFullPath:= FormDeleteGamesFiles.DestinationFolder.Text;

  case FormCopyMoveGameFiles.Tag of
    0: ActionStr:= 'Deleting';
    1: ActionStr:= 'Copying';
    2: ActionStr:= 'Moving';
  end;

  LabelCopyToTitle.Caption:= Format('%s %.0n files (%s)', [ActionStr, (iTotalFiles*1.0), FormMain.GetSizeType(iTotalFilesSize, False, True)]);
  if FormCopyMoveGameFiles.Tag <> 0 then
     LabelCopyToTitle.Caption:= LabelCopyToTitle.Caption+' to';
  if LabelCopyTo.Visible then
     begin
       LabelCopyTo.Left:= LabelCopyToTitle.Left+LabelCopyToTitle.Width+4;
       LabelCopyTo.Caption:= DestinationFullPath;
     end;
  //FormCopyMoveGameFiles.ClientHeight:= 250;//237;
  UpdateTotalLeftLabel(iTotalFiles);

  DestinationFullPath:= IncludeTrailingPathDelimiter(DestinationFullPath);

  if (FormCopyMoveGameFiles.Tag = 1) and (MultiSystems and HasMAME) then
     FilesListMAME:= THashedStringList.Create; // for copy files only
end;

procedure TFormCopyMoveGameFiles.UpdateTotalLeftLabel(TotalFilesLeft: Integer);
begin
  if TotalFilesLeft > 0 then
     LabelRemainingFiles.Caption:= Format('Remaining %.0n files (%s)', [(TotalFilesLeft*1.0), FormMain.GetSizeType(iTotalFilesSizeLeft, False, True)])
  else
     LabelRemainingFiles.Caption:= 'Remaining 0 files';
end;

procedure TFormCopyMoveGameFiles.ProcessFiles;
var
  Loop, tmpMediaType, tmpFileType: Integer;
  CopyMoveToDir, SoftwareNameDir: String;
  tmpFileName, FileNoPath: WideString;
  Item: TEasyItem;
  //Group: TEasyGroup;
  Continue, AddLogHeader, IsCopyFiles, AllowCopyFile: Boolean;
  {CurrentSystem, }CurrentFile, OperationErrors: Integer;
  tmpFileSize, iFilesSizeFailed: Int64;
  FileSizeText, DateTimeText: String;
  ErrorMsg: DWORD;
  tmpStr: String;

  function SetSysIcon(sysID: Integer; IsCustomGame: Boolean): Boolean;
  begin
    if IsCustomGame then
       begin
         Result:= (SystemIcon.Tag <> sysID) or (SystemIcon.HelpContext <> 0);
          if Result then
             begin
               SystemIcon.Tag:= sysID;
               SystemIcon.HelpContext:= 0;

               FormMain.LoadIconIntoImage(SystemsListCustom[sysID, 1], SystemIcon, -1, True);
               //FormMain.IL_StandardIconsLarge.GetIcon(MaxGameID+sysID, SystemIcon.Picture.Icon);
               //FormMain.IL_ArcadeSystem_Large.GetIcon(sysID, SystemIcon.Picture.Icon);
             end;
       end
    else
       begin
          Result:= (SystemIcon.Tag <> sysID)  or (SystemIcon.HelpContext <> -1);
          if Result then
             begin
               SystemIcon.Tag:= sysID;
               SystemIcon.HelpContext:= -1;
               FormMain.LoadIconIntoImage(FormMain.GetArcadeSystemIconFileName(sysID), SystemIcon);
               //FormMain.IL_ArcadeSystem_Large.GetIcon(sysID, SystemIcon.Picture.Icon);
             end;
       end;
  end;

  function SetMediaTypeIcon(MediaTypeID, FileTypeID: Integer; IsCustomGame: Boolean): Boolean;
  var
    ChangeID: Integer;
  begin
    if IsCustomGame then
       begin
         if (MediaTypeID = -1) or (IconFileType.HelpContext <> 0) then
            begin
              Result:= IconFileType.Tag <> (MediaTypeID+8);
            end
         else
            Result:= True; // must change the CHD icon file... different icons now (September 21, 2016)

         if Result then
            begin
              IconFileType.Tag:= MediaTypeID+8;
              IconFileType.HelpContext:= 0;
              IL_MediaType.GetIcon(IconFileType.Tag, IconFileType.Picture.Icon);
            end;
       end
    else
       begin
         if (MediaTypeID = -1) or (IconFileType.HelpContext <> -1) then
            begin
              Result:= IconFileType.Tag <> (FileTypeID+4);
            end
         else
            Result:= True; // must change the CHD icon file... different icons now (September 21, 2016)

         if Result then
            begin
              case MediaTypeID of
               -1: ChangeID:= FileTypeID+4;
                0: ChangeID:= 0;
                1:
                  begin
                    case FileTypeID of
                      12, 13, 14: ChangeID:= 1;
                      15, 16, 17: ChangeID:= 2;
                      18, 19, 20: ChangeID:= 3;
                      21, 22, 23: ChangeID:= 14; // Video Tape (VHS)
                    end;
                  end;
              else
                  ChangeID:= FileTypeID+4; // unknown case ????
              end;
              IconFileType.Tag:= ChangeID;
              IconFileType.HelpContext:= -1;
              IL_MediaType.GetIcon(ChangeID, IconFileType.Picture.Icon);
            end;
       end;
  end;

  function CheckCancelButton: Boolean;
  begin
    Result:= ButtonCancel.ModalResult = mrAbort;
    if Result then
       begin
         if GenerateMessage(FormCopyMoveGameFiles.Caption, 'Operation is still active.',
                          '    Not all files have been processed. You can restart this process in the previous '+
                          'screen.'+#13#10+'Are you sure you want to abort ?', 1, False, 2) = mrNo then
            begin
              ButtonCancel.ModalResult:= mrNone;
              Result:= False;
            end
         else
            ButtonCancel.ModalResult:= mrCancel; // will not show this confirmation message again!!!!
       end
    else
       Result:= ButtonCancel.ModalResult = mrCancel; // will not show this confirmation message again!!!!
  end;

  function CheckLogHeader: Boolean;
  begin
    Result:= AddLogHeader;
    if Result then
       begin
         Log.Lines.Add('Operation errors ['+FormCopyMoveGameFiles.Caption+']');
         if FormCopyMoveGameFiles.Tag <> 0 then
            begin
              if OverwriteFiles then
                 Log.Lines.Add('Overwrite files enabled.')
              else
                 Log.Lines.Add('Overwrite files disabled.');
            end;
         Log.Lines.Add('');
         AddLogHeader:= False;
       end;
  end;

  function GetErrorCode: String;
  begin
    ErrorMsg:= GetLastError;
    Result:= '[Error '+IntToStr(ErrorMsg)+': '+SysErrorMessage(ErrorMsg)+'] ';
  end;

begin
  CurrentFile:= 0; // for the progress bar
  AddLogHeader:= True;
  OperationErrors:= 0;
  iFilesSizeFailed:= 0;
  SetProgressPos(0);
  IsCopyFiles:= FormCopyMoveGameFiles.Tag = 1;
  Log.Lines.BeginUpdate;

  case Assigned(FormDeleteMultipleGamesFiles) of
    True:
      begin
        // multiple games selection

        // 1st, get the MAME files list so it will not create duplicate copies for the other systems (HBMAME, ZiNc, etc...)
        if IsCopyFiles and Assigned(FilesListMAME) then
        begin
          FilesListMAME.BeginUpdate;
          Item:= FormDeleteMultipleGamesFiles.GamesList.Groups.FirstItem;
          repeat
            if not uDeleteMultipleGamesFiles.TGameInfo(Item).eIsCustomGame then
            begin
              if uDeleteMultipleGamesFiles.TGameInfo(Item).eSystemID = idMAME then
              begin
                if Assigned(uDeleteMultipleGamesFiles.TGameInfo(Item).eGameFiles) and (uDeleteMultipleGamesFiles.TGameInfo(Item).eGameFiles.Count > 0) then
                begin
                  //ShowMessageW(uDeleteMultipleGamesFiles.TGameInfo(Item).eGameFiles.Text);
                  for Loop:=0 to uDeleteMultipleGamesFiles.TGameInfo(Item).eGameFiles.Count-1 do
                  begin
                    // 00 -> rom; 01 -> CHD; -1 -> config files
                    // media_type FileID IsParentCHD filename
                    // 01120 simpbowl.chd
                    // 00000 elvator.rom
                    // -1000 elvator.cfg
                    tmpStr:= uDeleteMultipleGamesFiles.TGameInfo(Item).eGameFiles[Loop];
                    tmpFileName:= tmpStr;
                    Delete(tmpFileName, 1, 6);

                    FilesListMAME.Add(tmpFileName);
                  end;
                end;
              end;
            end;
            Item:= FormDeleteMultipleGamesFiles.GamesList.Groups.NextItem(Item);
          until Item = nil;
          FilesListMAME.EndUpdate;

          if FilesListMAME.Count = 0 then
             FreeAndNil(FilesListMAME)
        end;

        Item:= FormDeleteMultipleGamesFiles.GamesList.Groups.FirstItem;
        repeat
          Continue:= False;

          if uDeleteMultipleGamesFiles.TGameInfo(Item).eIsCustomGame then
          begin
            SetSysIcon(uDeleteMultipleGamesFiles.TGameInfo(Item).eCustomSystemID, True);
            LabelGameTitle.Caption:= uDeleteMultipleGamesFiles.TGameInfo(Item).eTitle;
            LabelGameNameCloneOf.Caption:= 'name: '+uDeleteMultipleGamesFiles.TGameInfo(Item).eName;

             tmpFileName:= uDeleteMultipleGamesFiles.TGameInfo(Item).eCustomGameFileFullPath;
             // console/computer
             // media_type -> MediaTypeCustom[] array indexes 01..05
             // media_type IsUnicode filename
             // 00         1         blal-filename-fullpath.rom
             // 01         0         blal-cd-file-fullpath.iso

             // if 4th char position is a space char, then it's a EmuCon game...

             tmpMediaType:= uDeleteMultipleGamesFiles.TGameInfo(Item).eCustomMediaType;
             tmpFileType:= -1; // not used here...

             if FormCopyMoveGameFiles.Tag = 0 then // is DELETE game file mode ???
                 Continue:= FormDeleteMultipleGamesFiles.DeleteGameFileFromDisk.Checked
             else
                 Continue:= True;

             if Continue then
                begin
                  if FileExistsW(tmpFileName) then
                     begin
                       AllowCopyFile:= True;
                       SetMediaTypeIcon(tmpMediaType, tmpFileType, True);
                       LabelFileType.Caption:= FormMain.GetFileTypeText(uDeleteMultipleGamesFiles.TGameInfo(Item).eCustomSystemID,
                                                                        0{tmpMediaType}, tmpFileType, uDeleteMultipleGamesFiles.TGameInfo(Item).eIsCustomGame, uDeleteMultipleGamesFiles.TGameInfo(Item).eCustomMediaType);
                       LabelGameFile.Caption:= tmpFileName;
                       FileNoPath:= ExtractFileNameW(tmpFileName);

                       SoftwareNameDir:= '';
                       CopyMoveToDir:= DestinationFullPath;
                       if MultiSystems or AddSystemFolder then
                          CopyMoveToDir:= CopyMoveToDir+SystemsListCustom[uDeleteMultipleGamesFiles.TGameInfo(Item).eCustomSystemID, 0]+'\';

                       if tmpMediaType > 0 then
                          CopyMoveToDir:= CopyMoveToDir+MediaTypeCustom[tmpMediaType, 2]+'\';

                       tmpFileSize:= GetFileSizeW(tmpFileName);
                       FileSizeText:= FormMain.GetSizeType(tmpFileSize, False);
                       DateTimeText:= FormMain.GetDateTimeStr(FileAgeW(tmpFileName));
                       LabelFileSizeDate.Caption:= Format('Size: %-14s', [FileSizeText])+'  Date Modified: '+DateTimeText;

                       iTotalFilesSizeLeft:= iTotalFilesSizeLeft-tmpFileSize;

                       case FormCopyMoveGameFiles.Tag of // ActionMode
                         0: // delete file
                           begin
                             case DeleteFileW(PWideChar(tmpFileName)) of
                               True:
                                 begin
                                   // not used here... yet ???
                                   //if tmpMediaType in [0, 1] then
                                   //   begin
                                   //     if uDeleteMultipleGamesFiles.TGameInfo(Item).eSoftwareName = '' then
                                   //        ArcadeSystemChanged[uDeleteMultipleGamesFiles.TGameInfo(Item).eSystemID]:= True;
                                   //   end;
                                 end;
                               False:
                                 begin
                                   CheckLogHeader;
                                   Log.Lines.Add(GetErrorCode+'delete '+tmpFileName);
                                   Inc(OperationErrors);
                                 end;
                             end;
                           end;
                         1: // copy file
                           begin
                             if AllowCopyFile then
                             begin
                               if not DirectoryExists(CopyMoveToDir) then
                                  begin
                                    if not ForceDirectories(CopyMoveToDir) then
                                       Log.Lines.Add(GetErrorCode+'create folder '+CopyMoveToDir);
                                  end;

                               if not CopyFileW(PWideChar(tmpFileName), PWideChar(CopyMoveToDir+FileNoPath), (not OverwriteFiles)) then
                                  begin
                                    CheckLogHeader;
                                    Log.Lines.Add(GetErrorCode+tmpFileName+' copy to '+CopyMoveToDir+FileNoPath);
                                    Inc(OperationErrors);
                                  end;
                             end;
                           end;
                         2: // move file
                           begin
                             if not DirectoryExists(CopyMoveToDir) then
                                begin
                                  if not ForceDirectories(CopyMoveToDir) then
                                     Log.Lines.Add(GetErrorCode+'create folder '+CopyMoveToDir);
                                end;
                             if not MoveFileW(tmpFileName, CopyMoveToDir+FileNoPath, OverwriteFiles) then
                                begin
                                  CheckLogHeader;
                                  Log.Lines.Add(GetErrorCode+tmpFileName+' move to '+CopyMoveToDir+FileNoPath);
                                  Inc(OperationErrors);
                                end;
                           end;
                       end;
                     end
                  else
                     begin
                       // game file was not found... show an error message ?
                       CheckLogHeader;
                       tmpStr:= '';
                       case FormCopyMoveGameFiles.Tag of
                         0: tmpStr:= 'delete ';
                         1: tmpStr:= 'copy ';
                         2: tmpStr:= 'move ';
                       end;
                       Log.Lines.Add(GetErrorCode+tmpStr+tmpFileName);
                       Inc(OperationErrors);
                     end;
                end;
             Inc(CurrentFile);
             UpdateTotalLeftLabel(iTotalFiles-(CurrentFile));
             UpdateProgressBar(CurrentFile, iTotalFiles);
             Application.ProcessMessages;
             //ShowMessage('pause');
             //sleep(1500); // for testing/debugging only
             if CheckCancelButton then
                Break;
          end
          else
          begin
            if Assigned(uDeleteMultipleGamesFiles.TGameInfo(Item).eGameFiles) and (uDeleteMultipleGamesFiles.TGameInfo(Item).eGameFiles.Count > 0) then
               begin
                 SetSysIcon(uDeleteMultipleGamesFiles.TGameInfo(Item).eSystemID, False);
                 LabelGameTitle.Caption:= uDeleteMultipleGamesFiles.TGameInfo(Item).eTitle;
                 tmpFileName:= 'name: '+uDeleteMultipleGamesFiles.TGameInfo(Item).eName;
                 if FormMain.GameIsClone(uDeleteMultipleGamesFiles.TGameInfo(Item).eClone) then
                    tmpFileName:= tmpFileName+' [clone of '+uDeleteMultipleGamesFiles.TGameInfo(Item).eClone+']';
                 if uDeleteMultipleGamesFiles.TGameInfo(Item).eMerged then
                    tmpFileName:= tmpFileName+' [merged set]';
                 if uDeleteMultipleGamesFiles.TGameInfo(Item).eSoftwareName <> '' then
                    tmpFileName:= tmpFileName+ '[softlist: '+uDeleteMultipleGamesFiles.TGameInfo(Item).eSoftwareName+']';
                 LabelGameNameCloneOf.Caption:= tmpFileName;
                 tmpFileName:= '';

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

                   tmpFileName:= tmpStr;
                   Delete(tmpFileName, 1, 6);

                   case tmpMediaType of
                      0: Continue:= FormDeleteMultipleGamesFiles.DeleteROMs.Checked;
                      1: Continue:= FormDeleteMultipleGamesFiles.DeleteCHDs.Checked;
                     -1: Continue:= FormDeleteMultipleGamesFiles.DeleteCFGsNVRAMs.Checked and (FormCopyMoveGameFiles.Tag = 0); // only when deleting game files!!!
                   end;
                   if Continue then
                      begin
                        // 0 - .cfg
                        // 1 - .dat; .nv; nvram
                        // 2 - .eeprom
                        // 3 - .sram
                        // 4 - .flash
                        if FileExistsW(tmpFileName) then
                           begin
                             AllowCopyFile:= True;
                             if IsCopyFiles and (SystemIcon.Tag <> idMAME) then
                                begin
                                  if Assigned(FilesListMAME) then
                                     AllowCopyFile:= FilesListMAME.IndexOf(tmpFileName) = -1;
                                end;

                             SetMediaTypeIcon(tmpMediaType, tmpFileType, False);
                             LabelFileType.Caption:= FormMain.GetFileTypeText(uDeleteMultipleGamesFiles.TGameInfo(Item).eSystemID,
                                                                              tmpMediaType, tmpFileType, uDeleteMultipleGamesFiles.TGameInfo(Item).eIsCustomGame, uDeleteMultipleGamesFiles.TGameInfo(Item).eCustomMediaType);
                             LabelGameFile.Caption:= tmpFileName;
                             FileNoPath:= ExtractFileName(tmpFileName);

                             SoftwareNameDir:= FormMain.GetSoftwareNameFolder(uDeleteMultipleGamesFiles.TGameInfo(Item).eSoftwareName);
                             CopyMoveToDir:= DestinationFullPath;
                             if MultiSystems or AddSystemFolder then
                                CopyMoveToDir:= CopyMoveToDir+FormMain.GetArcadeSystemIniSection(uDeleteMultipleGamesFiles.TGameInfo(Item).eSystemID)+'\';
                             CopyMoveToDir:= CopyMoveToDir+SoftwareNameDir;

                             // old code... remove it ? (February 25, 2018)
                             //CopyMoveToDir:= DestinationFullPath+SoftwareNameDir;
                             //if MultiSystems or AddSystemFolder then
                             //   CopyMoveToDir:= CopyMoveToDir+FormMain.GetArcadeSystemIniSection(uDeleteMultipleGamesFiles.TGameInfo(Item).eSystemID)+'\';

                             if FormMain.IsMediaTypeCHD(tmpMediaType, False) then
                                CopyMoveToDir:= CopyMoveToDir+'chd_files\';

                             tmpFileSize:= GetFileSize(tmpFileName);
                             FileSizeText:= FormMain.GetSizeType(tmpFileSize, False);
                             DateTimeText:= FormMain.GetDateTimeStr(FileAgeW(tmpFileName));
                             LabelFileSizeDate.Caption:= Format('Size: %-14s', [FileSizeText])+'  Date Modified: '+DateTimeText;

                             iTotalFilesSizeLeft:= iTotalFilesSizeLeft-tmpFileSize;

                             case FormCopyMoveGameFiles.Tag of // ActionMode
                               0: // delete file
                                 begin
                                   //case DeleteFile(tmpFileName) of
                                   case DeleteFileW(PWideChar(tmpFileName)) of
                                     True:
                                       begin
                                         if tmpMediaType in [0, 1] then
                                            begin
                                              if uDeleteMultipleGamesFiles.TGameInfo(Item).eSoftwareName = '' then
                                                 ArcadeSystemChanged[uDeleteMultipleGamesFiles.TGameInfo(Item).eSystemID]:= True;
                                            end;
                                       end;
                                     False:
                                       begin
                                         CheckLogHeader;
                                         Log.Lines.Add(GetErrorCode+'delete '+tmpFileName);
                                         Inc(OperationErrors);
                                       end;
                                   end;
                                 end;
                               1: // copy file
                                 begin
                                   if AllowCopyFile then
                                   begin
                                     if not DirectoryExists(CopyMoveToDir) then
                                        begin
                                          if not ForceDirectories(CopyMoveToDir) then
                                             Log.Lines.Add(GetErrorCode+'create folder '+CopyMoveToDir);
                                        end;

                                     //if not CopyFile(PChar(tmpFileName), PChar(CopyMoveToDir+FileNoPath), (not OverwriteFiles)) then
                                     if not CopyFileW(PWideChar(tmpFileName), PWideChar(CopyMoveToDir+FileNoPath), (not OverwriteFiles)) then
                                        begin
                                          CheckLogHeader;
                                          Log.Lines.Add(GetErrorCode+tmpFileName+' copy to '+CopyMoveToDir+FileNoPath);
                                          Inc(OperationErrors);
                                        end;
                                   end;
                                 end;
                               2: // move file
                                 begin
                                   if not DirectoryExists(CopyMoveToDir) then
                                      begin
                                        if not ForceDirectories(CopyMoveToDir) then
                                           Log.Lines.Add(GetErrorCode+'create folder '+CopyMoveToDir);
                                      end;
                                   //if not MoveFile(tmpFileName, CopyMoveToDir+FileNoPath, OverwriteFiles) then
                                   if not MoveFileW(tmpFileName, CopyMoveToDir+FileNoPath, OverwriteFiles) then
                                      begin
                                        CheckLogHeader;
                                        Log.Lines.Add(GetErrorCode+tmpFileName+' move to '+CopyMoveToDir+FileNoPath);
                                        Inc(OperationErrors);
                                      end;
                                 end;
                             end;
                           end
                        else
                           begin
                             // game file was not found... show an error message ?
                             CheckLogHeader;
                             tmpStr:= '';
                             case FormCopyMoveGameFiles.Tag of
                               0: tmpStr:= 'delete ';
                               1: tmpStr:= 'copy ';
                               2: tmpStr:= 'move ';
                             end;
                             Log.Lines.Add(GetErrorCode+tmpStr+tmpFileName);
                             Inc(OperationErrors);
                           end;
                      end;
                   Inc(CurrentFile);
                   UpdateTotalLeftLabel(iTotalFiles-(CurrentFile));
                   UpdateProgressBar(CurrentFile, iTotalFiles);
                   Application.ProcessMessages;
                   //ShowMessage('pause');
                   //sleep(1500); // for testing/debugging only
                   if CheckCancelButton then
                      Break;
                 end;
               end;
          end;
          Item:= FormDeleteMultipleGamesFiles.GamesList.Groups.NextItem(Item);
          Application.ProcessMessages;
          //sleep(3000); // for testing/debugging only
        until (Item = nil) or (ButtonCancel.ModalResult = mrCancel);
        // end of loop thru the games to process
        if Assigned(FilesListMAME) then
           FreeAndNil(FilesListMAME);

        Application.ProcessMessages;
      end;
    False:
      begin
        // single game selection
        if FormMain.MemGameInfo.eIsCustomGame then
           SetSysIcon(FormMain.MemGameInfo.eCustomSystemID, True)
        else
           SetSysIcon(FormMain.MemGameInfo.eSystemID, False);

        LabelGameTitle.Caption:= FormMain.MemGameInfo.eTitle;
        LabelGameNameCloneOf.Caption:= FormDeleteGamesFiles.LabelGameDetails.Caption;
        tmpFileName:= '';

        if FormMain.MemGameInfo.eIsCustomGame then
        begin
          Item:= FormDeleteGamesFiles.FilesListView.Groups.FirstItem;
          repeat
            Continue:= True;
            if Item.Checked then
            begin
              if Continue then
                 begin
                   tmpMediaType:= uDeleteGamesFiles.TGameInfo(Item).eCustomMediaType;// eMediaType;
                   tmpFileType:= -1; // uDeleteGamesFiles.TGameInfo(Item).eFileType; // this is not used here!!!
                   tmpFileName:= uDeleteGamesFiles.TGameInfo(Item).eFileName;
                   if FileExistsW(tmpFileName) then
                      begin
                        SetMediaTypeIcon(tmpMediaType, tmpFileType, FormMain.MemGameInfo.eIsCustomGame);
                        LabelFileType.Caption:= FormMain.GetFileTypeText(FormMain.MemGameInfo.eCustomSystemID,
                                                                         0, tmpFileType, FormMain.MemGameInfo.eIsCustomGame, FormMain.MemGameInfo.eCustomMediaType);
                        LabelGameFile.Caption:= tmpFileName;
                        FileNoPath:= ExtractFileNameW(tmpFileName);

                        SoftwareNameDir:= '';
                        CopyMoveToDir:= DestinationFullPath;
                        if AddSystemFolder then
                           CopyMoveToDir:= CopyMoveToDir+SystemsListCustom[FormMain.MemGameInfo.eCustomSystemID, 0]+'\';

                        if tmpMediaType > 0 then // there is no media type ZERO!!!!
                           CopyMoveToDir:= CopyMoveToDir+MediaTypeCustom[tmpMediaType, 2]+'\';

                        // old code, remove it ? (February 25, 2018)
                        //CopyMoveToDir:= DestinationFullPath;
                        //if tmpMediaType > 0 then // there is no media type ZERO!!!!
                        //   CopyMoveToDir:= CopyMoveToDir+SystemsListCustom[FormMain.MemGameInfo.eCustomSystemID, 0]+'\'+MediaTypeCustom[tmpMediaType, 2]+'\';

                        tmpFileSize:= GetFileSizeW(tmpFileName);
                        FileSizeText:= FormMain.GetSizeType(tmpFileSize, False);
                        DateTimeText:= FormMain.GetDateTimeStr(FileAgeW(tmpFileName));
                        LabelFileSizeDate.Caption:= Format('Size: %-14s', [FileSizeText])+'  Date Modified: '+DateTimeText;

                        iTotalFilesSizeLeft:= iTotalFilesSizeLeft-tmpFileSize;

                        case FormCopyMoveGameFiles.Tag of // ActionMode
                          0: // delete file
                            begin
                              case DeleteFileW(PWideChar(tmpFileName)) of
                                True:
                                  begin
                                    SingleSystemChanged:= True;
                                  end;
                                False:
                                  begin
                                    CheckLogHeader;
                                    Log.Lines.Add(GetErrorCode+'delete '+tmpFileName);
                                    Inc(OperationErrors);
                                  end;
                              end;
                            end;
                          1: // copy file
                            begin
                              if not DirectoryExists(CopyMoveToDir) then
                                 begin
                                   if not ForceDirectories(CopyMoveToDir) then
                                      Log.Lines.Add(GetErrorCode+'create folder '+CopyMoveToDir);
                                 end;
                              if not CopyFileW(PWideChar(tmpFileName), PWideChar(CopyMoveToDir+FileNoPath), (not OverwriteFiles)) then
                                 begin
                                   CheckLogHeader;
                                   Log.Lines.Add(GetErrorCode+tmpFileName+' copy to '+CopyMoveToDir+FileNoPath);
                                   Inc(OperationErrors);
                                 end;
                            end;
                          2: // move file
                            begin
                              if not DirectoryExists(CopyMoveToDir) then
                                 begin
                                   if not ForceDirectories(CopyMoveToDir) then
                                      Log.Lines.Add(GetErrorCode+'create folder '+CopyMoveToDir);
                                 end;
                              if not MoveFileW(tmpFileName, CopyMoveToDir+FileNoPath, OverwriteFiles) then
                                 begin
                                   CheckLogHeader;
                                   Log.Lines.Add(GetErrorCode+tmpFileName+' move to '+CopyMoveToDir+FileNoPath);
                                   Inc(OperationErrors);
                                 end;
                            end;
                        end;
                      end
                   else
                      begin
                        // game file was not found... show an error message ?
                        CheckLogHeader;
                        tmpStr:= '';
                        case FormCopyMoveGameFiles.Tag of
                          0: tmpStr:= 'delete ';
                          1: tmpStr:= 'copy ';
                          2: tmpStr:= 'move ';
                        end;
                        Log.Lines.Add(GetErrorCode+tmpStr+tmpFileName);
                        Inc(OperationErrors);
                     end;
                 end;
              Inc(CurrentFile);
              UpdateTotalLeftLabel(iTotalFiles-(CurrentFile));
              UpdateProgressBar(CurrentFile, iTotalFiles);
              Application.ProcessMessages;
              CheckCancelButton;
            end;
            Item:= FormDeleteGamesFiles.FilesListView.Groups.NextItem(Item);
            Application.ProcessMessages;
            //ShowMessage('stop');
            //sleep(3000); // for testing/debugging only
          until (Item = nil) or (ButtonCancel.ModalResult = mrCancel);
          CheckCancelButton;
          Application.ProcessMessages;
        end
        else
        begin
          // for MAME and arcade systems only
          Item:= FormDeleteGamesFiles.FilesListView.Groups.FirstItem;
          repeat
            Continue:= True;
            if Item.Checked then
            begin
              if Continue then
                 begin
                   tmpMediaType:= uDeleteGamesFiles.TGameInfo(Item).eMediaType;
                   tmpFileType:= uDeleteGamesFiles.TGameInfo(Item).eFileType;
                   tmpFileName:= uDeleteGamesFiles.TGameInfo(Item).eFileName;
                   // 0 - .cfg
                   // 1 - .dat; .nv; nvram
                   // 2 - .eeprom
                   // 3 - .sram
                   // 4 - .flash
                   if FileExistsW(tmpFileName) then
                      begin
                        SetMediaTypeIcon(tmpMediaType, tmpFileType, False);
                        LabelFileType.Caption:= FormMain.GetFileTypeText(FormMain.MemGameInfo.eSystemID,
                                                                         tmpMediaType, tmpFileType, FormMain.MemGameInfo.eIsCustomGame, FormMain.MemGameInfo.eCustomMediaType);
                        LabelGameFile.Caption:= tmpFileName;
                        FileNoPath:= ExtractFileName(tmpFileName);

                        SoftwareNameDir:= FormMain.GetSoftwareNameFolder(uDeleteGamesFiles.TGameInfo(Item).eSoftwareName);

                        CopyMoveToDir:= DestinationFullPath;
                        if AddSystemFolder then
                           CopyMoveToDir:= CopyMoveToDir+FormMain.GetArcadeSystemIniSection(uDeleteGamesFiles.TGameInfo(Item).eSystemID)+'\';
                        CopyMoveToDir:= CopyMoveToDir+SoftwareNameDir;

                        // old code, remove it ? (February 25, 2018)
                        //if AddSystemFolder then
                        //   CopyMoveToDir:= DestinationFullPath+FormMain.GetArcadeSystemIniSection(uDeleteGamesFiles.TGameInfo(Item).eSystemID)+'\'+SoftwareNameDir
                        //else
                        //   CopyMoveToDir:= DestinationFullPath+SoftwareNameDir;

                        if FormMain.IsMediaTypeCHD(tmpMediaType, False) then //if tmpMediaType = 1 then
                           CopyMoveToDir:= CopyMoveToDir+'chd_files\';

                        tmpFileSize:= GetFileSize(tmpFileName);
                        FileSizeText:= FormMain.GetSizeType(tmpFileSize, False);
                        DateTimeText:= FormMain.GetDateTimeStr(FileAgeW(tmpFileName));
                        LabelFileSizeDate.Caption:= Format('Size: %-14s', [FileSizeText])+'  Date Modified: '+DateTimeText;

                        iTotalFilesSizeLeft:= iTotalFilesSizeLeft-tmpFileSize;

                        case FormCopyMoveGameFiles.Tag of // ActionMode
                          0: // delete file
                            begin
                              //case DeleteFile(tmpFileName) of
                              case DeleteFileW(PWideChar(tmpFileName)) of
                                True:
                                  begin
                                    if tmpMediaType in [0, 1] then
                                       SingleSystemChanged:= True;
                                  end;
                                False:
                                  begin
                                    CheckLogHeader;
                                    Log.Lines.Add(GetErrorCode+'delete '+tmpFileName);
                                    Inc(OperationErrors);
                                  end;
                              end;
                            end;
                          1: // copy file
                            begin
                              if not DirectoryExists(CopyMoveToDir) then
                                 begin
                                   if not ForceDirectories(CopyMoveToDir) then
                                      Log.Lines.Add(GetErrorCode+'create folder '+CopyMoveToDir);
                                 end;
                              //if not CopyFile(PChar(tmpFileName), PChar(CopyMoveToDir+FileNoPath), (not OverwriteFiles)) then
                              if not CopyFileW(PWideChar(tmpFileName), PWideChar(CopyMoveToDir+FileNoPath), (not OverwriteFiles)) then
                                 begin
                                   CheckLogHeader;
                                   Log.Lines.Add(GetErrorCode+tmpFileName+' copy to '+CopyMoveToDir+FileNoPath);
                                   Inc(OperationErrors);
                                 end;
                            end;
                          2: // move file
                            begin
                              if not DirectoryExists(CopyMoveToDir) then
                                 begin
                                   if not ForceDirectories(CopyMoveToDir) then
                                      Log.Lines.Add(GetErrorCode+'create folder '+CopyMoveToDir);
                                 end;
                              //if not MoveFile(tmpFileName, CopyMoveToDir+FileNoPath, OverwriteFiles) then
                              if not MoveFileW(tmpFileName, CopyMoveToDir+FileNoPath, OverwriteFiles) then
                                 begin
                                   CheckLogHeader;
                                   Log.Lines.Add(GetErrorCode+tmpFileName+' move to '+CopyMoveToDir+FileNoPath);
                                   Inc(OperationErrors);
                                 end;
                            end;
                        end;
                      end
                   else
                      begin
                        // game file was not found... show an error message ?
                        CheckLogHeader;
                        tmpStr:= '';
                        case FormCopyMoveGameFiles.Tag of
                          0: tmpStr:= 'delete ';
                          1: tmpStr:= 'copy ';
                          2: tmpStr:= 'move ';
                        end;
                        Log.Lines.Add(GetErrorCode+tmpStr+tmpFileName);
                        Inc(OperationErrors);
                     end;
                 end;
              Inc(CurrentFile);
              UpdateTotalLeftLabel(iTotalFiles-(CurrentFile));
              UpdateProgressBar(CurrentFile, iTotalFiles);
              Application.ProcessMessages;
              CheckCancelButton;
            end;
            Item:= FormDeleteGamesFiles.FilesListView.Groups.NextItem(Item);
            Application.ProcessMessages;
            //ShowMessage('stop');
            //sleep(3000); // for testing/debugging only
          until (Item = nil) or (ButtonCancel.ModalResult = mrCancel);
          CheckCancelButton;
          Application.ProcessMessages;
        end;
      end;
  end;
  if OperationErrors > 0 then
     Log.Lines[0]:= IntToStr(OperationErrors)+' '+Log.Lines[0];
  Log.Lines.EndUpdate;
  ButtonCancel.Caption:= 'Close';
  ButtonCancel.Hint:= 'Close this dialog';
  if ButtonCancel.ModalResult = mrCancel then
     LabelCanceledByUser.Caption:= 'Operation canceled by user! '
  else
     LabelCanceledByUser.Caption:= 'Operation finished! ';

  if OperationErrors > 0 then
     begin
       //FormCopyMoveGameFiles.ClientHeight:= 393;//377;
       LabelCanceledByUser.Caption:= LabelCanceledByUser.Caption+'Failed to process one or more files. ';
     end
  else
     LabelCanceledByUser.Caption:= LabelCanceledByUser.Caption+'No errors. ';

  ButtonCancel.ModalResult:= mrOk;
  LabelCanceledByUser.Visible:= True;
  if (FormCopyMoveGameFiles.Tag in [0, 2]) and (iTotalFiles = 0) then // no files to delete and the form.tag is "Delete" action mode
     PostMessage(Handle, WM_CLOSE, 0, 0); // force close this dialog... calling "Close" doesn't work on OnActivate() event!!!
end;

procedure TFormCopyMoveGameFiles.ButtonPauseClick(Sender: TObject);
begin
  ButtonPause.Tag:= Ord(not Boolean(ButtonPause.Tag));
  case ButtonPause.Tag of
    0: ButtonPause.Caption:= 'Pause';
    1: ButtonPause.Caption:= 'Resume';
  end;
end;

procedure TFormCopyMoveGameFiles.FormActivate(Sender: TObject);
begin
  //ShowMessage('Debug mode, comment me later!');
  //Exit; // for debugging only, do not enable

  if LabelCopyToTitle.Tag = 0 then
     begin
       LabelCopyToTitle.Tag:= 1;
       ProcessFiles; // call function to actually delete/copy/move files
     end;
end;

procedure TFormCopyMoveGameFiles.ButtonCancelClick(Sender: TObject);
begin
  if ButtonCancel.ModalResult = mrOk then
     Close
  else
     ButtonCancel.ModalResult:= mrAbort;
end;

end.
