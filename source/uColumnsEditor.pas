unit uColumnsEditor;

interface

uses
  Windows, SysUtils, Classes, Graphics, Controls, Forms,
  StdCtrls, ExtCtrls, ComCtrls, IniFiles, Buttons,
  MPCommonObjects, MPCommonUtilities, EasyListview, ImgList, PanelEx,
  ShadowLabel, ButtonsEx;

type
  TFormColumnsEditor = class(TForm)
    ButtonUp: TBitBtnEx;
    ButtonDown: TBitBtnEx;
    ButtonEditWidth: TBitBtnEx;
    ButtonReloadProfile: TBitBtnEx;
    ButtonDefault: TBitBtnEx;
    ButtonDefaultSize: TBitBtnEx;
    ButtonResetSize: TBitBtnEx;
    ButtonSizeDecrease: TBitBtnEx;
    ButtonSizeIncrease: TBitBtnEx;
    LabelButtonUpDown: TShadowLabel;
    LabelButtonEditWidth: TShadowLabel;
    LabelButtonSize: TShadowLabel;
    LabelButtonDefaultSize: TShadowLabel;
    LabelButtonResetSize: TShadowLabel;
    LabelButtonReloadProfileDefaultSettings: TShadowLabel;
    PanelBottom: TPanelEx;
    ButtonOk: TBitBtnEx;
    ButtonCancel: TBitBtnEx;
    PanelTitleTip: TPanelEx;
    LabelTitleTip: TShadowLabel;
    LabelToggleVisibility: TShadowLabel;
    LabelButtonSetDefaultAll: TShadowLabel;
    LabelTips: TShadowLabel;
    ButtonCustomizeColumnHeaderFont: TBitBtnEx;
    ButtonCustomizeColumnHeaderFontSetDefault: TBitBtnEx;
    ColumnsListView: TEasyListview;
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
    procedure ButtonCustomizeColumnHeaderFontClick(Sender: TObject);
    procedure ButtonCustomizeColumnHeaderFontSetDefaultClick(Sender: TObject);
  private
    procedure MoveColumn(MoveUp: Boolean);
    procedure ResetColumns(DefaultSettings: Boolean = False);
    procedure SetDefaultProfile;
    //procedure LoadProfile;
    function  SaveProfile: Boolean;
    procedure Resize4K;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormColumnsEditor: TFormColumnsEditor;

implementation

uses uMain, uCommon, uPreferences;

{$R *.DFM}

procedure TFormColumnsEditor.Resize4K;

  procedure MoveButton(iButton, iPrevButton: TBitBtnEx; nButtons: Integer = 1);
  begin
    FormMain.Set4KButtonSpecs(iButton, 420, iPrevButton.Top+(iPrevButton.Height*nButtons)+(10*nButtons), 168, 36, 16);
  end;

