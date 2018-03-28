unit uConsCompSystemsEditor;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, uCommon, uCommonCustom,
  Dialogs, ImgList, MPCommonObjects, MPCommonUtilities, EasyListview, IniFiles,
  ExtCtrls, SplitterEx, StdCtrls, PanelEx, Buttons, ShadowLabel, Menus,
  BarMenus, ComCtrls, ToolWin;

type
  TFormConsCompSystemsEditor = class(TForm)
    IL_Systems: TImageList;
    Splitter: TSplitterEx;
    PanelSoftwareLists: TPanel;
    PanelAssignedSoftwareList: TPanel;
    SplitterMainSoftware: TSplitterEx;
    PanelRemainingSoftwareList: TPanel;
    SoftListFilesNotAssigned: TEasyListview;
    PanelBottomSoftListFilesNotAssigned: TPanelEx;
    LabelSoftListFilesNotAssigned: TLabel;
    PanelButtons: TPanelEx;
    ButtonOk: TBitBtn;
    ButtonCancel: TBitBtn;
    PanelSystems: TPanel;
    Systems: TEasyListview;
    LabelSystemTitle: TShadowLabel;
    PopupSoftList: TBcBarPopupMenu;
    PopupMoveSelectedToDestination: TMenuItem;
    PanelBottomSoftListAssignedToSystem: TPanelEx;
    LabelSoftListAssignedToSystem: TLabel;
    SoftListAssignedToSystem: TEasyListview;
    IL_MediaType: TImageList;
    ButtonGamesListFont: TBitBtn;
    GamesListBackgroundColor: TColorBox;
    procedure FormShow(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure SystemsItemSelectionChanged(Sender: TCustomEasyListview;
      Item: TEasyItem);
    procedure PopupSoftListMeasureMenuItem(Sender: TObject;
      AMenuItem: TMenuItem; ACanvas: TCanvas; var Width, Height: Integer;
      ABarVisible: Boolean; var DefaultMeasure: Boolean);
    procedure PopupSoftListPopup(Sender: TObject);
    procedure PopupMoveSelectedToDestinationClick(Sender: TObject);
    procedure SoftListAssignedToSystemKeyAction(
      Sender: TCustomEasyListview; var CharCode: Word;
      var Shift: TShiftState; var DoDefault: Boolean);
    procedure SoftListAssignedToSystemItemSelectionChanged(
      Sender: TCustomEasyListview; Item: TEasyItem);
    procedure SoftListFilesNotAssignedItemSelectionChanged(
      Sender: TCustomEasyListview; Item: TEasyItem);
    procedure ButtonGamesListFontClick(Sender: TObject);
    procedure GamesListBackgroundColorSelect(Sender: TObject);
    procedure SoftListFilesNotAssignedColumnClick(
      Sender: TCustomEasyListview; Button: TCommonMouseButton;
      ShiftState: TShiftState; const Column: TEasyColumn);
    function SoftListFilesNotAssignedItemCompare(
      Sender: TCustomEasyListview; Column: TEasyColumn; Group: TEasyGroup;
      Item1, Item2: TEasyItem; var DoDefault: Boolean): Integer;
    procedure SoftListFilesNotAssignedDblClick(Sender: TCustomEasyListview;
      Button: TCommonMouseButton; MousePos: TPoint;
      ShiftState: TShiftState; var Handled: Boolean);
    procedure SoftListAssignedToSystemDblClick(Sender: TCustomEasyListview;
      Button: TCommonMouseButton; MousePos: TPoint;
      ShiftState: TShiftState; var Handled: Boolean);
    procedure SoftListAssignedToSystemColumnSizeChanged(
      Sender: TCustomEasyListview; Column: TEasyColumn);
    procedure SoftListFilesNotAssignedColumnSizeChanged(
      Sender: TCustomEasyListview; Column: TEasyColumn);
    procedure SplitterMoved(Sender: TObject);
  private
    { Private declarations }
    SystemsSoftList: array[1..MaxConsoleComputerSystems] of THashedStringList; // holds softlist names for each system
    SoftListFiles_Name: THashedStringList;
    SoftListFiles_Title: array of WideString;
    SoftListFiles_MediaType: array of Integer;
    NotAssignedSoftListFiles: THashedStringList;

    procedure InitSystemsList;
    procedure FreeSystemsList;
    function  GetSoftListFileTitle(const SoftwareListFile: String; out MediaTypeIndex: Integer): WideString;
    procedure GetMAME_SoftListFiles;
    function  DeInitSoftListFiles: Boolean;
    function  GetMediaTypeTitle(MediaTypeID: Integer): String;
    procedure ELV_PopulateNotAssignedList;
    procedure LoadSoftListSystems;
    procedure LoadSoftwareListsSelectedSystem;

    procedure UpdateAssignedSystemTotalFiles;
    procedure UpdateNotAssignedTotalFiles;

    procedure AddSelectedSoftListToSystem;
    procedure RemoveSelectedSoftListFromSystem;
    procedure UpdateSystemsIniFile;
    function  ELV_AdjustCellHeight(ELV_Holder: TEasyListView): Boolean;

    procedure ReadSettings;
    procedure WriteSettings;

  public
    { Public declarations }
  end;

var
  FormConsCompSystemsEditor: TFormConsCompSystemsEditor;

implementation

uses uMain, uStatus;

{$R *.dfm}

procedure TFormConsCompSystemsEditor.InitSystemsList;
var
  Loop: Integer;
begin
  for Loop:= Low(SystemsSoftList) to High(SystemsSoftList) do
      SystemsSoftList[Loop]:= THashedStringList.Create;
end;

procedure TFormConsCompSystemsEditor.FreeSystemsList;
var
  Loop: Integer;
begin
  for Loop:= Low(SystemsSoftList) to High(SystemsSoftList) do
      FreeAndNil(SystemsSoftList[Loop]);
end;

function TFormConsCompSystemsEditor.GetSoftListFileTitle(const SoftwareListFile: String; out MediaTypeIndex: Integer): WideString;
var
  iSoftFile: THashedStringList;
  Loop: Integer;
  FileLine, PartName: String;
  FoundTitle, FoundPartName, GotMediaFromFileName: Boolean;
begin
  Result:= '';
  if not FileExists(SoftwareListFile) then
     Exit;

  FoundTitle:= False;
  FoundPartName:= False;
  MediaTypeIndex:= -1;

  FileLine:= LowerCase(SoftwareListFile);
  if PosEx('_cart', FileLine) <> 0 then
     begin
       MediaTypeIndex:= 1;
       FoundPartName:= True;
     end
  else
  if PosEx('_cdrom', FileLine) <> 0 then
     begin
       MediaTypeIndex:= 2;
       FoundPartName:= True;
     end
  else
  //if (PosEx('_flop', FileLine) <> 0) then or (PosEx('_qd', FileLine) <> 0) then
  if PosEx('_flop', FileLine) <> 0 then
     begin
       MediaTypeIndex:= 3;
       FoundPartName:= True;
     end
  else
  if PosEx('_qd', FileLine) <> 0 then
     begin
       MediaTypeIndex:= 3;
       FoundPartName:= True;
     end
  else
  if PosEx('_cass', FileLine) <> 0 then
     begin
       MediaTypeIndex:= 4;
       FoundPartName:= True;
     end
  else
  if PosEx('_hdd', FileLine) <> 0 then
     begin
       MediaTypeIndex:= 5;
       FoundPartName:= True;
     end;

  iSoftFile:= THashedStringList.Create;
  iSoftFile.LoadFromFile(SoftwareListFile);

  for Loop:=0 to iSoftFile.Count-1 do
  begin
    FileLine:= iSoftFile[Loop];
    if FileLine <> '' then
       begin
         FileLine:= TrimLeft(FileLine);
         if XML_CheckData(FileLine, '<softwarelist') and (not FoundTitle) then
            begin
              Result:= FormMain.DecodeHTML(XML_GetEntryValue(FileLine, 'description'));
              FoundTitle:= True;
            end
         else
         if XML_CheckData(FileLine, '<part ') and (not FoundPartName) then // this is the cmdline parameters that is used to load game (cart, disk, cass, flop ???)
            begin
              PartName:= XML_GetEntryValue(FileLine, 'name');
              PartName:= FormMain.FixMediaParameterStr(PartName);
              if PartName = 'cart1' then
                 MediaTypeIndex:= 1
              else
              if (PartName = 'cdrom') or
                 (PartName = 'cdrom1') then
                 MediaTypeIndex:= 2
              else
              if PartName = 'flop1' then
                 MediaTypeIndex:= 3
              else
              if (PartName = 'cass1') or
                 (PartName = 'tape') then
                 MediaTypeIndex:= 4
              else
              if PartName = 'hard1' then
                 MediaTypeIndex:= 5
              else
                 MediaTypeIndex:= 1; // this is for "rom" (quick), "memory card" (memc) media type... "-quick", "-memc"
              FoundPartName:= True;
            end;
       end;
    if FoundTitle and FoundPartName then
       Break;
  end;
  FreeAndNil(iSoftFile);
end;

procedure TFormConsCompSystemsEditor.GetMAME_SoftListFiles;
var
  iFiles: THashedStringList;
  iFolder: String;
  Loop, iMediaTypeID: Integer;
begin
  FormStatus.MessageStr('Searching MAME software lists.');

  FormMain.ReadMAMEHashFolder(idMAME, FormMain.EmulatorFile[idMAME], iFolder);
  if iFolder = '' then
     Exit;

  iFiles:= THashedStringList.Create;
  GetFilesList(iFolder, '.xml', '*.xml', iFiles, False, True, True);
  if iFiles.Count > 0 then
  begin
    DeInitSoftListFiles;

    if not Assigned(SoftListFiles_Name) then
       SoftListFiles_Name:= THashedStringList.Create;

    SetLength(SoftListFiles_Title, iFiles.Count);
    SetLength(SoftListFiles_MediaType, iFiles.Count);

    NotAssignedSoftListFiles.BeginUpdate;
    for Loop:=0 to iFiles.Count-1 do
    begin
      iFolder:= ExtractFileName(ChangeFileExt(iFiles[Loop], ''));
      SoftListFiles_Name.Add(iFolder);
      SoftListFiles_Title[Loop]:= GetSoftListFileTitle(iFiles[Loop], iMediaTypeID);
      SoftListFiles_MediaType[Loop]:= iMediaTypeID;
      if iMediaTypeID <> -1 then
         NotAssignedSoftListFiles.Add(iFolder); // do not add files if there are not game entries in the .xml file ("vreader.xml" is one of them!!) 
    end;
    NotAssignedSoftListFiles.EndUpdate;
  end;
  FreeAndNil(iFiles);
end;

function TFormConsCompSystemsEditor.DeInitSoftListFiles: Boolean;
var
  LoopPos: Integer;
begin
  Result:= Assigned(SoftListFiles_Name); //and (SoftListFiles_Name.Count > 0);
  if Result then
     begin
       SoftListFiles_Name.Clear;
       FreeAndNil(SoftListFiles_Name);
       
       for LoopPos:=0 to Length(SoftListFiles_Title) do
       begin
         Finalize(SoftListFiles_Title);
         Finalize(SoftListFiles_MediaType);
       end;

       SetLength(SoftListFiles_Title, 0);
       SetLength(SoftListFiles_MediaType, 0);
     end;
end;

function TFormConsCompSystemsEditor.GetMediaTypeTitle(MediaTypeID: Integer): String;
begin
  Result:= MediaTypeCustom[MediaTypeID, 0];
  //if MediaTypeID > 0 then
  //   Result:= MediaTypeCustom[MediaTypeID, 0]
  //else
  //   Result:= 'ROM'; // everything different will be handled as carts (-quick; -memc)
end;

procedure TFormConsCompSystemsEditor.ELV_PopulateNotAssignedList;
var
  Item: TEasyItem;
  Loop, sIndex: Integer;
begin
  FormStatus.MessageStr('Populating not assigned software lists.');
  FormMain.ClearListView(SoftListFilesNotAssigned);
  SoftListFilesNotAssigned.BeginUpdate;
  SoftListFilesNotAssigned.Items.ReIndexDisable:= True;
  for Loop:=0 to NotAssignedSoftListFiles.Count-1 do
  begin
    sIndex:= SoftListFiles_Name.IndexOf(NotAssignedSoftListFiles[Loop]);
    //if SoftListFiles_MediaType[sIndex] = -1 then
    //   ShowMessageW('There are no games in this MAME software list: "'+NotAssignedSoftListFiles[Loop]+'"') // for debugging only!!! January 10, 2017
    //else
    //begin
      Item:= SoftListFilesNotAssigned.Items.Add;
      sIndex:= SoftListFiles_Name.IndexOf(NotAssignedSoftListFiles[Loop]);
      Item.ImageIndex:= SoftListFiles_MediaType[sIndex];
      Item.Caption:= SoftListFiles_Title[sIndex];
      Item.Captions[1]:= SoftListFiles_Name[sIndex];
      Item.Captions[2]:= GetMediaTypeTitle(SoftListFiles_MediaType[sIndex]); // MediaTypeCustom[SoftListFiles_MediaType[sIndex], 0];
    //end;
  end;
  SoftListFiles_Name.EndUpdate;
  SoftListFilesNotAssigned.Sort.SortAll;
  SoftListFilesNotAssigned.Items.ReIndexDisable:= False;
  SoftListFilesNotAssigned.EndUpdate(False);
  UpdateNotAssignedTotalFiles;
end;

procedure TFormConsCompSystemsEditor.LoadSoftListSystems;
var
  Loop, LoopSoft, naIndex: Integer;
  iniFile: TMemIniFile;
  iFile, iName: String;
begin
  iFile:= FormMain.GetSystemsSoftwareListFile(idMAME);//, FormMain.EmulatorFile[idMAME]);
  if not FileExists(iFile) then
     Exit;
  FormStatus.MessageStr('Loading list of assigned software lists to each system.');
  iniFile:= TMemIniFile.Create(iFile);
  NotAssignedSoftListFiles.BeginUpdate;
  for Loop:= 1 to High(SystemsListCustom) do
  begin
    SystemsSoftList[Loop].Clear;
    iniFile.ReadSectionValues(SystemsListCustom[Loop, 0], SystemsSoftList[Loop]);
    if SystemsSoftList[Loop].Count > 0 then
       begin
         for LoopSoft:=0 to SystemsSoftList[Loop].Count-1 do
         begin
           iName:= SystemsSoftList[Loop].Strings[LoopSoft];
           naIndex:= NotAssignedSoftListFiles.IndexOf(iName);
           if naIndex <> -1 then
              NotAssignedSoftListFiles.Delete(naIndex);
         end;
       end;
  end;
  NotAssignedSoftListFiles.EndUpdate;
  FreeAndNil(iniFile);
end;

procedure TFormConsCompSystemsEditor.LoadSoftwareListsSelectedSystem;
var
  Loop, sIndex: Integer;
  Item: TEasyItem;
  sName: String;
begin
  FormMain.ClearListView(SoftListAssignedToSystem);
  UpdateAssignedSystemTotalFiles;
  LabelSystemTitle.Caption:= UpperCase(SystemsListCustom[Systems.Tag, 0]);
  if not Assigned(SystemsSoftList[Systems.Tag]) then
     Exit;

  if SystemsSoftList[Systems.Tag].Count = 0 then
     Exit;

  if not Assigned(SoftListFiles_Name) or (SoftListFiles_Name.Count = 0) then
     Exit;

  SoftListAssignedToSystem.BeginUpdate;
  SoftListAssignedToSystem.Items.ReIndexDisable:= True;
  for Loop:= 0 to SystemsSoftList[Systems.Tag].Count-1 do
  begin
    sName:= SystemsSoftList[Systems.Tag].Strings[Loop];
    sIndex:= SoftListFiles_Name.IndexOf(sName);
    if sIndex <> -1 then
    begin
      Item:= SoftListAssignedToSystem.Items.Add;
      Item.ImageIndex:= SoftListFiles_MediaType[sIndex];
      Item.Caption:= SoftListFiles_Title[sIndex];
      Item.Captions[1]:= sName;
      Item.Captions[2]:= GetMediaTypeTitle(SoftListFiles_MediaType[sIndex]); // MediaTypeCustom[SoftListFiles_MediaType[sIndex], 0];
    end;
  end;
  SoftListAssignedToSystem.Sort.SortAll;
  SoftListAssignedToSystem.Items.ReIndexDisable:= False;
  SoftListAssignedToSystem.EndUpdate(False);

  UpdateAssignedSystemTotalFiles;
end;

procedure TFormConsCompSystemsEditor.UpdateAssignedSystemTotalFiles;
begin
  LabelSoftListAssignedToSystem.Caption:= IntToStr(SoftListAssignedToSystem.Groups.ItemCount)+LabelSoftListAssignedToSystem.Hint+Systems.Selection.First.Caption;
end;

procedure TFormConsCompSystemsEditor.UpdateNotAssignedTotalFiles;
begin
  LabelSoftListFilesNotAssigned.Caption:= IntToStr(SoftListFilesNotAssigned.Groups.ItemCount)+LabelSoftListFilesNotAssigned.Hint;
end;

procedure TFormConsCompSystemsEditor.AddSelectedSoftListToSystem;
var
  selItem, destItem: TEasyItem;
begin
  if not FormMain.CheckSelected(Systems) then
     Exit;

  if not FormMain.CheckSelected(SoftListFilesNotAssigned) then
     Exit;

  SoftListAssignedToSystem.BeginUpdate;
  SoftListAssignedToSystem.Items.ReIndexDisable:= True;
  SystemsSoftList[Systems.Tag].BeginUpdate;
  selItem:= SoftListFilesNotAssigned.Selection.First;
  repeat
    SystemsSoftList[Systems.Tag].Add(selItem.Captions[1]);
    
    destItem:= SoftListAssignedToSystem.Items.Add;
    destItem.ImageIndex:= selItem.ImageIndex;
    destItem.Caption:= selItem.Caption;
    destItem.Captions[1]:= selItem.Captions[1];
    destItem.Captions[2]:= selItem.Captions[2]; // MediaTypeCustom[destItem.ImageIndex, 0];

    selItem:= SoftListFilesNotAssigned.Selection.Next(selItem);
  until selItem = nil;

  SystemsSoftList[Systems.Tag].EndUpdate;

  SoftListAssignedToSystem.Sort.SortAll;
  SoftListAssignedToSystem.Items.ReIndexDisable:= False;
  SoftListAssignedToSystem.EndUpdate(False);

  SoftListFilesNotAssigned.Selection.DeleteSelected;
  UpdateNotAssignedTotalFiles;
  UpdateAssignedSystemTotalFiles;
  SoftListFilesNotAssigned.SetFocus;
end;

procedure TFormConsCompSystemsEditor.RemoveSelectedSoftListFromSystem;
var
  selItem, destItem: TEasyItem;
  sIndex: Integer;
begin
  if not FormMain.CheckSelected(Systems) then
     Exit;

  if not FormMain.CheckSelected(SoftListAssignedToSystem) then
     Exit;
  SoftListFilesNotAssigned.BeginUpdate;
  SoftListFilesNotAssigned.Items.ReIndexDisable:= True;
  SystemsSoftList[Systems.Tag].BeginUpdate;
  selItem:= SoftListAssignedToSystem.Selection.First;
  repeat
    sIndex:= SystemsSoftList[Systems.Tag].IndexOf(selItem.Captions[1]);
    if sIndex <> -1 then
       SystemsSoftList[Systems.Tag].Delete(sIndex);

    destItem:= SoftListFilesNotAssigned.Items.Add;
    destItem.ImageIndex:= selItem.ImageIndex;
    destItem.Caption:= selItem.Caption;
    destItem.Captions[1]:= selItem.Captions[1];
    destItem.Captions[2]:= selItem.Captions[2];

    selItem:= SoftListAssignedToSystem.Selection.Next(selItem);
  until selItem = nil;

  SystemsSoftList[Systems.Tag].EndUpdate;

  SoftListFilesNotAssigned.Sort.SortAll;
  SoftListFilesNotAssigned.Items.ReIndexDisable:= False;
  SoftListFilesNotAssigned.EndUpdate(False);

  SoftListAssignedToSystem.Selection.DeleteSelected;
  UpdateNotAssignedTotalFiles;
  UpdateAssignedSystemTotalFiles;
  SoftListAssignedToSystem.SetFocus;
end;

procedure TFormConsCompSystemsEditor.UpdateSystemsIniFile;
var
  iniFile: TStringList;
  Loop, LoopSoft, iMediaType, iIndex: Integer;
  iFile, iName: String;
  AddedContent: Boolean;
begin
  ForceDirectories(FormMain.GetConsoleComputerFolder);
  iFile:= FormMain.GetSystemsSoftwareListFile(idMAME);//, FormMain.EmulatorFile[idMAME]);
  DeleteFile(iFile);
  iniFile:= TStringList.Create;
  AddedContent:= False;
  iniFile.BeginUpdate;
  for Loop:= 1 to High(SystemsListCustom) do
  begin
    if Assigned(SystemsSoftList[Loop]) and (SystemsSoftList[Loop].Count > 0) then
    begin
      case AddedContent of
        True : iniFile.Add('');
        False: AddedContent:= True;
      end;
      iniFile.Add('['+SystemsListCustom[Loop, 0]+']'); // add system section
      for LoopSoft:=0 to SystemsSoftList[Loop].Count-1 do
      begin
        iName:= SystemsSoftList[Loop].Strings[LoopSoft];
        iniFile.Add(iName);
        //iIndex:= SoftListFiles_Name.IndexOf(iName);
        //iMediaType:= SoftListFiles_MediaType[iIndex];
        //if iMediaType > 0 then
        //   iniFile.Add(iName+'='+MediaTypeCustom[iMediaType, 2])
        //else
        //   iniFile.Add(iName+'=rom');
      end;
    end;
  end;
  iniFile.EndUpdate;
  if iniFile.Count > 0 then
     iniFile.SaveToFile(iFile);
  FreeAndNil(iniFile);
  if not FormMain.ValidateFile(iFile) then
     DeleteFile(iFile);
end;

procedure TFormConsCompSystemsEditor.ReadSettings;
var
  iIniFile: TMemIniFile;
  Loop: Integer;
begin
  if not FileExists(GetMiscSettingsFile) then
     Exit;

  iIniFile:= TMemIniFile.Create(GetMiscSettingsFile);

  FormConsCompSystemsEditor.Tag:= Ord(iIniFile.ReadString('Systems Editor', 'WindowState', 'Normal') = 'Maximized');
  FormConsCompSystemsEditor.Width:= iIniFile.ReadInteger('Systems Editor', 'ScreenWidth', FormConsCompSystemsEditor.Width);
  FormConsCompSystemsEditor.Height:= iIniFile.ReadInteger('Systems Editor', 'ScreenHeight', FormConsCompSystemsEditor.Height);

  PanelSystems.Width:= iIniFile.ReadInteger('Systems Editor', 'SystemsPanelWidth', 392);

  SoftListAssignedToSystem.BeginUpdate;
  for Loop:= 0 to SoftListAssignedToSystem.Header.Columns.Count-1 do
      SoftListAssignedToSystem.Header.Columns[Loop].Width:= iIniFile.ReadInteger('Systems Editor', 'SoftListColumnWidth'+IntToStr(Loop), SoftListAssignedToSystem.Header.Columns[Loop].Width);

  FormMain.SetSelectedColorBox(GamesListBackgroundColor, iIniFile.ReadInteger('Systems Editor', 'SoftListBackgroundColor', GamesListBackgroundColor.DefaultColorColor));

  SoftListAssignedToSystem.Font.Color:= iIniFile.ReadInteger('Systems Editor', 'SoftListFontColor', 0);
  SoftListAssignedToSystem.Font.Name:= iIniFile.ReadString('Systems Editor', 'SoftListFontName', 'Segoe UI');
  SoftListAssignedToSystem.Font.Size:= iIniFile.ReadInteger('Systems Editor', 'SoftListFontSize', 9);
  SoftListAssignedToSystem.Font.Style:= TFontStyles(Byte(iIniFile.ReadInteger('Systems Editor', 'SoftListFontStyle', 0)));

  SoftListAssignedToSystem.EndUpdate;

  SoftListFilesNotAssigned.BeginUpdate;
  for Loop:=0 to SoftListFilesNotAssigned.Header.Columns.Count-1 do
      SoftListFilesNotAssigned.Header.Columns[Loop].Width:= SoftListAssignedToSystem.Header.Columns[Loop].Width;

  SoftListFilesNotAssigned.Font.Color:= SoftListAssignedToSystem.Font.Color;
  SoftListFilesNotAssigned.Font.Name:= SoftListAssignedToSystem.Font.Name;
  SoftListFilesNotAssigned.Font.Size:= SoftListAssignedToSystem.Font.Size;
  SoftListFilesNotAssigned.Font.Style:= SoftListAssignedToSystem.Font.Style;

  SoftListFilesNotAssigned.EndUpdate;

  if ELV_AdjustCellHeight(SoftListAssignedToSystem) then
     begin
       SoftListFilesNotAssigned.BeginUpdate;
       SoftListFilesNotAssigned.CellSizes.Report.Height:= SoftListAssignedToSystem.CellSizes.Report.Height;
       SoftListFilesNotAssigned.EndUpdate(False);
     end;

  FreeAndNil(iIniFile);
end;

procedure TFormConsCompSystemsEditor.WriteSettings;
var
  iIniFile: TMemIniFile;
  tmpString: String;
  Loop: Integer;
begin
  iIniFile:= TMemIniFile.Create(GetMiscSettingsFile);

  if FormConsCompSystemsEditor.WindowState = wsMaximized then
     tmpString:= 'Maximized'
  else
     tmpString:= 'Normal';

  iIniFile.WriteString('Systems Editor', 'WindowState', tmpString);
  if FormConsCompSystemsEditor.WindowState <> wsMaximized then
     begin
       iIniFile.WriteInteger('Systems Editor', 'ScreenWidth', FormConsCompSystemsEditor.Width);
       iIniFile.WriteInteger('Systems Editor', 'ScreenHeight', FormConsCompSystemsEditor.Height);
     end;

  iIniFile.WriteInteger('Systems Editor', 'SystemsPanelWidth', PanelSystems.Width);

  for Loop:= 0 to SoftListAssignedToSystem.Header.Columns.Count-1 do
      iIniFile.WriteInteger('Systems Editor', 'SoftListColumnWidth'+IntToStr(Loop), SoftListAssignedToSystem.Header.Columns[Loop].Width);

  iIniFile.WriteInteger('Systems Editor', 'SoftListBackgroundColor', GamesListBackgroundColor.Selected);

  iIniFile.WriteInteger('Systems Editor', 'SoftListFontColor', SoftListAssignedToSystem.Font.Color);
  iIniFile.WriteString('Systems Editor', 'SoftListFontName', SoftListAssignedToSystem.Font.Name);
  iIniFile.WriteInteger('Systems Editor', 'SoftListFontSize', SoftListAssignedToSystem.Font.Size);
  iIniFile.WriteInteger('Systems Editor', 'SoftListFontStyle', Byte(SoftListAssignedToSystem.Font.Style));

  iIniFile.UpdateFile;
  FreeAndNil(iIniFile);
end;

procedure TFormConsCompSystemsEditor.FormShow(Sender: TObject);
begin
  //Mouse.DragImmediate := False;
  FormStatus.TitleStr('Custom Games Editor');
  FormStatus.MessageStr('Loading systems icons.');
  if not FormStatus.Visible then
     begin
       FormStatus.Show;
       FormStatus.StartThreadClock;
     end;

  Application.ProcessMessages;

  ReadSettings;

  if FormConsCompSystemsEditor.Tag = 1 then
     WindowState:= wsMaximized
  else
     begin
       FormConsCompSystemsEditor.Top:= (Screen.Height-FormConsCompSystemsEditor.Height) div 2;
       FormConsCompSystemsEditor.Left:= (Screen.Width-FormConsCompSystemsEditor.Width) div 2;
     end;

  Splitter.OnMoved(Self);

  LoadCustomMAMEIconToForm(TForm(Sender));
  FormMain.LoadMediaTypeIcons(IL_MediaType, True);

  // no need since user can change window size and controls dimentions with supplied splitters! (September 06, 2017)
  //if Screen.Height = 720 then
  //   begin
  //     FormConsCompSystemsEditor.Height:= 670;
  //     Systems.Width:= Systems.Width+Systems.CellSizes.Icon.Width;
  //     Systems.Height:= FormConsCompSystemsEditor.ClientHeight;
  //     //PanelEmulators.Left:= PanelEmulators.Left+Systems.CellSizes.Icon.Width;
  //     //FormSystemsEditor.ClientWidth:= PanelEmulators.Left+PanelEmulators.Width;
  //     //PanelBottomButtons.Top:= PanelBottomButtons.Top-12;
  //   end;

  FormMain.LoadNonArcadeSystemIcons(IL_Systems, False);
  FormMain.ELV_ResetNormalColors(Systems);
  FormMain.ELV_ResetNormalColors(SoftListAssignedToSystem);
  FormMain.ELV_ResetNormalColors(SoftListFilesNotAssigned);

  InitSystemsList;
  NotAssignedSoftListFiles:= THashedStringList.Create;

  //ELV_PopulateCustomSystems(Systems, -1, -1, True);

  GetMAME_SoftListFiles; // first, read all files from mamedir\hash\ folder and create the NotAssignedSoftListFiles() list

  LoadSoftListSystems; // read assigned softlists for all systems and remove the ones from NotAssignedSoftListFiles() list

  ELV_PopulateNotAssignedList; // populate EasyListView with the not assigned softlists

  FreeAndNil(NotAssignedSoftListFiles);

  ELV_PopulateCustomSystems(Systems, -1, -1, True);
  Systems.SetFocus;
  FormStatus.Close; 
end;

procedure TFormConsCompSystemsEditor.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if FormConsCompSystemsEditor.ModalResult = mrOk then
     begin
       UpdateSystemsIniFile;
     end;

  WriteSettings;
  DeInitSoftListFiles;

  FormMain.ClearListView(Systems);
  FormMain.ClearListView(SoftListFilesNotAssigned);

  FreeSystemsList;
end;

procedure TFormConsCompSystemsEditor.SystemsItemSelectionChanged(
  Sender: TCustomEasyListview; Item: TEasyItem);
begin
  if Item.Selected then
     begin
       if Item.ImageIndex <> Systems.Tag then
       begin
         Systems.Tag:= Item.ImageIndex;
         LoadSoftwareListsSelectedSystem;
       end;
     end;
end;

procedure TFormConsCompSystemsEditor.PopupSoftListMeasureMenuItem(Sender: TObject;
  AMenuItem: TMenuItem; ACanvas: TCanvas; var Width, Height: Integer;
  ABarVisible: Boolean; var DefaultMeasure: Boolean);
begin
  FormMain.SetPopupMenuMeasureItem(AMenuItem, ACanvas, Width, Height);
end;

procedure TFormConsCompSystemsEditor.PopupSoftListPopup(Sender: TObject);
begin
  if not FormMain.CheckSelected(Systems) then
     begin
       PostMessage(Handle, WM_LBUTTONDOWN, MK_LBUTTON, 0);
       PostMessage(Handle, WM_LBUTTONUP, MK_LBUTTON, 0);
       Exit;
     end;
  if PopupSoftList.PopupComponent = SoftListFilesNotAssigned then
     begin
       PopupMoveSelectedToDestination.Caption:= 'Assign Selected to "'+Systems.Selection.First.Caption+'"';
       PopupMoveSelectedToDestination.ShortCut:= 0;
       PopupMoveSelectedToDestination.Tag:= 0;

       //ImagePanelSeparator.Hint:= PopupMenuImageCategories.Items[ImageDetails[1].ImageCategoryIndex].Caption;// Images.Hint;
       //PopupMenuImages.Tag:= 1;
     end
  else
  if PopupSoftList.PopupComponent = SoftListAssignedToSystem then
     begin
       PopupMoveSelectedToDestination.Caption:= 'Remove Selected from "'+Systems.Selection.First.Caption+'"';
       PopupMoveSelectedToDestination.ShortCut:= VK_DELETE;
       PopupMoveSelectedToDestination.Tag:= 1;
       //ImagePanelSeparator.Hint:= PopupMenuImageCategories.Items[ImageDetails[2].ImageCategoryIndex].Caption;// ImageScr[2].Hint;
       //PopupMenuImages.Tag:= 2;
     end;

  {if not ValidateSelectedGame then
     begin
       if IsImagePopupMenu then
          begin
            PostMessage(Handle, WM_LBUTTONDOWN, MK_LBUTTON, 0);
            PostMessage(Handle, WM_LBUTTONUP, MK_LBUTTON, 0);
          end;
       Exit;
     end;}
end;

procedure TFormConsCompSystemsEditor.PopupMoveSelectedToDestinationClick(
  Sender: TObject);
begin
  case PopupMoveSelectedToDestination.Tag of
    0: AddSelectedSoftListToSystem;
    1: RemoveSelectedSoftListFromSystem;
  end;
end;

procedure TFormConsCompSystemsEditor.SoftListAssignedToSystemKeyAction(
  Sender: TCustomEasyListview; var CharCode: Word; var Shift: TShiftState;
  var DoDefault: Boolean);
begin
  if CharCode = VK_DELETE then
     RemoveSelectedSoftListFromSystem;
end;

procedure TFormConsCompSystemsEditor.SoftListAssignedToSystemItemSelectionChanged(
  Sender: TCustomEasyListview; Item: TEasyItem);
begin
  if Item.Selected then
     begin
       PopupMoveSelectedToDestination.Tag:= 0;
       //ButtonMoveSelectedToDestination.Caption:= 'Remove From Selected System';
     end;
end;

procedure TFormConsCompSystemsEditor.SoftListFilesNotAssignedItemSelectionChanged(
  Sender: TCustomEasyListview; Item: TEasyItem);
begin
  if Item.Selected then
     begin
       PopupMoveSelectedToDestination.Tag:= 1;
       //ButtonMoveSelectedToDestination.Caption:= 'Assign To Selected System';
     end;
end;

function TFormConsCompSystemsEditor.ELV_AdjustCellHeight(ELV_Holder: TEasyListView): Boolean;
var
  iHeight, NewCellHeight: Integer;
begin
  Result:= False;
  iHeight:= ELV_Holder.Canvas.TextHeight('Ag');
  NewCellHeight:= iHeight+5;

  case IL_MediaType.Width of
    16:
      begin
        if NewCellHeight < 22 then
           NewCellHeight:= 22;
      end;
    24:
      begin
        if NewCellHeight < 28 then
           NewCellHeight:= 28;
      end;
  end;

  if (NewCellHeight <> ELV_Holder.CellSizes.Report.Height) then
     begin
       Result:= True;
       ELV_Holder.BeginUpdate;
       ELV_Holder.CellSizes.Report.Height:= NewCellHeight;
       ELV_Holder.EndUpdate(False);
     end;
end;

procedure TFormConsCompSystemsEditor.ButtonGamesListFontClick(Sender: TObject);
begin
  FormMain.FontDialog.Font:= SoftListAssignedToSystem.Font;
  FormMain.FontDialog.Tag:= 8;
  if FormMain.FontDialog.Execute then
     begin
       SoftListAssignedToSystem.Font:= FormMain.FontDialog.Font;
       SoftListFilesNotAssigned.Font:= FormMain.FontDialog.Font;
       if ELV_AdjustCellHeight(SoftListAssignedToSystem) then
          begin
            SoftListFilesNotAssigned.BeginUpdate;
            SoftListFilesNotAssigned.CellSizes.Report.Height:= SoftListAssignedToSystem.CellSizes.Report.Height;
            SoftListFilesNotAssigned.EndUpdate(False);
          end;
     end;
end;

procedure TFormConsCompSystemsEditor.GamesListBackgroundColorSelect(
  Sender: TObject);
begin
  SoftListAssignedToSystem.Color:= GamesListBackgroundColor.Selected;
  SoftListFilesNotAssigned.Color:= GamesListBackgroundColor.Selected;
end;

procedure TFormConsCompSystemsEditor.SoftListFilesNotAssignedColumnClick(
  Sender: TCustomEasyListview; Button: TCommonMouseButton;
  ShiftState: TShiftState; const Column: TEasyColumn);
begin
  if Button = cmbLeft then
     begin
       SoftListFilesNotAssigned.BeginUpdate;
       SoftListFilesNotAssigned.Sort.SortAll;
       SoftListFilesNotAssigned.EndUpdate(False);
     end;
end;

function TFormConsCompSystemsEditor.SoftListFilesNotAssignedItemCompare(
  Sender: TCustomEasyListview; Column: TEasyColumn; Group: TEasyGroup;
  Item1, Item2: TEasyItem; var DoDefault: Boolean): Integer;
var
  gItem1, gItem2: TEasyItem;
begin
  DoDefault:= False;
  FormMain.ELV_GetSortDirection(Column, Item1, Item2, gItem1, gItem2);
  case Column.Index of
    0: Result:= FormMain.iCompare(gItem1.Caption, gItem2.Caption);
    1: Result:= FormMain.iCompare(gItem1.Captions[1], gItem2.Captions[1]);
    2: Result:= FormMain.iCompare(gItem1.Captions[2], gItem2.Captions[2]);
  end;
end;

procedure TFormConsCompSystemsEditor.SoftListFilesNotAssignedDblClick(
  Sender: TCustomEasyListview; Button: TCommonMouseButton;
  MousePos: TPoint; ShiftState: TShiftState; var Handled: Boolean);
begin
  AddSelectedSoftListToSystem;
end;

procedure TFormConsCompSystemsEditor.SoftListAssignedToSystemDblClick(
  Sender: TCustomEasyListview; Button: TCommonMouseButton;
  MousePos: TPoint; ShiftState: TShiftState; var Handled: Boolean);
begin
  RemoveSelectedSoftListFromSystem;
end;

procedure TFormConsCompSystemsEditor.SoftListAssignedToSystemColumnSizeChanged(
  Sender: TCustomEasyListview; Column: TEasyColumn);
begin
  if SoftListFilesNotAssigned.Header.Columns[Column.Index].Width <> Column.Width then
     SoftListFilesNotAssigned.Header.Columns[Column.Index].Width:= Column.Width;
end;

procedure TFormConsCompSystemsEditor.SoftListFilesNotAssignedColumnSizeChanged(
  Sender: TCustomEasyListview; Column: TEasyColumn);
begin
  if SoftListAssignedToSystem.Header.Columns[Column.Index].Width <> Column.Width then
     SoftListAssignedToSystem.Header.Columns[Column.Index].Width:= Column.Width;
end;

procedure TFormConsCompSystemsEditor.SplitterMoved(Sender: TObject);
begin
  ButtonCancel.Left:= PanelButtons.Width-ButtonCancel.Width-8;
  ButtonOk.Left:= ButtonCancel.Left-ButtonOk.Width-6;
end;

end.
