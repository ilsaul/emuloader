unit uFiltersDriverStatus;

interface

uses
  Windows, SysUtils, Classes, Graphics, Controls, Forms,
  StdCtrls, Buttons, PanelEx, AdvGroupBox, AdvOfficeButtons,
  ExtCtrls;

type
  TFormFiltersDriverStatus = class(TForm)
    PanelEx1: TPanelEx;
    ButtonOk: TBitBtn;
    ButtonCancel: TBitBtn;
    LabelSelectCategory: TLabel;
    LabelFilterStatus: TLabel;
    IconListAll: TImage;
    IconGoodImperfect: TImage;
    IconImperfect: TImage;
    ListAll: TAdvOfficeRadioButton;
    DriverStatusCategory: TComboBox;
    GoodImperfect: TAdvOfficeRadioButton;
    Imperfect: TAdvOfficeRadioButton;
    Preliminary: TAdvOfficeRadioButton;
    Good: TAdvOfficeRadioButton;
    IconGood: TImage;
    IconPreliminary: TImage;
    procedure ListAllClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormFiltersDriverStatus: TFormFiltersDriverStatus;

implementation

{$R *.dfm}

procedure TFormFiltersDriverStatus.ListAllClick(Sender: TObject);
begin
  LabelFilterStatus.Tag:= TAdvOfficeRadioButton(Sender).Tag;
end;

procedure TFormFiltersDriverStatus.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #27 then
     ButtonCancel.Click;
end;

end.
