unit uLastPlayedGames;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  StdCtrls, ComCtrls, ImgList, MPCommonObjects, MPCommonUtilities,
  EasyListview, ExtCtrls, PanelEx, Buttons, ShadowLabel, IniFiles,
  SplitterEx, Menus, BarMenus, ButtonsEx;

type
  TPlayedGameInfo = class(TEasyItemStored)
  private
    fSystemID: ShortInt;
    fSystemType: ShortInt;
    fCustomSystemID: ShortInt;
    fCustomMediaType: ShortInt;
    fIsUnicode: Boolean;
    fTitle: WideString;
    //fYear: String;
    //fManufacturer: WideString;
    fName: WideString;
    fMediaType: ShortInt;
    fArcadeCHDMediaType: ShortInt;
    fSoftwareName: String;
    fSoftwareExecParam: String;
    fSoftwareTitle: WideString;

    fIsFavorite: Boolean;
    fPlayed: Cardinal;
    fPlayedDate: Integer;
    fPlayedDateText: String;
    fTotalPlaytime: Int64;
    fTotalPlaytimeText: String;

    fGameSetStatus: ShortInt;

    fIsCustomGame: Boolean;


    fReadDataFromMainList: Boolean; // this var is to improve speed when adding extra game info from main games list
  protected
    function GetCaptions(Column: Integer): WideString; override;
    function GetImageIndexes(Column: Integer): TCommonImageIndexInteger; override;
  public
    property eSystemID: ShortInt read fSystemID write fSystemID;
    property eSystemType: ShortInt read fSystemType write fSystemType;
    property eCustomSystemID: ShortInt read fCustomSystemID write fCustomSystemID;
    property eCustomMediaType: ShortInt read fCustomMediaType write fCustomMediaType;
    property eIsUnicode: Boolean read fIsUnicode write fIsUnicode;
    property eTitle: WideString read fTitle write fTitle;
    //property eYear: String read fYear write fYear;
    //property eManufacturer: WideString read fManufacturer write fManufacturer;
    property eName: WideString read fName write fName;
    property eMediaType: ShortInt read fMediaType write fMediaType;
    property eArcadeCHDMediaType: ShortInt read fArcadeCHDMediaType write fArcadeCHDMediaType;

    property eSoftwareName: String read fSoftwareName write fSoftwareName;
    property eSoftwareExecParam: String read fSoftwareExecParam write fSoftwareExecParam;
    property eSoftwareTitle: WideString read fSoftwareTitle write fSoftwareTitle;
    property eIsFavorite: Boolean read fIsFavorite write fIsFavorite;
    property ePlayed: Cardinal read fPlayed write fPlayed;
    property ePlayedDate: Integer read fPlayedDate write fPlayedDate;
    property ePlayedDateText: String read fPlayedDateText write fPlayedDateText; // formatted last played in "00:00:00 Feb 03, 2014"
    property eTotalPlaytime: Int64 read fTotalPlaytime write fTotalPlaytime; // total playtime in milliseconds
    property eTotalPlaytimeText: String read fTotalPlaytimeText write fTotalPlaytimeText; // formatted playtime in "x days, 00:00:00" format

    property eGameSetStatus: ShortInt read fGameSetStatus write fGameSetStatus; // 0 - have; 1 - missing ROMs/CHDs; 2 - missing (no .zip and no ROMs found)

    property eIsCustomGame: Boolean read fIsCustomGame write fIsCustomGame;
    property eReadDataFromMainList: Boolean read fReadDataFromMainList write fReadDataFromMainList;
  end;

type
  TFormLastPlayedGames = class(TForm)
    PanelGames: TPanelEx;
    LastPlayedList: TEasyListview;
    IL_Systems: TImageList;
    PanelBottom: TPanelEx;
    ButtonSelectGame: TBitBtnEx;
    ButtonClose: TBitBtnEx;
    PanelPlayedListHeader: TPanelEx;
    LabelTitleCaption: TShadowLabel;
    LabelLastPlayed: TShadowLabel;
    LabelTotalPlaytime: TShadowLabel;
    LabelSoftwareTitleCaption: TShadowLabel;
    ButtonSelectGameExit: TBitBtnEx;
    LabelGameNameCaption: TShadowLabel;
    PanelSystemsTitle: TPanelEx;
    LabelSystemTitle: TShadowLabel;
    LabelSystemType: TShadowLabel;
    Systems: TEasyListview;
    procedure ButtonSelectGameClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure SystemsItemSelectionChanged(Sender: TCustomEasyListview;
      Item: TEasyItem);
    procedure LastPlayedListKeyAction(Sender: TCustomEasyListview;
      var CharCode: Word; var Shift: TShiftState; var DoDefault: Boolean);
    procedure LastPlayedListDblClick(Sender: TCustomEasyListview;
      Button: TCommonMouseButton; MousePos: TPoint;
      ShiftState: TShiftState; var Handled: Boolean);
    procedure LastPlayedListItemPaintText(Sender: TCustomEasyListview;
      Item: TEasyItem; Position: Integer; ACanvas: TCanvas);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure SystemsItemPaintText(Sender: TCustomEasyListview;
      Item: TEasyItem; Position: Integer; ACanvas: TCanvas);
    procedure LastPlayedListItemSelectionChanged(
      Sender: TCustomEasyListview; Item: TEasyItem);
    procedure SystemsItemImageDraw(Sender: TCustomEasyListview;
      Item: TEasyItem; Column: TEasyColumn; ACanvas: TCanvas;
      const RectArray: TEasyRectArrayObject;
      AlphaBlender: TEasyAlphaBlender);
    procedure SystemsItemImageDrawIsCustom(Sender: TCustomEasyListview;
      Item: TEasyItem; Column: TEasyColumn; var IsCustom: Boolean);
    procedure SystemsItemImageGetSize(Sender: TCustomEasyListview;
      Item: TEasyItem; Column: TEasyColumn; var ImageWidth,
      ImageHeight: Integer);
  private
    { Private declarations }
    LastSelectedStateImageIndex: ShortInt;
    procedure LoadSystemsFilter;
    procedure AddGamesMRU;
    procedure FillGameDataFromMainGamesList;
    procedure FilterMRUGames(SystemID: Byte; IsCustomGame: Boolean);
    procedure SelectGameToPlay(Item_Source: TEasyItem; ExitDialog: Boolean);
    procedure ResizeForm;
    procedure Resize4K;
  public
    { Public declarations }
  end;

