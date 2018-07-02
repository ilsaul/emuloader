unit uPreferences;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  ExtCtrls, StdCtrls, ComCtrls, Menus, IniFiles,
  Buttons, BarMenus, GraphicEx,  MPCommonObjects, EasyListview,
  SplitterEx, AdvOfficeButtons, AdvGroupBox, ShadowLabel, PanelEx, ShellAPI,
  GR32_RangeBars;

type
  TFormPreferences = class(TForm)
    PageOptions: TNotebook;
    DisableMinimize: TAdvOfficeCheckBox;
    ButtonCustomizeGameFonts: TBitBtn;
    GroupBoxImageSplitters: TAdvGroupBox;
    LabelAppearanceGameDocuments: TLabel;
    GameDocumentsBackgroundColor: TColorBox;
    ButtonGameDocumentsFont: TBitBtn;
    ButtonGameDocumentsDefault: TBitBtn;
    GameSelectionAlphaBlend: TAdvOfficeCheckBox;
    ImageSplitterShowGripIcon: TAdvOfficeCheckBox;
    ShadowLabel1: TShadowLabel;
    PanelTabButtons: TPanelEx;
    ButtonPageGeneral: TSpeedButton;
    ButtonPageGamesList: TSpeedButton;
    ButtonPageImages: TSpeedButton;
    ButtonPageGameDocuments: TSpeedButton;
    ColumnsSettingsGroupBox: TAdvGroupBox;
    DisableCloneIndent: TAdvOfficeCheckBox;
    DisableDriverStatusIcons: TAdvOfficeCheckBox;
    DriverStatusShowFirstLetterOnly: TAdvOfficeCheckBox;
    HideDriverStatusTexts: TAdvOfficeCheckBox;
    ShortDriverColumnTitles: TAdvOfficeCheckBox;
    GamesBackgroundGroupBox: TAdvGroupBox;
    GamesBackgroundColor: TColorBox;
    ButtonDefaultBkSortedColor: TBitBtn;
    GamesBackgroundImageEnable: TAdvOfficeCheckBox;
    GamesBackgroundImage: TEdit;
    GamesBackgroundImageButtonSelect: TBitBtn;
    GamesBackgroundImageButtonUpdate: TBitBtn;
    GamesTileBackground: TAdvOfficeCheckBox;
    LastPlayedHideSeconds: TAdvOfficeCheckBox;
    TotalPlayTimeHideSeconds: TAdvOfficeCheckBox;
    DisableNaturalSorting: TAdvOfficeCheckBox;
    LabelDisableNaturalSorting: TLabel;
    LabelGoToMAMEInfo: TShadowLabel;
    LabelGoToMARP: TShadowLabel;
    LabelGoToMAMEScore: TShadowLabel;
    LabelGoToMAMEHistory: TShadowLabel;
    GameMultilineCaptions: TAdvOfficeCheckBox;
    LabelGameMultilineCaptions: TLabel;
    LabelImageSplitterSingleColor: TLabel;
    ImageSplitterSingleColor: TColorBox;
    ImageSplitterSingleColorHot: TColorBox;
    LabelImageSplitterSingleColorHot: TLabel;
    ButtonImageSplitterStyleDefault: TBitBtn;
    HideDOSBoxFrame: TAdvGroupBox;
    HideDOSBoxEmuVersionCreateGames: TAdvOfficeCheckBox;
    HideDOSBoxRunGame: TAdvOfficeCheckBox;
    ShadowLabel2: TShadowLabel;
    LabelGoToMESSInfo: TShadowLabel;
    LabelImagePanelOuterFrameColor: TLabel;
    ImagePanelOuterFrameColor: TColorBox;
    ButtonImagePanelOuterFrameColorDefault: TBitBtn;
    LabelGoToGameInit: TShadowLabel;
    AllowOnlyOneInstance: TAdvOfficeCheckBox;
    GamesListStatusBarBox: TAdvGroupBox;
    LabelGamesListStatusBarBottomColor: TLabel;
    LabelGamesListStatusBarTopColor: TLabel;
    LabelGamesListStatusBarFontColor: TLabel;
    LabelGamesListStatusBarFrameColor: TLabel;
    GamesListStatusBarGradientBar: TAdvOfficeCheckBox;
    GamesListStatusBarBottomColor: TColorBox;
    GamesListStatusBarButtonDefault: TBitBtn;
    GamesListStatusBarTopColor: TColorBox;
    GamesListStatusBarFontColor: TColorBox;
    GamesListStatusBarFrameColor: TColorBox;
    DisableDeleteSelectedGames: TAdvOfficeCheckBox;
    LabelDisableDeleteSelectedGames: TLabel;
    IgnoreExitCode1InvalidFunction: TAdvOfficeCheckBox;
    RestoreInternetGameInfoStartup: TAdvOfficeCheckBox;
    Label1: TLabel;
    HintBoxSettings: TAdvGroupBox;
    LabelHintBox_Color: TLabel;
    HintBox_Color: TColorBox;
    LabelHintBox_FrameColor: TLabel;
    HintBox_FrameColor: TColorBox;
    HintBox_FrameEnabled: TAdvOfficeCheckBox;
    LabelHintBox_Opacity: TLabel;
    HintBox_Opacity: TGaugeBar;
    ButtonDefaultHintBox_Opacity: TBitBtn;
    LabelHintBox_TextColor: TLabel;
    LabelHintBox_TextShadowColor: TLabel;
    HintBox_TextShadowColor: TColorBox;
    HintBox_TextColor: TColorBox;
    ButtonHintBoxDefaultColors: TBitBtn;
    ButtonHintTextDefaultColors: TBitBtn;
    HintBox_TextShadowEnabled: TAdvOfficeCheckBox;
    HintBox_IconEnabled: TAdvOfficeCheckBox;
    ButtonPageNightMode: TSpeedButton;
    NightModeToolBarBackgroundColors: TAdvGroupBox;
    NightModeToolBarBkTopColor: TColorBox;
    LabelNightModeToolBarBkTopColor: TShadowLabel;
    NightModeToolBarFrameColor: TColorBox;
    NightModeToolBarBkColorsDefaultButton: TBitBtn;
    NightModeToolBarShowFrame: TAdvOfficeCheckBox;
    GroupBoxGamesListSplitters: TAdvGroupBox;
    LabelGamesListSplitterSingleColorDefault: TShadowLabel;
    LabelGamesListSplitterSingleColor: TLabel;
    LabelGamesListSplitterSingleColorHot: TLabel;
    GamesListSplitterStyleSelector: TComboBox;
    ButtonGamesListSplitterStyleDefault: TBitBtn;
    GamesListSplitterShowGripIcon: TAdvOfficeCheckBox;
    GamesListSplitterSingleColor: TColorBox;
    GamesListSplitterSingleColorHot: TColorBox;
    ButtonGamesListSplitterSingleColorDefault: TBitBtn;
    GroupBoxGameDocsSplitter: TAdvGroupBox;
    LabelGameDocsSplitterSingleColorDefault: TShadowLabel;
    LabelGameDocsSplitterSingleColor: TLabel;
    LabelGameDocsSplitterSingleColorHot: TLabel;
    GameDocsSplitterStyleSelector: TComboBox;
    ButtonGameDocsSplitterStyleDefault: TBitBtn;
    GameDocsSplitterShowGripIcon: TAdvOfficeCheckBox;
    GameDocsSplitterSingleColor: TColorBox;
    GameDocsSplitterSingleColorHot: TColorBox;
    ButtonGameDocsSplitterSingleColorDefault: TBitBtn;
    GroupBoxInternetGameInfo: TAdvGroupBox;
    LabelInternetGameInfoLink: TLabel;
    LabelInternetMAMESoftwareListGameInfoLink: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    InternetGameInfoLink: TEdit;
    InternetGameInfoLinkButtonDefault: TBitBtn;
    InternetMAMESoftwareListGameInfoLink: TEdit;
    InternetMAMESoftwareListGameInfoLinkButtonDefault: TBitBtn;
    LabelImageSplitterSingleColorDefault: TShadowLabel;
    ButtonImageSplitterSingleColorDefault: TBitBtn;
    ImageSplitterStyleSelector: TComboBox;
    MAMu_Icon: TImage;
    LabelMAMu_IconsFolder: TLabel;
    MAMu_IconsFolder: TEdit;
    ButtonMAMu_IconsFolderSelect: TBitBtn;
    LabelGamesBackgroundColor: TShadowLabel;
    ImagesSpecialSettingsGroupBox: TAdvGroupBox;
    LabelFixRetroArchImageFileNames: TLabel;
    LabelImageDisableThreadedLoading: TLabel;
    FixRetroArchImageFileNames: TAdvOfficeCheckBox;
    ImageDisableThreadedLoading: TAdvOfficeCheckBox;
    GameDocsDisplayOrderBox: TAdvGroupBox;
    GameDocs: TEasyListview;
    ButtonUp: TBitBtn;
    ButtonDown: TBitBtn;
    ButtonResetAutoGameInfoOrder: TBitBtn;
    GameDocsDisplayModeBox: TAdvGroupBox;
    LabelGameDocsDisplayModeSinglePanel: TShadowLabel;
    LabelGameDocsDisplayModeTabs: TShadowLabel;
    GameDocsDisplayModeTabs: TAdvOfficeRadioButton;
    GameDocsDisplayModeSinglePanel: TAdvOfficeRadioButton;
    NightModeToolBarGradientBar: TAdvOfficeCheckBox;
    NightModeToolBarBkBottomColor: TColorBox;
    LabelNightModeToolBarBkBottomColor: TShadowLabel;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure GamesBackgroundColorSelect(Sender: TObject);
    procedure ButtonGameDocumentsFontClick(Sender: TObject);
    procedure GameDocumentsBackgroundColorSelect(
      Sender: TObject);
    procedure ButtonGameDocumentsDefaultClick(Sender: TObject);
    procedure GamesBackgroundImageButtonSelectClick(Sender: TObject);
    procedure GamesBackgroundImageButtonUpdateClick(Sender: TObject);
    procedure GamesTileBackgroundClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ButtonResetAutoGameInfoOrderClick(Sender: TObject);
    procedure ButtonDefaultBkSortedColorClick(Sender: TObject);
    procedure PopupMenuThemePreviewMeasureMenuItem(Sender: TObject;
      AMenuItem: TMenuItem; ACanvas: TCanvas; var Width, Height: Integer;
      ABarVisible: Boolean; var DefaultMeasure: Boolean);
    procedure ButtonCustomizeGameFontsClick(Sender: TObject);
    procedure GameDocsItemPaintText(Sender: TCustomEasyListview;
      Item: TEasyItem; Position: Integer; ACanvas: TCanvas);
    procedure ButtonUpClick(Sender: TObject);
    procedure GameSelectionAlphaBlendClick(Sender: TObject);
    procedure ImageSplitterSingleColorSelect(Sender: TObject);
    procedure ImageSplitterSingleColorHotSelect(Sender: TObject);
    procedure ButtonImageSplitterStyleDefaultClick(Sender: TObject);
    procedure ButtonGamesListSplitterStyleDefaultClick(Sender: TObject);
    procedure ButtonGamesListSplitterSingleColorDefaultClick(Sender: TObject);
    procedure GamesListSplitterStyleSelectorSelect(Sender: TObject);
    procedure GamesListSplitterSingleColorSelect(Sender: TObject);
    procedure GamesListSplitterSingleColorHotSelect(Sender: TObject);
    procedure GamesListSplitterShowGripIconClick(Sender: TObject);
    procedure ButtonPageGeneralClick(Sender: TObject);
    procedure ButtonMAMu_IconsFolderSelectClick(Sender: TObject);
    procedure ImageSplitterShowGripIconClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure DisableCloneIndentClick(Sender: TObject);
    procedure GamesBackgroundImageEnableClick(Sender: TObject);
    procedure DisableNaturalSortingClick(Sender: TObject);
    procedure LabelGoToMAMEInfoMouseEnter(Sender: TObject);
    procedure LabelGoToMAMEInfoClick(Sender: TObject);
    procedure LabelGoToMAMEInfoMouseLeave(Sender: TObject);
    procedure GameMultilineCaptionsClick(Sender: TObject);
    procedure ImagePanelOuterFrameColorSelect(Sender: TObject);
    procedure ButtonImagePanelOuterFrameColorDefaultClick(Sender: TObject);
    procedure GamesListStatusBarGradientBarClick(Sender: TObject);
    procedure GamesListStatusBarTopColorSelect(Sender: TObject);
    procedure GamesListStatusBarBottomColorSelect(Sender: TObject);
    procedure GamesListStatusBarFrameColorSelect(Sender: TObject);
    procedure GamesListStatusBarFontColorSelect(Sender: TObject);
    procedure GamesListStatusBarButtonDefaultClick(Sender: TObject);
    procedure InternetGameInfoLinkButtonDefaultClick(Sender: TObject);
    procedure InternetMAMESoftwareListGameInfoLinkButtonDefaultClick(Sender: TObject);
    procedure DisableDeleteSelectedGamesClick(Sender: TObject);
    procedure GameDocsDisplayModeSinglePanelClick(Sender: TObject);
    procedure HintBox_OpacityChange(Sender: TObject);
    procedure ButtonDefaultHintBox_OpacityClick(Sender: TObject);
    procedure ButtonHintBoxDefaultColorsClick(Sender: TObject);
    procedure ButtonHintTextDefaultColorsClick(Sender: TObject);
    procedure NightModeToolBarBkColorsDefaultButtonClick(Sender: TObject);
    procedure NightModeToolBarBkTopColorSelect(Sender: TObject);
    procedure NightModeToolBarFrameColorSelect(Sender: TObject);
    procedure NightModeToolBarShowFrameClick(Sender: TObject);
    procedure ImageSplitterStyleSelectorSelect(Sender: TObject);
    procedure ButtonImageSplitterSingleColorDefaultClick(Sender: TObject);
    procedure GameDocsSplitterStyleSelectorSelect(Sender: TObject);
    procedure ButtonGameDocsSplitterStyleDefaultClick(Sender: TObject);
    procedure ButtonGameDocsSplitterSingleColorDefaultClick(
      Sender: TObject);
    procedure GameDocsSplitterShowGripIconClick(Sender: TObject);
    procedure GameDocsSplitterSingleColorSelect(Sender: TObject);
    procedure GameDocsSplitterSingleColorHotSelect(Sender: TObject);
    procedure NightModeToolBarBkBottomColorSelect(Sender: TObject);
    procedure NightModeToolBarGradientBarClick(Sender: TObject);
  private
    { Private declarations }
    procedure NightModeRepaintToolBar;
  public
    { Public declarations }

  end;

