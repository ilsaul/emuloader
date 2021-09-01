unit uSelectFilterSystemMega;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, CommCtrl,
  ComCtrls, StdCtrls, MPCommonObjects, MPCommonUtilities, EasyListview,
  ExtCtrls, Buttons, PanelEx, ShadowLabel, ImgList,
  uCommon, uCommonCustom, Menus, BarMenus, ButtonsEx;

type
  TFormSelectFilterSystemMega = class(TForm)
    PanelBottom: TPanelEx;
    ButtonOk: TBitBtnEx;
    ButtonCancel: TBitBtnEx;
    ButtonReset: TBitBtnEx;
    IL_Systems: TImageList;
    IL_MachinesFilters: TImageList;
    LabelSelectMode: TShadowLabel;
    PanelMachinesType: TPanelEx;
    MachinesTypeList: TEasyListview;
    ButtonHelp: TBitBtnEx;
    LabelCategoryIniForMESS: TShadowLabel;
    LabelCategoryIniFolderForMESS: TShadowLabel;
    PopupSystems: TBcBarPopupMenu;
    PopupCheckAllArcadeSystems: TMenuItem;
    PopupUncheckAllArcadeSystems: TMenuItem;
    N46: TMenuItem;
    PopupCheckAllConsCompSystems: TMenuItem;
    PopupUncheckAllConsCompSystems: TMenuItem;
    N1: TMenuItem;
    PopupCheckAllConsoleSystems: TMenuItem;
    PopupUncheckAllConsoleSystems: TMenuItem;
    N2: TMenuItem;
    PopupCheckAllComputerSystems: TMenuItem;
    PopupUncheckAllComputerSystems: TMenuItem;
    N3: TMenuItem;
    PopupCheckAllHandheldSystems: TMenuItem;
    PopupUncheckAllHandheldSystems: TMenuItem;
    PanelSystemsListView: TPanelEx;
    SystemsListView: TEasyListview;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure SystemsListViewKeyAction(Sender: TCustomEasyListview;
      var CharCode: Word; var Shift: TShiftState; var DoDefault: Boolean);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure ButtonResetClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure MachinesTypeListItemPaintText(Sender: TCustomEasyListview;
      Item: TEasyItem; Position: Integer; ACanvas: TCanvas);
    procedure ButtonHelpClick(Sender: TObject);
    procedure LabelCategoryIniForMESSMouseEnter(Sender: TObject);
    procedure LabelCategoryIniForMESSMouseLeave(Sender: TObject);
    procedure LabelCategoryIniForMESSClick(Sender: TObject);
    procedure MachinesTypeListItemCheckChange(Sender: TCustomEasyListview;
      Item: TEasyItem);
    procedure SystemsListViewItemCheckChange(
      Sender: TCustomEasyListview; Item: TEasyItem);
    procedure SystemsListViewItemPaintText(Sender: TCustomEasyListview;
      Item: TEasyItem; Position: Integer; ACanvas: TCanvas);
    procedure PopupCheckAllArcadeSystemsClick(Sender: TObject);
    procedure SystemsListViewItemImageDrawIsCustom(
      Sender: TCustomEasyListview; Item: TEasyItem; Column: TEasyColumn;
      var IsCustom: Boolean);
    procedure SystemsListViewItemImageGetSize(Sender: TCustomEasyListview;
      Item: TEasyItem; Column: TEasyColumn; var ImageWidth,
      ImageHeight: Integer);
    procedure SystemsListViewItemImageDraw(Sender: TCustomEasyListview;
      Item: TEasyItem; Column: TEasyColumn; ACanvas: TCanvas;
      const RectArray: TEasyRectArrayObject;
      AlphaBlender: TEasyAlphaBlender);
    procedure PopupSystemsMeasureMenuItem(Sender: TObject;
      AMenuItem: TMenuItem; ACanvas: TCanvas; var Width, Height: Integer;
      ABarVisible: Boolean; var DefaultMeasure: Boolean);
  private
    { Private declarations }
    tmpFilterSysArcade: array[0..MaxArcadeSystems] of Boolean; // multiple systems filter
    tmpFilterSysConsComp: packed array[0..MaxConsoleComputerSystems] of Boolean;
    procedure ResizeForm;
    procedure AddMachinesFilters;
    procedure ShowHideSystems;
    procedure ValidateChanges;
    procedure CheckUncheckAll(SystemTypeIndex: Integer; CheckItems: Boolean);
    procedure Resize4K;
  public
    { Public declarations }
    FiltersHaveChanged, MAMEMachinesListPanelChanged: Boolean;
  end;

var
  FormSelectFilterSystemMega: TFormSelectFilterSystemMega;

implementation

uses uMain;

var
  tmpFilterMachineType: TFilterMachineType;

{$R *.dfm}

