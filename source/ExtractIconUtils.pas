unit ExtractIconUtils;

interface

uses Graphics, Forms, Windows, ExtCtrls;

//----------------------------------------------------------------------------
// ExtractIcons
// Call "private" MS Api to extract Icon file. This calls a publically
// documented function marked as deprecated in the MSDN documentation.
// It was no doubt Not Originally Intended to be documented, or publically
// accessed, but it provides functionality that its hard to live without.
// It exists on Windows 2000, XP, Vista, and Windows7, but might not exist
// in some future Windows version (released after year 2011).
//
// uses global   hUserDll    : THandle;
//----------------------------------------------------------------------------
function ExtractIcons(exeFilename, icoOutFileName: String; icoSize, icoHeight: Integer; ImageOut: TImage): Boolean;



var
  hUserDll    : THandle;





implementation



function ExtractIcons(exeFilename, icoOutFileName: String; icoSize, icoHeight: Integer; ImageOut: TImage): Boolean;
const
//{$ifdef UNICODE}
// ExtractProcName = 'PrivateExtractIconsW';
//{$else}
 ExtractProcName = 'PrivateExtractIconsA';
//{$endif}
type
  TExtractFunc = function(lpszFile: PChar; nIconIndex, cxIcon, cyIcon: integer; phicon: PHANDLE; piconid: PDWORD; nicon, flags: DWORD): DWORD; stdcall;
var
  handleIcon : THandle;
  nIconId    : DWORD;
  Icon       : TIcon;
  PrivateExtractIcons: TExtractFunc;
  iHeight: Integer;
begin
  Result := False;
  if hUserDll < 4 then
     begin
       hUserDll := LoadLibrary('user32.dll');
       if hUserDll < 4 then
          Exit;
     end;

     { PrivateExtractIcons:
        MSDN documentation says that this function could go away in a future windows
        version, so we must try to load it, and if it fails, return false, rather than
        doing a static DLL import.
     }
    PrivateExtractIcons :=     GetProcAddress(hUserDll, ExtractProcName);

    if not Assigned(PrivateExtractIcons) then exit;

    if icoHeight = -1 then
       iHeight:= icoSize
    else
       iHeight:= icoHeight;
    //extract a icoSize x icoSize  icon where icoSize is one of 256,128,64,48,32,16
    if PrivateExtractIcons ( PChar(exeFilename),
                            0, icoSize, iHeight{icoSize}, @handleIcon, @nIconId, 1, LR_LOADFROMFILE) <> 0 then
    try
      Icon:=TIcon.Create;
      try
        Icon.Handle:= handleIcon;
        //Icon.Handle:=hIcon;

           //ImageOut.Picture.Icon.Handle:= Icon;
           ImageOut.Picture.Icon.Assign(Icon);
        //Icon.SaveToFile(icoOutFileName);
        Result := True;
      finally
        //DestroyIcon(Icon);
        Icon.Free;
      end;
    finally
      DestroyIcon (handleIcon);
    end;
end ;


initialization
  // none

finalization
   if (hUserDll>4) then
      FreeLibrary(hUserDll);

end.