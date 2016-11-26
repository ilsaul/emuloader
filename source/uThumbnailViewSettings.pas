unit uThumbnailViewSettings;

interface

uses
  Windows, SysUtils, Classes, Graphics, Controls, Forms,
  ComCtrls, StdCtrls, ExTrackBar, ExtCtrls, Buttons,
  AdvOfficeButtons;

type
  TFormThumbnailView = class(TForm)
    LabelGridSize: TLabel;
    ButtonGridDefault: TBitBtn;
    GridSize: TExTrackBar;
    BorderColor: TColorBox;
    ShowBorder: TAdvOfficeCheckBox;
    BorderColorDefault: TBitBtn;
    ShowGameTitles: TAdvOfficeCheckBox;
    ButtonClose: TBitBtn;
    ButtonApply: TBitBtn;
    ButtonConfirm: TBitBtn;
    KeepAspectRatio: TAdvOfficeCheckBox;
    ShowSystemIcon: TAdvOfficeCheckBox;
    ShowFavoriteIcon: TAdvOfficeCheckBox;
    AlphaBlendedIcons: TAdvOfficeCheckBox;
    SystemIconSize: TComboBox;
    LabelSystemIconSize: TLabel;
    ShowGameIcon: TAdvOfficeCheckBox;
    ShowPreviewScreenshotsPanel: TAdvOfficeCheckBox;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure ButtonGridDefaultClick(Sender: TObject);
    procedure ButtonApplyClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure GridSizeChange(Sender: TObject);
    procedure BorderColorDefaultClick(Sender: TObject);
    procedure BorderColorSelect(Sender: TObject);
    procedure ShowBorderClick(Sender: TObject);
    procedure ShowGameTitlesClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormThumbnailView: TFormThumbnailView;

implementation

uses uMain, uCommon;

{$R *.dfm}

procedure TFormThumbnailView.FormKeyPress(Sender: TObject; var Key: Char);
begin
  case Key of
    #13: ButtonApply.Click;
    #27: ButtonClose.Click;
  end;
end;

procedure TFormThumbnailView.ButtonGridDefaultClick(Sender: TObject);
begin
  GridSize.Position:= 152;
end;

procedure TFormThumbnailView.ButtonApplyClick(Sender: TObject);
begin
  FormMain.MenuThumbnailKeepAspectRatio.Checked:= KeepAspectRatio.Checked;
  FormMain.PopupThumbnailKeepAspectRatio.Checked:= KeepAspectRatio.Checked;

  FormMain.MenuShowFavoriteIconinGamesList.Checked:= ShowFavoriteIcon.Checked;

  FormMain.MenuThumbnailShowSystemIcon.Checked:= ShowSystemIcon.Checked;
  FormMain.MenuThumbnailShowGameIcon.Checked:= ShowGameIcon.Checked;
  
  FormMain.MenuThumbnailAlphaBlendedIcons.Checked:= AlphaBlendedIcons.Checked;
  //FormMain.PopupThumbnailsAlphaBlendedIcons.Checked:= AlphaBlendedIcons.Checked;

  if FormMain.MenuShowImages.Checked <> ShowPreviewScreenshotsPanel.Checked then
     begin
       FormMain.MenuShowImages.Checked:= ShowPreviewScreenshotsPanel.Checked;
       FormMain.MenuShowImages.OnClick(Self);
     end;

  if SystemIconSize.ItemIndex = -1 then
     SystemIconSize.ItemIndex:= 0;
  FormMain.MenuThumbnailSystemIconSize.Tag:= SystemIconSize.ItemIndex;
  FormMain.MenuThumbnailSystemIconSize.Items[SystemIconSize.ItemIndex].Checked:= True;

  FormMain.SetThumbGridSize(GridSize.Position);
  FormMain.ELV_MakeVisible;
  if FormMain.CheckSelected(FormMain.GamesListView) then
     FormMain.ResetThumbnails(True);

  if TBitBtn(Sender).Tag = 1 then
     Close;
end;

procedure TFormThumbnailView.FormShow(Sender: TObject);
begin
  GridSize.Position:= FormMain.GamesListView.CellSizes.Thumbnail.Width;
  BorderColor.Selected:= FormMain.GamesListView.PaintInfoItem.BorderColor;
  ShowBorder.Checked:= FormMain.GamesListView.PaintInfoItem.ShowBorder;
  ShowGameTitles.Checked:= not FormMain.GamesListView.PaintInfoItem.HideCaption;
  KeepAspectRatio.Checked:= FormMain.MenuThumbnailKeepAspectRatio.Checked;

  ShowSystemIcon.Checked:= FormMain.MenuThumbnailShowSystemIcon.Checked;
  SystemIconSize.ItemIndex:= FormMain.MenuThumbnailSystemIconSize.Tag;
  ShowGameIcon.Checked:= FormMain.MenuThumbnailShowGameIcon.Checked;
  ShowFavoriteIcon.Checked:= FormMain.MenuShowFavoriteIconinGamesList.Checked;
  AlphaBlendedIcons.Checked:= FormMain.MenuThumbnailAlphaBlendedIcons.Checked;

  ShowPreviewScreenshotsPanel.Checked:= FormMain.MenuShowImages.Checked;
  //RectWidth( Item.View.ItemRect(Item, nil, ertIcon));
end;

procedure TFormThumbnailView.GridSizeChange(Sender: TObject);
begin
  LabelGridSize.Caption:= Format(LabelGridSize.Hint, [GridSize.Position]);
end;

procedure TFormThumbnailView.BorderColorDefaultClick(Sender: TObject);
begin
  FormMain.SetSelectedColorBox(BorderColor, BorderColor.DefaultColorColor);
end;

procedure TFormThumbnailView.BorderColorSelect(Sender: TObject);
begin
  if FormMain.GamesListView.PaintInfoItem.BorderColor <> BorderColor.Selected then
     FormMain.GamesListView.PaintInfoItem.BorderColor:= BorderColor.Selected;
end;

procedure TFormThumbnailView.ShowBorderClick(Sender: TObject);
begin
  if FormMain.GamesListView.PaintInfoItem.ShowBorder <> ShowBorder.Checked then
     begin
       FormMain.GamesListView.PaintInfoItem.ShowBorder:= ShowBorder.Checked;
       FormMain.GamesListView.Refresh;
     end;
end;

procedure TFormThumbnailView.ShowGameTitlesClick(Sender: TObject);
begin
  FormMain.GamesListView.PaintInfoItem.HideCaption:= not ShowGameTitles.Checked;
end;

end.
