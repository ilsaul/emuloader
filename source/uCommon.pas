unit uCommon;

interface

uses Windows, Messages, Classes, ExtCtrls, ComCtrls, dialogs,
     SysUtils, ShlObj, Forms, Controls, IniFiles, uMessages, uFilesUtil;

const
  FrontendVersion = '4.1';
  SystemStr: String[1] = '"';

function  ExtMatch(FileExtension, Extensions: String; Delimiter: Char): Boolean;
function  GenerateMessage(TitleMessage, DescriptionMessage: String; MessageType: Integer): Integer;
procedure CallMessagesForm;
procedure FreeMessagesForm;
procedure GetGamesList(HolderStrings: THashedStringList; AvailableGames, UnavailableGames: Boolean);
procedure GetCtrlrList(Folder, FileType: String; ListHolder: THashedStringList; ClearList: Boolean);
procedure GetFilesList(Folder, FileType: String; ListHolder: THashedStringList; SubDirectories, ClearList: Boolean);

function  EncryptData(DataString: String): String;
function  DecryptData(DataString: String): String;
function  ValidateParentalLockPassword(PasswordString: String; PasswordType: SmallInt): Boolean;
function  LoadParentalLockPassword: String;

function  ValidateUserProfilePassword(PasswordString, UserProfileName: String; PasswordType: SmallInt): Boolean;
procedure GetProfiles(StringsHolder: TStrings);
function  RenameProfileDescription(CurrentUserProfile, NewUserProfile: String): Boolean;
function  DeleteUserProfile(UserProfileDescription: String): Boolean;
//function  VerifyUserProfilesCount: Boolean;

function  ExtractMAMEIniValue(MAMEOption: String): String;

function  GetGameHistory(const GameName: String; const StringLine: String): Boolean;
procedure GetGamesFilesList(Folder, FileType: String; ListHolder: THashedStringList; SubDirectories: Boolean);

implementation

function ExtMatch(FileExtension, Extensions: String; Delimiter: Char): Boolean;
var
  Position: Longint;
begin
  Result:= False;

  // Check strings.
  if (Length(FileExtension) = 0) or (Length(Extensions) = 0) then
     Exit;

  // Rewrite strings.
  FileExtension:= Delimiter + UpperCase(FileExtension) + Delimiter;
  Extensions:= Delimiter + UpperCase(Extensions) + Delimiter;

  // Search.
  Position:= Pos(FileExtension, Extensions);

  // Found ?
  Result:= Position <> 0;
end;

function GenerateMessage(TitleMessage, DescriptionMessage: String; MessageType: Integer): Integer;
begin
  CallMessagesForm;
  FormMessages.LabelMessageTitle.Caption:= TitleMessage;
  FormMessages.LabelMessage.Clear;
  FormMessages.LabelMessage.Lines.Add(DescriptionMessage);
  case MessageType of
    0: // Yes, No, Cancel
      begin
        // do nothing...
      end;
    1: // Yes,No
      begin
        FormMessages.ButtonCancel.Enabled:= False;
      end;
    2: // Ok
      begin
        FormMessages.ButtonNoOk.Caption:= FormMessages.GetButtonCaption;
        FormMessages.ButtonYes.Visible:= False;
        FormMessages.ButtonCancel.Visible:= False;
      end;
  end;
  //if TitleMessage = 'Error!' then Beep;
  FormMessages.ShowModal;
  Result:= FormMessages.MsgResult;
  FreeMessagesForm;
end;

procedure CallMessagesForm;
begin
  if not Assigned(FormMessages) then
     FormMessages:= TFormMessages.Create(FormMessages);
end;

procedure FreeMessagesForm;
begin
  FreeAndNil(FormMessages);
end;

procedure GetGamesList(HolderStrings: THashedStringList; AvailableGames, UnavailableGames: Boolean);
var
  TempList: THashedStringList;
  FilePath: String;
