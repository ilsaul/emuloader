program EmuLoader;





uses
  Forms,
  uMain in 'uMain.pas' {FormMain},
  uPreferences in 'uPreferences.pas' {FormPreferences},
  uStatus in 'uStatus.pas' {FormStatus},
  uEmulatorsSetup in 'uEmulatorsSetup.pas' {FormEmulatorsSetup},
  uMAMEKeysInfo in 'uMAMEKeysInfo.pas' {FormMAMEKeysInfo},
  uFavoriteUsersManager in 'uFavoriteUsersManager.pas' {FormFavoriteUsersManager},
  uAuditGames in 'uAuditGames.pas' {FormAudit},
  uDOSMAMECustomConfig in 'uDOSMAMECustomConfig.pas' {FormDOSMAMECustomConfiguration},
  uAbout in 'uAbout.pas' {FormAbout},
  uTextFilesViewer in 'uTextFilesViewer.pas' {FormTextViewer},
  uDATViewer in 'uDATViewer.pas' {FormDATViewer},
  uGamesListLegend in 'uGamesListLegend.pas' {FormGamesListLegend},
  uCustomGames in 'uCustomGames.pas' {FormCustomGames},
  uMessages in 'uMessages.pas' {FormMessages},
  uGameInfo in 'uGameInfo.pas' {FormGameInfo},
  uMAMEConfig in 'uMAMEConfig.pas' {FormMAMEConfiguration},
  uDOSMAMEConfig in 'uDOSMAMEConfig.pas' {FormDOSMAMEConfiguration},
  uMAMECustomConfig in 'uMAMECustomConfig.pas' {FormMAMECustomConfiguration},
  uGameColumns in 'uGameColumns.pas' {FormFilterGameColumns},
  uParentalLockPasswordLogout in 'uParentalLockPasswordLogout.pas' {FormParentalLockPasswordLogout},
  uParentalLockManager in 'uParentalLockManager.pas' {FormParentalLockManager},
  uCommon in 'uCommon.pas',
  uUserProfileUserLogin in 'uUserProfileUserLogin.pas' {FormUserProfileUserLogin},
  uUserProfileEditor in 'uUserProfileEditor.pas' {FormUserProfileEditor},
  uLanguage in 'uLanguage.pas' {FormLanguage},
  uFilesUtil in 'uFilesUtil.pas',
  uCustomCommandLine in 'uCustomCommandLine.pas' {FormCustomCommandLine},
  uCustomGameDescription in 'uCustomGameDescription.pas' {FormCustomGameDescription},
  uCustomGameCategory in 'uCustomGameCategory.pas' {FormCustomGameCategory},
  uCustomGamesSelector in 'uCustomGamesSelector.pas' {FormCustomGameSelector};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := 'Emu Loader - Powerful M.A.M.E. Frontend';
  Application.CreateForm(TFormMain, FormMain);
  Application.CreateForm(TFormStatus, FormStatus);
  Application.CreateForm(TFormPreferences, FormPreferences);
  Application.Run;
end.
