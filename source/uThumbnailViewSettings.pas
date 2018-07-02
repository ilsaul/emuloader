unit uThumbnailViewSettings;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  ComCtrls, StdCtrls, ExTrackBar, ExtCtrls, Buttons, GraphicEx,
  AdvOfficeButtons, MPCommonObjects, EasyListview, MPCommonUtilities, ShadowLabel, ImgList, uMain, uCommon;

type
  TFormThumbnailView = class(TForm)
    LabelGridWidthSize: TShadowLabel;
    ButtonGridDefault: TBitBtn;
    GridWidthSize: TExTrackBar;
    BorderColor: TColorBox;
    ShowBorder: TAdvOfficeCheckBox;
    BorderColorDefault: TBitBtn;
    ShowGameTitles: TAdvOfficeCheckBox;
    ButtonAbort: TBitBtn;
    ButtonApply: TBitBtn;
    ButtonConfirm: TBitBtn;
    MaintainAspectRatio: TAdvOfficeCheckBox;
    ShowSystemIcon: TAdvOfficeCheckBox;
    ShowFavoriteIcon: TAdvOfficeCheckBox;
    AlphaBlendedIcons: TAdvOfficeCheckBox;
    SystemIconSize: TComboBox;
    ShowGameIcon: TAdvOfficeCheckBox;
    ShowPreviewScreenshotsPanel: TAdvOfficeCheckBox;
    GridHeightSize: TExTrackBar;
    LabelGridHeightSize: TShadowLabel;
    LabelImageSize: TShadowLabel;
    ELV_ThumbnailPreview: TEasyListview;
    IL_Thumbnail: TImageList;
    ButtonGridWidthSize_Decrease: TBitBtn;
    ButtonGridWidthSize_Increase: TBitBtn;
    ButtonGridHeightSize_Decrease: TBitBtn;
    ButtonGridHeightSize_Increase: TBitBtn;
    ThumbLeftAlignIcons: TAdvOfficeRadioButton;
    ThumbRightAlignIcons: TAdvOfficeRadioButton;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure ButtonGridDefaultClick(Sender: TObject);
    procedure ButtonApplyClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure GridWidthSizeChange(Sender: TObject);
    procedure BorderColorDefaultClick(Sender: TObject);
    procedure BorderColorSelect(Sender: TObject);
    procedure ShowBorderClick(Sender: TObject);
    procedure ShowGameTitlesClick(Sender: TObject);
    procedure GridHeightSizeChange(Sender: TObject);
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
  private
    { Private declarations }
    tImageWidth, tImageHeight: Integer; // this is the maximum width x height bounds of the thumb image
    ThumbImageOriginal, ThumbImageResized: array[1..2] of TPNGGraphic; // 1 -> horizontal image; 2 -> vertical image
    ThumbnailLeftMargin, ThumbnailTopMargin: array[1..2] of Byte;
    ThumbnailImageFound, ThumbnailLoaded: array[1..2] of Boolean;

    tSystemIcon, tGameIcon, tFavoriteIcon: TIcon;

    // 128x128 system icons
    // 128x128 -> res 144x144 minimum - hide game title (font "Segoe UI" size 9)
    // 128x128 -> res 144x174 minimum - show game title (font "Segoe UI" size 9)

    // 128x128 -> res 144x144 minimum - hide game title (font "Segoe UI" size 12)
    // 128x128 -> res 144x186 minimum - show game title (font "Segoe UI" size 12)

    // 68x68 system icons
    // 104x104 -> res 120x120 minimum - hide game title (font "Segoe UI" size 9)
    // 104x104 -> res 120x150 minimum - show game title (font "Segoe UI" size 9)

    // 104x104 -> res 120x120 minimum - hide game title (font "Segoe UI" size 12)
    // 104x104 -> res 120x150 minimum - show game title (font "Segoe UI" size 12)

    CurrentThumbSettings: TThumbnailSettings;
    Current_BorderColor: Integer;

    Current_ShowBorder, Current_ShowGameTitle,
    {Current_AlphaBlendedIcons, }Current_ShowPreviewScreenshotsPanel: Boolean;

    //Current_CellWidth, Current_CellHeight: Integer;

    //Current_ShowBorder, Current_ShowGameTitles, Current_MaintainAspectRatio,
    //Current_ShowSystemIcon, Current_ShowGameIcon, Current_ShowFavoriteIcon,
    //Current_AlphaBlendedIcons, Current_ShowPreviewScreenshotsPanel,
    //Current_LeftAlign: Boolean;

    //Current_SystemIconSize, Current_CellWidth, Current_CellHeight: Integer;

    procedure UpdateImageSize(UpdateWidth, UpdateHeight: Boolean; ForceUpdate: Boolean = False);
    procedure UpdateImageListSize;
    function  MakeThumbnailPreview(abmp: TPNGGraphic; NuWidth, NuHeight: Integer; ThumbnailIndex: Byte): Boolean; // using Scanline mode... fastest :)
    procedure LoadSystemIcon;
    procedure LoadThumbImage;
    procedure UpdateThumbnail(ThumbnailIndex: Byte);
    procedure ResizeForm;
  public
    { Public declarations }
    iModalResult: Integer;
  end;

