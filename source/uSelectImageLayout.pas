unit uSelectImageLayout;

interface

uses
  Windows, Messages, Classes, Graphics, Controls, Forms,
  StdCtrls, MPCommonObjects, MPCommonUtilities,
  EasyListview, ExtCtrls, ImgList, Buttons,
  ShadowLabel, PanelEx;

type
  TFormSelectImageLayout = class(TForm)
    IL_Layouts: TImageList;
    PanelImageLayouts: TPanelEx;
    LabelLayoutTitle: TShadowLabel;
    LayoutsListView: TEasyListview;
    PanelBottomButtons: TPanelEx;
    ButtonOk: TBitBtn;
    ButtonCancel: TBitBtn;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure LayoutsListViewItemPaintText(Sender: TCustomEasyListview;
      Item: TEasyItem; Position: Integer; ACanvas: TCanvas);
    procedure LayoutsListViewItemSelectionChanged(
      Sender: TCustomEasyListview; Item: TEasyItem);
    procedure LayoutsListViewKeyAction(Sender: TCustomEasyListview;
      var CharCode: Word; var Shift: TShiftState; var DoDefault: Boolean);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure LayoutsListViewDblClick(Sender: TCustomEasyListview;
      Button: TCommonMouseButton; MousePos: TPoint;
      ShiftState: TShiftState; var Handled: Boolean);
  private
    { Private declarations }
    procedure LoadLayoutIcons;
    procedure AddLayouts;
  public
    { Public declarations }
    LayoutType: ShortInt;
  end;

var
  FormSelectImageLayout: TFormSelectImageLayout;

implementation

uses uMain, uCommon;

{$R *.dfm}

procedure TFormSelectImageLayout.LoadLayoutIcons;
var
  Loop: Byte;
  tmpFolder: String;
begin
  tmpFolder:= FormMain.GetFolderFull(32);
  for Loop:=0 to MaxImageLayouts do
      FormMain.AddDefaultIcons(GetScrLayoutImageFile(Loop, False), tmpFolder, IL_Layouts);
end;

procedure TFormSelectImageLayout.AddLayouts;
begin
  FormMain.ELV_PopulateImageLayouts(LayoutsListView, PanelImageLayouts.Tag, LayoutType, 0);
  //FormMain.ELV_SelectItem(LayoutsListView, selCategoryID);
end;

procedure TFormSelectImageLayout.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
  case Key of
    #13: if ButtonOk.Enabled then ButtonOk.Click;
    #27: ButtonCancel.Click;
  end;
end;

procedure TFormSelectImageLayout.FormShow(Sender: TObject);
begin
  FormMain.ELV_ResetNormalColors(LayoutsListView);
  LoadLayoutIcons;
end;

procedure TFormSelectImageLayout.FormActivate(Sender: TObject);
begin
  if FormSelectImageLayout.Tag = 0 then
     begin
       AddLayouts;
       FormSelectImageLayout.Tag:= 1;
     end;
end;

procedure TFormSelectImageLayout.LayoutsListViewItemPaintText(
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

procedure TFormSelectImageLayout.LayoutsListViewItemSelectionChanged(
  Sender: TCustomEasyListview; Item: TEasyItem);
begin
  if Item.Selected then
     begin
       LabelLayoutTitle.Caption:= UpperCase(FormMain.PopupScreenshotLayouts.Items[Item.ImageIndex].Caption);
       //ButtonOk.Enabled:= not (Item.Ghosted{esosGhosted in Item.State});
       //FormMain.ELV_SetSelectRibbon(Ord(not ButtonOk.Enabled), CategoriesListView);
       Sender.Tag:= Item.ImageIndex;
     end;
end;

procedure TFormSelectImageLayout.LayoutsListViewKeyAction(
  Sender: TCustomEasyListview; var CharCode: Word; var Shift: TShiftState;
  var DoDefault: Boolean);
begin
  case CharCode of
    VK_RETURN: if ButtonOk.Enabled then ButtonOk.Click;
    VK_ESCAPE: ButtonCancel.Click;
  end;
end;

procedure TFormSelectImageLayout.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if ModalResult = mrYes then
     CanClose:= FormMain.CheckSelected(LayoutsListView);
end;

procedure TFormSelectImageLayout.LayoutsListViewDblClick(
  Sender: TCustomEasyListview; Button: TCommonMouseButton;
  MousePos: TPoint; ShiftState: TShiftState; var Handled: Boolean);
begin
  if ButtonOk.Enabled then
     ButtonOk.Click;
end;

end.
