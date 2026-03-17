unit uStatusCustomize;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  GraphicEx, StdCtrls, ComCtrls, ExtCtrls, uCommon, mmSystem, ShadowLabel,
  GR32_RangeBars, GR32_Image, GR32_Layers, ColorBoxEx, AdvOfficeButtons,
  PanelEx, ButtonsEx, XiProgressBar, IniFiles;
  //Win7TaskBarProgressUnit;

type
  TFormStatusCustomize = class(TForm)
    ImageBk: TImage32;
    LabelMessage: TShadowLabel;
    LabelTimer: TShadowLabel;
    LabelStatusType: TShadowLabel;
    LabelVersion: TShadowLabel;
    LabelSoftwareScanCount: TShadowLabel;
    SplashScreenSettingsBox: TPanelEx;
    SplashScreenSettingsBoxLabel: TShadowLabel;
    SplashScreenEnableTextsAlternateLayout: TAdvOfficeCheckBoxEx;
    SplashScreenEnableAlternateLogoFile: TAdvOfficeCheckBoxEx;
    SplashScreenSettingsTextFontColorsBox: TPanelEx;
    SplashScreenSettingsTextFontColorsBoxLabel: TShadowLabel;
    SplashScreenTitleTextColorLabel: TShadowLabel;
    SplashScreenTitleTextColor: TColorBoxEx;
    SplashScreenMessageTextColor: TColorBoxEx;
    SplashScreenMessageTextColorLabel: TShadowLabel;
    SplashScreenTimerTextColorLabel: TShadowLabel;
    SplashScreenTimerTextColor: TColorBoxEx;
    SplashScreenVersionInfoTextColor: TColorBoxEx;
    SplashScreenVersionInfoTextColorLabel: TShadowLabel;
    SplashScreenSoftwareTextColorLabel: TShadowLabel;
    SplashScreenSoftwareTextColor: TColorBoxEx;
    SplashScreenVersionInfoPositionX: TGaugeBar;
    SplashScreenVersionInfoPositionXPosLabel: TShadowLabel;
    SplashScreenVersionInfoPositionY: TGaugeBar;
    SplashScreenVersionInfoPositionYPosLabel: TShadowLabel;
    ColorsBoxButtonDefault: TSpeedButtonEx;
    VersionInfoPositionButtonDefault: TSpeedButtonEx;
    SplashScreenVersionInfoPositionXLabel: TShadowLabel;
    SplashScreenVersionInfoPositionYLabel: TShadowLabel;
    SplashScreenProgressBarColorSchemeLabel: TShadowLabel;
    SplashScreenProgressBarColorScheme: TComboBox2Ex;
    ProgressBarSchemeButtonDefault: TSpeedButtonEx;
    ProgressBarPanel: TPanelEx;
    ProgressBar: TXiProgressBar;
    StatusButtonClose: TBitBtnEx;
    SplashScreenProgressBarColorBackTopLabel: TShadowLabel;
    SplashScreenProgressBarColorBackDownLabel: TShadowLabel;
    SplashScreenProgressBarColorBarTopLabel: TShadowLabel;
    SplashScreenProgressBarColorBarDownLabel: TShadowLabel;
    SplashScreenProgressBarColorBackBorderLabel: TShadowLabel;
    SplashScreenProgressBarColorBackTop: TColorBoxEx;
    SplashScreenProgressBarColorBackDown: TColorBoxEx;
    SplashScreenProgressBarColorBackBorder: TColorBoxEx;
    SplashScreenProgressBarColorBarTop: TColorBoxEx;
    SplashScreenProgressBarColorBarDown: TColorBoxEx;
    ProgressBarCopyCurrentColorsToCustomButton: TBitBtnEx;
    SplashScreen4KUltraSize: TAdvOfficeCheckBoxEx;
    SplashScreenTextShadowColorAll: TColorBoxEx;
    SplashScreenTextShadowColorAllLabel: TShadowLabel;
    SplashScreenShowTextShadows: TAdvOfficeCheckBoxEx;
    SplashScreenTitleShadowColorLabel: TShadowLabel;
    SplashScreenTitleShadowColor: TColorBoxEx;
    SplashScreenMessageShadowColorLabel: TShadowLabel;
    SplashScreenMessageShadowColor: TColorBoxEx;
    SplashScreenTimerShadowColorLabel: TShadowLabel;
    SplashScreenTimerShadowColor: TColorBoxEx;
    SplashScreenSoftwareShadowColorLabel: TShadowLabel;
    SplashScreenSoftwareShadowColor: TColorBoxEx;
    SplashScreenVersionInfoShadowColorLabel: TShadowLabel;
    SplashScreenVersionInfoShadowColor: TColorBoxEx;
    SplashScreenTextShadowDistanceLabel: TShadowLabel;
    SplashScreenTextShadowDistance: TGaugeBar;
    SplashScreenTextShadowColor_OneColor: TAdvOfficeCheckBoxEx;
    SplashScreenTextShadowDistancePosLabel: TShadowLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure StatusButtonCloseClick(Sender: TObject);
    procedure SplashScreenVersionInfoPositionXChange(Sender: TObject);
    procedure SplashScreenVersionInfoPositionYChange(Sender: TObject);
    procedure SplashScreenShowTextShadowsClick(Sender: TObject);
    procedure SplashScreenTitleTextColorSelect(Sender: TObject);
    procedure SplashScreenMessageTextColorSelect(Sender: TObject);
    procedure SplashScreenTimerTextColorSelect(Sender: TObject);
    procedure SplashScreenSoftwareTextColorSelect(Sender: TObject);
    procedure SplashScreenEnableAlternateLogoFileClick(Sender: TObject);
    procedure ColorsBoxButtonDefaultClick(Sender: TObject);
    procedure SplashScreenEnableTextsAlternateLayoutClick(Sender: TObject);
    procedure VersionInfoPositionButtonDefaultClick(Sender: TObject);
    procedure SplashScreenVersionInfoTextColorSelect(Sender: TObject);
    procedure SplashScreenProgressBarColorSchemeSelect(Sender: TObject);
    procedure ProgressBarSchemeButtonDefaultClick(Sender: TObject);
    procedure SplashScreenProgressBarColorBackTopSelect(Sender: TObject);
    procedure SplashScreenProgressBarColorBackDownSelect(Sender: TObject);
    procedure SplashScreenProgressBarColorBackBorderSelect(
      Sender: TObject);
    procedure SplashScreenProgressBarColorBarTopSelect(Sender: TObject);
    procedure SplashScreenProgressBarColorBarDownSelect(Sender: TObject);
    procedure ProgressBarCopyCurrentColorsToCustomButtonClick(
      Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormStatusCustomize: TFormStatusCustomize;

implementation

uses uMain, uStatus;

{$R *.DFM}


end.
