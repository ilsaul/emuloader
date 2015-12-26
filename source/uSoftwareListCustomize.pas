unit uSoftwareListCustomize;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  IniFiles, uCommon, MPCommonObjects, MPCommonUtilities, EasyListview,
  AdvOfficeButtons, StdCtrls, Buttons, PanelEx, ShadowLabel;

type
  TSoftwareInfo = class(TEasyItemStored)
  private
    fImageIndex: Integer;
    fTitle: WideString;
    fName: String;
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
    property eCheckedFromIni: Boolean read fCheckedFromIni write fCheckedFromIni;
    //property eCheckedCustom: Boolean read fCheckedCustom write fCheckedCustom;
  end;

type
  TFormSoftwareListCustomize = class(TForm)
    SoftwareLists: TEasyListview;
    PanelMessages: TPanelEx;
    ButtonYes: TBitBtn;
    ButtonNo: TBitBtn;
    ButtonResetToCurrent: TBitBtn;
    CheckAll: TAdvOfficeCheckBox;
    LabelTotalSoftwareList: TShadowLabel;
    ShadowLabel1: TShadowLabel;
    FilterShowUncheckedOnly: TAdvOfficeCheckBox;
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
  private
    { Private declarations }
    HashFolder: String;
    SoftListsAll: TStringList;
    procedure ELV_LoadSoftList;
    function  GetXMLTitle(FileXML: String): WideString;
    procedure UpdateCheckedStateCheckBox;
  public
    { Public declarations }
  end;

var
  FormSoftwareListCustomize: TFormSoftwareListCustomize;

implementation

uses uMain;

{$R *.dfm}

function TSoftwareInfo.GetCaptions(Column: Integer): WideString;
begin
  case Column of
    0: Result:= eTitle;
    1: Result:= eName;
  end;
end;

function TSoftwareInfo.GetImageIndexes(Column: Integer): TCommonImageIndexInteger;
begin
  //if Column = 0 then
  //   Result:= FormMain.GetMAMEImageIndex(eImageIndex, eSoftwareName, eIconLoaded)
  //else
  //   Result:= -1;
end;

function TFormSoftwareListCustomize.GetXMLTitle(FileXML: String): WideString;
var
  Loop: Integer;
  iXML: THashedStringList;
  LineStr: String;
begin
  Result:= FileXML;
  if not FileExists(HashFolder+FileXML+'.xml') then
     Exit;

  iXML:= THashedStringList.Create;
  iXML.LoadFromFile(HashFolder+FileXML+'.xml');
  for Loop:=0 to iXML.Count-1 do
  begin
    LineStr:= TrimLeft(iXML[Loop]);
    if XML_CheckData(LineStr, '<softwarelist') then
       begin
         Result:= FormMain.DecodeHTML(XML_GetEntryValue(LineStr, 'description'));
         Break;
       end;
  end;
  FreeAndNil(iXML);
  if Result = '' then
     Result:= FileXML;
end;

procedure TFormSoftwareListCustomize.ELV_LoadSoftList;
var
  Loop: Integer;
  addItem: TEasyItem;
  Continue: Boolean;
  iName: String;
  iTitle{, wStr}: WideString;
  ExcludeFiles: THashedStringList;
begin
  FormSoftwareListCustomize.Tag:= 1;
  Continue:= FormMain.GetSoftListFilesToAudit(SoftListsAll);
  if not Continue then
     begin
       FormSoftwareListCustomize.Close;
       Exit;
     end;

  FormMain.ReadMAMEHashFolder(idMAME, FormMain.EmulatorFile[idMAME], HashFolder);
  ButtonResetToCurrent.Enabled:= FormMain.ValidateFile(FormMain.GetSoftListExcludeFile);
  if ButtonResetToCurrent.Enabled then //FormMain.ValidateFile(FormMain.GetSoftListExcludeFile) then
     begin
       ExcludeFiles:= THashedStringList.Create;
       ExcludeFiles.LoadFromFile(FormMain.GetSoftListExcludeFile);
     end;

  SoftwareLists.BeginUpdate;
  SoftwareLists.Items.ReIndexDisable:= True;
  for Loop:=0 to SoftListsAll.Count-1 do
  begin
    iName:= SoftListsAll[Loop];

    iTitle:= GetXMLTitle(iName);
    //wStr:= Utf8Decode(iTitle); // there are no softlist.xml files with Unicode title... so far! 
    //if wStr <> '' then
    //   iTitle:= wStr
    //else
    //   ShowMessageW('This software list file have a Unicode title'+#13#10+'File: '+HashFolder+iName+'.xml');

    addItem:= SoftwareLists.Items.AddCustom(TSoftwareInfo, nil);
    TSoftwareInfo(addItem).eImageIndex:= -1;
    TSoftwareInfo(addItem).eTitle:= iTitle;
    TSoftwareInfo(addItem).eName:= iName;
    if Assigned(ExcludeFiles) then
       TSoftwareInfo(addItem).eCheckedFromIni:= ExcludeFiles.IndexOf(iName) = -1 // only check if not found in "ini_files\softlist_exclude.txt"
    else
       TSoftwareInfo(addItem).eCheckedFromIni:= True;
    addItem.Checked:= TSoftwareInfo(addItem).eCheckedFromIni;
    //TSoftwareInfo(addItem).eCheckedCustom:= TSoftwareInfo(addItem).eCheckedFromIni;
    Application.ProcessMessages;
  end;

  FreeAndNil(ExcludeFiles);
  FreeAndNil(SoftListsAll);
  SoftwareLists.Sort.SortAll;
  SoftwareLists.Items.ReIndexDisable:= False;
  SoftwareLists.EndUpdate(False);
  LabelTotalSoftwareList.Tag:= SoftwareLists.Items.Count;
  //UpdateTotalCheckedLabel;
  UpdateCheckedStateCheckBox;
  FormSoftwareListCustomize.Tag:= 0;
  SoftwareLists.SetFocus;
