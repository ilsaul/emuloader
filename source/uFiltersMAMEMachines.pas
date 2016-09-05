unit uFiltersMAMEMachines;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  StdCtrls, Buttons, PanelEx, AdvOfficeButtons, ShellAPI;

type
  TFormFiltersMAMEMachines = class(TForm)
    PanelEx1: TPanelEx;
    ButtonOk: TBitBtn;
    ButtonCancel: TBitBtn;
    ArcadeGames: TAdvOfficeCheckBox;
    MAMEMachinesNoSoftwareLists: TAdvOfficeCheckBox;
    SoftwareListGames: TAdvOfficeCheckBox;
    LabelSelectMode: TLabel;
    LabelArcadeGames: TLabel;
    LabelCategoryIniForMESS: TLabel;
    LabelMAMEMachinesNoSoftwareLists: TLabel;
    LabelMAMEMachinesIniMESSRequired: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    LabelProgettoSNAPS: TLabel;
    Label3: TLabel;
    MAMEMachinesWithSoftwareLists: TAdvOfficeCheckBox;
    LabelMAMEMachinesWithSoftwareLists: TLabel;
    EnableMAMEMachinesSidePanel: TAdvOfficeCheckBox;
    Label1: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    procedure LabelCategoryIniForMESSMouseEnter(Sender: TObject);
    procedure LabelCategoryIniForMESSClick(Sender: TObject);
    procedure LabelCategoryIniForMESSMouseLeave(Sender: TObject);
    procedure ButtonOkClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
    mResult: Integer;
  end;

var
  FormFiltersMAMEMachines: TFormFiltersMAMEMachines;

implementation

{$R *.dfm}

procedure TFormFiltersMAMEMachines.LabelCategoryIniForMESSMouseEnter(Sender: TObject);
begin
  TLabel(Sender).Font.Color:= clBlue;
  TLabel(Sender).Font.Style:= [fsBold, fsUnderline];
end;

procedure TFormFiltersMAMEMachines.LabelCategoryIniForMESSMouseLeave(Sender: TObject);
begin
  TLabel(Sender).Font.Color:= clNavy;
  TLabel(Sender).Font.Style:= [fsBold];
end;

procedure TFormFiltersMAMEMachines.LabelCategoryIniForMESSClick(Sender: TObject);
begin
  ShellExecute(Handle, 'open', PChar(TLabel(Sender).Hint), nil, nil, SW_SHOWNORMAL);
end;

procedure TFormFiltersMAMEMachines.ButtonOkClick(Sender: TObject);
begin
  mResult:= TBitBtn(Sender).ModalResult;
end;

procedure TFormFiltersMAMEMachines.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #27 then
     ButtonCancel.Click;
end;

end.