begin
  if not Is4KMode then
     Exit;

  with FormColumnsEditor do
  begin
    ColumnsListView.CellSizes.Report.Height:= 37;
    ColumnsListView.PaintInfoItem.CheckIndent:= 2;
    ColumnsListView.BorderWidth:= 8;
    ColumnsListView.Header.Columns[0].Width:= 324;
    ColumnsListView.Header.Columns[1].Width:= 70;
    FormMain.Set4KListViewCheckBoxHDSpecs(ColumnsListView);

    FormMain.Set4KListViewSpecs(ColumnsListView, 0, -2, 410, 910, 16, False); // "Consolas", size 16 - no vert text adjustment needed

    FormMain.Set4KPanelSpecs(PanelTitleTip, ColumnsListView.Left+ColumnsListView.Width, 0, 455, 90);
    FormMain.Set4KLabelSpecs(LabelTitleTip, 31, 6, 393, 47, 14);
    ClientWidth:= ColumnsListView.Width+PanelTitleTip.Width;
    ClientHeight:= ColumnsListView.Height-5;
    Font.Size:= 16;

    FormMain.Set4KPanelSpecs(PanelBottom, PanelTitleTip.Left, ClientHeight-71, PanelTitleTip.Width, 71);
    FormMain.Set4KButtonsOkCancelPanel(PanelBottom, ButtonOk, ButtonCancel);

    FormMain.Set4KLabelSpecs(LabelTips, 420, 653, 432, 116, 14);

    FormMain.Set4KButtonSpecs(ButtonUp,   420,                             100, 79, 36, 16);
    FormMain.Set4KButtonSpecs(ButtonDown, ButtonUp.Left+ButtonUp.Width+10, 100, 79, 36, 16);
    MoveButton(ButtonEditWidth, ButtonUp);
    FormMain.Set4KButtonSpecs(ButtonSizeDecrease, 420,                                                 ButtonEditWidth.Top+ButtonEditWidth.Height+10, 79, 36, 16);
    FormMain.Set4KButtonSpecs(ButtonSizeIncrease, ButtonSizeDecrease.Left+ButtonSizeDecrease.Width+10, ButtonSizeDecrease.Top,                        79, 36, 16);
    MoveButton(ButtonResetSize,     ButtonSizeDecrease);
    MoveButton(ButtonDefaultSize,   ButtonResetSize);
    MoveButton(ButtonReloadProfile, ButtonDefaultSize, 2);
    MoveButton(ButtonDefault,       ButtonReloadProfile);
    MoveButton(ButtonCustomizeColumnHeaderFont, ButtonDefault, 2);
    ButtonCustomizeColumnHeaderFont.Width:= 235;
    FormMain.Set4KButtonSpecs(ButtonCustomizeColumnHeaderFontSetDefault, ClientWidth-168-10, ButtonCustomizeColumnHeaderFont.Top, 168, 36, 16);

    FormMain.Set4KLabelSpecs(LabelButtonUpDown,      597, ButtonUp.Top+1, -1, -1, 16);
    FormMain.Set4KLabelSpecs(LabelButtonEditWidth,   597, ButtonEditWidth.Top+1, -1, -1, 16);
    FormMain.Set4KLabelSpecs(LabelButtonSize,        597, ButtonSizeDecrease.Top+1, -1, -1, 16);
    FormMain.Set4KLabelSpecs(LabelButtonResetSize,   597, ButtonResetSize.Top+1, -1, -1, 16);
    FormMain.Set4KLabelSpecs(LabelButtonDefaultSize, 597, ButtonDefaultSize.Top+1, -1, -1, 16);
    FormMain.Set4KLabelSpecs(LabelToggleVisibility,  597, ButtonDefaultSize.Top+ButtonDefaultSize.Height+10+1, -1, -1, 16);
    FormMain.Set4KLabelSpecs(LabelButtonReloadProfileDefaultSettings, 597, ButtonReloadProfile.Top+1, -1, -1, 16);
    FormMain.Set4KLabelSpecs(LabelButtonSetDefaultAll, 597, ButtonDefault.Top+1, -1, -1, 16);
  end;
end;

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
  IsMachinesList: Boolean;
  Loop, ColIndex: Integer;
begin
  // need to get the columns order from uCommon.aColumnsSoftwareListOrder[] array
  // default all -> IsMachinesList.... will have to write a separate function for it.
  // reset all -> IsMachinesLsit...... it works fine.

  ColumnsListView.Tag:= 1;
  FormMain.ClearListView(ColumnsListView);
  IsMachinesList:= FormMain.PanelMachinesList.Visible;
  gColumn:= nil;
  ColumnsListView.BeginUpdate;

  if DefaultSettings and IsMachinesList then
     begin
       for Loop:= Low(aColumnsSoftwareListOrder) to High(aColumnsSoftwareListOrder) do
       begin
         ColIndex:= aColumnsSoftwareListOrder[Loop];
         with ColumnsListView.Items.Add do
         begin
           ImageIndex:= ColIndex;
           case ColIndex of
             17: Caption:= aColumns[ColIndex, 1]+' (count)';
             20: Caption:= aColumns[ColIndex, 1]+' (date)';
           else
                 Caption:= aColumns[ColIndex, 1];
           end;
           Captions[1]:= IntToStr(aColumnsWidth[ColIndex]);
           Checked:= True;
         end;
       end;
     end
  else
  begin
    case DefaultSettings of
      True : gColumn:= FormMain.GamesListView.Header.FirstColumn;
      False: gColumn:= FormMain.GamesListView.Header.FirstColumnByPosition;
    end;
    repeat
      if (not IsMachinesList) or (IsMachinesList and FormMain.IsValidSoftwareListColumn(gColumn.Index)) then
      begin
        with ColumnsListView.Items.Add do
        begin
          ImageIndex:= gColumn.Index; // 'gColumn.Index' never changes its value!!
          case gColumn.Index of
            17: Caption:= aColumns[gColumn.Index, 1]+' (count)';
            20: Caption:= aColumns[gColumn.Index, 1]+' (date)';
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
      end;
      case DefaultSettings of
        True : gColumn:= FormMain.GamesListView.Header.NextColumn(gColumn);
        False: gColumn:= FormMain.GamesListView.Header.NextColumnByPosition(gColumn);
      end;
    until gColumn = nil;
  end;
  ColumnsListView.EndUpdate;
  ColumnsListView.Tag:= 0;
  ColumnsListView.SetFocus;
