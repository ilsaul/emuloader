unit uImageCategorySettings_4K;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, uCommon, uCommonCustom, StdCtrls, Buttons, MPCommonObjects, EasyListview,
  ShadowLabel, ExtCtrls, PanelEx, ImgList, IniFiles, uMain, EditEx,
  ButtonsEx, ColorBoxEx, AdvOfficeButtons;

type
  TFormImageCategorySettings4K = class(TForm)
    Systems: TEasyListview;
    IL_Systems: TImageList;
    IL_ImageCategory_ExtraLarge: TImageList;
    PanelImageCategories: TPanelEx;
    PanelImageCategorySelector: TPanelEx;
    ButtonZippedImages: TBitBtnEx;
    ButtonOk: TBitBtnEx;
    ButtonCancel: TBitBtnEx;
    ImageCategoryFolder: TEditEx;
    LabelImageCategoryFolder: TShadowLabel;
    ButtonClearImageCategoryFolder: TBitBtnEx;
    ButtonResetImageCategoryFolder: TBitBtnEx;
    ButtonDefaultImageCategoryFolder: TBitBtnEx;
    ButtonImageCategoryFolder: TBitBtnEx;
    ImageSingleBackgroundColorButtonReset: TBitBtnEx;
    ImageSingleBackgroundColor: TColorBoxEx;
    ImageSingleBackgroundColorEnabled: TAdvOfficeCheckBoxEx;
    PanelCategoryTitleBottom: TPanelEx;
    ButtonImageCategoryBackgroundColorReset: TBitBtnEx;
    ImageCategoryBackgroundColor: TColorBoxEx;
    LabelImageBackgroundColor: TShadowLabel;
    LabelCategoryTitle: TShadowLabel;
    ImageCategory_Selector: TEasyListview;
    LabelShowHideCategories: TShadowLabel;
    ShadowLabel1: TShadowLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormImageCategorySettings4K: TFormImageCategorySettings4K;

implementation

{$R *.dfm}


// same config as procedure TFormMain.Set4KConsoleComputerSysPanel(
// EasyListview.Border = 8.

end.

