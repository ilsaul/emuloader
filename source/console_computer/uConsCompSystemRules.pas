unit uConsCompSystemRules;

interface

uses
  Windows, SysUtils, Classes, Graphics, Controls, Forms,
  StdCtrls, Buttons, PanelEx, ComCtrls, ShadowLabel,
  ShellApi, ExtCtrls, TntComCtrls;

type
  TFormConsCompSystemRules = class(TForm)
    PanelTop: TPanelEx;
    LabelTitle: TShadowLabel;
    SystemIcon: TImage;
    RulesFileW: TTntRichEdit;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure RulesFileWURLClick(Sender: TObject; const URL: WideString);
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

procedure TFormConsCompSystemRules.RulesFileWURLClick(Sender: TObject;
  const URL: WideString);
begin
  ShellExecuteW(Handle, 'open', PWideChar(URL), nil, nil, SW_SHOWNORMAL);
end;

end.