var
  FormPreferences: TFormPreferences;

implementation

uses uMain, uStatus, uCommon;

{$R *.DFM}

// might be useful in the future...
//procedure TFormPreferences.ELV_GetMissROM_Selected(ColorBoxHolder: TColorBox);
//var
//  colorRed, colorGreen, colorBlue, NewColor: Integer; // will hold default RGB color
//begin
//   colorRed:= GetRValue(ColorBoxHolder.Selected);
//   colorGreen:= GetGValue(ColorBoxHolder.Selected);
//   colorBlue:= GetBValue(ColorBoxHolder.Selected);
//   NewColor:= RGB(colorBlue, colorGreen, colorRed); // invert... blue becomes red :-))
//   ColorBoxHolder.Tag:= NewColor;
//end;

procedure TFormPreferences.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #27 then
     Close;
end;

procedure TFormPreferences.FormShow(Sender: TObject);
begin
  if Application.Terminated then
     begin
       PostMessage(Handle, wm_Close, 0, 0);
       Exit;
     end;
  if FormPreferences.Tag = 2 then
     begin
       MAMu_IconsFolder.SetFocus;
       FormPreferences.Tag:= 0;
     end;
end;

procedure TFormPreferences.GamesBackgroundColorSelect(Sender: TObject);
begin
  FormMain.GamesListView.Color:= GamesBackgroundColor.Selected;
  FormMain.MachinesListSidePanel.Color:= FormMain.GamesListView.Color;
  FormMain.Font_TilesViewDetailsText.Color:= GetContrastColor(GamesBackgroundColor.Selected);
