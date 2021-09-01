unit uThumbnailViewSettings;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, ComCtrls,
  StdCtrls, ExtCtrls, Buttons, GraphicEx, AdvOfficeButtons,
  MPCommonObjects, EasyListview, MPCommonUtilities, ShadowLabel, ImgList, PanelEx,
  uMain, uCommon, uCommonCustom, ButtonsEx, AdvGroupBox, ColorBoxEx, XiTrackBar;

type
  TFormThumbnailViewSettings = class(TForm)
    LabelGridWidthSize: TShadowLabel;
    BorderColor: TColorBoxEx;
    ShowBorder: TAdvOfficeCheckBoxEx;
    BorderColorDefault: TBitBtnEx;
    ShowGameTitles: TAdvOfficeCheckBoxEx;
    MaintainAspectRatio: TAdvOfficeCheckBoxEx;
    ShowPreviewScreenshotsPanel: TAdvOfficeCheckBoxEx;
    LabelGridHeightSize: TShadowLabel;
    LabelImageSize: TShadowLabel;
    ELV_ThumbnailPreview: TEasyListview;
    ButtonGridWidthSize_Decrease: TBitBtnEx;
    ButtonGridWidthSize_Increase: TBitBtnEx;
    ButtonGridHeightSize_Decrease: TBitBtnEx;
    ButtonGridHeightSize_Increase: TBitBtnEx;
    PanelBottom: TPanelEx;
    ButtonApply: TBitBtnEx;
    ButtonConfirm: TBitBtnEx;
    ButtonAbort: TBitBtnEx;
    ButtonGridDefault: TBitBtnEx;
    LabelImageSizeValue: TShadowLabel;
    LabelGridWidthSizeValue: TShadowLabel;
    LabelGridHeightSizeValue: TShadowLabel;
    OverlayIconsGroupBox: TAdvGroupBoxEx;
    ShowSystemIcon: TAdvOfficeCheckBoxEx;
    ShowFavoriteIcon: TAdvOfficeCheckBoxEx;
    ShowMediaTypeIcon: TAdvOfficeCheckBoxEx;
    SystemIconSize: TComboBox2Ex;
    ShowGameIcon: TAdvOfficeCheckBoxEx;
    ThumbLeftAlignIcons: TAdvOfficeRadioButtonEx;
    ThumbRightAlignIcons: TAdvOfficeRadioButtonEx;
    ShowIconsWithNoThumbnail: TAdvOfficeCheckBoxEx;
    MediaTypeIconSize: TComboBox2Ex;
    ShowSpecialIcon: TAdvOfficeCheckBoxEx;
    GridWidthSize: TXiTrackBar;
    GridWidthSizeLabelBottom: TShadowLabel;
    GridHeightSizeLabelBottom: TShadowLabel;
    GridHeightSize: TXiTrackBar;
    HideThumbnailImages: TAdvOfficeCheckBoxEx;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure ButtonGridDefaultClick(Sender: TObject);
    procedure ButtonApplyClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BorderColorDefaultClick(Sender: TObject);
    procedure BorderColorSelect(Sender: TObject);
    procedure ShowBorderClick(Sender: TObject);
    procedure ShowGameTitlesClick(Sender: TObject);
    procedure ButtonGridWidthSize_DecreaseClick(Sender: TObject);
    procedure ButtonGridHeightSize_DecreaseClick(Sender: TObject);
    procedure ELV_ThumbnailPreviewItemThumbnailDraw(
      Sender: TCustomEasyListview; Item: TEasyItem; ACanvas: TCanvas;
      ARect: TRect; AlphaBlender: TEasyAlphaBlender;
      var DoDefault: Boolean);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure MaintainAspectRatioClick(Sender: TObject);
    procedure SystemIconSizeSelect(Sender: TObject);
    procedure ButtonAbortClick(Sender: TObject);
    procedure ELV_ThumbnailPreviewItemPaintText(
      Sender: TCustomEasyListview; Item: TEasyItem; Position: Integer;
      ACanvas: TCanvas);
    procedure ShowSystemIconClick(Sender: TObject);
    procedure ShowGameIconClick(Sender: TObject);
    procedure ShowMediaTypeIconClick(Sender: TObject);
    procedure ShowFavoriteIconClick(Sender: TObject);
    procedure ThumbLeftAlignIconsClick(Sender: TObject);
    procedure ShowIconsWithNoThumbnailClick(Sender: TObject);
    procedure MediaTypeIconSizeSelect(Sender: TObject);
    procedure ShowSpecialIconClick(Sender: TObject);
    procedure GridWidthSizeChange(Sender: TObject);
    procedure GridHeightSizeChange(Sender: TObject);
    procedure HideThumbnailImagesClick(Sender: TObject);
  private
    { Private declarations }
    sysIconIndex1, sysIconIndex2: Integer;
    tImageWidth, tImageHeight: Integer; // this is the maximum width x height bounds of the thumb image
    ThumbImageOriginal, ThumbImageResized: array[1..2] of TPNGGraphic; // 1 -> horizontal image; 2 -> vertical image
    ThumbnailLeftMargin, ThumbnailTopMargin: array[1..2] of Byte;
    ThumbnailImageFound, ThumbnailLoaded: array[1..2] of Boolean;

    // 128x128 system icons
    // 128x128 -> res 144x144 minimum - hide game title (font "Segoe UI" size 9)
    // 128x128 -> res 144x178 minimum - show game title (font "Segoe UI" size 9)

    // 128x128 -> res 144x144 minimum - hide game title (font "Segoe UI" size 12)
    // 128x128 -> res 144x186 minimum - show game title (font "Segoe UI" size 12)

    // 68x68 system icons
    // 104x104 -> res 120x120 minimum - hide game title (font "Segoe UI" size 9)
    // 104x104 -> res 120x150 minimum - show game title (font "Segoe UI" size 9)

    // 104x104 -> res 120x120 minimum - hide game title (font "Segoe UI" size 12)
    // 104x104 -> res 120x150 minimum - show game title (font "Segoe UI" size 12)

    CurrentThumbSettings, NewThumbSettings: TThumbnailSettings;
    Current_BorderColor: Integer;

    Current_ShowBorder, Current_ShowGameTitle,
    Current_ShowPreviewScreenshotsPanel: Boolean;

    procedure UpdateImageSize(UpdateWidth, UpdateHeight: Boolean; ForceUpdate: Boolean = False);
    procedure UpdateImageListSize;
    function  MakeThumbnailPreview(abmp: TPNGGraphic; NuWidth, NuHeight: Integer; ThumbnailIndex: Byte): Boolean; // using Scanline mode, fastest :)
    procedure LoadThumbImage;
    procedure UpdateThumbnail(ThumbnailIndex: Byte);
    procedure ItemThumbnailShowIcons(Item: TEasyItem; ACanvas: TCanvas; ARect: TRect);
    procedure UpdateIcons;
    procedure ELV_Update;
    procedure Resize4K;
  public
    { Public declarations }
    iModalResult: Integer;
  end;

var
  FormThumbnailViewSettings: TFormThumbnailViewSettings;

implementation

{$R *.dfm}

