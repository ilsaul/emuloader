unit uSelectDirectory_4K;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  StdCtrls, ComCtrls, ShellCtrls, ExtCtrls, uxTheme,
  ShadowLabel, Buttons, AdvOfficeButtons, PanelEx, ButtonsEx;

type
  TFormSelectDirectory4K = class(TForm)
    ShellTree: TShellTreeView;
    TopBar: TPanelEx;
    LabelTitle: TShadowLabel;
    MessageIcon: TImage;
    BottomBar: TPanelEx;
    AddSubFolders: TAdvOfficeCheckBoxEx;
    ButtonOk: TBitBtnEx;
    ButtonCancel: TBitBtnEx;
    LabelSelectedPath: TShadowLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormSelectDirectory4K: TFormSelectDirectory4K;

implementation

uses uCommon, uMain;

{$R *.dfm}



end.