end;

procedure TFormPreferences.ButtonGameDocumentsFontClick(
  Sender: TObject);
begin
  FormMain.FontDialog.Font:= FormMain.MAMEInfoTextHolder.Font;
  FormMain.FontDialog.Tag:= 6;
  if FormMain.FontDialog.Execute then
     FormMain.MAMEInfoTextHolder.Font:= FormMain.FontDialog.Font;
end;

procedure TFormPreferences.GameDocumentsBackgroundColorSelect(
  Sender: TObject);
begin
  FormMain.MAMEInfoTextHolder.Color:= GameDocumentsBackgroundColor.Selected;
end;

procedure TFormPreferences.ButtonGameDocumentsDefaultClick(Sender: TObject);
begin
  FormMain.MAMEInfoTextHolder.Font.Color:= clBlack;
  FormMain.MAMEInfoTextHolder.Font.Name:= 'Consolas';
  FormMain.MAMEInfoTextHolder.Font.Size:= 9;
  FormMain.MAMEInfoTextHolder.Font.Style:= [];
  FormMain.SetSelectedColorBox(GameDocumentsBackgroundColor, GameDocumentsBackgroundColor.DefaultColorColor);
end;

procedure TFormPreferences.GamesBackgroundImageButtonSelectClick(
  Sender: TObject);