procedure TFormSelectFilterSystemMega.Resize4K;
begin
  if not Is4KMode then
     Exit;

  with FormSelectFilterSystemMega do
  begin
    Font.Size:= 16;

    FormMain.Set4KImageListSpecs(IL_Systems,         128);
    FormMain.Set4KImageListSpecs(IL_MachinesFilters, 68);

    FormMain.Set4KLabelSpecs(LabelSelectMode, -1, -1, -1, 40, 16);


    SystemsListView.View:= elsIcon;
    //SystemsListView.PaintInfoItem.IconViewRemoveIconTopBorder:= True; // don't use this, replaced by IconViewIconTopBorderIndent (reminder, do not remove this line)
    SystemsListView.PaintInfoItem.IconViewIconTopBorderIndent:= 9; // 11 pixels icon border
    SystemsListView.PaintInfoItem.IconViewCheckVertAlignMiddle:= True; // vert center align checkbox / radiobutton
    SystemsListView.PaintInfoItem.IconViewCaptionBorder:= 7; // extra border to better center the caption, so they look the same as other screens that do not have checkbox enabled
    SystemsListView.CellSizes.Icon.Width:= 156+22+SystemsListView.PaintInfoItem.CheckIndent;//+SystemsListView.PaintInfoItem.ImageIndent; // ImageIndent should be ZERO
    SystemsListView.CellSizes.Icon.Height:= 207+32+4;// // 32+4 (systype icon + border)

    //SystemsListView.PaintInfoItem.CaptionIndent:= 4; // does nothing for "elvIcon" view
    //SystemsListView.PaintInfoItem.ImageIndent:= 2;   // does nothing for "elvIcon" view
    SystemsListView.PaintInfoItem.CheckIndent:= 6;
    FormMain.Set4KListViewCheckBoxHDSpecs(SystemsListView);

    FormMain.Set4KListViewSpecs(SystemsListView, 8, 8, (SystemsListView.CellSizes.Icon.Width*16)+20, SystemsListView.CellSizes.Icon.Height*5, 16); // 15 columns, 5 lines
    PanelSystemsListView.Height:= SystemsListView.Height+16;

    MachinesTypeList.CellSizes.Tile.Width:= 720;
    MachinesTypeList.CellSizes.Tile.Height:= 88;

    MachinesTypeList.PaintInfoItem.CheckIndent:= 3;
    FormMain.Set4KListViewCheckBoxHDSpecs(MachinesTypeList);

    FormMain.Set4KListViewSpecs(MachinesTypeList, 8, 8, SystemsListView.Width, MachinesTypeList.CellSizes.Tile.Height*2, 16);
    PanelMachinesType.Height:= (MachinesTypeList.CellSizes.Tile.Height*2)+16;

    ClientWidth:= (SystemsListView.CellSizes.Icon.Width*16)+16;

    PanelBottom.Height:= 71;
    LabelCategoryIniForMESS.Font.Size:= 16;
    LabelCategoryIniFolderForMESS.Font.Size:= 16;
    FormMain.Set4KLabelSpecs(LabelCategoryIniForMESS,       (ClientWidth-LabelCategoryIniForMESS.Width) div 2,       4, -1, -1, 16);
    FormMain.Set4KLabelSpecs(LabelCategoryIniFolderForMESS, (ClientWidth-LabelCategoryIniFolderForMESS.Width) div 2, LabelCategoryIniForMESS.Height+4, -1, -1, 16);
    
    FormMain.Set4KButtonSpecs(ButtonReset, 10, 16, 168, 45, 16);
    FormMain.Set4KButtonSpecs(ButtonHelp, ButtonReset.Left+ButtonReset.Width+10, 16, 68, 45, 16);
    FormMain.Set4KButtonsOkCancelPanel(PanelBottom, ButtonOk, ButtonCancel, False);

    ClientHeight:= PanelSystemsListView.Top+PanelSystemsListView.Height+PanelBottom.Height;
  end;
end;

procedure TFormSelectFilterSystemMega.ResizeForm;
var
  HeightDiff, VisibleCount, ItemsLineCount, ColumnsCount, MaxHeight, MachineTypeColumnsCount, MachineTypeLinesCount: Integer;
  ScreenWidthTest, ScreenHeightTest: Integer;
