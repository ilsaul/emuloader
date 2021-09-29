unit uPreferences;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  ExtCtrls, StdCtrls, ComCtrls, Menus, IniFiles, MPCommonObjects, EasyListview,
  GR32_RangeBars, ButtonsEx, ShadowLabel, PanelEx, Buttons, BarMenus, GraphicEx,
  SplitterEx, AdvOfficeButtons, ShellAPI, EditEx, ColorBoxEx, Themes;

type
  TFormPreferences = class(TForm)
    PanelTabButtons: TPanelEx;
    ButtonPage1: TSpeedButtonEx;
    ButtonPage2: TSpeedButtonEx;
    PanelPage2: TPanelEx;
    ToolBarBackgroundColorsBox: TPanelEx;
    ToolBarBackgroundColorsBoxLabel: TShadowLabel;
    ToolBarBkBottomColorLabel: TShadowLabel;
    ToolBarBkTopColorLabel: TShadowLabel;
    ToolBarGradientBar: TAdvOfficeCheckBoxEx;
    ToolBarBkTopColor: TColorBoxEx;
    ToolBarBkBottomColor: TColorBoxEx;
    ToolBarBkColorsDefaultButton: TBitBtnEx;
    SearchGamesPanelColorsBox: TPanelEx;
    SearchGamesPanelColorsBoxLabel: TShadowLabel;
    SearchGamesPanelFilterFontColorLabel: TShadowLabel;
    SearchGamesPanelFieldFontColorLabel: TShadowLabel;
    SearchGamesPanelEditBoxFontColorLabel: TShadowLabel;
    SearchGamesPanelEditBoxBackgroundColorLabel: TShadowLabel;
    SearchGamesPanelFilterFontColor: TColorBoxEx;
    SearchGamesPanelFieldFontColor: TColorBoxEx;
    SearchGamesPanelEditBoxFontColor: TColorBoxEx;
    SearchGamesPanelEditBoxBackgroundColor: TColorBoxEx;
    SearchGamesPanelColorsButtonDefault: TBitBtnEx;
    GamesSelectionBarColorsBox: TPanelEx;
    GamesSelectionBarColorsBoxLabel: TShadowLabel;
    GamesSelectionTopColorLabel: TShadowLabel;
    GamesSelectionFontColorLabel: TShadowLabel;
    GamesSelectionMissROMsTopColorLabel: TShadowLabel;
    GamesSelectionMissROMsFontColorLabel: TShadowLabel;
    GamesSelectionMissROMsTitleLabel: TShadowLabel;
    GamesSelectionInactiveTopColorLabel: TShadowLabel;
    GamesSelectionInactiveFontColorLabel: TShadowLabel;
    GamesSelectionInactiveLabel: TShadowLabel;
    GamesSelectionBottomColorLabel: TShadowLabel;
    GamesSelectionMissROMsBottomColorLabel: TShadowLabel;
    GamesSelectionInactiveBottomColorLabel: TShadowLabel;
    GamesSelectionFrameColorLabel: TShadowLabel;
    GamesSelectionMissROMsFrameColorLabel: TShadowLabel;
    GamesSelectionInactiveFrameColorLabel: TShadowLabel;
    GamesSelectionTopColor: TColorBoxEx;
    GameSelectionButtonDefault: TBitBtnEx;
    GamesSelectionFontColor: TColorBoxEx;
    GamesSelectionFrameColor: TColorBoxEx;
    GamesSelectionMissROMsTopColor: TColorBoxEx;
    GamesSelectionMissROMsFontColor: TColorBoxEx;
    GamesSelectionMissROMsFrameColor: TColorBoxEx;
    GamesSelectionInactiveTopColor: TColorBoxEx;
    GamesSelectionInactiveFontColor: TColorBoxEx;
    GamesSelectionInactiveFrameColor: TColorBoxEx;
    GameSelectionAlphaBlend: TAdvOfficeCheckBoxEx;
    GamesSelectionBottomColor: TColorBoxEx;
    GameSelectionGradientBar: TAdvOfficeCheckBoxEx;
    GamesSelectionMissROMsBottomColor: TColorBoxEx;
    GamesSelectionInactiveBottomColor: TColorBoxEx;
    GameSelectionRoundCorners: TAdvOfficeCheckBoxEx;
    ToolBarWindowsTheme: TAdvOfficeCheckBoxEx;
    GamesListBackgroundBox: TPanelEx;
    GamesListBackgroundBoxLabel: TShadowLabel;
    GamesBackgroundColor: TColorBoxEx;
    GamesBackgroundColorButtonDefault: TBitBtnEx;
    GamesBackgroundImage: TEditEx;
    GamesBackgroundImageEnable: TAdvOfficeCheckBoxEx;
    GamesBackgroundImageButtonSelect: TBitBtnEx;
    GamesBackgroundImageButtonUpdate: TBitBtnEx;
    GamesTileBackground: TAdvOfficeCheckBoxEx;
    GamesListSplittersBox: TPanelEx;
    GamesListSplittersBoxLabel: TShadowLabel;
    GamesListSplitterStyleSelector: TComboBox2Ex;
    GamesListSplitterStyleSelectorButtonDefault: TBitBtnEx;
    GamesListSplitterSingleColorTitleLabel: TShadowLabel;
    GamesListSplitterSingleColorButtonDefault: TBitBtnEx;
    GamesListSplitterShowGripIcon: TAdvOfficeCheckBoxEx;
    GamesListSplitterSingleColor: TColorBoxEx;
    GamesListSplitterSingleColorHot: TColorBoxEx;
    GamesListSplitterSingleColorHotLabel: TShadowLabel;
    GamesListSplitterSingleColorLabel: TShadowLabel;
    GamesListStatusBarColorsBox: TPanelEx;
    GamesListStatusBarColorsBoxLabel: TShadowLabel;
    GamesListStatusBarGradientBar: TAdvOfficeCheckBoxEx;
    GamesListStatusBarButtonDefault: TBitBtnEx;
    GamesListStatusBarTopColor: TColorBoxEx;
    GamesListStatusBarBottomColor: TColorBoxEx;
    GamesListStatusBarBottomColorLabel: TShadowLabel;
    GamesListStatusBarFontColorLabel: TShadowLabel;
    GamesListStatusBarFontColor: TColorBoxEx;
    GamesListStatusBarTopColorLabel: TShadowLabel;
    MAMEGameDocsBox: TPanelEx;
    MAMEGameDocsBoxLabel: TShadowLabel;
    GameDocumentsBackgroundColor: TColorBoxEx;
    GameDocumentsButtonDefault: TBitBtnEx;
    GameDocsBorderColor: TColorBoxEx;
    GameDocsBorderColorButtonDefault: TBitBtnEx;
    GameDocsShowStatusBar: TAdvOfficeCheckBoxEx;
    ImagesHintBox: TPanelEx;
    ImagesHintBoxLabel: TShadowLabel;
    HintBox_ColorLabel: TShadowLabel;
    HintBox_OpacityLabel: TShadowLabel;
    HintBox_TextColorLabel: TShadowLabel;
    HintBox_PositionLabel: TShadowLabel;
    HintBox_Color: TColorBoxEx;
    HintBox_FrameColor: TColorBoxEx;
    HintBox_FrameEnabled: TAdvOfficeCheckBoxEx;
    HintBox_OpacityButtonDefault: TBitBtnEx;
    HintBox_TextShadowColor: TColorBoxEx;
    HintBox_TextColor: TColorBoxEx;
    HintBoxtColorsButtonDefault: TBitBtnEx;
    HintTextDefaultColorsButtonDefault: TBitBtnEx;
    HintBox_TextShadowEnabled: TAdvOfficeCheckBoxEx;
    HintBox_FontItalicStyle: TAdvOfficeCheckBoxEx;
    HintBox_Position: TGaugeBar;
    HintBox_Opacity: TGaugeBar;
    ImageSplittersBox: TPanelEx;
    ImageSplittersBoxLabel: TShadowLabel;
    ImageSplitterStyleSelector: TComboBox2Ex;
    ImageSplitterStyleSelectorButtonDefault: TBitBtnEx;
    ImageSplitterShowGripIcon: TAdvOfficeCheckBoxEx;
    ImagetSplitterSingleColorTitleLabel: TShadowLabel;
    ImageSplitterSingleColorButtonDefault: TBitBtnEx;
    ImageSplitterSingleColorLabel: TShadowLabel;
    ImageSplitterSingleColor: TColorBoxEx;
    ImageSplitterSingleColorHotLabel: TShadowLabel;
    ImageSplitterSingleColorHot: TColorBoxEx;
    ImageBorderColorBox: TPanelEx;
    ImageBorderColorBoxLabel: TShadowLabel;
    ImageBorderColor: TColorBoxEx;
    ImageBorderColorButtonDefault: TBitBtnEx;
    SampleBox: TPanelEx;
    SampleBoxLabel: TShadowLabel;
    PanelPage1: TPanelEx;
    Settings_GeneralBox: TPanelEx;
    Settings_GeneralBoxLabel: TShadowLabel;
    IgnoreExitCode1InvalidFunctionLabel: TShadowLabel;
    LeftAlignEmulatorGameTextMessageBoxLabel: TShadowLabel;
    DisableMinimize: TAdvOfficeCheckBoxEx;
    AllowOnlyOneInstance: TAdvOfficeCheckBoxEx;
    IgnoreExitCode1InvalidFunction: TAdvOfficeCheckBoxEx;
    LeftAlignEmulatorGameTextMessageBox: TAdvOfficeCheckBoxEx;
    GamesListBox: TPanelEx;
    GamesListBoxLabel: TShadowLabel;
    GameListHeaderFont_Setting: TShadowLabel;
    DisableNaturalSortingLabel: TShadowLabel;
    GameMultilineCaptionsLabel: TShadowLabel;
    AddLeadingZeroVersionInfoMAMELabel: TShadowLabel;
    DisableNaturalSorting: TAdvOfficeCheckBoxEx;
    GameMultilineCaptions: TAdvOfficeCheckBoxEx;
    AddLeadingZeroVersionInfoMAME: TAdvOfficeCheckBoxEx;
    MAMu_IconsFolderBox: TPanelEx;
    MAMu_IconsFolderBoxLabel: TShadowLabel;
    MAMu_IconsFolder: TEditEx;
    MAMu_IconsFolderButtonSelect: TBitBtnEx;
    MAMu_Icon: TImage;
    ImagesSpecialSettingsBox: TPanelEx;
    ImagesSpecialSettingsBoxLabel: TShadowLabel;
    FixRetroArchImageFileNamesLabel: TShadowLabel;
    FixRetroArchImageFileNames: TAdvOfficeCheckBoxEx;
    ImageDisableThreadedLoadingLabel: TShadowLabel;
    ImageDisableThreadedLoading: TAdvOfficeCheckBoxEx;
    InternetGameInfoBox: TPanelEx;
    InternetGameInfoBoxLabel: TShadowLabel;
    InternetGameInfoBoxTip1Label: TShadowLabel;
    InternetGameInfoBoxTip2Label: TShadowLabel;
    RestoreInternetGameInfoStartup: TAdvOfficeCheckBoxEx;
    InternetGameInfoLinkLabel: TShadowLabel;
    InternetMAMESoftwareListGameInfoLinkLabel: TShadowLabel;
    InternetGameInfoLink: TEditEx;
    InternetGameInfoProgettoEMMALinkButtonDefault: TBitBtnEx;
    InternetMAMESoftwareListGameInfoLink: TEditEx;
    InternetMAMESoftwareListGameInfoProgettoEMMALinkButtonDefault: TBitBtnEx;
    InternetGameInfoArcadeItaliaLinkButtonDefault: TBitBtnEx;
    InternetMAMESoftwareListGameInfoArcadeItaliaLinkButtonDefault: TBitBtnEx;
    HideDOSBoxBox: TPanelEx;
    HideDOSBoxRunGameLabel: TShadowLabel;
    HideDOSBoxEmuVersionCreateGames: TAdvOfficeCheckBoxEx;
    HideDOSBoxRunGame: TAdvOfficeCheckBoxEx;
    HideDOSBoxBoxLabel: TShadowLabel;
    Setting_MAMEGameDocsBox: TPanelEx;
    Setting_MAMEGameDocsBoxLabel: TShadowLabel;
    GameDocsDisplayOrderBox: TPanelEx;
    GameDocsLabel: TShadowLabel;
    GameDocsButtonUp: TBitBtnEx;
    GameDocsButtonDown: TBitBtnEx;
    GameDocsButtonReset: TBitBtnEx;
    GameDocs: TEasyListview;
    GameDocsDisplayModeBox: TPanelEx;
    GameDocsDisplayModeBoxLabel: TShadowLabel;
    GameDocsDisplayModeSinglePanel: TAdvOfficeRadioButtonEx;
    GameDocsDisplayModeSinglePanelLabel: TShadowLabel;
    GameDocsDisplayModeTabs: TAdvOfficeRadioButtonEx;
    GameDocsDisplayModeTabsLabel: TShadowLabel;
    Setting_MAMEGameDocsBoxTipLabel: TShadowLabel;
    MAMEGameManualsPDFFolderLabel: TShadowLabel;
    MAMEGameManualsPDFFolderTipLabel: TShadowLabel;
    MAMEGameManualsPDFFolder: TEditEx;
    MAMEGameManualsPDFFolderButtonSelect: TBitBtnEx;
    MAMEGameManualsPDFFolderButtonDefault: TBitBtnEx;
    LabelGoToMAMEInfo: TShadowLabel;
    LabelGoToMESSInfo: TShadowLabel;
    LabelGoToGameInit: TShadowLabel;
    LabelGoToMARP: TShadowLabel;
    LabelGoToMAMEHistory: TShadowLabel;
    LabelGoToMAMEScore: TShadowLabel;
    DisableCloneIndent: TAdvOfficeCheckBoxEx;
    DisableDriverStatusIcons: TAdvOfficeCheckBoxEx;
    HideDriverStatusTexts: TAdvOfficeCheckBoxEx;
    DriverStatusShowFirstLetterOnly: TAdvOfficeCheckBoxEx;
    ShortDriverColumnTitles: TAdvOfficeCheckBoxEx;
    LastPlayedHideSeconds: TAdvOfficeCheckBoxEx;
    TotalPlayTimeHideSeconds: TAdvOfficeCheckBoxEx;
    GameDocsFont_Setting: TShadowLabel;
    ImageBorderColorLabel: TShadowLabel;
    GamesBackgroundColorLabel: TShadowLabel;
    GameDocumentsBackgroundColorLabel: TShadowLabel;
    GameDocsBorderColorLabel: TShadowLabel;
    DisableDeleteSelectedGames: TAdvOfficeCheckBoxEx;
    DisableDeleteSelectedGamesLabel: TShadowLabel;
    ShowGrayscaleIconGamesMissROMsCHDs: TAdvOfficeCheckBoxEx;
    ShowGrayscaleIconGamesMissROMsCHDsLabel: TShadowLabel;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure GamesBackgroundColorSelect(Sender: TObject);
    procedure GameDocumentsBackgroundColorSelect(
      Sender: TObject);
    procedure GameDocumentsButtonDefaultClick(Sender: TObject);
    procedure GamesBackgroundImageButtonSelectClick(Sender: TObject);
    procedure GamesBackgroundImageButtonUpdateClick(Sender: TObject);
    procedure GamesTileBackgroundClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure GameDocsButtonResetClick(Sender: TObject);
    procedure GamesBackgroundColorButtonDefaultClick(Sender: TObject);
    procedure GameDocsItemPaintText(Sender: TCustomEasyListview;
      Item: TEasyItem; Position: Integer; ACanvas: TCanvas);
    procedure GameDocsButtonUpClick(Sender: TObject);
    procedure GameSelectionAlphaBlendClick(Sender: TObject);
    procedure ImageSplitterSingleColorSelect(Sender: TObject);
    procedure ImageSplitterSingleColorHotSelect(Sender: TObject);
    procedure ImageSplitterStyleSelectorButtonDefaultClick(Sender: TObject);
    procedure GamesListSplitterStyleSelectorButtonDefaultClick(Sender: TObject);
    procedure GamesListSplitterSingleColorButtonDefaultClick(Sender: TObject);
    procedure GamesListSplitterStyleSelectorSelect(Sender: TObject);
    procedure GamesListSplitterSingleColorSelect(Sender: TObject);
    procedure GamesListSplitterSingleColorHotSelect(Sender: TObject);
    procedure GamesListSplitterShowGripIconClick(Sender: TObject);
    procedure ButtonPage1Click(Sender: TObject);
    procedure MAMu_IconsFolderButtonSelectClick(Sender: TObject);
    procedure ImageSplitterShowGripIconClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure DisableCloneIndentClick(Sender: TObject);
    procedure GamesBackgroundImageEnableClick(Sender: TObject);
    procedure DisableNaturalSortingClick(Sender: TObject);
    procedure LabelGoToMAMEInfoMouseEnter(Sender: TObject);
    procedure LabelGoToMAMEInfoClick(Sender: TObject);
    procedure LabelGoToMAMEInfoMouseLeave(Sender: TObject);
    procedure GameMultilineCaptionsClick(Sender: TObject);
    procedure ImageBorderColorSelect(Sender: TObject);
    procedure ImageBorderColorButtonDefaultClick(Sender: TObject);
    procedure GamesListStatusBarGradientBarClick(Sender: TObject);
    procedure GamesListStatusBarTopColorSelect(Sender: TObject);
    procedure GamesListStatusBarBottomColorSelect(Sender: TObject);
    procedure GamesListStatusBarFontColorSelect(Sender: TObject);
    procedure GamesListStatusBarButtonDefaultClick(Sender: TObject);
    procedure InternetGameInfoProgettoEMMALinkButtonDefaultClick(Sender: TObject);
    procedure InternetMAMESoftwareListGameInfoProgettoEMMALinkButtonDefaultClick(Sender: TObject);
    procedure DisableDeleteSelectedGamesClick(Sender: TObject);
    procedure GameDocsDisplayModeSinglePanelClick(Sender: TObject);
    procedure HintBox_OpacityChange(Sender: TObject);
    procedure HintBox_OpacityButtonDefaultClick(Sender: TObject);
    procedure HintBoxtColorsButtonDefaultClick(Sender: TObject);
    procedure HintTextDefaultColorsButtonDefaultClick(Sender: TObject);
    procedure ImageSplitterStyleSelectorSelect(Sender: TObject);
    procedure ImageSplitterSingleColorButtonDefaultClick(Sender: TObject);
    procedure GameDocsBorderColorSelect(Sender: TObject);
    procedure GameDocsBorderColorButtonDefaultClick(Sender: TObject);
    procedure OverlayIconsAlternateFolder_SelectPanelCloseMouseEnter(
      Sender: TObject);
    procedure OverlayIconsAlternateFolder_SelectPanelCloseMouseLeave(
      Sender: TObject);
    procedure GameSelectionGradientBarClick(Sender: TObject);
    procedure GameSelectionButtonDefaultClick(Sender: TObject);
    procedure InternetGameInfoArcadeItaliaLinkButtonDefaultClick(Sender: TObject);
    procedure InternetMAMESoftwareListGameInfoArcadeItaliaLinkButtonDefaultClick(Sender: TObject);
    procedure MAMEGameManualsPDFFolderButtonDefaultClick(Sender: TObject);
    procedure MAMEGameManualsPDFFolderButtonSelectClick(Sender: TObject);
    procedure GameDocsShowStatusBarClick(Sender: TObject);
    procedure HintBox_PositionChange(Sender: TObject);
    procedure GameSelectionRoundCornersClick(Sender: TObject);
    procedure ToolBarGradientBarClick(Sender: TObject);
    procedure ToolBarWindowsThemeClick(Sender: TObject);
    procedure ToolBarBkTopColorSelect(Sender: TObject);
    procedure ToolBarBkBottomColorSelect(Sender: TObject);
    procedure ToolBarBkColorsDefaultButtonClick(Sender: TObject);
    procedure GameDocsFont_SettingClick(Sender: TObject);
    procedure SearchGamesPanelFilterFontColorSelect(Sender: TObject);
    procedure SearchGamesPanelFieldFontColorSelect(Sender: TObject);
    procedure SearchGamesPanelEditBoxFontColorSelect(Sender: TObject);
    procedure SearchGamesPanelEditBoxBackgroundColorSelect(
      Sender: TObject);
  private
    { Private declarations }
    procedure UpdateGamesBackgroundImage(ImageEnabledCheckBox: TAdvOfficeCheckBoxEx; ImageFileNameEditBox: TEditEx; NightModeControls: Boolean);
    procedure RepaintToolBar;
  public
    { Public declarations }

  end;

