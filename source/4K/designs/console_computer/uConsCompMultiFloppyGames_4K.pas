unit uConsCompMultiFloppyGames_4K;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, MPCommonObjects, EasyListview, PanelEx,
  ImgList, ShadowLabel, ExtCtrls, ButtonsEx;

type
  TFormConsCompMultiFloppyGames4K = class(TForm)
    PanelBottom: TPanelEx;
    ButtonOk: TBitBtnEx;
    ButtonNo: TBitBtnEx;
    IL_LoadMultiFloppy: TImageList;
    TopBar: TPanelEx;
    SystemIcon: TImage;
    LabelSystemTitle: TShadowLabel;
    LabelEmulatorDetails: TShadowLabel;
    EmulatorIcon: TImage;
    IL_EmulatorIcon: TImageList;
    LabelTotalFloppyDisks: TShadowLabel;
    ButtonUp: TBitBtnEx;
    ButtonDown: TBitBtnEx;
    ButtonRemoveFromList: TBitBtnEx;
    GamesList: TEasyListview;
    LabelWinVICE: TShadowLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormConsCompMultiFloppyGames4K: TFormConsCompMultiFloppyGames4K;

implementation

uses uMain, uCommon;

{$R *.dfm}



end.
