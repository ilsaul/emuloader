unit uImageLayoutSettings;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  StdCtrls, ComCtrls, ExtCtrls, IniFiles, Buttons,
  MPCommonObjects, EasyListview, uCommon, ImgList,
  PanelEx, AdvOfficeButtons, ShadowLabel, GR32_Image, GraphicEx;

// March 08, 2016
// NOTE: it's ONE color for each category; this color is used for ALL systems; eg.: in-game snaps color is the same for ALL systems

type
  TLayoutInfo = record
    lImage1_imgCategory,
    lImage2_imgCategory,
    lImage3_imgCategory: ShortInt;
    lImage2_Enabled,
    lImage3_Enabled: Boolean;
  end;

type
  TFormImageLayoutSettings = class(TForm)
    IL_Layouts: TImageList;
    IL_ImageCategory: TImageList;
    PanelBottomButtons: TPanelEx;
    ButtonHelp: TBitBtn;
    ButtonClose: TBitBtn;
    IL_ImageCategory_ExtraLarge: TImageList;
    ButtonAbort: TBitBtn;
    FrameIconLayScr2: TShape;
    FrameIconLayScr3: TShape;
    FrameIconLayScr1: TShape;
    LabelPanel1: TShadowLabel;
    LabelLayScr3: TShadowLabel;
    LabelLayScr2: TShadowLabel;
    IconLayScr1: TImage;
    IconLayScr2: TImage;
    IconLayScr3: TImage;
    LabelLayoutSetCategories: TShadowLabel;
    LabelLayScr1: TShadowLabel;
    ImageScrLayoutFrame: TBevel;
    PanelEnabledScr2: TAdvOfficeCheckBox;
    PanelEnabledScr3: TAdvOfficeCheckBox;
    ButtonLayoutResetPanelsIndex: TBitBtn;
    PanelLayoutsSelector: TPanelEx;
    LayoutListView: TEasyListview;
    PanelLayoutTitle: TPanelEx;
    LabelLayoutTitle: TShadowLabel;
    PanelEnabledScr1_AlwaysEnabled: TAdvOfficeCheckBox;
    ButtonLayoutToggleVisibility: TBitBtn;
    ImageScrLayout: TImage32;
    Label1: TLabel;
    ComboBox1: TComboBox;
    BitBtn1: TBitBtn;
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure LayoutListViewItemCheckChange(
      Sender: TCustomEasyListview; Item: TEasyItem);
    procedure LayoutListViewItemPaintText(
      Sender: TCustomEasyListview; Item: TEasyItem; Position: Integer;
      ACanvas: TCanvas);
    procedure LayoutListViewItemSelectionChanged(
      Sender: TCustomEasyListview; Item: TEasyItem);
    procedure PanelEnabledScr2Click(Sender: TObject);
    procedure PanelEnabledScr3Click(Sender: TObject);
    procedure IconLayScr1Click(Sender: TObject);
    procedure IconLayScr2Click(Sender: TObject);
    procedure IconLayScr3Click(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormActivate(Sender: TObject);
    procedure ButtonLayoutToggleVisibilityClick(Sender: TObject);
    procedure ButtonLayoutResetPanelsIndexClick(Sender: TObject);
    procedure ButtonHelpClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure LabelShowHideCategoriesMouseLeave(Sender: TObject);
    procedure LabelShowHideCategoriesMouseEnter(Sender: TObject);
  private
    { Private declarations }
    LayoutSelectedItem: TEasyItem;
    LayoutInfo: packed array[0..8] of TLayoutInfo;

    procedure LoadLayoutIcons;
    procedure SelectCategoryClick(var CategoryHolder: ShortInt; IconLayoutHolder: TImage; LabelLayout: TShadowLabel);

    procedure LoadLayouts;
    procedure UpdateLayouts;
    procedure LoadLayoutImage(Index: ShortInt);
    procedure PopulateLayoutsList;
    procedure LoadLayoutIcon(LayoutImgHolder: TImage; ImgCategory: ShortInt);
  public
    { Public declarations }
  end;

var
  FormImageLayoutSettings: TFormImageLayoutSettings;

implementation

uses uMain;

{$R *.dfm}

procedure TFormImageLayoutSettings.LoadLayoutIcons;
var
  Loop: Byte;
  tmpFolder: String;
begin
  tmpFolder:= FormMain.GetFolderFull(32);
  for Loop:=0 to 8 do
      FormMain.AddDefaultIcons(GetScrLayoutImageFile(Loop, False), tmpFolder, IL_Layouts);
end;

procedure TFormImageLayoutSettings.LoadLayouts;
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

procedure TFormImageLayoutSettings.UpdateLayouts;
var
  layoutIni: TMemIniFile;
  Item: TEasyItem;
  SectionStr: String;
begin
  Item:= LayoutListView.Groups.FirstItem;
  if Item = nil then
     Exit;
  FormMain.PopupScreenshotLayouts.BeginUpdate;
  layoutIni:= TMemIniFile.Create(FormMain.GetIniFilesFolder+'screenshot_layouts.ini');
  repeat
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

procedure TFormImageLayoutSettings.LoadLayoutImage(Index: ShortInt);
var
  layFile: String;
begin
  layFile:= GetScrLayoutImageFile(Index);
  ImageScrLayout.Bitmap:= nil;
  if FileExists(FormMain.GetFolderFull(35)+'img_layouts\'+layFile) then
     ImageScrLayout.Bitmap.LoadFromFile(FormMain.GetFolderFull(35)+'img_layouts\'+layFile);
end;

procedure TFormImageLayoutSettings.PopulateLayoutsList;
var
  PosIndex: ShortInt;
  Loop: Byte;
  StrTitle: String;
begin
  LayoutListView.BeginUpdate;
  LayoutListView.Items.ReIndexDisable:= True;
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
      StrTitle:= GetScrLayoutSection(Loop);
      PosIndex:= PosEx(' ', StrTitle);
      if PosIndex <> 0 then
         StrTitle:= Trim(Copy(StrTitle, 1, PosIndex))+#13#10+Trim(Copy(StrTitle, PosIndex, Length(StrTitle)));
      Caption:= StringReplace(StrTitle, '[Layout ', '[lay ', [rfReplaceAll]);//StrTitle;
      Checked:= FormMain.PopupScreenshotLayouts.Items[Loop].Visible;
      if not Checked then
         State:= State+[esosGhosted];
    end;
  end;
  LayoutListView.Items.ReIndexDisable:= False;
  LayoutListView.EndUpdate;
end;

procedure TFormImageLayoutSettings.LoadLayoutIcon(LayoutImgHolder: TImage; ImgCategory: ShortInt);
begin
  FormMain.LoadImageCategoryThumbIcon(LayoutImgHolder, ImgCategory);
  //LayoutImgHolder.Picture.Icon:= nil;
  //IL_ImageCategory.GetIcon(ImgCategory, LayoutImgHolder.Picture.Icon);
end;

//procedure TFormCategoryLayoutSettings.LoadLayoutIcon(LayoutImgHolder: TImage; ImgCategory: ShortInt);
//begin
//  LayoutImgHolder.Picture.Icon:= nil;
//  IL_ImageCategory.GetIcon(ImgCategory, LayoutImgHolder.Picture.Icon);
//end;

procedure TFormImageLayoutSettings.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if not CanClose then
     Exit;
  if ModalResult = mrCancel then
     Exit;

  // need to update
  // FormMain.PopupMenuImageCategories.Items[img_catID].Tag ////// ImageCategory_Selector.Selection.First.ImageIndex].Tag
  // with "ImageCategory_Selector.Items.First.Tag" tags of each category in the EasyListView category list
  //FormMain.PopupMenuImageCategories.Items[ImageCategory_Selector.Selection.First.ImageIndex].Tag:= ImageCategoryBackgroundColor.Selected;

  // need to update FormMain.imgFolder[sysID, img_catID]; with the new TempImgFolder[sysID, img_catID];

  UpdateLayouts; // update .ini settings only (do not apply setting at main screen)
  // no need to update hints if layouts is enabled, I think... see uMain.SetImageLayout;
end;

procedure TFormImageLayoutSettings.LayoutListViewItemCheckChange(
  Sender: TCustomEasyListview; Item: TEasyItem);
begin
  if Item.Index = 0 then
     begin
       if not Item.Checked then
          Item.Checked:= True;
       Exit;
     end;
  case Item.Checked of
    True : Item.State:= Item.State-[esosGhosted];
    False: Item.State:= Item.State+[esosGhosted];
  end;
  if Item.Selected then
     begin
       //FormMain.ELV_SetSelectRibbon(Ord(Item.Ghosted), LayoutListView);
       Item.Invalidate(True);
     end;
end;

procedure TFormImageLayoutSettings.LayoutListViewItemPaintText(
  Sender: TCustomEasyListview; Item: TEasyItem; Position: Integer;
  ACanvas: TCanvas);
begin
  if Item.Ghosted then
     ACanvas.Font.Color:= clGray;
end;

procedure TFormImageLayoutSettings.LayoutListViewItemSelectionChanged(
  Sender: TCustomEasyListview; Item: TEasyItem);
begin
  if not Item.Selected then
     Exit;
  if LayoutSelectedItem <> Item then
     LayoutSelectedItem:= Item;

  LabelLayoutTitle.Caption:= UpperCase(FormMain.PopupScreenshotLayouts.Items[Item.ImageIndex].Caption);
  IconLayScr1.Picture.Icon:= nil;
  IconLayScr2.Picture.Icon:= nil;
  IconLayScr3.Picture.Icon:= nil;
  //FormMain.ELV_SetSelectRibbon(Ord(Item.Ghosted), LayoutListView);
  LoadLayoutImage(LayoutSelectedItem.ImageIndex);
  LoadLayoutIcon(IconLayScr1, LayoutInfo[LayoutSelectedItem.ImageIndex].lImage1_imgCategory);
  LabelLayScr1.Caption:= FormMain.PopupMenuImageCategories.Items[LayoutInfo[LayoutSelectedItem.ImageIndex].lImage1_imgCategory].Caption;

  PanelEnabledScr2.Visible:= LayoutSelectedItem.ImageIndex > 0;
  PanelEnabledScr3.Visible:= LayoutSelectedItem.ImageIndex > 2;

  FrameIconLayScr2.Visible:= PanelEnabledScr2.Visible;
  FrameIconLayScr3.Visible:= PanelEnabledScr3.Visible;

  case PanelEnabledScr2.Visible of
    True:
      begin
        PanelEnabledScr2.Checked:= LayoutInfo[LayoutSelectedItem.ImageIndex].lImage2_Enabled;
        LoadLayoutIcon(IconLayScr2, LayoutInfo[LayoutSelectedItem.ImageIndex].lImage2_imgCategory); // new
        LabelLayScr2.Caption:= FormMain.PopupMenuImageCategories.Items[LayoutInfo[LayoutSelectedItem.ImageIndex].lImage2_imgCategory].Caption; // new

        if PanelEnabledScr2.Checked then
           begin
             PanelEnabledScr2.Checked:= LayoutInfo[LayoutSelectedItem.ImageIndex].lImage2_Enabled;
             if PanelEnabledScr2.Checked and (not IconLayScr2.Visible) then
                begin
                  IconLayScr2.Visible:= True;
                  LabelLayScr2.Visible:= True;
                end;
           end
        else
           begin
             IconLayScr2.Visible:= False;
             LabelLayScr2.Visible:= False;
           end;
      end;
    False:
      begin
        IconLayScr2.Visible:= False;
        LabelLayScr2.Visible:= False;
      end;
  end;

  case PanelEnabledScr3.Visible of
    True:
      begin
        PanelEnabledScr3.Checked:= LayoutInfo[LayoutSelectedItem.ImageIndex].lImage3_Enabled;
        LoadLayoutIcon(IconLayScr3, LayoutInfo[LayoutSelectedItem.ImageIndex].lImage3_imgCategory); // new
        LabelLayScr3.Caption:= FormMain.PopupMenuImageCategories.Items[LayoutInfo[LayoutSelectedItem.ImageIndex].lImage3_imgCategory].Caption; // new
        if PanelEnabledScr3.Checked then
           begin
             if PanelEnabledScr3.Checked and (not IconLayScr3.Visible) then
                begin
                  IconLayScr3.Visible:= True;
                  LabelLayScr3.Visible:= True;
                end;
           end
        else
           begin
             IconLayScr3.Visible:= False;
             LabelLayScr3.Visible:= False;
           end;
      end;
    False:
      begin
        IconLayScr3.Visible:= False;
        LabelLayScr3.Visible:= False;
      end;
  end;
end;

procedure TFormImageLayoutSettings.PanelEnabledScr2Click(Sender: TObject);
begin
  if not FormMain.CheckSelected(LayoutListView) then
     Exit;
  IconLayScr2.Visible:= PanelEnabledScr2.Checked;
  LabelLayScr2.Visible:= PanelEnabledScr2.Checked;
  if LayoutSelectedItem.ImageIndex > 0 then
     LayoutInfo[LayoutSelectedItem.ImageIndex].lImage2_Enabled:= PanelEnabledScr2.Checked;
  LayoutListView.SetFocus;
end;

procedure TFormImageLayoutSettings.PanelEnabledScr3Click(Sender: TObject);
begin
  if not FormMain.CheckSelected(LayoutListView) then
     Exit;
  IconLayScr3.Visible:= PanelEnabledScr3.Checked;
  LabelLayScr3.Visible:= PanelEnabledScr3.Checked;
  if LayoutSelectedItem.ImageIndex > 2 then
     LayoutInfo[LayoutSelectedItem.ImageIndex].lImage3_Enabled:= PanelEnabledScr3.Checked;
  LayoutListView.SetFocus;
end;

procedure TFormImageLayoutSettings.SelectCategoryClick(var CategoryHolder: ShortInt; IconLayoutHolder: TImage; LabelLayout: TShadowLabel);
var
  NewCat: ShortInt;
begin
  if not FormMain.CheckSelected(LayoutListView) then
     Exit;
  NewCat:= FormMain.CallSelectImageCategory(CategoryHolder);
  if NewCat = -1 then
     Exit;
  CategoryHolder:= NewCat;
  LoadLayoutIcon(IconLayoutHolder, NewCat);
  LabelLayout.Caption:= FormMain.PopupMenuImageCategories.Items[NewCat].Caption;
  LayoutListView.SetFocus;
end;

procedure TFormImageLayoutSettings.IconLayScr1Click(Sender: TObject);
begin
  SelectCategoryClick(LayoutInfo[LayoutSelectedItem.ImageIndex].lImage1_imgCategory, IconLayScr1, LabelLayScr1);
end;

procedure TFormImageLayoutSettings.IconLayScr2Click(Sender: TObject);
begin
  SelectCategoryClick(LayoutInfo[LayoutSelectedItem.ImageIndex].lImage2_imgCategory, IconLayScr2, LabelLayScr2);
end;

procedure TFormImageLayoutSettings.IconLayScr3Click(Sender: TObject);
begin
  SelectCategoryClick(LayoutInfo[LayoutSelectedItem.ImageIndex].lImage3_imgCategory, IconLayScr3, LabelLayScr3);
end;

procedure TFormImageLayoutSettings.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #27 then
     ButtonAbort.Click;
end;

procedure TFormImageLayoutSettings.FormActivate(Sender: TObject);
begin
  if Tag = 1 then
     Exit;

  PopulateLayoutsList;
  LoadLayouts;
  FormMain.ELV_SelectItem(LayoutListView, FormMain.ButtonScreenshotLayouts.Tag);
  LayoutListView.SetFocus;
  Tag:= 1;
  Screen.Cursor:= crDefault;
end;

procedure TFormImageLayoutSettings.ButtonLayoutToggleVisibilityClick(
  Sender: TObject);
var
  Item: TEasyItem;
begin
  LayoutListView.BeginUpdate;
  Item:= LayoutListView.Groups.FirstItem;
  repeat
    if Item.ImageIndex > 0 then
       Item.Checked:= Boolean(TBitBtn(Sender).Tag);
    Item:= LayoutListView.Groups.NextItem(Item);
  until Item = nil;
  LayoutListView.EndUpdate;
  TBitBtn(Sender).Tag:= Ord(not Boolean(TBitBtn(Sender).Tag));
  case TBitBtn(Sender).Tag of
    0: TBitBtn(Sender).Caption:= 'Hide All'+#13#10+'Layouts';
    1: TBitBtn(Sender).Caption:= 'Show All'+#13#10+'Layouts';
  end;
  LayoutListView.SetFocus;
end;

procedure TFormImageLayoutSettings.ButtonLayoutResetPanelsIndexClick(
  Sender: TObject);

  procedure SetPanelCategory(PanelIndex: ShortInt; IconHolder: TImage; CategoryLabel: TShadowLabel);
  var
    NewCat: ShortInt;
  begin
    NewCat:= GetScrLayoutDefaultType(LayoutSelectedItem.ImageIndex, PanelIndex);
    case PanelIndex of
      1: LayoutInfo[LayoutSelectedItem.ImageIndex].lImage1_imgCategory:= NewCat;
      2: LayoutInfo[LayoutSelectedItem.ImageIndex].lImage2_imgCategory:= NewCat;
      3: LayoutInfo[LayoutSelectedItem.ImageIndex].lImage3_imgCategory:= NewCat;
    end;
    LoadLayoutIcon(IconHolder, NewCat);
    CategoryLabel.Caption:= FormMain.PopupMenuImageCategories.Items[NewCat].Caption;
  end;
  
begin
  if not FormMain.CheckSelected(LayoutListView) then
     Exit;

  SetPanelCategory(1, IconLayScr1, LabelLayScr1);
  if LayoutSelectedItem.ImageIndex > 0 then
     SetPanelCategory(2, IconLayScr2, LabelLayScr2);
  if LayoutSelectedItem.ImageIndex > 2 then
     SetPanelCategory(3, IconLayScr3, LabelLayScr3);

  LayoutListView.SetFocus;
end;

procedure TFormImageLayoutSettings.ButtonHelpClick(Sender: TObject);
begin
  CallMessageBox;
  FormMain.AddMsgText('    Customize image categories for each layout'+#13#10+#13#10+
                      '1. Select a layout to setup.'+#13#10+
                      '2. On ');
  FormMain.AddMsgText('set categories for each layout', $00a65300, [fsBold]);
  FormMain.AddMsgText(' click on the panel icons to select an image category.'+#13#10+
                      '3. Uncheck ');
  FormMain.AddMsgText('Panel #', $00a65300, [fsBold]);
  FormMain.AddMsgText(' checkboxes to hide panels.'+#13#10+
                      '4. Repeat the process from step ');
  FormMain.AddMsgText('#1', clBlack, [fsBold]);
  FormMain.AddMsgText(' for other layouts.'+#13#10+
                      '5. To hide a layout, clear the checkbox in the layouts list.'+#13#10+#13#10+
                      '    When you''re done, click ');
  FormMain.AddMsgText('Apply', $00a65300, [fsBold]);
  FormMain.AddMsgText(' button to save and apply changes or click ');
  FormMain.AddMsgText('Abort', $00a65300, [fsBold]);
  FormMain.AddMsgText(' button to cancel any changes you''ve made.');
  GenerateMessage('Help', 'How to setup image layouts.', '', 2);
end;

procedure TFormImageLayoutSettings.FormShow(Sender: TObject);
var
  iDiff: Integer;
begin
  FormMain.ELV_ResetNormalColors(LayoutListView);

  FormMain.LoadCategoriesIcons(IL_ImageCategory, True);
  FormMain.LoadCategoriesIcons(IL_ImageCategory_ExtraLarge, True);
  LoadLayoutIcons;
end;

procedure TFormImageLayoutSettings.LabelShowHideCategoriesMouseEnter(
  Sender: TObject);
begin
  TShadowLabel(Sender).Font.Color:= clBlue;
  //TShadowLabel(Sender).Font.Style:= [fsUnderline];
end;

procedure TFormImageLayoutSettings.LabelShowHideCategoriesMouseLeave(
  Sender: TObject);
begin
  TShadowLabel(Sender).Font.Color:= $00a65300;
  //TShadowLabel(Sender).Font.Style:= [];
end;


end.