begin
  FilePath:= ExtractFilePath(Application.ExeName);
  TempList:= THashedStringList.Create;
  HolderStrings.BeginUpdate;

  if AvailableGames then
     begin
       TempList.LoadFromFile(FilePath+'resources\ClassicMR.dat');
       HolderStrings.AddStrings(TempList);

       TempList.LoadFromFile(FilePath+'resources\ClassicMV.dat');
       HolderStrings.AddStrings(TempList);

       TempList.LoadFromFile(FilePath+'resources\ClassicCR.dat');
       HolderStrings.AddStrings(TempList);

       TempList.LoadFromFile(FilePath+'resources\ClassicCV.dat');
       HolderStrings.AddStrings(TempList);

       TempList.LoadFromFile(FilePath+'resources\NeoGeoM.dat');
       HolderStrings.AddStrings(TempList);

       TempList.LoadFromFile(FilePath+'resources\NeoGeoC.dat');
       HolderStrings.AddStrings(TempList);

       TempList.LoadFromFile(FilePath+'resources\Bios.dat');
       HolderStrings.AddStrings(TempList);
     end;

  if UnavailableGames then
     begin
       TempList.LoadFromFile(FilePath+'resources\UnClassicMR.dat');
       HolderStrings.AddStrings(TempList);

       TempList.LoadFromFile(FilePath+'resources\UnClassicMV.dat');
       HolderStrings.AddStrings(TempList);

       TempList.LoadFromFile(FilePath+'resources\UnClassicCR.dat');
       HolderStrings.AddStrings(TempList);

       TempList.LoadFromFile(FilePath+'resources\UnClassicCV.dat');
       HolderStrings.AddStrings(TempList);

       TempList.LoadFromFile(FilePath+'resources\UnNeoGeoM.dat');
       HolderStrings.AddStrings(TempList);

       TempList.LoadFromFile(FilePath+'resources\UnNeoGeoC.dat');
       HolderStrings.AddStrings(TempList);

       TempList.LoadFromFile(FilePath+'resources\UnBios.dat');
       HolderStrings.AddStrings(TempList);
     end;

  HolderStrings.EndUpdate;
  FreeAndNil(TempList);
end;

procedure GetCtrlrList(Folder, FileType: String; ListHolder: THashedStringList; ClearList: Boolean);
var
  Search: TSearchRec;
  LengthDir: Longint;
  Counter, Loop, EndIndex, IndexLastFolder: Integer;
  ControllerDescription: String;
  Continue: Boolean;
begin
  LengthDir:= Length(Folder);
  if LengthDir = 0 then
     Exit;

  ListHolder.BeginUpdate;
  if ClearList then
     ListHolder.Clear;

  // Rewrite path
  if Folder[LengthDir] <> ':' then
     Folder:= IncludeTrailingPathDelimiter(Folder);

  // Add Files
  Counter:= FindFirst(Folder + '*.*', $37, Search);
  while Counter = 0 do
  begin
    // It's a directory?
    if (Search.Attr and $10 = $10) and (Search.Name <> '.') and
       (Search.Name <> '..') then
       GetCtrlrList(Folder+Search.Name, FileType, ListHolder, False)
    else
       begin
         if FileType = '.zip' then
            begin
              if LowerCase(ExtractFileExt(Search.Name)) = FileType then
                 begin
                   Continue:= False;
                   if FileType = '.zip' then
                      begin
                        ControllerDescription:= Search.Name;
                        Delete(ControllerDescription, Length(ControllerDescription)-3, 4);
                        if ListHolder.IndexOf(ControllerDescription) = -1 then
                           ListHolder.Add(ControllerDescription);
                      end;
                 end;
            end
         else
         if FileType = '.ini' then
            Continue:= (LowerCase(Search.Name) = 'default.ini')
         else
            Continue:= False;

         if Continue then
            begin
              EndIndex:= -1;
              IndexLastFolder:= -1;
              Folder:= ExcludeTrailingPathDelimiter(Folder);
              ControllerDescription:= '';
              for Loop:=Length(Folder) downto 0 do
              begin
                if Folder[Loop] = '\' then
                   begin
                     if EndIndex = -1 then
                        begin
                          EndIndex:= Loop;
                          if IndexLastFolder = -1 then
                             IndexLastFolder:= Loop;
                        end
                     else
                        begin
                          ControllerDescription:= Copy(Folder, IndexLastFolder+1, Length(Folder));
                          Break;
                        end;
                   end;
              end;
              if ListHolder.IndexOf(ControllerDescription) = -1 then
                 ListHolder.Add(ControllerDescription);
            end;
       end;
    Counter:= FindNext(Search);
  end;
  FindClose(Search);
  ListHolder.EndUpdate;
