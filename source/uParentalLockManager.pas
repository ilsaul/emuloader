unit uParentalLockManager;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  ExtCtrls, StdCtrls, ComCtrls, ImgList, IniFiles, Menus,
  GR32_Image, uGR32Extra;

type
  TFormParentalLockManager = class(TForm)
    ParentalLockImageList: TImageList;
    PopupMenuGamesFound: TPopupMenu;
    PopupPlayGameStandard: TMenuItem;
    PageControlLockOptions: TPageControl;
    TabSheetSearchGames: TTabSheet;
    LabelSearchKeywordsList: TLabel;
    LabelEnterKeyword: TLabel;
    LabelGamesFound: TLabel;
    LabelTotalGamesProtect: TLabel;
    SearchKeywords: TListBox;
    Keyword: TEdit;
    GamesFoundList: TListView;
    ButtonDeleteSelectedKeywords: TButton;
    ButtonBeginSearch: TButton;
    ButtonAddKeyword: TButton;
    ButtonDeleteSelectedGamesFound: TButton;
    ButtonAddGames: TButton;
    TabSheetLockedGamesList: TTabSheet;
    LabelTotalGamesLocked: TLabel;
    ButtonDeleteSelectedLockedGames: TButton;
    ButtonOk: TButton;
    ButtonCancel: TButton;
    ButtonPassword: TButton;
    ButtonReadLockGamesDAT: TButton;
    BlockedList: TListView;
    ParentalLockImage: TImage32Ex;
    procedure ButtonCancelClick(Sender: TObject);
    procedure ButtonOkClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure SearchKeywordsKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BlockedListKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ButtonAddGamesClick(Sender: TObject);
    procedure ButtonAddKeywordClick(Sender: TObject);
    procedure ButtonDeleteSelectedKeywordsClick(Sender: TObject);
    procedure ButtonReadLockGamesDATClick(Sender: TObject);
    procedure GamesFoundListKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ButtonBeginSearchClick(Sender: TObject);
    procedure KeywordKeyPress(Sender: TObject; var Key: Char);
    procedure ButtonDeleteSelectedGamesFoundClick(Sender: TObject);
    procedure ButtonDeleteSelectedLockedGamesClick(Sender: TObject);
    procedure ButtonPasswordClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure PopupPlayGameStandardClick(Sender: TObject);
  private
    ProtectedListChanged: Boolean;
    function  LoadToolbarIcons: Boolean;
    procedure ReadLockedGamesDAT;
    procedure AddGamesToProtectedList;
    procedure UpdateLockGamesList;
    { Private declarations }
  public
    HaveProtectedGames: Boolean;
    { Public declarations }
  end;

var
  FormParentalLockManager: TFormParentalLockManager;

implementation

uses uMain, uStatus, uParentalLockPasswordLogout, uPreferences, uCommon,
     uFilesUtil;

{$R *.dfm}

function TFormParentalLockManager.LoadToolbarIcons: Boolean;
begin
  Result:= ((FileExists(FormMain.FrontendPath+'resources\images\toolbars\ParentalLock\0.ico')) and
            (FileExists(FormMain.FrontendPath+'resources\images\toolbars\ParentalLock\0.ico'))  and
            (FileExists(FormMain.FrontendPath+'resources\images\toolbars\Main\toolbar\25.ico')));

  if Result then
     begin
       FormMain.AddDefaultIcons('ParentalLock\0.ico', ParentalLockImageList, 1, False);
       FormMain.AddDefaultIcons('ParentalLock\1.ico', ParentalLockImageList, 1, False);
       FormMain.AddDefaultIcons('Main\toolbar\25.ico', ParentalLockImageList, 1, False);
     end;
end;

procedure TFormParentalLockManager.ReadLockedGamesDAT;
var
  LockedGamesDAT, GamesListDAT: THashedStringList;
  Loop: Integer;
begin
  if FileExists(FormMain.FrontendPath+'resources\BlockedGames.dat') then
     begin
       if HaveProtectedGames then
          begin
            LockedGamesDAT:= THashedStringList.Create;
            LockedGamesDAT.LoadFromFile(FormMain.FrontendPath+'resources\BlockedGames.dat');
            if LockedGamesDAT.Count > 0 then
               begin
                 BlockedList.Items.BeginUpdate;
                 BlockedList.Items.Clear;
                 BlockedList.Items.EndUpdate;
               end;
            GamesListDAT:= THashedStringList.Create;
            GetGamesList(GamesListDAT, True, True);
            BlockedList.Items.BeginUpdate;
            for Loop:=0 to LockedGamesDAT.Count -1 do
            begin
              LockedGamesDAT[Loop]:= DecryptData(LockedGamesDAT[Loop]);
            end;
            for Loop:=0 to GamesListDAT.Count -1 do
            begin
              FormMain.GetROMFields(GamesListDAT[Loop]);
              if LockedGamesDAT.IndexOf(LowerCase(FormMain.mName)) <> -1 then
                 begin
                   with BlockedList.Items.Add do
                     begin
                       Caption:=FormMain.mDescription;
                       SubItems.Add(FormMain.mName);
                       SubItems.Add(FormMain.mClone);
                       SubItems.Add(FormMain.mCategory);
                     end;
                 end;
            end;
            BlockedList.Items.EndUpdate;
            BlockedList.SortType:=stBoth;
            BlockedList.SortType:=stNone;

            FreeAndNil(LockedGamesDAT);
            FreeAndNil(GamesListDAT);
          end;
     end;