var
  FormPreferences: TFormPreferences;

implementation

uses uMain, uStatus, uCommon;

{$R *.DFM}

// might be useful in the future...
//procedure TFormPreferences.ELV_GetMissROM_Selected(ColorBoxHolder: TColorBoxEx);
//var
//  colorRed, colorGreen, colorBlue, NewColor: Integer; // default RGB colors
//begin
//   colorRed:=   GetRValue(ColorBoxHolder.Selected);
//   colorGreen:= GetGValue(ColorBoxHolder.Selected);
//   colorBlue:=  GetBValue(ColorBoxHolder.Selected);
//   NewColor:=   RGB(colorBlue, colorGreen, colorRed); // invert, blue becomes red
//   ColorBoxHolder.Tag:= NewColor;
//end;

procedure TFormPreferences.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #27 then
     Close;
end;

procedure TFormPreferences.FormShow(Sender: TObject);
begin
  if Application.Terminated then
     begin
       PostMessage(Handle, wm_Close, 0, 0);
       Exit;
     end;

  if FormPreferences.Tag = 2 then
     begin
       MAMu_IconsFolder.SetFocus;
       FormPreferences.Tag:= 0;
     end;
end;

procedure TFormPreferences.GamesBackgroundColorSelect(Sender: TObject);
begin
  if not IsNightMode then
     begin
       FormMain.GamesListView.Color:= GamesBackgroundColor.Selected;
       FormMain.MachinesListSidePanel.Color:= FormMain.GamesListView.Color;
       FormMain.Font_TilesViewDetailsText.Color:= GetContrastColor(GamesBackgroundColor.Selected);
     end;
