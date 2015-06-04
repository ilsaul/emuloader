unit uMultiSlotGames;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, MPCommonObjects, EasyListview, PanelEx;

type
  TMultiGameInfo = class(TEasyItemStored)
  private
    fImageIndex: Integer;
    fROMIdentification: Integer;
    fSystemID: Integer;
    fTitle: String;
    fYear: String;
    //fManufacturer: String;
  
    fDriverStatus: ShortInt;
    fEmulationStatus: ShortInt;
    fColorStatus: ShortInt;
    fSoundStatus: ShortInt;
    fGraphicStatus: ShortInt;

    fName: String;
    fClone: String;
    fDriverName: String;
    fBiosName: String;

    fNumberPlayers: String;    
    fPlayed: Cardinal;
    fPlayedDate: Integer; //Int64;
    fPlayedDateText: String;
    //fTotalPlaytime: Int64;
    //fTotalPlaytimeText: String;

    fIsFavorite: Boolean;
    fGameSetStatus: ShortInt;
  protected
    function GetCaptions(Column: Integer): WideString; override;
    function GetImageIndexes(Column: Integer): TCommonImageIndexInteger; override;
    function GetStateImageIndexes(Column: Integer): TCommonImageIndexInteger; override;
  public
    property eImageIndex: Integer read fImageIndex write fImageIndex;
    property eROMIdentification: Integer read fROMIdentification write fROMIdentification;
    property eSystemID: Integer read fSystemID write fSystemID;
    property eTitle: String read fTitle write fTitle;
    property eYear: String read fYear write fYear;
    //property eManufacturer: String read fManufacturer write fManufacturer;

    property eDriverStatus: ShortInt read fDriverStatus write fDriverStatus;
    property eEmulationStatus: ShortInt read fEmulationStatus write fEmulationStatus;
    property eColorStatus: ShortInt read fColorStatus write fColorStatus;
    property eSoundStatus: ShortInt read fSoundStatus write fSoundStatus;
    property eGraphicStatus: ShortInt read fGraphicStatus write fGraphicStatus;

    property eName: String read fName write fName;
    property eClone: String read fClone write fClone;
    property eDriverName: String read fDriverName write fDriverName;
    property eBiosName: String read fBiosName write fBiosName;
    property eNumberPlayers: String read fNumberPlayers write fNumberPlayers;

    property ePlayed: Cardinal read fPlayed write fPlayed;
    property ePlayedDate: Integer {Int64} read fPlayedDate write fPlayedDate;
    property ePlayedDateText: String read fPlayedDateText write fPlayedDateText; // formatted last played in "00:00:00 Feb 03, 2014"
    //property eTotalPlaytime: Int64 read fTotalPlaytime write fTotalPlaytime; // total playtime in milliseconds
    //property eTotalPlaytimeText: String read fTotalPlaytimeText write fTotalPlaytimeText; // formatted playtime in "x days, 00:00:00" format

    property eIsFavorite: Boolean read fIsFavorite write fIsFavorite;
    property eGameSetStatus: ShortInt read fGameSetStatus write fGameSetStatus; // 0 - have or miss; 1 - missing ROMs/CHDs; 2 - missing (no .zip and no ROMs found)
  end;

type
  TFormMultiSlotGames = class(TForm)
    GamesList: TEasyListview;
    PanelSlots: TPanelEx;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    PanelEx1: TPanelEx;
    ButtonOk: TBitBtn;
    ButtonNo: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure GamesListItemPaintText(Sender: TCustomEasyListview;
      Item: TEasyItem; Position: Integer; ACanvas: TCanvas);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure GamesListColumnPaintText(Sender: TCustomEasyListview;
      Column: TEasyColumn; ACanvas: TCanvas);
    procedure GamesListItemSelectionChanged(Sender: TCustomEasyListview;
      Item: TEasyItem);
  private
    { Private declarations }
    HaveFavorites: Boolean;
    procedure AddMultiGames;
    procedure AdjustSize;
  public
    { Public declarations }
  end;

var
  FormMultiSlotGames: TFormMultiSlotGames;

implementation

uses uMain;

{$R *.dfm}

function TMultiGameInfo.GetCaptions(Column: Integer): WideString;
var
  iStr: String;
begin
  case Column of
    00: Result:= eTitle;
    01: Result:= eName;
    02: Result:= eClone;
    03: 
      begin
        iStr:= '9999x';
        //if ePlayed <> 0 then
        //   iStr:= IntToStr(ePlayed)+'x';
        if ePlayedDateText <> '' then
           begin
             if iStr <> '' then
                iStr:= iStr+' ';
             iStr:= iStr+ePlayedDateText;
             Result:= iStr;
           end;
      end;
    04: Result:= eNumberPlayers;
    05: Result:= eYear;
    06: Result:= '';
  end;