var
  FormThumbnailView: TFormThumbnailView;

implementation

//uses uMain, uCommon;

{$R *.dfm}

procedure TFormThumbnailView.FormKeyPress(Sender: TObject; var Key: Char);
begin
  case Key of
    #13: ButtonApply.Click;
    #27: ButtonAbort.Click;
  end;
end;

procedure TFormThumbnailView.ButtonGridDefaultClick(Sender: TObject);
begin
  GridWidthSize.Position:= 144;
  GridHeightSize.Position:= 174; // 186 -> font "Segoe UI" size 12 ; 174 -> font "Segoe UI" size 9
  ELV_ThumbnailPreview.Invalidate;
end;

procedure TFormThumbnailView.ButtonApplyClick(Sender: TObject);
var
  UpdateSettings: Boolean;
begin
  iModalResult:= TBitBtn(Sender).ModalResult;
  FormThumbnailView.ModalResult:= TBitBtn(Sender).ModalResult;
  UpdateSettings:= False;

  if FormMain.ThumbnailSettings.MaintainAspectRatio <> MaintainAspectRatio.Checked then
     begin
       FormMain.ThumbnailSettings.MaintainAspectRatio:= MaintainAspectRatio.Checked;
       UpdateSettings:= True;
     end;

  if FormMain.ThumbnailSettings.ShowFavoriteIcon <> ShowFavoriteIcon.Checked then
     begin
       FormMain.ThumbnailSettings.ShowFavoriteIcon:= ShowFavoriteIcon.Checked;
       UpdateSettings:= True;
     end;

  if FormMain.ThumbnailSettings.ShowSystemIcon <> ShowSystemIcon.Checked then
     begin
       FormMain.ThumbnailSettings.ShowSystemIcon:= ShowSystemIcon.Checked;
       UpdateSettings:= True;
     end;

  if FormMain.ThumbnailSettings.ShowGameIcon <> ShowGameIcon.Checked then
     begin
       FormMain.ThumbnailSettings.ShowGameIcon:= ShowGameIcon.Checked;
       UpdateSettings:= True;
     end;

  //FormMain.MenuThumbnailAlphaBlendedIcons.Checked:= AlphaBlendedIcons.Checked;
  //FormMain.PopupThumbnailsAlphaBlendedIcons.Checked:= AlphaBlendedIcons.Checked;

  if FormMain.GamesListView.PaintInfoItem.BorderColor <> BorderColor.Selected then
     FormMain.GamesListView.PaintInfoItem.BorderColor:= BorderColor.Selected;

  if FormMain.GamesListView.PaintInfoItem.ShowBorder <> ShowBorder.Checked then
     FormMain.GamesListView.PaintInfoItem.ShowBorder:= ShowBorder.Checked;

  if FormMain.GamesListView.PaintInfoItem.HideCaption <> not ShowGameTitles.Checked then
     begin
       FormMain.GamesListView.PaintInfoItem.HideCaption:= not ShowGameTitles.Checked;
       UpdateSettings:= True;
     end;

  if FormMain.MenuShowImages.Checked <> ShowPreviewScreenshotsPanel.Checked then
     begin
       FormMain.MenuShowImages.Checked:= ShowPreviewScreenshotsPanel.Checked;
       FormMain.MenuShowImages.OnClick(Self);
     end;

  if SystemIconSize.ItemIndex = -1 then
     SystemIconSize.ItemIndex:= 0;

  if FormMain.ThumbnailSettings.SystemIconSize <> SystemIconSize.ItemIndex then
     begin
       FormMain.ThumbnailSettings.SystemIconSize:= SystemIconSize.ItemIndex;
       UpdateSettings:= True;
     end;

  if FormMain.ThumbnailSettings.Width <> GridWidthSize.Position then
     begin
       FormMain.ThumbnailSettings.Width:= GridWidthSize.Position;
       UpdateSettings:= True;
     end;

  if FormMain.ThumbnailSettings.Height <> GridHeightSize.Position then
     begin
       FormMain.ThumbnailSettings.Height:= GridHeightSize.Position;
       UpdateSettings:= True;
     end;

  if FormMain.ThumbnailSettings.LeftAlignIcons <> ThumbLeftAlignIcons.Checked then
     begin
       FormMain.ThumbnailSettings.LeftAlignIcons:= ThumbLeftAlignIcons.Checked;
       UpdateSettings:= True;
     end;

  if UpdateSettings then
     begin
       FormMain.SetThumbGridSize(GridWidthSize.Position, GridHeightSize.Position);
       if FormMain.CheckSelected(FormMain.GamesListView) then
          FormMain.ResetThumbnails(True); // force update the selected item; it doesn't update in SetThumbGridSize()... EasyListView bug ???
     end;

  FormMain.ELV_MakeVisible;
  if TBitBtn(Sender).Tag = 1 then
     Close;
