unit uPreferences;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  ExtCtrls, StdCtrls, ComCtrls, Menus, IniFiles,
  Buttons, BarMenus, GraphicEx,  MPCommonObjects, EasyListview,
  SplitterEx, AdvOfficeButtons, AdvGroupBox, ShadowLabel, PanelEx, ShellAPI;

type
  TFormPreferences = class(TForm)
    PageOptions: TNotebook;
    DisableMinimize: TAdvOfficeCheckBox;
    GroupBoxSplitters: TAdvGroupBox;
    SplitterStyleSelector: TComboBox;
    ButtonSplitterStyleDefault: TBitBtn;
    SplitterGripIcon: TAdvOfficeCheckBox;
    ButtonCustomizeGameFonts: TBitBtn;
    GroupBoxImageLayoytSplitters: TAdvGroupBox;
    LabelAppearanceGameDocuments: TLabel;
    GameDocumentsBackgroundColor: TColorBox;
    ButtonGameDocumentsFont: TBitBtn;
    ButtonGameDocumentsDefault: TBitBtn;
    GameSelectionAlphaBlend: TAdvOfficeCheckBox;
    LabelMAMu_IconsFolder: TLabel;
    MAMu_IconsFolder: TEdit;
    ButtonMAMu_IconsFolderSelect: TBitBtn;
    ImageEnableGripIcon: TAdvOfficeCheckBox;
    MAMu_Icon: TImage;
    ShadowLabel1: TShadowLabel;
    PanelTabButtons: TPanelEx;
    ButtonGeneral: TSpeedButton;
    ButtonGamesList: TSpeedButton;
    ButtonImages: TSpeedButton;
    ButtonGameDocuments: TSpeedButton;
    ColumnsSettings: TAdvGroupBox;
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
    LabelImageLayoutSplitterSingleColor: TLabel;
    ImageLayoutSplitterSingleColor: TColorBox;
    ImageLayoutSplitterSingleColorHot: TColorBox;
    LabelImageLayoutSplitterSingleColorHot: TLabel;
    ButtonImageLayoutSplitterSingleColorDefault: TBitBtn;
    HideDOSBoxFrame: TAdvGroupBox;
    HideDOSBoxEmuVersionCreateGames: TAdvOfficeCheckBox;
    HideDOSBoxRunGame: TAdvOfficeCheckBox;
    ShadowLabel2: TShadowLabel;
    LabelGoToMESSInfo: TShadowLabel;
    LabelImagePanelOuterFrameColor: TLabel;
    ImagePanelOuterFrameColor: TColorBox;
    ButtonImagePanelOuterFrameColorDefault: TBitBtn;
    LabelGoToGameInit: TShadowLabel;
    GameDocs: TEasyListview;
    ButtonUp: TBitBtn;
    ButtonDown: TBitBtn;
    ButtonResetAutoGameInfoOrder: TBitBtn;
    ShadowLabel3: TShadowLabel;
    AllowOnlyOneInstance: TAdvOfficeCheckBox;
    ShadowLabel4: TShadowLabel;
    LabelSplitterSingleColor: TLabel;
    SplitterSingleColor: TColorBox;
    SplitterSingleColorHot: TColorBox;
    LabelSplitterSingleColorHot: TLabel;
    ButtonSplitterSingleColorDefault: TBitBtn;
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
    GroupBoxInternetGameInfo: TAdvGroupBox;
    LabelInternetGameInfoLink: TLabel;
    InternetGameInfoLink: TEdit;
    InternetGameInfoLinkButtonDefault: TBitBtn;
    LabelInternetMAMESoftwareListGameInfoLink: TLabel;
    InternetMAMESoftwareListGameInfoLink: TEdit;
    InternetMAMESoftwareListGameInfoLinkButtonDefault: TBitBtn;
    Label5: TLabel;
    Label6: TLabel;
    DisableDeleteSelectedGames: TAdvOfficeCheckBox;
    LabelDisableDeleteSelectedGames: TLabel;
    IgnoreExitCode1InvalidFunction: TAdvOfficeCheckBox;
    GameDocsDisplayModeTabs: TAdvOfficeRadioButton;
    GameDocsDisplayModeSinglePanel: TAdvOfficeRadioButton;
    LabelGameDocsDisplayMode: TShadowLabel;
    LabelGameDocsDisplayModeSinglePanel: TShadowLabel;
    LabelGameDocsDisplayModeTabs: TShadowLabel;
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
    procedure ImageLayoutSplitterSingleColorSelect(Sender: TObject);
    procedure ImageLayoutSplitterSingleColorHotSelect(Sender: TObject);
    procedure ButtonImageLayoutSplitterSingleColorDefaultClick(Sender: TObject);
    procedure ButtonSplitterStyleDefaultClick(Sender: TObject);
    procedure ButtonSplitterSingleColorDefaultClick(Sender: TObject);
    procedure SplitterStyleSelectorSelect(Sender: TObject);
    procedure SplitterSingleColorSelect(Sender: TObject);
    procedure SplitterSingleColorHotSelect(Sender: TObject);
    procedure SplitterGripIconClick(Sender: TObject);
    procedure ButtonGeneralClick(Sender: TObject);
    procedure ButtonMAMu_IconsFolderSelectClick(Sender: TObject);
    procedure ImageEnableGripIconClick(Sender: TObject);
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
  private
    { Private declarations }
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

