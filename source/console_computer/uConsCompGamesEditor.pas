unit uConsCompGamesEditor;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  uCommon, uCommonCustom, Dialogs, StdCtrls, PanelEx, ExtCtrls, ComCtrls, ToolWin,
  IniFiles, ImgList, SplitterEx, MPCommonObjects, MPCommonUtilities, EasyListview, ShadowLabel,
  Buttons, AdvOfficeButtons, Menus, BarMenus, EditEx, ButtonsEx,
  TntStdCtrls, TntEditEx;

type
  TFormConsCompGamesEditor = class(TForm)
    PanelSystems: TPanelEx;
    Systems: TEasyListview;
    Splitter: TSplitterEx;
    PanelCustomGames: TPanelEx;
    CustomGamesList: TEasyListview;
    PanelEditSelected: TPanelEx;
    LabelEditSelected: TShadowLabel;
    LabelEditSelected_Year: TAdvOfficeCheckBoxEx;
    EditSelected_Year: TEditEx;
    LabelEditSelected_Manufacturer: TAdvOfficeCheckBoxEx;
    EditSelected_Manufacturer: TEditEx;
    LabelEditSelected_NumberPlayers: TAdvOfficeCheckBoxEx;
    EditSelected_NumberPlayers: TEditEx;
    ButtonMultiSelectedInfo_Confirm: TBitBtnEx;
    MultiSelectedInfo_Cancel: TBitBtnEx;
    PopupGamesList: TBcBarPopupMenu;
    PopupMachinesListSidePanelResetColumnsWidth: TMenuItem;
    PopupEditTitle: TMenuItem;
    PopupEditYear: TMenuItem;
    PopupEditManufacturer: TMenuItem;
    PopupEditNumberofPlayers: TMenuItem;
    PopupEditAll: TMenuItem;
    N1: TMenuItem;
    PopupResetSystemsPanelSize: TMenuItem;
    LabelCustomGamesListTotal: TShadowLabel;
    PanelToolBarGamesEditor: TPanelEx;
    PanelSearchGames: TPanelEx;
    LabelHotkeyText: TShadowLabel;
    LabelHotkeyKeys: TShadowLabel;
    ButtonApplyChanges: TBitBtnEx;
    ButtonAbortChanges: TBitBtnEx;
    SystemsHideScrollBarArea: TAdvOfficeCheckBoxEx;
    LabelToolBarFilterTitle: TShadowLabel;
    FilterGameTitle: TTntEditEx;
    ButtonFilterTitleApply: TSpeedButtonEx;
    ButtonFilterTitleReset: TSpeedButtonEx;
    ShowBiggerGamesListFont: TAdvOfficeCheckBoxEx;
    LabelEditSelected_Total: TShadowLabel;
    LabelEditSelectedDrag: TShadowLabel;
    IL_Systems: TImageList;
    procedure FormShow(Sender: TObject);
    procedure SystemsItemSelectionChanged(Sender: TCustomEasyListview;
      Item: TEasyItem);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    function CustomGamesListItemCompare(Sender: TCustomEasyListview;
      Column: TEasyColumn; Group: TEasyGroup; Item1, Item2: TEasyItem;
      var DoDefault: Boolean): Integer;
    procedure CustomGamesListColumnClick(Sender: TCustomEasyListview;
      Button: TCommonMouseButton; ShiftState: TShiftState;
      const Column: TEasyColumn);
    procedure CustomGamesListColumnSizeChanging(
      Sender: TCustomEasyListview; Column: TEasyColumn; Width,
      NewWidth: Integer; var Allow: Boolean);
    procedure CustomGamesListIncrementalSearch(Item: TEasyCollectionItem;
      const SearchBuffer: WideString; var Handled: Boolean;
      var CompareResult: Integer);
    procedure CustomGamesListKeyAction(Sender: TCustomEasyListview;
      var CharCode: Word; var Shift: TShiftState; var DoDefault: Boolean);
    procedure CustomGamesListItemEdited(Sender: TCustomEasyListview;
      Item: TEasyItem; var NewValue: Variant; var Accept: Boolean);
    procedure CustomGamesListItemEditEnd(Sender: TCustomEasyListview;
      Item: TEasyItem);
    procedure LabelEditSelected_ManufacturerClick(Sender: TObject);
    procedure LabelEditSelected_YearClick(Sender: TObject);
    procedure LabelEditSelected_NumberPlayersClick(Sender: TObject);
    procedure MultiSelectedInfo_CancelClick(Sender: TObject);
    procedure ButtonMultiSelectedInfo_ConfirmClick(Sender: TObject);
    procedure EditSelected_ManufacturerKeyPress(Sender: TObject;
      var Key: Char);
    procedure PopupGamesListMeasureMenuItem(Sender: TObject;
      AMenuItem: TMenuItem; ACanvas: TCanvas; var Width, Height: Integer;
      ABarVisible: Boolean; var DefaultMeasure: Boolean);
    procedure PopupResetSystemsPanelSizeClick(Sender: TObject);
    procedure PopupEditTitleClick(Sender: TObject);
    procedure FilterGameTitleKeyPress(Sender: TObject; var Key: Char);
    procedure ButtonFilterTitleApplyClick(Sender: TObject);
    procedure ButtonFilterTitleResetClick(Sender: TObject);
    procedure SystemsHideScrollBarAreaClick(Sender: TObject);
    procedure ButtonApplyChangesClick(Sender: TObject);
    procedure ButtonAbortChangesClick(Sender: TObject);
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
    procedure SplitterMoved(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure CustomGamesListItemPaintText(Sender: TCustomEasyListview;
      Item: TEasyItem; Position: Integer; ACanvas: TCanvas);
    procedure CustomGamesListHintCustomInfo(Sender: TCustomEasyListview;
      TargetObj: TEasyCollectionItem; Info: TEasyHintInfo);
    procedure ShowBiggerGamesListFontClick(Sender: TObject);
    procedure PanelEditSelectedMouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
  private
    { Private declarations }
    extraDataFile: array[1..MaxConsoleComputerSystems] of THashedStringList;
    procedure UpdateSystemsDimensions;
    procedure UpdateTotalGamesLabel(IsSearchBar: Boolean = False);
    procedure LoadGamesInList;
    procedure UpdateExtraInfoFiles;
    procedure ApplySystemFilter;
    function  GetHorizontalBarPos: Integer;
    procedure RestoreHorizontalBarPos(ScrollBarPosition: Integer);
    procedure ApplyCustomFilterSearchBar;
    procedure EditSelectedFields(ColumnIndex: Integer);
    procedure SetEditBkColor(EditExSource: TEditEx; IsEnabled: Boolean);
    procedure UpdateMultiSelectedInfo;
    procedure ELV_AdjustCellHeight(ELV_Holder: TEasyListView);
    procedure ReadSettings;
    procedure WriteSettings;
    procedure Resize4K;
  public
    { Public declarations }
    mResult: Integer;
  end;

  TCustomGameInfo = class(TEasyItemStored)
  private
    //fSortIndex: Integer;
    fImageIndex: Integer;
    fROMIdentification: Integer;
    fCustomSystemID: ShortInt;
    fCustomMediaType: ShortInt;
    fIsUnicode: Boolean;

    fIconLoaded: Boolean;

    fTitle: WideString;
    fTitleShort: WideString;
    fYear: String;
    fManufacturer: WideString;

    fName: WideString;

    fNumberPlayers: String;

    fIsFavorite: Boolean;
    fGameSize: Int64;
    fGameSizeText: String;
  protected
    function GetCaptions(Column: Integer): WideString; override;
    function GetImageIndexes(Column: Integer): TCommonImageIndexInteger; override;
    function GetStateImageIndexes(Column: Integer): TCommonImageIndexInteger; override;
    //function GetImageOverlayIndexes(Column: Integer): TCommonImageIndexInteger; override; // don't know how to use this!!! October 21, 2016

  public
    property eImageIndex: Integer read fImageIndex write fImageIndex;
    property eROMIdentification: Integer read fROMIdentification write fROMIdentification;
    property eCustomSystemID: ShortInt read fCustomSystemID write fCustomSystemID;
    property eCustomMediaType: ShortInt read fCustomMediaType write fCustomMediaType;
    property eIsUnicode: Boolean read fIsUnicode write fIsUnicode;

    property eIconLoaded: Boolean read fIconLoaded write fIconLoaded;

    property eTitle: WideString read fTitle write fTitle;
    property eTitleShort: WideString read fTitleShort write fTitleShort;
    property eYear: String read fYear write fYear;
    property eManufacturer: WideString read fManufacturer write fManufacturer;

    property eName: WideString read fName write fName;

    property eNumberPlayers: String read fNumberPlayers write fNumberPlayers;

    property eIsFavorite: Boolean read fIsFavorite write fIsFavorite;
    property eGameSize: Int64 read fGameSize write fGameSize;
    property eGameSizeText: String read fGameSizeText write fGameSizeText;
  end;

var
  FormConsCompGamesEditor: TFormConsCompGamesEditor;

implementation

uses uMain, uStatus;

{$R *.dfm}

function TCustomGameInfo.GetCaptions(Column: Integer): WideString;
begin
  case Column of
    00:
      begin
        if eTitleShort = '' then
           Result:= eTitle
        else
           Result:= eTitleShort;
      end;
    //00: Result:= FormMain.GetGameTitleText(eTitle, eClone);
    01: Result:= eYear;
    02: Result:= eManufacturer;
    03: Result:= eNumberPlayers;
    04: Result:= eGameSizeText;
    05: Result:= eName;
  end;
end;

function TCustomGameInfo.GetImageIndexes(Column: Integer): TCommonImageIndexInteger;
begin
  if Column = 0 then
     Result:= MaxGameID+eCustomSystemID
     //Result:= FormMain.GetMAMEImageIndex(eImageIndex, eSoftwareName, eIconLoaded)
  else
     Result:= -1;
end;

function TCustomGameInfo.GetStateImageIndexes(Column: Integer): TCommonImageIndexInteger;
begin
  if Column = 0 then
     begin
       if eIsFavorite then
          Result:= 3
       else
          Result:= 100; // non-existing index to show an empty space in place of the fav icon
     end
  else
     Result:= -1;
end;

procedure TFormConsCompGamesEditor.Resize4K;
begin
  if not Is4KMode then
     Exit;

  with FormConsCompGamesEditor do
  begin
    Font.Size:= 16;
    FormMain.Set4KImageListSpecs(IL_Systems, 128);

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

    ClientWidth:=  PanelSystems.Width+Splitter.Width+2022; // PanelCustomGames.Width should be 2022 (see "source\4K\designs\console_computer\uConsCompGamesEditor_4K.pas")
    ClientHeight:= (Systems.CellSizes.Icon.Height*7)+16;

    PanelToolBarGamesEditor.Height:= 75;

    FormMain.Set4KCheckBoxSpecs(ShowBiggerGamesListFont,   10, 9, 305, 36, 16);
    FormMain.Set4KCheckBoxSpecs(SystemsHideScrollBarArea, 405, 9, 250, 36, 16);

    FormMain.Set4KLabelSpecs(LabelHotkeyKeys, 10, 49, -1, -1, 14);
    FormMain.Set4KLabelSpecs(LabelHotkeyText, 11, 49, -1, -1, 14);

    FormMain.Set4KButtonSpecs(ButtonApplyChanges, 720, 15, 168, 45, 16);
    FormMain.Set4KButtonSpecs(ButtonAbortChanges, 905, 15, 168, 45, 16);
    FormMain.Set4KButtonFontNameSpecs(ButtonApplyChanges);
    FormMain.Set4KButtonFontNameSpecs(ButtonAbortChanges);

    PanelSearchGames.Width:= 373;
    FormMain.Set4KLabelSpecs(LabelToolBarFilterTitle, 8, 4, -1, -1, 16);
    FormMain.Set4KEditSpecs(FilterGameTitle, 8, 33, 280, 34, 16);
    FormMain.Set4KButtonSpecs(ButtonFilterTitleApply, FilterGameTitle.Left+FilterGameTitle.Width+4, FilterGameTitle.Top-1, 36, 37, 16);
    FormMain.Set4KButtonSpecs(ButtonFilterTitleReset, ButtonFilterTitleApply.Left+37, FilterGameTitle.Top-1, 36, 37, 16);

    LabelCustomGamesListTotal.Height:= 36;
    LabelCustomGamesListTotal.Font.Size:= 16;
    LabelCustomGamesListTotal.CaptionIndent:= 10;

    FormMain.Set4KListViewSpecs(CustomGamesList, -1, -1, -1, -1, 16);
    FormMain.Set4KListViewHeaderFontSizeSpecs(CustomGamesList);

    CustomGamesList.CellSizes.Report.Height:= 40;
    //CustomGamesList.PaintInfoColumn.CaptionIndent:= 4; // reset to default
    CustomGamesList.ImagesSmall:= FormMain.IL_StandardIconsLarge;
    FormMain.Set4KListViewColumnSizeSpecs(CustomGamesList, 0, 780-GetSystemMetrics(SM_CXVSCROLL));
    FormMain.Set4KListViewColumnSizeSpecs(CustomGamesList, 1, 90);
    FormMain.Set4KListViewColumnSizeSpecs(CustomGamesList, 2, 450);
    FormMain.Set4KListViewColumnSizeSpecs(CustomGamesList, 3, 120);
    FormMain.Set4KListViewColumnSizeSpecs(CustomGamesList, 4, 150);
    FormMain.Set4KListViewColumnSizeSpecs(CustomGamesList, 5, 432);
    
    FormMain.Set4KPanelSpecs(PanelEditSelected, -1,  -1, 927, 424);
    FormMain.Set4KLabelSpecs(LabelEditSelected, 32,  32,  -1, -1, 16);
    FormMain.Set4KLabelSpecs(LabelEditSelectedDrag, 455,  96, -1, -1, 16);

    FormMain.Set4KCheckBoxSpecs(LabelEditSelected_Manufacturer, 32, 165, 160, 36, 16);
    FormMain.Set4KEditSpecs(EditSelected_Manufacturer, 200, 165, 695, 36, 16);

    FormMain.Set4KCheckBoxSpecs(LabelEditSelected_Year, 32, 221, 65, 36, 16);
    FormMain.Set4KEditSpecs(EditSelected_Year, 200, 221, 220, 36, 16);

    FormMain.Set4KCheckBoxSpecs(LabelEditSelected_NumberPlayers, 528, 221, 140, 36, 16);
    FormMain.Set4KEditSpecs(EditSelected_NumberPlayers, 675, 221, 220, 36, 16);

    FormMain.Set4KLabelSpecs(LabelEditSelected_Total, 32, 354, -1, -1, 16);
    FormMain.Set4KButtonSpecs(ButtonMultiSelectedInfo_Confirm, 549, 347, 168, 45, 16);
    FormMain.Set4KButtonSpecs(MultiSelectedInfo_Cancel,        727, 347, 168, 45, 16);
  end;
end;

procedure TFormConsCompGamesEditor.UpdateSystemsDimensions;
var
  SysTitleBarHeight: Integer;
begin
  if Systems.Align = alClient then
     Exit;

  SysTitleBarHeight:= 0;
  Systems.Width:=  PanelSystems.Width+GetSystemMetrics(SM_CXVSCROLL);
  Systems.Height:= PanelSystems.Height-SysTitleBarHeight;
end;

procedure TFormConsCompGamesEditor.UpdateTotalGamesLabel(IsSearchBar: Boolean = False);
var
  iSystemName: String;
begin
  if IsSearchBar then
     iSystemName:= ' - Search bar results'
  else
     iSystemName:=' - '+SystemsListCustom[Systems.Tag, 0];

  if CustomGamesList.Groups.VisibleItemCount = 1 then
     LabelCustomGamesListTotal.Caption:= '  '+IntToStr(CustomGamesList.Groups.VisibleItemCount)+' game'+iSystemName
  else
     LabelCustomGamesListTotal.Caption:= '  '+IntToStr(CustomGamesList.Groups.VisibleItemCount)+' games'+iSystemName;
end;

procedure TFormConsCompGamesEditor.LoadGamesInList;
var
  Item, addItem: TEasyItem;
  Group: TEasyGroup;
  iFileName, iStrSearch: String;
  sysID: Integer;
  iStr: WideString;

  function ELV_AddGame: Boolean;
  var
    Loop: Integer;
  begin
    if Item = nil then
       Exit;
    addItem:= CustomGamesList.Items.AddCustom(TCustomGameInfo, nil);
    TCustomGameInfo(addItem).eImageIndex:= uMain.TEasyGameInfo(Item).eImageIndex;
    TCustomGameInfo(addItem).eROMIdentification:= uMain.TEasyGameInfo(Item).eROMIdentification;
    TCustomGameInfo(addItem).eCustomSystemID:= uMain.TEasyGameInfo(Item).eCustomSystemID;
    TCustomGameInfo(addItem).eCustomMediaType:= uMain.TEasyGameInfo(Item).eCustomMediaType;
    TCustomGameInfo(addItem).eIsUnicode:= uMain.TEasyGameInfo(Item).eIsUnicode;
    TCustomGameInfo(addItem).eIconLoaded:= uMain.TEasyGameInfo(Item).eIconLoaded;
    TCustomGameInfo(addItem).eTitle:= uMain.TEasyGameInfo(Item).eTitle;
    TCustomGameInfo(addItem).eTitleShort:= uMain.TEasyGameInfo(Item).eTitleShort;
    TCustomGameInfo(addItem).eYear:= uMain.TEasyGameInfo(Item).eYear;
    TCustomGameInfo(addItem).eManufacturer:= uMain.TEasyGameInfo(Item).eManufacturer;
    TCustomGameInfo(addItem).eName:= uMain.TEasyGameInfo(Item).eName;
    TCustomGameInfo(addItem).eNumberPlayers:= uMain.TEasyGameInfo(Item).eNumberPlayers;
    TCustomGameInfo(addItem).eIsFavorite:= uMain.TEasyGameInfo(Item).eIsFavorite;
    TCustomGameInfo(addItem).eGameSize:= uMain.TEasyGameInfo(Item).eGameSize;
    TCustomGameInfo(addItem).eGameSizeText:= uMain.TEasyGameInfo(Item).eGameSizeText;

    // extra data format
    // MediaType <file>Game Filename (no path)/> <title>GameTitle/> <year>Year/> <manuf>Manufacturer/> <nplayer>NumberOfPlayers/>
    if extraDataFile[TCustomGameInfo(addItem).eCustomSystemID] <> nil then
    //if Assigned(extraDataFile[TCustomGameInfo(addItem).eCustomSystemID]) then
       begin
         if (TCustomGameInfo(addItem).eYear = '') and (TCustomGameInfo(addItem).eManufacturer = '') and (TCustomGameInfo(addItem).eNumberPlayers = '') then
         begin
           // only extract info is all extra fields are empty... it means title is the same as game name
           case TCustomGameInfo(addItem).eIsUnicode of
             True : iFileName:= UTF8Encode(TCustomGameInfo(addItem).eName);
             False: iFileName:= TCustomGameInfo(addItem).eName;
           end;
           iStrSearch:= IntToStr(TCustomGameInfo(addItem).eCustomMediaType)+FormMain.MountGameInfoFieldStr('file', iFileName);

           for Loop:=0 to extraDataFile[TCustomGameInfo(addItem).eCustomSystemID].Count-1 do
           begin
             iFileName:= Copy(extraDataFile[TCustomGameInfo(addItem).eCustomSystemID].Strings[Loop], 1, Length(iStrSearch));
             if SameText(iStrSearch, iFileName) then
             //if PosEx(LowerCase(iStrSearch), LowerCase(iFileName)) <> 0 then
                begin
                  iStr:= SoftListGetEntryValue(iFileName, 'title');
                  if iStr <> '' then
                     TCustomGameInfo(addItem).eTitle:= FormMain.DecodeUnicodeStr(iStr);

                  iStr:= SoftListGetEntryValue(iFileName, 'year');
                  if iStr <> '' then
                     TCustomGameInfo(addItem).eYear:= iStr;

                  iStr:= SoftListGetEntryValue(iFileName, 'manuf');
                  if iStr <> '' then
                     TCustomGameInfo(addItem).eManufacturer:= FormMain.DecodeUnicodeStr(iStr);

                  iStr:= SoftListGetEntryValue(iFileName, 'nplayer');
                  if iStr <> '' then
                     TCustomGameInfo(addItem).eNumberPlayers:= iStr;

                  //TCustomGameInfo(addItem).eTitleShort:= uMain.TEasyGameInfo(Item).eTitleShort;
                  Break;
                end;
           end;
         end;
       end;
  end;

begin
  if not FormMain.CheckTotal(FormMain.GamesListView) then
     Exit;

  for sysID:= 1 to MaxConsoleComputerSystems do
  begin
    iFileName:= SystemsListCustom[sysID, 2];
    if FileExists(FormMain.GetGamesFolderEL(3)+iFileName) then
    begin
      extraDataFile[sysID]:= THashedStringList.Create;
      extraDataFile[sysID].LoadFromFile(FormMain.GetGamesFolderEL(3)+iFileName);
    end;
  end;

  CustomGamesList.BeginUpdate;
  CustomGamesList.Items.ReIndexDisable:= True;
  case FormMain.IsGroupedView of
    True:
      begin
        Group:= FormMain.GamesListView.Groups.FirstGroup;
        repeat
          Item:= FormMain.GamesListView.Groups.FirstInGroup(Group);
          repeat
            if uMain.TEasyGameInfo(Item).eIsCustomGame then
               ELV_AddGame;
            Item:= FormMain.GamesListView.Groups.NextInGroup(Group, Item);
            Application.ProcessMessages;
          until Item = nil;
          Group:= FormMain.GamesListView.Groups.NextGroup(Group);
        until Group = nil;
      end;
    False:
      begin
        Item:= FormMain.GamesListView.Groups.FirstItem;
        repeat
          if uMain.TEasyGameInfo(Item).eIsCustomGame then
             ELV_AddGame;
          Item:= FormMain.GamesListView.Groups.NextItem(Item);
          Application.ProcessMessages;
        until Item = nil;
      end;
  end;
  CustomGamesList.Sort.SortAll;
  CustomGamesList.Items.ReIndexDisable:= False;
  //LoadSoftwareListXML; // no longer needed... must delete this function later
  CustomGamesList.EndUpdate(False);

  for sysID:= 1 to MaxConsoleComputerSystems do
      FreeAndNil(extraDataFile[sysID]);
end;

procedure TFormConsCompGamesEditor.UpdateExtraInfoFiles;
var
  sysID: Integer;
  Item: TEasyItem;
  iTempStr, iExtraInfo, iGameInfoStr: String;
  wStr: WideString;
begin
  if not FormMain.CheckTotal(CustomGamesList) then
     Exit;

  ForceDirectories(FormMain.GetGamesFolderEL(3));
  for sysID:= 1 to MaxConsoleComputerSystems do
  begin
    //iFileName:= SystemsListCustom[sysID, 2];
    extraDataFile[sysID]:= THashedStringList.Create;
    extraDataFile[sysID].BeginUpdate;
  end;

  Item:= CustomGamesList.Groups.FirstItem;
  repeat
    iExtraInfo:= '';
    case TCustomGameInfo(Item).eIsUnicode of
      True : iGameInfoStr:= UTF8Encode(TCustomGameInfo(Item).eName);
      False: iGameInfoStr:= TCustomGameInfo(Item).eName;
    end;
    iGameInfoStr:= IntToStr(TCustomGameInfo(Item).eCustomMediaType)+FormMain.MountGameInfoFieldStr('file', iGameInfoStr);

    wStr:= ChangeFileExtW(TCustomGameInfo(Item).eName, '');
    if TCustomGameInfo(Item).eTitle <> wStr then
       begin
         iTempStr:= FormMain.EncodeUnicodeStr(TCustomGameInfo(Item).eTitle);
         if iTempStr <> '' then
            iExtraInfo:= iExtraInfo+FormMain.MountGameInfoFieldStr('title', iTempStr);
       end;

    iTempStr:= FormMain.EncodeUnicodeStr(TCustomGameInfo(Item).eYear);
    if iTempStr <> '' then
       iExtraInfo:= iExtraInfo+FormMain.MountGameInfoFieldStr('year', iTempStr);

    iTempStr:= FormMain.EncodeUnicodeStr(TCustomGameInfo(Item).eManufacturer);
    if iTempStr <> '' then
       iExtraInfo:= iExtraInfo+FormMain.MountGameInfoFieldStr('manuf', iTempStr);

    iTempStr:= FormMain.EncodeUnicodeStr(TCustomGameInfo(Item).eNumberPlayers);
    if iTempStr <> '' then
       iExtraInfo:= iExtraInfo+FormMain.MountGameInfoFieldStr('nplayer', iTempStr);

    if iExtraInfo <> '' then
       extraDataFile[TCustomGameInfo(Item).eCustomSystemID].Add(iGameInfoStr+iExtraInfo);

    Item:= CustomGamesList.Groups.NextItem(Item);

  until Item = nil;
  Application.ProcessMessages;

  for sysID:= 1 to MaxConsoleComputerSystems do
  begin
    // current files are never deleted... only updated
    extraDataFile[sysID].EndUpdate;
    if extraDataFile[sysID].Count > 0 then
       extraDataFile[sysID].SaveToFile(FormMain.GetGamesFolderEL(3)+SystemsListCustom[sysID, 2]); // save the file, overwriting the existing one
    FreeAndNil(extraDataFile[sysID]);
  end;
end;

procedure TFormConsCompGamesEditor.ApplySystemFilter;
var
  Item: TEasyItem;
begin
  if not FormMain.CheckTotal(CustomGamesList) then
     Exit;

  CustomGamesList.BeginUpdate;
  // need to set all groups visible first
  if CustomGamesList.Groups.VisibleItemCount = 0 then
     begin
       CustomGamesList.Groups.MakeAllVisible;
       CustomGamesList.Groups.Rebuild(True); // need to rebuild or list gets messed up
     end;

  Item:= CustomGamesList.Groups.FirstItem;
  repeat
    if Systems.Tag = 0 then
       Item.Visible:= True // "All Systems" selected
    else
       Item.Visible:= (TCustomGameInfo(Item).eCustomSystemID = Systems.Tag);
    Item:= CustomGamesList.Groups.NextItem(Item);
  until Item = nil;
  CustomGamesList.EndUpdate(False);
  UpdateTotalGamesLabel;
end;

function TFormConsCompGamesEditor.GetHorizontalBarPos: Integer;
begin
  Result:= 0;
  if CustomGamesList.Scrollbars.HorzBarVisible then
     Result:= CustomGamesList.Scrollbars.OffsetX;
end;

procedure TFormConsCompGamesEditor.RestoreHorizontalBarPos(ScrollBarPosition: Integer);
begin
  if ScrollbarPosition = 0 then
     Exit;
  if CustomGamesList.Scrollbars.HorzBarVisible then
     begin
       if CustomGamesList.Scrollbars.OffsetX <> ScrollBarPosition then
          CustomGamesList.Scrollbars.OffsetX:=  ScrollBarPosition;
     end;
end;

procedure TFormConsCompGamesEditor.ApplyCustomFilterSearchBar;
var
  StrSearch: String;
  KeepGame: Boolean;
  sbPos: Integer;
  Item: TEasyItem;
  //FirstItem: TEasyItem;
  //cStart: Integer;

  procedure ValidateFilters;
  begin
    KeepGame:= Pos(StrSearch, LowerCase(TCustomGameInfo(Item).eTitle)) <> 0;
    if not KeepGame then
       Exit;

    //if SystemIsConsole(TCustomGameInfo(Item).eCustomSystemID) or SystemIsHandheld(TCustomGameInfo(Item).eCustomSystemID) then
    //   KeepGame:= FormFiltersMachineType.ConsoleGames.Checked
    //else
    //if SystemIsComputer(MemGameInfo.eCustomSystemID) then
    //   KeepGame:= FormFiltersMachineType.ComputerGames.Checked;
  end;

begin
  if (FilterGameTitle.Text = '') then
     begin
       FormMain.BlinkBkEdit(FilterGameTitle);
       Exit;
     end;

  //cStart:= GetTickCount;

  FormMain.ShowFilterMsgBox('Search Bar', 'Applying filters, please wait...', True);
  //Screen.Cursor:= crHourGlass;
  StrSearch:= LowerCase(FilterGameTitle.Text);

  sbPos:= GetHorizontalBarPos;

  CustomGamesList.Selection.ClearAll;
  Item:= nil;

  CustomGamesList.BeginUpdate;
  // need to set all groups visible first!!!!!!
  CustomGamesList.Groups.MakeAllVisible;
  CustomGamesList.Groups.Rebuild(True); // need to rebuild to list gets messed up
  Item:= CustomGamesList.Groups.FirstItem;
  repeat
    //ValidateFilters;
    Item.Visible:= Pos(StrSearch, LowerCase(TCustomGameInfo(Item).eTitle)) <> 0;
    Item:= CustomGamesList.Groups.NextItem(Item);
  until Item = nil;
  CustomGamesList.Groups.Rebuild(True); // need to rebuild to list gets messed up

  CustomGamesList.EndUpdate(False);

  //ClearMemGameInfo(MemGameInfo);

  FormMain.HideFilterMsgBox;
  //if FormMain.CheckTotalVisible(CustomGamesList) then
  //   ReselectItem(True);

  UpdateTotalGamesLabel(True);
  //UpdateTotalEntriesLabel; // need to make this work since the selected system might be ignored for the search bar
  RestoreHorizontalBarPos(sbPos);
  CustomGamesList.SetFocus;
  //ShowMessage('time: '+IntToStr(GetTickCount-cStart));
end;

procedure TFormConsCompGamesEditor.EditSelectedFields(ColumnIndex: Integer);

  function CallSingleEdit: Boolean;
  begin
    Result:= True;
    FormMain.SetFormKeyPreview(FormConsCompGamesEditor);
    CustomGamesList.Tag:= ColumnIndex;
    FormMain.ELV_EnableEdit(CustomGamesList, ColumnIndex);
  end;

  function CallMultiEdit: Boolean;
  var
    Item: TEasyItem;
  begin
    
    PanelEditSelected.Left:= (PanelCustomGames.Width-PanelEditSelected.Width)  div 2;
    PanelEditSelected.Top:= (PanelCustomGames.Height-PanelEditSelected.Height) div 2;
    PanelEditSelected.Visible:= True;

    if FormMain.CheckMultipleSelected(CustomGamesList) then
       LabelEditSelected_Total.Caption:= IntToStr(CustomGamesList.Selection.Count)+' games selected'
    else
       LabelEditSelected_Total.Caption:= '1 game selected';

    LabelEditSelected_Manufacturer.Checked:= (ColumnIndex = -1);
    LabelEditSelected_Year.Checked:= (ColumnIndex = -1);
    LabelEditSelected_NumberPlayers.Checked:= (ColumnIndex = -1);
    Item:= CustomGamesList.Selection.First;
    EditSelected_Manufacturer.Text:= TCustomGameInfo(Item).eManufacturer;
    EditSelected_Year.Text:= TCustomGameInfo(Item).eYear;
    EditSelected_NumberPlayers.Text:= TCustomGameInfo(Item).eNumberPlayers;
    case ColumnIndex of
      1: LabelEditSelected_Year.Checked:= True;
      2: LabelEditSelected_Manufacturer.Checked:= True;
      3: LabelEditSelected_NumberPlayers.Checked:= True;
    end;

    if EditSelected_Manufacturer.Enabled then
       EditSelected_Manufacturer.SetFocus
    else
    if EditSelected_Year.Enabled then
       EditSelected_Year.SetFocus
    else
    if EditSelected_NumberPlayers.Enabled then
       EditSelected_NumberPlayers.SetFocus;
  end;

begin
  if not FormMain.CheckSelected(CustomGamesList) then
     Exit;

  if ColumnIndex <> -1 then
     begin
       case FormMain.CheckMultipleSelected(CustomGamesList) of
         True:
           begin
             if ColumnIndex <> 0 then
                CallMultiEdit
             else
                CallSingleEdit;
           end;
         False: CallSingleEdit;
       end;
     end
  else
     CallMultiEdit;
end;

procedure TFormConsCompGamesEditor.UpdateMultiSelectedInfo;
var
  selItem: TEasyItem;
begin
  if not PanelEditSelected.Visible then
     Exit;

  if (not LabelEditSelected_Manufacturer.Checked) and (not LabelEditSelected_Year.Checked) and (not LabelEditSelected_NumberPlayers.Checked) then
     Exit;

  selItem:= CustomGamesList.Selection.First;
  repeat
    if selItem <> nil then
    begin
      if LabelEditSelected_Manufacturer.Checked then
         TCustomGameInfo(selItem).eManufacturer:= EditSelected_Manufacturer.Text;
      if LabelEditSelected_Year.Checked then
         TCustomGameInfo(selItem).eYear:= EditSelected_Year.Text;
      if LabelEditSelected_NumberPlayers.Checked then
         TCustomGameInfo(selItem).eNumberPlayers:= EditSelected_NumberPlayers.Text;
    end;
    selItem:= CustomGamesList.Selection.Next(selItem);
  until selItem = nil;
end;

procedure TFormConsCompGamesEditor.ELV_AdjustCellHeight(ELV_Holder: TEasyListView);
var
  iHeight, NewCellHeight: Integer;
begin
  exit;
  iHeight:= ELV_Holder.Canvas.TextHeight('Ag[Á');
  NewCellHeight:= iHeight+5;

  if NewCellHeight < 28 then
     NewCellHeight:= 28;

  if (NewCellHeight <> ELV_Holder.CellSizes.Report.Height) then
     begin
       ELV_Holder.BeginUpdate;
       ELV_Holder.CellSizes.Report.Height:= NewCellHeight;
       ELV_Holder.EndUpdate(False);
     end;
end;

procedure TFormConsCompGamesEditor.ReadSettings;
var
  iIniFile: TMemIniFile;
  Loop: Integer;
  iSectionStr: String;
begin
  if not FileExists(GetMiscSettingsFile) then
     Exit;

  if Is4KMode then
     iSectionStr:= 'Games Editor 4K'
  else
     iSectionStr:= 'Games Editor';
  iIniFile:= TMemIniFile.Create(GetMiscSettingsFile);
  //                  add '4K' str to not mix settings
  FormConsCompGamesEditor.Tag:= Ord(iIniFile.ReadString (iSectionStr, 'WindowState', 'Normal') = 'Maximized');
  FormConsCompGamesEditor.Width:=   iIniFile.ReadInteger(iSectionStr, 'ScreenWidth',  FormConsCompGamesEditor.Width);
  FormConsCompGamesEditor.Height:=  iIniFile.ReadInteger(iSectionStr, 'ScreenHeight', FormConsCompGamesEditor.Height);


  PanelSystems.Width:= iIniFile.ReadInteger(iSectionStr, 'SystemsPanelWidth', PanelSystems.Width);//392);
  if iIniFile.ReadInteger(iSectionStr, 'SystemsHideScrollBarArea', 0) = 1 then
     begin
       PanelSystems.Width:= PanelSystems.Width+GetSystemMetrics(SM_CXVSCROLL); // add extra ScrollBar area before executing CheckBox code; DO NOT REMOVE THIS CODE!
       SystemsHideScrollBarArea.Checked:= True;
     end;

  CustomGamesList.BeginUpdate;
  for Loop:= 0 to CustomGamesList.Header.Columns.Count-1 do
      CustomGamesList.Header.Columns[Loop].Width:= iIniFile.ReadInteger(iSectionStr, 'GamesListColumnWidth'+IntToStr(Loop), CustomGamesList.Header.Columns[Loop].Width);

  ShowBiggerGamesListFont.Checked:= Boolean(iIniFile.ReadInteger(iSectionStr, 'ShowBiggerGamesListFont', 0));

  CustomGamesList.EndUpdate;

  FreeAndNil(iIniFile);
end;

procedure TFormConsCompGamesEditor.WriteSettings;
var
  iIniFile: TMemIniFile;
  tmpString, iSectionStr: String;
  Loop: Integer;
begin
  if CheckReadOnly(GetMiscSettingsFile) then
     Exit;

  if Is4KMode then
     iSectionStr:= 'Games Editor 4K'
  else
     iSectionStr:= 'Games Editor';

  iIniFile:= TMemIniFile.Create(GetMiscSettingsFile);

  if FormConsCompGamesEditor.WindowState = wsMaximized then
     tmpString:= 'Maximized'
  else
     tmpString:= 'Normal';

  iIniFile.EraseSection(iSectionStr);
  iIniFile.WriteString(iSectionStr, 'WindowState', tmpString);
  if FormConsCompGamesEditor.WindowState <> wsMaximized then
     begin
       iIniFile.WriteInteger(iSectionStr, 'ScreenWidth',  FormConsCompGamesEditor.Width);
       iIniFile.WriteInteger(iSectionStr, 'ScreenHeight', FormConsCompGamesEditor.Height);
     end;

  iIniFile.WriteInteger(iSectionStr, 'SystemsPanelWidth', PanelSystems.Width);
  iIniFile.WriteInteger(iSectionStr, 'SystemsHideScrollBarArea', Ord(SystemsHideScrollBarArea.Checked));

  for Loop:= 0 to CustomGamesList.Header.Columns.Count-1 do
      iIniFile.WriteInteger(iSectionStr, 'GamesListColumnWidth'+IntToStr(Loop), CustomGamesList.Header.Columns[Loop].Width);

  iIniFile.WriteInteger(iSectionStr, 'ShowBiggerGamesListFont', Ord(ShowBiggerGamesListFont.Checked));

  iIniFile.UpdateFile;
  FreeAndNil(iIniFile);
end;

procedure TFormConsCompGamesEditor.FormShow(Sender: TObject);
begin
  Resize4K;
  mResult:= mrAbort;
  FormStatus.TitleStr('Custom Games Editor');
  FormStatus.MessageStr('Loading systems icons.');
  if not FormStatus.Visible then
     begin
       FormStatus.Show;
       FormStatus.StartThreadClock;
     end;

  FormMain.ELV_ResetNormalColors(Systems);
  FormMain.ELV_ResetNormalColors(CustomGamesList);
  
  Application.ProcessMessages;

  if IsNightMode then
     begin
       FormConsCompGamesEditor.Color:= menu_background_color[1];

       FormConsCompGamesEditor.PanelSystems.Color1:= menu_background_color[1];
       FormMain.SetEasyListViewColors(Systems, menu_background_color[1], item_caption_active_color[1]);

       PanelCustomGames.Color1:=  menu_background_color[1];
       PanelEditSelected.Color1:= menu_background_color[1];

       FormMain.SetEasyListViewColors(CustomGamesList, menu_background_color[1], clWhite);
       FormMain.ELV_SetEditBkColor(CustomGamesList);

       FormMain.ELV_SetNightModeColors(Systems);
       FormMain.SetEasyListViewHeaderColors(CustomGamesList, True, False, Is4KMode);
       FormMain.ELV_SetRibbonNightColors(0, CustomGamesList, True);
       
       LabelCustomGamesListTotal.Color:= clrLightBlack;
       SetLabelColors(LabelCustomGamesListTotal, item_caption_active_color[1], item_caption_active_shadow_color[1]);
       LabelCustomGamesListTotal.Frames:= [];

       SetLabelColors(LabelEditSelected, clCream, item_caption_active_shadow_color[1]);
       SetLabelColors(LabelEditSelectedDrag, clMedGray, item_caption_active_shadow_color[1]);

       SetCheckBoxColors(LabelEditSelected_Manufacturer,  item_caption_active_color[1], item_caption_active_shadow_color[1]);
       SetCheckBoxColors(LabelEditSelected_Year,          item_caption_active_color[1], item_caption_active_shadow_color[1]);
       SetCheckBoxColors(LabelEditSelected_NumberPlayers, item_caption_active_color[1], item_caption_active_shadow_color[1]);

       FormMain.SetCheckBoxExCustomIcon(LabelEditSelected_Manufacturer);
       FormMain.SetCheckBoxExCustomIcon(LabelEditSelected_Year);
       FormMain.SetCheckBoxExCustomIcon(LabelEditSelected_NumberPlayers);

       SetEditNightColors(EditSelected_Manufacturer);
       SetEditNightColors(EditSelected_Year);
       SetEditNightColors(EditSelected_NumberPlayers);

       SetLabelColors(LabelEditSelected_Total, item_caption_active_color[1], item_caption_active_shadow_color[1]);

       FormMain.SetButtonExColors(ButtonMultiSelectedInfo_Confirm);
       FormMain.SetButtonExColors(MultiSelectedInfo_Cancel);

       FormMain.UpdateSplitterStyle(Splitter, tsSolidColor, clrBlackBk, clGray);
       FormMain.SetGripIcon(Splitter, False);

       SetPanelColors(PanelToolBarGamesEditor, FormMain.PanelSearchGames_ToolBar.Color1,
                      FormMain.PanelSearchGames_ToolBar.Color2, FormMain.PanelSearchGames_ToolBar.Style = vgSolid);

       FormMain.SetToolBarPanelColors(PanelToolBarGamesEditor, PanelSearchGames);

       SetLabelColors(LabelToolBarFilterTitle, FormMain.LabelSearchGamesBy_ToolBar.Font.Color);

       FilterGameTitle.Font.Color:= FormMain.FilterGameTitle_ToolBar.Font.Color;
       FilterGameTitle.Color:= FormMain.FilterGameTitle_ToolBar.Color;

       FilterGameTitle.ColorFrame:= FormMain.FilterGameTitle_ToolBar.ColorFrame;
       FilterGameTitle.ColorFrameFocused:= FormMain.FilterGameTitle_ToolBar.ColorFrameFocused;

       FilterGameTitle.UseCustomBorder:= True;

       SetCheckBoxColors(ShowBiggerGamesListFont, clCream, item_caption_active_shadow_color[1]);
       FormMain.SetCheckBoxExCustomIcon(ShowBiggerGamesListFont);

       SetCheckBoxColors(SystemsHideScrollBarArea, clCream, item_caption_active_shadow_color[1]);
       FormMain.SetCheckBoxExCustomIcon(SystemsHideScrollBarArea);

       FormMain.SetButtonExColors(ButtonApplyChanges);
       FormMain.SetButtonExColors(ButtonAbortChanges);

       SetLabelColors(LabelHotkeyText, clCream, item_caption_active_shadow_color[1]);
       SetLabelColors(LabelHotkeyKeys, clrLightRed, item_caption_active_shadow_color[1]);
     end
  else
     begin
       FormMain.SetToolBarPanelColors(PanelToolBarGamesEditor, FormMain.PanelSearchGames_ToolBar);
       FormMain.SetToolBarPanelColors(PanelToolBarGamesEditor, PanelSearchGames);
       LabelToolBarFilterTitle.Font:= FormMain.LabelSearchGamesFilter_ToolBar.Font;
     end;

  ReadSettings;

  ELV_AdjustCellHeight(CustomGamesList);

  if FormConsCompGamesEditor.Tag = 1 then
     WindowState:= wsMaximized
  else
     CallCenterWindow(FormConsCompGamesEditor);

  FormMain.IL_MenuPopup.GetIcon(23, FormConsCompGamesEditor.Icon);

  if IsNightMode then
     begin
       FormMain.SetWin10DarkScrollBar(Systems);
       FormMain.SetWin10DarkScrollBar(CustomGamesList);
     end;

  FormStatus.MessageStr('Loading console/computer games.');
  LoadGamesInList;

  FormMain.LoadNonArcadeSystemIcons(IL_Systems, False, False);

  ELV_PopulateCustomSystems(Systems, -1, 0, False);
  Systems.Groups.FirstItem.Captions[1]:= ''; // fix the empty spaces for "All Systems" entry

  if not Is4KMode then
     FormMain.ELV_FixTitleClickAreaMulti(Systems);

  if FormMain.CheckSelected(FormMain.GamesListView) then
     begin
       if uMain.TEasyGameInfo(FormMain.SelectedEasyItem).eIsCustomGame then
          begin
            FormMain.ELV_SelectItem(CustomGamesList, 0, uMain.TEasyGameInfo(FormMain.SelectedEasyItem).eTitle);
            CustomGamesList.SetFocus;
          end;
     end;
  FormStatus.Close;
end;

procedure TFormConsCompGamesEditor.SystemsItemSelectionChanged(
  Sender: TCustomEasyListview; Item: TEasyItem);
begin
  if Item.Selected then
     begin
       if Item.ImageIndex <> Systems.Tag then
       begin
         if PanelEditSelected.Visible then
            MultiSelectedInfo_Cancel.Click; // clear all texts and hide the panel
         Systems.Tag:= Item.ImageIndex;
         ApplySystemFilter;
       end;
     end;
end;

procedure TFormConsCompGamesEditor.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if FormMain.ELV_IsEditing(CustomGamesList) or PanelEditSelected.Visible then
     CanClose:= False;

  if CanClose then
     begin
       WriteSettings;
       FormMain.ClearListView(CustomGamesList);
     end;
end;

function TFormConsCompGamesEditor.CustomGamesListItemCompare(
  Sender: TCustomEasyListview; Column: TEasyColumn; Group: TEasyGroup;
  Item1, Item2: TEasyItem; var DoDefault: Boolean): Integer;
var
  gItem1, gItem2: TEasyItem;
begin
  DoDefault:= False;
  FormMain.ELV_GetSortDirection(Column, Item1, Item2, gItem1, gItem2);
  case Column.Index of
    0: Result:= FormMain.iCompare(TCustomGameInfo(gItem1).eTitle, TCustomGameInfo(gItem2).eTitle);
    1: Result:= FormMain.iCompare(TCustomGameInfo(gItem1).eYear, TCustomGameInfo(gItem2).eYear);
    2: Result:= FormMain.iCompare(TCustomGameInfo(gItem1).eManufacturer, TCustomGameInfo(gItem2).eManufacturer);
    3: Result:= FormMain.iCompare(TCustomGameInfo(gItem1).eNumberPlayers, TCustomGameInfo(gItem2).eNumberPlayers);
    4: Result:= CompareIntValue(TCustomGameInfo(gItem1).eGameSize, TCustomGameInfo(gItem2).eGameSize);
    5: Result:= FormMain.iCompare(TCustomGameInfo(gItem1).eName, TCustomGameInfo(gItem2).eName);
  end;
end;

procedure TFormConsCompGamesEditor.CustomGamesListColumnClick(
  Sender: TCustomEasyListview; Button: TCommonMouseButton;
  ShiftState: TShiftState; const Column: TEasyColumn);
begin
  if Button = cmbLeft then
     begin
       CustomGamesList.BeginUpdate;
       CustomGamesList.Sort.SortAll;
       CustomGamesList.EndUpdate(False);
       FormMain.ELV_MakeVisible(CustomGamesList, CustomGamesList.Selection.First);
     end;
end;

procedure TFormConsCompGamesEditor.CustomGamesListColumnSizeChanging(
  Sender: TCustomEasyListview; Column: TEasyColumn; Width,
  NewWidth: Integer; var Allow: Boolean);
begin
  if NewWidth < 10 then
     Allow:= False;
end;

procedure TFormConsCompGamesEditor.CustomGamesListIncrementalSearch(
  Item: TEasyCollectionItem; const SearchBuffer: WideString;
  var Handled: Boolean; var CompareResult: Integer);
begin
  CompareResult:= WideIncrementalSearch(TCustomGameInfo(Item).eTitle, SearchBuffer);
end;

procedure TFormConsCompGamesEditor.CustomGamesListKeyAction(
  Sender: TCustomEasyListview; var CharCode: Word; var Shift: TShiftState;
  var DoDefault: Boolean);
begin
  if FormMain.ELV_IsEditing(TEasyListView(Sender)) or PanelEditSelected.Visible then
     begin
       CharCode:= 0;
       Exit;
     end;

  case CharCode of
    //VK_RETURN:
    //  begin
    //    ToolBarSetSelectedProfileActive.Click;
    //    if FormMain.CheckSelected(FavoritesList) then
    //       Close;
    //  end;
    //VK_SPACE: ToolBarSetSelectedProfileActive.Click;

    VK_F2: EditSelectedFields(0); // title
    VK_F3: EditSelectedFields(1); // year
    VK_F4: EditSelectedFields(2); // manufacturer
    VK_F5: EditSelectedFields(3); // number of players
    VK_F6: EditSelectedFields(-1); // edit all fields, usually for multiple selected games

    //VK_DELETE: ToolButtonDelete.Click;
    //VK_ESCAPE: Close;
  end;
end;

procedure TFormConsCompGamesEditor.CustomGamesListItemEdited(
  Sender: TCustomEasyListview; Item: TEasyItem; var NewValue: Variant;
  var Accept: Boolean);
begin
  case CustomGamesList.Tag of
    0: // edit title, column 0
      begin
        if NewValue = '' then
           begin
             Accept:= False;
             Exit;
           end;
        TCustomGameInfo(Item).eTitle:= NewValue;
      end;
    1: // edit year, column 1
      begin
        TCustomGameInfo(Item).eYear:= NewValue;
      end;
    2: // edit manufacturer, column 2
      begin
        TCustomGameInfo(Item).eManufacturer:= NewValue;
      end;
    3: // edit number of players, column 3
      begin
        TCustomGameInfo(Item).eNumberPlayers:= NewValue;
      end;
  end;
end;

procedure TFormConsCompGamesEditor.CustomGamesListItemEditEnd(
  Sender: TCustomEasyListview; Item: TEasyItem);
begin
  FormMain.ELV_SetEditManager(CustomGamesList, False);
  FormMain.SetFormKeyPreview(FormConsCompGamesEditor);
end;

procedure TFormConsCompGamesEditor.SetEditBkColor(EditExSource: TEditEx; IsEnabled: Boolean);
begin
  if IsNightMode then
     begin
       if IsEnabled then
          EditExSource.Color:= clrDarkGray
       else
          EditExSource.Color:= EditExSource.ColorDisabled;
     end
  else
     begin
       if IsEnabled then
          EditExSource.Color:= clWhite
       else
          EditExSource.Color:= $00f1f1f1;
     end;
end;

procedure TFormConsCompGamesEditor.LabelEditSelected_ManufacturerClick(
  Sender: TObject);
begin
  SetEditBkColor(EditSelected_Manufacturer, LabelEditSelected_Manufacturer.Checked);
  EditSelected_Manufacturer.Enabled:= LabelEditSelected_Manufacturer.Checked;
end;

procedure TFormConsCompGamesEditor.LabelEditSelected_YearClick(
  Sender: TObject);
begin
  SetEditBkColor(EditSelected_Year, LabelEditSelected_Year.Checked);
  EditSelected_Year.Enabled:= LabelEditSelected_Year.Checked;
end;

procedure TFormConsCompGamesEditor.LabelEditSelected_NumberPlayersClick(
  Sender: TObject);
begin
  SetEditBkColor(EditSelected_NumberPlayers, LabelEditSelected_NumberPlayers.Checked);
  EditSelected_NumberPlayers.Enabled:= LabelEditSelected_NumberPlayers.Checked;
end;

procedure TFormConsCompGamesEditor.MultiSelectedInfo_CancelClick(
  Sender: TObject);
begin
  EditSelected_Manufacturer.Text:= '';
  EditSelected_Year.Text:= '';
  EditSelected_NumberPlayers.Text:= '';
  PanelEditSelected.Visible:= False;
  CustomGamesList.SetFocus;
end;

procedure TFormConsCompGamesEditor.ButtonMultiSelectedInfo_ConfirmClick(
  Sender: TObject);
begin
  UpdateMultiSelectedInfo;
  MultiSelectedInfo_Cancel.Click; // clear all texts
end;

procedure TFormConsCompGamesEditor.EditSelected_ManufacturerKeyPress(
  Sender: TObject; var Key: Char);
begin
  case Key of
    #13:
      begin
        Key:= #0; // to remove the "ding" sound
        ButtonMultiSelectedInfo_Confirm.Click;
      end;
    #27:
      begin
        Key:= #0; // to remove the "ding" sound
        MultiSelectedInfo_Cancel.Click;
      end;
  end;
end;

procedure TFormConsCompGamesEditor.PopupGamesListMeasureMenuItem(
  Sender: TObject; AMenuItem: TMenuItem; ACanvas: TCanvas; var Width,
  Height: Integer; ABarVisible: Boolean; var DefaultMeasure: Boolean);
begin
  FormMain.SetPopupMenuMeasureItem(AMenuItem, ACanvas, Width, Height);
end;

procedure TFormConsCompGamesEditor.PopupResetSystemsPanelSizeClick(
  Sender: TObject);
begin
  if SystemsHideScrollBarArea.Checked then
     begin
       PanelSystems.Width:= 392-GetSystemMetrics(SM_CXVSCROLL);
       Systems.Width:= 392;
     end
  else
     PanelSystems.Width:= 392;
end;

procedure TFormConsCompGamesEditor.PopupEditTitleClick(Sender: TObject);
begin
  if FormMain.ELV_IsEditing(CustomGamesList) or PanelEditSelected.Visible then
     Exit;

  EditSelectedFields(TEditEx(Sender).Tag);
    //VK_F2: EditSelectedFields(0); // title
    //VK_F3: EditSelectedFields(1); // year
    //VK_F4: EditSelectedFields(2); // manufacturer
    //VK_F5: EditSelectedFields(3); // number of players
    //VK_F6: EditSelectedFields(-1); // edit all fields, usually for multiple selected games
end;


procedure TFormConsCompGamesEditor.FilterGameTitleKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then
     begin
       Key:= #0; // to remove the "ding" sound when pressing some keys like ENTER, ESC and others
       ButtonFilterTitleApply.Click;
     end
  else
  if Key = #27 then
     begin
       Key:= #0;
       TEditEx(Sender).Text:= '';
     end;
end;

procedure TFormConsCompGamesEditor.ButtonFilterTitleApplyClick(
  Sender: TObject);
begin
  ApplyCustomFilterSearchBar;
end;

procedure TFormConsCompGamesEditor.ButtonFilterTitleResetClick(
  Sender: TObject);
begin
  if FormMain.CheckTotal(CustomGamesList) then
     begin
       FilterGameTitle.Text:= '';
       if FormMain.CheckSelected(Systems) then
          ApplySystemFilter;
     end;
end;

procedure TFormConsCompGamesEditor.SystemsHideScrollBarAreaClick(
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

procedure TFormConsCompGamesEditor.ButtonApplyChangesClick(Sender: TObject);
begin
  mResult:= mrOk;
  UpdateExtraInfoFiles;
  Close;
end;

procedure TFormConsCompGamesEditor.ButtonAbortChangesClick(Sender: TObject);
begin
  mResult:= mrAbort;
  Close;
end;

procedure TFormConsCompGamesEditor.SystemsItemImageDraw(
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

procedure TFormConsCompGamesEditor.SystemsItemImageDrawIsCustom(
  Sender: TCustomEasyListview; Item: TEasyItem; Column: TEasyColumn;
  var IsCustom: Boolean);
begin
  IsCustom:= True;
end;

procedure TFormConsCompGamesEditor.SystemsItemImageGetSize(
  Sender: TCustomEasyListview; Item: TEasyItem; Column: TEasyColumn;
  var ImageWidth, ImageHeight: Integer);
begin
  ImageWidth:=  IL_Systems.Width;
  ImageHeight:= IL_Systems.Height;
  if Is4KMode then
     ImageHeight:= ImageHeight+FormMain.IL_GroupedMode.Width+4; // +4 -> space between sys icon / sys type icon
end;

procedure TFormConsCompGamesEditor.SystemsItemPaintText(
  Sender: TCustomEasyListview; Item: TEasyItem; Position: Integer;
  ACanvas: TCanvas);
begin
  if Is4KMode then
     Exit;

  if Position = 1 then
     FormMain.ELV_SetSelecionFontColors(Systems, Item, ACanvas);
end;

procedure TFormConsCompGamesEditor.SplitterMoved(Sender: TObject);
begin
  UpdateSystemsDimensions;
end;

procedure TFormConsCompGamesEditor.FormResize(Sender: TObject);
begin
  UpdateSystemsDimensions;
end;

procedure TFormConsCompGamesEditor.FormCreate(Sender: TObject);
var
  iSize: Integer;
begin
  if FormMain.MenuCustomizeSplashScreen.Tag = 0 then //if Screen.Fonts.IndexOf('Terminal') = -1 then
     begin
       if Is4KMode then
          iSize:= LabelHotKeyKeys.Font.Size
       else
          iSize:= 7;
       FormMain.ChangeLabelFontConsolas(LabelHotkeyKeys, iSize);
       FormMain.ChangeLabelFontConsolas(LabelHotkeyText, iSize);
     end;
end;

procedure TFormConsCompGamesEditor.CustomGamesListItemPaintText(
  Sender: TCustomEasyListview; Item: TEasyItem; Position: Integer;
  ACanvas: TCanvas);
begin
  FormMain.ELV_SetEditingFontColor(TEasyListView(Sender), Item, ACanvas);
end;

procedure TFormConsCompGamesEditor.CustomGamesListHintCustomInfo(
  Sender: TCustomEasyListview; TargetObj: TEasyCollectionItem;
  Info: TEasyHintInfo);
begin
  FormMain.ELV_Set4KHint(Info);
end;

procedure TFormConsCompGamesEditor.ShowBiggerGamesListFontClick(
  Sender: TObject);
var
  iValue: Integer;
begin
  if ShowBiggerGamesListFont.Checked then
     begin
       if Is4KMode then
          iValue:= 20
       else
          iValue:= 12;
     end
  else
     begin
       iValue:= FormMain.GetDefaultFontSize;
     end;

  if CustomGamesList.Font.Size <> iValue then
     begin
       CustomGamesList.Font.Size:= iValue;
       //ELV_AdjustCellHeight(CustomGamesList); // no need for this anymore (July 07, 2021)
     end;
end;

procedure TFormConsCompGamesEditor.PanelEditSelectedMouseDown(
  Sender: TObject; Button: TMouseButton; Shift: TShiftState; X,
  Y: Integer);
const
  sc_DragMove = $f012;
begin
  ReleaseCapture;
  PanelEditSelected.Perform(wm_SysCommand, sc_DragMove, 0);
end;

end.