end;

function TFormThumbnailView.MakeThumbnailPreview(abmp: TPNGGraphic; NuWidth, NuHeight: Integer; ThumbnailIndex: Byte): Boolean; // using Scanline mode... fastest :)
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

procedure TFormThumbnailView.LoadSystemIcon;
begin
  FreeAndNil(tSystemIcon);
  tSystemIcon:= TIcon.Create;
  case SystemIconSize.ItemIndex of
    0: FormMain.IL_ArcadeSystem_Small.GetIcon(idHBMAME, tSystemIcon);
    1: FormMain.IL_ArcadeSystem_Large.GetIcon(idHBMAME, tSystemIcon);
    2: FormMain.IL_ArcadeSystem_ExtraLarge.GetIcon(idHBMAME, tSystemIcon);
  end;
end;

procedure TFormThumbnailView.LoadThumbImage;
var
  FoundImg_Hor, FoundImg_Vert: Boolean;
  FileHor, FileVert: String;
  //iType: TImageType;
begin
  FileHor:= FormMain.GetFolderFull(35)+'thumbnail_preview-hor.png';
  FileVert:= FormMain.GetFolderFull(35)+'thumbnail_preview-vert.png';
  FoundImg_Hor:= FileExists(FileHor);
  FoundImg_Vert:= FileExists(FileVert);

  if (not FoundImg_Hor) or (not FoundImg_Vert) then
     begin
       CallMessageBox;
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

       GenerateMessage('Error', 'File not found.');
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

  LoadSystemIcon;

  tGameIcon:= TIcon.Create;
  FormMain.IL_StandardIconsStandard.GetIcon(22, tGameIcon);

  tFavoriteIcon:= TIcon.Create;
  FormMain.LoadThumbnailFavIcon(24, tFavoriteIcon, True);

end;

