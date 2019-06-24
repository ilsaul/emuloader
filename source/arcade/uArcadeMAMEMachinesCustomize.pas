unit uArcadeMAMEMachinesCustomize;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  IniFiles, uCommon, uCommonCustom, MPCommonObjects, MPCommonUtilities, EasyListview,
  AdvOfficeButtons, StdCtrls, Buttons, PanelEx, ShadowLabel, ImgList,
  ExtCtrls, Menus, BarMenus, ButtonsEx;

type
  TMachineEditorGameInfo = class(TEasyItemStored)
  private
    fImageIndex: Integer;
    fROMIdentification: Integer;
    fMediaType: ShortInt;
    fSystemID: ShortInt;
    //fIconLoaded: Boolean;
    fTitle: WideString;
    fYear: String;
    fManufacturer: WideString;
    fDriverStatus: ShortInt;
    fName: String;
    fClone: String;
    fDriverName: String;
    fSaveState: ShortInt;
    //fIsFavorite: Boolean;
    //fHaveGameROMs: ShortInt;

    //fScanMode: Byte;
    fIsMerged: Boolean;
    fGameSetStatus: ShortInt;
    //fCHDsCount: Byte;
    //fROMsAllNoDump: Boolean;
    fCheckedFromIni: Boolean;
  protected
    function GetCaptions(Column: Integer): WideString; override;
    function GetImageIndexes(Column: Integer): TCommonImageIndexInteger; override;
    function GetStateImageIndexes(Column: Integer): TCommonImageIndexInteger; override;
  public
    property eImageIndex: Integer read fImageIndex write fImageIndex;
    property eROMIdentification: Integer read fROMIdentification write fROMIdentification;
    property eMediaType: ShortInt read fMediaType write fMediaType;
    property eSystemID: ShortInt read fSystemID write fSystemID;
    property eTitle: WideString read fTitle write fTitle;
    property eYear: String read fYear write fYear;
    property eManufacturer: WideString read fManufacturer write fManufacturer;

    property eDriverStatus: ShortInt read fDriverStatus write fDriverStatus;

    property eName: String read fName write fName;
    property eClone: String read fClone write fClone;
    property eDriverName: String read fDriverName write fDriverName;
    property eSaveState: ShortInt read fSaveState write fSaveState;

    //property eIsFavorite: Boolean read fIsFavorite write fIsFavorite;
    //property eHaveGameROMs: ShortInt read fHaveGameROMs write fHaveGameROMs; // game ROMs ? or it's just bios ROMs and/or device ROMs or nothing at all...

    //property eScanMode: Byte read fScanMode write fScanMode; // 0 -> full scan; 1 -> quick scan (file search only); 2 -> force available
    property eIsMerged: Boolean read fIsMerged write fIsMerged; // for MAME and software list games / HBMAME
    //property eCHDsCount: Byte read fCHDsCount write fCHDsCount;
    //property eROMsAllNoDump: Boolean read fROMsAllNoDump write fROMsAllNoDump; // all ROMs with empty CRC! for Taito Type X and others that have game set but all ROMs
    //                                                                           // are tagged "nodump"... game set not required to make game available!!!!!
    property eGameSetStatus: ShortInt read fGameSetStatus write fGameSetStatus; // 0 - have; 1 - missing ROMs/CHDs; 2 - missing (no .zip and no ROMs found)

    property eCheckedFromIni: Boolean read fCheckedFromIni write fCheckedFromIni;
  end;

