unit uScreenshotsLayout;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  StdCtrls, ComCtrls, ExtCtrls, IniFiles, ToolWin, Buttons,
  MPCommonObjects, EasyListview, GR32_Image;

type
  TLayoutInfo = record
    lImage1_imgCategory,
    lImage2_imgCategory,
    lImage3_imgCategory: ShortInt;
    lImage2_Enabled,
    lImage3_Enabled: Boolean;
  end;
  pLayoutInfo = ^TLayoutInfo;
  
type
  TFormScreenshotsLayout = class(TForm)
    BottomBar: TImage32;
    ButtonOk: TButton;
    ButtonCancel: TButton;
    PageControlImages: TPageControl;
    TabSheetCategories: TTabSheet;
    TabSheetLayouts: TTabSheet;
    ImageScrLayout: TImage;
    LabelLayoutTreeView: TLabel;
    LayoutListView: TEasyListview;
    ScreenshotLayoutsButtonEditTitle: TButton;
    ScreenshotLayoutsDefault: TButton;
    ScreenshotLayoutsButtonRestoreTitle: TButton;
    IconLayScr2: TImage32;
    PanelEnabledScr2: TCheckBox;
    LabelScreenshot2: TLabel;
    LabelLayScr2: TLabel;
    IconLayScr1: TImage32;
    LabelScreenshot1: TLabel;
    LabelLayScr1: TLabel;
    PanelEnabledScr3: TCheckBox;
    IconLayScr3: TImage32;
    LabelScreenshot3: TLabel;
    LabelLayScr3: TLabel;
    procedure FormShow(Sender: TObject);
    procedure ButtonOkClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure ButtonCancelClick(Sender: TObject);
    procedure LayoutListViewItemCheckChange(
      Sender: TCustomEasyListview; Item: TEasyItem);
    procedure LayoutListViewItemEdited(
      Sender: TCustomEasyListview; Item: TEasyItem; var NewValue: Variant;
      var Accept: Boolean);
    procedure LayoutListViewItemEditEnd(
      Sender: TCustomEasyListview; Item: TEasyItem);
    procedure LayoutListViewItemPaintText(
      Sender: TCustomEasyListview; Item: TEasyItem; Position: Integer;
      ACanvas: TCanvas);
    procedure LayoutListViewItemSelectionChanged(
      Sender: TCustomEasyListview; Item: TEasyItem);
    procedure LayoutListViewKeyAction(
      Sender: TCustomEasyListview; var CharCode: Word;
      var Shift: TShiftState; var DoDefault: Boolean);
    procedure ScreenshotLayoutsButtonEditTitleClick(Sender: TObject);
    procedure ScreenshotLayoutsDefaultClick(Sender: TObject);
    procedure ScreenshotLayoutsButtonRestoreTitleClick(Sender: TObject);
    procedure PanelEnabledScr2Click(Sender: TObject);
    procedure PanelEnabledScr3Click(Sender: TObject);
    procedure IconLayScr1Click(Sender: TObject);
    procedure IconLayScr2Click(Sender: TObject);
    procedure IconLayScr3Click(Sender: TObject);
  private
    { Private declarations }
    SelectedItem: TEasyItem;
    LayoutInfo: packed array[0..8] of TLayoutInfo;

    procedure LoadLayouts;
    procedure UpdateLayouts;
    procedure LoadLayoutImage(Index: ShortInt);
    procedure PopulateLayoutsList;
    procedure LoadLayoutIcon(LayoutImgHolder: TImage32; ImgCategory: ShortInt);
  public
    { Public declarations }
  end;

var
  FormScreenshotsLayout: TFormScreenshotsLayout;

implementation

uses uMain, uCommon;

{$R *.dfm}

