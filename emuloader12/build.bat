@echo off
setlocal EnableExtensions

set "SCRIPT_DIR=%~dp0"
set "PROJECT=%SCRIPT_DIR%source\EmuLoader.dproj"

if not exist "%PROJECT%" (
  echo [error] Missing project file: %PROJECT%
  exit /b 1
)

set "FOUND_RSVARS="

for %%D in (
  "%ProgramFiles(x86)%\Embarcadero\Studio\*"
  "%ProgramFiles%\Embarcadero\Studio\*"
) do (
  if exist "%%~D\bin\rsvars.bat" (
    if not defined FOUND_RSVARS set "FOUND_RSVARS=%%~D\bin\rsvars.bat"
  )
)

if not defined FOUND_RSVARS (
  echo [error] No Delphi 12/13 build environment found.
  echo [error] Install Delphi 12 or Delphi 13 Community/Professional, then rerun this script.
  exit /b 1
)

call "%FOUND_RSVARS%"

where msbuild >nul 2>&1
if errorlevel 1 (
  echo [error] MSBuild was not found in the Delphi environment.
  exit /b 1
)

echo [info] Building EmuLoader with the newest Delphi toolchain found: %FOUND_RSVARS%
msbuild "%PROJECT%" /t:Build /p:Config=Debug /p:Platform=Win32 /v:minimal
exit /b %errorlevel%
