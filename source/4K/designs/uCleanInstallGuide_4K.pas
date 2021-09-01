unit uCleanInstallGuide_4K;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  StdCtrls, ShadowLabel, Buttons, AdvOfficeButtons, ShellAPI, uCommon,
  ButtonsEx, ExtCtrls, GraphicEx, GR32_Image;

type
  TFormCleanInstallGuide4K = class(TForm)
    ImageCleanInstall: TImage32;
    LabelQuickSetupGuide: TShadowLabel;
    LabelOption_SelectArcadeEmulators_FileStatus: TShadowLabel;
    LabelOption_SelectConsoleComputerGamesFolders_FileStatus: TShadowLabel;
    Option_SelectArcadeEmulators: TAdvOfficeCheckBoxEx;
    Option_CreateArcadeGamesList: TAdvOfficeCheckBoxEx;
    Option_SelectConsoleComputerEmulators: TAdvOfficeCheckBoxEx;
    Option_SelectConsoleComputerGamesFolders: TAdvOfficeCheckBoxEx;
    Option_CreateConsoleComputerGamesList: TAdvOfficeCheckBoxEx;
    NightMode: TAdvOfficeCheckBoxEx;
    UseAlternateFrontendIcons: TAdvOfficeCheckBoxEx;
    ButtonSkip: TBitBtnEx;
    ButtonOk: TBitBtnEx;
    ButtonCancel: TBitBtnEx;
    ShadowLabel1: TShadowLabel;
    ShadowLabel2: TShadowLabel;
    ShadowLabel3: TShadowLabel;
    AdvOfficeCheckBoxEx1: TAdvOfficeCheckBoxEx;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormCleanInstallGuide4K: TFormCleanInstallGuide4K;

implementation

uses uMain;

{$R *.dfm}



end.
