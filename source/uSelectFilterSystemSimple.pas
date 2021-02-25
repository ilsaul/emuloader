unit uSelectFilterSystemSimple;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  ComCtrls, StdCtrls, MPCommonObjects, MPCommonUtilities, EasyListview,
  ExtCtrls, Buttons, PanelEx, ShadowLabel, ImgList, Menus, BarMenus,
  ButtonsEx;

type
  TFormSelectFilterSystemSimple = class(TForm)
    PanelBottom: TPanelEx;
    ButtonOk: TBitBtnEx;
    ButtonCancel: TBitBtnEx;
    ButtonReload: TBitBtnEx;
    ConsCompSystemsListView: TEasyListview;
    LabelMultiSelect: TShadowLabel;
    IL_Systems: TImageList;
    ButtonHelp: TBitBtnEx;
    ResetToMachineTypeSystemsMegaFilter: TBitBtnEx;
    PopupSystems: TBcBarPopupMenu;
    PopupCheckAllArcadeSystems: TMenuItem;
    PopupUncheckAllArcadeSystems: TMenuItem;
    N1: TMenuItem;
    PopupCheckAllConsoleSystems: TMenuItem;
    PopupUncheckAllConsoleSystems: TMenuItem;
    N2: TMenuItem;
    PopupCheckAllComputerSystems: TMenuItem;
    PopupUncheckAllComputerSystems: TMenuItem;
    N3: TMenuItem;
    PopupCheckAllHandheldSystems: TMenuItem;
    PopupUncheckAllHandheldSystems: TMenuItem;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormActivate(Sender: TObject);
    procedure ConsCompSystemsListViewItemSelectionChanged(
      Sender: TCustomEasyListview; Item: TEasyItem);
    procedure ConsCompSystemsListViewKeyAction(Sender: TCustomEasyListview;
      var CharCode: Word; var Shift: TShiftState; var DoDefault: Boolean);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure ConsCompSystemsListViewDblClick(Sender: TCustomEasyListview;
      Button: TCommonMouseButton; MousePos: TPoint;
      ShiftState: TShiftState; var Handled: Boolean);
    procedure ButtonReloadClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ConsCompSystemsListViewItemImageDrawIsCustom(
      Sender: TCustomEasyListview; Item: TEasyItem; Column: TEasyColumn;
      var IsCustom: Boolean);
    procedure ConsCompSystemsListViewItemImageGetSize(
      Sender: TCustomEasyListview; Item: TEasyItem; Column: TEasyColumn;
      var ImageWidth, ImageHeight: Integer);
    procedure ConsCompSystemsListViewItemImageDraw(
      Sender: TCustomEasyListview; Item: TEasyItem; Column: TEasyColumn;
      ACanvas: TCanvas; const RectArray: TEasyRectArrayObject;
      AlphaBlender: TEasyAlphaBlender);
    procedure ConsCompSystemsListViewItemPaintText(
      Sender: TCustomEasyListview; Item: TEasyItem; Position: Integer;
      ACanvas: TCanvas);
    procedure ButtonHelpClick(Sender: TObject);
    procedure ResetToMachineTypeSystemsMegaFilterClick(Sender: TObject);
    procedure PopupCheckAllArcadeSystemsClick(Sender: TObject);
    procedure PopupSystemsMeasureMenuItem(Sender: TObject;
      AMenuItem: TMenuItem; ACanvas: TCanvas; var Width, Height: Integer;
      ABarVisible: Boolean; var DefaultMeasure: Boolean);
  private
    { Private declarations }
    procedure ResizeForm;
    procedure SetSelectedSystems;
    procedure SelectUnselectAll(SystemTypeIndex: Integer; SelectItems: Boolean);
  public
    { Public declarations }
  end;

var
  FormSelectFilterSystemSimple: TFormSelectFilterSystemSimple;

implementation

uses uMain, uCommon, uCommonCustom;

{$R *.dfm}

procedure TFormSelectFilterSystemSimple.ResizeForm;
var
  HeightDiff, VisibleCount, ItemsLineCount, ColumnsCount, MaxHeight: Integer;
  ScreenHeightTest: Integer;
