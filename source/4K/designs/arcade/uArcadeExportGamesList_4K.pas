unit uArcadeExportGamesList_4K;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, PanelEx, AdvOfficeButtons, MPCommonObjects,
  EasyListview, AdvGroupBox, IniFiles, ShadowLabel, ButtonsEx;

type
  TFormArcadeExportGamesList4K = class(TForm)
    BottomBar: TPanelEx;
    ButtonApplyAndExit: TBitBtnEx;
    ButtonCancel: TBitBtnEx;
    GroupExportOptionsAllGames: TAdvGroupBoxEx;
    ExportOption_ArcadeGames: TAdvOfficeCheckBoxEx;
    ExportOption_NonArcadeMAMEMachines: TAdvOfficeCheckBoxEx;
    LabelExportOption_MAMESoftwareListGames: TShadowLabel;
    ExportOption_MAMESoftwareListGames: TAdvOfficeCheckBoxEx;
    ExportOption_MAME: TAdvOfficeCheckBoxEx;
    ExportOption_Supermodel3: TAdvOfficeCheckBoxEx;
    ExportOption_Daphne: TAdvOfficeCheckBoxEx;
    ExportOption_Demul: TAdvOfficeCheckBoxEx;
    ExportOption_HBMAME: TAdvOfficeCheckBoxEx;
    ExportOption_DICE: TAdvOfficeCheckBoxEx;
    ExportOption_SegaModel2: TAdvOfficeCheckBoxEx;
    ExportOption_ZiNc: TAdvOfficeCheckBoxEx;
    GroupMAMEContentManagerPlus: TAdvGroupBoxEx;
    MCMPlus_MAME: TAdvOfficeCheckBoxEx;
    MCMPlus_HBMAME: TAdvOfficeCheckBoxEx;
    GroupExportOptionsGameColumnsFullFormat: TAdvGroupBoxEx;
    GameInfoListToExport: TEasyListview;
    GameInfoListToExport_MoveUp: TBitBtnEx;
    GameInfoListToExport_MoveDown: TBitBtnEx;
    GameInfoToExport_MicrosoftExcelFormat: TAdvOfficeCheckBoxEx;
    ButtonHelp_GameInfoToExport_MicrosoftExcelFormat: TBitBtnEx;
    ButtonApply: TBitBtnEx;
    ButtonHelp: TBitBtnEx;
    GameInfoListToExport_Reset: TBitBtnEx;
    GameInfoListToExport_Default: TBitBtnEx;
    GameInfoToExport_UseGamesListVisibleColumns: TAdvOfficeCheckBoxEx;
    TopBar: TPanelEx;
    LabelSelectMode: TShadowLabel;
    PanelExportList: TPanelEx;
    ExportList: TEasyListview;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormArcadeExportGamesList4K: TFormArcadeExportGamesList4K;

implementation

uses uMain, uCommon, uApplyFilterMsgBox;

{$R *.dfm}


end.
