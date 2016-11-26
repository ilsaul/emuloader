unit uCategoriesLayoutsSettings;

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
  TFormCategoryLayoutSettings = class(TForm)
    IL_Layouts: TImageList;
    PanelCategories: TPanelEx;
    IL_ImageCategory: TImageList;
    PanelLayouts: TPanelEx;
    ImageScrLayout: TImage32;
    LabelPanel1: TShadowLabel;
    LabelLayScr1: TShadowLabel;
    LabelLayScr3: TShadowLabel;
    LabelLayScr2: TShadowLabel;
    PanelEnabledScr2: TAdvOfficeCheckBox;
    PanelEnabledScr3: TAdvOfficeCheckBox;
    IconLayScr1: TImage;
    IconLayScr2: TImage;
    IconLayScr3: TImage;
    ButtonLayoutResetPanelsIndex: TBitBtn;
    ImageScrLayoutFrame: TBevel;
    PanelLayoutsSelector: TPanelEx;
    LayoutListView: TEasyListview;
    PanelEmulatorsSelector: TPanelEx;
    LabelEmuTitle: TShadowLabel;
    ImageCategorySystem_Selector: TEasyListview;
    LabelLayoutSetCategories: TShadowLabel;
    PanelImageCategorySelector: TPanelEx;
    ImageCategory_Selector: TEasyListview;
    LabelImageCategoryFolder: TShadowLabel;
    ImageCategoryFolder: TEdit;
    ButtonImageCategoryFolder: TBitBtn;
    LabelImageBackgroundColor: TShadowLabel;
    ImageCategoryBackgroundColor: TColorBox;
    ButtonImageCategoryBackgroundColor: TBitBtn;
    PanelBottomButtons: TPanelEx;
    ButtonCategories: TSpeedButton;
    ButtonLayouts: TSpeedButton;
    Bevel1: TBevel;
    ButtonHelp: TBitBtn;
    ButtonClose: TBitBtn;
    PanelEnabledScr1_AlwaysEnabled: TAdvOfficeCheckBox;
    FrameIconLayScr1: TShape;
    FrameIconLayScr2: TShape;
    FrameIconLayScr3: TShape;
    IL_ImageCategory_ExtraLarge: TImageList;
    ButtonLayoutToggleVisibility: TBitBtn;
    PanelLayoutTitle: TPanelEx;
    LabelLayoutTitle: TShadowLabel;
    PanelCategoryTitle: TPanelEx;
    LabelCategoryTitle: TShadowLabel;
    ButtonAbort: TBitBtn;
    PanelShowHideCategories: TPanelEx;
    LabelShowHideCategories: TShadowLabel;
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
    procedure ImageCategorySystem_SelectorItemSelectionChanged(
      Sender: TCustomEasyListview; Item: TEasyItem);
    procedure ImageCategory_SelectorItemCheckChange(
      Sender: TCustomEasyListview; Item: TEasyItem);
    procedure ImageCategory_SelectorItemPaintText(
      Sender: TCustomEasyListview; Item: TEasyItem; Position: Integer;
      ACanvas: TCanvas);
    procedure ImageCategory_SelectorItemSelectionChanged(
      Sender: TCustomEasyListview; Item: TEasyItem);
    procedure ImageCategoryBackgroundColorSelect(Sender: TObject);
    procedure ImageCategoryFolderChange(Sender: TObject);
    procedure ButtonImageCategoryFolderClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormActivate(Sender: TObject);
    procedure ButtonLayoutToggleVisibilityClick(Sender: TObject);
    procedure ButtonLayoutResetPanelsIndexClick(Sender: TObject);
    procedure ButtonHelpClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ButtonImageCategoryBackgroundColorClick(Sender: TObject);
    procedure ButtonCategoriesClick(Sender: TObject);
    procedure LabelShowHideCategoriesClick(Sender: TObject);
    procedure LabelShowHideCategoriesMouseLeave(Sender: TObject);
    procedure LabelShowHideCategoriesMouseEnter(Sender: TObject);
  private
    { Private declarations }
    LayoutSelectedItem: TEasyItem;
    LayoutInfo: packed array[0..8] of TLayoutInfo;

    TempImgFolder: packed array[1..MaxArcadeSystems] of packed array[0..High(ImageCategoryArray)-1] of String;

    procedure LoadLayoutIcons;
    procedure ELV_SetFocus;
    procedure UpdateSnapDir_MAME;
    procedure PopulateCatFolderVarsRAM;
    procedure SelectCategoryClick(var CategoryHolder: ShortInt; IconLayoutHolder: TImage; LabelLayout: TShadowLabel);

    procedure SetImageCategoryValues;
    procedure UpdateImageCategories;
    procedure LoadLayouts;
    procedure UpdateLayouts;
    procedure LoadLayoutImage(Index: ShortInt);
    procedure PopulateLayoutsList;
    procedure LoadLayoutIcon(LayoutImgHolder: TImage; ImgCategory: ShortInt);
  public
    { Public declarations }
  end;

