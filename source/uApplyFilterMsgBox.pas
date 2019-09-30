unit uApplyFilterMsgBox;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, StdCtrls,
  ShadowLabel, PanelEx, ExtCtrls;

type
  TFormApplyFilterMsgBox = class(TForm)
    PanelBackground: TPanelEx;
    LabelBoxMessageTitle: TShadowLabel;
    LabelBoxMessage: TShadowLabel;
    MsgIcon: TImage;
    procedure PanelBackgroundMouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormApplyFilterMsgBox: TFormApplyFilterMsgBox;

implementation

{$R *.dfm}

procedure TFormApplyFilterMsgBox.PanelBackgroundMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
const
   sc_DragMove = $f012;
begin
  ReleaseCapture;
  FormApplyFilterMsgBox.Perform(wm_SysCommand, sc_DragMove, 0);
end;

end.
