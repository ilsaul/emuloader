unit uPreferences;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  ExtCtrls, StdCtrls, ComCtrls, Menus, IniFiles,
  Buttons, BarMenus, GraphicEx,  MPCommonObjects, EasyListview,
  SplitterEx, AdvOfficeButtons, AdvGroupBox, ShadowLabel, PanelEx, ShellAPI,
  GR32_RangeBars, EditEx, ButtonsEx;

type
  TFormPreferences = class(TForm)
    PageOptions: TNotebook;
    DisableMinimize: TAdvOfficeCheckBox;
    ButtonCustomizeGameFonts: TBitBtn;
    GroupBoxImageSplitters: TAdvGroupBox;
    LabelAppearanceGameDocuments: TLabel;
    GameDocumentsBackgroundColor: TColorBox;
    ButtonGameDocumentsFont: TBitBtn;
    ButtonGameDocumentsDefault: TBitBtn;
    ImageSplitterShowGripIcon: TAdvOfficeCheckBox;
    ShadowLabel1: TShadowLabel;
    PanelTabButtons: TPanelEx;
    ButtonPageGeneral: TSpeedButton;
    ButtonPageGamesList: TSpeedButton;
    ButtonPageImages: TSpeedButton;
    ButtonPageGameDocuments: TSpeedButton;
    ColumnsSettingsGroupBox: TAdvGroupBox;
    DisableCloneIndent: TAdvOfficeCheckBox;
    DisableDriverStatusIcons: TAdvOfficeCheckBox;
    DriverStatusShowFirstLetterOnly: TAdvOfficeCheckBox;
    HideDriverStatusTexts: TAdvOfficeCheckBox;
    ShortDriverColumnTitles: TAdvOfficeCheckBox;
    GamesBackgroundGroupBox: TAdvGroupBox;
    GamesBackgroundColor: TColorBox;
    ButtonDefaultBkSortedColor: TBitBtn;
    GamesBackgroundImageEnable: TAdvOfficeCheckBox;
    GamesBackgroundImage: TEditEx;
    GamesBackgroundImageButtonSelect: TBitBtn;
    GamesBackgroundImageButtonUpdate: TBitBtn;
    GamesTileBackground: TAdvOfficeCheckBox;
    LastPlayedHideSeconds: TAdvOfficeCheckBox;
    TotalPlayTimeHideSeconds: TAdvOfficeCheckBox;
    DisableNaturalSorting: TAdvOfficeCheckBox;
    LabelDisableNaturalSorting: TLabel;
    LabelGoToMAMEInfo: TShadowLabel;
    LabelGoToMARP: TShadowLabel;
    LabelGoToMAMEScore: TShadowLabel;
    LabelGoToMAMEHistory: TShadowLabel;
    GameMultilineCaptions: TAdvOfficeCheckBox;
    LabelGameMultilineCaptions: TLabel;
    LabelImageSplitterSingleColor: TLabel;
    ImageSplitterSingleColor: TColorBox;
    ImageSplitterSingleColorHot: TColorBox;
    LabelImageSplitterSingleColorHot: TLabel;
    ButtonImageSplitterStyleDefault: TBitBtn;
    HideDOSBoxFrame: TAdvGroupBox;
    HideDOSBoxEmuVersionCreateGames: TAdvOfficeCheckBox;
    HideDOSBoxRunGame: TAdvOfficeCheckBox;
    ShadowLabel2: TShadowLabel;
    LabelGoToMESSInfo: TShadowLabel;
    LabelImageBorderColor: TLabel;
    ImageBorderColor: TColorBox;
    ButtonImageBorderColorDefault: TBitBtn;
    LabelGoToGameInit: TShadowLabel;
    AllowOnlyOneInstance: TAdvOfficeCheckBox;
    GamesListStatusBarBox: TAdvGroupBox;
    LabelGamesListStatusBarBottomColor: TLabel;
    LabelGamesListStatusBarTopColor: TLabel;
    LabelGamesListStatusBarFontColor: TLabel;
    GamesListStatusBarGradientBar: TAdvOfficeCheckBox;
    GamesListStatusBarBottomColor: TColorBox;
    GamesListStatusBarButtonDefault: TBitBtn;
    GamesListStatusBarTopColor: TColorBox;
    GamesListStatusBarFontColor: TColorBox;
    GamesListStatusBarInnerFrameColor: TColorBox;
    DisableDeleteSelectedGames: TAdvOfficeCheckBox;
    LabelDisableDeleteSelectedGames: TLabel;
    IgnoreExitCode1InvalidFunction: TAdvOfficeCheckBox;
    RestoreInternetGameInfoStartup: TAdvOfficeCheckBox;
    LabelIgnoreExitCode1InvalidFunction: TLabel;
    HintBoxSettings: TAdvGroupBox;
    LabelHintBox_Color: TLabel;
    HintBox_Color: TColorBox;
    HintBox_FrameColor: TColorBox;
    HintBox_FrameEnabled: TAdvOfficeCheckBox;
    LabelHintBox_Opacity: TLabel;
    HintBox_Opacity: TGaugeBar;
    ButtonDefaultHintBox_Opacity: TBitBtn;
    LabelHintBox_TextColor: TLabel;
    HintBox_TextShadowColor: TColorBox;
    HintBox_TextColor: TColorBox;
    ButtonHintBoxDefaultColors: TBitBtn;
    ButtonHintTextDefaultColors: TBitBtn;
    HintBox_TextShadowEnabled: TAdvOfficeCheckBox;
    HintBox_IconEnabled: TAdvOfficeCheckBox;
    ButtonPageNightMode: TSpeedButton;
    NightModeToolBarBackgroundColorsBox: TAdvGroupBox;
    NightModeToolBarBkTopColor: TColorBox;
    LabelNightModeToolBarBkTopColor: TShadowLabel;
    NightModeToolBarInnerFrameColor: TColorBox;
    NightModeToolBarBkColorsDefaultButton: TBitBtn;
    GroupBoxGamesListSplitters: TAdvGroupBox;
    LabelGamesListSplitterSingleColorDefault: TShadowLabel;
    LabelGamesListSplitterSingleColor: TLabel;
    LabelGamesListSplitterSingleColorHot: TLabel;
    GamesListSplitterStyleSelector: TComboBox;
    ButtonGamesListSplitterStyleDefault: TBitBtn;
    GamesListSplitterShowGripIcon: TAdvOfficeCheckBox;
    GamesListSplitterSingleColor: TColorBox;
    GamesListSplitterSingleColorHot: TColorBox;
    ButtonGamesListSplitterSingleColorDefault: TBitBtn;
    GroupBoxGameDocsSplitter: TAdvGroupBox;
    LabelGameDocsSplitterSingleColorDefault: TShadowLabel;
    LabelGameDocsSplitterSingleColor: TLabel;
    LabelGameDocsSplitterSingleColorHot: TLabel;
    GameDocsSplitterStyleSelector: TComboBox;
    ButtonGameDocsSplitterStyleDefault: TBitBtn;
    GameDocsSplitterShowGripIcon: TAdvOfficeCheckBox;
    GameDocsSplitterSingleColor: TColorBox;
    GameDocsSplitterSingleColorHot: TColorBox;
    ButtonGameDocsSplitterSingleColorDefault: TBitBtn;
    GroupBoxInternetGameInfo: TAdvGroupBox;
    LabelInternetGameInfoLink: TLabel;
    LabelInternetMAMESoftwareListGameInfoLink: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    InternetGameInfoLink: TEditEx;
    InternetGameInfoProgettoEMMALinkButtonDefault: TBitBtn;
    InternetMAMESoftwareListGameInfoLink: TEditEx;
    InternetMAMESoftwareListGameInfoProgettoEMMALinkButtonDefault: TBitBtn;
    LabelImageSplitterSingleColorDefault: TShadowLabel;
    ButtonImageSplitterSingleColorDefault: TBitBtn;
    ImageSplitterStyleSelector: TComboBox;
    MAMu_Icon: TImage;
    LabelMAMu_IconsFolder: TLabel;
    MAMu_IconsFolder: TEditEx;
    ButtonMAMu_IconsFolderSelect: TBitBtn;
    ImagesSpecialSettingsGroupBox: TAdvGroupBox;
    LabelFixRetroArchImageFileNames: TLabel;
    LabelImageDisableThreadedLoading: TLabel;
    FixRetroArchImageFileNames: TAdvOfficeCheckBox;
    ImageDisableThreadedLoading: TAdvOfficeCheckBox;
    GameDocsDisplayOrderBox: TAdvGroupBox;
    GameDocs: TEasyListview;
    ButtonUp: TBitBtn;
    ButtonDown: TBitBtn;
    ButtonResetAutoGameInfoOrder: TBitBtn;
    GameDocsDisplayModeBox: TAdvGroupBox;
    LabelGameDocsDisplayModeSinglePanel: TShadowLabel;
    LabelGameDocsDisplayModeTabs: TShadowLabel;
    GameDocsDisplayModeTabs: TAdvOfficeRadioButton;
    GameDocsDisplayModeSinglePanel: TAdvOfficeRadioButton;
    NightModeToolBarGradientBar: TAdvOfficeCheckBox;
    NightModeToolBarBkBottomColor: TColorBox;
    LabelNightModeToolBarBkBottomColor: TShadowLabel;
    GamesListStatusBarOuterFrameColor: TColorBox;
    NightModeSearchGamesPanelColorsBox: TAdvGroupBox;
    LabelNightModeSearchGamesPanelFilterFontColor: TLabel;
    LabelNightModeSearchGamesPanelFilterShadowColor: TLabel;
    LabelNightModeSearchGamesPanelFieldFontColor: TLabel;
    LabelNightModeSearchGamesPanelFieldShadowColor: TLabel;
    NightModeSearchGamesPanelColorsDefaultButton: TBitBtn;
    NightModeSearchGamesPanelFilterFontColor: TColorBox;
    NightModeSearchGamesPanelFilterShadowColor: TColorBox;
    NightModeSearchGamesPanelFieldFontColor: TColorBox;
    NightModeSearchGamesPanelFieldShadowColor: TColorBox;
    GamesListStatusBarShadowFontColor: TColorBox;
    GamesListStatusBarShadowFontEnabled: TAdvOfficeCheckBox;
    NightModeGamesListStatusBarColorsBox: TAdvGroupBox;
    LabelNightModeGamesListStatusBarBottomColor: TLabel;
    LabelNightModeGamesListStatusBarTopColor: TLabel;
    LabelNightModeGamesListStatusBarFontColor: TLabel;
    NightModeGamesListStatusBarGradientBar: TAdvOfficeCheckBox;
    NightModeGamesListStatusBarBottomColor: TColorBox;
    NightModeGamesListStatusBarButtonDefault: TBitBtn;
    NightModeGamesListStatusBarTopColor: TColorBox;
    NightModeGamesListStatusBarFontColor: TColorBox;
    NightModeGamesListStatusBarInnerFrameColor: TColorBox;
    NightModeGamesListStatusBarOuterFrameColor: TColorBox;
    NightModeGamesListStatusBarShadowFontColor: TColorBox;
    NightModeGamesListStatusBarShadowFontEnabled: TAdvOfficeCheckBox;
    NightModeToolBarOuterFrameColor: TColorBox;
    NightModeGamesListFrameColorsBox: TAdvGroupBox;
    NightModeGamesListOuterFrameColor: TColorBox;
    NightModeGamesListInnerFrameColor: TColorBox;
    NightModeGamesListFrameColorsDefaultButton: TBitBtn;
    NightModeGamesListUseWindowsThemedBorder: TAdvOfficeCheckBox;
    NightModeGamesListStatusBarCopyButton: TBitBtn;
    Label3: TLabel;
    NightModeSearchGamesPanelCaptionBarFontColor: TColorBox;
    Label4: TLabel;
    NightModeSearchGamesPanelCaptionBarShadowColor: TColorBox;
    Label13: TLabel;
    ColorBox6: TColorBox;
    NightModeImagesPanelFrameColorsBox: TAdvGroupBox;
    NightModeImagesPanelOuterFrameColor: TColorBox;
    NightModeImagesPanelInnerFrameColor: TColorBox;
    NightModeImagesPanelFrameColorsDefaultButton: TBitBtn;
    LabelNightModeSearchGamesFloatingPanel: TShadowLabel;
    GameDocsBorderColor: TColorBox;
    ButtonGameDocsBorderColorDefault: TBitBtn;
    GamesListStatusBarShowInnerFrame: TAdvOfficeCheckBox;
    GamesListStatusBarShowOuterFrame: TAdvOfficeCheckBox;
    NightModeGamesListStatusBarShowOuterFrame: TAdvOfficeCheckBox;
    NightModeGamesListStatusBarShowInnerFrame: TAdvOfficeCheckBox;
    NightModeToolBarShowInnerFrame: TAdvOfficeCheckBox;
    NightModeToolBarShowOuterFrame: TAdvOfficeCheckBox;
    NightModeImagesPanelShowInnerFrame: TAdvOfficeCheckBox;
    NightModeImagesPanelShowOuterFrame: TAdvOfficeCheckBox;
    NightModeGamesListShowInnerFrame: TAdvOfficeCheckBox;
    NightModeGamesListShowOuterFrame: TAdvOfficeCheckBox;
    GameDocsShowBorder: TAdvOfficeCheckBox;
    LabelNightModeSearchGamesPanelEditBoxFontColor: TLabel;
    NightModeSearchGamesPanelEditBoxFontColor: TColorBox;
    LabelNightModeSearchGamesPanelEditBoxBackgroundColor: TLabel;
    NightModeSearchGamesPanelEditBoxBackgroundColor: TColorBox;
    NightModePanelColorsBox: TAdvGroupBox;
    NightModeSearchGamesPanelGradientBar: TAdvOfficeCheckBox;
    LabelNightModeSearchGamesPanelTopColor: TLabel;
    NightModeSearchGamesPanelTopColor: TColorBox;
    LabelNightModeSearchGamesPanelBottomColor: TLabel;
    NightModeSearchGamesPanelBottomColor: TColorBox;
    LabelNightModeSearchGamesPanelInnerFrameColor: TLabel;
    NightModeSearchGamesPanelInnerFrameColor: TColorBox;
    LabelNightModeSearchGamesPanelOuterFrameColor: TLabel;
    NightModeSearchGamesPanelOuterFrameColor: TColorBox;
    NightModePanelsBackgroundColorsDefaultButton: TBitBtn;
    LabelNightModePanelColorsTitleFontColor: TLabel;
    LabelNightModePanelColorsTitleShadowFontColor: TLabel;
    NightModePanelColorsTitleShadowFontColor: TColorBox;
    NightModePanelColorsTitleFontColor: TColorBox;
    LabelNightModePanelColorsMessageFontColor: TLabel;
    LabelNightModePanelColorsMessageShadowFontColor: TLabel;
    NightModePanelColorsMessageShadowFontColor: TColorBox;
    NightModePanelColorsMessageFontColor: TColorBox;
    LabelNightModePanelColorsTitle2FontColor: TLabel;
    LabelNightModePanelColorsTitle2ShadowFontColor: TLabel;
    NightModePanelColorsTitle2ShadowFontColor: TColorBox;
    NightModePanelColorsTitle2FontColor: TColorBox;
    GroupBoxGamesListSelectionBar: TAdvGroupBox;
    Label2: TLabel;
    GamesSelectionTopColor: TColorBox;
    GameSelectionButtonDefault: TBitBtn;
    Label10: TLabel;
    GamesSelectionFontColor: TColorBox;
    GamesSelectionFrameColor: TColorBox;
    Label14: TLabel;
    GamesSelectionMissROMsTopColor: TColorBox;
    Label15: TLabel;
    GamesSelectionMissROMsFontColor: TColorBox;
    GamesSelectionMissROMsFrameColor: TColorBox;
    ShadowLabel4: TShadowLabel;
    Label17: TLabel;
    Label18: TLabel;
    ShadowLabel5: TShadowLabel;
    GamesSelectionInactiveTopColor: TColorBox;
    GamesSelectionInactiveFontColor: TColorBox;
    GamesSelectionInactiveFrameColor: TColorBox;
    GameSelectionAlphaBlend: TAdvOfficeCheckBox;
    Label23: TLabel;
    GamesSelectionBottomColor: TColorBox;
    GameSelectionGradientBar: TAdvOfficeCheckBox;
    GamesSelectionMissROMsBottomColor: TColorBox;
    Label24: TLabel;
    Label26: TLabel;
    GamesSelectionInactiveBottomColor: TColorBox;
    NightModeGamesSelectionBarColorsBox: TAdvGroupBox;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    ShadowLabel3: TShadowLabel;
    Label33: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    ShadowLabel7: TShadowLabel;
    Label39: TLabel;
    Label40: TLabel;
    Label42: TLabel;
    NightModeGamesSelectionTopColor: TColorBox;
    NightModeGameSelectionButtonDefault: TBitBtn;
    NightModeGamesSelectionFontColor: TColorBox;
    NightModeGamesSelectionFrameColor: TColorBox;
    NightModeGamesSelectionMissROMsTopColor: TColorBox;
    NightModeGamesSelectionMissROMsFontColor: TColorBox;
    NightModeGamesSelectionMissROMsFrameColor: TColorBox;
    NightModeGamesSelectionInactiveTopColor: TColorBox;
    NightModeGamesSelectionInactiveFontColor: TColorBox;
    NightModeGamesSelectionInactiveFrameColor: TColorBox;
    NightModeGameSelectionAlphaBlend: TAdvOfficeCheckBox;
    NightModeGamesSelectionBottomColor: TColorBox;
    NightModeGameSelectionGradientBar: TAdvOfficeCheckBox;
    NightModeGamesSelectionMissROMsBottomColor: TColorBox;
    NightModeGamesSelectionInactiveBottomColor: TColorBox;
    GameSelectionButtonCopy: TBitBtn;
    Label11: TLabel;
    Label16: TLabel;
    Label19: TLabel;
    AddLeadingZeroVersionInfoMAME: TAdvOfficeCheckBox;
    LabelAddLeadingZeroVersionInfoMAME: TLabel;
    InternetGameInfoArcadeItaliaLinkButtonDefault: TBitBtn;
    InternetMAMESoftwareListGameInfoArcadeItaliaLinkButtonDefault: TBitBtn;
    LabelMAMEGameManualsPDFFolder: TShadowLabel;
    MAMEGameManualsPDFFolder: TEditEx;
    ShadowLabel6: TShadowLabel;
    MAMEGameManualsPDFFolderButtonSelect: TBitBtn;
    MAMEGameManualsPDFFolderButtonDefault: TBitBtn;
    LabelMARP_scores3htm: TShadowLabel;
    LabelLinkMARP_scores3htm: TShadowLabel;
    LabelNightModeSearchGamesPanelEditBoxCustomFrameColor: TLabel;
    NightModeSearchGamesPanelEditBoxCustomFrameColor: TColorBox;
    NightModeSearchGamesPanelEditBoxUseCustomFrame: TAdvOfficeCheckBox;
    NightModeSearchGamesPanelEditBoxCustomFocusedFrameColor: TColorBox;
    LabelNightModeSearchGamesPanelEditBoxCustomFocusedFrameColor: TLabel;
    UseItalicFontStyleSystemTitleBar: TAdvOfficeCheckBox;
    LabelUseItalicFontStyleSystemTitleBar: TLabel;
    LabelToolBarOverlayIconsFolder: TShadowLabel;
    ToolBarOverlayIconsFolder: TComboBox;
    ToolBarOverlayIconsFolderButtonUpdate: TBitBtn;
    ButtonPageNightMode2: TSpeedButton;
    NightModeButtonColorsBox: TAdvGroupBox;
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
    NightModeButtonColorFontColor: TColorBox;
    NightModeButtonColorGradientTop: TColorBox;
    NightModeButtonColorGradientBottom: TColorBox;
    NightModeButtonColorGradientTopHover: TColorBox;
    NightModeButtonColorGradientBottomHover: TColorBox;
    NightModeButtonColorGradientBottomDisabled: TColorBox;
    NightModeButtonColorGradientTopDisabled: TColorBox;
    NightModeButtonColorFrameColor: TColorBox;
    NightModeButtonColorFrameColorHover: TColorBox;
    NightModeButtonColorFrameColorDisabled: TColorBox;
    NightModeButtonColorFrameColorFocused: TColorBox;
    NightModeButtonColorFontColorDisabled: TColorBox;
    NightModeButtonColorFontShadowColorDisabled: TColorBox;
    LabelNightModeButtonColorsViewNextBackground: TShadowLabel;
    NightModeButtonColorsSamplePanel: TPanelEx;
    NightModeButtonColorsSampleButton1: TBitBtnEx;
    NightModeButtonColorsSampleButton2: TBitBtnEx;
    NightModeButtonColorsSampleButton3: TBitBtnEx;
    NightModeButtonColorsViewNextBackground: TBitBtn;
    NightModeButtonColorsBoxDefaultButton: TBitBtn;
    NightModeButtonColorsSampleButton4: TSpeedButtonEx;
    ShadowLabel8: TShadowLabel;
    ShadowLabel9: TShadowLabel;
    ShadowLabel10: TShadowLabel;
    NightModeButtonColorGradientTopSelected: TColorBox;
    NightModeButtonColorGradientBottomSelected: TColorBox;
    NightModeButtonColorFrameColorSelected: TColorBox;
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
    procedure PopupMenuThemePreviewMeasureMenuItem(Sender: TObject;
      AMenuItem: TMenuItem; ACanvas: TCanvas; var Width, Height: Integer;
      ABarVisible: Boolean; var DefaultMeasure: Boolean);
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
    procedure NightModeToolBarBkColorsDefaultButtonClick(Sender: TObject);
    procedure NightModeToolBarBkTopColorSelect(Sender: TObject);
    procedure NightModeToolBarInnerFrameColorSelect(Sender: TObject);
    procedure ImageSplitterStyleSelectorSelect(Sender: TObject);
    procedure ButtonImageSplitterSingleColorDefaultClick(Sender: TObject);
    procedure GameDocsSplitterStyleSelectorSelect(Sender: TObject);
    procedure ButtonGameDocsSplitterStyleDefaultClick(Sender: TObject);
    procedure ButtonGameDocsSplitterSingleColorDefaultClick(
      Sender: TObject);
    procedure GameDocsSplitterShowGripIconClick(Sender: TObject);
    procedure GameDocsSplitterSingleColorSelect(Sender: TObject);
    procedure GameDocsSplitterSingleColorHotSelect(Sender: TObject);
    procedure NightModeToolBarBkBottomColorSelect(Sender: TObject);
    procedure NightModeToolBarGradientBarClick(Sender: TObject);
    procedure GamesListStatusBarOuterFrameColorSelect(Sender: TObject);
    procedure GamesListStatusBarShadowFontEnabledClick(Sender: TObject);
    procedure GamesListStatusBarShadowFontColorSelect(Sender: TObject);
    procedure NightModeSearchGamesPanelGradientBarClick(Sender: TObject);
    procedure NightModeSearchGamesPanelColorsDefaultButtonClick(
      Sender: TObject);
    procedure NightModeSearchGamesPanelTopColorSelect(
      Sender: TObject);
    procedure NightModeSearchGamesPanelBottomColorSelect(
      Sender: TObject);
    procedure NightModeSearchGamesPanelInnerFrameColorSelect(
      Sender: TObject);
    procedure NightModeSearchGamesPanelOuterFrameColorSelect(
      Sender: TObject);
    procedure NightModeSearchGamesPanelFilterFontColorSelect(
      Sender: TObject);
    procedure NightModeSearchGamesPanelFilterShadowColorSelect(
      Sender: TObject);
    procedure NightModeSearchGamesPanelFieldFontColorSelect(
      Sender: TObject);
    procedure NightModeSearchGamesPanelFieldShadowColorSelect(
      Sender: TObject);
    procedure NightModeToolBarOuterFrameColorSelect(Sender: TObject);
    procedure NightModeGamesListInnerFrameColorSelect(Sender: TObject);
    procedure NightModeGamesListOuterFrameColorSelect(Sender: TObject);
    procedure NightModeGamesListFrameColorsDefaultButtonClick(Sender: TObject);
    procedure NightModeGamesListStatusBarButtonDefaultClick(
      Sender: TObject);
    procedure NightModeGamesListStatusBarGradientBarClick(Sender: TObject);
    procedure NightModeGamesListStatusBarTopColorSelect(Sender: TObject);
    procedure NightModeGamesListStatusBarBottomColorSelect(
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
    procedure NightModeGamesListStatusBarCopyButtonClick(Sender: TObject);
    procedure NightModeSearchGamesPanelCaptionBarFontColorSelect(
      Sender: TObject);
    procedure NightModeSearchGamesPanelCaptionBarShadowColorSelect(
      Sender: TObject);
    procedure NightModeImagesPanelFrameColorsDefaultButtonClick(
      Sender: TObject);
    procedure NightModeImagesPanelInnerFrameColorSelect(Sender: TObject);
    procedure NightModeImagesPanelOuterFrameColorSelect(Sender: TObject);
    procedure GameDocsBorderColorSelect(Sender: TObject);
    procedure ButtonGameDocsBorderColorDefaultClick(Sender: TObject);
    procedure NightModeGamesListStatusBarShowOuterFrameClick(Sender: TObject);
    procedure NightModeToolBarShowOuterFrameClick(Sender: TObject);
    procedure GameDocsShowBorderClick(Sender: TObject);
    procedure NightModeImagesPanelShowOuterFrameClick(Sender: TObject);
    procedure NightModeGamesListUseWindowsThemedBorderClick(
      Sender: TObject);
    procedure NightModeGamesListShowOuterFrameClick(Sender: TObject);
    procedure GamesListStatusBarShowOuterFrameClick(Sender: TObject);
    procedure NightModeSearchGamesPanelEditBoxFontColorSelect(
      Sender: TObject);
    procedure NightModeSearchGamesPanelEditBoxBackgroundColorSelect(
      Sender: TObject);
    procedure OverlayIconsAlternateFolder_SelectPanelCloseMouseEnter(
      Sender: TObject);
    procedure OverlayIconsAlternateFolder_SelectPanelCloseMouseLeave(
      Sender: TObject);
    procedure ToolBarOverlayIconsFolderButtonUpdateClick(Sender: TObject);
    procedure ToolBarOverlayIconsFolderSelect(Sender: TObject);
    procedure NightModePanelsBackgroundColorsDefaultButtonClick(Sender: TObject);
    procedure NightModePanelColorsTitleFontColorSelect(Sender: TObject);
    procedure NightModePanelColorsTitleShadowFontColorSelect(
      Sender: TObject);
    procedure NightModePanelColorsTitle2FontColorSelect(Sender: TObject);
    procedure NightModePanelColorsTitle2ShadowFontColorSelect(
      Sender: TObject);
    procedure NightModePanelColorsMessageFontColorSelect(Sender: TObject);
    procedure NightModePanelColorsMessageShadowFontColorSelect(
      Sender: TObject);
    procedure GameSelectionGradientBarClick(Sender: TObject);
    procedure GameSelectionButtonDefaultClick(Sender: TObject);
    procedure NightModeGameSelectionGradientBarClick(Sender: TObject);
    procedure NightModeGameSelectionAlphaBlendClick(Sender: TObject);
    procedure NightModeGameSelectionButtonDefaultClick(Sender: TObject);
    procedure GameSelectionButtonCopyClick(Sender: TObject);
    procedure InternetGameInfoArcadeItaliaLinkButtonDefaultClick(Sender: TObject);
    procedure InternetMAMESoftwareListGameInfoArcadeItaliaLinkButtonDefaultClick(Sender: TObject);
    procedure MAMEGameManualsPDFFolderButtonDefaultClick(Sender: TObject);
    procedure MAMEGameManualsPDFFolderButtonSelectClick(Sender: TObject);
    procedure NightModeSearchGamesPanelEditBoxCustomFrameColorSelect(
      Sender: TObject);
    procedure NightModeSearchGamesPanelEditBoxCustomFocusedFrameColorSelect(
      Sender: TObject);
    procedure NightModeSearchGamesPanelEditBoxUseCustomFrameClick(
      Sender: TObject);
    procedure NightModeButtonColorsViewNextBackgroundClick(
      Sender: TObject);
    procedure NightModeButtonColorFontColorSelect(Sender: TObject);
    procedure NightModeButtonColorGradientTopSelect(Sender: TObject);
    procedure NightModeButtonColorGradientBottomSelect(Sender: TObject);
    procedure NightModeButtonColorFrameColorSelect(Sender: TObject);
    procedure NightModeButtonColorFrameColorFocusedSelect(Sender: TObject);
    procedure NightModeButtonColorGradientTopHoverSelect(Sender: TObject);
    procedure NightModeButtonColorGradientBottomHoverSelect(Sender: TObject);
    procedure NightModeButtonColorFrameColorHoverSelect(Sender: TObject);
    procedure NightModeButtonColorFontColorDisabledSelect(Sender: TObject);
    procedure NightModeButtonColorFontShadowColorDisabledSelect(Sender: TObject);
    procedure NightModeButtonColorGradientTopDisabledSelect(Sender: TObject);
    procedure NightModeButtonColorGradientBottomDisabledSelect(Sender: TObject);
    procedure NightModeButtonColorFrameColorDisabledSelect(Sender: TObject);
    procedure NightModeButtonColorsBoxDefaultButtonClick(Sender: TObject);
    procedure NightModeButtonColorGradientTopSelectedSelect(
      Sender: TObject);
    procedure NightModeButtonColorGradientBottomSelectedSelect(
      Sender: TObject);
    procedure NightModeButtonColorFrameColorSelectedSelect(
      Sender: TObject);
  private
    { Private declarations }
    procedure NightModeRepaintToolBar;
  public
    { Public declarations }
    procedure PopulateIconOverlayFoldersList;
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

procedure TFormPreferences.PopulateIconOverlayFoldersList;
var
  iFoldersList: THashedStringList;
  iIndex: Integer;
  CurrentFolder: String;
begin
  ToolBarOverlayIconsFolder.Tag:= 1;
  CurrentFolder:= FormMain.ToolBarOverlayIconFolderStr;
  if CurrentFolder = '' then
     CurrentFolder:= 'Default';
  ToolBarOverlayIconsFolder.Clear;
  ToolBarOverlayIconsFolder.Items.BeginUpdate;
  ToolBarOverlayIconsFolder.Items.Add('Default');

  iFoldersList:= THashedStringList.Create;
  GetFoldersList2(FormMain.GetFolderFull(32)+'overlay\', iFoldersList, True, False);
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
  FormMain.GamesListView.Color:= GamesBackgroundColor.Selected;
  FormMain.MachinesListSidePanel.Color:= FormMain.GamesListView.Color;
  FormMain.Font_TilesViewDetailsText.Color:= GetContrastColor(GamesBackgroundColor.Selected);
end;

procedure TFormPreferences.ButtonGameDocumentsFontClick(
  Sender: TObject);
begin
  FormMain.FontDialog.Font:= FormMain.MAMEInfoTextHolder.Font;
  FormMain.FontDialog.Tag:= 6;
  if FormMain.FontDialog.Execute then
     FormMain.MAMEInfoTextHolder.Font:= FormMain.FontDialog.Font;
end;

procedure TFormPreferences.GameDocumentsBackgroundColorSelect(
  Sender: TObject);
begin
  FormMain.MAMEInfoTextHolder.Color:= GameDocumentsBackgroundColor.Selected;
end;

procedure TFormPreferences.ButtonGameDocumentsDefaultClick(Sender: TObject);
begin
  FormMain.MAMEInfoTextHolder.Font.Color:= clBlack;
  FormMain.MAMEInfoTextHolder.Font.Name:= 'Consolas';
  FormMain.MAMEInfoTextHolder.Font.Size:= 9;
  FormMain.MAMEInfoTextHolder.Font.Style:= [];
  FormMain.SetSelectedColorBox(GameDocumentsBackgroundColor, GameDocumentsBackgroundColor.DefaultColorColor);
end;

procedure TFormPreferences.GamesBackgroundImageButtonSelectClick(
  Sender: TObject);
begin
  FormMain.DialogOpenFile(5, GamesBackgroundImageEnable.Caption, GamesBackgroundImage, False);
  GamesBackgroundImageButtonUpdate.Click;
end;

procedure TFormPreferences.GamesBackgroundImageButtonUpdateClick(
  Sender: TObject);
var
  ListViewBk: TPNGGraphic;
  FileFullPath: String;
begin
  case GamesBackgroundImageEnable.Checked of
    True:
      begin
        FileFullPath:= FormMain.FullFolderFix(GamesBackgroundImage.Text, '', True);
        if (not FileExists(FileFullPath)) or (FileFullPath = '') then
           begin
             if not FormMain.IsStartup then
                begin
                  if FormMain.GamesListView.BackGround.Image <> nil then
                     FormMain.GamesListView.BackGround.Image:= nil;

                  if FormMain.MachinesListSidePanel.BackGround.Image <> nil then
                     FormMain.MachinesListSidePanel.BackGround.Image:= nil;
                  FormMain.BlinkBkEdit(GamesBackgroundImage);
                end;
             Exit;
           end;

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
    False:
      begin
        FormMain.GamesListView.Background.Image:= nil;
        FormMain.MachinesListSidePanel.BackGround.Image:= nil;
      end;
  end;
end;

procedure TFormPreferences.GamesTileBackgroundClick(Sender: TObject);
begin
  FormMain.GamesListView.BackGround.Tile:= GamesTileBackground.Checked;
  FormMain.MachinesListSidePanel.BackGround.Tile:= GamesTileBackground.Checked;
end;

procedure TFormPreferences.FormCreate(Sender: TObject);
begin
  PageOptions.PageIndex:= 0;
  FormMain.LoadMessageIcon(MAMu_Icon, 'mamu_.ico', True);

  FormMain.ELV_ResetNormalColors(GameDocs);

  PopulateIconOverlayFoldersList;
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
  FormMain.Font_TilesViewDetailsText.Color:= GetContrastColor(GamesBackgroundColor.Selected);
end;

procedure TFormPreferences.PopupMenuThemePreviewMeasureMenuItem(
  Sender: TObject; AMenuItem: TMenuItem; ACanvas: TCanvas; var Width,
  Height: Integer; ABarVisible: Boolean; var DefaultMeasure: Boolean);
begin
  if (GetMenuBarMenusIntf(TMenu(Sender)).UseMenuStyle = msWindowsXP) then
     Height:= Height+2;
  if AMenuItem.ShortCut <> scNone then
     Width:= Width+ACanvas.TextWidth(ShortCutToText(AMenuItem.ShortCut))+10;
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
  FormMain.SetGripIcon(FormMain.Splitter, GamesListSplitterShowGripIcon.Checked);
end;

procedure TFormPreferences.ButtonPageGeneralClick(Sender: TObject);
begin
  PageOptions.PageIndex:= TSpeedButton(Sender).Tag;
  ButtonPageGeneral.Font.Style:= [];
  ButtonPageGamesList.Font.Style:= [];
  ButtonPageImages.Font.Style:= [];
  ButtonPageGameDocuments.Font.Style:= [];
  ButtonPageNightMode.Font.Style:= [];
  ButtonPageNightMode2.Font.Style:= [];
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
  FormMain.GamesListView.BackGround.Enabled:= GamesBackgroundImageEnable.Checked;
  FormMain.MachinesListSidePanel.BackGround.Enabled:= GamesBackgroundImageEnable.Checked;
  GamesBackgroundImageButtonUpdate.Click;
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

  if (TAdvOfficeRadioButton(Sender).Tag = GameDocsDisplayModeBox.Tag) and (not FormMain.IsStartup) then
     Exit;

  FormMain.ButtonImagePanelToggle.Visible:= not GameDocsDisplayModeSinglePanel.Checked;
  FormMain.ButtonDocsPanelToggle.Visible:= not GameDocsDisplayModeSinglePanel.Checked;

  if FormMain.IsStartup then
     Exit;

  GameDocsDisplayModeBox.Tag:= TAdvOfficeRadioButton(Sender).Tag;

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

procedure TFormPreferences.NightModeRepaintToolBar;
begin
  if (not FormMain.IsStartup) and IsNightMode then
     begin
       FormMain.ImagesToolbarButtons.Invalidate;
       FormMain.ToolBarButtons.Invalidate; // games filters tool bar
       FormMain.ToolBarFilterTitle_ToolBar.Invalidate;
     end;
end;

procedure TFormPreferences.NightModeToolBarBkColorsDefaultButtonClick(Sender: TObject);
begin
  SetDefaultColorBox(NightModeToolBarBkTopColor);
  SetDefaultColorBox(NightModeToolBarBkBottomColor);
  SetDefaultColorBox(NightModeToolBarInnerFrameColor);
  SetDefaultColorBox(NightModeToolBarOuterFrameColor);
end;

procedure TFormPreferences.NightModeToolBarBkTopColorSelect(
  Sender: TObject);
begin
  FormMain.PanelSearchGames_ToolBar.Color1:= NightModeToolBarBkTopColor.Selected;
  NightModeRepaintToolBar;
end;

procedure TFormPreferences.NightModeToolBarInnerFrameColorSelect(
  Sender: TObject);
begin
  FormMain.PanelToolBar.ColorInnerFrame:= NightModeToolBarInnerFrameColor.Selected;
  FormMain.PanelToolBarImages.ColorInnerFrame:= NightModeToolBarInnerFrameColor.Selected;
  //NightModeRepaintToolBar;
end;

procedure TFormPreferences.NightModeToolBarOuterFrameColorSelect(
  Sender: TObject);
begin
  FormMain.PanelToolBar.ColorFrame:= NightModeToolBarOuterFrameColor.Selected;
  FormMain.PanelToolBarImages.ColorFrame:= NightModeToolBarOuterFrameColor.Selected;
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

procedure TFormPreferences.NightModeToolBarBkBottomColorSelect(Sender: TObject);
begin
  FormMain.PanelSearchGames_ToolBar.Color2:= NightModeToolBarBkBottomColor.Selected;
  NightModeRepaintToolBar;
end;

procedure TFormPreferences.NightModeToolBarGradientBarClick(
  Sender: TObject);
begin
  if IsNightMode then
     begin
       FormMain.SetPanelExStyle(FormMain.PanelSearchGames_ToolBar, NightModeToolBarGradientBar.Checked);
       NightModeRepaintToolBar;
     end;
     //begin
     //  if NightModeToolBarGradientBar.Checked then
     //     FormMain.PanelSearchGames_ToolBar.Style:= vgSimple
     //  else
     //     FormMain.PanelSearchGames_ToolBar.Style:= vgSolid;
     //end;
end;

procedure TFormPreferences.NightModeSearchGamesPanelGradientBarClick(Sender: TObject);
begin
  if IsNightMode then
     begin
       FormMain.SetPanelExStyle(FormMain.PanelSearchGames, NightModeSearchGamesPanelGradientBar.Checked);
       FormMain.SetPanelExStyle(FormMain.PanelFilterCPU, NightModeSearchGamesPanelGradientBar.Checked);
     end;
end;

procedure TFormPreferences.NightModeSearchGamesPanelColorsDefaultButtonClick(
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

procedure TFormPreferences.NightModePanelsBackgroundColorsDefaultButtonClick(Sender: TObject);
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

procedure TFormPreferences.NightModeSearchGamesPanelTopColorSelect(
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
end;

procedure TFormPreferences.NightModeSearchGamesPanelBottomColorSelect(
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
end;

procedure TFormPreferences.NightModeSearchGamesPanelInnerFrameColorSelect(
  Sender: TObject);
begin
  if IsNightMode then
     begin
       FormMain.PanelSearchGames.ColorInnerFrame:= NightModeSearchGamesPanelInnerFrameColor.Selected;
       FormMain.PanelFilterCPU.ColorInnerFrame:= NightModeSearchGamesPanelInnerFrameColor.Selected;

       FormMain.PanelInitZipFile.ColorInnerFrame:= NightModeSearchGamesPanelInnerFrameColor.Selected;
     end;
end;

procedure TFormPreferences.NightModeSearchGamesPanelOuterFrameColorSelect(
  Sender: TObject);
begin
  if IsNightMode then
     begin
       FormMain.PanelSearchGames.ColorFrame:= NightModeSearchGamesPanelOuterFrameColor.Selected;
       FormMain.PanelFilterCPU.ColorFrame:= NightModeSearchGamesPanelOuterFrameColor.Selected;

       FormMain.PanelInitZipFile.ColorFrame:= NightModeSearchGamesPanelOuterFrameColor.Selected;
     end;
end;

procedure TFormPreferences.NightModeSearchGamesPanelFilterFontColorSelect(
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

procedure TFormPreferences.NightModeSearchGamesPanelFilterShadowColorSelect(
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

procedure TFormPreferences.NightModeSearchGamesPanelFieldFontColorSelect(
  Sender: TObject);
begin
  if IsNightMode then
     begin
       FormMain.LabelSearchGamesBy.Font.Color:= NightModeSearchGamesPanelFieldFontColor.Selected;
       FormMain.LabelSearchGamesBy_ToolBar.Font.Color:= NightModeSearchGamesPanelFieldFontColor.Selected;
     end;
end;

procedure TFormPreferences.NightModeSearchGamesPanelFieldShadowColorSelect(
  Sender: TObject);
begin
  if IsNightMode then
     begin
       FormMain.LabelSearchGamesBy.ShadowColor:= NightModeSearchGamesPanelFieldShadowColor.Selected;
       FormMain.LabelSearchGamesBy_ToolBar.ShadowColor:= NightModeSearchGamesPanelFieldShadowColor.Selected;
     end;
end;

procedure TFormPreferences.NightModeSearchGamesPanelCaptionBarFontColorSelect(
  Sender: TObject);
begin
  if IsNightMode then
     begin
       FormMain.PanelSearchGamesCaptionBar.Font.Color:= NightModeSearchGamesPanelCaptionBarFontColor.Selected;
       FormMain.FilterCPU_LabelCaptionBar.Font.Color:= NightModeSearchGamesPanelCaptionBarFontColor.Selected;
     end;
end;

procedure TFormPreferences.NightModeSearchGamesPanelCaptionBarShadowColorSelect(
  Sender: TObject);
begin
  if IsNightMode then
     begin
       FormMain.PanelSearchGamesCaptionBar.ShadowColor:= NightModeSearchGamesPanelCaptionBarShadowColor.Selected;
       FormMain.FilterCPU_LabelCaptionBar.ShadowColor:= NightModeSearchGamesPanelCaptionBarShadowColor.Selected;
     end;
end;

procedure TFormPreferences.NightModeGamesListInnerFrameColorSelect(
  Sender: TObject);
begin
  if IsNightMode then
     begin
       FormMain.PanelGamesList.ColorInnerFrame:= NightModeGamesListInnerFrameColor.Selected;
       FormMain.PanelMachinesList.ColorInnerFrame:= NightModeGamesListInnerFrameColor.Selected;
     end;
end;

procedure TFormPreferences.NightModeGamesListOuterFrameColorSelect(
  Sender: TObject);
begin
  if IsNightMode then
     begin
       FormMain.PanelGamesList.ColorFrame:= NightModeGamesListOuterFrameColor.Selected;
       FormMain.PanelMachinesList.ColorFrame:= NightModeGamesListOuterFrameColor.Selected;
     end;
end;

procedure TFormPreferences.NightModeGamesListFrameColorsDefaultButtonClick(Sender: TObject);
begin
  SetDefaultColorBox(NightModeGamesListInnerFrameColor);
  SetDefaultColorBox(NightModeGamesListOuterFrameColor);
end;

procedure TFormPreferences.NightModeGamesListStatusBarButtonDefaultClick(
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

procedure TFormPreferences.NightModeGamesListStatusBarGradientBarClick(
  Sender: TObject);
begin
  if IsNightMode then
     begin
       FormMain.SetPanelExStyle(FormMain.StatusBarPanel, NightModeGamesListStatusBarGradientBar.Checked);
       FormMain.SetPanelExStyle(FormMain.StatusBarPanelMachines, NightModeGamesListStatusBarGradientBar.Checked);
     end;
end;

procedure TFormPreferences.NightModeGamesListStatusBarTopColorSelect(
  Sender: TObject);
begin
  if IsNightMode then
     begin
       FormMain.StatusBarPanel.Color1:= NightModeGamesListStatusBarTopColor.Selected;
       FormMain.StatusBarPanelMachines.Color1:= NightModeGamesListStatusBarTopColor.Selected;
     end;
end;

procedure TFormPreferences.NightModeGamesListStatusBarBottomColorSelect(
  Sender: TObject);
begin
  if IsNightMode then
     begin
       FormMain.StatusBarPanel.Color2:= NightModeGamesListStatusBarBottomColor.Selected;
       FormMain.StatusBarPanelMachines.Color2:= NightModeGamesListStatusBarBottomColor.Selected;
     end;
end;

procedure TFormPreferences.NightModeGamesListStatusBarInnerFrameColorSelect(
  Sender: TObject);
begin
  if IsNightMode then
     begin
       FormMain.StatusBarPanel.ColorInnerFrame:= NightModeGamesListStatusBarInnerFrameColor.Selected;
       FormMain.StatusBarPanelMachines.ColorInnerFrame:= NightModeGamesListStatusBarInnerFrameColor.Selected;
     end;
end;

procedure TFormPreferences.NightModeGamesListStatusBarOuterFrameColorSelect(
  Sender: TObject);
begin
  if IsNightMode then
     begin
       FormMain.StatusBarPanel.ColorFrame:= NightModeGamesListStatusBarOuterFrameColor.Selected;
       FormMain.StatusBarPanelMachines.ColorFrame:= NightModeGamesListStatusBarOuterFrameColor.Selected;
     end;
end;

procedure TFormPreferences.NightModeGamesListStatusBarFontColorSelect(
  Sender: TObject);
begin
  if IsNightMode then
     begin
       FormMain.StatusBar_GamesTotal.Font.Color:= NightModeGamesListStatusBarFontColor.Selected;
       FormMain.StatusBar_GamesGameName.Font.Color:= NightModeGamesListStatusBarFontColor.Selected;
       FormMain.StatusBar_MachinesGameName.Font.Color:= NightModeGamesListStatusBarFontColor.Selected;
     end;
end;

procedure TFormPreferences.NightModeGamesListStatusBarShadowFontEnabledClick(
  Sender: TObject);
begin
  if IsNightMode then
     begin
       FormMain.StatusBar_GamesTotal.ShadowEnabled:= NightModeGamesListStatusBarShadowFontEnabled.Checked;
       FormMain.StatusBar_GamesGameName.ShadowEnabled:= NightModeGamesListStatusBarShadowFontEnabled.Checked;
       FormMain.StatusBar_MachinesGameName.ShadowEnabled:= NightModeGamesListStatusBarShadowFontEnabled.Checked;
     end;
end;

procedure TFormPreferences.NightModeGamesListStatusBarShadowFontColorSelect(
  Sender: TObject);
begin
  if IsNightMode then
     begin
       FormMain.StatusBar_GamesTotal.ShadowColor:= NightModeGamesListStatusBarShadowFontColor.Selected;
       FormMain.StatusBar_GamesGameName.ShadowColor:= NightModeGamesListStatusBarShadowFontColor.Selected;
       FormMain.StatusBar_MachinesGameName.ShadowColor:= NightModeGamesListStatusBarShadowFontColor.Selected;
     end;
end;

procedure TFormPreferences.NightModeGamesListStatusBarCopyButtonClick(Sender: TObject);
begin
  FormMain.SetSelectedColorBox(NightModeGamesListStatusBarTopColor, GamesListStatusBarTopColor.Selected);
  FormMain.SetSelectedColorBox(NightModeGamesListStatusBarBottomColor, GamesListStatusBarBottomColor.Selected);
  FormMain.SetSelectedColorBox(NightModeGamesListStatusBarInnerFrameColor, GamesListStatusBarInnerFrameColor.Selected);
  FormMain.SetSelectedColorBox(NightModeGamesListStatusBarOuterFrameColor, GamesListStatusBarOuterFrameColor.Selected);
  FormMain.SetSelectedColorBox(NightModeGamesListStatusBarFontColor, GamesListStatusBarFontColor.Selected);
  FormMain.SetSelectedColorBox(NightModeGamesListStatusBarShadowFontColor, GamesListStatusBarShadowFontColor.Selected);
end;


procedure TFormPreferences.NightModeImagesPanelFrameColorsDefaultButtonClick(
  Sender: TObject);
begin
  SetDefaultColorBox(NightModeImagesPanelInnerFrameColor);
  SetDefaultColorBox(NightModeImagesPanelOuterFrameColor);
end;

procedure TFormPreferences.NightModeImagesPanelInnerFrameColorSelect(
  Sender: TObject);
begin
  if IsNightMode then
     FormMain.PanelImagesDocuments.ColorInnerFrame:= NightModeImagesPanelInnerFrameColor.Selected;
end;

procedure TFormPreferences.NightModeImagesPanelOuterFrameColorSelect(
  Sender: TObject);
begin
  if IsNightMode then
     FormMain.PanelImagesDocuments.ColorFrame:= NightModeImagesPanelOuterFrameColor.Selected;
end;

procedure TFormPreferences.GameDocsBorderColorSelect(Sender: TObject);
begin
  FormMain.PanelGameDocuments.Color:= GameDocsBorderColor.Selected;
end;

procedure TFormPreferences.ButtonGameDocsBorderColorDefaultClick(
  Sender: TObject);
begin
  SetDefaultColorBox(GameDocsBorderColor);
  GameDocsShowBorder.Checked:= True;
end;

procedure TFormPreferences.NightModeGamesListStatusBarShowOuterFrameClick(Sender: TObject);
begin
  FormMain.SetPanelExFrames(NightModeGamesListStatusBarShowOuterFrame, NightModeGamesListStatusBarShowInnerFrame, FormMain.StatusBarPanel, 20, True);
  FormMain.SetPanelExFrames(NightModeGamesListStatusBarShowOuterFrame, NightModeGamesListStatusBarShowInnerFrame, FormMain.StatusBarPanelMachines, 20, True);
end;

procedure TFormPreferences.NightModeToolBarShowOuterFrameClick(Sender: TObject);
begin
  FormMain.SetPanelExFrames(NightModeToolBarShowOuterFrame, NightModeToolBarShowInnerFrame, FormMain.PanelToolBar, FormMain.ToolBarButtons.ButtonHeight+1, True);
  FormMain.SetPanelExFrames(NightModeToolBarShowOuterFrame, NightModeToolBarShowInnerFrame, FormMain.PanelToolBarImages, FormMain.ImagesToolBarButtons.ButtonHeight, True);
  NightModeRepaintToolBar;
end;

procedure TFormPreferences.GameDocsShowBorderClick(Sender: TObject);
begin
  if GameDocsShowBorder.Checked then
     FormMain.PanelGameDocuments.BorderWidth:= 7
  else
     FormMain.PanelGameDocuments.BorderWidth:= 0;
end;

procedure TFormPreferences.NightModeImagesPanelShowOuterFrameClick(
  Sender: TObject);
begin
  FormMain.SetPanelExFrames(NightModeImagesPanelShowOuterFrame, NightModeImagesPanelShowInnerFrame, FormMain.PanelImagesDocuments, -1, True);
end;

procedure TFormPreferences.NightModeGamesListUseWindowsThemedBorderClick(
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
end;

procedure TFormPreferences.NightModeGamesListShowOuterFrameClick(
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

procedure TFormPreferences.NightModeSearchGamesPanelEditBoxFontColorSelect(
  Sender: TObject);
begin
  if IsNightMode then
     begin
       FormMain.FilterGameTitle_ToolBar.Font.Color:= NightModeSearchGamesPanelEditBoxFontColor.Selected;
       FormMain.FilterGameTitle.Font.Color:= NightModeSearchGamesPanelEditBoxFontColor.Selected;
       FormMain.FilterCPU.Font.Color:= NightModeSearchGamesPanelEditBoxFontColor.Selected;
     end;
end;

procedure TFormPreferences.NightModeSearchGamesPanelEditBoxBackgroundColorSelect(
  Sender: TObject);
begin
  if IsNightMode then
     begin
       FormMain.FilterGameTitle_ToolBar.Color:= NightModeSearchGamesPanelEditBoxBackgroundColor.Selected;
       FormMain.FilterGameTitle.Color:= NightModeSearchGamesPanelEditBoxBackgroundColor.Selected;
       FormMain.FilterCPU.Color:= NightModeSearchGamesPanelEditBoxBackgroundColor.Selected;
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

procedure TFormPreferences.ToolBarOverlayIconsFolderButtonUpdateClick(
  Sender: TObject);
begin
  PopulateIconOverlayFoldersList;
end;

procedure TFormPreferences.ToolBarOverlayIconsFolderSelect(
  Sender: TObject);
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

procedure TFormPreferences.NightModePanelColorsTitleFontColorSelect(
  Sender: TObject);
begin
  if IsNightMode then
     begin
       FormMain.LabelInitZipTitle.Font.Color:= NightModePanelColorsTitleFontColor.Selected;
     end;
end;

procedure TFormPreferences.NightModePanelColorsTitleShadowFontColorSelect(
  Sender: TObject);
begin
  if IsNightMode then
     begin
       FormMain.LabelInitZipTitle.ShadowColor:= NightModePanelColorsTitleShadowFontColor.Selected;
     end;
end;

procedure TFormPreferences.NightModePanelColorsTitle2FontColorSelect(
  Sender: TObject);
begin
  if IsNightMode then
     begin
       FormMain.LabelInitZipSystemTitle.Font.Color:= NightModePanelColorsTitle2FontColor.Selected;
     end;
end;

procedure TFormPreferences.NightModePanelColorsTitle2ShadowFontColorSelect(
  Sender: TObject);
begin
  if IsNightMode then
     begin
       FormMain.LabelInitZipSystemTitle.ShadowColor:= NightModePanelColorsTitle2ShadowFontColor.Selected;
     end;
end;

procedure TFormPreferences.NightModePanelColorsMessageFontColorSelect(
  Sender: TObject);
begin
  if IsNightMode then
     begin
       FormMain.LabelInitZipImageCategory.Font.Color:= NightModePanelColorsMessageFontColor.Selected;
       FormMain.LabelInitZipFile.Font.Color:= NightModePanelColorsMessageFontColor.Selected;
     end;
end;

procedure TFormPreferences.NightModePanelColorsMessageShadowFontColorSelect(
  Sender: TObject);
begin
  if IsNightMode then
     begin
       FormMain.LabelInitZipImageCategory.ShadowColor:= NightModePanelColorsMessageShadowFontColor.Selected;
       FormMain.LabelInitZipFile.ShadowColor:= NightModePanelColorsMessageShadowFontColor.Selected;
     end;
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

procedure TFormPreferences.NightModeGameSelectionGradientBarClick(
  Sender: TObject);
begin
  if IsNightMode then
     begin
       FormMain.GamesListView.Selection.Gradient:= NightModeGameSelectionGradientBar.Checked;
       FormMain.MachinesListSidePanel.Selection.Gradient:= NightModeGameSelectionGradientBar.Checked;
     end;
end;

procedure TFormPreferences.NightModeGameSelectionAlphaBlendClick(
  Sender: TObject);
begin
  if IsNightMode then
     begin
       FormMain.GamesListView.Selection.AlphaBlend:= NightModeGameSelectionAlphaBlend.Checked;
       FormMain.GamesListView.Selection.RoundRect:= NightModeGameSelectionAlphaBlend.Checked;
       FormMain.MachinesListSidePanel.Selection.AlphaBlend:= NightModeGameSelectionAlphaBlend.Checked;
       FormMain.MachinesListSidePanel.Selection.RoundRect:= NightModeGameSelectionAlphaBlend.Checked;
     end;
end;

procedure TFormPreferences.NightModeGameSelectionButtonDefaultClick(
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

procedure TFormPreferences.GameSelectionButtonCopyClick(Sender: TObject);
begin
  FormMain.SetSelectedColorBox(NightModeGamesListStatusBarTopColor, GamesListStatusBarTopColor.Selected);

  FormMain.SetSelectedColorBox(NightModeGamesSelectionTopColor, GamesSelectionTopColor.Selected);
  FormMain.SetSelectedColorBox(NightModeGamesSelectionBottomColor, GamesSelectionBottomColor.Selected);
  FormMain.SetSelectedColorBox(NightModeGamesSelectionFrameColor, GamesSelectionFrameColor.Selected);
  FormMain.SetSelectedColorBox(NightModeGamesSelectionFontColor, GamesSelectionFontColor.Selected);

  FormMain.SetSelectedColorBox(NightModeGamesSelectionMissROMsTopColor, GamesSelectionMissROMsTopColor.Selected);
  FormMain.SetSelectedColorBox(NightModeGamesSelectionMissROMsBottomColor, GamesSelectionMissROMsBottomColor.Selected);
  FormMain.SetSelectedColorBox(NightModeGamesSelectionMissROMsFrameColor, GamesSelectionMissROMsFrameColor.Selected);
  FormMain.SetSelectedColorBox(NightModeGamesSelectionMissROMsFontColor, GamesSelectionMissROMsFontColor.Selected);

  FormMain.SetSelectedColorBox(NightModeGamesSelectionInactiveTopColor, GamesSelectionInactiveTopColor.Selected);
  FormMain.SetSelectedColorBox(NightModeGamesSelectionInactiveBottomColor, GamesSelectionInactiveBottomColor.Selected);
  FormMain.SetSelectedColorBox(NightModeGamesSelectionInactiveFrameColor, GamesSelectionInactiveFrameColor.Selected);
  FormMain.SetSelectedColorBox(NightModeGamesSelectionInactiveFontColor, GamesSelectionInactiveFontColor.Selected);
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

procedure TFormPreferences.NightModeSearchGamesPanelEditBoxCustomFrameColorSelect(
  Sender: TObject);
begin
  if IsNightMode then
     begin
       FormMain.FilterGameTitle_ToolBar.ColorFrame:= NightModeSearchGamesPanelEditBoxCustomFrameColor.Selected;
       FormMain.FilterGameTitle.ColorFrame:= NightModeSearchGamesPanelEditBoxCustomFrameColor.Selected;
       FormMain.FilterCPU.ColorFrame:= NightModeSearchGamesPanelEditBoxCustomFrameColor.Selected;
     end;
end;

procedure TFormPreferences.NightModeSearchGamesPanelEditBoxCustomFocusedFrameColorSelect(
  Sender: TObject);
begin
  if IsNightMode then
     begin
       FormMain.FilterGameTitle_ToolBar.ColorFrameFocused:= NightModeSearchGamesPanelEditBoxCustomFocusedFrameColor.Selected;
       FormMain.FilterGameTitle.ColorFrameFocused:= NightModeSearchGamesPanelEditBoxCustomFocusedFrameColor.Selected;
       FormMain.FilterCPU.ColorFrameFocused:= NightModeSearchGamesPanelEditBoxCustomFocusedFrameColor.Selected;
     end;
end;

procedure TFormPreferences.NightModeSearchGamesPanelEditBoxUseCustomFrameClick(
  Sender: TObject);
begin
  if IsNightMode then
     begin
       FormMain.FilterGameTitle_ToolBar.UseCustomBorder:= NightModeSearchGamesPanelEditBoxUseCustomFrame.Checked;
       FormMain.FilterGameTitle.UseCustomBorder:= NightModeSearchGamesPanelEditBoxUseCustomFrame.Checked;
       FormMain.FilterCPU.UseCustomBorder:= NightModeSearchGamesPanelEditBoxUseCustomFrame.Checked;
     end;
end;

procedure TFormPreferences.NightModeButtonColorsViewNextBackgroundClick(
  Sender: TObject);
begin
  TBitBtn(Sender).Tag:= TBitBtn(Sender).Tag+1;
  if TBitBtn(Sender).Tag > 3 then
     TBitBtn(Sender).Tag:= 1;

  case TBitBtn(Sender).Tag of
    1:
      begin
        LabelNightModeButtonColorsViewNextBackground.Caption:= 'Med Dark Gray Gradient Background';
        SetPanelColors(NightModeButtonColorsSamplePanel, menu_background_color[1], clrMedDarkGray);
      end;
    2:
      begin
        LabelNightModeButtonColorsViewNextBackground.Caption:= 'Dark Gray Gradient Background';
        SetPanelColors(NightModeButtonColorsSamplePanel, clrBlackBk, clrDarkGray);
      end;
    3:
      begin
        LabelNightModeButtonColorsViewNextBackground.Caption:= 'Med Dark Gray Solid Background';
        SetPanelColors(NightModeButtonColorsSamplePanel, menu_background_color[1], -1, True);
      end;
  end;
  NightModeButtonColorsSampleButton1.Invalidate;
  NightModeButtonColorsSampleButton2.Invalidate;
  NightModeButtonColorsSampleButton3.Invalidate;
  NightModeButtonColorsSampleButton4.Invalidate;
end;


procedure TFormPreferences.NightModeButtonColorFontColorSelect(Sender: TObject);
begin
  NightModeButtonColorsSampleButton1.Font.Color:= NightModeButtonColorFontColor.Selected;// TColorBox(Sender).Selected;
  NightModeButtonColorsSampleButton2.Font.Color:= NightModeButtonColorsSampleButton1.Font.Color;
  NightModeButtonColorsSampleButton3.Font.Color:= NightModeButtonColorsSampleButton1.Font.Color;
  NightModeButtonColorsSampleButton4.Font.Color:= NightModeButtonColorsSampleButton1.Font.Color;
end;

procedure TFormPreferences.NightModeButtonColorGradientTopSelect(Sender: TObject);
begin
  NightModeButtonColorsSampleButton1.GradientColorTop:= NightModeButtonColorGradientTop.Selected;
  NightModeButtonColorsSampleButton2.GradientColorTop:= NightModeButtonColorsSampleButton1.GradientColorTop;
  NightModeButtonColorsSampleButton3.GradientColorTop:= NightModeButtonColorsSampleButton1.GradientColorTop;
  NightModeButtonColorsSampleButton4.GradientColorTop:= NightModeButtonColorsSampleButton1.GradientColorTop;
end;

procedure TFormPreferences.NightModeButtonColorGradientBottomSelect(Sender: TObject);
begin
  NightModeButtonColorsSampleButton1.GradientColorBottom:= NightModeButtonColorGradientBottom.Selected;
  NightModeButtonColorsSampleButton2.GradientColorBottom:= NightModeButtonColorsSampleButton1.GradientColorBottom;
  NightModeButtonColorsSampleButton3.GradientColorBottom:= NightModeButtonColorsSampleButton1.GradientColorBottom;
  NightModeButtonColorsSampleButton4.GradientColorBottom:= NightModeButtonColorsSampleButton1.GradientColorBottom;
end;

procedure TFormPreferences.NightModeButtonColorFrameColorSelect(Sender: TObject);
begin
  NightModeButtonColorsSampleButton1.FrameColor:= NightModeButtonColorFrameColor.Selected;
  NightModeButtonColorsSampleButton2.FrameColor:= NightModeButtonColorsSampleButton1.FrameColor;
  NightModeButtonColorsSampleButton3.FrameColor:= NightModeButtonColorsSampleButton1.FrameColor;
  NightModeButtonColorsSampleButton4.FrameColor:= NightModeButtonColorsSampleButton1.FrameColor;
end;

procedure TFormPreferences.NightModeButtonColorFrameColorFocusedSelect(Sender: TObject);
begin
  NightModeButtonColorsSampleButton1.FrameColor_Focused:= NightModeButtonColorFrameColorFocused.Selected;
  NightModeButtonColorsSampleButton2.FrameColor_Focused:= NightModeButtonColorsSampleButton1.FrameColor_Focused;
  NightModeButtonColorsSampleButton3.FrameColor_Focused:= NightModeButtonColorsSampleButton1.FrameColor_Focused;
  NightModeButtonColorsSampleButton4.FrameColor_Focused:= NightModeButtonColorsSampleButton1.FrameColor_Focused;
end;

procedure TFormPreferences.NightModeButtonColorGradientTopHoverSelect(Sender: TObject);
begin
  NightModeButtonColorsSampleButton1.GradientColorTop_Hover:= NightModeButtonColorGradientTopHover.Selected;
  NightModeButtonColorsSampleButton2.GradientColorTop_Hover:= NightModeButtonColorsSampleButton1.GradientColorTop_Hover;
  NightModeButtonColorsSampleButton3.GradientColorTop_Hover:= NightModeButtonColorsSampleButton1.GradientColorTop_Hover;
  NightModeButtonColorsSampleButton4.GradientColorTop_Hover:= NightModeButtonColorsSampleButton1.GradientColorTop_Hover;
end;

procedure TFormPreferences.NightModeButtonColorGradientBottomHoverSelect(Sender: TObject);
begin
  NightModeButtonColorsSampleButton1.GradientColorBottom_Hover:= NightModeButtonColorGradientBottomHover.Selected;
  NightModeButtonColorsSampleButton2.GradientColorBottom_Hover:= NightModeButtonColorsSampleButton1.GradientColorBottom_Hover;
  NightModeButtonColorsSampleButton3.GradientColorBottom_Hover:= NightModeButtonColorsSampleButton1.GradientColorBottom_Hover;
  NightModeButtonColorsSampleButton4.GradientColorBottom_Hover:= NightModeButtonColorsSampleButton1.GradientColorBottom_Hover;
end;

procedure TFormPreferences.NightModeButtonColorFrameColorHoverSelect(Sender: TObject);
begin
  NightModeButtonColorsSampleButton1.FrameColor_Hover:= NightModeButtonColorFrameColorHover.Selected;
  NightModeButtonColorsSampleButton2.FrameColor_Hover:= NightModeButtonColorsSampleButton1.FrameColor_Hover;
  NightModeButtonColorsSampleButton3.FrameColor_Hover:= NightModeButtonColorsSampleButton1.FrameColor_Hover;
  NightModeButtonColorsSampleButton4.FrameColor_Hover:= NightModeButtonColorsSampleButton1.FrameColor_Hover;
end;

procedure TFormPreferences.NightModeButtonColorGradientTopSelectedSelect(
  Sender: TObject);
begin
  NightModeButtonColorsSampleButton4.GradientColorTop_Down:= NightModeButtonColorGradientTopSelected.Selected;
end;

procedure TFormPreferences.NightModeButtonColorGradientBottomSelectedSelect(
  Sender: TObject);
begin
  NightModeButtonColorsSampleButton4.GradientColorBottom_Down:= NightModeButtonColorGradientBottomSelected.Selected;
end;

procedure TFormPreferences.NightModeButtonColorFrameColorSelectedSelect(
  Sender: TObject);
begin
  NightModeButtonColorsSampleButton4.FrameColor_Down:= NightModeButtonColorFrameColorSelected.Selected;
end;

procedure TFormPreferences.NightModeButtonColorFontColorDisabledSelect(Sender: TObject);
begin
  NightModeButtonColorsSampleButton1.FontColorDisabled:= NightModeButtonColorFontColorDisabled.Selected;
  NightModeButtonColorsSampleButton2.FontColorDisabled:= NightModeButtonColorsSampleButton1.FontColorDisabled;
  NightModeButtonColorsSampleButton3.FontColorDisabled:= NightModeButtonColorsSampleButton1.FontColorDisabled;
  NightModeButtonColorsSampleButton4.FontColorDisabled:= NightModeButtonColorsSampleButton1.FontColorDisabled;
end;

procedure TFormPreferences.NightModeButtonColorFontShadowColorDisabledSelect(Sender: TObject);
begin
  NightModeButtonColorsSampleButton1.FontShadowColorDisabled:= NightModeButtonColorFontShadowColorDisabled.Selected;
  NightModeButtonColorsSampleButton2.FontShadowColorDisabled:= NightModeButtonColorsSampleButton1.FontShadowColorDisabled;
  NightModeButtonColorsSampleButton3.FontShadowColorDisabled:= NightModeButtonColorsSampleButton1.FontShadowColorDisabled;
  NightModeButtonColorsSampleButton4.FontShadowColorDisabled:= NightModeButtonColorsSampleButton1.FontShadowColorDisabled;
end;

procedure TFormPreferences.NightModeButtonColorGradientTopDisabledSelect(Sender: TObject);
begin
  NightModeButtonColorsSampleButton1.GradientColorTop_Disabled:= NightModeButtonColorGradientTopDisabled.Selected;
  NightModeButtonColorsSampleButton2.GradientColorTop_Disabled:= NightModeButtonColorsSampleButton1.GradientColorTop_Disabled;
  NightModeButtonColorsSampleButton3.GradientColorTop_Disabled:= NightModeButtonColorsSampleButton1.GradientColorTop_Disabled;
  NightModeButtonColorsSampleButton4.GradientColorTop_Disabled:= NightModeButtonColorsSampleButton1.GradientColorTop_Disabled;
end;

procedure TFormPreferences.NightModeButtonColorGradientBottomDisabledSelect(Sender: TObject);
begin
  NightModeButtonColorsSampleButton1.GradientColorBottom_Disabled:= NightModeButtonColorGradientBottomDisabled.Selected;
  NightModeButtonColorsSampleButton2.GradientColorBottom_Disabled:= NightModeButtonColorsSampleButton1.GradientColorBottom_Disabled;
  NightModeButtonColorsSampleButton3.GradientColorBottom_Disabled:= NightModeButtonColorsSampleButton1.GradientColorBottom_Disabled;
  NightModeButtonColorsSampleButton4.GradientColorBottom_Disabled:= NightModeButtonColorsSampleButton1.GradientColorBottom_Disabled;
end;

procedure TFormPreferences.NightModeButtonColorFrameColorDisabledSelect(Sender: TObject);
begin
  NightModeButtonColorsSampleButton1.FrameColor_Disabled:= NightModeButtonColorFrameColorDisabled.Selected;
  NightModeButtonColorsSampleButton2.FrameColor_Disabled:= NightModeButtonColorsSampleButton1.FrameColor_Disabled;
  NightModeButtonColorsSampleButton3.FrameColor_Disabled:= NightModeButtonColorsSampleButton1.FrameColor_Disabled;
  NightModeButtonColorsSampleButton4.FrameColor_Disabled:= NightModeButtonColorsSampleButton1.FrameColor_Disabled;
end;


procedure TFormPreferences.NightModeButtonColorsBoxDefaultButtonClick(
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


end.

