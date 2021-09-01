unit uImageLayoutSettings_4K;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  StdCtrls, ComCtrls, ExtCtrls, IniFiles, Buttons,
  MPCommonObjects, EasyListview, uCommon, ImgList,
  PanelEx, AdvOfficeButtons, ShadowLabel, GR32_Image, GraphicEx,
  AdvGroupBox, ButtonsEx, BevelEx;

type
  TFormImageLayoutSettings4K = class(TForm)
    IL_Layouts: TImageList;
    IL_ImageCategory: TImageList;
    PanelBottom: TPanelEx;
    ButtonHelp: TBitBtnEx;
    ButtonClose: TBitBtnEx;
    IL_ImageCategory_ExtraLarge: TImageList;
    ButtonAbort: TBitBtnEx;
    ImageScrLayoutFrame: TBevelEx;
    PanelLayoutsSelector: TPanelEx;
    LayoutListView: TEasyListview;
    ImageScrLayout: TImage32;
    GroupBoxCategoryAllSystems: TAdvGroupBoxEx;
    GroupBoxCategoryConsoleComputer: TAdvGroupBoxEx;
    FrameIconLayScr2: TShape;
    FrameIconLayScr3: TShape;
    FrameIconLayScr1: TShape;
    LabelPanel1: TShadowLabel;
    LabelLayScr3: TShadowLabel;
    LabelLayScr2: TShadowLabel;
    IconLayScr1: TImage;
    IconLayScr2: TImage;
    IconLayScr3: TImage;
    LabelLayScr1: TShadowLabel;
    FrameIconLayScr4: TShape;
    LabelLayScr4: TShadowLabel;
    IconLayScr4: TImage;
    LabelPanel4: TShadowLabel;
    LabelPanel2: TShadowLabel;
    LabelPanel3: TShadowLabel;
    PanelEnabledScr2: TAdvOfficeCheckBoxEx;
    PanelEnabledScr3: TAdvOfficeCheckBoxEx;
    ButtonLayoutResetPanelsIndex: TSpeedButtonEx;
    FrameIconLayScr2_ConsComp: TShape;
    FrameIconLayScr3_ConsComp: TShape;
    FrameIconLayScr1_ConsComp: TShape;
    LabelPanel1_ConsComp: TShadowLabel;
    LabelLayScr3_ConsComp: TShadowLabel;
    LabelLayScr2_ConsComp: TShadowLabel;
    IconLayScr1_ConsComp: TImage;
    IconLayScr2_ConsComp: TImage;
    IconLayScr3_ConsComp: TImage;
    LabelLayScr1_ConsComp: TShadowLabel;
    FrameIconLayScr4_ConsComp: TShape;
    LabelLayScr4_ConsComp: TShadowLabel;
    IconLayScr4_ConsComp: TImage;
    LabelPanel4_ConsComp: TShadowLabel;
    LabelPanel3_ConsComp: TShadowLabel;
    ButtonLayoutResetPanelsIndex_ConsComp: TSpeedButtonEx;
    LabelPanel2_ConsComp: TShadowLabel;
    ButtonHelp_CustomCategoryConsComp: TSpeedButtonEx;
    ButtonLayoutCopyCatAllSystems_ConsComp: TSpeedButtonEx;
    PanelSystemTitle: TPanelEx;
    LabelLayoutTitle: TShadowLabel;
    PanelSystemTitleBottom: TPanelEx;
    ShowHideLayoutsPanel: TPanelEx;
    ShowHideLayoutsLabel: TShadowLabel;
    LayoutsRightFrame: TBevelEx;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormImageLayoutSettings4K: TFormImageLayoutSettings4K;

implementation

uses uMain;

{$R *.dfm}



end.


