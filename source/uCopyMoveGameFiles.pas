unit uCopyMoveGameFiles;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, uCommon, MPCommonObjects, MPCommonUtilities, EasyListview,
  ImgList, StdCtrls, Buttons, ComCtrls, ShadowLabel, PanelEx, ExtCtrls,
  IniFiles, GraphicEx, RichEditURL;

type
  TFormCopyMoveGameFiles = class(TForm)
    PanelProgress: TPanelEx;
    ProgressBar: TProgressBar;
    ButtonPause: TBitBtn;
    ButtonCancel: TBitBtn;
    PanelGameTitle: TPanelEx;
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
    SystemChanged: packed array[1..MaxArcadeSystems] of Boolean;
    SingleSystemChanged, OverwriteFiles: Boolean;
  end;

var
  FormCopyMoveGameFiles: TFormCopyMoveGameFiles;

implementation

uses uMain, uDeleteMultipleGamesFiles, uDeleteGamesFiles;//, uZipFilesNotUsed;

{$R *.dfm}

procedure TFormCopyMoveGameFiles.LoadMediaIcons;
var
  Loop: ShortInt;
  Folder: String;
begin
  Folder:= FormMain.GetFolderFull(32);
  for Loop:=Low(aMediaType)+1 to High(aMediaType) do
      FormMain.AddDefaultIcons(aMediaType[Loop, 1]+'.ico', Folder, IL_MediaType);
  FormMain.AddDefaultIcons('settings.ico', Folder, IL_MediaType);  // 2
  FormMain.AddDefaultIcons('bios_chip.ico', Folder, IL_MediaType); // 3
  FormMain.AddDefaultIcons('bios_chip.ico', Folder, IL_MediaType); // 4
  FormMain.AddDefaultIcons('bios_chip.ico', Folder, IL_MediaType); // 5
  FormMain.AddDefaultIcons('bios_chip.ico', Folder, IL_MediaType); // 6
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
  Loop, CurrentSystem: Integer;
  CurrentSoftwareName: String;
  ActionStr: String;
  HasMAME: Boolean;
