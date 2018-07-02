unit uConsCompMultiFloppyGames;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, MPCommonObjects, EasyListview, PanelEx,
  ImgList, ShadowLabel, ExtCtrls;

type
  TFormConsCompMultiFloppyGames = class(TForm)
    BottomBar: TPanelEx;
    ButtonOk: TBitBtn;
    ButtonNo: TBitBtn;
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
    ButtonUp: TBitBtn;
    ButtonDown: TBitBtn;
    ButtonRemoveFromList: TBitBtn;
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
//var
  //selectedItem, addItem: TEasyItem;
  //{HaveFavorites, }HaveClones{, HavePlayed}: Boolean;
  //iLoop, iTotalW: Integer;
  //tStr: String;
begin
  //GamesList.BeginUpdate;
  {//HaveFavorites:= False;
  HaveClones:= False;
  //HavePlayed:= False;
  FormMain.ClearListView(GamesList);
  GamesList.BeginUpdate;
  GamesList.Items.ReIndexDisable:= True;
  iLoop:= 0;
  selectedItem:= FormMain.GamesListView.Selection.First;
  repeat
    FormMain.FillTempGameInfo(selectedItem);
    tStr:= '';
    with GamesList.Items.Add do
    begin
      Tag:= FormMain.TempGameVars.eGameSetStatus;
      ImageIndex:= FormMain.TempGameVars.eROMIdentification;
      case FormMain.TempGameVars.eIsFavorite of
        True:
          begin
            //HaveFavorites:= True;
            StateImageIndex:= 3;
          end;
        False: StateImageIndex:= 50;
      end;
      //Caption:= UTF8Decode('クロススウォードII')+'   :english: Crossed Swords II (Jpn)';
      //Caption:= UTF8Decode('ビューポイント')+'   :english: Viewpoint (Jpn, USA)';
      //Caption:= UTF8Decode('_Ciro)');
      //Caption:= UTF8Decode('ワールドヒーローズ2ジェット');//FormMain.TempGameVars.eTitle;
      Caption:= FormMain.TempGameVars.eTitle;
      Captions[1]:= FormMain.TempGameVars.eName;
      Captions[2]:= FormMain.TempGameVars.eClone;
      if FormMain.TempGameVars.ePlayed <> 0 then
         tStr:= IntToStr(FormMain.TempGameVars.ePlayed)+'x';
      if FormMain.TempGameVars.ePlayedDate <> 0 then
         begin
           if tStr <> '' then
              tStr:= tStr+' ';
           tStr:= tStr+FormMain.GetDateTimeStr(FormMain.TempGameVars.ePlayedDate, True, True);
         end;
      Captions[3]:= tStr;
      Captions[4]:= FormMain.TempGameVars.eNumberPlayers;
      Captions[5]:= FormMain.TempGameVars.eYear;
      StateImageIndexes[6]:= FormMain.TempGameVars.eDriverStatus;
      if FormMain.GameIsClone(FormMain.TempGameVars.eClone) then
         HaveClones:= True;
      Inc(iLoop);
      case iLoop of
         1: LabelSlot1.Enabled:= True;
         2: LabelSlot2.Enabled:= True;
         3: LabelSlot3.Enabled:= True;
         4: LabelSlot4.Enabled:= True;
         5: LabelSlot5.Enabled:= True;
         6: LabelSlot6.Enabled:= True;
         7: LabelSlot7.Enabled:= True;
         8: LabelSlot8.Enabled:= True;
         9: LabelSlot9.Enabled:= True;
        10: LabelSlot10.Enabled:= True;
      end;
    end;
    selectedItem:= FormMain.GamesListView.Selection.Next(selectedItem);
  until selectedItem = nil;
  GamesList.Items.ReIndexDisable:= False;
  if not HaveClones then
     GamesList.Header.Columns[2].Visible:= False;

  FormMain.ClearMemGameInfo(FormMain.TempGameVars);}

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
       SetFormColors(FormConsCompMultiFloppyGames, TopBar, BottomBar, LabelSystemTitle, LabelEmulatorDetails, -1);
       SetLabelColors(LabelTotalFloppyDisks, clWhite, clNavy);

       FrameGamesList.ColorFrame:= $00ff9933;
       FrameGamesList.ColorInnerFrame:= clBlue;

       GamesList.Color:= FormConsCompMultiFloppyGames.Color;
       GamesList.Font.Color:= clWhite;
       GamesList.HotTrack.Color:= clWhite;
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
  MoveToSlot(Boolean(TBitBtn(Sender).Tag));
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
