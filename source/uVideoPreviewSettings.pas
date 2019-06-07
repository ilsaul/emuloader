unit uVideoPreviewSettings;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, IniFiles,
  Dialogs, StdCtrls, Buttons, PanelEx, AdvOfficeButtons, MPCommonObjects,
  EasyListview, ShadowLabel, ExtCtrls, ImgList, uCommon, uCommonCustom,
  EditEx, ButtonsEx; //, ShellAPI;

type
  TFormVideoPreviewSettings = class(TForm)
    PanelBottom: TPanelEx;
    ButtonOk: TBitBtnEx;
    ButtonCancel: TBitBtnEx;
    PanelSettings: TPanelEx;
    LabelVideoPreviewFolder: TShadowLabel;
    LabelVideoPreviewMediaPlayerExecutable: TShadowLabel;
    LabelVideoPreviewMediaPlayerParameters: TShadowLabel;
    LabelVideoPreviewAutoPlay: TShadowLabel;
    LabelVideoPreviewDummyVideoParameters: TShadowLabel;
    LabelSnapDirAutoSearch: TShadowLabel;
    VideoPreviewFolder: TEditEx;
    ButtonSelectVideoPreviewFolder: TBitBtnEx;
    VideoPreviewMediaPlayerExecutable: TEditEx;
    ButtonSelectVideoPreviewMediaPlayer: TBitBtnEx;
    VideoPreviewMediaPlayerParameters: TEditEx;
    VideoPreviewAutoPlay: TAdvOfficeCheckBoxEx;
    VideoPreviewParentGameVideo: TAdvOfficeCheckBoxEx;
    ButtonHelpVideoPreviewMediaPlayerParameters: TBitBtnEx;
    VideoPreviewPlayDummyVideo: TAdvOfficeCheckBoxEx;
    ButtonHelpVideoPreviewPlayDummyVideo: TBitBtnEx;
    VideoPreviewDummyVideoParameters: TEditEx;
    ButtonSnaplDirAutoSearchHelp: TBitBtnEx;
    VideoPreviewEnabled: TAdvOfficeCheckBoxEx;
    IL_Systems: TImageList;
    ButtonResetVideoPreviewMediaPlayerParameters: TBitBtnEx;
    ButtonResetVideoPreviewDummyVideoParameters: TBitBtnEx;
    ButtonResetVideoPreviewMediaPlayer: TBitBtnEx;
    ButtonResetVideoPreviewFolder: TBitBtnEx;
    SystemsVideoPreview: TEasyListview;
    ButtonVideoPreviewHelp: TBitBtnEx;
    ButtonVideoPreviewAutoPlayHelp: TBitBtnEx;
    PanelSystemsTitle: TPanelEx;
    LabelSystemType: TShadowLabel;
    LabelSystemNotAvailable: TShadowLabel;
    LabelSystemTitle: TShadowLabel;
    PanelSystemsTitleBottom: TPanelEx;
    procedure SystemsVideoPreviewItemSelectionChanged(
      Sender: TCustomEasyListview; Item: TEasyItem);
    procedure VideoPreviewFolderChange(Sender: TObject);
    procedure ButtonSelectVideoPreviewFolderClick(Sender: TObject);
    procedure ButtonSelectVideoPreviewMediaPlayerClick(Sender: TObject);
    procedure ButtonHelpVideoPreviewMediaPlayerParametersClick(
      Sender: TObject);
    procedure ButtonHelpVideoPreviewPlayDummyVideoClick(Sender: TObject);
    procedure LabelVideoPreviewAutoPlayHelpMouseEnter(Sender: TObject);
    procedure LabelVideoPreviewAutoPlayHelpMouseLeave(Sender: TObject);
    procedure ButtonVideoPreviewHelpClick(Sender: TObject);
    procedure ButtonSnaplDirAutoSearchHelpClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ButtonResetVideoPreviewDummyVideoParametersClick(
      Sender: TObject);
    procedure ButtonResetVideoPreviewMediaPlayerParametersClick(
      Sender: TObject);
    procedure ButtonVideoPreviewAutoPlayHelpClick(Sender: TObject);
    procedure ButtonResetVideoPreviewFolderClick(Sender: TObject);
    procedure SystemsVideoPreviewItemPaintText(Sender: TCustomEasyListview;
      Item: TEasyItem; Position: Integer; ACanvas: TCanvas);
  private
    { Private declarations }
    temp_ArcadeVideoPreviewDir: packed array[1..MaxArcadeSystems] of String;
    temp_ConsoleComputerVideoPreviewDir: packed array[1..MaxConsoleComputerSystems] of String;
    procedure UpdateSettingsVars;
  public
    { Public declarations }
  end;

