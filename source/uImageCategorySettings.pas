unit uImageCategorySettings;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, uCommon, uCommonCustom, StdCtrls, Buttons, MPCommonObjects, EasyListview,
  ShadowLabel, ExtCtrls, PanelEx, ImgList;

type
  TFormImageCategorySettings = class(TForm)
    Systems: TEasyListview;
    IL_Systems: TImageList;
    IL_ImageCategory_ExtraLarge: TImageList;
    PanelImageCategories: TPanelEx;
    ImageCategory_Selector: TEasyListview;
    PanelImageCategorySelector: TPanelEx;
    LabelImageCategoryFolder: TShadowLabel;
    ButtonResetImageCategoryFolder: TBitBtn;
    ButtonClearImageCategoryFolder: TBitBtn;
    ButtonImageCategoryFolder: TBitBtn;
    ImageCategoryFolder: TEdit;
    LabelShowHideCategories: TShadowLabel;
    LabelImageBackgroundColor: TShadowLabel;
    ImageCategoryBackgroundColor: TColorBox;
    ButtonImageCategoryBackgroundColorReset: TBitBtn;
    ButtonDefaultImageCategoryFolder: TBitBtn;
    LabelCategoryTitle: TShadowLabel;
    LabelEmuTitle: TShadowLabel;
    ButtonZippedImages: TBitBtn;
    ButtonOk: TBitBtn;
    ButtonCancel: TBitBtn;
    LabelSystemType: TShadowLabel;
    LabelSystemNotAvailable: TShadowLabel;
    SystemTitlePanel: TPanelEx;
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
  private
    { Private declarations }
    newSnapshotFolderArcade: packed array[1..MaxArcadeSystems] of packed array[0..High(ImageCategoryArray)-1] of String;
    newSnapshotFolderConsComp: packed array[1..MaxConsoleComputerSystems] of packed array[0..High(ImageCategoryArray)-1] of String;
    //UpdateFolderArcade: packed

    procedure ResizeForm;
    function  CheckSystemAndImageCatSelected: Boolean;
    procedure PopulateFolders;
    //procedure UpdateFolders;
    procedure UpdateImageCategories;
    procedure UpdateSnapDir_MAME;
    procedure SetImageCategoryValues;
  public
    { Public declarations }
  end;

var
  FormImageCategorySettings: TFormImageCategorySettings;

implementation

uses uMain;

{$R *.dfm}

procedure TFormImageCategorySettings.PopulateFolders;
var
  LoopSys, LoopCategory: Integer;
begin
  for LoopSys:= 1 to MaxArcadeSystems do
  begin
    for LoopCategory:= 0 to High(ImageCategoryArray)-1 do
        newSnapshotFolderArcade[LoopSys, LoopCategory]:= FormMain.imgFolder[LoopSys, LoopCategory];
  end;

  for LoopSys:= 1 to MaxConsoleComputerSystems do
  begin
    for LoopCategory:= 0 to High(ImageCategoryArray)-1 do
        newSnapshotFolderConsComp[LoopSys, LoopCategory]:= SnapshotFolderCustom[LoopSys, LoopCategory];
  end;
end;

procedure TFormImageCategorySettings.UpdateImageCategories;
var
  LoopSys, LoopCategory: Integer;
  Item: TEasyItem;
begin
  // MAME / arcade
  for LoopSys:= 1 to MaxArcadeSystems do
  begin
    for LoopCategory:=0 to High(ImageCategoryArray)-1 do
    begin
      if FormMain.imgFolder[LoopSys, LoopCategory] <> newSnapshotFolderArcade[LoopSys, LoopCategory] then
         FormMain.imgFolder[LoopSys, LoopCategory]:= newSnapshotFolderArcade[LoopSys, LoopCategory];
    end;
  end;

  // console/computer (EmuCon)
  for LoopSys:= 1 to MaxConsoleComputerSystems do
  begin
    for LoopCategory:=0 to High(ImageCategoryArray)-1 do
    begin
      if SnapshotFolderCustom[LoopSys, LoopCategory] <> newSnapshotFolderConsComp[LoopSys, LoopCategory] then
         SnapshotFolderCustom[LoopSys, LoopCategory]:= newSnapshotFolderConsComp[LoopSys, LoopCategory];
    end;
  end;

  FormMain.PopupMenuImageCategories.BeginUpdate;
  Item:= ImageCategory_Selector.Groups.FirstItem;
  repeat
    // update img categories background color
    if FormMain.PopupMenuImageCategories.Items[Item.ImageIndex].Tag <> Item.Tag then
       FormMain.PopupMenuImageCategories.Items[Item.ImageIndex].Tag:= Item.Tag;

    FormMain.PopupMenuImageCategories.Items[Item.ImageIndex].Visible:= Item.Checked; // show/hide categories in images buttons tool bar

    Item:= ImageCategory_Selector.Groups.NextItem(Item);
  until Item = nil;

  FormMain.PopupMenuImageCategories.EndUpdate;
  // update FormMain.imgFolder[] and uCommon.SnapshotFolderCustom[] arrays from temp image folder arrays
  // update category background colors (from EasyListView to FormMain.PopupMenuImageCategories)