begin
  ButtonReload.Click; // this might not be needed anymore...

  //if SystemsListView.Groups.VisibleItemCount < (MaxArcadeSystems+1) then

  // if higher than 1920x1080, either use 3 columns or 4 columns ?????????
  // if 1920x1080 -> it must be 4 columns
  // if 1024x768 / 1280x720, it must be 5 columns
  // if 800x600 / 720x480, it must be 3 columns
  // if 640x480 it must be 2 columns
  // in all of them, need to check for the available Screen.Height and remove 45 for the windows task bar and the top position of the filters window

  ColumnsCount:= 5;
  VisibleCount:= ConsCompSystemsListView.Groups.VisibleItemCount;

  //MaxHeight:= (Screen.Height-45)-FormSelectFilterSystemSimple.Top;

  ScreenHeightTest:= Screen.Height;
  MaxHeight:= (ScreenHeightTest-45)-FormSelectFilterSystemSimple.Top;

  case ScreenHeightTest of
    1080:
      begin
        ColumnsCount:= 5;
        if VisibleCount <= 17 then
           ColumnsCount:= 1;
      end;
    768:
      begin
        ColumnsCount:= 5; // max lines = 13
        //VisibleCount:= 13; // for debugging only
        if VisibleCount <= 13 then
           ColumnsCount:= 1;
      end;
    720:
      begin
        ColumnsCount:= 7; // max lines = 12
        //VisibleCount:= 12; // for debugging only
        if VisibleCount <= 12 then
           ColumnsCount:= 1;
      end;
    600:
      begin
        ColumnsCount:= 3; // max lines = 9
        //VisibleCount:= 9; // for debugging only
        if VisibleCount <= 9 then
           ColumnsCount:= 1;
      end;
    480:
      begin
        ColumnsCount:= 3; // max lines = 6
        //VisibleCount:= 6; // for debugging only
        if VisibleCount <= 6 then
           ColumnsCount:= 1;
      end;
  else
    begin
      if Screen.Height > 1080 then
         begin
           ColumnsCount:= 5;
           if VisibleCount <= 17 then
              ColumnsCount:= 1;
         end;
    end;
  end;

  {case Screen.Height of
    1080: ColumnsCount:= 4;
    768 : ColumnsCount:= 5; // max lines = 13
    720 : ColumnsCount:= 5; // max lines = 12
    600 : ColumnsCount:= 3; // max lines = 9
    480 : ColumnsCount:= 2; // max lines = 6
  else
    begin
      if Screen.Height > 1080 then
         ColumnsCount:= 4
    end;
  end;}

  if ColumnsCount <> 4 then
     begin
       ConsCompSystemsListView.Width:= (ConsCompSystemsListView.CellSizes.Tile.Width*ColumnsCount)+20;
       FormSelectFilterSystemSimple.ClientWidth:= ConsCompSystemsListView.Width+8;
     end;

  HeightDiff:= ConsCompSystemsListView.Height;

  if ColumnsCount > 1 then
     begin
       ItemsLineCount:= ConsCompSystemsListView.Groups.VisibleItemCount div ColumnsCount; // 3
       if ItemsLineCount = 0 then
          ItemsLineCount:= 1
       else
          begin
            if ConsCompSystemsListView.Groups.VisibleItemCount mod ColumnsCount <> 0 then
               Inc(ItemsLineCount);
          end;
     end
  else
     ItemsLineCount:= VisibleCount;

  if ConsCompSystemsListView.View = elsReport then
     ConsCompSystemsListView.Height:= (ConsCompSystemsListView.Groups.VisibleItemCount*ConsCompSystemsListView.CellSizes.Report.Height)+6
  else
  if ConsCompSystemsListView.View = elsTile then
     ConsCompSystemsListView.Height:= (ItemsLineCount*ConsCompSystemsListView.CellSizes.Tile.Height)+6;

  HeightDiff:= HeightDiff-ConsCompSystemsListView.Height;
  FormSelectFilterSystemSimple.ClientHeight:= FormSelectFilterSystemSimple.ClientHeight-HeightDiff;
  if FormSelectFilterSystemSimple.Height > MaxHeight then
     begin
       FormSelectFilterSystemSimple.ClientHeight:= MaxHeight-GetSystemMetrics(SM_CYCAPTION);
       ConsCompSystemsListView.Height:= FormSelectFilterSystemSimple.ClientHeight-5-PanelBottom.Height;
     end;

  FormSelectFilterSystemSimple.ClientWidth:= ConsCompSystemsListView.Width+8;
  case ConsCompSystemsListView.Scrollbars.VertBarVisible of
    True : ConsCompSystemsListView.HotTrack.Enabled:= False;
    False: FormSelectFilterSystemSimple.ClientWidth:= FormSelectFilterSystemSimple.ClientWidth-20;
  end;

  ButtonCancel.Left:= (FormSelectFilterSystemSimple.ClientWidth-ButtonCancel.Width)-6;
  ButtonOk.Left:= ButtonCancel.Left-ButtonOk.Width-4;
  ButtonHelp.Left:= ButtonOk.Left-ButtonHelp.Width-4;
  LabelMultiSelect.Left:= (PanelBottom.Width div 2) - (LabelMultiSelect.Width div 2);
