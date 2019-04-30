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
  public
    { Public declarations }
    selCategoryID: ShortInt;
  end;

var
  FormImageCategorySelector: TFormImageCategorySelector;

implementation

uses uMain, uCommon;

{$R *.dfm}

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
  FormMain.ELV_ResetNormalColors(CategoriesListView);
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
       //FormMain.ELV_SetSelectRibbon(Ord(not ButtonOk.Enabled), CategoriesListView); // no longer used (April 04, 2019)
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
