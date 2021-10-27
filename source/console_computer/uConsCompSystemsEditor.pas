unit uConsCompSystemsEditor;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, uCommon, uCommonCustom,
  Dialogs, ImgList, MPCommonObjects, MPCommonUtilities, EasyListview, IniFiles,
  ExtCtrls, SplitterEx, StdCtrls, PanelEx, Buttons, ShadowLabel, Menus,
  BarMenus, ComCtrls, ToolWin, AdvOfficeButtons, EditEx, ButtonsEx;

type
  TFormConsCompSystemsEditor = class(TForm)
    IL_Systems: TImageList;
    Splitter: TSplitterEx;
    PanelSoftwareLists: TPanelEx;
    PanelAssignedSoftwareList: TPanelEx;
    SplitterMainSoftware: TSplitterEx;
    PanelRemainingSoftwareList: TPanelEx;
    SoftListFilesNotAssigned: TEasyListview;
    PanelBottom: TPanelEx;
    ButtonOk: TBitBtnEx;
    ButtonCancel: TBitBtnEx;
    PanelSystems: TPanelEx;
    Systems: TEasyListview;
    PopupSoftList: TBcBarPopupMenu;
    PopupMoveSelectedToDestination: TMenuItem;
    SoftListAssignedToSystem: TEasyListview;
    IL_MediaType: TImageList;
    SystemsHideScrollBarArea: TAdvOfficeCheckBoxEx;
    LabelSoftListAssignedToSystem: TShadowLabel;
    LabelSoftListFilesNotAssigned: TShadowLabel;
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
    procedure SystemsHideScrollBarAreaClick(Sender: TObject);
    procedure PanelBottomResize(Sender: TObject);
    procedure SystemsItemImageDraw(Sender: TCustomEasyListview;
      Item: TEasyItem; Column: TEasyColumn; ACanvas: TCanvas;
      const RectArray: TEasyRectArrayObject;
      AlphaBlender: TEasyAlphaBlender);
    procedure SystemsItemImageDrawIsCustom(Sender: TCustomEasyListview;
      Item: TEasyItem; Column: TEasyColumn; var IsCustom: Boolean);
    procedure SystemsItemImageGetSize(Sender: TCustomEasyListview;
      Item: TEasyItem; Column: TEasyColumn; var ImageWidth,
      ImageHeight: Integer);
    procedure SystemsItemPaintText(Sender: TCustomEasyListview;
      Item: TEasyItem; Position: Integer; ACanvas: TCanvas);
    procedure FormResize(Sender: TObject);
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
    procedure Resize4K;

    procedure UpdateSystemsDimensions;

  public
    { Public declarations }
  end;

var
  FormConsCompSystemsEditor: TFormConsCompSystemsEditor;

implementation

uses uMain, uStatus;

{$R *.dfm}

procedure TFormConsCompSystemsEditor.Resize4K;

  procedure MoveEasyListView(iEasyListView: TEasyListView; iLabelTotal: TShadowLabel);
  begin
    iLabelTotal.Height:= 36;
    iLabelTotal.Font.Size:= 16;
    iLabelTotal.CaptionIndent:= 10;

    FormMain.Set4KListViewSpecs(iEasyListView, -1, -1, -1, -1, 16);
    FormMain.Set4KListViewHeaderFontSizeSpecs(iEasyListView);
    //iEasyListView.PaintInfoItem.ImageIndent:= 2;   // reset to default
    //iEasyListView.PaintInfoItem.CaptionIndent:= 4; // reset to default
    iEasyListView.CellSizes.Report.Height:= 40;

    FormMain.Set4KListViewColumnSizeSpecs(iEasyListView, 0, 780-GetSystemMetrics(SM_CXVSCROLL));
    FormMain.Set4KListViewColumnSizeSpecs(iEasyListView, 1, 356);
    FormMain.Set4KListViewColumnSizeSpecs(iEasyListView, 2, 200);
  end;

