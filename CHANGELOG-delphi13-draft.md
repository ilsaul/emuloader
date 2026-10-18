# Emu Loader 10.0.0 - Delphi 13 release notes (draft)

Working draft for the next release. These changes are on the `delphi13-port`
branch; see the verified and pending verification sections for the current status.
Move the verified entries into `CHANGELOG.md` when preparing the release.

## Added

- MAMu_ icons can be read from `icons.7z` (the format MAMu_ ships): when the
  archive is found in the MAMu_ icons folder it is extracted once with `7z.dll`
  to `cache\mamu_icons\` next to the executable and used as loose `.ico` files.
  It is extracted again only when the archive size or date changes. Win64
  builds need the 64-bit `7z.dll`; when it is not next to the executable, the
  one installed in `Program Files\7-Zip\` is used. The diagnostic log
  (`[7zip]`) reports where the DLL was found or why it could not be loaded.
- Read the executable's Windows Pre-release flag at startup and display
  "(Pre-release)" beside the version in the splash screen and About dialog
  only when that flag is set.

- Optional runtime diagnostic logging in Delphi 13, enabled in Preferences >
  General or with `--debug-log`. Records lifecycle, status, UI controls, list
  loading/filtering, process launches/results, message dialogs and VCL exceptions
  without replacing normal error handling. Keeps `diagnostic.log` and one rotated
  backup (5 MiB each) beside the executable; logging failures display a warning.
- Shutdown diagnostics (`[shutdown]`) report each cleanup phase in milliseconds
  (`phase_ms`) and elapsed time since the close request (`total_ms`), including
  settings, game lists, MAMu_ resources and form cleanup.
  Detailed `[shutdown-list]` timings separate selection clearing, update
  boundaries and group destruction, with an aggregate count and duration of
  game item cleanup callbacks. These detailed measurements run only during
  shutdown with diagnostic logging enabled.
  Aggregate `[shutdown-control]` counters further split EasyListview group
  destruction into preparation, item collections and group views, with nested
  timings for item flags, destructors and collection finalization.
- Added `source/EmuLoader.dproj` for opening the existing application project
  with Delphi 13, including source, component and resource search paths.
- Added the Delphi 13 design-time package `EmuLoaderComponents` so the IDE can
  load the custom controls used by the forms.
- Added Unicode-native compatibility units for the Tnt edit and rich edit
  controls used by Emu Loader, preserving the rich edit URL-click event.
- Registered EasyListview, Graphics32 (`TImage32`, `TGaugeBar`) and Bluecave
  BarMenus controls in the Delphi 13 component package.
- Temporary startup trace in Delphi 13 builds: each splash screen message
  and each step of `FormActivate` is appended to `startup_trace.log` next to
  the exe. It is used to find where startup hangs, and is to be removed once
  startup is stable.
- Temporary toolbar icon diagnostics in Delphi 13 builds: `startup_trace.log`
  records resource paths, extraction results, image list indices and counts,
  and bitmap dimensions/formats before and after icon composition during startup.
- Temporary hang watchdog in Delphi 13 Win64 builds (`uHangWatchdog.pas`).
  If the main thread stops processing messages for about 10 seconds, the
  call stacks of all threads are written to `hang_trace.log`, resolved to
  unit, procedure and line through the detailed map file that Debug builds
  now generate.

## Changed

- Trial UnicodeString storage for the 11 WideString fields of `TEasyGameInfo`
  in Delphi 13, retaining WideString in Delphi 7 and the normal shutdown path.
  On the Windows ARM64 VM (Release Win64, 184,633 items and 112,874 groups),
  the first runtime comparison reduced Groups.Clear from 37.781 s to 1.992 s,
  item destruction from 25.200 s to 0.643 s, and the instrumented shutdown
  sequence from 39.593 s to 3.828 s. A second run (Debug Win64, details view
  with a single group) took 2.516 s, with item destruction stable at 0.646 s.
  Verified afterwards: games launch, column sorting in details view and
  thumbnail view work. Titles with non-Latin characters are still unchecked.

- Set the Delphi 13 file/product version to 10.0.0.0 with the Windows
  Pre-release flag enabled for all configurations until the stable release.
  Display v10.0.0 in the application and logs without a beta suffix.

- Moved Delphi 7 VCL shadow units out of Delphi 13 search paths while retaining
  them under `vcl-d7` for the legacy project.
- Updated Mustang Peak compiler definitions, Windows shell interfaces, context
  menu callbacks, thread IDs, wide-string utilities and pixel blending routines
  for Delphi 13 Win64. The original x86 assembly remains available for Win32.
- Updated EasyListview for Delphi 13's form properties, Win64 mouse coordinates
  and typed header-column access.
- Updated the Graphics32 compiler definitions and Bluecave menu compiler
  directives for Delphi 13; added Bluecave source and include paths to the
  application project.
- Replaced the Delphi 7-only ZipForge binary dependency with a Delphi 13
  component backed by `System.Zip` for read-only ZIP enumeration and extraction.
  Removed obsolete ZipForge-specific properties from the main form definition.
  ZIP behavior still requires build and runtime verification.

## Fixed

- Make threaded thumbnail resampling (`TMyThreadRequest.MakeThumbNail`) safe
  on Win64: scanline offsets use pointer-sized integers, images smaller than
  2x2 pixels are left unscaled, and a failure is logged as `[thumbnail]` with
  file name and dimensions instead of silently stopping the thumbnail thread.
  Verified on Windows (Debug Win64): thumbnail view no longer crashes; the
  1x1 pixel `snap.zip\aleck64.png` that triggered it is logged and skipped.

- Correct the Win64 layout of the threaded thumbnail callback message
  (`TWMThreadRequest`): align WParam/LParam with `TMessage` and use a
  pointer-sized result. The old Win32 layout interpreted request ID 1 as
  the request pointer, causing an access violation in thumbnail view.
  Win32 layout is unchanged. Verified on Windows: thumbnails load in Win64.

- Show MAME History again with current `history.xml` files, which write
  extra attributes such as `<system name="frogger" game="yes" />`. Emu Loader
  only recognized the exact `<system name="frogger" />` form, so no history was
  shown (this also affected the Delphi 7 build). System and software-list
  entry tags are now reduced to their name/list attributes when the file is
  loaded. Verified at runtime with Frogger on Windows.
- Show a single Emu Loader taskbar button in Delphi 13 builds. The hidden
  application window (titled "Emu Loader: Multiple Systems Frontend") was
  shown as a second taskbar entry next to the main form; Delphi 13 builds now
  use `Application.MainFormOnTaskbar` and skip the Delphi 7 workaround that
  re-showed the application window.
- Show the Emu Loader icon on the Windows taskbar button in Delphi 13 builds.
  Explicitly load embedded `MAINICON` into `Application.Icon` before showing
  any forms and assign it to the main form's `Icon` property. This replaces
  the earlier `WM_SETICON` workaround, which left VCL's icon properties
  unchanged and did not resolve the generic taskbar icon on the test VM.
  Icon assignment is logged under `[icons]`; the revised fix still needs
  Windows runtime confirmation. The test VM still shows a generic taskbar
  icon with both VCL icon properties populated. Added `[taskbar]` diagnostics
  at the end of startup: window owners/styles, `WM_GETICON`, class icons,
  VCL icon handles and dimensions, and icons extracted from the executable.
  Extended the diagnostic build to read the process's explicit AppUserModelID
  and each window's shell AppUserModel properties (ID, relaunch icon, command,
  display name and pinning flag), reporting unset values and API errors.
  The taskbar button stayed generic while the window's own icons were valid.
  Neither an explicit AppUserModelID nor the relaunch shell properties changed
  it (both were removed again). What fixes it is sending `WM_SETICON` to the
  main window with icons extracted from the EXE with `PrivateExtractIcons`
  (48 px and 16 px), with fresh handles, shortly after startup (immediately
  and again after 2.5 s; the button updates a few seconds after the
  window appears; confirmed on the test VM). Logged under `[taskbar]` as `ApplyMainWindowIcons`.
- Show MAMu_ game icons (loose `.ico` files and `icons.zip`) in Delphi 13
  builds instead of the generic system icon. `unitExIcon` used `PChar` as a
  byte pointer, which is two bytes wide in Unicode Delphi, so icon bitmap and
  mask offsets were doubled; it now uses `PAnsiChar`. The zipped-icon loader
  never set its success result and a loose icon could be read as zipped
  because `SearchZip` was not initialized; both only worked by accident in
  Delphi 7. ZIP entries are now looked up through a name index instead of a
  full archive scan per icon. Icon folder, `icons.zip` and load failures are
  logged under `icons` in `diagnostic.log`. Windows build and runtime
  verification are still required.
- Decode HTML entities in game documents without keeping character pointers
  across string changes, which could crash or corrupt text when a line had
  several entities. Bound history parsing to the end of the file, handle
  `<text>...</text>` on a single line, and always end the rich-edit update
  even if loading a document fails. Game documents loading is logged under
  `gamedocs` in `diagnostic.log`.

- Separate radio glyphs, status icons and captions in the Driver Status Filter,
  measuring the actual glyph and text widths in standard and 4K layouts.

- Support MAME 0.278 and newer decimal `audio_latency` values, including
  MAME 0.283's `0.0` default, when opening, editing and saving settings.
  Allow the full 0–50 audio-frame range without rounding (1 frame = 20 ms;
  0 selects the sound module default), validate decimal-point input before
  saving, and reset to `0.0`. Retain the legacy integer-level selector and
  default 2 for older MAME versions. Windows compilation and runtime/normal
  and 4K layout verification are still required.

- Handle an empty MAME language option without indexing an empty string when
  opening settings; retain the default language and safely strip quoted values.

- Initialize and safely release controller-path lists when opening MAME
  settings, preventing an invalid Free during ctrlrpath parsing. Handle empty
  paths and collect controller definitions from every configured folder.

- Choose main-toolbar label contrast from several text-free samples of the
  rendered label background, including native hover/pressed/checked fills and
  custom gradients. Keep enabled labels equally contrasted even when Windows
  reports an indeterminate state; mute labels only for disabled commands.
- Align checkbox/radio subtitle labels to the same measured caption inset in
  Delphi 13, after custom icons and normal/4K layouts have been applied.
  Recognize the existing subtitle naming conventions across Preferences,
  Night Mode, filters, system selection/export and MAME settings; preserve
  inline tips in emulator setup. Expand clipped single-line captions only into
  free space within their parent/column, and widen the 4K Preferences status
  column without overlapping the neighboring options. Preserve explicit
  CaptionIndent minimums and Delphi 7 layout. Windows build and visual
  normal/4K verification remain required.

- Reserve the actual custom/themed glyph width before checkbox and radio-button
  captions in Delphi 13, honoring CaptionIndent and custom icon height. Prevent
  HD selection symbols from covering text in Preferences and emulator setup.
  Preserve the legacy Delphi 7 caption spacing.

- Restore native main-toolbar hover painting in Delphi 13 by disabling its
  double buffering. Draw the original short labels at runtime after native
  button painting, independently of icon pixels, including changing view/filter
  labels and the crossed-out non-working label. Fit text to native DPI-scaled
  image dimensions and choose contrasting normal/hot/pressed/disabled colors from
  the painted background. Generate synchronized text-free normal/hot and grayscale disabled
  images, preserving alpha (or legacy icon masks) and button dimensions.
  Reserve a readable label band by proportionally fitting the artwork above it;
  the original small toolbar remains icon-only. Toolbar customization captions,
  menus, the editor's icon previews, source ICOs and Delphi 7 drawing are unchanged.
  Windows compilation and visual/DPI verification are still required.

- Fix the Delphi 13 main-toolbar missing-icon fallback when the supplied folder
  is already `arcade_filters`, and reset an empty arcade filter to the default
  icon instead of retaining the previous one. Accept the bundled alternate
  filename for the missing-games/missing-ROMs filter icon.

- Keep the EasyListview incremental-search callback allocated until its manager
  is destroyed on Win64. Expiring or resetting the timer no longer frees the
  thunk while its return instructions are still executing, preventing a DEP
  execution violation after the search timeout. The legacy Win32 path is unchanged.

- Supply explicit grayscale toolbar images for disabled buttons in Delphi 13,
  preserving icon transparency instead of relying on automatic disabled drawing.
  Keep these images synchronized when toolbar icons, sizes or themes change;
  commands remain disabled according to the existing application rules.

- Corrected malformed output paths in the Delphi 13 project file.
- Added missing Delphi project IDE metadata (`BorlandProject`) required to
  reopen and save the project in Delphi 13.
- Resolved a modern Delphi `TPoint.Offset` name conflict in `ButtonsEx`.
- Preserved the full Win64 component pointer in `TSpeedButtonEx` group
  notifications to avoid an access violation while loading forms in the IDE.
- Use Delphi's built-in memory manager instead of the Win32-only FastMM4
  override when compiling with modern Delphi; retain it for Delphi 7.
- Excluded Delphi 7-only madExcept units from modern builds; Delphi 13 uses
  VCL's standard exception handling until a compatible reporter is available.
- Updated the WebBrowser navigation event signature for modern Delphi while
  retaining the form's event binding.
- Replaced the Win32-only GraphicEx library in Delphi 13 builds with a
  compatibility unit that decodes PNG and GIF images through the VCL imaging
  units, enabling Win64 builds. Delphi 7 continues to use GraphicEx.
- Made `uCommon` compile for Win64: Windows-only helpers now use `MSWINDOWS`
  instead of `WIN32`, the Delphi 7 IA-32 assembly string/memory routines are
  used only by Delphi 7 (modern builds use the Unicode RTL), and Windows API
  calls use `PChar` and character-count buffer sizes. The same `PChar`
  correction applies to the icon copy in the MAMu icons manager.
- Replaced the IA-32 assembly `Max3`/`Min3` helpers in `uColorUtils` with
  Pascal versions for modern builds.
- Use `FormatSettings` for the decimal and thousand separators in modern
  Delphi (the global separator variables were removed); Delphi 7 is unchanged.
  The commented-out legacy writer in `uSEGAModel2EmulatorSettings` is left
  untouched, because a directive inside a `{ }` comment closes the comment.
- Added `SysUtils` to the image category and layout selectors, which relied
  on the Delphi 7-only `UpperCase` helper in `uCommon`.
- `uMain` fixes for Delphi 13:
  - `IDCOLORCMB` and `GetColorPrettyName` are now defined locally. The
    Delphi 7 build got them from the patched VCL copies in `source\vcl-d7`.
  - Removed ambiguous `Pos` calls that mixed `WideString` and `string`.
  - The console-capture buffer is now `AnsiChar`, as `OemToAnsi` expects.
  - `SendMessage` string arguments are passed as pointer-sized `LPARAM`.
- EasyListview columns now stream their alignment, sort direction and style
  as one byte each, the layout used by Delphi 7. This is intended to fix
  "Stream read error" on `GamesListView.Header.Columns.Items` when loading the
  main form in Delphi 13, and keeps DFMs saved by the new IDE readable by
  Delphi 7.
- Restored the `CustomIconsImages`, `CustomIconsImagesHD` and
  `CaptionVertIndent` properties on the `TAdvGroupBoxEx` check box, so forms
  such as the SEGA Model 2 settings load without "Property does not exist"
  errors.
- Registered the `TGaugeBar2` control (`uGR32Extra`) in the Delphi 13
  component package so the MAME settings forms can be loaded in the IDE.
- Added the XiControls folder to the Delphi 13 project search path.
- Added Win64 as a target platform in the Delphi 13 project file.
- Adjusted the component-package source so the Delphi 13 IDE can recognize
  controls referenced by `FormMain` without discarding them from the DFM.

- Delphi 13 builds now include the version information and application
  icon, so the splash screen shows the version number again.
- When a Delphi 13 build fails during startup, EmuLoader now shows the error
  and exits. Previously the always-on-top splash screen hid the error
  message and the application appeared to hang.

- Fixed EasyListview writing the column version field with `SizeOf` of an
  unrelated identifier. On Win64 this wrote 4 extra bytes per column, so forms
  saved by the Delphi 13 IDE could no longer be loaded ("Stream read error").
- When a debugger is attached, the splash screen is no longer always on top,
  so a stopped process no longer covers the IDE.

- Icons now load in Delphi 13 builds. `PrivateExtractIcons` was bound to the
  ANSI export while receiving Unicode file names, so every icon failed to load
  and startup stopped with "Unable to Replace Image".

- Startup no longer shows an access violation after "Reading image categories
  settings". Some local object variables were checked with `Assigned` or freed
  without first being set to `nil`. Delphi 7 happened to tolerate this, but on
  Win64 they held garbage. The most visible case was `ExcludedList` in
  `LoadMachinesListToSidePanel`: the crash left the machines panel blank and
  the games list empty. The same fix is applied to the most-recently-played
  list, the device/BIOS checksum scan, menu item drawing, random game selection
  and `SelectFileName`.

- Startup no longer fails with "Access violation ... Execution of address 0"
  while "Adding games to games list". About 280 local object variables across
  the project were tested with `Assigned`, `FreeAndNil` or `<> nil` before any
  assignment; they are now set to `nil` first (a valid change for Delphi 7
  too). In `AddGames`, `addGroup` moved from the nested `AddGameListView` to
  the outer procedure: clones relied on the value left over from the previous
  call (their parent's group), which only worked by accident.
- The splash screen clock no longer updates the VCL label from the multimedia
  timer thread. In Delphi 13 builds the callback posts a message and the label
  is updated in the main thread. The timer is also stopped before the splash
  form is freed on exit, which could hang or crash the application on close.
- Fixed the application hanging on the splash screen in 64 bit builds while
  "Applying filters". The Mustangpeak `CreateStub` helper, which turns an
  object method into a plain Windows callback (thread manager window and
  worker thread, list view timers, shell context menu), generated 32 bit x86
  code. It now generates a Win64 thunk with unwind information; the 32 bit
  version is unchanged.

## Verified on Windows (Delphi 13 Win64)

- Application builds and starts on the Windows test VM.
- Launching a game works, as reported by the tester.
- MAME History displays correctly with current `history.xml` files (Frogger).
- MAMu_ game icons load from `icons.7z` with a compatible x64 `7z.dll`.
  Reusing the extraction cache after restarting remains to be checked.
- Only one application window appears in the taskbar previews, and the taskbar
  button shows the Emu Loader icon (also in the Release build).
- Release build (Win64) on the test VM: game list loads, filters work, MAME
  History and snapshot images display, games launch and focus returns to
  Emu Loader when a game exits. Software-list games and parent/clone icon
  selection also work.

## Pending verification

- Restart the frontend and check that preferences and paths are retained,
  and that the MAMu_ extraction cache is reused without extracting again.
- Verify game-list creation/update, ROM auditing, search, filters and favorites.
- Verify ZIP enumeration, CRC values, filenames and extraction (including
  archives containing directories) after the `System.Zip` migration.
- Verify PNG (including transparency) and GIF loading for previews,
  thumbnails and list backgrounds after the GraphicEx replacement.
- Exercise the converted controls and forms at runtime on the intended
  Windows platforms before publishing these release notes.
- The Delphi 7 build used patched VCL units (`source\vcl-d7`: ComCtrls,
  StdCtrls, ExtCtrls and others) with small behaviour fixes; Delphi 13 uses
  the stock VCL. Check progress bars, track bars, rich edit links and combo
  box item heights.
