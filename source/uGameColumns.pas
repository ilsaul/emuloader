unit uGameColumns;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  StdCtrls, ExtCtrls, ComCtrls, GR32_RangeBars;

type
  TFormFilterGameColumns = class(TForm)
    ButtonOk: TButton;
    ButtonCancel: TButton;
    PageControlVisibleColumns: TPageControl;
    TabSheetVisibleColumns: TTabSheet;
    BottomLine: TBevel;
    LabelCaption: TLabel;
    TopImage: TImage;
    ColumnsList: TListView;
    ButtonsBox: TGroupBox;
    ButtonShowHide: TButton;
    ButtonUp: TButton;
    ButtonDown: TButton;
    procedure ButtonCancelClick(Sender: TObject);
    procedure ButtonOkClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ButtonUpClick(Sender: TObject);
    procedure ButtonDownClick(Sender: TObject);
    procedure ButtonShowHideClick(Sender: TObject);
    procedure ColumnsListSelectItem(Sender: TObject; Item: TListItem;
      Selected: Boolean);
    procedure ColumnsListClick(Sender: TObject);
    procedure ColumnsListKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormFilterGameColumns: TFormFilterGameColumns;

implementation

uses uMain;

{$R *.DFM}

procedure TFormFilterGameColumns.ButtonCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TFormFilterGameColumns.ButtonOkClick(Sender: TObject);
begin
  FormMain.UpdateColumnsVisibility;
  Close;
end;

procedure TFormFilterGameColumns.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #27 then
     ButtonCancel.OnClick(Self)
  else
  if Key = #13 then
     ButtonOk.OnClick(Self);
end;

procedure TFormFilterGameColumns.FormShow(Sender: TObject);
var
  Loop: ShortInt;
begin
{
 Columns ID Index
   1 - Year
   2 - Manufacturer
   3 - Sound
   4 - Frequency
   5 - Samples
   6 - Control Type
   7 - Video
   8 - Orientation
   9 - Resolution
  10 - Driver Status
  11 - Sound Status
  12 - Color Status
  13 - Merged
  14 - Name
  15 - Clone of
  16 - Category
  17 - Version Added
  18 - Driver
}
  FormMain.UpdateGeneralAppearance(FormFilterGameColumns);
  FormMain.SetGameColumnsLanguage;

  ColumnsList.Items.BeginUpdate;
  for Loop:=1 to FormMain.List.Columns.Count-1 do
  begin
    with ColumnsList.Items.Add do
    begin
      Caption:= FormMain.List.Columns[Loop].Caption;
      ImageIndex:= FormMain.List.Columns[Loop].ID; // column ID number (fixed, never changes)
      Checked:= (FormMain.List.Columns[Loop].Tag = 1); // column tag: 0 - hide / 1 - show
    end;
  end;
  ColumnsList.Items.EndUpdate;
end;

procedure TFormFilterGameColumns.FormCreate(Sender: TObject);
begin
  if FileExists(FormMain.FrontendPath+'resources\images\topwindow\GameColumns.png') then
     TopImage.Picture.LoadFromFile(FormMain.FrontendPath+'resources\images\topwindow\GameColumns.png');
end;

procedure TFormFilterGameColumns.ButtonUpClick(Sender: TObject);
var
  ItemCaption: String;
  ItemPosition, ItemID: ShortInt;
  ItemChecked: Boolean;
  InsertItem: TListItem;
begin
  if (ColumnsList.Selected <> nil) and (ColumnsList.Selected.Index > 0) then
     begin
       ItemCaption:= ColumnsList.Selected.Caption;
       ItemPosition:= ColumnsList.Selected.Index;
       ItemChecked:= ColumnsList.Selected.Checked;
       ItemID:= ColumnsList.Selected.ImageIndex;
       ColumnsList.DeleteSelected;
       with ColumnsList do
         InsertItem:= Items.Insert(ItemPosition-1);
       InsertItem.Caption:= ItemCaption;
       InsertItem.Checked:= ItemChecked;
       InsertItem.ImageIndex:= ItemID;
       ColumnsList.ItemFocused:= ColumnsList.Items[ItemPosition-1];
       ColumnsList.ItemIndex:= ItemPosition-1;
       ColumnsList.Selected.MakeVisible(False);
     end;
     ColumnsList.SetFocus;
end;

procedure TFormFilterGameColumns.ButtonDownClick(Sender: TObject);
var
  ItemCaption: String;
  ItemPosition, ItemID: ShortInt;
  ItemChecked: Boolean;
  InsertItem: TListItem;
begin
  if (ColumnsList.Selected <> nil) and (ColumnsList.Selected.Index < 17) then
     begin
       ItemCaption:= ColumnsList.Selected.Caption;
       ItemPosition:= ColumnsList.Selected.Index;
       ItemChecked:= ColumnsList.Selected.Checked;
       ItemID:= ColumnsList.Selected.ImageIndex;

       ColumnsList.DeleteSelected;
       with ColumnsList do
         InsertItem:= Items.Insert(ItemPosition+1);
       InsertItem.Caption:= ItemCaption;
       InsertItem.Checked:= ItemChecked;
       InsertItem.ImageIndex:= ItemID;
       ColumnsList.ItemFocused:= ColumnsList.Items[ItemPosition+1];
       ColumnsList.ItemIndex:= ItemPosition+1;
       ColumnsList.Selected.MakeVisible(False);
     end;
     ColumnsList.SetFocus;
end;

procedure TFormFilterGameColumns.ButtonShowHideClick(Sender: TObject);
begin
  if ColumnsList.Selected = nil then
     Exit;
  case ButtonShowHide.Tag of
    0: // 0 means column is hidden
      begin
        ButtonShowHide.Tag:= 1;
        ButtonShowHide.Caption:= FormMain.GetLanguageText('Resource', 'ButtonHide', '&Hide');
      end;
    1: // 1 means column is visible
      begin
        ButtonShowHide.Tag:= 0;
        ButtonShowHide.Caption:= FormMain.GetLanguageText('Resource', 'ButtonShow', '&Show');
      end;
  end;
  ColumnsList.Selected.Checked:= Boolean(ButtonShowHide.Tag);
  ColumnsList.SetFocus;
end;

procedure TFormFilterGameColumns.ColumnsListSelectItem(Sender: TObject;
  Item: TListItem; Selected: Boolean);
begin
  if Selected then
     ColumnsList.OnClick(Self);
end;

procedure TFormFilterGameColumns.ColumnsListClick(Sender: TObject);
begin
  if ColumnsList.Selected <> nil then
     begin
       ButtonShowHide.Tag:= Ord(ColumnsList.Selected.Checked);
       case ColumnsList.Selected.Checked of
         True : ButtonShowHide.Caption:= FormMain.GetLanguageText('Resource', 'ButtonHide', '&Hide');
         False: ButtonShowHide.Caption:= FormMain.GetLanguageText('Resource', 'ButtonShow', '&Show');
       end;
     end;
end;

procedure TFormFilterGameColumns.ColumnsListKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_SPACE then
     ColumnsList.OnClick(Self);
end;

end.
