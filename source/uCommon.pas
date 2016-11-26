unit uCommon;

{$I-,R-}

interface

uses
  Windows, RTLConsts, Classes, StdCtrls, ExtCtrls, ComCtrls,
  Graphics, SysUtils, ShlObj, Forms, Controls, IniFiles, ShellAPI,
  MessageDigests, MessageAuthenticationCodes, Consts, CommDlg, Registry,
  uMessageBox, uSelectDirectory, Math, MPCommonUtilities, ShadowLabel;

const
  MaxArcadeSystems = 8;
  MaxIniCountMAME: Byte = 12; // MAME .ini files array ... see more in uMain.GetCustomIniFileMAME() function
  MaxImagePerCategory = 30;

  idMAME       = 1;
  idSupermodel = 2;
  idDaphne     = 3;
  idDemul      = 4;
  idHBMAME     = 5;
  idDICE       = 6;
  idSegaModel2 = 7;
  idZiNc       = 8;
  idMultiSys   = 500;

  //idFontParent      = 0;
  //idFontClone       = 1;
  //idFontMissingROMs = 2;
  
  aOrientation: packed array[-1..1] of String = ('', 'Horizontal', 'Vertical');
  aStatus: packed array[-1..2] of String = ('', 'Good', 'Imperfect', 'Preliminary');
  aSaveState: packed array[-1..1] of String = ('', 'Unsupported', 'Supported');
  aMediaType: packed array[-1..1] of packed array[0..1] of String =
    (('', ''),
     ('ROM', 'zipfile'),
     ('Compressed Hunks of Data', 'chd'));

  aScanMode: packed array[0..2] of String = ('Full Scan', 'Quick Scan', 'Force Game Available');

  SystemStr: String[1] = '"';
  CommandPromptStr: String = 'cmd.exe /c ';

  ImageCategoryArray: packed array[0..17] of packed array[0..4] of String = (
    //IconFileName,           IniSectionName,     NotAvailableName,    default path, ui.ini / mame.ini entry name
     ('image_00_titlesnap',   'TitleSnapshot',    'title.png',         'titles',     'titles_directory'),
     ('image_01_gamesnap',    'GameSnapshot',     'ingame.png',        'snap',       'snapshot_directory'),
     ('image_02_marquee',     'Marquee',          'marquee.png',       'marquees',   'marquees_directory'),
     ('image_03_flyer',       'Flyer',            'flyer.png',         'flyers',     'flyers_directory'),
     ('image_04_cabinet',     'Cabinet',          'cabinet.png',       'cabinets',   'cabinets_directory'),
     ('image_05_cpanel',      'ControlPanel',     'controlpanel.png',  'cpanel',     'cpanels_directory'),
     ('image_06_cover',       'SoftwareCover',    'softwarecover.png', 'covers',     'covers_directory'),
     ('image_07_pcb',         'PCB',              'pcb.png',           'pcb',        'pcbs_directory'),
     ('image_08_gameartwork', 'GameArtwork',      'ingameartwork.png', 'artpreview', 'artwork_preview_directory'),
     ('image_09_end',         'End',              'end.png',           'ends',       'ends_directory'),
     ('image_10_boss',        'Boss',             'boss.png',          'bosses',     'bosses_directory'),
     ('image_11_logo',        'Logo',             'logo.png',          'logo',       'logos_directory'),
     ('image_12_score',       'Score',            'score.png',         'scores',     'scores_directory'),
     ('image_13_versus',      'Versus',           'versus.png',        'versus',     'versus_directory'),
     ('image_14_gameover',    'GameOver',         'gameover.png',      'gameover',   'gameover_directory'),
     ('image_15_howto',       'HowToPlay',        'howtoplay.png',     'howto',      'howto_directory'),
     ('image_16_select',      'Select',           'select.png',        'select',     'select_directory'),
     ('image_internet',       'InternetGameInfo', '', '', ''));

  aColumns: packed array[0..22] of packed array[0..1] of String = (
     //IniEntryName,     ColumnTitle
     ('Title',           'Title'),            // 00
     ('Year',            'Year'),             // 01
     ('Manufacturer',    'Manufacturer'),     // 02

     ('Orientation',     'Orientation'),      // 03
     ('Resolution',      'Resolution'),       // 04
     ('RefreshRate',     'Refresh Rate'),     // 05

     ('Category',        'Category'),         // 06 catver.ini (MAME arcade); mess.ini (version.ini pack from AntoPISA); non-arcade machines -listxml; softlist <description> (hash\softwarelist.xml files)
     ('VersionAdded',    'Version Added'),    // 07

     ('Name',            'Game Name'),        // 08
     ('Clone',           'Clone of'),         // 09
     ('DriverName',      'Driver Name'),      // 10

     ('NumPlayers',      'Players'),          // 11

     ('DriverStatus',    'Driver Status'),    // 12
     ('EmulationStatus', 'Emulation Status'), // 13
     ('ColorStatus',     'Color Status'),     // 14
     ('SoundStatus',     'Sound Status'),     // 15
     ('GraphicStatus',   'Graphic Status'),   // 16

     ('Played',          'Played'),           // 17
     ('Language',        'Language'),         // 18

     ('GameSize',        'Game Size'),        // 19
     ('LastPlayed',      'Last Played'),      // 20
     ('Playtime',        'Playtime'),         // 21
     ('SoftwareName',    'Software Name'));   // 22

  aColumnsWidth: packed array[0..22] of Integer = ( //           13  14  15  16           19   20   21   22
    400, 65, 180, 100, 90, 100, 180, 100, 100, 100, 105, 80, 90, 90, 90, 90, 90, 60, 100, 115, 130, 110, 130);

  aColumnsMachinesList: packed array[0..6] of String =
     ('Machine', 'Year', 'Manufacturer', 'Name', 'Clone', 'Driver', 'SaveState'); // Machines List Side Panel

  aColumnsWidthMachinesList: packed array[0..6] of Integer =         // Machines List Side Panel
     (250, 45, 120, 85, 85, 95, 90);

  aColumnsSoftwareListOrder: packed array[0..11] of Integer =
     ( 0,  // 00 -> title
       1,  // 01 -> year
       2,  // 02 -> manufacturer
       6,  // 03 -> category
      17,  // 04 -> times played
      20,  // 05 -> last played date/time
      21,  // 06 -> total playtime
       8,  // 07 -> game name
       9,  // 08 -> clone of
      12,  // 09 -> driver status
      13,  // 10 -> emulation status
      19); // 11 -> game size

  ChecksumMode: array [0..4] of TMessageDigestClass = (
    TMD2, TMD4, TMD5, TSHA1, TRIPEMD160);

  ListSelectionColors: packed array[0..4] of packed array[0..1] of Integer =
    // normal colors (blue), missing ROMs/CHDs colors (red),
    //(($00fcdcc3, $00c3dcfc), // new single color (October 26, 2016)
    // old single color (($00a65c41, $00415ca6),  // 0 -> bar single color
    (($00fcdbc1, $00c1dbfc),  // 0 -> bar single color
     ($00fcebdc, $00dcebfc),  // 1 -> gradient color top
     ($00fcdbc1, $00c1dbfc),  // 2 -> gradient color bottom
     ($00b98c64, $00648cb9),  // 3 -> gradient border color (new - October 26, 2016) R:100 G:140 B:185
     //($00cea27d, $007da2ce),  // 3 -> gradient border color
     (clBlack  , clMaroon));
     //($006c0000, $0000006c)); // 4 -> font color (new color - October 26, 2016)
     //($00cc6600, $000066cc)); // 4 -> font color

  // Windows 10 selection bar colors
  {ListSelectionColors: packed array[0..4] of packed array[0..1] of Integer =
    // normal colors (blue), missing ROMs/CHDs colors (red),
    (($00ffe8cc, $00cce8ff),  // 0 -> bar single color
     ($00ffe8cc, $00cce8ff),  // 1 -> gradient color top
     ($00ffe2bf, $00bfe2ff),  // 2 -> gradient color bottom
     ($00ffd199, $0099d1ff),  // 3 -> gradient border color
     (clBlack  , clMaroon));}

     // $00e8a766 // border color (blue)
     // $00ffe8d1 // bar single color (blue)

     // $0066a7e8 // border color (red)
     // $00d1e8ff // bar single color (red)

     // $00dedede // border color (gray)
     // $00f7f7f7 // bar single color (gray)

  ListSelectionColorInactive: packed array[0..3] of packed array[0..1] of Integer =
    // normal colors (blue), missing ROMs/CHDs colors (red)
    (($00d2d2c8, $00c8d2d2), // 0 -> inactive single color R:222 G:222 B:222
     ($00dcdcdc, $00dcdcdc), // 1 -> inactive color, gradient mode(same as gradient color top)
     ($008e8e8e, $008e8e8e), // 2 -> inactive border color, gradient mode (same as bar single color) R:142 G:142: B:142
     (clBlack, clBlack));      // 3 -> inactive font color

  {ListSelectionColorInactive: packed array[0..3] of packed array[0..1] of Integer =
    // normal colors (blue), missing ROMs/CHDs colors (red)
    (($00d2d2c8, $00c8d2d2), // 0 -> inactive single color
    // ($00f7f7f7, $00f7f7f7), // 1 -> inactive color, gradient mode(same as gradient color top)
     ($00dcdcdc, $00dcdcdc), // 1 -> inactive color, gradient mode(same as gradient color top)
     ($00cdcdcd, $00cdcdcd), // 2 -> inactive border color, gradient mode (same as bar single color)
     (clSilver, clSilver));      // 3 -> inactive font color}

  // too light colors... better on a dark background
  //ListSelectionColorInactiveMachinesList: packed array[0..3] of packed array[0..1] of Integer =
  //  // normal colors (blue), missing ROMs/CHDs colors (red)
  //  (($00e8c39b, $009bc3e8), // 0 -> inactive single color
  //   ($00fef8f0, $00f0f8fe), // 1 -> inactive color, gradient mode(same as gradient color top)
  //   ($00fef1e0, $00e0f1fe), // 2 -> inactive border color, gradient mode (same as bar single color)
  //   (clGray, clGray));      // 3 -> inactive font color
     
  VersionInfo: array [1..9] of String = ('CompanyName', 'FileDescription', 'FileVersion', 'InternalName',
    'LegalCopyRight', 'OriginalFileName', 'ProductName', 'ProductVersion',
    'SpecialBuild');

  Model3PowerPCFrequency: packed array [0..8] of Byte = (16, 20, 25, 33, 40, 50, 60, 66, 75); // for Supermodel 3 emulator

type
  TWideFileName = type WideString;
  TSearchRecW = record
    Time: Integer;
    Size: Int64;
    Attr: Integer;
    Name: TWideFileName;
    DOSName: String;
    ExcludeAttr: Integer;
    FindHandle: THandle;
    FindData: TWin32FindDataW;
  end;

function  StrCmpLogicalW(psz1, psz2: PWideChar{WideString}): Integer; stdcall; external 'shlwapi.dll';

function  GetVersion(const sFile: String; MinorVersionOnly: Boolean = False): String;
function  GetFileInfo2(FName, InfoType: String): String;
function  GetFileSize(const AFileName: String): Int64;

{$IFDEF WIN32}
function  ShortToLongFileName(const ShortName: String): String;
function  ShortToLongPath(const ShortName: String): String;
function  LongToShortFileName(const LongName: String): String;
//function  LongToShortPath(const LongName: String): String; // this function doesn't work, use ExtractShortPathName() instead!!! October 10, 2016
{$ENDIF WIN32}

function  ExtractShortPathName(const FileName: string): string; // function from Delphi XE 10 Seattle source code

function  Pos(const substr, str: WideString): Integer; overload;
function  PosEx(const SubStr, S: String; Offset: Integer = 1): Integer;

function  LowerCase(const S: String): String; overload;
function  UpperCase(const S: String): String; overload;
procedure Move(const Source; var Dest; count: Integer); overload;
// end of file functions (from the old uFilesUtil.pas)

procedure CallShellExecute(Sender: TObject; Visibility: Word = SW_SHOWNORMAL);

function  GenerateZipErrorsMessage(const TitleMessage: String; ZipFilesList: TStrings): Integer;
function  GenerateMessage(const WindowMessage, TitleMessage: WideString; const DescriptionMessage: WideString = ''; MessageType: Integer = 2; DefaultButtonNo: Boolean = False;
                          IconIndex: Integer = 0): Integer;
procedure CallMessageBox;
procedure FreeMessageBox;

function  GetSystemFileName(SystemID: Byte; FileID: Byte = 0; const SoftwareList: String = ''): String;
//function  GetSystemROMFileName(SystemID: Byte; const SoftwareList: String = ''): String;
procedure GenerateControllerDefinitionsFilesList(Folder: String; ListHolder: THashedStringList; ClearList: Boolean = False);
procedure GetFilesList(Folder, FileType, FileMask: String; ListHolder: THashedStringList; SubDirectories, ClearList, ReturnFullPath: Boolean);
procedure GetFoldersList(Folder: String; ListHolder: THashedStringList; ClearList, SubDirectories: Boolean);

function  GetPlayTime(Milliseconds: Int64; ShowHoursDays: Boolean = False; HideSeconds: Boolean = False): String;
function  ExtractMAMEIniValue(const MAMEOption: String): String;

function  GetGameHistory(const GameName, StringLine: String; TagLength: Integer): Boolean;

// SHA-1 / MD5 routines
function  ComputeHashValueMemoryStream(Mode: Integer; const mStreamHolder: TMemoryStream): String;
function  ComputeHashValue(Mode: Integer; const FileName: String): String;
function  GetSHA1_ValueMemoryStream(const mStream: TMemoryStream): String;
function  GetSHA1_Value(const strFileName: String): String;
function  GetMD5_Value(const strFileName: String): String;

function  CheckAndCreateFolder(const FolderString: String): Boolean;
function  CompareIntValue(const A, B: Int64): ShortInt;
function  CompareFloatValue(const A, B: Extended): ShortInt;
function  CompareTDateTime(const A, B: TDateTime): Integer;
procedure SetComboBoxEx(Holder: TComboBoxEx; ItemNumber: Integer; ResetSelection: Boolean = False);
procedure SetComboBoxExImgIndex(Holder: TComboBoxEx; ImgIndex: Integer; ResetSelection: Boolean = False);
procedure SetSelectedComboBox(sIndex: ShortInt; ComboBoxHolder: TComboBox);

function  XML_CheckData(const strLine, FieldEntry: String): Boolean;
function  XML_GetEntryName(const strLine: String): String;
function  XML_GetEntryValue(const strLine, EntryName: String): String;

// for old MAME builds 0.56 to 0.69
function  ListInfo_GetEntryValue(strLine, EntryName, TagCharacter: String): String;

function  SoftListGetEntryValue(strLine, EntryName: String): String; // for software lists (vectrex, neocd, etc...) console/handheld/computer with Unicode strings

procedure ListScreenModes(ListHolder: TStrings; ResolutionOnly: Boolean = False);
function  GetScrLayoutSectionOld(LayoutIndex: Byte): String;
function  GetScrLayoutSection(LayoutIndex: Byte): String;
function  GetScrLayoutImageFile(LayoutIndex: Byte; ImageExtension: Boolean = True): String;
function  GetScrLayoutDefaultType(LayoutIndex, ImageIndex: Byte): ShortInt;

//function  Is64BitOS: Boolean;
//function  GetWindowsVersion: String;

function  FileExists(const FileName: String): Boolean;
function  RenameFile(const OldName, NewName: String; OverwriteExistingFile: Boolean = True): Boolean;
function  MoveFile(const OldName, NewName: String; OverwriteExisting: Boolean): Boolean;

procedure SetDefaultColorBox(ColorHolder: TColorBox);

function  SelectDirectoryShell(const Caption: String; RecursiveSubFolders: Boolean; out Directory: String; out AddSubFolders: Boolean): Boolean;

procedure CallMaximizeWindow(FormHolder: TForm);

procedure SetEditBkColor(EditHolder: TEdit);
function  IsEditEditing(EditHolder: TEdit): Boolean;
//procedure BrowseEditBkColor(EditHolder: TEdit);

function  ShortDirString(const FileFullPath: String; MaxLength: Integer): String;

function  OpenSaveFileDialog(Parent: TWinControl; const DefExt, Filter, InitialDir, Title: string; var FileName: string;
                             MustExist, OverwritePrompt, NoChangeDir, DoOpen: Boolean): Boolean;

function  GetAppIcon(const appEmuFile: String; ImageListHolder: TImageList; ReplaceIndex: Integer = -1): Integer;
//function  GetAppIcon(const appEmuFile: String; IconHolder: TIcon; ImageListHolder: TImageList; ReplaceIndex: Integer = -1): Integer;
function  GetExtIcon(const FileExtension: String; ImageListHolder: TImageList): Integer;
function  GetAssociatedApp(fileExtension: String; ReturnExeFileOnly: Boolean = False): String;

function  GetFileTypeStr(const strFilename: String): String;

function  GetWinTempDir: String;
function  GetWindowsDir: String;
function  GetSystemDir: String;
function  GetMyDocuments: string;

procedure PopulateScreenResolution(DestList: TComboBox; AddAutoText: Boolean = False);
function  CompareStringListNatural(sList: TStringList; Index1, Index2: Integer): Integer;
function  NaturalCompareText(const Text1, Text2: WideString): Integer;

// WideString functions
function  GetFileInfoW(FName, InfoType: WideString): String;
function  LastDelimiterW(const Delimiters, S: WideString): Integer;
function  ChangeFileExtW(const FileName, Extension: WideString): WideString;
function  ExtractFileExtW(const FileName: WideString): WideString;
function  ExtractFileNameW(const FileName: WideString): WideString;
function  ExtractFilePathW(const FileName: WideString): WideString;

// unicode function to search files correctly!!! June 24, 2014 TSearchRecUnicode
function  FindMatchingFileW(var F: TSearchRecW): Integer;
function  FindFirstW(const Path: WideString; Attr: Integer; var  F: TSearchRecW): Integer;
function  FindNextW(var F: TSearchRecW): Integer;
procedure FindCloseW(var F: TSearchRecW);

function  GetFileSizeW(const aFileName: WideString): Int64;
function  FileAgeW(const FileName: WideString): Integer;
procedure DeleteAllFilesW(const FolderName: WideString; RecursiveFolders: Boolean = False);
function  GetShortFileNameW(const FileName: WideString): String;

procedure ShowMessageW(const MessageStr: WideString; TitleStr: String = '');

function  WideLastChar(const S: WideString): PWideChar;
function  LastCharW(const S: WideString): WideChar;
//function  Tnt_GetStringTypeExW(Locale: LCID; dwInfoType: DWORD;
//                               lpSrcStr: PWideChar; cchSrc: Integer; var lpCharType): BOOL;

function  IsWideCharUpper(WC: WideChar): Boolean;
function  IsWideCharLower(WC: WideChar): Boolean;
function  IsWideCharDigit(WC: WideChar): Boolean;
function  IsWideCharSpace(WC: WideChar): Boolean;
function  IsWideCharPunct(WC: WideChar): Boolean;
function  IsWideCharCntrl(WC: WideChar): Boolean;
function  IsWideCharBlank(WC: WideChar): Boolean;
function  IsWideCharXDigit(WC: WideChar): Boolean;
function  IsWideCharAlpha(WC: WideChar): Boolean;
function  IsWideCharAlphaNumeric(WC: WideChar): Boolean;
function  StringReplaceW(const S, OldPattern, NewPattern: WideString;
                         Flags: TReplaceFlags; WholeWord: Boolean = False): WideString;

//function  ProcessExists(const exeFileName: string): Boolean;

function  CheckAppOneInstance: Boolean;

implementation


function GetVersion(const sFile: String; MinorVersionOnly: Boolean = False): String;
var
  VerInfoSize: DWORD;
  VerInfo: Pointer;
  VerValueSize: DWORD;
  VerValue: PVSFixedFileInfo;
  Dummy: DWORD;
begin
  Result:= '';
  VerInfoSize:= GetFileVersionInfoSize(PChar(sFile), Dummy);
  if VerInfoSize = 0 then Exit;
  GetMem(VerInfo, VerInfoSize);
  GetFileVersionInfo(PChar(sFile), 0, VerInfoSize, VerInfo);
  VerQueryValue(VerInfo, '\', Pointer(VerValue), VerValueSize);
  with VerValue^ do
  begin
    Result:= IntToStr(dwFileVersionMS shr 16);
    Result:= Result+ '.'+IntToStr(dwFileVersionMS and $FFFF);
    if not MinorVersionOnly then
       begin
         Result:= Result+ '.'+IntToStr(dwFileVersionLS shr 16);
         Result:= Result+ '.'+IntToStr(dwFileVersionLS and $FFFF);
       end;
  end;
  FreeMem(VerInfo, VerInfoSize);
end;

function GetFileInfo2(FName, InfoType: String): String;
{usage:

  showmessage(GetFileInfo(Application.ExeName, VersionInfo[x]));

  1: 'CompanyName'
  2: 'FileDescription'
  3: 'FileVersion'
  4: 'InternalName'
  5: 'LegalCopyRight'
  6: 'OriginalFileName'
  7: 'ProductName'
  8: 'ProductVersion'
  9: 'SpecialBuild'}
var
  Info    : Pointer;
  InfoData: Pointer;
  InfoSize: LongInt;
  InfoLen : {$IFDEF WIN32} DWORD;{$ELSE} LongInt; {$ENDIF}
  DataLen : {$IFDEF WIN32} UInt; {$ELSE} word; {$ENDIF}
  LangPtr : Pointer;
begin
  Result:= '';
  if Length(FName) <= 0 then
     Exit;

  DataLen:= 255;
  FName:= FName+#0;

  InfoSize:= GetFileVersionInfoSize(@Fname[1], InfoLen);
  if not (InfoSize > 0) then
     Exit;

  GetMem(Info, InfoSize);
  try
    if GetFileVersionInfo(@FName[1], InfoLen, InfoSize, Info) then
       begin
         if VerQueryValue(Info, '\VarFileInfo\Translation', LangPtr, DataLen) then
            InfoType:= Format('\StringFileInfo\%0.4x%0.4x\%s'#0, [LoWord(LongInt(LangPtr^)), HiWord(LongInt(LangPtr^)), InfoType]);
         if VerQueryValue(Info, @InfoType[1], InfoData, Datalen) then
           Result:= strPas(InfoData);
       end;
  finally
    FreeMem(Info, InfoSize);
  end;
end;

function GetFileSize(const aFileName: String): Int64;
var
  SearchRec: TSearchRec;
  Converter: packed record
    case Boolean of
      False: (n: Int64);
      True : (Low, High: DWORD);
    end;
begin
  if FindFirst(aFileName, faAnyfile, SearchRec) = 0 then
     begin
       Converter.Low:= SearchRec.FindData.nFileSizeLow;
       Converter.High:= SearchRec.FindData.nFileSizeHigh;
       Result:= Converter.n;
     end
  else
     Result:= -1;
  FindClose(SearchRec);
end;

{$IFDEF WIN32}

function ShortToLongFileName(const ShortName: String): String;
var
  Temp: TWin32FindData;
  SearchHandle: THandle;
begin
  SearchHandle:= FindFirstFile(PChar(ShortName), Temp);
  if SearchHandle <> INVALID_HANDLE_VALUE then
     begin
       Result:= String(Temp.cFileName);
       if Result = '' then
          Result:= String(Temp.cAlternateFileName);
     end
  else
     Result:= '';
  Windows.FindClose(SearchHandle);
end;

function LongToShortFileName(const LongName: String): String;
var
  Temp: TWin32FindData;
  SearchHandle: THandle;
begin
  SearchHandle:= FindFirstFile(PChar(LongName), Temp);
  if SearchHandle <> INVALID_HANDLE_VALUE then
     begin
       Result:= String(Temp.cAlternateFileName);
       if Result = '' then
          Result:= String(Temp.cFileName);
     end
  else
     Result:= '';
  Windows.FindClose(SearchHandle);
end;

function ShortToLongPath(const ShortName: String): String;
var
  LastSlash: PChar;
  TempPathPtr: PChar;
begin
  Result:= '';
  TempPathPtr:= PChar(ShortName);
  LastSlash:= StrRScan(TempPathPtr, '\');
  while LastSlash <> nil do
  begin
    Result:= '\' + ShortToLongFileName(TempPathPtr) + Result;
    if LastSlash <> nil then
       begin
         LastSlash^:= Char(0);
         LastSlash:= StrRScan(TempPathPtr, '\');
       end;
  end;
  Result:= TempPathPtr + Result;
end;

// this function doesn't work, use ExtractShortPathName() instead!!! October 10, 2016
//function LongToShortPath(const LongName: String): String;
//var
//  LastSlash: PChar;
//  TempPathPtr: PChar;
//begin
//  Result:= '';
//  TempPathPtr:= PChar(LongName);
//  LastSlash:= StrRScan(TempPathPtr, '\');
//  while LastSlash <> nil do
//  begin
//    Result:= '\' + LongToShortFileName(TempPathPtr) + Result;
//    if LastSlash <> nil then
//       begin
//         LastSlash^:= Char(0);
//         LastSlash:= StrRScan(TempPathPtr, '\');
//       end;
//  end;
//  Result:= TempPathPtr+Result;
//end;
{$ENDIF WIN32}

function ExtractShortPathName(const FileName: string): string; // function from Delphi XE 10 Seattle source code
var
  Buffer: array[0..MAX_PATH - 1] of Char;
  Len: Integer;
begin
  // param "FileName" can be only path (with or without "\") or with a filename at the end
  Len := GetShortPathName(PChar(FileName), Buffer, Length(Buffer));
  if Len <= Length(Buffer) then
    SetString(Result, Buffer, Len)
  else
    if Len > 0 then
    begin
      SetLength(Result, Len);
      Len := GetShortPathName(PChar(FileName), PChar(Result), Len);
      if Len < Length(Result) then
        SetLength(Result, Len);
    end;
end;

// delphi 2006 assembly functions!
function Pos(const substr, str: WideString): Integer; overload;
asm
{     ->EAX     Pointer to substr               }
{       EDX     Pointer to string               }
{     <-EAX     Position of substr in str or 0  }

        TEST    EAX,EAX
        JE      @@noWork

        TEST    EDX,EDX
        JE      @@stringEmpty

        PUSH    EBX
        PUSH    ESI
        PUSH    EDI

        MOV     ESI,EAX                         { Point ESI to substr           }
        MOV     EDI,EDX                         { Point EDI to s                }

        MOV     ECX,[EDI-4]                     { ECX = Length(s)               }
        SHR     ECX,1

        PUSH    EDI                             { remember s position to calculate index        }

        MOV     EDX,[ESI-4]                     { EDX = Length(substr)          }
        SHR     EDX,1

        DEC     EDX                             { EDX = Length(substr) - 1              }
        JS      @@fail                          { < 0 ? return 0                        }
        MOV     AX,[ESI]                        { AL = first char of substr             }
        ADD     ESI,2                           { Point ESI to 2'nd char of substr      }

        SUB     ECX,EDX                         { #positions in s to look at    }
                                                { = Length(s) - Length(substr) + 1      }
        JLE     @@fail
@@loop:
        REPNE   SCASW
        JNE     @@fail
        MOV     EBX,ECX                         { save outer loop counter               }
        PUSH    ESI                             { save outer loop substr pointer        }
        PUSH    EDI                             { save outer loop s pointer             }

        MOV     ECX,EDX
        REPE    CMPSW
        POP     EDI                             { restore outer loop s pointer  }
        POP     ESI                             { restore outer loop substr pointer     }
        JE      @@found
        MOV     ECX,EBX                         { restore outer loop counter    }
        JMP     @@loop

@@fail:
        POP     EDX                             { get rid of saved s pointer    }
        XOR     EAX,EAX
        JMP     @@exit

@@stringEmpty:
        XOR     EAX,EAX
        JMP     @@noWork

@@found:
        POP     EDX                             { restore pointer to first char of s    }
        MOV     EAX,EDI                         { EDI points of char after match        }
        SUB     EAX,EDX                         { the difference is the correct index   }
        SHR     EAX,1
@@exit:
        POP     EDI
        POP     ESI
        POP     EBX
@@noWork:
end;

function PosEx(const SubStr, S: String; Offset: Integer = 1): Integer;
// copy of Fastcode function PosEx_JOH_IA32_8
// Needed for Delphi 6 and to Fix Bug in D7 PosEx
// not needed for Delphi 2006 and newer!!!!
asm {299 Bytes}
  sub     esp, 20
  mov     [esp], ebx
  cmp     eax, 1
  sbb     ebx, ebx         {-1 if SubStr = '' else 0}
  sub     edx, 1           {-1 if S = ''}
  sbb     ebx, 0           {Negative if S = '' or SubStr = '' else 0}
  sub     ecx, 1           {Offset - 1}
  or      ebx, ecx         {Negative if S = '' or SubStr = '' or Offset < 1}
  jl      @@InvalidInput
  mov     [esp+4], edi
  mov     [esp+8], esi
  mov     [esp+12], ebp
  mov     [esp+16], edx
  mov     edi, [eax-4]     {Length(SubStr)}
  mov     esi, [edx-3]     {Length(S)}
  add     ecx, edi
  cmp     ecx, esi
  jg      @@NotFound       {Offset to High for a Match}
  test    edi, edi
  jz      @@NotFound       {Length(SubStr = 0)}
  lea     ebp, [eax+edi]   {Last Character Position in SubStr + 1}
  add     esi, edx         {Last Character Position in S}
  movzx   eax, [ebp-1]     {Last Character of SubStr}
  add     edx, ecx         {Search Start Position in S for Last Character}
  mov     ah, al
  neg     edi              {-Length(SubStr)}
  mov     ecx, eax
  shl     eax, 16
  or      ecx, eax         {All 4 Bytes = Last Character of SubStr}
@@MainLoop:
  add     edx, 4
  cmp     edx, esi
  ja      @@Remainder      {1 to 4 Positions Remaining}
  mov     eax, [edx-4]     {Check Next 4 Bytes of S}
  xor     eax, ecx         {Zero Byte at each Matching Position}
  lea     ebx, [eax-$01010101]
  not     eax
  and     eax, ebx
  and     eax, $80808080   {Set Byte to $80 at each Match Position else $00}
  jz      @@MainLoop       {Loop Until any Match on Last Character Found}
  bsf     eax, eax         {Find First Match Bit}
  shr     eax, 3           {Byte Offset of First Match (0..3)}
  lea     edx, [eax+edx-3] {Address of First Match on Last Character + 1}
@@Compare:
  cmp     edi, -4
  jle     @@Large          {Lenght(SubStr) >= 4}
  cmp     edi, -1
  je      @@SetResult      {Exit with Match if Lenght(SubStr) = 1}
  mov     ax, [ebp+edi]    {Last Char Matches - Compare First 2 Chars}
  cmp     ax, [edx+edi]
  jne     @@MainLoop       {No Match on First 2 Characters}
@@SetResult:               {Full Match}
  lea     eax, [edx+edi]   {Calculate and Return Result}
  mov     ebx, [esp]
  mov     edi, [esp+4]
  mov     esi, [esp+8]
  mov     ebp, [esp+12]
  sub     eax, [esp+16]
  add     esp, 20
  ret
@@NotFound:
  mov     edi, [esp+4]
  mov     esi, [esp+8]
  mov     ebp, [esp+12]
@@InvalidInput:
  mov     ebx, [esp]
  add     esp, 20
  xor     eax, eax         {Return 0}
  ret
@@Remainder:               {Check Last 1 to 4 Characters}
  mov     eax, [esi-3]     {Last 4 Characters of S - May include Length Bytes}
  xor     eax, ecx         {Zero Byte at each Matching Position}
  lea     ebx, [eax-$01010101]
  not     eax
  and     eax, ebx
  and     eax, $80808080   {Set Byte to $80 at each Match Position else $00}
  jz      @@NotFound       {No Match Possible}
  lea     eax, [edx-4]     {Check Valid Match Positions}
  cmp     cl, [eax]
  lea     edx, [eax+1]
  je      @@Compare
  cmp     edx, esi
  ja      @@NotFound
  lea     edx, [eax+2]
  cmp     cl, [eax+1]
  je      @@Compare
  cmp     edx, esi
  ja      @@NotFound
  lea     edx, [eax+3]
  cmp     cl, [eax+2]
  je      @@Compare
  cmp     edx, esi
  ja      @@NotFound
  lea     edx, [eax+4]
  jmp     @@Compare
@@Large:
  mov     eax, [ebp-4]     {Compare Last 4 Characters of S and SubStr}
  cmp     eax, [edx-4]
  jne     @@MainLoop       {No Match on Last 4 Characters}
  mov     ebx, edi
@@CompareLoop:             {Compare Remaining Characters}
  add     ebx, 4           {Compare 4 Characters per Loop}
  jge     @@SetResult      {All Characters Matched}
  mov     eax, [ebp+ebx-4]
  cmp     eax, [edx+ebx-4]
  je      @@CompareLoop    {Match on Next 4 Characters}
  jmp     @@MainLoop       {No Match}
end;

function LowerCase(const S: String): String; overload;
asm
       push  ebx
       push  esi
       push  edi
       mov   esi, eax          // s
       mov   eax, edx
       test  esi, esi
       jz    @Nil
       mov   edx, [esi-4]      // Length(s)
       mov   edi, eax          // @Result
       test  edx, edx
       jle   @Nil
       mov   ecx, [eax]
       mov   ebx, edx
       test  ecx, ecx
       jz    @Realloc          // Jump if Result not allocated
       test  edx, 3
       jnz   @Length3
       xor   edx, [ecx-4]
       cmp   edx, 3
       jbe   @TestRef
       jmp   @Realloc
@Length3:
       or    edx, 2
       xor   edx, [ecx-4]
       cmp   edx, 1
       ja    @Realloc
@TestRef:
       cmp   [ecx-8], 1
       je    @LengthOK         // Jump if Result RefCt=1
@Realloc:
       mov   edx, ebx
       or    edx, 3
       call  System.@LStrSetLength
@LengthOK:
       mov   edi, [edi]        // Result
       mov   [edi-4], ebx      // Correct Result length
       mov   byte ptr [ebx+edi], 0
       add   ebx, -1
       and   ebx, -4
       mov   eax, [ebx+esi]

@Loop: mov   ecx, eax
       or    eax, $80808080    // $C1..$DA
       mov   edx, eax
       sub   eax, $5B5B5B5B    // $66..$7F
       xor   edx, ecx          // $80
       or    eax, $80808080    // $E6..$FF
       sub   eax, $66666666    // $80..$99
       and   eax, edx          // $80
       shr   eax, 2            // $20
       xor   eax, ecx          // Lower
       mov   [ebx+edi], eax
       mov   eax, [ebx+esi-4]
       sub   ebx, 4
       jge   @Loop

       pop   edi
       pop   esi
       pop   ebx
       ret

@Nil:  pop   edi
       pop   esi
       pop   ebx
       jmp    System.@LStrClr   // Result:=''
end;

function UpperCase(const S: String): String; overload;
asm
       push  ebx
       push  esi
       push  edi
       mov   esi, eax          // s
       mov   eax, edx
       test  esi, esi
       jz    @Nil
       mov   edx, [esi-4]      // Length(s)
       mov   edi, eax          // @Result
       test  edx, edx
       jle   @Nil
       mov   ecx, [eax]
       mov   ebx, edx
       test  ecx, ecx
       jz    @Realloc          // Jump if Result not allocated
       test  edx, 3
       jnz   @Length3
       xor   edx, [ecx-4]
       cmp   edx, 3
       jbe   @TestRef
       jmp   @Realloc
@Length3:
       or    edx, 2
       xor   edx, [ecx-4]
       cmp   edx, 1
       ja    @Realloc
@TestRef:
       cmp   [ecx-8], 1
       je    @LengthOK         // Jump if Result RefCt=1
@Realloc:
       mov   edx, ebx
       or    edx, 3
       call  System.@LStrSetLength
@LengthOK:
       mov   edi, [edi]        // Result
       mov   [edi-4], ebx      // Correct Result length
       mov   byte ptr [ebx+edi], 0
       add   ebx, -1
       and   ebx, -4
       mov   eax, [ebx+esi]

@Loop: mov   ecx, eax
       or    eax, $80808080    // $E1..$FA
       mov   edx, eax
       sub   eax, $7B7B7B7B    // $66..$7F
       xor   edx, ecx          // $80
       or    eax, $80808080    // $E6..$FF
       sub   eax, $66666666    // $80..$99
       and   eax, edx          // $80
       shr   eax, 2            // $20
       xor   eax, ecx          // Upper
       mov   [ebx+edi], eax
       mov   eax, [ebx+esi-4]
       sub   ebx, 4
       jge   @Loop

       pop   edi
       pop   esi
       pop   ebx
       ret

@Nil:  pop   edi
       pop   esi
       pop   ebx
       jmp    System.@LStrClr   // Result:=''
end;

// move used by IntToStr() function!
procedure Move(const Source; var Dest; count: Integer); overload;
asm
  cmp     eax, edx
  je      @@Exit {Source = Dest}
  cmp     ecx, 32
  ja      @@LargeMove {Count > 32 or Count < 0}
  sub     ecx, 8
  jg      @@SmallMove
@@TinyMove: {0..8 Byte Move}
  jmp     dword ptr [@@JumpTable+32+ecx*4]
@@SmallMove: {9..32 Byte Move}
  fild    qword ptr [eax+ecx] {Load Last 8}
  fild    qword ptr [eax] {Load First 8}
  cmp     ecx, 8
  jle     @@Small16
  fild    qword ptr [eax+8] {Load Second 8}
  cmp     ecx, 16
  jle     @@Small24
  fild    qword ptr [eax+16] {Load Third 8}
  fistp   qword ptr [edx+16] {Save Third 8}
@@Small24:
  fistp   qword ptr [edx+8] {Save Second 8}
@@Small16:
  fistp   qword ptr [edx] {Save First 8}
  fistp   qword ptr [edx+ecx] {Save Last 8}
@@Exit:
  ret
  nop {4-Byte Align JumpTable}
  nop
@@JumpTable: {4-Byte Aligned}
  dd      @@Exit, @@M01, @@M02, @@M03, @@M04, @@M05, @@M06, @@M07, @@M08
@@LargeForwardMove: {4-Byte Aligned}
  push    edx
  fild    qword ptr [eax] {First 8}
  lea     eax, [eax+ecx-8]
  lea     ecx, [ecx+edx-8]
  fild    qword ptr [eax] {Last 8}
  push    ecx
  neg     ecx
  and     edx, -8 {8-Byte Align Writes}
  lea     ecx, [ecx+edx+8]
  pop     edx
@FwdLoop:
  fild    qword ptr [eax+ecx]
  fistp   qword ptr [edx+ecx]
  add     ecx, 8
  jl      @FwdLoop
  fistp   qword ptr [edx] {Last 8}
  pop     edx
  fistp   qword ptr [edx] {First 8}
  ret
@@LargeMove:
  jng     @@LargeDone {Count < 0}
  cmp     eax, edx
  ja      @@LargeForwardMove
  sub     edx, ecx
  cmp     eax, edx
  lea     edx, [edx+ecx]
  jna     @@LargeForwardMove
  sub     ecx, 8 {Backward Move}
  push    ecx
  fild    qword ptr [eax+ecx] {Last 8}
  fild    qword ptr [eax] {First 8}
  add     ecx, edx
  and     ecx, -8 {8-Byte Align Writes}
  sub     ecx, edx
@BwdLoop:
  fild    qword ptr [eax+ecx]
  fistp   qword ptr [edx+ecx]
  sub     ecx, 8
  jg      @BwdLoop
  pop     ecx
  fistp   qword ptr [edx] {First 8}
  fistp   qword ptr [edx+ecx] {Last 8}
@@LargeDone:
  ret
@@M01:
  movzx   ecx, [eax]
  mov     [edx], cl
  ret
@@M02:
  movzx   ecx, word ptr [eax]
  mov     [edx], cx
  ret
@@M03:
  mov     cx, [eax]
  mov     al, [eax+2]
  mov     [edx], cx
  mov     [edx+2], al
  ret
@@M04:
  mov     ecx, [eax]
  mov     [edx], ecx
  ret
@@M05:
  mov     ecx, [eax]
  mov     al, [eax+4]
  mov     [edx], ecx
  mov     [edx+4], al
  ret
@@M06:
  mov     ecx, [eax]
  mov     ax, [eax+4]
  mov     [edx], ecx
  mov     [edx+4], ax
  ret
@@M07:
  mov     ecx, [eax]
  mov     eax, [eax+3]
  mov     [edx], ecx
  mov     [edx+3], eax
  ret
@@M08:
  fild    qword ptr [eax]
  fistp   qword ptr [edx]
end;
// end of file functions (from old uFilesUtil.pas)

procedure CallShellExecute(Sender: TObject; Visibility: Word = SW_SHOWNORMAL);
var
  LinkStr: String;
begin
  if Sender is TLabel then
     LinkStr:= TLabel(Sender).Hint
  else
  if Sender is TShadowLabel then
     LinkStr:= TShadowLabel(Sender).Hint;

  ShellExecute(Application.Handle, 'open', PChar(LinkStr), nil, nil, Visibility);
end;

function GenerateZipErrorsMessage(const TitleMessage: String; ZipFilesList: TStrings): Integer;
begin
  CallMessageBox;
  FormMessageBox.PanelMessages.Tag:= 1;
  FormMessageBox.Caption:= 'Error: Zip File';
  FormMessageBox.LabelMessageTitle:= TitleMessage;
  FormMessageBox.LabelMessage.Clear;
  FormMessageBox.LabelMessage.Lines.AddStrings(ZipFilesList);

  FormMessageBox.ButtonYes.Caption:= 'Close';
  FormMessageBox.ButtonYes.Left:= 262;
  FormMessageBox.ButtonNo.Visible:= False;

  Result:= FormMessageBox.ShowModal;
  FreeMessageBox;
end;

function GenerateMessage(const WindowMessage, TitleMessage: WideString; const DescriptionMessage: WideString = ''; MessageType: Integer = 2; DefaultButtonNo: Boolean = False;
                         IconIndex: Integer = 0): Integer;
begin
  // icon index:
  // -1 -> Game Icon
  // 00 -> Info (default icon)
  // 01 -> Error
  // 02 -> Question
  // 03 -> Command Line
  CallMessageBox;
  FormMessageBox.PanelMessages.Tag:= IconIndex;
  FormMessageBox.Caption:= WindowMessage;
  FormMessageBox.LabelMessageTitle:= TitleMessage;

  if DescriptionMessage <> '' then
     begin
       FormMessageBox.LabelMessage.Lines.BeginUpdate;
       FormMessageBox.LabelMessage.Lines.Add(DescriptionMessage);
       FormMessageBox.LabelMessage.Lines.EndUpdate;
     end;
     
  if MessageType = 2 then
     begin
       FormMessageBox.ButtonYes.Caption:= 'Close';
       FormMessageBox.ButtonYes.Left:= 262;
       if FormMessageBox.Width < 720 then
          FormMessageBox.ButtonYes.Left:= 254;
       FormMessageBox.ButtonNo.Visible:= False;
     end;
  case DefaultButtonNo of
    True:
      begin
        with FormMessageBox do
        begin
          //ButtonYes.Default:= False;
          //ButtonNo.Default:= True;
          ActiveControl:= ButtonNo;
        end;
      end;
    False: FormMessageBox.ActiveControl:= FormMessageBox.ButtonYes;
  end;
  Result:= FormMessageBox.ShowModal;
  FreeMessageBox;
end;

procedure CallMessageBox;
begin
  if not Assigned(FormMessageBox) then
     FormMessageBox:= TFormMessageBox.Create(nil);
end;

procedure FreeMessageBox;
begin
  FreeAndNil(FormMessageBox);
end;

function GetSystemFileName(SystemID: Byte; FileID: Byte = 0; const SoftwareList: String = ''): String;
begin
  // FileID
  // 0 -> games list             "system_name.el'
  // 1 -> ROMs list              "system_name.elrom'
  // 2 -> games set status       "system_name.elstatus'
  // 3 -> missing files          "system_name.miss'
  // 4 -> wav/flac audio samples "system_name.elsamples'
  // 5 -> machines list+softlist "system_name.elsoftlist'
  Result:= '';
  case SystemID of
    idMAME      :
                  begin
                    if SoftwareList = '' then
                       Result:= 'mame'
                    else
                       Result:= SoftwareList;
                  end;
    idSupermodel: Result:= 'supermodelsegamodel3';
    idDaphne    : Result:= 'daphne';
    idDemul     : Result:= 'demul';
    idHBMAME    : Result:= 'hbmame';
    idDICE      : Result:= 'dice';
    idSegaModel2: Result:= 'segamodel2';
    idZiNc      : Result:= 'zinc';
  end;
  case FileID of
    0: Result:= Result+'.el';
    1: Result:= Result+'.elrom';
    2: Result:= Result+'.elstatus';
    3: Result:= Result+'.miss';
    4: Result:= Result+'.elsamples';
    5: Result:= Result+'.elsoftlist';
  end;
end;

{function GetSystemROMFileName(SystemID: Byte; const SoftwareList: String = ''): String;
begin
  Result:= '';
  case SystemID of
    idMAME      :
                  begin
                    if SoftwareList = '' then
                       Result:= 'mame.elrom'
                    else
                       Result:= SoftwareList+'.elrom';
                  end;
    idSupermodel: Result:= 'supermodelsegamodel3.elrom';
    //idDaphne: this system have no ROMs database in EL
    idDemul     : Result:= 'demul.elrom';
    idHBMAME    : Result:= 'hbmame.elrom';
    idDICE      : Result:= 'dice.elrom';
    idSegaModel2: Result:= 'segamodel2.elrom';
    idZiNc      : Result:= 'zinc.elrom';
  end;
end;}

procedure GenerateControllerDefinitionsFilesList(Folder: String; ListHolder: THashedStringList; ClearList: Boolean = False);
var
  Search: TSearchRec;
  Loop, EndIndex, IndexLastFolder: Integer;
  ControllerDescription, FileExt: String;
  Continue: Boolean;
begin
  if Folder = '' then
     Exit;

  ListHolder.BeginUpdate;
  if ClearList then
     ListHolder.Clear;
  Folder:= IncludeTrailingPathDelimiter(Folder);
  Continue:= True;
  if FindFirst(Folder+'*.*', $37, Search) = 0 then
     begin
       repeat
         // It's a directory?
         if (Search.Attr and $10 = $10) and (Search.Name <> '.') and
            (Search.Name <> '..') then
            GenerateControllerDefinitionsFilesList(Folder+Search.Name, ListHolder)
         else
            begin
              FileExt:= ExtractFileExt(Search.Name);
              if SameText(FileExt, '.zip') then
                 begin
                   Continue:= False;
                   ControllerDescription:= Search.Name;
                   ControllerDescription:= ChangeFileExt(ControllerDescription, '');
                   if ListHolder.IndexOf(ControllerDescription) = -1 then
                      ListHolder.Add(ControllerDescription);
                 end
              else
              case SameText(FileExt, '.ini') of
                True : Continue:= SameText(Search.Name, 'default.ini');
                False: Continue:= SameText(FileExt, '.cfg');
              end;

              if Continue then
                 begin
                   if SameText(FileExt, '.ini') then
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
                      end
                   else
                   if SameText(FileExt, '.cfg') then
                      ControllerDescription:= ChangeFileExt(Search.Name, '');
                   if ListHolder.IndexOf(ControllerDescription) = -1 then
                      ListHolder.Add(ControllerDescription);
                 end;
            end;
       until (FindNext(Search) <> 0);
     end;
  FindClose(Search);
  ListHolder.Sort;
  ListHolder.EndUpdate;
end;

procedure GetFilesList(Folder, FileType, FileMask: String; ListHolder: THashedStringList; SubDirectories, ClearList, ReturnFullPath: Boolean);
var
  Search: TSearchRec;
begin
  if Folder = '' then
     Exit;
  ListHolder.BeginUpdate;
  ListHolder.Sorted:= True;
  ListHolder.Duplicates:= dupIgnore;
  if ClearList then
     ListHolder.Clear;
  Folder:= IncludeTrailingPathDelimiter(Folder);
  if FindFirst(Folder+FileMask, $37, Search) = 0 then
     begin
       repeat
         // It's a directory?
         if (Search.Name <> '.') and (Search.Name <> '..') then
            begin
              if (Search.Attr and $10 = $10) and (SubDirectories) then
                 GetFilesList(Folder+Search.Name, FileType, FileMask, ListHolder, True, ClearList, ReturnFullPath)
              else
                 begin
                   if FileType = '.???' then
                      begin
                        if (Search.Attr and $10 <> $10) then
                           case ReturnFullPath of
                             True : ListHolder.Add(Folder+Search.Name);
                             False: ListHolder.Add(Search.Name);
                           end;
                      end
                   else
                   if SameText(ExtractFileExt(Search.Name), FileType) then
                      begin
                        case ReturnFullPath of
                          True : ListHolder.Add(Folder+Search.Name);
                          False: ListHolder.Add(Search.Name);
                        end;
                      end;
                 end;
            end;
       until (FindNext(Search) <> 0);
     end;
  FindClose(Search);
  ListHolder.EndUpdate;
end;

procedure GetFoldersList(Folder: String; ListHolder: THashedStringList; ClearList, SubDirectories: Boolean);
var
  Search: TSearchRec;
begin
  if Folder = '' then
     Exit;
  ListHolder.BeginUpdate;
  ListHolder.Sorted:= True;
  ListHolder.Duplicates:= dupIgnore;
  if ClearList then
     ListHolder.Clear;
  Folder:= IncludeTrailingPathDelimiter(Folder);

  if FindFirst(Folder+'*.*', $37, Search) = 0 then
     begin
       repeat
         // It's a directory?
         if (Search.Attr and $10 = $10) and (Search.Name <> '.') and
            (Search.Name <> '..') and (SubDirectories) then
            begin
              ListHolder.EndUpdate;
              GetFoldersList(Folder+Search.Name, ListHolder, False, True);
            end
         else
            begin
              ListHolder.Add(ExcludeTrailingPathDelimiter(Folder));
            end;
       until (FindNext(Search) <> 0);
     end;
  FindClose(Search);
  ListHolder.EndUpdate;
end;

function ExtractMAMEIniValue(const MAMEOption: String): String;
var
  Index: Integer;
begin
  Index:= PosEx(' ', MAMEOption);
  if Index <> 0 then
     begin
        Result:= MAMEOption;
        Delete(Result, 1, Index);
        Result:= Trim(Result);
     end
  else
     Result:= '';
end;

function GetGameHistory(const GameName, StringLine: String; TagLength: Integer): Boolean;
var
  Loop, StringSize: Integer;
  HistoryName: String;
begin
  Result:= False;
  HistoryName:= '';
  StringSize:= Length(StringLine);
  for Loop:=TagLength+2 to StringSize do
  begin
    if (StringLine[Loop] <> ',') and (Loop < StringSize) then
       HistoryName:= HistoryName+StringLine[Loop]
    else
       begin
         if (StringLine[Loop] <> ',') and (Loop = StringSize) then
            HistoryName:= HistoryName+StringLine[Loop];
         case SameText(Trim(HistoryName), GameName) of
           True:
             begin
               Result:= True;
               Break;
             end;
           False: HistoryName:= '';
         end;
       end;
  end;
end;

function GetPlayTime(Milliseconds: Int64; ShowHoursDays: Boolean = False; HideSeconds: Boolean = False): String;
var
  //Years, Months, Weeks: Int64;
  Days, Hours, Minutes, Seconds, Sec: Int64;
  //tLeft: Int64;
begin
{
from MAME Plus!

hour = temp / 3600;
	temp = temp - 3600*hour;
	minute = temp / 60; //Calc Minutes
	second = temp - 60*minute;

	if (hour == 0)
		swprintf(buf, TEXT("%d:%02d"), minute, second );
	else
		swprintf(buf, TEXT("%d:%02d:%02d"), hour, minute, second );
}
  Sec:= Milliseconds div 1000;
  Days:= Sec div (3600*24);

  //Weeks:= Days div 7;
  //Months:= Weeks div 4;
  //Years:= Months div 12;

  Hours:= (Sec-((Days*(3600*24)))) div 3600;
  Minutes:= (Sec-((Days*(3600*24))+(Hours*3600))) div 60;
  Seconds:= (Sec-((Days*(3600*24))+(Hours*3600)+(Minutes*60)));

  //case StatusTimer of
  //  True: Result:= Format('%.2d:%.2d', [Minutes, Seconds])
  //  False: Result:= Format('%.2d:%.2d min', [Minutes, Seconds]);
  //end;

  //if Days > 0 then
  //   begin
  //     Result:= Format('%d Years, %d Months, %d Weeks, %d Days, %.2d:%.2d:%.2d', [Years, Months, Weeks, Days, Hours, Minutes, Seconds]);
  //     Exit;
  //   end;
  case ShowHoursDays of
    True:
      begin
        case HideSeconds of
          False: Result:= Format('%.2d:%.2d:%.2d', [Hours, Minutes, Seconds]);
          True : Result:= Format('%.2d:%.2d', [Hours, Minutes]);
        end;
      end;
    False:
      begin
        Result:= Format('%.2d:%.2d', [Minutes, Seconds]);
      end;
  end;
  //if ShowHoursDays then
  //   Result:= Format('%.2d:%.2d:%.2d', [Hours, Minutes, Seconds])
  //else
  //   Result:= Format('%.2d:%.2d', [Minutes, Seconds]);
  if (Days > 0) and ShowHoursDays then
     begin
       if Days > 1 then
          Result:= IntToStr(Days)+' days, '+Result
       else
          Result:= IntToStr(Days)+' day, '+Result;
     end;
end;

function ComputeHashValueMemoryStream(Mode: Integer; const mStreamHolder: TMemoryStream): String;
var
  Checksum: TMessageDigest;
  Stream: TMemoryStream;
begin
  // "No Authentication" mode
  Result:= '';

  if ((Mode < Low(ChecksumMode)) or (Mode > High(ChecksumMode))) or
     (mStreamHolder = nil) then
     Exit;
  try
    Checksum:= ChecksumMode[Mode].Create;
    Stream:= TMemoryStream.Create;
    Stream.LoadFromStream(mStreamHolder);
    Stream.Seek(0, soFromBeginning);
    Checksum.TransformStream(Stream);
    Checksum.Complete;
    FreeAndNil(Stream);
    Result:= LowerCase(Checksum.HashValue);
    FreeAndNil(Checksum);
  except
    FreeAndNil(Stream);
    FreeAndNil(Checksum);
  end;
end;


function ComputeHashValue(Mode: Integer; const FileName: String): String;
var
  Checksum: TMessageDigest;
  Stream: TFileStream;
begin
  // "No Authentication" mode
  Result:= '';
  if ((Mode < Low(ChecksumMode)) or (Mode > High(ChecksumMode))) or
     (not FileExists(FileName)) then
     Exit;
  try
    Checksum:= ChecksumMode[Mode].Create;
    Stream:= TFileStream.Create(FileName, fmOpenRead or fmShareDenyNone);
    Stream.Seek(0, soFromBeginning);
    Checksum.TransformStream(Stream);
    Checksum.Complete;
    FreeAndNil(Stream);
    Result:= LowerCase(Checksum.HashValue);
    FreeAndNil(Checksum);
  except
    FreeAndNil(Stream);
    FreeAndNil(Checksum);
  end;
end;

function GetSHA1_ValueMemoryStream(const mStream: TMemoryStream): String;
begin
  Result:= '';
  if mStream = nil then
     Exit;
  try
    Result:= ComputeHashValueMemoryStream(3, mStream);
  except
    Result:= '';
  end;
end;

function GetSHA1_Value(const strFileName: String): String;
begin
  Result:= '';
  if not FileExists(strFileName) then
     Exit;
  try
    Result:= ComputeHashValue(3, strFileName);
  except
    Result:= '';
  end;
end;

function GetMD5_Value(const strFileName: String): String;
begin
  Result:= '';
  if not FileExists(strFileName) then
     Exit;
  try
    Result:= ComputeHashValue(2, strFileName);
  except
    Result:= '';
  end;
end;

function CheckAndCreateFolder(const FolderString: String): Boolean;
begin
  Result:= ForceDirectories(FolderString);
  //Result:= DirectoryExists(FolderString);
  //if not Result then
  //   Result:= ForceDirectories(FolderString);
end;

function CompareIntValue(const A, B: Int64): ShortInt;
begin
  if A = B then
     Result:= 0 // equal value
  else
  if A < B then
     Result:= -1
  else
     Result:= 1;
end;

function CompareFloatValue(const A, B: Extended): ShortInt;
begin
  if A = B then
     Result:= 0 // equal value
  else
  if A < B then
     Result:= -1
  else
     Result:= 1;
end;

function CompareTDateTime(const A, B: TDateTime): Integer;
begin
  if A = B then
     Result:= 0 // equal value
  else
  if A < B then
     Result:= -1
  else
     Result:= 1;
end;

procedure SetComboBoxEx(Holder: TComboBoxEx; ItemNumber: Integer; ResetSelection: Boolean = False);
begin
  if (Holder.ItemIndex = -1) or ResetSelection then
     begin
       Holder.ItemIndex:= ItemNumber;
       if Assigned(Holder.OnSelect) then
          Holder.OnSelect(nil);
     end;
end;

procedure SetComboBoxExImgIndex(Holder: TComboBoxEx; ImgIndex: Integer; ResetSelection: Boolean = False);
var
  Loop: ShortInt;
begin
  if (Holder.ItemIndex = -1) or ResetSelection then
     begin
       Holder.ItemIndex:= -1;
       for Loop:=0 to Holder.ItemsEx.Count-1 do
       begin
         if Holder.ItemsEx[Loop].ImageIndex = ImgIndex then
            begin
              Holder.ItemIndex:= Loop;
              Break;
            end;
       end;
       if Holder.ItemIndex = -1 then
          Holder.ItemIndex:= 0;
       if Assigned(Holder.OnSelect) then
          Holder.OnSelect(nil);
     end;
end;

procedure SetSelectedComboBox(sIndex: ShortInt; ComboBoxHolder: TComboBox);
begin
  ComboBoxHolder.ItemIndex:= sIndex;
  if Assigned(ComboBoxHolder.OnSelect) then
     ComboBoxHolder.OnSelect(ComboBoxHolder);
end;

function XML_CheckData(const strLine, FieldEntry: String): Boolean;
begin
  Result:= Copy(strLine, 1, Length(FieldEntry)) = FieldEntry;
end;

function XML_GetEntryName(const strLine: String): String;
var
  Index: Integer;
begin
  Result:= '';
  if strLine <> '' then
     begin
       if strLine[1] <> '#' then
          begin
            Index:= PosEx(' ', strLine);
            if Index <> 0 then
               Result:= Copy(strLine, 1, Index-1);
          end;
     end;
end;

function XML_GetEntryValue(const strLine, EntryName: String): String;
var
  strPosition: Integer;
begin
  Result:= '';
  if strLine <> '' then
     begin
       //strPosition:= Pos(EntryName+'="', strLine);
       strPosition:= PosEx(EntryName+'="', strLine);
       if strPosition <> 0 then
          begin
            strPosition:= strPosition+(Length(EntryName)+1);
            Result:= strLine;
            Delete(Result, 1, strPosition);
            //Result:= Copy(Result, 1, Pos('"', Result)-1);
            Result:= Copy(Result, 1, PosEx('"', Result)-1);
            if Result = '' then
               Result:= '';
          end;
     end;
end;

function ListInfo_GetEntryValue(strLine, EntryName, TagCharacter: String): String;
var
  strPosition: Integer;
begin
  Result:= '';
  if strLine <> '' then
     begin
       strPosition:= PosEx(EntryName+' ', strLine);
       //strPosition:= Pos(EntryName+' ', strLine);
       if strPosition <> 0 then
          begin
            strPosition:= strPosition+(Length(EntryName)+1);
            while (strLine[strPosition] <> TagCharacter) do
            begin
              Result:= Result+strLine[strPosition];
              Inc(strPosition);
              if strPosition > Length(strLine) then
                 Break;
            end;
          end;
     end;
end;

function SoftListGetEntryValue(strLine, EntryName: String): String;
var
  strPosition, strPosition2: Integer;
begin
  Result:= '';
  if strLine <> '' then
     begin
       // <title>3D Mine Storm</title>
       {strPosition:= Pos('<'+EntryName+'>', strLine);
       if strPosition <> 0 then
          begin
            strPosition2:= PosEx('</'+EntryName+'>', strLine, StrPosition);
            if strPosition2 = 0 then
               Exit;
            strPosition:= strPosition+Length(EntryName)+2;
            //strPosition2:= strPosition21;
            Result:= Copy(strLine, strPosition, (strPosition2-strPosition));
          end;}

       strPosition:= PosEx('<'+EntryName+'>', strLine);
       if strPosition <> 0 then
          begin
            //strPosition2:= PosEx('</'+EntryName+'>', strLine, StrPosition);
            strPosition2:= PosEx('/>', strLine, StrPosition);
            if strPosition2 = 0 then
               Exit;
            strPosition:= strPosition+Length(EntryName)+2;
            //strPosition2:= strPosition21;
            Result:= Copy(strLine, strPosition, (strPosition2-strPosition));
          end;
     end;

end;

// this function is used by the resolution list in SEGA Model 2 Emulator settings screen!
procedure ListScreenModes(ListHolder: TStrings; ResolutionOnly: Boolean = False);
var
  n: dWord;
  Mode: TDEVMODE;
  strOutput: String;
  AddMode: Boolean;
begin
  n:= 1;
  ListHolder.BeginUpdate;
  while EnumDisplaySettings(nil, n, Mode) do
  begin
    AddMode:= True;
    // false return width X height @ refresh
    strOutput:= IntToStr(Mode.dmPelsWidth)+'x'+IntToStr(Mode.dmPelsHeight);
    if not ResolutionOnly then
       strOutput:= strOutput+'@'+IntToStr(Mode.dmDisplayFrequency);

    if ResolutionOnly and (Mode.dmBitsPerPel <> 32) then
       AddMode:= False;

    if AddMode then
       begin
         if ListHolder.IndexOf(strOutput) = -1 then
            ListHolder.Add(strOutput);
       end;
    Inc(n);
  end;
  ListHolder.EndUpdate;
  {
  IntToStr(Mode.dmPelsWidth)+'x'+IntToStr(Mode.dmPelsHeight)+'@'+
  IntToStr(Mode.dmDisplayFrequency)+'Hz '+
  IntToStr(Mode.dmBitsPerPel)+' bits');
  }
end;

function GetScrLayoutSectionOld(LayoutIndex: Byte): String;
begin
  case LayoutIndex of
    0: Result:= 'Single';
    1: Result:= 'Dual [Layout 1]';
    2: Result:= 'Dual [Layout 2]';
    3: Result:= 'Triple [Layout 1]';
    4: Result:= 'Triple [Layout 2]';
    5: Result:= 'Triple [Layout 3]';
    6: Result:= 'Triple [Layout 4]';
    7: Result:= 'Triple [Layout 5]';
    8: Result:= 'Triple [Layout 6]';

    { 9: Result:= 'Quad [Layout 1]';
    10: Result:= 'Quad [Layout 2]';
    11: Result:= 'Quad [Layout 3]';
    12: Result:= 'Quad [Layout 4]';
    13: Result:= 'Quad [Layout 5]';
    14: Result:= 'Quad [Layout 6]';
    15: Result:= 'Quad [Layout 7]';
    16: Result:= 'Quad [Layout 8]';
    17: Result:= 'Quad [Layout 9]';
    18: Result:= 'Quad [Layout 10]';
    19: Result:= 'Quad [Layout 11]';
    20: Result:= 'Quad [Layout 12]';
    21: Result:= 'Quad [Layout 13]';
    22: Result:= 'Quad [Layout 14]';
    23: Result:= 'Quad [Layout 15]';}
  end;
end;

function GetScrLayoutSection(LayoutIndex: Byte): String;
begin
  case LayoutIndex of
    0: Result:= 'Single';
    1: Result:= 'Dual [Layout 1]';
    2: Result:= 'Dual [Layout 2]';
    3: Result:= 'Triple [Layout 1]';
    4: Result:= 'Triple [Layout 2]';
    5: Result:= 'Triple [Layout 3]';
    6: Result:= 'Triple [Layout 4]';
    7: Result:= 'Triple [Layout 5]';
    8: Result:= 'Triple [Layout 6]';

    { 9: Result:= 'Quad [Layout 1]';
    10: Result:= 'Quad [Layout 2]';
    11: Result:= 'Quad [Layout 3]';
    12: Result:= 'Quad [Layout 4]';
    13: Result:= 'Quad [Layout 5]';
    14: Result:= 'Quad [Layout 6]';
    15: Result:= 'Quad [Layout 7]';
    16: Result:= 'Quad [Layout 8]';
    17: Result:= 'Quad [Layout 9]';
    18: Result:= 'Quad [Layout 10]';
    19: Result:= 'Quad [Layout 11]';
    20: Result:= 'Quad [Layout 12]';
    21: Result:= 'Quad [Layout 13]';
    22: Result:= 'Quad [Layout 14]';
    23: Result:= 'Quad [Layout 15]';}
  end;
end;

function GetScrLayoutImageFile(LayoutIndex: Byte; ImageExtension: Boolean = True): String;
begin
  case LayoutIndex of
    0: Result:= 'img1_layout1';
    1: Result:= 'img2_layout1';
    2: Result:= 'img2_layout2';
    3: Result:= 'img3_layout1';
    4: Result:= 'img3_layout2';
    5: Result:= 'img3_layout3';
    6: Result:= 'img3_layout4';
    7: Result:= 'img3_layout5';
    8: Result:= 'img3_layout6';

    { 9: Result:= 'img4_layout1';
    10: Result:= 'img4_layout2';
    11: Result:= 'img4_layout3';
    12: Result:= 'img4_layout4';
    13: Result:= 'img4_layout5';
    14: Result:= 'img4_layout6';
    15: Result:= 'img4_layout7';
    16: Result:= 'img4_layout8';
    17: Result:= 'img4_layout9';
    18: Result:= 'img4_layout10';
    19: Result:= 'img4_layout11';
    20: Result:= 'img4_layout12';
    21: Result:= 'img4_layout13';
    22: Result:= 'img4_layout14';
    23: Result:= 'img4_layout15';}
  end;
  case ImageExtension of
    True : Result:= Result+'.png';
    False: Result:= Result+'.ico';
  end;
end;

function GetScrLayoutDefaultType(LayoutIndex, ImageIndex: Byte): ShortInt;
begin
  Result:= -1;
  case LayoutIndex of
    0: Result:= 1; // Single
    1, 2: // Dual [Layout 1] >---< Dual [Layout 2]
      begin
        case ImageIndex of
          1: Result:= 1;
          2: Result:= 0;
        end;
      end;
    3: // Triple [Layout 1]
      begin
        case ImageIndex of
          1: Result:= 1;
          2: Result:= 0;
          3: Result:= 3;
        end;
      end;
    4: // Triple [Layout 2]
      begin
        case ImageIndex of
          1: Result:= 1;
          2: Result:= 0;
          3: Result:= 4;
        end;
      end;
    5, 6: // Triple [Layout 3] >---< Triple [Layout 4]
      begin
        case ImageIndex of
          1: Result:= 1;
          2: Result:= 0;
          3: Result:= 2;
        end;
      end;
    7, 8: // Triple [Layout 5] >---< Triple [Layout 6]
      begin
        case ImageIndex of
          1: Result:= 1;
          2: Result:= 3;
          3: Result:= 4;
        end;
      end;
  end;
end;

{function Is64BitOS: Boolean;
begin
  Result:= SizeOf(Pointer) = 8; // this validation does NOT work!!!
end;}

{
function GetWindowsVersion: String;
var
   WindowsInfo: TOSVersionInfo;
begin
    WindowsInfo.dwOSVersionInfoSize:= SizeOf(OSVERSIONINFO);
    GetVersionEx(WindowsInfo);
    case WindowsInfo.dwPlatformId of
      VER_PLATFORM_WIN32_NT:
         begin
           case WindowsInfo.dwMajorVersion of
             4: Result:=  'Microsoft Windows NT';
             5:
               begin
                 case WindowsInfo.dwMinorVersion of
                   0: Result:= 'Microsoft Windows 2000';
                   1: Result:= 'Microsoft Windows XP';
                   2: Result:= 'Microsoft Windows 2003';
                 end;
               end;
             6:
               begin
                 case WindowsInfo.dwMinorVersion of
                   0: Result:= 'Microsoft Windows Vista';
                   1: Result:= 'Microsoft Windows 7';
                 end;
           end;
         end;
      VER_PLATFORM_WIN32_WINDOWS:
         begin
           // no need to check for dwMajorVersion... it's always 4
           case WindowsInfo.dwMajorVersion of
             4:
               begin
                 case WindowsInfo.dwMinorVersion of
                    0: Result:= 'Microsoft Windows 95';
                   10: Result:= 'Microsoft Windows 98';
                   90: Result:= 'Microsoft Windows ME';
                 end;
               end;
           end;
         end;
    end;
end;
}
// FileExists need fix for Delphi 7... for Delphi 2007 they are already fixed!!!!!
function FileExists(const FileName: String): Boolean;
var
  Code: Cardinal;
begin
  // faster than original Delphi 7 "FileExists()" function
  Code:= GetFileAttributes(PChar(FileName));
  //Result:= (FILE_ATTRIBUTE_DIRECTORY and Code = 0);
  Result:= (Code <> -1) and (FILE_ATTRIBUTE_DIRECTORY and Code = 0);
  // Code will never return negative values!!!
end;

// RenameFile fix for Windows 7 (Delphi 7 function fails constantly)
function RenameFile(const OldName, NewName: String; OverwriteExistingFile: Boolean = True): Boolean;
var
  rFlags: Cardinal;
begin
  rFlags:= MOVEFILE_COPY_ALLOWED+MOVEFILE_WRITE_THROUGH;
  if OverwriteExistingFile then
     rFlags:= rFlags+MOVEFILE_REPLACE_EXISTING;

  Result:= MoveFileEx(PAnsiChar(OldName), PAnsiChar(NewName), rFlags);
           //MOVEFILE_COPY_ALLOWED
           //+MOVEFILE_REPLACE_EXISTING
           //+MOVEFILE_WRITE_THROUGH);
end;

function MoveFile(const OldName, NewName: String; OverwriteExisting: Boolean): Boolean;
var
  flags: Cardinal;
begin
  flags:= MOVEFILE_COPY_ALLOWED+MOVEFILE_WRITE_THROUGH;
  if OverwriteExisting then
     flags:= flags+MOVEFILE_REPLACE_EXISTING;
  Result:= MoveFileEx(PAnsiChar(OldName), PAnsiChar(NewName),
           flags);//MOVEFILE_COPY_ALLOWED
           //+MOVEFILE_REPLACE_EXISTING
           //+MOVEFILE_WRITE_THROUGH);
end;

procedure SetDefaultColorBox(ColorHolder: TColorBox);
begin
  ColorHolder.Selected:= ColorHolder.DefaultColorColor;
  if Assigned(ColorHolder.OnSelect) then
     ColorHolder.OnSelect(ColorHolder);
end;

function SelectDirectoryShell(const Caption: String; RecursiveSubFolders: Boolean; out Directory: String; out AddSubFolders: Boolean): Boolean;
begin
  if not Assigned(FormSelectDirectory) then
     FormSelectDirectory:= TFormSelectDirectory.Create(nil);
  FormSelectDirectory.AddSubFolders.Visible:= RecursiveSubFolders;
  FormSelectDirectory.LabelTitle.Caption:= Caption;
  Result:= FormSelectDirectory.ShowModal = mrOK;
  case Result of
    True:
      begin
        Directory:= FormSelectDirectory.ShellTree.SelectedFolder.PathName;
        AddSubFolders:= FormSelectDirectory.AddSubFolders.Checked;
      end;
    False: Directory:= '';
  end;
  FreeAndNil(FormSelectDirectory);
end;

procedure CallMaximizeWindow(FormHolder: TForm);
begin
  FormHolder.Left:= (Screen.Width shr 1)-(FormHolder.Width shr 1)-1;
  FormHolder.Top:= 30;
  FormHolder.Height:= Screen.Height-95;
end;

procedure SetEditBkColor(EditHolder: TEdit);
begin
  EditHolder.Color:= $e67878; // -> 15104120; RGB(120, 120, 255)
  EditHolder.SetFocus;
end;

function IsEditEditing(EditHolder: TEdit): Boolean;
begin
  Result:= EditHolder.Color = $e67878;
end;

//procedure BrowseEditBkColor(EditHolder: TEdit);
//begin
//  EditHolder.Color:= $00fafafa;
//end;

function ShortDirString(const FileFullPath: String; MaxLength: Integer): String;
var
  NewPathStr, FileName: String;
  NewLength: Integer;
begin
  if Length(FileFullPath) <= MaxLength then
     begin
       Result:= FileFullPath;
       Exit;
     end;
  FileName:= ExtractFileName(FileFullPath);
  NewLength:= MaxLength-Length(FileName);
  NewPathStr:= Copy(FileFullPath, 1, NewLength)+'...\'+FileName;
  Result:= NewPathStr;
end;

{
function SetScreenAspectRatio(ImageHolder: TBitmap32; out FixedWidth, FixedHeight: Integer): Boolean;
var
  driverPixelX, driverPixelY,
  //snapPixelX, snapPixelY,
  //realPixelX, realPixelY,
  aspectX, aspectY,
  Position: Integer;
begin
  Position:= Pos('x', MemGameInfo.eScreenResolution);
  driverPixelX:= StrToInt(Copy(MemGameInfo.eScreenResolution, 1, Position-1));
  driverPixelY:= StrToInt(Copy(MemGameInfo.eScreenResolution, Position+1, Length(MemGameInfo.eScreenResolution)-Position));
  if ((driverPixelX <> ImageHolder.Width) and (driverPixelY <> ImageHolder.Height)) and
     ((ImageHolder.Width > driverPixelX) or (ImageHolder.Height > driverPixelY)) then
     Exit;

  if driverPixelX >= driverPixelY then
     begin
       aspectX:= 4;
       aspectY:= 3;
     end
  else
  if driverPixelX < driverPixelY then
     begin
       aspectX:= 3;
       aspectY:= 4;
     end;
  //if (snapPixelX < 1) or (snapPixelY < 1) then
  //   begin
  //     snapPixelX:= ResWidth;
  //     snapPixelY:= ResHeight;
  //   end;

  //realPixelX:= ImageHolder.Width;
  //realPixelY:= ImageHolder.Height;

  if (Round(driverPixelY / 2 ) = ImageHolder.Height) and (ImageHolder.Width = driverPixelX) then // cropped playchoice, etc
     begin
       // "aquarush 640x240 driver 640x480 enters this case but height is not resized
       if (ImageHolder.Width / aspectX) > (ImageHolder.Height / (aspectY / 2)) then
          begin
            FixedHeight:= Round((ImageHolder.Width / aspectX) * (aspectY / 2));
            FixedWidth:= ImageHolder.Width;
          end
       else
          begin
            FixedWidth:= Round((ImageHolder.Height / (aspectY / 2)) * aspectX);
            FixedHeight:= ImageHolder.Height;
          end;
     end
  else
  if (Round(driverPixelX / 2 ) = ImageHolder.Width) and (ImageHolder.Height = driverPixelY) then // lode runner, etc
     begin
       if (ImageHolder.Width / (aspectX / 2)) > (ImageHolder.Height / aspectY) then
          begin
            FixedHeight:= Round((ImageHolder.Width / (aspectX / 2)) * aspectY);
            FixedWidth:= ImageHolder.Width;
          end
       else
          begin
            FixedWidth:= Round((ImageHolder.Height / aspectY) * (aspectX / 2));
            FixedHeight:= ImageHolder.Height;
          end;
     end
  else
  if (ImageHolder.Width / aspectX) <> (ImageHolder.Height / aspectY) then
     begin
       if (ImageHolder.Width / aspectX) > (ImageHolder.Height / aspectY) then
          begin
             FixedHeight:= Round((ImageHolder.Width / aspectX) * aspectY);
             FixedWidth:= ImageHolder.Width;
          end
       else
          begin
            FixedWidth:= Round((ImageHolder.Height / aspectY) * aspectX);
            FixedHeight:= ImageHolder.Height;
          end;
     end;
end;

// Originally written by Horst Kniebusch, modified by alioth to make it(alot) faster.
// usage: Antialiasing(Image1, 80);

procedure Antialiasing(Image: TImage; Percent: Integer);
type
  TRGBTripleArray = array[0..32767] of TRGBTriple;
  PRGBTripleArray = ^TRGBTripleArray;
var
  SL, SL2: PRGBTripleArray;
  l, m, p: Integer;
  R, G, B: TColor;
  R1, R2, G1, G2, B1, B2: Byte;
begin
  with Image.Canvas do
  begin
    Brush.Style  := bsClear;
    Pixels[1, 1] := Pixels[1, 1];
    for l := 0 to Image.Height - 1 do
    begin
      SL := Image.Picture.Bitmap.ScanLine[l];
      for p := 1 to Image.Width - 1 do
      begin
        R1 := SL[p].rgbtRed;
        G1 := SL[p].rgbtGreen;
        B1 := SL[p].rgbtBlue;

        // Left
        if (p < 1) then m := Image.Width
        else
          m := p - 1;
        R2 := SL[m].rgbtRed;
        G2 := SL[m].rgbtGreen;
        B2 := SL[m].rgbtBlue;
        if (R1 <> R2) or (G1 <> G2) or (B1 <> B2) then
        begin
          R := Round(R1 + (R2 - R1) * 50 / (Percent + 50));
          G := Round(G1 + (G2 - G1) * 50 / (Percent + 50));
          B := Round(B1 + (B2 - B1) * 50 / (Percent + 50));
          SL[m].rgbtRed := R;
          SL[m].rgbtGreen := G;
          SL[m].rgbtBlue := B;
        end;

        //Right
        if (p > Image.Width - 2) then m := 0
        else
          m := p + 1;
        R2 := SL[m].rgbtRed;
        G2 := SL[m].rgbtGreen;
        B2 := SL[m].rgbtBlue;
        if (R1 <> R2) or (G1 <> G2) or (B1 <> B2) then
        begin
          R := Round(R1 + (R2 - R1) * 50 / (Percent + 50));
          G := Round(G1 + (G2 - G1) * 50 / (Percent + 50));
          B := Round(B1 + (B2 - B1) * 50 / (Percent + 50));
          SL[m].rgbtRed := R;
          SL[m].rgbtGreen := G;
          SL[m].rgbtBlue := B;
        end;

        if (l < 1) then m := Image.Height - 1
        else
          m := l - 1;
        //Over
        SL2 := Image.Picture.Bitmap.ScanLine[m];
        R2  := SL2[p].rgbtRed;
        G2  := SL2[p].rgbtGreen;
        B2  := SL2[p].rgbtBlue;
        if (R1 <> R2) or (G1 <> G2) or (B1 <> B2) then
        begin
          R := Round(R1 + (R2 - R1) * 50 / (Percent + 50));
          G := Round(G1 + (G2 - G1) * 50 / (Percent + 50));
          B := Round(B1 + (B2 - B1) * 50 / (Percent + 50));
          SL2[p].rgbtRed := R;
          SL2[p].rgbtGreen := G;
          SL2[p].rgbtBlue := B;
        end;

        if (l > Image.Height - 2) then m := 0
        else
          m := l + 1;
        //Under
        SL2 := Image.Picture.Bitmap.ScanLine[m];
        R2  := SL2[p].rgbtRed;
        G2  := SL2[p].rgbtGreen;
        B2  := SL2[p].rgbtBlue;
        if (R1 <> R2) or (G1 <> G2) or (B1 <> B2) then
        begin
          R := Round(R1 + (R2 - R1) * 50 / (Percent + 50));
          G := Round(G1 + (G2 - G1) * 50 / (Percent + 50));
          B := Round(B1 + (B2 - B1) * 50 / (Percent + 50));
          SL2[p].rgbtRed := R;
          SL2[p].rgbtGreen := G;
          SL2[p].rgbtBlue := B;
        end;
      end;
    end;
  end;
end;}

function DarkenColor(Color: TColor; Perc: integer): TColor;
var
  r, g, b: Integer;//longint;
  l: longint;
begin
  l := ColorToRGB(Color);
  r := ((l AND $FF0000) shr 16) and $FF;
  g := ((l AND $FF00) shr 8) and $FF;
  b := (l AND $FF);

  r := Round(r * (100 - Perc)/100);
  g := Round(g * (100 - Perc)/100);
  b := Round(b * (100 - Perc)/100);

  Result := (r shl 16) or (g shl 8) or b;
end;

function BrightnessColor(Col: TColor; Brightness: Integer): TColor; overload;
var
  r1, g1, b1: Integer;
begin
  Col := ColorToRGB(Col);
  r1 := GetRValue(Col);
  g1 := GetGValue(Col);
  b1 := GetBValue(Col);

  if r1 = 0 then
    r1 := Max(0,Brightness)
  else
    r1 := Round( Min(100,(100 + Brightness))/100 * r1 );

  if g1 = 0 then
    g1 := Max(0,Brightness)
  else
    g1 := Round( Min(100,(100 + Brightness))/100 * g1 );

  if b1 = 0 then
    b1 := Max(0,Brightness)
  else
    b1 := Round( Min(100,(100 + Brightness))/100 * b1 );

  Result := RGB(r1,g1,b1);
end;

function BrightnessColor(Col: TColor; BR, BG, BB: Integer): TColor; overload;
var
  r1, g1, b1: Integer;
begin
  Col := Longint(ColorToRGB(Col));
  r1 := GetRValue(Col);
  g1 := GetGValue(Col);
  b1 := GetBValue(Col);

  if r1 = 0 then
    r1 := Max(0,BR)
  else
    r1 := Round( Min(100,(100 + BR))/100 * r1 );

  if g1 = 0 then
    g1 := Max(0,BG)
  else
    g1 := Round( Min(100,(100 + BG))/100 * g1 );

  if b1 = 0 then
    b1 := Max(0,BB)
  else
    b1 := Round( Min(100,(100 + BB))/100 * b1 );

  Result := RGB(r1,g1,b1);
end;

function Blend(Color1, Color2: TColor; A: Byte): TColor;
var
  c1, c2: Integer; //LongInt;
  R, G, B, v1, v2: Byte;
begin
  A := Round(2.55 * A);
  c1 := ColorToRGB(Color1);
  c2 := ColorToRGB(Color2);
  v1 := Byte(c1);
  v2 := Byte(c2);
  R := Byte(A * (v1 - v2) shr 8 + v2);
  v1 := Byte(c1 shr 8);
  v2 := Byte(c2 shr 8);
  G := Byte(A * (v1 - v2) shr 8 + v2);
  v1 := Byte(c1 shr 16);
  v2 := Byte(c2 shr 16);
  B := Byte(A * (v1 - v2) shr 8 + v2);
  Result := (B shl 16) + (G shl 8) + R;
end;

function GetAppIcon(const appEmuFile: String; ImageListHolder: TImageList; ReplaceIndex: Integer = -1): Integer;
var
  appIcon: TIcon;
  //wIc: Word;
begin
  Result:= -1;
  appIcon:= TIcon.Create;
  appIcon.Width:= ImageListHolder.Width;
  appIcon.Height:= ImageListHolder.Height;
  appIcon.Handle:= ExtractIcon(Application.Handle, PChar(appEmuFile), 0);
  if not appIcon.Empty then
     begin
       if ReplaceIndex <> -1 then
          begin
            Result:= ReplaceIndex;
            ImageListHolder.ReplaceIcon(ReplaceIndex{3}, appIcon);
          end
       else
          Result:= ImageListHolder.AddIcon(appIcon);
     end;
   appIcon.ReleaseHandle;
   FreeAndNil(appIcon);
end;

{function GetAppIcon(const appEmuFile: String; IconHolder: TIcon; ImageListHolder: TImageList; ReplaceIndex: Integer = -1): Integer;
var
  appIcon: TIcon;
  //wIc: Word;
begin
  Result:= -1;
  appIcon:= TIcon.Create;
  appIcon.Width:= ImageListHolder.Width;
  appIcon.Height:= ImageListHolder.Height;
  appIcon.Handle:= ExtractIcon(Application.Handle, PChar(appEmuFile), 0);
  if not appIcon.Empty then
     begin
       if IconHolder <> nil then
          begin
            IconHolder.Assign(appIcon);
          end
       else
          begin
            if ReplaceIndex <> -1 then
               begin
                 Result:= ReplaceIndex;
                 ImageListHolder.ReplaceIcon(ReplaceIndex, appIcon);
               end
            else
               Result:= ImageListHolder.AddIcon(appIcon);
          end;
     end;
   appIcon.ReleaseHandle;
   FreeAndNil(appIcon);
end;}

function GetExtIcon(const FileExtension: String; ImageListHolder: TImageList): Integer;
var
  appIcon: TIcon;
  AInfo: TSHFileInfo;
begin
  Result:= -1;
  appIcon:= TIcon.Create;
  appIcon.Width:= ImageListHolder.Width;
  appIcon.Height:= ImageListHolder.Height;

  if SHGetFileInfo(PChar(FileExtension), FILE_ATTRIBUTE_NORMAL, AInfo, SizeOf(AInfo),
                   SHGFI_SYSICONINDEX or SHGFI_ICON or SHGFI_LARGEICON or SHGFI_USEFILEATTRIBUTES) <> 0 then
     begin
       try
         appIcon.Handle:= AInfo.hIcon;
         Result:= ImageListHolder.AddIcon(appIcon);
       finally
         appIcon.ReleaseHandle;
         FreeAndNil(appIcon);
         DestroyIcon(AInfo.hIcon);
       end;
     end;
end;

function GetAssociatedApp(fileExtension: String; ReturnExeFileOnly: Boolean = False): String;
var
  sExtDesc: String;
begin
  Result:= '';
  with TRegistry.Create do
  begin
    try
      RootKey:= HKEY_CLASSES_ROOT;
      if OpenKeyReadOnly(fileExtension) then
         begin
           sExtDesc:= ReadString('');
           CloseKey;
         end;
      if sExtDesc <> '' then
         begin
           if OpenKeyReadOnly(sExtDesc+'\Shell\Open\Command') then
              Result:= ReadString('');
         end;
    finally
      Free;
    end;
  end;

  if (Result <> '') and ReturnExeFileOnly then
     begin
       if Result[1] = '"' then
          Result:=Copy(Result, 2, -1+PosEx('"', Copy(Result, 2, MaxInt))) ;
     end;
end;

{
// for Unicode filenames
var
  ofn: TOpenFilenameW;
  FileName: array [0..MAX_PATH-1] of WideChar;
begin
  FillChar(ofn, SizeOf(ofn), 0);
  ofn.lStructSize := SizeOf(ofn);
  ofn.hWndOwner := Handle;
  ofn.lpstrFilter := 'All files'#0'*.*'#0;
  FileName[0] := #0;
  ofn.lpstrFile := @FileName;
  ofn.nMaxFile := Length(FileName);
  ofn.lpstrTitle := 'Select File';
  if GetOpenFileNameW(ofn) then
    MessageBoxW(Handle, FileName, nil, MB_OK);
}

function OpenSaveFileDialog(Parent: TWinControl; const DefExt, Filter, InitialDir, Title: string; var FileName: string;
                            MustExist, OverwritePrompt, NoChangeDir, DoOpen: Boolean): Boolean;
var
  ofn: TOpenFileName;
  szFile: array[0..MAX_PATH] of Char;
begin
  Result:= False;
  FillChar(ofn, SizeOf(TOpenFileName), 0);
  with ofn do
  begin
    lStructSize:= SizeOf(TOpenFileName);
    hwndOwner:= Application.Handle; // 2013: fix for modal forms
    //hwndOwner := Parent.Handle;
    lpstrFile:= szFile;
    nMaxFile:= SizeOf(szFile);
    if (Title <> '') then
      lpstrTitle:= PChar(Title);
    if (InitialDir <> '') then
      lpstrInitialDir:= PChar(InitialDir);
    StrPCopy(lpstrFile, FileName);
    lpstrFilter:= PChar( StringReplace(Filter, '|', #0, [rfReplaceAll]) +#0#0 );
    if DefExt <> '' then
      lpstrDefExt:= PChar(DefExt);
  end;

  ofn.Flags:= ofn.Flags or OFN_DONTADDTORECENT or OFN_EXPLORER;
  if MustExist then
    ofn.Flags:= ofn.Flags or OFN_FILEMUSTEXIST;

  if OverwritePrompt then
    ofn.Flags:= ofn.Flags or OFN_OVERWRITEPROMPT;

  if NoChangeDir then
    ofn.Flags:= ofn.Flags or OFN_NOCHANGEDIR;

  if DoOpen then
  begin
    if GetOpenFileName(ofn) then
    begin
      Result:= True;
      FileName:= StrPas(szFile);
    end;
  end
  else
  begin
    if GetSaveFileName(ofn) then
    begin
      Result:= True;
      FileName:= StrPas(szFile);
    end;
  end
end;

function GetFileTypeStr(const strFilename: String): String;
var
  FileInfo: TSHFileInfo;
begin
  FillChar(FileInfo, SizeOf(FileInfo), #0);
  SHGetFileInfo(PChar(strFilename), 0, FileInfo, SizeOf(FileInfo), SHGFI_TYPENAME);
  Result:= FileInfo.szTypeName;
end;

function GetWinTempDir: String;
{$IFDEF WIN32}
var
  Buffer: array[0..1023] of Char;
begin
  SetString(Result, Buffer, GetTempPath(SizeOf(Buffer), Buffer));
{$ELSE}
var
  Buffer: array[0..255] of Char;
begin
  GetTempFileName(GetTempDrive(#0), '$', 1, Buffer);
  Result:= ExtractFilePath(StrPas(Buffer));
{$ENDIF}
  Delete(Result, Length(Result), 1);
end;

function GetWindowsDir: String;
{$IFDEF WIN32}
var
  Buffer: array[0..1023] of Char;
begin
  SetString(Result, Buffer, GetWindowsDirectory(Buffer, SizeOf(Buffer)));
{$ELSE}
begin
  Result[0]:= Char(GetWindowsDirectory(@Result[1], 254));
{$ENDIF}
end;

function GetSystemDir: String;
{$IFDEF WIN32}
var
  Buffer: array[0..1023] of Char;
begin
  SetString(Result, Buffer, GetSystemDirectory(Buffer, SizeOf(Buffer)));
{$ELSE}
begin
  Result[0]:= Char(GetSystemDirectory(@Result[1], 254));
{$ENDIF}
end;

function GetMyDocuments: string;
var
  r: Bool;
  path: array[0..Max_Path] of Char;
begin
  r:= ShGetSpecialFolderPath(0, path, CSIDL_Personal, False) ;
  if not r then
     raise Exception.Create('Could not find MyDocuments folder location!');
  Result:= Path;
end;

{function ProcessExists(const exeFileName: string): Boolean;
var
  ContinueLoop: BOOL;
  FSnapshotHandle: THandle;
  FProcessEntry32: TProcessEntry32;
begin
  FSnapshotHandle:= CreateToolhelp32Snapshot(TH32CS_SNAPPROCESS, 0);
  FProcessEntry32.dwSize:= SizeOf(FProcessEntry32);
  ContinueLoop:= Process32First(FSnapshotHandle, FProcessEntry32);
  Result:= False;
  while Integer(ContinueLoop) <> 0 do
  begin
    if ((UpperCase(ExtractFileName(FProcessEntry32.szExeFile)) =
      UpperCase(ExeFileName)) or (UpperCase(FProcessEntry32.szExeFile) =
      UpperCase(ExeFileName))) then
    begin
      Result:= True;
    end;
    ContinueLoop:= Process32Next(FSnapshotHandle, FProcessEntry32);
  end;
  CloseHandle(FSnapshotHandle); 
end;}

procedure PopulateScreenResolution(DestList: TComboBox; AddAutoText: Boolean = False);
var
  ScreenResolutions: TStringList;
begin
  ScreenResolutions:= TStringList.Create;
  ListScreenModes(ScreenResolutions, True);
  ScreenResolutions.BeginUpdate;
  ScreenResolutions.CustomSort(CompareStringListNatural);
  DestList.Items.BeginUpdate;
  if AddAutoText then
     DestList.Items.Add('Auto');
  DestList.Items.AddStrings(ScreenResolutions);
  DestList.Items.EndUpdate;
  DestList.ItemIndex:= 0;
  FreeAndNil(ScreenResolutions);
end;

function CompareStringListNatural(sList: TStringList; Index1, Index2: Integer): Integer;
begin
  Result:= NaturalCompareText(sList[Index1], sList[Index2]);
end;

function NaturalCompareText(const Text1, Text2: WideString): Integer;
begin
  if (Text1 = '') or (Text2 = '') then
     begin
       // this is needed so empty texts will
       // ALWAYS be put at top for ascending sort and at bottom for descending sort
       if (Text1 = '') and (Text2 = '') then
          Result:= 0 // Text1 = Text2
       else
       if (Text1 = '') and (Text2 <> '') then
          Result:= -1 // Text 1 < Text2
       else
          Result:= 1; // Text 1 > Text2
     end
  else
     begin
       Result:= StrCmpLogicalW(PWideChar(Text1), PWideChar(Text2));
     end;
end;

// WideString functions!!!
function GetFileInfoW(FName, InfoType: WideString): String;
{usage:

  showmessage(GetFileInfoW(Application.ExeName, VersionInfo[x]));

  1: 'CompanyName'
  2: 'FileDescription'
  3: 'FileVersion'
  4: 'InternalName'
  5: 'LegalCopyRight'
  6: 'OriginalFileName'
  7: 'ProductName'
  8: 'ProductVersion'
  9: 'SpecialBuild'

}
var
  Info     : Pointer;
  InfoData : Pointer;
  InfoSize : LongInt;
  InfoLen  : {$IFDEF WIN32} DWORD;{$ELSE} LongInt; {$ENDIF}
  DataLen  : {$IFDEF WIN32} UInt; {$ELSE} word; {$ENDIF}
  LangPtr  : Pointer;
begin
  Result:= '';
  if Length(FName) <= 0 then
    Exit;

  DataLen:= 255;
  FName:= FName + #0;

  InfoSize:= GetFileVersionInfoSizeW(@Fname[1], InfoLen);
  if (InfoSize > 0) then
  begin
    GetMem(Info, InfoSize);
    try
      if GetFileVersionInfoW(@FName[1], InfoLen, InfoSize, Info) then
      begin
        if VerQueryValueW(Info, '\VarFileInfo\Translation', LangPtr, DataLen) then
          InfoType:= WideFormat('\StringFileInfo\%0.4x%0.4x\%s'#0, [LoWord(LongInt(LangPtr^)), HiWord(LongInt(LangPtr^)), InfoType]);
        if VerQueryValueW(Info, @InfoType[1], InfoData, Datalen) then
          Result:= PWideChar(InfoData);// strPas(InfoData);
      end;
    finally
      FreeMem(Info, InfoSize);
    end;
  end;

  //function StrPas(const Str: PChar): string;
  //begin
  //  Result := Str;
  //end;
end;

function LastDelimiterW(const Delimiters, S: WideString): Integer;
var
  P: PWideChar;
begin
  Result := Length(S);
  P := PWideChar(Delimiters);
  while Result > 0 do
  begin
    if (S[Result] <> #0) and (WideStrScan(P, S[Result]) <> nil) then // (WStrScan(P, S[Result]) <> nil) then
      Exit;
    Dec(Result);
  end;
end;

function ChangeFileExtW(const FileName, Extension: WideString): WideString;
var
  I: Integer;
begin
  I:= LastDelimiterW('.\:', Filename);
  if (I = 0) or (FileName[I] <> '.') then
     I:= MaxInt;
  Result:= Copy(FileName, 1, I - 1) + Extension;
end;

function ExtractFileExtW(const FileName: WideString): WideString;
var
  I: Integer;
begin
  I:= LastDelimiterW('.\:', FileName);
  if (I > 0) and (FileName[I] = '.') then
     Result:= Copy(FileName, I, MaxInt)
  else
     Result:= '';
end;

function ExtractFileNameW(const FileName: WideString): WideString;
var
  I: Integer;
begin
  I:= LastDelimiterW('\:', FileName);
  Result:= Copy(FileName, I + 1, MaxInt);
end;

function ExtractFilePathW(const FileName: WideString): WideString;
var
  I: Integer;
begin
  I:= LastDelimiterW('\:', FileName);
  Result:= Copy(FileName, 1, I);
end;

function FindMatchingFileW(var F: TSearchRecW): Integer;
var
  LocalFileTime: TFileTime;
begin
  with F do
  begin
    while FindData.dwFileAttributes and ExcludeAttr <> 0 do
      if not FindNextFileW(FindHandle, FindData) then
      begin
        Result:= GetLastError;
        Exit;
      end;
    FileTimeToLocalFileTime(FindData.ftLastWriteTime, LocalFileTime);
    FileTimeToDosDateTime(LocalFileTime, LongRec(Time).Hi,
      LongRec(Time).Lo);
    Size:= FindData.nFileSizeLow;
    Attr:= FindData.dwFileAttributes;
    Name:= FindData.cFileName;
    DOSName:= FindData.cAlternateFileName;
  end;
  Result:= 0;
end;

function FindFirstW(const Path: WideString; Attr: Integer; var  F: TSearchRecW): Integer;
const
  faSpecial = faHidden or faSysFile or faVolumeID or faDirectory;
begin
  F.ExcludeAttr:= not Attr and faSpecial;
  F.FindHandle:= FindFirstFileW(PWideChar(Path), F.FindData);

  if F.FindHandle <> INVALID_HANDLE_VALUE then
  begin
    Result:= FindMatchingFileW(F);
    if Result <> 0 then FindCloseW(F);
  end else
    Result:= GetLastError;
end;

function FindNextW(var F: TSearchRecW): Integer;
begin
  if FindNextFileW(F.FindHandle, F.FindData) then
    Result:= FindMatchingFileW(F) else
    Result:= GetLastError;
end;

procedure FindCloseW(var F: TSearchRecW);
begin
  if F.FindHandle <> INVALID_HANDLE_VALUE then
  begin
    Windows.FindClose(F.FindHandle);
    F.FindHandle:= INVALID_HANDLE_VALUE;
  end;
end;

function GetFileSizeW(const aFileName: WideString): Int64;
var
  SearchRecW: TSearchRecW;
  Converter: packed record
    case Boolean of
      False: (n: Int64);
      True : (Low, High: DWORD);
    end;
begin
  if FindFirstW(aFileName, faAnyFile, SearchRecW) = 0 then
     begin
       Converter.Low:= SearchRecW.FindData.nFileSizeLow;
       Converter.High:= SearchRecW.FindData.nFileSizeHigh;
       Result:= Converter.n;
     end
  else
     Result:= -1;
  FindCloseW(SearchRecW);
end;

function FileAgeW(const FileName: WideString): Integer;
var
  Handle: THandle;
  FindData: TSearchRecW;
  LocalFileTime: TFileTime;
begin
  Handle:= FindFirstW(FileName, faAnyFile, FindData);
  if Handle <> INVALID_HANDLE_VALUE then
  begin
    FindCloseW(FindData);
    if (FindData.FindData.dwFileAttributes and FILE_ATTRIBUTE_DIRECTORY) = 0 then
    begin
      FileTimeToLocalFileTime(FindData.FindData.ftLastWriteTime, LocalFileTime);
      if FileTimeToDosDateTime(LocalFileTime, LongRec(Result).Hi, LongRec(Result).Lo) then
         Exit;
    end;
  end;
  Result:= -1;
end;

procedure DeleteAllFilesW(const FolderName: WideString; RecursiveFolders: Boolean = False);
var
  Search: TSearchRecW;
begin
  // this function's purpose is to delete all files from "eldir\softwarelist\" folder (create MAME games list)
  if FindFirstW(FolderName+'*', faAnyFile, Search) = 0 then
  begin
    repeat
      // It's a directory?
      if (Search.Name <> '.') and (Search.Name <> '..') then
      begin
        if (Search.Attr and $10 = $10) and (RecursiveFolders) then
           DeleteAllFilesW(FolderName+'\'+Search.Name, RecursiveFolders)
        else
           DeleteFileW(PWideChar(FolderName+'\'+ Search.Name));
      end;
    until FindNextW(Search) <> 0;
  end;
  FindCloseW(Search);
end;

//function WStrPas(const Str: PWideChar): WideString;
//begin
//  Result := Str;
//end;

function GetShortFileNameW(const FileName: WideString): String;
var
  aTmp: array [0..MAX_PATH-1] of WideChar;
begin
  if GetShortPathNameW(PWideChar(FileName), aTmp, SizeOf(aTmp) - 1) = 0 then
     Result:= ''
  else
     Result := WideString(aTmp);
     //Result:= WStrPas(aTmp);
end;

procedure ShowMessageW(const MessageStr: WideString; TitleStr: String = '');
begin
  if TitleStr = '' then
     TitleStr:= Application.Title;
  MessageBoxW(Application.Handle, PWideChar(MessageStr), PWideChar(WideString(TitleStr)), mb_Ok);
end;

function WideLastChar(const S: WideString): PWideChar;
begin
  if S = '' then
    Result := nil
  else
    Result := @S[Length(S)];
end;

function LastCharW(const S: WideString): WideChar;
var
  P: PWideChar;
begin
  P := WideLastChar(S);
  if P = nil then
    Result := #0
  else
    Result := P^;
end;

//function Tnt_GetStringTypeExW(Locale: LCID; dwInfoType: DWORD;
//                              lpSrcStr: PWideChar; cchSrc: Integer; var lpCharType): BOOL;
//begin
//  Result := GetStringTypeExW(Locale, dwInfoType, lpSrcStr, cchSrc, lpCharType);
//end;

function _WideCharType(WC: WideChar; dwInfoType: Cardinal): Word;
begin
  //Win32Check(GetStringTypeExW(GetThreadLocale, dwInfoType, PWideChar(@WC), 1, Result);
  Win32Check(GetStringTypeExW(GetThreadLocale, dwInfoType, PWideChar(@WC), 1, Result))
end;

function IsWideCharUpper(WC: WideChar): Boolean;
begin
  Result := (_WideCharType(WC, CT_CTYPE1) and C1_UPPER) <> 0;
end;

function IsWideCharLower(WC: WideChar): Boolean;
begin
  Result := (_WideCharType(WC, CT_CTYPE1) and C1_LOWER) <> 0;
end;

function IsWideCharDigit(WC: WideChar): Boolean;
begin
  Result := (_WideCharType(WC, CT_CTYPE1) and C1_DIGIT) <> 0;
end;

function IsWideCharSpace(WC: WideChar): Boolean;
begin
  Result := (_WideCharType(WC, CT_CTYPE1) and C1_SPACE) <> 0;
end;

function IsWideCharPunct(WC: WideChar): Boolean;
begin
  Result := (_WideCharType(WC, CT_CTYPE1) and C1_PUNCT) <> 0;
end;

function IsWideCharCntrl(WC: WideChar): Boolean;
begin
  Result := (_WideCharType(WC, CT_CTYPE1) and C1_CNTRL) <> 0;
end;

function IsWideCharBlank(WC: WideChar): Boolean;
begin
  Result := (_WideCharType(WC, CT_CTYPE1) and C1_BLANK) <> 0;
end;

function IsWideCharXDigit(WC: WideChar): Boolean;
begin
  Result := (_WideCharType(WC, CT_CTYPE1) and C1_XDIGIT) <> 0;
end;

function IsWideCharAlpha(WC: WideChar): Boolean;
begin
  Result := (_WideCharType(WC, CT_CTYPE1) and C1_ALPHA) <> 0;
end;

function IsWideCharAlphaNumeric(WC: WideChar): Boolean;
begin
  Result := (_WideCharType(WC, CT_CTYPE1) and (C1_ALPHA + C1_DIGIT)) <> 0;
end;

function StringReplaceW(const S, OldPattern, NewPattern: WideString;
                        Flags: TReplaceFlags; WholeWord: Boolean = False): WideString;

  function IsWordSeparator(WC: WideChar): Boolean;
  begin
    Result := (WC = WideChar(#0))
           or IsWideCharSpace(WC)
           or IsWideCharPunct(WC);
  end;

var
  SearchStr, Patt, NewStr: WideString;
  Offset: Integer;
  PrevChar, NextChar: WideChar;
begin
  if rfIgnoreCase in Flags then
  begin
    SearchStr := WideUpperCase(S);
    Patt := WideUpperCase(OldPattern);
  end else
  begin
    SearchStr := S;
    Patt := OldPattern;
  end;
  NewStr := S;
  Result := '';
  while SearchStr <> '' do
  begin
    Offset := Pos(Patt, SearchStr);
    if Offset = 0 then
    begin
      Result := Result + NewStr;
      Break;
    end; // done

    if (WholeWord) then
    begin
      if (Offset = 1) then
        PrevChar := LastCharW(Result)
      else
        PrevChar := NewStr[Offset - 1];

      if Offset + Length(OldPattern) <= Length(NewStr) then
        NextChar := NewStr[Offset + Length(OldPattern)]
      else
        NextChar := WideChar(#0);

      if (not IsWordSeparator(PrevChar))
      or (not IsWordSeparator(NextChar)) then
      begin
        Result := Result + Copy(NewStr, 1, Offset + Length(OldPattern) - 1);
        NewStr := Copy(NewStr, Offset + Length(OldPattern), MaxInt);
        SearchStr := Copy(SearchStr, Offset + Length(Patt), MaxInt);
        Continue;
      end;
    end;

    Result := Result + Copy(NewStr, 1, Offset - 1) + NewPattern;
    NewStr := Copy(NewStr, Offset + Length(OldPattern), MaxInt);
    if not (rfReplaceAll in Flags) then
    begin
      Result := Result + NewStr;
      Break;
    end;
    SearchStr := Copy(SearchStr, Offset + Length(Patt), MaxInt);
  end;
end;

function StrDupW(var dst:PWideChar;src:PWideChar;len:integer=0):PWideChar;
begin
  if (src=nil) or (src^=#0) then
    dst:=nil
  else
  begin
    if len=0 then
      len:=lstrlenw(src);
    GetMem(dst,(len+1)*SizeOf(WideChar));
    lstrcpynw(dst,src,len+1);
  end;
  result:=dst;
end;

function CheckAppOneInstance: Boolean;
var
  Mutex: THandle;
  elIni: TMemIniFile;
  iPath: String;
begin
  Result:= False;
  iPath:= ExtractFilePath(Application.ExeName);
  if not FileExists(iPath+'EmuLoader.ini') then
     Exit;

  elIni:= TMemIniFile.Create(iPath+'EmuLoader.ini');
  Result:= Boolean(elIni.ReadInteger('Preferences', 'AllowOneInstance', 1));
  FreeAndNil(elIni);
  if not Result then
     Exit;

  Mutex:= Windows.CreateMutex(nil, True, 'EmuLoader');
  if (Mutex = 0) or (GetLastError = ERROR_ALREADY_EXISTS) then
     Application.MessageBox('   Emu Loader is already running!'+#13#10+#13#10+
                            'To run multiple instances of the frontend, make sure to uncheck setting "Allow Only One Instance" in preferences screen.'+
                            #13#10+#13#10+'Aborting...', '', mb_Ok+mb_IconExclamation)
  else
     Result:= False;
end;


end.
