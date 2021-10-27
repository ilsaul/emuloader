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
  protected
    procedure CreateParams(var Params: TCreateParams); override;
  public
    { Public declarations }
  end;

var
  FormApplyFilterMsgBox: TFormApplyFilterMsgBox;

implementation

{$R *.dfm}

procedure TFormApplyFilterMsgBox.CreateParams(var Params: TCreateParams);
begin
  inherited;
  Params.Style:= Params.Style or WS_POPUP; // to prevent FormStatus on top of other applications
  //Params.WndParent:= Application.MainForm.Handle;
  //Params.ExStyle:= Params.ExStyle or WS_EX_APPWINDOW; // this makes FormStatus show on a separate taskbar button

  ////Params.WndParent := 0; // this makes FormStatus show on a separate taskbar button
end;

procedure TFormApplyFilterMsgBox.PanelBackgroundMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
const
   sc_DragMove = $f012;
begin
  ReleaseCapture;
  FormApplyFilterMsgBox.Perform(wm_SysCommand, sc_DragMove, 0);
end;

end.
