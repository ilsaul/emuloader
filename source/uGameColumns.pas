unit uGameColumns;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  StdCtrls, ExtCtrls, ComCtrls, IniFiles;

type
  TFormFilterGameColumns = class(TForm)
    ButtonOk: TButton;
    ButtonCancel: TButton;
    PageControlVisibleColumns: TPageControl;
    TabSheetVisibleColumns: TTabSheet;
    ColumnsList: TListView;
    ButtonDefault: TButton;
    ButtonShowHide: TButton;
    ButtonUp: TButton;
    ButtonDown: TButton;
    ButtonSave: TButton;
    ButtonLoad: TButton;
    ColumnSizeUpDown: TUpDown;
    ColumnSize: TEdit;
    procedure ButtonCancelClick(Sender: TObject);
    procedure ButtonOkClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure ButtonUpClick(Sender: TObject);
    procedure ButtonDownClick(Sender: TObject);
    procedure ButtonShowHideClick(Sender: TObject);
    procedure ColumnsListSelectItem(Sender: TObject; Item: TListItem;
      Selected: Boolean);
    procedure ColumnsListClick(Sender: TObject);
    procedure ColumnsListKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ButtonDefaultClick(Sender: TObject);
    procedure ButtonLoadClick(Sender: TObject);
    procedure ButtonSaveClick(Sender: TObject);
    procedure ColumnSizeUpDownClick(Sender: TObject; Button: TUDBtnType);
  private
    ColumnsDefaultSize: array of Integer;
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
  19 - Game X Played
  20 - Game Play Time
}
  SetLength(ColumnsDefaultSize, 22);
  ColumnsDefaultSize[0]:= 300;
  ColumnsDefaultSize[1]:= 65;
  ColumnsDefaultSize[2]:= 150;
  ColumnsDefaultSize[3]:= 73;
  ColumnsDefaultSize[4]:= 70;
  ColumnsDefaultSize[5]:= 83;
  ColumnsDefaultSize[6]:= 110;
  ColumnsDefaultSize[7]:= 70;
  ColumnsDefaultSize[8]:= 100;
  ColumnsDefaultSize[9]:= 95;
  ColumnsDefaultSize[10]:= 85;
  ColumnsDefaultSize[11]:= 85;
  ColumnsDefaultSize[12]:= 85;
  ColumnsDefaultSize[13]:= 78;
  ColumnsDefaultSize[14]:= 80;
  ColumnsDefaultSize[15]:= 80;
  ColumnsDefaultSize[16]:= 180;
  ColumnsDefaultSize[17]:= 100;
  ColumnsDefaultSize[18]:= 80;
  ColumnsDefaultSize[19]:= 50;
  ColumnsDefaultSize[20]:= 70;

  FormMain.UpdateGeneralAppearance(FormFilterGameColumns);
  FormMain.SetGameColumnsLanguage;

  ColumnsList.Items.BeginUpdate;
  for Loop:=1 to FormMain.List.Columns.Count-1 do
  begin
    with ColumnsList.Items.Add do
    begin
      Caption:= FormMain.List.Column[Loop].Caption;
      ImageIndex:= FormMain.List.Column[Loop].ID; // column ID number (fixed, never changes)
      Checked:= (FormMain.List.Column[Loop].Tag = 1); // column tag: 0 - hide / 1 - show
      if FormMain.List.Column[Loop].Width = 0 then
         SubItems.Add(IntToStr(ColumnsDefaultSize[ImageIndex])) // column size
      else
         SubItems.Add(IntToStr(FormMain.List.Column[Loop].Width)); // column size
    end;
  end;
  ColumnsList.Items.EndUpdate;
end;

procedure TFormFilterGameColumns.ButtonUpClick(Sender: TObject);
var
  ItemCaption: String;
  ItemPosition, ItemID: ShortInt;
  ItemSize: Integer;
  ItemChecked: Boolean;
  InsertItem: TListItem;
begin
  if (ColumnsList.Selected <> nil) and (ColumnsList.Selected.Index > 0) then
     begin
       ItemCaption:= ColumnsList.Selected.Caption;
       ItemPosition:= ColumnsList.Selected.Index;
       ItemChecked:= ColumnsList.Selected.Checked;
       ItemID:= ColumnsList.Selected.ImageIndex;
       ItemSize:= StrToInt(ColumnsList.Selected.SubItems[0]);
       ColumnsList.DeleteSelected;
       with ColumnsList do
         InsertItem:= Items.Insert(ItemPosition-1);
       InsertItem.Caption:= ItemCaption;
       InsertItem.Checked:= ItemChecked;
       InsertItem.ImageIndex:= ItemID;
       InsertItem.SubItems.Add(IntToStr(ItemSize));
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
  ItemSize: Integer;
  ItemChecked: Boolean;
  InsertItem: TListItem;
