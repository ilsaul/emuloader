unit uZipFilesNotUsed;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  StdCtrls, MPCommonObjects, MPCommonUtilities,
  EasyListview, uCommon, IniFiles, ExtCtrls, PanelEx, Buttons,
  AdvOfficeButtons, ShadowLabel, Dialogs;

type
  TSysGroupInfo = class(TEasyGroupStored)
  private
    fSystemID: Integer;
    fTitle: String;
  protected
    function GetCaptions(Line: Integer): Widestring; override;
    function GetImageIndexes(Column: Integer): TCommonImageIndexInteger; override;
  public
    property eSystemID: Integer read fSystemID write fSystemID;
    property eTitle: String read fTitle write fTitle;
  end;

  TZipGameInfo = class(TEasyItemStored)
  private
    fSystemID: Integer;
    fFullPath: String;
    fFileName: String;
    fSize: Int64;
    fSizeText: String;
    fDateTime: Integer;
    fDateTimeText: String;
  protected
    function GetCaptions(Column: Integer): WideString; override;
    //function GetStateImageIndexes(Column: Integer): TCommonImageIndexInteger; override;
    function GetImageIndexes(Column: Integer): TCommonImageIndexInteger; override;
  public
    property eSystemID: Integer read fSystemID write fSystemID;
    property eFullPath: String read fFullPath write fFullPath;
    property eFileName: String read fFileName write fFileName;
    property eSize: Int64 read fSize write fSize;
    property eSizeText: String read fSizeText write fSizeText;
    property eDateTime: Integer read fDateTime write fDateTime;
    property eDateTimeText: String read fDateTimeText write fDateTimeText;
  end;

type
  TFormZipFilesNotUsed = class(TForm)
    ZipFilesListView: TEasyListview;
    ButtonDeleteFiles: TBitBtn;
    ButtonMoveSelectedFiles: TBitBtn;
    ButtonRemoveSelected: TBitBtn;
    ButtonSaveToFile: TBitBtn;
    ButtonHelp: TBitBtn;
    ButtonClose: TBitBtn;
    BottomBar: TPanelEx;
    ButtonMoveFiles: TBitBtn;
    LabelDestinationFolder: TShadowLabel;
    DestinationFolder: TEdit;
    ButtonSelectROMsFolder: TBitBtn;
    PanelEx1: TPanelEx;
    LabelTotalItems: TShadowLabel;
    ButtonDeleteSelectedFiles: TBitBtn;
    CopyMoveOverwriteFiles: TAdvOfficeCheckBox;
    LabelCopyMoveDestination: TShadowLabel;
    procedure FormShow(Sender: TObject);
    procedure ZipFilesListViewItemPaintText(Sender: TCustomEasyListview;
      Item: TEasyItem; Position: Integer; ACanvas: TCanvas);
    procedure ButtonSaveToFileClick(Sender: TObject);
    procedure ButtonDeleteFilesClick(Sender: TObject);
    procedure ButtonRemoveSelectedClick(Sender: TObject);
    procedure ZipFilesListViewKeyAction(Sender: TCustomEasyListview;
      var CharCode: Word; var Shift: TShiftState; var DoDefault: Boolean);
    procedure ButtonHelpClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    function ZipFilesListViewGroupCompare(Sender: TCustomEasyListview;
      Item1, Item2: TEasyGroup): Integer;
    procedure ZipFilesListViewColumnClick(Sender: TCustomEasyListview;
      Button: TCommonMouseButton; ShiftState: TShiftState;
      const Column: TEasyColumn);
    function ZipFilesListViewItemCompare(Sender: TCustomEasyListview;
      Column: TEasyColumn; Group: TEasyGroup; Item1, Item2: TEasyItem;
      var DoDefault: Boolean): Integer;
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure ButtonSelectROMsFolderClick(Sender: TObject);
  private
    { Private declarations }
    HaveSystem: array[1..MaxArcadeSystems] of Boolean;
    ZipFilesMAMEGames: THashedStringList;
    ZipFilesList: array[1..MaxArcadeSystems] of THashedStringList;
    ActionString: String;
    FilesTotalSize: Int64;
    //FilesTotalCount: Integer;

    function  GetTotalSizeSelected(SelectedOnly: Boolean = True): Int64;
    procedure LoadFiles;
    function  GetZipFiles(sysID: ShortInt): Boolean;
    //function  ProcessFiles: Boolean;
    procedure DeleteMoveFiles(ActionType: ShortInt);
  public
    { Public declarations }
  end;

