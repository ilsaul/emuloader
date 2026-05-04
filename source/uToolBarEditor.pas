unit uToolBarEditor;

interface

uses
  Windows, Graphics, Controls, Forms, StdCtrls, Buttons, ComCtrls, Classes,
  ToolWin, ExtCtrls, ImgList, MPCommonObjects, EasyListview, SysUtils,
  AdvOfficeButtons, PanelEx, GR32_RangeBars, ShadowLabel, ButtonsEx;

type
  TFormToolBarEditor = class(TForm)
    IL_ToolBarButtonsEditor: TImageList;
    ToolBarListView: TEasyListview;
    PanelBottom: TPanelEx;
    BoundToGamesPanel: TAdvOfficeCheckBoxEx;
    ShowHideToolBar: TAdvOfficeCheckBoxEx;
    ButtonDefault: TBitBtnEx;
    ButtonClose: TBitBtnEx;
    LabelToolBarIconSize: TShadowLabel;
    LabelIconSizeValue: TShadowLabel;
    IconSizeExtraLarge: TSpeedButton;
    IconSizeLarge: TSpeedButton;
    IconSizeSmall: TSpeedButton;
    procedure ButtonDefaultClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure ToolBarListViewItemPaintText(Sender: TCustomEasyListview;
      Item: TEasyItem; Position: Integer; ACanvas: TCanvas);
    procedure ToolBarListViewItemCheckChange(Sender: TCustomEasyListview;
      Item: TEasyItem);
    procedure FormShow(Sender: TObject);
    procedure BoundToGamesPanelClick(Sender: TObject);
    procedure ShowHideToolBarClick(Sender: TObject);
    procedure IconSizeLargeClick(Sender: TObject);
  private
    { Private declarations }
    procedure Resize4K;
  public
    { Public declarations }
  end;

var
  FormToolBarEditor: TFormToolBarEditor;

implementation

uses uMain, uCommon;

{$R *.dfm}

procedure TFormToolBarEditor.Resize4K;
begin
  if not Is4KMode then
     Exit;

  with FormToolBarEditor do
  begin
    ToolBarListView.CellSizes.Tile.Width:= 425;
    ToolBarListView.CellSizes.Tile.Height:= 156;
    Font.Size:= 16;

    ToolBarListView.BorderWidth:= 8;
    ToolBarListView.PaintInfoItem.Border:= 4;
    ToolBarListView.PaintInfoItem.CaptionIndent:= 4;

    FormMain.Set4KListViewSpecs(ToolBarListView, 0, 0, (ToolBarListView.CellSizes.Tile.Width*4)+(ToolBarListView.BorderWidth*2)+20, (ToolBarListView.CellSizes.Tile.Height*4)+(ToolBarListView.BorderWidth*2), 16); // 4x4
    ToolBarListView.PaintInfoItem.CheckIndent:= 3;
    ToolBarListView.PaintInfoItem.ImageIndent:= 0;
    FormMain.Set4KListViewCheckBoxHDSpecs(ToolBarListView);

    PanelBottom.Height:= 71;

    ClientWidth:= ToolBarListView.Width-20;
    ClientHeight:= ToolBarListView.Height+PanelBottom.Height;

    FormMain.Set4KCheckBoxSpecs(BoundToGamesPanel, 17, 24, 245, 36, 16);
    FormMain.Set4KCheckBoxSpecs(ShowHideToolBar,   17+BoundToGamesPanel.Width+32, 24, 210, 36, 16);
    FormMain.Set4KButtonsOkCancelPanel(PanelBottom, ButtonDefault, ButtonClose, False);

    LabelToolBarIconSize.Visible:= False;
    IconSizeExtraLarge.Visible:= False;
    IconSizeLarge.Visible:= False;
    IconSizeSmall.Visible:= False;
    LabelIconSizeValue.Visible:= False;
  end;
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
  if Position = 1 then
     begin
       ACanvas.Font.Name:= 'Verdana';
       if Is4KMode then
          ACanvas.Font.Size:= 14
       else
          ACanvas.Font.Size:= 7;
       FormMain.ELV_SetSelecionFontColors(ToolBarListView, Item, ACanvas, True);
     end;

  FormMain.ELV_SetGhostedIconText(Item, ToolBarListView, ACanvas);
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
       if Item.Index > (FormMain.ToolBarButtons.ButtonCount-1) then
          FormMain.PanelSearchGames_ToolBar.Visible:= Item.Checked // "Search Games" button / filter
       else
          FormMain.ToolBarButtons.Buttons[Item.Index].Visible:= Item.Checked;
       SetGhostItem;
     end;
  FormMain.ToolBarButtons.Repaint;
end;