begin
  FormMain.DialogOpenFile(5, GamesBackgroundImageEnable.Caption, GamesBackgroundImage, False);
  GamesBackgroundImageButtonUpdate.Click;
end;

procedure TFormPreferences.GamesBackgroundImageButtonUpdateClick(
  Sender: TObject);
var
  ListViewBk: TPNGGraphic;
  FileFullPath: String;
begin
  case GamesBackgroundImageEnable.Checked of
    True:
      begin
        FileFullPath:= FormMain.FullFolderFix(GamesBackgroundImage.Text, '', True);
        if (not FileExists(FileFullPath)) or (FileFullPath = '') then
           begin
             if not FormMain.IsStartup then
                begin
                  if FormMain.GamesListView.BackGround.Image <> nil then
                     FormMain.GamesListView.BackGround.Image:= nil;

                  if FormMain.MachinesListSidePanel.BackGround.Image <> nil then
                     FormMain.MachinesListSidePanel.BackGround.Image:= nil;
                  FormMain.BlinkBkEdit(GamesBackgroundImage);
                end;
             Exit;
           end;

        try
          ListViewBk:= TPNGGraphic.Create;
          ListViewBk.LoadFromFile(FileFullPath);
          FormMain.GamesListView.BackGround.Image.Assign(ListViewBk);
          FormMain.MachinesListSidePanel.BackGround.Image.Assign(ListViewBk);
          FreeAndNil(ListViewBk);
        except
          FormMain.GamesListView.Background.Image:= nil;
          FormMain.MachinesListSidePanel.BackGround.Image:= nil;
        end;
      end;
    False:
      begin
        FormMain.GamesListView.Background.Image:= nil;
        FormMain.MachinesListSidePanel.BackGround.Image:= nil;
      end;
  end;