procedure TFormThumbnailViewSettings.Resize4K;

  function MoveGridButtons(iButtonDecrease, iButtonIncrease: TBitBtnEx; iLabel: TShadowLabel): Boolean;
  begin
    Result:= True;
    FormMain.Set4KButtonSpecs(iButtonDecrease, 10, iLabel.Top+30, 39, 39, 16);
    FormMain.Set4KButtonSpecs(iButtonIncrease, ClientWidth-39-10, iLabel.Top+30, 39, 39, 16);
  end;

  function MoveGridSizeControls(iGrid: TXiTrackBar; iGridLabel: TShadowLabel; iButtonDecrease: TBitBtnEx): Boolean;
  begin
    Result:= True;
    FormMain.Set4KTrackBarSpecs(iGrid, iButtonDecrease.Left+iButtonDecrease.Width+4, iButtonDecrease.Top-3, 734, 45);
    FormMain.Set4KLabelSpecs(iGridLabel, iGrid.Left, iGrid.Top+49, -1, -1, 16);
    iGridLabel.Caption:= '120           190            260            330           400';
  end;

begin
  if not Is4KMode then
     Exit;

  with FormThumbnailViewSettings do
  begin
    ClientWidth:=   840;
    ClientHeight:= 1075;
    Font.Size:= 16;
    FormMain.Set4KListViewSpecs(ELV_ThumbnailPreview, 10, 10, -1, -1, 16);

    FormMain.Set4KLabelSpecs(LabelImageSize, 273, 418, 295, 33, 16);
    LabelImageSize.Caption:= 'Image Size:               pixels';
    FormMain.Set4KLabelSpecs(LabelImageSizeValue, 403, LabelImageSize.Top, 93, 33, 16);

    FormMain.Set4KCheckBoxSpecs(HideThumbnailImages, 10, LabelImageSize.Top-2, 250, 36, 16);

    // horizontal grid
    FormMain.Set4KLabelSpecs(LabelGridWidthSize, 10, LabelImageSize.Top+50, 287, 31, 16);
    FormMain.Set4KLabelSpecs(LabelGridWidthSizeValue, 200, LabelGridWidthSize.Top, 37, 31, 16);

    MoveGridButtons(ButtonGridWidthSize_Decrease, ButtonGridWidthSize_Increase, LabelGridWidthSize);
    MoveGridSizeControls(GridWidthSize, GridWidthSizeLabelBottom, ButtonGridWidthSize_Decrease);

    // vertical grid
    FormMain.Set4KLabelSpecs(LabelGridHeightSize, 10, GridWidthSizeLabelBottom.Top+44, 259, 31, 16);
    FormMain.Set4KLabelSpecs(LabelGridHeightSizeValue, 172, LabelGridHeightSize.Top, 37, 31, 16);

    MoveGridButtons(ButtonGridHeightSize_Decrease, ButtonGridHeightSize_Increase, LabelGridHeightSize);
    MoveGridSizeControls(GridHeightSize, GridHeightSizeLabelBottom, ButtonGridHeightSize_Decrease);

    // CheckBox
    FormMain.Set4KCheckBoxSpecs(ShowBorder,           10, GridHeightSizeLabelBottom.Top+44, 150, 36, 16);
    FormMain.Set4KCheckBoxSpecs(ShowGameTitles,      233, ShowBorder.Top, 185, 36, 16);
    FormMain.Set4KCheckBoxSpecs(MaintainAspectRatio, 582, ShowBorder.Top, 240, 36, 16);

    FormMain.Set4KColorBoxSpecs(BorderColor, 10, ShowBorder.Top+46);
    FormMain.Set4KButtonSpecs(BorderColorDefault, BorderColor.Left+BorderColor.Width+5, BorderColor.Top, 89, 36, 16);

    FormMain.Set4KCheckBoxSpecs(ShowPreviewScreenshotsPanel, MaintainAspectRatio.Left, MaintainAspectRatio.Top+46, 255, 36, 16);

    FormMain.Set4KGroupBoxSpecs(OverlayIconsGroupBox, 10, BorderColor.Top+64, ClientWidth-20, 175, 16);
    FormMain.Set4KCheckBoxSpecs(ShowIconsWithNoThumbnail, 10, 36, 325, 36, 16);

    FormMain.Set4KCheckBoxSpecs(ShowSystemIcon, 10, ShowIconsWithNoThumbnail.Top+46, 95, 36, 16);
    FormMain.Set4KComboBoxSpecs(SystemIconSize, 112, ShowSystemIcon.Top, 217);

    FormMain.Set4KCheckBoxSpecs(ShowMediaTypeIcon, 10, ShowSystemIcon.Top+46, 95, 36, 16);
    FormMain.Set4KComboBoxSpecs(MediaTypeIconSize, 112, ShowMediaTypeIcon.Top, 217);

    FormMain.Set4KCheckBoxSpecs(ShowGameIcon,     442, ShowIconsWithNoThumbnail.Top, 135, 36, 16);
    FormMain.Set4KCheckBoxSpecs(ShowFavoriteIcon, 442, ShowSystemIcon.Top,           135, 36, 16);
    FormMain.Set4KCheckBoxSpecs(ShowSpecialIcon,  442, ShowMediaTypeIcon.Top,        135, 36, 16);

    FormMain.Set4KRadioButtonSpecs(ThumbLeftAlignIcons,  681, ShowFavoriteIcon.Top, 135, 36, 16);
    FormMain.Set4KRadioButtonSpecs(ThumbRightAlignIcons, 681, ShowSpecialIcon.Top,  135, 36, 16);

    PanelBottom.Height:= 71;
    FormMain.Set4KButtonSpecs(ButtonGridDefault, 10, 16, 180, 45, 16);

    FormMain.Set4KButtonSpecs(ButtonAbort, ClientWidth-10-168, 16, 168, 45, 16);
    FormMain.Set4KButtonSpecs(ButtonConfirm, ButtonAbort.Left-10-168, 16, 168, 45, 16);
    FormMain.Set4KButtonSpecs(ButtonApply, ButtonConfirm.Left-10-168, 16, 168, 45, 16);
  end;
end;

procedure TFormThumbnailViewSettings.FormKeyPress(Sender: TObject; var Key: Char);
begin
  case Key of
    #13: ButtonApply.Click;
    #27: ButtonAbort.Click;
  end;
end;

procedure TFormThumbnailViewSettings.ButtonGridDefaultClick(Sender: TObject);
begin
  if Is4KMode then
     begin
       GridWidthSize.Position:=  272; // 256 icon width
       GridHeightSize.Position:= 332; // 256 icon height
     end
  else
     begin
       GridWidthSize.Position:=  144; // 128 icon width
       GridHeightSize.Position:= 178; // 128 icon height
     end;
  ELV_ThumbnailPreview.Invalidate;
end;

procedure TFormThumbnailViewSettings.ButtonApplyClick(Sender: TObject);
var
  UpdateSettings, UpdateCellGrid: Boolean;
