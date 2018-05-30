unit uApplyFilterMsgBox;

interface

uses
  Windows, SysUtils, Classes, Graphics, Controls, Forms, StdCtrls,
  ShadowLabel, PanelEx, ExtCtrls;

type
  TFormApplyFilterMsgBox = class(TForm)
    PanelBackground: TPanelEx;
    LabelBoxMessageTitle: TShadowLabel;
    LabelBoxMessage: TShadowLabel;
    MsgIcon: TImage;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormApplyFilterMsgBox: TFormApplyFilterMsgBox;

implementation

{$R *.dfm}

end.
