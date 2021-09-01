unit uColumnsEditor_4K;

interface

uses
  Windows, SysUtils, Classes, Graphics, Controls, Forms,
  StdCtrls, ExtCtrls, ComCtrls, IniFiles, Buttons,
  MPCommonObjects, MPCommonUtilities, EasyListview, ImgList, PanelEx,
  ShadowLabel, ButtonsEx;

type
  TFormColumnsEditor4K = class(TForm)
    ButtonUp: TBitBtnEx;
    ButtonDown: TBitBtnEx;
    ButtonEditWidth: TBitBtnEx;
    ButtonReloadProfile: TBitBtnEx;
    ButtonDefault: TBitBtnEx;
    ButtonDefaultSize: TBitBtnEx;
    ButtonResetSize: TBitBtnEx;
    ButtonSizeDecrease: TBitBtnEx;
    ButtonSizeIncrease: TBitBtnEx;
    LabelButtonUpDown: TShadowLabel;
    LabelButtonEditWidth: TShadowLabel;
    LabelButtonSize: TShadowLabel;
    LabelButtonDefaultSize: TShadowLabel;
    LabelButtonResetSize: TShadowLabel;
    LabelButtonReloadProfileDefaultSettings: TShadowLabel;
    PanelBottom: TPanelEx;
    ButtonOk: TBitBtnEx;
    ButtonCancel: TBitBtnEx;
    PanelTitleTip: TPanelEx;
    LabelTitleTip: TShadowLabel;
    LabelToggleVisibility: TShadowLabel;
    LabelButtonSetDefaultAll: TShadowLabel;
    LabelTips: TShadowLabel;
    ButtonCustomizeColumnHeaderFont: TBitBtnEx;
    ButtonCustomizeColumnHeaderFontSetDefault: TBitBtnEx;
    ColumnsListView: TEasyListview;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormColumnsEditor4K: TFormColumnsEditor4K;

implementation

uses uMain, uCommon, uPreferences;

{$R *.DFM}


end.