begin
  if Is4KMode then
     ColumnsCount:= 16
  else
     ColumnsCount:= 5; // for 1920x1080
  MachineTypeColumnsCount:= 4;
  MachineTypeLinesCount:= 2;
  VisibleCount:= SystemsListView.Groups.VisibleItemCount;

  ScreenWidthTest:=  Screen.Width;
  ScreenHeightTest:= Screen.Height;
  MaxHeight:= (Screen.DesktopHeight-45)-FormSelectFilterSystemMega.Top;

  if not Is4KMode then
  begin
    case ScreenHeightTest of
      900: // 1440x900
        begin
          ColumnsCount:= 6;
          MachineTypeColumnsCount:= 4;
        end;
      864: // 1152x864
        begin
          ColumnsCount:= 5;
          MachineTypeColumnsCount:= 3;
        end;
      768:
        begin
          ColumnsCount:= 4;
          MachineTypeColumnsCount:= 2;
          //VisibleCount:= 13; // for debugging only
          //if VisibleCount <= 13 then
          //   ColumnsCount:= 2;//1;
        end;
      720, 800, 960, 1024: // 1280x720 / 1280x800 / 1280x960 / 1280x1024
        begin
          if ScreenWidthTest < 1440 then
             begin
               ColumnsCount:= 5;
               MachineTypeColumnsCount:= 3;
             end
          else
             begin
               // for 1600x1024
               ColumnsCount:= 6;
               MachineTypeColumnsCount:= 4;
             end;
          //VisibleCount:= 12; // for debugging only
          //if VisibleCount <= 12 then
          //   ColumnsCount:= 2;//1;
        end;
      600, 664: // 1176x664
        begin
          ColumnsCount:= 3;
          MachineTypeColumnsCount:= 2;
          MachineTypeLinesCount:= 2;
          //VisibleCount:= 9; // for debugging only
          //if VisibleCount <= 9 then
          //   ColumnsCount:= 2;//1;
        end;
      480:
        begin
          ColumnsCount:= 3;
          MachineTypeColumnsCount:= 2;
          MachineTypeLinesCount:= 2;
          //VisibleCount:= 6; // for debugging only
          //if VisibleCount > 6 then
          //   begin
               //HeightDiff:= MachinesTypeList.Height-(MachinesTypeList.CellSizes.Tile.Height*2)-6;
               //MachinesTypeList.Height:= HeightDiff;
               //PanelMachinesType.Height:= MachinesTypeList.Height+1;
               //SystemsListView.Top:= SystemsListView.Top-HeightDiff-1;
          //   end;
          //if VisibleCount <= 6 then
          //   ColumnsCount:= 3;//1;
        end;
    else
      begin
        if ScreenHeightTest > 1048 then
           begin
             ColumnsCount:= 6;
             MachineTypeColumnsCount:= 4;
             //if VisibleCount <= 17 then
             //   ColumnsCount:= 2;
           end;
      end;
    end;

    case ScreenWidthTest of
      1920..3000:
        begin
          ColumnsCount:= 5;
          MachineTypeColumnsCount:= 4;
          MachineTypeLinesCount:= 2;
          SystemsListView.CellSizes.Tile.Width:= 240;
        end;
      960:
        begin
          ColumnsCount:= 4;
          MachineTypeColumnsCount:= 2;
          MachineTypeLinesCount:= 2;
        end;
      1360, 1366:
        begin
          ColumnsCount:= 5;
          MachineTypeColumnsCount:= 3;
        end;
    end;

    MachinesTypeList.Width:= (MachinesTypeList.CellSizes.Tile.Width*MachineTypeColumnsCount)+MachinesTypeList.PaintInfoItem.Border+GetSystemMetrics(SM_CXVSCROLL);
    MachinesTypeList.Height:= (MachinesTypeList.CellSizes.Tile.Height*MachineTypeLinesCount)+MachinesTypeList.PaintInfoItem.Border;

    PanelMachinesType.Height:= MachinesTypeList.Height+1;
  end;

  //SystemsListView.Top:= (PanelMachinesType.Top+PanelMachinesType.Height)+3;

  ItemsLineCount:= SystemsListView.Groups.VisibleItemCount div ColumnsCount;
  if ItemsLineCount = 0 then
     ItemsLineCount:= 1
  else
     begin
       if SystemsListView.Groups.VisibleItemCount mod ColumnsCount <> 0 then
          Inc(ItemsLineCount);
     end;



  if Is4KMode then
     begin
       SystemsListView.Height:= (ItemsLineCount*SystemsListView.CellSizes.Icon.Height);//+SystemsListView.PaintInfoItem.Border;
       PanelSystemsListView.Height:= SystemsListView.Top+SystemsListView.Height+16;
       //FormSelectFilterSystemMega.ClientWidth:= (SystemsListView.CellSizes.Tile.Width*ColumnsCount)+SystemsListView.PaintInfoItem.Border+SystemsListView.Left;
       FormSelectFilterSystemMega.ClientHeight:= PanelSystemsListView.Top+PanelSystemsListView.Height+PanelBottom.Height;//  LabelSelectMode.Height+PanelMachinesType.Height+PanelSystemsListView.Height+PanelBottom.Height;
     end
  else
  begin
    SystemsListView.Height:= (ItemsLineCount*SystemsListView.CellSizes.Tile.Height)+SystemsListView.PaintInfoItem.Border;
    SystemsListView.Width:= (SystemsListView.CellSizes.Tile.Width*ColumnsCount)+SystemsListView.PaintInfoItem.Border+GetSystemMetrics(SM_CXVSCROLL);

    PanelSystemsListView.Height:= SystemsListView.Height+SystemsListView.Top;
    FormSelectFilterSystemMega.ClientWidth:= (SystemsListView.CellSizes.Tile.Width*ColumnsCount)+SystemsListView.PaintInfoItem.Border+SystemsListView.Left;
    FormSelectFilterSystemMega.ClientHeight:= LabelSelectMode.Height+PanelMachinesType.Height+PanelSystemsListView.Height+PanelBottom.Height;

    if (FormSelectFilterSystemMega.Top+FormSelectFilterSystemMega.Height) > MaxHeight then //ScreenHeightTest-68) then
    //if FormSelectFilterSystemMega.Height > MaxHeight then
       begin
         HeightDiff:= (FormSelectFilterSystemMega.Top+FormSelectFilterSystemMega.Height)-MaxHeight;//(ScreenHeightTest-68); //// FormSelectFilterSystemMega.Height-MaxHeight;//+GetSystemMetrics(SM_CYCAPTION);//+SystemsListView.PaintInfoItem.Border;
         SystemsListView.Height:= SystemsListView.Height-HeightDiff;//+SystemsListView.PaintInfoItem.Border;
         PanelSystemsListView.Height:= SystemsListView.Height;//+SystemsListView.Top;
         FormSelectFilterSystemMega.ClientHeight:= LabelSelectMode.Height+PanelMachinesType.Height+PanelSystemsListView.Height+PanelBottom.Height;
         //FormSelectFilterSystemMega.Height:= FormSelectFilterSystemMega.Height-HeightDiff;// MaxHeight-GetSystemMetrics(SM_CYCAPTION);
       end;
    if (FormSelectFilterSystemMega.Left+FormSelectFilterSystemMega.Width) >= ScreenWidthTest then
       FormSelectFilterSystemMega.Left:= 0;

    if MachinesTypeList.Scrollbars.VertBarVisible then
       MachinesTypeList.HotTrack.Enabled:= False;

    if SystemsListView.Scrollbars.VertBarVisible then
       begin
         SystemsListView.HotTrack.Enabled:= False;
         FormSelectFilterSystemMega.ClientWidth:= FormSelectFilterSystemMega.ClientWidth+GetSystemMetrics(SM_CXVSCROLL);
       end;

    ButtonCancel.Left:= (FormSelectFilterSystemMega.ClientWidth-ButtonCancel.Width)-6;
    ButtonOk.Left:= ButtonCancel.Left-ButtonOk.Width-4;

    if ScreenWidthTest > 640 then
       begin
         HeightDiff:= (ButtonOk.Left-(ButtonHelp.Left+ButtonHelp.Width));
         LabelCategoryIniForMESS.Left:= (HeightDiff-LabelCategoryIniForMESS.Width) div 2 +ButtonHelp.Left+ButtonHelp.Width;
         LabelCategoryIniFolderForMESS.Left:= (HeightDiff-LabelCategoryIniFolderForMESS.Width) div 2+ButtonHelp.Left+ButtonHelp.Width;
       end;
  end;
  // for debugging only
  //FormSelectFilterSystemMega.Caption:= 'Form Size: '+IntToStr(FormSelectFilterSystemMega.Left+FormSelectFilterSystemMega.Width)+'x'+IntToStr(FormSelectFilterSystemMega.Top+FormSelectFilterSystemMega.Height);
