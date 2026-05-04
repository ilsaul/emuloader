unit uImageLayoutSettings;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  StdCtrls, ComCtrls, ExtCtrls, IniFiles, Buttons,
  MPCommonObjects, EasyListview, uCommon, ImgList,
  PanelEx, AdvOfficeButtons, ShadowLabel, GR32_Image, GraphicEx,
  AdvGroupBox;

type
  TLayoutInfo = record
    lImage1_imgCategory,
    lImage2_imgCategory,
    lImage3_imgCategory,
    lImage4_imgCategory: ShortInt;
    lImage2_Enabled,
    lImage3_Enabled: Boolean;

    lImage1ConsComp_imgCategory,
    lImage2ConsComp_imgCategory,
    lImage3ConsComp_imgCategory,
    lImage4ConsComp_imgCategory: ShortInt;

    lVertGamesAltLayout: ShortInt;
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
    ImageScrLayoutFrame: TBevel;
    PanelLayoutsSelector: TPanelEx;
    LayoutListView: TEasyListview;
    ImageScrLayout: TImage32;
    ButtonUseAlternateLayoutVerticalGames_UsageRules: TBitBtn;
    GroupBoxCategoryAllSystems: TAdvGroupBox;
    GroupBoxCategoryConsoleComputer: TAdvGroupBox;
    FrameIconLayScr2: TShape;
    FrameIconLayScr3: TShape;
    FrameIconLayScr1: TShape;
    LabelPanel1: TLabel;
    LabelLayScr3: TShadowLabel;
    LabelLayScr2: TShadowLabel;
    IconLayScr1: TImage;
    IconLayScr2: TImage;
    IconLayScr3: TImage;
    LabelLayScr1: TShadowLabel;
    FrameIconLayScr4: TShape;
    LabelLayScr4: TShadowLabel;
    IconLayScr4: TImage;
    LabelPanel4: TLabel;
    LabelPanel2: TLabel;
    LabelPanel3: TLabel;
    PanelEnabledScr2: TAdvOfficeCheckBox;
    PanelEnabledScr3: TAdvOfficeCheckBox;
    LabelLayoutTitle: TShadowLabel;
    LabelShowHideLayouts: TShadowLabel;
    ButtonLayoutResetPanelsIndex: TBitBtn;
    UseAlternateLayoutVerticalGames: TAdvOfficeCheckBox;
    GroupBoxVertGamesAltLayout: TAdvGroupBox;
    FrameIconVertGamesAltLay: TShape;
    IconVertGamesAltLayout: TImage;
    FrameIconLayScr2_ConsComp: TShape;
    FrameIconLayScr3_ConsComp: TShape;
    FrameIconLayScr1_ConsComp: TShape;
    LabelPanel1_ConsComp: TLabel;
    LabelLayScr3_ConsComp: TShadowLabel;
    LabelLayScr2_ConsComp: TShadowLabel;
    IconLayScr1_ConsComp: TImage;
    IconLayScr2_ConsComp: TImage;
    IconLayScr3_ConsComp: TImage;
    LabelLayScr1_ConsComp: TShadowLabel;
    FrameIconLayScr4_ConsComp: TShape;
    LabelLayScr4_ConsComp: TShadowLabel;
    IconLayScr4_ConsComp: TImage;
    LabelPanel4_ConsComp: TLabel;
    LabelPanel3_ConsComp: TLabel;
    ButtonLayoutResetPanelsIndex_ConsComp: TBitBtn;
    LabelPanel2_ConsComp: TLabel;
    LabelVertGamesAltLayout: TShadowLabel;
    BitBtn1: TBitBtn;
    ButtonLayoutCopyCatAllSystems_ConsComp: TBitBtn;
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
    procedure ButtonLayoutResetPanelsIndexClick(Sender: TObject);
    procedure ButtonHelpClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure IconLayScr4Click(Sender: TObject);
    procedure LabelShowHideLayoutsClick(Sender: TObject);
    procedure UseAlternateLayoutVerticalGamesClick(Sender: TObject);
    procedure GroupBoxCategoryConsoleComputerCheckBoxClick(
      Sender: TObject);
    procedure IconVertGamesAltLayoutClick(Sender: TObject);
    procedure ButtonLayoutCopyCatAllSystems_ConsCompClick(Sender: TObject);
    procedure IconLayScr1_ConsCompClick(Sender: TObject);
    procedure IconLayScr2_ConsCompClick(Sender: TObject);
    procedure IconLayScr3_ConsCompClick(Sender: TObject);
    procedure IconLayScr4_ConsCompClick(Sender: TObject);
    procedure ButtonLayoutResetPanelsIndex_ConsCompClick(Sender: TObject);
    procedure LabelShowHideLayoutsMouseEnter(Sender: TObject);
    procedure LabelShowHideLayoutsMouseLeave(Sender: TObject);
  private
    { Private declarations }
    LayoutSelectedItem: TEasyItem;
    LayoutInfo: packed array[0..MaxImageLayouts] of TLayoutInfo;

    procedure LoadLayoutIcons;
    procedure SelectCategoryClick(var CategoryHolder: ShortInt; IconLayoutHolder: TImage; LabelLayout: TShadowLabel);

    procedure LoadLayouts;
    procedure UpdateLayouts;
    procedure LoadLayoutImage(Index: ShortInt);
    procedure PopulateLayoutsList;
    procedure LoadLayoutIcon(LayoutImgHolder: TImage; ImgCategory: ShortInt);
    procedure LoadVertGameLayoutIcon(AltLayoutIndex: ShortInt);
    procedure SelectVerticalGamesLayoutClick(var LayoutHolder: ShortInt; IconLayoutHolder: TImage);
  public
    { Public declarations }
  end;