end;

function TMultiGameInfo.GetImageIndexes(Column: Integer): TCommonImageIndexInteger;
begin
  case Column of
    0: Result:= eImageIndex;
  else
     Result:= -1;
  end;
end;

function TMultiGameInfo.GetStateImageIndexes(Column: Integer): TCommonImageIndexInteger;
begin
  Result:= -1;
  case Column of
    00:
      begin
        if FormMultiSlotGames.HaveFavorites then
           if eIsFavorite then
              Result:= 3
           else
              Result:= 50;
      end;
    06: Result:= eDriverStatus;
  end;
end;

procedure TFormMultiSlotGames.AddMultiGames;
var
  selectedItem, addItem: TEasyItem;
  HaveClones, HavePlayed: Boolean;
  iLoop, iTotalW: Integer;

  procedure SetColAutoFit(ColumnIndex: Integer);
  var
    MinSize: Byte;
  begin
    if not GamesList.Header.Columns[ColumnIndex].Visible then
       Exit;
    GamesList.Header.Columns[ColumnIndex].AutoSizeToFit;
    GamesList.Header.Columns[ColumnIndex].Width:= GamesList.Header.Columns[ColumnIndex].Width-GamesList.ImagesSmall.Width;
    case ColumnIndex of
      1: MinSize:= 39;
      2: MinSize:= 52;
      3: MinSize:= 44;
      4: MinSize:= 47;
      //5: MinSize:= 34;
    end;
    if GamesList.Header.Columns[ColumnIndex].Width < MinSize then
       GamesList.Header.Columns[ColumnIndex].Width:= MinSize;
  end;

begin
  HaveFavorites:= False;
  HaveClones:= False;
  HavePlayed:= False;
  FormMain.ClearListView(GamesList);
  GamesList.BeginUpdate;
  GamesList.Items.ReIndexDisable:= True;

  selectedItem:= FormMain.GamesListView.Selection.First;
  repeat
    //FormMain.FillTempGameInfo(selectedItem);
    //FormMain.TempGameVars
    addItem:= GamesList.Items.AddCustom(TMultiGameInfo, nil);
    TMultiGameInfo(addItem).eImageIndex:= uMain.TEasyGameInfo(selectedItem).eROMIdentification;// eImageIndex;
    TMultiGameInfo(addItem).eROMIdentification:= uMain.TEasyGameInfo(selectedItem).eROMIdentification;
    TMultiGameInfo(addItem).eSystemID:= uMain.TEasyGameInfo(selectedItem).eSystemID;
    TMultiGameInfo(addItem).eTitle:= uMain.TEasyGameInfo(selectedItem).eTitle;
    TMultiGameInfo(addItem).eYear:= uMain.TEasyGameInfo(selectedItem).eYear;
    //TMultiGameInfo(addItem).eManufacturer:= uMain.TEasyGameInfo(selectedItem).eManufacturer;
    TMultiGameInfo(addItem).eDriverStatus:= uMain.TEasyGameInfo(selectedItem).eDriverStatus;
    TMultiGameInfo(addItem).eEmulationStatus:= uMain.TEasyGameInfo(selectedItem).eEmulationStatus;
    TMultiGameInfo(addItem).eColorStatus:= uMain.TEasyGameInfo(selectedItem).eColorStatus;
    TMultiGameInfo(addItem).eSoundStatus:= uMain.TEasyGameInfo(selectedItem).eSoundStatus;
    TMultiGameInfo(addItem).eGraphicStatus:= uMain.TEasyGameInfo(selectedItem).eGraphicStatus;
    TMultiGameInfo(addItem).eName:= uMain.TEasyGameInfo(selectedItem).eName;
    TMultiGameInfo(addItem).eClone:= uMain.TEasyGameInfo(selectedItem).eClone;
    TMultiGameInfo(addItem).eDriverName:= uMain.TEasyGameInfo(selectedItem).eDriverName;
    TMultiGameInfo(addItem).eBiosName:= uMain.TEasyGameInfo(selectedItem).eBiosName;
    TMultiGameInfo(addItem).eNumberPlayers:= uMain.TEasyGameInfo(selectedItem).eNumberPlayers;
    TMultiGameInfo(addItem).ePlayed:= uMain.TEasyGameInfo(selectedItem).ePlayed;
    TMultiGameInfo(addItem).ePlayedDate:= uMain.TEasyGameInfo(selectedItem).ePlayedDate;
    if TMultiGameInfo(addItem).ePlayedDate <> 0 then
       TMultiGameInfo(addItem).ePlayedDateText:= FormMain.GetDateTimeStr(TMultiGameInfo(addItem).ePlayedDate, True, True)
    else
       TMultiGameInfo(addItem).ePlayedDateText:= '';
       
    TMultiGameInfo(addItem).eIsFavorite:= uMain.TEasyGameInfo(selectedItem).eIsFavorite;
    TMultiGameInfo(addItem).eGameSetStatus:= uMain.TEasyGameInfo(selectedItem).eGameSetStatus;
    if TMultiGameInfo(addItem).eIsFavorite then
       HaveFavorites:= True;
    if FormMain.GameIsClone(TMultiGameInfo(addItem).eClone) then
       HaveClones:= True;
    selectedItem:= FormMain.GamesListView.Selection.Next(selectedItem);
  until selectedItem = nil;
  GamesList.Items.ReIndexDisable:= False;
  if not HaveClones then
     GamesList.Header.Columns[2].Visible:= False;

  SetColAutoFit(1);
  SetColAutoFit(2);
  SetColAutoFit(3);
  SetColAutoFit(4);

  iTotalW:= 0;
  for iLoop:=0 to GamesList.Header.Columns.Count-1 do
  begin
    if GamesList.Header.Columns[iLoop].Visible then
       iTotalW:= iTotalW+GamesList.Header.Columns[iLoop].Width;
  end;

  if iTotalW < (GamesList.Width-2) then //iMaxTotalWidth then
     GamesList.Header.Columns[0].Width:= GamesList.Header.Columns[0].Width+((GamesList.Width-2)-iTotalW);

  GamesList.EndUpdate(False);
  
  if GamesList.Scrollbars.VertBarVisible then //if GamesList.Groups.ItemCount > 10 then
     GamesList.Header.Columns[0].Width:= GamesList.Header.Columns[0].Width-GetSystemMetrics(SM_CXVSCROLL); // -16

  if GamesList.Scrollbars.HorzBarVisible then
     begin
       // resolution is smaller than 800x600... headers scroll bar needed
       GamesList.Height:= GamesList.Height+GetSystemMetrics(SM_CXHSCROLL);
       PanelSlots.Height:= PanelSlots.Height+GetSystemMetrics(SM_CXHSCROLL);
     end;
