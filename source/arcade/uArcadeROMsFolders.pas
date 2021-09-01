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
    UseLargeIcons: TAdvOfficeCheckBoxEx;
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
    procedure SystemSelectorItemPaintText(Sender: TCustomEasyListview;
      Item: TEasyItem; Position: Integer; ACanvas: TCanvas);
  private
    { Private declarations }
    procedure SetSystemState;
    procedure LoadFoldersList;
    //procedure ResizeForm;
    procedure Resize4K;
    procedure ReadWriteSettings(ReadMode: Boolean);
  public
    { Public declarations }
  end;

var
  FormArcadeROMsFolders: TFormArcadeROMsFolders;

implementation

uses uMain, uCommon;

{$R *.dfm}

procedure TFormArcadeROMsFolders.Resize4K;
begin
  if not Is4KMode then //FormMain.Menu4KMode2160pEnable.Checked then
     Exit;

  with FormArcadeROMsFolders do
  begin
    ClientWidth:= 1264;
    ClientHeight:= 890;
    Font.Size:= 16;
    FormMain.Set4KImageListSpecs(IL_Systems, 128);

    PanelBottom.Height:= 71;
    FormMain.Set4KButtonSpecs(ButtonCancel, ClientWidth-10-168, 16, 168, 45, 16);

    FormMain.Set4KArcadeSysPanel(PanelSystemsSelect, SystemSelector, PanelSystemTitle, LabelSystemTitle, PanelSystemTitleBottom);

    FormMain.Set4KPanelSpecs(PanelFoldersList, 10, PanelSystemTitleBottom.Top+PanelSystemTitleBottom.Height, ClientWidth-20, 570);
    FoldersList.Font.Size:= 16;
    FormMain.Set4KCheckBoxSpecs(UseLargeIcons, 10, 20, 140, 36, 16);
    UseLargeIcons.Visible:= False;
  end;
end;

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
  FoldersList.SelStart:= 0;
  FoldersList.SelLength:= 0;
  FoldersList.Lines.BeginUpdate;
  for Loop:=0 to FormMain.emuROMsFolders[SystemSelector.Tag].Count-1 do
  begin
    if FormMain.emuROMsFolders[SystemSelector.Tag].Strings[Loop] <> '' then
       FoldersList.SelText:= FormMain.emuROMsFolders[SystemSelector.Tag].Strings[Loop]+#13#10;
       //FoldersList.Lines.Add(FormMain.emuROMsFolders[SystemSelector.Tag].Strings[Loop]);
  end;
  FoldersList.Lines.EndUpdate;
end;

procedure TFormArcadeROMsFolders.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #27 then
     Close;
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
  Resize4K;
  if IsNightMode then
     begin
       FormArcadeROMsFolders.Color:= menu_background_color[1];
       PanelSystemsSelect.Color1:= clrBlackBk;
       FormMain.SetEasyListViewColors(SystemSelector, clrBlackBk, clWhite);

       FormMain.SetSystemTitleLabelColors(LabelSystemTitle);
       SetSystemTitleBarNightColors(PanelSystemTitle, FormArcadeROMsFolders.PanelSystemTitleBottom);

       SetPanelNightColors(PanelFoldersList, -1, -1, checked_innerframecolor[1], clrDarkGray);

       SetCheckBoxColors(UseLargeIcons, clWhite, item_caption_active_shadow_color[1]);
       FormMain.SetCheckBoxExCustomIcon(UseLargeIcons);

       FoldersList.Color:= menu_background_color[1];
       FoldersList.Font.Color:= item_caption_active_color[1];
       FormMain.SetWin10DarkScrollBar(FoldersList);

       FormMain.SetButtonExColors(ButtonCancel);

       SetBottomPanelColors(PanelBottom);
     end;

  ReadWriteSettings(True);
  //ResizeForm;
  FormMain.ELV_ResetNormalColors(SystemSelector);
  if IsNightMode then
     FormMain.ELV_SetNightModeColors(SystemSelector);

  FormMain.LoadSystemsIcons(IL_Systems, False);
  FormMain.ShowIconErrorMessage;

  FormMain.ELV_PopulateSystems(SystemSelector, True, True, 1);
  //if Screen.Width < 720 then
  //   begin
  //     SystemSelector.BeginUpdate;
  //     SystemSelector.Items.Items[SystemSelector.Groups.ItemCount-2].Caption:= 'Model 2';
  //     SystemSelector.EndUpdate;
  //   end;

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
  if Is4KMode then
     Exit;
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

    SystemSelector.PaintInfoItem.IconViewRemoveIconTopBorder:= True;
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
    SystemSelector.PaintInfoItem.IconViewRemoveIconTopBorder:= False;
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

procedure TFormArcadeROMsFolders.SystemSelectorItemPaintText(
  Sender: TCustomEasyListview; Item: TEasyItem; Position: Integer;
  ACanvas: TCanvas);
begin
  FormMain.ELV_SetGhostedIconText(Item, SystemSelector, ACanvas);
end;

end.
