unit uConsCompSystemSelector;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  ComCtrls, uCommon, uCommonCustom, StdCtrls, ImgList, MPCommonObjects,
  MPCommonUtilities, EasyListview, AdvOfficeButtons,
  Buttons, ExtCtrls, PanelEx, ShadowLabel, ButtonsEx;

const
  // Action Mode:
  // -1 -> all systems
  //  0 -> set visible available game files only
  //  1 -> set visible available system ROMs foldes only (create games list)
  //  2 -> MRU list (last played games) (not used anymore!!!!!)

  ActionModeStr: array[0..1] of String =
    (('Games Filters'), // 0 (available game lists only)
     ('Create Games List')); // 1 (available emu folders only)
    
type
  TFormConsCompSystemSelector = class(TForm)
    Systems: TEasyListview;
    PanelBottom: TPanelEx;
    CreateNewList: TAdvOfficeCheckBoxEx;
    ButtonHelp: TBitBtnEx;
    ButtonApply: TBitBtnEx;
    ButtonCancel: TBitBtnEx;
    LabelCreateNewList: TShadowLabel;
    IL_Systems: TImageList;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormShow(Sender: TObject);
    procedure SystemsKeyAction(Sender: TCustomEasyListview;
      var CharCode: Word; var Shift: TShiftState; var DoDefault: Boolean);
    procedure SystemsItemPaintText(Sender: TCustomEasyListview;
      Item: TEasyItem; Position: Integer; ACanvas: TCanvas);
    procedure SystemsItemDblClick(Sender: TCustomEasyListview;
      Button: TCommonMouseButton; MousePos: TPoint;
      HitInfo: TEasyHitInfoItem);
    procedure CreateNewListClick(Sender: TObject);
    procedure ButtonHelpClick(Sender: TObject);
    procedure SystemsItemImageDraw(Sender: TCustomEasyListview;
      Item: TEasyItem; Column: TEasyColumn; ACanvas: TCanvas;
      const RectArray: TEasyRectArrayObject;
      AlphaBlender: TEasyAlphaBlender);
    procedure SystemsItemImageDrawIsCustom(Sender: TCustomEasyListview;
      Item: TEasyItem; Column: TEasyColumn; var IsCustom: Boolean);
    procedure SystemsItemImageGetSize(Sender: TCustomEasyListview;
      Item: TEasyItem; Column: TEasyColumn; var ImageWidth,
      ImageHeight: Integer);
  private
    { Private declarations }
    procedure SelectSysFilters;
    //procedure UpdateSysFilters;
    procedure ResizeForm;
    procedure ResizeScreen;
    procedure Resize4K;
  public
    { Public declarations }
    ActionMode: ShortInt;
    selSysID: Integer;
  end;

var
  FormConsCompSystemSelector: TFormConsCompSystemSelector;

implementation

uses uMain;

{$R *.dfm}

procedure TFormConsCompSystemSelector.Resize4K;
begin
  if not Is4KMode then
     Exit;

  with FormConsCompSystemSelector do
  begin
    ClientWidth:= (156*14)+16; // 2184 + 16 = 2200; (14 system columns)
    //ClientHeight:= (207*5)+16; // 1031 + 16 = 1051; (5 lines)
    Font.Size:= 16;

    FormMain.Set4KImageListSpecs(IL_Systems, 128);

    Systems.Font.Name:= FormMain.Get4KSystemFont;
    Systems.PaintInfoItem.IconViewRemoveIconTopBorder:= True;
    Systems.CellSizes.Icon.Width:=  156;
    Systems.CellSizes.Icon.Height:= 207+32+4;// // 32+4 (systype icon + border)

    FormMain.Set4KListViewSpecs(Systems, 8, 8, (Systems.CellSizes.Icon.Width*14)+20, Systems.CellSizes.Icon.Height*5, 16); // 14 columns, 5 lines

    PanelBottom.Height:= 71;
    FormMain.Set4KButtonsOkCancelPanel(PanelBottom, ButtonApply, ButtonCancel, False);
    FormMain.Set4KButtonSpecs(ButtonHelp, ButtonApply.Left-89-10, ButtonApply.Top, 89, 45, 16);

    FormMain.Set4KCheckBoxFontNameSpecs(CreateNewList);
    FormMain.Set4KCheckBoxSpecs(CreateNewList, -1, -1, 300, 38, 18);

    FormMain.Set4KLabelSpecs(LabelCreateNewList, -1, 38, -1, -1, 16);

    LabelCreateNewList.Left:= (PanelBottom.Width-LabelCreateNewList.Width) div 2;
    CreateNewList.Left:= LabelCreateNewList.Left-28;

    ClientHeight:= Systems.Height+16+PanelBottom.Height;
  end;
