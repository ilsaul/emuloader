unit uProgress;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Gauges;

type
  TfrmProgress = class(TForm)
    gFile: TGauge;
    btCancel: TButton;
    gOverall: TGauge;
    lbFile: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure btCancelClick(Sender: TObject);
  private
    { Private declarations }
  public
    bCancel: Boolean;
    { Public declarations }
  end;

var
  frmProgress: TfrmProgress;

implementation

{$R *.dfm}

procedure TfrmProgress.FormCreate(Sender: TObject);
begin
 bCancel := False;
end;

procedure TfrmProgress.btCancelClick(Sender: TObject);
begin
 bCancel := True;
end;

end.