var
  FormVideoPreviewSettings: TFormVideoPreviewSettings;

implementation

uses uMain;


{$R *.dfm}

procedure TFormVideoPreviewSettings.UpdateSettingsVars;
var
  Loop: Integer;
begin
  for Loop:= 1 to MaxArcadeSystems do //Low(FormMain.ArcadeVideoPreviewDir) to High(FormMain.ArcadeVideoPreviewDir) do
      FormMain.ArcadeVideoPreviewDir[Loop]:= temp_ArcadeVideoPreviewDir[Loop];

  for Loop:= 1 to MaxConsoleComputerSystems do // Low(FormMain.ConsoleComputerVideoPreviewDir) to High(FormMain.ConsoleComputerVideoPreviewDir) do
      FormMain.ConsoleComputerVideoPreviewDir[Loop]:= temp_ConsoleComputerVideoPreviewDir[Loop];

  FormMain.VideoPreviewMediaPlayerExecutable:= VideoPreviewMediaPlayerExecutable.Text;
  FormMain.VideoPreviewEnabled:= VideoPreviewEnabled.Checked;
  FormMain.VideoPreviewAutoPlay:= VideoPreviewAutoPlay.Checked;
  FormMain.VideoPreviewParentGameVideo:= VideoPreviewParentGameVideo.Checked;
  FormMain.VideoPreviewPlayDummyVideo:= VideoPreviewPlayDummyVideo.Checked;
  FormMain.VideoPreviewMediaPlayerParameters:= VideoPreviewMediaPlayerParameters.Text;
  FormMain.VideoPreviewDummyVideoParameters:= VideoPreviewDummyVideoParameters.Text;
end;

procedure TFormVideoPreviewSettings.SystemsVideoPreviewItemSelectionChanged(
  Sender: TCustomEasyListview; Item: TEasyItem);
begin
  if Item.Selected then
     begin
       SystemsVideoPreview.Tag:= FormMain.ELV_GetSystemTagMulti(SystemsVideoPreview);
       FormMain.ELV_GetSystemTitle(SystemsVideoPreview, Item, LabelSystemTitle, LabelSystemType);
       LabelSystemNotAvailable.Visible:= Item.Ghosted;
       if FormMain.ELV_IsArcadeSystemSelected(SystemsVideoPreview) then
          VideoPreviewFolder.Text:= FormMain.ArcadeVideoPreviewDir[Sender.Tag]
       else
          VideoPreviewFolder.Text:= FormMain.ConsoleComputerVideoPreviewDir[Sender.Tag];
     end;
end;

procedure TFormVideoPreviewSettings.VideoPreviewFolderChange(
  Sender: TObject);
begin
  if FormVideoPreviewSettings.Tag <> 0 then
     Exit;

  if FormMain.CheckSelected(SystemsVideoPreview) then
     begin
       if FormMain.ELV_IsArcadeSystemSelected(SystemsVideoPreview) then
          begin
            if temp_ArcadeVideoPreviewDir[SystemsVideoPreview.Tag] <> VideoPreviewFolder.Text then
               temp_ArcadeVideoPreviewDir[SystemsVideoPreview.Tag]:= VideoPreviewFolder.Text;
          end
       else
          begin
            if temp_ConsoleComputerVideoPreviewDir[SystemsVideoPreview.Tag] <> VideoPreviewFolder.Text then
               temp_ConsoleComputerVideoPreviewDir[SystemsVideoPreview.Tag]:= VideoPreviewFolder.Text;
          end;
     end;