end;

procedure TFormSelectFilterSystemSimple.SetSelectedSystems;
var
  Item: TEasyItem;
begin
  ConsCompSystemsListView.BeginUpdate;
  Item:= ConsCompSystemsListView.Groups.FirstItem;
  repeat
    if FormMain.ELV_IsArcadeSystemMulti(Item) then
       begin
         if FormMain.FilterSysArcadeQuick[Item.ImageIndex] then
            Item.Selected:= True;
       end
    else
       begin
         if FormMain.FilterSysConsCompQuick[Item.StateImageIndex] then
            Item.Selected:= True;
       end;
    Item:= ConsCompSystemsListView.Groups.NextItem(Item);
  until Item = nil;
  ConsCompSystemsListView.EndUpdate;
end;

procedure TFormSelectFilterSystemSimple.SelectUnselectAll(SystemTypeIndex: Integer; SelectItems: Boolean);
var
  Item: TEasyItem;
begin
  if not FormMain.CheckTotal(ConsCompSystemsListView) then
     Exit;

  ConsCompSystemsListView.BeginUpdate;
  Item:= ConsCompSystemsListView.Groups.FirstItem;
  repeat
    case SystemTypeIndex of
      0: // All Arcade Systems
        begin
          if FormMain.ELV_IsArcadeSystemMulti(Item) then
             Item.Selected:= SelectItems;
        end;
      2: // All Console Systems
        begin
          if SystemIsConsole(Item.StateImageIndex) then
             Item.Selected:= SelectItems;
        end;
      3: // All Computer Systems
        begin
          if SystemIsComputer(Item.StateImageIndex) then
             Item.Selected:= SelectItems;
        end;
      4: // All Handheld Systems
        begin
          if SystemIsHandheld(Item.StateImageIndex) then
             Item.Selected:= SelectItems;
        end;
    end;

    Item:= ConsCompSystemsListView.Groups.NextItem(Item);
  until Item = nil;
  ConsCompSystemsListView.EndUpdate;
end;

procedure TFormSelectFilterSystemSimple.FormKeyPress(Sender: TObject; var Key: Char);
begin
  case Key of
    #13: if ButtonOk.Enabled then ButtonOk.Click;
    #27: ButtonCancel.Click;
  end;
end;

procedure TFormSelectFilterSystemSimple.FormActivate(Sender: TObject);
begin
  if FormSelectFilterSystemSimple.Tag = 1 then
     Exit;
                                                           //1 -> should be "1" to show only available systems; 0 -> show all systems
  FormMain.ELV_PopulateSystemsMulti(ConsCompSystemsListView, 1, False, True, False, True);
  FormMain.ELV_FixTitleClickAreaMulti(ConsCompSystemsListView);

  ResizeForm;
  SetSelectedSystems;

  FormSelectFilterSystemSimple.Tag:= 1;
