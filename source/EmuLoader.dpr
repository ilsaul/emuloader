program EmuLoader;

uses
  FastMM4,
  SynFastWideString,
  madExcept,
  Forms,
  VersionHelpers,
  uCommon in 'uCommon.pas',
  uStatus in 'uStatus.pas' {FormStatus},
  uMain in 'uMain.pas' {FormMain},
  uPreferences in 'uPreferences.pas' {FormPreferences},
  uArcadeEmulatorsSetup in 'arcade\uArcadeEmulatorsSetup.pas' {FormArcadeEmulatorsSetup},
  uAbout in 'uAbout.pas' {FormAbout},
  uGameDetails in 'uGameDetails.pas' {FormGameDetails},
  uColumnsEditor in 'uColumnsEditor.pas' {FormColumnsEditor},
  uZiNcSettings in 'arcade\uZiNcSettings.pas' {FormZiNcSettings},
  uToolBarEditor in 'uToolBarEditor.pas' {FormToolBarEditor},
  uMessageBox in 'uMessageBox.pas' {FormMessageBox},
  uControllerKeysLayout in 'uControllerKeysLayout.pas' {FormControllerKeysLayout},
  uArcadeGamesFilter in 'arcade\uArcadeGamesFilter.pas' {FormArcadeGamesFilter},
  uMAMESettings in 'arcade\uMAMESettings.pas' {FormMAMESettings},
  uDeleteMultipleGamesFiles in 'uDeleteMultipleGamesFiles.pas' {FormDeleteMultipleGamesFiles},
  uArcadeSelectSystem in 'arcade\uArcadeSelectSystem.pas' {FormArcadeSelectSystem},
  uArcadeScanAudioSamples in 'arcade\uArcadeScanAudioSamples.pas' {FormArcadeScanAudioSamples},
  uArcadeScanGamesResults in 'arcade\uArcadeScanGamesResults.pas' {FormArcadeScanGamesResults},
  uImageLayoutSettings in 'uImageLayoutSettings.pas' {FormImageLayoutSettings},
  uThumbnailViewSettings in 'uThumbnailViewSettings.pas' {FormThumbnailViewSettings},
  uSelectDirectory in 'uSelectDirectory.pas' {FormSelectDirectory},
  uArcadeROMsFolders in 'arcade\uArcadeROMsFolders.pas' {FormArcadeROMsFolders},
  uGamesListFontSettings in 'uGamesListFontSettings.pas' {FormGamesListFontSettings},
  uImagesDeleteClones in 'arcade\uImagesDeleteClones.pas' {FormImagesDeleteClones},
  uArcadeMAMu_ExcludedList in 'arcade\uArcadeMAMu_ExcludedList.pas' {FormArcadeMAMu_ExcludedList},
  uDeleteGameFiles in 'uDeleteGameFiles.pas' {FormDeleteGameFiles},
  uArcadeFiltersGamesExtra in 'arcade\uArcadeFiltersGamesExtra.pas' {FormArcadeFiltersExtra},
  uArcadeMAMu_IconsManager in 'arcade\uArcadeMAMu_IconsManager.pas' {FormArcadeMAMu_IconsManager},
  uImagesManager in 'uImagesManager.pas' {FormImagesManager},
  uSupermodelSettings in 'arcade\uSupermodelSettings.pas' {FormSupermodelSettings},
  uArcadeMAMu_DeleteNotWorkingIcons in 'arcade\uArcadeMAMu_DeleteNotWorkingIcons.pas' {FormArcadeMAMu_DeleteNotWorkingIcons},
  uArcadeMAMu_SelectIconFile in 'arcade\uArcadeMAMu_SelectIconFile.pas' {FormArcadeMAMu_SelectIconFile},
  uImageDeleteRename in 'uImageDeleteRename.pas' {FormImageDeleteRename},
  uImageLayoutDimensions in 'uImageLayoutDimensions.pas' {FormImageLayoutDimensions},
  uDaphneSettings in 'arcade\uDaphneSettings.pas' {FormDaphneSettings},
  uDeleteMultipleGamesViewFiles in 'uDeleteMultipleGamesViewFiles.pas' {FormDeleteMultipleGamesViewFiles},
  uCopyMoveGameFiles in 'uCopyMoveGameFiles.pas' {FormCopyMoveGameFiles},
  uArcadeScanGamesMode in 'arcade\uArcadeScanGamesMode.pas' {FormArcadeScanGamesMode},
  uFavoritesManager in 'uFavoritesManager.pas' {FormFavoritesManager},
  uSEGAModel2EmulatorSettings in 'arcade\uSEGAModel2EmulatorSettings.pas' {FormSEGAModel2EmulatorSettings},
  uFiltersDriverStatus in 'arcade\uFiltersDriverStatus.pas' {FormArcadeFiltersDriverStatus},
  uArcadeMultiSlotGames in 'arcade\uArcadeMultiSlotGames.pas' {FormArcadeMultiSlotGames},
  uMAMESettings_SimpleMode in 'arcade\uMAMESettings_SimpleMode.pas' {FormMAMESettings_SimpleMode},
  uArcadeSoftwareListSelectMachineToRunGame in 'arcade\uArcadeSoftwareListSelectMachineToRunGame.pas' {FormArcadeSoftwareListMachineToRunGame},
  uArcadeSoftwareListCustomize in 'arcade\uArcadeSoftwareListCustomize.pas' {FormArcadeSoftwareListCustomize},
  uApplyFilterMsgBox in 'uApplyFilterMsgBox.pas' {FormApplyFilterMsgBox},
  uArcadeExportGamesList in 'arcade\uArcadeExportGamesList.pas' {FormArcadeExportGamesList},
  uArcadeRunExtraMAME in 'arcade\uArcadeRunExtraMAME.pas' {FormArcadeRunGameExtraMAME},
  uConsCompGamesEditor in 'console_computer\uConsCompGamesEditor.pas' {FormConsCompGamesEditor},
  uConsCompSystemsEditor in 'console_computer\uConsCompSystemsEditor.pas' {FormConsCompSystemsEditor},
  uConsCompGamesFolders in 'console_computer\uConsCompGamesFolders.pas' {FormConsCompGamesFolders},
  uCommonCustom in 'console_computer\uCommonCustom.pas',
  uConsCompEmulatorsSetup in 'console_computer\uConsCompEmulatorsSetup.pas' {FormConsCompEmulatorsSetup},
  uConsCompMultiFloppyGames in 'console_computer\uConsCompMultiFloppyGames.pas' {FormConsCompMultiFloppyGames},
  uConsCompSystemSelector in 'console_computer\uConsCompSystemSelector.pas' {FormConsCompSystemSelector},
  uConsCompSelectEmulator in 'console_computer\uConsCompSelectEmulator.pas' {FormConsCompSelectEmulator},
  uCleanInstallGuide in 'uCleanInstallGuide.pas' {FormCleanInstallGuide},
  uImageCategorySettings in 'uImageCategorySettings.pas' {FormImageCategorySettings},
  uVideoPreviewSettings in 'uVideoPreviewSettings.pas' {FormVideoPreviewSettings},
  uSelectFilterSystemMega in 'uSelectFilterSystemMega.pas' {FormSelectFilterSystemMega},
  uLastPlayedGames in 'uLastPlayedGames.pas' {FormLastPlayedGames},
  uSelectFile in 'arcade\uSelectFile.pas' {FormSelectFile},
  uConsCompSystemRules in 'console_computer\uConsCompSystemRules.pas' {FormConsCompSystemRules},
  uSelectFilterSystemSimple in 'uSelectFilterSystemSimple.pas' {FormSelectFilterSystemSimple},
  uImageLayoutSelector in 'uImageLayoutSelector.pas' {FormImageLayoutSelector},
  uImageCategorySelector in 'uImageCategorySelector.pas' {FormImageCategorySelector},
  uArcadeFileVersionsLarge in 'arcade\uArcadeFileVersionsLarge.pas' {FormArcadeFileVersionsLarge},
  uArcadeMAMEMachinesCustomize in 'arcade\uArcadeMAMEMachinesCustomize.pas' {FormArcadeMAMEMachinesCustomize},
  uFavoritesManagerCleanseProfile in 'uFavoritesManagerCleanseProfile.pas' {FormFavoritesManagerCleanseProfile},
  uNightMode in 'uNightMode.pas' {FormNightMode},
  uMessageBox_4K in '4K\uMessageBox_4K.pas' {FormMessageBox4K},
  uZTestWorkbench in 'uZTestWorkbench.pas' {FormZTestWorkbench},
  uCustomParameters in 'arcade\uCustomParameters.pas' {FormCustomParameters},
  uColorPickerEx in 'uColorPickerEx.pas' {FormColorPickerEx};

