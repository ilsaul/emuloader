# Workflow: Copilot / developer split

## Environment
- Copilot works on the Mac checkout (`/Users/moreno/develop/git/other/Emuloader`).
- Delphi 13 (Win64) builds and runtime tests happen only on the Windows VM.
- The VM is reachable via SSH: `ssh -i ~/.ssh/emuloader_vm moreno@10.211.55.16` (Windows, cmd shell).

## Branching: git flow
- The developer uses git flow (config in `.git/config`; there is no `git-flow` CLI on the Mac, so Copilot runs the equivalent git commands).
- `master`: released versions only; each release is a `--no-ff` merge plus a tag `vX.Y.Z` (no prefix).
- `develop`: integration branch; feature branches (e.g. the former `delphi13-port`) are merged or fast-forwarded into it.
- `release/vX.Y.Z`: branched from `develop` (also set `gitflow.branch.release/vX.Y.Z.base develop`). Only release preparation goes here: `VerInfo_PreRelease` set to `false` in `source/EmuLoader.dproj`, final changelog, release fixes. The release package is built from this branch.
- Release checklist (on `release/vX.Y.Z`):
  1. `CHANGELOG.md`: user-facing entry for the version; set its date (replacing `Unreleased`) in the last commit before finishing.
  2. Regenerate the packaged changelog with `python3 tools/changelog_to_htm.py` (updates `dist_template/docs/changelog.htm` from `CHANGELOG.md`; run it again after every `CHANGELOG.md` change, including the date) and commit both files.
  3. `dist_template/7z.dll` must be the x64 7-Zip DLL (update `dist_template/docs/7-Zip-License.txt` with it).
  4. Build Release Win64 and check the exe is not flagged pre-release.
- Finishing a release: merge `release/vX.Y.Z` into `master` (`--no-ff`), tag `vX.Y.Z`, merge the tag back into `develop`, delete the release branch. Then set `VerInfo_PreRelease` back to `true` on `develop` for the next cycle.
- `hotfix/vX.Y.Z`: branched from `master`, finished like a release.
- The VM follows the branch currently under test (`release/vX.Y.Z` during a release).

## Copilot can
- Read, search and edit source files (`source/`, `lib/`, changelogs, docs).
- Run git locally: diff, status, log, commit (with the `Co-authored-by` trailer).
- Prepare diagnostic builds, add `DiagnosticLog` traces and update `CHANGELOG.md` (user-facing summary) and `docs/delphi13-port-notes.md` (technical notes).
- Over SSH on the VM (when asked): pull, build, read `diagnostic.log`, inspect files.
- Analyse logs and compiler errors and propose fixes.

## Copilot cannot
- Compile Delphi code locally (no toolchain on the Mac); builds go through the VM over SSH.
- See the VM desktop (taskbar, Alt+Tab): visual checks stay with the developer.
- Push to the remote without an explicit request.
- See previous chats: context comes from `git log` and the changelog.

## Developer does
1. Approve `git push` (Copilot only pushes when asked).
2. Run the app on the VM desktop and check the visible behaviour (taskbar icon).
3. Say whether the symptom changed, so the next step can be chosen.

## Typical loop
1. Copilot edits and commits on the Mac (never compiled locally).
2. Developer runs `git push` and says so.
3. Copilot over SSH: `git restore .`, `git fetch`, `git merge --ff-only origin/<branch under test>`.
4. Developer closes EmuLoader, builds from the IDE (Debug, Win64) and launches it; compiler errors are pasted to Copilot.
   Copilot must always say which build is needed: the application (`source/EmuLoader.dproj`) or the component package (`lib/delphi13/EmuLoaderComponents.dproj`, the palette components). Rule of thumb: changes under `lib/` need the package build first, then the application; changes only under `source/` need just the application.
5. Copilot reads `C:\Games\EmuLoader13\diagnostic.log` over SSH; developer reports what is visible on the VM desktop.

## Runtime tests from outside the process (over SSH)
- The SSH session is not the desktop session: to act on the running app, copy a PowerShell script to the VM and run it with a scheduled task in the interactive session: `schtasks /create /tn X /tr "powershell -NoProfile -ExecutionPolicy Bypass -File ..." /sc once /st 00:00 /it /ru moreno /f` then `schtasks /run /tn X`.
- Find windows by process id (`EnumWindows`), not `FindWindow`. Icons created by the script die when it exits, so they cannot be used for a lasting test.
- Always delete the task and the scripts afterwards.

## Local tooling
- Mac needs the Xcode license accepted (`sudo xcodebuild -license accept`) for `python3` and `sed`.
- Source files may have CRLF line endings and a BOM: preserve them when scripting edits (prefer the edit tool).

## Open issue: generic taskbar icon (Delphi 13)
- Symptom: the taskbar button shows a generic icon; the icon of the window inside the group is correct.
- Excluded: EXE icon resources (identical to the working Delphi 7 build), manifest, EXE name and folder, Win32 vs Win64, VM icon cache, launching from the IDE.
- Findings: VCL-assigned icons are valid in `WM_GETICON` but the taskbar button stays generic. `MainFormOnTaskbar=False` showed the right icon on the hidden application window but gave two entries in the preview.
- Fix found: `WM_SETICON` on the main window with icons from `PrivateExtractIcons` (48 px and 16 px, fresh handles each time) fixes the button a few seconds after startup; `LoadImage` icons or a single early send did not.
- Implemented in `ApplyMainWindowIcons` (`uDiagnosticLog.pas`): sends at once and again after 2.5 s (the 6.5 s and 14.5 s resends proved unnecessary). Explicit AppUserModelID and relaunch properties were tried and removed.
- Confirmed on the VM with the final build: the button becomes correct a few seconds after startup. Issue resolved.

## VM rules (standing permissions from the developer)
- SSH to the VM is allowed: `ssh -i ~/.ssh/emuloader_vm moreno@10.211.55.16` (repo in `C:\Develop\Emuloader`, branch under test, see git flow above, output in `C:\Games\EmuLoader13`).
- No development happens on the VM: local modifications to tracked files can be discarded before every pull (`git restore .`, then `git merge --ff-only origin/<branch under test>`).
- Do not run `git clean`: untracked files (e.g. `build_d13.cmd`) are left alone.
- Delphi compiles only from the IDE (command-line compiling is not supported by the VM license): the developer builds and launches.