end;

procedure TFormSelectFilterSystemMega.AddMachinesFilters;

  function AddMachineItem(ItemIconIndex: Integer; TitleStr, DetailsStr: WideString; ItemChecked: Boolean): Boolean;
  var
    Item: TEasyItem;
  begin

    Item:= MachinesTypeList.Items.Add;
    Item.ImageIndex:= ItemIconIndex;
    Item.Caption:= TitleStr;
    Item.Bold:= True;
    Item.Checked:= ItemChecked;
    if not Item.Checked then
       Item.State:= Item.State+[esosGhosted];

      //ELV_SetGhostedIcon(Item);
    Item.Captions[1]:= DetailsStr;
    Item.Details[1]:= 1;

    {with MachinesTypeList.Items.Add do
    begin
      ImageIndex:= ItemIconIndex;
      Caption:= TitleStr;
      Bold:= True;
      Checked:= ItemChecked;
      if not Checked then
         State:= State+[esosGhosted];

      //ELV_SetGhostedIcon(Item);
      Captions[1]:= DetailsStr;
      Details[1]:= 1;
    end;}
  end;

begin
  MachinesTypeList.BeginUpdate;
  MachinesTypeList.Items.ReIndexDisable:= True;

  AddMachineItem(0, 'Arcade Systems', 'Enable arcade games', FormMain.FilterMachineType.ArcadeSystems_Enabled);
  AddMachineItem(1, 'Console Systems', 'Enable console games', FormMain.FilterMachineType.ConsoleSystems_Enabled);
  AddMachineItem(2, 'Computer Systems', 'Enable computer games', FormMain.FilterMachineType.ComputerSystems_Enabled);
  AddMachineItem(3, 'Handheld Systems', 'Enable handheld games', FormMain.FilterMachineType.HandheldSystems_Enabled);
  AddMachineItem(4, 'MAME Machines With Software Lists', 'Enable console/computer machines', FormMain.FilterMachineType.MAMEMachinesWithSoftwareList_Enabled);
  AddMachineItem(4, 'MAME Machines Without Software Lists', 'Enable console/computer machines', FormMain.FilterMachineType.MAMEMachinesWithoutSoftwareList_Enabled);
  AddMachineItem(5, 'MAME Software List Games', 'Enable console/computer games', FormMain.FilterMachineType.MAMESoftwareListGames_Enabled);
  AddMachineItem(5, 'Enable MAME Machines Filter Panel', 'Filter games by machine', FormMain.FilterMachineType.MAMEMachinesFilterPanel_Enabled);

  MachinesTypeList.Items.ReIndexDisable:= False;
  MachinesTypeList.EndUpdate;
end;

procedure TFormSelectFilterSystemMega.ShowHideSystems;
var
  Item: TEasyItem;
begin
  SystemsListView.BeginUpdate;
  Item:= SystemsListView.Groups.FirstItem;
  repeat
    if Item.Tag = 0 then // Tag -1 means systems not available
    begin
      if FormMain.ELV_IsArcadeSystemMulti(Item) then
         Item.Visible:= tmpFilterMachineType.ArcadeSystems_Enabled
      else
      if Item.StateImageIndex = 0 then
         Item.Visible:= tmpFilterMachineType.ConsoleSystems_Enabled or tmpFilterMachineType.ComputerSystems_Enabled or tmpFilterMachineType.HandheldSystems_Enabled
      else
      if SystemIsConsole(Item.StateImageIndex) then
         Item.Visible:= tmpFilterMachineType.ConsoleSystems_Enabled
      else
      if SystemIsComputer(Item.StateImageIndex) then
         Item.Visible:= tmpFilterMachineType.ComputerSystems_Enabled
      else
      if SystemIsHandheld(Item.StateImageIndex) then
         Item.Visible:= tmpFilterMachineType.HandheldSystems_Enabled;
    end;
       
    Item:= SystemsListView.Groups.NextItem(Item);
  until Item = nil;

  SystemsListView.EndUpdate(False);
end;

procedure TFormSelectFilterSystemMega.ValidateChanges;
var
  Loop: Integer;
