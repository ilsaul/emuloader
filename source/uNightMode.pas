unit uNightMode;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, IniFiles, PanelEx, AdvOfficeButtons, StdCtrls, Buttons,
  ExtCtrls, uCommon, GraphicEx, ShadowLabel, ColorBoxEx, ButtonsEx, EditEx,
  SplitterEx, GR32_RangeBars, MPCommonObjects, EasyListview, GR32_Image;

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
    NightModeToolBarBkColorsDefaultButton: TBitBtnEx;
    NightModeToolBarBkTopColor: TColorBoxEx;
    NightModeToolBarBkBottomColor: TColorBoxEx;
    NightModeToolBarInnerFrameColor: TColorBoxEx;
    NightModeToolBarOuterFrameColor: TColorBoxEx;
    NightModeToolBarShowOuterFrame: TAdvOfficeCheckBoxEx;
    NightModeToolBarShowInnerFrame: TAdvOfficeCheckBoxEx;
    LabelNightModeToolBarBkBottomColor: TShadowLabel;
    LabelNightModeToolBarBkTopColor: TShadowLabel;
    NightModeGamesListStatusBarColorsBox: TPanelEx;
    NightModeGamesListStatusBarColorsBoxLabel: TShadowLabel;
    NightModeGamesListStatusBarGradientBar: TAdvOfficeCheckBoxEx;
    NightModeGamesListStatusBarCopyButton: TBitBtnEx;
    NightModeGamesListStatusBarButtonDefault: TBitBtnEx;
    NightModeGamesListStatusBarTopColor: TColorBoxEx;
    NightModeGamesListStatusBarBottomColor: TColorBoxEx;
    NightModeGamesListStatusBarInnerFrameColor: TColorBoxEx;
    NightModeGamesListStatusBarOuterFrameColor: TColorBoxEx;
    NightModeGamesListStatusBarFontColor: TColorBoxEx;
    NightModeGamesListStatusBarShadowFontColor: TColorBoxEx;
    NightModeGamesListStatusBarShadowFontEnabled: TAdvOfficeCheckBoxEx;
    LabelNightModeGamesListStatusBarFontColor: TShadowLabel;
    NightModeGamesListStatusBarShowOuterFrame: TAdvOfficeCheckBoxEx;
    NightModeGamesListStatusBarShowInnerFrame: TAdvOfficeCheckBoxEx;
    LabelNightModeGamesListStatusBarBottomColor: TShadowLabel;
    LabelNightModeGamesListStatusBarTopColor: TShadowLabel;
    NightModeGamesListFrameColorsBox: TPanelEx;
    NightModeGamesListFrameColorsBoxLabel: TShadowLabel;
    NightModeGamesListUseWindowsThemedBorder: TAdvOfficeCheckBoxEx;
    NightModeGamesListFrameColorsDefaultButton: TBitBtnEx;
    NightModeGamesListShowInnerFrame: TAdvOfficeCheckBoxEx;
    NightModeGamesListShowOuterFrame: TAdvOfficeCheckBoxEx;
    NightModeGamesListOuterFrameColor: TColorBoxEx;
    NightModeGamesListInnerFrameColor: TColorBoxEx;
    NightModeImagesPanelFrameColorsBox: TPanelEx;
    NightModeImagesPanelFrameColorsBoxLabel: TShadowLabel;
    NightModeImagesPanelShowInnerFrame: TAdvOfficeCheckBoxEx;
    NightModeImagesPanelShowOuterFrame: TAdvOfficeCheckBoxEx;
    NightModeImagesPanelOuterFrameColor: TColorBoxEx;
    NightModeImagesPanelInnerFrameColor: TColorBoxEx;
    NightModeImagesPanelFrameColorsDefaultButton: TBitBtnEx;
    NightModeGamesSelectionBarColorsBox: TPanelEx;
    NightModeGamesSelectionBarColorsBoxLabel: TShadowLabel;
    Label27: TShadowLabel;
    Label28: TShadowLabel;
    Label29: TShadowLabel;
    Label30: TShadowLabel;
    Label31: TShadowLabel;
    Label32: TShadowLabel;
    ShadowLabel3: TShadowLabel;
    Label33: TShadowLabel;
    Label34: TShadowLabel;
    Label35: TShadowLabel;
    ShadowLabel7: TShadowLabel;
    Label39: TShadowLabel;
    Label40: TShadowLabel;
    Label42: TShadowLabel;
    NightModeGameSelectionButtonDefault: TBitBtnEx;
    NightModeGameSelectionAlphaBlend: TAdvOfficeCheckBoxEx;
    NightModeGameSelectionGradientBar: TAdvOfficeCheckBoxEx;
    GameSelectionButtonPreview: TBitBtnEx;
    NightModeGamesSelectionTopColor: TColorBoxEx;
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
    NightModePanelColorsMessageFontColor: TColorBoxEx;
    NightModePanelColorsMessageShadowFontColor: TColorBoxEx;
    NightModePanelColorsTitleFontColor: TColorBoxEx;
    NightModePanelColorsTitleShadowFontColor: TColorBoxEx;
    NightModePanelColorsTitle2ShadowFontColor: TColorBoxEx;
    LabelNightModePanelColorsTitle2ShadowFontColor: TShadowLabel;
    LabelNightModePanelColorsTitleShadowFontColor: TShadowLabel;
    LabelNightModePanelColorsTitleFontColor: TShadowLabel;
    LabelNightModePanelColorsMessageShadowFontColor: TShadowLabel;
    LabelNightModePanelColorsMessageFontColor: TShadowLabel;
    LabelNightModeSearchGamesPanelTopColor: TShadowLabel;
    NightModeSearchGamesPanelTopColor: TColorBoxEx;
    NightModeSearchGamesPanelBottomColor: TColorBoxEx;
    NightModeSearchGamesPanelInnerFrameColor: TColorBoxEx;
    NightModeSearchGamesPanelOuterFrameColor: TColorBoxEx;
    NightModePanelColorsTitle2FontColor: TColorBoxEx;
    LabelNightModePanelColorsTitle2FontColor: TShadowLabel;
    LabelNightModeSearchGamesPanelOuterFrameColor: TShadowLabel;
    LabelNightModeSearchGamesPanelInnerFrameColor: TShadowLabel;
    LabelNightModeSearchGamesPanelBottomColor: TShadowLabel;
    PanelPage2: TPanelEx;
    NightModeSearchGamesPanelColorsBox: TPanelEx;
    ShadowLabel2: TShadowLabel;
    LabelNightModeSearchGamesPanelFilterFontColor: TShadowLabel;
    LabelNightModeSearchGamesPanelFilterShadowColor: TShadowLabel;
    LabelNightModeSearchGamesPanelFieldFontColor: TShadowLabel;
    LabelNightModeSearchGamesPanelFieldShadowColor: TShadowLabel;
    Label3: TShadowLabel;
    Label4: TShadowLabel;
    LabelNightModeSearchGamesFloatingPanel: TShadowLabel;
    LabelNightModeSearchGamesPanelEditBoxFontColor: TShadowLabel;
    LabelNightModeSearchGamesPanelEditBoxBackgroundColor: TShadowLabel;
    LabelNightModeSearchGamesPanelEditBoxCustomFrameColor: TShadowLabel;
    LabelNightModeSearchGamesPanelEditBoxCustomFocusedFrameColor: TShadowLabel;
    NightModeSearchGamesPanelColorsDefaultButton: TBitBtnEx;
    NightModeSearchGamesPanelFilterFontColor: TColorBoxEx;
    NightModeSearchGamesPanelFilterShadowColor: TColorBoxEx;
    NightModeSearchGamesPanelFieldFontColor: TColorBoxEx;
    NightModeSearchGamesPanelFieldShadowColor: TColorBoxEx;
    NightModeSearchGamesPanelCaptionBarFontColor: TColorBoxEx;
    NightModeSearchGamesPanelCaptionBarShadowColor: TColorBoxEx;
    NightModeSearchGamesPanelEditBoxFontColor: TColorBoxEx;
    NightModeSearchGamesPanelEditBoxBackgroundColor: TColorBoxEx;
    NightModeSearchGamesPanelEditBoxCustomFrameColor: TColorBoxEx;
    NightModeSearchGamesPanelEditBoxUseCustomFrame: TAdvOfficeCheckBoxEx;
    NightModeSearchGamesPanelEditBoxCustomFocusedFrameColor: TColorBoxEx;
    ToolBarOverlayIconsFolderButtonUpdate: TBitBtnEx;
    ToolBarOverlayIconsFolder: TComboBox2Ex;
    NightModeGamesBackgroundGroupBox: TPanelEx;
    NightModeGamesBackgroundGroupBoxLabel: TShadowLabel;
    NightModeGamesBackgroundColor: TColorBoxEx;
    NightModeButtonDefaultBkSortedColor: TBitBtnEx;
    NightModeGamesBackgroundImage: TEditEx;
    NightModeGamesBackgroundImageEnable: TAdvOfficeCheckBoxEx;
    NightModeGamesTileBackground: TAdvOfficeCheckBoxEx;
    NightModeGamesBackgroundImageButtonSelect: TBitBtnEx;
    NightModeGamesBackgroundImageButtonUpdate: TBitBtnEx;
    NightModeGameDocsGroupBox: TPanelEx;
    NightModeGameDocsGroupBoxLabel: TShadowLabel;
    NightModeLabelGameDocsShowStatusBar: TShadowLabel;
    NightModeGameDocsFont_Setting: TShadowLabel;
    NightModeGameDocumentsBackgroundColor: TColorBoxEx;
    NightModeButtonGameDocumentsFont: TBitBtnEx;
    NightModeButtonGameDocumentsDefault: TBitBtnEx;
    NightModeGameDocsShowBorder: TAdvOfficeCheckBoxEx;
    NightModeGameDocsBorderColor: TColorBoxEx;
    NightModeButtonGameDocsBorderColorDefault: TBitBtnEx;
    NightModeGameDocsShowStatusBar: TAdvOfficeCheckBoxEx;
    NightModeGroupBoxGameDocsSplitter: TPanelEx;
    NightModeGroupBoxGameDocsSplitterLabel: TShadowLabel;
    NightModeLabelGameDocsSplitterSingleColorDefault: TShadowLabel;
    NightModeLabelGameDocsSplitterSingleColor: TShadowLabel;
    NightModeLabelGameDocsSplitterSingleColorHot: TShadowLabel;
    NightModeGameDocsSplitterStyleSelector: TComboBox2Ex;
    NightModeButtonGameDocsSplitterSingleColorDefault: TBitBtnEx;
    NightModeButtonGameDocsSplitterStyleDefault: TBitBtnEx;
    NightModeGameDocsSplitterShowGripIcon: TAdvOfficeCheckBoxEx;
    NightModeGameDocsSplitterSingleColor: TColorBoxEx;
    NightModeGameDocsSplitterSingleColorHot: TColorBoxEx;
    NightModeMenuPopupMenuBox: TPanelEx;
    ShadowLabel20: TShadowLabel;
    LabelNightModeMenuPopupMenuFrameColor: TShadowLabel;
    NightModeMenuPopupMenuFrameColor: TColorBoxEx;
    NightModeMenuPopupMenuFrameColorDefaultColors: TBitBtnEx;
    NightModeButtonColorsBox: TPanelEx;
    NightModeButtonColorsBoxLabel: TShadowLabel;
    LabelNightModeButtonColorFontColor: TShadowLabel;
    LabelNightModeButtonColorGradientTop: TShadowLabel;
    LabelNightModeButtonColorGradientBottom: TShadowLabel;
    LabelNightModeButtonColorGradientBottomHover: TShadowLabel;
    LabelNightModeButtonColorGradientTopHover: TShadowLabel;
    LabelNightModeButtonColorGradientTopDisabled: TShadowLabel;
    LabelNightModeButtonColorGradientBottomDisabled: TShadowLabel;
    LabelNightModeButtonColorFrameColor: TShadowLabel;
    LabelNightModeButtonColorFrameColorHover: TShadowLabel;
    LabelNightModeButtonColorFrameColorDisabled: TShadowLabel;
    LabelNightModeButtonColorFrameColorFocused: TShadowLabel;
    LabelNightModeButtonColorFontColorDisabled: TShadowLabel;
    LabelNightModeButtonColorFontShadowColorDisabled: TShadowLabel;
    ShadowLabel8: TShadowLabel;
    ShadowLabel9: TShadowLabel;
    ShadowLabel10: TShadowLabel;
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
    NightModeButtonColorsBoxDefaultButton: TBitBtnEx;
    NightModeButtonColorGradientTopSelected: TColorBoxEx;
    NightModeButtonColorGradientBottomSelected: TColorBoxEx;
    NightModeButtonColorFrameColorSelected: TColorBoxEx;
    NightModeButtonColorsSamplePanel: TPanelEx;
    NightModeButtonColorsSampleButton4: TSpeedButtonEx;
    NightModeButtonColorsSampleButton1: TBitBtnEx;
    NightModeButtonColorsSampleButton2: TBitBtnEx;
    NightModeButtonColorsSampleButton3: TBitBtnEx;
    NightModeGroupBoxGamesListSplitters: TPanelEx;
    NightModeGroupBoxGamesListSplittersLabel: TShadowLabel;
    NightModeLabelGamesListSplitterSingleColorDefault: TShadowLabel;
    NightModeLabelGamesListSplitterSingleColor: TShadowLabel;
    NightModeLabelGamesListSplitterSingleColorHot: TShadowLabel;
    NightModeGamesListSplitterStyleSelector: TComboBox2Ex;
    NightModeButtonGamesListSplitterStyleDefault: TBitBtnEx;
    NightModeButtonGamesListSplitterSingleColorDefault: TBitBtnEx;
    NightModeGamesListSplitterShowGripIcon: TAdvOfficeCheckBoxEx;
    NightModeGamesListSplitterSingleColor: TColorBoxEx;
    NightModeGamesListSplitterSingleColorHot: TColorBoxEx;
    NightModeImagesHintBox: TPanelEx;
    NightModeImagesHintBoxLabel: TShadowLabel;
    LabelNightModeHintBox_Color: TShadowLabel;
    NightModeLabelHintBox_Opacity: TShadowLabel;
    NightModeLabelHintBox_TextColor: TShadowLabel;
    NightModeButtonHintBoxDefaultColors: TBitBtnEx;
    NightModeHintBox_Color: TColorBoxEx;
    NightModeHintBox_FrameColor: TColorBoxEx;
    NightModeHintBox_FrameEnabled: TAdvOfficeCheckBoxEx;
    NightModeHintBox_Opacity: TGaugeBar;
    NightModeButtonDefaultHintBox_Opacity: TBitBtnEx;
    NightModeButtonHintTextDefaultColors: TBitBtnEx;
    NightModeHintBox_IconEnabled: TAdvOfficeCheckBoxEx;
    NightModeHintBox_TextColor: TColorBoxEx;
    NightModeHintBox_TextShadowColor: TColorBoxEx;
    NightModeHintBox_TextShadowEnabled: TAdvOfficeCheckBoxEx;
    NightModeGroupBoxImageSplitters: TPanelEx;
    NightModeGroupBoxImageSplittersLabel: TShadowLabel;
    NightModeLabelImageSplitterSingleColorDefault: TShadowLabel;
    NightModeLabelImageSplitterSingleColor: TShadowLabel;
    NightModeLabelImageSplitterSingleColorHot: TShadowLabel;
    NightModeImageSplitterStyleSelector: TComboBox2Ex;
    NightModeButtonImageSplitterStyleDefault: TBitBtnEx;
    NightModeButtonImageSplitterSingleColorDefault: TBitBtnEx;
    NightModeImageSplitterShowGripIcon: TAdvOfficeCheckBoxEx;
    NightModeImageSplitterSingleColor: TColorBoxEx;
    NightModeImageSplitterSingleColorHot: TColorBoxEx;
    NightModeImageBorderColorGroupBox: TPanelEx;
    NightModeImageBorderColorGroupBoxLabel: TShadowLabel;
    NightModeImageBorderColor: TColorBoxEx;
    NightModeButtonImageBorderColorDefault: TBitBtnEx;
    NightModeProfiles_ButtonNew: TBitBtnEx;
    NightModeProfiles: TComboBox2Ex;
    NightModeProfiles_ButtonSave: TBitBtnEx;
    NightModeProfiles_ButtonSaveAs: TBitBtnEx;
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
    BitBtnEx1: TBitBtnEx;
    NightModeImagesHintBoxPreviewButtonClose: TShadowLabel;
    BitBtnEx2: TBitBtnEx;
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
    procedure NightModeButtonColorsBoxDefaultButtonClick(Sender: TObject);
    procedure ButtonPage1Click(Sender: TObject);
    procedure ButtonPage2Click(Sender: TObject);
    procedure NightModeGamesBackgroundColorSelect(Sender: TObject);
    procedure NightModeButtonDefaultBkSortedColorClick(Sender: TObject);
    procedure NightModeGamesBackgroundImageEnableClick(Sender: TObject);
    procedure NightModeGamesTileBackgroundClick(Sender: TObject);
    procedure NightModeGamesBackgroundImageButtonSelectClick(
      Sender: TObject);
    procedure NightModeGamesBackgroundImageButtonUpdateClick(
      Sender: TObject);
    procedure NightModeGameSelectionGradientBarClick(Sender: TObject);
    procedure NightModeGameSelectionAlphaBlendClick(Sender: TObject);
    procedure NightModeGameSelectionButtonDefaultClick(Sender: TObject);
    procedure NightModeGamesListUseWindowsThemedBorderClick(
      Sender: TObject);
    procedure NightModeGamesListShowInnerFrameClick(Sender: TObject);
    procedure NightModeGamesListShowOuterFrameClick(Sender: TObject);
    procedure NightModeGamesListInnerFrameColorSelect(Sender: TObject);
    procedure NightModeGamesListOuterFrameColorSelect(Sender: TObject);
    procedure NightModeGamesListFrameColorsDefaultButtonClick(
      Sender: TObject);
    procedure NightModeImagesPanelShowInnerFrameClick(Sender: TObject);
    procedure NightModeImagesPanelShowOuterFrameClick(Sender: TObject);
    procedure NightModeImagesPanelInnerFrameColorSelect(Sender: TObject);
    procedure NightModeImagesPanelOuterFrameColorSelect(Sender: TObject);
    procedure NightModeImagesPanelFrameColorsDefaultButtonClick(
      Sender: TObject);
    procedure ToolBarOverlayIconsFolderSelect(Sender: TObject);
    procedure ToolBarOverlayIconsFolderButtonUpdateClick(Sender: TObject);
    procedure NightModeToolBarGradientBarClick(Sender: TObject);
    procedure NightModeToolBarBkTopColorSelect(Sender: TObject);
    procedure NightModeToolBarBkBottomColorSelect(Sender: TObject);
    procedure NightModeToolBarShowOuterFrameClick(Sender: TObject);
    procedure NightModeToolBarInnerFrameColorSelect(Sender: TObject);
    procedure NightModeToolBarOuterFrameColorSelect(Sender: TObject);
    procedure NightModeToolBarBkColorsDefaultButtonClick(Sender: TObject);
    procedure NightModeGamesListStatusBarGradientBarClick(Sender: TObject);
    procedure NightModeGamesListStatusBarTopColorSelect(Sender: TObject);
    procedure NightModeGamesListStatusBarBottomColorSelect(
      Sender: TObject);
    procedure NightModeGamesListStatusBarShowOuterFrameClick(
      Sender: TObject);
    procedure NightModeGamesListStatusBarInnerFrameColorSelect(
      Sender: TObject);
    procedure NightModeGamesListStatusBarOuterFrameColorSelect(
      Sender: TObject);
    procedure NightModeGamesListStatusBarFontColorSelect(Sender: TObject);
    procedure NightModeGamesListStatusBarShadowFontEnabledClick(
      Sender: TObject);
    procedure NightModeGamesListStatusBarShadowFontColorSelect(
      Sender: TObject);
    procedure NightModeGamesListStatusBarButtonDefaultClick(
      Sender: TObject);
    procedure NightModeGamesListStatusBarCopyButtonClick(Sender: TObject);
    procedure NightModeSearchGamesPanelGradientBarClick(Sender: TObject);
    procedure NightModeSearchGamesPanelTopColorSelect(Sender: TObject);
    procedure NightModeSearchGamesPanelBottomColorSelect(Sender: TObject);
    procedure NightModeSearchGamesPanelInnerFrameColorSelect(
      Sender: TObject);
    procedure NightModeSearchGamesPanelOuterFrameColorSelect(
      Sender: TObject);
    procedure NightModePanelColorsTitle2FontColorSelect(Sender: TObject);
    procedure NightModePanelColorsMessageFontColorSelect(Sender: TObject);
    procedure NightModePanelColorsMessageShadowFontColorSelect(
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
    procedure NightModeSearchGamesPanelFilterShadowColorSelect(
      Sender: TObject);
    procedure NightModeSearchGamesPanelFieldFontColorSelect(
      Sender: TObject);
    procedure NightModeSearchGamesPanelFieldShadowColorSelect(
      Sender: TObject);
    procedure NightModeSearchGamesPanelEditBoxFontColorSelect(
      Sender: TObject);
    procedure NightModeSearchGamesPanelEditBoxBackgroundColorSelect(
      Sender: TObject);
    procedure NightModeSearchGamesPanelEditBoxUseCustomFrameClick(
      Sender: TObject);
    procedure NightModeSearchGamesPanelEditBoxCustomFrameColorSelect(
      Sender: TObject);
    procedure NightModeSearchGamesPanelEditBoxCustomFocusedFrameColorSelect(
      Sender: TObject);
    procedure NightModeSearchGamesPanelCaptionBarFontColorSelect(
      Sender: TObject);
    procedure NightModeSearchGamesPanelCaptionBarShadowColorSelect(
      Sender: TObject);
    procedure NightModeSearchGamesPanelColorsDefaultButtonClick(
      Sender: TObject);
    procedure NightModeGamesListSplitterStyleSelectorSelect(
      Sender: TObject);
    procedure NightModeButtonGamesListSplitterStyleDefaultClick(
      Sender: TObject);
    procedure NightModeGamesListSplitterShowGripIconClick(Sender: TObject);
    procedure NightModeGamesListSplitterSingleColorSelect(Sender: TObject);
    procedure NightModeGamesListSplitterSingleColorHotSelect(
      Sender: TObject);
    procedure NightModeButtonGamesListSplitterSingleColorDefaultClick(
      Sender: TObject);
    procedure NightModeGameDocumentsBackgroundColorSelect(Sender: TObject);
    procedure NightModeButtonGameDocumentsFontClick(Sender: TObject);
    procedure NightModeButtonGameDocumentsDefaultClick(Sender: TObject);
    procedure NightModeGameDocsShowBorderClick(Sender: TObject);
    procedure NightModeGameDocsBorderColorSelect(Sender: TObject);
    procedure NightModeButtonGameDocsBorderColorDefaultClick(
      Sender: TObject);
    procedure NightModeGameDocsShowStatusBarClick(Sender: TObject);
    procedure NightModeGameDocsSplitterStyleSelectorSelect(
      Sender: TObject);
    procedure NightModeButtonGameDocsSplitterStyleDefaultClick(
      Sender: TObject);
    procedure NightModeGameDocsSplitterShowGripIconClick(Sender: TObject);
    procedure NightModeGameDocsSplitterSingleColorSelect(Sender: TObject);
    procedure NightModeGameDocsSplitterSingleColorHotSelect(
      Sender: TObject);
    procedure NightModeButtonGameDocsSplitterSingleColorDefaultClick(
      Sender: TObject);
    procedure NightModeMenuPopupMenuFrameColorDefaultColorsClick(
      Sender: TObject);
    procedure NightModeButtonHintBoxDefaultColorsClick(Sender: TObject);
    procedure NightModeHintBox_OpacityChange(Sender: TObject);
    procedure NightModeButtonDefaultHintBox_OpacityClick(Sender: TObject);
    procedure NightModeButtonHintTextDefaultColorsClick(Sender: TObject);
    procedure NightModeImageSplitterStyleSelectorSelect(Sender: TObject);
    procedure NightModeButtonImageSplitterStyleDefaultClick(
      Sender: TObject);
    procedure NightModeImageSplitterShowGripIconClick(Sender: TObject);
    procedure NightModeImageSplitterSingleColorSelect(Sender: TObject);
    procedure NightModeImageSplitterSingleColorHotSelect(Sender: TObject);
    procedure NightModeButtonImageSplitterSingleColorDefaultClick(
      Sender: TObject);
    procedure NightModeImageBorderColorSelect(Sender: TObject);
    procedure NightModeButtonImageBorderColorDefaultClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure NightModeHintBox_ColorSelect(Sender: TObject);
    procedure NightModeHintBox_FrameEnabledClick(Sender: TObject);
    procedure NightModeHintBox_FrameColorSelect(Sender: TObject);
    procedure NightModeHintBox_TextColorSelect(Sender: TObject);
    procedure NightModeHintBox_TextShadowColorSelect(Sender: TObject);
    procedure NightModeHintBox_TextShadowEnabledClick(Sender: TObject);
    procedure NightModeHintBox_IconEnabledClick(Sender: TObject);
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
    procedure GameSelectionButtonPreviewClick(Sender: TObject);
    procedure NightModePanelColorsBoxPreviewButtonCloseClick(Sender: TObject);
    procedure BitBtnEx1Click(Sender: TObject);
    procedure NightModeImagesHintBoxPreviewButtonCloseClick(
      Sender: TObject);
    procedure BitBtnEx2Click(Sender: TObject);
  private
    { Private declarations }
    procedure UpdateGamesBackgroundImage(ImageEnabledCheckBox: TAdvOfficeCheckBoxEx; ImageFileNameEditBox: TEditEx; NightModeControls: Boolean; IsNightModePreview: Boolean = False);
    procedure AddNightModeProfiles;
    procedure PopulateIconOverlayFoldersList;
    procedure NightModeRepaintToolBar;
    procedure SetPanelExParentPos(PanelSource: TPanelEx; LeftPos, TopPos: Integer);
    procedure HintBoxUpdateSize;
  public
    { Public declarations }
  end;

var
  FormNightMode: TFormNightMode;

implementation

uses uMain;

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
                  if NightModeControls = IsNightMode then //if not IsNightMode then
                  begin
                    if not IsNightModePreview then
                    begin
                      if FormMain.GamesListView.BackGround.Image <> nil then
                         FormMain.GamesListView.BackGround.Image:= nil;

                      if FormMain.MachinesListSidePanel.BackGround.Image <> nil then
                         FormMain.MachinesListSidePanel.BackGround.Image:= nil;
                    end;

                    if NightModeGamesListView.BackGround.Image <> nil then
                       NightModeGamesListView.BackGround.Image:= nil;
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
            if not IsNightModePreview then
            begin
              FormMain.GamesListView.BackGround.Image.Assign(ListViewBk);
              FormMain.MachinesListSidePanel.BackGround.Image.Assign(ListViewBk);
            end;
            NightModeGamesListView.BackGround.Image.Assign(ListViewBk);
            FreeAndNil(ListViewBk);
          except
            if not IsNightModePreview then
            begin
              FormMain.GamesListView.Background.Image:= nil;
              FormMain.MachinesListSidePanel.BackGround.Image:= nil;
            end;
            NightModeGamesListView.BackGround.Image:= nil;
          end;
        end;
      end;
    False:
      begin
        if NightModeControls = IsNightMode then //if not IsNightMode then
        begin
          if not IsNightModePreview then
          begin
            FormMain.GamesListView.Background.Image:= nil;
            FormMain.MachinesListSidePanel.BackGround.Image:= nil;
          end;
          NightModeGamesListView.BackGround.Image:= nil;
        end;
      end;
  end;
end;

procedure TFormNightMode.AddNightModeProfiles;
begin
  NightModeProfiles.Items.Add('Default');
  NightModeProfiles.ItemIndex:= 0;
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

  ToolBarOverlayIconsFolder.ItemIndex:= iIndex;
  ToolBarOverlayIconsFolder.Tag:= 0;
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
  if TBitBtnEx(Sender).Tag > 4 then
     TBitBtnEx(Sender).Tag:= 1;

  case TBitBtnEx(Sender).Tag of
    1: SetPanelColors(NightModeButtonColorsSamplePanel, clrMedDarkGray, -1, True); // this is the bk color of the panels
    2: SetPanelColors(NightModeButtonColorsSamplePanel, menu_background_color[1], -1, True);
    3: SetPanelColors(NightModeButtonColorsSamplePanel, menu_background_color[1], clrMedDarkGray);
    4: SetPanelColors(NightModeButtonColorsSamplePanel, clrBlackBk, clrDarkGray);
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

procedure TFormNightMode.NightModeButtonColorsBoxDefaultButtonClick(
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

  SetDefaultColorBox(NightModeButtonColorGradientTopSelected);
  SetDefaultColorBox(NightModeButtonColorGradientBottomSelected);
  SetDefaultColorBox(NightModeButtonColorFrameColorSelected);

  SetDefaultColorBox(NightModeButtonColorGradientTopDisabled);
  SetDefaultColorBox(NightModeButtonColorGradientBottomDisabled);
  SetDefaultColorBox(NightModeButtonColorFrameColorDisabled);

  SetDefaultColorBox(NightModeButtonColorFontColorDisabled);
  SetDefaultColorBox(NightModeButtonColorFontShadowColorDisabled);
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
     end;
  NightModeGamesListView.Color:= NightModeGamesBackgroundColor.Selected;
end;

procedure TFormNightMode.NightModeButtonDefaultBkSortedColorClick(
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
       NightModeGamesListView.BackGround.Enabled:= NightModeGamesBackgroundImageEnable.Checked;
       NightModeGamesBackgroundImageButtonUpdate.Click;
     end
  else
     begin
       NightModeGamesListView.BackGround.Enabled:= NightModeGamesBackgroundImageEnable.Checked;
       NightModeGamesBackgroundImageButtonUpdate.Click;
     end;
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
       FormMain.GamesListView.Selection.RoundRect:= NightModeGameSelectionAlphaBlend.Checked;
       FormMain.MachinesListSidePanel.Selection.AlphaBlend:= NightModeGameSelectionAlphaBlend.Checked;
       FormMain.MachinesListSidePanel.Selection.RoundRect:= NightModeGameSelectionAlphaBlend.Checked;
     end;
  NightModeGamesListView.Selection.AlphaBlend:= NightModeGameSelectionAlphaBlend.Checked;
  NightModeGamesListView.Selection.RoundRect:= NightModeGameSelectionAlphaBlend.Checked;
end;

procedure TFormNightMode.NightModeGameSelectionButtonDefaultClick(
  Sender: TObject);
begin
  NightModeGameSelectionGradientBar.Checked:= False;
  NightModeGameSelectionAlphaBlend.Checked:= False;

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

procedure TFormNightMode.NightModeGamesListUseWindowsThemedBorderClick(
  Sender: TObject);
begin
  if IsNightMode then
     begin
       FormMain.GamesListView.ShowThemedBorder:= NightModeGamesListUseWindowsThemedBorder.Checked;
       FormMain.MachinesListSidePanel.ShowThemedBorder:= NightModeGamesListUseWindowsThemedBorder.Checked;
       if NightModeGamesListUseWindowsThemedBorder.Checked then
          begin
            if FormMain.PanelGamesList.EnableCustomBorder <> ecbNone then
               FormMain.PanelGamesList.EnableCustomBorder:= ecbNone;

            if FormMain.PanelMachinesList.EnableCustomBorder <> ecbNone then
               FormMain.PanelMachinesList.EnableCustomBorder:= ecbNone;
          end
       else
          begin
            NightModeGamesListShowOuterFrame.OnClick(Self);
          end;
     end;

  // night mode preview
  NightModeGamesListView.ShowThemedBorder:= NightModeGamesListUseWindowsThemedBorder.Checked;
  if NightModeGamesListUseWindowsThemedBorder.Checked then
     begin
       if NightModePanelGamesList.EnableCustomBorder <> ecbNone then
          NightModePanelGamesList.EnableCustomBorder:= ecbNone;
     end
  else
     begin
       NightModeGamesListShowOuterFrame.OnClick(Self);
     end;
end;

procedure TFormNightMode.NightModeGamesListShowInnerFrameClick(
  Sender: TObject);
begin
  if IsNightMode then
     begin
       if not NightModeGamesListUseWindowsThemedBorder.Checked then
          begin
            FormMain.SetPanelExFrames(NightModeGamesListShowOuterFrame, NightModeGamesListShowInnerFrame, FormMain.PanelGamesList, -1, True);
            FormMain.SetPanelExFrames(NightModeGamesListShowOuterFrame, NightModeGamesListShowInnerFrame, FormMain.PanelMachinesList, -1, True);
          end;
     end;
  if not NightModeGamesListUseWindowsThemedBorder.Checked then
     FormMain.SetPanelExFrames(NightModeGamesListShowOuterFrame, NightModeGamesListShowInnerFrame, NightModePanelGamesList, -1, True);
end;

procedure TFormNightMode.NightModeGamesListShowOuterFrameClick(
  Sender: TObject);
begin
  if IsNightMode then
     begin
       if not NightModeGamesListUseWindowsThemedBorder.Checked then
          begin
            FormMain.SetPanelExFrames(NightModeGamesListShowOuterFrame, NightModeGamesListShowInnerFrame, FormMain.PanelGamesList, -1, True);
            FormMain.SetPanelExFrames(NightModeGamesListShowOuterFrame, NightModeGamesListShowInnerFrame, FormMain.PanelMachinesList, -1, True);
          end;
     end;
  if not NightModeGamesListUseWindowsThemedBorder.Checked then
     FormMain.SetPanelExFrames(NightModeGamesListShowOuterFrame, NightModeGamesListShowInnerFrame, NightModePanelGamesList, -1, True);
end;

procedure TFormNightMode.NightModeGamesListInnerFrameColorSelect(
  Sender: TObject);
begin
  if IsNightMode then
     begin
       FormMain.PanelGamesList.ColorInnerFrame:= NightModeGamesListInnerFrameColor.Selected;
       FormMain.PanelMachinesList.ColorInnerFrame:= NightModeGamesListInnerFrameColor.Selected;
     end;
  NightModePanelGamesList.ColorInnerFrame:= NightModeGamesListInnerFrameColor.Selected;
end;

procedure TFormNightMode.NightModeGamesListOuterFrameColorSelect(
  Sender: TObject);
begin
  if IsNightMode then
     begin
       FormMain.PanelGamesList.ColorFrame:= NightModeGamesListOuterFrameColor.Selected;
       FormMain.PanelMachinesList.ColorFrame:= NightModeGamesListOuterFrameColor.Selected;
     end;
  NightModePanelGamesList.ColorFrame:= NightModeGamesListOuterFrameColor.Selected;
end;

procedure TFormNightMode.NightModeGamesListFrameColorsDefaultButtonClick(
  Sender: TObject);
begin
  SetDefaultColorBox(NightModeGamesListInnerFrameColor);
  SetDefaultColorBox(NightModeGamesListOuterFrameColor);
end;

procedure TFormNightMode.NightModeImagesPanelShowInnerFrameClick(
  Sender: TObject);
begin
  FormMain.SetPanelExFrames(NightModeImagesPanelShowOuterFrame, NightModeImagesPanelShowInnerFrame, FormMain.PanelImagesDocuments, -1, True);
end;

procedure TFormNightMode.NightModeImagesPanelShowOuterFrameClick(
  Sender: TObject);
begin
  FormMain.SetPanelExFrames(NightModeImagesPanelShowOuterFrame, NightModeImagesPanelShowInnerFrame, FormMain.PanelImagesDocuments, -1, True);
end;

procedure TFormNightMode.NightModeImagesPanelInnerFrameColorSelect(
  Sender: TObject);
begin
  if IsNightMode then
     FormMain.PanelImagesDocuments.ColorInnerFrame:= NightModeImagesPanelInnerFrameColor.Selected;
end;

procedure TFormNightMode.NightModeImagesPanelOuterFrameColorSelect(
  Sender: TObject);
begin
  if IsNightMode then
     FormMain.PanelImagesDocuments.ColorFrame:= NightModeImagesPanelOuterFrameColor.Selected;
end;

procedure TFormNightMode.NightModeImagesPanelFrameColorsDefaultButtonClick(
  Sender: TObject);
begin
  SetDefaultColorBox(NightModeImagesPanelInnerFrameColor);
  SetDefaultColorBox(NightModeImagesPanelOuterFrameColor);
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
       ToolBarOverlayIconsFolder.ItemIndex:= 0;
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
       NightModeRepaintToolBar;
     end;
end;

procedure TFormNightMode.NightModeToolBarBkTopColorSelect(Sender: TObject);
begin
  FormMain.PanelSearchGames_ToolBar.Color1:= NightModeToolBarBkTopColor.Selected;
  NightModeRepaintToolBar;
end;

procedure TFormNightMode.NightModeToolBarBkBottomColorSelect(
  Sender: TObject);
begin
  FormMain.PanelSearchGames_ToolBar.Color2:= NightModeToolBarBkBottomColor.Selected;
  NightModeRepaintToolBar;
end;

procedure TFormNightMode.NightModeToolBarShowOuterFrameClick(
  Sender: TObject);
begin
  FormMain.SetPanelExFrames(NightModeToolBarShowOuterFrame, NightModeToolBarShowInnerFrame, FormMain.PanelToolBar, FormMain.ToolBarButtons.ButtonHeight+1, True);
  FormMain.SetPanelExFrames(NightModeToolBarShowOuterFrame, NightModeToolBarShowInnerFrame, FormMain.PanelToolBarImages, FormMain.ImagesToolBarButtons.ButtonHeight, True);
  NightModeRepaintToolBar;
end;

procedure TFormNightMode.NightModeToolBarInnerFrameColorSelect(
  Sender: TObject);
begin
  FormMain.PanelToolBar.ColorInnerFrame:= NightModeToolBarInnerFrameColor.Selected;
  FormMain.PanelToolBarImages.ColorInnerFrame:= NightModeToolBarInnerFrameColor.Selected;
end;

procedure TFormNightMode.NightModeToolBarOuterFrameColorSelect(
  Sender: TObject);
begin
  FormMain.PanelToolBar.ColorFrame:= NightModeToolBarOuterFrameColor.Selected;
  FormMain.PanelToolBarImages.ColorFrame:= NightModeToolBarOuterFrameColor.Selected;
end;

procedure TFormNightMode.NightModeToolBarBkColorsDefaultButtonClick(
  Sender: TObject);
begin
  SetDefaultColorBox(NightModeToolBarBkTopColor);
  SetDefaultColorBox(NightModeToolBarBkBottomColor);
  SetDefaultColorBox(NightModeToolBarInnerFrameColor);
  SetDefaultColorBox(NightModeToolBarOuterFrameColor);
end;

procedure TFormNightMode.NightModeGamesListStatusBarGradientBarClick(
  Sender: TObject);
begin
  if IsNightMode then
     begin
       FormMain.SetPanelExStyle(FormMain.StatusBarPanel, NightModeGamesListStatusBarGradientBar.Checked);
       FormMain.SetPanelExStyle(FormMain.StatusBarPanelMachines, NightModeGamesListStatusBarGradientBar.Checked);
     end;
end;

procedure TFormNightMode.NightModeGamesListStatusBarTopColorSelect(
  Sender: TObject);
begin
  if IsNightMode then
     begin
       FormMain.StatusBarPanel.Color1:= NightModeGamesListStatusBarTopColor.Selected;
       FormMain.StatusBarPanelMachines.Color1:= NightModeGamesListStatusBarTopColor.Selected;
     end;
end;

procedure TFormNightMode.NightModeGamesListStatusBarBottomColorSelect(
  Sender: TObject);
begin
  if IsNightMode then
     begin
       FormMain.StatusBarPanel.Color2:= NightModeGamesListStatusBarBottomColor.Selected;
       FormMain.StatusBarPanelMachines.Color2:= NightModeGamesListStatusBarBottomColor.Selected;
     end;
end;

procedure TFormNightMode.NightModeGamesListStatusBarShowOuterFrameClick(
  Sender: TObject);
begin
  FormMain.SetPanelExFrames(NightModeGamesListStatusBarShowOuterFrame, NightModeGamesListStatusBarShowInnerFrame, FormMain.StatusBarPanel, 20, True);
  FormMain.SetPanelExFrames(NightModeGamesListStatusBarShowOuterFrame, NightModeGamesListStatusBarShowInnerFrame, FormMain.StatusBarPanelMachines, 20, True);
end;

procedure TFormNightMode.NightModeGamesListStatusBarInnerFrameColorSelect(
  Sender: TObject);
begin
  if IsNightMode then
     begin
       FormMain.StatusBarPanel.ColorInnerFrame:= NightModeGamesListStatusBarInnerFrameColor.Selected;
       FormMain.StatusBarPanelMachines.ColorInnerFrame:= NightModeGamesListStatusBarInnerFrameColor.Selected;
     end;
end;

procedure TFormNightMode.NightModeGamesListStatusBarOuterFrameColorSelect(
  Sender: TObject);
begin
  if IsNightMode then
     begin
       FormMain.StatusBarPanel.ColorFrame:= NightModeGamesListStatusBarOuterFrameColor.Selected;
       FormMain.StatusBarPanelMachines.ColorFrame:= NightModeGamesListStatusBarOuterFrameColor.Selected;
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

procedure TFormNightMode.NightModeGamesListStatusBarShadowFontEnabledClick(
  Sender: TObject);
begin
  if IsNightMode then
     begin
       FormMain.StatusBar_GamesTotal.ShadowEnabled:= NightModeGamesListStatusBarShadowFontEnabled.Checked;
       FormMain.StatusBar_GamesGameName.ShadowEnabled:= NightModeGamesListStatusBarShadowFontEnabled.Checked;
       FormMain.StatusBar_MachinesGameName.ShadowEnabled:= NightModeGamesListStatusBarShadowFontEnabled.Checked;
     end;
end;

procedure TFormNightMode.NightModeGamesListStatusBarShadowFontColorSelect(
  Sender: TObject);
begin
  if IsNightMode then
     begin
       FormMain.StatusBar_GamesTotal.ShadowColor:= NightModeGamesListStatusBarShadowFontColor.Selected;
       FormMain.StatusBar_GamesGameName.ShadowColor:= NightModeGamesListStatusBarShadowFontColor.Selected;
       FormMain.StatusBar_MachinesGameName.ShadowColor:= NightModeGamesListStatusBarShadowFontColor.Selected;
     end;
end;

procedure TFormNightMode.NightModeGamesListStatusBarButtonDefaultClick(
  Sender: TObject);
begin
  SetDefaultColorBox(NightModeGamesListStatusBarTopColor);
  SetDefaultColorBox(NightModeGamesListStatusBarBottomColor);
  SetDefaultColorBox(NightModeGamesListStatusBarInnerFrameColor);
  SetDefaultColorBox(NightModeGamesListStatusBarOuterFrameColor);
  SetDefaultColorBox(NightModeGamesListStatusBarFontColor);
  SetDefaultColorBox(NightModeGamesListStatusBarShadowFontColor);

  NightModeGamesListStatusBarShowInnerFrame.Checked:= True;
  NightModeGamesListStatusBarShowOuterFrame.Checked:= True;

  NightModeGamesListStatusBarShadowFontEnabled.Checked:= True;
  NightModeGamesListStatusBarGradientBar.Checked:= True;
end;

procedure TFormNightMode.NightModeGamesListStatusBarCopyButtonClick(
  Sender: TObject);
begin
  // copy settings from preferences screen... no longer needed
  //FormMain.SetSelectedColorBox(NightModeGamesListStatusBarTopColor, GamesListStatusBarTopColor.Selected);
  //FormMain.SetSelectedColorBox(NightModeGamesListStatusBarBottomColor, GamesListStatusBarBottomColor.Selected);
  //FormMain.SetSelectedColorBox(NightModeGamesListStatusBarInnerFrameColor, GamesListStatusBarInnerFrameColor.Selected);
  //FormMain.SetSelectedColorBox(NightModeGamesListStatusBarOuterFrameColor, GamesListStatusBarOuterFrameColor.Selected);
  //FormMain.SetSelectedColorBox(NightModeGamesListStatusBarFontColor, GamesListStatusBarFontColor.Selected);
  //FormMain.SetSelectedColorBox(NightModeGamesListStatusBarShadowFontColor, GamesListStatusBarShadowFontColor.Selected);
end;

procedure TFormNightMode.NightModeSearchGamesPanelGradientBarClick(
  Sender: TObject);
begin
  if IsNightMode then
     begin
       FormMain.SetPanelExStyle(FormMain.PanelSearchGames, NightModeSearchGamesPanelGradientBar.Checked);
       FormMain.SetPanelExStyle(FormMain.PanelFilterCPU, NightModeSearchGamesPanelGradientBar.Checked);
     end;
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
     end;
  PanelInitZipFile.Color1:= NightModeSearchGamesPanelTopColor.Selected; // sample panel
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
     end;
  PanelInitZipFile.Color2:= NightModeSearchGamesPanelBottomColor.Selected; // sample panel
end;

procedure TFormNightMode.NightModeSearchGamesPanelInnerFrameColorSelect(
  Sender: TObject);
begin
  if IsNightMode then
     begin
       FormMain.PanelSearchGames.ColorInnerFrame:= NightModeSearchGamesPanelInnerFrameColor.Selected;
       FormMain.PanelFilterCPU.ColorInnerFrame:= NightModeSearchGamesPanelInnerFrameColor.Selected;

       FormMain.PanelInitZipFile.ColorInnerFrame:= NightModeSearchGamesPanelInnerFrameColor.Selected;
     end;
  PanelInitZipFile.ColorInnerFrame:= NightModeSearchGamesPanelInnerFrameColor.Selected; // sample panel
end;

procedure TFormNightMode.NightModeSearchGamesPanelOuterFrameColorSelect(
  Sender: TObject);
begin
  if IsNightMode then
     begin
       FormMain.PanelSearchGames.ColorFrame:= NightModeSearchGamesPanelOuterFrameColor.Selected;
       FormMain.PanelFilterCPU.ColorFrame:= NightModeSearchGamesPanelOuterFrameColor.Selected;

       FormMain.PanelInitZipFile.ColorFrame:= NightModeSearchGamesPanelOuterFrameColor.Selected;
     end;
  PanelInitZipFile.ColorFrame:= NightModeSearchGamesPanelOuterFrameColor.Selected; // sample panel
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

procedure TFormNightMode.NightModePanelColorsMessageFontColorSelect(
  Sender: TObject);
begin
  if IsNightMode then
     begin
       FormMain.LabelInitZipImageCategory.Font.Color:= NightModePanelColorsMessageFontColor.Selected;
       FormMain.LabelInitZipFile.Font.Color:= NightModePanelColorsMessageFontColor.Selected;
     end;
  LabelInitZipImageCategory.Font.Color:= NightModePanelColorsMessageFontColor.Selected; // sample panel
  LabelInitZipFile.Font.Color:= NightModePanelColorsMessageFontColor.Selected; // sample panel
end;

procedure TFormNightMode.NightModePanelColorsMessageShadowFontColorSelect(
  Sender: TObject);
begin
  if IsNightMode then
     begin
       FormMain.LabelInitZipImageCategory.ShadowColor:= NightModePanelColorsMessageShadowFontColor.Selected;
       FormMain.LabelInitZipFile.ShadowColor:= NightModePanelColorsMessageShadowFontColor.Selected;
     end;
  LabelInitZipImageCategory.ShadowColor:= NightModePanelColorsMessageShadowFontColor.Selected; // sample panel
  LabelInitZipFile.ShadowColor:= NightModePanelColorsMessageShadowFontColor.Selected; // sample panel
end;

procedure TFormNightMode.NightModePanelColorsTitleFontColorSelect(
  Sender: TObject);
begin
  if IsNightMode then
     begin
       FormMain.LabelInitZipTitle.Font.Color:= NightModePanelColorsTitleFontColor.Selected;
     end;
  LabelInitZipTitle.Font.Color:= NightModePanelColorsTitleFontColor.Selected; // sample panel
end;

procedure TFormNightMode.NightModePanelColorsTitleShadowFontColorSelect(
  Sender: TObject);
begin
  if IsNightMode then
     begin
       FormMain.LabelInitZipTitle.ShadowColor:= NightModePanelColorsTitleShadowFontColor.Selected;
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
  SetDefaultColorBox(NightModeSearchGamesPanelTopColor);
  SetDefaultColorBox(NightModeSearchGamesPanelBottomColor);
  SetDefaultColorBox(NightModeSearchGamesPanelInnerFrameColor);
  SetDefaultColorBox(NightModeSearchGamesPanelOuterFrameColor);

  SetDefaultColorBox(NightModePanelColorsTitleFontColor);
  SetDefaultColorBox(NightModePanelColorsTitleShadowFontColor);
  SetDefaultColorBox(NightModePanelColorsTitle2FontColor);
  SetDefaultColorBox(NightModePanelColorsTitle2ShadowFontColor);
  SetDefaultColorBox(NightModePanelColorsMessageFontColor);
  SetDefaultColorBox(NightModePanelColorsMessageShadowFontColor);

  NightModeSearchGamesPanelGradientBar.Checked:= True;
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
end;

procedure TFormNightMode.NightModeSearchGamesPanelFilterShadowColorSelect(
  Sender: TObject);
begin
  if IsNightMode then
     begin
       FormMain.LabelSearchGamesFilter.ShadowColor:= NightModeSearchGamesPanelFilterShadowColor.Selected;
       FormMain.LabelSearchGamesFilter_ToolBar.ShadowColor:= NightModeSearchGamesPanelFilterShadowColor.Selected;
       FormMain.LabelSelectCPU.ShadowColor:= NightModeSearchGamesPanelFilterShadowColor.Selected;
       FormMain.LabelCustomCPUFilter.ShadowColor:= NightModeSearchGamesPanelFilterShadowColor.Selected;
     end;
end;

procedure TFormNightMode.NightModeSearchGamesPanelFieldFontColorSelect(
  Sender: TObject);
begin
  if IsNightMode then
     begin
       FormMain.LabelSearchGamesBy.Font.Color:= NightModeSearchGamesPanelFieldFontColor.Selected;
       FormMain.LabelSearchGamesBy_ToolBar.Font.Color:= NightModeSearchGamesPanelFieldFontColor.Selected;
     end;
end;

procedure TFormNightMode.NightModeSearchGamesPanelFieldShadowColorSelect(
  Sender: TObject);
begin
  if IsNightMode then
     begin
       FormMain.LabelSearchGamesBy.ShadowColor:= NightModeSearchGamesPanelFieldShadowColor.Selected;
       FormMain.LabelSearchGamesBy_ToolBar.ShadowColor:= NightModeSearchGamesPanelFieldShadowColor.Selected;
     end;
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
end;

procedure TFormNightMode.NightModeSearchGamesPanelEditBoxUseCustomFrameClick(
  Sender: TObject);
begin
  if IsNightMode then
     begin
       FormMain.FilterGameTitle_ToolBar.UseCustomBorder:= NightModeSearchGamesPanelEditBoxUseCustomFrame.Checked;
       FormMain.FilterGameTitle.UseCustomBorder:= NightModeSearchGamesPanelEditBoxUseCustomFrame.Checked;
       FormMain.FilterCPU.UseCustomBorder:= NightModeSearchGamesPanelEditBoxUseCustomFrame.Checked;
     end;
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
end;

procedure TFormNightMode.NightModeSearchGamesPanelCaptionBarFontColorSelect(
  Sender: TObject);
begin
  if IsNightMode then
     begin
       FormMain.PanelSearchGamesCaptionBar.Font.Color:= NightModeSearchGamesPanelCaptionBarFontColor.Selected;
       FormMain.FilterCPU_LabelCaptionBar.Font.Color:= NightModeSearchGamesPanelCaptionBarFontColor.Selected;
     end;
end;

procedure TFormNightMode.NightModeSearchGamesPanelCaptionBarShadowColorSelect(
  Sender: TObject);
begin
  if IsNightMode then
     begin
       FormMain.PanelSearchGamesCaptionBar.ShadowColor:= NightModeSearchGamesPanelCaptionBarShadowColor.Selected;
       FormMain.FilterCPU_LabelCaptionBar.ShadowColor:= NightModeSearchGamesPanelCaptionBarShadowColor.Selected;
     end;
end;

procedure TFormNightMode.NightModeSearchGamesPanelColorsDefaultButtonClick(
  Sender: TObject);
begin
  SetDefaultColorBox(NightModeSearchGamesPanelFilterFontColor);
  SetDefaultColorBox(NightModeSearchGamesPanelFilterShadowColor);

  SetDefaultColorBox(NightModeSearchGamesPanelFieldFontColor);
  SetDefaultColorBox(NightModeSearchGamesPanelFieldShadowColor);

  SetDefaultColorBox(NightModeSearchGamesPanelEditBoxFontColor);
  SetDefaultColorBox(NightModeSearchGamesPanelEditBoxBackgroundColor);

  SetDefaultColorBox(NightModeSearchGamesPanelEditBoxCustomFrameColor);
  SetDefaultColorBox(NightModeSearchGamesPanelEditBoxCustomFocusedFrameColor);

  NightModeSearchGamesPanelEditBoxUseCustomFrame.Checked:= True;

  SetDefaultColorBox(NightModeSearchGamesPanelCaptionBarFontColor);
  SetDefaultColorBox(NightModeSearchGamesPanelCaptionBarShadowColor);
end;

procedure TFormNightMode.NightModeGamesListSplitterStyleSelectorSelect(
  Sender: TObject);
begin
  if not IsNightMode then
  begin
    FormMain.UpdateSplitterStyle(FormMain.Splitter, TTMSStyle(NightModeGamesListSplitterStyleSelector.ItemIndex),
                                 NightModeGamesListSplitterSingleColor.Selected,
                                 NightModeGamesListSplitterSingleColorHot.Selected);

    FormMain.UpdateSplitterStyle(FormMain.SplitterMachines, TTMSStyle(NightModeGamesListSplitterStyleSelector.ItemIndex),
                                 NightModeGamesListSplitterSingleColor.Selected,
                                 NightModeGamesListSplitterSingleColorHot.Selected);
  end;
end;

procedure TFormNightMode.NightModeButtonGamesListSplitterStyleDefaultClick(
  Sender: TObject);
begin
  SetSelectedComboBox(1, NightModeGamesListSplitterStyleSelector);
end;

procedure TFormNightMode.NightModeGamesListSplitterShowGripIconClick(
  Sender: TObject);
begin
  if IsNightMode then
     FormMain.SetGripIcon(FormMain.Splitter, NightModeGamesListSplitterShowGripIcon.Checked);
end;

procedure TFormNightMode.NightModeGamesListSplitterSingleColorSelect(
  Sender: TObject);
begin
  NightModeGamesListSplitterStyleSelector.OnSelect(Self);
end;

procedure TFormNightMode.NightModeGamesListSplitterSingleColorHotSelect(
  Sender: TObject);
begin
  NightModeGamesListSplitterStyleSelector.OnSelect(Self);
end;

procedure TFormNightMode.NightModeButtonGamesListSplitterSingleColorDefaultClick(
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
end;

procedure TFormNightMode.NightModeButtonGameDocumentsFontClick(
  Sender: TObject);
begin
  FormMain.FontDialog.Font:= NightModeGameDocsFont_Setting.Font;// FormMain.MAMEInfoTextHolder.Font;
  FormMain.FontDialog.Tag:= 6;
  if FormMain.FontDialog.Execute then
     begin
       NightModeGameDocsFont_Setting.Font:= FormMain.FontDialog.Font; //FormMain.MAMEInfoTextHolder.Font:= FormMain.FontDialog.Font;
       if IsNightMode then
          FormMain.MAMEInfoTextHolder.Font:= NightModeGameDocsFont_Setting.Font;
     end;
end;

procedure TFormNightMode.NightModeButtonGameDocumentsDefaultClick(
  Sender: TObject);
begin
  NightModeGameDocsFont_Setting.Font.Color:= clBlack;
  NightModeGameDocsFont_Setting.Font.Name:= 'Consolas';
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
     end;
end;

procedure TFormNightMode.NightModeGameDocsBorderColorSelect(
  Sender: TObject);
begin
  if IsNightMode then
     FormMain.PanelGameDocuments.Color:= NightModeGameDocsBorderColor.Selected;
end;

procedure TFormNightMode.NightModeButtonGameDocsBorderColorDefaultClick(
  Sender: TObject);
begin
  SetDefaultColorBox(NightModeGameDocsBorderColor);
  NightModeGameDocsShowBorder.Checked:= True;
end;

procedure TFormNightMode.NightModeGameDocsShowStatusBarClick(
  Sender: TObject);
begin
  if IsNightMode then
     FormMain.MAMEInfoStatusBar.Visible:= NightModeGameDocsShowStatusBar.Checked and (not NightModeGameDocsShowBorder.Checked);
end;

procedure TFormNightMode.NightModeGameDocsSplitterStyleSelectorSelect(
  Sender: TObject);
begin
  if IsNightMode then
     FormMain.UpdateSplitterStyle(FormMain.SplitterMAMEInfo, TTMSStyle(NightModeGameDocsSplitterStyleSelector.ItemIndex),
                                  NightModeGameDocsSplitterSingleColor.Selected,
                                  NightModeGameDocsSplitterSingleColorHot.Selected);
end;

procedure TFormNightMode.NightModeButtonGameDocsSplitterStyleDefaultClick(
  Sender: TObject);
begin
  SetSelectedComboBox(6, NightModeGameDocsSplitterStyleSelector);
end;

procedure TFormNightMode.NightModeGameDocsSplitterShowGripIconClick(
  Sender: TObject);
begin
  if IsNightMode then
     FormMain.SetGripIcon(FormMain.SplitterMAMEInfo, NightModeGameDocsSplitterShowGripIcon.Checked);
end;

procedure TFormNightMode.NightModeGameDocsSplitterSingleColorSelect(
  Sender: TObject);
begin
  NightModeGameDocsSplitterStyleSelector.OnSelect(Self);
end;

procedure TFormNightMode.NightModeGameDocsSplitterSingleColorHotSelect(
  Sender: TObject);
begin
  NightModeGameDocsSplitterStyleSelector.OnSelect(Self);
end;

procedure TFormNightMode.NightModeButtonGameDocsSplitterSingleColorDefaultClick(
  Sender: TObject);
begin
  SetDefaultColorBox(NightModeGameDocsSplitterSingleColor);
  SetDefaultColorBox(NightModeGameDocsSplitterSingleColorHot);
end;

procedure TFormNightMode.NightModeMenuPopupMenuFrameColorDefaultColorsClick(
  Sender: TObject);
begin
  SetDefaultColorBox(NightModeMenuPopupMenuFrameColor); // clrBorderGroupBoxGrayBk
end;

procedure TFormNightMode.NightModeButtonHintBoxDefaultColorsClick(
  Sender: TObject);
begin
  SetDefaultColorBox(NightModeHintBox_Color);
  SetDefaultColorBox(NightModeHintBox_FrameColor);
  NightModeHintBox_FrameEnabled.Checked:= True;
end;

procedure TFormNightMode.NightModeHintBox_OpacityChange(Sender: TObject);
begin
  NightModeLabelHintBox_Opacity.Caption:= 'Opacity ['+IntToStr(NightModeHintBox_Opacity.Position)+']';
  ImageHintPanel.Opacity:= NightModeHintBox_Opacity.Position;
  ImageHintPanel.Invalidate;
end;

procedure TFormNightMode.NightModeButtonDefaultHintBox_OpacityClick(
  Sender: TObject);
begin
  NightModeHintBox_Opacity.Position:= 200;
end;

procedure TFormNightMode.NightModeButtonHintTextDefaultColorsClick(
  Sender: TObject);
begin
  SetDefaultColorBox(NightModeHintBox_TextColor);
  SetDefaultColorBox(NightModeHintBox_TextShadowColor);
  NightModeHintBox_TextShadowEnabled.Checked:= True;
end;

procedure TFormNightMode.NightModeImageSplitterStyleSelectorSelect(
  Sender: TObject);
begin
  FormMain.UpdateImageLayoutSplittersStyle;
end;

procedure TFormNightMode.NightModeButtonImageSplitterStyleDefaultClick(
  Sender: TObject);
begin
  SetSelectedComboBox(1, NightModeImageSplitterStyleSelector);
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
  FormMain.UpdateImageLayoutSplittersStyle;
end;

procedure TFormNightMode.NightModeImageSplitterSingleColorHotSelect(
  Sender: TObject);
begin
  FormMain.UpdateImageLayoutSplittersStyle;
end;

procedure TFormNightMode.NightModeButtonImageSplitterSingleColorDefaultClick(
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

procedure TFormNightMode.NightModeButtonImageBorderColorDefaultClick(
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

procedure TFormNightMode.FormCreate(Sender: TObject);
var
  {ScreenW, }ScreenH: Integer;
begin
  //ScreenW:= Screen.Width;
  ScreenH:= Screen.Height;
  if ScreenH < 1000 then
  begin
    // fallback to 2 pages and re-arrange controls into "PanelPage2"
    PanelPage2.Left:= 0;
    PanelPage2.Top:= 0;
    PanelPage2.Width:= 909;
    PanelPage2.Height:= 616;

    SetPanelExParentPos(NightModeGamesBackgroundGroupBox, 8, 8); // Games List Background
    SetPanelExParentPos(NightModeButtonColorsBox, 8, 91); // Buttons Colors
    SetPanelExParentPos(NightModeGroupBoxGamesListSplitters, 311, 91); // Games List/Machines List Splitters
    SetPanelExParentPos(NightModeGameDocsGroupBox, 311, 239); // Game Docs
    SetPanelExParentPos(NightModeGroupBoxGameDocsSplitter, 311, 398); // Game Docs Splitters
    SetPanelExParentPos(NightModeMenuPopupMenuBox, 614, 91); // Menus/Popup Menus
    SetPanelExParentPos(NightModeImagesHintBox, 614, 157); // Image Hint box
    SetPanelExParentPos(NightModeGroupBoxImageSplitters, 614, 398); // Image Splitters
    SetPanelExParentPos(NightModeImageBorderColorGroupBox, 614, 546); // Image 7 Pixels Border

    //PanelBottom.Height:= 33;
    PanelBottom.Align:= alBottom;
    PanelBottom.Style:= vgSimple;
    PanelPage1.Width:= PanelPage2.Width;
    PanelPage1.Height:= PanelPage2.Height;
    //PanelPage2.Visible:= False;
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

  NightModeGamesSelectionBarPreview.Parent:= PanelPage1;
  NightModeGamesSelectionBarPreview.Left:= 298;
  NightModeGamesSelectionBarPreview.Top:= 8;

  NightModePanelColorsBoxPreview.Parent:= PanelPage1;
  NightModePanelColorsBoxPreview.Left:= 406;
  NightModePanelColorsBoxPreview.Top:= 299;

  NightModeImagesHintBoxPreview.Parent:= NightModeImagesHintBox.Parent;
  NightModeImagesHintBoxPreview.Left:= NightModeImagesHintBox.Left;
  NightModeImagesHintBoxPreview.Top:= NightModeImagesHintBox.Top-NightModeImagesHintBoxPreview.Height-4;

  FormMain.LoadIconIntoImage('EmuLoader_Orb', InitZipSystemIcon);
  ImageHintPanel.Opacity:= NightModeHintBox_Opacity.Position;
  HintBoxUpdateSize;

  PopulateIconOverlayFoldersList;
  AddNightModeProfiles;
end;

procedure TFormNightMode.FormShow(Sender: TObject);
begin
  //FormMain.ELV_ResetNormalColors(NightModeGamesListView); // these cannot be here (June 23, 2019)
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
end;

procedure TFormNightMode.NightModeHintBox_TextShadowColorSelect(
  Sender: TObject);
begin
  ImageHintText.ShadowColor:= NightModeHintBox_TextShadowColor.Selected;
end;

procedure TFormNightMode.NightModeHintBox_TextShadowEnabledClick(
  Sender: TObject);
begin
  ImageHintText.ShadowEnabled:= NightModeHintBox_TextShadowEnabled.Checked;
end;

procedure TFormNightMode.HintBoxUpdateSize;
var
  IconSize: Integer;
begin
  if NightModeHintBox_IconEnabled.Checked then
     IconSize:= 20
  else
     IconSize:= 0;

  ImageHintText.Left:= 8+IconSize;
  ImageHintIcon.Picture.Icon:= nil;

  if NightModeHintBox_IconEnabled.Checked then
     FormMain.IL_MenuPopup.GetIcon(06, ImageHintIcon.Picture.Icon); // unzipped image

  ImageHintPanel.Width:= ImageHintText.Width+16+IconSize;
end;

procedure TFormNightMode.NightModeHintBox_IconEnabledClick(
  Sender: TObject);
begin
  HintBoxUpdateSize;
end;

procedure TFormNightMode.NightModeGamesListViewItemSelectionChanged(
  Sender: TCustomEasyListview; Item: TEasyItem);
begin
  if Item.Selected then
     FormMain.ELV_SetSelectRibbon(Item.ImageIndex, NightModeGamesListView);
end;

procedure TFormNightMode.NightModeGamesListViewItemPaintText(
  Sender: TCustomEasyListview; Item: TEasyItem; Position: Integer;
  ACanvas: TCanvas);
begin
  FormMain.GetCanvasFont(1, -1, False, Item.ImageIndex, 0, '', ACanvas, False, NightModeGamesListView);
  ACanvas.Font.Size:= 9;
end;

procedure TFormNightMode.NightModeGamesSelectionBarPreviewButtonCloseMouseEnter(
  Sender: TObject);
begin
  TShadowLabel(Sender).Color:= clMaroon;
end;

procedure TFormNightMode.NightModeGamesSelectionBarPreviewButtonCloseMouseLeave(
  Sender: TObject);
begin
  TShadowLabel(Sender).Color:= clrDarkRed;
end;

procedure TFormNightMode.NightModeGamesSelectionBarPreviewButtonCloseClick(
  Sender: TObject);
begin
  NightModeGamesSelectionBarPreview.Visible:= False;
end;

procedure TFormNightMode.GameSelectionButtonPreviewClick(Sender: TObject);
begin
  NightModeGamesSelectionBarPreview.Visible:= True;
  NightModeGamesListView.SetFocus;
end;

procedure TFormNightMode.NightModePanelColorsBoxPreviewButtonCloseClick(Sender: TObject);
begin
  NightModePanelColorsBoxPreview.Visible:= False;
end;

procedure TFormNightMode.BitBtnEx1Click(Sender: TObject);
begin
  NightModePanelColorsBoxPreview.Visible:= True;
end;

procedure TFormNightMode.NightModeImagesHintBoxPreviewButtonCloseClick(
  Sender: TObject);
begin
  NightModeImagesHintBoxPreview.Visible:= False;
end;

procedure TFormNightMode.BitBtnEx2Click(Sender: TObject);
begin
  NightModeImagesHintBoxPreview.Visible:= True;
end;

end.