end;

procedure TFormVideoPreviewSettings.ButtonSelectVideoPreviewFolderClick(
  Sender: TObject);
begin
  if FormMain.CheckSelected(SystemsVideoPreview) then
     FormMain.DialogSelectFolder(VideoPreviewFolder, False, 'Select a folder for video preview'+#13#10+
                                 FormMain.ELV_GetSystemTitle(SystemsVideoPreview,SystemsVideoPreview.Selection.First));
end;

procedure TFormVideoPreviewSettings.ButtonSnaplDirAutoSearchHelpClick(
  Sender: TObject);
begin
  CallMessageBox;
  FormMain.AddMsgText('    You can place your video files in emulator''s folder or game snapshot folders. By doing this you don''t need '+
                      'to select custom folders for video files. All systems are supported, not just MAME. You have three choices:'+#13#10+#13#10);
  FormMain.AddMsgText('1.', MsgTxtColors.colorWarning, [fsBold]);
  FormMain.AddMsgText(' create a ');
  FormMain.AddMsgText('videosnaps', MsgTxtColors.colorFileName, [fsBold]);
  FormMain.AddMsgText(' sub-folder in the emulator root folder (');
  FormMain.AddMsgText('emu_dir\videosnaps', MsgTxtColors.colorFileName, [fsBold]);
  FormMain.AddMsgText(').'+#13#10);
  FormMain.AddMsgText('2.', MsgTxtColors.colorWarning, [fsBold]);
  FormMain.AddMsgText(' create a ');
  FormMain.AddMsgText('videosnaps', MsgTxtColors.colorFileName, [fsBold]);
  FormMain.AddMsgText(' sub-folder in the "snap_dir" folder (');
  FormMain.AddMsgText('snap_dir\videosnaps', MsgTxtColors.colorFileName, [fsBold]);
  FormMain.AddMsgText(').'+#13#10);
  FormMain.AddMsgText('3.', MsgTxtColors.colorWarning, [fsBold]);
  FormMain.AddMsgText(' mixed together with image files in the ');
  FormMain.AddMsgText('snap_dir', MsgTxtColors.colorFileName, [fsBold]);
  FormMain.AddMsgText(' root folder (not recommended).'+#13#10#13#10+
                      '    Note that even if you select a custom folder for your video files, if not '+
                      'found, the files will also be searched in these folders!');
  GenerateMessage('Help', 'What is Snap Dir Auto-Search ?');
end;

procedure TFormVideoPreviewSettings.ButtonSelectVideoPreviewMediaPlayerClick(
  Sender: TObject);
begin
  FormMain.DialogOpenFile(2, 'Select a media player executable', VideoPreviewMediaPlayerExecutable, False);
  FormMain.ReadVideoPreviewIni(False, True, True);
end;

procedure TFormVideoPreviewSettings.ButtonHelpVideoPreviewMediaPlayerParametersClick(
  Sender: TObject);
begin
  CallMessageBox;
  FormMain.AddMsgText('    The ');
  FormMain.AddMsgText('%1', MsgTxtColors.colorFileName, [fsBold]);
  FormMain.AddMsgText(' tag is required so Emu Loader can replace it by the video/audio filename.'+#13#10+
                      '    Why you ask ? Some media player like ');
  FormMain.AddMsgText('VLC media player ', clBlack, [fsBold]);
  FormMain.AddMsgText('http://www.videolan.org/vlc/index.html', MsgTxtColors.colorFileName);
  FormMain.AddMsgText(' require command line switches before the filename.');
  FormMain.AddMsgText(#13#10+'    Others like ');
  FormMain.AddMsgText('Media Player Classic Home Cinema ', clBlack, [fsBold]);
  FormMain.AddMsgText('http://mpc-hc.org', MsgTxtColors.colorFileName);
  FormMain.AddMsgText(' can have switches before or after the filename.'+#13#10+
                      '    This tag is also required for batch files, but extra tags are not supported.'+
                      #13#10+'Emu Loader will surround the file with quotes so, there''s '+
                      'no need to use them.'+#13#10+'    Make sure to include a ');
  FormMain.AddMsgText('auto close', MsgTxtColors.colorFileName, [fsBold]);
  FormMain.AddMsgText(' parameter so the media player closes itself after the playback is finished!');

  GenerateMessage('Info', 'Required parameter.');
end;

procedure TFormVideoPreviewSettings.ButtonHelpVideoPreviewPlayDummyVideoClick(
  Sender: TObject);
begin
  CallMessageBox;
  FormMain.AddMsgText('    If a video from previous selected game is still playing and you select a new game that have '+
                      'no video to play, the previous video keeps playing until it finishes or you manually close the media player.'+#13#10+
                      'You can use this setting to force Emu Loader to load and play a "100 ms" video for games without a video file.'+#13#10+#13#10+
                      '    You can set custom parameters for the dummy video as well, but both the parameters and the ');
  FormMain.AddMsgText('%1', MsgTxtColors.colorFileName, [fsBold]);
  FormMain.AddMsgText(' tag are optional. Some players might run and auto-close without the need of a video/audio file to play.'+#13#10+
                      'Note that if ');
  FormMain.AddMsgText('Dummy Media Player Parameters', MsgTxtColors.colorWarning, [fsItalic]);
  FormMain.AddMsgText(' is empty, the media player parameters will be used automatically.'+#13#10+#13#10+
                      '    As a bonus, current playing video will be stopped when you want to start a game or exit the frontend.'+#13#10+
                      'Make sure the file ');
  FormMain.AddMsgText('resources\images\novideo.avi', MsgTxtColors.colorFileName, [fsBold]);
  //FormMain.AddMsgText('resources\images\no_image\novideo.avi', MsgTxtColors.colorFileName, [fsBold]);
  FormMain.AddMsgText(' exists or the dummy video will not load.');
  
  GenerateMessage('Help', 'Play Dummy Video to Stop Current Playback');
end;

procedure TFormVideoPreviewSettings.LabelVideoPreviewAutoPlayHelpMouseEnter(
  Sender: TObject);
begin
  TShadowLabel(Sender).Font.Color:= clBlue;
  TShadowLabel(Sender).Font.Style:= [fsUnderline];
end;

procedure TFormVideoPreviewSettings.LabelVideoPreviewAutoPlayHelpMouseLeave(
  Sender: TObject);
begin
  TShadowLabel(Sender).Font.Color:= clNavy;
  TShadowLabel(Sender).Font.Style:= [];
end;

procedure TFormVideoPreviewSettings.ButtonVideoPreviewHelpClick(
  Sender: TObject);
begin
  CallMessageBox;
  FormMain.AddMsgText('    It''s very simple and easy to setup. First, get a media player of your choice. I use and recommend the awesome ');
  FormMain.AddMsgText('Media Player Classic Home Cinema ', clBlack, [fsBold]);
  FormMain.AddMsgText('http://mpc-hc.org', MsgTxtColors.colorFileName);
  FormMain.AddMsgText(' (small RAM footprint and portable). Make sure to enable ');
  FormMain.AddMsgText('Store settings to .ini file', MsgTxtColors.colorWarning, [fsItalic]);
  FormMain.AddMsgText(' option in MPC Home Cinema for maximum customization. '+
                      #13#10+#13#10+'    Select the ');
  FormMain.AddMsgText('executable', clBlack, [fsBold]);
  FormMain.AddMsgText(' file. Parameters will be loaded automatically if defined in ');
  FormMain.AddMsgText('\ini_files\videopreview.ini', MsgTxtColors.colorFileName, [fsBold]);
  FormMain.AddMsgText('. If not, type the proper switches to play, and if possible, auto-close when playback is done.'+//#13#10+
                      ' You can also use a ');
  FormMain.AddMsgText('batch', clBlack, [fsBold]);
  FormMain.AddMsgText(' file but extra parameters are not supported.'+#13#10+#13#10+
                      '    The ');//FormMain.AddMsgText('    The ', MsgTxtColors.colorWarning, [fsBold]);
  FormMain.AddMsgText('%1', MsgTxtColors.colorFileName, [fsBold]);
  FormMain.AddMsgText(' tag is required for the video/audio filename. Surrounding quotes are not required.', MsgTxtColors.colorWarning, [fsBold]);
  FormMain.AddMsgText(#13#10+#13#10+'    Select a ');
  FormMain.AddMsgText('system', MsgTxtColors.colorFileName, [fsBold]);
  FormMain.AddMsgText(' and the ');
  FormMain.AddMsgText('folder', MsgTxtColors.colorFileName, [fsBold]);
  FormMain.AddMsgText(' where video/audio files are. Recursive folder scan is NOT supported.');
  FormMain.AddMsgText(#13#10+'    Check ');
  FormMain.AddMsgText('Play Video Enabled', MsgTxtColors.colorFileName, [fsBold]);
  FormMain.AddMsgText(' setting. Uncheck it if you want to disable this feature completely.'+
                      #13#10+'    Check ');
  FormMain.AddMsgText('Parent Game Video', MsgTxtColors.colorFileName, [fsBold]);
  FormMain.AddMsgText(' setting for clone games, to play videos of parent games (MAME and arcade only).'+#13#10+'    Check ');
  FormMain.AddMsgText('Play Dummy Video to Stop Current Playback', MsgTxtColors.colorFileName, [fsBold]);
  FormMain.AddMsgText(' setting to enforce playback of a short video file on a new selected game that doesn''t have a video file.'+
                      #13#10+'    The ');
  FormMain.AddMsgText('AutoPlay', MsgTxtColors.colorFileName, [fsBold]);
  FormMain.AddMsgText(' setting play videos automatically when selecting games. Disabled by default for safety reasons (click the help ');
  FormMain.AddMsgText('?', MsgTxtColors.colorFileName, [fsItalic]);
  FormMain.AddMsgText(' button for more details).'+#13#10+#13#10+
                      '    The setting ');
  FormMain.AddMsgText('Play Dummy Video to Stop Current Playback', clBlack, [fsBold]);
  FormMain.AddMsgText(' exists because there is no way for the frontend to "terminate" the running media player application.'+#13#10+#13#10+
                      '    If ');
  FormMain.AddMsgText('AutoPlay', clBlack, [fsBold]);
  FormMain.AddMsgText(' is disabled, you can play videos manually with ');
  FormMain.AddMsgText('Shift+V', MsgTxtColors.colorFileName, [fsBold]);
  FormMain.AddMsgText(' shortcut or ');
  FormMain.AddMsgText('Play Video Preview', MsgTxtColors.colorFileName, [fsBold]);
  FormMain.AddMsgText(' in images tool bar buttons / games popup menu. There''s a button assigned for arcade controllers as well.');

  GenerateMessage('Help', 'How to watch game video previews.');
end;

procedure TFormVideoPreviewSettings.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if CanClose then
     begin
       if ModalResult = mrOk then
          begin
            UpdateSettingsVars;
            FormMain.UpdateVideoPreviewIni;
            FormMain.SetVideoPreviewState;
          end;
     end;
end;

procedure TFormVideoPreviewSettings.FormShow(Sender: TObject);
begin
  FormMain.ELV_FindSelectedSystemMulti(SystemsVideoPreview, FormMain.SelectedEasyItem); //FormMain.ELV_SelectItem(SystemsVideoPreview, 0);
  SystemsVideoPreview.SetFocus;
  Tag:= 0;
end;

procedure TFormVideoPreviewSettings.FormCreate(Sender: TObject);
var
  Loop: Integer;
begin
  Tag:= 1;
  FormMain.LoadSystemsIcons(IL_Systems, False);
  FormMain.LoadNonArcadeSystemIcons(IL_Systems, False, False);

  FormMain.ELV_ResetNormalColors(SystemsVideoPreview);
  if IsNightMode then
     FormMain.ELV_SetNightModeColors(SystemsVideoPreview);
  LabelSystemTitle.Caption:= '';

  for Loop:= 1 to MaxArcadeSystems do //Low(FormMain.ArcadeVideoPreviewDir) to High(FormMain.ArcadeVideoPreviewDir) do
      temp_ArcadeVideoPreviewDir[Loop]:= FormMain.ArcadeVideoPreviewDir[Loop];

  for Loop:= 1 to MaxConsoleComputerSystems do // Low(FormMain.ConsoleComputerVideoPreviewDir) to High(FormMain.ConsoleComputerVideoPreviewDir) do
      temp_ConsoleComputerVideoPreviewDir[Loop]:= FormMain.ConsoleComputerVideoPreviewDir[Loop];

  FormMain.ELV_PopulateSystemsMulti(SystemsVideoPreview, 1, False, True, True); // MAME/arcade/console/computer systems
  //FormMain.ELV_PopulateSystems(SystemsVideoPreview, True, True, 1);
  //SystemsVideoPreview.Items.Items[1].Caption:= 'Supmod3l';
  //SystemsVideoPreview.Items.Items[6].Caption:= 'Model 2';
end;

procedure TFormVideoPreviewSettings.ButtonResetVideoPreviewDummyVideoParametersClick(
  Sender: TObject);
begin
  VideoPreviewDummyVideoParameters.Text:= FormMain.VideoPreviewDummyVideoParameters;
end;

procedure TFormVideoPreviewSettings.ButtonResetVideoPreviewMediaPlayerParametersClick(
  Sender: TObject);
begin
  VideoPreviewMediaPlayerParameters.Text:= FormMain.VideoPreviewMediaPlayerParameters;
end;

procedure TFormVideoPreviewSettings.ButtonVideoPreviewAutoPlayHelpClick(
  Sender: TObject);
begin
  CallMessageBox;
  FormMain.AddMsgText('    This option play videos automatically when selecting games but, depending on how '+
                      'you setup the media player, it might crash the frontend or even Windows if you select different games while a '+
                      'video is playing.'+#13#10+#13#10+
                      '    I recommend using this setting only if you don''t want to start the video manually. '+
                      'With it enabled, after loading the video the active and focused application will be the media player.'+#13#10+
                      'I recommend using a hot-key to close the media player manually so you won''t have to close it using the mouse.'+#13#10#13#10+
                      'Remember that you can start a video by:'+#13#10);
  FormMain.AddMsgText('Shift-V', MsgTxtColors.colorFileName, [fsBold]);
  FormMain.AddMsgText(' shortcut'+#13#10);
  FormMain.AddMsgText('Play Video Preview', MsgTxtColors.colorFileName, [fsBold]);
  FormMain.AddMsgText(' button in images tool bar buttons'+#13#10);
  FormMain.AddMsgText('Play Video Preview', MsgTxtColors.colorFileName, [fsBold]);
  FormMain.AddMsgText(' menu option in games popup menu (mouse right click)'+#13#10+
                      'If browsing games with an arcade controller, there''s a button assigned for this task.');
  GenerateMessage('Info', 'AutoPlay video previews.');
end;

procedure TFormVideoPreviewSettings.ButtonResetVideoPreviewFolderClick(
  Sender: TObject);
begin
  if FormMain.CheckSelected(SystemsVideoPreview) then
     begin
       if FormMain.ELV_IsArcadeSystemSelected(SystemsVideoPreview) then
          VideoPreviewFolder.Text:= FormMain.ArcadeVideoPreviewDir[SystemsVideoPreview.Tag]
       else
          VideoPreviewFolder.Text:= FormMain.ConsoleComputerVideoPreviewDir[SystemsVideoPreview.Tag];
     end;
end;

procedure TFormVideoPreviewSettings.SystemsVideoPreviewItemPaintText(
  Sender: TCustomEasyListview; Item: TEasyItem; Position: Integer;
  ACanvas: TCanvas);
begin
  FormMain.ELV_SetGhostedIconText(Item, SystemsVideoPreview, ACanvas);
end;


end.
