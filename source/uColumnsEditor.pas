unit uColumnsEditor;

interface

uses
  Windows, SysUtils, Classes, Graphics, Controls, Forms,
  StdCtrls, ExtCtrls, ComCtrls, IniFiles, Buttons,
  MPCommonObjects, MPCommonUtilities, EasyListview, ImgList, PanelEx,
  AdvOfficeButtons;

type
  TFormColumnsEditor = class(TForm)
    ColumnsListView: TEasyListview;
    ButtonUp: TBitBtn;
    ButtonDown: TBitBtn;
    ButtonEditWidth: TBitBtn;
    ButtonReloadProfile: TBitBtn;
    ButtonDefault: TBitBtn;
    ButtonDefaultSize: TBitBtn;
    ButtonResetSize: TBitBtn;
    ButtonSizeDecrease: TBitBtn;
    ButtonSizeIncrease: TBitBtn;
    LabelButtonUpDown: TLabel;
    LabelButtonEditWidth: TLabel;
    LabelButtonSize: TLabel;
    LabelButtonDefaultSize: TLabel;
    LabelButtonResetSize: TLabel;
    LabelButtonReloadProfileDefaultSettings: TLabel;
    Shape2: TShape;
    PanelButtons: TPanelEx;
    ButtonOk: TBitBtn;
    ButtonCancel: TBitBtn;
    PanelEx2: TPanelEx;
    Label1: TLabel;
    LabelToggleVisibility: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure ColumnsListViewItemPaintText(Sender: TCustomEasyListview;
      Item: TEasyItem; Position: Integer; ACanvas: TCanvas);
    procedure ColumnsListViewItemCheckChange(Sender: TCustomEasyListview;
      Item: TEasyItem);
    procedure ColumnsListViewItemEdited(Sender: TCustomEasyListview;
      Item: TEasyItem; var NewValue: Variant; var Accept: Boolean);
    procedure ColumnsListViewItemEditEnd(Sender: TCustomEasyListview;
      Item: TEasyItem);
    procedure ColumnsListViewKeyAction(Sender: TCustomEasyListview;
      var CharCode: Word; var Shift: TShiftState; var DoDefault: Boolean);
    procedure ColumnsListViewDblClick(Sender: TCustomEasyListview;
      Button: TCommonMouseButton; MousePos: TPoint;
      ShiftState: TShiftState; var Handled: Boolean);
    procedure ButtonDefaultSizeClick(Sender: TObject);
    procedure ButtonResetSizeClick(Sender: TObject);
    procedure ButtonUpClick(Sender: TObject);
    procedure ButtonEditWidthClick(Sender: TObject);
    procedure ButtonReloadProfileClick(Sender: TObject);
    procedure ButtonDefaultClick(Sender: TObject);
    procedure ButtonSizeDecreaseClick(Sender: TObject);
  private
    procedure MoveColumn(MoveUp: Boolean);
    procedure ResetColumns(DefaultSettings: Boolean = False);
    procedure Resize480Height;
    procedure SetDefaultProfile;
    procedure LoadProfile;
    function  SaveProfile: Boolean;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormColumnsEditor: TFormColumnsEditor;

implementation

uses uMain, uCommon, uPreferences;

{$R *.DFM}

procedure TFormColumnsEditor.MoveColumn(MoveUp: Boolean);
var
  selItem, newPosItem: TEasyItem;
begin
  if not FormMain.CheckSelected(ColumnsListView) then
     Exit;
  selItem:= ColumnsListView.Selection.First;
  if selItem.Index = 0 then
     begin
       ColumnsListView.SetFocus;
       Exit;
     end;
  case MoveUp of
    True:
      begin
        newPosItem:= ColumnsListView.Groups.PrevItem(selItem);
        if newPosItem.Index <> 0 then
           ColumnsListView.Items.Exchange(selItem.Index, newPosItem.Index);
      end;
    False:
      begin
        newPosItem:= ColumnsListView.Groups.NextItem(selItem);
        if newPosItem <> nil then
           ColumnsListView.Items.Exchange(selItem.Index, newPosItem.Index);
      end;
  end;
  ColumnsListView.SetFocus;
end;

procedure TFormColumnsEditor.ResetColumns(DefaultSettings: Boolean = False);
var
  gColumn: TEasyColumn;
