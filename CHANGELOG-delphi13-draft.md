# Emu Loader - Delphi 13 release notes (draft)

Working draft for the next release. These changes are on the `delphi13-port`
branch; the application build and runtime behavior have not yet been confirmed.
Move the verified entries into `CHANGELOG.md` when preparing the release.

## Added

- Added `source/EmuLoader.dproj` for opening the existing application project
  with Delphi 13, including source, component and resource search paths.
- Added the Delphi 13 design-time package `EmuLoaderComponents` so the IDE can
  load the custom controls used by the forms.
- Added Unicode-native compatibility units for the Tnt edit and rich edit
  controls used by Emu Loader, preserving the rich edit URL-click event.
- Registered EasyListview, Graphics32 (`TImage32`, `TGaugeBar`) and Bluecave
  BarMenus controls in the Delphi 13 component package.

## Changed

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

## Pending verification

- Build the application in the Delphi 13 IDE and resolve any remaining
  compiler errors.
- Verify ZIP enumeration, CRC values, filenames and extraction (including
  archives containing directories) after the `System.Zip` migration.
- Verify PNG (including transparency) and GIF loading for previews,
  thumbnails and list backgrounds after the GraphicEx replacement.
- Exercise the converted controls and forms at runtime on the intended
  Windows platforms before publishing these release notes.
