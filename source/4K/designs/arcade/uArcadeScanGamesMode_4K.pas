unit uArcadeScanGamesMode_4K;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  StdCtrls, Buttons, PanelEx, AdvOfficeButtons, ShellAPI,
  ShadowLabel, ExtCtrls, AdvGroupBox, ButtonsEx;

type
  TFormArcadeScanGamesMode4K = class(TForm)
    PanelBottom: TPanelEx;
    ButtonOk: TBitBtnEx;
    ScanModeBox: TAdvGroupBoxEx;
    ScanModeIcon: TImage;
    FullScan: TAdvOfficeRadioButtonEx;
    QuickScan: TAdvOfficeRadioButtonEx;
    ForceAllAvailable: TAdvOfficeRadioButtonEx;
    ScanMAMESetsBox: TAdvGroupBoxEx;
    ImageScanMAME: TImage;
    ScanMAMEAllSets: TAdvOfficeRadioButtonEx;
    ScanMAMEArcadeMachines: TAdvOfficeRadioButtonEx;
    ScanMAMESoftwareListGames: TAdvOfficeRadioButtonEx;
    LabelFullScan: TShadowLabel;
    LabelQuickScan: TShadowLabel;
    LabelForceAllAvailable: TShadowLabel;
    LabelImportantTips: TShadowLabel;
    MAMESoftwareListBox: TAdvGroupBoxEx;
    LabelMAMESoftwareList_Disabled: TShadowLabel;
    LabelMAMESoftwareList_EnabledUpdate: TShadowLabel;
    LabelMAMESoftwareList_EnabledOverwrite: TShadowLabel;
    ImageMAMESoftwareList: TImage;
    LabelMAMESoftwareListBox_BlankLine: TShape;
    LabelMAMESoftwareListBox: TShadowLabel;
    MAMESoftwareList_Disabled: TAdvOfficeRadioButtonEx;
    MAMESoftwareList_EnabledUpdate: TAdvOfficeRadioButtonEx;
    MAMESoftwareList_EnabledOverwrite: TAdvOfficeRadioButtonEx;
    ButtonHelpCreateMAMESoftwareListGames: TBitBtnEx;
    LabelCustomizeMAMESoftwareList: TShadowLabel;
    AddMAMEDeviceSetWithNoROMs: TAdvOfficeCheckBoxEx;
    LabelMAMESoftwareListBox_BlankLine2: TShape;
    ButtonCancel: TBitBtnEx;
    ScanModeCurrentTaskOnly: TAdvOfficeCheckBoxEx;
    LabelMultiSelect: TShadowLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormArcadeScanGamesMode4K: TFormArcadeScanGamesMode4K;

implementation

uses uCommon, uCommonCustom, uMain;

{$R *.dfm}


end.
