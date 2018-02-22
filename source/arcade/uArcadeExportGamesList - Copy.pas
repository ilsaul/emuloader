unit uArcadeExportGamesList;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, PanelEx, AdvOfficeButtons, MPCommonObjects,
  EasyListview, AdvGroupBox, IniFiles;

type
  TFormArcadeExportGamesList = class(TForm)
    LabelSelectMode: TLabel;
    PanelEx1: TPanelEx;
    ButtonOk: TBitBtn;
    ButtonCancel: TBitBtn;
    ExportList: TEasyListview;
    GroupExportOptionsAllGames: TAdvGroupBox;
    ExportOption_ArcadeGames: TAdvOfficeCheckBox;
    ExportOption_NonArcadeMAMEMachines: TAdvOfficeCheckBox;
    LabelExportOption_MAMESoftwareListGames: TLabel;
    ExportOption_MAMESoftwareListGames: TAdvOfficeCheckBox;
    ExportOption_MAME: TAdvOfficeCheckBox;
    ExportOption_Supermodel3: TAdvOfficeCheckBox;
    ExportOption_Daphne: TAdvOfficeCheckBox;
    ExportOption_Demul: TAdvOfficeCheckBox;
    ExportOption_HBMAME: TAdvOfficeCheckBox;
    ExportOption_DICE: TAdvOfficeCheckBox;
    ExportOption_SegaModel2: TAdvOfficeCheckBox;
    ExportOption_ZiNc: TAdvOfficeCheckBox;
    GroupMAMEContentManagerPlus: TAdvGroupBox;
    MCMPlus_MAME: TAdvOfficeCheckBox;
    MCMPlus_HBMAME: TAdvOfficeCheckBox;
    procedure FormShow(Sender: TObject);
    procedure ExportListItemPaintText(Sender: TCustomEasyListview;
      Item: TEasyItem; Position: Integer; ACanvas: TCanvas);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormArcadeExportGamesList: TFormArcadeExportGamesList;

implementation

uses uMain, uCommon;

{$R *.dfm}

procedure TFormArcadeExportGamesList.FormShow(Sender: TObject);
begin
  FormMain.ELV_ResetNormalColors(ExportList);
  ExportList.SetFocus;
  ExportList.Groups.FirstItem.Selected:= True;
  ExportList.Selection.FocusedItem:= ExportList.Selection.First;
end;

procedure TFormArcadeExportGamesList.ExportListItemPaintText(
  Sender: TCustomEasyListview; Item: TEasyItem; Position: Integer;
  ACanvas: TCanvas);
begin
  if Item.Selected then
     ACanvas.Font.Style:= [fsBold];
end;

end.