procedure TFormScreenshotsLayout.LoadLayouts;
var
  layoutIni: TMemIniFile;
  SectionStr: String;
  Item: TEasyItem;

  function FixInvalidImageCategory(nIndex: ShortInt): ShortInt;
  begin
    if nIndex <> -1 then
       Result:= nIndex
    else
       Result:= 1;
  end;
begin
  Item:= LayoutListView.Groups.FirstItem;
  if Item = nil then
     Exit;

  layoutIni:= TMemIniFile.Create(FormMain.GetIniFilesFolder+'screenshot_layouts.ini');
  LayoutListView.BeginUpdate;
  repeat
    SectionStr:= GetScrLayoutSection(Item.ImageIndex);
    LayoutInfo[Item.ImageIndex].lImage1_imgCategory:= FixInvalidImageCategory(layoutIni.ReadInteger(SectionStr, 'image1_category', GetScrLayoutDefaultType(Item.ImageIndex, 1)));
    if Item.ImageIndex > 0 then
       LayoutInfo[Item.ImageIndex].lImage2_imgCategory:= FixInvalidImageCategory(layoutIni.ReadInteger(SectionStr, 'image2_category', GetScrLayoutDefaultType(Item.ImageIndex, 2)));
    if Item.ImageIndex > 2 then
       begin
         LayoutInfo[Item.ImageIndex].lImage3_imgCategory:= FixInvalidImageCategory(layoutIni.ReadInteger(SectionStr, 'image3_category', GetScrLayoutDefaultType(Item.ImageIndex, 3)));
         LayoutInfo[Item.ImageIndex].lImage3_Enabled:= Boolean(layoutIni.ReadInteger(SectionStr, 'image3_enabled', 1));
       end;
    if Item.ImageIndex > 0 then
       LayoutInfo[Item.ImageIndex].lImage2_Enabled:= Boolean(layoutIni.ReadInteger(SectionStr, 'image2_enabled', 1));
    Item:= LayoutListView.Groups.NextItem(Item);
  until Item = nil;
  LayoutListView.EndUpdate;
  FreeAndNil(layoutIni);
end;

procedure TFormScreenshotsLayout.UpdateLayouts;
var
  layoutIni: TMemIniFile;
  Item: TEasyItem;
  SectionStr: String;
begin
  if FormScreenshotsLayout.Tag = 0 then
     Exit;
  Item:= LayoutListView.Groups.FirstItem;
  if Item = nil then
     Exit;
  FormMain.PopupScreenshotLayouts.BeginUpdate;
  layoutIni:= TMemIniFile.Create(FormMain.GetIniFilesFolder+'screenshot_layouts.ini');
  repeat
    if not SameText(FormMain.PopupScreenshotLayouts.Items[Item.ImageIndex].Caption, Item.Caption) then
       FormMain.PopupScreenshotLayouts.Items[Item.ImageIndex].Caption:= Item.Caption;
    if Item.ImageIndex > 0 then
       FormMain.PopupScreenshotLayouts.Items[Item.ImageIndex].Visible:= Item.Checked;
    SectionStr:= GetScrLayoutSection(Item.ImageIndex);
    layoutIni.WriteInteger(SectionStr, 'image1_category', LayoutInfo[Item.ImageIndex].lImage1_imgCategory);
    if Item.ImageIndex > 0 then
       layoutIni.WriteInteger(SectionStr, 'image2_category', LayoutInfo[Item.ImageIndex].lImage2_imgCategory);
    if Item.ImageIndex > 2 then
       layoutIni.WriteInteger(SectionStr, 'image3_category', LayoutInfo[Item.ImageIndex].lImage3_imgCategory);
    if Item.ImageIndex > 0 then
       layoutIni.WriteInteger(SectionStr, 'image2_enabled', Ord(LayoutInfo[Item.ImageIndex].lImage2_Enabled));
    if Item.ImageIndex > 2 then
       layoutIni.WriteInteger(SectionStr, 'image3_enabled', Ord(LayoutInfo[Item.ImageIndex].lImage3_Enabled));
    Item:= LayoutListView.Groups.NextItem(Item);
  until Item = nil;
  layoutIni.UpdateFile;
  FreeAndNil(layoutIni);
  FormMain.PopupScreenshotLayouts.EndUpdate;