begin
  Left:= (Screen.Width shr 1)-(Width shr 1)-1;
  Top:= (Screen.Height shr 1)-(Height shr 1)-1;

  LoadMediaIcons;

  SingleSystemChanged:= False;
  for Loop:= 1 to MaxArcadeSystems do
      SystemChanged[Loop]:= False;

  MultiSystems:= False;
  HasMAME:= False;
  if Assigned(FormDeleteMultipleGamesFiles) then
     begin
       CurrentSystem:= -1;
       CurrentSoftwareName:= '';
       Item:= FormDeleteMultipleGamesFiles.GamesList.Groups.FirstItem;
       repeat
         if CurrentSystem = -1 then
            begin
              CurrentSystem:= uDeleteMultipleGamesFiles.TGameInfo(Item).eSystemID;
              CurrentSoftwareName:= uDeleteMultipleGamesFiles.TGameInfo(Item).eSoftwareName;
            end
         else
            begin
              if (uDeleteMultipleGamesFiles.TGameInfo(Item).eSystemID <> CurrentSystem) or
                 (uDeleteMultipleGamesFiles.TGameInfo(Item).eSoftwareName <> CurrentSoftwareName) then
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

  //LabelRemainingFiles.Caption:= Format('Remaining %.0n (%s)', [(TotalFilesLeft*1.0), FormMain.GetSizeType(iTotalFilesSizeLeft, False, True)]);
  LabelCopyToTitle.Caption:= Format('%s %.0n files (%s)', [ActionStr, (iTotalFiles*1.0), FormMain.GetSizeType(iTotalFilesSize, False, True)]);
  if FormCopyMoveGameFiles.Tag <> 0 then
     LabelCopyToTitle.Caption:= LabelCopyToTitle.Caption+' to';
  if LabelCopyTo.Visible then
     begin
       LabelCopyTo.Left:= LabelCopyToTitle.Left+LabelCopyToTitle.Width+4;
       LabelCopyTo.Caption:= DestinationFullPath;
     end;
  FormCopyMoveGameFiles.ClientHeight:= 237;
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
  Loop, tmpMediaType, tmpFileType, fixFileType: Integer;
  tmpFileName, FileNoPath, CopyMoveToDir, SoftwareNameDir: String;
  Item: TEasyItem;
  //Group: TEasyGroup;
  Continue, AddLogHeader, IsCopyFiles, AllowCopyFile: Boolean;
  {CurrentSystem, }CurrentFile, OperationErrors: Integer;
  tmpFileSize, iFilesSizeFailed: Int64;
  FileSizeText, DateTimeText: String;
  ErrorMsg: DWORD;

  function SetSysIcon(sysID: ShortInt): Boolean;
  begin
    Result:= SystemIcon.Tag <> sysID;
    if Result then
       begin
         SystemIcon.Tag:= sysID;
         FormMain.IL_ArcadeSystem_Large.GetIcon(sysID, SystemIcon.Picture.Icon);
       end;
  end;

  function SetMediaTypeIcon(MediaTypeID, FileTypeID: Integer): Boolean;
  var
    ChangeID: Integer;
  begin
    if MediaTypeID = -1 then
       begin
         Result:= IconFileType.Tag <> (FileTypeID+2);
       end
    else
       Result:= IconFileType.Tag <> MediaTypeID;

    if Result then
       begin
         if MediaTypeID <> -1 then
            ChangeID:= MediaTypeID
         else
            ChangeID:= FileTypeID+2;
         IconFileType.Tag:= ChangeID;
         IL_MediaType.GetIcon(ChangeID, IconFileType.Picture.Icon);
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
            if uDeleteMultipleGamesFiles.TGameInfo(Item).eSystemID = idMAME then
            begin
              if Assigned(uDeleteMultipleGamesFiles.TGameInfo(Item).eGameFiles) and (uDeleteMultipleGamesFiles.TGameInfo(Item).eGameFiles.Count > 0) then
              begin
                //ShowMessageW(uDeleteMultipleGamesFiles.TGameInfo(Item).eGameFiles.Text);
                for Loop:=0 to uDeleteMultipleGamesFiles.TGameInfo(Item).eGameFiles.Count-1 do
                begin
                  tmpMediaType:= StrToInt(uDeleteMultipleGamesFiles.TGameInfo(Item).eGameFiles.Names[Loop]);
                  tmpFileName:= uDeleteMultipleGamesFiles.TGameInfo(Item).eGameFiles.ValueFromIndex[Loop];
                  if tmpMediaType = 1 then
                     Delete(tmpFileName, 1, 2);
                  FilesListMAME.Add(tmpFileName);
                end;
              end;
            end;
            Item:= FormDeleteMultipleGamesFiles.GamesList.Groups.NextItem(Item);
          until Item = nil;
          FilesListMAME.EndUpdate;
          //ShowMessageW('Files list:'+#13#10+FilesListMAME.Text);
          if FilesListMAME.Count = 0 then
             FreeAndNil(FilesListMAME)
        end;

        Item:= FormDeleteMultipleGamesFiles.GamesList.Groups.FirstItem;
        repeat
          Continue:= False;

          if Assigned(uDeleteMultipleGamesFiles.TGameInfo(Item).eGameFiles) and (uDeleteMultipleGamesFiles.TGameInfo(Item).eGameFiles.Count > 0) then
             begin
               SetSysIcon(uDeleteMultipleGamesFiles.TGameInfo(Item).eSystemID);
               LabelGameTitle.Caption:= uDeleteMultipleGamesFiles.TGameInfo(Item).eTitle;
               tmpFileName:= 'name: '+uDeleteMultipleGamesFiles.TGameInfo(Item).eName;
               if FormMain.GameIsClone(uDeleteMultipleGamesFiles.TGameInfo(Item).eClone) then
                  tmpFileName:= tmpFileName+' [clone of '+uDeleteMultipleGamesFiles.TGameInfo(Item).eClone+']';
               if FormMain.ValidateBiosName(uDeleteMultipleGamesFiles.TGameInfo(Item).eBiosName, uDeleteMultipleGamesFiles.TGameInfo(Item).eName) then
                  tmpFileName:= tmpFileName+' [bios: '+uDeleteMultipleGamesFiles.TGameInfo(Item).eBiosName+']';
               if uDeleteMultipleGamesFiles.TGameInfo(Item).eMerged then
                  tmpFileName:= tmpFileName+' [merged set]';
               if uDeleteMultipleGamesFiles.TGameInfo(Item).eSoftwareName <> '' then
                  tmpFileName:= tmpFileName+ '[xml file: '+uDeleteMultipleGamesFiles.TGameInfo(Item).eSoftwareName+']';
               LabelGameNameCloneOf.Caption:= tmpFileName;
               tmpFileName:= '';

               for Loop:=0 to uDeleteMultipleGamesFiles.TGameInfo(Item).eGameFiles.Count-1 do
               begin
                 tmpMediaType:= StrToInt(uDeleteMultipleGamesFiles.TGameInfo(Item).eGameFiles.Names[Loop]);
                 case tmpMediaType of
                    0: Continue:= FormDeleteMultipleGamesFiles.DeleteROMs.Checked;
                    1: Continue:= FormDeleteMultipleGamesFiles.DeleteCHDs.Checked;
                   -1: Continue:= FormDeleteMultipleGamesFiles.DeleteCFGsNVRAMs.Checked and (FormCopyMoveGameFiles.Tag = 0); // only when deleting game files!!!
                 end;
                 if Continue then
                    begin
                      tmpFileType:= -1;
                      tmpFileName:= uDeleteMultipleGamesFiles.TGameInfo(Item).eGameFiles.ValueFromIndex[Loop];
                      case tmpMediaType of
                        -1: // file type and CHD
                          begin
                            // config files
                            tmpFileType:= StrToInt(tmpFileName[1]);
                            Delete(tmpFileName, 1, 2);
                          end;
                        1: // CHDs
                          begin
                            Delete(tmpFileName, 1, 2);
                          end;
                      end;
                      // 0 - .cfg
                      // 1 - .dat; .nv; nvram
                      // 2 - .eeprom
                      // 3 - .sram
                      // 4 - .flash
                      fixFileType:= tmpFileType;
                      if FormMain.IsMAMEBasedSys(uDeleteMultipleGamesFiles.TGameInfo(Item).eSystemID) then
                         begin
                           if (tmpMediaType = -1) and (tmpFileType = 1) then
                              fixFileType:= FormMain.FixMAMENVRAMFileType(tmpFileName);
                         end;

                      if FileExists(tmpFileName) then
                         begin
                           AllowCopyFile:= True;
                           if IsCopyFiles and (SystemIcon.Tag <> idMAME) then
                              begin
                                if Assigned(FilesListMAME) then
                                   AllowCopyFile:= FilesListMAME.IndexOf(tmpFileName) = -1;
                              end;

                           SetMediaTypeIcon(tmpMediaType, fixFileType);
                           LabelFileType.Caption:= FormMain.GetFileTypeText(uDeleteMultipleGamesFiles.TGameInfo(Item).eSystemID,
                                                                            tmpMediaType, fixFileType);
                           LabelGameFile.Caption:= tmpFileName;
                           FileNoPath:= ExtractFileName(tmpFileName);

                           SoftwareNameDir:= FormMain.GetSoftwareNameFolder(uDeleteMultipleGamesFiles.TGameInfo(Item).eSoftwareName);
                           CopyMoveToDir:= DestinationFullPath+SoftwareNameDir;
                           if MultiSystems then
                              begin
                                if uDeleteMultipleGamesFiles.TGameInfo(Item).eSystemID <> idMAME then
                                   CopyMoveToDir:= CopyMoveToDir+FormMain.GetSystemIniSection(uDeleteMultipleGamesFiles.TGameInfo(Item).eSystemID)+'\';
                              end;
                           if tmpMediaType = 1 then
                              CopyMoveToDir:= CopyMoveToDir+'chd_files\';

                           tmpFileSize:= GetFileSize(tmpFileName);
                           FileSizeText:= FormMain.GetSizeType(tmpFileSize, False);
                           DateTimeText:= FormMain.GetDateTimeStr(FileAge(tmpFileName));
                           LabelFileSizeDate.Caption:= Format('Size: %-14s', [FileSizeText])+'  Date Modified: '+DateTimeText;

                           iTotalFilesSizeLeft:= iTotalFilesSizeLeft-tmpFileSize;

                           case FormCopyMoveGameFiles.Tag of // ActionMode
                             0: // delete file
                               begin
                                 case DeleteFile(tmpFileName) of
                                   True:
                                     begin
                                       if tmpMediaType in [0, 1] then
                                          begin
                                            if uDeleteMultipleGamesFiles.TGameInfo(Item).eSoftwareName = '' then
                                               SystemChanged[uDeleteMultipleGamesFiles.TGameInfo(Item).eSystemID]:= True;
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

                                   if not CopyFile(PChar(tmpFileName), PChar(CopyMoveToDir+FileNoPath), (not OverwriteFiles)) then
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
                                 if not MoveFile(tmpFileName, CopyMoveToDir+FileNoPath, OverwriteFiles) then
                                    begin
                                      CheckLogHeader;
                                      Log.Lines.Add(GetErrorCode+tmpFileName+' move to '+CopyMoveToDir+FileNoPath);
                                      Inc(OperationErrors);
                                    end;
                               end;
                           end;
                         end;
                    end;
                 Inc(CurrentFile);
                 UpdateTotalLeftLabel(iTotalFiles-(CurrentFile));
                 UpdateProgressBar(CurrentFile, iTotalFiles);
                 Application.ProcessMessages;
                 if CheckCancelButton then
                    Break;
               end;
             end;

          Item:= FormDeleteMultipleGamesFiles.GamesList.Groups.NextItem(Item);
          Application.ProcessMessages;
          //sleep(1000); // for testing/debugging only
        until (Item = nil) or (ButtonCancel.ModalResult = mrCancel);
        // end of loop thru the games to process
        if Assigned(FilesListMAME) then
           FreeAndNil(FilesListMAME);
           
        Application.ProcessMessages;

      end;
    False:
      begin
        // single game selection
        SetSysIcon(FormMain.MemGameInfo.eSystemID);
        LabelGameTitle.Caption:= FormMain.MemGameInfo.eTitle;
        LabelGameNameCloneOf.Caption:= FormDeleteGamesFiles.LabelGameDetails.Caption;
        tmpFileName:= '';
        Item:= FormDeleteGamesFiles.FilesListView.Groups.FirstItem;
        repeat
          Continue:= True;
          if Item.Checked then
          begin
            if Continue then
               begin
                 tmpMediaType:= uDeleteGamesFiles.TGameInfo(Item).eMediaType;
                 fixFileType:= uDeleteGamesFiles.TGameInfo(Item).eFileType;
                 tmpFileName:= uDeleteGamesFiles.TGameInfo(Item).eFileName;
                 // 0 - .cfg
                 // 1 - .dat; .nv; nvram
                 // 2 - .eeprom
                 // 3 - .sram
                 // 4 - .flash
                 if FileExists(tmpFileName) then
                    begin
                      SetMediaTypeIcon(tmpMediaType, fixFileType);
                      LabelFileType.Caption:= FormMain.GetFileTypeText(FormMain.MemGameInfo.eSystemID,
                                                                       tmpMediaType, fixFileType);
                      LabelGameFile.Caption:= tmpFileName;
                      FileNoPath:= ExtractFileName(tmpFileName);

                      SoftwareNameDir:= FormMain.GetSoftwareNameFolder(uDeleteGamesFiles.TGameInfo(Item).eSoftwareName);
                      CopyMoveToDir:= DestinationFullPath+SoftwareNameDir;
                      if tmpMediaType = 1 then
                         CopyMoveToDir:= CopyMoveToDir+'chd_files\';

                      tmpFileSize:= GetFileSize(tmpFileName);
                      FileSizeText:= FormMain.GetSizeType(tmpFileSize, False);
                      DateTimeText:= FormMain.GetDateTimeStr(FileAge(tmpFileName));
                      LabelFileSizeDate.Caption:= Format('Size: %-14s', [FileSizeText])+'  Date Modified: '+DateTimeText;

                      iTotalFilesSizeLeft:= iTotalFilesSizeLeft-tmpFileSize;

                      case FormCopyMoveGameFiles.Tag of // ActionMode
                        0: // delete file
                          begin
                            case DeleteFile(tmpFileName) of
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
                            if not CopyFile(PChar(tmpFileName), PChar(CopyMoveToDir+FileNoPath), (not OverwriteFiles)) then
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
                            if not MoveFile(tmpFileName, CopyMoveToDir+FileNoPath, OverwriteFiles) then
                               begin
                                 CheckLogHeader;
                                 Log.Lines.Add(GetErrorCode+tmpFileName+' move to '+CopyMoveToDir+FileNoPath);
                                 Inc(OperationErrors);
                               end;
                          end;
                      end;
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
          //sleep(1000); // for testing/debugging only
        until (Item = nil) or (ButtonCancel.ModalResult = mrCancel);
        CheckCancelButton;
        Application.ProcessMessages;
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
     LabelCanceledByUser.Caption:= 'All operations finished! ';

  if OperationErrors > 0 then
     FormCopyMoveGameFiles.ClientHeight:= 377
  else
     LabelCanceledByUser.Caption:= LabelCanceledByUser.Caption+'No errors. ';

  ButtonCancel.ModalResult:= mrOk;
  LabelCanceledByUser.Visible:= True;
