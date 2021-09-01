unit uThumbnailViewSettings_4K;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, ComCtrls,
  StdCtrls, ExtCtrls, Buttons, GraphicEx, AdvOfficeButtons,
  MPCommonObjects, EasyListview, MPCommonUtilities, ShadowLabel, ImgList, PanelEx,
  uMain, uCommon, uCommonCustom, ButtonsEx, AdvGroupBox, ColorBoxEx, XiTrackBar;

type
  TFormThumbnailViewSettings4K = class(TForm)
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
    IL_Thumbnail: TImageList;
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
    IconsGroupBox: TAdvGroupBoxEx;
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
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormThumbnailViewSettings4K: TFormThumbnailViewSettings4K;

implementation

{$R *.dfm}



end.
