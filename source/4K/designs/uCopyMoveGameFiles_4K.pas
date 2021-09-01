unit uCopyMoveGameFiles;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, uCommon, uCommonCustom, MPCommonObjects, MPCommonUtilities, EasyListview,
  ImgList, StdCtrls, Buttons, ComCtrls, ShadowLabel, PanelEx, ExtCtrls,
  IniFiles, GraphicEx, RichEditURL, ButtonsEx, XiProgressBar;

type
  TFormCopyMoveGameFiles4K = class(TForm)
    PanelProgress: TPanelEx;
    ButtonPause: TBitBtnEx;
    ButtonCancel: TBitBtnEx;
    PanelTop: TPanelEx;
    SystemIcon: TImage;
    LabelGameTitle: TShadowLabel;
    IL_MediaType: TImageList;
    LabelGameNameCloneOf: TShadowLabel;
    LabelCopyToTitle: TShadowLabel;
    LabelCopyTo: TShadowLabel;
    Log: TRichEditURL;
    LabelCanceledByUser: TShadowLabel;
    LabelRemainingFiles: TShadowLabel;
    PanelFileInfo: TPanelEx;
    IconFileType: TImage;
    LabelGameFile: TShadowLabel;
    LabelFileSizeDate: TShadowLabel;
    LabelFileType: TShadowLabel;
    ProgressBar: TXiProgressBar;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormCopyMoveGameFiles4K: TFormCopyMoveGameFiles4K;

implementation

uses uMain, uDeleteMultipleGamesFiles, uDeleteGameFiles;

{$R *.dfm}




end.
