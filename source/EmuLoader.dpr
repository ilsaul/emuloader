program EmuLoader;

uses
  FastMM4,
  madExcept,
  Forms,
  uCommon in 'uCommon.pas',
  uStatus in 'uStatus.pas' {FormStatus},
  uMain in 'uMain.pas' {FormMain},
  uPreferences in 'uPreferences.pas' {FormPreferences},
  uEmulatorsSetup in 'uEmulatorsSetup.pas' {FormEmulatorsSetup},
  uAbout in 'uAbout.pas' {FormAbout},
  uGameDetails in 'uGameDetails.pas' {FormGameDetails},
  uColumnsEditor in 'uColumnsEditor.pas' {FormColumnsEditor},
  uZiNcSettings in 'uZiNcSettings.pas' {FormZiNcSettings},
  uToolBarEditor in 'uToolBarEditor.pas' {FormToolBarEditor},
  uMessageBox in 'uMessageBox.pas' {FormMessageBox},
  uControllerKeysLayout in 'uControllerKeysLayout.pas' {FormControllerKeysLayout},
  uArcadeGamesFilter in 'uArcadeGamesFilter.pas' {FormArcadeGamesFilter},
  uSelectFile in 'uSelectFile.pas' {FormSelectFile},
  uMAMESettings in 'uMAMESettings.pas' {FormMAMESettings},
  uDeleteMultipleGamesFiles in 'uDeleteMultipleGamesFiles.pas' {FormDeleteMultipleGamesFiles},
  uSelectSystem in 'uSelectSystem.pas' {FormSelectSystem},
  uScanAudioSamples in 'uScanAudioSamples.pas' {FormScanAudioSamples},
  uScanResults in 'uScanResults.pas' {FormScanResults},
  uCategoriesLayoutsSettings in 'uCategoriesLayoutsSettings.pas' {FormCategoryLayoutSettings},
  uThumbnailViewSettings in 'uThumbnailViewSettings.pas' {FormThumbnailView},
  uSelectImageCategory in 'uSelectImageCategory.pas' {FormSelectImageCategory},
  uFileVersions in 'uFileVersions.pas' {FormFileVersions},
  uSelectDirectory in 'uSelectDirectory.pas' {FormSelectDirectory},
  uZipFilesNotUsed in 'uZipFilesNotUsed.pas' {FormZipFilesNotUsed},
  uROMsFolders in 'uROMsFolders.pas' {FormROMsFolders},
  uGamesListFontSettings in 'uGamesListFontSettings.pas' {FormGamesListFontSettings},
  uDeleteCloneImages in 'uDeleteCloneImages.pas' {FormDeleteCloneImages},
  uMAMu_ExcludedList in 'uMAMu_ExcludedList.pas' {FormMAMu_ExcludedList},
  uDeleteGamesFiles in 'uDeleteGamesFiles.pas' {FormDeleteGamesFiles},
  uFiltersGamesExtra in 'uFiltersGamesExtra.pas' {FormFiltersExtra},
  uMAMu_IconsManager in 'uMAMu_IconsManager.pas' {FormMAMu_IconsManager},
  uRenameIconFile in 'uRenameIconFile.pas' {FormRenameIconFile},
  uImagesManager in 'uImagesManager.pas' {FormImagesManager},
  uRenameImageFile in 'uRenameImageFile.pas' {FormRenameImageFile},
  uSupermodelSettings in 'uSupermodelSettings.pas' {FormSupermodelSettings},
  uDeleteMAMu_NotWorkingIcons in 'uDeleteMAMu_NotWorkingIcons.pas' {FormDeleteMAMu_NotWorkingIcons},
  uSelectIconFile in 'uSelectIconFile.pas' {FormSelectIconFile},
  uImageDeleteRename in 'uImageDeleteRename.pas' {FormImageDeleteRename},
  uLayoutDimensions in 'uLayoutDimensions.pas' {FormLayoutDimensions},
  uDaphneSettings in 'uDaphneSettings.pas' {FormDaphneSettings},
  uDeleteMultipleGamesViewFiles in 'uDeleteMultipleGamesViewFiles.pas' {FormDeleteMultipleGamesViewFiles},
  uCopyMoveGameFiles in 'uCopyMoveGameFiles.pas' {FormCopyMoveGameFiles},
  uSelectFilterSystem in 'uSelectFilterSystem.pas' {FormSelectFilterSystem},
  uScanGamesMode in 'uScanGamesMode.pas' {FormScanGamesMode},
  uFavoritesManager in 'uFavoritesManager.pas' {FormFavoritesManager},
  uSEGAModel2EmulatorSettings in 'uSEGAModel2EmulatorSettings.pas' {FormSEGAModel2EmulatorSettings},
  uFiltersDriverStatus in 'uFiltersDriverStatus.pas' {FormFiltersDriverStatus},
  uMultiSlotGames in 'uMultiSlotGames.pas' {FormMultiSlotGames},
  uMAMESettings_SimpleMode in 'uMAMESettings_SimpleMode.pas' {FormMAMESettings_SimpleMode};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := 'Emu Loader: Arcade Emulator Frontend';
  Application.HintPause:= 200; // fix for the hint pause... :_(
  Application.HintColor:= $00f8f4f3;//$00EEEBE6;
  Application.CreateForm(TFormMain, FormMain);
  Application.CreateForm(TFormPreferences, FormPreferences);
  Application.CreateForm(TFormMAMESettings_SimpleMode, FormMAMESettings_SimpleMode);
  Application.Run;
end.
