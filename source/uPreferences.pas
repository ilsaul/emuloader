unit uPreferences;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  ExtCtrls, StdCtrls, ComCtrls, Menus, IniFiles,
  Buttons, BarMenus, GraphicEx, MPCommonObjects, EasyListview,
  SplitterEx, AdvOfficeButtons, AdvGroupBox, ShadowLabel, PanelEx, ShellAPI,
  GR32_RangeBars, EditEx, ButtonsEx;

type
  TFormPreferences = class(TForm)
    PageOptions: TNotebook;
    DisableMinimize: TAdvOfficeCheckBoxEx;
    ButtonCustomizeGameFonts: TBitBtn;
    GroupBoxImageSplitters: TAdvGroupBoxEx;
    LabelAppearanceGameDocuments: TShadowLabel;
    GameDocumentsBackgroundColor: TColorBox;
    ButtonGameDocumentsFont: TBitBtn;
    ButtonGameDocumentsDefault: TBitBtn;
    ImageSplitterShowGripIcon: TAdvOfficeCheckBoxEx;
    ShadowLabel1: TShadowLabel;
    PanelTabButtons: TPanelEx;
    ButtonPageGeneral: TSpeedButton;
    ButtonPageGamesList: TSpeedButton;
    ButtonPageImages: TSpeedButton;
    ButtonPageGameDocuments: TSpeedButton;
    ColumnsSettingsGroupBox: TAdvGroupBoxEx;
    DisableCloneIndent: TAdvOfficeCheckBoxEx;
    DisableDriverStatusIcons: TAdvOfficeCheckBoxEx;
    DriverStatusShowFirstLetterOnly: TAdvOfficeCheckBoxEx;
    HideDriverStatusTexts: TAdvOfficeCheckBoxEx;
    ShortDriverColumnTitles: TAdvOfficeCheckBoxEx;
    GamesBackgroundGroupBox: TAdvGroupBoxEx;
    GamesBackgroundColor: TColorBox;
    ButtonDefaultBkSortedColor: TBitBtn;
    GamesBackgroundImageEnable: TAdvOfficeCheckBoxEx;
    GamesBackgroundImage: TEditEx;
    GamesBackgroundImageButtonSelect: TBitBtn;
    GamesBackgroundImageButtonUpdate: TBitBtn;
    GamesTileBackground: TAdvOfficeCheckBoxEx;
    LastPlayedHideSeconds: TAdvOfficeCheckBoxEx;
    TotalPlayTimeHideSeconds: TAdvOfficeCheckBoxEx;
    DisableNaturalSorting: TAdvOfficeCheckBoxEx;
    LabelDisableNaturalSorting: TShadowLabel;
    LabelGoToMAMEInfo: TShadowLabel;
    LabelGoToMARP: TShadowLabel;
    LabelGoToMAMEScore: TShadowLabel;
    LabelGoToMAMEHistory: TShadowLabel;
    GameMultilineCaptions: TAdvOfficeCheckBoxEx;
    LabelGameMultilineCaptions: TShadowLabel;
    LabelImageSplitterSingleColor: TShadowLabel;
    ImageSplitterSingleColor: TColorBox;
    ImageSplitterSingleColorHot: TColorBox;
    LabelImageSplitterSingleColorHot: TShadowLabel;
    ButtonImageSplitterStyleDefault: TBitBtn;
    HideDOSBoxFrame: TAdvGroupBoxEx;
    HideDOSBoxEmuVersionCreateGames: TAdvOfficeCheckBoxEx;
    HideDOSBoxRunGame: TAdvOfficeCheckBoxEx;
    ShadowLabel2: TShadowLabel;
    LabelGoToMESSInfo: TShadowLabel;
    LabelImageBorderColor: TShadowLabel;
    ImageBorderColor: TColorBox;
    ButtonImageBorderColorDefault: TBitBtn;
    LabelGoToGameInit: TShadowLabel;
    AllowOnlyOneInstance: TAdvOfficeCheckBoxEx;
    GamesListStatusBarBox: TAdvGroupBoxEx;
    LabelGamesListStatusBarBottomColor: TShadowLabel;
    LabelGamesListStatusBarTopColor: TShadowLabel;
    LabelGamesListStatusBarFontColor: TShadowLabel;
    GamesListStatusBarGradientBar: TAdvOfficeCheckBoxEx;
    GamesListStatusBarBottomColor: TColorBox;
    GamesListStatusBarButtonDefault: TBitBtn;
    GamesListStatusBarTopColor: TColorBox;
    GamesListStatusBarFontColor: TColorBox;
    GamesListStatusBarInnerFrameColor: TColorBox;
    DisableDeleteSelectedGames: TAdvOfficeCheckBoxEx;
    LabelDisableDeleteSelectedGames: TShadowLabel;
    IgnoreExitCode1InvalidFunction: TAdvOfficeCheckBoxEx;
    RestoreInternetGameInfoStartup: TAdvOfficeCheckBoxEx;
    LabelIgnoreExitCode1InvalidFunction: TShadowLabel;
    HintBoxSettings: TAdvGroupBoxEx;
    LabelHintBox_Color: TShadowLabel;
    HintBox_Color: TColorBox;
    HintBox_FrameColor: TColorBox;
    HintBox_FrameEnabled: TAdvOfficeCheckBoxEx;
    LabelHintBox_Opacity: TShadowLabel;
    HintBox_Opacity: TGaugeBar;
    ButtonDefaultHintBox_Opacity: TBitBtn;
    LabelHintBox_TextColor: TShadowLabel;
    HintBox_TextShadowColor: TColorBox;
    HintBox_TextColor: TColorBox;
    ButtonHintBoxDefaultColors: TBitBtn;
    ButtonHintTextDefaultColors: TBitBtn;
    HintBox_TextShadowEnabled: TAdvOfficeCheckBoxEx;
    HintBox_IconEnabled: TAdvOfficeCheckBoxEx;
    GroupBoxGamesListSplitters: TAdvGroupBoxEx;
    LabelGamesListSplitterSingleColorDefault: TShadowLabel;
    LabelGamesListSplitterSingleColor: TShadowLabel;
    LabelGamesListSplitterSingleColorHot: TShadowLabel;
    GamesListSplitterStyleSelector: TComboBox;
    ButtonGamesListSplitterStyleDefault: TBitBtn;
    GamesListSplitterShowGripIcon: TAdvOfficeCheckBoxEx;
    GamesListSplitterSingleColor: TColorBox;
    GamesListSplitterSingleColorHot: TColorBox;
    ButtonGamesListSplitterSingleColorDefault: TBitBtn;
    GroupBoxGameDocsSplitter: TAdvGroupBoxEx;
    LabelGameDocsSplitterSingleColorDefault: TShadowLabel;
    LabelGameDocsSplitterSingleColor: TShadowLabel;
    LabelGameDocsSplitterSingleColorHot: TShadowLabel;
    GameDocsSplitterStyleSelector: TComboBox;
    ButtonGameDocsSplitterStyleDefault: TBitBtn;
    GameDocsSplitterShowGripIcon: TAdvOfficeCheckBoxEx;
    GameDocsSplitterSingleColor: TColorBox;
    GameDocsSplitterSingleColorHot: TColorBox;
    ButtonGameDocsSplitterSingleColorDefault: TBitBtn;
    GroupBoxInternetGameInfo: TAdvGroupBoxEx;
    LabelInternetGameInfoLink: TShadowLabel;
    LabelInternetMAMESoftwareListGameInfoLink: TShadowLabel;
    Label5: TShadowLabel;
    Label6: TShadowLabel;
    InternetGameInfoLink: TEditEx;
    InternetGameInfoProgettoEMMALinkButtonDefault: TBitBtn;
    InternetMAMESoftwareListGameInfoLink: TEditEx;
    InternetMAMESoftwareListGameInfoProgettoEMMALinkButtonDefault: TBitBtn;
    LabelImageSplitterSingleColorDefault: TShadowLabel;
    ButtonImageSplitterSingleColorDefault: TBitBtn;
    ImageSplitterStyleSelector: TComboBox;
    MAMu_Icon: TImage;
    LabelMAMu_IconsFolder: TShadowLabel;
    MAMu_IconsFolder: TEditEx;
    ButtonMAMu_IconsFolderSelect: TBitBtn;
    ImagesSpecialSettingsGroupBox: TAdvGroupBoxEx;
    LabelFixRetroArchImageFileNames: TShadowLabel;
    LabelImageDisableThreadedLoading: TShadowLabel;
    FixRetroArchImageFileNames: TAdvOfficeCheckBoxEx;
    ImageDisableThreadedLoading: TAdvOfficeCheckBoxEx;
    GameDocsDisplayOrderBox: TAdvGroupBoxEx;
    GameDocs: TEasyListview;
    ButtonUp: TBitBtn;
    ButtonDown: TBitBtn;
    ButtonResetAutoGameInfoOrder: TBitBtn;
    GameDocsDisplayModeBox: TAdvGroupBoxEx;
    LabelGameDocsDisplayModeSinglePanel: TShadowLabel;
    LabelGameDocsDisplayModeTabs: TShadowLabel;
    GameDocsDisplayModeTabs: TAdvOfficeRadioButtonEx;
    GameDocsDisplayModeSinglePanel: TAdvOfficeRadioButtonEx;
    GamesListStatusBarOuterFrameColor: TColorBox;
    GamesListStatusBarShadowFontColor: TColorBox;
    GamesListStatusBarShadowFontEnabled: TAdvOfficeCheckBoxEx;
    GameDocsBorderColor: TColorBox;
    ButtonGameDocsBorderColorDefault: TBitBtn;
    GamesListStatusBarShowInnerFrame: TAdvOfficeCheckBoxEx;
    GamesListStatusBarShowOuterFrame: TAdvOfficeCheckBoxEx;
    GameDocsShowBorder: TAdvOfficeCheckBoxEx;
    GroupBoxGamesListSelectionBar: TAdvGroupBoxEx;
    Label2: TShadowLabel;
    GamesSelectionTopColor: TColorBox;
    GameSelectionButtonDefault: TBitBtn;
    Label10: TShadowLabel;
    GamesSelectionFontColor: TColorBox;
    GamesSelectionFrameColor: TColorBox;
    Label14: TShadowLabel;
    GamesSelectionMissROMsTopColor: TColorBox;
    Label15: TShadowLabel;
    GamesSelectionMissROMsFontColor: TColorBox;
    GamesSelectionMissROMsFrameColor: TColorBox;
    ShadowLabel4: TShadowLabel;
    Label17: TShadowLabel;
    Label18: TShadowLabel;
    ShadowLabel5: TShadowLabel;
    GamesSelectionInactiveTopColor: TColorBox;
    GamesSelectionInactiveFontColor: TColorBox;
    GamesSelectionInactiveFrameColor: TColorBox;
    GameSelectionAlphaBlend: TAdvOfficeCheckBoxEx;
    Label23: TShadowLabel;
    GamesSelectionBottomColor: TColorBox;
    GameSelectionGradientBar: TAdvOfficeCheckBoxEx;
    GamesSelectionMissROMsBottomColor: TColorBox;
    Label24: TShadowLabel;
    Label26: TShadowLabel;
    GamesSelectionInactiveBottomColor: TColorBox;
    Label11: TShadowLabel;
    Label16: TShadowLabel;
    Label19: TShadowLabel;
    AddLeadingZeroVersionInfoMAME: TAdvOfficeCheckBoxEx;
    LabelAddLeadingZeroVersionInfoMAME: TShadowLabel;
    InternetGameInfoArcadeItaliaLinkButtonDefault: TBitBtn;
    InternetMAMESoftwareListGameInfoArcadeItaliaLinkButtonDefault: TBitBtn;
    LabelMAMEGameManualsPDFFolder: TShadowLabel;
    MAMEGameManualsPDFFolder: TEditEx;
    ShadowLabel6: TShadowLabel;
    MAMEGameManualsPDFFolderButtonSelect: TBitBtn;
    MAMEGameManualsPDFFolderButtonDefault: TBitBtn;
    LabelMARP_scores3htm: TShadowLabel;
    LabelLinkMARP_scores3htm: TShadowLabel;
    UseItalicFontStyleSystemTitleBar: TAdvOfficeCheckBoxEx;
    LabelUseItalicFontStyleSystemTitleBar: TShadowLabel;
    GameDocsFont_Setting: TShadowLabel;
    GameDocsShowStatusBar: TAdvOfficeCheckBoxEx;
    LabelGameDocsShowStatusBar: TShadowLabel;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure GamesBackgroundColorSelect(Sender: TObject);
    procedure ButtonGameDocumentsFontClick(Sender: TObject);
    procedure GameDocumentsBackgroundColorSelect(
      Sender: TObject);
    procedure ButtonGameDocumentsDefaultClick(Sender: TObject);
    procedure GamesBackgroundImageButtonSelectClick(Sender: TObject);
    procedure GamesBackgroundImageButtonUpdateClick(Sender: TObject);
    procedure GamesTileBackgroundClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ButtonResetAutoGameInfoOrderClick(Sender: TObject);
    procedure ButtonDefaultBkSortedColorClick(Sender: TObject);
    procedure ButtonCustomizeGameFontsClick(Sender: TObject);
    procedure GameDocsItemPaintText(Sender: TCustomEasyListview;
      Item: TEasyItem; Position: Integer; ACanvas: TCanvas);
    procedure ButtonUpClick(Sender: TObject);
    procedure GameSelectionAlphaBlendClick(Sender: TObject);
    procedure ImageSplitterSingleColorSelect(Sender: TObject);
    procedure ImageSplitterSingleColorHotSelect(Sender: TObject);
    procedure ButtonImageSplitterStyleDefaultClick(Sender: TObject);
    procedure ButtonGamesListSplitterStyleDefaultClick(Sender: TObject);
    procedure ButtonGamesListSplitterSingleColorDefaultClick(Sender: TObject);
    procedure GamesListSplitterStyleSelectorSelect(Sender: TObject);
    procedure GamesListSplitterSingleColorSelect(Sender: TObject);
    procedure GamesListSplitterSingleColorHotSelect(Sender: TObject);
    procedure GamesListSplitterShowGripIconClick(Sender: TObject);
    procedure ButtonPageGeneralClick(Sender: TObject);
    procedure ButtonMAMu_IconsFolderSelectClick(Sender: TObject);
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
    procedure ButtonImageBorderColorDefaultClick(Sender: TObject);
    procedure GamesListStatusBarGradientBarClick(Sender: TObject);
    procedure GamesListStatusBarTopColorSelect(Sender: TObject);
    procedure GamesListStatusBarBottomColorSelect(Sender: TObject);
    procedure GamesListStatusBarInnerFrameColorSelect(Sender: TObject);
    procedure GamesListStatusBarFontColorSelect(Sender: TObject);
    procedure GamesListStatusBarButtonDefaultClick(Sender: TObject);
    procedure InternetGameInfoProgettoEMMALinkButtonDefaultClick(Sender: TObject);
    procedure InternetMAMESoftwareListGameInfoProgettoEMMALinkButtonDefaultClick(Sender: TObject);
    procedure DisableDeleteSelectedGamesClick(Sender: TObject);
    procedure GameDocsDisplayModeSinglePanelClick(Sender: TObject);
    procedure HintBox_OpacityChange(Sender: TObject);
    procedure ButtonDefaultHintBox_OpacityClick(Sender: TObject);
    procedure ButtonHintBoxDefaultColorsClick(Sender: TObject);
    procedure ButtonHintTextDefaultColorsClick(Sender: TObject);
    procedure ImageSplitterStyleSelectorSelect(Sender: TObject);
    procedure ButtonImageSplitterSingleColorDefaultClick(Sender: TObject);
    procedure GameDocsSplitterStyleSelectorSelect(Sender: TObject);
    procedure ButtonGameDocsSplitterStyleDefaultClick(Sender: TObject);
    procedure ButtonGameDocsSplitterSingleColorDefaultClick(
      Sender: TObject);
    procedure GameDocsSplitterShowGripIconClick(Sender: TObject);
    procedure GameDocsSplitterSingleColorSelect(Sender: TObject);
    procedure GameDocsSplitterSingleColorHotSelect(Sender: TObject);
    procedure GamesListStatusBarOuterFrameColorSelect(Sender: TObject);
    procedure GamesListStatusBarShadowFontEnabledClick(Sender: TObject);
    procedure GamesListStatusBarShadowFontColorSelect(Sender: TObject);
    procedure GameDocsBorderColorSelect(Sender: TObject);
    procedure ButtonGameDocsBorderColorDefaultClick(Sender: TObject);
    procedure GameDocsShowBorderClick(Sender: TObject);
    procedure GamesListStatusBarShowOuterFrameClick(Sender: TObject);
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
    procedure PageOptionsPageChanged(Sender: TObject);
    procedure GameDocsShowStatusBarClick(Sender: TObject);
  private
    { Private declarations }
    procedure UpdateGamesBackgroundImage(ImageEnabledCheckBox: TAdvOfficeCheckBoxEx; ImageFileNameEditBox: TEditEx; NightModeControls: Boolean);
  public
    { Public declarations }

  end;