end;

procedure TFormImageCategorySettings.UpdateSnapDir_MAME;
begin
  FormMain.UpdateMAMEsnapDir(FormMain.imgFolder[idMAME, 1], idMAME);
  FormMain.UpdateMAMEsnapDir(FormMain.imgFolder[idHBMAME, 1], idHBMAME);
end;

procedure TFormImageCategorySettings.SetImageCategoryValues;
begin
  if not FormMain.CheckSelected(ImageCategory_Selector) then
     Exit;

  if not FormMain.CheckSelected(Systems) then
     Exit;
  if ImageCategory_Selector.Tag < High(ImageCategoryArray) then
     begin
       ImageCategoryBackgroundColor.Selected:= ImageCategory_Selector.Selection.First.Tag; // for img category background color
       // need to keep track of the selected system type (arcade or EmuCon)
       if FormMain.ELV_IsArcadeSystemSelected(Systems) then
          ImageCategoryFolder.Text:= newSnapshotFolderArcade[Systems.Tag, ImageCategory_Selector.Tag]
       else
          ImageCategoryFolder.Text:= newSnapshotFolderConsComp[Systems.Tag, ImageCategory_Selector.Tag];
     end;
end;

procedure TFormImageCategorySettings.SystemsItemSelectionChanged(
  Sender: TCustomEasyListview; Item: TEasyItem);
begin
  if Item.Selected then
     begin
       Systems.Tag:= FormMain.ELV_GetSystemTagMulti(Systems); // Systems.Tag:= Item.ImageIndex;
       FormMain.ELV_GetSystemTitle(Systems, Item, LabelEmuTitle, LabelSystemType);
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
  // new RAM var so user can abort changes (February 10, 2017)
  if CheckSystemAndImageCatSelected then
     begin
       if FormMain.ELV_IsArcadeSystemSelected(Systems) then
          begin
            if newSnapshotFolderArcade[Systems.Tag, ImageCategory_Selector.Tag] <> TEdit(Sender).Text then
               newSnapshotFolderArcade[Systems.Tag, ImageCategory_Selector.Tag]:= TEdit(Sender).Text;
          end
       else
          begin
            if newSnapshotFolderConsComp[Systems.Tag, ImageCategory_Selector.Tag] <> TEdit(Sender).Text then
               newSnapshotFolderConsComp[Systems.Tag, ImageCategory_Selector.Tag]:= TEdit(Sender).Text;
          end;
     end;
end;

procedure TFormImageCategorySettings.ButtonImageCategoryFolderClick(
  Sender: TObject);
var
  iStr: String;
begin
  if CheckSystemAndImageCatSelected then
     begin
       iStr:= 'Select a folder for '+FormMain.PopupMenuImageCategories.Items[ImageCategory_Selector.Tag].Caption+
              ' ['+GetSystemTypeTitle(Systems.Tag, FormMain.ELV_IsArcadeSystemSelected(Systems))+']'+#13#10;
       if FormMain.ELV_IsArcadeSystemSelected(Systems) then
          iStr:= iStr+FormMain.GetArcadeEmulatorDescription(Systems.Tag)
       else
          iStr:= iStr+SystemsListCustom[Systems.Tag, 0];

       FormMain.DialogSelectFolder(ImageCategoryFolder, False, iStr);
     end
  else
     begin
       GenerateMessage('Error', 'Missing selection.', '    Either the system or image category is not selected! Aborting...');
     end;

     //FormMain.DialogSelectFolder(ImageCategoryFolder, False, 'Select a folder for '+
     //                            FormMain.PopupMenuImageCategories.Items[ImageCategory_Selector.Tag].Caption+' ['+GetSystemTypeTitle();
end;

procedure TFormImageCategorySettings.ResizeForm;
var
  iDiff: Integer;