procedure TFormThumbnailView.UpdateThumbnail(ThumbnailIndex: Byte);
var
  newWidth, newHeight, xPosFav, yPosFav, imgHeightLeft, iSysIconSize, iRightAlignDiff: Integer;
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


  case SystemIconSize.ItemIndex of
    0: iSysIconSize:= 24;
    1: iSysIconSize:= 32;
    2: iSysIconSize:= 48;
  end;

  case ThumbLeftAlignIcons.Checked of
    True: // left align icons
      begin
        xPosFav:= 2;
        yPosFav:= 2;

        if ShowSystemIcon.Checked then
           begin
             ThumbImageResized[ThumbnailIndex].Canvas.Draw(xPosFav, yPosFav, tSystemIcon);
             yPosFav:= iSysIconSize+6; // SystemIcon.Height+4; (TIcon doesn't return width/height values) :_((
           end;

        if ShowGameIcon.Checked then
        begin
          imgHeightLeft:= ThumbImageResized[ThumbnailIndex].Height-(yPosFav+24);
          if imgHeightLeft < 0 then
             begin
               xPosFav:= yPosFav;
               yPosFav:= 2;
            end;
          //yPosFav:= SystemIconSize+4; // SystemIcon.Height+4; (TIcon doesn't return width/height values) :_((
          ThumbImageResized[ThumbnailIndex].Canvas.Draw(xPosFav, yPosFav, tGameIcon);
        end;

        if ShowFavoriteIcon.Checked then
           begin
             if ShowGameIcon.Checked then
                begin
                  imgHeightLeft:= ThumbImageResized[ThumbnailIndex].Height-(yPosFav+24+4+24);
                  if imgHeightLeft < 0 then
                     xPosFav:= xPosFav+28
                  else
                     yPosFav:= yPosFav+28;
                end
             else
             if ShowSystemIcon.Checked then
                begin
                  imgHeightLeft:= ThumbImageResized[ThumbnailIndex].Height-(yPosFav+24);
                  if imgHeightLeft < 0 then
                     begin
                       xPosFav:= iSysIconSize+6;
                       yPosFav:= 2;
                     end;
                end;
                //yPosFav:= yPosFav+24+4;
             ThumbImageResized[ThumbnailIndex].Canvas.Draw(xPosFav, yPosFav, tFavoriteIcon);
             //Image.Canvas.Draw(2, yPosFav, FavoriteIcon);
           end;
      end;
    False: // right align icons
      begin
        xPosFav:= ThumbImageResized[ThumbnailIndex].Width-iSysIconSize-2;
        yPosFav:= 2;

        iRightAlignDiff:= iSysIconSize-24; // for the game icon / favorite icon (24x24)

        if ShowSystemIcon.Checked then
           begin
             ThumbImageResized[ThumbnailIndex].Canvas.Draw(xPosFav, yPosFav, tSystemIcon);
             yPosFav:= iSysIconSize+6; // SystemIcon.Height+4; (TIcon doesn't return width/height values) :_((
           end;

        if ShowGameIcon.Checked then
           begin
             imgHeightLeft:= ThumbImageResized[ThumbnailIndex].Height-(yPosFav+24);
             if imgHeightLeft < 0 then
                begin
                  xPosFav:= xPosFav-28; // yPosFav; // new value May 09, 2017
                  yPosFav:= 2;
                end
             else
                xPosFav:= xPosFav+iRightAlignDiff; // right align icon

             //yPosFav:= SystemIconSize+4; // SystemIcon.Height+4; (TIcon doesn't return width/height values) :_((

             ThumbImageResized[ThumbnailIndex].Canvas.Draw(xPosFav, yPosFav, tGameIcon);
           end;

        if ShowFavoriteIcon.Checked then
           begin
             if ShowGameIcon.Checked then
                begin
                  imgHeightLeft:= ThumbImageResized[ThumbnailIndex].Height-(yPosFav+24+4+24);
                  if imgHeightLeft < 0 then
                     xPosFav:= xPosFav-28
                  else
                     yPosFav:= yPosFav+28;
                end
             else
             if ShowSystemIcon.Checked then
                begin
                  imgHeightLeft:= ThumbImageResized[ThumbnailIndex].Height-(yPosFav+24);
                  if imgHeightLeft < 0 then
                     begin
                       xPosFav:= xPosFav-28;// xPosFav-iSysIconSize-iRightAlignDiff-6; // right align icon ;;;;;;;;; iSysIconSize-6;
                       yPosFav:= 2;
                     end
                  else
                     xPosFav:= xPosFav+iRightAlignDiff; // right align icon
                end
             else
                xPosFav:= xPosFav+iRightAlignDiff;
                //yPosFav:= yPosFav+24+4;
             ThumbImageResized[ThumbnailIndex].Canvas.Draw(xPosFav, yPosFav, tFavoriteIcon);
             //Image.Canvas.Draw(2, yPosFav, FavoriteIcon);
           end;
      end;
  end;

  ThumbImageResized[ThumbnailIndex].Canvas.Unlock;
end;

procedure TFormThumbnailView.ResizeForm;
begin
  case Screen.Width of
    720: FormThumbnailView.Width:= 715;
    800: FormThumbnailView.Width:= 795;
    960..1279: FormThumbnailView.Width:= 810;
    else
    begin
      if Screen.Width >= 1280 then
         FormThumbnailView.Width:= 1225;
    end;
  end;

  if Screen.Height >= 600 then
     begin
       FormThumbnailView.Height:= 467;
       //ButtonGridDefault.Top:= ButtonGridDefault.Top+44;
       ButtonApply.Top:= ButtonApply.Top+47;
       ButtonConfirm.Top:= ButtonConfirm.Top+47;
       ButtonAbort.Top:= ButtonAbort.Top+47;
     end;
end;

procedure TFormThumbnailView.FormShow(Sender: TObject);
var
  Item: TEasyItem;
