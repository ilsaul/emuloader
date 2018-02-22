unit uArcadeScanAudioSamples;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  StdCtrls, ComCtrls, ImgList, ShellAPI,
  IniFiles, MPCommonObjects, MPCommonUtilities, EasyListview,
  Menus, BarMenus, uCommon, ExtCtrls, PanelEx, ShadowLabel,
  Buttons;

type
  TFileInfo = class(TEasyItemStored)
  private
    fROMIdentification: Integer;
    fSystemID: Integer;
    fSystemType: ShortInt;
    fTitle: WideString;
    fName: String;
    fClone: String;
    fCloneParent: String;
    fAudioSampleName: String;
    fSoftwareName: String;
    fDriverStatus: ShortInt;
    fGameStatus: ShortInt; // 0 - have or miss; 1 - missing ROMs/CHDs
    fSampleStatus: ShortInt; // 0 - not found; 1 - found; -1 - not needed (empty)
    fSampleFile: String; // only filename (no path)
    fSampleFolder: String;
    fSampleFileText: String;
  protected
    function GetCaptions(Column: Integer): WideString; override;
    function GetImageIndexes(Column: Integer): TCommonImageIndexInteger; override;
    function GetStateImageIndexes(Column: Integer): TCommonImageIndexInteger; override;
  public
    property eROMIdentification: Integer read fROMIdentification write fROMIdentification;
    property eSystemID: Integer read fSystemID write fSystemID;
    property eSystemType: ShortInt read fSystemType write fSystemType;
    property eTitle: WideString read fTitle write fTitle;
    property eName: String read fName write fName;
    property eClone: String read fClone write fClone;
    property eCloneParent: String read fCloneParent write fCloneParent;
    property eAudioSampleName: String read fAudioSampleName write fAudioSampleName;
    property eSoftwareName: String read fSoftwareName write fSoftwareName;
    property eDriverStatus: ShortInt read fDriverStatus write fDriverStatus;
    property eGameStatus: ShortInt read fGameStatus write fGameStatus;
    property eSampleStatus: ShortInt read fSampleStatus write fSampleStatus;
    property eSampleFile: String read fSampleFile write fSampleFile;
    property eSampleFolder: String read fSampleFolder write fSampleFolder;
    property eSampleFileText: String read fSampleFileText write fSampleFileText;
  end;

type
  TFormArcadeScanAudioSamples = class(TForm)
    FilesListView: TEasyListview;
    PopupAudioSamples: TBcBarPopupMenu;
    PopupPlayGame: TMenuItem;
    N1: TMenuItem;
    PopupRemoveSelected: TMenuItem;
    PopupClearList: TMenuItem;
    PopupGamesViewMode: TMenuItem;
    PopupShowAllGames: TMenuItem;
    PopupShowHave: TMenuItem;
    PopupShowMiss: TMenuItem;
    N3: TMenuItem;
    MenuSaveListToFile: TMenuItem;
    PopupRebuildList: TMenuItem;
    PanelEx1: TPanelEx;
    LabelDownloadLink: TShadowLabel;
    IL_Systems: TImageList;
    LabelTotalItems: TShadowLabel;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FilesListViewItemPaintText(Sender: TCustomEasyListview;
      Item: TEasyItem; Position: Integer; ACanvas: TCanvas);
    procedure FilesListViewItemSelectionChanged(
      Sender: TCustomEasyListview; Item: TEasyItem);
    procedure FormShow(Sender: TObject);
    procedure PopupPlayGameClick(Sender: TObject);
    procedure PopupRemoveSelectedClick(Sender: TObject);
    procedure PopupClearListClick(Sender: TObject);
    procedure PopupRebuildListClick(Sender: TObject);
    procedure PopupShowAllGamesClick(Sender: TObject);
    procedure MenuSaveListToFileClick(Sender: TObject);
    procedure FilesListViewKeyAction(Sender: TCustomEasyListview;
      var CharCode: Word; var Shift: TShiftState; var DoDefault: Boolean);
    procedure FilesListViewDblClick(Sender: TCustomEasyListview;
      Button: TCommonMouseButton; MousePos: TPoint;
      ShiftState: TShiftState; var Handled: Boolean);
    procedure PopupAudioSamplesMeasureMenuItem(Sender: TObject;
      AMenuItem: TMenuItem; ACanvas: TCanvas; var Width, Height: Integer;
      ABarVisible: Boolean; var DefaultMeasure: Boolean);
    procedure FilesListViewColumnClick(Sender: TCustomEasyListview;
      Button: TCommonMouseButton; ShiftState: TShiftState;
      const Column: TEasyColumn);
    function FilesListViewItemCompare(Sender: TCustomEasyListview;
      Column: TEasyColumn; Group: TEasyGroup; Item1, Item2: TEasyItem;
      var DoDefault: Boolean): Integer;
    procedure LabelDownloadLinkMouseEnter(Sender: TObject);
    procedure LabelDownloadLinkMouseLeave(Sender: TObject);
    procedure LabelDownloadLinkClick(Sender: TObject);
  private
    { Private declarations }
    SelectedItem: TEasyItem;
    SamplesFolder: String;
    procedure ResizeForm;
    procedure ClearSelected;
    procedure SetSelectedGame(AutoSelect: Boolean = True);
    procedure DeleteEmptyGroups;
    procedure UpdateTotalGames;
    procedure AddGamesToList;
    procedure SetFilter;
    procedure SelectFirstVisibleItem;
  public
    { Public declarations }
  end;

