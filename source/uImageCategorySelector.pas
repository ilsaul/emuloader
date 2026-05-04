unit uImageCategorySelector;

interface

uses
  Windows, Messages, Classes, Graphics, Controls, Forms,
  StdCtrls, MPCommonObjects, MPCommonUtilities,
  EasyListview, ExtCtrls, ImgList, Buttons,
  ShadowLabel, PanelEx, ButtonsEx;

type
  TFormImageCategorySelector = class(TForm)
    IL_ImageCategory: TImageList;
    PanelBottom: TPanelEx;
    ButtonOk: TBitBtnEx;
    ButtonCancel: TBitBtnEx;
    LabelSystemTitle: TShadowLabel;
    CategoriesListView: TEasyListview;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure CategoriesListViewItemPaintText(Sender: TCustomEasyListview;
      Item: TEasyItem; Position: Integer; ACanvas: TCanvas);
    procedure CategoriesListViewItemSelectionChanged(
      Sender: TCustomEasyListview; Item: TEasyItem);
    procedure CategoriesListViewKeyAction(Sender: TCustomEasyListview;
      var CharCode: Word; var Shift: TShiftState; var DoDefault: Boolean);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure CategoriesListViewDblClick(Sender: TCustomEasyListview;
      Button: TCommonMouseButton; MousePos: TPoint;
      ShiftState: TShiftState; var Handled: Boolean);
  private
    { Private declarations }
    procedure AddCategories;
    procedure Resize4K;
  public
    { Public declarations }
    selCategoryID: ShortInt;
  end;

var
  FormImageCategorySelector: TFormImageCategorySelector;

implementation

uses uMain, uCommon;

{$R *.dfm}

procedure TFormImageCategorySelector.Resize4K;
begin
  if not Is4KMode then
     Exit;

  with FormImageCategorySelector do
  begin
    PanelBottom.Height:= 71;
    //CategoriesListView.PaintInfoItem.IconViewRemoveIconTopBorder:= True;
    CategoriesListView.CellSizes.Tile.Width:=  156;
    CategoriesListView.CellSizes.Tile.Height:= 156;

    ClientWidth:=  (CategoriesListView.CellSizes.Tile.Width*6) +16;
    ClientHeight:= (CategoriesListView.CellSizes.Tile.Height*3)+16+PanelBottom.Height;
    Font.Size:= 16;
    FormMain.Set4KImageListSpecs(IL_ImageCategory, 128);

    FormMain.Set4KListViewSpecs(CategoriesListView, 8, 8, (CategoriesListView.CellSizes.Tile.Width*6)+20, CategoriesListView.CellSizes.Tile.Height*3, 16);
    CategoriesListView.Font.Name:= FormMain.Get4KSystemFont;
    CategoriesListView.PaintInfoItem.ImageIndent:= 8;

    FormMain.Set4KLabelSpecs(LabelSystemTitle, 23, 25, -1, -1, 16);
    FormMain.Set4KButtonsOkCancelPanel(PanelBottom, ButtonOk, ButtonCancel, False);
  end;
end;

procedure TFormImageCategorySelector.AddCategories;
begin
  FormMain.ELV_PopulateImageCategory(CategoriesListView, True, True, 0);
  FormMain.ELV_SelectItem(CategoriesListView, selCategoryID);
end;

procedure TFormImageCategorySelector.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
  case Key of
    #13: if ButtonOk.Enabled then ButtonOk.Click;
    #27: ButtonCancel.Click;
  end;
end;

procedure TFormImageCategorySelector.FormShow(Sender: TObject);
begin
  Resize4K;
  FormMain.ELV_ResetNormalColors(CategoriesListView);

  if IsNightMode then
     begin
       FormImageCategorySelector.Color:= menu_background_color[1];
       SetBottomPanelColors(PanelBottom);
       FormMain.SetEasyListViewColors(CategoriesListView, menu_background_color[1], item_caption_active_color[1]);
       FormMain.SetSystemTitleLabelColors(LabelSystemTitle);
       FormMain.SetButtonExColors(ButtonOk);
       FormMain.SetButtonExColors(ButtonCancel);
     end;

  FormMain.LoadCategoriesIcons(IL_ImageCategory);

  if IsNightMode then
     FormMain.ELV_SetNightModeColors(CategoriesListView);
end;

procedure TFormImageCategorySelector.FormActivate(Sender: TObject);
begin
  if FormImageCategorySelector.Tag = 0 then
     begin
       AddCategories;
       FormImageCategorySelector.Tag:= 1;
       CategoriesListView.SetFocus;
     end;
end;

procedure TFormImageCategorySelector.CategoriesListViewItemPaintText(
  Sender: TCustomEasyListview; Item: TEasyItem; Position: Integer;
  ACanvas: TCanvas);
begin
  //FormMain.ELV_ItemPaintText_General(Sender, Item, ACanvas);
  if Item.Ghosted then
     begin
       ACanvas.Font.Color:= clGray;
       ACanvas.Font.Style:= [fsStrikeOut];
     end;
end;

procedure TFormImageCategorySelector.CategoriesListViewItemSelectionChanged(
  Sender: TCustomEasyListview; Item: TEasyItem);
begin
  if Item.Selected then
     begin
       LabelSystemTitle.Caption:= UpperCase(GetImageCategoryTitle(Item.ImageIndex));
       ButtonOk.Enabled:= not Item.Ghosted;
       Sender.Tag:= Item.ImageIndex;
     end;
end;

procedure TFormImageCategorySelector.CategoriesListViewKeyAction(
  Sender: TCustomEasyListview; var CharCode: Word; var Shift: TShiftState;
  var DoDefault: Boolean);
begin
  case CharCode of
    VK_RETURN: if ButtonOk.Enabled then ButtonOk.Click;
    VK_ESCAPE: ButtonCancel.Click;
  end;
end;

procedure TFormImageCategorySelector.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if ModalResult = mrOk then
     CanClose:= FormMain.CheckSelected(CategoriesListView);
end;

procedure TFormImageCategorySelector.CategoriesListViewDblClick(
  Sender: TCustomEasyListview; Button: TCommonMouseButton;
  MousePos: TPoint; ShiftState: TShiftState; var Handled: Boolean);
begin
  if ButtonOk.Enabled then
     ButtonOk.Click;
end;

end.