end;

procedure TFormColumnsEditor.SetDefaultProfile;
var
  gColumn: TEasyColumn;
  IsMachinesList: Boolean;
  Loop: Integer;
begin
  IsMachinesList:= FormMain.PanelMachinesList.Visible;
  FormMain.GamesListView.BeginUpdate;

  case IsMachinesList of
    True:
      begin
        for Loop:=Low(aColumnsSoftwareListOrder) to High(aColumnsSoftwareListOrder) do
        begin
          gColumn:= FormMain.GamesListView.Header.Columns[aColumnsSoftwareListOrder[Loop]];
          if gColumn.Position <> Loop then
             gColumn.Position:= Loop;
          if gColumn.Width <> aColumnsWidth[gColumn.Index] then
             gColumn.Width:= aColumnsWidth[gColumn.Index];
          if not gColumn.Visible then
             gColumn.Visible:= True;
        end;
        for Loop:= 1 to FormMain.GamesListView.Header.Columns.Count-1 do
            FormMain.GamesListView.Header.Columns[Loop].Visible:= FormMain.IsValidSoftwareListColumn(Loop);
      end;
    False:
      begin
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

      end;
  end;
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
var
  Loop: Integer;
begin
  Resize4K;
  FormMain.ELV_ResetNormalColors(ColumnsListView);
  if FormMain.PanelMachinesList.Visible then
     FormColumnsEditor.Caption:= 'Customize Software List Columns';

  if IsNightMode then
     begin
       FormColumnsEditor.Caption:= FormColumnsEditor.Caption+' (Night Mode)';
       FormMain.ELV_SetNightModeColors(ColumnsListView);
       FormMain.ELV_SetCheckRadioCustomIcon(ColumnsListView);

       FormColumnsEditor.Color:= menu_background_color[1];
       SetBottomPanelColors(PanelBottom);

       //PanelColumnsList.Color1:= clrLightBlack;
       FormMain.SetEasyListViewColors(ColumnsListView, clrLightBlack, clCream);
       FormMain.ELV_SetEditBkColor(ColumnsListView);

       SetPanelColors(PanelTitleTip, clrMedDarkGray, menu_background_color[1], False);
       SetLabelColors(LabelTitleTip, item_shortcut_color[1], item_shortcut_selected_color[1]);

       SetLabelColors(LabelButtonUpDown,                       clrLightRed, clMaroon);
       SetLabelColors(LabelButtonEditWidth,                    clrLightRed, clMaroon);
       SetLabelColors(LabelButtonSize,                         clrLightRed, clMaroon);
       SetLabelColors(LabelButtonResetSize,                    clrLightRed, clMaroon);
       SetLabelColors(LabelButtonDefaultSize,                  clrLightRed, clMaroon);
       SetLabelColors(LabelToggleVisibility,                   clrLightRed, clMaroon);
       SetLabelColors(LabelButtonReloadProfileDefaultSettings, clrLightRed, clMaroon);
       SetLabelColors(LabelButtonSetDefaultAll,                clrLightRed, clMaroon);

       SetLabelColors(LabelTips, item_caption_active_color[1], item_caption_active_shadow_color[1]);

       for Loop:= 0 to FormColumnsEditor.ComponentCount-1 do
       begin
         if FormColumnsEditor.Components[Loop] is TBitBtnEx then
            FormMain.SetButtonExColors(TBitBtnEx(FormColumnsEditor.Components[Loop]));
       end;

     end;

  ResetColumns;