var
  FormZipFilesNotUsed: TFormZipFilesNotUsed;

implementation

{$R *.dfm}

uses uMain, uStatus, uCopyMoveGameFiles;

function TZipGameInfo.GetCaptions(Column: Integer): WideString;
begin
  case Column of
    0: Result:= eFullPath+eFileName;
    1: Result:= eSizeText;
    2: Result:= eDateTimeText;
  end;
end;

{function TZipGameInfo.GetStateImageIndexes(Column: Integer): TCommonImageIndexInteger;
begin
  case Column of
    0: Result:= eSystemID;
    3: Result:= MaxArcadeSystems+1+eImageCategory;
  else
       Result:= -1;
  end;
end;}

function TZipGameInfo.GetImageIndexes(Column: Integer): TCommonImageIndexInteger;
begin
  case Column of
    0: Result:= 8;
  else
       Result:= -1;
  end;
end;

function TSysGroupInfo.GetCaptions(Line: Integer): Widestring;
begin
  case Line of
    0: Result:= eTitle;// FormMain.GetEmulatorDescription(eSystemID);
  end;
end;

function TSysGroupInfo.GetImageIndexes(Column: Integer): TCommonImageIndexInteger;
begin
  case Column of
    0: Result:= eSystemID;
  else
       Result:= -1;
  end;
end;

function TFormZipFilesNotUsed.GetTotalSizeSelected(SelectedOnly: Boolean = True): Int64;
var
  Item: TEasyItem;
begin
  Result:= 0;
  if not FormMain.CheckTotal(ZipFilesListView) then
     Exit;
  Item:= ZipFilesListView.Groups.FirstItem;
  repeat
    if SelectedOnly then
       begin
         if Item.Selected then
            Result:= Result+TZipGameInfo(Item).eSize;
       end
    else
       Result:= Result+TZipGameInfo(Item).eSize;
    Item:= ZipFilesListView.Groups.NextItem(Item);
  until Item = nil;
end;

