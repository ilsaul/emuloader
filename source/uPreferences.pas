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
    GameSelectionDarkFont: TAdvOfficeCheckBox;
    ImageEnableGripIcon: TAdvOfficeCheckBox;
    MAMu_Icon: TImage;
    ShadowLabel1: TShadowLabel;
    PanelTabButtons: TPanelEx;
    ButtonGeneral: TSpeedButton;
    ButtonGamesList: TSpeedButton;
    ButtonImages: TSpeedButton;
    ButtonGameDocuments: TSpeedButton;
    Bevel1: TBevel;
    ButtonVideoPreview: TSpeedButton;
    LabelVideoPreviewTitle: TShadowLabel;
    VideoPreviewFolder: TEdit;
    ButtonSelectVideoPreviewFolder: TBitBtn;
    PanelVideoPreviewSystems: TPanelEx;
    SystemsVideoPreview: TEasyListview;
    LabelVideoPreviewSystem: TShadowLabel;
    PanelEx3: TPanelEx;
    Label2: TLabel;
    LabelVideoPreviewMediaPlayerExecutable: TLabel;
    VideoPreviewMediaPlayerExecutable: TEdit;
    ButtonSelectVideoPreviewMediaPlayer: TBitBtn;
    LabelVideoPreviewMediaPlayerParameters: TLabel;
    VideoPreviewMediaPlayerParameters: TEdit;
    ButtonClearVideoPreviewMediaPlayerParameters: TBitBtn;
    VideoPreviewAutoPlay: TAdvOfficeCheckBox;
    LabelVideoPreviewAutoPlay: TShadowLabel;
    LabelVideoPreviewAutoPlayHelp: TShadowLabel;
    ButtonVideoPreviewHelp: TBitBtn;
    VideoPreviewParentGameVideo: TAdvOfficeCheckBox;
    VideoPreviewEnabled: TAdvOfficeCheckBox;
    ButtonResetVideoPreviewMediaPlayerParameters: TBitBtn;
    ButtonHelpVideoPreviewMediaPlayerParameters: TBitBtn;
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
    VideoPreviewPlayDummyVideo: TAdvOfficeCheckBox;
    ButtonHelpVideoPreviewPlayDummyVideo: TBitBtn;
    LabelGoToMESSInfo: TShadowLabel;
    LabelVideoPreviewDummyVideoParameters: TLabel;
    VideoPreviewDummyVideoParameters: TEdit;
    ButtonClearVideoPreviewDummyVideoParameters: TBitBtn;
    ButtonResetVideoPreviewDummyVideoParameters: TBitBtn;
    LabelImagePanelOuterFrameColor: TLabel;
    ImagePanelOuterFrameColor: TColorBox;
    ButtonImagePanelOuterFrameColorDefault: TBitBtn;
    LabelGoToGameInit: TShadowLabel;
    GameDocs: TEasyListview;
    ButtonUp: TBitBtn;
    ButtonDown: TBitBtn;
    ButtonResetAutoGameInfoOrder: TBitBtn;
    Label1: TLabel;
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
    procedure SystemsVideoPreviewItemSelectionChanged(
      Sender: TCustomEasyListview; Item: TEasyItem);
    procedure VideoPreviewFolderChange(Sender: TObject);
    procedure ButtonSelectVideoPreviewFolderClick(Sender: TObject);
    procedure LabelVideoPreviewAutoPlayHelpClick(Sender: TObject);
    procedure LabelVideoPreviewAutoPlayHelpMouseEnter(Sender: TObject);
    procedure LabelVideoPreviewAutoPlayHelpMouseLeave(Sender: TObject);
    procedure ButtonSelectVideoPreviewMediaPlayerClick(Sender: TObject);
    procedure ButtonClearVideoPreviewMediaPlayerParametersClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure ButtonVideoPreviewHelpClick(Sender: TObject);
    procedure ButtonResetVideoPreviewMediaPlayerParametersClick(
      Sender: TObject);
    procedure ButtonHelpVideoPreviewMediaPlayerParametersClick(Sender: TObject);
    procedure DisableCloneIndentClick(Sender: TObject);
    procedure GamesBackgroundImageEnableClick(Sender: TObject);
    procedure DisableNaturalSortingClick(Sender: TObject);
    procedure LabelGoToMAMEInfoMouseEnter(Sender: TObject);
    procedure LabelGoToMAMEInfoClick(Sender: TObject);
    procedure LabelGoToMAMEInfoMouseLeave(Sender: TObject);
    procedure GameMultilineCaptionsClick(Sender: TObject);
    procedure ButtonHelpVideoPreviewPlayDummyVideoClick(Sender: TObject);
    procedure ButtonClearVideoPreviewDummyVideoParametersClick(Sender: TObject);
    procedure ButtonResetVideoPreviewDummyVideoParametersClick(Sender: TObject);
    procedure ImagePanelOuterFrameColorSelect(Sender: TObject);
    procedure ButtonImagePanelOuterFrameColorDefaultClick(Sender: TObject);
    procedure GamesListStatusBarGradientBarClick(Sender: TObject);
    procedure GamesListStatusBarTopColorSelect(Sender: TObject);
    procedure GamesListStatusBarBottomColorSelect(Sender: TObject);
    procedure GamesListStatusBarFrameColorSelect(Sender: TObject);
    procedure GamesListStatusBarFontColorSelect(Sender: TObject);
    procedure GamesListStatusBarButtonDefaultClick(Sender: TObject);
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
  FormMain.MAMEInfoTextHolder.Font.Name:= 'Lucida Console';
  FormMain.MAMEInfoTextHolder.Font.Size:= 8;
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
        FileFullPath:= FormMain.FullFolderFix(GamesBackgroundImage.Text);
        if (not FileExists(FileFullPath)) or (FileFullPath = '') then
           begin
             if not FormMain.IsStartup then
                FormMain.BlinkBkEdit(GamesBackgroundImage);
             Exit;
           end;

        try
          ListViewBk:= TPNGGraphic.Create;
          ListViewBk.LoadFromFile(FileFullPath);
          FormMain.GamesListView.BackGround.Image.Assign(ListViewBk);
          FreeAndNil(ListViewBk);
        except
          FormMain.GamesListView.Background.Image:= nil;
        end;
      end;
    False:
      begin
        FormMain.GamesListView.Background.Image:= nil;
      end;
  end;