end;

procedure TFormPreferences.GamesTileBackgroundClick(Sender: TObject);
begin
  FormMain.GamesListView.BackGround.Tile:= GamesTileBackground.Checked;
  FormMain.MachinesListSidePanel.BackGround.Tile:= GamesTileBackground.Checked;
end;

procedure TFormPreferences.FormCreate(Sender: TObject);
begin
  PageOptions.PageIndex:= 0;
  FormMain.LoadMessageIcon(MAMu_Icon, 'mamu_.ico', True);

  FormMain.ELV_ResetNormalColors(GameDocs);
end;

procedure TFormPreferences.ButtonResetAutoGameInfoOrderClick(
  Sender: TObject);
var
  Loop: Integer;
begin
  FormMain.ClearListView(GameDocs);
  GameDocs.BeginUpdate;
  for Loop:=1 to 6 do
      FormMain.ELV_AddGameDocs(Loop);
  GameDocs.EndUpdate;
end;

procedure TFormPreferences.ButtonDefaultBkSortedColorClick(Sender: TObject);
begin
  SetDefaultColorBox(GamesBackgroundColor);
  FormMain.Font_TilesViewDetailsText.Color:= GetContrastColor(GamesBackgroundColor.Selected);
end;

procedure TFormPreferences.PopupMenuThemePreviewMeasureMenuItem(
  Sender: TObject; AMenuItem: TMenuItem; ACanvas: TCanvas; var Width,
  Height: Integer; ABarVisible: Boolean; var DefaultMeasure: Boolean);
begin
  if (GetMenuBarMenusIntf(TMenu(Sender)).UseMenuStyle = msWindowsXP) then
     Height:= Height+2;
  if AMenuItem.ShortCut <> scNone then
     Width:= Width+ACanvas.TextWidth(ShortCutToText(AMenuItem.ShortCut))+10;
end;

procedure TFormPreferences.ButtonCustomizeGameFontsClick(Sender: TObject);
begin
  FormMain.MenuFontSettings.Click;
end;

procedure TFormPreferences.GameDocsItemPaintText(
  Sender: TCustomEasyListview; Item: TEasyItem; Position: Integer;
  ACanvas: TCanvas);
begin
  if not Item.Checked then
     ACanvas.Font.Color:= clGray;
end;

procedure TFormPreferences.ButtonUpClick(Sender: TObject);
begin
  FormMain.ELV_MoveItem(GameDocs, Boolean(TBitBtn(Sender).Tag));
end;

procedure TFormPreferences.GameSelectionAlphaBlendClick(Sender: TObject);
begin
  FormMain.GamesListView.Selection.AlphaBlend:= GameSelectionAlphaBlend.Checked;
  FormMain.GamesListView.Selection.RoundRect:= GameSelectionAlphaBlend.Checked;
  FormMain.MachinesListSidePanel.Selection.AlphaBlend:= GameSelectionAlphaBlend.Checked;
  FormMain.MachinesListSidePanel.Selection.RoundRect:= GameSelectionAlphaBlend.Checked;
end;

procedure TFormPreferences.ImageSplitterSingleColorSelect(
  Sender: TObject);
begin
  FormMain.UpdateImageLayoutSplittersStyle;
end;

procedure TFormPreferences.ImageSplitterSingleColorHotSelect(
  Sender: TObject);
begin
  FormMain.UpdateImageLayoutSplittersStyle;
end;

procedure TFormPreferences.ButtonImageSplitterStyleDefaultClick(
  Sender: TObject);
begin
  SetSelectedComboBox(1, ImageSplitterStyleSelector);
end;

procedure TFormPreferences.ButtonGamesListSplitterStyleDefaultClick(
  Sender: TObject);
begin
  SetSelectedComboBox(6, GamesListSplitterStyleSelector);
end;