var
  FormPreferences: TFormPreferences;

implementation

uses uMain, uStatus, uCommon;

{$R *.DFM}

// might be useful in the future...
//procedure TFormPreferences.ELV_GetMissROM_Selected(ColorBoxHolder: TColorBox);
//var
//  colorRed, colorGreen, colorBlue, NewColor: Integer; // will hold default RGB color
//begin
//   colorRed:= GetRValue(ColorBoxHolder.Selected);
//   colorGreen:= GetGValue(ColorBoxHolder.Selected);
//   colorBlue:= GetBValue(ColorBoxHolder.Selected);
//   NewColor:= RGB(colorBlue, colorGreen, colorRed); // invert... blue becomes red :-))
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

procedure TFormPreferences.ButtonGameDocumentsFontClick(
  Sender: TObject);
begin
  FormMain.FontDialog.Font:= GameDocsFont_Setting.Font;
  FormMain.FontDialog.Tag:= 6;
  if FormMain.FontDialog.Execute then
     begin
       GameDocsFont_Setting.Font:= FormMain.FontDialog.Font;
       if not IsNightMode then
          FormMain.MAMEInfoTextHolder.Font:= GameDocsFont_Setting.Font;
     end;

  // original code
  //FormMain.FontDialog.Font:= FormMain.MAMEInfoTextHolder.Font;
  //FormMain.FontDialog.Tag:= 6;
  //if FormMain.FontDialog.Execute then
  //   FormMain.MAMEInfoTextHolder.Font:= FormMain.FontDialog.Font;
