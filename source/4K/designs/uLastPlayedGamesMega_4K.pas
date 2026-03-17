unit uLastPlayedGamesMega_4K;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  StdCtrls, ComCtrls, ImgList, MPCommonObjects, MPCommonUtilities,
  EasyListview, ExtCtrls, PanelEx, Buttons, ShadowLabel, IniFiles,
  SplitterEx, Menus, BarMenus, ButtonsEx;

type
  TFormLastPlayedGamesMega4K = class(TForm)
    PanelGames: TPanelEx;
    LastPlayedList: TEasyListview;
    IL_Systems: TImageList;
    PanelBottom: TPanelEx;
    ButtonSelectGame: TBitBtnEx;
    ButtonClose: TBitBtnEx;
    PanelPlayedListHeader: TPanelEx;
    LabelTitleCaption: TShadowLabel;
    LabelLastPlayed: TShadowLabel;
    LabelTotalPlaytime: TShadowLabel;
    PanelSystems: TPanelEx;
    Systems: TEasyListview;
    LabelSoftwareNameCaption: TShadowLabel;
    ButtonSelectGameExit: TBitBtnEx;
    PopupLastPlayed: TBcBarPopupMenu;
    PopupDetailsView: TMenuItem;
    PopupTilesView: TMenuItem;
    N1: TMenuItem;
    LabelGameNameCaption: TShadowLabel;
    PanelSystemsTitle: TPanelEx;
    LabelSystemTitle: TShadowLabel;
    LabelSystemType: TShadowLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormLastPlayedGamesMega4K: TFormLastPlayedGamesMega4K;

implementation

uses uCommon, uCommonCustom, uMain;

{$R *.dfm}


end.
