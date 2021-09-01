unit uVideoPreviewSettings_4K;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, IniFiles,
  Dialogs, StdCtrls, Buttons, PanelEx, AdvOfficeButtons, MPCommonObjects,
  EasyListview, ShadowLabel, ExtCtrls, ImgList, uCommon, uCommonCustom,
  EditEx, ButtonsEx; //, ShellAPI;

type
  TFormVideoPreviewSettings4K = class(TForm)
    PanelBottom: TPanelEx;
    ButtonOk: TBitBtnEx;
    ButtonCancel: TBitBtnEx;
    PanelSettings: TPanelEx;
    LabelVideoPreviewFolder: TShadowLabel;
    LabelVideoPreviewMediaPlayerExecutable: TShadowLabel;
    LabelVideoPreviewMediaPlayerParameters: TShadowLabel;
    LabelVideoPreviewAutoPlay: TShadowLabel;
    LabelVideoPreviewDummyVideoParameters: TShadowLabel;
    LabelSnapDirAutoSearch: TShadowLabel;
    VideoPreviewFolder: TEditEx;
    ButtonSelectVideoPreviewFolder: TBitBtnEx;
    VideoPreviewMediaPlayerExecutable: TEditEx;
    ButtonSelectVideoPreviewMediaPlayer: TBitBtnEx;
    VideoPreviewMediaPlayerParameters: TEditEx;
    VideoPreviewAutoPlay: TAdvOfficeCheckBoxEx;
    VideoPreviewParentGameVideo: TAdvOfficeCheckBoxEx;
    ButtonHelpVideoPreviewMediaPlayerParameters: TBitBtnEx;
    VideoPreviewPlayDummyVideo: TAdvOfficeCheckBoxEx;
    ButtonHelpVideoPreviewPlayDummyVideo: TBitBtnEx;
    VideoPreviewDummyVideoParameters: TEditEx;
    ButtonSnaplDirAutoSearchHelp: TBitBtnEx;
    VideoPreviewEnabled: TAdvOfficeCheckBoxEx;
    IL_Systems: TImageList;
    ButtonResetVideoPreviewMediaPlayerParameters: TBitBtnEx;
    ButtonResetVideoPreviewDummyVideoParameters: TBitBtnEx;
    ButtonResetVideoPreviewMediaPlayer: TBitBtnEx;
    ButtonResetVideoPreviewFolder: TBitBtnEx;
    SystemsVideoPreview: TEasyListview;
    ButtonVideoPreviewHelp: TBitBtnEx;
    ButtonVideoPreviewAutoPlayHelp: TBitBtnEx;
    PanelSystemsTitle: TPanelEx;
    LabelSystemType: TShadowLabel;
    LabelSystemNotAvailable: TShadowLabel;
    LabelSystemTitle: TShadowLabel;
    PanelSystemsTitleBottom: TPanelEx;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormVideoPreviewSettings4K: TFormVideoPreviewSettings4K;

implementation

uses uMain;


{$R *.dfm}


end.