{$R EmuLoader.res}

begin
  if not IsWindowsVistaOrGreater then
     begin
       //MB_ICONWARNING = MB_ICONEXCLAMATION = $00000030;
       Application.MessageBox(PChar('This operating system is not supported!'+#13#10+
                              'Please use Windows Vista or newer. Aborting...'), 'Emu Loader', $00000030);

       Exit;
     end;

  if CheckAppOneInstance then
     Exit;

  IsNightMode:= True;
  Is4KMode:= Read4KSetting; // validates 4K resolution and read setting from "EmuLoader.ini", if found; also sets "FrontendPath:= ExtractFilePath(Application.ExeName);"
  FrontendVersion:= 'v'+GetFileInfo2(Application.ExeName, VersionInfo[3]);
  if PosEx('.0.0', FrontendVersion) = 0 then
     Delete(FrontendVersion, Length(FrontendVersion)-1, 2)
  else
     Delete(FrontendVersion, Length(FrontendVersion)-3, 4);

  //CreateSplashIniFile;       // remove splash settings from "ini_files\lightmode.ini" [Splash] section and create "ini_files\splash.ini"
  //CreateGamesFiltersIniFile; // remove tool bar filters settings from "emuloader.ini" and create "ini_files\games_filters.ini"
  // -> these functions will be removed in a future version

  //HideAppFormTaskBarButton2; // this is to show a secondary task bar button for forms

  FormStatus:= TFormStatus.Create(nil); // create splash screen here to show as soon as possible: "this is not the app's main Form you're looking for!" (May 01, 2021)
  //FormStatus.Caption:= FormStatus.Caption+' '+FrontendVersion;
  FormStatus.LabelVersion.Caption:= FrontendVersion;
  FormStatus.TitleStr('Initializing');
  FormStatus.MessageStr('Loading primary settings.', False);

  FormStatus.StartThreadClock;
  FormStatus.Visible:= True;// Show;

  Application.ProcessMessages;
  FormApplyFilterMsgBox:= TFormApplyFilterMsgBox.Create(nil); // creating this Form here forces splash screen to show up... why Delphi 7, WHY!!!? (May 21, 2021)
  Application.Initialize;

  Application.Title := 'Emu Loader: Multiple Systems Frontend';
  Application.HintPause:= 200; // fix for the hint pause timer
  Application.HintColor:= $00f8f4f3; //$00eeebe6;

  FormStatus.MessageStr('Initializing main screen.');
  Application.CreateForm(TFormMain, FormMain); // application's main form
  FormMain.Caption:= FormMain.Caption+' '+FrontendVersion;

  FormStatus.MessageStr('Initializing night mode screen.');
  Application.CreateForm(TFormNightMode, FormNightMode);
  FormStatus.MessageStr('Initializing preferences screen.');
  Application.CreateForm(TFormPreferences, FormPreferences);
  Application.Run;
end.

