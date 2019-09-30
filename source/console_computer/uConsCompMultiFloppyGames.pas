unit uConsCompMultiFloppyGames;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, MPCommonObjects, EasyListview, PanelEx,
  ImgList, ShadowLabel, ExtCtrls, ButtonsEx;

type
  TFormConsCompMultiFloppyGames = class(TForm)
    PanelBottom: TPanelEx;
    ButtonOk: TBitBtnEx;
    ButtonNo: TBitBtnEx;
    IL_LoadMultiFloppy: TImageList;
    PanelWinViceLabel: TPanelEx;
    LabelWinVICE: TLabel;
    TopBar: TPanelEx;
    SystemIcon: TImage;
    LabelSystemTitle: TShadowLabel;
    LabelEmulatorDetails: TShadowLabel;
    EmulatorIcon: TImage;
    IL_EmulatorIcon: TImageList;
    LabelTotalFloppyDisks: TShadowLabel;
    ButtonUp: TBitBtnEx;
    ButtonDown: TBitBtnEx;
    ButtonRemoveFromList: TBitBtnEx;
    FrameGamesList: TPanelEx;
    GamesList: TEasyListview;
    procedure FormShow(Sender: TObject);
    procedure GamesListItemPaintText(Sender: TCustomEasyListview;
      Item: TEasyItem; Position: Integer; ACanvas: TCanvas);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure ButtonUpClick(Sender: TObject);
    procedure ButtonRemoveFromListClick(Sender: TObject);
    procedure GamesListKeyAction(Sender: TCustomEasyListview;
      var CharCode: Word; var Shift: TShiftState; var DoDefault: Boolean);
    function GamesListItemCompare(Sender: TCustomEasyListview;
      Column: TEasyColumn; Group: TEasyGroup; Item1, Item2: TEasyItem;
      var DoDefault: Boolean): Integer;
  private
    { Private declarations }
    procedure AddMultiGames;
    procedure UpdateTotalDisksLabel;
    //procedure UpdateInfo;
    procedure MoveToSlot(MoveUp: Boolean);
    procedure UpdateDriveIndex;
  public
    { Public declarations }
  end;

var
  FormConsCompMultiFloppyGames: TFormConsCompMultiFloppyGames;

implementation

uses uMain, uCommon;

{$R *.dfm}

procedure TFormConsCompMultiFloppyGames.AddMultiGames;
begin
  UpdateDriveIndex;
  UpdateTotalDisksLabel;
  //UpdateInfo;
  if GamesList.Scrollbars.VertBarVisible then
     GamesList.Header.Columns[1].Width:= GamesList.Header.Columns[1].Width-GetSystemMetrics(SM_CXVSCROLL);
end;

procedure TFormConsCompMultiFloppyGames.UpdateTotalDisksLabel;
begin
  LabelTotalFloppyDisks.Caption:= IntToStr(GamesList.Groups.ItemCount)+' Floppy Disks';
end;

procedure TFormConsCompMultiFloppyGames.MoveToSlot(MoveUp: Boolean);
var
  selItem, newPosItem: TEasyItem;
begin
  if GamesList.Selection.Count <> 1 then
     Exit;
  selItem:= GamesList.Selection.First;
  case MoveUp of
    True : newPosItem:= GamesList.Groups.PrevItem(selItem);
    False: newPosItem:= GamesList.Groups.NextItem(selItem);
  end;
  if newPosItem <> nil then
     begin
       GamesList.Items.Exchange(selItem.Index, newPosItem.Index);
       selItem.Caption:= Format('%.2u', [selItem.Index+1]);
       newPosItem.Caption:= Format('%.2u', [newPosItem.Index+1]);
     end;
  GamesList.SetFocus;
end;

procedure TFormConsCompMultiFloppyGames.UpdateDriveIndex;
var
  Item: TEasyItem;
begin
  GamesList.BeginUpdate;
  Item:= GamesList.Groups.FirstItem;
  repeat
    Item.Caption:= Format('%.2u', [Item.Index+1]);
    Item:= GamesList.Groups.NextItem(Item);
  until Item = nil;
  GamesList.EndUpdate;
end;