var
  FormImageLayoutSettings: TFormImageLayoutSettings;

implementation

uses uMain, uSelectImageLayout;

{$R *.dfm}

procedure TFormImageLayoutSettings.LoadLayoutIcons;
var
  Loop: Byte;
  tmpFolder: String;
begin
  tmpFolder:= FormMain.GetFolderFull(32);
  for Loop:=0 to MaxImageLayouts do
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
       Result:= 1; // set to "game snap" if category is undefined
  end;
begin
  Item:= LayoutListView.Groups.FirstItem;
  if Item = nil then
     Exit;

  layoutIni:= TMemIniFile.Create(FormMain.GetImageLayoutsFile);
  LayoutListView.BeginUpdate;

  UseAlternateLayoutVerticalGames.Checked:= Boolean(layoutIni.ReadInteger('settings', 'UseAlternateLayoutVerticalGames', 0));
  GroupBoxCategoryConsoleComputer.CheckBox.Checked:= Boolean(layoutIni.ReadInteger('settings', 'UseCustomCategoryConsoleComputer', 0));

  repeat
    SectionStr:= GetScrLayoutSection(Item.ImageIndex);
    LayoutInfo[Item.ImageIndex].lImage1_imgCategory:= FixInvalidImageCategory(layoutIni.ReadInteger(SectionStr, 'image1_category', GetScrLayoutDefaultType(Item.ImageIndex, 1)));
    LayoutInfo[Item.ImageIndex].lImage1ConsComp_imgCategory:= FixInvalidImageCategory(layoutIni.ReadInteger(SectionStr, 'image1conscomp_category', GetScrLayoutDefaultType(Item.ImageIndex, 1)));
    if Item.ImageIndex > 0 then
       begin
         LayoutInfo[Item.ImageIndex].lImage2_imgCategory:= FixInvalidImageCategory(layoutIni.ReadInteger(SectionStr, 'image2_category', GetScrLayoutDefaultType(Item.ImageIndex, 2)));
         LayoutInfo[Item.ImageIndex].lImage2ConsComp_imgCategory:= FixInvalidImageCategory(layoutIni.ReadInteger(SectionStr, 'image2conscomp_category', GetScrLayoutDefaultType(Item.ImageIndex, 2)));
       end;
    if Item.ImageIndex > 2 then
       begin
         LayoutInfo[Item.ImageIndex].lImage3_imgCategory:= FixInvalidImageCategory(layoutIni.ReadInteger(SectionStr, 'image3_category', GetScrLayoutDefaultType(Item.ImageIndex, 3)));
         LayoutInfo[Item.ImageIndex].lImage3ConsComp_imgCategory:= FixInvalidImageCategory(layoutIni.ReadInteger(SectionStr, 'image3conscomp_category', GetScrLayoutDefaultType(Item.ImageIndex, 3)));
       end;
    if Item.ImageIndex > 8 then
       begin
         LayoutInfo[Item.ImageIndex].lImage4_imgCategory:= FixInvalidImageCategory(layoutIni.ReadInteger(SectionStr, 'image4_category', GetScrLayoutDefaultType(Item.ImageIndex, 4)));
         LayoutInfo[Item.ImageIndex].lImage4ConsComp_imgCategory:= FixInvalidImageCategory(layoutIni.ReadInteger(SectionStr, 'image4conscomp_category', GetScrLayoutDefaultType(Item.ImageIndex, 4)));
       end;

    if Item.ImageIndex in [1..8] then
       LayoutInfo[Item.ImageIndex].lImage2_Enabled:= Boolean(layoutIni.ReadInteger(SectionStr, 'image2_enabled', 1));

    if Item.ImageIndex in [3..8] then
       LayoutInfo[Item.ImageIndex].lImage3_Enabled:= Boolean(layoutIni.ReadInteger(SectionStr, 'image3_enabled', 1));

    if Item.ImageIndex > 3 then // single layout is not supported --- dual layout is unnecessary as they are only 2 layouts
       LayoutInfo[Item.ImageIndex].lVertGamesAltLayout:= layoutIni.ReadInteger(SectionStr, 'vertgames_alt_layout', GetScrLayoutAltVerticalDefault(Item.ImageIndex));

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
  layoutIni:= TMemIniFile.Create(FormMain.GetImageLayoutsFile);

  layoutIni.WriteInteger('settings', 'UseAlternateLayoutVerticalGames', Ord(UseAlternateLayoutVerticalGames.Checked));
  layoutIni.WriteInteger('settings', 'UseCustomCategoryConsoleComputer', Ord(GroupBoxCategoryConsoleComputer.CheckBox.Checked));

  repeat
    SectionStr:= GetScrLayoutSection(Item.ImageIndex);
    if Item.ImageIndex > 0 then
       begin
         FormMain.PopupScreenshotLayouts.Items[Item.ImageIndex].Visible:= Item.Checked;
         layoutIni.WriteInteger(SectionStr, 'visible', Ord(Item.Checked));
       end
    else
       FormMain.ButtonImageCategory.HelpContext:= LayoutInfo[Item.ImageIndex].lImage1_imgCategory;

    layoutIni.WriteInteger(SectionStr, 'image1_category', LayoutInfo[Item.ImageIndex].lImage1_imgCategory);

    if Item.ImageIndex > 0 then
       layoutIni.WriteInteger(SectionStr, 'image2_category', LayoutInfo[Item.ImageIndex].lImage2_imgCategory);

    if Item.ImageIndex > 2 then
       layoutIni.WriteInteger(SectionStr, 'image3_category', LayoutInfo[Item.ImageIndex].lImage3_imgCategory);

    if Item.ImageIndex > 8 then
       begin
         layoutIni.WriteInteger(SectionStr, 'image4_category', LayoutInfo[Item.ImageIndex].lImage4_imgCategory);
         layoutIni.WriteInteger(SectionStr, 'image4conscomp_category', LayoutInfo[Item.ImageIndex].lImage4ConsComp_imgCategory);
       end;

    if Item.ImageIndex in [1..8] then
       layoutIni.WriteInteger(SectionStr, 'image2_enabled', Ord(LayoutInfo[Item.ImageIndex].lImage2_Enabled));
    if Item.ImageIndex in [3..8] then
       layoutIni.WriteInteger(SectionStr, 'image3_enabled', Ord(LayoutInfo[Item.ImageIndex].lImage3_Enabled));

    layoutIni.WriteInteger(SectionStr, 'image1conscomp_category', LayoutInfo[Item.ImageIndex].lImage1ConsComp_imgCategory);
    if Item.ImageIndex > 0 then
       layoutIni.WriteInteger(SectionStr, 'image2conscomp_category', LayoutInfo[Item.ImageIndex].lImage2ConsComp_imgCategory);

    if Item.ImageIndex > 2 then
       layoutIni.WriteInteger(SectionStr, 'image3conscomp_category', LayoutInfo[Item.ImageIndex].lImage3ConsComp_imgCategory);

    if Item.ImageIndex > 8 then
       layoutIni.WriteInteger(SectionStr, 'image4conscomp_category', LayoutInfo[Item.ImageIndex].lImage4ConsComp_imgCategory);

    if Item.ImageIndex > 3 then // single layout is not supported --- dual layout is unnecessary as they are only 2 layouts
       layoutIni.WriteInteger(SectionStr, 'vertgames_alt_layout', LayoutInfo[Item.ImageIndex].lVertGamesAltLayout);

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
    LayoutInfo[Loop].lImage4_imgCategory:= GetScrLayoutDefaultType(Loop, 4);
    LayoutInfo[Loop].lImage2_Enabled:= Loop in [1..8];
    LayoutInfo[Loop].lImage3_Enabled:= Loop in [3..8];

    LayoutInfo[Loop].lImage1ConsComp_imgCategory:= GetScrLayoutDefaultType(Loop, 1);
    LayoutInfo[Loop].lImage2ConsComp_imgCategory:= GetScrLayoutDefaultType(Loop, 2);
    LayoutInfo[Loop].lImage3ConsComp_imgCategory:= GetScrLayoutDefaultType(Loop, 3);
    LayoutInfo[Loop].lImage4ConsComp_imgCategory:= GetScrLayoutDefaultType(Loop, 4);

    if Loop > 0 then
       LayoutInfo[Loop].lVertGamesAltLayout:= GetScrLayoutAltVerticalDefault(Loop);

    with LayoutListView.Items.Add do
    begin
      ImageIndex:= Loop;
      StrTitle:= GetScrLayoutSection(Loop);
      PosIndex:= PosEx(' ', StrTitle);
      if PosIndex <> 0 then
         StrTitle:= Trim(Copy(StrTitle, 1, PosIndex))+#13#10+Trim(Copy(StrTitle, PosIndex, Length(StrTitle)));
      Caption:= StringReplace(StrTitle, '[Layout ', '[lay ', [rfReplaceAll]);
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
end;

