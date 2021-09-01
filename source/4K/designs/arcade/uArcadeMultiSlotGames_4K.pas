unit uArcadeMultiSlotGames_4K;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  StdCtrls, Buttons, MPCommonObjects, EasyListview, MPCommonUtilities,
  PanelEx, IniFiles, ExtCtrls, Menus, BarMenus, ShadowLabel, ButtonsEx;

type
  TFormArcadeMultiSlotGames4K = class(TForm)
    PanelBottom: TPanelEx;
    ButtonOk: TBitBtnEx;
    ButtonNo: TBitBtnEx;
    ButtonUp: TBitBtnEx;
    ButtonDown: TBitBtnEx;
    ButtonRemoveFromList: TBitBtnEx;
    LabelHelpText: TShadowLabel;
    PanelNeoGeoMVS: TPanelEx;
    LabelMultiSlotMachines: TShadowLabel;
    ButtonChangePanelNeoGeoMVS: TBitBtnEx;
    PanelMultiSlotMachines: TPanelEx;
    LabelMultiSlotMachinesChooseMachineToRun: TShadowLabel;
    MultiSlotMachines: TEasyListview;
    ButtonOkMultiSlotMachines: TBitBtnEx;
    LabelMultiSlotMachinesBoldDefaultMachine: TShadowLabel;
    ButtonCancelMultiSlotMachines: TBitBtnEx;
    GamesList: TEasyListview;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormArcadeMultiSlotGames4K: TFormArcadeMultiSlotGames4K;

implementation

uses uMain, uCommon;

{$R *.dfm}


end.
