unit uMAMEKeysInfo;

interface

uses
  Windows, SysUtils, Classes, Graphics, Controls, Forms,
  ExtCtrls, StdCtrls, ComCtrls;

type
  TFormMAMEKeysInfo = class(TForm)
    TopImage: TImage;
    LabelCaption: TLabel;
    Keys: TMemo;
    BottomLine: TBevel;
    ButtonClose: TButton;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure ButtonCloseClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormMAMEKeysInfo: TFormMAMEKeysInfo;

implementation

{$R *.DFM}

procedure TFormMAMEKeysInfo.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if ((Key = #27) or (Key = #13)) then
     Close;
end;

procedure TFormMAMEKeysInfo.ButtonCloseClick(Sender: TObject);
begin
  Close;
end;

end.
