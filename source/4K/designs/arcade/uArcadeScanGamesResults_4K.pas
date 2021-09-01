unit uArcadeScanGamesResults_4K;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  StdCtrls, ImgList, IniFiles, ComCtrls, uCommon, MPCommonObjects,
  MPCommonUtilities, EasyListview, ExtCtrls, ToolWin, Buttons, ShadowLabel,
  PanelEx, Menus, BarMenus, EditEx, ColorBoxEx, ButtonsEx, AdvOfficeButtons;

type
  TFormArcadeScanGamesResults4K = class(TForm)
    ROMsListView: TEasyListview;
    PanelTop: TPanelEx;
    SystemIcon: TImage;
    LabelEmulatorVersion: TShadowLabel;
    LabelGamesListVersion: TShadowLabel;
    SystemSelectorToolBar: TToolBar;
    sysMAME: TToolButton;
    sysSupermodelSEGAModel3: TToolButton;
    sysDemul: TToolButton;
    sysHBMAME: TToolButton;
    sysDICE: TToolButton;
    sysSEGAModel2: TToolButton;
    sysZiNc: TToolButton;
    LabelTotalGames: TShadowLabel;
    MAMEMachinesFilterIcon: TImage;
    MAMEMachinesFilter: TComboBox2Ex;
    ButtonToggleTree: TBitBtnEx;
    SearchBarEdit: TEditEx;
    SearchBarToolBar: TToolBar;
    ButtonFilterTitleApply_ToolBar: TToolButton;
    LabelSearchBar: TShadowLabel;
    SetsFilter_CHDs: TAdvOfficeCheckBoxEx;
    SetsFilter_DeviceROMs: TAdvOfficeCheckBoxEx;
    SetsFilter_BiosROMs: TAdvOfficeCheckBoxEx;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormArcadeScanGamesResults4K: TFormArcadeScanGamesResults4K;

implementation

uses uMain, uStatus;

{$R *.dfm}



end.


