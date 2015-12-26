unit uToolBarEditor;

interface

uses
  Windows, Graphics, Controls, Forms, StdCtrls, Buttons, ComCtrls, Classes,
  ToolWin, ExtCtrls, ImgList, MPCommonObjects, EasyListview, SysUtils,
  AdvOfficeButtons, PanelEx;

type
  TFormToolBarEditor = class(TForm)
    IL_ToolBarButtonsEditor: TImageList;
    ToolBarListView: TEasyListview;
    PanelEx1: TPanelEx;
    BoundToGamesPanel: TAdvOfficeCheckBox;
    ShowHideToolBar: TAdvOfficeCheckBox;
    ButtonDefault: TBitBtn;
    ButtonClose: TBitBtn;
    SmallToolBar: TAdvOfficeCheckBox;
    procedure ButtonDefaultClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure ToolBarListViewItemPaintText(Sender: TCustomEasyListview;
      Item: TEasyItem; Position: Integer; ACanvas: TCanvas);
    procedure ToolBarListViewItemCheckChange(Sender: TCustomEasyListview;
      Item: TEasyItem);
    procedure FormShow(Sender: TObject);
    procedure BoundToGamesPanelClick(Sender: TObject);
    procedure ShowHideToolBarClick(Sender: TObject);
    procedure SmallToolBarClick(Sender: TObject);
  private
    { Private declarations }
    procedure LoadIcons;
  public
    { Public declarations }
  end;

var
  FormToolBarEditor: TFormToolBarEditor;

implementation

uses uMain, uCommon;

{$R *.dfm}

procedure TFormToolBarEditor.LoadIcons;
var
  tempFolder: String;
begin
  tempFolder:= FormMain.GetFolderFull(32);
  FormMain.AddDefaultIcons('EmuLoader_Orb.ico', tempFolder, IL_ToolBarButtonsEditor);
  FormMain.AddDefaultIcons('viewmode_01_details.ico', tempFolder, IL_ToolBarButtonsEditor);
  FormMain.AddDefaultIcons('filterarcade_00_listall.ico', tempFolder, IL_ToolBarButtonsEditor);
  FormMain.AddDefaultIcons('arcade_filters\favorites.ico', tempFolder, IL_ToolBarButtonsEditor);
  FormMain.AddDefaultIcons('arcade_filters\allgames.ico', tempFolder, IL_ToolBarButtonsEditor);
  FormMain.AddDefaultIcons('filter2_01_both.ico', tempFolder, IL_ToolBarButtonsEditor);
  FormMain.AddDefaultIcons('filter3_01_listall.ico', tempFolder, IL_ToolBarButtonsEditor);
  FormMain.AddDefaultIcons('filter4_01_all.ico', tempFolder, IL_ToolBarButtonsEditor);
  FormMain.AddDefaultIcons('filter5_machines.ico', tempFolder, IL_ToolBarButtonsEditor);
  FormMain.AddDefaultIcons('mamu_.ico', tempFolder, IL_ToolBarButtonsEditor);
  FormMain.AddDefaultIcons('filter_extra.ico', tempFolder, IL_ToolBarButtonsEditor);
  FormMain.AddDefaultIcons('filter_text.ico', tempFolder, IL_ToolBarButtonsEditor);
  FormMain.AddDefaultIcons('toolbar.ico', tempFolder, IL_ToolBarButtonsEditor);
end;

procedure TFormToolBarEditor.ButtonDefaultClick(Sender: TObject);
var
  Loop: ShortInt;
begin
  for Loop:=0 to FormMain.ToolBarButtons.ButtonCount do
      ToolBarListView.Items[Loop].Checked:= True;
  ToolBarListView.SetFocus;
end;

procedure TFormToolBarEditor.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #27 then
     ButtonClose.Click;
end;

procedure TFormToolBarEditor.ToolBarListViewItemPaintText(
  Sender: TCustomEasyListview; Item: TEasyItem; Position: Integer;
  ACanvas: TCanvas);
begin
  if Item.Ghosted then
     ACanvas.Font.Color:= clGray;
end;

procedure TFormToolBarEditor.ToolBarListViewItemCheckChange(
  Sender: TCustomEasyListview; Item: TEasyItem);

  function SetGhostItem: Boolean;
  begin
    Result:= True;
    case Item.Checked of
      True : Item.State:= Item.State-[esosGhosted];
      False: Item.State:= Item.State+[esosGhosted];
    end;
  end;

begin
  if Item = nil then
     Exit;

  if Item.Index < FormMain.ToolBarButtons.ButtonCount then
     begin
       FormMain.ToolBarButtons.Buttons[Item.Index].Visible:= Item.Checked;
       SetGhostItem;
     end
  else
     begin
       if Item.Checked <> FormMain.ToolBarFilterTitle.Visible then
          FormMain.ToolBarFilterTitle.Visible:= Item.Checked;
       SetGhostItem;
     end;
end;

procedure TFormToolBarEditor.FormShow(Sender: TObject);
var
  Loop: ShortInt;
begin
  LoadIcons;
  FormMain.ELV_ResetNormalColors(ToolBarListView);
  ToolBarListView.BeginUpdate;
  for Loop:=0 to FormMain.ToolBarButtons.ButtonCount-1 do
  begin
    with ToolBarListView.Items.Add do
    begin
      ImageIndex:= Loop;
      Caption:= FormMain.ToolBarButtons.Buttons[Loop].Caption;
      Checked:= FormMain.ToolBarButtons.Buttons[Loop].Visible;
      if not Checked then
         State:= State+[esosGhosted];
    end;
  end;
  with ToolBarListView.Items.Add do
  begin
    ImageIndex:= FormMain.ToolBarButtons.ButtonCount;
    Caption:= 'Search Bar';
    Checked:= FormMain.ToolBarFilterTitle.Visible;
    if not Checked then
       State:= State+[esosGhosted];
  end;

  ToolBarListView.EndUpdate;
  FormMain.ELV_SelectItem(ToolBarListView, 0);
  BoundToGamesPanel.Tag:= 1;
  BoundToGamesPanel.Checked:= FormMain.MenuBoundToGamesPanel.Checked;
  SmallToolBar.Checked:= FormMain.MenuSmallToolBar.Checked;
  BoundToGamesPanel.Tag:= 0;
end;

procedure TFormToolBarEditor.BoundToGamesPanelClick(Sender: TObject);
begin
  if BoundToGamesPanel.Tag = 0 then // to prevent setting from executing if screen settings are being loaded!
     FormMain.MenuBoundToGamesPanel.Click;
end;

procedure TFormToolBarEditor.ShowHideToolBarClick(Sender: TObject);
begin
  if BoundToGamesPanel.Tag = 0 then
     FormMain.MenuEnableToolBar.Click;
end;

procedure TFormToolBarEditor.SmallToolBarClick(Sender: TObject);
begin
  if BoundToGamesPanel.Tag = 0 then
     FormMain.MenuSmallToolbar.Click;
end;

end.