var
  FormCategoryLayoutSettings: TFormCategoryLayoutSettings;

implementation

uses uMain;

{$R *.dfm}

procedure TFormCategoryLayoutSettings.LoadLayoutIcons;
var
  Loop: Byte;
  tmpFolder: String;
begin
  tmpFolder:= FormMain.GetFolderFull(32);
  for Loop:=0 to 8 do
      FormMain.AddDefaultIcons(GetScrLayoutImageFile(Loop, False), tmpFolder, IL_Layouts);
end;

procedure TFormCategoryLayoutSettings.ELV_SetFocus;
begin
  if PanelCategories.Visible then
     ImageCategory_Selector.SetFocus
  else
  if PanelLayouts.Visible then
     LayoutListView.SetFocus;
end;

procedure TFormCategoryLayoutSettings.UpdateSnapDir_MAME;
begin
  FormMain.UpdateMAMEsnapDir(FormMain.imgFolder[idMAME, 1], idMAME);
  FormMain.UpdateMAMEsnapDir(FormMain.imgFolder[idHBMAME, 1], idHBMAME);
end;

procedure TFormCategoryLayoutSettings.PopulateCatFolderVarsRAM;
var
  LoopSys, LoopCategory: Integer;
begin
  for LoopSys:= 1 to MaxArcadeSystems do
  begin
    for LoopCategory:= 0 to High(ImageCategoryArray)-1 do
        TempImgFolder[LoopSys, LoopCategory]:= FormMain.imgFolder[LoopSys, LoopCategory];
  end;
end;

procedure TFormCategoryLayoutSettings.SetImageCategoryValues;
begin
  if not FormMain.CheckSelected(ImageCategory_Selector) then
     Exit;
  if ImageCategory_Selector.Tag < High(ImageCategoryArray) then
     begin
       ImageCategoryBackgroundColor.Selected:= ImageCategory_Selector.Selection.First.Tag;
       //ImageCategoryFolder.Text:= FormMain.imgFolder[ImageCategorySystem_Selector.Tag, ImageCategory_Selector.Tag]; // not used here anymore!!! March 14, 2016
       ImageCategoryFolder.Text:= TempImgFolder[ImageCategorySystem_Selector.Tag, ImageCategory_Selector.Tag];
     end;
end;

procedure TFormCategoryLayoutSettings.UpdateImageCategories;
var
  LoopSys, LoopCategory: Integer;
  Item: TEasyItem;
