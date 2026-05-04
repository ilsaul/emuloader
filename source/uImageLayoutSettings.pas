unit uImageLayoutSettings;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  StdCtrls, ComCtrls, ExtCtrls, IniFiles, Buttons,
  MPCommonObjects, EasyListview, uCommon, ImgList,
  PanelEx, AdvOfficeButtons, ShadowLabel, GR32_Image, GraphicEx,
  AdvGroupBox, ButtonsEx, BevelEx;

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
  end;

type
  TFormImageLayoutSettings = class(TForm)
    IL_Layouts: TImageList;
    PanelBottom: TPanelEx;
    ButtonHelp: TBitBtnEx;
    ButtonClose: TBitBtnEx;
    ButtonAbort: TBitBtnEx;
    ImageScrLayoutFrame: TBevelEx;
    PanelLayoutsSelector: TPanelEx;
    LayoutListView: TEasyListview;
    ImageScrLayout: TImage32;
    GroupBoxCategoryAllSystems: TAdvGroupBoxEx;
    GroupBoxCategoryConsoleComputer: TAdvGroupBoxEx;
    FrameIconLayScr2: TShape;
    FrameIconLayScr3: TShape;
    FrameIconLayScr1: TShape;
    LabelPanel1: TShadowLabel;
    LabelLayScr3: TShadowLabel;
    LabelLayScr2: TShadowLabel;
    IconLayScr1: TImage;
    IconLayScr2: TImage;
    IconLayScr3: TImage;
    LabelLayScr1: TShadowLabel;
    FrameIconLayScr4: TShape;
    LabelLayScr4: TShadowLabel;
    IconLayScr4: TImage;
    LabelPanel4: TShadowLabel;
    LabelPanel2: TShadowLabel;
    LabelPanel3: TShadowLabel;
    PanelEnabledScr2: TAdvOfficeCheckBoxEx;
    PanelEnabledScr3: TAdvOfficeCheckBoxEx;
    ButtonLayoutResetPanelsIndex: TSpeedButtonEx;
    FrameIconLayScr2_ConsComp: TShape;
    FrameIconLayScr3_ConsComp: TShape;
    FrameIconLayScr1_ConsComp: TShape;
    LabelPanel1_ConsComp: TShadowLabel;
    LabelLayScr3_ConsComp: TShadowLabel;
    LabelLayScr2_ConsComp: TShadowLabel;
    IconLayScr1_ConsComp: TImage;
    IconLayScr2_ConsComp: TImage;
    IconLayScr3_ConsComp: TImage;
    LabelLayScr1_ConsComp: TShadowLabel;
    FrameIconLayScr4_ConsComp: TShape;
    LabelLayScr4_ConsComp: TShadowLabel;
    IconLayScr4_ConsComp: TImage;
    LabelPanel4_ConsComp: TShadowLabel;
    LabelPanel3_ConsComp: TShadowLabel;
    ButtonLayoutResetPanelsIndex_ConsComp: TSpeedButtonEx;
    LabelPanel2_ConsComp: TShadowLabel;
    ButtonHelp_CustomCategoryConsComp: TSpeedButtonEx;
    ButtonLayoutCopyCatAllSystems_ConsComp: TSpeedButtonEx;
    PanelSystemTitle: TPanelEx;
    LabelLayoutTitle: TShadowLabel;
    PanelSystemTitleBottom: TPanelEx;
    ShowHideLayoutsPanel: TPanelEx;
    ShowHideLayoutsLabel: TShadowLabel;
    LayoutsRightFrame: TBevelEx;
    IL_ImageCategory: TImageList;
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
    procedure ShowHideLayoutsLabelClick(Sender: TObject);
    procedure GroupBoxCategoryConsoleComputerCheckBoxClick(
      Sender: TObject);
    procedure ButtonLayoutCopyCatAllSystems_ConsCompClick(Sender: TObject);
    procedure IconLayScr1_ConsCompClick(Sender: TObject);
    procedure IconLayScr2_ConsCompClick(Sender: TObject);
    procedure IconLayScr3_ConsCompClick(Sender: TObject);
    procedure IconLayScr4_ConsCompClick(Sender: TObject);
    procedure ButtonLayoutResetPanelsIndex_ConsCompClick(Sender: TObject);
    procedure ShowHideLayoutsLabelMouseEnter(Sender: TObject);
    procedure ShowHideLayoutsLabelMouseLeave(Sender: TObject);
    procedure ButtonHelp_CustomCategoryConsCompClick(Sender: TObject);
  private
    { Private declarations }
    iFolder, iFolder4K: String;
    LayoutSelectedItem: TEasyItem;
    LayoutInfo: packed array[0..MaxImageLayouts] of TLayoutInfo;

    procedure LoadLayoutIcons;
    procedure SelectCategoryClick(var CategoryHolder: ShortInt; IconLayoutHolder: TImage; LabelLayout: TShadowLabel);

    procedure LoadLayouts;
    procedure UpdateLayouts;
    //procedure LoadLayoutImage(Index: ShortInt);
    procedure PopulateLayoutsList;
    procedure LoadLayoutIcon(LayoutImgHolder: TImage; ImgCategory: ShortInt);
    procedure Resize4K;
  public
    { Public declarations }
  end;

