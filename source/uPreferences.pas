unit uPreferences;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, ComCtrls, Menus, ImgList, IniFiles, GR32_RangeBars,
  GR32_Image, GraphicEx, uGR32Extra;

type
  TFormPreferences = class(TForm)
    PreferencesImageList: TImageList;
    PageControlPreferences: TPageControl;
    TabSheetGeneral: TTabSheet;
    TabSheetAppearance: TTabSheet;
    TabSheetHotRod: TTabSheet;
    TabSheetSlikStik: TTabSheet;
    TabSheetXArcade: TTabSheet;
    ButtonClose: TButton;
    HotRod: TCheckBox;
    HotRodImage: TImage32;
    HotRodSEImageFile: TEdit;
    VisitSlikStikImage: TImage;
    SlikStik: TCheckBox;
    SlikStikImage: TImage32;
    SlikStikImageFile: TEdit;
    XArcade: TCheckBox;
    XArcadeImage: TImage32;
    XArcadeImageFile: TEdit;
    VisitHotRodImage: TImage;
    VisitXArcadeImage: TImage;
    SlikStikSwap2ndPlayerStick: TCheckBox;
    LabelCustomColorsGamesList: TGroupBox;
    LabelListBackground: TLabel;
    ListBackgroundColor: TColorBox;
    ButtonGamesListFont: TButton;
    ButtonGamesListDefaultFont: TButton;
    LabelPicturesColors: TGroupBox;
    LabelTitleSnapshotPicturesBackgroundColor: TLabel;
    TitleSnapshotPicturesBackgroundColor: TColorBox;
    LabelInGameSnapshotPicturesBackgroundColor: TLabel;
    InGameSnapshotPicturesBackgroundColor: TColorBox;
    LabelMarqueePicturesBackgroundColor: TLabel;
    MarqueePicturesBackgroundColor: TColorBox;
    LabelFlyerPicturesBackgroundColor: TLabel;
    FlyerPicturesBackgroundColor: TColorBox;
    LabelCabinetPicturesBackgroundColor: TLabel;
    CabinetPicturesBackgroundColor: TColorBox;
    LabelControlPanelPicturesBackgroundColor: TLabel;
    ControlPanelPicturesBackgroundColor: TColorBox;
    LabelControlPanelLayoutPicturesBackgroundColor: TLabel;
    ControlPanelLayoutPicturesBackgroundColor: TColorBox;
    LabelCustomColorsGeneral: TGroupBox;
    ButtonGeneralFont: TButton;
    ButtonGeneralDefaultFont: TButton;
    PageControlGeneralOptions: TPageControl;
    TabSheetMiscellaneous: TTabSheet;
    TabSheetGames: TTabSheet;
    TabSheetPictures: TTabSheet;
    AverageFPS: TCheckBox;
    ShowStatistics: TCheckBox;
    MinimizeFrontend: TCheckBox;
    NewDescriptionFormat: TCheckBox;
    FillAllCloneColumns: TCheckBox;
    NewPictureNameFormat: TCheckBox;
    ShowParentPictures: TCheckBox;
    LabelAutomaticGameInfo: TGroupBox;
    LabelAutomaticGameInformationFont: TLabel;
    AutomaticGameInformationBackgroundColor: TColorBox;
    ButtonAutomaticGameInfoFont: TButton;
    ButtonAutomaticGameInfoDefaultColorFont: TButton;
    GeneralBackgroundColor: TColorBox;
    LabelGeneralBackgroundColor: TLabel;
    ShowPreliminaryGamesDisabled: TCheckBox;
    HotRodSEImageFileButtonSelect: TButton;
    SlikStikImageFileButtonSelect: TButton;
    XArcadeImageFileButtonSelect: TButton;
    LabelGameSize: TGroupBox;
    ShowGameSizeBits: TCheckBox;
    ShowGameSizeBytes: TCheckBox;
    ShowGameSizeCompressedZip: TCheckBox;
    LabelSplashLogo: TGroupBox;
    SplashLogoButtonSelect: TButton;
    SplashLogo: TEdit;
    LabelDefaultGameIconsFolder: TGroupBox;
    ButtonUpdateGameIconsFolder: TButton;
    DefaultGameIconsFolder: TEdit;
    DefaultGameIconsFolderButtonSelect: TButton;
    TabSheetMAME: TTabSheet;
    MiscellaneousImage: TImage32Ex;
    GamesListImage: TImage32Ex;
    PreviewPicturesImage: TImage32Ex;
    AppearanceImage: TImage32Ex;
    UseCustomOptionsDefault: TCheckBox;
    TabSheetMAMEFolders: TTabSheet;
    MAMEFoldersImage: TImage32Ex;
    ButtonUpdateEmuLoaderFolders: TButton;
    LabelCustomAspectRatioMAME: TGroupBox;
    LabelHorizontalAspectRatio: TLabel;
    LabelHorizontalAspectRatioValue: TLabel;
    LabelVerticalAspectRatio: TLabel;
    LabelVerticalAspectRatioValue: TLabel;
    HorizontalAspectRatio: TGaugeBar;
    VerticalAspectRatio: TGaugeBar;
    UseCustomAspectRatio: TCheckBox;
    LabelExtraParametersMAME: TGroupBox;
    LabelMAMEExecutables: TLabel;
    LabelDOSMAMEExecutables: TLabel;
    UseExtraParametersMAME: TCheckBox;
    ExtraParametersMAME: TEdit;
    ExtraParametersDOSMAME: TEdit;
    MAMEExtraOptionsImage: TImage32Ex;
    CyclePictureTypes: TCheckBox;
    LabelPicturesVisualEffects: TGroupBox;
    SmoothPictures: TCheckBox;
    AspectRatio: TCheckBox;
    PicturesTransparency: TCheckBox;
    PicturesVirtualList: TCheckBox;
    StretchPicture: TCheckBox;
    StretchLargerPictures: TCheckBox;
    ShowGameSize: TCheckBox;
    LabelFolderTitleSnapshots: TGroupBox;
    LabelFolderMarquees: TGroupBox;
    FolderTitleSnapshots: TEdit;
    FolderTitleSnapshotsButtonSelect: TButton;
    FolderMarquees: TEdit;
    FolderMarqueesButtonSelect: TButton;
    LabelFolderFlyers: TGroupBox;
    LabelFolderCabinets: TGroupBox;
    FolderFlyers: TEdit;
    FolderFlyersButtonSelect: TButton;
    LabelFolderGamesFAQ: TGroupBox;
    FolderCabinets: TEdit;
    FolderCabinetsButtonSelect: TButton;
    LabelFolderControlPanels: TGroupBox;
    FolderControlPanels: TEdit;
    FolderControlPanelsButtonSelect: TButton;
    LabelFolderControlPanelLayouts: TGroupBox;
    FolderControlPanelLayouts: TEdit;
    FolderControlPanelLayoutsButtonSelect: TButton;
    LabelFolderIcons: TGroupBox;
    FolderIcons: TEdit;
    FolderIconsButtonSelect: TButton;
    FolderGamesFAQ: TEdit;
    FolderGamesFAQButtonSelect: TButton;
    UseCustomGameDescription: TCheckBox;
    UseCustomGameCategory: TCheckBox;
    AuditCHDFiles: TCheckBox;
    procedure ButtonCloseClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure AspectRatioClick(Sender: TObject);
    procedure ShowParentPicturesClick(Sender: TObject);
    procedure NewDescriptionFormatClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure ShowGameSizeBitsClick(Sender: TObject);
    procedure ShowGameSizeBytesClick(Sender: TObject);
    procedure ShowGameSizeCompressedZipClick(Sender: TObject);
    procedure ShowGameSizeClick(Sender: TObject);
    procedure FillAllCloneColumnsClick(Sender: TObject);
    procedure HotRodClick(Sender: TObject);
    procedure StretchLargerPicturesClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SmoothPicturesClick(Sender: TObject);
    procedure XArcadeClick(Sender: TObject);
    procedure SlikStikClick(Sender: TObject);
    procedure VisitSlikStikImageClick(Sender: TObject);
    procedure VisitHotRodImageClick(Sender: TObject);
    procedure VisitXArcadeImageClick(Sender: TObject);
    procedure ListBackgroundColorSelect(Sender: TObject);
    procedure TitleSnapshotPicturesBackgroundColorSelect(Sender: TObject);
    procedure InGameSnapshotPicturesBackgroundColorSelect(Sender: TObject);
    procedure MarqueePicturesBackgroundColorSelect(Sender: TObject);
    procedure FlyerPicturesBackgroundColorSelect(Sender: TObject);
    procedure CabinetPicturesBackgroundColorSelect(Sender: TObject);
    procedure ControlPanelPicturesBackgroundColorSelect(Sender: TObject);
    procedure ControlPanelLayoutPicturesBackgroundColorSelect(
      Sender: TObject);
    procedure ButtonGamesListFontClick(Sender: TObject);
    procedure ButtonGamesListDefaultFontClick(Sender: TObject);
    procedure ButtonGeneralFontClick(Sender: TObject);
    procedure ButtonGeneralDefaultFontClick(Sender: TObject);
    procedure ButtonAutomaticGameInfoFontClick(Sender: TObject);
    procedure AutomaticGameInformationBackgroundColorSelect(
      Sender: TObject);
    procedure ButtonAutomaticGameInfoDefaultColorFontClick(Sender: TObject);
    procedure GeneralBackgroundColorSelect(Sender: TObject);
    procedure ShowPreliminaryGamesDisabledClick(Sender: TObject);
    procedure SplashLogoButtonSelectClick(Sender: TObject);
    procedure DefaultGameIconsFolderButtonSelectClick(Sender: TObject);
    procedure HotRodSEImageFileButtonSelectClick(Sender: TObject);
    procedure SlikStikImageFileButtonSelectClick(Sender: TObject);
    procedure XArcadeImageFileButtonSelectClick(Sender: TObject);
    procedure ButtonUpdateGameIconsFolderClick(Sender: TObject);
    procedure HorizontalAspectRatioChange(Sender: TObject);
    procedure VerticalAspectRatioChange(Sender: TObject);
    procedure HorizontalAspectRatioMouseUp(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure VerticalAspectRatioMouseUp(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure SplashLogoChange(Sender: TObject);
    procedure FolderTitleSnapshotsButtonSelectClick(Sender: TObject);
    procedure FolderMarqueesButtonSelectClick(Sender: TObject);
    procedure FolderFlyersButtonSelectClick(Sender: TObject);
    procedure FolderCabinetsButtonSelectClick(Sender: TObject);
    procedure FolderControlPanelsButtonSelectClick(Sender: TObject);
    procedure FolderControlPanelLayoutsButtonSelectClick(Sender: TObject);
    procedure FolderIconsButtonSelectClick(Sender: TObject);
    procedure FolderGamesFAQButtonSelectClick(Sender: TObject);
    procedure ButtonUpdateEmuLoaderFoldersClick(Sender: TObject);
    procedure StretchPictureClick(Sender: TObject);
    procedure PicturesVirtualListClick(Sender: TObject);
    procedure CyclePictureTypesClick(Sender: TObject);
    procedure AuditCHDFilesClick(Sender: TObject);
  private
    { Private declarations }
    function  LoadToolbarIcons: Boolean;
  public
    procedure UpdateGameSize;
    { Public declarations }
  end;

var
  FormPreferences: TFormPreferences;

implementation

uses uMain, uStatus, uCommon, uFilesUtil;

{$R *.DFM}

// procedures
function TFormPreferences.LoadToolbarIcons: Boolean;
begin
  Result:= ((FileExists(FormMain.FrontendPath+'resources\images\toolbars\Preferences\0.ico')) and
            (FileExists(FormMain.FrontendPath+'resources\images\toolbars\Preferences\1.ico')) and
            (FileExists(FormMain.FrontendPath+'resources\images\toolbars\Preferences\2.ico')) and
            (FileExists(FormMain.FrontendPath+'resources\images\toolbars\Preferences\3.ico')) and
            (FileExists(FormMain.FrontendPath+'resources\images\toolbars\Preferences\4.ico')) and
            (FileExists(FormMain.FrontendPath+'resources\images\toolbars\MAMEConfiguration\4.ico')) and
            (FileExists(FormMain.FrontendPath+'resources\images\toolbars\Main\toolbar\25.ico')) and
            (FileExists(FormMain.FrontendPath+'resources\images\toolbars\Preferences\7.ico')) and
            (FileExists(FormMain.FrontendPath+'resources\images\toolbars\Main\toolbar\52.ico')) and
            (FileExists(FormMain.FrontendPath+'resources\images\toolbars\Main\toolbar\77.ico')));

  if Result then
     begin
       FormMain.AddDefaultIcons('Preferences\0.ico', PreferencesImageList, 1, False);
       FormMain.AddDefaultIcons('Preferences\1.ico', PreferencesImageList, 1, False);
       FormMain.AddDefaultIcons('Preferences\2.ico', PreferencesImageList, 1, False);
       FormMain.AddDefaultIcons('Preferences\3.ico', PreferencesImageList, 1, False);
       FormMain.AddDefaultIcons('Preferences\4.ico', PreferencesImageList, 1, False);
       FormMain.AddDefaultIcons('MAMEConfiguration\4.ico', PreferencesImageList, 1, False);
       FormMain.AddDefaultIcons('Main\toolbar\25.ico', PreferencesImageList, 1, False);
       FormMain.AddDefaultIcons('Preferences\7.ico', PreferencesImageList, 1, False);
       FormMain.AddDefaultIcons('Main\toolbar\52.ico', PreferencesImageList, 1, False);
       FormMain.AddDefaultIcons('Main\toolbar\77.ico', PreferencesImageList, 1, False);
     end;
end;

procedure TFormPreferences.UpdateGameSize;

  function FormatText(Value: Extended): String;
  begin
    if Value = 0 then
       Result:= ''
    else
    if Pos('.0', FloatToStr(Value)) <> 0 then
       Result:= TrimLeft(Format('%3u', [Trunc(Value)]))
    else
    if Pos('.', FloatToStr(Value)) <> 0 then
       Result:= TrimLeft(Format('%3.2f', [Value]))
    else
       Result:= TrimLeft(Format('%3u', [Trunc(Value)]));
  end;

  function GetSizeType(Value: Extended; Bits: Boolean): ShortString;
  begin
    if Bits then
       Value:= Value * 8; // convert bytes to bits

    if Trunc(Value / 1024) > 0 then
       begin
         Value:= Value / 1024; // convert bits to Kb
         if Trunc(Value / 1024) > 0 then
            begin
              Value:= Value / 1024; // convert Kb to Mb
              if Trunc(Value / 1024) > 0 then
                 begin
                   Value:= Value / 1024; // convert Mb to Gb
                   Result:= FormatText(Value)+' G';
                 end
              else
                 Result:= FormatText(Value)+' M';
            end
         else
            Result:= FormatText(Value)+' K';
       end
    else
       Result:= FormatText(Value)+' B';
end;

var
  GameSize: Extended;
  SizeInfo: String;
begin
  SizeInfo:= FormMain.GamesList[FormMain.SelectedGame].eGameSize;
  if SizeInfo = '' then
     begin
       FormMain.StatusBarGameSize.Caption:= '';
       FormMain.StatusBarGameSize.Visible:= False;
       Exit;
     end
  else
     GameSize:= StrToFloat(SizeInfo);

  if ShowGameSizeBits.Checked then
     FormMain.StatusBarGameSize.Caption:= GetSizeType(GameSize, True)+'Bits'
  else

  if ShowGameSizeBytes.Checked then
     FormMain.StatusBarGameSize.Caption:= GetSizeType(GameSize, False)+'Bytes'
  else
     begin
       // get the .zip file size
       if FormMain.GamesList[FormMain.SelectedGame].eMerged = '' then
          GameSize:= GetFileSize(FormMain.SearchZipFolder(FormMain.GamesList[FormMain.SelectedGame].eName))
       else
          GameSize:= GetFileSize(FormMain.SearchZipFolder(FormMain.GamesList[FormMain.SelectedGame].eClone));

       if GameSize > -1 then
          FormMain.StatusBarGameSize.Caption:= GetSizeType(GameSize, False)+'Bytes'
       else
          FormMain.StatusBarGameSize.Caption:= '';
     end;

  FormMain.StatusBarGameSize.Visible:= FormMain.StatusBarGameSize.Caption <> '';
end;
// end of procedures

procedure TFormPreferences.ButtonCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TFormPreferences.FormCreate(Sender: TObject);
var
  SysMenu: HMenu;
begin
  SysMenu:= GetSystemMenu(handle, False);
  EnableMenuItem(SysMenu, SC_CLOSE, MF_DISABLED or MF_GRAYED);

  if XArcadeImageFile.Text = '' then
     XArcadeImageFile.Text:= 'resources\images\controllers\X-Arcade.jpg';
  if FileExists(XArcadeImageFile.Text) then
     XArcadeImage.Bitmap.LoadFromFile(XArcadeImageFile.Text);

  if HotRodSEImageFile.Text = '' then
     HotRodSEImageFile.Text:= 'resources\images\controllers\HotRodSE.jpg';
  if FileExists(HotRodSEImageFile.Text) then
     HotRodImage.Bitmap.LoadFromFile(HotRodSEImageFile.Text);

  if SlikStikImageFile.Text = '' then
     SlikStikImageFile.Text:= 'resources\images\controllers\SlikStik.jpg';
  if FileExists(SlikStikImageFile.Text) then
     SlikStikImage.Bitmap.LoadFromFile(SlikStikImageFile.Text);

  // Load Icons
  // General tab
  FormMain.LoadIcon(MiscellaneousImage, 'MAMEConfiguration\Miscellaneous.png');
  FormMain.LoadIcon(GamesListImage, 'Preferences\GamesList.png');
  FormMain.LoadIcon(PreviewPicturesImage, 'Preferences\PreviewPictures.png');

  // Appearance tab
  FormMain.LoadIcon(AppearanceImage, 'Preferences\Appearance.png');

  // M.A.M.E. tabs
  FormMain.LoadIcon(MAMEFoldersImage, 'Preferences\EmuLoaderFolders.png');
  FormMain.LoadIcon(MAMEExtraOptionsImage, 'Preferences\MAMEExtraOptions.png');

  LoadToolbarIcons;
end;

procedure TFormPreferences.AspectRatioClick(Sender: TObject);
begin
  FormMain.SetAspectRatio(FormMain.Picture);
end;

procedure TFormPreferences.ShowParentPicturesClick(Sender: TObject);
var
  PictureName: String;
begin
  case ShowParentPictures.Checked of
    True:
      begin
        with FormMain do
        begin
          PictureName:= ShowPicture(GamesList[SelectedGame].eName, GamesList[SelectedGame].eClone, Picture, PictureType, True);
          if PictureName <> 'No Change' then
             Picture.Hint:= PictureName;
          UpdateLabelPictures;
        end;
      end;
    False:
      begin
        with FormMain do
        begin
          if FormMain.Active then
          if GamesList[SelectedGame].eClone <> '' then
             begin
               Picture.Bitmap.Clear;
               Picture.Hint:= '';
               LabelPictureNumber.Caption:= '';
             end;
        end;
      end;
  end;
end;

procedure TFormPreferences.NewDescriptionFormatClick(Sender: TObject);
var
  Loop: Integer;
  GameDescription: String;
begin
  if Length(FormMain.GamesList) = 0 then
     Exit;
  FormMain.List.Items.BeginUpdate;
  case NewDescriptionFormat.Checked of
    True:
      begin
        for Loop:=0 to Length(FormMain.GamesList)-1 do
        begin
          GameDescription:= FormMain.GamesList[Loop].eDescription;
          if (Copy(GameDescription, 1, 4) = 'The ') then
             FormMain.GamesList[Loop].eDescription:= Copy(GameDescription, 5, Length(GameDescription))+', The'
          else
          if (Copy(GameDescription, 1, 3) = 'Le ') then
             FormMain.GamesList[Loop].eDescription:= Copy(GameDescription, 4, Length(GameDescription))+', Le';
        end;
      end;
    False:
      begin
        for Loop:=0 to Length(FormMain.GamesList)-1 do
        begin
          GameDescription:= FormMain.GamesList[Loop].eDescription;
          if Pos(', The',GameDescription) > 0 then
             FormMain.GamesList[Loop].eDescription:= 'The '+Copy(GameDescription, 1, Length(GameDescription)-5)
          else
          if Pos(', Le',GameDescription) > 0 then
             FormMain.GamesList[Loop].eDescription:= 'Le '+Copy(GameDescription, 1, Length(GameDescription)-4);
        end;
      end;
  end;
  FormMain.List.Items.EndUpdate;
  FormMain.List.Invalidate;
  if FormMain.ColumnSorted = 0 then
     FormMain.SortColumn(FormMain.ColumnSorted, True);
end;

procedure TFormPreferences.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #27 then
     ButtonClose.OnClick(Self);
end;

procedure TFormPreferences.ShowGameSizeBitsClick(Sender: TObject);
begin
  case ShowGameSizeBits.Checked of
    True:
      begin
        ShowGameSizeBytes.Checked:= False;
        ShowGameSizeCompressedZip.Checked:= False;
      end;
    False: ShowGameSizeBits.Checked:= ((not ShowGameSizeBytes.Checked) and (not ShowGameSizeCompressedZip.Checked));
  end;
  FormMain.UpdateStatusBarGame;
end;

procedure TFormPreferences.ShowGameSizeBytesClick(Sender: TObject);
begin
  case ShowGameSizeBytes.Checked of
    True:
      begin
        ShowGameSizeBits.Checked:= False;
        ShowGameSizeCompressedZip.Checked:= False;
      end;
    False: ShowGameSizeBits.Checked:= ((not ShowGameSizeBits.Checked) and (not ShowGameSizeCompressedZip.Checked));
  end;
  FormMain.UpdateStatusBarGame;
end;

procedure TFormPreferences.ShowGameSizeCompressedZipClick(Sender: TObject);
begin
  case ShowGameSizeCompressedZip.Checked of
    True:
      begin
        ShowGameSizeBits.Checked:= False;
        ShowGameSizeBytes.Checked:= False;
      end;
    False: ShowGameSizeBits.Checked:= ((not ShowGameSizeBits.Checked) and (not ShowGameSizeBytes.Checked));
  end;
  FormMain.UpdateStatusBarGame;
end;

procedure TFormPreferences.ShowGameSizeClick(Sender: TObject);
begin
  case ShowGameSize.Checked of
    True : UpdateGameSize;
    False: FormMain.StatusBarGameSize.Caption:= '';
  end;
  FormMain.StatusBarGameSize.Visible:= ShowGameSize.Checked;
end;

procedure TFormPreferences.FillAllCloneColumnsClick(Sender: TObject);
var
  Loop: Integer;
begin
  if Length(FormMain.GamesList) > 0 then
     begin
       FormMain.List.Items.BeginUpdate;
       case FillAllCloneColumns.Checked of
         True:
           begin
             for Loop:=0 to Length(FormMain.GamesList)-1 do
             begin
               if FormMain.GamesList[Loop].eClone = '' then
                  FormMain.GamesList[Loop].eClone:= FormMain.GamesList[Loop].eName;
             end;
           end;
         False:
           begin
             for Loop:=0 to Length(FormMain.GamesList)-1 do
             begin
               if FormMain.GamesList[Loop].eImageIndex in [0, 1, 4, 6, 7, 10, 12..15] then
                  FormMain.GamesList[Loop].eClone:= '';
             end;
           end;
       end;
       FormMain.List.Items.EndUpdate;
       FormMain.List.Invalidate;
     end;
end;

procedure TFormPreferences.HotRodClick(Sender: TObject);
begin
  if HotRod.Checked then
     begin
       XArcade.Checked:= False;
       SlikStik.Checked:= False;
     end;
end;

procedure TFormPreferences.StretchLargerPicturesClick(Sender: TObject);
begin
  StretchPicture.OnClick(Self);
end;

procedure TFormPreferences.FormShow(Sender: TObject);
begin
  if Application.Terminated then
     begin
       PostMessage(Handle, wm_Close, 0, 0);
       Exit;
     end;
end;

procedure TFormPreferences.SmoothPicturesClick(Sender: TObject);
begin
  FormMain.SmoothPicture(FormMain.Picture);
end;

procedure TFormPreferences.XArcadeClick(Sender: TObject);
begin
  if XArcade.Checked then
     begin
       HotRod.Checked:= False;
       SlikStik.Checked:= False;
     end;
end;

procedure TFormPreferences.SlikStikClick(Sender: TObject);
begin
  if SlikStik.Checked then
     begin
       HotRod.Checked:= False;
       XArcade.Checked:= False;
     end;
end;

procedure TFormPreferences.VisitSlikStikImageClick(Sender: TObject);
begin
  FormMain.MenuVisitSlikStikHomepageClick(Self);
end;

procedure TFormPreferences.VisitHotRodImageClick(Sender: TObject);
begin
  FormMain.MenuVisitHotRodHomepage.OnClick(Self);
end;

procedure TFormPreferences.VisitXArcadeImageClick(Sender: TObject);
begin
  FormMain.MenuVisitXArcadeHomepage.OnClick(Self);
end;

procedure TFormPreferences.ListBackgroundColorSelect(Sender: TObject);
begin
  FormMain.List.Color:= ListBackgroundColor.Selected;
end;

procedure TFormPreferences.TitleSnapshotPicturesBackgroundColorSelect(
  Sender: TObject);
begin
  if FormMain.MenuShowTitleSnapshot.Checked then
     FormMain.Picture.Color:= TitleSnapshotPicturesBackgroundColor.Selected;
end;

procedure TFormPreferences.InGameSnapshotPicturesBackgroundColorSelect(
  Sender: TObject);
begin
  if FormMain.MenuShowInGameSnapshot.Checked then
     FormMain.Picture.Color:= InGameSnapshotPicturesBackgroundColor.Selected;
end;

procedure TFormPreferences.MarqueePicturesBackgroundColorSelect(
  Sender: TObject);
begin
  if FormMain.MenuShowMarquee.Checked then
     FormMain.Picture.Color:= MarqueePicturesBackgroundColor.Selected;
end;

procedure TFormPreferences.FlyerPicturesBackgroundColorSelect(
  Sender: TObject);
begin
  if FormMain.MenuShowFlyer.Checked then
     FormMain.Picture.Color:= FlyerPicturesBackgroundColor.Selected;
end;

procedure TFormPreferences.CabinetPicturesBackgroundColorSelect(
  Sender: TObject);
begin
  if FormMain.MenuShowCabinet.Checked then
     FormMain.Picture.Color:= CabinetPicturesBackgroundColor.Selected;
end;

procedure TFormPreferences.ControlPanelPicturesBackgroundColorSelect(
  Sender: TObject);
begin
  if FormMain.MenuShowControlPanel.Checked then
     FormMain.Picture.Color:= ControlPanelPicturesBackgroundColor.Selected;
end;

procedure TFormPreferences.ControlPanelLayoutPicturesBackgroundColorSelect(
  Sender: TObject);
begin
  if FormMain.MenuShowControlPanelLayout.Checked then
     FormMain.Picture.Color:= ControlPanelLayoutPicturesBackgroundColor.Selected;
end;

procedure TFormPreferences.ButtonGamesListFontClick(Sender: TObject);
begin
  FormMain.FontDialog.Font:= FormMain.List.Font;
  if FormMain.FontDialog.Execute then
     FormMain.List.Font:= FormMain.FontDialog.Font;
end;

procedure TFormPreferences.ButtonGamesListDefaultFontClick(Sender: TObject);
begin
  FormMain.List.Font.Color:= clWhite;
  FormMain.List.Font.Name:= 'Tahoma';
  FormMain.List.Font.Size:= 8;
  FormMain.List.Font.Style:= [];
  ListBackgroundColor.Selected:= clBlack;
  ListBackgroundColor.OnSelect(Self);
end;

procedure TFormPreferences.ButtonGeneralFontClick(Sender: TObject);
begin
  FormMain.FontDialog.Font:= FormMain.Font;
  if FormMain.FontDialog.Execute then
     FormMain.Font:= FormMain.FontDialog.Font;
  FormMain.UpdateGeneralAppearance(FormMain);
  FormMain.UpdateGeneralAppearance(FormPreferences);
  FormMain.UpdateGeneralAppearance(FormStatus);
end;

procedure TFormPreferences.ButtonGeneralDefaultFontClick(Sender: TObject);
begin
  FormMain.Font.Color:= clWindowText;
  FormMain.Font.Name:= 'Tahoma';
  FormMain.Font.Size:= 8;
  FormMain.Font.Style:= [];
  GeneralBackgroundColor.Selected:= clBtnFace;
  GeneralBackgroundColor.OnSelect(Self);
  FormMain.UpdateGeneralAppearance(FormMain);
  FormMain.UpdateGeneralAppearance(FormPreferences);
  FormMain.UpdateGeneralAppearance(FormStatus);
end;

procedure TFormPreferences.ButtonAutomaticGameInfoFontClick(
  Sender: TObject);
begin
  FormMain.FontDialog.Font:= FormMain.MAMEInfoTextHolder.Font;
  if FormMain.FontDialog.Execute then
     FormMain.MAMEInfoTextHolder.Font:= FormMain.FontDialog.Font;
end;

procedure TFormPreferences.AutomaticGameInformationBackgroundColorSelect(
  Sender: TObject);
begin
  FormMain.MAMEInfoTextHolder.Color:= AutomaticGameInformationBackgroundColor.Selected;
end;

procedure TFormPreferences.ButtonAutomaticGameInfoDefaultColorFontClick(Sender: TObject);
begin
  FormMain.MAMEInfoTextHolder.Font.Color:= clBlack;
  FormMain.MAMEInfoTextHolder.Font.Name:= 'Courier New';
  FormMain.MAMEInfoTextHolder.Font.Size:= 8;
  FormMain.MAMEInfoTextHolder.Font.Style:= [];
  AutomaticGameInformationBackgroundColor.Selected:= TColor(clWindow);
  AutomaticGameInformationBackgroundColor.OnSelect(Self);
end;

procedure TFormPreferences.GeneralBackgroundColorSelect(Sender: TObject);
begin
  if FormMain.CheckWinXPThemes then
     GeneralBackgroundColor.Selected:= clBtnFace;

  FormMain.Color:= GeneralBackgroundColor.Selected;
  FormPreferences.Color:= FormMain.Color;
end;

procedure TFormPreferences.ShowPreliminaryGamesDisabledClick(
  Sender: TObject);
begin
  if Length(FormMain.GamesList) > 0 then
     FormMain.List.Invalidate;
end;

procedure TFormPreferences.SplashLogoButtonSelectClick(Sender: TObject);
begin
  FormMain.DialogOpenFile(4, FormMain.GetLanguageText('Preferences', 'DialogLogo', 'Select a file for splash screen'), SplashLogo);
  FormMain.LogoFileName:= SplashLogo.Text;
end;

procedure TFormPreferences.DefaultGameIconsFolderButtonSelectClick(
  Sender: TObject);
begin
  FormMain.DialogSelectFolder(DefaultGameIconsFolder, False);
  ButtonUpdateGameIconsFolder.OnClick(Self);
end;

procedure TFormPreferences.HotRodSEImageFileButtonSelectClick(
  Sender: TObject);
begin
  FormMain.DialogOpenFile(5, Format(FormMain.GetLanguageText('Preferences', 'DialogController', 'Select an image file for the %s controller'), [TabSheetHotRod.Caption]), HotRodSEImageFile);
  if FileExists(HotRodSEImageFile.Text) then
     HotRodImage.Bitmap.LoadFromFile(HotRodSEImageFile.Text);
end;

procedure TFormPreferences.SlikStikImageFileButtonSelectClick(
  Sender: TObject);
begin
  FormMain.DialogOpenFile(5, Format(FormMain.GetLanguageText('Preferences', 'DialogController', 'Select an image file for the %s controller'), [TabSheetSlikStik.Caption]), SlikStikImageFile);
  if FileExists(SlikStikImageFile.Text) then
     SlikStikImage.Bitmap.LoadFromFile(SlikStikImageFile.Text);
end;

procedure TFormPreferences.XArcadeImageFileButtonSelectClick(
  Sender: TObject);
begin
  FormMain.DialogOpenFile(5, Format(FormMain.GetLanguageText('Preferences', 'DialogController', 'Select an image file for the %s controller'), [TabSheetXArcade.Caption]), XArcadeImageFile);
  if FileExists(XArcadeImageFile.Text) then
     XArcadeImage.Bitmap.LoadFromFile(XArcadeImageFile.Text);
end;

procedure TFormPreferences.ButtonUpdateGameIconsFolderClick(
  Sender: TObject);
begin
  if DefaultGameIconsFolder.Text <> '' then
     begin
       if FormMain.CheckDefaultIconsFile then
          begin
            if not FormMain.MenuRealIcons.Checked then
               FormMain.List.Items.BeginUpdate;
            FormMain.BuiltInBigListImageList.Clear;
            FormMain.BuiltInSmallListImageList.Clear;
            FormMain.ReadDefaultIconsFile;
            if not FormMain.MenuRealIcons.Checked then
               begin
                 FormMain.List.Invalidate;
                 FormMain.List.Items.EndUpdate;
               end;
          end;
     end;
end;

procedure TFormPreferences.HorizontalAspectRatioChange(Sender: TObject);
begin
  LabelHorizontalAspectRatioValue.Caption:= FormMain.GetAspectRatio(HorizontalAspectRatio);
end;

procedure TFormPreferences.VerticalAspectRatioChange(Sender: TObject);
begin
  LabelVerticalAspectRatioValue.Caption:= FormMain.GetAspectRatio(VerticalAspectRatio);
end;

procedure TFormPreferences.HorizontalAspectRatioMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if Button = mbRight then
     HorizontalAspectRatio.Position:= HorizontalAspectRatio.Tag;
end;

procedure TFormPreferences.VerticalAspectRatioMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if Button = mbRight then
     VerticalAspectRatio.Position:= VerticalAspectRatio.Tag;
end;

procedure TFormPreferences.SplashLogoChange(Sender: TObject);
begin
  FormMain.LogoFileName:= SplashLogo.Text;
end;

procedure TFormPreferences.FolderTitleSnapshotsButtonSelectClick(
  Sender: TObject);
begin
  FormMain.DialogSelectFolder(FolderTitleSnapshots, False);
end;

procedure TFormPreferences.FolderMarqueesButtonSelectClick(
  Sender: TObject);
begin
  FormMain.DialogSelectFolder(FolderMarquees, False);
end;

procedure TFormPreferences.FolderFlyersButtonSelectClick(Sender: TObject);
begin
  FormMain.DialogSelectFolder(FolderFlyers, False);
end;

procedure TFormPreferences.FolderCabinetsButtonSelectClick(
  Sender: TObject);
begin
  FormMain.DialogSelectFolder(FolderCabinets, False);
end;

procedure TFormPreferences.FolderControlPanelsButtonSelectClick(
  Sender: TObject);
begin
  FormMain.DialogSelectFolder(FolderControlPanels, False);
end;

procedure TFormPreferences.FolderControlPanelLayoutsButtonSelectClick(
  Sender: TObject);
begin
  FormMain.DialogSelectFolder(FolderControlPanelLayouts, False);
end;

procedure TFormPreferences.FolderIconsButtonSelectClick(Sender: TObject);
begin
  FormMain.DialogSelectFolder(FolderIcons, False);
end;

procedure TFormPreferences.FolderGamesFAQButtonSelectClick(
  Sender: TObject);
begin
  FormMain.DialogSelectFolder(FolderGamesFAQ, False);
end;

procedure TFormPreferences.ButtonUpdateEmuLoaderFoldersClick(
  Sender: TObject);
begin
  FormMain.GetMAMEExtendedPaths;
end;

procedure TFormPreferences.StretchPictureClick(Sender: TObject);
begin
  FormMain.SetAspectRatio(FormMain.Picture);
  if StretchPicture.Tag = 0 then
     FormMain.List.SetFocus;
end;

procedure TFormPreferences.PicturesVirtualListClick(Sender: TObject);
begin
  FormMain.ToggleVirtualPicturesList(PicturesVirtualList.Checked);
end;

procedure TFormPreferences.CyclePictureTypesClick(Sender: TObject);
begin
  case CyclePictureTypes.Checked of
    True:
      begin
        FormMain.ButViewPreviousPicture.ImageIndex:= 80;
        FormMain.ButViewNextPicture.ImageIndex:= 81;
      end;
    False:
      begin
        FormMain.ButViewPreviousPicture.ImageIndex:= 82;
        FormMain.ButViewNextPicture.ImageIndex:= 83;
      end;
  end;
  FormMain.UpdateLabelPictures;
end;

procedure TFormPreferences.AuditCHDFilesClick(Sender: TObject);
begin
  FormMain.MenuGamesAudit.Tag:= Ord(AuditCHDFiles.Checked);
end;

end.

