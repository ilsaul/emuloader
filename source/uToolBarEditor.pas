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
    GamesSearchBar: TAdvOfficeCheckBox;
    GamesSearchBarIcon: TImage;
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
    procedure GamesSearchBarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormToolBarEditor: TFormToolBarEditor;

implementation

uses uMain, uCommon;

{$R *.dfm}

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
  if Position = 1 then
     begin
       ACanvas.Font.Name:= 'Verdana';
       ACanvas.Font.Size:= 7;
       ACanvas.Font.Color:= clGray;
       ACanvas.Font.Style:= [fsItalic];
     end;
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
  if Item <> nil then
     begin
       FormMain.ToolBarButtons.Buttons[Item.Index].Visible:= Item.Checked;
       SetGhostItem;
     end;
  FormMain.ToolBarButtons.Repaint;
  //FormMain.PaintToolBarTheme(FormMain.ToolBarButtons, FormMain.MenuBoundToGamesPanel.Checked);
end;

procedure TFormToolBarEditor.FormShow(Sender: TObject);
var
  Loop: ShortInt;
  iPos: Integer;
  iTitle, iDetail: String;
begin
  FormMain.LoadIconIntoImage('filter_text', GamesSearchBarIcon);
  GamesSearchBar.Checked:= FormMain.ToolBarFilterTitle.Visible;
  FormMain.ELV_ResetNormalColors(ToolBarListView);
  ToolBarListView.BeginUpdate;
  for Loop:=0 to FormMain.ToolBarButtons.ButtonCount-1 do
  begin
    iTitle:= FormMain.ToolBarButtons.Buttons[Loop].Caption;
    iDetail:= '';
    iPos:= PosEx('-', iTitle);
    if iPos <> 0 then
       begin
         iDetail:= Copy(iTitle, iPos+1, Length(iTitle));
         Delete(iTitle, iPos, Length(iTitle));
       end;

    with ToolBarListView.Items.Add do
    begin
      ImageIndex:= Loop;
      Caption:= iTitle;
      Captions[1]:= iDetail;

      Checked:= FormMain.ToolBarButtons.Buttons[Loop].Visible;
      if not Checked then
         State:= State+[esosGhosted];

      Details[1]:= 1;
      //Captions[1]:= 'Arcade';
      //Details[1]:= 1;
    end;
  end;
  {with ToolBarListView.Items.Add do
  begin
    ImageIndex:= FormMain.ToolBarButtons.ButtonCount;
    Caption:= 'Search Bar';
    Checked:= FormMain.ToolBarFilterTitle.Visible;
    if not Checked then
       State:= State+[esosGhosted];

    //Captions[1]:= 'Arcade';
    //Details[1]:= 1;
  end;}

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

procedure TFormToolBarEditor.GamesSearchBarClick(Sender: TObject);
begin
  if GamesSearchBar.Checked <> FormMain.ToolBarFilterTitle.Visible then
     FormMain.ToolBarFilterTitle.Visible:= GamesSearchBar.Checked;
end;

end.
