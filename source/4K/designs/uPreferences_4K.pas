unit uPreferences_4K;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  ExtCtrls, StdCtrls, ComCtrls, Menus, IniFiles, MPCommonObjects, EasyListview,
  GR32_RangeBars, ButtonsEx, ShadowLabel, PanelEx, Buttons, BarMenus, GraphicEx,
  SplitterEx, AdvOfficeButtons, ShellAPI, EditEx, ColorBoxEx, Themes;

type
  TFormPreferences4K = class(TForm)
    PanelTabButtons: TPanelEx;
    ButtonPage1: TSpeedButtonEx;
    ButtonPage2: TSpeedButtonEx;
    PanelPage2: TPanelEx;
    ToolBarBackgroundColorsBox: TPanelEx;
    ToolBarBackgroundColorsBoxLabel: TShadowLabel;
    NightModeLabelToolBarBkBottomColor: TShadowLabel;
    NightModeLabelToolBarBkTopColor: TShadowLabel;
    ToolBarGradientBar: TAdvOfficeCheckBoxEx;
    ToolBarBkTopColor: TColorBoxEx;
    ToolBarBkBottomColor: TColorBoxEx;
    ToolBarBkColorsDefaultButton: TBitBtnEx;
    SearchGamesPanelColorsBox: TPanelEx;
    SearchGamesPanelColorsBoxLabel: TShadowLabel;
    NightModeLabelSearchGamesPanelFilterFontColor: TShadowLabel;
    NightModeLabelSearchGamesPanelFieldFontColor: TShadowLabel;
    NightModeLabelSearchGamesPanelEditBoxFontColor: TShadowLabel;
    NightModeLabelSearchGamesPanelEditBoxBackgroundColor: TShadowLabel;
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
    GamesSelectionMissROMsLabel: TShadowLabel;
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
    ButtonDefaultBkSortedColor: TBitBtnEx;
    GamesBackgroundImage: TEditEx;
    GamesBackgroundImageEnable: TAdvOfficeCheckBoxEx;
    GamesBackgroundImageButtonSelect: TBitBtnEx;
    GamesBackgroundImageButtonUpdate: TBitBtnEx;
    GamesTileBackground: TAdvOfficeCheckBoxEx;
    GamesListSplittersBox: TPanelEx;
    GamesListSplittersBoxLabel: TShadowLabel;
    GamesListSplitterStyleSelector: TComboBox2Ex;
    ButtonGamesListSplitterStyleButtonDefault: TBitBtnEx;
    LabelGamesListSplitterSingleColorDefault: TShadowLabel;
    GamesListSplitterSingleColorButtonDefault: TBitBtnEx;
    GamesListSplitterShowGripIcon: TAdvOfficeCheckBoxEx;
    GamesListSplitterSingleColor: TColorBoxEx;
    GamesListSplitterSingleColorHot: TColorBoxEx;
    LabelGamesListSplitterSingleColorHot: TShadowLabel;
    LabelGamesListSplitterSingleColor: TShadowLabel;
    GamesListStatusBarColorsBox: TPanelEx;
    GamesListStatusBarColorsBoxLabel: TShadowLabel;
    GamesListStatusBarGradientBar: TAdvOfficeCheckBoxEx;
    GamesListStatusBarButtonDefault: TBitBtnEx;
    GamesListStatusBarTopColor: TColorBoxEx;
    GamesListStatusBarBottomColor: TColorBoxEx;
    LabelGamesListStatusBarBottomColor: TShadowLabel;
    LabelGamesListStatusBarFontColor: TShadowLabel;
    GamesListStatusBarFontColor: TColorBoxEx;
    LabelGamesListStatusBarTopColor: TShadowLabel;
    MAMEGameDocsColorsBox: TPanelEx;
    MAMEGameDocsColorsBoxLabel: TShadowLabel;
    GameDocumentsBackgroundColor: TColorBoxEx;
    GameDocumentsButtonDefault: TBitBtnEx;
    GameDocsShowBorder: TAdvOfficeCheckBoxEx;
    GameDocsBorderColor: TColorBoxEx;
    GameDocsBorderColorButtonDefault: TBitBtnEx;
    GameDocsShowStatusBar: TAdvOfficeCheckBoxEx;
    GameDocsShowStatusBarLabel: TShadowLabel;
    ImageSplittersBox: TPanelEx;
    ImageSplittersBoxLabel: TShadowLabel;
    ImageSplitterStyleSelector: TComboBox2Ex;
    ImageSplitterStyleSelectorButtonDefault: TBitBtnEx;
    ImageSplitterShowGripIcon: TAdvOfficeCheckBoxEx;
    LabelImageSplitterSingleColorDefault: TShadowLabel;
    ImageSplitterSingleColorButtonDefault: TBitBtnEx;
    LabelImageSplitterSingleColor: TShadowLabel;
    ImageSplitterSingleColor: TColorBoxEx;
    LabelImageSplitterSingleColorHot: TShadowLabel;
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
    LabelDisableNaturalSorting: TShadowLabel;
    LabelGameMultilineCaptions: TShadowLabel;
    LabelAddLeadingZeroVersionInfoMAME: TShadowLabel;
    DisableNaturalSorting: TAdvOfficeCheckBoxEx;
    GameMultilineCaptions: TAdvOfficeCheckBoxEx;
    AddLeadingZeroVersionInfoMAME: TAdvOfficeCheckBoxEx;
    MAMu_IconsFolderBox: TPanelEx;
    MAMu_IconsFolderBoxLabel: TShadowLabel;
    MAMu_IconsFolder: TEditEx;
    ButtonMAMu_IconsFolderSelect: TBitBtnEx;
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
    EnableBackgroundWindowAlphaBlendEffect: TAdvOfficeCheckBoxEx;
    EnableBackgroundWindowAlphaBlendEffectLabel: TShadowLabel;
    NightModeImagesHintBox: TPanelEx;
    NightModeImagesHintBoxLabel: TShadowLabel;
    NightModeLabelHintBox_Color: TShadowLabel;
    NightModeLabelHintBox_Opacity: TShadowLabel;
    NightModeLabelHintBox_TextColor: TShadowLabel;
    NightModeHintBox_PositionLabel: TShadowLabel;
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
    NightModeHintBox_Position: TGaugeBar;
    DisableDeleteSelectedGames: TAdvOfficeCheckBoxEx;
    LabelDisableDeleteSelectedGames: TShadowLabel;
    AdvOfficeCheckBoxEx1: TAdvOfficeCheckBoxEx;
    ShadowLabel1: TShadowLabel;
  private
    { Private declarations }
  public
    { Public declarations }

  end;

var
  FormPreferences4K: TFormPreferences4K;

implementation

uses uMain, uStatus, uCommon;

{$R *.DFM}


end.

