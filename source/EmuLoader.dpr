program EmuLoader;

uses
  FastMM4,
  SynFastWideString,
  madExcept,
  Forms,
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
  uThumbnailViewSettings in 'uThumbnailViewSettings.pas' {FormThumbnailView},
  uArcadeFileVersions in 'arcade\uArcadeFileVersions.pas' {FormArcadeFileVersions},
  uSelectDirectory in 'uSelectDirectory.pas' {FormSelectDirectory},
  uArcadeROMsFolders in 'arcade\uArcadeROMsFolders.pas' {FormArcadeROMsFolders},
  uGamesListFontSettings in 'uGamesListFontSettings.pas' {FormGamesListFontSettings},
  uArcadeDeleteCloneImages in 'arcade\uArcadeDeleteCloneImages.pas' {FormArcadeDeleteCloneImages},
  uArcadeMAMu_ExcludedList in 'arcade\uArcadeMAMu_ExcludedList.pas' {FormArcadeMAMu_ExcludedList},
  uDeleteGamesFiles in 'uDeleteGamesFiles.pas' {FormDeleteGamesFiles},
  uArcadeFiltersGamesExtra in 'arcade\uArcadeFiltersGamesExtra.pas' {FormArcadeFiltersExtra},
  uArcadeMAMu_IconsManager in 'arcade\uArcadeMAMu_IconsManager.pas' {FormArcadeMAMu_IconsManager},
  uRenameIconFile in 'uRenameIconFile.pas' {FormRenameIconFile},
  uImagesManager in 'uImagesManager.pas' {FormImagesManager},
  uRenameImageFile in 'uRenameImageFile.pas' {FormRenameImageFile},
  uSupermodelSettings in 'arcade\uSupermodelSettings.pas' {FormSupermodelSettings},
  uArcadeDeleteMAMu_NotWorkingIcons in 'arcade\uArcadeDeleteMAMu_NotWorkingIcons.pas' {FormArcadeDeleteMAMu_NotWorkingIcons},
  uArcadeSelectIconFile in 'arcade\uArcadeSelectIconFile.pas' {FormArcadeSelectIconFile},
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
  uCustomCommandLine in 'uCustomCommandLine.pas' {FormCustomCommandLine},
  uCleanInstallGuide in 'uCleanInstallGuide.pas' {FormCleanInstallGuide},
  uImageCategorySettings in 'uImageCategorySettings.pas' {FormImageCategorySettings},
  uVideoPreviewSettings in 'uVideoPreviewSettings.pas' {FormVideoPreviewSettings},
  uSelectFilterSystemMega in 'uSelectFilterSystemMega.pas' {FormSelectFilterSystemMega},
  uLastPlayedGamesMega in 'uLastPlayedGamesMega.pas' {FormLastPlayedGamesMega},
  uSelectFile in 'uSelectFile.pas' {FormSelectFile},
  uConsCompSystemRules in 'console_computer\uConsCompSystemRules.pas' {FormConsCompSystemRules},
  uSelectFilterSystemSimple in 'uSelectFilterSystemSimple.pas' {FormSelectFilterSystemSimple},
  uImageLayoutSelector in 'uImageLayoutSelector.pas' {FormImageLayoutSelector},
  uImageCategorySelector in 'uImageCategorySelector.pas' {FormImageCategorySelector},
  uArcadeFileVersionsLarge in 'arcade\uArcadeFileVersionsLarge.pas' {FormArcadeFileVersionsLarge};

{$R *.RES}

begin
  if CheckAppOneInstance then
     Exit;
  Application.Initialize;
  Application.Title := 'Emu Loader: Multiple Systems Frontend';
  Application.HintPause:= 200; // fix for the hint pause... :_(
  Application.HintColor:= $00f8f4f3;//$00EEEBE6;
  Application.CreateForm(TFormMain, FormMain);
  Application.CreateForm(TFormPreferences, FormPreferences);
  Application.Run;
end.

