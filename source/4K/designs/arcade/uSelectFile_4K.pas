unit uSelectFile_4K;

interface

uses
  Windows, SysUtils, Classes, Graphics, Controls, Forms,
  StdCtrls, ComCtrls, ExtCtrls, IniFiles,
  MPCommonObjects, MPCommonUtilities, EasyListview,
  ShadowLabel, Buttons, PanelEx, EditEx, ButtonsEx;

type
  TFormSelectFile4K = class(TForm)
    FilesFolder: TShadowLabel;
    FilesListView: TEasyListview;
    BottomBar: TPanelEx;
    LabelShortcuts: TShadowLabel;
    ButtonOk: TBitBtnEx;
    ButtonCancel: TBitBtnEx;
    TopBar: TPanelEx;
    SystemIcon: TImage;
    LabelGameTitle: TShadowLabel;
    LabelEmulatorVersion: TShadowLabel;
    NewFilename: TEditEx;
    LabelNewFilename: TShadowLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormSelectFile4K: TFormSelectFile4K;

implementation

{$R *.dfm}

uses uMain, uCommon;



end.