end;

procedure TFormConsCompSystemSelector.SelectSysFilters;
var
  Item: TEasyItem;
  allSystems: Boolean;
begin
  //FormMain.ELV_PopulateSystems(Systems, MultiSystemSelect{500}, ActionMode); // -1 to prevent system selection!
  Item:= Systems.Groups.FirstItem;
  if Item = nil then
     Exit; // ... just in case the list is empty!

  // manually select items based on FormMain.SystemsFilters array!!!
  allSystems:= FormMain.FilterSysConsComp[0];
  // "All Systems" item is always visible and it's always the first on the list!

  Systems.BeginUpdate;
  if allSystems then
     begin
       Item.Selected:= True;
       Systems.Selection.FocusedItem:= Item;
       //Item.MakeVisible(emvAuto);
       Systems.EndUpdate;
       Exit;
     end;
  Item:= Systems.Groups.NextItem(Item); // select first system (after "all systems")

  repeat
    if Item.Visible then
       begin
         if not FormMain.FilterSysConsComp[0] then
            Item.Selected:= FormMain.FilterSysConsComp[Item.ImageIndex];
       end;
    Item:= Systems.Groups.NextItem(Item);
  until Item = nil;
  if FormMain.CheckSelected(Systems) then
     Systems.Selection.FocusedItem:= Systems.Selection.First;
  Systems.EndUpdate;
end;

procedure TFormConsCompSystemSelector.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #27 then
     ButtonCancel.Click;
end;

procedure TFormConsCompSystemSelector.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if ModalResult = mrOk then
     begin
       CanClose:= FormMain.CheckSelected(Systems);
     end;
end;

procedure TFormConsCompSystemSelector.ResizeForm;
begin
  if Is4KMode then
     Exit;
  if Screen.Width >= 1280 then
     begin
       FormMain.Set4KImageListSpecs(IL_Systems, 68);
       FormConsCompSystemSelector.Systems.CellSizes.Icon.Width:= 78;
       FormConsCompSystemSelector.Systems.CellSizes.Icon.Height:= 105;

       FormConsCompSystemSelector.Tag:= 1092-FormConsCompSystemSelector.ClientWidth;
       FormConsCompSystemSelector.ClientWidth:= 1092; //1170; //1248;//1326;
       Systems.Width:= 1125; //1190; //1270;//1350;
       Systems.Font.Name:= 'Verdana';
       Systems.Height:= Systems.CellSizes.Icon.Height*5; // five lines
       ButtonHelp.Left:= ButtonHelp.Left+FormConsCompSystemSelector.Tag;
       ButtonApply.Left:= ButtonApply.Left+FormConsCompSystemSelector.Tag;
       ButtonCancel.Left:= ButtonCancel.Left+FormConsCompSystemSelector.Tag;
       FormConsCompSystemSelector.ClientHeight:= Systems.Height+PanelBottom.Height;
       FormConsCompSystemSelector.Tag:= 0;

       LabelCreateNewList.Left:= (PanelBottom.Width-LabelCreateNewList.Width) div 2;
       CreateNewList.Left:= LabelCreateNewList.Left-18;
     end;
end;

procedure TFormConsCompSystemSelector.ResizeScreen;
var
  ItemCount, ItemHeight: Byte;
  LineIconsCount: Byte;
