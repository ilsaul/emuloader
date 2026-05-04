unit uNightModeRGBQuickEdit_4K;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  StdCtrls, ButtonsEx, ExtCtrls, EditEx, ShadowLabel, XiTrackBar, PanelEx,
  AdvOfficeButtons;

type
  TFormNightModeRGBQuickEdit4K = class(TForm)
    NightModeRGBQuickEdit_RedLabel: TShadowLabel;
    NightModeRGBQuickEdit_Red: TEditEx;
    NightModeRGBQuickEdit_GreenLabel: TShadowLabel;
    NightModeRGBQuickEdit_Green: TEditEx;
    NightModeRGBQuickEdit_BlueLabel: TShadowLabel;
    NightModeRGBQuickEdit_Blue: TEditEx;
    NightModeRGBQuickEdit_ButtonApply: TBitBtnEx;
    NightModeColorBoxExHint: TShadowLabel;
    NightModeRGBQuickEdit_HexLabel2: TShadowLabel;
    NightModeRGBQuickEdit_ButtonAbort: TBitBtnEx;
    NightModeRGBQuickEdit_ColorSampleLabel: TShadowLabel;
    NightModeRGBQuickEdit_ColorSample_CurrentLabel: TShadowLabel;
    TrackBarColorR: TXiTrackBar;
    TrackBarColorG: TXiTrackBar;
    TrackBarColorB: TXiTrackBar;
    TrackBarColorR_ButtonDec: TBitBtnEx;
    TrackBarColorR_ButtonInc: TBitBtnEx;
    TrackBarColorG_ButtonDec: TBitBtnEx;
    TrackBarColorG_ButtonInc: TBitBtnEx;
    TrackBarColorB_ButtonDec: TBitBtnEx;
    TrackBarColorB_ButtonInc: TBitBtnEx;
    NightModeRGBQuickEdit_ColorSample: TPanelEx;
    NightModeRGBQuickEdit_ColorSample_Current: TPanelEx;
    NightModeRGBQuickEdit_HexLabel: TShadowLabel;
    NightModeKeysHintLabel: TShadowLabel;
    TrackBarColorB_Label: TShadowLabel;
    TrackBarColorR_Label: TShadowLabel;
    TrackBarColorG_Label: TShadowLabel;
    LockSliders: TAdvOfficeCheckBoxEx;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormNightModeRGBQuickEdit4K: TFormNightModeRGBQuickEdit4K;

implementation

{$R *.dfm}


end.
