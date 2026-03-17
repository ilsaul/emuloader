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
    LabelSysTotalSelected: TShadowLabel;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
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
    procedure UpdateLabelTotalSelected;
    procedure ResizeForm;
    procedure SetSelectedSystems;
    procedure SelectUnselectAll(SystemTypeIndex: Integer; SelectItems: Boolean);
    procedure Resize4K;
  public
    { Public declarations }
  end;

var
  FormSelectFilterSystemSimple: TFormSelectFilterSystemSimple;

implementation

uses uMain, uCommon, uCommonCustom;

{$R *.dfm}

procedure TFormSelectFilterSystemSimple.Resize4K;
begin
  if not Is4KMode then
     Exit;

  with FormSelectFilterSystemSimple do
  begin
    Font.Size:= 16;

    FormMain.Set4KImageListSpecs(IL_Systems, 128);

    ConsCompSystemsListView.PaintInfoItem.IconViewRemoveIconTopBorder:= True;
    ConsCompSystemsListView.CellSizes.Icon.Width:=  156;
    ConsCompSystemsListView.CellSizes.Icon.Height:= 207+32+4;// // 32+4 (systype icon + border)
    ConsCompSystemsListView.View:= elsIcon;
    ConsCompSystemsListView.PaintInfoItem.CaptionIndent:= 4; // reset to default
    ConsCompSystemsListView.PaintInfoItem.ImageIndent:= 2; // reset to default
    ConsCompSystemsListView.ImagesExLarge:= nil;
    ConsCompSystemsListView.ImagesLarge:= IL_Systems;

    FormMain.Set4KListViewSpecs(ConsCompSystemsListView, 8, 8, (ConsCompSystemsListView.CellSizes.Icon.Width*15)+20, (ConsCompSystemsListView.CellSizes.Icon.Height*5), 16); // 15 columns, 5 lines

    ClientWidth:= (ConsCompSystemsListView.CellSizes.Icon.Width*15)+16;

    PanelBottom.Height:= 100;
    FormMain.Set4KLabelSpecs(LabelMultiSelect, -1, 4, -1, -1, 16);
    LabelMultiSelect.Left:= (ClientWidth-LabelMultiSelect.Width) div 2;

    FormMain.Set4KButtonSpecs(ButtonReload, 10, 45, 168, 45, 16);
    FormMain.Set4KButtonSpecs(ResetToMachineTypeSystemsMegaFilter, ButtonReload.Left+ButtonReload.Width+10, 45, 198, 45, 16);

    FormMain.Set4KLabelSpecs(LabelSysTotalSelected, ResetToMachineTypeSystemsMegaFilter.Left+ResetToMachineTypeSystemsMegaFilter.Width+10,
                             ResetToMachineTypeSystemsMegaFilter.Top+5, -1, -1, 16);

    if not ResetToMachineTypeSystemsMegaFilter.Visible then
       LabelSysTotalSelected.Left:= ButtonReload.Left+ButtonReload.Width+10;
  end;
end;

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

  if Is4KMode then
     ColumnsCount:= 15
  else
     ColumnsCount:= 5;
  VisibleCount:= ConsCompSystemsListView.Groups.VisibleItemCount;

  ScreenHeightTest:= Screen.Height;
  MaxHeight:= (Screen.DesktopHeight-45)-FormSelectFilterSystemSimple.Top;

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
      if Is4KMode then
         begin
           if VisibleCount <= 20 then
              ColumnsCount:= 10
           else
           if VisibleCount in [25..28, 40..42, 53..56, 61..70] then
              ColumnsCount:= 14
           else
              ColumnsCount:= 15;
         end
      else
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

  if Is4KMode then
     begin
       if ColumnsCount <> 15 then
          begin
            ConsCompSystemsListView.Width:= (ConsCompSystemsListView.CellSizes.Icon.Width*ColumnsCount)+20;
            ClientWidth:= (ConsCompSystemsListView.CellSizes.Icon.Width*ColumnsCount)+16;
          end;
     end
  else
     begin
       if ColumnsCount <> 4 then
          begin
            ConsCompSystemsListView.Width:= (ConsCompSystemsListView.CellSizes.Tile.Width*ColumnsCount)+20;
            FormSelectFilterSystemSimple.ClientWidth:= ConsCompSystemsListView.Width+8;
          end;
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

  //if ConsCompSystemsListView.View = elsReport then
  //   ConsCompSystemsListView.Height:= (ConsCompSystemsListView.Groups.VisibleItemCount*ConsCompSystemsListView.CellSizes.Report.Height)+6
  //else
  //if ConsCompSystemsListView.View = elsTile then
  //   ConsCompSystemsListView.Height:= (ItemsLineCount*ConsCompSystemsListView.CellSizes.Tile.Height)+6;

  if Is4KMode then
     begin
       ConsCompSystemsListView.Height:= (ItemsLineCount*ConsCompSystemsListView.CellSizes.Icon.Height);//+6;
       FormSelectFilterSystemSimple.ClientHeight:= (ConsCompSystemsListView.Height+16)+PanelBottom.Height;
     end
  else
     begin
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
     end;

  if Is4KMode then
     begin
       FormMain.Set4KButtonsOkCancelPanel(PanelBottom, ButtonOk, ButtonCancel, False);
       FormMain.Set4KButtonSpecs(ButtonHelp, ButtonOk.Left-10-68, ButtonOk.Top, 68, 45, 16);
     end
  else
     begin
       ButtonCancel.Left:= (FormSelectFilterSystemSimple.ClientWidth-ButtonCancel.Width)-6;
       ButtonOk.Left:= ButtonCancel.Left-ButtonOk.Width-4;
       ButtonHelp.Left:= ButtonOk.Left-ButtonHelp.Width-4;
     end;
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