procedure TFormImageLayoutSettings.LoadVertGameLayoutIcon(AltLayoutIndex: ShortInt);
begin
  FormMain.LoadImageLayoutThumbIcon(IconVertGamesAltLayout, AltLayoutIndex);
end;

procedure TFormImageLayoutSettings.SelectVerticalGamesLayoutClick(var LayoutHolder: ShortInt; IconLayoutHolder: TImage);
var
  NewLayout: ShortInt;
begin
  if LayoutSelectedItem.ImageIndex < 3 then
     Exit; // single layout is not supported here (no point) --- dual layouts is not necessary, only 2 layouts available (switch each other for alt layout)

  // unchecked layouts are still being added to select dialog... how to fix this ? :_((
  if not Assigned(FormSelectImageLayout) then
     FormSelectImageLayout:= TFormSelectImageLayout.Create(nil);

  case LayoutSelectedItem.ImageIndex of
    1, 2: FormSelectImageLayout.LayoutType:= 2;
    3..8: FormSelectImageLayout.LayoutType:= 3;
  else
          FormSelectImageLayout.LayoutType:= 4;
  end;

  NewLayout:= -1; // layout not selected
  if FormSelectImageLayout.ShowModal = mrOk then
     NewLayout:= FormSelectImageLayout.LayoutsListView.Selection.First.ImageIndex;
  FreeAndNil(FormSelectImageLayout);

  if NewLayout = -1 then
     Exit; // user aborted
  LayoutHolder:= NewLayout;
  LoadVertGameLayoutIcon(NewLayout);
  //LabelLayout.Caption:= FormMain.PopupMenuImageCategories.Items[NewCat].Caption;
  LayoutListView.SetFocus;