end;

procedure TFormSoftwareListCustomize.FormShow(Sender: TObject);
begin
  SoftwareLists.Header.Columns[0].Width:= SoftwareLists.Header.Columns[0].Width-GetSystemMetrics(SM_CXVSCROLL);
  FormMain.ELV_ResetNormalColors(SoftwareLists);
  ELV_LoadSoftList;
  FormMain.HideFilterMsgBox;
end;

procedure TFormSoftwareListCustomize.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if SoftwareLists.CheckManager.Count = 0 then
     begin
       CanClose:= False;
       Exit;
     end;
  FormSoftwareListCustomize.Tag:= 1;
  FormMain.ClearListView(SoftwareLists);
end;

procedure TFormSoftwareListCustomize.UpdateCheckedStateCheckBox;
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

procedure TFormSoftwareListCustomize.CheckAllClick(Sender: TObject);
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
  if FormSoftwareListCustomize.Tag = 1 then
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

procedure TFormSoftwareListCustomize.SoftwareListsItemPaintText(
  Sender: TCustomEasyListview; Item: TEasyItem; Position: Integer;
  ACanvas: TCanvas);
begin
  if not Item.Checked then
     ACanvas.Font.Color:= clGray;
end;

procedure TFormSoftwareListCustomize.SoftwareListsItemCheckChange(
  Sender: TCustomEasyListview; Item: TEasyItem);
begin
  if FormSoftwareListCustomize.Tag = 0 then
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

procedure TFormSoftwareListCustomize.ButtonResetToCurrentClick(
  Sender: TObject);
var
  Item: TEasyItem;
begin
  SoftwareLists.BeginUpdate;
  Item:= SoftwareLists.Groups.FirstItem;
  repeat
    Item.Checked:= TSoftwareInfo(Item).eCheckedFromIni; // reset to last saved "ini_files\softlist_exclude.txt"
    // not used!!!! //TSoftwareInfo(Item).eCheckedCustom:= TSoftwareInfo(Item).eCheckedFromIni;
    Item:= SoftwareLists.Groups.NextItem(Item);
  until Item = nil;
  SoftwareLists.EndUpdate;
  UpdateCheckedStateCheckBox;
end;

procedure TFormSoftwareListCustomize.SoftwareListsColumnClick(
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

procedure TFormSoftwareListCustomize.FilterShowUncheckedOnlyClick(
  Sender: TObject);
var
  Item: TEasyItem;
begin
  if not FormMain.CheckTotal(SoftwareLists) then
     Exit;

  FormSoftwareListCustomize.Tag:= 5; // to avoid items being unchecked when set item.visible... EasyListView bug ??????! :_((
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
  FormSoftwareListCustomize.Tag:= 0;
  if FormMain.CheckSelected(SoftwareLists) then
     SoftwareLists.Selection.First.MakeVisible(emvMiddle) //(emvAuto);
end;

procedure TFormSoftwareListCustomize.SoftwareListsItemCheckChanging(
  Sender: TCustomEasyListview; Item: TEasyItem; var Allow: Boolean);
begin
  if FormSoftwareListCustomize.Tag = 5 then
     Allow:= False;
end;

procedure TFormSoftwareListCustomize.ButtonYesClick(Sender: TObject);
var
  Item: TEasyItem;
begin
  if SoftwareLists.CheckManager.Count = 0 then
     Exit;

  DeleteFile(FormMain.GetSoftListExcludeFile);


  SoftListsAll:= TStringList.Create;
  SoftListsAll.BeginUpdate;
  Item:= SoftwareLists.Groups.FirstItem;
  repeat
    if not Item.Checked then
       SoftListsAll.Add(TSoftwareInfo(Item).eName);
    Item:= SoftwareLists.Groups.NextItem(Item);
  until Item = nil;
  SoftListsAll.Sort;
  SoftListsAll.EndUpdate;
  if SoftListsAll.Count > 0 then
     SoftListsAll.SaveToFile(FormMain.GetSoftListExcludeFile);
  FreeAndNil(SoftListsAll);
end;

end.
