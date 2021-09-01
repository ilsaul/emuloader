unit uConsCompSelectEmulator_4K;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  StdCtrls, uCommon, uCommonCustom, ImgList, MPCommonObjects, EasyListview,
  MPCommonUtilities, ExtCtrls, Buttons, AdvOfficeButtons, PanelEx,
  ShadowLabel, ButtonsEx;

type
  TFormConsCompSelectEmulator4K = class(TForm)
    EmulatorsList: TEasyListview;
    IL_EmulatorIcon: TImageList;
    IL_Systems: TImageList;
    PanelBottom: TPanelEx;
    LabelTips: TShadowLabel;
    ButtonOk: TBitBtnEx;
    ButtonCancel: TBitBtnEx;
    UseSmallIcons: TAdvOfficeCheckBoxEx;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormConsCompSelectEmulator4K: TFormConsCompSelectEmulator4K;

implementation

uses uMain;

{$R *.dfm}


end.