procedure TFormPreferences.ButtonGamesListSplitterSingleColorDefaultClick(
  Sender: TObject);
begin
  SetDefaultColorBox(GamesListSplitterSingleColor);
  SetDefaultColorBox(GamesListSplitterSingleColorHot);
end;

procedure TFormPreferences.GamesListSplitterStyleSelectorSelect(Sender: TObject);
begin
  FormMain.UpdateSplitterStyle(FormMain.Splitter, TTMSStyle(GamesListSplitterStyleSelector.ItemIndex),
                               GamesListSplitterSingleColor.Selected,
                               GamesListSplitterSingleColorHot.Selected);
  
  FormMain.UpdateSplitterStyle(FormMain.SplitterMachines, TTMSStyle(GamesListSplitterStyleSelector.ItemIndex),
                               GamesListSplitterSingleColor.Selected,
                               GamesListSplitterSingleColorHot.Selected);
end;

procedure TFormPreferences.GamesListSplitterSingleColorSelect(Sender: TObject);
begin
  GamesListSplitterStyleSelector.OnSelect(Self);
end;

procedure TFormPreferences.GamesListSplitterSingleColorHotSelect(Sender: TObject);
begin
  GamesListSplitterStyleSelector.OnSelect(Self);
end;

procedure TFormPreferences.GamesListSplitterShowGripIconClick(Sender: TObject);
begin
  FormMain.SetGripIcon(FormMain.Splitter, GamesListSplitterShowGripIcon.Checked);
end;

procedure TFormPreferences.ButtonPageGeneralClick(Sender: TObject);
begin
  PageOptions.PageIndex:= TSpeedButton(Sender).Tag;
  ButtonPageGeneral.Font.Style:= [];
  ButtonPageGamesList.Font.Style:= [];
  ButtonPageImages.Font.Style:= [];
  ButtonPageGameDocuments.Font.Style:= [];
  ButtonPageNightMode.Font.Style:= [];
  TSpeedButton(Sender).Font.Style:= [fsBold];
end;

procedure TFormPreferences.ButtonMAMu_IconsFolderSelectClick(
  Sender: TObject);
begin
  FormMain.DialogSelectFolder(MAMu_IconsFolder, False);
end;

procedure TFormPreferences.ImageSplitterShowGripIconClick(Sender: TObject);
begin
  if ImageSplitterShowGripIcon.Tag = 0 then
     FormMain.PopupImageShowSplitterGrip.Click;
end;

procedure TFormPreferences.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if CanClose then
     begin
       if not Application.Terminated then
          begin
            if InternetGameInfoLink.Text = '' then
               InternetGameInfoLinkButtonDefault.Click;
            if InternetMAMESoftwareListGameInfoLink.Text = '' then
               InternetMAMESoftwareListGameInfoLinkButtonDefault.Click;
            FormMain.UpdateVideoPreviewIni;
            FormMain.SetVideoPreviewState;
          end;
     end;
end;

procedure TFormPreferences.DisableCloneIndentClick(Sender: TObject);
begin
  FormMain.GamesListView.BeginUpdate;
  FormMain.GamesListView.EndUpdate(False);
end;

procedure TFormPreferences.GamesBackgroundImageEnableClick(Sender: TObject);
begin
  FormMain.GamesListView.BackGround.Enabled:= GamesBackgroundImageEnable.Checked;
  FormMain.MachinesListSidePanel.BackGround.Enabled:= GamesBackgroundImageEnable.Checked;
  GamesBackgroundImageButtonUpdate.Click;
end;

procedure TFormPreferences.DisableNaturalSortingClick(Sender: TObject);
begin
  if FormMain.IsStartup then
     Exit; 
  FormMain.GamesListView.BeginUpdate;
  FormMain.GamesListView.Sort.SortAll;
  FormMain.GamesListView.EndUpdate(False);
  if FormMain.SelectedEasyItem <> nil then
     FormMain.SelectedEasyItem.MakeVisible(emvMiddle);//(emvAuto);
  if FormMain.PanelMachinesList.Visible then
     begin
       FormMain.MachinesListSidePanel.BeginUpdate;
       FormMain.MachinesListSidePanel.Sort.SortAll;
       FormMain.MachinesListSidePanel.EndUpdate(False);
       if FormMain.SelectedMachineItem <> nil then
          FormMain.SelectedMachineItem.MakeVisible(emvMiddle);//(emvAuto);
     end;
end;

procedure TFormPreferences.LabelGoToMAMEInfoMouseEnter(Sender: TObject);
begin
  TShadowLabel(Sender).Font.Color:= clBlue;
  TShadowLabel(Sender).Font.Style:= [fsUnderline];
end;