end;

procedure TFormImageLayoutSettings.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if not CanClose then
     Exit;
  if ModalResult = mrCancel then
     Exit;

  UpdateLayouts; // update .ini settings only (do not apply setting at main screen)
  //UpdateImgLayoutIni; // update layout visible .ini from TMenuItem list in main screen

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
  IconLayScr4.Picture.Icon:= nil;

  IconLayScr1_ConsComp.Picture.Icon:= nil;
  IconLayScr2_ConsComp.Picture.Icon:= nil;
  IconLayScr3_ConsComp.Picture.Icon:= nil;
  IconLayScr4_ConsComp.Picture.Icon:= nil;

  LoadLayoutImage(LayoutSelectedItem.ImageIndex);

  GroupBoxVertGamesAltLayout.Visible:= LayoutSelectedItem.ImageIndex > 0;

  if GroupBoxVertGamesAltLayout.Visible then
     LoadVertGameLayoutIcon(LayoutInfo[LayoutSelectedItem.ImageIndex].lVertGamesAltLayout);

  LoadLayoutIcon(IconLayScr1, LayoutInfo[LayoutSelectedItem.ImageIndex].lImage1_imgCategory);
  LabelLayScr1.Caption:= FormMain.PopupMenuImageCategories.Items[LayoutInfo[LayoutSelectedItem.ImageIndex].lImage1_imgCategory].Caption;

  PanelEnabledScr2.Visible:= LayoutSelectedItem.ImageIndex > 0;
  PanelEnabledScr3.Visible:= LayoutSelectedItem.ImageIndex > 2;
  LabelPanel4.Visible:= LayoutSelectedItem.ImageIndex > 8;

  FrameIconLayScr2.Visible:= PanelEnabledScr2.Visible;
  FrameIconLayScr3.Visible:= PanelEnabledScr3.Visible;
  FrameIconLayScr4.Visible:= LabelPanel4.Visible;

  IconLayScr4.Visible:= LabelPanel4.Visible;
  LabelLayScr4.Visible:= LabelPanel4.Visible;

  // console/computer systems
  LoadLayoutIcon(IconLayScr1_ConsComp, LayoutInfo[LayoutSelectedItem.ImageIndex].lImage1_imgCategory); // replace "lImage1_imgCategory" by the cons/comp new var in a future build
  LabelLayScr1_ConsComp.Caption:= FormMain.PopupMenuImageCategories.Items[LayoutInfo[LayoutSelectedItem.ImageIndex].lImage1_imgCategory].Caption; // replace "lImage1_imgCategory" for cons/comp

  LabelPanel2_ConsComp.Visible:= PanelEnabledScr2.Visible;
  LabelPanel3_ConsComp.Visible:= PanelEnabledScr3.Visible;
  LabelPanel4_ConsComp.Visible:= LabelPanel4.Visible;

  FrameIconLayScr2_ConsComp.Visible:= PanelEnabledScr2.Visible;
  FrameIconLayScr3_ConsComp.Visible:= PanelEnabledScr3.Visible;
  FrameIconLayScr4_ConsComp.Visible:= LabelPanel4.Visible;
  // console/computer systems

  if LabelPanel4.Visible then
     begin
       // all panels must be enabled in quad layouts
       LabelPanel2.Visible:= True;
       LabelPanel3.Visible:= True;
       PanelEnabledScr2.Visible:= False; // no checkbox in quad layouts
       PanelEnabledScr3.Visible:= False; // no checkbox in quad layouts

       IconLayScr2.Visible:= True;
       LabelLayScr2.Visible:= True;

       LoadLayoutIcon(IconLayScr2, LayoutInfo[LayoutSelectedItem.ImageIndex].lImage2_imgCategory);
       LabelLayScr2.Caption:= FormMain.PopupMenuImageCategories.Items[LayoutInfo[LayoutSelectedItem.ImageIndex].lImage2_imgCategory].Caption;

       IconLayScr3.Visible:= True;
       LabelLayScr3.Visible:= True;

       LoadLayoutIcon(IconLayScr3, LayoutInfo[LayoutSelectedItem.ImageIndex].lImage3_imgCategory);
       LabelLayScr3.Caption:= FormMain.PopupMenuImageCategories.Items[LayoutInfo[LayoutSelectedItem.ImageIndex].lImage3_imgCategory].Caption;

       LoadLayoutIcon(IconLayScr4, LayoutInfo[LayoutSelectedItem.ImageIndex].lImage4_imgCategory);
       LabelLayScr4.Caption:= FormMain.PopupMenuImageCategories.Items[LayoutInfo[LayoutSelectedItem.ImageIndex].lImage4_imgCategory].Caption;

       // console/computer systems
       IconLayScr2_ConsComp.Visible:= IconLayScr2.Visible;
       LabelLayScr2_ConsComp.Visible:= IconLayScr2.Visible;

       LoadLayoutIcon(IconLayScr2_ConsComp, LayoutInfo[LayoutSelectedItem.ImageIndex].lImage2_imgCategory); // replace "lImage2_imgCategory" for cons/comp
       LabelLayScr2_ConsComp.Caption:= FormMain.PopupMenuImageCategories.Items[LayoutInfo[LayoutSelectedItem.ImageIndex].lImage2_imgCategory].Caption; // replace "lImage2_imgCategory" for cons/comp

       IconLayScr3_ConsComp.Visible:= IconLayScr3.Visible;
       LabelLayScr3_ConsComp.Visible:= IconLayScr3.Visible;

       LoadLayoutIcon(IconLayScr3_ConsComp, LayoutInfo[LayoutSelectedItem.ImageIndex].lImage3_imgCategory); // replace "lImage3_imgCategory" for cons/comp
       LabelLayScr3_ConsComp.Caption:= FormMain.PopupMenuImageCategories.Items[LayoutInfo[LayoutSelectedItem.ImageIndex].lImage3_imgCategory].Caption; // replace "lImage3_imgCategory" for cons/comp

       IconLayScr4_ConsComp.Visible:= IconLayScr4.Visible;
       LabelLayScr4_ConsComp.Visible:= IconLayScr4.Visible;

       LoadLayoutIcon(IconLayScr4_ConsComp, LayoutInfo[LayoutSelectedItem.ImageIndex].lImage4_imgCategory); // replace "lImage4_imgCategory" for cons/comp
       LabelLayScr4_ConsComp.Caption:= FormMain.PopupMenuImageCategories.Items[LayoutInfo[LayoutSelectedItem.ImageIndex].lImage4_imgCategory].Caption; // replace "lImage4_imgCategory" for cons/comp
       // console/computer systems

       Exit; // do not execute the code below
     end
  else
     begin
       LabelPanel2.Visible:= (not PanelEnabledScr2.Visible) and (LayoutSelectedItem.ImageIndex > 0);
       LabelPanel3.Visible:= (not PanelEnabledScr3.Visible) and (LayoutSelectedItem.ImageIndex > 2);
     end;

  case PanelEnabledScr2.Visible of
    True:
      begin
        PanelEnabledScr2.Checked:= LayoutInfo[LayoutSelectedItem.ImageIndex].lImage2_Enabled;
        LoadLayoutIcon(IconLayScr2, LayoutInfo[LayoutSelectedItem.ImageIndex].lImage2_imgCategory);
        LabelLayScr2.Caption:= FormMain.PopupMenuImageCategories.Items[LayoutInfo[LayoutSelectedItem.ImageIndex].lImage2_imgCategory].Caption;

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

        // console/computer systems
        LoadLayoutIcon(IconLayScr2_ConsComp, LayoutInfo[LayoutSelectedItem.ImageIndex].lImage2_imgCategory);
        LabelLayScr2_ConsComp.Caption:= FormMain.PopupMenuImageCategories.Items[LayoutInfo[LayoutSelectedItem.ImageIndex].lImage2_imgCategory].Caption;
        // console/computer systems
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
        LoadLayoutIcon(IconLayScr3, LayoutInfo[LayoutSelectedItem.ImageIndex].lImage3_imgCategory);
        LabelLayScr3.Caption:= FormMain.PopupMenuImageCategories.Items[LayoutInfo[LayoutSelectedItem.ImageIndex].lImage3_imgCategory].Caption;
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

        // console/computer systems
        LoadLayoutIcon(IconLayScr3_ConsComp, LayoutInfo[LayoutSelectedItem.ImageIndex].lImage3_imgCategory);
        LabelLayScr3_ConsComp.Caption:= FormMain.PopupMenuImageCategories.Items[LayoutInfo[LayoutSelectedItem.ImageIndex].lImage3_imgCategory].Caption;
        // console/computer systems

      end;
    False:
      begin
        IconLayScr3.Visible:= False;
        LabelLayScr3.Visible:= False;
      end;
  end;

  IconLayScr2_ConsComp.Visible:= IconLayScr2.Visible; // console/computer systems
  LabelLayScr2_ConsComp.Visible:= LabelLayScr2.Visible; // console/computer systems

  IconLayScr3_ConsComp.Visible:= IconLayScr3.Visible; // console/computer systems
  LabelLayScr3_ConsComp.Visible:= LabelLayScr3.Visible; // console/computer systems
