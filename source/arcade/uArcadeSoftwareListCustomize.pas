unit uArcadeSoftwareListCustomize;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  IniFiles, uCommon, uCommonCustom, MPCommonObjects, MPCommonUtilities, EasyListview,
  AdvOfficeButtons, StdCtrls, Buttons, PanelEx, ShadowLabel, ImgList,
  ExtCtrls, ButtonsEx;

type
  TSoftwareInfo = class(TEasyItemStored)
  private
    fImageIndex: Integer;
    fTitle: WideString;
    fName: String;
    fMediaType: Integer;
    fMediaTypeText: String;
    fCheckedFromIni: Boolean;
    //fCheckedCustom: Boolean;
  protected
    function GetCaptions(Column: Integer): WideString; override;
    function GetImageIndexes(Column: Integer): TCommonImageIndexInteger; override;
    //function GetStateImageIndexes(Column: Integer): TCommonImageIndexInteger; override;
  public
    property eImageIndex: Integer read fImageIndex write fImageIndex;
    property eTitle: WideString read fTitle write fTitle;
    property eName: String read fName write fName;
    property eMediaType: Integer read fMediaType write fMediaType;
    property eMediaTypeText: String read fMediaTypeText write fMediaTypeText;
    property eCheckedFromIni: Boolean read fCheckedFromIni write fCheckedFromIni;
    //property eCheckedCustom: Boolean read fCheckedCustom write fCheckedCustom;
  end;