end;

procedure TFormPreferences.GameDocumentsBackgroundColorSelect(
  Sender: TObject);
begin
  if not IsNightMode then
     FormMain.MAMEDocsText.Color:= GameDocumentsBackgroundColor.Selected;

  GameDocsFont_Setting.Color:= GameDocumentsBackgroundColor.Selected;
end;

procedure TFormPreferences.GameDocumentsButtonDefaultClick(Sender: TObject);
begin
  GameDocsFont_Setting.Font.Color:= clBlack;
  GameDocsFont_Setting.Font.Name:= 'Calibri';
  GameDocsFont_Setting.Font.Size:= 9;
  GameDocsFont_Setting.Font.Style:= [];
  if not IsNightMode then
     FormMain.MAMEDocsText.Font:= GameDocsFont_Setting.Font;

  SetSelectedColorBox(GameDocumentsBackgroundColor, GameDocumentsBackgroundColor.DefaultColorColor);
end;

procedure TFormPreferences.GamesBackgroundImageButtonSelectClick(
  Sender: TObject);
begin
  FormMain.DialogOpenFile(5, GamesBackgroundImageEnable.Caption, GamesBackgroundImage, False);
  GamesBackgroundImageButtonUpdate.Click;
end;

procedure TFormPreferences.UpdateGamesBackgroundImage(ImageEnabledCheckBox: TAdvOfficeCheckBoxEx; ImageFileNameEditBox: TEditEx; NightModeControls: Boolean);
var
  ListViewBk: TPNGGraphic;
  FileFullPath: String;
