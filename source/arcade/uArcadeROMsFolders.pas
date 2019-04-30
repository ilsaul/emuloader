unit uArcadeROMsFolders;

interface

uses
  Windows, SysUtils, Classes, Graphics, Controls, Forms,
  StdCtrls, MPCommonObjects, EasyListview, ComCtrls, ExtCtrls,
  ShadowLabel, PanelEx, ImgList, IniFiles, AdvOfficeButtons, Buttons,
  ButtonsEx;

type
  TFormArcadeROMsFolders = class(TForm)
    PanelSystemsSelect: TPanelEx;
    SystemSelector: TEasyListview;
    IL_Systems: TImageList;
    PanelBottom: TPanelEx;
    ButtonCancel: TBitBtnEx;
    UseLargeIcons: TAdvOfficeCheckBox;
    PanelFoldersList: TPanelEx;
    FoldersList: TMemo;
    PanelSystemTitle: TPanelEx;
    LabelSystemTitle: TShadowLabel;
    PanelSystemTitleBottom: TPanelEx;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure SystemSelectorItemSelectionChanged(
      Sender: TCustomEasyListview; Item: TEasyItem);
    procedure FormShow(Sender: TObject);
    procedure UseLargeIconsClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    { Private declarations }
    procedure SetSystemState;
    procedure LoadFoldersList;
    procedure ResizeForm;
    procedure ReadWriteSettings(ReadMode: Boolean);
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
  Item:= SystemSelector.Groups.FirstItem;
  SystemSelector.BeginUpdate;
  repeat
    if not FormMain.ValidateArcadeEmulatorFile(Item.ImageIndex) then
       Item.State:= [esosGhosted, esosVisible, esosEnabled];
    Item:= SystemSelector.Groups.NextItem(Item);
  until Item = nil;
  SystemSelector.EndUpdate;
end;

procedure TFormArcadeROMsFolders.LoadFoldersList;
var
  Loop: Integer;
begin
  FoldersList.Clear;
  if not Assigned(FormMain.emuROMsFolders[SystemSelector.Tag]) then
     Exit;
  FoldersList.Lines.BeginUpdate;
  for Loop:=0 to FormMain.emuROMsFolders[SystemSelector.Tag].Count-1 do
  begin
    if FormMain.emuROMsFolders[SystemSelector.Tag].Strings[Loop] <> '' then
       FoldersList.Lines.Add(FormMain.emuROMsFolders[SystemSelector.Tag].Strings[Loop]);
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
  Exit;
  if Screen.Width < 600 then
     begin
       SystemSelector.ImagesLarge:= FormMain.IL_ArcadeSystem_ExtraLarge;
       SystemSelector.CellSizes.Icon.Width:= 58;
       SystemSelector.CellSizes.Icon.Height:= 72;
       SystemSelector.Font.Name:= 'Tahoma';
       SystemSelector.Font.Size:= 7;
       FormArcadeROMsFolders.ClientHeight:= FormArcadeROMsFolders.ClientHeight-20;
       PanelSystemsSelect.Height:= PanelSystemsSelect.Height-20;

       SystemSelector.Height:= SystemSelector.Height-20;
       SystemSelector.Width:= SystemSelector.Width-160;
       FormArcadeROMsFolders.ClientWidth:= FormArcadeROMsFolders.ClientWidth-160;

       PanelSystemTitle.Top:= PanelSystemTitle.Top-20;
       PanelSystemTitle.Width:= ClientWidth;

       PanelSystemTitleBottom.Top:= PanelSystemTitleBottom.Top-20;
       PanelSystemTitleBottom.Width:= ClientWidth;

       PanelFoldersList.Top:= PanelFoldersList.Top-20;
       PanelFoldersList.Width:= ClientWidth-16;
     end;
end;

procedure TFormArcadeROMsFolders.SystemSelectorItemSelectionChanged(
  Sender: TCustomEasyListview; Item: TEasyItem);
begin
  if Item.Selected then
     begin
       SystemSelector.Tag:= Item.ImageIndex;
       LabelSystemTitle.Caption:= UpperCase(FormMain.GetArcadeEmulatorDescription(Item.ImageIndex));
       LoadFoldersList;
     end;
