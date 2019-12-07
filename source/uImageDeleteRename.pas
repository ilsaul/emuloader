unit uImageDeleteRename;

interface

uses
  Windows, Classes, Graphics, Controls, Forms, GR32_Image, StdCtrls, ExtCtrls,
  PanelEx, ShadowLabel, uCommon, uCommonCustom, SysUtils, Buttons, GraphicEx,
  EditEx, ButtonsEx, AdvOfficeButtons;

type
  TFormImageDeleteRename = class(TForm)
    LabelFilename: TShadowLabel;
    RenameImageEditBox: TEditEx;
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
    procedure FormShow(Sender: TObject);
    procedure ButtonOkClick(Sender: TObject);
    procedure RenameImageEditBoxKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure RenameImageEditBoxButtonResetClick(Sender: TObject);
  private
    { Private declarations }
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

procedure TFormImageDeleteRename.FormShow(Sender: TObject);
var
  iFileExt: String;
  iType: TImageType;
begin
  SetFormColors(FormImageDeleteRename, TopBar, BottomBar, LabelGameTitle, LabelGameName, LabelGameStatus, FormMain.MemGameInfo.eGameSetStatus, True);
  if IsNightMode then
     begin
       //if LabelSystemTitle.Tag = 0 then
       //   LabelSystemTitle.Font.Style:= [];
       SetLabelColors(LabelFilename, item_caption_active_color[1], item_caption_active_shadow_color[1]);
       FormMain.SetSystemTitleLabelColors(LabelSystemTitle); // SetLabelColors(LabelSystemTitle, clrLightRed, clrLightBlack, False);

       FormMain.SetSystemTypeLabelColors(LabelSoftwareListTitle);
       SetLabelColors(LabelFileTypeMismatch, clrLightRed, item_caption_active_shadow_color[1]);
       SetLabelColors(LabelDimensions,       clCream, item_caption_active_shadow_color[1]);
       SetLabelColors(LabelFileSize,         clCream, item_caption_active_shadow_color[1]);
       SetLabelColors(LabelDateTime,         clCream, item_caption_active_shadow_color[1]);
       SetLabelColors(LabelFileType,         clCream, item_caption_active_shadow_color[1]);
       SetLabelColors(LabelRenameImage,      clCream, item_caption_active_shadow_color[1]);
       SetPanelNightColors(ImagePreviewFrame, -1, -1, clrBorderGroupBoxGrayBk, clrInnerBorderGroupBoxGrayBk);
       //SetCheckBoxColors(EnableLargePreviewImage, item_caption_active_color[1], item_caption_active_shadow_color[1]);
       //FormMain.SetCheckBoxExCustomIcon(EnableLargePreviewImage);

       //FrameImageCategoryIcon.Style:= vgSimple;
       SetPanelNightColors(FrameImageCategoryIcon, clrLightBlack{clrDarkBlue}, clrLightBlack, clrBorderGroupBoxGrayBk, clrInnerBorderGroupBoxGrayBk);

       SetEditNightColors(RenameImageEditBox);
       FormMain.SetButtonExColors(ButtonOk);
       FormMain.SetButtonExColors(ButtonCancel);
       FormMain.SetButtonExColors(RenameImageEditBoxButtonReset);
     end;

  FormMain.LoadGameIconIntoImage(FormMain.MemGameInfo.eSystemID, FormMain.MemGameInfo.eCustomSystemID, FormMain.MemGameInfo.eROMIdentification, GameIcon, FormMain.MemGameInfo.eSoftwareName, FormMain.MemGameInfo.eIsCustomGame);

  case FormMain.MemGameInfo.eIsCustomGame of
    True:
      begin
        //FormMain.IL_StandardIconsExtraLarge.GetIcon(MaxGameID+FormMain.MemGameInfo.eCustomSystemID, GameIcon.Picture.Icon);
        LabelGameName.Caption:= 'filename: ';
      end;
    False:
      begin
        //FormMain.IL_StandardIconsExtraLarge.GetIcon(FormMain.GetMAMEImageIndex(FormMain.MemGameInfo.eROMIdentification, FormMain.MemGameInfo.eSoftwareName),
        //                                            GameIcon.Picture.Icon);
        LabelGameName.Caption:= 'name: ';
      end;
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
    True : LabelSystemTitle.Caption:= SystemsListCustom[FormMain.MemGameInfo.eCustomSystemID, 0]; // GetFileTypeStr(LabelFilename.Hint);
    False: LabelSystemTitle.Caption:= FormMain.GetArcadeEmulatorDescription(FormMain.MemGameInfo.eSystemID, True); // GetFileTypeStr(LabelFilename.Hint);
  end;
  LabelGameStatus.Visible:= not FormMain.MemGameInfo.eIsCustomGame;
  if LabelGameStatus.Visible then
     LabelGameStatus.Caption:= LabelGameStatus.Hint+#13#10+FormMain.GetGameStatusText(FormMain.MemGameInfo.eGameSetStatus, FormMain.MemGameInfo.eROMIdentification);

  LabelGameTitle.Caption:= FormMain.MemGameInfo.eTitle;

  LabelFilename.Caption:= ImageFileName; // LabelFilename.Hint;

  iType:= FormMain.LoadPreviewImage(ImageFileName, ImagePreview); //LabelFilename.Caption, ImagePreview);
  iFileExt:= ExtractFileExtW(ImageFileName); //LabelFilename.Caption);

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
  LabelFileSize.Caption:= 'Size: '+FormMain.GetSizeType(GetFileSizeW(ImageFileName), False);
  LabelDateTime.Caption:= 'Date/Time: '+FormMain.GetDateTimeStr(FileAgeW(ImageFileName));

  FormMain.LoadIconIntoImage(ImageCategoryArray[ImageCategoryIcon.Tag, 0], ImageCategoryIcon, 2);

  mmResult:= mrCancel;
  RenameImageEditBox.Visible:= FormImageDeleteRename.Tag = 1; // 0 -> delete; 1 -> rename
  LabelRenameImage.Visible:= RenameImageEditBox.Visible;
  RenameImageEditBoxButtonReset.Visible:= RenameImageEditBox.Visible;

  SetColorsGameTopBar(FormMain.MemGameInfo.eGameSetStatus, TopBar); // change top bar color based on game set status

  //case FormMain.MemGameInfo.eGameSetStatus of
  //  0: TopBar.Color1:= $00f0fae5; // green
  //  1: TopBar.Color1:= $00e5f0fa; // red (based on green)
  //  2: TopBar.Color1:= $00eeeeee; // silver (base on green)
  //end;
  if FormImageDeleteRename.Tag = 1 then
    begin
      Caption:= 'Rename Image File';
      ButtonOk.Caption:= 'Rename File';
      RenameImageEditBoxButtonReset.Click; // RenameImageEditBox.Text:= ChangeFileExtW(ExtractFileNameW(ImageFileName), '');
      RenameImageEditBox.SetFocus;
    end;
end;

procedure TFormImageDeleteRename.ButtonOkClick(Sender: TObject);
begin
  mmResult:= TBitBtnEx(Sender).ModalResult;
  Close;
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

end.