end;

procedure GetFilesList(Folder, FileType: String; ListHolder: THashedStringList; SubDirectories, ClearList: Boolean);
var
  Search: TSearchRec;
  LengthDir: Longint;
  Counter: Integer;
begin
  LengthDir:= Length(Folder);
  if LengthDir = 0 then
     Exit;

  ListHolder.BeginUpdate;
  if ClearList then
     ListHolder.Clear;

  // Rewrite path
  if Folder[LengthDir] <> ':' then
     Folder:= IncludeTrailingPathDelimiter(Folder);

  // Add Files
  Counter:= FindFirst(Folder + '*.*', $37, Search);
  while Counter = 0 do
  begin
    // It's a directory?
    if (Search.Attr and $10 = $10) and (Search.Name <> '.') and
       (Search.Name <> '..') and (SubDirectories) then
       GetFilesList(Folder+Search.Name, FileType, ListHolder, True, ClearList)
    else
       begin
         if LowerCase(ExtractFileExt(Search.Name)) = FileType then
            begin
              if ListHolder.IndexOf(Search.Name) = -1 then
                 ListHolder.Add(Search.Name);
            end;
       end;
    Counter:= FindNext(Search);
  end;
  FindClose(Search);
  ListHolder.EndUpdate;
end;

function EncryptData(DataString: String): String;
var
  Data: String[255];
  Count: array[0..255] of Byte absolute Data;
  Loop: Integer;
begin
  Data:= DataString;
  for Loop:=1 to Ord(Data[0]) do
      Count[Loop]:= 23 xor Count[Loop];
  Result:= Data;
end;

function DecryptData(DataString: String): String;
var
  Data: String[255];
  Count: array[0..255] of Byte absolute Data;
  Loop: Integer;
begin
  Data:= DataString;
  for Loop:=1 to Length(Data) do
      Count[Loop]:= 23 xor Count[Loop];
  Result:= Data;
end;

// Parental Lock procedures
function ValidateParentalLockPassword(PasswordString: String; PasswordType: SmallInt): Boolean;
var
  UncryptedPassword: String;
  PasswordFile: THashedStringList;
begin
  Result:= True;
  case PasswordType of
    0:
      begin
        case FileExists(ExtractFilePath(Application.ExeName)+'ParentalLock.pwd') of
          True:
            begin
              PasswordFile:= THashedStringList.Create;
              PasswordFile.LoadFromFile(ExtractFilePath(Application.ExeName)+'ParentalLock.pwd');
              UncryptedPassword:=DecryptData(PasswordFile.Strings[0]);
              FreeAndNil(PasswordFile);
              Result:= UncryptedPassword = PasswordString;
            end;
          False: Result:= True;
        end;
      end;
    1:
      begin
        // it's for enter a new password, replacing the old one
      end;
  end;
end;

function LoadParentalLockPassword: String;
var
  PasswordFile: THashedStringList;
begin
  PasswordFile:= THashedStringList.Create;
  PasswordFile.LoadFromFile(ExtractFilePath(Application.ExeName)+'ParentalLock.pwd');
  Result:= PasswordFile.Strings[0];
  FreeAndNil(PasswordFile);
end;

