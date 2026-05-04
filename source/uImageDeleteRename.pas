unit uImageDeleteRename;

interface

uses
  Windows, Classes, Graphics, Controls, Forms, GR32_Image, StdCtrls, ExtCtrls,
  PanelEx, ShadowLabel, uCommon, uCommonCustom, SysUtils, Buttons, GraphicEx,
  ButtonsEx, AdvOfficeButtons, TntStdCtrls, TntEditEx;

type
  TFormImageDeleteRename = class(TForm)
    LabelFilename: TShadowLabel;
    TopBar: TPanelEx;
    LabelGameTitle: TShadowLabel;
    ImagePreviewFrame: TPanelEx;
    ImagePreview: TImage32;
    LabelGameStatus: TShadowLabel;
    GameIcon: TImage;
    LabelGameName: TShadowLabel;
    LabelSystemTitle: TShadowLabel;
    PanelBottom: TPanelEx;
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
    procedure FormShow(Sender: TObject);
    procedure ButtonOkClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure RenameImageEditBoxButtonResetClick(Sender: TObject);
    procedure RenameImageEditBoxKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    procedure Resize4K;
  public
    { Public declarations }
    mmResult: Integer;
    ImageFileName: WideString;
  end;

var
  FormImageDeleteRename: TFormImageDeleteRename;

implementation

uses uMain;

{$R *.dfm}

procedure TFormImageDeleteRename.Resize4K;
var
  iPos: Integer;
begin
  if not Is4KMode then
     Exit;

  with FormImageDeleteRename do
  begin
    ClientWidth:= 1360;
    ClientHeight:= 645;
    Font.Size:= 16;

    FormMain.Set4KEmuGameTopPanel(TopBar, GameIcon, MediaTypeIcon, LabelGameTitle, 1205, LabelGameName, 945, LabelGameStatus, 1140);

    FormMain.Set4KPanelSpecs(ImagePreviewFrame, 10, 160, 476, 476);
    FormMain.Set4KImageIconSpecs(ImagePreview, 472);

    PanelBottom.Height:= 71;
    FormMain.Set4KButtonsOkCancelPanel(PanelBottom, ButtonOk, ButtonCancel, False);

    iPos:= ImagePreviewFrame.Left+ImagePreviewFrame.Width+10;
    FormMain.Set4KLabelSpecs(LabelSystemTitle, iPos, ImagePreviewFrame.Top, ClientWidth-10-iPos, 30, 18);
    FormMain.Set4KLabelSpecs(LabelSoftwareListTitle, iPos, LabelSystemTitle.Top+35, LabelSystemTitle.Width, 31, 16);
    FormMain.Set4KLabelFontNameSpecs(LabelSoftwareListTitle);

    FormMain.Set4KLabelSpecs(LabelFilename, iPos, LabelSoftwareListTitle.Top+39, LabelSystemTitle.Width, 57, 18);
    LabelFilename.Font.Style:= [];

    FormMain.Set4KPanelSpecs(FrameImageCategoryIcon, iPos, LabelFilename.Top+89, 144, 144);
    FormMain.Set4KImageIconSpecs(ImageCategoryIcon, 128, 6, 6);

    FormMain.Set4KLabelSpecs(LabelDimensions, FrameImageCategoryIcon.Left+FrameImageCategoryIcon.Width+10, FrameImageCategoryIcon.Top+1, -1, -1, 16);
    FormMain.Set4KLabelSpecs(LabelFileSize,   LabelDimensions.Left,                                        LabelDimensions.Top+28,       -1, -1, 16);
    FormMain.Set4KLabelSpecs(LabelDateTime,   LabelDimensions.Left,                                        LabelFileSize.Top+28,         -1, -1, 16);
    FormMain.Set4KLabelSpecs(LabelFileType,   LabelDimensions.Left,                                        LabelDateTime.Top+28,         -1, -1, 16);

    FormMain.Set4KLabelSpecs(LabelFileTypeMismatch, LabelDimensions.Left+73, LabelFileType.Top+29, -1, -1, 16);

    FormMain.Set4KButtonSpecs(RenameImageEditBoxButtonReset, ClientWidth-89-10, PanelBottom.Top-10-36, 89, 36, 16);
    FormMain.Set4KEditSpecs(RenameImageEditBox, iPos, RenameImageEditBoxButtonReset.Top, RenameImageEditBoxButtonReset.Left-iPos-5, 36, 16);
    FormMain.Set4KLabelSpecs(LabelRenameImage, iPos, RenameImageEditBox.Top-31, -1, -1, 16);
  end;
