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
    GamesList: TEasyListview;
    LabelWinVICE: TShadowLabel;
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
    procedure Resize4K;
  end;

var
  FormConsCompMultiFloppyGames: TFormConsCompMultiFloppyGames;

implementation

uses uMain, uCommon;

{$R *.dfm}

procedure TFormConsCompMultiFloppyGames.Resize4K;
begin
  if not Is4KMode then //FormMain.Menu4KMode2160pEnable.Checked then
     Exit;

  with FormConsCompMultiFloppyGames do
  begin
    ClientWidth:=  1730;
    Font.Size:= 16;

    FormMain.Set4KImageListSpecs(IL_EmulatorIcon, 48);
    FormMain.Set4KImageListSpecs(IL_LoadMultiFloppy, 32);
    
    FormMain.Set4KEmuGameTopPanel(TopBar, SystemIcon, EmulatorIcon, LabelSystemTitle, 1570, LabelEmulatorDetails, 1515);

    FormMain.Set4KListViewSpecs(GamesList, 10, TopBar.Height+10, 1710, 580, 16);
    GamesList.PaintInfoItem.ImageIndent:= 2; // reset to default value
    GamesList.CellSizes.Report.Height:= 37;

    GamesList.Header.Columns[0].Caption:= 'Drive';
    FormMain.Set4KListViewColumnSizeSpecs(GamesList, 0,  67);
    //FormMain.Set4KListViewColumnSizeSpecs(GamesList, 1, 820);
    //FormMain.Set4KListViewColumnSizeSpecs(GamesList, 2, 100);
    //FormMain.Set4KListViewColumnSizeSpecs(GamesList, 3, 350);
    //FormMain.Set4KListViewColumnSizeSpecs(GamesList, 4, 120);
    //FormMain.Set4KListViewColumnSizeSpecs(GamesList, 5, 247);

    FormMain.Set4KLabelFontNameSpecs(LabelWinVICE);
    FormMain.Set4KLabelSpecs(LabelWinVice, (ClientWidth-551) div 2, GamesList.Top+GamesList.Height+10, 551, 35, 16);

    PanelBottom.Height:= 71;
    FormMain.Set4KButtonSpecs(ButtonNo, PanelBottom.Width-168-10, 16, 168, 45, 16);
    FormMain.Set4KButtonSpecs(ButtonOk, ButtonNo.Left-10-168,     16, 168, 45, 16);

    FormMain.Set4KButtonSpecs(ButtonUp,                                10,               16, 225, 45, 16);
    FormMain.Set4KButtonSpecs(ButtonDown, ButtonUp.Left+ButtonUp.Width+10,               16, 225, 45, 16);
    FormMain.Set4KButtonSpecs(ButtonRemoveFromList, ButtonDown.Left+ButtonDown.Width+10, 16, 255, 45, 16);

    FormMain.Set4KLabelSpecs(LabelTotalFloppyDisks, ButtonRemoveFromList.Left+ButtonRemoveFromList.Width+20, 23, -1, -1, 16);
  end;
end;

procedure TFormConsCompMultiFloppyGames.AddMultiGames;
var
  iLoop: Integer;
begin
  UpdateDriveIndex;
  UpdateTotalDisksLabel;
  if FormMain.CheckTotal(GamesList) then
     begin
       GamesList.BeginUpdate;
       iLoop:= GamesList.Header.Columns[0].Width;
       iLoop:= iLoop+FormMain.ELV_ColumnAutoSize(GamesList, 2);
       iLoop:= iLoop+FormMain.ELV_ColumnAutoSize(GamesList, 3);
       iLoop:= iLoop+FormMain.ELV_ColumnAutoSize(GamesList, 4);
       iLoop:= iLoop+FormMain.ELV_ColumnAutoSize(GamesList, 5); 
       iLoop:= GamesList.Width-iLoop-2;
       if GamesList.Scrollbars.VertBarVisible then
          iLoop:= iLoop-GetSystemMetrics(SM_CXVSCROLL);
       GamesList.Header.Columns[1].Width:= iLoop;
       GamesList.EndUpdate;
     end;
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
  //Resize4K;
  FormMain.ELV_ResetNormalColors(GamesList);
  if IsNightMode then
     begin
       SetFormColors(FormConsCompMultiFloppyGames, TopBar, PanelBottom, LabelSystemTitle, LabelEmulatorDetails, nil, -1, IsNightMode);
       SetLabelColors(LabelTotalFloppyDisks, clCream, item_caption_active_shadow_color[1]);
       FormMain.SetButtonExColors(ButtonOk);
       FormMain.SetButtonExColors(ButtonNo);
       FormMain.SetButtonExColors(ButtonUp);
       FormMain.SetButtonExColors(ButtonDown);
       FormMain.SetButtonExColors(ButtonRemoveFromList);

       SetLabelColors(LabelWinVICE, clrLightRed, clMaroon);
       LabelWinVICE.Transparent:= False;
       LabelWinVICE.Color:= clrDarkGray;

       FormMain.SetEasyListViewColors(GamesList, menu_background_color[1], clWhite, -1, clrBorderGroupBoxGrayBk);
       FormMain.SetEasyListViewHeaderColors(GamesList, True, False, Is4KMode, True);
       FormMain.ELV_SetRibbonNightColors(0, GamesList, True);
       FormMain.SetWin10DarkScrollBar(GamesList);
     end;

  AddMultiGames;
end;

procedure TFormConsCompMultiFloppyGames.GamesListItemPaintText(
  Sender: TCustomEasyListview; Item: TEasyItem; Position: Integer;
  ACanvas: TCanvas);
begin
  if Position = 0 then
     begin
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