var
  FormArcadeScanAudioSamples: TFormArcadeScanAudioSamples;

implementation

uses uMain, uStatus;

{$R *.dfm}

function TFileInfo.GetCaptions(Column: Integer): WideString;
begin
  case Column of
    0: Result:= eTitle;
    1: Result:= eName;
    2: Result:= eClone;
    3: Result:= aStatus[eDriverStatus];
    4: Result:= eSampleFile+' (.zip; .7z)';// eAudioSampleName;
  end;
end;

function TFileInfo.GetImageIndexes(Column: Integer): TCommonImageIndexInteger;
begin
  case Column of
    0: Result:= FormMain.GetMAMEImageIndex(eROMIdentification, eSoftwareName);
  else
       Result:= -1;
  end;
end;

function TFileInfo.GetStateImageIndexes(Column: Integer): TCommonImageIndexInteger;
begin
  case Column of
    0: Result:= eSystemID;
  else
       Result:= -1;
  end;
end;

procedure TFormArcadeScanAudioSamples.ClearSelected;
begin
  FilesListView.Selection.ClearAll;
  SelectedItem:= nil;
end;

procedure TFormArcadeScanAudioSamples.SetSelectedGame(AutoSelect: Boolean = True);
begin
  if SelectedItem = nil then
     Exit;
  if not AutoSelect then
     begin
       TFileInfo(SelectedItem).Selected:= True;
       FilesListView.Selection.FocusedItem:= SelectedItem;
       SelectedItem.MakeVisible(emvMiddle) //(emvAuto);
     end;
  FormMain.ELV_SetSelectRibbon(TFileInfo(SelectedItem).eGameStatus, FilesListView);
end;

procedure TFormArcadeScanAudioSamples.DeleteEmptyGroups;
var
  Group: TEasyGroup;
begin
  FilesListView.BeginUpdate;
  Group:= FilesListView.Groups.FirstGroup;
  repeat
    if Group.ItemCount = 0 then
       FilesListView.Groups.DeleteGroup(Group);
    Group:= FilesListView.Groups.NextGroup(Group);
  until Group = nil;
  FilesListView.EndUpdate;
end;

procedure TFormArcadeScanAudioSamples.UpdateTotalGames;
begin
  LabelTotalItems.Caption:= IntToStr(FilesListView.Groups.VisibleItemCount)+' Missing Samples';
end;