begin
  ColumnsListView.Tag:= 1;
  FormMain.ClearListView(ColumnsListView);
  gColumn:= nil;
  ColumnsListView.BeginUpdate;
  case DefaultSettings of
    True : gColumn:= FormMain.GamesListView.Header.FirstColumn;
    False: gColumn:= FormMain.GamesListView.Header.FirstColumnByPosition;
  end;
  repeat
    with ColumnsListView.Items.Add do
    begin
      ImageIndex:= gColumn.Index;
      case gColumn.Index of
        17: Caption:= aColumns[gColumn.Index, 1]+' (count)';
        21: Caption:= aColumns[gColumn.Index, 1]+' (date)';
      else
            Caption:= aColumns[gColumn.Index, 1];
      end;
      case DefaultSettings of
        True:
          begin
            Captions[1]:= IntToStr(aColumnsWidth[gColumn.Index]);
            Checked:= True;
          end;
        False:
          begin
            Captions[1]:= IntToStr(gColumn.Width);
            Checked:= gColumn.Visible;
          end;
      end;
    end;
    case DefaultSettings of
      True : gColumn:= FormMain.GamesListView.Header.NextColumn(gColumn); 
      False: gColumn:= FormMain.GamesListView.Header.NextColumnByPosition(gColumn);
    end;
  until gColumn = nil;
  ColumnsListView.EndUpdate;
  ColumnsListView.Tag:= 0;
  ColumnsListView.SetFocus;
end;

procedure TFormColumnsEditor.Resize480Height;
begin
  if Screen.Height > 480 then
     Exit;

  ColumnsListView.Height:= ColumnsListView.Height-62;
  ColumnsListView.Header.Columns[0].Width:= ColumnsListView.Header.Columns[0].Width-19;

  PanelButtons.Top:= PanelButtons.Top-62;
  FormColumnsEditor.ClientHeight:= 402;
end;

procedure TFormColumnsEditor.SetDefaultProfile;
var
  gColumn: TEasyColumn;
begin
  FormMain.GamesListView.BeginUpdate;
  gColumn:= FormMain.GamesListView.Header.FirstColumn;
  repeat
    if gColumn.Position <> gColumn.Index then
       gColumn.Position:= gColumn.Index;
    if gColumn.Width <> aColumnsWidth[gColumn.Index] then
       gColumn.Width:= aColumnsWidth[gColumn.Index];
    if not gColumn.Visible then
       gColumn.Visible:= True;
    gColumn:= FormMain.GamesListView.Header.NextColumn(gColumn);
  until gColumn = nil;
  FormMain.GamesListView.EndUpdate;
end;

procedure TFormColumnsEditor.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
  case Key of
    #13: ButtonOk.Click;
    #27: ButtonCancel.Click;
  end;
end;

procedure TFormColumnsEditor.FormShow(Sender: TObject);
begin
  Resize480Height;
  FormMain.ELV_ResetNormalColors(ColumnsListView);
  ResetColumns;
end;

procedure TFormColumnsEditor.LoadProfile;
var
  Loop: Integer;
  columnFile: TMemIniFile;
  Value: Integer;
begin
  columnFile:= TMemIniFile.Create(FormMain.GetColumnProfile);
  try
    if not FormMain.SetColumnsMemList(columnFile) then
       begin
         FreeAndNil(columnFile);
         Exit;
       end;
    ColumnsListView.Tag:= 1;
    FormMain.ClearListView(ColumnsListView);

    for Loop:=0 to FormMain.GamesListView.Header.Columns.Count-1 do
    begin
      with ColumnsListView.Items.Add do
      begin
        ImageIndex:= FormMain.ColumnsPosList[Loop]; // column ID number (fixed, never changes)
        case Loop of
          17: Caption:= aColumns[FormMain.ColumnsPosList[Loop], 1]+' (count)';
          21: Caption:= aColumns[FormMain.ColumnsPosList[Loop], 1]+' (date)';
        else
              Caption:= aColumns[FormMain.ColumnsPosList[Loop], 1];
        end;
        Value:= columnFile.ReadInteger('Width', aColumns[FormMain.ColumnsPosList[Loop], 0], aColumnsWidth[FormMain.ColumnsPosList[Loop]]);
        Captions[1]:= IntToStr(Value);
        if FormMain.ColumnsPosList[Loop] = 0 then
           Value:= 1
        else
           Value:= columnFile.ReadInteger('Visible', aColumns[FormMain.ColumnsPosList[Loop], 0], 1);
        Checked:= Boolean(Value);
      end;
    end;
    ColumnsListView.EndUpdate;
  finally
    ColumnsListView.Tag:= 0;
    FreeAndNil(columnFile);
    for Loop:=0 to Length(FormMain.ColumnsPosList) do
        Finalize(FormMain.ColumnsPosList);
  end;
  ColumnsListView.SetFocus;
  FormMain.ELV_SelectItem(ColumnsListView, 0);
