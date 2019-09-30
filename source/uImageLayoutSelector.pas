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
  public
    { Public declarations }
  end;

var
  FormImageLayoutSelector: TFormImageLayoutSelector;

implementation

uses uMain, uCommon;

{$R *.dfm}

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
  if IsNightMode then
     begin
       FormImageLayoutSelector.Color:= menu_background_color[1];
       SetBottomPanelColors(PanelBottom);
       FormMain.SetEasyListViewColors(LayoutsListView, menu_background_color[1], item_caption_active_color[1]);
       FormMain.SetSystemTitleLabelColors(LabelLayoutTitle);
       FormMain.SetButtonExColors(ButtonOk);
       FormMain.SetButtonExColors(ButtonCancel);
     end;

  FormMain.ELV_ResetNormalColors(LayoutsListView);
  if IsNightMode then
     FormMain.ELV_SetNightModeColors(LayoutsListView);
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
 