var
  FormLastPlayedGames: TFormLastPlayedGames;

implementation

uses uCommon, uCommonCustom, uMain;

{$R *.dfm}

function TPlayedGameInfo.GetCaptions(Column: Integer): WideString;
//var
//  strMediaType: String;
begin
  //strSize:= FormMain.MountSizeString(eMediaType, eGameSize);
  //strMediaType:= MediaTypeArray[eMediaType, 0]; // MediaType[] or MediaTypeCustom[]
  case Column of
    0: Result:= eTitle;
    1: Result:= eName;
    2:
      begin
        if eSoftwareTitle <> '' then
           Result:= eSoftwareTitle
        else
           Result:= eSoftwareName;
      end;
    3: Result:= ePlayedDateText;
    4: Result:= eTotalPlaytimeText+' ('+IntToStr(ePlayed)+'x)';
    10:
      begin
        Result:= 'Played: '+ePlayedDateText+'     Playtime: '+eTotalPlaytimeText+' ('+IntToStr(ePlayed)+'x)';
      end;
    11:
      begin
        if eSoftwareName = '' then
           Result:= ''
        else
           Result:= 'Software List: '+eSoftwareName;
      end;
  end;
end;

function TPlayedGameInfo.GetImageIndexes(Column: Integer): TCommonImageIndexInteger;
begin
  // uMain.IL_LeftPanel for regular and uMain.IL_MediaType_Large for 4K mode
  if Column = 0 then
     begin
       if eIsCustomGame then
          Result:= FormMain.GetMediaTypeIconMsgBox(eCustomMediaType, True, eMediaType, eArcadeCHDMediaType, nil, '', '', False, Is4KMode)
       else
          Result:= FormMain.GetMediaTypeIconMsgBox(-1, False, eMediaType, eArcadeCHDMediaType, nil, eSoftwareExecParam, eSoftwareName, False, Is4KMode);
     end
  else
     Result:= -1;
end;

procedure TFormLastPlayedGames.Resize4K;
var
  iSize: Integer;
begin
  if not Is4KMode then
     Exit;

  with FormLastPlayedGames do
  begin
    ClientWidth:=  2980;
    Font.Size:= 16;

    FormMain.Set4KImageListSpecs(IL_Systems, 128);
    Systems.PaintInfoItem.IconViewRemoveIconTopBorder:= True;
    Systems.CellSizes.Icon.Width:=  156;
    Systems.CellSizes.Icon.Height:= 207+32+4;

    Systems.Font.Name:= FormMain.Get4KSystemFont;
    FormMain.Set4KListViewSpecs(Systems, 8, 8, (Systems.CellSizes.Icon.Width*19)+20, Systems.CellSizes.Icon.Height*4, 16); // 19 columns; 4 lines

    PanelSystemsTitle.Visible:= False;
    //FormMain.Set4KSystemTitlePanel(nil, PanelSystemsTitle, Systems, LabelSystemTitle, nil, LabelSystemType, nil);

    LastPlayedList.CellSizes.Report.Height:= 37;
    iSize:= LastPlayedList.CellSizes.Report.Height*25+14;

    PanelPlayedListHeader.Height:= 37; // 3+31+3; // 3 is top/bottom border

    // set fonts to default: 'Segoe UI' size 16
    LabelTitleCaption.Font:= Font;
    LabelGameNameCaption.Font:= Font;
    LabelSoftwareTitleCaption.Font:= Font;
    LabelLastPlayed.Font:= Font;
    LabelTotalPlaytime.Font:= Font;

    FormMain.Set4KLabelSpecs(LabelTitleCaption,         -1, 3, -1, -1, 16);
    FormMain.Set4KLabelSpecs(LabelGameNameCaption,      -1, 3, -1, -1, 16);
    FormMain.Set4KLabelSpecs(LabelSoftwareTitleCaption, -1, 3, -1, -1, 16);
    FormMain.Set4KLabelSpecs(LabelLastPlayed,           -1, 3, -1, -1, 16);
    FormMain.Set4KLabelSpecs(LabelTotalPlaytime,        -1, 3, -1, -1, 16);

    PanelBottom.Height:= 71;
    FormMain.Set4KButtonSpecs(ButtonSelectGame, (PanelBottom.Width-(168+10+168+10+220)) div 2,       16, 168, 45, 16);
    FormMain.Set4KButtonSpecs(ButtonSelectGameExit, ButtonSelectGame.Left+ButtonSelectGame.Width+10, 16, 220, 45, 16);
    FormMain.Set4KButtonSpecs(ButtonClose, ButtonSelectGameExit.Left+ButtonSelectGameExit.Width+10,  16, 168, 45, 16);

    FormMain.Set4KPanelSpecs(PanelGames, 0, Systems.Top+Systems.Height+16, ClientWidth, PanelPlayedListHeader.Height+iSize);
    //FormMain.Set4KPanelSpecs(PanelGames, 0, PanelSystemsTitle.Top+PanelSystemsTitle.Height, ClientWidth, PanelPlayedListHeader.Height+iSize);
    FormMain.Set4KListViewSpecs(LastPlayedList, -1, PanelPlayedListHeader.Height-2, PanelGames.Width, iSize, 16);

    LastPlayedList.Header.Columns[1].Width:= 400; // game name
    LastPlayedList.Header.Columns[2].Width:= 700; // softwarelist title
    LastPlayedList.Header.Columns[3].Width:= 220; // last played
    LastPlayedList.Header.Columns[4].Width:= 260; // total playtime
    iSize:= LastPlayedList.Header.Columns[1].Width+LastPlayedList.Header.Columns[2].Width+
            LastPlayedList.Header.Columns[3].Width+LastPlayedList.Header.Columns[4].Width;
    LastPlayedList.Header.Columns[0].Width:= PanelGames.Width-iSize-(LastPlayedList.PaintInfoColumn.Border*2); // game title

    LastPlayedList.ImagesState:= FormMain.IL_GroupedMode;
    LastPlayedList.ImagesSmall:= FormMain.IL_MediaType_Large;

    ClientHeight:= PanelGames.Top+PanelGames.Height+PanelBottom.Height;
  end;
