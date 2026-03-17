unit uImageDeleteRename_4K;

interface

uses
  Windows, Classes, Graphics, Controls, Forms, GR32_Image, StdCtrls, ExtCtrls,
  PanelEx, ShadowLabel, uCommon, uCommonCustom, SysUtils, Buttons, GraphicEx,
  ButtonsEx, AdvOfficeButtons, TntStdCtrls, TntEditEx;

type
  TFormImageDeleteRename4K = class(TForm)
    TopBar: TPanelEx;
    LabelGameTitle: TShadowLabel;
    ImagePreviewFrame: TPanelEx;
    ImagePreview: TImage32;
    LabelGameStatus: TShadowLabel;
    GameIcon: TImage;
    LabelGameName: TShadowLabel;
    LabelSystemTitle: TShadowLabel;
    BottomBar: TPanelEx;
    ButtonOk: TBitBtnEx;
    ButtonCancel: TBitBtnEx;
    LabelRenameImage: TShadowLabel;
    FrameImageCategoryIcon: TPanelEx;
    LabelSoftwareListTitle: TShadowLabel;
    LabelFileSize: TShadowLabel;
    LabelDateTime: TShadowLabel;
    LabelFileType: TShadowLabel;
    LabelFileTypeMismatch: TShadowLabel;
    MediaTypeIcon: TImage;
    LabelDimensions: TShadowLabel;
    ImageCategoryIcon: TImage;
    RenameImageEditBoxButtonReset: TBitBtnEx;
    RenameImageEditBox: TTntEditEx;
    LabelFilename: TShadowLabel;
  private
    { Private declarations }
  public
    { Public declarations }

  end;

var
  FormImageDeleteRename4K: TFormImageDeleteRename4K;

implementation

uses uMain;

{$R *.dfm}


end.
