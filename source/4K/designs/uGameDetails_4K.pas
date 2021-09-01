unit uGameDetails_4K;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  StdCtrls, ExtCtrls, ComCtrls, IniFiles, ToolWin, Buttons,
  uCommon, uCommonCustom, MPCommonObjects, MPCommonUtilities, EasyListview, ShadowLabel,
  PanelEx, // Internal error: U752 :_((( line '8'
  GraphicEx, Dialogs, ImgList, ZipForge, SevenZip;

type
  TFormGameDetails4K = class(TForm)
    TopBar: TPanelEx;
    LabelYear: TShadowLabel;
    LabelYearValue: TShadowLabel;
    SystemIcon: TImage;
    LabelGameTitle: TShadowLabel;
    GameIcon: TImage;
    LabelEmulatorVersion: TShadowLabel;
    LabelScanMode: TShadowLabel;
    ROMsListView: TEasyListview;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormGameDetails4K: TFormGameDetails4K;

implementation

uses uMain;

{$R *.DFM}

end.

