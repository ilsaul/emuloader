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
  private
    { Private declarations }
    procedure SelectSysFilters;
    //procedure UpdateSysFilters;
    procedure ResizeForm;
    procedure ResizeScreen;
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

{
// not used anymore ??? (April 04, 2019)
procedure TFormConsCompSystemSelector.UpdateSysFilters;
var
  Item: TEasyItem;
  allSystems: Boolean;
  Loop: Integer;
begin
  // this function is for games filters only... this is NOT used anymore!!! (November 17, 2017)
  if ActionMode <> 0 then
     Exit;
  Item:= Systems.Groups.FirstItem;
  if Item = nil then
     Exit; // ... just in case the list is empty!

  allSystems:= Item.Selected; // first item is ALWAYS "All Systems" and it's ALWAYS visible!
  if allSystems then
     begin
       for Loop:= Low(FormMain.FilterSysConsComp) to High(FormMain.FilterSysConsComp) do
           FormMain.FilterSysConsComp[Loop]:= allSystems; // set systems visible
       Exit;
     end
  else
     FormMain.FilterSysConsComp[0]:= False; // set "All Systems" filter to FALSE

  if Systems.Selection.Count = 1 then
     begin
       for Loop:= Low(FormMain.FilterSysConsComp) to High(FormMain.FilterSysConsComp) do
           FormMain.FilterSysConsComp[Loop]:= allSystems; // set systems visible or not visible
       Item:= Systems.Selection.First;
       FormMain.FilterSysConsComp[Item.ImageIndex]:= True; // select the systems get outta here!
       Exit;
     end
  else
     begin
       if allSystems then
          Exit; // all systems are already selected... nothing more to do here!
     end;

  // select first filter (after "all systems)
  Item:= Systems.Groups.NextItem(Item);
  repeat
    // apply multiple filters selection!
    case Item.Visible of
      True : FormMain.FilterSysConsComp[Item.ImageIndex]:= Item.Selected;
      False: FormMain.FilterSysConsComp[Item.ImageIndex]:= True; // set visible to all unavailable systems!
    end;
    Item:= Systems.Groups.NextItem(Item);
  until Item = nil;
end;
}

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
       //if CanClose then
       //   UpdateSysFilters; // this is NOT needed anymore!!! (November 17, 2017)
     end;
end;

procedure TFormConsCompSystemSelector.ResizeForm;
begin
  if Screen.Width >= 1280 then
     begin
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
  LoadCustomMAMEIconToForm(TForm(Sender));

  ResizeForm;

  CreateNewList.Checked:= Boolean(FormMain.MenuCreateCustomGamesList.Tag);
  CreateNewList.Visible:= FormMain.MenuCreateCustomGamesList.HelpContext = 1;
  LabelCreateNewList.Visible:= CreateNewList.Visible;
  //ButtonHelp.Visible:= not CreateNewList.Visible;
  Systems.Selection.MultiSelect:= ButtonHelp.Visible;
  //Systems.HotTrack.Enabled:= not CreateNewList.Visible; // always enabled from now on

  FormMain.ELV_ResetNormalColors(Systems);
  if IsNightMode then
     FormMain.ELV_SetNightModeColors(Systems);

  //if ActionMode in [0, 1] then
  //   Caption:= 'Select One or More Systems';

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
  CallMessageBox;
  FormMain.AddMsgText('    You can select more than one system:'+#13#10+#13#10);
  FormMain.AddMsgText('1.', MsgTxtColors.colorWarning, [fsBold]);
  FormMain.AddMsgText(' Hold ');
  FormMain.AddMsgText('Ctrl', MsgTxtColors.colorFileName, [fsBold]);
  FormMain.AddMsgText(' or ');
  FormMain.AddMsgText('Shift', MsgTxtColors.colorFileName, [fsBold]);
  FormMain.AddMsgText(' key down and click on all systems you want to include in the filter.'+#13#10+
                      '    You can also use the arrow keys to browse the list and press the ');
  FormMain.AddMsgText('Space', MsgTxtColors.colorFileName, [fsBold]);
  FormMain.AddMsgText(' bar to select/unselect systems.'+#13#10+#13#10);
  if CreateNewList.Visible then
     begin
       FormMain.AddMsgText('2.', MsgTxtColors.colorWarning, [fsBold]);
       FormMain.AddMsgText(' Check option ');
       FormMain.AddMsgText('Create a New List', MsgTxtColors.colorWarning, [fsBold]);
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
  FormMain.AddMsgText('    Notes:', clBlack, [fsBold]);
  FormMain.AddMsgText(#13#10+
                      '- You can still select single systems'+#13#10+
                      '- Browse/select works just like in Windows Explorer'+#13#10+
                      '- Selecting ');
  FormMain.AddMsgText('All Systems', MsgTxtColors.colorFileName, [fsBold]);
  FormMain.AddMsgText(' will discard all other selections');
  case ActionMode of
    0: FormMain.AddMsgText(#13#10+
                           '- Systems not showing in the list have no games list created for them'); // Games filters
    1: FormMain.AddMsgText(#13#10+
                           '- Systems not showing in the list have no games folders selected for them'); // Create games list
  end;
  GenerateMessage(FormConsCompSystemSelector.Caption, 'Usage Help');
end;


end.