begin
  for LoopSys:= 1 to MaxArcadeSystems do
  begin
    for LoopCategory:=0 to High(ImageCategoryArray)-1 do
    begin
      if FormMain.imgFolder[LoopSys, LoopCategory] <> TempImgFolder[LoopSys, LoopCategory] then
         FormMain.imgFolder[LoopSys, LoopCategory]:= TempImgFolder[LoopSys, LoopCategory];
    end;
  end;

  FormMain.PopupMenuImageCategories.BeginUpdate;
  Item:= ImageCategory_Selector.Groups.FirstItem;
  repeat
    if FormMain.PopupMenuImageCategories.Items[Item.ImageIndex].Tag <> Item.Tag then
       FormMain.PopupMenuImageCategories.Items[Item.ImageIndex].Tag:= Item.Tag;

    FormMain.PopupMenuImageCategories.Items[Item.ImageIndex].Visible:= Item.Checked; // show/hide categories in images buttons tool bar

    Item:= ImageCategory_Selector.Groups.NextItem(Item);
  until Item = nil;

  FormMain.PopupMenuImageCategories.EndUpdate;

  // update FormMain.imgFolder[] arrays from TempImgFolder[] arrays
  // update category background colors (from EasyListView to FormMain.PopupMenuImageCategories)
end;

procedure TFormCategoryLayoutSettings.LoadLayouts;
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

procedure TFormCategoryLayoutSettings.UpdateLayouts;
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

procedure TFormCategoryLayoutSettings.LoadLayoutImage(Index: ShortInt);
var
  layFile: String;
