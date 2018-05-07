unit uArcadeROMsFolders;

interface

uses
  Windows, Classes, Graphics, Controls, Forms,
  StdCtrls, MPCommonObjects, EasyListview, ComCtrls, ExtCtrls,
  ShadowLabel, PanelEx, ImgList;

type
  TFormArcadeROMsFolders = class(TForm)
    FoldersList: TMemo;
    PanelList: TPanelEx;
    LabelSystemTitle: TShadowLabel;
    SystemsListView: TEasyListview;
    IL_Systems: TImageList;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure SystemsListViewItemSelectionChanged(
      Sender: TCustomEasyListview; Item: TEasyItem);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    procedure SetSystemState;
    procedure LoadFoldersList;
    procedure ResizeForm;
  public
    { Public declarations }
  end;

var
  FormArcadeROMsFolders: TFormArcadeROMsFolders;

implementation

uses uMain, uCommon;

{$R *.dfm}

procedure TFormArcadeROMsFolders.SetSystemState;
var
  Item: TEasyItem;
begin
  Item:= SystemsListView.Groups.FirstItem;
  SystemsListView.BeginUpdate;
  repeat
    if not FormMain.ValidateArcadeEmulatorFile(Item.ImageIndex) then
       Item.State:= [esosGhosted, esosVisible, esosEnabled];
    Item:= SystemsListView.Groups.NextItem(Item);
  until Item = nil;
  SystemsListView.EndUpdate;
end;

procedure TFormArcadeROMsFolders.LoadFoldersList;
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

procedure TFormArcadeROMsFolders.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #27 then
     Close;
end;

procedure TFormArcadeROMsFolders.ResizeForm;
begin
  if Screen.Width < 720 then
     begin
       SystemsListView.ImagesLarge:= FormMain.IL_ArcadeSystem_ExtraLarge;
       SystemsListView.CellSizes.Icon.Width:= 58;
       SystemsListView.CellSizes.Icon.Height:= 72;
       SystemsListView.Font.Name:= 'Tahoma';
       SystemsListView.Font.Size:= 7;
       FormArcadeROMsFolders.ClientHeight:= FormArcadeROMsFolders.ClientHeight-20;
       PanelList.Height:= PanelList.Height-20;

       SystemsListView.Height:= SystemsListView.Height-20;
       SystemsListView.Width:= SystemsListView.Width-160;
       FormArcadeROMsFolders.ClientWidth:= FormArcadeROMsFolders.ClientWidth-160;

       LabelSystemTitle.Top:= LabelSystemTitle.Top-20;
       LabelSystemTitle.Width:= ClientWidth;
       FoldersList.Top:= FoldersList.Top-20;
       FoldersList.Width:= ClientWidth-16;
     end;
end;

procedure TFormArcadeROMsFolders.SystemsListViewItemSelectionChanged(
  Sender: TCustomEasyListview; Item: TEasyItem);
begin
  if Item.Selected then
     begin
       SystemsListView.Tag:= Item.ImageIndex;
       LabelSystemTitle.Caption:= UpperCase(FormMain.GetArcadeEmulatorDescription(Item.ImageIndex));
       LoadFoldersList;
     end;
end;

procedure TFormArcadeROMsFolders.FormShow(Sender: TObject);
begin
  ResizeForm;
  FormMain.ELV_ResetNormalColors(SystemsListView);
  FormMain.LoadSystemsIcons(IL_Systems, False);

  FormMain.ELV_PopulateSystems(SystemsListView, True, True, 1);
  if Screen.Width < 720 then
     begin
       SystemsListView.BeginUpdate;
       SystemsListView.Items.Items[SystemsListView.Groups.ItemCount-2].Caption:= 'Model 2';
       SystemsListView.EndUpdate;
     end;

  SetSystemState;
  FormMain.ELV_SelectItem(SystemsListView, 0);
end;


end.