procedure TFormPreferences.LabelGoToMAMEInfoMouseLeave(Sender: TObject);
begin
  TShadowLabel(Sender).Font.Color:= clNavy;
  TShadowLabel(Sender).Font.Style:= [];
end;

procedure TFormPreferences.LabelGoToMAMEInfoClick(Sender: TObject);
begin
  CallShellExecute(Sender);
end;

procedure TFormPreferences.GameMultilineCaptionsClick(Sender: TObject);
begin
  if FormMain.IsGroupedView or FormMain.IsDetailsView then
     begin
       if FormMain.PopupGameIconSize.Tag in [0, 1] then
          FormMain.GamesListView.PaintInfoItem.CaptionLines:= Ord(GameMultilineCaptions.Checked)+1;
     end;
  if FormMain.PopupMachinesListSidePanelIconSize.Tag in [0] then //, 1] then
     FormMain.MachinesListSidePanel.PaintInfoItem.CaptionLines:= Ord(GameMultilineCaptions.Checked)+1;
end;

procedure TFormPreferences.ImagePanelOuterFrameColorSelect(
  Sender: TObject);
begin
  FormMain.PanelImage.Color:= ImagePanelOuterFrameColor.Selected;
end;

procedure TFormPreferences.ButtonImagePanelOuterFrameColorDefaultClick(Sender: TObject);
begin
  SetDefaultColorBox(ImagePanelOuterFrameColor);
end;

procedure TFormPreferences.GamesListStatusBarGradientBarClick(
  Sender: TObject);
begin
  case GamesListStatusBarGradientBar.Checked of
    True : FormMain.StatusBarPanel.Style:= vgSimple;
    False: FormMain.StatusBarPanel.Style:= vgSolid;
  end;
end;

procedure TFormPreferences.GamesListStatusBarTopColorSelect(
  Sender: TObject);
begin
  FormMain.StatusBarPanel.Color1:= GamesListStatusBarTopColor.Selected;
end;

procedure TFormPreferences.GamesListStatusBarBottomColorSelect(
  Sender: TObject);
begin
  FormMain.StatusBarPanel.Color2:= GamesListStatusBarBottomColor.Selected;
end;

procedure TFormPreferences.GamesListStatusBarFrameColorSelect(
  Sender: TObject);
begin
  FormMain.StatusBarPanel.ColorFrame:= GamesListStatusBarFrameColor.Selected;
end;

procedure TFormPreferences.GamesListStatusBarFontColorSelect(
  Sender: TObject);
begin
  FormMain.StatusBar_GamesTotal.Font.Color:= GamesListStatusBarFontColor.Selected;
  FormMain.StatusBar_GamesGameName.Font.Color:= GamesListStatusBarFontColor.Selected;
end;

procedure TFormPreferences.GamesListStatusBarButtonDefaultClick(Sender: TObject);
begin
  SetDefaultColorBox(GamesListStatusBarTopColor);
  SetDefaultColorBox(GamesListStatusBarBottomColor);
  SetDefaultColorBox(GamesListStatusBarFontColor);
  SetDefaultColorBox(GamesListStatusBarFrameColor);
  GamesListStatusBarGradientBar.Checked:= True;
end;

procedure TFormPreferences.InternetGameInfoLinkButtonDefaultClick(Sender: TObject);
begin
  InternetGameInfoLink.Text:= 'http://www.progettoemma.net/gioco.php?game=%s';
end;

procedure TFormPreferences.InternetMAMESoftwareListGameInfoLinkButtonDefaultClick(Sender: TObject);
begin
  InternetMAMESoftwareListGameInfoLink.Text:= 'http://www.progettoemma.net/mess/gioco.php?game=%s&list=%s';
end;

procedure TFormPreferences.DisableDeleteSelectedGamesClick(Sender: TObject);
begin
  FormMain.PopupDeleteSelectedGames.Enabled:= not DisableDeleteSelectedGames.Checked;
  FormMain.PopupExtraCopyMoveSelectedGames.Enabled:= FormMain.PopupDeleteSelectedGames.Enabled;
  FormMain.PopupDeleteSelectedGamesFromGamesList.Enabled:= FormMain.PopupDeleteSelectedGames.Enabled;
end;

procedure TFormPreferences.GameDocsDisplayModeSinglePanelClick(
  Sender: TObject);
begin
  // GameDocsDisplayModeBox.Tag
  // 0 -> Single Panel
  // 1 -> Tabbed Panels

  if (TAdvOfficeRadioButton(Sender).Tag = GameDocsDisplayModeBox.Tag) and (not FormMain.IsStartup) then
     Exit;

  FormMain.ButtonImagePanelToggle.Visible:= not GameDocsDisplayModeSinglePanel.Checked;
  FormMain.ButtonDocsPanelToggle.Visible:= not GameDocsDisplayModeSinglePanel.Checked;

  if FormMain.IsStartup then
     Exit;

  GameDocsDisplayModeBox.Tag:= TAdvOfficeRadioButton(Sender).Tag;

  //if GameDocsDisplayModeSinglePanel.Checked then
  //   begin
  //     // perhaps reload images / game docs of selected game ????
  //   end;
