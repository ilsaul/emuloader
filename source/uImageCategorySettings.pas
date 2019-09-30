unit uImageCategorySettings;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, uCommon, uCommonCustom, StdCtrls, Buttons, MPCommonObjects, EasyListview,
  ShadowLabel, ExtCtrls, PanelEx, ImgList, IniFiles, uMain, EditEx,
  ButtonsEx, ColorBoxEx, AdvOfficeButtons;

type
  TFormImageCategorySettings = class(TForm)
    Systems: TEasyListview;
    IL_Systems: TImageList;
    IL_ImageCategory_ExtraLarge: TImageList;
    PanelImageCategories: TPanelEx;
    ImageCategory_Selector: TEasyListview;
    PanelSystemTitle: TPanelEx;
    PanelImageCategorySelector: TPanelEx;
    LabelImageCategoryFolder: TShadowLabel;
    ButtonResetImageCategoryFolder: TBitBtnEx;
    ButtonClearImageCategoryFolder: TBitBtnEx;
    ButtonImageCategoryFolder: TBitBtnEx;
    ImageCategoryFolder: TEditEx;
    ButtonDefaultImageCategoryFolder: TBitBtnEx;
    ButtonZippedImages: TBitBtnEx;
    ButtonOk: TBitBtnEx;
    ButtonCancel: TBitBtnEx;
    PanelCategoriesBottom: TPanelEx;
    LabelSystemType: TShadowLabel;
    LabelSystemTitle: TShadowLabel;
    LabelSystemNotAvailable: TShadowLabel;
    LabelShowHideCategories: TShadowLabel;
    PanelCategoryTitle: TPanelEx;
    LabelCategoryTitle: TShadowLabel;
    PanelCategoryTitleBottom: TPanelEx;
    ImageCategoryBackgroundColor: TColorBoxEx;
    LabelImageBackgroundColor: TShadowLabel;
    ButtonImageCategoryBackgroundColorReset: TBitBtnEx;
    ImageSingleBackgroundColor: TColorBoxEx;
    ImageSingleBackgroundColorButtonReset: TBitBtnEx;
    ImageSingleBackgroundColorEnabled: TAdvOfficeCheckBoxEx;
    procedure SystemsItemSelectionChanged(Sender: TCustomEasyListview;
      Item: TEasyItem);
    procedure ImageCategoryFolderChange(Sender: TObject);
    procedure ButtonImageCategoryFolderClick(Sender: TObject);
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
  public
    { Public declarations }
  end;

var
  FormImageCategorySettings: TFormImageCategorySettings;

implementation

{$R *.dfm}

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
       FormMain.ELV_GetSystemTitle(Systems, Item, LabelSystemTitle, LabelSystemType);
       SetImageCategoryValues;
       LabelSystemNotAvailable.Visible:= Item.Ghosted; 
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
               newSnapshotFolderArcade[Systems.Tag, ImageCategory_Selector.Tag]:= TEditEx(Sender).Text;
          end
       else
          begin
            if newSnapshotFolderConsComp[Systems.Tag, ImageCategory_Selector.Tag] <> TEditEx(Sender).Text then
               newSnapshotFolderConsComp[Systems.Tag, ImageCategory_Selector.Tag]:= TEditEx(Sender).Text;
          end;
     end;
end;