begin
  if not Is4KMode then
     Exit;

  with FormConsCompSystemsEditor do
  begin
    Font.Size:= 16;
    FormMain.Set4KImageListSpecs(IL_Systems,  128);
    FormMain.Set4KImageListSpecs(IL_MediaType, 32);

    FormMain.Set4KListViewHeaderFontSizeSpecs(Systems);
    Systems.PaintInfoItem.IconViewRemoveIconTopBorder:= True;
    Systems.CellSizes.Icon.Width:=  156;
    Systems.CellSizes.Icon.Height:= 207+32+4;// // 32+4 (systype icon + border)
    Systems.BorderWidth:= 8;
    Systems.View:= elsIcon;
    Systems.PaintInfoItem.CaptionIndent:= 4; // reset to default
    Systems.PaintInfoItem.ImageIndent:=   2; // reset to default
    Systems.ImagesExLarge:= nil;
    Systems.ImagesLarge:= IL_Systems;
    Systems.Font.Size:= 16;

    FormMain.Set4KPanelSpecs(PanelSystems, -1, -1, (Systems.CellSizes.Icon.Width*4)+GetSystemMetrics(SM_CXVSCROLL)+16+2, -1);

    ClientWidth:=  PanelSystems.Width+Splitter.Width+1336; // PanelCustomGames.Width should be 2022 (see "source\4K\designs\console_computer\uConsCompGamesEditor_4K.pas")
    ClientHeight:= (Systems.CellSizes.Icon.Height*7)+16;

    PanelBottom.Height:= 71;

    FormMain.Set4KCheckBoxSpecs(SystemsHideScrollBarArea, 10, 18, 250, 36, 16);

    FormMain.Set4KButtonsOkCancelPanel(PanelBottom, ButtonOk, ButtonCancel, False);

    PanelAssignedSoftwareList.EnableCustomBorder:=  ecbNone;
    PanelRemainingSoftwareList.EnableCustomBorder:= ecbNone;
    PanelAssignedSoftwareList.Height:= (PanelSystems.Height-SplitterMainSoftware.Height-PanelBottom.Height) div 2;

    MoveEasyListView(SoftListAssignedToSystem, LabelSoftListAssignedToSystem);
    MoveEasyListView(SoftListFilesNotAssigned, LabelSoftListFilesNotAssigned);
  end;
end;

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
  FoundTitle, FoundPartName: Boolean;
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
  Application.ProcessMessages;
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
    //sIndex:= SoftListFiles_Name.IndexOf(NotAssignedSoftListFiles[Loop]);
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
    Application.ProcessMessages;
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
    Application.ProcessMessages;
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
  LabelSoftListAssignedToSystem.Caption:= '  '+IntToStr(SoftListAssignedToSystem.Groups.ItemCount)+LabelSoftListAssignedToSystem.Hint+SystemsListCustom[Systems.Tag, 0];
end;

procedure TFormConsCompSystemsEditor.UpdateNotAssignedTotalFiles;
begin
  LabelSoftListFilesNotAssigned.Caption:= '  '+IntToStr(SoftListFilesNotAssigned.Groups.ItemCount)+LabelSoftListFilesNotAssigned.Hint;
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
  Loop, LoopSoft: Integer;
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
  iSectionStr: String;
begin
  if not FileExists(GetMiscSettingsFile) then
     Exit;

  if Is4KMode then
     iSectionStr:= 'Systems Editor 4K'
  else
     iSectionStr:= 'Systems Editor';

  iIniFile:= TMemIniFile.Create(GetMiscSettingsFile);

  FormConsCompSystemsEditor.Tag:= Ord(iIniFile.ReadString (iSectionStr, 'WindowState', 'Normal') = 'Maximized');
  FormConsCompSystemsEditor.Width:=   iIniFile.ReadInteger(iSectionStr, 'ScreenWidth',  FormConsCompSystemsEditor.Width);
  FormConsCompSystemsEditor.Height:=  iIniFile.ReadInteger(iSectionStr, 'ScreenHeight', FormConsCompSystemsEditor.Height);

  PanelSystems.Width:= iIniFile.ReadInteger(iSectionStr, 'SystemsPanelWidth', PanelSystems.Width);
  if iIniFile.ReadInteger(iSectionStr, 'SystemsHideScrollBarArea', 0) = 1 then
     begin
       PanelSystems.Width:= PanelSystems.Width+GetSystemMetrics(SM_CXVSCROLL); // add extra ScrollBar area before executing CheckBox code! (DO NOT REMOVE THIS CODE!!!)
       SystemsHideScrollBarArea.Checked:= True;
     end;

  SoftListAssignedToSystem.BeginUpdate;
  for Loop:= 0 to SoftListAssignedToSystem.Header.Columns.Count-1 do
      SoftListAssignedToSystem.Header.Columns[Loop].Width:= iIniFile.ReadInteger(iSectionStr, 'SoftListColumnWidth'+IntToStr(Loop), SoftListAssignedToSystem.Header.Columns[Loop].Width);
  SoftListAssignedToSystem.EndUpdate;

  SoftListFilesNotAssigned.BeginUpdate;
  for Loop:=0 to SoftListFilesNotAssigned.Header.Columns.Count-1 do
      SoftListFilesNotAssigned.Header.Columns[Loop].Width:= SoftListAssignedToSystem.Header.Columns[Loop].Width;
  SoftListFilesNotAssigned.EndUpdate;

  FreeAndNil(iIniFile);