end;

procedure TFormArcadeROMsFolders.FormShow(Sender: TObject);
begin
  ReadWriteSettings(True);
  ResizeForm;
  FormMain.ELV_ResetNormalColors(SystemSelector);
  FormMain.LoadSystemsIcons(IL_Systems, False);

  FormMain.ELV_PopulateSystems(SystemSelector, True, True, 1);
  if Screen.Width < 720 then
     begin
       SystemSelector.BeginUpdate;
       SystemSelector.Items.Items[SystemSelector.Groups.ItemCount-2].Caption:= 'Model 2';
       SystemSelector.EndUpdate;
     end;

  SetSystemState;
  FormMain.ELV_SelectItem(SystemSelector, 0);
end;

procedure TFormArcadeROMsFolders.ReadWriteSettings(ReadMode: Boolean);
var
  INIFile: TMemIniFile;
  SectionStr: String;
begin
  if not FileExists(FormMain.GetFrontendExtraIniFile) then
     Exit;
  SectionStr:= 'UseLargeIcons';
  try
    INIFile:= TMemIniFile.Create(FormMain.GetFrontendExtraIniFile);
    if ReadMode then
       UseLargeIcons.Checked:= Boolean(INIFile.ReadInteger(SectionStr, 'ArcadeROMsFolders', 0))
    else
       INIFile.WriteInteger(SectionStr, 'ArcadeROMsFolders', Ord(UseLargeIcons.Checked));
  finally
    if not ReadMode then
       INIFile.UpdateFile;
    FreeAndNil(INIFile);
  end;
end;

procedure TFormArcadeROMsFolders.UseLargeIconsClick(Sender: TObject);
var
  iDiff: Integer;
begin
  if Screen.Height < 720 then
     Exit;
  if UseLargeIcons.Checked then
     IL_Systems.Width:= 128
  else
     IL_Systems.Width:= 68;

  IL_Systems.Height:= IL_Systems.Width;

  FormMain.LoadSystemsIcons(IL_Systems);

  if UseLargeIcons.Checked then
  begin
    if SystemSelector.CellSizes.Icon.Height = 166 then
       Exit;

    SystemSelector.PaintInfoItem.IconViewAdjustIconTopBorder:= True;
    iDiff:=(166*2)-SystemSelector.Height;

    FormArcadeROMsFolders.ClientHeight:= FormArcadeROMsFolders.ClientHeight+iDiff;
    PanelSystemsSelect.Height:= PanelSystemsSelect.Height+iDiff;
    PanelSystemTitle.Top:= PanelSystemTitle.Top+iDiff;
    PanelSystemTitleBottom.Top:= PanelSystemTitleBottom.Top+iDiff;

    PanelFoldersList.Top:= PanelFoldersList.Top+iDiff;
    SystemSelector.Height:= 166*2;
    SystemSelector.CellSizes.Icon.Height:= 166;
    SystemSelector.CellSizes.Icon.Width:= 156;
  end
  else
  begin
    if SystemSelector.CellSizes.Icon.Height = 92 then
       Exit;
    SystemSelector.PaintInfoItem.IconViewAdjustIconTopBorder:= False;
    iDiff:= SystemSelector.Height-92;
    SystemSelector.Height:= 92;
    SystemSelector.CellSizes.Icon.Height:= 92;
    SystemSelector.CellSizes.Icon.Width:= 78;
    PanelSystemTitle.Top:= PanelSystemTitle.Top-iDiff;
    PanelSystemTitleBottom.Top:= PanelSystemTitleBottom.Top-iDiff;
    PanelSystemsSelect.Height:= PanelSystemsSelect.Height-iDiff;
    PanelFoldersList.Top:= PanelFoldersList.Top-iDiff;

    FormArcadeROMsFolders.ClientHeight:= FormArcadeROMsFolders.ClientHeight-iDiff;
  end;

  if FormMain.CheckTotal(SystemSelector) then
     FormArcadeROMsFolders.Top:= (Screen.Height shr 1)-(FormArcadeROMsFolders.Height shr 1)-1;
end;


procedure TFormArcadeROMsFolders.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if CanClose then
     ReadWriteSettings(False);
end;

end.