begin
  case ImageEnabledCheckBox.Checked of
    True:
      begin
        FileFullPath:= FormMain.FullFolderFix(ImageFileNameEditBox.Text, '', True);
        if (not FileExists(FileFullPath)) or (FileFullPath = '') then
           begin
             if not FormMain.IsStartup then
                begin
                  if NightModeControls = IsNightMode then //if not IsNightMode then
                  begin
                    if FormMain.GamesListView.BackGround.Image <> nil then
                       FormMain.GamesListView.BackGround.Image:= nil;

                    if FormMain.MachinesListSidePanel.BackGround.Image <> nil then
                       FormMain.MachinesListSidePanel.BackGround.Image:= nil;
                  end;
                  FormMain.BlinkBkEdit(ImageFileNameEditBox);
                end;
             Exit;
           end;

        if NightModeControls = IsNightMode then //if not IsNightMode then
        begin
          try
            ListViewBk:= TPNGGraphic.Create;
            ListViewBk.LoadFromFile(FileFullPath);
            FormMain.GamesListView.BackGround.Image.Assign(ListViewBk);
            FormMain.MachinesListSidePanel.BackGround.Image.Assign(ListViewBk);
            FreeAndNil(ListViewBk);
          except
            FormMain.GamesListView.Background.Image:= nil;
            FormMain.MachinesListSidePanel.BackGround.Image:= nil;
          end;
        end;
      end;
    False:
      begin
        if NightModeControls = IsNightMode then //if not IsNightMode then
        begin
          FormMain.GamesListView.Background.Image:= nil;
          FormMain.MachinesListSidePanel.BackGround.Image:= nil;
        end;
      end;
  end;
end;

procedure TFormPreferences.GamesBackgroundImageButtonUpdateClick(
  Sender: TObject);