begin
  if Screen.Height = 720 then
     begin
       iDiff:= FormImageCategorySettings.Height-675;
       FormImageCategorySettings.Height:= 675; // 694;

       Systems.Width:= Systems.Width+Systems.CellSizes.Icon.Width;
       Systems.Height:= Systems.Height-iDiff+LabelEmuTitle.Height;// FormImageCategorySettings.ClientHeight;
       PanelImageCategories.Left:= PanelImageCategories.Left+Systems.CellSizes.Icon.Width-1;
       //PanelImageCategorySelector.Height:= PanelImageCategorySelector.Height-19;
       FormImageCategorySettings.ClientWidth:= FormImageCategorySettings.ClientWidth+Systems.CellSizes.Icon.Width;
       //PanelBottomButtons.Top:= PanelBottomButtons.Top-19;//82;

       SystemTitlePanel.Color1:= clWhite;
       SystemTitlePanel.Width:= 432;
       SystemTitlePanel.Height:= 40;
       SystemTitlePanel.Top:= PanelImageCategories.Top-SystemTitlePanel.Height;
       SystemTitlePanel.Left:= 568;
       SystemTitlePanel.Visible:= True;

       LabelEmuTitle.Parent:= SystemTitlePanel;
       LabelSystemType.Parent:= SystemTitlePanel;
       LabelSystemNotAvailable.Parent:= SystemTitlePanel;

       LabelSystemType.Top:= 0;
       LabelSystemNotAvailable.Top:= 0;
       LabelSystemNotAvailable.Left:= SystemTitlePanel.Width-LabelSystemNotAvailable.Width-32;

       ButtonZippedImages.Left:= ButtonZippedImages.Left+Systems.CellSizes.Icon.Width;
       ButtonOk.Left:= ButtonOk.Left+Systems.CellSizes.Icon.Width;
       ButtonCancel.Left:= ButtonCancel.Left+Systems.CellSizes.Icon.Width;

       //LabelRelativePathsTip.Top:= LabelRelativePathsTip.Top-12;
       //LabelZippedFilesTip.Top:= LabelZippedFilesTip.Top-12;
       //LabelGameSnapUsedByVideoPreviewTip.Top:= LabelGameSnapUsedByVideoPreviewTip.Top-12;

       //{for Loop:=0 to FormCustomSnapshotsSettings.ControlCount-1 do
       //begin
       //  if (FormCustomSnapshotsSettings.Controls[Loop].Name <> 'Systems') and
       //     (FormCustomSnapshotsSettings.Controls[Loop].Name <> 'ButtonOk') and
       //     (FormCustomSnapshotsSettings.Controls[Loop].Name <> 'ButtonCancel') then
       //     FormCustomSnapshotsSettings.Controls[Loop].Left:= FormCustomSnapshotsSettings.Controls[Loop].Left+Systems.CellSizes.Icon.Width;
       //end;
     end;
end;

procedure TFormImageCategorySettings.FormShow(Sender: TObject);
begin
  LoadCustomMAMEIconToForm(TForm(Sender));
  ResizeForm;

  FormMain.LoadSystemsIcons(IL_Systems, False);
  FormMain.LoadNonArcadeSystemIcons(IL_Systems, False, False);

  FormMain.LoadCategoriesIcons(IL_ImageCategory_ExtraLarge);

  FormMain.ELV_ResetNormalColors(Systems);
  FormMain.ELV_ResetNormalColors(ImageCategory_Selector);

  PopulateFolders;

  FormMain.ELV_PopulateImageCategory(ImageCategory_Selector, 0);
  //ImageCategory_Selector.Items[High(ImageCategoryArray)].Enabled:= False; // needed for arcade systems; does nothing for console/computer systems

  FormMain.ELV_PopulateSystemsMulti(Systems, 1, True, True, True);

  //ELV_PopulateCustomSystems(Systems, -1, -1, True); // no longer used

  //case FormMain.CheckSelected(FormMain.GamesListView) of
  //  True : FormMain.ELV_PopulateSystems(Systems, FormMain.MemGameInfo.eSystemID, -1, True);
  //  False: FormMain.ELV_PopulateSystems(Systems, -1, -1, True);
  //end;
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
       FormMain.WriteImageCategories(True, False); // save category folders for MAME/arcade
       UpdateCustomSysImageFolders; // save changes to "sysimagefolders.ini" for console/computer
     end;
end;

