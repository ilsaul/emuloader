unit uSelectFilterSystem;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  ComCtrls, StdCtrls, MPCommonObjects, MPCommonUtilities, EasyListview,
  ExtCtrls, Buttons, PanelEx, ShadowLabel;

type
  TFormSelectFilterSystem = class(TForm)
    PanelButtons: TPanelEx;
    ButtonOk: TBitBtn;
    ButtonCancel: TBitBtn;
    ButtonReset: TBitBtn;
    SystemsListView: TEasyListview;
    LabelMultiSelect: TShadowLabel;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormActivate(Sender: TObject);
    procedure SystemsListViewItemSelectionChanged(
      Sender: TCustomEasyListview; Item: TEasyItem);
    procedure SystemsListViewKeyAction(Sender: TCustomEasyListview;
      var CharCode: Word; var Shift: TShiftState; var DoDefault: Boolean);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure SystemsListViewDblClick(Sender: TCustomEasyListview;
      Button: TCommonMouseButton; MousePos: TPoint;
      ShiftState: TShiftState; var Handled: Boolean);
    procedure ButtonResetClick(Sender: TObject);
  private
    { Private declarations }
    procedure SetSystemsState;
  public
    { Public declarations }
  end;

var
  FormSelectFilterSystem: TFormSelectFilterSystem;

implementation

uses uMain, uCommon;

{$R *.dfm}

procedure TFormSelectFilterSystem.SetSystemsState;
var
  ShowItem: Boolean;
  Item: TEasyItem;
  HeightDiff: Integer;
begin
  SystemsListView.BeginUpdate;
  Item:= SystemsListView.Groups.FirstItem;
  Item.Bold:= True;
  repeat
    ShowItem:= FormMain.ValidateEmulatorFile(Item.ImageIndex);
    //if Item.ImageIndex in [3, 4, 6] then // for debug only
    //   ShowItem:= False; // for debug only
    if (not ShowItem) and (Item.ImageIndex > 0) then
       Item.Visible:= False;
       //Item.State:= Item.State+[esosGhosted];
    Item:= SystemsListView.Groups.NextItem(Item);
  until Item = nil;
  SystemsListView.EndUpdate(False);
  ButtonReset.Click;
  if SystemsListView.Groups.VisibleItemCount < (MaxArcadeSystems+1) then
     begin
       HeightDiff:= SystemsListView.Height;
       SystemsListView.Height:= (SystemsListView.Groups.VisibleItemCount*SystemsListView.CellSizes.Report.Height)+6;
       HeightDiff:= HeightDiff-SystemsListView.Height;
       FormSelectFilterSystem.ClientHeight:= FormSelectFilterSystem.ClientHeight-HeightDiff;
     end;
end;

procedure TFormSelectFilterSystem.FormKeyPress(Sender: TObject; var Key: Char);
begin
  case Key of
    #13: if ButtonOk.Enabled then ButtonOk.Click;
    #27: ButtonCancel.Click;
  end;
end;

procedure TFormSelectFilterSystem.FormActivate(Sender: TObject);
begin
  if FormSelectFilterSystem.Tag = 1 then
     Exit;

  FormMain.ELV_ResetNormalColors(SystemsListView);
  SystemsListView.Selection.AlphaBlend:= False;
  SystemsListView.Selection.RoundRect:= False;
  FormMain.ELV_PopulateSystems(SystemsListView, True);
  SetSystemsState;
  FormSelectFilterSystem.Tag:= 1;
end;

procedure TFormSelectFilterSystem.SystemsListViewItemSelectionChanged(
  Sender: TCustomEasyListview; Item: TEasyItem);
begin
  if Item.Selected then
     ButtonOk.Enabled:= FormMain.CheckSelected(SystemsListView);
end;

procedure TFormSelectFilterSystem.SystemsListViewKeyAction(
  Sender: TCustomEasyListview; var CharCode: Word; var Shift: TShiftState;
  var DoDefault: Boolean);
begin
  case CharCode of
    VK_RETURN: if ButtonOk.Enabled then ButtonOk.Click;
    VK_ESCAPE: ButtonCancel.Click;
  end;
end;

procedure TFormSelectFilterSystem.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if ModalResult = mrOk then
     CanClose:= FormMain.CheckSelected(SystemsListView);
end;

procedure TFormSelectFilterSystem.SystemsListViewDblClick(
  Sender: TCustomEasyListview; Button: TCommonMouseButton;
  MousePos: TPoint; ShiftState: TShiftState; var Handled: Boolean);
begin
  if ButtonOk.Enabled then ButtonOk.Click;
end;

procedure TFormSelectFilterSystem.ButtonResetClick(Sender: TObject);
var
  Item: TEasyItem;
begin
  SystemsListView.Selection.ClearAll;
  if FormMain.FilterSys[0] then
     begin
       FormMain.ELV_SelectItem(SystemsListView, 0);
       SystemsListView.SetFocus;
       Exit;
     end;
  Item:= SystemsListView.Groups.FirstItem;
  Item:= SystemsListView.Groups.NextItem(Item); // get first system, bypass "all systems"
  repeat
    if FormMain.FilterSys[Item.ImageIndex] and (Item.Visible) then
       FormMain.ELV_SelectItem(SystemsListView, Item.ImageIndex);
    Item:= SystemsListView.Groups.NextItem(Item); // get first system, bypass "all systems"
  until Item = nil;
  SystemsListView.SetFocus;
end;

end.