begin
  if (ColumnsList.Selected <> nil) and (ColumnsList.Selected.Index < (FormMain.List.Columns.Count-2)) then
     begin
       ItemCaption:= ColumnsList.Selected.Caption;
       ItemPosition:= ColumnsList.Selected.Index;
       ItemChecked:= ColumnsList.Selected.Checked;
       ItemID:= ColumnsList.Selected.ImageIndex;
       ItemSize:= StrToInt(ColumnsList.Selected.SubItems[0]);

       ColumnsList.DeleteSelected;
       with ColumnsList do
         InsertItem:= Items.Insert(ItemPosition+1);
       InsertItem.Caption:= ItemCaption;
       InsertItem.Checked:= ItemChecked;
       InsertItem.ImageIndex:= ItemID;
       InsertItem.SubItems.Add(IntToStr(ItemSize));
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
       ColumnSizeUpDown.Position:= StrToInt(ColumnsList.Selected.SubItems[0]);
       ColumnSizeUpDown.Refresh;
     end;
end;

procedure TFormFilterGameColumns.ColumnsListKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_SPACE then
     ColumnsList.OnClick(Self);
end;

procedure TFormFilterGameColumns.ButtonDefaultClick(Sender: TObject);
var
  Loop, ColumnIndex: ShortInt;
begin
  ColumnsList.Items.BeginUpdate;
  ColumnsList.Clear;
  for Loop:=1 to FormMain.List.Columns.Count-1 do
  begin
    with ColumnsList.Items.Add do
    begin
      ColumnIndex:= FormMain.GetColumnIndex(Loop);
      Caption:= FormMain.List.Column[ColumnIndex].Caption;
      ImageIndex:= FormMain.List.Column[ColumnIndex].ID; // column ID number (fixed, never changes)
      SubItems.Add(IntToStr(ColumnsDefaultSize[ImageIndex]));
      Checked:= True;
    end;
  end;
  ColumnsList.Items.EndUpdate;
end;

procedure TFormFilterGameColumns.ButtonLoadClick(Sender: TObject);
var
  Loop, ColumnIndex: Integer;
  INIFile: TIniFile;
begin
  SetCurrentDir(FormMain.FrontendPath+'resources\columns\');
  FormMain.OpenDialog.FileName:= '';
  FormMain.OpenDialog.InitialDir:= FormMain.FrontendPath+'resources\columns';
  FormMain.DialogOpenFile(6, FormMain.GetLanguageText('Game Columns', 'LoadFileDialogTitle', 'Select a Columns Profile to Load'), nil);
  if FormMain.OpenDialog.FileName <> '' then
     begin
       INIFile:= TIniFile.Create(FormMain.OpenDialog.FileName);
       ColumnsList.Items.BeginUpdate;
       ColumnsList.Items.Clear;
       for Loop:=1 to FormMain.List.Columns.Count-2 do
       begin
         ColumnIndex:= INIFile.ReadInteger('Position', IntToStr(Loop), Loop);
         with ColumnsList.Items.Add do
         begin
           ImageIndex:= ColumnIndex; // column ID number (fixed, never changes)
           Caption:=  FormMain.List.Column[FormMain.GetColumnIndex(ColumnIndex)].Caption;
           Checked:= Boolean(INIFile.ReadInteger('Visible', IntToStr(Loop), 1)); // column tag: 0 - hide / 1 - show
           SubItems.Add(IntToStr(INIFile.ReadInteger('Width', IntToStr(Loop), ColumnsDefaultSize[ImageIndex])));
         end;
       end;
       ColumnsList.Items.EndUpdate;
       FreeAndNil(INIFile);
     end;
  FormMain.OpenDialog.InitialDir:= '';
  ColumnsList.SetFocus;
end;

procedure TFormFilterGameColumns.ButtonSaveClick(Sender: TObject);
var
  Loop: Integer;
  INIFile: TIniFile;
begin
  SetCurrentDir(FormMain.FrontendPath+'resources\columns\');
  FormMain.GamesListSaveDialog.InitialDir:= FormMain.FrontendPath+'resources\columns';
  FormMain.GamesListSaveDialog.FilterIndex:= 4;
  FormMain.GamesListSaveDialog.Title:= FormMain.GetLanguageText('Game Columns', 'SaveFileDialogTitle', 'Save Current Columns Settings');
  FormMain.GamesListSaveDialog.FileName:= 'New Profile.ini';
  if FormMain.GamesListSaveDialog.Execute then
     begin
       if LowerCase(ExtractFileExt(FormMain.GamesListSaveDialog.FileName)) <> '.ini' then
          FormMain.GamesListSaveDialog.FileName:= FormMain.GamesListSaveDialog.FileName+'.ini';
       INIFile:= TIniFile.Create(FormMain.GamesListSaveDialog.FileName);
       for Loop:=0 to ColumnsList.Items.Count-1 do
       begin
         INIFile.WriteInteger('Position', IntToStr(Loop+1), ColumnsList.Items[Loop].ImageIndex);
         INIFile.WriteInteger('Visible', IntToStr(Loop+1), Ord(ColumnsList.Items[Loop].Checked));
         INIFile.WriteInteger('Width', IntToStr(Loop+1), StrToInt(ColumnsList.Items[Loop].SubItems[0]));
       end;
       FreeAndNil(INIFile);
     end;
  FormMain.GamesListSaveDialog.FilterIndex:= 1;
  FormMain.GamesListSaveDialog.InitialDir:= '';
  ColumnsList.SetFocus;
end;

procedure TFormFilterGameColumns.ColumnSizeUpDownClick(Sender: TObject;
  Button: TUDBtnType);
begin
  if ColumnsList.Selected <> nil then
     ColumnsList.Selected.SubItems[0]:= IntToStr(ColumnSizeUpDown.Position);
end;

end.