end;

procedure TFormPreferences.GamesTileBackgroundClick(Sender: TObject);
begin
  FormMain.GamesListView.BackGround.Tile:= GamesTileBackground.Checked;
end;

procedure TFormPreferences.FormCreate(Sender: TObject);
begin
  PageOptions.PageIndex:= 0;
  FormMain.LoadMessageIcon(MAMu_Icon, 'mamu_.ico', True);

  FormMain.ELV_ResetNormalColors(GameDocs);

  FormMain.ELV_ResetNormalColors(SystemsVideoPreview);
  LabelVideoPreviewSystem.Caption:= '';
  FormMain.ELV_PopulateSystems(SystemsVideoPreview, True, True, 1);
  SystemsVideoPreview.Items.Items[1].Caption:= 'Supmod3l';
  SystemsVideoPreview.Items.Items[6].Caption:= 'Model 2';
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
  if PageOptions.PageIndex = 4 then
     begin
       if not FormMain.CheckSelected(SystemsVideoPreview) then
          FormMain.ELV_SelectItem(SystemsVideoPreview, 0);
       SystemsVideoPreview.SetFocus;
     end;
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

procedure TFormPreferences.SystemsVideoPreviewItemSelectionChanged(
  Sender: TCustomEasyListview; Item: TEasyItem);
begin
  if Item.Selected then
     begin
       LabelVideoPreviewSystem.Caption:= FormMain.GetEmulatorDescription(Item.ImageIndex);
       Sender.Tag:= Item.ImageIndex;
       VideoPreviewFolder.Text:= FormMain.VideoPreviewDir[Sender.Tag];
     end;