var
  FormImageLayoutSettings: TFormImageLayoutSettings;

implementation

uses uMain;

{$R *.dfm}

procedure TFormImageLayoutSettings.Resize4K;
var
  iPos: Integer;

  procedure MoveCategory(iLabelPanel: TShadowLabel; iLabelPanelPos: Integer; iFrameIconLayScr: TShape; iFrameIconLayScrPos: Integer; iIconLayScr: TImage; iLabelLayScr: TShadowLabel);
  begin
    FormMain.Set4KShapeSpecs(iFrameIconLayScr, iFrameIconLayScrPos, 74, 156, 156);
    FormMain.Set4KImageIconSpecs(iIconLayScr,  128, iFrameIconLayScr.Left+14, iFrameIconLayScr.Top+14);
    FormMain.Set4KLabelSpecs(iLabelLayScr, iFrameIconLayScr.Left, iFrameIconLayScr.Top+168, iFrameIconLayScr.Width, 24, 14);
    FormMain.Set4KLabelSpecs(iLabelPanel,  iLabelPanelPos,        iFrameIconLayScr.Top-35,                      -1, -1, 16);
  end;

begin
  if not Is4KMode then
     Exit;

  with FormImageLayoutSettings do
  begin
    PanelSystemTitle.Height:= 27;
    LabelLayoutTitle.Font.Size:= 16;

    LayoutListView.PaintInfoItem.ImageIndent:= 0; // adjust this in the regular res version ?
    LayoutListView.CellSizes.Tile.Width:= 156+22+LayoutListView.PaintInfoItem.CheckIndent+LayoutListView.PaintInfoItem.ImageIndent;
    LayoutListView.CellSizes.Tile.Height:= 156;
    FormMain.Set4KListViewSpecs(LayoutListView, 8, PanelSystemTitleBottom.Top+PanelSystemTitleBottom.Height+8, (LayoutListView.CellSizes.Tile.Width*4)+20,
                                (LayoutListView.CellSizes.Tile.Height*7), 16);

    FormMain.Set4KPanelSpecs(PanelLayoutsSelector, -1, -1, LayoutListView.Width-4, LayoutListView.Top+LayoutListView.Height+8);

    FormMain.Set4KPanelSpecs(ShowHideLayoutsPanel, 580, 1022, 115, 70);
    FormMain.Set4KLabelSpecs(ShowHideLayoutsLabel,  14,    8,  88, 55, 16);

    ClientWidth:= PanelLayoutsSelector.Width+20+725+20;
    ClientHeight:= PanelLayoutsSelector.Height;
    Font.Size:= 16;

    LayoutListView.PaintInfoItem.CheckIndent:= 3; // ImageCategory_Selector.PaintInfoItem.ImageIndent:= 2;
    FormMain.Set4KListViewCheckBoxHDSpecs(LayoutListView);
    LayoutListView.Font.Name:= FormMain.Get4KSystemFont;

    FormMain.Set4KImageListSpecs(IL_Layouts, 128);
    FormMain.Set4KImageListSpecs(IL_ImageCategory, 128);

    FormMain.Set4KGroupBoxSpecs(GroupBoxCategoryAllSystems, PanelLayoutsSelector.Width+20, 19, 725, 282, 16);
    FormMain.Set4KButtonSpecs(ButtonLayoutResetPanelsIndex, GroupBoxCategoryAllSystems.Width-10-82, 0, 82, 30, 16, -3);

    FormMain.Set4KCheckBoxSpecs(PanelEnabledScr2, 227, 37, 100, 30, 16);
    FormMain.Set4KCheckBoxSpecs(PanelEnabledScr3, 404, 37, 100, 30, 16);

    MoveCategory(LabelPanel1,  65, FrameIconLayScr1,  20, IconLayScr1, LabelLayScr1);
    MoveCategory(LabelPanel2, 240, FrameIconLayScr2, 196, IconLayScr2, LabelLayScr2);
    MoveCategory(LabelPanel3, 416, FrameIconLayScr3, 372, IconLayScr3, LabelLayScr3);
    MoveCategory(LabelPanel4, 592, FrameIconLayScr4, 548, IconLayScr4, LabelLayScr4);

    FormMain.Set4KButtonSpecs(ButtonHelp_CustomCategoryConsComp, 36, 3, 24, 24, 16, -2);

    FormMain.Set4KGroupBoxSpecs(GroupBoxCategoryConsoleComputer, PanelLayoutsSelector.Width+20, 326, 725, 282, 16);
    FormMain.Set4KButtonSpecs(ButtonLayoutResetPanelsIndex_ConsComp,  GroupBoxCategoryConsoleComputer.Width-10-82,   0, 82, 30, 16, -3);
    FormMain.Set4KButtonSpecs(ButtonLayoutCopyCatAllSystems_ConsComp, ButtonLayoutResetPanelsIndex_ConsComp.Left-61, 0, 61, 30, 16, -3);

    MoveCategory(LabelPanel1_ConsComp,  65, FrameIconLayScr1_ConsComp,  20, IconLayScr1_ConsComp, LabelLayScr1_ConsComp);
    MoveCategory(LabelPanel2_ConsComp, 240, FrameIconLayScr2_ConsComp, 196, IconLayScr2_ConsComp, LabelLayScr2_ConsComp);
    MoveCategory(LabelPanel3_ConsComp, 416, FrameIconLayScr3_ConsComp, 372, IconLayScr3_ConsComp, LabelLayScr3_ConsComp);
    MoveCategory(LabelPanel4_ConsComp, 592, FrameIconLayScr4_ConsComp, 548, IconLayScr4_ConsComp, LabelLayScr4_ConsComp);

    PanelBottom.Frames:= [];
    FormMain.Set4KPanelSpecs(PanelBottom, PanelLayoutsSelector.Width, ClientHeight-71, ClientWidth-PanelLayoutsSelector.Width, 71);
    FormMain.Set4KButtonsOkCancelPanel(PanelBottom, ButtonClose, ButtonAbort, False);
    FormMain.Set4KButtonSpecs(ButtonHelp, ButtonClose.Left-10-68, ButtonClose.Top, 68, 45, 16);

    iPos:= GroupBoxCategoryConsoleComputer.Top+GroupBoxCategoryConsoleComputer.Height;
    iPos:= iPos+(((PanelBottom.Top-iPos)-(ImageScrLayout.Height*2)) div 2);

    FormMain.Set4KImageSpecs(ImageScrLayout, ImageScrLayout.Width*2, ImageScrLayout.Height*2, PanelBottom.Left+((PanelBottom.Width-(ImageScrLayout.Width*2)) div 2), iPos);
    FormMain.Set4KBevelSpecs(ImageScrLayoutFrame, ImageScrLayout.Left-2, ImageScrLayout.Top-2, ImageScrLayout.Width+4, ImageScrLayout.Height+4);
  end;