begin
  ResizeForm;

  ButtonApply.Enabled:= FormMain.IsThumbnailView;
  FormMain.ELV_ResetNormalColors(ELV_ThumbnailPreview);
  FormMain.ELV_SetBackgroundColor(ELV_ThumbnailPreview);
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
  CurrentThumbSettings.MaintainAspectRatio:= FormMain.ThumbnailSettings.MaintainAspectRatio;
  CurrentThumbSettings.ShowSystemIcon:= FormMain.ThumbnailSettings.ShowSystemIcon;
  CurrentThumbSettings.SystemIconSize:= FormMain.ThumbnailSettings.SystemIconSize;
  CurrentThumbSettings.ShowGameIcon:= FormMain.ThumbnailSettings.ShowGameIcon;
  CurrentThumbSettings.ShowFavoriteIcon:= FormMain.ThumbnailSettings.ShowFavoriteIcon;
  CurrentThumbSettings.LeftAlignIcons:= FormMain.ThumbnailSettings.LeftAlignIcons;
  //Current_AlphaBlendedIcons:= FormMain.MenuThumbnailAlphaBlendedIcons.Checked;

  Current_ShowPreviewScreenshotsPanel:= FormMain.MenuShowImages.Checked;

  CurrentThumbSettings.Width:= ELV_ThumbnailPreview.CellSizes.Thumbnail.Width;
  CurrentThumbSettings.Height:= ELV_ThumbnailPreview.CellSizes.Thumbnail.Height;
  //Current_CellWidth:= ELV_ThumbnailPreview.CellSizes.Thumbnail.Width;
  //Current_CellHeight:= ELV_ThumbnailPreview.CellSizes.Thumbnail.Height;

  ELV_ThumbnailPreview.PaintInfoItem.BorderColor:= FormMain.GamesListView.PaintInfoItem.BorderColor;
  ELV_ThumbnailPreview.PaintInfoItem.ShowBorder:= FormMain.GamesListView.PaintInfoItem.ShowBorder;
  ELV_ThumbnailPreview.PaintInfoItem.HideCaption:= FormMain.GamesListView.PaintInfoItem.HideCaption;
  //ELV_ThumbnailPreview.Font:= FormMain.Font_Parent;

  BorderColor.Selected:= FormMain.GamesListView.PaintInfoItem.BorderColor;
  ShowBorder.Checked:= FormMain.GamesListView.PaintInfoItem.ShowBorder;
  ShowGameTitles.Checked:= not FormMain.GamesListView.PaintInfoItem.HideCaption;

  MaintainAspectRatio.Checked:= FormMain.ThumbnailSettings.MaintainAspectRatio;

  ShowSystemIcon.Checked:= FormMain.ThumbnailSettings.ShowSystemIcon;
  SystemIconSize.ItemIndex:= FormMain.ThumbnailSettings.SystemIconSize;
  ShowGameIcon.Checked:= FormMain.ThumbnailSettings.ShowGameIcon;
  ShowFavoriteIcon.Checked:= FormMain.ThumbnailSettings.ShowFavoriteIcon;
  //AlphaBlendedIcons.Checked:= FormMain.MenuThumbnailAlphaBlendedIcons.Checked;

  ShowPreviewScreenshotsPanel.Checked:= FormMain.MenuShowImages.Checked;
  case FormMain.ThumbnailSettings.LeftAlignIcons of
    True : ThumbLeftAlignIcons.Checked:= True;
    False: ThumbRightAlignIcons.Checked:= True;
  end;

  LoadThumbImage;

  ELV_ThumbnailPreview.BeginUpdate;
  ELV_ThumbnailPreview.Items.ReIndexDisable:= True;
  Item:= ELV_ThumbnailPreview.Items.Add;
  Item.ImageIndex:= 0;
  Item.Caption:= 'Horizontal';//'Real Bout Fatal Fury 2 - The Newcomers / Real Bout Garou Densetsu 2 - the newcomers (NGM-2400)';

  if FormThumbnailView.Width > 1000 then
     begin
       Item:= ELV_ThumbnailPreview.Items.Add;
       Item.ImageIndex:= 1;
       Item.Caption:= 'Vertical';//'Real Bout Fatal Fury 2 - The Newcomers / Real Bout Garou Densetsu 2 - the newcomers (NGM-2400)';
     end;

  ELV_ThumbnailPreview.Items.ReIndexDisable:= False;
  ELV_ThumbnailPreview.EndUpdate;

  //TextHeight:= FormMain.GetSmallerGameFont(ELV_ThumbnailPreview.Font)*2; // there is 10 pixels difference when enabling/disabling text ???
  ELV_ThumbnailPreview.BeginUpdate;
  FormMain.GetSmallerGameFont(ELV_ThumbnailPreview);
  ELV_ThumbnailPreview.EndUpdate;

  tImageWidth:= RectWidth(Item.View.ItemRect(Item, nil, ertIcon)) - (2*Item.Border);
  tImageHeight:= RectHeight(Item.View.ItemRect(Item, nil, ertIcon)) - (2*Item.Border);

  //tImageWidth:= GridWidthSize.Position - ((FormMain.GamesListView.PaintInfoItem.Border*2) + 8); // this last "16" is an internal border for the icon Rect ????
  //tImageHeight:= GridHeightSize.Position - (((FormMain.GamesListView.PaintInfoItem.Border*2) + 8)-TextHeight); // this last "16" is an internal border for the icon Rect ????

  LabelImageSize.Caption:= 'Image Size: '+IntToStr(tImageWidth)+'x'+IntToStr(tImageHeight);

  // Image Width:= GridWidthSize.Position - (FormMain.GamesListView.PaintInfoItem.Border*2) + 8; // this last "8" is an internal border for the icon Rect ????
  // Image Height:= GridHeightSize.Position - (FormMain.GamesListView.PaintInfoItem.Border*2) + 8; // this last "8" is an internal border for the icon Rect ????
  // Image Height:= Image Height - ((TextHeight*2);
  //RectWidth( Item.View.ItemRect(Item, nil, ertIcon));
  //                                         ertLabel)) for the text bounds...

  //LoadThumbImage;
  UpdateImageListSize; // force update ImageList
  GridWidthSize.Position:= ELV_ThumbnailPreview.CellSizes.Thumbnail.Width; //ThumbnailWidth;
  GridHeightSize.Position:= ELV_ThumbnailPreview.CellSizes.Thumbnail.Height; //ThumbnailHeight;

  GridWidthSize.OnChange(Self); // force update
  GridHeightSize.OnChange(Self); // force update

  ELV_ThumbnailPreview.BeginUpdate;
  UpdateThumbnail(1);
  UpdateThumbnail(2);
  ELV_ThumbnailPreview.EndUpdate;

  //ELV_ThumbnailPreview.Invalidate;
  FormThumbnailView.Tag:= 0;