end;

procedure TFormConsCompSystemsEditor.WriteSettings;
var
  iIniFile: TMemIniFile;
  tmpString, iSectionStr: String;
  Loop: Integer;
begin
  if CheckReadOnly(GetMiscSettingsFile) then
     Exit;

  if Is4KMode then
     iSectionStr:= 'Systems Editor 4K'
  else
     iSectionStr:= 'Systems Editor';

  iIniFile:= TMemIniFile.Create(GetMiscSettingsFile);

  if FormConsCompSystemsEditor.WindowState = wsMaximized then
     tmpString:= 'Maximized'
  else
     tmpString:= 'Normal';

  iIniFile.WriteString(iSectionStr, 'WindowState', tmpString);
  if FormConsCompSystemsEditor.WindowState <> wsMaximized then
     begin
       iIniFile.WriteInteger(iSectionStr, 'ScreenWidth',  FormConsCompSystemsEditor.Width);
       iIniFile.WriteInteger(iSectionStr, 'ScreenHeight', FormConsCompSystemsEditor.Height);
     end;

  iIniFile.WriteInteger(iSectionStr, 'SystemsPanelWidth', PanelSystems.Width);
  iIniFile.WriteInteger(iSectionStr, 'SystemsHideScrollBarArea', Ord(SystemsHideScrollBarArea.Checked));

  for Loop:= 0 to SoftListAssignedToSystem.Header.Columns.Count-1 do
      iIniFile.WriteInteger(iSectionStr, 'SoftListColumnWidth'+IntToStr(Loop), SoftListAssignedToSystem.Header.Columns[Loop].Width);
  
  iIniFile.UpdateFile;
  FreeAndNil(iIniFile);
end;