procedure TFormPreferences.ImageLayoutSplitterSingleColorSelect(
  Sender: TObject);
begin
  FormMain.UpdateImageLayoutSplittersStyle;
end;

procedure TFormPreferences.ImageLayoutSplitterSingleColorHotSelect(
  Sender: TObject);
begin
  FormMain.UpdateImageLayoutSplittersStyle;
end;

procedure TFormPreferences.ButtonImageLayoutSplitterSingleColorDefaultClick(
  Sender: TObject);
begin
  SetDefaultColorBox(ImageLayoutSplitterSingleColor);
  SetDefaultColorBox(ImageLayoutSplitterSingleColorHot);
end;

procedure TFormPreferences.ButtonSplitterStyleDefaultClick(
  Sender: TObject);
begin
  SetSelectedComboBox(6, SplitterStyleSelector);
end;

procedure TFormPreferences.ButtonSplitterSingleColorDefaultClick(
  Sender: TObject);
begin
  SetDefaultColorBox(SplitterSingleColor);
  SetDefaultColorBox(SplitterSingleColorHot);
end;

procedure TFormPreferences.SplitterStyleSelectorSelect(Sender: TObject);
begin
  //FormMain.SetGroupBoxState(GroupBoxSplitterSingleColor, SplitterStyleSelector.ItemIndex = 1);
  //GroupBoxSplitterSingleColor.Enabled{Visible}:= SplitterStyleSelector.ItemIndex = 1;
  FormMain.UpdateSplitterStyle(FormMain.Splitter, TTMSStyle(SplitterStyleSelector.ItemIndex),
                               SplitterSingleColor.Selected,
                               SplitterSingleColorHot.Selected);
  FormMain.UpdateSplitterStyle(FormMain.SplitterMAMEInfo, TTMSStyle(SplitterStyleSelector.ItemIndex),
                               SplitterSingleColor.Selected,
                               SplitterSingleColorHot.Selected);
  FormMain.UpdateSplitterStyle(FormMain.SplitterMachines, TTMSStyle(SplitterStyleSelector.ItemIndex),
                               SplitterSingleColor.Selected,
                               SplitterSingleColorHot.Selected);
end;

procedure TFormPreferences.SplitterSingleColorSelect(Sender: TObject);
begin
  SplitterStyleSelector.OnSelect(Self);
end;

procedure TFormPreferences.SplitterSingleColorHotSelect(Sender: TObject);
begin
  SplitterStyleSelector.OnSelect(Self);
end;

procedure TFormPreferences.SplitterGripIconClick(Sender: TObject);
begin
  FormMain.SetGripIcon(FormMain.Splitter, SplitterGripIcon.Checked);
  FormMain.SetGripIcon(FormMain.SplitterMAMEInfo, SplitterGripIcon.Checked);
end;

procedure TFormPreferences.ButtonGeneralClick(Sender: TObject);
begin
  PageOptions.PageIndex:= TSpeedButton(Sender).Tag;
end;

procedure TFormPreferences.ButtonMAMu_IconsFolderSelectClick(
  Sender: TObject);
begin
  FormMain.DialogSelectFolder(MAMu_IconsFolder, False);
end;

procedure TFormPreferences.ImageEnableGripIconClick(Sender: TObject);
begin
  if ImageEnableGripIcon.Tag = 0 then
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

            FormMain.WriteImageCategories(False, True);
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
  // LabelGameDocsDisplayMode.Tag
  // 0 -> Single Panel
  // 1 -> Tabbed Panels

  if (TAdvOfficeRadioButton(Sender).Tag = LabelGameDocsDisplayMode.Tag) and (not FormMain.IsStartup) then
     Exit;

  FormMain.ButtonImagePanelToggle.Visible:= not GameDocsDisplayModeSinglePanel.Checked;
  FormMain.ButtonDocsPanelToggle.Visible:= not GameDocsDisplayModeSinglePanel.Checked;

  if FormMain.IsStartup then
     Exit;

  LabelGameDocsDisplayMode.Tag:= TAdvOfficeRadioButton(Sender).Tag;

  //if GameDocsDisplayModeSinglePanel.Checked then
  //   begin
  //     // perhaps reload images / game docs of selected game ????
  //   end;
end;

end.




