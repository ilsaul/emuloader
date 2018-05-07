unit uApplyFilterMsgBox;

interface

uses
  Windows, SysUtils, Classes, Graphics, Controls, Forms, StdCtrls,
  ShadowLabel, PanelEx;

type
  TFormApplyFilterMsgBox = class(TForm)
    PanelBackground: TPanelEx;
    LabelMsgGroupedView: TShadowLabel;
    LabelBoxMessageTitle: TShadowLabel;
    LabelBoxMessage: TShadowLabel;
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