end;

procedure TFormScreenshotsLayout.LoadLayoutImage(Index: ShortInt);
var
  layFile: String;
begin
  layFile:= GetScrLayoutImageFile(Index);
  ImageScrLayout.Picture:= nil;
  if FileExists(FormMain.GetFolderFull(35)+'img_layouts\'+layFile) then
     ImageScrLayout.Picture.LoadFromFile(FormMain.GetFolderFull(35)+'img_layouts\'+layFile);
end;

procedure TFormScreenshotsLayout.PopulateLayoutsList;
var
  Loop: ShortInt;
begin
  FormMain.ClearListView(LayoutListView);
  LayoutListView.BeginUpdate;
  for Loop:=Low(LayoutInfo) to High(LayoutInfo) do
  begin
    LayoutInfo[Loop].lImage1_imgCategory:= GetScrLayoutDefaultType(Loop, 1);
    LayoutInfo[Loop].lImage2_imgCategory:= GetScrLayoutDefaultType(Loop, 2);
    LayoutInfo[Loop].lImage3_imgCategory:= GetScrLayoutDefaultType(Loop, 3);
    LayoutInfo[Loop].lImage2_Enabled:= Loop > 0;
    LayoutInfo[Loop].lImage3_Enabled:= Loop > 2;
    with LayoutListView.Items.Add do
    begin
      ImageIndex:= Loop;
      Caption:= FormMain.PopupScreenshotLayouts.Items[Loop].Caption;
      Checked:= FormMain.PopupScreenshotLayouts.Items[Loop].Visible;
    end;
  end;
  LayoutListView.EndUpdate;
end;

procedure TFormScreenshotsLayout.LoadLayoutIcon(LayoutImgHolder: TImage32; ImgCategory: ShortInt);
begin
  LayoutImgHolder.Bitmap.Lock;
  LayoutImgHolder.Bitmap:= nil;
  FormMain.LoadBarImage(LayoutImgHolder, 'msgbox_top.png');
  FormMain.IL_ImagesCategory_Large.Draw(LayoutImgHolder.Bitmap.Canvas, 1, 1, ImgCategory);
  LayoutImgHolder.Bitmap.UnLock;
end;

procedure TFormScreenshotsLayout.FormShow(Sender: TObject);
begin
  FormMain.LoadBarBottom(BottomBar);
  PopulateLayoutsList;
  LoadLayouts;
  FormMain.ELV_SelectItem(LayoutListView, 0);
  LayoutListView.SetFocus;
end;

procedure TFormScreenshotsLayout.ButtonOkClick(Sender: TObject);
begin
  FormScreenshotsLayout.Tag:= 1;
  Close;
end;

procedure TFormScreenshotsLayout.ButtonCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TFormScreenshotsLayout.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if CanClose and (not LayoutListView.EditManager.Editing) then
     UpdateLayouts;
end;

procedure TFormScreenshotsLayout.LayoutListViewItemCheckChange(
  Sender: TCustomEasyListview; Item: TEasyItem);
begin
  if Item.Index = 0 then
     begin
       if not Item.Checked then
          Item.Checked:= True;
     end;
end;

procedure TFormScreenshotsLayout.LayoutListViewItemEdited(
  Sender: TCustomEasyListview; Item: TEasyItem; var NewValue: Variant;
  var Accept: Boolean);
begin
  if not Item.Selected then
     Exit;
  if NewValue = '' then
     Accept:= False
  else
     begin
       if not SameText(Item.Caption, NewValue) then
          Item.Caption:= NewValue;
     end;
  // maybe update the caption in popup FormMain here ?
  //if not SameText(FormMain.PopupMenuImageCategories.Items[ImageCategory_Selector.Tag].Caption, NewValue) then
  //   FormMain.PopupMenuImageCategories.Items[ImageCategory_Selector.Tag].Caption:= NewValue;
end;

procedure TFormScreenshotsLayout.LayoutListViewItemEditEnd(
  Sender: TCustomEasyListview; Item: TEasyItem);
begin
  FormMain.ELV_SetEditManager(LayoutListView, False);
end;

procedure TFormScreenshotsLayout.LayoutListViewItemPaintText(
  Sender: TCustomEasyListview; Item: TEasyItem; Position: Integer;
  ACanvas: TCanvas);
begin
  FormMain.ELV_ItemPaintText_General(Sender, Item, ACanvas);
  if not Item.Checked then
     ACanvas.Font.Color:= clGray;
end;

procedure TFormScreenshotsLayout.LayoutListViewItemSelectionChanged(
  Sender: TCustomEasyListview; Item: TEasyItem);
begin
  if not Item.Selected then
     Exit;
  if SelectedItem <> Item then
     SelectedItem:= Item;

  LoadLayoutImage(SelectedItem.ImageIndex);
  LoadLayoutIcon(IconLayScr1, LayoutInfo[SelectedItem.ImageIndex].lImage1_imgCategory);
  LabelLayScr1.Caption:= FormMain.PopupMenuImageCategories.Items[LayoutInfo[SelectedItem.ImageIndex].lImage1_imgCategory].Caption;

  PanelEnabledScr2.Visible:= SelectedItem.ImageIndex > 0;
  PanelEnabledScr3.Visible:= SelectedItem.ImageIndex > 2;

  case PanelEnabledScr2.Visible of
    True:
      begin
        LoadLayoutIcon(IconLayScr2, LayoutInfo[SelectedItem.ImageIndex].lImage2_imgCategory);
        LabelLayScr2.Caption:= FormMain.PopupMenuImageCategories.Items[LayoutInfo[SelectedItem.ImageIndex].lImage2_imgCategory].Caption;
        PanelEnabledScr2.Checked:= LayoutInfo[SelectedItem.ImageIndex].lImage2_Enabled;
        if PanelEnabledScr2.Checked and (not IconLayScr2.Visible) then
           IconLayScr2.Visible:= True;
      end;
    False: IconLayScr2.Visible:= False;
  end;

  case PanelEnabledScr3.Visible of
    True:
      begin
        LoadLayoutIcon(IconLayScr3, LayoutInfo[SelectedItem.ImageIndex].lImage3_imgCategory);
        LabelLayScr3.Caption:= FormMain.PopupMenuImageCategories.Items[LayoutInfo[SelectedItem.ImageIndex].lImage3_imgCategory].Caption;
        PanelEnabledScr3.Checked:= LayoutInfo[SelectedItem.ImageIndex].lImage3_Enabled;
        if PanelEnabledScr3.Checked and (not IconLayScr3.Visible) then
           IconLayScr3.Visible:= True;
      end;
    False: IconLayScr3.Visible:= False;
  end;
end;

procedure TFormScreenshotsLayout.LayoutListViewKeyAction(
  Sender: TCustomEasyListview; var CharCode: Word; var Shift: TShiftState;
  var DoDefault: Boolean);
begin
  if CharCode = VK_F2 then
     ScreenshotLayoutsButtonEditTitle.Click;
end;

procedure TFormScreenshotsLayout.ScreenshotLayoutsButtonEditTitleClick(
  Sender: TObject);
begin
  FormMain.ELV_EnableEdit(LayoutListView);
end;

procedure TFormScreenshotsLayout.ScreenshotLayoutsDefaultClick(
  Sender: TObject);
var
  Item: TEasyItem;
begin
  LayoutListView.BeginUpdate;
  Item:= LayoutListView.Groups.FirstItem;
  repeat
    if Item.ImageIndex > 0 then
       Item.Checked:= True;
    Item.Caption:= GetScrLayoutSection(Item.ImageIndex);
    Item:= LayoutListView.Groups.NextItem(Item);
  until Item = nil;
  LayoutListView.EndUpdate;
  LayoutListView.SetFocus;
end;

procedure TFormScreenshotsLayout.ScreenshotLayoutsButtonRestoreTitleClick(
  Sender: TObject);
begin
  if FormMain.CheckSelected(nil, LayoutListView) then
     LayoutListView.Selection.First.Caption:= GetScrLayoutSection(LayoutListView.Selection.First.ImageIndex);
  LayoutListView.SetFocus;
end;

procedure TFormScreenshotsLayout.PanelEnabledScr2Click(Sender: TObject);
begin
  if not FormMain.CheckSelected(nil, LayoutListView) then
     Exit;
  IconLayScr2.Visible:= PanelEnabledScr2.Checked;
  if SelectedItem.ImageIndex > 0 then
     LayoutInfo[SelectedItem.ImageIndex].lImage2_Enabled:= PanelEnabledScr2.Checked;
  LayoutListView.SetFocus;  
end;

procedure TFormScreenshotsLayout.PanelEnabledScr3Click(Sender: TObject);
begin
  if not FormMain.CheckSelected(nil, LayoutListView) then
     Exit;
  IconLayScr3.Visible:= PanelEnabledScr3.Checked;
  if SelectedItem.ImageIndex > 2 then
     LayoutInfo[SelectedItem.ImageIndex].lImage3_Enabled:= PanelEnabledScr3.Checked;
  LayoutListView.SetFocus;
end;

procedure TFormScreenshotsLayout.IconLayScr1Click(Sender: TObject);
var
  NewCat: ShortInt;
begin
  if not FormMain.CheckSelected(nil, LayoutListView) then
     Exit;
  NewCat:= FormMain.CallSelectImageCategory(False, LayoutInfo[SelectedItem.ImageIndex].lImage1_imgCategory);
  if NewCat = -1 then
     Exit;
  LayoutInfo[SelectedItem.ImageIndex].lImage1_imgCategory:= NewCat;
  LoadLayoutIcon(IconLayScr1, NewCat);
  LabelLayScr1.Caption:= FormMain.PopupMenuImageCategories.Items[NewCat].Caption;
  LayoutListView.SetFocus;
end;

procedure TFormScreenshotsLayout.IconLayScr2Click(Sender: TObject);
var
  NewCat: ShortInt;
begin
  if not FormMain.CheckSelected(nil, LayoutListView) then
     Exit;
  NewCat:= FormMain.CallSelectImageCategory(False, LayoutInfo[SelectedItem.ImageIndex].lImage2_imgCategory);
  if NewCat = -1 then
     Exit;
  LayoutInfo[SelectedItem.ImageIndex].lImage2_imgCategory:= NewCat;
  LoadLayoutIcon(IconLayScr2, NewCat);
  LabelLayScr2.Caption:= FormMain.PopupMenuImageCategories.Items[NewCat].Caption;
  LayoutListView.SetFocus;
end;

procedure TFormScreenshotsLayout.IconLayScr3Click(Sender: TObject);
var
  NewCat: ShortInt;
begin
  if not FormMain.CheckSelected(nil, LayoutListView) then
     Exit;
  NewCat:= FormMain.CallSelectImageCategory(False, LayoutInfo[SelectedItem.ImageIndex].lImage3_imgCategory);
  if NewCat = -1 then
     Exit;
  LayoutInfo[SelectedItem.ImageIndex].lImage3_imgCategory:= NewCat;
  LoadLayoutIcon(IconLayScr3, NewCat);
  LabelLayScr3.Caption:= FormMain.PopupMenuImageCategories.Items[NewCat].Caption;
  LayoutListView.SetFocus;
end;

end.


