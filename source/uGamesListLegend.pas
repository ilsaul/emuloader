unit uGamesListLegend;

interface

uses
  Windows, Classes, Graphics, Controls, Forms, ExtCtrls, StdCtrls, ComCtrls;

type
  TFormGamesListLegend = class(TForm)
    PageControlIconsDescription: TPageControl;
    TabSheetAvailableGames: TTabSheet;
    TabSheetUnavailableGames: TTabSheet;
    ClassicMR: TImage;
    ClassicMV: TImage;
    ClassicCR: TImage;
    ClassicCV: TImage;
    NeoGeoM: TImage;
    NeoGeoC: TImage;
    LabelClassicMR: TLabel;
    LabelClassicMV: TLabel;
    LabelClassicCR: TLabel;
    LabelClassicCV: TLabel;
    LabelNeoGeoM: TLabel;
    LabelNeoGeoC: TLabel;
    ClassicBios: TImage;
    LabelClassicBios: TLabel;
    NeoGeoBios: TImage;
    LabelNeoGeoBios: TLabel;
    CustomGames: TImage;
    LabelCustomGames: TLabel;
    UnClassicMR: TImage;
    UnClassicMV: TImage;
    UnClassicCR: TImage;
    UnClassicCV: TImage;
    UnNeoGeoM: TImage;
    UnNeoGeoC: TImage;
    LabelUnClassicMR: TLabel;
    LabelUnClassicMV: TLabel;
    LabelUnClassicCR: TLabel;
    LabelUnClassicCV: TLabel;
    LabelUnNeoGeoM: TLabel;
    LabelUnNeoGeoC: TLabel;
    UnClassicBios: TImage;
    LabelUnClassicBios: TLabel;
    UnNeoGeoBios: TImage;
    LabelUnNeoGeoBios: TLabel;
    UnCustomGames: TImage;
    LabelUnCustomGames: TLabel;
    RealIcon: TImage;
    LabelRealIcon: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormGamesListLegend: TFormGamesListLegend;

implementation

uses uMain;

{$R *.DFM}

procedure TFormGamesListLegend.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FormMain.MenuShowGamesIconsLegend.Click;
end;

procedure TFormGamesListLegend.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
  if ((Key = #27) or (Key = #13)) then
     Close;
end;

procedure TFormGamesListLegend.FormCreate(Sender: TObject);
begin
  FormMain.BuiltInSmallListImageList.GetIcon(0, ClassicMR.Picture.Icon);
  FormMain.BuiltInSmallListImageList.GetIcon(1, ClassicMV.Picture.Icon);
  FormMain.BuiltInSmallListImageList.GetIcon(2, ClassicCR.Picture.Icon);
  FormMain.BuiltInSmallListImageList.GetIcon(3, ClassicCV.Picture.Icon);
  FormMain.BuiltInSmallListImageList.GetIcon(4, NeoGeoM.Picture.Icon);
  FormMain.BuiltInSmallListImageList.GetIcon(5, NeoGeoC.Picture.Icon);
  FormMain.BuiltInSmallListImageList.GetIcon(12, ClassicBios.Picture.Icon);
  FormMain.BuiltInSmallListImageList.GetIcon(13, NeoGeoBios.Picture.Icon);
  FormMain.BuiltInSmallListImageList.GetIcon(16, CustomGames.Picture.Icon);
  FormMain.SmallRealIconsImageList.GetIcon(0, RealIcon.Picture.Icon);

  FormMain.BuiltInSmallListImageList.GetIcon(6, UnClassicMR.Picture.Icon);
  FormMain.BuiltInSmallListImageList.GetIcon(7, UnClassicMV.Picture.Icon);
  FormMain.BuiltInSmallListImageList.GetIcon(8, UnClassicCR.Picture.Icon);
  FormMain.BuiltInSmallListImageList.GetIcon(9, UnClassicCV.Picture.Icon);
  FormMain.BuiltInSmallListImageList.GetIcon(10, UnNeoGeoM.Picture.Icon);
  FormMain.BuiltInSmallListImageList.GetIcon(11, UnNeoGeoC.Picture.Icon);
  FormMain.BuiltInSmallListImageList.GetIcon(14, UnClassicBios.Picture.Icon);
  FormMain.BuiltInSmallListImageList.GetIcon(15, UnNeoGeoBios.Picture.Icon);
  FormMain.BuiltInSmallListImageList.GetIcon(17, UnCustomGames.Picture.Icon);
end;

procedure TFormGamesListLegend.FormShow(Sender: TObject);
begin
  FormMain.UpdateGeneralAppearance(FormGamesListLegend);
  FormMain.SetIconsLegendLanguage;
end;

end.