end;

procedure TFormMultiSlotGames.AdjustSize;
var
  wDiff: Integer;
begin
  //wDiff:= 160;
  if Screen.Width > 800 then
     Exit;
  if Screen.Width = 720 then
     wDiff:= 80
  else
  if Screen.Width = 640 then
     wDiff:= 160;

  GamesList.Width:= GamesList.Width-wDiff;
  FormMultiSlotGames.ClientWidth:= FormMultiSlotGames.ClientWidth-wDiff;
end;

procedure TFormMultiSlotGames.FormShow(Sender: TObject);
begin
  FormMain.ELV_ResetNormalColors(GamesList);
  AdjustSize;
  AddMultiGames;
end;

procedure TFormMultiSlotGames.GamesListItemPaintText(
  Sender: TCustomEasyListview; Item: TEasyItem; Position: Integer;
  ACanvas: TCanvas);
begin
  FormMain.GetCanvasFontCustom(TMultiGameInfo(Item).eGameSetStatus,
                               TMultiGameInfo(Item).eDriverStatus,
                               TMultiGameInfo(Item).eClone, ACanvas);
  ACanvas.Font.Name:= 'Tahoma';
  ACanvas.Font.Size:= 8;
  if Position = 3 then
     ACanvas.Font.Size:= 7;
end;

procedure TFormMultiSlotGames.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
  case Key of
    #13: ButtonOk.Click;
    #27: ButtonNo.Click;
  end;
end;

procedure TFormMultiSlotGames.GamesListColumnPaintText(
  Sender: TCustomEasyListview; Column: TEasyColumn; ACanvas: TCanvas);
begin
  //if Column.Index in [6..10] then
  //   ACanvas.Font.Size:= 7;
end;

procedure TFormMultiSlotGames.GamesListItemSelectionChanged(
  Sender: TCustomEasyListview; Item: TEasyItem);
begin
  if Item.Selected then
     FormMain.ELV_SetSelectRibbon(Ord(TMultiGameInfo(Item).eGameSetStatus = 1), GamesList);
end;

end.