procedure TFormArcadeScanAudioSamples.AddGamesToList;
var
  SamplesFiles, GamesSamples, AddedSampleName, GameNameIndex: array[0..1] of THashedStringList; // 0 -> HBMAME; 1 -> MAME
  SamplesDirMAME: array[0..1] of String; // 0 -> HBMAME; 1 -> MAME
  HaveMAME, HaveHBMAME: Boolean;
  samName, FileExt: String;
  addItem, gItem: TEasyItem;
  gGroup: TEasyGroup;

  function GetSampleFiles(SystemIndex: Integer): Boolean;
  var
    sLoop: Integer;
    tmpStr: String;
    SamplesPathList: THashedStringList;

  begin
    //tmpStr:= FormMain.LoadFolderSpecial_MAME(SystemIndex, FormMain.EmulatorFile[SystemIndex], 2); // can't be executed here (March 17, 2016)
    FormMain.ExtractFolders2MAME(SystemIndex, SamplesDirMAME[SystemIndex], SamplesPathList);

    SamplesFiles[SystemIndex]:= THashedStringList.Create;
    for sLoop:=0 to SamplesPathList.Count-1 do
    begin
      // for MAME
      tmpStr:= SamplesPathList[sLoop];
      GetFilesList(tmpStr, '.zip', '*.zip', SamplesFiles[SystemIndex], False, False, True);
      GetFilesList(tmpStr, '.7z', '*.7z', SamplesFiles[SystemIndex], False, False, True);
    end;
    FreeAndNil(SamplesPathList);
    Result:= SamplesFiles[SystemIndex].Count > 0;
    if Result then
       begin
         GameNameIndex[SystemIndex]:= THashedStringList.Create;
         GameNameIndex[SystemIndex].BeginUpdate;
         SamplesFiles[SystemIndex].Sorted:= False;
         SamplesFiles[SystemIndex].BeginUpdate;
         for sLoop:=0 to SamplesFiles[SystemIndex].Count-1 do
         begin
           tmpStr:= ExtractFileName(SamplesFiles[SystemIndex].Strings[sLoop]);
           SamplesFiles[SystemIndex].Strings[sLoop]:= tmpStr+'='+SamplesFiles[SystemIndex].Strings[sLoop];
           GameNameIndex[SystemIndex].Add(tmpStr);
         end;
         SamplesFiles[SystemIndex].EndUpdate;
         GameNameIndex[SystemIndex].EndUpdate;
         AddedSampleName[SystemIndex]:= THashedStringList.Create;
         AddedSampleName[SystemIndex].BeginUpdate;
       end
    else
       FreeAndNil(SamplesFiles[SystemIndex]);
  end;

  function ELV_AddItem: Boolean;
  var
    sysIndex: Integer;
    sFileFound: Boolean;
  begin
    sysIndex:= Ord(FormMain.TempGameVars.eSystemID = idMAME); // 1-> MAME; 0-> HBMAME
    if SamplesFiles[sysIndex] = nil then
       Exit;

    Result:= FormMain.IsROM_Have(FormMain.TempGameVars.eROMIdentification) or
             FormMain.IsROM_HaveMissROMs(FormMain.TempGameVars.eGameSetStatus);

    if not Result then
       Exit;

    samName:= GamesSamples[sysIndex].Values[FormMain.TempGameVars.eName];


    FileExt:= '.zip';
    sysIndex:= GameNameIndex[sysIndex].IndexOf(samName+FileExt);
    if sysIndex = -1 then
       begin
         FileExt:= '.7z';
         sysIndex:= GameNameIndex[sysIndex].IndexOf(samName+FileExt);
       end;
    if sysIndex = -1 then
       FileExt:= ''; // no sample file was found (.zip; .7z)

    //FileExt:= '.zip';
    //sysIndex:= SamplesFiles[sysIndex].IndexOfName(samName+FileExt);
    //if sysIndex = -1 then
    //   begin
    //     FileExt:= '.7z';
    //     sysIndex:= SamplesFiles[sysIndex].IndexOfName(samName+FileExt);
    //   end;
    //if sysIndex = -1 then
    //   FileExt:= ''; // no sample file was found (.zip; .7z)

    sFileFound:= sysIndex <> -1;
    if sFileFound then
       Exit
    else
    begin
      if Assigned(AddedSampleName[sysIndex]) then
       begin
         Result:= AddedSampleName[sysIndex].IndexOf(samName) = -1;
         if Result then
            AddedSampleName[sysIndex].Add(samName)
         else
            Exit;
       end;
    end;

    addItem:= FilesListView.Items.AddCustom(TFileInfo, nil);

    TFileInfo(addItem).eROMIdentification:= FormMain.TempGameVars.eROMIdentification;
    TFileInfo(addItem).eSystemID:= FormMain.TempGameVars.eSystemID;
    TFileInfo(addItem).eSystemType:= FormMain.TempGameVars.eSystemType;
    TFileInfo(addItem).eTitle:= FormMain.TempGameVars.eTitle;
    TFileInfo(addItem).eName:= FormMain.TempGameVars.eName;
    TFileInfo(addItem).eClone:= FormMain.TempGameVars.eClone;
    case FormMain.GameIsClone(FormMain.TempGameVars.eClone) of
      True : TFileInfo(addItem).eCloneParent:= FormMain.TempGameVars.eClone;
      False: TFileInfo(addItem).eCloneParent:= FormMain.TempGameVars.eName;
    end;
    TFileInfo(addItem).eAudioSampleName:= samName;
    TFileInfo(addItem).eSoftwareName:= FormMain.TempGameVars.eSoftwareName;
    TFileInfo(addItem).eDriverStatus:= FormMain.TempGameVars.eDriverStatus;
    TFileInfo(addItem).eGameStatus:= FormMain.TempGameVars.eGameSetStatus;
    TFileInfo(addItem).eSampleFile:= samName;
    TFileInfo(addItem).eSampleFolder:= '';

    TFileInfo(addItem).eSampleStatus:= Ord(sFileFound);
    //addItem.Details[1]:= 1;
    //addItem.Details[2]:= 2;
    Application.ProcessMessages;
  end;

  function FreeStringList(var ListVar: THashedStringList): Boolean;
  begin
    Result:= Assigned(ListVar);
    if Result then
       FreeAndNil(ListVar);
  end;

