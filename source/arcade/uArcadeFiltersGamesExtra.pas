unit uArcadeFiltersGamesExtra;

interface

uses
  Windows, SysUtils, Classes, Graphics, Controls, Forms,
  StdCtrls, ExtCtrls, uCommon, Buttons,
  AdvOfficeButtons, PanelEx, AdvGroupBox;

type
  TFormArcadeFiltersExtra = class(TForm)
    FilterGamesMainCPU: TAdvOfficeCheckBox;
    PanelEx1: TPanelEx;
    ButtonOk: TBitBtn;
    ButtonCancel: TBitBtn;
    LabelControlType: TLabel;
    LabelInterfaceType: TLabel;
    InterfaceType: TComboBox;
    LabelAudioType: TLabel;
    AudioType: TComboBox;
    LabelGamesROMs: TLabel;
    GamesROMs: TComboBox;
    LabelDeviceROMs: TLabel;
    HideDeviceSets: TAdvOfficeCheckBox;
    DeviceROMs: TComboBox;
    LabelBios: TLabel;
    Bios: TComboBox;
    HideBiosSets: TAdvOfficeCheckBox;
    HideGamesWithCHDFiles: TAdvOfficeCheckBox;
    ButtonDefaultOptions: TBitBtn;
    LabelSTVMultiSlot: TLabel;
    NeoGeoMVS: TAdvOfficeCheckBox;
    STVMultiSlot: TAdvOfficeCheckBox;
    LabelNeoGeoMVS: TLabel;
    ControlType_New: TComboBox;
    ScreenOrientation: TComboBox;
    LabelScreenOrientation: TLabel;
    ShowMergedSetsOnly: TAdvOfficeCheckBox;
    HideNoDumpROMsGames: TAdvOfficeCheckBox;
    SaveState: TComboBox;
    LabelSaveState: TLabel;
    CategoryFiltersGroupBox: TAdvGroupBox;
    Label1: TLabel;
    ButtonCategoriesToHideInfo: TBitBtn;
    CategoryCasino: TAdvOfficeCheckBox;
    CategoryFruitMachines: TAdvOfficeCheckBox;
    CategoryRhythm: TAdvOfficeCheckBox;
    CategoryMature: TAdvOfficeCheckBox;
    CategoryMahjong: TAdvOfficeCheckBox;
    CategoryTabletop: TAdvOfficeCheckBox;
    CategoryPinMAME: TAdvOfficeCheckBox;
    CategoryQuiz: TAdvOfficeCheckBox;
    CategoryUtilities: TAdvOfficeCheckBox;
    CategoryCalculator: TAdvOfficeCheckBox;
    CategoryEducational: TAdvOfficeCheckBox;
    CategoryElectronic: TAdvOfficeCheckBox;
    CategoryPrinters: TAdvOfficeCheckBox;
    CategoryPhones: TAdvOfficeCheckBox;
    CategoryMAMEConsoleMachines: TAdvOfficeCheckBox;
    CategoryMAMEComputerMachines: TAdvOfficeCheckBox;
    CategoryMAMEHandheldMachines: TAdvOfficeCheckBox;
    procedure FormActivate(Sender: TObject);
    procedure FilterGamesMainCPUClick(Sender: TObject);
    procedure ButtonOkClick(Sender: TObject);
    procedure ButtonDefaultOptionsClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure ButtonCategoriesToHideInfoClick(Sender: TObject);
  private
    { Private declarations }
    procedure ELV_PopulateControlType;
  public
    { Public declarations }
    mResult: Integer;
    ControlName: String;
  end;

var
  FormArcadeFiltersExtra: TFormArcadeFiltersExtra;

implementation

uses uMain, uStatus;

{$R *.dfm}

procedure TFormArcadeFiltersExtra.ELV_PopulateControlType;
var
  Loop: Integer;
  cStr: String;
begin
  ControlType_New.Items.BeginUpdate;
  for Loop:=0 to FormMain.ControlType.Count-1 do
  begin
    cStr:= FormMain.ControlType.ValueFromIndex[Loop];
    if cStr <> '' then
       ControlType_New.Items.Add(cStr);
  end;
  ControlType_New.Items.EndUpdate;
end;

procedure TFormArcadeFiltersExtra.FormActivate(Sender: TObject);
begin
  if Tag = 1 then
     Exit;
  Tag:= 1;
  ELV_PopulateControlType;
  //SetComboBoxEx(ControlType, FormMain.ControlType.IndexOfName(ControlName)+1, True);
  SetSelectedComboBox(FormMain.ControlType.IndexOfName(ControlName)+1, ControlType_New);