end;

{
procedure TFormCopyMoveGameFiles.ProcessFiles;
var
  Loop, tmpMediaType, tmpFileType, fixFileType: Integer;
  tmpFileName, FileNoPath, CopyMoveToDir, SoftwareNameDir: String;
  Item: TEasyItem;
  //Group: TEasyGroup;
  Continue, AddLogHeader, IsCopyFiles, AllowCopyFile: Boolean;
  CurrentSystem, CurrentFile, OperationErrors: Integer;
  tmpFileSize, iFilesSizeFailed: Int64;
  FileSizeText, DateTimeText: String;
  ErrorMsg: DWORD;

  function SetSysIcon(sysID: ShortInt): Boolean;
  begin
    Result:= SystemIcon.Tag <> sysID;
    if Result then
       begin
         SystemIcon.Tag:= sysID;
         FormMain.IL_ArcadeSystem_Large.GetIcon(sysID, SystemIcon.Picture.Icon);
       end;
  end;

  function SetMediaTypeIcon(MediaTypeID, FileTypeID: Integer): Boolean;
  var
    ChangeID: Integer;
  begin
    if MediaTypeID = -1 then
       begin
         Result:= IconFileType.Tag <> (FileTypeID+2);
       end
    else
       Result:= IconFileType.Tag <> MediaTypeID;

    if Result then
       begin
         if MediaTypeID <> -1 then
            ChangeID:= MediaTypeID
         else
            ChangeID:= FileTypeID+2;
         IconFileType.Tag:= ChangeID;
         IL_MediaType.GetIcon(ChangeID, IconFileType.Picture.Icon);
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
        //if Assigned(FilesListMAME) then
        //   FilesListMAME.BeginUpdate;
        for CurrentSystem:= 1 to MaxArcadeSystems do
        begin
          Item:= FormDeleteMultipleGamesFiles.GamesList.Groups.FirstItem;
          repeat
            Continue:= False;
            if uDeleteMultipleGamesFiles.TGameInfo(Item).eSystemID = CurrentSystem then
            begin
            if Assigned(uDeleteMultipleGamesFiles.TGameInfo(Item).eGameFiles) and (uDeleteMultipleGamesFiles.TGameInfo(Item).eGameFiles.Count > 0) then
               begin
                 SetSysIcon(uDeleteMultipleGamesFiles.TGameInfo(Item).eSystemID);
                 LabelGameTitle.Caption:= uDeleteMultipleGamesFiles.TGameInfo(Item).eTitle;
                 tmpFileName:= 'name: '+uDeleteMultipleGamesFiles.TGameInfo(Item).eName;
                 if FormMain.GameIsClone(uDeleteMultipleGamesFiles.TGameInfo(Item).eClone) then
                    tmpFileName:= tmpFileName+' [clone of '+uDeleteMultipleGamesFiles.TGameInfo(Item).eClone+']';
                 if FormMain.ValidateBiosName(uDeleteMultipleGamesFiles.TGameInfo(Item).eBiosName, uDeleteMultipleGamesFiles.TGameInfo(Item).eName) then
                    tmpFileName:= tmpFileName+' [bios: '+uDeleteMultipleGamesFiles.TGameInfo(Item).eBiosName+']';
                 if uDeleteMultipleGamesFiles.TGameInfo(Item).eMerged then
                    tmpFileName:= tmpFileName+' [merged set]';
                 if uDeleteMultipleGamesFiles.TGameInfo(Item).eSoftwareName <> '' then
                    tmpFileName:= tmpFileName+ '[xml file: '+uDeleteMultipleGamesFiles.TGameInfo(Item).eSoftwareName+']';
                 LabelGameNameCloneOf.Caption:= tmpFileName;
                 tmpFileName:= '';

                 for Loop:=0 to uDeleteMultipleGamesFiles.TGameInfo(Item).eGameFiles.Count-1 do
                 begin
                   tmpMediaType:= StrToInt(uDeleteMultipleGamesFiles.TGameInfo(Item).eGameFiles.Names[Loop]);
                   case tmpMediaType of
                      0: Continue:= FormDeleteMultipleGamesFiles.DeleteROMs.Checked;
                      1: Continue:= FormDeleteMultipleGamesFiles.DeleteCHDs.Checked;
                     -1: Continue:= FormDeleteMultipleGamesFiles.DeleteCFGsNVRAMs.Checked and (FormCopyMoveGameFiles.Tag = 0); // only when deleting game files!!!
                   end;
                   if Continue then
                      begin
                        tmpFileType:= -1;
                        tmpFileName:= uDeleteMultipleGamesFiles.TGameInfo(Item).eGameFiles.ValueFromIndex[Loop];
                        case tmpMediaType of
                          -1: // file type and CHD
                            begin
                              // config files
                              tmpFileType:= StrToInt(tmpFileName[1]);
                              Delete(tmpFileName, 1, 2);
                            end;
                          1: // CHDs
                            begin
                              Delete(tmpFileName, 1, 2);
                            end;
                        end;
                        // 0 - .cfg
                        // 1 - .dat; .nv; nvram
                        // 2 - .eeprom
                        // 3 - .sram
                        // 4 - .flash
                        fixFileType:= tmpFileType;
                        if FormMain.IsMAMEBasedSys(uDeleteMultipleGamesFiles.TGameInfo(Item).eSystemID) then
                           begin
                             if (tmpMediaType = -1) and (tmpFileType = 1) then
                                fixFileType:= FormMain.FixMAMENVRAMFileType(tmpFileName);
                           end;

                        if FileExists(tmpFileName) then
                           begin
                             AllowCopyFile:= True;
                             // disabled... why do this ????? November 01, 2015
                             //if IsCopyFiles then
                             //   begin
                             //     if CurrentSystem = idMAME then
                             //        begin
                             //          if Assigned(FilesListMAME) then
                             //             FilesListMAME.Add(tmpFileName);
                             //        end
                             //     else
                             //        begin
                             //          if Assigned(FilesListMAME) then
                             //             AllowCopyFile:= FilesListMAME.IndexOf(tmpFileName) = -1;
                             //        end;
                             //   end;
                             SetMediaTypeIcon(tmpMediaType, fixFileType);
                             LabelFileType.Caption:= FormMain.GetFileTypeText(uDeleteMultipleGamesFiles.TGameInfo(Item).eSystemID,
                                                                              tmpMediaType, fixFileType);
                             LabelGameFile.Caption:= tmpFileName;
                             FileNoPath:= ExtractFileName(tmpFileName);

                             SoftwareNameDir:= FormMain.GetSoftwareNameFolder(uDeleteMultipleGamesFiles.TGameInfo(Item).eSoftwareName);
                             CopyMoveToDir:= DestinationFullPath+SoftwareNameDir;
                             if MultiSystems then
                                begin
                                  if uDeleteMultipleGamesFiles.TGameInfo(Item).eSystemID <> idMAME then
                                     CopyMoveToDir:= CopyMoveToDir+FormMain.GetSystemIniSection(uDeleteMultipleGamesFiles.TGameInfo(Item).eSystemID)+'\';
                                end;
                             if tmpMediaType = 1 then
                                CopyMoveToDir:= CopyMoveToDir+'chd_files\';

                             tmpFileSize:= GetFileSize(tmpFileName);
                             FileSizeText:= FormMain.GetSizeType(tmpFileSize, False);
                             DateTimeText:= FormMain.GetDateTimeStr(FileAge(tmpFileName));
                             LabelFileSizeDate.Caption:= Format('Size: %-14s', [FileSizeText])+'  Date/Time: '+DateTimeText;

                             iTotalFilesSizeLeft:= iTotalFilesSizeLeft-tmpFileSize;

                             case FormCopyMoveGameFiles.Tag of // ActionMode
                               0: // delete file
                                 begin
                                   case DeleteFile(tmpFileName) of
                                     True:
                                       begin
                                         if tmpMediaType in [0, 1] then
                                            begin
                                              if uDeleteMultipleGamesFiles.TGameInfo(Item).eSoftwareName = '' then
                                                 SystemChanged[uDeleteMultipleGamesFiles.TGameInfo(Item).eSystemID]:= True;
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
                                   //if AllowCopyFile then
                                   //begin
                                     if not DirectoryExists(CopyMoveToDir) then
                                        begin
                                          if not ForceDirectories(CopyMoveToDir) then
                                             Log.Lines.Add(GetErrorCode+'create folder '+CopyMoveToDir);
                                        end;

                                     if not CopyFile(PChar(tmpFileName), PChar(CopyMoveToDir+FileNoPath), (not OverwriteFiles)) then
                                        begin
                                          CheckLogHeader;
                                          Log.Lines.Add(GetErrorCode+tmpFileName+' copy to '+CopyMoveToDir+FileNoPath);
                                          Inc(OperationErrors);
                                        end;
                                   //end;
                                 end;
                               2: // move file
                                 begin
                                   if not DirectoryExists(CopyMoveToDir) then
                                      begin
                                        if not ForceDirectories(CopyMoveToDir) then
                                           Log.Lines.Add(GetErrorCode+'create folder '+CopyMoveToDir);
                                      end;
                                   if not MoveFile(tmpFileName, CopyMoveToDir+FileNoPath, OverwriteFiles) then
                                      begin
                                        CheckLogHeader;
                                        Log.Lines.Add(GetErrorCode+tmpFileName+' move to '+CopyMoveToDir+FileNoPath);
                                        Inc(OperationErrors);
                                      end;
                                 end;
                             end;
                           end;
                      end;
                   Inc(CurrentFile);
                   UpdateTotalLeftLabel(iTotalFiles-(CurrentFile));
                   UpdateProgressBar(CurrentFile, iTotalFiles);
                   Application.ProcessMessages;
                   if CheckCancelButton then
                      Break;
                 end;
               end;
            end;
            Item:= FormDeleteMultipleGamesFiles.GamesList.Groups.NextItem(Item);
            Application.ProcessMessages;
            sleep(1000); // for testing/debugging only
          until (Item = nil) or (ButtonCancel.ModalResult = mrCancel);
          // exit the system files list and get next system in the loop
          //if CurrentSystem = idMAME then
          //   begin
          //     if Assigned(FilesListMAME) then
          //        FilesListMAME.EndUpdate;
          //   end;
          if CheckCancelButton then
             Break;
          Application.ProcessMessages;
        end; // end of systems loop
        //if Assigned(FilesListMAME) then
        //   FreeAndNil(FilesListMAME);
      end;
    False:
      begin
        // single game selection
        SetSysIcon(FormMain.MemGameInfo.eSystemID);
        LabelGameTitle.Caption:= FormMain.MemGameInfo.eTitle;
        LabelGameNameCloneOf.Caption:= FormDeleteGamesFiles.LabelGameDetails.Caption;
        tmpFileName:= '';
        Item:= FormDeleteGamesFiles.FilesListView.Groups.FirstItem;
        repeat
          Continue:= True;
          if Item.Checked then
          begin
            if Continue then
               begin
                 tmpMediaType:= uDeleteGamesFiles.TGameInfo(Item).eMediaType;
                 fixFileType:= uDeleteGamesFiles.TGameInfo(Item).eFileType;
                 tmpFileName:= uDeleteGamesFiles.TGameInfo(Item).eFileName;
                 // 0 - .cfg
                 // 1 - .dat; .nv; nvram
                 // 2 - .eeprom
                 // 3 - .sram
                 // 4 - .flash
                 if FileExists(tmpFileName) then
                    begin
                      SetMediaTypeIcon(tmpMediaType, fixFileType);
                      LabelFileType.Caption:= FormMain.GetFileTypeText(FormMain.MemGameInfo.eSystemID,
                                                                       tmpMediaType, fixFileType);
                      LabelGameFile.Caption:= tmpFileName;
                      FileNoPath:= ExtractFileName(tmpFileName);

                      SoftwareNameDir:= FormMain.GetSoftwareNameFolder(uDeleteGamesFiles.TGameInfo(Item).eSoftwareName);
                      CopyMoveToDir:= DestinationFullPath+SoftwareNameDir;
                      if tmpMediaType = 1 then
                         CopyMoveToDir:= CopyMoveToDir+'chd_files\';

                      tmpFileSize:= GetFileSize(tmpFileName);
                      FileSizeText:= FormMain.GetSizeType(tmpFileSize, False);
                      DateTimeText:= FormMain.GetDateTimeStr(FileAge(tmpFileName));
                      LabelFileSizeDate.Caption:= Format('Size: %-14s', [FileSizeText])+'  Date/Time: '+DateTimeText;

                      iTotalFilesSizeLeft:= iTotalFilesSizeLeft-tmpFileSize;

                      case FormCopyMoveGameFiles.Tag of // ActionMode
                        0: // delete file
                          begin
                            case DeleteFile(tmpFileName) of
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
                            if not CopyFile(PChar(tmpFileName), PChar(CopyMoveToDir+FileNoPath), (not OverwriteFiles)) then
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
                            if not MoveFile(tmpFileName, CopyMoveToDir+FileNoPath, OverwriteFiles) then
                               begin
                                 CheckLogHeader;
                                 Log.Lines.Add(GetErrorCode+tmpFileName+' move to '+CopyMoveToDir+FileNoPath);
                                 Inc(OperationErrors);
                               end;
                          end;
                      end;
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
          //sleep(1000); // for testing/debugging only
        until (Item = nil) or (ButtonCancel.ModalResult = mrCancel);
        CheckCancelButton;
        Application.ProcessMessages;
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
     LabelCanceledByUser.Caption:= 'All operations finished! ';

  if OperationErrors > 0 then
     FormCopyMoveGameFiles.ClientHeight:= 377
  else
     LabelCanceledByUser.Caption:= LabelCanceledByUser.Caption+'No errors. ';

  ButtonCancel.ModalResult:= mrOk;
  LabelCanceledByUser.Visible:= True;
end;
}
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