type
  TFormArcadeMAMEMachinesCustomize = class(TForm)
    BottomBar: TPanelEx;
    ButtonYes: TBitBtnEx;
    ButtonNo: TBitBtnEx;
    ButtonResetToCurrent: TBitBtnEx;
    CheckAll: TAdvOfficeCheckBoxEx;
    LabelTotalMachinesList: TShadowLabel;
    FilterShowUncheckedOnly: TAdvOfficeCheckBoxEx;
    IL_MediaType: TImageList;
    TopBar: TPanelEx;
    SystemIcon: TImage;
    LabelSystemTitle: TShadowLabel;
    EmulatorIcon: TImage;
    LabelEmulatorVersion: TShadowLabel;
    FrameSoftwareList: TPanelEx;
    MachinesListEditor: TEasyListview;
    FilterShowParentSetsOnly: TAdvOfficeCheckBoxEx;
    PopupMachines: TBcBarPopupMenu;
    PopupCheckMultipleSelected: TMenuItem;
    PopupUncheckMultipleSelected: TMenuItem;
    procedure FormShow(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure CheckAllClick(Sender: TObject);
    procedure MachinesListEditorItemPaintText(Sender: TCustomEasyListview;
      Item: TEasyItem; Position: Integer; ACanvas: TCanvas);
    procedure MachinesListEditorItemCheckChange(Sender: TCustomEasyListview;
      Item: TEasyItem);
    procedure ButtonResetToCurrentClick(Sender: TObject);
    procedure MachinesListEditorColumnClick(Sender: TCustomEasyListview;
      Button: TCommonMouseButton; ShiftState: TShiftState;
      const Column: TEasyColumn);
    procedure FilterShowUncheckedOnlyClick(Sender: TObject);
    procedure MachinesListEditorItemCheckChanging(Sender: TCustomEasyListview;
      Item: TEasyItem; var Allow: Boolean);
    procedure ButtonYesClick(Sender: TObject);
    procedure MachinesListEditorIncrementalSearch(
      Item: TEasyCollectionItem; const SearchBuffer: WideString;
      var Handled: Boolean; var CompareResult: Integer);
    function MachinesListEditorItemCompare(Sender: TCustomEasyListview;
      Column: TEasyColumn; Group: TEasyGroup; Item1, Item2: TEasyItem;
      var DoDefault: Boolean): Integer;
    procedure MachinesListEditorItemSelectionChanged(
      Sender: TCustomEasyListview; Item: TEasyItem);
    procedure MachinesListEditorKeyAction(Sender: TCustomEasyListview;
      var CharCode: Word; var Shift: TShiftState; var DoDefault: Boolean);
    procedure FilterShowParentSetsOnlyClick(Sender: TObject);
    procedure PopupMachinesMeasureMenuItem(Sender: TObject;
      AMenuItem: TMenuItem; ACanvas: TCanvas; var Width, Height: Integer;
      ABarVisible: Boolean; var DefaultMeasure: Boolean);
    procedure PopupMachinesPopup(Sender: TObject);
    procedure PopupCheckMultipleSelectedClick(Sender: TObject);
  private
    { Private declarations }
    procedure ELV_LoadMachinesList;
    procedure ELV_LoadMachinesList_Grouped;
    procedure ResizeForm;
    procedure UpdateCheckedStateCheckBox;
  public
    { Public declarations }
  end;

var
  FormArcadeMAMEMachinesCustomize: TFormArcadeMAMEMachinesCustomize;

implementation

uses uMain, uStatus;

{$R *.dfm}

function TMachineEditorGameInfo.GetCaptions(Column: Integer): WideString;
begin
  case Column of
    00: Result:= eTitle;
    01: Result:= eYear;
    02: Result:= eManufacturer;
    03: Result:= eName;
    04: Result:= eClone;
    05: Result:= eDriverName;
    06: Result:= aSaveState[eSaveState];
  end;
end;

function TMachineEditorGameInfo.GetImageIndexes(Column: Integer): TCommonImageIndexInteger;
begin
  if Column = 0 then
     Result:= FormMain.GetMAMEImageIndex(eImageIndex, '')
  else
     Result:= -1;
end;

function TMachineEditorGameInfo.GetStateImageIndexes(Column: Integer): TCommonImageIndexInteger;
begin
  Result:= -1;
  case Column of
    0: // machine title
     begin
       //if FormMain.GameIsClone(eClone) then
       //   Result:= 15;
     end;
    5: Result:= eDriverStatus;// driver name
  end;
end;

procedure TFormArcadeMAMEMachinesCustomize.ELV_LoadMachinesList;
var
  MachinesIni: THashedStringList;
  ExcludeFiles: THashedStringList;
  Loop: Integer;
  addItem: TEasyItem;
begin
  if not FormMain.ValidateFile(FormMain.GetGamesFolderEL+GetSystemFileName(idMAME, 5)) then
     Exit;
  if not FileExists(FormMain.GetGamesFolderEL+GetsystemFileName(idMAME)) then
     Exit;

  ButtonResetToCurrent.Enabled:= FormMain.ValidateFile(FormMain.GetMAMEMachinesExcludeFile(idMAME));
  if ButtonResetToCurrent.Enabled then
     begin
       ExcludeFiles:= THashedStringList.Create;
       ExcludeFiles.LoadFromFile(FormMain.GetMAMEMachinesExcludeFile(idMAME));
     end;

  MachinesIni:= THashedStringList.Create;
  MachinesIni.LoadFromFile(FormMain.GetGamesFolderEL+GetSystemFileName(idMAME, 5));

  FormMain.CompleteGamesList:= THashedStringList.Create;
  FormMain.GetGamesList(FormMain.CompleteGamesList, idMAME);

  FormMain.ClearListView(MachinesListEditor);
  MachinesListEditor.BeginUpdate;
  MachinesListEditor.Items.ReIndexDisable:= True;
  Application.ProcessMessages;

  for Loop:=0 to FormMain.CompleteGamesList.Count -1 do
  begin
    FormMain.TempGameVars.eName:= FormMain.CompleteGamesList.Names[Loop];
    //MachinesIni.ReadSectionValues(FormMain.TempGameVars.eName, SoftLists);
    if MachinesIni.IndexOf('['+FormMain.TempGameVars.eName+']') <> -1 then
    begin
      // only add machines that have software lists
      FormMain.ClearMemGameInfo(FormMain.TempGameVars);
      if FormMain.GetROMFields(FormMain.CompleteGamesList, Loop) then
      begin
        addItem:= MachinesListEditor.Items.AddCustom(TMachineEditorGameInfo, nil);

        TMachineEditorGameInfo(addItem).eImageIndex:= FormMain.TempGameVars.eROMIdentification;
        TMachineEditorGameInfo(addItem).eROMIdentification:= FormMain.TempGameVars.eROMIdentification;
        TMachineEditorGameInfo(addItem).eMediaType:= FormMain.TempGameVars.eMediaType;
        TMachineEditorGameInfo(addItem).eSystemID:= FormMain.TempGameVars.eSystemID;
        TMachineEditorGameInfo(addItem).eTitle:= FormMain.TempGameVars.eTitle;
        TMachineEditorGameInfo(addItem).eYear:= FormMain.TempGameVars.eYear;
        TMachineEditorGameInfo(addItem).eManufacturer:= FormMain.TempGameVars.eManufacturer;
        TMachineEditorGameInfo(addItem).eDriverStatus:= FormMain.TempGameVars.eDriverStatus;
        TMachineEditorGameInfo(addItem).eName:= FormMain.TempGameVars.eName;
        TMachineEditorGameInfo(addItem).eClone:= FormMain.TempGameVars.eClone;
        TMachineEditorGameInfo(addItem).eDriverName:= FormMain.TempGameVars.eDriverName;
        TMachineEditorGameInfo(addItem).eSaveState:= FormMain.TempGameVars.eSaveState;
        TMachineEditorGameInfo(addItem).eIsMerged:= FormMain.TempGameVars.eIsMerged;
        TMachineEditorGameInfo(addItem).eGameSetStatus:= FormMain.TempGameVars.eGameSetStatus;

        if Assigned(ExcludeFiles) then
           TMachineEditorGameInfo(addItem).eCheckedFromIni:= ExcludeFiles.IndexOf(FormMain.TempGameVars.eName) = -1 // only check if not found in "ini_files\mame_machines_exclude.txt"
        else
           TMachineEditorGameInfo(addItem).eCheckedFromIni:= True;
        addItem.Checked:= TMachineEditorGameInfo(addItem).eCheckedFromIni;
      end;
    end;
    Application.ProcessMessages;
  end;
  FormMain.ClearMemGameInfo(FormMain.TempGameVars);

  FreeAndNil(MachinesIni);
  FreeAndNil(FormMain.CompleteGamesList);
  FreeAndNil(ExcludeFiles);
  //FixSortTitle(MachinesListSidePanel.Header.Columns.Columns[LastColumnSorted]); // no need for this in grouped view mode, do not remove this line (April 01, 2018)
  if FormMain.CheckTotal(MachinesListEditor) then
     MachinesListEditor.Sort.SortAll;
  MachinesListEditor.Items.ReIndexDisable:= False;
  MachinesListEditor.EndUpdate(False);

  LabelTotalMachinesList.Tag:= MachinesListEditor.Items.Count;
  UpdateCheckedStateCheckBox;

//  ApplyMachinesListFilter;
end;

procedure TFormArcadeMAMEMachinesCustomize.ELV_LoadMachinesList_Grouped;
var
  MachinesIni: TMemIniFile;
  SoftLists: TStringList;
  ExcludeFiles: THashedStringList;
  Loop: Integer;
  addGroup: TEasyGroup;
  addItem: TEasyItem;
begin
  if not FormMain.ValidateFile(FormMain.GetGamesFolderEL+GetSystemFileName(idMAME, 5)) then
     Exit;
  if not FileExists(FormMain.GetGamesFolderEL+GetsystemFileName(idMAME)) then
     Exit;

  ButtonResetToCurrent.Enabled:= FormMain.ValidateFile(FormMain.GetMAMEMachinesExcludeFile(idMAME));
  if ButtonResetToCurrent.Enabled then
     begin
       ExcludeFiles:= THashedStringList.Create;
       ExcludeFiles.LoadFromFile(FormMain.GetMAMEMachinesExcludeFile(idMAME));
     end;

  MachinesIni:= TMemIniFile.Create(FormMain.GetGamesFolderEL+GetSystemFileName(idMAME, 5));

  FormMain.CompleteGamesList:= THashedStringList.Create;
  FormMain.GetGamesList(FormMain.CompleteGamesList, idMAME);

  SoftLists:= TStringList.Create;

  FormMain.ClearListView(MachinesListEditor);
  MachinesListEditor.BeginUpdate;
  MachinesListEditor.Items.ReIndexDisable:= True;
  Application.ProcessMessages;

  for Loop:=0 to FormMain.CompleteGamesList.Count -1 do
  begin
    FormMain.TempGameVars.eName:= FormMain.CompleteGamesList.Names[Loop];
    MachinesIni.ReadSectionValues(FormMain.TempGameVars.eName, SoftLists);
    if SoftLists.Count > 0 then
    begin
      FormMain.ClearMemGameInfo(FormMain.TempGameVars);
      if FormMain.GetROMFields(FormMain.CompleteGamesList, Loop) then
      begin
        if not FormMain.GameIsClone(FormMain.TempGameVars.eClone) then
        begin
          // create game title ELV group for grouped view mode
          addGroup:= MachinesListEditor.Groups.AddCustom(TGroupInfo, nil);
          TGroupInfo(addGroup).eImageIndex:= FormMain.TempGameVars.eROMIdentification;
          TGroupInfo(addGroup).eSystemID:= idMAME;
          TGroupInfo(addGroup).eSystemType:= 1;
          TGroupInfo(addGroup).eTitle:= FormMain.TempGameVars.eTitle;
          TGroupInfo(addGroup).eYear:= FormMain.TempGameVars.eYear;
          TGroupInfo(addGroup).eManufacturer:= FormMain.TempGameVars.eManufacturer;
          TGroupInfo(addGroup).eName:= FormMain.TempGameVars.eName;
          TGroupInfo(addGroup).eSoftwareName:= '';
        end;
        addItem:= MachinesListEditor.Items.AddCustom(TMachineEditorGameInfo, addGroup);

        TMachineEditorGameInfo(addItem).eImageIndex:= FormMain.TempGameVars.eROMIdentification;
        TMachineEditorGameInfo(addItem).eROMIdentification:= FormMain.TempGameVars.eROMIdentification;
        TMachineEditorGameInfo(addItem).eMediaType:= FormMain.TempGameVars.eMediaType;
        TMachineEditorGameInfo(addItem).eSystemID:= FormMain.TempGameVars.eSystemID;
        TMachineEditorGameInfo(addItem).eTitle:= FormMain.TempGameVars.eTitle;
        TMachineEditorGameInfo(addItem).eYear:= FormMain.TempGameVars.eYear;
        TMachineEditorGameInfo(addItem).eManufacturer:= FormMain.TempGameVars.eManufacturer;
        TMachineEditorGameInfo(addItem).eDriverStatus:= FormMain.TempGameVars.eDriverStatus;
        TMachineEditorGameInfo(addItem).eName:= FormMain.TempGameVars.eName;
        TMachineEditorGameInfo(addItem).eClone:= FormMain.TempGameVars.eClone;
        TMachineEditorGameInfo(addItem).eDriverName:= FormMain.TempGameVars.eDriverName;
        TMachineEditorGameInfo(addItem).eSaveState:= FormMain.TempGameVars.eSaveState;
        TMachineEditorGameInfo(addItem).eIsMerged:= FormMain.TempGameVars.eIsMerged;
        TMachineEditorGameInfo(addItem).eGameSetStatus:= FormMain.TempGameVars.eGameSetStatus;

        if Assigned(ExcludeFiles) then
           TMachineEditorGameInfo(addItem).eCheckedFromIni:= ExcludeFiles.IndexOf(FormMain.TempGameVars.eName) = -1 // only check if not found in "ini_files\mame_machines_exclude.txt"
        else
           TMachineEditorGameInfo(addItem).eCheckedFromIni:= True;
        addItem.Checked:= TMachineEditorGameInfo(addItem).eCheckedFromIni;
      end;
    end;
    Application.ProcessMessages;
  end;
  FormMain.ClearMemGameInfo(FormMain.TempGameVars);

  FreeAndNil(SoftLists);
  FreeAndNil(MachinesIni);
  FreeAndNil(FormMain.CompleteGamesList);
  FormMain.ELV_RemoveDefaultGroup(MachinesListEditor);
  //FixSortTitle(MachinesListSidePanel.Header.Columns.Columns[LastColumnSorted]); // no need for this in grouped view mode, do not remove this line (April 01, 2018)
  if FormMain.CheckTotal(MachinesListEditor) then
     MachinesListEditor.Sort.SortAll;
  MachinesListEditor.Items.ReIndexDisable:= False;
  MachinesListEditor.EndUpdate(False);
  
  UpdateCheckedStateCheckBox;

//  ApplyMachinesListFilter;
end;

procedure TFormArcadeMAMEMachinesCustomize.ResizeForm;
begin
  if Screen.Width > 1024 then
     begin
       MachinesListEditor.Header.Columns[0].Width:= MachinesListEditor.Header.Columns[0].Width-GetSystemMetrics(SM_CXVSCROLL);
       Exit;
     end;

  LabelTotalMachinesList.Left:= 815;
  FrameSoftwareList.Width:= 967;
  ButtonYes.Left:= 783;
  ButtonNo.Left:= 886;
  LabelSystemTitle.Width:= 890;
  LabelEmulatorVersion.Width:= 863;
end;

procedure TFormArcadeMAMEMachinesCustomize.FormShow(Sender: TObject);
begin
  FormMain.ELV_ResetNormalColors(MachinesListEditor);
  FormMain.LoadMediaTypeIcons(IL_MediaType, True);
  FormMain.LoadIconIntoImage('emu_ume', SystemIcon);
  FormMain.LoadIconIntoImage('play_standard', EmulatorIcon);

  LabelEmulatorVersion.Caption:= FormMain.EmulatorVersion[idMAME]+#13#10+FormMain.EmulatorFile[idMAME];

  ResizeForm;

  if IsNightMode then
     begin
       SetFormColors(FormArcadeMAMEMachinesCustomize, TopBar, BottomBar, LabelSystemTitle, LabelEmulatorVersion, -1, False);
       SetLabelColors(LabelTotalMachinesList, clWhite, clNavy);

       //FrameSoftwareList.ColorFrame:= $00ff9933; // neon blue
       //FrameSoftwareList.ColorInnerFrame:= clBlue;
       FrameSoftwareList.Color1:= clrBlackBk;
       MachinesListEditor.Color:= clrBlackBk;
       MachinesListEditor.Font.Color:= clWhite;

       SetCheckBoxColors(CheckAll, clWhite, clNavy);
       SetCheckBoxColors(FilterShowUncheckedOnly, clWhite, clNavy);
       SetCheckBoxColors(FilterShowParentSetsOnly, clWhite, clNavy);

       FormMain.ELV_SetRibbonNightColors(0, MachinesListEditor, True);
     end;

  //GetMAME_SoftListFiles; // first, read all files from mamedir\hash\ folder and create the NotAssignedSoftListFiles() list
  ELV_LoadMachinesList;
  FormMain.HideFilterMsgBox;
end;

procedure TFormArcadeMAMEMachinesCustomize.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if MachinesListEditor.CheckManager.Count = 0 then
     begin
       CanClose:= False;
       Exit;
     end;
  FormArcadeMAMEMachinesCustomize.Tag:= 1;
  FormMain.ClearListView(MachinesListEditor);
end;

procedure TFormArcadeMAMEMachinesCustomize.UpdateCheckedStateCheckBox;
var
  iCheckCount: Integer;

  function UpdateCheckBox(iState: TCheckBoxState): Boolean;
  begin
    Result:= True;
    if CheckAll.State <> iState then
       CheckAll.State:= iState;
  end;

  function UpdateCheckBoxLabel(const iStr: String): Boolean;
  begin
    Result:= True;
    if CheckAll.Caption <> iStr then
       CheckAll.Caption:= iStr;
  end;

begin
  // LabelTotalSoftwareList.Tag -> total items in EasyListView
  iCheckCount:= MachinesListEditor.CheckManager.Count;
  if iCheckCount = 0 then
     UpdateCheckBox(cbUnchecked)
     //CheckAll.State:= cbUnchecked
  else
  if iCheckCount = LabelTotalMachinesList.Tag then
     UpdateCheckBox(cbChecked)
     //CheckAll.State:= cbChecked
  else
  if iCheckCount < LabelTotalMachinesList.Tag then
     UpdateCheckBox(cbGrayed);
     //CheckAll.State:= cbGrayed;

  case CheckAll.State of
    cbUnchecked, cbGrayed: UpdateCheckBoxLabel('Check All');
    cbChecked: UpdateCheckBoxLabel('Uncheck All');
    //cbGrayed: CheckAll.Caption:= 'Check All';
  end;
  LabelTotalMachinesList.Caption:= 'Checked '+IntToStr(iCheckCount)+' of '+IntToStr(MachinesListEditor.Items.Count);

end;

procedure TFormArcadeMAMEMachinesCustomize.CheckAllClick(Sender: TObject);
var
  IsChecked: Boolean;
  Item: TEasyItem;
begin
  //if FormSoftwareListCustomize.Tag = 0 then
  //   CheckAll.Tag:= Ord(CheckAll.State);
  case CheckAll.State of
    cbUnchecked: CheckAll.Caption:= 'Check All';
    cbChecked: CheckAll.Caption:= 'Uncheck All';
    //cbGrayed: CheckAll.Caption:= 'Check All';
  end;
  if FormArcadeMAMEMachinesCustomize.Tag = 1 then
     Exit;
  if not FormMain.CheckTotal(MachinesListEditor) then
     Exit;

  MachinesListEditor.BeginUpdate;
  Item:= MachinesListEditor.Groups.FirstItem;
  repeat
    case CheckAll.State of
      cbUnchecked: IsChecked:= False;
      cbChecked: IsChecked:= True;
      //cbGrayed: IsChecked:= TSoftwareInfo(Item).eCheckedCustom;
    end;
    Item.Checked:= IsChecked;
    Item:= MachinesListEditor.Groups.NextItem(Item);
  until Item = nil;
  MachinesListEditor.EndUpdate;
  MachinesListEditor.SetFocus;
end;

procedure TFormArcadeMAMEMachinesCustomize.MachinesListEditorItemPaintText(
  Sender: TCustomEasyListview; Item: TEasyItem; Position: Integer;
  ACanvas: TCanvas);
begin
  FormMain.GetCanvasDefaultFont(ACanvas, TMachineEditorGameInfo(Item).eGameSetStatus,
                                TMachineEditorGameInfo(Item).eDriverStatus, IsNightMode);

  FormMain.ELV_ItemPaintText_General(Sender, Item, ACanvas);

  if not Item.Checked then
     ACanvas.Font.Color:= clGray;
end;

procedure TFormArcadeMAMEMachinesCustomize.MachinesListEditorItemCheckChange(
  Sender: TCustomEasyListview; Item: TEasyItem);
begin
  if FormArcadeMAMEMachinesCustomize.Tag = 0 then
     begin
       UpdateCheckedStateCheckBox;
     end;
end;

procedure TFormArcadeMAMEMachinesCustomize.ButtonResetToCurrentClick(
  Sender: TObject);
var
  Item: TEasyItem;
begin
  MachinesListEditor.BeginUpdate;
  Item:= MachinesListEditor.Groups.FirstItem;
  repeat
    Item.Checked:= TMachineEditorGameInfo(Item).eCheckedFromIni; // reset to last saved "ini_files\softlist_exclude.txt"
    // not used!!!! //TSoftwareInfo(Item).eCheckedCustom:= TSoftwareInfo(Item).eCheckedFromIni;
    Item:= MachinesListEditor.Groups.NextItem(Item);
  until Item = nil;
  MachinesListEditor.EndUpdate;
  UpdateCheckedStateCheckBox;
end;

procedure TFormArcadeMAMEMachinesCustomize.MachinesListEditorColumnClick(
  Sender: TCustomEasyListview; Button: TCommonMouseButton;
  ShiftState: TShiftState; const Column: TEasyColumn);
begin
  if Button = cmbLeft then
     begin
       MachinesListEditor.BeginUpdate;
       MachinesListEditor.Sort.SortAll;
       MachinesListEditor.EndUpdate(False);
     end;
end;

procedure TFormArcadeMAMEMachinesCustomize.FilterShowUncheckedOnlyClick(
  Sender: TObject);
var
  Item: TEasyItem;
begin
  if not FormMain.CheckTotal(MachinesListEditor) then
     Exit;

  FormArcadeMAMEMachinesCustomize.Tag:= 5; // to avoid items being unchecked when set item.visible... EasyListView bug ??????! :_((
  MachinesListEditor.BeginUpdate;
  Item:= MachinesListEditor.Groups.FirstItem;
  repeat
    case FilterShowUncheckedOnly.Checked of
      True : Item.Visible:= not Item.Checked;
      False: Item.Visible:= True;
    end;
    Item:= MachinesListEditor.Groups.NextItem(Item);
  until Item = nil;
  MachinesListEditor.EndUpdate(False);
  MachinesListEditor.SetFocus;
  FormArcadeMAMEMachinesCustomize.Tag:= 0;
  if FormMain.CheckSelected(MachinesListEditor) then
     MachinesListEditor.Selection.First.MakeVisible(emvMiddle) //(emvAuto);
end;

procedure TFormArcadeMAMEMachinesCustomize.MachinesListEditorItemCheckChanging(
  Sender: TCustomEasyListview; Item: TEasyItem; var Allow: Boolean);
begin
  if FormArcadeMAMEMachinesCustomize.Tag = 5 then
     Allow:= False;
end;

procedure TFormArcadeMAMEMachinesCustomize.ButtonYesClick(Sender: TObject);
var
  Item: TEasyItem;
  iListXML: TStringList;
begin
  if MachinesListEditor.CheckManager.Count = 0 then
     Exit;

  DeleteFile(FormMain.GetMAMEMachinesExcludeFile(idMAME));

  iListXML:= TStringList.Create;
  iListXML.BeginUpdate;
  Item:= MachinesListEditor.Groups.FirstItem;
  repeat
    if not Item.Checked then
       iListXML.Add(TMachineEditorGameInfo(Item).eName);
    Item:= MachinesListEditor.Groups.NextItem(Item);
  until Item = nil;
  iListXML.Sort;
  iListXML.EndUpdate;
  if iListXML.Count > 0 then
     iListXML.SaveToFile(FormMain.GetMAMEMachinesExcludeFile(idMAME));
  FreeAndNil(iListXML);
end;

procedure TFormArcadeMAMEMachinesCustomize.MachinesListEditorIncrementalSearch(
  Item: TEasyCollectionItem; const SearchBuffer: WideString;
  var Handled: Boolean; var CompareResult: Integer);
begin
  CompareResult:= WideIncrementalSearch(TMachineEditorGameInfo(Item).eTitle, SearchBuffer);
end;

function TFormArcadeMAMEMachinesCustomize.MachinesListEditorItemCompare(
  Sender: TCustomEasyListview; Column: TEasyColumn; Group: TEasyGroup;
  Item1, Item2: TEasyItem; var DoDefault: Boolean): Integer;
var
  gItem1, gItem2: TEasyItem;
begin
  DoDefault:= False;
  FormMain.ELV_GetSortDirection(Column, Item1, Item2, gItem1, gItem2);
  case Column.Index of
    00: Result:= FormMain.iCompare(TMachineEditorGameInfo(gItem1).eTitle, TMachineEditorGameInfo(gItem2).eTitle);
    01: Result:= FormMain.iCompare(TMachineEditorGameInfo(gItem1).eYear, TMachineEditorGameInfo(gItem2).eYear);
    02: Result:= FormMain.iCompare(TMachineEditorGameInfo(gItem1).eManufacturer, TMachineEditorGameInfo(gItem2).eManufacturer);
    03: Result:= FormMain.iCompare(TMachineEditorGameInfo(gItem1).eName, TMachineEditorGameInfo(gItem2).eName);
    04: Result:= FormMain.iCompare(TMachineEditorGameInfo(gItem1).eClone, TMachineEditorGameInfo(gItem2).eClone);
    05: Result:= FormMain.iCompare(TMachineEditorGameInfo(gItem1).eDriverName, TMachineEditorGameInfo(gItem2).eDriverName);
    06: Result:= AnsiCompareText(aSaveState[TMachineEditorGameInfo(gItem1).eSaveState], aSaveState[TMachineEditorGameInfo(gItem2).eSaveState]);
  end;
end;

procedure TFormArcadeMAMEMachinesCustomize.MachinesListEditorItemSelectionChanged(
  Sender: TCustomEasyListview; Item: TEasyItem);
begin
  //if (Sender.Visible) and (MachinesListEditor.Selection.Count = 1) and
  //   (Item.Selected) then
  //   begin
  //     if SelectedMachineItem <> Item then
  //        SelectedMachineItem:= Item;
  //     ELV_SetSelectRibbon(TMachineEditorGameInfo(Item).eGameSetStatus, MachinesListEditor);
  //     UpdateStatusBarMachine;
  //     // SetSelectedMachineList; // thiz cannotz beez heerez!
  //   end;
end;

procedure TFormArcadeMAMEMachinesCustomize.MachinesListEditorKeyAction(
  Sender: TCustomEasyListview; var CharCode: Word; var Shift: TShiftState;
  var DoDefault: Boolean);
begin
  //if CharCode = VK_RETURN then
  //   begin
  //     if (Sender.Visible) and (MachinesListEditor.Selection.Count = 1) and
  //        (SelectedMachineItem <> nil) then
  //        begin
  //          SetSelectedMachineList;
  //        end;
  //   end;
end;

procedure TFormArcadeMAMEMachinesCustomize.FilterShowParentSetsOnlyClick(
  Sender: TObject);
var
  Item: TEasyItem;
begin
  if not FormMain.CheckTotal(MachinesListEditor) then
     Exit;

  FormArcadeMAMEMachinesCustomize.Tag:= 5; // to avoid items being unchecked when set item.visible... EasyListView bug ??????! :_((
  MachinesListEditor.BeginUpdate;
  Item:= MachinesListEditor.Groups.FirstItem;
  repeat
    case FilterShowParentSetsOnly.Checked of
      True : Item.Visible:= not FormMain.GameIsClone(TMachineEditorGameInfo(Item).eClone);
      False: Item.Visible:= True;
    end;
    Item:= MachinesListEditor.Groups.NextItem(Item);
  until Item = nil;
  MachinesListEditor.EndUpdate(False);
  MachinesListEditor.SetFocus;
  FormArcadeMAMEMachinesCustomize.Tag:= 0;
  if FormMain.CheckSelected(MachinesListEditor) then
     MachinesListEditor.Selection.First.MakeVisible(emvMiddle) //(emvAuto);
end;

procedure TFormArcadeMAMEMachinesCustomize.PopupMachinesMeasureMenuItem(
  Sender: TObject; AMenuItem: TMenuItem; ACanvas: TCanvas; var Width,
  Height: Integer; ABarVisible: Boolean; var DefaultMeasure: Boolean);
begin
  FormMain.SetPopupMenuMeasureItem(AMenuItem, ACanvas, Width, Height);
end;

procedure TFormArcadeMAMEMachinesCustomize.PopupMachinesPopup(
  Sender: TObject);
begin
  PopupCheckMultipleSelected.Enabled:= MachinesListEditor.Selection.Count > 1;
  PopupUncheckMultipleSelected.Enabled:= PopupCheckMultipleSelected.Enabled;
end;

procedure TFormArcadeMAMEMachinesCustomize.PopupCheckMultipleSelectedClick(
  Sender: TObject);
var
 sItem: TEasyItem;
begin
  if not FormMain.CheckTotal(MachinesListEditor) then
     Exit;
  if MachinesListEditor.Selection.Count < 2 then
     Exit;

  MachinesListEditor.BeginUpdate;
  sItem:= MachinesListEditor.Selection.First;
  repeat
    sItem.Checked:= Boolean(TMenuItem(Sender).Tag); // 0 -> uncheck popup menu; 1 -> check popup menu
    sItem:= MachinesListEditor.Selection.Next(sItem);
  until sItem = nil;
  MachinesListEditor.EndUpdate;
  MachinesListEditor.SetFocus;
end;

end.
