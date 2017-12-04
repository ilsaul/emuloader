unit uLastPlayedGamesMega;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  StdCtrls, ComCtrls, ImgList, MPCommonObjects, MPCommonUtilities,
  EasyListview, ExtCtrls, PanelEx, Buttons, ShadowLabel, IniFiles,
  SplitterEx, Menus, BarMenus;

type
  TPlayedGameInfo = class(TEasyItemStored)
  private
    fSystemID: ShortInt;
    fSystemType: ShortInt;
    fCustomSystemID: ShortInt;
    fCustomMediaType: ShortInt;
    fIsUnicode: Boolean;
    fTitle: WideString;
    fName: WideString;
    fMediaType: ShortInt;
    fSoftwareName: String;
    fSoftwareExecParam: String;

    fIsFavorite: Boolean;
    fPlayed: Cardinal;
    fPlayedDate: Integer;
    fPlayedDateText: String;
    fTotalPlaytime: Int64;
    fTotalPlaytimeText: String;

    fIsCustomGame: Boolean;
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
    property eName: WideString read fName write fName;
    property eMediaType: ShortInt read fMediaType write fMediaType;
    property eSoftwareName: String read fSoftwareName write fSoftwareName;
    property eSoftwareExecParam: String read fSoftwareExecParam write fSoftwareExecParam;
    property eIsFavorite: Boolean read fIsFavorite write fIsFavorite;
    property ePlayed: Cardinal read fPlayed write fPlayed;
    property ePlayedDate: Integer read fPlayedDate write fPlayedDate;
    property ePlayedDateText: String read fPlayedDateText write fPlayedDateText; // formatted last played in "00:00:00 Feb 03, 2014"
    property eTotalPlaytime: Int64 read fTotalPlaytime write fTotalPlaytime; // total playtime in milliseconds
    property eTotalPlaytimeText: String read fTotalPlaytimeText write fTotalPlaytimeText; // formatted playtime in "x days, 00:00:00" format
    property eIsCustomGame: Boolean read fIsCustomGame write fIsCustomGame;
  end;

type
  TFormLastPlayedGamesMega = class(TForm)
    PanelGames: TPanelEx;
    LastPlayedList: TEasyListview;
    IL_Systems: TImageList;
    PanelBottomButtons: TPanelEx;
    ButtonSelectGame: TBitBtn;
    ButtonClose: TBitBtn;
    PanelPlayedListHeader: TPanelEx;
    LabelTitleCaption: TLabel;
    LabelLastPlayed: TLabel;
    LabelTotalPlaytime: TLabel;
    PanelSystems: TPanelEx;
    Systems: TEasyListview;
    LabelSystemTitle: TShadowLabel;
    LabelSystemType: TShadowLabel;
    Label1: TLabel;
    ButtonSelectGameExit: TBitBtn;
    PopupLastPlayed: TBcBarPopupMenu;
    PopupDetailsView: TMenuItem;
    PopupTilesView: TMenuItem;
    N1: TMenuItem;
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
    procedure FormResize(Sender: TObject);
    procedure PopupLastPlayedMeasureMenuItem(Sender: TObject;
      AMenuItem: TMenuItem; ACanvas: TCanvas; var Width, Height: Integer;
      ABarVisible: Boolean; var DefaultMeasure: Boolean);
    procedure PopupDetailsViewClick(Sender: TObject);
  private
    { Private declarations }
    procedure LoadSystemsFilter;
    procedure AddGamesMRU;
    procedure FilterMRUGames(SystemID: Byte; IsCustomGame: Boolean);
    procedure SelectGameToPlay(Item_Source: TEasyItem; ExitDialog: Boolean);
    procedure ResizeForm;
  public
    { Public declarations }
  end;

var
  FormLastPlayedGamesMega: TFormLastPlayedGamesMega;

implementation

uses uCommon, uCommonCustom, uMain;

{$R *.dfm}

function TPlayedGameInfo.GetCaptions(Column: Integer): WideString;
var
  strMediaType: String;