end;

procedure TFormImageLayoutSettings.PanelEnabledScr2Click(Sender: TObject);
begin
  if not FormMain.CheckSelected(LayoutListView) then
     Exit;

  if LayoutSelectedItem.ImageIndex > 8 then
     begin
       if not PanelEnabledScr2.Checked then
          PanelEnabledScr2.Checked:= True;
       LayoutListView.SetFocus;
       Exit;
     end;

  IconLayScr2.Visible:= PanelEnabledScr2.Checked;
  LabelLayScr2.Visible:= PanelEnabledScr2.Checked;
  if LayoutSelectedItem.ImageIndex > 0 then
     LayoutInfo[LayoutSelectedItem.ImageIndex].lImage2_Enabled:= PanelEnabledScr2.Checked;

  IconLayScr2_ConsComp.Visible:= PanelEnabledScr2.Checked;
  LabelLayScr2_ConsComp.Visible:= PanelEnabledScr2.Checked;

  LayoutListView.SetFocus;
end;

procedure TFormImageLayoutSettings.PanelEnabledScr3Click(Sender: TObject);
begin
  if not FormMain.CheckSelected(LayoutListView) then
     Exit;

  if LayoutSelectedItem.ImageIndex > 8 then
     begin
       if not PanelEnabledScr3.Checked then
          PanelEnabledScr3.Checked:= True;
       LayoutListView.SetFocus;
       Exit;
     end;
     
  IconLayScr3.Visible:= PanelEnabledScr3.Checked;
  LabelLayScr3.Visible:= PanelEnabledScr3.Checked;
  if LayoutSelectedItem.ImageIndex > 2 then
     LayoutInfo[LayoutSelectedItem.ImageIndex].lImage3_Enabled:= PanelEnabledScr3.Checked;

  IconLayScr3_ConsComp.Visible:= PanelEnabledScr3.Checked;
  LabelLayScr3_ConsComp.Visible:= PanelEnabledScr3.Checked;
  
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