begin
  if not FormMain.CheckTotal(FormMain.GamesListView) then
     Exit;

  HaveMAME:= FileExists(FormMain.GetAudioSamplesFile(idMAME));
  if HaveMAME then
     begin
       SamplesDirMAME[1]:= FormMain.LoadFolderSpecial_MAME(idMAME, FormMain.EmulatorFile[idMAME], 2);
       HaveMAME:= SamplesDirMAME[1] <> '';
     end;
  if HaveMAME then
     begin
       GamesSamples[1]:= THashedStringList.Create;
       GamesSamples[1].LoadFromFile(FormMain.GetAudioSamplesFile(idMAME));
     end;

  HaveHBMAME:= FileExists(FormMain.GetAudioSamplesFile(idHBMAME));
  if HaveHBMAME then
     begin
       SamplesDirMAME[0]:= FormMain.LoadFolderSpecial_MAME(idHBMAME, FormMain.EmulatorFile[idHBMAME], 2);
       HaveHBMAME:= SamplesDirMAME[0] <> '';
     end;
  if HaveHBMAME then
     begin
       GamesSamples[0]:= THashedStringList.Create;
       GamesSamples[0].LoadFromFile(FormMain.GetAudioSamplesFile(idHBMAME));
     end;

  if (not HaveMAME) and (not HaveHBMAME) then
     Exit;

  if HaveMAME then
     HaveMAME:= GetSampleFiles(1);
  if HaveHBMAME then
     HaveHBMAME:= GetSampleFiles(0);

  if (not HaveMAME) and (not HaveHBMAME) then
     begin
       // no sample files were found for MAME and HBMAME... all games have missing samples
       samName:= '';
       HaveMAME:= SamplesDirMAME[1] <> ''; // FormMain.IsSystemAvailable(idMAME);
       HaveHBMAME:= SamplesDirMAME[0] <> ''; // FormMain.IsSystemAvailable(idHBMAME);
       if HaveMAME then
          samName:= 'MAME samples folders:'+#13#10+SamplesDirMAME[1];// FormMain.SamplesDir[1].Text;
       if HaveHBMAME then
          begin
            if samName <> '' then
               samName:= samName+#13#10+#13#10;
            samName:= samName+'HBMAME samples folders:'+#13#10+SamplesDirMAME[0];//FormMain.SamplesDir[0].Text;
          end;
       GenerateMessage('Info', FormArcadeScanAudioSamples.Caption, '    No files were found for MAME and/or HBMAME. All games '+
                       'are missing samples. Emu Loader only support zipped / 7-zipped sample sets (no .wav; .flac). Aborting...'
                       +#13#10+#13#10+samName, 2);
       PostMessage(Handle, wm_Close, 0, 0);
       FreeStringList(GamesSamples[1]);
       FreeStringList(SamplesFiles[1]);
       FreeStringList(GameNameIndex[1]);
       FreeStringList(AddedSampleName[1]);
       FreeStringList(GamesSamples[0]);
       FreeStringList(SamplesFiles[0]);
       FreeStringList(GameNameIndex[0]);
       FreeStringList(AddedSampleName[0]);
       Exit;
     end;

  if HaveMAME then
     SamplesFiles[1].BeginUpdate; // actual files list from folder
  if HaveHBMAME then
     SamplesFiles[0].BeginUpdate; // actual files list from folder

  FormMain.ClearListView(FilesListView);
  FilesListView.BeginUpdate;
  FilesListView.Items.ReIndexDisable:= True;
  // add games that use external samples to the list (samples found or not, have / miss games)
  gGroup:= FormMain.GamesListView.Groups.FirstGroup;
  repeat
    gItem:= FormMain.GamesListView.Groups.FirstInGroup(gGroup);
    repeat
      if (uMain.TEasyGameInfo(gItem).eSystemID in [idMAME, idHBMAME]) and (uMain.TEasyGameInfo(gItem).eAudioType = 2) then
         begin
           FormMain.FillTempGameInfo(gItem);
           ELV_AddItem;
         end;
      gItem:= FormMain.GamesListView.Groups.NextInGroup(gGroup, gItem);
    until gItem = nil;

    gGroup:= FormMain.GamesListView.Groups.NextGroup(gGroup);
  until gGroup = nil;

  FilesListView.Items.ReIndexDisable:= False;
  FilesListView.EndUpdate;
  DeleteEmptyGroups;
  case PopupShowAllGames.Checked of
    True : SelectFirstVisibleItem;
    False: SetFilter;
  end;
  FreeStringList(SamplesFiles[1]); // MAME
  FreeStringList(GameNameIndex[1]);
  FreeStringList(GamesSamples[1]);
  FreeStringList(AddedSampleName[1]);

  FreeStringList(SamplesFiles[0]); // HBMAME
  FreeStringList(GameNameIndex[0]);
  FreeStringList(GamesSamples[0]);
  FreeStringList(AddedSampleName[0]);

  if FormMain.CheckTotal(FilesListView) then
     begin
       UpdateTotalGames;
       //FilesListView.Groups.FirstGroup.ImageIndex:= 0;
       //FilesListView.Groups.FirstGroup.Caption:= IntToStr(FilesListView.Groups.VisibleItemCount)+' Games with Missing Samples';
       FilesListView.SetFocus;
     end
  else
     begin
       GenerateMessage('Info', FormArcadeScanAudioSamples.Caption, '    Found samples for all available games. Exiting...', 2);
       PostMessage(Handle, wm_Close, 0, 0);
     end;
end;

procedure TFormArcadeScanAudioSamples.SetFilter;
var
  Item: TEasyItem;
begin
  if not FormMain.CheckTotal(FilesListView) then
     begin
       UpdateTotalGames;
       Exit;
     end;
  FilesListView.BeginUpdate;
  Item:= FilesListView.Groups.FirstItem;
  repeat
    if PopupShowAllGames.Checked then
       Item.Visible:= True
    else
    if PopupShowHave.Checked then
       Item.Visible:= FormMain.IsROM_Have(TFileInfo(Item).eROMIdentification)
    else
       Item.Visible:= FormMain.IsROM_HaveMissROMs(TFileInfo(Item).eGameStatus);
    Item:= FilesListView.Groups.NextItem(Item);
  until Item = nil;
  FilesListView.EndUpdate;
  SelectFirstVisibleItem;
  UpdateTotalGames;
end;

procedure TFormArcadeScanAudioSamples.SelectFirstVisibleItem;
begin
  if FilesListView.Groups.VisibleItemCount = 0 then
     Exit;
  if (SelectedItem = nil) or ((SelectedItem <> nil) and (not SelectedItem.Visible)) then
     SelectedItem:= FilesListView.Groups.FirstVisibleItem;
  SetSelectedGame(False);
end;

procedure TFormArcadeScanAudioSamples.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #27 then
     Close;
end;

procedure TFormArcadeScanAudioSamples.FilesListViewItemPaintText(
  Sender: TCustomEasyListview; Item: TEasyItem; Position: Integer;
  ACanvas: TCanvas);
begin
  FormMain.GetCanvasFontCustom(
                      TFileInfo(Item).eSystemID,
                      TFileInfo(Item).eGameStatus,
                      TFileInfo(Item).eDriverStatus,
                      TFileInfo(Item).eClone, ACanvas, True);
end;

procedure TFormArcadeScanAudioSamples.FilesListViewItemSelectionChanged(
  Sender: TCustomEasyListview; Item: TEasyItem);
begin
  if Item.Selected then
     begin
       SelectedItem:= Item;
       SetSelectedGame;
     end;
end;

procedure TFormArcadeScanAudioSamples.ResizeForm;
begin
  if Screen.Width < 1024 then
     begin
       ClientWidth:= Screen.Width-24;
       LabelDownloadLink.Left:= 150;
     end;
  if Screen.Height < 600 then
     ClientHeight:= Screen.Height-60;
end;

procedure TFormArcadeScanAudioSamples.FormShow(Sender: TObject);
begin
  ResizeForm;
     
  FormMain.ELV_ResetNormalColors(FilesListView);
  FormMain.CheckSevenZip(Tag);
  FormMain.LoadSystemsIcons(IL_Systems);
  AddGamesToList;
  if FilesListView.Scrollbars.VertBarVisible then
     FilesListView.Header.Columns[0].Width:= FilesListView.Header.Columns[0].Width-GetSystemMetrics(SM_CXVSCROLL);//17;
end;

procedure TFormArcadeScanAudioSamples.PopupPlayGameClick(Sender: TObject);
var
  GameEasy: TEasyItem;
  RunGame: Boolean;

  function ShowInvisibleGameMsg: Boolean;
  begin
    Result:= GenerateMessage('Warning', 'Run selected game.', '    The game is not visible in '+
              'main games list, either because is set as missing or due to selected games filters.'+
              #13#10+'The game might not run properly. Would you like to try it anyway ?', 1) = mrYes;
    if not Result then
       RunGame:= False;
  end;

  function ShowGameNotFoundMsg: Boolean;
  begin
    GenerateMessage('Error', FormMain.GetArcadeEmulatorDescription(TFileInfo(SelectedItem).eROMIdentification),
                    '    Could not find the game in main games list. For this feature to work, '+
                    'the game must be valid and visible on the main screen. Make sure that the games list for '+
                    'this system is loaded.', 2, False, 1);
    RunGame:= False;
    Result:= RunGame;
  end;
  
begin
  if FilesListView.Selection.Count <> 1 then
     Exit;
  if TFileInfo(SelectedItem).eSampleStatus = -1 then
     Exit;
  RunGame:= True;
  FormMain.FindGameName(TFileInfo(SelectedItem).eName, TFileInfo(SelectedItem).eSystemID, -1, False, TFileInfo(SelectedItem).eSoftwareName, GameEasy, False);

  if GameEasy <> nil then
     begin
       case GameEasy.Visible of
         True: FormMain.SelectEasyItem(GameEasy);
         False:
           begin
             if not ShowInvisibleGameMsg then
                Exit;
             FormMain.SelectEasyItem(GameEasy);
           end;
       end;
     end
  else
     ShowGameNotFoundMsg;

  if RunGame then
     begin
       Application.ProcessMessages;
       FormMain.ExecuteGame;
     end;
  FilesListView.SetFocus;
end;

procedure TFormArcadeScanAudioSamples.PopupRemoveSelectedClick(Sender: TObject);
begin
  if FormMain.CheckSelected(FilesListView) then
     begin
       FilesListView.Selection.DeleteSelected(True);
       DeleteEmptyGroups;
     end;
  FilesListView.SetFocus;
end;

procedure TFormArcadeScanAudioSamples.PopupClearListClick(Sender: TObject);
begin
  ClearSelected;
  FormMain.ClearListView(FilesListView);
  FilesListView.SetFocus;
end;

procedure TFormArcadeScanAudioSamples.PopupRebuildListClick(Sender: TObject);
begin
  PopupClearList.Click;
  AddGamesToList;
end;

procedure TFormArcadeScanAudioSamples.PopupShowAllGamesClick(Sender: TObject);
begin
  SetFilter;
end;

procedure TFormArcadeScanAudioSamples.MenuSaveListToFileClick(Sender: TObject);
var
  Group: TEasyGroup;
  Item: TEasyItem;
  ListOutput: THashedStringList;
  StrAdd, FileStr: String;
begin
  if not FormMain.CheckTotal(FilesListView) then
     Exit;
  FileStr:= FormMain.DialogSaveFile(4, 'Save Audio Samples List to a Text File');
  if FileStr = '' then
     Exit;

  ListOutput:= THashedStringList.Create;
  ListOutput.BeginUpdate;
  case FormArcadeScanAudioSamples.Tag of
    idMAME  : ListOutput.Add('----------> MAME Audio Samples <----------'+#13#10);
    idHBMAME: ListOutput.Add('----------> HBMAME Audio Samples <----------'+#13#10);
  end;

  ListOutput.Add(' -> Samples Folder: '+SamplesFolder);
  Group:= FilesListView.Groups.FirstGroup;
  repeat
    ListOutput.Add(#13#10+#13#10+' -> '+Group.Caption);
    ListOutput.Add('    Total Files: '+IntToStr(Group.ItemCount));
    if Group.ImageIndex = 3 then
       ListOutput.Add('');
    Item:= FilesListView.Groups.FirstInGroup(Group);
    repeat
      case TFileInfo(Item).eSampleStatus of
        0, 1: // 0 - not found; 1 - found;
          begin
            ListOutput.Add(#13#10+' > '+TFileInfo(Item).eTitle);
            case FormMain.GameIsClone(TFileInfo(Item).eClone) of
              True : StrAdd:= Format('name: %s [clone of: %s], sample name: %s',
                                     [TFileInfo(Item).eName, TFileInfo(Item).eClone, TFileInfo(Item).eAudioSampleName]);
              False: StrAdd:= Format('name: %s, sample name: %s',
                                     [TFileInfo(Item).eName, TFileInfo(Item).eAudioSampleName]);
            end;
            case TFileInfo(Item).eSampleStatus of
              0: StrAdd:= StrAdd+' [Missing]';
              1: StrAdd:= Format('%s [Found: %s]', [StrAdd, TFileInfo(Item).eSampleFile]);
            end;
            ListOutput.Add(StrAdd);
          end;
        -1: // -1 - not needed (empty)
          begin
            ListOutput.Add('filename: '+TFileInfo(Item).eTitle);
          end;
      end;
      Item:= FilesListView.Groups.NextInGroup(Group, Item);
    until Item = nil;
    Group:= FilesListView.Groups.NextGroup(Group);
  until Group = nil;
  ListOutput.EndUpdate;
  ListOutput.SaveToFile(FileStr);
  FreeAndNil(ListOutput);
  GenerateMessage(FormArcadeScanAudioSamples.Caption, 'Save audio samples list to a text file.',
                  Format('    File "%s" was created based on the current list.',
                         [FileStr]), 2);
end;

procedure TFormArcadeScanAudioSamples.FilesListViewKeyAction(
  Sender: TCustomEasyListview; var CharCode: Word; var Shift: TShiftState;
  var DoDefault: Boolean);
begin
  case CharCode of
    VK_RETURN: PopupPlayGame.Click;
    VK_DELETE: PopupRemoveSelected.Click;
  end;
end;

procedure TFormArcadeScanAudioSamples.FilesListViewDblClick(
  Sender: TCustomEasyListview; Button: TCommonMouseButton;
  MousePos: TPoint; ShiftState: TShiftState; var Handled: Boolean);
begin
  PopupPlayGame.Click;
end;

procedure TFormArcadeScanAudioSamples.PopupAudioSamplesMeasureMenuItem(
  Sender: TObject; AMenuItem: TMenuItem; ACanvas: TCanvas; var Width,
  Height: Integer; ABarVisible: Boolean; var DefaultMeasure: Boolean);
begin
  FormMain.SetPopupMenuMeasureItem(AMenuItem, ACanvas, Width, Height);
end;

procedure TFormArcadeScanAudioSamples.FilesListViewColumnClick(
  Sender: TCustomEasyListview; Button: TCommonMouseButton;
  ShiftState: TShiftState; const Column: TEasyColumn);
begin
  if Button = cmbLeft then
     begin
       FilesListView.BeginUpdate;
       FilesListView.Sort.SortAll;
       FilesListView.EndUpdate(False);
     end;
end;

function TFormArcadeScanAudioSamples.FilesListViewItemCompare(
  Sender: TCustomEasyListview; Column: TEasyColumn; Group: TEasyGroup;
  Item1, Item2: TEasyItem; var DoDefault: Boolean): Integer;
var
  gItem1, gItem2: TEasyItem;
begin
  DoDefault:= False;
  FormMain.ELV_GetSortDirection(Column, Item1, Item2, gItem1, gItem2);
  case Column.Index of
    0: Result:= FormMain.iCompare(TFileInfo(gItem1).eTitle, TFileInfo(gItem2).eTitle);
    1: Result:= FormMain.iCompare(TFileInfo(gItem1).eName, TFileInfo(gItem2).eName);
    2: Result:= FormMain.iCompare(TFileInfo(gItem1).eCloneParent, TFileInfo(gItem2).eCloneParent);
    3: Result:= AnsiCompareText(aStatus[TFileInfo(gItem1).eDriverStatus], aStatus[TFileInfo(gItem2).eDriverStatus]);
    4: Result:= FormMain.iCompare(TFileInfo(gItem1).eSampleFile, TFileInfo(gItem2).eSampleFile);
  end;
end;

procedure TFormArcadeScanAudioSamples.LabelDownloadLinkMouseEnter(Sender: TObject);
begin
  LabelDownloadLink.Font.Color:= clBlue;
end;

procedure TFormArcadeScanAudioSamples.LabelDownloadLinkMouseLeave(
  Sender: TObject);
begin
  LabelDownloadLink.Font.Color:= clNavy;
end;

procedure TFormArcadeScanAudioSamples.LabelDownloadLinkClick(Sender: TObject);
begin
  CallShellExecute(Sender);
end;


end.
