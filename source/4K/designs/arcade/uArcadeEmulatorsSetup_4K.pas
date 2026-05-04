unit uArcadeEmulatorsSetup_4K;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  StdCtrls, ExtCtrls, ComCtrls, IniFiles, Buttons, FileCtrl,
  MPCommonObjects, EasyListview, uCommon, ImgList, ToolWin,
  ShadowLabel, PanelEx, AdvOfficeButtons, ShellAPI, EditEx, ButtonsEx;

type
  TFormArcadeEmulatorsSetup4K = class(TForm)
    PanelSystemsSelect: TPanelEx;
    SystemSelector: TEasyListview;
    PanelBottom: TPanelEx;
    ButtonOk: TBitBtnEx;
    ButtonCancel: TBitBtnEx;
    ButtonSetOptions: TBitBtnEx;
    ButtonUpdateSystem: TBitBtnEx;
    ButtonClearSystem: TBitBtnEx;
    IL_Systems: TImageList;
    UseLargeIcons: TAdvOfficeCheckBoxEx;
    PanelEmulatorDetails: TPanelEx;
    LabelArcade_versioninfo: TShadowLabel;
    LabelAlterMAME1: TShadowLabel;
    LabelAlterMAME1_versioninfo: TShadowLabel;
    LabelArcade_exec: TShadowLabel;
    LabelAlterMAME1_Autorun: TShadowLabel;
    LabelAlterMAME1_Tip1: TShadowLabel;
    ButtonBrowseArcade_exec: TBitBtnEx;
    Arcade_versioninfo: TEditEx;
    AlterMAME1_exec: TEditEx;
    ButtonBrowseAlterMAME1: TBitBtnEx;
    ButtonClearAlterMAME1: TBitBtnEx;
    ButtonHelpAlterMAME: TBitBtnEx;
    AlterMAME1_Autorun: TAdvOfficeCheckBoxEx;
    AlterMAME1_versioninfo: TEditEx;
    PanelMAMEEmulatorsText: TPanelEx;
    LabelMAMELink_Tabs: TShadowLabel;
    LabelMAMELink1: TShadowLabel;
    LabelMAMELink3: TShadowLabel;
    LabelMAMELink4: TShadowLabel;
    LabelMAMELink2: TShadowLabel;
    Arcade_exec: TEditEx;
    LabelAlterMAME2: TShadowLabel;
    LabelAlterMAME2_versioninfo: TShadowLabel;
    LabelAlterMAME2_Tip1: TShadowLabel;
    AlterMAME2_exec: TEditEx;
    ButtonBrowseAlterMAME2: TBitBtnEx;
    ButtonClearAlterMAME2: TBitBtnEx;
    AlterMAME2_versioninfo: TEditEx;
    IconEmulator: TImage;
    IconEmulatorAlterMAME1: TImage;
    IconEmulatorAlterMAME2: TImage;
    LabelAlterMAME2_Autorun: TShadowLabel;
    AlterMAME2_Autorun: TAdvOfficeCheckBoxEx;
    PanelSystemTitleBottom: TPanelEx;
    PanelSystemTitle: TPanelEx;
    LabelSystemTitle: TShadowLabel;
    ButtonClearArcade_exec: TBitBtnEx;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormArcadeEmulatorsSetup4K: TFormArcadeEmulatorsSetup4K;

implementation

uses uMain, uPreferences, uStatus;

{$R *.DFM}



end.