procedure TFormImageCategorySettings.ButtonZippedImagesClick(Sender: TObject);
begin
  CallMessageBox;
  FormMain.AddMsgText('    You can show/hide image categories, change their background color and select folders'+#13#10+#13#10+
                      '1. To setup folders, select a system, a category, then a folder where images are. Relative path is relative to the emulator directory.'+#13#10+#13#10+
                      '2. To hide a category, clear the checkbox on each of them. This setting is the same for all '+
                      'systems!'+#13#10+#13#10+
                      '3. To set a background color, select a category and then the color of your choice. This setting '+
                      'is the same for all systems!'+#13#10+#13#10+
                      '    When you''re done, click ');
  FormMain.AddMsgText('Apply', $00a65300, [fsBold]);
  FormMain.AddMsgText(' button to save and apply changes or click ');
  FormMain.AddMsgText('Abort', $00a65300, [fsBold]);
  FormMain.AddMsgText(' button to cancel any changes you''ve made.');
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
          ImageCategoryFolder.Text:= FormMain.imgFolder[Systems.Tag, ImageCategory_Selector.Tag]
       else
          ImageCategoryFolder.Text:= SnapshotFolderCustom[Systems.Tag, ImageCategory_Selector.Tag];
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
begin
  if not Item.Selected then
     Exit;
  if not FormMain.CheckSelected(Systems) then
     Exit;
  ImageCategory_Selector.Tag:= Item.ImageIndex;
  LabelCategoryTitle.Caption:= UpperCase(FormMain.PopupMenuImageCategories.Items[Item.ImageIndex].Caption); // no longer needed, img_cat caption is in the icon anyway... (February 12, 2017)
  if ImageCategory_Selector.Tag = High(ImageCategoryArray) then
     LabelCategoryTitle.Caption:= LabelCategoryTitle.Caption+' (MAME / SOFTWARE LIST)';

  ImageCategoryFolder.Enabled:= ImageCategory_Selector.Tag < High(ImageCategoryArray);
  LabelImageCategoryFolder.Enabled:= ImageCategoryFolder.Enabled;
  ButtonImageCategoryFolder.Enabled:= ImageCategoryFolder.Enabled;
  ButtonClearImageCategoryFolder.Enabled:= ImageCategoryFolder.Enabled;
  ButtonResetImageCategoryFolder.Enabled:= ImageCategoryFolder.Enabled;
  ButtonDefaultImageCategoryFolder.Enabled:= ImageCategoryFolder.Enabled;

  ImageCategoryBackgroundColor.Enabled:= ImageCategoryFolder.Enabled;
  LabelImageBackgroundColor.Enabled:= ImageCategoryFolder.Enabled;
  ButtonImageCategoryBackgroundColorReset.Enabled:= ImageCategoryFolder.Enabled;

  if ImageCategoryBackgroundColor.Font.Color <> clBlack then
     ImageCategoryBackgroundColor.Font.Color:= clBlack;

  if ImageCategoryFolder.Enabled then
     begin
       if ImageCategoryBackgroundColor.Font.Color <> clBlack then
          ImageCategoryBackgroundColor.Font.Color:= clBlack;
     end
  else
     ImageCategoryBackgroundColor.Font.Color:= clGray;

  if FormMain.ELV_IsArcadeSystemSelected(Systems) then
  begin
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
  end
  else
  begin
    if ImageCategory_Selector.Tag < High(ImageCategoryArray) then
       LabelImageCategoryFolder.Caption:= Format(LabelImageCategoryFolder.Hint, ['.png; .jpg']);
  end;
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
  TShadowLabel(Sender).Font.Color:= clBlue;
end;

procedure TFormImageCategorySettings.LabelShowHideCategoriesMouseLeave(
  Sender: TObject);
begin
  TShadowLabel(Sender).Font.Color:= $00a65300;
end;

procedure TFormImageCategorySettings.LabelShowHideCategoriesClick(
  Sender: TObject);
var
  Item: TEasyItem;
begin
  ImageCategory_Selector.BeginUpdate;
  Item:= ImageCategory_Selector.Groups.FirstItem;
  repeat
    if not (Item.ImageIndex in [1, High(ImageCategoryArray)]) then
       Item.Checked:= Boolean(TShadowLabel(Sender).Tag);
    Item:= ImageCategory_Selector.Groups.NextItem(Item);
  until Item = nil;
  ImageCategory_Selector.EndUpdate;
  TShadowLabel(Sender).Tag:= Ord(not Boolean(TShadowLabel(Sender).Tag));
  case TShadowLabel(Sender).Tag of
    0: TShadowLabel(Sender).Caption:= 'CLICK HERE TO HIDE ALL CATEGORIES';
    1: TShadowLabel(Sender).Caption:= 'CLICK HERE TO SHOW ALL CATEGORIES';
  end;
  ImageCategory_Selector.SetFocus;
end;

procedure TFormImageCategorySettings.ImageCategoryBackgroundColorSelect(
  Sender: TObject);
begin
  // do not change the color .Tag in FormMain.PopupMenuImageCategories;
  // this will only be done if user clicks OK button; clicking Abort button does not update it
  // I can use "ImageCategory_Selector.Selection.First.Tag" to hold the new value instead of using a new array var
  if FormMain.CheckSelected(ImageCategory_Selector) then
     ImageCategory_Selector.Selection.First.Tag:= ImageCategoryBackgroundColor.Selected;
end;

procedure TFormImageCategorySettings.ButtonImageCategoryBackgroundColorResetClick(
  Sender: TObject);
begin
  if FormMain.CheckSelected(ImageCategory_Selector) then
     ImageCategoryBackgroundColor.Selected:= FormMain.PopupMenuImageCategories.Items[ImageCategory_Selector.Selection.First.ImageIndex].Tag;
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

end.