begin
  FiltersHaveChanged:= False;
  MAMEMachinesListPanelChanged:= False;
  for Loop:= Low(tmpFilterSysArcade) to High(tmpFilterSysArcade) do
  begin
    if tmpFilterSysArcade[Loop] <> FormMain.FilterSysArcade[Loop] then
       FiltersHaveChanged:= True;
    FormMain.FilterSysArcade[Loop]:= tmpFilterSysArcade[Loop];
  end;

  if not FiltersHaveChanged then
  begin
    for Loop:= Low(tmpFilterSysConsComp) to High(tmpFilterSysConsComp) do
    begin
      if tmpFilterSysConsComp[Loop] <> FormMain.FilterSysConsComp[Loop] then
         FiltersHaveChanged:= True;
      FormMain.FilterSysConsComp[Loop]:= tmpFilterSysConsComp[Loop];
    end;
  end;

  if not FiltersHaveChanged then
     begin
       if tmpFilterMachineType.ArcadeSystems_Enabled <> FormMain.FilterMachineType.ArcadeSystems_Enabled then
          FiltersHaveChanged:= True;
     end;
  if not FiltersHaveChanged then
     begin
       if tmpFilterMachineType.ConsoleSystems_Enabled <> FormMain.FilterMachineType.ConsoleSystems_Enabled then
          FiltersHaveChanged:= True;
     end;
  if not FiltersHaveChanged then
     begin
       if tmpFilterMachineType.ComputerSystems_Enabled <> FormMain.FilterMachineType.ComputerSystems_Enabled then
          FiltersHaveChanged:= True;
     end;
  if not FiltersHaveChanged then
     begin
       if tmpFilterMachineType.HandheldSystems_Enabled <> FormMain.FilterMachineType.HandheldSystems_Enabled then
          FiltersHaveChanged:= True;
     end;
  if not FiltersHaveChanged then
     begin
       if tmpFilterMachineType.MAMEMachinesWithSoftwareList_Enabled <> FormMain.FilterMachineType.MAMEMachinesWithSoftwareList_Enabled then
          FiltersHaveChanged:= True;
     end;
  if not FiltersHaveChanged then
     begin
       if tmpFilterMachineType.MAMEMachinesWithoutSoftwareList_Enabled <> FormMain.FilterMachineType.MAMEMachinesWithoutSoftwareList_Enabled then
          FiltersHaveChanged:= True;
     end;
  if not FiltersHaveChanged then
     begin
       if tmpFilterMachineType.MAMESoftwareListGames_Enabled <> FormMain.FilterMachineType.MAMESoftwareListGames_Enabled then
          FiltersHaveChanged:= True;
     end;

  if tmpFilterMachineType.MAMEMachinesFilterPanel_Enabled <> FormMain.FilterMachineType.MAMEMachinesFilterPanel_Enabled then
     MAMEMachinesListPanelChanged:= True;

  FormMain.FilterMachineType.ArcadeSystems_Enabled:= tmpFilterMachineType.ArcadeSystems_Enabled;
  FormMain.FilterMachineType.ConsoleSystems_Enabled:= tmpFilterMachineType.ConsoleSystems_Enabled;
  FormMain.FilterMachineType.ComputerSystems_Enabled:= tmpFilterMachineType.ComputerSystems_Enabled;
  FormMain.FilterMachineType.HandheldSystems_Enabled:= tmpFilterMachineType.HandheldSystems_Enabled;
  FormMain.FilterMachineType.MAMEMachinesWithSoftwareList_Enabled:= tmpFilterMachineType.MAMEMachinesWithSoftwareList_Enabled;
  FormMain.FilterMachineType.MAMEMachinesWithoutSoftwareList_Enabled:= tmpFilterMachineType.MAMEMachinesWithoutSoftwareList_Enabled;
  FormMain.FilterMachineType.MAMESoftwareListGames_Enabled:= tmpFilterMachineType.MAMESoftwareListGames_Enabled;
  FormMain.FilterMachineType.MAMEMachinesFilterPanel_Enabled:= tmpFilterMachineType.MAMEMachinesFilterPanel_Enabled;
end;

procedure TFormSelectFilterSystemMega.CheckUncheckAll(SystemTypeIndex: Integer; CheckItems: Boolean);
var
  Item: TEasyItem;
begin
  if not FormMain.CheckTotal(SystemsListView) then
     Exit;

  SystemsListView.BeginUpdate;
  Item:= SystemsListView.Groups.FirstItem;
  repeat
    if (Item.ImageIndex <> 0) and (Item.StateImageIndex <> 0) then // "All Arcade Systems" and "All Console/Computer/Handheld Systems" are excluded!
    begin
      case SystemTypeIndex of
        0: // All Arcade Systems
          begin
            if FormMain.ELV_IsArcadeSystemMulti(Item) then
               Item.Checked:= CheckItems;
          end;
        1: // All Console/Computer/Handheld Systems
          begin
            if SystemIsConsole(Item.StateImageIndex) or SystemIsComputer(Item.StateImageIndex) or SystemIsHandheld(Item.StateImageIndex) then
               Item.Checked:= CheckItems;
          end;
        2: // All Console Systems
          begin
            if SystemIsConsole(Item.StateImageIndex) then
               Item.Checked:= CheckItems;
          end;
        3: // All Computer Systems
          begin
            if SystemIsComputer(Item.StateImageIndex) then
               Item.Checked:= CheckItems;
          end;
        4: // All Handheld Systems
          begin
            if SystemIsHandheld(Item.StateImageIndex) then
               Item.Checked:= CheckItems;
          end;
      end;
    end;
    Item:= SystemsListView.Groups.NextItem(Item);
  until Item = nil;
  SystemsListView.EndUpdate;
end;

procedure TFormSelectFilterSystemMega.FormKeyPress(Sender: TObject; var Key: Char);
begin
  case Key of
    #13: ButtonOk.Click;
    #27: ButtonCancel.Click;
  end;
end;

procedure TFormSelectFilterSystemMega.SystemsListViewKeyAction(
  Sender: TCustomEasyListview; var CharCode: Word; var Shift: TShiftState;
  var DoDefault: Boolean);
begin
  case CharCode of
    VK_RETURN: ButtonOk.Click;
    VK_ESCAPE: ButtonCancel.Click;
  end;
end;

procedure TFormSelectFilterSystemMega.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if ModalResult = mrOk then
     begin
       ValidateChanges;
     end;
end;

