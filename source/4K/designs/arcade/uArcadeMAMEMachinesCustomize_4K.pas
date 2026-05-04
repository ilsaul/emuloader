unit uArcadeMAMEMachinesCustomize_4K;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  IniFiles, uCommon, uCommonCustom, MPCommonObjects, MPCommonUtilities, EasyListview,
  AdvOfficeButtons, StdCtrls, Buttons, PanelEx, ShadowLabel, ImgList,
  ExtCtrls, Menus, BarMenus, ButtonsEx;

type
  TFormArcadeMAMEMachinesCustomize4K = class(TForm)
    BottomBar: TPanelEx;
    ButtonYes: TBitBtnEx;
    ButtonNo: TBitBtnEx;
    ButtonResetToCurrent: TBitBtnEx;
    CheckAll: TAdvOfficeCheckBoxEx;
    LabelTotalMachinesList: TShadowLabel;
    FilterShowUncheckedOnly: TAdvOfficeCheckBoxEx;
    IL_MediaType: TImageList;
    TopBar: TPanelEx;
    SystemIcon: TImage;
    LabelSystemTitle: TShadowLabel;
    EmulatorIcon: TImage;
    LabelEmulatorVersion: TShadowLabel;
    FilterShowParentSetsOnly: TAdvOfficeCheckBoxEx;
    PopupMachines: TBcBarPopupMenu;
    PopupCheckMultipleSelected: TMenuItem;
    PopupUncheckMultipleSelected: TMenuItem;
    MachinesListEditor: TEasyListview;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormArcadeMAMEMachinesCustomize4K: TFormArcadeMAMEMachinesCustomize4K;

implementation

uses uMain, uStatus;

{$R *.dfm}



end.