end;

procedure TFormSelectFilterSystemSimple.ConsCompSystemsListViewItemSelectionChanged(
  Sender: TCustomEasyListview; Item: TEasyItem);
begin
  if Item.Selected then
     ButtonOk.Enabled:= FormMain.CheckSelected(ConsCompSystemsListView);
end;

procedure TFormSelectFilterSystemSimple.ConsCompSystemsListViewKeyAction(
  Sender: TCustomEasyListview; var CharCode: Word; var Shift: TShiftState;
  var DoDefault: Boolean);
begin
  case CharCode of
    VK_RETURN: if ButtonOk.Enabled then ButtonOk.Click;
    VK_ESCAPE: ButtonCancel.Click;
  end;
end;

procedure TFormSelectFilterSystemSimple.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if ModalResult = mrOk then
     begin
       CanClose:= FormMain.CheckSelected(ConsCompSystemsListView);
       if not CanClose then
          GenerateMessage('Info', 'Systems Quick Filter', 'Nothing is selected. Make sure to select at least one system.');  
     end;
end;

procedure TFormSelectFilterSystemSimple.ConsCompSystemsListViewDblClick(
  Sender: TCustomEasyListview; Button: TCommonMouseButton;
  MousePos: TPoint; ShiftState: TShiftState; var Handled: Boolean);
begin
  if ButtonOk.Enabled then ButtonOk.Click;
end;

procedure TFormSelectFilterSystemSimple.ButtonReloadClick(Sender: TObject);
var
  Item: TEasyItem;
begin
  ConsCompSystemsListView.Selection.ClearAll;

  Item:= ConsCompSystemsListView.Groups.FirstItem;
  repeat
    if FormMain.ELV_IsArcadeSystemMulti(Item) then
       begin
         if FormMain.FilterSysArcadeQuick[Item.ImageIndex] and (Item.Visible) then
            FormMain.ELV_SelectItem(ConsCompSystemsListView, Item.Index);
       end
    else
       begin
         if FormMain.FilterSysConsCompQuick[Item.StateImageIndex] and (Item.Visible) then
            FormMain.ELV_SelectItem(ConsCompSystemsListView, Item.Index);
       end;
    Item:= ConsCompSystemsListView.Groups.NextItem(Item); // get first system, bypass "all systems"
  until Item = nil;
  ConsCompSystemsListView.SetFocus;
end;

procedure TFormSelectFilterSystemSimple.FormShow(Sender: TObject);
begin
  //FormMain.LoadSystemsIcons(IL_Systems);
  //FormMain.LoadConsCompSystemFilterIcons(IL_Systems);

  FormMain.LoadSystemsIcons(IL_Systems, False);
  FormMain.LoadNonArcadeSystemIcons(IL_Systems, False, False);

  FormMain.ELV_ResetNormalColors(ConsCompSystemsListView);

  if IsNightMode then
     begin
       FormSelectFilterSystemSimple.Color:= menu_background_color[1];
       SetBottomPanelColors(PanelBottom);
       FormMain.SetEasyListViewColors(ConsCompSystemsListView, menu_background_color[1], item_caption_active_color[1]);
       SetLabelColors(LabelMultiSelect, clrLightBlue, clNavy);

       FormMain.ELV_SetNightModeColors(ConsCompSystemsListView);
       FormMain.SetWin10DarkScrollBar(ConsCompSystemsListView);

       FormMain.SetButtonExColors(ButtonOk);
       FormMain.SetButtonExColors(ButtonCancel);
       FormMain.SetButtonExColors(ButtonReload);
       FormMain.SetButtonExColors(ResetToMachineTypeSystemsMegaFilter);
       FormMain.SetButtonExColors(ButtonHelp);
     end;

  //ELV_PopulateCustomSystems(SystemsListView, FormMain.ButtonGameFilterConsoleComputerSystems.Tag);
  //FormMain.ELV_PopulateSystems(SystemsListView, True);
  //SetSystemsState;
