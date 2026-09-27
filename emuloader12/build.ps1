$ErrorActionPreference = 'Stop'

$scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$projectPath = Join-Path $scriptDir 'source\EmuLoader.dproj'
$logPath = Join-Path $scriptDir 'build.log'

if (-not (Test-Path $projectPath)) {
    throw "Missing project file: $projectPath"
}

$roots = @(
    ${env:ProgramFiles(x86)},
    ${env:ProgramFiles},
    ${env:ProgramW6432},
    ${env:LOCALAPPDATA}
) | Where-Object { $_ }

$rsvarsCandidates = foreach ($root in $roots) {
    if (-not $root) { continue }
    $studioRoot = Join-Path $root 'Embarcadero\Studio'
    if (Test-Path $studioRoot) {
        Get-ChildItem -Path $studioRoot -Directory -ErrorAction SilentlyContinue |
            ForEach-Object {
                $candidate = Join-Path $_.FullName 'bin\rsvars.bat'
                if (Test-Path $candidate) { $candidate }
            }
    }
}

$rsvarsPath = $rsvarsCandidates |
    Sort-Object {
        $ver = Split-Path (Split-Path (Split-Path $_ -Parent) -Parent) -Leaf
        if ($ver -match '^(\d+)\.(\d+)$') { [version]($matches[1] + '.' + $matches[2]) } else { [version]'0.0' }
    } -Descending |
    Select-Object -First 1

if (-not $rsvarsPath) {
    throw 'No Delphi 12/13 build environment found. Install Delphi 12 or Delphi 13 and retry.'
}

"[info] Using Delphi environment: $rsvarsPath" | Tee-Object -FilePath $logPath
& cmd.exe /c "`"$rsvarsPath`" && msbuild `"$projectPath`" /t:Build /p:Config=Debug /p:Platform=Win32 /v:minimal 2>&1 | Tee-Object -FilePath $logPath -Append"
exit $LASTEXITCODE