procedure TFormImageCategorySettings.ButtonImageCategoryFolderClick(
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
       GenerateMessage('Error', 'Missing selection.', '    Either the system or image category is not selected! Aborting...');
     end;
end;

procedure TFormImageCategorySettings.FormShow(Sender: TObject);
begin
  if IsNightMode then
     begin
       FormImageCategorySettings.Color:= menu_background_color[1];
       SetBottomPanelColors(PanelImageCategorySelector); // SetPanelColors(PanelImageCategorySelector, menu_background_color[1], clrMedDarkGray);

       FormMain.SetEasyListViewColors(Systems, clrBlackBk, clWhite);
       PanelSystemTitle.Color1:= clrLightBlack;
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

       SetSystemTitleBarNightColors(PanelCategoryTitle, FormImageCategorySettings.PanelCategoryTitleBottom, False);
       PanelCategoriesBottom.Color1:= menu_background_color[1];

       SetLabelColors(LabelImageCategoryFolder,  item_caption_active_color[1], item_caption_active_shadow_color[1]);
       SetLabelColors(LabelImageBackgroundColor, item_caption_active_color[1], item_caption_active_shadow_color[1]);

       SetCheckBoxColors(ImageSingleBackgroundColorEnabled, item_caption_active_color[1], item_caption_active_shadow_color[1]);
       FormMain.SetCheckBoxExCustomIcon(ImageSingleBackgroundColorEnabled); 

       SetEditNightColors(ImageCategoryFolder);
       SetColorBoxColors(ImageCategoryBackgroundColor, True);
       SetColorBoxColors(ImageSingleBackgroundColor, True);

       FormMain.SetButtonExColors(ButtonOk);
       FormMain.SetButtonExColors(ButtonCancel);
       FormMain.SetButtonExColors(ButtonImageCategoryFolder);
       FormMain.SetButtonExColors(ButtonClearImageCategoryFolder);
       FormMain.SetButtonExColors(ButtonResetImageCategoryFolder);
       FormMain.SetButtonExColors(ImageSingleBackgroundColorButtonReset);
       FormMain.SetButtonExColors(ButtonDefaultImageCategoryFolder);
       FormMain.SetButtonExColors(ButtonImageCategoryBackgroundColorReset);
       FormMain.SetButtonExColors(ButtonZippedImages);
     end;

  LoadCustomMAMEIconToForm(TForm(Sender));

  FormMain.LoadSystemsIcons(IL_Systems, False);
  FormMain.LoadNonArcadeSystemIcons(IL_Systems, False, False);

  FormMain.LoadCategoriesIcons(IL_ImageCategory_ExtraLarge);

  FormMain.ELV_ResetNormalColors(Systems);
  FormMain.ELV_ResetNormalColors(ImageCategory_Selector);

  if IsNightMode then
     begin
       FormMain.ELV_SetNightModeColors(ImageCategory_Selector);
       FormMain.ELV_SetNightModeColors(Systems);
     end;

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
  CallMessageBox;
  FormMain.AddMsgText('    You can show/hide image categories, change their background color and select folders'+#13#10+#13#10+
                      '1. To setup folders, select a system, a category, then a folder where images are. Relative path is relative to the emulator directory. '+
                      'You can select multiple folders for MAME and HBMAME. Each folder must be separated by a ; char (semicolon)'+#13#10+#13#10+
                      '2. To hide a category, clear the checkbox on each of them. This setting is the same for all '+
                      'systems!'+#13#10+#13#10+
                      '3. To set a background color for each category, select a category and then the color of your choice. This setting '+
                      'is the same for all systems.'+#13#10+#13#10+
                      '4. Or if you prefer to use the same color for all categories, enable "Use A Single Background Color" setting and then '+
                      'select the color of your choice.'+#13#10+#13#10+
                      '    Image background colors and single background color settings are different for night mode and light mode, depending on what mode is active.'+#13+#10+
                      'When you''re done, click ');
  FormMain.AddMsgText('Apply', MsgTxtColors.colorFileName, [fsBold]);
  FormMain.AddMsgText(' button to save and apply changes or click ');
  FormMain.AddMsgText('Abort', MsgTxtColors.colorFileName, [fsBold]);
  FormMain.AddMsgText(' button to cancel any changes you''ve made.'+#13#10+#13#10+
                      '    Disabled systems are visible with ghosted icon and gray text, and you can change their settings, except folder paths for MAME/HBMAME.');
  GenerateMessage('Help', 'How to setup images.', '', 2);
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

end.