end;

procedure TFormLastPlayedGames.LoadSystemsFilter;
begin                                                       // set TRUE to show all systems (debugging only)
  FormMain.ELV_PopulateSystemsMulti(Systems, 2, True, True, False);
  FormMain.ELV_FindSelectedSystemMulti(Systems, FormMain.SelectedEasyItem, False);
end;

procedure TFormLastPlayedGames.AddGamesMRU;
var
  addItem: TEasyItem;
  SysLoop, Loop: ShortInt;
  ValueStr, UnicodeFileName, StrToSearch: String;
  AnsiStr: String;
  PlayedList: THashedStringList;
  iGameTitle: WideString;
  iMediaType: Integer;
  //iSoftwareExecParam: String;
  iPlayed: Cardinal;
  iLastPlayed, TotalLines: Integer;
  iTotalPlaytime: Int64;
  FavoriteList: THashedStringList;
begin
  if FormMain.ValidateFile(FormMain.GetFavoritesFile) then
     begin
       FavoriteList:= THashedStringList.Create;
       FavoriteList.LoadFromFile(FormMain.GetFavoritesFile);
       if FavoriteList.Count = 0 then
          FreeAndNil(FavoriteList);
     end;

  LastPlayedList.BeginUpdate;
  LastPlayedList.Items.ReIndexDisable:= True;

  for SysLoop:=1 to MaxArcadeSystems do
  begin
    if FileExists(FormMain.GetGamesPlayedIniFile(SysLoop)) then
       begin
         PlayedList:= THashedStringList.Create;
         PlayedList.LoadFromFile(FormMain.GetGamesPlayedIniFile(SysLoop));
         TotalLines:= PlayedList.Count-1;
         for Loop:= 0 to 24 do
         begin
           if (Loop <= TotalLines) and (PlayedList[Loop] <> '') then
             begin
               iMediaType:= 0; // set it to ROM media type

               //if ValueStr <> '' then
               //   iMediaType:= StrToInt(ValueStr);

               StrToSearch:= '';
               UnicodeFileName:= PlayedList.Names[Loop];

               iPlayed:= PosEx('\', UnicodeFileName);
               if iPlayed <> 0 then
                  begin
                    StrToSearch:= UnicodeFileName;
                    UnicodeFileName:= Copy(UnicodeFileName, iPlayed+1, Length(UnicodeFileName)); // this will hold the MAME softwarelist name
                    Delete(StrToSearch, iPlayed, Length(StrToSearch));
                  end;

               iPlayed:= 0;
               ValueStr:= PlayedList.ValueFromIndex[Loop];
               FormMain.GetPlayedGameInfoIni(ValueStr, iPlayed, iLastPlayed, iTotalPlaytime);

               addItem:= LastPlayedList.Items.AddCustom(TPlayedGameInfo, nil);
               TPlayedGameInfo(addItem).eSystemID:= SysLoop;
               TPlayedGameInfo(addItem).eCustomSystemID:= -1;

               TPlayedGameInfo(addItem).eIsCustomGame:= False;
               TPlayedGameInfo(addItem).eIsUnicode:= False;

               TPlayedGameInfo(addItem).eTitle:= UnicodeFileName;

               TPlayedGameInfo(addItem).eName:= UnicodeFileName;
               TPlayedGameInfo(addItem).eSoftwareName:= StrToSearch;

               TPlayedGameInfo(addItem).eCustomMediaType:= -1;

               TPlayedGameInfo(addItem).ePlayed:= iPlayed;

               TPlayedGameInfo(addItem).ePlayedDate:= iLastPlayed;
               if iLastPlayed <> 0 then
                  ValueStr:= FormMain.GetDateTimeStr(iLastPlayed)
               else
                  ValueStr:= '';

               TPlayedGameInfo(addItem).ePlayedDateText:= ValueStr;
               TPlayedGameInfo(addItem).eTotalPlaytime:= iTotalPlaytime;

               if iTotalPlaytime <> 0 then
                  TPlayedGameInfo(addItem).eTotalPlaytimeText:= GetPlayTime(iTotalPlaytime, True);

               if Assigned(FavoriteList) then
                  begin
                    StrToSearch:= PlayedList.Names[Loop]+'='+FormMain.GetArcadeSystemIniSection(SysLoop, True);
                    TPlayedGameInfo(addItem).eIsFavorite:= (FavoriteList.IndexOf(StrToSearch) <> -1);
                  end
               else
                  TPlayedGameInfo(addItem).eIsFavorite:= False;

               if TPlayedGameInfo(addItem).eIsFavorite then
                  begin
                    if Is4KMode then
                       addItem.StateImageIndex:= 03  // from FormMain.IL_GroupedMode (32x32)
                    else
                       addItem.StateImageIndex:= 10; // from FormMain.IL_LeftPanel   (16x16)
                  end
               else
                  addItem.StateImageIndex:= 500; // bogus image index to show an empty space

               TPlayedGameInfo(addItem).eReadDataFromMainList:= False;

               //addItem.Details[1]:= 10;
               //addItem.Details[2]:= 11;
             end;
         end;
         FreeAndNil(PlayedList);
       end;
  end;

  for SysLoop:=1 to MaxConsoleComputerSystems do
  begin
    if FileExists(GetCustomGamePlayedFile(SysLoop)) then
       begin
         PlayedList:= THashedStringList.Create;
         PlayedList.LoadFromFile(GetCustomGamePlayedFile(SysLoop));
         TotalLines:= PlayedList.Count-1;
         for Loop:= 0 to 24 do
         begin
           if (Loop <= TotalLines) and (PlayedList[Loop] <> '') then
              begin
               UnicodeFileName:= SoftListGetEntryValue(PlayedList[Loop], 'file');
               iGameTitle:= UnicodeFileName;
               iGameTitle:= ChangeFileExtW(iGameTitle, '');
               iGameTitle:= FormMain.DecodeUnicodeStr(iGameTitle);

               ValueStr:= PlayedList[Loop];
               GetPlayedGameInfoIniCustom(ValueStr, iPlayed, iLastPlayed, iTotalPlaytime);
               Delete(ValueStr, 1, PosEx('/>', ValueStr)+1);
               addItem:= LastPlayedList.Items.AddCustom(TPlayedGameInfo, nil);
               TPlayedGameInfo(addItem).eSystemID:= -1; // use this to avoid mixing things up ??? (October 26, 2017)
               TPlayedGameInfo(addItem).eCustomSystemID:= SysLoop;

               // <file>Game_filename/> MediaType_ID  ' '  TimesPlayed;PlayedDate;TotalPlayTime
               //                             1
               TPlayedGameInfo(addItem).eIsCustomGame:= True;

               TPlayedGameInfo(addItem).eTitle:= iGameTitle;
               TPlayedGameInfo(addItem).eName:= FormMain.DecodeUnicodeStr(UnicodeFileName);
               TPlayedGameInfo(addItem).eIsUnicode:= FormMain.IsUnicodeString(UnicodeFileName, TPlayedGameInfo(addItem).eName);
               TPlayedGameInfo(addItem).eSoftwareName:= '';
               TPlayedGameInfo(addItem).eSoftwareExecParam:= '';
               
               TPlayedGameInfo(addItem).eCustomMediaType:= StrToInt(ValueStr[1]);
               TPlayedGameInfo(addItem).eMediaType:= -1;

               TPlayedGameInfo(addItem).ePlayed:= iPlayed;

               TPlayedGameInfo(addItem).ePlayedDate:= iLastPlayed;
               if iLastPlayed <> 0 then
                  ValueStr:= FormMain.GetDateTimeStr(iLastPlayed)
               else
                  ValueStr:= '';

               TPlayedGameInfo(addItem).ePlayedDateText:= ValueStr;
               TPlayedGameInfo(addItem).eTotalPlaytime:= iTotalPlaytime;

               if iTotalPlaytime <> 0 then
                  TPlayedGameInfo(addItem).eTotalPlaytimeText:= GetPlayTime(iTotalPlaytime, True);

               if Assigned(FavoriteList) then
                  begin
                    StrToSearch:= Format('%.3u %u', [TPlayedGameInfo(addItem).eCustomSystemID, TPlayedGameInfo(addItem).eCustomMediaType])+' <file>'+UnicodeFileName;
                    TPlayedGameInfo(addItem).eIsFavorite:= (FavoriteList.IndexOf(StrToSearch) <> -1);
                  end
               else
                  TPlayedGameInfo(addItem).eIsFavorite:= False;

               if TPlayedGameInfo(addItem).eIsFavorite then
                  begin
                    if Is4KMode then
                       addItem.StateImageIndex:= 03  // from FormMain.IL_GroupedMode (32x32)
                    else
                       addItem.StateImageIndex:= 10; // from FormMain.IL_LeftPanel   (16x16)
                  end
               else
                  addItem.StateImageIndex:= 500; // bogus image index to show an empty space

               TPlayedGameInfo(addItem).eReadDataFromMainList:= False;
              end;
         end;
         FreeAndNil(PlayedList);
       end;
  end;
  LastPlayedList.Items.ReIndexDisable:= False;
  LastPlayedList.EndUpdate(False);
  FreeAndNil(FavoriteList);
end;

procedure TFormLastPlayedGames.FillGameDataFromMainGamesList;
var
  elvItem, LastPlayedItem: TEasyItem;
  elvGroup: TEasyGroup;

  function FindLastPlayedItem: Boolean;
  begin
    Result:= False;
    LastPlayedItem:= LastPlayedList.Groups.FirstItem;
    repeat
      if not TPlayedGameInfo(LastPlayedItem).eReadDataFromMainList then
         begin
           if TPlayedGameInfo(LastPlayedItem).eIsCustomGame = uMain.TEasyGameInfo(elvItem).eIsCustomGame then
           begin
             if uMain.TEasyGameInfo(elvItem).eIsCustomGame then
             begin
               if (TPlayedGameInfo(LastPlayedItem).eCustomSystemID = uMain.TEasyGameInfo(elvItem).eCustomSystemID) and
                  (TPlayedGameInfo(LastPlayedItem).eCustomMediaType = uMain.TEasyGameInfo(elvItem).eCustomMediaType) and
                  (TPlayedGameInfo(LastPlayedItem).eName = uMain.TEasyGameInfo(elvItem).eName) then
                  Result:= True;
             end
             else
             begin
               if (TPlayedGameInfo(LastPlayedItem).eSystemID = uMain.TEasyGameInfo(elvItem).eSystemID) and
                  (TPlayedGameInfo(LastPlayedItem).eName = uMain.TEasyGameInfo(elvItem).eName) and
                  (TPlayedGameInfo(LastPlayedItem).eSoftwareName = uMain.TEasyGameInfo(elvItem).eSoftwareName) then
                  Result:= True;
             end;
           end;
         end;

      if not Result then
         LastPlayedItem:= LastPlayedList.Groups.NextItem(LastPlayedItem);
    until Result or (LastPlayedItem = nil);
  end;

  function FillGameDetails: Boolean;
  begin
    Result:= True;
    if not TPlayedGameInfo(LastPlayedItem).eIsCustomGame then
       begin
         TPlayedGameInfo(LastPlayedItem).eMediaType:= uMain.TEasyGameInfo(elvItem).eMediaType;
         TPlayedGameInfo(LastPlayedItem).eArcadeCHDMediaType:= uMain.TEasyGameInfo(elvItem).eArcadeCHDMediaType;
         TPlayedGameInfo(LastPlayedItem).eSoftwareExecParam:= uMain.TEasyGameInfo(elvItem).eSoftwareExecParameter;
         if TPlayedGameInfo(LastPlayedItem).eSoftwareName <> '' then
            TPlayedGameInfo(LastPlayedItem).eSoftwareTitle:= uMain.TEasyGameInfo(elvItem).eCategory;
       end;

    if TPlayedGameInfo(LastPlayedItem).eTitle <> uMain.TEasyGameInfo(elvItem).eTitle then
       TPlayedGameInfo(LastPlayedItem).eTitle:= uMain.TEasyGameInfo(elvItem).eTitle;

    if TPlayedGameInfo(LastPlayedItem).eGameSetStatus <> uMain.TEasyGameInfo(elvItem).eGameSetStatus then
       TPlayedGameInfo(LastPlayedItem).eGameSetStatus:= uMain.TEasyGameInfo(elvItem).eGameSetStatus;
    //TPlayedGameInfo(LastPlayedItem).eYear:= uMain.TEasyGameInfo(elvItem).eYear;
    //TPlayedGameInfo(LastPlayedItem).eManufacturer:= uMain.TEasyGameInfo(elvItem).eManufacturer;
    //TPlayedGameInfo(LastPlayedItem).eSoftwareName:= uMain.TEasyGameInfo(elvItem).eSoftwareName;

    TPlayedGameInfo(LastPlayedItem).eReadDataFromMainList:= True;
  end;

begin
  if not FormMain.CheckTotal(FormMain.GamesListView) then
     Exit;
  if not FormMain.CheckTotal(LastPlayedList) then
     Exit;

  LastPlayedList.BeginUpdate;
  case FormMain.IsGroupedView of
    True:
      begin
        elvGroup:= FormMain.GamesListView.Groups.FirstGroup;
        repeat
          elvItem:= FormMain.GamesListView.Groups.FirstInGroup(elvGroup);
          repeat
            if FindLastPlayedItem then
               FillGameDetails;

            elvItem:= FormMain.GamesListView.Groups.NextInGroup(elvGroup, elvItem);
          until elvItem = nil;
          elvGroup:= FormMain.GamesListView.Groups.NextGroup(elvGroup);
        until elvGroup = nil;

      end;
    False:
      begin
        elvItem:= FormMain.GamesListView.Groups.FirstItem;
        repeat
          if FindLastPlayedItem then
             FillGameDetails;

          elvItem:= FormMain.GamesListView.Groups.NextItem(elvItem);
        until elvItem = nil;
      end;
  end;
  LastPlayedList.EndUpdate;
end;

procedure TFormLastPlayedGames.FilterMRUGames(SystemID: Byte; IsCustomGame: Boolean);
var
  Item: TEasyItem;
begin
  LastPlayedList.Selection.ClearAll;
  LastPlayedList.BeginUpdate;
  if LastPlayedList.Groups.VisibleItemCount = 0 then
     begin
       // if they are invisible already... they are not shown anymore so,
       // need to force them all to be visible before applying the filters again
       LastPlayedList.Groups.MakeAllVisible;
       LastPlayedList.Groups.Rebuild(True); // need to rebuild or list gets messed up
     end;

  Item:= LastPlayedList.Groups.FirstItem;
  repeat
    if FormMain.ELV_IsArcadeSystemSelected(Systems) then
       begin
         if not TPlayedGameInfo(Item).eIsCustomGame then
            Item.Visible:= TPlayedGameInfo(Item).eSystemID = Systems.Tag
         else
            Item.Visible:= False;
       end
    else
       begin
         if TPlayedGameInfo(Item).eIsCustomGame then
            Item.Visible:= TPlayedGameInfo(Item).eCustomSystemID = Systems.Tag
         else
            Item.Visible:= False;
       end;
    Item:= LastPlayedList.Groups.NextItem(Item);
  until Item = nil;
  LastPlayedList.EndUpdate;
end;

procedure TFormLastPlayedGames.SelectGameToPlay(Item_Source: TEasyItem; ExitDialog: Boolean);
var
  Item_MainGamesList: TEasyItem;
begin
  FormMain.FindGameName(TPlayedGameInfo(Item_Source).eName, Systems.Tag, TPlayedGameInfo(Item_Source).eMediaType, TPlayedGameInfo(Item_Source).eIsCustomGame,
                        TPlayedGameInfo(Item_Source).eSoftwareName, Item_MainGamesList, False);

  if Item_MainGamesList = nil then
     begin
       FormMain.ShowMessageBox('Info', 'Last played games.', '   Could not select this game in main games list.'+#13#10+
                       'It''s either not visible due to filters or it doesn''t exist.');
       Exit; // game was not found or is not visible due to main tool bar filters
     end;

  FormMain.SelectEasyItem(Item_MainGamesList);
  if ExitDialog then
     Close;
end;

procedure TFormLastPlayedGames.ButtonSelectGameClick(Sender: TObject);
begin
  if FormMain.CheckSelected(LastPlayedList) then
     SelectGameToPlay(LastPlayedList.Selection.First, Boolean(TBitBtnEx(Sender).Tag = 1));
end;

procedure TFormLastPlayedGames.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #27 then
     ButtonClose.Click;
end;

procedure TFormLastPlayedGames.ResizeForm;
var
  iScreenWidth, iScreenHeight, ItemsLineCount, ItemsColumnCount, iDiff: Integer;
  ScrollBarsVisible: Boolean;

  function UpdateGamesColumnsTitle: Boolean;
  begin
    if Is4KMode then
       LabelTitleCaption.Left:= 16;

    LabelGameNameCaption.Left:= LastPlayedList.Header.Columns[0].Width+12; // 8+4
    LabelSoftwareTitleCaption.Left:= LastPlayedList.Header.Columns[0].Width+8+LastPlayedList.Header.Columns[1].Width+4;
    LabelLastPlayed.Left:= LastPlayedList.Header.Columns[0].Width+8+LastPlayedList.Header.Columns[1].Width+4+LastPlayedList.Header.Columns[2].Width;
    LabelTotalPlaytime.Left:= LastPlayedList.Header.Columns[0].Width+8+LastPlayedList.Header.Columns[1].Width+4+LastPlayedList.Header.Columns[2].Width+LastPlayedList.Header.Columns[3].Width;
  end;

begin
  // adjust both controls so the scrollbar doesn't show
  //iScreenWidth:= 1024;
  //iScreenHeight:= 768;
  iScreenWidth:= Screen.Width;
  iScreenHeight:= Screen.Height;

  ItemsColumnCount:= 19; // default columns count value!!!
  ItemsLineCount:= 4; // default lines count value!!!
  ScrollBarsVisible:= False;

  case iScreenWidth of
    2560, 3840:
      begin
        //ItemsColumnCount:= 18; // default columns count value!!!
        if (iScreenWidth = 2560) or ((iScreenWidth = 3840) and (not Is4KMode)) then //if not Is4KMode then
        begin
          IL_Systems.Width:= 68;
          IL_Systems.Height:= 68;
          Systems.CellSizes.Icon.Width:= 78;
          Systems.CellSizes.Icon.Height:= 105;

          Systems.Font.Name:= 'Verdana';
          Systems.Width:= (Systems.CellSizes.Icon.Width*ItemsColumnCount)+Systems.PaintInfoItem.Border+GetSystemMetrics(SM_CXVSCROLL);
          FormLastPlayedGames.ClientWidth:= Systems.CellSizes.Icon.Width*ItemsColumnCount;
          iDiff:= (Systems.CellSizes.Icon.Height*ItemsLineCount);
          Systems.Height:= iDiff;
          //PanelSystems.Height:= Systems.Height;

          PanelSystemsTitle.Top:= Systems.Height;
          PanelSystemsTitle.Width:= FormLastPlayedGames.ClientWidth;

          FormMain.Set4KPanelSpecs(PanelGames, 0, PanelSystemsTitle.Top+PanelSystemsTitle.Height, FormLastPlayedGames.ClientWidth, -1);
          FormLastPlayedGames.ClientHeight:= PanelBottom.Top+PanelBottom.Height;// {Systems.Height+PanelSystemsTitle.Height+PanelGames.Height+PanelBottom.Height;
          iDiff:= FormLastPlayedGames.ClientWidth-LastPlayedList.Width;
          LastPlayedList.Width:= FormLastPlayedGames.ClientWidth;
          LastPlayedList.Header.Columns[0].Width:= LastPlayedList.Header.Columns[0].Width+(iDiff div 2);
          LastPlayedList.Header.Columns[2].Width:= LastPlayedList.Header.Columns[2].Width+(iDiff div 2);
        end;

        UpdateGamesColumnsTitle;
      end;
    //3840: // no longer needed, enable "4K mode" for this... 
    //  begin
    //    IL_Systems.Width:= 128;
    //    IL_Systems.Height:= 128;
    //    Systems.CellSizes.Icon.Width:= 144;
    //    Systems.CellSizes.Icon.Height:= 174;
    //    UpdateGamesColumnsTitle;
    //  end;
  end;
  FormMain.LoadSystemsIcons(IL_Systems, False);
  FormMain.LoadNonArcadeSystemIcons(IL_Systems, False, False);

  case iScreenWidth of
    1024, 1152:
      begin
        ItemsColumnCount:= 16;
        ItemsLineCount:= 2;
        ScrollBarsVisible:= True;
      end;
  end;

  case iScreenHeight of
    720..960:
      begin
        ItemsLineCount:= 2;
        if iScreenHeight <> 900 then
           ScrollBarsVisible:= True;
      end;
    1024:
      begin
        ItemsLineCount:= 3;
      end;
  end;

  if ItemsColumnCount = 19 then
     begin
       //if not Is4KMode then
          begin
            Systems.Width:= Systems.Width+Systems.PaintInfoItem.Border+GetSystemMetrics(SM_CXVSCROLL);
            LastPlayedList.Width:= Systems.Width;
          end;
     end
  else
     begin
       FormLastPlayedGames.ClientWidth:= (Systems.CellSizes.Icon.Width*ItemsColumnCount);
       Systems.Width:= FormLastPlayedGames.ClientWidth+Systems.PaintInfoItem.Border+GetSystemMetrics(SM_CXVSCROLL);
       PanelSystemsTitle.Width:= FormLastPlayedGames.ClientWidth;
       PanelGames.Width:= FormLastPlayedGames.ClientWidth;
       iDiff:= LastPlayedList.Width;
       LastPlayedList.Width:= Systems.Width;
       iDiff:= LastPlayedList.Width-iDiff;
       case iScreenWidth of
         1024, 1152:
          begin
            LastPlayedList.Header.Columns[1].Width:= LastPlayedList.Header.Columns[1].Width-20;
            LastPlayedList.Header.Columns[4].Width:= LastPlayedList.Header.Columns[4].Width-5;
            LastPlayedList.Header.Columns[0].Width:= LastPlayedList.Header.Columns[0].Width+iDiff;
            UpdateGamesColumnsTitle;
          end;
       end;
     end;

  // use this to calculate the lines count depending on the visible systems count and the systems per line
  if (Systems.Groups.VisibleItemCount < (MaxArcadeSystems+MaxConsoleComputerSystems)) or (ItemsColumnCount <> 19) or (ItemsLineCount <> 4) then
     begin
        if ItemsLineCount = 4 then
           begin
             ItemsLineCount:= Systems.Groups.VisibleItemCount div ItemsColumnCount;
             if ItemsLineCount = 0 then
                ItemsLineCount:= 1
             else
                begin
                  if Systems.Groups.VisibleItemCount mod ItemsColumnCount <> 0 then
                     Inc(ItemsLineCount);
                end;
           end;

        if ItemsLineCount <> 4 then
           begin
             iDiff:= (Systems.CellSizes.Icon.Height*ItemsLineCount+8);
             Systems.Height:= iDiff;

             if PanelSystemsTitle.Visible then
                begin
                  PanelSystemsTitle.Top:= Systems.Top+Systems.Height;
                  PanelGames.Top:= PanelSystemsTitle.Top+PanelSystemsTitle.Height;
                end
             else
                PanelGames.Top:= Systems.Top+Systems.Height;
             FormLastPlayedGames.ClientHeight:= PanelGames.Top+PanelGames.Height+PanelBottom.Height;
           end;
        if Systems.Scrollbars.VertBarVisible then
           begin
             Systems.Width:= Systems.Width-2;//Systems.PaintInfoItem.Border; // must remove right border before the vertical scrollbar
             iDiff:= FormLastPlayedGames.ClientWidth;
             FormLastPlayedGames.ClientWidth:= Systems.Width;
             PanelSystemsTitle.Width:= FormLastPlayedGames.ClientWidth;
             PanelGames.Width:= FormLastPlayedGames.ClientWidth;
             iDiff:= FormLastPlayedGames.ClientWidth-iDiff;
             LastPlayedList.Width:= FormLastPlayedGames.ClientWidth+Systems.PaintInfoItem.Border+GetSystemMetrics(SM_CXVSCROLL);
             LastPlayedList.Header.Columns[0].Width:= LastPlayedList.Header.Columns[0].Width+iDiff;
           end;
     end;

  if not Is4KMode then
  begin
    if FormLastPlayedGames.Height > (iScreenHeight-55) then
       begin
         FormLastPlayedGames.Height:= iScreenHeight-55;
         PanelGames.Height:= FormLastPlayedGames.ClientHeight-Systems.Height{ PanelSystems.Height}-PanelSystemsTitle.Height-PanelSystemsTitle.Height-PanelBottom.Height;
         LastPlayedList.Height:= PanelGames.Height-PanelPlayedListHeader.Height;
       end;

    LastPlayedList.BeginUpdate;
    if (LastPlayedList.Scrollbars.VertBarVisible and ScrollBarsVisible) or LastPlayedList.Scrollbars.HorzBarVisible then
       begin
         LastPlayedList.Width:= FormLastPlayedGames.ClientWidth;
         if LastPlayedList.Scrollbars.HorzBarVisible then
            begin
              iDiff:= 0;
              for ItemsColumnCount:= 0 to LastPlayedList.Header.Columns.Count-1 do
                  iDiff:= iDiff+LastPlayedList.Header.Columns[ItemsColumnCount].Width;

              iDiff:= iDiff-LastPlayedList.Width;
              if iDiff > 0 then
                 LastPlayedList.Header.Columns[0].Width:= LastPlayedList.Header.Columns[0].Width-iDiff-(LastPlayedList.BorderWidth*2);//LastPlayedList.PaintInfoItem.Border;
            end;
         if LastPlayedList.Scrollbars.VertBarVisible then
            begin
              if iScreenHeight < 900 then
                 begin
                   LastPlayedList.HotTrack.Enabled:= False;
                   LastPlayedList.Header.Columns[0].Width:= LastPlayedList.Header.Columns[0].Width-GetSystemMetrics(SM_CXVSCROLL);
                 end
              else
                 LastPlayedList.Header.Columns[0].Width:= LastPlayedList.Header.Columns[0].Width-(LastPlayedList.BorderWidth*4);
            end;
         UpdateGamesColumnsTitle;
       end;
    LastPlayedList.EndUpdate;

    ButtonSelectGameExit.Left:= (PanelBottom.Width div 2) - (ButtonSelectGameExit.Width div 2);
    ButtonSelectGame.Left:= ButtonSelectGameExit.Left-ButtonSelectGame.Width-6;
    ButtonClose.Left:= ButtonSelectGameExit.Left+ButtonSelectGameExit.Width+6;

    LabelSystemTitle.Left:= (PanelSystemsTitle.Width-LabelSystemTitle.Width) div 2;
  end;
end;

procedure TFormLastPlayedGames.FormShow(Sender: TObject);
begin
  FormMain.ELV_ResetNormalColors(Systems);
  FormMain.ELV_ResetNormalColors(LastPlayedList);

  Resize4K;

  if IsNightMode then
     begin
       if Is4KMode then
          FormLastPlayedGames.Color:= clrBlackBk
       else
          FormLastPlayedGames.Color:= menu_background_color[1];

       //PanelSystems.Color1:= clrBlackBk;
       FormMain.SetEasyListViewColors(Systems, clrBlackBk, clWhite);

       PanelGames.Color1:= menu_background_color[1];

       if PanelSystemsTitle.Visible then
          begin
            FormMain.SetSystemTitleLabelColors(LabelSystemTitle);
            FormMain.SetSystemTypeLabelColors(LabelSystemType);
          end;

       SetLabelColors(LabelTitleCaption,         clWhite, clNavy);
       SetLabelColors(LabelGameNameCaption,      clWhite, clNavy);
       SetLabelColors(LabelSoftwareTitleCaption, clWhite, clNavy);
       SetLabelColors(LabelLastPlayed,           clWhite, clNavy);
       SetLabelColors(LabelTotalPlaytime,        clWhite, clNavy);

       if PanelSystemsTitle.Visible then
          SetSystemTitleBarNightColors(PanelSystemsTitle, PanelPlayedListHeader)
       else
          SetSystemTitleBottomBarNightColors(PanelPlayedListHeader);

       FormMain.SetEasyListViewColors(LastPlayedList, menu_background_color[1], item_caption_active_color[1]);

       FormMain.SetButtonExColors(ButtonSelectGame);
       FormMain.SetButtonExColors(ButtonSelectGameExit);
       FormMain.SetButtonExColors(ButtonClose);

       SetBottomPanelColors(PanelBottom);

       FormMain.ELV_SetNightModeColors(Systems);
       FormMain.SetEasyListViewHeaderColors(LastPlayedList, True, False, False);
       FormMain.ELV_SetRibbonNightColors(0, LastPlayedList, True);

       FormMain.SetWin10DarkScrollBar(Systems);
       FormMain.SetWin10DarkScrollBar(LastPlayedList);
     end;

  LastSelectedStateImageIndex:= -5; // set to "unknown" or "not set"
  AddGamesMRU;
  FillGameDataFromMainGamesList;
  LoadSystemsFilter;
  ResizeForm;
  FormLastPlayedGames.Tag:= 1;
  FormMain.HideFilterMsgBox;
  if Systems.Selection.Count = 1 then
     Systems.OnItemSelectionChanged(Systems, Systems.Selection.First);
  Systems.SetFocus;
end;

procedure TFormLastPlayedGames.SystemsItemSelectionChanged(
  Sender: TCustomEasyListview; Item: TEasyItem);
var
  newSysTag: Integer;
begin
  if FormLastPlayedGames.Tag = 0 then
     Exit;
  if Item.Selected then
     begin
       newSysTag:= FormMain.ELV_GetSystemTagMulti(Systems);
       if (newsysTag <> Systems.Tag) or (LastSelectedStateImageIndex <> Item.StateImageIndex) then
          begin
            Systems.Tag:= newSysTag;
            LastSelectedStateImageIndex:= Item.StateImageIndex;
            FormMain.ELV_GetSystemTitle(Systems, Item, LabelSystemTitle, LabelSystemType);
            FilterMRUGames(Systems.Tag, FormMain.ELV_IsArcadeSystemMulti(Item));

            if FormMain.ELV_IsArcadeSystemMulti(Item) then
               begin
                 if not LastPlayedList.Header.Columns[2].Visible then
                    begin
                      LabelGameNameCaption.Caption:= 'Game Name';
                      LabelSoftwareTitleCaption.Visible:= True;
                      LastPlayedList.BeginUpdate;
                      LastPlayedList.Header.Columns[1].Width:= LastPlayedList.Header.Columns[1].Width-LastPlayedList.Header.Columns[2].Width; //-100;
                      LastPlayedList.Header.Columns[2].Visible:= True;
                      LastPlayedList.EndUpdate;
                    end
               end
            else
               begin
                 if LastPlayedList.Header.Columns[2].Visible then
                    begin
                      LabelGameNameCaption.Caption:= 'Game File';
                      LabelSoftwareTitleCaption.Visible:= False;
                      LastPlayedList.BeginUpdate;
                      LastPlayedList.Header.Columns[1].Width:= LastPlayedList.Header.Columns[1].Width+LastPlayedList.Header.Columns[2].Width;//+100;
                      LastPlayedList.Header.Columns[2].Visible:= False;
                      LastPlayedList.EndUpdate;
                    end;
               end;
          end;
     end;
end;

procedure TFormLastPlayedGames.LastPlayedListKeyAction(
  Sender: TCustomEasyListview; var CharCode: Word; var Shift: TShiftState;
  var DoDefault: Boolean);
begin
  if Charcode = VK_RETURN then
     ButtonSelectGame.Click;
end;

procedure TFormLastPlayedGames.LastPlayedListDblClick(
  Sender: TCustomEasyListview; Button: TCommonMouseButton;
  MousePos: TPoint; ShiftState: TShiftState; var Handled: Boolean);
begin
  ButtonSelectGame.Click;
end;

procedure TFormLastPlayedGames.LastPlayedListItemPaintText(
  Sender: TCustomEasyListview; Item: TEasyItem; Position: Integer;
  ACanvas: TCanvas);
begin
  {if LastPlayedList.View = elsTile then
     begin
       if Position = 1 then
          begin
            ACanvas.Font.Name:= 'Verdana';
            ACanvas.Font.Size:= 8;
            //ACanvas.Font.Color:= clGray;
          end;
     end;}
  //if Item.Index mod 2 = 1 then
  //   ACanvas.Font.Color:= clrDarkGrey;
end;

procedure TFormLastPlayedGames.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  LastPlayedList.Selection.ClearAll;
  FormMain.ClearListView(LastPlayedList);
  FormMain.ClearListView(Systems);
end;

procedure TFormLastPlayedGames.SystemsItemPaintText(
  Sender: TCustomEasyListview; Item: TEasyItem; Position: Integer;
  ACanvas: TCanvas);
begin
  FormMain.ELV_SetGhostedIconText(Item, Systems, ACanvas);
end;

procedure TFormLastPlayedGames.LastPlayedListItemSelectionChanged(
  Sender: TCustomEasyListview; Item: TEasyItem);
begin
  if Item.Selected then
     begin
       if IsNightMode then
          FormMain.ELV_SetRibbonNightColors(TPlayedGameInfo(Item).eGameSetStatus, LastPlayedList)
       else
          FormMain.ELV_SetSelectRibbon(TPlayedGameInfo(Item).eGameSetStatus, LastPlayedList);
     end;
end;

procedure TFormLastPlayedGames.SystemsItemImageDraw(
  Sender: TCustomEasyListview; Item: TEasyItem; Column: TEasyColumn;
  ACanvas: TCanvas; const RectArray: TEasyRectArrayObject;
  AlphaBlender: TEasyAlphaBlender);
begin
  //Exit; // debugging
  if not Is4KMode then
     Exit;

  FormMain.ELV_DrawIconSystem_CustomSysType(Sender, Item, Column, ACanvas, RectArray, IL_Systems, True);
end;

procedure TFormLastPlayedGames.SystemsItemImageDrawIsCustom(
  Sender: TCustomEasyListview; Item: TEasyItem; Column: TEasyColumn;
  var IsCustom: Boolean);
begin
  //Exit; // debugging
  if Is4KMode then
     IsCustom:= True;
end;

procedure TFormLastPlayedGames.SystemsItemImageGetSize(
  Sender: TCustomEasyListview; Item: TEasyItem; Column: TEasyColumn;
  var ImageWidth, ImageHeight: Integer);
begin
  //Exit; // debugging
  if Is4KMode then
     begin
       ImageWidth:=  IL_Systems.Width;            // 4K mode = 32x32  - normal mode = 16x16
       ImageHeight:= IL_Systems.Height+FormMain.IL_GroupedMode.Width+4; // 4 -> space between sys icon / sys type icon
     end;
end;

end.