end;

procedure TFormThumbnailView.UpdateImageListSize;
var
  IL_NewSize: Integer;
begin
  if (tImageWidth < 128) or (tImageHeight < 128) then
     IL_NewSize:= 68
  else
     IL_NewSize:= 128;

  if IL_Thumbnail.Width <> IL_NewSize then
     begin
       ELV_ThumbnailPreview.BeginUpdate;
       IL_Thumbnail.Clear;
       IL_Thumbnail.Width:= IL_NewSize;
       IL_Thumbnail.Height:= IL_NewSize;
       FormMain.AddDefaultIcons('MAMEParent.ico'{FormMain.GetELGameIconFileName(0)}, FormMain.GetFolderFull(33), IL_Thumbnail); // parent MAME
       FormMain.AddDefaultIcons('HBMAMEParent.ico'{FormMain.GetELGameIconFileName(22)}, FormMain.GetFolderFull(33), IL_Thumbnail); // parent HBMAME
       ELV_ThumbnailPreview.EndUpdate;
     end;
end;

procedure TFormThumbnailView.UpdateImageSize(UpdateWidth, UpdateHeight: Boolean; ForceUpdate: Boolean = False);
var
  Item: TEasyItem;
begin
  Item:= ELV_ThumbnailPreview.Groups.FirstItem;
  if UpdateWidth then
     begin
       if (ELV_ThumbnailPreview.CellSizes.Thumbnail.Width <> GridWidthSize.Position) or ForceUpdate then
          begin
            ELV_ThumbnailPreview.CellSizes.Thumbnail.Width:= GridWidthSize.Position;
            tImageWidth:= RectWidth(Item.View.ItemRect(Item, nil, ertIcon)) - (2*Item.Border);
            //UpdateImageListSize;
          end;
     end;

  if UpdateHeight then
     begin
       if (ELV_ThumbnailPreview.CellSizes.Thumbnail.Height <> GridHeightSize.Position) or ForceUpdate then
          begin
            ELV_ThumbnailPreview.CellSizes.Thumbnail.Height:= GridHeightSize.Position;
            tImageHeight:= RectHeight(Item.View.ItemRect(Item, nil, ertIcon)) - (2*Item.Border);
            //UpdateImageListSize;
          end;
     end;

  LabelImageSize.Caption:= 'Image Size: '+IntToStr(tImageWidth)+'x'+IntToStr(tImageHeight);
  if UpdateWidth or UpdateHeight or ForceUpdate then
     begin
       UpdateImageListSize;
       UpdateThumbnail(1);
       UpdateThumbnail(2);
     end;
  // from AddRequest
  //Request.Width:= RectWidth(Item.View.ItemRect(Item, nil, ertIcon)) - (2*Item.Border);
  //Request.Height:= RectHeight(Item.View.ItemRect(Item, nil, ertIcon)) - (2*Item.Border);

  // from SetThumbGridSize()
  // increase height to fit game title
  //GamesListView.CellSizes.Thumbnail.Height:= HeightSizeIndex+(GamesListView.PaintInfoItem.Border*2)+(iFontSize*2)+2; // updated April 09, 2017

end;