end;

procedure TFormImageDeleteRename.FormShow(Sender: TObject);
var
  iFileExt: String;
  iType: TImageType;
begin
  Resize4K;
  SetFormColors(FormImageDeleteRename, TopBar, PanelBottom, LabelGameTitle, LabelGameName, LabelGameStatus, FormMain.MemGameInfo.eGameSetStatus, True);
  if IsNightMode then
     begin
       SetLabelColors(LabelFilename, item_caption_active_color[1], item_caption_active_shadow_color[1]);
       FormMain.SetSystemTitleLabelColors(LabelSystemTitle);

       FormMain.SetSystemTypeLabelColors(LabelSoftwareListTitle);
       SetLabelColors(LabelFileTypeMismatch, clrLightRed, item_caption_active_shadow_color[1]);
       SetLabelColors(LabelDimensions,       clCream, item_caption_active_shadow_color[1]);
       SetLabelColors(LabelFileSize,         clCream, item_caption_active_shadow_color[1]);
       SetLabelColors(LabelDateTime,         clCream, item_caption_active_shadow_color[1]);
       SetLabelColors(LabelFileType,         clCream, item_caption_active_shadow_color[1]);
       SetLabelColors(LabelRenameImage,      clCream, item_caption_active_shadow_color[1]);
       SetPanelNightColors(ImagePreviewFrame, -1, -1, clrBorderGroupBoxGrayBk, clrInnerBorderGroupBoxGrayBk);

       //FrameImageCategoryIcon.Style:= vgSimple;
       SetPanelNightColors(FrameImageCategoryIcon, clrLightBlack, clrLightBlack, clrBorderGroupBoxGrayBk, clrInnerBorderGroupBoxGrayBk);

       SetEditNightColors(RenameImageEditBox);
       FormMain.SetButtonExColors(ButtonOk);
       FormMain.SetButtonExColors(ButtonCancel);
       FormMain.SetButtonExColors(RenameImageEditBoxButtonReset);
     end;

  FormMain.LoadSystemROMIdIcon(FormMain.MemGameInfo.eSystemID, FormMain.MemGameInfo.eCustomSystemID, FormMain.MemGameInfo.eROMIdentification, GameIcon, FormMain.MemGameInfo.eSoftwareName, FormMain.MemGameInfo.eGameSetStatus, FormMain.MemGameInfo.eIsCustomGame);

  case FormMain.MemGameInfo.eIsCustomGame of
    True:  LabelGameName.Caption:= 'filename: ';
    False: LabelGameName.Caption:= 'name: ';
  end;

  FormMain.GetMediaTypeIconMsgBox(FormMain.MemGameInfo.eCustomMediaType, FormMain.MemGameInfo.eIsCustomGame,
                                  FormMain.MemGameInfo.eMediaType, FormMain.MemGameInfo.eArcadeCHDMediaType, MediaTypeIcon,
                                  FormMain.MemGameInfo.eSoftwareExecParameter, FormMain.MemGameInfo.eSoftwareName, True);

  LabelGameName.Caption:= LabelGameName.Caption+FormMain.StatusBar_GamesGameName.Caption;
  if FormMain.MemGameInfo.eSoftwareUsageTip <> '' then
     LabelGameName.Caption:= LabelGameName.Caption+#13#10+'usage: '+FormMain.MemGameInfo.eSoftwareUsageTip;

  if FormMain.MemGameInfo.eSoftwareName <> '' then
     begin
       LabelSoftwareListTitle.Visible:= True;
       LabelSoftwareListTitle.Caption:= FormMain.MemGameInfo.eCategory;
     end;

  case FormMain.MemGameInfo.eIsCustomGame of
    True : LabelSystemTitle.Caption:= SystemsListCustom[FormMain.MemGameInfo.eCustomSystemID, 0];
    False: LabelSystemTitle.Caption:= FormMain.GetArcadeEmulatorDescription(FormMain.MemGameInfo.eSystemID, True);
  end;
  LabelGameStatus.Visible:= not FormMain.MemGameInfo.eIsCustomGame;
  if LabelGameStatus.Visible then
     LabelGameStatus.Caption:= LabelGameStatus.Hint+#13#10+FormMain.GetGameStatusText(FormMain.MemGameInfo.eGameSetStatus, FormMain.MemGameInfo.eROMIdentification);

  LabelGameTitle.Caption:= FormMain.MemGameInfo.eTitle;

  LabelFilename.Caption:= ImageFileName;

  iType:= FormMain.LoadPreviewImage(ImageFileName, ImagePreview);
  iFileExt:= ExtractFileExtW(ImageFileName);

  case iType of
    ifPNG:
      begin
        LabelFileTypeMismatch.Visible:= not SameText(iFileExt, '.png');
        LabelFileType.Caption:= 'Type: Portable Network Graphics (PNG)';
      end;
    ifJPG:
      begin
        LabelFileTypeMismatch.Visible:= not SameText(iFileExt, '.jpg');
        LabelFileType.Caption:= 'Type: Joint Photographic Experts Group (JPEG)';
      end;
    ifGIF:
      begin
        LabelFileTypeMismatch.Visible:= not SameText(iFileExt, '.gif');
        LabelFileType.Caption:= 'Type: Graphics Interchange Format (GIF)';
      end;
    ifBMP:
      begin
        LabelFileTypeMismatch.Visible:= not SameText(iFileExt, '.bmp');
        LabelFileType.Caption:= 'Type: Bitmap Image (BMP)';
      end;
  end;

  LabelDimensions.Caption:= 'Dimensions: '+IntToStr(ImagePreview.Bitmap.Width)+'x'+IntToStr(ImagePreview.Bitmap.Height);
  LabelFileSize.Caption:=   'Size: '      +FormMain.GetSizeType(GetFileSizeW(ImageFileName), False);
  LabelDateTime.Caption:=   'Date/Time: ' +FormMain.GetDateTimeStr(FileAgeW(ImageFileName));

  FormMain.AddDefaultIcons(ImageCategoryArray[ImageCategoryIcon.Tag, 0], '', nil, 2, ImageCategoryIcon);

  mmResult:= mrCancel;
  RenameImageEditBox.Visible:= FormImageDeleteRename.Tag = 1; // 0 -> delete; 1 -> rename
  LabelRenameImage.Visible:= RenameImageEditBox.Visible;
  RenameImageEditBoxButtonReset.Visible:= RenameImageEditBox.Visible;

  SetColorsGameTopBar(FormMain.MemGameInfo.eGameSetStatus, TopBar, IsNightMode); // change top bar color based on game set status

  //case FormMain.MemGameInfo.eGameSetStatus of
  //  0: TopBar.Color1:= $00f0fae5; // green
  //  1: TopBar.Color1:= $00e5f0fa; // red (based on green)
  //  2: TopBar.Color1:= $00eeeeee; // silver (base on green)
  //end;
  if FormImageDeleteRename.Tag = 1 then
    begin
      Caption:= 'Rename Image File';
      ButtonOk.Caption:= 'Rename File';
      RenameImageEditBoxButtonReset.Click;
      RenameImageEditBox.SetFocus;
    end;
end;

procedure TFormImageDeleteRename.ButtonOkClick(Sender: TObject);
begin
  mmResult:= TBitBtnEx(Sender).ModalResult;
  Close;
end;

procedure TFormImageDeleteRename.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #27 then
     ButtonCancel.Click;
end;

procedure TFormImageDeleteRename.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if (mmResult = mrOk) then
     if ((FormImageDeleteRename.Tag = 1) and (Trim(RenameImageEditBox.Text) = '')) then
     CanClose:= False;
end;

procedure TFormImageDeleteRename.RenameImageEditBoxButtonResetClick(
  Sender: TObject);
begin
  RenameImageEditBox.Text:= ChangeFileExtW(ExtractFileNameW(ImageFileName), '');
end;

procedure TFormImageDeleteRename.RenameImageEditBoxKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key in ['/', '\', '*', '?', '<', '>', '|', ':', ';', '"'] then
     begin
       Key:= Char(0);
       Exit;
     end;
  case Key of
    #13:
      begin
        Key:= #0; // remove the "ding" sound when pressing ESC/ENTER keys
        ButtonOk.Click;
      end;
    #27:
      begin
        Key:= #0;
        ButtonCancel.Click;
      end;
  end;
end;

end.