end;

procedure TFormParentalLockManager.AddGamesToProtectedList;
var
  Loop, Loop2: Integer;
  GameFound: Boolean;
begin
  if GamesFoundList.Items.Count > 0 then
     begin
       Screen.Cursor:= crHourGlass;
       BlockedList.Items.BeginUpdate;
       if BlockedList.Items.Count > 0 then
          begin
            for Loop:=0 to GamesFoundList.Items.Count -1 do
              begin
                GameFound:= False;
                for Loop2:=0 to BlockedList.Items.Count -1 do
                begin
                  if ((BlockedList.Items[Loop2].Caption = GamesFoundList.Items[Loop].Caption) and
                      (BlockedList.Items[Loop2].SubItems[0] = GamesFoundList.Items[Loop].SubItems[0]) and
                      (BlockedList.Items[Loop2].SubItems[1] = GamesFoundList.Items[Loop].SubItems[1]) and
                      (BlockedList.Items[Loop2].SubItems[2] = GamesFoundList.Items[Loop].SubItems[2])) then
                     GameFound:= True;
                end;

                if not GameFound then
                   begin
                     with BlockedList.Items.Add do
                       begin
                         Caption:= GamesFoundList.Items[Loop].Caption;
                         SubItems.Add(GamesFoundList.Items[Loop].SubItems[0]);
                         SubItems.Add(GamesFoundList.Items[Loop].SubItems[1]);
                         SubItems.Add(GamesFoundList.Items[Loop].SubItems[2]);
                       end;
                   end;
              end;
          end
       else
          begin
            for Loop:=0 to GamesFoundList.Items.Count -1 do
              begin
                with BlockedList.Items.Add do
                  begin
                    Caption:= GamesFoundList.Items[Loop].Caption;
                    SubItems.Add(GamesFoundList.Items[Loop].SubItems[0]);
                    SubItems.Add(GamesFoundList.Items[Loop].SubItems[1]);
                    SubItems.Add(GamesFoundList.Items[Loop].SubItems[2]);
                  end;
              end;
          end;
       BlockedList.Items.EndUpdate;
       Screen.Cursor:= crDefault;
     end;
  LabelTotalGamesLocked.Caption:= Format(FormMain.GetLanguageText('Main', 'StatusBarShownGames', '%u Games'), [BlockedList.Items.Count]);
end;

procedure TFormParentalLockManager.UpdateLockGamesList;
var
  LockedGamesDAT: THashedStringList;
  Loop: Integer;
begin
  if BlockedList.Items.Count > 0 then
     begin
        LockedGamesDAT:= THashedStringList.Create;
        LockedGamesDAT.BeginUpdate;
        for Loop:=0 to BlockedList.Items.Count -1 do
        begin
          LockedGamesDAT.Add(EncryptData(BlockedList.Items[Loop].SubItems[0]));
        end;
        LockedGamesDAT.EndUpdate;

        LockedGamesDAT.SaveToFile(FormMain.FrontendPath+'resources\BlockedGames.dat');
        FreeAndNil(LockedGamesDAT);
     end
  else
     begin
       GenerateMessage(FormMain.GetLanguageText('Messages', 'NoGamesFoundTitle', 'No Games Found'),
                       FormMain.GetLanguageText('Messages', 'NoLockedGamesFoundMsg', 'There is no games on the locked list! You must select at least one game for this to work.'), 2);
     end;
end;

procedure TFormParentalLockManager.ButtonCancelClick(Sender: TObject);
begin
  case ProtectedListChanged of
    True:
      begin
        if GenerateMessage(FormMain.GetLanguageText('Messages', 'LockedGamesListChangedTitle', 'Games List Changed'),
                           FormMain.GetLanguageText('Messages', 'LockedGamesListChangedMsg', 'The locked games list has changed! Cancel the changes ?'), 1) = mrYes then
           begin
             FormMain.MenuParentalLock.Tag:= 1;
             Close;
           end;
      end;
    False:
      begin
        FormMain.MenuParentalLock.Tag:= 1;
        Close;
      end;
  end;