procedure TFormImageLayoutSettings.IconLayScr4Click(Sender: TObject);
begin
  SelectCategoryClick(LayoutInfo[LayoutSelectedItem.ImageIndex].lImage4_imgCategory, IconLayScr4, LabelLayScr4);
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
      4: LayoutInfo[LayoutSelectedItem.ImageIndex].lImage4_imgCategory:= NewCat;
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
  if LayoutSelectedItem.ImageIndex > 8 then
     SetPanelCategory(4, IconLayScr4, LabelLayScr4);

  LayoutListView.SetFocus;
end;

procedure TFormImageLayoutSettings.ButtonHelpClick(Sender: TObject);
begin
  CallMessageBox;
  FormMain.AddMsgText('    Customize image categories for each layout'+#13#10+#13#10+
                      '1. Select a layout to setup.'+#13#10+
                      '2. On ');
  FormMain.AddMsgText('Category (All Systems)', $00a65300, [fsBold]);
  FormMain.AddMsgText(' click panel icons to select an image category.'+#13#10+
                      '3. Uncheck ');
  FormMain.AddMsgText('Panel #', $00a65300, [fsBold]);
  FormMain.AddMsgText(' checkboxes to hide panels (except panel 1, 4 and quad layouts).'+#13#10+
                      '4. Repeat the process from step ');
  FormMain.AddMsgText('#1', clBlack, [fsBold]);
  FormMain.AddMsgText(' for other layouts.'+#13#10+
                      '5. To hide/disable a layout, clear the checkbox in the layouts list.'+#13#10+#13#10+
                      '    When you''re done, click ');
  FormMain.AddMsgText('Apply', $00a65300, [fsBold]);
  FormMain.AddMsgText(' button to save and apply changes or click ');
  FormMain.AddMsgText('Abort', $00a65300, [fsBold]);
  FormMain.AddMsgText(' button to cancel any changes you''ve made.');
  GenerateMessage('Help', 'How to setup image layouts.', '', 2);