//var
//  ListViewBk: TPNGGraphic;
//  FileFullPath: String;
begin
  if not IsNightMode then
     UpdateGamesBackgroundImage(GamesBackgroundImageEnable, GamesBackgroundImage, False);
  {
  case GamesBackgroundImageEnable.Checked of
    True:
      begin
        FileFullPath:= FormMain.FullFolderFix(GamesBackgroundImage.Text, '', True);
        if (not FileExists(FileFullPath)) or (FileFullPath = '') then
           begin
             if not FormMain.IsStartup then
                begin
                  if not IsNightMode then
                  begin
                    if FormMain.GamesListView.BackGround.Image <> nil then
                       FormMain.GamesListView.BackGround.Image:= nil;

                    if FormMain.MachinesListSidePanel.BackGround.Image <> nil then
                       FormMain.MachinesListSidePanel.BackGround.Image:= nil;
                  end;
                  FormMain.BlinkBkEdit(GamesBackgroundImage);
                end;
             Exit;
           end;

        if not IsNightMode then
        begin
          try
            ListViewBk:= TPNGGraphic.Create;
            ListViewBk.LoadFromFile(FileFullPath);
            FormMain.GamesListView.BackGround.Image.Assign(ListViewBk);
            FormMain.MachinesListSidePanel.BackGround.Image.Assign(ListViewBk);
            FreeAndNil(ListViewBk);
          except
            FormMain.GamesListView.Background.Image:= nil;
            FormMain.MachinesListSidePanel.BackGround.Image:= nil;
          end;
        end;
      end;
    False:
      begin
        if not IsNightMode then
        begin
          FormMain.GamesListView.Background.Image:= nil;
          FormMain.MachinesListSidePanel.BackGround.Image:= nil;
        end;
      end;
  end;
  }
end;

procedure TFormPreferences.GamesTileBackgroundClick(Sender: TObject);
begin
  if not IsNightMode then
     begin
       FormMain.GamesListView.BackGround.Tile:= GamesTileBackground.Checked;
       FormMain.MachinesListSidePanel.BackGround.Tile:= GamesTileBackground.Checked;
     end;
end;

procedure TFormPreferences.FormCreate(Sender: TObject);
begin
  PanelPage2.Left:= 0;
  PanelPage2.Top:= PanelPage1.Top;
  PanelPage2.Visible:= False;
  FormPreferences.ClientHeight:= PanelPage1.Top+PanelPage1.Height;
  FormPreferences.ClientWidth:= PanelPage1.Width;

  FormMain.LoadMessageIcon(MAMu_Icon, 'mamu_.ico', True);
  FormMain.ELV_ResetNormalColors(GameDocs);
  if Is4KMode then
     begin
       GameListHeaderFont_Setting.Font.Size:= 16;
       GameDocsFont_Setting.Font.Size:= 16;
     end;
end;

procedure TFormPreferences.GameDocsButtonResetClick(
  Sender: TObject);
var
  Loop: Integer;
begin
  FormMain.ClearListView(GameDocs);
  GameDocs.BeginUpdate;
  for Loop:=1 to 6 do
      FormMain.ELV_AddGameDocs(Loop);
  GameDocs.EndUpdate;
end;

procedure TFormPreferences.GamesBackgroundColorButtonDefaultClick(Sender: TObject);
begin
  SetDefaultColorBox(GamesBackgroundColor);
  if not IsNightMode then
     FormMain.Font_TilesViewDetailsText.Color:= GetContrastColor(GamesBackgroundColor.Selected);
end;

procedure TFormPreferences.GameDocsItemPaintText(
  Sender: TCustomEasyListview; Item: TEasyItem; Position: Integer;
  ACanvas: TCanvas);
begin
  if not Item.Checked then
     ACanvas.Font.Color:= clGray;
end;

procedure TFormPreferences.GameDocsButtonUpClick(Sender: TObject);
begin
  FormMain.ELV_MoveItem(GameDocs, Boolean(TBitBtnEx(Sender).Tag));
end;

procedure TFormPreferences.GameSelectionAlphaBlendClick(Sender: TObject);
begin
  if not IsNightMode then
     begin
       FormMain.GamesListView.Selection.AlphaBlend:= GameSelectionAlphaBlend.Checked;
       FormMain.MachinesListSidePanel.Selection.AlphaBlend:= GameSelectionAlphaBlend.Checked;
     end;
end;

procedure TFormPreferences.ImageSplitterSingleColorSelect(
  Sender: TObject);
begin
  if not IsNightMode then
     FormMain.UpdateImageLayoutSplittersStyle;
end;

procedure TFormPreferences.ImageSplitterSingleColorHotSelect(
  Sender: TObject);
begin
  if not IsNightMode then
     FormMain.UpdateImageLayoutSplittersStyle;
end;

procedure TFormPreferences.ImageSplitterStyleSelectorButtonDefaultClick(
  Sender: TObject);
begin
  SetSelectedComboBox(1, ImageSplitterStyleSelector);
end;

procedure TFormPreferences.GamesListSplitterStyleSelectorButtonDefaultClick(
  Sender: TObject);
begin
  SetSelectedComboBox(6, GamesListSplitterStyleSelector);
end;

procedure TFormPreferences.GamesListSplitterSingleColorButtonDefaultClick(
  Sender: TObject);
begin
  SetDefaultColorBox(GamesListSplitterSingleColor);
  SetDefaultColorBox(GamesListSplitterSingleColorHot);
end;

procedure TFormPreferences.GamesListSplitterStyleSelectorSelect(Sender: TObject);
begin
  if IsNightMode then
     Exit;
  FormMain.UpdateSplitterStyle(FormMain.Splitter, TTMSStyle(GamesListSplitterStyleSelector.ItemIndex),
                               GamesListSplitterSingleColor.Selected,
                               GamesListSplitterSingleColorHot.Selected);
  
  FormMain.UpdateSplitterStyle(FormMain.SplitterMachines, TTMSStyle(GamesListSplitterStyleSelector.ItemIndex),
                               GamesListSplitterSingleColor.Selected,
                               GamesListSplitterSingleColorHot.Selected);
end;

procedure TFormPreferences.GamesListSplitterSingleColorSelect(Sender: TObject);
begin
  if not IsNightMode then
     GamesListSplitterStyleSelector.OnSelect(Self);
end;

procedure TFormPreferences.GamesListSplitterSingleColorHotSelect(Sender: TObject);
begin
  if not IsNightMode then
     GamesListSplitterStyleSelector.OnSelect(Self);
end;

procedure TFormPreferences.GamesListSplitterShowGripIconClick(Sender: TObject);
begin
  if not IsNightMode then
     begin
       FormMain.SetGripIcon(FormMain.Splitter, GamesListSplitterShowGripIcon.Checked);
       FormMain.SetGripIcon(FormMain.SplitterMachines, GamesListSplitterShowGripIcon.Checked);
     end;
end;

procedure TFormPreferences.ButtonPage1Click(Sender: TObject);
begin
  if TSpeedButton(Sender).Tag = 1 then
     begin
       if not PanelPage1.Visible then
          begin
            PanelPage2.Visible:= False;
            PanelPage1.Visible:= True;
          end;
     end
  else
     begin
       if not PanelPage2.Visible then
          begin
            PanelPage1.Visible:= False;
            PanelPage2.Visible:= True;
          end;
     end;
