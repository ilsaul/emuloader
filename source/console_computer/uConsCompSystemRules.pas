unit uConsCompSystemRules;

interface

uses
  Windows, SysUtils, Classes, Graphics, Controls, Forms,
  StdCtrls, Buttons, PanelEx, ComCtrls, ShadowLabel, RichEditURL,
  ShellApi, ExtCtrls;

type
  TFormConsCompSystemRules = class(TForm)
    PanelTop: TPanelEx;
    RulesFile: TRichEditURL;
    LabelTitle: TShadowLabel;
    SystemIcon: TImage;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure RulesFileURLClick(Sender: TObject; const URL: String);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormConsCompSystemRules: TFormConsCompSystemRules;

implementation

{$R *.dfm}

procedure TFormConsCompSystemRules.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #27 then
     Close;
end;

procedure TFormConsCompSystemRules.RulesFileURLClick(Sender: TObject;
  const URL: String);
begin
  ShellExecute(Handle, 'open', PChar(URL), nil, nil, SW_SHOWNORMAL);
end;

end.
