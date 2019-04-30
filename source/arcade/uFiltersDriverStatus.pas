unit uFiltersDriverStatus;

interface

uses
  Windows, SysUtils, Classes, Graphics, Controls, Forms,
  StdCtrls, Buttons, PanelEx, AdvGroupBox, AdvOfficeButtons,
  ExtCtrls, ShadowLabel, ButtonsEx;

type
  TFormArcadeFiltersDriverStatus = class(TForm)
    PanelBottom: TPanelEx;
    ButtonOk: TBitBtnEx;
    ButtonCancel: TBitBtnEx;
    LabelSelectCategory: TShadowLabel;
    LabelFilterStatus: TShadowLabel;
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
  FormArcadeFiltersDriverStatus: TFormArcadeFiltersDriverStatus;

implementation

{$R *.dfm}

procedure TFormArcadeFiltersDriverStatus.ListAllClick(Sender: TObject);
begin
  LabelFilterStatus.Tag:= TAdvOfficeRadioButton(Sender).Tag;
end;

procedure TFormArcadeFiltersDriverStatus.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #27 then
     ButtonCancel.Click;
end;

end.