begin
  layFile:= GetScrLayoutImageFile(Index);
  ImageScrLayout.Bitmap:= nil;
  if FileExists(FormMain.GetFolderFull(35)+'img_layouts\'+layFile) then
     ImageScrLayout.Bitmap.LoadFromFile(FormMain.GetFolderFull(35)+'img_layouts\'+layFile);
end;

procedure TFormCategoryLayoutSettings.PopulateLayoutsList;
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

procedure TFormCategoryLayoutSettings.LoadLayoutIcon(LayoutImgHolder: TImage; ImgCategory: ShortInt);
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

procedure TFormCategoryLayoutSettings.FormCloseQuery(Sender: TObject;
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
  UpdateImageCategories;
  UpdateSnapDir_MAME; // only if user click "Apply" button
  FormMain.WriteImageCategories(True, False);
  UpdateLayouts; // update .ini settings only (do not apply setting at main screen)
  // no need to update hints if layouts is enabled, I think... see uMain.SetImageLayout;
end;

procedure TFormCategoryLayoutSettings.LayoutListViewItemCheckChange(
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

procedure TFormCategoryLayoutSettings.LayoutListViewItemPaintText(
  Sender: TCustomEasyListview; Item: TEasyItem; Position: Integer;
  ACanvas: TCanvas);
begin
  if Item.Ghosted then
     ACanvas.Font.Color:= clGray;
end;

procedure TFormCategoryLayoutSettings.LayoutListViewItemSelectionChanged(
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

procedure TFormCategoryLayoutSettings.PanelEnabledScr2Click(Sender: TObject);
begin
  if not FormMain.CheckSelected(LayoutListView) then
     Exit;
  IconLayScr2.Visible:= PanelEnabledScr2.Checked;
  LabelLayScr2.Visible:= PanelEnabledScr2.Checked;
  if LayoutSelectedItem.ImageIndex > 0 then
     LayoutInfo[LayoutSelectedItem.ImageIndex].lImage2_Enabled:= PanelEnabledScr2.Checked;
  ELV_SetFocus;
end;

procedure TFormCategoryLayoutSettings.PanelEnabledScr3Click(Sender: TObject);
begin
  if not FormMain.CheckSelected(LayoutListView) then
     Exit;
  IconLayScr3.Visible:= PanelEnabledScr3.Checked;
  LabelLayScr3.Visible:= PanelEnabledScr3.Checked;
  if LayoutSelectedItem.ImageIndex > 2 then
     LayoutInfo[LayoutSelectedItem.ImageIndex].lImage3_Enabled:= PanelEnabledScr3.Checked;
  ELV_SetFocus;
end;

procedure TFormCategoryLayoutSettings.SelectCategoryClick(var CategoryHolder: ShortInt; IconLayoutHolder: TImage; LabelLayout: TShadowLabel);
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
  ELV_SetFocus;
end;

procedure TFormCategoryLayoutSettings.IconLayScr1Click(Sender: TObject);
begin
  SelectCategoryClick(LayoutInfo[LayoutSelectedItem.ImageIndex].lImage1_imgCategory, IconLayScr1, LabelLayScr1);
end;

procedure TFormCategoryLayoutSettings.IconLayScr2Click(Sender: TObject);
begin
  SelectCategoryClick(LayoutInfo[LayoutSelectedItem.ImageIndex].lImage2_imgCategory, IconLayScr2, LabelLayScr2);
end;

procedure TFormCategoryLayoutSettings.IconLayScr3Click(Sender: TObject);
begin
  SelectCategoryClick(LayoutInfo[LayoutSelectedItem.ImageIndex].lImage3_imgCategory, IconLayScr3, LabelLayScr3);
end;

procedure TFormCategoryLayoutSettings.ImageCategorySystem_SelectorItemSelectionChanged(
  Sender: TCustomEasyListview; Item: TEasyItem);
begin
  if not Item.Selected then
     Exit;
  // February 2011 - I think this is correct. no changes necessary!
  TEasyListView(Sender).Tag:= Item.ImageIndex;
  LabelEmuTitle.Caption:= UpperCase(FormMain.GetEmulatorDescription(Item.ImageIndex));
  // check if category is selected and apply it's selected item ???
  // maybe select one by code ???
  SetImageCategoryValues;
end;

procedure TFormCategoryLayoutSettings.ImageCategory_SelectorItemCheckChange(
  Sender: TCustomEasyListview; Item: TEasyItem);
begin
  if Item.Index = 1 then
     begin
       if not Item.Checked then
          Item.Checked:= True;
     end;
  // FormMain.PopupMenuImageCategories.Items[Item.ImageIndex].Visible:= Item.Checked; // cannot be here...
  // ... need to update this only if user clicks "Apply" button
  case Item.Checked of
    True : Item.State:= Item.State-[esosGhosted];
    False: Item.State:= Item.State+[esosGhosted];
  end;
  if Item.Selected then
     begin
       //FormMain.ELV_SetSelectRibbon(Ord(Item.Ghosted), ImageCategory_Selector);
       Item.Invalidate(True);
     end;
end;

procedure TFormCategoryLayoutSettings.ImageCategory_SelectorItemPaintText(
  Sender: TCustomEasyListview; Item: TEasyItem; Position: Integer;
  ACanvas: TCanvas);
begin
  //if Item.Ghosted then
  //   ACanvas.Font.Color:= clGray; // no text, not needed anymore (March 23, 2015)
end;

procedure TFormCategoryLayoutSettings.ImageCategory_SelectorItemSelectionChanged(
  Sender: TCustomEasyListview; Item: TEasyItem);
begin
  if not Item.Selected then
     Exit;
  if not FormMain.CheckSelected(ImageCategorySystem_Selector) then
     Exit;
  ImageCategory_Selector.Tag:= Item.ImageIndex;
  LabelCategoryTitle.Caption:= UpperCase(FormMain.PopupMenuImageCategories.Items[Item.ImageIndex].Caption);

  ImageCategoryFolder.Enabled:= ImageCategory_Selector.Tag < High(ImageCategoryArray);
  LabelImageCategoryFolder.Enabled:= ImageCategoryFolder.Enabled;
  ButtonImageCategoryFolder.Enabled:= ImageCategoryFolder.Enabled;

  ImageCategoryBackgroundColor.Enabled:= ImageCategoryFolder.Enabled;
  LabelImageBackgroundColor.Enabled:= ImageCategoryFolder.Enabled;
  ButtonImageCategoryBackgroundColor.Enabled:= ImageCategoryFolder.Enabled;

  if ImageCategoryFolder.Enabled then
     begin
       if ImageCategoryBackgroundColor.Font.Color <> clBlack then
          ImageCategoryBackgroundColor.Font.Color:= clBlack;
     end
  else
     ImageCategoryBackgroundColor.Font.Color:= clGray;

  case FormMain.ImagesPNGOnly(ImageCategory_Selector.Tag) of
    True:
      begin
        LabelImageCategoryFolder.Caption:= Format(LabelImageCategoryFolder.Hint, ['.png']);
      end;
    False:
      begin
        if ImageCategory_Selector.Tag < High(ImageCategoryArray) then
           LabelImageCategoryFolder.Caption:= Format(LabelImageCategoryFolder.Hint, ['.png; .jpg']);
      end;
  end;
  //FormMain.ELV_SetSelectRibbon(Ord(Item.Ghosted), ImageCategory_Selector);
  SetImageCategoryValues;
end;

procedure TFormCategoryLayoutSettings.ImageCategoryBackgroundColorSelect(
  Sender: TObject);
begin
  // do not change the color .Tag in FormMain.PopupMenuImageCategories;
  // this will only be done if user clicks OK button; clicking Abort button does not update it
  // I can use "ImageCategory_Selector.Selection.First.Tag" to hold the new value instead of using a new array var
  if FormMain.CheckSelected(ImageCategory_Selector) then
     begin
       ImageCategory_Selector.Selection.First.Tag:= ImageCategoryBackgroundColor.Selected;
       //FormMain.PopupMenuImageCategories.Items[ImageCategory_Selector.Selection.First.ImageIndex].Tag:= ImageCategoryBackgroundColor.Selected;
       // comment the above line... PopupMenuImageCategories will only be updated if users clicks "Apply" button!!! (March 10, 2016)
     end;
end;

procedure TFormCategoryLayoutSettings.ImageCategoryFolderChange(
  Sender: TObject);
begin
  // new RAM var so user can abort changes (March 10, 2016)
  if TempImgFolder[ImageCategorySystem_Selector.Tag, ImageCategory_Selector.Tag] <> TEdit(Sender).Text then
     TempImgFolder[ImageCategorySystem_Selector.Tag, ImageCategory_Selector.Tag]:= TEdit(Sender).Text;

  // comment/remove this FormMain.imgFolder[]; it will only be updated if user click "Apply" button
  //if FormMain.imgFolder[ImageCategorySystem_Selector.Tag, ImageCategory_Selector.Tag] <> TEdit(Sender).Text then
  //   FormMain.imgFolder[ImageCategorySystem_Selector.Tag, ImageCategory_Selector.Tag]:= TEdit(Sender).Text;
end;

procedure TFormCategoryLayoutSettings.ButtonImageCategoryFolderClick(
  Sender: TObject);
begin
  if FormMain.CheckSelected(ImageCategory_Selector) then
     FormMain.DialogSelectFolder(ImageCategoryFolder, False, 'Select a folder for '+
                        FormMain.PopupMenuImageCategories.Items[ImageCategory_Selector.Tag].Caption);
end;

procedure TFormCategoryLayoutSettings.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #27 then
     ButtonClose.Click;
end;

procedure TFormCategoryLayoutSettings.FormActivate(Sender: TObject);
begin
  if Tag = 1 then
     Exit;

  FormMain.ELV_SelectItem(ImageCategorySystem_Selector, 0);
  FormMain.ELV_SelectItem(ImageCategory_Selector, 1);
  ImageCategory_Selector.SetFocus;

  PopulateLayoutsList;
  LoadLayouts;
  FormMain.ELV_SelectItem(LayoutListView, FormMain.ButtonScreenshotLayouts.Tag);
  LayoutListView.SetFocus;
  case FormMain.MenuImageViewMode.Tag of
    0:
      begin
        ButtonCategories.Down:= True;
        PanelLayouts.Visible:= False;
      end;
    1:
      begin
        ButtonLayouts.Down:= True;
        PanelCategories.Visible:= False;
        FormCategoryLayoutSettings.Caption:= 'Layouts Settings';
      end;
  end;
  ELV_SetFocus;
  Tag:= 1;
  Screen.Cursor:= crDefault;
end;

procedure TFormCategoryLayoutSettings.ButtonLayoutToggleVisibilityClick(
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
  ELV_SetFocus;
end;

procedure TFormCategoryLayoutSettings.ButtonLayoutResetPanelsIndexClick(
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

  ELV_SetFocus;
end;

procedure TFormCategoryLayoutSettings.ButtonHelpClick(Sender: TObject);
begin
  CallMessageBox;
  FormMain.AddMsgText('-= Image Category =-'+#13#10, clBlack, [fsBold], taCenter);
  FormMain.AddMsgText('1. Click on ');
  FormMain.AddMsgText('Categories', $00a65300, [fsBold]);
  FormMain.AddMsgText(' button tab to show the image categories panel.'+#13#10+
                      '2. To setup folders, select a system, a category, then a folder where images are. Relative path is relative to the emulator directory.'+#13#10+
                      '3. Repeat step ');
  FormMain.AddMsgText('#2', clBlack, [fsBold]);
  FormMain.AddMsgText(' for all categories and systems.'+#13#10+
                      '4. To hide a category, clear the checkbox on each of them. This setting is the same for all '+
                      'systems!'+#13#10+
                      '5. To set a background color, select a category and then the color of your choice. This setting '+
                      'is the same for all systems!'+#13#10+#13#10);
  FormMain.AddMsgText('-= Image Layout =-'+#13#10, clBlack, [fsBold], taCenter);
  FormMain.AddMsgText('1. Click on ');
  FormMain.AddMsgText('Layouts', $00a65300, [fsBold]);
  FormMain.AddMsgText(' bottom tab to show the image layouts panel.'+#13#10+
                      '2. Select a layout to setup.'+#13#10+
                      '3. On ');
  FormMain.AddMsgText('set categories for each layout', $00a65300, [fsBold]);
  FormMain.AddMsgText(', click on the screen icons to select an image category.'+#13#10+
                      '4. Clear ');
  FormMain.AddMsgText('Panel #', $00a65300, [fsBold]);
  FormMain.AddMsgText(' checkboxes to hide panels.'+#13#10+
                      '5. Repeat the process from step ');
  FormMain.AddMsgText('#2', clBlack, [fsBold]);
  FormMain.AddMsgText(' for other layouts.'+#13#10+
                      '6. To hide a layout, clear the checkbox in the layout list.'+#13#10+#13#10+
                      '    When you''re done, click ');
  FormMain.AddMsgText('Apply', $00a65300, [fsBold]);
  FormMain.AddMsgText(' button to save and apply changes or click ');
  FormMain.AddMsgText('Abort', $00a65300, [fsBold]);
  FormMain.AddMsgText(' button to cancel any changes you''ve made.');
  GenerateMessage('Help', 'How to setup images and layouts.', '', 2);
end;

procedure TFormCategoryLayoutSettings.FormShow(Sender: TObject);
var
  iDiff: Integer;
begin
  FormMain.ELV_ResetNormalColors(ImageCategorySystem_Selector);
  FormMain.ELV_ResetNormalColors(ImageCategory_Selector);
  FormMain.ELV_ResetNormalColors(LayoutListView);

  FormMain.LoadCategoriesIcons(IL_ImageCategory, True);
  FormMain.LoadCategoriesIcons(IL_ImageCategory_ExtraLarge, True);
  LoadLayoutIcons;

  PopulateCatFolderVarsRAM; // load categories folders for each system into a temp var in RAM "TempImgFolder[sysID, catID]"

  FormMain.ELV_PopulateSystems(ImageCategorySystem_Selector, True, True, 1);

  FormMain.ELV_PopulateImageCategory(ImageCategory_Selector, 1);

  PanelLayouts.Left:= 0;
  if Screen.Height < 600 then
     begin
       iDiff:= ImageCategory_Selector.CellSizes.Tile.Height;
       FormCategoryLayoutSettings.ClientHeight:=FormCategoryLayoutSettings.ClientHeight-iDiff;
       PanelCategories.Height:= PanelCategories.Height-iDiff;

       PanelBottomButtons.Top:= PanelBottomButtons.Top-iDiff;

       ImageCategoryFolder.Top:= ImageCategoryFolder.Top-iDiff;
       ButtonImageCategoryFolder.Top:= ButtonImageCategoryFolder.Top-iDiff;
       LabelImageCategoryFolder.Top:= LabelImageCategoryFolder.Top-iDiff;

       ImageCategoryBackgroundColor.Top:= ImageCategoryBackgroundColor.Top-iDiff;
       LabelImageBackgroundColor.Top:= LabelImageBackgroundColor.Top-iDiff;
       ButtonImageCategoryBackgroundColor.Top:= ButtonImageCategoryBackgroundColor.Top-iDiff;

       PanelImageCategorySelector.Height:= PanelImageCategorySelector.Height-iDiff;
       ImageCategory_Selector.Height:= ImageCategory_Selector.Height-iDiff;

       PanelCategoryTitle.Top:= PanelCategoryTitle.Top-iDiff;
       PanelShowHideCategories.Top:= PanelShowHideCategories.Top-iDiff;
     end;

  FormCategoryLayoutSettings.ClientWidth:= PanelCategories.Width;
end;

procedure TFormCategoryLayoutSettings.ButtonImageCategoryBackgroundColorClick(Sender: TObject);
begin
  if FormMain.CheckSelected(ImageCategory_Selector) then
     SetDefaultColorBox(ImageCategoryBackgroundColor);
end;

procedure TFormCategoryLayoutSettings.ButtonCategoriesClick(Sender: TObject);
begin
  case TSpeedButton(Sender).Tag of
    0:
      begin
        if not PanelCategories.Visible then
           begin
             PanelLayouts.Visible:= False;
             PanelCategories.Visible:= True;
           end;
      end;
    1:
      begin
        if not PanelLayouts.Visible then
           begin
             PanelCategories.Visible:= False;
             PanelLayouts.Visible:= True;
           end;
      end;
  end;
  case TSpeedButton(Sender).Tag of
    0:
      begin
        FormCategoryLayoutSettings.Caption:= 'Categories Settings';
      end;
    1:
      begin
        FormCategoryLayoutSettings.Caption:= 'Layouts Settings';
        if FormMain.CheckSelected(LayoutListView) then
           LayoutListView.OnItemSelectionChanged(LayoutListView, LayoutSelectedItem);
      end;
  end;
  ELV_SetFocus;
end;

procedure TFormCategoryLayoutSettings.LabelShowHideCategoriesClick(
  Sender: TObject);
var
  Item: TEasyItem;
begin
  ImageCategory_Selector.BeginUpdate;
  Item:= ImageCategory_Selector.Groups.FirstItem;
  repeat
    if Item.ImageIndex <> 1 then
       Item.Checked:= Boolean(TBitBtn(Sender).Tag);
    Item:= ImageCategory_Selector.Groups.NextItem(Item);
  until Item = nil;
  ImageCategory_Selector.EndUpdate;
  TShadowLabel(Sender).Tag:= Ord(not Boolean(TShadowLabel(Sender).Tag));
  case TShadowLabel(Sender).Tag of
    0: TShadowLabel(Sender).Caption:= 'CLICK HERE TO HIDE ALL CATEGORIES';
    1: TShadowLabel(Sender).Caption:= 'CLICK HERE TO SHOW ALL CATEGORIES';
  end;
  ELV_SetFocus;
end;

procedure TFormCategoryLayoutSettings.LabelShowHideCategoriesMouseEnter(
  Sender: TObject);
begin
  TShadowLabel(Sender).Font.Color:= clBlue;
  //TShadowLabel(Sender).Font.Style:= [fsUnderline];
end;

procedure TFormCategoryLayoutSettings.LabelShowHideCategoriesMouseLeave(
  Sender: TObject);
begin
  TShadowLabel(Sender).Font.Color:= $00a65300;
  //TShadowLabel(Sender).Font.Style:= [];
end;


end.


