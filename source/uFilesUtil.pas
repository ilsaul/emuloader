unit uFilesUtil;

{$I-,R-}

interface

uses Windows, RTLConsts, Messages, SysUtils, Classes, Consts, Controls;

function GetFileSize(const FileName: String): Longint;

function GetWinTempDir: String;
function GetWindowsDir: String;
function GetSystemDir: String;

{$IFDEF WIN32}
function ShortToLongFileName(const ShortName: String): String;
function ShortToLongPath(const ShortName: string): String;
function LongToShortFileName(const LongName: String): String;
function LongToShortPath(const LongName: String): String;
{$ENDIF WIN32}

implementation

uses {$IFDEF WIN32} {ComObj,} {ShlObj,} {$ELSE} {Ole2},
  {OleAuto,} {$ENDIF} ShellAPI, FileCtrl{, Forms};

function GetFileSize(const FileName: String): Longint;
var
  SearchRec: TSearchRec;
begin
  if FindFirst(ExpandFileName(FileName), faAnyFile, SearchRec) = 0 then
     Result:= SearchRec.Size
  else
     Result:= -1;
  FindClose(SearchRec);
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

function LongToShortPath(const LongName: String): String;
var
  LastSlash: PChar;
  TempPathPtr: PChar;
begin
  Result:= '';
  TempPathPtr:= PChar(LongName);
  LastSlash:= StrRScan(TempPathPtr, '\');
  while LastSlash <> nil do
  begin
    Result:= '\' + LongToShortFileName(TempPathPtr) + Result;
    if LastSlash <> nil then
       begin
         LastSlash^:= Char(0);
         LastSlash:= StrRScan(TempPathPtr, '\');
       end;
  end;
  Result:= TempPathPtr + Result;
end;
{$ENDIF WIN32}

end.