// User Profile procedures
function ValidateUserProfilePassword(PasswordString, UserProfileName: String; PasswordType: SmallInt): Boolean;
var
  UserFile: TIniFile;
  MemUserFile: TMemIniFile;
  UncryptedPassword: String;
begin
  Result:= True;
  if PasswordType = 0 then
     begin
       case FileExists(ExtractFilePath(Application.ExeName)+'UserProfiles.ini') of
         True:
           begin
             if GetFileSize(ExtractFilePath(Application.ExeName)+'UserProfiles.ini') > 32768 then
                begin
                  MemUserFile:=TMemIniFile.Create(ExtractFilePath(Application.ExeName)+'UserProfiles.ini');
                  UncryptedPassword:=DecryptData(MemUserFile.ReadString(UserProfileName, 'Password', ''));
                  FreeAndNil(MemUserFile);
                end
             else
                begin
                  UserFile:=TIniFile.Create(ExtractFilePath(Application.ExeName)+'UserProfiles.ini');
                  UncryptedPassword:=DecryptData(UserFile.ReadString(UserProfileName, 'Password', ''));
                  FreeAndNil(UserFile);
                end;
             Result:= UncryptedPassword = PasswordString;
           end;
         False: Result:= False;
       end;
     end
  else Result:= True;
end;

procedure GetProfiles(StringsHolder: TStrings);
var
  ProfileFileName: TMemIniFile;
begin
  ProfileFileName:= TMemIniFile.Create(ExtractFilePath(Application.ExeName)+'UserProfiles.ini');
  StringsHolder.BeginUpdate;
  ProfileFileName.ReadSections(StringsHolder);
  StringsHolder.EndUpdate;
  FreeAndNil(ProfileFileName);
end;

function RenameProfileDescription(CurrentUserProfile, NewUserProfile: String): Boolean;
var
  UserFile: TIniFile;
  MemUserFile: TMemIniFile;
  PasswordHolder: String;
begin
  Result:= True;
  case FileExists(ExtractFilePath(Application.ExeName)+'UserProfiles.ini') of
    True:
      begin
        if GetFileSize(ExtractFilePath(Application.ExeName)+'UserProfiles.ini') > 32768 then
           begin
             MemUserFile:= TMemIniFile.Create(ExtractFilePath(Application.ExeName)+'UserProfiles.ini');
             PasswordHolder:= MemUserFile.ReadString(CurrentUserProfile, 'Password', '');
             MemUserFile.EraseSection(CurrentUserProfile);
             MemUserFile.WriteString(NewUserProfile, 'Password', PasswordHolder);
             FreeAndNil(MemUserFile);
           end
        else
           begin
             UserFile:= TIniFile.Create(ExtractFilePath(Application.ExeName)+'UserProfiles.ini');
             PasswordHolder:= UserFile.ReadString(CurrentUserProfile, 'Password', '');
             UserFile.EraseSection(CurrentUserProfile);
             UserFile.WriteString(NewUserProfile, 'Password', PasswordHolder);
             FreeAndNil(UserFile);
           end;
      end;
    False: Result:= False;
  end;
end;

function DeleteUserProfile(UserProfileDescription: String): Boolean;
var
  UserFile: TIniFile;
  MemUserFile: TMemIniFile;
begin
  Result:= True;
  case FileExists(ExtractFilePath(Application.ExeName)+'UserProfiles.ini') of
    True:
      begin
        if GetFileSize(ExtractFilePath(Application.ExeName)+'UserProfiles.ini') > 32768 then
           begin
             MemUserFile:= TMemIniFile.Create(ExtractFilePath(Application.ExeName)+'UserProfiles.ini');
             case MemUserFile.SectionExists(UserProfileDescription) of
               True : MemUserFile.EraseSection(UserProfileDescription);
               False: Result:= False;
             end;
             FreeAndNil(MemUserFile);
           end
        else
           begin
             UserFile:= TIniFile.Create(ExtractFilePath(Application.ExeName)+'UserProfiles.ini');
             case Userfile.SectionExists(UserProfileDescription) of
               True : UserFile.EraseSection(UserProfileDescription);
               False: Result:= False;
             end;
             FreeAndNil(UserFile);
           end;
      end;
    False: Result:= False;
  end;
