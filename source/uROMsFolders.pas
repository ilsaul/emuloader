unit uROMsFolders;

interface

uses
  Windows, Classes, Graphics, Controls, Forms,
  StdCtrls, MPCommonObjects, EasyListview, ComCtrls, ExtCtrls,
  ShadowLabel, PanelEx;

type
  TFormROMsFolders = class(TForm)
    FoldersList: TMemo;
    PanelList: TPanelEx;
    LabelSystemTitle: TShadowLabel;
    SystemsListView: TEasyListview;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure SystemsListViewItemSelectionChanged(
      Sender: TCustomEasyListview; Item: TEasyItem);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    procedure SetSystemState;
    procedure LoadFoldersList;
  public
    { Public declarations }
  end;

var
  FormROMsFolders: TFormROMsFolders;

implementation

uses uMain, uCommon;

{$R *.dfm}

procedure TFormROMsFolders.SetSystemState;
var
  Item: TEasyItem;
begin
  Item:= SystemsListView.Groups.FirstItem;
  SystemsListView.BeginUpdate;
  repeat
    if not FormMain.ValidateEmulatorFile(Item.ImageIndex) then
       Item.State:= [esosGhosted, esosVisible, esosEnabled];
    Item:= SystemsListView.Groups.NextItem(Item);
  until Item = nil;
  SystemsListView.EndUpdate;
end;

procedure TFormROMsFolders.LoadFoldersList;
var
  Loop: Integer;
begin
  FoldersList.Clear;
  if not Assigned(FormMain.emuROMsFolders[SystemsListView.Tag]) then
     Exit;
  FoldersList.Lines.BeginUpdate;
  for Loop:=0 to FormMain.emuROMsFolders[SystemsListView.Tag].Count-1 do
  begin
    if FormMain.emuROMsFolders[SystemsListView.Tag].Strings[Loop] <> '' then
       FoldersList.Lines.Add(FormMain.emuROMsFolders[SystemsListView.Tag].Strings[Loop]);
  end;
  FoldersList.Lines.EndUpdate;
end;

procedure TFormROMsFolders.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #27 then
     Close;
end;

procedure TFormROMsFolders.SystemsListViewItemSelectionChanged(
  Sender: TCustomEasyListview; Item: TEasyItem);
begin
  if Item.Selected then
     begin
       SystemsListView.Tag:= Item.ImageIndex;
       LabelSystemTitle.Caption:= UpperCase(FormMain.GetEmulatorDescription(Item.ImageIndex));
       LoadFoldersList;
     end;
end;

procedure TFormROMsFolders.FormShow(Sender: TObject);
begin
  FormMain.ELV_ResetNormalColors(SystemsListView);
  if Screen.Width < 720 then
     begin
       SystemsListView.ImagesLarge:= FormMain.IL_ArcadeSystem_ExtraLarge; //FormMain.IL_Systems
       SystemsListView.CellSizes.Icon.Width:= 58;
       SystemsListView.CellSizes.Icon.Height:= 72;
       SystemsListView.Font.Name:= 'Tahoma';
       SystemsListView.Font.Size:= 7;
       FormROMsFolders.ClientHeight:= FormROMsFolders.ClientHeight-20;
       PanelList.Height:= PanelList.Height-20;

       SystemsListView.Height:= SystemsListView.Height-20;
       SystemsListView.Width:= SystemsListView.Width-160;
       FormROMsFolders.ClientWidth:= FormROMsFolders.ClientWidth-160;

       LabelSystemTitle.Top:= LabelSystemTitle.Top-20;
       LabelSystemTitle.Width:= ClientWidth;
       FoldersList.Top:= FoldersList.Top-20;
       FoldersList.Width:= ClientWidth-16;
     end;
  FormMain.ELV_PopulateSystems(SystemsListView, True, True, 1);
  if Screen.Width < 720 then
     begin
       SystemsListView.BeginUpdate;
       SystemsListView.Items.Items[SystemsListView.Groups.ItemCount-2].Caption:= 'Model 2';
       SystemsListView.EndUpdate;
     end;
  //FormMain.ELV_SystemsShortTitle(SystemsListView);
  SetSystemState;
  FormMain.ELV_SelectItem(SystemsListView, 0);
end;


end.
