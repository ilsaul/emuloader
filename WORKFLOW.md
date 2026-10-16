# Workflow: Copilot / developer split

## Environment
- Copilot works on the Mac checkout (`/Users/moreno/develop/git/other/Emuloader`).
- Delphi 13 (Win64) builds and runtime tests happen only on the Windows VM.
- The VM is reachable via SSH: `ssh -i ~/.ssh/emuloader_vm moreno@10.211.55.16` (Windows, cmd shell).

## Copilot can
- Read, search and edit source files (`source/`, `lib/`, changelogs, docs).
- Run git locally: diff, status, log, commit (with the `Co-authored-by` trailer).
- Prepare diagnostic builds, add `DiagnosticLog` traces and update `CHANGELOG-delphi13-draft.md`.
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

## Open issue: generic taskbar icon (Delphi 13)
- Window icons are valid (`WM_GETICON`, Alt+Tab correct); only the taskbar button is generic.
- Renaming the EXE did not help; shell AppUserModel properties are all unset.
- Current attempt: explicit AppUserModelID (`EmuLoader.Frontend`) set before any window is created.
- Next ideas if it fails: icon cache / pinned shortcut check on the VM, test a minimal VCL app on the same VM.

## VM rules (standing permissions from the developer)
- SSH to the VM is allowed: `ssh -i ~/.ssh/emuloader_vm moreno@10.211.55.16` (repo in `C:\Develop\Emuloader`, branch `delphi13-port`, output in `C:\Games\EmuLoader13`).
- No development happens on the VM: local modifications to tracked files can be discarded before every pull (`git restore .`, then `git merge --ff-only origin/delphi13-port`).
- Do not run `git clean`: untracked files (e.g. `build_d13.cmd`) are left alone.
- Delphi compiles only from the IDE (command-line compiling is not supported by the VM license): the developer builds and launches.
