unit uScanGamesMode;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, PanelEx, AdvOfficeButtons, ShellAPI;

type
  TFormScanGamesMode = class(TForm)
    LabelSelectMode: TLabel;
    FullScan: TAdvOfficeRadioButton;
    QuickScan: TAdvOfficeRadioButton;
    ForceAllAvailable: TAdvOfficeRadioButton;
    PanelEx1: TPanelEx;
    ButtonOk: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    LabelClrMAME: TLabel;
    LabelRomCenter: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    ButtonHelp: TBitBtn;
    procedure LabelClrMAMEMouseEnter(Sender: TObject);
    procedure LabelClrMAMEMouseLeave(Sender: TObject);
    procedure LabelClrMAMEClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormScanGamesMode: TFormScanGamesMode;

implementation

uses uMain;

{$R *.dfm}

procedure TFormScanGamesMode.LabelClrMAMEMouseEnter(Sender: TObject);
begin
  TLabel(Sender).Font.Color:= clBlue;
  TLabel(Sender).Font.Style:= [fsUnderline];
end;

procedure TFormScanGamesMode.LabelClrMAMEMouseLeave(Sender: TObject);
begin
  TLabel(Sender).Font.Color:= $00a65300;
  TLabel(Sender).Font.Style:= [fsBold];
end;

procedure TFormScanGamesMode.LabelClrMAMEClick(Sender: TObject);
begin
  ShellExecute(Handle, 'open', PChar(TLabel(Sender).Hint), nil, nil, SW_SHOWNORMAL);
end;

procedure TFormScanGamesMode.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key in [#13, #27] then
     Close;
end;

end.