procedure TFormSelectFilterSystemMega.ButtonResetClick(Sender: TObject);
var
  Item: TEasyItem;
begin
  SystemsListView.BeginUpdate;
  Item:= SystemsListView.Groups.FirstItem;
  repeat
    if FormMain.ELV_IsArcadeSystemMulti(Item) then
        Item.Checked:= FormMain.FilterSysArcade[Item.ImageIndex]
    else
        Item.Checked:= FormMain.FilterSysConsComp[Item.StateImageIndex];
    Item:= SystemsListView.Groups.NextItem(Item);
  until Item = nil;
  SystemsListView.EndUpdate;

  tmpFilterMachineType.ArcadeSystems_Enabled:= FormMain.FilterMachineType.ArcadeSystems_Enabled;
  tmpFilterMachineType.ConsoleSystems_Enabled:= FormMain.FilterMachineType.ConsoleSystems_Enabled;
  tmpFilterMachineType.ComputerSystems_Enabled:= FormMain.FilterMachineType.ComputerSystems_Enabled;
  tmpFilterMachineType.HandheldSystems_Enabled:= FormMain.FilterMachineType.HandheldSystems_Enabled;
  tmpFilterMachineType.MAMEMachinesWithSoftwareList_Enabled:= FormMain.FilterMachineType.MAMEMachinesWithSoftwareList_Enabled;
  tmpFilterMachineType.MAMEMachinesWithoutSoftwareList_Enabled:= FormMain.FilterMachineType.MAMEMachinesWithoutSoftwareList_Enabled;
  tmpFilterMachineType.MAMESoftwareListGames_Enabled:= FormMain.FilterMachineType.MAMESoftwareListGames_Enabled;
  tmpFilterMachineType.MAMEMachinesFilterPanel_Enabled:= FormMain.FilterMachineType.MAMEMachinesFilterPanel_Enabled;

  Item:= MachinesTypeList.Groups.FirstItem;
  Item.Checked:= tmpFilterMachineType.ArcadeSystems_Enabled;

  Item:= MachinesTypeList.Groups.NextItem(Item);
  Item.Checked:= tmpFilterMachineType.ConsoleSystems_Enabled;

  Item:= MachinesTypeList.Groups.NextItem(Item);
  Item.Checked:= tmpFilterMachineType.ComputerSystems_Enabled;

  Item:= MachinesTypeList.Groups.NextItem(Item);
  Item.Checked:= tmpFilterMachineType.HandheldSystems_Enabled;

  Item:= MachinesTypeList.Groups.NextItem(Item);
  Item.Checked:= tmpFilterMachineType.MAMEMachinesWithSoftwareList_Enabled;

  Item:= MachinesTypeList.Groups.NextItem(Item);
  Item.Checked:= tmpFilterMachineType.MAMEMachinesWithoutSoftwareList_Enabled;

  Item:= MachinesTypeList.Groups.NextItem(Item);
  Item.Checked:= tmpFilterMachineType.MAMESoftwareListGames_Enabled;

  Item:= MachinesTypeList.Groups.NextItem(Item);
  Item.Checked:= tmpFilterMachineType.MAMEMachinesFilterPanel_Enabled;

  SystemsListView.SetFocus;
end;

procedure TFormSelectFilterSystemMega.FormShow(Sender: TObject);
var
  IconFolder: String;
  Item: TEasyItem;
begin
  Resize4K;
  FormMain.LoadSystemsIcons(IL_Systems, False);
  FormMain.LoadNonArcadeSystemIcons(IL_Systems, False, False);

  FormMain.ELV_ResetNormalColors(SystemsListView);
  FormMain.ELV_ResetNormalColors(MachinesTypeList);

  IconFolder:= FormMain.GetFolderFull(32);
  FormMain.AddDefaultIcons('systemtype_arcade.ico', IconFolder, IL_MachinesFilters);
  FormMain.AddDefaultIcons('systemtype_console.ico', IconFolder, IL_MachinesFilters);
  FormMain.AddDefaultIcons('systemtype_computer.ico', IconFolder, IL_MachinesFilters);
  FormMain.AddDefaultIcons('systemtype_handheld.ico', IconFolder, IL_MachinesFilters);
  FormMain.AddDefaultIcons('emu_mame.ico', IconFolder, IL_MachinesFilters);
  FormMain.AddDefaultIcons('emu_ume.ico', IconFolder, IL_MachinesFilters);

  if IsNightMode then
     begin
       FormSelectFilterSystemMega.Color:= menu_background_color[1];
       SetBottomPanelColors(PanelBottom);
       SetPanelColors(PanelMachinesType, menu_background_color[1], -1, True);
       SetPanelColors(PanelSystemsListView, menu_background_color[1], -1, True);

       FormMain.SetEasyListViewColors(MachinesTypeList, menu_background_color[1], item_caption_active_color[1]);
       FormMain.SetEasyListViewColors(SystemsListView,  menu_background_color[1], item_caption_active_color[1]);
       SetLabelColors(LabelSelectMode,               item_caption_active_color[1], item_caption_active_shadow_color[1]);
       SetLabelColors(LabelCategoryIniForMESS,       clrLightBlue, clNavy);
       SetLabelColors(LabelCategoryIniFolderForMESS, clSilver);

       FormMain.SetButtonExColors(ButtonOk);
       FormMain.SetButtonExColors(ButtonCancel);
       FormMain.SetButtonExColors(ButtonReset);
       FormMain.SetButtonExColors(ButtonHelp);

       FormMain.ELV_SetCheckRadioCustomIcon(MachinesTypeList);
       FormMain.ELV_SetCheckRadioCustomIcon(SystemsListView);

       FormMain.ELV_SetNightModeColors(MachinesTypeList);
       FormMain.ELV_SetNightModeColors(SystemsListView);

       FormMain.SetWin10DarkScrollBar(SystemsListview);
       FormMain.SetWin10DarkScrollBar(MachinesTypeList);
     end;

  FiltersHaveChanged:= False;
  MAMEMachinesListPanelChanged:= False;

  AddMachinesFilters;                                 //False -> show disabled should be FALSE
  FormMain.ELV_PopulateSystemsMulti(SystemsListView, 1, False, False, False, True);

  ResizeForm; // resize form to screen resolution fix item captions so users can click on empty space to select items

  ButtonReset.Click;
  ShowHideSystems; // show/hide all systems based on machine type filters... must be done before the .Tag:= 1 below!!!

  SystemsListView.BeginUpdate;
  Item:= SystemsListView.Groups.FirstItem;
  repeat
    if not Item.Checked then
       Item.State:= Item.State+[esosGhosted];
    Item:= SystemsListView.Groups.NextItem(Item);
  until Item = nil;
  SystemsListView.EndUpdate(False);