begin
  iModalResult:= TBitBtnEx(Sender).ModalResult;
  FormThumbnailViewSettings.ModalResult:= TBitBtnEx(Sender).ModalResult;
  UpdateSettings:= False;
  UpdateCellGrid:= False;

  if FormMain.ThumbnailSettings.MaintainAspectRatio <> MaintainAspectRatio.Checked then
     begin
       FormMain.ThumbnailSettings.MaintainAspectRatio:= MaintainAspectRatio.Checked;
       UpdateSettings:= True;
       UpdateCellGrid:= True;
     end;

  if FormMain.ThumbnailSettings.ShowSystemIcon <> ShowSystemIcon.Checked then
     begin
       FormMain.ThumbnailSettings.ShowSystemIcon:= ShowSystemIcon.Checked;
       UpdateSettings:= True;
     end;

  if FormMain.ThumbnailSettings.ShowMediaTypeIcon <> ShowMediaTypeIcon.Checked then
     begin
       FormMain.ThumbnailSettings.ShowMediaTypeIcon:= ShowMediaTypeIcon.Checked;
       UpdateSettings:= True;
     end;

  if FormMain.ThumbnailSettings.ShowGameIcon <> ShowGameIcon.Checked then
     begin
       FormMain.ThumbnailSettings.ShowGameIcon:= ShowGameIcon.Checked;
       UpdateSettings:= True;
     end;
     
  if FormMain.ThumbnailSettings.ShowFavoriteIcon <> ShowFavoriteIcon.Checked then
     begin
       FormMain.ThumbnailSettings.ShowFavoriteIcon:= ShowFavoriteIcon.Checked;
       UpdateSettings:= True;
     end;

  if FormMain.ThumbnailSettings.ShowSpecialIcon <> ShowSpecialIcon.Checked then
     begin
       FormMain.ThumbnailSettings.ShowSpecialIcon:= ShowSpecialIcon.Checked;
       UpdateSettings:= True;
     end;

  if FormMain.ThumbnailSettings.ShowIconInNoThumbnail <> ShowIconsWithNoThumbnail.Checked then
     begin
       FormMain.ThumbnailSettings.ShowIconInNoThumbnail:= ShowIconsWithNoThumbnail.Checked;
       UpdateSettings:= True;
     end;

  if FormMain.GamesListView.PaintInfoItem.BorderColor <> BorderColor.Selected then
     FormMain.GamesListView.PaintInfoItem.BorderColor:=  BorderColor.Selected;

  if FormMain.GamesListView.PaintInfoItem.ShowBorder <> ShowBorder.Checked then
     FormMain.GamesListView.PaintInfoItem.ShowBorder:=  ShowBorder.Checked;

  if FormMain.GamesListView.PaintInfoItem.HideCaption <> not ShowGameTitles.Checked then
     begin
       FormMain.GamesListView.PaintInfoItem.HideCaption:= not ShowGameTitles.Checked;
       UpdateSettings:= True;
       UpdateCellGrid:= True;
     end;

  if FormMain.MenuShowImages.Checked <> ShowPreviewScreenshotsPanel.Checked then
     begin
       FormMain.MenuShowImages.Checked:= ShowPreviewScreenshotsPanel.Checked;
       FormMain.MenuShowImages.OnClick(Self);
     end;

  if SystemIconSize.ItemIndex = -1 then
     SystemIconSize.ItemIndex:= 1; // set it to 32x32

  if MediaTypeIconSize.ItemIndex = -1 then
     MediaTypeIconSize.ItemIndex:= 1; // set it to 24x24

  if FormMain.ThumbnailSettings.SystemIconSize <> SystemIconSize.ItemIndex then
     begin
       FormMain.ThumbnailSettings.SystemIconSize:= SystemIconSize.ItemIndex;
       UpdateSettings:= True;
     end;

  if FormMain.ThumbnailSettings.MediaTypeIconSize <> MediaTypeIconSize.ItemIndex then
     begin
       FormMain.ThumbnailSettings.MediaTypeIconSize:= MediaTypeIconSize.ItemIndex;
       UpdateSettings:= True;
     end;

  if FormMain.ThumbnailSettings.Width <> GridWidthSize.Position then
     begin
       FormMain.ThumbnailSettings.Width:= GridWidthSize.Position;
       UpdateSettings:= True;
       UpdateCellGrid:= True;
     end;

  if FormMain.ThumbnailSettings.Height <> GridHeightSize.Position then
     begin
       FormMain.ThumbnailSettings.Height:= GridHeightSize.Position;
       UpdateSettings:= True;
       UpdateCellGrid:= True;
     end;

  if FormMain.ThumbnailSettings.LeftAlignIcons <> ThumbLeftAlignIcons.Checked then
     begin
       FormMain.ThumbnailSettings.LeftAlignIcons:= ThumbLeftAlignIcons.Checked;
       UpdateSettings:= True;
     end;

  if UpdateSettings then
     begin
       if not UpdateCellGrid then
          FormMain.GamesListView.BeginUpdate;
       FormMain.ThumbnailSettings.ArcadeCalculateIconPos:=   True;
       FormMain.ThumbnailSettings.ConsCompCalculateIconPos:= True;
       if not UpdateCellGrid then
          FormMain.GamesListView.EndUpdate(False);
     end;

  if UpdateCellGrid then
     begin
       FormMain.SetThumbGridSize(GridWidthSize.Position, GridHeightSize.Position);
       if FormMain.CheckSelected(FormMain.GamesListView) then
          FormMain.ResetThumbnails(True); // force update the selected item; it doesn't update in SetThumbGridSize()... EasyListView bug ???
       FormMain.ELV_MakeVisible;
     end;

  if TBitBtnEx(Sender).Tag = 1 then
     Close;
end;

function TFormThumbnailViewSettings.MakeThumbnailPreview(abmp: TPNGGraphic; NuWidth, NuHeight: Integer; ThumbnailIndex: Byte): Boolean; // using Scanline mode... fastest :)
type
  TRGBArray = array[0..32767] of TRGBTriple;
  pRGBArray = ^TRGBArray;
var
  xscale, yscale: Single;
  sfrom_y, sfrom_x: Single;
  ifrom_y, ifrom_x: Integer;
  to_y, to_x: Integer;
  weight_x, weight_y: array[0..1] of Single;
  weight: Single;
  new_red, new_green: Integer;
  new_blue: Integer;
  total_red, total_green: Single;
  total_blue: Single;
  ix, iy: Integer;
  bTmp: TPNGGraphic;
  sli, slo: pRGBArray;
  // pointers for scanline access
  liPByte, loPByte, p: PByte;
  // offset increment
  liSize, loSize: integer;
begin
  Result:= ThumbImageOriginal[ThumbnailIndex] <> nil;
  if not Result then
     begin
       FreeAndNil(abmp);
       Exit;
     end;

  abmp.Assign(ThumbImageOriginal[ThumbnailIndex]);
  abmp.PixelFormat:= pf24bit;
  bTmp:= TPNGGraphic.Create;
  bTmp.PixelFormat:= pf24bit;
  bTmp.Width:= NuWidth;
  bTmp.Height:= NuHeight;
  bTmp.Canvas.Lock;
  xscale:= bTmp.Width / (abmp.Width - 1);
  yscale:= bTmp.Height / (abmp.Height - 1);
  liPByte:= abmp.Scanline[0];
  liSize:= integer(abmp.Scanline[1]) - integer(liPByte);
  loPByte:= bTmp.Scanline[0];
  loSize:= integer(bTmp.Scanline[1]) - integer(loPByte);
  for to_y := 0 to bTmp.Height - 1 do
  begin
    sfrom_y := to_y / yscale;
    ifrom_y := Trunc(sfrom_y);
    weight_y[1] := sfrom_y - ifrom_y;
    weight_y[0] := 1 - weight_y[1];
    for to_x := 0 to bTmp.Width - 1 do
    begin
      sfrom_x := to_x / xscale;
      ifrom_x := Trunc(sfrom_x);
      weight_x[1] := sfrom_x - ifrom_x;
      weight_x[0] := 1 - weight_x[1];
      total_red := 0.0;
      total_green := 0.0;
      total_blue := 0.0;
      for ix := 0 to 1 do
      begin
        for iy := 0 to 1 do
        begin
          p := liPByte;
          Inc(p, liSize * (ifrom_y + iy));
          sli := pRGBArray(p);
          new_red := sli[ifrom_x + ix].rgbtRed;
          new_green := sli[ifrom_x + ix].rgbtGreen;
          new_blue := sli[ifrom_x + ix].rgbtBlue;
          weight := weight_x[ix] * weight_y[iy];
          total_red := total_red + new_red * weight;
          total_green := total_green + new_green * weight;
          total_blue := total_blue + new_blue * weight;
        end;
      end;
      p := loPByte;
      Inc(p, loSize * to_y);
      slo := pRGBArray(p);
      slo[to_x].rgbtRed := Round(total_red);
      slo[to_x].rgbtGreen := Round(total_green);
      slo[to_x].rgbtBlue := Round(total_blue);
    end;
  end;
  bTmp.Canvas.UnLock;
  abmp.Width:= bTmp.Width;
  abmp.Height:= bTmp.Height;
  abmp.Canvas.Draw(0, 0, bTmp);
  FreeAndNil(bTmp);