end;

procedure TFormSelectFilterSystemSimple.ConsCompSystemsListViewItemImageDrawIsCustom(
  Sender: TCustomEasyListview; Item: TEasyItem; Column: TEasyColumn;
  var IsCustom: Boolean);
begin
  IsCustom:= True; // this is for tiles view mode
end;

procedure TFormSelectFilterSystemSimple.ConsCompSystemsListViewItemImageGetSize(
  Sender: TCustomEasyListview; Item: TEasyItem; Column: TEasyColumn;
  var ImageWidth, ImageHeight: Integer);
begin
  ImageWidth:= ConsCompSystemsListView.ImagesExLarge.Width;//+16; // +16 is 16x16 icon size, plus 2 pixels border
  ImageHeight:= ConsCompSystemsListView.ImagesExLarge.Height;
end;

procedure TFormSelectFilterSystemSimple.ConsCompSystemsListViewItemImageDraw(
  Sender: TCustomEasyListview; Item: TEasyItem; Column: TEasyColumn;
  ACanvas: TCanvas; const RectArray: TEasyRectArrayObject;
  AlphaBlender: TEasyAlphaBlender);
var
  iLeft, iTop: Integer;
  iSysTypeIndex: Integer;
begin
  // this is for tiles view mode
  iLeft:= RectArray.IconRect.Left+ConsCompSystemsListView.PaintInfoItem.ImageIndent+1;
  iTop:=  RectArray.IconRect.Top+1;

  if FormMain.ELV_IsArcadeSystemMulti(Item) then
     begin
       ConsCompSystemsListView.ImagesExLarge.Draw(ACanvas, iLeft, iTop, Item.ImageIndex);

       iLeft:= iLeft+ConsCompSystemsListView.ImagesExLarge.Width+4;
       iTop:= iTop+(ConsCompSystemsListView.ImagesExLarge.Height-FormMain.IL_MenuPopup.Height);

       FormMain.IL_MenuPopup.Draw(ACanvas, iLeft, iTop, 24); // index 24 is "arcade" icon
     end
  else
     begin
       ConsCompSystemsListView.ImagesExLarge.Draw(ACanvas, iLeft, iTop, MaxArcadeSystems+1+Item.StateImageIndex);

       iLeft:= iLeft+ConsCompSystemsListView.ImagesExLarge.Width+4;
       iTop:= iTop+(ConsCompSystemsListView.ImagesExLarge.Height-FormMain.IL_MenuPopup.Height);

       iSysTypeIndex:= -1;
       if SystemIsConsole(Item.StateImageIndex) then
          iSysTypeIndex:= 25 // index 25 is "console" icon
       else
       if SystemIsComputer(Item.StateImageIndex) then
          iSysTypeIndex:= 26 // index 26 is "computer" icon
       else
       if SystemIsHandheld(Item.StateImageIndex) then
          iSysTypeIndex:= 27; // index 27 is "handheld" icon

       if iSysTypeIndex <> -1 then
          FormMain.IL_MenuPopup.Draw(ACanvas, iLeft, iTop, iSysTypeIndex);
     end;
end;

procedure TFormSelectFilterSystemSimple.ConsCompSystemsListViewItemPaintText(
  Sender: TCustomEasyListview; Item: TEasyItem; Position: Integer;
  ACanvas: TCanvas);
begin
  if Position = 1 then
     begin
       ACanvas.Font.Style:= [];
       ACanvas.Font.Name:= 'Segoe UI';
       ACanvas.Font.Size:= 9;
       ACanvas.Font.Color:= clMedGray;
       //if LabelMultiSelect.Tag = 1 then
       //   ACanvas.Font.Style:= [fsItalic];
       if IsNightMode then
          ACanvas.Font.Color:= clMedGray
       else
          ACanvas.Font.Color:= clGray;

       if IsNightMode and Item.Selected then
          ACanvas.Font.Color:= clrDarkGray;
     end;
end;