end;

procedure TFormImageLayoutSettings.LoadLayoutIcons;
var
  Loop: Byte;
  tmpFolder: String;
begin
  tmpFolder:= FormMain.GetFolderFull(32);
  for Loop:=0 to MaxImageLayouts do
      FormMain.AddDefaultIcons(GetScrLayoutImageFile(Loop, False), tmpFolder, IL_Layouts, 3); // 3 -> layout (not overlay, but with black titles repaint for light mode)
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

  layoutIni:= TMemIniFile.Create(FormMain.GetImageLayoutsFile);

  layoutIni.WriteInteger('settings', 'UseCustomCategoryConsoleComputer', Ord(GroupBoxCategoryConsoleComputer.CheckBox.Checked));

  repeat
    SectionStr:= GetScrLayoutSection(Item.ImageIndex);
    if Item.ImageIndex > 0 then
       begin
         FormMain.ImageLayoutVisible[Item.ImageIndex]:= Item.Checked;
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

    Item:= LayoutListView.Groups.NextItem(Item);
  until Item = nil;
  layoutIni.UpdateFile;
  FreeAndNil(layoutIni);
end;

{procedure TFormImageLayoutSettings.LoadLayoutImage(Index: ShortInt);
var
  layFile: String;
  Continue: Boolean;
begin
  layFile:= GetScrLayoutImageFile(Index);
  Continue:= not Is4KMode;
  ImageScrLayout.BeginUpdate;
  ImageScrLayout.Bitmap:= nil;

  if Is4KMode then
     begin
       if FileExists(iFolder+iFolder4K+layFile) then
          ImageScrLayout.Bitmap.LoadFromFile(iFolder+iFolder4K+layFile)
       else
          Continue:= True;
     end;

  if Continue then
     if FileExists(iFolder+layFile) then
        ImageScrLayout.Bitmap.LoadFromFile(iFolder+layFile);
  ImageScrLayout.EndUpdate;
end;}

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

    with LayoutListView.Items.Add do
    begin
      ImageIndex:= Loop;
      StrTitle:= GetScrLayoutSection(Loop);
      PosIndex:= PosEx(' ', StrTitle);
      if PosIndex <> 0 then
         StrTitle:= Trim(Copy(StrTitle, 1, PosIndex))+#13#10+Trim(Copy(StrTitle, PosIndex, Length(StrTitle)));
      Caption:= StringReplace(StrTitle, '[Layout ', '[lay ', [rfReplaceAll]);
      if Loop = 0 then
         Checked:= True // single layout cannot be hidden
      else
         Checked:= FormMain.ImageLayoutVisible[Loop];
      if not Checked then
         State:= State+[esosGhosted];
    end;
  end;
  LayoutListView.Items.ReIndexDisable:= False;
  LayoutListView.EndUpdate;