end;

{function VerifyUserProfilesCount: Boolean;
var
  UserFile: TIniFile;
  MemUserFile: TMemIniFile;
begin
  Result:=True;
  case FileExists(ExtractFilePath(Application.ExeName)+'UserProfiles.ini') of
    True:
      begin
        if GetFileSize(ExtractFilePath(Application.ExeName)+'UserProfiles.ini') > 32768 then
           begin
             MemUserFile:=TMemIniFile.Create(ExtractFilePath(Application.ExeName)+'UserProfiles.ini');
             case MemUserFile.SectionExists(UserProfileDescription) of
               True : MemUserFile.EraseSection(UserProfileDescription);
               False: Result:=False;
             end;
             MemUserFile.Free;
             MemUserFile:=nil;
           end
        else
           begin
             UserFile:=TIniFile.Create(ExtractFilePath(Application.ExeName)+'UserProfiles.ini');
             case Userfile.SectionExists(UserProfileDescription) of
               True : UserFile.EraseSection(UserProfileDescription);
               False: Result:=False;
             end;
             UserFile.Free;
             UserFile:=nil;
           end;
      end;
    False: Result:=False;
  end;
end;}

function ExtractMAMEIniValue(MAMEOption: String): String;
var
  Index: Integer;
  Disabled: Boolean;
begin
  Result:= '';
  Disabled:= (Pos('#', MAMEOption) > 0);
  Index:= Pos(' ', MAMEOption);
  if Index = -1 then
     Result:= 'Error'
  else
     begin
        Delete(MAMEOption, 1, Index);
        if Disabled then
           begin
             Index:= Pos(' ', MAMEOption);
             if Index = -1 then
                begin
                  Result:= 'Error';
                  Exit;
                end
             else
                Delete(MAMEOption, 1, Index);
           end;
        Result:= Trim(MAMEOption);
        if Result = '' then
           Result:= 'Error';
     end;
end;

function GetGameHistory(const GameName: String; const StringLine: String): Boolean;
var
  Loop, Counter2: Integer;
  HistoryName: String;
begin
  Result:= False;
  HistoryName:= '';
  Counter2:= Length(StringLine)+1;

  for Loop:=7 to Counter2 do
  begin
    if (StringLine[Loop] <> ',') and (Loop <> Counter2) then
       HistoryName:= HistoryName+StringLine[Loop]
    else
       begin
         if Trim(LowerCase(HistoryName)) = LowerCase(GameName) then
            begin
              Result:= True;
              Break;
            end
         else
            HistoryName:= '';
       end;
  end;
end;

procedure GetGamesFilesList(Folder, FileType: String; ListHolder: THashedStringList; SubDirectories: Boolean);
var
  Search: TSearchRec;
  LengthDir: Longint;
  Counter: Integer;
begin
  LengthDir:= Length(Folder);
  if LengthDir = 0 then Exit;

  ListHolder.BeginUpdate;
  // Rewrite path
  if Folder[LengthDir] <> ':' then
     Folder:= IncludeTrailingPathDelimiter(Folder);

  // Add Files
  Counter:= FindFirst(Folder + '*.*', $37, Search);
  while Counter=0 do
  begin
    // It's a directory?
    if (Search.Attr and $10 = $10) and (Search.Name <> '.') and
       (Search.Name <> '..') and (SubDirectories) then
       GetGamesFilesList(Folder+Search.Name, FileType, ListHolder, True)
    else
       begin
         if LowerCase(ExtractFileExt(Search.Name)) = FileType then
            begin
              if ListHolder.IndexOf(Folder+Search.Name) = -1 then
                 ListHolder.Add(Folder+Search.Name);
            end;
       end;
    Counter:= FindNext(Search);
  end;
  FindClose(Search);
  ListHolder.EndUpdate;
end;


end.