end;

procedure TFormPreferences.GameDocumentsBackgroundColorSelect(
  Sender: TObject);
begin
  if not IsNightMode then
     FormMain.MAMEInfoTextHolder.Color:= GameDocumentsBackgroundColor.Selected;
end;

procedure TFormPreferences.ButtonGameDocumentsDefaultClick(Sender: TObject);
begin
  GameDocsFont_Setting.Font.Color:= clBlack;
  GameDocsFont_Setting.Font.Name:= 'Consolas';
  GameDocsFont_Setting.Font.Size:= 9;
  GameDocsFont_Setting.Font.Style:= [];
  if not IsNightMode then
     FormMain.MAMEInfoTextHolder.Font:= GameDocsFont_Setting.Font;

  FormMain.SetSelectedColorBox(GameDocumentsBackgroundColor, GameDocumentsBackgroundColor.DefaultColorColor);
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
  if PageOptions.PageIndex <> 0 then
     PageOptions.PageIndex:= 0;
  FormMain.LoadMessageIcon(MAMu_Icon, 'mamu_.ico', True);

  FormMain.ELV_ResetNormalColors(GameDocs);
end;

procedure TFormPreferences.ButtonResetAutoGameInfoOrderClick(
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

procedure TFormPreferences.ButtonDefaultBkSortedColorClick(Sender: TObject);
begin
  SetDefaultColorBox(GamesBackgroundColor);
  if not IsNightMode then
     FormMain.Font_TilesViewDetailsText.Color:= GetContrastColor(GamesBackgroundColor.Selected);
end;

procedure TFormPreferences.ButtonCustomizeGameFontsClick(Sender: TObject);
begin
  FormMain.MenuFontSettings.Click;
end;

procedure TFormPreferences.GameDocsItemPaintText(
  Sender: TCustomEasyListview; Item: TEasyItem; Position: Integer;
  ACanvas: TCanvas);
begin
  if not Item.Checked then
     ACanvas.Font.Color:= clGray;
end;

procedure TFormPreferences.ButtonUpClick(Sender: TObject);
begin
  FormMain.ELV_MoveItem(GameDocs, Boolean(TBitBtn(Sender).Tag));
end;

procedure TFormPreferences.GameSelectionAlphaBlendClick(Sender: TObject);
begin
  if not IsNightMode then
     begin
       FormMain.GamesListView.Selection.AlphaBlend:= GameSelectionAlphaBlend.Checked;
       FormMain.GamesListView.Selection.RoundRect:= GameSelectionAlphaBlend.Checked;
       FormMain.MachinesListSidePanel.Selection.AlphaBlend:= GameSelectionAlphaBlend.Checked;
       FormMain.MachinesListSidePanel.Selection.RoundRect:= GameSelectionAlphaBlend.Checked;
     end;
end;

procedure TFormPreferences.ImageSplitterSingleColorSelect(
  Sender: TObject);
begin
  FormMain.UpdateImageLayoutSplittersStyle;
end;

procedure TFormPreferences.ImageSplitterSingleColorHotSelect(
  Sender: TObject);
begin
  FormMain.UpdateImageLayoutSplittersStyle;
end;

procedure TFormPreferences.ButtonImageSplitterStyleDefaultClick(
  Sender: TObject);
begin
  SetSelectedComboBox(1, ImageSplitterStyleSelector);
end;

procedure TFormPreferences.ButtonGamesListSplitterStyleDefaultClick(
  Sender: TObject);
begin
  SetSelectedComboBox(6, GamesListSplitterStyleSelector);
end;

procedure TFormPreferences.ButtonGamesListSplitterSingleColorDefaultClick(
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
  GamesListSplitterStyleSelector.OnSelect(Self);
end;

procedure TFormPreferences.GamesListSplitterSingleColorHotSelect(Sender: TObject);
begin
  GamesListSplitterStyleSelector.OnSelect(Self);
end;

procedure TFormPreferences.GamesListSplitterShowGripIconClick(Sender: TObject);
begin
  if not IsNightMode then
     FormMain.SetGripIcon(FormMain.Splitter, GamesListSplitterShowGripIcon.Checked);
end;

procedure TFormPreferences.ButtonPageGeneralClick(Sender: TObject);
begin
  PageOptions.PageIndex:= TSpeedButton(Sender).Tag;
  ButtonPageGeneral.Font.Style:= [];
  ButtonPageGamesList.Font.Style:= [];
  ButtonPageImages.Font.Style:= [];
  ButtonPageGameDocuments.Font.Style:= [];
  TSpeedButton(Sender).Font.Style:= [fsBold];
end;

procedure TFormPreferences.ButtonMAMu_IconsFolderSelectClick(
  Sender: TObject);
begin
  FormMain.DialogSelectFolder(MAMu_IconsFolder, False);
end;

procedure TFormPreferences.ImageSplitterShowGripIconClick(Sender: TObject);
begin
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
            FormMain.UpdateVideoPreviewIni;
            FormMain.SetVideoPreviewState;
          end;
     end;
end;

procedure TFormPreferences.DisableCloneIndentClick(Sender: TObject);
begin
  FormMain.GamesListView.BeginUpdate;
  FormMain.GamesListView.EndUpdate(False);
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
  TShadowLabel(Sender).Font.Color:= clBlue;
  TShadowLabel(Sender).Font.Style:= [fsUnderline];
end;

procedure TFormPreferences.LabelGoToMAMEInfoMouseLeave(Sender: TObject);
begin
  TShadowLabel(Sender).Font.Color:= clNavy;
  TShadowLabel(Sender).Font.Style:= [];
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

procedure TFormPreferences.ButtonImageBorderColorDefaultClick(Sender: TObject);
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
     end;
end;

procedure TFormPreferences.GamesListStatusBarTopColorSelect(
  Sender: TObject);
begin
  if not IsNightMode then
     begin
       FormMain.StatusBarPanel.Color1:= GamesListStatusBarTopColor.Selected;
       FormMain.StatusBarPanelMachines.Color1:= GamesListStatusBarTopColor.Selected;
     end;
end;

procedure TFormPreferences.GamesListStatusBarBottomColorSelect(
  Sender: TObject);
begin
  if not IsNightMode then
     begin
       FormMain.StatusBarPanel.Color2:= GamesListStatusBarBottomColor.Selected;
       FormMain.StatusBarPanelMachines.Color2:= GamesListStatusBarBottomColor.Selected;
     end;
end;

procedure TFormPreferences.GamesListStatusBarInnerFrameColorSelect(
  Sender: TObject);
begin
  if not IsNightMode then
     begin
       FormMain.StatusBarPanel.ColorInnerFrame:= GamesListStatusBarInnerFrameColor.Selected;
       FormMain.StatusBarPanelMachines.ColorInnerFrame:= GamesListStatusBarInnerFrameColor.Selected;
     end;
end;

procedure TFormPreferences.GamesListStatusBarOuterFrameColorSelect(
  Sender: TObject);
begin
  if not IsNightMode then
     begin
       FormMain.StatusBarPanel.ColorFrame:= GamesListStatusBarOuterFrameColor.Selected;
       FormMain.StatusBarPanelMachines.ColorFrame:= GamesListStatusBarOuterFrameColor.Selected;
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

procedure TFormPreferences.GamesListStatusBarShadowFontColorSelect(
  Sender: TObject);
begin
  if not IsNightMode then
     begin
       FormMain.StatusBar_GamesTotal.ShadowColor:= GamesListStatusBarFontColor.Selected;
       FormMain.StatusBar_GamesGameName.ShadowColor:= GamesListStatusBarFontColor.Selected;
       FormMain.StatusBar_MachinesGameName.ShadowColor:= GamesListStatusBarFontColor.Selected;
     end;
end;

procedure TFormPreferences.GamesListStatusBarShadowFontEnabledClick(
  Sender: TObject);
begin
  if not IsNightMode then
     begin
       FormMain.StatusBar_GamesTotal.ShadowEnabled:= GamesListStatusBarShadowFontEnabled.Checked;
       FormMain.StatusBar_GamesGameName.ShadowEnabled:= GamesListStatusBarShadowFontEnabled.Checked;
       FormMain.StatusBar_MachinesGameName.ShadowEnabled:= GamesListStatusBarShadowFontEnabled.Checked;
     end;
end;

procedure TFormPreferences.GamesListStatusBarButtonDefaultClick(Sender: TObject);
begin
  SetDefaultColorBox(GamesListStatusBarTopColor);
  SetDefaultColorBox(GamesListStatusBarBottomColor);
  SetDefaultColorBox(GamesListStatusBarInnerFrameColor);
  SetDefaultColorBox(GamesListStatusBarOuterFrameColor);
  SetDefaultColorBox(GamesListStatusBarFontColor);
  SetDefaultColorBox(GamesListStatusBarShadowFontColor);

  GamesListStatusBarShowInnerFrame.Checked:= True;
  GamesListStatusBarShowOuterFrame.Checked:= True;
  GamesListStatusBarShadowFontEnabled.Checked:= False;
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
  LabelHintBox_Opacity.Caption:= 'Opacity ['+IntToStr(HintBox_Opacity.Position)+']';
end;

procedure TFormPreferences.ButtonDefaultHintBox_OpacityClick(
  Sender: TObject);
begin
  HintBox_Opacity.Position:= 200;
end;

procedure TFormPreferences.ButtonHintBoxDefaultColorsClick(
  Sender: TObject);
begin
  SetDefaultColorBox(HintBox_Color);
  SetDefaultColorBox(HintBox_FrameColor);
  HintBox_FrameEnabled.Checked:= True;
end;

procedure TFormPreferences.ButtonHintTextDefaultColorsClick(
  Sender: TObject);
begin
  SetDefaultColorBox(HintBox_TextColor);
  SetDefaultColorBox(HintBox_TextShadowColor);
  HintBox_TextShadowEnabled.Checked:= True;
end;

procedure TFormPreferences.ImageSplitterStyleSelectorSelect(
  Sender: TObject);
begin
  FormMain.UpdateImageLayoutSplittersStyle;
end;

procedure TFormPreferences.ButtonImageSplitterSingleColorDefaultClick(Sender: TObject);
begin
  SetDefaultColorBox(ImageSplitterSingleColor);
  SetDefaultColorBox(ImageSplitterSingleColorHot);
end;

procedure TFormPreferences.GameDocsSplitterStyleSelectorSelect(
  Sender: TObject);
begin
  if not IsNightMode then
     FormMain.UpdateSplitterStyle(FormMain.SplitterMAMEInfo, TTMSStyle(GameDocsSplitterStyleSelector.ItemIndex),
                                  GameDocsSplitterSingleColor.Selected,
                                  GameDocsSplitterSingleColorHot.Selected);
end;

procedure TFormPreferences.ButtonGameDocsSplitterStyleDefaultClick(
  Sender: TObject);
begin
  SetSelectedComboBox(6, GameDocsSplitterStyleSelector);
end;

procedure TFormPreferences.ButtonGameDocsSplitterSingleColorDefaultClick(
  Sender: TObject);
begin
  SetDefaultColorBox(GameDocsSplitterSingleColor);
  SetDefaultColorBox(GameDocsSplitterSingleColorHot);
end;

procedure TFormPreferences.GameDocsSplitterShowGripIconClick(
  Sender: TObject);
begin
  if not IsNightMode then
     FormMain.SetGripIcon(FormMain.SplitterMAMEInfo, GameDocsSplitterShowGripIcon.Checked);
end;

procedure TFormPreferences.GameDocsSplitterSingleColorSelect(
  Sender: TObject);
begin
  GameDocsSplitterStyleSelector.OnSelect(Self);
end;

procedure TFormPreferences.GameDocsSplitterSingleColorHotSelect(
  Sender: TObject);
begin
  GameDocsSplitterStyleSelector.OnSelect(Self);
end;

procedure TFormPreferences.GameDocsBorderColorSelect(Sender: TObject);
begin
  if not IsNightMode then
     FormMain.PanelGameDocuments.Color:= GameDocsBorderColor.Selected;
end;

procedure TFormPreferences.ButtonGameDocsBorderColorDefaultClick(
  Sender: TObject);
begin
  SetDefaultColorBox(GameDocsBorderColor);
  GameDocsShowBorder.Checked:= True;
end;

procedure TFormPreferences.GameDocsShowBorderClick(Sender: TObject);
begin
  if not IsNightMode then
     begin
       if GameDocsShowBorder.Checked then
          FormMain.PanelGameDocuments.BorderWidth:= 7
       else
          FormMain.PanelGameDocuments.BorderWidth:= 0;
     end;
end;

procedure TFormPreferences.GamesListStatusBarShowOuterFrameClick(
  Sender: TObject);
begin
  if not IsNightMode then
     begin
       FormMain.SetPanelExFrames(GamesListStatusBarShowOuterFrame, GamesListStatusBarShowInnerFrame, FormMain.StatusBarPanel, 20, False);
       FormMain.SetPanelExFrames(GamesListStatusBarShowOuterFrame, GamesListStatusBarShowInnerFrame, FormMain.StatusBarPanelMachines, 20, False);
     end;
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
  GameSelectionGradientBar.Checked:= False;
  GameSelectionAlphaBlend.Checked:= False;

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

procedure TFormPreferences.PageOptionsPageChanged(Sender: TObject);
begin
  if PageOptions.PageIndex in [4, 5] then
     begin
       if PageOptions.Color <> clGray then
          PageOptions.Color:= clGray
     end
  else
     begin
       if PageOptions.Color <> $00f1f1f1 then
          PageOptions.Color:= $00f1f1f1;
     end;
end;

procedure TFormPreferences.GameDocsShowStatusBarClick(Sender: TObject);
begin
  if not IsNightMode then
     FormMain.MAMEInfoStatusBar.Visible:= GameDocsShowStatusBar.Checked and (not GameDocsShowBorder.Checked);
end;

end.

