unit uConsCompSystemsEditor_4K;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, uCommon, uCommonCustom,
  Dialogs, ImgList, MPCommonObjects, MPCommonUtilities, EasyListview, IniFiles,
  ExtCtrls, SplitterEx, StdCtrls, PanelEx, Buttons, ShadowLabel, Menus,
  BarMenus, ComCtrls, ToolWin, AdvOfficeButtons, EditEx, ButtonsEx;

type
  TFormConsCompSystemsEditor4K = class(TForm)
    IL_Systems: TImageList;
    Splitter: TSplitterEx;
    PanelSoftwareLists: TPanelEx;
    PanelAssignedSoftwareList: TPanelEx;
    SplitterMainSoftware: TSplitterEx;
    PanelRemainingSoftwareList: TPanelEx;
    SoftListFilesNotAssigned: TEasyListview;
    PanelBottom: TPanelEx;
    ButtonOk: TBitBtnEx;
    ButtonCancel: TBitBtnEx;
    PanelSystems: TPanelEx;
    Systems: TEasyListview;
    PopupSoftList: TBcBarPopupMenu;
    PopupMoveSelectedToDestination: TMenuItem;
    SoftListAssignedToSystem: TEasyListview;
    IL_MediaType: TImageList;
    SystemsHideScrollBarArea: TAdvOfficeCheckBoxEx;
    LabelSoftListAssignedToSystem: TShadowLabel;
    LabelSoftListFilesNotAssigned: TShadowLabel;
    ShowBiggerGamesListFont: TAdvOfficeCheckBoxEx;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormConsCompSystemsEditor4K: TFormConsCompSystemsEditor4K;

implementation

uses uMain, uStatus;

{$R *.dfm}


end.
