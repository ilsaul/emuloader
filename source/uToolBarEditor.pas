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
  public
    { Public declarations }
  end;

var
  FormToolBarEditor: TFormToolBarEditor;

implementation

uses uMain, uCommon;

{$R *.dfm}

// form with 3 columns and 5 lines (if more tool bar icons are added in future EL builds)
// Form -> 706x570
// EasyListView -> 710x482

procedure TFormToolBarEditor.ButtonDefaultClick(Sender: TObject);
var
  Loop: ShortInt;
begin
  for Loop:=0 to FormMain.ToolBarButtons.ButtonCount-1 do
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
       if Item.Index = (FormMain.ToolBarButtons.ButtonCount-1) then
          begin
            // "Search Games" button / filter
            FormMain.ButtonFilterSearchGames.Tag:= Ord(Item.Checked);
            if FormMain.ButtonFilterTitlePanelMode.Tag = 0 then
               FormMain.PanelSearchGames_ToolBar.Visible:= Item.Checked
            else
               FormMain.ToolBarButtons.Buttons[Item.Index].Visible:= Item.Checked;
          end
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
begin
  // must call FormMain.ButtonFilterTitleClose.Click to close all search panels, and also hide the tool bar attached panel
  // if user uncheck "Search Games"
  
  FormMain.ELV_ResetNormalColors(ToolBarListView);
  if IsNightMode then
     FormMain.ELV_SetNightModeColors(ToolBarListView);
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

      if (Loop = (FormMain.ToolBarButtons.ButtonCount-1)) and (FormMain.ButtonFilterTitlePanelMode.Tag = 0) then
         Checked:= FormMain.PanelSearchGames_ToolBar.Visible
      else
         Checked:= FormMain.ToolBarButtons.Buttons[Loop].Visible;
      if not Checked then
         State:= State+[esosGhosted];

      Details[1]:= 1;
    end;
  end;

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