procedure TFormToolBarEditor.FormShow(Sender: TObject);
var
  Loop: ShortInt;
  iPos: Integer;
  iTitle, iDetail: String;

  procedure AddItem(Index: Integer; IsSearchGamesPanel: Boolean = False);
  var
    Item: TEasyItem;
  begin
    Item:= ToolBarListView.Items.Add;
    Item.ImageIndex:= Index;
    Item.Caption:= iTitle;
    Item.Captions[1]:= iDetail;
    if IsSearchGamesPanel then
       Item.Checked:= FormMain.PanelSearchGames_ToolBar.Visible
    else
       Item.Checked:= FormMain.ToolBarButtons.Buttons[Index].Visible;

    if not Item.Checked then
       Item.State:= Item.State+[esosGhosted];

    Item.Details[1]:= 1;
  end;

begin
  Resize4K;
  FormMain.ELV_ResetNormalColors(ToolBarListView);
  if IsNightMode then
     begin
       FormToolBarEditor.Color:= menu_background_color[1];
       SetBottomPanelColors(PanelBottom);
       SetLabelColors(LabelToolBarIconSize, item_caption_active_color[1], item_caption_active_shadow_color[1]);
       SetLabelColors(LabelIconSizeValue, item_caption_active_color[1], item_caption_active_shadow_color[1]);

       FormMain.ELV_SetNightModeColors(ToolBarListView);
       FormMain.SetEasyListViewColors(ToolBarListView, menu_background_color[1], item_caption_active_color[1]);

       FormMain.ELV_SetCheckRadioCustomIcon(ToolBarListView);

       SetCheckBoxColors(BoundToGamesPanel, item_caption_active_color[1], item_caption_active_shadow_color[1]);
       SetCheckBoxColors(ShowHideToolBar,   item_caption_active_color[1], item_caption_active_shadow_color[1]);
       FormMain.SetCheckBoxExCustomIcon(BoundToGamesPanel);
       FormMain.SetCheckBoxExCustomIcon(ShowHideToolBar);


       IconSizeExtraLarge.Font.Color:= item_caption_active_color[1];
       IconSizeLarge.Font.Color:=      item_caption_active_color[1];
       IconSizeSmall.Font.Color:=      item_caption_active_color[1];

       FormMain.SetButtonExColors(ButtonClose);
       FormMain.SetButtonExColors(ButtonDefault);
     end;

  ToolBarListView.BeginUpdate;
  ToolBarListView.Groups.ReIndexDisable:= True;
  for Loop:=0 to FormMain.ToolBarButtons.ButtonCount-1 do
  begin
    iDetail:= '';
    iTitle:= FormMain.ToolBarButtons.Buttons[Loop].Caption;
    iPos:= PosEx('-', iTitle);
    if iPos <> 0 then
       begin
         iDetail:= Copy(iTitle, iPos+1, Length(iTitle));
         Delete(iTitle, iPos, Length(iTitle));
       end;

    AddItem(Loop);
  end;

  iTitle:= 'Search Games';
  iDetail:= '';
  AddItem(FormMain.ToolBarButtons.ButtonCount, True);

  ToolBarListView.Groups.ReIndexDisable:= False;
  ToolBarListView.EndUpdate;
  FormMain.ELV_SelectItem(ToolBarListView, 0);
  BoundToGamesPanel.Tag:= 1;
  BoundToGamesPanel.Checked:= FormMain.MenuBoundToGamesPanel.Checked;

  ShowHideToolBar.Checked:= FormMain.MenuEnableToolBar.Checked;

  LabelToolBarIconSize.Tag:= FormMain.MenuToolBarIconSize.Tag;
  if LabelToolBarIconSize.Tag <> 1 then
     begin
       case LabelToolBarIconSize.Tag of
         0:
           begin
             IconSizeExtraLarge.Down:= True;
             IconSizeExtraLarge.Click;
           end;
         2:
           begin
             IconSizeSmall.Down:= True;
             IconSizeSmall.Click;
           end;
       end;
     end;

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

procedure TFormToolBarEditor.IconSizeLargeClick(Sender: TObject);
begin
  if (TSpeedButton(Sender).Tag = LabelToolBarIconSize.Tag) and (BoundToGamesPanel.Tag = 0) then
     Exit;

  LabelToolBarIconSize.Tag:= TSpeedButton(Sender).Tag;
  case TSpeedButton(Sender).Tag of
    0: LabelIconSizeValue.Caption:= 'Extra Large (68x68)';
    1: LabelIconSizeValue.Caption:= 'Large (48x48)';
    2: LabelIconSizeValue.Caption:= 'Small (30x24)';
  end;
  if BoundToGamesPanel.Tag = 0 then // to prevent setting from executing if screen settings are being loaded!
     FormMain.MenuToolBarIconSize.Items[TSpeedButton(Sender).Tag].Click;
end;


end.
