unit uMultiSlotGames;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  StdCtrls, Buttons, MPCommonObjects, EasyListview, PanelEx;

type
  TFormMultiSlotGames = class(TForm)
    GamesList: TEasyListview;
    PanelButtons: TPanelEx;
    ButtonOk: TBitBtn;
    ButtonNo: TBitBtn;
    ButtonUp: TBitBtn;
    ButtonDown: TBitBtn;
    ButtonRemoveFromList: TBitBtn;
    LabelHelpText: TLabel;
    procedure FormShow(Sender: TObject);
    procedure GamesListItemPaintText(Sender: TCustomEasyListview;
      Item: TEasyItem; Position: Integer; ACanvas: TCanvas);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure GamesListItemSelectionChanged(Sender: TCustomEasyListview;
      Item: TEasyItem);
    procedure ButtonUpClick(Sender: TObject);
    procedure ButtonRemoveFromListClick(Sender: TObject);
    procedure GamesListKeyAction(Sender: TCustomEasyListview;
      var CharCode: Word; var Shift: TShiftState; var DoDefault: Boolean);
  private
    { Private declarations }
    procedure UpdateSlotIndex;
    procedure AddMultiGames;
    procedure iAdjustSize;
    procedure MoveToSlot(MoveUp: Boolean);
  public
    { Public declarations }
  end;

var
  FormMultiSlotGames: TFormMultiSlotGames;

implementation

uses uMain;

{$R *.dfm}

procedure TFormMultiSlotGames.UpdateSlotIndex;
var
  Item: TEasyItem;
begin
  GamesList.BeginUpdate;
  Item:= GamesList.Groups.FirstItem;
  repeat
    Item.Caption:= IntToStr(Item.Index+1);
    Item:= GamesList.Groups.NextItem(Item);
  until Item = nil;
  GamesList.EndUpdate;
end;

procedure TFormMultiSlotGames.AddMultiGames;
var
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
      2: MinSize:= 44;
      3: MinSize:= 57;
      4: MinSize:= 47;
      5: MinSize:= 49;
      6: MinSize:= 35;
    end;
    if GamesList.Header.Columns[ColumnIndex].Width < MinSize then
       GamesList.Header.Columns[ColumnIndex].Width:= MinSize;
  end;

begin
  GamesList.BeginUpdate;
  SetColAutoFit(2);
  SetColAutoFit(3);
  SetColAutoFit(4);
  SetColAutoFit(5);
  SetColAutoFit(6);

  iTotalW:= 0;
  for iLoop:=0 to GamesList.Header.Columns.Count-1 do
  begin
    if GamesList.Header.Columns[iLoop].Visible then
       iTotalW:= iTotalW+GamesList.Header.Columns[iLoop].Width;
  end;

  if iTotalW < (GamesList.Width-2) then //iMaxTotalWidth then
     GamesList.Header.Columns[1].Width:= GamesList.Header.Columns[1].Width+((GamesList.Width-2)-iTotalW);

  GamesList.EndUpdate(False);

  UpdateSlotIndex;
  if GamesList.Scrollbars.VertBarVisible then
     GamesList.Header.Columns[1].Width:= GamesList.Header.Columns[1].Width-GetSystemMetrics(SM_CXVSCROLL); // -16 ?

  if GamesList.Scrollbars.HorzBarVisible then
     begin
       // resolution is smaller than 800x600... headers scroll bar needed ????
       GamesList.Height:= GamesList.Height+GetSystemMetrics(SM_CXHSCROLL);
       ButtonUp.Top:= ButtonUp.Top+GetSystemMetrics(SM_CXHSCROLL);
       ButtonDown.Top:= ButtonUp.Top;
       ButtonRemoveFromList.Top:= ButtonUp.Top;
       LabelHelpText.Top:= LabelHelpText.Top+GetSystemMetrics(SM_CXHSCROLL);
     end;
end;

procedure TFormMultiSlotGames.iAdjustSize;
var
  wDiff: Integer;
begin
  //wDiff:= 160; // for debugging only; do not enable this
  if Screen.Width >= 800 then
     Exit;
  if Screen.Width = 720 then
     wDiff:= 80
  else
  if Screen.Width = 640 then
     wDiff:= 160;

  ButtonOk.Left:= ButtonOk.Left-(wDiff div 2);
  ButtonNo.Left:= ButtonNo.Left-(wDiff div 2);
  LabelHelpText.Left:= LabelHelpText.Left-(wDiff div 2);
  GamesList.Width:= GamesList.Width-wDiff;
  GamesList.Header.Columns[1].Width:= GamesList.Header.Columns[1].Width-wDiff;
  FormMultiSlotGames.ClientWidth:= FormMultiSlotGames.ClientWidth-wDiff;
end;

procedure TFormMultiSlotGames.MoveToSlot(MoveUp: Boolean);
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
       selItem.Caption:= IntToStr(selItem.Index+1);
       newPosItem.Caption:= IntToStr(newPosItem.Index+1);

     end;
  GamesList.SetFocus;
end;

procedure TFormMultiSlotGames.FormShow(Sender: TObject);
begin
  FormMain.ELV_ResetNormalColors(GamesList);
  iAdjustSize;
  AddMultiGames;
end;

procedure TFormMultiSlotGames.GamesListItemPaintText(
  Sender: TCustomEasyListview; Item: TEasyItem; Position: Integer;
  ACanvas: TCanvas);
begin
  //ACanvas.Font.Name:= 'Segoe UI';
  //ACanvas.Font.Size:= 9;
  case Position of
    0:
     begin
       //ACanvas.Font.Name:= 'Tahoma';
       //ACanvas.Font.Size:= 8;
       ACanvas.Font.Style:= [fsBold];
       ACanvas.Font.Color:= $00323232;
     end;
    1:
     begin
       FormMain.GetCanvasFontCustom(Item.Tag,
                                    Item.StateImageIndexes[7],
                                    Item.Captions[3], ACanvas);
     end;
    //4: ACanvas.Font.Size:= 7;
  end;
end;

procedure TFormMultiSlotGames.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
  case Key of
    #13: ButtonOk.Click;
    #27: ButtonNo.Click;
  end;
end;

procedure TFormMultiSlotGames.GamesListItemSelectionChanged(
  Sender: TCustomEasyListview; Item: TEasyItem);
begin
  if Item.Selected then
     FormMain.ELV_SetSelectRibbon(Ord(Item.Tag = 1), GamesList);
end;

procedure TFormMultiSlotGames.ButtonUpClick(Sender: TObject);
begin
  MoveToSlot(Boolean(TBitBtn(Sender).Tag));
end;

procedure TFormMultiSlotGames.ButtonRemoveFromListClick(Sender: TObject);
begin
  GamesList.BeginUpdate;
  GamesList.Selection.DeleteSelected(True);
  GamesList.EndUpdate;
  UpdateSlotIndex;
end;

procedure TFormMultiSlotGames.GamesListKeyAction(
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

end.
