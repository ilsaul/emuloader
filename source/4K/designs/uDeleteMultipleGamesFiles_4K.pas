unit uDeleteMultipleGamesFiles_4K;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  StdCtrls, IniFiles, Dialogs,
  uMain, EasyListview, MPCommonObjects, MPCommonUtilities, ImgList,
  ExtCtrls, uCommon, uCommonCustom, Buttons, PanelEx, ShadowLabel,
  AdvOfficeButtons, AdvGroupBox, Menus, BarMenus, EditEx, ButtonsEx;

type
  TFormDeleteMultipleGamesFiles4K = class(TForm)
    PanelBottom: TPanelEx;
    FileTypesGroupBox: TAdvGroupBoxEx;
    DeleteROMs: TAdvOfficeCheckBoxEx;
    DeleteCHDs: TAdvOfficeCheckBoxEx;
    DeleteCFGsNVRAMs: TAdvOfficeCheckBoxEx;
    ButtonDeleteFiles: TBitBtnEx;
    ButtonNo: TBitBtnEx;
    ButtonHelp: TBitBtnEx;
    PanelDestinationFolder: TPanelEx;
    DestinationFolder: TEditEx;
    DestinationFolderLabel: TShadowLabel;
    ButtonSelectROMsFolder: TBitBtnEx;
    CopyMoveOverwriteFiles: TAdvOfficeCheckBoxEx;
    DeleteGameFromGamesList: TAdvOfficeCheckBoxEx;
    DeleteGameFileFromDisk: TAdvOfficeCheckBoxEx;
    DeleteGameConsoleComputerIcon: TImage;
    GamesList: TEasyListview;
    Panel1: TPanel;
    CopyMoveAddSystemFolder: TAdvOfficeCheckBoxEx;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormDeleteMultipleGamesFiles4K: TFormDeleteMultipleGamesFiles4K;

implementation


{$R *.dfm}



end.