procedure TFormThumbnailView.GridWidthSizeChange(Sender: TObject);
begin
  LabelGridWidthSize.Caption:= Format(LabelGridWidthSize.Hint, [GridWidthSize.Position]);

  case ELV_ThumbnailPreview.Items.Count of
    1: ELV_ThumbnailPreview.Width:= GridWidthSize.Position+2;
    2: ELV_ThumbnailPreview.Width:= ((GridWidthSize.Position+2)*2)+16;// + 17;
  end;
  if FormThumbnailView.Tag = 0 then
     UpdateImageSize(True, False);
end;

procedure TFormThumbnailView.GridHeightSizeChange(Sender: TObject);
begin
  LabelGridHeightSize.Caption:= Format(LabelGridHeightSize.Hint, [GridHeightSize.Position]);
  ELV_ThumbnailPreview.Height:= GridHeightSize.Position+2;
  if FormThumbnailView.Tag = 0 then
     UpdateImageSize(False, True);
end;

procedure TFormThumbnailView.BorderColorDefaultClick(Sender: TObject);
begin
  FormMain.SetSelectedColorBox(BorderColor, BorderColor.DefaultColorColor);
end;

procedure TFormThumbnailView.BorderColorSelect(Sender: TObject);
begin
  ELV_ThumbnailPreview.PaintInfoItem.BorderColor:= BorderColor.Selected;
end;

procedure TFormThumbnailView.ShowBorderClick(Sender: TObject);
begin
  ELV_ThumbnailPreview.BeginUpdate;
  ELV_ThumbnailPreview.PaintInfoItem.ShowBorder:= ShowBorder.Checked;
  ELV_ThumbnailPreview.EndUpdate;
end;

procedure TFormThumbnailView.ShowGameTitlesClick(Sender: TObject);
begin
  ELV_ThumbnailPreview.PaintInfoItem.HideCaption:= not ShowGameTitles.Checked;
  if FormThumbnailView.Tag = 0 then
     begin
       UpdateImageSize(False, True, True);
       ELV_ThumbnailPreview.Invalidate;
     end;
end;

procedure TFormThumbnailView.ButtonGridWidthSize_DecreaseClick(
  Sender: TObject);
begin
  GridWidthSize.Position:= GridWidthSize.Position+TBitBtn(Sender).Tag;
end;

procedure TFormThumbnailView.ButtonGridHeightSize_DecreaseClick(
  Sender: TObject);
begin
  GridHeightSize.Position:= GridHeightSize.Position+TBitBtn(Sender).Tag;
end;

procedure TFormThumbnailView.ELV_ThumbnailPreviewItemThumbnailDraw(
  Sender: TCustomEasyListview; Item: TEasyItem; ACanvas: TCanvas;
  ARect: TRect; AlphaBlender: TEasyAlphaBlender; var DoDefault: Boolean);
begin
  // if Item.Index = 0 then -> 0 - hor image; 1 -> vert image
  //DoDefault:= False;
  case Item.ImageIndex of
    0: // horizontal thumbnail
      begin
        if ThumbnailLoaded[1] then
           begin
             ACanvas.Draw(ARect.Left+ThumbnailLeftMargin[1],
                          ARect.Top+ThumbnailTopMargin[1],
                          ThumbImageResized[1]);
             DoDefault:= False;
           end;
     end;
    1: // vertical thumbnail
      begin
        if ThumbnailLoaded[2] then
           begin
             ACanvas.Draw(ARect.Left+ThumbnailLeftMargin[2],
                          ARect.Top+ThumbnailTopMargin[2],
                          ThumbImageResized[2]);
             DoDefault:= False;
           end;
     end;
  end;
end;

procedure TFormThumbnailView.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  FreeAndNil(ThumbImageOriginal[1]);
  FreeAndNil(ThumbImageResized[1]);
  FreeAndNil(ThumbImageOriginal[2]);
  FreeAndNil(ThumbImageResized[2]);
  FreeAndNil(tSystemIcon);
  FreeAndNil(tGameIcon);
  FreeAndNil(tFavoriteIcon);
end;

procedure TFormThumbnailView.MaintainAspectRatioClick(Sender: TObject);
begin
  if FormThumbnailView.Tag = 0 then
     begin
       ELV_ThumbnailPreview.BeginUpdate;
       UpdateThumbnail(1);
       UpdateThumbnail(2);
       ELV_ThumbnailPreview.EndUpdate;
       //ELV_ThumbnailPreview.Invalidate;
     end;
end;

