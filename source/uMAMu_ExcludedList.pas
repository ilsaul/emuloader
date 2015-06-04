unit uMAMu_ExcludedList;

interface

uses
  Windows, Classes, Graphics, Controls, Forms, StdCtrls, ComCtrls,
  ExtCtrls, Buttons;

type
  TFormMAMu_ExcludedList = class(TForm)
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
  FormMAMu_ExcludedList: TFormMAMu_ExcludedList;

implementation

{$R *.dfm}

procedure TFormMAMu_ExcludedList.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if ModalResult = mrOk then
     CanClose:= ExcludedFiles.Lines.Count > 0;
end;

end.
