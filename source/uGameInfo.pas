unit uGameInfo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  StdCtrls, ExtCtrls, ComCtrls;

type
  TFormGameInfo = class(TForm)
    ButtonClose: TButton;
    PageControlGameInfo: TPageControl;
    TabSheetGameInfo: TTabSheet;
    LabelManufacturer: TLabel;
    Manufacturer: TLabel;
    LabelYear: TLabel;
    Year: TLabel;
    LabelSound: TLabel;
    Sound: TLabel;
    LabelFrequency: TLabel;
    Frequency: TLabel;
    LabelSamples: TLabel;
    Samples: TLabel;
    LabelControlType: TLabel;
    ControlType: TLabel;
    LabelVideo: TLabel;
    Video: TLabel;
    LabelOrientation: TLabel;
    Orientation: TLabel;
    LabelResolution: TLabel;
    Resolution: TLabel;
    LabelDriverStatus: TLabel;
    LabelSoundStatus: TLabel;
    LabelColorStatus: TLabel;
    DriverStatus: TLabel;
    SoundStatus: TLabel;
    ColorStatus: TLabel;
    LabelCategory: TLabel;
    Category: TLabel;
    LabelMerged: TLabel;
    Merged: TLabel;
    LabelName: TLabel;
    Name: TLabel;
    LabelCloneOf: TLabel;
    CloneOf: TLabel;
    LabelVersionAdded: TLabel;
    VersionAdded: TLabel;
    LabelDriver: TLabel;
    Driver: TLabel;
    ImageGameIcon: TImage;
    procedure ButtonCloseClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormGameInfo: TFormGameInfo;

implementation

uses uMain;

{$R *.DFM}

procedure TFormGameInfo.ButtonCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TFormGameInfo.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if ((Key = #27) or (Key = #13)) then
     ButtonClose.OnClick(Self);
end;

procedure TFormGameInfo.FormShow(Sender: TObject);
begin
  FormMain.UpdateGeneralAppearance(FormGameInfo);

  LabelYear.Caption:= FormMain.List.Column[FormMain.GetColumnIndex(1)].Caption;
  LabelManufacturer.Caption:= FormMain.List.Column[FormMain.GetColumnIndex(2)].Caption;
  LabelSound.Caption:= FormMain.List.Column[FormMain.GetColumnIndex(3)].Caption;
  LabelFrequency.Caption:= FormMain.List.Column[FormMain.GetColumnIndex(4)].Caption;
  LabelSamples.Caption:= FormMain.List.Column[FormMain.GetColumnIndex(5)].Caption;
  LabelControlType.Caption:= FormMain.List.Column[FormMain.GetColumnIndex(6)].Caption;
  LabelVideo.Caption:= FormMain.List.Column[FormMain.GetColumnIndex(7)].Caption;
  LabelOrientation.Caption:= FormMain.List.Column[FormMain.GetColumnIndex(8)].Caption;
  LabelResolution.Caption:= FormMain.List.Column[FormMain.GetColumnIndex(9)].Caption;
  LabelDriverStatus.Caption:= FormMain.List.Column[FormMain.GetColumnIndex(10)].Caption;
  LabelSoundStatus.Caption:= FormMain.List.Column[FormMain.GetColumnIndex(11)].Caption;
  LabelColorStatus.Caption:= FormMain.List.Column[FormMain.GetColumnIndex(12)].Caption;
  LabelMerged.Caption:= FormMain.List.Column[FormMain.GetColumnIndex(13)].Caption;
  LabelName.Caption:= FormMain.List.Column[FormMain.GetColumnIndex(14)].Caption;
  LabelCloneOf.Caption:= FormMain.List.Column[FormMain.GetColumnIndex(15)].Caption;
  LabelCategory.Caption:= FormMain.List.Column[FormMain.GetColumnIndex(16)].Caption;
  LabelVersionAdded.Caption:= FormMain.List.Column[FormMain.GetColumnIndex(17)].Caption;
  LabelDriver.Caption:= FormMain.List.Column[FormMain.GetColumnIndex(18)].Caption;

  LabelYear.Font.Style:= [fsBold];
  LabelManufacturer.Font.Style:= [fsBold];
  LabelSound.Font.Style:= [fsBold];
  LabelFrequency.Font.Style:= [fsBold];
  LabelSamples.Font.Style:= [fsBold];
  LabelControlType.Font.Style:= [fsBold];
  LabelVideo.Font.Style:= [fsBold];
  LabelOrientation.Font.Style:= [fsBold];
  LabelResolution.Font.Style:= [fsBold];
  LabelDriverStatus.Font.Style:= [fsBold];
  LabelSoundStatus.Font.Style:= [fsBold];
  LabelColorStatus.Font.Style:= [fsBold];
  LabelMerged.Font.Style:= [fsBold];
  LabelName.Font.Style:= [fsBold];
  LabelCloneOf.Font.Style:= [fsBold];
  LabelCategory.Font.Style:= [fsBold];
  LabelVersionAdded.Font.Style:= [fsBold];
  LabelDriver.Font.Style:= [fsBold];
end;

end.
