unit uSelectImageCategory;

interface

uses
  Windows, Messages, Classes, Graphics, Controls, Forms,
  StdCtrls, MPCommonObjects, MPCommonUtilities,
  EasyListview, ExtCtrls, ImgList, Buttons,
  ShadowLabel, PanelEx;

type
  TFormSelectImageCategory = class(TForm)
    IL_ImageCategory: TImageList;
    PanelImageCategories: TPanelEx;
    LabelEmuTitle: TShadowLabel;
    CategoriesListView: TEasyListview;
    PanelBottomButtons: TPanelEx;
    ButtonOk: TBitBtn;
    ButtonCancel: TBitBtn;
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
  FormSelectImageCategory: TFormSelectImageCategory;

implementation

uses uMain, uCommon;

{$R *.dfm}

procedure TFormSelectImageCategory.AddCategories;
begin
  FormMain.ELV_PopulateImageCategory(CategoriesListView, 0);//1);
  FormMain.ELV_SelectItem(CategoriesListView, selCategoryID);
end;

procedure TFormSelectImageCategory.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
  case Key of
    #13: if ButtonOk.Enabled then ButtonOk.Click;
    #27: ButtonCancel.Click;
  end;
end;

procedure TFormSelectImageCategory.FormShow(Sender: TObject);
begin
  FormMain.ELV_ResetNormalColors(CategoriesListView);
  FormMain.LoadCategoriesIcons(IL_ImageCategory, True);
end;

procedure TFormSelectImageCategory.FormActivate(Sender: TObject);
begin
  if FormSelectImageCategory.Tag = 0 then
     begin
       AddCategories;
       FormSelectImageCategory.Tag:= 1;
     end;
end;

procedure TFormSelectImageCategory.CategoriesListViewItemPaintText(
  Sender: TCustomEasyListview; Item: TEasyItem; Position: Integer;
  ACanvas: TCanvas);
begin
  //FormMain.ELV_ItemPaintText_General(Sender, Item, ACanvas);
  if Item.Ghosted{esosGhosted in Item.State} then
     begin
       ACanvas.Font.Color:= clGray;
       ACanvas.Font.Style:= [fsStrikeOut];
     end;
end;

procedure TFormSelectImageCategory.CategoriesListViewItemSelectionChanged(
  Sender: TCustomEasyListview; Item: TEasyItem);
begin
  if Item.Selected then
     begin
       LabelEmuTitle.Caption:= UpperCase(FormMain.PopupMenuImageCategories.Items[Item.ImageIndex].Caption);
       ButtonOk.Enabled:= not (Item.Ghosted{esosGhosted in Item.State});
       FormMain.ELV_SetSelectRibbon(Ord(not ButtonOk.Enabled), CategoriesListView);
       Sender.Tag:= Item.ImageIndex;
     end;
end;

procedure TFormSelectImageCategory.CategoriesListViewKeyAction(
  Sender: TCustomEasyListview; var CharCode: Word; var Shift: TShiftState;
  var DoDefault: Boolean);
begin
  case CharCode of
    VK_RETURN: if ButtonOk.Enabled then ButtonOk.Click;
    VK_ESCAPE: ButtonCancel.Click;
  end;
end;

procedure TFormSelectImageCategory.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if ModalResult = mrYes then
     CanClose:= FormMain.CheckSelected(CategoriesListView);
end;

procedure TFormSelectImageCategory.CategoriesListViewDblClick(
  Sender: TCustomEasyListview; Button: TCommonMouseButton;
  MousePos: TPoint; ShiftState: TShiftState; var Handled: Boolean);
begin
  if ButtonOk.Enabled then
     ButtonOk.Click;
end;

end.