end;

procedure TFormPreferences.MAMu_IconsFolderButtonSelectClick(
  Sender: TObject);
begin
  FormMain.DialogSelectFolder(MAMu_IconsFolder, False);
end;

procedure TFormPreferences.ImageSplitterShowGripIconClick(Sender: TObject);
begin
  if IsNightMode then
     Exit;
  if ImageSplitterShowGripIcon.Tag = 0 then
     FormMain.PopupImageShowSplitterGrip.Click;
end;

procedure TFormPreferences.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if CanClose then
     begin
       if not Application.Terminated then
          begin
            if InternetGameInfoLink.Text = '' then
               InternetGameInfoProgettoEMMALinkButtonDefault.Click;
            if InternetMAMESoftwareListGameInfoLink.Text = '' then
               InternetMAMESoftwareListGameInfoProgettoEMMALinkButtonDefault.Click;

            if Trim(MAMu_IconsFolder.Text) = '' then
               MAMu_IconsFolder.Text:= 'icons';
            FormMain.UpdateVideoPreviewIni;
            FormMain.SetVideoPreviewState;
          end;
     end;
end;

procedure TFormPreferences.DisableCloneIndentClick(Sender: TObject);
begin
  //FormMain.GamesListView.BeginUpdate;
  //FormMain.GamesListView.EndUpdate(False);
end;

procedure TFormPreferences.GamesBackgroundImageEnableClick(Sender: TObject);
begin
  if not IsNightMode then
     begin
       FormMain.GamesListView.BackGround.Enabled:= GamesBackgroundImageEnable.Checked;
       FormMain.MachinesListSidePanel.BackGround.Enabled:= GamesBackgroundImageEnable.Checked;
       GamesBackgroundImageButtonUpdate.Click;
     end;
end;

procedure TFormPreferences.DisableNaturalSortingClick(Sender: TObject);
begin
  if FormMain.IsStartup then
     Exit; 
  FormMain.GamesListView.BeginUpdate;
  FormMain.GamesListView.Sort.SortAll;
  FormMain.GamesListView.EndUpdate(False);
  if FormMain.SelectedEasyItem <> nil then
     FormMain.SelectedEasyItem.MakeVisible(emvMiddle);//(emvAuto);
  if FormMain.PanelMachinesList.Visible then
     begin
       FormMain.MachinesListSidePanel.BeginUpdate;
       FormMain.MachinesListSidePanel.Sort.SortAll;
       FormMain.MachinesListSidePanel.EndUpdate(False);
       if FormMain.SelectedMachineItem <> nil then
          FormMain.SelectedMachineItem.MakeVisible(emvMiddle);//(emvAuto);
     end;
end;

procedure TFormPreferences.LabelGoToMAMEInfoMouseEnter(Sender: TObject);
begin
  if IsNightMode then
     SetLabelColors(TShadowLabel(Sender), clCream)//, clrMedDarkGray)
  else
     SetLabelColors(TShadowLabel(Sender), clBlue);
  //TShadowLabel(Sender).Font.Color:= clBlue;
  //TShadowLabel(Sender).Font.Style:= [fsUnderline];
end;

procedure TFormPreferences.LabelGoToMAMEInfoMouseLeave(Sender: TObject);
begin
  if IsNightMode then
     SetLabelColors(TShadowLabel(Sender), clSilver)//, clrMedDarkGray)
  else
     SetLabelColors(TShadowLabel(Sender), clNavy);
  //TShadowLabel(Sender).Font.Color:= clNavy;
  //TShadowLabel(Sender).Font.Style:= [];
end;

procedure TFormPreferences.LabelGoToMAMEInfoClick(Sender: TObject);
begin
  CallShellExecute(Sender);
end;

procedure TFormPreferences.GameMultilineCaptionsClick(Sender: TObject);
begin
  if FormMain.IsGroupedView or FormMain.IsDetailsView then
     begin
       if FormMain.PopupGameIconSize.Tag in [0, 1] then
          FormMain.GamesListView.PaintInfoItem.CaptionLines:= Ord(GameMultilineCaptions.Checked)+1;
     end;
  if FormMain.PopupMachinesListSidePanelIconSize.Tag in [0] then //, 1] then
     FormMain.MachinesListSidePanel.PaintInfoItem.CaptionLines:= Ord(GameMultilineCaptions.Checked)+1;
end;

procedure TFormPreferences.ImageBorderColorSelect(
  Sender: TObject);
begin
  if not IsNightMode then
     FormMain.PanelImage.Color:= ImageBorderColor.Selected;
end;

procedure TFormPreferences.ImageBorderColorButtonDefaultClick(Sender: TObject);
begin
  SetDefaultColorBox(ImageBorderColor);
end;

procedure TFormPreferences.GamesListStatusBarGradientBarClick(
  Sender: TObject);
begin
  if not IsNightMode then
     begin
       FormMain.SetPanelExStyle(FormMain.StatusBarPanel, GamesListStatusBarGradientBar.Checked);
       FormMain.SetPanelExStyle(FormMain.StatusBarPanelMachines, GamesListStatusBarGradientBar.Checked);
       FormMain.SetPanelExStyle(FormMain.MAMEInfoStatusBar, GamesListStatusBarGradientBar.Checked);
     end;
end;

procedure TFormPreferences.GamesListStatusBarTopColorSelect(
  Sender: TObject);
begin
  if not IsNightMode then
     begin
       FormMain.StatusBarPanel.Color1:= GamesListStatusBarTopColor.Selected;
       FormMain.StatusBarPanelMachines.Color1:= GamesListStatusBarTopColor.Selected;
       FormMain.MAMEInfoStatusBar.Color1:= GamesListStatusBarTopColor.Selected;
     end;
end;

procedure TFormPreferences.GamesListStatusBarBottomColorSelect(
  Sender: TObject);
begin
  if not IsNightMode then
     begin
       FormMain.StatusBarPanel.Color2:= GamesListStatusBarBottomColor.Selected;
       FormMain.StatusBarPanelMachines.Color2:= GamesListStatusBarBottomColor.Selected;
       FormMain.MAMEInfoStatusBar.Color2:= GamesListStatusBarBottomColor.Selected;
     end;
end;

procedure TFormPreferences.GamesListStatusBarFontColorSelect(
  Sender: TObject);
begin
  if not IsNightMode then
     begin
       FormMain.StatusBar_GamesTotal.Font.Color:= GamesListStatusBarFontColor.Selected;
       FormMain.StatusBar_GamesGameName.Font.Color:= GamesListStatusBarFontColor.Selected;
       FormMain.StatusBar_MachinesGameName.Font.Color:= GamesListStatusBarFontColor.Selected;
     end;
