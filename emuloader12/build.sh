#!/usr/bin/env bash
set -uo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$SCRIPT_DIR"

if command -v wine >/dev/null 2>&1; then
  echo "[info] wine detected; invoking the Windows batch build inside Wine"
  wine cmd /c build.bat
  exit $?
fi

echo "[warn] Wine is not available. This project must be built from a Windows Delphi 12 environment or a Windows-based container."
echo "[warn] On the VM host, run: build.bat"
exit 1