end;

procedure TFormImageLayoutSettings.LoadLayoutIcon(LayoutImgHolder: TImage; ImgCategory: ShortInt);
begin
  if LayoutImgHolder.Picture.Icon <> nil then
     LayoutImgHolder.Picture.Icon:=  nil;
  IL_ImageCategory.GetIcon(ImgCategory, LayoutImgHolder.Picture.Icon);
  //FormMain.AddDefaultIcons(ImageCategoryArray[ImgCategory, 0], '', nil, 2, LayoutImgHolder); // 2 -> image category overlay
end;

procedure TFormImageLayoutSettings.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if not CanClose then
     Exit;
  if ModalResult = mrCancel then
     Exit;

  UpdateLayouts; // update .ini settings only (do not apply setting at main screen)
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
    False:
      begin
        if Item.Index <> FormMain.ButtonScreenshotLayouts.Tag then
           Item.State:= Item.State+[esosGhosted]
        else
           Item.Checked:= True; // do not allow disable if layout is currently being used in main screen
           Exit;
      end;
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

  procedure ClearIconImg(ImageSource: TImage);
  begin
    if not ImageSource.Visible then
       ImageSource.Picture.Icon:= nil;
  end;

begin
  if not Item.Selected then
     Exit;
  if LayoutSelectedItem <> Item then
     LayoutSelectedItem:= Item;

  LabelLayoutTitle.Caption:= UpperCase(GetScrLayoutSection(Item.ImageIndex));

  FormMain.LoadImageLayoutPreview(LayoutSelectedItem.ImageIndex, ImageScrLayout);

  LoadLayoutIcon(IconLayScr1, LayoutInfo[LayoutSelectedItem.ImageIndex].lImage1_imgCategory);

  LabelLayScr1.Caption:= GetImageCategoryTitle(LayoutInfo[LayoutSelectedItem.ImageIndex].lImage1_imgCategory);

  PanelEnabledScr2.Visible:= LayoutSelectedItem.ImageIndex > 0;
  PanelEnabledScr3.Visible:= LayoutSelectedItem.ImageIndex > 2;
  LabelPanel4.Visible:= LayoutSelectedItem.ImageIndex > 8;

  FrameIconLayScr2.Visible:= PanelEnabledScr2.Visible;
  FrameIconLayScr3.Visible:= PanelEnabledScr3.Visible;
  FrameIconLayScr4.Visible:= LabelPanel4.Visible;

  IconLayScr4.Visible:= LabelPanel4.Visible;
  LabelLayScr4.Visible:= LabelPanel4.Visible;

  // console/computer systems
  LoadLayoutIcon(IconLayScr1_ConsComp, LayoutInfo[LayoutSelectedItem.ImageIndex].lImage1ConsComp_imgCategory);
  LabelLayScr1_ConsComp.Caption:= GetImageCategoryTitle(LayoutInfo[LayoutSelectedItem.ImageIndex].lImage1ConsComp_imgCategory);

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
       LabelLayScr2.Caption:= GetImageCategoryTitle(LayoutInfo[LayoutSelectedItem.ImageIndex].lImage2_imgCategory);

       IconLayScr3.Visible:= True;
       LabelLayScr3.Visible:= True;

       LoadLayoutIcon(IconLayScr3, LayoutInfo[LayoutSelectedItem.ImageIndex].lImage3_imgCategory);
       LabelLayScr3.Caption:= GetImageCategoryTitle(LayoutInfo[LayoutSelectedItem.ImageIndex].lImage3_imgCategory);

       LoadLayoutIcon(IconLayScr4, LayoutInfo[LayoutSelectedItem.ImageIndex].lImage4_imgCategory);
       LabelLayScr4.Caption:= GetImageCategoryTitle(LayoutInfo[LayoutSelectedItem.ImageIndex].lImage4_imgCategory);

       // console/computer systems
       IconLayScr2_ConsComp.Visible:= IconLayScr2.Visible;
       LabelLayScr2_ConsComp.Visible:= IconLayScr2.Visible;

       LoadLayoutIcon(IconLayScr2_ConsComp, LayoutInfo[LayoutSelectedItem.ImageIndex].lImage2ConsComp_imgCategory);
       LabelLayScr2_ConsComp.Caption:= GetImageCategoryTitle(LayoutInfo[LayoutSelectedItem.ImageIndex].lImage2ConsComp_imgCategory);

       IconLayScr3_ConsComp.Visible:= IconLayScr3.Visible;
       LabelLayScr3_ConsComp.Visible:= IconLayScr3.Visible;

       LoadLayoutIcon(IconLayScr3_ConsComp, LayoutInfo[LayoutSelectedItem.ImageIndex].lImage3ConsComp_imgCategory);
       LabelLayScr3_ConsComp.Caption:= GetImageCategoryTitle(LayoutInfo[LayoutSelectedItem.ImageIndex].lImage3ConsComp_imgCategory);

       IconLayScr4_ConsComp.Visible:= IconLayScr4.Visible;
       LabelLayScr4_ConsComp.Visible:= IconLayScr4.Visible;

       LoadLayoutIcon(IconLayScr4_ConsComp, LayoutInfo[LayoutSelectedItem.ImageIndex].lImage4ConsComp_imgCategory);
       LabelLayScr4_ConsComp.Caption:= GetImageCategoryTitle(LayoutInfo[LayoutSelectedItem.ImageIndex].lImage4ConsComp_imgCategory);
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
        LabelLayScr2.Caption:= GetImageCategoryTitle(LayoutInfo[LayoutSelectedItem.ImageIndex].lImage2_imgCategory);

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
        LoadLayoutIcon(IconLayScr2_ConsComp, LayoutInfo[LayoutSelectedItem.ImageIndex].lImage2ConsComp_imgCategory);
        LabelLayScr2_ConsComp.Caption:= GetImageCategoryTitle(LayoutInfo[LayoutSelectedItem.ImageIndex].lImage2ConsComp_imgCategory);
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
        LabelLayScr3.Caption:= GetImageCategoryTitle(LayoutInfo[LayoutSelectedItem.ImageIndex].lImage3_imgCategory);
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
        LoadLayoutIcon(IconLayScr3_ConsComp, LayoutInfo[LayoutSelectedItem.ImageIndex].lImage3ConsComp_imgCategory);
        LabelLayScr3_ConsComp.Caption:= GetImageCategoryTitle(LayoutInfo[LayoutSelectedItem.ImageIndex].lImage3ConsComp_imgCategory);
        // console/computer systems
      end;
    False:
      begin
        IconLayScr3.Visible:= False;
        LabelLayScr3.Visible:= False;
      end;
  end;

  // console/computer systems
  IconLayScr2_ConsComp.Visible:= IconLayScr2.Visible;
  LabelLayScr2_ConsComp.Visible:= LabelLayScr2.Visible;

  IconLayScr3_ConsComp.Visible:= IconLayScr3.Visible;
  LabelLayScr3_ConsComp.Visible:= LabelLayScr3.Visible;

  IconLayScr4_ConsComp.Visible:= IconLayScr4.Visible;
  LabelLayScr4_ConsComp.Visible:= LabelLayScr4.Visible;
  // console/computer systems

  ClearIconImg(IconLayScr1);
  ClearIconImg(IconLayScr2);
  ClearIconImg(IconLayScr3);
  ClearIconImg(IconLayScr4);

  ClearIconImg(IconLayScr1_ConsComp);
  ClearIconImg(IconLayScr2_ConsComp);
  ClearIconImg(IconLayScr3_ConsComp);
  ClearIconImg(IconLayScr4_ConsComp);
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

  NewCat:= FormMain.CallSelectImageCategory(CategoryHolder, False, True, True);
  if NewCat = -1 then
     Exit;
  CategoryHolder:= NewCat;
  LoadLayoutIcon(IconLayoutHolder, NewCat);
  LabelLayout.Caption:= GetImageCategoryTitle(NewCat);

  if LayoutSelectedItem.ImageIndex = 0 then
  begin
    // single layout -> category of "all systems" and "console/computer" must be the same
    if IconLayoutHolder = IconLayScr1 then
    begin
      LayoutInfo[LayoutSelectedItem.ImageIndex].lImage1ConsComp_imgCategory:= NewCat;
      LoadLayoutIcon(IconLayScr1_ConsComp, NewCat);
      LabelLayScr1_ConsComp.Caption:= GetImageCategoryTitle(NewCat);
    end
    else
    begin
      LayoutInfo[LayoutSelectedItem.ImageIndex].lImage1_imgCategory:= NewCat;
      LoadLayoutIcon(IconLayScr1, NewCat);
      LabelLayScr1.Caption:= GetImageCategoryTitle(NewCat);
    end;
  end;

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
    CategoryLabel.Caption:= GetImageCategoryTitle(NewCat);
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
  FormMain.InitMessageBox;
  FormMain.AddMsgText('    Customize image categories for each layout'+#13#10+#13#10);
  FormMain.AddMsgText('1.', MsgTxtColors.colorWarning, [fsBold]);
  FormMain.AddMsgText(' Select a layout to setup.'+#13#10);
  FormMain.AddMsgText('2.', MsgTxtColors.colorWarning, [fsBold]);
  FormMain.AddMsgText(' On ');
  FormMain.AddMsgText('Category (All Systems)', MsgTxtColors.colorKeyTitle, [fsBold]);
  FormMain.AddMsgText(' click panel icons to select an image category.'+#13#10);
  FormMain.AddMsgText('3.', MsgTxtColors.colorWarning, [fsBold]);
  FormMain.AddMsgText(' Uncheck ');
  FormMain.AddMsgText('Panel #', MsgTxtColors.colorKeyTitle, [fsBold]);
  FormMain.AddMsgText(' checkboxes to hide panels (except panel 1, 4 and quad layouts).'+#13#10);
  FormMain.AddMsgText('4.', MsgTxtColors.colorWarning, [fsBold]);
  FormMain.AddMsgText(' Repeat the process from step ');
  FormMain.AddMsgText('#1', MsgTxtColors.colorExitCode, [fsBold]);
  FormMain.AddMsgText(' for other layouts.'+#13#10);
  FormMain.AddMsgText('5.', MsgTxtColors.colorWarning, [fsBold]);
  FormMain.AddMsgText(' To hide/disable a layout, clear the checkbox in the layouts list.'+#13#10+#13#10+
                      '    When you''re done, click ');
  FormMain.AddMsgText('Apply', MsgTxtColors.colorFileName, [fsBold]);
  FormMain.AddMsgText(' button to save and apply changes or click ');
  FormMain.AddMsgText('Abort', MsgTxtColors.colorFileName, [fsBold]);
  FormMain.AddMsgText(' button to cancel any changes you''ve made.');
  FormMain.ShowMessageBox('Help', 'How to setup image layouts.', '', 2);
end;

procedure TFormImageLayoutSettings.FormShow(Sender: TObject);
begin
  Resize4K;
  FormMain.ELV_ResetNormalColors(LayoutListView);

  if IsNightMode then
     begin
       FormImageLayoutSettings.Color:= menu_background_color[1];

       PanelLayoutsSelector.Color1:= clrBlackBk;
       FormMain.SetEasyListViewColors(LayoutListView, clrBlackBk, clWhite);
       FormMain.ELV_SetCheckRadioCustomIcon(LayoutListView);

       SetPanelColors(PanelSystemTitle, menu_background_color[1], clrDarkGray);
       SetPanelColors(PanelSystemTitleBottom, clrDarkGray, clrBlackBk);
       FormMain.SetSystemTitleLabelColors(LabelLayoutTitle);

       ShowHideLayoutsPanel.Color1:= clrLightBlack;
       ShowHideLayoutsPanel.ColorFrame:= clrLightGrayFrame;
       SetLabelColors(ShowHideLayoutsLabel, item_shortcut_color[1], item_shortcut_selected_color[1]);

       SetGroupBoxBorderStyle(GroupBoxCategoryAllSystems);
       SetGroupBoxColors(GroupBoxCategoryAllSystems,
                         clrBorderGroupBoxGrayBk, clrInnerBorderGroupBoxGrayBk,
                         item_caption_active_color[1], item_caption_active_shadow_color[1], -1, clrMedDarkGray, False);

       SetLabelColors(LabelPanel1, item_caption_active_color[1], item_caption_active_shadow_color[1]);
       SetLabelColors(LabelPanel2, item_caption_active_color[1], item_caption_active_shadow_color[1]);
       SetLabelColors(LabelPanel3, item_caption_active_color[1], item_caption_active_shadow_color[1]);
       SetLabelColors(LabelPanel4, item_caption_active_color[1], item_caption_active_shadow_color[1]);

       SetCheckBoxColors(PanelEnabledScr2, item_caption_active_color[1], item_caption_active_shadow_color[1]);
       SetCheckBoxColors(PanelEnabledScr3, item_caption_active_color[1], item_caption_active_shadow_color[1]);
       FormMain.SetCheckBoxExCustomIcon(PanelEnabledScr2);
       FormMain.SetCheckBoxExCustomIcon(PanelEnabledScr3);

       FrameIconLayScr1.Brush.Color:= clrBlackBk;
       FrameIconLayScr2.Brush.Color:= clrBlackBk;
       FrameIconLayScr3.Brush.Color:= clrBlackBk;
       FrameIconLayScr4.Brush.Color:= clrBlackBk;

       SetLabelColors(LabelLayScr1, clrLightRed, clMaroon);
       SetLabelColors(LabelLayScr2, clrLightRed, clMaroon);
       SetLabelColors(LabelLayScr3, clrLightRed, clMaroon);
       SetLabelColors(LabelLayScr4, clrLightRed, clMaroon);

       SetGroupBoxBorderStyle(GroupBoxCategoryConsoleComputer);
       SetGroupBoxColors(GroupBoxCategoryConsoleComputer,
                         clrBorderGroupBoxGrayBk, clrInnerBorderGroupBoxGrayBk,
                         item_caption_active_color[1], item_caption_active_shadow_color[1], -1, clrMedDarkGray, False);
       FormMain.SetGroupBoxExCustomIcon(GroupBoxCategoryConsoleComputer);

       SetLabelColors(LabelPanel1_ConsComp, item_caption_active_color[1], item_caption_active_shadow_color[1]);
       SetLabelColors(LabelPanel2_ConsComp, item_caption_active_color[1], item_caption_active_shadow_color[1]);
       SetLabelColors(LabelPanel3_ConsComp, item_caption_active_color[1], item_caption_active_shadow_color[1]);
       SetLabelColors(LabelPanel4_ConsComp, item_caption_active_color[1], item_caption_active_shadow_color[1]);

       FrameIconLayScr1_ConsComp.Brush.Color:= clrBlackBk;
       FrameIconLayScr2_ConsComp.Brush.Color:= clrBlackBk;
       FrameIconLayScr3_ConsComp.Brush.Color:= clrBlackBk;
       FrameIconLayScr4_ConsComp.Brush.Color:= clrBlackBk;

       SetLabelColors(LabelLayScr1_ConsComp, clrLightRed, clMaroon);
       SetLabelColors(LabelLayScr2_ConsComp, clrLightRed, clMaroon);
       SetLabelColors(LabelLayScr3_ConsComp, clrLightRed, clMaroon);
       SetLabelColors(LabelLayScr4_ConsComp, clrLightRed, clMaroon);

       ImageScrLayoutFrame.CustomColor1:= clrBorderGroupBoxGrayBk;
       ImageScrLayoutFrame.CustomColor2:= clrInnerBorderGroupBoxGrayBk;

       PanelBottom.ColorFrame:= clrBorderGroupBoxGrayBk;
       
       FormMain.SetButtonExColors(ButtonClose);
       FormMain.SetButtonExColors(ButtonAbort);
       FormMain.SetButtonExColors(ButtonHelp);
       FormMain.SetButtonExColors(ButtonLayoutResetPanelsIndex);
       FormMain.SetButtonExColors(ButtonLayoutCopyCatAllSystems_ConsComp);
       FormMain.SetButtonExColors(ButtonLayoutResetPanelsIndex_ConsComp);
       FormMain.SetButtonExColors(ButtonHelp_CustomCategoryConsComp);

       SetBottomPanelColors(PanelBottom);

       FormMain.ELV_SetNightModeColors(LayoutListView);
     end;

  if not Is4KMode then
     begin
       LabelPanel2.Top:= LabelPanel1.Top;
       LabelPanel3.Top:= LabelPanel1.Top;
     end;
  //FormMain.ELV_ResetNormalColors(LayoutListView);

  //if IsNightMode then
  //   FormMain.ELV_SetNightModeColors(LayoutListView);

  FormMain.LoadCategoriesIcons(IL_ImageCategory);
  //FormMain.LoadCategoriesIcons(IL_ImageCategory_ExtraLarge);
  LoadLayoutIcons;

  iFolder4K:= '4K\';
  iFolder:= FormMain.GetFolderFull(35)+'img_layouts\';
end;

procedure TFormImageLayoutSettings.ShowHideLayoutsLabelClick(
  Sender: TObject);
var
  Item: TEasyItem;
begin
  LayoutListView.BeginUpdate;
  Item:= LayoutListView.Groups.FirstItem;
  repeat
    if Item.ImageIndex > 0 then
       Item.Checked:= Boolean(TBitBtnEx(Sender).Tag);
    Item:= LayoutListView.Groups.NextItem(Item);
  until Item = nil;
  LayoutListView.EndUpdate;
  TShadowLabel(Sender).Tag:= Ord(not Boolean(TShadowLabel(Sender).Tag));
  case TShadowLabel(Sender).Tag of
    0: TShadowLabel(Sender).Caption:= 'HIDE ALL'+#13#10+'LAYOUTS';
    1: TShadowLabel(Sender).Caption:= 'SHOW ALL'+#13#10+'LAYOUTS';
  end;
  LayoutListView.SetFocus;
end;

procedure TFormImageLayoutSettings.GroupBoxCategoryConsoleComputerCheckBoxClick(
  Sender: TObject);
begin
  if IsNightMode then
     begin
       if GroupBoxCategoryConsoleComputer.CheckBox.Checked then
          SetGroupBoxFontColors(GroupBoxCategoryConsoleComputer, item_caption_active_color[1], item_caption_active_shadow_color[1])
       else
          SetGroupBoxFontColors(GroupBoxCategoryConsoleComputer, clGray, clrMedDarkGray);
     end
  else
     begin
       if GroupBoxCategoryConsoleComputer.CheckBox.Checked then
          GroupBoxCategoryConsoleComputer.Font.Color:= clBlack
       else
          GroupBoxCategoryConsoleComputer.Font.Color:= clrLightGrayFrame;
     end;
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
  LabelLayScr1_ConsComp.Caption:= GetImageCategoryTitle(NewCat);
  if LayoutSelectedItem.ImageIndex > 0 then
     begin
       NewCat:= LayoutInfo[LayoutSelectedItem.ImageIndex].lImage2ConsComp_imgCategory;
       LoadLayoutIcon(IconLayScr2_ConsComp, NewCat);
       LabelLayScr2_ConsComp.Caption:= GetImageCategoryTitle(NewCat);
     end;
  if LayoutSelectedItem.ImageIndex > 2 then
     begin
       NewCat:= LayoutInfo[LayoutSelectedItem.ImageIndex].lImage3ConsComp_imgCategory;
       LoadLayoutIcon(IconLayScr3_ConsComp, NewCat);
       LabelLayScr3_ConsComp.Caption:= GetImageCategoryTitle(NewCat);
     end;
  if LayoutSelectedItem.ImageIndex > 8 then
     begin
       NewCat:= LayoutInfo[LayoutSelectedItem.ImageIndex].lImage4ConsComp_imgCategory;
       LoadLayoutIcon(IconLayScr4_ConsComp, NewCat);
       LabelLayScr4_ConsComp.Caption:= GetImageCategoryTitle(NewCat);
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
    CategoryLabel.Caption:= GetImageCategoryTitle(NewCat);
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

procedure TFormImageLayoutSettings.ShowHideLayoutsLabelMouseEnter(
  Sender: TObject);
begin
  if IsNightMode then
     SetLabelColors(TShadowLabel(Sender), clCream)
  else
     SetLabelColors(TShadowLabel(Sender), clBlue, clNavy);
end;

procedure TFormImageLayoutSettings.ShowHideLayoutsLabelMouseLeave(
  Sender: TObject);
begin
  if IsNightMode then
     SetLabelColors(TShadowLabel(Sender), item_shortcut_color[1], item_shortcut_selected_color[1])
  else
     SetLabelColors(TShadowLabel(Sender), MsgTxtColors.colorFileName, $00dddddd);
end;

procedure TFormImageLayoutSettings.ButtonHelp_CustomCategoryConsCompClick(
  Sender: TObject);
begin
  FormMain.InitMessageBox;
  FormMain.AddMsgText('    You can use alternate categories for console/computer systems and MAME software lists.'+#13#10+#13#10);
  FormMain.AddMsgText('1.', MsgTxtColors.colorWarning, [fsBold]);
  FormMain.AddMsgText(' Click panel icons to select an image category.'+#13#10);
  FormMain.AddMsgText('2.', MsgTxtColors.colorWarning, [fsBold]);
  FormMain.AddMsgText(' To enable the custom categories make sure to tick the checkbox. Uncheck ');
  FormMain.AddMsgText('Panel #', MsgTxtColors.colorKeyTitle, [fsBold]);
  FormMain.AddMsgText(' checkboxes in ');
  FormMain.AddMsgText('All Systems', MsgTxtColors.colorKeyTitle, [fsBold]);
  FormMain.AddMsgText(' box to hide panels (except panel 1, 4 and quad layouts).'+#13#10);
  FormMain.AddMsgText('3.', MsgTxtColors.colorWarning, [fsBold]);
  FormMain.AddMsgText(' Repeat the process from step ');
  FormMain.AddMsgText('#1', MsgTxtColors.colorExitCode, [fsBold]);
  FormMain.AddMsgText(' for other layouts.'+#13#10);
  FormMain.AddMsgText('4.', MsgTxtColors.colorWarning, [fsBold]);
  FormMain.AddMsgText(' To hide/disable a layout, clear the checkbox in the layouts list.'+#13#10+#13#10+
                      '    When you''re done, click ');
  FormMain.AddMsgText('Apply', MsgTxtColors.colorFileName, [fsBold]);
  FormMain.AddMsgText(' button to save and apply changes or click ');
  FormMain.AddMsgText('Abort', MsgTxtColors.colorFileName, [fsBold]);
  FormMain.AddMsgText(' button to cancel any changes you''ve made.');
  FormMain.ShowMessageBox('Help', 'Use Custom Category for Console/Computer.', '', 2);
end;


end.