procedure TFormZipFilesNotUsed.LoadFiles;
var
  Loop: Integer;
  ValidSystems: Boolean;
  gItem: TEasyItem;
  addGroup: TEasyGroup;
  GroupAdded: packed array[1..MaxArcadeSystems] of Boolean;

  function GenerateGamesZip(sysID: Integer): Boolean;
  var
    zFileIndex: Integer;
  begin
    Result:= FormMain.TempGameVars.eSystemID = sysID;
    if Result then
       begin
         zFileIndex:= ZipFilesList[sysID].IndexOfName(FormMain.TempGameVars.eName+'.zip');
         if (zFileIndex = -1) and FormMain.SystemUseSevenZip(sysID) then
            zFileIndex:= ZipFilesList[sysID].IndexOfName(FormMain.TempGameVars.eName+'.7z');
         if zFileIndex <> -1 then
            begin
              if sysID = idMAME then
                 ZipFilesMAMEGames.Add(ZipFilesList[sysID].Strings[zFileIndex]);
              ZipFilesList[sysID].Delete(zFileIndex);
            end;
         Application.ProcessMessages;
       end;
  end;

  function ELV_AddGroup(sysID: ShortInt): Boolean;
  begin
    Result:= False;
    if GroupAdded[sysID] then
       Exit;

    addGroup:= nil;
    addGroup:= ZipFilesListView.Groups.AddCustom(TSysGroupInfo, nil);
    TSysGroupInfo(addGroup).eSystemID:= sysID;
    TSysGroupInfo(addGroup).eTitle:= FormMain.GetEmulatorDescription(sysID);
    addGroup.Checked:= False;
    Result:= addGroup <> nil;
    GroupAdded[sysID]:= Result;
  end;

  function ELV_AddGames(sysID: ShortInt): Boolean;
  var
    LoopAdd: Integer;
    fIndex: Integer;

    function ELV_AddItem: Boolean;
    var
      addItem: TEasyItem;
    begin
      addItem:= addGroup.Items.AddCustom(TZipGameInfo, nil);
      TZipGameInfo(addItem).eSystemID:= sysID;
      TZipGameInfo(addItem).eFullPath:= ZipFilesList[sysID].ValueFromIndex[LoopAdd];
      TZipGameInfo(addItem).eFileName:= ZipFilesList[sysID].Names[LoopAdd];
      TZipGameInfo(addItem).eSize:= GetFileSize(TZipGameInfo(addItem).eFullPath+TZipGameInfo(addItem).eFileName);
      TZipGameInfo(addItem).eSizeText:= FormMain.GetSizeType(TZipGameInfo(addItem).eSize, False);
      TZipGameInfo(addItem).eDateTime:= FileAge(TZipGameInfo(addItem).eFullPath+TZipGameInfo(addItem).eFileName);
      TZipGameInfo(addItem).eDateTimeText:= FormMain.GetDateTimeStr(TZipGameInfo(addItem).eDateTime);
      Result:= addItem <> nil;
      if Result then
         FilesTotalSize:= FilesTotalSize+TZipGameInfo(addItem).eSize;
    end;

  begin
    Result:= HaveSystem[sysID];
    if not Result then
       Exit;
    Result:= Assigned(ZipFilesList[sysID]) and (ZipFilesList[sysID].Count > 0);
    if not Result then
       Exit;

    FormStatus.MessageStr('Generating files list'+#13#10+FormMain.GetEmulatorDescription(sysID));
    if sysID = idMAME then
       ELV_AddGroup(sysID); // create group for MAME
    for LoopAdd:=0 to ZipFilesList[sysID].Count-1 do
    begin
      if sysID = idMAME then
         begin
           //ELV_AddGroup(sysID);
           ELV_AddItem;
         end
      else
         begin
           case HaveSystem[idMAME] of
             True : fIndex:= ZipFilesList[idMAME].IndexOf(ZipFilesList[Loop].Strings[LoopAdd]);
             False: fIndex:= -1;
           end;
           if (fIndex = -1) and Assigned(ZipFilesMAMEGames) then
              fIndex:= ZipFilesMAMEGames.IndexOf(ZipFilesList[Loop].Strings[LoopAdd]);

           if fIndex = -1 then
              begin
                ELV_AddGroup(sysID);
                ELV_AddItem;
              end;
         end;
      Application.ProcessMessages;
    end;
  end;

begin
  ValidSystems:= False;
  // get .zip files for all valid systems... ZipFilesList[sysID]
  for Loop:=1 to MaxArcadeSystems do
  begin
    GroupAdded[Loop]:= False;
    HaveSystem[Loop]:= GetZipFiles(Loop);
    if HaveSystem[Loop] then
       ValidSystems:= True;
  end;

  if not ValidSystems then
     begin
       FormStatus.Close;
       Exit;
     end;

  FilesTotalSize:= 0;
  FormStatus.MessageStr('Generating a MAME safeguard list');
   if HaveSystem[idMAME] then
      begin
        ZipFilesMAMEGames:= THashedStringList.Create;
        ZipFilesMAMEGames.BeginUpdate;
      end;
   for Loop:=1 to MaxArcadeSystems do
   begin
     if HaveSystem[Loop] then
        begin
          ZipFilesList[Loop].BeginUpdate;
          gItem:= FormMain.GamesListView.Groups.FirstItem;
          repeat
            FormMain.FillTempGameInfo(gItem);
            GenerateGamesZip(Loop);
            gItem:= FormMain.GamesListView.Groups.NextItem(gItem);
          until gItem = nil;
          ZipFilesList[Loop].EndUpdate;
          if Loop = idMAME then
             begin
               ZipFilesMAMEGames.EndUpdate;
               if ZipFilesMAMEGames.Count > 0 then
                  begin
                    ZipFilesMAMEGames.Sort;
                    ZipFilesMAMEGames.Sorted:= True;
                  end
               else
                  begin
                    FreeAndNil(ZipFilesMAMEGames);
                  end;
             end;
          if ZipFilesList[Loop].Count > 0 then
             ZipFilesList[Loop].Sorted:= True
          else
             begin
               FreeAndNil(ZipFilesList[Loop]);
               HaveSystem[Loop]:= False;
             end;
        end;
   end;

  ZipFilesListView.BeginUpdate;
  ZipFilesListView.Items.ReIndexDisable:= True;

  for Loop:=1 to MaxArcadeSystems do
      ELV_AddGames(Loop);

  for Loop:=1 to MaxArcadeSystems do
      FreeAndNil(ZipFilesList[Loop]);
  FreeAndNil(ZipFilesMAMEGames);

  ValidSystems:= FormMain.CheckTotal(ZipFilesListView);
  if ValidSystems then
     begin
       FormMain.ELV_RemoveDefaultGroup(ZipFilesListView);
       LabelTotalItems.Caption:= Format(LabelTotalItems.Hint, [ZipFilesListView.Groups.ItemCount, FormMain.GetSizeType(FilesTotalSize, False)]);
     end;
  ZipFilesListView.Items.ReIndexDisable:= False;
  ZipFilesListView.Sort.SortAll;
  ZipFilesListView.EndUpdate;
  FormStatus.Close;
  case ValidSystems of
    True : FormMain.ELV_SelectItem(ZipFilesListView, 0);
    False: PostMessage(Handle, wm_Close, 0, 0);
  end;
end;

function TFormZipFilesNotUsed.GetZipFiles(sysID: ShortInt): Boolean;
var
  LoopDirs: Integer;
begin
  Result:= False;
  if not Assigned(FormMain.emuROMsFolders[sysID]) then
     Exit;
  if FormMain.emuROMsFolders[sysID].Count = 0 then
     Exit;
  if not FileExists(FormMain.GetGamesFolderEL+GetSystemFileName(sysID)) then
     Exit;
  FormStatus.MessageStr('Scanning ROMs folders for files (.zip; .7z)'+#13#10+FormMain.GetEmulatorDescription(sysID));
  ZipFilesList[sysID]:= THashedStringList.Create;
  for LoopDirs:=0 to FormMain.emuROMsFolders[sysID].Count-1 do
  begin
    GetFilesList(FormMain.emuROMsFolders[sysID].Strings[LoopDirs], '.zip', '*.zip', ZipFilesList[sysID], False, False, True);
    if FormMain.SystemUseSevenZip(sysID) then
       GetFilesList(FormMain.emuROMsFolders[sysID].Strings[LoopDirs], '.7z', '*.7z', ZipFilesList[sysID], False, False, True);
  end;
  Result:= ZipFilesList[sysID].Count > 0;
  Application.ProcessMessages;
  case Result of
    True:
      begin
        ZipFilesList[sysID].Sorted:= False; // need to set false here to avoid access violation!
        ZipFilesList[sysID].BeginUpdate;
        for LoopDirs:=0 to ZipFilesList[sysID].Count-1 do
            ZipFilesList[sysID].Strings[LoopDirs]:= ExtractFileName(ZipFilesList[sysID].Strings[LoopDirs])+'='+ExtractFilePath(ZipFilesList[sysID].Strings[LoopDirs]);
        ZipFilesList[sysID].EndUpdate;
      end;
    False: FreeAndNil(ZipFilesList[sysID]);
  end;
end;

{function TFormZipFilesNotUsed.ProcessFiles: Boolean;
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
  FormCopyMoveGameFiles.Caption:= FormZipFilesNotUsed.Caption;

  FormCopyMoveGameFiles.ShowModal;

  fChanged:= False;
  {for Loop:= 1 to MaxArcadeSystems do
  begin
    SystemAffected[Loop]:= FormCopyMoveGameFiles.SystemChanged[Loop];
    if SystemAffected[Loop] then
       fChanged:= True;
  end;
  FreeAndNil(FormCopyMoveGameFiles);}

  //FormStatus.TitleStr(FormDeleteMultipleGamesFiles.Caption);//'Delete Multiple Games');
  //FormStatus.MessageStr('Deleting files, please wait a moment...');
  //FormStatus.Show;
  //FormStatus.StartThreadClock;

  {fChanged:= False;
  for CurrentSystem:= 1 to MaxArcadeSystems do
  begin
    Item:= GamesList.Groups.FirstItem;
    repeat
      Continue:= False;
      if TGameInfo(Item).eSystemID = CurrentSystem then
      begin
      if Assigned(TGameInfo(Item).eGameFiles) and (TGameInfo(Item).eGameFiles.Count > 0) then
         begin
           for Loop:=0 to TGameInfo(Item).eGameFiles.Count-1 do
           begin
             tmpMediaType:= StrToInt(TGameInfo(Item).eGameFiles.Names[Loop]);
             case tmpMediaType of
                0: Continue:= DeleteROMs.Checked;
                1: Continue:= DeleteCHDs.Checked;
               -1: Continue:= DeleteCFGsNVRAMs.Checked;
             end;
             if Continue then
                begin
                  tmpFileName:= TGameInfo(Item).eGameFiles.ValueFromIndex[Loop];
                  if tmpMediaType <> 0 then
                     Delete(tmpFileName, 1, 2); // not -1, 1 // fix filename (remove type from position 0...)

                  if FileExists(tmpFileName) then
                     begin
                       case ActionMode of
                         0: DeleteFile(tmpFileName); // ShowMessage('delete file: "'+tmpFileName+'"'); // delete file
                         1: // copy file
                           begin
                             FileNoPath:= ExtractFileName(tmpFileName);
                             //case tmpMediaType of
                             //  0: ShowMessage('copy file: "'+tmpFileName+'" to "'+IncludeTrailingPathDelimiter(DestinationFolder.Text)+FileNoPath+#13#10+'media type: ROM');
                             //  1: ShowMessage('copy file: "'+tmpFileName+'" to "'+IncludeTrailingPathDelimiter(DestinationFolder.Text)+'chd_files\'+FileNoPath+#13#10+'media type: CHD');
                             //end;
                           end;
                         2: // move file
                           begin
                             FileNoPath:= ExtractFileName(tmpFileName);
                             case tmpMediaType of
                               0: ShowMessage('move file: "'+tmpFileName+'" to "'+IncludeTrailingPathDelimiter(DestinationFolder.Text)+FileNoPath+#13#10+'media type: ROM');
                               1: ShowMessage('move file: "'+tmpFileName+'" to "'+IncludeTrailingPathDelimiter(DestinationFolder.Text)+'chd_files\'+#13#10+'media type: CHD');
                             end;
                           end;
                       end;

                       if ActionMode = 0 then // delete game files only!!!
                       if tmpMediaType in [0, 1] then
                          begin
                            SystemAffected[TGameInfo(Item).eSystemID]:= True;
                            fChanged:= True;
                          end;
                     end;
                end;
             Application.ProcessMessages;
           end;
         end;
      end;
      Item:= GamesList.Groups.NextItem(Item);
      Application.ProcessMessages;
    until Item = nil;
    Application.ProcessMessages;
  end;}

//  Result:= fChanged;
  //FormStatus.Close;
//end;}

procedure TFormZipFilesNotUsed.DeleteMoveFiles(ActionType: ShortInt);
var
  FileTypeStr: String;
  iFreeAvailable, iTotalAvailable, iFreeRequired: Int64;
  ErrorMsg: DWORD;
begin
  if not FormMain.CheckTotal(ZipFilesListView) then
     Exit;
  if ActionType in [0, 3] then
     ActionString:= 'Delete'
  else
     ActionString:= 'Move';
  // 0: delete all files
  // 1: move selected files only
  // 2: move all files
  // 3: delete selected files only
  if ActionType in [1, 3] then
     begin
       if not FormMain.CheckSelected(ZipFilesListView) then
          Exit;
     end;

  //iFreeRequired:= 0;
  if ActionType in [0, 2] then
     iFreeRequired:= FilesTotalSize // all files
  else
     iFreeRequired:= GetTotalSizeSelected; // selected files only

  if ActionType in [1, 2] then
      begin
        FileTypeStr:= '';
        FileTypeStr:= Trim(ExtractFileDrive(DestinationFolder.Text));
        if FileTypeStr = '' then
           begin
             GenerateMessage('ERROR', FormZipFilesNotUsed.Caption, '    Could not detect the destination drive letter to move files. '+
                             'Please make sure you enter a full destination path.', 2, False, 1);
             Exit;
           end;
        if not SysUtils.GetDiskFreeSpaceEx(PChar(FileTypeStr), iFreeAvailable, iTotalAvailable, nil) then
           begin
             ErrorMsg:= GetLastError;
             GenerateMessage('ERROR', FormZipFilesNotUsed.Caption, '    There was an error trying to detect the required free space '+
                             'in the destination path ('+FileTypeStr+').'+#13#10+#13#10+
                             'Error code '+IntToStr(ErrorMsg)+': '+SysErrorMessage(ErrorMsg), 2, False, 1);
             Exit;
           end;
        if iFreeAvailable <= iFreeRequired then
           begin
             GenerateMessage('ERROR', FormZipFilesNotUsed.Caption, '    Can''t move files. '+
                             'There is not enough free space in drive "'+UpperCase(FileTypeStr)+'".'#13#10+
                             'The drive letter might also be invalid. Please select another destination, '+
                             'and make sure to enter a full path, including the drive letter.', 2, False, 1);
             Exit;
           end;
      end;

  if GenerateMessage(UpperCase(ActionString), FormZipFilesNotUsed.Caption,
                     '    You are about to '+LowerCase(ActionString)+' the following file types of listed games:'+
                     #13#10+#13#10+FileTypeStr+#13#10+
                     '   Click "No" button if you want to go back and review the files to '+LowerCase(ActionString)+', or '+
                     'click "Yes" button to continue.'+#13#10+#13#10+
                     'Continue. Are you sure ?', 1, True, 2) = mrNo then
     Exit;

  FormZipFilesNotUsed.Tag:= ActionType;

  if not Assigned(FormCopyMoveGameFiles) then
     FormCopyMoveGameFiles:= TFormCopyMoveGameFiles.Create(nil);
  FormCopyMoveGameFiles.DoubleBuffered:= True;

  // 0: delete all files
  // 1: move selected files only
  // 2: move all files
  // 3: delete selected files only
  if ActionType in [0, 3] then
     begin
       FormCopyMoveGameFiles.Tag:= 0; // delete files
       FormCopyMoveGameFiles.LabelCopyTo.Visible:= False;
     end
  else
     FormCopyMoveGameFiles.Tag:= 2; // move files

  FormCopyMoveGameFiles.iTotalFilesSize:= iFreeRequired;
  FormCopyMoveGameFiles.iTotalFilesSizeLeft:= iFreeRequired;
  if ActionType in [1, 3] then
     FormCopyMoveGameFiles.iTotalFiles:= ZipFilesListView.Selection.Count
  else
     FormCopyMoveGameFiles.iTotalFiles:= ZipFilesListView.Groups.ItemCount;

  FormCopyMoveGameFiles.OverwriteFiles:= CopyMoveOverwriteFiles.Checked;

  FormCopyMoveGameFiles.Caption:= ActionString+' '+FormZipFilesNotUsed.Caption;
  FormCopyMoveGameFiles.ShowModal;

  {for Loop:= 1 to MaxArcadeSystems do
  begin
    SystemAffected[Loop]:= FormCopyMoveGameFiles.SystemChanged[Loop];
    if SystemAffected[Loop] then
       fChanged:= True;
  end;}
  FreeAndNil(FormCopyMoveGameFiles);

  if not FormMain.CheckTotal(ZipFilesListView) then
     Close
  else
     begin
       FilesTotalSize:= GetTotalSizeSelected(False);
       LabelTotalItems.Caption:= Format(LabelTotalItems.Hint, [ZipFilesListView.Groups.ItemCount, FormMain.GetSizeType(FilesTotalSize, False)]);
       ZipFilesListView.SetFocus;
     end;
  Exit;
{






  Screen.Cursor:= crHourGlass;
  FormZipFilesNotUsed.Tag:= ActionType;
  ZipFilesListView.BeginUpdate;
  Group:= ZipFilesListView.Groups.FirstGroup;
  repeat
    if ActionType = 1 then
       SystemFolder:= FormMain.GetSystemIniSection(TSysGroupInfo(Group).eSystemID, True)+'\';
    Item:= ZipFilesListView.Groups.LastInGroup(Group);
    repeat
      case ActionType of
        0: // delete files
          begin
            if DeleteFile(TZipGameInfo(Item).eFullPath+TZipGameInfo(Item).eFileName) then
               ZipFilesListView.Groups.DeleteItem(Item);
          end;
        1, 2: // move files
          begin
            if ActionType = 1 then
               Continue:= Item.Selected
            else
               Continue:= True;
            if Continue then
               begin
                 ForceDirectories(FolderStr+SystemFolder);
                 if MoveFile(PChar(TZipGameInfo(Item).eFullPath+TZipGameInfo(Item).eFileName), PChar(FolderStr+SystemFolder+TZipGameInfo(Item).eFileName), True) then
                    ZipFilesListView.Groups.DeleteItem(Item);
               end;
          end;
      end;
      Item:= ZipFilesListView.Groups.PrevInGroup(Group, Item);
    until Item = nil;
    Group:= ZipFilesListView.Groups.NextGroup(Group);
  until Group = nil;
  ZipFilesListView.EndUpdate;
  FormMain.ELV_RemoveEmptyGroups(ZipFilesListView); // delete empty groups
  Screen.Cursor:= crDefault;
  ZipFilesListView.SetFocus;
  if not FormMain.CheckTotal(ZipFilesListView) then
     Close;}
end;

procedure TFormZipFilesNotUsed.FormShow(Sender: TObject);
begin
  //CallMaximizeWindow(TForm(Sender));
  FormMain.ELV_ResetNormalColors(ZipFilesListView);
end;

procedure TFormZipFilesNotUsed.ZipFilesListViewItemPaintText(
  Sender: TCustomEasyListview; Item: TEasyItem; Position: Integer;
  ACanvas: TCanvas);
begin
  if Position = 2 then
     begin
       ACanvas.Font.Name:= 'Consolas';
       ACanvas.Font.Size:= ACanvas.Font.Size-1;
     end;
end;

procedure TFormZipFilesNotUsed.ButtonSaveToFileClick(Sender: TObject);
var
  Group: TEasyGroup;
  Item: TEasyItem;
  ListOutput: THashedStringList;
  FileStr: String;
begin
  if not FormMain.CheckTotal(ZipFilesListView) then
     Exit;
   FileStr:= FormMain.DialogSaveFile(4, 'Save not Used Game Files List to a File');
   if FileStr = '' then
      Exit;

   //TSysGroupInfo
   //TZipGameInfo
   ListOutput:= THashedStringList.Create;
   ListOutput.BeginUpdate;
   Group:= ZipFilesListView.Groups.FirstGroup;
   repeat
     ListOutput.Add(#13#10+'-> '+TSysGroupInfo(Group).eTitle);
     ListOutput.Add('   '+'Total files: '+IntToStr(Group.ItemCount));
     Item:= ZipFilesListView.Groups.FirstInGroup(Group);
     repeat
       ListOutput.Add('    '+TZipGameInfo(Item).eFullPath+TZipGameInfo(Item).eFileName);
       Item:= ZipFilesListView.Groups.NextInGroup(Group, Item);
     until Item = nil;
     Group:= ZipFilesListView.Groups.NextGroup(Group);
   until Group = nil;
   ListOutput.EndUpdate;
   if ListOutput.Count > 0 then
      ListOutput.Insert(0, '----------> Not Used Game Files <----------');
   ListOutput.SaveToFile(FileStr);
   FreeAndNil(ListOutput);
   GenerateMessage(FormZipFilesNotUsed.Caption, 'Save files list to a text file.',
                   Format('    File "%s" was created based on the current files list, '+
                          'separated by system.', [FileStr]), 2);
end;

procedure TFormZipFilesNotUsed.ButtonDeleteFilesClick(
  Sender: TObject);
begin
  // ActionType: 0 -> delete files; 1 -> move files
  DeleteMoveFiles(TBitBtn(Sender).Tag);
end;

procedure TFormZipFilesNotUsed.ButtonRemoveSelectedClick(Sender: TObject);
var
  Item: TEasyItem;
begin
  if FormMain.CheckSelected(ZipFilesListView) then
     begin
       if ZipFilesListView.Selection.Count = 1 then
          FilesTotalSize:= FilesTotalSize-TZipGameInfo(ZipFilesListView.Selection.First).eSize
       else
          begin
            Item:= ZipFilesListView.Selection.First;
            repeat
              FilesTotalSize:= FilesTotalSize-TZipGameInfo(Item).eSize;
              Item:= ZipFilesListView.Selection.Next(Item);
            until Item = nil;
          end;
       ZipFilesListView.Selection.DeleteSelected(True);
       FormMain.ELV_RemoveEmptyGroups(ZipFilesListView);
       //FilesTotalSize:= GetTotalSizeSelected(False);
       LabelTotalItems.Caption:= Format(LabelTotalItems.Hint, [ZipFilesListView.Groups.ItemCount, FormMain.GetSizeType(FilesTotalSize, False)]);
     end;
  ZipFilesListView.SetFocus;
end;

procedure TFormZipFilesNotUsed.ZipFilesListViewKeyAction(
  Sender: TCustomEasyListview; var CharCode: Word; var Shift: TShiftState;
  var DoDefault: Boolean);
begin
  if CharCode = VK_DELETE then
     ButtonRemoveSelected.Click;
end;

procedure TFormZipFilesNotUsed.ButtonHelpClick(Sender: TObject);
begin
  GenerateMessage('INFO', 'How to use this thing...',
     '    Delete or move game files (.zip; .7z) that are not used by the emulators. If there are files '+
     'listed that you do not want to delete/move, remove them from the list by clicking on '+
     '"Remove From List" button or "Delete" hot-key (files are not actually deleted/moved).'+#13#10+
     '    You can also export the current list to a .txt file with "Save to File" button.'+#13#10+#13#10+
     'Click "Delete" button to finally delete files or "Move" button to move files to another folder.', 2);
  ZipFilesListView.SetFocus;
end;

procedure TFormZipFilesNotUsed.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #27 then
     ButtonClose.Click;
end;

function TFormZipFilesNotUsed.ZipFilesListViewGroupCompare(
  Sender: TCustomEasyListview; Item1, Item2: TEasyGroup): Integer;
begin
  Result:= CompareIntValue(TSysGroupInfo(Item1).eSystemID, TSysGroupInfo(Item2).eSystemID);
end;

procedure TFormZipFilesNotUsed.ZipFilesListViewColumnClick(
  Sender: TCustomEasyListview; Button: TCommonMouseButton;
  ShiftState: TShiftState; const Column: TEasyColumn);
begin
  if Button = cmbLeft then
     begin
       ZipFilesListView.BeginUpdate;
       ZipFilesListView.Sort.SortAll;
       ZipFilesListView.EndUpdate(False);
     end;
end;

function TFormZipFilesNotUsed.ZipFilesListViewItemCompare(
  Sender: TCustomEasyListview; Column: TEasyColumn; Group: TEasyGroup;
  Item1, Item2: TEasyItem; var DoDefault: Boolean): Integer;
var
  gItem1, gItem2: TEasyItem;
begin
  DoDefault:= False;
  FormMain.ELV_GetSortDirection(Column, Item1, Item2, gItem1, gItem2);
  case Column.Index of
    0: Result:= FormMain.iCompare(TZipGameInfo(gItem1).eFileName, TZipGameInfo(gItem2).eFileName);
    1: Result:= CompareIntValue(TZipGameInfo(gItem1).eSize, TZipGameInfo(gItem2).eSize);
    2: CompareIntValue(TZipGameInfo(gItem1).eDateTime, TZipGameInfo(gItem2).eDateTime);
  end;
end;

procedure TFormZipFilesNotUsed.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  FormMain.ClearListView(ZipFilesListView);
end;

procedure TFormZipFilesNotUsed.FormCreate(Sender: TObject);
begin
  FormMain.CheckSevenZip(-1);
  LoadFiles;
end;

procedure TFormZipFilesNotUsed.ButtonSelectROMsFolderClick(
  Sender: TObject);
begin
  FormMain.DialogSelectFolder(DestinationFolder, False);
end;

end.