end;

function TFormColumnsEditor.SaveProfile: Boolean;
var
  columnFile: TMemIniFile;
  Item: TEasyItem;
begin
  Result:= False; // frontend's default columns profile
  DeleteFile(FormMain.GetColumnProfile); // will always rewrite the profile, not matter what (OK button was clicked)
  columnFile:= TMemIniFile.Create(FormMain.GetColumnProfile);
  Item:= ColumnsListView.Groups.FirstItem;
  repeat
    if Item.ImageIndex <> 0 then // no reposition of title column!!
       begin
         if Item.Index <> Item.ImageIndex then
            begin
              columnFile.WriteInteger('Position', aColumns[Item.ImageIndex, 0], Item.Index);
              Result:= True;
            end;
       end;

    if Item.Captions[1] = '' then
       Item.Captions[1]:= IntToStr(aColumnsWidth[Item.ImageIndex]);
    if StrToInt(Item.Captions[1]) <> aColumnsWidth[Item.ImageIndex] then
       begin
         columnFile.WriteInteger('Width', aColumns[Item.ImageIndex, 0], StrToInt(Item.Captions[1]));
         Result:= True;
       end;

    if not Item.Checked then
       begin
         columnFile.WriteInteger('Visible', aColumns[Item.ImageIndex, 0], 0);
         Result:= True;
       end;

    Item:= ColumnsListView.Groups.NextItem(Item);
  until Item = nil;
  if Result then
     columnFile.UpdateFile;
  FreeAndNil(columnFile);
end;

procedure TFormColumnsEditor.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  CanClose:= not FormMain.ELV_IsEditing(ColumnsListView);
  if CanClose then
     begin
       if ModalResult = mrOk then
          begin
            case SaveProfile of
              True : FormMain.ReadColumnProfile;
              False: SetDefaultProfile;
            end;
          end;
     end;
end;

procedure TFormColumnsEditor.ColumnsListViewItemPaintText(
  Sender: TCustomEasyListview; Item: TEasyItem; Position: Integer;
  ACanvas: TCanvas);
begin
  if not Item.Checked then
     ACanvas.Font.Color:= clGray;
end;

procedure TFormColumnsEditor.ColumnsListViewItemCheckChange(
  Sender: TCustomEasyListview; Item: TEasyItem);
begin
  if ColumnsListView.Tag = 1 then
     Exit;
  if Item.Index = 0 then
     if not Item.Checked then
        Item.Checked:= True;
end;

procedure TFormColumnsEditor.ColumnsListViewItemEdited(
  Sender: TCustomEasyListview; Item: TEasyItem; var NewValue: Variant;
  var Accept: Boolean);
var
  NewValueInt: Integer;
begin
  case ColumnsListView.Tag of
    2: // edit size (column 1)
      begin
        if NewValue = '' then
           begin
             Accept:= False;
             Exit;
           end;
        try
          NewValueInt:= StrToInt(NewValue);
        except
          on E: EConvertError do
             begin
               Accept:= False;
               Exit;
             end;
        end;
        if NewValueInt < 10 then
           NewValueInt:= 10;
        if not SameText(Item.Captions[1], IntToStr(NewValueInt)) then
           Item.Captions[1]:= IntToStr(NewValueInt);
      end;
  end;
  ColumnsListView.Tag:= 0;
end;

procedure TFormColumnsEditor.ColumnsListViewItemEditEnd(
  Sender: TCustomEasyListview; Item: TEasyItem);
begin
  FormMain.ELV_SetEditManager(ColumnsListView, False);
  FormMain.SetFormKeyPreview(FormColumnsEditor);
end;

