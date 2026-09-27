$ErrorActionPreference = 'Stop'

$scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$buildScript = Join-Path $scriptDir 'build.ps1'

if (-not (Test-Path $buildScript)) {
    throw "Missing automation script: $buildScript"
}

$logFile = Join-Path $scriptDir 'build.log'
"[info] Starting automated EmuLoader build at $(Get-Date -Format o)" | Tee-Object -FilePath $logFile

& $buildScript 2>&1 | Tee-Object -FilePath $logFile -Append
$exitCode = $LASTEXITCODE

if ($exitCode -ne 0) {
    "[error] Automated build failed with exit code $exitCode" | Tee-Object -FilePath $logFile -Append
    exit $exitCode
}

"[info] Automated build completed successfully at $(Get-Date -Format o)" | Tee-Object -FilePath $logFile -Append
exit 0
