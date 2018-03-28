unit uImageDeleteRename;

interface

uses
  Windows, Classes, Graphics, Controls, Forms, GR32_Image, StdCtrls, ExtCtrls,
  PanelEx, ShadowLabel, uCommon, uCommonCustom, SysUtils, Buttons, GraphicEx;

type
  TFormImageDeleteRename = class(TForm)
    LabelFilename: TShadowLabel;
    RenameImageEditBox: TEdit;
    TopBar: TPanelEx;
    LabelGameTitle: TShadowLabel;
    ImagePreviewFrame: TPanelEx;
    ImagePreview: TImage32;
    LabelGameStatus: TShadowLabel;
    GameIcon: TImage;
    LabelGameDetails: TShadowLabel;
    LabelSystemTitle: TShadowLabel;
    PanelEx1: TPanelEx;
    ButtonOk: TBitBtn;
    ButtonCancel: TBitBtn;
    ShadowNewName: TShadowLabel;
    ImageCategoryIcon: TImage;
    LabelImageCategory: TShadowLabel;
    Shape1: TShape;
    LabelSoftwareListTitle: TShadowLabel;
    LabelFileSize: TShadowLabel;
    LabelDateTime: TShadowLabel;
    LabelFileType: TShadowLabel;
    LabelFileTypeMismatch: TShadowLabel;
    LabelWarningUnicodeFileName: TShadowLabel;
    MediaTypeIcon: TImage;
    procedure ResizeForm;
    procedure FormShow(Sender: TObject);
    procedure ButtonOkClick(Sender: TObject);
    procedure RenameImageEditBoxKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
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

procedure TFormImageDeleteRename.ResizeForm;
begin
  if Screen.Width < 720 then
     begin
       LabelGameTitle.Width:= 556;
       LabelGameStatus.Left:= 538;
       LabelSoftwareListTitle.Width:= 348;
       LabelFilename.Width:= 348;
       LabelFileSize.Width:= 290;
       LabelDateTime.Width:= 290;
       LabelFileType.Width:= 290;
       LabelFileTypeMismatch.Left:= 355;
       ButtonOk.Left:= 424;
       ButtonCancel.Left:= 522;
     end;
end;

procedure TFormImageDeleteRename.FormShow(Sender: TObject);
var
  iFileExt: String;
  iType: TImageType;
begin
  ResizeForm;

  case FormMain.MemGameInfo.eIsCustomGame of
    True:
      begin
        FormMain.IL_StandardIconsExtraLarge.GetIcon(MaxGameID+FormMain.MemGameInfo.eCustomSystemID, GameIcon.Picture.Icon);
        LabelGameDetails.Caption:= 'filename: ';
      end;
    False:
      begin
        FormMain.IL_StandardIconsExtraLarge.GetIcon(FormMain.GetMAMEImageIndex(FormMain.MemGameInfo.eROMIdentification, FormMain.MemGameInfo.eSoftwareName),
                                                    GameIcon.Picture.Icon);
        LabelGameDetails.Caption:= 'name: ';
      end;
  end;

  FormMain.GetMediaTypeIconMsgBox(FormMain.MemGameInfo.eCustomMediaType, FormMain.MemGameInfo.eIsCustomGame, FormMain.MemGameInfo.eMediaType, MediaTypeIcon, FormMain.MemGameInfo.eSoftwareExecParameter);

  //FormMain.LoadGameIDThumbIcon(GameIcon, FormMain.MemGameInfo.eROMIdentification);
  //FormMain.IL_ArcadeSystem_ExtraLarge.GetIcon(FormMain.MemGameInfo.eSystemID, SystemIcon.Picture.Icon);

  LabelGameDetails.Caption:= LabelGameDetails.Caption+FormMain.StatusBar_GamesGameName.Caption;
  if FormMain.MemGameInfo.eSoftwareUsageTip <> '' then
     LabelGameDetails.Caption:= LabelGameDetails.Caption+#13#10+'usage: '+FormMain.MemGameInfo.eSoftwareUsageTip;

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
     LabelGameStatus.Caption:= LabelGameStatus.Caption+FormMain.GetGameStatusText(FormMain.MemGameInfo.eGameSetStatus, FormMain.MemGameInfo.eROMIdentification);
  LabelGameTitle.Caption:= FormMain.MemGameInfo.eTitle;

  LabelFilename.Caption:= ImageFileName; // LabelFilename.Hint;

  iType:= FormMain.LoadPreviewImage(ImageFileName, ImagePreview); //LabelFilename.Caption, ImagePreview);
  iFileExt:= ExtractFileExtW(ImageFileName); //LabelFilename.Caption);

  case iType of
    ifPNG:
      begin
        LabelFileTypeMismatch.Visible:= not SameText(iFileExt, '.png');
        LabelFileType.Caption:= 'File Type: Portable Network Graphics (PNG)';
      end;
    ifJPG:
      begin
        LabelFileTypeMismatch.Visible:= not SameText(iFileExt, '.jpg');
        LabelFileType.Caption:= 'File Type: Joint Photographic Experts Group (JPEG)';
      end;
    ifGIF:
      begin
        LabelFileTypeMismatch.Visible:= not SameText(iFileExt, '.gif');
        LabelFileType.Caption:= 'File Type: Graphics Interchange Format (GIF)';
      end;
    ifBMP:
      begin
        LabelFileTypeMismatch.Visible:= not SameText(iFileExt, '.bmp');
        LabelFileType.Caption:= 'File Type: Bitmap Image (BMP)';
      end;
  end;

  LabelFileSize.Caption:= 'Size: '+FormMain.GetSizeType(GetFileSizeW(ImageFileName), False);
  LabelDateTime.Caption:= 'Date/Time: '+FormMain.GetDateTimeStr(FileAgeW(ImageFileName));

  FormMain.IL_ImagesCategory_Small.GetIcon(ImageCategoryIcon.Tag, ImageCategoryIcon.Picture.Icon);
  case ImageCategoryIcon.Tag of
    0: LabelImageCategory.Caption:= 'Title';
    1: LabelImageCategory.Caption:= 'Snap';
    5: LabelImageCategory.Caption:= 'CPanel';
    6: LabelImageCategory.Caption:= 'Cover';
    8: LabelImageCategory.Caption:= 'Game Art';
    15: LabelImageCategory.Caption:= 'How To';
  else
       LabelImageCategory.Caption:= ImageCategoryArray[ImageCategoryIcon.Tag, 1];
  end;

  mmResult:= mrCancel;
  RenameImageEditBox.Visible:= FormImageDeleteRename.Tag = 1;
  ShadowNewName.Visible:= RenameImageEditBox.Visible;
  // 0 -> delete; 1 -> rename
  case FormMain.MemGameInfo.eGameSetStatus of
    0: TopBar.Color1:= $00f0fae5; // green
    1: TopBar.Color1:= $00e5f0fa; // red (based on green)
    2: TopBar.Color1:= $00eeeeee; // silver (base on green)
  end;
  if FormImageDeleteRename.Tag = 1 then
    begin
      Caption:= 'Rename Image File';
      ButtonOk.Caption:= 'Rename File';
      RenameImageEditBox.Text:= ChangeFileExtW(ExtractFileNameW(ImageFileName), '');
      RenameImageEditBox.SetFocus;
    end;
end;

procedure TFormImageDeleteRename.ButtonOkClick(Sender: TObject);
begin
  mmResult:= TBitBtn(Sender).ModalResult;
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
        Key:= #0; // remove the "ding" sound when pressing ESC/ENTER keys
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

end.
