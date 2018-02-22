unit uArcadeMAMu_ExcludedList;

interface

uses
  Windows, Classes, Graphics, Controls, Forms, StdCtrls, ComCtrls,
  ExtCtrls, Buttons;

type
  TFormArcadeMAMu_ExcludedList = class(TForm)
    Cancel: TBitBtn;
    ButtonOk: TBitBtn;
    LabelInfo: TLabel;
    ExcludedFiles: TMemo;
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormArcadeMAMu_ExcludedList: TFormArcadeMAMu_ExcludedList;

implementation

{$R *.dfm}

procedure TFormArcadeMAMu_ExcludedList.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if ModalResult = mrOk then
     CanClose:= ExcludedFiles.Lines.Count > 0;
end;

end.
