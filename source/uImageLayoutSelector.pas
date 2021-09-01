unit uImageLayoutSelector;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, MPCommonObjects, MPCommonUtilities,
  EasyListview, ShadowLabel, PanelEx, ImgList, ExtCtrls, ButtonsEx;

type
  TFormImageLayoutSelector = class(TForm)
    PanelBottom: TPanelEx;
    ButtonOk: TBitBtnEx;
    ButtonCancel: TBitBtnEx;
    IL_Layouts: TImageList;
    LayoutsListView: TEasyListview;
    LabelLayoutTitle: TShadowLabel;
    procedure FormShow(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormActivate(Sender: TObject);
    procedure LayoutsListViewDblClick(Sender: TCustomEasyListview;
      Button: TCommonMouseButton; MousePos: TPoint;
      ShiftState: TShiftState; var Handled: Boolean);
    procedure LayoutsListViewItemSelectionChanged(
      Sender: TCustomEasyListview; Item: TEasyItem);
    procedure LayoutsListViewKeyAction(Sender: TCustomEasyListview;
      var CharCode: Word; var Shift: TShiftState; var DoDefault: Boolean);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    { Private declarations }
    procedure LoadLayoutIcons;
    procedure AddLayouts;
    procedure Resize4K;
  public
    { Public declarations }
  end;

var
  FormImageLayoutSelector: TFormImageLayoutSelector;

implementation

uses uMain, uCommon;

{$R *.dfm}

procedure TFormImageLayoutSelector.Resize4K;
begin
  if not Is4KMode then
     Exit;

  with FormImageLayoutSelector do
  begin
    PanelBottom.Height:= 71;
    //CategoriesListView.PaintInfoItem.IconViewRemoveIconTopBorder:= True;
    LayoutsListView.CellSizes.Tile.Width:=  156;
    LayoutsListView.CellSizes.Tile.Height:= 156;

    ClientWidth:=  (LayoutsListView.CellSizes.Tile.Width*7) +16;
    ClientHeight:= (LayoutsListView.CellSizes.Tile.Height*4)+16+PanelBottom.Height;
    Font.Size:= 16;
    FormMain.Set4KImageListSpecs(IL_Layouts, 128);

    FormMain.Set4KListViewSpecs(LayoutsListView, 8, 8, (LayoutsListView.CellSizes.Tile.Width*7)+20, LayoutsListView.CellSizes.Tile.Height*4, 16);
    LayoutsListView.Font.Name:= FormMain.Get4KSystemFont;
    LayoutsListView.PaintInfoItem.ImageIndent:= 8;

    FormMain.Set4KLabelSpecs(LabelLayoutTitle, 23, 25, -1, -1, 16);
    FormMain.Set4KButtonsOkCancelPanel(PanelBottom, ButtonOk, ButtonCancel, False);
  end;
end;

procedure TFormImageLayoutSelector.LoadLayoutIcons;
var
  Loop: Byte;
  tmpFolder: String;
begin
  tmpFolder:= FormMain.GetFolderFull(32);
  for Loop:=0 to MaxImageLayouts do
      FormMain.AddDefaultIcons(GetScrLayoutImageFile(Loop, False), tmpFolder, IL_Layouts, 3); // 3 -> image layout white text overlays
end;

procedure TFormImageLayoutSelector.AddLayouts;
begin
  FormMain.ELV_PopulateImageLayouts(LayoutsListView, 0, 0, 0);

  if LayoutsListView.Tag = -1 then
     LayoutsListView.Tag:= FormMain.ButtonScreenshotLayouts.Tag;
  FormMain.ELV_SelectItem(LayoutsListView, LayoutsListView.Tag);//FormMain.ButtonScreenshotLayouts.Tag);
end;

procedure TFormImageLayoutSelector.FormShow(Sender: TObject);
begin
  Resize4K;
  FormMain.ELV_ResetNormalColors(LayoutsListView);
  if IsNightMode then
     begin
       FormImageLayoutSelector.Color:= menu_background_color[1];
       SetBottomPanelColors(PanelBottom);
       FormMain.SetEasyListViewColors(LayoutsListView, menu_background_color[1], item_caption_active_color[1]);
       FormMain.SetSystemTitleLabelColors(LabelLayoutTitle);
       FormMain.SetButtonExColors(ButtonOk);
       FormMain.SetButtonExColors(ButtonCancel);
       FormMain.ELV_SetNightModeColors(LayoutsListView);
     end;
  LoadLayoutIcons;
end;

procedure TFormImageLayoutSelector.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
  case Key of
    #13: if ButtonOk.Enabled then ButtonOk.Click;
    #27: ButtonCancel.Click;
  end;
end;

procedure TFormImageLayoutSelector.FormActivate(Sender: TObject);
begin
  if FormImageLayoutSelector.Tag = 0 then
     begin
       AddLayouts;
       LayoutsListView.SetFocus;
       FormImageLayoutSelector.Tag:= 1;
     end;
end;

procedure TFormImageLayoutSelector.LayoutsListViewDblClick(
  Sender: TCustomEasyListview; Button: TCommonMouseButton;
  MousePos: TPoint; ShiftState: TShiftState; var Handled: Boolean);
begin
  if ButtonOk.Enabled then
     ButtonOk.Click;
end;

procedure TFormImageLayoutSelector.LayoutsListViewItemSelectionChanged(
  Sender: TCustomEasyListview; Item: TEasyItem);
begin
  if Item.Selected then
     begin
       LabelLayoutTitle.Caption:= UpperCase(GetScrLayoutSection(Item.ImageIndex));
       //ButtonOk.Enabled:= not (Item.Ghosted{esosGhosted in Item.State});
       Sender.Tag:= Item.ImageIndex;
     end;
end;

procedure TFormImageLayoutSelector.LayoutsListViewKeyAction(
  Sender: TCustomEasyListview; var CharCode: Word; var Shift: TShiftState;
  var DoDefault: Boolean);
begin
  case CharCode of
    VK_RETURN: if ButtonOk.Enabled then ButtonOk.Click;
    VK_ESCAPE: ButtonCancel.Click;
  end;
end;

procedure TFormImageLayoutSelector.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if ModalResult = mrOk then
     CanClose:= FormMain.CheckSelected(LayoutsListView);
end;

end.
 