procedure TFormConsCompSystemsEditor.FormShow(Sender: TObject);
begin
  Resize4K;
  FormStatus.MessageStr('Loading systems icons.');

  FormMain.ELV_ResetNormalColors(Systems);
  FormMain.ELV_ResetNormalColors(SoftListAssignedToSystem);
  FormMain.ELV_ResetNormalColors(SoftListFilesNotAssigned);

  if IsNightMode then
     begin
       FormConsCompSystemsEditor.Color:= menu_background_color[1];

       FormConsCompSystemsEditor.PanelSystems.Color1:= menu_background_color[1];
       FormMain.SetEasyListViewColors(Systems, menu_background_color[1], item_caption_active_color[1]);
       FormMain.ELV_SetNightModeColors(Systems);

       PanelSoftwareLists.Color1:= menu_background_color[1];
       PanelAssignedSoftwareList.Color1:= menu_background_color[1];
       PanelRemainingSoftwareList.Color1:= menu_background_color[1];
       FormMain.SetEasyListViewColors(SoftListAssignedToSystem, menu_background_color[1], clWhite);
       FormMain.SetEasyListViewColors(SoftListFilesNotAssigned, menu_background_color[1], clWhite);
       FormMain.SetEasyListViewHeaderColors(SoftListAssignedToSystem, True, False, Is4KMode);
       FormMain.SetEasyListViewHeaderColors(SoftListFilesNotAssigned, True, False, Is4KMode);
       FormMain.ELV_SetRibbonNightColors(0, SoftListAssignedToSystem, True);
       FormMain.ELV_SetRibbonNightColors(0, SoftListFilesNotAssigned, True);

       LabelSoftListAssignedToSystem.Color:= clrLightBlack;
       LabelSoftListFilesNotAssigned.Color:= clrLightBlack;
       SetLabelColors(LabelSoftListAssignedToSystem, item_caption_active_color[1], item_caption_active_shadow_color[1]);
       SetLabelColors(LabelSoftListFilesNotAssigned, item_caption_active_color[1], item_caption_active_shadow_color[1]);

       SetCheckBoxColors(SystemsHideScrollBarArea, clCream, item_caption_active_shadow_color[1]);
       FormMain.SetCheckBoxExCustomIcon(SystemsHideScrollBarArea);

       FormMain.SetButtonExColors(ButtonOk);
       FormMain.SetButtonExColors(ButtonCancel);

       SetBottomPanelColors(PanelBottom);

       FormMain.UpdateSplitterStyle(Splitter,             tsSolidColor, clrBlackBk, clGray);
       FormMain.UpdateSplitterStyle(SplitterMainSoftware, tsSolidColor, clrBlackBk, clGray);
       FormMain.SetGripIcon(Splitter, False);
       FormMain.SetGripIcon(SplitterMainSoftware, False);
     end;

  //ReadSettings;

  if FormConsCompSystemsEditor.Tag = 1 then
     WindowState:= wsMaximized
  else
     CallCenterWindow(FormConsCompSystemsEditor);

  Splitter.OnMoved(Self);
  PanelBottom.Tag:= 0; // hack so the PanelEx.OnResize() event is called only once
  PanelBottom.OnResize(Self);

  LoadCustomMAMEIconToForm(TForm(Sender));
  FormMain.LoadMediaTypeIcons2(IL_MediaType, True);
  FormMain.LoadNonArcadeSystemIcons(IL_Systems, False);
  FormMain.ShowIconErrorMessage;

  if IsNightMode then
     begin
       FormMain.SetWin10DarkScrollBar(Systems);
       FormMain.SetWin10DarkScrollBar(SoftListAssignedToSystem);
       FormMain.SetWin10DarkScrollBar(SoftListFilesNotAssigned);
     end;

  InitSystemsList;
  NotAssignedSoftListFiles:= THashedStringList.Create;

  GetMAME_SoftListFiles; // first, read all files from mamedir\hash\ folder and create the NotAssignedSoftListFiles() list

  LoadSoftListSystems; // read assigned softlists for all systems and remove the ones from NotAssignedSoftListFiles() list

  ELV_PopulateNotAssignedList; // populate EasyListView with the not assigned softlists

  FreeAndNil(NotAssignedSoftListFiles);

  ELV_PopulateCustomSystems(Systems, -1, -1, True);
  if not Is4KMode then
     FormMain.ELV_FixTitleClickAreaMulti(Systems);
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
       PostMessage(Handle, WM_LBUTTONUP,   MK_LBUTTON, 0);
       Exit;
     end;
  if PopupSoftList.PopupComponent = SoftListFilesNotAssigned then
     begin
       PopupMoveSelectedToDestination.Caption:= 'Assign Selected to "'+SystemsListCustom[Systems.Tag, 0]+'"';
       PopupMoveSelectedToDestination.ShortCut:= 0;
       PopupMoveSelectedToDestination.Tag:= 0;
     end
  else
  if PopupSoftList.PopupComponent = SoftListAssignedToSystem then
     begin
       PopupMoveSelectedToDestination.Caption:= 'Remove Selected from "'+SystemsListCustom[Systems.Tag, 0]+'"';
       PopupMoveSelectedToDestination.ShortCut:= VK_DELETE;
       PopupMoveSelectedToDestination.Tag:= 1;
     end;
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
     end;
end;

procedure TFormConsCompSystemsEditor.SoftListFilesNotAssignedItemSelectionChanged(
  Sender: TCustomEasyListview; Item: TEasyItem);
begin
  if Item.Selected then
     begin
       PopupMoveSelectedToDestination.Tag:= 1;
     end;
end;

function TFormConsCompSystemsEditor.ELV_AdjustCellHeight(ELV_Holder: TEasyListView): Boolean;
var
  iHeight, NewCellHeight: Integer;
begin
  Result:= False;
  iHeight:= ELV_Holder.Canvas.TextHeight('Ag[Á');
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
  UpdateSystemsDimensions;
end;

procedure TFormConsCompSystemsEditor.UpdateSystemsDimensions;
var
  SysTitleBarHeight, NewWidth, NewHeight: Integer;
