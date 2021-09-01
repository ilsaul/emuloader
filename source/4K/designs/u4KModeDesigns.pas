unit u4KModeDesigns;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, ShadowLabel, PanelEx, EditEx,
  AdvOfficeButtons, ButtonsEx, ColorBoxEx, ImgList, ComCtrls, ToolWin,
  TntStdCtrls, TntEditEx, GR32_Image;

type
  TForm4KModeDesigns = class(TForm)
    PanelInitZipFile: TPanelEx;
    LabelInitZipTitle: TShadowLabel;
    LabelInitZipFile: TShadowLabel;
    LabelInitZipSystemTitle: TShadowLabel;
    LabelInitZipImageCategory: TShadowLabel;
    InitZipSystemIcon: TImage;
    ImageHintPanel: TPanelEx;
    ImageHintText: TShadowLabel;
    ImageHintIcon: TImage;
    ImageHintDetailsText: TShadowLabel;
    PanelBackground: TPanelEx;
    LabelBoxMessageTitle: TShadowLabel;
    LabelBoxMessage: TShadowLabel;
    MsgIcon: TImage;
    StatusBarPanel: TPanelEx;
    StatusBar_GamesTotal: TShadowLabel;
    StatusBar_GamesGameName: TShadowLabel;
    IconGameStatus: TImage;
    IconDriverStatus: TImage;
    IconGameMediaType: TImage;
    PanelBottom_CustomizeGameFonts: TPanelEx;
    LabelBackgroundColor: TShadowLabel;
    Label1: TLabel;
    GamesBackgroundColor: TColorBoxEx;
    ButtonDefaultBkSortedColor: TBitBtnEx;
    GamesBackgroundImageEnable: TAdvOfficeCheckBoxEx;
    GamesBackgroundImage: TEditEx;
    GamesTileBackground: TAdvOfficeCheckBoxEx;
    GamesBackgroundImageButtonUpdate: TBitBtnEx;
    GamesBackgroundImageButtonSelect: TBitBtnEx;
    ButtonOk: TBitBtnEx;
    ButtonCancel: TBitBtnEx;
    LabelTotalPlayTime: TShadowLabel;
    LabelLastPlayed: TShadowLabel;
    ShadowLabel1: TShadowLabel;
    ShadowLabel2: TShadowLabel;
    WebBrowserStatusPanel: TPanelEx;
    LabelWebBrowserStatus: TShadowLabel;
    PanelSearchGames: TPanelEx;
    PanelSearchGamesCaptionBar: TShadowLabel;
    ButtonFilterTitleClose: TShadowLabel;
    LabelSearchGamesFilter: TShadowLabel;
    LabelSearchGamesBy: TShadowLabel;
    FilterGameTitle: TTntEditEx;
    ToolBarFilterTitle: TToolBar;
    ButtonFilterTitleApply: TToolButton;
    ButtonFilterControls: TToolButton;
    ButtonFilterTitleReset: TToolButton;
    ButtonFilterTitleSettings: TToolButton;
    ButtonFilterTitlePanelMode: TToolButton;
    PanelFilterCPU: TPanelEx;
    FilterCPU_LabelCaptionBar: TShadowLabel;
    FilterCPU_ButtonClose: TShadowLabel;
    LabelCustomCPUFilter: TShadowLabel;
    LabelSelectCPU: TShadowLabel;
    FilterCPU: TEditEx;
    FilterCPUList: TComboBox2Ex;
    IL_32x32: TImageList;
    ShadowLabel3: TShadowLabel;
    ShadowLabel4: TShadowLabel;
    ShadowLabel5: TShadowLabel;
    AdvOfficeCheckBoxEx1: TAdvOfficeCheckBoxEx;
    HideThumbnailImages: TAdvOfficeCheckBoxEx;
    ShadowLabel6: TShadowLabel;
    PanelEx1: TPanelEx;
    ImageScrLayout: TImage32;
    LabelLayoutTitle: TShadowLabel;
    LabelImagesPanel: TShadowLabel;
    LabelImagesPanelDimensions: TShadowLabel;
    LabelImage2Dimensions: TShadowLabel;
    LabelImage3Dimensions: TShadowLabel;
    LabelImage4Dimensions: TShadowLabel;
    LabelImage4: TShadowLabel;
    LabelImage3: TShadowLabel;
    LabelImage2: TShadowLabel;
    LabelImage1: TShadowLabel;
    LabelImage1Dimensions: TShadowLabel;
    LabelTotalMachines: TShadowLabel;
    ShadowLabel7: TShadowLabel;
    PanelEx2: TPanelEx;
    LabelSelectCategory: TShadowLabel;
    LabelFilterStatus: TShadowLabel;
    IconListAll: TImage;
    IconGoodImperfect: TImage;
    IconImperfect: TImage;
    IconPreliminary: TImage;
    IconGood: TImage;
    PanelBottom: TPanelEx;
    BitBtnEx1: TBitBtnEx;
    BitBtnEx2: TBitBtnEx;
    ListAll: TAdvOfficeRadioButtonEx;
    DriverStatusCategory: TComboBox2Ex;
    GoodImperfect: TAdvOfficeRadioButtonEx;
    Imperfect: TAdvOfficeRadioButtonEx;
    Preliminary: TAdvOfficeRadioButtonEx;
    Good: TAdvOfficeRadioButtonEx;
    ButtonFilterCPUApply: TSpeedButtonEx;
    ButtonFilterCPUReset: TSpeedButtonEx;
    PanelEx3: TPanelEx;
    ShadowLabel8: TShadowLabel;
    ShadowLabel9: TShadowLabel;
    SpeedButtonEx1: TSpeedButtonEx;
    SpeedButtonEx2: TSpeedButtonEx;
    ShadowLabel10: TShadowLabel;
    EditEx1: TEditEx;
    ComboBox2Ex1: TComboBox2Ex;
    PanelSearchGames_ToolBar: TPanelEx;
    LabelSearchGamesFilter_ToolBar: TShadowLabel;
    LabelSearchGamesBy_ToolBar: TShadowLabel;
    ButtonFilterTitleApply_ToolBar: TSpeedButtonEx;
    ButtonFilterControls_ToolBar: TSpeedButtonEx;
    ButtonFilterTitleReset_ToolBar: TSpeedButtonEx;
    ButtonFilterTitleSettings_ToolBar: TSpeedButtonEx;
    FilterGameTitle_ToolBar: TTntEditEx;
    ShadowLabel11: TShadowLabel;
    PanelWebToolBarButtons: TPanelEx;
    WebButtonRefresh: TSpeedButtonEx;
    WebButtonStop: TSpeedButtonEx;
    WebButtonExit: TSpeedButtonEx;
    WebButtonVideoPreviewPlay: TSpeedButtonEx;
    IL_24x24: TImageList;
    LabelTimer: TShadowLabel;
    LabelSoftwareScanCount: TShadowLabel;
    ShadowLabel12: TShadowLabel;
    ShadowLabel13: TShadowLabel;
    LabelGameName: TShadowLabel;
    ShadowLabel14: TShadowLabel;
    ShadowLabel15: TShadowLabel;
    ShadowLabel16: TShadowLabel;
    ShadowLabel17: TShadowLabel;
    ShadowLabel18: TShadowLabel;
    ShadowLabel19: TShadowLabel;
    ShadowLabel20: TShadowLabel;
    ShadowLabel21: TShadowLabel;
    ShadowLabel22: TShadowLabel;
    ShadowLabel23: TShadowLabel;
    ShadowLabel24: TShadowLabel;
    ShadowLabel25: TShadowLabel;
    ShadowLabel26: TShadowLabel;
    ShadowLabel27: TShadowLabel;
    ShadowLabel28: TShadowLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form4KModeDesigns: TForm4KModeDesigns;

implementation

{$R *.dfm}

end.