procedure TFormColumnsEditor.ColumnsListViewKeyAction(
  Sender: TCustomEasyListview; var CharCode: Word; var Shift: TShiftState;
  var DoDefault: Boolean);
begin
  if FormMain.ELV_IsEditing(TEasyListView(Sender)) then
     begin
       CharCode:= 0;
       Exit;
     end;
  case CharCode of
    VK_UP, VK_DOWN:
      begin
        if Shift = [ssCtrl] then
           begin
             if FormMain.CheckSelected(ColumnsListView) then
                begin
                  if ColumnsListView.Selection.First.Index = 0 then
                     begin
                       CharCode:= 0;
                       Exit;
                     end
                  else
                     begin
                       if CharCode = VK_UP then
                          begin
                            if ColumnsListView.Selection.First.Index = 1 then
                               begin
                                 CharCode:= 0;
                                 Exit;
                               end
                            else
                               ButtonUp.Click;
                          end
                       else
                          ButtonDown.Click;
                     end;
                end;
           end;
      end;
    VK_LEFT, VK_RIGHT:
      begin
        if Shift = [ssCtrl] then
           begin
             if CharCode = VK_LEFT then
                ButtonSizeDecrease.Click
             else
                ButtonSizeIncrease.Click;
           end
        else
           begin
             CharCode:= 0;
             Exit;
           end;
      end;
    VK_F2: ButtonEditWidth.Click;
    VK_F4: ButtonResetSize.Click;
    VK_F3: ButtonDefaultSize.Click;
    VK_F5: ButtonReloadProfile.Click;
    VK_F6: ButtonDefault.Click;
  end;
end;

procedure TFormColumnsEditor.ColumnsListViewDblClick(
  Sender: TCustomEasyListview; Button: TCommonMouseButton;
  MousePos: TPoint; ShiftState: TShiftState; var Handled: Boolean);
begin
  ButtonEditWidth.Click;
end;

procedure TFormColumnsEditor.ButtonDefaultSizeClick(Sender: TObject);
begin
  if FormMain.CheckSelected(ColumnsListView) then
     begin
       ColumnsListView.Tag:= 2;
       ColumnsListView.Selection.First.Captions[1]:= IntToStr(aColumnsWidth[ColumnsListView.Selection.First.ImageIndex]);
       ColumnsListView.Tag:= 0;
     end;
end;

procedure TFormColumnsEditor.ButtonResetSizeClick(Sender: TObject);
begin
  if FormMain.CheckSelected(ColumnsListView) then
     begin
       ColumnsListView.Tag:= 2;
       ColumnsListView.Selection.First.Captions[1]:= IntToStr(FormMain.GamesListView.Header.Columns[ColumnsListView.Selection.First.ImageIndex].Width);
       ColumnsListView.Tag:= 0;
     end;
end;

procedure TFormColumnsEditor.ButtonUpClick(Sender: TObject);
begin
  MoveColumn(Boolean(TBitBtn(Sender).Tag));
end;

procedure TFormColumnsEditor.ButtonEditWidthClick(Sender: TObject);
begin
  FormMain.SetFormKeyPreview(FormColumnsEditor);
  ColumnsListView.Tag:= TBitBtn(Sender).Tag+1; // Tag = 2 (size column)
  FormMain.ELV_EnableEdit(ColumnsListView, TToolButton(Sender).Tag);
end;

procedure TFormColumnsEditor.ButtonReloadProfileClick(Sender: TObject);
begin
  LoadProfile;
end;

procedure TFormColumnsEditor.ButtonDefaultClick(Sender: TObject);
begin
  ResetColumns(True);
  ColumnsListView.SetFocus;
  FormMain.ELV_SelectItem(ColumnsListView, 0);
end;

procedure TFormColumnsEditor.ButtonSizeDecreaseClick(Sender: TObject);
var
  tSize: Integer;
begin
  if not FormMain.CheckSelected(ColumnsListView) then
     Exit;
  tSize:= StrToInt(ColumnsListView.Selection.First.Captions[1]);
  case TBitBtn(Sender).Tag of
    0: Dec(tSize); // VK_LEFT
    1: Inc(tSize); // VK_RIGHT
  end;
  ColumnsListView.Tag:= 2;
  ColumnsListView.Selection.First.Captions[1]:= IntToStr(tSize);
  ColumnsListView.Tag:= 0;
end;

end.