end;

procedure TFormThumbnailViewSettings.LoadThumbImage;
var
  FoundImg_Hor, FoundImg_Vert: Boolean;
  FileHor, FileVert: String;
  //iType: TImageType;
begin
  FileHor:=  FormMain.GetFolderFull(35)+'thumbnail_preview-hor.png';
  FileVert:= FormMain.GetFolderFull(35)+'thumbnail_preview-vert.png';
  FoundImg_Hor:= FileExists(FileHor);
  FoundImg_Vert:= FileExists(FileVert);

  if (not FoundImg_Hor) or (not FoundImg_Vert) then
     begin
       FormMain.InitMessageBox;
       if (not FoundImg_Hor) then
          begin
            FormMain.AddMsgText('File ');
            FormMain.AddMsgText(FileHor, MsgTxtColors.colorFileName, [fsBold]);
            FormMain.AddMsgText(' is missing.');
          end;
       if (not FoundImg_Vert) then
          begin
            if not FoundImg_Hor then
               FormMain.AddMsgText(#13#10);
            FormMain.AddMsgText('File ');
            FormMain.AddMsgText(FileVert, MsgTxtColors.colorFileName, [fsBold]);
            FormMain.AddMsgText(' is missing.');
          end;

       FormMain.AddMsgText(#13#10+'    You can''t customize thumbnails appearance without them.'+#13#10+
                           'Make sure the files are there and click OK button to continue. The frontend will atempt to load them again.');

       FormMain.ShowMessageBox('Error', 'File not found.');
     end;

  ThumbnailImageFound[1]:= FileExists(FileHor);
  ThumbnailImageFound[2]:= FileExists(FileVert);

  if (not ThumbnailImageFound[1]) and (not ThumbnailImageFound[2]) then
     Exit;
  if ThumbnailImageFound[1] then
     begin
       ThumbImageOriginal[1]:= TPNGGraphic.Create;
       ThumbImageOriginal[1].LoadFromFile(FileHor);
       ThumbImageResized[1]:= TPNGGraphic.Create;
     end;

  if ThumbnailImageFound[2] then
     begin
       ThumbImageOriginal[2]:= TPNGGraphic.Create;
       ThumbImageOriginal[2].LoadFromFile(FileVert);
       ThumbImageResized[2]:= TPNGGraphic.Create;
     end;
end;

procedure TFormThumbnailViewSettings.UpdateThumbnail(ThumbnailIndex: Byte);
var
  newWidth, newHeight: Integer;
begin
  if not ThumbnailImageFound[ThumbnailIndex] then
     Exit;
  newWidth:= tImageWidth;
  newHeight:= tImageHeight;
  if MaintainAspectRatio.Checked then
     begin
       if (ThumbImageOriginal[ThumbnailIndex].Width/ThumbImageOriginal[ThumbnailIndex].Height) <= (tImageWidth/tImageHeight) then
          begin
            // stretch height to match
            NewWidth:= MulDiv(tImageHeight, ThumbImageOriginal[ThumbnailIndex].Width, ThumbImageOriginal[ThumbnailIndex].Height);
            //MakeThumbNail(Image, NewWidth, Height);
          end
       else
          begin
            // stretch width to match
            NewHeight:= MulDiv(tImageWidth, ThumbImageOriginal[ThumbnailIndex].Height, ThumbImageOriginal[ThumbnailIndex].Width);
            //MakeThumbNail(Image, Width, NewHeight);
          end;
    end;

  ThumbImageResized[ThumbnailIndex].Canvas.Lock;
  ThumbnailLoaded[ThumbnailIndex]:= MakeThumbnailPreview(ThumbImageResized[ThumbnailIndex], newWidth, newHeight, ThumbnailIndex);
  //ThumbnailReload:= MakeThumbnailPreview(ThumbImageResized, tImageWidth, tImageHeight);
  if not ThumbnailLoaded[ThumbnailIndex] then
     begin
       ThumbImageResized[ThumbnailIndex].Canvas.UnLock;
       Exit;
     end;

  if ThumbImageResized[ThumbnailIndex].Width <= ThumbImageResized[ThumbnailIndex].Height then
     begin
       ThumbnailLeftMargin[ThumbnailIndex]:= (tImageWidth - ThumbImageResized[ThumbnailIndex].Width) div 2;
       if ThumbImageResized[ThumbnailIndex].Height >= ELV_ThumbnailPreview.CellSizes.Thumbnail.Height then
          ThumbnailTopMargin[ThumbnailIndex]:= 0
       else
          ThumbnailTopMargin[ThumbnailIndex]:= (tImageHeight - ThumbImageResized[ThumbnailIndex].Height) div 2;
     end
  else
     begin
       if ThumbImageResized[ThumbnailIndex].Width >= ELV_ThumbnailPreview.CellSizes.Thumbnail.Width then
          ThumbnailLeftMargin[ThumbnailIndex]:= 0
       else
          ThumbnailLeftMargin[ThumbnailIndex]:= (tImageWidth - ThumbImageResized[ThumbnailIndex].Width) div 2;

       ThumbnailTopMargin[ThumbnailIndex]:= (tImageHeight - ThumbImageResized[ThumbnailIndex].Height) div 2;
     end;

  ThumbImageResized[ThumbnailIndex].Canvas.Unlock;
end;

procedure TFormThumbnailViewSettings.FormShow(Sender: TObject);
var
  Item: TEasyItem;
  Loop: Integer;
begin
  Resize4K;
  ButtonApply.Enabled:= FormMain.IsThumbnailView;
  FormMain.ELV_ResetNormalColors(ELV_ThumbnailPreview);
  FormMain.ELV_SetBackgroundColor(ELV_ThumbnailPreview);

  sysIconIndex1:= 22; // HBMAME (Have)
  sysIconIndex2:= MaxGameID+44; // Amiga
  ELV_ThumbnailPreview.ImagesExLarge:= FormMain.IL_StandardIconsUltraLarge;

  if IsNightMode then
     begin
       FormThumbnailViewSettings.Color:= menu_background_color[1];
       SetBottomPanelColors(PanelBottom);

       SetXiTrackBarColors(GridWidthSize);
       SetXiTrackBarColors(GridHeightSize);

       SetGroupBoxBorderStyle(OverlayIconsGroupBox);
       SetGroupBoxColors(OverlayIconsGroupBox, clrBorderGroupBoxGrayBk, clrInnerBorderGroupBoxGrayBk, item_caption_active_color[1], item_caption_active_shadow_color[1], -1, clrMedDarkGray, False);

       SetComboBox2ExColors(SystemIconSize, True);
       SetComboBox2ExColors(MediaTypeIconSize, True);

       SetColorBoxColors(BorderColor, True);
       FormMain.SetWin10DarkScrollBar(BorderColor);

       ELV_ThumbnailPreview.ShowThemedBorderColor:= clrBorderGroupBoxGrayBk;
       for Loop:= 0 to FormThumbnailViewSettings.ComponentCount-1 do
       begin
         if FormThumbnailViewSettings.Components[Loop] is TShadowLabel then
            SetLabelColors(TShadowLabel(FormThumbnailViewSettings.Components[Loop]), item_caption_active_color[1], item_caption_active_shadow_color[1])
         else
         if FormThumbnailViewSettings.Components[Loop] is TAdvOfficeCheckBoxEx then
            begin
              SetCheckBoxColors(TAdvOfficeCheckBoxEx(FormThumbnailViewSettings.Components[Loop]), item_caption_active_color[1], item_caption_active_shadow_color[1]);
              FormMain.SetCheckBoxExCustomIcon(TAdvOfficeCheckBoxEx(FormThumbnailViewSettings.Components[Loop]));
            end
         else
         if FormThumbnailViewSettings.Components[Loop] is TAdvOfficeRadioButtonEx then
            begin
              SetRadioButtonColors(TAdvOfficeRadioButtonEx(FormThumbnailViewSettings.Components[Loop]), item_caption_active_color[1], item_caption_active_shadow_color[1]);
              FormMain.SetRadioButtonExCustomIcon(TAdvOfficeRadioButtonEx(FormThumbnailViewSettings.Components[Loop]));
            end
         else
         if FormThumbnailViewSettings.Components[Loop] is TBitBtnEx then
            FormMain.SetButtonExColors(TBitBtnEx(FormThumbnailViewSettings.Components[Loop]));
       end;
     end;

  if FormMain.GamesListView.BackGround.Enabled then
     begin
       ELV_ThumbnailPreview.BackGround.Image.Assign(FormMain.GamesListView.BackGround.Image);
       ELV_ThumbnailPreview.BackGround.Tile:= FormMain.GamesListView.BackGround.Tile;
       ELV_ThumbnailPreview.BackGround.Enabled:= True;
     end;

  // current values to restore last settings even after if pressing Cancel button, even after using Update button
  Current_BorderColor:= FormMain.GamesListView.PaintInfoItem.BorderColor;
  Current_ShowBorder:= FormMain.GamesListView.PaintInfoItem.ShowBorder;
  Current_ShowGameTitle:= not FormMain.GamesListView.PaintInfoItem.HideCaption;
  CurrentThumbSettings:= FormMain.ThumbnailSettings;

  Current_ShowPreviewScreenshotsPanel:= FormMain.MenuShowImages.Checked;

  NewThumbSettings:= FormMain.ThumbnailSettings;
  NewThumbSettings.ArcadeCalculateIconPos:=   True;
  NewThumbSettings.ConsCompCalculateIconPos:= True;

  ELV_ThumbnailPreview.PaintInfoItem.BorderColor:= FormMain.GamesListView.PaintInfoItem.BorderColor;
  ELV_ThumbnailPreview.PaintInfoItem.ShowBorder:=  FormMain.GamesListView.PaintInfoItem.ShowBorder;
  ELV_ThumbnailPreview.PaintInfoItem.HideCaption:= FormMain.GamesListView.PaintInfoItem.HideCaption;
  //ELV_ThumbnailPreview.Font:= FormMain.Font_Parent;

  BorderColor.Selected:= FormMain.GamesListView.PaintInfoItem.BorderColor;
  ShowBorder.Checked:=   FormMain.GamesListView.PaintInfoItem.ShowBorder;
  ShowGameTitles.Checked:= not FormMain.GamesListView.PaintInfoItem.HideCaption;

  MaintainAspectRatio.Checked:= FormMain.ThumbnailSettings.MaintainAspectRatio;

  ShowSystemIcon.Checked:= FormMain.ThumbnailSettings.ShowSystemIcon;
  SystemIconSize.ItemIndex:= FormMain.ThumbnailSettings.SystemIconSize;
  ShowMediaTypeIcon.Checked:= FormMain.ThumbnailSettings.ShowMediaTypeIcon;
  MediaTypeIconSize.ItemIndex:= FormMain.ThumbnailSettings.MediaTypeIconSize;
  ShowGameIcon.Checked:= FormMain.ThumbnailSettings.ShowGameIcon;
  ShowFavoriteIcon.Checked:= FormMain.ThumbnailSettings.ShowFavoriteIcon;
  ShowSpecialIcon.Checked:= FormMain.ThumbnailSettings.ShowSpecialIcon;
  ShowIconsWithNoThumbnail.Checked:= FormMain.ThumbnailSettings.ShowIconInNoThumbnail;

  ShowPreviewScreenshotsPanel.Checked:= FormMain.MenuShowImages.Checked;
  case FormMain.ThumbnailSettings.LeftAlignIcons of
    True : ThumbLeftAlignIcons.Checked:=  True;
    False: ThumbRightAlignIcons.Checked:= True;
  end;

  LoadThumbImage;

  ELV_ThumbnailPreview.BeginUpdate;
  ELV_ThumbnailPreview.Items.ReIndexDisable:= True;
  Item:= ELV_ThumbnailPreview.Items.Add;
  Item.ImageIndex:= sysIconIndex1;// 0; // HBMAME Have
  Item.Caption:= 'Horizontal';//'Real Bout Fatal Fury 2 - The Newcomers / Real Bout Garou Densetsu 2 - the newcomers (NGM-2400)';

  Item:= ELV_ThumbnailPreview.Items.Add;
  Item.ImageIndex:= sysIconIndex2; // 1; // Amiga
  Item.Caption:= 'Vertical';//'Real Bout Fatal Fury 2 - The Newcomers / Real Bout Garou Densetsu 2 - the newcomers (NGM-2400)';

  ELV_ThumbnailPreview.Items.ReIndexDisable:= False;
  ELV_ThumbnailPreview.EndUpdate;

  ELV_ThumbnailPreview.BeginUpdate;
  FormMain.GetSmallerGameFont(ELV_ThumbnailPreview);
  ELV_ThumbnailPreview.EndUpdate;

  tImageWidth:=  RectWidth (Item.View.ItemRect(Item, nil, ertIcon)) - (2*Item.Border);
  tImageHeight:= RectHeight(Item.View.ItemRect(Item, nil, ertIcon)) - (2*Item.Border);

  LabelImageSizeValue.Caption:= IntToStr(tImageWidth)+'x'+IntToStr(tImageHeight);

  UpdateImageListSize; // force update ImageList
  GridWidthSize.Position:=  ELV_ThumbnailPreview.CellSizes.Thumbnail.Width;
  GridHeightSize.Position:= ELV_ThumbnailPreview.CellSizes.Thumbnail.Height;

  GridWidthSize.OnChange(Self);  // force update
  GridHeightSize.OnChange(Self); // force update

  ELV_ThumbnailPreview.BeginUpdate;
  UpdateThumbnail(1);
  UpdateThumbnail(2);
  ELV_ThumbnailPreview.EndUpdate;

  FormThumbnailViewSettings.Tag:= 0;
end;

procedure TFormThumbnailViewSettings.UpdateImageListSize;
var
  IL_NewSize: Integer;

  function ValidateIL_ExtraLarge(IL_Destination: TImageList): Boolean;
  begin
    Result:= ELV_ThumbnailPreview.ImagesExLarge <> IL_Destination;
    if Result then
       ELV_ThumbnailPreview.ImagesExLarge:= IL_Destination;
  end;

begin
  if (tImageWidth < 68) or (tImageHeight < 68) then
     IL_NewSize:= 48
  else
  if (tImageWidth < 128) or (tImageHeight < 128) then
     IL_NewSize:= 68
  else
     IL_NewSize:= 128;

  if ELV_ThumbnailPreview.ImagesExLarge.Width <> IL_NewSize then
     begin
       ELV_ThumbnailPreview.BeginUpdate;
       case IL_NewSize of
          48: ELV_ThumbnailPreview.ImagesExLarge:= FormMain.IL_StandardIconsExtraLarge;
          68: ELV_ThumbnailPreview.ImagesExLarge:= FormMain.IL_StandardIconsMegaLarge;
         128: ELV_ThumbnailPreview.ImagesExLarge:= FormMain.IL_StandardIconsUltraLarge;
       end;
       ELV_ThumbnailPreview.EndUpdate;
     end;
end;

procedure TFormThumbnailViewSettings.UpdateImageSize(UpdateWidth, UpdateHeight: Boolean; ForceUpdate: Boolean = False);
var
  Item: TEasyItem;
begin
  NewThumbSettings.ArcadeCalculateIconPos:=   True;
  NewThumbSettings.ConsCompCalculateIconPos:= True;
  Item:= ELV_ThumbnailPreview.Groups.FirstItem;
  if UpdateWidth then
     begin
       if (ELV_ThumbnailPreview.CellSizes.Thumbnail.Width <> GridWidthSize.Position) or ForceUpdate then
          begin
            ELV_ThumbnailPreview.CellSizes.Thumbnail.Width:= GridWidthSize.Position;
            tImageWidth:= RectWidth(Item.View.ItemRect(Item, nil, ertIcon)) - (2*Item.Border);
          end;
     end;

  if UpdateHeight then
     begin
       if (ELV_ThumbnailPreview.CellSizes.Thumbnail.Height <> GridHeightSize.Position) or ForceUpdate then
          begin
            ELV_ThumbnailPreview.CellSizes.Thumbnail.Height:= GridHeightSize.Position;
            tImageHeight:= RectHeight(Item.View.ItemRect(Item, nil, ertIcon)) - (2*Item.Border);
          end;
     end;

  LabelImageSizeValue.Caption:= IntToStr(tImageWidth)+'x'+IntToStr(tImageHeight);
  
  if UpdateWidth or UpdateHeight or ForceUpdate then
     begin
       UpdateImageListSize;
       UpdateThumbnail(1);
       UpdateThumbnail(2);
     end;
end;

procedure TFormThumbnailViewSettings.BorderColorDefaultClick(Sender: TObject);
begin
  SetSelectedColorBox(BorderColor, BorderColor.DefaultColorColor);
  BorderColor.Invalidate;
end;

procedure TFormThumbnailViewSettings.BorderColorSelect(Sender: TObject);
begin
  ELV_ThumbnailPreview.PaintInfoItem.BorderColor:= BorderColor.Selected;
end;

procedure TFormThumbnailViewSettings.ShowBorderClick(Sender: TObject);
begin
  ELV_ThumbnailPreview.BeginUpdate;
  ELV_ThumbnailPreview.PaintInfoItem.ShowBorder:= ShowBorder.Checked;
  ELV_ThumbnailPreview.EndUpdate;
end;

procedure TFormThumbnailViewSettings.ShowGameTitlesClick(Sender: TObject);
begin
  ELV_ThumbnailPreview.PaintInfoItem.HideCaption:= not ShowGameTitles.Checked;
  if FormThumbnailViewSettings.Tag = 0 then
     begin
       UpdateImageSize(False, True, True);
       ELV_ThumbnailPreview.Invalidate;
     end;
end;

procedure TFormThumbnailViewSettings.ButtonGridWidthSize_DecreaseClick(
  Sender: TObject);
begin
  GridWidthSize.Position:= GridWidthSize.Position+TBitBtnEx(Sender).Tag;
end;

procedure TFormThumbnailViewSettings.ButtonGridHeightSize_DecreaseClick(
  Sender: TObject);
begin
  GridHeightSize.Position:= GridHeightSize.Position+TBitBtnEx(Sender).Tag;
end;

procedure TFormThumbnailViewSettings.ItemThumbnailShowIcons(Item: TEasyItem; ACanvas: TCanvas; ARect: TRect);
var
  xPosFav, yPosFav, TypeROM: Integer;
  IsCustomGame: Boolean;
begin
  if (not NewThumbSettings.ShowSystemIcon)    and
     (not NewThumbSettings.ShowMediaTypeIcon) and
     (not NewThumbSettings.ShowGameIcon)      and
     (not NewThumbSettings.ShowFavoriteIcon)  and
     (not NewThumbSettings.ShowSpecialIcon)   then
     Exit; // nothing to do here

  IsCustomGame:= Boolean(Item.ImageIndex = sysIconIndex2);
  FormMain.ThumbnailCalculateIconPos(NewThumbSettings, ARect, IsCustomGame); // 2nd thumbnail is for EmuCon systems

  if NewThumbSettings.ShowSystemIcon then
  begin
    xPosFav:= ARect.Left+NewThumbSettings.SystemIconLeft;
    yPosFav:= ARect.Top+ NewThumbSettings.SystemIconTop;
    if IsCustomGame then
    begin
      case NewThumbSettings.SystemIconSize of
        0: FormMain.IL_StandardIconsStandard.Draw  (ACanvas, xPosFav, yPosFav, MaxGameID+44);
        1: FormMain.IL_StandardIconsLarge.Draw     (ACanvas, xPosFav, yPosFav, MaxGameID+44);
        2: FormMain.IL_StandardIconsExtraLarge.Draw(ACanvas, xPosFav, yPosFav, MaxGameID+44);
        3: FormMain.IL_StandardIconsMegaLarge.Draw (ACanvas, xPosFav, yPosFav, MaxGameID+44);
      end;
    end
    else
    begin
      case NewThumbSettings.SystemIconSize of
        0: FormMain.IL_StandardIconsStandard.Draw  (ACanvas, xPosFav, yPosFav, MaxGameID+MaxConsoleComputerSystems+idHBMAME);
        1: FormMain.IL_StandardIconsLarge.Draw     (ACanvas, xPosFav, yPosFav, MaxGameID+MaxConsoleComputerSystems+idHBMAME);
        2: FormMain.IL_StandardIconsExtraLarge.Draw(ACanvas, xPosFav, yPosFav, MaxGameID+MaxConsoleComputerSystems+idHBMAME);
        3: FormMain.IL_StandardIconsMegaLarge.Draw (ACanvas, xPosFav, yPosFav, MaxGameID+MaxConsoleComputerSystems+idHBMAME);
      end;
    end;
  end;

  if NewThumbSettings.ShowMediaTypeIcon then
  begin
    xPosFav:= ARect.Left+NewThumbSettings.MediaTypeIconLeft;
    yPosFav:= ARect.Top+NewThumbSettings.MediaTypeIconTop;
    if IsCustomGame then
       TypeROM:= 2  // floppy
    else
       TypeROM:= 0; // ROM
    case NewThumbSettings.MediaTypeIconSize of
      0: FormMain.IL_MediaType.Draw           (ACanvas, xPosFav, yPosFav, TypeROM);
      1: FormMain.IL_MediaType_Large.Draw     (ACanvas, xPosFav, yPosFav, TypeROM);
      2: FormMain.IL_MediaType_ExtraLarge.Draw(ACanvas, xPosFav, yPosFav, TypeROM);
      3: 
    end;
  end;

  if NewThumbSettings.ShowGameIcon and (not IsCustomGame) then
  begin
    xPosFav:= ARect.Left+NewThumbSettings.ArcadeGameIconLeft;
    yPosFav:= ARect.Top+NewThumbSettings.ArcadeGameIconTop;
    case NewThumbSettings.MediaTypeIconSize of
      0: FormMain.IL_StandardIconsStandard.Draw  (ACanvas, xPosFav, yPosFav, 22);
      1: FormMain.IL_StandardIconsLarge.Draw     (ACanvas, xPosFav, yPosFav, 22);
      2: FormMain.IL_StandardIconsExtraLarge.Draw(ACanvas, xPosFav, yPosFav, 22);
    end;
  end;

  if NewThumbSettings.ShowFavoriteIcon then
  begin
    if IsCustomGame then
    begin
      xPosFav:= ARect.Left+NewThumbSettings.ConsCompFavoriteIconLeft;
      yPosFav:= ARect.Top+NewThumbSettings.ConsCompFavoriteIconTop;
    end
    else
    begin
      xPosFav:= ARect.Left+NewThumbSettings.ArcadeFavoriteIconLeft;
      yPosFav:= ARect.Top+NewThumbSettings.ArcadeFavoriteIconTop;
    end;
    case NewThumbSettings.MediaTypeIconSize of
      0: FormMain.IL_MediaType.Draw           (ACanvas, xPosFav, yPosFav, 10);
      1: FormMain.IL_MediaType_Large.Draw     (ACanvas, xPosFav, yPosFav, 10);
      2: FormMain.IL_MediaType_ExtraLarge.Draw(ACanvas, xPosFav, yPosFav, 10);
    end;
  end;

  if NewThumbSettings.ShowSpecialIcon then
  begin
    if IsCustomGame then
    begin
      xPosFav:= ARect.Left+NewThumbSettings.ConsCompSpecialIconLeft;
      yPosFav:= ARect.Top+NewThumbSettings.ConsCompSpecialIconTop;
    end
    else
    begin
      xPosFav:= ARect.Left+NewThumbSettings.ArcadeSpecialIconLeft;
      yPosFav:= ARect.Top+NewThumbSettings.ArcadeSpecialIconTop;
    end;
    case NewThumbSettings.MediaTypeIconSize of
      0: FormMain.IL_MediaType.Draw           (ACanvas, xPosFav, yPosFav, 11);
      1: FormMain.IL_MediaType_Large.Draw     (ACanvas, xPosFav, yPosFav, 11);
      2: FormMain.IL_MediaType_ExtraLarge.Draw(ACanvas, xPosFav, yPosFav, 11);
    end;
  end;
end;

procedure TFormThumbnailViewSettings.ELV_Update;
begin
  if FormThumbnailViewSettings.Tag = 0 then
     begin
       ELV_ThumbnailPreview.BeginUpdate;
       UpdateThumbnail(1);
       UpdateThumbnail(2);
       ELV_ThumbnailPreview.EndUpdate;
     end;
end;

procedure TFormThumbnailViewSettings.ELV_ThumbnailPreviewItemThumbnailDraw(
  Sender: TCustomEasyListview; Item: TEasyItem; ACanvas: TCanvas;
  ARect: TRect; AlphaBlender: TEasyAlphaBlender; var DoDefault: Boolean);
begin
  if Item.ImageIndex = sysIconIndex1 then
     begin //0: horizontal thumbnail
       if ThumbnailLoaded[1] and (not HideThumbnailImages.Checked) then
          begin
            ACanvas.Draw(ARect.Left+ThumbnailLeftMargin[1],
                         ARect.Top+ThumbnailTopMargin[1],
                         ThumbImageResized[1]);
            DoDefault:= False;
            ItemThumbnailShowIcons(Item, ACanvas, ARect);
          end
       else
          begin
            if ShowIconsWithNoThumbnail.Checked then
               ItemThumbnailShowIcons(Item, ACanvas, ARect);
          end;
     end
  else
  if Item.ImageIndex = sysIconIndex2 then
     begin // 1: vertical thumbnail
       if ThumbnailLoaded[2] and (not HideThumbnailImages.Checked) then
          begin
            ACanvas.Draw(ARect.Left+ThumbnailLeftMargin[2],
                         ARect.Top+ThumbnailTopMargin[2],
                         ThumbImageResized[2]);
            DoDefault:= False;
            ItemThumbnailShowIcons(Item, ACanvas, ARect);
          end
       else
          if ShowIconsWithNoThumbnail.Checked then
             ItemThumbnailShowIcons(Item, ACanvas, ARect);
     end;
end;

procedure TFormThumbnailViewSettings.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  FreeAndNil(ThumbImageOriginal[1]);
  FreeAndNil(ThumbImageResized[1]);
  FreeAndNil(ThumbImageOriginal[2]);
  FreeAndNil(ThumbImageResized[2]);
end;

procedure TFormThumbnailViewSettings.MaintainAspectRatioClick(Sender: TObject);
begin
  NewThumbSettings.MaintainAspectRatio:= MaintainAspectRatio.Checked;
  ELV_Update;
end;

procedure TFormThumbnailViewSettings.ButtonAbortClick(Sender: TObject);
var
  RestoreSettings, RestoreCellGrid: Boolean;
begin
  iModalResult:= TBitBtnEx(Sender).ModalResult;
  RestoreSettings:= False; // will restore settings only if at least one setting has changed with "Update" button!
  RestoreCellGrid:= False; // will restore thumbnails only
  if FormMain.ThumbnailSettings.MaintainAspectRatio <> CurrentThumbSettings.MaintainAspectRatio then
     begin
       FormMain.ThumbnailSettings.MaintainAspectRatio:= CurrentThumbSettings.MaintainAspectRatio;
       RestoreCellGrid:= True; // must generate thumbnails again
     end;

  if FormMain.ThumbnailSettings.ShowSystemIcon <> CurrentThumbSettings.ShowSystemIcon then
     begin
       FormMain.ThumbnailSettings.ShowSystemIcon:= CurrentThumbSettings.ShowSystemIcon;
       RestoreSettings:= True;
     end;

  if FormMain.ThumbnailSettings.ShowMediaTypeIcon <> CurrentThumbSettings.ShowMediaTypeIcon then
     begin
       FormMain.ThumbnailSettings.ShowMediaTypeIcon:= CurrentThumbSettings.ShowMediaTypeIcon;
       RestoreSettings:= True;
     end;

  if FormMain.ThumbnailSettings.ShowGameIcon <> CurrentThumbSettings.ShowGameIcon then
     begin
       FormMain.ThumbnailSettings.ShowGameIcon:= CurrentThumbSettings.ShowGameIcon;
       RestoreSettings:= True;
     end;

  if FormMain.ThumbnailSettings.ShowFavoriteIcon <> CurrentThumbSettings.ShowFavoriteIcon then
     begin
       FormMain.ThumbnailSettings.ShowFavoriteIcon:= CurrentThumbSettings.ShowFavoriteIcon;
       RestoreSettings:= True;
     end;

  if FormMain.ThumbnailSettings.ShowSpecialIcon <> CurrentThumbSettings.ShowSpecialIcon then
     begin
       FormMain.ThumbnailSettings.ShowSpecialIcon:= CurrentThumbSettings.ShowSpecialIcon;
       RestoreSettings:= True;
     end;

  if FormMain.ThumbnailSettings.ShowIconInNoThumbnail <> CurrentThumbSettings.ShowIconInNoThumbnail then
     begin
       FormMain.ThumbnailSettings.ShowIconInNoThumbnail:= CurrentThumbSettings.ShowIconInNoThumbnail;
       RestoreSettings:= True;
     end;

  if FormMain.ThumbnailSettings.LeftAlignIcons <> CurrentThumbSettings.LeftAlignIcons then
     begin
       FormMain.ThumbnailSettings.LeftAlignIcons:= CurrentThumbSettings.LeftAlignIcons;
       RestoreSettings:= True;
     end;


  if CurrentThumbSettings.SystemIconSize = -1 then
     CurrentThumbSettings.SystemIconSize:= FormMain.ThumbnailSettings.SystemIconSize;
  if FormMain.ThumbnailSettings.SystemIconSize <> CurrentThumbSettings.SystemIconSize then
     begin
       FormMain.ThumbnailSettings.SystemIconSize:= CurrentThumbSettings.SystemIconSize;
       RestoreCellGrid:= True; // must generate thumbnails again
     end;

  if CurrentThumbSettings.MediaTypeIconSize = -1 then
     CurrentThumbSettings.MediaTypeIconSize:= FormMain.ThumbnailSettings.MediaTypeIconSize;
  if FormMain.ThumbnailSettings.MediaTypeIconSize <> CurrentThumbSettings.MediaTypeIconSize then
     begin
       FormMain.ThumbnailSettings.MediaTypeIconSize:= CurrentThumbSettings.MediaTypeIconSize;
       RestoreCellGrid:= True; // must generate thumbnails again
     end;

  if FormMain.GamesListView.PaintInfoItem.HideCaption <> (not Current_ShowGameTitle) then
     begin
       FormMain.GamesListView.PaintInfoItem.HideCaption:= not Current_ShowGameTitle;
       RestoreCellGrid:= True; // must generate thumbnails again
     end;

  if FormMain.GamesListView.PaintInfoItem.BorderColor <> Current_BorderColor then
     FormMain.GamesListView.PaintInfoItem.BorderColor:=  Current_BorderColor; // just restore setting, no need to reset thumbnails

  if FormMain.GamesListView.PaintInfoItem.ShowBorder <> Current_ShowBorder then
     FormMain.GamesListView.PaintInfoItem.ShowBorder:=  Current_ShowBorder; // just restore setting, no need to reset thumbnails

  if FormMain.MenuShowImages.Checked <> Current_ShowPreviewScreenshotsPanel then
     begin
       FormMain.MenuShowImages.Checked:= Current_ShowPreviewScreenshotsPanel;
       FormMain.MenuShowImages.OnClick(Self); // no need to reset thumbnails
     end;

  if FormMain.ThumbnailSettings.Width <> CurrentThumbSettings.Width then
     begin
       FormMain.ThumbnailSettings.Width:= CurrentThumbSettings.Width;
       RestoreCellGrid:= True; // must generate thumbnails again
     end;

  if FormMain.ThumbnailSettings.Height <> CurrentThumbSettings.Height then
     begin
       FormMain.ThumbnailSettings.Height:= CurrentThumbSettings.Height;
       RestoreCellGrid:= True; // must generate thumbnails again
     end;

  if RestoreSettings then
     begin
       if not RestoreCellGrid then
          FormMain.GamesListView.BeginUpdate;
       FormMain.ThumbnailSettings.ArcadeCalculateIconPos:=   True;
       FormMain.ThumbnailSettings.ConsCompCalculateIconPos:= True;
       if not RestoreCellGrid then
          FormMain.GamesListView.EndUpdate(False);
     end;

  if RestoreCellGrid then
     begin
       FormMain.SetThumbGridSize(CurrentThumbSettings.Width, CurrentThumbSettings.Height);
       if FormMain.CheckSelected(FormMain.GamesListView) then
          FormMain.ResetThumbnails(True); // force update the selected item; it doesn't update in SetThumbGridSize()... EasyListView bug ???
     end;

  FormMain.ELV_MakeVisible;
  Close;
end;

procedure TFormThumbnailViewSettings.ELV_ThumbnailPreviewItemPaintText(
  Sender: TCustomEasyListview; Item: TEasyItem; Position: Integer;
  ACanvas: TCanvas);
begin
  if Item.Selected then
     FormMain.ELV_ItemPaintText_General(ELV_ThumbnailPreview, Item, ACanvas);
end;

procedure TFormThumbnailViewSettings.UpdateIcons;
begin
  if FormThumbnailViewSettings.Tag = 0 then
     begin
       ELV_ThumbnailPreview.BeginUpdate;
       NewThumbSettings.ArcadeCalculateIconPos:=   True;
       NewThumbSettings.ConsCompCalculateIconPos:= True;
       ELV_ThumbnailPreview.EndUpdate;
     end;
end;

procedure TFormThumbnailViewSettings.ShowSystemIconClick(Sender: TObject);
begin
  NewThumbSettings.ShowSystemIcon:= ShowSystemIcon.Checked;
  UpdateIcons;
end;

procedure TFormThumbnailViewSettings.ShowGameIconClick(Sender: TObject);
begin
  NewThumbSettings.ShowGameIcon:= ShowGameIcon.Checked;
  UpdateIcons;
end;

procedure TFormThumbnailViewSettings.ShowMediaTypeIconClick(Sender: TObject);
begin
  NewThumbSettings.ShowMediaTypeIcon:= ShowMediaTypeIcon.Checked;
  UpdateIcons;
end;

procedure TFormThumbnailViewSettings.ShowFavoriteIconClick(Sender: TObject);
begin
  NewThumbSettings.ShowFavoriteIcon:= ShowFavoriteIcon.Checked;
  UpdateIcons;
end;

procedure TFormThumbnailViewSettings.ThumbLeftAlignIconsClick(Sender: TObject);
begin
  NewThumbSettings.LeftAlignIcons:= Boolean(TAdvOfficeRadioButtonEx(Sender).Tag);
  UpdateIcons;
end;

procedure TFormThumbnailViewSettings.ShowIconsWithNoThumbnailClick(
  Sender: TObject);
begin
  NewThumbSettings.ShowIconInNoThumbnail:= ShowIconsWithNoThumbnail.Checked;
  UpdateIcons;
end;

procedure TFormThumbnailViewSettings.SystemIconSizeSelect(Sender: TObject);
begin
  NewThumbSettings.SystemIconSize:= SystemIconSize.ItemIndex;
  UpdateIcons;
end;

procedure TFormThumbnailViewSettings.MediaTypeIconSizeSelect(Sender: TObject);
begin
  NewThumbSettings.MediaTypeIconSize:= MediaTypeIconSize.ItemIndex;
  UpdateIcons;
end;

procedure TFormThumbnailViewSettings.ShowSpecialIconClick(Sender: TObject);
begin
  NewThumbSettings.ShowSpecialIcon:= ShowSpecialIcon.Checked;
  UpdateIcons;
end;

procedure TFormThumbnailViewSettings.GridWidthSizeChange(Sender: TObject);
begin
  LabelGridWidthSizeValue.Caption:= IntToStr(GridWidthSize.Position);

  case ELV_ThumbnailPreview.Items.Count of
    1: ELV_ThumbnailPreview.Width:= GridWidthSize.Position+2;
    2: ELV_ThumbnailPreview.Width:= ((GridWidthSize.Position+2)*2)+16;
  end;
  if FormThumbnailViewSettings.Tag = 0 then
     UpdateImageSize(True, False);
end;

procedure TFormThumbnailViewSettings.GridHeightSizeChange(Sender: TObject);
begin
  LabelGridHeightSizeValue.Caption:= IntToStr(GridHeightSize.Position);
  ELV_ThumbnailPreview.Height:= GridHeightSize.Position+2;
  if FormThumbnailViewSettings.Tag = 0 then
     UpdateImageSize(False, True);
end;

procedure TFormThumbnailViewSettings.HideThumbnailImagesClick(
  Sender: TObject);
begin
  ELV_ThumbnailPreview.Invalidate;
end;

end.