begin
  if Systems.Align = alClient then
     Exit;

  SysTitleBarHeight:= 0;

  NewWidth:=  PanelSystems.Width+GetSystemMetrics(SM_CXVSCROLL);
  NewHeight:= PanelSystems.Height-SysTitleBarHeight;

  if Systems.Width <> NewWidth then
     Systems.Width:=  NewWidth;

  if Systems.Height <> NewHeight then
     Systems.Height:=  NewHeight;
end;

procedure TFormConsCompSystemsEditor.SystemsHideScrollBarAreaClick(
  Sender: TObject);
begin
  Systems.BeginUpdate;
  if SystemsHideScrollBarArea.Checked then
     begin
       Systems.Align:= alNone;
       PanelSystems.Width:= PanelSystems.Width-GetSystemMetrics(SM_CXVSCROLL);
     end
  else
     begin
       PanelSystems.Width:= PanelSystems.Width+GetSystemMetrics(SM_CXVSCROLL);
       Systems.Align:= alClient;
     end;

  if Is4KMode then
     Systems.Scrollbars.VertEnabled:= not SystemsHideScrollBarArea.Checked;
  Systems.EndUpdate;
end;

procedure TFormConsCompSystemsEditor.PanelBottomResize(Sender: TObject);
begin
  if PanelBottom.Tag = 0 then
     begin
       ButtonCancel.Left:= PanelBottom.Width-ButtonCancel.Width-10;
       ButtonOk.Left:= ButtonCancel.Left-ButtonOk.Width-10;
     end;
end;

procedure TFormConsCompSystemsEditor.SystemsItemImageDraw(
  Sender: TCustomEasyListview; Item: TEasyItem; Column: TEasyColumn;
  ACanvas: TCanvas; const RectArray: TEasyRectArrayObject;
  AlphaBlender: TEasyAlphaBlender);
var
  iLeft, iTop: Integer;
  iSysTypeIndex: Integer;
begin
  if Is4KMode then
     FormMain.ELV_DrawIconSystem_CustomSysType(Sender, Item, Column, ACanvas, RectArray, IL_Systems, False, False)
  else
  begin
    iLeft:= RectArray.IconRect.Left+Systems.PaintInfoItem.ImageIndent+1;
    iTop:=  RectArray.IconRect.Top+1;

    IL_Systems.Draw(ACanvas, iLeft, iTop, Item.ImageIndex);

    iLeft:= iLeft+IL_Systems.Width+4;
    iTop:=  iTop+(IL_Systems.Height-FormMain.IL_MenuPopup.Height);

    if Item.ImageIndex = 0 then
       Exit;
       
    iSysTypeIndex:= -1;
    if SystemIsConsole(Item.ImageIndex) then
       iSysTypeIndex:= 25 // index 25 is "console" icon
    else
    if SystemIsComputer(Item.ImageIndex) then
       iSysTypeIndex:= 26 // index 26 is "computer" icon
    else
    if SystemIsHandheld(Item.ImageIndex) then
       iSysTypeIndex:= 27; // index 27 is "handheld" icon

    if iSysTypeIndex <> -1 then
       FormMain.IL_MenuPopup.Draw(ACanvas, iLeft, iTop, iSysTypeIndex);
  end;
end;

procedure TFormConsCompSystemsEditor.SystemsItemImageDrawIsCustom(
  Sender: TCustomEasyListview; Item: TEasyItem; Column: TEasyColumn;
  var IsCustom: Boolean);
begin
  IsCustom:= True; // this is for tiles view mode
end;

procedure TFormConsCompSystemsEditor.SystemsItemImageGetSize(
  Sender: TCustomEasyListview; Item: TEasyItem; Column: TEasyColumn;
  var ImageWidth, ImageHeight: Integer);
begin
  ImageWidth:=  IL_Systems.Width;
  ImageHeight:= IL_Systems.Height;
  if Is4KMode then
     ImageHeight:= ImageHeight+FormMain.IL_GroupedMode.Width+4; // +4 -> space between sys icon / sys type icon
end;

procedure TFormConsCompSystemsEditor.SystemsItemPaintText(
  Sender: TCustomEasyListview; Item: TEasyItem; Position: Integer;
  ACanvas: TCanvas);
begin
  if Is4KMode then
     Exit;

  if Position = 1 then
     FormMain.ELV_SetSelecionFontColors(Systems, Item, ACanvas);
end;

procedure TFormConsCompSystemsEditor.FormResize(Sender: TObject);
begin
  UpdateSystemsDimensions;
end;

end.