procedure TFormSelectFilterSystemSimple.ButtonHelpClick(Sender: TObject);
begin
  CallMessageBox;
  FormMain.AddMsgText('    This filter allows you to quickly select or or more systems without changing settings in ');
  FormMain.AddMsgText('Machine Type / Systems', MsgTxtColors.colorFileName, [fsBold]);
  FormMain.AddMsgText(' main filter.'+#13#10+'Very useful if you just want to show a single system.'+#13#10+#13#10+
                      '    Just select the systems you want and click ');
  FormMain.AddMsgText('Apply', MsgTxtColors.colorFileName, [fsBold]);
  FormMain.AddMsgText(' button. ');
  FormMain.AddMsgText('Machine Type / Systems', clBlack);
  FormMain.AddMsgText(' full filter will be bypassed automatically, no additional configuration required.'+#13#10+
                      '    To restore the full filter again, either click on the ');
  FormMain.AddMsgText('Reset To Default', MsgTxtColors.colorFileName, [fsBold]);

  FormMain.AddMsgText(' button or open ');
  FormMain.AddMsgText('Machine Type / Systems', MsgTxtColors.colorFileName, [fsBold]);
  FormMain.AddMsgText(' filter and click ');
  FormMain.AddMsgText('Apply', MsgTxtColors.colorFileName, [fsBold]);
  FormMain.AddMsgText(' button. The ');
  FormMain.AddMsgText('Systems Quick Filter', clBlack);
  FormMain.AddMsgText(' will be disabled.'+#13#10+#13#10+
                      '    When you restart the frontend, the current filter setting will be restored with ');
  FormMain.AddMsgText('Machine Type / Systems', clBlack, [fsBold]);
  FormMain.AddMsgText(' filter or ');
  FormMain.AddMsgText('Systems Quick Filter', clBlack, [fsBold]);
  FormMain.AddMsgText(', depending on which filter was active at the time.'+#13#10+#13#10+'    ');
  FormMain.AddMsgText('MAME Machines Filter Panel', MsgTxtColors.colorFileName, [fsBold]);
  FormMain.AddMsgText(' setting will be disabled to prevent games filtering errors.'+#13#10+#13#10+
                      '    How do you know which filter is active ? To make this easy, the ');
  FormMain.AddMsgText('Systems Quick Filter', clBlack, [fsBold]);
  FormMain.AddMsgText(' tool bar button have two icons, one with a ');
  FormMain.AddMsgText('RED', clRed, [fsBold]);
  FormMain.AddMsgText(' stripe, showing that the filter is ');
  FormMain.AddMsgText('disabled', clBlack, [fsBold]);
  FormMain.AddMsgText(' and another with a ');
  FormMain.AddMsgText('GREEN', clGreen, [fsBold]);
  FormMain.AddMsgText(' stripe, showing that the filter is ');
  FormMain.AddMsgText('active', clBlack, [fsBold]);
  FormMain.AddMsgText('. The filter is disabled by default.'+#13#10#13#10+
                      '    There are more select/unselect options in the popup menu (mouse right-click). '+
                      'Make sure to call the popup menu on top of a selected system so you don''t lose current selections.');

  GenerateMessage('Info', 'Systems Quick Filter', '');
  ConsCompSystemsListView.SetFocus;
end;

procedure TFormSelectFilterSystemSimple.ResetToMachineTypeSystemsMegaFilterClick(
  Sender: TObject);
begin
  FormSelectFilterSystemSimple.Tag:= 500;
  Close;
end;

procedure TFormSelectFilterSystemSimple.PopupCheckAllArcadeSystemsClick(
  Sender: TObject);
begin
  SelectUnselectAll(TMenuItem(Sender).HelpContext, Boolean(TMenuItem(Sender).Tag));
end;

procedure TFormSelectFilterSystemSimple.PopupSystemsMeasureMenuItem(
  Sender: TObject; AMenuItem: TMenuItem; ACanvas: TCanvas; var Width,
  Height: Integer; ABarVisible: Boolean; var DefaultMeasure: Boolean);
begin
  FormMain.SetPopupMenuMeasureItem(AMenuItem, ACanvas, Width, Height);
end;

end.