end;

procedure TFormParentalLockManager.ButtonOkClick(Sender: TObject);
begin
  if BlockedList.Items.Count = 0 then
     begin
       if FileExists(FormMain.FrontendPath+'resources\BlockedGames.dat') then
          DeleteFile(FormMain.FrontendPath+'resources\BlockedGames.dat');
       if FileExists(FormMain.FrontendPath+'ParentalLock.pwd') then
          DeleteFile(FormMain.FrontendPath+'ParentalLock.pwd');
       Close;
       Exit;
     end;
     
  case FileExists(FormMain.FrontendPath+'ParentalLock.pwd') of
    True:
      begin
        if GetFileSize(FormMain.FrontendPath+'ParentalLock.pwd') = 0 then
           ButtonPassword.OnClick(Self)
        else
           begin
             FormMain.ParentalLockPasswordString:= LoadParentalLockPassword;
             UpdateLockGamesList;
             FormMain.SetLockedGamesList(False);
             Close;
           end;
      end;
    False: ButtonPassword.OnClick(Self);
  end;
end;

procedure TFormParentalLockManager.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #27 then
     ButtonCancel.OnClick(Self);
end;

procedure TFormParentalLockManager.FormCreate(Sender: TObject);
var
  SysMenu: HMenu;
begin
  SysMenu:= GetSystemMenu(handle, False);
  EnableMenuItem(SysMenu, SC_CLOSE, MF_DISABLED or MF_GRAYED);

  // Load Icons
  FormMain.LoadIcon(ParentalLockImage, 'ParentalLock.png');
  LoadToolbarIcons;
end;

procedure TFormParentalLockManager.SearchKeywordsKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_DELETE then
     ButtonDeleteSelectedKeywords.OnClick(Self);
end;

procedure TFormParentalLockManager.BlockedListKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_DELETE then
     ButtonDeleteSelectedLockedGames.OnClick(Self);
end;

procedure TFormParentalLockManager.ButtonAddGamesClick(Sender: TObject);
begin
  AddGamesToProtectedList;
  TabSheetLockedGamesList.Show;
end;

procedure TFormParentalLockManager.ButtonAddKeywordClick(Sender: TObject);
begin
  if SearchKeywords.Items.IndexOf(LowerCase(Keyword.Text)) = -1 then
     begin
       SearchKeywords.Items.BeginUpdate;
       SearchKeywords.Items.Add(LowerCase(Keyword.Text));
       SearchKeywords.Items.EndUpdate;
     end
  else
     begin
       GenerateMessage(FormMain.GetLanguageText('Messages', 'ParentalLockKeywordFoundTitle', 'Keyword Found'),
                       FormMain.GetLanguageText('Messages', 'ParentalLockKeywordFoundMsg', 'This keyword is already on the list! Please, enter another one.'), 2);
     end;
  Keyword.SetFocus;
end;

procedure TFormParentalLockManager.ButtonDeleteSelectedKeywordsClick(
  Sender: TObject);
begin
  SearchKeywords.Items.BeginUpdate;
  SearchKeywords.DeleteSelected;
  SearchKeywords.Items.EndUpdate;
end;

procedure TFormParentalLockManager.ButtonReadLockGamesDATClick(Sender: TObject);
begin
  ReadLockedGamesDAT;
end;

procedure TFormParentalLockManager.GamesFoundListKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_DELETE then
     ButtonDeleteSelectedGamesFound.OnClick(Self);
end;

procedure TFormParentalLockManager.ButtonBeginSearchClick(Sender: TObject);
var
  GamesListDAT: THashedStringList;
  AddGame, GameFound: Boolean;
  Loop, Loop2, Loop3: Integer;

  function CheckGame: Boolean;
  begin
    Result:= (Pos((SearchKeywords.Items.Strings[Loop2]), (LowerCase(FormMain.mDescription))) > 0);
    if not Result then
       Result:= (Pos((SearchKeywords.Items.Strings[Loop2]), (LowerCase(FormMain.mCategory))) > 0);
  end;

