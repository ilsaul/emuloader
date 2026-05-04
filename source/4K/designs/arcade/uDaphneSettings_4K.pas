unit uDaphneSettings_4K;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, ComCtrls, PanelEx,
  ImgList, IniFiles, GR32_RangeBars, AdvOfficeButtons, AdvGroupBox,
  ShadowLabel, Buttons, ButtonsEx, ColorBoxEx;

type
  TFormDaphneSettings4K = class(TForm)
    TopBar: TPanelEx;
    ButtonReadFile: TBitBtnEx;
    ButtonOk: TBitBtnEx;
    ButtonCancel: TBitBtnEx;
    SystemIcon: TImage;
    GameIcon: TImage;
    LabelGameTitle: TShadowLabel;
    LabelEmulatorFile: TShadowLabel;
    AudioGroupBox: TPanelEx;
    AudioGroupBoxLabel: TShadowLabel;
    VideoBoxGroupBox: TPanelEx;
    VideoBoxGroupBoxLabel: TShadowLabel;
    ScreenResolutionLabel: TShadowLabel;
    ScreenResolution: TComboBox2Ex;
    Daphne_FullScreen: TAdvOfficeCheckBoxEx;
    FullScale: TAdvOfficeCheckBoxEx;
    IgnoreAspectRatio: TAdvOfficeCheckBoxEx;
    Daphne_OpenGL: TAdvOfficeCheckBoxEx;
    BlankSearches: TAdvOfficeCheckBoxEx;
    BlankSkips: TAdvOfficeCheckBoxEx;
    GeneralGroupBox: TPanelEx;
    GeneralGroupBoxLabel: TShadowLabel;
    LaserDiscTypeLabel: TShadowLabel;
    LaserDiscType: TComboBox2Ex;
    Daphne_NoJoysticks: TAdvOfficeCheckBoxEx;
    SRAMContinuousUpdate: TAdvOfficeCheckBoxEx;
    FastBoot: TAdvOfficeCheckBoxEx;
    StopLaserdiscPlayer: TAdvOfficeCheckBoxEx;
    Daphne_NoLog: TAdvOfficeCheckBoxEx;
    Daphne_NoWarnings: TAdvOfficeCheckBoxEx;
    SendUsageStatistics: TAdvOfficeCheckBoxEx;
    EnableCheat: TAdvOfficeCheckBoxEx;
    IdleExit: TAdvOfficeCheckBoxEx;
    IdleExitValue: TGaugeBar;
    AudioVolumeVLDPLabel: TShadowLabel;
    NoSound: TAdvOfficeCheckBoxEx;
    Daphne_PreferSamples: TAdvOfficeCheckBoxEx;
    AudioVolumeVLDP: TGaugeBar;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormDaphneSettings4K: TFormDaphneSettings4K;

implementation

uses uMain, uCommon;

{$R *.dfm}


end.
