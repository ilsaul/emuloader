program EmuLoader;





uses
  Forms,
  uMain in 'uMain.pas' {FormMain},
  uPreferences in 'uPreferences.pas' {FormPreferences},
  uStatus in 'uStatus.pas' {FormStatus},
  uEmulatorsSetup in 'uEmulatorsSetup.pas' {FormEmulatorsSetup},
  uFavoriteUsersManager in 'uFavoriteUsersManager.pas' {FormFavoriteUsersManager},
  uAuditGames in 'uAuditGames.pas' {FormAudit},
  uAbout in 'uAbout.pas' {FormAbout},
  uDATViewer in 'uDATViewer.pas' {FormDATViewer},
  uGamesListLegend in 'uGamesListLegend.pas' {FormGamesListLegend},
  uMessages in 'uMessages.pas' {FormMessages},
  uGameInfo in 'uGameInfo.pas' {FormGameInfo},
  uMAMEConfig in 'uMAMEConfig.pas' {FormMAMEConfiguration},
  uGameColumns in 'uGameColumns.pas' {FormFilterGameColumns},
  uParentalLockPasswordLogout in 'uParentalLockPasswordLogout.pas' {FormParentalLockPasswordLogout},
  uParentalLockEditor in 'uParentalLockEditor.pas' {FormParentalLockEditor},
  uCommon in 'uCommon.pas',
  uUserProfileUserLogin in 'uUserProfileUserLogin.pas' {FormUserProfileUserLogin},
  uUserProfileEditor in 'uUserProfileEditor.pas' {FormUserProfileEditor},
  uFilesUtil in 'uFilesUtil.pas',
  uCustomCommandLine in 'uCustomCommandLine.pas' {FormCustomCommandLine},
  uCustomGameDescription in 'uCustomGameDescription.pas' {FormCustomGameDescription},
  uCustomGameCategory in 'uCustomGameCategory.pas' {FormCustomGameCategory};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := 'Emu Loader - Powerful M.A.M.E. Frontend';
  Application.CreateForm(TFormMain, FormMain);
  Application.CreateForm(TFormStatus, FormStatus);
  Application.CreateForm(TFormPreferences, FormPreferences);
  Application.Run;
end.