end;

procedure TFormPreferences.GamesListStatusBarButtonDefaultClick(Sender: TObject);
begin
  SetDefaultColorBox(GamesListStatusBarTopColor);
  SetDefaultColorBox(GamesListStatusBarBottomColor);
  SetDefaultColorBox(GamesListStatusBarFontColor);

  GamesListStatusBarGradientBar.Checked:= True;
end;

procedure TFormPreferences.InternetGameInfoProgettoEMMALinkButtonDefaultClick(Sender: TObject);
begin
  InternetGameInfoLink.Text:= 'http://www.progettoemma.net/gioco.php?game=%s';
end;

procedure TFormPreferences.InternetMAMESoftwareListGameInfoProgettoEMMALinkButtonDefaultClick(Sender: TObject);
begin
  InternetMAMESoftwareListGameInfoLink.Text:= 'http://www.progettoemma.net/mess/gioco.php?game=%s&list=%s';
end;

procedure TFormPreferences.InternetGameInfoArcadeItaliaLinkButtonDefaultClick(Sender: TObject);
begin
  InternetGameInfoLink.Text:= 'http://adb.arcadeitalia.net/?mame=%s';
end;

procedure TFormPreferences.InternetMAMESoftwareListGameInfoArcadeItaliaLinkButtonDefaultClick(Sender: TObject);
begin
  InternetMAMESoftwareListGameInfoLink.Text:= 'http://adb.arcadeitalia.net/?mess=%s&list=%s';
end;

procedure TFormPreferences.DisableDeleteSelectedGamesClick(Sender: TObject);
begin
  FormMain.PopupDeleteSelectedGames.Enabled:= not DisableDeleteSelectedGames.Checked;
  FormMain.PopupExtraCopyMoveSelectedGames.Enabled:= FormMain.PopupDeleteSelectedGames.Enabled;
  FormMain.PopupDeleteSelectedGamesFromGamesList.Enabled:= FormMain.PopupDeleteSelectedGames.Enabled;
end;

procedure TFormPreferences.GameDocsDisplayModeSinglePanelClick(
  Sender: TObject);
begin
  // GameDocsDisplayModeBox.Tag
  // 0 -> Single Panel
  // 1 -> Tabbed Panels

  if (TAdvOfficeRadioButtonEx(Sender).Tag = GameDocsDisplayModeBox.Tag) and (not FormMain.IsStartup) then
     Exit;

  FormMain.ButtonImagePanelToggle.Visible:= not GameDocsDisplayModeSinglePanel.Checked;
  FormMain.ButtonDocsPanelToggle.Visible:= not GameDocsDisplayModeSinglePanel.Checked;

  if FormMain.IsStartup then
     Exit;

  GameDocsDisplayModeBox.Tag:= TAdvOfficeRadioButtonEx(Sender).Tag;

  //if GameDocsDisplayModeSinglePanel.Checked then
  //   begin
  //     // perhaps reload images / game docs of selected game ????
  //   end;
end;

procedure TFormPreferences.HintBox_OpacityChange(Sender: TObject);
begin
  HintBox_OpacityLabel.Caption:= 'Opacity ['+IntToStr(HintBox_Opacity.Position)+']';
end;

procedure TFormPreferences.HintBox_OpacityButtonDefaultClick(
  Sender: TObject);
begin
  HintBox_Opacity.Position:= 200;
end;

procedure TFormPreferences.HintBoxtColorsButtonDefaultClick(
  Sender: TObject);
begin
  HintBox_Position.Position:= 4;
  SetDefaultColorBox(HintBox_Color);
  SetDefaultColorBox(HintBox_FrameColor);
  HintBox_FrameEnabled.Checked:= True;
end;

procedure TFormPreferences.HintTextDefaultColorsButtonDefaultClick(
  Sender: TObject);
begin
  SetDefaultColorBox(HintBox_TextColor);
  SetDefaultColorBox(HintBox_TextShadowColor);
  HintBox_TextShadowEnabled.Checked:= True;
  HintBox_FontItalicStyle.Checked:=  False;
end;

procedure TFormPreferences.ImageSplitterStyleSelectorSelect(
  Sender: TObject);
begin
  if not IsNightMode then
     FormMain.UpdateImageLayoutSplittersStyle;
end;

procedure TFormPreferences.ImageSplitterSingleColorButtonDefaultClick(Sender: TObject);
begin
  SetDefaultColorBox(ImageSplitterSingleColor);
  SetDefaultColorBox(ImageSplitterSingleColorHot);
end;

procedure TFormPreferences.GameDocsBorderColorSelect(Sender: TObject);
begin
  if not IsNightMode then
     FormMain.PanelGameDocuments.Color:= GameDocsBorderColor.Selected;
end;

procedure TFormPreferences.GameDocsBorderColorButtonDefaultClick(
  Sender: TObject);
begin
  SetDefaultColorBox(GameDocsBorderColor);
end;

procedure TFormPreferences.OverlayIconsAlternateFolder_SelectPanelCloseMouseEnter(
  Sender: TObject);
begin
  TShadowLabel(Sender).Color:= clRed;
end;

procedure TFormPreferences.OverlayIconsAlternateFolder_SelectPanelCloseMouseLeave(
  Sender: TObject);
begin
  TShadowLabel(Sender).Color:= clMaroon;
end;

procedure TFormPreferences.GameSelectionGradientBarClick(Sender: TObject);
begin
  if not IsNightMode then
     begin
       FormMain.GamesListView.Selection.Gradient:= GameSelectionGradientBar.Checked;
       FormMain.MachinesListSidePanel.Selection.Gradient:= GameSelectionGradientBar.Checked;
     end;
end;

procedure TFormPreferences.GameSelectionButtonDefaultClick(Sender: TObject);
begin
  GameSelectionGradientBar.Checked:= True;
  GameSelectionAlphaBlend.Checked:= True;
  GameSelectionRoundCorners.Checked:= True;

  SetDefaultColorBox(GamesSelectionTopColor);
  SetDefaultColorBox(GamesSelectionBottomColor);
  SetDefaultColorBox(GamesSelectionFrameColor);
  SetDefaultColorBox(GamesSelectionFontColor);

  SetDefaultColorBox(GamesSelectionMissROMsTopColor);
  SetDefaultColorBox(GamesSelectionMissROMsBottomColor);
  SetDefaultColorBox(GamesSelectionMissROMsFrameColor);
  SetDefaultColorBox(GamesSelectionMissROMsFontColor);

  SetDefaultColorBox(GamesSelectionInactiveTopColor);
  SetDefaultColorBox(GamesSelectionInactiveBottomColor);
  SetDefaultColorBox(GamesSelectionInactiveFrameColor);
  SetDefaultColorBox(GamesSelectionInactiveFontColor);
