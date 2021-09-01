unit uDeleteMultipleGamesViewFiles_4K;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, MPCommonObjects, EasyListview, ExtCtrls,
  ImgList, IniFiles, FileCtrl, PanelEx, ShadowLabel, uCommon, uCommonCustom,
  Buttons, ButtonsEx;

type
  TFormDeleteMultipleGamesViewFiles4K = class(TForm)
    FilesListView: TEasyListview;
    IL_MediaType: TImageList;
    BottomBar: TPanelEx;
    LabelTotalItems: TShadowLabel;
    ButtonShowFileTypes: TBitBtnEx;
    LabelGhostedFiles: TShadowLabel;
    ButtonClose: TBitBtnEx;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormDeleteMultipleGamesViewFiles4K: TFormDeleteMultipleGamesViewFiles4K;

implementation

uses uMain, uStatus, uDeleteMultipleGamesFiles;

{$R *.dfm}


end.
