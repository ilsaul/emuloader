unit uImageCategorySettings;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, uCommon, uCommonCustom, StdCtrls, Buttons, MPCommonObjects, EasyListview,
  ShadowLabel, ExtCtrls, PanelEx, ImgList, IniFiles, uMain, EditEx,
  ButtonsEx, ColorBoxEx, AdvOfficeButtons, BevelEx;

type
  TFormImageCategorySettings = class(TForm)
    Systems: TEasyListview;
    IL_Systems: TImageList;
    IL_ImageCategory_ExtraLarge: TImageList;
    PanelImageCategories: TPanelEx;
    ImageCategory_Selector: TEasyListview;
    PanelCategoriesBottom: TPanelEx;
    LabelCategoryTitle: TShadowLabel;
    LabelImageCategoryBackgroundColor: TShadowLabel;
    ImageCategoryBackgroundColor: TColorBoxEx;
    LabelShowHideCategories: TShadowLabel;
    ButtonImageCategoryBackgroundColorReset: TBitBtnEx;
    ImageSingleBackgroundColorEnabled: TAdvOfficeCheckBoxEx;
    ImageSingleBackgroundColor: TColorBoxEx;
    ImageSingleBackgroundColorButtonReset: TBitBtnEx;
    LabelImageCategoryFolder: TShadowLabel;
    ImageCategoryFolder: TEditEx;
    ButtonSelectImageCategoryFolder: TBitBtnEx;
    ButtonDefaultImageCategoryFolder: TBitBtnEx;
    ButtonResetImageCategoryFolder: TBitBtnEx;
    ButtonClearImageCategoryFolder: TBitBtnEx;
    PanelSystemsTitleBottom: TPanelEx;
    PanelSystemsTitle: TPanelEx;
    LabelSystemTitle: TShadowLabel;
    LabelSystemType: TShadowLabel;
    LabelSystemNotAvailable: TShadowLabel;
    ButtonZippedImages: TBitBtnEx;
    PanelBottom: TPanelEx;
    ButtonOk: TBitBtnEx;
    ButtonCancel: TBitBtnEx;
    procedure SystemsItemSelectionChanged(Sender: TCustomEasyListview;
      Item: TEasyItem);
    procedure ImageCategoryFolderChange(Sender: TObject);
    procedure ButtonSelectImageCategoryFolderClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure ButtonZippedImagesClick(Sender: TObject);
    procedure ButtonClearImageCategoryFolderClick(Sender: TObject);
    procedure ButtonResetImageCategoryFolderClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure ImageCategory_SelectorItemSelectionChanged(
      Sender: TCustomEasyListview; Item: TEasyItem);
    procedure ImageCategory_SelectorItemCheckChange(
      Sender: TCustomEasyListview; Item: TEasyItem);
    procedure LabelShowHideCategoriesMouseEnter(Sender: TObject);
    procedure LabelShowHideCategoriesMouseLeave(Sender: TObject);
    procedure LabelShowHideCategoriesClick(Sender: TObject);
    procedure ImageCategoryBackgroundColorSelect(Sender: TObject);
    procedure ButtonImageCategoryBackgroundColorResetClick(
      Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure SystemsItemPaintText(Sender: TCustomEasyListview;
      Item: TEasyItem; Position: Integer; ACanvas: TCanvas);
    procedure ButtonDefaultImageCategoryFolderClick(Sender: TObject);
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

    newSnapshotFolderArcade, ResetSnapshotFolderArcade: TImageFoldersArcade;
    newSnapshotFolderConsComp, ResetSnapshotFolderConsComp: TImageFoldersConsoleComputer;

    function  CheckSystemAndImageCatSelected: Boolean;
    procedure PopulateFolders;
    //procedure UpdateFolders;
    procedure UpdateImageCategories;
    procedure UpdateCategorySettingsIni;
    procedure ReadSnapDir_MAME;
    procedure UpdateSnapDir_MAME;
    procedure SetImageCategoryValues;
    procedure Resize4K;
  public
    { Public declarations }
  end;

var
  FormImageCategorySettings: TFormImageCategorySettings;

implementation

{$R *.dfm}

procedure TFormImageCategorySettings.Resize4K;
var
  iLeft: Integer;
begin
  if not Is4KMode then
     Exit;

  with FormImageCategorySettings do
  begin
    ClientWidth:= (156*15)+16; // 2340 + 16 = 2356; (15 system columns)
    Font.Size:= 16;

    FormMain.Set4KImageListSpecs(IL_Systems, 128);
    FormMain.Set4KImageListSpecs(IL_ImageCategory_ExtraLarge, 128);

    Systems.Font.Name:= FormMain.Get4KSystemFont;
    Systems.PaintInfoItem.IconViewRemoveIconTopBorder:= True;
    Systems.CellSizes.Icon.Width:=  156;
    Systems.CellSizes.Icon.Height:= 207+32+4;// = 243 // 32+4 (systype icon + border)

    Systems.BorderWidth:= 8;
    FormMain.Set4KListViewSpecs(Systems, 0, 0, (Systems.CellSizes.Icon.Width*15)+(Systems.BorderWidth*2)+20, (Systems.CellSizes.Icon.Height*5)+(Systems.BorderWidth*2), 16); // 15 columns, 5 lines

    FormMain.Set4KPanelSpecs(PanelSystemsTitleBottom, 0, Systems.Height, ClientWidth, -1);

    if not IsNightMode then
       begin
         SetPanelColors(PanelSystemsTitleBottom, $00e6e6e6, $00f1f1f1);
         SetPanelColors(PanelImageCategories, $00f1f1f1, -1, True);
       end;

    ImageCategory_Selector.CellSizes.Tile.Width:= 156+22+ImageCategory_Selector.PaintInfoItem.CheckIndent+ImageCategory_Selector.PaintInfoItem.ImageIndent;
    ImageCategory_Selector.CellSizes.Tile.Height:= 156;

    PanelImageCategories.Frames:= [];
    FormMain.Set4KPanelSpecs(PanelImageCategories, 0, PanelSystemsTitleBottom.Top+PanelSystemsTitleBottom.Height,
                             (ImageCategory_Selector.CellSizes.Tile.Width*9)+ 16,
                             (ImageCategory_Selector.CellSizes.Tile.Height*2)+16);

    ClientHeight:= PanelImageCategories.Top+PanelImageCategories.Height;

    ImageCategory_Selector.PaintInfoItem.CheckIndent:= 3; // ImageCategory_Selector.PaintInfoItem.ImageIndent:= 2;
    FormMain.Set4KListViewCheckBoxHDSpecs(ImageCategory_Selector);
    ImageCategory_Selector.Font.Name:= FormMain.Get4KSystemFont;

    FormMain.Set4KListViewSpecs(ImageCategory_Selector, 8, 8,
                                (ImageCategory_Selector.CellSizes.Tile.Width*9)+20,
                                (ImageCategory_Selector.CellSizes.Tile.Height*2), 16);

    PanelSystemsTitle.Visible:=       False;
    LabelSystemType.Visible:=         False;
    PanelCategoriesBottom.Visible:=   False;
    LabelSystemNotAvailable.Visible:= False;

    iLeft:= PanelImageCategories.Width;

    ButtonZippedImages.Parent:= PanelBottom;
    ButtonZippedImages.Caption:= 'Help';

    FormMain.Set4KPanelSpecs(PanelBottom, iLeft, ClientHeight-71, ClientWidth-iLeft, 71);
    FormMain.Set4KButtonsOkCancelPanel(PanelBottom, ButtonOk, ButtonCancel, False);
    FormMain.Set4KButtonSpecs(ButtonZippedImages, ButtonOk.Left-10-89, ButtonOk.Top, 89, 45, 16);
    PanelBottom.Frames:= [];
    //ButtonOk.Top:= 10;
    //ButtonCancel.Top:= 10;
    //ButtonZippedImages.Top:= 10;

    FormMain.Set4KLabelSpecs(LabelShowHideCategories, 10, 16, 246, 45, 16);

    LabelCategoryTitle.Parent:= FormImageCategorySettings;
    FormMain.Set4KLabelSpecs(LabelCategoryTitle, iLeft{+((ClientWidth-iLeft-200-10) div 2)}, PanelImageCategories.Top+10, 200, 28, 16);
    PanelSystemsTitle.Visible:= False;

    LabelSystemTitle.Parent:= FormImageCategorySettings;
    LabelSystemTitle.WordWrap:= False;
    FormMain.Set4KLabelSpecs(LabelSystemTitle, iLeft+400{ClientWidth-300-10}, LabelCategoryTitle.Top, 300, 28, 16);

    FormMain.Set4KButtonSpecs(ButtonImageCategoryBackgroundColorReset, ClientWidth-10-89,
                              LabelCategoryTitle.Top+LabelCategoryTitle.Height+20, 89, 36, 16);
    FormMain.Set4KColorBoxSpecs(ImageCategoryBackgroundColor, ButtonImageCategoryBackgroundColorReset.Left-5-312, ButtonImageCategoryBackgroundColorReset.Top);
    FormMain.Set4KLabelSpecs(LabelImageCategoryBackgroundColor, iLeft, ImageCategoryBackgroundColor.Top+3, -1, -1, 16);
    LabelImageCategoryBackgroundColor.Caption:= 'Image Background Color';

    LabelImageCategoryFolder.Parent:=         FormImageCategorySettings;
    ImageCategoryFolder.Parent:=              FormImageCategorySettings;
    ButtonSelectImageCategoryFolder.Parent:=  FormImageCategorySettings;
    ButtonClearImageCategoryFolder.Parent:=   FormImageCategorySettings;
    ButtonResetImageCategoryFolder.Parent:=   FormImageCategorySettings;
    ButtonDefaultImageCategoryFolder.Parent:= FormImageCategorySettings;

    FormMain.Set4KButtonSpecs(ButtonResetImageCategoryFolder, ButtonImageCategoryBackgroundColorReset.Left,
                              ButtonImageCategoryBackgroundColorReset.Top+ButtonImageCategoryBackgroundColorReset.Height+20, 89, 36, 16);

    FormMain.Set4KButtonSpecs(ButtonClearImageCategoryFolder,   ButtonResetImageCategoryFolder.Left-5-89, ButtonResetImageCategoryFolder.Top, 89, 36, 16);
    FormMain.Set4KButtonSpecs(ButtonDefaultImageCategoryFolder, ButtonClearImageCategoryFolder.Left-5-89, ButtonResetImageCategoryFolder.Top, 89, 36, 16);

    FormMain.Set4KButtonSpecs(ButtonSelectImageCategoryFolder, ButtonResetImageCategoryFolder.Left,
                              ButtonResetImageCategoryFolder.Top+ButtonResetImageCategoryFolder.Height+5, 89, 36, 16);

    FormMain.Set4KEditSpecs(ImageCategoryFolder, iLeft, ButtonSelectImageCategoryFolder.Top, (ButtonSelectImageCategoryFolder.Left-5)-iLeft, 36, 16);
    FormMain.Set4KLabelSpecs(LabelImageCategoryFolder, iLeft, ImageCategoryFolder.Top-36, -1, -1, 16);
    LabelImageCategoryFolder.Caption:= 'Image Folder [.png; .jpg]';
    LabelImageCategoryFolder.Hint:=    'Image Folder [%s]';

    FormMain.Set4KButtonSpecs(ImageSingleBackgroundColorButtonReset, ClientWidth-10-89,
                              ImageCategoryFolder.Top+ImageCategoryFolder.Height+20, 89, 36, 16);
    FormMain.Set4KColorBoxSpecs(ImageSingleBackgroundColor, ImageSingleBackgroundColorButtonReset.Left-5-312, ImageSingleBackgroundColorButtonReset.Top);
    FormMain.Set4KCheckBoxSpecs(ImageSingleBackgroundColorEnabled, iLeft, ImageSingleBackgroundColor.Top, 260, 36, 16);
  end;
end;

procedure TFormImageCategorySettings.PopulateFolders;
var
  LoopSys, LoopCategory: Integer;
begin
  ReadSnapDir_MAME; // read "snap_directory" from "mame.ini" (MAME/HBMAME)
  FormMain.ReadArcadeImageCategories(True, False, newSnapshotFolderArcade, False);
  for LoopSys:= 1 to MaxArcadeSystems do
  begin
    for LoopCategory:=Low(ImageCategoryArray) to High(ImageCategoryArray) do
        ResetSnapshotFolderArcade[LoopSys, LoopCategory]:= newSnapshotFolderArcade[LoopSys, LoopCategory];
  end;

  for LoopSys:= 1 to MaxConsoleComputerSystems do
  begin
    for LoopCategory:=Low(ImageCategoryArray) to High(ImageCategoryArray) do
    begin
      newSnapshotFolderConsComp[LoopSys, LoopCategory]:= SnapshotFolderCustom[LoopSys, LoopCategory];
      ResetSnapshotFolderConsComp[LoopSys, LoopCategory]:= SnapshotFolderCustom[LoopSys, LoopCategory];
    end;
  end;
end;

procedure TFormImageCategorySettings.UpdateImageCategories;
var
  LoopSys, LoopCategory: Integer;
  Item: TEasyItem;
begin
  // MAME / arcade (must update FormMain.imgFolder[] array, and update FormMain.imgFolderMAME[] TStringLists for MAME/HBMAME
  for LoopSys:= 1 to MaxArcadeSystems do
  begin
    for LoopCategory:=Low(ImageCategoryArray) to High(ImageCategoryArray) do
    begin
      if FormMain.imgFolder[LoopSys, LoopCategory] <> newSnapshotFolderArcade[LoopSys, LoopCategory] then
         begin
           if LoopCategory = 1 then
              FormMain.MenuImageCategorySettings.Tag:= 1;
           FormMain.imgFolder[LoopSys, LoopCategory]:= newSnapshotFolderArcade[LoopSys, LoopCategory];
           if FormMain.IsMAMEBasedSys(LoopSys) then
              begin
                FormMain.ExtractFolders2MAME(LoopSys, newSnapshotFolderArcade[LoopSys, LoopCategory],
                                             FormMain.imgFolderMAME[Ord(LoopSys <> idMAME)+1, LoopCategory], False);
              end;
         end;
    end;
  end;

  // console/computer (EmuCon)
  for LoopSys:= 1 to MaxConsoleComputerSystems do
  begin
    for LoopCategory:=Low(ImageCategoryArray) to High(ImageCategoryArray) do
    begin
      if SnapshotFolderCustom[LoopSys, LoopCategory] <> newSnapshotFolderConsComp[LoopSys, LoopCategory] then
         begin
           if LoopCategory = 1 then
              FormMain.MenuImageCategorySettings.Tag:= 1;
           SnapshotFolderCustom[LoopSys, LoopCategory]:= newSnapshotFolderConsComp[LoopSys, LoopCategory];
         end;
    end;
  end;

  Item:= ImageCategory_Selector.Groups.FirstItem;
  repeat
    // update img categories background color
    FormMain.ImageCategorySettings[Item.ImageIndex].BackgroundColor:= Item.Tag;
    FormMain.ImageCategorySettings[Item.ImageIndex].Visible:= Item.Checked; // show/hide categories in images buttons tool bar
    Item:= ImageCategory_Selector.Groups.NextItem(Item);
  until Item = nil;
  // update FormMain.imgFolder[] and uCommon.SnapshotFolderCustom[] arrays from temp image folder arrays
  // update category background colors from EasyListView to FormMain.ImageCategorySettings[] array
end;

procedure TFormImageCategorySettings.UpdateCategorySettingsIni;
var
  ImgIniFile: TMemIniFile;
  Loop: Integer;
  iSection: String;
begin
  // image category settings
  ImgIniFile:= TMemIniFile.Create(FormMain.GetImageCategorySettingsFile);
  if IsNightMode then
     iSection:= 'NightMode'
  else
     iSection:= 'Category';

  for Loop:=Low(ImageCategoryArray) to High(ImageCategoryArray) do
  begin
    //ImgIniFile.WriteInteger('Category', ImageCategoryArray[Loop, 1]+'_bkcolor', FormMain.ImageCategorySettings[Loop].BackgroundColor);
    ImgIniFile.WriteInteger(iSection, ImageCategoryArray[Loop, 1]+'_bkcolor', FormMain.ImageCategorySettings[Loop].BackgroundColor);
    if Loop <> 1 then
       ImgIniFile.WriteInteger('Category', ImageCategoryArray[Loop, 1]+'_enabled', Ord(FormMain.ImageCategorySettings[Loop].Visible));
  end;

  ImgIniFile.UpdateFile;
  FreeAndNil(ImgIniFile);
end;

procedure TFormImageCategorySettings.ReadSnapDir_MAME;

  function ReadEmuIni(sysID: Integer): Boolean;
  var
    MAMEIniFile: THashedStringList;
    TextLine, iniFile, EntryString, ValueToRead: String;
    Loop: Integer;
  begin
    Result:= FormMain.ValidateArcadeEmulatorFile(sysID);
    if not Result then
       Exit;

    iniFile:= FormMain.GetArcadeEmuIniFileName(sysID, FormMain.EmulatorFile[sysID]);
    if not FileExists(iniFile) then
       Exit;

    MAMEIniFile:= THashedStringList.Create;
    MAMEIniFile.LoadFromFile(iniFile);
    for Loop:=0 to MAMEIniFile.Count -1 do
    begin
      TextLine:= MAMEIniFile[Loop];
      if TextLine <> '' then
         begin
           EntryString:= XML_GetEntryName(TextLine)+' ';
           if EntryString = ImageCategoryArray[1, 4]+' ' then
              begin
                ValueToRead:= ExtractMAMEIniValue(TextLine);
                if ValueToRead = '' then
                   ValueToRead:= ImageCategoryArray[1, 3]; // set to default folder "snap"

                newSnapshotFolderArcade[sysID, 1]:= ValueToRead;
                ResetSnapshotFolderArcade[sysID, 1]:= ValueToRead;
              end;
         end;
    end;
    FreeAndNil(MAMEIniFile);
  end;

begin
  ReadEmuIni(idMAME);
  ReadEmuIni(idHBMAME);
end;

procedure TFormImageCategorySettings.UpdateSnapDir_MAME;
begin
  FormMain.UpdateMAMEsnapDir(newSnapshotFolderArcade[idMAME, 1], idMAME);
  FormMain.UpdateMAMEsnapDir(newSnapshotFolderArcade[idHBMAME, 1], idHBMAME);
end;

procedure TFormImageCategorySettings.SetImageCategoryValues;
begin
  if not FormMain.CheckSelected(ImageCategory_Selector) then
     Exit;

  if not FormMain.CheckSelected(Systems) then
     Exit;

  ImageCategoryBackgroundColor.Selected:= ImageCategory_Selector.Selection.First.Tag; // for img category background color
  // need to keep track of the selected system type (arcade or EmuCon)
  if FormMain.ELV_IsArcadeSystemSelected(Systems) then
     ImageCategoryFolder.Text:= newSnapshotFolderArcade[Systems.Tag, ImageCategory_Selector.Tag]
  else
     ImageCategoryFolder.Text:= newSnapshotFolderConsComp[Systems.Tag, ImageCategory_Selector.Tag];
end;

procedure TFormImageCategorySettings.SystemsItemSelectionChanged(
  Sender: TCustomEasyListview; Item: TEasyItem);
begin
  if Item.Selected then
     begin
       Systems.Tag:= FormMain.ELV_GetSystemTagMulti(Systems); // Systems.Tag:= Item.ImageIndex;
       if PanelSystemsTitle.Visible then
          begin
            FormMain.ELV_GetSystemTitle(Systems, Item, LabelSystemTitle, LabelSystemType);
            LabelSystemNotAvailable.Visible:= Item.Ghosted;
          end
       else
       if Is4KMode then
          LabelSystemTitle.Caption:= UpperCase(Item.Caption);
       SetImageCategoryValues;
     end;
end;

function TFormImageCategorySettings.CheckSystemAndImageCatSelected: Boolean;
begin
  Result:= FormMain.CheckSelected(Systems) and FormMain.CheckSelected(ImageCategory_Selector);
end;

procedure TFormImageCategorySettings.ImageCategoryFolderChange(Sender: TObject);
begin
  if CheckSystemAndImageCatSelected then
     begin
       if FormMain.ELV_IsArcadeSystemSelected(Systems) then
          begin
            if newSnapshotFolderArcade[Systems.Tag, ImageCategory_Selector.Tag] <> TEditEx(Sender).Text then
               newSnapshotFolderArcade[Systems.Tag, ImageCategory_Selector.Tag]:=  TEditEx(Sender).Text;
          end
       else
          begin
            if newSnapshotFolderConsComp[Systems.Tag, ImageCategory_Selector.Tag] <> TEditEx(Sender).Text then
               newSnapshotFolderConsComp[Systems.Tag, ImageCategory_Selector.Tag]:=  TEditEx(Sender).Text;
          end;
     end;
end;

procedure TFormImageCategorySettings.ButtonSelectImageCategoryFolderClick(
  Sender: TObject);
var
  iStr: String;
  IsMultiFolders: Boolean;
begin
  if CheckSystemAndImageCatSelected then
     begin
       IsMultiFolders:= False;
       iStr:= 'Select a folder for '+GetImageCategoryTitle(ImageCategory_Selector.Tag)+
              ' ['+GetSystemTypeTitle(Systems.Tag, FormMain.ELV_IsArcadeSystemSelected(Systems))+']'+#13#10;
       if FormMain.ELV_IsArcadeSystemSelected(Systems) then
          begin
            iStr:= iStr+FormMain.GetArcadeEmulatorDescription(Systems.Tag);
            IsMultiFolders:= FormMain.IsMAMEBasedSys(Systems.Tag);
          end
       else
          iStr:= iStr+SystemsListCustom[Systems.Tag, 0];

       FormMain.DialogSelectFolder(ImageCategoryFolder, IsMultiFolders, iStr);
     end
  else
     begin
       FormMain.ShowMessageBox('Error', 'Missing selection.', '    Either the system or image category is not selected! Aborting...');
     end;
end;

procedure TFormImageCategorySettings.FormShow(Sender: TObject);
begin
  Resize4K;
  FormMain.ELV_ResetNormalColors(Systems);
  FormMain.ELV_ResetNormalColors(ImageCategory_Selector);

  if IsNightMode then
     begin
       FormImageCategorySettings.Color:= menu_background_color[1];
       SetBottomPanelColors(PanelBottom);
       if not Is4KMode then
          PanelBottom.ColorFrame:= clrBorderGroupBoxGrayBk;

       FormMain.SetEasyListViewColors(Systems, clrBlackBk, clWhite);
       PanelSystemsTitle.Color1:= clrLightBlack;
       FormMain.SetSystemTitleLabelColors(LabelSystemTitle);
       FormMain.SetSystemTypeLabelColors(LabelSystemType);
       SetLabelColors(LabelSystemNotAvailable, clSilver, clNavy);

       PanelImageCategories.Color1:= menu_background_color[1];
       FormMain.SetEasyListViewColors(ImageCategory_Selector, menu_background_color[1], item_caption_active_color[1]);
       FormMain.ELV_SetCheckRadioCustomIcon(ImageCategory_Selector);

       FormMain.SetSystemTitleLabelColors(LabelCategoryTitle);
       SetLabelColors(LabelShowHideCategories, item_shortcut_color[1], item_shortcut_selected_color[1]);
       LabelShowHideCategories.Color:= clrDarkGray;
       LabelShowHideCategories.ColorFrame:= clrMedDarkGray;

       if PanelSystemsTitle.Visible then
          SetSystemTitleBarNightColors(PanelSystemsTitle, PanelSystemsTitleBottom, False)
       else
          SetSystemTitleBottomBarNightColors(PanelSystemsTitleBottom);

       PanelCategoriesBottom.Color1:= menu_background_color[1];

       SetLabelColors(LabelImageCategoryFolder,          item_caption_active_color[1], item_caption_active_shadow_color[1]);
       SetLabelColors(LabelImageCategoryBackgroundColor, item_caption_active_color[1], item_caption_active_shadow_color[1]);

       SetCheckBoxColors(ImageSingleBackgroundColorEnabled, item_caption_active_color[1], item_caption_active_shadow_color[1]);
       FormMain.SetCheckBoxExCustomIcon(ImageSingleBackgroundColorEnabled); 

       SetEditNightColors(ImageCategoryFolder);
       SetColorBoxColors(ImageCategoryBackgroundColor, True);
       SetColorBoxColors(ImageSingleBackgroundColor, True);
       FormMain.SetWin10DarkScrollBar(ImageCategoryBackgroundColor);
       FormMain.SetWin10DarkScrollBar(ImageSingleBackgroundColor);

       FormMain.SetButtonExColors(ButtonOk);
       FormMain.SetButtonExColors(ButtonCancel);
       FormMain.SetButtonExColors(ButtonSelectImageCategoryFolder);
       FormMain.SetButtonExColors(ButtonClearImageCategoryFolder);
       FormMain.SetButtonExColors(ButtonResetImageCategoryFolder);
       FormMain.SetButtonExColors(ImageSingleBackgroundColorButtonReset);
       FormMain.SetButtonExColors(ButtonDefaultImageCategoryFolder);
       FormMain.SetButtonExColors(ButtonImageCategoryBackgroundColorReset);
       FormMain.SetButtonExColors(ButtonZippedImages);

       FormMain.ELV_SetNightModeColors(ImageCategory_Selector);
       FormMain.ELV_SetNightModeColors(Systems);
     end;

  LoadCustomMAMEIconToForm(TForm(Sender));

  FormMain.LoadSystemsIcons(IL_Systems, False);
  FormMain.LoadNonArcadeSystemIcons(IL_Systems, False, False);

  FormMain.LoadCategoriesIcons(IL_ImageCategory_ExtraLarge);

  PopulateFolders;

  FormMain.ELV_PopulateImageCategory(ImageCategory_Selector, True, False, 0);

  FormMain.ELV_PopulateSystemsMulti(Systems, 1, True, True, True);
end;

procedure TFormImageCategorySettings.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if not CanClose then
     Exit;

  if FormImageCategorySettings.ModalResult = mrOk then
     begin
       UpdateImageCategories; // same as "UpdateFolder" function (update SnapshotFolderCustom[] array)
       UpdateSnapDir_MAME; // only if user click "Apply" button (MAME/arcade only)
       FormMain.WriteArcadeImageCategories(True, False, newSnapshotFolderArcade); // save category folders for MAME/arcade
       UpdateCustomSysImageFolders; // save changes to "sysimagefolders.ini" for console/computer
       UpdateCategorySettingsIni; // must be called AFTER "UpdateImageCategories" function
     end;
end;

procedure TFormImageCategorySettings.ButtonZippedImagesClick(Sender: TObject);
begin
  FormMain.InitMessageBox;

  FormMain.AddMsgText('    You can show/hide image categories, change their background color and select folders'+#13#10+#13#10);
  FormMain.AddMsgText('1.', MsgTxtColors.colorWarning, [fsBold]);
  FormMain.AddMsgText(' To setup folders, select a system, a category, then a folder where images are. Relative path is relative to the emulator directory. '+
                      'You can select multiple folders for MAME and HBMAME. Each folder must be separated by a ; char (semicolon)'+#13#10+#13#10);
  FormMain.AddMsgText('2.', MsgTxtColors.colorWarning, [fsBold]);
  FormMain.AddMsgText(' To hide a category, clear the checkbox on each of them. This setting is the same for all '+
                      'systems!'+#13#10+#13#10);
  FormMain.AddMsgText('3.', MsgTxtColors.colorWarning, [fsBold]);
  FormMain.AddMsgText(' To set a background color for each category, select a category and then the color of your choice. This setting '+
                      'is the same for all systems.'+#13#10+#13#10);
  FormMain.AddMsgText('4.', MsgTxtColors.colorWarning, [fsBold]);
  FormMain.AddMsgText(' Or if you prefer to use the same color for all categories, enable "Use A Single Background Color" setting and then '+
                      'select the color of your choice.'+#13#10+#13#10+
                      '    Image background colors and single background color settings are different for night mode and light mode, depending on what mode is active.'+#13+#10+
                      'When you''re done, click ');

  FormMain.AddMsgText('Apply', MsgTxtColors.colorFileName, [fsBold]);
  FormMain.AddMsgText(' button to save and apply changes or click ');
  FormMain.AddMsgText('Abort', MsgTxtColors.colorFileName, [fsBold]);
  FormMain.AddMsgText(' button to cancel any changes you''ve made.'+#13#10+#13#10+
                      '    Disabled systems are visible with ghosted icon and gray text, and you can change their settings, except folder paths for MAME/HBMAME.');
  FormMain.ShowMessageBox('Help', 'How to setup images.', '', 2);
end;

procedure TFormImageCategorySettings.ButtonClearImageCategoryFolderClick(
  Sender: TObject);
begin
  if CheckSystemAndImageCatSelected then
     ImageCategoryFolder.Text:= '';
end;

procedure TFormImageCategorySettings.ButtonResetImageCategoryFolderClick(
  Sender: TObject);
begin
  if CheckSystemAndImageCatSelected then
     begin
       if FormMain.ELV_IsArcadeSystemSelected(Systems) then
          ImageCategoryFolder.Text:= ResetSnapshotFolderArcade[Systems.Tag, ImageCategory_Selector.Tag]
       else
          ImageCategoryFolder.Text:= ResetSnapshotFolderConsComp[Systems.Tag, ImageCategory_Selector.Tag]
     end;
end;

procedure TFormImageCategorySettings.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #27 then
     ButtonCancel.Click;
end;

procedure TFormImageCategorySettings.ImageCategory_SelectorItemSelectionChanged(
  Sender: TCustomEasyListview; Item: TEasyItem);
var
  iColor: TColor;
begin
  if not Item.Selected then
     Exit;
  if not FormMain.CheckSelected(Systems) then
     Exit;
  ImageCategory_Selector.Tag:= Item.ImageIndex;
  LabelCategoryTitle.Caption:= UpperCase(GetImageCategoryTitle(Item.ImageIndex));

  if IsNightMode then
     iColor:= clCream
  else
     iColor:= clBlack;

  if ImageCategoryBackgroundColor.Font.Color <> iColor then
     ImageCategoryBackgroundColor.Font.Color:= iColor;

  if ImageCategoryFolder.Enabled then
     begin
       if ImageCategoryBackgroundColor.Font.Color <> iColor then
          ImageCategoryBackgroundColor.Font.Color:= iColor;
     end
  else
     ImageCategoryBackgroundColor.Font.Color:= clGray;

  if FormMain.ELV_IsArcadeSystemSelected(Systems) then
  begin
    case FormMain.ImagesPNGOnly(ImageCategory_Selector.Tag) of
      True : LabelImageCategoryFolder.Caption:= Format(LabelImageCategoryFolder.Hint, ['.png']);
      False: LabelImageCategoryFolder.Caption:= Format(LabelImageCategoryFolder.Hint, ['.png; .jpg']);
    end;
  end
  else
     LabelImageCategoryFolder.Caption:= Format(LabelImageCategoryFolder.Hint, ['.png; .jpg']);

  SetImageCategoryValues;
end;

procedure TFormImageCategorySettings.ImageCategory_SelectorItemCheckChange(
  Sender: TCustomEasyListview; Item: TEasyItem);
begin
  if Item.Index = 1 then
     begin
       if not Item.Checked then
          Item.Checked:= True;
     end;

  case Item.Checked of
    True : Item.State:= Item.State-[esosGhosted];
    False: Item.State:= Item.State+[esosGhosted];
  end;
  if Item.Selected then
     Item.Invalidate(True);
end;

procedure TFormImageCategorySettings.LabelShowHideCategoriesMouseEnter(
  Sender: TObject);
begin
  if IsNightMode then
     SetLabelColors(TShadowLabel(Sender), clCream)
  else
     TShadowLabel(Sender).Font.Color:= clBlue;
end;

procedure TFormImageCategorySettings.LabelShowHideCategoriesMouseLeave(
  Sender: TObject);
begin
  if IsNightMode then
     SetLabelColors(TShadowLabel(Sender), item_shortcut_color[1], item_shortcut_selected_color[1])
  else
     TShadowLabel(Sender).Font.Color:= MsgTxtColors.colorFileName;
end;

procedure TFormImageCategorySettings.LabelShowHideCategoriesClick(
  Sender: TObject);
var
  Item: TEasyItem;
begin
  ImageCategory_Selector.BeginUpdate;
  Item:= ImageCategory_Selector.Groups.FirstItem;
  repeat
    if Item.ImageIndex <> 1 then // In-Game Snapshot cannot be disabled
       Item.Checked:= Boolean(TShadowLabel(Sender).Tag);
    Item:= ImageCategory_Selector.Groups.NextItem(Item);
  until Item = nil;
  ImageCategory_Selector.EndUpdate;
  TShadowLabel(Sender).Tag:= Ord(not Boolean(TShadowLabel(Sender).Tag));
  case TShadowLabel(Sender).Tag of
    0: TShadowLabel(Sender).Caption:= 'HIDE ALL CATEGORIES';
    1: TShadowLabel(Sender).Caption:= 'SHOW ALL CATEGORIES';
  end;
  ImageCategory_Selector.SetFocus;
end;

procedure TFormImageCategorySettings.ImageCategoryBackgroundColorSelect(
  Sender: TObject);
begin
  if FormMain.CheckSelected(ImageCategory_Selector) then
     ImageCategory_Selector.Selection.First.Tag:= ImageCategoryBackgroundColor.Selected;
end;

procedure TFormImageCategorySettings.ButtonImageCategoryBackgroundColorResetClick(
  Sender: TObject);
begin
  if FormMain.CheckSelected(ImageCategory_Selector) then
     ImageCategoryBackgroundColor.Selected:= FormMain.ImageCategorySettings[ImageCategory_Selector.Selection.First.ImageIndex].BackgroundColor;
end;

procedure TFormImageCategorySettings.FormActivate(Sender: TObject);
begin
  if Tag = 1 then
     Exit;

  FormMain.ELV_FindSelectedSystemMulti(Systems, FormMain.SelectedEasyItem);
  if FormMain.IsSingleImageLayout then
     FormMain.ELV_SelectItem(ImageCategory_Selector, FormMain.ButtonImageCategory.Tag)
  else
     FormMain.ELV_SelectItem(ImageCategory_Selector, 1);

  ImageCategory_Selector.SetFocus;
  Tag:= 1;
end;

procedure TFormImageCategorySettings.SystemsItemPaintText(
  Sender: TCustomEasyListview; Item: TEasyItem; Position: Integer;
  ACanvas: TCanvas);
begin
  FormMain.ELV_SetGhostedIconText(Item, Systems, ACanvas);
end;

procedure TFormImageCategorySettings.ButtonDefaultImageCategoryFolderClick(
  Sender: TObject);
begin
  if CheckSystemAndImageCatSelected then
     ImageCategoryFolder.Text:= ImageCategoryArray[ImageCategory_Selector.Tag, 3];
end;

procedure TFormImageCategorySettings.SystemsItemImageDraw(
  Sender: TCustomEasyListview; Item: TEasyItem; Column: TEasyColumn;
  ACanvas: TCanvas; const RectArray: TEasyRectArrayObject;
  AlphaBlender: TEasyAlphaBlender);
begin
  if Is4KMode then
     FormMain.ELV_DrawIconSystem_CustomSysType(Sender, Item, Column, ACanvas, RectArray, IL_Systems, True);
end;

procedure TFormImageCategorySettings.SystemsItemImageDrawIsCustom(
  Sender: TCustomEasyListview; Item: TEasyItem; Column: TEasyColumn;
  var IsCustom: Boolean);
begin
  //Exit; // debugging
  if Is4KMode then
     IsCustom:= True;
end;

procedure TFormImageCategorySettings.SystemsItemImageGetSize(
  Sender: TCustomEasyListview; Item: TEasyItem; Column: TEasyColumn;
  var ImageWidth, ImageHeight: Integer);
begin
  //Exit; // debugging
  if Is4KMode then
     begin
       ImageWidth:=  IL_Systems.Width;            // 4K mode = 32x32  - normal mode = 16x16
       ImageHeight:= IL_Systems.Height+FormMain.IL_GroupedMode.Width;
       ImageHeight:= ImageHeight+4; // 4 -> space between sys icon / sys type icon
     end;
end;

end.