type
  TFormArcadeSoftwareListCustomize = class(TForm)
    PanelBottom: TPanelEx;
    ButtonYes: TBitBtnEx;
    ButtonNo: TBitBtnEx;
    ButtonResetToCurrent: TBitBtnEx;
    CheckAll: TAdvOfficeCheckBoxEx;
    LabelTotalSoftwareList: TShadowLabel;
    FilterShowUncheckedOnly: TAdvOfficeCheckBoxEx;
    IL_MediaType: TImageList;
    TopBar: TPanelEx;
    SystemIcon: TImage;
    LabelSystemTitle: TShadowLabel;
    EmulatorIcon: TImage;
    LabelEmulatorVersion: TShadowLabel;
    SoftwareLists: TEasyListview;
    procedure FormShow(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure CheckAllClick(Sender: TObject);
    procedure SoftwareListsItemPaintText(Sender: TCustomEasyListview;
      Item: TEasyItem; Position: Integer; ACanvas: TCanvas);
    procedure SoftwareListsItemCheckChange(Sender: TCustomEasyListview;
      Item: TEasyItem);
    procedure ButtonResetToCurrentClick(Sender: TObject);
    procedure SoftwareListsColumnClick(Sender: TCustomEasyListview;
      Button: TCommonMouseButton; ShiftState: TShiftState;
      const Column: TEasyColumn);
    procedure FilterShowUncheckedOnlyClick(Sender: TObject);
    procedure SoftwareListsItemCheckChanging(Sender: TCustomEasyListview;
      Item: TEasyItem; var Allow: Boolean);
    procedure ButtonYesClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    procedure Resize4K;
    procedure ResizeForm;
    procedure GetMAME_SoftListFiles;
    function  GetSoftListFileTitle(const FileXML: String; out MediaTypeIndex: Integer): WideString;
    procedure UpdateCheckedStateCheckBox;
  public
    { Public declarations }
  end;

var
  FormArcadeSoftwareListCustomize: TFormArcadeSoftwareListCustomize;

implementation

uses uMain, uStatus;

{$R *.dfm}

function TSoftwareInfo.GetCaptions(Column: Integer): WideString;
begin
  case Column of
    0: Result:= eTitle;
    1: Result:= eName;
    2: Result:= eMediaTypeText;
  end;
end;

function TSoftwareInfo.GetImageIndexes(Column: Integer): TCommonImageIndexInteger;
begin
  if Column = 0 then
    Result:= eImageIndex
  else
     Result:= -1;
end;

procedure TFormArcadeSoftwareListCustomize.Resize4K;
begin
  if not Is4KMode then
     Exit;

  with FormArcadeSoftwareListCustomize do
  begin
    ClientWidth:=  2184;
    ClientHeight:= 1211;
    Font.Size:= 16;

    FormMain.Set4KEmuGameTopPanel(TopBar, SystemIcon, EmulatorIcon, LabelSystemTitle, 1380, LabelEmulatorVersion, 1960);

    TopBar.Height:= 150;

    FormMain.Set4KImageIconSpecs(SystemIcon, 128);
    FormMain.Set4KImageIconSpecs(EmulatorIcon, 48, 143, 84);
    FormMain.Set4KImageListSpecs(IL_MediaType, 32);

    FormMain.Set4KLabelSpecs(LabelEmulatorVersion,  199, 84,   -1, -1, 14);
    FormMain.Set4KLabelSpecs(LabelSystemTitle, 144,  4, 1650, 59, 18);

    FormMain.Set4KCheckBoxSpecs(CheckAll, 10, 153, 140, 36, 16);
    FormMain.Set4KLabelSpecs(LabelTotalSoftwareList, -1, 160, -1, -1, 16);
    LabelTotalSoftwareList.Left:= ClientWidth-LabelTotalSoftwareList.Width-10;

    PanelBottom.Height:= 71;

    FormMain.Set4KButtonSpecs(ButtonResetToCurrent, 10, 16, 168, 45, 16);
    FormMain.Set4KCheckBoxSpecs(FilterShowUncheckedOnly, ButtonResetToCurrent.Left+ButtonResetToCurrent.Width+10, 20, 250, 36, 16);

    FormMain.Set4KButtonsOkCancelPanel(PanelBottom, ButtonYes, ButtonNo, False);

    FormMain.Set4KListViewSpecs(SoftwareLists, 10, CheckAll.Top+40, 2164, 937, 16);
    FormMain.Set4KListViewCheckBoxHDSpecs(SoftwareLists);
    SoftwareLists.CellSizes.Report.Height:= 37;

    FormMain.Set4KListViewColumnSizeSpecs(SoftwareLists, 0, 1600);
    FormMain.Set4KListViewColumnSizeSpecs(SoftwareLists, 1, 378);
    FormMain.Set4KListViewColumnSizeSpecs(SoftwareLists, 2, 185);

    SoftwareLists.ImagesSmall:= FormMain.IL_StandardIconsLarge;
    SoftwareLists.PaintInfoColumn.CaptionIndent:= 4; // reset to default value
  end;
end;

procedure TFormArcadeSoftwareListCustomize.ResizeForm;
begin
  if Is4KMode then
     Exit;
  if Screen.Width >= 1280 then
     Exit;

  FormArcadeSoftwareListCustomize.Width:= 1000;
  LabelTotalSoftwareList.Left:= LabelTotalSoftwareList.Left-200;
  ButtonYes.Left:= ButtonYes.Left-200;
  ButtonNo.Left:= ButtonNo.Left-200;

  SoftwareLists.Header.Columns[0].Width:= 672;
  SoftwareLists.Header.Columns[1].Width:= 165;
  SoftwareLists.Header.Columns[2].Width:= 125;
  SoftwareLists.Width:= SoftwareLists.Width-200;
  //FrameSoftwareList.Width:= FrameSoftwareList.Width-200;
end;

function TFormArcadeSoftwareListCustomize.GetSoftListFileTitle(const FileXML: String; out MediaTypeIndex: Integer): WideString;
var
  iXML: THashedStringList;
  Loop: Integer;
  FileLine, PartName: String;
  FoundTitle, FoundPartName: Boolean;
begin
  Result:= FileXML;
  if not FileExists(FileXML) then
     Exit;

  FoundTitle:= False;
  FoundPartName:= False;
  MediaTypeIndex:= -1;

  FileLine:= LowerCase(FileXML);
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

  iXML:= THashedStringList.Create;
  iXML.LoadFromFile(FileXML);

  for Loop:=0 to iXML.Count-1 do
  begin
    FileLine:= iXML[Loop];
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
  FreeAndNil(iXML);
end;

procedure TFormArcadeSoftwareListCustomize.GetMAME_SoftListFiles;
var
  addItem: TEasyItem;
  iFiles, ExcludeFiles: THashedStringList;
  Loop, iMediaTypeID: Integer;
  iTitle: WideString;
  iFolder: String;
begin
  FormMain.ReadMAMEHashFolder(idMAME, FormMain.EmulatorFile[idMAME], iFolder);
  if iFolder = '' then
     Exit;

  FormStatus.MessageStr('Searching MAME software lists.');
  iFiles:= THashedStringList.Create;
  GetFilesList(iFolder, '.xml', '*.xml', iFiles, False, True, True);
  if iFiles.Count > 0 then
  begin
    FormStatus.MessageStr('Populating not assigned software lists.');
    FormMain.ClearListView(SoftwareLists);

    SoftwareLists.BeginUpdate;
    SoftwareLists.Items.ReIndexDisable:= True;

    ButtonResetToCurrent.Enabled:= FormMain.ValidateFile(FormMain.GetSoftListExcludeFile(idMAME));
    if ButtonResetToCurrent.Enabled then //FormMain.ValidateFile(FormMain.GetSoftListExcludeFile) then
       begin
         ExcludeFiles:= THashedStringList.Create;
         ExcludeFiles.LoadFromFile(FormMain.GetSoftListExcludeFile(idMAME));
       end;

    for Loop:=0 to iFiles.Count-1 do
    begin
      iFolder:= ExtractFileName(ChangeFileExt(iFiles[Loop], ''));
      iTitle:= GetSoftListFileTitle(iFiles[Loop], iMediaTypeID);
      if SameText(iFolder, 'vgmplay') then
         iMediaTypeID:= 6;
      if iMediaTypeID <> -1 then
         begin
           // do not add files if there are not game entries in the .xml file ("vreader.xml" is one of them!!)
           addItem:= SoftwareLists.Items.AddCustom(TSoftwareInfo, nil);
           TSoftwareInfo(addItem).eImageIndex:= iMediaTypeID;
           TSoftwareInfo(addItem).eTitle:= iTitle;
           TSoftwareInfo(addItem).eName:= iFolder;
           TSoftwareInfo(addItem).eMediaType:= iMediaTypeID;
           TSoftwareInfo(addItem).eMediaTypeText:= MediaTypeCustom[iMediaTypeID, 0]; //GetMediaTypeTitle(SoftListFiles_MediaType[Loop]);

           if Assigned(ExcludeFiles) then
              TSoftwareInfo(addItem).eCheckedFromIni:= ExcludeFiles.IndexOf(iFolder) = -1 // only check if not found in "\arcade\mame_softlist_exclude.txt"
           else
              TSoftwareInfo(addItem).eCheckedFromIni:= True;
           addItem.Checked:= TSoftwareInfo(addItem).eCheckedFromIni;
           //TSoftwareInfo(addItem).eCheckedCustom:= TSoftwareInfo(addItem).eCheckedFromIni;


           //SoftListFiles_Name.Add(iFolder);
           //SoftListFiles_Title[Loop]:= iTitle; //GetSoftListFileTitle(iFiles[Loop], iMediaTypeID);
           //SoftListFiles_MediaType[Loop]:= iMediaTypeID;
         end;
    end;

    SoftwareLists.Sort.SortAll;
    SoftwareLists.Header.Columns[0].Width:= SoftwareLists.Header.Columns[0].Width-GetSystemMetrics(SM_CXVSCROLL);

    SoftwareLists.Items.ReIndexDisable:= False;
    SoftwareLists.EndUpdate;
    LabelTotalSoftwareList.Tag:= SoftwareLists.Items.Count;

    FreeAndNil(ExcludeFiles);
    UpdateCheckedStateCheckBox;
  end;

  FormArcadeSoftwareListCustomize.Tag:= 0;
  SoftwareLists.SetFocus;

  FreeAndNil(iFiles);
end;

procedure TFormArcadeSoftwareListCustomize.FormShow(Sender: TObject);
begin
  Resize4K;
  ResizeForm;
  FormMain.ELV_ResetNormalColors(SoftwareLists);
  FormMain.LoadMediaTypeIcons2(IL_MediaType, True);
  FormMain.LoadSystemIcon(-1, SystemIcon, False);
  FormMain.AddDefaultIcons('play_standard', '', nil, -1, EmulatorIcon);
  FormMain.ShowIconErrorMessage;

  FormMain.SetEasyListViewHeaderColors(SoftwareLists, True, False, Is4KMode);

  LabelEmulatorVersion.Caption:= FormMain.EmulatorVersion[idMAME]+#13#10+FormMain.EmulatorFile[idMAME];

  if IsNightMode then
     begin
       SetFormColors(FormArcadeSoftwareListCustomize, TopBar, PanelBottom, LabelSystemTitle, LabelEmulatorVersion, nil, -1, IsNightMode);
       SetLabelColors(LabelTotalSoftwareList, clCream, item_caption_active_shadow_color[1]);

       FormMain.SetEasyListViewColors(SoftwareLists, menu_background_color[1], clWhite, -1, clrBorderGroupBoxGrayBk);

       SetCheckBoxColors(CheckAll,                item_caption_active_color[1], item_caption_active_shadow_color[1]);
       SetCheckBoxColors(FilterShowUncheckedOnly, item_caption_active_color[1], item_caption_active_shadow_color[1]);

       FormMain.SetCheckBoxExCustomIcon(CheckAll);
       FormMain.SetCheckBoxExCustomIcon(FilterShowUncheckedOnly);

       FormMain.SetEasyListViewHeaderColors(SoftwareLists, True, False, Is4KMode);
       FormMain.ELV_SetRibbonNightColors(0, SoftwareLists, True);
       FormMain.ELV_SetCheckRadioCustomIcon(SoftwareLists);
       FormMain.SetWin10DarkScrollBar(SoftwareLists);

       //SoftwareLists.Align:= alNone;
       //SoftwareLists.Height:= SoftwareLists.Height-2;
       //SoftwareLists.Top:= SoftwareLists.Top+1;

       //SetPanelBorderColors(FrameSoftwareList, clrBorderGroupBoxGrayBk, clrInnerBorderGroupBoxGrayBk);
       FormMain.SetButtonExColors(ButtonYes);
       FormMain.SetButtonExColors(ButtonNo);
       FormMain.SetButtonExColors(ButtonResetToCurrent);
     end;

  GetMAME_SoftListFiles; // first, read all files from mamedir\hash\ folder and create the NotAssignedSoftListFiles() list
  FormMain.HideFilterMsgBox;
end;

procedure TFormArcadeSoftwareListCustomize.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if SoftwareLists.CheckManager.Count = 0 then
     begin
       CanClose:= False;
       Exit;
     end;
  FormArcadeSoftwareListCustomize.Tag:= 1;
  FormMain.ClearListView(SoftwareLists);
end;

procedure TFormArcadeSoftwareListCustomize.UpdateCheckedStateCheckBox;
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
  iCheckCount:= SoftwareLists.CheckManager.Count;
  if iCheckCount = 0 then
     UpdateCheckBox(cbUnchecked)
     //CheckAll.State:= cbUnchecked
  else
  if iCheckCount = LabelTotalSoftwareList.Tag then
     UpdateCheckBox(cbChecked)
     //CheckAll.State:= cbChecked
  else
  if iCheckCount < LabelTotalSoftwareList.Tag then
     UpdateCheckBox(cbGrayed);
     //CheckAll.State:= cbGrayed;

  case CheckAll.State of
    cbUnchecked, cbGrayed: UpdateCheckBoxLabel('Check All');
    cbChecked: UpdateCheckBoxLabel('Uncheck All');
    //cbGrayed: CheckAll.Caption:= 'Check All';
  end;
  LabelTotalSoftwareList.Caption:= 'Checked '+IntToStr(iCheckCount)+' of '+IntToStr(SoftwareLists.Items.Count);

end;

procedure TFormArcadeSoftwareListCustomize.CheckAllClick(Sender: TObject);
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
  if FormArcadeSoftwareListCustomize.Tag = 1 then
     Exit;
  if not FormMain.CheckTotal(SoftwareLists) then
     Exit;

  SoftwareLists.BeginUpdate;
  Item:= SoftwareLists.Groups.FirstItem;
  repeat
    case CheckAll.State of
      cbUnchecked: IsChecked:= False;
      cbChecked: IsChecked:= True;
      //cbGrayed: IsChecked:= TSoftwareInfo(Item).eCheckedCustom;
    end;
    Item.Checked:= IsChecked;
    Item:= SoftwareLists.Groups.NextItem(Item);
  until Item = nil;
  SoftwareLists.EndUpdate;
  SoftwareLists.SetFocus;
end;

procedure TFormArcadeSoftwareListCustomize.SoftwareListsItemPaintText(
  Sender: TCustomEasyListview; Item: TEasyItem; Position: Integer;
  ACanvas: TCanvas);
begin
  if not Item.Checked then
     ACanvas.Font.Color:= clGray;
  Item.Ghosted:= (not Item.Checked) and (not FilterShowUncheckedOnly.Checked);
end;

procedure TFormArcadeSoftwareListCustomize.SoftwareListsItemCheckChange(
  Sender: TCustomEasyListview; Item: TEasyItem);
begin
  if FormArcadeSoftwareListCustomize.Tag = 0 then
     begin
     //TSoftwareInfo(Item).eCheckedCustom:= Item.Checked;
     //case Item.Checked of
     //  True : Item.State:= Item.State-[esosGhosted];
     //  False: Item.State:= Item.State+[esosGhosted];
     //end;
     //UpdateTotalCheckedLabel;
     UpdateCheckedStateCheckBox;
     end;
end;

procedure TFormArcadeSoftwareListCustomize.ButtonResetToCurrentClick(
  Sender: TObject);
var
  Item: TEasyItem;
begin
  SoftwareLists.BeginUpdate;
  Item:= SoftwareLists.Groups.FirstItem;
  repeat
    Item.Checked:= TSoftwareInfo(Item).eCheckedFromIni; // reset to last saved "\arcade\mame_softlist_exclude.txt"
    // not used!!!! //TSoftwareInfo(Item).eCheckedCustom:= TSoftwareInfo(Item).eCheckedFromIni;
    Item:= SoftwareLists.Groups.NextItem(Item);
  until Item = nil;
  SoftwareLists.EndUpdate;
  UpdateCheckedStateCheckBox;
end;

procedure TFormArcadeSoftwareListCustomize.SoftwareListsColumnClick(
  Sender: TCustomEasyListview; Button: TCommonMouseButton;
  ShiftState: TShiftState; const Column: TEasyColumn);
begin
  if Button = cmbLeft then
     begin
       SoftwareLists.BeginUpdate;
       SoftwareLists.Sort.SortAll;
       SoftwareLists.EndUpdate(False);
     end;
end;

procedure TFormArcadeSoftwareListCustomize.FilterShowUncheckedOnlyClick(
  Sender: TObject);
var
  Item: TEasyItem;
begin
  if not FormMain.CheckTotal(SoftwareLists) then
     Exit;

  FormArcadeSoftwareListCustomize.Tag:= 5; // to avoid items being unchecked when set item.visible... EasyListView bug ??????! :_((
  SoftwareLists.BeginUpdate;
  Item:= SoftwareLists.Groups.FirstItem;
  repeat
    case FilterShowUncheckedOnly.Checked of
      True : Item.Visible:= not Item.Checked;
      False: Item.Visible:= True;
    end;
    Item:= SoftwareLists.Groups.NextItem(Item);
  until Item = nil;
  SoftwareLists.EndUpdate(False);
  SoftwareLists.SetFocus;
  FormArcadeSoftwareListCustomize.Tag:= 0;
  if FormMain.CheckSelected(SoftwareLists) then
     SoftwareLists.Selection.First.MakeVisible(emvMiddle) //(emvAuto);
end;

procedure TFormArcadeSoftwareListCustomize.SoftwareListsItemCheckChanging(
  Sender: TCustomEasyListview; Item: TEasyItem; var Allow: Boolean);
begin
  if FormArcadeSoftwareListCustomize.Tag = 5 then
     Allow:= False;
end;

procedure TFormArcadeSoftwareListCustomize.ButtonYesClick(Sender: TObject);
var
  Item: TEasyItem;
  iListXML: TStringList;
begin
  if SoftwareLists.CheckManager.Count = 0 then
     Exit;

  DeleteFile(FormMain.GetSoftListExcludeFile(idMAME));

  iListXML:= TStringList.Create;
  iListXML.BeginUpdate;
  Item:= SoftwareLists.Groups.FirstItem;
  repeat
    if not Item.Checked then
       iListXML.Add(TSoftwareInfo(Item).eName);
    Item:= SoftwareLists.Groups.NextItem(Item);
  until Item = nil;
  iListXML.Sort;
  iListXML.EndUpdate;
  if iListXML.Count > 0 then
     iListXML.SaveToFile(FormMain.GetSoftListExcludeFile(idMAME));
  FreeAndNil(iListXML);
end;

procedure TFormArcadeSoftwareListCustomize.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #27 then
     ButtonNo.Click;
end;

end.