end;

procedure TFormPreferences.HintBox_OpacityChange(Sender: TObject);
begin
  LabelHintBox_Opacity.Caption:= 'Opacity ['+IntToStr(HintBox_Opacity.Position)+']';
end;

procedure TFormPreferences.ButtonDefaultHintBox_OpacityClick(
  Sender: TObject);
begin
  HintBox_Opacity.Position:= 200;
end;

procedure TFormPreferences.ButtonHintBoxDefaultColorsClick(
  Sender: TObject);
begin
  SetDefaultColorBox(HintBox_Color);
  SetDefaultColorBox(HintBox_FrameColor);
  HintBox_FrameEnabled.Checked:= True;
end;

procedure TFormPreferences.ButtonHintTextDefaultColorsClick(
  Sender: TObject);
begin
  SetDefaultColorBox(HintBox_TextColor);
  SetDefaultColorBox(HintBox_TextShadowColor);
  HintBox_TextShadowEnabled.Checked:= True;
end;

procedure TFormPreferences.NightModeRepaintToolBar;
begin
  if (not FormMain.IsStartup) and IsNightMode then
     begin
       FormMain.ImagesToolbarButtons.Invalidate;
       FormMain.ToolBarButtons.Invalidate; // games filters tool bar
     end;
end;

procedure TFormPreferences.NightModeToolBarBkColorsDefaultButtonClick(Sender: TObject);
begin
  SetDefaultColorBox(NightModeToolBarBkTopColor);
  SetDefaultColorBox(NightModeToolBarBkBottomColor);
  SetDefaultColorBox(NightModeToolBarFrameColor);
end;

procedure TFormPreferences.NightModeToolBarBkTopColorSelect(
  Sender: TObject);
begin
  NightModeRepaintToolBar;
end;

procedure TFormPreferences.NightModeToolBarFrameColorSelect(
  Sender: TObject);
begin
  NightModeRepaintToolBar;
end;

procedure TFormPreferences.NightModeToolBarShowFrameClick(Sender: TObject);
begin
  NightModeRepaintToolBar;
end;

procedure TFormPreferences.ImageSplitterStyleSelectorSelect(
  Sender: TObject);
begin
  FormMain.UpdateImageLayoutSplittersStyle;
end;

procedure TFormPreferences.ButtonImageSplitterSingleColorDefaultClick(Sender: TObject);
begin
  SetDefaultColorBox(ImageSplitterSingleColor);
  SetDefaultColorBox(ImageSplitterSingleColorHot);
end;

procedure TFormPreferences.GameDocsSplitterStyleSelectorSelect(
  Sender: TObject);
begin
  FormMain.UpdateSplitterStyle(FormMain.SplitterMAMEInfo, TTMSStyle(GameDocsSplitterStyleSelector.ItemIndex),
                               GameDocsSplitterSingleColor.Selected,
                               GameDocsSplitterSingleColorHot.Selected);
end;

procedure TFormPreferences.ButtonGameDocsSplitterStyleDefaultClick(
  Sender: TObject);
begin
  SetSelectedComboBox(6, GameDocsSplitterStyleSelector);
end;

procedure TFormPreferences.ButtonGameDocsSplitterSingleColorDefaultClick(
  Sender: TObject);
begin
  SetDefaultColorBox(GameDocsSplitterSingleColor);
  SetDefaultColorBox(GameDocsSplitterSingleColorHot);
end;

procedure TFormPreferences.GameDocsSplitterShowGripIconClick(
  Sender: TObject);
begin
  FormMain.SetGripIcon(FormMain.SplitterMAMEInfo, GameDocsSplitterShowGripIcon.Checked);
end;

procedure TFormPreferences.GameDocsSplitterSingleColorSelect(
  Sender: TObject);
begin
  GameDocsSplitterStyleSelector.OnSelect(Self);
end;

procedure TFormPreferences.GameDocsSplitterSingleColorHotSelect(
  Sender: TObject);
begin
  GameDocsSplitterStyleSelector.OnSelect(Self);
end;

procedure TFormPreferences.NightModeToolBarBkBottomColorSelect(Sender: TObject);
begin
  NightModeRepaintToolBar;
end;

procedure TFormPreferences.NightModeToolBarGradientBarClick(
  Sender: TObject);
begin
  NightModeRepaintToolBar;
end;

end.




