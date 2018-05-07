unit uImageLayoutSelector;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, MPCommonObjects, MPCommonUtilities,
  EasyListview, ShadowLabel, PanelEx, ImgList, ExtCtrls;

type
  TFormImageLayoutSelector = class(TForm)
    PanelBottomButtons: TPanelEx;
    ButtonOk: TBitBtn;
    ButtonCancel: TBitBtn;
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
      FormMain.AddDefaultIcons(GetScrLayoutImageFile(Loop, False), tmpFolder, IL_Layouts);
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
  FormMain.ELV_ResetNormalColors(LayoutsListView);
  {LayoutsListView.Selection.Color:= clNavy;// $00fcebdc;
  LayoutsListView.Selection.GradientColorTop:= $00daecfd; // gradient top
  LayoutsListView.Selection.GradientColorBottom:= $0069ceff; // gradient bottom
  LayoutsListView.Selection.BorderColor:= $0000b7ff;
  LayoutsListView.Selection.BlendColorSelRect:= LayoutsListView.Selection.BorderColor;
  LayoutsListView.Selection.BorderColorSelRect:= LayoutsListView.Selection.BorderColor;}

  {frame color $0000b7ff

  selection_uppergradient_colorstart: Integer = $00daecfd;
  selection_uppergradient_colorend: Integer = $00bde0fd;
  selection_lowergradient_colorstart: Integer = $0069ceff;
  selection_lowergradient_colorend: Integer = $009af6ff;}

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
 