end;

procedure TFormSelectFilterSystemMega.MachinesTypeListItemPaintText(
  Sender: TCustomEasyListview; Item: TEasyItem; Position: Integer;
  ACanvas: TCanvas);
begin
  case Position of
    0: Canvas.Font.Style:= [fsBold];
    1: FormMain.ELV_SetSelecionFontColors(MachinesTypeList, Item, ACanvas, True);
  end;
  FormMain.ELV_SetGhostedIconText(Item, MachinesTypeList, ACanvas);
end;

procedure TFormSelectFilterSystemMega.ButtonHelpClick(Sender: TObject);
begin
  FormMain.InitMessageBox;
  FormMain.AddMsgText('    Select machine types and system types you want show or hide in the main games list.'+
                      ' Make sure you tick the checkbox next to each machine type and system.'+#13#10+
                      'MAME software list games are not part of ');
  FormMain.AddMsgText('console/computer/handheld systems', MsgTxtColors.colorKeyTitle);
  FormMain.AddMsgText('.'+#13#10+#13#10+'The ');
  FormMain.AddMsgText('Arcade Machines', MsgTxtColors.colorKeyTitle, [fsBold]);
  FormMain.AddMsgText(' machine type include MAME games.'+#13#10+'The ');
  FormMain.AddMsgText('MAME Machine Without Software List', MsgTxtColors.colorKeyTitle, [fsBold]);
  FormMain.AddMsgText(' option require AntoPISA''s ');
  FormMain.AddMsgText('mess.ini', MsgTxtColors.colorFileName, [fsBold]);
  FormMain.AddMsgText(' file to work.'+#13#10+#13#10+'    Checking options ');
  FormMain.AddMsgText('All Arcade Systems', MsgTxtColors.colorKeyTitle, [fsBold]);
  FormMain.AddMsgText(' and ');
  FormMain.AddMsgText('All Console/Computer/Handheld Systems', MsgTxtColors.colorKeyTitle, [fsBold]);
  FormMain.AddMsgText(' will show or hide ');
  FormMain.AddMsgText('all', -1, [fsBold]);
  FormMain.AddMsgText(' systems, but they will ');
  FormMain.AddMsgText('not', -1, [fsBold]);
  FormMain.AddMsgText(' change the checked status of individual systems.'+#13#10+#13#10+
                      '    Filter settings are saved in ');
  FormMain.AddMsgText('EmuLoader.ini', MsgTxtColors.colorFileName, [fsBold]);
  FormMain.AddMsgText(' when you exit the frontend.'+#13#10+#13#10+
                      '    You can find more options for systems panel in the popup menu (mouse right-click).');

  FormMain.ShowMessageBox('Info', 'Systems Filters', '');
end;

procedure TFormSelectFilterSystemMega.LabelCategoryIniForMESSMouseEnter(
  Sender: TObject);
begin
  if IsNightMode then
     SetLabelColors(TShadowLabel(Sender), clCream)
  else
     SetLabelColors(TShadowLabel(Sender), clBlue, clSilver);
end;

procedure TFormSelectFilterSystemMega.LabelCategoryIniForMESSMouseLeave(
  Sender: TObject);
begin
  if IsNightMode then
     SetLabelColors(TShadowLabel(Sender), clrLightBlue, clNavy)
  else
     SetLabelColors(TShadowLabel(Sender), clNavy, clSilver);
end;

procedure TFormSelectFilterSystemMega.LabelCategoryIniForMESSClick(
  Sender: TObject);
begin
  CallShellExecute(Sender);
end;

procedure TFormSelectFilterSystemMega.MachinesTypeListItemCheckChange(
  Sender: TCustomEasyListview; Item: TEasyItem);
begin
  //if FormSelectFilterSystemMega.Tag = 0 then
  //   Exit;
  case Item.Index of
    0: tmpFilterMachineType.ArcadeSystems_Enabled:= Item.Checked;
    1: tmpFilterMachineType.ConsoleSystems_Enabled:= Item.Checked;
    2: tmpFilterMachineType.ComputerSystems_Enabled:= Item.Checked;
    3: tmpFilterMachineType.HandheldSystems_Enabled:= Item.Checked;
    4: tmpFilterMachineType.MAMEMachinesWithSoftwareList_Enabled:= Item.Checked;
    5: tmpFilterMachineType.MAMEMachinesWithoutSoftwareList_Enabled:= Item.Checked;
    6: tmpFilterMachineType.MAMESoftwareListGames_Enabled:= Item.Checked;
    7: tmpFilterMachineType.MAMEMachinesFilterPanel_Enabled:= Item.Checked;
  end;
  case Item.Checked of
    True : Item.State:= Item.State-[esosGhosted];
    False: Item.State:= Item.State+[esosGhosted];
  end;

  if FormSelectFilterSystemMega.Tag = 1 then // cannot filter while loading the machines list at Form.OnActivate() event
     ShowHideSystems;
end;

procedure TFormSelectFilterSystemMega.SystemsListViewItemCheckChange(
  Sender: TCustomEasyListview; Item: TEasyItem);
begin
  //if FormSelectFilterSystemMega.Tag = 0 then
  //   Exit;
  if FormMain.ELV_IsArcadeSystemMulti(Item) then
     tmpFilterSysArcade[Item.ImageIndex]:= Item.Checked
  else
     tmpFilterSysConsComp[Item.StateImageIndex]:= Item.Checked;

  FormMain.ELV_SetGhostedIcon(Item);
end;

procedure TFormSelectFilterSystemMega.SystemsListViewItemPaintText(
  Sender: TCustomEasyListview; Item: TEasyItem; Position: Integer;
  ACanvas: TCanvas);
begin
  if not Is4KMode then
     if Position = 1 then
        FormMain.ELV_SetSelecionFontColors(SystemsListView, Item, ACanvas);

  FormMain.ELV_SetGhostedIconText(Item, SystemsListView, ACanvas);
end;

procedure TFormSelectFilterSystemMega.PopupCheckAllArcadeSystemsClick(
  Sender: TObject);
begin
  CheckUncheckAll(TMenuItem(Sender).HelpContext, Boolean(TMenuItem(Sender).Tag));
end;

procedure TFormSelectFilterSystemMega.SystemsListViewItemImageDrawIsCustom(
  Sender: TCustomEasyListview; Item: TEasyItem; Column: TEasyColumn;
  var IsCustom: Boolean);
begin
  IsCustom:= True; // this is for tiles view mode
end;

procedure TFormSelectFilterSystemMega.SystemsListViewItemImageGetSize(
  Sender: TCustomEasyListview; Item: TEasyItem; Column: TEasyColumn;
  var ImageWidth, ImageHeight: Integer);
begin
  ImageWidth:= IL_Systems.Width;
  if Is4KMode then
     ImageHeight:= IL_Systems.Height+FormMain.IL_GroupedMode.Width+4 // +4 -> space between sys icon / sys type icon
  else
     ImageHeight:= IL_Systems.Height;
end;

procedure TFormSelectFilterSystemMega.SystemsListViewItemImageDraw(
  Sender: TCustomEasyListview; Item: TEasyItem; Column: TEasyColumn;
  ACanvas: TCanvas; const RectArray: TEasyRectArrayObject;
  AlphaBlender: TEasyAlphaBlender);
var
  iLeft, iTop: Integer;
  iSysTypeIndex: Integer;
begin
  if Is4KMode then
     FormMain.ELV_DrawTileSystem_CustomSysType(Sender, Item, Column, ACanvas, RectArray, IL_Systems, True)
  else
  begin
    iLeft:= RectArray.IconRect.Left+SystemsListView.PaintInfoItem.ImageIndent;
    iTop:=  RectArray.IconRect.Top+2;

    if FormMain.ELV_IsArcadeSystemMulti(Item) then
       begin
         if Item.Ghosted then
            FormMain.DrawGhostedImage(ACanvas.Handle, SystemsListView.ImagesExLarge, Item.ImageIndex, iLeft, iTop, False)
         else
            SystemsListView.ImagesExLarge.Draw(ACanvas, iLeft, iTop, Item.ImageIndex);
         if Item.ImageIndex > 0 then
            begin
              iLeft:= iLeft+SystemsListView.ImagesExLarge.Width+SystemsListView.PaintInfoItem.CaptionIndent;
              iTop:= iTop+(SystemsListView.ImagesExLarge.Height-FormMain.IL_MenuPopup.Height);

              if Item.Ghosted then
                 FormMain.DrawGhostedImage(ACanvas.Handle, FormMain.IL_MenuPopup, 24, iLeft, iTop, False)
              else
                 FormMain.IL_MenuPopup.Draw(ACanvas, iLeft, iTop, 24); // index 24 is "arcade" icon
            end;
       end
    else
       begin
         if Item.Ghosted then
            FormMain.DrawGhostedImage(ACanvas.Handle, SystemsListView.ImagesExLarge, MaxArcadeSystems+1+Item.StateImageIndex, iLeft, iTop, False)
         else
            SystemsListView.ImagesExLarge.Draw(ACanvas, iLeft, iTop, MaxArcadeSystems+1+Item.StateImageIndex);

         iLeft:= iLeft+SystemsListView.ImagesExLarge.Width+SystemsListView.PaintInfoItem.CaptionIndent;
         iTop:=  iTop+(SystemsListView.ImagesExLarge.Height-FormMain.IL_MenuPopup.Height);

         if Item.StateImageIndex > 0 then
            begin
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
                 begin
                   if Item.Ghosted then
                      FormMain.DrawGhostedImage(ACanvas.Handle, FormMain.IL_MenuPopup, iSysTypeIndex, iLeft, iTop, False)
                   else
                      FormMain.IL_MenuPopup.Draw(ACanvas, iLeft, iTop, iSysTypeIndex);
                 end;
            end;
       end;
  end;
end;

procedure TFormSelectFilterSystemMega.PopupSystemsMeasureMenuItem(
  Sender: TObject; AMenuItem: TMenuItem; ACanvas: TCanvas; var Width,
  Height: Integer; ABarVisible: Boolean; var DefaultMeasure: Boolean);
begin
  FormMain.SetPopupMenuMeasureItem(AMenuItem, ACanvas, Width, Height);
end;

end.