end;

{procedure TFormColumnsEditor.LoadProfile;
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
end;}

function TFormColumnsEditor.SaveProfile: Boolean;
var
  columnFile: TMemIniFile;
  Item: TEasyItem;
  IsMachinesList: Boolean;
begin
  IsMachinesList:= FormMain.PanelMachinesList.Visible;
  Result:= False; // frontend's default columns profile
  //DeleteFile(FormMain.GetColumnProfile); // will always rewrite the profile, not matter what (OK button was clicked)
  columnFile:= TMemIniFile.Create(FormMain.GetColumnProfile);
  case IsMachinesList of
    True:
      begin
        columnFile.EraseSection('Position_SoftwareList');
        columnFile.EraseSection('Visible_SoftwareList');
      end;
    False:
      begin
        columnFile.EraseSection('Position');
        columnFile.EraseSection('Width');
        columnFile.EraseSection('Visible');
        columnFile.EraseSection('Sort');
      end;
  end;
  Item:= ColumnsListView.Groups.FirstItem;
  repeat
    if Item.ImageIndex <> 0 then // no reposition of title column!!
       begin
         case IsMachinesList of
           True:
             begin
               if (Item.Index <> Item.ImageIndex) and (Item.ImageIndex <> aColumnsSoftwareListOrder[Item.Index]) then
                  begin
                    columnFile.WriteInteger('Position_SoftwareList', aColumns[Item.ImageIndex, 0], Item.Index);
                    Result:= True;
                  end;
             end;
           False:
             begin
               if Item.Index <> Item.ImageIndex then
                  begin
                    columnFile.WriteInteger('Position', aColumns[Item.ImageIndex, 0], Item.Index);
                    Result:= True;
                  end;
             end;
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
         case IsMachinesList of
           True : columnFile.WriteInteger('Visible_SoftwareList', aColumns[Item.ImageIndex, 0], 0);
           False: columnFile.WriteInteger('Visible', aColumns[Item.ImageIndex, 0], 0);
         end;
         Result:= True;
       end;

    Item:= ColumnsListView.Groups.NextItem(Item);
  until Item = nil;
  if Result then
     columnFile.UpdateFile;
  FreeAndNil(columnFile);
  if not FormMain.ValidateFile(FormMain.GetColumnProfile) then
     DeleteFile(FormMain.GetColumnProfile);
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
              True:
                begin
                  case FormMain.PanelMachinesList.Visible of
                    True : FormMain.ReadColumnsProfileMachinesList;
                    False: FormMain.ReadColumnProfile;
                  end;
                end;
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
  MoveColumn(Boolean(TBitBtnEx(Sender).Tag));
end;

procedure TFormColumnsEditor.ButtonEditWidthClick(Sender: TObject);
begin
  FormMain.SetFormKeyPreview(FormColumnsEditor);
  ColumnsListView.Tag:= TBitBtnEx(Sender).Tag+1; // Tag = 2 (size column)
  FormMain.ELV_EnableEdit(ColumnsListView, TBitBtnEx(Sender).Tag); // TToolButton(Sender).Tag); // why is TToolButton used here ? is it a left-over code ? (September 13, 2019)
end;

procedure TFormColumnsEditor.ButtonReloadProfileClick(Sender: TObject);
begin
  ResetColumns;
  ColumnsListView.SetFocus;
  FormMain.ELV_SelectItem(ColumnsListView, 0);
  //LoadProfile;
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
  case TBitBtnEx(Sender).Tag of
    0: Dec(tSize); // VK_LEFT
    1: Inc(tSize); // VK_RIGHT
  end;
  ColumnsListView.Tag:= 2;
  ColumnsListView.Selection.First.Captions[1]:= IntToStr(tSize);
  ColumnsListView.Tag:= 0;
end;

procedure TFormColumnsEditor.ButtonCustomizeColumnHeaderFontClick(
  Sender: TObject);
begin
  FormMain.PopupCustomizeColumnsHeaderFont.Click;
end;

procedure TFormColumnsEditor.ButtonCustomizeColumnHeaderFontSetDefaultClick(Sender: TObject);
begin
  FormMain.PopupDefaultHeaderFont.Click;
end;


end.