begin
  Screen.Cursor:= crHourGlass;
  GamesListDAT:= THashedStringList.Create;
  GetGamesList(GamesListDAT, True, True);
  GamesFoundList.Items.BeginUpdate;
  if GamesFoundList.Items.Count = 0 then
     begin
       for Loop:=0 to GamesListDAT.Count -1 do
       begin
         AddGame:= False;
         FormMain.GetROMFields(GamesListDAT[Loop]);
         for Loop2:=0 to SearchKeywords.Items.Count -1 do
         begin
           if CheckGame then
              begin
                with GamesFoundList.Items.Add do
                  begin
                    Caption:= FormMain.mDescription;
                    SubItems.Add(FormMain.mName);
                    SubItems.Add(FormMain.mClone);
                    SubItems.Add(FormMain.mCategory);
                  end;
                Break;
              end;
         end;
       end;
     end
  else
     begin
       for Loop:=0 to GamesListDAT.Count -1 do
       begin
         AddGame:= False;
         GameFound:= False;
         FormMain.GetROMFields(GamesListDAT[Loop]);
         for Loop2:=0 to SearchKeywords.Items.Count -1 do
         begin
           if CheckGame then
              Break;
         end;

         for Loop3:=0 to GamesFoundList.Items.Count -1 do
           begin
             GameFound:= ((FormMain.mDescription = GamesFoundList.Items[Loop3].Caption) and
                          (FormMain.mName = GamesFoundList.Items[Loop3].SubItems[0]) and
                          (FormMain.mClone = GamesFoundList.Items[Loop3].SubItems[1]) and
                          (FormMain.mCategory = GamesFoundList.Items[Loop3].SubItems[2]));
             if GameFound then
                Break;
           end;

         if (AddGame) and (not GameFound) then
            begin
              with GamesFoundList.Items.Add do
                begin
                  Caption:= FormMain.mDescription;
                  SubItems.Add(FormMain.mName);
                  SubItems.Add(FormMain.mClone);
                  SubItems.Add(FormMain.mCategory);
                end;
            end;
       end;
     end;
  LabelTotalGamesProtect.Caption:= Format(FormMain.GetLanguageText('Main', 'StatusBarShownGames', '%u Games'), [GamesFoundList.Items.Count]);
  GamesFoundList.SortType:= stBoth;
  GamesFoundList.SortType:= stNone;
  GamesFoundList.Items.EndUpdate;
  FreeAndNil(GamesListDAT);
  Screen.Cursor:= crDefault;
end;

procedure TFormParentalLockManager.KeywordKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then
     ButtonAddKeyword.OnClick(Self);
end;

procedure TFormParentalLockManager.ButtonDeleteSelectedGamesFoundClick(
  Sender: TObject);
begin
  if GenerateMessage(FormMain.GetLanguageText('Messages', 'DeleteSelectedGameTitle', 'Delete Selected Game(s)'),
                     FormMain.GetLanguageText('Messages', 'DeleteSelectedGameMsg', 'Delete selected game(s) from the list. Are you sure ?'), 1) = mrYes then
     begin
       GamesFoundList.Items.BeginUpdate;
       GamesFoundList.DeleteSelected;
       GamesFoundList.Items.EndUpdate;
       LabelTotalGamesProtect.Caption:= Format(FormMain.GetLanguageText('Main', 'StatusBarShownGames', '%u Games'), [GamesFoundList.Items.Count]);
     end;
end;

procedure TFormParentalLockManager.ButtonDeleteSelectedLockedGamesClick(
  Sender: TObject);
var
  GameSelectedIndex: Integer;
begin
  if GenerateMessage(FormMain.GetLanguageText('Messages', 'DeleteSelectedLockedGamesTitle', 'Delete Selected Locked Game(s)'),
                     FormMain.GetLanguageText('Messages', 'DeleteSelectedLockedGamesMsg', 'Delete selected game(s) from the locked games list. Are you sure ?'), 1) = mrYes then
     begin
       GameSelectedIndex:= BlockedList.Selected.Index;
       BlockedList.Items.BeginUpdate;
       BlockedList.DeleteSelected;
       BlockedList.Items.EndUpdate;
       LabelTotalGamesLocked.Caption:= Format(FormMain.GetLanguageText('Main', 'StatusBarShownGames', '%u Games'), [BlockedList.Items.Count]);
     end;
end;

procedure TFormParentalLockManager.ButtonPasswordClick(Sender: TObject);
begin
  if not Assigned(FormParentalLockPasswordLogout) then
     FormParentalLockPasswordLogout:=TFormParentalLockPasswordLogout.Create(Self);
  FormParentalLockPasswordLogout.Password.Tag:= 1;
  FormParentalLockPasswordLogout.ShowModal;
  FreeAndNil(FormParentalLockPasswordLogout);
end;

procedure TFormParentalLockManager.FormShow(Sender: TObject);
begin
  FormMain.UpdateGeneralAppearance(FormParentalLockManager);
  FormMain.SetParentalLockLanguage;
  ReadLockedGamesDAT;
  LabelTotalGamesLocked.Caption:= Format(FormMain.GetLanguageText('Main', 'StatusBarShownGames', '%u Games'), [BlockedList.Items.Count]);
  Keyword.SetFocus;
end;

procedure TFormParentalLockManager.PopupPlayGameStandardClick(Sender: TObject);
begin
  FormMain.ExecuteGame(GamesFoundList.Selected.SubItems[0], True, FormPreferences.AverageFPS.Checked);
end;

end.