end;

procedure TFormPreferences.VideoPreviewFolderChange(Sender: TObject);
begin
  if FormMain.CheckSelected(SystemsVideoPreview) then
     FormMain.VideoPreviewDir[SystemsVideoPreview.Tag]:= VideoPreviewFolder.Text;
end;

procedure TFormPreferences.ButtonSelectVideoPreviewFolderClick(Sender: TObject);
begin
  if FormMain.CheckSelected(SystemsVideoPreview) then
     FormMain.DialogSelectFolder(VideoPreviewFolder, False);
end;

procedure TFormPreferences.LabelVideoPreviewAutoPlayHelpClick(Sender: TObject);
begin
  CallMessageBox;
  FormMain.AddMsgText('    This option play videos automatically when selecting games but, depending on how '+
                      'you setup the media player, it might crash the frontend or even Windows if you select different games while a '+
                      'video is playing.'+#13#10+#13#10+
                      '    I recommend using this setting only if you don''t want to start the video manually. '+
                      'With it enabled, after loading the video the active and focused application will be the media player.'+#13#10+
                      'I recommend using a hot-key to close the media player manually so you won''t have to close it using the mouse.'+#13#10#13#10+
                      'Remember that you can start a video by:'+#13#10);
  FormMain.AddMsgText('Shift-V', $00a65300, [fsBold]);
  FormMain.AddMsgText(' shortcut'+#13#10);
  FormMain.AddMsgText('Play Video Preview', $00a65300, [fsBold]);
  FormMain.AddMsgText(' button in images tool bar buttons'+#13#10);
  FormMain.AddMsgText('Play Video Preview', $00a65300, [fsBold]);
  FormMain.AddMsgText(' menu option in games popup menu (mouse right click)'+#13#10+
                      'If browsing games with an arcade controller, there''s a button assigned for this task.');
  GenerateMessage('Info', 'AutoPlay video previews.');

  {GenerateMessage('INFO', 'AutoPlay video previews.',
                  '    This option play videos automatically when selecting games but, depending on how '+
                  'you setup the media player, it might crash the frontend or even Windows if you select different games while a '+
                  'video is playing.'+#13#10+#13#10+
                  '    I recommend using this setting only if scrolling the games list slowly and if you really want to '+
                  'watch videos for every new game you select.'+#13#13#10+
                  'Remember that you can start a video by:'+#13#10+
                  'Shift+V shortcut'+#13#10+'"Play Video Preview" button in images tool bar buttons'+#13#10+
                  '"Play Video Preview" menu option in games popup menu (mouse right click)'+#13#10+
                  'If browsing games with an arcade controller, there''s a button assigned for this task.', 2);}
end;

procedure TFormPreferences.LabelVideoPreviewAutoPlayHelpMouseEnter(Sender: TObject);
begin
  TShadowLabel(Sender).Font.Color:= clBlue;
  TShadowLabel(Sender).Font.Style:= [fsUnderline];
end;

procedure TFormPreferences.LabelVideoPreviewAutoPlayHelpMouseLeave(Sender: TObject);
begin
  TShadowLabel(Sender).Font.Color:= clNavy;
  TShadowLabel(Sender).Font.Style:= [];
end;

procedure TFormPreferences.ButtonSelectVideoPreviewMediaPlayerClick(Sender: TObject);
begin
  FormMain.DialogOpenFile(2, 'Select a media player executable', VideoPreviewMediaPlayerExecutable, False);
  FormMain.ReadVideoPreviewIni(True, True, False);
end;

procedure TFormPreferences.ButtonClearVideoPreviewMediaPlayerParametersClick(Sender: TObject);
begin
  VideoPreviewMediaPlayerParameters.Clear;
end;

procedure TFormPreferences.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if CanClose then
     begin
       if not Application.Terminated then
          begin
            FormMain.UpdateVideoPreviewIni;
            FormMain.SetVideoPreviewState;
          end;
     end;
end;

procedure TFormPreferences.ButtonVideoPreviewHelpClick(Sender: TObject);
begin
  CallMessageBox;
  FormMain.AddMsgText('    It''s very simple and easy to setup. First, get a media player of your choice. I use and recommend the awesome ');
  FormMain.AddMsgText('Media Player Classic Home Cinema ', clBlack, [fsBold]);
  FormMain.AddMsgText('http://mpc-hc.org', $00a65300);
  FormMain.AddMsgText(' (small RAM footprint and portable). Make sure to enable ');
  FormMain.AddMsgText('Store settings to .ini file', clMaroon, [fsItalic]);
  FormMain.AddMsgText(' option in MPC Home Cinema for maximum customization. '+
                      #13#10+#13#10+'    Select the ');
  FormMain.AddMsgText('executable', clBlack, [fsBold]);
  FormMain.AddMsgText(' file. Parameters will be loaded automatically if defined in ');
  FormMain.AddMsgText('\ini_files\videopreview.ini', $00a65300, [fsBold]);
  FormMain.AddMsgText('. If not, type the proper switches to play, and if possible, auto-close when playback is done.'+//#13#10+
                      ' You can also use a ');
  FormMain.AddMsgText('batch', clBlack, [fsBold]);
  FormMain.AddMsgText(' file but extra parameters are not supported.'+#13#10+#13#10);
  FormMain.AddMsgText('    The ', clMaroon, [fsBold]);
  FormMain.AddMsgText('%1', $00a65300, [fsBold]);
  FormMain.AddMsgText(' tag is required for the video/audio filename. Surrounding quotes are not required.', clMaroon, [fsBold]);
  FormMain.AddMsgText(#13#10+#13#10+'    Select a ');
  FormMain.AddMsgText('system', $00a65300, [fsBold]);
  FormMain.AddMsgText(' and the ');
  FormMain.AddMsgText('folder', $00a65300, [fsBold]);
  FormMain.AddMsgText(' where video/audio files are. Recursive folder scan is NOT supported.');
  FormMain.AddMsgText(#13#10+'    Check ');
  FormMain.AddMsgText('Play Video Enabled', $00a65300, [fsBold]);
  FormMain.AddMsgText(' setting. Uncheck it if you want to disable this feature completely.'+
                      #13#10+'    Check ');
  FormMain.AddMsgText('Parent Game Video', $00a65300, [fsBold]);
  FormMain.AddMsgText(' setting for clone games, to play videos of parent games.'+#13#10+'    Check ');
  FormMain.AddMsgText('Play Dummy Video to Stop Current Playback', $00a65300, [fsBold]);
  FormMain.AddMsgText(' setting to enforce playback of a short video file on a new selected game that doesn''t have a video file.'+
                      #13#10+'    The ');
  FormMain.AddMsgText('AutoPlay', $00a65300, [fsBold]);
  FormMain.AddMsgText(' setting play videos automatically when selecting games. Disabled by default for safety reasons (see ');
  FormMain.AddMsgText('read more...', $00a65300, [fsItalic]);
  FormMain.AddMsgText(' for more details).'+#13#10+#13#10+
                      '    If AutoPlay is disabled, you can play videos manually with ');
  FormMain.AddMsgText('Shift+V', $00a65300, [fsBold]);
  FormMain.AddMsgText(' shortcut or ');
  FormMain.AddMsgText('Play Video Preview', $00a65300, [fsBold]);
  FormMain.AddMsgText(' in images tool bar buttons / games popup menu. There''s a button assigned for arcade controllers as well.');

  GenerateMessage('Help', 'How to watch game video previews.');
end;

procedure TFormPreferences.ButtonResetVideoPreviewMediaPlayerParametersClick(
  Sender: TObject);
begin
  FormMain.ReadVideoPreviewIni(False, True, False);
end;

procedure TFormPreferences.ButtonHelpVideoPreviewMediaPlayerParametersClick(Sender: TObject);
begin
  CallMessageBox;
  FormMain.AddMsgText('    The ');
  FormMain.AddMsgText('%1', $00a65300, [fsBold]);
  FormMain.AddMsgText(' tag is required so Emu Loader can replace it by the video/audio filename.'+#13#10+
                      '    Why you ask ? Some media player like ');
  FormMain.AddMsgText('VLC media player ', clBlack, [fsBold]);
  FormMain.AddMsgText('http://www.videolan.org/vlc/index.html', $00a65300);
  FormMain.AddMsgText(' require command line switches before the filename.');
  FormMain.AddMsgText(#13#10+'    Others like ');
  FormMain.AddMsgText('Media Player Classic Home Cinema ', clBlack, [fsBold]);
  FormMain.AddMsgText('http://mpc-hc.org', $00a65300);
  FormMain.AddMsgText(' can have switches before or after the filename.'+#13#10+
                      '    This tag is also required by batch files, but extra tags are NOT supported.'+
                      #13#10+'Emu Loader will surround the file with quotes so, there''s '+
                      'no need to use them.'+#13#10+'    Make sure to include a ');
  FormMain.AddMsgText('auto close', $00a65300, [fsBold]);
  FormMain.AddMsgText(' parameter so the media player closes itself after the playback is finished!');

  GenerateMessage('Info', 'Required parameter.');
end;

procedure TFormPreferences.DisableCloneIndentClick(Sender: TObject);
begin
  FormMain.GamesListView.BeginUpdate;
  FormMain.GamesListView.EndUpdate(False);
end;

procedure TFormPreferences.GamesBackgroundImageEnableClick(Sender: TObject);
begin
  FormMain.GamesListView.BackGround.Enabled:= GamesBackgroundImageEnable.Checked;
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
  ShellExecute(Handle, 'open', PChar(TLabel(Sender).Hint), nil, nil, SW_SHOWNORMAL);
end;

procedure TFormPreferences.GameMultilineCaptionsClick(Sender: TObject);
begin
  if FormMain.IsGroupedView or FormMain.IsDetailsView then
     begin
       if FormMain.PopupGameIconSize.Tag in [0, 1] then
          FormMain.GamesListView.PaintInfoItem.CaptionLines:= Ord(GameMultilineCaptions.Checked)+1;
     end;
end;

procedure TFormPreferences.ButtonHelpVideoPreviewPlayDummyVideoClick(
  Sender: TObject);
begin
  CallMessageBox;
  FormMain.AddMsgText('    If a video from previous selected game is still playing and you select a new game that have '+
                      'no video to play, the previous video keeps playing until it finishes or you manually close the media player.'+#13#10+
                      'You can use this setting to force Emu Loader to load and play a "100 ms" video for games without a video file.'+#13#10+#13#10+
                      '    You can set custom parameters for the dummy video as well, but both the parameters and the ');
  FormMain.AddMsgText('%1', $00a65300, [fsBold]);
  FormMain.AddMsgText(' tag are optional. Some players might run and auto-close without the need of a video/audio file to play.'+#13#10+
                      'Note that if ');
  FormMain.AddMsgText('Dummy Media Player Parameters', clMaroon, [fsItalic]);
  FormMain.AddMsgText(' is empty, the media player parameters will be used automatically.'+#13#10+#13#10+
                      '    As a bonus, current playing video will be stopped when you want to start a game or exit the frontend.'+#13#10+
                      'Make sure the file ');
  FormMain.AddMsgText('resources\images\no_image\novideo.avi', $00a65300, [fsBold]);
  FormMain.AddMsgText(' exists or the dummy video will not load.');
  
  GenerateMessage('Help', 'Play Dummy Video to Stop Current Playback');
end;

procedure TFormPreferences.ButtonClearVideoPreviewDummyVideoParametersClick(Sender: TObject);
begin
  VideoPreviewDummyVideoParameters.Clear;
end;

procedure TFormPreferences.ButtonResetVideoPreviewDummyVideoParametersClick(Sender: TObject);
begin
  FormMain.ReadVideoPreviewIni(False, False, True);
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

end.