begin
  Exit;
  ItemCount:= Systems.Groups.VisibleItemCount;
  if (ItemCount = 0) or (ItemCount > 60) then
     Exit;

  if Screen.Width >= 1600 then
     LineIconsCount:= 14
  else
     LineIconsCount:= 12;

  Systems.BeginUpdate;
  ItemHeight:= Systems.CellSizes.Icon.Height;
  if ItemCount < LineIconsCount then
     Systems.Height:= ItemHeight    // one line
  else
  if ItemCount < (LineIconsCount*2+1) then
     Systems.Height:= ItemHeight*2  // two lines
  else
  if ItemCount < (LineIconsCount*3+1) then
     Systems.Height:= ItemHeight*3  // three lines
  else
  if ItemCount < (LineIconsCount*4+1) then
     Systems.Height:= ItemHeight*4  // four lines
  else
     Systems.Height:= ItemHeight*5; // five lines

  {if ItemCount < 13 then
     Systems.Height:= ItemHeight    // one line
  else
  if ItemCount < 25 then
     Systems.Height:= ItemHeight*2  // two lines
  else
  if ItemCount < 37 then
     Systems.Height:= ItemHeight*3  // three lines
  else
  if ItemCount < 49 then
     Systems.Height:= ItemHeight*4  // four lines
  else
     Systems.Height:= ItemHeight*5; // five lines}

  Systems.EndUpdate;
  FormConsCompSystemSelector.ClientHeight:= Systems.Height+PanelBottom.Height;
end;

procedure TFormConsCompSystemSelector.FormShow(Sender: TObject);
begin
  Resize4K;
  LoadCustomMAMEIconToForm(TForm(Sender));
  FormMain.ELV_ResetNormalColors(Systems);

  if IsNightMode then
     begin
       FormConsCompSystemSelector.Color:= menu_background_color[1];
       SetBottomPanelColors(PanelBottom);

       FormMain.SetEasyListViewColors(Systems, menu_background_color[1], item_caption_active_color[1]);

       SetLabelColors(LabelCreateNewList, clGray, clrDarkGray);
       SetCheckBoxColors(CreateNewList, item_caption_active_color[1], clrLightBlack);// clrLightRed, clrDarkRed);
       FormMain.SetCheckBoxExCustomIcon(CreateNewList);

       FormMain.SetButtonExColors(ButtonApply);
       FormMain.SetButtonExColors(ButtonCancel);
       FormMain.SetButtonExColors(ButtonHelp);
     end;

  ResizeForm;

  FormMain.LoadNonArcadeSystemIcons(IL_Systems, False);
  FormMain.ShowIconErrorMessage;

  CreateNewList.Checked:= Boolean(FormMain.MenuCreateCustomGamesList.Tag);
  CreateNewList.Visible:= FormMain.MenuCreateCustomGamesList.HelpContext = 1;
  LabelCreateNewList.Visible:= CreateNewList.Visible;
  Systems.Selection.MultiSelect:= ButtonHelp.Visible;

  if IsNightMode then
     FormMain.ELV_SetNightModeColors(Systems);

  if ActionMode <> -1 then // "-1" means "all systems"... no need to change form title (usually, -1 is for debugging since it's not used by any features)
     Caption:= Format('%s [%s]', [Caption, ActionModeStr[ActionMode]]);

  ELV_PopulateCustomSystems(Systems, selSysID, ActionMode); // always load "All Systems" item
  ResizeScreen;
  if ActionMode = 0 then // show filters in games list
     SelectSysFilters;
end;

procedure TFormConsCompSystemSelector.SystemsKeyAction(Sender: TCustomEasyListview;
  var CharCode: Word; var Shift: TShiftState; var DoDefault: Boolean);
var
  Item: TEasyItem;
begin
  case CharCode of
    VK_RETURN: ButtonApply.Click;
    VK_ESCAPE: ButtonCancel.Click;
    VK_SPACE:
      begin
        if Shift = [ssCtrl] then
           begin
             Item:= Systems.Selection.FocusedItem;
             if Item <> nil then
                Item.Selected:= not Item.Selected;
           end;
      end;
  end;
end;

procedure TFormConsCompSystemSelector.SystemsItemPaintText(
  Sender: TCustomEasyListview; Item: TEasyItem; Position: Integer;
  ACanvas: TCanvas);
begin
  if not Item.Enabled then
     ACanvas.Font.Color:= clSilver;
end;

procedure TFormConsCompSystemSelector.SystemsItemDblClick(
  Sender: TCustomEasyListview; Button: TCommonMouseButton;
  MousePos: TPoint; HitInfo: TEasyHitInfoItem);
begin
  ButtonApply.Click;
end;

procedure TFormConsCompSystemSelector.CreateNewListClick(Sender: TObject);
begin
  FormMain.MenuCreateCustomGamesList.Tag:= Ord(CreateNewList.Checked);
end;

procedure TFormConsCompSystemSelector.ButtonHelpClick(Sender: TObject);
begin
  FormMain.InitMessageBox;
  FormMain.AddMsgText('    You can select more than one system:'+#13#10+#13#10);
  FormMain.AddMsgText('1.', MsgTxtColors.colorWarning, [fsBold]);
  FormMain.AddMsgText(' Hold ');
  FormMain.AddMsgText('Ctrl', MsgTxtColors.colorKeyTitle, [fsBold]);
  FormMain.AddMsgText(' or ');
  FormMain.AddMsgText('Shift', MsgTxtColors.colorKeyTitle, [fsBold]);
  FormMain.AddMsgText(' key down and click on all systems you want to include in the filter.'+#13#10+
                      '    You can also use the arrow keys to browse the list and press the ');
  FormMain.AddMsgText('Space', MsgTxtColors.colorKeyTitle, [fsBold]);
  FormMain.AddMsgText(' bar to select/unselect systems.'+#13#10+#13#10);
  if CreateNewList.Visible then
     begin
       FormMain.AddMsgText('2.', MsgTxtColors.colorWarning, [fsBold]);
       FormMain.AddMsgText(' Check option ');
       FormMain.AddMsgText('Create a New List', MsgTxtColors.colorKeyTitle, [fsBold]);
       FormMain.AddMsgText(' to delete current games lists and create new ones.'+#13#10+#13#10);
       FormMain.AddMsgText('3.', MsgTxtColors.colorWarning, [fsBold]);
     end
  else
     FormMain.AddMsgText('2.', MsgTxtColors.colorWarning, [fsBold]);
  FormMain.AddMsgText(' When you''re done, click ');
  FormMain.AddMsgText('Confirm', MsgTxtColors.colorFileName, [fsBold]);
  FormMain.AddMsgText(' to apply the changes, or press the ');
  FormMain.AddMsgText('Enter', MsgTxtColors.colorFileName, [fsBold]);
  FormMain.AddMsgText(' key.'+#13#10+#13#10);
  FormMain.AddMsgText('    Notes:', MsgTxtColors.colorKeyTitle, [fsBold]);
  FormMain.AddMsgText(#13#10+
                      '- You can still select single systems'+#13#10+
                      '- Browse/select works just like in Windows Explorer'+#13#10+
                      '- Selecting ');
  FormMain.AddMsgText('All Systems', MsgTxtColors.colorKeyTitle, [fsBold]);
  FormMain.AddMsgText(' will discard all other selections');
  case ActionMode of
    0: FormMain.AddMsgText(#13#10+
                           '- Systems not showing in the list have no games list created for them'); // Games filters
    1: FormMain.AddMsgText(#13#10+
                           '- Systems not showing in the list have no games folders selected for them'); // Create games list
  end;
  FormMain.ShowMessageBox(FormConsCompSystemSelector.Caption, 'Usage Help');
end;

procedure TFormConsCompSystemSelector.SystemsItemImageDraw(
  Sender: TCustomEasyListview; Item: TEasyItem; Column: TEasyColumn;
  ACanvas: TCanvas; const RectArray: TEasyRectArrayObject;
  AlphaBlender: TEasyAlphaBlender);
begin
  //Exit; // debugging
  if not Is4KMode then
     Exit;

  FormMain.ELV_DrawIconSystem_CustomSysType(Sender, Item, Column, ACanvas, RectArray, IL_Systems, False);
end;

procedure TFormConsCompSystemSelector.SystemsItemImageDrawIsCustom(
  Sender: TCustomEasyListview; Item: TEasyItem; Column: TEasyColumn;
  var IsCustom: Boolean);
begin
  //Exit; // debugging
  if Is4KMode then
     IsCustom:= True;
end;

procedure TFormConsCompSystemSelector.SystemsItemImageGetSize(
  Sender: TCustomEasyListview; Item: TEasyItem; Column: TEasyColumn;
  var ImageWidth, ImageHeight: Integer);
begin
  //Exit; // debugging
  if Is4KMode then
     begin
       ImageWidth:=  IL_Systems.Width;            // 4K mode = 32x32
       ImageHeight:= IL_Systems.Height+4+FormMain.IL_GroupedMode.Width; // 4 -> space between sys icon / sys type icon
     end;
end;

end.