procedure TFormThumbnailView.SystemIconSizeSelect(Sender: TObject);
begin
  LoadSystemIcon;
  if FormThumbnailView.Tag = 1 then
     Exit;
  ELV_ThumbnailPreview.BeginUpdate;

  UpdateThumbnail(1);
  UpdateThumbnail(2);

  ELV_ThumbnailPreview.EndUpdate;
end;


procedure TFormThumbnailView.ButtonAbortClick(Sender: TObject);
var
  RestoreSettings: Boolean;
begin
  iModalResult:= TBitBtn(Sender).ModalResult;
  RestoreSettings:= False; // will restore settings and reset thumbnails only if at least one setting has changed with "Update" button!
  if FormMain.ThumbnailSettings.MaintainAspectRatio <> CurrentThumbSettings.MaintainAspectRatio then
     begin
       FormMain.ThumbnailSettings.MaintainAspectRatio:= CurrentThumbSettings.MaintainAspectRatio;
       RestoreSettings:= True;
     end;

  if FormMain.ThumbnailSettings.ShowFavoriteIcon <> CurrentThumbSettings.ShowFavoriteIcon then
     begin
       FormMain.ThumbnailSettings.ShowFavoriteIcon:= CurrentThumbSettings.ShowFavoriteIcon;
       RestoreSettings:= True;
     end;

  if FormMain.ThumbnailSettings.ShowSystemIcon <> CurrentThumbSettings.ShowSystemIcon then
     begin
       FormMain.ThumbnailSettings.ShowSystemIcon:= CurrentThumbSettings.ShowSystemIcon;
       RestoreSettings:= True;
     end;

  if FormMain.ThumbnailSettings.ShowGameIcon <> CurrentThumbSettings.ShowGameIcon then
     begin
       FormMain.ThumbnailSettings.ShowGameIcon:= CurrentThumbSettings.ShowGameIcon;
       RestoreSettings:= True;
     end;

  //if FormMain.MenuThumbnailAlphaBlendedIcons.Checked <> Current_AlphaBlendedIcons then
  //   begin
  //     FormMain.MenuThumbnailAlphaBlendedIcons.Checked:= Current_AlphaBlendedIcons;
  //     //FormMain.PopupThumbnailsAlphaBlendedIcons.Checked:= Current_AlphaBlendedIcons;
  //     RestoreSettings:= True;
  //   end;

  if CurrentThumbSettings.SystemIconSize = -1 then
     CurrentThumbSettings.SystemIconSize:= FormMain.ThumbnailSettings.SystemIconSize; //   Current_SystemIconSize:= 0;
  if FormMain.ThumbnailSettings.SystemIconSize <> CurrentThumbSettings.SystemIconSize then
     begin
       FormMain.ThumbnailSettings.SystemIconSize:= CurrentThumbSettings.SystemIconSize;
       RestoreSettings:= True;
     end;

  if FormMain.GamesListView.PaintInfoItem.HideCaption <> (not Current_ShowGameTitle) then
     begin
       FormMain.GamesListView.PaintInfoItem.HideCaption:= not Current_ShowGameTitle;
       RestoreSettings:= True;
     end;

  if FormMain.GamesListView.PaintInfoItem.BorderColor <> Current_BorderColor then
     FormMain.GamesListView.PaintInfoItem.BorderColor:= Current_BorderColor; // just restore setting, no need to reset thumbnails

  if FormMain.GamesListView.PaintInfoItem.ShowBorder <> Current_ShowBorder then
     FormMain.GamesListView.PaintInfoItem.ShowBorder:= Current_ShowBorder; // just restore setting, no need to reset thumbnails

  if FormMain.MenuShowImages.Checked <> Current_ShowPreviewScreenshotsPanel then
     begin
       FormMain.MenuShowImages.Checked:= Current_ShowPreviewScreenshotsPanel;
       FormMain.MenuShowImages.OnClick(Self); // no need to reset thumbnails
     end;

  if FormMain.ThumbnailSettings.Width <> CurrentThumbSettings.Width then
     begin
       FormMain.ThumbnailSettings.Width:= CurrentThumbSettings.Width;
       RestoreSettings:= True;
     end;

  if FormMain.ThumbnailSettings.Height <> CurrentThumbSettings.Height then
     begin
       FormMain.ThumbnailSettings.Height:= CurrentThumbSettings.Height;
       RestoreSettings:= True;
     end;

  if RestoreSettings then
     begin
       FormMain.SetThumbGridSize(CurrentThumbSettings.Width, CurrentThumbSettings.Height);
       if FormMain.CheckSelected(FormMain.GamesListView) then
          FormMain.ResetThumbnails(True); // force update the selected item; it doesn't update in SetThumbGridSize()... EasyListView bug ???
     end;

  FormMain.ELV_MakeVisible;
  Close;
end;


end.
