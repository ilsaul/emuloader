unit uNightMode;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, IniFiles, PanelEx, AdvOfficeButtons, StdCtrls, Buttons,
  ExtCtrls, uCommon, GraphicEx, ShadowLabel, ColorBoxEx, ButtonsEx, EditEx,
  SplitterEx, GR32_RangeBars, MPCommonObjects, EasyListview, GR32_Image,
  Menus, BarMenus, ImgList, ComCtrls, ToolWin;

type
  TFormNightMode = class(TForm)
    PanelBottom: TPanelEx;
    ButtonPage1: TSpeedButtonEx;
    ButtonPage2: TSpeedButtonEx;
    PanelPage1: TPanelEx;
    NightModeToolBarBackgroundColorsBox: TPanelEx;
    NightModeToolBarBackgroundColorsBoxLabel: TShadowLabel;
    NightModeToolBarOverlayIconsFolderGroupBox: TPanelEx;
    NightModeToolBarOverlayIconsFolderGroupBoxLabel: TShadowLabel;
    NightModeToolBarGradientBar: TAdvOfficeCheckBoxEx;
    NightModeToolBarBkColorsButtonDefault: TBitBtnEx;
    NightModeToolBarBkTopColor: TColorBoxEx;
    NightModeToolBarBkBottomColor: TColorBoxEx;
    NightModeLabelToolBarBkBottomColor: TShadowLabel;
    NightModeLabelToolBarBkTopColor: TShadowLabel;
    NightModeGamesListStatusBarColorsBox: TPanelEx;
    NightModeGamesListStatusBarColorsBoxLabel: TShadowLabel;
    NightModeGamesListStatusBarGradientBar: TAdvOfficeCheckBoxEx;
    NightModeGamesListStatusBarButtonDefault: TBitBtnEx;
    NightModeGamesListStatusBarTopColor: TColorBoxEx;
    NightModeGamesListStatusBarBottomColor: TColorBoxEx;
    NightModeGamesListStatusBarFontColor: TColorBoxEx;
    NightModeLabelGamesListStatusBarFontColor: TShadowLabel;
    NightModeLabelGamesListStatusBarBottomColor: TShadowLabel;
    NightModeLabelGamesListStatusBarTopColor: TShadowLabel;
    NightModeGamesSelectionBarColorsBox: TPanelEx;
    NightModeGamesSelectionBarColorsBoxLabel: TShadowLabel;
    NightModeLabelGamesSelectionTopColor: TShadowLabel;
    NightModeLabelGamesSelectionFontColor: TShadowLabel;
    NightModeLabelGamesSelectionFrameColor: TShadowLabel;
    NightModeLabelGamesSelectionMissROMsTopColor: TShadowLabel;
    NightModeLabelGamesSelectionMissROMsFontColor: TShadowLabel;
    NightModeLabelGamesSelectionMissROMsFrameColor: TShadowLabel;
    NightModeGamesSelectionMissROMsLabel: TShadowLabel;
    NightModeLabelGamesSelectionInactiveTopColor: TShadowLabel;
    NightModeLabelGamesSelectionInactiveFontColor: TShadowLabel;
    NightModeLabelGamesSelectionInactiveFrameColor: TShadowLabel;
    NightModeGamesSelectionInactiveLabel: TShadowLabel;
    NightModeLabelGamesSelectionBottomColor: TShadowLabel;
    NightModeLabelGamesSelectionMissROMsBottomColor: TShadowLabel;
    NightModeLabelGamesSelectionInactiveBottomColor: TShadowLabel;
    NightModeGameSelectionButtonDefault: TBitBtnEx;
    NightModeGameSelectionAlphaBlend: TAdvOfficeCheckBoxEx;
    NightModeGameSelectionGradientBar: TAdvOfficeCheckBoxEx;
    NightModeGameSelectionButtonPreview: TBitBtnEx;
    NightModeGamesSelectionBottomColor: TColorBoxEx;
    NightModeGamesSelectionFrameColor: TColorBoxEx;
    NightModeGamesSelectionFontColor: TColorBoxEx;
    NightModeGamesSelectionMissROMsTopColor: TColorBoxEx;
    NightModeGamesSelectionMissROMsBottomColor: TColorBoxEx;
    NightModeGamesSelectionMissROMsFrameColor: TColorBoxEx;
    NightModeGamesSelectionMissROMsFontColor: TColorBoxEx;
    NightModeGamesSelectionInactiveTopColor: TColorBoxEx;
    NightModeGamesSelectionInactiveBottomColor: TColorBoxEx;
    NightModeGamesSelectionInactiveFrameColor: TColorBoxEx;
    NightModeGamesSelectionInactiveFontColor: TColorBoxEx;
    NightModePanelColorsBox: TPanelEx;
    NightModePanelColorsBoxLabel: TShadowLabel;
    NightModeSearchGamesPanelGradientBar: TAdvOfficeCheckBoxEx;
    NightModePanelsBackgroundColorsDefaultButton: TBitBtnEx;
    NightModePanelColorsImageCategoryTextFontColor: TColorBoxEx;
    NightModePanelColorsImageZipTextFontColor: TColorBoxEx;
    NightModePanelColorsTitleFontColor: TColorBoxEx;
    NightModePanelColorsTitleShadowFontColor: TColorBoxEx;
    NightModePanelColorsTitle2ShadowFontColor: TColorBoxEx;
    NightModeLabelPanelColorsTitleFontColor: TShadowLabel;
    NightModePanelColorsImageCategoryTextFontColorLabel: TShadowLabel;
    NightModeLabelSearchGamesPanelTopColor: TShadowLabel;
    NightModeSearchGamesPanelTopColor: TColorBoxEx;
    NightModeSearchGamesPanelBottomColor: TColorBoxEx;
    NightModeSearchGamesPanelInnerFrameColor: TColorBoxEx;
    NightModeSearchGamesPanelOuterFrameColor: TColorBoxEx;
    NightModePanelColorsTitle2FontColor: TColorBoxEx;
    NightModeLabelPanelColorsTitle2FontColor: TShadowLabel;
    NightModeLabelSearchGamesPanelOuterFrameColor: TShadowLabel;
    NightModeLabelSearchGamesPanelInnerFrameColor: TShadowLabel;
    NightModeLabelSearchGamesPanelBottomColor: TShadowLabel;
    PanelPage2: TPanelEx;
    NightModeSearchGamesPanelColorsBox: TPanelEx;
    NightModeSearchGamesPanelColorsBoxLabel: TShadowLabel;
    NightModeLabelSearchGamesPanelFilterFontColor: TShadowLabel;
    NightModeLabelSearchGamesPanelFieldFontColor: TShadowLabel;
    NightModeLabelSearchGamesPanelCaptionBarFontColor: TShadowLabel;
    NightModeLabelSearchGamesPanelEditBoxFontColor: TShadowLabel;
    NightModeLabelSearchGamesPanelEditBoxBackgroundColor: TShadowLabel;
    NightModeLabelSearchGamesPanelEditBoxCustomFrameColor: TShadowLabel;
    LabelNightModeSearchGamesPanelEditBoxCustomFocusedFrameColor: TShadowLabel;
    NightModeSearchGamesPanelColorsButtonDefault: TBitBtnEx;
    NightModeSearchGamesPanelFilterFontColor: TColorBoxEx;
    NightModeSearchGamesPanelFieldFontColor: TColorBoxEx;
    NightModeSearchGamesPanelCaptionBarFontColor: TColorBoxEx;
    NightModeSearchGamesPanelEditBoxFontColor: TColorBoxEx;
    NightModeSearchGamesPanelEditBoxBackgroundColor: TColorBoxEx;
    NightModeSearchGamesPanelEditBoxCustomFrameColor: TColorBoxEx;
    NightModeSearchGamesPanelEditBoxCustomFocusedFrameColor: TColorBoxEx;
    ToolBarOverlayIconsFolderButtonUpdate: TBitBtnEx;
    ToolBarOverlayIconsFolder: TComboBox2Ex;
    NightModeGamesListBackgroundBox: TPanelEx;
    NightModeGamesListBackgroundBoxLabel: TShadowLabel;
    NightModeGamesBackgroundColor: TColorBoxEx;
    NightModeGamesBackgroundColorButtonDefault: TBitBtnEx;
    NightModeGamesBackgroundImage: TEditEx;
    NightModeGamesBackgroundImageEnable: TAdvOfficeCheckBoxEx;
    NightModeGamesTileBackground: TAdvOfficeCheckBoxEx;
    NightModeGamesBackgroundImageButtonSelect: TBitBtnEx;
    NightModeGamesBackgroundImageButtonUpdate: TBitBtnEx;
    NightModeMAMEGameDocsBox: TPanelEx;
    NightModeMAMEGameDocsBoxLabel: TShadowLabel;
    NightModeLabelGameDocsShowStatusBar: TShadowLabel;
    NightModeGameDocsFont_Setting: TShadowLabel;
    NightModeGameDocumentsBackgroundColor: TColorBoxEx;
    NightModeGameDocumentsButtonDefault: TBitBtnEx;
    NightModeGameDocsShowBorder: TAdvOfficeCheckBoxEx;
    NightModeGameDocsBorderColor: TColorBoxEx;
    NightModeGameDocsBorderColorButtonDefault: TBitBtnEx;
    NightModeGameDocsShowStatusBar: TAdvOfficeCheckBoxEx;
    NightModeMenuPopupMenuBox: TPanelEx;
    NightModeMenuPopupMenuBoxLabel: TShadowLabel;
    NightModeLabelMenuPopupMenuFrameColor: TShadowLabel;
    NightModeMenuPopupMenuFrameColor: TColorBoxEx;
    NightModeMenuPopupMenuFrameColorDefaultColors: TBitBtnEx;
    NightModeButtonColorsBox: TPanelEx;
    NightModeButtonColorsBoxLabel: TShadowLabel;
    NightModeLabelButtonColorFontColor: TShadowLabel;
    NightModeLabelButtonColorGradientTop: TShadowLabel;
    NightModeLabelButtonColorGradientBottom: TShadowLabel;
    NightModeLabelButtonColorGradientBottomHover: TShadowLabel;
    NightModeLabelButtonColorGradientTopHover: TShadowLabel;
    NightModeLabelButtonColorGradientTopDisabled: TShadowLabel;
    NightModeLabelButtonColorGradientBottomDisabled: TShadowLabel;
    NightModeLabelButtonColorFrameColor: TShadowLabel;
    NightModeLabelButtonColorFrameColorHover: TShadowLabel;
    NightModeLabelButtonColorFrameColorDisabled: TShadowLabel;
    NightModeLabelButtonColorFrameColorFocused: TShadowLabel;
    NightModeLabelButtonColorFontColorDisabled: TShadowLabel;
    NightModeLabelButtonColorGradientBottomSelected: TShadowLabel;
    NightModeLabelButtonColorGradientTopSelected: TShadowLabel;
    NightModeLabelButtonColorFrameColorSelected: TShadowLabel;
    NightModeButtonColorFontColor: TColorBoxEx;
    NightModeButtonColorGradientTop: TColorBoxEx;
    NightModeButtonColorGradientBottom: TColorBoxEx;
    NightModeButtonColorGradientTopHover: TColorBoxEx;
    NightModeButtonColorGradientBottomHover: TColorBoxEx;
    NightModeButtonColorGradientBottomDisabled: TColorBoxEx;
    NightModeButtonColorGradientTopDisabled: TColorBoxEx;
    NightModeButtonColorFrameColor: TColorBoxEx;
    NightModeButtonColorFrameColorHover: TColorBoxEx;
    NightModeButtonColorFrameColorDisabled: TColorBoxEx;
    NightModeButtonColorFrameColorFocused: TColorBoxEx;
    NightModeButtonColorFontColorDisabled: TColorBoxEx;
    NightModeButtonColorFontShadowColorDisabled: TColorBoxEx;
    NightModeColorsBoxButtonDefault: TBitBtnEx;
    NightModeButtonColorGradientTopSelected: TColorBoxEx;
    NightModeButtonColorGradientBottomSelected: TColorBoxEx;
    NightModeButtonColorFrameColorSelected: TColorBoxEx;
    NightModeGamesListSplittersBox: TPanelEx;
    NightModeGamesListSplittersBoxLabel: TShadowLabel;
    NightModeLabelGamesListSplitterSingleColor: TShadowLabel;
    NightModeLabelGamesListSplitterSingleColorHot: TShadowLabel;
    NightModeGamesListSplitterSingleColorButtonDefault: TBitBtnEx;
    NightModeGamesListSplitterShowGripIcon: TAdvOfficeCheckBoxEx;
    NightModeGamesListSplitterSingleColor: TColorBoxEx;
    NightModeGamesListSplitterSingleColorHot: TColorBoxEx;
    NightModeImagesHintBox: TPanelEx;
    NightModeImagesHintBoxLabel: TShadowLabel;
    NightModeLabelHintBox_Color: TShadowLabel;
    NightModeLabelHintBox_Opacity: TShadowLabel;
    NightModeLabelHintBox_TextColor: TShadowLabel;
    NightModeHintBoxtColorsButtonDefault: TBitBtnEx;
    NightModeHintBox_Color: TColorBoxEx;
    NightModeHintBox_FrameColor: TColorBoxEx;
    NightModeHintBox_FrameEnabled: TAdvOfficeCheckBoxEx;
    NightModeHintBox_Opacity: TGaugeBar;
    NightModeHintBox_OpacityButtonDefault: TBitBtnEx;
    NightModeHintTextDefaultColorsButtonDefault: TBitBtnEx;
    NightModeHintBox_FontItalicStyle: TAdvOfficeCheckBoxEx;
    NightModeHintBox_TextColor: TColorBoxEx;
    NightModeHintBox_TextShadowColor: TColorBoxEx;
    NightModeHintBox_TextShadowEnabled: TAdvOfficeCheckBoxEx;
    NightModeImageSplittersBox: TPanelEx;
    NightModeImageSplittersBoxLabel: TShadowLabel;
    NightModeLabelImageSplitterSingleColor: TShadowLabel;
    NightModeLabelImageSplitterSingleColorHot: TShadowLabel;
    NightModeImageSplitterSingleColorButtonDefault: TBitBtnEx;
    NightModeImageSplitterShowGripIcon: TAdvOfficeCheckBoxEx;
    NightModeImageSplitterSingleColor: TColorBoxEx;
    NightModeImageSplitterSingleColorHot: TColorBoxEx;
    NightModeImageBorderColorBox: TPanelEx;
    NightModeImageBorderColorBoxLabel: TShadowLabel;
    NightModeImageBorderColor: TColorBoxEx;
    NightModeImageBorderColorButtonDefault: TBitBtnEx;
    NightModeProfiles_ButtonNew: TBitBtnEx;
    NightModeProfiles: TComboBox2Ex;
    NightModeProfiles_ButtonSave: TBitBtnEx;
    NightModeProfiles_ButtonDelete: TBitBtnEx;
    NightModeProfilesGroupBox: TPanelEx;
    NightModeProfilesGroupBoxLabel: TShadowLabel;
    NightModePanelColorsBoxPreview: TPanelEx;
    NightModePanelColorsBoxPreviewLabel: TShadowLabel;
    PanelInitZipFile: TPanelEx;
    LabelInitZipTitle: TShadowLabel;
    LabelInitZipFile: TShadowLabel;
    LabelInitZipSystemTitle: TShadowLabel;
    LabelInitZipImageCategory: TShadowLabel;
    InitZipSystemIcon: TImage;
    NightModeImagesHintBoxPreview: TPanelEx;
    NightModeImagesHintBoxPreviewLabel: TShadowLabel;
    ImageHintPanel_Image: TImage32;
    ImageHintPanel: TPanelEx;
    ImageHintText: TShadowLabel;
    ImageHintIcon: TImage;
    NightModeGamesSelectionBarPreview: TPanelEx;
    NightModeGamesSelectionBarPreviewLabel: TShadowLabel;
    NightModePanelGamesList: TPanelEx;
    NightModeGamesListView: TEasyListview;
    NightModeGamesSelectionBarPreviewButtonClose: TShadowLabel;
    NightModePanelColorsBoxPreviewButtonClose: TShadowLabel;
    NightModePanelColorsBoxButtonPreview: TBitBtnEx;
    NightModeImagesHintBoxPreviewButtonClose: TShadowLabel;
    NightModeImagesHintBoxButtonPreview: TBitBtnEx;
    NightModeLabelSearchGamesPanelEditBoxFrameColor: TShadowLabel;
    NightModePanelColorsTitleShadowEnabled: TAdvOfficeCheckBoxEx;
    NightModePanelColorsTitle2ShadowEnabled: TAdvOfficeCheckBoxEx;
    NightModeImageHintPanel_ImageView1: TBitBtnEx;
    NightModeImageHintPanel_ImageView2: TBitBtnEx;
    NightModeHintBox_LargerFontSize: TAdvOfficeCheckBoxEx;
    NightModeHintBox_Position: TGaugeBar;
    NightModeHintBox_PositionLabel: TShadowLabel;
    ImageHintDetailsText: TShadowLabel;
    NightModeGameSelectionRoundCorners: TAdvOfficeCheckBoxEx;
    NightModeLabelButtonColorFontShadowColorDisabled: TAdvOfficeCheckBoxEx;
    NightModeProfiles_ButtonUpdate: TBitBtnEx;
    NightModeGamesSelectionTopColor: TColorBoxEx;
    NightModeProfiles_ButtonReload: TBitBtnEx;
    NightModeSearchGamesPanelColorsBoxPreview: TPanelEx;
    NightModeSearchGamesPanelColorsBoxPreviewButtonClose: TShadowLabel;
    NightModeSearchGamesPanelColorsBoxPreviewLabel: TShadowLabel;
    NightModePanelSearchGames: TPanelEx;
    NightModePanelSearchGamesCaptionBar: TShadowLabel;
    NightModeButtonFilterTitleClose: TShadowLabel;
    NightModeLabelSearchGamesFilter: TShadowLabel;
    NightModeLabelSearchGamesBy: TShadowLabel;
    NightModeFilterGameTitle: TEditEx;
    NightModeToolBarFilterTitle: TToolBar;
    NightModeButtonFilterTitleApply: TToolButton;
    NightModeButtonFilterControls: TToolButton;
    NightModeButtonFilterTitleReset: TToolButton;
    NightModeButtonFilterTitleSettings: TToolButton;
    NightModeButtonFilterTitlePanelMode: TToolButton;
    NightModeSearchGamesPanelColorsButtonPreview: TBitBtnEx;
    NightModeColorsBoxButtonDefault2: TBitBtnEx;
    NightModeGamesListHeaderGroupBox: TPanelEx;
    NightModeGamesListHeaderGroupBoxLabel: TShadowLabel;
    NightModeGamesListHeaderButtonDefault: TBitBtnEx;
    NightModeGamesListHeaderBackgroundColor: TColorBoxEx;
    NightModeGamesListHeaderBackgroundColorHover: TColorBoxEx;
    NightModeGamesListHeaderBackgroundColorHoverLabel: TShadowLabel;
    NightModeGamesListHeaderBackgroundColorLabel: TShadowLabel;
    NightModeGamesListHeaderBackgroundColorDown: TColorBoxEx;
    NightModeGamesListHeaderBackgroundColorDownLabel: TShadowLabel;
    NightModeGamesListHeaderFont: TShadowLabel;
    NightModeGamesListHeaderFontColorLabel: TShadowLabel;
    NightModeButtonColorsBoxPreview: TPanelEx;
    NightModeButtonColorsBoxPreviewButtonClose: TShadowLabel;
    NightModeButtonColorsBoxPreviewLabel: TShadowLabel;
    NightModeButtonColorsSamplePanel: TPanelEx;
    NightModeButtonColorsSampleButton4: TSpeedButtonEx;
    NightModeButtonColorsSampleButton1: TBitBtnEx;
    NightModeButtonColorsSampleButton2: TBitBtnEx;
    NightModeButtonColorsSampleButton3: TBitBtnEx;
    NightModeColorsBoxButtonPreview: TBitBtnEx;
    NightModeNewProfileBox: TPanelEx;
    NightModeNewProfileBoxLabel: TShadowLabel;
    NightModeNewProfileBoxButtonClose: TShadowLabel;
    NightModeNewProfileBoxButtonConfirm: TBitBtnEx;
    NightModeNewProfileBoxButtonAbort: TBitBtnEx;
    NightModeNewProfileProfilesListPanel: TPanelEx;
    NightModeNewProfileProfilesList: TEasyListview;
    NightModeNewProfileProfileNameLabel: TShadowLabel;
    NightModeNewProfileProfileName: TEditEx;
    NightModeNewProfileProfileNameTipLabel: TShadowLabel;
    NightModeNewProfileUseColorsActiveProfile: TAdvOfficeCheckBoxEx;
    NightModeNewProfileCreateWithDefaultColorsLabel: TShadowLabel;
    NightModeProfiles_ButtonDefault: TBitBtnEx;
    NightModeGamesListHeaderButtonDefault2: TBitBtnEx;
    NightModeHintBoxtColorsButtonDefault2: TBitBtnEx;
    NightModeHintTextDefaultColorsButtonDefault2: TBitBtnEx;
    NightModeGameSelectionButtonDefault2: TBitBtnEx;
    NightModeToolBarBkColorsButtonDefault2: TBitBtnEx;
    NightModeGamesListStatusBarButtonDefault2: TBitBtnEx;
    NightModePanelsBackgroundColorsDefaultButton2: TBitBtnEx;
    NightModeSearchGamesPanelColorsButtonDefault2: TBitBtnEx;
    NightModeButtonColorsBoxButtonUpdateScreenButtons: TBitBtnEx;
    NightModePanelColorsImageZipTextFontColorLabel: TShadowLabel;
    NightModeCheckBoxRadioButtonBox: TPanelEx;
    CheckBoxRadioButtonBoxLabel: TShadowLabel;
    NightModeCheckBoxRadioButtonBoxFolderFullPathLabel: TShadowLabel;
    NightModeCheckBoxRadioButtonProfile: TComboBox2Ex;
    NightModeCheckBoxRadioButton_Radio1: TAdvOfficeRadioButtonEx;
    NightModeCheckBoxRadioButton_Radio2: TAdvOfficeRadioButtonEx;
    NightModeCheckBoxRadioButton_Check1: TAdvOfficeCheckBoxEx;
    NightModeCheckBoxRadioButtonProfileButtonUpdate: TBitBtnEx;
    NightModeLabelSearchGamesFloatingPanel: TShadowLabel;
    NightModeUseWin10DarkModeScrollBars: TAdvOfficeCheckBoxEx;
    NightModeUseWin10DarkModeScrollBarsButtonHelp: TBitBtnEx;
    procedure NightModeButtonColorsSampleButton1Click(Sender: TObject);
    procedure NightModeButtonColorFontColorSelect(Sender: TObject);
    procedure NightModeButtonColorGradientTopSelect(Sender: TObject);
    procedure NightModeButtonColorGradientBottomSelect(Sender: TObject);
    procedure NightModeButtonColorFrameColorSelect(Sender: TObject);
    procedure NightModeButtonColorFrameColorFocusedSelect(Sender: TObject);
    procedure NightModeButtonColorGradientTopHoverSelect(Sender: TObject);
    procedure NightModeButtonColorGradientBottomHoverSelect(
      Sender: TObject);
    procedure NightModeButtonColorFrameColorHoverSelect(Sender: TObject);
    procedure NightModeButtonColorGradientTopSelectedSelect(
      Sender: TObject);
    procedure NightModeButtonColorGradientBottomSelectedSelect(
      Sender: TObject);
    procedure NightModeButtonColorFrameColorSelectedSelect(
      Sender: TObject);
    procedure NightModeButtonColorFontColorDisabledSelect(Sender: TObject);
    procedure NightModeButtonColorFontShadowColorDisabledSelect(
      Sender: TObject);
    procedure NightModeButtonColorGradientTopDisabledSelect(
      Sender: TObject);
    procedure NightModeButtonColorGradientBottomDisabledSelect(
      Sender: TObject);
    procedure NightModeButtonColorFrameColorDisabledSelect(
      Sender: TObject);
    procedure NightModeColorsBoxButtonDefaultClick(Sender: TObject);
    procedure ButtonPage1Click(Sender: TObject);
    procedure ButtonPage2Click(Sender: TObject);
    procedure NightModeGamesBackgroundColorSelect(Sender: TObject);
    procedure NightModeGamesBackgroundColorButtonDefaultClick(Sender: TObject);
    procedure NightModeGamesBackgroundImageEnableClick(Sender: TObject);
    procedure NightModeGamesTileBackgroundClick(Sender: TObject);
    procedure NightModeGamesBackgroundImageButtonSelectClick(
      Sender: TObject);
    procedure NightModeGamesBackgroundImageButtonUpdateClick(
      Sender: TObject);
    procedure NightModeGameSelectionGradientBarClick(Sender: TObject);
    procedure NightModeGameSelectionAlphaBlendClick(Sender: TObject);
    procedure NightModeGameSelectionButtonDefaultClick(Sender: TObject);
    procedure ToolBarOverlayIconsFolderSelect(Sender: TObject);
    procedure ToolBarOverlayIconsFolderButtonUpdateClick(Sender: TObject);
    procedure NightModeToolBarGradientBarClick(Sender: TObject);
    procedure NightModeToolBarBkTopColorSelect(Sender: TObject);
    procedure NightModeToolBarBkBottomColorSelect(Sender: TObject);
    procedure NightModeToolBarBkColorsButtonDefaultClick(Sender: TObject);
    procedure NightModeGamesListStatusBarGradientBarClick(Sender: TObject);
    procedure NightModeGamesListStatusBarTopColorSelect(Sender: TObject);
    procedure NightModeGamesListStatusBarBottomColorSelect(
      Sender: TObject);
    procedure NightModeGamesListStatusBarFontColorSelect(Sender: TObject);
    procedure NightModeGamesListStatusBarButtonDefaultClick(
      Sender: TObject);
    procedure NightModeSearchGamesPanelGradientBarClick(Sender: TObject);
    procedure NightModeSearchGamesPanelTopColorSelect(Sender: TObject);
    procedure NightModeSearchGamesPanelBottomColorSelect(Sender: TObject);
    procedure NightModeSearchGamesPanelInnerFrameColorSelect(
      Sender: TObject);
    procedure NightModeSearchGamesPanelOuterFrameColorSelect(
      Sender: TObject);
    procedure NightModePanelColorsTitle2FontColorSelect(Sender: TObject);
    procedure NightModePanelColorsImageCategoryTextFontColorSelect(Sender: TObject);
    procedure NightModePanelColorsImageZipTextFontColorSelect(
      Sender: TObject);
    procedure NightModePanelColorsTitleFontColorSelect(Sender: TObject);
    procedure NightModePanelColorsTitleShadowFontColorSelect(
      Sender: TObject);
    procedure NightModePanelColorsTitle2ShadowFontColorSelect(
      Sender: TObject);
    procedure NightModePanelsBackgroundColorsDefaultButtonClick(
      Sender: TObject);
    procedure NightModeSearchGamesPanelFilterFontColorSelect(
      Sender: TObject);
    procedure NightModeSearchGamesPanelFieldFontColorSelect(
      Sender: TObject);
    procedure NightModeSearchGamesPanelEditBoxFontColorSelect(
      Sender: TObject);
    procedure NightModeSearchGamesPanelEditBoxBackgroundColorSelect(
      Sender: TObject);
    procedure NightModeSearchGamesPanelEditBoxCustomFrameColorSelect(
      Sender: TObject);
    procedure NightModeSearchGamesPanelEditBoxCustomFocusedFrameColorSelect(
      Sender: TObject);
    procedure NightModeSearchGamesPanelCaptionBarFontColorSelect(
      Sender: TObject);
    procedure NightModeSearchGamesPanelColorsButtonDefaultClick(
      Sender: TObject);
    procedure NightModeGamesListSplitterShowGripIconClick(Sender: TObject);
    procedure NightModeGamesListSplitterSingleColorSelect(Sender: TObject);
    procedure NightModeGamesListSplitterSingleColorButtonDefaultClick(
      Sender: TObject);
    procedure NightModeGameDocumentsBackgroundColorSelect(Sender: TObject);
    procedure NightModeGameDocumentsButtonDefaultClick(Sender: TObject);
    procedure NightModeGameDocsShowBorderClick(Sender: TObject);
    procedure NightModeGameDocsBorderColorSelect(Sender: TObject);
    procedure NightModeGameDocsBorderColorButtonDefaultClick(
      Sender: TObject);
    procedure NightModeGameDocsShowStatusBarClick(Sender: TObject);
    procedure NightModeMenuPopupMenuFrameColorDefaultColorsClick(
      Sender: TObject);
    procedure NightModeHintBoxtColorsButtonDefaultClick(Sender: TObject);
    procedure NightModeHintBox_OpacityChange(Sender: TObject);
    procedure NightModeHintBox_OpacityButtonDefaultClick(Sender: TObject);
    procedure NightModeHintTextDefaultColorsButtonDefaultClick(Sender: TObject);
    procedure NightModeImageSplitterShowGripIconClick(Sender: TObject);
    procedure NightModeImageSplitterSingleColorSelect(Sender: TObject);
    procedure NightModeImageSplitterSingleColorHotSelect(Sender: TObject);
    procedure NightModeImageSplitterSingleColorButtonDefaultClick(
      Sender: TObject);
    procedure NightModeImageBorderColorSelect(Sender: TObject);
    procedure NightModeImageBorderColorButtonDefaultClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure NightModeHintBox_ColorSelect(Sender: TObject);
    procedure NightModeHintBox_FrameEnabledClick(Sender: TObject);
    procedure NightModeHintBox_FrameColorSelect(Sender: TObject);
    procedure NightModeHintBox_TextColorSelect(Sender: TObject);
    procedure NightModeHintBox_TextShadowColorSelect(Sender: TObject);
    procedure NightModeHintBox_TextShadowEnabledClick(Sender: TObject);
    procedure NightModeHintBox_FontItalicStyleClick(Sender: TObject);
    procedure NightModeGamesListViewItemSelectionChanged(
      Sender: TCustomEasyListview; Item: TEasyItem);
    procedure NightModeGamesListViewItemPaintText(
      Sender: TCustomEasyListview; Item: TEasyItem; Position: Integer;
      ACanvas: TCanvas);
    procedure NightModeGamesSelectionBarPreviewButtonCloseMouseEnter(
      Sender: TObject);
    procedure NightModeGamesSelectionBarPreviewButtonCloseMouseLeave(
      Sender: TObject);
    procedure NightModeGamesSelectionBarPreviewButtonCloseClick(
      Sender: TObject);
    procedure NightModeGameSelectionButtonPreviewClick(Sender: TObject);
    procedure NightModePanelColorsBoxPreviewButtonCloseClick(Sender: TObject);
    procedure NightModePanelColorsBoxButtonPreviewClick(Sender: TObject);
    procedure NightModeImagesHintBoxPreviewButtonCloseClick(
      Sender: TObject);
    procedure NightModeImagesHintBoxButtonPreviewClick(Sender: TObject);
    procedure NightModeProfilesSelect(Sender: TObject);
    procedure NightModePanelColorsTitleShadowEnabledClick(Sender: TObject);
    procedure NightModePanelColorsTitle2ShadowEnabledClick(Sender: TObject);
    procedure NightModeImageHintPanel_ImageView1Click(Sender: TObject);
    procedure NightModeHintBox_LargerFontSizeClick(Sender: TObject);
    procedure NightModeHintBox_PositionChange(Sender: TObject);
    procedure NightModeGameSelectionRoundCornersClick(Sender: TObject);
    procedure NightModeLabelButtonColorFontShadowColorDisabledClick(
      Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure NightModeMenuPopupMenuFrameColorSelect(Sender: TObject);
    procedure NightModeProfiles_ButtonUpdateClick(Sender: TObject);
    procedure NightModeProfiles_ButtonReloadClick(Sender: TObject);
    procedure NightModeProfiles_ButtonSaveClick(Sender: TObject);
    procedure NightModeSearchGamesPanelColorsButtonPreviewClick(
      Sender: TObject);
    procedure NightModeSearchGamesPanelColorsBoxPreviewButtonCloseClick(Sender: TObject);
    procedure NightModeToolBarFilterTitleCustomDraw(Sender: TToolBar;
      const ARect: TRect; var DefaultDraw: Boolean);
    procedure NightModeProfiles_ButtonNewClick(Sender: TObject);
    procedure NightModeProfiles_ButtonDeleteClick(Sender: TObject);
    procedure NightModeGamesListSplitterSingleColorHotSelect(
      Sender: TObject);
    procedure NightModeButtonColorsBoxPreviewButtonCloseClick(
      Sender: TObject);
    procedure NightModeColorsBoxButtonPreviewClick(Sender: TObject);
    procedure NightModeGamesListHeaderFontClick(Sender: TObject);
    procedure NightModeGamesListHeaderBackgroundColorSelect(
      Sender: TObject);
    procedure NightModeGamesListHeaderBackgroundColorHoverSelect(
      Sender: TObject);
    procedure NightModeGamesListHeaderBackgroundColorDownSelect(
      Sender: TObject);
    procedure NightModeGamesListHeaderButtonDefaultClick(Sender: TObject);
    procedure NightModeNewProfileBoxButtonCloseClick(Sender: TObject);
    procedure NightModeNewProfileProfilesListItemSelectionChanged(
      Sender: TCustomEasyListview; Item: TEasyItem);
    procedure NightModeNewProfileBoxButtonConfirmClick(Sender: TObject);
    procedure NightModeNewProfileProfilesListItemPaintText(
      Sender: TCustomEasyListview; Item: TEasyItem; Position: Integer;
      ACanvas: TCanvas);
    procedure NightModeProfiles_ButtonDefaultClick(Sender: TObject);
    procedure NightModeNewProfileUseColorsActiveProfileClick(
      Sender: TObject);
    procedure NightModeButtonColorsBoxButtonUpdateScreenButtonsClick(
      Sender: TObject);
    procedure NightModeGameDocsFont_SettingClick(Sender: TObject);
    procedure NightModeCheckBoxRadioButtonProfileSelect(Sender: TObject);
    procedure NightModeCheckBoxRadioButtonProfileButtonUpdateClick(Sender: TObject);
    procedure NightModeUseWin10DarkModeScrollBarsButtonHelpClick(
      Sender: TObject);
  private
    { Private declarations }
    MoveControls: Boolean;
    //CurrentPickColor, CopyPickColor: TColor;
    CurrentProfileName: String;
    procedure UpdateGamesBackgroundImage(ImageEnabledCheckBox: TAdvOfficeCheckBoxEx; ImageFileNameEditBox: TEditEx; NightModeControls: Boolean; IsNightModePreview: Boolean = False);
    procedure NightModeRepaintToolBar;
    procedure SetPanelExParentPos(PanelSource: TPanelEx; LeftPos, TopPos: Integer);
    procedure HintBoxUpdateSize;
  public
    { Public declarations }
    procedure AddNightModeProfiles(ReloadList: Boolean; AddNewProfileName: String = '');
    procedure PopulateIconOverlayFoldersList;

    procedure NewProfile_PopulateELV;

  end;

var
  FormNightMode: TFormNightMode;

implementation

uses uMain, uApplyFilterMsgBox;

{$R *.dfm}

procedure TFormNightMode.UpdateGamesBackgroundImage(ImageEnabledCheckBox: TAdvOfficeCheckBoxEx; ImageFileNameEditBox: TEditEx; NightModeControls: Boolean; IsNightModePreview: Boolean = False);
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
                  if NightModeControls = IsNightMode then
                  begin
                    if not IsNightModePreview then
                    begin
                      if FormMain.GamesListView.BackGround.Image <> nil then
                         FormMain.GamesListView.BackGround.Image:= nil;

                      if FormMain.MachinesListSidePanel.BackGround.Image <> nil then
                         FormMain.MachinesListSidePanel.BackGround.Image:= nil;
                    end;
                  end;
                  if NightModeControls then
                     if NightModeGamesListView.BackGround.Image <> nil then
                        NightModeGamesListView.BackGround.Image:= nil;
                  //FormMain.BlinkBkEdit(ImageFileNameEditBox);
                end;
             Exit;
           end;

        try
          ListViewBk:= TPNGGraphic.Create;
          ListViewBk.LoadFromFile(FileFullPath);
          if NightModeControls = IsNightMode then
          begin
            if not IsNightModePreview then
            begin
              FormMain.GamesListView.BackGround.Image.Assign(ListViewBk);
              FormMain.MachinesListSidePanel.BackGround.Image.Assign(ListViewBk);
            end;
          end;
          if NightModeControls then
             NightModeGamesListView.BackGround.Image.Assign(ListViewBk);
          FreeAndNil(ListViewBk);
        except
          if NightModeControls = IsNightMode then
          begin
            if not IsNightModePreview then
            begin
              FormMain.GamesListView.Background.Image:= nil;
              FormMain.MachinesListSidePanel.BackGround.Image:= nil;
            end;
          end;
          if NightModeControls then
             NightModeGamesListView.BackGround.Image:= nil;
        end;
      end;
    False:
      begin
        if NightModeControls = IsNightMode then
        begin
          if not IsNightModePreview then
          begin
            FormMain.GamesListView.Background.Image:= nil;
            FormMain.MachinesListSidePanel.BackGround.Image:= nil;
          end;
        end;
        if NightModeControls then
           NightModeGamesListView.BackGround.Image:= nil;
      end;
  end;
end;

procedure TFormNightMode.AddNightModeProfiles(ReloadList: Boolean; AddNewProfileName: String = '');
var
  iFiles: THashedStringList;
  Loop, iIndex: Integer;
  iStr: String;
begin
  NightModeProfiles.Tag:= 1;
  if ReloadList then
     NightModeProfiles.Items.Clear;

  NightModeProfiles.Items.Add('Default');
  iFiles:= THashedStringList.Create;
  GetFilesList(FormMain.GetNightModeFolder, '.ini', '*.ini', iFiles, False, True, False);
  iIndex:= 0;
  if iFiles.Count > 0 then
     begin
       NightModeProfiles.Items.BeginUpdate;
       for Loop:=0 to iFiles.Count-1 do
       begin
         iStr:= ChangeFileExt(iFiles[Loop], '');
         if not SameText('Default', iStr) then
            NightModeProfiles.Items.Add(iStr);
       end;
       NightModeProfiles.Items.EndUpdate;
       if AddNewProfileName = '' then
          iStr:= FormMain.NightModeProfileStr
       else
          iStr:= AddNewProfileName;
       if not SameText('Default', iStr) then
          begin
            iIndex:= NightModeProfiles.Items.IndexOf(iStr);
            if iIndex = -1 then
               iIndex:= 0;
          end;
     end;
  FreeAndNil(iFiles);
  NightModeProfiles.Tag:= 0;
  //NightModeProfiles.ItemIndex:= iIndex;
  SetSelectedComboBox(iIndex, NightModeProfiles);
end;

procedure TFormNightMode.PopulateIconOverlayFoldersList;
var
  iFoldersList: THashedStringList;
  iIndex: Integer;
  CurrentFolder: String;
begin
  ToolBarOverlayIconsFolder.Tag:= 1;
  CurrentFolder:= FormMain.ToolBarOverlayIconFolderStr;
  if CurrentFolder = '' then
     CurrentFolder:= 'Default';
  ToolBarOverlayIconsFolder.Items.BeginUpdate;
  ToolBarOverlayIconsFolder.Clear;
  ToolBarOverlayIconsFolder.Items.Add('Default');

  iFoldersList:= THashedStringList.Create;
  GetFoldersList2(FormMain.GetFolderFull(32)+'overlay\', iFoldersList, True, False);
  Application.ProcessMessages;
  if iFoldersList.Count > 0 then
     begin
       ToolBarOverlayIconsFolder.Items.AddStrings(iFoldersList);
       iIndex:= ToolBarOverlayIconsFolder.Items.IndexOf('img_dark');
       if iIndex <> -1 then
          ToolBarOverlayIconsFolder.Items.Delete(iIndex);
     end;
  FreeAndNil(iFoldersList);
  ToolBarOverlayIconsFolder.Items.EndUpdate;

  iIndex:= 0; // default "overlay" folder
  if not SameText(CurrentFolder, 'Default') then
     begin
       iIndex:= ToolBarOverlayIconsFolder.Items.IndexOf(CurrentFolder);
       if iIndex = -1 then
          iIndex:= 0;
     end;

  //ToolBarOverlayIconsFolder.ItemIndex:= iIndex;
  ToolBarOverlayIconsFolder.Tag:= 0;
  SetSelectedComboBox(iIndex, ToolBarOverlayIconsFolder);
end;

procedure TFormNightMode.NightModeRepaintToolBar;
begin
  if (not FormMain.IsStartup) and IsNightMode then
     begin
       FormMain.ImagesToolbarButtons.Invalidate;
       FormMain.ToolBarButtons.Invalidate; // games filters tool bar
       FormMain.ToolBarFilterTitle_ToolBar.Invalidate;
     end;
end;

procedure TFormNightMode.NightModeButtonColorsSampleButton1Click(
  Sender: TObject);
begin
  TBitBtnEx(Sender).Tag:= TBitBtnEx(Sender).Tag+1;
  if TBitBtnEx(Sender).Tag > 6 then
     TBitBtnEx(Sender).Tag:= 1;

  case TBitBtnEx(Sender).Tag of
    1: SetPanelColors(NightModeButtonColorsSamplePanel, clrMedDarkGray, -1, True); // this is the bk color of the panels
    2: SetPanelColors(NightModeButtonColorsSamplePanel, menu_background_color[1], -1, True);
    3: SetPanelColors(NightModeButtonColorsSamplePanel, menu_background_color[1], clrMedDarkGray);
    4: SetPanelColors(NightModeButtonColorsSamplePanel, clrBlackBk, clrDarkGray);
    5: SetPanelColors(NightModeButtonColorsSamplePanel, clrDarkGray, -1, True);
    6: SetPanelColors(NightModeButtonColorsSamplePanel, menu_background_color[1], clrDarkGray, True);
  end;
  NightModeButtonColorsSampleButton1.Invalidate;
  NightModeButtonColorsSampleButton2.Invalidate;
  NightModeButtonColorsSampleButton3.Invalidate;
  NightModeButtonColorsSampleButton4.Invalidate;
end;

procedure TFormNightMode.NightModeButtonColorFontColorSelect(
  Sender: TObject);
begin
  NightModeButtonColorsSampleButton1.Font.Color:= NightModeButtonColorFontColor.Selected;
  NightModeButtonColorsSampleButton2.Font.Color:= NightModeButtonColorsSampleButton1.Font.Color;
  NightModeButtonColorsSampleButton3.Font.Color:= NightModeButtonColorsSampleButton1.Font.Color;
  NightModeButtonColorsSampleButton4.Font.Color:= NightModeButtonColorsSampleButton1.Font.Color;
end;

procedure TFormNightMode.NightModeButtonColorGradientTopSelect(
  Sender: TObject);
begin
  NightModeButtonColorsSampleButton1.GradientColorTop:= NightModeButtonColorGradientTop.Selected;
  NightModeButtonColorsSampleButton2.GradientColorTop:= NightModeButtonColorsSampleButton1.GradientColorTop;
  NightModeButtonColorsSampleButton3.GradientColorTop:= NightModeButtonColorsSampleButton1.GradientColorTop;
  NightModeButtonColorsSampleButton4.GradientColorTop:= NightModeButtonColorsSampleButton1.GradientColorTop;
end;

procedure TFormNightMode.NightModeButtonColorGradientBottomSelect(
  Sender: TObject);
begin
  NightModeButtonColorsSampleButton1.GradientColorBottom:= NightModeButtonColorGradientBottom.Selected;
  NightModeButtonColorsSampleButton2.GradientColorBottom:= NightModeButtonColorsSampleButton1.GradientColorBottom;
  NightModeButtonColorsSampleButton3.GradientColorBottom:= NightModeButtonColorsSampleButton1.GradientColorBottom;
  NightModeButtonColorsSampleButton4.GradientColorBottom:= NightModeButtonColorsSampleButton1.GradientColorBottom;
end;

procedure TFormNightMode.NightModeButtonColorFrameColorSelect(
  Sender: TObject);
begin
  NightModeButtonColorsSampleButton1.FrameColor:= NightModeButtonColorFrameColor.Selected;
  NightModeButtonColorsSampleButton2.FrameColor:= NightModeButtonColorsSampleButton1.FrameColor;
  NightModeButtonColorsSampleButton3.FrameColor:= NightModeButtonColorsSampleButton1.FrameColor;
  NightModeButtonColorsSampleButton4.FrameColor:= NightModeButtonColorsSampleButton1.FrameColor;
end;

procedure TFormNightMode.NightModeButtonColorFrameColorFocusedSelect(
  Sender: TObject);
begin
  NightModeButtonColorsSampleButton1.FrameColor_Focused:= NightModeButtonColorFrameColorFocused.Selected;
  NightModeButtonColorsSampleButton2.FrameColor_Focused:= NightModeButtonColorsSampleButton1.FrameColor_Focused;
  NightModeButtonColorsSampleButton3.FrameColor_Focused:= NightModeButtonColorsSampleButton1.FrameColor_Focused;
  NightModeButtonColorsSampleButton4.FrameColor_Focused:= NightModeButtonColorsSampleButton1.FrameColor_Focused;
end;

procedure TFormNightMode.NightModeButtonColorGradientTopHoverSelect(
  Sender: TObject);
begin
  NightModeButtonColorsSampleButton1.GradientColorTop_Hover:= NightModeButtonColorGradientTopHover.Selected;
  NightModeButtonColorsSampleButton2.GradientColorTop_Hover:= NightModeButtonColorsSampleButton1.GradientColorTop_Hover;
  NightModeButtonColorsSampleButton3.GradientColorTop_Hover:= NightModeButtonColorsSampleButton1.GradientColorTop_Hover;
  NightModeButtonColorsSampleButton4.GradientColorTop_Hover:= NightModeButtonColorsSampleButton1.GradientColorTop_Hover;
end;

procedure TFormNightMode.NightModeButtonColorGradientBottomHoverSelect(
  Sender: TObject);
begin
  NightModeButtonColorsSampleButton1.GradientColorBottom_Hover:= NightModeButtonColorGradientBottomHover.Selected;
  NightModeButtonColorsSampleButton2.GradientColorBottom_Hover:= NightModeButtonColorsSampleButton1.GradientColorBottom_Hover;
  NightModeButtonColorsSampleButton3.GradientColorBottom_Hover:= NightModeButtonColorsSampleButton1.GradientColorBottom_Hover;
  NightModeButtonColorsSampleButton4.GradientColorBottom_Hover:= NightModeButtonColorsSampleButton1.GradientColorBottom_Hover;
end;

procedure TFormNightMode.NightModeButtonColorFrameColorHoverSelect(
  Sender: TObject);
begin
  NightModeButtonColorsSampleButton1.FrameColor_Hover:= NightModeButtonColorFrameColorHover.Selected;
  NightModeButtonColorsSampleButton2.FrameColor_Hover:= NightModeButtonColorsSampleButton1.FrameColor_Hover;
  NightModeButtonColorsSampleButton3.FrameColor_Hover:= NightModeButtonColorsSampleButton1.FrameColor_Hover;
  NightModeButtonColorsSampleButton4.FrameColor_Hover:= NightModeButtonColorsSampleButton1.FrameColor_Hover;
end;

procedure TFormNightMode.NightModeButtonColorGradientTopSelectedSelect(
  Sender: TObject);
begin
  NightModeButtonColorsSampleButton1.GradientColorTop_Down:= NightModeButtonColorGradientTopSelected.Selected;
  NightModeButtonColorsSampleButton2.GradientColorTop_Down:= NightModeButtonColorGradientTopSelected.Selected;
  NightModeButtonColorsSampleButton3.GradientColorTop_Down:= NightModeButtonColorGradientTopSelected.Selected;
  NightModeButtonColorsSampleButton4.GradientColorTop_Down:= NightModeButtonColorGradientTopSelected.Selected;
end;

procedure TFormNightMode.NightModeButtonColorGradientBottomSelectedSelect(
  Sender: TObject);
begin
  NightModeButtonColorsSampleButton1.GradientColorBottom_Down:= NightModeButtonColorGradientBottomSelected.Selected;
  NightModeButtonColorsSampleButton2.GradientColorBottom_Down:= NightModeButtonColorGradientBottomSelected.Selected;
  NightModeButtonColorsSampleButton3.GradientColorBottom_Down:= NightModeButtonColorGradientBottomSelected.Selected;
  NightModeButtonColorsSampleButton4.GradientColorBottom_Down:= NightModeButtonColorGradientBottomSelected.Selected;
end;

procedure TFormNightMode.NightModeButtonColorFrameColorSelectedSelect(
  Sender: TObject);
begin
  NightModeButtonColorsSampleButton1.FrameColor_Down:= NightModeButtonColorFrameColorSelected.Selected;
  NightModeButtonColorsSampleButton2.FrameColor_Down:= NightModeButtonColorFrameColorSelected.Selected;
  NightModeButtonColorsSampleButton3.FrameColor_Down:= NightModeButtonColorFrameColorSelected.Selected;
  NightModeButtonColorsSampleButton4.FrameColor_Down:= NightModeButtonColorFrameColorSelected.Selected;
end;

procedure TFormNightMode.NightModeButtonColorFontColorDisabledSelect(
  Sender: TObject);
begin
  NightModeButtonColorsSampleButton1.FontColorDisabled:= NightModeButtonColorFontColorDisabled.Selected;
  NightModeButtonColorsSampleButton2.FontColorDisabled:= NightModeButtonColorsSampleButton1.FontColorDisabled;
  NightModeButtonColorsSampleButton3.FontColorDisabled:= NightModeButtonColorsSampleButton1.FontColorDisabled;
  NightModeButtonColorsSampleButton4.FontColorDisabled:= NightModeButtonColorsSampleButton1.FontColorDisabled;
end;

procedure TFormNightMode.NightModeButtonColorFontShadowColorDisabledSelect(
  Sender: TObject);
begin
  NightModeButtonColorsSampleButton1.FontShadowColorDisabled:= NightModeButtonColorFontShadowColorDisabled.Selected;
  NightModeButtonColorsSampleButton2.FontShadowColorDisabled:= NightModeButtonColorsSampleButton1.FontShadowColorDisabled;
  NightModeButtonColorsSampleButton3.FontShadowColorDisabled:= NightModeButtonColorsSampleButton1.FontShadowColorDisabled;
  NightModeButtonColorsSampleButton4.FontShadowColorDisabled:= NightModeButtonColorsSampleButton1.FontShadowColorDisabled;
end;

procedure TFormNightMode.NightModeButtonColorGradientTopDisabledSelect(
  Sender: TObject);
begin
  NightModeButtonColorsSampleButton1.GradientColorTop_Disabled:= NightModeButtonColorGradientTopDisabled.Selected;
  NightModeButtonColorsSampleButton2.GradientColorTop_Disabled:= NightModeButtonColorsSampleButton1.GradientColorTop_Disabled;
  NightModeButtonColorsSampleButton3.GradientColorTop_Disabled:= NightModeButtonColorsSampleButton1.GradientColorTop_Disabled;
  NightModeButtonColorsSampleButton4.GradientColorTop_Disabled:= NightModeButtonColorsSampleButton1.GradientColorTop_Disabled;
end;

procedure TFormNightMode.NightModeButtonColorGradientBottomDisabledSelect(
  Sender: TObject);
begin
  NightModeButtonColorsSampleButton1.GradientColorBottom_Disabled:= NightModeButtonColorGradientBottomDisabled.Selected;
  NightModeButtonColorsSampleButton2.GradientColorBottom_Disabled:= NightModeButtonColorsSampleButton1.GradientColorBottom_Disabled;
  NightModeButtonColorsSampleButton3.GradientColorBottom_Disabled:= NightModeButtonColorsSampleButton1.GradientColorBottom_Disabled;
  NightModeButtonColorsSampleButton4.GradientColorBottom_Disabled:= NightModeButtonColorsSampleButton1.GradientColorBottom_Disabled;
end;

procedure TFormNightMode.NightModeButtonColorFrameColorDisabledSelect(
  Sender: TObject);
begin
  NightModeButtonColorsSampleButton1.FrameColor_Disabled:= NightModeButtonColorFrameColorDisabled.Selected;
  NightModeButtonColorsSampleButton2.FrameColor_Disabled:= NightModeButtonColorsSampleButton1.FrameColor_Disabled;
  NightModeButtonColorsSampleButton3.FrameColor_Disabled:= NightModeButtonColorsSampleButton1.FrameColor_Disabled;
  NightModeButtonColorsSampleButton4.FrameColor_Disabled:= NightModeButtonColorsSampleButton1.FrameColor_Disabled;
end;

procedure TFormNightMode.NightModeColorsBoxButtonDefaultClick(
  Sender: TObject);
begin
  SetDefaultColorBox(NightModeButtonColorFontColor);
  SetDefaultColorBox(NightModeButtonColorGradientTop);
  SetDefaultColorBox(NightModeButtonColorGradientBottom);
  SetDefaultColorBox(NightModeButtonColorFrameColor);

  SetDefaultColorBox(NightModeButtonColorFrameColorFocused);

  SetDefaultColorBox(NightModeButtonColorGradientTopHover);
  SetDefaultColorBox(NightModeButtonColorGradientBottomHover);
  SetDefaultColorBox(NightModeButtonColorFrameColorHover);

  NightModeLabelButtonColorFontShadowColorDisabled.Checked:= False;  
  if TBitBtnEx(Sender).Tag = 0 then
     begin
       // my button colors
       FormMain.SetSelectedColorBox(NightModeButtonColorGradientTopSelected, $00a66632); // RGB(50, 102, 166)
       FormMain.SetSelectedColorBox(NightModeButtonColorGradientBottomSelected, $008c5326); // RGB(38, 83, 140)
       FormMain.SetSelectedColorBox(NightModeButtonColorFrameColorSelected, $00222222); // RGB(34, 34, 34)

       // disabled state
       FormMain.SetSelectedColorBox(NightModeButtonColorFontColorDisabled, clGray);
       FormMain.SetSelectedColorBox(NightModeButtonColorFontShadowColorDisabled, clrDarkGray);

       //FormMain.SetSelectedColorBox(NightModeButtonColorGradientTopDisabled, $00646464); // RGB(100, 100, 100) ... just in case
       FormMain.SetSelectedColorBox(NightModeButtonColorGradientBottomDisabled, clrMedDarkGray);
       FormMain.SetSelectedColorBox(NightModeButtonColorFrameColorDisabled, $00222222); // RGB(34, 34, 34)
     end
  else
     begin
       // Fabian button colors (orange "selected")
       SetDefaultColorBox(NightModeButtonColorGradientTopSelected);
       SetDefaultColorBox(NightModeButtonColorGradientBottomSelected);
       SetDefaultColorBox(NightModeButtonColorFrameColorSelected);

       SetDefaultColorBox(NightModeButtonColorFontColorDisabled);
       SetDefaultColorBox(NightModeButtonColorFontShadowColorDisabled);

       SetDefaultColorBox(NightModeButtonColorGradientTopDisabled);
       SetDefaultColorBox(NightModeButtonColorGradientBottomDisabled);
       SetDefaultColorBox(NightModeButtonColorFrameColorDisabled);
     end;
end;

procedure TFormNightMode.ButtonPage1Click(Sender: TObject);
begin
  if not PanelPage1.Visible then
     begin
       PanelPage2.Visible:= False;
       PanelPage1.Visible:= True;
     end;
end;

procedure TFormNightMode.ButtonPage2Click(Sender: TObject);
begin
  if not PanelPage2.Visible then
     begin
       PanelPage1.Visible:= False;
       PanelPage2.Visible:= True;
     end;
end;

procedure TFormNightMode.NightModeGamesBackgroundColorSelect(
  Sender: TObject);
begin
  if IsNightMode then
     begin
       FormMain.GamesListView.Color:= NightModeGamesBackgroundColor.Selected;
       FormMain.MachinesListSidePanel.Color:= FormMain.GamesListView.Color;
       FormMain.Font_TilesViewDetailsText.Color:= GetContrastColor(NightModeGamesBackgroundColor.Selected);
       FormMain.SetEasyListViewHeaderColors(FormMain.GamesListView, False);
       FormMain.SetEasyListViewHeaderColors(FormMain.MachinesListSidePanel, False);
     end;
  NightModeGamesListView.Color:= NightModeGamesBackgroundColor.Selected;
end;

procedure TFormNightMode.NightModeGamesBackgroundColorButtonDefaultClick(
  Sender: TObject);
begin
  SetDefaultColorBox(NightModeGamesBackgroundColor);
  if IsNightMode then
     FormMain.Font_TilesViewDetailsText.Color:= GetContrastColor(NightModeGamesBackgroundColor.Selected);
end;

procedure TFormNightMode.NightModeGamesBackgroundImageEnableClick(
  Sender: TObject);
begin
  if IsNightMode then
     begin
       FormMain.GamesListView.BackGround.Enabled:= NightModeGamesBackgroundImageEnable.Checked;
       FormMain.MachinesListSidePanel.BackGround.Enabled:= NightModeGamesBackgroundImageEnable.Checked;
     end;
  NightModeGamesListView.BackGround.Enabled:= NightModeGamesBackgroundImageEnable.Checked;
  NightModeGamesBackgroundImageButtonUpdate.Click;
end;

procedure TFormNightMode.NightModeGamesTileBackgroundClick(
  Sender: TObject);
begin
  if IsNightMode then
     begin
       FormMain.GamesListView.BackGround.Tile:= NightModeGamesTileBackground.Checked;
       FormMain.MachinesListSidePanel.BackGround.Tile:= NightModeGamesTileBackground.Checked;
     end;
  NightModeGamesListView.BackGround.Tile:= NightModeGamesTileBackground.Checked;
end;

procedure TFormNightMode.NightModeGamesBackgroundImageButtonSelectClick(
  Sender: TObject);
begin
  FormMain.DialogOpenFile(5, NightModeGamesBackgroundImageEnable.Caption, NightModeGamesBackgroundImage, False);
  NightModeGamesBackgroundImageButtonUpdate.Click;
end;

procedure TFormNightMode.NightModeGamesBackgroundImageButtonUpdateClick(
  Sender: TObject);
begin
  UpdateGamesBackgroundImage(NightModeGamesBackgroundImageEnable, NightModeGamesBackgroundImage, True);
end;

procedure TFormNightMode.NightModeGameSelectionGradientBarClick(
  Sender: TObject);
begin
  if IsNightMode then
     begin
       FormMain.GamesListView.Selection.Gradient:= NightModeGameSelectionGradientBar.Checked;
       FormMain.MachinesListSidePanel.Selection.Gradient:= NightModeGameSelectionGradientBar.Checked;
     end;
  NightModeGamesListView.Selection.Gradient:= NightModeGameSelectionGradientBar.Checked;
end;

procedure TFormNightMode.NightModeGameSelectionAlphaBlendClick(
  Sender: TObject);
begin
  if IsNightMode then
     begin
       FormMain.GamesListView.Selection.AlphaBlend:= NightModeGameSelectionAlphaBlend.Checked;
       FormMain.MachinesListSidePanel.Selection.AlphaBlend:= NightModeGameSelectionAlphaBlend.Checked;
     end;
  NightModeGamesListView.Selection.AlphaBlend:= NightModeGameSelectionAlphaBlend.Checked;
end;

procedure TFormNightMode.NightModeGameSelectionButtonDefaultClick(
  Sender: TObject);
begin
  if TBitBtnEx(Sender).Tag = 0 then
     begin
       FormMain.SetSelectedColorBox(NightModeGamesSelectionTopColor, clrDarkBlue);
       FormMain.SetSelectedColorBox(NightModeGamesSelectionBottomColor, clrBlackBk);
       FormMain.SetSelectedColorBox(NightModeGamesSelectionFrameColor, clBlue);
       FormMain.SetSelectedColorBox(NightModeGamesSelectionFontColor, clWhite);

       FormMain.SetSelectedColorBox(NightModeGamesSelectionMissROMsTopColor, clrDarkRed);
       FormMain.SetSelectedColorBox(NightModeGamesSelectionMissROMsBottomColor, clrBlackBk);
       FormMain.SetSelectedColorBox(NightModeGamesSelectionMissROMsFrameColor, clRed);
       FormMain.SetSelectedColorBox(NightModeGamesSelectionMissROMsFontColor, clWhite);

       FormMain.SetSelectedColorBox(NightModeGamesSelectionInactiveTopColor, $00d2d2c8); // RGB(200, 210, 210)
       FormMain.SetSelectedColorBox(NightModeGamesSelectionInactiveBottomColor, $00dcdcdc); // RGB(220, 220, 220)
       FormMain.SetSelectedColorBox(NightModeGamesSelectionInactiveFrameColor, $008e8e8e); // RGB(142, 142, 142)
       FormMain.SetSelectedColorBox(NightModeGamesSelectionInactiveFontColor, clBlack);
     end
  else
     begin
       SetDefaultColorBox(NightModeGamesSelectionTopColor);
       SetDefaultColorBox(NightModeGamesSelectionBottomColor);
       SetDefaultColorBox(NightModeGamesSelectionFrameColor);
       SetDefaultColorBox(NightModeGamesSelectionFontColor);

       SetDefaultColorBox(NightModeGamesSelectionMissROMsTopColor);
       SetDefaultColorBox(NightModeGamesSelectionMissROMsBottomColor);
       SetDefaultColorBox(NightModeGamesSelectionMissROMsFrameColor);
       SetDefaultColorBox(NightModeGamesSelectionMissROMsFontColor);

       SetDefaultColorBox(NightModeGamesSelectionInactiveTopColor);
       SetDefaultColorBox(NightModeGamesSelectionInactiveBottomColor);
       SetDefaultColorBox(NightModeGamesSelectionInactiveFrameColor);
       SetDefaultColorBox(NightModeGamesSelectionInactiveFontColor);
     end;
  NightModeGameSelectionGradientBar.Checked:= True;
  NightModeGameSelectionAlphaBlend.Checked:= True;
  NightModeGameSelectionRoundCorners.Checked:= True;
end;

procedure TFormNightMode.ToolBarOverlayIconsFolderSelect(Sender: TObject);
var
  CurrentOverlayFolder: String;
begin
  if ToolBarOverlayIconsFolder.Tag = 1 then
     Exit;
  CurrentOverlayFolder:= FormMain.ToolBarOverlayIconFolderStr;
  FormMain.ToolBarOverlayIconFolderStr:= ToolBarOverlayIconsFolder.Text;
  if FormMain.ToolBarOverlayIconFolderStr = '' then
     begin
       // this should never happen
       FormMain.ToolBarOverlayIconFolderStr:= 'Default';
       SetSelectedComboBox(0, ToolBarOverlayIconsFolder);
       //ToolBarOverlayIconsFolder.ItemIndex:= 0;
       Exit;
     end;

  if not SameText(CurrentOverlayFolder, FormMain.ToolBarOverlayIconFolderStr) then
     FormMain.UpdateToolBarOverlays;
end;

procedure TFormNightMode.ToolBarOverlayIconsFolderButtonUpdateClick(
  Sender: TObject);
begin
  PopulateIconOverlayFoldersList;
end;

procedure TFormNightMode.NightModeToolBarGradientBarClick(Sender: TObject);
begin
  if IsNightMode then
     begin
       FormMain.SetPanelExStyle(FormMain.PanelSearchGames_ToolBar, NightModeToolBarGradientBar.Checked);
       FormMain.SetPanelExStyle(FormMain.PanelWebToolBarButtons, NightModeToolBarGradientBar.Checked);
       NightModeRepaintToolBar;
     end;
end;

procedure TFormNightMode.NightModeToolBarBkTopColorSelect(Sender: TObject);
begin
  if IsNightMode then
     begin
       FormMain.PanelSearchGames_ToolBar.Color1:= NightModeToolBarBkTopColor.Selected;
       FormMain.PanelWebToolBarButtons.Color1:= NightModeToolBarBkTopColor.Selected;
     end;
  NightModeRepaintToolBar;
end;

procedure TFormNightMode.NightModeToolBarBkBottomColorSelect(
  Sender: TObject);
begin
  if IsNightMode then
     begin
       FormMain.PanelSearchGames_ToolBar.Color2:= NightModeToolBarBkBottomColor.Selected;
       FormMain.PanelWebToolBarButtons.Color2:= NightModeToolBarBkBottomColor.Selected;
     end;
  NightModeRepaintToolBar;
end;

procedure TFormNightMode.NightModeToolBarBkColorsButtonDefaultClick(
  Sender: TObject);
begin
  if TBitBtnEx(Sender).Tag = 0 then
     begin
       FormMain.SetSelectedColorBox(NightModeToolBarBkTopColor, clrDarkBlue);
       FormMain.SetSelectedColorBox(NightModeToolBarBkBottomColor, clrBlackBk);
     end
  else
     begin
       SetDefaultColorBox(NightModeToolBarBkTopColor);
       SetDefaultColorBox(NightModeToolBarBkBottomColor);
     end;
  NightModeToolBarGradientBar.Checked:= True;
end;

procedure TFormNightMode.NightModeGamesListStatusBarGradientBarClick(
  Sender: TObject);
begin
  if IsNightMode then
     begin
       FormMain.SetPanelExStyle(FormMain.StatusBarPanel, NightModeGamesListStatusBarGradientBar.Checked);
       FormMain.SetPanelExStyle(FormMain.StatusBarPanelMachines, NightModeGamesListStatusBarGradientBar.Checked);
       FormMain.SetPanelExStyle(FormMain.MAMEInfoStatusBar, NightModeGamesListStatusBarGradientBar.Checked);
     end;
end;

procedure TFormNightMode.NightModeGamesListStatusBarTopColorSelect(
  Sender: TObject);
begin
  if IsNightMode then
     begin
       FormMain.StatusBarPanel.Color1:= NightModeGamesListStatusBarTopColor.Selected;
       FormMain.StatusBarPanelMachines.Color1:= NightModeGamesListStatusBarTopColor.Selected;
       FormMain.MAMEInfoStatusBar.Color1:= NightModeGamesListStatusBarTopColor.Selected;
     end;
end;

procedure TFormNightMode.NightModeGamesListStatusBarBottomColorSelect(
  Sender: TObject);
begin
  if IsNightMode then
     begin
       FormMain.StatusBarPanel.Color2:= NightModeGamesListStatusBarBottomColor.Selected;
       FormMain.StatusBarPanelMachines.Color2:= NightModeGamesListStatusBarBottomColor.Selected;
       FormMain.MAMEInfoStatusBar.Color2:= NightModeGamesListStatusBarBottomColor.Selected;
     end;
end;

procedure TFormNightMode.NightModeGamesListStatusBarFontColorSelect(
  Sender: TObject);
begin
  if IsNightMode then
     begin
       FormMain.StatusBar_GamesTotal.Font.Color:= NightModeGamesListStatusBarFontColor.Selected;
       FormMain.StatusBar_GamesGameName.Font.Color:= NightModeGamesListStatusBarFontColor.Selected;
       FormMain.StatusBar_MachinesGameName.Font.Color:= NightModeGamesListStatusBarFontColor.Selected;
     end;
end;

procedure TFormNightMode.NightModeGamesListStatusBarButtonDefaultClick(
  Sender: TObject);
begin
  if TBitBtnEx(Sender).Tag = 0 then
     begin
       FormMain.SetSelectedColorBox(NightModeGamesListStatusBarTopColor, clrDarkBlue);
       FormMain.SetSelectedColorBox(NightModeGamesListStatusBarBottomColor, clrBlackBk);

       FormMain.SetSelectedColorBox(NightModeGamesListStatusBarFontColor, clWhite);
     end
  else
     begin
       SetDefaultColorBox(NightModeGamesListStatusBarTopColor);
       SetDefaultColorBox(NightModeGamesListStatusBarBottomColor);

       SetDefaultColorBox(NightModeGamesListStatusBarFontColor);
     end;

  NightModeGamesListStatusBarGradientBar.Checked:= True;
end;

procedure TFormNightMode.NightModeSearchGamesPanelGradientBarClick(
  Sender: TObject);
begin
  if IsNightMode then
     begin
       FormMain.SetPanelExStyle(FormMain.PanelSearchGames, NightModeSearchGamesPanelGradientBar.Checked);
       FormMain.SetPanelExStyle(FormMain.PanelFilterCPU, NightModeSearchGamesPanelGradientBar.Checked);
       FormMain.ToolBarFilterTitle.Invalidate;
       FormMain.ToolBarFilterByMainCPU.Invalidate;
     end;
  FormMain.SetPanelExStyle(NightModePanelSearchGames, NightModeSearchGamesPanelGradientBar.Checked);
  NightModeToolBarFilterTitle.Invalidate;
end;

procedure TFormNightMode.NightModeSearchGamesPanelTopColorSelect(
  Sender: TObject);
begin
  if IsNightMode then
     begin
       FormMain.PanelSearchGames.Color1:= NightModeSearchGamesPanelTopColor.Selected;
       FormMain.ToolBarFilterTitle.Invalidate;

       FormMain.PanelFilterCPU.Color1:= NightModeSearchGamesPanelTopColor.Selected;
       FormMain.ToolBarFilterByMainCPU.Invalidate;

       FormMain.PanelInitZipFile.Color1:= NightModeSearchGamesPanelTopColor.Selected;

       FormApplyFilterMsgBox.PanelBackground.Color1:= NightModeSearchGamesPanelTopColor.Selected;
     end;
  PanelInitZipFile.Color1:= NightModeSearchGamesPanelTopColor.Selected; // sample panel
  NightModePanelSearchGames.Color1:= NightModeSearchGamesPanelTopColor.Selected; // sample panel
  NightModeToolBarFilterTitle.Invalidate; // sample panel
end;

procedure TFormNightMode.NightModeSearchGamesPanelBottomColorSelect(
  Sender: TObject);
begin
  if IsNightMode then
     begin
       FormMain.PanelSearchGames.Color2:= NightModeSearchGamesPanelBottomColor.Selected;
       FormMain.ToolBarFilterTitle.Invalidate;

       FormMain.PanelFilterCPU.Color2:= NightModeSearchGamesPanelBottomColor.Selected;
       FormMain.ToolBarFilterByMainCPU.Invalidate;

       FormMain.PanelInitZipFile.Color2:= NightModeSearchGamesPanelBottomColor.Selected;

       FormApplyFilterMsgBox.PanelBackground.Color2:= NightModeSearchGamesPanelBottomColor.Selected;
     end;
  PanelInitZipFile.Color2:= NightModeSearchGamesPanelBottomColor.Selected; // sample panel
  NightModePanelSearchGames.Color2:= NightModeSearchGamesPanelBottomColor.Selected; // sample panel
  NightModeToolBarFilterTitle.Invalidate; // sample panel
end;

procedure TFormNightMode.NightModeSearchGamesPanelInnerFrameColorSelect(
  Sender: TObject);
begin
  if IsNightMode then
     begin
       FormMain.PanelSearchGames.ColorInnerFrame:= NightModeSearchGamesPanelInnerFrameColor.Selected;
       FormMain.PanelFilterCPU.ColorInnerFrame:= NightModeSearchGamesPanelInnerFrameColor.Selected;

       FormMain.PanelInitZipFile.ColorInnerFrame:= NightModeSearchGamesPanelInnerFrameColor.Selected;

       FormApplyFilterMsgBox.PanelBackground.ColorInnerFrame:= NightModeSearchGamesPanelInnerFrameColor.Selected;
     end;
  PanelInitZipFile.ColorInnerFrame:= NightModeSearchGamesPanelInnerFrameColor.Selected; // sample panel
  NightModePanelSearchGames.ColorInnerFrame:= NightModeSearchGamesPanelInnerFrameColor.Selected; // sample panel
end;

procedure TFormNightMode.NightModeSearchGamesPanelOuterFrameColorSelect(
  Sender: TObject);
begin
  if IsNightMode then
     begin
       FormMain.PanelSearchGames.ColorFrame:= NightModeSearchGamesPanelOuterFrameColor.Selected;
       FormMain.PanelFilterCPU.ColorFrame:= NightModeSearchGamesPanelOuterFrameColor.Selected;

       FormMain.PanelInitZipFile.ColorFrame:= NightModeSearchGamesPanelOuterFrameColor.Selected;

       FormApplyFilterMsgBox.PanelBackground.ColorFrame:= NightModeSearchGamesPanelOuterFrameColor.Selected;
     end;
  PanelInitZipFile.ColorFrame:= NightModeSearchGamesPanelOuterFrameColor.Selected; // sample panel
  NightModePanelSearchGames.ColorFrame:= NightModeSearchGamesPanelOuterFrameColor.Selected; // sample panel
end;

procedure TFormNightMode.NightModePanelColorsTitle2FontColorSelect(
  Sender: TObject);
begin
  if IsNightMode then
     begin
       FormMain.LabelInitZipSystemTitle.Font.Color:= NightModePanelColorsTitle2FontColor.Selected;
     end;
  LabelInitZipSystemTitle.Font.Color:= NightModePanelColorsTitle2FontColor.Selected; // sample panel
end;

procedure TFormNightMode.NightModePanelColorsImageCategoryTextFontColorSelect(
  Sender: TObject);
begin
  if IsNightMode then
     begin
       FormMain.LabelInitZipImageCategory.Font.Color:= NightModePanelColorsImageCategoryTextFontColor.Selected;
     end;
  LabelInitZipImageCategory.Font.Color:= NightModePanelColorsImageCategoryTextFontColor.Selected; // sample panel
end;

procedure TFormNightMode.NightModePanelColorsImageZipTextFontColorSelect(
  Sender: TObject);
begin
  if IsNightMode then
     begin
       FormMain.LabelInitZipFile.Font.Color:= NightModePanelColorsImageZipTextFontColor.Selected;
       FormApplyFilterMsgBox.LabelBoxMessage.Font.Color:= NightModePanelColorsImageZipTextFontColor.Selected;
     end;

  LabelInitZipFile.Font.Color:= NightModePanelColorsImageZipTextFontColor.Selected; // sample panel
end;

procedure TFormNightMode.NightModePanelColorsTitleFontColorSelect(
  Sender: TObject);
begin
  if IsNightMode then
     begin
       FormMain.LabelInitZipTitle.Font.Color:= NightModePanelColorsTitleFontColor.Selected;

       FormApplyFilterMsgBox.LabelBoxMessageTitle.Font.Color:= NightModePanelColorsTitleFontColor.Selected;
     end;
  LabelInitZipTitle.Font.Color:= NightModePanelColorsTitleFontColor.Selected; // sample panel
end;

procedure TFormNightMode.NightModePanelColorsTitleShadowFontColorSelect(
  Sender: TObject);
begin
  if IsNightMode then
     begin
       FormMain.LabelInitZipTitle.ShadowColor:= NightModePanelColorsTitleShadowFontColor.Selected;

       FormApplyFilterMsgBox.LabelBoxMessageTitle.ShadowColor:= NightModePanelColorsTitleShadowFontColor.Selected;
     end;
  LabelInitZipTitle.ShadowColor:= NightModePanelColorsTitleShadowFontColor.Selected; // sample panel
end;

procedure TFormNightMode.NightModePanelColorsTitle2ShadowFontColorSelect(
  Sender: TObject);
begin
  if IsNightMode then
     begin
       FormMain.LabelInitZipSystemTitle.ShadowColor:= NightModePanelColorsTitle2ShadowFontColor.Selected;
     end;
  LabelInitZipSystemTitle.ShadowColor:= NightModePanelColorsTitle2ShadowFontColor.Selected; // sample panel
end;

procedure TFormNightMode.NightModePanelsBackgroundColorsDefaultButtonClick(
  Sender: TObject);
begin
  if TBitBtnEx(Sender).Tag = 0 then
     begin
       FormMain.SetSelectedColorBox(NightModeSearchGamesPanelTopColor, clrDarkBlue);
       FormMain.SetSelectedColorBox(NightModeSearchGamesPanelBottomColor, clrBlackBk);
       FormMain.SetSelectedColorBox(NightModeSearchGamesPanelInnerFrameColor, clBlue);
       FormMain.SetSelectedColorBox(NightModeSearchGamesPanelOuterFrameColor, clrLightBlue);

       FormMain.SetSelectedColorBox(NightModePanelColorsTitleFontColor, clYellow); // RGB(230,200,10)  - $000ac8e6 -- new color (no shadow enabled)
       FormMain.SetSelectedColorBox(NightModePanelColorsTitleShadowFontColor, clMaroon);
       FormMain.SetSelectedColorBox(NightModePanelColorsTitle2FontColor, clWhite); // RGB(180,180,220) - $00dcb4b4 -- new color (no shadow enabled)
       FormMain.SetSelectedColorBox(NightModePanelColorsTitle2ShadowFontColor, clrMedBlue);
       FormMain.SetSelectedColorBox(NightModePanelColorsImageCategoryTextFontColor, clCream);
       FormMain.SetSelectedColorBox(NightModePanelColorsImageZipTextFontColor, clWhite);
     end
  else
     begin
       SetDefaultColorBox(NightModeSearchGamesPanelTopColor);
       SetDefaultColorBox(NightModeSearchGamesPanelBottomColor);
       SetDefaultColorBox(NightModeSearchGamesPanelInnerFrameColor);
       SetDefaultColorBox(NightModeSearchGamesPanelOuterFrameColor);

       SetDefaultColorBox(NightModePanelColorsTitleFontColor);
       SetDefaultColorBox(NightModePanelColorsTitleShadowFontColor);
       SetDefaultColorBox(NightModePanelColorsTitle2FontColor);
       SetDefaultColorBox(NightModePanelColorsTitle2ShadowFontColor);
       SetDefaultColorBox(NightModePanelColorsImageCategoryTextFontColor);
       SetDefaultColorBox(NightModePanelColorsImageZipTextFontColor);
     end;

  NightModeSearchGamesPanelGradientBar.Checked:= True;
  NightModePanelColorsTitleShadowEnabled.Checked:= TBitBtnEx(Sender).Tag = 0;
  NightModePanelColorsTitle2ShadowEnabled.Checked:= TBitBtnEx(Sender).Tag = 0;
end;

procedure TFormNightMode.NightModeSearchGamesPanelFilterFontColorSelect(
  Sender: TObject);
begin
  if IsNightMode then
     begin
       FormMain.LabelSearchGamesFilter.Font.Color:= NightModeSearchGamesPanelFilterFontColor.Selected;
       FormMain.LabelSearchGamesFilter_ToolBar.Font.Color:= NightModeSearchGamesPanelFilterFontColor.Selected;
       FormMain.LabelSelectCPU.Font.Color:= NightModeSearchGamesPanelFilterFontColor.Selected;
       FormMain.LabelCustomCPUFilter.Font.Color:= NightModeSearchGamesPanelFilterFontColor.Selected;
     end;
  NightModeLabelSearchGamesFilter.Font.Color:= NightModeSearchGamesPanelFilterFontColor.Selected; // sample panel
end;

procedure TFormNightMode.NightModeSearchGamesPanelFieldFontColorSelect(
  Sender: TObject);
begin
  if IsNightMode then
     begin
       FormMain.LabelSearchGamesBy.Font.Color:= NightModeSearchGamesPanelFieldFontColor.Selected;
       FormMain.LabelSearchGamesBy_ToolBar.Font.Color:= NightModeSearchGamesPanelFieldFontColor.Selected;
     end;
  NightModeLabelSearchGamesBy.Font.Color:= NightModeSearchGamesPanelFieldFontColor.Selected; // sample panel
end;

procedure TFormNightMode.NightModeSearchGamesPanelEditBoxFontColorSelect(
  Sender: TObject);
begin
  if IsNightMode then
     begin
       FormMain.FilterGameTitle_ToolBar.Font.Color:= NightModeSearchGamesPanelEditBoxFontColor.Selected;
       FormMain.FilterGameTitle.Font.Color:= NightModeSearchGamesPanelEditBoxFontColor.Selected;
       FormMain.FilterCPU.Font.Color:= NightModeSearchGamesPanelEditBoxFontColor.Selected;
     end;
  NightModeFilterGameTitle.Font.Color:= NightModeSearchGamesPanelEditBoxFontColor.Selected; // sample panel
end;

procedure TFormNightMode.NightModeSearchGamesPanelEditBoxBackgroundColorSelect(
  Sender: TObject);
begin
  if IsNightMode then
     begin
       FormMain.FilterGameTitle_ToolBar.Color:= NightModeSearchGamesPanelEditBoxBackgroundColor.Selected;
       FormMain.FilterGameTitle.Color:= NightModeSearchGamesPanelEditBoxBackgroundColor.Selected;
       FormMain.FilterCPU.Color:= NightModeSearchGamesPanelEditBoxBackgroundColor.Selected;
     end;

  NightModeFilterGameTitle.Color:= NightModeSearchGamesPanelEditBoxBackgroundColor.Selected; // sample panel
end;

procedure TFormNightMode.NightModeSearchGamesPanelEditBoxCustomFrameColorSelect(
  Sender: TObject);
begin
  if IsNightMode then
     begin
       FormMain.FilterGameTitle_ToolBar.ColorFrame:= NightModeSearchGamesPanelEditBoxCustomFrameColor.Selected;
       FormMain.FilterGameTitle.ColorFrame:= NightModeSearchGamesPanelEditBoxCustomFrameColor.Selected;
       FormMain.FilterCPU.ColorFrame:= NightModeSearchGamesPanelEditBoxCustomFrameColor.Selected;
     end;
  NightModeFilterGameTitle.ColorFrame:= NightModeSearchGamesPanelEditBoxCustomFrameColor.Selected; // sample panel
end;

procedure TFormNightMode.NightModeSearchGamesPanelEditBoxCustomFocusedFrameColorSelect(
  Sender: TObject);
begin
  if IsNightMode then
     begin
       FormMain.FilterGameTitle_ToolBar.ColorFrameFocused:= NightModeSearchGamesPanelEditBoxCustomFocusedFrameColor.Selected;
       FormMain.FilterGameTitle.ColorFrameFocused:= NightModeSearchGamesPanelEditBoxCustomFocusedFrameColor.Selected;
       FormMain.FilterCPU.ColorFrameFocused:= NightModeSearchGamesPanelEditBoxCustomFocusedFrameColor.Selected;
     end;
  NightModeFilterGameTitle.ColorFrameFocused:= NightModeSearchGamesPanelEditBoxCustomFocusedFrameColor.Selected; // sample panel
end;

procedure TFormNightMode.NightModeSearchGamesPanelCaptionBarFontColorSelect(
  Sender: TObject);
begin
  if IsNightMode then
     begin
       FormMain.PanelSearchGamesCaptionBar.Font.Color:= NightModeSearchGamesPanelCaptionBarFontColor.Selected;
       FormMain.FilterCPU_LabelCaptionBar.Font.Color:= NightModeSearchGamesPanelCaptionBarFontColor.Selected;
     end;
  NightModePanelSearchGamesCaptionBar.Font.Color:= NightModeSearchGamesPanelCaptionBarFontColor.Selected; // sample panel
end;

procedure TFormNightMode.NightModeSearchGamesPanelColorsButtonDefaultClick(
  Sender: TObject);
begin
  if TBitBtnEx(Sender).Tag = 0 then
     begin
       FormMain.SetSelectedColorBox(NightModeSearchGamesPanelFilterFontColor, clWhite);

       FormMain.SetSelectedColorBox(NightModeSearchGamesPanelFieldFontColor, clYellow);

       FormMain.SetSelectedColorBox(NightModeSearchGamesPanelEditBoxFontColor, clWhite);
       FormMain.SetSelectedColorBox(NightModeSearchGamesPanelEditBoxBackgroundColor, clrDarkBlue);

       FormMain.SetSelectedColorBox(NightModeSearchGamesPanelEditBoxCustomFrameColor, clrLightBlue);
       FormMain.SetSelectedColorBox(NightModeSearchGamesPanelEditBoxCustomFocusedFrameColor, clWhite);

       FormMain.SetSelectedColorBox(NightModeSearchGamesPanelCaptionBarFontColor, clWhite);
     end
  else
     begin
       SetDefaultColorBox(NightModeSearchGamesPanelFilterFontColor);

       SetDefaultColorBox(NightModeSearchGamesPanelFieldFontColor);

       SetDefaultColorBox(NightModeSearchGamesPanelEditBoxFontColor);
       SetDefaultColorBox(NightModeSearchGamesPanelEditBoxBackgroundColor);

       SetDefaultColorBox(NightModeSearchGamesPanelEditBoxCustomFrameColor);
       SetDefaultColorBox(NightModeSearchGamesPanelEditBoxCustomFocusedFrameColor);

       SetDefaultColorBox(NightModeSearchGamesPanelCaptionBarFontColor);
     end;
end;

procedure TFormNightMode.NightModeGamesListSplitterShowGripIconClick(
  Sender: TObject);
begin
  if IsNightMode then
     begin
       FormMain.SetGripIcon(FormMain.Splitter, NightModeGamesListSplitterShowGripIcon.Checked);
       FormMain.SetGripIcon(FormMain.SplitterMachines, NightModeGamesListSplitterShowGripIcon.Checked);
     end;
end;

procedure TFormNightMode.NightModeGamesListSplitterSingleColorSelect(
  Sender: TObject);
begin
  if IsNightMode then
     FormMain.UpdateGamesListSplitterStyle;
end;

procedure TFormNightMode.NightModeGamesListSplitterSingleColorHotSelect(
  Sender: TObject);
begin
  if IsNightMode then
     FormMain.UpdateGamesListSplitterStyle;
end;

procedure TFormNightMode.NightModeGamesListSplitterSingleColorButtonDefaultClick(
  Sender: TObject);
begin
  SetDefaultColorBox(NightModeGamesListSplitterSingleColor);
  SetDefaultColorBox(NightModeGamesListSplitterSingleColorHot);
end;

procedure TFormNightMode.NightModeGameDocumentsBackgroundColorSelect(
  Sender: TObject);
begin
  if IsNightMode then
     FormMain.MAMEInfoTextHolder.Color:= NightModeGameDocumentsBackgroundColor.Selected;

  NightModeGameDocsFont_Setting.Color:= NightModeGameDocumentsBackgroundColor.Selected;
end;

procedure TFormNightMode.NightModeGameDocumentsButtonDefaultClick(
  Sender: TObject);
begin
  NightModeGameDocsFont_Setting.Font.Color:= clrGamesListHeaderFontColor;
  NightModeGameDocsFont_Setting.Font.Name:= 'Calibri';
  NightModeGameDocsFont_Setting.Font.Size:= 9;
  NightModeGameDocsFont_Setting.Font.Style:= [];
  if IsNightMode then
     FormMain.MAMEInfoTextHolder.Font:= NightModeGameDocsFont_Setting.Font;

  FormMain.SetSelectedColorBox(NightModeGameDocumentsBackgroundColor, NightModeGameDocumentsBackgroundColor.DefaultColorColor);
end;

procedure TFormNightMode.NightModeGameDocsShowBorderClick(Sender: TObject);
begin
  if IsNightMode then
     begin
       if NightModeGameDocsShowBorder.Checked then
          FormMain.PanelGameDocuments.BorderWidth:= 7
       else
          FormMain.PanelGameDocuments.BorderWidth:= 0;

       FormMain.MAMEInfoStatusBar.Visible:= NightModeGameDocsShowStatusBar.Checked and (not NightModeGameDocsShowBorder.Checked);
     end;
end;

procedure TFormNightMode.NightModeGameDocsBorderColorSelect(
  Sender: TObject);
begin
  if IsNightMode then
     FormMain.PanelGameDocuments.Color:= NightModeGameDocsBorderColor.Selected;
end;

procedure TFormNightMode.NightModeGameDocsBorderColorButtonDefaultClick(
  Sender: TObject);
begin
  SetDefaultColorBox(NightModeGameDocsBorderColor);
  NightModeGameDocsShowBorder.Checked:= True;
  NightModeGameDocsShowStatusBar.Checked:= True;
end;

procedure TFormNightMode.NightModeGameDocsShowStatusBarClick(
  Sender: TObject);
begin
  if IsNightMode then
     FormMain.MAMEInfoStatusBar.Visible:= NightModeGameDocsShowStatusBar.Checked and (not NightModeGameDocsShowBorder.Checked);
end;

procedure TFormNightMode.NightModeMenuPopupMenuFrameColorDefaultColorsClick(
  Sender: TObject);
begin
  SetDefaultColorBox(NightModeMenuPopupMenuFrameColor); // clrBorderGroupBoxGrayBk
end;

procedure TFormNightMode.NightModeHintBoxtColorsButtonDefaultClick(
  Sender: TObject);
begin
  NightModeHintBox_FrameEnabled.Checked:= TBitBtnEx(Sender).Tag = 0;
  if TBitBtnEx(Sender).Tag = 0 then
     begin
       NightModeHintBox_Position.Position:= 4;
       FormMain.SetSelectedColorBox(NightModeHintBox_Color, clrLightBlue); // RGB(51, 153, 255)
       FormMain.SetSelectedColorBox(NightModeHintBox_FrameColor, NightModeHintBox_Color.Selected);
     end
  else
     begin
       // Fabian colors
       NightModeHintBox_Position.Position:= 8;
       SetDefaultColorBox(NightModeHintBox_Color);
       SetDefaultColorBox(NightModeHintBox_FrameColor);
     end;
end;

procedure TFormNightMode.NightModeHintBox_OpacityChange(Sender: TObject);
begin
  NightModeLabelHintBox_Opacity.Caption:= 'Opacity ['+IntToStr(NightModeHintBox_Opacity.Position)+']';
  ImageHintPanel.Opacity:= NightModeHintBox_Opacity.Position;
  ImageHintPanel.Invalidate;
end;

procedure TFormNightMode.NightModeHintBox_OpacityButtonDefaultClick(
  Sender: TObject);
begin
  NightModeHintBox_Opacity.Position:= 190;
end;

procedure TFormNightMode.NightModeHintTextDefaultColorsButtonDefaultClick(
  Sender: TObject);
begin
  if TBitBtnEx(Sender).Tag = 0 then
     begin
       FormMain.SetSelectedColorBox(NightModeHintBox_TextColor, clWhite);
       FormMain.SetSelectedColorBox(NightModeHintBox_TextShadowColor, clBlack);
     end
  else
     begin
       SetDefaultColorBox(NightModeHintBox_TextColor);
       SetDefaultColorBox(NightModeHintBox_TextShadowColor);
     end;
  NightModeHintBox_TextShadowEnabled.Checked:= TBitBtnEx(Sender).Tag = 0;
  NightModeHintBox_FontItalicStyle.Checked:= TBitBtnEx(Sender).Tag = 0;
  NightModeHintBox_LargerFontSize.Checked:= False;
end;

procedure TFormNightMode.NightModeImageSplitterShowGripIconClick(
  Sender: TObject);
begin
  if NightModeImageSplitterShowGripIcon.Tag = 0 then
     FormMain.PopupImageShowSplitterGrip.Click;
end;

procedure TFormNightMode.NightModeImageSplitterSingleColorSelect(
  Sender: TObject);
begin
  if IsNightMode then
     FormMain.UpdateImageLayoutSplittersStyle;
end;

procedure TFormNightMode.NightModeImageSplitterSingleColorHotSelect(
  Sender: TObject);
begin
  if IsNightMode then
     FormMain.UpdateImageLayoutSplittersStyle;
end;

procedure TFormNightMode.NightModeImageSplitterSingleColorButtonDefaultClick(
  Sender: TObject);
begin
  SetDefaultColorBox(NightModeImageSplitterSingleColor);
  SetDefaultColorBox(NightModeImageSplitterSingleColorHot);
end;

procedure TFormNightMode.NightModeImageBorderColorSelect(Sender: TObject);
begin
  if IsNightMode then
     FormMain.PanelImage.Color:= NightModeImageBorderColor.Selected;
end;

procedure TFormNightMode.NightModeImageBorderColorButtonDefaultClick(
  Sender: TObject);
begin
  SetDefaultColorBox(NightModeImageBorderColor);
end;

procedure TFormNightMode.SetPanelExParentPos(PanelSource: TPanelEx; LeftPos, TopPos: Integer);
begin
  PanelSource.Parent:= PanelPage2;
  PanelSource.Left:= LeftPos;
  PanelSource.Top:= TopPos;
end;

procedure TFormNightMode.FormShow(Sender: TObject);
var
  ScreenW, ScreenH: Integer;
  AdjustWindow: Boolean;
begin
  CurrentProfileName:= FormMain.GetNightModeIniFile(True);

  if not MoveControls then
  begin
    // you cannot change a control parent property in Form.OnCreate() event
    MoveControls:= True;
    ScreenW:= Screen.Width;
    ScreenH:= Screen.Height;
    AdjustWindow:= ScreenH < 900;
    if not AdjustWindow then
       AdjustWindow:= ScreenW < 1280;

    if AdjustWindow then
    begin
      // fallback to 2 pages and re-arrange controls into "PanelPage2"
      PanelPage2.Left:= 0;
      PanelPage2.Top:= 0;
      PanelPage2.Width:= 909;
      PanelPage2.Height:= 569;

      SetPanelExParentPos(NightModeButtonColorsBox, 8, 8); // Buttons Colors
      SetPanelExParentPos(NightModeGamesListStatusBarColorsBox, 311, 8); // Games List Status Bar Colors
      SetPanelExParentPos(NightModeImagesHintBox, 311, 145); // Image Hint box
      SetPanelExParentPos(NightModeImageSplittersBox, 311, 386); // Image Splitters
      SetPanelExParentPos(NightModeImageBorderColorBox, 311, 501); // Image 7 Pixels Border
      SetPanelExParentPos(NightModeMAMEGameDocsBox, 614, 8); // Game Docs

      NightModeUseWin10DarkModeScrollBarsButtonHelp.Parent:= PanelPage2;
      NightModeUseWin10DarkModeScrollBarsButtonHelp.Left:= 8;
      NightModeUseWin10DarkModeScrollBarsButtonHelp.Top:= NightModeButtonColorsBox.Top+NightModeButtonColorsBox.Height+16;

      NightModeUseWin10DarkModeScrollBars.Parent:= PanelPage2;
      NightModeUseWin10DarkModeScrollBars.Left:= 34;
      NightModeUseWin10DarkModeScrollBars.Top:= NightModeUseWin10DarkModeScrollBarsButtonHelp.Top+4;

      PanelBottom.Height:= PanelBottom.Height+2;
      PanelBottom.Align:= alBottom;
      PanelBottom.Style:= vgSimple;
      PanelPage1.Width:= PanelPage2.Width;
      PanelPage1.Height:= PanelPage2.Height;

      ButtonPage1.GroupIndex:= 1;
      ButtonPage2.GroupIndex:= 1;
      ButtonPage1.Down:= True;

      ClientWidth:= PanelPage1.Width;
      ClientHeight:= PanelPage1.Height+PanelBottom.Height;

      // code to show panels side by side (1920x1080 minimum required)
      //PanelPage2.Left:= PanelPage1.Width;
      //ClientWidth:= PanelPage2.Left+PanelPage2.Width;
      //PanelPage2.Visible:= True;
      //ButtonPage1.Visible:= False;
      //ButtonPage2.Visible:= False;
    end
    else
    begin
      ButtonPage1.Enabled:= False;
      ButtonPage2.Enabled:= False;
      PanelBottom.Width:= 594;
      PanelBottom.Style:= vgSolid;
      PanelBottom.Color1:= NightModeProfilesGroupBox.Color1;
      PanelBottom.Parent:= NightModeProfilesGroupBox;
      PanelBottom.Top:= 25;
      PanelBottom.Left:= 4;

      ClientWidth:= PanelPage1.Width;
      ClientHeight:= PanelPage1.Height;
    end;

    // this is to put both panel side by side...
    //if ScreenW = 1920 then
    //   begin
    //     PanelPage2.Left:= PanelPage1.Width;
    //     ButtonPage1.Visible:= False;
    //     ButtonPage2.Visible:= False;
    //     ClientWidth:= PanelPage2.Left+PanelPage2.Width;
    //   end;

    NightModeNewProfileBox.Parent:= PanelPage1;
    NightModeNewProfileBox.Left:= (PanelPage1.Width-NightModeNewProfileBox.Width) div 2;
    NightModeNewProfileBox.Top:= (PanelPage1.Height-NightModeNewProfileBox.Height) div 2;

    // center window in Windows desktop
    FormNightMode.Left:= (Screen.Width shr 1)-(Width shr 1)-1;
    FormNightMode.Top:= (Screen.Height shr 1)-(Height shr 1)-1;

    NightModeImageHintPanel_ImageView1.Click;

    //PopulateIconOverlayFoldersList;
    //AddNightModeProfiles;

    NightModeGamesSelectionBarPreview.Parent:= PanelPage1;
    NightModeGamesSelectionBarPreview.Left:= NightModeGamesSelectionBarColorsBox.Left+NightModeGamesSelectionBarColorsBox.Width+4;
    NightModeGamesSelectionBarPreview.Top:= 8;

    NightModePanelColorsBoxPreview.Parent:= PanelPage1;
    NightModePanelColorsBoxPreview.Left:= NightModePanelColorsBox.Left;
    NightModePanelColorsBoxPreview.Top:= NightModePanelColorsBox.Top-NightModePanelColorsBoxPreview.Height-4;

    NightModeSearchGamesPanelColorsBoxPreview.Parent:= PanelPage1;
    NightModeSearchGamesPanelColorsBoxPreview.Left:= NightModeSearchGamesPanelColorsBox.Left-NightModeSearchGamesPanelColorsBoxPreview.Width-4;
    NightModeSearchGamesPanelColorsBoxPreview.Top:= NightModeSearchGamesPanelColorsBox.Top;

    NightModeImagesHintBoxPreview.Parent:= NightModeImagesHintBox.Parent;

    NightModeButtonColorsBoxPreview.Parent:= NightModeButtonColorsBox.Parent;

    if AdjustWindow then
       begin
         NightModeImagesHintBoxPreview.Left:= NightModeImagesHintBox.Left+NightModeImagesHintBox.Width+4;
         NightModeImagesHintBoxPreview.Top:= NightModeImagesHintBox.Top;

         NightModeButtonColorsBoxPreview.Top:= NightModeButtonColorsBox.Top;
         NightModeButtonColorsBoxPreview.Left:= NightModeButtonColorsBox.Left+NightModeButtonColorsBox.Width+4;
       end
    else
       begin
         NightModeImagesHintBoxPreview.Left:= NightModeImagesHintBox.Left;
         NightModeImagesHintBoxPreview.Top:= NightModeImagesHintBox.Top-NightModeImagesHintBoxPreview.Height-4;

         NightModeButtonColorsBoxPreview.Top:= NightModeButtonColorsBox.Top;
         NightModeButtonColorsBoxPreview.Left:= NightModeButtonColorsBox.Left-NightModeButtonColorsBoxPreview.Width-4;
       end;

    FormMain.LoadIconIntoImage('EmuLoader_Orb', InitZipSystemIcon);
    ImageHintPanel.Opacity:= NightModeHintBox_Opacity.Position;
    HintBoxUpdateSize;
  end;

  //NightModeNewProfileBox.Parent:= PanelPage1;
  //NightModeNewProfileBox.Left:= (PanelPage1.Width-NightModeNewProfileBox.Width) div 2;
  //NightModeNewProfileBox.Top:= (PanelPage1.Height-NightModeNewProfileBox.Height) div 2;

  //FormMain.ELV_ResetNormalColors(NightModeGamesListView); // these cannot be here... do not remove this comment! (June 23, 2019)
  //FormMain.ELV_SetRibbonNightColors(0, NightModeGamesListView, True);
  NightModeProfiles.SetFocus;
end;

procedure TFormNightMode.NightModeHintBox_ColorSelect(Sender: TObject);
begin
  ImageHintPanel.Color1:= NightModeHintBox_Color.Selected;
end;

procedure TFormNightMode.NightModeHintBox_FrameEnabledClick(
  Sender: TObject);
begin
  if NightModeHintBox_FrameEnabled.Checked then
     ImageHintPanel.Frames:= [frLeft, frTop, frRight, frBottom]
  else
     ImageHintPanel.Frames:= [];
end;

procedure TFormNightMode.NightModeHintBox_FrameColorSelect(
  Sender: TObject);
begin
  ImageHintPanel.ColorFrame:= NightModeHintBox_FrameColor.Selected;
end;

procedure TFormNightMode.NightModeHintBox_TextColorSelect(Sender: TObject);
begin
  ImageHintText.Font.Color:= NightModeHintBox_TextColor.Selected;
  ImageHintDetailsText.Font.Color:= NightModeHintBox_TextColor.Selected;
end;

procedure TFormNightMode.NightModeHintBox_TextShadowColorSelect(
  Sender: TObject);
begin
  ImageHintText.ShadowColor:= NightModeHintBox_TextShadowColor.Selected;
  ImageHintDetailsText.ShadowColor:= NightModeHintBox_TextShadowColor.Selected;
end;

procedure TFormNightMode.NightModeHintBox_TextShadowEnabledClick(
  Sender: TObject);
begin
  ImageHintText.ShadowEnabled:= NightModeHintBox_TextShadowEnabled.Checked;
  ImageHintDetailsText.ShadowEnabled:= NightModeHintBox_TextShadowEnabled.Checked;
end;

procedure TFormNightMode.HintBoxUpdateSize;
var
  IconSize: Integer;
begin
  // large font size 16 pixels
  // icon pos: left 8, top 13
  // title position: left 28, top 8
  // resolution position left 30, top 34
  // panel height: 56 pixels

  // icon pos: left 8, top 8
  // small font size 10 pixels
  // title position left 28, top 5
  // resolution position left 30, top 25
  // panel height: 48 pixels

  IconSize:= 20; // 16 pixels icon size + 4 pixels border
  ImageHintIcon.Picture.Icon:= nil;
  FormMain.IL_MenuPopup.GetIcon(06, ImageHintIcon.Picture.Icon); // unzipped image
  if NightModeHintBox_LargerFontSize.Checked then
     begin
       ImageHintIcon.Top:= 13;
       ImageHintText.Top:= 8;
       ImageHintDetailsText.Top:= 34;
       ImageHintPanel.Height:= 56;
       ImageHintText.Font.Size:= 14;
     end
  else
     begin
       ImageHintIcon.Top:= 8;
       ImageHintText.Top:= 5;
       ImageHintDetailsText.Top:= 25;
       ImageHintPanel.Height:= 48;
       ImageHintText.Font.Size:= 10;
     end;

  ImageHintPanel.Width:= ImageHintText.Width+16+IconSize; // 16 is the size of the icon
  FormMain.UpdateImageHintBoxPosition(ImageHintPanel, ImageHintPanel_Image, NightModeHintBox_Position.Position); // must re-position hint box panel
end;

procedure TFormNightMode.NightModeHintBox_FontItalicStyleClick(
  Sender: TObject);
begin
  if NightModeHintBox_FontItalicStyle.Checked then
     ImageHintText.Font.Style:= [fsItalic]
  else
     ImageHintText.Font.Style:= [];
end;

procedure TFormNightMode.NightModeGamesListViewItemSelectionChanged(
  Sender: TCustomEasyListview; Item: TEasyItem);
begin
  if Item.Selected then
     FormMain.ELV_SetSelectRibbon(Item.ImageIndex, NightModeGamesListView, False, True);
end;

procedure TFormNightMode.NightModeGamesListViewItemPaintText(
  Sender: TCustomEasyListview; Item: TEasyItem; Position: Integer;
  ACanvas: TCanvas);
begin
  FormMain.GetCanvasFont(1, -1, False, Item.ImageIndex, 0, '', ACanvas, False, NightModeGamesListView);
  ACanvas.Font.Size:= 9;
  if Item.Selected then
     begin
       if NightModeGamesListView.Focused then
          ACanvas.Font.Color:= FormMain.ELV_SelecionBar_GetColorState(Item.ImageIndex, NightModeGamesSelectionFontColor, NightModeGamesSelectionMissROMsFontColor)
       else
          ACanvas.Font.Color:= NightModeGamesSelectionInactiveFontColor.Selected;
     end;
end;

procedure TFormNightMode.NightModeGamesSelectionBarPreviewButtonCloseMouseEnter(
  Sender: TObject);
begin
  FormMain.SetCloseButtonColorsFloatingPanel_Enter(TShadowLabel(Sender), True);
end;

procedure TFormNightMode.NightModeGamesSelectionBarPreviewButtonCloseMouseLeave(
  Sender: TObject);
begin
  FormMain.SetCloseButtonColorsFloatingPanel(TShadowLabel(Sender), True);
end;

procedure TFormNightMode.NightModeGamesSelectionBarPreviewButtonCloseClick(
  Sender: TObject);
begin
  NightModeGamesSelectionBarPreview.Visible:= False;
end;

procedure TFormNightMode.NightModeGameSelectionButtonPreviewClick(Sender: TObject);
begin
  NightModeGamesSelectionBarPreview.Visible:= True;
  NightModeGamesListView.SetFocus;
end;

procedure TFormNightMode.NightModePanelColorsBoxPreviewButtonCloseClick(Sender: TObject);
begin
  NightModePanelColorsBoxPreview.Visible:= False;
end;

procedure TFormNightMode.NightModePanelColorsBoxButtonPreviewClick(Sender: TObject);
begin
  NightModePanelColorsBoxPreview.Visible:= True;
end;

procedure TFormNightMode.NightModeImagesHintBoxPreviewButtonCloseClick(
  Sender: TObject);
begin
  NightModeImagesHintBoxPreview.Visible:= False;
end;

procedure TFormNightMode.NightModeImagesHintBoxButtonPreviewClick(Sender: TObject);
begin
  NightModeImagesHintBoxPreview.Visible:= True;
end;

procedure TFormNightMode.NightModeProfilesSelect(Sender: TObject);
var
  iStr: String;
begin
  if NightModeProfiles.Tag = 0 then
     begin
       iStr:= NightModeProfiles.Text;
       if iStr = '' then
          Exit;

       if FormMain.NightModeProfileStr <> iStr then
          FormMain.WriteNightModeSettings(FormMain.NightModeProfileStr); // save current profile first

       FormMain.NightModeProfileStr:= iStr;

       FormMain.ReadNightModeSettings;
       if IsNightMode then
          FormMain.ToggleNightMode(True);
       Application.ProcessMessages;
     end;
end;

procedure TFormNightMode.NightModePanelColorsTitleShadowEnabledClick(Sender: TObject);
begin
  if IsNightMode then
     begin
       FormMain.LabelInitZipTitle.ShadowEnabled:= NightModePanelColorsTitleShadowEnabled.Checked;

       FormApplyFilterMsgBox.LabelBoxMessageTitle.ShadowEnabled:= NightModePanelColorsTitleShadowEnabled.Checked;
     end;
  LabelInitZipTitle.ShadowEnabled:= NightModePanelColorsTitleShadowEnabled.Checked; // sample panel
end;

procedure TFormNightMode.NightModePanelColorsTitle2ShadowEnabledClick(Sender: TObject);
begin
  if IsNightMode then
     begin
       FormMain.LabelInitZipSystemTitle.ShadowEnabled:= NightModePanelColorsTitle2ShadowEnabled.Checked;
     end;
  LabelInitZipSystemTitle.ShadowEnabled:= NightModePanelColorsTitle2ShadowEnabled.Checked; // sample panel
end;

procedure TFormNightMode.NightModeImageHintPanel_ImageView1Click(Sender: TObject);
var
  iFile: String;
begin
  if TBitBtnEx(Sender).Tag = 0 then
     iFile:= 'thumbnail_preview-hor.png'
  else
     iFile:= 'thumbnail_preview-vert.png';
  if FileExists(FormMain.GetFolderFull(35)+iFile) then
     begin
       ImageHintPanel_Image.Bitmap:= nil;
       ImageHintPanel_Image.Bitmap.LoadFromFile(FormMain.GetFolderFull(35)+iFile);

       ImageHintDetailsText.Caption:= IntToStr(ImageHintPanel_Image.Bitmap.Width)+'x'+IntToStr(ImageHintPanel_Image.Bitmap.Height)+' (PNG)';
       ImageHintPanel.Invalidate;
     end;
end;

procedure TFormNightMode.NightModeHintBox_LargerFontSizeClick(
  Sender: TObject);
begin
  HintBoxUpdateSize;
end;

procedure TFormNightMode.NightModeHintBox_PositionChange(Sender: TObject);
begin
  case NightModeHintBox_Position.Position of
    1: NightModeHintBox_PositionLabel.Caption:= 'Top / Left';
    2: NightModeHintBox_PositionLabel.Caption:= 'Top / Middle';
    3: NightModeHintBox_PositionLabel.Caption:= 'Top / Right';
    4: NightModeHintBox_PositionLabel.Caption:= 'Middle / Left'; // this is the default
    5: NightModeHintBox_PositionLabel.Caption:= 'Middle / Right';
    6: NightModeHintBox_PositionLabel.Caption:= 'Bottom / Left';
    7: NightModeHintBox_PositionLabel.Caption:= 'Bottom / Middle';
    8: NightModeHintBox_PositionLabel.Caption:= 'Bottom / Right';
  end;
  FormMain.UpdateImageHintBoxPosition(ImageHintPanel, ImageHintPanel_Image, NightModeHintBox_Position.Position);
end;

procedure TFormNightMode.NightModeGameSelectionRoundCornersClick(Sender: TObject);
begin
  if IsNightMode then
     begin
       FormMain.GamesListView.Selection.RoundRect:= NightModeGameSelectionRoundCorners.Checked;
       FormMain.MachinesListSidePanel.Selection.RoundRect:= NightModeGameSelectionRoundCorners.Checked;
     end;
  NightModeGamesListView.Selection.RoundRect:= NightModeGameSelectionRoundCorners.Checked;
end;

procedure TFormNightMode.NightModeLabelButtonColorFontShadowColorDisabledClick(
  Sender: TObject);
begin
  NightModeButtonColorsSampleButton3.FontShadowShow_Disabled:= NightModeLabelButtonColorFontShadowColorDisabled.Checked;
end;

procedure TFormNightMode.FormCreate(Sender: TObject);
begin
  if not FormMain.ValidateFile(FormMain.GetNightModeIniFile) then
     FormMain.WriteNightModeSettings;
  FormMain.PopulateCheckRadioProfiles(False);
  PopulateIconOverlayFoldersList;
  AddNightModeProfiles(False);
end;

procedure TFormNightMode.NightModeMenuPopupMenuFrameColorSelect(
  Sender: TObject);
begin
  FormMain.PopupNightModeCopyPasteColor.MenuBorderColor:= NightModeMenuPopupMenuFrameColor.Selected;
end;

procedure TFormNightMode.NightModeProfiles_ButtonUpdateClick(
  Sender: TObject);
begin
  AddNightModeProfiles(True);
end;

procedure TFormNightMode.NightModeProfiles_ButtonReloadClick(
  Sender: TObject);
begin
  if NightModeProfiles.ItemIndex <> -1 then
     NightModeProfiles.OnSelect(Self);
end;

procedure TFormNightMode.NightModeProfiles_ButtonSaveClick(
  Sender: TObject);
begin
  if NightModeProfiles.ItemIndex <> -1 then
     FormMain.WriteNightModeSettings;
end;

procedure TFormNightMode.NightModeSearchGamesPanelColorsButtonPreviewClick(
  Sender: TObject);
begin
  NightModeSearchGamesPanelColorsBoxPreview.Visible:= True;
end;

procedure TFormNightMode.NightModeSearchGamesPanelColorsBoxPreviewButtonCloseClick(Sender: TObject);
begin
  NightModeSearchGamesPanelColorsBoxPreview.Visible:= False;
end;

procedure TFormNightMode.NightModeToolBarFilterTitleCustomDraw(
  Sender: TToolBar; const ARect: TRect; var DefaultDraw: Boolean);
begin
  if NightModePanelSearchGames.Style = vgSimple then
     FormMain.DrawGradient(Sender.Canvas, Sender.ClientRect, gsVertical, False,
                  NightModePanelSearchGames.Canvas.Pixels[3, TToolBar(Sender).Top],
                  NightModePanelSearchGames.Canvas.Pixels[3, TToolBar(Sender).Top+TToolBar(Sender).Height], 0, 0, 0)
  else
  begin
    Sender.Canvas.Brush.Color:= NightModePanelSearchGames.Color1;
    Sender.Canvas.Pen.Color:= NightModePanelSearchGames.Color1;
    Sender.Canvas.Rectangle(Sender.ClientRect);
  end;
end;

procedure TFormNightMode.NightModeProfiles_ButtonNewClick(Sender: TObject);

  procedure SetParentPanel(PanelExSource: TPanelEx);
  begin
    if NightModeNewProfileBox.Parent <> PanelExSource then
       NightModeNewProfileBox.Parent:= PanelExSource;
  end;

begin
  if ButtonPage1.Enabled then
     begin
       if PanelPage1.Visible then
          SetParentPanel(PanelPage1)
       else
          SetParentPanel(PanelPage2);
     end;

  NewProfile_PopulateELV;

  PanelBottom.Enabled:= False;
  NightModeNewProfileBox.Visible:= True;

  NightModeNewProfileProfileName.SetFocus;
end;

procedure TFormNightMode.NightModeNewProfileBoxButtonCloseClick(
  Sender: TObject);
begin
  FormMain.ClearListView(NightModeNewProfileProfilesList);
  NightModeNewProfileProfileName.Text:= '';
  NightModeNewProfileBox.Visible:= False;
  PanelBottom.Enabled:= True;
end;

procedure TFormNightMode.NightModeProfiles_ButtonDeleteClick(
  Sender: TObject);
var
  iStr: WideString;
begin
  if NightModeProfiles.ItemIndex = -1 then
     Exit;

  if SameText('Default', NightModeProfiles.Text) then
     Exit;

  iStr:= FormMain.GetNightModeIniFile;

  if not FileExists(iStr) then
     Exit;

  if GenerateMessage('Night Mode', 'Delete Night Mode Profile',
                  '    You are about to delete file "'+iStr+'".'+#13#10+
                  'Are you sure ?', 1, True, 1) = mrNo then
     Exit;

  if DeleteFileW(PWideChar(iStr)) then
     begin
       FormMain.NightModeProfileStr:= 'Default';
       Application.ProcessMessages;
       NightModeProfiles.DeleteSelected;
       SetSelectedComboBox(0, NightModeProfiles);
     end;
end;

procedure TFormNightMode.NightModeButtonColorsBoxPreviewButtonCloseClick(
  Sender: TObject);
begin
  NightModeButtonColorsBoxPreview.Visible:= False;
end;

procedure TFormNightMode.NightModeColorsBoxButtonPreviewClick(Sender: TObject);
begin
  NightModeButtonColorsBoxPreview.Visible:= True;
end;

procedure TFormNightMode.NightModeGamesListHeaderFontClick(
  Sender: TObject);
begin
  FormMain.PopupCustomizeColumnsHeaderFont.Tag:= 1;
  FormMain.PopupCustomizeColumnsHeaderFont.Click;
  Sleep(40);
  FormMain.PopupCustomizeColumnsHeaderFont.Tag:= -1;
end;

procedure TFormNightMode.NightModeGamesListHeaderBackgroundColorSelect(
  Sender: TObject);
begin
  if IsNightMode then
     begin
       FormMain.GamesListView.Header.HeaderColumnColor:= NightModeGamesListHeaderBackgroundColor.Selected;
       FormMain.MachinesListSidePanel.Header.HeaderColumnColor:= NightModeGamesListHeaderBackgroundColor.Selected;
     end;
  NightModeGamesListHeaderFont.Color:= NightModeGamesListHeaderBackgroundColor.Selected;
end;

procedure TFormNightMode.NightModeGamesListHeaderBackgroundColorHoverSelect(
  Sender: TObject);
begin
  if IsNightMode then
     begin
       FormMain.GamesListView.Header.HeaderColumnColorHot:= NightModeGamesListHeaderBackgroundColorHover.Selected;
       FormMain.MachinesListSidePanel.Header.HeaderColumnColorHot:= NightModeGamesListHeaderBackgroundColorHover.Selected;
     end;
end;

procedure TFormNightMode.NightModeGamesListHeaderBackgroundColorDownSelect(
  Sender: TObject);
begin
  if IsNightMode then
     begin
       FormMain.GamesListView.Header.HeaderColumnColorClick:= NightModeGamesListHeaderBackgroundColorDown.Selected;
       FormMain.MachinesListSidePanel.Header.HeaderColumnColorClick:= NightModeGamesListHeaderBackgroundColorDown.Selected;
     end;
end;

procedure TFormNightMode.NightModeGamesListHeaderButtonDefaultClick(
  Sender: TObject);
begin
  FormMain.PopupDefaultHeaderFont.Tag:= 1;
  FormMain.PopupDefaultHeaderFont.Click;
  Sleep(40);
  FormMain.PopupDefaultHeaderFont.Tag:= -1;

  if TBitBtnEx(Sender).Tag = 0 then
     begin
       FormMain.SetSelectedColorBox(NightModeGamesListHeaderBackgroundColor, $00241f15); // RGB(27,31,36)
       FormMain.SetSelectedColorBox(NightModeGamesListHeaderBackgroundColorHover, clrMedDarkGray); // RGB(80,80,80)
       FormMain.SetSelectedColorBox(NightModeGamesListHeaderBackgroundColorDown, menu_background_color[1]); // RGB(39,39,39)
     end
  else
     begin
       // Fabian colors
       SetDefaultColorBox(NightModeGamesListHeaderBackgroundColor);
       SetDefaultColorBox(NightModeGamesListHeaderBackgroundColorHover);
       SetDefaultColorBox(NightModeGamesListHeaderBackgroundColorDown);


       NightModeGamesListHeaderFont.Font.Color:= clrGamesListHeaderFontColor;
     end;
end;

procedure TFormNightMode.NewProfile_PopulateELV;
var
  Loop: Integer;
  Item: TEasyItem;
begin
  if NightModeProfiles.Items.Count = 1 then
     Exit; // there's only

  //NightModeNewProfileProfilesList.Tag:= 1;
  NightModeNewProfileProfilesList.BeginUpdate;
  NightModeNewProfileProfilesList.Items.ReIndexDisable:= True;
  for Loop:= 0 to NightModeProfiles.Items.Count-1 do
  begin
    Item:= NightModeNewProfileProfilesList.Items.Add;
    Item.Caption:= NightModeProfiles.Items[Loop];
    if Loop = NightModeProfiles.ItemIndex then
       begin
         Item.Bold:= True;
         Item.Selected:= True;
         NightModeNewProfileProfilesList.Selection.FocusedItem:= Item;
         Item.MakeVisible(emvMiddle);
       end;
  end;
  NightModeNewProfileProfilesList.Items.ReIndexDisable:= False;
  NightModeNewProfileProfilesList.EndUpdate;
  Item:= NightModeNewProfileProfilesList.Selection.First;
  if Item <> nil then
     Item.MakeVisible(emvMiddle);
  //NightModeNewProfileProfilesList.Tag:= 0;
end;

procedure TFormNightMode.NightModeNewProfileProfilesListItemSelectionChanged(
  Sender: TCustomEasyListview; Item: TEasyItem);
begin
  if Item.Selected then
     begin
       NightModeNewProfileProfileName.Text:= Item.Caption;
     end;
end;

procedure TFormNightMode.NightModeNewProfileBoxButtonConfirmClick(
  Sender: TObject);
var
  Continue: Boolean;
  NewName, CurrentFileName, NewFileName: String;
  Index: Integer;
begin
  NewName:= Trim(NightModeNewProfileProfileName.Text);
  if NewName = '' then
     FormMain.BlinkBkEdit(NightModeNewProfileProfileName)
  else
  begin
    Index:= NightModeProfiles.Items.IndexOf(NewName);
    Continue:= Index = -1;
    if Continue then
       begin
         NewFileName:= FormMain.GetNightModeFolder+NewName+'.ini';
         if not NightModeNewProfileUseColorsActiveProfile.Checked then
         begin
           if FormMain.CheckSelected(NightModeNewProfileProfilesList) then
              CurrentFileName:= FormMain.GetNightModeFolder+
                                NightModeNewProfileProfilesList.Selection.First.Caption+'.ini' // get selected profile in "Create A New Profile" panel
           else
              CurrentFileName:= FormMain.GetNightModeIniFile; // get current selected profile in "Night Mode Profiles" panel
         end
         else
         begin
           // must create a new filename and then save the profile manually, then select it so current profile is saved
           CurrentFileName:= FormMain.GetNightModeIniFile; // get current selected profile in "Night Mode Profiles" panel

         end;
         CopyFile(PChar(CurrentFileName), PChar(NewFileName), False);
         Sleep(50);
         FormMain.WriteNightModeSettings; // force saving settings of current profile
         AddNightModeProfiles(True, NewName);
         NightModeNewProfileBoxButtonClose.OnClick(Self);
       end
    else
       FormMain.BlinkBkEdit(NightModeNewProfileProfileName);
  end;
end;

procedure TFormNightMode.NightModeNewProfileProfilesListItemPaintText(
  Sender: TCustomEasyListview; Item: TEasyItem; Position: Integer;
  ACanvas: TCanvas);
begin
  if Item.Bold and (not Item.Selected) then
     ACanvas.Font.Color:= clrOrangeVivid;
end;

procedure TFormNightMode.NightModeProfiles_ButtonDefaultClick(
  Sender: TObject);
begin
  NightModeGameSelectionButtonDefault2.Click; // Games List Selection Bar
  NightModeMenuPopupMenuFrameColorDefaultColors.Click; // Menus / Popup Menus
  NightModeToolBarBkColorsButtonDefault2.Click; // Tool Bar Background Colors
  NightModePanelsBackgroundColorsDefaultButton2.Click; // Panels Colors (Mostly Frames and Message Boxes)
  NightModeSearchGamesPanelColorsButtonDefault2.Click; // Search Games Panel Colors

  NightModeGamesBackgroundColorButtonDefault.Click; // Games List Background

  NightModeColorsBoxButtonDefault2.Click; // Buttons Colors

  // MAME Game Docs
  NightModeGameDocumentsButtonDefault.Click;
  NightModeGameDocsBorderColorButtonDefault.Click;

  NightModeGamesListStatusBarButtonDefault2.Click; // Games List / Machines List Splitters

  // Image Hint Box
  NightModeHintBoxtColorsButtonDefault2.Click;
  NightModeHintBox_OpacityButtonDefault.Click;
  NightModeHintTextDefaultColorsButtonDefault2.Click;

  NightModeGamesListHeaderButtonDefault2.Click; // Games List Column Header

  NightModeImageSplitterSingleColorButtonDefault.Click; // Image Splitters
  NightModeImageBorderColorButtonDefault.Click; // Image 7 Pixels Border Color
end;

procedure TFormNightMode.NightModeNewProfileUseColorsActiveProfileClick(
  Sender: TObject);
begin
  FormMain.MenuCustomizeNightModeColors.Tag:= Ord(NightModeNewProfileUseColorsActiveProfile.Checked);
end;

procedure TFormNightMode.NightModeButtonColorsBoxButtonUpdateScreenButtonsClick(
  Sender: TObject);
var
  cLoop: Integer;
begin
  for cLoop:= 0 to FormNightMode.ComponentCount-1 do
  begin
    if FormNightMode.Components[cLoop] is TBitBtnEx then
       FormMain.SetButtonExColors(TBitBtnEx(FormNightMode.Components[cLoop]), True, True)
    else
    if FormNightMode.Components[cLoop] is TSpeedButtonEx then
       FormMain.SetButtonExColors(TSpeedButtonEx(FormNightMode.Components[cLoop]), True, True);
  end;
end;

procedure TFormNightMode.NightModeGameDocsFont_SettingClick(
  Sender: TObject);
begin
  FormMain.FontDialog.Font:= NightModeGameDocsFont_Setting.Font;
  FormMain.FontDialog.Tag:= 6;
  if FormMain.FontDialog.Execute then
     begin
       NightModeGameDocsFont_Setting.Font:= FormMain.FontDialog.Font;
       if IsNightMode then
          FormMain.MAMEInfoTextHolder.Font:= NightModeGameDocsFont_Setting.Font;
     end;
end;

procedure TFormNightMode.NightModeCheckBoxRadioButtonProfileSelect(
  Sender: TObject);
var
  IsCustom: Boolean;
begin
  IsCustom:= NightModeCheckBoxRadioButtonProfile.ItemIndex > 0;
  if IsCustom then
     NightModeCheckBoxRadioButtonBoxFolderFullPathLabel.Hint:= FormMain.GetCheckBoxThemeFolder+NightModeCheckBoxRadioButtonProfile.Text+'\';

  FormMain.SetCheckBoxExCustomIcon(NightModeCheckBoxRadioButton_Check1);
  FormMain.SetRadioButtonExCustomIcon(NightModeCheckBoxRadioButton_Radio1);
  FormMain.SetRadioButtonExCustomIcon(NightModeCheckBoxRadioButton_Radio2);
end;

procedure TFormNightMode.NightModeCheckBoxRadioButtonProfileButtonUpdateClick(Sender: TObject);
begin
  FormMain.PopulateCheckRadioProfiles(True);
end;

procedure TFormNightMode.NightModeUseWin10DarkModeScrollBarsButtonHelpClick(
  Sender: TObject);
begin
  GenerateMessage('Info', NightModeUseWin10DarkModeScrollBars.Caption,
                  '    Windows 10 doesn''t paint all controls with dark theme colors. This setting tries to do exactly that, '+
                  'forcing scroll bars to paint in dark colors. This is an experimental feature and it requires '+
                  'Windows 10 build 1809 or newer. Emu Loader does this by using an undocumented API function:'+#13#10+#13#10+
                  'SetWindowTheme(hWnd, ''DarkMode_Explorer'', NULL)'+#13#10+#13#10+
                  '    Until Windows 10 officially adds support for dark themed controls of third-party applications, this hack '+
                  'will be used. It doesn''t work for all controls though, specially ComboBox and ColorBox.'+#13#10+
                  'It even works if your Windows 10 is not setup with a dark theme, perfect for this frontend needs.', 2);
end;

end.