begin
  //strSize:= FormMain.MountSizeString(eMediaType, eGameSize);
  //strMediaType:= MediaTypeArray[eMediaType, 0]; // MediaType[] or MediaTypeCustom[]
  case Column of
    0: Result:= eTitle;
    1: Result:= eSoftwareName;
    2: Result:= ePlayedDateText;
    3:
      begin
        if FormLastPlayedGamesMega.LastPlayedList.Header.Columns[2].Visible then
           Result:= eTotalPlaytimeText+' ('+IntToStr(ePlayed)+'x)';
      end;
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
    //1: GetDateTimeStr(TEasyGameInfo(addItem).ePlayedDate, True, FormPreferences.LastPlayedHideSeconds.Checked);
    {1: Result:= strSize;
    2: Result:= strMediaType;
    3: Result:= SystemsList[eSystemID, 0];
    20: // for tiles view
      begin
        if StrSize <> '' then
           Result:= strSize+' '+strMediaType
        else
           Result:= strMediaType;
      end;}
  end;
end;

function TPlayedGameInfo.GetImageIndexes(Column: Integer): TCommonImageIndexInteger;
begin
  // this one uses the uMain.IL_LeftPanel TImageList
  if Column = 0 then
     begin
       if eIsCustomGame then
       begin
         case eCustomMediaType of
           00: Result:= 15; // ROM
           01: Result:= 16; // Cartridge
           03: Result:= 17; // Floppy Disk
           04: Result:= 18; // Cassette Tape
           05: Result:= 19; // HDD... is there any game ROMs with region="hdd" ???? not sure but better to have this here!!!
           02: Result:= 20; // Disc Image
          //18, 19, 20: Item.ImageIndex:= 21; // Compact Flash Card (but it's not a CHD file)... "Konami System 573"
         end;
       end
       else
       begin
         Result:= FormMain.GetMediaTypeIconMsgBox(-1, False, eMediaType, nil, eSoftwareExecParam);
         //case eMediaType of
         //  00: Result:= 15; // ROM
         //  01: Result:= 19; // CHD
         //end;
       end;
     end
  else
     Result:= -1;
end;

procedure TFormLastPlayedGamesMega.LoadSystemsFilter;
begin
  //FormMain.ELV_PopulateSystems(Systems, -1, -1, True); // for debugging only!!!!
  //Exit;
  //ELV_PopulateCustomSystems(Systems, -1, 2, True);

                                                         // False -> it should hide systems without last played games lists
  FormMain.ELV_PopulateSystemsMulti(Systems, 2, True, True, False);
  FormMain.ELV_FindSelectedSystemMulti(Systems, FormMain.SelectedEasyItem, False);

  //FormMain.ELV_SelectItem(Systems, 0);
end;