procedure TFormSelectFilterSystemSimple.ConsCompSystemsListViewItemSelectionChanged(
  Sender: TCustomEasyListview; Item: TEasyItem);
begin
  if Item.Selected then
     begin
       ButtonOk.Enabled:= FormMain.CheckSelected(ConsCompSystemsListView);
       UpdateLabelTotalSelected;
     end;
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
          FormMain.ShowMessageBox('Info', 'Systems Quick Filter', 'Nothing is selected. Make sure to select at least one system.');  
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
  UpdateLabelTotalSelected;
  ConsCompSystemsListView.SetFocus;
end;

procedure TFormSelectFilterSystemSimple.UpdateLabelTotalSelected;
begin
  LabelSysTotalSelected.Tag:= ConsCompSystemsListView.Selection.Count;
  if LabelSysTotalSelected.Tag <> 1 then
     LabelSysTotalSelected.Caption:= IntToStr(LabelSysTotalSelected.Tag)+' Systems Selected'
  else
     LabelSysTotalSelected.Caption:= IntToStr(LabelSysTotalSelected.Tag)+' System Selected';
end;

procedure TFormSelectFilterSystemSimple.FormShow(Sender: TObject);
begin
  Resize4K;
  LabelSysTotalSelected.Caption:= '';

  FormMain.LoadSystemsIcons(IL_Systems, False);
  FormMain.LoadNonArcadeSystemIcons(IL_Systems, False, False);

  FormMain.ELV_ResetNormalColors(ConsCompSystemsListView);

  if IsNightMode then
     begin
       FormSelectFilterSystemSimple.Color:= menu_background_color[1];
       SetBottomPanelColors(PanelBottom);
       FormMain.SetEasyListViewColors(ConsCompSystemsListView, menu_background_color[1], item_caption_active_color[1]);
       SetLabelColors(LabelMultiSelect, clrLightBlue, clNavy);
       SetLabelColors(LabelSysTotalSelected, item_caption_active_color[1]);

       FormMain.ELV_SetNightModeColors(ConsCompSystemsListView);
       FormMain.SetWin10DarkScrollBar(ConsCompSystemsListView);

       FormMain.SetButtonExColors(ButtonOk);
       FormMain.SetButtonExColors(ButtonCancel);
       FormMain.SetButtonExColors(ButtonReload);
       FormMain.SetButtonExColors(ResetToMachineTypeSystemsMegaFilter);
       FormMain.SetButtonExColors(ButtonHelp);
     end;


                                                           //1 -> should be "1" to show only available systems; 0 -> show all systems
  FormMain.ELV_PopulateSystemsMulti(ConsCompSystemsListView, 1, False, True, False, True);
  if not Is4KMode then
     begin
       FormMain.ELV_FixTitleClickAreaMulti(ConsCompSystemsListView);
       if not ResetToMachineTypeSystemsMegaFilter.Visible then
          LabelSysTotalSelected.Left:= ButtonReload.Left+ButtonReload.Width+5;
     end;

  FormSelectFilterSystemSimple.Caption:= FormSelectFilterSystemSimple.Caption+' - '+IntToStr(ConsCompSystemsListView.Groups.VisibleItemCount)+' Systems';

  ResizeForm;
  SetSelectedSystems;
end;

procedure TFormSelectFilterSystemSimple.ConsCompSystemsListViewItemImageDrawIsCustom(
  Sender: TCustomEasyListview; Item: TEasyItem; Column: TEasyColumn;
  var IsCustom: Boolean);
begin
  IsCustom:= True;
end;

procedure TFormSelectFilterSystemSimple.ConsCompSystemsListViewItemImageGetSize(
  Sender: TCustomEasyListview; Item: TEasyItem; Column: TEasyColumn;
  var ImageWidth, ImageHeight: Integer);