end;

procedure TFormImageLayoutSettings.FormShow(Sender: TObject);
begin
  LabelPanel2.Top:= LabelPanel1.Top;
  LabelPanel3.Top:= LabelPanel1.Top;
  FormMain.ELV_ResetNormalColors(LayoutListView);

  FormMain.LoadCategoriesIcons(IL_ImageCategory);
  FormMain.LoadCategoriesIcons(IL_ImageCategory_ExtraLarge);
  LoadLayoutIcons;
end;

procedure TFormImageLayoutSettings.LabelShowHideLayoutsClick(
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
  TShadowLabel(Sender).Tag:= Ord(not Boolean(TShadowLabel(Sender).Tag));
  case TShadowLabel(Sender).Tag of
    0: TShadowLabel(Sender).Caption:= 'CLICK HERE TO HIDE ALL LAYOUTS';
    1: TShadowLabel(Sender).Caption:= 'CLICK HERE TO SHOW ALL LAYOUTS';
  end;
  LayoutListView.SetFocus;
end;

procedure TFormImageLayoutSettings.UseAlternateLayoutVerticalGamesClick(
  Sender: TObject);
begin
  if TAdvOfficeCheckBox(Sender).Checked then
     TAdvOfficeCheckBox(Sender).Font.Color:= clBlack
  else
     TAdvOfficeCheckBox(Sender).Font.Color:= $0078695b;
end;

procedure TFormImageLayoutSettings.GroupBoxCategoryConsoleComputerCheckBoxClick(
  Sender: TObject);
begin
  if GroupBoxCategoryConsoleComputer.CheckBox.Checked then
     GroupBoxCategoryConsoleComputer.Font.Color:= clBlack
  else
     GroupBoxCategoryConsoleComputer.Font.Color:= $0078695b;
end;

procedure TFormImageLayoutSettings.IconVertGamesAltLayoutClick(
  Sender: TObject);
begin
  SelectVerticalGamesLayoutClick(LayoutInfo[LayoutSelectedItem.ImageIndex].lVertGamesAltLayout, IconVertGamesAltLayout);
end;

procedure TFormImageLayoutSettings.ButtonLayoutCopyCatAllSystems_ConsCompClick(
  Sender: TObject);
var
  NewCat: Integer;
begin
  if not FormMain.CheckSelected(LayoutListView) then
     Exit;
     
  LayoutInfo[LayoutSelectedItem.ImageIndex].lImage1ConsComp_imgCategory:= LayoutInfo[LayoutSelectedItem.ImageIndex].lImage1_imgCategory;
  if LayoutSelectedItem.ImageIndex > 0 then
     LayoutInfo[LayoutSelectedItem.ImageIndex].lImage2ConsComp_imgCategory:= LayoutInfo[LayoutSelectedItem.ImageIndex].lImage2_imgCategory;
  if LayoutSelectedItem.ImageIndex > 2 then
     LayoutInfo[LayoutSelectedItem.ImageIndex].lImage3ConsComp_imgCategory:= LayoutInfo[LayoutSelectedItem.ImageIndex].lImage3_imgCategory;
  if LayoutSelectedItem.ImageIndex > 8 then
     LayoutInfo[LayoutSelectedItem.ImageIndex].lImage4ConsComp_imgCategory:= LayoutInfo[LayoutSelectedItem.ImageIndex].lImage4_imgCategory;

  NewCat:= LayoutInfo[LayoutSelectedItem.ImageIndex].lImage1ConsComp_imgCategory;
  LoadLayoutIcon(IconLayScr1_ConsComp, NewCat);
  LabelLayScr1_ConsComp.Caption:= FormMain.PopupMenuImageCategories.Items[NewCat].Caption;
  if LayoutSelectedItem.ImageIndex > 0 then
     begin
       NewCat:= LayoutInfo[LayoutSelectedItem.ImageIndex].lImage2ConsComp_imgCategory;
       LoadLayoutIcon(IconLayScr2_ConsComp, NewCat);
       LabelLayScr2_ConsComp.Caption:= FormMain.PopupMenuImageCategories.Items[NewCat].Caption;
     end;
  if LayoutSelectedItem.ImageIndex > 2 then
     begin
       NewCat:= LayoutInfo[LayoutSelectedItem.ImageIndex].lImage3ConsComp_imgCategory;
       LoadLayoutIcon(IconLayScr3_ConsComp, NewCat);
       LabelLayScr3_ConsComp.Caption:= FormMain.PopupMenuImageCategories.Items[NewCat].Caption;
     end;
  if LayoutSelectedItem.ImageIndex > 8 then
     begin
       NewCat:= LayoutInfo[LayoutSelectedItem.ImageIndex].lImage4ConsComp_imgCategory;
       LoadLayoutIcon(IconLayScr4_ConsComp, NewCat);
       LabelLayScr4_ConsComp.Caption:= FormMain.PopupMenuImageCategories.Items[NewCat].Caption;
     end;
end;


procedure TFormImageLayoutSettings.IconLayScr1_ConsCompClick(
  Sender: TObject);
begin
  SelectCategoryClick(LayoutInfo[LayoutSelectedItem.ImageIndex].lImage1ConsComp_imgCategory, IconLayScr1_ConsComp, LabelLayScr1_ConsComp);
end;

procedure TFormImageLayoutSettings.IconLayScr2_ConsCompClick(
  Sender: TObject);
begin
  SelectCategoryClick(LayoutInfo[LayoutSelectedItem.ImageIndex].lImage2ConsComp_imgCategory, IconLayScr2_ConsComp, LabelLayScr2_ConsComp);
end;

procedure TFormImageLayoutSettings.IconLayScr3_ConsCompClick(
  Sender: TObject);
begin
  SelectCategoryClick(LayoutInfo[LayoutSelectedItem.ImageIndex].lImage3ConsComp_imgCategory, IconLayScr3_ConsComp, LabelLayScr3_ConsComp);
end;

procedure TFormImageLayoutSettings.IconLayScr4_ConsCompClick(
  Sender: TObject);
begin
  SelectCategoryClick(LayoutInfo[LayoutSelectedItem.ImageIndex].lImage4ConsComp_imgCategory, IconLayScr4_ConsComp, LabelLayScr4_ConsComp);
end;

procedure TFormImageLayoutSettings.ButtonLayoutResetPanelsIndex_ConsCompClick(
  Sender: TObject);

  procedure SetPanelCategory(PanelIndex: ShortInt; IconHolder: TImage; CategoryLabel: TShadowLabel);
  var
    NewCat: ShortInt;
  begin
    NewCat:= GetScrLayoutDefaultType(LayoutSelectedItem.ImageIndex, PanelIndex);
    case PanelIndex of
      1: LayoutInfo[LayoutSelectedItem.ImageIndex].lImage1ConsComp_imgCategory:= NewCat;
      2: LayoutInfo[LayoutSelectedItem.ImageIndex].lImage2ConsComp_imgCategory:= NewCat;
      3: LayoutInfo[LayoutSelectedItem.ImageIndex].lImage3ConsComp_imgCategory:= NewCat;
      4: LayoutInfo[LayoutSelectedItem.ImageIndex].lImage4ConsComp_imgCategory:= NewCat;
    end;
    LoadLayoutIcon(IconHolder, NewCat);
    CategoryLabel.Caption:= FormMain.PopupMenuImageCategories.Items[NewCat].Caption;
  end;

begin
  if not FormMain.CheckSelected(LayoutListView) then
     Exit;

  SetPanelCategory(1, IconLayScr1_ConsComp, LabelLayScr1_ConsComp);
  if LayoutSelectedItem.ImageIndex > 0 then
     SetPanelCategory(2, IconLayScr2_ConsComp, LabelLayScr2_ConsComp);
  if LayoutSelectedItem.ImageIndex > 2 then
     SetPanelCategory(3, IconLayScr3_ConsComp, LabelLayScr3_ConsComp);
  if LayoutSelectedItem.ImageIndex > 8 then
     SetPanelCategory(4, IconLayScr4_ConsComp, LabelLayScr4_ConsComp);

  LayoutListView.SetFocus;

end;

procedure TFormImageLayoutSettings.LabelShowHideLayoutsMouseEnter(
  Sender: TObject);
begin
  TShadowLabel(Sender).Font.Color:= clBlue;
end;

procedure TFormImageLayoutSettings.LabelShowHideLayoutsMouseLeave(
  Sender: TObject);
begin
  TShadowLabel(Sender).Font.Color:= $00a65300;
end;

end.