end;

procedure TFormPreferences.MAMEGameManualsPDFFolderButtonDefaultClick(
  Sender: TObject);
begin
  MAMEGameManualsPDFFolder.Text:= 'manuals';
end;

procedure TFormPreferences.MAMEGameManualsPDFFolderButtonSelectClick(
  Sender: TObject);
begin
  FormMain.DialogSelectFolder(MAMEGameManualsPDFFolder, False);
end;

procedure TFormPreferences.GameDocsShowStatusBarClick(Sender: TObject);
begin
  if not IsNightMode then
     FormMain.MAMEInfoStatusBar.Visible:= GameDocsShowStatusBar.Checked;
end;

procedure TFormPreferences.HintBox_PositionChange(Sender: TObject);
begin
  case HintBox_Position.Position of
    1: HintBox_PositionLabel.Caption:= 'Top/Left';
    2: HintBox_PositionLabel.Caption:= 'Top/Middle';
    3: HintBox_PositionLabel.Caption:= 'Top/Right';
    4: HintBox_PositionLabel.Caption:= 'Middle/Left'; // this is the default
    5: HintBox_PositionLabel.Caption:= 'Middle/Right';
    6: HintBox_PositionLabel.Caption:= 'Bottom/Left';
    7: HintBox_PositionLabel.Caption:= 'Bottom/Middle';
    8: HintBox_PositionLabel.Caption:= 'Bottom/Right';
  end;
end;

procedure TFormPreferences.GameSelectionRoundCornersClick(Sender: TObject);
begin
  if not IsNightMode then
     begin
       FormMain.GamesListView.Selection.RoundRect:= GameSelectionRoundCorners.Checked;
       FormMain.MachinesListSidePanel.Selection.RoundRect:= GameSelectionRoundCorners.Checked;
     end;
end;

procedure TFormPreferences.RepaintToolBar;
begin
  if (not FormMain.IsStartup) and (not IsNightMode) then
     begin
       FormMain.ImagesToolbarButtons.Invalidate;
       FormMain.ToolBarButtons.Invalidate; // games filters tool bar
     end;
end;

procedure TFormPreferences.ToolBarGradientBarClick(Sender: TObject);
begin
  if (not IsNightMode) and (not ToolBarWindowsTheme.Checked) then
     begin
       FormMain.SetPanelExStyle(FormMain.PanelSearchGames_ToolBar, ToolBarGradientBar.Checked);
       FormMain.SetPanelExStyle(FormMain.PanelWebToolBarButtons, ToolBarGradientBar.Checked);
       RepaintToolBar;
     end;
end;

procedure TFormPreferences.ToolBarWindowsThemeClick(Sender: TObject);
begin
  if not IsNightMode then
     begin
       if ToolBarWindowsTheme.Checked then
          begin
            FormMain.PanelSearchGames_ToolBar.Style:= vgWindowsTheme;
            FormMain.PanelWebToolBarButtons.Style:= vgWindowsTheme;
            RepaintToolBar;
          end
       else
          ToolBarGradientBar.OnClick(Self);
     end;
end;

procedure TFormPreferences.ToolBarBkTopColorSelect(Sender: TObject);
begin
  if not IsNightMode then
     begin
       FormMain.PanelSearchGames_ToolBar.Color1:= ToolBarBkTopColor.Selected;
       FormMain.PanelWebToolBarButtons.Color1:= ToolBarBkTopColor.Selected;
     end;
  if not ToolBarWindowsTheme.Checked then
     RepaintToolBar;
end;

procedure TFormPreferences.ToolBarBkBottomColorSelect(
  Sender: TObject);
begin
  if not IsNightMode then
     begin
       FormMain.PanelSearchGames_ToolBar.Color2:= ToolBarBkBottomColor.Selected;
       FormMain.PanelWebToolBarButtons.Color2:= ToolBarBkBottomColor.Selected;
     end;
  if not ToolBarWindowsTheme.Checked then
     RepaintToolBar;
end;

procedure TFormPreferences.ToolBarBkColorsDefaultButtonClick(
  Sender: TObject);
begin
  SetDefaultColorBox(ToolBarBkTopColor);
  SetDefaultColorBox(ToolBarBkBottomColor);
  ToolBarWindowsTheme.Checked:= True;
  ToolBarGradientBar.Checked:= True;
end;

procedure TFormPreferences.GameDocsFont_SettingClick(
  Sender: TObject);
begin
  FormMain.FontDialog.Font:= GameDocsFont_Setting.Font;
  FormMain.FontDialog.Tag:= 6;
  if FormMain.FontDialog.Execute then
     begin
       GameDocsFont_Setting.Font:= FormMain.FontDialog.Font;
       if not IsNightMode then
          begin
            FormMain.MAMEDocsText.Font:= GameDocsFont_Setting.Font;
            FormMain.MAMEDocsText.Invalidate;
          end;
     end;
end;

procedure TFormPreferences.SearchGamesPanelFilterFontColorSelect(
  Sender: TObject);
begin
  if not IsNightMode then
     begin
       //FormMain.LabelSearchGamesFilter_ToolBar.Font.Color:= SearchGamesPanelFilterFontColor.Selected;
       FormMain.LabelSelectCPU.Font.Color:=                 SearchGamesPanelFilterFontColor.Selected;
       FormMain.LabelCustomCPUFilter.Font.Color:=           SearchGamesPanelFilterFontColor.Selected;
     end;
     //FormMain.LabelSearchGamesFilter_ToolBar.Font.Color:= SearchGamesPanelFilterFontColor.Selected;
end;

procedure TFormPreferences.SearchGamesPanelFieldFontColorSelect(
  Sender: TObject);
begin
  if not IsNightMode then
     FormMain.LabelSearchGamesBy_ToolBar.Font.Color:= SearchGamesPanelFieldFontColor.Selected;
end;

procedure TFormPreferences.SearchGamesPanelEditBoxFontColorSelect(
  Sender: TObject);
begin
  if not IsNightMode then
     FormMain.FilterGameTitle_ToolBar.Font.Color:= SearchGamesPanelEditBoxFontColor.Selected;
end;

procedure TFormPreferences.SearchGamesPanelEditBoxBackgroundColorSelect(
  Sender: TObject);
begin
  if not IsNightMode then
     FormMain.FilterGameTitle_ToolBar.Color:= SearchGamesPanelEditBoxBackgroundColor.Selected;
end;

end.