begin
  ImageWidth:= IL_Systems.Width;
  if Is4KMode then
     ImageHeight:= IL_Systems.Height+FormMain.IL_GroupedMode.Width+4 // +4 -> space between sys icon / sys type icon
  else
     ImageHeight:= IL_Systems.Height;
end;

procedure TFormSelectFilterSystemSimple.ConsCompSystemsListViewItemImageDraw(
  Sender: TCustomEasyListview; Item: TEasyItem; Column: TEasyColumn;
  ACanvas: TCanvas; const RectArray: TEasyRectArrayObject;
  AlphaBlender: TEasyAlphaBlender);
var
  iLeft, iTop: Integer;
  iSysTypeIndex: Integer;
begin
  if Is4KMode then
     FormMain.ELV_DrawIconSystem_CustomSysType(Sender, Item, Column, ACanvas, RectArray, IL_Systems, True)
  else
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
end;

procedure TFormSelectFilterSystemSimple.ConsCompSystemsListViewItemPaintText(
  Sender: TCustomEasyListview; Item: TEasyItem; Position: Integer;
  ACanvas: TCanvas);
begin
  if not Is4KMode then
     if Position = 1 then
        FormMain.ELV_SetSelecionFontColors(ConsCompSystemsListView, Item, ACanvas);
end;

procedure TFormSelectFilterSystemSimple.ButtonHelpClick(Sender: TObject);
begin
  FormMain.InitMessageBox;
  FormMain.AddMsgText('    This filter allows you to quickly select or or more systems without changing settings in ');
  FormMain.AddMsgText('Machine Type / Systems', MsgTxtColors.colorKeyTitle, [fsBold]);
  FormMain.AddMsgText(' main filter.'+#13#10+'Very useful if you just want to show a single system.'+#13#10+#13#10+
                      '    Just select the systems you want and click ');
  FormMain.AddMsgText('Apply', MsgTxtColors.colorFileName, [fsBold]);
  FormMain.AddMsgText(' button. ');
  FormMain.AddMsgText('Machine Type / Systems', MsgTxtColors.colorKeyTitle);
  FormMain.AddMsgText(' full filter will be bypassed automatically, no additional configuration required.'+#13#10+
                      '    To restore the full filter again, either click on the ');
  FormMain.AddMsgText('Reset To Default', MsgTxtColors.colorFileName, [fsBold]);

  FormMain.AddMsgText(' button or open ');
  FormMain.AddMsgText('Machine Type / Systems', MsgTxtColors.colorKeyTitle, [fsBold]);
  FormMain.AddMsgText(' filter and click ');
  FormMain.AddMsgText('Apply', MsgTxtColors.colorFileName, [fsBold]);
  FormMain.AddMsgText(' button. The ');
  FormMain.AddMsgText('Systems Quick Filter', MsgTxtColors.colorKeyTitle);
  FormMain.AddMsgText(' will be disabled.'+#13#10+#13#10+
                      '    When you restart the frontend, the current filter setting will be restored with ');
  FormMain.AddMsgText('Machine Type / Systems', MsgTxtColors.colorKeyTitle, [fsBold]);
  FormMain.AddMsgText(' filter or ');
  FormMain.AddMsgText('Systems Quick Filter', MsgTxtColors.colorKeyTitle, [fsBold]);
  FormMain.AddMsgText(', depending on which filter was active at the time.'+#13#10+#13#10+'    ');
  FormMain.AddMsgText('MAME Machines Filter Panel', MsgTxtColors.colorKeyTitle, [fsBold]);
  FormMain.AddMsgText(' setting will be disabled to prevent games filtering errors.'+#13#10+#13#10+
                      '    How do you know which filter is active ? To make this easy, the ');
  FormMain.AddMsgText('Systems Quick Filter', MsgTxtColors.colorKeyTitle, [fsBold]);
  FormMain.AddMsgText(' tool bar button have two icons, one with a ');
  FormMain.AddMsgText('RED', MsgTxtColors.colorWarning, [fsBold]);
  FormMain.AddMsgText(' stripe, showing that the filter is ');
  FormMain.AddMsgText('disabled', MsgTxtColors.colorKeyTitle, [fsBold]);
  FormMain.AddMsgText(' and another with a ');
  FormMain.AddMsgText('GREEN', MsgTxtColors.colorCmdLine, [fsBold]);
  FormMain.AddMsgText(' stripe, showing that the filter is ');
  FormMain.AddMsgText('active', MsgTxtColors.colorKeyTitle, [fsBold]);
  FormMain.AddMsgText('. The filter is disabled by default.'+#13#10#13#10+
                      '    There are more select/unselect options in the popup menu (mouse right-click). '+
                      'Make sure to call the popup menu on top of a selected system so you don''t lose current selections.');

  FormMain.ShowMessageBox('Info', 'Systems Quick Filter', '');
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