procedure TFormConsCompMultiFloppyGames.FormShow(Sender: TObject);
begin
  FormMain.ELV_ResetNormalColors(GamesList);
  if IsNightMode then
     begin
       SetFormColors(FormConsCompMultiFloppyGames, TopBar, PanelBottom, LabelSystemTitle, LabelEmulatorDetails, nil, -1, IsNightMode);
       SetLabelColors(LabelTotalFloppyDisks, clCream, item_caption_active_shadow_color[1]);
       SetPanelBorderColors(FrameGamesList, clrBorderGroupBoxGrayBk, clrInnerBorderGroupBoxGrayBk);
       FrameGamesList.Color1:= FormConsCompMultiFloppyGames.Color;
       FormMain.SetButtonExColors(ButtonOk);
       FormMain.SetButtonExColors(ButtonNo);
       FormMain.SetButtonExColors(ButtonUp);
       FormMain.SetButtonExColors(ButtonDown);
       FormMain.SetButtonExColors(ButtonRemoveFromList);

       FormMain.SetEasyListViewColors(GamesList, menu_background_color[1], clWhite);
       FormMain.SetEasyListViewHeaderColors(GamesList, True);
       FormMain.ELV_SetRibbonNightColors(0, GamesList, True);
       FormMain.SetWin10DarkScrollBar(GamesList);
     end;

  AddMultiGames;
end;

procedure TFormConsCompMultiFloppyGames.GamesListItemPaintText(
  Sender: TCustomEasyListview; Item: TEasyItem; Position: Integer;
  ACanvas: TCanvas);
begin
  //FormMain.GetCanvasFontCustom(Item.Tag,
  //                             Item.StateImageIndexes[6],
  //                             Item.Captions[2], ACanvas);
{  ACanvas.Font.Name:= 'Tahoma';
  ACanvas.Font.Size:= 8;
  //ACanvas.Font.Name:= 'Segoe UI';
  //ACanvas.Font.Size:= 9;
  if Position = 3 then
     ACanvas.Font.Size:= 7;}
  if Position = 0 then
     begin
       //ACanvas.Font.Name:= 'Tahoma';
       //ACanvas.Font.Size:= 8;
       ACanvas.Font.Style:= [fsBold];
       if IsNightMode then
          ACanvas.Font.Color:= $00f1f1f1
       else
          ACanvas.Font.Color:= clrDarkGray;
     end;
  FormMain.ELV_ItemPaintText_General(Sender, Item, ACanvas);
end;

procedure TFormConsCompMultiFloppyGames.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
  case Key of
    #13: ButtonOk.Click;
    #27: ButtonNo.Click;
  end;
end;

procedure TFormConsCompMultiFloppyGames.ButtonUpClick(Sender: TObject);
begin
  MoveToSlot(Boolean(TBitBtnEx(Sender).Tag));
end;

procedure TFormConsCompMultiFloppyGames.ButtonRemoveFromListClick(Sender: TObject);
begin
  GamesList.BeginUpdate;
  GamesList.Selection.DeleteSelected(True);
  GamesList.EndUpdate;
  UpdateDriveIndex;
  UpdateTotalDisksLabel;
end;

procedure TFormConsCompMultiFloppyGames.GamesListKeyAction(
  Sender: TCustomEasyListview; var CharCode: Word; var Shift: TShiftState;
  var DoDefault: Boolean);
begin
  case CharCode of
    VK_UP, VK_DOWN:
      begin
        if Shift = [ssCtrl] then
           begin
             if CharCode = VK_UP then
                ButtonUp.Click
             else
                ButtonDown.Click;
           end;
      end;
    VK_DELETE: ButtonRemoveFromList.Click;
  end;
end;

function TFormConsCompMultiFloppyGames.GamesListItemCompare(
  Sender: TCustomEasyListview; Column: TEasyColumn; Group: TEasyGroup;
  Item1, Item2: TEasyItem; var DoDefault: Boolean): Integer;
begin
  if Column.Index = 1 then
     begin
       DoDefault:= False;
       if Column.SortDirection = esdAscending then
          Result:= FormMain.iCompare(Item1.Captions[1], Item2.Captions[1])
       else
          Result:= FormMain.iCompare(Item2.Captions[1], Item1.Captions[1]);
     end;
end;


end.