end;

procedure TFormArcadeFiltersExtra.FilterGamesMainCPUClick(Sender: TObject);
begin
  FormMain.ToolBarFilterByMainCPU.Visible:= FilterGamesMainCPU.Checked;
  if FormMain.ToolBarFilterByMainCPU.Visible then
     FormMain.ToolBarPanel.Top:= 0;
end;

procedure TFormArcadeFiltersExtra.ButtonOkClick(Sender: TObject);
begin
  mResult:= TBitBtn(Sender).ModalResult;
end;

procedure TFormArcadeFiltersExtra.ButtonDefaultOptionsClick(Sender: TObject);
begin
  Bios.ItemIndex:= 0;
  HideBiosSets.Checked:= False;
  SetSelectedComboBox(0, ControlType_New);
  InterfaceType.ItemIndex:= 0;
  AudioType.ItemIndex:= 0;
  DeviceROMs.ItemIndex:= 0;
  HideDeviceSets.Checked:= False;
  //HideDeviceSetsNoROMs.Checked:= False;
  GamesROMs.ItemIndex:= 0;
  CategoryCasino.Checked:= True;
  CategoryFruitMachines.Checked:= True;
  CategoryRhythm.Checked:= True;
  CategoryMature.Checked:= True;
  CategoryMahjong.Checked:= True;
  CategoryTabletop.Checked:= True;
  CategoryPinMAME.Checked:= True;
  CategoryQuiz.Checked:= True;

  CategoryUtilities.Checked:= True;
  CategoryCalculator.Checked:= True;
  CategoryEducational.Checked:= True;
  CategoryElectronic.Checked:= True;
  CategoryPrinters.Checked:= True;
  CategoryPhones.Checked:= True;
  CategoryMAMEConsoleMachines.Checked:= True;
  CategoryMAMEConsoleMachines.Checked:= True;
  CategoryMAMEHandheldMachines.Checked:= True;

  HideGamesWithCHDFiles.Checked:= False;
  HideNoDumpROMsGames.Checked:= False;
  NeoGeoMVS.Checked:= False;
  STVMultiSlot.Checked:= False;
  ScreenOrientation.ItemIndex:= 0;
  ShowMergedSetsOnly.Checked:= False;
  SaveState.ItemIndex:= 0;
end;

procedure TFormArcadeFiltersExtra.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #27 then
     ButtonCancel.Click;
end;

procedure TFormArcadeFiltersExtra.ButtonCategoriesToHideInfoClick(
  Sender: TObject);
begin
  CallMessageBox;
  FormMain.AddMsgText('    To use these MAME/HBMAME filters you must place ');
  FormMain.AddMsgText('category.ini', $00a65300, [fsBold]);
  FormMain.AddMsgText(', ');
  FormMain.AddMsgText('category_hb.ini', $00a65300, [fsBold]);
  FormMain.AddMsgText(' from AntoPISA or ');
  FormMain.AddMsgText('catver.ini', $00a65300, [fsBold]);
  FormMain.AddMsgText(' in ');
  FormMain.AddMsgText(FormMain.GetFolderFull(43), clMaroon { $00a65300 }, [fsBold]);
  FormMain.AddMsgText(' folder and restart the frontend to load the new info in the games list.'+
                      #13#10+#13#10+'You can find ');
  FormMain.AddMsgText('category.ini', $00a65300, [fsBold]);
  FormMain.AddMsgText(', ');
  FormMain.AddMsgText('category_hb.ini', $00a65300, [fsBold]);
  FormMain.AddMsgText(' and ');
  FormMain.AddMsgText('catver.ini', $00a65300, [fsBold]);
  FormMain.AddMsgText(' at AntoPISA renameSET page: http://www.progettosnaps.net/renameset/'+#13#10+#13#10+'File ');
  FormMain.AddMsgText('catver.ini', $00a65300, [fsBold]);
  FormMain.AddMsgText(' is also available at Progetto EMMA: http://www.progettoemma.net/history/catlist.php'+#13#10+#13#10+
                      'The ');
  FormMain.AddMsgText('MAME Console Machines', $00a65300, [fsBold]);
  FormMain.AddMsgText(', ');
  FormMain.AddMsgText('MAME Computer Machines', $00a65300, [fsBold]);
  FormMain.AddMsgText(', ');
  FormMain.AddMsgText('MAME Handheld Machines', $00a65300, [fsBold]);
  FormMain.AddMsgText(' filters will show/hide MAME machines only (from -listxml output). Software lists are not included.');

  GenerateMessage('Help', 'Hide categories based on an external file.', '', 2);
end;


end.