procedure TFormLastPlayedGamesMega.AddGamesMRU;
var
  addItem: TEasyItem;
  SysLoop, Loop: ShortInt;
  ValueStr, UnicodeFileName, StrToSearch: String;
  PlayedList: THashedStringList;
  iGameTitle, iGameName: WideString;
  iMediaType: Integer;
  iSoftwareExecParam: String;
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
         for Loop:= 0 to 24 do //PlayedList.Count-1 do
         begin
           if (Loop <= TotalLines) and (PlayedList[Loop] <> '') then
             begin
               iGameTitle:= SoftListGetEntryValue(PlayedList[Loop], 'title');
               iGameTitle:= FormMain.DecodeUnicodeStr(iGameTitle);

               ValueStr:= SoftListGetEntryValue(PlayedList[Loop], 'media');
               iMediaType:= 0;
               if ValueStr <> '' then
                  iMediaType:= StrToInt(ValueStr);

               StrToSearch:= '';
               UnicodeFileName:= PlayedList.Names[Loop];

               iPlayed:= PosEx('\', UnicodeFileName);
               if iPlayed <> 0 then
                  begin
                    StrToSearch:= UnicodeFileName;
                    UnicodeFileName:= Copy(UnicodeFileName, iPlayed+1, Length(UnicodeFileName)); // this will hold the MAME softwarelist name
                    Delete(StrToSearch, iPlayed, Length(StrToSearch));
                  end;

               if iGameTitle = '' then
                  iGameTitle:= UnicodeFileName;

               iSoftwareExecParam:= SoftListGetEntryValue(PlayedList[Loop], 'execparam');

               iPlayed:= 0;
               ValueStr:= PlayedList.ValueFromIndex[Loop];
               FormMain.GetPlayedGameInfoIni(ValueStr, iPlayed, iLastPlayed, iTotalPlaytime);

               addItem:= LastPlayedList.Items.AddCustom(TPlayedGameInfo, nil);
               TPlayedGameInfo(addItem).eSystemID:= SysLoop;
               TPlayedGameInfo(addItem).eCustomSystemID:= -1;

               TPlayedGameInfo(addItem).eIsCustomGame:= False;
               TPlayedGameInfo(addItem).eIsUnicode:= False;

               TPlayedGameInfo(addItem).eTitle:= iGameTitle;

               TPlayedGameInfo(addItem).eName:= UnicodeFileName;
               TPlayedGameInfo(addItem).eSoftwareName:= StrToSearch;
               TPlayedGameInfo(addItem).eSoftwareExecParam:= iSoftwareExecParam;

               TPlayedGameInfo(addItem).eCustomMediaType:= -1;
               TPlayedGameInfo(addItem).eMediaType:= iMediaType;

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
                  addItem.StateImageIndex:= 10
               else
                  addItem.StateImageIndex:= 500; // bogus image index to show an empty space

               addItem.Details[1]:= 10;
               addItem.Details[2]:= 11;

               //addItem.Visible:= False;
               //if Loop > 23 then // indexes are from 0 to 24
               //   Break;
             end;
         end;
         FreeAndNil(PlayedList);
       end;
  end;

  for SysLoop:=1 to MaxConsoleComputerSystems do
  begin
    //error... need to create a proper function to read played info from file (both arcade and console/computer)
    if FileExists(GetCustomGamePlayedFile(SysLoop)) then
       begin
         PlayedList:= THashedStringList.Create;
         PlayedList.LoadFromFile(GetCustomGamePlayedFile(SysLoop));
         TotalLines:= PlayedList.Count-1;
         for Loop:= 0 to 24 do //PlayedList.Count-1 do
         begin
           // need to get the custom title for the new EmuCon games editor... still in development
           // will use game filename for now...
           if (Loop <= TotalLines) and (PlayedList[Loop] <> '') then
              begin
               UnicodeFileName:= SoftListGetEntryValue(PlayedList[Loop], 'file');
               iGameTitle:= UnicodeFileName;
               iGameTitle:= ChangeFileExtW(iGameTitle, '');
               iGameTitle:= FormMain.DecodeUnicodeStr(iGameTitle);

               ValueStr:= PlayedList[Loop];
               //FormMain.GetPlayedGameInfoIni(tStr, TempGameVars.ePlayed, TempGameVars.ePlayedDate, TempGameVars.eTotalPlaytime);
               GetPlayedGameInfoIniCustom(ValueStr, iPlayed, iLastPlayed, iTotalPlaytime);

               Delete(ValueStr, 1, PosEx('/>', ValueStr)+1);
               addItem:= LastPlayedList.Items.AddCustom(TPlayedGameInfo, nil);
               TPlayedGameInfo(addItem).eSystemID:= -1; // use this to avoid mixing things up ??? (October 26, 2017)
               TPlayedGameInfo(addItem).eCustomSystemID:= SysLoop;

               // <file>Game_filename/> MediaType_ID IsUnicode TimesPlayed;PlayedDate;TotalPlayTime
               //                             1          2
               TPlayedGameInfo(addItem).eIsCustomGame:= True;
               TPlayedGameInfo(addItem).eIsUnicode:= ValueStr[2] = '1'; // 0 -> ANSI; 1 -> Unicode

               TPlayedGameInfo(addItem).eTitle:= iGameTitle;
               TPlayedGameInfo(addItem).eName:= FormMain.DecodeUnicodeStr(UnicodeFileName);
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
                  addItem.StateImageIndex:= 10
               else
                  addItem.StateImageIndex:= 500; // bogus image index to show an empty space

               addItem.Details[1]:= 10;
               addItem.Details[2]:= 11;
               //addItem.Visible:= False;
               //if Loop > 23 then // indexes are from 0 to 24
               //   Break;
              end;
         end;
         FreeAndNil(PlayedList);
       end;
  end;
  LastPlayedList.Items.ReIndexDisable:= False;
  LastPlayedList.EndUpdate(False);
  FreeAndNil(FavoriteList);
end;

procedure TFormLastPlayedGamesMega.FilterMRUGames(SystemID: Byte; IsCustomGame: Boolean);
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

procedure TFormLastPlayedGamesMega.SelectGameToPlay(Item_Source: TEasyItem; ExitDialog: Boolean);
var
  Item_MainGamesList: TEasyItem;
begin
  FormMain.FindGameName(TPlayedGameInfo(Item_Source).eName, Systems.Tag, TPlayedGameInfo(Item_Source).eIsCustomGame,
                        TPlayedGameInfo(Item_Source).eSoftwareName, Item_MainGamesList, False);

  if Item_MainGamesList = nil then
     begin
       GenerateMessage('Info', 'Last played games.', '   Could not select this game in main games list.'+#13#10+
                       'It''s either not visible due to filters or it doesn''t exist.');
       Exit; // game was not found or is not visible due to main tool bar filters
     end;

  FormMain.SelectEasyItem(Item_MainGamesList);
  if ExitDialog then
     Close;
end;

procedure TFormLastPlayedGamesMega.ButtonSelectGameClick(Sender: TObject);
var
  Item: TEasyItem;
begin
  if FormMain.CheckSelected(LastPlayedList) then
     SelectGameToPlay(LastPlayedList.Selection.First, Boolean(TBitBtn(Sender).Tag = 1));
end;

procedure TFormLastPlayedGamesMega.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #27 then
     ButtonClose.Click;
end;

procedure TFormLastPlayedGamesMega.ResizeForm;
var
  ScreenWidth, ScreenHeight, ItemsLineCount, ItemsColumnCount, iDiff: Integer;
  ScrollBarsVisible: Boolean;
begin
  // adjust both controls so the scrollbar doesn't show
  //ScreenWidth:= 1680;
  //ScreenHeight:= 1050;
  ScreenWidth:= Screen.Width;
  ScreenHeight:= Screen.Height;
  ItemsColumnCount:= 19; // default columns count value!!!
  ItemsLineCount:= 4; // default lines count value!!!
  ScrollBarsVisible:= False;

  //Form ClientWidth:= 1202

  case ScreenWidth of
    1024, 1152: // 1024x768 (4:3) // 1152x864 (4:3)
      begin
        ItemsColumnCount:= 16;
        ItemsLineCount:= 2;
        ScrollBarsVisible:= True;
      end;
  end;

  case ScreenHeight of
    720, 768, 864, 900:
      begin
        ItemsLineCount:= 2;
        ScrollBarsVisible:= True;
      end;
  end;

  if ItemsColumnCount = 19 then
     begin
       Systems.Width:= Systems.Width+Systems.PaintInfoItem.Border+GetSystemMetrics(SM_CXVSCROLL);
       LastPlayedList.Width:=LastPlayedList.Width+LastPlayedList.PaintInfoItem.Border+GetSystemMetrics(SM_CXVSCROLL);
     end
  else
     Systems.Width:= (Systems.CellSizes.Icon.Width*ItemsColumnCount)+Systems.PaintInfoItem.Border+GetSystemMetrics(SM_CXVSCROLL);

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
             iDiff:= (Systems.CellSizes.Icon.Height*ItemsLineCount);
             Systems.Height:= iDiff;
             PanelSystems.Height:= Systems.Height+LabelSystemTitle.Height;
             FormLastPlayedGamesMega.ClientHeight:= PanelSystems.Height+PanelGames.Height+PanelBottomButtons.Height;
           end;
        if Systems.Scrollbars.VertBarVisible then
           begin
             Systems.Width:= Systems.Width-2;//Systems.PaintInfoItem.Border; // must remove right border before the vertical scrollbar!!!
             FormLastPlayedGamesMega.ClientWidth:= Systems.Width;
           end;
     end;

  if FormLastPlayedGamesMega.Height > (ScreenHeight-55) then
     begin
       FormLastPlayedGamesMega.Height:= ScreenHeight-55;
       PanelGames.Height:= FormLastPlayedGamesMega.ClientHeight-PanelSystems.Height-PanelBottomButtons.Height;
       LastPlayedList.Height:= PanelGames.Height-PanelPlayedListHeader.Height;
     end;

  if LastPlayedList.Scrollbars.VertBarVisible then
     begin
       LastPlayedList.Header.Columns[0].Width:= LastPlayedList.Header.Columns[0].Width-GetSystemMetrics(SM_CXVSCROLL);
       LastPlayedList.Width:= FormLastPlayedGamesMega.ClientWidth;
     end;
end;

procedure TFormLastPlayedGamesMega.FormShow(Sender: TObject);
begin
  FormMain.ELV_ResetNormalColors(Systems);
  FormMain.ELV_ResetNormalColors(LastPlayedList);

  FormMain.LoadSystemsIcons(IL_Systems, False);
  FormMain.LoadNonArcadeSystemIcons(IL_Systems, False, False);

  AddGamesMRU;
  LoadSystemsFilter;
  ResizeForm;
  Systems.SetFocus;
end;

procedure TFormLastPlayedGamesMega.SystemsItemSelectionChanged(
  Sender: TCustomEasyListview; Item: TEasyItem);
var
  newSysTag: Integer;
begin
  if Item.Selected then
     begin
       newSysTag:= FormMain.ELV_GetSystemTagMulti(Systems);
       if newsysTag <> Systems.Tag then
          begin
            Systems.Tag:= newSysTag;
            FormMain.ELV_GetSystemTitle(Systems, Item, LabelSystemTitle, LabelSystemType);
            FilterMRUGames(Systems.Tag, FormMain.ELV_IsArcadeSystemMulti(Item));
          end;
     end;
end;

procedure TFormLastPlayedGamesMega.LastPlayedListKeyAction(
  Sender: TCustomEasyListview; var CharCode: Word; var Shift: TShiftState;
  var DoDefault: Boolean);
begin
  if Charcode = VK_RETURN then
     ButtonSelectGame.Click;
end;

procedure TFormLastPlayedGamesMega.LastPlayedListDblClick(
  Sender: TCustomEasyListview; Button: TCommonMouseButton;
  MousePos: TPoint; ShiftState: TShiftState; var Handled: Boolean);
begin
  ButtonSelectGame.Click;
end;

procedure TFormLastPlayedGamesMega.LastPlayedListItemPaintText(
  Sender: TCustomEasyListview; Item: TEasyItem; Position: Integer;
  ACanvas: TCanvas);
begin
  if LastPlayedList.View = elsTile then
     begin
       if Position = 1 then
          begin
            ACanvas.Font.Name:= 'Verdana';
            ACanvas.Font.Size:= 8;
            //ACanvas.Font.Color:= clGray;
          end;
     end;
  //if Item.Index mod 2 = 1 then
  //   ACanvas.Font.Color:= $00323232;
end;

procedure TFormLastPlayedGamesMega.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  LastPlayedList.Selection.ClearAll;
  FormMain.ClearListView(LastPlayedList);
  FormMain.ClearListView(Systems);
end;

procedure TFormLastPlayedGamesMega.SystemsItemPaintText(
  Sender: TCustomEasyListview; Item: TEasyItem; Position: Integer;
  ACanvas: TCanvas);
begin
  FormMain.ELV_SetGhostedIconText(Item, Systems, ACanvas);
end;

procedure TFormLastPlayedGamesMega.FormResize(Sender: TObject);
begin
  //FormLastPlayedGamesMega.Caption:= IntToStr(FormLastPlayedGamesMega.Width)+'x'+IntToStr(FormLastPlayedGamesMega.Height)+
  //                    '-> client: '+IntToStr(FormLastPlayedGamesMega.ClientWidth)+'x'+IntToStr(FormLastPlayedGamesMega.ClientHeight);
end;

procedure TFormLastPlayedGamesMega.PopupLastPlayedMeasureMenuItem(
  Sender: TObject; AMenuItem: TMenuItem; ACanvas: TCanvas; var Width,
  Height: Integer; ABarVisible: Boolean; var DefaultMeasure: Boolean);
begin
  FormMain.SetPopupMenuMeasureItem(AMenuItem, ACanvas, Width, Height);
end;

procedure TFormLastPlayedGamesMega.PopupDetailsViewClick(Sender: TObject);
begin
  if TMenuItem(Sender).Tag = 0 then
     LastPlayedList.View:= elsReport
  else
     LastPlayedList.View:=elsTile ;
end;

end.
